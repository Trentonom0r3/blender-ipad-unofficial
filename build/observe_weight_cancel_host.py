"""Observe stock native held Weight Paint, Escape, release and Undo semantics.
No target UIKit delivery or corrected5.0 cache lifetime proof is claimed.
"""
from pathlib import Path
import bpy,json,tempfile,traceback
from mathutils import Vector
from bpy_extras.view3d_utils import location_3d_to_region_2d
repo=Path(__file__).resolve().parents[1];out=repo/'output/ui-preview/pencil-paint-contact';out.mkdir(parents=True,exist_ok=True)
result=out/'native-weight-cancel-host.json';result.unlink(missing_ok=True)
bpy.context.preferences.use_preferences_save=False
bpy.context.preferences.filepaths.temporary_directory=tempfile.mkdtemp(prefix='disposable-weight-cancel-')+'/'
bpy.context.preferences.filepaths.use_auto_save_temporary_files=False
bpy.context.preferences.view.show_splash=False;bpy.context.preferences.view.show_tooltips=False
step=0;before=None;painted=None;cancelled=None;events=[];x=y=0
def values():
 obj=bpy.data.objects['Cube'];group=obj.vertex_groups.get('Disposable weight baseline')
 if not group:return None
 return [next((g.weight for g in v.groups if g.group==group.index),0.0) for v in obj.data.vertices]
def difference(a,b):
 if a is None or b is None or len(a)!=len(b):return None
 return max(abs(x-y) for x,y in zip(a,b))
def tick():
 global step,before,painted,cancelled,x,y
 try:
  window=bpy.context.window;area=next(a for a in window.screen.areas if a.type=='VIEW_3D');region=next(r for r in area.regions if r.type=='WINDOW')
  with bpy.context.temp_override(window=window,area=area,region=region):
   if step==0:
    obj=bpy.data.objects['Cube'];mod=obj.modifiers.new('Disposable weight mesh','SUBSURF');mod.levels=3;bpy.ops.object.modifier_apply(modifier=mod.name)
    group=obj.vertex_groups.new(name='Disposable weight baseline');group.add(list(range(len(obj.data.vertices))),0.0,'REPLACE');obj.vertex_groups.active_index=group.index
    bpy.ops.object.mode_set(mode='WEIGHT_PAINT')
    bpy.ops.brush.asset_activate(asset_library_type='ESSENTIALS',relative_asset_identifier='brushes/essentials_brushes-mesh_weight.blend/Brush/Paint')
    brush=bpy.context.tool_settings.weight_paint.brush;assert brush is not None
    brush.weight=1;brush.strength=.5;brush.size=80
    unified=bpy.context.tool_settings.weight_paint.unified_paint_settings;unified.use_unified_weight=False;unified.use_unified_strength=False;unified.use_unified_size=False
    bpy.ops.ed.undo_push(message='Disposable weight cancellation baseline');area.tag_redraw()
   elif step==1:
    before=values();assert before is not None
    p=location_3d_to_region_2d(region,area.spaces.active.region_3d,Vector((0,0,0)));assert p is not None
    x=int(region.x+p.x);y=int(region.y+p.y);window.cursor_warp(x,y)
    window.event_simulate(type='MOUSEMOVE',value='NOTHING',x=x,y=y);window.event_simulate(type='LEFTMOUSE',value='PRESS',x=x,y=y)
   elif step==2:window.event_simulate(type='MOUSEMOVE',value='NOTHING',x=x+12,y=y+5)
   elif step==3:
    painted=values();delta=difference(before,painted);assert delta is not None and delta>1e-6,delta
    events.append({'held_stroke_weight_delta':delta});bpy.ops.screen.screenshot(filepath=str(out/'native-weight-held.png'))
    window.event_simulate(type='ESC',value='PRESS',x=x+12,y=y+5);window.event_simulate(type='ESC',value='RELEASE',x=x+12,y=y+5)
   elif step==4:
    cancelled=values();events.append({'escape_delta_from_original':difference(before,cancelled),'escape_delta_from_painted':difference(painted,cancelled),'mode_after_escape':bpy.context.mode})
    window.event_simulate(type='LEFTMOUSE',value='RELEASE',x=x+12,y=y+5)
   elif step==5:
    events.append({'release_delta_from_cancelled':difference(cancelled,values())})
    events.append({'native_undo_status':sorted(bpy.ops.ed.undo())})
   elif step==6:
    events.append({'undo_delta_from_original':difference(before,values()),'mode_after_undo':bpy.context.mode,'vertex_count_after_undo':len(bpy.data.objects['Cube'].data.vertices)})
    result.write_text(json.dumps({'status':'observed','host_version':bpy.app.version_string,'events':events,'scope':'Actual disposable stock5.1.2 native Weight Paint held generic mouse press/motion, native Escape/release and one native Undo. Observation of stock semantics only, not target5.0 or UIKit/Pencil/POINTER_CANCEL delivery; no target device or rollback acceptance.','device_acceptance':False},indent=2)+'\n',encoding='utf-8')
   else:bpy.ops.wm.quit_blender();return None
  step+=1;return 1.5
 except Exception:
  result.write_text(json.dumps({'status':'failed','error':traceback.format_exc(),'events':events,'device_acceptance':False},indent=2)+'\n',encoding='utf-8')
  bpy.ops.wm.quit_blender();return None
bpy.app.timers.register(tick,first_interval=4)
