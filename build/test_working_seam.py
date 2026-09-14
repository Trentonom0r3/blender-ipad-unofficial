"""Compile the shipped native seam callbacks against explicit context/lifetime mocks."""
from pathlib import Path
import unittest
import test_ipad_panels


class WorkingSeamTests(unittest.TestCase):
    def test_modal_saved_geometry_and_lifetime(self):
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        name = 'source/blender/editors/screen/screen_ipad_panels.cc'
        section = patch.split(f'diff --git a/{name} b/{name}\n', 1)[1].split('diff --git ', 1)[0]
        source = ''.join(line[1:] for line in section.splitlines(True)
                         if line.startswith('+') and not line.startswith('+++'))
        callbacks = 'struct SeamDragData {' + source.split('struct SeamDragData {', 1)[1].split('}  // namespace', 1)[0]
        helpers = 'struct NativeSeamControl {' + source.split('struct NativeSeamControl {', 1)[1].split('struct Model {', 1)[0]
        prefix = PREFIX.replace('struct Model {', helpers + 'struct Model {', 1)
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(prefix + callbacks + CASES)

PREFIX = r'''
#include "ipad_workspace_panels.hh"
#include <cassert>
#include <climits>
#include <cmath>
#include <iostream>
namespace policy=blender::ed::ipad::panels;
using Rect=policy::Rect;
struct ScrVert { ScrVert *next=nullptr; struct {int x=0,y=0;} vec; };
struct ScrEdge { ScrEdge *next=nullptr; ScrVert *v1=nullptr,*v2=nullptr; };
struct ScrArea {
 ScrArea *next=nullptr;
 ScrVert *v1=nullptr,*v2=nullptr,*v3=nullptr,*v4=nullptr;
 policy::Role role=policy::Role::Content;
};
struct ListBase {void *first=nullptr;};
#define LISTBASE_FOREACH(type,name,list) for(type name=static_cast<type>((list)->first);name;name=name->next)
struct bScreen {bScreen *next=nullptr;struct {unsigned int session_uid=1;} id;
 ListBase vertbase,edgebase,areabase;int ipad_panel_owner=0;bool do_refresh=false,do_draw=false;};
struct Main {ListBase screens;};
struct wmWindow {Rect bounds{0,0,1000,700};};
struct bContext {Main *main; bScreen *screen; wmWindow *window;};
struct wmOperator {void *customdata=nullptr;int *ptr;};
struct wmEvent {int type,val,xy[2],flag=0;};
struct rcti {int xmin,xmax,ymin,ymax;};
using wmOperatorStatus=int;
enum {OPERATOR_CANCELLED,OPERATOR_RUNNING_MODAL,OPERATOR_FINISHED,LEFTMOUSE,RIGHTMOUSE,
 EVT_ESCKEY,WINDEACTIVATE,MOUSEMOVE,INBETWEEN_MOUSEMOVE,KM_RELEASE};
constexpr int WM_EVENT_IS_POINTER_CANCEL=64, USER_APP_LOCK_EDGE_RESIZE=1;
constexpr int NC_SCREEN=1,NA_EDITED=2;
constexpr float UI_SCALE_FAC=1;
struct {float pixelsize=1;int app_flag=0;} U;
template<class T,class... A> bool ELEM(T v,A... a){return ((v==a)||...);}
template<class T,class... A> T *MEM_new(const char *,A&&... a){return new T(std::forward<A>(a)...);}
template<class T> void MEM_delete(T *p){delete p;}
Main *CTX_data_main(bContext *C){return C->main;}
bScreen *CTX_wm_screen(bContext *C){return C->screen;}
wmWindow *CTX_wm_window(bContext *C){return C->window;}
bool ED_ipad_panels_enabled(bScreen *s){return s!=nullptr;}
int ED_area_headersize(){return 26;}
void WM_window_screen_rect_calc(wmWindow *w,rcti *r){*r={w->bounds.xmin,w->bounds.xmax,w->bounds.ymin,w->bounds.ymax};}
int RNA_int_get(int *p,const char *){return *p;}
void WM_event_add_modal_handler(bContext *,wmOperator *){}
void WM_event_add_notifier(bContext *,int,void *){}
int refreshed_original_x=-1;
void tag_layout(bContext *C,wmWindow *win){
 auto *middle=static_cast<ScrVert *>(C->screen->vertbase.first)->next;
 refreshed_original_x=middle->vec.x;
 int maxx=0,maxy=0;
 LISTBASE_FOREACH(ScrVert *,v,&C->screen->vertbase){maxx=std::max(maxx,v->vec.x);maxy=std::max(maxy,v->vec.y);}
 LISTBASE_FOREACH(ScrVert *,v,&C->screen->vertbase){
  v->vec.x=int(double(v->vec.x)*win->bounds.xmax/maxx);
  v->vec.y=int(double(v->vec.y)*win->bounds.ymax/maxy);
 }
}
struct Model {std::vector<ScrArea *> areas;ScrArea *main=nullptr;std::vector<policy::Area> inputs,working;};
Model make_model(bContext *C,wmWindow *){
 Model m;
 LISTBASE_FOREACH(ScrArea *,a,&C->screen->areabase){
  int id=int(m.areas.size());m.areas.push_back(a);
  m.inputs.push_back({id,{a->v1->vec.x,a->v1->vec.y,a->v4->vec.x+1,a->v2->vec.y+1},a->role});
 }
 auto map=policy::classify(m.inputs,2);m.working=map.working;
 if(map.primary_id>=0){m.main=m.areas[map.primary_id];}
 return m;
}
'''

