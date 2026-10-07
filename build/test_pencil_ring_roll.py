"""Execute sensor packet/native roll seams; UIKit scheduling/device comfort are separate."""
import unittest
from test_compact_shelf import function
from test_touch_extrude import changed_source
from test_pencil_barrel_reset import POLICY,BROWSE,GHOST,TYPES,CONSTANTS
import test_ipad_panels

IOS=changed_source('intern/ghost/intern/GHOST_WindowIOS.mm')
NATIVE=changed_source('source/blender/editors/interface/regions/interface_region_menu_pie.cc')

class PencilRingRollTests(unittest.TestCase):
    def run_cpp(self,code):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(POLICY+BROWSE+GHOST+TYPES+CONSTANTS+code)

    def test_sensor_packets_follow_hover_lifetime_boundaries_and_reacquisition(self):
        start=IOS.index('- (void)cancelRingHover\n',IOS.index('@implementation GHOSTUIWindow'))
        end=IOS.index('- (void)handleHover:',start)
        code=IOS[start:end]
        # Only Objective-C message syntax and availability are mapped to fixtures;
        # ownership, serials, packet fields and branches execute the shipped body.
        code=code.replace('- (void)cancelRingHover','void cancelRingHover()')
        code=code.replace('- (void)handlePencilRingHover:(GHOSTUIHoverGestureRecognizer *)sender','void sensor(Sender *sender)')
        code=code.replace('[self cancelRingHover]','cancelRingHover()')
        code=code.replace('[pan_gesture_recognizer pencilTouch]','pencil_touch')
        code=code.replace('[sender getScaledTouchPoint:window]','sender->point')
        code=code.replace('@available(iOS 17.5, *)','ios175')
        code=code.replace('sender.view','sender->view').replace('sender.state','sender->state').replace('sender.rollAngle','sender->rollAngle')
        code=code.replace('system->','sensor_system->').replace('!system','!sensor_system')
        event=changed_source('intern/ghost/intern/GHOST_EventPencilRing.hh').replace('#pragma once','').replace('#include "GHOST_Event.hh"','')
        self.run_cpp(r'''
#include <cassert>
struct CGPoint{double x,y;};
constexpr int UIGestureRecognizerStateBegan=1,UIGestureRecognizerStateChanged=2,UIGestureRecognizerStateEnded=3;
struct GHOST_IWindow{void *view=this;void *getView(){return view;}};
using GHOST_WindowIOS=GHOST_IWindow;
constexpr int GHOST_kEventPencilRing=900;
struct GHOST_Event{void *data_=nullptr;GHOST_Event(uint64_t,int,GHOST_IWindow *){};virtual ~GHOST_Event()=default;};
'''+event+r'''
struct WindowManager{GHOST_WindowIOS *live=nullptr;bool getWindowFound(GHOST_WindowIOS *w){return w==live;}};
struct System{WindowManager manager;std::vector<GHOST_TEventPencilRingData> packets;WindowManager *getWindowManager(){return &manager;}uint64_t getMilliSeconds(){return 1;}void pushEvent(GHOST_EventPencilRing *e){packets.push_back(*static_cast<GHOST_TEventPencilRingData *>(e->data_));delete e;}};
System engine;System *sensor_system=&engine;GHOST_WindowIOS owner;GHOST_WindowIOS *window=&owner;
ghost::ios::PencilRingContact ring_capture,ring_hover_capture;
ghost::ios::PointerCapture pointer_capture;
bool pencil_touch=false,current_pencil_touch=false,mouse_left_pressed=false,mouse_middle_pressed=false,mouse_right_pressed=false,native_chrome_hovered=false,ios175=true;
struct Sender{void *view;int state=UIGestureRecognizerStateBegan;float rollAngle=0;CGPoint point{50,50};};
'''+code+r'''
int main(){
 engine.manager.live=window;Sender sender{owner.view};
 assert(ghost::ios::publish_pencil_ring(window,{7,1,{0,0,400,400},true}));
 sensor(&sender);assert(engine.packets.size()==1&&engine.packets.back().phase==GHOST_kPencilRingRollBegin);
 auto first=engine.packets.back();assert(first.contact&&first.roll==0);
 sender.state=UIGestureRecognizerStateChanged;sender.rollAngle=.32f;sensor(&sender);
 assert(engine.packets.back().contact==first.contact&&engine.packets.back().phase==GHOST_kPencilRingRollMotion&&engine.packets.back().roll==.32f);
 ghost::ios::pencil_ring_contact_enabled(window,7,false);sensor(&sender);
 assert(engine.packets.back().phase==GHOST_kPencilRingRollEnd&&!ring_hover_capture.captured);
 auto count=engine.packets.size();sensor(&sender);assert(engine.packets.size()==count);
 ghost::ios::pencil_ring_contact_enabled(window,7,true);sender.rollAngle=2;sensor(&sender);
 assert(engine.packets.back().phase==GHOST_kPencilRingRollBegin&&engine.packets.back().contact>first.contact);
 current_pencil_touch=true;sensor(&sender);assert(engine.packets.back().phase==GHOST_kPencilRingRollEnd);
 current_pencil_touch=false;mouse_middle_pressed=true;count=engine.packets.size();sensor(&sender);assert(engine.packets.size()==count);
 mouse_middle_pressed=false;sensor(&sender);assert(engine.packets.back().phase==GHOST_kPencilRingRollBegin);
 sender.point={500,500};sensor(&sender);assert(engine.packets.back().phase==GHOST_kPencilRingRollEnd);
 sender.point={50,50};assert(ghost::ios::publish_pencil_ring(window,{8,1,{0,0,400,400},true}));sensor(&sender);
 assert(engine.packets.back().lifetime==8&&engine.packets.back().phase==GHOST_kPencilRingRollBegin);
 count=engine.packets.size();engine.manager.live=nullptr;window=reinterpret_cast<GHOST_WindowIOS *>(1);sensor(&sender);
 assert(engine.packets.size()==count&&!ring_hover_capture.captured); // Membership before old getView.
 window=&owner;engine.manager.live=window;ios175=false;sensor(&sender);assert(engine.packets.size()==count);
 ios175=true;sender.state=UIGestureRecognizerStateBegan;
 uint64_t last=0;
 for(int i=0;i<10000;++i){sensor(&sender);assert(ring_hover_capture.serial>last);last=ring_hover_capture.serial;
  sender.state=UIGestureRecognizerStateEnded;sensor(&sender);count=engine.packets.size();sensor(&sender);assert(engine.packets.size()==count);
  sender.state=UIGestureRecognizerStateBegan;}
}
''')

    def test_native_roll_never_selects_and_stale_end_cannot_clear_reacquired_hover(self):
        helper=function(NATIVE,'bool ui_ipad_ring_roll_input(')
        draw=function(NATIVE,'void ui_ipad_ring_draw_presented(')
        begin=draw.index('  const auto refuse = [&]() {')
        refusal=draw[begin:draw.index('\n  };',begin)+5]
        self.run_cpp(r'''
#include <cassert>
#include <memory>
namespace ipad_ring=blender::ui::ipad;
struct bContext{};struct wmEvent{void *customdata;};struct uiBut{void *active=nullptr,*semi_modal_state=nullptr;};
struct Region{};struct uiPopupBlockHandle{Region *region;struct{void *arg;}popup_create_vars;};
struct uiBlock{struct{int flags=UI_PIE_IPAD_TOOLS;}pie_data;uiPopupBlockHandle *handle;std::vector<std::unique_ptr<uiBut>> buttons;};
struct uiIPadRingData{std::string menu="VIEW3D_MT_ipad_tool_inventory";uint64_t lifetime=7,presented_generation=1,roll_serial=0,roll_generation=0,contact_serial=0;ipad_ring::RingBrowseState browse;float phase=0;bool input_suspended=false;};
bool valid=true,child=false;int frees=0,refreshes=0,redraws=0;
bool ui_ipad_ring_context_valid(bContext *,uiBlock *){return valid;}
bool ui_ipad_ring_child_open(const uiBlock *){return child;}
bool ui_ipad_ring_waits_for_draw(const uiBlock *b){return static_cast<uiIPadRingData *>(b->handle->popup_create_vars.arg)->input_suspended;}
void ui_but_active_free(bContext *,uiBut *b){++frees;b->active=nullptr;b->semi_modal_state=nullptr;}
void ui_but_semi_modal_state_free(bContext *,uiBut *b){++frees;b->semi_modal_state=nullptr;}
void ED_region_tag_refresh_ui(Region *){++refreshes;}void ED_region_tag_redraw(Region *){++redraws;}
'''+helper+'\nvoid failed_draw(uiIPadRingData *data){'+refusal+'\nrefuse();}\n'+r'''
int main(){
 bContext C;Region region;uiIPadRingData data;data.browse.open(7);
 auto present=[&](){auto page=ipad_ring::ring_page_layout(20,{0,900,0,800},450,400,43,data.browse.phase);
  std::vector<ipad_ring::RingPresentedItem> items;for(int i=0;i<9;++i)items.push_back({page.buttons[i],std::to_string(page.indices[i])});
  data.presented_generation=data.browse.desired_generation;
  assert(data.browse.publish(7,data.presented_generation,items,43,page.footprint,450,400,20));data.input_suspended=false;};
 present();uiPopupBlockHandle handle{&region,{&data}};uiBlock block{{UI_PIE_IPAD_TOOLS},&handle,{}};
 block.buttons.push_back(std::make_unique<uiBut>(uiBut{&C,&C}));
 GHOST_TEventPencilRingData packet{7,1,450,400,GHOST_kPencilRingRollBegin,10,0};wmEvent event{&packet};
 assert(ui_ipad_ring_roll_input(&C,&block,&event)&&data.roll_serial==10&&!refreshes);
 packet.phase=GHOST_kPencilRingRollMotion;packet.roll=.04f;ui_ipad_ring_roll_input(&C,&block,&event);assert(!refreshes);
 packet.roll=.32f;ui_ipad_ring_roll_input(&C,&block,&event);
 assert(refreshes==1&&redraws==1&&frees==1&&data.phase==-1&&!data.browse.contact);
 present();packet.generation=data.presented_generation;packet.contact=11;packet.phase=GHOST_kPencilRingRollBegin;packet.roll=2;
 ui_ipad_ring_roll_input(&C,&block,&event);assert(data.roll_serial==11);
 packet.contact=10;packet.phase=GHOST_kPencilRingRollEnd;ui_ipad_ring_roll_input(&C,&block,&event);assert(data.roll_serial==11);
 const auto old_generation=packet.generation;data.browse.home(7);data.roll_serial=0;data.phase=0;present();
 packet.contact=11;packet.phase=GHOST_kPencilRingRollMotion;packet.roll=2.4f;
 ui_ipad_ring_roll_input(&C,&block,&event);assert(!data.roll_serial&&data.phase==0);
 packet.generation=data.presented_generation;ui_ipad_ring_roll_input(&C,&block,&event);assert(data.roll_serial==11&&data.phase==0);
 packet.phase=GHOST_kPencilRingRollEnd;packet.generation=old_generation;ui_ipad_ring_roll_input(&C,&block,&event);assert(data.roll_serial==11);
 packet.generation=data.presented_generation;packet.phase=GHOST_kPencilRingRollMotion;packet.roll=2.72f;
 ui_ipad_ring_roll_input(&C,&block,&event);assert(refreshes==2&&data.phase==-1);present();
 // Tip contact, native child, stale context, wrong owner and discontinuities do not browse.
 const float stable=data.phase;packet.generation=data.presented_generation;
 data.browse.contact=true;packet.roll=3;ui_ipad_ring_roll_input(&C,&block,&event);assert(data.phase==stable);data.browse.contact=false;
 child=true;ui_ipad_ring_roll_input(&C,&block,&event);assert(data.phase==stable);child=false;
 valid=false;ui_ipad_ring_roll_input(&C,&block,&event);assert(data.phase==stable);valid=true;
 packet.lifetime=8;ui_ipad_ring_roll_input(&C,&block,&event);assert(data.phase==stable);packet.lifetime=7;
 packet.roll=-1;ui_ipad_ring_roll_input(&C,&block,&event);assert(data.phase==stable);
 packet.phase=GHOST_kPencilRingRollEnd;ui_ipad_ring_roll_input(&C,&block,&event);assert(!data.roll_serial);
 // Execute the native failed-draw retirement, then present a repaired layout.
 packet.phase=GHOST_kPencilRingRollBegin;packet.contact=22;packet.roll=.5f;
 ui_ipad_ring_roll_input(&C,&block,&event);assert(data.roll_serial==22);
 const auto refused_generation=packet.generation;failed_draw(&data);
 assert(!data.roll_serial&&!data.roll_generation&&!data.browse.roll_seeded);
 ++data.browse.desired_generation;present();packet.phase=GHOST_kPencilRingRollMotion;
 ui_ipad_ring_roll_input(&C,&block,&event);assert(!data.roll_serial);
 packet.generation=data.presented_generation;ui_ipad_ring_roll_input(&C,&block,&event);
 assert(data.roll_serial==22&&data.roll_generation==data.presented_generation);
 packet.phase=GHOST_kPencilRingRollEnd;packet.generation=refused_generation;
 ui_ipad_ring_roll_input(&C,&block,&event);assert(data.roll_serial==22);
 packet.generation=data.presented_generation;ui_ipad_ring_roll_input(&C,&block,&event);assert(!data.roll_serial);
}
''')

    def test_sensor_is_pencil_only_available_and_independent_of_coalesced_mouse_flags(self):
        self.assertIn('if (@available(iOS 17.5, *))',IOS)
        self.assertIn('ring_hover_gesture_recognizer.allowedTouchTypes = @[ @(UITouchTypePencil) ];',IOS)
        self.assertIn('[ring_hover_gesture_recognizer release];',IOS)
        begin=IOS.index('- (void)handlePencilRingHover:',IOS.index('@implementation GHOSTUIWindow'))
        sensor=IOS[begin:IOS.index('- (void)handleHover:',begin)]
        self.assertIn('float(sender.rollAngle)',sensor)
        self.assertNotIn('CURSOR_MOVE',sensor)
        self.assertNotIn('MOUSEMOVE',sensor)
        helper=function(NATIVE,'bool ui_ipad_ring_roll_input(')
        self.assertNotIn('WM_operator',helper)
        self.assertNotIn('ui_handle_button',helper)
        self.assertIn('packet.generation >= data->roll_generation',helper)

if __name__=='__main__':unittest.main()
