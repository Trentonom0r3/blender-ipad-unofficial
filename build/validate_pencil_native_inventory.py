"""Exact packaged tool definitions + candidate routes on a stock host; no native ring/device claim."""
from pathlib import Path
import hashlib
import json
import types
import zipfile
import bpy
from bl_ui.space_toolsystem_common import ToolSelectPanelHelper

repo = Path(__file__).resolve().parents[1]
ipa = Path(r'C:/Users/tjerf/AppData/Local/Temp/blender-ipad-run-37181963133/Blender-iPad-Unofficial.ipa')
with zipfile.ZipFile(ipa) as archive:
    name = next(n for n in archive.namelist() if n.endswith('/scripts/startup/bl_ui/space_toolsystem_toolbar.py'))
    toolbar = archive.read(name)
target = types.ModuleType('target_native_tool_definitions')
target.__package__ = 'bl_ui'
exec(compile(toolbar, name, 'exec'), target.__dict__)
host_resolver = ToolSelectPanelHelper._tool_class_from_space_type
ToolSelectPanelHelper._tool_class_from_space_type = staticmethod(
    lambda space: target.VIEW3D_PT_tools_active if space == 'VIEW_3D' else host_resolver(space))
target.VIEW3D_PT_tools_active.register()

patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
path = 'scripts/startup/bl_ui/space_view3d_ipad.py'
section = patch.split(f'diff --git a/{path} b/{path}\n', 1)[1].split('diff --git ', 1)[0]
source = '\n'.join(line[1:] for line in section.splitlines()
                   if line.startswith('+') and not line.startswith('+++')) + '\n'
module = types.ModuleType('pencil_native_inventory_candidate')
exec(compile(source, path, 'exec'), module.__dict__)
bpy.utils.register_class(module.VIEW3D_OT_ipad_native_tool)
bpy.utils.register_class(module.VIEW3D_OT_ipad_native_controls)
for menu_name in ('VIEW3D_MT_ipad_tools', 'VIEW3D_MT_ipad_base_ring',
                  'VIEW3D_MT_ipad_layout_mode_ring', 'VIEW3D_MT_ipad_workspaces_ring',
                  'VIEW3D_MT_ipad_tool_inventory', 'VIEW3D_MT_ipad_selection_ring',
                  'VIEW3D_MT_ipad_selection_options', 'VIEW3D_MT_ipad_transform_ring',
                  'VIEW3D_MT_ipad_transform_options'):
    bpy.utils.register_class(getattr(module, menu_name))
    assert bpy.types.Menu.bl_rna_get_subclass_py(menu_name) is getattr(module, menu_name)

class Recorder:
    def __init__(self): self.operators, self.popovers = [], []
    def column(self, **kwargs): return self
    def row(self, **kwargs): return self
    def operator(self, idname, **kwargs):
        props=types.SimpleNamespace()
        self.operators.append((idname, kwargs, props))
        return props
    def popover(self, **kwargs): self.popovers.append(kwargs)

def draw(menu_name):
    recorder=Recorder()
    cls=getattr(module, menu_name)
    instance=types.SimpleNamespace(layout=recorder, ipad_tools_menu=getattr(cls, 'ipad_tools_menu', 'VIEW3D_MT_ipad_tools'))
    cls.draw(instance, bpy.context)
    return recorder

