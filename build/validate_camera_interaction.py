"""Stock host viewport-camera and native control evidence; no touch lifecycle proof."""
from pathlib import Path
from types import ModuleType, SimpleNamespace
from mathutils import Euler
import bpy
import json
import tempfile

repo=Path('D:/dev/Projects/Repos/blendpad/blender-ipad-unofficial')
patch=(repo/'patches/blender-ipad.patch').read_text(encoding='utf-8');path='scripts/startup/bl_ui/space_view3d_ipad.py'
section=patch.split(f'diff --git a/{path} b/{path}\n',1)[1].split('diff --git ',1)[0]
source='\n'.join(line[1:] for line in section.splitlines() if line.startswith('+') and not line.startswith('+++'))
module=ModuleType('ipad_camera_host_validation');exec(compile(source,path,'exec'),module.__dict__)
for cls in module.classes: bpy.utils.register_class(cls)

class Layout:
    def __init__(self,records,enabled=True): self.records=records;self.enabled=enabled
    def row(self,**kwargs): return Layout(self.records,self.enabled)
    def column(self,**kwargs): return Layout(self.records,self.enabled)
    def operator(self,name,**kwargs): self.records.append(('operator',name,None,self.enabled,kwargs));return SimpleNamespace()
    def popover(self,**kwargs): self.records.append(('popover',None,None,self.enabled,kwargs))
    def label(self,**kwargs): self.records.append(('label',None,None,self.enabled,kwargs))
    def separator(self): pass
    def prop(self,owner,name,**kwargs):
        assert hasattr(owner,name),name
        self.records.append(('prop',name,owner,self.enabled,kwargs))

def view_context():
    area=next(a for a in bpy.context.window.screen.areas if a.type=='VIEW_3D')
    region=next(r for r in area.regions if r.type=='WINDOW')
    return dict(area=area,region=region)

def matrix(name): return tuple(tuple(round(float(value),5) for value in row) for row in bpy.data.objects[name].matrix_world)

bpy.ops.wm.read_factory_settings(use_empty=True)
from bl_ui.space_toolsystem_toolbar import VIEW3D_PT_tools_active
VIEW3D_PT_tools_active.register_ensure()
scene_cam=bpy.data.objects.new('SceneCamera',bpy.data.cameras.new('SceneCameraData'))
local_cam=bpy.data.objects.new('LocalCamera',bpy.data.cameras.new('LocalCameraData'))
bpy.context.scene.collection.objects.link(scene_cam);bpy.context.scene.collection.objects.link(local_cam)
bpy.context.scene.camera=scene_cam
with bpy.context.temp_override(**view_context()):
    space=bpy.context.space_data;space.use_local_camera=True;space.camera=local_cam
    local_cam.data.lens=85;scene_cam.data.lens=35
    state=module.ipad_camera_state(bpy.context);assert state[1]==local_cam
    records=[];module.draw_canvas_header(Layout(records))
    assert any(k=='popover' and values.get('panel')=='VIEW3D_PT_ipad_camera' for k,n,o,e,values in records)
    records=[];module.VIEW3D_PT_ipad_camera.draw(SimpleNamespace(layout=Layout(records)),bpy.context)
    assert any(k=='prop' and n=='lens' and o==local_cam.data for k,n,o,e,v in records)
    assert not any(k=='prop' and o==scene_cam.data for k,n,o,e,v in records)
    local_cam.data.type='ORTHO';records=[]
    module.VIEW3D_PT_ipad_camera.draw(SimpleNamespace(layout=Layout(records)),bpy.context)
    assert any(k=='prop' and n=='ortho_scale' and o==local_cam.data for k,n,o,e,v in records)
    assert not any(k=='prop' and n=='lens' for k,n,o,e,v in records)
    local_cam.data.type='PERSP'
    # Local camera remains useful with no scene camera.
    bpy.context.scene.camera=None
    assert bpy.ops.view3d.view_camera()=={'FINISHED'}
    assert space.region_3d.view_perspective=='CAMERA' and space.camera==local_cam
    records=[];module.VIEW3D_PT_ipad_camera.draw(SimpleNamespace(layout=Layout(records)),bpy.context)
    assert any(k=='operator' and n=='view3d.view_camera' and v['text']=='Leave Camera View' for k,n,o,e,v in records)
    assert bpy.ops.view3d.view_camera()=={'FINISHED'}
    bpy.context.scene.camera=scene_cam
    space.region_3d.view_perspective='PERSP';space.region_3d.view_location=(3,2,1)
    space.region_3d.view_rotation=Euler((0.9,0.2,0.6)).to_quaternion();space.region_3d.view_distance=8
    assert bpy.ops.view3d.camera_to_view.poll()

bpy.ops.ed.undo_push(message='Camera baseline');baseline=matrix('LocalCamera');scene_before=matrix('SceneCamera')
with bpy.context.temp_override(**view_context()): assert bpy.ops.view3d.camera_to_view()=={'FINISHED'}
bpy.ops.ed.undo_push(message='Accepted camera alignment');aligned=matrix('LocalCamera')
assert aligned!=baseline and matrix('SceneCamera')==scene_before
assert bpy.ops.ed.undo()=={'FINISHED'} and matrix('LocalCamera')==baseline
assert bpy.ops.ed.redo()=={'FINISHED'} and matrix('LocalCamera')==aligned

# Resolve fresh RNA after native MemFile Undo; never retain old owner wrappers.
with bpy.context.temp_override(**view_context()):
    space=bpy.context.space_data;space.use_local_camera=False
    assert space.camera==bpy.context.scene.camera
    assert module.ipad_camera_state(bpy.context)[1]==bpy.data.objects['SceneCamera']
    space.use_local_camera=True
    # Native pointer property synchronizes Scene only when local camera is off.
    space.camera=bpy.data.objects['LocalCamera'];assert bpy.context.scene.camera.name=='SceneCamera'
    space.use_local_camera=False;space.camera=bpy.data.objects['LocalCamera']
    assert bpy.context.scene.camera.name=='LocalCamera'
    with tempfile.TemporaryDirectory(prefix='ipad-camera-library-') as library_dir:
        library_path=str(Path(library_dir)/'camera.blend')
        bpy.data.libraries.write(library_path,{bpy.data.objects['LocalCamera']})
        with bpy.data.libraries.load(library_path,link=True) as (available,loaded):
            loaded.objects=['LocalCamera']
        linked_camera=loaded.objects[0]
        bpy.context.scene.collection.objects.link(linked_camera)
        space.use_local_camera=True;space.camera=linked_camera
        space.region_3d.view_perspective='PERSP'
        assert not linked_camera.is_editable and not linked_camera.data.is_editable
        assert not bpy.ops.view3d.camera_to_view.poll()
        records=[];module.VIEW3D_PT_ipad_camera.draw(SimpleNamespace(layout=Layout(records)),bpy.context)
        assert any(k=='prop' and n=='lens' and o==linked_camera.data and not enabled
                   for k,n,o,enabled,v in records)

report={'host_blender':bpy.app.version_string,'actual_viewport_camera_target':True,
        'local_camera_without_scene_camera':True,'perspective_lens_orthographic_scale_and_return_label':True,
        'native_local_scene_selector_synchronization':True,'native_align_changes_only_local_camera':True,
        'linked_camera_native_align_poll_and_readonly_lens':True,
        'explicit_headless_alignment_undo_redo_checkpoints':True,
        'locked_camera_touch_gesture_lifecycle_not_fixed':True,'visual_preview':False,'device_acceptance':False}
destination=repo/'output/ui-preview/camera-interaction-validation.json'
destination.write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8');print(json.dumps(report))
