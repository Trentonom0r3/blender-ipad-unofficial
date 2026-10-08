"""Measure common ring labels with the exact packaged Blender font in stock Blender.

This checks text space after the native toolbar icon and ring-specific padding.
It is host font evidence; it does not render the patched iOS widget or accept it on-device.
Run: blender --background --python build/validate_pencil_ring_visual.py -- --ipa PATH
"""
import argparse
import json
from pathlib import Path
import sys
import tempfile
import zipfile

import blf
import bpy


parser = argparse.ArgumentParser()
parser.add_argument('--ipa', type=Path, required=True)
args = parser.parse_args(sys.argv[sys.argv.index('--') + 1:] if '--' in sys.argv else [])

with zipfile.ZipFile(args.ipa) as archive:
    names = [name for name in archive.namelist() if name.endswith('/datafiles/fonts/Inter.woff2')]
    if len(names) != 1:
        raise RuntimeError('Expected one packaged Blender Inter font')
    font_bytes = archive.read(names[0])

with tempfile.TemporaryDirectory(prefix='ipad-ring-font-') as directory:
    font_path = Path(directory) / 'Inter.woff2'
    font_path.write_bytes(font_bytes)
    font_id = blf.load(str(font_path))
    rows = []
    try:
        for scale in (1.0, 1.5, 2.0):
            # Current 4.7 native-unit ring button, 32px toolbar icon, 2px icon
            # gap, the widget outline pixel, then the label's inset on each side.
            available = (4.7 * 20 - 32 - 2 - 1 - 2) * scale
            blf.size(font_id, 11 * scale)
            for label in ('Transform', 'Select', 'Tools'):
                width, height = blf.dimensions(font_id, label)
                rows.append({'scale': scale, 'label': label,
                             'measured_width': width, 'available_width': available,
                             'measured_height': height, 'fits_one_line': width <= available})
                if width > available:
                    raise AssertionError(f'{label} needs a midword split at {scale}x: {width} > {available}')
    finally:
        blf.unload(str(font_path))

print(json.dumps({'host_blender': bpy.app.version_string,
                  'evidence': 'exact packaged font, stock host BLF only',
                  'labels': rows}, indent=2))