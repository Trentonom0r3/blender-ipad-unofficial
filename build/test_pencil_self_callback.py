"""Execute actual native self-call refusal, Snap normalization and migration.

Native owner/RNA APIs are fixture boundaries, covered by separate RNA tests.
This does not establish target modal or device acceptance.
"""
import unittest
from test_touch_extrude import changed_source
from test_tool_ring import ring_source
from test_pencil_callback_disposal import definition
import test_ipad_panels

SOURCE = changed_source('source/blender/editors/interface/interface.cc')
LAYOUT = changed_source('source/blender/editors/interface/interface_layout.cc')
HANDLERS = changed_source('source/blender/editors/interface/interface_handlers.cc')
RECEIPT = changed_source('source/blender/editors/interface/interface_ipad_rna.hh').replace('#pragma once', '')
FUNCTIONS = '\n'.join(definition(LAYOUT, s) for s in (
    'static void ui_item_enum_expand_handle(', 'bool ui_ipad_snap_callback_matches(')
) + '\n' + '\n'.join(definition(SOURCE, s) for s in (
    'static bool ui_ipad_but_snap_callback_allowed(',
    'bool ui_ipad_but_self_callback_allowed(',
    'bool ui_ipad_but_direct_property_allowed(',
    'static bool ui_ipad_but_migration_matches(',
    'bool ui_ipad_numbers_but_rebind(',
    'void UI_but_func_set(uiBut *but, uiButHandleFunc'))

WORLD = r'''
#include <cassert>
#include <cstring>
namespace ipad_ring = blender::ui::ipad;
struct StructRNA{};StructRNA RNA_ToolSettings;
struct ID{};struct ToolSettings{int snap_mode=0;};
struct Scene{ID id;ToolSettings *toolsettings=nullptr;};
struct PointerRNA{ID *owner_id=nullptr;StructRNA *type=nullptr;void *data=nullptr;};
struct PropertyRNA{};
struct wmWindow{struct Event{int modifier=0;} event;Event *eventstate=&event;};
struct bContext{bool live=true,rebind=true;Scene *scene=nullptr;wmWindow win;};
struct uiPopupBlockHandle{int menuretval=0;};
struct uiBlock{ipad_ring::ActionOrigin ipad_action_origin;void *evil_C=nullptr;
 uiPopupBlockHandle *handle=nullptr;void *handle_func=nullptr;};
using uiButHandleFunc=void (*)(bContext *,void *,void *);
struct uiBut{uiBlock *block=nullptr;uiIPadRNAReceipt ipad_rna_receipt;
 bool ipad_snap_callback=false;int ipad_snap_callback_value=0;bool ipad_callback_retired=false;
 uiButHandleFunc func=nullptr;void *func_arg1=nullptr,*func_arg2=nullptr;
 void *identity_cmp_func=nullptr;PointerRNA rnapoin;PropertyRNA *rnaprop=nullptr;};
enum {KM_SHIFT=1,UI_RETURN_CANCEL=1,WM_UI_HANDLER_BREAK=1};
#define POINTER_AS_INT(p) int(intptr_t(p))
#define POINTER_FROM_INT(i) reinterpret_cast<void *>(intptr_t(i))
int reads=0,writes=0,rebinds=0,freed=0,outer_writes=0;
wmWindow *CTX_wm_window(bContext *C){return &C->win;}
Scene *CTX_data_scene(bContext *C){return C->scene;}
bool ui_ipad_action_origin_valid(bContext *C,const ipad_ring::ActionOrigin &o){return !o.present()||C->live;}
bool ui_ipad_but_rna_rebind(bContext *C,uiBut *){++rebinds;return C->live&&C->rebind;}
int RNA_property_enum_get(PointerRNA *p,PropertyRNA *){++reads;return static_cast<ToolSettings *>(p->data)->snap_mode;}
void RNA_property_enum_set(PointerRNA *p,PropertyRNA *,int value){++writes;static_cast<ToolSettings *>(p->data)->snap_mode=value;}
void ui_but_active_free(bContext *,uiBut *){++freed;}
struct uiHandleButtonData{bool cancel=false;};struct wmEvent{};
'''
FIXTURE = r'''
struct Fixture{
 ToolSettings settings;Scene scene{{},&settings};bContext C;uiBlock block;
 uiPopupBlockHandle popup;uiBut but;PropertyRNA prop;
 Fixture(){(void)&ui_ipad_but_migration_matches;C.scene=&scene;block.evil_C=&C;block.handle=&popup;
  block.ipad_action_origin=ipad_ring::ActionOrigin::capture({1,2,3,4,5,6,7,8,9,0,11,12,13},"builtin.move",7);
  but.block=&block;but.rnapoin={&scene.id,&RNA_ToolSettings,&settings};but.rnaprop=&prop;
  but.ipad_rna_receipt.owner=uiIPadRNAOwner::Scene;but.ipad_rna_receipt.valid=true;
  but.ipad_rna_receipt.property_id="snap_elements_base";
  uiIPadRNAPathStep root,leaf;root.name="tool_settings";leaf.name="snap_elements_base";
  but.ipad_rna_receipt.steps={root,leaf};
  UI_but_func_set(&but,ui_item_enum_expand_handle,&but,POINTER_FROM_INT(4));
  but.ipad_snap_callback=true;but.ipad_snap_callback_value=4;}
};
void unknown_callback(bContext *,void *,void *){assert(false);}
'''

