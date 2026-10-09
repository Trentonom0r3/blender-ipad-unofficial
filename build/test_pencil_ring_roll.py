"""Execute contact-only ring policy at actual UIKit publisher/native consumers.

Objective-C selectors are translated fixture boundaries, not device evidence.
"""
import unittest
from test_compact_shelf import function
from test_touch_extrude import changed_source
from test_pencil_barrel_reset import POLICY, BROWSE, GHOST, TYPES, CONSTANTS
import test_ipad_panels

IOS = changed_source('intern/ghost/intern/GHOST_WindowIOS.mm')
NATIVE = changed_source('source/blender/editors/interface/regions/interface_region_menu_pie.cc')

class PencilRingRollTests(unittest.TestCase):
    def run_cpp(self, code):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(
            POLICY + BROWSE + GHOST + TYPES + CONSTANTS + code)

    def test_hover_sensor_and_cancel_never_publish_navigation_or_touch_owners(self):
        start = IOS.index('- (void)cancelRingHover\n', IOS.index('@implementation GHOSTUIWindow'))
        code = IOS[start:IOS.index('- (void)handleHover:', start)]
        code = code.replace('- (void)cancelRingHover', 'void cancelRingHover()')
        code = code.replace('- (void)handlePencilRingHover:(GHOSTUIHoverGestureRecognizer *)sender',
                            'void sensor(void *sender)')
        self.run_cpp(r'''
#include <cassert>
ghost::ios::PencilRingContact ring_hover_capture, ring_capture;
''' + code + r'''
int main() {
 int owner=1;
 assert(ghost::ios::publish_pencil_ring(&owner,{7,1,{0,0,400,400},true}));
 auto receipt=ghost::ios::pencil_ring_presentation(&owner);
 assert(ring_capture.begin(receipt,50,50));
 const auto contact=ring_capture.serial;
 for(int i=0;i<10000;++i){
  assert(ring_hover_capture.begin(receipt,50,50));
  sensor(reinterpret_cast<void *>(1)); // No sender/view/window dereference.
  assert(!ring_hover_capture.captured&&ring_capture.captured&&ring_capture.serial==contact);
  assert(ring_hover_capture.begin(receipt,50,50));cancelRingHover();
  assert(!ring_hover_capture.captured&&ring_capture.captured);
 }
 sensor(nullptr);cancelRingHover();
}
''')
        self.assertNotIn('pushEvent', code)
        self.assertNotIn('rollAngle', code)
        self.assertNotIn('initWithTarget:self action:@selector(handlePencilRingHover:)', IOS)

    def test_old_roll_packets_are_consumed_without_accessing_popup_contact_or_scene(self):
        helper = function(NATIVE, 'bool ui_ipad_ring_roll_input(')
        self.run_cpp(r'''
#include <cassert>
struct bContext {};struct uiBlock {};struct wmEvent {};
''' + helper + r'''
int main(){
 for(int i=0;i<10000;++i){
  assert(ui_ipad_ring_roll_input(nullptr,nullptr,nullptr));
  assert(ui_ipad_ring_roll_input(reinterpret_cast<bContext *>(1),
    reinterpret_cast<uiBlock *>(1),reinterpret_cast<wmEvent *>(1)));
 }
}
''')
        contact = function(NATIVE, 'bool ui_ipad_ring_contact_input(')
        self.assertIn('return ui_ipad_ring_roll_input(C, block, event);', contact)
        self.assertIn('data->browse.press(', contact)
        self.assertIn('data->browse.motion(', contact)
        self.assertIn('data->browse.release(', contact)

    def test_ordinary_hover_keeps_cursor_feedback_without_navigation_or_activation(self):
        start = IOS.index('- (void)handleHover:', IOS.index('@implementation GHOSTUIWindow'))
        end = IOS.index('\n- (', start + 5)
        code = IOS[start:end]
        code = code.replace('- (void)handleHover:(GHOSTUIHoverGestureRecognizer *)sender',
                            'void hover(Sender *sender)')
        code = code.replace('[pan_gesture_recognizer pencilContactDown]', 'pencil_touch')
        code = code.replace('[sender getScaledTouchPoint:window]', 'sender->point')
        code = code.replace('[self generateUserInputEvents:event_info]', 'generate(event_info)')
        code = code.replace('sender.state', 'sender->state').replace('nil', 'nullptr')
        self.run_cpp(r'''
#include <cassert>
#define IOS_INPUT_LOG(...) ((void)0)
struct CGPoint{double x,y;};
constexpr int UIGestureRecognizerStateBegan=1,UIGestureRecognizerStateChanged=2,
 UIGestureRecognizerStateEnded=3,UIGestureRecognizerStateCancelled=4,UIGestureRecognizerStateFailed=5;
constexpr int GHOST_kTabletModeStylus=1;
struct Tablet{int Active=0;};Tablet tablet_data;const Tablet GHOST_TABLET_DATA_NONE{};
ghost::ios::PointerCapture pointer_capture;
void *current_pencil_touch=nullptr;bool pencil_touch=false,mouse_left_pressed=false,
 external_mouse_connected=false,mouse_pos_valid=false;
double mouse_cursor_x=0,mouse_cursor_y=0;int moves=0;
struct Sender{int state;CGPoint point;};
struct UserInputEvent{enum class EventTypes{CURSOR_MOVE};
 CGPoint location;UserInputEvent(CGPoint *p,void *,void *,bool):location(*p){}
 void add_event(EventTypes t){assert(t==EventTypes::CURSOR_MOVE);}};
void generate(const UserInputEvent &){++moves;}
''' + code + r'''
int main(){
 Sender sender{UIGestureRecognizerStateBegan,{50,50}};
 for(int i=0;i<10000;++i){
  sender.point={double(i),double(10000-i)};hover(&sender);
  assert(moves==i+1&&mouse_pos_valid&&mouse_cursor_x==i&&mouse_cursor_y==10000-i);
 }
 current_pencil_touch=reinterpret_cast<void *>(1);hover(&sender);assert(moves==10000);
 current_pencil_touch=nullptr;external_mouse_connected=true;hover(&sender);
 assert(moves==10001&&tablet_data.Active==0);
 sender.state=UIGestureRecognizerStateEnded;hover(&sender);assert(moves==10001);
}
''')
        self.assertNotIn('PencilRingRoll', code)
        self.assertNotIn('rollAngle', code)
        self.assertNotIn('BUTTON_', code)

if __name__ == '__main__':
    unittest.main()
