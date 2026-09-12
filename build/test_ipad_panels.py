"""Compile behavior tests against the exact workspace policy shipped in the overlay."""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile
import unittest


class IPadWorkspacePanelsTests(unittest.TestCase):
    def test_workspace_placement_locking_resize_and_overflow(self):
        candidates = [shutil.which('clang++'), shutil.which('g++')]
        if os.name == 'nt':
            candidates += [r'C:\Program Files\LLVM\bin\clang++.exe',
                           r'C:\Program Files\Microsoft Visual Studio\2022\Preview\VC\Tools\Llvm\x64\bin\clang++.exe',
                           r'C:\Program Files\Microsoft Visual Studio\18\Insiders\VC\Tools\Llvm\x64\bin\clang++.exe']
        compiler = next((str(p) for p in candidates if p and Path(p).is_file()), None)
        if not compiler:
            self.skipTest('C++17 compiler unavailable; workspace behavior tests were not run')
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        path = 'source/blender/editors/screen/ipad_workspace_panels.hh'
        marker = f'diff --git a/{path} b/{path}\n'
        self.assertIn(marker, patch)
        section = patch.split(marker, 1)[1].split('diff --git ', 1)[0]
        self.assertIn('--- /dev/null\n', section)
        header = ''.join(line[1:] for line in section.splitlines(True)
                         if line.startswith('+') and not line.startswith('+++'))
        with tempfile.TemporaryDirectory(prefix='ipad-workspace-test-') as directory:
            work = Path(directory)
            (work / 'ipad_workspace_panels.hh').write_text(header, encoding='utf-8')
            test = work / 'test.cc'
            shutil.copyfile(repo / 'build/tests/ipad_workspace_panels_test.cc', test)
            binary = work / ('tests.exe' if os.name == 'nt' else 'tests')
            subprocess.run([compiler, '-std=c++17', '-Wall', '-Wextra', '-Werror', '-pedantic',
                            str(test), '-o', str(binary)], cwd=work, check=True)
            subprocess.run([str(binary)], cwd=work, check=True)


if __name__ == '__main__':
    unittest.main()
