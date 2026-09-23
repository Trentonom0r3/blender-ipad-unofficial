"""Compile the exact Inspector presentation gates with screen/space identity mocks."""
from pathlib import Path
import unittest
import test_ipad_panels


def added_function(patch, path, signature):
    section = patch.split(f'diff --git a/{path} b/{path}\n', 1)[1].split('diff --git ', 1)[0]
    additions = ''.join(line[1:] for line in section.splitlines(True)
                        if line.startswith('+') and not line.startswith('+++'))
    start = additions.index(signature)
    return additions[start:additions.index('\n}\n', start) + 3]


class InspectorIdentityTests(unittest.TestCase):
    def test_readable_inspector_width_is_scoped_to_properties(self):
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        self.assertIn('side_editor && side_editor->spacetype == SPACE_PROPERTIES ? 360 : 180', patch)

    def test_navigation_bounds_use_native_short_dimensions(self):
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        name = 'source/blender/editors/space_buttons/space_buttons.cc'
        section = patch.split(f'diff --git a/{name} b/{name}\n', 1)[1].split('diff --git ', 1)[0]
        additions = ''.join(line[1:] for line in section.splitlines(True)
                            if line.startswith('+') and not line.startswith('+++'))
        start = additions.index('  if (ipad_inspector) {')
        bounds = additions[start:additions.index('\n  }', start) + 4]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(
            BOUNDS_PREFIX + bounds + BOUNDS_CASES)

    def test_active_owner_floating_layer_and_desktop(self):
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        getter = added_function(patch, 'source/blender/makesrna/intern/rna_space.cc',
                                'static bool rna_SpaceProperties_is_ipad_inspector_get')
        geometry = added_function(patch, 'source/blender/editors/screen/area.cc',
                                  'static bool region_is_ipad_inspector_navigation')
        for platform in ('', '#define WITH_APPLE_CROSSPLATFORM\n'):
            with self.subTest(ipad=bool(platform)):
                test_ipad_panels.IPadWorkspacePanelsTests()._run_source(
                    platform + PREFIX + getter + geometry + CASES)


PREFIX = r'''
#include <cassert>
#include <iostream>
constexpr int ID_SCR = 1, SPACE_PROPERTIES = 4, RGN_TYPE_NAV_BAR = 5;
struct ID {int name = ID_SCR;};
struct ListBase {void *first = nullptr;};
struct ScrArea {
 ScrArea *next = nullptr;
 int spacetype = SPACE_PROPERTIES;
 struct {int ipad_layer = 3;} runtime;
 ListBase spacedata;
};
struct bScreen {ID id; ListBase areabase; bool enabled = true;};
struct ARegion {int regiontype = RGN_TYPE_NAV_BAR;};
struct PointerRNA {ID *owner_id; void *data;};
#define GS(name) (name)
template<class... T> void unused_args(const T &...) {}
#define UNUSED_VARS(...) unused_args(__VA_ARGS__)
#define LISTBASE_FOREACH(type,name,list) for(type name=static_cast<type>((list)->first);name;name=name->next)
bool ED_ipad_panels_enabled(const bScreen *screen) {return screen->enabled;}
'''
CASES = r'''
int main() {
 int space = 1, inactive_space = 2;
 bScreen screen; ScrArea first, inspector; ARegion navigation;
 first.next = &inspector; first.spacetype = 1;
 inspector.spacedata.first = &space;
 screen.areabase.first = &first;
 PointerRNA ptr{&screen.id, &space};
#ifdef WITH_APPLE_CROSSPLATFORM
 assert(rna_SpaceProperties_is_ipad_inspector_get(&ptr));
 assert(region_is_ipad_inspector_navigation(&inspector, &navigation));
#else
 assert(!rna_SpaceProperties_is_ipad_inspector_get(&ptr));
 assert(!region_is_ipad_inspector_navigation(&inspector, &navigation));
#endif
 // Saved inactive spaces, working editors and other regions keep desktop UI.
 ptr.data = &inactive_space; assert(!rna_SpaceProperties_is_ipad_inspector_get(&ptr));
 ptr.data = &space;
 for(int layer : {0, 1, 2, 4}) {
  inspector.runtime.ipad_layer = layer;
  assert(!rna_SpaceProperties_is_ipad_inspector_get(&ptr));
  assert(!region_is_ipad_inspector_navigation(&inspector, &navigation));
 }
 inspector.runtime.ipad_layer = 3; navigation.regiontype = 1;
 assert(!region_is_ipad_inspector_navigation(&inspector, &navigation));
 inspector.spacetype = 1;
 assert(!rna_SpaceProperties_is_ipad_inspector_get(&ptr));
 inspector.spacetype = SPACE_PROPERTIES;
 screen.enabled = false; assert(!rna_SpaceProperties_is_ipad_inspector_get(&ptr));
 screen.enabled = true;
 screen.areabase.first = nullptr; assert(!rna_SpaceProperties_is_ipad_inspector_get(&ptr));
 screen.areabase.first = &inspector;
 screen.id.name = 2; assert(!rna_SpaceProperties_is_ipad_inspector_get(&ptr));
 ptr.owner_id = nullptr; assert(!rna_SpaceProperties_is_ipad_inspector_get(&ptr));
 std::cout << "PASS: Inspector uses active screen/space identity and floating presentation only\n";
}
'''


BOUNDS_PREFIX = r'''
#include <algorithm>
#include <cassert>
#include <iostream>
// ARegion's pinned DNA declares winx and winy as short, not int.
struct ARegion {
 short winx, winy;
 struct {struct {float xmin, xmax, ymin, ymax;} cur;} v2d;
};
void reset_bounds(ARegion *region, bool ipad_inspector) {
'''
BOUNDS_CASES = r'''
}
int main() {
 ARegion region{640, 56, {{12, 88, -30, 9}}};
 reset_bounds(&region, false);
 assert(region.v2d.cur.xmin == 12 && region.v2d.cur.ymax == 9);
 reset_bounds(&region, true);
 assert(region.v2d.cur.xmin == 0 && region.v2d.cur.xmax == 640);
 assert(region.v2d.cur.ymin == -56 && region.v2d.cur.ymax == 0);
 region.winx = 0; region.winy = -1;
 reset_bounds(&region, true);
 assert(region.v2d.cur.xmax == 1 && region.v2d.cur.ymin == -1);
 std::cout << "PASS: Inspector navigation uses native short dimensions and nonempty bounds\n";
}
'''
