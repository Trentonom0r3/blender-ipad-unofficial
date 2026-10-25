"""Actual Knife hierarchy draw, native blit/blend and HUD receipt execution.

WM owner/allocator/font/GPU/list/context primitives are explicit fixtures. The
actual native button generator, rail policy, draw completion, per-WINDOW nav
capture, compositor success branches, publication and hit/retirement execute.
No full renderer, native scheduler, UIKit or device proof is claimed.
"""
from pathlib import Path
import argparse, hashlib, json, shutil, subprocess, sys, tempfile, unittest
parser=argparse.ArgumentParser(add_help=False)
parser.add_argument('--repo',type=Path,default=Path(__file__).resolve().parents[1])
parser.add_argument('--source-dir',type=Path)
parser.add_argument('--draw-source',type=Path)
parser.add_argument('--output-dir',type=Path)
parser.add_argument('--opt-level',choices=('0','2'),default='0')
OPT,ARGS=parser.parse_known_args()
REPO=OPT.repo
if not (REPO/'patches/blender-ipad.patch').is_file(): raise RuntimeError('Pass --repo pointing to the active checkout')
OUT=OPT.output_dir or Path(tempfile.mkdtemp(prefix='knife-hud-receipts-'));OUT.mkdir(parents=True,exist_ok=True)
sys.path.insert(0,str(REPO/'build'))
from test_compact_shelf import function
import test_touch_extrude as touch

def source(path):
 p=OPT.source_dir/path if OPT.source_dir else None
 return p.read_text(encoding='utf-8') if p and p.is_file() else touch.changed_source(path)
