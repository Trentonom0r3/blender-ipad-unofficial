"""Execute live Knife WM owner/binding, value queue and fresh native action dispatch.

Use --source-root for an uncommitted materialized candidate; otherwise reconstruct
patch+pin. Intrusive lists, registries, initial modal setup, allocation, BKE origin,
UI active-button lookup and operator completion are explicit model boundaries.
No device, geometry, history or complete WM scheduler proof is claimed.
"""
from pathlib import Path
import argparse, hashlib, importlib.util, json, os, shutil, subprocess, sys, tempfile, unittest

DEFAULT_REPO = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(add_help=False)
parser.add_argument('--repo', type=Path, default=DEFAULT_REPO)
parser.add_argument('--source-root', type=Path)
parser.add_argument('--cache-dir', type=Path)
parser.add_argument('--output-dir', type=Path)
parser.add_argument('--opt-level', choices=('0', '2'), default='0')
OPTIONS, UNITTEST_ARGS = parser.parse_known_args()
REPO = OPTIONS.repo.resolve()
OUT = OPTIONS.output_dir.resolve() if OPTIONS.output_dir else Path(tempfile.mkdtemp(prefix='pencil-knife-owner-'))
OUT.mkdir(parents=True, exist_ok=True)
sys.path.insert(0, str(REPO / 'build'))
def helper(name):
    spec = importlib.util.spec_from_file_location(name, REPO/'build'/(name+'.py'))
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module
preflight = helper('preflight')
function = helper('test_compact_shelf').function
PIN = preflight.pinned_commit(REPO)
CACHE = OPTIONS.cache_dir.resolve() if OPTIONS.cache_dir else REPO/'.cache/preflight'
PATHS = ('source/blender/windowmanager/intern/wm_event_system.cc',
         'source/blender/windowmanager/WM_ipad_knife.hh',
         'source/blender/editors/interface/interface_handlers.cc')
if OPTIONS.source_root:
    SOURCES = {p:(OPTIONS.source_root/p).read_text(encoding='utf-8') for p in PATHS}
else:
    touch = helper('test_touch_extrude')
    for path in PATHS:
        if f'diff --git a/{path} b/{path}\n' not in touch.PATCH_TEXT:
            raise RuntimeError('Knife candidate missing from current overlay: '+path)
        preflight.get_source(PIN, path, CACHE, False) if path != PATHS[1] else None
    touch.PIN_ROOT = CACHE/PIN
    touch.changed_source.cache_clear()
    SOURCES = {p:touch.changed_source(p) for p in PATHS}
WM, HEADER, UI = (SOURCES[p] for p in PATHS)
def block(text, start):
    opening = text.index('{', start)
    depth = 0
    for end in range(opening, len(text)):
        depth += (text[end] == '{') - (text[end] == '}')
        if not depth:
            return text[start:end+1]
    raise AssertionError('Unclosed native source block')
OWNER_SIGNATURES = ('static wmWindowManager *wm_ipad_knife_window_manager(',
 'static bool wm_ipad_knife_owner_read(', 'static void wm_ipad_knife_modal_handler_bind(',
 'bool WM_ipad_knife_owner_capture(', 'bool WM_ipad_knife_owner_present(', 'ARegion *WM_ipad_knife_owner_region(',
 'bool WM_ipad_knife_hud_scope_active(', 'bool WM_ipad_knife_action_queue(',
 'static bool wm_ipad_knife_request_resolve(')
BODIES = {s:function(WM, s) for s in OWNER_SIGNATURES}
UI_PREDICATE = function(UI, 'bool UI_ipad_knife_hud_ui_handler(')
OWNER_ENUM = WM[WM.index('enum eIPadKnifeOwnerIndex {'):WM.index('static wmWindowManager *wm_ipad_knife_window_manager(')]
REQUEST_TYPES = WM[WM.index('struct wmIPadKnifeRequest {'):WM.index('bool WM_ipad_knife_hud_scope_active(')]
CALL = function(WM, 'static eHandlerActionFlag wm_handler_operator_call(')
CALL_PREFIX = CALL[CALL.index('{')+1:CALL.index('  /* Derived, modal or blocking operator. */')]
CONTEXT_BRANCH = block(CALL, CALL.index('      if (ipad_knife_action)'))
ACTION_BRANCH = block(CALL, CALL.index('      else if (ipad_knife_action)'))
BOOKKEEPING = CALL[CALL.index('      const intptr_t undo_id_prev'):CALL.index('      if (ipad_pencil_paint_interrupt)')]
AFTER_ACTION = CALL[CALL.index('      if (ot->flag & OPTYPE_UNDO && CTX_wm_manager(C) == wm)'):CALL.index('      /* When the window changes')]
WINDOW_STATUS = block(CALL, CALL.index('      if (CTX_wm_window(C) == win)'))
NATIVE_SLICES = {'original_request_prefix':CALL_PREFIX, 'original_context_branch':CONTEXT_BRANCH,
 'original_action_branch':ACTION_BRANCH,'original_undo_bookkeeping':BOOKKEEPING,
 'original_undo_restore':AFTER_ACTION,'original_window_status_cleanup':WINDOW_STATUS}
HEADER_BODY = HEADER[HEADER.index('struct ARegion;'):]

