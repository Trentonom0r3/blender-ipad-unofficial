
#include <algorithm>
#include <array>
#include <cassert>
#include <cstdint>
#include <cstring>
#include <iostream>
#include <type_traits>
#include <cmath>
#include <limits>
#include <map>
#include <set>
#include <string>
#include <vector>
#define WITH_APPLE_CROSSPLATFORM 1
#define LISTBASE_FOREACH(T,v,l) for(T v=static_cast<T>((l)->first);v;v=reinterpret_cast<T>(reinterpret_cast<Link*>(v)->next))
#define BLI_assert(x) assert(x)
#define OPERATOR_RETVAL_CHECK(x) assert((x)&(OPERATOR_CANCELLED|OPERATOR_FINISHED|OPERATOR_RUNNING_MODAL|OPERATOR_PASS_THROUGH))
template<class T,class...U>bool ELEM(const T&x,const U&...v){return((x==v)||...);}
struct Link{void*next=nullptr,*prev=nullptr;};
struct ListBase{void*first=nullptr,*last=nullptr;};
static void BLI_addtail(ListBase*l,void*p){auto*n=(Link*)p;n->next=nullptr;n->prev=l->last;if(l->last)((Link*)l->last)->next=p;else l->first=p;l->last=p;}
static int BLI_findindex(const ListBase*l,const void*p){int i=0;for(auto*n=(Link*)l->first;n;n=(Link*)n->next,++i)if(n==p)return i;return -1;}
static void BLI_remlink(ListBase*l,void*p){auto*n=(Link*)p;if(n->prev)((Link*)n->prev)->next=n->next;else l->first=n->next;if(n->next)((Link*)n->next)->prev=n->prev;else l->last=n->prev;n->next=n->prev=nullptr;}
static bool BLI_listbase_is_empty(const ListBase*l){return !l->first;}
constexpr int WM_HANDLER_TYPE_OP=1,WM_HANDLER_TYPE_UI=2,WM_HANDLER_DO_FREE=4,RGN_TYPE_WINDOW=5,RGN_TYPE_HUD=6,SPACE_VIEW3D=7,VIEW_LAYER_OUT_OF_SYNC=8,OB_MESH=9,OB_MODE_EDIT=16;
constexpr int IPAD_KNIFE_ACTION=100,EVT_DATA_IPAD_KNIFE_ACTION=101,KM_NOTHING=0;
constexpr int OPERATOR_PASS_THROUGH=1,OPERATOR_CANCELLED=2,OPERATOR_FINISHED=4,OPERATOR_RUNNING_MODAL=8,OPTYPE_UNDO=1,WM_HANDLER_BREAK=2,WM_HANDLER_HANDLED=4,NC_SPACE=1,ND_SPACE_INFO_REPORT=2;
using wmOperatorStatus=int;using eHandlerActionFlag=int;
struct ID{uint64_t session_uid=0;};
struct BMEditMesh{void*bm=(void*)1;};struct MeshRuntime{BMEditMesh*edit_mesh=nullptr;};struct Mesh:Link{ID id;MeshRuntime*runtime=nullptr;};
struct Object:Link{ID id;int type=OB_MESH,mode=OB_MODE_EDIT;void*data=nullptr;};
struct Base:Link{Object*object=nullptr;};
struct ViewLayer:Link{int flag=0;Base*basact=nullptr;ListBase object_bases;std::string name="Layer";};
struct Scene:Link{ID id;ListBase view_layers;};
struct wmDrawBuffer;
struct rcti{int xmin=0,xmax=799,ymin=0,ymax=599;};
struct ARegionType {ListBase drawcalls;bool do_lock=false;void(*draw)()=nullptr;void(*layout)()=nullptr;};
struct ARegionRuntime{int do_draw=0;bool visible=true,ipad_canvas=true;ARegionType*type=nullptr;void*headerstr=nullptr;rcti ipad_canvas_rect;wmDrawBuffer*draw_buffer=nullptr;bool ipad_finger_paint_overlay_blocked=false;bool ipad_finger_paint_navigation_drawn=false;bool ipad_knife_canvas_unknown_widgets=false;std::array<uint64_t,23>ipad_knife_canvas_drawn_owner{};};
struct uiBut;
struct ARegion:Link{int regiontype=RGN_TYPE_WINDOW;int flag=0;rcti winrct;ARegionRuntime*runtime=nullptr;void*regiondata=nullptr;uiBut*active_button=nullptr;};
struct ScrArea:Link{int spacetype=SPACE_VIEW3D;int winx=800,winy=600;int flag=0;struct{rcti ipad_navigation_rect;}runtime;ListBase regionbase,spacedata;};
struct bScreen:Link{ID id;ListBase areabase;ARegion*active_region=nullptr;};
struct WorkSpaceLayout:Link{bScreen*screen=nullptr;};struct WorkSpace:Link{ID id;ListBase layouts;};struct WorkSpaceInstanceHook{WorkSpace*active=nullptr;WorkSpaceLayout*act_layout=nullptr;};struct NativeEventState{int xy[2]{};struct{float tilt[2]{};}tablet;};struct wmWindowRuntime{};
struct wmWindow:Link{int winid=17;void*stereo3d_format=nullptr;NativeEventState*eventstate=nullptr;WorkSpaceInstanceHook*workspace_hook=nullptr;wmWindowRuntime*runtime=nullptr;ListBase modalhandlers;bScreen*screen=nullptr;Scene*scene=nullptr;char view_layer_name[64]="Layer";};
struct wmWindowManagerRuntime{bool is_interface_locked=false;ListBase paintcursors,drags;};struct wmWindowManager:Link{wmWindowManagerRuntime*runtime=nullptr;ID id;ListBase windows;int op_undo_depth=0;};
struct Main{ListBase wm,screens,scenes,objects,meshes,workspaces;};
struct bContext{wmWindowManager*wm=nullptr;wmWindow*win=nullptr;ScrArea*area=nullptr;ARegion*region=nullptr;};
struct ReportList{ListBase list;};
struct wmOperatorType{uint64_t ipad_lifetime_id=0;int flag=OPTYPE_UNDO;bool modalkeymap=true;};
struct wmOperator{wmOperatorType*type=nullptr;wmOperator*opm=nullptr;ReportList*reports=nullptr;ListBase macro;void*customdata=nullptr;};
struct wmEventHandler{void*next=nullptr,*prev=nullptr;int type=WM_HANDLER_TYPE_OP,flag=0;};
struct HandlerContext{wmWindow*win=nullptr;ScrArea*area=nullptr;ARegion*region=nullptr,*region_popup=nullptr;};
struct wmEventHandler_Op{wmEventHandler head;wmOperator*op=nullptr;HandlerContext context;bool is_fileselect=false;uint64_t ipad_knife_owner[23]{};};
using HandleFn=void(*)();
struct wmEventHandler_UI{wmEventHandler head;HandleFn handle_fn=nullptr,remove_fn=nullptr;void*user_data=nullptr;HandlerContext context;};
struct PanelType{bool knife=false;};struct Panel{PanelType*type=nullptr;};struct uiBlock{Panel*panel=nullptr;};struct uiBut{void*active=nullptr;uiBlock*block=nullptr;};
static void ui_handler_region_menu(){}static void foreign_ui(){}
static uiBut*ui_region_find_active_but(ARegion*r){return r->active_button;}
static bool UI_ipad_knife_hud_panel_type(const PanelType*t){return t&&t->knife;}
struct MeshKnifeModalOrigin{Scene*scene=nullptr;ViewLayer*view_layer=nullptr;void*v3d=nullptr;ARegion*region=nullptr;void*rv3d=nullptr;Object*object=nullptr;};
struct wmEvent{int type=0,val=0,xy[2]{};int custom=0;void*customdata=nullptr;bool customdata_free=false;};
struct wmEvent_ModalMapStore{};
static Main*G_MAIN=nullptr;
static wmOperatorType*registered_type=nullptr;
static std::map<const wmOperator*,uint64_t>lifetimes;
static std::map<const wmOperator*,MeshKnifeModalOrigin>origins;
static uint64_t next_lifetime=400;
static int lifetime_allocations=0,provider_callbacks=0,native_calls=0,finished_calls=0,free_calls=0,handler_free_calls=0,request_allocations=0,request_frees=0,modalmap_calls=0,reports_calls=0,view_find_calls=0;
static bool inside_ui=false,mutate_window_on_action=false;
static wmOperator*called_op=nullptr;static bool called_confirm=false;
static int native_result=OPERATOR_FINISHED;
static std::vector<wmEvent>event_queue;
static std::set<void*>requests;
static std::vector<std::string>trace;
static wmWindowManager*CTX_wm_manager(const bContext*C){return C?C->wm:nullptr;}
static wmWindow*CTX_wm_window(const bContext*C){return C?C->win:nullptr;}
static ScrArea*CTX_wm_area(const bContext*C){return C?C->area:nullptr;}
static ARegion*CTX_wm_region(const bContext*C){return C?C->region:nullptr;}
static void CTX_wm_area_set(bContext*C,ScrArea*a){C->area=a;C->region=nullptr;trace.push_back("area");}
static void CTX_wm_region_set(bContext*C,ARegion*r){C->region=r;trace.push_back("region");}
static bScreen*WM_window_get_active_screen(wmWindow*w){return w&&w->workspace_hook&&w->workspace_hook->act_layout?w->workspace_hook->act_layout->screen:nullptr;}
static Scene*WM_window_get_active_scene(wmWindow*w){return w?w->scene:nullptr;}
static ViewLayer*BKE_view_layer_find(Scene*s,const char*n){++view_find_calls;LISTBASE_FOREACH(ViewLayer*,v,&s->view_layers)if(v->name==n)return v;return nullptr;}
static ViewLayer*WM_window_get_active_view_layer(wmWindow*){++provider_callbacks;assert(false&&"Fallback-setting layer provider forbidden");return nullptr;}
static wmOperatorType*WM_operatortype_find(const char*n,bool){assert(std::string(n)=="MESH_OT_knife_tool");return registered_type;}
static bool WM_operator_touch_lifetime_matches(const wmOperator*op,uint64_t id){auto i=lifetimes.find(op);return id&&i!=lifetimes.end()&&i->second==id;}
static uint64_t WM_operator_touch_lifetime_id(wmOperator*op){auto i=lifetimes.find(op);if(i!=lifetimes.end())return i->second;++lifetime_allocations;return lifetimes[op]=++next_lifetime;}
static bool ED_mesh_knife_modal_type(const wmOperatorType*t){return t==registered_type;}

