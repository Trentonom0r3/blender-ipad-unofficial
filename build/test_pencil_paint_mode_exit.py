"""Execute the native paint-owner mode-exit adapter from the active overlay.

The exact WM owner scan and mode-exit functions are compiled from the patch.
Window/context plumbing and the native callback boundary are small test doubles;
this covers source control flow, not a full Blender runtime or iPad delivery.
"""
import unittest
import re

from test_compact_shelf import function
import test_ipad_panels
from test_touch_extrude import changed_source


WM = changed_source('source/blender/windowmanager/intern/wm_event_system.cc')
OWNER_FIND = function(WM, 'static bool wm_ipad_pencil_paint_mode_owner_find(')
SCENE_UID = function(WM, 'static bool wm_ipad_pencil_paint_scene_uid_exists(')
TARGET_VALID = function(WM, 'static bool wm_ipad_pencil_paint_mode_exit_target_valid(')
EXIT_MAIN = function(WM, 'bool WM_event_ipad_pencil_paint_mode_exit(Main *bmain')
EXIT_CONTEXT = function(WM, 'bool WM_event_ipad_pencil_paint_mode_exit(bContext *C)')

CPP = r'''
#include <cassert>
#include <cstdint>

struct ListBase { void *first = nullptr; };
struct ID { uint64_t session_uid = 0; };
struct Scene { Scene *next = nullptr; ID id; };
struct Object { Object *next = nullptr; ID id; int mode = 0; };
struct wmWindow;
struct wmEventHandler { int type = 0, flag = 0; wmEventHandler *next = nullptr; };
struct wmEventHandler_Op {
  wmEventHandler head;
  bool valid = true, is_fileselect = false;
  wmWindow *context_win = nullptr;
  uint64_t ipad_pencil_operator_lifetime = 0;
  uint64_t ipad_pencil_paint_serial = 0;
  uint64_t ipad_pencil_owner_values[19]{};
  int ipad_pencil_paint_mode = 0;
};
struct wmWindow { wmWindow *next = nullptr; void *runtime = nullptr;
  ListBase modalhandlers, handlers; };
struct wmWindowManager { wmWindowManager *next = nullptr; ListBase windows; };
struct Main { ListBase wm, scenes, objects; };
struct bContext { Main *main = nullptr; wmWindowManager *manager = nullptr;
  wmWindow *window = nullptr; Scene *scene = nullptr; Object *object = nullptr; };

enum { WM_HANDLER_TYPE_OP = 1, WM_HANDLER_DO_FREE = 2,
       OB_MODE_SCULPT = 1, OB_MODE_VERTEX_PAINT = 2,
       OB_MODE_WEIGHT_PAINT = 4, OB_MODE_TEXTURE_PAINT = 8 };
Main *G_MAIN = nullptr;
int g_teardowns = 0, g_context_creates = 0, g_context_frees = 0;
bool g_noop_teardown = false, g_change_mode = false, g_replace_main = false;
int g_reinsert_remaining = 0, g_reinserted = 0;
wmEventHandler_Op g_replacements[260];
Object *g_target_object = nullptr;

template<class T> int BLI_findindex(const ListBase *list, T *target)
{
  int index = 0;
  for (T *item = (T *)list->first; item; item = item->next, ++index) {
    if (item == target) return index;
  }
  return -1;
}
#define LISTBASE_FOREACH(type, var, list) \
  for (type var = (type)(list)->first; var; var = var->next)

bool wm_ipad_pencil_paint_handler_registered(wmWindow *win,
                                            const wmEventHandler_Op *handler)
{
  return win && win->runtime && handler && handler->valid &&
         handler->head.type == WM_HANDLER_TYPE_OP &&
         !(handler->head.flag & WM_HANDLER_DO_FREE) && !handler->is_fileselect &&
         (!handler->context_win || handler->context_win == win) &&
         BLI_findindex(&win->modalhandlers, &handler->head) != -1 &&
         handler->ipad_pencil_operator_lifetime != 0;
}

bContext *CTX_create() { ++g_context_creates; return new bContext{}; }
void CTX_data_main_set(bContext *C, Main *main) { C->main = main; }
void CTX_wm_manager_set(bContext *C, wmWindowManager *wm) { C->manager = wm; }
void CTX_wm_window_set(bContext *C, wmWindow *win) { C->window = win; }
void CTX_free(bContext *C) { ++g_context_frees; delete C; }
Main *CTX_data_main(const bContext *C) { return C ? C->main : nullptr; }
Object *CTX_data_active_object(const bContext *C) { return C ? C->object : nullptr; }
Scene *CTX_data_scene(const bContext *C) { return C ? C->scene : nullptr; }

void WM_event_ipad_pencil_paint_owner_teardown(bContext *, wmWindow *, const void *,
                                               const void *, uint64_t, uint64_t);

Main *replacement_main = nullptr;
'''

