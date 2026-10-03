"""Run in factory-startup host Blender. Native owned popup lifecycle needs iOS."""
from pathlib import Path
from types import ModuleType, SimpleNamespace
import ast
import json
import bpy

repo = Path(__file__).resolve().parents[1]
path = 'scripts/startup/bl_ui/space_view3d_ipad.py'
patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
section = patch.split(f'diff --git a/{path} b/{path}\n',1)[1].split('diff --git ',1)[0]
source = '\n'.join(line[1:] for line in section.splitlines() if line.startswith('+') and not line.startswith('+++'))
module = ModuleType('context_ring_validation')
exec(compile(source,path,'exec'),module.__dict__)
for cls in module.classes:
    bpy.utils.register_class(cls)
icons = bpy.types.UILayout.bl_rna.functions['operator'].parameters['icon'].enum_items
for node in ast.walk(ast.parse(source)):
    if isinstance(node,ast.keyword) and node.arg == 'icon' and isinstance(node.value,ast.Constant):
        assert node.value.value in icons,node.value.value

class Layout:
    def __init__(self,records):
        self.records=records
        self.enabled=True
    def row(self,**kwargs):
        return self
    def column(self,**kwargs):
        return self
    def operator(self,name,**kwargs):
        props=SimpleNamespace()
        self.records.append((name,props,kwargs))
        return props
    def popover(self,**kwargs):
        self.records.append(('popover',None,kwargs))

area=next(a for a in bpy.context.window.screen.areas if a.type=='VIEW_3D')
region=next(r for r in area.regions if r.type=='WINDOW')
# Execute the shipped target resolver with modeled native region geometry.
# This checks quad/overlap policy, not target iOS layout or hit dispatch.
windows=[SimpleNamespace(type='WINDOW',x=x,y=y,width=100,height=100)
         for y in (0,100) for x in (0,100)]
view=SimpleNamespace(type='VIEW_3D',x=0,y=0,width=200,height=200,regions=windows)
model=SimpleNamespace(window=SimpleNamespace(screen=SimpleNamespace(areas=[view])),area=view,region=windows[0])
for window in windows:
    assert module.ipad_palette_target(model,window.x+50,window.y+50)==(view,window)
