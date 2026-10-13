"""Join the shipped Pencil packet, GHOST->WM conversion and native paint terminal.

The fixture executes the active pinned C++ slices in one value-only pipeline.
UIKit delivery, GPU admission, real WM scheduling, and brush effects stay outside
its scope; per-layer tests and device acceptance remain separate evidence.
"""
import unittest

import test_pencil_paint_contact_lease as lease
import test_paint_terminal_contract as terminal
from test_compact_shelf import function


class PencilPaintPipelineTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        terminal.PaintTerminalContractTests.setUpClass()
        cls.cpp = terminal.COMMON + r"""
#include <algorithm>
#include <cstring>
enum { GHOST_kButtonMaskLeft=1, TIMER=90, PENCIL_RING_INPUT=91,
       WM_PENCIL_PAINT_PHASE_NONE=0, WM_PENCIL_PAINT_PHASE_PREPRESS=1,
       WM_PENCIL_PAINT_PHASE_BEGIN=2, WM_PENCIL_PAINT_PHASE_MOTION=3,
       WM_PENCIL_PAINT_PHASE_END=4, WM_HANDLER_TYPE_OP=1,
       WM_HANDLER_HANDLED=16, OPERATOR_CANCELLED=32,
       OPERATOR_PASS_THROUGH=64 };
constexpr int GHOST_kEventCursorMove=89;
#define WITH_APPLE_CROSSPLATFORM
#define ISTIMER(type) ((type)==TIMER)
template<class... T> bool ELEM(int value,T... values){return ((value==values)||...);}
struct Runtime;
struct wmWindow { Runtime *runtime=nullptr; GHOST_IWindow *ghostwin=nullptr; };
struct Runtime {
  uint64_t ipad_pencil_paint_queued_serial=0, ipad_pencil_paint_queued_generation=0;
  uint64_t ipad_pencil_paint_retired_serial=0, ipad_pencil_paint_cancelled_serial=0;
  uint64_t ipad_pencil_paint_cancelled_generation=0;
  uintptr_t ipad_pencil_paint_queued_region=0;
  int32_t ipad_pencil_paint_queued_origin_xy[2]{};
  bool ipad_pencil_paint_queued_down=false;
};
struct wmOperatorType { void (*cancel)(bContext*,wmOperator*)=nullptr; };
struct wmWindowManager {};
struct wmEventHandler_Op {
  uint64_t ipad_pencil_paint_serial=0, ipad_pencil_paint_generation=0;
  uintptr_t ipad_pencil_region=0;
  int32_t ipad_pencil_origin_x=0, ipad_pencil_origin_y=0;
  bool registered=true;
};
namespace ghost::ios {
struct PencilPaintContact {
  uint64_t serial,generation; uintptr_t region; int32_t origin_x,origin_y;
};
bool pencil_paint_ticket_live(void *,const PencilPaintContact &){return true;}
}
bool wm_ipad_pencil_paint_handler_registered(wmWindow *,const wmEventHandler_Op *h)
{ return h && h->registered; }
bool wm_ipad_pencil_paint_modal_owner_matches(bContext *,wmWindow *,const wmEventHandler_Op *,bool)
{ return true; }
void wm_cursor_position_from_ghost_screen_coords(wmWindow*,int*,int*){}
void wm_stereo3d_mouse_offset_apply(wmWindow*,int*){}
int cancelled_calls=0, modal_release_calls=0, ghost_shared_state_updates=0;
PaintStroke *active_stroke=nullptr;
""" + terminal.PaintTerminalContractTests.constructor
        cls.cpp += "\nwmOperatorStatus native_terminal_release(bContext *C, wmOperator *op, " \
                     "const wmEvent *event, PaintStroke **stroke_p) {\n" \
                     "  auto *stroke=*stroke_p; bool first_modal=false;\n" \
                     + terminal.PaintTerminalContractTests.release + \
                     "  return OPERATOR_RUNNING_MODAL;\n}\n"
        cls.cpp += "\nwmEvent convert_button(const GHOST_TEventButtonData *bd, int type, " \
                     "wmWindow *win, bool down, uint8_t phase) {\n" \
                     "  wmEvent event; bool ipad_pencil_dispatch_down=down; " \
                     "uint8_t ipad_pencil_dispatch_phase=phase;\n" \
                     + terminal.PaintTerminalContractTests.convert + \
                     "  return event;\n}\n"
        cls.cpp += """
enum class eIPadPencilPaintModalEvent : uint8_t { OwnedContact, StaleContact, Timer, Interrupt };
enum class eIPadPencilPaintModalAdmission : uint8_t { Dispatch, Consume, Cancel };
""" + lease.EVENT_MATCH + "\n" + lease.CLASSIFY + "\n" + lease.ADMIT + "\n" + \
            lease.CANCELLED_CONTACT_MARK + "\n" + lease.CANCELLED_CONTACT_CONSUME + "\n"
        cls.cpp += r"""
bool cancelled_contact_consumed(wmWindow *win,wmEvent *event) {
  return wm_ipad_pencil_paint_cancelled_contact_consume(win,event);
}

bool dispatch_down=false, tagged=false;
uint8_t dispatch_phase=WM_PENCIL_PAINT_PHASE_NONE;
void queue_button(int type,uint64_t serial,uint64_t generation,uintptr_t region,
                  int32_t origin_x,int32_t origin_y,GHOST_TButton button,
                  bool pointer_cancel,wmWindow *win,wmEvent *out) {
  /* Each rejected native packet starts with an untagged, value-initialized event. */
  dispatch_down=false;
  dispatch_phase=WM_PENCIL_PAINT_PHASE_NONE;
  tagged=false;
  const bool any_contact_value=serial||generation||region||origin_x||origin_y;
  ghost::ios::PencilPaintContact ipad_pencil_contact{};
  bool ipad_pencil_dispatch_down=false,ipad_pencil_tagged=false;
  uint8_t ipad_pencil_dispatch_phase=WM_PENCIL_PAINT_PHASE_PREPRESS;
""" + lease.QUEUE_CAPTURE + r"""
  ++ghost_shared_state_updates;
  dispatch_down=ipad_pencil_dispatch_down;
  dispatch_phase=ipad_pencil_dispatch_phase;
  tagged=ipad_pencil_tagged;
  if (!tagged) return;
  GHOST_EventButton packet(1,type,win->ghostwin,button,GHOST_TabletData{},
      pointer_cancel,false,0,0,false,0,serial,generation,region,origin_x,origin_y);
  auto *data=static_cast<GHOST_TEventButtonData*>(packet.data_);
  *out=convert_button(data,type,win,dispatch_down,dispatch_phase);
}

void native_cancel(bContext*,wmOperator*) { ++cancelled_calls; }
int operator_call(bContext *C,wmWindow *win,wmEventHandler_Op *handler,
                  wmOperator *op,wmOperatorType *ot,wmEvent *event) {
  const eIPadPencilPaintModalAdmission admission=
      wm_ipad_pencil_paint_modal_admit(C,win,event,handler);
  if (admission==eIPadPencilPaintModalAdmission::Consume) return WM_HANDLER_HANDLED;
  bool ipad_pencil_paint_interrupt=false;
""" + lease.INTERRUPT_DECISION + r"""
  int retval=0;
""" + lease.NATIVE_INTERRUPT + r"""
  if (!ipad_pencil_paint_interrupt) {
    ++modal_release_calls;
    retval=native_terminal_release(C,op,event,&active_stroke);
  }
  return retval;
}
"""
        dispatch_start = lease.WM.index(
            "#ifdef WITH_APPLE_CROSSPLATFORM\nstruct WMPencilPaintDispatch")
        dispatch_end = lease.WM.index(
            "\nstatic bool wm_ipad_pencil_paint_event_matches_handler", dispatch_start)
        cls.bind_cpp = r"""
#include <array>
#include <cassert>
#include <cstdint>
#include <cstring>
#define WITH_APPLE_CROSSPLATFORM
enum { LEFTMOUSE=1, KM_PRESS=2, KM_RELEASE=3, OB_MODE_SCULPT=1,
       OB_MODE_VERTEX_PAINT=2, OB_MODE_WEIGHT_PAINT=4, OB_MODE_TEXTURE_PAINT=8,
       WM_HANDLER_TYPE_OP=5, WM_PENCIL_PAINT_PHASE_BEGIN=2 };
struct bContext; struct wmWindow; struct wmOperator; struct wmEvent;
struct ScrArea {};
struct ARegion {};
struct GHOST_IWindow {};
struct ID { uint64_t session_uid=0; };
struct bScreen { ID id; };
struct ListBase { const void *registered_head=nullptr; };
struct wmWindowManager { int runtime=1; };
struct wmWindow {
  int runtime=1;
  GHOST_IWindow *ghostwin=nullptr;
  ListBase modalhandlers;
  bScreen *screen=nullptr;
};
struct bContext {
  wmWindow *win=nullptr; wmWindowManager *wm=nullptr;
  ScrArea *area=nullptr; ARegion *region=nullptr; bScreen *screen=nullptr;
};
struct wmEvent {
  int type=0,val=0;
  bool ipad_pencil_paint_down=false;
  uint64_t ipad_pencil_paint_serial=0,ipad_pencil_paint_generation=0;
  uintptr_t ipad_pencil_paint_region=0;
  int ipad_pencil_paint_origin_xy[2]{};
  uint8_t ipad_pencil_paint_phase=0;
};
struct wmOperatorType {
  uint64_t ipad_lifetime_id=0;
  void (*modal)(bContext*,wmOperator*,wmEvent*)=nullptr;
  void (*cancel)(bContext*,wmOperator*)=nullptr;
};
struct wmOperator { wmOperator *opm=nullptr; wmOperatorType *type=nullptr; uint64_t lifetime=0; };
struct wmEventHandler_Op {
  struct { int type=WM_HANDLER_TYPE_OP; } head;
  struct { ScrArea *area=nullptr; ARegion *region=nullptr; } context;
  wmOperator *op=nullptr;
  uint64_t ipad_pencil_paint_serial=0,ipad_pencil_paint_generation=0;
  uint64_t ipad_pencil_operator_lifetime=0,ipad_pencil_type_lifetime=0;
  uint64_t ipad_pencil_screen_uid=0,ipad_pencil_type_address=0;
  uintptr_t ipad_pencil_area=0,ipad_pencil_region=0;
  int32_t ipad_pencil_origin_x=0,ipad_pencil_origin_y=0;
  int ipad_pencil_paint_mode=0;
  uint64_t ipad_pencil_owner_values[20]{};
  char ipad_pencil_owner_tool[64]{};
};
struct IPadFingerPaintOwner {
  bool valid=true;
  uint64_t values[20]{};
  std::array<char,32> tool{};
};
int BLI_findindex(const ListBase *base,const void *item)
{ return base && base->registered_head==item ? 0 : -1; }
wmWindow *CTX_wm_window(bContext *C){return C?C->win:nullptr;}
wmWindowManager *CTX_wm_manager(bContext *C){return C?C->wm:nullptr;}
ScrArea *CTX_wm_area(bContext *C){return C?C->area:nullptr;}
ARegion *CTX_wm_region(bContext *C){return C?C->region:nullptr;}
bScreen *WM_window_get_active_screen(wmWindow *win){return win?win->screen:nullptr;}
void no_modal(bContext*,wmOperator*,wmEvent*){}
void no_cancel(bContext*,wmOperator*){}
wmOperatorType registered_type{77,no_modal,no_cancel};
const char *wm_ipad_pencil_paint_operator_id(int mode)
{ return mode==OB_MODE_SCULPT ? "SCULPT_OT_brush_stroke" : nullptr; }
wmOperatorType *WM_operatortype_find(const char *idname,bool)
{ return idname && std::strcmp(idname,"SCULPT_OT_brush_stroke")==0 ? &registered_type : nullptr; }
int contact_validation_calls=0,capture_calls=0,touch_id_calls=0;
bool WM_ipad_pencil_paint_contact_validate(bContext*,const wmEvent *event,int mode)
{ ++contact_validation_calls; return event && mode==OB_MODE_SCULPT; }
IPadFingerPaintOwner captured_owner;
bool ED_ipad_finger_paint_capture(bContext*,IPadFingerPaintOwner &owner)
{ ++capture_calls; owner=captured_owner; return owner.valid; }
uint64_t WM_operator_touch_lifetime_id(wmOperator *op)
{ ++touch_id_calls; return op?op->lifetime:0; }
""" + lease.WM[dispatch_start:dispatch_end] + "\n#endif\n" + \
            function(lease.WM, "static void wm_ipad_pencil_paint_modal_handler_bind(") + r"""
int main(){
  wmWindowManager manager; bScreen screen; screen.id.session_uid=80;
  GHOST_IWindow ghost; wmWindow win; win.ghostwin=&ghost; win.screen=&screen;
  ScrArea area; ARegion region; bContext C{&win,&manager,&area,&region,&screen};
  wmEvent begin; begin.type=LEFTMOUSE; begin.val=KM_PRESS;
  begin.ipad_pencil_paint_down=true; begin.ipad_pencil_paint_serial=44;
  begin.ipad_pencil_paint_generation=7;
  begin.ipad_pencil_paint_origin_xy[0]=100; begin.ipad_pencil_paint_origin_xy[1]=200;
  begin.ipad_pencil_paint_phase=WM_PENCIL_PAINT_PHASE_BEGIN;
  for(int i=0;i<20;i++) captured_owner.values[i]=i+1000;
  captured_owner.values[9]=OB_MODE_SCULPT;
  std::memcpy(captured_owner.tool.data(),"builtin_brush.SculptDraw",25);
  begin.ipad_pencil_paint_region=uintptr_t(&region);
  wmOperator op{nullptr,&registered_type,501};
  wmEventHandler_Op owner; owner.op=&op; owner.context.area=&area; owner.context.region=&region;
  win.modalhandlers.registered_head=&owner.head;
  {
    WMPencilPaintDispatchScope scope(&C,&win,&begin);
    assert(wm_ipad_pencil_paint_dispatch.active);
    wm_ipad_pencil_paint_modal_handler_bind(&C,&win,&owner,&op);
  }
  assert(!wm_ipad_pencil_paint_dispatch.active);
  assert(contact_validation_calls==1&&capture_calls==1&&touch_id_calls==1);
  assert(owner.ipad_pencil_paint_serial==44&&owner.ipad_pencil_paint_generation==7);
  assert(owner.ipad_pencil_operator_lifetime==501&&owner.ipad_pencil_type_lifetime==77);
  assert(owner.ipad_pencil_screen_uid==80&&owner.ipad_pencil_type_address==uintptr_t(&registered_type));
  assert(owner.ipad_pencil_area==uintptr_t(&area)&&owner.ipad_pencil_region==uintptr_t(&region));
  assert(owner.ipad_pencil_origin_x==100&&owner.ipad_pencil_origin_y==200);
  assert(owner.ipad_pencil_paint_mode==OB_MODE_SCULPT);
  for(int i=0;i<=12;i++) {
    assert(owner.ipad_pencil_owner_values[i]==
           uint64_t(i==9 ? OB_MODE_SCULPT : i+1000));
  }
  for(int i : {17,18}) assert(owner.ipad_pencil_owner_values[i]==uint64_t(i+1000));
  assert(std::strcmp(owner.ipad_pencil_owner_tool,"builtin_brush.SculptDraw")==0);

  /* The lifetime allocator cannot make an unregistered handler a valid owner. */
  wmEventHandler_Op unregistered; unregistered.op=&op;
  unregistered.context.area=&area; unregistered.context.region=&region;
  const int allocations_before=touch_id_calls;
  win.modalhandlers.registered_head=nullptr;
  {
    WMPencilPaintDispatchScope scope(&C,&win,&begin);
    wm_ipad_pencil_paint_modal_handler_bind(&C,&win,&unregistered,&op);
  }
  assert(touch_id_calls==allocations_before&&!unregistered.ipad_pencil_paint_serial);

  /* A macro mother may own dispatch, but the child is never bound as the paint lease. */
  wmEventHandler_Op macro_handler; macro_handler.op=&op;
  macro_handler.context.area=&area; macro_handler.context.region=&region;
  win.modalhandlers.registered_head=&macro_handler.head;
  wmOperator child{nullptr,&registered_type,502}; op.opm=&child;
  {
    WMPencilPaintDispatchScope scope(&C,&win,&begin);
    wm_ipad_pencil_paint_modal_handler_bind(&C,&win,&macro_handler,&op);
  }
  assert(touch_id_calls==allocations_before&&!macro_handler.ipad_pencil_paint_serial);
}
"""

    def run_cpp(self, main):
        import test_ipad_panels
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(self.cpp + main)

    def test_native_begin_binds_only_registered_non_macro_owner(self):
        import test_ipad_panels
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(self.bind_cpp)

    def test_press_to_native_release_keeps_the_same_contact_and_completes_once(self):
        self.run_cpp(r"""
int main(){
  Runtime runtime; GHOST_IWindow ghost; wmWindow win{&runtime,&ghost};
  bContext C; wmOperatorType type{native_cancel}; wmOperator op{41};
  PaintStroke stroke; stroke.owner=41; active_stroke=&stroke;
  wmEventHandler_Op owner; wmEvent event;
  queue_button(GHOST_kEventButtonDown,44,7,12,100,200,GHOST_kButtonMaskLeft,false,&win,&event);
  assert(tagged&&dispatch_down&&dispatch_phase==WM_PENCIL_PAINT_PHASE_BEGIN);
  assert(event.ipad_pencil_paint_serial==44&&event.ipad_pencil_paint_generation==7&&
         event.ipad_pencil_paint_region==12&&event.ipad_pencil_paint_down&&
         event.ipad_pencil_paint_phase==WM_PENCIL_PAINT_PHASE_BEGIN);
  owner.ipad_pencil_paint_serial=event.ipad_pencil_paint_serial;
  owner.ipad_pencil_paint_generation=event.ipad_pencil_paint_generation;
  owner.ipad_pencil_region=event.ipad_pencil_paint_region;
  owner.ipad_pencil_origin_x=event.ipad_pencil_paint_origin_xy[0];
  owner.ipad_pencil_origin_y=event.ipad_pencil_paint_origin_xy[1];
  queue_button(GHOST_kEventButtonUp,44,7,12,100,200,GHOST_kButtonMaskLeft,false,&win,&event);
  assert(tagged&&event.val==KM_RELEASE&&event.ipad_pencil_paint_down&&
         event.ipad_pencil_paint_phase==WM_PENCIL_PAINT_PHASE_END);
  assert(wm_ipad_pencil_paint_modal_admit(&C,&win,&event,&owner)==
         eIPadPencilPaintModalAdmission::Dispatch);
  assert(operator_call(&C,&win,&owner,&op,&type,&event)==OPERATOR_FINISHED);
  assert(modal_release_calls==1&&cancelled_calls==0&&!active_stroke);
  assert(stroke.line_finishes==1&&stroke.completed==1);
}
""")

    def test_interruption_cancels_owner_and_old_queued_lift_never_reaches_a_replacement(self):
        self.run_cpp(r"""
int main(){
  Runtime runtime; GHOST_IWindow ghost; wmWindow win{&runtime,&ghost};
  bContext C; wmOperatorType type{native_cancel}; wmOperator op{51};
  PaintStroke interrupted_stroke; interrupted_stroke.owner=51;
  PaintStroke replacement_stroke; replacement_stroke.owner=52;
  active_stroke=&interrupted_stroke;
  wmEventHandler_Op owner; wmEvent event;
  queue_button(GHOST_kEventButtonDown,51,9,12,100,200,GHOST_kButtonMaskLeft,false,&win,&event);
  owner.ipad_pencil_paint_serial=event.ipad_pencil_paint_serial;
  owner.ipad_pencil_paint_generation=event.ipad_pencil_paint_generation;
  owner.ipad_pencil_region=event.ipad_pencil_paint_region;
  owner.ipad_pencil_origin_x=event.ipad_pencil_paint_origin_xy[0];
  owner.ipad_pencil_origin_y=event.ipad_pencil_paint_origin_xy[1];
  wmEvent interrupt{}; interrupt.type=PENCIL_RING_INPUT;
  assert(wm_ipad_pencil_paint_modal_admit(&C,&win,&interrupt,&owner)==
         eIPadPencilPaintModalAdmission::Cancel);
  assert(operator_call(&C,&win,&owner,&op,&type,&interrupt)==
         (OPERATOR_CANCELLED|OPERATOR_PASS_THROUGH));
  assert(cancelled_calls==1&&modal_release_calls==0&&
         runtime.ipad_pencil_paint_cancelled_serial==51&&
         runtime.ipad_pencil_paint_cancelled_generation==9);
  assert(cancelled_contact_consumed(&win,&event));
  /* A fresh handler/stroke can exist while the old lift is still queued. */
  wmEventHandler_Op replacement; replacement.ipad_pencil_paint_serial=52;
  replacement.ipad_pencil_paint_generation=10;
  replacement.ipad_pencil_region=12;
  replacement.ipad_pencil_origin_x=300; replacement.ipad_pencil_origin_y=400;
  active_stroke=&replacement_stroke;
  const int before_lift=ghost_shared_state_updates;
  queue_button(GHOST_kEventButtonUp,51,9,12,100,200,GHOST_kButtonMaskLeft,false,&win,&event);
  assert(ghost_shared_state_updates==before_lift&&!tagged&&modal_release_calls==0);
  assert(replacement.ipad_pencil_paint_serial==52&&
         replacement_stroke.line_finishes==0&&replacement_stroke.completed==0);
}
""")


if __name__ == "__main__":
    unittest.main(verbosity=2)
