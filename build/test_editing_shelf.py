"""Native shipped placement, direct-drag exclusion and rejected block ownership."""
import unittest
import test_ipad_panels
from test_touch_extrude import changed_source


class EditingShelfTests(unittest.TestCase):
    def test_landscape_portrait_splits_scale_navigation_and_occlusion(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#include "ipad_workspace_panels.hh"
#include <cassert>
#include <cmath>
namespace p=blender::ed::ipad::panels;
bool hit(p::Rect r,int x,int y) {return x>=r.xmin&&x<r.xmax&&y>=r.ymin&&y<r.ymax;}
int main() {
  for(float scale:{1.f,1.5f,2.f}) {
    for(int w:{190,240,340,420,600,768,1024,1366}) {
      for(int h:{180,280,400,600,834,1024}) {
        p::Rect canvas{int(60*scale),int(72*scale),int((60+w)*scale),int((72+h)*scale)};
        for(bool nav:{false,true}) {
          p::Rect navigation=nav?p::Rect{canvas.xmax-int(72*scale),canvas.ymax-int(210*scale),canvas.xmax,canvas.ymax}:p::Rect{};
          auto shelf=p::editing_shelf(canvas,navigation,scale);
          auto parts=p::editing_canvas_parts(canvas,shelf);
          if(!shelf.empty()) {
            assert(shelf.xmin>=canvas.xmin&&shelf.xmax<=canvas.xmax);
            assert(shelf.ymin>=canvas.ymin&&shelf.ymax<=canvas.ymax);
            const float inner=shelf.width()/scale-16;
            const int cells=inner<308?4:7;
            assert(inner/cells>=44);
          }
          // Every sampled canvas point has exactly one owner: shelf or direct edit.
          for(int x=canvas.xmin;x<canvas.xmax;x+=7) {
            for(int y=canvas.ymin;y<canvas.ymax;y+=7) {
              int owners=hit(shelf,x,y);
              for(auto part:parts) owners+=hit(part,x,y);
              assert(owners==1);
              assert(!hit(shelf,x,y)||!hit(navigation,x,y));
            }
          }
        }
      }
    }
  }
  // A nearby sibling viewport has its own translated placement and input region.
  const p::Rect first{0,0,600,700},second{601,0,1201,700};
  auto a=p::editing_shelf(first,{},1),b=p::editing_shelf(second,{},1);
  assert(!a.empty()&&!b.empty()&&b.xmin-a.xmin==601);
  assert(p::editing_shelf({0,0,190,700},{},1).empty());
  assert(p::editing_shelf({0,0,600,180},{},1).empty());
}
''')

    def test_rejected_rebuild_removes_only_its_new_and_previous_blocks(self):
        code = changed_source('source/blender/editors/interface/interface.cc')
        start = code.index('void UI_block_discard_rebuild(')
        helper = code[start:code.index('\nbool UI_block_buttons_fit_rect(', start)]
        named = code.index('void UI_block_discard_named_rebuild(', start)
        helper += code[named:code.index('\n#endif', named)]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#include <cassert>
#include <map>
#include <string>
#include <vector>
#include <algorithm>
struct bContext {};
struct uiBlock {std::string name;uiBlock *oldblock=nullptr;};
struct Map {
 std::map<std::string,uiBlock*> values;
 uiBlock *lookup_default(std::string k,uiBlock *fallback) {auto it=values.find(k);return it==values.end()?fallback:it->second;}
 void remove_as(std::string k){values.erase(k);}
};
struct Runtime {Map block_name_map;std::vector<uiBlock*> uiblocks;};
struct ARegion {Runtime *runtime;};
std::vector<uiBlock*> freed;
void BLI_remlink(std::vector<uiBlock*> *list,uiBlock *item) {
 auto it=std::find(list->begin(),list->end(),item);assert(it!=list->end());list->erase(it);
}
void UI_block_free(const bContext *,uiBlock *item) {assert(std::find(freed.begin(),freed.end(),item)==freed.end());freed.push_back(item);}
HELPER
int main() {
 for(bool has_previous:{false,true}) {
  freed.clear();uiBlock previous{"shelf"},fresh{"shelf",has_previous?&previous:nullptr},other{"other"};
  Runtime runtime;ARegion region{&runtime};runtime.uiblocks={&fresh,&other};
  if(has_previous)runtime.uiblocks.push_back(&previous);
  runtime.block_name_map.values={{"shelf",&fresh},{"other",&other}};
  UI_block_discard_rebuild(nullptr,&region,&fresh);
  assert(fresh.oldblock==nullptr&&runtime.uiblocks.size()==1&&runtime.uiblocks[0]==&other);
  assert(runtime.block_name_map.values.size()==1&&runtime.block_name_map.lookup_default("other",nullptr)==&other);
  assert(freed.size()==(has_previous?2:1));
 }
}
'''.replace('HELPER', helper))


if __name__ == '__main__':
    unittest.main()
