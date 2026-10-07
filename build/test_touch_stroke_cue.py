"""Execute admitted native Transform feedback and bounded non-interactive drawing.

Font declarations are pinned; modal lists/context/GPU rendering are modeled.
Target native timing and device comfort remain separate evidence.
"""
import unittest
import test_ipad_panels
from test_tool_ring import ring_source
from test_touch_extrude import changed_source
from test_compact_shelf import function
from test_touch_mode_access import FONT_TYPES

POLICY=ring_source().replace('#pragma once','')
TRANSFORM=changed_source('source/blender/editors/transform/transform.cc')
OPS=changed_source('source/blender/editors/transform/transform_ops.cc')
DRAW=changed_source('source/blender/editors/interface/regions/interface_region_menu_pie.cc')
COMMON=r'''
#define WITH_APPLE_CROSSPLATFORM
#include <cassert>
#include <algorithm>
#include <array>
#include <cstdint>
#include <cstring>
#include <string>
#include <vector>
#define IFACE_(x) (x)
template<class T,class...V>bool elem(T a,V...v){return ((a==v)||...);}
#define ELEM(a,...) elem(a,__VA_ARGS__)
enum {LEFTMOUSE=1,SPACE_VIEW3D=2,RGN_TYPE_WINDOW=3,WM_EVENT_IS_DIRECT_TOOL=128};
enum {T_RELEASE_CONFIRM=4,T_NO_CURSOR_WRAP=8,OP_IS_MODAL_GRAB_CURSOR=16};
enum {TFM_TRANSLATION=10,TFM_ROTATION=11,TFM_RESIZE=12,CON_APPLY=1};
enum {TRANS_STARTING=0,TRANS_RUNNING=1,TRANS_CONFIRM=2,TRANS_CANCEL=3};
struct ARegion{int regiontype=RGN_TYPE_WINDOW;};
struct TransInfo{int mode=TFM_TRANSLATION,flag=T_RELEASE_CONFIRM,spacetype=SPACE_VIEW3D,state=TRANS_STARTING;
 ARegion *region=nullptr;bool is_launch_event_drag=true;short launch_event=LEFTMOUSE;
 bool ipad_direct_stroke=false;uint64_t ipad_stroke_context[13]{};
 float values_modal_offset[4]{};struct{int mode=0;char text[64]{};}con;struct{bool precision=false;}mouse;
};
struct wmEvent{int type=LEFTMOUSE,flag=WM_EVENT_IS_DIRECT_TOOL;};
struct wmOperator{void *customdata=nullptr,*opm=nullptr,*ptr=nullptr;int flag=0;};
struct bContext{bool live=true;uint64_t owner=7;};
int captures=0;
bool UI_ipad_context_capture(bContext *C,uint64_t *v){++captures;if(!C->live)return false;v[0]=C->owner;return true;}
'''

