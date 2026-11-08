"""Native stock GUI graph/history observation. No production/target/device proof.
Window.event_simulate feeds actual native WM; no graph or Undo counters substitute.
All RNA graph references are reacquired after Undo/Redo. No user file is loaded.
"""
import bpy, json, tempfile, traceback, time
from pathlib import Path
from datetime import datetime, timezone
OUT=Path(__file__).resolve().parent
MAT='DisposableNativeNodeLinkGraph'
bpy.context.preferences.use_preferences_save=False
bpy.context.preferences.filepaths.use_auto_save_temporary_files=False
bpy.context.preferences.filepaths.temporary_directory=tempfile.mkdtemp(prefix='native-node-link-history-')+'/'
bpy.context.preferences.view.show_splash=False
bpy.context.preferences.view.show_tooltips=False
CASES=[
 ('fresh_confirm_history',False,'input1',True),
 ('fresh_empty_search_discard',False,'empty',False),
 ('fresh_escape',False,'escape',False),
 ('fresh_rightmouse',False,'rightmouse',False),
 ('existing_empty_history',True,'empty',True),
 ('existing_escape',True,'escape',False),
 ('existing_rightmouse',True,'rightmouse',False),
 ('existing_return_original',True,'input1',False),
 ('existing_release_without_repick',True,'release_only_input1',False),
 ('existing_rewire_history',True,'input2',True),
]
RESULT={'status':'running','started_utc':datetime.now(timezone.utc).isoformat(),'host':{'version':bpy.app.version_string,'build_hash':bpy.app.build_hash.decode(),'binary':bpy.app.binary_path,'background':bpy.app.background},'scope':'Actual installed stock Windows GUI5.1.2 native WM/socket/graph/popup/history baseline. No target5.0/iOS/UIKit/Pencil/pressure/device claim. Native event_simulate resets tablet provenance. Timed mouse samples, expanded nodes, no custom maps.','cases':[],'errors':[]}
INDEX=0; STEP=0; CURRENT=None; POINTS={}
def write():
 RESULT['updated_utc']=datetime.now(timezone.utc).isoformat()
 (OUT/'result.json').write_text(json.dumps(RESULT,indent=2)+'\n',encoding='utf-8')
def ctx():
 w=bpy.context.window_manager.windows[0]
 a=next(a for a in w.screen.areas if a.type=='NODE_EDITOR')
 r=next(r for r in a.regions if r.type=='WINDOW')
 return w,a,r
def tree():return bpy.data.materials[MAT].node_tree
def state(label):
 w,a,r=ctx();t=tree()
 d={'label':label,'region':[r.x,r.y,r.width,r.height],'view_origin':list(r.view2d.region_to_view(0,0)),'view_max':list(r.view2d.region_to_view(r.width,r.height)),'modal_operators':[o.bl_idname for o in w.modal_operators],'history':[o.bl_idname for o in bpy.context.window_manager.operators][-10:],'graph':{'nodes':sorted((n.name,n.bl_idname,n.hide) for n in t.nodes),'links':[(l.from_node.name,l.from_socket.identifier,l.to_node.name,l.to_socket.identifier,l.is_valid) for l in t.links]},'node_geometry':{n.name:{'location':list(n.location),'dimensions':list(n.dimensions),'width':n.width} for n in t.nodes}}
 CURRENT['observations'].append(d);return d
def screenshot(label):
 w,a,r=ctx()
 with bpy.context.temp_override(window=w,area=a,region=r):bpy.ops.screen.screenshot(filepath=str(OUT/(CURRENT['name']+'--'+label+'.png')))
def send(t,v,point=None):
 w,_,_=ctx();p=point or POINTS['empty']
 e=w.event_simulate(type=t,value=v,x=int(p[0]),y=int(p[1]))
 CURRENT['events'].append({'type':t,'value':v,'requested_xy':list(p),'enqueued_xy':[e.mouse_x,e.mouse_y],'prev_xy':[e.mouse_prev_x,e.mouse_prev_y],'is_tablet':e.is_tablet})
def setup(existing):
 w=bpy.context.window_manager.windows[0]
 aa=[a for a in w.screen.areas if a.type=='NODE_EDITOR']
 if not aa:
  a=next(a for a in w.screen.areas if a.type=='VIEW_3D');a.type='NODE_EDITOR'
 else:a=aa[0]
 a.spaces.active.tree_type='ShaderNodeTree';a.spaces.active.shader_type='OBJECT';a.spaces.active.show_region_ui=False;a.spaces.active.show_region_toolbar=False
 mat=bpy.data.materials.get(MAT) or bpy.data.materials.new(MAT);mat.use_nodes=True
 ob=bpy.context.active_object;ob.data.materials.clear();ob.data.materials.append(mat)
 t=mat.node_tree;t.nodes.clear()
 n=t.nodes.new('ShaderNodeValue');n.name='SourceA';n.label='Source A';n.location=(-250,150);n.select=False
 n=t.nodes.new('ShaderNodeMath');n.name='SinkB';n.label='Destination B';n.location=(150,150);n.select=False
 if existing:t.links.new(t.nodes['SourceA'].outputs[0],t.nodes['SinkB'].inputs[0])
 a.tag_redraw()
