"""Execute shipped Mode geometry, owner receipts, button layout and queued cleanup.

Native lists/fonts/operators are modeled; target UIKit/modal/device proof is separate.
"""
import unittest
from pathlib import Path
import test_ipad_panels
from test_tool_ring import ring_source
from test_touch_extrude import changed_source
from test_compact_shelf import function

FONT_TYPES=(Path(__file__).parent/'fixtures/pinned_ui_font_style.hh').read_text(encoding='utf-8')

POLICY=ring_source().replace('#pragma once','')
NATIVE=changed_source('source/blender/editors/interface/regions/interface_region_menu_pie.cc')
IDENTITY='\n'.join(function(NATIVE,s) for s in (
 'static ipad_ring::RingContextIdentity ui_ipad_ring_identity(',
 'bool UI_ipad_context_capture(', 'bool UI_ipad_context_matches('))

WORLD=r'''
#include <cassert>
#include <algorithm>
#include <cstdint>
#include <cstring>
#include <string>
#include <memory>
#include <vector>
namespace ipad_ring=blender::ui::ipad;
template<class T>struct List{T *first=nullptr;};
template<class T>int BLI_findindex(const List<T> *list,const T *ptr){int i=0;for(auto *p=list->first;p;p=p->next,++i)if(p==ptr)return i;return -1;}
struct ID{unsigned int session_uid=1;};
struct Main{};
struct Object{ID id;void *data=nullptr;int mode=0;};
struct ViewLayer{ViewLayer *next=nullptr;Object *active=nullptr;};
struct Scene{ID id;List<ViewLayer> view_layers;};
struct RegionRuntime{bool visible=true;};
struct ARegion{ARegion *next=nullptr;RegionRuntime *runtime=nullptr;int regiontype=1;};
struct ScrArea{ScrArea *next=nullptr;List<ARegion> regionbase;int spacetype=2;};
struct bScreen{ID id;List<ScrArea> areabase;};
struct wmWindow{wmWindow *next=nullptr;bScreen *screen=nullptr;Scene *scene=nullptr;ViewLayer *layer=nullptr;int winid=17;};
struct wmWindowManager{ID id;List<wmWindow> windows;};
struct bContext{Main *main;wmWindowManager *wm;wmWindow *window;ScrArea *area;ARegion *region;Scene *scene;ViewLayer *layer;Object *object;};
constexpr int RGN_TYPE_WINDOW=1,SPACE_VIEW3D=2;
wmWindowManager *CTX_wm_manager(bContext *C){return C->wm;}
wmWindow *CTX_wm_window(bContext *C){return C->window;}
Main *CTX_data_main(bContext *C){return C->main;}
bScreen *WM_window_get_active_screen(wmWindow *w){return w->screen;}
Scene *WM_window_get_active_scene(wmWindow *w){return w->scene;}
ViewLayer *WM_window_get_active_view_layer(wmWindow *w){return w->layer;}
ScrArea *CTX_wm_area(bContext *C){return C->area;}
ARegion *CTX_wm_region(bContext *C){return C->region;}
Scene *CTX_data_scene(bContext *C){return C->scene;}
ViewLayer *CTX_data_view_layer(bContext *C){return C->layer;}
Object *CTX_data_active_object(bContext *C){return C->object;}
void BKE_view_layer_synced_ensure(Scene *,ViewLayer *){}
Object *BKE_view_layer_active_object_get(ViewLayer *l){return l->active;}
struct Fixture{
 Main main;ID data{11};Object object{{10},&data,0};ViewLayer layer{nullptr,&object};Scene scene{{9},{&layer}};
 RegionRuntime runtime;ARegion region{nullptr,&runtime};ScrArea area{nullptr,{&region}};
 bScreen screen{{8},{&area}};wmWindow window{nullptr,&screen,&scene,&layer};wmWindowManager wm{{7},{&window}};
 bContext C{&main,&wm,&window,&area,&region,&scene,&layer,&object};
};
'''

