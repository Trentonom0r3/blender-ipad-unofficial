"""Execute connected Pencil paint lease and pre-dispatch policy against WM source."""
import re
import unittest
from test_touch_extrude import changed_source
from test_compact_shelf import function
from test_finger_brush_admission import CPP
import test_ipad_panels

WM = changed_source('source/blender/windowmanager/intern/wm_event_system.cc')
OWNER_MATCH = function(WM, 'static bool wm_ipad_pencil_paint_modal_owner_matches(')
REGISTERED = function(WM, 'static bool wm_ipad_pencil_paint_handler_registered(')
OPERATOR_CALL = function(WM, 'static eHandlerActionFlag wm_handler_operator_call(')
EVENT_MATCH = function(WM, 'static bool wm_ipad_pencil_paint_event_matches_handler(')
CLASSIFY = function(WM, 'static eIPadPencilPaintModalEvent wm_ipad_pencil_paint_modal_event_classify(')
ADMIT = function(WM, 'static eIPadPencilPaintModalAdmission wm_ipad_pencil_paint_modal_admit(')
PRE_DISPATCH = function(WM, 'static eIPadPencilPaintPreDispatch wm_ipad_pencil_paint_modal_pre_dispatch(')
ROUTER = function(WM, 'void wm_event_do_handlers(')
EVENT_ENUMS = '\n'.join(line for line in WM.splitlines()
    if line.startswith('enum class eIPadPencilPaintModalEvent') or
       line.startswith('enum class eIPadPencilPaintModalAdmission') or
       line.startswith('enum class eIPadPencilPaintPreDispatch'))
ROUTE_START = ROUTER.index("      /* First we do priority handlers, modal + some limited key-maps. */")
ROUTE_END = ROUTER.index("\n      /* File-read case. */", ROUTE_START)
ROUTE_BLOCK = ROUTER[ROUTE_START:ROUTE_END]
CANCELLED_CONTACT_MARK = function(
    WM, 'static void wm_ipad_pencil_paint_cancelled_contact_mark(')
CANCELLED_CONTACT_CONSUME = function(
    WM, 'static bool wm_ipad_pencil_paint_cancelled_contact_consume(')


def cpp_block(source, marker, occurrence=0):
    """Extract one balanced C++ block from the pinned native function text."""
    starts = [match.start() for match in re.finditer(re.escape(marker), source)]
    if occurrence >= len(starts):
        raise AssertionError(f"missing C++ block {marker!r} occurrence {occurrence}")
    start = starts[occurrence]
    opening = source.find("{", start)
    if opening < 0:
        raise AssertionError(f"missing block opener for {marker!r}")
    depth = 0
    for index in range(opening, len(source)):
        if source[index] == "{":
            depth += 1
        elif source[index] == "}":
            depth -= 1
            if depth == 0:
                return source[start:index + 1]
    raise AssertionError(f"unterminated C++ block {marker!r}")


CANCELLED_CONTACT_EARLY_BLOCK = cpp_block(
    ROUTER, 'if (wm_ipad_pencil_paint_cancelled_contact_consume(win, event))')

QUEUE_CAPTURE = cpp_block(WM, "if (any_contact_value) {")
GHOST_EVENT = function(WM, 'void wm_event_add_ghostevent(')


NATIVE_UNDO_BEGIN = cpp_block(OPERATOR_CALL, "if (ot->flag & OPTYPE_UNDO) {")
NATIVE_INTERRUPT = cpp_block(OPERATOR_CALL, "if (ipad_pencil_paint_interrupt) {")
NATIVE_UNDO_END = cpp_block(
    OPERATOR_CALL, "if (ot->flag & OPTYPE_UNDO && CTX_wm_manager(C) == wm) {")
NATIVE_CANCEL_REPORTS = cpp_block(
    OPERATOR_CALL, "if (retval & (OPERATOR_CANCELLED | OPERATOR_FINISHED)) {")
NATIVE_OPERATOR_RELEASE = cpp_block(
    OPERATOR_CALL, "else if (retval & (OPERATOR_CANCELLED | OPERATOR_FINISHED)) {")
NATIVE_HANDLER_REMOVE = cpp_block(
    OPERATOR_CALL, "if (retval & (OPERATOR_CANCELLED | OPERATOR_FINISHED)) {", occurrence=2)

NATIVE_HANDLER_CALL_FIXTURE = r"""
int wm_handler_operator_call(bContext *C, ListBase *handlers, wmEventHandler *base,
                             wmEvent *event, PointerRNA *, const char *)
{
  auto *handler = reinterpret_cast<wmEventHandler_Op *>(base);
  wmWindowManager *wm = CTX_wm_manager(C);
  wmWindow *win = CTX_wm_window(C);
  ScrArea *area = CTX_wm_area(C);
  ARegion *region = CTX_wm_region(C);
  wm_handler_op_context(C, handler, event);
  wmOperator *op = handler->op;
  wmOperatorType *ot = op->type;
  const bool ipad_pencil_paint_interrupt = true;
  int retval = OPERATOR_PASS_THROUGH;
""" + NATIVE_UNDO_BEGIN + r"""
""" + NATIVE_INTERRUPT + r"""
""" + NATIVE_UNDO_END + r"""
  if (CTX_wm_window(C) == win) {
""" + NATIVE_CANCEL_REPORTS + r"""
    if (retval & OPERATOR_FINISHED) {
    }
""" + NATIVE_OPERATOR_RELEASE + r"""
    if (retval & OPERATOR_PASS_THROUGH) {
      CTX_wm_area_set(C, area);
      CTX_wm_region_set(C, region);
    }
""" + NATIVE_HANDLER_REMOVE + r"""
  }
  CTX_wm_area_set(C, area);
  CTX_wm_region_set(C, region);
  return WM_HANDLER_CONTINUE;
}
"""


