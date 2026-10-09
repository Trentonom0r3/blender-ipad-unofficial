"""Disposable stock Sculpt mouse-press/native history baseline.
This establishes generic non-tablet brush eligibility, not UIKit finger identity.
"""
from pathlib import Path
import bpy,json,traceback,tempfile
from mathutils import Vector
from bpy_extras.view3d_utils import location_3d_to_region_2d
repo=Path(__file__).resolve().parents[1];out=repo/'output/ui-preview/pencil-paint-contact';out.mkdir(parents=True,exist_ok=True)
result=out/'native-brush-host.json';result.unlink(missing_ok=True)
bpy.context.preferences.use_preferences_save=False;bpy.context.preferences.filepaths.temporary_directory=tempfile.mkdtemp(prefix='disposable-pencil-host-')+'/'
bpy.context.preferences.filepaths.use_auto_save_temporary_files=False
bpy.context.preferences.view.show_splash=False;bpy.context.preferences.view.show_tooltips=False
step=0;before=None;after=None;frames=[]
def positions():return [tuple(v.co) for v in bpy.data.objects['Cube'].data.vertices]
def distance(a,b):return max(sum((x-y)**2 for x,y in zip(p,q))**.5 for p,q in zip(a,b))
def tick():
 global step,before,after
 try:
  window=bpy.context.window;area=next(a for a in window.screen.areas if a.type=='VIEW_3D');region=next(r for r in area.regions if r.type=='WINDOW')
  with bpy.context.temp_override(window=window,area=area,region=region):
   if step==0:
    cube=bpy.data.objects['Cube'];mod=cube.modifiers.new('Disposable brush baseline','SUBSURF');mod.levels=3
    bpy.ops.object.modifier_apply(modifier=mod.name)
    bpy.ops.object.mode_set(mode='SCULPT')
    bpy.ops.brush.asset_activate(asset_library_type='ESSENTIALS',relative_asset_identifier='brushes/essentials_brushes-mesh_sculpt.blend/Brush/Draw')
    assert bpy.context.tool_settings.sculpt.brush is not None
    bpy.ops.ed.undo_push(message='Disposable native brush baseline');area.tag_redraw()
   elif step==1:
    before=positions();p=location_3d_to_region_2d(region,area.spaces.active.region_3d,Vector((0,0,0)))
    assert p is not None;x=int(region.x+p.x);y=int(region.y+p.y)
    window.cursor_warp(x,y)
    window.event_simulate(type='MOUSEMOVE',value='NOTHING',x=x,y=y)
    window.event_simulate(type='LEFTMOUSE',value='PRESS',x=x,y=y)
    window.event_simulate(type='LEFTMOUSE',value='RELEASE',x=x,y=y)
   elif step==2:
    bpy.context.view_layer.update();after=positions();delta=distance(before,after);assert delta>1e-6,delta
    frames.append({'native_non_tablet_click_changed_geometry':True,'peak_displacement':delta,'vertices':len(before),'brush':bpy.context.tool_settings.sculpt.brush.name})
    bpy.ops.screen.screenshot(filepath=str(out/'native-non-tablet-brush.png'))
    assert bpy.ops.ed.undo()=={'FINISHED'}
   elif step==3:
    assert distance(before,positions())<1e-6
    assert bpy.ops.ed.redo()=={'FINISHED'}
   elif step==4:
    assert distance(after,positions())<1e-6
    result.write_text(json.dumps({'status':'passed','host_version':bpy.app.version_string,'frames':frames,'one_step_undo_redo':True,
     'scope':'Actual stock5.1.2 Sculpt brush on a generic non-tablet native mouse press/release, geometry change and one-step Undo/Redo. This supports brush eligibility in the source audit; it does not run UIKit finger provenance, painting cancellation or Pencil pressure/tilt transport.',
     'device_acceptance':False},indent=2)+'\n',encoding='utf-8')
   else:bpy.ops.wm.quit_blender();return None
  step+=1;return 1.5
 except Exception:
  result.write_text(json.dumps({'status':'failed','error':traceback.format_exc(),'frames':frames,'device_acceptance':False},indent=2)+'\n',encoding='utf-8')
  bpy.ops.wm.quit_blender();return None
bpy.app.timers.register(tick,first_interval=4)
