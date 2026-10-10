"""Execute original-owner Pencil paint teardown and native status cleanup fragments.

The owner/list/context shell is modeled; registered owner validation, the teardown
helper, the special dispatch gates, and WM cancellation/free snippets come from the
active pinned-source overlay. This is not target UIKit or device evidence.
"""
import unittest
import re
from test_compact_shelf import function
from test_touch_extrude import changed_source
import test_pencil_paint_contact_lease as lease
import test_ipad_panels

WM_PATH = 'source/blender/windowmanager/intern/wm_event_system.cc'
SCREEN_PATH = 'source/blender/editors/screen/screen_edit.cc'
API_PATH = 'source/blender/windowmanager/WM_api.hh'
WM = changed_source(WM_PATH)
SCREEN = changed_source(SCREEN_PATH)
API = changed_source(API_PATH)
EVENT_TYPES = changed_source('source/blender/windowmanager/wm_event_types.hh')
REGISTERED = function(WM, 'static bool wm_ipad_pencil_paint_handler_registered(')
OWNER_TEARDOWN = function(WM, 'void WM_event_ipad_pencil_paint_owner_teardown(')
OPERATOR_CALL = function(WM, 'static eHandlerActionFlag wm_handler_operator_call(')
TEARDOWN_PREADMISSION = lease.cpp_block(
    OPERATOR_CALL, 'if (ipad_pencil_owner_teardown && handler->ipad_pencil_paint_serial')
TEARDOWN_ADMISSION = lease.cpp_block(
    OPERATOR_CALL, 'if (handler->ipad_pencil_paint_serial || ipad_pencil_owner_teardown)')
LOCK_CONDITION = re.search(
    r'if \((!wm_operator_check_locked_interface\(C, ot\) && '
    r'!ipad_pencil_owner_teardown_admitted)\)', OPERATOR_CALL).group(1)

STATUS_FRAGMENTS = '\n'.join((
    lease.NATIVE_UNDO_BEGIN,
    lease.NATIVE_INTERRUPT,
    lease.NATIVE_UNDO_END,
    lease.NATIVE_CANCEL_REPORTS,
    lease.NATIVE_OPERATOR_RELEASE,
    lease.NATIVE_HANDLER_REMOVE,
))

