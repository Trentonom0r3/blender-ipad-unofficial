"""Native accepted-step recovery evidence, with explicit headless Undo checkpoints."""
import json
from pathlib import Path
import bpy
import bmesh

repo = Path(__file__).resolve().parents[1]
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.mesh.primitive_cube_add()
obj = bpy.context.object
bpy.ops.object.mode_set(mode='EDIT')
bm = bmesh.from_edit_mesh(obj.data)
for vert in bm.verts:
    vert.select_set(False)
for edge in bm.edges:
    edge.select_set(False)
for face in bm.faces:
    face.select_set(False)
bpy.context.tool_settings.mesh_select_mode = (False, False, True)
bm.select_mode = {'FACE'}
face = max(bm.faces, key=lambda item: item.calc_center_median().z)
face.select_set(True)
bm.select_flush_mode()
bmesh.update_edit_mesh(obj.data, loop_triangles=True, destructive=True)


def current_bmesh():
    return bmesh.from_edit_mesh(bpy.context.edit_object.data)


def signature():
    mesh = current_bmesh()
    return (len(mesh.verts), len(mesh.edges), len(mesh.faces),
            tuple(sorted(tuple(round(value, 6) for value in vert.co) for vert in mesh.verts)))


# Stock headless Blender needs explicit checkpoints; do not claim automatic UI Undo.
bpy.ops.ed.undo_push(message='Baseline')
baseline = signature()
assert bpy.ops.mesh.extrude_context_move(
    'EXEC_DEFAULT', TRANSFORM_OT_translate={'value': (0.0, 0.0, 0.5)}) == {'FINISHED'}
bpy.ops.ed.undo_push(message='Accepted Extrude')
accepted = signature()
assert accepted != baseline
assert bpy.ops.ed.undo() == {'FINISHED'}
assert signature() == baseline

# Macro invoke currently starts here after the redo gizmo has popped accepted Undo.
# Exercise a changed provisional mesh, then return to its pre-adjust baseline.
# This Python clear/from_mesh models rollback only; it is not the new C++ restore.
backup = current_bmesh().copy()
temporary = bpy.data.meshes.new('Recovery baseline')
backup.to_mesh(temporary)
assert bpy.ops.mesh.extrude_context_move(
    'EXEC_DEFAULT', TRANSFORM_OT_translate={'value': (0.0, 0.0, 1.5)}) == {'FINISHED'}
assert signature() != baseline
mesh = current_bmesh()
mesh.clear()
mesh.from_mesh(temporary)
bmesh.update_edit_mesh(bpy.context.edit_object.data, loop_triangles=True, destructive=True)
assert signature() == baseline
backup.free()
bpy.data.meshes.remove(temporary)

# No Undo push intervenes: native redo restores the accepted step and its position.
assert bpy.ops.ed.redo() == {'FINISHED'}
assert signature() == accepted
assert bpy.ops.ed.undo() == {'FINISHED'}
assert signature() == baseline
assert bpy.ops.ed.redo() == {'FINISHED'}
assert signature() == accepted

report = {
    'host_blender': bpy.app.version_string,
    'accepted_extrude_recovered_by_native_redo': True,
    'subsequent_one_step_undo_redo_geometry': True,
    'explicit_headless_checkpoints': True,
    'provisional_rollback_is_python_model': True,
    'modal_operator_gizmo_lifetime_not_executed': True,
    'device_acceptance': False,
}
destination = repo / 'output/ui-preview/extrude-undo-recovery-validation.json'
destination.parent.mkdir(parents=True, exist_ok=True)
destination.write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')
print(json.dumps(report))
