"""Bounded execution of actual native Knife draw/owner/scope/content functions.
Native lists, allocation, geometry and callback bodies are explicit model boundaries.
No complete Blender translation unit, SDK/GPU/UIKit/device claim.
"""
from pathlib import Path
import ast,hashlib,json,subprocess,sys
import argparse,shutil
parser=argparse.ArgumentParser()
parser.add_argument('--repo',type=Path,required=True)
parser.add_argument('--source-dir',type=Path,required=True)
parser.add_argument('--output-dir',type=Path,required=True)
parser.add_argument('--opt-level',choices=['0','2','both'],default='both')
OPT=parser.parse_args()
ROOT=OPT.source_dir.resolve();REPO=OPT.repo.resolve();OUT=OPT.output_dir.resolve();OUT.mkdir(parents=True,exist_ok=True)
def read(p):return (ROOT/p).read_text(encoding='utf-8')
def function(s,sig):
 a=s.index(sig); b=s.index('{',a);depth=0
 for e in range(b,len(s)):
  depth+=(s[e]=='{')-(s[e]=='}')
  if not depth:return s[a:e+1]
 raise AssertionError(sig)
old=ast.parse((REPO/'build/test_pencil_knife_owner_dispatch.py').read_text())
pre=next(ast.literal_eval(n.value) for n in old.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='PRELUDE' for t in n.targets))
pre=pre.replace('#include <iostream>','#include <iostream>\n#include <type_traits>\n#include <cmath>\n#include <limits>')
pre=pre.replace('struct Mesh:Link{ID id;};','struct BMEditMesh{void*bm=(void*)1;};struct MeshRuntime{BMEditMesh*edit_mesh=nullptr;};struct Mesh:Link{ID id;MeshRuntime*runtime=nullptr;};')
pre=pre.replace('struct ARegionRuntime{bool visible=true;};','''struct wmDrawBuffer;
struct rcti{int xmin=0,xmax=799,ymin=0,ymax=599;};
struct ARegionType {ListBase drawcalls;bool do_lock=false;void(*draw)()=nullptr;void(*layout)()=nullptr;};
struct ARegionRuntime{int do_draw=0;bool visible=true,ipad_canvas=true;ARegionType*type=nullptr;void*headerstr=nullptr;rcti ipad_canvas_rect;wmDrawBuffer*draw_buffer=nullptr;bool ipad_finger_paint_overlay_blocked=false;bool ipad_finger_paint_navigation_drawn=false;bool ipad_knife_canvas_unknown_widgets=false;std::array<uint64_t,23>ipad_knife_canvas_drawn_owner{};};''')
pre=pre.replace('ARegionRuntime*runtime=nullptr;void*regiondata','rcti winrct;ARegionRuntime*runtime=nullptr;void*regiondata')
pre=pre.replace('int spacetype=SPACE_VIEW3D;ListBase regionbase','int spacetype=SPACE_VIEW3D;int winx=800,winy=600;ListBase regionbase')
pre=pre.replace('struct wmWindowRuntime{};','struct WorkSpaceLayout:Link{bScreen*screen=nullptr;};struct WorkSpace:Link{ID id;ListBase layouts;};struct WorkSpaceInstanceHook{WorkSpace*active=nullptr;WorkSpaceLayout*act_layout=nullptr;};struct wmWindowRuntime{};')
pre=pre.replace('wmWindowRuntime*runtime=nullptr;ListBase modalhandlers','WorkSpaceInstanceHook*workspace_hook=nullptr;wmWindowRuntime*runtime=nullptr;ListBase modalhandlers')
pre=pre.replace('ListBase wm,screens,scenes,objects,meshes;','ListBase wm,screens,scenes,objects,meshes,workspaces;')
pre=pre.replace('wmOperator*opm=nullptr;ReportList*reports=nullptr;','wmOperator*opm=nullptr;ReportList*reports=nullptr;ListBase macro;void*customdata=nullptr;')
pre=pre.replace('static bool ED_mesh_knife_modal_type(wmOperatorType*t)','static bool ED_mesh_knife_modal_type(const wmOperatorType*t)')
pre=pre.replace('static bool ED_mesh_knife_modal_origin(wmOperator*op,MeshKnifeModalOrigin&o){auto i=origins.find(op);if(i==origins.end())return false;o=i->second;return true;}','')
pre=pre.replace('int regiontype=RGN_TYPE_WINDOW;', 'int regiontype=RGN_TYPE_WINDOW;int flag=0;')
pre=pre.replace('int spacetype=SPACE_VIEW3D;int winx=800,winy=600;', 'int spacetype=SPACE_VIEW3D;int winx=800,winy=600;int flag=0;struct{rcti ipad_navigation_rect;}runtime;')
pre=pre.replace('struct bScreen:Link{ID id;ListBase areabase;};', 'struct bScreen:Link{ID id;ListBase areabase;ARegion*active_region=nullptr;};')
pre=pre.replace('struct wmWindowRuntime{};', 'struct NativeEventState{int xy[2]{};struct{float tilt[2]{};}tablet;};struct wmWindowRuntime{};')
pre=pre.replace('int winid=17;', 'int winid=17;void*stereo3d_format=nullptr;NativeEventState*eventstate=nullptr;')
pre=pre.replace('struct wmWindowManager:Link{ID id;', 'struct wmWindowManagerRuntime{bool is_interface_locked=false;ListBase paintcursors;};struct wmWindowManager:Link{wmWindowManagerRuntime*runtime=nullptr;ID id;')
wm=read('source/blender/windowmanager/intern/wm_event_system.cc');draw=read('source/blender/windowmanager/intern/wm_draw.cc');space=read('source/blender/editors/space_api/spacetypes.cc');knife=read('source/blender/editors/mesh/editmesh_knife.cc')
# Exact declaration order of the native ED origin.
pre=pre.replace('struct MeshKnifeModalOrigin{Scene*scene=nullptr;ViewLayer*view_layer=nullptr;Object*object=nullptr;ARegion*region=nullptr;void*v3d=nullptr,*rv3d=nullptr;};','struct MeshKnifeModalOrigin{Scene*scene=nullptr;ViewLayer*view_layer=nullptr;void*v3d=nullptr;ARegion*region=nullptr;void*rv3d=nullptr;Object*object=nullptr;};')
extra=r'''
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
'''
header=read('source/blender/windowmanager/WM_ipad_knife.hh')
drawheader=read('source/blender/windowmanager/wm_draw.hh').replace('#  include "WM_ipad_knife.hh"','')
structcb=function(space,'struct RegionDrawCB {')+';'
sigs=['static wmWindowManager *wm_ipad_knife_window_manager(','static bool wm_ipad_knife_owner_read(','static void wm_ipad_knife_modal_handler_bind(','bool WM_ipad_knife_owner_capture(','bool WM_ipad_knife_owner_present(','ARegion *WM_ipad_knife_owner_region(','bool WM_ipad_knife_canvas_scope_capture(','bool WM_ipad_knife_draw_callback_known(']
blocks={s:function(wm,s) for s in sigs}
bodies='\n'.join([function(knife,'bool ED_mesh_knife_modal_origin('),function(knife,'bool ED_mesh_knife_draw_callback_known('),wm[wm.index('enum eIPadKnifeOwnerIndex {'):wm.index('static wmWindowManager *wm_ipad_knife_window_manager(')],*blocks.values(),structcb,function(space,'bool ED_region_knife_pan_callbacks_safe('),function(space,'static void ed_region_draw_cb_draw('),function(draw,'static uint64_t wm_ipad_knife_canvas_content_next('),function(draw,'static void wm_ipad_knife_canvas_stamp_finish(')])
# Replace only boundary data shapes; all probe/hierarchy/owner/context function
# bodies below are extracted from declared native sources without substitutions.
pre=pre[:pre.index('template<class T>T*MEM_new')]
for sig in ['static wmWindowManager*CTX_wm_manager(', 'static wmWindow*CTX_wm_window(', 'static ScrArea*CTX_wm_area(', 'static ARegion*CTX_wm_region(', 'static void CTX_wm_area_set(', 'static void CTX_wm_region_set(', 'static bScreen*WM_window_get_active_screen(', 'static Scene*WM_window_get_active_scene(']:
 pre=pre.replace(function(pre,sig),'')