CASES = r'''
struct Fixture {
 ScrVert v[6];ScrEdge e[7];ScrArea a[2];bScreen screen;Main main;wmWindow win;
 bContext C{&main,&screen,&win};int index=0;wmOperator op{nullptr,&index};
 wmEvent press{LEFTMOUSE,0,{402,350}},move{MOUSEMOVE,0,{552,350}},release{LEFTMOUSE,KM_RELEASE,{552,350}};
 Fixture(){
  const int xy[6][2]={{0,0},{400,0},{1000,0},{0,700},{400,700},{1000,700}};
  for(int i=0;i<6;++i){v[i].vec={xy[i][0],xy[i][1]};if(i<5)v[i].next=&v[i+1];}
  const int ends[7][2]={{0,1},{1,2},{0,3},{1,4},{2,5},{3,4},{4,5}};
  for(int i=0;i<7;++i){e[i].v1=&v[ends[i][0]];e[i].v2=&v[ends[i][1]];if(i<6)e[i].next=&e[i+1];}
  a[0].v1=&v[0];a[0].v2=&v[3];a[0].v3=&v[4];a[0].v4=&v[1];a[0].next=&a[1];
  a[1].v1=&v[1];a[1].v2=&v[4];a[1].v3=&v[5];a[1].v4=&v[2];
  screen.vertbase.first=v;screen.edgebase.first=e;screen.areabase.first=a;main.screens.first=&screen;
 }
 void begin(){assert(seam_invoke(&C,&op,&press)==OPERATOR_RUNNING_MODAL);}
 void drag(){begin();assert(seam_modal(&C,&op,&move)==OPERATOR_RUNNING_MODAL);assert(v[1].vec.x>400);}
 ~Fixture(){seam_cancel(&C,&op);}
};
struct ClassificationFixture {
 ScrVert v[8];ScrEdge e[11];ScrArea a[3];bScreen screen;Main main;wmWindow win;
 bContext C{&main,&screen,&win};int index=0;wmOperator op{nullptr,&index};
 ClassificationFixture(){
  const int xy[8][2]={{0,0},{600,0},{1000,0},{600,300},{1000,300},{0,700},{600,700},{1000,700}};
  for(int i=0;i<8;++i){v[i].vec={xy[i][0],xy[i][1]};if(i<7)v[i].next=&v[i+1];}
  const int ends[11][2]={{0,1},{1,2},{0,5},{1,3},{3,6},{1,6},{2,4},{4,7},{5,6},{6,7},{3,4}};
  for(int i=0;i<11;++i){e[i].v1=&v[ends[i][0]];e[i].v2=&v[ends[i][1]];if(i<10)e[i].next=&e[i+1];}
  const int corners[3][4]={{0,5,6,1},{1,3,4,2},{3,6,7,4}};
  for(int i=0;i<3;++i){a[i].v1=&v[corners[i][0]];a[i].v2=&v[corners[i][1]];
   a[i].v3=&v[corners[i][2]];a[i].v4=&v[corners[i][3]];if(i<2)a[i].next=&a[i+1];}
  a[0].role=policy::Role::Canvas;
  screen.vertbase.first=v;screen.edgebase.first=e;screen.areabase.first=a;main.screens.first=&screen;
 }
 ~ClassificationFixture(){seam_cancel(&C,&op);}
};
struct PinwheelFixture {
 std::vector<ScrVert> v;std::vector<ScrEdge> e;ScrArea a[6];bScreen screen;Main main;wmWindow win;
 bContext C{&main,&screen,&win};int index=0;wmOperator op{nullptr,&index};
 PinwheelFixture(bool transpose=false, bool support=false):v(20){
  win.bounds={0,0,900,900};e.reserve(32);
  for(int i=0;i<16;++i){v[i].vec={(i%4)*300,(i/4)*300};if(i<15)v[i].next=&v[i+1];}
  v[15].next=&v[16];v[16].next=&v[17];v[16].vec={600,100};v[17].vec={600,200};
  v[17].next=&v[18];v[18].next=&v[19];v[18].vec={900,0};v[19].vec={900,900};
  const int corners[5][4]={{0,4,6,2},{2,10,11,3},{9,13,15,11},{4,12,13,5},{5,9,10,6}};
  for(int i=0;i<5;++i){
   a[i].v1=&v[corners[i][0]];a[i].v2=&v[corners[i][1]];
   a[i].v3=&v[corners[i][2]];a[i].v4=&v[corners[i][3]];
   a[i].role=policy::Role::Working;if(i<4)a[i].next=&a[i+1];
   for(int side=0;side<4;++side){
    auto *x=&v[corners[i][side]],*y=&v[corners[i][(side+1)%4]];
    bool found=false;for(auto &edge:e){found|=(edge.v1==x && edge.v2==y)||(edge.v1==y && edge.v2==x);}
    if(!found)e.push_back({nullptr,x,y});
   }
  }
  if(support){
   win.bounds.xmax=1200;v[18].vec.x=v[19].vec.x=1200;
   a[4].next=&a[5];a[5].v1=&v[3];a[5].v2=&v[15];a[5].v3=&v[19];a[5].v4=&v[18];a[5].role=policy::Role::Service;
   e.push_back({nullptr,&v[3],&v[18]});e.push_back({nullptr,&v[18],&v[19]});e.push_back({nullptr,&v[19],&v[15]});
  }
  e.insert(e.begin(),{nullptr,&v[16],&v[17]}); // Unrelated collinear edge precedes real face edges.
  for(std::size_t i=0;i+1<e.size();++i)e[i].next=&e[i+1];
  if(transpose){for(auto &vertex:v)std::swap(vertex.vec.x,vertex.vec.y);for(auto &area:a)std::swap(area.v2,area.v4);}
  screen.vertbase.first=v.data();screen.edgebase.first=e.data();screen.areabase.first=a;main.screens.first=&screen;
 }
 ~PinwheelFixture(){seam_cancel(&C,&op);}
};
int main(){
 { // Hidden supporting editor leaves the fallback 900 saved units across 1200 displayed pixels.
  PinwheelFixture f(false,true);auto model=make_model(&f.C,&f.win);assert(model.working.size()==5);
  std::vector<NativeSeamControl> controls;working_controls(&f.screen,model.working,f.win.bounds,controls);
  const auto found=std::find_if(controls.begin(),controls.end(),[](const auto &control){return control.seam.vertical;});
  assert(found!=controls.end());f.index=int(found-controls.begin());const auto &r=found->seam.line;
  wmEvent press{LEFTMOUSE,0,{(r.xmin+r.xmax)/2,(r.ymin+r.ymax)/2}};
  assert(seam_invoke(&f.C,&f.op,&press)==OPERATOR_RUNNING_MODAL);
  auto *data=static_cast<SeamDragData *>(f.op.customdata);
  assert(data->seam.saved_bounds.width()==900 && data->seam.display_bounds.width()==1200);
  wmEvent move=press;move.type=MOUSEMOVE;move.xy[0]+=80;
  assert(seam_modal(&f.C,&f.op,&move)==OPERATOR_RUNNING_MODAL);assert(data->delta==60);
  move.val=KM_RELEASE;move.type=LEFTMOUSE;
  assert(seam_modal(&f.C,&f.op,&move)==OPERATOR_FINISHED && !f.op.customdata);
  assert(f.a[5].v1->vec.x==900 && f.a[5].v4->vec.x==1200);
 }

 for(bool transpose:{false,true})for(int seam_index=0;seam_index<8;++seam_index){
  PinwheelFixture f(transpose);auto model=make_model(&f.C,&f.win);
  std::vector<NativeSeamControl> controls;working_controls(&f.screen,model.working,f.win.bounds,controls);
  assert(controls.size()==8);const auto &control=controls[seam_index];
  assert(control.fallback && control.edge && control.edge!=f.e.data());
  const auto &r=control.seam.line;f.index=seam_index;
  wmEvent press{LEFTMOUSE,0,{(r.xmin+r.xmax)/2,(r.ymin+r.ymax)/2}};
  assert(seam_invoke(&f.C,&f.op,&press)==OPERATOR_RUNNING_MODAL);
  auto *data=static_cast<SeamDragData *>(f.op.customdata);assert(data->fallback && seam_candidate_valid(*data,0));
  assert(!data->selected[16] && !data->selected[17]);
  const auto original=data->original;
  wmEvent move=press;move.type=MOUSEMOVE;move.xy[control.seam.vertical?0:1]+=30;
  assert(seam_modal(&f.C,&f.op,&move)==OPERATOR_RUNNING_MODAL);assert(data->delta>0);
  move.xy[control.seam.vertical?0:1]-=60;
  assert(seam_modal(&f.C,&f.op,&move)==OPERATOR_RUNNING_MODAL);assert(data->delta<0);
  move.xy[control.seam.vertical?0:1]+=10000;
  assert(seam_modal(&f.C,&f.op,&move)==OPERATOR_RUNNING_MODAL);
  assert(seam_candidate_valid(*data,data->delta));
  move.flag=WM_EVENT_IS_POINTER_CANCEL;
  assert(seam_modal(&f.C,&f.op,&move)==OPERATOR_CANCELLED);
  for(std::size_t i=0;i<f.v.size();++i){assert(f.v[i].vec.x==original[i].x && f.v[i].vec.y==original[i].y);}
 }

 {ClassificationFixture f;wmEvent press{LEFTMOUSE,0,{602,500}};
  assert(seam_invoke(&f.C,&f.op,&press)==OPERATOR_RUNNING_MODAL);
  auto *data=static_cast<SeamDragData *>(f.op.customdata);
  assert(seam_candidate_valid(*data,-50));
  assert(!seam_candidate_valid(*data,-400)); // Graph would become a hidden bottom editor.
  wmEvent move{MOUSEMOVE,0,{202,500}};
  assert(seam_modal(&f.C,&f.op,&move)==OPERATOR_RUNNING_MODAL);
  assert(make_model(&f.C,&f.win).working.size()==3);
 }
 {Fixture f;
  for(auto &v:f.v)std::swap(v.vec.x,v.vec.y);
  for(auto &a:f.a){std::swap(a.v2,a.v4);a.role=policy::Role::Working;}
  f.win.bounds={0,0,700,1000};
  std::swap(f.press.xy[0],f.press.xy[1]);std::swap(f.move.xy[0],f.move.xy[1]);
  f.begin();assert(seam_modal(&f.C,&f.op,&f.move)==OPERATOR_RUNNING_MODAL);
  assert(f.v[1].vec.y==550 && f.v[4].vec.y==550);
  seam_cancel(&f.C,&f.op);assert(f.v[1].vec.y==400);
 }
 {Fixture f;f.drag();assert(f.v[1].vec.x==550);assert(f.v[4].vec.x==550);
  assert(seam_modal(&f.C,&f.op,&f.release)==OPERATOR_FINISHED);assert(!f.op.customdata);}
 {Fixture f;f.drag();seam_cancel(&f.C,&f.op);assert(f.v[1].vec.x==400);assert(f.screen.ipad_panel_owner==0);}
 {Fixture f;f.drag();auto cancel=f.release;cancel.flag=WM_EVENT_IS_POINTER_CANCEL;
  assert(seam_modal(&f.C,&f.op,&cancel)==OPERATOR_CANCELLED);assert(f.v[1].vec.x==400);}
 {Fixture f;f.drag();auto move=f.move;move.xy[0]=f.press.xy[0];
  assert(seam_modal(&f.C,&f.op,&move)==OPERATOR_RUNNING_MODAL);assert(f.v[1].vec.x==400);}
 {Fixture f;f.drag();f.win.bounds.xmax=1200;
  for(auto &v:f.v)v.vec.x=v.vec.x*12/10;
  assert(seam_modal(&f.C,&f.op,&f.move)==OPERATOR_CANCELLED);
  assert(refreshed_original_x==400);assert(f.v[1].vec.x==480);assert(f.v[2].vec.x==1200);}
 {Fixture f;f.drag();f.e[3].v2=&f.v[5];
  assert(seam_modal(&f.C,&f.op,&f.move)==OPERATOR_CANCELLED);assert(f.v[1].vec.x==550);}
 {Fixture f;f.drag();f.C.screen=nullptr;
  assert(seam_modal(&f.C,&f.op,&f.move)==OPERATOR_CANCELLED);assert(f.v[1].vec.x==400);}
 {Fixture f;f.drag();f.main.screens.first=nullptr;f.C.screen=nullptr;
  assert(seam_modal(&f.C,&f.op,&f.move)==OPERATOR_CANCELLED);assert(!f.op.customdata);}
 {Fixture f;U.app_flag=USER_APP_LOCK_EDGE_RESIZE;
  assert(seam_invoke(&f.C,&f.op,&f.press)==OPERATOR_CANCELLED);U.app_flag=0;}
 std::cout<<"PASS: exact native seam callbacks: invoke, drag, reversal, commit, cancellation, topology, owner removal and resize restoration\n";
}
'''
