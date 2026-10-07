"""Execute full-label fitting/rendering; native BLF/GPU calls are fixtures.

Actual font measurements are a separate stock-host audit, not device evidence.
"""
from pathlib import Path
import unittest
from test_compact_shelf import function
from test_touch_extrude import changed_source
from test_tool_ring import ring_source
import test_ipad_panels

POLICY = ring_source().replace('#pragma once', '')
NATIVE = changed_source('source/blender/editors/interface/interface_widgets.cc')


class PencilRingLabelTests(unittest.TestCase):
    def run_cpp(self, source):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(POLICY+'\n'+source)

    def test_full_utf8_word_wrapping_bounds_refusal_and_font_floor(self):
        self.run_cpp(r'''
#include <cassert>
#include <limits>
using namespace blender::ui::ipad;
int main(){
 auto measure=[](std::string_view s,float scale){
  int glyphs=0;for(unsigned char c:s)if((c&0xc0)!=0x80)++glyphs;
  return RingLabelMetrics{glyphs*6.f*scale,-1,-2,8*scale};
 };
 for(int i=0;i<10000;++i){
  auto fit=ring_label_fit("Extrude Along Normals",48,34,1,measure);
  assert(fit.fits&&fit.scale==1&&fit.lines.size()==3&&fit.height==32);
  assert(fit.lines[0].text=="Extrude"&&fit.lines[1].text=="Along"&&fit.lines[2].text=="Normals");
  std::string joined;for(auto &line:fit.lines){assert(line.metrics.width<=48);joined+=line.text;}
  assert(joined=="ExtrudeAlongNormals");
 }
 auto fit=ring_label_fit("Shrink/Fatten",43,25,1,measure);
 assert(fit.fits&&fit.lines.size()==2&&fit.lines[0].text=="Shrink/");
 fit=ring_label_fit(u8"Élévation 東京 工具",36,34,1,measure);
 assert(fit.fits);std::string joined;
 for(auto &line:fit.lines){joined+=line.text;assert((static_cast<unsigned char>(line.text.front())&0xc0)!=0x80);}
 joined.erase(std::remove(joined.begin(),joined.end(),' '),joined.end());
 assert(joined==u8"Élévation東京工具");
 fit=ring_label_fit("abcdefghij",55,12,1,measure);
 assert(fit.fits&&fit.scale==.9f&&fit.lines.size()==1);
 fit=ring_label_fit("Left\nRight",40,25,1,measure);assert(fit.fits&&fit.lines.size()==2);
 for(std::string_view s:{std::string_view(""),std::string_view("\xc0\xaf"),std::string_view("\xed\xa0\x80"),std::string_view("\xf4\x90\x80\x80"),std::string_view("\xe6\x9d"),std::string_view("\nleft"),std::string_view("one\ntwo\nthree\nfour")})
  assert(!ring_label_fit(s,48,34,1,measure).fits);
 assert(!ring_label_fit("longlonglonglonglonglonglonglonglonglong",18,34,1,measure).fits);
 assert(!ring_label_fit(std::string(513,'x'),48,34,1,measure).fits);
 assert(!ring_label_fit(std::string_view("bad\0tail",8),48,34,1,measure).fits);
 assert(!ring_label_fit("small",1,1,1,measure).fits);
 assert(!ring_label_fit("small",48,34,-1,measure).fits);
 assert(!ring_label_fit("small",std::numeric_limits<float>::quiet_NaN(),34,1,measure).fits);
 auto bad=[](std::string_view,float){return RingLabelMetrics{std::numeric_limits<float>::quiet_NaN(),0,0,1};};
 assert(!ring_label_fit("small",48,34,1,bad).fits);
}
''')

    def test_native_renderer_uses_exact_measured_lines_restores_style_and_leaves_legacy_widgets(self):
        repo=Path(__file__).resolve().parents[1]
        dna=(repo/'build/fixtures/pinned_ui_font_style.hh').read_text(encoding='utf-8')
        font=dna[dna.index('typedef struct uiFontStyle {'):dna.index('} uiFontStyle;')+len('} uiFontStyle;')]
        helper=function(NATIVE,'static bool widget_draw_ipad_ring_label(')
        self.run_cpp(r'''
#include <cassert>
#include <string>
#include <vector>
#include <cmath>
FONT
using uchar=unsigned char;
using FontFlags=int;enum class FontShadowType{None,Blur};
constexpr int UI_PIE_IPAD_TOOLS=128,UI_BUT_HAS_SEP_CHAR=1,UI_BUT_TEXT_LEFT=2,BLF_CLIPPING=1,BLF_SHADOW=2,BLF_BOLD=4,BLF_ITALIC=8;
constexpr float UI_SCALE_FAC=1;constexpr char UI_SEP_CHAR='|';
struct rcti{int xmin=0,xmax=0,ymin=0,ymax=0;};
struct uiWidgetColors{uchar text[4]={240,240,240,255};};
struct uiBlock{struct{int flags=UI_PIE_IPAD_TOOLS;}pie_data;uint64_t ipad_ring_lifetime=7;bool ipad_ring_full_labels=true;};
struct uiBut{uiBlock *block;const char *editstr=nullptr;std::string drawstr;int flag=0,drawflag=UI_BUT_TEXT_LEFT;bool ipad_ring_label_fit=true;};
float current_size=11;bool clipped=false;int active_flags=0,shadow_calls=0;float px=0,py=0;std::vector<std::string> drawn;
void UI_fontstyle_set(const uiFontStyle *s){current_size=s->points;}
int BLI_rcti_size_x(const rcti *r){return r->xmax-r->xmin;}
int BLI_rcti_size_y(const rcti *r){return r->ymax-r->ymin;}
float BLF_width(int,const char *,size_t n){return float(n)*current_size*.5f;}
void BLF_boundbox(int,const char *,size_t n,rcti *r){*r={-1,int(std::ceil(float(n)*current_size*.5f)),-2,int(std::ceil(current_size*.7f))};}
void BLF_enable(int,int flags){active_flags|=flags;clipped=active_flags&BLF_CLIPPING;}
void BLF_disable(int,int flags){active_flags&=~flags;clipped=active_flags&BLF_CLIPPING;}
void BLF_shadow(int,FontShadowType,const float *){++shadow_calls;}
void BLF_shadow_offset(int,int,int){}
void BLF_clipping(int,int,int,int,int){}void BLF_color4ubv(int,const uchar *){}
void BLF_position(int,float x,float y,float){px=x;py=y;}
void BLF_draw(int,const char *s,size_t n){assert(clipped&&px>=0&&py>=0);drawn.emplace_back(s,n);}
HELPER
int main(){uiBlock block;uiBut but{&block,nullptr,"Extrude Along Normals"};uiFontStyle font{};font.points=11;uiWidgetColors color;rcti rect{0,48,0,36};
 const auto label=but.drawstr;assert(widget_draw_ipad_ring_label(&font,&color,&but,&rect));
 assert(but.ipad_ring_label_fit&&drawn.size()==3&&but.drawstr==label&&current_size==11&&!clipped);
 drawn.clear();but.drawstr="Select|W";but.flag=UI_BUT_HAS_SEP_CHAR;
 assert(widget_draw_ipad_ring_label(&font,&color,&but,&rect)&&drawn.size()==1&&drawn[0]=="Select"&&but.drawstr=="Select|W");
 drawn.clear();rect.xmax=3;assert(widget_draw_ipad_ring_label(&font,&color,&but,&rect));
 assert(!but.ipad_ring_label_fit&&drawn.empty()&&current_size==11&&!clipped);
 rect.xmax=48;assert(widget_draw_ipad_ring_label(&font,&color,&but,&rect)&&but.ipad_ring_label_fit);
 font.bold=font.italic=font.shadow=1;font.shadowalpha=.5f;drawn.clear();
 assert(widget_draw_ipad_ring_label(&font,&color,&but,&rect)&&shadow_calls==1&&!active_flags&&current_size==11);
 rect.xmax=3;assert(widget_draw_ipad_ring_label(&font,&color,&but,&rect)&&!active_flags&&!but.ipad_ring_label_fit&&current_size==11);rect.xmax=48;
 block.ipad_ring_full_labels=false;assert(!widget_draw_ipad_ring_label(&font,&color,&but,&rect));block.ipad_ring_full_labels=true;
 block.ipad_ring_lifetime=0;assert(!widget_draw_ipad_ring_label(&font,&color,&but,&rect));block.ipad_ring_lifetime=7;
 block.pie_data.flags=0;assert(!widget_draw_ipad_ring_label(&font,&color,&but,&rect));block.pie_data.flags=UI_PIE_IPAD_TOOLS;
 but.editstr="edit";assert(!widget_draw_ipad_ring_label(&font,&color,&but,&rect));
}
'''.replace('FONT',font).replace('HELPER',helper))
        drawing=function(NATIVE,'static void widget_draw_text_icon(')
        self.assertLess(drawing.index('widget_draw_extra_icons('),drawing.index('widget_draw_ipad_ring_label('))
        self.assertLess(drawing.index('widget_draw_ipad_ring_label('),drawing.index('ui_text_clip_middle('))
        creator=changed_source('source/blender/editors/interface/regions/interface_region_menu_pie.cc')
        self.assertIn('block->ipad_ring_full_labels = ipad_ring::ring_uses_pages(kind);',creator)

    def test_actual_widget_draw_resets_migrated_proof_before_every_render_route(self):
        drawing=changed_source('source/blender/editors/interface/interface.cc')
        start=drawing.index('  int ipad_drawn_buttons = 0, ipad_button_index = -1;')
        end=drawing.index('  UI_widgetbase_draw_cache_end();',start)
        fragment=drawing[start:end]
        self.run_cpp(r'''
#include <cassert>
#include <memory>
constexpr int UI_PIE_IPAD_TOOLS=128,UI_HIDDEN=1,UI_SCROLLED=2;
struct rcti{int xmin=0,xmax=90,ymin=0,ymax=34;};struct bContext{};struct ARegion{};struct Style{};
struct uiIPadRingDrawItem{int index;rcti rect;};
struct uiBut{int flag=0;bool ipad_ring_label_fit=true,rendered_full=false;};
struct uiBlock{bool ipad_ring_full_labels=true;struct{int flags=UI_PIE_IPAD_TOOLS;}pie_data;std::vector<std::unique_ptr<uiBut>> buttons;};
int draws=0;bool expected_reset=true;
void ui_but_to_pixelrect(rcti *rect,ARegion *,uiBlock *,uiBut *){*rect={0,90,0,34};}
bool ui_but_pixelrect_in_view(ARegion *,rcti *){return true;}
void ui_draw_but(bContext *,ARegion *,Style *,uiBut *but,rcti *){
 ++draws;if(expected_reset)assert(!but->ipad_ring_label_fit);
 // Model a native editstr/custom route bypassing the full-label renderer.
 if(but->rendered_full)but->ipad_ring_label_fit=true;
}
int frame(bContext *C,ARegion *region,uiBlock *block){Style style;rcti rect;FRAGMENT
 assert(ipad_drawn_bounds.xmax==90);return ipad_drawn_buttons;
}
int main(){bContext C;ARegion region;uiBlock block;block.buttons.push_back(std::make_unique<uiBut>());
 auto &but=*block.buttons[0];assert(frame(&C,&region,&block)==1&&!but.ipad_ring_label_fit);
 but.rendered_full=true;assert(frame(&C,&region,&block)==1&&but.ipad_ring_label_fit);
 but.rendered_full=false;assert(frame(&C,&region,&block)==1&&!but.ipad_ring_label_fit);
 but.ipad_ring_label_fit=true;but.flag=UI_SCROLLED;assert(frame(&C,&region,&block)==0&&!but.ipad_ring_label_fit);
 but.flag=0;but.ipad_ring_label_fit=true;block.ipad_ring_full_labels=false;expected_reset=false;
 assert(frame(&C,&region,&block)==1&&but.ipad_ring_label_fit);assert(draws==4);
}
'''.replace('FRAGMENT',fragment))


if __name__=='__main__':unittest.main()