pre=pre.replace('struct ARegionType {ListBase drawcalls;', 'struct ARegionType {int(*context)()=nullptr;ListBase drawcalls;')
pre=pre.replace('struct ARegionRuntime{bool visible=true,ipad_canvas=true;', 'struct wmGizmoMap;struct ARegionRuntime{ListBase uiblocks;wmGizmoMap*gizmo_map=nullptr;bool ipad_floating=false;bool visible=true,ipad_canvas=true;')
pre=pre.replace('struct ARegion:Link{int regiontype=RGN_TYPE_WINDOW;', 'struct ARegion:Link{int flag=0;int regiontype=RGN_TYPE_WINDOW;')
pre=pre.replace('struct ScrArea:Link{int spacetype=SPACE_VIEW3D;', 'struct bToolRef;struct AreaRuntime{int ipad_layer=1;bool is_tool_set=true;bToolRef*tool=nullptr;};struct ScrArea:Link{int flag=0;AreaRuntime runtime;rcti totrct;int spacetype=SPACE_VIEW3D;')
pre=pre.replace('struct bScreen:Link{ID id;ListBase areabase;};','struct ToolTip{ARegion*region;};struct bScreen:Link{bool do_refresh=false;ToolTip*tool_tip=nullptr;ListBase regionbase;ID id;ListBase areabase;};')
pre=pre.replace('struct WorkSpace:Link{ID id;ListBase layouts;}', 'struct WorkSpace:Link{ID id;ListBase layouts,tools;}')
pre=pre.replace('struct wmWindowRuntime{};', 'struct wmWindowRuntime{ListBase event_queue;};')
pre=pre.replace('struct wmWindow:Link{int winid=17;', 'struct wmEvent;struct wmWindow:Link{int sizex=800,sizey=600;void*ghostwin=(void*)55;wmEvent*eventstate=nullptr;ListBase gesture,drawcalls;int winid=17;')
pre=pre.replace('struct wmWindowManager:Link{ID id;', 'struct wmWindowManagerRuntime{wmWindow*winactive=nullptr;ListBase paintcursors;};struct wmWindowManager:Link{wmWindowManagerRuntime*runtime=nullptr;ID id;')
old=function(pre,'struct bContext{')+';'
pre=pre.replace(old,'''struct bContext;struct bContextPollMsgDyn_Params{void(*free_fn)(const bContext*,void*)=nullptr;void*get_fn=nullptr,*user_data=nullptr;};
struct wmGizmoGroup;struct bContextStore;struct bContext{int thread=0;struct{wmWindowManager*manager=nullptr;wmWindow*window=nullptr;WorkSpace*workspace=nullptr;bScreen*screen=nullptr;ScrArea*area=nullptr;ARegion*region=nullptr,*region_popup=nullptr;wmGizmoGroup*gizmo_group=nullptr;const bContextStore*store=nullptr;const char*operator_poll_msg=nullptr;bContextPollMsgDyn_Params operator_poll_msg_dyn_params;}wm;struct{Main*main=nullptr;Scene*scene=nullptr;int recursion=0;bool py_init=false;void*py_context=nullptr,*py_context_orig=nullptr;}data;};''')
pre=pre.replace('struct wmEvent{int type=0,val=0,xy[2]{};', 'struct wmEvent:Link{int prev_type=0,modifier=0,keymodifier=0;int type=0,val=0,xy[2]{};')
# Unused action-boundary routine is excluded, not a production function.
extra=extra[:extra.index('static int native_width')]+extra[extra.index('struct KnifeViewContext'):]
# Normalize the shared explicit boundary records, independent of additions to
# the sibling fixture's rendering-only shape.
pre='#include <unordered_map>\n#include <climits>\n'+pre
pre=pre.replace('reinterpret_cast<Link*>(v)->next','reinterpret_cast<const Link*>(v)->next')
def shape(sig,new):
 global pre
 pre=pre.replace(function(pre,sig)+';',new)
