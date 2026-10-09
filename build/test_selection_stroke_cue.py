"""Execute connected native selection cue admission/draw/terminal seams.

Handler lists/context/UI font/GPU are modeled; native function bodies come from
our exact overlay, and gesture disposal is copied from the pinned constructor.
No target UIKit/GPU/device claim.
"""
import unittest
import test_ipad_panels
from test_compact_shelf import function
from test_touch_extrude import changed_source

OPS=changed_source('source/blender/windowmanager/intern/wm_gesture_ops.cc')
DRAW=changed_source('source/blender/windowmanager/intern/wm_draw.cc')
HELPERS='\n'.join(function(OPS,s) for s in [
 'static int gesture_ipad_selection_kind(', 'static bool gesture_ipad_selection_tool(',
 'static void gesture_ipad_selection_begin(', 'void WM_gesture_ipad_selection_draw('])
COMMON=r'''
#define WITH_APPLE_CROSSPLATFORM
#include <cassert>
#include <algorithm>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <string>
#include <vector>
#define IFACE_(x) (x)
#define STREQ(a,b) (std::strcmp(a,b)==0)
template<class T,class...V>bool elem(T a,V...v){return ((a==v)||...);}
#define ELEM(a,...) elem(a,__VA_ARGS__)
#define LISTBASE_FOREACH(T,v,l) for(T v=static_cast<T>((l)->first);v;v=v->next)
using wmOperatorStatus=int;
enum {OPERATOR_RUNNING_MODAL=4,OPERATOR_CANCELLED=1,OPERATOR_FINISHED=2};
enum {WM_GESTURE_RECT=2,WM_GESTURE_CROSS_RECT=3,WM_GESTURE_LASSO=4};
enum {LEFTMOUSE=1,KM_PRESS_DRAG=2,EVENT_NONE=0,WM_EVENT_IS_DIRECT_TOOL=128,
 WM_EVENT_IS_POINTER_CANCEL=16,RGN_TYPE_WINDOW=1,WM_HANDLER_TYPE_OP=3,WM_HANDLER_DO_FREE=128,
 SEL_OP_SET=0,SEL_OP_ADD=1,SEL_OP_SUB=2};
struct ListBase{void *first=nullptr;void *last=nullptr;};
struct rcti{int xmin=30,xmax=700,ymin=80,ymax=700;};
struct ARegion{ARegion *next=nullptr,*prev=nullptr;int regiontype=RGN_TYPE_WINDOW;
 rcti winrct;struct Runtime{bool visible=true;} storage;Runtime *runtime=&storage;};
struct ScrArea{ScrArea *next=nullptr,*prev=nullptr;ListBase regionbase;};
struct bScreen{ListBase areabase,regionbase;};
struct wmGesture{wmGesture *next,*prev;int type;bool wait_for_input;rcti winrct;void *customdata;
 bool ipad_selection_cue;int ipad_selection_mode;uint64_t ipad_selection_context[13];
 uint64_t ipad_selection_operator_lifetime,ipad_selection_type_lifetime;int points,modal_state;
 struct{bool use_free;} user_data;bool use_smooth;};
struct wmEvent{int type=LEFTMOUSE,val=KM_PRESS_DRAG,flag=WM_EVENT_IS_DIRECT_TOOL,modifier=0,keymodifier=0;};
struct wmOperator;struct bContext;
struct wmOperatorType{wmOperatorStatus(*invoke)(bContext*,wmOperator*,const wmEvent*);
 wmOperatorStatus(*modal)(bContext*,wmOperator*,const wmEvent*);void(*cancel)(bContext*,wmOperator*);
 wmOperatorStatus(*exec)(bContext*,wmOperator*);uint64_t ipad_lifetime_id=1;};
struct PointerRNA{int mode=SEL_OP_SET;bool wait=false;int paths=0;};
struct wmOperator{void *customdata=nullptr;wmOperatorType *type;wmOperator *opm=nullptr;PointerRNA *ptr;
 uint64_t lifetime=7;};
struct wmEventHandler{wmEventHandler *next=nullptr,*prev=nullptr;int type=WM_HANDLER_TYPE_OP,flag=0;};
struct wmWindow{wmWindow *next=nullptr,*prev=nullptr;bScreen *screen;ListBase gesture,modalhandlers;};
struct wmWindowManager{ListBase windows;};
struct wmEventHandler_Op{wmEventHandler head;wmOperator *op=nullptr;
 struct{wmWindow *win=nullptr;ScrArea *area=nullptr;ARegion *region=nullptr;}context;};
struct bToolRef{const char *idname="builtin.select_box";};
struct bContext{wmWindowManager *wm;wmWindow *win;ScrArea *area;ARegion *region;bToolRef *tool;
 bool live=true;uint64_t token=42;};
wmOperatorStatus WM_gesture_box_invoke(bContext*,wmOperator*,const wmEvent*);
wmOperatorStatus WM_gesture_lasso_invoke(bContext*,wmOperator*,const wmEvent*);
wmOperatorStatus WM_gesture_box_modal(bContext*,wmOperator*,const wmEvent*);
wmOperatorStatus WM_gesture_lasso_modal(bContext*,wmOperator*,const wmEvent*);
void WM_gesture_box_cancel(bContext*,wmOperator*);void WM_gesture_lasso_cancel(bContext*,wmOperator*);
wmOperatorStatus finish(bContext*,wmOperator*);
wmOperatorType box{WM_gesture_box_invoke,WM_gesture_box_modal,WM_gesture_box_cancel,finish,11};
wmOperatorType lasso{WM_gesture_lasso_invoke,WM_gesture_lasso_modal,WM_gesture_lasso_cancel,finish,12};
bool registered=true,handler_ok=true;int captures=0,reads=0,draws=0,pushes=0,pops=0,ends=0,execs=0,redraws=0;
std::string status;float translate_x=0,translate_y=0;wmEventHandler_Op handler;
wmOperatorType *WM_operatortype_find(const char *id,bool){if(!registered)return nullptr;
 return STREQ(id,"VIEW3D_OT_select_box")?&box:&lasso;}
int BLI_findindex(const ListBase *list,const void *value){int i=0;for(void *p=list->first;p;p=*static_cast<void**>(p),++i)if(p==value)return i;return -1;}
wmWindow *CTX_wm_window(const bContext*C){return C->win;}wmWindowManager *CTX_wm_manager(const bContext*C){return C->wm;}
ScrArea *CTX_wm_area(const bContext*C){return C->area;}ARegion *CTX_wm_region(const bContext*C){return C->region;}
void CTX_wm_area_set(bContext*C,ScrArea*a){C->area=a;C->region=nullptr;}
void CTX_wm_region_set(bContext*C,ARegion*r){C->region=r;}
bScreen *WM_window_get_active_screen(wmWindow*w){return w->screen;}
bToolRef *WM_toolsystem_ref_from_context(const bContext*C){return C->tool;}
bool UI_ipad_context_capture(bContext*C,uint64_t*v){++captures;if(!C->live||!C->area||!C->region||!C->region->runtime->visible)return false;
 std::fill_n(v,13,0);v[0]=C->token;v[1]=uintptr_t(C->win);v[3]=uintptr_t(C->area);v[4]=uintptr_t(C->region);return true;}
bool UI_ipad_context_matches(bContext*C,const uint64_t*v){uint64_t now[13];return UI_ipad_context_capture(C,now)&&std::equal(now,now+13,v);}
uint64_t WM_operator_touch_lifetime_id(wmOperator*op){return op->lifetime;}
bool WM_operator_touch_lifetime_matches(wmOperator*op,uint64_t v){return v&&op->lifetime==v;}
int RNA_enum_get(PointerRNA*p,const char*s){assert(STREQ(s,"mode"));++reads;return p->mode;}
bool RNA_boolean_get(PointerRNA*p,const char*s){return STREQ(s,"wait_for_input")?p->wait:false;}
struct PropertyRNA{};PropertyRNA *RNA_struct_find_property(PointerRNA*,const char*){return nullptr;}
int RNA_property_int_get(PointerRNA*,PropertyRNA*){return 0;}
void WM_cursor_modal_set(wmWindow*,int){}void WM_cursor_modal_restore(wmWindow*){}
bool WM_event_is_mouse_drag_or_press(const wmEvent*e){return e->val==KM_PRESS_DRAG;}
wmGesture *WM_gesture_new(wmWindow*w,const ARegion*r,const wmEvent*,int type){
 auto *g=static_cast<wmGesture*>(std::calloc(1,sizeof(wmGesture)));g->type=type;g->winrct=r->winrct;
 g->customdata=std::calloc(4,sizeof(float));g->points=2;w->gesture.first=w->gesture.last=g;return g;}
wmEventHandler_Op *WM_event_add_modal_handler(bContext*C,wmOperator*op){handler={};handler.op=op;
 handler.context.area=C->area;handler.context.region=C->region;C->win->modalhandlers.first=&handler;
 return handler_ok?&handler:nullptr;}
void wm_gesture_tag_redraw(wmWindow*){++redraws;}void ED_area_tag_redraw(ScrArea*){++redraws;}
void BLI_remlink(ListBase*l,wmGesture*g){assert(l->first==g);l->first=l->last=nullptr;}
void MEM_freeN(void*p){std::free(p);}void WM_generic_user_data_free(decltype(wmGesture::user_data)*){}
void WM_gesture_end(wmWindow*w,wmGesture*g){BLI_remlink(&w->gesture,g);MEM_freeN(g->customdata);WM_generic_user_data_free(&g->user_data);MEM_freeN(g);++ends;}
void GPU_matrix_push(){++pushes;}void GPU_matrix_pop(){++pops;}
void GPU_matrix_translate_2f(float x,float y){translate_x=x;translate_y=y;}
void UI_ipad_stroke_cue_draw(const bContext*C,ARegion*r,const uint64_t*v,const char*s){assert(r==C->region&&v[4]==uintptr_t(r));if(s){++draws;status=s;assert(translate_x==r->winrct.xmin&&translate_y==r->winrct.ymin);}}
#define OPERATOR_RETVAL_CHECK(x) assert((x)==OPERATOR_FINISHED)
int min_ii(int a,int b){return std::min(a,b);}int max_ii(int a,int b){return std::max(a,b);}
void RNA_int_set(PointerRNA*,const char*,int){}void gesture_modal_state_to_operator(wmOperator*,int){}
void RNA_collection_clear(PointerRNA*p,const char*){p->paths=0;}
void RNA_collection_add(PointerRNA*p,const char*,PointerRNA*){++p->paths;}
void RNA_float_set_array(PointerRNA*,const char*,float*){}
'''
INVOKES='\n'.join(function(OPS,s) for s in ['wmOperatorStatus WM_gesture_box_invoke(', 'wmOperatorStatus WM_gesture_lasso_invoke('])
END=function(OPS,'static void gesture_modal_end(')
APPLY='\n'.join(function(OPS,s) for s in ['static bool gesture_box_apply_rect(', 'static bool gesture_box_apply(', 'static wmOperatorStatus gesture_lasso_apply('])
CANCEL='\n'.join(function(OPS,s) for s in ['void WM_gesture_box_cancel(', 'void WM_gesture_lasso_cancel('])
# Execute the actual interruption prefix before any modeled native remainder.
PREFIXES=''
for name in ['WM_gesture_box_modal','WM_gesture_lasso_modal']:
 body=function(OPS,'wmOperatorStatus '+name+'(')
 prefix=body[:body.index('#endif')+len('#endif')]
 PREFIXES+=prefix+'\nreturn OPERATOR_RUNNING_MODAL;\n}\n'
