"""Select a complete device app, never an intermediate Blender.app directory."""
import plistlib
import struct
import sys
from pathlib import Path


def validate(app):
    with (app / 'Info.plist').open('rb') as stream:
        info = plistlib.load(stream)
    if info.get('CFBundlePackageType') != 'APPL':
        raise ValueError('missing APPL package type')
    if info.get('CFBundleSupportedPlatforms') != ['iPhoneOS']:
        raise ValueError('not an iPhoneOS device bundle')
    name = info.get('CFBundleExecutable', '')
    if not name or Path(name).name != name:
        raise ValueError('missing or invalid executable name')
    with (app / name).open('rb') as stream:
        header = stream.read(32)
    if len(header) != 32:
        raise ValueError('truncated executable')
    magic, cpu, _, kind, *_ = struct.unpack('<8I', header)
    if (magic, cpu, kind) != (0xfeedfacf, 0x100000c, 2):
        raise ValueError('executable is not an arm64 Mach-O executable')
    if not any(app.rglob('startup.blend')):
        raise ValueError('missing installed startup.blend resources')


def select(root):
    valid = []
    for app in sorted(root.rglob('Blender.app')):
        try:
            validate(app)
        except (OSError, ValueError, plistlib.InvalidFileException) as error:
            print(f'Skipping {app}: {error}', file=sys.stderr)
        else:
            valid.append(app)
    if len(valid) != 1:
        raise ValueError(f'Expected one complete iOS app; found {len(valid)}: {valid}')
    return valid[0]


if __name__ == '__main__':
    try:
        print(select(Path(sys.argv[1])))
    except (OSError, ValueError) as error:
        sys.exit(str(error))
