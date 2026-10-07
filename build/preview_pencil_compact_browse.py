"""Actual stock native popover/HUD preview; no patched UIKit/GPU claim."""
from pathlib import Path
from types import ModuleType
import bpy,json,hashlib
repo=Path(__file__).resolve().parents[1]
out=repo/'output/ui-preview/pencil-compact-browse';out.mkdir(parents=True,exist_ok=True)
patch=(repo/'patches/blender-ipad.patch').read_text(encoding='utf-8')
path='scripts/startup/bl_ui/space_view3d_ipad.py'
section=patch.split(f'diff --git a/{path} b/{path}\n',1)[1].split('diff --git ',1)[0]
source='\n'.join(l[1:] for l in section.splitlines() if l.startswith('+') and not l.startswith('+++'))+'\n'
module=ModuleType('compact_next_drag_preview');exec(compile(source,path,'exec'),module.__dict__)
for cls in module.classes:bpy.utils.register_class(cls)
bpy.context.preferences.view.show_splash=False;bpy.context.preferences.view.show_tooltips=False
area=next(a for a in bpy.context.window.screen.areas if a.type=='VIEW_3D')
region=next(r for r in area.regions if r.type=='WINDOW')
step=0
def tick():
 global step
 try:
  with bpy.context.temp_override(area=area,region=region):
   if step==0:
    bpy.ops.wm.tool_set_by_id(name='builtin.move')
    bpy.ops.ed.undo_push(message='Preview before move')
    bpy.ops.transform.translate('EXEC_REGION_WIN',True,value=(0,2,0))
    area.tag_redraw()
   elif step==1:
    bpy.ops.screen.screenshot(filepath=str(out/'native-last-move.png'))
    bpy.context.window.cursor_warp(region.x+region.width//2,region.y+region.height//2)
    bpy.ops.wm.call_panel('INVOKE_DEFAULT',name='VIEW3D_PT_ipad_transform',keep_open=True)
   elif step==2:
    bpy.ops.screen.screenshot(filepath=str(out/'next-drag.png'))
    report={'evidence':'Actual stock native panel widgets using exact candidate Python, and native accepted Move/HUD. Target ring geometry/receipt/UIKit not executed.',
     'stock_version':bpy.app.version_string,'patch_sha256':hashlib.sha256(patch.encode()).hexdigest(),
     'python_sha256':hashlib.sha256(source.encode()).hexdigest(),'panel_width_units':module.VIEW3D_PT_ipad_transform.bl_ui_units_x,
     'native_move':tuple(bpy.context.object.location),'device_acceptance':False}
    (out/'host-preview.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
   else:bpy.ops.wm.quit_blender();return None
  step+=1;return 2
 except Exception:
  import traceback
  (out/'host-preview-error.txt').write_text(traceback.format_exc(),encoding='utf-8');bpy.ops.wm.quit_blender();return None
bpy.app.timers.register(tick,first_interval=5)