shape('struct ARegionRuntime{','struct wmGizmoMap;struct ARegionRuntime{ListBase uiblocks;wmGizmoMap*gizmo_map=nullptr;bool ipad_floating=false,visible=true,ipad_canvas=true;ARegionType*type=nullptr;void*headerstr=nullptr;rcti ipad_canvas_rect;wmDrawBuffer*draw_buffer=nullptr;bool ipad_finger_paint_overlay_blocked=false,ipad_finger_paint_navigation_drawn=false,ipad_knife_canvas_unknown_widgets=false;std::array<uint64_t,23>ipad_knife_canvas_drawn_owner{};};')
shape('struct ARegion:Link{','struct ARegion:Link{int flag=0,regiontype=RGN_TYPE_WINDOW;rcti winrct;ARegionRuntime*runtime=nullptr;void*regiondata=nullptr;uiBut*active_button=nullptr;};')
shape('struct ScrArea:Link{','struct ScrArea:Link{int flag=0;AreaRuntime runtime;rcti totrct;int spacetype=SPACE_VIEW3D,winx=800,winy=600;ListBase regionbase,spacedata;};')
shape('struct bScreen:Link{','struct ToolTip{ARegion*region=nullptr;};struct bScreen:Link{bool do_refresh=false;ToolTip*tool_tip=nullptr;ListBase regionbase;ID id;ListBase areabase;};')
shape('struct wmWindow:Link{','struct wmWindow:Link{int sizex=800,sizey=600;void*ghostwin=(void*)55;wmEvent*eventstate=nullptr;ListBase gesture,drawcalls;int winid=17;WorkSpaceInstanceHook*workspace_hook=nullptr;wmWindowRuntime*runtime=nullptr;ListBase modalhandlers;bScreen*screen=nullptr;Scene*scene=nullptr;char view_layer_name[64]="Layer";};')
shape('struct wmWindowManagerRuntime{','struct wmWindowManagerRuntime{wmWindow*winactive=nullptr;ListBase paintcursors;};')
shape('struct Scene:Link{','struct ToolSettings{int workspace_tool_type=0;};struct Scene:Link{ToolSettings*toolsettings=nullptr;ID id;ListBase view_layers;};')
shape('struct wmWindowManagerRuntime{','struct wmKeyConfig;struct wmWindowManagerRuntime{wmWindow*winactive=nullptr;ListBase paintcursors,keyconfigs,drags;wmKeyConfig*defaultconf=nullptr,*addonconf=nullptr,*userconf=nullptr;};')
shape('struct wmOperatorType{','struct wmOperator;static int knifetool_invoke(bContext*,wmOperator*,const wmEvent*);static int knifetool_modal(bContext*,wmOperator*,const wmEvent*);static void knifetool_cancel(bContext*,wmOperator*);struct wmOperatorType{uint64_t ipad_lifetime_id=0;int flag=OPTYPE_UNDO;bool modalkeymap=true;ListBase macro;int(*invoke)(bContext*,wmOperator*,const wmEvent*)=knifetool_invoke;int(*modal)(bContext*,wmOperator*,const wmEvent*)=knifetool_modal;void(*cancel)(bContext*,wmOperator*)=knifetool_cancel;};')
pre=pre.replace(function(pre,'static bool ED_mesh_knife_modal_type('),'')
bodies=function(knife,'bool ED_mesh_knife_modal_type(')+'\n'+bodies
prelude=r'''
#define WITH_PYTHON 1
#define STREQ(a,b) (std::strcmp((a),(b))==0)
#define LIKELY(x) (x)
#define UNLIKELY(x) (x)
#define CLOG_WARN(...) ((void)0)
#define CLOG_STR_ERROR(...) ((void)0)
#define BLI_assert_msg(x,...) assert(x)
#define ARRAY_SIZE(x) (sizeof(x)/sizeof(*(x)))
#define PYCTX_WINDOW_MEMBERS "window", "scene", "workspace", "screen", "area", "space_data", "region", "region_data"
#define PYCTX_AREA_MEMBERS "area", "space_data", "region", "region_data"
#define PYCTX_REGION_MEMBERS "region", "region_data"
static bool main_thread=true;
static bool BLI_thread_is_main(){return main_thread;}
struct StructRNA{};StructRNA RNA_Window,RNA_WorkSpace,RNA_Screen,RNA_Area,RNA_Region;
struct bContextDataResult{struct{void*data=nullptr;StructRNA*type=nullptr;}ptr;};
static int poison_calls=0,ctx_allocs=0,ctx_frees=0,sound_calls=0;
static bool BPY_context_member_get(bContext*,const char*,bContextDataResult*){++poison_calls;return false;}
static bool RNA_struct_is_a(StructRNA*,const StructRNA*){++poison_calls;return false;}
static const char*RNA_struct_identifier(StructRNA*){++poison_calls;return "poison";}
static void BPY_context_dict_clear_members_array(void**,void*,const char**,int){++poison_calls;}
static void BKE_sound_refresh_callback_bmain(Main*){++sound_calls;}
static int provider_poison(){++provider_callbacks;return 0;}
template<class T>T*MEM_callocN(const char*){++ctx_allocs;return new T{};}
static void MEM_freeN(bContext*C){assert(!C->data.py_context&&!C->wm.store&&!C->wm.operator_poll_msg_dyn_params.free_fn);++ctx_frees;delete C;}
void CTX_wm_operator_poll_msg_clear(bContext*);
static float native_fac=1;
using GHOST_WindowHandle=void*;
static float GHOST_GetNativePixelSize(GHOST_WindowHandle){return native_fac;}
constexpr int CTX_MODE_EDIT_MESH=0,SPACE_EMPTY=0,OPTYPE_MACRO=8,SCE_WORKSPACE_TOOL_FALLBACK=1;
constexpr int KEYMAP_MODAL=1,KEYMAP_DIFF=16,KEYMAP_USER_MODIFIED=32,KEYMAP_UPDATE=64,KMI_INACTIVE=1,KMI_USER_MODIFIED=4,KMI_UPDATE=8,LEFTMOUSE=1,KM_PRESS=1,EVENT_NONE=0;
static int knifetool_invoke(bContext*,wmOperator*,const wmEvent*){++native_calls;return OPERATOR_RUNNING_MODAL;}
static int knifetool_modal(bContext*,wmOperator*,const wmEvent*){++native_calls;return OPERATOR_RUNNING_MODAL;}
static void knifetool_cancel(bContext*,wmOperator*){++native_calls;}
struct wmKeyMapItem:Link{char idname[64]="MESH_OT_knife_tool";int type=LEFTMOUSE,val=KM_PRESS,shift=0,ctrl=0,alt=0,oskey=0,hyper=0,keymodifier=0,flag=0;};
struct wmKeyMap:Link{char idname[64]="3D View Tool: Edit Mesh, Knife",owner_id[128]{};int spaceid=SPACE_VIEW3D,regionid=RGN_TYPE_WINDOW,flag=0;ListBase items,diff_items;bool(*poll)(bContext*)=nullptr;bool(*poll_modal_item)(const wmOperator*,int)=nullptr;};
struct wmKeyConfig:Link{char idname[64]="Blender";ListBase keymaps;};
constexpr int RGN_FLAG_HIDDEN=1,AREA_FLAG_REGION_SIZE_UPDATE=1,AREA_FLAG_ACTIVE_TOOL_UPDATE=2;
constexpr int WM_GIZMO_HIDDEN=1,WM_GIZMO_DRAW_MODAL=2,WM_GIZMO_DRAW_VALUE=4,WM_GIZMO_DRAW_HOVER=8;
constexpr int WM_GIZMO_STATE_MODAL=1,WM_GIZMO_STATE_HIGHLIGHT=2,WM_GIZMO_STATE_SELECT=4;
constexpr int WM_GIZMOGROUP_INIT_SETUP=1,V3D_GIZMO_HIDE=1,V3D_GIZMO_HIDE_NAVIGATE=2;
constexpr int USER_SHOW_GIZMO_NAVIGATE=1,USER_MINI_AXIS_TYPE_GIZMO=1;
constexpr int _EVT_KEYBOARD_MIN=0x20,_EVT_KEYBOARD_MAX=0xff,EVT_F1KEY=0x120,EVT_F24KEY=0x137,EVT_MODAL_MAP=0x5022;
struct User{int uiflag=1,mini_axis_type=0;char keyconfigstr[64]="Blender";ListBase user_keymaps;}U;
struct Global{bool background=false;int debug=0;}G;
struct View3D:Link{int gizmo_flag=0;};
struct wmGizmoType{void(*draw)()=nullptr;};
struct wmGizmo:Link{wmGizmoType*type=nullptr;int flag=0,state=0;float matrix_basis[4][4]{},scale_basis=1;};
struct wmGizmoGroupType{char idname[64]="UNKNOWN";bool(*poll)()=nullptr;struct{void*call=nullptr;}rna_ext;};
struct wmGizmoGroup:Link{wmGizmoGroupType*type=nullptr;int tag_remove=0,init_flag=1;struct{int any=0;}hide;ListBase gizmos;};
struct wmGizmoMap{ListBase groups;};
struct bToolRef_Runtime{char keymap[64]="3D View Tool: Edit Mesh, Knife",keymap_fallback[64]{};};struct bToolRef:Link{int space_type=SPACE_VIEW3D,mode=CTX_MODE_EDIT_MESH;bToolRef_Runtime*runtime=nullptr;char idname[64]="builtin.knife";};
struct bToolKey{int space_type,mode;};
#define WM_TOOLSYSTEM_SPACE_MASK (1<<SPACE_VIEW3D)
static bool BLI_rcti_isect(const rcti*a,const rcti*b,rcti*r){*r={std::max(a->xmin,b->xmin),std::min(a->xmax,b->xmax),std::max(a->ymin,b->ymin),std::min(a->ymax,b->ymax)};return r->xmin<=r->xmax&&r->ymin<=r->ymax;}
static bool BLI_rcti_isect_pt_v(const rcti*r,const int xy[2]){return xy[0]>=r->xmin&&xy[0]<=r->xmax&&xy[1]>=r->ymin&&xy[1]<=r->ymax;}
static bool ED_ipad_panels_enabled(bScreen*s){return s&&!G.background;}
static bool ED_ipad_panels_area_visible(ScrArea*a){return a->runtime.ipad_layer!=0;}
struct Rect{int xmin=0,ymin=0,xmax=0,ymax=0;bool empty()const{return xmax<=xmin||ymax<=ymin;}};
static rcti to_rect(const Rect&r){return {r.xmin,r.xmax-1,r.ymin,r.ymax-1};}
struct Model{ScrArea*main=nullptr;struct{Rect left_rail,side_rail,tools_panel,side_panel,bottom_panel;}layout;};
struct Button{Rect rect;};
struct HUDPresentation{std::vector<rcti>rects;};
struct HUDFrame{uint64_t window_id=0;bool pending=false;std::vector<HUDPresentation>presented;};
static std::unordered_map<uintptr_t,HUDFrame>ipad_hud_frames;
'''
context_path=REPO/'.cache/preflight/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e/source/blender/blenkernel/intern/context.cc'
context=context_path.read_text();workspace_path=context_path.parents[0]/'workspace.cc';workspace=workspace_path.read_text()
window=read('source/blender/windowmanager/intern/wm_window.cc');panels=read('source/blender/editors/screen/screen_ipad_panels.cc');tools=read('source/blender/windowmanager/intern/wm_toolsystem.cc');events=read('source/blender/windowmanager/wm_event_types.hh');gizmo=read('source/blender/windowmanager/gizmo/intern/wm_gizmo_map.cc')
ctxsigs=['void *CTX_py_dict_get(', 'static void *ctx_wm_python_context_get(', 'bContext *CTX_create(', 'void CTX_free(', 'wmWindowManager *CTX_wm_manager(', 'wmWindow *CTX_wm_window(', 'ScrArea *CTX_wm_area(', 'ARegion *CTX_wm_region(', 'ARegion *CTX_wm_region_popup(', 'void CTX_wm_manager_set(', 'void CTX_wm_window_set(', 'void CTX_wm_area_set(', 'void CTX_wm_region_set(', 'void CTX_wm_operator_poll_msg_clear(', 'void CTX_data_main_set(']
ctxbody='\n'.join(function(context,s) for s in ctxsigs)
workspacebody='\n'.join(function(workspace,s) for s in ['WorkSpace *BKE_workspace_active_get(', 'bScreen *BKE_workspace_active_screen_get('])
windowget='\n'.join(function(window,s) for s in ['WorkSpace *WM_window_get_active_workspace(', 'bScreen *WM_window_get_active_screen(', 'Scene *WM_window_get_active_scene(', 'int WM_window_native_pixel_x(', 'int WM_window_native_pixel_y('])
keyboard=events[events.index('#define ISKEYBOARD(event_type)'):events.index('/**',events.index('#define ISKEYBOARD(event_type)'))]
# Actual group-list getter is native list access only.
grouplist=function(gizmo,'const ListBase *WM_gizmomap_group_list(')
hier=panels[panels.index('struct IPadKnifeHierarchyRegion {'):panels.index('\nstatic void tag_layout(',panels.index('struct IPadKnifeHierarchyRegion {'))]
hudlive=function(panels,'static bool ipad_hud_window_live(')
hudpopup=function(panels,'static bool ipad_knife_hud_higher_popup(')
probe=function(panels,'bool ED_ipad_knife_pan_probe(')
bridge=function(window,'static bool wm_ipad_knife_pan_probe(')
# Lifecycle executes actual registration/clear order with explicit native system
# stubs. The dispose stub asserts the registry is null before native disposal.
pin=REPO/'.cache/preflight/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e'
ghost_ios=read('intern/ghost/intern/GHOST_WindowIOS.mm')
ghost_eventmanager=(pin/'intern/ghost/intern/GHOST_EventManager.cc').read_text()
ghost_system_header=(pin/'intern/ghost/intern/GHOST_System.hh').read_text()
ghostmodel=r'''
#include <deque>
enum GHOST_TEventType{GHOST_kEventKeyDown=1,GHOST_kEventKeyUp=2,GHOST_kEventCursorMove=3};
enum GHOST_TSuccess{GHOST_kFailure=0,GHOST_kSuccess=1};
#define GHOST_ASSERT(x,...) assert(x)
struct GHOST_IEvent{virtual ~GHOST_IEvent()=default;virtual GHOST_TEventType getType()const=0;};
struct GhostEvent:GHOST_IEvent{GHOST_TEventType type;const void*window;GhostEvent(GHOST_TEventType t,const void*w=nullptr):type(t),window(w){}GHOST_TEventType getType()const override{return type;}};
struct GHOST_EventManager{using TEventStack=std::deque<const GHOST_IEvent*>;TEventStack events_;uint32_t getNumEvents();uint32_t getNumEvents(GHOST_TEventType);GHOST_TSuccess pushEvent(const GHOST_IEvent*);};
struct GHOST_System{GHOST_EventManager*event_manager_=nullptr;GHOST_EventManager*getEventManager()const;};
struct GHOST_ISystem{static GHOST_System*system;static GHOST_System*getSystem(){return system;}};
GHOST_System*GHOST_ISystem::system=nullptr;
'''
ghostqueue='\n'.join(function(ghost_eventmanager,s) for s in ['uint32_t GHOST_EventManager::getNumEvents()', 'uint32_t GHOST_EventManager::getNumEvents(GHOST_TEventType type)', 'GHOST_TSuccess GHOST_EventManager::pushEvent('])+function(ghost_system_header,'inline GHOST_EventManager *GHOST_System::getEventManager() const')
ghostwrappers='\nnamespace ghost::ios {\n'+'\n'.join(function(ghost_ios,s) for s in ['static bool pencil_knife_pan_keyboard_queue_clear(', 'PencilKnifePanContact pencil_knife_pan_at_start(', 'bool pencil_knife_pan_recognize('])+'\n}\n'
lifecyclemodel=r'''
using GHOST_SystemHandle=void*;using GHOST_EventConsumerHandle=void*;using GHOST_TBacktraceFn=void(*)();
static GHOST_SystemHandle g_system=nullptr;
static int disposals=0,registrations=0;static int ghost_event_proc=0;static bool bad_system=false;
struct GHOST_Debug{int flags;};constexpr int G_DEBUG_GHOST=1,G_DEBUG_WINTAB=2,GHOST_kDebugDefault=1,GHOST_kDebugWintab=2;
static void BLI_system_backtrace(){}
static GHOST_EventConsumerHandle GHOST_CreateEventConsumer(int,bContext*){return (void*)1;}
static void GHOST_SetBacktraceHandler(GHOST_TBacktraceFn){}
static void*GHOST_CreateSystem(){return bad_system?nullptr:GHOST_ISystem::getSystem();}
static void*GHOST_CreateSystemBackground(){return (void*)20;}
static void GPU_backend_ghost_system_set(void*){}
static void GHOST_SystemInitDebug(void*,GHOST_Debug){}
static void GHOST_AddEventConsumer(void*,void*){}
static void GHOST_UseNativePixels(){}
static void GHOST_UseWindowFocus(bool){}
static void GHOST_DisposeSystem(void*){assert(ghost::ios::pencil_knife_pan_probe==nullptr);GHOST_ISystem::system=nullptr;++disposals;}
static struct{bool native_pixels=true,window_focus=true;}wm_init_state;
'''
lifecycle='\n'.join(function(window,s) for s in ['void wm_ghost_init(', 'void wm_ghost_init_background(', 'void wm_ghost_exit('])
# Every actual query branch has source in this fixture. Geometry/list/object
# backing, native operator/type registries, allocation and GPU/UI are boundaries.
source=pre+prelude+workspacebody+ctxbody+windowget+extra+header+drawheader+bodies+'\n#include "'+str(ROOT/'intern/ghost/GHOST_NavigationIOS.hh').replace('\\','/')+'"\n'+keyboard+function(tools,'bToolRef *WM_toolsystem_ref_find(')+grouplist+hier+hudlive+hudpopup+probe+ghostmodel+ghostqueue+lifecyclemodel+bridge+lifecycle+ghostwrappers
main=r'''
struct Fixture{
 GHOST_System ghostsystem;GHOST_EventManager ghostevents;Main main;wmWindowManager manager;wmWindowManagerRuntime manager_runtime;wmWindow win;wmWindowRuntime winruntime;wmEvent state;bScreen screen;ScrArea area;ARegion region;ARegionRuntime runtime;ARegionType art;Scene scene;ViewLayer layer;Base base;Object object;Mesh mesh;MeshRuntime meshrt;BMEditMesh em;WorkSpace workspace;WorkSpaceLayout layout;WorkSpaceInstanceHook hook;wmOperatorType type;wmOperator op;wmEventHandler_Op handler;View3D v3d;Link rv3d;wmIPadKnifeOwner owner;bContext C{};KnifeTool_OpData kcd;RegionDrawCB cb;wmDrawBuffer buffer{};bToolRef tool;Model model;
 wmGizmoGroupType navtype,othertype;wmGizmoGroup nav,hidden,nosetup,hover;wmGizmo navg,hiddeng,nosetupg,hoverg;wmGizmoMap map;ToolSettings settings;bToolRef_Runtime toolruntime;wmKeyConfig defaultconf,addonconf,userconf;wmKeyMap keymap;wmKeyMapItem item;
 Fixture(){GHOST_ISystem::system=&ghostsystem;ghostsystem.event_manager_=&ghostevents;lifetimes.clear();G_MAIN=&main;registered_type=&type;manager.id.session_uid=11;manager.runtime=&manager_runtime;manager_runtime.defaultconf=&defaultconf;manager_runtime.addonconf=&addonconf;manager_runtime.userconf=&userconf;BLI_addtail(&manager_runtime.keyconfigs,&defaultconf);BLI_addtail(&manager_runtime.keyconfigs,&addonconf);BLI_addtail(&manager_runtime.keyconfigs,&userconf);BLI_addtail(&userconf.keymaps,&keymap);BLI_addtail(&keymap.items,&item);scene.toolsettings=&settings;tool.runtime=&toolruntime;screen.id.session_uid=12;scene.id.session_uid=13;object.id.session_uid=14;mesh.id.session_uid=15;type.ipad_lifetime_id=16;workspace.id.session_uid=18;
 BLI_addtail(&main.wm,&manager);BLI_addtail(&main.screens,&screen);BLI_addtail(&main.scenes,&scene);BLI_addtail(&main.objects,&object);BLI_addtail(&main.meshes,&mesh);BLI_addtail(&main.workspaces,&workspace);BLI_addtail(&workspace.layouts,&layout);BLI_addtail(&workspace.tools,&tool);layout.screen=&screen;hook={&workspace,&layout};win.workspace_hook=&hook;
 BLI_addtail(&manager.windows,&win);win.runtime=&winruntime;win.screen=&screen;win.scene=&scene;win.eventstate=&state;manager_runtime.winactive=&win;BLI_addtail(&screen.areabase,&area);BLI_addtail(&area.regionbase,&region);BLI_addtail(&area.spacedata,&v3d);area.runtime.tool=&tool;region.runtime=&runtime;region.regiondata=&rv3d;runtime.type=&art;art.draw=+[](){};art.context=provider_poison;
 BLI_addtail(&scene.view_layers,&layer);BLI_addtail(&layer.object_bases,&base);layer.basact=&base;base.object=&object;object.data=&mesh;mesh.runtime=&meshrt;meshrt.edit_mesh=&em;
 op.type=&type;op.customdata=&kcd;kcd.vc={&scene,&layer,&v3d,&region,&rv3d,&object};kcd.draw_handle=&cb;cb={};cb.draw=knifetool_draw;cb.customdata=&kcd;cb.type=REGION_DRAW_POST_VIEW;handler.op=&op;handler.context={&win,&area,&region,nullptr};CTX_wm_manager_set(&C,&manager);CTX_wm_window_set(&C,&win);CTX_wm_area_set(&C,&area);CTX_wm_region_set(&C,&region);
 buffer.viewport=(GPUViewport*)1;runtime.draw_buffer=&buffer;model.main=&area;
 // A nonempty ordinary Edit Mesh viewport: actual native navigation plus an
 // initialized hidden group, NoSetup group and initialized hover-only gizmo.
 std::strcpy(navtype.idname,"VIEW3D_GGT_navigate");nav.type=&navtype;navg.matrix_basis[3][0]=750;navg.matrix_basis[3][1]=550;navg.scale_basis=12;BLI_addtail(&nav.gizmos,&navg);
 othertype.poll=+[]()->bool{++poison_calls;return true;};hidden.type=&othertype;hidden.hide.any=1;BLI_addtail(&hidden.gizmos,&hiddeng);nosetup.type=&othertype;nosetup.init_flag=0;BLI_addtail(&nosetup.gizmos,&nosetupg);hover.type=&othertype;hoverg.flag=WM_GIZMO_DRAW_HOVER;BLI_addtail(&hover.gizmos,&hoverg);
 BLI_addtail(&map.groups,&nav);BLI_addtail(&map.groups,&hidden);BLI_addtail(&map.groups,&nosetup);BLI_addtail(&map.groups,&hover);runtime.gizmo_map=&map;
 native_fac=1;ui_scale=1;main_thread=true;G.background=false;wm_ghost_init(&C);full();present();
 }
 void full(){std::array<uint64_t,32>s{};bool ok=WM_ipad_knife_canvas_scope_capture(&C,&win,&area,&region,s);assert(ok);wm_ipad_knife_canvas_stamp_finish(&C,&win,&area,&region,s,ok,false);assert(buffer.ipad_knife_canvas_stamp.valid);}
 void begin(){ipad_knife_hierarchy_begin(&win);}
 void composite(){rcti rect=region.winrct;++rect.xmax;++rect.ymax;ED_ipad_knife_hierarchy_region_presented(&C,&win,&area,&region,rect);}
 void end(){ipad_knife_hierarchy_draw_capture(&C,&win,model,{});ED_ipad_knife_hierarchy_window_callbacks(&C,&win,false);ipad_knife_hierarchy_publish(&C,&win);}
 void present(){begin();composite();end();}
 void live(){if(BLI_findindex(&win.modalhandlers,&handler.head)==-1)BLI_addtail(&win.modalhandlers,&handler.head);wm_ipad_knife_modal_handler_bind(&win,&area,&region,&handler);assert(WM_ipad_knife_owner_capture(&C,&win,&area,owner));}
 ghost::ios::PencilKnifePanContact capture(int x=200,int y=300){return ghost::ios::pencil_knife_pan_at_start(win.ghostwin,x,y,71);}
 bool validate(const ghost::ios::PencilKnifePanContact&in){return ghost::ios::pencil_knife_pan_recognize(win.ghostwin,in);}

};
int main(int argc,char**argv){assert(argc==2);std::string which=argv[1];Fixture f;assert(!f.capture().valid());f.live();auto first=f.capture();assert(first.valid()&&first.intent==ghost::ios::PencilKnifePanIntent::Live);assert(f.validate(first));
 if(which=="plain-initial")assert(f.validate(first));
 else if(which=="source-aba"){std::strcpy(f.tool.idname,"builtin.select_circle");assert(f.validate(first));std::strcpy(f.tool.idname,"builtin.knife");assert(f.validate(first));}
 else if(which=="modifier-origin"){f.state.modifier=2;assert(f.capture().valid()&&f.validate(first));}
 else if(which=="keymodifier-origin"){f.state.keymodifier=65;assert(f.capture().valid());}
 else if(which=="active-modifier"){wmWindow active;active.ghostwin=(void*)56;wmEvent state;state.modifier=2;active.eventstate=&state;wmWindowRuntime rt;active.runtime=&rt;BLI_addtail(&f.manager.windows,&active);f.manager_runtime.winactive=&active;assert(f.capture().valid());}
 else if(which=="active-membership"){f.manager_runtime.winactive=(wmWindow*)1;assert(f.capture().valid());}
 else if(which=="native-key-before"){wmEvent key;key.type='A';BLI_addtail(&f.winruntime.event_queue,&key);assert(!f.capture().valid());}
 else if(which=="native-key-between"){wmEvent key;key.type=EVT_F24KEY;BLI_addtail(&f.winruntime.event_queue,&key);assert(!f.validate(first));}
 else if(which=="native-modal-mapped-key"){wmEvent key;key.type=EVT_MODAL_MAP;key.prev_type='A';BLI_addtail(&f.winruntime.event_queue,&key);assert(!f.validate(first));}
 else if(which=="native-modal-nonkey"){wmEvent key;key.type=EVT_MODAL_MAP;key.prev_type=0x1000;BLI_addtail(&f.winruntime.event_queue,&key);assert(f.validate(first));}
 else if(which=="native-other-window-key"){wmWindow other;wmWindowRuntime rt;other.runtime=&rt;other.ghostwin=(void*)56;BLI_addtail(&f.manager.windows,&other);wmEvent key;key.type='A';BLI_addtail(&rt.event_queue,&key);assert(!f.validate(first));}
 else if(which=="live-processed-ctrl"){f.live();f.state.modifier=2;auto receipt=f.capture();assert(receipt.valid()&&receipt.intent==ghost::ios::PencilKnifePanIntent::Live&&f.validate(receipt));}
 else if(which=="live-key-queued"){f.live();auto receipt=f.capture();wmEvent key;key.type='A';BLI_addtail(&f.winruntime.event_queue,&key);assert(!f.validate(receipt));}
 else if(which=="live-owner-replaced"){f.live();auto receipt=f.capture();++lifetimes[&f.op];assert(!f.validate(receipt));}
 else if(which=="live-original-region"){f.live();auto receipt=f.capture();f.kcd.vc.region=nullptr;assert(!f.validate(receipt));}
 else if(which=="tool-to-live"){BLI_remlink(&f.win.modalhandlers,&f.handler.head);assert(!f.capture().valid()&&!f.validate(first));}
 else if(which=="live-to-tool"){f.live();auto receipt=f.capture();BLI_remlink(&f.win.modalhandlers,&f.handler.head);assert(!f.validate(receipt));}
 else if(which=="callback-current-unknown"){RegionDrawCB cb;cb.type=REGION_DRAW_POST_VIEW;cb.draw=knifetool_draw;BLI_addtail(&f.art.drawcalls,&cb);assert(!f.validate(first));}
 else if(which=="callback-known-cached"){f.live();BLI_addtail(&f.art.drawcalls,&f.cb);ed_region_draw_cb_draw(&f.C,&f.region,&f.art,REGION_DRAW_POST_VIEW);f.full();f.runtime.ipad_knife_canvas_drawn_owner={};f.present();auto receipt=f.capture();assert(receipt.valid());f.present();assert(f.validate(receipt));}
 else if(which=="callback-owner-retired"){f.live();f.runtime.ipad_knife_canvas_drawn_owner=f.owner.values;f.full();f.runtime.ipad_knife_canvas_drawn_owner={};f.present();auto receipt=f.capture();assert(receipt.valid());BLI_remlink(&f.win.modalhandlers,&f.handler.head);assert(!f.capture().valid()&&!f.validate(receipt));}
 else if(which=="cached-unknown"){f.buffer.ipad_knife_canvas_stamp.unknown_widgets=true;f.present();f.runtime.ipad_knife_canvas_unknown_widgets=false;assert(!f.capture().valid());}
 else if(which=="overlay-after-blit"){f.begin();f.composite();f.runtime.ipad_knife_canvas_unknown_widgets=true;f.end();f.runtime.ipad_knife_canvas_unknown_widgets=false;assert(!f.capture().valid());}
 else if(which=="cached-content"){auto content=f.buffer.ipad_knife_canvas_stamp.content;f.present();assert(f.validate(first)&&f.buffer.ipad_knife_canvas_stamp.content==content);}
 else if(which=="stale-content"){++f.buffer.ipad_knife_canvas_stamp.content;assert(!f.validate(first));f.present();assert(!f.validate(first));}
 else if(which=="stale-scene-uid"){++f.scene.id.session_uid;assert(!f.validate(first));}
 else if(which=="stale-screen-uid"){++f.screen.id.session_uid;assert(!f.validate(first));}
 else if(which=="stale-workspace-uid"){++f.workspace.id.session_uid;assert(!f.validate(first));}
 else if(which=="stale-geometry"){--f.region.winrct.xmax;assert(!f.validate(first));}
 else if(which=="scope-object-address"){Object replacement=f.object;f.base.object=&replacement;assert(!f.validate(first));}
 else if(which=="pending-frame"){f.begin();assert(!f.validate(first));}
 else if(which=="partial-composition"){f.begin();rcti part{0,399,0,600};ED_ipad_knife_hierarchy_region_presented(&f.C,&f.win,&f.area,&f.region,part);f.end();assert(!f.capture().valid());}
 else if(which=="full-split-composition"){f.begin();rcti a{0,400,0,600},b{400,800,0,600};ED_ipad_knife_hierarchy_region_presented(&f.C,&f.win,&f.area,&f.region,a);ED_ipad_knife_hierarchy_region_presented(&f.C,&f.win,&f.area,&f.region,b);f.end();assert(f.capture().valid());}
 else if(which=="stereo"){f.buffer.stereo=true;assert(!f.capture().valid());}
 else if(which=="drawn-rails"){f.model.layout.left_rail={100,100,300,400};f.present();assert(!f.capture().valid());}
 else if(which=="hud-footprint"){auto &frame=ipad_hud_frames[uintptr_t(&f.win)];frame.window_id=f.win.winid;frame.presented.push_back({{{100,300,100,400}}});assert(!f.capture().valid());}
 else if(which=="navigation-covered"){assert(!f.capture(750,49).valid());assert(f.capture(200,300).valid());}
 else if(which=="top-left-conversion"){f.runtime.ipad_canvas_rect={0,799,0,99};f.full();f.present();assert(f.capture(200,550).valid()&&!f.capture(200,50).valid());}
 else if(which=="unknown-gizmo-visible"){f.hidden.hide.any=0;assert(!f.capture().valid());}
 else if(which=="new-hidden-group"){wmGizmoGroup group;group.type=&f.othertype;group.hide.any=1;BLI_addtail(&f.map.groups,&group);assert(!f.validate(first));}
 else if(which=="new-nosetup-gizmo"){wmGizmo gizmo;BLI_addtail(&f.nosetup.gizmos,&gizmo);assert(!f.validate(first));}
 else if(which=="hover-becomes-visible"){f.hoverg.state=WM_GIZMO_STATE_HIGHLIGHT;assert(!f.validate(first));}
 else if(which=="window-callback-current"){Link cb;BLI_addtail(&f.win.drawcalls,&cb);assert(!f.validate(first));}
 else if(which=="window-callback-self-removal"){f.begin();f.composite();ipad_knife_hierarchy_draw_capture(&f.C,&f.win,f.model,{});ED_ipad_knife_hierarchy_window_callbacks(&f.C,&f.win,true);ipad_knife_hierarchy_publish(&f.C,&f.win);assert(!f.capture().valid());}
 else if(which=="ui-block"){f.runtime.uiblocks.first=(void*)1;assert(!f.validate(first));}
 else if(which=="modal-ui"){wmEventHandler_UI ui;ui.head.type=WM_HANDLER_TYPE_UI;BLI_addtail(&f.win.modalhandlers,&ui.head);assert(!f.validate(first));}
 else if(which=="gesture"){f.win.gesture.first=(void*)1;assert(!f.validate(first));}
 else if(which=="paintcursor"){f.manager_runtime.paintcursors.first=(void*)1;assert(!f.validate(first));}
 else if(which=="tool-update-pending"){f.area.flag|=AREA_FLAG_ACTIVE_TOOL_UPDATE;assert(f.validate(first));}
 else if(which=="null-runtime"){f.region.runtime=nullptr;assert(!f.validate(first));}
 else if(which=="foreign-ghost"){ghost::ios::PencilKnifePanContact out;assert(!wm_ipad_knife_pan_probe((void*)56,false,first,out));}
 else if(which=="duplicate-ghost"){wmWindow other;wmWindowRuntime rt;other.runtime=&rt;other.ghostwin=f.win.ghostwin;BLI_addtail(&f.manager.windows,&other);assert(!f.validate(first));}
 else if(which=="stale-layout"){BLI_remlink(&f.workspace.layouts,&f.layout);f.hook.act_layout=(WorkSpaceLayout*)1;assert(!f.validate(first));}
 else if(which=="stale-window"){BLI_remlink(&f.manager.windows,&f.win);assert(!f.validate(first));}
 else if(which=="not-main-thread"){main_thread=false;assert(!f.validate(first));main_thread=true;}
 else if(which=="zero-serial"){first.serial=0;assert(!f.validate(first));}
 else if(which=="changed-origin"){first.origin_x=201;assert(f.validate(first));/* Native receives values only; physical origin integrity is enforced by GHOST's immutable receipt. */}
 else if(which=="lifecycle"){assert(ghost::ios::pencil_knife_pan_probe==wm_ipad_knife_pan_probe);wm_ghost_exit();assert(!ghost::ios::pencil_knife_pan_probe&&disposals==1&&!f.validate(first));wm_ghost_exit();assert(!ghost::ios::pencil_knife_pan_probe&&disposals==1);wm_ghost_init_background();assert(!ghost::ios::pencil_knife_pan_probe);wm_ghost_exit();assert(disposals==2);}
 else if(which=="custom-circle-item"){BLI_remlink(&f.win.modalhandlers,&f.handler.head);std::strcpy(f.item.idname,"VIEW3D_OT_select_circle");assert(!f.capture().valid()&&!f.validate(first));}
 else if(which=="custom-transform-item"){BLI_remlink(&f.win.modalhandlers,&f.handler.head);std::strcpy(f.item.idname,"TRANSFORM_OT_translate");assert(!f.capture().valid());}
 else if(which=="custom-preset"){BLI_remlink(&f.win.modalhandlers,&f.handler.head);std::strcpy(U.keyconfigstr,"Industry Compatible");assert(!f.capture().valid());}
 else if(which=="custom-addon"){BLI_remlink(&f.win.modalhandlers,&f.handler.head);wmKeyMap addon;BLI_addtail(&f.addonconf.keymaps,&addon);assert(!f.capture().valid());}
 else if(which=="custom-persisted-diff"){BLI_remlink(&f.win.modalhandlers,&f.handler.head);wmKeyMap diff;BLI_addtail(&U.user_keymaps,&diff);assert(!f.capture().valid());}
 else if(which=="custom-effective-diff"){BLI_remlink(&f.win.modalhandlers,&f.handler.head);f.keymap.diff_items.first=(void*)1;assert(!f.capture().valid());}
 else if(which=="custom-user-modified"){BLI_remlink(&f.win.modalhandlers,&f.handler.head);f.keymap.flag|=KEYMAP_USER_MODIFIED;assert(!f.capture().valid());}
 else if(which=="custom-update-pending"){BLI_remlink(&f.win.modalhandlers,&f.handler.head);f.keymap.flag|=KEYMAP_UPDATE;assert(!f.capture().valid());}
 else if(which=="custom-item-update"){BLI_remlink(&f.win.modalhandlers,&f.handler.head);f.item.flag|=KMI_UPDATE;assert(!f.capture().valid());}
 else if(which=="custom-item-modified"){BLI_remlink(&f.win.modalhandlers,&f.handler.head);f.item.flag|=KMI_USER_MODIFIED;assert(!f.capture().valid());}
 else if(which=="custom-extra-map-item"){BLI_remlink(&f.win.modalhandlers,&f.handler.head);wmKeyMapItem extra;BLI_addtail(&f.keymap.items,&extra);assert(!f.capture().valid());}
 else if(which=="custom-fallback-route"){BLI_remlink(&f.win.modalhandlers,&f.handler.head);std::strcpy(f.toolruntime.keymap_fallback,"Fallback");f.settings.workspace_tool_type=SCE_WORKSPACE_TOOL_FALLBACK;assert(!f.capture().valid());}
 else if(which=="custom-native-type-replaced"){BLI_remlink(&f.win.modalhandlers,&f.handler.head);f.type.modal=+[](bContext*,wmOperator*,const wmEvent*){return OPERATOR_RUNNING_MODAL;};assert(!f.capture().valid());}
 else if(which=="live-native-type-replaced"){f.type.modal=+[](bContext*,wmOperator*,const wmEvent*){return OPERATOR_RUNNING_MODAL;};assert(!f.capture().valid()&&!f.validate(first));}
 else if(which=="full-redraw-invalidates"){auto old=first.content;f.full();f.present();assert(f.buffer.ipad_knife_canvas_stamp.content!=old&&!f.validate(first));}
 else if(which=="native-drag-current"){f.manager_runtime.drags.first=(void*)1;assert(!f.capture().valid()&&!f.validate(first));}
 else if(which=="native-drag-self-removal"){f.begin();f.composite();ipad_knife_hierarchy_draw_capture(&f.C,&f.win,f.model,{});ED_ipad_knife_hierarchy_window_callbacks(&f.C,&f.win,false);ED_ipad_knife_hierarchy_window_callbacks(&f.C,&f.win,true);ipad_knife_hierarchy_publish(&f.C,&f.win);assert(!f.capture().valid());}
 else if(which=="live-custom-config"){f.live();f.state.modifier=2;std::strcpy(f.item.idname,"VIEW3D_OT_select_circle");f.keymap.flag|=KEYMAP_USER_MODIFIED;auto receipt=f.capture();assert(receipt.valid()&&receipt.intent==ghost::ios::PencilKnifePanIntent::Live&&f.validate(receipt));}
 else if(which=="ghost-keydown-before"){GhostEvent key(GHOST_kEventKeyDown,f.win.ghostwin);assert(f.ghostevents.pushEvent(&key)==GHOST_kSuccess);int allocations=ctx_allocs;assert(!f.capture().valid()&&ctx_allocs==allocations);}
 else if(which=="ghost-keyup-before"){GhostEvent key(GHOST_kEventKeyUp,f.win.ghostwin);f.ghostevents.pushEvent(&key);int allocations=ctx_allocs;assert(!f.capture().valid()&&ctx_allocs==allocations);}
 else if(which=="ghost-key-between"){GhostEvent key(GHOST_kEventKeyDown,f.win.ghostwin);f.ghostevents.pushEvent(&key);int allocations=ctx_allocs;assert(!f.validate(first)&&ctx_allocs==allocations);}
 else if(which=="ghost-otherwindow-key"){GhostEvent key(GHOST_kEventKeyUp,(void*)56);f.ghostevents.pushEvent(&key);int allocations=ctx_allocs;assert(!f.capture().valid()&&!f.validate(first)&&ctx_allocs==allocations);}
 else if(which=="ghost-nonkey-pending"){GhostEvent cursor(GHOST_kEventCursorMove,f.win.ghostwin);f.ghostevents.pushEvent(&cursor);assert(f.capture().valid()&&f.validate(first));}
 else if(which=="ghost-missing-system"){GHOST_ISystem::system=nullptr;int allocations=ctx_allocs;assert(!f.capture().valid()&&!f.validate(first)&&ctx_allocs==allocations);}
 else if(which=="ghost-missing-manager"){f.ghostsystem.event_manager_=nullptr;int allocations=ctx_allocs;assert(!f.capture().valid()&&!f.validate(first)&&ctx_allocs==allocations);}
 else if(which=="ghost-missing-callback"){ghost::ios::set_pencil_knife_pan_probe(nullptr);int allocations=ctx_allocs;assert(!f.capture().valid()&&!f.validate(first)&&ctx_allocs==allocations);}
 else if(which=="provider-poison-control"){assert(provider_poison()==0);--provider_callbacks;CTX_data_main_set(&f.C,&f.main);assert(sound_calls==1);--sound_calls;f.C.data.main=nullptr;}
 else assert(false&&"unknown case");
 assert(provider_callbacks==0&&native_calls==0&&poison_calls==0&&sound_calls==0&&ctx_allocs==ctx_frees);std::cout<<which<<" PASS contexts="<<ctx_allocs<<"/"<<ctx_frees<<"\n";
}
'''
# Actual receipt publication seams, not caller-generated CanvasStamp state.
source+='\n'+function(panels,'void ED_ipad_knife_hierarchy_region_presented(')+'\n'+function(panels,'void ED_ipad_knife_hierarchy_window_callbacks(')+main
# The test fixture's own class methods call those functions before definitions.
source=source.replace('struct Fixture{','void ED_ipad_knife_hierarchy_region_presented(bContext*,wmWindow*,ScrArea*,ARegion*,const rcti&);\nvoid ED_ipad_knife_hierarchy_window_callbacks(bContext*,wmWindow*,bool);\nstruct Fixture{',1)
cpp=OUT/'actual_native_bridge.cc';cpp.write_text(source,encoding='utf-8',newline='\n')
cases=['plain-initial','source-aba','modifier-origin','keymodifier-origin','active-modifier','active-membership','native-key-before','native-key-between','native-modal-mapped-key','native-modal-nonkey','native-other-window-key','live-processed-ctrl','live-key-queued','live-owner-replaced','live-original-region','tool-to-live','live-to-tool','callback-current-unknown','callback-known-cached','callback-owner-retired','cached-unknown','overlay-after-blit','cached-content','stale-content','stale-scene-uid','stale-screen-uid','stale-workspace-uid','stale-geometry','scope-object-address','pending-frame','partial-composition','full-split-composition','stereo','drawn-rails','hud-footprint','navigation-covered','top-left-conversion','unknown-gizmo-visible','new-hidden-group','new-nosetup-gizmo','hover-becomes-visible','window-callback-current','window-callback-self-removal','ui-block','modal-ui','gesture','paintcursor','tool-update-pending','null-runtime','foreign-ghost','duplicate-ghost','stale-layout','stale-window','not-main-thread','zero-serial','changed-origin','lifecycle','provider-poison-control','custom-circle-item','custom-transform-item','custom-preset','custom-addon','custom-persisted-diff','custom-effective-diff','custom-user-modified','custom-update-pending','custom-item-update','custom-item-modified','custom-extra-map-item','custom-fallback-route','custom-native-type-replaced','live-custom-config','live-native-type-replaced','full-redraw-invalidates','native-drag-current','native-drag-self-removal','ghost-keydown-before','ghost-keyup-before','ghost-key-between','ghost-otherwindow-key','ghost-nonkey-pending','ghost-missing-system','ghost-missing-manager','ghost-missing-callback']
results=[]
for opt in (['0','2'] if OPT.opt_level=='both' else [OPT.opt_level]):
 exe=OUT/f'actual-native-bridge-O{opt}.exe'
 compiler=shutil.which('clang++') or r'C:/Program Files/LLVM/bin/clang++.exe'
 cmd=[compiler,'-std=c++17','-DWIN32=1','-O'+opt,str(cpp),'-o',str(exe)]
 build=subprocess.run(cmd,capture_output=True,text=True)
 (OUT/f'compile-O{opt}.log').write_text(build.stdout+build.stderr)
 if build.returncode:print(build.stderr);sys.exit(build.returncode)
 for case in cases:
  run=subprocess.run([str(exe),case],capture_output=True,text=True)
  results.append(dict(opt=opt,case=case,returncode=run.returncode,stdout=run.stdout,stderr=run.stderr))
 (OUT/f'run-O{opt}.json').write_text(json.dumps(results[-len(cases):],indent=2))
