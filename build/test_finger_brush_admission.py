"""Execute connected Finger canvas, callback and queued-group policy.

GPU commands, native list ownership, UIKit scheduling and brush geometry remain
modeled. These tests establish source behavior, not target delivery/acceptance.
"""
import unittest
from pathlib import Path
from test_touch_extrude import changed_source
from test_compact_shelf import function
import test_ipad_panels

IOS=changed_source('intern/ghost/intern/GHOST_WindowIOS.mm')
WM=changed_source('source/blender/windowmanager/intern/wm_event_system.cc')
DRAW=changed_source('source/blender/windowmanager/intern/wm_draw.cc')
GHOST=changed_source('intern/ghost/GHOST_NavigationIOS.hh').replace('#pragma once','')
CPP=r"""
#define _CRT_SECURE_NO_WARNINGS
#include <cassert>
#include <algorithm>
#include <array>
#include <cstdint>
#include <cstring>
#include <vector>
#include <string>
#include <utility>
#include <type_traits>
#define WITH_APPLE_CROSSPLATFORM
#define UNUSED_VARS(...) (void)(__VA_ARGS__)
#define LISTBASE_FOREACH(type,var,list) for(type var : (list)->items)
#define LISTBASE_FOREACH_MUTABLE(type,var,list) for(type var : (list)->items)
template<class T>struct List{std::vector<T*>items;T*first=nullptr;void add(T*p){items.push_back(p);first=items.front();}};
template<class T>int BLI_findindex(const List<T>*l,T*p){auto it=std::find(l->items.begin(),l->items.end(),p);return it==l->items.end()?-1:int(it-l->items.begin());}
"""
class FingerBrushAdmissionTests(unittest.TestCase):
 def run_cpp(self,s):test_ipad_panels.IPadWorkspacePanelsTests()._run_source(CPP+s)
 def test_actual_physical_acquisition_priority_rectangles_and_frozen_queue(self):
  self.run_cpp(GHOST+r"""
using namespace ghost::ios;
int main(){int w=0,other=0;NavigationRect canvas{0,0,500,500};
 for(int i=0;i<10000;++i){auto token=new_finger_paint_texture();set_finger_paint_regions(&w,{{canvas,token}});
  assert(finger_paint_at_start(&w,100,100)==token);assert(!finger_paint_at_start(&other,100,100));
  auto frozen=finger_paint_at_start(&w,100,100);set_finger_paint_regions(&w,{});
  assert(!finger_paint_at_start(&w,100,100)&&frozen==token);
  set_finger_paint_regions(&w,{{canvas,token}});set_navigation_regions(&w,{{80,80,120,120}});
  assert(!finger_paint_at_start(&w,100,100));set_navigation_regions(&w,{});
  publish_pencil_ring(&w,{new_pencil_ring_lifetime(),1,{10,10,30,30}});
  assert(!finger_paint_at_start(&w,100,100));forget_navigation_window(&w);
 }
 for(int scale:{1,2,3}){auto parts=finger_paint_subtract({{0,0,100*scale,100*scale}},{20*scale,30*scale,60*scale,80*scale});
  for(int x=0;x<=100*scale;++x)for(int y=0;y<=100*scale;++y){int count=0;for(auto p:parts)count+=p.contains(x,y);
   assert(count==int(!(x>=20*scale&&x<=60*scale&&y>=30*scale&&y<=80*scale)));}}
 finger_paint_texture_next=UINT64_MAX-1;assert(new_finger_paint_texture()==UINT64_MAX-1);
 assert(new_finger_paint_texture()==0&&new_finger_paint_texture()==0);
}
""")
 def test_actual_early_group_guard_before_pointer_and_cross_window_effects(self):
  body=WM[WM.index('void wm_event_add_ghostevent('):]
  start=body.index('#ifdef WITH_APPLE_CROSSPLATFORM\n  /* Keyboard modifiers')
  end=body.index('  /**\n   * Having both,')
  prefix=body[start:end]
  self.assertLess(body.index('ipad_finger_paint_generation) return'),body.index('wmEvent event,'))
  self.run_cpp(GHOST+r"""
enum{GHOST_kEventKeyDown=1,GHOST_kEventKeyUp=2,GHOST_kEventCursorMove=3,GHOST_kEventButtonDown=4,GHOST_kEventButtonUp=5};
template<class... T>bool ELEM(int v,T...a){return ((v==a)||...);}
struct GHOST_TEventCursorData{bool is_direct_finger;uint64_t ipad_finger_paint_generation;};
using GHOST_TEventButtonData=GHOST_TEventCursorData;
struct wmWindow{void*ghostwin;int modifier=0;};struct wmWindowManager{List<wmWindow>windows;};
int pointer_mutations=0,modal_calls=0,redirects=0;
void deliver(wmWindowManager*wm,int type,const void*customdata){
"""+prefix+r"""
 ++pointer_mutations;++modal_calls;++redirects;
}
int main(){int key1=0,key2=0;wmWindow a{&key1},b{&key2};wmWindowManager wm;wm.windows.add(&a);wm.windows.add(&b);
 for(int i=0;i<10000;++i){GHOST_TEventCursorData frozen{true,uint64_t(i+1)};
  for(int phase:{GHOST_kEventCursorMove,GHOST_kEventButtonDown,GHOST_kEventButtonUp}){
   a.modifier=phase;deliver(&wm,phase,&frozen);}
 }
 assert(pointer_mutations==0&&modal_calls==0&&redirects==0);
 for(auto p:{GHOST_TEventCursorData{false,8},GHOST_TEventCursorData{true,0},GHOST_TEventCursorData{false,0}})
  for(int phase:{GHOST_kEventCursorMove,GHOST_kEventButtonDown,GHOST_kEventButtonUp})deliver(&wm,phase,&p);
 assert(pointer_mutations==9&&modal_calls==9&&redirects==9);
 ghost::ios::set_finger_paint_regions(&key1,{{{0,0,10,10},1}});ghost::ios::set_finger_paint_regions(&key2,{{{0,0,10,10},2}});
 deliver(&wm,GHOST_kEventKeyDown,nullptr);assert(!ghost::ios::finger_paint_at_start(&key1,1,1)&&!ghost::ios::finger_paint_at_start(&key2,1,1));
}
""")
 def test_actual_typed_capture_and_native_callback_allocation_admission(self):
  screen=changed_source('source/blender/editors/screen/screen_ipad_panels.cc')
  self.run_cpp(r"""
enum{OB_MESH=1,OB_MODE_SCULPT=2,OB_MODE_VERTEX_PAINT=4,OB_MODE_WEIGHT_PAINT=8,OB_MODE_TEXTURE_PAINT=16,TOOLREF_FLAG_USE_BRUSHES=1,BRUSH_CURVE=1,WM_EVENT_IS_DIRECT_FINGER=256};
struct IPadFingerPaintOwner{std::array<uint64_t,19>values{};std::array<char,64>tool{};bool valid=false;};
struct ID{uint64_t session_uid=10;};struct Brush{ID id;int flag=0;};struct Paint{Brush*brush;};struct Sculpt{Paint paint;};
struct ToolSettings{Sculpt*sculpt,*vpaint,*wpaint;Sculpt imapaint;};struct Scene{ToolSettings*toolsettings;};
struct Object{int type=OB_MESH,mode=OB_MODE_SCULPT;};struct ToolRuntime{int flag=TOOLREF_FLAG_USE_BRUSHES;};struct bToolRef{ToolRuntime*runtime;char idname_pending[64]{},idname[64]="builtin.brush";};
struct UndoStack{uint64_t ipad_lifetime_id=11,ipad_mutation_generation=12;};struct Runtime{UndoStack*undo_stack;};struct wmWindowManager{Runtime*runtime;};
struct wmEvent{int flag,modifier=0,keymodifier=0;};struct bContext{Object*object;Scene*scene;bToolRef*tool;wmWindowManager*wm;bool admitted=true;};
bool UI_ipad_context_capture(bContext*C,uint64_t*v){if(!C->admitted)return false;for(int i=0;i<13;++i)v[i]=i;v[9]=C->object->mode;return true;}
Object*CTX_data_active_object(bContext*C){return C->object;}Scene*CTX_data_scene(bContext*C){return C->scene;}
const bToolRef*WM_toolsystem_ref_from_context(bContext*C){return C->tool;}wmWindowManager*CTX_wm_manager(bContext*C){return C->wm;}
Brush*BKE_paint_brush(Paint*p){return p?p->brush:nullptr;} // native callback-free getter boundary
void BLI_strncpy(char*d,const char*s,size_t n){std::strncpy(d,s,n);d[n-1]=0;}
"""+function(screen,'bool ED_ipad_finger_paint_capture(')+function(screen,'bool ED_ipad_finger_brush_invoke_block(')+r"""
int main(){Brush brush;Sculpt paint{{&brush}};ToolSettings ts{&paint,&paint,&paint,paint};Scene scene{&ts};Object object;ToolRuntime tr;bToolRef tool{&tr};UndoStack undo;Runtime runtime{&undo};wmWindowManager wm{&runtime};bContext C{&object,&scene,&tool,&wm};
 wmEvent finger{WM_EVENT_IS_DIRECT_FINGER},pencil{0};IPadFingerPaintOwner receipt;
 for(int mode:{OB_MODE_SCULPT,OB_MODE_VERTEX_PAINT,OB_MODE_WEIGHT_PAINT,OB_MODE_TEXTURE_PAINT}){object.mode=mode;
  assert(ED_ipad_finger_paint_capture(&C,receipt)&&receipt.valid&&receipt.values[9]==uint64_t(mode));
  assert(receipt.values[17]==uintptr_t(&ts)&&receipt.values[18]&&receipt.values[16]==brush.id.session_uid);
  assert(ED_ipad_finger_brush_invoke_block(&C,&finger,mode));assert(!ED_ipad_finger_brush_invoke_block(&C,&pencil,mode));
  finger.modifier=1;assert(!ED_ipad_finger_brush_invoke_block(&C,&finger,mode));finger.modifier=0;
  finger.keymodifier=1;assert(!ED_ipad_finger_brush_invoke_block(&C,&finger,mode));finger.keymodifier=0;
 }
 object.mode=OB_MODE_SCULPT;auto original=receipt;assert(ED_ipad_finger_paint_capture(&C,original));
 ++undo.ipad_mutation_generation;assert(ED_ipad_finger_paint_capture(&C,receipt)&&receipt.values!=original.values);
 ToolSettings second=ts;scene.toolsettings=&second;assert(ED_ipad_finger_paint_capture(&C,receipt)&&receipt.values[17]!=original.values[17]);scene.toolsettings=&ts;
 ts.sculpt=nullptr;assert(!ED_ipad_finger_paint_capture(&C,receipt));ts.sculpt=&paint;
 scene.toolsettings=nullptr;assert(!ED_ipad_finger_paint_capture(&C,receipt));scene.toolsettings=&ts;
 brush.flag=BRUSH_CURVE;assert(!ED_ipad_finger_paint_capture(&C,receipt));brush.flag=0;
 tool.idname_pending[0]='x';assert(!ED_ipad_finger_paint_capture(&C,receipt));tool.idname_pending[0]=0;
 tr.flag=0;assert(!ED_ipad_finger_paint_capture(&C,receipt));tr.flag=1;
 object.type=0;assert(!ED_ipad_finger_paint_capture(&C,receipt));object.type=OB_MESH;object.mode=99;assert(!ED_ipad_finger_paint_capture(&C,receipt));
 C.admitted=false;assert(!ED_ipad_finger_paint_capture(&C,receipt)&&!receipt.valid);
}
""")
  for path,sig,allocation in [('sculpt.cc','static wmOperatorStatus sculpt_brush_stroke_invoke(','paint_stroke_new'),('paint_vertex.cc','static wmOperatorStatus vpaint_invoke(','paint_stroke_new'),('paint_weight.cc','static wmOperatorStatus wpaint_invoke(','paint_stroke_new'),('paint_image_ops_paint.cc','static wmOperatorStatus paint_invoke(','paint_stroke_new')]:
   s=changed_source('source/blender/editors/sculpt_paint/'+path)
   # Native status spellings vary at the pin; locate the actual named callback.
   if sig not in s:sig=sig.replace('wmOperatorStatus','int')
   body=function(s,sig)
   self.assertLess(body.index('ED_ipad_finger_brush_invoke_block'),body.index(allocation))
   self.assertIn('return OPERATOR_CANCELLED;',body[:body.index(allocation)])
 def test_actual_modal_registration_clears_only_target_window_before_link(self):
  body=function(WM,'wmEventHandler_UI *WM_event_add_ui_handler(')
  guard=body[body.index('#ifdef WITH_APPLE_CROSSPLATFORM'):body.index('  wmEventHandler_UI *handler =')]
  self.run_cpp(GHOST+r"""
struct wmWindow{void*ghostwin;List<int>modalhandlers;};struct wmWindowManager{List<wmWindow>windows;};struct bContext{wmWindowManager*wm;};
wmWindowManager*CTX_wm_manager(const bContext*C){return C->wm;}
void focus(const bContext*C,List<int>*handlers){
"""+guard+r"""
}
int main(){int a=0,b=0;wmWindow w{&a,{}},other{&b,{}};wmWindowManager wm;wm.windows.add(&w);wm.windows.add(&other);bContext C{&wm};List<int>region;
 using namespace ghost::ios;set_finger_paint_regions(&a,{{{0,0,10,10},1}});set_finger_paint_regions(&b,{{{0,0,10,10},2}});
 auto old=finger_paint_at_start(&b,1,1);focus(nullptr,&region);focus(&C,&region);assert(finger_paint_at_start(&a,1,1)==1&&finger_paint_at_start(&b,1,1)==2);
 focus(&C,&other.modalhandlers);assert(!finger_paint_at_start(&b,1,1)&&old==2&&finger_paint_at_start(&a,1,1)==1);
}
""")
 def test_actual_payload_producers_and_physical_pan_cancel(self):
  for phase in ('Tap','Pan'):
   implementation=IOS.split('@implementation GHOSTUI'+phase+'GestureRecognizer',1)[1].split('@end',1)[0]
   self.assertIn('gestureUsesFinger',implementation)
  tap=function(IOS,'- (void)handleTap:(GHOSTUITapGestureRecognizer *)sender\n{')
  self.assertIn('event_info.direct_finger = [sender gestureUsesFinger]',tap)
  self.assertIn('[sender fingerPaintGeneration]',tap)
  begin=function(IOS.split('@implementation GHOSTUITapGestureRecognizer',1)[1],'- (void)touchesBegan:')
  self.assertLess(begin.index('finger_paint_at_start'),begin.index('[super touchesBegan:'))
  pan=function(IOS,'- (void)handlePan:(GHOSTUIPanGestureRecognizer *)sender\n{')
  self.assertIn('pointer_finger_contact = [sender gestureUsesFinger]',pan)
  self.assertEqual(pan.count('direct_finger = pointer_finger_contact'),2) # Motion and terminal share one event record
  cancel=function(IOS,'- (void)cancelPointerCapture\n{')
  self.assertIn('direct_finger = pointer_finger_contact',cancel)
  self.assertLess(cancel.index('direct_finger = pointer_finger_contact'),cancel.index('pointer_finger_contact = false'))
  keyboard=function(IOS,'- (void)externalKeyboardChange:')
  self.assertLess(keyboard.index('finger_paint_regions.clear()'),keyboard.index('sys->pushEvent(new GHOST_EventKey'))
  for name in ('Button','Cursor'):
   h=changed_source('intern/ghost/intern/GHOST_Event'+name+'.hh')
   self.assertIn('bool is_direct_finger = false',h);self.assertIn('uint64_t ipad_finger_paint_generation = 0',h)
  events=function(IOS,'- (void)generateUserInputEvents:')
  self.assertEqual(events.count('event_info.direct_finger, event_info.finger_paint_generation'),3)
 def test_actual_completed_frame_cached_texture_and_modal_widget_admission(self):
  helpers=DRAW[DRAW.index('struct wmIPadFingerPaintCandidate {'):DRAW.index('\n#endif',DRAW.index('struct wmIPadFingerPaintCandidate {'))]
  self.run_cpp(GHOST+r"""
struct rcti{int xmin,ymin,xmax,ymax;};
struct wmDrawBuffer{uint64_t ipad_finger_paint_generation=0;int ipad_finger_paint_region[4]{},ipad_finger_paint_rect[4]{},ipad_finger_paint_navigation[4]{};bool ipad_finger_paint_unknown_widgets=false,ipad_finger_paint_navigation_present=false;};
static_assert(std::is_trivially_copyable_v<wmDrawBuffer>);
struct RegionType{List<int>drawcalls;};struct Runtime{bool visible=true;wmDrawBuffer*draw_buffer;bool ipad_finger_paint_overlay_blocked=false,ipad_finger_paint_navigation_drawn=false,ipad_editing_shelf_presented=false;RegionType*type=nullptr;rcti ipad_editing_shelf_presented_rect{};};
struct ARegion{Runtime*runtime;rcti winrct;};struct AreaRuntime{int ipad_layer=0;rcti ipad_navigation_rect{};};struct ScrArea{List<ARegion>regionbase;AreaRuntime runtime;};
struct Tooltip{ARegion*region;};struct ID{uint64_t session_uid=7;};struct bScreen{ID id;List<ScrArea>areabase;List<ARegion>regionbase;Tooltip*tool_tip=nullptr;bool locked=true,enabled=true;};
enum{WM_HANDLER_TYPE_UI=1,WM_HANDLER_TYPE_OP=2};struct wmEventHandler{int type;};struct wmEvent{int modifier=0,keymodifier=0;};
struct wmWindow{void*ghostwin;int winid=19;List<int>gesture,drawcalls;List<wmEventHandler>modalhandlers;bScreen*screen;wmEvent*eventstate;};
struct WMRuntime{wmWindow*winactive=nullptr;};struct wmWindowManager{List<wmWindow>windows;WMRuntime*runtime;};struct bContext{wmWindowManager*wm;};
template<class... T>bool ELEM(int v,T...a){return ((v==a)||...);}
wmWindowManager*CTX_wm_manager(bContext*C){return C->wm;}bScreen*WM_window_get_active_screen(wmWindow*w){return w->screen;}
bool ED_ipad_panels_locked(const bScreen*s){return s->locked;}bool ED_ipad_panels_enabled(const bScreen*s){return s->enabled;}
bool ED_ipad_panels_region_managed(ScrArea*,ARegion*){return false;}int redraws=0;void ED_region_tag_redraw(ARegion*){++redraws;}
int WM_window_native_pixel_y(wmWindow*){return 600;}
"""+helpers+r"""
int main(){int ghostkey=0;wmEvent state,active_state;wmWindow w{&ghostkey,19,{},{},{},nullptr,&state};WMRuntime runtime;wmWindowManager wm{{},&runtime};wm.windows.add(&w);bContext C{&wm};bScreen screen;w.screen=&screen;ScrArea area;screen.areabase.add(&area);
 wmDrawBuffer buffer;buffer.ipad_finger_paint_generation=10;wm_ipad_finger_rect_copy(buffer.ipad_finger_paint_region,{0,0,500,500});wm_ipad_finger_rect_copy(buffer.ipad_finger_paint_rect,{0,0,500,500});
 Runtime rt{true,&buffer};ARegion region{&rt,{0,0,500,500}};area.regionbase.add(&region);
 auto publish=[&](){wmIPadFingerPaintFrame f{7,19,0,false,false,{},{}};wm_ipad_finger_paint_record(&C,&w,&area,&region,f,region.winrct,false);wm_ipad_finger_paint_publish(&C,&w,f);};
 using namespace ghost::ios;
 for(int i=0;i<10000;++i){publish();assert(finger_paint_at_start(&ghostkey,100,100)==10);}
 // Cached completed textures preserve old ownership; no desired-context rebase.
 buffer.ipad_finger_paint_unknown_widgets=true;publish();assert(!finger_paint_at_start(&ghostkey,100,100));buffer.ipad_finger_paint_unknown_widgets=false;
 rt.ipad_finger_paint_overlay_blocked=true;publish();assert(!finger_paint_at_start(&ghostkey,100,100));rt.ipad_finger_paint_overlay_blocked=false;
 auto check_frame=[&](wmIPadFingerPaintFrame&f){wm_ipad_finger_paint_publish(&C,&w,f);};
 wmIPadFingerPaintFrame f{7,19,0,false,false,{},{}};wm_ipad_finger_paint_record(&C,&w,&area,&region,f,region.winrct,false);
 // A higher actually composited field/HUD reserves only real pixels.
 Runtime upper_rt{true,nullptr};ARegion upper{&upper_rt,{80,400,120,520}};wm_ipad_finger_paint_record(&C,&w,&area,&upper,f,upper.winrct,true);check_frame(f);
 assert(!finger_paint_at_start(&ghostkey,100,100));assert(finger_paint_at_start(&ghostkey,50,100)==10);
 buffer.ipad_finger_paint_navigation_present=true;wm_ipad_finger_rect_copy(buffer.ipad_finger_paint_navigation,{40,450,70,520});publish();assert(!finger_paint_at_start(&ghostkey,50,100));buffer.ipad_finger_paint_navigation_present=false;
 // Actual root callback execution remains blocked even if it self-removes.
 f.opaque_window_callback=true;check_frame(f);assert(!finger_paint_at_start(&ghostkey,50,100));f.opaque_window_callback=false;
 wmEventHandler handler{WM_HANDLER_TYPE_UI};w.modalhandlers.add(&handler);publish();assert(!finger_paint_at_start(&ghostkey,100,100));handler.type=WM_HANDLER_TYPE_OP;publish();assert(!finger_paint_at_start(&ghostkey,100,100));w.modalhandlers={};
 state.modifier=1;publish();assert(!finger_paint_at_start(&ghostkey,100,100));state.modifier=0;
 wmWindow active{nullptr,1,{},{},{},&screen,&active_state};runtime.winactive=&active;active_state.keymodifier=1;publish();assert(!finger_paint_at_start(&ghostkey,100,100));runtime.winactive=nullptr;
 buffer.ipad_finger_paint_generation=11;check_frame(f);assert(!finger_paint_at_start(&ghostkey,100,100));publish();assert(finger_paint_at_start(&ghostkey,100,100)==11);
 ++screen.id.session_uid;check_frame(f);assert(!finger_paint_at_start(&ghostkey,100,100));screen.id.session_uid=7;
 rt.draw_buffer=nullptr;publish();assert(!finger_paint_at_start(&ghostkey,100,100));rt.draw_buffer=&buffer;
 region.winrct.xmax=600;publish();assert(!finger_paint_at_start(&ghostkey,100,100)&&redraws==1);
}
""")

 def test_actual_draw_stamp_and_self_removed_callback_are_retained(self):
  start=DRAW.index('    ED_ipad_hud_draw_end(C, win, area, region);')
  stamp=DRAW[start:DRAW.index('\n#endif',start)]
  cb=function(changed_source('source/blender/editors/space_api/spacetypes.cc'),'static void ed_region_draw_cb_draw(')
  self.run_cpp(GHOST+r"""
struct rcti{int xmin,ymin,xmax,ymax;};
struct IPadFingerPaintOwner{std::array<uint64_t,19>values{};std::array<char,64>tool{};bool valid=false;};
struct wmDrawBuffer{bool stereo=false;uint64_t ipad_finger_paint_generation=0;int ipad_finger_paint_region[4]{},ipad_finger_paint_rect[4]{},ipad_finger_paint_navigation[4]{};bool ipad_finger_paint_unknown_widgets=false,ipad_finger_paint_navigation_present=false;};
struct Runtime{wmDrawBuffer*draw_buffer;bool ipad_canvas=true; rcti ipad_canvas_rect{0,0,500,500};bool ipad_finger_paint_overlay_blocked=false,ipad_finger_paint_navigation_drawn=false;};
struct ARegion{Runtime*runtime;rcti winrct{0,0,500,500};};struct ScrArea{struct {rcti ipad_navigation_rect{400,400,500,500};}runtime;};
struct wmWindow{int width=501,height=501;};struct bContext{IPadFingerPaintOwner after;};float UI_SCALE_FAC=1;
void ED_ipad_hud_draw_end(bContext*,wmWindow*,ScrArea*,ARegion*){}
void ED_ipad_finger_paint_capture(bContext*C,IPadFingerPaintOwner&out){out=C->after;}
int WM_window_native_pixel_x(wmWindow*w){return w->width;}int WM_window_native_pixel_y(wmWindow*w){return w->height;}
void wm_ipad_finger_rect_copy(int d[4],const rcti&r){d[0]=r.xmin;d[1]=r.ymin;d[2]=r.xmax;d[3]=r.ymax;}
void BLI_rcti_translate(rcti*r,int x,int y){r->xmin+=x;r->xmax+=x;r->ymin+=y;r->ymax+=y;}
bool render(bContext*C,wmWindow*win,ScrArea*area,ARegion*region,IPadFingerPaintOwner paint_before,bool paint_partial=false,bool paint_canvas_valid=true){
 const rcti paint_window_before{0,0,500,500},paint_canvas_before{0,0,500,500};
 const int paint_width_before=501,paint_height_before=501;const float paint_scale_before=1;
"""+stamp+r"""
 return paint_retry_full;
}
struct RegionDrawCB{int type;void(*draw)(const bContext*,ARegion*,void*);void*customdata;};struct ARegionType{List<RegionDrawCB>drawcalls;};
#undef LISTBASE_FOREACH_MUTABLE
#define LISTBASE_FOREACH_MUTABLE(type,var,list) for(type var : std::vector((list)->items))
"""+cb+r"""
void remove_self(const bContext*,ARegion*,void*data){auto*art=static_cast<ARegionType*>(data);art->drawcalls={};}
int main(){IPadFingerPaintOwner before;before.valid=true;before.tool[0]='x';before.values[17]=1;before.values[18]=2;bContext C{before};wmWindow win;ScrArea area;wmDrawBuffer buffer;Runtime rt{&buffer};ARegion region{&rt};
 for(int i=0;i<10000;++i){render(&C,&win,&area,&region,before);assert(buffer.ipad_finger_paint_generation&&buffer.ipad_finger_paint_rect[2]==500);}
 auto good=buffer.ipad_finger_paint_generation;
 assert(render(&C,&win,&area,&region,before,true)&&!buffer.ipad_finger_paint_generation);
 buffer.stereo=true;render(&C,&win,&area,&region,before);assert(!buffer.ipad_finger_paint_generation);buffer.stereo=false;
 for(int slot:{0,13,14,15,16,17,18}){C.after=before;++C.after.values[slot];render(&C,&win,&area,&region,before);assert(!buffer.ipad_finger_paint_generation);}
 C.after=before;C.after.tool[0]='y';render(&C,&win,&area,&region,before);assert(!buffer.ipad_finger_paint_generation);C.after=before;
 C.after.valid=false;render(&C,&win,&area,&region,before);assert(!buffer.ipad_finger_paint_generation);C.after=before;
 ++win.width;render(&C,&win,&area,&region,before);assert(!buffer.ipad_finger_paint_generation);--win.width;
 UI_SCALE_FAC=2;render(&C,&win,&area,&region,before);assert(!buffer.ipad_finger_paint_generation);UI_SCALE_FAC=1;
 ++rt.ipad_canvas_rect.xmax;render(&C,&win,&area,&region,before);assert(!buffer.ipad_finger_paint_generation);--rt.ipad_canvas_rect.xmax;
 rt.draw_buffer=nullptr;assert(!render(&C,&win,&area,&region,before));rt.draw_buffer=&buffer;
 ARegionType art;RegionDrawCB callback{1,remove_self,&art};art.drawcalls.add(&callback);
 ed_region_draw_cb_draw(&C,&region,&art,1);assert(!art.drawcalls.first&&rt.ipad_finger_paint_overlay_blocked);
 render(&C,&win,&area,&region,before);assert(buffer.ipad_finger_paint_generation>good&&buffer.ipad_finger_paint_unknown_widgets);
 // A cached blit uses this unknown marker even though the live callback vanished.
 rt.ipad_finger_paint_overlay_blocked=false;assert(buffer.ipad_finger_paint_unknown_widgets);
 ARegionType surface;RegionDrawCB surface_cb{1,remove_self,&surface};surface.drawcalls.add(&surface_cb);ed_region_draw_cb_draw(nullptr,nullptr,&surface,1);assert(!surface.drawcalls.first);
}
""")

 def test_actual_draw_execution_not_live_callback_presence(self):
  s=changed_source('source/blender/editors/space_api/spacetypes.cc')
  cb=function(s,'static void ed_region_draw_cb_draw(')
  self.assertLess(cb.index('ipad_finger_paint_overlay_blocked = true'),cb.index('rdc->draw('))
  self.assertIn('if (region)',cb) # surface callbacks preserve null native region
  cursor=function(DRAW,'static void wm_paintcursor_draw(')
  self.assertLess(cursor.index('ED_ipad_native_brush_cursor(pc)'),cursor.index('pc->draw('))
  paint=changed_source('source/blender/editors/sculpt_paint/paint_cursor.cc')
  proof=function(paint,'bool ED_ipad_native_brush_cursor(')
  self.assertIn('cursor->draw == blender::ed::sculpt_paint::paint_draw_cursor',proof)
  offscreen=function(DRAW,'static void wm_draw_area_offscreen(')
  self.assertIn('paint_before.values == paint_after.values',offscreen)
  self.assertIn('buffer->ipad_finger_paint_unknown_widgets = region->runtime->ipad_finger_paint_overlay_blocked',offscreen)
  self.assertIn('!paint_partial && paint_canvas_valid',offscreen)
  self.assertIn('paint_before.tool == paint_after.tool',offscreen)
  onscreen=function(DRAW,'static void wm_draw_window_onscreen(')
  self.assertLess(onscreen.index('wm_draw_callbacks(win)'),onscreen.index('wm_ipad_finger_paint_publish'))
  self.assertLess(onscreen.index('paint_frame.opaque_window_callback ='),onscreen.index('wm_draw_callbacks(win)'))

if __name__=='__main__':unittest.main()
