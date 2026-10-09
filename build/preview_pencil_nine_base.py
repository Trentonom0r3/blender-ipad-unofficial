"""Actual stock native widgets for exact Base/More Tools contents.
The grid permits native UI/icons/state review; source-executing geometry checks
establish equal radial targets separately. This does not render patched iOS rings.
"""
from pathlib import Path
import bpy,json,types,traceback,hashlib,zipfile
from bl_ui.space_toolsystem_common import ToolSelectPanelHelper
repo=Path(__file__).resolve().parents[1]
out=repo/'output/ui-preview/pencil-nine-base';out.mkdir(parents=True,exist_ok=True)
patch=(repo/'patches/blender-ipad.patch').read_text(encoding='utf-8')
path='scripts/startup/bl_ui/space_view3d_ipad.py'
part=patch.split(f'diff --git a/{path} b/{path}\n',1)[1].split('diff --git ',1)[0]
source='\n'.join(l[1:] for l in part.splitlines() if l.startswith('+') and not l.startswith('+++'))+'\n'
ipa=Path('C:/Users/tjerf/AppData/Local/Temp/blender-ipad-run-37847847360/Blender-iPad-Unofficial.ipa')
with zipfile.ZipFile(ipa) as z:
 toolbar=z.read(next(n for n in z.namelist() if n.endswith('/scripts/startup/bl_ui/space_toolsystem_toolbar.py')))
target=types.ModuleType('target_nine_native_tools');target.__package__='bl_ui';exec(compile(toolbar,'pinned-toolbar.py','exec'),target.__dict__)
original=ToolSelectPanelHelper._tool_class_from_space_type
ToolSelectPanelHelper._tool_class_from_space_type=staticmethod(lambda space:target.VIEW3D_PT_tools_active if space=='VIEW_3D' else original(space))
target.VIEW3D_PT_tools_active.register()
module=types.ModuleType('nine_base_candidate');exec(compile(source,path,'exec'),module.__dict__)
for cls in module.classes:bpy.utils.register_class(cls)
bpy.context.preferences.view.show_splash=False;bpy.context.preferences.view.show_tooltips=False
area=next(a for a in bpy.context.window.screen.areas if a.type=='VIEW_3D');region=next(r for r in area.regions if r.type=='WINDOW')
class Grid:
 def __init__(self,grid,records):self.grid=grid;self.records=records;self.enabled=True
 def column(self):return self
 def row(self):return Grid(self.grid,self.records)
 def operator(self,name,**kw):
  cell=self.grid.column();cell.enabled=self.enabled
  self.records.append({'operator':name,'enabled':self.enabled,**kw})
  return cell.operator(name,**kw)
class WM_OT_ipad_nine_host(bpy.types.Operator):
 bl_idname='wm.ipad_nine_host';bl_label='Nine-slot Base · native widget review'
 def invoke(self,C,event):return C.window_manager.invoke_popup(self,width=1040)
 def execute(self,C):return {'FINISHED'}
 def draw(self,C):
  row=self.layout.row();records=[]
  for caption,cls in [('Base · exactly nine',module.VIEW3D_MT_ipad_base_ring),('More Tools · remaining native tools',module.VIEW3D_MT_ipad_tool_inventory)]:
   col=row.column();col.label(text=caption)
   cells=col.grid_flow(row_major=True,columns=3,even_columns=True,even_rows=True,align=False);cells.scale_y=1.8
   grid=Grid(cells,records)
   if cls==module.VIEW3D_MT_ipad_base_ring:cls.draw(types.SimpleNamespace(layout=grid),C)
   else:
    remaining=module.ipad_more_tool_inventory(C)
    active=ToolSelectPanelHelper.tool_active_from_context(C);receipt=module.ipad_native_inventory_receipt(C)
    labels={name:label for label,name,_ in module.IPAD_RADIAL_TOOLS}
    for t in remaining[:9]:
     p=grid.operator('view3d.ipad_native_tool',text=labels.get(t.idname,t.label),depress=active.idname==t.idname,**module.ipad_native_tool_icon(t));p.name=t.idname;p.inventory=receipt;p.expected_tool=active.idname
   col.label(text='Mode: '+C.mode)
  self.layout.label(text='Stock native UI/icons/states; radial geometry checked separately')
bpy.utils.register_class(WM_OT_ipad_nine_host)
frames=[];step=0;modes=[('OBJECT','object'),('SCULPT','sculpt'),('VERTEX_PAINT','paint')]
def tick():
 global step
 try:
  with bpy.context.temp_override(area=area,region=region):
   index=step//3;phase=step%3
   if index>=len(modes):
    (out/'native-widgets.json').write_text(json.dumps({'status':'passed','host_version':bpy.app.version_string,'python_sha256':hashlib.sha256(source.encode()).hexdigest(),'frames':frames,'scope':'Actual stock native widget grid/icons/enabled states; patched radial placement/GPU/UIKit and on-device comfort are not executed.','device_acceptance':False},indent=2)+'\n',encoding='utf-8')
    bpy.ops.wm.quit_blender();return None
   mode,label=modes[index]
   if phase==0:
    if bpy.context.object.mode!='OBJECT':bpy.ops.object.mode_set(mode='OBJECT')
    if mode!='OBJECT':bpy.ops.object.mode_set(mode=mode)
    area.tag_redraw()
   elif phase==1:
    bpy.context.window.cursor_warp(region.x+region.width//2,region.y+region.height//2)
    bpy.ops.wm.ipad_nine_host('INVOKE_DEFAULT')
   else:
    bpy.ops.screen.screenshot(filepath=str(out/(label+'-native-widgets.png')))
    frames.append({'mode':bpy.context.mode,'base_slots':9,'available_base':sorted(module.IPAD_BASE_TOOL_IDS & {t.idname for t in module.ipad_native_tool_inventory(bpy.context)}),'more_tools':len(module.ipad_more_tool_inventory(bpy.context))})
    # Ordinary native popup cancel, with no scene/history action.
    bpy.context.window.event_simulate(type='ESC',value='PRESS')
    bpy.context.window.event_simulate(type='ESC',value='RELEASE')
   step+=1;return 1.4
 except Exception:
  (out/'native-widgets.json').write_text(json.dumps({'status':'failed','error':traceback.format_exc(),'frames':frames},indent=2),encoding='utf-8')
  bpy.ops.wm.quit_blender();return None
bpy.app.timers.register(tick,first_interval=4)
