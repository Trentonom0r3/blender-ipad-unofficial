/* Instrumented native dependencies; actual bodies are appended by the driver. */
#include <algorithm>
#include <cassert>
#include <cfloat>
#include <climits>
#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <map>
#include <string>
#include <vector>
#define WITH_APPLE_CROSSPLATFORM 1
#define BLI_assert(x) assert(x)
#define CLOG_AT_LEVEL(...) ((void)0)
#define CLOG_DEBUG(...) ((void)0)
#define CLOG_ERROR(...) ((void)0)
#define OPERATOR_RETVAL_CHECK(x) assert(x)
#define LISTBASE_FOREACH(T,v,l) for(T v=static_cast<T>((l)->first); v; v=reinterpret_cast<T>(v->next))
namespace blender {
template<class T,int N=0>struct Vector:std::vector<T>{using std::vector<T>::vector;
 Vector()=default;Vector(const std::vector<T>&v):std::vector<T>(v){}
 bool is_empty()const{return this->empty();}T&last(){return this->back();}
 const T&last()const{return this->back();}void append(T x){this->push_back(x);}};
template<class T>using Span=std::vector<T>;
}
template<class T,class...U> bool ELEM(const T&x,const U&...v){return ((x==v)||...);}
using wmOperatorStatus=int;
using eWM_CursorWrapAxis=int;
constexpr int OPERATOR_PASS_THROUGH=1, OPERATOR_CANCELLED=2, OPERATOR_FINISHED=4,
 OPERATOR_RUNNING_MODAL=8,OPERATOR_HANDLED=16;
constexpr int OPTYPE_BLOCKING=1,OPTYPE_GRAB_CURSOR_XY=2,OPTYPE_UNDO=4,OPTYPE_REGISTER=8,
 OPTYPE_GRAB_CURSOR_X=16,OPTYPE_GRAB_CURSOR_Y=32;
constexpr int OP_IS_INVOKE=1,OP_IS_MODAL_GRAB_CURSOR=2,RPT_FREE=1;
constexpr int MOUSEPAN=14,MOUSEZOOM=15,MOUSEMOVE=4,MIDDLEMOUSE=2,LEFTMOUSE=1,
 EVT_ESCKEY=27,TIMER=40,KM_NOTHING=0,KM_PRESS=1,KM_RELEASE=2,KM_CTRL=2,EVENT_NONE=0;
constexpr int SPACE_NODE=16,SPACE_FILE=6,SPACE_SEQ=8,SPACE_VIEW3D=1,
 RGN_TYPE_WINDOW=0,RGN_TYPE_ASSET_SHELF=9,RGN_TYPE_HEADER=1;
constexpr int V2D_LOCKOFS_X=1,V2D_LOCKOFS_Y=2,V2D_LOCKZOOM_X=1,V2D_LOCKZOOM_Y=2,
 V2D_KEEPASPECT=4,V2D_IS_NAVIGATING=1,V2D_SNAP_TO_PAGESIZE_Y=2,V2D_LOCK_COPY=3;
constexpr int WM_EVENT_MULTITOUCH_TWO_FINGERS=(1<<3),WM_EVENT_MULTITOUCH_THREE_FINGERS=(1<<4),
 WM_EVENT_IS_TOUCH_PINCH=(1<<5),WM_EVENT_IS_POINTER_CANCEL=(1<<6),
 WM_EVENT_IS_DIRECT_TOOL=(1<<7),WM_EVENT_IS_DIRECT_FINGER=(1<<8),WM_EVENT_IS_PENCIL_PRECISION_PAN=(1<<9);
constexpr int WM_CURSOR_NS_SCROLL=1,WM_CURSOR_EW_SCROLL=2,WM_CURSOR_NSEW_SCROLL=3,
 WM_CURSOR_WRAP_NONE=0,WM_CURSOR_WRAP_XY=1,WM_CURSOR_WRAP_X=2,WM_CURSOR_WRAP_Y=3;
constexpr int USER_CONTINUOUS_MOUSE=1,USER_ZOOM_TO_MOUSEPOS=2,USER_ZOOM_INVERT=4,
 USER_ZOOM_HORIZ=8,USER_ZOOM_CONTINUE=1,USER_ZOOM_SCALE=2,USER_ZOOM_DOLLY=3;
