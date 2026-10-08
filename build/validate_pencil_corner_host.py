"""Actual native collapsed HUD panels using candidate Python on stock Blender.
The adaptation poll/View admission mask are explicit host-boundary substitutions.
The automatic patched HUD creation, compositor/Pencil delivery are not executed.
"""
from pathlib import Path
import bpy,hashlib,json,types,traceback
repo=Path(__file__).resolve().parents[1]
out=repo/'output/ui-preview/pencil-corner';out.mkdir(parents=True,exist_ok=True)
for name in ('host-corner.json','host-corner-error.txt'):(out/name).unlink(missing_ok=True)
patch=(repo/'patches/blender-ipad.patch').read_text(encoding='utf-8')
path='scripts/startup/bl_ui/space_view3d_ipad.py'
part=patch.split(f'diff --git a/{path} b/{path}\n',1)[1].split('diff --git ',1)[0]
source='\n'.join(l[1:] for l in part.splitlines() if l.startswith('+') and not l.startswith('+++'))+'\n'
module=types.ModuleType('corner_candidate')
exec(compile(source.replace('layout.ipad_view_navigation_mask()','7'),path,'exec'),module.__dict__)
module.ipad_corner_context=lambda C:C.area is not None and C.area.type=='VIEW_3D'
# Stock dynamic HUD crops to its last root panel. The patched native source
# aggregates roots; this host uses a native parent solely to expose the same
# real collapsed child panels without pretending to execute the patch.
class VIEW3D_PT_ipad_corner_host(bpy.types.Panel):
 bl_label='Host preview';bl_space_type='VIEW_3D';bl_region_type='HUD';bl_order=100
 def draw(self,context):pass
bpy.utils.register_class(VIEW3D_PT_ipad_corner_host)
for cls in (module.VIEW3D_PT_ipad_corner_transform,module.VIEW3D_PT_ipad_corner_selection,module.VIEW3D_PT_ipad_corner_view):
 cls.bl_parent_id='VIEW3D_PT_ipad_corner_host'
for cls in (module.VIEW3D_OT_ipad_native_tool,module.VIEW3D_OT_ipad_native_controls,
            module.VIEW3D_OT_ipad_selection_tool,module.VIEW3D_OT_ipad_transform_axis,
            module.VIEW3D_PT_ipad_transform,module.VIEW3D_PT_ipad_corner_transform,
            module.VIEW3D_PT_ipad_corner_selection,module.VIEW3D_PT_ipad_corner_view):
 bpy.utils.register_class(cls)
bpy.context.preferences.view.show_splash=False;bpy.context.preferences.view.show_tooltips=False
window=bpy.context.window
area=next(a for a in window.screen.areas if a.type=='VIEW_3D')
region=next(r for r in area.regions if r.type=='WINDOW');step=0;frames=[]
def hud():return next(r for r in area.regions if r.type=='HUD')
def click(x,y):
 window.event_simulate(type='MOUSEMOVE',value='NOTHING',x=x,y=y)
 window.event_simulate(type='LEFTMOUSE',value='PRESS',x=x,y=y)
 window.event_simulate(type='LEFTMOUSE',value='RELEASE',x=x,y=y)
def snapshot(name):
 h=hud();frames.append({'name':name,'x':h.x,'y':h.y,'width':h.width,'height':h.height,'cube_location':list(bpy.data.objects['Cube'].location)})
 bpy.ops.screen.screenshot(filepath=str(out/(name+'.png')))
def tick():
 global step
 try:
  with bpy.context.temp_override(area=area,region=region):
   if step==0:
    assert bpy.app.use_event_simulate
    bpy.ops.wm.tool_set_by_id(name='builtin.move');bpy.ops.ed.undo_push(message='Corner host baseline')
    bpy.ops.transform.translate('EXEC_REGION_WIN',True,value=(0,2,0));area.tag_redraw()
   elif step==1:
    snapshot('move-collapsed');h=hud();click(h.x+11,h.y+12)
   elif step==2:
    snapshot('move-expanded');assert frames[-1]['height']>frames[-2]['height']
    h=hud();click(h.x+11,h.y+h.height-30)
   elif step==3:
    bpy.ops.wm.tool_set_by_id(name='builtin.select_box');area.tag_redraw()
   elif step==4:snapshot('selection-stock-hud-limit')
   elif step==5:
    report={'status':'passed','evidence':'Actual stock native HUD registration, Move DEFAULT_CLOSED child header and expanded Move body. Stock cropping prevents proving the full Selection/View stack. Host adaptation poll and View mask modeled; existing native Move creates HUD and a temporary native parent exposes child panels because stock HUD supports only one root; patched root-stack sizing is covered by source tests. No patched automatic-create/compositor/GHOST/UIKit/device proof.',
     'host_version':bpy.app.version_string,'candidate_python_sha256':hashlib.sha256(source.encode()).hexdigest(),'frames':frames,'device_acceptance':False}
    (out/'host-corner.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
   else:bpy.ops.wm.quit_blender();return None
  step+=1;return 2
 except Exception:
  error=traceback.format_exc();(out/'host-corner-error.txt').write_text(error,encoding='utf-8')
  (out/'host-corner.json').write_text(json.dumps({'status':'failed','error':error,'frames':frames,'device_acceptance':False},indent=2)+'\n',encoding='utf-8')
  bpy.ops.wm.quit_blender();return None
bpy.app.timers.register(tick,first_interval=5)
