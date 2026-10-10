"""Execute real HUD receipts, native numeric terminal/restoration/dispatch seams.

Native widget motion/RNA storage/Redo decode are explicit fixture boundaries.
The separate stock GUI probe checks native Escape geometry and one-step history.
These checks do not establish UIKit or target modal acceptance.
"""
import os,sys,unittest
from pathlib import Path
repo=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(repo/'build'))
import test_pencil_hud_fields as fields
from test_compact_shelf import function
import test_ipad_panels

H=fields.HANDLERS
WORLD=fields.WORLD.replace('#define WITH_APPLE_CROSSPLATFORM',r'''#define WITH_APPLE_CROSSPLATFORM
#define USE_DRAG_MULTINUM
#define USE_ALLSELECT
inline constexpr int EVT_ESCKEY=19,RIGHTMOUSE=20,
 BUTTON_STATE_EXIT=3,BUTTON_STATE_TEXT_EDITING=4;
struct uiHandleButtonMulti{enum{INIT_UNSET,INIT_SETUP,INIT_ENABLE,INIT_DISABLE};
 int init=INIT_UNSET;bool has_mbuts=false;void*mbuts=nullptr,*bs_mbuts=nullptr;};
struct SelectionElements{bool empty=true;bool is_empty()const{return empty;}};''')
WORLD=WORLD.replace('struct Active{int state=BUTTON_STATE_HIGHLIGHT;ARegion*region=nullptr;};',r'''struct Active{int state=BUTTON_STATE_HIGHLIGHT;ARegion*region=nullptr;
 uiHandleButtonMulti multi_data;struct{bool is_enabled=false;SelectionElements elems;}select_others;
 bool cancel=false,escapecancel=false,applied=false,dragchange=false,applied_interactive=false;
 double value=2,origvalue=2;float vec[3]={},origvec[3]={};int retval=0;
 struct{char*edit_string=nullptr,*original_string=nullptr;}text_edit;
 Active(int state=BUTTON_STATE_HIGHLIGHT,ARegion*region=nullptr):state(state),region(region){} };
using uiHandleButtonData=Active;''')
WORLD=WORLD.replace('int type=LEFTMOUSE,val=KM_PRESS,xy[2]={20,20};','int flag=0,type=LEFTMOUSE,val=KM_PRESS,xy[2]={20,20};')
WORLD=WORLD.replace('bool ipad_callback_retired=false;int flag=0;', 'bool ipad_callback_retired=false;int flag=0,retval=1;')

def block(source,needle):
    start=source.index(needle);opening=source.index('{',start);depth=0
    for pos in range(opening,len(source)):
        if source[pos]=='{':depth+=1
        if source[pos]=='}':
            depth-=1
            if not depth:return source[start:pos+1]
    raise AssertionError(needle)

def terminals(signature):
    fn=function(H,signature)
    start=fn.index('    const bool pointer_cancel =')
    end=fn.index('    else if ((event->type == MOUSEMOVE)',start)
    return fn[start:end]

RESTORE=block(function(H,'static void ui_apply_but('),'  if (data->cancel) {')
apply=function(H,'static void ui_apply_but(')
NORMAL_APPLY=apply[apply.index('    if (interactive) {'):apply.index('#ifdef USE_ALLSELECT',apply.index('    if (interactive) {'))]
APPLY_NUM=function(H,'static void ui_apply_but_NUM(')
DEFER=block(H,'    if (after.handle_func && allowed()) {')
EXIT=function(H,'static void button_activate_exit(')
EXIT_APPLY=block(EXIT,'  if (!onfree) {')
EXIT_HISTORY=EXIT[EXIT.index('  if (!onfree && !data->cancel) {'):EXIT.index('#ifdef USE_ALLSELECT',EXIT.index('  if (!onfree && !data->cancel) {'))]
# The full native history body contains multi/button/autokey operations unrelated
# to this cancellation; execute its unchanged first Undo/autokey calls/condition.
EXIT_HISTORY=EXIT_HISTORY[:EXIT_HISTORY.index('#ifdef USE_ALLSELECT')] if '#ifdef USE_ALLSELECT' in EXIT_HISTORY else EXIT_HISTORY
EXIT_HISTORY=EXIT_HISTORY.split('#ifdef USE_ALLSELECT')[0]
EXIT_HISTORY=EXIT_HISTORY[:EXIT_HISTORY.index('#ifdef')] if '#ifdef' in EXIT_HISTORY else EXIT_HISTORY
EXIT_HISTORY+='  }\n'

