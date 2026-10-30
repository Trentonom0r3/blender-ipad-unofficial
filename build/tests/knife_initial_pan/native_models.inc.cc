/* Additional native backing objects and external dependencies for the connected
 * initial-Knife regression. Production algorithms are extracted by connected.py. */
#include <array>
#include <iomanip>
using float2=std::array<float,2>;
struct Mesh:Link{ID id;};
struct Object:Link{ID id;int type=9,mode=16;void*data=nullptr;};
struct Base:Link{Object*object=nullptr;};
struct ViewLayer:Link{int flag=0;Base*basact=nullptr;ListBase object_bases;std::string name="Layer";};
struct Scene:Link{ID id;ListBase view_layers;};
struct Depsgraph{};
struct RegionView3D:Link{float dist=10,ofs[3]{};int persp=0;bool is_persp=true;int viewlock=0,runtime_viewlock=0;};
struct View3D:Link{};
struct HandlerContext{wmWindow*win=nullptr;ScrArea*area=nullptr;ARegion*region=nullptr,*region_popup=nullptr;int region_type=0;};
struct wmEventHandler_Op{wmEventHandler head;wmOperator*op=nullptr;HandlerContext context;bool is_fileselect=false;uint64_t ipad_knife_owner[23]{};};
struct wmEventHandler_UI{wmEventHandler head;HandlerContext context;};
constexpr int WM_HANDLER_DO_FREE=4,VIEW_LAYER_OUT_OF_SYNC=8,OB_MESH=9,OB_MODE_EDIT=16,
 RGN_TYPE_HUD=6,OPTYPE_MACRO=1<<20,OPTYPE_MODAL_PRIORITY=1<<21,OP_IS_MODAL_CURSOR_REGION=4,
 WM_CURSOR_KNIFE=4,RV3D_CAMOB=10,VIEWOPS_FLAG_ZOOM_TO_MOUSE=4,VIEW_CONFIRM=1,VIEW_PASS=2;
static std::map<const wmOperator*,uint64_t>lifetimes;
static uint64_t next_lifetime=400;
static uint64_t WM_operator_touch_lifetime_id(wmOperator*op){auto i=lifetimes.find(op);if(i!=lifetimes.end())return i->second;return lifetimes[op]=++next_lifetime;}
static bool WM_operator_touch_lifetime_matches(const wmOperator*op,uint64_t id){auto i=lifetimes.find(op);return id&&i!=lifetimes.end()&&i->second==id;}
static bScreen*WM_window_get_active_screen(wmWindow*w){return w->screen;}
static Scene*WM_window_get_active_scene(wmWindow*w){return w->scene;}
static ViewLayer*BKE_view_layer_find(Scene*s,const char*n){LISTBASE_FOREACH(ViewLayer*,v,&s->view_layers)if(v->name==n)return v;return nullptr;}
static bool UI_ipad_knife_hud_ui_handler(const wmEventHandler*,ScrArea*,ARegion*){return false;}
static bool ED_mesh_knife_modal_type(const wmOperatorType*);
static bool ED_mesh_knife_modal_origin(const wmOperator*,MeshKnifeModalOrigin&);
static bool ED_mesh_knife_modal_navigation_may_be_denied(const wmOperator*);
static bool ED_view3d_native_zoom_type_is(const wmOperatorType*);
static bool wm_ipad_knife_precision_pan_owner_context(bContext*);
static bool wm_ipad_knife_precision_pan_event_context(bContext*,const wmEvent*);
static void BLI_addhead(ListBase*,void*);
static void BLI_addtail(ListBase*,void*);
static void BLI_remlink(ListBase*,void*);
static void BLI_insertlinkafter(ListBase*l,void*,void*p){BLI_addhead(l,p);}
static int emulated_callbacks=0,nav_allocations=0,nav_frees=0,autokeys=0,knife_starts=0,native_move_apply_calls=0,native_rotate_apply_calls=0;
static std::vector<std::string>native_trace;
static wmWindow*audit_active_window=nullptr;
static bool knife_start_had_registered_owner=false;
namespace ghost::ios{static void set_finger_paint_regions(void*,std::initializer_list<int>){}}
struct {bool active=false;bContext*context=nullptr;}wm_ipad_pencil_paint_dispatch;
static void wm_ipad_pencil_paint_modal_handler_bind(bContext*,wmWindow*,wmEventHandler_Op*,wmOperator*){assert(false);}
static void WM_window_status_area_tag_redraw(wmWindow*){}
static void copy_v2_v2_int(int*a,const int*b){a[0]=b[0];a[1]=b[1];}
static void ED_region_tag_redraw(ARegion*){++counts.redraw;}
static void ED_view3d_init_mats_rv3d(Object*,RegionView3D*){}
static void ED_workspace_status_text(bContext*,const char*){assert(false);}
static void CTX_wm_operator_poll_msg_set(bContext*,const char*){}
static Depsgraph*CTX_data_ensure_evaluated_depsgraph(bContext*C){return C->depsgraph;}
static Scene*CTX_data_scene(bContext*C){return C->win->scene;}
struct ViewContext{Scene*scene=nullptr;ViewLayer*view_layer=nullptr;View3D*v3d=nullptr;ARegion*region=nullptr;RegionView3D*rv3d=nullptr;Object*obedit=nullptr;};
struct NumInput{int str_cur=0;};
struct KnifeTool_OpData{struct Position{int ob_index=-1;float2 mval{};float cage[3]{};}curr,prev,init;
 std::vector<Object*>objects;ViewContext vc;ARegion*region=nullptr;int mode=0,prevmode=0,angle_snapping_mode=0,dist_angle_mode=0,constrain_axis=0,constrain_axis_mode=0;
 bool angle_snapping=false,snap_midpoints=false,ignore_vert_snapping=false,ignore_edge_snapping=false,cut_through=false,show_dist_angle=false,depth_test=false,no_cuts=true,is_drag_hold=false,is_drag_undo=false,axis_constrained=false;
 float angle_snapping_increment=0;int totkvert=0,snap_ref_edges_count=0,snap_edge=0;char axis_string[2]{};NumInput num;void*undostack=nullptr;std::vector<int>linehits;};
