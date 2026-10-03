"""Run in host Blender; geometry/RNA evidence, not iOS presentation acceptance."""
from pathlib import Path
from types import ModuleType, SimpleNamespace
import json
import math
import bpy
import bmesh
from mathutils import Matrix, Vector

repo = Path(__file__).resolve().parents[1]
path = 'scripts/startup/bl_ui/space_view3d_ipad.py'
patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
section = patch.split(f'diff --git a/{path} b/{path}\n', 1)[1].split('diff --git ', 1)[0]
source = '\n'.join(line[1:] for line in section.splitlines() if line.startswith('+') and not line.startswith('+++'))
module = ModuleType('ipad_transform_validation')
exec(compile(source, path, 'exec'), module.__dict__)
for cls in module.classes:
    bpy.utils.register_class(cls)
area = next(a for a in bpy.context.window.screen.areas if a.type == 'VIEW_3D')
region = next(r for r in area.regions if r.type == 'WINDOW')
checks = []


def near(actual, expected):
    assert (Vector(actual) - Vector(expected)).length < 0.0001, (tuple(actual), tuple(expected))


class Layout:
    def __init__(self, records):
        self.records = records
    def row(self, **kwargs):
        return Layout(self.records)
    def column(self, **kwargs):
        return Layout(self.records)
    def grid_flow(self, **kwargs):
        return Layout(self.records)
    def operator(self, name, **kwargs):
        props = SimpleNamespace()
        self.records.append((name, props, kwargs))
        return props
    def prop(self, data, name, **kwargs):
        assert hasattr(data, name), name
        self.records.append(('prop', name, kwargs))
    def label(self, **kwargs):
        self.records.append(('label', None, kwargs))
    def popover(self, **kwargs):
        assert hasattr(bpy.types, kwargs['panel']), kwargs
        self.records.append(('popover', None, kwargs))
    def separator(self, **kwargs):
        pass


class DialogContext:
    window_manager = SimpleNamespace(invoke_props_dialog=lambda *_args, **_kwargs: {'RUNNING_MODAL'})
    def __getattr__(self, name):
        return getattr(bpy.context, name)


def dialog():
    cls = module.VIEW3D_OT_ipad_transform_numbers
    session = SimpleNamespace(operation='MOVE', slot_index=1, offset=(5, 0, 0),
        factors=(1, 1, 1), angle=0, axis='Z', report=lambda *_args: None,
        poll=lambda context: cls.poll(context))
    assert cls.invoke(session, DialogContext(), None) == {'RUNNING_MODAL'}
    return session


