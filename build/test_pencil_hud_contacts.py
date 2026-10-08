"""Execute frozen physical HUD contacts and the real GHOST payload constructors.
UIKit recognition and native dispatch are separate target/device evidence.
"""
import unittest
from test_touch_extrude import changed_source
from test_compact_shelf import function
import test_ipad_panels

class PencilHUDContactTests(unittest.TestCase):
    def test_origin_priority_frozen_serial_and_window_retirement(self):
        header=changed_source('intern/ghost/GHOST_NavigationIOS.hh').replace('#pragma once','')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(header+r"""
#include <cassert>
int main(){
 using namespace ghost::ios;
 using Kind=PointerCaptureKind;
 int window=1,other=2;
 set_navigation_regions(&window,{{0,0,100,100,Kind::Navigation,false,71},
                                {0,0,600,600,Kind::ToolManipulation,true,0}});
 uint64_t last=0;
 for(int i=0;i<10000;++i){
  auto contact=hud_contact_at_start(&window,40,50);
  assert(contact.generation==71&&contact.serial>last&&contact.x==40&&contact.y==50);
  last=contact.serial;
  assert(pointer_capture_hit(&window,40,50)==Kind::Navigation);
  assert(!selection_hit(&window,40,50));
  assert(!hud_contact_at_start(&other,40,50).generation);
  set_navigation_regions(&window,{{0,0,100,100,Kind::Navigation,false,72}});
  assert(contact.generation==71&&contact.serial==last); // physical origin never rebased
  set_navigation_regions(&window,{{0,0,100,100,Kind::Navigation,false,71},
                                 {0,0,600,600,Kind::ToolManipulation,true,0}});
 }
 assert(!hud_contact_at_start(&window,300,300).generation);
 set_navigation_regions(&window,{{0,0,100,100,Kind::WorkspaceResize,false,0},
                                {0,0,100,100,Kind::Navigation,false,71}});
 assert(!hud_contact_at_start(&window,40,50).generation); // higher rail wins
 set_navigation_regions(&window,{{0,0,100,100,Kind::Navigation,false,71}});
 hud_contact_next=UINT64_MAX;
 assert(hud_contact_at_start(&window,40,50).serial==UINT64_MAX); // explicit refused stamp
 assert(hud_contact_next==UINT64_MAX);
 forget_navigation_window(&window);
 assert(!hud_contact_at_start(&window,40,50).generation);
}
""")

    def test_actual_payload_constructors_keep_hardware_zero(self):
        button='\n'.join(l for l in changed_source('intern/ghost/intern/GHOST_EventButton.hh').splitlines() if not l.startswith(('#include','#pragma')))
        cursor='\n'.join(l for l in changed_source('intern/ghost/intern/GHOST_EventCursor.hh').splitlines() if not l.startswith(('#include','#pragma')))
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r"""
#include <cassert>
#include <cstdint>
using GHOST_TEventType=int; using GHOST_TButton=int;
struct GHOST_IWindow{};struct GHOST_TabletData{int value=3;};
struct GHOST_TEventButtonData{int button;GHOST_TabletData tablet;bool is_cancelled,is_direct_tool;uint64_t ipad_hud_generation,ipad_hud_serial;};
struct GHOST_TEventCursorData{int32_t x,y;GHOST_TabletData tablet;bool is_direct_tool;uint64_t ipad_hud_generation,ipad_hud_serial;};
struct GHOST_Event{void *data_=nullptr;GHOST_Event(uint64_t,int,GHOST_IWindow*){}};
BUTTON
struct ButtonProbe:GHOST_EventButton{using GHOST_EventButton::GHOST_EventButton;using GHOST_EventButton::button_event_data_;};
CURSOR
struct CursorProbe:GHOST_EventCursor{using GHOST_EventCursor::GHOST_EventCursor;using GHOST_EventCursor::cursor_event_data_;};
int main(){
 GHOST_IWindow w;GHOST_TabletData tablet;
 ButtonProbe hw(1,2,&w,1,tablet);
 CursorProbe move(1,2,&w,40,50,tablet);
 assert(!hw.button_event_data_.ipad_hud_generation&&!hw.button_event_data_.ipad_hud_serial);
 assert(!move.cursor_event_data_.ipad_hud_generation&&!move.cursor_event_data_.ipad_hud_serial);
 for(int i=0;i<10000;++i){
  ButtonProbe down(1,2,&w,1,tablet,false,false,71,i+1);
  ButtonProbe cancel(1,2,&w,1,tablet,true,false,71,i+1);
  CursorProbe drag(1,2,&w,40,50,tablet,false,71,i+1);
  assert(down.button_event_data_.ipad_hud_serial==uint64_t(i+1));
  assert(cancel.button_event_data_.is_cancelled&&!cancel.button_event_data_.is_direct_tool);
  assert(drag.cursor_event_data_.ipad_hud_generation==71&&drag.cursor_event_data_.ipad_hud_serial==uint64_t(i+1));
  assert(down.data_==&down.button_event_data_&&drag.data_==&drag.cursor_event_data_);
 }
}
""".replace('BUTTON',button).replace('CURSOR',cursor))

    def test_connected_recognizer_and_native_dispatch_stamps(self):
        ios=changed_source('intern/ghost/intern/GHOST_WindowIOS.mm')
        self.assertEqual(ios.count('hud_origin = ghost::ios::hud_contact_at_start'),2)
        self.assertIn('pointer.hud_serial = [sender hudContact].serial;',ios)
        event=changed_source('source/blender/windowmanager/intern/wm_event_system.cc')
        self.assertIn('event.ipad_hud_generation = 0;',event)
        self.assertIn('event.ipad_hud_serial = 0;',event)
        for payload in ('cd','bd'):
            self.assertIn(f'event.ipad_hud_generation = {payload}->ipad_hud_generation;',event)
            self.assertIn(f'event.ipad_hud_serial = {payload}->ipad_hud_serial;',event)
        self.assertIn('!UI_ipad_hud_event_admit(C, win, event)',event)
        handlers=changed_source('source/blender/editors/interface/interface_handlers.cc')
        self.assertIn('event->ipad_hud_serial == UINT64_MAX',handlers)


    def test_actual_native_corner_stack_sizing_covers_all_active_headers(self):
        helper=function(changed_source('source/blender/editors/screen/area.cc'),
                        'static bool ui_ipad_corner_panels_size(')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r"""
#include <algorithm>
#include <cassert>
#include <vector>
constexpr int PANEL_ACTIVE=(1<<2);
float UI_UNIT_X=20,UI_SCALE_FAC=1;
struct Panel{int runtime_flag=PANEL_ACTIVE,ofsy=0,sizey=0;bool closed=true;};
struct ARegion{std::vector<const Panel*>panels;};
bool UI_panel_is_active(const Panel *panel)
{
  return panel->runtime_flag & PANEL_ACTIVE;
}
bool UI_panel_is_closed(const Panel*p){return p->closed;}
int UI_panel_size_y(const Panel*p){return 20+(p->closed?0:p->sizey);}
#define LISTBASE_FOREACH(T,v,list) for(T v:*(list))
HELPER
int main(){
 Panel redo{PANEL_ACTIVE,-20,0,true},future{PANEL_ACTIVE,-40,0,true},view{PANEL_ACTIVE,-60,0,true};
 Panel inactive{0,-900,800,false};
 ARegion region{{&redo,&future,&view,&inactive}};int size[2]={0,0};
 assert(ui_ipad_corner_panels_size(&region,size)&&size[0]==160&&size[1]==60);
 future.closed=false;future.sizey=180;future.ofsy=-220;view.ofsy=-240;
 assert(ui_ipad_corner_panels_size(&region,size)&&size[0]==280&&size[1]==240);
 future.closed=true; // native animation retains body storage, only real header counts
 future.ofsy=-220;view.ofsy=-60;
 assert(ui_ipad_corner_panels_size(&region,size)&&size[0]==160&&size[1]==60);
 region.panels={&inactive};assert(!ui_ipad_corner_panels_size(&region,size));
 region.panels={&redo};assert(ui_ipad_corner_panels_size(&region,size)&&size[1]==20);
 UI_SCALE_FAC=2;UI_UNIT_X=40;redo.ofsy=-40;
 assert(ui_ipad_corner_panels_size(&region,size)&&size[0]==160&&size[1]==20);
}
""".replace('HELPER',helper))


if __name__=='__main__':unittest.main()
