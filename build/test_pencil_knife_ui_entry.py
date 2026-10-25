"""Execute native regional button state, exit and deferred callback UI-entry gate.

This is a proposed admitted-HUD route, not an implemented Knife control.
Full WM/UI setup, UIKit, GPU, allocation/list primitives and policy are bounded.
"""
from pathlib import Path
import argparse, hashlib, importlib.util, json, os, re, shutil, subprocess, sys, tempfile, unittest
DEFAULT_REPO=Path(__file__).resolve().parents[1]
parser=argparse.ArgumentParser(add_help=False)
parser.add_argument('--repo',type=Path,default=DEFAULT_REPO)
parser.add_argument('--cache-dir',type=Path)
parser.add_argument('--output-dir',type=Path)
parser.add_argument('--opt-level',choices=('0','2'),default='0')
OPTIONS,UNITTEST_ARGS=parser.parse_known_args()
REPO=OPTIONS.repo.resolve()
OUT=OPTIONS.output_dir.resolve() if OPTIONS.output_dir else Path(tempfile.mkdtemp(prefix='pencil-knife-ui-entry-'))
OUT.mkdir(parents=True,exist_ok=True)
sys.path.insert(0,str(REPO/'build'))
def helper(name):
 spec=importlib.util.spec_from_file_location(name,REPO/'build'/(name+'.py'));module=importlib.util.module_from_spec(spec);sys.modules[name]=module;spec.loader.exec_module(module);return module
preflight=helper('preflight');touch=helper('test_touch_extrude');function=helper('test_compact_shelf').function
PIN=preflight.pinned_commit(REPO);CACHE=OPTIONS.cache_dir.resolve() if OPTIONS.cache_dir else REPO/'.cache/preflight'
PATHS=('source/blender/editors/interface/interface_handlers.cc','source/blender/windowmanager/intern/wm_event_system.cc')
INPUTS={p:preflight.get_source(PIN,p,CACHE,False).decode() for p in PATHS}
touch.PIN_ROOT=CACHE/PIN;touch.changed_source.cache_clear()
def source(path):return touch.changed_source(path) if f'diff --git a/{path} b/{path}\n' in touch.PATCH_TEXT else INPUTS[path]
UI,WM=(source(p) for p in PATHS)
SIGNATURES=('static bool button_modal_state(','static uiAfterFunc *ui_afterfunc_new(','static bool ui_afterfunc_check(','static void ui_apply_but_func(','static void ui_apply_but_BUT(','static void ui_apply_but(','static void button_activate_state(','static int ui_do_but_BUT(','static void button_activate_exit(','void ui_but_active_free(','static int ui_handle_button_event(','static int ui_handle_region_semi_modal_buttons(','static void ui_apply_but_funcs_after(','static int ui_region_handler(')
BODIES={s:function(UI,s) for s in SIGNATURES}
WM_SIGNATURES=('wmEventHandler_UI *WM_event_add_ui_handler(','void WM_event_remove_ui_handler(','void wm_event_free_handler(')
WM_BODIES={s:function(WM,s) for s in WM_SIGNATURES}
DO_BUTTON=function(UI,'static int ui_do_button(')
start=DO_BUTTON.index('    case ButType::But:');end=DO_BUTTON.index('      break;',start)+len('      break;')
BUT_DISPATCH_CASE=DO_BUTTON[start:end];assert 'ui_do_but_BUT(C, but, data, event)' in BUT_DISPATCH_CASE
WM_HANDLER_LOOP=function(WM,'static eHandlerActionFlag wm_handlers_do_intern(')
cleanup_start=WM_HANDLER_LOOP.index('    if (BLI_findindex(handlers, handler_base) != -1)')
cleanup_open=WM_HANDLER_LOOP.index('{',cleanup_start)
cleanup_depth=0
for cleanup_end in range(cleanup_open,len(WM_HANDLER_LOOP)):
 cleanup_depth+=(WM_HANDLER_LOOP[cleanup_end]=='{')-(WM_HANDLER_LOOP[cleanup_end]=='}')
 if cleanup_depth==0:break
