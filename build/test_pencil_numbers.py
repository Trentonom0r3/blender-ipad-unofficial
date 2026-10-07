"""Execute bounded pending Numbers binding, consumers and native disposal seams.

RNA/native lists are fixture APIs. This does not execute UIKit or target modal UI.
"""
import unittest
from pathlib import Path
from test_touch_extrude import changed_source
from test_tool_ring import ring_source
from test_pencil_callback_disposal import definition
from test_pencil_rna_owner import SOURCE, RECEIPT, WORLD, FUNCTIONS
import test_ipad_panels

HANDLERS = changed_source('source/blender/editors/interface/interface_handlers.cc')

NUMBERS_WORLD = r'''
#include <memory>
template<class T,class... U>bool elem(const T &v,const U &... choices){return ((v==choices)||...);}
#define ELEM(...) elem(__VA_ARGS__)
#define BLI_assert(x) assert(x)
constexpr int PROP_ENUM_FLAG=2;constexpr double UI_BUT_VALUE_UNSET=1e30;
enum class ButPointerType{None,Char,Short,Int,Float};
enum class ButType{Num,Unitvec};
struct uiBut{uiBlock *block=nullptr;PointerRNA rnapoin;PropertyRNA *rnaprop=nullptr;uiIPadRNAReceipt ipad_rna_receipt;int rnaindex=0;double *editval=nullptr;char *poin=nullptr;ButPointerType pointype=ButPointerType::None;ButType type=ButType::Num;};
struct uiBlock{ipad_ring::ActionOrigin ipad_action_origin;void *evil_C=nullptr;std::vector<std::unique_ptr<uiBut>> buttons;};
// Immediate callback classification executes in test_pencil_self_callback.
bool ui_ipad_but_self_callback_allowed(bContext *,uiBut *){return true;}
double stored_value=0;int value_reads=0,value_writes=0;
int RNA_property_boolean_get(PointerRNA *,PropertyRNA *){++value_reads;return int(stored_value);}
int RNA_property_int_get(PointerRNA *,PropertyRNA *){++value_reads;return int(stored_value);}
double RNA_property_float_get(PointerRNA *,PropertyRNA *){++value_reads;return stored_value;}
int RNA_property_enum_get(PointerRNA *,PropertyRNA *){++value_reads;return int(stored_value);}
int RNA_property_boolean_get_index(PointerRNA *p,PropertyRNA *f,int){return RNA_property_boolean_get(p,f);}
int RNA_property_int_get_index(PointerRNA *p,PropertyRNA *f,int){return RNA_property_int_get(p,f);}
double RNA_property_float_get_index(PointerRNA *p,PropertyRNA *f,int){return RNA_property_float_get(p,f);}
bool RNA_property_editable(PointerRNA *,PropertyRNA *){return true;}
void RNA_property_boolean_set(PointerRNA *,PropertyRNA *,double v){++value_writes;stored_value=v;}
void RNA_property_int_set(PointerRNA *,PropertyRNA *,int v){++value_writes;stored_value=v;}
void RNA_property_float_set(PointerRNA *,PropertyRNA *,double v){++value_writes;stored_value=v;}
void RNA_property_enum_set(PointerRNA *,PropertyRNA *,double v){++value_writes;stored_value=v;}
void RNA_property_boolean_set_index(PointerRNA *p,PropertyRNA *f,int,double v){RNA_property_boolean_set(p,f,v);}
void RNA_property_int_set_index(PointerRNA *p,PropertyRNA *f,int,int v){RNA_property_int_set(p,f,v);}
void RNA_property_float_set_index(PointerRNA *p,PropertyRNA *f,int,double v){RNA_property_float_set(p,f,v);}
double round_db_to_uchar_clamp(double v){return v;}
double round_db_to_short_clamp(double v){return v;}
double round_db_to_int_clamp(double v){return v;}
void ui_but_update_select_flag(uiBut *,double *){}
struct NumbersFixture{
 Fixture native;StructRNA properties_type;PropertyRNA field{"offset","",PROP_IDPROPERTY,PROP_FLOAT,true,1,3,{3,0,0},{}};
 IDProperty properties,leaf;wmOperatorType ot{&properties_type};PointerRNA ptr;wmOperator op;uiBlock block;PopupRuntime runtime;PopupRegion region;uiPopupBlockHandle handle;
 NumbersFixture(){
  properties_type.fields["offset"]=&field;leaf.type=IDP_ARRAY;leaf.subtype=IDP_FLOAT;leaf.len=3;std::memcpy(leaf.name,"offset",7);properties.data.group.first=&leaf;
  ptr={&native.manager.id,&properties_type,&properties,{91}};op={&ot,&ptr,&properties};
  operators["VIEW3D_OT_ipad_transform_numbers"]=&ot;
  block.ipad_action_origin=origin();block.evil_C=&native.C;
  auto but=std::make_unique<uiBut>();but->block=&block;but->rnapoin=ptr;but->rnaprop=&field;but->rnaindex=1;block.buttons.push_back(std::move(but));
  runtime.uiblocks.first=&block;region.runtime=&runtime;handle.ipad_action_origin=origin();handle.ipad_popup_lifetime=91;handle.popup_op=&op;handle.region=&region;registered_popup=&handle;
 }
 uiBut *but(){return block.buttons.front().get();}
};
'''

