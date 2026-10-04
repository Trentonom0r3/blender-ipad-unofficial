"""Actual stock Blender UILayout screenshots, with a target-only property adapter.

The shelf is a host popup, not the target iOS WINDOW block. The finger flag is
recorded instead of assigned to stock wm.call_menu_pie. No popup/input proof.
"""
from pathlib import Path
from types import ModuleType
import hashlib
import json
import subprocess
import sys
import bpy

repo=Path(__file__).resolve().parents[1]
case=sys.argv[sys.argv.index('--case')+1] if '--case' in sys.argv else 'move'
output=Path(sys.argv[sys.argv.index('--output')+1]) if '--output' in sys.argv else repo/'output/ui-preview/compact-shelf'
output.mkdir(parents=True,exist_ok=True)
path='scripts/startup/bl_ui/space_view3d_ipad.py'
patch=(subprocess.check_output(['git','show','d64e64c:patches/blender-ipad.patch'],cwd=repo).decode()
       if case=='before' else (repo/'patches/blender-ipad.patch').read_text(encoding='utf-8'))
section=patch.split(f'diff --git a/{path} b/{path}\n',1)[1].split('diff --git ',1)[0]
source='\n'.join(line[1:] for line in section.splitlines() if line.startswith('+') and not line.startswith('+++'))
module=ModuleType('compact_shelf_preview')
exec(compile(source,path,'exec'),module.__dict__)
for cls in module.classes:bpy.utils.register_class(cls)
records=[]
class NativeProps:
    def __init__(self,props):object.__setattr__(self,'props',props)
    def __setattr__(self,key,value):
        if key=='ipad_touch_targets':records.append({'modeled_native_flag':key,'value':value})
        else:setattr(self.props,key,value)
class NativeLayout:
    def __init__(self,layout):object.__setattr__(self,'layout',layout)
    def __getattr__(self,key):return getattr(self.layout,key)
    def __setattr__(self,key,value):setattr(self.layout,key,value)
    def column(self,**kw):return NativeLayout(self.layout.column(**kw))
    def row(self,**kw):return NativeLayout(self.layout.row(**kw))
    def grid_flow(self,**kw):return NativeLayout(self.layout.grid_flow(**kw))
    def operator(self,name,**kw):
        props=self.layout.operator(name,**kw)
        return NativeProps(props) if name=='wm.call_menu_pie' else props

bpy.context.preferences.view.show_splash=False
area=next(a for a in bpy.context.window.screen.areas if a.type=='VIEW_3D')
region=next(r for r in area.regions if r.type=='WINDOW')
width=720 if case in {'before','expanded'} else 192 if case in {'narrow','narrow-mixed','expanded-narrow'} else 320
class WM_OT_compact_shelf_preview(bpy.types.Operator):
    bl_idname='wm.compact_shelf_preview'
    bl_label='Editing Controls Â· Host Layout Preview'
    def invoke(self,context,event):return context.window_manager.invoke_popup(self,width=width)
    def draw(self,context):module.draw_editing_shelf(NativeLayout(self.layout),context,width_units=width/20)
    def execute(self,context):return {'FINISHED'}
bpy.utils.register_class(WM_OT_compact_shelf_preview)
step=0
def tick():
    global step
    try:
        if step==0:
            with bpy.context.temp_override(area=area,region=region):
                bpy.ops.wm.tool_set_by_id(name='builtin.move')
                active=module.ToolSelectPanelHelper.tool_active_from_context(bpy.context)
                active.operator_properties('transform.translate').constraint_axis=(True,False,False)
                active.operator_properties('transform.translate').use_accurate=True
                bpy.context.tool_settings.use_snap=True
                if case in {'mesh','narrow','narrow-mixed','expanded-narrow'}:
                    bpy.ops.object.mode_set(mode='EDIT')
                    bpy.ops.view3d.ipad_selection_tool(tool='builtin.select_box',mode='ADD')
                if case=='narrow-mixed':bpy.context.tool_settings.mesh_select_mode=(True,True,True)
                if case=='unsupported':bpy.ops.wm.tool_set_by_id(name='builtin.cursor')
                if case in {'expanded','expanded-narrow'}:bpy.ops.view3d.ipad_shelf_toggle(expanded=True)
            area.tag_redraw()
        elif step==1:
            with bpy.context.temp_override(area=area,region=region):
                bpy.context.window.cursor_warp(region.x+region.width//2,region.y+250)
                bpy.ops.wm.compact_shelf_preview('INVOKE_DEFAULT')
        elif step==2:
            bpy.ops.screen.screenshot(filepath=str(output/(case+'.png')))
            (output/(case+'.json')).write_text(json.dumps({'host':bpy.app.version_string,'case':case,
                'layout_width':width,'canonical_patch_sha256':hashlib.sha256(patch.encode()).hexdigest(),
                'modeled_flags':records,
                'scope':'Actual host native UILayout/RNA in temporary popup; target-only finger flag recorded. iOS anchor, compositor, gesture input and device acceptance unverified.'},indent=2)+'\n',encoding='utf-8')
        elif step==3:
            bpy.ops.wm.quit_blender();return None
        step+=1;return 1.5
    except Exception:
        import traceback
        (output/(case+'-error.txt')).write_text(traceback.format_exc(),encoding='utf-8')
        bpy.ops.wm.quit_blender();return None
bpy.app.timers.register(tick,first_interval=3)
