"""Execute dedicated Pencil-barrel provenance, queued lifetime and native home reset.

UIKit/GHOST base event and native widgets/operators are fixtures, not device proof.
"""
import unittest
from pathlib import Path
import test_ipad_panels
from test_compact_shelf import function
from test_touch_extrude import changed_source
from test_tool_ring import ring_source
from test_pencil_ring_foundation import browse_source, ghost_source

POLICY=ring_source().replace('#pragma once','')
BROWSE=browse_source().replace('#pragma once','').replace('#include "interface_ipad_tool_ring.hh"','')
GHOST=ghost_source().replace('#pragma once','')
TYPES=changed_source('intern/ghost/GHOST_Types.h')
TYPES=TYPES[TYPES.index('/* Dedicated owned-ring provenance'):]
TYPES=TYPES[:TYPES.index('\ntypedef enum {\n  GHOST_kDragnDropTypeUnknown')]
NATIVE=changed_source('source/blender/editors/interface/regions/interface_region_menu_pie.cc')
EVENTS=changed_source('source/blender/windowmanager/intern/wm_event_system.cc')
CONSTANTS=r'''
[[maybe_unused]] constexpr int PENCIL_RING_INPUT=519,PENCIL_TOOL_PALETTE=517,EVT_ESCKEY=27,RIGHTMOUSE=2,WINDEACTIVATE=260;
[[maybe_unused]] constexpr int EVT_DATA_PENCIL_RING=6,KM_PRESS=1,KM_RELEASE=2,UI_RETURN_CANCEL=4,UI_PIE_IPAD_TOOLS=128;
'''

