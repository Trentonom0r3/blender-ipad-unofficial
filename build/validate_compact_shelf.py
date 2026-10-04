"""Factory host Blender: actual tool/RNA state and compact/full Python routes.

UILayout is recorded; the new native-only finger flag is a value in this harness.
Target native popup/input ownership still requires the exact iOS build and device.
"""
from pathlib import Path
from types import ModuleType, SimpleNamespace
import hashlib
import json
import bpy

repo=Path(__file__).resolve().parents[1]
patch=(repo/'patches/blender-ipad.patch').read_text(encoding='utf-8')
path='scripts/startup/bl_ui/space_view3d_ipad.py'
section=patch.split(f'diff --git a/{path} b/{path}\n',1)[1].split('diff --git ',1)[0]
source='\n'.join(line[1:] for line in section.splitlines() if line.startswith('+') and not line.startswith('+++'))
module=ModuleType('compact_shelf_validation')
exec(compile(source,path,'exec'),module.__dict__)
for cls in module.classes:bpy.utils.register_class(cls)
from bl_ui.space_toolsystem_toolbar import VIEW3D_PT_tools_active
VIEW3D_PT_tools_active.register_ensure()

class Layout:
    def __init__(self,records,grids,grid=None):
        self.records,self.grids,self.grid=records,grids,grid
        self.enabled=True
    def column(self,**kw):return Layout(self.records,self.grids,self.grid)
    def row(self,**kw):return Layout(self.records,self.grids,self.grid)
    def grid_flow(self,**kw):
        self.grids.append(kw)
        return Layout(self.records,self.grids,len(self.grids)-1)
    def label(self,**kw):self.records.append(('label',None,kw,self.grid))
    def operator(self,name,**kw):
        props=SimpleNamespace();self.records.append((name,props,kw,self.grid));return props
    def popover(self,**kw):self.records.append(('popover',None,kw,self.grid))
    def prop(self,data,name,**kw):self.records.append(('property',name,kw,self.grid))
    def separator(self,**kw):pass
    def menu(self,*args,**kw):pass

area=next(a for a in bpy.context.window.screen.areas if a.type=='VIEW_3D')
region=next(r for r in area.regions if r.type=='WINDOW')
results=[]
def draw(width,expanded=False):
    assert bpy.ops.view3d.ipad_shelf_toggle(expanded=expanded)=={'FINISHED'}
    records,grids=[],[]
    module.draw_editing_shelf(Layout(records,grids),bpy.context,width_units=width)
    return records,grids

def checks(tool,width,ring=None,panel=None):
    records,grids=draw(width)
    mode_controls=[r for r in records if r[0]=='wm.call_menu_pie' and getattr(r[1], 'name', None)=='VIEW3D_MT_ipad_modes']
    assert len(mode_controls)==1 and mode_controls[0][1].ipad_touch_targets
    buttons=[r for r in records if r[0]!='label' and r not in mode_controls]
    assert buttons[0][0]=='wm.ipad_tool_palette' and buttons[0][1].touch_targets
    has_context=bool(ring or panel)
    assert len(buttons)==(5 if has_context else 4)
    if ring:
        assert buttons[1][0]=='wm.call_menu_pie' and buttons[1][1].name==ring
        assert buttons[1][1].ipad_touch_targets is True
    elif panel:
        assert buttons[1][0]=='popover' and buttons[1][2]['panel']==panel
    undo=next(i for i,r in enumerate(buttons) if r[0]=='ed.undo')
    assert buttons[undo+1][0]=='ed.redo' and buttons[undo][3]==buttons[undo+1][3]
    assert grids[buttons[undo][3]]['columns']==(2 if width<13.2 else (5 if has_context else 4))
    toggle=next(r for r in buttons if r[0]=='view3d.ipad_shelf_toggle')
    assert toggle[1].expanded is True and toggle[2]['text']=='Expand'
    full,fullgrids=draw(width,True)
    assert any(r[0]=='view3d.ipad_shelf_toggle' and r[1].expanded is False and r[2]['text']=='Collapse' for r in full)
    if ring=='VIEW3D_MT_ipad_selection_ring':
        assert any(r[0]=='popover' and r[2]['panel']=='VIEW3D_PT_ipad_selection' for r in full)
    if not has_context:
        assert not any(r[0]=='popover' and r[2]['panel']=='VIEW3D_PT_ipad_selection' for r in full)
        assert any(r[0]=='wm.search_menu' for r in full)
    results.append({'mode':bpy.context.mode,'tool':tool,'width_units':width,
        'compact_labels':[r[2]['text'] for r in records if r[0]=='label'],
        'compact_buttons':[r[2].get('text','') or r[0] for r in buttons],
        'columns':[g['columns'] for g in grids],
        'context_ring':ring,'native_panel':panel,'expanded_grids':[g['columns'] for g in fullgrids]})
    return records

