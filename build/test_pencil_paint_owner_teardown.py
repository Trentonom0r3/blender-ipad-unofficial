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
FILES_PATH = 'source/blender/windowmanager/intern/wm_files.cc'
WINDOW_PATH = 'source/blender/windowmanager/intern/wm_window.cc'
WM = changed_source(WM_PATH)
SCREEN = changed_source(SCREEN_PATH)
API = changed_source(API_PATH)
FILES = changed_source(FILES_PATH)
WINDOW = changed_source(WINDOW_PATH)
FILE_READ_SETUP = function(FILES, 'static BlendFileReadWMSetupData *wm_file_read_setup_wm_init(')
WINDOW_CLOSE = function(WINDOW, 'void wm_window_close(')
EVENT_TYPES = changed_source('source/blender/windowmanager/wm_event_types.hh')
REGISTERED = function(WM, 'static bool wm_ipad_pencil_paint_handler_registered(')
OWNER_MATCH = function(WM, 'static bool wm_ipad_pencil_paint_modal_owner_matches(')
MODAL_ADMIT = function(WM, 'static eIPadPencilPaintModalAdmission wm_ipad_pencil_paint_modal_admit(')
OWNER_TEARDOWN = function(WM, 'void WM_event_ipad_pencil_paint_owner_teardown(')
SCENE_CHANGE = function(SCREEN, 'void ED_screen_scene_change(')
SCENE_CHANGE_PREFIX = SCENE_CHANGE[SCENE_CHANGE.index('{') + 1:SCENE_CHANGE.index('  /* Switch scene. */')]
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
#include <array>
#include <algorithm>
#include <cstdint>
#include <cstring>
#include <initializer_list>
struct bContext; struct wmWindow; struct wmWindowManager; struct ScrArea;
struct ARegion; struct wmOperator; struct wmEvent; struct wmEventHandler_Op; struct Scene;
struct ListBase { void *first=nullptr; };
struct ID { uint64_t session_uid=17; };
struct rcti { int xmin=10,ymin=20,xmax=110,ymax=120; };
struct ARegionRuntime { bool visible=true,ipad_canvas=true; };
struct ARegion { ARegion *next=nullptr; int regiontype=1,flag=0; ARegionRuntime *runtime=nullptr; rcti winrct; };
struct ScrArea { ScrArea *next=nullptr; ListBase regionbase; bool hidden=false; int spacetype=7; };
struct bScreen { ID id; ListBase areabase; };
struct wmEventHandler { int type=1,flag=0; wmEventHandler *next=nullptr; bool freed=false; };
struct wmWindow { wmWindow *next=nullptr; int runtime_data=1; void *runtime=nullptr; Scene *scene=nullptr;
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
    ipad_pencil_region=0,ipad_pencil_paint_serial=44,ipad_pencil_paint_generation=3;
  uint64_t ipad_pencil_owner_values[19]{}; char ipad_pencil_owner_tool[64]{};
  int ipad_pencil_paint_mode=8; wmOperator *op=nullptr; };
struct bContext { wmWindowManager *wm=nullptr; wmWindow *win=nullptr; bScreen *screen=nullptr;
  ScrArea *area=nullptr; ARegion *region=nullptr; void *py_context=nullptr,*py_context_orig=nullptr; };
struct bContext_PyState { void *py_context=nullptr,*py_context_orig=nullptr; };
struct MockPyContext { int cleared_window_members=0; };
struct Scene {};
Scene *g_expected_scene=nullptr; int g_cancel_old_scene_calls=0;
int g_context_copy_calls=0,g_context_free_calls=0;
struct IPadFingerPaintOwner { std::array<uint64_t,19> values{}; std::array<char,64> tool{}; };
struct PointerRNA {};
enum { WM_HANDLER_TYPE_OP=1,WM_HANDLER_DO_FREE=2,RGN_TYPE_WINDOW=3,OB_MODE_SCULPT=8,
  SPACE_VIEW3D=7,RGN_FLAG_HIDDEN=4,RGN_FLAG_TOO_SMALL=8,RGN_FLAG_POLL_FAILED=16,
  EVENT_NONE=100,LEFTMOUSE=101,KM_NOTHING=0,OPTYPE_UNDO=16,OPERATOR_CANCELLED=32,
  OPERATOR_FINISHED=64,OPERATOR_PASS_THROUGH=128,WM_HANDLER_CONTINUE=0,
  WM_HANDLER_BREAK=4,WM_HANDLER_HANDLED=8,NC_SPACE=1,ND_SPACE_INFO_REPORT=2 };
