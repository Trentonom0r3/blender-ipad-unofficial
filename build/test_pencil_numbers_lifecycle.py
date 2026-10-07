"""Execute Numbers type retirement and consuming native terminal callbacks.

Native UI/WM calls are fixture APIs, not patched target modal execution.
"""
import unittest
from test_touch_extrude import changed_source
from test_tool_ring import ring_source
from test_pencil_callback_disposal import definition
import test_ipad_panels

HANDLERS=changed_source('source/blender/editors/interface/interface_handlers.cc')
WM=changed_source('source/blender/windowmanager/intern/wm_operators.cc')
HEADER=changed_source('source/blender/editors/include/UI_interface_c.hh')

GUARD=definition(HEADER,'class uiIPadNumbersTypeGuard {')+';\n'
GUARD+='static std::vector<uintptr_t> ui_ipad_numbers_type_guards;\n'
GUARD+='\n'.join(definition(HANDLERS,s) for s in (
    'uiIPadNumbersTypeGuard::uiIPadNumbersTypeGuard(',
    'uiIPadNumbersTypeGuard::~uiIPadNumbersTypeGuard('))
GUARD+='\n'+definition(HANDLERS,'struct uiIPadNumbersDisposal {')+';\n'
GUARD+='static std::vector<uiIPadNumbersDisposal> ui_ipad_numbers_disposals;\n'
GUARD+='\n'.join(definition(HANDLERS,s) for s in (
    'static void ui_ipad_numbers_dispose_later(', 'bool UI_ipad_numbers_dispose_deferred('))

WORLD=r'''
#include <cassert>
#include <vector>
#include <string>
#include <algorithm>
#define BLI_assert(x) assert(x)
template<class T>struct List{T *first=nullptr;};
#define LISTBASE_FOREACH(type,var,list) for(type var=(list)->first;var;var=var->next)
struct StructRNA{};struct wmOperatorType{const char *idname="VIEW3D_OT_ipad_transform_numbers";StructRNA *srna=nullptr;struct{StructRNA *srna=nullptr;} rna_ext;};
wmOperatorType *registration=nullptr;
wmOperatorType *WM_operatortype_find(const char *,bool){return registration;}
using uiFreeArgFunc=void(*)(void *);
struct bContext;
struct uiPopupBlockHandle{uintptr_t ipad_numbers_type=0;uiFreeArgFunc ipad_numbers_dispose=nullptr;void *ipad_numbers_dispose_arg=nullptr;bool ipad_operator_retired=false;bool ipad_numbers=true;int menuretval=0;void (*cancel_func)(bContext *,void *)=nullptr;void *popup_arg=nullptr;};
struct wmEventHandler{wmEventHandler *next=nullptr;int type=1,flag=0;};
struct wmEventHandler_UI:wmEventHandler{void (*handle_fn)()=nullptr;void (*remove_fn)()=nullptr;void *user_data=nullptr;};
struct wmWindow{wmWindow *next=nullptr;List<wmEventHandler> modalhandlers;};
struct wmWindowManager{wmWindowManager *next=nullptr;List<wmWindow> windows;};
struct Main{List<wmWindowManager> wm;};Main *G_MAIN=nullptr;
struct bContext{Main *main=nullptr;wmWindowManager *wm=nullptr;wmWindow *win=nullptr;};
[[maybe_unused]] constexpr int WM_HANDLER_TYPE_UI=1,WM_HANDLER_DO_FREE=2;
[[maybe_unused]] constexpr int UI_RETURN_OK=4;
void ui_popup_handler(){}void ui_popup_handler_remove(){}void unrelated_handler(){}
int contexts=0,closes=0,disposals=0;std::vector<int> order;
bContext *CTX_create(){++contexts;return new bContext{};}
void CTX_data_main_set(bContext *C,Main *m){C->main=m;}
void CTX_wm_manager_set(bContext *C,wmWindowManager *wm){C->wm=wm;}
void CTX_wm_window_set(bContext *C,wmWindow *win){C->win=win;}
void CTX_free(bContext *C){--contexts;delete C;}
void ui_ipad_popup_operator_retire(uiPopupBlockHandle *h){h->ipad_operator_retired=true;h->ipad_numbers_dispose=nullptr;h->ipad_numbers_dispose_arg=nullptr;}
void UI_popup_handlers_remove(List<wmEventHandler> *handlers,uiPopupBlockHandle *h){
 wmEventHandler **link=&handlers->first;while(*link){auto *handler=static_cast<wmEventHandler_UI *>(*link);if(handler->user_data==h){*link=handler->next;handler->user_data=nullptr;return;}link=&handler->next;}assert(false);
}
void ui_popup_block_free(bContext *C,uiPopupBlockHandle *h){assert(C->main&&C->wm&&C->win&&h->ipad_operator_retired&&!h->ipad_numbers_dispose);++closes;order.push_back(1);delete h;}
'''