PRELUDE = r"""
#include <algorithm>
#include <array>
#include <cassert>
#include <cstdint>
#include <cstring>
#include <iostream>
#include <map>
#include <set>
#include <string>
#include <vector>
#define WITH_APPLE_CROSSPLATFORM 1
#define LISTBASE_FOREACH(T,v,l) for(T v=static_cast<T>((l)->first);v;v=reinterpret_cast<T>(reinterpret_cast<Link*>(v)->next))
#define BLI_assert(x) assert(x)
#define OPERATOR_RETVAL_CHECK(x) assert((x)&(OPERATOR_CANCELLED|OPERATOR_FINISHED|OPERATOR_RUNNING_MODAL|OPERATOR_PASS_THROUGH))
template<class T,class...U>bool ELEM(const T&x,const U&...v){return((x==v)||...);}
struct Link{void*next=nullptr,*prev=nullptr;};
struct ListBase{void*first=nullptr,*last=nullptr;};
static void BLI_addtail(ListBase*l,void*p){auto*n=(Link*)p;n->next=nullptr;n->prev=l->last;if(l->last)((Link*)l->last)->next=p;else l->first=p;l->last=p;}
static int BLI_findindex(const ListBase*l,const void*p){int i=0;for(auto*n=(Link*)l->first;n;n=(Link*)n->next,++i)if(n==p)return i;return -1;}
static void BLI_remlink(ListBase*l,void*p){auto*n=(Link*)p;if(n->prev)((Link*)n->prev)->next=n->next;else l->first=n->next;if(n->next)((Link*)n->next)->prev=n->prev;else l->last=n->prev;n->next=n->prev=nullptr;}
static bool BLI_listbase_is_empty(const ListBase*l){return !l->first;}
constexpr int WM_HANDLER_TYPE_OP=1,WM_HANDLER_TYPE_UI=2,WM_HANDLER_DO_FREE=4,RGN_TYPE_WINDOW=5,RGN_TYPE_HUD=6,SPACE_VIEW3D=7,VIEW_LAYER_OUT_OF_SYNC=8,OB_MESH=9,OB_MODE_EDIT=16;
constexpr int IPAD_KNIFE_ACTION=100,EVT_DATA_IPAD_KNIFE_ACTION=101,KM_NOTHING=0;
constexpr int OPERATOR_PASS_THROUGH=1,OPERATOR_CANCELLED=2,OPERATOR_FINISHED=4,OPERATOR_RUNNING_MODAL=8,OPTYPE_UNDO=1,WM_HANDLER_BREAK=2,WM_HANDLER_HANDLED=4,NC_SPACE=1,ND_SPACE_INFO_REPORT=2;
using wmOperatorStatus=int;using eHandlerActionFlag=int;
struct ID{uint64_t session_uid=0;};
struct Mesh:Link{ID id;};
struct Object:Link{ID id;int type=OB_MESH,mode=OB_MODE_EDIT;void*data=nullptr;};
struct Base:Link{Object*object=nullptr;};
struct ViewLayer:Link{int flag=0;Base*basact=nullptr;ListBase object_bases;std::string name="Layer";};
struct Scene:Link{ID id;ListBase view_layers;};
struct ARegionRuntime{bool visible=true;};
struct uiBut;
struct ARegion:Link{int regiontype=RGN_TYPE_WINDOW;ARegionRuntime*runtime=nullptr;void*regiondata=nullptr;uiBut*active_button=nullptr;};
struct ScrArea:Link{int spacetype=SPACE_VIEW3D;ListBase regionbase,spacedata;};
struct bScreen:Link{ID id;ListBase areabase;};
struct wmWindowRuntime{};
struct wmWindow:Link{int winid=17;wmWindowRuntime*runtime=nullptr;ListBase modalhandlers;bScreen*screen=nullptr;Scene*scene=nullptr;char view_layer_name[64]="Layer";};
struct wmWindowManager:Link{ID id;ListBase windows;int op_undo_depth=0;};
struct Main{ListBase wm,screens,scenes,objects,meshes;};
struct bContext{wmWindowManager*wm=nullptr;wmWindow*win=nullptr;ScrArea*area=nullptr;ARegion*region=nullptr;};
struct ReportList{ListBase list;};
struct wmOperatorType{uint64_t ipad_lifetime_id=0;int flag=OPTYPE_UNDO;bool modalkeymap=true;};
struct wmOperator{wmOperatorType*type=nullptr;wmOperator*opm=nullptr;ReportList*reports=nullptr;};
struct wmEventHandler{void*next=nullptr,*prev=nullptr;int type=WM_HANDLER_TYPE_OP,flag=0;};
struct HandlerContext{wmWindow*win=nullptr;ScrArea*area=nullptr;ARegion*region=nullptr,*region_popup=nullptr;};
struct wmEventHandler_Op{wmEventHandler head;wmOperator*op=nullptr;HandlerContext context;bool is_fileselect=false;uint64_t ipad_knife_owner[23]{};};
using HandleFn=void(*)();
struct wmEventHandler_UI{wmEventHandler head;HandleFn handle_fn=nullptr,remove_fn=nullptr;void*user_data=nullptr;HandlerContext context;};
struct PanelType{bool knife=false;};struct Panel{PanelType*type=nullptr;};struct uiBlock{Panel*panel=nullptr;};struct uiBut{void*active=nullptr;uiBlock*block=nullptr;};
static void ui_handler_region_menu(){}static void foreign_ui(){}
static uiBut*ui_region_find_active_but(ARegion*r){return r->active_button;}
static bool UI_ipad_knife_hud_panel_type(const PanelType*t){return t&&t->knife;}
struct MeshKnifeModalOrigin{Scene*scene=nullptr;ViewLayer*view_layer=nullptr;Object*object=nullptr;ARegion*region=nullptr;void*v3d=nullptr,*rv3d=nullptr;};
struct wmEvent{int type=0,val=0,xy[2]{};int custom=0;void*customdata=nullptr;bool customdata_free=false;};
struct wmEvent_ModalMapStore{};
static Main*G_MAIN=nullptr;
static wmOperatorType*registered_type=nullptr;
static std::map<const wmOperator*,uint64_t>lifetimes;
static std::map<const wmOperator*,MeshKnifeModalOrigin>origins;
static uint64_t next_lifetime=400;
static int lifetime_allocations=0,provider_callbacks=0,native_calls=0,finished_calls=0,free_calls=0,handler_free_calls=0,request_allocations=0,request_frees=0,modalmap_calls=0,reports_calls=0,view_find_calls=0;
static bool inside_ui=false,mutate_window_on_action=false;
static wmOperator*called_op=nullptr;static bool called_confirm=false;
static int native_result=OPERATOR_FINISHED;
static std::vector<wmEvent>event_queue;
static std::set<void*>requests;
static std::vector<std::string>trace;
static wmWindowManager*CTX_wm_manager(const bContext*C){return C?C->wm:nullptr;}
static wmWindow*CTX_wm_window(const bContext*C){return C?C->win:nullptr;}
static ScrArea*CTX_wm_area(const bContext*C){return C?C->area:nullptr;}
static ARegion*CTX_wm_region(const bContext*C){return C?C->region:nullptr;}
static void CTX_wm_area_set(bContext*C,ScrArea*a){C->area=a;C->region=nullptr;trace.push_back("area");}
static void CTX_wm_region_set(bContext*C,ARegion*r){C->region=r;trace.push_back("region");}
static bScreen*WM_window_get_active_screen(wmWindow*w){return w?w->screen:nullptr;}
static Scene*WM_window_get_active_scene(wmWindow*w){return w?w->scene:nullptr;}
static ViewLayer*BKE_view_layer_find(Scene*s,const char*n){++view_find_calls;LISTBASE_FOREACH(ViewLayer*,v,&s->view_layers)if(v->name==n)return v;return nullptr;}
static ViewLayer*WM_window_get_active_view_layer(wmWindow*){++provider_callbacks;assert(false&&"Fallback-setting layer provider forbidden");return nullptr;}
static wmOperatorType*WM_operatortype_find(const char*n,bool){assert(std::string(n)=="MESH_OT_knife_tool");return registered_type;}
static bool WM_operator_touch_lifetime_matches(const wmOperator*op,uint64_t id){auto i=lifetimes.find(op);return id&&i!=lifetimes.end()&&i->second==id;}
static uint64_t WM_operator_touch_lifetime_id(wmOperator*op){auto i=lifetimes.find(op);if(i!=lifetimes.end())return i->second;++lifetime_allocations;return lifetimes[op]=++next_lifetime;}
static bool ED_mesh_knife_modal_type(wmOperatorType*t){return t==registered_type;}
static bool ED_mesh_knife_modal_origin(wmOperator*op,MeshKnifeModalOrigin&o){auto i=origins.find(op);if(i==origins.end())return false;o=i->second;return true;}
template<class T>T*MEM_new(const char*){auto*p=new T{};requests.insert(p);++request_allocations;return p;}
static void copy_v2_v2_int(int*a,const int*b){a[0]=b[0];a[1]=b[1];}
static void WM_event_add(wmWindow*w,const wmEvent*e){assert(w&&e&&e->customdata);assert(requests.count(e->customdata));event_queue.push_back(*e);trace.push_back("enqueue");}
static void wm_region_mouse_co(bContext*,wmEvent*){trace.push_back("mouse_co");}
static intptr_t wm_operator_undo_active_id(wmWindowManager*){return 10;}
static intptr_t wm_operator_register_active_id(wmWindowManager*){return 20;}
static wmOperatorStatus ED_mesh_knife_modal_action(bContext*C,wmOperator*op,wmEvent*,bool confirm){assert(!inside_ui);assert(C->wm->op_undo_depth==1);++native_calls;called_op=op;called_confirm=confirm;trace.push_back("native_action");if(mutate_window_on_action)C->win=nullptr;return native_result;}
static void wm_event_modalkeymap_end(wmEvent*,wmEvent_ModalMapStore*){++modalmap_calls;}
static void wm_operator_reports(bContext*,wmOperator*,int,bool){++reports_calls;}
static void WM_window_status_area_tag_redraw(wmWindow*){}
static void WM_event_add_notifier(bContext*,int,void*){}
static void WM_reports_from_reports_move(wmWindowManager*,ReportList*){}
static void wm_operator_finished(bContext*,wmOperator*op,bool,bool,bool,bool){++finished_calls;lifetimes.erase(op);origins.erase(op);trace.push_back("finished");}
static void WM_operator_free(wmOperator*op){++free_calls;lifetimes.erase(op);origins.erase(op);trace.push_back("free");}
static bool wm_event_always_pass(wmEvent*){return false;}
static void wm_gizmomaps_handled_modal_update(bContext*,wmEvent*,wmEventHandler_Op*){}
static void WM_cursor_grab_disable(wmWindow*,void*){}
static void wm_event_free_handler(wmEventHandler*){++handler_free_calls;trace.push_back("handler_free");}
"""

