"""Disposable native Sculpt replay-pressure baseline, not UIKit transport proof."""
from pathlib import Path
import bpy,json,tempfile,traceback
from mathutils import Vector
from bpy_extras.view3d_utils import location_3d_to_region_2d
repo=Path(__file__).resolve().parents[1];out=repo/'output/ui-preview/pencil-paint-contact';out.mkdir(parents=True,exist_ok=True)
result=out/'native-pressure-replay-host.json';result.unlink(missing_ok=True)
bpy.context.preferences.use_preferences_save=False
bpy.context.preferences.filepaths.temporary_directory=tempfile.mkdtemp(prefix='disposable-pencil-pressure-')+'/'
bpy.context.preferences.filepaths.use_auto_save_temporary_files=False
bpy.context.preferences.view.show_splash=False;bpy.context.preferences.view.show_tooltips=False
step=0;baseline=None;cases=[];after=None;pressures=(0.0,.15,.8)
def points():return [tuple(v.co) for v in bpy.data.objects['Cube'].data.vertices]
def distance(a,b):return max(sum((x-y)**2 for x,y in zip(p,q))**.5 for p,q in zip(a,b))
def tick():
 global step,baseline,after
 try:
  window=bpy.context.window;area=next(a for a in window.screen.areas if a.type=='VIEW_3D');region=next(r for r in area.regions if r.type=='WINDOW')
  with bpy.context.temp_override(window=window,area=area,region=region):
   if step==0:
    obj=bpy.data.objects['Cube'];mod=obj.modifiers.new('Disposable pressure mesh','SUBSURF');mod.levels=4
    bpy.ops.object.modifier_apply(modifier=mod.name);bpy.ops.object.mode_set(mode='SCULPT')
    bpy.ops.brush.asset_activate(asset_library_type='ESSENTIALS',relative_asset_identifier='brushes/essentials_brushes-mesh_sculpt.blend/Brush/Draw')
    bpy.ops.ed.undo_push(message='Disposable native pressure baseline');area.tag_redraw()
   elif step==1:baseline=points()
   elif 2<=step<=10:
    index=(step-2)//3;phase=(step-2)%3;pressure=pressures[index]
    if phase==0:
     assert distance(baseline,points())<1e-6
     brush=bpy.context.tool_settings.sculpt.brush;assert brush is not None
     brush.use_pressure_strength=True;brush.use_pressure_size=False;brush.strength=.5;brush.size=80
     unified=bpy.context.tool_settings.sculpt.unified_paint_settings
     unified.use_unified_strength=False;unified.use_unified_size=False
     p=location_3d_to_region_2d(region,area.spaces.active.region_3d,Vector((0,0,0)));assert p is not None
     stroke=[dict(name='pressure baseline',mouse=(p.x,p.y),mouse_event=(p.x,p.y),location=(0,0,0),pressure=pressure,size=80,x_tilt=.2,y_tilt=-.3,time=0,is_start=True)]
     status=bpy.ops.sculpt.brush_stroke('EXEC_DEFAULT',True,stroke=stroke,override_location=True)
     assert status=={'FINISHED'},status
    elif phase==1:
     bpy.context.view_layer.update();after=points();delta=distance(baseline,after)
     cases.append({'pressure':pressure,'peak_displacement':delta,'vertices':len(after),'brush':bpy.context.tool_settings.sculpt.brush.name})
     bpy.ops.screen.screenshot(filepath=str(out/f'native-pressure-replay-{index}.png'))
     if pressure>0:assert bpy.ops.ed.undo()=={'FINISHED'}
    else:
     current=points();delta=distance(baseline,current)
     assert len(current)==len(baseline) and delta<1e-6,(len(current),len(baseline),delta)
     if pressure>0:
      cases[-1]['undo_displacement']=delta;cases[-1]['undo_vertices']=len(current);cases[-1]['undo_restored']=True
     else:
      cases[-1]['baseline_preserved']=True;cases[-1]['native_undo_requested']=False
   elif step==11:
    assert cases[0]['peak_displacement']<1e-6,cases
    assert cases[1]['peak_displacement']>1e-6,cases
    assert cases[2]['peak_displacement']>cases[1]['peak_displacement']*1.2,cases
    assert bpy.ops.ed.redo()=={'FINISHED'}
   elif step==12:
    assert distance(after,points())<1e-6
    result.write_text(json.dumps({'status':'passed','host_version':bpy.app.version_string,'cases':cases,'one_step_undo_each_nonzero_and_last_redo':True,
     'scope':'Actual stock native Sculpt Draw replay OperatorStrokeElement pressure, fixed radius/pressure strength, zero/light/firm mesh displacement and native Undo/Redo of nonzero strokes. Zero-effect replay does not request Undo. Not GHOST/WM interactive tablet delivery, UIKit/Pencil metadata, modal cancellation, target5.0 or tilt geometry proof.','device_acceptance':False},indent=2)+'\n',encoding='utf-8')
   else:bpy.ops.wm.quit_blender();return None
  step+=1;return 1.5
 except Exception:
  result.write_text(json.dumps({'status':'failed','error':traceback.format_exc(),'cases':cases,'device_acceptance':False},indent=2)+'\n',encoding='utf-8')
  bpy.ops.wm.quit_blender();return None
bpy.app.timers.register(tick,first_interval=4)