S=source('source/blender/editors/screen/screen_ipad_panels.cc')
D=OPT.draw_source.read_text(encoding='utf-8') if OPT.draw_source else source('source/blender/windowmanager/intern/wm_draw.cc')
NAV=source('source/blender/editors/space_view3d/view3d_gizmo_navigate.cc')
WMH=source('source/blender/windowmanager/WM_ipad_knife.hh')
assert '#include "gizmo/WM_gizmo_api.hh"' in S and '#include "gizmo/WM_gizmo_types.hh"' in S
# Explicit boundary models copied from the retained HUD fixture at this checkpoint.
# They are not native source and make no UI/GPU/WM semantics claim.
BOUNDARY_MODEL_SHA256='633dc281b7bd2339f4953f4095fe15991003246d7dfac7af4424b4e12b1a93bc'
w='\n#include <algorithm>\n#include <array>\n#include <cassert>\n#include <cstdint>\n#include <cstring>\n#include <limits>\n#include <unordered_map>\n#include <unordered_set>\n#include <vector>\n#include <utility>\n#include <string>\n#include <functional>\nstruct rcti {int xmin=0,xmax=0,ymin=0,ymax=0;};\nstruct rctf {float xmin=0,xmax=0,ymin=0,ymax=0;};\nvoid BLI_rcti_translate(rcti *r,int x,int y){r->xmin+=x;r->xmax+=x;r->ymin+=y;r->ymax+=y;}\nbool BLI_rcti_isect(const rcti *a,const rcti *b,rcti *r){\n *r={std::max(a->xmin,b->xmin),std::min(a->xmax,b->xmax),std::max(a->ymin,b->ymin),std::min(a->ymax,b->ymax)};\n return r->xmin<=r->xmax&&r->ymin<=r->ymax;\n}\nint BLI_rcti_size_x(const rcti *r){return r->xmax-r->xmin;}\nint BLI_rcti_size_y(const rcti *r){return r->ymax-r->ymin;}\nvoid BLI_strncpy(char *dst,const char *src,size_t n){size_t size=std::min(n-1,std::strlen(src));std::memcpy(dst,src,size);dst[size]=0;}\n#define LISTBASE_FOREACH(T,var,list) for(T var : *(list))\ntemplate<class T>int BLI_findindex(const std::vector<T*> *v,const T *p){auto i=std::find(v->begin(),v->end(),p);return i==v->end()?-1:int(i-v->begin());}\nconstexpr int RGN_TYPE_HUD=1,RGN_TYPE_WINDOW=2,SPACE_VIEW3D=3;\nconstexpr int RGN_FLAG_HIDDEN=1,RGN_FLAG_HIDDEN_BY_USER=2,RGN_FLAG_TOO_SMALL=4,RGN_FLAG_POLL_FAILED=8;\nconstexpr int RGN_ALIGN_FLOAT=1,RGN_ALIGN_LEFT=2,RGN_ALIGN_RIGHT=3;\n#define RGN_ALIGN_ENUM_FROM_MASK(v) (v)\nstruct RegionRuntime{bool visible=true,ipad_canvas=false;uint64_t ipad_hud_content_lifetime=0;void *draw_buffer=reinterpret_cast<void*>(7);rcti ipad_canvas_rect;};\nstruct Panel{void *type=nullptr;bool active=false;};\nstruct ARegion{int regiontype=RGN_TYPE_HUD,flag=0,alignment=RGN_ALIGN_FLOAT;bool overlap=true;float alpha=1;RegionRuntime *runtime;rcti winrct;std::vector<Panel*> panels{};};\nstruct AreaRuntime{int ipad_layer=1;};\nstruct ScrArea{int spacetype=SPACE_VIEW3D;bool visible=true;AreaRuntime runtime;std::vector<ARegion*> regionbase;};\nstruct ID{uint32_t session_uid;};\nstruct ToolTip{ARegion*region=nullptr;};\nstruct bScreen{bool do_refresh=false,enabled=true;std::vector<ScrArea*> areabase;ID id{19};std::vector<ARegion*> regionbase;ToolTip*tool_tip=nullptr;};\nstruct wmWindow{int winid=11,height=800;bScreen *screen;};\nint WM_window_native_pixel_x(const wmWindow*){return 600;}\nint WM_window_native_pixel_y(const wmWindow *w){return w->height;}\nfloat UI_SCALE_FAC=1;\nstruct UndoStack{uint64_t ipad_lifetime_id=23,ipad_mutation_generation=31;};\nstruct wmOperatorType{uint64_t ipad_lifetime_id=37;};\nstruct wmOperator{wmOperatorType *type;uint64_t lifetime=41;};\nstruct WMRuntime{UndoStack *undo_stack;std::vector<wmOperator*> operators{};};\nstd::vector<wmOperatorType*> registered_types;\nconst std::vector<wmOperatorType*> &WM_operatortypes_registered_get(){return registered_types;}\nuint64_t WM_operator_touch_lifetime_id(const wmOperator *op){return op->lifetime;}\nstruct wmWindowManager{std::vector<wmWindow*> windows;WMRuntime *runtime;ID id{501};};\nstruct bToolRef{char idname[64]="builtin.move";};\nstruct bContext{wmWindowManager *wm;wmWindow *win;ScrArea *area=nullptr;ARegion *region=nullptr;ARegion *origin=nullptr;bToolRef tool;bool valid=true;uint64_t scene=101,object=201,mode=0;};\nwmWindowManager *CTX_wm_manager(bContext *C){return C->wm;}\nwmOperator *WM_operator_last_redo(const bContext *C){return C->wm->runtime->operators.empty()?nullptr:C->wm->runtime->operators.back();}\nwmWindow *CTX_wm_window(bContext *C){return C->win;}\nuintptr_t main_address=1;\nvoid *CTX_data_main(bContext*){return reinterpret_cast<void*>(main_address);}\nScrArea *CTX_wm_area(bContext *C){return C->area;}\nARegion *CTX_wm_region(bContext *C){return C->region;}\nvoid CTX_wm_area_set(bContext *C,ScrArea *a){C->area=a;C->region=nullptr;}\nvoid CTX_wm_region_set(bContext *C,ARegion *r){C->region=r;}\nbScreen *WM_window_get_active_screen(const wmWindow *w){return w->screen;}\nbool ED_ipad_panels_enabled(const bScreen *s){return s->enabled;}\nbool ED_ipad_panels_area_visible(const ScrArea *a){return a->visible;}\nARegion *UI_ipad_corner_hud_window(bContext *C,ScrArea *a,ARegion*){return C->area==a?C->origin:nullptr;}\nbool UI_ipad_context_capture(bContext *C,uint64_t *v){if(!C->valid)return false;\n uint64_t values[13]={1,uint64_t(uintptr_t(C->win)),uint64_t(uintptr_t(C->win->screen)),uint64_t(uintptr_t(C->area)),uint64_t(uintptr_t(C->region)),19,C->scene,C->object,301,C->mode,401,uint64_t(C->win->winid),501};\n std::copy(values,values+13,v);return true;}\nbToolRef *WM_toolsystem_ref_from_context(bContext *C){return &C->tool;}\nint redraws=0;\nvoid ED_region_tag_redraw(ARegion*){++redraws;}\nstruct Rect {int xmin=0,ymin=0,xmax=0,ymax=0;bool empty()const{return xmax<=xmin||ymax<=ymin;}};\nstruct Model {ScrArea *main=nullptr;Rect bounds;struct {Rect tools_panel,side_panel,bottom_panel,canvas;} layout;};\nstruct Button {Rect rect;};Model hud_model;std::vector<Button> hud_buttons;\nARegion*BKE_area_find_region_type(ScrArea*a,int kind){for(auto*r:a->regionbase)if(r->regiontype==kind)return r;return nullptr;}\nconst std::vector<Button>&buttons(const Model&,bScreen*){return hud_buttons;}\nstd::unordered_map<ARegion*,std::unordered_set<std::string>> native_blocks;\nstd::vector<std::string> freed_blocks;\nstd::function<void(bContext*,ARegion*)> onfree;\nvoid UI_block_discard_named_rebuild(bContext *C,ARegion *hud,const char *name){\n auto found=native_blocks.find(hud);if(found==native_blocks.end()||!found->second.erase(name))return;\n freed_blocks.push_back(name);auto callback=onfree;if(callback)callback(C,hud);\n}\nnamespace blender {using float4=std::array<float,4>;namespace gpu{struct Texture{};struct Shader{};struct Batch{};}}\nconstexpr float GLA_PIXEL_OFS=0.375f;\nconstexpr int GPU_BLEND_ALPHA_PREMULT=1,GPU_BLEND_NONE=0,GPU_SHADER_2D_IMAGE_RECT_COLOR=1,GPU_UNIFORM_COLOR=1;\nblender::gpu::Texture texture;blender::gpu::Shader shader;blender::gpu::Batch batch;int gpu_draws=0;\nfloat ED_region_blend_alpha(ARegion *r){return r->alpha;}\nvoid GPU_blend(int){}\nblender::gpu::Texture *wm_draw_region_texture(ARegion*,int){return &texture;}\nblender::gpu::Shader *GPU_shader_get_builtin_shader(int){return &shader;}\nvoid GPU_shader_bind(blender::gpu::Shader*){}\nint GPU_shader_get_builtin_uniform(blender::gpu::Shader*,int){return 1;}\nint GPU_shader_get_uniform(blender::gpu::Shader*,const char*){return 1;}\nint GPU_shader_get_sampler_binding(blender::gpu::Shader*,const char*){return 1;}\nvoid GPU_texture_bind(blender::gpu::Texture*,int){}\nvoid GPU_shader_uniform_float_ex(blender::gpu::Shader*,int,int,int,const float*){}\nvoid GPU_shader_uniform_float_ex(blender::gpu::Shader*,int,int,int,blender::float4){}\nblender::gpu::Batch *GPU_batch_preset_quad(){return &batch;}\nvoid GPU_batch_set_shader(blender::gpu::Batch*,blender::gpu::Shader*){}\nvoid GPU_batch_draw(blender::gpu::Batch*){++gpu_draws;}\nvoid GPU_texture_unbind(blender::gpu::Texture*){}\n'
patch=(REPO/'patches/blender-ipad.patch').read_text(encoding='utf-8');path='source/blender/editors/screen/ipad_workspace_panels.hh'
section=patch.split(f'diff --git a/{path} b/{path}\n',1)[1].split('diff --git ',1)[0]
HEADER=''.join(l[1:] for l in section.splitlines(True) if l.startswith('+') and not l.startswith('+++'))
w=w.replace('struct Panel{void *type=nullptr;bool active=false;};','').replace('std::vector<Panel*> panels{};','').replace('std::vector<ARegion*> regionbase;ToolTip*tool_tip=nullptr;','').replace('const std::vector<Button>&buttons(const Model&,bScreen*){return hud_buttons;}','')
w=w.replace('constexpr','inline constexpr')
w=w.replace('struct rcti {','namespace policy=blender::ed::ipad::panels;using policy::Rect;using policy::Edge;\nstruct rcti {',1)
w=w.replace('struct RegionRuntime{',r'''
struct GPUViewport{bool texture=true;};struct GPUOffscreen{bool texture=true;};struct wmDrawBuffer{GPUViewport*viewport=nullptr;GPUOffscreen*offscreen=nullptr;};
struct wmGizmo{int flag=0;float matrix_basis[4][4]{};float scale_basis=8;};struct wmGizmoGroupType{const char*idname="VIEW3D_GGT_navigate";};
struct wmGizmoGroup{wmGizmoGroupType*type=nullptr;std::vector<wmGizmo*>gizmos;struct{unsigned any=0;}hide;bool tag_remove=false;int init_flag=1;};
using ListBase=std::vector<wmGizmoGroup*>;struct wmGizmoMap{ListBase groups;};
struct PanelType{bool knife=false;};struct Panel{PanelType*type=nullptr;bool active=true;};
bool UI_panel_is_active(const Panel*p){return p->active;}bool UI_ipad_knife_hud_panel_type(const PanelType*p){return p&&p->knife;}
struct RegionRuntime{''')
w=w.replace('void *draw_buffer=reinterpret_cast<void*>(7);','wmDrawBuffer*draw_buffer=nullptr;wmGizmoMap*gizmo_map=nullptr;')
w=w.replace('bool visible=true,ipad_canvas=false;', 'bool visible=true,ipad_canvas=false,ipad_floating=false;')
w=w.replace('struct wmWindow{', 'struct wmWindow;struct WindowDrawCB{WindowDrawCB*next=nullptr,*prev=nullptr;void(*draw)(wmWindow*,void*)=nullptr;void*customdata=nullptr;};struct EventState{int xy[2]{};};struct wmWindow{').replace('bScreen *screen;};','bScreen *screen;EventState*eventstate=nullptr;struct{void*first=nullptr;void*last=nullptr;}drawcalls{};};')
w=w.replace('struct ARegion{','struct View3D{int gizmo_flag=0;};\nstruct ARegion{std::vector<Panel*>panels;')
w=w.replace('struct AreaRuntime{int ipad_layer=1;};','struct AreaRuntime{int ipad_layer=1;rcti ipad_navigation_rect{},ipad_pin_rect{},ipad_rect{};};')
w=w.replace('struct ScrArea{int spacetype=SPACE_VIEW3D;','struct ScrArea{int flag=0;rcti totrct{};struct{void*first=nullptr;}spacedata;int spacetype=SPACE_VIEW3D;')
w=w.replace('struct bScreen{','struct Vertex{struct{int x=0,y=0;}vec;};struct ScrEdge{Vertex*v1;Vertex*v2;};struct wmTooltipState{ARegion*region=nullptr;};\nstruct bScreen{std::vector<ARegion*>regionbase;std::vector<ScrEdge*>edgebase;wmTooltipState*tool_tip=nullptr;int ipad_panel_page[2]{};')
w=w.replace('struct bContext{','int providers=0,redo_reads=0;struct Main{};Main*G_MAIN=reinterpret_cast<Main*>(1);\nstruct bContext{')
w=w.replace('CTX_wm_manager(bContext *C)','CTX_wm_manager(const bContext *C)').replace('CTX_wm_window(bContext *C)','CTX_wm_window(const bContext *C)').replace('CTX_wm_area(bContext *C)','CTX_wm_area(const bContext *C)')
w=w.replace('wmOperator *WM_operator_last_redo(const bContext *C){','wmOperator *WM_operator_last_redo(const bContext *C){++redo_reads;')
w=w.replace('void *CTX_data_main(bContext*){return reinterpret_cast<void*>(main_address);}','Main *CTX_data_main(bContext*){++providers;return reinterpret_cast<Main*>(main_address);}')
w=w.replace('bool UI_ipad_context_capture(bContext *C,uint64_t *v){','bool UI_ipad_context_capture(bContext *C,uint64_t *v){++providers;')
a=w.index('struct Rect {');b=w.index('ARegion*BKE_area_find_region_type',a);w=w[:a]+w[b:]
w=w.replace('blender::gpu::Texture *wm_draw_region_texture(ARegion*,int){return &texture;}','')
w+=r'''
template<class T,class...V>bool ELEM(const T&v,const V&...items){return ((v==items)||...);}
#define LISTBASE_FOREACH_MUTABLE(T,var,list) for(auto var=static_cast<T>((list)->first),var##_next=var?var->next:nullptr;var;var=var##_next,var##_next=var?var->next:nullptr)
#define STREQ(a,b) (std::strcmp((a),(b))==0)
inline constexpr int RGN_TYPE_HEADER=3,RGN_TYPE_TOOL_HEADER=4,RGN_TYPE_FOOTER=5;
inline constexpr int AREA_FLAG_REGION_SIZE_UPDATE=1,WM_GIZMO_HIDDEN=8,WM_GIZMOGROUP_INIT_SETUP=1;
inline constexpr int V3D_GIZMO_HIDE=1,V3D_GIZMO_HIDE_NAVIGATE=2,USER_SHOW_GIZMO_NAVIGATE=1,USER_MINI_AXIS_TYPE_GIZMO=1,USER_APP_LOCK_EDGE_RESIZE=1;
struct User{int uiflag=1,mini_axis_type=0,app_flag=1;}U;
struct uiFontStyle{int uifont_id=1;};struct uiStyle{uiFontStyle widget;};uiStyle style;
const uiStyle*UI_style_get_dpi(){return &style;}void UI_fontstyle_set(const uiFontStyle*){}float BLF_width(int,const char*,size_t n){return float(n*8);}
struct NativeSeamControl{policy::WorkingSeam seam;};
'''
w+=function(S,'struct Tab {')+';'+function(S,'struct Model {')+';'
w+='inline constexpr int tools_id=1000000;\n'+function(S,'static rcti to_rect(')+function(S,'static bool contains(')+function(S,'static const Tab *find_tab(')
w+='enum class Action { Tab, ToolHeader, Previous, Next, Resize, Lock, Seam };\n'+function(S,'struct Button {')+';'
w+=function(S,'bool ED_ipad_panels_native_pin(')+function(S,'static std::vector<Button> buttons(')
owner=function(WMH,'struct wmIPadKnifeOwner {')+';';owner=owner.replace('WM_IPAD_KNIFE_OWNER_VALUES','23')
w+=owner+r'''
Model hud_model;Model make_model(bContext*,wmWindow*){return hud_model;}
std::vector<Rect>boxes;void draw_box(const Rect&r,const char*,bool,bool=false){boxes.push_back(r);}
inline constexpr int GPU_BLEND_ALPHA=2;
inline constexpr int TH_TEXT=1,TH_TAB_ACTIVE=2,TH_TAB_INACTIVE=3,UI_CNR_ALL=15,ICON_PINNED=1,ICON_UNPINNED=2;
void UI_GetThemeColor4fv(int,float c[4]){std::fill(c,c+4,1.0f);}void UI_draw_roundbox_4fv(const rctf*,bool,float,const float*){}
void UI_draw_roundbox_corner_set(int){}void UI_icon_draw(float,float,int){}void WM_event_add_mousemove(wmWindow*){}
int opaque_draws=0;void opaque_window_draw(wmWindow*,void*){++opaque_draws;}void self_removing_window_draw(wmWindow*w,void*){++opaque_draws;w->drawcalls.first=nullptr;w->drawcalls.last=nullptr;}
wmIPadKnifeOwner knife;bool knife_present=true,knife_blocked=false,geometry_ready=true;ARegion*knife_region=nullptr;
ScrArea*geometry_area=nullptr;bool UI_ipad_knife_hud_geometry_ready(const bContext*C,const ARegion*){return geometry_ready&&CTX_wm_area(C)==geometry_area;}
bool WM_ipad_knife_owner_present(const bContext*,wmWindow*,ScrArea*,wmIPadKnifeOwner&out){out=knife_present?knife:wmIPadKnifeOwner{};return out.valid();}
bool WM_ipad_knife_owner_capture(const bContext*C,wmWindow*w,ScrArea*a,wmIPadKnifeOwner&out){if(knife_blocked){out={};return false;}return WM_ipad_knife_owner_present(C,w,a,out);}
ARegion*WM_ipad_knife_owner_region(const bContext*,wmWindow*,const wmIPadKnifeOwner&o,bool include_blocked=false){return o==knife&&knife_present&&(!knife_blocked||include_blocked)?knife_region:nullptr;}
ARegion*popup=nullptr;ARegion*CTX_wm_region_popup(const bContext*){return popup;}bScreen*CTX_wm_screen(const bContext*C){return C->win->screen;}
bool BLI_rcti_isect_pt_v(const rcti*r,const int xy[2]){return xy[0]>=r->xmin&&xy[0]<=r->xmax&&xy[1]>=r->ymin&&xy[1]<=r->ymax;}
int blits=0;void GPU_viewport_draw_to_screen(GPUViewport*,int,const rcti*){++blits;}void GPU_offscreen_draw_to_screen(GPUOffscreen*,int,int){++blits;}
blender::gpu::Texture*GPU_viewport_color_texture(GPUViewport*v,int){return v&&v->texture?&texture:nullptr;}
blender::gpu::Texture*GPU_offscreen_color_texture(GPUOffscreen*v){return v&&v->texture?&texture:nullptr;}
int paint_frame=0;template<class...T>void wm_ipad_finger_paint_record(T...){ }
'''
# Exact pinned native getter; no undeclared ignored-cache dependency in CI.
# d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e:
# source/blender/windowmanager/gizmo/intern/wm_gizmo_map.cc:237; GPL-2.0-or-later.
MAP_BODY='const ListBase *WM_gizmomap_group_list(wmGizmoMap *gzmap)\n{\n  return &gzmap->groups;\n}'
MAP_BODY_SHA256='bc01a02e1b4b204548ca0803c4dca17513f8a02df69b257ed68fe325cbc9e289'
assert hashlib.sha256(MAP_BODY.encode()).hexdigest()==MAP_BODY_SHA256