report=dict(status='PASS' if all(not r['returncode'] for r in results) else 'FAIL',count=len(results),policy='Original live registered Knife only; no initial Tool admission. Every no-handler/custom initial route retains native PAN. Same owner, scope and content at both physical gates.',results=results,harness_sha256=hashlib.sha256(source.encode()).hexdigest(),script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),connected_ghost_native_chain=True,actual_ghost_wrappers_source_sha256=hashlib.sha256(ghost_ios.encode()).hexdigest(),actual_eventmanager_source_sha256=hashlib.sha256(ghost_eventmanager.encode()).hexdigest(),actual_system_header_sha256=hashlib.sha256(ghost_system_header.encode()).hexdigest(),actual_context_sha256=hashlib.sha256(context.encode()).hexdigest(),actual_workspace_sha256=hashlib.sha256(workspace.encode()).hexdigest(),boundaries='Actual GHOST .mm Capture/Recognize wrappers and registry invoke actual native bridge to EDprobe to scope/owner/completed hierarchy, with actual pinned getNumEvents/pushEvent/getEventManager. Actual native queue/context lifecycle execute. Native-shaped explicit list/object/widget backing, operator/type registries, GPU allocation and system initialization boundary stubs. No whole-Blender, UIKit, target compiler, heap lifetime, scheduler or device proof.')
(OUT/'test-results.json').write_text(json.dumps(report,indent=2));print(json.dumps(dict(status=report['status'],count=len(results),failed=[r for r in results if r['returncode']],harness_sha256=report['harness_sha256']),indent=2))
sys.exit(0 if report['status']=='PASS' else 1)
