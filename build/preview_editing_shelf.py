"""Actual Blender native UILayout preview, not the iOS floating-block renderer.

-- --case before|move|mesh|narrow|portrait. Saves a real screenshot and exits.
The after layout uses a temporary host popup because stock Blender does not draw
the iOS WINDOW Header hook. Placement, popup outline, panels and input differ.
No installed scripts, startup scene or preferences are saved.
"""
from pathlib import Path
from types import ModuleType
import json
import subprocess
import sys
import bpy

repo = Path(__file__).resolve().parents[1]
case = sys.argv[sys.argv.index('--case') + 1] if '--case' in sys.argv else 'move'
output = repo / 'output/ui-preview/editing-shelf'
output.mkdir(parents=True, exist_ok=True)
path = 'scripts/startup/bl_ui/space_view3d_ipad.py'
patch = (subprocess.check_output(['git', 'show', '855f6bd:patches/blender-ipad.patch'], cwd=repo).decode()
         if case == 'before' else (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8'))
section = patch.split(f'diff --git a/{path} b/{path}\n', 1)[1].split('diff --git ', 1)[0]
source = '\n'.join(line[1:] for line in section.splitlines() if line.startswith('+') and not line.startswith('+++'))
module = ModuleType('editing_shelf_preview')
exec(compile(source, path, 'exec'), module.__dict__)
for cls in module.classes:
    bpy.utils.register_class(cls)
def header(self, context):
    module.draw_canvas_header(self.layout)
bpy.types.VIEW3D_HT_header.prepend(header)
bpy.context.preferences.view.show_splash = False
area = next(a for a in bpy.context.window.screen.areas if a.type == 'VIEW_3D')
region = next(r for r in area.regions if r.type == 'WINDOW')
width = 324 if case == 'narrow' else 560 if case == 'portrait' else 720

class WM_OT_editing_shelf_preview(bpy.types.Operator):
    bl_idname = 'wm.editing_shelf_preview'
    bl_label = 'Editing Shelf · Host Layout Preview'
    def invoke(self, context, event):
        return context.window_manager.invoke_popup(self, width=width)
    def draw(self, context):
        # Same shipped draw function and native Blender layout engine/RNA.
        module.draw_editing_shelf(self.layout, context, width_units=width / 20)
    def execute(self, context):
        return {'FINISHED'}
bpy.utils.register_class(WM_OT_editing_shelf_preview)
step = 0
def tick():
    global step
    try:
        if step == 0:
            with bpy.context.temp_override(area=area, region=region):
                bpy.ops.wm.tool_set_by_id(name='builtin.move')
                active = module.ToolSelectPanelHelper.tool_active_from_context(bpy.context)
                active.operator_properties('transform.translate').constraint_axis = (True, False, False)
                active.operator_properties('transform.translate').use_accurate = True
                bpy.context.tool_settings.use_snap = True
                if case == 'mesh':
                    bpy.ops.object.mode_set(mode='EDIT')
                    bpy.ops.view3d.ipad_selection_tool(tool='builtin.select_box', mode='ADD')
            area.tag_redraw()
        elif step == 1 and case != 'before':
            with bpy.context.temp_override(area=area, region=region):
                bpy.context.window.cursor_warp(region.x + region.width // 2, region.y + 250)
                bpy.ops.wm.editing_shelf_preview('INVOKE_DEFAULT')
        elif step == 2:
            bpy.ops.screen.screenshot(filepath=str(output / (case + '.png')))
            (output / (case + '.json')).write_text(json.dumps({
                'host': bpy.app.version_string, 'case': case, 'layout_width': width,
                'scope': 'Real host native UILayout/RNA screenshot. After shelf is a host popup; iOS anchor, compositor, gesture input and device acceptance unverified.'
            }, indent=2) + '\n', encoding='utf-8')
        elif step == 3:
            bpy.ops.wm.quit_blender()
            return None
        step += 1
        return 1.5
    except Exception:
        import traceback
        (output / (case + '-error.txt')).write_text(traceback.format_exc(), encoding='utf-8')
        bpy.ops.wm.quit_blender()
        return None
bpy.app.timers.register(tick, first_interval=3)
