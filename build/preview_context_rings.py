"""Real stock-host native grid fallback contents; iOS radial placement is unverified.

-- --case tools|move|mesh|lasso. Uses shipped menu draw and native UILayout.
"""
from pathlib import Path
from types import ModuleType, SimpleNamespace
import json
import sys
import bpy

repo=Path(__file__).resolve().parents[1]
case=sys.argv[sys.argv.index('--case')+1] if '--case' in sys.argv else 'move'
output=repo/'output/ui-preview/context-rings'
output.mkdir(parents=True,exist_ok=True)
path='scripts/startup/bl_ui/space_view3d_ipad.py'
patch=(repo/'patches/blender-ipad.patch').read_text(encoding='utf-8')
section=patch.split(f'diff --git a/{path} b/{path}\n',1)[1].split('diff --git ',1)[0]
source='\n'.join(line[1:] for line in section.splitlines() if line.startswith('+') and not line.startswith('+++'))
module=ModuleType('context_ring_preview')
exec(compile(source,path,'exec'),module.__dict__)
for cls in module.classes:
    bpy.utils.register_class(cls)
bpy.context.preferences.view.show_splash=False
area=next(a for a in bpy.context.window.screen.areas if a.type=='VIEW_3D')
region=next(r for r in area.regions if r.type=='WINDOW')

class GridLayout:
    def __init__(self,grid):
        object.__setattr__(self,'grid',grid)
        object.__setattr__(self,'records',[])
        object.__setattr__(self,'enabled',True)
    def __setattr__(self,name,value):
        if name=='operator_context':
            self.grid.operator_context=value
        else:
            object.__setattr__(self,name,value)
    def row(self,**kwargs):
        return self
    def column(self,**kwargs):
        return self
    def operator(self,name,**kwargs):
        cell=self.grid.column()
        cell.enabled=self.enabled
        self.records.append({'operator':name,'text':kwargs.get('text'),'active':kwargs.get('depress',False)})
        return cell.operator(name,**kwargs)
    def popover(self,**kwargs):
        self.records.append({'popover':kwargs.get('panel'),'text':kwargs.get('text')})
        return self.grid.column().popover(**kwargs)

class WM_OT_context_ring_preview(bpy.types.Operator):
    bl_idname='wm.context_ring_preview'
    bl_label='Pencil Controls · Host Native Grid Preview'
    def invoke(self,context,event):
        return context.window_manager.invoke_popup(self,width=360)
    def execute(self,context):
        return {'FINISHED'}
    def draw(self,context):
        layout=self.layout
        active=module.ToolSelectPanelHelper.tool_active_from_context(context)
        if case=='tools':
            layout.label(text='Tools · highlighted tool opens controls')
            menu=module.VIEW3D_MT_ipad_tools
        elif case=='move':
            state=module.ipad_transform_state(context)
            orientation=module.ipad_transform_orientation(context,state[3]).type
            layout.label(text='Move · '+orientation.title()+' · lift to finish')
            menu=module.VIEW3D_MT_ipad_transform_ring
        else:
            layout.label(text='Selection · '+context.mode.replace('_',' ').title())
            menu=module.VIEW3D_MT_ipad_selection_ring
        grid=layout.grid_flow(row_major=True,columns=3,even_columns=True,even_rows=True,align=False)
        grid.scale_y=2.2
        adapter=GridLayout(grid)
        menu.draw(SimpleNamespace(layout=adapter),context)
        (output/(case+'.json')).write_text(json.dumps({'host':bpy.app.version_string,'case':case,
            'layout':'native grid preview','buttons':adapter.records,'native_tool':active.idname,
            'scope':'Real host native UILayout, icons, active states and exact menu contents in a grid. Target native ring anchoring, persistent refresh/input and iPad acceptance remain unverified.'},indent=2)+'\n',encoding='utf-8')
bpy.utils.register_class(WM_OT_context_ring_preview)
step=0
def tick():
    global step
    try:
        if step==0:
            with bpy.context.temp_override(area=area,region=region):
                if case in {'move','tools'}:
                    bpy.ops.wm.tool_set_by_id(name='builtin.move')
                    bpy.ops.view3d.ipad_transform_axis(axis='X')
                    bpy.ops.view3d.ipad_transform_option(option='FINE',enabled=True)
                    bpy.ops.view3d.ipad_transform_option(option='SNAP',enabled=True)
                else:
                    if case=='mesh':
                        bpy.ops.object.mode_set(mode='EDIT')
                        bpy.ops.mesh.select_mode(type='FACE')
                    bpy.ops.view3d.ipad_selection_tool(tool='builtin.select_lasso' if case=='lasso' else 'builtin.select_box',mode='ADD')
            area.tag_redraw()
        elif step==1:
            with bpy.context.temp_override(area=area,region=region):
                bpy.context.window.cursor_warp(region.x+region.width//2,region.y+region.height//2)
                bpy.ops.wm.context_ring_preview('INVOKE_DEFAULT')
        elif step==2:
            bpy.ops.screen.screenshot(filepath=str(output/(case+'.png')))
        elif step==3:
            bpy.ops.wm.quit_blender()
            return None
        step+=1
        return 1.5
    except Exception:
        import traceback
        (output/(case+'-error.txt')).write_text(traceback.format_exc(),encoding='utf-8')
        bpy.ops.wm.quit_blender()
        return None
bpy.app.timers.register(tick,first_interval=3)
