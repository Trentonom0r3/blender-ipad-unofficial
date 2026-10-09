"""Native stock selection shapes with shared-source geometry/native font cue reconstruction.
Does not execute patched iOS GHOST/WM draw; only visual/font and native Cancel evidence.
"""
from pathlib import Path
import bpy,blf,gpu,json,subprocess,traceback,sys,tempfile,shutil,hashlib
from gpu_extras.batch import batch_for_shader
repo=Path(__file__).resolve().parents[1];out=repo/'output/ui-preview/pencil-selection-cue';out.mkdir(parents=True,exist_ok=True)
result=out/'host-selection-cue.json';result.unlink(missing_ok=True)

sys.path.insert(0,str(repo/'build'))
from test_tool_ring import ring_source
geometry_source=ring_source().replace('#pragma once','')
geometry_directory=tempfile.TemporaryDirectory(prefix='selection-cue-layout-')
geometry_folder=Path(geometry_directory.name)
geometry_exe=geometry_folder/'layout.exe'
geometry_cpp=geometry_source+r"""
#include <cstdlib>
#include <iostream>
int main(int argc,char **argv){if(argc!=9)return 2;float v[8];for(int i=0;i<8;++i)v[i]=std::atof(argv[i+1]);
auto cue=blender::ui::ipad::stroke_cue_layout(v[0],{v[1],v[2],v[3],v[4]},{v[5],v[6],v[7]});
std::cout<<"{\"fits\":"<<(cue.fits?"true":"false")<<",\"bounds\":["<<cue.bounds.xmin<<","<<cue.bounds.xmax<<","<<cue.bounds.ymin<<","<<cue.bounds.ymax<<"],\"rows\":[";
for(int i=0;i<3;++i){if(i)std::cout<<",";auto r=cue.lines[i];std::cout<<"["<<r.xmin<<","<<r.xmax<<","<<r.ymin<<","<<r.ymax<<"]";}std::cout<<"]}";}
"""
(geometry_folder/'layout.cc').write_text(geometry_cpp,encoding='utf-8')
compiler=shutil.which('clang++') or 'C:/Program Files/LLVM/bin/clang++.exe'
subprocess.run([compiler,'-std=c++17',str(geometry_folder/'layout.cc'),'-o',str(geometry_exe)],check=True)

area=next(a for a in bpy.context.window.screen.areas if a.type=='VIEW_3D');region=next(r for r in area.regions if r.type=='WINDOW');window=bpy.context.window
bpy.context.preferences.view.show_splash=False;bpy.context.preferences.view.show_tooltips=False
step=0;cue=None;records=[];geometry=None;original_selection=None
font=0
scale=bpy.context.preferences.system.ui_scale
points=bpy.context.preferences.ui_styles[0].widget.points
blf.size(font,points*scale)
def refresh_geometry():
 global geometry
 lines=(cue,'Lift to apply','Two-finger drag to cancel')
 widths=[blf.dimensions(font,t)[0] for t in lines]
 tools=next((r for r in area.regions if r.type=='TOOLS'),None)
 x=region.x+(tools.width if tools else 0)
 values=[20*scale,x,region.x+region.width,region.y,region.y+region.height,*widths]
 geometry=json.loads(subprocess.check_output([str(geometry_exe),*map(str,values)],text=True))
 assert geometry['fits']
draw_error=None;draw_frames=0
def draw_cue():
 if not cue or not geometry:return
 x0,x1,y0,y1=geometry['bounds'];x0-=region.x;x1-=region.x;y0-=region.y;y1-=region.y
 radius=12*scale
 import math
 verts=[]
 for cx,cy,base in [(x1-radius,y1-radius,0),(x0+radius,y1-radius,90),(x0+radius,y0+radius,180),(x1-radius,y0+radius,270)]:
  for i in range(9):
   angle=math.radians(base+i*90/8);verts.append((cx+math.cos(angle)*radius,cy+math.sin(angle)*radius))
 shader=gpu.shader.from_builtin('UNIFORM_COLOR')
 color=bpy.context.preferences.themes[0].user_interface.panel_back[:3]
 gpu.state.blend_set('ALPHA');shader.bind();shader.uniform_float('color',(*color,.96))
 batch_for_shader(shader,'TRI_FAN',{'pos':verts}).draw(shader)
 blf.size(font,points*scale)
 textcolor=bpy.context.preferences.themes[0].view_3d.space.text[:3]
 blf.color(font,*textcolor,1)
 for text,row in zip((cue,'Lift to apply','Two-finger drag to cancel'),geometry['rows']):
  x0,x1,y0,y1=row;x0-=region.x;x1-=region.x;y0-=region.y;y1-=region.y
  width,height=blf.dimensions(font,text);blf.position(font,(x0+x1-width)/2,(y0+y1-height)/2,0);blf.draw(font,text)
 gpu.state.blend_set('NONE')
