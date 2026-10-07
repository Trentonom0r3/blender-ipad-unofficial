"""Execute native fallback close admission and actual Python visibility action.

UI lists/RNA/WM dispatch are fixture APIs; no target modal or device claim.
"""
import ast
from pathlib import Path
import types
import unittest
from test_touch_extrude import changed_source
from test_tool_ring import ring_source
from test_pencil_callback_disposal import definition
import test_ipad_panels

PYTHON=changed_source('scripts/startup/bl_ui/space_view3d_ipad.py')
HANDLERS=changed_source('source/blender/editors/interface/interface_handlers.cc')
POPUP=(Path(__file__).parent/'fixtures/pinned_ui_popup_close.hh').read_text(encoding='utf-8')

class PencilNativeFallbackTests(unittest.TestCase):
    def test_native_close_is_value_only_and_precedes_deferred_ownership_transfer(self):
        prepare=definition(HANDLERS,'static bool ui_ipad_native_controls_prepare(')
        apply=definition(HANDLERS,'static void ui_apply_but_func(')
        self.assertLess(apply.index('ui_ipad_native_controls_prepare'),apply.index('ui_afterfunc_new()'))
        self.assertLess(apply.index('ui_ipad_native_controls_prepare'),apply.index('after->optype = but->optype'))
        close=definition(POPUP,'void UI_popup_menu_close(const uiBlock *')
        close_but=definition(POPUP,'void UI_popup_menu_close_from_but(')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(ring_source().replace('#pragma once','')+r'''
#include <cassert>
namespace ipad_ring=blender::ui::ipad;
struct wmOperatorType{};wmOperatorType controls,other;bool registered=true;
struct bContext{bool live=true;};
struct uiBlock{ipad_ring::ActionOrigin ipad_action_origin;int retval=0;uiBlock *parent=nullptr;};
struct uiBut{uiBlock *block=nullptr;wmOperatorType *optype=nullptr;};
struct uiIPadButtonLease{uiBut *but=nullptr;};
enum {UI_RETURN_CANCEL=1,UI_RETURN_OK=2};int closes=0;
wmOperatorType *WM_operatortype_find(const char *name,bool quiet){assert(quiet&&std::string_view(name)=="VIEW3D_OT_ipad_native_controls");return registered?&controls:nullptr;}
uiIPadButtonLease ui_ipad_button_lease_capture(uiBut *but){return {but};}
uiBut *ui_ipad_button_lease_resolve(bContext *C,const uiIPadButtonLease &lease){return C->live?lease.but:nullptr;}
void UI_popup_menu_retval_set(const uiBlock *block,int retval,bool enable){++closes;assert(enable);const_cast<uiBlock *>(block)->retval=retval;}
'''+close+close_but+prepare+r'''
int main(){bContext C;uiBlock root,child;child.parent=&root;
 child.ipad_action_origin=ipad_ring::ActionOrigin::capture({1,2,3,4,5,6,7,8,9,0,11,12,13},"builtin.move",7);
 uiBut but{&child,&controls};
 for(int i=0;i<10000;++i){root.retval=child.retval=0;assert(ui_ipad_native_controls_prepare(&C,&but));assert(root.retval==0&&child.retval==UI_RETURN_OK);}
 int before=closes;C.live=false;assert(!ui_ipad_native_controls_prepare(&C,&but));assert(closes==before);
 C.live=true;but.optype=&other;assert(ui_ipad_native_controls_prepare(&C,&but)&&closes==before);
 but.optype=&controls;child.ipad_action_origin={};assert(ui_ipad_native_controls_prepare(&C,&but)&&closes==before);
}
''')

    def test_actual_python_action_only_restores_current_native_header(self):
        tree=ast.parse(PYTHON)
        cls=next(n for n in tree.body if isinstance(n,ast.ClassDef) and n.name=='VIEW3D_OT_ipad_native_controls')
        module=ast.Module(body=[cls],type_ignores=[])
        namespace={'Operator':object}
        exec(compile(module,'actual-native-controls.py','exec'),namespace)
        operator=namespace[cls.name]()
        redraw=[]
        space=types.SimpleNamespace(type='VIEW_3D',show_region_header=False,show_region_tool_header=False,show_region_ui=False)
        context=types.SimpleNamespace(area=types.SimpleNamespace(type='VIEW_3D',tag_redraw=lambda:redraw.append(1)),space_data=space)
        for _ in range(10000):
            self.assertEqual(operator.execute(context),{'FINISHED'})
        self.assertTrue(space.show_region_header and space.show_region_tool_header)
        self.assertFalse(space.show_region_ui)
        self.assertEqual(len(redraw),10000)
        context.area.type='IMAGE_EDITOR';space.show_region_header=False
        self.assertEqual(operator.execute(context),{'CANCELLED'})
        self.assertFalse(space.show_region_header)

    def test_transform_and_brush_offer_fallback_before_broader_property_draw(self):
        tree=ast.parse(PYTHON)
        for name,first_property in (('VIEW3D_PT_ipad_transform','layout.prop'),
                                    ('VIEW3D_PT_ipad_brush_access','self.layout.label')):
            cls=next(n for n in tree.body if isinstance(n,ast.ClassDef) and n.name==name)
            text=ast.get_source_segment(PYTHON,cls)
            self.assertLess(text.index('ipad_native_controls_button'),text.index(first_property))
            self.assertIn("'INVOKE_REGION_WIN'",text)
        brush=ast.get_source_segment(PYTHON,next(n for n in tree.body if isinstance(n,ast.ClassDef) and n.name=='VIEW3D_PT_ipad_brush_access'))
        self.assertNotIn('draw_popup_selector',brush)
        self.assertNotIn('draw_active_tool_header',brush)
        registration=next(n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='classes' for t in n.targets))
        self.assertIn('VIEW3D_OT_ipad_native_controls',ast.get_source_segment(PYTHON,registration))

if __name__=='__main__':
    unittest.main()