constexpr float KNIFE_MAX_ANGLE_SNAPPING_INCREMENT=180,KNIFE_MIN_ANGLE_SNAPPING_INCREMENT=0;
#define KNIFE_DEFAULT_ANGLE_SNAPPING_INCREMENT 30.0f
#define RAD2DEGF(x) ((x)*57.29577951308232f)
#define DEG2RADF(x) ((x)*.017453292519943295f)
#define BLT_I18NCONTEXT_ID_MESH "Mesh"
constexpr int PROP_ANGLE=1;
#define UNUSED_VARS_NDEBUG(x) (void)(x)
static bool ED_operator_editmesh_view3d(bContext*){return true;}
template<class...T>static PropertyRNA*RNA_def_enum(T...){static PropertyRNA p;return &p;}
static void RNA_def_property_translation_context(PropertyRNA*,const char*){}
static void RNA_def_property_subtype(PropertyRNA*,int){}
static ViewContext em_setup_viewcontext(bContext*C){auto*s=C->win->scene;return {s,BKE_view_layer_find(s,C->win->view_layer_name),static_cast<View3D*>(C->area->spacedata.first),C->region,static_cast<RegionView3D*>(C->region->regiondata),C->object};}
static std::vector<Object*>BKE_view_layer_array_from_objects_in_edit_mode_unique_data(Scene*,ViewLayer*,View3D*){return {};}
static void knifetool_init(ViewContext*vc,KnifeTool_OpData*k,std::vector<Object*>,bool,bool cut,bool,int,int,float,bool){k->vc=*vc;k->objects={vc->obedit};k->cut_through=cut;native_trace.push_back("knife_geometry_init_boundary");}
struct BMEditMesh{struct{int totfacesel=0;}*bm=nullptr;};static BMEditMesh*BKE_editmesh_from_object(Object*){assert(false);return nullptr;}
static void knifetool_exit(wmOperator*){assert(false);}static void knifetool_cancel(bContext*,wmOperator*){assert(false);}static void knifetool_finish(wmOperator*){assert(false);}
static void knife_update_header(bContext*,wmOperator*,KnifeTool_OpData*){}
static void knife_reset_snap_angle_input(KnifeTool_OpData*){assert(false);}static bool hasNumInput(NumInput*){assert(false);return false;}static bool handleNumInput(bContext*,NumInput*,const wmEvent*){assert(false);return false;}static void applyNumInput(NumInput*,float*){assert(false);}
static bool BLI_stack_is_empty(void*){assert(false);return false;}static void knifetool_undo(KnifeTool_OpData*){assert(false);}
static void knife_update_active(KnifeTool_OpData*,float2){}static void knife_recalc_ortho(KnifeTool_OpData*){}
static void knifetool_disable_orientation_locking(KnifeTool_OpData*){assert(false);}static void knife_snap_update_from_mval(KnifeTool_OpData*,float2){assert(false);}
static void knife_finish_cut(KnifeTool_OpData*){assert(false);}static void knife_add_cut(KnifeTool_OpData*){assert(false);}
static void knife_start_cut(KnifeTool_OpData*k,float2){++knife_starts;native_trace.push_back("knife_start_cut_boundary");LISTBASE_FOREACH(wmEventHandler*,base,&audit_active_window->modalhandlers){if(base->type!=WM_HANDLER_TYPE_OP)continue;auto*h=reinterpret_cast<wmEventHandler_Op*>(base);if(h->op&&h->op->customdata==k&&h->ipad_knife_owner[17])knife_start_had_registered_owner=true;}}
static void knifetool_update_mval(KnifeTool_OpData*k,float2 m){k->curr.mval=m;}
static void knife_project_v2(KnifeTool_OpData*,const float*,float2&){assert(false);}static void knifetool_disable_angle_snapping(KnifeTool_OpData*){assert(false);}
static int RNA_enum_get(PointerRNA*,const char*){return 0;}
struct PropertyNamed:PropertyRNA{std::string name;};
static PropertyRNA*RNA_struct_find_property(PointerRNA*,const char*n){static std::map<std::string,PropertyNamed>p;p[n].name=n;return &p[n];}
static bool RNA_property_is_set(PointerRNA*,PropertyRNA*){return false;}
static int RNA_property_int_get(PointerRNA*,PropertyRNA*){return 0;}
static bool RNA_property_boolean_get(PointerRNA*,PropertyRNA*){return false;}
static bool RNA_struct_property_is_set(PointerRNA*,const char*){return false;}
namespace blender{template<class T>struct Bounds{T min,max;};}
static float max_ff(float a,float b){return std::max(a,b);}static float len_v2v2_int(const int*a,const int*b){return std::hypot(float(a[0]-b[0]),float(a[1]-b[1]));}
static int BLI_rcti_cent_x(const rcti*r){return (r->xmin+r->xmax)/2;}static int BLI_rcti_cent_y(const rcti*r){return (r->ymin+r->ymax)/2;}
static void negate_v3_v3(float*a,const float*b){for(int i=0;i<3;++i)a[i]=-b[i];}static void negate_v3(float*a){for(int i=0;i<3;++i)a[i]=-a[i];}
static void add_v3_v3v3(float*a,const float*b,const float*c){for(int i=0;i<3;++i)a[i]=b[i]+c[i];}static void copy_v3_v3(float*a,const float*b){for(int i=0;i<3;++i)a[i]=b[i];}
static void madd_v3_v3v3fl(float*a,const float*b,const float*c,float f){for(int i=0;i<3;++i)a[i]=b[i]+c[i]*f;}
#define CLAMP(v,lo,hi) ((v)=std::clamp((v),(lo),(hi)))
using eViewZoom_Style=int;using eV3D_OpEvent=int;
static float ED_view3d_calc_zfac(RegionView3D*,const float*){assert(false);return 0;}static void ED_view3d_win_to_delta(ARegion*,const float*,float,float*){assert(false);}
static blender::Bounds<float>ED_view3d_dist_soft_range_get(View3D*,bool){return {.01f,1000.0f};}
static void ED_view3d_camera_lock_sync(void*,View3D*,RegionView3D*){}static void view3d_boxview_sync(ScrArea*,ARegion*){assert(false);}
static bool ED_view3d_camera_lock_check(View3D*,RegionView3D*){return false;}
static void view_zoom_apply_step(bContext*,void*,Scene*,ScrArea*,ARegion*,int,const int*){assert(false);}
static void ED_view3d_camera_lock_autokey(View3D*,RegionView3D*,bContext*,bool,bool){++autokeys;}
static void ED_view3d_camera_lock_undo_grouped_push(const char*,View3D*,RegionView3D*,bContext*){}
struct ViewOpsType;
struct ViewOpsData{struct{int event_xy[2]{},event_xy_offset[2]{};float dist=10;}init;struct{int event_xy[2]{};double time=0;}prev;
 bool use_dyn_ofs=false,use_dyn_ofs_ortho_correction=false;int viewops_flag=0;void*depsgraph=nullptr;Scene*scene=nullptr;ScrArea*area=nullptr;ARegion*region=nullptr;View3D*v3d=nullptr;RegionView3D*rv3d=nullptr;wmTimer*timer=nullptr;
 ViewOpsData(){++nav_allocations;}void init_context(bContext*);
 void init_navigation(bContext*,const wmEvent*e,const ViewOpsType*,const float*,bool){copy_v2_v2_int(init.event_xy,e->xy);copy_v2_v2_int(prev.event_xy,e->xy);init.dist=rv3d->dist;native_trace.push_back("navigation_init_boundary");}};
