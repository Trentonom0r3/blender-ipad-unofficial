"""Execute the Object Convert owner preflight before its direct object-data writes."""
from pathlib import Path
import subprocess
import tempfile
import unittest

from test_compact_shelf import function
import test_ipad_panels
from test_touch_extrude import PIN_ROOT, changed_source


ROOT = Path(__file__).resolve().parents[1]
PATCH_PATH = ROOT / "patches" / "blender-ipad.patch"
OBJECT_PATH = "source/blender/editors/object/object_add.cc"
OBJECT = changed_source(OBJECT_PATH)
CONTEXT = function(OBJECT, "static bool object_convert_ipad_context_is_live(")
PREPARE = function(OBJECT, "static bool object_convert_ipad_paint_owners_prepare(")
EXEC = function(OBJECT, "static wmOperatorStatus object_convert_exec(")
PRELUDE = (
    "struct ObjectConvertIPadSelectionSnapshot {"
    + OBJECT.split("struct ObjectConvertIPadSelectionSnapshot {", 1)[1].split(
        "static bool object_convert_ipad_context_is_live(", 1
    )[0]
)


HARNESS = r"""
#include <cassert>
#include <cstdio>
#include <cstdint>
#include <cstring>
#include <string>
#include <vector>

struct Link { Link *next = nullptr; };
struct ListBase { Link *first = nullptr; };
#define LISTBASE_FOREACH(type, item, list) \
  for (type item = static_cast<type>((list)->first); item; \
       item = static_cast<type>(reinterpret_cast<Link *>(item)->next))

template<typename T> struct Vector : std::vector<T> {
  void append(const T &value) { this->push_back(value); }
  bool is_empty() const { return this->empty(); }
};

struct ID { uint64_t session_uid = 0; };
struct Object : Link { ID id; short type = 0; int mode = 0; };
struct Base : Link { Object *object = nullptr; bool selected = false; };
struct ViewLayer : Link { ListBase bases; };
struct Scene : Link { ID id; ListBase view_layers; };
struct wmWindow : Link {};
struct wmWindowManager : Link { ListBase windows; };
struct Main { ListBase scenes, wm; };
struct bContext {
  Main *main = nullptr;
  Scene *scene = nullptr;
  ViewLayer *view_layer = nullptr;
  wmWindowManager *wm = nullptr;
  wmWindow *win = nullptr;
};
struct PointerRNA { void *data = nullptr; };
struct ReportList { std::string message; };
static Main *G_MAIN = nullptr;
static constexpr int OB_MODE_ALL_PAINT = 0x40;
static constexpr int RPT_ERROR = 2;
static int selection_queries = 0;

static int BLI_findindex(const ListBase *list, const void *target)
{
  int index = 0;
  for (Link *item = list->first; item; item = item->next, ++index) {
    if (item == target) return index;
  }
  return -1;
}
static Main *CTX_data_main(const bContext *C) { return C ? C->main : nullptr; }
static Scene *CTX_data_scene(const bContext *C) { return C ? C->scene : nullptr; }
static ViewLayer *CTX_data_view_layer(const bContext *C) { return C ? C->view_layer : nullptr; }
static wmWindowManager *CTX_wm_manager(const bContext *C) { return C ? C->wm : nullptr; }
static wmWindow *CTX_wm_window(const bContext *C) { return C ? C->win : nullptr; }
static void BKE_report(ReportList *reports, int, const char *message)
{
  if (reports) reports->message = message;
}
static void CTX_data_selected_editable_bases(bContext *C, Vector<PointerRNA> *r_bases)
{
  ++selection_queries;
  for (Base *base = static_cast<Base *>(C->view_layer->bases.first); base; base =
       static_cast<Base *>(base->next))
  {
    if (base->selected) r_bases->append(PointerRNA{base});
  }
}

struct Owner { uint64_t object_uid = 0; bool live = false; };
static Owner owners[8];
static int teardown_calls = 0;
static uint64_t torn_down[8]{};
static bool refuse_teardown = false;
static bool replace_selected_base = false;
static bool change_context = false;
static bool replace_main = false;
static bool change_selected_type = false;
static bool reenter_preflight = false;
static bool nested_preflight_refused = false;
static Main replacement_main;
static bContext *current_context = nullptr;
static Scene *replacement_scene = nullptr;
static ViewLayer *replacement_layer = nullptr;
static Object *selected_object = nullptr;
static Base *old_base = nullptr;
static Base *replacement_base = nullptr;

static bool object_convert_ipad_paint_owners_prepare(
    bContext *, Main *, Scene *, ViewLayer *, Vector<PointerRNA> &, ReportList *);

bool WM_event_ipad_pencil_paint_object_teardown(Main *bmain, uint64_t object_uid)
{
  assert(bmain == G_MAIN && object_uid);
  torn_down[teardown_calls++] = object_uid;
  if (refuse_teardown) return false;
  for (Owner &owner : owners) {
    if (owner.live && owner.object_uid == object_uid) owner.live = false;
  }
  if (replace_selected_base) {
    assert(old_base && replacement_base && selected_object);
    old_base->selected = false;
    replacement_base->object = selected_object;
    replacement_base->selected = true;
    /* The native callback replaces one Base while preserving the rest of the
     * selected collection. The old fixture accidentally dropped the active
     * object too, correctly causing the production snapshot check to refuse. */
    Base *previous = nullptr;
    for (Base *base = static_cast<Base *>(current_context->view_layer->bases.first); base;
         previous = base, base = static_cast<Base *>(base->next))
    {
      if (base == old_base) {
        replacement_base->next = old_base->next;
        if (previous) {
          previous->next = replacement_base;
        }
        else {
          current_context->view_layer->bases.first = replacement_base;
        }
        break;
      }
    }
  }
  if (change_context) current_context->scene = replacement_scene;
  if (replace_main) G_MAIN = &replacement_main;
  if (change_selected_type) ++selected_object->type;
  if (reenter_preflight) {
    Vector<PointerRNA> nested_selection;
    CTX_data_selected_editable_bases(current_context, &nested_selection);
    ReportList nested_reports;
    nested_preflight_refused = !object_convert_ipad_paint_owners_prepare(
        current_context,
        current_context->main,
        current_context->scene,
        current_context->view_layer,
        nested_selection,
        &nested_reports);
    assert(nested_preflight_refused);
  }
  return true;
}

#define WITH_APPLE_CROSSPLATFORM
""" + PRELUDE + CONTEXT + "\n" + PREPARE + r"""

struct Fixture {
  Main main;
  Scene scene, other_scene;
  ViewLayer layer, other_layer;
  Object active_object, painted_object, replacement_object;
  Base active_base, painted_base, replacement_selected_base;
  wmWindowManager wm, other_wm;
  wmWindow win, paint_win;
  bContext C;
  Vector<PointerRNA> selected;
  ReportList reports;

  Fixture()
  {
    G_MAIN = &main;
    scene.id.session_uid = 1;
    other_scene.id.session_uid = 2;
    layer.next = nullptr;
    scene.view_layers.first = &layer;
    other_scene.view_layers.first = &other_layer;
    active_object.id.session_uid = 10;
    active_object.type = 1;
    painted_object.id.session_uid = 11;
    painted_object.type = 2;
    painted_object.mode = OB_MODE_ALL_PAINT;
    replacement_object.id.session_uid = 12;
    replacement_object.type = 3;
    active_base.object = &active_object;
    active_base.selected = true;
    active_base.next = &painted_base;
    painted_base.object = &painted_object;
    painted_base.selected = true;
    layer.bases.first = &active_base;
    scene.next = nullptr;
    main.scenes.first = &scene;
    win.next = nullptr;
    wm.windows.first = &win;
    win.next = nullptr;
    other_wm.next = nullptr;
    other_wm.windows.first = &paint_win;
    win.next = nullptr;
    wm.next = &other_wm;
    main.wm.first = &wm;
    C.main = &main;
    C.scene = &scene;
    C.view_layer = &layer;
    C.wm = &wm;
    C.win = &win;
    current_context = &C;
    replacement_scene = &other_scene;
    replacement_layer = &other_layer;
    selected_object = &painted_object;
    old_base = &painted_base;
    replacement_base = &replacement_selected_base;
    teardown_calls = selection_queries = 0;
    for (Owner &owner : owners) owner = {};
    refuse_teardown = replace_selected_base = change_context = replace_main = false;
    change_selected_type = reenter_preflight = nested_preflight_refused = false;
    selected.clear();
    reports.message.clear();
    CTX_data_selected_editable_bases(&C, &selected);
  }

  bool prepare() {
    return object_convert_ipad_paint_owners_prepare(
        &C, &main, &scene, &layer, selected, &reports);
  }
};

int main()
{
  {
    Fixture f;
    owners[0] = {11, true}; /* Selected, but not active in this conversion window. */
    owners[1] = {11, true}; /* Another window may hold a second owner. */
    owners[2] = {10, true}; /* Native object-mode active object is untouched. */
    const bool prepared = f.prepare();
    if (!prepared) std::fprintf(stderr, "first setup refused: %s\\n", f.reports.message.c_str());
    assert(prepared);
    assert(teardown_calls == 1 && torn_down[0] == 11);
    assert(!owners[0].live && !owners[1].live && owners[2].live);
    assert(selection_queries == 2 && f.selected.size() == 2);
    assert(f.selected[0].data == &f.active_base && f.selected[1].data == &f.painted_base);
  }
  {
    Fixture f;
    owners[0] = {11, true};
    replace_selected_base = true;
    assert(f.prepare());
    assert(f.selected.size() == 2);
    assert(f.selected[1].data == &f.replacement_selected_base);
    assert(teardown_calls == 1 && !owners[0].live);
  }
  {
    Fixture f;
    owners[0] = {11, true};
    refuse_teardown = true;
    assert(!f.prepare());
    assert(f.selected.empty() && teardown_calls == 1 && owners[0].live);
    assert(!f.reports.message.empty());
  }
  {
    Fixture f;
    owners[0] = {11, true};
    change_context = true;
    assert(!f.prepare());
    assert(f.selected.empty() && !f.reports.message.empty());
  }
  {
    Fixture f;
    owners[0] = {11, true};
    replace_main = true;
    assert(!f.prepare());
    assert(f.selected.empty() && G_MAIN == &replacement_main);
  }
  {
    Fixture f;
    owners[0] = {11, true};
    change_selected_type = true;
    assert(!f.prepare());
    assert(f.selected.empty() && !f.reports.message.empty());
  }
  {
    Fixture f;
    f.painted_object.mode = 0;
    owners[0] = {11, true};
    assert(f.prepare());
    assert(teardown_calls == 0 && owners[0].live && f.selected.size() == 2);
  }
  {
    Fixture f;
    owners[0] = {11, true};
    reenter_preflight = true;
    assert(f.prepare());
    assert(nested_preflight_refused && teardown_calls == 1 && !owners[0].live);
  }
  {
    Fixture f;
    f.painted_object.id.session_uid = 0;
    assert(!f.prepare());
    assert(teardown_calls == 0 && !f.selected.empty());
  }
}
"""


