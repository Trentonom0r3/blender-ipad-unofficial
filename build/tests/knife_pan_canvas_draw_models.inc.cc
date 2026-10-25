
constexpr int AREA_FLAG_ACTIVE_TOOL_UPDATE=1,WM_TOOLSYSTEM_SPACE_MASK=0,RGN_FLAG_POLL_FAILED=1,RGN_FLAG_DYNAMIC_SIZE=2,RGN_FLAG_TOO_SMALL=4,RGN_FLAG_HIDDEN=8,RGN_DRAW=1,RGN_DRAW_PARTIAL=2,RGN_DRAWING=4;
using eStereoViews=int;constexpr int STEREO_LEFT_ID=0,STEREO_RIGHT_ID=1;
struct IPadFingerPaintOwner{bool valid=false;std::array<uint64_t,19>values{};std::array<char,64>tool{};};
static Main*CTX_data_main(bContext*){return G_MAIN;}
static WorkSpace*CTX_wm_workspace(bContext*C){return C->win->workspace_hook->active;}
static Scene*CTX_data_scene(bContext*C){return C->win->scene;}
static ViewLayer*CTX_data_view_layer(bContext*C){return BKE_view_layer_find(C->win->scene,C->win->view_layer_name);}
static void WM_toolsystem_update_from_context(bContext*,WorkSpace*,Scene*,ViewLayer*,ScrArea*){assert(false);}
static void UI_ipad_corner_hud_refresh(bContext*,ScrArea*){}
static const char*wm_area_name(ScrArea*){return "area";}
static void GPU_debug_group_begin(const char*){}static void GPU_debug_group_end(){}
static void ED_ipad_hud_layout_begin(bContext*,wmWindow*,ScrArea*,ARegion*){}
static void ED_region_do_layout(bContext*,ARegion*){}
static void ED_ipad_hud_layout_end(bContext*,wmWindow*,ScrArea*,ARegion*){}
static void ED_area_update_region_sizes(wmWindowManager*,wmWindow*,ScrArea*){}
static bool WM_region_use_viewport(ScrArea*,ARegion*){return true;}
static void ED_ipad_finger_paint_capture(bContext*,IPadFingerPaintOwner&){}
static bool wm_draw_region_stereo_set(Main*,ScrArea*,ARegion*,int){return true;}
static void wm_draw_region_buffer_create(Scene*,ARegion*r,bool stereo,bool){if(r->runtime->draw_buffer)r->runtime->draw_buffer->stereo=stereo;}
static void wm_draw_region_bind(ARegion*,int){}static void wm_draw_region_unbind(ARegion*){}
static int draw_calls=0,draw_mutation=0;
static void ED_region_do_draw(bContext*C,ARegion*r){++draw_calls;ed_region_draw_cb_draw(C,r,r->runtime->type,REGION_DRAW_POST_VIEW);if(draw_mutation==1)++C->win->scene->id.session_uid;if(draw_mutation==2)++lifetimes[static_cast<wmEventHandler_Op*>(C->win->modalhandlers.first)->op];}
static void GPU_viewport_stereo_composite(GPUViewport*,void*){}
static void ED_ipad_hud_draw_end(bContext*,wmWindow*,ScrArea*,ARegion*){}
static void BLI_rcti_translate(rcti*r,int x,int y){r->xmin+=x;r->xmax+=x;r->ymin+=y;r->ymax+=y;}
namespace ghost::ios{static uint64_t new_finger_paint_texture(){return 1;}}
static void BLI_strncpy(char*d,const char*s,size_t n){std::strncpy(d,s,n);}
static void ED_region_tag_redraw(ARegion*){}
#define STREQ(a,b) (std::strcmp(a,b)==0)
constexpr int WM_GIZMOGROUPTYPE_DEPTH_3D=1,WM_GIZMO_STATE_HIGHLIGHT=1,GPU_DEPTH_LESS_EQUAL=1,GPU_DEPTH_NONE=0;
struct wmGizmo;struct wmGizmoGroupType{int flag=0;const char*idname="CUSTOM_WORLD_GIZMO";};struct wmGizmoGroup{wmGizmoGroupType*type=nullptr;};struct wmGizmoType{void(*draw)(const bContext*,wmGizmo*)=nullptr;};struct wmGizmo{wmGizmoGroup*parent_gzgroup=nullptr;int state=0;wmGizmoType*type=nullptr;};struct wmGizmoMap{ListBase groups;};struct LinkData{LinkData*next=nullptr,*prev=nullptr;void*data=nullptr;};
static void GPU_depth_test(int){}static void GPU_line_smooth(bool){}static void GPU_polygon_smooth(bool){}
static void BLI_freelinkN(ListBase*l,void*p){BLI_remlink(l,p);}
static void gizmo_draw(const bContext*C,wmGizmo*){++executed;saw_unknown_before=C->region->runtime->ipad_knife_canvas_unknown_widgets;}
constexpr int SPACE_TYPE_ANY=-1,RGN_TYPE_ANY=-1,WM_CAPABILITY_CURSOR_WARP=1;
struct wmPaintCursor{wmPaintCursor*next=nullptr,*prev=nullptr;int space_type=SPACE_TYPE_ANY,region_type=RGN_TYPE_ANY;bool(*poll)(bContext*)=nullptr;void(*draw)(bContext*,const int*,const float*,void*)=nullptr;void*customdata=nullptr;};
static void UI_SetTheme(int,int){}static void GPU_scissor_test(bool){}static void GPU_scissor(int,int,int,int){}
static int BLI_rcti_size_x(const rcti*r){return r->xmax-r->xmin;}static int BLI_rcti_size_y(const rcti*r){return r->ymax-r->ymin;}
static int WM_capabilities_flag(){return 0;}static bool wm_window_grab_warp_region_is_set(wmWindow*){return false;}static bool wm_cursor_position_get(wmWindow*,int*,int*){return false;}
static bool ED_ipad_native_brush_cursor(wmPaintCursor*){return true;}
static void cursor_draw(bContext*C,const int*,const float*,void*p){++executed;saw_unknown_before=C->region->runtime->ipad_knife_canvas_unknown_widgets;BLI_remlink(&C->wm->runtime->paintcursors,p);}

/* Instrumented frame storage; the actual sticky publication helper executes. */
struct KnifeDragFrame {bool pending=true;uint64_t window_id=17;bool callbacks_observed=false,opaque_window_callback=false;};
static std::map<uintptr_t,KnifeDragFrame> ipad_knife_hierarchy_frames;
static bool ipad_hud_window_live(bContext*C,wmWindow*w){return C&&C->win==w;}
static int drag_draws=0;static bool drag_saw_sticky=false,drag_remove_self=false;
static void wm_drags_draw(bContext*C,wmWindow*w){++drag_draws;drag_saw_sticky=ipad_knife_hierarchy_frames[uintptr_t(w)].opaque_window_callback;if(drag_remove_self)C->wm->runtime->drags={};}
static void wmWindowViewport(wmWindow*){}
