/* Native live-modal controls; mesh/node geometry dispatch remains explicit. */
constexpr int EVT_MODAL_MAP=200,GESTURE_MODAL_CIRCLE_SIZE=1,GESTURE_MODAL_CIRCLE_ADD=2,
 GESTURE_MODAL_CIRCLE_SUB=3,GESTURE_MODAL_SELECT=4,GESTURE_MODAL_DESELECT=5,
 GESTURE_MODAL_NOP=6,GESTURE_MODAL_CANCEL=7,GESTURE_MODAL_CONFIRM=8;
struct wmGesture{void*customdata=nullptr;rcti winrct;bool wait_for_input=false,
 is_active=true,is_active_prev=true;int modal_state=GESTURE_MODAL_SELECT;};
static int circle_ends=0,circle_execs=0;
static std::vector<int>selected_ids;
static std::vector<std::pair<int,int>>circle_points;
static void wm_gesture_tag_redraw(wmWindow*){++counts.redraw;}
static void gesture_modal_state_to_operator(wmOperator*,int){}
static void gesture_modal_end(bContext*,wmOperator*op){auto*g=static_cast<wmGesture*>(op->customdata);
 delete static_cast<rcti*>(g->customdata);delete g;op->customdata=nullptr;++circle_ends;}
static wmOperatorStatus circle_select_exec(bContext*,wmOperator*op){++circle_execs;
 for(size_t i=0;i<circle_points.size();++i){float x=circle_points[i].first-RNA_int_get(op->ptr,"x");
 float y=circle_points[i].second-RNA_int_get(op->ptr,"y");int radius=RNA_int_get(op->ptr,"radius");
 if(x*x+y*y<=radius*radius&&std::find(selected_ids.begin(),selected_ids.end(),int(i))==selected_ids.end())
 selected_ids.push_back(int(i));}return OPERATOR_FINISHED;}
#define N_(x) x
#define IFACE_(x) x
#define STRNCPY_UTF8(dst,src) do{auto n=std::min(std::strlen(src),sizeof(dst)-1);std::memcpy(dst,src,n);dst[n]=0;}while(0)
#define FOREACH_TRANS_DATA_CONTAINER(t,tc) for(auto*tc:(t)->containers)
constexpr int T_PROP_EDIT=1,T_PROP_CONNECTED=2,TD_SELECTED=1,
 TFM_MODAL_PROPSIZE=1,TREDRAW_HARD=1,RV3D_ORTHO=0;
constexpr int PROP_SHARP=1,PROP_SMOOTH=2,PROP_ROOT=3,PROP_LIN=4,PROP_CONST=5,
 PROP_SPHERE=6,PROP_RANDOM=7,PROP_INVSQUARE=8;
constexpr float T_PROP_SIZE_MIN=0.00001f,T_PROP_SIZE_MAX=1.e12f;
using uint=unsigned int;
struct View3D{float clip_end=1000;};
struct TransData{int flag=0;float dist=0,rdist=0,factor=0,loc=0,initial=0;};
struct TransDataContainer{TransData*data=nullptr;int data_len=0;};
struct TransInfo{int flag=T_PROP_EDIT,spacetype=SPACE_NODE,persp=RV3D_ORTHO,
 redraw=0,prop_mode=PROP_LIN;float prop_size=10;void*view=nullptr,*rng=nullptr;
 char proptext[64]{};std::vector<TransDataContainer*>containers;};
static void restoreElement(TransData*td){td->loc=td->initial;}
static long long BLI_time_now_seconds_i(){return 1234;}
static void*BLI_rng_new(uint){return reinterpret_cast<void*>(1);}
static float BLI_rng_get_float(void*){return .5f;}
static float min_ff(float x,float y){return std::min(x,y);}
static float max_ff(float x,float y){return std::max(x,y);}