with bpy.context.temp_override(area=area,region=region):
    assert not module.ipad_editing_shelf_expanded(bpy.context)
    assert 'UNDO' not in module.VIEW3D_OT_ipad_shelf_toggle.bl_options
    for mode in ('OBJECT','EDIT'):
        bpy.ops.object.mode_set(mode=mode)
        for tool in ('builtin.select_box','builtin.select_lasso'):
            for action in ('SET','ADD','SUB','AND'):
                if action=='AND':
                    active=module.ToolSelectPanelHelper.tool_active_from_context(bpy.context)
                    active.operator_properties('view3d.select_lasso' if tool.endswith('lasso') else 'view3d.select_box').mode=action
                else:bpy.ops.view3d.ipad_selection_tool(tool=tool,mode=action)
                for width in (9.6,12.,16.):
                    records=checks(tool,width,ring='VIEW3D_MT_ipad_selection_ring')
                    caption=' '.join(r[2]['text'] for r in records if r[0]=='label')
                    expected={'SET':'Replace','ADD':'Add','SUB':'Remove','AND':'Custom'}[action]
                    assert expected in caption,(action,caption)
                    if mode=='EDIT':assert ('V' if width<13.2 else 'Vertex') in caption
        for tool,operator in (('builtin.move','transform.translate'),('builtin.rotate','transform.rotate'),('builtin.scale','transform.resize')):
            bpy.ops.wm.tool_set_by_id(name=tool)
            active=module.ToolSelectPanelHelper.tool_active_from_context(bpy.context)
            active.operator_properties(operator).constraint_axis=(False,True,False)
            active.operator_properties(operator).use_accurate=True
            bpy.context.tool_settings.use_snap=True
            for width in (9.6,12.,16.):
                records=checks(tool,width,ring='VIEW3D_MT_ipad_transform_ring')
                caption=' '.join(r[2]['text'] for r in records if r[0]=='label')
                assert 'Y' in caption and 'Fine' in caption and 'Snap' in caption
        bpy.ops.wm.tool_set_by_id(name='builtin.transform')
        active=module.ToolSelectPanelHelper.tool_active_from_context(bpy.context)
        active.gizmo_group_properties('VIEW3D_GGT_xform_gizmo').drag_action='NONE'
        records=checks('builtin.transform',16.,panel='VIEW3D_PT_ipad_transform')
        assert next(r for r in records if r[0]=='popover')[2]['text']=='Action'
        full,_=draw(36.,True)
        assert 'Transform Â· Transform' not in ' '.join(r[2].get('text','') for r in full)
        active.gizmo_group_properties('VIEW3D_GGT_xform_gizmo').drag_action='ROTATE'
        checks('builtin.transform',16.,ring='VIEW3D_MT_ipad_transform_ring')
        if mode=='EDIT':
            bpy.ops.wm.tool_set_by_id(name='builtin.bevel')
            checks('builtin.bevel',16.,panel='VIEW3D_PT_ipad_bevel')
        for tool in ('builtin.cursor','builtin.annotate','builtin.measure'):
            bpy.ops.wm.tool_set_by_id(name=tool)
            for width in (9.6,16.):checks(tool,width)
    for paint_mode in ('SCULPT','VERTEX_PAINT','WEIGHT_PAINT','TEXTURE_PAINT'):
        bpy.ops.object.mode_set(mode=paint_mode)
        assert module.VIEW3D_MT_ipad_modes.poll(bpy.context)
        assert not module.VIEW3D_HT_ipad_editing_shelf.poll(bpy.context)
        records=[]
        original=module.ipad_editing_shelf_visible
        module.ipad_editing_shelf_visible=lambda context:False
        module.draw_canvas_header(Layout(records,[]))
        module.ipad_editing_shelf_visible=original
        assert any(r[0]=='wm.call_menu_pie' and getattr(r[1],'name',None)=='VIEW3D_MT_ipad_modes' for r in records)
        bpy.ops.object.mode_set(mode='OBJECT')
    bpy.ops.object.mode_set(mode='OBJECT')
    bpy.ops.wm.tool_set_by_id(name='builtin.move')
    # Stock host lacks the target Region receipt; real quad-view visibility adapter checks Python fallback.
    old=module.ipad_editing_shelf_visible
    for visible in (False,True):
        module.ipad_editing_shelf_visible=lambda context,v=visible:v
        records=[];module.draw_canvas_header(Layout(records,[]))
        ring=[r for r in records if r[0]=='wm.ipad_tool_palette']
        assert bool(ring)==(not visible)
        if ring:assert ring[0][1].touch_targets
        collapse=[r for r in records if r[0]=='view3d.ipad_shelf_toggle']
        assert bool(collapse)==(not visible)  # Expanded preference still true: always recover compact.
        if collapse:assert collapse[0][1].expanded is False
    module.ipad_editing_shelf_visible=old
    bpy.ops.view3d.ipad_shelf_toggle(expanded=False)

output=repo/'output/ui-preview/mode-access/compact-validation.json'
output.parent.mkdir(parents=True,exist_ok=True)
output.write_text(json.dumps({'host':bpy.app.version_string,'checks':results,
 'canonical_patch_sha256':hashlib.sha256(patch.encode()).hexdigest(),
 'scope':'Actual host Python routing and native tool/RNA state; UILayout and target-only finger flag recorded. New native teardown/popup/input and iPad acceptance unverified.'},indent=2)+'\n',encoding='utf-8')
print('PASS: compact/full tool context, narrow adjacent history, truthful advanced routes, native shelf toggle and header fallback')
