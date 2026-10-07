"""Execute owned page geometry, native page placement and shared menu anchoring."""
import unittest
import test_ipad_panels
from test_compact_shelf import function
from test_touch_extrude import changed_source
from test_tool_ring import ring_source

POLICY=ring_source().replace('#pragma once','')
NATIVE=changed_source('source/blender/editors/interface/regions/interface_region_menu_pie.cc')


class PencilRingPageTests(unittest.TestCase):
    def run_cpp(self,source):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(POLICY+'\n'+source)

    def test_nine_visible_slots_stable_origin_all_phases_and_empty_center(self):
        self.run_cpp(r'''
#include <cassert>
#include <limits>
using namespace blender::ui::ipad;
bool overlaps(Rect a,Rect b){return a.xmin<b.xmax&&b.xmin<a.xmax&&a.ymin<b.ymax&&b.ymin<a.ymax;}
int main(){
 for(float unit:{20.f,30.f,40.f})for(bool touch:{false,true})
 for(Rect logical:{Rect{40,810,100,900},Rect{10,780,30,1100},Rect{150,490,170,870},Rect{170,360,130,730}}){
  Rect view{logical.xmin*unit/20,logical.xmax*unit/20,logical.ymin*unit/20,logical.ymax*unit/20};
  for(float x:{view.xmin-100,view.xmin,(view.xmin+view.xmax)/2,view.xmax,view.xmax+100})
  for(float y:{view.ymin-100,view.ymin,(view.ymin+view.ymax)/2,view.ymax,view.ymax+100}){
   auto base=ring_page_layout(unit,view,x,y,5,0,touch);assert(base.fits);
   for(int total:{1,2,5,6,8,9,10,20,34,43,4096})for(int step=-20;step<30;++step){
    auto page=ring_page_layout(unit,view,x,y,total,float(step)/10,touch);assert(page.fits);
    assert(page.buttons.size()==size_t(std::min(total,9))&&page.buttons.size()==page.indices.size());
    assert(page.center_x==base.center_x&&page.center_y==base.center_y);
    assert(page.footprint.xmin==base.footprint.xmin&&page.footprint.ymax==base.footprint.ymax);
    for(size_t i=0;i<page.buttons.size();++i){auto b=page.buttons[i];
     assert(b.xmin>=view.xmin-.01&&b.xmax<=view.xmax+.01&&b.ymin>=view.ymin-.01&&b.ymax<=view.ymax+.01);
     assert(page.indices[i]>=0&&page.indices[i]<total);
     if(!page.grid)assert(page.center_x<b.xmin||page.center_x>b.xmax||page.center_y<b.ymin||page.center_y>b.ymax);
     for(size_t j=i+1;j<page.buttons.size();++j){assert(!overlaps(b,page.buttons[j]));assert(page.indices[i]!=page.indices[j]);}
    }
   }
  }
 }
 Rect view{0,1024,0,768};auto home=ring_page_layout(20,view,512,384,20,0);
 assert(home.indices[0]==0&&home.indices[8]==8&&home.buttons[0].ymin>384&&home.buttons[1].xmin>512&&home.buttons[8].xmax<512);
 auto next=ring_page_layout(20,view,512,384,20,1);assert(next.indices[0]==1&&next.indices[8]==9);
 auto previous=ring_page_layout(20,view,512,384,20,-1);assert(previous.indices[0]==19&&previous.indices[1]==0);
 auto original=tool_ring_layout(20,view,512,384);auto finger=tool_ring_layout(20,view,512,384,true);
 assert(home.buttons[0].xmax-home.buttons[0].xmin>original.buttons[0].xmax-original.buttons[0].xmin);
 assert(home.footprint.xmax-home.footprint.xmin<2*7.4f*20+4.4f*20);
 assert(home.buttons[0].ymax-home.buttons[0].ymin<finger.buttons[0].ymax-finger.buttons[0].ymin);
 for(int total:{0,4097})assert(!ring_page_layout(20,view,512,384,total,0).fits);
 assert(!ring_page_layout(20,{0,60,0,900},0,0,20,0).fits);
 assert(!ring_page_layout(20,{0,360,0,80},0,0,20,0).fits);
 assert(!ring_page_layout(0,view,512,384,20,0).fits);
 assert(!ring_page_layout(20,view,512,384,20,std::numeric_limits<float>::quiet_NaN()).fits);
}
''')

    def test_base_slots_stay_fixed_when_current_tool_choice_appears_or_disappears(self):
        self.run_cpp(r'''
#include <cassert>
using namespace blender::ui::ipad;
bool equal(Rect a,Rect b){return a.xmin==b.xmin&&a.xmax==b.xmax&&a.ymin==b.ymin&&a.ymax==b.ymax;}
bool overlaps(Rect a,Rect b){return a.xmin<b.xmax&&b.xmin<a.xmax&&a.ymin<b.ymax&&b.ymin<a.ymax;}
int main(){
 for(float unit:{20.f,30.f,40.f})for(bool touch:{false,true})
 for(Rect v:{Rect{0,1000,0,800},Rect{30,360,20,900},Rect{50,240,60,760}}){
  Rect view{v.xmin*unit/20,v.xmax*unit/20,v.ymin*unit/20,v.ymax*unit/20};
  for(float x:{view.xmin,view.xmax})for(float y:{view.ymin,view.ymax}){
   auto all=ring_page_layout(unit,view,x,y,9,0,touch,true);assert(all.fits);
   auto tools=ring_page_layout(unit,view,x,y,9,0,touch);assert(tools.fits);
   for(int total:{1,5,6,9}){
    auto page=ring_page_layout(unit,view,x,y,total,7,touch,true);assert(page.fits);
    assert(page.buttons.size()==size_t(total)&&equal(page.footprint,all.footprint));
    for(int i=0;i<total;++i){
     assert(equal(page.buttons[i],all.buttons[i])&&equal(page.buttons[i],tools.buttons[i]));
     assert(page.indices[i]==i);
     if(!page.grid){auto b=page.buttons[i];assert(page.center_x<b.xmin||page.center_x>b.xmax||page.center_y<b.ymin||page.center_y>b.ymax);}
     for(int j=i+1;j<total;++j)assert(!overlaps(page.buttons[i],page.buttons[j]));
    }
   }
   assert(!ring_page_layout(unit,view,x,y,10,0,touch,true).fits);
   assert(ring_page_layout(unit,view,x,y,43,0,touch).fits);
  }
 }
 // Other short categories retain their original even spacing.
 auto legacy=ring_page_layout(20,{0,1000,0,800},500,400,5,0);
 auto fixed=ring_page_layout(20,{0,1000,0,800},500,400,5,0,false,true);
 assert(!equal(legacy.buttons[1],fixed.buttons[1]));
}
''')
        start = NATIVE.index('  data.visible_count = int(block->buttons.size());')
        end = NATIVE.index('  if (kind == ipad_ring::RingKind::Mode) {', start)
        self.assertIn('data.touch_tools, kind == ipad_ring::RingKind::Base)', NATIVE[start:end])

    def test_exact_classifier_propagates_anchor_and_touch_for_every_owned_menu(self):
        classifier=function(NATIVE,'bool UI_ipad_ring_menu(')
        call=function(changed_source('source/blender/windowmanager/intern/wm_operators.cc'),
                      'static wmOperatorStatus wm_call_pie_menu_invoke(')
        self.run_cpp(r'''
#include <cassert>
#include <cstring>
#include <string>
namespace ipad_ring=blender::ui::ipad;
struct bContext{};struct wmEvent{int xy[2]={7,9};};
struct Props{std::string name;bool anchor_override=true,touch=true;int x=470,y=330;};
struct wmOperator{Props *ptr;};using wmOperatorStatus=int;constexpr int BKE_ST_MAXNAME=256;
void RNA_string_get(Props *p,const char *,char *out){std::memcpy(out,p->name.c_str(),p->name.size()+1);}
bool RNA_boolean_get(Props *p,const char *key){return std::strcmp(key,"ipad_anchor_override")==0?p->anchor_override:p->touch;}
int RNA_int_get(Props *p,const char *key){return std::strcmp(key,"ipad_anchor_x")==0?p->x:p->y;}
CLASSIFIER
bool observed_touch=false;int observed[2]={};
wmOperatorStatus UI_pie_menu_invoke(bContext *,const char *,const wmEvent *event,bool touch){observed_touch=touch;observed[0]=event->xy[0];observed[1]=event->xy[1];return 1;}
CALL
int main(){bContext C;Props props;wmOperator op{&props};wmEvent event;
 for(const char *name:{"VIEW3D_MT_ipad_tools","VIEW3D_MT_ipad_selection_ring","VIEW3D_MT_ipad_transform_ring","VIEW3D_MT_ipad_modes","VIEW3D_MT_ipad_base_ring","VIEW3D_MT_ipad_layout_mode_ring","VIEW3D_MT_ipad_workspaces_ring","VIEW3D_MT_ipad_tool_inventory","VIEW3D_MT_ipad_selection_options","VIEW3D_MT_ipad_transform_options"}){
  props.name=name;assert(UI_ipad_ring_menu(name));assert(wm_call_pie_menu_invoke(&C,&op,&event)==1);
  assert(observed_touch&&observed[0]==470&&observed[1]==330&&event.xy[0]==7&&event.xy[1]==9);
  props.anchor_override=false;wm_call_pie_menu_invoke(&C,&op,&event);assert(observed[0]==7&&observed[1]==9);props.anchor_override=true;
  props.name+="_extra";assert(!UI_ipad_ring_menu(props.name.c_str()));wm_call_pie_menu_invoke(&C,&op,&event);assert(!observed_touch&&observed[0]==7&&observed[1]==9);
 }
 assert(!UI_ipad_ring_menu(nullptr));
 assert(blender::ui::ipad::ring_setting_stays_open(blender::ui::ipad::RingKind::SelectOptions,"VIEW3D_OT_ipad_selection_tool"));
}
'''.replace('CLASSIFIER',classifier).replace('CALL',call))

    def test_native_page_builder_hides_overflow_and_binds_current_modes_and_transitions(self):
        start=NATIVE.index('  data.visible_count = int(block->buttons.size());')
        end=NATIVE.index('  if (kind == ipad_ring::RingKind::Mode) {',start)
        fragment=NATIVE[start:end]
        self.run_cpp(r'''
#include <cassert>
#include <cstring>
#include <string>
#include <memory>
namespace ipad_ring=blender::ui::ipad;
#define STREQ(a,b) (std::strcmp(a,b)==0)
constexpr int UI_HIDDEN=1,UI_BUT_DISABLED=2,UI_SELECT_DRAW=4,UI_BUT_UNDO=8,UI_RETURN_CANCEL=1,UI_RADIAL_NONE=0;
constexpr int UI_BUT_ALIGN_TOP=1,UI_BUT_ALIGN_DOWN=2,UI_BUT_ALIGN_LEFT=4,UI_BUT_ALIGN_RIGHT=8,BKE_ST_MAXNAME=256;
constexpr float UI_UNIT_X=20;
namespace blender::ui{enum class EmbossType{Emboss};}
struct PointerRNA{std::string name="VIEW3D_MT_ipad_tool_inventory";int mode=1;bool anchored=false,touch=false;int x=0,y=0;};
struct wmOperatorType{const char *idname="WM_OT_call_menu_pie";};
struct uiBut{wmOperatorType *optype;PointerRNA *opptr;int flag=UI_BUT_UNDO,pie_dir=1,alignnr=1,drawflag=15;ipad_ring::Rect rect{};blender::ui::EmbossType emboss=blender::ui::EmbossType::Emboss;};
struct uiBlock{std::vector<std::unique_ptr<uiBut>> buttons;ipad_ring::Rect bounds{};bool ipad_ring_full_labels=false;};
struct Object{int mode=1;};struct bContext{Object *object;};struct uiPopupBlockHandle{int menuretval=0;};
struct Data{int visible_count=0,inventory_count=0,anchor[2]={350,400};float phase=0;bool touch_tools=false;};
Object *CTX_data_active_object(bContext *C){return C->object;}
int RNA_enum_get(PointerRNA *p,const char *){return p->mode;}
void RNA_string_get(PointerRNA *p,const char *,char *out){std::memcpy(out,p->name.c_str(),p->name.size()+1);}
void RNA_boolean_set(PointerRNA *p,const char *key,bool v){if(STREQ(key,"ipad_anchor_override"))p->anchored=v;else p->touch=v;}
void RNA_int_set(PointerRNA *p,const char *key,int v){if(STREQ(key,"ipad_anchor_x"))p->x=v;else p->y=v;}
bool UI_ipad_ring_menu(const char *name){return ipad_ring::ring_kind(name)!=ipad_ring::RingKind::None;}
void BLI_rctf_init(ipad_ring::Rect *r,float a,float b,float c,float d){*r={a,b,c,d};}
void UI_block_bounds_set_normal(uiBlock *,int){}
void UI_block_bounds_set_explicit(uiBlock *b,int a,int c,int d,int e){b->bounds={float(a),float(d),float(c),float(e)};}
uiBlock *build(bContext *C,uiBlock *block,uiPopupBlockHandle *handle,Data &data,ipad_ring::Rect viewport,ipad_ring::RingKind kind){FRAGMENT return nullptr;}
int main(){Object object;bContext C{&object};uiPopupBlockHandle handle;uiBlock block;Data data;wmOperatorType menu,mode{"OBJECT_OT_mode_set"};PointerRNA props[20];
 for(int i=0;i<20;++i)block.buttons.push_back(std::make_unique<uiBut>(uiBut{i==0?&mode:&menu,&props[i]}));
 auto run=[&](ipad_ring::RingKind kind=ipad_ring::RingKind::Inventory){return build(&C,&block,&handle,data,{40,800,90,900},kind);};
 assert(run()==&block&&data.visible_count==9&&!handle.menuretval);
 for(int i=0;i<20;++i){auto &b=*block.buttons[i];assert(bool(b.flag&UI_HIDDEN)==(i>=9));if(i<9)assert(!b.alignnr&&!b.pie_dir&&!b.drawflag);}
 assert(block.buttons[0]->flag&UI_SELECT_DRAW);assert(!(block.buttons[0]->flag&UI_BUT_UNDO));
 assert(props[1].anchored&&props[1].x==350&&props[1].y==400&&!props[1].touch);
 auto bounds=block.bounds;data.phase=1;assert(run()==&block);assert(block.buttons[0]->flag&UI_HIDDEN);assert(!(block.buttons[9]->flag&UI_HIDDEN));assert(block.bounds.xmin==bounds.xmin&&block.bounds.ymax==bounds.ymax);
 data.phase=0;object.mode=2;run(ipad_ring::RingKind::Layout);assert(!(block.buttons[0]->flag&UI_SELECT_DRAW));
 assert(build(&C,&block,&handle,data,{0,60,0,100},ipad_ring::RingKind::Inventory)==&block&&handle.menuretval==UI_RETURN_CANCEL);
 for(auto &b:block.buttons)assert((b->flag&(UI_HIDDEN|UI_BUT_DISABLED))==(UI_HIDDEN|UI_BUT_DISABLED));
}
'''.replace('FRAGMENT',fragment))


if __name__=='__main__':unittest.main()
