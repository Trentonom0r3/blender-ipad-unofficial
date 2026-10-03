"""Run in factory-startup host Blender with --background --python-exit-code 1.

Validate the shipped Python UI and actual tool operators, not iOS presentation.
"""
from pathlib import Path
from types import ModuleType, SimpleNamespace
import ast
import json
import bpy

repo = Path(__file__).resolve().parents[1]
path = 'scripts/startup/bl_ui/space_view3d_ipad.py'
patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
section = patch.split(f'diff --git a/{path} b/{path}\n', 1)[1].split('diff --git ', 1)[0]
source = '\n'.join(line[1:] for line in section.splitlines()
                   if line.startswith('+') and not line.startswith('+++'))
module = ModuleType('ipad_tools_validation')
exec(compile(source, path, 'exec'), module.__dict__)
icons = bpy.types.UILayout.bl_rna.functions['operator'].parameters['icon'].enum_items
for _, _, icon in module.IPAD_RADIAL_TOOLS:
    assert icon in icons, icon
for node in ast.walk(ast.parse(source)):
    if isinstance(node, ast.keyword) and node.arg == 'icon' and isinstance(node.value, ast.Constant):
        assert node.value.value in icons, node.value.value


class Layout:
    def __init__(self, records):
        self.records = records
        self.enabled = True

    def column(self, **kwargs):
        return Layout(self.records)

    def row(self, **kwargs):
        return Layout(self.records)

    def operator(self, name, **kwargs):
        props = SimpleNamespace()
        self.records.append((name, props, kwargs, self.enabled))
        return props

    def label(self, **kwargs):
        self.records.append(('label', None, kwargs, True))

    def prop(self, data, prop, **kwargs):
        self.records.append(('property', prop, kwargs, True))

    def popover(self, **kwargs):
        self.records.append(('popover', None, kwargs, True))

    def separator(self, **kwargs):
        pass

    def menu(self, name, **kwargs):
        self.records.append(('menu', name, kwargs, True))


area = next(a for a in bpy.context.window.screen.areas if a.type == 'VIEW_3D')
region = next(r for r in area.regions if r.type == 'WINDOW')
results = []
with bpy.context.temp_override(area=area, region=region):
    for mode in ('OBJECT', 'EDIT'):
        bpy.ops.object.mode_set(mode=mode)
        records = []
        module.VIEW3D_MT_ipad_tools.draw(SimpleNamespace(layout=Layout(records)), bpy.context)
        assert len(records) == 9, len(records)
        for item, tool_spec in zip(records, module.IPAD_RADIAL_TOOLS):
            if item[0] == 'wm.call_menu_pie':
                assert item[1].name == module.ipad_context_ring_name(bpy.context)
                assert item[2]['depress'] and item[2]['text'].endswith('…')
            else:
                assert item[1].name == tool_spec[1]
        before_count = len(bpy.data.objects)
        enabled = []
        for (op, props, _, available), tool_spec in zip(records, module.IPAD_RADIAL_TOOLS):
            if available:
                target = tool_spec[1]
                assert bpy.ops.wm.tool_set_by_id(name=target) == {'FINISHED'}, target
                assert module.ToolSelectPanelHelper.tool_active_from_context(bpy.context).idname == target
                enabled.append(target)
        assert len(bpy.data.objects) == before_count, 'Tool activation must not create objects'
        if mode == 'OBJECT':
            assert len(enabled) == 9, enabled
        results.append({'mode': bpy.context.mode, 'activated': enabled})
    bpy.ops.object.mode_set(mode='OBJECT')
    bpy.ops.wm.tool_set_by_id(name='builtin.move')
    # Stock host has no new native runtime flag. Exercise both presentation
    # policy branches explicitly; this does not establish native shelf visibility.
    native_visibility = module.ipad_editing_shelf_visible
    try:
        module.ipad_editing_shelf_visible = lambda context: False
        records = []
        module.draw_canvas_header(Layout(records))
        assert [item[0] for item in records[:3]] == ['wm.ipad_tool_palette', 'ed.undo', 'ed.redo'], records
        assert records[0][1].touch_targets is True
        panels = {r[2]['panel'] for r in records if r[0] == 'popover'}
        assert {'VIEW3D_PT_ipad_selection','VIEW3D_PT_ipad_transform','VIEW3D_PT_ipad_camera'} <= panels
        assert any(r[0] == 'view3d.ipad_flythrough_toggle' for r in records)
        module.ipad_editing_shelf_visible = lambda context: True
        records = []
        module.draw_canvas_header(Layout(records))
        assert not any(r[0] in {'ed.undo','ed.redo'} for r in records)
        assert not any(r[0] == 'popover' and r[2]['panel'] in {
            'VIEW3D_PT_ipad_selection','VIEW3D_PT_ipad_transform'} for r in records)
    finally:
        module.ipad_editing_shelf_visible = native_visibility
    for idname in ('undo', 'redo'):
        getattr(bpy.ops.ed, idname).get_rna_type()
    records = []
    module.VIEW3D_MT_ipad_tool_settings.draw(SimpleNamespace(layout=Layout(records)), bpy.context)
    assert len(records) == 1 and records[0][1].data_path == 'space_data.show_region_toolbar'