class PencilNumbersLifecycleTests(unittest.TestCase):
    def test_unregister_closes_before_disposal_restarts_live_lists_and_blocks_reentry(self):
        source=definition(HANDLERS,'bool UI_ipad_numbers_type_retire(')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(WORLD+GUARD+source+r'''
Main *active_main=nullptr;wmOperatorType *active_type=nullptr;int mode=0;
void dispose(void *){assert(contexts==0);++disposals;order.push_back(2);assert(!UI_ipad_numbers_type_retire(active_main,active_type));if(mode==1)G_MAIN=nullptr;if(mode==2)registration=nullptr;}
int main(){
 for(int run=0;run<10000;++run){
  StructRNA schema;wmOperatorType ot;ot.srna=&schema;ot.rna_ext.srna=&schema;registration=&ot;active_type=&ot;
  wmEventHandler_UI a,b,other;a.handle_fn=b.handle_fn=ui_popup_handler;a.remove_fn=b.remove_fn=ui_popup_handler_remove;other.handle_fn=unrelated_handler;other.remove_fn=ui_popup_handler_remove;
  auto make=[&](){return new uiPopupBlockHandle{uintptr_t(&ot),dispose,&ot,false};};a.user_data=make();b.user_data=make();other.user_data=reinterpret_cast<void *>(1);
  if(run%2)b.flag=WM_HANDLER_DO_FREE;
  wmWindow wa{nullptr,{&a}},wb{nullptr,{&b}};wmWindowManager wma{nullptr,{&wa}},wmb{nullptr,{&wb}};wma.next=&wmb;
  Main main{{&wma}};active_main=G_MAIN=&main;closes=disposals=contexts=0;order.clear();mode=0;
  assert(UI_ipad_numbers_type_retire(&main,&ot));assert(closes==2&&disposals==2&&contexts==0);
  assert(order==std::vector<int>({1,2,1,2}));assert(!wa.modalhandlers.first&&!wb.modalhandlers.first&&ui_ipad_numbers_type_guards.empty());
  assert(UI_ipad_numbers_type_retire(&main,&ot)&&disposals==2);
 }
 for(int failure=1;failure<=2;++failure){wmOperatorType ot;registration=active_type=&ot;wmEventHandler_UI a;a.handle_fn=ui_popup_handler;a.remove_fn=ui_popup_handler_remove;a.user_data=new uiPopupBlockHandle{uintptr_t(&ot),dispose,&ot,false};wmWindow win{nullptr,{&a}};wmWindowManager wm{nullptr,{&win}};Main main{{&wm}};active_main=G_MAIN=&main;mode=failure;assert(!UI_ipad_numbers_type_retire(&main,&ot));assert(ui_ipad_numbers_type_guards.empty());}
 // A native handler is already detached, but its onfree owner remains queued.
 wmOperatorType queued_type;registration=active_type=&queued_type;Main queued_main;active_main=G_MAIN=&queued_main;mode=0;int before=disposals;
 ui_ipad_numbers_dispose_later(uintptr_t(&queued_type),dispose,&queued_type);
 assert(UI_ipad_numbers_type_retire(&queued_main,&queued_type)&&disposals==before+1&&ui_ipad_numbers_disposals.empty());
}
''')
        unregister=definition(changed_source('source/blender/makesrna/intern/rna_wm.cc'),
                              'static bool rna_Operator_unregister(')
        self.assertLess(unregister.index('UI_ipad_numbers_type_retire'),unregister.index('RNA_struct_free_extension'))
        remove=definition(changed_source('source/blender/windowmanager/intern/wm_operator_type.cc'),
                          'void WM_operatortype_remove_ptr(')
        self.assertLess(remove.index('UI_ipad_numbers_type_retire'),remove.index('BPY_free_srna_pytype'))

    def test_onfree_queues_python_disposal_until_enclosing_native_handler_detaches(self):
        remove=definition(HANDLERS,'static void ui_popup_handler_remove(').replace(
            'static void ui_popup_handler_remove(', 'static void actual_remove(',1)
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(WORLD+GUARD+r'''
void ui_apply_but_funcs_after(bContext *){}
void finalizer(void *){++disposals;order.push_back(2);G_MAIN=nullptr;}
'''+remove+r'''
int main(){wmOperatorType ot;registration=&ot;Main main;G_MAIN=&main;wmWindow win;wmWindowManager wm;wm.windows.first=&win;main.wm.first=&wm;bContext C{&main,&wm,&win};
 auto *handle=new uiPopupBlockHandle{uintptr_t(&ot),finalizer,&ot,false};wmEventHandler_UI handler;handler.user_data=handle;win.modalhandlers.first=&handler;
 actual_remove(&C,handle);assert(disposals==0&&closes==1&&win.modalhandlers.first==&handler&&handler.user_data==handle&&G_MAIN==&main);
 // Native caller can finish its handler unlink/return without a Python
 // callback re-entering the still-linked freed popup or replacing its lists.
 win.modalhandlers.first=nullptr;handler.user_data=nullptr;
 {uiIPadNumbersTypeGuard nested{uintptr_t(&ot)};assert(!UI_ipad_numbers_dispose_deferred()&&disposals==0);}
 assert(UI_ipad_numbers_dispose_deferred()&&disposals==1&&!G_MAIN&&order==std::vector<int>({1,2}));
 assert(UI_ipad_numbers_dispose_deferred()&&disposals==1);
}
''')
        event=changed_source('source/blender/windowmanager/intern/wm_event_system.cc')
        boundary=definition(event,'void wm_event_do_handlers(')
        self.assertTrue(boundary.rstrip().endswith('UI_ipad_numbers_dispose_deferred();\n}'))
        bulk=definition(changed_source('source/blender/windowmanager/intern/wm_operator_type.cc'),
                        'void wm_operatortype_free(')
        self.assertLess(bulk.index('UI_ipad_numbers_dispose_deferred'),bulk.index('get_operators_map()'))

    def test_explicit_cancel_closes_before_decref_and_poll_refusal_disposes_once(self):
        funcs='\n'.join(definition(WM,s) for s in (
            'static void wm_operator_ipad_numbers_dispose(',
            'static void dialog_cancel_cb(', 'static void dialog_exec_cb('))
        world=r'''
struct wmOperator{wmOperatorType *type=nullptr;};struct uiBlock{bool live=true,retired=false;};
struct wmOpPopUp{wmOperator *op=nullptr;uintptr_t ipad_numbers_type=0;bool free_op=true;};
using wmOperatorStatus=int;constexpr int UI_RETURN_CANCEL=2,OPERATOR_CANCELLED=4,OPERATOR_HANDLED=8;
int frees=0,data_frees=0,executions=0;bool poll=false;
template<class T>void MEM_delete(T *p){++data_frees;delete p;}
void UI_ipad_popup_operator_retire(uiBlock *block){assert(block->live);block->retired=true;}
void UI_popup_menu_retval_set(uiBlock *block,int,bool){assert(block->live&&block->retired);}
wmWindow *CTX_wm_window(bContext *C){return C->win;}
void UI_popup_block_close(bContext *,wmWindow *,uiBlock *block){assert(block->live&&block->retired);block->live=false;order.push_back(1);}
void WM_operator_free(wmOperator *op){assert(!ui_ipad_numbers_type_guards.empty()&&registration==op->type);const char *live_name=op->type->idname;assert(live_name);++frees;order.push_back(2);}
void wm_operator_ui_popup_cancel(bContext *,void *){assert(false);}
wmOperatorStatus WM_operator_call_ex(bContext *,wmOperator *op,bool){++executions;if(!poll)return OPERATOR_CANCELLED;WM_operator_free(op);return OPERATOR_CANCELLED|OPERATOR_HANDLED;}
'''
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(WORLD+GUARD+world+funcs+r'''
int main(){(void)&ui_ipad_numbers_dispose_later;wmOperatorType ot;registration=&ot;wmOperator op{&ot};bContext C;wmWindow win;C.win=&win;
 for(int i=0;i<10000;++i){uiBlock block;auto *data=new wmOpPopUp{&op,uintptr_t(&ot),true};frees=data_frees=0;order.clear();dialog_cancel_cb(&C,data,&block);assert(!block.live&&frees==1&&data_frees==1&&order==std::vector<int>({1,2}));}
 for(bool accepted:{false,true}){poll=accepted;uiBlock block;auto *data=new wmOpPopUp{&op,uintptr_t(&ot),true};frees=data_frees=executions=0;order.clear();dialog_exec_cb(&C,data,&block);assert(!block.live&&frees==1&&data_frees==1&&executions==1&&order==std::vector<int>({1,2}));}
 assert(ui_ipad_numbers_type_guards.empty());
}
''')

if __name__=='__main__':unittest.main()
