"""Run the patched native View Layer setter around Pencil paint ownership."""
from pathlib import Path
import re
import shutil
import subprocess
from tempfile import TemporaryDirectory
import unittest

from test_compact_shelf import function
import test_ipad_panels


ROOT = Path(__file__).resolve().parents[1]
WINDOW_PATH = 'source/blender/windowmanager/intern/wm_window.cc'
PIN = re.search(
    r'^  BLENDER_COMMIT: ([0-9a-f]{40})\s*$',
    (ROOT / '.github/workflows/build-ipa.yml').read_text(encoding='utf-8'),
    re.MULTILINE).group(1)
PIN_ROOT = ROOT / '.cache' / 'preflight' / PIN
PATCH_PATH = ROOT / 'patches' / 'blender-ipad.patch'


def patched_window_source():
    pinned = PIN_ROOT / WINDOW_PATH
    if not pinned.is_file():
        raise RuntimeError('pinned Blender source cache is unavailable; run preflight first')
    with TemporaryDirectory(prefix='ipad-view-layer-patch-') as directory:
        root = Path(directory)
        target = root / WINDOW_PATH
        target.parent.mkdir(parents=True)
        shutil.copy2(pinned, target)
        subprocess.run(
            ['git', 'apply', '--include=' + WINDOW_PATH, str(PATCH_PATH)],
            cwd=root,
            check=True,
            capture_output=True,
            text=True)
        return target.read_text(encoding='utf-8')


WINDOW = patched_window_source()
OWNER_TEARDOWN = function(
    WINDOW, 'static void wm_window_ipad_pencil_paint_owner_teardown(')
SET_VIEW_LAYER = function(WINDOW, 'void WM_window_set_active_view_layer(wmWindow *win, ViewLayer *view_layer)\n{')