class PencilPaintContactLeaseTests(unittest.TestCase):
    def run_cpp(self, source):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(CPP + source)

    def test_actual_registered_handler_refuses_region_runtime_teardown(self):
        self.run_cpp(r"""
enum { WM_HANDLER_TYPE_OP=1, WM_HANDLER_DO_FREE=2, RGN_TYPE_WINDOW=3,
       OB_MODE_SCULPT=8 };
struct ID { uint64_t session_uid=17; };
struct ARegionRuntime { bool visible=true; };
struct ARegion { int regiontype=RGN_TYPE_WINDOW; ARegionRuntime *runtime; };
struct ScrArea { List<ARegion> regionbase; };
struct bScreen { ID id; List<ScrArea> areabase; };
using OperatorCallback=void(*)();
void noop_operator_callback() {}
struct wmOperatorType { uint64_t ipad_lifetime_id=29;
  OperatorCallback modal=noop_operator_callback, cancel=noop_operator_callback; };
struct wmOperator { wmOperatorType *type; wmOperator *opm=nullptr; };
struct wmWindow;
struct wmEventHandler { int type=WM_HANDLER_TYPE_OP, flag=0; };
struct wmEventHandler_Op {
  wmEventHandler head; bool is_fileselect=false;
  struct { wmWindow *win=nullptr; } context;
  uint64_t ipad_pencil_operator_lifetime=31, ipad_pencil_type_lifetime=29,
           ipad_pencil_type_address=0, ipad_pencil_screen_uid=17,
           ipad_pencil_area=0, ipad_pencil_region=0;
  int ipad_pencil_paint_mode=OB_MODE_SCULPT;
  wmOperator *op=nullptr;
};
int BLI_findindex(const List<wmEventHandler> *handlers,const wmEventHandler *handler) {
  const auto found=std::find(handlers->items.cbegin(),handlers->items.cend(),handler);
  return found==handlers->items.cend() ? -1 : int(found-handlers->items.cbegin());
}
struct wmWindow { int runtime_value=1; void *runtime=&runtime_value;
  List<wmEventHandler> modalhandlers; bScreen *screen=nullptr; };
wmOperatorType registered_type;
wmOperatorType *WM_operatortype_find(const char *idname, bool) {
  return idname && std::strcmp(idname,"SCULPT_OT_brush_stroke")==0 ? &registered_type : nullptr;
}
const char *wm_ipad_pencil_paint_operator_id(int mode) {
  return mode==OB_MODE_SCULPT ? "SCULPT_OT_brush_stroke" : nullptr;
}
bool WM_operator_touch_lifetime_matches(const wmOperator *op,uint64_t identity) {
  return op && identity==31;
}
bScreen *WM_window_get_active_screen(wmWindow *win){return win->screen;}
"""+REGISTERED+r"""
int main(){
  bScreen screen; ScrArea area; ARegionRuntime runtime;
  ARegion region{RGN_TYPE_WINDOW,&runtime}; area.regionbase.add(&region);
  screen.areabase.add(&area); wmWindow win; win.screen=&screen;
  wmOperator op{&registered_type}; wmEventHandler_Op handler; handler.op=&op;
  handler.ipad_pencil_type_address=uintptr_t(&registered_type);
  handler.ipad_pencil_area=uintptr_t(&area); handler.ipad_pencil_region=uintptr_t(&region);
  win.modalhandlers.add(&handler.head);
  assert(wm_ipad_pencil_paint_handler_registered(&win,&handler));
  region.runtime=nullptr;
  assert(!wm_ipad_pencil_paint_handler_registered(&win,&handler));
  runtime.visible=false; region.runtime=&runtime;
  assert(!wm_ipad_pencil_paint_handler_registered(&win,&handler));
}
""")

    def test_actual_contact_queue_matches_pinned_runtime_and_event_schema(self):
        source = r"""
#include <algorithm>
#include <cstdint>
enum { GHOST_kEventCursorMove=1, GHOST_kEventButtonDown=2, GHOST_kEventButtonUp=3,
       GHOST_kButtonMaskLeft=1, WM_PENCIL_PAINT_PHASE_PREPRESS=0,
       WM_PENCIL_PAINT_PHASE_BEGIN=1, WM_PENCIL_PAINT_PHASE_MOTION=2,
       WM_PENCIL_PAINT_PHASE_END=3 };
namespace ghost::ios {
struct PencilPaintContact {uint64_t serial,generation;uintptr_t region;int32_t origin_x,origin_y;};
bool ticket_valid=true;
bool pencil_paint_ticket_live(void*,const PencilPaintContact &contact) {
  return ticket_valid&&contact.serial==44&&contact.generation==7&&contact.region==12&&
         contact.origin_x==100&&contact.origin_y==200;
}
}
struct GHOST_TEventCursorData {uint64_t ipad_pencil_paint_serial,ipad_pencil_paint_generation;
  uintptr_t ipad_pencil_paint_region;int32_t ipad_pencil_paint_origin_x,ipad_pencil_paint_origin_y;};
struct GHOST_TEventButtonData {uint64_t ipad_pencil_paint_serial,ipad_pencil_paint_generation;
  uintptr_t ipad_pencil_paint_region;int32_t ipad_pencil_paint_origin_x,ipad_pencil_paint_origin_y;int button;};
struct WindowRuntimeHandle {uint64_t ipad_pencil_paint_queued_serial=0,ipad_pencil_paint_queued_generation=0,
  ipad_pencil_paint_retired_serial=0,ipad_pencil_paint_cancelled_serial=0,
  ipad_pencil_paint_cancelled_generation=0;uintptr_t ipad_pencil_paint_queued_region=0;
  int32_t ipad_pencil_paint_queued_origin_xy[2]{};bool ipad_pencil_paint_queued_down=false;};
struct GHOST_IWindow {};
struct wmWindow {WindowRuntimeHandle *runtime;GHOST_IWindow *ghostwin;};
struct wmEventHandler_Op {uint64_t ipad_pencil_paint_serial=0,ipad_pencil_paint_generation=0;};
""" + CANCELLED_CONTACT_MARK + r"""
bool dispatch_down=false,tagged=false;uint8_t dispatch_phase=0;int ghost_shared_state_updates=0;
void queue_contact(const int type,const uint64_t serial,const uint64_t generation,
                   const uintptr_t region,const int32_t origin_x,const int32_t origin_y,
                   const int button,wmWindow *win) {
  const bool any_contact_value = serial || generation || region || origin_x || origin_y;
  ghost::ios::PencilPaintContact ipad_pencil_contact{};
  bool ipad_pencil_dispatch_down=false,ipad_pencil_tagged=false;
  uint8_t ipad_pencil_dispatch_phase=WM_PENCIL_PAINT_PHASE_PREPRESS;
""" + QUEUE_CAPTURE + r"""
  ++ghost_shared_state_updates; // The native event-state update follows admission.
  dispatch_down=ipad_pencil_dispatch_down;
  dispatch_phase=ipad_pencil_dispatch_phase;
  tagged=ipad_pencil_tagged;
}
int main(){WindowRuntimeHandle runtime;GHOST_IWindow ghostwin;wmWindow win{&runtime,&ghostwin};
  queue_contact(GHOST_kEventCursorMove,44,7,12,100,200,0,&win);
  assert(runtime.ipad_pencil_paint_queued_serial==44&&!runtime.ipad_pencil_paint_queued_down);
  assert(tagged&&dispatch_phase==WM_PENCIL_PAINT_PHASE_PREPRESS&&!dispatch_down);
  queue_contact(GHOST_kEventCursorMove,45,7,12,100,200,0,&win);
  assert(runtime.ipad_pencil_paint_queued_serial==44&&!runtime.ipad_pencil_paint_queued_down);
  queue_contact(GHOST_kEventButtonDown,44,7,12,100,200,GHOST_kButtonMaskLeft,&win);
  assert(runtime.ipad_pencil_paint_queued_serial==44&&runtime.ipad_pencil_paint_queued_down);
  assert(dispatch_down&&dispatch_phase==WM_PENCIL_PAINT_PHASE_BEGIN);
  queue_contact(GHOST_kEventCursorMove,44,7,12,100,200,0,&win);
  assert(dispatch_down&&dispatch_phase==WM_PENCIL_PAINT_PHASE_MOTION);
  queue_contact(GHOST_kEventButtonUp,44,7,12,100,200,GHOST_kButtonMaskLeft,&win);
  assert(dispatch_down&&dispatch_phase==WM_PENCIL_PAINT_PHASE_END);
  assert(runtime.ipad_pencil_paint_retired_serial==44&&!runtime.ipad_pencil_paint_queued_serial&&
         !runtime.ipad_pencil_paint_queued_down);
  queue_contact(GHOST_kEventCursorMove,44,7,12,100,200,0,&win);
  assert(!runtime.ipad_pencil_paint_queued_serial);
  runtime.ipad_pencil_paint_queued_serial=45;
  runtime.ipad_pencil_paint_queued_generation=8;
  runtime.ipad_pencil_paint_queued_region=12;
  runtime.ipad_pencil_paint_queued_origin_xy[0]=100;
  runtime.ipad_pencil_paint_queued_origin_xy[1]=200;
  runtime.ipad_pencil_paint_queued_down=true;
  wmEventHandler_Op cancelled_handler{45,8};
  wm_ipad_pencil_paint_cancelled_contact_mark(&win,&cancelled_handler);
  const int before_cancelled_tail=ghost_shared_state_updates;
  queue_contact(GHOST_kEventCursorMove,45,8,12,100,200,0,&win);
  assert(ghost_shared_state_updates==before_cancelled_tail&&runtime.ipad_pencil_paint_queued_down);
  queue_contact(GHOST_kEventButtonDown,45,8,12,100,200,GHOST_kButtonMaskLeft,&win);
  assert(ghost_shared_state_updates==before_cancelled_tail&&runtime.ipad_pencil_paint_cancelled_serial==45);
  queue_contact(GHOST_kEventButtonUp,45,8,12,100,200,GHOST_kButtonMaskLeft,&win);
  assert(ghost_shared_state_updates==before_cancelled_tail&&runtime.ipad_pencil_paint_retired_serial==45);
  assert(!runtime.ipad_pencil_paint_cancelled_serial&&!runtime.ipad_pencil_paint_cancelled_generation&&
         !runtime.ipad_pencil_paint_queued_serial&&!runtime.ipad_pencil_paint_queued_down);
  queue_contact(GHOST_kEventCursorMove,45,8,12,100,200,0,&win);
  assert(ghost_shared_state_updates==before_cancelled_tail);
  for(uint64_t serial=100;serial<10100;++serial) {
    const uint64_t generation=serial+900;
    runtime.ipad_pencil_paint_queued_serial=serial;
    runtime.ipad_pencil_paint_queued_generation=generation;
    runtime.ipad_pencil_paint_queued_region=12;
    runtime.ipad_pencil_paint_queued_origin_xy[0]=100;
    runtime.ipad_pencil_paint_queued_origin_xy[1]=200;
    runtime.ipad_pencil_paint_queued_down=true;
    cancelled_handler.ipad_pencil_paint_serial=serial;
    cancelled_handler.ipad_pencil_paint_generation=generation;
    wm_ipad_pencil_paint_cancelled_contact_mark(&win,&cancelled_handler);
    const int before_cycle=ghost_shared_state_updates;
    queue_contact(GHOST_kEventCursorMove,serial,generation,12,100,200,0,&win);
    queue_contact(GHOST_kEventButtonDown,serial,generation,12,100,200,GHOST_kButtonMaskLeft,&win);
    queue_contact(GHOST_kEventButtonUp,serial,generation,12,100,200,GHOST_kButtonMaskLeft,&win);
    queue_contact(GHOST_kEventCursorMove,serial,generation,12,100,200,0,&win);
    assert(ghost_shared_state_updates==before_cycle&&runtime.ipad_pencil_paint_retired_serial==serial);
    assert(!runtime.ipad_pencil_paint_cancelled_serial&&!runtime.ipad_pencil_paint_queued_serial);
  }
  dispatch_down=false;tagged=false;queue_contact(GHOST_kEventCursorMove,44,7,12,100,200,0,nullptr);
  assert(!tagged&&!dispatch_down);
}
"""
        state_updates = [match.start() for match in re.finditer(
            re.escape('wm_event_state_update_and_click_set(&event,'), GHOST_EVENT)]
        cancelled_guard = GHOST_EVENT.index('runtime->ipad_pencil_paint_cancelled_serial == serial')
        self.assertEqual(len(state_updates), 3)
        self.assertTrue(all(cancelled_guard < state_update for state_update in state_updates))
        self.run_cpp(source)

    def test_actual_owner_match_accepts_redraws_but_refuses_live_owner_changes(self):
        self.run_cpp(r"""
enum { SPACE_VIEW3D=1, RGN_TYPE_WINDOW=2, RGN_FLAG_HIDDEN=1, RGN_FLAG_TOO_SMALL=2,
       RGN_FLAG_POLL_FAILED=4, OB_MODE_SCULPT=8 };
struct ID { uint64_t session_uid=31; };
struct ARegionRuntime { bool visible=true, ipad_canvas=true; };
struct ARegion { int regiontype=RGN_TYPE_WINDOW, flag=0; ARegionRuntime *runtime; };
struct ScrArea { int spacetype=SPACE_VIEW3D; List<ARegion> regionbase; };
struct bScreen { ID id; List<ScrArea> areabase; };
struct wmWindow { bScreen *screen; };
struct IPadFingerPaintOwner { std::array<uint64_t,19> values{}; std::array<char,64> tool{}; bool valid=false; };
struct OpContext { ScrArea *area; ARegion *region; };
struct wmEventHandler_Op {
  OpContext context; uint64_t ipad_pencil_screen_uid=31, ipad_pencil_area=0, ipad_pencil_region=0;
  int ipad_pencil_paint_mode=OB_MODE_SCULPT; uint64_t ipad_pencil_paint_generation=7;
  uint64_t ipad_pencil_owner_values[19]{}; char ipad_pencil_owner_tool[64]{};
};
struct bContext { wmWindow *win; bScreen *screen; ScrArea *area; ARegion *region; IPadFingerPaintOwner owner; bool capture_valid=true; };
wmWindow *CTX_wm_window(bContext *C){return C->win;} bScreen *CTX_wm_screen(bContext *C){return C->screen;}
ScrArea *CTX_wm_area(bContext *C){return C->area;} ARegion *CTX_wm_region(bContext *C){return C->region;}
bScreen *WM_window_get_active_screen(wmWindow *w){return w->screen;}
bool ED_ipad_finger_paint_capture(bContext *C,IPadFingerPaintOwner &out){out=C->owner;return C->capture_valid&&out.valid;}
"""+OWNER_MATCH+r"""
int main(){
  bScreen screen; ScrArea area; ARegionRuntime rr; ARegion region{RGN_TYPE_WINDOW,0,&rr};
  area.regionbase.add(&region); screen.areabase.add(&area); wmWindow win{&screen};
  IPadFingerPaintOwner owner; owner.valid=true; owner.values[9]=OB_MODE_SCULPT;
  owner.values[2]=17; owner.values[4]=18; owner.values[17]=23; owner.values[18]=24;
  std::strcpy(owner.tool.data(),"builtin_brush.Draw");
  bContext C{&win,&screen,&area,&region,owner,true};
  wmEventHandler_Op h{}; h.context={&area,&region}; h.ipad_pencil_area=uintptr_t(&area);
  h.ipad_pencil_region=uintptr_t(&region); h.ipad_pencil_owner_values[9]=OB_MODE_SCULPT;
  h.ipad_pencil_owner_values[2]=17; h.ipad_pencil_owner_values[4]=18;
  h.ipad_pencil_owner_values[17]=23; h.ipad_pencil_owner_values[18]=24;
  std::strcpy(h.ipad_pencil_owner_tool,"builtin_brush.Draw");
  assert(wm_ipad_pencil_paint_modal_owner_matches(&C,&win,&h,false));
  for(uint64_t presented=8;presented<10008;++presented) {
    h.ipad_pencil_paint_generation=7;
    assert(wm_ipad_pencil_paint_modal_owner_matches(&C,&win,&h,false));
  }
  C.owner.values[17]++; assert(!wm_ipad_pencil_paint_modal_owner_matches(&C,&win,&h,false)); C.owner.values[17]--;
  C.owner.values[18]++; assert(!wm_ipad_pencil_paint_modal_owner_matches(&C,&win,&h,false)); C.owner.values[18]--;
  C.owner.values[9]=99; assert(!wm_ipad_pencil_paint_modal_owner_matches(&C,&win,&h,false)); C.owner.values[9]=OB_MODE_SCULPT;
  C.owner.values[0]++; assert(!wm_ipad_pencil_paint_modal_owner_matches(&C,&win,&h,false)); C.owner.values[0]--;
  C.owner.values[16]++; assert(wm_ipad_pencil_paint_modal_owner_matches(&C,&win,&h,false)); C.owner.values[16]--;
  C.owner.tool[0]='x'; assert(!wm_ipad_pencil_paint_modal_owner_matches(&C,&win,&h,false)); C.owner.tool[0]='b';
  rr.visible=false; assert(!wm_ipad_pencil_paint_modal_owner_matches(&C,&win,&h,false)); rr.visible=true;
  rr.ipad_canvas=false; assert(!wm_ipad_pencil_paint_modal_owner_matches(&C,&win,&h,false)); rr.ipad_canvas=true;
  region.flag=RGN_FLAG_HIDDEN; assert(!wm_ipad_pencil_paint_modal_owner_matches(&C,&win,&h,false)); region.flag=0;
  ++screen.id.session_uid; assert(!wm_ipad_pencil_paint_modal_owner_matches(&C,&win,&h,false)); --screen.id.session_uid;
  ScrArea other; C.area=&other; assert(!wm_ipad_pencil_paint_modal_owner_matches(&C,&win,&h,false)); C.area=&area;
  ARegion other_region{RGN_TYPE_WINDOW,0,&rr}; C.region=&other_region;
  assert(!wm_ipad_pencil_paint_modal_owner_matches(&C,&win,&h,false)); C.region=&region;
  C.capture_valid=false; assert(!wm_ipad_pencil_paint_modal_owner_matches(&C,&win,&h,false));
}
""")

    def test_actual_modal_classifier_and_ring_pre_dispatch_cancel_exact_owner(self):
        prelude = r"""
enum { WM_HANDLER_TYPE_OP=1, TIMER=2, PENCIL_RING_INPUT=99,
       WM_PENCIL_PAINT_PHASE_BEGIN=1, WM_PENCIL_PAINT_PHASE_MOTION=2,
       WM_PENCIL_PAINT_PHASE_END=3, OPTYPE_UNDO=16,
       OPERATOR_CANCELLED=32, OPERATOR_FINISHED=64, OPERATOR_PASS_THROUGH=128 };
#define ISTIMER(t) ((t)==TIMER)
struct ScrArea {};
struct ARegion {};
struct wmEventHandler { int type=0; wmEventHandler *next=nullptr; bool freed=false; };
struct wmOperatorType;
struct wmOperator;
struct wmEvent {
  int type=1, ipad_pencil_paint_phase=WM_PENCIL_PAINT_PHASE_END;
  bool ipad_pencil_paint_down=true;
  uint64_t ipad_pencil_paint_serial=44, ipad_pencil_paint_generation=7,
           ipad_pencil_paint_region=12;
  int ipad_pencil_paint_origin_xy[2]{100,200};
};
struct wmEventHandler_Op {
  wmEventHandler head;
  uint64_t ipad_pencil_paint_serial=44, ipad_pencil_paint_generation=7,
           ipad_pencil_region=12;
  int32_t ipad_pencil_origin_x=100, ipad_pencil_origin_y=200;
  ScrArea *area=nullptr; ARegion *region=nullptr; wmOperator *op=nullptr;
  bool registered=true;
};
struct ListBase { wmEventHandler *first=nullptr; };
struct wmWindow { ListBase modalhandlers; };
struct wmWindowManager { int op_undo_depth=0; };
struct bContext { wmWindow *win=nullptr; ScrArea *area=nullptr; ARegion *region=nullptr;
  wmWindowManager *manager=nullptr; bool owner_matches=true; };
using wmOperatorStatus = int;
struct wmOperatorType { void (*cancel)(bContext*,wmOperator*)=nullptr;
  int flag=OPTYPE_UNDO; bool modalkeymap=false; };
struct wmOperator { wmOperatorType *type=nullptr; wmOperator *opm=nullptr; bool freed=false; };
struct PointerRNA {};
enum { WM_HANDLER_CONTINUE=0 };
template<class... T> bool ELEM(int v,T...a){return ((v==a)||...);}
#undef LISTBASE_FOREACH_MUTABLE
#define LISTBASE_FOREACH_MUTABLE(type,var,list) \
  for(struct { type current; type next; } var##_state{ \
          (type)(list)->first, (list)->first ? (type)(list)->first->next : nullptr}; \
      var##_state.current; \
      var##_state.current=var##_state.next, \
      var##_state.next=var##_state.current ? (type)var##_state.current->next : nullptr) \
    for(type var=var##_state.current; var; var=nullptr)
int BLI_findindex(const ListBase *list,const wmEventHandler *target) {
  int index=0; for(wmEventHandler *item=list->first;item;item=item->next,++index) if(item==target)return index;
  return -1;
}
int unlink_calls=0, operator_free_calls=0, handler_free_calls=0, reports_calls=0, grab_disable_calls=0;
int event_order[8]{}, event_order_count=0;
wmWindow *expected_window=nullptr; wmWindowManager *observed_wm=nullptr;
void BLI_remlink(ListBase *list,void *target) {
  wmEventHandler **link=&list->first; while(*link&&*link!=target)link=&(*link)->next;
  if(*link){wmEventHandler *found=*link;*link=found->next;found->next=nullptr;++unlink_calls;event_order[event_order_count++]=3;}
}
void WM_operator_free(wmOperator *op){assert(op&&!op->freed);op->freed=true;++operator_free_calls;
  assert(observed_wm&&observed_wm->op_undo_depth==0);event_order[event_order_count++]=2;}
void wm_event_free_handler(wmEventHandler *handler){assert(handler);handler->freed=true;++handler_free_calls;
  event_order[event_order_count++]=4;}
void wm_operator_reports(bContext*,wmOperator*,int,bool){++reports_calls;event_order[event_order_count++]=1;}
void WM_window_status_area_tag_redraw(wmWindow*){}
void WM_cursor_grab_disable(wmWindow *win,void*){assert(win==expected_window);++grab_disable_calls;}
ScrArea *CTX_wm_area(bContext*C){return C->area;} ARegion *CTX_wm_region(bContext*C){return C->region;}
wmWindow *CTX_wm_window(bContext*C){return C->win;} wmWindowManager *CTX_wm_manager(bContext*C){return C->manager;}
void CTX_wm_area_set(bContext*C,ScrArea*a){C->area=a;} void CTX_wm_region_set(bContext*C,ARegion*r){C->region=r;}
void wm_handler_op_context(bContext*C,wmEventHandler_Op*h,const wmEvent*){C->area=h->area;C->region=h->region;}
bool g_registered=true,g_owner=true,g_unlocked=true;
bool wm_ipad_pencil_paint_handler_registered(wmWindow*,const wmEventHandler_Op*h){return g_registered&&h->registered&&h->op&&h->op->type;}
bool wm_ipad_pencil_paint_modal_owner_matches(
 bContext*C,wmWindow*,const wmEventHandler_Op*,bool teardown){
 (void)teardown;return g_owner&&C->owner_matches;}
bool wm_operator_check_locked_interface(bContext*,wmOperatorType*){return g_unlocked;}
int cancel_calls=0, cancel_context_correct=0;
void paint_cancel(bContext*C,wmOperator*){++cancel_calls;event_order[event_order_count++]=0;
  if(C->area==reinterpret_cast<ScrArea*>(1)&&C->region==reinterpret_cast<ARegion*>(2))++cancel_context_correct;}
void wm_ipad_pencil_paint_cancelled_contact_mark(wmWindow*,const wmEventHandler_Op*){}
int wm_handler_operator_call(bContext*C,ListBase*handlers,wmEventHandler*base,wmEvent*,PointerRNA*,const char*);
"""
        source = (CPP + prelude + EVENT_ENUMS + "\n" + EVENT_MATCH + "\n" +
                  CLASSIFY + "\n" + ADMIT + "\n" + PRE_DISPATCH + NATIVE_HANDLER_CALL_FIXTURE + r"""
int main(){
 wmWindowManager wm; bContext C; C.manager=&wm; observed_wm=&wm;
 wmOperatorType ot;ot.cancel=paint_cancel;wmOperator op{&ot};
 wmEventHandler_Op h{};h.head.type=WM_HANDLER_TYPE_OP;h.area=reinterpret_cast<ScrArea*>(1);
 h.region=reinterpret_cast<ARegion*>(2);h.op=&op;
 wmWindow win;win.modalhandlers.first=&h.head;C.win=&win;
 expected_window=&win;
 ScrArea previous_area;ARegion previous_region;C.area=&previous_area;C.region=&previous_region;C.owner_matches=true;
 wmEvent event;
 assert(wm_ipad_pencil_paint_modal_pre_dispatch(&C,&win,&event)==eIPadPencilPaintPreDispatch::DispatchModal);
 assert(cancel_calls==0&&BLI_findindex(&win.modalhandlers,&h.head)==0&&C.area==&previous_area&&C.region==&previous_region);
 event.type=TIMER;event.ipad_pencil_paint_down=false;event.ipad_pencil_paint_serial=0;
 event.ipad_pencil_paint_generation=0;event.ipad_pencil_paint_region=0;
 assert(wm_ipad_pencil_paint_modal_pre_dispatch(&C,&win,&event)==eIPadPencilPaintPreDispatch::DispatchModal&&cancel_calls==0);
 event.type=1;event.ipad_pencil_paint_down=true;event.ipad_pencil_paint_phase=WM_PENCIL_PAINT_PHASE_END;
 event.ipad_pencil_paint_serial=43;event.ipad_pencil_paint_generation=7;event.ipad_pencil_paint_region=12;
 event.ipad_pencil_paint_origin_xy[0]=100;event.ipad_pencil_paint_origin_xy[1]=200;
 assert(wm_ipad_pencil_paint_modal_pre_dispatch(&C,&win,&event)==eIPadPencilPaintPreDispatch::Consume&&cancel_calls==0);
 event.ipad_pencil_paint_serial=44;event.ipad_pencil_paint_origin_xy[0]++;
 assert(wm_ipad_pencil_paint_modal_pre_dispatch(&C,&win,&event)==eIPadPencilPaintPreDispatch::Consume&&cancel_calls==0);
 event.ipad_pencil_paint_serial=0;event.ipad_pencil_paint_down=false;
 event.ipad_pencil_paint_phase=WM_PENCIL_PAINT_PHASE_BEGIN;event.type=PENCIL_RING_INPUT;
 assert(wm_ipad_pencil_paint_modal_pre_dispatch(&C,&win,&event)==eIPadPencilPaintPreDispatch::Proceed);
 assert(cancel_calls==1&&cancel_context_correct==1&&BLI_findindex(&win.modalhandlers,&h.head)==-1);
 assert(operator_free_calls==1&&handler_free_calls==1&&unlink_calls==1&&reports_calls==1&&grab_disable_calls==1);
 assert(h.op==nullptr&&h.head.freed&&wm.op_undo_depth==0&&event_order_count==5);
 assert(event_order[0]==0&&event_order[1]==1&&event_order[2]==2&&event_order[3]==3&&event_order[4]==4);
 assert(C.area==&previous_area&&C.region==&previous_region);
 wmOperator refusal_op{&ot};h.op=&refusal_op;h.head.next=nullptr;win.modalhandlers.first=&h.head;g_owner=false;
 assert(wm_ipad_pencil_paint_modal_pre_dispatch(&C,&win,&event)==eIPadPencilPaintPreDispatch::Consume&&cancel_calls==1);
 g_owner=true;g_registered=false;
 assert(wm_ipad_pencil_paint_modal_pre_dispatch(&C,&win,&event)==eIPadPencilPaintPreDispatch::Consume&&cancel_calls==1);
 g_registered=true;g_unlocked=false;
 assert(wm_ipad_pencil_paint_modal_pre_dispatch(&C,&win,&event)==eIPadPencilPaintPreDispatch::Consume&&cancel_calls==1);
}
""")
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(source)


    def test_cancelled_native_paint_quarantines_motion_and_lift_from_new_tool(self):
        self.assertLess(
            NATIVE_INTERRUPT.index('wm_ipad_pencil_paint_cancelled_contact_mark(win, handler);'),
            NATIVE_INTERRUPT.index('ot->cancel(C, op);'))
        event_loop = function(WM, 'void wm_event_do_handlers(')
        cancelled_tail = event_loop.index(
            'if (wm_ipad_pencil_paint_cancelled_contact_consume(win, event))')
        self.assertLess(
            event_loop.index('while ((event = static_cast<wmEvent *>(win->runtime->event_queue.first)))'),
            cancelled_tail)
        for protected_state in (
                'eHandlerActionFlag action = WM_HANDLER_CONTINUE;',
                'if (win->event_queue_check_drag)',
                'WM_event_consecutive_gesture_test(event)',
                'wm_event_pie_filter(win, event)',
                'CTX_wm_window_set(C, win)',
                'wm_handlers_do(C, event, &win->modalhandlers)'):
            with self.subTest(protected_state=protected_state):
                self.assertLess(cancelled_tail, event_loop.index(protected_state))
        source = r"""
#include <cassert>
#include <cstdint>
#include <algorithm>
enum { WM_PENCIL_PAINT_PHASE_BEGIN=1, WM_PENCIL_PAINT_PHASE_MOTION=2,
       WM_PENCIL_PAINT_PHASE_END=3, OPERATOR_CANCELLED=32,
       OPERATOR_PASS_THROUGH=128 };
template<class... T> bool ELEM(uint8_t value,T... values){return ((value==values)||...);}
struct ListBase { void *first=nullptr; };
struct wmEvent {
  int type=0; bool ipad_pencil_paint_down=false;
  uint8_t ipad_pencil_paint_phase=0;
  uint64_t ipad_pencil_paint_serial=0, ipad_pencil_paint_generation=0;
  uintptr_t ipad_pencil_paint_region=0;
  int32_t ipad_pencil_paint_origin_xy[2]{};
  bool freed=false;
};
struct WindowRuntime {
  ListBase event_queue;
  uint64_t ipad_pencil_paint_cancelled_serial=0,
    ipad_pencil_paint_cancelled_generation=0;
};
struct wmWindow { WindowRuntime *runtime=nullptr; };
struct wmEventHandler_Op {
  uint64_t ipad_pencil_paint_serial=0, ipad_pencil_paint_generation=0;
  uintptr_t ipad_pencil_region=0;
  int32_t ipad_pencil_origin_x=0, ipad_pencil_origin_y=0;
};
struct bContext {};
struct wmOperator {};
struct wmOperatorType { void (*cancel)(bContext*,wmOperator*)=nullptr; };
int BLI_remlink(ListBase *list,void *target) {
  if(list->first!=target)return 0; list->first=nullptr; return 1;
}
void wm_event_free_last_handled(wmWindow*,wmEvent *event){event->freed=true;}
int cancel_callbacks=0, replacement_modal_deliveries=0;
void native_cancel(bContext*,wmOperator*){++cancel_callbacks;}
""" + CANCELLED_CONTACT_MARK + "\n" + CANCELLED_CONTACT_CONSUME + "\n" + r"""
void cancel_old_owner_with_native_status(wmWindow *win,wmEventHandler_Op *handler,
                                         bContext *C,wmOperator *op,wmOperatorType *ot) {
  int retval=0; const bool ipad_pencil_paint_interrupt=true;
""" + NATIVE_INTERRUPT + r"""
  assert(retval==(OPERATOR_CANCELLED|OPERATOR_PASS_THROUGH));
}
void route_late_contact_event(wmWindow *win,wmEvent *event) {
  win->runtime->event_queue.first=event;
  while(win->runtime->event_queue.first) {
""" + CANCELLED_CONTACT_EARLY_BLOCK + r"""
    ++replacement_modal_deliveries;
    break;
  }
}
int main(){
  WindowRuntime runtime; wmWindow win{&runtime}; bContext C; wmOperator op;
  wmOperatorType ot{native_cancel};
  wmEventHandler_Op old_owner{41,7,uintptr_t(0x1234),100,200};
  cancel_old_owner_with_native_status(&win,&old_owner,&C,&op,&ot);
  assert(cancel_callbacks==1&&runtime.ipad_pencil_paint_cancelled_serial==41&&
         runtime.ipad_pencil_paint_cancelled_generation==7);

  wmEvent motion; motion.ipad_pencil_paint_down=true;
  motion.ipad_pencil_paint_phase=WM_PENCIL_PAINT_PHASE_MOTION;
  motion.ipad_pencil_paint_serial=41;motion.ipad_pencil_paint_generation=7;
  /* A resize/reprojection changes event coordinates after cancellation. */
  motion.ipad_pencil_paint_region=uintptr_t(0x1234);
  motion.ipad_pencil_paint_origin_xy[0]=900;motion.ipad_pencil_paint_origin_xy[1]=1200;
  route_late_contact_event(&win,&motion);
  assert(motion.freed&&replacement_modal_deliveries==0&&
         runtime.ipad_pencil_paint_cancelled_serial==41);

  wmEvent lift=motion;lift.freed=false;lift.ipad_pencil_paint_phase=WM_PENCIL_PAINT_PHASE_END;
  route_late_contact_event(&win,&lift);
  assert(lift.freed&&replacement_modal_deliveries==0&&
         runtime.ipad_pencil_paint_cancelled_serial==0);

  wmEvent next_contact=motion;next_contact.freed=false;
  next_contact.ipad_pencil_paint_serial=42;next_contact.ipad_pencil_paint_generation=8;
  route_late_contact_event(&win,&next_contact);
  assert(!next_contact.freed&&replacement_modal_deliveries==1);

  wmEvent unowned_zero_contact;
  unowned_zero_contact.ipad_pencil_paint_down=true;
  unowned_zero_contact.ipad_pencil_paint_phase=WM_PENCIL_PAINT_PHASE_END;
  route_late_contact_event(&win,&unowned_zero_contact);
  assert(!unowned_zero_contact.freed&&replacement_modal_deliveries==2);

  for(uint64_t serial=100;serial<10100;serial++){
    old_owner.ipad_pencil_paint_serial=serial;
    cancel_old_owner_with_native_status(&win,&old_owner,&C,&op,&ot);
    wmEvent repeated_motion;
    repeated_motion.ipad_pencil_paint_down=true;
    repeated_motion.ipad_pencil_paint_phase=WM_PENCIL_PAINT_PHASE_MOTION;
    repeated_motion.ipad_pencil_paint_serial=serial;
    repeated_motion.ipad_pencil_paint_generation=7;
    route_late_contact_event(&win,&repeated_motion);
    assert(repeated_motion.freed&&replacement_modal_deliveries==2);
    wmEvent repeated_lift=repeated_motion;
    repeated_lift.freed=false;
    repeated_lift.ipad_pencil_paint_phase=WM_PENCIL_PAINT_PHASE_END;
    route_late_contact_event(&win,&repeated_lift);
    assert(repeated_lift.freed&&replacement_modal_deliveries==2&&
           runtime.ipad_pencil_paint_cancelled_serial==0);
  }
  assert(cancel_callbacks==10001);
}
"""
        self.run_cpp(source)

    def test_actual_router_branch_never_runs_ring_on_stale_owner(self):
        source = (CPP + r"""
enum { WM_HANDLER_BREAK=4, WM_HANDLER_HANDLED=8, PENCIL_RING_INPUT=99 };
struct wmEvent { int type=0; };
struct ListBase {};
struct wmWindow { ListBase modalhandlers; };
struct bContext {};
int ring_dispatches=0, modal_dispatches=0;
void UI_ipad_ring_event_dispatch(bContext*,wmEvent*) { ++ring_dispatches; }
int wm_handlers_do(bContext*,wmEvent*,ListBase*) { ++modal_dispatches; return 0; }
"""+EVENT_ENUMS+"\nint route(bContext*C,wmWindow*win,wmEvent*event,"
"eIPadPencilPaintPreDispatch ipad_pencil_paint_pre_dispatch,bool ipad_reopen_dismissed){"
"int action=0;\n"+ROUTE_BLOCK+"\nreturn action;}\n"+r"""
int main(){
 bContext C;wmWindow win;wmEvent event{PENCIL_RING_INPUT};
 int action=route(&C,&win,&event,eIPadPencilPaintPreDispatch::Proceed,false);
 assert(action==(WM_HANDLER_BREAK|WM_HANDLER_HANDLED)&&ring_dispatches==1&&modal_dispatches==0);
 ring_dispatches=modal_dispatches=0;
 action=route(&C,&win,&event,eIPadPencilPaintPreDispatch::Consume,false);
 assert(action==(WM_HANDLER_BREAK|WM_HANDLER_HANDLED)&&ring_dispatches==0&&modal_dispatches==0);
 action=route(&C,&win,&event,eIPadPencilPaintPreDispatch::DispatchModal,false);
 assert(action==(WM_HANDLER_BREAK|WM_HANDLER_HANDLED)&&ring_dispatches==0&&modal_dispatches==1);
 ring_dispatches=modal_dispatches=0;
 action=route(&C,&win,&event,eIPadPencilPaintPreDispatch::Proceed,true);
 assert(action==(WM_HANDLER_BREAK|WM_HANDLER_HANDLED)&&ring_dispatches==0&&modal_dispatches==0);
 action=route(&C,&win,&event,eIPadPencilPaintPreDispatch::DispatchModal,true);
 assert(action==(WM_HANDLER_BREAK|WM_HANDLER_HANDLED)&&ring_dispatches==0&&modal_dispatches==1);
}
""")
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(source)

    def test_ring_and_reopen_paths_preflight_before_they_bypass_modal_handlers(self):
        stale = ROUTER.index("event->type == PENCIL_RING_INPUT && !wm_ipad_ring_packet_live")
        preflight = ROUTER.index("wm_ipad_pencil_paint_modal_pre_dispatch(C, win, event)")
        ring_dispatch = ROUTER.index("UI_ipad_ring_event_dispatch(C, event)")
        self.assertLess(stale, preflight)
        self.assertLess(preflight, ring_dispatch)
        self.assertIn("ipad_reopen_dismissed || event->type == PENCIL_RING_INPUT", ROUTER)
        consume = ROUTER.index("ipad_pencil_paint_pre_dispatch == eIPadPencilPaintPreDispatch::Consume")
        modal = ROUTER.index("ipad_pencil_paint_pre_dispatch ==\n               eIPadPencilPaintPreDispatch::DispatchModal")
        self.assertLess(consume, ring_dispatch)
        self.assertLess(modal, ring_dispatch)
        self.assertIn("action |= wm_handlers_do(C, event, &win->modalhandlers);", ROUTER)

    def test_actual_modal_dispatch_revalidates_and_uses_native_cancel_status_cleanup(self):
        context = OPERATOR_CALL.index("wm_handler_op_context(C, handler, event);")
        admission = OPERATOR_CALL.index("wm_ipad_pencil_paint_modal_admit(C, win, event, handler);")
        native_modal = OPERATOR_CALL.index("retval = ot->modal(C, op, event);")
        cancel = OPERATOR_CALL.index("ot->cancel(C, op);")
        self.assertLess(context, admission)
        self.assertLess(admission, cancel)
        self.assertLess(cancel, native_modal)
        self.assertIn("retval = OPERATOR_CANCELLED | OPERATOR_PASS_THROUGH;", OPERATOR_CALL)
        self.assertIn("WM_operator_free(op);\n          handler->op = nullptr;", OPERATOR_CALL)
        self.assertIn("BLI_remlink(handlers, handler);\n          wm_event_free_handler(&handler->head);", OPERATOR_CALL)


if __name__ == "__main__":
    unittest.main()
