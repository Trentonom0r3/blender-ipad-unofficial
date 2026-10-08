"""Execute the native HUD field receipts and same-contact Redo continuation.

RNA schema enumeration, native Redo execution and context lists are explicit
fixtures. These checks do not establish UIKit or target modal acceptance.
IPAD_RING_SOURCE_ROOT permits reviewing an un-emitted materialized candidate.
"""
import os
from pathlib import Path
import unittest

from test_compact_shelf import function
from test_touch_extrude import changed_source
import test_ipad_panels


def source(path):
    root = os.environ.get("IPAD_RING_SOURCE_ROOT") or os.environ.get("BLENDER_IPAD_HUD_SOURCE_ROOT")
    return (Path(root) / path).read_text(encoding="utf-8") if root else changed_source(path)


HANDLERS = source("source/blender/editors/interface/interface_handlers.cc")
INTERFACE = source("source/blender/editors/interface/interface.cc")
FIELD = HANDLERS[HANDLERS.index("struct uiIPadHUDField {"):
                 HANDLERS.index("\n#else", HANDLERS.index("struct uiIPadHUDField {"))]
EVENT = function(HANDLERS, "bool UI_ipad_hud_event_admit(")
OWNER = function(HANDLERS, "bool ui_ipad_hud_button_owner_allowed(")
MIGRATION = INTERFACE[INTERFACE.index("    oldbut_uptr->swap(*but_uptr);"):
                      INTERFACE.index("    oldbut->ipad_rna_receipt = but->ipad_rna_receipt")]