struct ViewOpsType{int flag=0;const char*idname="";bool(*poll_fn)(bContext*)=nullptr;wmOperatorStatus(*init_fn)(bContext*,ViewOpsData*,const wmEvent*,PointerRNA*)=nullptr;void*apply_fn=nullptr;};
static void viewops_data_free(bContext*,ViewOpsData*v){++nav_frees;delete v;}static void ED_view3d_smooth_view_force_finish(bContext*,View3D*,ARegion*){}
static void viewzoom_apply_camera(ViewOpsData*,const int*,eViewZoom_Style,bool,bool){assert(false);}
static wmOperatorStatus view3d_navigate_modal_fn(bContext*,wmOperator*,const wmEvent*){assert(false);return 0;}
static void view3d_navigate_cancel_fn(bContext*,wmOperator*){assert(false);}
static wmEventHandler_Op*WM_event_add_modal_handler(bContext*,wmOperator*);
static void view3d_operator_properties_common(wmOperatorType*,int){}
static void viewmove_apply(ViewOpsData*,int,int){++native_move_apply_calls;}
static void viewrotate_apply(ViewOpsData*,const int*){++native_rotate_apply_calls;}
static std::vector<wmEvent>native_queue;
static wmEvent*wm_event_add_intern(wmWindow*w,const wmEvent*e){native_queue.push_back(*e);w->runtime->event_queue.last=&native_queue.back();return &native_queue.back();}
static void wm_event_free_last(wmWindow*w){native_queue.pop_back();w->runtime->event_queue.last=native_queue.empty()?nullptr:&native_queue.back();}