class TouchModeAccessTests(unittest.TestCase):
 def run_cpp(self,code):test_ipad_panels.IPadWorkspacePanelsTests()._run_source(POLICY+'\n'+code)

 def test_dynamic_translated_mode_geometry_and_separate_close_policy(self):
  self.run_cpp(r'''
#include <cassert>
#include <limits>
using namespace blender::ui::ipad;
int main(){
 for(float scale:{1.f,1.5f,2.f})for(int count=1;count<=12;++count)
 for(float label:{40.f,90.f,170.f})for(float width:{190.f,320.f,768.f}){
  Rect view{70*scale,(70+width)*scale,110*scale,950*scale};
  auto g=mode_menu_layout(20*scale,view,-100,1400,count,label*scale);
  if(!g.fits){assert(label+60>width-10);continue;}
  assert(g.buttons.size()==size_t(count));
  for(size_t i=0;i<g.buttons.size();++i){auto a=g.buttons[i];
   assert(a.xmin>=view.xmin&&a.xmax<=view.xmax&&a.ymin>=view.ymin&&a.ymax<=view.ymax);
   assert(a.xmax-a.xmin>=(label+60)*scale-.001f&&a.ymax-a.ymin>=44*scale-.001f);
   for(size_t j=i+1;j<g.buttons.size();++j){auto b=g.buttons[j];assert(!(a.xmin<b.xmax&&b.xmin<a.xmax&&a.ymin<b.ymax&&b.ymin<a.ymax));}
  }
 }
 assert(!mode_menu_layout(20,{0,320,0,90},0,0,6,70).fits);
 assert(!mode_menu_layout(20,{0,140,0,900},0,0,6,150).fits);
 for(int count:{0,33})assert(!mode_menu_layout(20,{0,800,0,900},0,0,count,40).fits);
 assert(!mode_menu_layout(20,{0,800,0,900},0,0,6,std::numeric_limits<float>::quiet_NaN()).fits);
 assert(ring_kind("VIEW3D_MT_ipad_modes")==RingKind::Mode);
 assert(ring_kind("VIEW3D_MT_ipad_modes_extra")==RingKind::None);
 for(const char *op:{"OBJECT_OT_mode_set","MESH_OT_select_mode","VIEW3D_OT_ipad_transform_option"})assert(!ring_setting_stays_open(RingKind::Mode,op));
}
''')

 def test_actual_native_identity_rejects_overrides_rebinding_and_removed_owners(self):
  self.run_cpp(WORLD+IDENTITY+r'''
int main(){
 Fixture f;auto *C=&f.C;uint64_t saved[13];assert(UI_ipad_context_capture(C,saved));assert(UI_ipad_context_matches(C,saved));
 auto fail=[&](){assert(!UI_ipad_context_matches(C,saved));};
 ++f.data.session_uid;fail();--f.data.session_uid;
 ++f.object.id.session_uid;fail();--f.object.id.session_uid;
 ++f.scene.id.session_uid;fail();--f.scene.id.session_uid;
 ++f.screen.id.session_uid;fail();--f.screen.id.session_uid;
 ++f.wm.id.session_uid;fail();--f.wm.id.session_uid;
 ++f.window.winid;fail();--f.window.winid;
 f.object.mode=1;fail();f.object.mode=0;
 ID replacement{12};f.object.data=&replacement;fail();f.object.data=&f.data;
 Object override=f.object;C->object=&override;fail();C->object=&f.object;
 f.wm.windows.first=nullptr;fail();f.wm.windows.first=&f.window;
 f.screen.areabase.first=nullptr;fail();f.screen.areabase.first=&f.area;
 f.area.regionbase.first=nullptr;fail();f.area.regionbase.first=&f.region;
 f.scene.view_layers.first=nullptr;fail();f.scene.view_layers.first=&f.layer;
 f.runtime.visible=false;fail();f.runtime.visible=true;
 ViewLayer another{nullptr,&f.object};f.layer.next=&another;C->layer=&another;fail();C->layer=&f.layer;
 Main replacement_main;C->main=&replacement_main;fail();C->main=&f.main;
 C->object=nullptr;f.layer.active=nullptr;assert(UI_ipad_context_capture(C,saved));
 assert(saved[7]==0&&saved[8]==0&&UI_ipad_context_matches(C,saved));
}
''')

 def test_popup_receipt_survives_destruction_and_rejected_actions_free_properties(self):
  handlers=changed_source('source/blender/editors/interface/interface_handlers.cc')
  capture=handlers[handlers.index('    if ((block->pie_data.flags & UI_PIE_IPAD_TOOLS)'):handlers.index('  after->rnapoin = but->rnapoin;')]
  capture=capture.rsplit('\n  }',1)[0]
  action=handlers[handlers.index('    bool ipad_ring_allowed ='):handlers.index('    if (after.rnapoin.data && allowed())')]
  header=changed_source('source/blender/editors/interface/interface_intern.hh')
  begin=header.index('class uiIPadActionOriginScope {')
  scope=header[begin:header.index('\n};',begin)+3]
  popup='static thread_local ipad_ring::ActionOrigin ui_ipad_scoped_action_origin;\n'+scope+'\n'+'\n'.join(function(NATIVE,s) for s in (
   'uiIPadActionOriginScope::uiIPadActionOriginScope(',
   'uiIPadActionOriginScope::~uiIPadActionOriginScope(',
   'std::string ui_ipad_ring_tool_identity(',
   'bool ui_ipad_action_origin_valid(',
   'bool ui_ipad_ring_action_capture('))
  self.run_cpp(WORLD+IDENTITY+r'''
#define WITH_APPLE_CROSSPLATFORM
#define STREQ(a,b) (std::strcmp(a,b)==0)
constexpr int UI_PIE_IPAD_TOOLS=256,UI_PIE_IPAD_MODE=1024,NC_SPACE=1,ND_SPACE_VIEW3D=2;
struct bToolRef{std::string idname;};bToolRef live_tool{"builtin.move"};bool has_tool=true;int tool_lookups=0;
bToolRef *WM_toolsystem_ref_from_context(const bContext *){++tool_lookups;return has_tool?&live_tool:nullptr;}
struct PointerRNA{int value=0;};struct wmOperatorType{const char *idname="OBJECT_OT_mode_set";};
struct uiIPadRingData{ipad_ring::RingContextIdentity context;uint64_t lifetime=1;std::string tool_identity="builtin.move";bool input_suspended=false;};
struct uiPopupBlockHandle{struct{void *arg=nullptr;}popup_create_vars;};
struct uiBlock{struct{int flags=UI_PIE_IPAD_MODE;}pie_data;uiPopupBlockHandle *handle;};
struct uiBut{wmOperatorType *optype=nullptr;int opcontext=1;PointerRNA *opptr=nullptr;};
struct uiIPadOperatorReceipt{wmOperatorType *type=nullptr;};
struct After{bool ipad_ring_guarded=false;uint64_t ipad_ring_context[13]={};std::string ipad_ring_tool;uint64_t ipad_ring_lifetime=0;std::string ipad_ring_selection_target;wmOperatorType *optype=nullptr;int opcontext=0;PointerRNA *opptr=nullptr;std::string drawstr;ipad_ring::ActionOrigin ipad_action_origin{};uiIPadOperatorReceipt ipad_operator{};};
wmOperatorType *ui_ipad_operator_resolve(const uiIPadOperatorReceipt &receipt){return receipt.type;}
namespace blender::wm{using OpCallContext=int;}
bool safe=true;int calls=0,frees=0,notifiers=0,safety_checks=0;
bool WM_event_ipad_mode_safe(bContext *){++safety_checks;return safe;}
bool ui_ipad_ring_context_valid(bContext *C,const uiBlock *b){auto *p=static_cast<uiIPadRingData*>(b->handle->popup_create_vars.arg);return p&&UI_ipad_context_matches(C,ipad_ring::context_values(p->context).data());}
bool ui_ipad_ring_waits_for_draw(const uiBlock *b){auto *p=static_cast<uiIPadRingData*>(b->handle->popup_create_vars.arg);return !p||p->input_suspended;}
std::string ui_ipad_ring_selection_target(bContext *,const uiBut *){return {};}
void ui_ipad_ring_selection_rebase(bContext *,const uint64_t *,const std::string &,const std::string &,uint64_t){}
POPUP
void transfer(bContext *C,uiBlock *block,uiBut *but,After *after){after->ipad_operator.type=but->optype;CAPTURE}
void WM_operator_name_call_ptr_with_depends_on_cursor(bContext *C,wmOperatorType *,int,PointerRNA *,void *,std::string){++calls;C->object->mode=1;}
void WM_main_add_notifier(int,void *){++notifiers;}
void WM_operator_properties_free(PointerRNA *){++frees;}
void dispatch(bContext *C,After after){const auto allowed=[&](){return ui_ipad_action_origin_valid(C,after.ipad_action_origin);};PointerRNA opptr;ACTION}
int main(){
 Fixture f;wmOperatorType ot;PointerRNA props{3};
 auto queue=[&](int flags=UI_PIE_IPAD_TOOLS|UI_PIE_IPAD_MODE){
  auto *payload=new uiIPadRingData{ui_ipad_ring_identity(&f.C),1,has_tool?live_tool.idname:std::string{}};
  uiPopupBlockHandle handle{{payload}};uiBlock block{{flags},&handle};uiBut but{&ot,1,&props};After after;
  transfer(&f.C,&block,&but,&after);assert(after.ipad_ring_guarded&&after.ipad_ring_tool==live_tool.idname&&after.opptr==&props&&!but.opptr&&!but.optype);
  delete payload;handle.popup_create_vars.arg=nullptr;return after;
 };
 auto valid=queue();dispatch(&f.C,valid);assert(calls==1&&frees==1&&notifiers==1&&safety_checks==1);f.object.mode=0;
 auto stale=queue();++f.data.session_uid;dispatch(&f.C,stale);assert(calls==1&&frees==2&&safety_checks==1);--f.data.session_uid;
 auto modal=queue();safe=false;dispatch(&f.C,modal);assert(calls==1&&frees==3&&safety_checks==2);safe=true;
 auto removed=queue();f.area.regionbase.first=nullptr;dispatch(&f.C,removed);assert(calls==1&&frees==4&&safety_checks==2);f.area.regionbase.first=&f.region;
 auto changed_layer=queue();ViewLayer other{nullptr,&f.object};f.layer.next=&other;f.C.layer=&other;f.window.layer=&other;dispatch(&f.C,changed_layer);assert(calls==1&&frees==5&&safety_checks==2);
 After unguarded;unguarded.optype=&ot;unguarded.opptr=&props;dispatch(&f.C,unguarded);assert(calls==2&&frees==6&&notifiers==1);
 f.C.layer=&f.layer;f.window.layer=&f.layer;f.object.mode=0;
 // A same-mode tool change is absent from context13, but rejects the queued action.
 auto changed_tool=queue(UI_PIE_IPAD_TOOLS);live_tool.idname="builtin.rotate";
 int old_calls=calls,old_checks=safety_checks;
 dispatch(&f.C,changed_tool);assert(calls==old_calls&&frees==7&&safety_checks==old_checks);live_tool.idname="builtin.move";
 // All named owned ring operators use the receipt, not just mode_set.
 for(const char *id:{"WM_OT_tool_set_by_id","VIEW3D_OT_ipad_native_tool","VIEW3D_OT_ipad_transform_axis","MESH_OT_select_mode","ED_OT_undo","ED_OT_redo","WM_OT_context_set_id","WM_OT_call_menu_pie"}){
  ot.idname=id;auto queued=queue(UI_PIE_IPAD_TOOLS);old_calls=calls;dispatch(&f.C,queued);assert(calls==old_calls+1);f.object.mode=0;
 }
 // Invalid live owners short-circuit before any native tool lookup.
 auto lost=queue(UI_PIE_IPAD_TOOLS);int old_lookups=tool_lookups;f.area.regionbase.first=nullptr;
 old_calls=calls;dispatch(&f.C,lost);assert(calls==old_calls&&tool_lookups==old_lookups);f.area.regionbase.first=&f.region;
 // No active tool is a valid scalar empty identity; a newly bound tool invalidates it.
 live_tool.idname.clear();has_tool=false;auto empty=queue(UI_PIE_IPAD_TOOLS);has_tool=true;live_tool.idname="builtin.select_box";old_calls=calls;
 dispatch(&f.C,empty);assert(calls==old_calls);
 assert(frees==17);
}
'''.replace('POPUP',popup).replace('CAPTURE',capture).replace('ACTION',action))

 def test_native_mode_buttons_have_observed_state_and_fail_closed(self):
  start=NATIVE.index('  if (kind == ipad_ring::RingKind::Mode) {',NATIVE.index('static uiBlock *ui_ipad_ring_create('))
  start=NATIVE.index('  if (kind == ipad_ring::RingKind::Mode) {',start+1)
  end=NATIVE.index('  const auto geometry = ipad_ring::tool_ring_layout',start)
  fragment=NATIVE[start:end]
  self.run_cpp(r"""
#include <cassert>
#include <cstring>
#include <memory>
#include <string>
namespace ipad_ring=blender::ui::ipad;
#define STREQ(a,b) (std::strcmp(a,b)==0)
constexpr int UI_SELECT_DRAW=1,UI_BUT_UNDO=2,UI_HIDDEN=4,UI_BUT_DISABLED=8;
constexpr int UI_RADIAL_NONE=0,UI_BUT_ALIGN_TOP=1,UI_BUT_ALIGN_DOWN=2,UI_BUT_ALIGN_LEFT=4,UI_BUT_ALIGN_RIGHT=8,RPT_INFO=1;
constexpr float UI_UNIT_X=20;
namespace blender::ui{enum class EmbossType{Emboss};}
struct PointerRNA{int mode=0;};struct wmOperatorType{const char *idname="OBJECT_OT_mode_set";};
struct uiBut{wmOperatorType *optype;PointerRNA *opptr;std::string str;ipad_ring::Rect rect{};int flag=UI_BUT_UNDO,pie_dir=2,alignnr=1,drawflag=15;blender::ui::EmbossType emboss=blender::ui::EmbossType::Emboss;};
template<class T>struct Vector:std::vector<T>{bool is_empty()const{return this->empty();}};
struct uiBlock{Vector<std::unique_ptr<uiBut>> buttons;};
struct Object{int mode=1;};struct bContext{Object *object;};
struct uiPopupBlockHandle{int menuretval=0;};constexpr int UI_RETURN_CANCEL=1;
PINNED_FONT_TYPES
struct Data{int anchor[2]={100,100};};uiStyle style{};
const uiStyle *UI_style_get_dpi(){return &style;}
int UI_fontstyle_string_width(const uiFontStyle *,const char *str){return int(std::strlen(str))*8;}
void BLI_rctf_init(ipad_ring::Rect *r,float a,float b,float c,float d){*r={a,b,c,d};}
Object *CTX_data_active_object(bContext *C){return C->object;}
bContext *CTX_wm_reports(bContext *C){return C;}
void BKE_report(bContext *,int,const char *){}
void UI_block_bounds_set_normal(uiBlock *,int){}
int RNA_enum_get(PointerRNA *p,const char *){return p->mode;}
uiBlock *layout(bContext *C,uiBlock *block,uiPopupBlockHandle *handle,Data data,ipad_ring::Rect viewport){auto kind=ipad_ring::RingKind::Mode;FRAGMENT return nullptr;}
int main(){wmOperatorType ot;PointerRNA modes[3]{{0},{1},{2}};uiBlock block;
 for(int i=0;i<3;++i)block.buttons.push_back(std::make_unique<uiBut>(uiBut{&ot,&modes[i],"Mode"}));
 Object object;bContext C{&object};uiPopupBlockHandle handle;Data data;
 assert(layout(&C,&block,&handle,data,{0,400,0,500})==&block&&!handle.menuretval);
 for(int i=0;i<3;++i){auto &b=*block.buttons[i];assert(bool(b.flag&UI_SELECT_DRAW)==(i==1));assert(!(b.flag&UI_BUT_UNDO)&&b.alignnr==0&&b.pie_dir==0&&b.drawflag==0);assert(b.rect.ymax-b.rect.ymin==44);}
 object.mode=2;layout(&C,&block,&handle,data,{0,400,0,500});assert(block.buttons[2]->flag&UI_SELECT_DRAW);assert(!(block.buttons[1]->flag&UI_SELECT_DRAW));
 block.buttons[0]->opptr=nullptr;layout(&C,&block,&handle,data,{0,400,0,500});assert(handle.menuretval==UI_RETURN_CANCEL);
 for(auto &b:block.buttons)assert((b->flag&(UI_HIDDEN|UI_BUT_DISABLED))==(UI_HIDDEN|UI_BUT_DISABLED));
 block.buttons[0]->opptr=&modes[0];handle.menuretval=0;layout(&C,&block,&handle,data,{0,400,0,50});assert(handle.menuretval==UI_RETURN_CANCEL);
}
""".replace('FRAGMENT',fragment).replace('PINNED_FONT_TYPES',FONT_TYPES))

 def test_native_header_allocation_and_target_height_share_one_predicate(self):
  source=changed_source('source/blender/editors/screen/area.cc')
  predicate=function(source,'static bool ipad_touch_header(')
  start=source.index('    prefsizey = ED_area_headersize();');end=source.index('\n  }',start)
  allocation=source[start:end]
  start=source.index('  int button_height = UI_UNIT_Y;');end=source.index('  const float buttony_scale',start)
  buttons=source[start:end]
  test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r"""
#define WITH_APPLE_CROSSPLATFORM
#include <cassert>
#include <algorithm>
#include <initializer_list>
constexpr int SPACE_VIEW3D=2,RGN_TYPE_HEADER=1;
float scale=1;
#define UI_SCALE_FAC scale
#define UI_UNIT_Y (20*scale)
int min_ii(int a,int b){return std::min(a,b);}int max_ii(int a,int b){return std::max(a,b);}
struct ScrArea{int spacetype=SPACE_VIEW3D;struct{int ipad_layer=1;}runtime;};
struct ARegion{int regiontype=RGN_TYPE_HEADER,winy=0;};
int ED_area_headersize(){return int(26*scale);}
PREDICATE
int preferred(ScrArea *area,ARegion *region){int prefsizey;ALLOC return prefsizey;}
int height(ScrArea *area,ARegion *region){BUTTONS return buttony;}
int main(){ScrArea area;ARegion region;
 for(float s:{1.f,1.5f,2.f}){scale=s;region.winy=preferred(&area,&region);assert(region.winy==int(48*scale));assert(height(&area,&region)>=int(44*scale));
  area.runtime.ipad_layer=0;region.winy=preferred(&area,&region);assert(region.winy==int(26*scale));assert(height(&area,&region)==int(20*scale));area.runtime.ipad_layer=1;
  area.spacetype=9;region.winy=preferred(&area,&region);assert(region.winy==int(26*scale));area.spacetype=SPACE_VIEW3D;
  region.regiontype=9;region.winy=preferred(&area,&region);assert(region.winy==int(26*scale));region.regiontype=RGN_TYPE_HEADER;
 }
}
""".replace('PREDICATE',predicate).replace('ALLOC',allocation+'\n').replace('BUTTONS',buttons))

 def test_actual_mode_modal_guard_requires_drained_recovery_and_owners(self):
  source=changed_source('source/blender/windowmanager/intern/wm_event_system.cc')
  helper=function(source,'bool WM_event_ipad_mode_safe(')
  test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#include <cassert>
