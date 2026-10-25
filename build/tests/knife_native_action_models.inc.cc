/* SPDX-License-Identifier: GPL-2.0-or-later
 * Host instrumentation only; actual Knife modal/helper bodies come from declared source.
 * Geometry, allocator disposal, matrices, hits and numeric evaluation are modeled. */
#include <cassert>
#include <cstdint>
#include <cstring>
#include <array>
#include <vector>
#include <iostream>
using wmOperatorStatus=int;
enum {OPERATOR_PASS_THROUGH=1,OPERATOR_CANCELLED=2,OPERATOR_FINISHED=4,OPERATOR_RUNNING_MODAL=8};
enum {KM_NOTHING=0,KM_PRESS=1,KM_RELEASE=2,KM_CTRL=2};
enum {EVT_MODAL_MAP=100,MOUSEPAN=101,MOUSEZOOM,MOUSEROTATE,WHEELUPMOUSE,WHEELDOWNMOUSE,NDOF_MOTION,MOUSEMOVE};
enum {OB_MESH=5,OP_IS_MODAL_CURSOR_REGION=16,OPTYPE_MACRO=8};
struct ListBase{void *first=nullptr,*last=nullptr;};
bool BLI_listbase_is_empty(const ListBase *list){return list->first==nullptr;}
struct bContext{};struct Scene{};struct ViewLayer{};struct View3D{};struct ARegion{};struct RegionView3D{};struct Object{int type=OB_MESH;};
struct wmEvent {int type=0,val=0,prev_type=0,prev_val=0,xy[2]{},mval[2]{};char utf8_buf[8]{};int modifier=0,flag=0;void *customdata=nullptr;};
struct wmOperator;
struct wmOperatorType {
 const char *idname="MESH_OT_knife_tool";
 int flag=0;ListBase macro;
 wmOperatorStatus(*invoke)(bContext*,wmOperator*,const wmEvent*)=nullptr;
 wmOperatorStatus(*modal)(bContext*,wmOperator*,const wmEvent*)=nullptr;
 void(*cancel)(bContext*,wmOperator*)=nullptr;
};
struct wmOperator{wmOperatorType *type=nullptr;wmOperator *opm=nullptr;void *customdata=nullptr,*ptr=nullptr;int flag=0;ListBase macro;};
struct float2{float v[2]{};float &operator[](int i){return v[i];}const float &operator[](int i)const{return v[i];}};
struct KnifePosData{int ob_index=-1;float2 mval{};float cage[3]{};};
struct NumInput{int str_cur=0;bool active=false;};
struct ViewContext{Scene *scene=nullptr;ViewLayer *view_layer=nullptr;View3D *v3d=nullptr;ARegion *region=nullptr;RegionView3D *rv3d=nullptr;Object *obedit=nullptr;};
enum KnifeMode {MODE_IDLE,MODE_DRAGGING,MODE_CONNECT,MODE_PANNING};
struct KnifeTool_OpData{
 ARegion *region=nullptr;ViewContext vc{};KnifePosData curr{},prev{},init{};std::vector<Object*>objects;int mode=MODE_IDLE,prevmode=MODE_IDLE;
 bool angle_snapping=false,snap_midpoints=false,ignore_vert_snapping=false,ignore_edge_snapping=false,cut_through=false,show_dist_angle=false,depth_test=false,no_cuts=true,is_drag_hold=false,is_drag_undo=false,axis_constrained=false;
 NumInput num{};float angle_snapping_increment=1;int totkvert=0,angle_snapping_mode=0,snap_ref_edges_count=0,snap_edge=0,dist_angle_mode=0,constrain_axis=0,constrain_axis_mode=0;char axis_string[2]{};void *undostack=nullptr;std::vector<int>linehits;
};
struct Counters{int finish=0,exit=0,redraw=0,status=0,init_mats=0,invoke=0,numeric=0,updates=0,finish_cut=0,start_cut=0,add_cut=0;}calls;
ARegion *exit_region=nullptr;RegionView3D *mats_region=nullptr;
void copy_v2_v2_int(int *a,const int *b){a[0]=b[0];a[1]=b[1];}
void ED_region_tag_redraw(ARegion*){++calls.redraw;}
void ED_workspace_status_text(bContext*,const char*){++calls.status;}
void ED_view3d_init_mats_rv3d(Object*,RegionView3D *r){++calls.init_mats;mats_region=r;}
void knifetool_exit_ex(KnifeTool_OpData *k){++calls.exit;exit_region=k->region;}
void knifetool_finish_ex(KnifeTool_OpData*){++calls.finish;}
void knife_reset_snap_angle_input(KnifeTool_OpData *k){k->num.str_cur=0;}
void knife_update_header(bContext*,wmOperator*,KnifeTool_OpData*){}
bool hasNumInput(NumInput *n){return n->active;}
bool handleNumInput(bContext*,NumInput*,const wmEvent *event){++calls.numeric;const char *utf8_buf=nullptr;bool updated=false;char ascii[2]{};const char event_ascii=0;
NUM_FALLBACK
NUM_CTRL_GATE
 if(!event->utf8_buf[0]){assert(!event->modifier&&!event->flag&&!event->customdata);assert(event->xy[0]==301&&event->xy[1]==502&&event->mval[0]==-19&&event->mval[1]==62);}
 (void)ascii;return utf8_buf&&utf8_buf[0];}
void applyNumInput(NumInput*,float *f){*f=12;}
void knife_update_active(KnifeTool_OpData*,const float2&){++calls.updates;}
bool BLI_stack_is_empty(void*){return true;}
void knifetool_undo(KnifeTool_OpData*){}
void knife_recalc_ortho(KnifeTool_OpData*){}
float RNA_float_get(void*,const char*){return 1;}
#define RAD2DEGF(x) ((x)*57.29577951308232f)
#define KNIFE_MAX_ANGLE_SNAPPING_INCREMENT 180.0f
#define KNIFE_MIN_ANGLE_SNAPPING_INCREMENT 0.0f
void knifetool_disable_orientation_locking(KnifeTool_OpData*){}
void knife_snap_update_from_mval(KnifeTool_OpData*,const float2&){}
void knife_finish_cut(KnifeTool_OpData*){++calls.finish_cut;}
void knife_add_cut(KnifeTool_OpData*){++calls.add_cut;}
void knife_start_cut(KnifeTool_OpData*,const float2&){++calls.start_cut;}
void knifetool_update_mval(KnifeTool_OpData*,const float2&){++calls.updates;}
void knife_project_v2(KnifeTool_OpData*,const float*,float2&){}
void knifetool_disable_angle_snapping(KnifeTool_OpData*){}
template<class T,class...U>bool elem(T a,U...b){return ((a==b)||...);}
#define ELEM(a,...) elem(a,__VA_ARGS__)