using wmOperatorStatus=int; using eHandlerActionFlag=int;
enum class eIPadPencilPaintModalAdmission : uint8_t { Dispatch,Consume,Cancel };
struct wmEvent_ModalMapStore { bool dbl_click_disabled=false; int prev_type=0,prev_val=0; };
struct wmOperatorReports { ListBase list; };
int g_cancel_calls=0,g_cancel_context_correct=0,g_locked_refusals=0;
uint64_t g_owner_values[19]{}; char g_owner_tool[64]{};
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
bScreen *CTX_wm_screen(bContext *C){return C?C->screen:nullptr;}
wmWindow *CTX_wm_window(bContext *C){return C?C->win:nullptr;}
wmWindowManager *CTX_wm_manager(bContext *C){return C?C->wm:nullptr;}
bContext *CTX_copy(const bContext *C){++g_context_copy_calls;return C?new bContext(*C):nullptr;}
void CTX_free(bContext *C){++g_context_free_calls;delete C;}
void CTX_py_state_push(bContext *C,bContext_PyState *state,void *value){state->py_context=C->py_context;state->py_context_orig=C->py_context_orig;C->py_context=C->py_context_orig=value;}
void CTX_wm_window_set(bContext *C,wmWindow *win){if(C->py_context)++static_cast<MockPyContext*>(C->py_context)->cleared_window_members;C->win=win;C->screen=win?win->screen:nullptr;C->area=nullptr;C->region=nullptr;}
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
  if(g_expected_scene&&C->win&&C->win->scene==g_expected_scene)++g_cancel_old_scene_calls;
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
enum class eIPadPencilPaintModalEvent : uint8_t { OwnedContact, StaleContact, Timer, Interrupt };
static eIPadPencilPaintModalEvent wm_ipad_pencil_paint_modal_event_classify(
 const wmEvent*,const wmEventHandler_Op*){return eIPadPencilPaintModalEvent::Interrupt;}