class PencilSelfCallbackTests(unittest.TestCase):
    def run_source(self, main, extra=''):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(
            ring_source().replace('#pragma once', '') + RECEIPT + WORLD + FUNCTIONS + FIXTURE + extra + main)

    def test_native_snap_normalization_preserves_shift_and_only_exact_profile(self):
        self.run_source(r'''
int main(){Fixture f;
 for(int i=0;i<10000;++i){
  assert(ui_ipad_but_self_callback_allowed(&f.C,&f.but));
  f.settings.snap_mode=7;f.C.win.event.modifier=0;
  f.but.func(&f.C,f.but.func_arg1,f.but.func_arg2);assert(f.settings.snap_mode==4);
  f.settings.snap_mode=1;f.but.func(&f.C,f.but.func_arg1,f.but.func_arg2);assert(f.settings.snap_mode==4);
  f.C.win.event.modifier=KM_SHIFT;f.settings.snap_mode=7;
  int before=writes;f.but.func(&f.C,f.but.func_arg1,f.but.func_arg2);
  assert(f.settings.snap_mode==7&&writes==before);
 }
 f.but.ipad_rna_receipt.property_id="snap_elements_individual";
 f.but.ipad_rna_receipt.steps[1].name="snap_elements_individual";
 assert(ui_ipad_but_self_callback_allowed(&f.C,&f.but));
}
''')

    def test_refuses_forged_callback_tag_arguments_binding_and_unknown_self(self):
        self.run_source(r'''
int main(){
 for(int variant=0;variant<12;++variant){Fixture f;
  if(variant==0)f.but.ipad_snap_callback=false;
  if(variant==1)f.but.func=unknown_callback;
  if(variant==2)f.but.func_arg2=POINTER_FROM_INT(8);
  if(variant==3)f.but.ipad_rna_receipt.owner=uiIPadRNAOwner::Brush;
  if(variant==4)f.but.ipad_rna_receipt.valid=false;
  if(variant==5)f.but.ipad_rna_receipt.steps[0].name="unrelated";
  if(variant==6)f.but.ipad_rna_receipt.steps[0].index=0;
  if(variant==7)f.but.ipad_rna_receipt.property_id="use_snap";
  if(variant==8)f.C.rebind=false;
  if(variant==9)f.C.live=false;
  if(variant==10)f.but.rnapoin.type=nullptr;
  if(variant==11)f.but.rnapoin.data=reinterpret_cast<void *>(1);
  reads=writes=0;assert(!ui_ipad_but_self_callback_allowed(&f.C,&f.but));
  assert(!ui_ipad_numbers_but_rebind(&f.but));assert(reads==0&&writes==0);
 }
 Fixture f;f.but.func=unknown_callback;f.but.func_arg1=nullptr;f.but.func_arg2=&f.but;
 assert(!ui_ipad_but_self_callback_allowed(&f.C,&f.but));
 f.block.ipad_action_origin={};assert(ui_ipad_but_self_callback_allowed(&f.C,&f.but));
}
''')

    def test_outer_apply_and_event_refuse_before_cancel_restoration_or_writes(self):
        apply = definition(HANDLERS, 'static void ui_apply_but(')
        apply = apply[:apply.index('  const ButType but_type')] + '  (void)interactive;++outer_writes;\n}\n'
        event = definition(HANDLERS, 'static int ui_handle_button_event(')
        event = event[:event.index('  uiHandleButtonData *data = but->active;')] + '  (void)event;++outer_writes;return 0;\n}\n'
        self.run_source(r'''
int main(){Fixture f;uiHandleButtonData data;wmEvent event;f.but.func=unknown_callback;
 data.cancel=true;ui_apply_but(&f.C,&f.block,&f.but,&data,true);
 assert(data.cancel&&outer_writes==0&&f.popup.menuretval==UI_RETURN_CANCEL);
 assert(ui_handle_button_event(&f.C,&event,&f.but)==WM_UI_HANDLER_BREAK);
 assert(freed==1&&outer_writes==0&&writes==0);
 f.block.ipad_action_origin={};ui_apply_but(&f.C,&f.block,&f.but,&data,false);
 assert(outer_writes==1);
}
''', apply + event)

    def test_property_operator_admission_precedes_writable_pointer_exposure(self):
        accessor = definition(HANDLERS, 'uiBut *UI_region_active_but_prop_get(')
        self.assertLess(accessor.index('ui_ipad_but_direct_property_allowed'), accessor.index('*r_ptr = activebut->rnapoin'))
        handle = definition(HANDLERS, 'void UI_context_active_but_prop_handle(')
        self.assertLess(handle.index('ui_ipad_but_direct_property_allowed'), handle.index('activebut->func(C'))
        self.run_source(r'''
int main(){Fixture f;assert(ui_ipad_but_direct_property_allowed(&f.C,&f.but));
 f.block.handle_func=reinterpret_cast<void *>(1);assert(!ui_ipad_but_direct_property_allowed(&f.C,&f.but));
 f.block.handle_func=nullptr;f.but.func=unknown_callback;f.but.func_arg1=nullptr;
 assert(!ui_ipad_but_direct_property_allowed(&f.C,&f.but));
 f.but.func=nullptr;assert(ui_ipad_but_direct_property_allowed(&f.C,&f.but));
 f.C.rebind=false;assert(!ui_ipad_but_direct_property_allowed(&f.C,&f.but));
 f.block.ipad_action_origin={};assert(ui_ipad_but_direct_property_allowed(&f.C,&f.but));
}
''')

    def test_redraw_receipts_and_callback_mutation_do_not_launder_capability(self):
        equality = definition(SOURCE, 'static bool ui_but_equals_old(')
        self.assertLess(equality.index('ui_ipad_but_migration_matches'), equality.index('but->identity_cmp_func'))
        migration = SOURCE[SOURCE.index('oldbut->block = block;'):]
        self.assertLess(migration.index('oldbut->ipad_rna_receipt = but->ipad_rna_receipt'), migration.index('ui_but_update_old_active_from_new'))
        conversion = definition(SOURCE, 'uiBut *ui_but_change_type(')
        self.assertIn('but->ipad_snap_callback = false;', conversion)
        for signature in ('void UI_but_func_set(uiBut *but, std::function', 'void UI_but_funcN_set('):
            self.assertIn('but->ipad_snap_callback = false;', definition(SOURCE, signature))
        self.run_source(r'''
int main(){Fixture a,b;assert(ui_ipad_but_migration_matches(&a.but,&b.but));
 b.but.ipad_rna_receipt.undo_mutation=1;assert(!ui_ipad_but_migration_matches(&a.but,&b.but));
 b.but.ipad_rna_receipt=a.but.ipad_rna_receipt;
 b.but.ipad_rna_receipt.steps[0].data_address=1;assert(!ui_ipad_but_migration_matches(&a.but,&b.but));
 b.but.ipad_rna_receipt=a.but.ipad_rna_receipt;b.but.identity_cmp_func=reinterpret_cast<void *>(1);
 assert(!ui_ipad_but_migration_matches(&a.but,&b.but));b.but.identity_cmp_func=nullptr;
 b.block.ipad_action_origin.context[2]=99;assert(!ui_ipad_but_migration_matches(&a.but,&b.but));
 b.block.ipad_action_origin=a.block.ipad_action_origin;
 UI_but_func_set(&b.but,ui_item_enum_expand_handle,&b.but,POINTER_FROM_INT(4));
 assert(!b.but.ipad_snap_callback&&!ui_ipad_but_migration_matches(&a.but,&b.but));
 a.block.ipad_action_origin={};b.block.ipad_action_origin={};
 assert(ui_ipad_but_migration_matches(&a.but,&b.but));
}
''')

    def test_type_conversion_retires_old_self_argument_before_old_button_free(self):
        conversion=definition(SOURCE, 'uiBut *ui_but_change_type(')
        begin=conversion.index('  /* A converted owned self callback')
        fragment=conversion[begin:conversion.index('  if (has_poin_ptr_to_self)',begin)]
        self.run_source(r'''
int main(){Fixture f;
 auto old_but_ptr=std::make_unique<uiBut>(f.but);
 old_but_ptr->func_arg1=old_but_ptr.get();uiBut fresh=*old_but_ptr;
 uiBut *but=&fresh;
'''+fragment+r'''
 assert(but->ipad_callback_retired&&but->func==nullptr&&but->func_arg1==nullptr&&but->func_arg2==nullptr);
 old_but_ptr.reset();assert(!ui_ipad_but_self_callback_allowed(&f.C,but));
 assert(!ui_ipad_numbers_but_rebind(but));assert(!ui_ipad_but_direct_property_allowed(&f.C,but));
 assert(!ui_ipad_but_migration_matches(but,&f.but));
 UI_but_func_set(but,nullptr,nullptr,nullptr);assert(!but->ipad_callback_retired);
 assert(ui_ipad_but_self_callback_allowed(&f.C,but));
}
''', '#include <memory>\n')

if __name__ == '__main__':
    unittest.main()