CPP_PRELUDE = r'''
#include <cassert>
#include <cstdint>
#include <cstring>
#include <initializer_list>
struct bContext; struct wmWindow; struct wmWindowManager; struct ScrArea;
struct ARegion; struct wmOperator; struct wmEvent; struct wmEventHandler_Op;
struct ListBase { void *first=nullptr; };
struct ID { uint64_t session_uid=17; };
struct rcti { int xmin=10,ymin=20,xmax=110,ymax=120; };
struct ARegionRuntime { bool visible=true; };
struct ARegion { ARegion *next=nullptr; int regiontype=1; ARegionRuntime *runtime=nullptr; rcti winrct; };
struct ScrArea { ScrArea *next=nullptr; ListBase regionbase; bool hidden=false; };
struct bScreen { ID id; ListBase areabase; };
struct wmEventHandler { int type=1,flag=0; wmEventHandler *next=nullptr; bool freed=false; };
struct wmWindow { wmWindow *next=nullptr; int runtime_data=1; void *runtime=nullptr;
  bScreen *screen=nullptr; ListBase modalhandlers,handlers; };
struct wmWindowManager { int op_undo_depth=0; ListBase windows; };
struct wmEvent { int type=0,val=0,xy[2]{}; uint64_t ipad_pencil_paint_serial=0,
  ipad_pencil_paint_generation=0; uintptr_t ipad_pencil_paint_region=0; };
struct ReportList { ListBase list; };
using ModalFn=int(*)(bContext*,wmOperator*,wmEvent*);
using CancelFn=void(*)(bContext*,wmOperator*);
struct wmOperatorType { uint64_t ipad_lifetime_id=29; ModalFn modal=nullptr; CancelFn cancel=nullptr;
  bool modalkeymap=false; int flag=16; };
struct wmOperator { wmOperatorType *type=nullptr; wmOperator *opm=nullptr;
  uint64_t ipad_lifetime=31; ReportList *reports=nullptr; bool freed=false; };
struct wmEventHandler_Op { wmEventHandler head; bool is_fileselect=false;
  struct { wmWindow *win=nullptr; ScrArea *area=nullptr; ARegion *region=nullptr; } context;
  uint64_t ipad_pencil_operator_lifetime=31,ipad_pencil_type_lifetime=29,
    ipad_pencil_type_address=0,ipad_pencil_screen_uid=17,ipad_pencil_area=0,
    ipad_pencil_region=0,ipad_pencil_paint_serial=44;
  int ipad_pencil_paint_mode=8; wmOperator *op=nullptr; };
struct bContext { wmWindowManager *wm=nullptr; wmWindow *win=nullptr; ScrArea *area=nullptr;
  ARegion *region=nullptr; };
struct PointerRNA {};
enum { WM_HANDLER_TYPE_OP=1,WM_HANDLER_DO_FREE=2,RGN_TYPE_WINDOW=3,OB_MODE_SCULPT=8,
  EVENT_NONE=100,LEFTMOUSE=101,KM_NOTHING=0,OPTYPE_UNDO=16,OPERATOR_CANCELLED=32,
  OPERATOR_FINISHED=64,OPERATOR_PASS_THROUGH=128,WM_HANDLER_CONTINUE=0,
  WM_HANDLER_BREAK=4,WM_HANDLER_HANDLED=8,NC_SPACE=1,ND_SPACE_INFO_REPORT=2 };
using wmOperatorStatus=int; using eHandlerActionFlag=int;
enum class eIPadPencilPaintModalAdmission : uint8_t { Dispatch,Consume,Cancel };
struct wmEvent_ModalMapStore { bool dbl_click_disabled=false; int prev_type=0,prev_val=0; };
struct wmOperatorReports { ListBase list; };
int g_cancel_calls=0,g_cancel_context_correct=0,g_admit_calls=0,g_locked_refusals=0;
int g_operator_frees=0,g_handler_frees=0,g_unlinks=0,g_report_calls=0,g_cursor_disables=0;
int g_handler_context_calls=0,g_modal_calls=0,g_stale_list_reads=0,g_list_reads=0;
bool g_interface_unlocked=false,g_owner_valid=true,g_replace_context=false,g_context_replaced=false;
ListBase *g_retired_list=nullptr; wmWindow *g_retired_window=nullptr;
ScrArea *g_owner_area=nullptr; ARegion *g_owner_region=nullptr;
wmWindow *g_replacement_window=nullptr; wmWindowManager *g_replacement_manager=nullptr;
wmOperatorType *g_registered_type=nullptr; ReportList g_report_list;
void *list_first(const ListBase *list) { ++g_list_reads;
  if(g_context_replaced&&g_retired_list==list)++g_stale_list_reads; return list->first; }
#define LISTBASE_FOREACH(type,var,list) \
  for(type var=(type)list_first(list);var;var=var->next)
int BLI_findindex(const ListBase *list,const wmEventHandler *target) {
  int n=0;
  for(auto *item=(wmEventHandler*)list_first(list);item;item=item->next,++n){
    if(item==target)return n;
  }
  return -1; }
void BLI_remlink(ListBase *list,void *raw_target) {
  wmEventHandler *target=(wmEventHandler*)raw_target;
  wmEventHandler *prev=nullptr,*item=(wmEventHandler*)list->first;
  while(item&&item!=target){prev=item;item=item->next;}
  if(item){if(prev)prev->next=item->next;else list->first=item->next;
    item->next=nullptr;++g_unlinks;}}
bScreen *WM_window_get_active_screen(wmWindow *win){return win?win->screen:nullptr;}
wmWindow *CTX_wm_window(bContext *C){return C?C->win:nullptr;}
wmWindowManager *CTX_wm_manager(bContext *C){return C?C->wm:nullptr;}
ScrArea *CTX_wm_area(bContext *C){return C?C->area:nullptr;}
ARegion *CTX_wm_region(bContext *C){return C?C->region:nullptr;}
void CTX_wm_area_set(bContext *C,ScrArea *a){C->area=a;}
void CTX_wm_region_set(bContext *C,ARegion *r){C->region=r;}
bool WM_operator_touch_lifetime_matches(const wmOperator *op,uint64_t identity){
  return op&&op->ipad_lifetime==identity;}
wmOperatorType *WM_operatortype_find(const char *idname,bool){
  return idname&&std::strcmp(idname,"SCULPT_OT_brush_stroke")==0?g_registered_type:nullptr;}
const char *wm_ipad_pencil_paint_operator_id(int mode){
  return mode==OB_MODE_SCULPT?"SCULPT_OT_brush_stroke":nullptr;}
bool wm_operator_check_locked_interface(bContext*,wmOperatorType*){return g_interface_unlocked;}
void wm_handler_op_context(bContext *C,wmEventHandler_Op *handler,const wmEvent*){
  ++g_handler_context_calls;
  if(handler->context.area&&handler->context.area->hidden){C->area=nullptr;C->region=nullptr;return;}
  C->area=handler->context.area;C->region=handler->context.region;}
int wm_operator_undo_active_id(wmWindowManager*){return 1;}
int wm_operator_register_active_id(wmWindowManager*){return 2;}
void wm_operator_reports(bContext*,wmOperator*,int,bool){++g_report_calls;}
void WM_window_status_area_tag_redraw(wmWindow*){}
void WM_cursor_grab_disable(wmWindow*,void*){++g_cursor_disables;}
void WM_operator_free(wmOperator *op){assert(op&&!op->freed);op->freed=true;++g_operator_frees;}
void wm_event_free_handler(wmEventHandler *handler){assert(handler);handler->freed=true;++g_handler_frees;}
bool wm_event_always_pass(const wmEvent*){return true;}
void wm_gizmomaps_handled_modal_update(bContext*,wmEvent*,wmEventHandler_Op*){}
void wm_region_mouse_co(bContext*,wmEvent*){}
void wm_event_modalkeymap_begin(bContext*,wmOperator*,wmEvent*,wmEvent_ModalMapStore*){}
void wm_event_modalkeymap_end(wmEvent*,const wmEvent_ModalMapStore*){}
void wm_operator_finished(bContext*,wmOperator*,bool,bool,bool,bool){}
void WM_event_add_notifier(bContext*,int,void*){}
void WM_reports_from_reports_move(wmWindowManager*,ListBase*){}
int noop_modal(bContext*,wmOperator*,wmEvent*){++g_modal_calls;return OPERATOR_PASS_THROUGH;}
bContext *g_callback_context=nullptr;
void paint_cancel(bContext *C,wmOperator*) {
  ++g_cancel_calls;
  if(C->area==g_owner_area&&C->region==g_owner_region)++g_cancel_context_correct;
  if(g_replace_context){g_context_replaced=true;g_retired_window=C->win;
    g_retired_list=&g_retired_window->modalhandlers;C->win=g_replacement_window;
    C->wm=g_replacement_manager;}
}
'''

