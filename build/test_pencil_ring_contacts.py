"""Execute shipped contact/activation/dispatch seams with native UI owner fixtures.

UIKit delivery, native RNA/GPU/modal cleanup are not executed on this host.
"""
import unittest
from pathlib import Path
from test_compact_shelf import function
from test_touch_extrude import changed_source
from test_pencil_barrel_reset import POLICY, BROWSE, GHOST, TYPES, CONSTANTS
import test_ipad_panels

NATIVE=changed_source('source/blender/editors/interface/regions/interface_region_menu_pie.cc')
HANDLERS=changed_source('source/blender/editors/interface/interface_handlers.cc')

class PencilRingContactTests(unittest.TestCase):
    def run_cpp(self,code):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(POLICY+BROWSE+GHOST+'\n'+code)

    def test_actual_contact_start_uses_pinned_mutable_coordinate_contract(self):
        ios=changed_source('intern/ghost/intern/GHOST_WindowIOS.mm')
        helper=function(ios,'static ghost::ios::PencilRingContact ios_ring_contact_at_start(')
        # Objective-C enumeration, location selector and type getter are the
        # translated UIKit boundaries. The actual named-value call and native scale
        # signature/body compile and execute unchanged as C++.
        helper=helper.replace('for (UITouch *touch in touches)',
                              'for (UITouch *touch : *touches)')
        helper=helper.replace('[touch locationInView:owner_view]',
                              'touch->locationInView(owner_view)')
        helper=helper.replace('touch.type','touch->type')
        contract=(Path(__file__).parent/'fixtures/pinned_ios_coordinate_contract.cc').read_text(encoding='utf-8')
        signature,scale=contract.split('CGPoint GHOST_WindowIOS::',1)
        signature=signature[signature.index('  CGPoint scalePointToWindow'):]
        scale='CGPoint GHOST_WindowIOS::'+scale
        self.run_cpp(r"""
#include <cassert>
struct CGPoint {double x,y;};
struct UIView {};
enum {UITouchTypeDirect,UITouchTypePencil,UITouchTypeIndirect};
struct UITouch {int type;CGPoint location;CGPoint locationInView(UIView *){return location;}};
template<class T>struct NSSet:std::vector<T>{using std::vector<T>::vector;};
struct GHOST_WindowIOS {
 UIView *view;float factor=2;int view_reads=0;
 UIView *getView(){++view_reads;return view;}
 float getWindowScaleFactor(){return factor;}
SIGNATURE
};
SCALE
HELPER
int main(){
 UIView owner,foreign;GHOST_WindowIOS window{&owner};
 UITouch indirect{UITouchTypeIndirect,{37.9,50.5}},pencil{UITouchTypePencil,{37.9,50.5}};
 NSSet<UITouch *> touches{&indirect,&pencil};
 auto absent=ios_ring_contact_at_start(nullptr,nullptr,nullptr);assert(!absent.lifetime);
 assert(ghost::ios::publish_pencil_ring(&window,{8,1,{40,40,400,400},true}));
 auto captured=ios_ring_contact_at_start(&window,&owner,&touches);
 assert(captured.lifetime==8&&captured.serial&&captured.origin_x==75&&captured.origin_y==101);
 assert(pencil.location.x==37.9&&pencil.location.y==50.5);
 auto stale=ios_ring_contact_at_start(&window,&foreign,&touches);assert(!stale.lifetime);
 ghost::ios::pencil_ring_contact_enabled(&window,8,false);int reads=window.view_reads;
 auto disabled=ios_ring_contact_at_start(&window,&owner,&touches);
 assert(!disabled.lifetime&&window.view_reads==reads);
 ghost::ios::pencil_ring_contact_enabled(&window,8,true);
 pencil.type=UITouchTypeDirect;auto direct=ios_ring_contact_at_start(&window,&owner,&touches);
 assert(direct.serial!=captured.serial&&direct.origin_x==75&&direct.origin_y==101);
}
""".replace('SIGNATURE',signature).replace('SCALE',scale).replace('HELPER',helper))

    def test_origin_and_contact_nonce_survive_retirement_and_never_retarget(self):
        self.run_cpp(r'''
#include <cassert>
int main(){
 using namespace ghost::ios;int key=0;PencilRingContact contact;
 assert(!contact.begin({},50,50));
 assert(publish_pencil_ring(&key,{8,1,{40,40,400,400},true}));
 auto receipt=pencil_ring_presentation(&key);
 assert(!contact.begin(receipt,10,50));
 assert(contact.begin(receipt,75,85)&&contact.origin_x==75&&contact.origin_y==85);
 const auto first=contact;retire_pencil_ring(&key,8);
 assert(contact.lifetime==8&&contact.generation==1&&contact.serial==first.serial);
 assert(contact.finish()&&!contact.finish()&&contact.ended&&!contact.captured);
 assert(publish_pencil_ring(&key,{9,1,{40,40,400,400},true}));
 pencil_ring_contact_enabled(&key,8,false);assert(pencil_ring_presentation(&key).contact_enabled);
 pencil_ring_contact_enabled(&key,9,false);assert(!contact.begin(pencil_ring_presentation(&key),75,85));
 pencil_ring_contact_enabled(&key,9,true);
 uint64_t last=first.serial;
 for(int i=0;i<10000;++i){
  assert(contact.begin(pencil_ring_presentation(&key),75,85)&&contact.serial>last);
  auto previous=contact;last=contact.serial;assert(contact.finish());
  assert(contact.begin(pencil_ring_presentation(&key),75,85));
  assert(contact.serial!=previous.serial);last=contact.serial;assert(contact.finish());
 }
}
''')

    def test_native_taps_rotation_cancel_redraw_and_old_terminals(self):
        helper=function(NATIVE,'bool ui_ipad_ring_contact_input(')
        self.run_cpp(TYPES+CONSTANTS+r'''
#include <cassert>
#include <memory>
namespace ipad_ring=blender::ui::ipad;
[[maybe_unused]] constexpr int UI_HIDDEN=1,UI_SCROLLED=2,UI_BUT_DISABLED=4;
struct bContext{};struct wmEvent{int type=PENCIL_RING_INPUT,custom=EVT_DATA_PENCIL_RING;void *customdata=nullptr;int xy[2]={};};
struct uiBut{int flag=0;void *active=nullptr,*semi_modal_state=nullptr;};
struct Region{};struct uiPopupBlockHandle{Region *region;struct{void *arg;}popup_create_vars;int menuretval=0;};
struct uiBlock{struct{int flags=UI_PIE_IPAD_TOOLS;}pie_data;uiPopupBlockHandle *handle;std::vector<std::unique_ptr<uiBut>> buttons;};
struct uiIPadRingData{std::string menu="VIEW3D_MT_ipad_tool_inventory";uint64_t lifetime=7,presented_generation=1,contact_serial=0,contact_generation=0,roll_serial=0;ipad_ring::RingBrowseState browse;float phase=0;bool input_suspended=false;};
bool valid=true,child=false;int active_frees=0,semi_frees=0,refreshes=0,redraws=0;
bool ui_ipad_ring_context_valid(bContext *,uiBlock *){return valid;}
bool ui_ipad_ring_child_open(const uiBlock *){return child;}
bool ui_ipad_ring_roll_input(bContext *,uiBlock *,const wmEvent *){return true;}
bool ui_ipad_ring_waits_for_draw(const uiBlock *b){return static_cast<uiIPadRingData *>(b->handle->popup_create_vars.arg)->input_suspended;}
void ui_but_active_free(bContext *,uiBut *b){++active_frees;b->active=nullptr;b->semi_modal_state=nullptr;}
void ui_but_semi_modal_state_free(bContext *,uiBut *b){++semi_frees;b->semi_modal_state=nullptr;}
void ED_region_tag_refresh_ui(Region *){++refreshes;}void ED_region_tag_redraw(Region *){++redraws;}
HELPER
int main(){
 bContext C;Region region;uiIPadRingData data;data.browse.open(7);
 uiPopupBlockHandle handle{&region,{&data},0};uiBlock block{{UI_PIE_IPAD_TOOLS},&handle,{}};
 for(int i=0;i<43;++i)block.buttons.push_back(std::make_unique<uiBut>());
 auto present=[&](){auto page=ipad_ring::ring_page_layout(20,{0,900,0,800},450,400,43,data.browse.phase);
  std::vector<ipad_ring::RingPresentedItem> items;for(int i=0;i<9;++i)items.push_back({page.buttons[i],data.menu+":"+std::to_string(page.indices[i])});
  data.presented_generation=data.browse.desired_generation;
  assert(data.browse.publish(7,data.presented_generation,items,43,page.footprint,450,400,20));data.input_suspended=false;};
 present();auto b=data.browse.presented[0].bounds;
 GHOST_TEventPencilRingData packet{7,1,0,0,GHOST_kPencilRingBegin,1,0};wmEvent event{PENCIL_RING_INPUT,EVT_DATA_PENCIL_RING,&packet,{int((b.xmin+b.xmax)/2),int((b.ymin+b.ymax)/2)}};
 uiBut *tap=nullptr;auto input=[&](GHOST_TPencilRingPhase phase){packet.phase=phase;assert(ui_ipad_ring_contact_input(&C,&block,&event,&tap));};
 int one=1,two=2;block.buttons[0]->active=&one;block.buttons[1]->active=&one;block.buttons[1]->semi_modal_state=&two;
 input(GHOST_kPencilRingBegin);assert(data.browse.contact&&active_frees==2&&semi_frees==1);
 input(GHOST_kPencilRingEnd);assert(tap==block.buttons[0].get()&&!data.browse.contact);
 // A disabled native item cannot be selected even if its drawn rectangle matched.
 packet.contact=2;input(GHOST_kPencilRingBegin);block.buttons[0]->flag=UI_BUT_DISABLED;input(GHOST_kPencilRingEnd);assert(!tap);block.buttons[0]->flag=0;
 packet.contact=3;input(GHOST_kPencilRingBegin);event.xy[0]=525;event.xy[1]=530;
 input(GHOST_kPencilRingMotion);assert(data.browse.rotating&&data.input_suspended&&refreshes);
 present();input(GHOST_kPencilRingEnd);assert(!tap&&!data.browse.rotating&&data.input_suspended);present();
 // Home/rebuild permits a new contact, but the old terminal cannot release it.
 data.browse.home(7);data.contact_serial=0;present();packet.generation=data.presented_generation;packet.contact=5;
 b=data.browse.presented[0].bounds;event.xy[0]=int((b.xmin+b.xmax)/2);event.xy[1]=int((b.ymin+b.ymax)/2);
 input(GHOST_kPencilRingBegin);packet.contact=3;packet.generation=1;input(GHOST_kPencilRingEnd);assert(data.browse.contact&&!tap);
 packet.contact=5;packet.generation=data.contact_generation;input(GHOST_kPencilRingCancel);assert(!tap&&!data.browse.contact);
 child=true;packet.contact=6;input(GHOST_kPencilRingBegin);assert(!data.browse.contact);child=false;
 valid=false;input(GHOST_kPencilRingBegin);assert(!data.browse.contact);valid=true;
 packet.generation=999;input(GHOST_kPencilRingBegin);assert(!data.browse.contact);
 packet.generation=data.presented_generation;event.xy[0]=450;event.xy[1]=400;packet.contact=7;
 input(GHOST_kPencilRingBegin);input(GHOST_kPencilRingEnd);assert(handle.menuretval==UI_RETURN_CANCEL&&!tap);
}
'''.replace('HELPER',helper))

    def test_native_button_press_release_applies_once_and_leaves_child_open(self):
        helper=function(HANDLERS,'static bool ui_ipad_ring_activate_tap(')
        native_button=(Path(__file__).parent/'fixtures/pinned_ui_button_apply.hh').read_text(encoding='utf-8')
        self.run_cpp(r'''
#include <cassert>
#include <memory>
template<class T,class... A>bool elem(T value,A... choices){return ((value==choices)||...);}
#define ELEM(v,...) elem(v,__VA_ARGS__)
enum class ButType{But,ButMenu,Row,Toggle,ToggleN,IconToggle,IconToggleN,Checkbox,CheckboxN,ButToggle,Block,Menu,Popover,Pulldown,Num};
enum wmEventType{EVENT_NONE,LEFTMOUSE,EVT_PADENTER,EVT_RETKEY};
enum wmEventModifierFlag{ModifierNone=0};enum eWM_EventFlag{FlagNone=0};
enum{KM_PRESS=1,KM_RELEASE=2,UI_SELECT=1,UI_HOVER=2,WM_UI_HANDLER_BREAK=1,WM_UI_HANDLER_CONTINUE=0,
 BUTTON_STATE_HIGHLIGHT=1,BUTTON_STATE_WAIT_RELEASE=2,BUTTON_STATE_EXIT=3,BUTTON_STATE_WAIT_FLASH=4,BUTTON_STATE_MENU_OPEN=5,BUTTON_ACTIVATE_OVER=1};
struct ListBase{void *first=nullptr;};template<class T>int BLI_findindex(const ListBase *list,T *p){return list->first==p?0:-1;}
struct Main{};struct wmWindow{};struct wmWindowManager{ListBase windows;};struct ARegion;
struct bScreen{ListBase regionbase;};struct bContext{Main *main;wmWindowManager *wm;wmWindow *win;bScreen *screen;};
Main *CTX_data_main(bContext *C){return C->main;}wmWindowManager *CTX_wm_manager(bContext *C){return C->wm;}wmWindow *CTX_wm_window(bContext *C){return C->win;}
bScreen *current_screen=nullptr;bScreen *WM_window_get_active_screen(wmWindow *){return current_screen;}
struct wmEvent{wmEventType type=EVENT_NONE;int val=0;eWM_EventFlag flag=FlagNone;wmEventModifierFlag modifier=ModifierNone;
 wmEventType keymodifier=EVENT_NONE;int custom=0;void *customdata=nullptr;bool customdata_free=false;int xy[2]={};};
struct uiBlock;struct uiHandleButtonData{int state=BUTTON_STATE_HIGHLIGHT;bool cancel=false;};
struct uiBut{ButType type=ButType::But;uiBlock *block=nullptr;int flag=0;uiHandleButtonData *active=nullptr,*semi_modal_state=nullptr;};
struct uiBlock{uint64_t ipad_ring_lifetime=7,ipad_ring_generation=1;std::vector<std::unique_ptr<uiBut>> buttons;void *handle=reinterpret_cast<void *>(1);};
struct Runtime{ListBase uiblocks;};struct ARegion{Runtime *runtime;};
bool context_valid=true,child=false,change_main=false;int applied=0,presses=0,releases=0,frees=0;Main replacement;
bool ui_ipad_ring_child_open(const uiBlock *){return child;}
bool ui_ipad_ring_context_valid(bContext *,uiBlock *){return context_valid;}
void ui_but_active_free(bContext *,uiBut *b){++frees;delete b->active;b->active=nullptr;}
void ui_but_semi_modal_state_free(bContext *,uiBut *b){delete b->semi_modal_state;b->semi_modal_state=nullptr;}
void button_activate_state(bContext *,uiBut *b,int state){b->active->state=state;if(state==BUTTON_STATE_WAIT_RELEASE)b->flag|=UI_SELECT;}
void button_activate_init(bContext *,ARegion *,uiBut *b,int){assert(!b->active);b->active=new uiHandleButtonData;b->flag|=UI_HOVER;}
@@BUTTON@@
int ui_handle_button_event(bContext *C,const wmEvent *e,uiBut *b){
 assert(!e->modifier&&e->keymodifier==EVENT_NONE&&!e->customdata&&!e->customdata_free&&e->custom==0);
 if(e->val==KM_PRESS)++presses;else ++releases;
 if(b->type==ButType::Popover){assert(e->val==KM_PRESS);child=true;b->active->state=BUTTON_STATE_MENU_OPEN;if(change_main)C->main=&replacement;return 1;}
 int result=ui_do_but_BUT(C,b,b->active,e);
 // Native ui_handle_button_event owns apply/Undo/menu return on EXIT. This tail
 // is a fixture; the actual pinned But transition above and candidate helper execute.
 if(b->active->state==BUTTON_STATE_EXIT){if(!b->active->cancel)++applied;ui_but_active_free(C,b);}
 return result;
}
HELPER
int main(){Main main;wmWindow win;wmWindowManager wm{{&win}};uiBlock block;Runtime runtime{{&block}};ARegion region{&runtime};bScreen screen{{&region}};current_screen=&screen;bContext C{&main,&wm,&win,&screen};
 block.buttons.push_back(std::make_unique<uiBut>());auto *but=block.buttons[0].get();but->block=&block;
 wmEvent packet;packet.xy[0]=70;packet.xy[1]=90;packet.custom=6;packet.customdata=&main;packet.customdata_free=true;
 ui_ipad_ring_activate_tap(&C,&region,but,&packet);assert(applied==1&&presses==1&&releases==1&&!but->active);
 // A recreated native hover active state is cancelled, never applied, before tap.
 but->active=new uiHandleButtonData;ui_ipad_ring_activate_tap(&C,&region,but,&packet);assert(applied==2&&frees==3);
 but->type=ButType::Popover;ui_ipad_ring_activate_tap(&C,&region,but,&packet);
 assert(child&&but->active->state==BUTTON_STATE_MENU_OPEN&&presses==3&&releases==2);
 ui_but_active_free(&C,but);child=false;context_valid=false;ui_ipad_ring_activate_tap(&C,&region,but,&packet);assert(presses==3);context_valid=true;
 change_main=true;ui_ipad_ring_activate_tap(&C,&region,but,&packet);assert(C.main==&replacement&&releases==2);ui_but_active_free(&C,but);
}
'''.replace('@@BUTTON@@',native_button).replace('HELPER',helper))

    def test_native_child_suspend_ends_only_navigation_and_preserves_home_receipt(self):
        helper=function(NATIVE,'void ui_ipad_ring_capture_suspend(')
        self.run_cpp(r'''
#include <cassert>
#define WITH_APPLE_CROSSPLATFORM
namespace ipad_ring=blender::ui::ipad;constexpr int UI_PIE_IPAD_TOOLS=128;
struct bContext{};struct uiBlock;struct uiPopupBlockHandle{struct{void *arg;uiBlock *(*handle_create_func)(bContext *,uiPopupBlockHandle *,void *);}popup_create_vars;};
struct uiBlock{struct{int flags=UI_PIE_IPAD_TOOLS;}pie_data;uiPopupBlockHandle *handle;};
struct uiIPadRingData{void *ghost_window;uint64_t lifetime=7,contact_serial=4,roll_serial=0;ipad_ring::RingBrowseState browse;};
static uiBlock *ui_ipad_ring_create(bContext *,uiPopupBlockHandle *,void *){return nullptr;}
HELPER
int main(){int key=1;uiIPadRingData data{&key,7,4,0,{}};data.browse.open(7);data.browse.contact=data.browse.contact_valid=data.browse.roll_seeded=true;
 uiPopupBlockHandle handle{{&data,ui_ipad_ring_create}};uiBlock block{{UI_PIE_IPAD_TOOLS},&handle};
 assert(ghost::ios::publish_pencil_ring(&key,{7,2,{20,20,500,500},true}));ui_ipad_ring_capture_suspend(&block);
 assert(!data.browse.contact&&!data.browse.contact_valid&&!data.browse.roll_seeded&&!data.contact_serial);
 auto receipt=ghost::ios::pencil_ring_presentation(&key);assert(receipt.lifetime==7&&receipt.generation==2&&!receipt.contact_enabled);
 // Child drawing keeps contact disabled; subsequent parent presentation can resume it.
 assert(ghost::ios::publish_pencil_ring(&key,{7,2,{20,20,500,500},false}));assert(!ghost::ios::pencil_ring_presentation(&key).contact_enabled);
 assert(ghost::ios::publish_pencil_ring(&key,{7,3,{20,20,500,500},true}));assert(ghost::ios::pencil_ring_presentation(&key).contact_enabled);
}
'''.replace('HELPER',helper))

    def test_contact_capture_is_separate_from_hardware_and_native_dispatch_boundaries(self):
        ios=changed_source('intern/ghost/intern/GHOST_WindowIOS.mm')
        start=ios.index('- (void)handleTap:',ios.index('@implementation GHOSTUIWindow'))
        tap=ios[start:ios.index('- (void)handlePan:',start)]
        self.assertLess(tap.index('GHOST_kPencilRingBegin'),tap.index('UserInputEvent::EventTypes::LEFT_BUTTON_DOWN'))
        self.assertIn('GHOST_kPencilRingEnd',tap)
        self.assertIn('window->getView() != owner_view',ios)
        self.assertIn('ring_origin = ios_ring_contact_at_start',ios)
        self.assertIn('ring_capture.ended',ios)
        self.assertIn('GHOST_kPencilRingCancel',ios)
        handlers=HANDLERS[HANDLERS.index('bool UI_ipad_ring_event_dispatch('):]
        self.assertLess(handlers.index('handler->user_data == handle'),handlers.index('handle->ctx_area'))
        self.assertIn('base->flag & WM_HANDLER_DO_FREE',handlers)
        self.assertLess(handlers.index('CTX_wm_region_popup_set(C, nullptr)'),handlers.index('ui_popup_handler(C, event, handle)'))
        self.assertIn('if (ipad_tap && !ui_ipad_ring_activate_tap',HANDLERS)
        events=changed_source('source/blender/windowmanager/intern/wm_event_system.cc')
        route=events[events.index('        UI_ipad_ring_event_dispatch(C, event);'):]
        self.assertLess(route.index('UI_ipad_ring_event_dispatch'),route.index('CTX_wm_window(C) == nullptr'))

    def test_root_dispatch_requires_registered_owner_and_restores_only_live_context(self):
        helper=function(HANDLERS,'bool UI_ipad_ring_event_dispatch(')
        self.run_cpp(TYPES+CONSTANTS+r'''
#include <cassert>
struct ListBase{void *first=nullptr;};
#define LISTBASE_FOREACH(T,v,l) for(T v=reinterpret_cast<T>((l)->first);v;v=v->next)
template<class T>int BLI_findindex(const ListBase *l,T *target){int i=0;for(T *p=reinterpret_cast<T *>(l->first);p;p=p->next,++i)if(p==target)return i;return -1;}
constexpr int WM_HANDLER_TYPE_UI=1,WM_HANDLER_DO_FREE=8;
struct wmEvent{int type=PENCIL_RING_INPUT,custom=EVT_DATA_PENCIL_RING;void *customdata=nullptr;int xy[2]={};};
struct Main{};struct bContext;
struct Runtime{ListBase uiblocks;};struct ARegion{ARegion *next=nullptr;Runtime *runtime=nullptr;};
struct ScrArea{ScrArea *next=nullptr;ListBase regionbase;};struct bScreen{ListBase regionbase,areabase;};
struct wmEventHandler{wmEventHandler *next=nullptr;int type=WM_HANDLER_TYPE_UI,flag=0;};
struct wmEventHandler_UI{wmEventHandler head;int (*handle_fn)(bContext *,const wmEvent *,void *);void (*remove_fn)(bContext *,void *);void *user_data;};
struct Cursor{int xy[2]={10,20};int modifier=43,buttons=5;};
struct wmWindow{wmWindow *next=nullptr;ListBase modalhandlers;Cursor *eventstate;int winid=2;void *ghostwin;};
struct wmWindowManager{ListBase windows;};struct uiPopupBlockHandle{ARegion *region;ScrArea *ctx_area;ARegion *ctx_region;};
struct uiBlock{uiBlock *next=nullptr;bool active=true;struct{int flags=UI_PIE_IPAD_TOOLS;}pie_data;uint64_t ipad_ring_lifetime=7;uiPopupBlockHandle *handle;};
struct bContext{Main *main;wmWindowManager *wm;wmWindow *win;ScrArea *area;ARegion *region,*popup;};
Main *CTX_data_main(bContext *C){return C->main;}wmWindowManager *CTX_wm_manager(bContext *C){return C->wm;}wmWindow *CTX_wm_window(bContext *C){return C->win;}
ScrArea *CTX_wm_area(bContext *C){return C->area;}ARegion *CTX_wm_region(bContext *C){return C->region;}ARegion *CTX_wm_region_popup(bContext *C){return C->popup;}
void CTX_wm_area_set(bContext *C,ScrArea *p){C->area=p;}void CTX_wm_region_set(bContext *C,ARegion *p){C->region=p;}
void CTX_wm_region_popup_set(bContext *C,ARegion *p){C->popup=p;}
bScreen *current_screen=nullptr;bScreen *WM_window_get_active_screen(wmWindow *){return current_screen;}
int calls=0,behavior=0;Main replacement;
int ui_popup_handler(bContext *C,const wmEvent *e,void *userdata){
 ++calls;auto *h=static_cast<uiPopupBlockHandle *>(userdata);assert(C->area==h->ctx_area&&C->region==h->ctx_region&&!C->popup);
 assert(C->win->eventstate->xy[0]==e->xy[0]&&C->win->eventstate->xy[1]==e->xy[1]);
 assert(C->win->eventstate->modifier==43&&C->win->eventstate->buttons==5);
 if(behavior==1){current_screen->regionbase.first=nullptr;current_screen->areabase.first=nullptr;}
 if(behavior==2)C->main=&replacement;
 if(behavior==3){C->win->eventstate->xy[0]=88;C->win->eventstate->xy[1]=99;}
 return 0;
}
void ui_popup_handler_remove(bContext *,void *){}
HELPER
int main(){Main main;Cursor cursor;Runtime runtime;ARegion canvas;ScrArea area{nullptr,{&canvas}};ARegion popup{nullptr,&runtime};
 uiPopupBlockHandle handle{&popup,&area,&canvas};uiBlock block{nullptr,true,{UI_PIE_IPAD_TOOLS},7,&handle};runtime.uiblocks.first=&block;
 wmEventHandler_UI handler{{nullptr,WM_HANDLER_TYPE_UI,0},ui_popup_handler,ui_popup_handler_remove,&handle};
 int ghost=1;wmWindow win{nullptr,{&handler},&cursor,2,&ghost};wmWindowManager wm{{&win}};
 bScreen screen{{&popup},{&area}};current_screen=&screen;bContext C{&main,&wm,&win,&area,&canvas,&popup};
 GHOST_TEventPencilRingData packet{7,1,70,90,GHOST_kPencilRingHome,0,0};wmEvent event{PENCIL_RING_INPUT,EVT_DATA_PENCIL_RING,&packet,{70,90}};
 assert(UI_ipad_ring_event_dispatch(&C,&event)&&calls==1&&C.popup==&popup&&C.region==&canvas&&cursor.xy[0]==10&&cursor.xy[1]==20);
 win.modalhandlers.first=nullptr;UI_ipad_ring_event_dispatch(&C,&event);assert(calls==1);win.modalhandlers.first=&handler;
 handler.head.flag=WM_HANDLER_DO_FREE;UI_ipad_ring_event_dispatch(&C,&event);assert(calls==1);handler.head.flag=0;
 handler.user_data=nullptr;UI_ipad_ring_event_dispatch(&C,&event);assert(calls==1);handler.user_data=&handle;
 block.active=false;UI_ipad_ring_event_dispatch(&C,&event);assert(calls==1);block.active=true;
 packet.lifetime=8;UI_ipad_ring_event_dispatch(&C,&event);assert(calls==1);packet.lifetime=7;
 auto *valid_area=handle.ctx_area;handle.ctx_area=reinterpret_cast<ScrArea *>(uint64_t(1));UI_ipad_ring_event_dispatch(&C,&event);assert(calls==1);handle.ctx_area=valid_area;
 behavior=1;UI_ipad_ring_event_dispatch(&C,&event);assert(calls==2&&!C.area&&!C.region&&!C.popup&&cursor.xy[0]==10);
 screen.regionbase.first=&popup;screen.areabase.first=&area;C.area=&area;C.region=&canvas;C.popup=&popup;
 behavior=3;UI_ipad_ring_event_dispatch(&C,&event);assert(calls==3&&cursor.xy[0]==88&&cursor.xy[1]==99);
 behavior=2;UI_ipad_ring_event_dispatch(&C,&event);assert(calls==4&&C.main==&replacement);
}
'''.replace('HELPER',helper))

if __name__=='__main__':unittest.main()