WM_POSTPONED_CLEANUP=WM_HANDLER_LOOP[cleanup_start:cleanup_end+1]
PRELUDE=r"""
#include <algorithm>
#include <array>
#include <cassert>
#include <cfloat>
#include <cstdint>
#include <cstring>
#include <functional>
#include <iostream>
#include <memory>
#include <optional>
#include <set>
#include <string>
#include <type_traits>
#include <vector>
#define BLI_assert(x) assert(x)
#define ATTR_FALLTHROUGH [[fallthrough]]
#define IFACE_(x) (x)
#define MEM_SAFE_FREE(p) do{MEM_freeN(p);p=nullptr;}while(0)
#define LISTBASE_FOREACH(T,v,l) for(T v=static_cast<T>((l)->first);v;v=v->next)
#define LISTBASE_FOREACH_MUTABLE(T,v,l) for(auto v=static_cast<T>((l)->first),v##_next=v?v->next:nullptr;v;v=v##_next,v##_next=v?v->next:nullptr)
template<class T,class...U>bool ELEM(const T&x,const U&...v){return((x==v)||...);}
struct Link{Link*next=nullptr,*prev=nullptr;};struct ListBase{void*first=nullptr,*last=nullptr;};
void BLI_listbase_clear(ListBase*l){l->first=l->last=nullptr;}bool BLI_listbase_is_empty(const ListBase*l){return !l->first;}
void BLI_addtail(ListBase*l,void*p){auto*v=(Link*)p;v->next=nullptr;v->prev=(Link*)l->last;if(v->prev)v->prev->next=v;else l->first=v;l->last=v;}
void BLI_addhead(ListBase*l,void*p){auto*v=(Link*)p;v->prev=nullptr;v->next=(Link*)l->first;if(v->next)v->next->prev=v;else l->last=v;l->first=v;}
void BLI_remlink(ListBase*l,void*p){auto*v=(Link*)p;if(v->prev)v->prev->next=v->next;else l->first=v->next;if(v->next)v->next->prev=v->prev;else l->last=v->prev;v->next=v->prev=nullptr;}
int BLI_findindex(const ListBase*l,const void*p){int i=0;for(auto*x=(Link*)l->first;x;x=x->next,++i)if(x==p)return i;return -1;}
struct uiBut;struct uiBlock;struct uiAfterFunc;struct uiHandleButtonData;struct bContext;struct ARegion;struct ScrArea{};struct wmWindow;struct wmWindowManager;struct wmOperator{};struct wmOperatorType{const char*idname="";};
struct Action{uint64_t window=0,screen=0,session=0;int kind=0;};static_assert(std::is_trivially_copyable_v<Action>);
std::vector<int>trace;std::vector<Action>pending_actions;std::function<void()> on_data_free;
int native_finish_calls=0,ui_add_calls=0,after_free_calls=0,data_free_calls=0,handler_free_calls=0,live_data=0,over_boundary_calls=0;
std::set<void*>after_allocs,handler_allocs;
template<class T>T*MEM_new(const char*){T*p=new T{};if constexpr(std::is_same_v<T,uiAfterFunc>)after_allocs.insert(p);return p;}
template<class T>T*MEM_callocN(const char*){T*p=new T{};handler_allocs.insert(p);++ui_add_calls;trace.push_back(10);return p;}
template<class T>void MEM_delete(T*p){if constexpr(std::is_same_v<T,uiAfterFunc>){assert(after_allocs.erase(p));++after_free_calls;trace.push_back(50);}delete p;}
void MEM_freeN(void*p){if(!p)return;if(handler_allocs.erase(p)){++handler_free_calls;trace.push_back(80);}::operator delete(p);}
namespace blender{namespace wm{enum class OpCallContext{None};}namespace ui{namespace ipad{enum class RingKind{Selection,Transform};bool ring_setting_stays_open(RingKind,const char*){return false;}}}}
struct Origin{bool corner=false,owned=false;bool present()const{return owned;}};struct OpReceipt{uint64_t lifetime=0;};struct RnaReceipt{};struct ContextStore{};struct InteractionCallbacks{};struct InteractionHandle{int user_count=0;};struct PointerRNA{void*data=nullptr,*owner_id=nullptr;};
struct wmEvent{int type=0,val=0,xy[2]{},prev_xy[2]{},prev_press_xy[2]{};int modifier=0;void*customdata=nullptr;};
using wmUIHandlerFunc=int(*)(bContext*,const wmEvent*,void*);using wmUIHandlerRemoveFunc=void(*)(bContext*,void*);using eWM_EventHandlerFlag=int;
struct wmEventHandler{wmEventHandler*next=nullptr,*prev=nullptr;int type=0,flag=0;};struct wmEventHandler_UI{wmEventHandler head;wmUIHandlerFunc handle_fn=nullptr;wmUIHandlerRemoveFunc remove_fn=nullptr;void*user_data=nullptr;struct{ScrArea*area=nullptr;ARegion*region=nullptr,*region_popup=nullptr;}context;};
struct wmWindow{wmWindow*next=nullptr,*prev=nullptr;ListBase modalhandlers;void*ghostwin=nullptr;};struct wmWindowManager{ListBase windows;};struct ToolTip{int event_xy[2]{};};struct bScreen{ListBase regionbase;ToolTip*tool_tip=nullptr;};
struct bContext{ScrArea*area=nullptr;ARegion*region=nullptr,*popup=nullptr;wmWindow*win=nullptr;wmWindowManager*wm=nullptr;bScreen*screen=nullptr;bool allowed=true;};struct wmTimer{};struct rctf{float xmin=0,ymin=0,xmax=100,ymax=100;};struct rcti{};
struct uiPopupBlockHandle{bool popup=false;int menuretval=0,butretval=0;wmOperator*popup_op=nullptr;uint64_t ipad_popup_lifetime=0;bool ipad_numbers=false;ARegion*region=nullptr;void*popup_arg=nullptr;};struct ColorBand{};struct CurveMapping{};struct CurveProfile{};
struct TextEdit{char*edit_string=nullptr,*original_string=nullptr;};
struct uiHandleButtonData{uiHandleButtonState state=BUTTON_STATE_HIGHLIGHT;ARegion*region=nullptr;wmWindow*window=nullptr;wmWindowManager*wm=nullptr;bool cancel=false,escapecancel=false,applied=false,applied_interactive=false,used_mouse=false,changed_cursor=false;wmTimer*autoopentimer=nullptr,*flashtimer=nullptr,*hold_action_timer=nullptr;float ungrab_mval[2]{};TextEdit text_edit;double value=0,origvalue=0;float vec[3]{},origvec[3]{};int retval=0;uiBut*postbut=nullptr;uiButtonActivateType posttype=BUTTON_ACTIVATE_OVER;uiPopupBlockHandle*menu=nullptr;InteractionHandle*custom_interaction_handle=nullptr;};
using ButFunc=void(*)(bContext*,void*,void*);using HandleFunc=void(*)(bContext*,void*,int);using FuncN=void(*)(bContext*,void*,void*);
struct uiBlock{uiBlock*next=nullptr,*prev=nullptr;Origin ipad_action_origin;struct{int flags=0;}pie_data;uiPopupBlockHandle*handle=nullptr;int flag=0;bool auto_open=false,tooltipdisabled=false;float aspect=1;uint64_t ipad_view_region_data=0;HandleFunc handle_func=nullptr;void*handle_func_arg=nullptr;InteractionCallbacks custom_interaction_callbacks;std::vector<std::unique_ptr<uiBut>>buttons;};
struct uiBut{ButType type=ButType::But;int flag=0,retval=0;uiBlock*block=nullptr;uiHandleButtonData*active=nullptr,*semi_modal_state=nullptr;wmOperatorType*optype=nullptr;blender::wm::OpCallContext opcontext{};PointerRNA*opptr=nullptr;PointerRNA rnapoin;void*rnaprop=nullptr;int rnaindex=0;RnaReceipt ipad_rna_receipt;char*editstr=nullptr;double*editval=nullptr;float*editvec=nullptr;std::string drawstr,rename_full_new;ButFunc func=nullptr;void*func_arg1=nullptr,*func_arg2=nullptr;std::function<void(bContext&)>apply_func;FuncN funcN=nullptr;void*func_argN=nullptr;void*(*func_argN_copy_fn)(const void*)=nullptr;void(*func_argN_free_fn)(void*)=nullptr;void(*rename_func)(bContext*,void*,char*)=nullptr;void*rename_arg1=nullptr,*rename_orig=nullptr;void(*rename_full_func)(std::string)=nullptr;void(*hold_func)(bContext*,ARegion*,uiBut*)=nullptr;bool operator_never_call=false;rctf rect;ContextStore*context=nullptr;};
struct uiButSearch:uiBut{void(*arg_free_fn)(void*)=nullptr;void*arg=nullptr;};struct uiButColorBand:uiBut{ColorBand*edit_coba=nullptr;};struct uiButCurveMapping:uiBut{CurveMapping*edit_cumap=nullptr;};struct uiButCurveProfile:uiBut{CurveProfile*edit_profile=nullptr;};
struct ARegionRuntime{ListBase uiblocks;};struct ARegion{ARegion*next=nullptr,*prev=nullptr;ARegionRuntime*runtime=nullptr;int regiontype=0;};
struct uiAfterFunc{uiAfterFunc*next=nullptr,*prev=nullptr;char undostr[64]{};Origin ipad_action_origin;uint64_t ipad_hud_field_uid=0,ipad_popup_lifetime=0;bool ipad_numbers_callback=false,ipad_ring_guarded=false,ipad_view_guarded=false;uint64_t ipad_ring_context[13]{},ipad_ring_tool=0,ipad_ring_lifetime=0,ipad_view_region_data=0;int ipad_ring_reopen=0;std::string ipad_ring_selection_target,drawstr;OpReceipt ipad_operator;ButFunc func=nullptr;void*func_arg1=nullptr,*func_arg2=nullptr;std::function<void(bContext&)>apply_func;FuncN funcN=nullptr;void*func_argN=nullptr;void(*func_argN_free_fn)(void*)=nullptr;void(*rename_func)(bContext*,void*,char*)=nullptr;void*rename_arg1=nullptr,*rename_orig=nullptr;void(*rename_full_func)(std::string)=nullptr;std::string rename_full_new;HandleFunc handle_func=nullptr;void*handle_func_arg=nullptr;int retval=0;wmOperator*popup_op=nullptr;wmOperatorType*optype=nullptr;blender::wm::OpCallContext opcontext{};PointerRNA*opptr=nullptr;PointerRNA rnapoin;void*rnaprop=nullptr;RnaReceipt ipad_rna_receipt;std::optional<ContextStore>context;void(*search_arg_free_fn)(void*)=nullptr;void*search_arg=nullptr;InteractionCallbacks custom_interaction_callbacks;InteractionHandle*custom_interaction_handle=nullptr;};
ListBase UIAfterFuncs;struct UserDef{int menuthreshold1=0,menuthreshold2=0,uiflag=0;struct{bool is_dirty=false;}runtime;}U;
wmWindow*CTX_wm_window(const bContext*C){return C->win;}wmWindowManager*CTX_wm_manager(const bContext*C){return C->wm;}ScrArea*CTX_wm_area(const bContext*C){return C->area;}ARegion*CTX_wm_region(const bContext*C){return C->region;}ARegion*CTX_wm_region_popup(const bContext*C){return C->popup;}bScreen*CTX_wm_screen(const bContext*C){return C->screen;}
namespace ghost{namespace ios{void set_finger_paint_regions(void*,std::initializer_list<int>){}}}

bool ui_ipad_but_self_callback_allowed(bContext*C,uiBut*){return C->allowed;}bool ui_ipad_numbers_but_rebind(uiBut*){return true;}bool ui_ipad_action_origin_valid(bContext*C,const Origin&){return C->allowed;}bool ui_ipad_native_controls_prepare(bContext*C,uiBut*){return C->allowed;}bool ui_ipad_hud_button_input(bContext*,const wmEvent*,uiBut*){return true;}
struct uiIPadButtonLease{};uiIPadButtonLease ui_ipad_button_lease_capture(uiBut*){return{};}uiBut*ui_ipad_button_lease_resolve(bContext*,uiIPadButtonLease){assert(false);return nullptr;}
uint64_t ui_ipad_hud_field_for_button(uiBut*){return 0;}OpReceipt ui_ipad_operator_capture(wmOperatorType*){return{};}wmOperatorType*ui_ipad_operator_resolve(OpReceipt){return nullptr;}int ui_ipad_view_action_bit(wmOperatorType*){return 0;}template<class...T>void UI_ipad_ring_reopen_capture(T...){assert(false);}template<class...T>std::string ui_ipad_ring_selection_target(T...){return{};}template<class...T>bool ui_ipad_ring_action_capture(T&&...){return false;}
std::string ui_but_drawstr_without_sep_char(uiBut*b){return b->drawstr;}
void ui_ipad_action_context_restore(bContext*,uintptr_t,uintptr_t){}bool ui_ipad_action_origin_rebind(bContext*C,const Origin&){return C->allowed;}bool ui_ipad_hud_field_allowed(bContext*C,uint64_t){return C->allowed;}
uiPopupBlockHandle*ui_ipad_registered_popup_resolve(bContext*,const Origin&,uint64_t){return nullptr;}bool ui_ipad_numbers_popup_valid(bContext*,uiPopupBlockHandle*){return false;}template<class...T>bool ui_ipad_rna_resolve(T&&...){return false;}bool ui_ipad_context_store_rebind(bContext*,const Origin&,ContextStore&){return true;}
void CTX_store_set(bContext*,ContextStore*){}wmOperator*ui_ipad_popup_operator_resolve(bContext*,uiAfterFunc&){return nullptr;}void popup_check(bContext*,wmOperator*){}
bool UI_ipad_context_matches(bContext*,const uint64_t*){return false;}uint64_t ui_ipad_ring_tool_identity(bContext*){return 0;}bool WM_event_ipad_mode_safe(bContext*){return false;}
struct uiIPadActionOriginScope{uiIPadActionOriginScope(const Origin&){}};bool ui_ipad_view_dispatch_allowed(bContext*,uiAfterFunc&,wmOperatorType*,PointerRNA*){return false;}bool ui_ipad_ring_reopen_leaf(bContext*,uiAfterFunc&,wmOperatorType*,PointerRNA*){return false;}
using wmOperatorStatus=int;template<class...T>int WM_operator_name_call_ptr(T...){assert(false);return 0;}template<class...T>void UI_ipad_ring_reopen_queue(T...){assert(false);}template<class...T>void WM_operator_name_call_ptr_with_depends_on_cursor(T...){assert(false);}template<class...T>void ui_ipad_ring_selection_rebase(T...){assert(false);}template<class...T>void WM_main_add_notifier(T...){assert(false);}void WM_operator_properties_free(PointerRNA*){assert(false);}template<class...T>void RNA_property_update(T...){assert(false);}
bool UI_ipad_numbers_dialog_callback(ButFunc){return false;}void ED_undo_operator_repeat_cb_evt(bContext*,void*,int){}bool ui_ipad_hud_native_repeat(bContext*,uint64_t,void*){return false;}
void ui_block_interaction_release(bContext*,InteractionCallbacks*,InteractionHandle*,bool){assert(false);}void ui_afterfunc_update_preferences_dirty(uiAfterFunc*){}void WM_operator_stack_clear(wmWindowManager*){assert(false);}void ED_undo_push(bContext*,const char*){assert(false);}
wmTimer*WM_event_timer_add(wmWindowManager*,wmWindow*,int,double){assert(false);return nullptr;}void WM_event_timer_remove(wmWindowManager*,wmWindow*,wmTimer*){assert(false);}
void button_tooltip_timer_reset(bContext*,uiBut*){}void UI_but_tooltip_timer_remove(bContext*,uiBut*){}bool UI_but_paneltype_get(uiBut*){return false;}bool ui_but_menu_draw_as_popover(uiBut*){return false;}
void ui_textedit_begin(bContext*,uiBut*,uiHandleButtonData*){assert(false);}void ui_textedit_end(bContext*,uiBut*,uiHandleButtonData*){assert(false);}bool ui_but_is_cursor_warp(uiBut*){return false;}
void ui_block_to_window_rctf(ARegion*,uiBlock*,rctf*,rctf*){assert(false);}void BLI_rcti_rctf_copy(rcti*,rctf*){assert(false);}void WM_cursor_grab_enable(wmWindow*,int,rcti*,bool){assert(false);}void WM_cursor_grab_disable(wmWindow*,int*){assert(false);}
struct WorkspaceStatus{WorkspaceStatus(bContext*){}void item(const char*,int){assert(false);}};void ui_numedit_begin(uiBut*,uiHandleButtonData*){assert(false);}void ui_numedit_end(uiBut*,uiHandleButtonData*){assert(false);}void ED_workspace_status_text(bContext*,const char*){assert(false);}void WM_global_report(int,const char*){assert(false);}
void ui_block_open_begin(bContext*,uiBut*,uiHandleButtonData*){assert(false);}void ui_block_open_end(bContext*,uiBut*,uiHandleButtonData*){assert(false);}void ui_ipad_ring_capture_suspend(uiBlock*){assert(false);}
void ui_block_interaction_begin_ensure(bContext*,uiBlock*,uiHandleButtonData*,bool){assert(false);}void ui_but_update(uiBut*){}void ED_region_tag_redraw_no_rebuild(ARegion*){}void ED_region_tag_refresh_ui(ARegion*){}
void WM_cursor_modal_restore(wmWindow*){assert(false);}void ui_apply_but_undo(uiBut*b){assert(!(b->flag&UI_BUT_UNDO));}void ui_apply_but_autokey(bContext*,uiBut*b){assert(!b->rnaprop);}void ui_popup_menu_memory_set(uiBlock*,uiBut*){assert(false);}void ui_but_update_preferences_dirty(uiBut*){}
void ui_blocks_set_tooltips(ARegion*,bool){}void WM_event_add_mousemove(wmWindow*){trace.push_back(45);}void ui_block_interaction_update(bContext*,InteractionCallbacks*,InteractionHandle*){assert(false);}void copy_v3_v3(float*a,float*b){std::copy(b,b+3,a);}void zero_v3(float*a){std::fill(a,a+3,0);}
uiBut*ui_but_find_mouse_over(ARegion*r,const wmEvent*e){if(!r)return nullptr;auto*b=(uiBlock*)r->runtime->uiblocks.first;if(!b||b->buttons.empty())return nullptr;auto*but=b->buttons.front().get();return e->xy[0]>=but->rect.xmin&&e->xy[0]<=but->rect.xmax&&e->xy[1]>=but->rect.ymin&&e->xy[1]<=but->rect.ymax?but:nullptr;}
bool ui_but_contains_point_px(uiBut*b,ARegion*,const int*p){return p[0]>=b->rect.xmin&&p[0]<=b->rect.xmax&&p[1]>=b->rect.ymin&&p[1]<=b->rect.ymax;}
bool ui_block_is_menu(uiBlock*){return false;}bool ui_block_is_pie_menu(uiBlock*){return false;}bool ui_but_is_editable(uiBut*){return true;}int WM_event_drag_threshold(const wmEvent*){return 4;}int len_manhattan_v2v2_int(const int*a,const int*b){return std::abs(a[0]-b[0])+std::abs(a[1]-b[1]);}void ui_do_but_extra_operator_icons_mousemove(uiBut*,uiHandleButtonData*,const wmEvent*){}
bool ui_region_contains_point_px(ARegion*,const int*){return false;}int RNA_property_type(void*){return 0;}void ui_button_value_default(uiBut*,double*){assert(false);}void ui_but_range_set_soft(uiBut*){assert(false);}void ui_but_range_set_hard(uiBut*){assert(false);}void button_activate_init(bContext*,ARegion*,uiBut*,uiButtonActivateType){assert(false);}
uiBut*ui_region_find_active_but(ARegion*r){if(!r)return nullptr;for(auto*b=(uiBlock*)r->runtime->uiblocks.first;b;b=b->next)for(auto&but:b->buttons)if(but->active)return but.get();return nullptr;}
uiBut*ui_list_find_mouse_over(ARegion*,const wmEvent*){return nullptr;}int ui_handler_panel_region(bContext*,const wmEvent*,ARegion*,uiBut*){return WM_UI_HANDLER_CONTINUE;}int ui_handle_list_event(bContext*,const wmEvent*,ARegion*,uiBut*){assert(false);return 0;}
template<class F>void foreach_semi_modal_but_as_active(bContext*,ARegion*,F){}
int ui_handle_button_over(bContext*,const wmEvent*,ARegion*){++over_boundary_calls;return WM_UI_HANDLER_CONTINUE;}void ui_handle_viewlist_items_hover(const wmEvent*,ARegion*){}int ui_handle_view_item_event(bContext*,const wmEvent*,uiBut*,ARegion*){return WM_UI_HANDLER_CONTINUE;}
bool ISMOUSE(int t){return ELEM(t,LEFTMOUSE,RIGHTMOUSE,MIDDLEMOUSE,MOUSEMOVE,WHEELUPMOUSE,WHEELDOWNMOUSE);}bool ISMOUSE_GESTURE(int t){return t==MOUSEPAN;}
int ui_ipad_shelf_input_guard(bContext*,ARegion*,const wmEvent*){return -1;}bool ED_ipad_editing_shelf_hit(bContext*,const int*){return false;}
void ui_but_handle_data_free(uiHandleButtonData**p){assert(*p&&live_data==1);--live_data;++data_free_calls;trace.push_back(40);delete *p;*p=nullptr;if(on_data_free)on_data_free();}
static int ui_handler_region_menu(bContext*,const wmEvent*,void*){assert(false&&"Full modal dispatch outside regional gate");return 0;}
static void button_activate_state(bContext*,uiBut*,uiHandleButtonState);
static void ui_apply_but(bContext*,uiBlock*,uiBut*,uiHandleButtonData*,bool);
static int ui_handle_button_event(bContext*,const wmEvent*,uiBut*);
static int ui_do_button(bContext*,uiBlock*,uiBut*,const wmEvent*);
static int ui_handle_region_semi_modal_buttons(bContext*,const wmEvent*,ARegion*);
void ui_but_active_free(const bContext*,uiBut*);
"""
def translation_unit():
 all_native='\n'.join(BODIES.values())+'\n'+'\n'.join(WM_BODIES.values())
 but_enum='enum class ButType {'+','.join(sorted(set(re.findall(r'ButType::(\w+)',all_native))))+'};\n'
 states=sorted(set(re.findall(r'BUTTON_STATE_\w+',all_native)))
 state_enum='enum uiHandleButtonState {'+','.join(states)+'};\n'
 activate='enum uiButtonActivateType {BUTTON_ACTIVATE_OVER,BUTTON_ACTIVATE_TEXT_EDITING};\n'
 constants=set(re.findall(r'\b(?:UI_[A-Z][A-Z0-9_]*|WM_UI_HANDLER_[A-Z_]+|WM_HANDLER_[A-Z_]+|EVT_[A-Z0-9_]+|KM_[A-Z_]+|NC_[A-Z_]+|ND_[A-Z0-9_]+|PROP_[A-Z_]+|ICON_[A-Z_]+|USER_[A-Z_]+|WM_CURSOR_[A-Z_]+|RPT_[A-Z_]+)\b',all_native+PRELUDE))
 constants.update(['LEFTMOUSE','RIGHTMOUSE','MIDDLEMOUSE','MOUSEMOVE','MOUSEPAN','WHEELUPMOUSE','WHEELDOWNMOUSE','WINDEACTIVATE','TIMER','BUTTON_FLASH_DELAY','BUTTON_AUTO_OPEN_THRESH','UI_BUT_UNDO'])
 constants.difference_update(states)
 fixed={'UI_BUT_DISABLED':32,'UI_SELECT':1,'UI_HOVER':2,'UI_BUT_UNDO':4,'UI_BUT_LAST_ACTIVE':8,'UI_BUT_DRAG_MULTI':16,'WM_UI_HANDLER_CONTINUE':0,'WM_UI_HANDLER_BREAK':1,'WM_HANDLER_DO_FREE':1,'WM_HANDLER_TYPE_UI':1,'KM_PRESS':1,'KM_RELEASE':2}
 constants_text='\n'.join(f'constexpr int {n}={fixed[n] if n in fixed else 100+i};' for i,n in enumerate(sorted(constants)))+'\n'
 apply_names=sorted(set(re.findall(r'\b(ui_apply_but_[A-Z_]+)\(',BODIES['static void ui_apply_but('])))
 apply_stubs='\n'.join(f'template<class...T>void {n}(T...){{assert(false&&"Non-BUT apply outside gate");}}' for n in apply_names if n!='ui_apply_but_BUT')
 core=[WM_BODIES[s] for s in ['void wm_event_free_handler(','wmEventHandler_UI *WM_event_add_ui_handler(','void WM_event_remove_ui_handler(']]
 core += [BODIES[s] for s in ['static bool button_modal_state(','static uiAfterFunc *ui_afterfunc_new(','static bool ui_afterfunc_check(','static void ui_apply_but_func(','static void ui_apply_but_BUT(']]
 core += [apply_stubs,BODIES['static void ui_apply_but('],BODIES['static void button_activate_state('],BODIES['static int ui_do_but_BUT(']]
 core.append('static int ui_do_button(bContext*C,uiBlock*block,uiBut*but,const wmEvent*event){assert(but->type==ButType::But&&!(but->flag&UI_BUT_DISABLED));uiHandleButtonData*data=but->active;int retval=WM_UI_HANDLER_CONTINUE;switch(but->type){\n'+BUT_DISPATCH_CASE+'\n default:assert(false);}return retval;}')
 core += [BODIES[s] for s in ['static void button_activate_exit(','void ui_but_active_free(','static int ui_handle_button_event(','static int ui_handle_region_semi_modal_buttons(','static void ui_apply_but_funcs_after(','static int ui_region_handler(']]
 return '#define WITH_APPLE_CROSSPLATFORM 1\n'+but_enum+state_enum+activate+constants_text+PRELUDE+'\n'.join(core)+TEST_MAIN.replace('__WM_POSTPONED_CLEANUP__',WM_POSTPONED_CLEANUP)