class PencilBarrelResetTests(unittest.TestCase):
    def run_cpp(self,code):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(POLICY+BROWSE+GHOST+'\n'+code)

    def test_native_barrel_home_resets_only_navigation_and_invalidates_old_contact(self):
        helper=function(NATIVE,'bool ui_ipad_ring_home_input(')
        self.run_cpp(TYPES+CONSTANTS+r'''
#include <cassert>
#include <memory>
namespace ipad_ring=blender::ui::ipad;
struct bContext{};struct wmEvent{int type=PENCIL_RING_INPUT,custom=EVT_DATA_PENCIL_RING;void *customdata=nullptr;};
struct uiBut{void *active=nullptr,*semi_modal_state=nullptr;};
struct Region{};struct uiPopupBlockHandle{Region *region;void *arg;struct{void *arg;}popup_create_vars;};
struct uiBlock{struct{int flags=UI_PIE_IPAD_TOOLS;}pie_data;uiPopupBlockHandle *handle;std::vector<std::unique_ptr<uiBut>> buttons;};
struct uiIPadRingData{std::string menu="VIEW3D_MT_ipad_tool_inventory";uint64_t lifetime=7,presented_generation=1,contact_serial=0,roll_serial=0;ipad_ring::RingBrowseState browse;float phase=5;bool input_suspended=false;};
bool context_valid=true;int checks=0,active_frees=0,semi_frees=0,refreshes=0,redraws=0;
bool ui_ipad_ring_context_valid(bContext *,uiBlock *){++checks;return context_valid;}
void ui_but_active_free(bContext *,uiBut *b){++active_frees;b->active=nullptr;b->semi_modal_state=nullptr;}
void ui_but_semi_modal_state_free(bContext *,uiBut *b){++semi_frees;b->semi_modal_state=nullptr;}
void ED_region_tag_refresh_ui(Region *){++refreshes;}void ED_region_tag_redraw(Region *){++redraws;}
HELPER
int main(){
 bContext C;Region region;uiIPadRingData data;data.browse.open(7);
 auto page=ipad_ring::ring_page_layout(20,{0,900,0,800},450,400,43,5);
 std::vector<ipad_ring::RingPresentedItem> items;for(int i=0;i<9;++i)items.push_back({page.buttons[i],std::to_string(page.indices[i])});
 assert(data.browse.publish(7,1,items,43,page.footprint,450,400,20));data.browse.phase=5;
 auto b=page.buttons[0];data.browse.press(7,(b.xmin+b.xmax)/2,(b.ymin+b.ymax)/2);
 uiPopupBlockHandle handle{&region,&data,{&data}};uiBlock block{{UI_PIE_IPAD_TOOLS},&handle,{}};
 int owner=1,other=2;block.buttons.push_back(std::make_unique<uiBut>(uiBut{&owner,&owner}));block.buttons.push_back(std::make_unique<uiBut>(uiBut{&owner,&other}));
 GHOST_TEventPencilRingData packet{7,1,450,400,GHOST_kPencilRingHome,0,0};wmEvent event{PENCIL_RING_INPUT,EVT_DATA_PENCIL_RING,&packet};
 int scene_revision=51,tool_preferences=16,undo_steps=19;
 packet.lifetime=8;assert(ui_ipad_ring_home_input(&C,&block,&event)&&!refreshes&&data.phase==5);packet.lifetime=7;
 packet.generation=2;ui_ipad_ring_home_input(&C,&block,&event);assert(!refreshes);packet.generation=1;
 context_valid=false;ui_ipad_ring_home_input(&C,&block,&event);assert(!refreshes);context_valid=true;
 data.menu="VIEW3D_MT_ipad_tools";ui_ipad_ring_home_input(&C,&block,&event);assert(!refreshes);data.menu="VIEW3D_MT_ipad_tool_inventory";
 event.customdata=nullptr;ui_ipad_ring_home_input(&C,&block,&event);assert(!refreshes);event.customdata=&packet;
 event.custom=0;ui_ipad_ring_home_input(&C,&block,&event);assert(!refreshes);event.custom=EVT_DATA_PENCIL_RING;
 event.type=RIGHTMOUSE;assert(!ui_ipad_ring_home_input(&C,&block,&event));event.type=PENCIL_RING_INPUT;
 assert(ui_ipad_ring_home_input(&C,&block,&event)&&data.phase==0&&data.input_suspended);
 assert(refreshes==1&&redraws==1&&active_frees==2&&semi_frees==1);
 assert(data.browse.desired_generation==2&&!data.browse.contact_valid);
 assert(data.browse.release(7,(b.xmin+b.xmax)/2,(b.ymin+b.ymax)/2,false).result==ipad_ring::RingInputResult::Shield);
 assert(scene_revision==51&&tool_preferences==16&&undo_steps==19);
}
'''.replace('HELPER',helper))

    def test_queued_packet_guard_refuses_retired_replaced_forward_and_malformed_owners(self):
        helper=function(EVENTS,'static bool wm_ipad_ring_packet_live(')
        self.run_cpp(TYPES+CONSTANTS+r'''
#include <cassert>
struct wmWindow{void *ghostwin;};struct wmEvent{int custom=EVT_DATA_PENCIL_RING;void *customdata;};
HELPER
int main(){
 int key=0,other=0;wmWindow win{&key};GHOST_TEventPencilRingData packet{12,4,0,0,GHOST_kPencilRingHome,0,0};wmEvent event{EVT_DATA_PENCIL_RING,&packet};
 assert(!wm_ipad_ring_packet_live(&win,&event));
 assert(ghost::ios::publish_pencil_ring(&key,{12,4,{40,50,400,500}}));assert(wm_ipad_ring_packet_live(&win,&event));
 packet.generation=5;assert(!wm_ipad_ring_packet_live(&win,&event));packet.generation=0;assert(!wm_ipad_ring_packet_live(&win,&event));packet.generation=4;
 win.ghostwin=&other;assert(!wm_ipad_ring_packet_live(&win,&event));win.ghostwin=&key;
 event.custom=0;assert(!wm_ipad_ring_packet_live(&win,&event));event.custom=EVT_DATA_PENCIL_RING;
 event.customdata=nullptr;assert(!wm_ipad_ring_packet_live(&win,&event));event.customdata=&packet;
 ghost::ios::retire_pencil_ring(&key,12);assert(!wm_ipad_ring_packet_live(&win,&event));
 assert(ghost::ios::publish_pencil_ring(&key,{13,1,{40,50,400,500}}));assert(!wm_ipad_ring_packet_live(&win,&event));
}
'''.replace('HELPER',helper))

    def test_native_conversion_copies_event_payload_and_uses_normal_event_cleanup(self):
        start=EVENTS.index('    case GHOST_kEventPencilRing: {')
        fragment=EVENTS[start:EVENTS.index('    case GHOST_kEventPencilToolPalette:',start)]
        cleanup=(Path(__file__).parent/'fixtures/pinned_wm_event_cleanup.hh').read_text(encoding='utf-8')
        self.run_cpp(TYPES+CONSTANTS+r'''
#include <cassert>
#include <cstdlib>
constexpr int GHOST_kEventPencilRing=400,EVT_DATA_DRAGDROP=3;
struct wmWindow{};struct wmEvent{int type=0,val=0,custom=0;void *customdata=nullptr;bool customdata_free=false;int xy[2]={};};
struct ListBase{};void WM_drag_free_list(ListBase *){assert(false);}
int allocations=0,frees=0;template<class T>T *MEM_mallocN(const char *){++allocations;return static_cast<T *>(std::malloc(sizeof(T)));}
void MEM_freeN(void *p){++frees;std::free(p);}
std::array<int,2> WM_window_native_pixel_size(wmWindow *){return {1024,768};}
wmEvent queued;void wm_event_add_intern(wmWindow *,wmEvent *e){queued=*e;}
void convert(wmWindow *win,const void *customdata){wmEvent event;switch(GHOST_kEventPencilRing){FRAGMENT}}
CLEANUP
int main(){wmWindow win;GHOST_TEventPencilRingData source{3,8,512,210,GHOST_kPencilRingHome,0,0};
 convert(&win,&source);assert(allocations==1&&queued.customdata!=&source&&queued.customdata_free);
 assert(queued.type==PENCIL_RING_INPUT&&queued.custom==EVT_DATA_PENCIL_RING&&queued.xy[0]==512&&queued.xy[1]==557);
 source.lifetime=42;auto *copy=static_cast<GHOST_TEventPencilRingData *>(queued.customdata);assert(copy->lifetime==3&&copy->generation==8);
 wm_event_custom_free(&queued);assert(frees==1);convert(&win,nullptr);assert(allocations==1);
}
'''.replace('FRAGMENT',fragment).replace('CLEANUP',cleanup))

    def test_squeeze_escape_deactivate_close_before_draw_gate_and_native_popup_owns_free(self):
        helper=function(NATIVE,'bool ui_ipad_ring_dismiss_input(')
        self.run_cpp(CONSTANTS+r'''
#include <cassert>
struct wmEvent{int type,val;};struct uiPopupBlockHandle{int menuretval=0;};struct uiBlock{struct{int flags=UI_PIE_IPAD_TOOLS;}pie_data;uiPopupBlockHandle *handle;};
HELPER
int main(){uiPopupBlockHandle handle;uiBlock block{{UI_PIE_IPAD_TOOLS},&handle};
 for(int type:{PENCIL_TOOL_PALETTE,EVT_ESCKEY,RIGHTMOUSE,WINDEACTIVATE}){
  handle.menuretval=0;wmEvent e{type,KM_PRESS};assert(ui_ipad_ring_dismiss_input(&block,&e)&&handle.menuretval==UI_RETURN_CANCEL);
 }
 wmEvent release{PENCIL_TOOL_PALETTE,KM_RELEASE};handle.menuretval=0;assert(!ui_ipad_ring_dismiss_input(&block,&release)&&!handle.menuretval);
 block.pie_data.flags=0;wmEvent e{PENCIL_TOOL_PALETTE,KM_PRESS};assert(!ui_ipad_ring_dismiss_input(&block,&e));
 block.pie_data.flags=UI_PIE_IPAD_TOOLS;block.handle=nullptr;assert(!ui_ipad_ring_dismiss_input(&block,&e));
}
'''.replace('HELPER',helper))
        handlers=changed_source('source/blender/editors/interface/interface_handlers.cc')
        popup=handlers[handlers.index('  uiBlock *root_block ='):]
        self.assertLess(popup.index('ui_ipad_ring_dismiss_input(root_block'),popup.index('ui_ipad_ring_waits_for_draw(root_block)'))
        modal=handlers[handlers.index('  uiBlock *ipad_root ='):]
        self.assertLess(modal.index('ui_ipad_ring_dismiss_input(ipad_root'),modal.index('ui_ipad_ring_waits_for_draw(ipad_root)'))
        self.assertIn('return WM_UI_HANDLER_CONTINUE; /* Let the owning popup finish native teardown. */',modal)
        guard=EVENTS[EVENTS.index('      if (event->type == PENCIL_RING_INPUT &&'):]
        self.assertLess(guard.index('wm_event_free_last_handled'),guard.index('#ifdef WITH_XR_OPENXR'))

    def test_only_pencil_barrel_callback_emits_home_and_canvas_right_click_is_retained(self):
        ios=changed_source('intern/ghost/intern/GHOST_WindowIOS.mm')
        segment=ios[ios.index('- (void)pencilInteractionDidTap:'):]
        segment=segment[:segment.index('\n#if defined(__IPHONE_17_5)')]
        self.assertLess(segment.index('preferredTapAction'),segment.index('pencil_ring_presentation(window)'))
        self.assertLess(segment.index('GHOST_EventPencilRing'),segment.index('PENCIL_CONTEXT_MENU'))
        self.assertEqual(ios.count('GHOST_kPencilRingHome'),1)
        self.assertIn('return;',segment[segment.index('GHOST_EventPencilRing'):segment.index('PENCIL_CONTEXT_MENU')])

if __name__=='__main__':unittest.main()