WORLD = r"""
#include <algorithm>
#include <array>
#include <cassert>
#include <cstdint>
#include <cstring>
#include <functional>
#include <limits>
#include <memory>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <utility>
#define WITH_APPLE_CROSSPLATFORM
inline constexpr int WM_EVENT_IS_POINTER_CANCEL=64;
#define BLI_assert(v) assert(v)
#define LISTBASE_FOREACH(T,v,list) for(T v:*(list))
template<class T,class... R>bool ELEM(T v,R... r){return ((v==r)||...);}
template<class T>int BLI_findindex(const std::vector<T*>*v,const T*p){
 auto i=std::find(v->begin(),v->end(),p);return i==v->end()?-1:int(i-v->begin());}
inline constexpr int RGN_TYPE_HUD=1,RGN_TYPE_WINDOW=2,RGN_FLAG_HIDDEN=1,
 RGN_FLAG_TOO_SMALL=2,RGN_FLAG_POLL_FAILED=4,LEFTMOUSE=10,KM_PRESS=1,
 KM_RELEASE=2,MOUSEMOVE=11,BUTTON_STATE_HIGHLIGHT=1,BUTTON_STATE_NUM_EDITING=2,
 UI_BUT_DISABLED=16,IDP_GROUP=1,PROP_FLOAT=1,PROP_INT=2,PROP_BOOLEAN=3,PROP_IDPROPERTY=4;
enum class ButType{Num,NumSlider,Text};
struct ID{unsigned int session_uid=1;};
struct PropertyRNA{std::string identifier="value";int length=0,type=PROP_FLOAT,flag=PROP_IDPROPERTY;};
struct StructRNA{std::vector<PropertyRNA*>properties;};
struct IDProperty{int type=IDP_GROUP;};
struct PointerRNA{ID*owner_id=nullptr;StructRNA*type=nullptr;void*data=nullptr;};
struct wmOperatorType{uint64_t lifetime=1;StructRNA*srna;struct{void*srna=nullptr;}rna_ext;};
struct wmOperator{wmOperatorType*type=nullptr;PointerRNA*ptr=nullptr;IDProperty*properties=nullptr;
 std::vector<wmOperator*>macro;};
struct uiIPadOperatorReceipt{uint64_t address=0,lifetime=0,srna_address=0;std::string name;};
std::vector<wmOperatorType*>registry;
uiIPadOperatorReceipt ui_ipad_operator_capture(wmOperatorType*t){
 for(auto*p:registry)if(p==t)return{uintptr_t(p),p->lifetime,uintptr_t(p->srna),"OP"};
 return{};}
wmOperatorType*ui_ipad_operator_type_live(uint64_t a){
 for(auto*p:registry)if(uintptr_t(p)==a)return p;return nullptr;}
wmOperatorType*ui_ipad_operator_resolve(const uiIPadOperatorReceipt&r){
 auto*t=ui_ipad_operator_type_live(r.address);
 return t&&t->lifetime==r.lifetime&&uintptr_t(t->srna)==r.srna_address?t:nullptr;}
std::unordered_map<const wmOperator*,uint64_t>op_lifetimes;
uint64_t next_op=1;
uint64_t WM_operator_touch_lifetime_id(wmOperator*p){
 auto i=op_lifetimes.find(p);if(i!=op_lifetimes.end())return i->second;
 return op_lifetimes[p]=next_op++;}
bool WM_operator_touch_lifetime_matches(wmOperator*p,uint64_t n){
 auto i=op_lifetimes.find(p);return i!=op_lifetimes.end()&&i->second==n;}
#define RNA_STRUCT_BEGIN(ptr,prop) for(PropertyRNA*prop:(ptr)->type->properties) {
#define RNA_STRUCT_END }
int RNA_property_array_length(PointerRNA*,PropertyRNA*p){return p->length;}
const char*RNA_property_identifier(PropertyRNA*p){return p->identifier.c_str();}
int RNA_property_type(PropertyRNA*p){return p->type;}
int RNA_property_flag(PropertyRNA*p){return p->flag;}
struct Main;struct bContext;struct uiBut;struct ARegion;struct uiBlock;struct ScrArea;
using uiBlockHandleFunc=void(*)(bContext*,void*,int);
void ED_undo_operator_repeat_cb_evt(bContext*,void*,int){}
struct Origin{bool owned=false;bool present()const{return owned;}};
struct rctf{float xmin=0,xmax=100,ymin=0,ymax=100;};
struct Active{int state=BUTTON_STATE_HIGHLIGHT;ARegion*region=nullptr;};
using uiHandleButtonData=Active;
struct uiBut{uint64_t ipad_ui_lifetime=91;uiBlock*block=nullptr;PointerRNA rnapoin{};
 PropertyRNA*rnaprop=nullptr;int rnaindex=0;ButType type=ButType::Num;
 void*func=nullptr,*funcN=nullptr,*apply_func=nullptr,*optype=nullptr,*rename_func=nullptr,
 *rename_full_func=nullptr,*identity_cmp_func=nullptr;
 bool ipad_callback_retired=false;int flag=0;Active*active=nullptr,*semi_modal_state=nullptr;rctf rect;};
struct uiBlock{bool active=true;std::string name="OPERATOR_PT_redo";uiBlockHandleFunc handle_func=ED_undo_operator_repeat_cb_evt;
 void*handle_func_arg=nullptr;Origin ipad_action_origin;std::vector<std::unique_ptr<uiBut>>buttons;};
struct RegionRuntime{bool visible=true;uint64_t ipad_hud_content_lifetime=13;std::vector<uiBlock*>uiblocks;};
struct ARegion{int regiontype=RGN_TYPE_HUD,flag=0;RegionRuntime*runtime;};
struct ScrArea{std::vector<ARegion*>regionbase;};
struct bScreen{ID id{7};std::vector<ScrArea*>areabase;};
struct UndoStack{uint64_t ipad_lifetime_id=19,ipad_mutation_generation=21;};
struct WMRuntime{UndoStack*undo_stack;std::vector<wmOperator*>operators;};
struct wmWindow{int winid=5;bScreen*screen;};
struct wmWindowManager{ID id{11};std::vector<wmWindow*>windows;WMRuntime*runtime;};
struct Main{std::vector<wmWindowManager*>wm;};
struct bContext{Main*main;wmWindowManager*wm;wmWindow*win;ScrArea*area;ARegion*region,*canvas;
 std::string tool="builtin.move";uint64_t scene=31,object=41,data=51,mode=0,layer=61;
 bool safe=true,canvas_capture=true,pixels_ready=true;};
struct wmEvent{uint64_t ipad_hud_generation=101,ipad_hud_serial=201;int flag=0,type=LEFTMOUSE,val=KM_PRESS,xy[2]={20,20};};
Main*CTX_data_main(bContext*C){return C->main;}wmWindowManager*CTX_wm_manager(bContext*C){return C->wm;}
wmWindow*CTX_wm_window(bContext*C){return C->win;}ScrArea*CTX_wm_area(bContext*C){return C->area;}
ARegion*CTX_wm_region(bContext*C){return C->region;}
void CTX_wm_area_set(bContext*C,ScrArea*a){C->area=a;C->region=nullptr;}void CTX_wm_region_set(bContext*C,ARegion*r){C->region=r;}
bScreen*WM_window_get_active_screen(wmWindow*w){return w->screen;}
ARegion*UI_ipad_corner_hud_window(bContext*C,ScrArea*,ARegion*){return C->canvas;}
bool UI_ipad_context_capture(bContext*C,uint64_t*v){
 if(!C->canvas_capture||C->region!=C->canvas)return false;
 uint64_t a[13]={uintptr_t(C->main),uintptr_t(C->win),uintptr_t(C->win->screen),
 uintptr_t(C->area),uintptr_t(C->region),C->win->screen->id.session_uid,
 C->scene,C->object,C->data,C->mode,C->layer,uint64_t(C->win->winid),C->wm->id.session_uid};
 std::copy(a,a+13,v);return true;}
void ui_ipad_action_context_restore(bContext*C,uintptr_t a,uintptr_t r){
 C->area=nullptr;C->region=nullptr;if(!C->win||!C->win->screen)return;
 for(auto*area:C->win->screen->areabase)if(uintptr_t(area)==a){C->area=area;
 for(auto*region:area->regionbase)if(uintptr_t(region)==r)C->region=region;}}
bool WM_event_ipad_mode_safe(bContext*C){return C->safe;}
std::string ui_ipad_ring_tool_identity(bContext*C){return C->tool;}
std::array<int,2>WM_window_native_pixel_size(wmWindow*){return{800,600};}
float UI_SCALE_FAC=1;
wmOperator*WM_operator_last_redo(bContext*C){
 auto&ops=C->wm->runtime->operators;return ops.empty()?nullptr:ops.back();}
bool ui_ipad_but_self_callback_allowed(bContext*,uiBut*b){return !b->ipad_callback_retired;}
bool ui_ipad_but_rna_rebind(bContext*,uiBut*){return true;}
void ui_window_to_block(ARegion*,uiBlock*,int*,int*){}
bool BLI_rctf_isect_pt(const rctf*r,float x,float y){return x>=r->xmin&&x<=r->xmax&&y>=r->ymin&&y<=r->ymax;}
bool ED_ipad_hud_input_admit(bContext*C,wmWindow*,uint64_t){return C->pixels_ready;}
int frees=0,repeats=0;
std::function<void(bContext*,uiBut*)>onfree;
std::function<bool(bContext*,wmOperator*)>repeat_callback;
void ui_but_semi_modal_state_free(bContext*C,uiBut*b){++frees;b->semi_modal_state=nullptr;if(onfree)onfree(C,b);}
void ui_but_active_free(bContext*C,uiBut*b){++frees;b->active=nullptr;if(onfree)onfree(C,b);}
bool ED_undo_operator_repeat(bContext*C,wmOperator*p){
 ++repeats;if(repeat_callback)return repeat_callback(C,p);
 C->wm->runtime->undo_stack->ipad_mutation_generation+=3;return true;}
void ui_button_group_replace_but_ptr(uiBlock*,uiBut*,uiBut*){}
"""
FIXTURE = r"""
struct Fixture{
 UndoStack undo;WMRuntime runtime{&undo,{}};wmWindowManager wm{{11},{},&runtime};
 Main main;RegionRuntime hr,cr;ARegion hud{RGN_TYPE_HUD,0,&hr},canvas{RGN_TYPE_WINDOW,0,&cr};
 ScrArea area;bScreen screen;wmWindow win{5,&screen};
 bContext C{&main,&wm,&win,&area,&hud,&canvas};
 PropertyRNA prop;StructRNA schema;wmOperatorType type{1,&schema,{}};
 IDProperty properties;PointerRNA ptr{&wm.id,&schema,&properties};wmOperator op{&type,&ptr,&properties,{}};
 uiBlock block, replacement;Active active{BUTTON_STATE_HIGHLIGHT,&hud};wmEvent event;
 Fixture(){
 (void)&ui_ipad_hud_native_repeat; (void)&ui_ipad_hud_numeric_pointer_terminal; (void)&ui_ipad_hud_bound_numeric;
 ui_ipad_hud_fields.clear();registry={&type};op_lifetimes.clear();onfree={};repeat_callback={};frees=repeats=0;
 main.wm={&wm};wm.windows={&win};runtime.operators={&op};schema.properties={&prop};
 area.regionbase={&hud,&canvas};screen.areabase={&area};hr.uiblocks={&block};
 block.handle_func_arg=&op;replacement.handle_func_arg=&op;
 auto b=std::make_unique<uiBut>();b->block=&block;b->rnapoin=ptr;b->rnaprop=&prop;b->active=&active;
 block.buttons.push_back(std::move(b));}
 uiBut*but(){for(auto*b:hr.uiblocks)for(auto&p:b->buttons)if(p->ipad_ui_lifetime==91)return p.get();return nullptr;}
 uiIPadHUDField bind(){
 assert(ui_ipad_hud_button_input(&C,&event,but()));auto i=ui_ipad_hud_fields.find(91);
 assert(i!=ui_ipad_hud_fields.end());return i->second;}
};
"""


