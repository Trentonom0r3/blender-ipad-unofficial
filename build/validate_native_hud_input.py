"""Disposable native HUD UI probe. Scoped events; no UIKit/device claim."""
from pathlib import Path
import bpy,json
repo=Path(__file__).resolve().parents[1];out=repo/'output/ui-preview/pencil-native-hud';out.mkdir(parents=True,exist_ok=True)
bpy.context.preferences.view.show_splash=False;bpy.context.preferences.view.show_tooltips=False
area=next(a for a in bpy.context.window.screen.areas if a.type=='VIEW_3D');region=next(r for r in area.regions if r.type=='WINDOW')
window=bpy.context.window;step=0;frames=[]
(out/"native-hud-error.txt").unlink(missing_ok=True)
(out/"native-hud-probe.json").unlink(missing_ok=True)
def hud():return next(r for r in area.regions if r.type=='HUD')
def snapshot():
 h=hud();return {'x':h.x,'y':h.y,'width':h.width,'height':h.height,'cube_location':list(bpy.data.objects['Cube'].location)}
def click(x,y):
 window.event_simulate(type='MOUSEMOVE',value='NOTHING',x=x,y=y)
 window.event_simulate(type='LEFTMOUSE',value='PRESS',x=x,y=y)
 window.event_simulate(type='LEFTMOUSE',value='RELEASE',x=x,y=y)
def keys(values,terminal):
 window.event_simulate(type='A',value='PRESS',ctrl=True)
 window.event_simulate(type='A',value='RELEASE',ctrl=True)
 for kind,char in values:
  window.event_simulate(type=kind,value='PRESS',unicode=char)
  window.event_simulate(type=kind,value='RELEASE')
 window.event_simulate(type=terminal,value='PRESS')
 window.event_simulate(type=terminal,value='RELEASE')
def field():
 h=hud();click(h.x+int(h.width*.7),h.y+h.height-77)
def tick():
 global step
 try:
  with bpy.context.temp_override(area=area,region=region):
   if step==0:
    assert bpy.app.use_event_simulate
    bpy.ops.wm.tool_set_by_id(name='builtin.move');bpy.ops.ed.undo_push(message='HUD baseline')
    bpy.ops.transform.translate('EXEC_REGION_WIN',True,value=(0,2,0));area.tag_redraw()
   elif step==1:
    frames.append(snapshot());h=hud();click(h.x+12,h.y+h.height//2)
   elif step==2:
    frames.append(snapshot());bpy.ops.screen.screenshot(filepath=str(out/'expanded-move.png'))
    assert frames[-1]['height']>frames[0]['height'];field()
   elif step==3:
    keys([('MINUS','-'),('THREE','3'),('PERIOD','.'),('TWO','2'),('FIVE','5')],'RET')
   elif step==4:
    assert abs(bpy.data.objects['Cube'].location.y+3.25)<1e-6,tuple(bpy.data.objects['Cube'].location)
    bpy.ops.screen.screenshot(filepath=str(out/'signed-decimal.png'));frames.append(snapshot());field()
   elif step==5:
    keys([('NINE','9'),('PERIOD','.'),('FIVE','5')],'ESC')
   elif step==6:
    assert abs(bpy.data.objects['Cube'].location.y+3.25)<1e-6
    assert bpy.ops.ed.undo()=={'FINISHED'}
    assert abs(bpy.data.objects['Cube'].location.y)<1e-6
    assert bpy.ops.ed.redo()=={'FINISHED'}
    assert abs(bpy.data.objects['Cube'].location.y+3.25)<1e-6
    report={'evidence':'Actual stock native HUD expansion, signed decimal field edit, Return/Escape terminals and one-step native Undo/Redo through scoped Window.event_simulate. No patched iPad/GHOST input or software-keyboard accessory delivery proof.',
      'status':'passed','host_version':bpy.app.version_string,'frames':frames,'expanded':True,'signed_decimal':-3.25,'cancel_preserved_edit':True,'one_step_undo_redo':True,'device_acceptance':False}
    (out/'native-hud-probe.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
   else:bpy.ops.wm.quit_blender();return None
  step+=1;return 2
 except Exception:
  import traceback
  error=traceback.format_exc()
  (out/'native-hud-error.txt').write_text(error,encoding='utf-8')
  (out/'native-hud-probe.json').write_text(json.dumps({'status':'failed','error':error,'device_acceptance':False},indent=2)+'\n',encoding='utf-8')
  bpy.ops.wm.quit_blender();return None
bpy.app.timers.register(tick,first_interval=5)