TEARDOWN = r'''
void WM_event_ipad_pencil_paint_owner_teardown(bContext *C, wmWindow *win,
                                               const void *, const void *,
                                               uint64_t scene_uid, uint64_t object_uid)
{
  assert(C && C->main == G_MAIN && C->window == win && C->manager);
  ++g_teardowns;
  if (g_noop_teardown) return;
  wmEventHandler *previous = nullptr;
  wmEventHandler *base = (wmEventHandler *)win->modalhandlers.first;
  while (base) {
    wmEventHandler *next = base->next;
    if (base->type == WM_HANDLER_TYPE_OP) {
      auto *handler = reinterpret_cast<wmEventHandler_Op *>(base);
      if (handler->ipad_pencil_paint_serial &&
          handler->ipad_pencil_owner_values[6] == scene_uid &&
          handler->ipad_pencil_owner_values[7] == object_uid) {
        if (previous) previous->next = next;
        else win->modalhandlers.first = next;
        handler->head.next = nullptr;
        break;
      }
    }
    previous = base;
    base = next;
  }
  if (g_reinsert_remaining > 0) {
    const int slot = g_reinserted++;
    assert(slot < 260);
    auto &replacement = g_replacements[slot];
    replacement = wmEventHandler_Op{};
    replacement.head.type = WM_HANDLER_TYPE_OP;
    replacement.valid = true;
    replacement.ipad_pencil_operator_lifetime = 1000 + slot;
    replacement.ipad_pencil_paint_serial = 100 + slot;
    replacement.ipad_pencil_paint_mode = int(g_target_object->mode);
    replacement.ipad_pencil_owner_values[6] = scene_uid;
    replacement.ipad_pencil_owner_values[7] = object_uid;
    replacement.ipad_pencil_owner_values[9] = uint64_t(g_target_object->mode);
    auto *tail = (wmEventHandler *)win->modalhandlers.first;
    if (!tail) win->modalhandlers.first = &replacement.head;
    else { while (tail->next) tail = tail->next; tail->next = &replacement.head; }
    --g_reinsert_remaining;
  }
  if (g_change_mode) g_target_object->mode = 0;
  if (g_replace_main) G_MAIN = replacement_main;
}
'''


