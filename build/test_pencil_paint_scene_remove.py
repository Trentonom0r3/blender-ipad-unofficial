"""Execute the generic RNA Scene-removal paint-owner guard from pinned source."""
from pathlib import Path
import unittest

import test_ipad_panels
from test_compact_shelf import function
from test_touch_extrude import changed_source


RNA_PATH = "source/blender/makesrna/intern/rna_main_api.cc"
RNA_SOURCE = changed_source(RNA_PATH)
SCENE_GUARD = function(RNA_SOURCE, "static bool rna_Main_scene_remove_guard(")


SCENE_GUARD_CPP = r"""
#include <cassert>
#include <cstdint>
#include <cstring>

struct ID {
  ID *next = nullptr;
  char name[66] = {'S', 'C'};
  uint32_t tag = 0;
  uint64_t session_uid = 0;
  int users = 0;
};
struct Scene { ID id; Scene *next = nullptr; };
struct ListBase { void *first = nullptr; };
struct wmEventHandler { int type = 0; wmEventHandler *next = nullptr; };
struct wmEventHandler_Op : wmEventHandler {
  uint64_t ipad_pencil_paint_serial = 0;
  uint64_t ipad_pencil_operator_lifetime = 0;
  uint64_t ipad_pencil_owner_values[19]{};
};
struct wmWindow {
  wmWindow *next = nullptr;
  void *runtime = this;
  ListBase handlers, modalhandlers;
};
struct wmWindowManager { wmWindowManager *next = nullptr; ListBase windows; };
struct Main { ListBase scenes, wm; };
struct PointerRNA {
  void *data = nullptr;
  bool invalidated = false;
  void invalidate() { data = nullptr; invalidated = true; }
};
struct ReportList { int errors = 0; };
struct bContext { Main *main = nullptr; wmWindowManager *wm = nullptr; wmWindow *win = nullptr; };
struct ScrArea {};
struct ARegion {};

static Main *G_MAIN = nullptr;
static Main *g_replacement_main = nullptr;
static Scene *g_scene_to_remove = nullptr;
static wmEventHandler_Op *g_replacement_owner = nullptr;
static int g_teardown_mode = 0;
static int g_teardown_calls = 0;
static uint64_t g_next_lifetime = 100;
static constexpr uint32_t ID_TAG_NO_MAIN = 1;
static constexpr int ID_SCE = ('S' << 8) | 'C';
static constexpr int WM_HANDLER_TYPE_OP = 1;
static constexpr int RPT_ERROR = 1;
#define GS(name) (((name)[0] << 8) | (name)[1])
#define ID_REAL_USERS(id) ((id)->users)
#define LISTBASE_FOREACH(type, item, list) \
  for (type item = static_cast<type>((list)->first); item; item = item->next)

static void BKE_report(ReportList *reports, int, const char *) { if (reports) ++reports->errors; }
static bContext *CTX_create() { return new bContext{}; }
static void CTX_data_main_set(bContext *C, Main *main) { C->main = main; }
static void CTX_wm_manager_set(bContext *C, wmWindowManager *wm) { C->wm = wm; }
static void CTX_wm_window_set(bContext *C, wmWindow *win) { C->win = win; }
static void CTX_free(bContext *C) { delete C; }

static void unlink_handler(ListBase &list, wmEventHandler *target)
{
  wmEventHandler *previous = nullptr;
  auto *item = static_cast<wmEventHandler *>(list.first);
  while (item && item != target) { previous = item; item = item->next; }
  if (!item) return;
  if (previous) previous->next = item->next;
  else list.first = item->next;
  item->next = nullptr;
}

static void link_owner(wmWindow &win, wmEventHandler_Op &handler, uint64_t scene_uid, uint64_t lifetime)
{
  handler.type = WM_HANDLER_TYPE_OP;
  handler.ipad_pencil_paint_serial = 1;
  handler.ipad_pencil_operator_lifetime = lifetime;
  handler.ipad_pencil_owner_values[6] = scene_uid;
  handler.next = static_cast<wmEventHandler *>(win.modalhandlers.first);
  win.modalhandlers.first = &handler;
}

static void WM_event_ipad_pencil_paint_owner_teardown(
    bContext *C,
    wmWindow *win,
    const ScrArea *,
    const ARegion *,
    uint64_t scene_uid = 0,
    uint64_t = 0,
    uint64_t = 0)
{
  ++g_teardown_calls;
  assert(C && C->main == G_MAIN && C->wm && C->win == win && scene_uid);
  if (g_teardown_mode == 1) return; /* Native cancellation did not retire its owner. */
  if (g_teardown_mode == 2) { G_MAIN = g_replacement_main; return; }
  if (g_teardown_mode == 3) { /* Native callback removed the Scene itself. */
    C->main->scenes.first = nullptr;
    return;
  }
  wmEventHandler_Op *matched = nullptr;
  LISTBASE_FOREACH (wmEventHandler *, base, &win->modalhandlers) {
    if (base->type != WM_HANDLER_TYPE_OP) continue;
    auto *handler = reinterpret_cast<wmEventHandler_Op *>(base);
    if (handler->ipad_pencil_paint_serial && handler->ipad_pencil_owner_values[6] == scene_uid) {
      matched = handler;
      break;
    }
  }
  if (matched) unlink_handler(win->modalhandlers, matched);
  if (g_teardown_mode == 4 && g_replacement_owner) {
    link_owner(*win, *g_replacement_owner, scene_uid, g_next_lifetime++);
    g_teardown_mode = 0;
  }
}

""" + SCENE_GUARD + r"""

static void reset(Main &main, Scene &scene, wmWindowManager &wm, wmWindow &win)
{
  std::memset(&scene.id, 0, sizeof(scene.id));
  scene.id.name[0] = 'S'; scene.id.name[1] = 'C'; scene.id.session_uid = 42;
  scene.next = nullptr;
  main.scenes.first = &scene;
  main.wm.first = &wm;
  wm.next = nullptr; wm.windows.first = &win;
  win.next = nullptr; win.runtime = &win;
  win.handlers.first = nullptr; win.modalhandlers.first = nullptr;
  G_MAIN = &main; g_replacement_main = nullptr; g_scene_to_remove = nullptr;
  g_replacement_owner = nullptr; g_teardown_mode = 0; g_teardown_calls = 0;
  g_next_lifetime = 100;
}

int main()
{
  Main main, other;
  Scene scene;
  wmWindowManager wm;
  wmWindow win;
  ReportList reports;
  PointerRNA pointer;

  reset(main, scene, wm, win);
  pointer.data = &scene.id;
  assert(rna_Main_scene_remove_guard(&main, &reports, &pointer, true));
  assert(g_teardown_calls == 0 && !pointer.invalidated && pointer.data == &scene.id);

  wmEventHandler_Op owner;
  reset(main, scene, wm, win);
  link_owner(win, owner, scene.id.session_uid, 7);
  pointer.data = &scene.id;
  assert(rna_Main_scene_remove_guard(&main, &reports, &pointer, true));
  assert(g_teardown_calls == 1 && !pointer.invalidated && pointer.data == &scene.id);
  assert(win.modalhandlers.first == nullptr);

  wmEventHandler_Op replacement;
  reset(main, scene, wm, win);
  link_owner(win, owner, scene.id.session_uid, 8);
  g_replacement_owner = &replacement;
  g_teardown_mode = 4;
  pointer.data = &scene.id;
  assert(rna_Main_scene_remove_guard(&main, &reports, &pointer, true));
  assert(g_teardown_calls == 2 && win.modalhandlers.first == nullptr);

  reset(main, scene, wm, win);
  owner = {};
  link_owner(win, owner, scene.id.session_uid, 9);
  g_teardown_mode = 1;
  pointer.data = &scene.id;
  assert(!rna_Main_scene_remove_guard(&main, &reports, &pointer, true));
  assert(g_teardown_calls == 1 && !pointer.invalidated && pointer.data == &scene.id);

  reset(main, scene, wm, win);
  owner = {};
  link_owner(win, owner, scene.id.session_uid, 0);
  pointer.data = &scene.id;
  assert(!rna_Main_scene_remove_guard(&main, &reports, &pointer, true));
  assert(g_teardown_calls == 0);

  reset(main, scene, wm, win);
  owner = {};
  link_owner(win, owner, scene.id.session_uid, 10);
  unlink_handler(win.modalhandlers, &owner);
  owner.next = static_cast<wmEventHandler *>(win.handlers.first);
  win.handlers.first = &owner; /* A tagged non-modal owner is not safe to cancel. */
  pointer.data = &scene.id;
  assert(!rna_Main_scene_remove_guard(&main, &reports, &pointer, true));
  assert(g_teardown_calls == 0);

  reset(main, scene, wm, win);
  owner = {};
  link_owner(win, owner, scene.id.session_uid, 11);
  g_teardown_mode = 2;
  g_replacement_main = &other;
  pointer.data = &scene.id;
  assert(!rna_Main_scene_remove_guard(&main, &reports, &pointer, true));
  assert(pointer.invalidated && pointer.data == nullptr && g_teardown_calls == 1);

  reset(main, scene, wm, win);
  owner = {};
  link_owner(win, owner, scene.id.session_uid, 12);
  g_teardown_mode = 3;
  pointer.data = &scene.id;
  assert(!rna_Main_scene_remove_guard(&main, &reports, &pointer, true));
  assert(pointer.invalidated && pointer.data == nullptr && g_teardown_calls == 1);

  reset(main, scene, wm, win);
  owner = {};
  link_owner(win, owner, scene.id.session_uid, 13);
  scene.id.users = 1;
  pointer.data = &scene.id;
  assert(rna_Main_scene_remove_guard(&main, &reports, &pointer, false));
  assert(g_teardown_calls == 0); /* Native do_unlink=False user semantics remain intact. */

  reset(main, scene, wm, win);
  G_MAIN = &other; /* Background/non-active Main does not borrow UI owners. */
  pointer.data = &scene.id;
  assert(rna_Main_scene_remove_guard(&main, &reports, &pointer, true));
  assert(g_teardown_calls == 0);
}
"""


class PencilPaintSceneRemoveTests(unittest.TestCase):
    def test_scene_owner_guard_executes_native_source(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(SCENE_GUARD_CPP)

    def test_generic_rna_remove_retires_scene_before_native_free(self):
        callsite = RNA_SOURCE[RNA_SOURCE.index("static void rna_Main_ID_remove("):]
        scene = callsite.index("rna_Main_scene_remove_guard")
        scene_refresh = callsite.index("id = static_cast<ID *>(id_ptr->data);", scene)
        delete = callsite.index("if (do_unlink) {")
        self.assertLess(scene, scene_refresh)
        self.assertLess(scene_refresh, delete)
        self.assertIn("BKE_id_delete(bmain, id);", callsite[delete:])
        self.assertIn("id_ptr->invalidate();", callsite[delete:])


if __name__ == "__main__":
    unittest.main()