overlap_window=SimpleNamespace(type='WINDOW',x=40,y=40,width=100,height=100)
overlay=SimpleNamespace(type='VIEW_3D',x=40,y=40,width=100,height=100,regions=[overlap_window])
model.window.screen.areas.append(overlay)
model.area,model.region=overlay,overlap_window
assert module.ipad_palette_target(model,90,90)==(overlay,overlap_window)
model.area,model.region=view,windows[3]
assert module.ipad_palette_target(model,-100,-100)==(view,windows[3])
results=[]
with bpy.context.temp_override(area=area,region=region):
    for mode in ('OBJECT','EDIT'):
        bpy.ops.object.mode_set(mode=mode)
        for tool in ('builtin.select_box','builtin.select_lasso'):
            for action in ('SET','ADD','SUB'):
                assert bpy.ops.view3d.ipad_selection_tool(tool=tool,mode=action)=={'FINISHED'}
                assert module.VIEW3D_MT_ipad_selection_ring.poll(bpy.context)
                records=[]
                module.VIEW3D_MT_ipad_tools.draw(SimpleNamespace(layout=Layout(records)),bpy.context)
                assert len(records)==9
                assert records[0][0]=='wm.call_menu_pie' and records[0][1].name=='VIEW3D_MT_ipad_selection_ring'
                assert records[0][2]['depress'] and records[0][2]['text']=='Select…'
                records=[]
                module.VIEW3D_MT_ipad_selection_ring.draw(SimpleNamespace(layout=Layout(records)),bpy.context)
                assert len(records)==9
                assert records[0][1].name=='VIEW3D_MT_ipad_tools'
                assert [r[2]['depress'] for r in records[1:3]]==[tool=='builtin.select_box',tool=='builtin.select_lasso']
                assert [r[2]['depress'] for r in records[3:6]]==[action=='SET',action=='ADD',action=='SUB']
                if mode=='EDIT':
                    assert [r[0] for r in records[6:]]==['mesh.select_mode']*3
                    for r in records[6:]:
                        assert bpy.ops.mesh.select_mode(type=r[1].type) in ({'FINISHED'},{'CANCELLED'})
                else:
                    assert [r[0] for r in records[6:]]==['object.select_all']*3
                results.append({'mode':bpy.context.mode,'selection_tool':tool,'operation':action,'slots':9})
        # Advanced native selection modes remain truthful, without a false Replace cue.
        active=module.ToolSelectPanelHelper.tool_active_from_context(bpy.context)
        active.operator_properties('view3d.select_lasso').mode='AND'
        records=[]
        module.VIEW3D_MT_ipad_selection_ring.draw(SimpleNamespace(layout=Layout(records)),bpy.context)
        assert not any(r[2]['depress'] for r in records[3:6])
        for tool,operation,native in (('builtin.move','MOVE','transform.translate'),
                                     ('builtin.rotate','ROTATE','transform.rotate'),
                                     ('builtin.scale','SCALE','transform.resize')):
            assert bpy.ops.wm.tool_set_by_id(name=tool)=={'FINISHED'}
            assert module.VIEW3D_MT_ipad_transform_ring.poll(bpy.context)
            for value,axes in [('FREE',(False,False,False)),('X',(True,False,False)),
                               ('Y',(False,True,False)),('Z',(False,False,True))]:
                assert bpy.ops.view3d.ipad_transform_axis(axis=value)=={'FINISHED'}
                for option in ('FINE','SNAP'):
                    for enabled in (True,False):
                        assert bpy.ops.view3d.ipad_transform_option(option=option,enabled=enabled)=={'FINISHED'}
                        state=module.ipad_transform_state(bpy.context)
                        if option=='FINE':
                            assert state[0].operator_properties(native).use_accurate==enabled
                        else:
                            assert bpy.context.tool_settings.use_snap==enabled
                        records=[]
                        module.VIEW3D_MT_ipad_transform_ring.draw(SimpleNamespace(layout=Layout(records)),bpy.context)
                        assert len(records)==9 and records[0][1].name=='VIEW3D_MT_ipad_tools'
                        assert records[7][1].operation==operation
                        assert records[8][2]['panel']=='VIEW3D_PT_ipad_transform'
                        assert [r[2]['depress'] for r in records[1:5]]==[value==name for name in ('FREE','X','Y','Z')]
                        r=records[5 if option=='FINE' else 6]
                        assert r[2]['depress']==enabled and r[1].enabled==(not enabled)
                results.append({'mode':bpy.context.mode,'tool':tool,'constraint':value,'slots':9})
        # Combined Transform reads the chosen native child and its tool-local properties.
        bpy.ops.wm.tool_set_by_id(name='builtin.transform')
        combined=module.ToolSelectPanelHelper.tool_active_from_context(bpy.context)
        for action,operation in (('TRANSLATE','MOVE'),('ROTATE','ROTATE'),('SCALE','SCALE')):
            combined.gizmo_group_properties('VIEW3D_GGT_xform_gizmo').drag_action=action
            assert bpy.ops.view3d.ipad_transform_option(option='FINE',enabled=True)=={'FINISHED'}
            assert module.ipad_transform_state(bpy.context)[0].operator_properties(module.ipad_transform_state(bpy.context)[2]).use_accurate
            records=[]
            module.VIEW3D_MT_ipad_transform_ring.draw(SimpleNamespace(layout=Layout(records)),bpy.context)
            assert len(records)==9 and records[7][1].operation==operation
        combined.gizmo_group_properties('VIEW3D_GGT_xform_gizmo').drag_action='NONE'
        assert module.ipad_context_ring_name(bpy.context) is None
    bpy.ops.object.mode_set(mode='OBJECT')
    bpy.ops.wm.tool_set_by_id(name='builtin.cursor')
    assert module.ipad_context_ring_name(bpy.context) is None
    assert not module.VIEW3D_OT_ipad_transform_option.poll(bpy.context)
    assert module.VIEW3D_OT_ipad_transform_option.execute(SimpleNamespace(option='FINE',enabled=True),bpy.context)=={'CANCELLED'}
    bpy.context.window_manager.ipad_flythrough_active=True
    bpy.ops.wm.tool_set_by_id(name='builtin.move')
    assert module.ipad_context_ring_name(bpy.context) is None
    bpy.context.window_manager.ipad_flythrough_active=False

output=repo/'output/ui-preview/context-rings-validation.json'
output.parent.mkdir(parents=True,exist_ok=True)
output.write_text(json.dumps({'host':bpy.app.version_string,'checks':results,
    'native_properties':True,'advanced_selection_mode_truthful':True,'combined_child_ownership':True,
    'unsupported_context_guarded':True,
    'scope':'Actual host Python routing and native tool properties. New native popup ownership, refresh, anchoring and input require iOS.'},indent=2)+'\n',encoding='utf-8')
print('PASS: native context ring slots, active cues, selection modes, axes, precision/snapping and combined-child ownership')