constexpr int NC_SCREEN=1,NA_EDITED=2,PROP_HIDDEN=1;
constexpr float UI_SCALE_FAC=1.f;
struct Link{void*next=nullptr,*prev=nullptr;};
struct ListBase{void*first=nullptr,*last=nullptr;};
static int BLI_findindex(const ListBase*l,const void*p){int i=0;for(auto*n=static_cast<Link*>(l->first);n;n=static_cast<Link*>(n->next),++i)if(n==p)return i;return -1;}
struct rctf{float xmin=0,xmax=100,ymin=0,ymax=100;};
struct rcti{int xmin=0,xmax=99,ymin=0,ymax=99;};
struct View2D{rctf cur;rcti mask;int keepofs=0,keepzoom=0,flag=0;float maxzoom=0;};
struct ARegionRuntime{bool visible=true;ListBase handlers;};
struct ARegion:Link{int regiontype=RGN_TYPE_WINDOW;View2D v2d;rcti winrct;float category_scroll=0;ARegionRuntime*runtime=nullptr;};
struct ScrArea{int spacetype=SPACE_NODE;rcti totrct;ListBase regionbase;};
struct bScreen{void*active_region=nullptr;};
struct wmTimer{};struct wmWindow{};
struct wmWindowManager{int op_undo_depth=0;};
struct bContext{wmWindowManager*wm=nullptr;wmWindow*win=nullptr;ScrArea*area=nullptr;ARegion*region=nullptr;bScreen*screen=nullptr;void*py_dict=nullptr;void*rv3d=nullptr;};
struct wmEvent{int type=MOUSEPAN,val=KM_NOTHING,modifier=0,keymodifier=EVENT_NONE,flag=0;
 int xy[2]{11,13},prev_xy[2]{10,10},mval[2]{};void*customdata=nullptr;};
struct StructRNA{};struct PropertyRNA{};
struct ID{};
POINTER_RNA_DECLS
struct ScalarProperties{float dx=0,dy=0;int x=0,y=0,radius=10;bool use_cursor_init=false;};
static std::map<const PointerRNA*,ScalarProperties>scalar_values;
struct ExtensionRNA{void*data=nullptr;StructRNA*srna=nullptr;void(*call)()=nullptr;void(*free)()=nullptr;};
struct wmOperator;
struct wmOperatorType{const char*name=nullptr,*description=nullptr,*idname=nullptr;
 wmOperatorStatus(*exec)(bContext*,wmOperator*)=nullptr;
 wmOperatorStatus(*invoke)(bContext*,wmOperator*,const wmEvent*)=nullptr;
 wmOperatorStatus(*modal)(bContext*,wmOperator*,const wmEvent*)=nullptr;
 void(*cancel)(bContext*,wmOperator*)=nullptr;bool(*poll)(bContext*)=nullptr;
 bool(*pyop_poll)(bContext*,wmOperatorType*)=nullptr;
 ListBase macro;ExtensionRNA rna_ext;StructRNA*srna=nullptr;int flag=0;};
struct wmOperatorTypeMacro{wmOperatorTypeMacro*next=nullptr;const char*idname=nullptr;};
struct ReportList{int flag=0;};
struct wmOperator{wmOperatorType*type=nullptr;wmOperator*opm=nullptr;PointerRNA*ptr=nullptr;
 ReportList*reports=nullptr;void*customdata=nullptr;int flag=0;const char*idname=nullptr;};
struct UserDef{int uiflag=0,viewzoom=USER_ZOOM_DOLLY;} U;
struct Counters{int context=0,py=0,alloc=0,free=0,create=0,operator_free=0,reports=0,
 finished=0,last_init=0,ids=0,redraw=0,sync=0,mousemove=0,cursor=0,timer=0,
 modal_add=0,ui_cancel=0,rect_changed=0,region_co=0,poll=0,profile=0;};
