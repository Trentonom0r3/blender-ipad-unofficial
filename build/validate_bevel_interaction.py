"""Stock host native tool/properties and geometry evidence; no touch modal proof."""
from pathlib import Path
from types import ModuleType, SimpleNamespace
import bpy
import bmesh
import json

repo=Path('D:/dev/Projects/Repos/blendpad/blender-ipad-unofficial')
patch=(repo/'patches/blender-ipad.patch').read_text(encoding='utf-8')
path='scripts/startup/bl_ui/space_view3d_ipad.py'
section=patch.split(f'diff --git a/{path} b/{path}\n',1)[1].split('diff --git ',1)[0]
source='\n'.join(line[1:] for line in section.splitlines() if line.startswith('+') and not line.startswith('+++'))
module=ModuleType('ipad_bevel_host_validation'); exec(compile(source,path,'exec'),module.__dict__)
for cls in module.classes: bpy.utils.register_class(cls)

class Layout:
    def __init__(self, records): self.records=records
    def row(self,**kwargs): return Layout(self.records)
    def column(self,**kwargs): return Layout(self.records)
    def operator(self,name,**kwargs): self.records.append(('operator',name,kwargs)); return SimpleNamespace()
    def popover(self,**kwargs): self.records.append(('popover',None,kwargs))
    def label(self,**kwargs): self.records.append(('label',None,kwargs))
    def prop(self,owner,name,**kwargs):
        assert hasattr(owner,name), name
        self.records.append(('prop',name,{'owner':owner,**kwargs}))

bpy.ops.wm.read_factory_settings(use_empty=True)
from bl_ui.space_toolsystem_toolbar import VIEW3D_PT_tools_active
VIEW3D_PT_tools_active.register_ensure()
area=next(a for a in bpy.context.window.screen.areas if a.type=='VIEW_3D')
region=next(r for r in area.regions if r.type=='WINDOW')
with bpy.context.temp_override(area=area,region=region):
    bpy.ops.mesh.primitive_cube_add()
    bpy.ops.object.mode_set(mode='EDIT')
    assert bpy.ops.wm.tool_set_by_id(name='builtin.bevel')=={'FINISHED'}
    props=module.ipad_bevel_state(bpy.context); assert props is not None
    props.segments=3; props.profile=0.65; props.offset_type='WIDTH'; props.affect='EDGES'
    props.clamp_overlap=False; props.loop_slide=False
    records=[]; module.draw_canvas_header(Layout(records))
    assert any(k=='popover' and v.get('panel')=='VIEW3D_PT_ipad_bevel' for k,n,v in records)
    assert any(k=='operator' and n=='ed.undo' for k,n,v in records)
    records=[]; module.VIEW3D_PT_ipad_bevel.draw(SimpleNamespace(layout=Layout(records)),bpy.context)
    expected={'affect','offset_type','segments','profile_type','profile','clamp_overlap','loop_slide'}
    assert expected=={n for k,n,v in records if k=='prop'}
    assert all(v['owner'].as_pointer()==props.as_pointer() for k,n,v in records if k=='prop')
    assert props.segments==3 and abs(props.profile-0.65)<1e-5 and props.offset_type=='WIDTH'
    assert not props.clamp_overlap and not props.loop_slide
    assert hasattr(props,'harden_normals') and hasattr(props,'miter_outer') and hasattr(props,'spread')

    def signature():
        bm=bmesh.from_edit_mesh(bpy.context.edit_object.data)
        return (len(bm.verts),len(bm.edges),len(bm.faces),
                tuple(sorted(tuple(round(float(v),6) for v in vert.co) for vert in bm.verts)))
    bpy.ops.ed.undo_push(message='Bevel baseline'); baseline=signature()
    assert bpy.ops.mesh.bevel('EXEC_DEFAULT',offset=0.2,segments=3,profile=0.65,
                             offset_type='WIDTH',affect='EDGES',clamp_overlap=False,
                             loop_slide=False)=={'FINISHED'}
    bpy.ops.ed.undo_push(message='Accepted Bevel'); accepted=signature()
    assert accepted!=baseline and accepted[0]>baseline[0]
    assert bpy.ops.ed.undo()=={'FINISHED'} and signature()==baseline
    assert bpy.ops.ed.redo()=={'FINISHED'} and signature()==accepted
    bpy.ops.object.mode_set(mode='OBJECT')
    assert module.ipad_bevel_state(bpy.context) is None

report={'host_blender':bpy.app.version_string,'native_bevel_tool_properties_and_header':True,
        'popover_edits_original_native_tool_properties':True,'advanced_native_properties_retained':True,
        'native_width_segments_profile_exec_geometry':True,'explicit_headless_undo_redo_checkpoints':True,
        'native_touch_modal_not_executed':True,'visual_preview':False,'device_acceptance':False}
destination=repo/'output/ui-preview/bevel-interaction-validation.json'
destination.write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8');print(json.dumps(report))
