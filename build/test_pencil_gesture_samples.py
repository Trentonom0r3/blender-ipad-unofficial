"""Execute shipped contact/sample policy, event snapshots and WM tablet conversion.

UIKit touch delivery/scheduling, native handlers and brush effects are outside the
portable fixtures. Wiring assertions bound actual recognizer and action consumers.
"""
import unittest
from pathlib import Path
import preflight
from test_touch_extrude import changed_source
from test_compact_shelf import function
import test_ipad_panels

IOS=changed_source('intern/ghost/intern/GHOST_WindowIOS.mm')
HEADER=changed_source('intern/ghost/GHOST_NavigationIOS.hh').replace('#pragma once','')
COMMON=r'''
#include <cassert>
#include <limits>
using namespace ghost::ios;
bool close(float a,float b){return std::abs(a-b)<0.00001f;}
'''

class PencilGestureSampleTests(unittest.TestCase):
 def run_cpp(self,body):
  test_ipad_panels.IPadWorkspacePanelsTests()._run_source(HEADER+COMMON+body)
 def test_frozen_actor_foreign_samples_and_repeated_reset(self):
  self.run_cpp(r'''
int main(){GestureContact c;auto pen=pencil_sample(.2,1,.7,.4);
 for(uintptr_t key=1;key<=10000;++key){
  assert(!c.begin(TouchDevice::Unknown,key,pen));assert(!c.pencil());
  assert(c.begin(TouchDevice::Finger,key,pen));
  assert(!c.begin(TouchDevice::Pencil,key+1,pen));
  c.update(key+1,pen);c.update(key,pen);
  assert(!c.pencil()&&!c.latest.valid&&!c.peak.valid);
  c.end(key+1);assert(c.down);c.end(key);assert(!c.down);c.reset();
  assert(c.begin(TouchDevice::Pencil,key,pen));assert(c.pencil_down());
  c.update(key+1,pencil_sample(1,1,1,1));assert(close(c.latest.pressure,.2));
  c.end(key+1);assert(c.pencil_down());c.end(key);
  assert(c.pencil()&&!c.pencil_down());assert(close(c.latest.pressure,.2));
  c.reset();assert(!c.touch&&!c.down&&!c.latest.valid&&!c.peak.valid);
  assert(c.begin(TouchDevice::Indirect,key,pen));assert(!c.pencil());c.reset();
 }
}
''')
 def test_tap_peak_pan_latest_zero_and_unknown_force(self):
  self.run_cpp(r'''
int main(){GestureContact c;
 c.begin(TouchDevice::Pencil,8,pencil_sample(.04,1,0,1.57079632679));
 c.update(8,pencil_sample(.3,1,.4,.5));c.update(8,pencil_sample(.18,1,.6,.7));
 assert(close(c.peak.pressure,.3)&&close(c.latest.pressure,.18));
 auto peak=c.peak;c.update(8,pencil_sample(0,1,1,.9));c.end(8);
 assert(c.latest.valid&&c.latest.pressure==0&&close(c.peak.pressure,.3));
 assert(close(c.peak.xtilt,peak.xtilt)&&close(c.peak.ytilt,peak.ytilt));
 c.reset();c.begin(TouchDevice::Pencil,9,pencil_sample(0,1,0,0));
 assert(c.peak.valid&&c.peak.pressure==0); // no zero -> full promotion
 assert(pencil_sample(0,0,0,0).pressure==1); // unknown calibration, not real zero
 c.reset();c.begin(TouchDevice::Pencil,10,pencil_sample(0,0,0,0));
 assert(c.peak.pressure==1&&!c.peak.calibrated);
 c.update(10,pencil_sample(0,1,0,0));assert(c.peak.pressure==0&&c.peak.calibrated);
 c.update(10,pencil_sample(.2,1,.3,.4));c.update(10,pencil_sample(0,0,1,1));
 assert(close(c.peak.pressure,.2)&&c.peak.calibrated); // no fallback inflation
 c.reset();c.begin(TouchDevice::Pencil,9,pencil_sample(0,1,0,0));
 assert(pencil_sample(4,1,0,0).pressure==1);
 assert(pencil_sample(-.1,1,0,0).pressure==0);
 auto old=c.latest;float nan=std::numeric_limits<float>::quiet_NaN();
 c.update(9,{true,nan,0,0});assert(c.latest.pressure==old.pressure);
 assert(!pencil_sample(1,1,nan,0).valid);
 c.update(9,{true,.5,4,-4});assert(c.latest.xtilt==1&&c.latest.ytilt==-1);
}
''')
 def test_actual_event_snapshot_packets_and_native_tablet_conversion(self):
  # Execute actual UserInputEvent fields/constructor/setter (unrelated
  # event-list assertion and Objective-C description formatting are omitted), producer selector and packet ctors and pinned native pressure preference curve.
  event=IOS[IOS.index('typedef struct UserInputEvent {'):IOS.index('  void add_event(EventTypes event_type)')]+ '} UserInputEvent;\n'
  select=IOS[IOS.index('    const GHOST_TabletData event_tablet ='):IOS.index('    for (int i = 0;',IOS.index('    const GHOST_TabletData event_tablet ='))]
  tablet=function(IOS,'static GHOST_TabletData ios_tablet_snapshot(')
  repo=Path(__file__).resolve().parents[1]
  wm=preflight.get_source(preflight.pinned_commit(repo), 'source/blender/windowmanager/intern/wm_event_system.cc', repo/'.cache/preflight', False).decode('utf-8')
  query=preflight.get_source(preflight.pinned_commit(repo), 'source/blender/windowmanager/intern/wm_event_query.cc', repo/'.cache/preflight', False).decode('utf-8')
  native=function(query,'float wm_pressure_curve(')+'\n'+function(wm,'constexpr wmTabletData wm_event_tablet_data_default()')+'\n'+function(wm,'void wm_tablet_data_from_ghost(')
  constructors=''
  for name in ('GHOST_EventButton','GHOST_EventCursor'):
   text=changed_source('intern/ghost/intern/'+name+'.hh')
   constructors+=text[text.index('class '+name+' :'):]+ '\n'
  self.run_cpp(r'''
using CGFloat=float;struct CGPoint{float x,y;};CGPoint CGPointMake(float x,float y){return{x,y};}
#define GHOST_ASSERT(c,...) assert(c)
enum{GHOST_kTabletModeNone=0,GHOST_kTabletModeStylus=1,EVT_TABLET_NONE=0};
struct GHOST_TabletData{int Active;float Pressure,Xtilt,Ytilt;};
const GHOST_TabletData GHOST_TABLET_DATA_NONE{0,1,0,0};
using GHOST_TEventType=int;using GHOST_TButton=int;struct GHOST_IWindow{};
struct GHOST_TEventButtonData{int button;GHOST_TabletData tablet;bool is_cancelled,is_direct_tool;uint64_t ipad_hud_generation,ipad_hud_serial;bool is_direct_finger=false;uint64_t ipad_finger_paint_generation=0,ipad_pencil_paint_serial=0,ipad_pencil_paint_generation=0;uintptr_t ipad_pencil_paint_region=0;int32_t ipad_pencil_paint_origin_x=0,ipad_pencil_paint_origin_y=0;};
struct GHOST_TEventCursorData{int32_t x,y;GHOST_TabletData tablet;bool is_direct_tool;uint64_t ipad_hud_generation,ipad_hud_serial;bool is_direct_finger=false;uint64_t ipad_finger_paint_generation=0,ipad_pencil_paint_serial=0,ipad_pencil_paint_generation=0;uintptr_t ipad_pencil_paint_region=0;int32_t ipad_pencil_paint_origin_x=0,ipad_pencil_paint_origin_y=0;};
struct GHOST_Event{void*data_=nullptr;GHOST_Event(uint64_t,int,GHOST_IWindow*){}};
namespace blender{struct float2{float x,y;float2()=default;float2(float a,float b):x(a),y(b){}};}
struct wmTabletData{int active;float pressure;blender::float2 tilt;bool is_motion_absolute;};
#define CLAMP(v,lo,hi) (v=std::clamp(v,lo,hi))
struct Preferences{float pressure_threshold_max=0,pressure_softness=0;}U; // numeric preferences only
'''+event+tablet+constructors+native+'\nusing ghost::ios::PencilPaintContact;PencilPaintContact pencil_paint_enqueued{};bool pencil_paint_enqueued_down=false;uint64_t pencil_paint_retired_serial=0;void *window=nullptr;\nGHOST_TabletData select(const UserInputEvent&event_info,GHOST_TabletData tablet_data){'+select+'(void)tagged_pencil;(void)same_contact;return event_tablet;}\n'+r'''
int main(){GHOST_IWindow w;GestureContact c;c.begin(TouchDevice::Pencil,3,pencil_sample(.2,1,.3,.4));
 auto own=ios_tablet_snapshot(c.latest);UserInputEvent evt(nullptr,nullptr,nullptr,true);evt.set_tablet_snapshot(own);
 auto foreign=ios_tablet_snapshot(pencil_sample(.9,1,1,.1));auto selected=select(evt,foreign);assert(close(selected.Pressure,.2));
 GHOST_EventButton down(1,2,&w,1,selected);GHOST_EventCursor move(1,2,&w,4,5,selected);
 evt.tablet_snapshot=foreign;c.reset(); // enqueued values cannot change
 auto *bd=static_cast<GHOST_TEventButtonData*>(down.data_);auto*cd=static_cast<GHOST_TEventCursorData*>(move.data_);
 assert(close(bd->tablet.Pressure,.2)&&close(cd->tablet.Pressure,.2));
 wmTabletData native{};wm_tablet_data_from_ghost(&bd->tablet,&native);
 assert(native.active==1&&native.is_motion_absolute&&close(native.pressure,.2));
 assert(close(native.tilt.x,own.Xtilt)&&close(native.tilt.y,own.Ytilt));
 U.pressure_threshold_max=.5;wm_tablet_data_from_ghost(&bd->tablet,&native);assert(close(native.pressure,.4));
 U.pressure_softness=.5;wm_tablet_data_from_ghost(&bd->tablet,&native);assert(close(native.pressure,std::sqrt(.4f)));
 U={};
 UserInputEvent finger(nullptr,nullptr,nullptr,false);finger.set_tablet_snapshot(foreign);
 auto no_pen=select(finger,foreign);wm_tablet_data_from_ghost(&no_pen,&native);
 assert(native.active==0&&native.pressure==1&&!native.is_motion_absolute);
 UserInputEvent legacy(nullptr,nullptr,nullptr,true);assert(close(select(legacy,foreign).Pressure,.9));
 auto zero=ios_tablet_snapshot(pencil_sample(0,1,0,0));wm_tablet_data_from_ghost(&zero,&native);assert(native.pressure==0);
}
''')
 def test_actual_recognizer_samples_precede_super_and_clear_on_reset(self):
  for name in ('Tap','Pan'):
   block=IOS.split('@implementation GHOSTUI'+name+'GestureRecognizer',1)[1].split('@end',1)[0]
   begin=function(block,'- (void)touchesBegan:')
   self.assertLess(begin.index('gesture_contact.begin('),begin.index('[super touchesBegan:'))
   self.assertIn('const bool fresh_contact = !touch_admission.active;',begin)
   self.assertIn('if (touches.count == 1)',begin)
   for phase in ('Moved','Ended','Cancelled'):
    body=function(block,'- (void)touches'+phase+':')
    self.assertLess(body.index('gesture_contact.update('),body.index('[super touches'+phase+':'))
    if phase!='Moved':self.assertLess(body.index('[super touches'+phase+':'),body.index('gesture_contact.end('))
   reset=function(block,'- (void)reset')
   self.assertLess(reset.index('gesture_contact.reset()'),reset.index('[super reset]'))
   self.assertNotIn('UITouch *pencil_touch',block)
   expected='gesture_contact.peak' if name=='Tap' else 'gesture_contact.latest'
   self.assertIn(expected,block)
 def test_actual_actions_do_not_borrow_view_pencil_and_preserve_owner_routes(self):
  # Require actual consumers, not just a disconnected policy.
  for sig in ('- (void)handleTap:(GHOSTUITapGestureRecognizer *)sender\n{', '- (void)handlePan:(GHOSTUIPanGestureRecognizer *)sender\n{'):
   body=function(IOS,sig)
   self.assertIn('[sender gestureUsesPencil]',body)
   self.assertIn('ios_tablet_snapshot([sender pencilSample])',body)
   self.assertIn('.set_tablet_snapshot(gesture_tablet)',body)
   self.assertNotIn('current_pencil_touch',body)
   self.assertNotIn('.force',body)
   self.assertIn('touchStreamAllowed',body)
   self.assertIn('ringContact',body)
   self.assertIn('hudContact',body)
  pan=function(IOS,'- (void)handlePan:(GHOSTUIPanGestureRecognizer *)sender\n{')
  self.assertEqual(pan.count('.set_tablet_snapshot(gesture_tablet)'),3)
  self.assertIn('pointer_capture.finish(sender.state != UIGestureRecognizerStateEnded)',pan)
  self.assertIn('if (!pencil_pan)',pan) # finger navigation preserved
  self.assertNotIn('pencilTouch',IOS)
  self.assertEqual(IOS.count('[pan_gesture_recognizer pencilContactDown]'),4)

if __name__=='__main__':unittest.main()