TEST_MAIN=r"""
static void sweep_postponed(ListBase*handlers){
 LISTBASE_FOREACH_MUTABLE(wmEventHandler*,handler_base,handlers){
  assert(handler_base->flag&WM_HANDLER_DO_FREE); // This fixture only requests deferred disposal.
__WM_POSTPONED_CLEANUP__
 }
}
struct Fixture{
 wmWindowManager wm;wmWindow win;ScrArea area;bScreen screen;ARegionRuntime runtime;ARegion region;uiBlock block;bContext C;uiBut*but;
 Fixture(){
  assert(!UIAfterFuncs.first&&!live_data&&handler_allocs.empty());trace.clear();pending_actions.clear();on_data_free={};native_finish_calls=ui_add_calls=after_free_calls=data_free_calls=handler_free_calls=over_boundary_calls=0;
  region.runtime=&runtime;C={&area,&region,nullptr,&win,&wm,&screen,true};BLI_addtail(&wm.windows,&win);BLI_addtail(&runtime.uiblocks,&block);
  block.buttons.push_back(std::make_unique<uiBut>());but=block.buttons.front().get();but->block=&block;but->rect={0,0,100,100};block.ipad_action_origin={true,true};
  auto*d=new uiHandleButtonData{};++live_data;d->state=BUTTON_STATE_HIGHLIGHT;d->window=&win;d->wm=&wm;d->region=&region;but->active=d;
  Action a{11,22,33,1};but->apply_func=[a](bContext&C){assert(live_data==0&&data_free_calls==1);assert(after_free_calls==1);assert(C.win->modalhandlers.first);auto*h=(wmEventHandler*)C.win->modalhandlers.first;assert(h->flag&WM_HANDLER_DO_FREE);assert(native_finish_calls==0);trace.push_back(60);pending_actions.push_back(a);};
 }
 ~Fixture(){if(but&&but->active)ui_but_active_free(&C,but);if(win.modalhandlers.first)sweep_postponed(&win.modalhandlers);assert(!UIAfterFuncs.first&&handler_allocs.empty()&&!live_data);}
 int event(int type,int val,int x=30,int y=30){wmEvent e;e.type=type;e.val=val;e.xy[0]=x;e.xy[1]=y;e.prev_xy[0]=x-1;e.prev_xy[1]=y-1;return ui_region_handler(&C,&e,nullptr);}
 void press(){assert(event(LEFTMOUSE,KM_PRESS)==WM_UI_HANDLER_BREAK);assert(but->active&&but->active->state==BUTTON_STATE_WAIT_RELEASE);assert(ui_add_calls==1&&win.modalhandlers.first);auto*h=(wmEventHandler_UI*)win.modalhandlers.first;assert(h->user_data==but->active&&h->handle_fn==ui_handler_region_menu&&!h->remove_fn);assert(pending_actions.empty());}
};
int main(int argc,char**argv){assert(argc==2);std::string which=argv[1];{
 Fixture f;
 if(which=="inside"){
  f.press();assert(f.event(MOUSEMOVE,0,45,45)==WM_UI_HANDLER_BREAK);assert(pending_actions.empty());
  assert(f.event(LEFTMOUSE,KM_RELEASE,45,45)==WM_UI_HANDLER_BREAK);assert(!f.but->active);assert(pending_actions.size()==1&&pending_actions[0].window==11&&pending_actions[0].session==33);assert(native_finish_calls==0);
  auto a=std::find(trace.begin(),trace.end(),40),b=std::find(trace.begin(),trace.end(),50),c=std::find(trace.begin(),trace.end(),60);assert(a<b&&b<c);
  assert(((wmEventHandler*)f.win.modalhandlers.first)->flag&WM_HANDLER_DO_FREE);sweep_postponed(&f.win.modalhandlers);assert(handler_free_calls==1&&!f.win.modalhandlers.first);
  f.event(LEFTMOUSE,KM_RELEASE);assert(pending_actions.size()==1);
 }else if(which=="outside"){
  f.press();f.event(MOUSEMOVE,0,140,45);assert(f.but->active->cancel&&!(f.but->flag&UI_SELECT));f.event(LEFTMOUSE,KM_RELEASE,140,45);assert(!f.but->active&&pending_actions.empty()&&after_free_calls==0&&native_finish_calls==0);
 }else if(which=="reenter"){
  f.press();f.event(MOUSEMOVE,0,140,45);assert(f.but->active->cancel);f.event(MOUSEMOVE,0,40,45);assert(!f.but->active->cancel&&(f.but->flag&UI_SELECT));f.event(LEFTMOUSE,KM_RELEASE,40,45);assert(pending_actions.size()==1);
 }else if(which=="free"){
  f.press();void*old_data=f.but->active;ui_but_active_free(&f.C,f.but);assert(!f.but->active&&pending_actions.empty()&&after_free_calls==0);auto*h=(wmEventHandler_UI*)f.win.modalhandlers.first;assert(h->user_data==old_data&&(h->head.flag&WM_HANDLER_DO_FREE));sweep_postponed(&f.win.modalhandlers);assert(handler_free_calls==1);f.event(LEFTMOUSE,KM_RELEASE);assert(pending_actions.empty());
 }else if(which=="stale"){
  f.press();f.C.allowed=false;f.event(LEFTMOUSE,KM_RELEASE);assert(!f.but->active&&pending_actions.empty()&&after_free_calls==0&&native_finish_calls==0);
 }else if(which=="deferred-stale"){
  f.press();on_data_free=[&](){f.C.allowed=false;};f.event(LEFTMOUSE,KM_RELEASE);on_data_free={};assert(!f.but->active&&pending_actions.empty()&&after_free_calls==1&&native_finish_calls==0);
 }else if(which=="deactivate"){
  f.press();f.event(WINDEACTIVATE,0);assert(!f.but->active&&pending_actions.empty()&&after_free_calls==0);
 }else if(which=="copied"){
  f.press();on_data_free=[&](){f.but->apply_func=[](bContext&){assert(false&&"Deferred callback must own earlier function copy");};};f.event(LEFTMOUSE,KM_RELEASE);on_data_free={};assert(pending_actions.size()==1);f.but->apply_func={};f.block.buttons.clear();f.but=nullptr;assert(pending_actions[0].window==11&&pending_actions[0].screen==22&&pending_actions[0].session==33&&pending_actions[0].kind==1);assert(native_finish_calls==0);sweep_postponed(&f.win.modalhandlers);
 }else assert(false);
 }std::cout<<"PASS "<<which<<" native regional button state/exit/deferred callback gate; full WM/UI setup modeled\n";
}
"""

