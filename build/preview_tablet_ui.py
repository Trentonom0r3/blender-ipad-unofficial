"""Run with Blender --factory-startup --disable-autoexec --python this_file.

Preview the actual patched Python UI without modifying installed Blender scripts.
This does not emulate UIKit or touch input, and never saves user preferences.
"""
from pathlib import Path
import types
import ast
import bpy

repo = Path(__file__).resolve().parents[1]
patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
path = 'scripts/startup/bl_ui/space_view3d_ipad.py'
section = patch.split(f'diff --git a/{path} b/{path}\n', 1)[1].split('diff --git ', 1)[0]
source = '\n'.join(line[1:] for line in section.splitlines()
                   if line.startswith('+') and not line.startswith('+++'))
# Catch UI runtime errors that Python syntax checks cannot detect.
icons = bpy.types.UILayout.bl_rna.functions['operator'].parameters['icon'].enum_items
for node in ast.walk(ast.parse(source)):
    if isinstance(node, ast.keyword) and node.arg == 'icon' and isinstance(node.value, ast.Constant):
        assert node.value.value in icons, f'Unavailable UI icon: {node.value.value}'
module = types.ModuleType('tablet_preview')
exec(compile(source, path, 'exec'), module.__dict__)
for cls in module.classes:
    bpy.utils.register_class(cls)

dock = types.ModuleType('tablet_dock_preview')
exec(compile((repo / 'build/tablet_dock_preview.py').read_text(),
             'tablet_dock_preview.py', 'exec'), dock.__dict__)
for cls in dock.classes:
    bpy.utils.register_class(cls)
bpy.types.SpaceView3D.draw_handler_add(dock.draw_labels, (), 'WINDOW', 'POST_PIXEL')


def draw_entry(self, context):
    module.draw_canvas_header(self.layout)


bpy.types.VIEW3D_HT_header.prepend(draw_entry)
output = repo / 'output/ui-preview'
output.mkdir(parents=True, exist_ok=True)


def viewport():
    return next(a for a in bpy.context.window.screen.areas if a.type == 'VIEW_3D')


def snapshot(name):
    bpy.ops.screen.screenshot(filepath=str(output / (name + '.png')))


def resize_preview():
    # Resize only this disposable preview's own native window, not other apps.
    import ctypes
    import os
    from ctypes import wintypes
    user32 = ctypes.windll.user32
    callback_type = ctypes.WINFUNCTYPE(wintypes.BOOL, wintypes.HWND, wintypes.LPARAM)

    def visit(hwnd, _):
        process = wintypes.DWORD()
        user32.GetWindowThreadProcessId(hwnd, ctypes.byref(process))
        if process.value == os.getpid() and user32.IsWindowVisible(hwnd):
            user32.ShowWindow(hwnd, 9)
            outer, client = wintypes.RECT(), wintypes.RECT()
            user32.GetWindowRect(hwnd, ctypes.byref(outer))
            user32.GetClientRect(hwnd, ctypes.byref(client))
            width = 1280 + (outer.right - outer.left) - client.right
            height = 882 + (outer.bottom - outer.top) - client.bottom
            user32.SetWindowPos(hwnd, None, 30, 30, width, height, 0x0040)
        return True

    user32.EnumWindows(callback_type(visit), 0)


step = 0
original_layout = None


def capture_sequence():
    global step, original_layout
    window = bpy.context.window
    if step == 0:
        resize_preview()
    elif step == 1:
        original_layout = sorted((a.type, a.width, a.height) for a in window.screen.areas)
        snapshot('windows-01-full-layout')
        with bpy.context.temp_override(area=viewport()):
            bpy.ops.screen.screen_full_area()
    elif step == 2:
        viewport().spaces.active.show_region_toolbar = False
    elif step == 3:
        snapshot('windows-02-expanded')
        viewport().spaces.active.show_region_toolbar = True
        with bpy.context.temp_override(area=viewport()):
            bpy.ops.screen.screen_full_area()
    elif step == 4:
        restored = sorted((a.type, a.width, a.height) for a in window.screen.areas)
        assert restored == original_layout, (original_layout, restored)
        snapshot('windows-03-restored')
        area = viewport()
        region = next(r for r in area.regions if r.type == 'WINDOW')
        window.cursor_warp(area.x + 190, area.y + area.height - 100)
        with bpy.context.temp_override(area=area, region=region):
            bpy.ops.wm.call_panel(name='VIEW3D_PT_ipad_controls', keep_open=True)
    elif step == 5:
        snapshot('windows-04-canvas-open')
        print('TABLET_PREVIEW_READY: layout restoration passed; panel captured', flush=True)
        return None
    step += 1
    return 2.0


bpy.app.timers.register(capture_sequence, first_interval=8.0)