CHROME=function(S,'struct IPadHUDChrome {')+';\nstatic std::unordered_map<uintptr_t, IPadHUDChrome> ipad_hud_chrome;\n'+function(S,'static void ipad_hud_chrome_capture(')
HIER=S[S.index('struct IPadKnifeHierarchyRegion {'):S.index('\nstatic void tag_layout(',S.index('struct IPadKnifeHierarchyRegion {'))]
RECEIPTS=S[S.index('namespace {\nenum class IPadHUDKind'):S.index('\nvoid ED_ipad_editing_canvas_parts',S.index('namespace {\nenum class IPadHUDKind'))]
LAYER=function(D,'static void wm_draw_window_area_layer(')
def block(text,signature):
 start=text.index(signature);begin=text.index('{',start);depth=0
 for end in range(begin,len(text)):
  depth+=(text[end]=='{')-(text[end]=='}')
  if not depth:return text[start:end+1]
 raise AssertionError('Unbalanced actual source block')
NOBRANCH=block(LAYER,'      if (region->overlap == false)');OVERBRANCH=block(LAYER,'      if (region->overlap)')
assert 'ED_ipad_knife_hierarchy_region_presented' in NOBRANCH and 'ED_ipad_knife_hierarchy_region_presented' in OVERBRANCH
NAV_BODY=function(NAV,'static void WIDGETGROUP_navigate_draw_prepare(')
NAV_TAIL=block(NAV_BODY,'  if (ED_ipad_panels_enabled(CTX_wm_screen(C)) && area->runtime.ipad_layer == 1)')
PREFIX='#define WITH_APPLE_CROSSPLATFORM\n#include "ipad_workspace_panels.hh"\n#include <cmath>\n#include <climits>\n'+w+MAP_BODY+CHROME+HIER+function(S,'bool ED_ipad_hud_exposed_rect(')
PREFIX+='struct IPadHUDPresentedRect{int xmin,ymin,xmax,ymax;uint64_t generation;};'+RECEIPTS+function(S,'void ED_ipad_panels_draw(')
PREFIX+=function(D,'static bool wm_draw_region_blit(')+function(D,'blender::gpu::Texture *wm_draw_region_texture(')+function(D,'static bool wm_draw_region_blend_receipt(')
PREFIX+='void native_composite(bContext*C,wmWindow*win,ScrArea*area,ARegion*region){int view=0;\n'+NOBRANCH+OVERBRANCH+'\n}\n'
ONSCREEN=function(D,'static void wm_draw_window_onscreen(')
callback_assign=ONSCREEN.index('  paint_frame.opaque_window_callback = win->drawcalls.first != nullptr;')
callback_start=ONSCREEN.rfind('#ifdef WITH_APPLE_CROSSPLATFORM',0,callback_assign)
callback_end=ONSCREEN.index('  wm_draw_callbacks(win);',callback_assign)+len('  wm_draw_callbacks(win);')
CALLBACK_PRODUCER=ONSCREEN[callback_start:callback_end]
assert CALLBACK_PRODUCER.index('ED_ipad_knife_hierarchy_window_callbacks')<CALLBACK_PRODUCER.index('wm_draw_callbacks(win);')
PREFIX+=function(D,'static void wm_draw_callbacks(')
PREFIX+='void native_window_callbacks(bContext*C,wmWindow*win){struct{bool opaque_window_callback=false;}paint_frame;\n'+CALLBACK_PRODUCER+'\n}\n'