class PencilNumbersTests(unittest.TestCase):
    def run_numbers(self, main, extra=''):
        functions = '\n'.join(definition(SOURCE, s) for s in (
            'bool ui_ipad_numbers_bind(', 'bool ui_ipad_but_rna_rebind(',
            'bool ui_ipad_numbers_but_rebind('))
        pinned=(Path(__file__).parent/'fixtures/pinned_ui_scalar_access.hh').read_text(encoding='utf-8')
        # Hunks do not necessarily contain a full long native function. Execute
        # its exact pinned body with the actual shipped admission prefix.
        for signature, refusal in (('double ui_but_value_get(', 'return 0.0;'),
                                   ('void ui_but_value_set(', 'return;')):
            prefix=definition(SOURCE,signature).split('{',1)[1].splitlines()[1]
            self.assertEqual(prefix, '  if (!ui_ipad_numbers_but_rebind(but)) '+refusal)
            functions+='\n'+definition(pinned,signature).replace('{','{\n'+prefix,1)
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(
            '#define WITH_APPLE_CROSSPLATFORM\n'+ring_source().replace('#pragma once','')+
            RECEIPT+WORLD+NUMBERS_WORLD+FUNCTIONS+functions+extra+main)

    def test_array_clipboard_and_activation_recheck_pending_storage(self):
        extra=r'''
namespace blender {template<class T,int N>struct Array:std::vector<T>{explicit Array(int n):std::vector<T>(n){}};}
struct uiHandleButtonData{float vec[3]{};double value=0;};
constexpr int BUTTON_STATE_NUM_EDITING=1,BUTTON_STATE_EXIT=2;
bool retire_on_activate=false;int activations=0;
void button_activate_state(bContext *,uiBut *,int state){++activations;if(state==BUTTON_STATE_NUM_EDITING&&retire_on_activate)registered_popup=nullptr;}
void RNA_property_float_set_array_at_most(PointerRNA *,PropertyRNA *,const float *,int){++value_writes;}
void RNA_property_float_get_array(PointerRNA *,PropertyRNA *,float *){++value_reads;}
void copy_v3_v3(float *a,const float *b){std::memcpy(a,b,3*sizeof(float));}
void float_array_to_string(const float *,int,char *out,int n){if(n>0)out[0]='[';}
'''
        extra+='\n'.join(definition(HANDLERS,s) for s in (
            'static int get_but_property_array_length(', 'static void ui_but_set_float_array(',
            'static void ui_but_copy_numeric_array('))
        self.run_numbers(r'''
int main(){NumbersFixture f;assert(ui_ipad_numbers_bind(&f.native.C,&f.handle));uiHandleButtonData data;float values[3]={1,2,3};char text[32]{};
 for(int i=0;i<10000;++i){ui_but_set_float_array(&f.native.C,f.but(),&data,values,3);ui_but_copy_numeric_array(f.but(),text,32);assert(data.value==2&&text[0]=='[');}
 int reads=value_reads,writes=value_writes;retire_on_activate=true;
 ui_but_set_float_array(&f.native.C,f.but(),&data,values,3);assert(value_writes==writes);
 f.but()->rnapoin={reinterpret_cast<ID *>(1),reinterpret_cast<StructRNA *>(1),reinterpret_cast<void *>(1),{}};f.but()->rnaprop=reinterpret_cast<PropertyRNA *>(1);
 assert(get_but_property_array_length(f.but())==0);ui_but_copy_numeric_array(f.but(),text,32);assert(text[0]=='\0'&&value_reads==reads);
 int starts=activations;ui_but_set_float_array(&f.native.C,f.but(),&data,values,3);assert(activations==starts&&value_writes==writes);
}
''',extra)
        apply=definition(HANDLERS,'static void ui_apply_but(\n')
        self.assertLess(apply.index('ui_ipad_numbers_but_rebind'),apply.index('if (data->cancel)'))
        for signature in ('static bool ui_but_copy(', 'static void ui_but_paste(',
                          'static int ui_handle_button_event(', 'static void ui_multibut_add('):
            body=definition(HANDLERS,signature).split('{',1)[1]
            if 'ui_handle_button_event' in signature:
                self.assertLess(body.index('ui_ipad_numbers_but_rebind'),body.index('uiHandleButtonData *data'))
            else:
                self.assertIn('ui_ipad_numbers_but_rebind',body.splitlines()[1])
        for signature in ('static bool ui_selectcontext_begin(', 'static void ui_selectcontext_apply(',
                          'static void ui_apply_but_autokey('):
            self.assertIn('ipad_action_origin.present()',definition(HANDLERS,signature).split('{',1)[1][:280])

    def test_failed_initial_context_still_owns_type_guarded_disposal(self):
        extra=r'''
ipad_ring::ActionOrigin constructing_origin;
ipad_ring::ActionOrigin ui_ipad_action_origin_current(){return constructing_origin;}
'''+definition(SOURCE,'bool UI_ipad_numbers_operator_owned(')
        self.run_numbers(r'''
int main(){NumbersFixture f;constructing_origin=origin();f.native.C.live=false;
 assert(UI_ipad_numbers_operator_owned(&f.native.C,&f.op));
 constructing_origin={};assert(!UI_ipad_numbers_operator_owned(&f.native.C,&f.op));
 constructing_origin=origin();operators.erase("VIEW3D_OT_ipad_transform_numbers");assert(!UI_ipad_numbers_operator_owned(&f.native.C,&f.op));
}
''',extra)

    def test_completed_buttons_bind_actual_operator_properties_and_guard_reads_writes(self):
        self.run_numbers(r'''
int main(){NumbersFixture f;assert(ui_ipad_numbers_bind(&f.native.C,&f.handle));
 assert(f.but()->ipad_rna_receipt.owner==uiIPadRNAOwner::PopupProperties);
 assert(f.but()->rnapoin.owner_id==&f.native.manager.id&&f.but()->rnapoin.data==f.op.properties);
 for(int i=0;i<10000;++i){f.but()->rnapoin.ancestors={1,2,3};ui_but_value_set(f.but(),i);assert(ui_but_value_get(f.but())==i);assert(f.but()->rnapoin.ancestors==std::vector<int>{91});}
 int reads=value_reads,writes=value_writes;registered_popup=nullptr;
 f.but()->rnapoin={reinterpret_cast<ID *>(1),reinterpret_cast<StructRNA *>(1),reinterpret_cast<void *>(1),{}};f.but()->rnaprop=reinterpret_cast<PropertyRNA *>(1);
 assert(ui_but_value_get(f.but())==0);ui_but_value_set(f.but(),99);assert(value_reads==reads&&value_writes==writes);
}
''')

    def test_pending_type_storage_shape_and_terminal_refusal_precede_cached_metadata(self):
        self.run_numbers(r'''
int main(){NumbersFixture f;assert(ui_ipad_numbers_bind(&f.native.C,&f.handle));
 auto valid=[&](){return ui_ipad_numbers_but_rebind(f.but());};assert(valid());
 operators.erase("VIEW3D_OT_ipad_transform_numbers");f.handle.popup_op=reinterpret_cast<wmOperator *>(1);assert(!valid());f.handle.popup_op=&f.op;operators["VIEW3D_OT_ipad_transform_numbers"]=&f.ot;
 wmOperatorType replacement{&f.properties_type};operators["VIEW3D_OT_ipad_transform_numbers"]=&replacement;assert(!valid());operators["VIEW3D_OT_ipad_transform_numbers"]=&f.ot;
 f.op.ptr=reinterpret_cast<PointerRNA *>(1);assert(!valid());f.op.ptr=&f.ptr;
 f.op.properties=reinterpret_cast<IDProperty *>(1);assert(!valid());f.op.properties=&f.properties;
 f.ptr.owner_id=nullptr;assert(!valid());f.ptr.owner_id=&f.native.manager.id;
 f.ptr.type=reinterpret_cast<StructRNA *>(1);assert(!valid());f.ptr.type=&f.properties_type;
 f.leaf.type=IDP_STRING;int ensure=ensures;assert(!valid()&&ensures==ensure);f.leaf.type=IDP_ARRAY;
 f.leaf.len=2;assert(!valid());f.leaf.len=3;assert(valid());
 f.native.undo.ipad_mutation_generation++;assert(!valid());f.native.undo.ipad_mutation_generation--;
 f.native.main.ids.clear();assert(!valid());
}
''')

    def test_binding_is_bounded_to_static_numbers_fields_and_initial_seam(self):
        self.run_numbers(r'''
int main(){NumbersFixture f;f.field.name="unproved";f.properties_type.fields.clear();f.properties_type.fields["unproved"]=&f.field;
 assert(!ui_ipad_numbers_bind(&f.native.C,&f.handle));
 NumbersFixture wrong;wrong.but()->rnapoin.data=&wrong.op;assert(!ui_ipad_numbers_bind(&wrong.native.C,&wrong.handle));
 NumbersFixture hardware;hardware.handle.ipad_action_origin={};assert(ui_ipad_numbers_bind(&hardware.native.C,&hardware.handle));assert(!hardware.handle.ipad_numbers);
}
''')
        popup=changed_source('source/blender/editors/interface/regions/interface_region_menu_popup.cc')
        seam=definition(popup,'void UI_popup_block_ex(')
        self.assertLess(seam.index('UI_popup_handlers_add'),seam.index('ui_ipad_numbers_bind'))
        self.assertLess(seam.index('ui_ipad_numbers_bind'),seam.index('UI_block_active_only_flagged_buttons'))
        refresh=changed_source('source/blender/editors/interface/regions/interface_region_popup.cc')
        refresh=definition(refresh,'uiBlock *ui_popup_block_refresh(')
        self.assertLess(refresh.index('ui_ipad_numbers_popup_valid'),refresh.index('create_func(C'))
        native=changed_source('scripts/startup/bl_ui/space_view3d_ipad.py')
        numbers=native.split('class VIEW3D_OT_ipad_transform_numbers',1)[1].split('\nclass ',1)[0]
        for override in ('def check(', 'def cancel(', 'get=', 'set='):
            self.assertNotIn(override,numbers)

if __name__=='__main__':unittest.main()