def paint():
 global draw_error,draw_frames
 try:
  draw_cue()
  if cue:draw_frames+=1
 except Exception:draw_error=traceback.format_exc()
handle=bpy.types.SpaceView3D.draw_handler_add(paint,(),'WINDOW','POST_PIXEL')
def event(kind,value,x,y):window.event_simulate(type=kind,value=value,x=int(x),y=int(y))
def tick():
 global step,cue,original_selection,draw_frames
 try:
  with bpy.context.temp_override(area=area,region=region):
   mode=step//6;phase=step%6
   if mode>=2:
    result.write_text(json.dumps({'status':'passed','host_version':bpy.app.version_string,'frames':records,'native_cancel_preserved_selection':True,'portable_geometry_sha256':hashlib.sha256(geometry_source.encode()).hexdigest(),
    'scope':'Actual stock native Box/Lasso shapes and scoped native Escape cancellation. Cue reconstruction uses compiled exact portable geometry and actual native font/theme; patched target native/GHOST/GPU cue ownership is not executed.','device_acceptance':False},indent=2)+'\n',encoding='utf-8')
    bpy.types.SpaceView3D.draw_handler_remove(handle,'WINDOW');bpy.ops.wm.quit_blender();return None
   x=region.x+region.width*.40;y=region.y+region.height*.45
   if phase==0:
    original_selection=sorted(o.name for o in bpy.context.selected_objects)
    bpy.ops.wm.tool_set_by_id(name='builtin.select_lasso' if mode else 'builtin.select_box')
    tool=bpy.context.workspace.tools.from_space_view3d_mode(mode='OBJECT',create=False)
    tool.operator_properties('view3d.select_lasso' if mode else 'view3d.select_box').mode='ADD' if mode else 'SET'
    window.cursor_warp(int(x),int(y));event('MOUSEMOVE','NOTHING',x,y)
   elif phase==1:
    if mode:bpy.ops.view3d.select_lasso('INVOKE_REGION_WIN',mode='ADD',use_smooth_stroke=False)
    else:bpy.ops.view3d.select_box('INVOKE_REGION_WIN',mode='SET',wait_for_input=False)
    event('MOUSEMOVE','NOTHING',x+100,y+100)
    if mode:
     for dx,dy in [(150,70),(140,-30),(20,-50),(-30,40)]:event('MOUSEMOVE','NOTHING',x+dx,y+dy)
    cue='Lasso · Add' if mode else 'Box · Replace';refresh_geometry();draw_frames=0;area.tag_redraw()
   elif phase==2:
    event('MOUSEMOVE','NOTHING',x+140,y+130);area.tag_redraw()
   elif phase==3:
    assert not draw_error,draw_error
    assert draw_frames>0,'Cue never actually drew'
    bpy.ops.screen.screenshot(filepath=str(out/('lasso-live-host.png' if mode else 'box-live-host.png')))
    records.append({'tool':'Lasso' if mode else 'Box','bounds':geometry['bounds'],'rows':geometry['rows'],'font_points':points*scale,'ui_scale':scale,'label':cue})
    event('ESC','PRESS',x+100,y+100);event('ESC','RELEASE',x+100,y+100);event('LEFTMOUSE','RELEASE',x+100,y+100)
   elif phase==4:
    assert sorted(o.name for o in bpy.context.selected_objects)==original_selection
    cue=None;area.tag_redraw()
   else:bpy.ops.screen.screenshot(filepath=str(out/('lasso-after-cancel.png' if mode else 'box-after-cancel.png')))
   step+=1;return 1.2
 except Exception:
  result.write_text(json.dumps({'status':'failed','error':traceback.format_exc(),'device_acceptance':False},indent=2)+'\n',encoding='utf-8')
  bpy.types.SpaceView3D.draw_handler_remove(handle,'WINDOW');bpy.ops.wm.quit_blender();return None
bpy.app.timers.register(tick,first_interval=4)