def translation_unit():
    owner = [BODIES[s] for s in OWNER_SIGNATURES[:6]]
    tail = [BODIES[s] for s in OWNER_SIGNATURES[6:]]
    adapter = r'''
static int dispatch_request(bContext*C,ListBase*handlers,wmEventHandler*handler_base,wmEvent*event){
__PREFIX__
assert(ipad_knife_action);
auto*handler=reinterpret_cast<wmEventHandler_Op*>(handler_base);
auto*op=handler->op;auto*ot=op->type;
auto*wm=CTX_wm_manager(C);auto*win=CTX_wm_window(C);
auto*area=CTX_wm_area(C);auto*region=CTX_wm_region(C);
__CONTEXT__
wmEvent_ModalMapStore event_backup;bool modalkeymap_started=false;
__BOOKKEEPING__
if(false){} __ACTION__
__AFTER_ACTION__
__WINDOW_STATUS__
return WM_HANDLER_BREAK|WM_HANDLER_HANDLED;
}
'''
    for token,key in [('__PREFIX__','original_request_prefix'),('__CONTEXT__','original_context_branch'),('__BOOKKEEPING__','original_undo_bookkeeping'),('__ACTION__','original_action_branch'),('__AFTER_ACTION__','original_undo_restore'),('__WINDOW_STATUS__','original_window_status_cleanup')]:
        adapter = adapter.replace(token,NATIVE_SLICES[key])
    return PRELUDE+HEADER_BODY+UI_PREDICATE+OWNER_ENUM+'\n'.join(owner)+REQUEST_TYPES+'\n'.join(tail)+adapter+TEST_MAIN