PREFIX+='struct NativeNav{std::vector<wmGizmo*>gz_array;};void native_nav_footprint(const bContext*C,ARegion*region,NativeNav*navgroup){ScrArea*area=CTX_wm_area(C);\n'+NAV_TAIL+'\n}\n'
SETUP=r'''
struct Fixture{
 GPUViewport viewport;GPUOffscreen offscreen;wmDrawBuffer cb{&viewport,nullptr},hb{nullptr,&offscreen};
 RegionRuntime cr,hr;ARegion canvas,hud;View3D v3d;ScrArea area;bScreen screen;wmWindow win;
 UndoStack undo;WMRuntime runtime{&undo};wmWindowManager wm;bContext C;
 PanelType kt{true};Panel kp{&kt,true};uint64_t generation=0;
 Fixture():win{11,800,&screen},wm{{&win},&runtime},C{&wm,&win,&area,&hud,&canvas,{}}{
  cr.ipad_canvas=true;cr.ipad_canvas_rect={56,539,6,679};cr.draw_buffer=&cb;
  canvas.regiontype=RGN_TYPE_WINDOW;canvas.runtime=&cr;canvas.winrct={0,599,0,799};canvas.overlap=false;
  hr.draw_buffer=&hb;hud.runtime=&hr;hud.winrct={60,259,20,107};hud.panels={&kp};hud.flag=RGN_FLAG_HIDDEN_BY_USER;
  area.regionbase={&canvas,&hud};area.totrct={0,599,0,799};area.spacedata.first=&v3d;screen.areabase={&area};
  geometry_area=&area;knife.values.fill(1);knife_region=&canvas;knife_present=true;knife_blocked=false;geometry_ready=true;
  hud_model={};hud_model.main=&area;hud_model.areas={&area};hud_model.bounds={0,0,600,800};
  hud_model.layout.canvas={56,6,540,680};hud_model.layout.left_rail={0,0,56,800};hud_model.layout.side_rail={540,0,600,800};
  hud_model.tabs.push_back({tools_id,Edge::Tools,"Tools",&area,0,{}});
 }
 void layout(){ED_ipad_hud_layout_begin(&C,&win,&area,&hud);ED_ipad_hud_layout_end(&C,&win,&area,&hud);ED_ipad_hud_draw_end(&C,&win,&area,&hud);}
 void begin(){layout();ED_ipad_hud_compositor_begin(&C,&win);}
 void draw(){native_window_callbacks(&C,&win);ED_ipad_panels_draw(&C,&win);}
 void finish(){std::vector<IPadHUDPresentedRect>rects;ED_ipad_hud_compositor_end(&C,&win,rects);assert(rects.size()==1);generation=rects[0].generation;}
 void frame(){begin();native_composite(&C,&win,&area,&canvas);native_composite(&C,&win,&area,&hud);draw();finish();}
 bool hit(int x,int y,bool valid){uint64_t gen=0;wmIPadKnifeOwner owner;ARegion*r=nullptr;int xy[2]={x,y};bool h=UI_ipad_knife_hud_hit(&C,&win,xy,gen,owner,&r);if(h){assert(gen==generation);assert(owner.valid()==valid);assert((r!=nullptr)==valid);}return h;}
 bool owner(){wmIPadKnifeOwner owner;return UI_ipad_knife_hud_owner(&C,&win,generation,owner,nullptr);}
};
'''
CASES={
'actual_draw_publish_and_cached_composites':r'''
 Fixture f;f.frame();assert(f.owner()&&f.hit(80,40,true));assert(!boxes.empty());int n=providers,r=redo_reads;
 for(int i=0;i<1000;++i){uint64_t gen=f.generation;f.frame();assert(f.generation==gen&&f.owner());}
 assert(providers==n&&redo_reads==r);assert(blits==1001&&gpu_draws==1001);
 assert(UI_ipad_knife_hud_generation(&f.C,&f.win,f.generation));assert(!UI_ipad_knife_hud_generation(&f.C,&f.win,f.generation+1));
''',
'pending_no_draw_and_missing_buffer_are_inert':r'''
 Fixture f;f.frame();assert(f.owner());f.begin();assert(f.hit(80,40,false));native_composite(&f.C,&f.win,&f.area,&f.canvas);native_composite(&f.C,&f.win,&f.area,&f.hud);f.finish();assert(f.hit(80,40,false));
 f.frame();f.cr.draw_buffer=nullptr;f.frame();assert(!f.owner()&&f.hit(80,40,false));f.cr.draw_buffer=&f.cb;f.frame();assert(f.owner());
 f.begin();f.draw();native_composite(&f.C,&f.win,&f.area,&f.hud);f.finish();assert(f.hit(80,40,false));
''',
'actual_partial_coverage_and_split_union':r'''
 Fixture f;RegionRuntime tr;ARegion header;tr.draw_buffer=&f.hb;header.runtime=&tr;header.regiontype=RGN_TYPE_HEADER;header.winrct={300,399,300,399};f.area.regionbase.push_back(&header);
 auto part=[&](bool second){f.begin();native_composite(&f.C,&f.win,&f.area,&f.canvas);f.draw();native_composite(&f.C,&f.win,&f.area,&f.hud);ED_ipad_knife_hierarchy_region_presented(&f.C,&f.win,&f.area,&header,{300,350,300,400});if(second)ED_ipad_knife_hierarchy_region_presented(&f.C,&f.win,&f.area,&header,{350,400,300,400});f.finish();};
 part(false);assert(f.hit(80,40,false));part(true);assert(f.owner());
''',
'whole_rails_and_completed_native_draw':r'''
 Fixture f;f.hud.winrct={8,207,20,107};f.frame();assert(!f.hit(10,40,false));
 f.hud.winrct={60,259,20,107};f.frame();assert(f.hit(80,40,true));
 hud_model.layout.left_rail={};f.hud.winrct={8,207,20,107};f.layout();assert(!f.hit(10,40,false));
''',
'fresh_higher_native_and_pending_geometry':r'''
 Fixture f;f.frame();RegionRuntime rt;ARegion inspector;inspector.runtime=&rt;inspector.regiontype=RGN_TYPE_HEADER;inspector.winrct={70,150,30,80};f.area.regionbase.push_back(&inspector);
 assert(!f.hit(80,40,false));f.area.regionbase.pop_back();assert(f.hit(80,40,true));
 f.screen.do_refresh=true;assert(f.hit(80,40,false));f.screen.do_refresh=false;f.area.flag=AREA_FLAG_REGION_SIZE_UPDATE;assert(f.hit(80,40,false));
''',
'quad_actual_navigation_ignores_overwritten_area_cache':r'''
 Fixture f;wmGizmoGroupType type;wmGizmo g1,g2;g1.matrix_basis[3][0]=80;g1.matrix_basis[3][1]=40;g2.matrix_basis[3][0]=80;g2.matrix_basis[3][1]=40;
 wmGizmoGroup a,b;a.type=b.type=&type;a.gizmos={&g1};b.gizmos={&g2};wmGizmoMap ma{{&a}},mb{{&b}};f.cr.gizmo_map=&ma;
 RegionRuntime qr;qr.ipad_canvas=true;qr.ipad_canvas_rect={0,199,0,199};qr.draw_buffer=&f.cb;qr.gizmo_map=&mb;ARegion quad;quad.regiontype=RGN_TYPE_WINDOW;quad.runtime=&qr;quad.winrct={300,499,0,199};quad.overlap=false;f.area.regionbase.push_back(&quad);
 NativeNav na{{&g1}},nb{{&g2}};native_nav_footprint(&f.C,&f.canvas,&na);native_nav_footprint(&f.C,&quad,&nb);assert(f.area.runtime.ipad_navigation_rect.xmin>300);
 f.begin();native_composite(&f.C,&f.win,&f.area,&f.canvas);native_composite(&f.C,&f.win,&f.area,&quad);f.draw();native_composite(&f.C,&f.win,&f.area,&f.hud);f.finish();assert(!f.hit(80,40,false));
 g1.flag=WM_GIZMO_HIDDEN;f.frame();assert(f.hit(80,40,false));
''',
'history_popup_tooltip_geometry_and_retirement':r'''
 Fixture f;f.frame();++knife.values[22];assert(f.hit(80,40,false));f.frame();RegionRuntime rt;ARegion menu;menu.runtime=&rt;f.screen.regionbase={&menu};assert(!f.hit(80,40,false));
 wmTooltipState tip{&menu};f.screen.tool_tip=&tip;assert(f.hit(80,40,true));f.screen.tool_tip=nullptr;f.screen.regionbase.clear();f.hud.winrct.xmin+=1;assert(f.hit(80,40,false));
 native_blocks[&f.hud]={"VIEW3D_PT_ipad_knife_actions","OPERATOR_PT_redo"};int n=providers;ED_ipad_hud_input_retire(&f.C,&f.win,f.generation);assert(providers==n&&freed_blocks.back()=="VIEW3D_PT_ipad_knife_actions"&&native_blocks[&f.hud].count("OPERATOR_PT_redo"));
''',
'opaque_window_draw_callback_refuses_completed_and_later_acquisition':r'''
 Fixture f;WindowDrawCB opaque_callback;opaque_callback.draw=opaque_window_draw;f.win.drawcalls.first=&opaque_callback;
 f.frame();assert(!f.owner()&&f.hit(80,40,false));
 f.win.drawcalls.first=nullptr;assert(!f.owner()&&f.hit(80,40,false));
 f.frame();assert(f.owner()&&f.hit(80,40,true));
 // A callback appearing after a matched completed frame invalidates fresh
 // action admission immediately, before that opaque callback is ever invoked.
 f.win.drawcalls.first=&opaque_callback;assert(!f.owner()&&f.hit(80,40,false));
 f.frame();assert(!f.owner()&&f.hit(80,40,false));
 f.win.drawcalls.first=nullptr;f.frame();assert(f.owner());
''',
'self_removing_actual_native_window_draw_callback_keeps_pass_inert':r'''
 Fixture f;WindowDrawCB callback;callback.draw=self_removing_window_draw;
 f.win.drawcalls.first=&callback;f.frame();assert(opaque_draws==1&&!f.win.drawcalls.first);
 assert(!f.owner()&&f.hit(80,40,false));
 f.frame();assert(opaque_draws==1&&f.owner()&&f.hit(80,40,true));
''',
'capture_from_other_context_restores_parent_then_child':r'''
 Fixture f;ScrArea other;ARegion old;old.runtime=&f.hr;f.C.area=&other;f.C.region=&old;f.layout();assert(f.C.area==&other&&f.C.region==&old);f.C.area=nullptr;f.C.region=&old;f.layout();assert(!f.C.area&&f.C.region==&old);geometry_ready=false;f.layout();assert(!f.C.area&&f.C.region==&old);
''',
'blocked_and_unmeasured_never_admit_or_poll':r'''
 Fixture f;f.frame();int n=providers,r=redo_reads;knife_blocked=true;f.frame();assert(f.hit(80,40,false)&&providers==n&&redo_reads==r);knife_blocked=false;f.frame();assert(f.owner());geometry_ready=false;f.frame();assert(f.hit(80,40,false)&&providers==n&&redo_reads==r);
'''
}
class KnifeHUDReceipts(unittest.TestCase):
 def run_case(self,name):
  out=OUT/name;out.mkdir(parents=True,exist_ok=True);(out/'ipad_workspace_panels.hh').write_text(HEADER,encoding='utf-8');cpp=out/'test.cc';cpp.write_text(PREFIX+SETUP+'\nint main(){\n'+CASES[name]+'\n}\n',encoding='utf-8')
  compiler=shutil.which('clang++') or shutil.which('g++') or next((str(p) for p in [Path('C:/Program Files/LLVM/bin/clang++.exe')] if p.is_file()),None)
  self.assertIsNotNone(compiler,'C++17 compiler unavailable; fixture was not executed')
  cmd=[compiler,'-std=c++17','-Wall','-Wextra','-Werror','-pedantic','-O'+OPT.opt_level,str(cpp),'-o',str(out/'test.exe')]
  c=subprocess.run(cmd,text=True,capture_output=True);(out/'compile.log').write_text(c.stdout+c.stderr,encoding='utf-8');self.assertEqual(c.returncode,0,c.stdout+c.stderr)
  e=subprocess.run([str(out/'test.exe')],text=True,capture_output=True);(out/'execute.log').write_text(e.stdout+e.stderr,encoding='utf-8');self.assertEqual(e.returncode,0,e.stdout+e.stderr)
for name in CASES:setattr(KnifeHUDReceipts,'test_'+name,lambda self,name=name:self.run_case(name))
if __name__=='__main__':
 result=unittest.TextTestRunner(verbosity=2).run(unittest.defaultTestLoader.loadTestsFromTestCase(KnifeHUDReceipts))
 report={'status':'PASS' if result.wasSuccessful() else 'FAILED','tests':result.testsRun,'failures':len(result.failures),'errors':len(result.errors),'source_sha256':hashlib.sha256(S.encode()).hexdigest(),'draw_sha256':hashlib.sha256(D.encode()).hexdigest(),'opt_level':OPT.opt_level,'boundary_model_sha256':BOUNDARY_MODEL_SHA256,'pinned_native_getter_sha256':MAP_BODY_SHA256,'limits':__doc__,'output':str(OUT)}
 (OUT/'summary.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8');print(json.dumps(report,indent=2));sys.exit(not result.wasSuccessful())