class PencilObjectConvertTeardownTests(unittest.TestCase):
    def test_source_executes_cross_window_owner_teardown_and_selection_reacquisition(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(HARNESS)

    def test_owner_refusal_or_context_replacement_stops_before_conversion_mutation(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(HARNESS)

    def test_exact_object_add_patch_applies_and_precedes_native_conversion_writes(self):
        patch = PATCH_PATH.read_text(encoding="utf-8")
        marker = f"diff --git a/{OBJECT_PATH} b/{OBJECT_PATH}\n"
        self.assertEqual(patch.count(marker), 1)
        start = patch.index(marker)
        end = patch.find("\ndiff --git ", start + len(marker))
        section = patch[start:] if end < 0 else patch[start : end + 1]
        rel = Path(OBJECT_PATH)
        with tempfile.TemporaryDirectory(prefix="ipad-object-convert-patch-") as temporary:
            checkout = Path(temporary)
            target = checkout / rel
            target.parent.mkdir(parents=True)
            target.write_bytes((PIN_ROOT / rel).read_bytes())
            subprocess.run(["git", "init", "-q"], cwd=checkout, check=True, capture_output=True)
            applied = subprocess.run(
                ["git", "apply", "--whitespace=error-all", "-"],
                cwd=checkout,
                input=section.encode("utf-8"),
                capture_output=True,
            )
            self.assertEqual(applied.returncode, 0, applied.stderr.decode("utf-8", "replace"))
            applied_source = target.read_text(encoding="utf-8")
        exec_source = function(applied_source, "static wmOperatorStatus object_convert_exec(")
        self.assertIn("object_convert_ipad_paint_owners_prepare(", applied_source)
        call = "object_convert_ipad_paint_owners_prepare("
        self.assertLess(exec_source.index(call), exec_source.index("/* don't forget multiple users! */"))
        self.assertLess(exec_source.index(call), exec_source.index("ob->flag &= ~OB_DONE"))
        refreshed_graph = exec_source.index("depsgraph = CTX_data_ensure_evaluated_depsgraph(C);", exec_source.index(call))
        self.assertLess(refreshed_graph, exec_source.index("info.depsgraph = depsgraph;"))


if __name__ == "__main__":
    unittest.main()
