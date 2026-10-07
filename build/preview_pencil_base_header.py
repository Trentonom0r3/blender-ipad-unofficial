"""Actual stock-host header layout; native adaptation/fit capability is modeled.

The candidate draw runs in a real VIEW3D HEADER, with real tool/Scene RNA. This
does not execute target ring composition, 44-unit adaptation or UIKit input.
No preferences/startup files are saved.
"""
from pathlib import Path
import hashlib
import json
import subprocess
import sys
import types
import bpy

repo = Path(__file__).resolve().parents[1]
case = sys.argv[sys.argv.index('--case') + 1] if '--case' in sys.argv else 'move'
output = repo / 'output/ui-preview/pencil-ring-foundation/header'
output.mkdir(parents=True, exist_ok=True)
path = 'scripts/startup/bl_ui/space_view3d_ipad.py'
patch = ((subprocess.check_output(['git', 'show', 'eb12d7c:patches/blender-ipad.patch'], cwd=repo).decode())
         if case == 'before' else (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8'))
section = patch.split(f'diff --git a/{path} b/{path}\n', 1)[1].split('diff --git ', 1)[0]
source = ''.join(line[1:] for line in section.splitlines(True) if line.startswith('+') and not line.startswith('+++'))
module = types.ModuleType('pencil_base_header_preview')
exec(compile(source, path, 'exec'), module.__dict__)
for cls in module.classes:
    bpy.utils.register_class(cls)

class NativeProps:
    def __init__(self, props): object.__setattr__(self, 'props', props)
    def __setattr__(self, key, value):
        if key != 'ipad_touch_targets': setattr(self.props, key, value)

class NativeLayout:
    def __init__(self, layout): object.__setattr__(self, 'layout', layout)
    def __getattr__(self, key): return getattr(self.layout, key)
    def __setattr__(self, key, value): setattr(self.layout, key, value)
    def row(self, **kwargs): return NativeLayout(self.layout.row(**kwargs))
    def column(self, **kwargs): return NativeLayout(self.layout.column(**kwargs))
    def operator(self, name, **kwargs):
        result = self.layout.operator(name, **kwargs)
        return NativeProps(result) if name == 'wm.call_menu_pie' else result

class AreaCapability:
    def __init__(self, area): self.area = area
    def __getattr__(self, key): return getattr(self.area, key)
    @property
    def ipad_pencil_header_supported(self): return case not in {'narrow', 'quad'}

class ContextCapability:
    def __init__(self, context): self.context = context
    def __getattr__(self, key): return getattr(self.context, key)
    @property
    def area(self): return AreaCapability(self.context.area)

original = bpy.types.VIEW3D_HT_header.draw
handled = []
def header(self, context):
    if case == 'before':
        module.draw_canvas_header(NativeLayout(self.layout))
        original(self, context)
    else:
        compact = module.draw_canvas_header(NativeLayout(self.layout), ContextCapability(context))
        handled.append(compact)
        if not compact: original(self, context)
bpy.types.VIEW3D_HT_header.draw = header
bpy.context.preferences.view.show_splash = False
area = next(a for a in bpy.context.window.screen.areas if a.type == 'VIEW_3D')
region = next(r for r in area.regions if r.type == 'WINDOW')
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
                area.spaces.active.show_region_tool_header = False
                if case == 'mesh':
                    bpy.ops.object.mode_set(mode='EDIT')
                    bpy.ops.view3d.ipad_selection_tool(tool='builtin.select_box', mode='ADD')
                if case == 'sculpt': bpy.ops.object.mode_set(mode='SCULPT')
                if case == 'quad': bpy.ops.screen.region_quadview()
                if case == 'native': bpy.ops.view3d.ipad_native_controls()
            area.tag_redraw()
        elif step == 1:
            bpy.ops.screen.screenshot(filepath=str(output / (case + '.png')))
            (output / (case + '.json')).write_text(json.dumps({
                'case': case, 'host': bpy.app.version_string,
                'canonical_patch_sha256': hashlib.sha256(patch.encode()).hexdigest(),
                'candidate_python_sha256': hashlib.sha256(source.encode()).hexdigest(),
                'header_handled': handled[-1] if handled else False,
                'actual_mode': bpy.context.mode,
                'actual_tool_header_visible': area.spaces.active.show_region_tool_header,
                'scope': 'Real stock-host VIEW3D HEADER and native tool/Scene RNA; native adapted/fit capability is modeled. Target 44-unit sizing, compositor, ring input and device unverified.'
            }, indent=2) + '\n', encoding='utf-8')
        elif step == 2:
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
