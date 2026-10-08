"""Execute registered-popup lookup and deferred cleanup/semantic sequencing.

Native lists and callbacks are fixtures; target modal ownership remains unbuilt.
"""
import unittest
from test_touch_extrude import changed_source
from test_tool_ring import ring_source
from test_pencil_callback_disposal import definition
import test_ipad_panels

HANDLERS=changed_source('source/blender/editors/interface/interface_handlers.cc')
COMMON=r'''
#include <cassert>
#include <functional>
#include <optional>
#include <string>
#include <vector>
namespace ipad_ring=blender::ui::ipad;
template<class T>struct List{T *first=nullptr;};
#define LISTBASE_FOREACH(type,var,list) for(type var=(list)->first;var;var=var->next)
[[maybe_unused]] constexpr int WM_HANDLER_TYPE_UI=1,WM_HANDLER_DO_FREE=2,UI_RETURN_CANCEL=4,UI_RETURN_OK=8,UI_RETURN_OUT=16,UI_RETURN_OUT_PARENT=32,UI_RETURN_POPUP_OK=64;
struct wmOperator{};
struct uiBlock;struct Runtime{List<uiBlock> uiblocks;};
struct ARegion{ARegion *next=nullptr;Runtime *runtime=nullptr;};
struct bScreen{List<ARegion> regionbase;};
struct uiPopupBlockHandle{uint64_t ipad_popup_lifetime=0;int menuretval=0;ARegion *region=nullptr;ipad_ring::ActionOrigin ipad_action_origin;wmOperator *popup_op=nullptr;bool ipad_operator_retired=false;void (*ipad_numbers_dispose)(void *)=nullptr;void *ipad_numbers_dispose_arg=nullptr;};
struct uiBlock{uiBlock *next=nullptr;bool active=true;uiPopupBlockHandle *handle=nullptr;};
struct wmEventHandler{wmEventHandler *next=nullptr;int type=WM_HANDLER_TYPE_UI,flag=0;};
struct wmEventHandler_UI:wmEventHandler{void (*handle_fn)()=nullptr;void (*remove_fn)()=nullptr;void *user_data=nullptr;};
struct wmWindow{wmWindow *next=nullptr;bScreen *screen=nullptr;List<wmEventHandler> modalhandlers;};
struct wmWindowManager{List<wmWindow> windows;};
struct bContext{bool live=true;wmWindow *window=nullptr;wmWindowManager *manager=nullptr;};
wmWindow *CTX_wm_window(bContext *C){return C->window;}
wmWindowManager *CTX_wm_manager(bContext *C){return C->manager;}
bScreen *WM_window_get_active_screen(wmWindow *w){return w->screen;}
template<class T>int BLI_findindex(List<T> *list,const T *needle){int i=0;for(T *p=list->first;p;p=p->next,++i)if(p==needle)return i;return -1;}
bool ui_ipad_action_origin_valid(bContext *C,const ipad_ring::ActionOrigin &o){return !o.present()||(C&&C->live);}
void ui_popup_handler(){}void ui_popup_handler_remove(){}void unrelated_handler(){}
ipad_ring::ActionOrigin origin(){return ipad_ring::ActionOrigin::capture({1,2,3,4,5,6,7,8,9,0,11,12,13},"builtin.move",7);}
'''

