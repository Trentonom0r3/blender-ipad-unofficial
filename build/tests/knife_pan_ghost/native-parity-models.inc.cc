
#include <algorithm>
#include <cmath>
#include <cassert>
#include <iostream>
#include <iomanip>
#include <cstring>
using wmOperatorStatus=int;
enum {MOUSEMOVE=1000,EVT_MODAL_MAP=1001,OPERATOR_RUNNING_MODAL=1,OPERATOR_FINISHED=2,OPERATOR_PASS_THROUGH=4};
struct rcti {int xmin=0,xmax=0,ymin=0,ymax=0;};
struct wmEvent {int type=0,val=0,xy[2]={0,0},prev_xy[2]={0,0},mval[2]={0,0};};
struct wmWindow {int redraws=0;}; struct bContext {wmWindow *win;};
struct Properties {int radius=0;}; struct wmOperator {void *customdata;Properties *ptr;};
struct wmGesture {void *customdata;rcti winrct;bool wait_for_input=true,is_active=false,is_active_prev=false;int modal_state=0;};
static int applies=0,ends=0;
static wmWindow *CTX_wm_window(bContext *C) {return C->win;}
static void wm_gesture_tag_redraw(wmWindow *w) {++w->redraws;}
static void gesture_circle_apply(bContext *,wmOperator *) {++applies;}
static void gesture_modal_end(bContext *,wmOperator *) {++ends;}
static void RNA_int_set(Properties *p,const char *key,int value) {assert(!std::strcmp(key,"radius"));p->radius=value;}
struct float2 {float x=0,y=0;float2()=default;float2(const int *p):x(p[0]),y(p[1]) {}};
struct View3D {float clip_end=1000;};
enum {SPACE_VIEW3D=1,RV3D_ORTHO=2,T_PROP_EDIT=1<<4,MOD_PRECISION=1,TREDRAW_HARD=1,TRANS_STARTING=0,TRANS_RUNNING=1};
struct TransInfo {int flag=T_PROP_EDIT,spacetype=SPACE_VIEW3D,persp=RV3D_ORTHO,modifiers=0,redraw=0,ratios=0,state=TRANS_RUNNING,moves=0,mouse=0;float prop_size=2,values[3]={0,0,0};float2 mval;void *view=nullptr;};
static float min_ff(float a,float b) {return std::min(a,b);}
static float max_ff(float a,float b) {return std::max(a,b);}
static void calculatePropRatio(TransInfo *t) {++t->ratios;}
static void applyMouseInput(TransInfo *t,int *,const float2 &,float *) {++t->moves;}
static int handleSnapping(TransInfo *,const wmEvent *) {return 0;}