CPP=COMMON+HELPERS+END+APPLY+INVOKES+CANCEL+PREFIXES+r'''
wmOperatorStatus finish(bContext*C,wmOperator*){int before=draws;WM_gesture_ipad_selection_draw(C);assert(draws==before);++execs;return OPERATOR_FINISHED;}
struct Env{ARegion r;ScrArea area,outer;ARegion outer_r;bScreen screen;wmWindow win;wmWindowManager wm;bToolRef tool;
 bContext C;PointerRNA props;wmOperator op;wmEvent event;
 Env():C{&wm,&win,&area,&r,&tool},op{nullptr,&box,nullptr,&props}{win.screen=&screen;screen.areabase.first=&area;area.regionbase.first=&r;wm.windows.first=&win;(void)gesture_box_apply;(void)gesture_lasso_apply;}
 void start(bool l=false){tool.idname=l?"builtin.select_lasso":"builtin.select_box";op.type=l?&lasso:&box;
 assert((l?WM_gesture_lasso_invoke:WM_gesture_box_invoke)(&C,&op,&event)==OPERATOR_RUNNING_MODAL);}
 wmGesture*g(){return static_cast<wmGesture*>(op.customdata);}
 void close(){if(op.customdata)op.type->cancel(&C,&op);win.modalhandlers.first=nullptr;}
 ~Env(){close();}
};
'''