class PencilPopupOwnershipTests(unittest.TestCase):
    def test_exhausted_root_nonce_refuses_before_argument_or_python_draw(self):
        native=changed_source('source/blender/editors/interface/regions/interface_region_menu_pie.cc')
        creator=definition(native,'static uiBlock *ui_ipad_ring_create(')
        prefix=creator[:creator.index('  auto &data =')]+ '\n (void)arg;return nullptr;\n}\n'
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(ring_source().replace('#pragma once','')+r'''
#include <cassert>
struct bContext{};struct ARegion{};struct uiBlock{};
namespace blender::ui{enum class EmbossType{Emboss};}
constexpr int UI_RETURN_CANCEL=1;
struct uiPopupBlockHandle{uint64_t ipad_popup_lifetime=0;int menuretval=0;ARegion *region=nullptr;};
int blocks=0;uiBlock cancelled;
uiBlock *UI_block_begin(bContext *,ARegion *,const char *,blender::ui::EmbossType){++blocks;return &cancelled;}
'''+prefix+r'''
int main(){bContext C;uiPopupBlockHandle handle;
 assert(ui_ipad_ring_create(&C,&handle,reinterpret_cast<void *>(1))==&cancelled);
 assert(handle.menuretval==UI_RETURN_CANCEL&&blocks==1);
 handle.ipad_popup_lifetime=7;handle.menuretval=0;
 assert(!ui_ipad_ring_create(&C,&handle,reinterpret_cast<void *>(1))&&blocks==1&&handle.menuretval==0);
}
''')

    def test_lookup_starts_at_live_registered_handlers_and_never_old_operator(self):
        resolver=definition(HANDLERS,'uiPopupBlockHandle *ui_ipad_registered_popup_resolve(')+'\n'+definition(HANDLERS,'static wmOperator *ui_ipad_popup_operator_resolve(')
        popup=changed_source('source/blender/editors/interface/regions/interface_region_popup.cc')
        retire=definition(popup,'void ui_ipad_popup_operator_retire(')
        remove=definition(HANDLERS,'static void ui_popup_handler_remove(')
        self.assertLess(remove.index('ui_ipad_popup_operator_retire(menu)'),remove.index('temp') if 'temp' in remove else remove.index('menu->cancel_func(C'))
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(ring_source().replace('#pragma once','')+COMMON+r'''
struct uiAfterFunc{ipad_ring::ActionOrigin ipad_action_origin;uint64_t ipad_popup_lifetime=0;wmOperator *popup_op=nullptr;};
'''+retire+resolver+r'''
int main(){
 wmOperator op,other;uiPopupBlockHandle handle{11,0,nullptr,origin(),&op};
 uiBlock block{nullptr,true,&handle};Runtime runtime{{&block}};ARegion region{nullptr,&runtime};handle.region=&region;
 bScreen screen{{&region}};wmEventHandler_UI handler;handler.handle_fn=ui_popup_handler;handler.remove_fn=ui_popup_handler_remove;handler.user_data=&handle;
 wmWindow win{nullptr,&screen,{&handler}};wmWindowManager wm{{&win}};bContext C{true,&win,&wm};
 uiAfterFunc after{origin(),11,&op};
 for(int terminal:{UI_RETURN_CANCEL,UI_RETURN_OK,UI_RETURN_OUT,UI_RETURN_OUT_PARENT,UI_RETURN_POPUP_OK}){handle.menuretval=terminal;assert(!ui_ipad_popup_operator_resolve(&C,after));}handle.menuretval=0;
 for(int i=0;i<10000;++i){
  assert(ui_ipad_popup_operator_resolve(&C,after)==&op);
  // Address reuse does not reuse the lifetime, even for the same operator.
  ++handle.ipad_popup_lifetime;assert(!ui_ipad_popup_operator_resolve(&C,after));--handle.ipad_popup_lifetime;
 handle.popup_op=&other;assert(!ui_ipad_popup_operator_resolve(&C,after));handle.popup_op=&op;
 }
 after.popup_op=reinterpret_cast<wmOperator *>(1);assert(!ui_ipad_popup_operator_resolve(&C,after));after.popup_op=&op;
 // A handler can remain registered while onfree Cancel has destroyed its op.
 ui_ipad_popup_operator_retire(&handle);handle.popup_op=reinterpret_cast<wmOperator *>(1);
 after.popup_op=handle.popup_op;assert(!ui_ipad_popup_operator_resolve(&C,after));
 handle.ipad_operator_retired=false;handle.popup_op=&op;after.popup_op=&op;
 handler.flag=WM_HANDLER_DO_FREE;handler.user_data=reinterpret_cast<void *>(1);assert(!ui_ipad_popup_operator_resolve(&C,after));handler.flag=0;handler.user_data=&handle;
 handler.type=9;assert(!ui_ipad_popup_operator_resolve(&C,after));handler.type=WM_HANDLER_TYPE_UI;
 handler.handle_fn=unrelated_handler;assert(!ui_ipad_popup_operator_resolve(&C,after));handler.handle_fn=ui_popup_handler;
 handler.remove_fn=unrelated_handler;assert(!ui_ipad_popup_operator_resolve(&C,after));handler.remove_fn=ui_popup_handler_remove;
 handler.user_data=nullptr;assert(!ui_ipad_popup_operator_resolve(&C,after));handler.user_data=&handle;
 handle.menuretval=UI_RETURN_CANCEL;assert(!ui_ipad_popup_operator_resolve(&C,after));handle.menuretval=0;
 screen.regionbase.first=nullptr;handle.region=reinterpret_cast<ARegion *>(1);assert(!ui_ipad_popup_operator_resolve(&C,after));handle.region=&region;screen.regionbase.first=&region;
 block.active=false;assert(!ui_ipad_popup_operator_resolve(&C,after));block.active=true;
 block.handle=nullptr;assert(!ui_ipad_popup_operator_resolve(&C,after));block.handle=&handle;
 runtime.uiblocks.first=nullptr;assert(!ui_ipad_popup_operator_resolve(&C,after));runtime.uiblocks.first=&block;
 handle.ipad_action_origin.lifetime=8;assert(!ui_ipad_popup_operator_resolve(&C,after));handle.ipad_action_origin=origin();
 C.live=false;assert(!ui_ipad_popup_operator_resolve(&C,after));C.live=true;
 wm.windows.first=nullptr;C.window=reinterpret_cast<wmWindow *>(1);assert(!ui_ipad_popup_operator_resolve(&C,after));C.window=&win;wm.windows.first=&win;
 win.modalhandlers.first=nullptr;after.popup_op=reinterpret_cast<wmOperator *>(1);assert(!ui_ipad_popup_operator_resolve(&C,after));
 // Refresh transfers the same nonce without adding owning containers.
 uiPopupBlockHandle refreshed;std::memcpy(&refreshed,&handle,sizeof(handle));assert(refreshed.ipad_popup_lifetime==11);
 // Unowned native callbacks keep their original route.
 after.ipad_action_origin={};assert(ui_ipad_popup_operator_resolve(&C,after)==reinterpret_cast<wmOperator *>(1));
}
''')

    def test_each_native_semantic_step_rechecks_but_all_owned_disposal_runs(self):
        fields=definition(HANDLERS,'struct uiAfterFunc {')+';'
        operator_receipt=definition(changed_source('source/blender/editors/interface/interface_ipad_rna.hh'),'struct uiIPadOperatorReceipt {')+';'
        operator_functions='\n'.join(definition(HANDLERS,s) for s in (
            'static wmOperatorType *ui_ipad_operator_type_live(',
            'static uiIPadOperatorReceipt ui_ipad_operator_capture(',
            'static wmOperatorType *ui_ipad_operator_resolve('))
        callback=definition(HANDLERS,'static void ui_apply_but_funcs_after(')
        world=r'''
#include <cassert>
#include <functional>
#include <optional>
#include <string>
#include <vector>
namespace ipad_ring=blender::ui::ipad;
enum class uiIPadRNAOwner{None,PopupProperties};struct uiIPadRNAReceipt{uiIPadRNAOwner owner=uiIPadRNAOwner::None;};
struct bContext{bool live=true;};struct wmWindowManager{};struct wmOperator{};
struct StructRNA{};StructRNA operator_schema;
struct wmOperatorType{uint64_t ipad_lifetime_id=1;const char *idname="VIEW3D_OT_fixture";StructRNA *srna=&operator_schema;};
std::vector<wmOperatorType *> registered_types;
const std::vector<wmOperatorType *> &WM_operatortypes_registered_get(){return registered_types;}
struct PointerRNA{void *data=nullptr;};struct PropertyRNA{};
struct bContextStore{bool unproved_pointer=false;};
struct uiBlockInteraction_CallbackData{};struct uiBlockInteraction_Handle{};
using uiButHandleFunc=void(*)(bContext *,void *,void *);
using uiButHandleNFunc=uiButHandleFunc;
using uiButArgNFree=void(*)(void *);
using uiButHandleRenameFunc=void(*)(bContext *,void *,char *);
using uiBlockHandleFunc=void(*)(bContext *,void *,int);
using uiFreeArgFunc=void(*)(void *);
using wmOperatorStatus=int;
struct uiIPadRingReopenRequest{bool present()const{return false;}};
namespace blender::wm{enum class OpCallContext{Invoke};}
constexpr int BKE_UNDO_STR_MAX=64,NC_SPACE=1,ND_SPACE_VIEW3D=2;
#define BLI_assert(x) assert(x)
'''+operator_receipt+operator_functions+fields+r'''
struct ListBase{uiAfterFunc *first=nullptr;};ListBase UIAfterFuncs;
#define LISTBASE_FOREACH_MUTABLE(type,var,list) for(auto var=static_cast<type>((list)->first),var##_next=var?var->next:nullptr;var;var=var##_next,var##_next=var?var->next:nullptr)
void BLI_listbase_clear(ListBase *list){list->first=nullptr;}
void BLI_remlink(ListBase *list,uiAfterFunc *item){if(list->first==item)list->first=item->next;}
int record_frees=0,ptr_frees=0,copy_frees=0,rename_frees=0,search_frees=0,interaction_frees=0;
template<class T>void MEM_delete(T *p){if constexpr(std::is_same_v<T,uiAfterFunc>)++record_frees;else ++ptr_frees;delete p;}
void MEM_freeN(void *){++rename_frees;}
std::vector<std::string> calls;std::string stop;bool owned=true,lease=true,installed=false;
bool ui_ipad_action_origin_valid(bContext *C,const ipad_ring::ActionOrigin &o){return !o.present()||C->live;}
void *CTX_wm_area(bContext*){return nullptr;}void *CTX_wm_region(bContext*){return nullptr;}
bool ui_ipad_action_origin_rebind(bContext *C,const ipad_ring::ActionOrigin &o){return !o.present()||C->live;}
void ui_ipad_action_context_restore(bContext*,uintptr_t,uintptr_t){}
bool ui_ipad_context_store_rebind(bContext *,const ipad_ring::ActionOrigin &o,bContextStore &store){return !o.present()||!store.unproved_pointer;}
// These historical popup fixtures carry no physical HUD field receipt.
bool ui_ipad_hud_field_allowed(bContext *,uint64_t uid){assert(uid==0);return true;}
void ED_undo_operator_repeat_cb_evt(bContext *,void *,int){}
bool ui_ipad_hud_native_repeat(bContext *,uint64_t uid,const void *){assert(uid==0);return false;}
bool numbers_lease=true;
struct uiBlock{int generation=2;};struct RNARuntime{struct{uiBlock *first=nullptr;} uiblocks;};struct RNARegion{RNARuntime *runtime=nullptr;};
struct uiPopupBlockHandle{void *popup_arg=nullptr;RNARegion *region=nullptr;};
uiBlock current_numbers_block;
uiPopupBlockHandle numbers_popup;
uiPopupBlockHandle *ui_ipad_registered_popup_resolve(bContext *,const ipad_ring::ActionOrigin &,uint64_t){return numbers_lease?&numbers_popup:nullptr;}
bool ui_ipad_numbers_popup_valid(bContext *,uiPopupBlockHandle *){return true;}
bool UI_ipad_numbers_dialog_callback(uiButHandleFunc){return true;}
bool ui_ipad_rna_resolve(bContext *,const ipad_ring::ActionOrigin &,const uiIPadRNAReceipt &,PointerRNA &,PropertyRNA *&){return true;}
void semantic(bContext *C,const char *name){assert(!owned||C->live);calls.emplace_back(name);if(stop==name)C->live=false;
 if(std::string_view(name)=="popup"&&stop=="unregister")registered_types.clear();
 if(std::string_view(name)=="popup"&&stop=="reload")++registered_types.front()->ipad_lifetime_id;
}
void CTX_store_set(bContext *,bContextStore *store){installed=bool(store);}
bool ui_ipad_view_dispatch_allowed(bContext*,const uiAfterFunc&,wmOperatorType*,PointerRNA*){return true;}
wmOperator *ui_ipad_popup_operator_resolve(bContext *,const uiAfterFunc &after){return lease?after.popup_op:nullptr;}
void popup_check(bContext *C,wmOperator *){semantic(C,"popup");}
bool UI_ipad_context_matches(bContext *,const uint64_t *){return true;}
std::string ui_ipad_ring_tool_identity(bContext *){return "builtin.move";}
struct uiIPadActionOriginScope{explicit uiIPadActionOriginScope(const ipad_ring::ActionOrigin &){};};
// Historical callback cases carry no reopen request; dedicated tests execute the native queue/flush.
bool ui_ipad_ring_reopen_leaf(bContext*,uiAfterFunc&,wmOperatorType*,PointerRNA*){return false;}
wmOperatorStatus WM_operator_name_call_ptr(bContext *C,wmOperatorType *,blender::wm::OpCallContext,PointerRNA *,void *){semantic(C,"operator");return 1;}
void UI_ipad_ring_reopen_queue(bContext*,const uiIPadRingReopenRequest&,wmOperatorStatus){}
void WM_operator_name_call_ptr_with_depends_on_cursor(bContext *C,wmOperatorType *,blender::wm::OpCallContext,PointerRNA *,void *,const std::string &){semantic(C,"operator");}
void ui_ipad_ring_selection_rebase(bContext *,const uint64_t *,const std::string &,const std::string &,uint64_t){}
void WM_main_add_notifier(int,void *){}
void WM_operator_properties_free(PointerRNA *){++copy_frees;}
void RNA_property_update(bContext *C,PointerRNA *,PropertyRNA *){semantic(C,"RNA");}
void ui_block_interaction_release(bContext *C,uiBlockInteraction_CallbackData *,uiBlockInteraction_Handle *&slot,bool){++interaction_frees;slot=nullptr;if(stop=="interaction")C->live=false;}
void ui_afterfunc_update_preferences_dirty(uiAfterFunc *){calls.emplace_back("preferences");}
wmWindowManager *CTX_wm_manager(bContext *){static wmWindowManager wm;return &wm;}
bContext *active_context=nullptr;
void WM_operator_stack_clear(wmWindowManager *){semantic(active_context,"clear");}
void ED_undo_push(bContext *C,const char *){semantic(C,"undo");}
void callback(bContext *C,void *,void *){semantic(C,"func");}
void numbers_callback(bContext *C,void *arg1,void *arg2){assert(arg1==numbers_popup.popup_arg&&arg2==&current_numbers_block);semantic(C,"numbers");}
void callbackN(bContext *C,void *,void *){semantic(C,"funcN");}
void handle_callback(bContext *C,void *,int){semantic(C,"handle");}
void rename_callback(bContext *C,void *,char *){semantic(C,"rename");}
void arg_free(void *){++copy_frees;}
void search_free(void *){++search_frees;}
'''+callback+r'''
int main(){
 const std::vector<std::string> expected{"popup","operator","RNA","rename_full","func","apply","funcN","handle","rename","preferences","clear","undo"};
 wmOperator op;wmOperatorType ot;PropertyRNA prop;uiBlockInteraction_Handle interaction;
 auto run=[&](const std::string &terminal,bool is_owned,bool live,bool live_lease){
  stop=terminal;owned=is_owned;lease=live_lease;calls.clear();record_frees=ptr_frees=copy_frees=rename_frees=search_frees=interaction_frees=0;
  bContext C{live};active_context=&C;auto *after=new uiAfterFunc{};
  registered_types={&ot};
  if(is_owned)after->ipad_action_origin=ipad_ring::ActionOrigin::capture({1,2,3,4,5,6,7,8,9,0,11,12,13},"builtin.move",7);
  after->popup_op=&op;after->optype=&ot;after->opptr=new PointerRNA{&prop};after->rnapoin.data=&prop;after->rnaprop=&prop;
  after->ipad_operator=ui_ipad_operator_capture(&ot);
  after->context=bContextStore{};after->rename_full_func=[&](std::string &){semantic(&C,"rename_full");};
  after->func=callback;after->apply_func=[](bContext &context){semantic(&context,"apply");};after->funcN=callbackN;
  after->func_argN=&prop;after->func_argN_free_fn=arg_free;after->handle_func=handle_callback;after->rename_orig=&prop;
  // The native API forbids both rename callback forms. Test them on separate runs below.
  after->rename_func=nullptr;after->search_arg=&prop;after->search_arg_free_fn=search_free;
  after->custom_interaction_handle=&interaction;after->undostr[0]='x';UIAfterFuncs.first=after;
  ui_apply_but_funcs_after(&C);
  assert(!UIAfterFuncs.first&&!installed&&record_frees==1&&ptr_frees==1&&copy_frees==2&&rename_frees==1&&search_frees==1&&interaction_frees==1);
 };
 auto without_rename=expected;without_rename.erase(without_rename.begin()+8);
 run("",true,true,true);assert(calls==without_rename);
 auto no_operator=without_rename;no_operator.erase(no_operator.begin()+1);
 run("unregister",true,true,true);assert(calls==no_operator);
 run("reload",true,true,true);assert(calls==no_operator);
 run("unregister",false,true,true);assert(calls==without_rename);
 for(const auto &terminal:without_rename){
  if(terminal=="preferences")continue;
  run(terminal,true,true,true);
  auto it=std::find(without_rename.begin(),without_rename.end(),terminal);
  std::vector<std::string> prefix(without_rename.begin(),it+1);assert(calls==prefix);
 }
 run("",true,false,true);assert(calls.empty());
 run("interaction",true,true,true);assert(calls.back()=="handle");
 run("",true,true,false);auto no_popup=without_rename;no_popup.erase(no_popup.begin());assert(calls==no_popup);
 run("popup",false,false,true);assert(calls==without_rename);
 // Refusal of copied context pointers must occur before store installation,
 // operator/RNA/function/Undo semantics, while properties still get freed.
 bContext rejected;active_context=&rejected;calls.clear();owned=true;stop="";
 auto *bad=new uiAfterFunc{};bad->ipad_action_origin=ipad_ring::ActionOrigin::capture({1,2,3,4,5,6,7,8,9,0,11,12,13},"builtin.move",7);
 bad->context=bContextStore{true};bad->optype=&ot;bad->opptr=new PointerRNA{&prop};bad->func=callback;bad->undostr[0]='x';UIAfterFuncs.first=bad;
 int before_ptr=ptr_frees,before_copy=copy_frees;ui_apply_but_funcs_after(&rejected);
 assert(calls.empty()&&!installed&&ptr_frees==before_ptr+1&&copy_frees==before_copy+1);
 // Unregister can dispose a pending dialog while the scene context remains
 // unchanged. Its queued borrowed OK/Cancel arguments must never be invoked.
 numbers_lease=false;calls.clear();auto *retired=new uiAfterFunc{};
 retired->ipad_action_origin=ipad_ring::ActionOrigin::capture({1,2,3,4,5,6,7,8,9,0,11,12,13},"builtin.move",7);
 retired->ipad_numbers_callback=true;retired->ipad_popup_lifetime=99;retired->func=callback;retired->func_arg1=reinterpret_cast<void *>(1);retired->undostr[0]='x';UIAfterFuncs.first=retired;
 ui_apply_but_funcs_after(&rejected);assert(calls.empty()&&!UIAfterFuncs.first);numbers_lease=true;
 // A refresh preserves popup lifetime but replaces its block. Reconstruct
 // the exact dialog callback's borrowed block argument from the fresh owner.
 RNARuntime fresh_runtime{{&current_numbers_block}};RNARegion fresh_region{&fresh_runtime};int payload=5;numbers_popup={&payload,&fresh_region};calls.clear();
 auto *refreshed=new uiAfterFunc{};refreshed->ipad_action_origin=ipad_ring::ActionOrigin::capture({1,2,3,4,5,6,7,8,9,0,11,12,13},"builtin.move",7);
 refreshed->ipad_numbers_callback=true;refreshed->ipad_popup_lifetime=99;refreshed->func=numbers_callback;refreshed->func_arg1=&payload;refreshed->func_arg2=reinterpret_cast<void *>(1);UIAfterFuncs.first=refreshed;
 ui_apply_but_funcs_after(&rejected);assert(calls==std::vector<std::string>({"numbers","preferences"}));
 // Execute the alternate rename route and ensure its callback loss suppresses Undo.
 bContext C;active_context=&C;owned=true;stop="rename";calls.clear();auto *after=new uiAfterFunc{};
 after->ipad_action_origin=ipad_ring::ActionOrigin::capture({1,2,3,4,5,6,7,8,9,0,11,12,13},"builtin.move",7);
 after->rename_func=rename_callback;after->rename_orig=&prop;after->undostr[0]='x';UIAfterFuncs.first=after;
 ui_apply_but_funcs_after(&C);assert(calls==std::vector<std::string>{"rename"});
}
'''
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(ring_source().replace('#pragma once','')+world)

if __name__=='__main__':unittest.main()