static Counters counts;
static std::vector<std::string>context_trace;
static wmOperator*last_op=nullptr;
static std::map<std::string,wmOperatorType*>registry;
static void*CTX_py_dict_get(const bContext*C){++counts.py;context_trace.push_back("py");return C->py_dict;}
static ARegion*CTX_wm_region(const bContext*C){++counts.context;context_trace.push_back("region");return C->region;}
static ScrArea*CTX_wm_area(const bContext*C){++counts.context;context_trace.push_back("area");return C->area;}
static wmWindow*CTX_wm_window(const bContext*C){++counts.context;context_trace.push_back("window");return C->win;}
static bScreen*CTX_wm_screen(const bContext*C){++counts.context;context_trace.push_back("screen");return C->screen;}
static wmWindowManager*CTX_wm_manager(const bContext*C){++counts.context;context_trace.push_back("manager");return C->wm;}
static void*CTX_wm_region_view3d(const bContext*C){++counts.context;context_trace.push_back("rv3d");return C->rv3d;}
static float BLI_rctf_size_x(const rctf*r){return r->xmax-r->xmin;}
static float BLI_rctf_size_y(const rctf*r){return r->ymax-r->ymin;}
static int BLI_rcti_size_x(const rcti*r){return r->xmax-r->xmin;}
static int BLI_rcti_size_y(const rcti*r){return r->ymax-r->ymin;}
static bool BLI_rcti_isect_pt_v(const rcti*r,const int*p){return p[0]>=r->xmin&&p[0]<=r->xmax&&p[1]>=r->ymin&&p[1]<=r->ymax;}
static bool RGN_TYPE_IS_HEADER_ANY(int t){return t==RGN_TYPE_HEADER;}
static float view2d_page_size_y(const View2D&){return 100;}
static float clamp_f(float v,float a,float b){return std::clamp(v,a,b);}
static float len_v2(const float*p){return std::sqrt(p[0]*p[0]+p[1]*p[1]);}
static double BLI_time_now_seconds(){return 1.;}
template<class T>T*MEM_callocN(const char*){++counts.alloc;return new T{};}
template<class T>void MEM_freeN(T*p){++counts.free;delete p;}
static int RNA_int_get(PointerRNA*p,const char*n){auto&v=scalar_values[p];std::string s=n;if(s=="radius")return v.radius;
 if(s=="x")return v.x;if(s=="y")return v.y;return int(s=="deltax"?v.dx:v.dy);}
static void RNA_int_set(PointerRNA*p,const char*n,int x){auto&v=scalar_values[p];std::string s=n;if(s=="radius")v.radius=x;
 else if(s=="x")v.x=x;else if(s=="y")v.y=x;else(s=="deltax"?v.dx:v.dy)=float(x);}
static float RNA_float_get(PointerRNA*p,const char*n){auto&v=scalar_values[p];return std::string(n)=="deltax"?v.dx:v.dy;}
static void RNA_float_set(PointerRNA*p,const char*n,float x){auto&v=scalar_values[p];(std::string(n)=="deltax"?v.dx:v.dy)=x;}
static bool RNA_boolean_get(PointerRNA*p,const char*){return scalar_values[p].use_cursor_init;}
template<class...T>void RNA_def_int(T...){ }
template<class...T>PropertyRNA*RNA_def_float(T...){static PropertyRNA p;return &p;}
static void RNA_def_property_flag(PropertyRNA*,int){}
static void WM_operator_properties_use_cursor_init(wmOperatorType*){}
static void UI_view2d_curRect_changed(bContext*,View2D*){++counts.rect_changed;}
static void ED_region_tag_redraw_no_rebuild(ARegion*){++counts.redraw;}
static void WM_event_add_mousemove(wmWindow*){++counts.mousemove;}
static void UI_view2d_sync(bScreen*,ScrArea*,View2D*,int){++counts.sync;}
static bool ED_region_panel_category_gutter_isect_xy(ARegion*,const int*){return false;}
static bool WM_cursor_modal_is_set_ok(wmWindow*){return true;}
static void WM_cursor_modal_set(wmWindow*,int){++counts.cursor;}
static void WM_cursor_modal_restore(wmWindow*){++counts.cursor;}
static void WM_event_add_modal_handler(bContext*,wmOperator*op){++counts.modal_add;last_op=op;}
static int ED_region_snap_size_test(ARegion*){return 0;}
static bool ED_region_snap_size_apply(ARegion*,int){return false;}
static void ED_area_tag_redraw(ScrArea*){++counts.redraw;}
static void WM_event_add_notifier(bContext*,int,void*){++counts.redraw;}
static void UI_view2d_zoom_cache_reset(){}
static void WM_event_timer_remove(wmWindowManager*,wmWindow*,wmTimer*p){++counts.timer;delete p;}
static wmTimer*WM_event_timer_add(wmWindowManager*,wmWindow*,int,float){++counts.timer;return new wmTimer{};}
static void UI_view2d_region_to_view(View2D*v,float x,float y,float*rx,float*ry){*rx=v->cur.xmin+x;*ry=v->cur.ymin+y;}
static int WM_event_absolute_delta_x(const wmEvent*e){return e->xy[0]-e->prev_xy[0];}
static int WM_event_absolute_delta_y(const wmEvent*e){return e->xy[1]-e->prev_xy[1];}
static wmOperatorType*WM_operatortype_find(const char*n,bool){auto i=registry.find(n);return i==registry.end()?nullptr:i->second;}
static bool WM_operator_poll(bContext*,wmOperatorType*);