area = next(a for a in bpy.context.window.screen.areas if a.type == 'VIEW_3D')
region = next(r for r in area.regions if r.type == 'WINDOW')
records = []
routes = []
with bpy.context.temp_override(area=area, region=region):
    for mode in ('OBJECT', 'EDIT', 'SCULPT', 'VERTEX_PAINT', 'WEIGHT_PAINT', 'TEXTURE_PAINT'):
        if bpy.context.object.mode != 'OBJECT': bpy.ops.object.mode_set(mode='OBJECT')
        if mode != 'OBJECT': bpy.ops.object.mode_set(mode=mode)
        candidate = module.ipad_native_tool_inventory(bpy.context)
        native = [tool for tool in target.VIEW3D_PT_tools_active._tools_flatten_with_dynamic(
            target.VIEW3D_PT_tools_active.tools_from_context(bpy.context), context=bpy.context)
            if tool is not None]
        ids = [tool.idname for tool in candidate]
        assert len(ids) == len(set(ids)) and set(ids) == {tool.idname for tool in native}
        if mode in {'OBJECT', 'EDIT'}:
            assert ids[:9] == [name for _, name, _ in module.IPAD_RADIAL_TOOLS]
        assert all(tool.label and tool.icon for tool in candidate)
        brush = module.VIEW3D_PT_ipad_brush_access.poll(bpy.context)
        drawn = draw('VIEW3D_MT_ipad_tool_inventory')
        assert len(drawn.operators) == len(ids) + 3
        assert drawn.operators[-3][0] == 'view3d.ipad_native_controls'
        assert drawn.operators[-2][0] == 'view3d.ipad_flythrough_toggle'
        assert drawn.operators[-1][2].name == 'VIEW3D_MT_ipad_base_ring'
        assert bool(drawn.popovers) == bool(brush)
        if brush: assert drawn.popovers[0]['panel'] == 'VIEW3D_PT_ipad_brush_access'
        routes.append({'mode': bpy.context.mode, 'tool_buttons': len(ids), 'navigation_buttons': 3,
                       'brush_asset_popover': bool(drawn.popovers)})
        records.append({'mode': bpy.context.mode, 'count': len(ids), 'native_tool_ids': ids,
                        'native_brush_assets_available': bool(brush)})
    bpy.ops.object.mode_set(mode='OBJECT')
    assert bpy.ops.wm.tool_set_by_id(name='builtin.select_box') == {'FINISHED'}
    receipt = module.ipad_native_inventory_receipt(bpy.context)
    assert bpy.ops.view3d.ipad_native_tool(name='builtin.move', inventory=receipt,
                                         expected_tool='builtin.select_box') == {'FINISHED'}
    assert ToolSelectPanelHelper.tool_active_from_context(bpy.context).idname == 'builtin.move'
    space=bpy.context.space_data
    flags=(space.show_region_header,space.show_region_tool_header)
    before=(bpy.context.mode,bpy.context.active_object.as_pointer(),
            bpy.context.window.workspace.as_pointer(),
            tuple(tuple(row) for row in bpy.context.active_object.matrix_world),
            ToolSelectPanelHelper.tool_active_from_context(bpy.context).idname)
    space.show_region_header=space.show_region_tool_header=False
    assert bpy.ops.view3d.ipad_native_controls() == {'FINISHED'}
    assert space.show_region_header and space.show_region_tool_header
    after=(bpy.context.mode,bpy.context.active_object.as_pointer(),
           bpy.context.window.workspace.as_pointer(),
           tuple(tuple(row) for row in bpy.context.active_object.matrix_world),
           ToolSelectPanelHelper.tool_active_from_context(bpy.context).idname)
    assert before==after
    space.show_region_header,space.show_region_tool_header=flags
    # Actual registered inherited menus retain the native context routes.
    assert module.VIEW3D_MT_ipad_selection_options.poll(bpy.context)
    assert not module.VIEW3D_MT_ipad_selection_ring.poll(bpy.context)
    assert module.VIEW3D_MT_ipad_transform_options.poll(bpy.context)
    drawn = draw('VIEW3D_MT_ipad_tool_inventory')
    assert [kwargs['text'].removesuffix('…') for _, kwargs, _ in drawn.operators[:9]] == [label for label, _, _ in module.IPAD_RADIAL_TOOLS]
    assert drawn.operators[2][2].name == 'VIEW3D_MT_ipad_transform_options'
    selection = draw('VIEW3D_MT_ipad_selection_options')
    assert selection.operators[0][2].name == 'VIEW3D_MT_ipad_tool_inventory'
    transform = draw('VIEW3D_MT_ipad_transform_options')
    assert transform.operators[0][2].name == 'VIEW3D_MT_ipad_tool_inventory'
    base = draw('VIEW3D_MT_ipad_base_ring')
    assert len(base.operators) == 7
    assert base.operators[5][2].name == 'VIEW3D_MT_ipad_view_ring'
    assert base.operators[6][1]['text'] == 'Move Options'
    assert base.operators[6][2].name == 'VIEW3D_MT_ipad_transform_options'
    assert [base.operators[i][2].name for i in (0,1,4)] == [
        'VIEW3D_MT_ipad_layout_mode_ring', 'VIEW3D_MT_ipad_tool_inventory', 'VIEW3D_MT_ipad_selection_options']
    assert [base.operators[i][0] for i in (2,3)] == ['ed.undo','ed.redo']
    # Actual native current-tool IDs/icons and preexisting option-route poll.
    shortcuts=[]
    for mode in ('OBJECT','EDIT'):
        if bpy.context.object.mode!='OBJECT': bpy.ops.object.mode_set(mode='OBJECT')
        if mode!='OBJECT': bpy.ops.object.mode_set(mode=mode)
        for name,label in (('builtin.move','Move'),('builtin.rotate','Rotate'),
                           ('builtin.scale','Scale'),('builtin.transform','Transform')):
            assert bpy.ops.wm.tool_set_by_id(name=name)=={'FINISHED'}
            active=ToolSelectPanelHelper.tool_active_from_context(bpy.context)
            actions=('TRANSLATE','ROTATE','SCALE','NONE') if name=='builtin.transform' else (None,)
            for action in actions:
                if action is not None: active.gizmo_group_properties('VIEW3D_GGT_xform_gizmo').drag_action=action
                buttons=draw('VIEW3D_MT_ipad_base_ring').operators
                assert [b[1]['text'] for b in buttons[:5]]==['Layout / Mode','Tools','Undo','Redo','Select']
                if action=='NONE':
                    assert len(buttons)==6
                else:
                    assert len(buttons)==7 and buttons[6][1]['text']==label+' Options'
                    native=next(t for t in module.ipad_native_tool_inventory(bpy.context) if t.idname==name)
                    assert {k:v for k,v in buttons[6][1].items() if k in {'icon','icon_value'}}==module.ipad_native_tool_icon(native)
                    assert buttons[6][1]['depress'] and buttons[6][2].name=='VIEW3D_MT_ipad_transform_options'
                    assert module.VIEW3D_MT_ipad_transform_options.poll(bpy.context)
                shortcuts.append({'mode':bpy.context.mode,'tool':name,'child_action':action,'base_slots':len(buttons)})
        for name in ('builtin.select_box','builtin.cursor'):
            bpy.ops.wm.tool_set_by_id(name=name)
            assert len(draw('VIEW3D_MT_ipad_base_ring').operators)==6
    bpy.ops.object.mode_set(mode='OBJECT')
    bpy.ops.wm.tool_set_by_id(name='builtin.move')
    assert bpy.ops.view3d.ipad_native_tool(name='builtin.rotate', inventory=receipt,
                                         expected_tool='builtin.select_box') == {'CANCELLED'}
    assert bpy.ops.view3d.ipad_native_tool(name='builtin.rotate', inventory=receipt+'obsolete',
                                         expected_tool='builtin.move') == {'CANCELLED'}
    assert ToolSelectPanelHelper.tool_active_from_context(bpy.context).idname == 'builtin.move'
    assert bpy.ops.view3d.ipad_native_tool(name='removed.addon.tool', inventory=receipt,
                                         expected_tool='builtin.move') == {'CANCELLED'}
report={
    'evidence': 'exact target5.0 Python inventory and candidate guarded tool operator on stock host',
    'host_version': bpy.app.version_string,
    'tool_definition_sha256': hashlib.sha256(toolbar).hexdigest(),
    'candidate_python_sha256': hashlib.sha256(source.encode()).hexdigest(),
    'contexts': records, 'menu_routes': routes,
    'registered_base_selection_transform_inventory_routes': 'passed',
    'current_tool_shortcuts': shortcuts,
    'guarded_native_activation_and_refusals': 'passed',
    'registered_native_controls_visibility_action': 'passed; current header restored with tool/mode/workspace/object transform preserved; no popup/target claim',
    'native_popup_modal_and_device_evidence': False}
(repo/'output/ui-preview/pencil-ring-foundation/native-inventory-wiring.json').write_text(
    json.dumps(report,indent=2)+'\n',encoding='utf-8')
print('PENCIL_NATIVE_REPORT=' + json.dumps(report))