CALL_FIXTURE = r'''
int wm_handler_operator_call(bContext *C,ListBase *handlers,wmEventHandler *handler_base,
                             wmEvent *event,PointerRNA*,const char*,bool ipad_pencil_owner_teardown=false){
  wmOperatorStatus retval=OPERATOR_PASS_THROUGH;
  if(handler_base->type==WM_HANDLER_TYPE_OP&&
     ((wmEventHandler_Op*)handler_base)->op!=nullptr){
    wmEventHandler_Op *handler=(wmEventHandler_Op*)handler_base;
    wmOperator *op=handler->op;wmOperatorType *ot=op->type;
    bool ipad_pencil_owner_teardown_admitted=false;
''' + TEARDOWN_PREADMISSION + r'''
    if(''' + LOCK_CONDITION + r''') { ++g_locked_refusals; return WM_HANDLER_CONTINUE; }
    if(ot->modal){wmWindowManager *wm=CTX_wm_manager(C);wmWindow *win=CTX_wm_window(C);
      ScrArea *area=CTX_wm_area(C);ARegion *region=CTX_wm_region(C);
      if(!ipad_pencil_owner_teardown)wm_handler_op_context(C,handler,event);
      bool ipad_pencil_paint_interrupt=false;
''' + TEARDOWN_ADMISSION + r'''
      const intptr_t undo_id_prev=wm_operator_undo_active_id(wm);
      const intptr_t register_id_prev=wm_operator_register_active_id(wm);
      bool modalkeymap_started=false;wmEvent_ModalMapStore event_backup;
      (void)undo_id_prev;(void)register_id_prev;(void)modalkeymap_started;(void)event_backup;
''' + lease.NATIVE_UNDO_BEGIN + r'''
''' + lease.NATIVE_INTERRUPT + r'''
''' + lease.NATIVE_UNDO_END + r'''
      if(CTX_wm_window(C)==win){
''' + lease.NATIVE_CANCEL_REPORTS + r'''
        if(retval&OPERATOR_FINISHED){}
''' + lease.NATIVE_OPERATOR_RELEASE + r'''
        if((retval&OPERATOR_PASS_THROUGH)||wm_event_always_pass(event)){
          CTX_wm_area_set(C,area);CTX_wm_region_set(C,region);}
        else{CTX_wm_area_set(C,nullptr);CTX_wm_region_set(C,nullptr);}
        wm_gizmomaps_handled_modal_update(C,event,handler);
''' + lease.NATIVE_HANDLER_REMOVE + r'''
      }
    }
  }
  return WM_HANDLER_CONTINUE;
}
'''