class TouchStrokeCueTests(unittest.TestCase):
 def run_cpp(self,source):
  test_ipad_panels.IPadWorkspacePanelsTests()._run_source(source)

 def test_exact_geometry_clips_only_title_and_keeps_native_top_band(self):
  self.run_cpp(POLICY+r'''
#include <cassert>
#include <limits>
namespace p=blender::ui::ipad;
int main(){int cases=0;
 for(float scale:{1.f,1.5f,2.f})for(float x:{-120.f,0.f,90.f})
 for(float width:{180.f,230.f,336.f,700.f})for(float height:{90.f,160.f,500.f})
 for(float title:{40.f,200.f,1000.f}){
  p::Rect viewport{x,x+width*scale,-30,-30+height*scale};
  const auto cue=p::stroke_cue_layout(20*scale,viewport,{title*scale,104*scale,192*scale});++cases;
  if(!cue.fits)continue;
  const auto &r=cue.bounds;
  assert(r.xmin>=viewport.xmin&&r.xmax<=viewport.xmax&&r.ymin>=viewport.ymin);
  assert(r.xmax-r.xmin<=336*scale+.01f);
  assert(r.ymax<=viewport.ymax-40*scale);
  assert(cue.lines[1].xmax-cue.lines[1].xmin>=104*scale);
  assert(cue.lines[2].xmax-cue.lines[2].xmin>=192*scale);
  for(int i=0;i<3;++i){const auto &line=cue.lines[i];assert(line.xmin>=r.xmin&&line.xmax<=r.xmax&&line.ymin>=r.ymin&&line.ymax<=r.ymax);if(i)assert(line.ymax<=cue.lines[i-1].ymin);}
 }
 assert(cases==324);
 assert(p::stroke_cue_layout(20,{0,700,0,500},{1000,104,192}).fits);
 assert(!p::stroke_cue_layout(20,{0,700,0,500},{40,400,192}).fits);
 assert(!p::stroke_cue_layout(20,{0,700,0,500},{40,104,400}).fits);
 assert(!p::stroke_cue_layout(20,{0,700,0,100},{40,104,192}).fits);
 assert(!p::stroke_cue_layout(0,{0,700,0,500},{40,104,192}).fits);
 assert(!p::stroke_cue_layout(20,{0,700,0,500},{40,-1,192}).fits);
 const auto nan=std::numeric_limits<float>::quiet_NaN();
 assert(!p::stroke_cue_layout(nan,{0,700,0,500},{40,104,192}).fits);
 assert(!p::stroke_cue_layout(20,{nan,700,0,500},{40,104,192}).fits);
 assert(!p::stroke_cue_layout(20,{0,700,0,500},{40,nan,192}).fits);
}
''')

 def test_native_invocation_and_explicit_reset_admit_only_owned_direct_drag(self):
  invoke=function(OPS,'static wmOperatorStatus transform_invoke(')
  start=TRANSFORM.index('  t->ipad_direct_stroke = false;',TRANSFORM.index('bool initTransform('))
  reset=TRANSFORM[start:TRANSFORM.index('\n#endif',start)]
  self.run_cpp(COMMON+r'''
using wmOperatorStatus=int;
enum {OPERATOR_CANCELLED=1,OPERATOR_FINISHED=2,OPERATOR_RUNNING_MODAL=4};
struct{int moving=1;}G;
bool data_ok=true,handler_ok=true,numeric=false;int handlers=0,execs=0,applies=0;
void reset(TransInfo *t){RESET}
int transformops_data(bContext *,wmOperator *op,const wmEvent *){reset(static_cast<TransInfo *>(op->customdata));return data_ok;}
bool RNA_struct_property_is_set(void *,const char *){return numeric;}
int transform_exec(bContext *,wmOperator *){++execs;return OPERATOR_FINISHED;}
void *WM_event_add_modal_handler(bContext *,wmOperator *){++handlers;return handler_ok?&handlers:nullptr;}
bool is_zero_v4(float *v){return v[0]==0&&v[1]==0&&v[2]==0&&v[3]==0;}
#define UNLIKELY(x) (x)
void transformApply(bContext *,TransInfo *){++applies;}
INVOKE
int main(){ARegion region;TransInfo t;t.region=&region;bContext C;wmEvent event;wmOperator op;op.customdata=&t;
 t.ipad_direct_stroke=true;for(auto &v:t.ipad_stroke_context)v=42;reset(&t);assert(!t.ipad_direct_stroke);for(auto v:t.ipad_stroke_context)assert(!v);
 auto call=[&](){captures=0;handlers=0;return transform_invoke(&C,&op,&event);};
 assert(call()==OPERATOR_RUNNING_MODAL&&t.ipad_direct_stroke&&captures==1&&t.ipad_stroke_context[0]==7&&handlers==1);
 event.flag=0;assert(call()==OPERATOR_RUNNING_MODAL&&!t.ipad_direct_stroke&&!captures);event.flag=WM_EVENT_IS_DIRECT_TOOL;
 event.type=9;call();assert(!t.ipad_direct_stroke&&!captures);event.type=LEFTMOUSE;
 t.is_launch_event_drag=false;call();assert(!t.ipad_direct_stroke&&!captures);t.is_launch_event_drag=true;
 t.launch_event=9;call();assert(!t.ipad_direct_stroke&&!captures);t.launch_event=LEFTMOUSE;
 t.flag=0;call();assert(!t.ipad_direct_stroke&&!captures);t.flag=T_RELEASE_CONFIRM;
 op.opm=&op;call();assert(!t.ipad_direct_stroke&&!captures);op.opm=nullptr;
 t.mode=99;call();assert(!t.ipad_direct_stroke&&!captures);t.mode=TFM_TRANSLATION;
 t.spacetype=9;call();assert(!t.ipad_direct_stroke&&!captures);t.spacetype=SPACE_VIEW3D;
 region.regiontype=9;call();assert(!t.ipad_direct_stroke&&!captures);region.regiontype=RGN_TYPE_WINDOW;
 t.region=nullptr;call();assert(!t.ipad_direct_stroke&&!captures);t.region=&region;
 handler_ok=false;call();assert(!t.ipad_direct_stroke&&!captures);handler_ok=true;
 C.live=false;call();assert(!t.ipad_direct_stroke&&captures==1);C.live=true;
 data_ok=false;assert(call()==OPERATOR_CANCELLED&&!t.ipad_direct_stroke&&!handlers&&!captures&&G.moving==0);data_ok=true;
 captures=handlers=0;numeric=true;assert(transform_invoke(&C,&op,nullptr)==OPERATOR_FINISHED&&execs==1&&!handlers&&!captures&&!t.ipad_direct_stroke);numeric=false;
 captures=handlers=0;assert(transform_invoke(&C,&op,nullptr)==OPERATOR_RUNNING_MODAL&&!t.ipad_direct_stroke&&!captures);
 for(int mode:{TFM_TRANSLATION,TFM_ROTATION,TFM_RESIZE}){t.mode=mode;assert(call()==OPERATOR_RUNNING_MODAL&&t.ipad_direct_stroke);}
}
'''.replace('RESET',reset).replace('INVOKE',invoke))

 def test_actual_pixel_cue_uses_observed_state_and_hides_before_context_reads(self):
  draw=function(TRANSFORM,'static void draw_ipad_transform_stroke(')
  self.run_cpp(COMMON+r'''
int matches=0,draws=0;std::string status;
bool UI_ipad_context_matches(bContext *C,const uint64_t *v){++matches;return C->live&&v[0]==C->owner;}
void UI_ipad_stroke_cue_draw(const bContext *,ARegion *,const uint64_t *,const char *s){++draws;status=s;}
DRAW
int main(){ARegion region,other;TransInfo t;t.region=&region;t.ipad_direct_stroke=true;t.ipad_stroke_context[0]=7;bContext C;
 draw_ipad_transform_stroke(&C,&region,&t);assert(draws==1&&status=="Move · Free");
 t.con.mode=CON_APPLY;std::copy_n("along global X",sizeof("along global X"),t.con.text);t.mouse.precision=true;
 draw_ipad_transform_stroke(&C,&region,&t);assert(draws==2&&status=="Move along global X · Fine");
 t.mode=TFM_ROTATION;t.mouse.precision=false;draw_ipad_transform_stroke(&C,&region,&t);assert(draws==3&&status=="Rotate along global X");
 t.mode=TFM_RESIZE;t.con.mode=0;draw_ipad_transform_stroke(&C,&region,&t);assert(draws==4&&status=="Scale · Free");
 t.mode=99;draw_ipad_transform_stroke(&C,&region,&t);assert(draws==4);t.mode=TFM_TRANSLATION;
 matches=0;t.ipad_direct_stroke=false;draw_ipad_transform_stroke(&C,&region,&t);assert(!matches&&draws==4);t.ipad_direct_stroke=true;
 draw_ipad_transform_stroke(&C,&other,&t);assert(!matches&&draws==4);
 for(int state:{TRANS_CONFIRM,TRANS_CANCEL}){t.ipad_direct_stroke=true;t.state=state;draw_ipad_transform_stroke(&C,&region,&t);assert(!matches&&draws==4&&!t.ipad_direct_stroke);}t.state=TRANS_RUNNING;
 t.ipad_direct_stroke=true;t.flag=0;draw_ipad_transform_stroke(&C,&region,&t);assert(!matches&&draws==4);t.flag=T_RELEASE_CONFIRM;
 t.ipad_direct_stroke=true;C.live=false;draw_ipad_transform_stroke(&C,&region,&t);assert(matches==1&&draws==4);C.live=true;
 t.ipad_direct_stroke=true;++C.owner;draw_ipad_transform_stroke(&C,&region,&t);assert(matches==2&&draws==4);--C.owner;
 draw_ipad_transform_stroke(&C,&region,&t);assert(matches==2&&draws==4&&!t.ipad_direct_stroke);
 t.ipad_direct_stroke=true;draw_ipad_transform_stroke(&C,&region,&t);assert(matches==3&&draws==5);
}
'''.replace('DRAW',draw))

 def test_actual_native_draw_rejects_before_gpu_and_clips_local_rows(self):
  draw=function(DRAW,'void UI_ipad_stroke_cue_draw(')
  self.run_cpp(POLICY+FONT_TYPES+r'''
#define WITH_APPLE_CROSSPLATFORM
#include <cassert>
#include <cstring>
#include <string>
#include <vector>
namespace ipad_ring=blender::ui::ipad;
using uchar=unsigned char;
#define IFACE_(x) (x)
constexpr float UI_UNIT_X=20;
struct rcti{int xmin,xmax,ymin,ymax;};struct rctf{float xmin,xmax,ymin,ymax;};
struct ARegion{rcti winrct{100,800,-80,650};};
struct bContext{ARegion *region;bool live=true;uint64_t owner=7;ipad_ring::Rect viewport{140,750,40,650};};
ARegion *CTX_wm_region(const bContext *C){return C->region;}
bool UI_ipad_context_matches(bContext *C,const uint64_t *v){return C->live&&C->owner==v[0];}
ipad_ring::Rect ui_ipad_ring_viewport(bContext *C){return C->viewport;}
uiStyle style{};int font_calls=0,glyph_width=8,gpu_calls=0,box_calls=0,text_calls=0,theme_calls=0; rctf box;
std::vector<rcti> clips;std::vector<std::string> texts;
const uiStyle *UI_style_get_dpi(){++font_calls;return &style;}
int UI_fontstyle_string_width(const uiFontStyle *f,const char *s){assert(f==&style.widget);return int(std::strlen(s))*glyph_width;}
enum {TH_PANEL_BACK=1,TH_TEXT=2,GPU_BLEND_ALPHA=3,GPU_BLEND_NONE=4,UI_CNR_ALL=15,UI_STYLE_TEXT_CENTER=1};
void UI_GetThemeColor4fv(int id,float *v){assert(id==TH_PANEL_BACK);++theme_calls;v[0]=v[1]=v[2]=.1f;v[3]=.5f;}
void UI_GetThemeColor4ubv(int id,uchar *v){assert(id==TH_TEXT);++theme_calls;for(int i=0;i<4;++i)v[i]=255;}
void GPU_blend(int mode){assert(mode==GPU_BLEND_ALPHA||mode==GPU_BLEND_NONE);++gpu_calls;}
void UI_draw_roundbox_corner_set(int mode){assert(mode==UI_CNR_ALL);}
void UI_draw_roundbox_4fv(rctf *r,bool fill,float radius,float *color){assert(fill&&radius==12&&color[3]==.96f);box=*r;++box_calls;}
struct uiFontStyleDraw_Params{int align;unsigned word_wrap:1;};
void UI_fontstyle_draw(const uiFontStyle *f,const rcti *r,const char *s,size_t n,const uchar *,const uiFontStyleDraw_Params *p){assert(f==&style.widget&&n==std::strlen(s)&&p->align==UI_STYLE_TEXT_CENTER&&!p->word_wrap);clips.push_back(*r);texts.emplace_back(s);++text_calls;}
DRAW
int main(){ARegion region,other;bContext C{&region};uint64_t receipt[13]={7};
 C.live=false;UI_ipad_stroke_cue_draw(&C,&region,receipt,"Move");assert(!font_calls&&!gpu_calls&&!theme_calls);C.live=true;
 UI_ipad_stroke_cue_draw(&C,&other,receipt,"Move");assert(!font_calls&&!gpu_calls&&!theme_calls);
 ++C.owner;UI_ipad_stroke_cue_draw(&C,&region,receipt,"Move");assert(!font_calls&&!gpu_calls);--C.owner;
 UI_ipad_stroke_cue_draw(&C,&region,receipt,nullptr);assert(!font_calls&&!gpu_calls);
 C.viewport={140,230,40,650};UI_ipad_stroke_cue_draw(&C,&region,receipt,"Move");assert(font_calls==1&&!gpu_calls&&!theme_calls);
 C.viewport={140,750,40,650};glyph_width=20;UI_ipad_stroke_cue_draw(&C,&region,receipt,"Move");assert(font_calls==2&&!gpu_calls&&!theme_calls);glyph_width=8;
 UI_ipad_stroke_cue_draw(&C,&region,receipt,"Move along global X · Fine");
 assert(gpu_calls==2&&box_calls==1&&text_calls==3&&theme_calls==2);
 assert(texts[1]=="Lift to apply"&&texts[2]=="Two-finger drag to cancel");
 assert(box.xmin>=40&&box.xmax<=650&&box.ymin>=120&&box.ymax<=690-40);
 for(const auto &r:clips)assert(r.xmin>=box.xmin&&r.xmax<=box.xmax&&r.ymin>=box.ymin&&r.ymax<=box.ymax);
 for(int i=1;i<3;++i)assert(clips[i].ymax<=clips[i-1].ymin);
}
'''.replace('DRAW',draw))

if __name__=='__main__':unittest.main()
