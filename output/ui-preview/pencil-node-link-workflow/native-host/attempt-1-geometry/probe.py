"""Disposable installed stock GUI socket geometry; no user file or production edit."""
import bpy, json, tempfile, traceback
from pathlib import Path
from datetime import datetime, timezone
OUT=Path(__file__).resolve().parent
bpy.context.preferences.use_preferences_save=False
bpy.context.preferences.filepaths.use_auto_save_temporary_files=False
bpy.context.preferences.filepaths.temporary_directory=tempfile.mkdtemp(prefix='node-link-graph-audit-')+'/'
bpy.context.preferences.view.show_splash=False
STEP=0
RESULT={'started':datetime.now(timezone.utc).isoformat(),'host':{'version':bpy.app.version_string,'build_hash':bpy.app.build_hash.decode(),'background':bpy.app.background},'log':[]}
def tick():
 global STEP
 try:
  w=bpy.context.window_manager.windows[0]
  if STEP==0:
   a=next(a for a in w.screen.areas if a.type=='VIEW_3D')
   a.type='NODE_EDITOR'; a.spaces.active.tree_type='ShaderNodeTree'; a.spaces.active.shader_type='OBJECT'
   a.spaces.active.show_region_ui=False; a.spaces.active.show_region_toolbar=False
   mat=bpy.data.materials.new('DisposableNodeLinkGraph');mat.use_nodes=True
   bpy.context.active_object.data.materials.clear();bpy.context.active_object.data.materials.append(mat)
   t=mat.node_tree;t.nodes.clear()
   n=t.nodes.new('ShaderNodeValue');n.name='SourceA';n.label='Source A';n.location=(-250,150)
   n=t.nodes.new('ShaderNodeMath');n.name='SinkB';n.label='Destination B';n.location=(150,150)
  elif STEP==1:
   a=next(a for a in w.screen.areas if a.type=='NODE_EDITOR');r=next(r for r in a.regions if r.type=='WINDOW')
   with bpy.context.temp_override(window=w,area=a,region=r):bpy.ops.node.view_all()
  elif STEP==2:
   a=next(a for a in w.screen.areas if a.type=='NODE_EDITOR');r=next(r for r in a.regions if r.type=='WINDOW');t=a.spaces.active.edit_tree
   RESULT['geometry']={'window':[w.width,w.height],'region':[r.x,r.y,r.width,r.height],'view_origin':list(r.view2d.region_to_view(0,0)),'view_max':list(r.view2d.region_to_view(r.width,r.height)),'nodes':{n.name:{'location':list(n.location),'dimensions':list(n.dimensions),'width':n.width,'inputs':[(s.identifier,s.name,s.hide,s.enabled) for s in n.inputs],'outputs':[(s.identifier,s.name,s.hide,s.enabled) for s in n.outputs]} for n in t.nodes}}
   with bpy.context.temp_override(window=w,area=a,region=r):bpy.ops.screen.screenshot(filepath=str(OUT/'native-geometry.png'))
   RESULT['status']='completed';(OUT/'result.json').write_text(json.dumps(RESULT,indent=2)+'\n',encoding='utf-8')
   bpy.ops.wm.quit_blender();return None
  STEP+=1;return 1.0
 except Exception:
  RESULT['status']='failed';RESULT['error']=traceback.format_exc();(OUT/'result.json').write_text(json.dumps(RESULT,indent=2)+'\n',encoding='utf-8');bpy.ops.wm.quit_blender();return None
bpy.app.timers.register(tick,first_interval=2.0)