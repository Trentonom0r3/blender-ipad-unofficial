"""Exercise the ring-only visual predicate and common widget geometry.

Set IPAD_RING_SOURCE_ROOT to a materialized Blender source root while developing;
without it, inspect the authoritative overlay patch used by CI.
"""
from pathlib import Path
import os
import unittest

import test_ipad_panels
from test_compact_shelf import function
from test_tool_ring import ring_source
from test_touch_extrude import changed_source


def source(path):
    root = os.environ.get('IPAD_RING_SOURCE_ROOT')
    if root:
        return (Path(root) / path).read_text(encoding='utf-8')
    if path.endswith('interface_ipad_tool_ring.hh'):
        return ring_source()
    return changed_source(path)


HEADER = 'source/blender/editors/interface/interface_ipad_tool_ring.hh'
WIDGETS = 'source/blender/editors/interface/interface_widgets.cc'


class PencilRingVisualTests(unittest.TestCase):
    def run_cpp(self, text):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(text)

    def test_owned_visual_classification_is_not_tool_classification(self):
        widget = source(WIDGETS)
        helper = function(widget, 'static bool widget_is_ipad_ring_action(')
        self.run_cpp(r'''
#include <cassert>
#include <cstdint>
#include <initializer_list>
template<typename T, typename... U> bool elem(T value, U... options) {
  return ((value == options) || ...);
}
#define ELEM(...) elem(__VA_ARGS__)
constexpr int UI_PIE_IPAD_TOOLS = 128;
namespace blender::ui { enum class EmbossType { Emboss, Pulldown, PieMenu }; }
enum class ButType { But, Decorator, Menu, Block, Popover, ButMenu, Label, Num };
struct uiBlock { struct {int flags = UI_PIE_IPAD_TOOLS;} pie_data; uint64_t ipad_ring_lifetime = 7; };
struct uiBut { uiBlock *block; ButType type; blender::ui::EmbossType emboss; };
HELPER
int main() {
  uiBlock block;
  for (ButType type : {ButType::But, ButType::Decorator, ButType::Menu,
                       ButType::Block, ButType::Popover, ButType::ButMenu}) {
    uiBut action{&block, type, blender::ui::EmbossType::Emboss};
    for (int i=0;i<10000;++i) assert(widget_is_ipad_ring_action(&action));
    action.emboss=blender::ui::EmbossType::Pulldown;
    assert(!widget_is_ipad_ring_action(&action));
  }
  uiBut unrelated{&block, ButType::Label, blender::ui::EmbossType::Emboss};
  assert(!widget_is_ipad_ring_action(&unrelated));
  unrelated.type=ButType::But;
  block.pie_data.flags=0; assert(!widget_is_ipad_ring_action(&unrelated));
  block.pie_data.flags=UI_PIE_IPAD_TOOLS;
  block.ipad_ring_lifetime=0; assert(!widget_is_ipad_ring_action(&unrelated));
  block.ipad_ring_lifetime=7;
  unrelated.block=nullptr; assert(!widget_is_ipad_ring_action(&unrelated));
  assert(!widget_is_ipad_ring_action(nullptr));
}
'''.replace('HELPER', helper))
        self.assertIn('wt = widget_type(UI_WTYPE_TOOLBAR_ITEM);', widget)
        self.assertIn('widget_is_ipad_ring_action(but)', widget)
        self.assertIn('is_tool || ring_action', widget)
        self.assertIn('no_text_padding = (but->drawflag & UI_BUT_NO_TEXT_PADDING) ||', widget)
        self.assertIn('/* Render only: native selected/disabled states still flow', widget)

    def test_common_nine_slot_dimensions_and_no_overlap(self):
        header = source(HEADER).replace('#pragma once', '')
        self.run_cpp(header + r'''
#include <cassert>
#include <cmath>
using namespace blender::ui::ipad;
bool overlaps(Rect a, Rect b) {
  return a.xmin < b.xmax && b.xmin < a.xmax &&
         a.ymin < b.ymax && b.ymin < a.ymax;
}
int main() {
 ActionOrigin origin; assert(!origin.corner); origin.corner=true; assert(origin.corner);
 for (float unit : {20.f, 30.f, 40.f}) for (bool touch : {false, true}) {
  Rect view{0, 1000*unit/20, 0, 800*unit/20};
  auto tools=tool_ring_layout(unit,view,500*unit/20,400*unit/20,touch);
  auto page=ring_page_layout(unit,view,500*unit/20,400*unit/20,9,0,touch);
  auto base=ring_page_layout(unit,view,500*unit/20,400*unit/20,6,0,touch,true);
  assert(tools.fits && page.fits && base.fits && !tools.grid && !page.grid && !base.grid);
  for (int i=0;i<9;++i) {
   const auto &a=tools.buttons[i], &b=page.buttons[i];
   assert(std::abs((a.xmax-a.xmin)-(b.xmax-b.xmin))<.01f);
   assert(std::abs((a.ymax-a.ymin)-(b.ymax-b.ymin))<.01f);
   assert(a.xmin>=view.xmin && a.xmax<=view.xmax && a.ymin>=view.ymin && a.ymax<=view.ymax);
   for (int j=i+1;j<9;++j) {
    assert(!overlaps(a,tools.buttons[j]));
    assert(!overlaps(b,page.buttons[j]));
   }
  }
  assert(page.buttons[0].ymin > page.center_y);
  assert(page.buttons[1].xmin > page.center_x);
  assert(page.buttons[8].xmax < page.center_x);
  for (int i=0;i<6;++i) {
   const auto &a=base.buttons[i], &b=page.buttons[i];
   assert(std::abs((a.xmax-a.xmin)-(b.xmax-b.xmin))<.01f);
   assert(std::abs((a.ymax-a.ymin)-(b.ymax-b.ymin))<.01f);
  }
 }
}
''')

    def test_common_short_labels_fit_without_midword_split(self):
        header = source(HEADER).replace('#pragma once', '')
        self.run_cpp(header + r'''
#include <cassert>
using namespace blender::ui::ipad;
int main() {
  auto measure=[](std::string_view label,float scale) {
    float width=label=="Transform" ? 55.f : label=="Select" ? 32.f :
                label=="Tools" ? 29.f : label.size()*6.f;
    return RingLabelMetrics{width*scale,0,-2,10*scale};
  };
  for (float ui_scale : {1.f,1.5f,2.f}) {
    /* 4.7 native units, native toolbar icon, 2-pixel gap, outline pixel, 1-pixel insets. */
    float text_width=(4.7f*20.f-32.f-2.f-1.f-2.f)*ui_scale;
    for (auto label : {"Transform","Select","Tools"}) {
      auto fit=ring_label_fit(label,text_width,32.f*ui_scale,ui_scale,measure);
      assert(fit.fits && fit.lines.size()==1 && fit.word_splits==0);
      assert(fit.lines[0].text==label);
    }
  }
}
''')



    def test_measured_overflow_cue_never_covers_targets_or_empty_center(self):
        header=source(HEADER).replace('#pragma once','')
        self.run_cpp(header+r"""
#include <cassert>
using namespace blender::ui::ipad;
int main(){
 int visible_cues=0;
 for(float unit:{20.f,30.f,40.f})for(bool touch:{false,true})for(int turn=0;turn<90;++turn){
  Rect view{0,unit*60,0,unit*45};
  auto page=ring_page_layout(unit,view,unit*30,unit*22,9,float(turn)/10,touch);
  assert(page.fits);
  std::vector<Rect> buttons(page.buttons.begin(),page.buttons.end());
  Rect bounds=buttons[0];
  for(auto b:buttons){bounds.xmin=std::min(bounds.xmin,b.xmin);bounds.xmax=std::max(bounds.xmax,b.xmax);
   bounds.ymin=std::min(bounds.ymin,b.ymin);bounds.ymax=std::max(bounds.ymax,b.ymax);}
  auto cue=ring_browse_cue_layout(bounds,buttons,43,9,unit*3.2f,unit*1.3f,unit*.2f);
  if(cue.fits){++visible_cues;auto r=cue.bounds;
   assert(r.xmin>=bounds.xmin&&r.xmax<=bounds.xmax&&r.ymin>=bounds.ymin&&r.ymax<=bounds.ymax);
   assert(!(r.xmin<=page.center_x&&r.xmax>=page.center_x&&r.ymin<=page.center_y&&r.ymax>=page.center_y));
   for(auto b:buttons)assert(!(r.xmin<b.xmax&&b.xmin<r.xmax&&r.ymin<b.ymax&&b.ymin<r.ymax));
  }
  assert(!ring_browse_cue_layout(bounds,buttons,9,9,unit*3.2f,unit*1.3f,unit*.2f).fits);
  assert(!ring_browse_cue_layout(bounds,buttons,43,9,unit*100,unit*100,unit*.2f).fits);
 }
 assert(visible_cues>0);
 Rect full{0,100,0,100};
 assert(!ring_browse_cue_layout(full,{full},2,1,20,20,2).fits);
 assert(!ring_browse_cue_layout(full,{full},2,1,NAN,20,2).fits);
}
""")
        pie=source('source/blender/editors/interface/regions/interface_region_menu_pie.cc')
        self.assertIn('Press & circle',pie)
        self.assertIn('ring_browse_cue_layout',pie)


if __name__ == '__main__':
    unittest.main()