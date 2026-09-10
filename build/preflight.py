#!/usr/bin/env python3
"""Cheap overlay checks for Windows and CI; never builds or changes Blender source."""

from __future__ import annotations

import argparse
import ast
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path, PurePosixPath
import plistlib
import re
import shutil
import subprocess
import sys
import tempfile
import time
from urllib.error import HTTPError, URLError
from urllib.request import urlopen


def patch_files(patch: str) -> list[tuple[str, bool]]:
    """Return safe destination paths and whether each needs upstream contents."""
    result = []
    seen = set()
    for block in patch.split('diff --git ')[1:]:
        header, _, body = block.partition('\n')
        match = re.fullmatch(r'a/(\S+) b/(\S+)', header)
        if not match or match[1] != match[2]:
            raise ValueError(f'Unsupported patch header: {header}')
        path = match[2]
        parts = PurePosixPath(path).parts
        if (not parts or path.startswith('/') or '\\' in path or ':' in path or
                any(p in ('.', '..', '.git') for p in path.split('/')) or
                '' in path.split('/') or path in seen):
            raise ValueError(f'Unsafe or duplicate patch path: {path}')
        if 'GIT binary patch' in body or '\n+++ /dev/null\n' in body:
            raise ValueError(f'Binary/deletion patch needs an explicit preflight implementation: {path}')
        seen.add(path)
        result.append((path, '\n--- /dev/null\n' not in '\n' + body))
    if not result:
        raise ValueError('No source changes found in patch')
    return result


def pinned_commit(repo: Path) -> str:
    workflow = (repo / '.github/workflows/build-ipa.yml').read_text(encoding='utf-8')
    match = re.search(r'^  BLENDER_COMMIT: ([0-9a-f]{40})\s*$', workflow, re.MULTILINE)
    if not match:
        raise ValueError('Expected one pinned BLENDER_COMMIT in the IPA workflow')
    return match[1]


def get_source(commit: str, path: str, cache: Path, offline: bool) -> bytes:
    destination = cache / commit / path
    if destination.is_file():
        return destination.read_bytes()
    if offline:
        raise ValueError(f'Uncached upstream file: {path}; run once without --offline')
    url = f'https://raw.githubusercontent.com/blender/blender/{commit}/{path}'
    for attempt in range(3):
        try:
            with urlopen(url, timeout=45) as response:
                data = response.read()
            break
        except HTTPError as error:
            if error.code < 500 or attempt == 2:
                raise
            time.sleep(attempt + 1)
        except (URLError, TimeoutError):
            if attempt == 2:
                raise
            time.sleep(attempt + 1)
    destination.parent.mkdir(parents=True, exist_ok=True)
    # Replace atomically; interrupted downloads must not become valid cache hits.
    with tempfile.NamedTemporaryFile(dir=destination.parent, delete=False) as stream:
        temporary = Path(stream.name)
        stream.write(data)
    try:
        temporary.replace(destination)
    finally:
        temporary.unlink(missing_ok=True)
    return data


def check_patch(patch: str, files: list[tuple[str, bool]], source_loader) -> None:
    with tempfile.TemporaryDirectory(prefix='blender-ipad-preflight-') as directory:
        work = Path(directory)
        existing = [path for path, needs_source in files if needs_source]
        with ThreadPoolExecutor(max_workers=4) as pool:
            for path, data in zip(existing, pool.map(source_loader, existing)):
                destination = work / path
                destination.parent.mkdir(parents=True, exist_ok=True)
                destination.write_bytes(data)
        encoded = patch.encode('utf-8')
        for flags in (['--check'], []):
            subprocess.run(['git', 'apply', '--whitespace=error-all', *flags, '-'],
                           input=encoded, cwd=work, check=True)
        for path, _ in files:
            target = work / path
            if target.suffix == '.plist':
                plistlib.loads(target.read_bytes())
            elif target.suffix == '.py':
                ast.parse(target.read_text(encoding='utf-8'), filename=path)


def find_bash() -> str | None:
    if executable := shutil.which('bash'):
        return executable
    if sys.platform == 'win32' and (git := shutil.which('git')):
        # Git for Windows includes Bash even when it is absent from PATH.
        candidate = Path(git).parent.parent / 'bin/bash.exe'
        if candidate.is_file():
            return str(candidate)
    return None


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--repo', type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument('--cache-dir', type=Path)
    parser.add_argument('--offline', action='store_true')
    args = parser.parse_args()
    repo = args.repo.resolve()
    cache = (args.cache_dir or repo / '.cache/preflight').resolve()
    commit = pinned_commit(repo)
    patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
    files = patch_files(patch)
    plistlib.loads((repo / 'ios/Info.plist').read_bytes())
    for script in (repo / 'build').glob('*.py'):
        ast.parse(script.read_text(encoding='utf-8'), filename=str(script))
    bash = find_bash()
    if bash:
        for script in (repo / 'build').glob('*.sh'):
            # Normalize checkout CRLF in memory, just as macOS Git does at checkout.
            subprocess.run([bash, '-n'], input=script.read_text(encoding='utf-8').encode(), check=True)
    else:
        print('NOTE: Bash unavailable; shell syntax was not checked.')
    check_patch(patch, files, lambda path: get_source(commit, path, cache, args.offline))
    print(f'PASS: patch applies to {len(files)} pinned source files; plist and script syntax valid.')
    print('This is source preflight, not an iOS compile or device test.')
    return 0


if __name__ == '__main__':
    try:
        raise SystemExit(main())
    except (OSError, ValueError, subprocess.CalledProcessError) as error:
        print(f'Preflight failed: {error}', file=sys.stderr)
        raise SystemExit(1)