class PencilKnifeUIEntryTests(unittest.TestCase):
 @classmethod
 def setUpClass(cls):
  (OUT/'report.json').write_bytes((json.dumps({'status':'RUNNING_NATIVE_UI_ENTRY_GATE','pin':PIN})+'\n').encode())
  cls.cpp=OUT/'native-ui-entry.cc';cls.exe=OUT/('native-ui-entry.exe' if os.name=='nt' else 'native-ui-entry');cls.cpp.write_bytes(translation_unit().encode())
  compiler=shutil.which('clang++') or (str(Path('C:/Program Files/LLVM/bin/clang++.exe')) if Path('C:/Program Files/LLVM/bin/clang++.exe').exists() else shutil.which('g++'))
  if not compiler:raise RuntimeError('Native C++17 host compiler required')
  result=subprocess.run([compiler,'-std=c++17','-O'+OPTIONS.opt_level,'-g',str(cls.cpp),'-o',str(cls.exe)],capture_output=True,text=True,encoding='utf-8',errors='replace');(OUT/'compile.log').write_bytes((result.stdout+result.stderr).encode())
  if result.returncode:
   (OUT/'report.json').write_bytes((json.dumps({'status':'FAILED_NATIVE_UI_GATE_COMPILE','pin':PIN,'log':'compile.log'})+'\n').encode())
   raise RuntimeError('Native UI gate compilation failed; see '+str(OUT/'compile.log'))
  cls.results=[];cls.source_guards=set()
 @classmethod
 def tearDownClass(cls):
  complete={r['case'] for r in cls.results}=={'inside','outside','reenter','free','stale','deferred-stale','deactivate','copied'} and cls.source_guards=={'region','postpone'}
  report={'status':('PASS_SOURCE_EXECUTING_UI_ENTRY_GATE' if complete else 'PARTIAL_PASS_UI_ENTRY_GATE') if all(r['returncode']==0 for r in cls.results) else 'FAILED','opt_level':OPTIONS.opt_level,'source_guards_completed':sorted(cls.source_guards),'source_guards_count':len(cls.source_guards),'runtime_cases_count':len(cls.results),'pin':PIN,'source_hashes':{p:hashlib.sha256(source(p).encode()).hexdigest() for p in PATHS},'executed_complete_native_functions':list(SIGNATURES)+list(WM_SIGNATURES),'selected_native_dispatch_case':BUT_DISPATCH_CASE,'selected_wm_cleanup_body_sha256':hashlib.sha256(WM_POSTPONED_CLEANUP.encode()).hexdigest(),'native_function_sha256':{k:hashlib.sha256(v.encode()).hexdigest() for k,v in {**BODIES,**WM_BODIES}.items()},'fixture_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'patch_sha256':hashlib.sha256((REPO/'patches/blender-ipad.patch').read_bytes().replace(b'\r\n',b'\n')).hexdigest(),'cases':cls.results,'boundaries':['Initial native layout/highlighting and hit geometry configured by fixture; full WM/UI setup and UIKit delivery not executed.','ui_do_button unrelated shortcuts/type dispatch is an enabled-But exact selected-case adapter.','RNA, ring/Numbers policy, compositor receipt/current-owner admission, hit testing, list/allocation and external GPU/timer/undo/autokey calls are explicitly modeled; unsupported executed features fail assertions.','uiAfterFunc apply callback only queues a copied value-only Action; no native Knife Finish/Cancel, geometry/history/device proof.','Postponed WM cleanup executes the exact selected removal body; full WM scheduler remains source-guarded boundary.'],'source_or_production_changed':False,'device_acceptance':False};(OUT/'report.json').write_bytes((json.dumps(report,indent=2)+'\n').encode())
 def run_case(self,name):
  result=subprocess.run([str(self.exe),name],capture_output=True,text=True,encoding='utf-8',errors='replace');self.results.append({'case':name,'returncode':result.returncode,'stdout':result.stdout,'stderr':result.stderr});self.assertEqual(result.returncode,0,result.stdout+result.stderr)
 def test_inside_press_move_release_queues_once_after_native_cleanup(self):self.run_case('inside')
 def test_outside_release_does_not_apply(self):self.run_case('outside')
 def test_leave_then_reenter_uses_native_cancel_toggle(self):self.run_case('reenter')
 def test_active_free_cancels_without_application_or_userdata_reuse(self):self.run_case('free')
 def test_stale_origin_cancels_onfree_without_queue(self):self.run_case('stale')
 def test_afterfunc_revalidates_after_native_button_exit(self):self.run_case('deferred-stale')
 def test_window_deactivation_does_not_apply(self):self.run_case('deactivate')
 def test_queued_action_is_value_copy_and_never_native_finish(self):self.run_case('copied')
 def test_actual_region_entry_does_not_reject_modal_active_button(self):
  fn=BODIES['static int ui_region_handler('];self.assertLess(fn.index('ui_region_find_active_but(region)'),fn.index('ui_handle_button_event(C, event, but)'));self.assertNotIn('button_modal_state(',fn);self.assertLess(fn.index('ui_handle_button_event(C, event, but)'),fn.index('ui_apply_but_funcs_after(C)'));self.assertEqual(BODIES['static int ui_handle_region_semi_modal_buttons('].count('return WM_UI_HANDLER_CONTINUE;'),1);self.source_guards.add('region')
 def test_native_postponed_handler_skips_dispatch_before_cleanup(self):
  fn=function(WM,'static eHandlerActionFlag wm_handlers_do_intern(');flag=fn.index('if (handler_base->flag & WM_HANDLER_DO_FREE)');self.assertLess(flag,fn.index('handler_base->poll'));self.assertIn('if (BLI_findindex(handlers, handler_base) != -1)',fn);self.assertIn('BLI_remlink(handlers, handler_base);\n        wm_event_free_handler(handler_base);',fn);self.assertIn('true);',BODIES['static void button_activate_state(']);self.source_guards.add('postpone')

if __name__=='__main__':unittest.main(argv=[sys.argv[0]]+UNITTEST_ARGS)