class SelectionStrokeCueTests(unittest.TestCase):
 def run_cpp(self,main):test_ipad_panels.IPadWorkspacePanelsTests()._run_source(CPP+main)
 def test_actual_native_invokes_mode_and_admission(self):
  self.run_cpp(r'''
int main(){
 for(bool l:{false,true})for(int mode:{int(SEL_OP_SET),int(SEL_OP_ADD),int(SEL_OP_SUB),9}){
  Env e;e.props.mode=mode;e.start(l);assert(e.g()->ipad_selection_cue==(mode!=9));
  if(mode!=9){int before=draws,r=reads;WM_gesture_ipad_selection_draw(&e.C);assert(draws==before+1&&reads==r);
   assert(status.find(l?"Lasso":"Box")==0);assert(status.find(mode==0?"Replace":mode==1?"Add":"Remove")!=std::string::npos);}
 }
 for(int rejection=0;rejection<12;++rejection){Env e;
  switch(rejection){case 0:e.event.flag=0;break;case 1:e.event.type=9;break;case 2:e.event.val=9;break;
   case 3:e.event.modifier=1;break;case 4:e.event.keymodifier=1;break;case 5:e.op.opm=&e.op;break;
   case 6:e.C.live=false;break;case 7:e.r.runtime->visible=false;break;case 8:handler_ok=false;break;
   case 9:registered=false;break;case 10:e.op.lifetime=0;break;case 11:box.ipad_lifetime_id=0;break;}
  e.start();assert(!e.g()->ipad_selection_cue);handler_ok=registered=true;box.ipad_lifetime_id=11;
 }
 Env e;e.start();e.close();e.C.tool=nullptr;e.start();assert(!e.g()->ipad_selection_cue);
}
''')
 def test_live_registration_context_geometry_and_no_revival(self):
  self.run_cpp(r'''
int main(){
 for(int count=0;count<10000;++count){Env e;e.start(count%2);e.C.area=&e.outer;e.C.region=&e.outer_r;
  int before=draws;WM_gesture_ipad_selection_draw(&e.C);assert(draws==before+1&&e.C.area==&e.outer&&e.C.region==&e.outer_r);
  ARegion popup;e.screen.regionbase.first=&popup;WM_gesture_ipad_selection_draw(&e.C);assert(draws==before+1);
  popup.runtime->visible=false;WM_gesture_ipad_selection_draw(&e.C);assert(draws==before+2);
  e.screen.regionbase.first=nullptr;e.C.area=&e.area;e.C.region=&e.r;
  switch(count%7){case 0:++e.C.token;break;case 1:++e.r.winrct.xmin;break;case 2:++e.op.lifetime;break;
   case 3:++e.op.type->ipad_lifetime_id;break;case 4:e.tool.idname="builtin.move";break;
   case 5:handler.context.region=&e.outer_r;break;case 6:registered=false;break;}
  WM_gesture_ipad_selection_draw(&e.C);assert(draws==before+2&&!e.g()->ipad_selection_cue);
  e.C.token=42;e.r.winrct.xmin=30;e.op.lifetime=7;box.ipad_lifetime_id=11;lasso.ipad_lifetime_id=12;
  e.tool.idname=count%2?"builtin.select_lasso":"builtin.select_box";handler.context.region=&e.r;registered=true;
  WM_gesture_ipad_selection_draw(&e.C);assert(draws==before+2);
 }
 assert(pushes==pops);
 Env e;e.start();int before=draws;handler.head.flag=WM_HANDLER_DO_FREE;WM_gesture_ipad_selection_draw(&e.C);assert(draws==before);
 handler.head.flag=0;e.win.gesture.first=nullptr;WM_gesture_ipad_selection_draw(&e.C);assert(draws==before);e.win.gesture.first=e.g();
}
''')
 def test_native_finish_cancel_and_cleanup(self):
  self.run_cpp(r'''
int main(){
 for(bool l:{false,true}){
  Env e;e.start(l);int before=draws;WM_gesture_ipad_selection_draw(&e.C);assert(draws==before+1);
  e.event.flag|=WM_EVENT_IS_POINTER_CANCEL;int old_execs=execs;
  assert((l?WM_gesture_lasso_modal:WM_gesture_box_modal)(&e.C,&e.op,&e.event)==OPERATOR_CANCELLED);
  assert(!e.op.customdata&&!e.win.gesture.first&&execs==old_execs);WM_gesture_ipad_selection_draw(&e.C);assert(draws==before+1);
 }
 Env box_env;box_env.start();auto *rect=static_cast<rcti*>(box_env.g()->customdata);*rect={30,300,80,300};
 int before=execs;assert(gesture_box_apply(&box_env.C,&box_env.op)&&execs==before+1&&!box_env.g()->ipad_selection_cue);
 box_env.close();assert(!box_env.op.customdata&&!box_env.win.gesture.first);
 Env l;l.start(true);before=execs;assert(gesture_lasso_apply(&l.C,&l.op)==OPERATOR_FINISHED&&execs==before+1);
 assert(!l.op.customdata&&!l.win.gesture.first&&l.props.paths==2);
}
''')
 def test_actual_window_draw_resets_viewport_before_shared_region_cue(self):
  code=DRAW
  expected='wm_gesture_draw(win);\n    wmWindowViewport(win);\n#ifdef WITH_APPLE_CROSSPLATFORM\n    WM_gesture_ipad_selection_draw(C);'
  self.assertIn(expected,code)
  types=changed_source('source/blender/windowmanager/WM_types.hh')
  self.assertIn('uint64_t ipad_selection_context[13];',types)
  self.assertNotIn('bool ipad_selection_cue =',types)
  self.assertNotIn('RNA_',function(OPS,'void WM_gesture_ipad_selection_draw('))

if __name__=='__main__':unittest.main()