original = area.spaces.active.show_region_toolbar
area.spaces.active.show_region_toolbar = not original
assert area.spaces.active.show_region_toolbar != original
area.spaces.active.show_region_toolbar = original
assert area.spaces.active.show_region_toolbar == original

# Validate flythrough toggle operator
for cls in module.classes:
    try:
        bpy.utils.register_class(cls)
    except ValueError:
        pass
# Exercise the actual registered selection operator and native tool RNA.
selection_checks = []
with bpy.context.temp_override(area=area, region=region):
    for object_mode in ('OBJECT', 'EDIT'):
        bpy.ops.object.mode_set(mode=object_mode)
        for tool in ('builtin.select_box', 'builtin.select_lasso'):
            for action in ('SET', 'ADD', 'SUB'):
                assert bpy.ops.view3d.ipad_selection_tool(tool=tool, mode=action) == {'FINISHED'}
                assert module.ipad_selection_state(bpy.context)[:2] == (tool, action)
                records = []
                module.VIEW3D_PT_ipad_selection.draw(SimpleNamespace(layout=Layout(records)), bpy.context)
                shapes = [r for r in records if r[0] == 'view3d.ipad_selection_tool'][:2]
                assert len(shapes) == 2 and all(r[1].mode == action for r in shapes), shapes
                modes = [r for r in records if r[0] == 'view3d.ipad_selection_tool'][2:]
                assert [r[1].mode for r in modes] == ['SET', 'ADD', 'SUB'], modes
                assert all(r[1].tool == tool for r in modes), modes
                # All/Clear/Invert and element-mode buttons are real native operators.
                all_operator = module.IPAD_SELECT_ALL[bpy.context.mode]
                select_all = getattr(getattr(bpy.ops, all_operator.split('.')[0]), 'select_all')
                for value in ('SELECT', 'DESELECT', 'INVERT'):
                    status = select_all(action=value)
                    assert status in ({'FINISHED'}, {'CANCELLED'}), (bpy.context.mode, value, status)
                    # Native no-op selection legitimately returns CANCELLED.
                    if bpy.context.mode == 'OBJECT':
                        selected = [obj.select_get() for obj in bpy.context.view_layer.objects]
                    else:
                        import bmesh
                        selected = [v.select for v in bmesh.from_edit_mesh(bpy.context.object.data).verts]
                    assert selected and all(v == (value != 'DESELECT') for v in selected), (value, selected)
                if bpy.context.mode == 'EDIT_MESH':
                    for index, value in enumerate(('VERT', 'EDGE', 'FACE')):
                        assert bpy.ops.mesh.select_mode(type=value) in ({'FINISHED'}, {'CANCELLED'})
                        assert tuple(bpy.context.tool_settings.mesh_select_mode) == tuple(i == index for i in range(3))
                selection_checks.append({'mode': bpy.context.mode, 'tool': tool, 'action': action})
    bpy.ops.object.mode_set(mode='OBJECT')
    # Complete native selection menus remain reachable; dictionary operators expose action.
    for context_mode, idname in module.IPAD_SELECT_ALL.items():
        category, operator = idname.split('.')
        rna = getattr(getattr(bpy.ops, category), operator).get_rna_type()
        assert 'action' in rna.properties, idname
        for value in ('SELECT', 'DESELECT', 'INVERT'):
            assert value in rna.properties['action'].enum_items, (idname, value)
        assert hasattr(bpy.types, 'VIEW3D_MT_select_' + context_mode.lower()), context_mode
wm = bpy.context.window_manager
assert not getattr(wm, "ipad_flythrough_active", False)
assert bpy.ops.view3d.ipad_flythrough_toggle() == {'FINISHED'}
assert getattr(wm, "ipad_flythrough_active", False)
assert bpy.ops.view3d.ipad_flythrough_toggle() == {'FINISHED'}
assert not getattr(wm, "ipad_flythrough_active", False)

output = repo / 'output/ui-preview/nine-tools-validation.json'
output.write_text(json.dumps({'blender': bpy.app.version_string, 'checks': results,
    'header_undo_redo_and_settings_shelf_toggle': 'passed',
    'native_selection_controls': selection_checks,
    'scope': 'Host Python tool/UI wiring only. Native popup, gestures and UIKit require iOS testing.'},
    indent=2) + '\n', encoding='utf-8')
print('PASS: nine tool slots, header controls, native selection tools/modes and mesh elements')
