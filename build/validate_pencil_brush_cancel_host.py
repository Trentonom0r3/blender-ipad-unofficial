"""Disposable stock Sculpt Escape/partial-stroke baseline; no UIKit claim."""
from pathlib import Path
import bpy,json,traceback,tempfile
from mathutils import Vector
from bpy_extras.view3d_utils import location_3d_to_region_2d
repo=Path(__file__).resolve().parents[1];out=repo/'output/ui-preview/pencil-paint-contact';out.mkdir(parents=True,exist_ok=True)
result=out/'native-brush-cancel-host.json';result.unlink(missing_ok=True)
bpy.context.preferences.use_preferences_save=False;bpy.context.preferences.filepaths.temporary_directory=tempfile.mkdtemp(prefix='disposable-pencil-host-')+'/'
bpy.context.preferences.filepaths.use_auto_save_temporary_files=False
bpy.context.preferences.view.show_splash=False;bpy.context.preferences.view.show_tooltips=False
step=0;before=None;during=None;after=None;point=None
def positions():return [tuple(v.co) for v in bpy.data.objects['Cube'].data.vertices]
def distance(a,b):return max(sum((x-y)**2 for x,y in zip(p,q))**.5 for p,q in zip(a,b))
def tick():
 global step,before,during,after,point
 try:
  window=bpy.context.window;area=next(a for a in window.screen.areas if a.type=='VIEW_3D');region=next(r for r in area.regions if r.type=='WINDOW')
  with bpy.context.temp_override(window=window,area=area,region=region):
   if step==0:
    cube=bpy.data.objects['Cube'];mod=cube.modifiers.new('Disposable brush baseline','SUBSURF');mod.levels=3
    bpy.ops.object.modifier_apply(modifier=mod.name);bpy.ops.object.mode_set(mode='SCULPT')
    bpy.ops.brush.asset_activate(asset_library_type='ESSENTIALS',relative_asset_identifier='brushes/essentials_brushes-mesh_sculpt.blend/Brush/Draw')
    assert bpy.context.tool_settings.sculpt.brush is not None
    bpy.ops.ed.undo_push(message='Disposable Escape baseline');area.tag_redraw()
   elif step==1:
    before=positions();p=location_3d_to_region_2d(region,area.spaces.active.region_3d,Vector((0,0,0)));assert p is not None
    point=(int(region.x+p.x),int(region.y+p.y));x,y=point;window.cursor_warp(x,y)
    window.event_simulate(type='MOUSEMOVE',value='NOTHING',x=x,y=y)
    window.event_simulate(type='LEFTMOUSE',value='PRESS',x=x,y=y)
   elif step==2:
    x,y=point;window.event_simulate(type='MOUSEMOVE',value='NOTHING',x=x+20,y=y+10)
   elif step==3:
    bpy.context.view_layer.update();during=positions();assert distance(before,during)>1e-6
    bpy.ops.screen.screenshot(filepath=str(out/'native-brush-before-escape.png'))
    x,y=point;window.event_simulate(type='ESC',value='PRESS',x=x+20,y=y+10);window.event_simulate(type='ESC',value='RELEASE',x=x+20,y=y+10)
   elif step==4:
    bpy.context.view_layer.update();after=positions()
    bpy.ops.screen.screenshot(filepath=str(out/'native-brush-after-escape.png'))
    result.write_text(json.dumps({'status':'observed','host_version':bpy.app.version_string,'vertices':len(before),
      'during_displacement':distance(before,during),'after_escape_displacement':distance(before,after),
      'native_escape_restores_original':distance(before,after)<1e-6,
      'scope':'Actual stock5.1.2 Sculpt Draw native held mouse stroke followed by Escape; samples live geometry before/after native terminal. Does not inject POINTER_CANCEL or execute UIKit contact ownership, other paint modes or device transport.',
      'device_acceptance':False},indent=2)+'\n',encoding='utf-8')
    x,y=point;window.event_simulate(type='LEFTMOUSE',value='RELEASE',x=x+20,y=y+10)
   else:bpy.ops.wm.quit_blender();return None
  step+=1;return 1.5
 except Exception:
  result.write_text(json.dumps({'status':'failed','error':traceback.format_exc(),'device_acceptance':False},indent=2)+'\n',encoding='utf-8')
  bpy.ops.wm.quit_blender();return None
bpy.app.timers.register(tick,first_interval=4)
