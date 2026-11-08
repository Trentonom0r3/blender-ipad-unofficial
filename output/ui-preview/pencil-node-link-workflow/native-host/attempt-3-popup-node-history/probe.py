"""Disposable installed stock GUI: real linked search callback and native placement/history."""
import bpy,json,tempfile,traceback
from pathlib import Path
from datetime import datetime,timezone
OUT=Path(__file__).resolve().parent
MAT='DisposableNativeSearchLink'
bpy.context.preferences.use_preferences_save=False
bpy.context.preferences.filepaths.use_auto_save_temporary_files=False
bpy.context.preferences.filepaths.temporary_directory=tempfile.mkdtemp(prefix='native-node-popup-audit-')+'/'
bpy.context.preferences.view.show_splash=False
bpy.context.preferences.view.show_tooltips=False
STEP=0;POINTS={}
D={'status':'running','started_utc':datetime.now(timezone.utc).isoformat(),'host':{'version':bpy.app.version_string,'build_hash':bpy.app.build_hash.decode(),'background':bpy.app.background},'scope':'Installed stock Windows GUI actual native WM/search/graph/placement/UndoRedo. No target5.0/iOS/UIKit/Pencil/device proof. Factory startup, isolated tree and actual event_simulate, native ed.undo_push baseline.','observations':[],'events':[],'errors':[]}
def write():(OUT/'result.json').write_text(json.dumps(D,indent=2)+'\n',encoding='utf-8')
def ctx():
 w=bpy.context.window_manager.windows[0];a=next(a for a in w.screen.areas if a.type=='NODE_EDITOR');r=next(r for r in a.regions if r.type=='WINDOW');return w,a,r
def state(label):
 w,a,r=ctx();t=bpy.data.materials[MAT].node_tree
 d={'label':label,'graph':{'nodes':sorted((n.name,n.bl_idname) for n in t.nodes),'links':[(l.from_node.name,l.from_socket.identifier,l.to_node.name,l.to_socket.identifier,l.is_valid) for l in t.links]},'locations':{n.name:list(n.location) for n in t.nodes},'modal_operators':[o.bl_idname for o in w.modal_operators],'history':[o.bl_idname for o in bpy.context.window_manager.operators][-8:]};D['observations'].append(d)
 with bpy.context.temp_override(window=w,area=a,region=r):bpy.ops.screen.screenshot(filepath=str(OUT/(label+'.png')))
 return d
def send(typ,val,p=None,text=''):
 w,_,_=ctx();p=p or POINTS['empty'];e=w.event_simulate(type=typ,value=val,x=p[0],y=p[1],unicode=text);D['events'].append({'type':typ,'value':val,'unicode':text,'xy':[e.mouse_x,e.mouse_y],'tablet':e.is_tablet})
def tick():
 global STEP,POINTS
 try:
  w=bpy.context.window_manager.windows[0]
  if STEP==0:
   a=next(a for a in w.screen.areas if a.type=='VIEW_3D');a.type='NODE_EDITOR';a.spaces.active.tree_type='ShaderNodeTree';a.spaces.active.shader_type='OBJECT';a.spaces.active.show_region_ui=False;a.spaces.active.show_region_toolbar=False
   m=bpy.data.materials.new(MAT);m.use_nodes=True;bpy.context.active_object.data.materials.clear();bpy.context.active_object.data.materials.append(m);t=m.node_tree;t.nodes.clear()
   n=t.nodes.new('ShaderNodeValue');n.name='SourceA';n.label='Source A';n.location=(-250,150);n.select=False
   n=t.nodes.new('ShaderNodeMath');n.name='SinkB';n.label='Destination B';n.location=(150,150);n.select=False
  elif STEP==1:
   w,a,r=ctx()
   with bpy.context.temp_override(window=w,area=a,region=r):bpy.ops.node.view_all()
  elif STEP==2:
   w,a,r=ctx();n=bpy.data.materials[MAT].node_tree.nodes['SourceA'];dpi=n.dimensions.x/n.width
   def p(x,y):
    q=r.view2d.view_to_region(x,y,clip=True);return (r.x+q[0],r.y+q[1])
   POINTS={'source':p(n.location.x*dpi+n.dimensions.x,n.location.y*dpi-34*dpi),'empty':p(15*dpi,-80*dpi),'place':p(-30*dpi,80*dpi)};D['points']=POINTS
   with bpy.context.temp_override(window=w,area=a,region=r):D['baseline_push']=list(bpy.ops.ed.undo_push(message='Native link search baseline'))
   state('baseline')
  elif STEP==3:send('MOUSEMOVE','NOTHING',POINTS['source']);send('LEFTMOUSE','PRESS',POINTS['source'])
  elif STEP==4:send('MOUSEMOVE','NOTHING',(POINTS['source'][0]+12,POINTS['source'][1]))
  elif STEP==5:
   assert 'NODE_OT_link' in state('link_acquired')['modal_operators'];send('MOUSEMOVE','NOTHING',POINTS['empty'])
  elif STEP==6:send('LEFTMOUSE','RELEASE')
  elif STEP==7:
   state('native_search_open')
   for ch in 'math':send(ch.upper(),'PRESS',text=ch);send(ch.upper(),'RELEASE')
  elif STEP==8:state('native_search_filtered');send('RET','PRESS');send('RET','RELEASE')
  elif STEP==9:state('native_choice_callback');send('MOUSEMOVE','NOTHING',POINTS['place'])
  elif STEP==10:state('native_placement_before_confirm');send('LEFTMOUSE','PRESS',POINTS['place']);send('LEFTMOUSE','RELEASE',POINTS['place'])
  elif STEP==11:state('native_placement_finished')
  elif STEP==12:
   w,a,r=ctx()
   with bpy.context.temp_override(window=w,area=a,region=r):D['undo_result']=list(bpy.ops.ed.undo())
  elif STEP==13:
   state('after_native_undo');w,a,r=ctx()
   with bpy.context.temp_override(window=w,area=a,region=r):D['redo_result']=list(bpy.ops.ed.redo())
  elif STEP==14:state('after_native_redo');D['status']='completed';write();bpy.ops.wm.quit_blender();return None
  STEP+=1;write();return .65
 except Exception:
  D['status']='failed';D['errors'].append(traceback.format_exc());write();bpy.ops.wm.quit_blender();return None
bpy.app.timers.register(tick,first_interval=2)