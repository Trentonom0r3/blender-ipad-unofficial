"""Execute the object-delete owner adapter and check both destructive seams."""
from pathlib import Path
import unittest

from test_compact_shelf import function
from test_ipad_panels import IPadWorkspacePanelsTests
from test_touch_extrude import changed_source


OBJECT_PATH = "source/blender/editors/object/object_add.cc"
OBJECT = changed_source(OBJECT_PATH)
DELETE_ADAPTER = function(
    OBJECT, "static void object_delete_ipad_pencil_paint_owner_teardown(")


class PencilPaintObjectDeleteTests(unittest.TestCase):
    def test_exact_window_adapter_filters_scene_and_object_and_fans_out(self):
        IPadWorkspacePanelsTests()._run_source(
            r'''
#include <cassert>
#include <cstdint>
struct bContext {};
struct ID { uint64_t session_uid = 0; };
struct Scene { ID id; };
struct Object { ID id; };
struct ListBase { void *first = nullptr; };
struct wmWindow { wmWindow *next = nullptr; };
struct wmWindowManager { ListBase windows; };
#define WITH_APPLE_CROSSPLATFORM
#define LISTBASE_FOREACH(type, item, list) \
  for (type item = static_cast<type>((list)->first); item; item = item->next)
struct Call { wmWindow *window; uint64_t scene_uid; uint64_t object_uid; };
static Call calls[8];
static int call_count = 0;
void WM_event_ipad_pencil_paint_owner_teardown(
    bContext *, wmWindow *win, const void *, const void *, uint64_t scene_uid, uint64_t object_uid)
{
  calls[call_count++] = {win, scene_uid, object_uid};
}
''' + DELETE_ADAPTER + r'''
int main()
{
  bContext C;
  wmWindow third, second, first;
  first.next = &second;
  second.next = &third;
  wmWindowManager wm{{&first}};
  Scene scene{{101}};
  Object object{{303}};
  object_delete_ipad_pencil_paint_owner_teardown(&C, &wm, &scene, &object);
  assert(call_count == 3);
  assert(calls[0].window == &first && calls[1].window == &second && calls[2].window == &third);
  for (int i = 0; i < call_count; ++i) {
    assert(calls[i].scene_uid == 101 && calls[i].object_uid == 303);
  }
  call_count = 0;
  object_delete_ipad_pencil_paint_owner_teardown(&C, &wm, nullptr, &object);
  assert(call_count == 3);
  for (int i = 0; i < call_count; ++i) {
    assert(calls[i].scene_uid == 0 && calls[i].object_uid == 303);
  }
  call_count = 0;
  object_delete_ipad_pencil_paint_owner_teardown(&C, nullptr, &scene, &object);
  object_delete_ipad_pencil_paint_owner_teardown(&C, &wm, &scene, nullptr);
  assert(call_count == 0);
}
''')

    def test_both_native_delete_routes_retire_before_unlink_or_free(self):
        direct = OBJECT.index("object_delete_ipad_pencil_paint_owner_teardown(C, wm, scene, ob);")
        scene_unlink = OBJECT.index("base_free_and_unlink_no_indirect_check(bmain, scene, ob);")
        global_loop = OBJECT.index(
            "object_delete_ipad_pencil_paint_owner_teardown(C, wm, nullptr, object);")
        global_delete = OBJECT.index("BKE_id_multi_tagged_delete(bmain);")
        self.assertLess(direct, scene_unlink)
        self.assertLess(global_loop, global_delete)
        self.assertIn("object->id.tag & ID_TAG_DOIT", OBJECT)
        self.assertIn("object->id.session_uid", DELETE_ADAPTER)


if __name__ == "__main__":
    unittest.main(verbosity=2)
