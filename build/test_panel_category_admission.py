"""Execute native context/root admission and the actual iPad category collector.

Panel containers and context accessors are fixtures, not a device draw.
"""
import re
from pathlib import Path
import unittest
from test_touch_extrude import changed_source
from test_compact_shelf import function
import test_ipad_panels

AREA = changed_source('source/blender/editors/screen/area.cc')
VIEW = changed_source('source/blender/editors/space_view3d/space_view3d.cc')
IMAGE = changed_source('source/blender/editors/space_image/space_image.cc')
COLLECTOR = changed_source('source/blender/editors/screen/screen_ipad_panels.cc')
CHECK = (Path(__file__).parent / 'fixtures/pinned_panel_admission.cc').read_text(encoding='utf-8')
FUNCTIONS = '\n'.join((function(VIEW, 'static void view3d_buttons_region_contexts('),
                       function(VIEW, 'void ED_ipad_view3d_panel_contexts('),
                       function(IMAGE, 'static void image_buttons_region_contexts('),
                       function(IMAGE, 'void ED_ipad_image_panel_contexts('),
                       CHECK, function(AREA, 'bool ED_ipad_panel_category_poll(')))
MODES = sorted(set(re.findall(r'CTX_MODE_[A-Z_]+', FUNCTIONS)))
WORLD = r'''
#include <algorithm>
#include <cassert>
#include <cstring>
#include <initializer_list>
#include <string>
#include <vector>
#define STREQ(a,b) (std::strcmp(a,b)==0)
#define LIKELY(value) (value)
enum eContextObjectMode {MODES};
enum {SPACE_VIEW3D,SPACE_IMAGE,SPACE_CLIP,RGN_FLAG_POLL_FAILED=16,RGN_TYPE_UI=4,
      SI_MODE_VIEW,SI_MODE_PAINT,SI_MODE_MASK,SI_MODE_UV};
struct ScrArea {int spacetype=SPACE_VIEW3D;};
struct WorkSpace {bool owner=true;};
struct SpaceImage {int mode=SI_MODE_VIEW;};
struct bContext {ScrArea *area;WorkSpace *workspace;SpaceImage *image;
                 eContextObjectMode mode=CTX_MODE_OBJECT;const char *mode_string="OBJECT";};
struct PanelType {PanelType *parent=nullptr;const char *category="Item",*context="",*owner_id="";
                  bool draw=true;bool (*poll)(const bContext *,PanelType *)=nullptr;};
ScrArea *CTX_wm_area(const bContext *C){return C->area;}
WorkSpace *CTX_wm_workspace(const bContext *C){return C->workspace;}
SpaceImage *CTX_wm_space_image(const bContext *C){return C->image;}
eContextObjectMode CTX_data_mode_enum(const bContext *C){return C->mode;}
const char *CTX_data_mode_string(const bContext *C){return C->mode_string;}
bool BKE_workspace_owner_id_check(const WorkSpace *w,const char *){return w&&w->owner;}
bool streq_array_any(const char *s,const char **values){for(int i=0;values[i];++i)if(STREQ(s,values[i]))return true;return false;}
void array_set(const char **out,std::initializer_list<const char *> values){for(const char *s:values)*out++=s;}
#define ARRAY_SET_ITEMS(out,...) array_set(out,{__VA_ARGS__})
enum class Edge {Side};
constexpr int category_first_id=10;
struct Tab {int id;Edge edge;std::string label;ScrArea *area;int region_type;std::string category;};
struct Model {ScrArea *main;std::vector<Tab> tabs;};
struct RegionType {std::vector<PanelType *> paneltypes;};
struct Runtime {RegionType *type;};
struct ARegion {int flag=0;Runtime *runtime;};
struct bScreen {int ipad_panel_active[2]={-1,0};const char *ipad_panel_category="Item";};
void CTX_wm_region_set(bContext *,ARegion *){}
#define LISTBASE_FOREACH(type,var,list) for(type var:*(list))
int calls=0;
bool allowed(const bContext *,PanelType *){++calls;return true;}
bool forbidden(const bContext *,PanelType *){assert(false&&"incompatible/child poll executed");return false;}
'''.replace('MODES', ','.join(MODES))