class PencilHUDCancelTests(unittest.TestCase):
    def run_native(self,body):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(
            WORLD+fields.FIELD+fields.OWNER+fields.EVENT+fields.FIXTURE.replace(
                '(void)&ui_ipad_hud_native_repeat;',
                '(void)&ui_ipad_hud_native_repeat; (void)&ui_ipad_hud_numeric_pointer_terminal; (void)&ui_ipad_hud_bound_numeric;')+body)

    def test_frozen_cancel_producer_after_recognizer_reset(self):
        ios=fields.source('intern/ghost/intern/GHOST_WindowIOS.mm')
        raw=function(ios,'- (void)cancelPointerCapture')
        body=raw[raw.index('{')+1:raw.rindex('}')]
        body=body.replace('[self cancelRingHover];','')
        body=body.replace('[tap_gesture_recognizer invalidateTouchStream];','recognizer = {};')
        body=body.replace('[pan_gesture_recognizer invalidateTouchStream];','recognizer = {};')
        begin=body.index('  if (ring_capture.finish())')
        end=body.index('  const auto end = pointer_capture.finish(true);')
        body=body[:begin]+body[end:]
        body=body.replace('[self generateUserInputEvents:release];',
                  'events.push_back(release); if (release.pencil_paint.valid()) pencil_paint_enqueued_down = false;')
        header=fields.source('intern/ghost/GHOST_NavigationIOS.hh').replace('#pragma once','')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(header+r'''
#include <cassert>
struct CGPoint{double x,y;};using CGFloat=double;
CGPoint CGPointMake(double x,double y){return{x,y};}
struct GHOST_TabletData{int pressure=0;};
bool pencil_paint_enqueued_down=true;
CGPoint pencil_paint_last_location{};
GHOST_TabletData pencil_paint_last_tablet{};
ghost::ios::PencilPaintContact pencil_paint_enqueued{};
struct UserInputEvent{enum class EventTypes{LEFT_BUTTON_UP};
 uint64_t hud_generation=0,hud_serial=0;bool cancelled=false,direct_finger=false;
 CGPoint location{};bool tablet_snapshot_valid=false;GHOST_TabletData tablet_snapshot{};
 ghost::ios::PencilPaintContact pencil_paint{};
 UserInputEvent(const CGPoint*loc,const CGPoint*,const CGFloat*,bool)
     :location(loc?*loc:CGPointMake(-1.0,-1.0)){}
 void set_tablet_snapshot(const GHOST_TabletData &sample){tablet_snapshot=sample;tablet_snapshot_valid=true;}
 void add_event(EventTypes){} };
int main(){
 ghost::ios::PointerCapture pointer_capture;
 ghost::ios::HUDContact pointer_hud_contact,recognizer;bool pointer_finger_contact=true;
 double mouse_cursor_x=12,mouse_cursor_y=13;
 std::vector<UserInputEvent>events;
 auto cancel=[&](){BODY};
 for(int i=1;i<=10000;++i){
  pencil_paint_enqueued={uint64_t(i),71,99,40,50};pencil_paint_enqueued_down=true;
  pencil_paint_last_location=CGPointMake(40+i,50+i);pencil_paint_last_tablet={i};
  pointer_capture.begin(ghost::ios::PointerCaptureKind::Navigation);
  pointer_hud_contact={71,uint64_t(i),40,50};recognizer={99,9999,80,90};
  cancel();assert(!recognizer.generation&&!pointer_hud_contact.serial);
  assert(events.back().cancelled&&events.back().hud_generation==71&&events.back().hud_serial==uint64_t(i));
  const UserInputEvent &paint_terminal=events[events.size()-2];
  assert(paint_terminal.cancelled&&paint_terminal.pencil_paint.serial==uint64_t(i));
  assert(paint_terminal.pencil_paint.generation==71&&paint_terminal.pencil_paint.region==99);
  assert(paint_terminal.pencil_paint.origin_x==40&&paint_terminal.location.x==40+i);
  assert(paint_terminal.tablet_snapshot_valid&&paint_terminal.tablet_snapshot.pressure==i);
  assert(!pencil_paint_enqueued_down);
  auto count=events.size();cancel();assert(events.size()==count);
 }
}
'''.replace('BODY',body))
        pan=function(ios,'- (void)handlePan:')
        self.assertIn('pointer_hud_contact = [sender hudContact];',pan)
        self.assertIn('pointer.hud_serial = pointer_hud_contact.serial;',pan)
        self.assertIn('if (pointer_capture.ended) { pointer_hud_contact = {}; pointer_finger_contact = false; }',pan)

    def test_cancelled_uncaptured_pencil_terminal_enters_ghost_once(self):
        ios = fields.source('intern/ghost/intern/GHOST_WindowIOS.mm')
        enqueue = function(ios, '- (void)generateUserInputEvents:')
        sample_owner = enqueue[
            enqueue.index('    const GHOST_TabletData event_tablet ='):
            enqueue.index('    for (int i = 0;', enqueue.index('    const GHOST_TabletData event_tablet ='))]
        pointer_gate = block(enqueue, '      if (pointer_event) {')
        release_start = enqueue.index('        case UserInputEvent::EventTypes::LEFT_BUTTON_UP:')
        release_end = enqueue.index('        case UserInputEvent::EventTypes::PINCH_GESTURE:', release_start)
        release_case = enqueue[release_start:release_end]

        cancel = function(ios, '- (void)cancelPointerCapture\n{')
        cancel_body = cancel[cancel.index('{') + 1:cancel.rindex('}')]
        cancel_body = cancel_body.replace('[self cancelRingHover];', '')
        cancel_body = cancel_body.replace('[tap_gesture_recognizer invalidateTouchStream];', 'reset_tap();')
        cancel_body = cancel_body.replace('[pan_gesture_recognizer invalidateTouchStream];', 'reset_pan();')
        ring_start = cancel_body.index('  if (ring_capture.finish()) {')
        ring_end = cancel_body.index('  const auto end = pointer_capture.finish(true);', ring_start)
        cancel_body = cancel_body[:ring_start] + cancel_body[ring_end:]
        cancel_body = cancel_body.replace('[self generateUserInputEvents:release];',
                                          'generateUserInputEvents(release);')

        navigation = fields.source('intern/ghost/GHOST_NavigationIOS.hh').replace('#pragma once', '')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(navigation + r'''
#include <algorithm>
#include <cassert>
#include <cstdint>
#include <vector>
using CGFloat = double;
struct CGPoint { double x=0, y=0; };
CGPoint CGPointMake(double x,double y){return {x,y};}
struct GHOST_TabletData { float pressure=1; };
const GHOST_TabletData GHOST_TABLET_DATA_NONE{};
using GHOST_SystemHandle = void *;
enum { GHOST_kEventButtonUp=3, GHOST_kButtonMaskLeft=1 };
struct GHOST_EventButton {
  int type,button; GHOST_TabletData tablet; bool cancelled,direct_tool;
  uint64_t hud_generation,hud_serial,finger_generation,pencil_serial,pencil_generation;
  bool direct_finger; uintptr_t pencil_region; int32_t origin_x,origin_y;
  GHOST_EventButton(uint64_t,int event_type,void*,int event_button,GHOST_TabletData event_tablet,
      bool is_cancelled=false,bool is_direct_tool=false,uint64_t hg=0,uint64_t hs=0,
      bool is_direct_finger=false,uint64_t fg=0,uint64_t ps=0,uint64_t pg=0,
      uintptr_t pr=0,int32_t ox=0,int32_t oy=0)
    :type(event_type),button(event_button),tablet(event_tablet),cancelled(is_cancelled),
     direct_tool(is_direct_tool),hud_generation(hg),hud_serial(hs),finger_generation(fg),
     pencil_serial(ps),pencil_generation(pg),direct_finger(is_direct_finger),
     pencil_region(pr),origin_x(ox),origin_y(oy){}
};
struct EventQueue { std::vector<GHOST_EventButton*> events;
  void pushEvent(GHOST_EventButton* event){events.push_back(event);} };
struct GHOST_System { EventQueue *queue=nullptr;
  void pushEvent(GHOST_EventButton* event){queue->pushEvent(event);} };
uint64_t GHOST_GetMilliSeconds(void*){return 1;}
void reset_tap(){}
void reset_pan(){}
struct UserInputEvent {
  enum class EventTypes { CURSOR_MOVE, LEFT_BUTTON_DOWN, LEFT_BUTTON_UP, PINCH_GESTURE };
  EventTypes event_list[2]{}; int num_events=0; CGPoint location{};
  bool pencil_used=false,tablet_snapshot_valid=false,cancelled=false,direct_tool=false,direct_finger=false;
  GHOST_TabletData tablet_snapshot{}; uint64_t hud_generation=0,hud_serial=0,finger_paint_generation=0;
  ghost::ios::PencilPaintContact pencil_paint{};
  UserInputEvent(const CGPoint *loc,const CGPoint*,const CGFloat*,bool pencil)
    :location(loc?*loc:CGPoint{}),pencil_used(pencil){}
  void set_tablet_snapshot(const GHOST_TabletData &value){tablet_snapshot=value;tablet_snapshot_valid=true;}
  void add_event(EventTypes value){event_list[num_events++]=value;}
};
struct Input {
  GHOST_System *system=nullptr; void *window=nullptr; GHOST_TabletData tablet_data{};
  bool pencil_paint_enqueued_down=false;
  ghost::ios::PencilPaintContact pencil_paint_enqueued{}; uint64_t pencil_paint_retired_serial=0;
  CGPoint pencil_paint_last_location{}; GHOST_TabletData pencil_paint_last_tablet{};
  ghost::ios::PointerCapture pointer_capture; ghost::ios::HUDContact pointer_hud_contact;
  bool pointer_finger_contact=false; double mouse_cursor_x=0,mouse_cursor_y=0;
  void generateUserInputEvents(const UserInputEvent &event_info){
''' + sample_owner + r'''
    for(int i=0;i<event_info.num_events;i++){
      const auto event_type=event_info.event_list[i];
      const bool pointer_event=event_type==UserInputEvent::EventTypes::CURSOR_MOVE ||
        event_type==UserInputEvent::EventTypes::LEFT_BUTTON_DOWN ||
        event_type==UserInputEvent::EventTypes::LEFT_BUTTON_UP;
''' + pointer_gate + r'''
      switch(event_type){
''' + release_case + r'''
        default: break;
      }
    }
  }
  void cancelPointerCapture(){
''' + cancel_body + r'''
  }
};
int main(){
  EventQueue queue; GHOST_System system{&queue}; Input input; input.system=&system; input.window=reinterpret_cast<void*>(1);
  const ghost::ios::PencilPaintContact old_contact{41,71,99,40,50};
  input.pencil_paint_enqueued=old_contact; input.pencil_paint_enqueued_down=true;
  input.pencil_paint_last_location=CGPointMake(42,53); input.pencil_paint_last_tablet.pressure=.37f;
  input.cancelPointerCapture();
  assert(queue.events.size()==1);
  const GHOST_EventButton &cancelled=*queue.events.front();
  assert(cancelled.type==GHOST_kEventButtonUp&&cancelled.button==GHOST_kButtonMaskLeft&&cancelled.cancelled);
  assert(cancelled.pencil_serial==41&&cancelled.pencil_generation==71&&cancelled.pencil_region==99);
  assert(cancelled.origin_x==40&&cancelled.origin_y==50&&cancelled.tablet.pressure==.37f);
  assert(!input.pencil_paint_enqueued_down&&input.pencil_paint_retired_serial==41);
  input.cancelPointerCapture(); assert(queue.events.size()==1); // idempotent repeat

  const CGPoint release_location{42,53};
  UserInputEvent delayed(&release_location,nullptr,nullptr,true);
  delayed.set_tablet_snapshot(cancelled.tablet); delayed.pencil_paint=old_contact;
  delayed.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_UP);
  input.generateUserInputEvents(delayed); assert(queue.events.size()==1); // retired terminal

  const ghost::ios::PencilPaintContact next_contact{42,72,100,60,70};
  input.pencil_paint_enqueued=next_contact; input.pencil_paint_enqueued_down=true;
  UserInputEvent old_during_new(&release_location,nullptr,nullptr,true);
  old_during_new.set_tablet_snapshot(cancelled.tablet); old_during_new.pencil_paint=old_contact;
  old_during_new.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_UP);
  input.generateUserInputEvents(old_during_new);
  assert(queue.events.size()==1&&input.pencil_paint_enqueued_down&&
         ghost::ios::pencil_paint_contact_equal(input.pencil_paint_enqueued,next_contact));

  UserInputEvent next_end(&release_location,nullptr,nullptr,true);
  next_end.set_tablet_snapshot(cancelled.tablet); next_end.pencil_paint=next_contact;
  next_end.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_UP);
  input.generateUserInputEvents(next_end);
  assert(queue.events.size()==2&&!queue.events.back()->cancelled);
  assert(queue.events.back()->pencil_serial==42&&input.pencil_paint_retired_serial==42);
  for(auto *event:queue.events) delete event;
}
''')
        self.assertIn('release.cancelled = true;', cancel_body)
        self.assertIn('event_info.cancelled,', release_case)
        self.assertIn('contact.serial, contact.generation, contact.region,', release_case)

    def test_real_num_slider_cancel_and_native_restoration_dispatch(self):
        for signature in ('static int ui_do_but_NUM(','static int ui_do_but_SLI('):
            with self.subTest(signature=signature):
                self.run_native(r'''
double property[3]={7,2,9},geometry=2;int writes=0,queued=0,field_undos=0,autokeys=0;
void MEM_freeN(void*){assert(false);}void copy_v3_v3(float*a,const float*b){std::copy(b,b+3,a);}
void button_activate_state(bContext*,uiBut*b,int state){b->active->state=state;}
bool ui_but_string_set(bContext*,uiBut*,const char*){assert(false);return false;}
double ui_but_value_get(uiBut*b){return property[b->rnaindex];}
void ui_but_value_set(uiBut*b,double value){property[b->rnaindex]=value;++writes;}
void ui_but_update_edited(uiBut*){}
void ui_apply_but_func(bContext*,uiBut*){++queued;}
NUM_APPLY
void ui_apply_but(bContext*C,uiBlock*,uiBut*but,uiHandleButtonData*data,bool interactive){RESTORE
 else{NORMAL_APPLY}
 ui_apply_but_NUM(C,but,data);}
void ui_apply_but_undo(uiBut*){} // pinned native Redo template disables UI_BUT_UNDO
void ui_apply_but_autokey(bContext*,uiBut*){++autokeys;}
void native_exit(bContext*C,uiBut*but){auto*data=but->active;auto*block=but->block;
 bool onfree=false;EXIT_APPLY EXIT_HISTORY}
void terminal(bContext*C,uiBut*but,const wmEvent*event){
 auto*data=but->active;int click=0;TERMINAL
 if(click)button_activate_state(C,but,BUTTON_STATE_TEXT_EDITING);
 if(data->state==BUTTON_STATE_EXIT)native_exit(C,but);
}
void dispatch(Fixture&f){
 bContext*C=&f.C;
 struct{uiBlockHandleFunc handle_func=ED_undo_operator_repeat_cb_evt;uint64_t ipad_hud_field_uid=91;
 void*handle_func_arg;int retval=1;}after;after.handle_func_arg=&f.op;
 auto allowed=[&](){return ui_ipad_hud_field_allowed(&f.C,91);};
 while(queued){--queued;DEFER}
}
int main(){
 uint64_t serial=300;
 for(int motion:{0,1})for(int cancel:{0,1}){
  Fixture f;f.event.ipad_hud_serial=++serial;f.prop.length=3;f.but()->rnaindex=1;f.bind();
  assert(UI_ipad_hud_event_admit(&f.C,&f.win,&f.event));
  assert(f.active.multi_data.init==uiHandleButtonMulti::INIT_DISABLE);
  f.active.state=BUTTON_STATE_NUM_EDITING;f.active.origvalue=f.active.value=2;
  property[0]=7;property[1]=geometry=2;property[2]=9;writes=queued=autokeys=0;
  repeat_callback=[&](bContext*C,wmOperator*){geometry=property[1];
   C->wm->runtime->undo_stack->ipad_mutation_generation+=3;return true;};
  if(motion){for(double value:{3.25,6.5,-4.25}){
   f.active.value=value;f.active.dragchange=true;ui_apply_but(&f.C,&f.block,f.but(),&f.active,true);dispatch(f);
   assert(geometry==value);
  }}
  int prior_repeats=repeats,prior_writes=writes;f.event.val=KM_RELEASE;
  f.event.flag=cancel?WM_EVENT_IS_POINTER_CANCEL:0;
  assert(UI_ipad_hud_event_admit(&f.C,&f.win,&f.event));
  assert(ui_ipad_hud_button_input(&f.C,&f.event,f.but()));
  terminal(&f.C,f.but(),&f.event);dispatch(f);
  if(cancel){assert(f.active.cancel&&f.active.escapecancel&&f.active.state==BUTTON_STATE_EXIT);
   assert(property[1]==2&&geometry==2&&repeats-prior_repeats==motion);
   assert(writes-prior_writes==motion&&!autokeys);
  }else{assert(!f.active.cancel);assert(property[1]==(motion?-4.25:2));
   assert(repeats==prior_repeats&&writes==prior_writes);
   assert(f.active.state==(motion?BUTTON_STATE_EXIT:BUTTON_STATE_TEXT_EDITING));}
  assert(property[0]==7&&property[2]==9&&!field_undos);
  assert(!UI_ipad_hud_event_admit(&f.C,&f.win,&f.event)); // duplicate terminal
 }
 // Existing keyboard Escape is unchanged even without physical stamps.
 Fixture f;f.bind();f.active.state=BUTTON_STATE_NUM_EDITING;f.event.type=EVT_ESCKEY;
 f.event.val=KM_PRESS;f.event.ipad_hud_generation=f.event.ipad_hud_serial=0;
 terminal(&f.C,f.but(),&f.event);assert(f.active.cancel&&f.active.escapecancel);
}
'''.replace('NUM_APPLY',APPLY_NUM).replace('RESTORE',RESTORE).replace('NORMAL_APPLY',NORMAL_APPLY)
                .replace('EXIT_APPLY',EXIT_APPLY).replace('EXIT_HISTORY',EXIT_HISTORY)
                .replace('TERMINAL',terminals(signature)).replace('DEFER',DEFER))

    def test_stale_context_and_unproved_multifield_refuse_without_restore(self):
        self.run_native(r'''
int main(){
 for(int mutation=0;mutation<10;++mutation){
  Fixture f;f.bind();f.active.state=BUTTON_STATE_NUM_EDITING;
  f.event.val=KM_RELEASE;f.event.flag=WM_EVENT_IS_POINTER_CANCEL;
  switch(mutation){
   case 0:++f.undo.ipad_mutation_generation;break;
   case 1:f.C.tool="builtin.rotate";break;
   case 2:++f.C.object;break;
   case 3:++f.type.lifetime;break;
   case 4:++f.hr.ipad_hud_content_lifetime;break;
   case 5:f.active.multi_data.has_mbuts=true;break;
   case 6:f.active.multi_data.init=uiHandleButtonMulti::INIT_SETUP;break;
   case 7:f.active.multi_data.mbuts=&f;break;
   case 8:f.active.select_others.is_enabled=true;break;
   case 9:f.active.select_others.elems.empty=false;break;
  }
  assert(!ui_ipad_hud_button_input(&f.C,&f.event,f.but()));assert(!repeats);
  assert(ui_ipad_hud_fields.empty());assert(!f.active.cancel); // no native restoration frame
 }
 Fixture f;f.bind();f.active.state=BUTTON_STATE_NUM_EDITING;f.event.val=KM_RELEASE;
 f.event.flag=WM_EVENT_IS_POINTER_CANCEL;++f.event.ipad_hud_serial;
 assert(!UI_ipad_hud_event_admit(&f.C,&f.win,&f.event));assert(!repeats&&!frees);
}
''')

    def test_connected_single_field_propagation_policy(self):
        native=function(H,'static int ui_do_button(')
        self.assertIn('if (data && !ui_ipad_hud_bound_numeric(but))',native)
        apply=function(H,'static void ui_apply_but(')
        self.assertIn('data->select_others.elems.is_empty() && !ui_ipad_hud_bound_numeric(but)',apply)
        self.assertIn('if (!ui_ipad_hud_bound_numeric(but))\n    ui_selectcontext_apply',apply)
        text=function(H,'static void ui_textedit_begin(')
        self.assertIn('if (is_num_but && !ui_ipad_hud_bound_numeric(but))',text)

    def test_terminal_tombstone_survives_refusal_and_new_hardware_recovers(self):
        self.run_native(r'''
int main(){
 Fixture f;f.bind();assert(UI_ipad_hud_event_admit(&f.C,&f.win,&f.event));
 f.active.state=BUTTON_STATE_NUM_EDITING;f.event.val=KM_RELEASE;
 f.event.flag=WM_EVENT_IS_POINTER_CANCEL;
 assert(UI_ipad_hud_event_admit(&f.C,&f.win,&f.event));
 assert(ui_ipad_hud_numeric_pointer_terminal(&f.C,f.but(),&f.event));
 repeat_callback=[](bContext*,wmOperator*){return false;}; // native poll/jobs refusal, no history mutation
 auto mutation=f.undo.ipad_mutation_generation;
 assert(ui_ipad_hud_native_repeat(&f.C,91,&f.op));assert(ui_ipad_hud_fields.empty());
 assert(f.undo.ipad_mutation_generation==mutation);
 assert(!UI_ipad_hud_event_admit(&f.C,&f.win,&f.event));
 f.event.type=MOUSEMOVE;assert(!UI_ipad_hud_event_admit(&f.C,&f.win,&f.event));
 ++f.event.ipad_hud_serial;assert(UI_ipad_hud_event_admit(&f.C,&f.win,&f.event));
 // A fresh completed Pencil owner still guards keyboard continuation.
 f.but()->active=&f.active;f.but()->ipad_callback_retired=false;f.but()->flag=0;
 f.event.type=LEFTMOUSE;f.event.val=KM_PRESS;f.active.state=BUTTON_STATE_HIGHLIGHT;f.bind();
 f.active.state=BUTTON_STATE_NUM_EDITING;f.event.val=KM_RELEASE;f.event.flag=0;
 assert(!ui_ipad_hud_numeric_pointer_terminal(&f.C,f.but(),&f.event));
 repeat_callback={};assert(ui_ipad_hud_native_repeat(&f.C,91,&f.op));
 f.active.state=BUTTON_STATE_TEXT_EDITING;f.event.ipad_hud_generation=f.event.ipad_hud_serial=0;
 f.event.type=EVT_ESCKEY;f.event.val=KM_PRESS;
 assert(ui_ipad_hud_button_input(&f.C,&f.event,f.but()));assert(ui_ipad_hud_bound_numeric(f.but()));
 // After native exit/callbacks a new hardware HIGHLIGHT press is independent.
 f.active.state=BUTTON_STATE_HIGHLIGHT;f.event.type=LEFTMOUSE;
 assert(ui_ipad_hud_button_input(&f.C,&f.event,f.but()));assert(!ui_ipad_hud_bound_numeric(f.but()));
 assert(!f.but()->ipad_callback_retired&&!f.but()->flag);
}
''')

    def test_refused_metadata_terminal_and_motion_cannot_reenter_compositor(self):
        self.run_native(r'''
int main(){
 for(int release:{0,1}){
  ui_ipad_hud_contacts.clear();Fixture f;f.bind();
  assert(UI_ipad_hud_event_admit(&f.C,&f.win,&f.event));
  f.active.state=BUTTON_STATE_NUM_EDITING;f.prop.identifier="changed_schema";
  f.event.type=release?LEFTMOUSE:MOUSEMOVE;f.event.val=release?KM_RELEASE:0;
  assert(!UI_ipad_hud_event_admit(&f.C,&f.win,&f.event));
  assert(ui_ipad_hud_fields.empty()&&!repeats&&f.C.pixels_ready);
  f.event.type=LEFTMOUSE;f.event.val=KM_RELEASE;
  assert(!UI_ipad_hud_event_admit(&f.C,&f.win,&f.event));
  f.event.type=MOUSEMOVE;assert(!UI_ipad_hud_event_admit(&f.C,&f.win,&f.event));
  ++f.event.ipad_hud_serial;assert(UI_ipad_hud_event_admit(&f.C,&f.win,&f.event));
 }
}
''')

    def test_actual_hud_calloc_type_and_missing_data_recovery(self):
        hud=fields.source('source/blender/editors/interface/regions/interface_region_hud.cc')
        declaration=block(hud,'struct HudRegionData {')+';'
        refresh=function(hud,'void UI_ipad_corner_hud_refresh(')
        redo=function(hud,'ARegion *ED_area_type_hud_redo_region_find(')
        self.assertNotIn('PANEL_ACTIVE',hud)
        self.assertIn('has_active_panel |= UI_panel_is_active(panel);',hud)
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#include <algorithm>
#include <cassert>
#include <cstdlib>
#include <type_traits>
#include <vector>
#define WITH_APPLE_CROSSPLATFORM
#define BLI_assert(v) assert(v)
inline constexpr int RGN_TYPE_HUD=1,RGN_TYPE_WINDOW=2,RGN_FLAG_HIDDEN_BY_USER=1,
 RGN_FLAG_HIDDEN=2,RGN_FLAG_TOO_SMALL=4;
