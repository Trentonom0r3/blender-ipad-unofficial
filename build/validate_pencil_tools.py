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

    def prop(self, data, prop, **kwargs):
        self.records.append(('property', prop, kwargs, True))

    def popover(self, **kwargs):
        pass


area = next(a for a in bpy.context.window.screen.areas if a.type == 'VIEW_3D')
region = next(r for r in area.regions if r.type == 'WINDOW')
results = []
with bpy.context.temp_override(area=area, region=region):
    for mode in ('OBJECT', 'EDIT'):
        bpy.ops.object.mode_set(mode=mode)
        records = []
        module.VIEW3D_MT_ipad_tools.draw(SimpleNamespace(layout=Layout(records)), bpy.context)
        assert len(records) == 9, len(records)
        assert [r[1].name for r in records] == [tool[1] for tool in module.IPAD_RADIAL_TOOLS]
        before_count = len(bpy.data.objects)
        enabled = []
        for op, props, _, available in records:
            if available:
                assert bpy.ops.wm.tool_set_by_id(name=props.name) == {'FINISHED'}, props.name
                assert module.ToolSelectPanelHelper.tool_active_from_context(bpy.context).idname == props.name
                enabled.append(props.name)
        assert len(bpy.data.objects) == before_count, 'Tool activation must not create objects'
        if mode == 'OBJECT':
            assert len(enabled) == 9, enabled
        results.append({'mode': bpy.context.mode, 'activated': enabled})
    bpy.ops.object.mode_set(mode='OBJECT')
    records = []
    module.draw_canvas_header(Layout(records))
    assert records[0][0:2] == ('property', 'show_region_toolbar'), records
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
wm = bpy.context.window_manager
assert not getattr(wm, "ipad_flythrough_active", False)
assert bpy.ops.view3d.ipad_flythrough_toggle() == {'FINISHED'}
assert getattr(wm, "ipad_flythrough_active", False)
assert bpy.ops.view3d.ipad_flythrough_toggle() == {'FINISHED'}
assert not getattr(wm, "ipad_flythrough_active", False)

output = repo / 'output/ui-preview/nine-tools-validation.json'
output.write_text(json.dumps({'blender': bpy.app.version_string, 'checks': results,
    'header_and_settings_shelf_toggle': 'passed',
    'scope': 'Host Python tool/UI wiring only. Native popup, gestures and UIKit require iOS testing.'},
    indent=2) + '\n', encoding='utf-8')
print('PASS: nine tool slots, actual tool activation, no accidental cube creation, header/settings shelf toggle')
