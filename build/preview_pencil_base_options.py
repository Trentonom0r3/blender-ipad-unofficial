"""Stock-host native UILayout comparison; target radial placement/input unverified."""
from pathlib import Path
from types import ModuleType, SimpleNamespace
import hashlib
import json
import bpy

repo=Path(__file__).resolve().parents[1]
out=repo/'output/ui-preview/pencil-base-options'
out.mkdir(parents=True,exist_ok=True)
patch=(repo/'patches/blender-ipad.patch').read_text(encoding='utf-8')
path='scripts/startup/bl_ui/space_view3d_ipad.py'
section=patch.split(f'diff --git a/{path} b/{path}\n',1)[1].split('diff --git ',1)[0]
source='\n'.join(l[1:] for l in section.splitlines() if l.startswith('+') and not l.startswith('+++'))+'\n'
module=ModuleType('pencil_base_options_preview')
exec(compile(source,path,'exec'),module.__dict__)
for cls in module.classes:
    bpy.utils.register_class(cls)
bpy.context.preferences.view.show_splash=False
bpy.context.preferences.view.show_tooltips=False
area=next(a for a in bpy.context.window.screen.areas if a.type=='VIEW_3D')
region=next(r for r in area.regions if r.type=='WINDOW')

class Grid:
    def __init__(self,grid):
        self.grid=grid;self.records=[];self.enabled=True
    def column(self): return self
    def row(self): return self
    def operator(self,name,**kwargs):
        cell=self.grid.column();cell.enabled=self.enabled
        self.records.append({'operator':name,**kwargs})
        return cell.operator(name,**kwargs)

class WM_OT_pencil_base_options_preview(bpy.types.Operator):
    bl_idname='wm.pencil_base_options_preview'
    bl_label='Pencil Base · current tool controls'
    def invoke(self,context,event):return context.window_manager.invoke_popup(self,width=800)
    def execute(self,context):return {'FINISHED'}
    def draw(self,context):
        row=self.layout.row()
        results={}
        for before in (True,False):
            column=row.column()
            column.label(text='Before · Base' if before else 'After · current tool in Base')
            cells=column.grid_flow(row_major=True,columns=3,even_columns=True,even_rows=True,align=False)
            cells.scale_y=2.2
            grid=Grid(cells)
            shortcut=module.ipad_active_tool_options_button
            try:
                if before:module.ipad_active_tool_options_button=lambda *args:False
                module.VIEW3D_MT_ipad_base_ring.draw(SimpleNamespace(layout=grid),context)
            finally:module.ipad_active_tool_options_button=shortcut
            results['before' if before else 'after']=grid.records
        assert len(results['before'])==5 and len(results['after'])==6
        report={'host':bpy.app.version_string,'patch_sha256':hashlib.sha256(patch.encode()).hexdigest(),
                'interaction_python_sha256':hashlib.sha256(source.encode()).hexdigest(),
                'native_active_tool':module.ToolSelectPanelHelper.tool_active_from_context(context).idname,
                'layout':'actual stock-host native grid content comparison',
                'menus':results,'scope':'Native UILayout/icons and exact shipped menu contents. Target circular placement/sizing/modal input and iPad comfort remain unverified.'}
        (out/'comparison.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
bpy.utils.register_class(WM_OT_pencil_base_options_preview)
step=0
def tick():
    global step
    try:
        if step==0:
            with bpy.context.temp_override(area=area,region=region):
                bpy.ops.wm.tool_set_by_id(name='builtin.move')
            area.tag_redraw()
        elif step==1:
            with bpy.context.temp_override(area=area,region=region):
                bpy.context.window.cursor_warp(region.x+region.width//2,region.y+region.height//2)
                bpy.ops.wm.pencil_base_options_preview('INVOKE_DEFAULT')
        elif step==2:
            bpy.ops.screen.screenshot(filepath=str(out/'comparison.png'))
        else:
            bpy.ops.wm.quit_blender();return None
        step+=1;return 1.5
    except Exception:
        import traceback
        (out/'error.txt').write_text(traceback.format_exc(),encoding='utf-8')
        bpy.ops.wm.quit_blender();return None
bpy.app.timers.register(tick,first_interval=3)