def block(source, marker):
    start = source.index(marker)
    begin = source.index('{', start)
    depth = 1
    i = begin + 1
    while depth:
        depth += (source[i] == '{') - (source[i] == '}')
        i += 1
    return source[start:i]

DISCOVERY = '\n'.join(block(COLLECTOR, marker) for marker in (
    'if (sidebar && !(sidebar->flag & RGN_FLAG_POLL_FAILED) && !sidebar->runtime->type)',
    'if (sidebar && !(sidebar->flag & RGN_FLAG_POLL_FAILED) && sidebar->runtime->type)'))

class PanelCategoryTests(unittest.TestCase):
    def run_source(self, main):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(WORLD + FUNCTIONS + r'''
void discover(bContext *C,ARegion *sidebar,bScreen *screen,Model &model){
DISCOVERY
}
''' .replace('DISCOVERY',DISCOVERY) + main)

    def test_children_wrong_modes_and_workspace_owners_are_never_polled(self):
        self.run_source(r'''
int main(){ScrArea area;WorkSpace workspace;SpaceImage image;bContext C{&area,&workspace,&image};
 PanelType root;root.poll=allowed;
 PanelType child;child.parent=&root;child.context=".paint_common";child.poll=forbidden;
 PanelType wrong;wrong.context=".paint_common";wrong.poll=forbidden;
 PanelType owner;owner.owner_id="extension";owner.poll=forbidden;workspace.owner=false;
 PanelType no_draw;no_draw.draw=false;no_draw.poll=forbidden;
 RegionType type{{&child,&wrong,&owner,&root,&no_draw}};Runtime runtime{&type};
 ARegion sidebar{0,&runtime};bScreen screen;Model model{&area,{}};
 discover(&C,&sidebar,&screen,model);assert(calls==1&&model.tabs.size()==1&&model.tabs[0].label=="Item");
 calls=0;sidebar.flag=RGN_FLAG_POLL_FAILED;model.tabs.clear();discover(&C,&sidebar,&screen,model);
 assert(calls==0&&model.tabs.empty());runtime.type=nullptr;discover(&C,&sidebar,&screen,model);
 assert(model.tabs.empty());sidebar.flag=0;discover(&C,&sidebar,&screen,model);assert(model.tabs.size()==1);
 C.area=nullptr;assert(!ED_ipad_panel_category_poll(&C,&root));
}
''')

    def test_shared_view3d_and_image_context_arrays_preserve_empty_vs_null(self):
        self.run_source(r'''
int main(){ScrArea area;WorkSpace workspace;SpaceImage image;bContext C{&area,&workspace,&image};
 PanelType paint;paint.context=".paint_common";paint.poll=allowed;
 assert(!ED_ipad_panel_category_poll(&C,&paint)&&calls==0);
 C.mode=CTX_MODE_SCULPT;C.mode_string="SCULPT";assert(ED_ipad_panel_category_poll(&C,&paint)&&calls==1);
 paint.context=".mesh_edit";assert(!ED_ipad_panel_category_poll(&C,&paint));
 C.mode=CTX_MODE_EDIT_MESH;C.mode_string="EDIT_MESH";assert(ED_ipad_panel_category_poll(&C,&paint));
 paint.context=".posemode";C.mode=CTX_MODE_POSE;C.mode_string="POSE";assert(ED_ipad_panel_category_poll(&C,&paint));
 area.spacetype=SPACE_IMAGE;paint.context=".imagepaint_2d";calls=0;
 for(int mode:{SI_MODE_VIEW,SI_MODE_MASK,SI_MODE_UV}){image.mode=mode;assert(!ED_ipad_panel_category_poll(&C,&paint));}
 assert(!calls);image.mode=SI_MODE_PAINT;assert(ED_ipad_panel_category_poll(&C,&paint));
 paint.context=".uv_sculpt";image.mode=SI_MODE_UV;assert(!ED_ipad_panel_category_poll(&C,&paint));
 C.mode=CTX_MODE_EDIT_MESH;assert(ED_ipad_panel_category_poll(&C,&paint));
 area.spacetype=SPACE_CLIP;assert(ED_ipad_panel_category_poll(&C,&paint));
}
''')

if __name__ == '__main__': unittest.main()
