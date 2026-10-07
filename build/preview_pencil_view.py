"""Actual stock UILayout view contents; native capability mask is modeled."""
from pathlib import Path
from types import ModuleType,SimpleNamespace
import hashlib,json,bpy
repo=Path(__file__).resolve().parents[1]
output=repo/'output/ui-preview/pencil-view';output.mkdir(parents=True,exist_ok=True)
patch=(repo/'patches/blender-ipad.patch').read_text(encoding='utf-8')
path='scripts/startup/bl_ui/space_view3d_ipad.py'
section=patch.split(f'diff --git a/{path} b/{path}\n',1)[1].split('diff --git ',1)[0]
source='\n'.join(l[1:] for l in section.splitlines() if l.startswith('+') and not l.startswith('+++'))+'\n'
module=ModuleType('pencil_view_preview');exec(compile(source,path,'exec'),module.__dict__)
for cls in module.classes:bpy.utils.register_class(cls)
bpy.context.preferences.view.show_splash=False;bpy.context.preferences.view.show_tooltips=False
area=next(a for a in bpy.context.window.screen.areas if a.type=='VIEW_3D')
region=next(r for r in area.regions if r.type=='WINDOW')
class Grid:
    def __init__(self,grid,parent=None):self.grid=grid;self.parent=parent;self.enabled=True;self.operator_context=None
    def column(self):return Grid(self.grid,self)
    def row(self):return Grid(self.grid,self)
    def ipad_view_navigation_mask(self):return 7 # Stock binary lacks patched native API.
    def operator(self,name,**kwargs):
        chain=[];p=self
        while p:chain.append(p);p=p.parent
        cell=self.grid.column();cell.enabled=all(p.enabled for p in chain)
        cell.operator_context=next((p.operator_context for p in chain if p.operator_context),'INVOKE_REGION_WIN')
        return cell.operator(name,**kwargs)
class WM_OT_pencil_view_preview(bpy.types.Operator):
    bl_idname='wm.pencil_view_preview';bl_label='Pencil View · native viewport actions'
    def invoke(self,context,event):return context.window_manager.invoke_popup(self,width=650)
    def execute(self,context):return {'FINISHED'}
    def draw(self,context):
        self.layout.label(text='Current View category · exact source labels and native icons')
        cells=self.layout.grid_flow(row_major=True,columns=3,even_columns=True,even_rows=True);cells.scale_y=2.2
        module.VIEW3D_MT_ipad_view_ring.draw(SimpleNamespace(layout=Grid(cells)),context)
        self.layout.label(text='Host content preview; target ring geometry and input remain unverified.')
bpy.utils.register_class(WM_OT_pencil_view_preview)
step=0
def tick():
    global step
    try:
        if step==0:
            with bpy.context.temp_override(area=area,region=region):
                bpy.context.window.cursor_warp(region.x+region.width//2,region.y+region.height//2)
                bpy.ops.wm.pencil_view_preview('INVOKE_DEFAULT')
        elif step==1:
            bpy.ops.screen.screenshot(filepath=str(output/'view-contents.png'))
            (output/'view-contents.json').write_text(json.dumps({'host':bpy.app.version_string,
                'patch_sha256':hashlib.sha256(patch.encode()).hexdigest(),
                'scope':'Actual stock native UILayout/source contents/icons. Shared native capability mask modeled as7; target ring geometry/modal/UIKit/device unverified.'},indent=2)+'\n',encoding='utf-8')
        else:bpy.ops.wm.quit_blender();return None
        step+=1;return 1.5
    except Exception:
        import traceback
        (output/'error.txt').write_text(traceback.format_exc(),encoding='utf-8')
        bpy.ops.wm.quit_blender();return None
bpy.app.timers.register(tick,first_interval=3)