with bpy.context.temp_override(area=area, region=region):
    bpy.ops.object.select_all(action='SELECT')
    bpy.ops.object.delete(use_global=False)
    bpy.ops.mesh.primitive_cube_add()
    cube = bpy.context.object
    scene = bpy.context.scene
    slots = scene.transform_orientation_slots
    scene.tool_settings.transform_pivot_point = 'MEDIAN_POINT'
    slots[0].type = 'GLOBAL'
    # Every native tool child and constraint is writable and Numbers is transient.
    for tool in ('builtin.move', 'builtin.rotate', 'builtin.scale', 'builtin.transform'):
        bpy.ops.wm.tool_set_by_id(name=tool)
        active = module.ToolSelectPanelHelper.tool_active_from_context(bpy.context)
        actions = ('TRANSLATE', 'ROTATE', 'SCALE', 'NONE') if tool == 'builtin.transform' else (None,)
        for action in actions:
            if action:
                active.gizmo_group_properties('VIEW3D_GGT_xform_gizmo').drag_action = action
            state = module.ipad_transform_state(bpy.context)
            records = []
            module.VIEW3D_PT_ipad_transform.draw(SimpleNamespace(layout=Layout(records)), bpy.context)
            if action == 'NONE':
                assert any(r[0] == 'prop' and r[1] == 'drag_action' for r in records)
                assert not any(r[0] == 'view3d.ipad_transform_numbers' for r in records)
                continue
            assert state[3] == {'builtin.move': 1, 'builtin.rotate': 2, 'builtin.scale': 3, 'builtin.transform': 1}[tool]
            for axis, _, value in module.IPAD_TRANSFORM_AXES:
                if state[1] == 'ROTATE' and axis in {'XY', 'XZ', 'YZ'}:
                    continue
                assert bpy.ops.view3d.ipad_transform_axis(axis=axis) == {'FINISHED'}
                assert tuple(active.operator_properties(state[2]).constraint_axis) == value
            assert not active.operator_properties(state[2]).is_property_set('value')
            assert not active.operator_properties(state[2]).is_property_set('snap')
            props = active.operator_properties(state[2])
            props.use_accurate = True
            records = []
            module.VIEW3D_PT_ipad_transform.draw(SimpleNamespace(layout=Layout(records)), bpy.context)
            assert any(r[0] == 'prop' and r[1] == 'use_accurate' and r[2]['text'] == 'Fine Drag' for r in records)
            shelf = []
            module.draw_editing_shelf(Layout(shelf), bpy.context, width_units=28)
            assert any(r[0] == 'label' and ' · Fine' in r[2]['text'] for r in shelf), shelf
            assert any(r[0] == 'prop' and r[1] == 'use_accurate' and r[2]['text'] == 'Fine'
                       for r in shelf), shelf
            assert sum(r[0] == 'view3d.ipad_transform_axis' for r in shelf) == 4
            assert any(r[0] == 'view3d.ipad_transform_numbers' for r in shelf)
            header = []
            module.draw_canvas_header(Layout(header))
            assert not any(r[0] == 'popover' and r[2]['panel'] == 'VIEW3D_PT_ipad_transform'
                           for r in header), header
            props.use_accurate = False
    checks.append('Native tool children, axis/plane RNA, Fine Drag RNA/UI, combined None recovery and transient values')
    # Different per-tool and global bases must resolve deliberately.
    cube.rotation_euler = (0, 0, math.pi / 2)
    slots[1].type = 'LOCAL'
    assert bpy.ops.view3d.ipad_transform_numbers(operation='MOVE', slot_index=1, offset=(1, 0, 0)) == {'FINISHED'}
    near(cube.location, (0, 1, 0))
    cube.location = (0, 0, 0)
    slots[1].type = 'DEFAULT'
    assert not slots[1].use and module.ipad_transform_orientation(bpy.context, 1) == slots[0]
    assert bpy.ops.view3d.ipad_transform_numbers(operation='MOVE', slot_index=1, offset=(1, 0, 0)) == {'FINISHED'}
    near(cube.location, (1, 0, 0))
    bpy.ops.transform.create_orientation(name='Touch Test Basis', use=True, use_view=True)
    custom = slots[0].custom_orientation
    custom.matrix = Matrix.Rotation(math.pi / 2, 3, 'Z')
    slots[1].type = custom.name
    slots[0].type = 'GLOBAL'
    cube.location = (0, 0, 0)
    cube.rotation_euler = (0, 0, 0)
    assert bpy.ops.view3d.ipad_transform_numbers(operation='MOVE', slot_index=1, offset=(1, 0, 0)) == {'FINISHED'}
    near(cube.location, (0, 1, 0))
    checks.append('Local, Default fallback and custom named orientation geometry')
    # Exact numbers do not inherit modal Snap or drag constraints.
    slots[1].type = 'GLOBAL'
    scene.tool_settings.use_snap = True
    bpy.ops.wm.tool_set_by_id(name='builtin.move')
    active = module.ToolSelectPanelHelper.tool_active_from_context(bpy.context)
    active.operator_properties('transform.translate').use_accurate = True
    cube.location = (0, 0, 0)
    assert bpy.ops.view3d.ipad_transform_numbers(operation='MOVE', slot_index=1, offset=(0.3, 0.7, 0.2)) == {'FINISHED'}
    near(cube.location, (0.3, 0.7, 0.2))
    assert scene.tool_settings.use_snap
    assert active.operator_properties('transform.translate').use_accurate
    active.operator_properties('transform.translate').use_accurate = False
    scene.tool_settings.use_snap = False
    scene.tool_settings.transform_pivot_point = 'CURSOR'
    scene.cursor.location = (0, 0, 0)
    slots[2].type = slots[3].type = 'GLOBAL'
    for axis in 'XYZ':
        cube.location = (2, 3, 4)
        cube.rotation_euler = (0, 0, 0)
        assert bpy.ops.view3d.ipad_transform_numbers(operation='ROTATE', slot_index=2,
                                                   angle=math.pi / 2, axis=axis) == {'FINISHED'}
        near(cube.location, Matrix.Rotation(math.pi / 2, 3, axis) @ Vector((2, 3, 4)))
    cube.location = (2, 3, 4)
    cube.rotation_euler = (0, 0, 0)
    cube.scale = (1, 1, 1)
    assert bpy.ops.view3d.ipad_transform_numbers(operation='SCALE', slot_index=3, factors=(2, 1, 0.5)) == {'FINISHED'}
    near(cube.location, (4, 3, 2))
    near(cube.scale, (2, 1, 0.5))
    checks.append('Exact fractional Move, Rotate X/Y/Z and nonuniform Scale around native Cursor pivot')
    scene.tool_settings.transform_pivot_point = 'INDIVIDUAL_ORIGINS'
    cube.location, cube.scale = (1, 2, 3), (1, 1, 1)
    bpy.ops.mesh.primitive_cube_add(location=(-2, 1, 0))
    second = bpy.context.object
    cube.select_set(True)
    assert bpy.ops.view3d.ipad_transform_numbers(operation='SCALE', slot_index=3, factors=(2, 2, 2)) == {'FINISHED'}
    near(cube.location, (1, 2, 3))
    near(second.location, (-2, 1, 0))
    near(cube.scale, (2, 2, 2))
    near(second.scale, (2, 2, 2))
    checks.append('Multiple objects preserve Individual Origins pivot')
    bpy.ops.object.select_all(action='DESELECT')
    cube.select_set(True)
    bpy.context.view_layer.objects.active = cube
    cube.location, cube.scale = (0, 0, 0), (1, 1, 1)
    scene.tool_settings.transform_pivot_point = 'MEDIAN_POINT'
    before = tuple(cube.location)
    session = dialog()
    near(cube.location, before)  # Invocation and Cancel never apply a preview.
    assert bpy.ops.view3d.ipad_transform_numbers(operation='MOVE', offset=(0, 0, 0)) == {'CANCELLED'}
    assert bpy.ops.view3d.ipad_transform_numbers(operation='SCALE', factors=(1, 1, 1)) == {'CANCELLED'}
    assert bpy.ops.view3d.ipad_transform_numbers(operation='ROTATE', angle=0) == {'CANCELLED'}
    cube.select_set(False)
    assert module.VIEW3D_OT_ipad_transform_numbers.execute(session, bpy.context) == {'CANCELLED'}
    near(cube.location, before)
    cube.select_set(True)
    # Same-object mesh component changes invalidate the pending dialog.
    bpy.ops.object.mode_set(mode='EDIT')
    mesh = bmesh.from_edit_mesh(cube.data)
    mesh.verts.ensure_lookup_table()
    bpy.ops.mesh.select_all(action='SELECT')
    before_vertices = [v.co.copy() for v in mesh.verts]
    assert bpy.ops.view3d.ipad_transform_numbers(operation='MOVE', slot_index=1, offset=(2, 0, 0)) == {'FINISHED'}
    for before_vertex, vertex in zip(before_vertices, mesh.verts):
        near(vertex.co, before_vertex + Vector((2, 0, 0)))
    bpy.ops.mesh.select_all(action='DESELECT')
    mesh.verts[0].select = True
    session = dialog()
    before_vertices = [v.co.copy() for v in mesh.verts]
    mesh.verts[0].select, mesh.verts[1].select = False, True
    assert module.VIEW3D_OT_ipad_transform_numbers.execute(session, bpy.context) == {'CANCELLED'}
    for before_vertex, vertex in zip(before_vertices, mesh.verts):
        near(vertex.co, before_vertex)
    bpy.ops.object.mode_set(mode='OBJECT')
    checks.append('No-op/Cancel, object-selection guard, Edit Mesh geometry and same-object component guard')
    # Headless Blender disables automatic UI undo pushes. Exercise the native
    # stack explicitly; device acceptance still must check automatic one-step Undo.
    cube.location = (0, 0, 0)
    cube_name = cube.name
    bpy.ops.ed.undo_push(message='Before numeric test')
    assert bpy.ops.view3d.ipad_transform_numbers(operation='MOVE', slot_index=1, offset=(1, 2, 3)) == {'FINISHED'}
    bpy.ops.ed.undo_push(message='After numeric test')
    assert bpy.ops.ed.undo() == {'FINISHED'}
    cube = bpy.data.objects[cube_name]
    near(cube.location, (0, 0, 0))
    assert bpy.ops.ed.redo() == {'FINISHED'}
    cube = bpy.data.objects[cube_name]
    near(cube.location, (1, 2, 3))
    checks.append('Native Undo/Redo geometry with explicit headless checkpoints (automatic device push unverified)')
    # Pose and Edit Armature use bone selection, not merely object selection.
    bpy.ops.object.select_all(action='DESELECT')
    bpy.ops.object.armature_add()
    rig = bpy.context.object
    bpy.ops.object.mode_set(mode='EDIT')
    bone = rig.data.edit_bones.new('Second')
    bone.head, bone.tail = (2, 0, 0), (2, 1, 0)
    original_bone = rig.data.edit_bones[0]
    original_bone.select = original_bone.select_head = original_bone.select_tail = True
    bone.select = bone.select_head = bone.select_tail = False
    session = dialog()
    bone.select = True
    assert module.VIEW3D_OT_ipad_transform_numbers.execute(session, bpy.context) == {'CANCELLED'}
    bpy.ops.object.mode_set(mode='POSE')
    pose_selection = [bone if hasattr(bone, 'select') else bone.bone for bone in rig.pose.bones]
    pose_selection[0].select, pose_selection[1].select = True, False
    rig.data.bones.active = rig.data.bones[0]
    session = dialog()
    pose_selection[0].select, pose_selection[1].select = False, True
    assert module.VIEW3D_OT_ipad_transform_numbers.execute(session, bpy.context) == {'CANCELLED'}
    pose_selection[0].select, pose_selection[1].select = True, False
    assert bpy.ops.view3d.ipad_transform_numbers(operation='MOVE', slot_index=1, offset=(0.5, 0, 0)) == {'FINISHED'}
    near(rig.pose.bones[0].location, (0.5, 0, 0))
    bpy.ops.object.mode_set(mode='OBJECT')
    checks.append('Pose numeric Move and Pose/Edit Armature same-object bone-selection guards')
    # Nullable Grease Pencil end frames retain identity without dereferencing a drawing.
    fake_gp = SimpleNamespace(as_pointer=lambda: 1, data=SimpleNamespace(layers=[
        SimpleNamespace(name='Layer', frames=[SimpleNamespace(frame_number=3, drawing=None)])]))
    signature = module.ipad_component_selection(SimpleNamespace(
        mode='EDIT_GREASE_PENCIL', objects_in_mode=[fake_gp]))
    assert signature == ((1, (('Layer', 3, False, ()),)),), signature
    bpy.ops.object.text_add(enter_editmode=True)
    assert bpy.context.mode == 'EDIT_TEXT'
    assert not module.VIEW3D_OT_ipad_transform_numbers.poll(bpy.context)
    bpy.ops.object.mode_set(mode='OBJECT')
    checks.append('Nullable Grease Pencil end frame and unsupported Edit Text regression guards')

output = repo / 'output/ui-preview/transform-validation.json'
output.write_text(json.dumps({'blender': bpy.app.version_string, 'checks': checks,
    'scope': 'Host RNA/geometry/ownership evidence. No visual preview, UIKit or device acceptance. Automatic UI Undo push unverified.'},
    indent=2) + '\n', encoding='utf-8')
print('PASS: native transform controls, orientation/pivot geometry, dialog guards and headless Undo/Redo')