SOURCE_FIXTURE = r'''
#include <cassert>
#include <cstring>
#include <vector>

struct wmWindow;
struct wmWindowManager;
struct Main;
struct Scene {};
struct ViewLayer { char name[64]; };
struct bScreen { int id = 0; };
struct ListBase { void *first = nullptr; };
struct wmWindowManager { wmWindowManager *next = nullptr; ListBase windows; };
struct Main { ListBase wm; };
struct wmWindow {
  wmWindow *next = nullptr;
  wmWindow *parent = nullptr;
  void *runtime = nullptr;
  char view_layer_name[64]{};
  bScreen *workspace_hook = nullptr;
  Scene *scene = nullptr;
  int id = 0;
};
struct bContext {
  Main *main = nullptr;
  wmWindowManager *manager = nullptr;
  wmWindow *window = nullptr;
  bScreen *screen = nullptr;
};

Main *G_MAIN = nullptr;
wmWindowManager *g_manager = nullptr;
ViewLayer *g_target_layer = nullptr;
std::vector<int> g_events;
int g_context_creates = 0;
int g_context_frees = 0;

#define BLI_assert(condition) assert(condition)
#define STREQ(a, b) (std::strcmp((a), (b)) == 0)
void copy_name(char *destination, std::size_t capacity, const char *source)
{
  assert(destination && source && capacity > 0);
  const std::size_t length = std::strlen(source);
  assert(length < capacity);
  for (std::size_t i = 0; i <= length; ++i) destination[i] = source[i];
}
#define STRNCPY_UTF8(destination, source) copy_name((destination), sizeof(destination), (source))
#define LISTBASE_FOREACH(type, item, list) \
  for (type item = static_cast<type>((list)->first); item; item = item->next)

int BLI_findindex(const ListBase *list, const wmWindowManager *target)
{
  int index = 0;
  for (auto *item = static_cast<wmWindowManager *>(list->first); item;
       item = item->next, ++index)
  {
    if (item == target) return index;
  }
  return -1;
}
int BLI_findindex(const ListBase *list, const wmWindow *target)
{
  int index = 0;
  for (auto *item = static_cast<wmWindow *>(list->first); item;
       item = item->next, ++index)
  {
    if (item == target) return index;
  }
  return -1;
}

bContext *CTX_create()
{
  ++g_context_creates;
  return new bContext();
}
void CTX_free(bContext *context)
{
  ++g_context_frees;
  delete context;
}
void CTX_data_main_set(bContext *context, Main *main) { context->main = main; }
void CTX_wm_manager_set(bContext *context, wmWindowManager *manager)
{
  context->manager = manager;
}
void CTX_wm_window_set(bContext *context, wmWindow *window)
{
  context->window = window;
  context->screen = window ? window->workspace_hook : nullptr;
}
Scene *WM_window_get_active_scene(wmWindow *window) { return window->scene; }
ViewLayer *BKE_view_layer_find(Scene *, const char *name)
{
  return STREQ(g_target_layer->name, name) ? g_target_layer : nullptr;
}
bScreen *BKE_workspace_active_screen_get(bScreen *screen) { return screen; }
void ED_render_view_layer_changed(Main *, bScreen *screen)
{
  assert(screen);
  g_events.push_back(200 + screen->id);
}
void WM_event_ipad_pencil_paint_owner_teardown(
    bContext *context, wmWindow *window, const void *, const void *)
{
  assert(context && context->main == G_MAIN && context->manager == g_manager);
  assert(context->window == window && context->screen == window->workspace_hook);
  assert(std::strcmp(window->view_layer_name, window->id == 1 ? "LayerA" : "LayerChild") == 0);
  g_events.push_back(100 + window->id);
}

#define WITH_APPLE_CROSSPLATFORM
''' + OWNER_TEARDOWN + '\n' + SET_VIEW_LAYER + r'''
int main()
{
  Scene scene;
  ViewLayer target{{"LayerB"}};
  bScreen root_screen{1}, child_screen{2}, unrelated_screen{3};
  wmWindow root, child, unrelated;
  root.id = 1; root.runtime = &root; root.scene = &scene;
  root.workspace_hook = &root_screen;
  copy_name(root.view_layer_name, sizeof(root.view_layer_name), "LayerA");
  child.id = 2; child.runtime = &child; child.scene = &scene;
  child.parent = &root; child.workspace_hook = &child_screen;
  copy_name(child.view_layer_name, sizeof(child.view_layer_name), "LayerChild");
  unrelated.id = 3; unrelated.runtime = &unrelated; unrelated.scene = &scene;
  unrelated.workspace_hook = &unrelated_screen;
  copy_name(unrelated.view_layer_name, sizeof(unrelated.view_layer_name), "LayerA");
  root.next = &child; child.next = &unrelated;

  wmWindowManager manager;
  manager.windows.first = &root;
  Main main;
  main.wm.first = &manager;
  G_MAIN = &main;
  g_manager = &manager;
  g_target_layer = &target;

  WM_window_set_active_view_layer(&root, &target);
  assert((g_events == std::vector<int>{101, 201, 102, 202}));
  assert(STREQ(root.view_layer_name, "LayerB"));
  assert(STREQ(child.view_layer_name, "LayerB"));
  assert(STREQ(unrelated.view_layer_name, "LayerA"));
  assert(g_context_creates == 2 && g_context_frees == 2);

  g_events.clear();
  WM_window_set_active_view_layer(&root, &target);
  assert((g_events == std::vector<int>{201, 202}));
  assert(g_context_creates == 2 && g_context_frees == 2);
}
'''


class PencilPaintViewLayerTeardownTests(unittest.TestCase):
    def test_teardown_precedes_parent_and_child_view_layer_mutation(self):
        self.assertIn('CTX_wm_window_set(C, win);', OWNER_TEARDOWN)
        self.assertIn('WM_event_ipad_pencil_paint_owner_teardown(C, win, nullptr, nullptr);',
                      OWNER_TEARDOWN)
        hook = 'wm_window_ipad_pencil_paint_owner_teardown(wm, win_iter);'
        self.assertLess(SET_VIEW_LAYER.index(hook),
                        SET_VIEW_LAYER.index('STRNCPY_UTF8(win_iter->view_layer_name'))
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(SOURCE_FIXTURE)


if __name__ == '__main__':
    unittest.main(verbosity=2)