struct ARegionType{};struct View2D{};
struct rcti{int xmin=0,xmax=0,ymin=0,ymax=0;};
void BLI_rcti_translate(rcti*r,int x,int y){r->xmin+=x;r->xmax+=x;r->ymin+=y;r->ymax+=y;}
struct Runtime{ARegionType*type=nullptr;bool visible=false;
 struct{int xmin=7,ymin=9;}ipad_canvas_rect;float offset_x=0,offset_y=0;};
struct ARegion{int regiontype=RGN_TYPE_HUD,flag=0;Runtime*runtime=nullptr;
 void*regiondata=nullptr;View2D v2d;rcti winrct{};};
struct ScrArea{int type=1;std::vector<ARegion*>regions;};
struct bContext{ScrArea*area;ARegion*canvas;bool supported=true;};
struct wmWindowManager{};struct wmWindow{};
wmWindowManager wm;wmWindow win;
wmWindowManager*CTX_wm_manager(bContext*){return &wm;}
wmWindow*CTX_wm_window(bContext*){return &win;}
ScrArea*CTX_wm_area(bContext*C){return C->area;}
ARegion*UI_ipad_corner_canvas(bContext*C){return C->supported?C->canvas:nullptr;}
ARegion*BKE_area_find_region_type(ScrArea*a,int kind){for(auto*r:a->regions)if(r->regiontype==kind)return r;return nullptr;}
ARegionType art;bool type_ready=true;int allocations=0,inits=0,redraws=0,sizes=0;
ARegionType*BKE_regiontype_from_id(int,int){return type_ready?&art:nullptr;}
ARegion new_region;Runtime new_runtime;
ARegion*hud_region_add(ScrArea*a){new_region={RGN_TYPE_HUD,RGN_FLAG_HIDDEN,&new_runtime,nullptr,{}};
 a->regions.push_back(&new_region);return &new_region;}