template<class T>T*MEM_new(const char*){auto*p=new T{};requests.insert(p);++request_allocations;return p;}
static void copy_v2_v2_int(int*a,const int*b){a[0]=b[0];a[1]=b[1];}
static void WM_event_add(wmWindow*w,const wmEvent*e){assert(w&&e&&e->customdata);assert(requests.count(e->customdata));event_queue.push_back(*e);trace.push_back("enqueue");}
static void wm_region_mouse_co(bContext*,wmEvent*){trace.push_back("mouse_co");}
static intptr_t wm_operator_undo_active_id(wmWindowManager*){return 10;}
static intptr_t wm_operator_register_active_id(wmWindowManager*){return 20;}
static wmOperatorStatus ED_mesh_knife_modal_action(bContext*C,wmOperator*op,wmEvent*,bool confirm){assert(!inside_ui);assert(C->wm->op_undo_depth==1);++native_calls;called_op=op;called_confirm=confirm;trace.push_back("native_action");if(mutate_window_on_action)C->win=nullptr;return native_result;}
static void wm_event_modalkeymap_end(wmEvent*,wmEvent_ModalMapStore*){++modalmap_calls;}
static void wm_operator_reports(bContext*,wmOperator*,int,bool){++reports_calls;}
static void WM_window_status_area_tag_redraw(wmWindow*){}
static void WM_event_add_notifier(bContext*,int,void*){}
static void WM_reports_from_reports_move(wmWindowManager*,ReportList*){}
static void wm_operator_finished(bContext*,wmOperator*op,bool,bool,bool,bool){++finished_calls;lifetimes.erase(op);origins.erase(op);trace.push_back("finished");}
static void WM_operator_free(wmOperator*op){++free_calls;lifetimes.erase(op);origins.erase(op);trace.push_back("free");}
static bool wm_event_always_pass(wmEvent*){return false;}
static void wm_gizmomaps_handled_modal_update(bContext*,wmEvent*,wmEventHandler_Op*){}
static void WM_cursor_grab_disable(wmWindow*,void*){}
static void wm_event_free_handler(wmEventHandler*){++handler_free_calls;trace.push_back("handler_free");}

#define LISTBASE_FOREACH_MUTABLE(T,v,l) for(auto v=static_cast<T>((l)->first),v##_next=v?static_cast<T>(v->next):nullptr;v;v=v##_next,v##_next=v?static_cast<T>(v->next):nullptr)
#define REGION_DRAW_POST_VIEW 7
static float ui_scale=1.0f;
#define UI_SCALE_FAC ui_scale
static int native_width=800,native_height=600;
static int WM_window_native_pixel_x(wmWindow*){return native_width;}
static int WM_window_native_pixel_y(wmWindow*){return native_height;}
struct KnifeViewContext{Scene*scene;ViewLayer*view_layer;void*v3d;ARegion*region;void*rv3d;Object*obedit;};
struct KnifeTool_OpData{KnifeViewContext vc;void*draw_handle=nullptr;};
static int executed=0;static bool saw_unknown_before=false,saw_known_before=false;
static void knifetool_draw(const bContext*,ARegion*r,void*){++executed;saw_known_before=r->runtime->ipad_knife_canvas_drawn_owner[0]!=0;}
static bool UI_ipad_knife_hud_ui_handler(const wmEventHandler*,ScrArea*,ARegion*){return false;}
