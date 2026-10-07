"""Stock native EXEC view/scene/history proof, not patched UI or target delivery."""
from pathlib import Path
import json
import hashlib
import bpy
repo=Path(__file__).resolve().parents[1]
output=repo/'output/ui-preview/pencil-view'
output.mkdir(parents=True,exist_ok=True)
area=next(a for a in bpy.context.window.screen.areas if a.type=='VIEW_3D')
region=next(r for r in area.regions if r.type=='WINDOW')
with bpy.context.temp_override(area=area,region=region):
    cube=bpy.context.object
    rig=bpy.data.objects.new('View proof camera parent',None)
    bpy.context.scene.collection.objects.link(rig)
    camera=bpy.context.scene.camera
    camera.parent=rig
    camera.location=(3,4,5);rig.location=(7,8,9)
    view=area.spaces.active.region_3d
    view.view_perspective='PERSP'
    # Noncamera projection must remain safe even if Lock Camera is checked.
    area.spaces.active.lock_camera=True
    scene=bpy.context.scene
    bpy.ops.ed.undo_push(message='View baseline')
    bpy.ops.transform.translate('EXEC_REGION_WIN',True,value=(1,0,0))
    scene.tool_settings.use_keyframe_insert_auto=True
    def state():
        return {'objects':[{ 'name':o.name,'type':o.type,'parent':o.parent.name if o.parent else None,
             'location':list(o.location),'rotation':list(o.rotation_euler),'scale':list(o.scale),
             'selected':o.select_get(),'action':o.animation_data.action.name if o.animation_data and o.animation_data.action else None}
             for o in sorted(bpy.data.objects,key=lambda o:o.name)],
             'mesh':[[list(v.co) for v in m.vertices] for m in bpy.data.meshes],
             'cursor_location':list(scene.cursor.location),'cursor_rotation':list(scene.cursor.rotation_euler),
             'frame':scene.frame_current,'auto_key':scene.tool_settings.use_keyframe_insert_auto,
             'active':bpy.context.object.name}
    before=state();checks=[]
    for name,props in (
        ('view_selected',{'use_all_regions':False}),('view_all',{'use_all_regions':False,'center':False}),
        ('view_axis',{'type':'TOP','align_active':False,'relative':False}),
        ('view_axis',{'type':'FRONT','align_active':False,'relative':False}),
        ('view_axis',{'type':'RIGHT','align_active':False,'relative':False}),
        ('view_persportho',{}),('view_persportho',{})):
        assert getattr(bpy.ops.view3d,name)('EXEC_REGION_WIN',True,**props)=={'FINISHED'}
        assert state()==before,(name,'changed scene state')
        checks.append({'operator':'view3d.'+name,'context':'EXEC_REGION_WIN','properties':props,
            'view_perspective':view.view_perspective,'view_distance':view.view_distance,
            'view_location':list(view.view_location),'view_rotation':list(view.view_rotation),
            'scene_geometry_camera_parent_cursor_selection_keyframes_unchanged':True})
    assert bpy.ops.ed.undo()=={'FINISHED'}
    assert abs(bpy.data.objects['Cube'].location.x)<1e-6
    assert bpy.ops.ed.redo()=={'FINISHED'}
    assert abs(bpy.data.objects['Cube'].location.x-1)<1e-6
    # Empty selection retains native successful no-op semantics for framing.
    bpy.ops.object.select_all(action='DESELECT')
    assert bpy.ops.view3d.view_selected('EXEC_REGION_WIN',True,use_all_regions=False)=={'FINISHED'}
patch=(repo/'patches/blender-ipad.patch').read_text(encoding='utf-8')
(output/'native-exec.json').write_text(json.dumps({'host':bpy.app.version_string,
    'patch_sha256':hashlib.sha256(patch.encode()).hexdigest(),'commands':checks,
    'undo_redo_previous_model_edit_preserved':True,'empty_selection_native_finished':True,
    'scope':'Stock native command execution and native Undo/Redo. Final patched ownership/mask/GPU/UIKit and device delivery are unverified.'},indent=2)+'\n',encoding='utf-8')
print('PASS seven native EXEC view commands, exact scene invariants and native modeling Undo/Redo.')