template<class T>T*MEM_callocN(const char*){static_assert(std::is_trivial_v<T>);++allocations;return static_cast<T*>(std::calloc(1,sizeof(T)));}
void ED_area_tag_region_size_update(ScrArea*,ARegion*){++sizes;}
void ED_region_tag_redraw(ARegion*){++redraws;}
void ED_area_update_region_sizes(wmWindowManager*,wmWindow*,ScrArea*){}
void hud_region_hide(ARegion*r){r->flag|=RGN_FLAG_HIDDEN;}
void ED_region_floating_init(ARegion*){++inits;}
void UI_view2d_scroller_size_get(View2D*,bool,float*x,float*y){*x=3;*y=5;}
bool ED_ipad_hud_exposed_rect(bContext*,wmWindow*,ScrArea*,const ARegion*c,const rcti&,rcti&e){
 e={c->runtime->ipad_canvas_rect.xmin,999,c->runtime->ipad_canvas_rect.ymin,999};
 BLI_rcti_translate(&e,c->winrct.xmin,c->winrct.ymin);return true;
}
ARegion*area_find_region_by_type_and_index_hint(const ScrArea*a,short kind,int hint){
 int index=0;ARegion*first=nullptr;
 for(auto*r:a->regions){if(r->regiontype==kind){
  if(!first)first=r;
  if(index++==hint)return r;
 }}
 return first;
}
DECLARATION
static_assert(std::is_trivial_v<HudRegionData> && std::is_trivially_copyable_v<HudRegionData>);
REFRESH
REDO
int main(){
 Runtime cr,hr;ARegion canvas{RGN_TYPE_WINDOW,0,&cr,nullptr,{}};
 ARegion hud{RGN_TYPE_HUD,0,&hr,nullptr,{}};ScrArea area{1,{&canvas,&hud}};bContext C{&area,&canvas};
 assert(!ED_area_type_hud_redo_region_find(&area,&hud));
 for(int i=0;i<10000;++i){
  // Exact native copy/read leaves an existing region with null temporary data.
  assert(!hud.regiondata);hr.visible=true;auto before=inits;
  UI_ipad_corner_hud_refresh(&C,&area);auto*data=static_cast<HudRegionData*>(hud.regiondata);
  assert(data&&data->regionid==-1&&data->region_index_hint==-1&&data->redo_suppressed);
  assert(inits==before+1&&hr.visible&&hr.offset_x==7&&hr.offset_y==9);
  assert(!ED_area_type_hud_redo_region_find(&area,&hud));
  data->regionid=RGN_TYPE_WINDOW;data->region_index_hint=0;data->redo_suppressed=false;
  before=allocations;UI_ipad_corner_hud_refresh(&C,&area);assert(allocations==before);
  assert(data->regionid==RGN_TYPE_WINDOW&&!data->redo_suppressed);
  assert(ED_area_type_hud_redo_region_find(&area,&hud)==&canvas);
  std::free(hud.regiondata);hud.regiondata=nullptr;
 }
 auto before=allocations;hud.flag=RGN_FLAG_HIDDEN_BY_USER;
 UI_ipad_corner_hud_refresh(&C,&area);assert(!hud.regiondata&&allocations==before);
 hud.flag=0;C.supported=false;UI_ipad_corner_hud_refresh(&C,&area);assert(!hud.regiondata);
 C.supported=true;type_ready=false;UI_ipad_corner_hud_refresh(&C,&area);assert(!hud.regiondata);
 type_ready=true;area.regions={&canvas};UI_ipad_corner_hud_refresh(&C,&area);
 assert(new_region.regiondata&&new_runtime.type==&art);std::free(new_region.regiondata);
}
'''.replace('DECLARATION',declaration).replace('REFRESH',refresh).replace('REDO',redo))

if __name__=='__main__':unittest.main()