bool ED_ipad_finger_paint_capture(bContext*,IPadFingerPaintOwner &owner){
 std::copy(std::begin(g_owner_values),std::end(g_owner_values),owner.values.begin());
 std::copy(std::begin(g_owner_tool),std::end(g_owner_tool),owner.tool.begin());
 return g_owner_valid;
}
''' + REGISTERED + '\n' + OWNER_MATCH + '\n' + MODAL_ADMIT + '\n' + CALL_FIXTURE + '\n' + OWNER_TEARDOWN + '\n#define WITH_APPLE_CROSSPLATFORM\nvoid test_scene_change_prefix(bContext *C, wmWindow *win, Scene *scene) {\n' + SCENE_CHANGE_PREFIX + '\n  win->scene = scene;\n}\n#undef WITH_APPLE_CROSSPLATFORM\n' + r'''
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
    window.runtime=&window.runtime_data;window.screen=&screen;manager.windows.first=&window;
    replacement_window.runtime=&replacement_window.runtime_data;
    type.ipad_lifetime_id=29;type.modal=noop_modal;type.cancel=paint_cancel;type.flag=OPTYPE_UNDO;
    g_registered_type=&type;op.type=&type;op.ipad_lifetime=31;op.reports=&g_report_list;
    handler.head.type=WM_HANDLER_TYPE_OP;handler.context.win=&window;
    handler.context.area=&owner_area;handler.context.region=&owner_region;handler.op=&op;
    handler.ipad_pencil_operator_lifetime=31;handler.ipad_pencil_type_lifetime=29;
    handler.ipad_pencil_type_address=uintptr_t(&type);handler.ipad_pencil_screen_uid=17;
    handler.ipad_pencil_area=uintptr_t(&owner_area);handler.ipad_pencil_region=uintptr_t(&owner_region);
    handler.ipad_pencil_paint_mode=OB_MODE_SCULPT;handler.ipad_pencil_paint_serial=44;
    handler.ipad_pencil_owner_values[5]=17;handler.ipad_pencil_owner_values[9]=OB_MODE_SCULPT;
    handler.ipad_pencil_owner_values[17]=81;handler.ipad_pencil_owner_values[18]=82;
    std::copy_n("builtin_brush.Draw", sizeof("builtin_brush.Draw"),
                handler.ipad_pencil_owner_tool);
    std::copy(std::begin(handler.ipad_pencil_owner_values),std::end(handler.ipad_pencil_owner_values),
              std::begin(g_owner_values));
    std::copy(std::begin(handler.ipad_pencil_owner_tool),
              std::end(handler.ipad_pencil_owner_tool),std::begin(g_owner_tool));
    window.modalhandlers.first=&handler.head;
    C.wm=&manager;C.win=&window;C.screen=&screen;C.area=&outside_area;C.region=&outside_region;
    g_owner_area=&owner_area;g_owner_region=&owner_region;g_replacement_window=&replacement_window;
    g_replacement_manager=&replacement_manager;g_retired_window=&window;
  }
};
void reset_globals(){
  g_cancel_calls=g_cancel_context_correct=g_locked_refusals=0;
  g_operator_frees=g_handler_frees=g_unlinks=g_report_calls=g_cursor_disables=0;
  g_handler_context_calls=g_modal_calls=g_stale_list_reads=g_list_reads=0;
  g_interface_unlocked=false;g_owner_valid=true;g_replace_context=false;g_context_replaced=false;
  g_retired_list=nullptr;g_owner_area=nullptr;g_owner_region=nullptr;
  g_replacement_window=nullptr;g_replacement_manager=nullptr;g_registered_type=nullptr;
  g_report_list.list.first=nullptr;std::fill(std::begin(g_owner_values),std::end(g_owner_values),0);g_owner_tool[0]='\0';
  g_expected_scene=nullptr;g_cancel_old_scene_calls=0;g_context_copy_calls=g_context_free_calls=0;
}
void assert_normal_area_or_region_teardown(
  bool by_region,int invalid_presentation_flags=0,bool invalidate_canvas=false){
  Fixture f;ScrArea *previous_area=f.C.area;ARegion *previous_region=f.C.region;
  if(invalid_presentation_flags||invalidate_canvas){
    f.owner_region.flag=invalid_presentation_flags;
    f.runtime.ipad_canvas=!invalidate_canvas;
    wmEvent ordinary_event;ordinary_event.type=EVENT_NONE;
    CTX_wm_area_set(&f.C,&f.owner_area);CTX_wm_region_set(&f.C,&f.owner_region);
    assert(wm_ipad_pencil_paint_modal_admit(
      &f.C,&f.window,&ordinary_event,&f.handler)==eIPadPencilPaintModalAdmission::Consume);
    CTX_wm_area_set(&f.C,&f.outside_area);CTX_wm_region_set(&f.C,&f.outside_region);
  }
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
  /* Resize/hidden layout may invalidate canvas drawing before the exit hook runs.
   * Normal admission refuses it; explicit live-owner teardown still cancels safely. */
  for(int flag : {RGN_FLAG_HIDDEN,RGN_FLAG_TOO_SMALL,RGN_FLAG_POLL_FAILED}){
    assert_normal_area_or_region_teardown(false,flag);
    assert_normal_area_or_region_teardown(true,flag);
  }
  assert_normal_area_or_region_teardown(false,0,true);
  assert_normal_area_or_region_teardown(true,0,true);
  {
    /* wm_window_close unlinks a live window before it runs the owner hook. */
    Fixture f;wmWindow remaining_window{};
    f.manager.windows.first=&remaining_window;
    WM_event_ipad_pencil_paint_owner_teardown(&f.C,&f.window,nullptr,nullptr);
    assert(g_cancel_calls==1&&g_cancel_context_correct==1&&g_modal_calls==0);
    assert(g_operator_frees==1&&g_handler_frees==1&&g_unlinks==1);
    assert(f.window.modalhandlers.first==nullptr&&f.handler.head.freed);
  }
  {
    Fixture f;ScrArea *pa=f.C.area;ARegion *pr=f.C.region;g_owner_valid=false;
    f.owner_region.flag=RGN_FLAG_TOO_SMALL;f.runtime.ipad_canvas=false;
    WM_event_ipad_pencil_paint_owner_teardown(&f.C,&f.window,&f.owner_area,nullptr);
    assert(g_cancel_calls==0&&g_operator_frees==0&&g_handler_frees==0);
    assert(f.window.modalhandlers.first==&f.handler.head&&f.handler.op==&f.op);
    assert(f.C.area==pa&&f.C.region==pr);
  }
  {
    Fixture f;ScrArea *pa=f.C.area;ARegion *pr=f.C.region;
    f.owner_region.runtime=nullptr;
    WM_event_ipad_pencil_paint_owner_teardown(&f.C,&f.window,nullptr,&f.owner_region);
    assert(g_cancel_calls==0&&g_operator_frees==0&&g_handler_frees==0);
    assert(f.C.area==pa&&f.C.region==pr);
  }
  {
    Fixture f;ScrArea *pa=f.C.area;ARegion *pr=f.C.region;
    f.runtime.visible=false;
    WM_event_ipad_pencil_paint_owner_teardown(&f.C,&f.window,nullptr,&f.owner_region);
    assert(g_cancel_calls==0&&g_operator_frees==0&&g_handler_frees==0);
    assert(f.window.modalhandlers.first==&f.handler.head&&f.handler.op==&f.op);
    assert(f.C.area==pa&&f.C.region==pr);
  }
  {
    Fixture f;ScrArea *pa=f.C.area;ARegion *pr=f.C.region;
    wmEventHandler_Op unrelated{};
    unrelated.head.type=WM_HANDLER_TYPE_OP;
    unrelated.ipad_pencil_paint_serial=0;
    unrelated.head.next=&f.handler.head;
    f.window.modalhandlers.first=&unrelated.head;
    WM_event_ipad_pencil_paint_owner_teardown(&f.C,&f.window,nullptr,nullptr);
    assert(g_cancel_calls==1&&g_cancel_context_correct==1&&g_modal_calls==0);
    assert(g_operator_frees==1&&g_handler_frees==1&&g_unlinks==1);
    assert(f.window.modalhandlers.first==&unrelated.head&&unrelated.head.next==nullptr);
    assert(!unrelated.head.freed&&unrelated.op==nullptr);
    assert(f.handler.op==nullptr&&f.handler.head.freed);
    assert(f.C.area==pa&&f.C.region==pr);
  }
  {
    Fixture f;wmEvent event;event.type=LEFTMOUSE;g_interface_unlocked=false;
    wm_handler_operator_call(&f.C,&f.window.modalhandlers,&f.handler.head,&event,nullptr,nullptr,true);
    assert(g_locked_refusals==1&&g_cancel_calls==0);
    event.type=EVENT_NONE;f.handler.ipad_pencil_paint_serial=0;
    wm_handler_operator_call(&f.C,&f.window.modalhandlers,&f.handler.head,&event,nullptr,nullptr,true);
    assert(g_locked_refusals==2&&g_cancel_calls==0);
  }
  {
    Fixture f;Scene original_scene{},new_scene{},child_scene{};bScreen child_screen{};
    ScrArea child_area{};ARegion child_region{};wmWindow child_window{};MockPyContext copied_python{},python_original{};
    f.window.scene=&original_scene;g_expected_scene=&original_scene;
    child_window.runtime=&child_window.runtime_data;child_window.scene=&child_scene;
    child_window.screen=&child_screen;f.window.next=&child_window;
    child_region.regiontype=RGN_TYPE_WINDOW;child_area.regionbase.first=&child_region;
    child_screen.areabase.first=&child_area;
    f.manager.windows.first=&f.window;f.C.win=&child_window;f.C.screen=&child_screen;
    f.C.area=&child_area;f.C.region=&child_region;
    f.C.py_context=&copied_python;f.C.py_context_orig=&python_original;
    test_scene_change_prefix(&f.C,&f.window,&new_scene);
    assert(g_cancel_calls==1&&g_cancel_old_scene_calls==1&&g_cancel_context_correct==1);
    assert(f.window.scene==&new_scene&&f.window.modalhandlers.first==nullptr);
    assert(f.C.win==&child_window&&f.C.screen==&child_screen&&f.C.area==&child_area&&f.C.region==&child_region);
    assert(g_context_copy_calls==1&&g_context_free_calls==1);
    assert(copied_python.cleared_window_members==0&&python_original.cleared_window_members==0);
    assert(f.C.py_context==&copied_python&&f.C.py_context_orig==&python_original);
  }
  {
    Fixture f;Scene same_scene{};f.window.scene=&same_scene;g_expected_scene=&same_scene;
    test_scene_change_prefix(&f.C,&f.window,&same_scene);
    assert(g_cancel_calls==0&&f.window.scene==&same_scene);
    assert(f.window.modalhandlers.first==&f.handler.head);
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
        self.assertIn('const bool teardown', MODAL_ADMIT)
        self.assertIn('if (!teardown &&', OWNER_MATCH)
        self.assertIn('candidate, true)', OWNER_TEARDOWN)
        self.assertNotIn('EVT_NONE', OWNER_TEARDOWN)

    def test_file_load_and_window_close_retire_owner_before_modal_handler_removal(self):
        owner_teardown = 'WM_event_ipad_pencil_paint_owner_teardown(C, win, nullptr, nullptr);'
        remove_modal = 'WM_event_remove_handlers(C, &win->modalhandlers);'
        self.assertLess(FILE_READ_SETUP.index('CTX_wm_window_set(C, win);'), FILE_READ_SETUP.index(owner_teardown))
        self.assertLess(FILE_READ_SETUP.index(owner_teardown), FILE_READ_SETUP.index('WM_event_remove_handlers(C, &win->handlers)'))
        self.assertLess(FILE_READ_SETUP.index(owner_teardown), FILE_READ_SETUP.index(remove_modal))
        self.assertLess(WINDOW_CLOSE.index('BLI_remlink(&wm->windows, win);'), WINDOW_CLOSE.index(owner_teardown))
        self.assertLess(WINDOW_CLOSE.index('CTX_wm_window_set(C, win);'), WINDOW_CLOSE.index(owner_teardown))
        self.assertLess(WINDOW_CLOSE.index(owner_teardown), WINDOW_CLOSE.index('WM_event_remove_handlers(C, &win->handlers)'))
        self.assertLess(WINDOW_CLOSE.index(owner_teardown), WINDOW_CLOSE.index(remove_modal))
        self.assertIn('if (!C || !win || !win->runtime)', OWNER_TEARDOWN)
        self.assertIn('owner_context_copy = CTX_copy(C)', OWNER_TEARDOWN)
        self.assertIn('CTX_py_state_push(owner_context_copy, &owner_context_python_state, nullptr)', OWNER_TEARDOWN)

    def test_scene_change_cancels_before_mutating_native_owner(self):
        hook = 'WM_event_ipad_pencil_paint_owner_teardown(C, win, nullptr, nullptr);'
        self.assertLess(SCENE_CHANGE.index(hook), SCENE_CHANGE.index('win->scene = scene;'))
        self.assertIn('if (win->scene != scene)', SCENE_CHANGE)
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(CPP_FIXTURE)

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
