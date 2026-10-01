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
    def test_compact_inspector_width_is_scoped_to_properties(self):
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        self.assertIn('metrics.minimum_side_width = int((inspector ? 280 : 180) * scale)', patch)
        self.assertIn('metrics.automatic_side_percent = inspector ? 35 : 45', patch)

    def test_inspector_width_does_not_inherit_other_side_editor_width(self):
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        path = 'source/blender/editors/screen/screen_ipad_panels.cc'
        functions = ''.join(added_function(patch, path, signature) for signature in (
            'static bool inspector_side',
            'static float &saved_panel_size',
            'static void preferred_sizes',
        ))
        source = r'''
#include <algorithm>
#include <cassert>
#include <cmath>
constexpr int SPACE_PROPERTIES = 4;
constexpr float UI_SCALE_FAC = 1.0f;
struct ScrArea { int spacetype; };
struct bScreen {
  float ipad_panel_size[2] = {};
  float ipad_panel_extent[2] = {};
  float ipad_inspector_width = 0;
};
namespace policy {
struct State {
  int side_width = 0, bottom_height = 0, side_height = 0, bottom_width = 0;
};
}
''' + functions + r'''
int main() {
  bScreen screen;
  ScrArea scene{1}, inspector{SPACE_PROPERTIES};
  screen.ipad_panel_size[0] = 520;
  policy::State state;
  preferred_sizes(&screen, state, &inspector);
  assert(state.side_width == 0); // Existing projects use the new compact default.
  preferred_sizes(&screen, state, &scene);
  assert(state.side_width == 520); // Other editor preferences survive.
  saved_panel_size(&screen, 0, true) = 300;
  preferred_sizes(&screen, state, &inspector);
  assert(state.side_width == 300); // Inspector drag has its own saved width.
  preferred_sizes(&screen, state, &scene);
  assert(state.side_width == 520);
  saved_panel_size(&screen, 1, false) = 210;
  assert(screen.ipad_panel_size[1] == 210); // Bottom size is independent.
}
'''
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(source)
        self.assertIn('to->ipad_inspector_width = from->ipad_inspector_width', patch)
        self.assertIn('saved_panel_size(screen, panel, data->inspector_width)', patch)

    def test_native_icons_and_labeled_picker_share_context(self):
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        name = 'scripts/startup/bl_ui/space_properties.py'
        section = patch.split(f'diff --git a/{name} b/{name}\n', 1)[1].split('diff --git ', 1)[0]
        self.assertIn('icon_only=True', section)
        self.assertIn('UILayout.enum_item_icon(view, "context", view.context)', section)
        # No separate icon map or top-row replacement for Blender's native strip.
        self.assertNotIn('diff --git a/source/blender/editors/space_buttons/space_buttons.cc', patch)
        self.assertNotIn('region_is_ipad_inspector_navigation', patch)
        self.assertNotIn('split_previous', patch)

    def test_active_owner_floating_layer_and_desktop(self):
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        getter = added_function(patch, 'source/blender/makesrna/intern/rna_space.cc',
                                'static bool rna_SpaceProperties_is_ipad_inspector_get')
        for platform in ('', '#define WITH_APPLE_CROSSPLATFORM\n'):
            with self.subTest(ipad=bool(platform)):
                test_ipad_panels.IPadWorkspacePanelsTests()._run_source(
                    platform + PREFIX + getter + CASES)


PREFIX = r'''
#include <cassert>
#include <iostream>
constexpr int ID_SCR = 1, SPACE_PROPERTIES = 4;
struct ID {int name = ID_SCR;};
struct ListBase {void *first = nullptr;};
struct ScrArea {
 ScrArea *next = nullptr;
 int spacetype = SPACE_PROPERTIES;
 struct {int ipad_layer = 3;} runtime;
 ListBase spacedata;
};
struct bScreen {ID id; ListBase areabase; bool enabled = true;};
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
 bScreen screen; ScrArea first, inspector;
 first.next = &inspector; first.spacetype = 1;
 inspector.spacedata.first = &space;
 screen.areabase.first = &first;
 PointerRNA ptr{&screen.id, &space};
#ifdef WITH_APPLE_CROSSPLATFORM
 assert(rna_SpaceProperties_is_ipad_inspector_get(&ptr));
#else
 assert(!rna_SpaceProperties_is_ipad_inspector_get(&ptr));
#endif
 // Saved inactive spaces, working editors and other regions keep desktop UI.
 ptr.data = &inactive_space; assert(!rna_SpaceProperties_is_ipad_inspector_get(&ptr));
 ptr.data = &space;
 for(int layer : {0, 1, 2, 4}) {
  inspector.runtime.ipad_layer = layer;
  assert(!rna_SpaceProperties_is_ipad_inspector_get(&ptr));
  }
 inspector.runtime.ipad_layer = 3;
 inspector.spacetype = 1;
 assert(!rna_SpaceProperties_is_ipad_inspector_get(&ptr));
 inspector.spacetype = SPACE_PROPERTIES;
 screen.enabled = false; assert(!rna_SpaceProperties_is_ipad_inspector_get(&ptr));
 screen.enabled = true;
 screen.areabase.first = nullptr; assert(!rna_SpaceProperties_is_ipad_inspector_get(&ptr));
 screen.areabase.first = &inspector;
 screen.id.name = 2; assert(!rna_SpaceProperties_is_ipad_inspector_get(&ptr));
 ptr.owner_id = nullptr; assert(!rna_SpaceProperties_is_ipad_inspector_get(&ptr));
 std::cout << "PASS: Inspector identity is scoped to active floating Properties space\n";
}
'''
