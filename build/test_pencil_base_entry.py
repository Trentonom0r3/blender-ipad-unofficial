"""Execute Base entry, native header admission and reversible presentation.

Native screen/RNA/window lists and UILayout are fixture boundaries. This is not
a target popup, UIKit or GPU test.
"""
import ast
import types
import textwrap
import unittest
from test_touch_extrude import changed_source
from test_compact_shelf import function
import test_ipad_panels

PYTHON = changed_source('scripts/startup/bl_ui/space_view3d_ipad.py')


def python_nodes(*names, **namespace):
    tree = ast.parse(PYTHON)
    selected = [node for node in tree.body if getattr(node, 'name', '') in names]
    exec(compile(ast.Module(body=selected, type_ignores=[]), 'actual-base-entry.py', 'exec'), namespace)
    return namespace


class PencilBaseEntryTests(unittest.TestCase):
    def test_real_palette_invoke_enters_base_at_resolved_native_window(self):
        calls = []
        class Context:
            window = types.SimpleNamespace(screen=types.SimpleNamespace(areas=[types.SimpleNamespace(type='VIEW_3D')]))
            def temp_override(self, **kwargs):
                calls.append(('override', kwargs))
                return self
            def __enter__(self): return self
            def __exit__(self, *args): return False
        bpy = types.SimpleNamespace(
            props=types.SimpleNamespace(BoolProperty=lambda **kwargs: None),
            ops=types.SimpleNamespace(wm=types.SimpleNamespace(call_menu_pie=lambda *args, **kwargs: calls.append(('menu', args, kwargs)))))
        area, window = object(), object()
        namespace = python_nodes('WM_OT_ipad_tool_palette', Operator=object, bpy=bpy,
                                 ipad_palette_target=lambda C, x, y: (area, window))
        operator = namespace['WM_OT_ipad_tool_palette']()
        context = Context()
        for touch in (False, True):
            operator.touch_targets = touch
            self.assertEqual(operator.invoke(context, types.SimpleNamespace(mouse_x=52, mouse_y=71)), {'FINISHED'})
            self.assertEqual(calls[-2], ('override', {'area': area, 'region': window}))
            self.assertEqual(calls[-1][1], ('INVOKE_DEFAULT', True))
            self.assertEqual(calls[-1][2]['name'], 'VIEW3D_MT_ipad_base_ring')
            self.assertEqual(calls[-1][2].get('ipad_touch_targets', False), touch)
        namespace['ipad_palette_target'] = lambda *args: (None, None)
        before = len(calls)
        self.assertEqual(operator.invoke(context, types.SimpleNamespace(mouse_x=0, mouse_y=0)), {'CANCELLED'})
        self.assertEqual(len(calls), before)

    def test_base_has_exact_nine_direct_actions_and_native_receipts_in_every_mode(self):
        records=[]
        requested=('builtin.select_box','builtin.move','builtin.rotate','builtin.scale','builtin.cursor')
        native=[types.SimpleNamespace(idname=name,label=name,icon=name) for name in requested]
        class Layout:
            enabled=True
            def column(self): return self
            def row(self): return Layout()
            def operator(self, name, **kwargs):
                props=types.SimpleNamespace();records.append((name,kwargs,props,self.enabled));return props
        active=types.SimpleNamespace(idname='builtin.move')
        home=tuple((label,name,'NONE') for label,name in zip(('Select','Move','Rotate','Scale','Cursor'),requested))
        available=list(native)
        namespace=python_nodes('VIEW3D_MT_ipad_base_ring',Menu=object,IPAD_RADIAL_TOOLS=home,
            ipad_native_tool_inventory=lambda C:available,ipad_native_inventory_receipt=lambda C:'FULL-inventory',
            ipad_native_tool_icon=lambda tool:{'icon_value':native.index(tool)+100},
            ToolSelectPanelHelper=types.SimpleNamespace(tool_active_from_context=lambda C:active))
        for mode in ('OBJECT','EDIT_MESH','SCULPT','POSE','PAINT_VERTEX','PAINT_WEIGHT','PAINT_TEXTURE'):
            available[:]=native if mode in {'OBJECT','EDIT_MESH','POSE'} else native[1:4] if mode=='SCULPT' else []
            records.clear()
            namespace['VIEW3D_MT_ipad_base_ring'].draw(types.SimpleNamespace(layout=Layout()),types.SimpleNamespace(mode=mode))
            self.assertEqual([r[1]['text'] for r in records],['Layout / Mode','More Tools','Undo','Redo','Select','Move','Rotate','Scale','Cursor'])
            self.assertEqual([records[i][2].name for i in (0,1)],['VIEW3D_MT_ipad_layout_mode_ring','VIEW3D_MT_ipad_tool_inventory'])
            self.assertEqual([records[i][0] for i in (2,3)],['ed.undo','ed.redo'])
            self.assertEqual([r[0] for r in records[4:]],['view3d.ipad_native_tool']*5)
            self.assertEqual([r[2].name for r in records[4:]],list(requested))
            for row in records[4:]:
                self.assertEqual(row[2].inventory,'FULL-inventory')
                self.assertEqual(row[2].expected_tool,'builtin.move')
                self.assertEqual(row[3],any(t.idname==row[2].name for t in available))
                if row[3]:self.assertIn('icon_value',row[1])
            self.assertFalse(any(r[2].__dict__.get('name') in {'VIEW3D_MT_ipad_view_ring','VIEW3D_MT_ipad_selection_options'} for r in records))
        self.assertNotIn('ipad_active_tool_options_button',PYTHON)

    def test_more_tools_excludes_only_exact_base_ids_and_preserves_variants_and_receipts(self):
        primary={'builtin.select_box','builtin.move','builtin.rotate','builtin.scale','builtin.cursor'}
        extra=['builtin.select_lasso','builtin.select_circle','builtin.transform','builtin.annotate','builtin.measure','builtin.primitive_cube_add','builtin.extrude_region']
        inventory=[types.SimpleNamespace(idname=name,label=name,icon=name) for name in sorted(primary)+extra]
        ns=python_nodes('ipad_more_tool_inventory',IPAD_BASE_TOOL_IDS=primary,ipad_native_tool_inventory=lambda C:inventory)
        more=ns['ipad_more_tool_inventory'](None)
        self.assertEqual([t.idname for t in more],extra)
        self.assertFalse(primary & {t.idname for t in more})
        # The source constant, rather than labels/group ownership, defines the exclusion.
        constant=next(n for n in ast.parse(PYTHON).body if isinstance(n,ast.Assign) and any(getattr(t,'id','')=='IPAD_BASE_TOOL_IDS' for t in n.targets))
        self.assertEqual(ast.literal_eval(constant.value.args[0]),primary)
        inventory[:]=inventory[len(primary):]
        self.assertEqual(ns['ipad_more_tool_inventory'](None),tuple(inventory))

    def test_selected_transform_selects_directly_and_corner_controls_are_collapsed(self):
        records=[]
        tool=types.SimpleNamespace(idname='builtin.move',label='Move')
        class Layout:
            def operator(self,name,**kwargs):
                props=types.SimpleNamespace();records.append(('operator',name,kwargs,props));return props
            def popover(self,**kwargs):records.append(('popover',kwargs))
        ns=python_nodes('ipad_draw_native_tool_inventory',
            ToolSelectPanelHelper=types.SimpleNamespace(tool_active_from_context=lambda C:tool),
            ipad_native_inventory_receipt=lambda C:'receipt',ipad_native_tool_inventory=lambda C:[tool],
            ipad_native_tool_icon=lambda T:{'icon_value':101},IPAD_RADIAL_TOOLS=(('Move','builtin.move',''),),
            ipad_context_ring_name=lambda C:None,
            IPAD_TRANSFORM_TOOLS={'builtin.move':()},
            VIEW3D_PT_ipad_transform=types.SimpleNamespace(poll=lambda C:True))
        ns['ipad_draw_native_tool_inventory'](Layout(),types.SimpleNamespace(mode='OBJECT'))
        self.assertEqual(records[0][:3],('operator','view3d.ipad_native_tool',{'text':'Move','icon_value':101,'depress':True}))
        self.assertEqual(records[0][3].name,'builtin.move')
        tool.idname='builtin.transform';tool.label='Transform';records.clear()
        ns['ipad_draw_native_tool_inventory'](Layout(),types.SimpleNamespace(mode='OBJECT'))
        self.assertEqual(records[0][:3],('operator','view3d.ipad_native_tool',{'text':'Transform','icon_value':101,'depress':True}))
        self.assertEqual(records[0][3].name,'builtin.transform')
        for name in ('VIEW3D_PT_ipad_corner_transform','VIEW3D_PT_ipad_corner_selection','VIEW3D_PT_ipad_corner_view'):
            corner=next(n for n in ast.parse(PYTHON).body if getattr(n,'name','')==name)
            self.assertIn("bl_region_type = 'HUD'",ast.unparse(corner))
            self.assertIn("bl_options = {'DEFAULT_CLOSED'}",ast.unparse(corner))
        panel=next(n for n in ast.parse(PYTHON).body if getattr(n,'name','')=='VIEW3D_PT_ipad_transform')
        text=ast.unparse(panel)
        self.assertIn("bl_label = 'Next drag'",text)
        self.assertIn('bl_ui_units_x = 14',text)
        self.assertNotIn('ipad_transform_numbers',text)
        for field in ('use_accurate','transform_pivot_point','use_snap','drag_action'):
            self.assertIn(field,text)

    def test_native_header_capability_uses_actual_adapted_single_window_bounds(self):
        source = changed_source('source/blender/makesrna/intern/rna_screen.cc')
        getter = function(source, 'static bool rna_Area_ipad_pencil_header_supported_get(')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#define WITH_APPLE_CROSSPLATFORM