TEST_MAIN = r"""
static void release_request(wmEvent&e){if(e.customdata_free&&e.customdata){assert(requests.erase(e.customdata)==1);delete static_cast<wmIPadKnifeRequest*>(e.customdata);++request_frees;e.customdata=nullptr;e.customdata_free=false;}}
struct Fixture{
 Main main;wmWindowManager manager;wmWindow win;wmWindowRuntime winruntime;bScreen screen;ScrArea area;ARegion region,hud;ARegionRuntime runtime,hudruntime;Scene scene;ViewLayer layer;Base base;Object object;Mesh mesh;wmOperatorType type;wmOperator op;wmEventHandler_Op handler;ReportList reports;Link v3d,rv3d;wmIPadKnifeOwner owner;bContext C;
 PanelType paneltype;Panel panel;uiBlock block;uiBut button;int active_data=11;wmEventHandler_UI ui;
 Fixture(){
  assert(requests.empty());event_queue.clear();lifetimes.clear();origins.clear();trace.clear();wm_ipad_knife_ui_scope={};
  lifetime_allocations=provider_callbacks=native_calls=finished_calls=free_calls=handler_free_calls=request_allocations=request_frees=modalmap_calls=reports_calls=view_find_calls=0;inside_ui=mutate_window_on_action=false;called_op=nullptr;called_confirm=false;native_result=OPERATOR_FINISHED;
  G_MAIN=&main;registered_type=&type;manager.id.session_uid=11;screen.id.session_uid=12;scene.id.session_uid=13;object.id.session_uid=14;mesh.id.session_uid=15;type.ipad_lifetime_id=16;
  BLI_addtail(&main.wm,&manager);BLI_addtail(&main.screens,&screen);BLI_addtail(&main.scenes,&scene);BLI_addtail(&main.objects,&object);BLI_addtail(&main.meshes,&mesh);
  BLI_addtail(&manager.windows,&win);win.runtime=&winruntime;win.screen=&screen;win.scene=&scene;BLI_addtail(&screen.areabase,&area);BLI_addtail(&area.regionbase,&region);BLI_addtail(&area.regionbase,&hud);BLI_addtail(&area.spacedata,&v3d);region.runtime=&runtime;region.regiondata=&rv3d;hud.regiontype=RGN_TYPE_HUD;hud.runtime=&hudruntime;
  BLI_addtail(&scene.view_layers,&layer);BLI_addtail(&layer.object_bases,&base);layer.basact=&base;base.object=&object;object.data=&mesh;
  op.type=&type;op.reports=&reports;handler.op=&op;handler.context={&win,&area,&region,nullptr};BLI_addtail(&win.modalhandlers,&handler.head);origins[&op]={&scene,&layer,&object,&region,&v3d,&rv3d};C={&manager,&win,&area,&region};
  paneltype.knife=true;panel.type=&paneltype;block.panel=&panel;button.active=&active_data;button.block=&block;hud.active_button=&button;ui.head.type=WM_HANDLER_TYPE_UI;ui.handle_fn=ui_handler_region_menu;ui.context={&win,&area,&hud,nullptr};ui.user_data=&active_data;
  wm_ipad_knife_modal_handler_bind(&win,&area,&region,&handler);assert(capture());assert(owner.valid());assert(lifetime_allocations==1);
 }
 ~Fixture(){for(auto&e:event_queue)release_request(e);assert(requests.empty());assert(request_allocations==request_frees);wm_ipad_knife_ui_scope={};G_MAIN=nullptr;registered_type=nullptr;lifetimes.clear();origins.clear();}
 bool capture(){wmIPadKnifeOwner fresh;bool ok=WM_ipad_knife_owner_capture(&C,&win,&area,fresh);if(ok)owner=fresh;return ok;}
 bool still(){wmIPadKnifeOwner fresh;return WM_ipad_knife_owner_capture(&C,&win,&area,fresh)&&fresh==owner;}
 void scope(bool release=true){wm_ipad_knife_ui_scope={};auto&s=wm_ipad_knife_ui_scope;s.owner=owner;s.generation=55;s.serial=66;s.xy[0]=123;s.xy[1]=234;s.release=release;}
 bool queue(wmIPadKnifeAction action=wmIPadKnifeAction::Confirm){inside_ui=true;bool result=WM_ipad_knife_action_queue(&C,owner,action);inside_ui=false;assert(native_calls==0);return result;}
 wmEvent&queued(wmIPadKnifeAction action=wmIPadKnifeAction::Confirm){scope();assert(queue(action));wm_ipad_knife_ui_scope={};assert(event_queue.size()==1);return event_queue.front();}
 bool resolve(wmEvent*e,wmEventHandler_Op**handler_out=nullptr){wmEventHandler_Op*h=reinterpret_cast<wmEventHandler_Op*>(uintptr_t(1));ScrArea*a=reinterpret_cast<ScrArea*>(uintptr_t(2));ARegion*r=reinterpret_cast<ARegion*>(uintptr_t(3));bool ok=wm_ipad_knife_request_resolve(&C,&win,e,&h,&a,&r);if(ok){assert(h==&handler&&a==&area&&r==&region);}else assert(!h&&!a&&!r);if(handler_out)*handler_out=h;return ok;}
 void reject_owner(){assert(!still());assert(WM_ipad_knife_owner_region(&C,&win,owner)==nullptr);assert(provider_callbacks==0&&native_calls==0);}
};
int main(int argc,char**argv){assert(argc==2);std::string which=argv[1];{
 Fixture f;
 if(which=="valid"){
  assert(f.owner.values[K_OPERATOR_LIFETIME]==lifetimes[&f.op]&&f.owner.values[K_TYPE_LIFETIME]==16);assert(f.owner.values[K_HANDLER]==uintptr_t(&f.handler));assert(WM_ipad_knife_owner_region(&f.C,&f.win,f.owner)==&f.region);assert(f.still());assert(lifetime_allocations==1&&provider_callbacks==0&&native_calls==0);
 }else if(which=="membership-before-identity"){
  BLI_remlink(&f.win.modalhandlers,&f.handler);lifetimes.clear();f.handler.op=reinterpret_cast<wmOperator*>(uintptr_t(1));wmIPadKnifeOwner out;assert(!wm_ipad_knife_owner_read(&f.win,&f.handler,uintptr_t(&f.area),uintptr_t(&f.region),true,out));assert(lifetime_allocations==1);
 }else if(which=="lifetime-before-old-pointer"){
  f.handler.op=reinterpret_cast<wmOperator*>(uintptr_t(1));f.reject_owner();
 }else if(which=="missing-layer"){
  std::strcpy(f.win.view_layer_name,"No such layer");int before=lifetime_allocations;f.reject_owner();wm_ipad_knife_modal_handler_bind(&f.win,&f.area,&f.region,&f.handler);assert(lifetime_allocations==before&&provider_callbacks==0&&view_find_calls>0);
 }else if(which=="unregistered-type"){
  registered_type=nullptr;f.reject_owner();
 }else if(which=="type-reused"){
  ++f.type.ipad_lifetime_id;f.reject_owner();
 }else if(which=="operator-reused"){
  ++lifetimes[&f.op];f.reject_owner();
 }else if(which=="macro-child"){
  f.op.opm=&f.op;f.reject_owner();
 }else if(which=="object-uid"){
  ++f.object.id.session_uid;f.reject_owner();
 }else if(which=="mesh-uid"){
  ++f.mesh.id.session_uid;f.reject_owner();
 }else if(which=="scene-uid"){
  ++f.scene.id.session_uid;f.reject_owner();
 }else if(which=="screen-uid"){
  ++f.screen.id.session_uid;f.reject_owner();
 }else if(which=="manager-uid"){
  ++f.manager.id.session_uid;f.reject_owner();
 }else if(which=="window-id"){
  ++f.win.winid;f.reject_owner();
 }else if(which=="main-replaced"){
  Main replacement;replacement=f.main;G_MAIN=&replacement;f.reject_owner();
 }else if(which=="object-removed"){
  BLI_remlink(&f.main.objects,&f.object);f.reject_owner();
 }else if(which=="mesh-removed"){
  BLI_remlink(&f.main.meshes,&f.mesh);f.reject_owner();
 }else if(which=="screen-removed"){
  BLI_remlink(&f.main.screens,&f.screen);f.reject_owner();
 }else if(which=="area-removed"){
  BLI_remlink(&f.screen.areabase,&f.area);f.reject_owner();
 }else if(which=="region-removed"){
  BLI_remlink(&f.area.regionbase,&f.region);f.reject_owner();
 }else if(which=="region-hidden"){
  f.runtime.visible=false;f.reject_owner();
 }else if(which=="view-origins"){
  f.region.regiondata=&f.v3d;f.reject_owner();
 }else if(which=="out-of-sync"){
  f.layer.flag|=VIEW_LAYER_OUT_OF_SYNC;f.reject_owner();
 }else if(which=="base-replaced"){
  Base replacement;replacement.object=&f.object;f.layer.basact=&replacement;f.reject_owner();
 }else if(which=="wrong-window-context"){
  f.C.win=nullptr;f.reject_owner();
 }else if(which=="wrong-manager-context"){
  f.C.wm=nullptr;f.reject_owner();
 }else if(which=="duplicate-manager"){
  wmWindowManager other;other.id.session_uid=81;other.windows=f.manager.windows;BLI_addtail(&f.main.wm,&other);f.reject_owner();
 }else if(which=="duplicate-owner"){
  wmEventHandler_Op other=f.handler;BLI_addtail(&f.win.modalhandlers,&other.head);f.reject_owner();
 }else if(which=="other-operator"){
  wmEventHandler_Op other;other.op=&f.op;BLI_addtail(&f.win.modalhandlers,&other.head);assert(!f.still());wmIPadKnifeOwner shown;assert(WM_ipad_knife_owner_present(&f.C,&f.win,&f.area,shown)&&shown==f.owner);
 }else if(which=="dedicated-ui"){
  BLI_addtail(&f.win.modalhandlers,&f.ui.head);assert(UI_ipad_knife_hud_ui_handler(&f.ui.head,&f.area,&f.hud));assert(f.still());assert(provider_callbacks==0);
 }else if(which=="unknown-ui"){
  BLI_addtail(&f.win.modalhandlers,&f.ui.head);f.ui.handle_fn=foreign_ui;assert(!UI_ipad_knife_hud_ui_handler(&f.ui.head,&f.area,&f.hud));f.reject_owner();wmIPadKnifeOwner shown;assert(WM_ipad_knife_owner_present(&f.C,&f.win,&f.area,shown)&&shown==f.owner);assert(WM_ipad_knife_owner_region(&f.C,&f.win,f.owner,true)==&f.region);
 }else if(which=="ui-remove-callback"){
  BLI_addtail(&f.win.modalhandlers,&f.ui.head);f.ui.remove_fn=foreign_ui;f.reject_owner();
 }else if(which=="ui-popup"){
  BLI_addtail(&f.win.modalhandlers,&f.ui.head);f.ui.context.region_popup=&f.hud;f.reject_owner();
 }else if(which=="ui-stale-active"){
  BLI_addtail(&f.win.modalhandlers,&f.ui.head);f.button.active=nullptr;f.reject_owner();
 }else if(which=="ui-wrong-userdata"){
  BLI_addtail(&f.win.modalhandlers,&f.ui.head);f.ui.user_data=&f.button;f.reject_owner();
 }else if(which=="ui-wrong-panel"){
  BLI_addtail(&f.win.modalhandlers,&f.ui.head);f.paneltype.knife=false;f.reject_owner();
 }else if(which=="postponed-ui"){
  BLI_addtail(&f.win.modalhandlers,&f.ui.head);f.ui.user_data=reinterpret_cast<void*>(uintptr_t(1));f.ui.head.flag=WM_HANDLER_DO_FREE;assert(f.still());
 }else if(which=="queue-copy"){
  f.scope();assert(f.queue());auto frozen=f.owner;f.owner={};wm_ipad_knife_ui_scope={};assert(event_queue.size()==1&&native_calls==0);auto&r=*static_cast<wmIPadKnifeRequest*>(event_queue[0].customdata);assert(r.owner==frozen&&r.action==wmIPadKnifeAction::Confirm);assert(event_queue[0].xy[0]==123&&event_queue[0].xy[1]==234);f.owner=frozen;assert(f.resolve(&event_queue[0]));
 }else if(which=="queue-single-use"){
  f.scope();assert(f.queue());assert(!f.queue(wmIPadKnifeAction::Cancel));assert(event_queue.size()==1&&request_allocations==1&&native_calls==0);
 }else if(which=="queue-outside-scope"){
  assert(!f.queue());assert(event_queue.empty());
 }else if(which=="queue-not-release"){
  f.scope(false);assert(!f.queue());assert(event_queue.empty());
 }else if(which=="queue-zero-generation"){
  f.scope();wm_ipad_knife_ui_scope.generation=0;assert(!f.queue());
 }else if(which=="queue-zero-serial"){
  f.scope();wm_ipad_knife_ui_scope.serial=0;assert(!f.queue());
 }else if(which=="queue-other-owner"){
  f.scope();++f.owner.values[K_MESH_UID];assert(!f.queue());
 }else if(which=="queue-invalid-action"){
  f.scope();assert(!f.queue(static_cast<wmIPadKnifeAction>(99)));
 }else if(which=="queue-stale-owner"){
  f.scope();++f.mesh.id.session_uid;assert(!f.queue());
 }else if(which=="resolve-malformed"){
  auto&e=f.queued();e.custom=0;assert(!f.resolve(&e));e.custom=EVT_DATA_IPAD_KNIFE_ACTION;e.customdata_free=false;assert(!f.resolve(&e));e.customdata_free=true;static_cast<wmIPadKnifeRequest*>(e.customdata)->action=static_cast<wmIPadKnifeAction>(99);assert(!f.resolve(&e));assert(!f.resolve(nullptr));
 }else if(which=="resolve-handler-replaced"){
  auto&e=f.queued();BLI_remlink(&f.win.modalhandlers,&f.handler);wmEventHandler_Op replacement=f.handler;BLI_addtail(&f.win.modalhandlers,&replacement.head);assert(!f.resolve(&e));assert(native_calls==0);
 }else if(which=="resolve-op-replaced"){
  auto&e=f.queued();wmOperator replacement=f.op;f.handler.op=&replacement;origins[&replacement]=origins[&f.op];lifetimes[&replacement]=999;assert(!f.resolve(&e));assert(native_calls==0);
 }else if(which=="resolve-same-address-new-lifetime"){
  auto&e=f.queued();++lifetimes[&f.op];assert(!f.resolve(&e));assert(native_calls==0);
 }else if(which=="resolve-wrong-window"){
  auto&e=f.queued();++f.win.winid;assert(!f.resolve(&e));assert(native_calls==0);
 }else if(which=="resolve-stale-uid"){
  auto&e=f.queued();++f.mesh.id.session_uid;assert(!f.resolve(&e));assert(native_calls==0);
 }else if(which=="dispatch-refuses-before-handler-read"){
  auto&e=f.queued();++f.mesh.id.session_uid;auto*poison=reinterpret_cast<wmEventHandler*>(uintptr_t(1));assert(dispatch_request(&f.C,&f.win.modalhandlers,poison,&e)==(WM_HANDLER_BREAK|WM_HANDLER_HANDLED));assert(native_calls==0&&handler_free_calls==0);
 }else if(which=="dispatch-mismatched-live-handler"){
  auto&e=f.queued();auto*poison=reinterpret_cast<wmEventHandler*>(uintptr_t(1));assert(dispatch_request(&f.C,&f.win.modalhandlers,poison,&e)==(WM_HANDLER_BREAK|WM_HANDLER_HANDLED));assert(native_calls==0);
 }else if(which=="finish"||which=="cancel"){
  const bool finish=which=="finish";native_result=finish?OPERATOR_FINISHED:OPERATOR_CANCELLED;auto&e=f.queued(finish?wmIPadKnifeAction::Confirm:wmIPadKnifeAction::Cancel);assert(!wm_ipad_knife_ui_scope.owner.valid());dispatch_request(&f.C,&f.win.modalhandlers,&f.handler.head,&e);assert(native_calls==1&&called_op==&f.op&&called_confirm==finish&&handler_free_calls==1&&f.handler.op==nullptr&&!f.win.modalhandlers.first);assert(finished_calls==(finish?1:0)&&free_calls==(finish?0:1)&&reports_calls==1&&modalmap_calls==0&&f.manager.op_undo_depth==0);assert(!f.C.area&&!f.C.region);assert(trace[trace.size()-1]=="handler_free");assert(!f.resolve(&e));
 }else if(which=="finish-after-ui-disposal"){
  BLI_addtail(&f.win.modalhandlers,&f.ui.head);auto&e=f.queued();f.ui.head.flag|=WM_HANDLER_DO_FREE;f.ui.user_data=reinterpret_cast<void*>(uintptr_t(1));f.button.active=nullptr;dispatch_request(&f.C,&f.win.modalhandlers,&f.handler.head,&e);assert(native_calls==1&&called_op==&f.op&&finished_calls==1&&free_calls==0&&handler_free_calls==1);assert(f.win.modalhandlers.first==&f.ui.head&&f.win.modalhandlers.last==&f.ui.head);assert(!f.resolve(&e));
 }else if(which=="native-window-change"){
  auto&e=f.queued();mutate_window_on_action=true;dispatch_request(&f.C,&f.win.modalhandlers,&f.handler.head,&e);assert(native_calls==1&&finished_calls==0&&free_calls==0&&handler_free_calls==0&&f.handler.op==&f.op&&f.manager.op_undo_depth==0);
 }else if(which=="no-op-queued-refusal"){
  auto&e=f.queued();f.handler.head.flag|=WM_HANDLER_DO_FREE;assert(!f.resolve(&e));assert(native_calls==0&&free_calls==0&&handler_free_calls==0);
 }else assert(false&&"Unknown case");
 assert(provider_callbacks==0);
 }std::cout<<"PASS "<<which<<" actual owner/bind/value-queue/fresh native WM slices; external state explicit\n";
}
"""

