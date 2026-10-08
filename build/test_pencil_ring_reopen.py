"""Execute the native value queue/canvas/flush and scoped corner provenance.

Native action execution, popup construction, notifier dispatch and UIKit remain
fixture boundaries; the connected production boundary calls are checked too.
"""
import unittest
from test_compact_shelf import function
from test_touch_extrude import changed_source
import test_ipad_panels

NATIVE = changed_source('source/blender/editors/interface/regions/interface_region_menu_pie.cc')
PUBLIC = changed_source('source/blender/editors/include/UI_interface_c.hh')
EVENT = changed_source('source/blender/windowmanager/intern/wm_event_system.cc')
HANDLERS = changed_source('source/blender/editors/interface/interface_handlers.cc')

COMMON = r"""
#include <algorithm>
#include <array>
#include <cassert>
#include <cmath>
#include <cstdint>
#include <cstring>
#include <functional>
#include <string>
#include <vector>
#define WITH_APPLE_CROSSPLATFORM
#define LISTBASE_FOREACH(type,item,list) for(type item:*(list))
#define STREQ(a,b) (std::strcmp(a,b)==0)
template<typename T> int BLI_findindex(const std::vector<T*> *list,const T *item){
 auto found=std::find(list->begin(),list->end(),item);return found==list->end()?-1:int(found-list->begin());}
inline constexpr int SPACE_VIEW3D=1,RGN_TYPE_WINDOW=1,RGN_TYPE_HUD=2;
inline constexpr int WINDEACTIVATE=10,PENCIL_TOOL_PALETTE=11,EVT_ESCKEY=12,LEFTMOUSE=13,RIGHTMOUSE=14,KM_PRESS=1;
using wmOperatorStatus=int;
inline constexpr int OPERATOR_FINISHED=1,OPERATOR_CANCELLED=2,OPERATOR_RUNNING_MODAL=4,OPERATOR_INTERFACE=8;
struct ID{unsigned int session_uid=1;char name[66]="ID";};
struct Scene{ID id;};struct WorkSpace{ID id;};struct uiBlock{void *handle=nullptr;};
struct Runtime{bool visible=true;std::vector<uiBlock*> uiblocks;};
struct rcti{int xmin=0,xmax=800,ymin=0,ymax=600;};
struct ARegion{int regiontype=RGN_TYPE_WINDOW;Runtime *runtime;void *regiondata=(void*)1;rcti winrct{};};
struct ScrArea{int spacetype=SPACE_VIEW3D;std::vector<ARegion*> regionbase;};
struct bScreen{ID id;std::vector<ScrArea*> areabase;std::vector<ARegion*> regionbase;};
struct wmEvent{int type=0,val=0;int xy[2]={};};
struct wmWindow{int winid=1;wmEvent *eventstate;Scene *scene;bScreen *screen;WorkSpace *workspace;
 std::string tool="builtin.move";int mode=0;};
struct wmWindowManager{ID id;std::vector<wmWindow*> windows;};
struct Main{std::vector<wmWindowManager*> wm;std::vector<Scene*> scenes;std::vector<bScreen*> screens;
 std::vector<WorkSpace*> workspaces;};
struct bContext{Main *main;wmWindowManager *wm;wmWindow *window;ScrArea *area;ARegion *region,*popup=nullptr;bool safe=true;};
Main *CTX_data_main(bContext*C){return C->main;}wmWindowManager *CTX_wm_manager(bContext*C){return C->wm;}
wmWindow *CTX_wm_window(bContext*C){return C->window;}ScrArea *CTX_wm_area(bContext*C){return C->area;}
ARegion *CTX_wm_region(bContext*C){return C->region;}ARegion *CTX_wm_region_popup(bContext*C){return C->popup;}
void CTX_wm_window_set(bContext*C,wmWindow*p){C->window=p;}void CTX_wm_area_set(bContext*C,ScrArea*p){C->area=p;}
void CTX_wm_region_set(bContext*C,ARegion*p){C->region=p;}void CTX_wm_region_popup_set(bContext*C,ARegion*p){C->popup=p;}
Scene *WM_window_get_active_scene(wmWindow*w){return w->scene;}bScreen *WM_window_get_active_screen(wmWindow*w){return w->screen;}
WorkSpace *WM_window_get_active_workspace(wmWindow*w){return w->workspace;}bool WM_event_ipad_mode_safe(bContext*C){return C->safe;}
bool UI_ipad_context_capture(bContext*C,uint64_t v[13]){
 if(!C->window||!C->area||!C->region||C->region->regiontype!=RGN_TYPE_WINDOW)return false;
 v[0]=uintptr_t(C->main);v[1]=uintptr_t(C->window);v[2]=uintptr_t(C->window->screen);
 v[3]=uintptr_t(C->area);v[4]=uintptr_t(C->region);v[5]=C->window->screen->id.session_uid;
 v[6]=C->window->scene->id.session_uid;v[7]=1;v[8]=2;v[9]=C->window->mode;v[10]=111;
 v[11]=C->window->winid;v[12]=C->wm->id.session_uid;return true;}
bool UI_ipad_context_matches(bContext*C,const uint64_t *v){uint64_t fresh[13];return UI_ipad_context_capture(C,fresh)&&std::equal(fresh,fresh+13,v);}
std::string ui_ipad_ring_tool_identity(bContext*C){return C->window?C->window->tool:std::string{};}
namespace ipad_ring{struct ActionOrigin{std::array<uint64_t,13>context{};uint64_t lifetime=1;bool corner=false;const char*tool="builtin.move";bool present()const{return lifetime!=0;}};}
REQUEST
RESTORE
int opens=0;uint64_t lifetime=100;ScrArea *opened_area=nullptr;ARegion *opened_region=nullptr;std::string opened_menu;
std::function<void(bContext*)> during_create;
wmOperatorStatus ui_ipad_ring_invoke(bContext*C,const char *menu,const wmEvent*,bool,const uiIPadRingReopenRequest*){
 assert(C->region&&C->region->regiontype==RGN_TYPE_WINDOW);assert(BLI_findindex(&C->area->regionbase,C->region)!=-1);
 ++opens;++lifetime;opened_area=C->area;opened_region=C->region;opened_menu=menu;if(during_create)during_create(C);return OPERATOR_INTERFACE;}
PENDING
struct Fixture{Runtime rr,hudr;ARegion canvas{RGN_TYPE_WINDOW,&rr},hud{RGN_TYPE_HUD,&hudr};ScrArea area{SPACE_VIEW3D,{&canvas,&hud}};
 Scene scene;WorkSpace oldws,newws;bScreen screen;wmEvent state;wmWindow win{1,&state,&scene,&screen,&oldws};wmWindowManager wm;Main main;
 bContext C{&main,&wm,&win,&area,&canvas};
 Fixture(){scene.id.session_uid=10;screen.id.session_uid=20;wm.id.session_uid=30;oldws.id.session_uid=40;newws.id.session_uid=41;
 std::memcpy(oldws.id.name,"WSOld",6);std::memcpy(newws.id.name,"WSNew",6);screen.areabase={&area};wm.windows={&win};
 main.wm={&wm};main.scenes={&scene};main.screens={&screen};main.workspaces={&oldws,&newws};}
 uiIPadRingReopenRequest request(){uiIPadRingReopenRequest r;assert(UI_ipad_context_capture(&C,r.context));r.menu="VIEW3D_MT_ipad_tool_inventory";
 r.anchor[0]=400;r.anchor[1]=300;r.phase=8;return r;}
};
"""

