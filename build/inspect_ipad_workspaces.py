"""Inspect packaged workspace layouts without launching UI or saving preferences.

python build/inspect_ipad_workspaces.py --ipa build.ipa --blender /path/to/blender
Extracts verified startup data, then uses host Blender only as a .blend reader.
This does not execute or validate the iOS panel adapter.
"""
from pathlib import Path
import argparse
import hashlib
import json
import struct
import subprocess
import sys
import zipfile


def embedded_startup(data):
    """Resolve datatoc symbols through the Mach-O symbol table and file segments."""
    if data[:4] != bytes.fromhex('cffaedfe'):
        raise ValueError('Expected the 64-bit little-endian iOS Mach-O executable')
    segments, symbols = [], None
    offset = 32
    for _ in range(struct.unpack_from('<I', data, 16)[0]):
        command, size = struct.unpack_from('<II', data, offset)
        if size < 8 or offset + size > len(data):
            raise ValueError('Invalid Mach-O load command')
        if command == 0x19:
            address, _, file_offset, file_size = struct.unpack_from('<QQQQ', data, offset + 24)
            segments.append((address, file_offset, file_size))
        if command == 2:
            symbols = struct.unpack_from('<IIII', data, offset + 8)
        offset += size
    if symbols is None:
        raise ValueError('No symbol table; cannot verify embedded startup data')
    symoff, count, stroff, _ = symbols
    found = {}
    for index in range(count):
        name_offset, _, _, _, address = struct.unpack_from('<IBBHQ', data, symoff + index * 16)
        start = stroff + name_offset
        name = data[start:data.index(b'\0', start)]
        if name in (b'_datatoc_startup_blend', b'_datatoc_startup_blend_size'):
            found[name] = address

    def position(address):
        for base, fileoff, size in segments:
            if base <= address < base + size:
                return fileoff + address - base
        raise ValueError('Startup symbol is outside file-backed segments')

    size = struct.unpack_from('<I', data, position(found[b'_datatoc_startup_blend_size']))[0]
    start = position(found[b'_datatoc_startup_blend'])
    result = data[start:start + size]
    if len(result) != size:
        raise ValueError('Truncated embedded startup data')
    return result


def read_layouts(directory):
    import bpy
    result = {'reader': bpy.app.version_string, 'files': []}
    for path in sorted(directory.glob('*.blend')):
        bpy.ops.wm.open_mainfile(filepath=str(path), load_ui=True, use_scripts=False)
        item = {'file': path.name, 'sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
                'workspaces': []}
        for workspace in bpy.data.workspaces:
            for screen in workspace.screens:
                areas = []
                for index, area in enumerate(screen.areas):
                    space = area.spaces.active
                    areas.append({'id': index, 'type': area.type, 'ui_type': area.ui_type,
                                  'view': getattr(space, 'view', None),
                                  'view_type': getattr(space, 'view_type', None),
                                  'display_mode': getattr(space, 'display_mode', None),
                                  'rect': [area.x, area.y, area.x + area.width,
                                           area.y + area.height]})
                item['workspaces'].append({'name': workspace.name, 'screen': screen.name,
                                           'areas': areas})
        result['files'].append(item)
    (directory / 'inventory.json').write_text(json.dumps(result, indent=2) + '\n')
    print('Read', sum(len(f['workspaces']) for f in result['files']), 'saved workspace layouts')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--ipa', type=Path)
    parser.add_argument('--blender', type=Path)
    parser.add_argument('--output', type=Path, default=Path('output/workspace-audit'))
    parser.add_argument('--read-layouts', type=Path, help=argparse.SUPPRESS)
    args = parser.parse_args(sys.argv[sys.argv.index('--') + 1:] if '--' in sys.argv else None)
    if args.read_layouts:
        read_layouts(args.read_layouts)
        return
    if not args.ipa or not args.blender:
        parser.error('--ipa and --blender are required')
    fixture_path = Path(__file__).resolve().parent / 'tests/ipad_workspace_layouts.json'
    fixture = json.loads(fixture_path.read_text())
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(args.ipa) as archive:
        files = {'startup.blend': embedded_startup(archive.read('Payload/Blender.app/Blender'))}
        for name in ('2D_Animation', 'Sculpting', 'VFX', 'Video_Editing'):
            suffix = f'/bl_app_templates_system/{name}/startup.blend'
            path = next(p for p in archive.namelist() if p.endswith(suffix))
            files[name + '.blend'] = archive.read(path)
    for name, data in files.items():
        digest = hashlib.sha256(data).hexdigest()
        if digest != fixture['files'][name]:
            raise ValueError(f'{name} differs from audited source; inspect before replacing fixtures')
        (output / name).write_bytes(data)
    subprocess.run([str(args.blender.resolve()), '--background', '--factory-startup',
                    '--disable-autoexec', '--python-exit-code', '1', '--python',
                    str(Path(__file__).resolve()), '--', '--read-layouts', str(output)], check=True)
    print('Verified packaged startup hashes; inventory:', output / 'inventory.json')


if __name__ == '__main__':
    main()