class PencilPaintModeExitTests(unittest.TestCase):
    def run_source(self, assertions):
        fixture = CPP + SCENE_UID + OWNER_FIND + TARGET_VALID + EXIT_MAIN + EXIT_CONTEXT + TEARDOWN + assertions
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(fixture)

    def test_no_owner_and_all_four_paint_modes(self):
        self.run_source(r'''
struct Fixture {
  Main main; wmWindowManager wm; wmWindow win; Scene scene; Object object;
  bContext C; int runtime = 1;
  Fixture(int mode) {
    G_MAIN = &main; main.wm.first = &wm; main.scenes.first = &scene;
    main.objects.first = &object; wm.windows.first = &win; win.runtime = &runtime;
    scene.id.session_uid = 71; object.id.session_uid = 72; object.mode = mode;
    g_target_object = &object;
    C = {&main, &wm, &win, &scene, &object};
  }
};
int main() {
  const int modes[] = {OB_MODE_SCULPT, OB_MODE_VERTEX_PAINT,
                       OB_MODE_WEIGHT_PAINT, OB_MODE_TEXTURE_PAINT};
  for (int mode : modes) {
    Fixture f(mode);
    assert(WM_event_ipad_pencil_paint_mode_exit(&f.main, &f.scene, &f.object));
    assert(g_teardowns == 0 && g_context_creates == 0);
  }
  Fixture none(0);
  assert(WM_event_ipad_pencil_paint_mode_exit(&none.main, &none.scene, &none.object));
  none.object.mode = OB_MODE_SCULPT;
  assert(!WM_event_ipad_pencil_paint_mode_exit((Main *)nullptr, &none.scene, &none.object));
  assert(!WM_event_ipad_pencil_paint_mode_exit((bContext *)nullptr));
}
''')

    def test_teardown_uses_live_original_windows_and_leaves_other_objects(self):
        self.run_source(r'''
int main() {
  Main main; wmWindowManager wm; wmWindow first, second; Scene scene;
  Object target, unrelated; int runtime = 1;
  G_MAIN = &main; main.wm.first = &wm; wm.windows.first = &first; first.next = &second;
  first.runtime = second.runtime = &runtime; main.scenes.first = &scene;
  main.objects.first = &target; target.next = &unrelated;
  scene.id.session_uid = 71; target.id.session_uid = 72; target.mode = OB_MODE_VERTEX_PAINT;
  g_target_object = &target;
  unrelated.id.session_uid = 73; unrelated.mode = OB_MODE_WEIGHT_PAINT;
  wmEventHandler_Op a{}, b{}, c{};
  auto init = [&](wmEventHandler_Op &h, uint64_t lifetime, uint64_t object_uid, int mode) {
    h.head.type = WM_HANDLER_TYPE_OP; h.valid = true;
    h.ipad_pencil_operator_lifetime = lifetime; h.ipad_pencil_paint_serial = lifetime;
    h.ipad_pencil_paint_mode = mode; h.ipad_pencil_owner_values[6] = 71;
    h.ipad_pencil_owner_values[7] = object_uid; h.ipad_pencil_owner_values[9] = uint64_t(mode);
  };
  init(a, 11, 72, OB_MODE_VERTEX_PAINT); init(b, 12, 72, OB_MODE_VERTEX_PAINT);
  init(c, 13, 73, OB_MODE_WEIGHT_PAINT);
  first.modalhandlers.first = &a.head; second.modalhandlers.first = &b.head;
  second.modalhandlers.first = &b.head; b.head.next = &c.head;
  assert(WM_event_ipad_pencil_paint_mode_exit(&main, &scene, &target));
  assert(g_teardowns == 2 && g_context_creates == 2 && g_context_frees == 2);
  assert(first.modalhandlers.first == nullptr);
  assert(second.modalhandlers.first == &c.head && c.head.next == nullptr);
}
''')

    def test_invalid_or_nonmodal_owner_refuses_before_any_teardown(self):
        self.run_source(r'''
int main() {
  Main main; wmWindowManager wm; wmWindow win; Scene scene; Object object; int runtime;
  G_MAIN=&main; main.wm.first=&wm; wm.windows.first=&win; win.runtime=&runtime;
  main.scenes.first=&scene; main.objects.first=&object; scene.id.session_uid=71;
  object.id.session_uid=72; object.mode=OB_MODE_SCULPT;
  wmEventHandler_Op h{}; h.head.type=WM_HANDLER_TYPE_OP; h.ipad_pencil_paint_serial=1;
  h.valid=true; h.ipad_pencil_operator_lifetime=9; h.ipad_pencil_paint_mode=OB_MODE_SCULPT;
  h.ipad_pencil_owner_values[6]=71; h.ipad_pencil_owner_values[7]=72;
  h.ipad_pencil_owner_values[9]=OB_MODE_SCULPT;
  win.handlers.first=&h.head;
  assert(!WM_event_ipad_pencil_paint_mode_exit(&main,&scene,&object));
  assert(g_teardowns==0 && g_context_creates==0);
  win.handlers.first=nullptr; win.modalhandlers.first=&h.head; h.valid=false;
  assert(!WM_event_ipad_pencil_paint_mode_exit(&main,&scene,&object));
  assert(g_teardowns==0 && g_context_creates==0);
}
''')

    def test_teardown_refusal_target_loss_and_reentrant_replacement_fail_closed(self):
        self.run_source(r'''
struct Fixture {
  Main main; wmWindowManager wm; wmWindow win; Scene scene; Object object;
  wmEventHandler_Op h; int runtime;
  Fixture() {
    G_MAIN=&main; main.wm.first=&wm; wm.windows.first=&win; win.runtime=&runtime;
    main.scenes.first=&scene; main.objects.first=&object; scene.id.session_uid=71;
    object.id.session_uid=72; object.mode=OB_MODE_SCULPT; g_target_object=&object;
    h.head.type=WM_HANDLER_TYPE_OP; h.valid=true; h.ipad_pencil_operator_lifetime=9;
    h.ipad_pencil_paint_serial=1; h.ipad_pencil_paint_mode=OB_MODE_SCULPT;
    h.ipad_pencil_owner_values[6]=71; h.ipad_pencil_owner_values[7]=72;
    h.ipad_pencil_owner_values[9]=OB_MODE_SCULPT; win.modalhandlers.first=&h.head;
  }
};
int main() {
{
  Fixture f; g_noop_teardown=true;
  assert(!WM_event_ipad_pencil_paint_mode_exit(&f.main,&f.scene,&f.object));
  assert(f.win.modalhandlers.first==&f.h.head && g_teardowns==1);
}
g_noop_teardown=false; g_teardowns=0; g_context_creates=g_context_frees=0;
{
  Fixture f; g_change_mode=true;
  assert(!WM_event_ipad_pencil_paint_mode_exit(&f.main,&f.scene,&f.object));
  assert(g_teardowns==1 && f.object.mode==0);
}
g_change_mode=false; g_teardowns=0; g_context_creates=g_context_frees=0;
{
  Fixture f; Main replacement; replacement_main=&replacement; g_replace_main=true;
  assert(!WM_event_ipad_pencil_paint_mode_exit(&f.main,&f.scene,&f.object));
  assert(G_MAIN==&replacement && g_teardowns==1);
}
g_replace_main=false; g_teardowns=0; g_context_creates=g_context_frees=0;
{
  Fixture f; g_reinsert_remaining=257; g_reinserted=0;
  assert(!WM_event_ipad_pencil_paint_mode_exit(&f.main,&f.scene,&f.object));
  assert(g_teardowns==256 && g_reinserted==256);
}
}
''')

    def test_mode_toggle_and_generic_callers_guard_native_teardown(self):
        vertex = changed_source('source/blender/editors/sculpt_paint/paint_vertex.cc')
        weight = changed_source('source/blender/editors/sculpt_paint/paint_weight.cc')
        image = changed_source('source/blender/editors/sculpt_paint/paint_image.cc')
        sculpt = changed_source('source/blender/editors/sculpt_paint/sculpt_ops.cc')
        object_modes = changed_source('source/blender/editors/object/object_modes.cc')
        view3d = changed_source('source/blender/editors/space_view3d/view3d_select.cc')
        outliner = changed_source('source/blender/editors/space_outliner/outliner_select.cc')
        sculpt_undo = changed_source('source/blender/editors/sculpt_paint/sculpt_undo.cc')
        for source, call in [(vertex, 'WM_event_ipad_pencil_paint_mode_exit(C)'),
                             (weight, 'WM_event_ipad_pencil_paint_mode_exit(C)'),
                             (image, 'WM_event_ipad_pencil_paint_mode_exit(C)'),
                             (sculpt, 'WM_event_ipad_pencil_paint_mode_exit(C)')]:
            # These hunks are deliberately bounded around the actual guard;
            # require the refusal branch to be adjacent to the mode-switch body.
            self.assertIn(call, source)
            self.assertRegex(source, re.escape(call) + r'\)\s*return(?: OPERATOR_CANCELLED)?;')
        generic = function(object_modes, 'bool mode_generic_exit(')
        self.assertLess(generic.index('WM_event_ipad_pencil_paint_mode_exit(bmain, scene, ob)'),
                        generic.index('ed_object_mode_generic_exit_ex('))
        self.assertIn('if (!mode_exit_succeeded || !BKE_object_is_mode_compat', outliner)
        self.assertIn('if (!blender::ed::object::mode_generic_exit(', view3d)
        self.assertLess(sculpt_undo.index('WM_event_ipad_pencil_paint_mode_exit(bmain, scene, ob)'),
                        sculpt_undo.index('object::mode_generic_exit(bmain, depsgraph, scene, ob)'))


if __name__ == '__main__':
    unittest.main(verbosity=2)