CPP_FIXTURE = CPP_PRELUDE + r'''
static eIPadPencilPaintModalAdmission wm_ipad_pencil_paint_modal_admit(
 bContext *C,wmWindow *win,const wmEvent *event,const wmEventHandler_Op*){
 ++g_admit_calls;
 if(!C||!win||CTX_wm_window(C)!=win||!event||event->type!=EVENT_NONE||
    event->ipad_pencil_paint_serial||event->ipad_pencil_paint_generation||
    event->ipad_pencil_paint_region||CTX_wm_area(C)!=g_owner_area||
    CTX_wm_region(C)!=g_owner_region||!g_owner_valid)
   return eIPadPencilPaintModalAdmission::Consume;
 return eIPadPencilPaintModalAdmission::Cancel;
}
''' + CALL_FIXTURE + '\n' + REGISTERED + '\n' + OWNER_TEARDOWN + r'''
void reset_globals();
struct Fixture {
  bScreen screen;ScrArea owner_area,outside_area;ARegionRuntime runtime;
  ARegion owner_region,outside_region;wmWindowManager manager,replacement_manager;
  wmWindow window,replacement_window;wmOperatorType type;wmOperator op;
  wmEventHandler_Op handler;bContext C;
  Fixture(){
    reset_globals();screen.id.session_uid=17;owner_area.hidden=true;
    runtime.visible=true;owner_region.regiontype=RGN_TYPE_WINDOW;owner_region.runtime=&runtime;
    owner_region.winrct={10,20,110,120};owner_area.regionbase.first=&owner_region;
    screen.areabase.first=&owner_area;
    window.runtime=&window.runtime_data;window.screen=&screen;
    replacement_window.runtime=&replacement_window.runtime_data;
    type.ipad_lifetime_id=29;type.modal=noop_modal;type.cancel=paint_cancel;type.flag=OPTYPE_UNDO;
    g_registered_type=&type;op.type=&type;op.ipad_lifetime=31;op.reports=&g_report_list;
    handler.head.type=WM_HANDLER_TYPE_OP;handler.context.win=&window;
    handler.context.area=&owner_area;handler.context.region=&owner_region;handler.op=&op;
    handler.ipad_pencil_operator_lifetime=31;handler.ipad_pencil_type_lifetime=29;
    handler.ipad_pencil_type_address=uintptr_t(&type);handler.ipad_pencil_screen_uid=17;
    handler.ipad_pencil_area=uintptr_t(&owner_area);handler.ipad_pencil_region=uintptr_t(&owner_region);
    handler.ipad_pencil_paint_mode=OB_MODE_SCULPT;handler.ipad_pencil_paint_serial=44;
    window.modalhandlers.first=&handler.head;
    C.wm=&manager;C.win=&window;C.area=&outside_area;C.region=&outside_region;
    g_owner_area=&owner_area;g_owner_region=&owner_region;g_replacement_window=&replacement_window;
    g_replacement_manager=&replacement_manager;g_retired_window=&window;
  }
};
void reset_globals(){
  g_cancel_calls=g_cancel_context_correct=g_admit_calls=g_locked_refusals=0;
  g_operator_frees=g_handler_frees=g_unlinks=g_report_calls=g_cursor_disables=0;
  g_handler_context_calls=g_modal_calls=g_stale_list_reads=g_list_reads=0;
  g_interface_unlocked=false;g_owner_valid=true;g_replace_context=false;g_context_replaced=false;
  g_retired_list=nullptr;g_owner_area=nullptr;g_owner_region=nullptr;
  g_replacement_window=nullptr;g_replacement_manager=nullptr;g_registered_type=nullptr;
  g_report_list.list.first=nullptr;
}
void assert_normal_area_or_region_teardown(bool by_region){
  Fixture f;ScrArea *previous_area=f.C.area;ARegion *previous_region=f.C.region;
  assert(wm_ipad_pencil_paint_handler_registered(&f.window,&f.handler));
  if(by_region)WM_event_ipad_pencil_paint_owner_teardown(&f.C,&f.window,nullptr,&f.owner_region);
  else WM_event_ipad_pencil_paint_owner_teardown(&f.C,&f.window,&f.owner_area,nullptr);
  assert(g_cancel_calls==1&&g_cancel_context_correct==1&&g_modal_calls==0);
  assert(g_operator_frees==1&&g_handler_frees==1&&g_unlinks==1&&g_report_calls==1&&g_cursor_disables==1);
  assert(f.manager.op_undo_depth==0&&f.handler.op==nullptr&&f.handler.head.freed);
  assert(f.window.modalhandlers.first==nullptr);
  assert(g_handler_context_calls==0); /* hidden listed area bypasses area iterator */
  assert(f.C.area==previous_area&&f.C.region==previous_region);
}
int main(){
  /* Locked native UI still uses Blender's exact Cancel/status/free path for the owner. */
  assert_normal_area_or_region_teardown(false);
  assert_normal_area_or_region_teardown(true);
  {
    Fixture f;ScrArea *pa=f.C.area;ARegion *pr=f.C.region;g_owner_valid=false;
    WM_event_ipad_pencil_paint_owner_teardown(&f.C,&f.window,&f.owner_area,nullptr);
    assert(g_admit_calls==1&&g_cancel_calls==0&&g_operator_frees==0);
    assert(f.window.modalhandlers.first==&f.handler.head&&f.handler.op==&f.op);
    assert(f.C.area==pa&&f.C.region==pr);
  }
  {
    Fixture f;ScrArea *pa=f.C.area;ARegion *pr=f.C.region;
    f.owner_region.runtime=nullptr;
    WM_event_ipad_pencil_paint_owner_teardown(&f.C,&f.window,nullptr,&f.owner_region);
    assert(g_admit_calls==0&&g_cancel_calls==0&&g_operator_frees==0);
    assert(f.C.area==pa&&f.C.region==pr);
  }
  {
    Fixture f;wmEvent event;event.type=LEFTMOUSE;g_interface_unlocked=false;
    wm_handler_operator_call(&f.C,&f.window.modalhandlers,&f.handler.head,&event,nullptr,nullptr,true);
    assert(g_admit_calls==0&&g_locked_refusals==1&&g_cancel_calls==0);
    event.type=EVENT_NONE;f.handler.ipad_pencil_paint_serial=0;
    wm_handler_operator_call(&f.C,&f.window.modalhandlers,&f.handler.head,&event,nullptr,nullptr,true);
    assert(g_admit_calls==0&&g_locked_refusals==2&&g_cancel_calls==0);
  }
  {
    Fixture f;g_replace_context=true;
    WM_event_ipad_pencil_paint_owner_teardown(&f.C,&f.window,&f.owner_area,nullptr);
    assert(g_cancel_calls==1&&g_cancel_context_correct==1&&g_context_replaced);
    assert(f.C.win==&f.replacement_window&&f.C.wm==&f.replacement_manager);
    assert(g_stale_list_reads==0);
    assert(f.C.area==&f.owner_area&&f.C.region==&f.owner_region);
  }
}
'''

