#include <cassert>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <initializer_list>
#include <string>
#include <vector>
using uint = unsigned int;
struct Link { Link *next=nullptr,*prev=nullptr; };
struct ListBase { void *first=nullptr,*last=nullptr; };
#define LISTBASE_FOREACH(type, var, list) for (type var=static_cast<type>((list)->first);var;var=reinterpret_cast<type>(var->next))
template<typename T,typename... Args> bool ELEM(T value,Args... options){return ((value==options)||...);}
#define BLI_assert assert
struct Counts {
 int poll=0,invoke=0,modal=0,cancel=0,paint=0,area_exit=0,region_exit=0,remove_handlers=0;
 int creates=0,frees=0,allocs=0,init=0,mousemove=0,notifier=0,main_notifier=0,refresh=0,redraw=0;
 int title=0,deg=0,snode=0,subtype_get=0,subtype_set=0,alignment_read=0,alignment_write=0;
 int registry_find=0,registry_span=0,wm_get=0,window_get=0,area_get=0,region_get=0,data_get=0;
 int side_effects() const {return poll+invoke+modal+cancel+paint+area_exit+region_exit+remove_handlers+creates+frees+allocs+init+mousemove+notifier+main_notifier+refresh+redraw+title+deg+snode+subtype_get+subtype_set+alignment_write;}
} counts;
std::vector<std::string> context_trace;
struct bContext;struct wmOperator;struct wmEvent {};struct ScrArea;struct Scene {};
struct wmWindowManager;struct wmWindow;struct ARegion;
using wmOperatorStatus=int;
struct wmOperatorType {
 const char *name=nullptr;std::string idname;const char *description=nullptr;
 wmOperatorStatus (*exec)(bContext *,wmOperator *)=nullptr;
 wmOperatorStatus (*invoke)(bContext *,wmOperator *,const wmEvent *)=nullptr;
 wmOperatorStatus (*modal)(bContext *,wmOperator *,const wmEvent *)=nullptr;
 bool (*poll)(bContext *)=nullptr;void (*cancel)(bContext *,wmOperator *)=nullptr;
 bool (*pyop_poll)(bContext *,wmOperatorType *)=nullptr;
 int flag=0;void *srna=nullptr;ListBase macro;
 struct {void *data=nullptr,*srna=nullptr,*call=nullptr,*free=nullptr;} rna_ext;
};
struct wmOperator {wmOperator *next=nullptr,*prev=nullptr;wmOperatorType *type=nullptr;ListBase macro;wmOperator *opm=nullptr;};
struct wmEventHandler {wmEventHandler *next=nullptr,*prev=nullptr;int type=0,flag=0;};
struct wmEventHandler_Op {wmEventHandler head;wmOperator *op=nullptr;bool is_fileselect=false;struct {wmWindow *win=nullptr;ScrArea *area=nullptr;ARegion *region=nullptr;short region_type=0;} context;};
struct SpaceLink {SpaceLink *next=nullptr,*prev=nullptr;int spacetype=0,link_flag=0;ListBase regionbase;};
struct ARegion {ARegion *next=nullptr,*prev=nullptr;int regiontype=0,alignment=0,flag=0;std::uint64_t canary=0;};
struct SpaceType {void (*exit)(wmWindowManager *,ScrArea *)=nullptr;void (*free)(SpaceLink *)=nullptr;SpaceLink *(*create)(ScrArea *,Scene *)=nullptr;void *space_subtype_item_extend=nullptr;int (*space_subtype_get)(ScrArea *)=nullptr;void (*space_subtype_set)(ScrArea *,int)=nullptr;};
struct ScrArea {ScrArea *next=nullptr,*prev=nullptr;int spacetype=0,butspacetype=0,butspacetype_subtype=0;SpaceType *type=nullptr;ListBase spacedata,regionbase,handlers;std::uint64_t canary=0;};
struct bScreen {ListBase areabase;};
struct wmWindow {wmWindow *next=nullptr,*prev=nullptr;ListBase modalhandlers;bScreen *screen=nullptr;Scene scene;};
struct wmWindowManager {wmWindowManager *next=nullptr,*prev=nullptr;ListBase windows;};
struct Main {ListBase wm;};Main *G_MAIN=nullptr;
struct bContext {Main *main=nullptr;wmWindowManager *wm=nullptr;wmWindow *window=nullptr;ScrArea *area=nullptr;ARegion *region=nullptr;};
struct PointerRNA {void *owner_id=nullptr,*data=nullptr;};
struct {bool background=false;} G;
enum {SPACE_EMPTY=0,SPACE_VIEW3D=1,SPACE_NODE=16,SPACE_TOPBAR=18,SPACE_STATUSBAR=19};
enum {WM_HANDLER_TYPE_UI=1,WM_HANDLER_TYPE_OP=2,WM_HANDLER_TYPE_KEYMAP=3,WM_HANDLER_DO_FREE=1<<1};
enum {OPTYPE_REGISTER=1,OPTYPE_UNDO=2,OPTYPE_BLOCKING=4,OPTYPE_MACRO=8};
enum {RGN_TYPE_WINDOW=0,RGN_TYPE_HEADER=1,RGN_TYPE_NUM=8,SPACE_FLAG_TYPE_TEMPORARY=1,SPACE_FLAG_TYPE_WAS_ACTIVE=2};
enum {NC_SPACE=1,ND_SPACE_CHANGED=2,NC_WINDOW=4,NC_NODE=8,ND_NODE_GIZMO=16,WM_CAPABILITY_WINDOW_DECORATION_STYLES=1};
constexpr float UI_PRECISION_FLOAT_MAX=1000000;
constexpr float NODE_EDGE_PAN_INSIDE_PAD=1,NODE_EDGE_PAN_OUTSIDE_PAD=2,NODE_EDGE_PAN_SPEED_RAMP=3,NODE_EDGE_PAN_MAX_SPEED=4,NODE_EDGE_PAN_DELAY=5,NODE_EDGE_PAN_ZOOM_INFLUENCE=6;
wmWindowManager *CTX_wm_manager(const bContext *C){++counts.wm_get;return C->wm;}
wmWindow *CTX_wm_window(const bContext *C){++counts.window_get;return C->window;}
ScrArea *CTX_wm_area(const bContext *C){++counts.area_get;return C->area;}
ARegion *CTX_wm_region(const bContext *C){++counts.region_get;return C->region;}
Main *CTX_data_main(const bContext *C){++counts.data_get;return C->main;}
bScreen *CTX_wm_screen(const bContext *C){return C->window->screen;}
void CTX_wm_window_set(bContext *C,wmWindow *win){context_trace.push_back("window");C->window=win;C->area=nullptr;C->region=nullptr;}
void CTX_wm_area_set(bContext *C,ScrArea *area){context_trace.push_back("area");C->area=area;C->region=nullptr;}
void CTX_wm_region_set(bContext *C,ARegion *region){context_trace.push_back("region");C->region=region;}
bScreen *WM_window_get_active_screen(wmWindow *win){return win->screen;}
Scene *WM_window_get_active_scene(wmWindow *win){return &win->scene;}
wmOperatorType *registered_native=nullptr;std::vector<wmOperatorType *> registered_types;
wmOperatorType *WM_operatortype_find(const char *name,bool){++counts.registry_find;return registered_native && registered_native->idname==name?registered_native:nullptr;}
struct OperatorSpan {const std::vector<wmOperatorType *> &values;auto begin()const{return values.begin();}auto end()const{return values.end();}};
OperatorSpan WM_operatortypes_registered_get(){++counts.registry_span;return {registered_types};}
wmOperatorStatus node_link_invoke(bContext *,wmOperator *,const wmEvent *){++counts.invoke;return 0;}
wmOperatorStatus node_link_modal(bContext *,wmOperator *,const wmEvent *){++counts.modal;return 0;}
bool ED_operator_node_editable(bContext *){++counts.poll;return true;}
void node_link_cancel(bContext *,wmOperator *){++counts.cancel;}
wmOperatorStatus unrelated_modal(bContext *,wmOperator *,const wmEvent *){++counts.modal;return 0;}
wmOperatorStatus unrelated_invoke(bContext *,wmOperator *,const wmEvent *){++counts.invoke;return 0;}
wmOperatorStatus unrelated_exec(bContext *,wmOperator *){++counts.invoke;return 0;}
bool unrelated_poll(bContext *){++counts.poll;return true;}
void unrelated_cancel(bContext *,wmOperator *){++counts.cancel;}
bool unrelated_pyop(bContext *,wmOperatorType *){++counts.poll;return true;}
void RNA_def_boolean(void *,const char *,bool,const char *,const char *){}
void RNA_def_float_array(void *,const char *,int,const float *,float,float,const char *,const char *,float,float){}
void UI_view2d_edge_pan_operator_properties_ex(wmOperatorType *,float,float,float,float,float,float){}
bool BLI_listbase_is_empty(const ListBase *list){return list->first==nullptr;}
bool BLI_listbase_is_single(const ListBase *list){return list->first && list->first==list->last;}
void BLI_listbase_clear(ListBase *list){list->first=list->last=nullptr;}
void BLI_freelinkN(ListBase *list,void *ptr);
void WM_event_modal_handler_area_replace(wmWindow *,const ScrArea *,ScrArea *);
void WM_event_modal_handler_region_replace(wmWindow *,const ARegion *,ARegion *);
bool paint_allowed=true;
bool screen_ipad_paint_owner_teardown_area(bContext *,ScrArea *){++counts.paint;return paint_allowed;}
void screen_ipad_context_restore_live(bContext *C,wmWindow *win,ScrArea *area,ARegion *region){CTX_wm_window_set(C,win);CTX_wm_area_set(C,area);CTX_wm_region_set(C,region);}
bool ED_region_exit(bContext *C,ARegion *region){++counts.region_exit;WM_event_modal_handler_region_replace(C->window,region,nullptr);return true;}
bool WM_event_remove_handlers(bContext *,ListBase *){++counts.remove_handlers;return true;}
void original_area_exit(wmWindowManager *,ScrArea *){++counts.area_exit;}
SpaceLink made_space;ARegion made_region;SpaceType node_space,view_space;
SpaceType *BKE_spacetype_from_id(int type){return type==SPACE_NODE?&node_space:type==SPACE_VIEW3D?&view_space:nullptr;}
SpaceLink *create_space(ScrArea *area,Scene *){++counts.creates;++counts.allocs;made_space={};made_region={};made_space.spacetype=area->spacetype;made_space.regionbase={&made_region,&made_region};return &made_space;}
void free_space(SpaceLink *){++counts.frees;}
void ED_area_init(bContext *,wmWindow *,ScrArea *){++counts.init;}
void WM_event_add_mousemove(wmWindow *){++counts.mousemove;}
void WM_event_add_notifier(bContext *,int,void *){++counts.notifier;}
void WM_main_add_notifier(int,void *){++counts.main_notifier;}
void ED_area_tag_refresh(ScrArea *){++counts.refresh;}
void ED_area_tag_redraw(ScrArea *){++counts.redraw;}
void WM_window_title(wmWindowManager *,wmWindow *){++counts.title;}
int WM_capabilities_flag(){return WM_CAPABILITY_WINDOW_DECORATION_STYLES;}
void DEG_tag_on_visible_update(Main *,bool){++counts.deg;}
namespace blender::ed::space_node {void snode_set_context(bContext &){++counts.snode;}}
struct RegionTypeAlignInfo {int unused=0;};
void region_align_info_from_area(ScrArea *,RegionTypeAlignInfo *){++counts.alignment_read;}
void region_align_info_to_area(ScrArea *,const RegionTypeAlignInfo *){++counts.alignment_write;}
int subtype_get(ScrArea *){++counts.subtype_get;return 7;}
void subtype_set(ScrArea *,int){++counts.subtype_set;}