def points_and_baseline():
 global POINTS
 w,a,r=ctx();t=tree();src=t.nodes['SourceA'];dst=t.nodes['SinkB'];dpi=src.dimensions.x/src.width
 def p(x,y):
  q=r.view2d.view_to_region(x,y,clip=True);assert q[0]>25 and q[1]>25 and q[0]<r.width-25 and q[1]<r.height-25,q
  return (r.x+q[0],r.y+q[1])
 # Expanded stock native geometry, observed attempt1 screenshot. Actual NODE_OT_link
 # acquisition and destination graph endpoints below are the hit-proof controls.
 POINTS={'source':p(src.location.x*dpi+src.dimensions.x,src.location.y*dpi-34*dpi),'input1':p(dst.location.x*dpi,dst.location.y*dpi-108*dpi),'input2':p(dst.location.x*dpi,dst.location.y*dpi-130*dpi),'empty':p(15*dpi,-80*dpi)}
 CURRENT['point_policy']={'points_bottom_left_window':POINTS,'native_dpi_ratio':dpi,'expanded_only':True,'geometry_claim':'Visible center approximations from actual attempt1 native screenshot, accepted only after actual modal acquisition/endpoints. No hit-radius/occlusion generalization.'}
 with bpy.context.temp_override(window=w,area=a,region=r):
  CURRENT['baseline_undo_push']=list(bpy.ops.ed.undo_push(message='Native graph baseline '+CURRENT['name']))
 state('baseline');screenshot('baseline')
def tick():
 global INDEX,STEP,CURRENT
 try:
  if INDEX>=len(CASES):
   RESULT['status']='completed';write();bpy.ops.wm.quit_blender();return None
  name,existing,terminal,history=CASES[INDEX]
  if STEP==0:
   CURRENT={'name':name,'existing_input':existing,'terminal':terminal,'history_probe':history,'observations':[],'events':[]};RESULT['cases'].append(CURRENT);setup(existing)
  elif STEP==1:
   w,a,r=ctx()
   with bpy.context.temp_override(window=w,area=a,region=r):bpy.ops.node.view_all()
  elif STEP==2:points_and_baseline()
  elif STEP==3:
   p=POINTS['input1' if existing else 'source'];send('MOUSEMOVE','NOTHING',p);send('LEFTMOUSE','PRESS',p)
  elif STEP==4:
   state('pressed');p=POINTS['input1' if existing else 'source'];send('MOUSEMOVE','NOTHING',(p[0]+(-12 if existing else 12),p[1]))
  elif STEP==5:
   d=state('acquired');assert 'NODE_OT_link' in d['modal_operators'],('Native link not acquired',name,d)
   send('MOUSEMOVE','NOTHING',POINTS['empty'])
  elif STEP==6:
   state('moved_empty');screenshot('dragging-empty')
   if terminal in ('input1','input2'):send('MOUSEMOVE','NOTHING',POINTS[terminal])
  elif STEP==7:
   state('before_terminal')
   if terminal=='escape':send('ESC','PRESS')
   elif terminal=='rightmouse':send('RIGHTMOUSE','PRESS')
   else:send('LEFTMOUSE','RELEASE',POINTS['input1'] if terminal=='release_only_input1' else POINTS[terminal])
  elif STEP==8:
   d=state('after_terminal');screenshot('after-terminal')
   assert 'NODE_OT_link' not in d['modal_operators'],('Native link still running after terminal',name,d)
   if terminal in ('escape','rightmouse'):
    send('ESC' if terminal=='escape' else 'RIGHTMOUSE','RELEASE');send('LEFTMOUSE','RELEASE')
   else:send('ESC','PRESS') # Discard search UI, if delivered; otherwise inert baseline.
  elif STEP==9:
   state('after_popup_or_tail_cleanup');screenshot('after-cleanup');send('ESC','RELEASE')
  elif STEP==10:
   if history:
    w,a,r=ctx()
    with bpy.context.temp_override(window=w,area=a,region=r):CURRENT['undo_result']=list(bpy.ops.ed.undo())
   else:state('final')
  elif STEP==11:
   if history:
    state('after_native_undo');screenshot('after-undo');w,a,r=ctx()
    with bpy.context.temp_override(window=w,area=a,region=r):CURRENT['redo_result']=list(bpy.ops.ed.redo())
  elif STEP==12:
   if history:state('after_native_redo');screenshot('after-redo')
   CURRENT['status']='observed';INDEX+=1;STEP=-1
  STEP+=1;write();return .45
 except Exception:
  RESULT['status']='failed';RESULT['errors'].append(traceback.format_exc());write();bpy.ops.wm.quit_blender();return None
bpy.app.timers.register(tick,first_interval=2.0)