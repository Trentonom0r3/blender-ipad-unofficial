"""Execute the Object Delete paint-owner preflight before native mutation."""
import unittest

from test_compact_shelf import function
from test_ipad_panels import IPadWorkspacePanelsTests
from test_touch_extrude import changed_source


OBJECT_PATH = "source/blender/editors/object/object_add.cc"
OBJECT = changed_source(OBJECT_PATH)
CONTEXT = function(OBJECT, "static bool object_convert_ipad_context_is_live(")
SNAPSHOT = function(OBJECT, "static bool object_delete_ipad_selection_snapshot(")
MATCHES = function(OBJECT, "static bool object_delete_ipad_selection_matches(")
PREPARE = function(OBJECT, "static bool object_delete_ipad_paint_owners_prepare(")
PRELUDE = OBJECT.split("struct ObjectDeleteIPadSelectionSnapshot {", 1)[1].split(
    "static bool object_convert_ipad_context_is_live(", 1
)[0]
PRELUDE = "struct ObjectDeleteIPadSelectionSnapshot {" + PRELUDE


HARNESS = r"""
#include <cassert>
#include <cstddef>
#include <cstdint>
#include <string>
#include <vector>

struct Link { Link *next = nullptr; };
struct ListBase { Link *first = nullptr; };
struct ID { uint64_t session_uid = 0; int tag = 0; };
struct ViewLayer : Link {};
struct Scene : Link { ID id; ListBase view_layers; };
struct Object { ID id; short type = 0; int mode = 0; int real_users = 1; int extra_users = 0;
  bool indirectly_used = false; bool user_deletable = true; };
struct wmWindow : Link {};
struct wmWindowManager : Link { ListBase windows; };
struct Main { ListBase scenes, wm; };
struct bContext {
  Main *main = nullptr;
  Scene *scene = nullptr;
  ViewLayer *view_layer = nullptr;
  wmWindowManager *wm = nullptr;
  wmWindow *win = nullptr;
  std::vector<Object *> selected_objects;
};
struct ReportList { std::string message; };

template<class T> struct Vector : std::vector<T> {
  using std::vector<T>::vector;
  void append(const T &value) { this->push_back(value); }
};

static Main *G_MAIN = nullptr;
static constexpr int ID_TAG_INDIRECT = 1;
static constexpr int OB_MODE_ALL_PAINT = 0x40;
static constexpr int RPT_ERROR = 2;
static int BLI_findindex(const ListBase *list, const void *target)
{
  int index = 0;
  for (Link *item = list ? list->first : nullptr; item; item = item->next, ++index) {
    if (item == target) return index;
  }
  return -1;
}
#define ID_REAL_USERS(object) ((object)->real_users)
#define ID_EXTRA_USERS(object) ((object)->extra_users)
#define CTX_DATA_BEGIN(C, type, item, member) for (type item : (C)->selected_objects)
#define CTX_DATA_END
static Main *CTX_data_main(const bContext *C) { return C ? C->main : nullptr; }
static Scene *CTX_data_scene(const bContext *C) { return C ? C->scene : nullptr; }
static ViewLayer *CTX_data_view_layer(const bContext *C) { return C ? C->view_layer : nullptr; }
static wmWindowManager *CTX_wm_manager(const bContext *C) { return C ? C->wm : nullptr; }
static wmWindow *CTX_wm_window(const bContext *C) { return C ? C->win : nullptr; }
static bool BKE_library_ID_is_indirectly_used(Main *, const Object *object)
{
  return object->indirectly_used;
}
static bool BKE_lib_override_library_id_is_user_deletable(Main *, const ID *id)
{
  const Object *object = reinterpret_cast<const Object *>(
      reinterpret_cast<const char *>(id) - offsetof(Object, id));
  return object->user_deletable;
}
static void BKE_report(ReportList *reports, int, const char *message)
{
  if (reports) reports->message = message;
}

static bool object_convert_ipad_context_is_live(
    bContext *, Main *, Scene *, ViewLayer *, wmWindowManager *, wmWindow *);
static bool object_delete_ipad_paint_owners_prepare(
    bContext *, Main *, Scene *, ViewLayer *, wmWindowManager *, wmWindow *, ReportList *);
bool WM_event_ipad_pencil_paint_object_teardown(Main *, uint64_t);

static bContext *callback_context = nullptr;
static Main *callback_main = nullptr;
static Scene *callback_scene = nullptr;
static ViewLayer *callback_layer = nullptr;
static wmWindowManager *callback_wm = nullptr;
static wmWindow *callback_win = nullptr;
static Object *replacement_object = nullptr;
static int refusal_uid = 0;
static bool mutate_selection = false;
static bool replace_scene = false;
static bool replace_main = false;
static bool reenter = false;
static bool nested_preflight_refused = false;
static Main replacement_main;
static Scene replacement_scene;
static std::vector<uint64_t> teardown_calls;

#define WITH_APPLE_CROSSPLATFORM
""" + PRELUDE + CONTEXT + SNAPSHOT + MATCHES + PREPARE + r"""

bool WM_event_ipad_pencil_paint_object_teardown(Main *bmain, uint64_t object_uid)
{
  assert(bmain == G_MAIN && object_uid);
  teardown_calls.push_back(object_uid);
  if (reenter) {
    reenter = false;
    ReportList nested_reports;
    nested_preflight_refused = !object_delete_ipad_paint_owners_prepare(
        callback_context,
        callback_main,
        callback_scene,
        callback_layer,
        callback_wm,
        callback_win,
        &nested_reports);
  }
  if (mutate_selection) {
    callback_context->selected_objects[0] = replacement_object;
    mutate_selection = false;
  }
  if (replace_scene) {
    callback_context->scene = &replacement_scene;
    replace_scene = false;
  }
  if (replace_main) {
    G_MAIN = &replacement_main;
    replace_main = false;
  }
  return int(object_uid) != refusal_uid;
}

struct Fixture {
  Main main;
  Scene scene;
  ViewLayer layer;
  wmWindowManager wm;
  wmWindow win;
  Object first, second, plain, indirect, override_object, replacement;
  bContext C;
  ReportList reports;

  Fixture()
  {
    G_MAIN = &main;
    main.scenes.first = &scene;
    scene.id.session_uid = 101;
    scene.view_layers.first = &layer;
    main.wm.first = &wm;
    wm.windows.first = &win;
    C = {&main, &scene, &layer, &wm, &win, {}};
    first.id.session_uid = 201;
    first.mode = OB_MODE_ALL_PAINT;
    second.id.session_uid = 202;
    second.mode = OB_MODE_ALL_PAINT;
    plain.id.session_uid = 203;
    indirect.id.session_uid = 204;
    indirect.mode = OB_MODE_ALL_PAINT;
    indirect.id.tag = ID_TAG_INDIRECT;
    override_object.id.session_uid = 205;
    override_object.mode = OB_MODE_ALL_PAINT;
    override_object.user_deletable = false;
    replacement.id.session_uid = 299;
    callback_context = &C;
    callback_main = &main;
    callback_scene = &scene;
    callback_layer = &layer;
    callback_wm = &wm;
    callback_win = &win;
    replacement_object = &replacement;
    refusal_uid = 0;
    mutate_selection = replace_scene = replace_main = reenter = false;
    nested_preflight_refused = false;
    teardown_calls.clear();
  }
};

int main()
{
  {
    Fixture f;
    f.C.selected_objects = {&f.first, &f.plain, &f.indirect, &f.override_object};
    assert(object_delete_ipad_paint_owners_prepare(
        &f.C, &f.main, &f.scene, &f.layer, &f.wm, &f.win, &f.reports));
    assert((teardown_calls == std::vector<uint64_t>{201, 203}));
    assert(f.reports.message.empty());
  }
  {
    Fixture f;
    f.C.selected_objects = {&f.first, &f.second};
    refusal_uid = 202;
    assert(!object_delete_ipad_paint_owners_prepare(
        &f.C, &f.main, &f.scene, &f.layer, &f.wm, &f.win, &f.reports));
    assert((teardown_calls == std::vector<uint64_t>{201, 202}));
    assert(!f.reports.message.empty());
  }
  {
    Fixture f;
    f.C.selected_objects = {&f.plain};
    refusal_uid = 203;
    assert(!object_delete_ipad_paint_owners_prepare(
        &f.C, &f.main, &f.scene, &f.layer, &f.wm, &f.win, &f.reports));
    assert((teardown_calls == std::vector<uint64_t>{203}));
  }
  {
    Fixture f;
    f.C.selected_objects = {&f.first, &f.second};
    mutate_selection = true;
    assert(!object_delete_ipad_paint_owners_prepare(
        &f.C, &f.main, &f.scene, &f.layer, &f.wm, &f.win, &f.reports));
    assert(teardown_calls.size() == 1);
  }
  {
    Fixture f;
    f.C.selected_objects = {&f.first};
    replace_scene = true;
    assert(!object_delete_ipad_paint_owners_prepare(
        &f.C, &f.main, &f.scene, &f.layer, &f.wm, &f.win, &f.reports));
  }
  {
    Fixture f;
    f.C.selected_objects = {&f.first};
    replace_main = true;
    assert(!object_delete_ipad_paint_owners_prepare(
        &f.C, &f.main, &f.scene, &f.layer, &f.wm, &f.win, &f.reports));
  }
  {
    Fixture f;
    f.C.selected_objects = {&f.first};
    reenter = true;
    assert(object_delete_ipad_paint_owners_prepare(
        &f.C, &f.main, &f.scene, &f.layer, &f.wm, &f.win, &f.reports));
    assert(nested_preflight_refused);
    assert(teardown_calls.size() == 1);
  }
  {
    Fixture f;
    f.C.selected_objects = {&f.first, &f.first};
    assert(!object_delete_ipad_paint_owners_prepare(
        &f.C, &f.main, &f.scene, &f.layer, &f.wm, &f.win, &f.reports));
    assert(teardown_calls.empty());
  }
  {
    Fixture f;
    f.C.selected_objects = {&f.first};
    f.first.id.session_uid = 0;
    assert(!object_delete_ipad_paint_owners_prepare(
        &f.C, &f.main, &f.scene, &f.layer, &f.wm, &f.win, &f.reports));
    assert(teardown_calls.empty());
  }
  return 0;
}
"""


class PencilPaintObjectDeleteTests(unittest.TestCase):
    def test_actual_preflight_snapshots_and_revalidates_before_native_delete(self):
        IPadWorkspacePanelsTests()._run_source(HARNESS)

    def test_delete_exec_propagates_refusal_before_any_destructive_branch(self):
        start = OBJECT.index("static wmOperatorStatus object_delete_exec(")
        prepare = OBJECT.index("if (!object_delete_ipad_paint_owners_prepare(", start)
        tag_reset = OBJECT.index("BKE_main_id_tag_all(bmain, ID_TAG_DOIT, false);", start)
        native_unlink = OBJECT.index("base_free_and_unlink_no_indirect_check(bmain, scene, ob);", start)
        tagged_delete = OBJECT.index("BKE_id_multi_tagged_delete(bmain);", start)
        guard = OBJECT[prepare:tag_reset]
        self.assertLess(prepare, tag_reset)
        self.assertLess(tag_reset, native_unlink)
        self.assertLess(tag_reset, tagged_delete)
        self.assertIn("return OPERATOR_CANCELLED;", guard)
        self.assertNotIn("object_delete_ipad_pencil_paint_owner_teardown", OBJECT)


if __name__ == "__main__":
    unittest.main(verbosity=2)
