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