#include <initializer_list>
#define LISTBASE_FOREACH(type,var,list) for(type var=(list)->first;var;var=var->next)
constexpr int WM_HANDLER_TYPE_GIZMO=2,WM_JOB_TYPE_ANY=1;
namespace blender::bke{enum class TouchUndoPhase{Empty,PendingInvoke,Cancelled};}
using blender::bke::TouchUndoPhase;
struct wmEventHandler{wmEventHandler *next=nullptr;int type=0;};
struct wmWindow{struct{wmEventHandler *first=nullptr;}modalhandlers;};
struct Scene{};struct Runtime{struct{TouchUndoPhase phase=TouchUndoPhase::Empty;}touch_undo_recovery;};
struct wmWindowManager{int op_undo_depth=0;Runtime *runtime;};
struct bContext{wmWindowManager *wm;wmWindow *window;Scene *scene;};
struct{bool moving=false;}G;
bool op_safe=true,jobs=false;
wmWindowManager *CTX_wm_manager(bContext *C){return C->wm;}
wmWindow *CTX_wm_window(bContext *C){return C->window;}
Scene *CTX_data_scene(bContext *C){return C->scene;}
bool WM_jobs_test(wmWindowManager *,Scene *,int){return jobs;}
bool WM_event_touch_undo_safe(wmWindow *){return op_safe;}
HELPER
int main(){Runtime runtime;wmWindowManager wm{0,&runtime};wmWindow win;Scene scene;bContext C{&wm,&win,&scene};
 assert(WM_event_ipad_mode_safe(&C));
 G.moving=true;assert(!WM_event_ipad_mode_safe(&C));G.moving=false;
 jobs=true;assert(!WM_event_ipad_mode_safe(&C));jobs=false;
 op_safe=false;assert(!WM_event_ipad_mode_safe(&C));op_safe=true;
 for(auto phase:{TouchUndoPhase::PendingInvoke,TouchUndoPhase::Cancelled}){runtime.touch_undo_recovery.phase=phase;assert(!WM_event_ipad_mode_safe(&C));}runtime.touch_undo_recovery.phase=TouchUndoPhase::Empty;
 wm.op_undo_depth=1;assert(!WM_event_ipad_mode_safe(&C));wm.op_undo_depth=0;
 wmEventHandler handler{nullptr,WM_HANDLER_TYPE_GIZMO};win.modalhandlers.first=&handler;assert(!WM_event_ipad_mode_safe(&C));handler.type=0;assert(WM_event_ipad_mode_safe(&C));
}
'''.replace('HELPER',helper))

if __name__=='__main__':unittest.main()
