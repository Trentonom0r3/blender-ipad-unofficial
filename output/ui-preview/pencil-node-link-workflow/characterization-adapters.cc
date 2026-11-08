// Read-only characterization adapters. None of these types is a target ABI model.
#include <memory>
#include <deque>
#include <fstream>
namespace native_link {
using wmEventType=int;using wmEventModifierFlag=int;using eWM_EventFlag=int;using eHandlerActionFlag=int;using wmOperatorStatus=int;
constexpr int KM_NOTHING=0,KM_PRESS=1,KM_RELEASE=2,KM_CLICK=3,KM_DBL_CLICK=4,KM_PRESS_DRAG=5;
constexpr int WM_HANDLER_CONTINUE=0,WM_HANDLER_BREAK=1,WM_HANDLER_HANDLED=8,WM_HANDLER_MODAL=2;
constexpr int OPERATOR_CANCELLED=1,OPERATOR_FINISHED=2,OPERATOR_RUNNING_MODAL=4,OPERATOR_PASS_THROUGH=8,OPTYPE_UNDO=1;
constexpr int WM_EVENT_IS_REPEAT=2,WM_EVENT_FORCE_DRAG_THRESHOLD=8;
constexpr int SOCK_IN=1,SOCK_OUT=2,NTREE_CUSTOM=0,NTREE_SHADER=1,SOCK_CUSTOM=-1,SOCK_TEXTURE=99;
constexpr int WM_EVENT_IS_DIRECT_FINGER=1<<6,WM_EVENT_IS_DIRECT_TOOL=1<<7,WM_EVENT_IS_POINTER_CANCEL=1<<8;
constexpr int WM_LOG_EVENTS=0,V2D_LOCK_COPY=1;
#define BLI_assert(x) assert(x)
#define CLOG_DEBUG(...)
#define UNPACK2(a) (a)[0],(a)[1]
#define OPERATOR_RETVAL_CHECK(x) assert(x)
template<class T,class... U>bool ELEM(T n,U... xs){return ((n==xs)||...);}
struct int2{int v[2]{};int&operator[](int i){return v[i];}const int&operator[](int i)const{return v[i];}operator int*(){return v;}};
struct float2{float x=0,y=0;float&operator[](int i){return i?y:x;}};
struct rcti{int xmin=10,ymin=20,xmax=1010,ymax=1020;};
struct rctf{float xmin=0,ymin=0,xmax=500,ymax=500;};
struct View2D{rcti mask{0,0,1000,1000};rctf cur;};
struct wmTabletData{int active=1;float pressure=.4f;std::array<float,2>tilt{};bool is_motion_absolute=true;};
struct wmEvent{int type=0,val=0,xy[2]{},prev_xy[2]{},mval[2]{},modifier=0,keymodifier=0,flag=0,direction=0,prev_type=0,prev_val=0,prev_press_type=0,prev_press_modifier=0,prev_press_keymodifier=0,prev_press_xy[2]{};wmTabletData tablet;
 uint64_t ipad_hud_generation=0,ipad_hud_serial=0;};
struct wmOperator;struct wmEventHandler_Op;struct ListBase{wmEventHandler_Op*op=nullptr;};
struct Runtime{std::deque<wmEvent*>event_queue;};
struct wmWindow{wmEvent state;wmEvent*eventstate=&state;Runtime runtime;uint64_t eventstate_prev_press_time_ms=0;bool event_queue_check_drag=false,event_queue_check_click=false,event_queue_check_drag_handled=false;ListBase modalhandlers;};
struct bNode{int id=0;};struct bNodeSocket{int in_out=SOCK_OUT,type=0;bool multi=false;bool is_multi_input()const{return multi;}};
struct bNodeLink{bNode*fromnode=nullptr,*tonode=nullptr;bNodeSocket*fromsock=nullptr,*tosock=nullptr;};
template<class T>struct Vector:std::vector<T>{using std::vector<T>::vector;bool is_empty()const{return this->empty();}T&first(){return this->front();}const T&first()const{return this->front();}};
struct ARegion;struct ScrArea{};struct bScreen{};
struct View2DEdgePanData{View2D*v2d=nullptr;rctf initial_rect;ARegion*region=nullptr;bScreen*screen=nullptr;ScrArea*area=nullptr;};
struct bNodeLinkDrag{int in_out=SOCK_OUT,start_link_count=0,cursor[2]{};bNodeSocket*start_socket=nullptr;Vector<bNodeLink>links;bool swap_links=false;View2DEdgePanData pan_data;};
struct Tree{int type=NTREE_SHADER;struct{int x=0;}id;Vector<bNodeLink>links;};using bNodeTree=Tree;struct SpaceNodeRuntime{std::unique_ptr<bNodeLinkDrag>linkdrag;};struct SpaceNode{Tree*edittree;SpaceNodeRuntime*runtime;};
struct ARegion{rcti winrct;View2D v2d;};struct Main{};
struct wmKeyMapItem{int propvalue=0;};struct wmKeyMap{};
struct wmOperatorType{wmOperatorStatus(*modal)(struct bContext*,wmOperator*,const wmEvent*)=nullptr;void(*cancel)(struct bContext*,wmOperator*)=nullptr;int flag=OPTYPE_UNDO;wmKeyMap*modalkeymap=nullptr;};
struct wmOperator{wmOperatorType*type=nullptr;wmOperator*opm=nullptr;void*customdata=nullptr;void*ptr=nullptr;struct{int list=0;}report_value;decltype(report_value)*reports=&report_value;const char*idname="NODE_OT_link";bool freed=false;};
struct wmEventHandler{bool freed=false;};struct wmEventHandler_Op{wmEventHandler head;wmOperator*op=nullptr;ARegion*owner_region=nullptr;ScrArea*owner_area=nullptr;};
struct wmWindowManager{int op_undo_depth=0;};
struct bContext{wmWindow*win;wmWindowManager*wm;ARegion*region;SpaceNode*snode;Main*main;ScrArea*area;};
struct wmEvent_ModalMapStore{int prev_type=0,prev_val=0;bool dbl_click_disabled=false;};
struct{int drag_threshold_tablet=3,drag_threshold_mouse=3,drag_threshold=3,dbl_click_time=0;float widget_unit=20;}U;
constexpr float UI_SCALE_FAC=1;
wmWindow*CTX_wm_window(const bContext*C){return C->win;}wmWindowManager*CTX_wm_manager(const bContext*C){return C->wm;}ARegion*CTX_wm_region(const bContext*C){return C->region;}ScrArea*CTX_wm_area(const bContext*C){return C->area;}SpaceNode*CTX_wm_space_node(const bContext*C){return C->snode;}Main*CTX_data_main(const bContext*C){return C->main;}
void CTX_wm_region_set(bContext*C,ARegion*r){C->region=r;}void CTX_wm_area_set(bContext*C,ScrArea*a){C->area=a;}
int init_calls=0,modal_add_calls=0,poll_calls=0,find_calls=0,commit_calls=0,search_calls=0,finish_calls=0,operator_free_calls=0,handler_free_calls=0,cancel_edge_calls=0,redraw_calls=0,click_calls=0;
int click_event_xy=0,click_event_mval=0;float2 invoke_cursor;int2 invoke_event_mval,invoke_event_xy;int invoke_prev_press[2]{};bool admit_init=true,detach_prop=false,editable=true;Vector<int>cleanup_order;wmEventHandler_Op handler;wmOperator op;wmOperatorType optype;wmKeyMap modalmap;
bNode source_node{1},target_node{2};bNodeSocket output_socket{SOCK_OUT},input_socket{SOCK_IN};bool initial_detached_input=false,next_target=false;int complete_at_commit=0,incomplete_at_commit=0;
void copy_v2_v2_int(int*a,const int*b){a[0]=b[0];a[1]=b[1];}
void sub_v2_v2v2_int(int*r,const int*a,const int*b){r[0]=a[0]-b[0];r[1]=a[1]-b[1];}
bool WM_event_is_tablet(const wmEvent*e){return e->tablet.active==1;}
bool wm_action_not_handled(int a){return (a&(WM_HANDLER_HANDLED|WM_HANDLER_BREAK))==0;}
int WM_event_drag_direction(const wmEvent*){return 1;}
void wm_event_handler_return_value_check(bContext*,wmEvent*,int){}
void ED_preview_kill_jobs(wmWindowManager*,Main*){}
bool BKE_id_is_editable(Main*,const decltype(Tree::id)*){return editable;}
bool RNA_boolean_get(void*,const char*){return detach_prop;}
void RNA_float_set_array(void*,const char*,const float2&){}
void UI_view2d_region_to_view(const View2D*v,float x,float y,float*rx,float*ry){*rx=v->cur.xmin+(v->cur.xmax-v->cur.xmin)*(x-v->mask.xmin)/(v->mask.xmax-v->mask.xmin);*ry=v->cur.ymin+(v->cur.ymax-v->cur.ymin)*(y-v->mask.ymin)/(v->mask.ymax-v->mask.ymin);}
std::unique_ptr<bNodeLinkDrag> node_link_init(ARegion&,SpaceNode&,const float2 cursor,const bool detach){++init_calls;invoke_cursor=cursor;assert(detach==detach_prop);if(!admit_init)return {};auto d=std::make_unique<bNodeLinkDrag>();d->start_socket=initial_detached_input?&input_socket:&output_socket;d->start_link_count=initial_detached_input?1:0;d->in_out=SOCK_OUT;d->links.push_back({&source_node,initial_detached_input?&target_node:nullptr,&output_socket,initial_detached_input?&input_socket:nullptr});return d;}
void UI_view2d_edge_pan_operator_init(bContext*C,View2DEdgePanData*d,wmOperator*){d->v2d=&C->region->v2d;d->initial_rect=d->v2d->cur;d->region=C->region;}
void draw_draglink_tooltip_activate(ARegion&,bNodeLinkDrag&){}void draw_draglink_tooltip_deactivate(ARegion&,bNodeLinkDrag&){}
void WM_event_add_modal_handler(bContext*C,wmOperator*o){++modal_add_calls;handler.op=o;handler.owner_region=C->region;handler.owner_area=C->area;C->win->modalhandlers.op=&handler;}
void node_link_find_socket(bContext&,wmOperator&o,const float2&){++find_calls;auto&d=*static_cast<bNodeLinkDrag*>(o.customdata);for(auto&l:d.links){l.tonode=next_target?&target_node:nullptr;l.tosock=next_target?&input_socket:nullptr;}}
void add_dragged_links_to_tree(bContext&C,bNodeLinkDrag&d){++commit_calls;cleanup_order.push_back(10);for(auto&l:d.links){if(l.fromsock&&l.tosock)++complete_at_commit;else ++incomplete_at_commit;}C.snode->runtime->linkdrag.reset();}
void invoke_node_link_drag_add_menu(bContext&,bNode&,bNodeSocket&,const float2&){++search_calls;}
void UI_view2d_edge_pan_apply_event(bContext*,View2DEdgePanData*,const wmEvent*){}
void UI_view2d_edge_pan_cancel(bContext*,View2DEdgePanData*d){++cancel_edge_calls;cleanup_order.push_back(11);if(d->v2d)d->v2d->cur=d->initial_rect;}
void clear_picking_highlight(Vector<bNodeLink>*){}void BKE_ntree_update_tag_link_removed(Tree*){}void BKE_main_ensure_invariants(Main&,decltype(Tree::id)&){}void ED_region_tag_redraw(ARegion*){++redraw_calls;}
intptr_t wm_operator_undo_active_id(wmWindowManager*){return 7;}intptr_t wm_operator_register_active_id(wmWindowManager*){return 9;}
void wm_operator_reports(bContext*,wmOperator*,int,bool){cleanup_order.push_back(20);}void WM_window_status_area_tag_redraw(wmWindow*){}
void wm_operator_finished(bContext*,wmOperator*,bool,bool,bool,bool){++finish_calls;cleanup_order.push_back(30);}void WM_operator_free(wmOperator*o){o->freed=true;++operator_free_calls;cleanup_order.push_back(31);}
bool wm_event_always_pass(const wmEvent*){return false;}void wm_gizmomaps_handled_modal_update(bContext*,wmEvent*,wmEventHandler_Op*){}
void WM_cursor_grab_disable(wmWindow*,void*){cleanup_order.push_back(40);}void BLI_remlink(ListBase*l,wmEventHandler_Op*h){assert(l->op==h);l->op=nullptr;cleanup_order.push_back(50);}void wm_event_free_handler(wmEventHandler*h){h->freed=true;++handler_free_calls;cleanup_order.push_back(60);}
wmKeyMap*WM_keymap_active(wmWindowManager*,wmKeyMap*k){return k;}
wmKeyMapItem*wm_eventmatch_modal_keymap_items(wmKeyMap*,wmOperator*,const wmEvent*e){static wmKeyMapItem k;if(e->type==LEFTMOUSE&&e->val==KM_PRESS)k.propvalue=0;else if(e->type==LEFTMOUSE&&e->val==KM_RELEASE)k.propvalue=3;else if((e->type==RIGHTMOUSE||e->type==EVT_ESCKEY)&&e->val==KM_PRESS)k.propvalue=1;else return nullptr;return &k;}
void pick_input_link_by_link_intersect(bContext&,wmOperator&,bNodeLinkDrag&,const float2&){assert(false);}
bool BLI_listbase_is_empty(const int*){return true;}constexpr int NC_SPACE=1,ND_SPACE_INFO_REPORT=2;void WM_event_add_notifier(bContext*,int,void*){}template<class T>void WM_reports_from_reports_move(wmWindowManager*,T*){}
float BLI_rcti_size_x(const rcti*r){return r->xmax-r->xmin;}float BLI_rctf_size_x(const rctf*r){return r->xmax-r->xmin;}
// Actual bodies are inserted here by the driver.
SOURCE_BODIES
static eHandlerActionFlag wm_handlers_do_intern(bContext*C,wmWindow*,wmEvent*event,ListBase*){
 if(event->type==LEFTMOUSE&&event->val==KM_CLICK){++click_calls;click_event_xy=event->xy[0];click_event_mval=event->mval[0];return WM_HANDLER_CONTINUE;}
 if(event->type!=LEFTMOUSE||event->val!=KM_PRESS_DRAG)return WM_HANDLER_CONTINUE;
 ++poll_calls;if(!ED_operator_node_editable(C))return WM_HANDLER_CONTINUE;
 copy_v2_v2_int(invoke_event_xy,event->xy);copy_v2_v2_int(invoke_event_mval,event->mval);copy_v2_v2_int(invoke_prev_press,event->prev_press_xy);
 op.type=&optype;const auto r=node_link_invoke(C,&op,event);return (r&OPERATOR_RUNNING_MODAL)?WM_HANDLER_BREAK:WM_HANDLER_CONTINUE;
}
HANDLERS_BODY
static void modal_with_actual_status_cleanup(bContext*C,wmEvent*event){
 wmWindowManager*wm=CTX_wm_manager(C);wmWindow*win=CTX_wm_window(C);ScrArea*area=CTX_wm_area(C);ARegion*region=CTX_wm_region(C);auto*handler=&native_link::handler;wmOperator*op=handler->op;auto*ot=op->type;ListBase*handlers=&win->modalhandlers;bool ipad_pencil_paint_interrupt=false,ipad_knife_action=false;wmOperatorStatus retval=0;
 C->region=handler->owner_region;C->area=handler->owner_area;
 STATUS_BODY
}
struct Fixture{wmWindow win;wmWindowManager wm;ARegion region;Tree tree;SpaceNodeRuntime snruntime;SpaceNode snode{&tree,&snruntime};Main main;ScrArea area;bContext C{&win,&wm,&region,&snode,&main,&area};Fixture(){init_calls=modal_add_calls=poll_calls=find_calls=commit_calls=search_calls=finish_calls=operator_free_calls=handler_free_calls=cancel_edge_calls=redraw_calls=click_calls=complete_at_commit=incomplete_at_commit=0;initial_detached_input=next_target=detach_prop=false;admit_init=editable=true;cleanup_order.clear();handler={};op={};optype.modal=node_link_modal;optype.cancel=node_link_cancel;optype.modalkeymap=&modalmap;}}
;
void ingest_packet(Fixture&f,const transport::GHOST_Event*p){auto&e_state=*f.win.eventstate;wmEvent e=e_state;f.C.region=&f.region;f.C.area=&f.area;e.flag=0;e.prev_type=e.type;e.prev_val=e.val;
 if(p->type==transport::GHOST_kEventCursorMove){auto*d=static_cast<const transport::GHOST_TEventCursorData*>(p->data_);e.xy[0]=d->x;e.xy[1]=1000-d->y;e.type=MOUSEMOVE;e.val=KM_NOTHING;copy_v2_v2_int(e_state.xy,e.xy);e.tablet.active=d->tablet.Active;e.tablet.pressure=d->tablet.Pressure;}
 else if(p->type==transport::GHOST_kEventTrackpad){auto*d=static_cast<const transport::GHOST_TEventTrackpadData*>(p->data_);e.xy[0]=d->x;e.xy[1]=1000-d->y;e.type=MOUSEPAN;e.val=KM_NOTHING;copy_v2_v2_int(e_state.xy,e.xy);}
 else if(p->type==transport::GHOST_kEventButtonDown||p->type==transport::GHOST_kEventButtonUp){auto*d=static_cast<const transport::GHOST_TEventButtonData*>(p->data_);e.type=d->button==transport::GHOST_kButtonMaskRight?RIGHTMOUSE:LEFTMOUSE;e.val=p->type==transport::GHOST_kEventButtonDown?KM_PRESS:KM_RELEASE;wm_event_state_update_and_click_set_ex(&e,100,&e_state,&f.win.eventstate_prev_press_time_ms,false,false);}
 else return;wm_region_mouse_co(&f.C,&e);if(f.win.modalhandlers.op)modal_with_actual_status_cleanup(&f.C,&e);else wm_handlers_do(&f.C,&e,&f.win.modalhandlers);
}
void transfer(Fixture&f){for(auto*p:transport::system_owner.queue)ingest_packet(f,p);transport::system_owner.clear();}
void producer_action(transport::Sender&s,int state,float x,float y,float dx){s.state=state;s.touch_point={x,y};s.translation={dx,0};transport::producer(s);}
void reset_transport(){transport::system_owner.clear();transport::pointer_capture={};transport::ring_capture={};transport::pointer_hud_contact={};transport::pointer_finger_contact=false;transport::mouse_left_pressed=transport::mouse_middle_pressed=transport::mouse_right_pressed=transport::flythrough=false;transport::pencil_paint_enqueued={};transport::pencil_paint_enqueued_down=false;}
void cases(){
 {Fixture f;for(float scale:{.25f,2.f,8.f}){f.region.v2d.cur.xmax=1000/scale;auto r=actual_socket_padding(f.region);assert(r[0]==5+std::clamp(20.f/scale,5.f,30.f));std::cout<<"{\"case\":\"actual_socket_padding_prefix\",\"fixture_view_scale\":"<<scale<<",\"fixture_widget_unit\":20,\"max_distance_view_units\":"<<r[0]<<",\"padded_socket_size_view_units\":"<<r[1]<<"}\n";}}
 {Fixture f;reset_transport();transport::Sender s;transport::UITouch t;s.gesture_contact.begin(transport::ios_touch_device(&t),uintptr_t(&t),s.sample);producer_action(s,transport::UIGestureRecognizerStateBegan,110,100,10);transfer(f);assert(f.win.event_queue_check_drag&&f.win.state.prev_press_xy[0]==110);producer_action(s,transport::UIGestureRecognizerStateChanged,118,100,18);transfer(f);assert(init_calls==1&&invoke_event_xy[0]==118&&invoke_event_mval[0]==108&&invoke_prev_press[0]==110&&invoke_cursor.x==50&&invoke_cursor.y==440);assert(f.win.modalhandlers.op);next_target=true;producer_action(s,transport::UIGestureRecognizerStateChanged,160,100,60);transfer(f);assert(find_calls==1);producer_action(s,transport::UIGestureRecognizerStateEnded,160,100,60);transfer(f);assert(commit_calls==1&&complete_at_commit==1&&finish_calls==1&&operator_free_calls==0&&handler_free_calls==1&&!f.win.modalhandlers.op);assert((cleanup_order==Vector<int>{10,20,30,40,50,60}));std::cout<<"{\"case\":\"connected_begin_move_confirm\",\"recognized_press\":[110,900],\"motion_event_xy\":[118,900],\"invoke_mval_current\":[108,880],\"native_drag_start_view\":[50,440],\"physical_origin_x_supplied\":100,\"actual_init_boundary_calls\":1,\"finish_boundary_calls\":1}\n";}
 {Fixture f;wmEvent e;e.type=LEFTMOUSE;e.val=KM_RELEASE;e.prev_type=LEFTMOUSE;e.prev_val=KM_PRESS;e.prev_press_type=LEFTMOUSE;e.xy[0]=112;e.xy[1]=900;e.prev_press_xy[0]=110;e.prev_press_xy[1]=900;f.win.event_queue_check_click=true;wm_region_mouse_co(&f.C,&e);wm_handlers_do(&f.C,&e,&f.win.modalhandlers);assert(click_calls==1&&click_event_xy==110&&click_event_mval==102&&init_calls==0&&e.xy[0]==112&&e.val==KM_RELEASE);std::cout<<"{\"case\":\"release_click_fallback_restores_xy\",\"click_calls\":1,\"temporary_click_xy_x\":110,\"retained_mval_x_before_invoke_boundary\":102,\"restored_release_xy_x\":112,\"node_init_calls\":0}\n";}
 for(int detached=0;detached<2;++detached)for(int target=0;target<2;++target){Fixture f;initial_detached_input=detached;wmEvent e;e.type=LEFTMOUSE;e.val=KM_PRESS_DRAG;e.prev_press_xy[0]=110;e.prev_press_xy[1]=900;op.type=&optype;assert(node_link_invoke(&f.C,&op,&e)==OPERATOR_RUNNING_MODAL);e.type=MOUSEMOVE;e.val=0;next_target=target;modal_with_actual_status_cleanup(&f.C,&e);e.type=LEFTMOUSE;e.val=KM_RELEASE;modal_with_actual_status_cleanup(&f.C,&e);assert(commit_calls==1&&finish_calls==1&&find_calls==1);assert(search_calls==(!detached&&!target));assert(complete_at_commit==target);std::cout<<"{\"case\":\"move_then_release\",\"existing_input_fixture\":"<<detached<<",\"move_selects_target_boundary\":"<<target<<",\"search_boundary_calls\":"<<search_calls<<",\"complete_at_commit_boundary\":"<<complete_at_commit<<",\"incomplete_at_commit_boundary\":"<<incomplete_at_commit<<"}\n";}
 {Fixture f;initial_detached_input=true;op.type=&optype;wmEvent e;e.type=LEFTMOUSE;e.val=KM_PRESS_DRAG;node_link_invoke(&f.C,&op,&e);e.type=LEFTMOUSE;e.val=KM_RELEASE;e.mval[0]=999;modal_with_actual_status_cleanup(&f.C,&e);assert(find_calls==0&&complete_at_commit==1);std::cout<<"{\"case\":\"release_position_does_not_repick\",\"find_calls\":0,\"copied_endpoints_complete\":true}\n";}
 for(int type:{RIGHTMOUSE,EVT_ESCKEY}){Fixture f;op.type=&optype;wmEvent e;e.type=LEFTMOUSE;e.val=KM_PRESS_DRAG;node_link_invoke(&f.C,&op,&e);e.type=type;e.val=KM_PRESS;modal_with_actual_status_cleanup(&f.C,&e);assert(commit_calls==0&&finish_calls==0&&cancel_edge_calls==1&&operator_free_calls==1&&handler_free_calls==1&&e.type==type&&e.val==KM_PRESS);assert((cleanup_order==Vector<int>{11,20,31,40,50,60}));std::cout<<"{\"case\":\"native_cancel\",\"event_type\":"<<type<<",\"cancel_edge_boundary_calls\":1,\"finished_boundary_calls\":0,\"original_handler_freed\":true}\n";}
 for(int failure=0;failure<2;++failure){Fixture f;editable=failure!=0;admit_init=failure==0;wmEvent e;e.type=MOUSEMOVE;e.xy[0]=118;e.prev_press_type=LEFTMOUSE;e.prev_press_xy[0]=110;f.win.event_queue_check_drag=true;wm_region_mouse_co(&f.C,&e);wm_handlers_do(&f.C,&e,&f.win.modalhandlers);assert(!f.win.modalhandlers.op&&modal_add_calls==0);std::cout<<"{\"case\":\"poll_or_socket_init_refusal\",\"failure\":"<<failure<<",\"modal_added\":false}\n";}
}
} // namespace native_link
int main(){native_link::cases();}
