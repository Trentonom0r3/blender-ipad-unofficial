"""Validate the requested nine-slot content in exact packaged Python/policy.
Native RNA/GPU/UIKit are not executed by this source-content check.
"""
import ast
import re
from types import SimpleNamespace

PRIMARY=('builtin.select_box','builtin.move','builtin.rotate','builtin.scale','builtin.cursor')
LABELS=['Layout / Mode','More Tools','Undo','Redo','Select','Move','Rotate','Scale','Cursor']


def verify_nine_base_contract(source, policy):
    tree=ast.parse(source)
    constants={'IPAD_RADIAL_TOOLS','IPAD_BASE_TOOL_IDS'}
    functions={'ipad_more_tool_inventory','ipad_draw_native_tool_inventory'}
    classes={'VIEW3D_MT_ipad_base_ring','VIEW3D_MT_ipad_tool_inventory'}
    nodes=[node for node in tree.body if getattr(node,'name','') in functions|classes or
           isinstance(node,ast.Assign) and any(getattr(t,'id','') in constants for t in node.targets)]
    native_names=list(PRIMARY)+['builtin.transform','builtin.annotate','builtin.measure','builtin.primitive_cube_add','builtin.select_circle','builtin.select_lasso']
    tools=[SimpleNamespace(idname=name,label=name,icon=name) for name in native_names]
    current=tools
    ns={'Menu':object,'ipad_native_tool_inventory':lambda C:current,
        'ipad_native_inventory_receipt':lambda C:'FULL_NATIVE_RECEIPT',
        'ipad_native_tool_icon':lambda T:{'icon_value':101},
        'ToolSelectPanelHelper':SimpleNamespace(tool_active_from_context=lambda C:SimpleNamespace(idname='builtin.move'))}
    # Caller has already matched this entire Python module to trusted exact source.
    exec(compile(ast.Module(body=nodes,type_ignores=[]),'exact-packaged-ring-contract.py','exec'),ns)
    assert ns['IPAD_BASE_TOOL_IDS']==frozenset(PRIMARY),'Wrong Base tool exclusion identities'
    class Layout:
        def __init__(self,records,enabled=True):self.records=records;self.enabled=enabled
        def column(self):return Layout(self.records,self.enabled)
        def row(self):return Layout(self.records,self.enabled)
        def operator(self,name,**kw):
            props=SimpleNamespace();self.records.append((name,kw,props,self.enabled));return props
    for available in (tools,[]):
        current=available;rows=[]
        ns['VIEW3D_MT_ipad_base_ring'].draw(SimpleNamespace(layout=Layout(rows)),SimpleNamespace(mode='OBJECT'))
        assert [row[1]['text'] for row in rows]==LABELS,'Base is not the requested ordered nine actions'
        assert [rows[i][2].name for i in (0,1)]==['VIEW3D_MT_ipad_layout_mode_ring','VIEW3D_MT_ipad_tool_inventory']
        assert [rows[i][0] for i in (2,3)]==['ed.undo','ed.redo']
        assert [row[0] for row in rows[4:]]==['view3d.ipad_native_tool']*5
        assert [row[2].name for row in rows[4:]]==list(PRIMARY)
        for row in rows[4:]:
            assert row[2].inventory=='FULL_NATIVE_RECEIPT' and row[2].expected_tool=='builtin.move'
            assert row[3]==bool(available),'Unavailable tool must be disabled in its fixed slot'
    current=tools;rows=[]
    ns['VIEW3D_MT_ipad_tool_inventory'].draw(SimpleNamespace(layout=Layout(rows)),SimpleNamespace(mode='OBJECT'))
    extra=[name for name in native_names if name not in PRIMARY]
    assert [row[0] for row in rows]==['view3d.ipad_native_tool']*len(extra),'More Tools contains utility/category actions'
    assert [row[2].name for row in rows]==extra,'More Tools lost variants or duplicated Base tools'
    layout=policy.split('inline RingPageLayout ring_page_layout(',1)[1].split('inline bool ring_viewport_matches(',1)[0]
    assert re.search(r'float\s+radius\s*=\s*7\.6f\s*\*\s*unit\s*;',layout),'Missing common Tools radius'
    assert '4.9f' not in layout,'Separate smaller Base geometry retained'
    assert 'const float width = 4.7f * unit;' in layout
    return {'base_actions':LABELS,'base_native_ids':list(PRIMARY),'more_tools_only_native':True,
            'variants_preserved':True,'shared_tools_geometry':True,'unavailable_slots_disabled':True,
            'scope':'Exact packaged source content/policy with explicit RNA/GPU/UIKit boundaries'}