class PencilRingReopenTests(unittest.TestCase):
    def source(self, include_pending=True):
        request = function(PUBLIC, 'struct uiIPadRingReopenRequest {') + ';'
        restore = function(NATIVE, 'void ui_ipad_action_context_restore(')
        pending = ''
        if include_pending:
            start = NATIVE.index('struct uiIPadRingPendingReopen {')
            end = NATIVE.index('bool UI_ipad_ring_menu(', start)
            pending = NATIVE[start:end]
            # Capture is exercised by existing presented-action fixtures; this
            # test executes queue/flush against value requests and fresh lists.
            capture = function(pending, 'bool UI_ipad_ring_reopen_capture(')
            pending = pending.replace(capture, '')
        return COMMON.replace('REQUEST', request).replace('RESTORE', restore).replace('PENDING', pending)

    def run_cpp(self, source):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(source)

    def test_terminal_queue_fresh_owners_and_workspace_notifier(self):
        self.run_cpp(self.source() + r"""
int main(){Fixture f;auto request=f.request();
 UI_ipad_ring_reopen_queue(&f.C,request,OPERATOR_RUNNING_MODAL);UI_ipad_ring_reopen_queue(&f.C,request,OPERATOR_INTERFACE);assert(ui_ipad_ring_pending_reopens.empty());
 UI_ipad_ring_reopen_queue(&f.C,request,OPERATOR_FINISHED);f.win.tool="builtin.rotate";UI_ipad_ring_reopen_flush(&f.C,false);
 assert(opens==1&&lifetime==101&&opened_region==&f.canvas&&f.C.window==&f.win&&f.C.region==&f.canvas);
 // Native Undo decoded a new registered Scene before status queueing; old Scene is never followed.
 Scene decoded;decoded.id.session_uid=11;f.main.scenes={&decoded};f.win.scene=&decoded;
 UI_ipad_ring_reopen_queue(&f.C,request,OPERATOR_FINISHED);UI_ipad_ring_reopen_flush(&f.C,false);assert(opens==2);
 UI_ipad_ring_reopen_queue(&f.C,request,OPERATOR_CANCELLED);UI_ipad_ring_reopen_flush(&f.C,false);assert(opens==3);
 // An unrelated post-dispatch scene change must not borrow the prior success.
 UI_ipad_ring_reopen_queue(&f.C,request,OPERATOR_FINISHED);decoded.id.session_uid++;UI_ipad_ring_reopen_flush(&f.C,false);assert(opens==3);
 auto workspace=f.request();assert(UI_ipad_ring_reopen_workspace_target(&f.C,workspace,"New"));
 UI_ipad_ring_reopen_queue(&f.C,workspace,OPERATOR_FINISHED);UI_ipad_ring_reopen_flush(&f.C,false);
 assert(opens==3&&ui_ipad_ring_pending_reopens.size()==1);
 Runtime nr;ARegion next{RGN_TYPE_WINDOW,&nr};ScrArea next_area{SPACE_VIEW3D,{&next}};bScreen next_screen;next_screen.id.session_uid=21;
 next_screen.areabase={&next_area};f.main.screens.push_back(&next_screen);f.win.screen=&next_screen;f.win.workspace=&f.newws;
 UI_ipad_ring_reopen_flush(&f.C,true);assert(opens==4&&opened_area==&next_area&&opened_region==&next);
 assert(f.C.region==nullptr&&f.C.area==nullptr); // Old WINDOW is not restored into the new screen.
 // No View3D in target layout: preserve native editor, refuse the obsolete canvas.
 f.C.area=&next_area;f.C.region=&next;auto none=f.request();assert(UI_ipad_ring_reopen_workspace_target(&f.C,none,"New"));
 UI_ipad_ring_reopen_queue(&f.C,none,OPERATOR_FINISHED);next_area.spacetype=99;UI_ipad_ring_reopen_flush(&f.C,true);assert(opens==4);
 next_area.spacetype=SPACE_VIEW3D;auto close=f.request();assert(UI_ipad_ring_reopen_workspace_target(&f.C,close,"New"));
 UI_ipad_ring_reopen_queue(&f.C,close,OPERATOR_FINISHED);wmEvent squeeze;squeeze.type=PENCIL_TOOL_PALETTE;squeeze.val=KM_PRESS;
 assert(UI_ipad_ring_reopen_cancel_pending(&f.C,&squeeze));UI_ipad_ring_reopen_flush(&f.C,true);assert(opens==4);
 // Unknown popup/native modal admission and changed window lifetime cannot revive intent.
 UI_ipad_ring_reopen_queue(&f.C,close,OPERATOR_CANCELLED);uiBlock popup{(void*)1};Runtime pr;pr.uiblocks={&popup};ARegion pop{3,&pr};next_screen.regionbase={&pop};
 UI_ipad_ring_reopen_flush(&f.C,false);assert(opens==4);next_screen.regionbase.clear();
 UI_ipad_ring_reopen_queue(&f.C,close,OPERATOR_CANCELLED);f.C.safe=false;UI_ipad_ring_reopen_flush(&f.C,false);assert(opens==4);f.C.safe=true;
 for(int n=0;n<10000;++n){UI_ipad_ring_reopen_queue(&f.C,close,OPERATOR_CANCELLED);++f.win.winid;
  UI_ipad_ring_reopen_flush(&f.C,false);assert(opens==4);close=f.request();}
 // A creator changing Main must return without restoring any old owners.
 Main replacement;UI_ipad_ring_reopen_queue(&f.C,close,OPERATOR_FINISHED);
 during_create=[&](bContext*C){C->main=&replacement;C->wm=nullptr;C->window=nullptr;C->area=nullptr;C->region=nullptr;};
 UI_ipad_ring_reopen_flush(&f.C,false);assert(opens==5&&f.C.main==&replacement&&f.C.window==nullptr);
}
""")

    def test_actual_leaf_dispatch_status_and_refused_properties_cleanup(self):
        leaf = function(HANDLERS,'static bool ui_ipad_ring_reopen_leaf(')
        view_bit = function(HANDLERS,'static int ui_ipad_view_action_bit(')
        start = HANDLERS.index('    bool ipad_ring_allowed =')
        action = HANDLERS[start:HANDLERS.index('    if (after.rnapoin.data && allowed())',start)]
        self.run_cpp(self.source() + r"""
namespace blender::wm{using OpCallContext=int;}
inline constexpr int NC_SPACE=1,ND_SPACE_VIEW3D=2,PROP_STRING=1;
struct PropertyRNA{int kind=PROP_STRING;const char *name="data_path";};
struct PointerRNA{void *type=(void*)1;std::string data_path="window.workspace",value="New";};
struct wmOperatorType{const char *idname="VIEW3D_OT_ipad_native_tool";void *srna=(void*)1;
 struct{void *first=nullptr;}macro;bool depends=false;};
PropertyRNA path_property,value_property{PROP_STRING,"value"};
PropertyRNA *RNA_struct_find_property(PointerRNA*,const char *name){return STREQ(name,"data_path")?&path_property:STREQ(name,"value")?&value_property:nullptr;}
int RNA_property_type(PropertyRNA*p){return p->kind;}
int RNA_property_string_length(PointerRNA*p,PropertyRNA*r){return int((STREQ(r->name,"data_path")?p->data_path:p->value).size());}
void RNA_property_string_get(PointerRNA*p,PropertyRNA*r,char *value){auto &text=STREQ(r->name,"data_path")?p->data_path:p->value;std::memcpy(value,text.c_str(),text.size()+1);}
bool WM_operator_depends_on_cursor(bContext&,wmOperatorType&t,PointerRNA*){return t.depends;}
struct uiIPadOperatorReceipt{wmOperatorType *type=nullptr;};
struct uiAfterFunc{bool ipad_ring_guarded=true;uint64_t ipad_ring_context[13]={};std::string ipad_ring_tool="builtin.move";
 uint64_t ipad_ring_lifetime=1;std::string ipad_ring_selection_target;wmOperatorType *optype=nullptr;
 int opcontext=1;PointerRNA *opptr=nullptr;std::string drawstr;ipad_ring::ActionOrigin ipad_action_origin{};
 uiIPadOperatorReceipt ipad_operator;uiIPadRingReopenRequest ipad_ring_reopen;};
wmOperatorType *ui_ipad_operator_resolve(const uiIPadOperatorReceipt&r){return r.type;}
bool ui_ipad_view_dispatch_allowed(bContext*,const uiAfterFunc&,wmOperatorType*,PointerRNA*){return true;}
struct uiIPadActionOriginScope{explicit uiIPadActionOriginScope(const ipad_ring::ActionOrigin&){};};
int direct_calls=0,fallback_calls=0,property_frees=0,returned_status=OPERATOR_FINISHED;
wmOperatorStatus WM_operator_name_call_ptr(bContext*C,wmOperatorType*,int,PointerRNA*,void*){
 ++direct_calls;C->window->tool="builtin.rotate";return returned_status;}
void WM_operator_name_call_ptr_with_depends_on_cursor(bContext*,wmOperatorType*,int,PointerRNA*,void*,std::string){++fallback_calls;}
void WM_operator_properties_free(PointerRNA*){++property_frees;}
void WM_main_add_notifier(int,void*){}
void ui_ipad_ring_selection_rebase(bContext*,const uint64_t*,const std::string&,const std::string&,uint64_t){}
VIEWBIT
LEAF
void dispatch(bContext*C,uiAfterFunc after){const auto allowed=[&](){return C->safe;};PointerRNA opptr=after.opptr?*after.opptr:PointerRNA{};ACTION}
int main(){Fixture f;wmOperatorType type;PointerRNA props;
 auto record=[&](){f.win.tool="builtin.move";uiAfterFunc after;assert(UI_ipad_context_capture(&f.C,after.ipad_ring_context));
  after.optype=&type;after.ipad_operator.type=&type;after.opptr=&props;after.ipad_ring_reopen=f.request();return after;};
 // Native action changes the old tool receipt; successful reopening queues from fresh window membership.
 auto success=record();dispatch(&f.C,success);assert(direct_calls==1&&property_frees==1&&ui_ipad_ring_pending_reopens.size()==1);
 UI_ipad_ring_reopen_flush(&f.C,false);assert(opens==1&&f.win.tool=="builtin.rotate");
 returned_status=OPERATOR_CANCELLED;dispatch(&f.C,record());assert(direct_calls==2&&property_frees==2&&ui_ipad_ring_pending_reopens.size()==1);
 UI_ipad_ring_reopen_flush(&f.C,false);assert(opens==2);
 for(int status:{OPERATOR_RUNNING_MODAL,OPERATOR_INTERFACE}){returned_status=status;dispatch(&f.C,record());assert(ui_ipad_ring_pending_reopens.empty());}
 assert(direct_calls==4&&property_frees==4);
 // Predispatch owner/tool/modal/type rejection still releases transferred properties, never queues.
 auto stale=record();f.win.tool="changed-tool";dispatch(&f.C,stale);assert(direct_calls==4&&property_frees==5&&ui_ipad_ring_pending_reopens.empty());
 auto blocked=record();f.C.safe=false;dispatch(&f.C,blocked);assert(direct_calls==4&&property_frees==6);f.C.safe=true;
 auto removed=record();removed.ipad_operator.type=nullptr;dispatch(&f.C,removed);assert(direct_calls==4&&property_frees==7);
 // Cursor, macro, category and native dialog cases retain the existing native helper.
 for(const char *name:{"WM_OT_call_menu_pie","VIEW3D_OT_ipad_transform_numbers","VIEW3D_OT_unlisted"}){
  type.idname=name;dispatch(&f.C,record());}
 type.idname="VIEW3D_OT_ipad_native_tool";type.depends=true;dispatch(&f.C,record());type.depends=false;
 type.macro.first=(void*)1;dispatch(&f.C,record());type.macro.first=nullptr;
 assert(fallback_calls==5&&property_frees==12&&ui_ipad_ring_pending_reopens.empty());
 // Only the exact typed window.workspace route may carry a workspace target.
 returned_status=OPERATOR_FINISHED;type.idname="WM_OT_context_set_id";auto workspace=record();
 dispatch(&f.C,workspace);assert(direct_calls==5&&ui_ipad_ring_pending_reopens.size()==1);
 assert(ui_ipad_ring_pending_reopens[0].request.requested_workspace_uid==f.newws.id.session_uid);
 ui_ipad_ring_pending_reopens.clear();props.data_path="scene.camera";dispatch(&f.C,record());assert(fallback_calls==6);
 props.data_path="window.workspace";props.type=(void*)2;dispatch(&f.C,record());assert(fallback_calls==7);props.type=type.srna;
 props.value.assign(128,'x');dispatch(&f.C,record());assert(fallback_calls==8&&ui_ipad_ring_pending_reopens.empty());
 assert(property_frees==16);
}
""".replace('VIEWBIT',view_bit).replace('LEAF',leaf).replace('ACTION',action))

    def test_corner_hud_proof_is_same_area_and_window_only(self):
        origin = function(NATIVE, 'bool ui_ipad_action_origin_valid(')
        self.run_cpp(self.source(False) + origin + r"""
int main(){Fixture f;ipad_ring::ActionOrigin origin;assert(UI_ipad_context_capture(&f.C,origin.context.data()));
 f.C.region=&f.hud;assert(!ui_ipad_action_origin_valid(&f.C,origin));origin.corner=true;
 assert(ui_ipad_action_origin_valid(&f.C,origin)&&f.C.region==&f.hud);
 f.win.tool="builtin.scale";assert(!ui_ipad_action_origin_valid(&f.C,origin)&&f.C.region==&f.hud);f.win.tool="builtin.move";
 ScrArea other{SPACE_VIEW3D,{&f.hud}};f.screen.areabase.push_back(&other);f.C.area=&other;assert(!ui_ipad_action_origin_valid(&f.C,origin));
 f.C.area=&f.area;f.area.regionbase={&f.hud};assert(!ui_ipad_action_origin_valid(&f.C,origin));f.area.regionbase={&f.canvas,&f.hud};
 f.wm.id.session_uid++;assert(!ui_ipad_action_origin_valid(&f.C,origin));
}
""")

    def test_reopened_visible_page_and_browse_phase_share_native_seed(self):
        invoke = function(NATIVE,'static wmOperatorStatus ui_ipad_ring_invoke(')
        seed_start = invoke.index('if (reopen) {')
        seed = invoke[seed_start:invoke.index('\n  uiPopupBlockHandle *menu', seed_start)]
        creator = function(NATIVE,'static uiBlock *ui_ipad_ring_create(')
        proof_start = creator.index('if (data.reopen_phase_pending) {')
        proof = creator[proof_start:creator.index('\n    const auto geometry', proof_start)]
        request = function(PUBLIC,'struct uiIPadRingReopenRequest {') + ';'
        self.run_cpp(r"""
#include <cassert>
#include <cmath>
#include <cstdint>
#include <limits>
#include <string>
using wmOperatorStatus=int;
REQUEST
namespace ipad_ring {enum class RingKind{Inventory,Workspaces,View};}
struct bContext{};struct uiBlock{};
std::string tools="complete-tools",workspaces="1:Old2:New";
std::string ui_ipad_ring_native_inventory(uiBlock*){return tools;}
std::string ui_ipad_ring_workspace_inventory(void*){return workspaces;}
void *CTX_data_main(bContext*){return nullptr;}
struct Data{float phase=0;struct{float phase=0;}browse;bool reopen_phase_pending=false;
 std::string reopen_tool_inventory,reopen_workspace_inventory;};
int main(){Data state;Data *data=&state;uiIPadRingReopenRequest request;request.phase=8;
 request.tool_inventory=tools;const uiIPadRingReopenRequest *reopen=&request;
 SEED
 assert(state.phase==8&&state.browse.phase==8&&state.reopen_phase_pending);
 bContext context;auto *C=&context;uiBlock native;auto *block=&native;
 const auto prepare=[&](ipad_ring::RingKind kind){Data &data=state;PROOF};
 prepare(ipad_ring::RingKind::Inventory);assert(state.phase==8&&state.browse.phase==8&&!state.reopen_phase_pending);
 SEED
 tools="changed-complete-tools";prepare(ipad_ring::RingKind::Inventory);assert(state.phase==0&&state.browse.phase==0);
 request.phase=13;request.workspace_inventory=workspaces;
 SEED
 prepare(ipad_ring::RingKind::Workspaces);assert(state.phase==13&&state.browse.phase==13);
 SEED
 workspaces="deleted-or-reordered";prepare(ipad_ring::RingKind::Workspaces);assert(state.phase==0&&state.browse.phase==0);
 request.phase=std::numeric_limits<float>::quiet_NaN();
 SEED
 assert(state.phase==0&&state.browse.phase==0&&!state.reopen_phase_pending);
}
""".replace('REQUEST',request).replace('SEED',seed).replace('PROOF',proof))

    def test_connected_cleanup_and_fresh_root_lifetime(self):
        event_flush = EVENT.index('UI_ipad_ring_reopen_flush(C, false);')
        self.assertLess(EVENT.rfind('wm_event_free_last_handled(win, event);',0,event_flush),event_flush)
        self.assertLess(EVENT.rfind('ED_undo_touch_recover(C)',0,event_flush),event_flush)
        # The exact notifier tail is in the overlay; its distant signature
        # need not be included merely to satisfy a fixture extractor.
        tail_start = EVENT.index('wm_test_foreign_file_warning(C);')
        tail_end = EVENT.index('GPU_render_end();', tail_start)
        self.assertIn('UI_ipad_ring_reopen_flush(C, true);', EVENT[tail_start:tail_end])
        self.assertIn('UI_ipad_ring_reopen_cancel_pending(C, event)',EVENT)
        invoke = function(NATIVE,'static wmOperatorStatus ui_ipad_ring_invoke(')
        self.assertIn('data->lifetime = ui_ipad_ring_next_lifetime++;',invoke)
        self.assertIn('data->browse.open(data->lifetime);',invoke)
        self.assertIn('data->reopen_phase_pending = data->phase != 0;',invoke)
        creator = function(NATIVE,'static uiBlock *ui_ipad_ring_create(')
        self.assertIn('data.reopen_tool_inventory == ui_ipad_ring_native_inventory(block)',creator)
        self.assertIn('if (!tools_match && !workspaces_match) data.phase = data.browse.phase = 0;',creator)
        self.assertIn('data->browse.phase = data->phase;',invoke)

if __name__ == '__main__':
    unittest.main()
