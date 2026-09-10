"""Preview shipped radial UI in host Blender; never simulates Pencil or UIKit.

blender --factory-startup --disable-autoexec --python build/preview_pencil_tools.py
Uses a disposable scene, saves screenshots only, then exits without saving settings.
"""
from pathlib import Path
import ast
import json
import types
import bpy

bpy.context.preferences.view.show_splash = False

repo = Path(__file__).resolve().parents[1]
path = 'scripts/startup/bl_ui/space_view3d_ipad.py'
patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
section = patch.split(f'diff --git a/{path} b/{path}\n', 1)[1].split('diff --git ', 1)[0]
source = '\n'.join(line[1:] for line in section.splitlines()
                   if line.startswith('+') and not line.startswith('+++'))
icons = bpy.types.UILayout.bl_rna.functions['operator'].parameters['icon'].enum_items
for node in ast.walk(ast.parse(source)):
    if isinstance(node, ast.keyword) and node.arg == 'icon' and isinstance(node.value, ast.Constant):
        assert node.value.value in icons, f'Unavailable UI icon: {node.value.value}'
module = types.ModuleType('pencil_tools_preview')
exec(compile(source, path, 'exec'), module.__dict__)
for cls in module.classes:
    bpy.utils.register_class(cls)


def header(self, context):
    module.draw_canvas_header(self.layout)


bpy.types.VIEW3D_HT_header.prepend(header)
output = repo / 'output/ui-preview'
output.mkdir(parents=True, exist_ok=True)
checks = []
step = 0


def viewport():
    return next(a for a in bpy.context.window.screen.areas if a.type == 'VIEW_3D')


def popup():
    area = viewport()
    region = next(r for r in area.regions if r.type == 'WINDOW')
    with bpy.context.temp_override(area=area, region=region):
        # Desktop placement only. No production code warps a Pencil cursor.
        bpy.context.window.cursor_warp(area.x + area.width // 2, area.y + area.height // 2)
        bpy.ops.wm.ipad_tool_palette('INVOKE_DEFAULT')


def verify_tools():
    area = viewport()
    region = next(r for r in area.regions if r.type == 'WINDOW')
    with bpy.context.temp_override(area=area, region=region):
        helper = module.ToolSelectPanelHelper
        cls = helper._tool_class_from_space_type('VIEW_3D')
        available = {tool.idname for tool in cls._tools_flatten_with_dynamic(
            cls.tools_from_context(bpy.context), context=bpy.context) if tool is not None}
        for name in ('builtin.select_box', 'builtin.move', 'builtin.rotate', 'builtin.scale'):
            assert name in available, (bpy.context.mode, name)
            assert bpy.ops.wm.tool_set_by_id(name=name) == {'FINISHED'}
            assert helper.tool_active_from_context(bpy.context).idname == name
        checks.append({'mode': bpy.context.mode, 'core_tools': 'passed'})
        bpy.ops.wm.tool_set_by_id(name='builtin.select_box')


def tick():
    global step
    try:
        area = viewport()
        if step == 0:
            verify_tools()
            popup()
        elif step == 1:
            bpy.ops.screen.screenshot(filepath=str(output / 'pencil-tools-object.png'))
        elif step == 2:
            # A new window-manager context closes the previous popup through normal
            # UI teardown; no simulated native input or device claims.
            with bpy.context.temp_override(area=area):
                bpy.ops.screen.screen_full_area()
        elif step == 3:
            area = viewport()
            with bpy.context.temp_override(area=area):
                bpy.ops.object.mode_set(mode='EDIT')
            verify_tools()
            popup()
        elif step == 4:
            bpy.ops.screen.screenshot(filepath=str(output / 'pencil-tools-edit-mesh.png'))
        elif step == 5:
            (output / 'pencil-tools-host-checks.json').write_text(json.dumps({
                'blender_version': bpy.app.version_string,
                'evidence': 'Host tools and Python UI only; no iOS event/C++ behavior tested',
                'checks': checks,
            }, indent=2) + '\n', encoding='utf-8')
            bpy.ops.wm.quit_blender()
            return None
        step += 1
        return 2.0
    except Exception:
        import traceback
        (output / 'pencil-tools-preview-error.txt').write_text(traceback.format_exc(), encoding='utf-8')
        bpy.ops.wm.quit_blender()
        return None


bpy.app.timers.register(tick, first_interval=4.0)
