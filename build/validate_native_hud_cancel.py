"""Stock native numeric drag/Escape/history baseline; no UIKit claim."""
from pathlib import Path
import bpy,json,traceback
out=Path(__file__).resolve().parents[1]/'output/ui-preview/pencil-corner-cancel'
out.mkdir(parents=True,exist_ok=True)
for name in ('verification.json','error.txt'):(out/name).unlink(missing_ok=True)
bpy.context.preferences.view.show_splash=False
bpy.context.preferences.view.show_tooltips=False
window=bpy.context.window
area=next(a for a in window.screen.areas if a.type=='VIEW_3D')
region=next(r for r in area.regions if r.type=='WINDOW')
step=0;values=[];start=None
def move(x,y):window.event_simulate(type='MOUSEMOVE',value='NOTHING',x=x,y=y)
def button(type,value,x=None,y=None):
    kw={'type':type,'value':value}
    if x is not None:kw.update(x=x,y=y)
    window.event_simulate(**kw)
def hud():return next(r for r in area.regions if r.type=='HUD')
def location():return list(bpy.data.objects['Cube'].location)
def tick():
    global step,start
    try:
        with bpy.context.temp_override(area=area,region=region):
            if step==0:
                assert bpy.app.use_event_simulate
                bpy.ops.wm.tool_set_by_id(name='builtin.move')
                bpy.ops.ed.undo_push(message='Native HUD cancellation baseline')
                bpy.ops.transform.translate('EXEC_REGION_WIN',True,value=(0,2,0))
                area.tag_redraw()
            elif step==1:
                h=hud();x=h.x+12;y=h.y+h.height//2
                move(x,y);button('LEFTMOUSE','PRESS',x,y);button('LEFTMOUSE','RELEASE',x,y)
            elif step==2:
                h=hud();assert h.height>80
                start=(h.x+int(h.width*.7),h.y+h.height-77)
                move(*start);button('LEFTMOUSE','PRESS',*start)
            elif step in (3,4,5):
                move(start[0]+(step-2)*32,start[1])
            elif step==6:
                values.append(location());assert abs(values[-1][1]-2)>1e-5,values
                bpy.ops.screen.screenshot(filepath=str(out/'dragging.png'))
                button('ESC','PRESS');button('ESC','RELEASE')
            elif step==7:
                values.append(location());assert abs(values[-1][1]-2)<1e-6,values
                # Release the simulated physical pointer after native Escape.
                button('LEFTMOUSE','RELEASE',start[0]+96,start[1])
            elif step==8:
                assert abs(location()[1]-2)<1e-6
                assert bpy.ops.ed.undo()=={'FINISHED'}
                assert abs(location()[1])<1e-6
                assert bpy.ops.ed.redo()=={'FINISHED'}
                assert abs(location()[1]-2)<1e-6
                h=hud();start=(h.x+int(h.width*.7),h.y+h.height-77)
                move(*start);button('LEFTMOUSE','PRESS',*start)
            elif step==9:
                button('ESC','PRESS');button('ESC','RELEASE')
            elif step==10:
                assert abs(location()[1]-2)<1e-6
                button('LEFTMOUSE','RELEASE',*start)
            elif step==11:
                assert abs(location()[1]-2)<1e-6
                assert bpy.ops.ed.undo()=={'FINISHED'};assert abs(location()[1])<1e-6
                assert bpy.ops.ed.redo()=={'FINISHED'};assert abs(location()[1]-2)<1e-6
                bpy.ops.screen.screenshot(filepath=str(out/'cancel-restored.png'))
                report={'status':'passed','host_version':bpy.app.version_string,
                    'evidence':'Actual stock native Move HUD multi-sample single-field drag and Escape restoration, no-motion Escape, one-step native Undo/Redo geometry. Pointer-cancel-to-Escape admission is source-fixture evidence, not exercised here.',
                    'samples':values,'accepted_move':[0,2,0],'one_step_undo_redo':True,
                    'no_motion_cancel':True,'device_acceptance':False}
                (out/'verification.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
            else:bpy.ops.wm.quit_blender();return None
        step+=1;return 2
    except Exception:
        error=traceback.format_exc();(out/'error.txt').write_text(error,encoding='utf-8')
        (out/'verification.json').write_text(json.dumps({'status':'failed','step':step,
            'error':error,'samples':values,'device_acceptance':False},indent=2)+'\n',encoding='utf-8')
        bpy.ops.wm.quit_blender();return None
bpy.app.timers.register(tick,first_interval=5)
