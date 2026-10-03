"""Real host native BMesh-copy evidence; does not validate iPad rollback/UI."""
import json
from pathlib import Path
import bpy
import bmesh

repo = Path(__file__).resolve().parents[1]
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.mesh.primitive_cube_add()
obj = bpy.context.object
obj.shape_key_add(name='Basis')
shape = obj.shape_key_add(name='Raised')
shape.data[0].co.z += 0.125
obj.active_shape_key_index = 1
bpy.ops.object.mode_set(mode='EDIT')
bm = bmesh.from_edit_mesh(obj.data)
bm.verts.ensure_lookup_table()
bm.faces.ensure_lookup_table()
weight = bm.verts.layers.float.new('snapshot_weight')
uv = bm.loops.layers.uv.new('snapshot_uv')
for vert in bm.verts:
    vert.select_set(False)
    vert[weight] = vert.index + 0.375
for edge in bm.edges:
    edge.select_set(False)
for face in bm.faces:
    face.select_set(False)
    for index, loop in enumerate(face.loops):
        loop[uv].uv = (index * 0.25, face.index * 0.125)
bpy.context.tool_settings.mesh_select_mode = (False, False, True)
bm.select_mode = {'FACE'}
target = max(bm.faces, key=lambda face: face.calc_center_median().z)
target.select_set(True)
bm.select_flush_mode()
bm.faces.active = target
bm.select_history.clear()
bm.select_history.add(target)
bmesh.update_edit_mesh(obj.data, loop_triangles=True, destructive=True)


def signature(mesh):
    mesh.verts.index_update()
    mesh.edges.index_update()
    mesh.faces.index_update()
    weights = mesh.verts.layers.float.get('snapshot_weight')
    uvs = mesh.loops.layers.uv.get('snapshot_uv')
    shapes = tuple(mesh.verts.layers.shape.keys())
    return {
        'verts': tuple((tuple(v.co), v.select, v[weights],
                        tuple(tuple(v[mesh.verts.layers.shape[name]]) for name in shapes))
                       for v in mesh.verts),
        'edges': tuple((tuple(v.index for v in edge.verts), edge.select) for edge in mesh.edges),
        'faces': tuple((tuple(v.index for v in face.verts), face.select,
                        tuple(tuple(loop[uvs].uv) for loop in face.loops)) for face in mesh.faces),
        'active_face': mesh.faces.active.index if mesh.faces.active else None,
        'history': tuple((type(element).__name__, element.index) for element in mesh.select_history),
        'shape_layers': shapes,
        'selection_mode': tuple(sorted(mesh.select_mode)),
    }


before = signature(bm)
backup = bm.copy()  # Native BM_mesh_copy, also used by EDBM_redo_state_store.
assert signature(backup) == before
result = bpy.ops.mesh.extrude_context_move(
    'EXEC_DEFAULT', TRANSFORM_OT_translate={'value': (0.0, 0.0, 0.5)})
assert result == {'FINISHED'}
after = bmesh.from_edit_mesh(obj.data)
assert len(after.verts) > len(before['verts'])
assert signature(backup) == before, 'Native extrusion mutated the independent backup'
report = {
    'host_blender': bpy.app.version_string,
    'native_bmesh_copy_is_independent': True,
    'selection_history_active_face_uv_float_and_shape_layers_preserved': True,
    'unlocked_non_basis_extrude_exec': True,
    'original_vertices': len(before['verts']),
    'extruded_vertices': len(after.verts),
    'touch_transaction_restore_not_executed_on_stock_host': True,
    'device_acceptance': False,
}
backup.free()
destination = repo / 'output/ui-preview/extrude-snapshot-validation.json'
destination.parent.mkdir(parents=True, exist_ok=True)
destination.write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')
print(json.dumps(report))