#include <cassert>
#include <vector>
constexpr int SPACE_VIEW3D=1,RGN_TYPE_WINDOW=1,RGN_TYPE_HEADER=2;
constexpr int RGN_FLAG_HIDDEN=1,RGN_FLAG_TOO_SMALL=2,RGN_FLAG_POLL_FAILED=4;
float unit=20;
#define UI_UNIT_X unit
#define UI_UNIT_Y unit
#define LISTBASE_FOREACH(type,item,base) for(type item:*(base))
struct bScreen{bool enabled=true;};
struct Rect{int xmin=0,xmax=799,ymin=0,ymax=599;};
struct Runtime{bool visible=true,ipad_canvas=true;Rect ipad_canvas_rect;};
struct ARegion{int regiontype=RGN_TYPE_WINDOW;Runtime *runtime;int flag=0,winx=800,winy=600;};
struct ScrArea{int spacetype=SPACE_VIEW3D;struct{int ipad_layer=1;}runtime;std::vector<ARegion*> regionbase;};
struct PointerRNA{void *owner_id,*data;};
bool ED_ipad_panels_enabled(const bScreen *screen){return screen&&screen->enabled;}
GETTER
int main(){bScreen screen;Runtime runtime;ARegion window{RGN_TYPE_WINDOW,&runtime},header{RGN_TYPE_HEADER,&runtime};ScrArea area;
 area.regionbase={&header,&window};PointerRNA pointer{&screen,&area};
 for(float scale:{1.f,1.5f,2.f}){unit=20*scale;
  for(int w:{479,480,600})for(int h:{279,280,600}){
   window.winx=int(w*scale);window.winy=int(h*scale);
   runtime.ipad_canvas_rect={0,window.winx-1,0,window.winy-1};
   assert(rna_Area_ipad_pencil_header_supported_get(&pointer)==(w>=480&&h>=280));
  }
 }
 unit=20;window.winx=800;window.winy=600;runtime.ipad_canvas_rect={0,799,0,599};
 for(int flag:{RGN_FLAG_HIDDEN,RGN_FLAG_TOO_SMALL,RGN_FLAG_POLL_FAILED}){
  window.flag=flag;assert(!rna_Area_ipad_pencil_header_supported_get(&pointer));
 }
 window.flag=0;runtime.visible=false;assert(!rna_Area_ipad_pencil_header_supported_get(&pointer));runtime.visible=true;
 runtime.ipad_canvas=false;assert(!rna_Area_ipad_pencil_header_supported_get(&pointer));runtime.ipad_canvas=true;
 runtime.ipad_canvas_rect.xmax=478;assert(!rna_Area_ipad_pencil_header_supported_get(&pointer));runtime.ipad_canvas_rect.xmax=799;
 area.regionbase.push_back(&window);assert(!rna_Area_ipad_pencil_header_supported_get(&pointer));area.regionbase.pop_back();
 area.runtime.ipad_layer=0;assert(!rna_Area_ipad_pencil_header_supported_get(&pointer));area.runtime.ipad_layer=1;
 screen.enabled=false;assert(!rna_Area_ipad_pencil_header_supported_get(&pointer));screen.enabled=true;
 assert(rna_Area_ipad_pencil_header_supported_get(&pointer));
}
'''.replace('GETTER', getter))
        self.assertIn('RNA_def_property_clear_flag(prop, PROP_EDITABLE)', source[source.index('"ipad_pencil_header_supported", PROP_BOOLEAN'):])

    def test_default_header_is_unmodified_and_no_custom_widgets_are_inserted(self):
        class Layout:
            def __init__(self): self.actions = []
            def row(self, **kwargs): return self
            def operator(self, name, **kwargs):
                props = types.SimpleNamespace()
                self.actions.append((name, kwargs, props))
                return props
            def label(self, **kwargs): self.actions.append(('label', kwargs, None))
            def popover(self, **kwargs): self.actions.append(('popover', kwargs, None))
        namespace = python_nodes('ipad_pencil_header_supported', 'ipad_editing_shelf_enabled', 'draw_canvas_header',
                                 ipad_context_ring_name=lambda C: 'VIEW3D_MT_ipad_transform_ring',
                                 ipad_canvas_caption=lambda C: 'Object Mode · Move · X · Fine',
                                 ipad_camera_state=lambda C: None, ipad_bevel_state=lambda C: None)
        context = types.SimpleNamespace(area=types.SimpleNamespace(type='VIEW_3D', ipad_pencil_header_supported=True),
                    mode='OBJECT', space_data=types.SimpleNamespace(show_region_tool_header=False),
                    window_manager=types.SimpleNamespace(ipad_flythrough_active=False))
        for _ in range(10000):
            row = Layout()
            self.assertFalse(namespace['draw_canvas_header'](row, context))
            self.assertEqual(row.actions, [])
        for mode in ('SCULPT', 'PAINT_TEXTURE', 'EDIT_CURVE', 'EDIT_GREASE_PENCIL', 'EDIT_CURVES'):
            context.mode = mode
            self.assertFalse(namespace['draw_canvas_header'](Layout(), context))
        context.mode = 'EDIT_MESH'
        for attribute, value in (('ipad_pencil_header_supported', False),):
            setattr(context.area, attribute, value)
            self.assertFalse(namespace['draw_canvas_header'](Layout(), context))
            setattr(context.area, attribute, True)
        context.space_data.show_region_tool_header = True
        self.assertFalse(namespace['draw_canvas_header'](Layout(), context))
        context.space_data.show_region_tool_header = False
        context.window_manager.ipad_flythrough_active = True
        self.assertFalse(namespace['draw_canvas_header'](Layout(), context))
        # No patch section means the entire shipped native header module is
        # the pinned Blender version, with no injected replacement or row.
        from pathlib import Path
        patch = (Path(__file__).resolve().parents[1] / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        self.assertNotIn('diff --git a/scripts/startup/bl_ui/space_view3d.py ', patch)

    def test_disabled_shelf_refuses_before_native_header_poll(self):
        source = changed_source('source/blender/editors/screen/screen_ipad_panels.cc')
        rectangle = function(source, 'bool ED_ipad_editing_shelf_rect(')
        self.assertLess(rectangle.index('editing_shelf_enabled'), rectangle.index('BLI_findstring'))
        tree = ast.parse(PYTHON)
        header = next(n for n in tree.body if isinstance(n, ast.ClassDef) and n.name == 'VIEW3D_HT_ipad_editing_shelf')
        namespace = python_nodes('ipad_editing_shelf_enabled', 'VIEW3D_HT_ipad_editing_shelf',
                                 Header=object, IPAD_SELECT_ALL={'OBJECT'}, draw_editing_shelf=lambda *args: None)
        C = types.SimpleNamespace(window_manager=types.SimpleNamespace(), area=types.SimpleNamespace(type='VIEW_3D'), mode='OBJECT')
        self.assertFalse(namespace[header.name].poll(C))
        C.window_manager.ipad_editing_shelf_enabled = True
        self.assertTrue(namespace[header.name].poll(C))
        C.window_manager.ipad_editing_shelf_enabled = False
        self.assertFalse(namespace[header.name].poll(C))


if __name__ == '__main__':
    unittest.main()