class PencilHUDFieldTests(unittest.TestCase):
    def run_native(self, body):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(
            WORLD + FIELD + OWNER + EVENT + FIXTURE + body)

    def test_actual_operator_tree_and_typed_profile(self):
        self.run_native(r"""
int main(){
 Fixture f;auto root=f.bind();assert(root.native_property&&root.native_numeric);
 assert(root.length==0&&root.index==0);
 assert(ui_ipad_hud_native_repeat(&f.C,91,&f.op)&&repeats==1);
 uiIPadHUDField scalar;f.but()->rnaindex=-1;
 assert(!ui_ipad_hud_numeric_profile(&f.C,f.but(),scalar));f.but()->rnaindex=0;
 assert(ui_ipad_hud_numeric_profile(&f.C,f.but(),scalar)&&scalar.native_numeric);
 int budget=256;assert(ui_ipad_hud_operator_tree_owner(&f.op,f.but(),budget)==&f.op);
 StructRNA child_schema;PropertyRNA child_prop;child_schema.properties={&child_prop};
 wmOperatorType child_type{2,&child_schema,{}};registry.push_back(&child_type);
 IDProperty child_props;PointerRNA child_ptr{&f.wm.id,&child_schema,&child_props};
 wmOperator child{&child_type,&child_ptr,&child_props,{}};f.op.macro={&child};
 f.but()->rnapoin=child_ptr;f.but()->rnaprop=&child_prop;uiIPadHUDField field;
 assert(ui_ipad_hud_numeric_profile(&f.C,f.but(),field));
 assert(field.outer_address==uintptr_t(&f.op)&&field.owner_address==uintptr_t(&child));
 child_type.lifetime++;assert(!ui_ipad_hud_field_proof(&f.C,root));
 f.but()->rnaprop=reinterpret_cast<PropertyRNA*>(0xdead);
 assert(!ui_ipad_hud_numeric_profile(&f.C,f.but(),field));
 f.but()->rnaprop=&child_prop;f.but()->rnapoin.owner_id=nullptr;
 assert(!ui_ipad_hud_numeric_profile(&f.C,f.but(),field));
 f.but()->rnapoin=child_ptr;child.ptr->data=nullptr;
 assert(!ui_ipad_hud_numeric_profile(&f.C,f.but(),field));
 child.ptr->data=&child_props;child_schema.properties.clear();
 assert(!ui_ipad_hud_numeric_profile(&f.C,f.but(),field));
 child_schema.properties={&child_prop};child_prop.length=3;f.but()->rnaindex=3;
 assert(!ui_ipad_hud_numeric_profile(&f.C,f.but(),field));
 f.but()->rnaindex=2;assert(ui_ipad_hud_numeric_profile(&f.C,f.but(),field));
 f.but()->func=(void*)1;assert(ui_ipad_hud_numeric_profile(&f.C,f.but(),field)&&!field.native_numeric);
 return 0;
}""")


    def test_initial_redo_binding_refuses_unproved_metadata_root_and_scalar_index(self):
        self.run_native(r"""
int main(){
 for(int variant=0;variant<5;++variant){
  Fixture f;
  if(variant==0)f.but()->rnaprop=reinterpret_cast<PropertyRNA*>(0xdead);
  if(variant==1)f.but()->rnapoin.data=reinterpret_cast<void*>(0xdead);
  if(variant==2)f.ptr.data=reinterpret_cast<void*>(0xdead);
  if(variant==3)f.but()->rnapoin.owner_id=nullptr;
  if(variant==4)f.but()->rnaindex=-1;
  assert(!ui_ipad_hud_button_input(&f.C,&f.event,f.but()));
  assert(ui_ipad_hud_fields.empty()&&repeats==0&&frees==0);
 }
 // Native header/caption controls do not pretend to own an operator property.
 Fixture f;f.but()->rnaprop=nullptr;f.but()->type=ButType::Text;
 assert(ui_ipad_hud_button_input(&f.C,&f.event,f.but()));
 auto header=ui_ipad_hud_fields.at(91);
 assert(!header.native_property&&!header.native_numeric);
 assert(ui_ipad_hud_field_proof(&f.C,header));
 assert(!ui_ipad_hud_native_repeat(&f.C,91,&f.op)&&repeats==0);
 return 0;
}""")

    def test_native_repeat_advances_only_its_contact_history(self):
        self.run_native(r"""
int main(){
 Fixture f;auto first=f.bind();f.active.state=BUTTON_STATE_NUM_EDITING;
 for(int i=0;i<10000;++i){
  const uint64_t before=f.undo.ipad_mutation_generation;
  assert(ui_ipad_hud_native_repeat(&f.C,91,&f.op));
  assert(f.undo.ipad_mutation_generation==before+3);
  assert(ui_ipad_hud_fields.at(91).undo_mutation==f.undo.ipad_mutation_generation);
  assert(ui_ipad_hud_fields.at(91).generation==first.generation);
  assert(UI_ipad_hud_event_admit(&f.C,&f.win,&f.event));
 }
 assert(repeats==10000&&frees==0);
 ++f.undo.ipad_mutation_generation;
 assert(!UI_ipad_hud_event_admit(&f.C,&f.win,&f.event));
 assert(repeats==10000&&frees==1&&ui_ipad_hud_fields.empty());
 return 0;
}""")

    def test_same_uid_native_active_button_migration(self):
        migration = r"""
void migrate(uiBlock*block,std::unique_ptr<uiBut>*oldbut_uptr,
             std::unique_ptr<uiBut>*but_uptr){
 uiBut*oldbut=oldbut_uptr->get();uiBut*but=but_uptr->get();
 struct Matches{std::unordered_set<const uiBut*>v;bool contains(const uiBut*p)const{return v.count(p);}
 void add(const uiBut*p){v.insert(p);}}matched_old_buttons;
""" + MIGRATION + "\n}\n"
        self.run_native(migration + r"""
int main(){
 Fixture f;auto field=f.bind();f.active.state=BUTTON_STATE_NUM_EDITING;
 auto fresh=std::make_unique<uiBut>(*f.but());fresh->ipad_ui_lifetime=92;fresh->active=nullptr;
 fresh->block=&f.replacement;f.replacement.buttons.push_back(std::move(fresh));
 migrate(&f.replacement,&f.block.buttons[0],&f.replacement.buttons[0]);
 f.hr.uiblocks={&f.replacement};
 assert(f.but()&&f.but()->active==&f.active);
 assert(ui_ipad_hud_field_button(&f.C,field)==f.but());
 assert(ui_ipad_hud_field_proof(&f.C,field));
 assert(ui_ipad_hud_native_repeat(&f.C,91,&f.op)&&repeats==1);
 f.replacement.buttons[0]->ipad_ui_lifetime=93;
 assert(!ui_ipad_hud_field_proof(&f.C,ui_ipad_hud_fields.at(91)));
 return 0;
}""")

    def test_refusal_owner_tool_schema_and_failed_repeat(self):
        self.run_native(r"""
int main(){
 for(int kind=0;kind<7;++kind){
  Fixture f;auto field=f.bind();f.active.state=BUTTON_STATE_NUM_EDITING;
  if(kind==0)f.C.tool="builtin.rotate";
  if(kind==1)++f.type.lifetime;
  if(kind==2)op_lifetimes[&f.op]++;
  if(kind==3)f.ptr.data=nullptr;
  if(kind==4)f.prop.identifier="other";
  if(kind==5)f.hud.flag|=RGN_FLAG_HIDDEN;
  if(kind==6)f.runtime.operators.clear();
  assert(!ui_ipad_hud_field_proof(&f.C,field));
  assert(ui_ipad_hud_native_repeat(&f.C,91,&f.op));
  assert(repeats==0&&ui_ipad_hud_fields.empty());
 }
 Fixture f;f.bind();f.active.state=BUTTON_STATE_NUM_EDITING;
 repeat_callback=[](bContext*C,wmOperator*){C->wm->runtime->undo_stack->ipad_mutation_generation+=7;return false;};
 assert(ui_ipad_hud_native_repeat(&f.C,91,&f.op));
 assert(repeats==1&&ui_ipad_hud_fields.empty()&&frees==1);
 return 0;
}""")


    def test_event_watermark_refuses_old_and_orphan_terminals_per_window(self):
        self.run_native(r"""
int main(){
 Fixture f;
 assert(UI_ipad_hud_event_admit(&f.C,&f.win,&f.event));auto old=f.bind();
 wmEvent newer=f.event;++newer.ipad_hud_serial;
 assert(UI_ipad_hud_event_admit(&f.C,&f.win,&newer));
 assert(ui_ipad_hud_button_input(&f.C,&newer,f.but()));
 const auto current=ui_ipad_hud_fields.at(91);
 assert(current.serial==newer.ipad_hud_serial&&current.generation==old.generation);
 wmEvent release=f.event;release.val=KM_RELEASE;
 assert(!UI_ipad_hud_event_admit(&f.C,&f.win,&release));
 assert(ui_ipad_hud_fields.at(91).serial==current.serial&&frees==0);
 assert(f.but()->active&&!f.but()->ipad_callback_retired);
 // An orphan newer terminal neither advances the watermark nor acquires UI.
 wmEvent orphan=newer;++orphan.ipad_hud_serial;orphan.val=KM_RELEASE;
 assert(!UI_ipad_hud_event_admit(&f.C,&f.win,&orphan));
 assert(UI_ipad_hud_event_admit(&f.C,&f.win,&newer));
 assert(ui_ipad_hud_fields.at(91).serial==current.serial&&frees==0);
 // A failed presented-owner begin cannot advance the accepted serial.
 wmEvent denied=orphan;denied.val=KM_PRESS;f.C.pixels_ready=false;
 assert(!UI_ipad_hud_event_admit(&f.C,&f.win,&denied));f.C.pixels_ready=true;
 assert(UI_ipad_hud_event_admit(&f.C,&f.win,&newer));
 // Native windows have independent contact histories even when another has a larger serial.
 wmWindow second{77,&f.screen};f.wm.windows.push_back(&second);f.C.win=&second;
 wmEvent independent;independent.ipad_hud_generation=501;independent.ipad_hud_serial=1;
 assert(UI_ipad_hud_event_admit(&f.C,&second,&independent));
 wmEvent second_orphan=independent;second_orphan.val=KM_RELEASE;++second_orphan.ipad_hud_serial;
 assert(!UI_ipad_hud_event_admit(&f.C,&second,&second_orphan));
 wmEvent second_release=independent;second_release.val=KM_RELEASE;
 assert(UI_ipad_hud_event_admit(&f.C,&second,&second_release));
 wmEvent second_begin=second_orphan;second_begin.type=MOUSEMOVE;
 assert(UI_ipad_hud_event_admit(&f.C,&second,&second_begin));
 assert(!UI_ipad_hud_event_admit(&f.C,&second,&second_release));
 assert(ui_ipad_hud_fields.at(91).serial==current.serial&&frees==0);
 // Ordinary hardware input is not enrolled into physical HUD serial ownership.
 wmEvent hardware;hardware.ipad_hud_generation=0;hardware.ipad_hud_serial=0;
 assert(UI_ipad_hud_event_admit(&f.C,&second,&hardware));
 f.C.win=&f.win;assert(UI_ipad_hud_event_admit(&f.C,&f.win,&hardware));
 assert(UI_ipad_hud_event_admit(&f.C,&f.win,&newer));
 assert(ui_ipad_hud_fields.at(91).serial==current.serial&&frees==0);
 return 0;
}""")

    def test_retirement_never_disposes_newer_contact_and_keyboard_proves_owner(self):
        self.run_native(r"""
int main(){
 Fixture f;auto old=f.bind();uiIPadHUDField newer=old;++newer.serial;
 ui_ipad_hud_fields[91]=newer;
 ui_ipad_hud_field_retire(&f.C,old);
 assert(ui_ipad_hud_fields.at(91).serial==newer.serial&&frees==0&&f.but()->active);
 assert(!f.but()->ipad_callback_retired&&!(f.but()->flag&UI_BUT_DISABLED));
 wmEvent keyboard;keyboard.ipad_hud_generation=keyboard.ipad_hud_serial=0;
 assert(UI_ipad_hud_event_admit(&f.C,&f.win,&keyboard));
 assert(ui_ipad_hud_button_owner_allowed(&f.C,f.but()));
 ++f.undo.ipad_mutation_generation;
 assert(!ui_ipad_hud_button_owner_allowed(&f.C,f.but()));
 assert(UI_ipad_hud_event_admit(&f.C,&f.win,&keyboard));
 return 0;
}""")

    def test_value_only_receipt_and_connected_field_boundaries(self):
        definition = function(HANDLERS, "struct uiIPadHUDField {")
        for forbidden in ("uiBut *", "wmOperator *", "PointerRNA", "PropertyRNA *", "UndoStack *", "uiBlock *"):
            self.assertNotIn(forbidden, definition)
        for function_start in ("static void ui_apply_but_func(", "static void ui_apply_but(",
                               "static int ui_handle_button_event("):
            body_source = HANDLERS
            if function_start == "static void ui_apply_but(":
                body_source = HANDLERS[HANDLERS.index("static void ui_apply_but(\n    bContext *C"):]
            body = function(body_source, function_start)
            if function_start == "static void ui_apply_but(":
                self.assertIn("ui_ipad_numbers_but_rebind", body)
                self.assertIn("ui_ipad_hud_button_owner_allowed", function(INTERFACE, "bool ui_ipad_numbers_but_rebind("))
            else:
                self.assertTrue("ui_ipad_hud" in body, function_start)
        loop = function(HANDLERS, "static void ui_apply_but_funcs_after(")
        self.assertIn("ui_ipad_hud_field_allowed", loop)
        self.assertIn("ui_ipad_hud_native_repeat", loop)


if __name__ == "__main__":
    unittest.main()