RUNTIME_CASES = ('valid', 'membership-before-identity', 'lifetime-before-old-pointer', 'missing-layer',
 'unregistered-type', 'type-reused', 'operator-reused', 'macro-child', 'object-uid', 'mesh-uid',
 'scene-uid', 'screen-uid', 'manager-uid', 'window-id', 'main-replaced', 'object-removed',
 'mesh-removed', 'screen-removed', 'area-removed', 'region-removed', 'region-hidden',
 'view-origins', 'out-of-sync', 'base-replaced', 'wrong-window-context', 'wrong-manager-context',
 'duplicate-manager', 'duplicate-owner', 'other-operator', 'dedicated-ui', 'unknown-ui',
 'ui-remove-callback', 'ui-popup', 'ui-stale-active', 'ui-wrong-userdata', 'ui-wrong-panel',
 'postponed-ui', 'queue-copy', 'queue-single-use', 'queue-outside-scope', 'queue-not-release',
 'queue-zero-generation', 'queue-zero-serial', 'queue-other-owner', 'queue-invalid-action',
 'queue-stale-owner', 'resolve-malformed', 'resolve-handler-replaced', 'resolve-op-replaced',
 'resolve-same-address-new-lifetime', 'resolve-wrong-window', 'resolve-stale-uid',
 'dispatch-refuses-before-handler-read', 'dispatch-mismatched-live-handler', 'finish', 'cancel',
 'finish-after-ui-disposal', 'native-window-change', 'no-op-queued-refusal')

class PencilKnifeOwnerDispatchTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        (OUT/'report.json').write_bytes((json.dumps({'status':'RUNNING_KNIFE_OWNER_GATE','pin':PIN})+'\n').encode())
        cls.cpp = OUT/'native-knife-owner.cc'
        cls.exe = OUT/('native-knife-owner.exe' if os.name=='nt' else 'native-knife-owner')
        cls.cpp.write_bytes(translation_unit().encode())
        compiler = shutil.which('clang++') or str(Path('C:/Program Files/LLVM/bin/clang++.exe'))
        result = subprocess.run([compiler,'-std=c++17','-O'+OPTIONS.opt_level,'-g',str(cls.cpp),'-o',str(cls.exe)],capture_output=True,text=True,encoding='utf-8',errors='replace')
        (OUT/'compile.log').write_bytes((result.stdout+result.stderr).encode())
        if result.returncode:
            (OUT/'report.json').write_bytes((json.dumps({'status':'FAILED_NATIVE_OWNER_GATE_COMPILE','pin':PIN,'log':'compile.log'})+'\n').encode())
            raise RuntimeError('Native owner fixture compilation failed: '+str(OUT/'compile.log'))
        cls.results=[]
        cls.guards=set()
    @classmethod
    def tearDownClass(cls):
        complete={r['case'] for r in cls.results}==set(RUNTIME_CASES) and cls.guards=={'callback_free','bind_order','dispatch_order','ui_identity'}
        passed=all(r['returncode']==0 for r in cls.results)
        report={'status':('PASS_SOURCE_EXECUTING_OWNER_GATE' if complete else 'PARTIAL_PASS_OWNER_GATE') if passed else 'FAILED',
          'pin':PIN,'opt_level':OPTIONS.opt_level,'source_root':str(OPTIONS.source_root) if OPTIONS.source_root else 'PATCH_PLUS_PIN',
          'source_hashes':{p:hashlib.sha256(SOURCES[p].encode()).hexdigest() for p in PATHS},
          'fixture_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
          'actual_native_bodies':{s:hashlib.sha256(v.encode()).hexdigest() for s,v in BODIES.items()},
          'actual_ui_predicate_sha256':hashlib.sha256(UI_PREDICATE.encode()).hexdigest(),
          'selected_native_wm_slices':{k:hashlib.sha256(v.encode()).hexdigest() for k,v in NATIVE_SLICES.items()},
          'cases':cls.results,'source_guards_completed':sorted(cls.guards),
          'boundaries':['Intrusive lists/allocation, initial registration and scope admission, fresh registered-type/lifetime maps, pure named ViewLayer lookup, BKE/native Knife origin, active UI button/panel lookup and event enqueue are explicit external models.',
          'The genuine native owner/bind/capture/presentation/region/queue/request bodies execute. Their external lookups do not call providers. Invalid old numeric addresses are used in refusal tests without dereference.',
          'The actual private-action pre-read prefix, context/action/undo/status cleanup slices execute in a private-request-only adapter. Ordinary WM routing, full scheduler and operator geometry/history are not executed.',
          'ED_mesh_knife_modal_action, wm_operator_finished, operator/handler disposal, reports/gizmo/undo IDs and allocator effects are counted models. FINISHED and CANCELLED use separate native status branches; callback is never inside modeled UI frame.',
          'Compositor generation/contact origins, hardware acquisition, UI highlighting/state and target UIKit delivery are covered by separate gates or remain unproved. No global lifetime/allocator/reentrancy or A-B-A presentation epoch proof.'],
          'production_changed':False,'device_acceptance':False}
        (OUT/'report.json').write_bytes((json.dumps(report,indent=2)+'\n').encode())
    def run_case(self,name):
        result=subprocess.run([str(self.exe),name],capture_output=True,text=True,encoding='utf-8',errors='replace')
        self.results.append({'case':name,'returncode':result.returncode,'stdout':result.stdout,'stderr':result.stderr})
        self.assertEqual(result.returncode,0,result.stdout+result.stderr)
    def test_callback_free_capture_uses_named_layer_and_find_only_lifetime(self):
        body=BODIES['static bool wm_ipad_knife_owner_read(']
        self.assertIn('BKE_view_layer_find(scene, win->view_layer_name)',body)
        self.assertNotIn('WM_window_get_active_view_layer',body)
        self.assertLess(body.index('WM_operator_touch_lifetime_matches'),body.index('handler->op->type'))
        self.assertLess(body.index('BLI_findindex(&win->modalhandlers'),body.index('WM_operator_touch_lifetime_id'))
        for token in ('CTX_data_', 'ot->cancel', 'WM_operator_name_call', 'RNA_', 'PyObject_'):
            self.assertNotIn(token,'\n'.join(BODIES.values()))
        self.guards.add('callback_free')
    def test_bind_follows_actual_native_registration(self):
        body=function(WM,'wmEventHandler_Op *WM_event_add_modal_handler_ex(')
        self.assertLess(body.index('wm_handler_operator_insert(win, handler)'),body.index('wm_ipad_knife_modal_handler_bind(win, area, region, handler)'))
        self.guards.add('bind_order')
    def test_private_action_resolves_before_old_handler_and_modal_routing(self):
        self.assertLess(CALL.index('wm_ipad_knife_request_resolve('),CALL.index('handler_base->type'))
        self.assertNotIn('wm_event_modalkeymap_begin',ACTION_BRANCH)
        body=function(WM,'static eHandlerActionFlag wm_handlers_do_intern(')
        self.assertIn('IPAD_KNIFE_ACTION',WM)
        priority=WM.index('if (event->type == IPAD_KNIFE_ACTION)',WM.index('void wm_event_do_handlers('))
        self.assertLess(priority,WM.index('wm_ipad_knife_hud_dispatch(C, win, event)',priority))
        self.guards.add('dispatch_order')
    def test_same_hud_ui_requires_dedicated_live_native_button_identity(self):
        for token in ('handler->handle_fn != ui_handler_region_menu','handler->remove_fn','handler->user_data == but->active','UI_ipad_knife_hud_panel_type'):
            self.assertIn(token,UI_PREDICATE)
        self.assertIn('UI_ipad_knife_hud_ui_handler(base, area, ui->context.region)',BODIES['bool WM_ipad_knife_owner_capture('])
        self.guards.add('ui_identity')

for _case in RUNTIME_CASES:
    def runtime_test(self,name=_case):self.run_case(name)
    setattr(PencilKnifeOwnerDispatchTests,'test_runtime_'+_case.replace('-','_'),runtime_test)

if __name__=='__main__':unittest.main(argv=[sys.argv[0]]+UNITTEST_ARGS)