class PencilPaintOwnerTeardownTests(unittest.TestCase):
    def test_connected_area_region_teardown_and_native_locked_cancel_cleanup(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(CPP_FIXTURE)

    def test_uses_the_pinned_native_none_event_enumerator(self):
        self.assertIn('EVENT_NONE =', EVENT_TYPES)
        self.assertIn('event->type == EVENT_NONE', OPERATOR_CALL)
        self.assertIn('cancel_event.type = EVENT_NONE', OWNER_TEARDOWN)
        self.assertNotIn('EVT_NONE', OWNER_TEARDOWN)

    def test_teardown_hooks_precede_native_area_and_region_exit_callbacks(self):
        area_exit = function(SCREEN, 'void ED_area_exit(')
        region_exit = function(SCREEN, 'void ED_region_exit(')
        hook = 'WM_event_ipad_pencil_paint_owner_teardown(C, win,'
        self.assertLess(area_exit.index(hook), area_exit.index('area->type->exit'))
        self.assertLess(region_exit.index(hook), region_exit.index('region->runtime->type->exit'))
        self.assertLess(region_exit.index(hook), region_exit.index('region->runtime->visible = false'))
        self.assertIn('void WM_event_ipad_pencil_paint_owner_teardown(bContext *C,', API)

if __name__ == '__main__':
    unittest.main(verbosity=2)
