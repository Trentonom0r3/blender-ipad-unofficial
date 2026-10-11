"""Run the patched native View Layer setter around Pencil paint ownership."""
from pathlib import Path
import re
import shutil
import subprocess
from tempfile import TemporaryDirectory
import unittest

from test_compact_shelf import function
import test_ipad_panels
from test_touch_extrude import changed_source


ROOT = Path(__file__).resolve().parents[1]
WINDOW_PATH = 'source/blender/windowmanager/intern/wm_window.cc'
SCREEN_PATH = 'source/blender/editors/screen/screen_edit.cc'
SCENE_PATH = 'source/blender/editors/scene/scene_edit.cc'
PIN = re.search(
    r'^  BLENDER_COMMIT: ([0-9a-f]{40})\s*$',
    (ROOT / '.github/workflows/build-ipa.yml').read_text(encoding='utf-8'),
    re.MULTILINE).group(1)
PIN_ROOT = ROOT / '.cache' / 'preflight' / PIN
PATCH_PATH = ROOT / 'patches' / 'blender-ipad.patch'
PINNED_WINDOW = (PIN_ROOT / WINDOW_PATH).read_text(encoding='utf-8')
SCREEN = changed_source(SCREEN_PATH)


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


def patched_scene_source():
    pinned = PIN_ROOT / SCENE_PATH
    if not pinned.is_file():
        raise RuntimeError('pinned Blender source cache is unavailable; run preflight first')
    with TemporaryDirectory(prefix='ipad-view-layer-delete-patch-') as directory:
        root = Path(directory)
        target = root / SCENE_PATH
        target.parent.mkdir(parents=True)
        shutil.copy2(pinned, target)
        subprocess.run(
            ['git', 'apply', '--include=' + SCENE_PATH, str(PATCH_PATH)],
            cwd=root,
            check=True,
            capture_output=True,
            text=True)
        return target.read_text(encoding='utf-8')


WINDOW = patched_window_source()
SCENE = patched_scene_source()
OWNER_TEARDOWN = function(
    WINDOW, 'static void wm_window_ipad_pencil_paint_owner_teardown(')
SET_VIEW_LAYER = function(WINDOW, 'void WM_window_set_active_view_layer(wmWindow *win, ViewLayer *view_layer)\n{')
WINDOW_OPEN = function(WINDOW, 'wmWindow *WM_window_open(')
VIEW_LAYER_DELETE = function(SCENE, 'bool ED_scene_view_layer_delete(')
VIEW_LAYER_DELETE_PREFIX = VIEW_LAYER_DELETE[:VIEW_LAYER_DELETE.index(
    '  BLI_remlink(&scene->view_layers, layer);') +
    len('  BLI_remlink(&scene->view_layers, layer);')]
ENSURE_ACTIVE_VIEW_LAYER = function(
    PINNED_WINDOW, 'void WM_window_ensure_active_view_layer(wmWindow *win)')
SCENE_CHANGE = function(SCREEN, 'void ED_screen_scene_change(')
SCENE_CHANGE_FALLBACK_PREFIX = SCENE_CHANGE[:SCENE_CHANGE.index(
    '  ViewLayer *view_layer = WM_window_get_active_view_layer(win);')]
SCENE_CHANGE_FALLBACK_PREFIX = SCENE_CHANGE_FALLBACK_PREFIX.replace(
    '{', '{\n  (void)refresh_toolsystem;', 1)
WINDOW_LAYER_SETUP = WINDOW_OPEN[
    WINDOW_OPEN.index('  /* Set scene and view layer to match original window. */'):
    WINDOW_OPEN.index('  if (WM_window_get_active_scene(win) != scene)')
]

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
  void *ghostwin = nullptr;
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
void setup_window_layer(wmWindowManager *wm, wmWindow *win, ViewLayer *view_layer)
{
''' + WINDOW_LAYER_SETUP + r'''
}
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

  root.ghostwin = &root;
  setup_window_layer(&manager, &root, &target);
  assert((g_events == std::vector<int>{101}));
  assert(STREQ(root.view_layer_name, "LayerB"));

  copy_name(root.view_layer_name, sizeof(root.view_layer_name), "LayerA");
  g_events.clear();
  wmWindow fresh;
  fresh.id = 4; fresh.scene = &scene; fresh.workspace_hook = &unrelated_screen;
  copy_name(fresh.view_layer_name, sizeof(fresh.view_layer_name), "LayerA");
  setup_window_layer(&manager, &fresh, &target);
  assert(g_events.empty());
  assert(STREQ(fresh.view_layer_name, "LayerB"));

  g_events.clear();
  WM_window_set_active_view_layer(&root, &target);
  assert((g_events == std::vector<int>{101, 201, 102, 202}));
  assert(STREQ(root.view_layer_name, "LayerB"));
  assert(STREQ(child.view_layer_name, "LayerB"));
  assert(STREQ(unrelated.view_layer_name, "LayerA"));
  assert(g_context_creates == 3 && g_context_frees == 3);

  g_events.clear();
  WM_window_set_active_view_layer(&root, &target);
  assert((g_events == std::vector<int>{201, 202}));
  assert(g_context_creates == 3 && g_context_frees == 3);
}
'''


FALLBACK_SOURCE_FIXTURE = r'''
#include <cassert>
#include <cstring>
#include <vector>

struct Scene;
struct ViewLayer { const char *name; };
struct Scene { ViewLayer *default_layer; };
struct wmWindow { Scene *scene; char view_layer_name[64]{}; };
struct bContext { wmWindow *window; Scene *scene; };

std::vector<int> g_events;
Scene *g_old_scene = nullptr;
Scene *g_new_scene = nullptr;
int g_teardowns = 0;
int g_fallback_copies = 0;

void copy_name(char *destination, std::size_t capacity, const char *source)
{
  const std::size_t length = std::strlen(source);
  assert(length < capacity);
  std::memcpy(destination, source, length + 1);
}

#define STRNCPY_UTF8(destination, source) \
  do { assert(g_teardowns == 1); \
       copy_name((destination), sizeof(destination), (source)); \
       ++g_fallback_copies; \
       g_events.push_back(5); } while (false)

wmWindow *CTX_wm_window(const bContext *context) { return context->window; }
void CTX_data_scene_set(bContext *context, Scene *scene)
{
  context->scene = scene;
  g_events.push_back(2);
}
void WM_event_ipad_pencil_paint_owner_teardown(
    bContext *context, wmWindow *window, void *, void *)
{
  assert(context->window == window);
  assert(context->scene == g_old_scene);
  assert(window->scene == g_old_scene);
  ++g_teardowns;
  g_events.push_back(1);
}
Scene *WM_window_get_active_scene(const wmWindow *window) { return window->scene; }
ViewLayer *BKE_view_layer_find(Scene *scene, const char *name)
{
  g_events.push_back(3);
  assert(scene == g_new_scene);
  return scene->default_layer && std::strcmp(scene->default_layer->name, name) == 0 ?
             scene->default_layer : nullptr;
}
ViewLayer *BKE_view_layer_default_view(Scene *scene)
{
  g_events.push_back(4);
  return scene->default_layer;
}
void WM_window_ensure_active_view_layer(wmWindow *win);

#define WITH_APPLE_CROSSPLATFORM
''' + SCENE_CHANGE_FALLBACK_PREFIX + r'''
}

''' + ENSURE_ACTIVE_VIEW_LAYER + r'''

int main()
{
  ViewLayer old_layer{"LayerA"}, new_layer{"LayerB"};
  Scene old_scene{&old_layer}, new_scene{&new_layer};
  wmWindow window{};
  window.scene = &old_scene;
  copy_name(window.view_layer_name, sizeof(window.view_layer_name), "DeletedLayer");
  bContext context{&window, &old_scene};
  g_old_scene = &old_scene;
  g_new_scene = &new_scene;

  ED_screen_scene_change(&context, &window, &new_scene, false);
  assert((g_events == std::vector<int>{1, 2, 3, 4, 5}));
  assert(g_teardowns == 1 && g_fallback_copies == 1);
  assert(context.scene == &new_scene && window.scene == &new_scene);
  assert(std::strcmp(window.view_layer_name, "LayerB") == 0);

  g_events.clear();
  ED_screen_scene_change(&context, &window, &new_scene, false);
  assert((g_events == std::vector<int>{2, 3}));
  assert(g_teardowns == 1 && g_fallback_copies == 1);
}
'''


VIEW_LAYER_DELETE_SOURCE_FIXTURE = r'''
#include <cassert>
#include <cstring>
#include <vector>

struct ListBase { void *first = nullptr; };
struct Scene;
struct ViewLayer {
  ViewLayer *next = nullptr;
  char name[64]{};
};
struct wmWindow {
  wmWindow *next = nullptr;
  Scene *scene = nullptr;
  char view_layer_name[64]{};
  int id = 0;
};
struct wmWindowManager { ListBase windows; };
struct Main { ListBase wm; };
struct Scene {
  ListBase view_layers;
  struct { char name[64]{}; } id;
};
struct ReportList {};

#define STREQ(a, b) (std::strcmp((a), (b)) == 0)
#define RPT_ERROR 1
#define LISTBASE_FOREACH(type, item, list) \
  for (type item = static_cast<type>((list)->first); item; item = item->next)

Scene *g_scene = nullptr;
ViewLayer *g_target = nullptr;
wmWindowManager *g_manager = nullptr;
bool g_poll_accepts = false;
bool g_layer_linked = true;
std::vector<int> g_events;
std::vector<int> g_torn_down;
struct bContext {
  Main *main = nullptr;
  wmWindowManager *manager = nullptr;
  wmWindow *window = nullptr;
};
void set_name(char *destination, const char *source)
{
  const std::size_t length = std::strlen(source);
  assert(length < 64);
  std::memcpy(destination, source, length + 1);
}

bool view_layer_remove_poll(Scene *, ViewLayer *) { return g_poll_accepts; }
void BKE_reportf(ReportList *, int, const char *, ...) {}
bContext *CTX_create() { return new bContext(); }
void CTX_free(bContext *context) { delete context; }
void CTX_data_main_set(bContext *context, Main *main) { context->main = main; }
void CTX_wm_manager_set(bContext *context, wmWindowManager *manager)
{
  context->manager = manager;
}
void CTX_wm_window_set(bContext *context, wmWindow *window) { context->window = window; }
void WM_event_ipad_pencil_paint_owner_teardown(bContext *context,
                                               wmWindow *window,
                                               const void *,
                                               const void *)
{
  assert(context && context->main && context->manager == g_manager);
  assert(context->window == window && window->scene == g_scene && g_layer_linked);
  assert(STREQ(window->view_layer_name, g_target->name));
  g_torn_down.push_back(window->id);
  g_events.push_back(1);
}
void view_layer_remove_unset_nodetrees(Main *, Scene *, ViewLayer *)
{
  assert(g_layer_linked);
  assert((g_torn_down == std::vector<int>{1}));
  g_events.push_back(2);
}
void BLI_remlink(ListBase *list, ViewLayer *layer)
{
  assert(g_layer_linked && list->first == layer);
  for (auto *window = static_cast<wmWindow *>(g_manager->windows.first); window;
       window = window->next)
  {
    if (window->scene == g_scene && STREQ(window->view_layer_name, layer->name)) {
      bool retired = false;
      for (const int id : g_torn_down) retired |= id == window->id;
      assert(retired);
    }
  }
  g_layer_linked = false;
  list->first = nullptr;
  g_events.push_back(3);
}
#define WITH_APPLE_CROSSPLATFORM
''' + VIEW_LAYER_DELETE_PREFIX + r'''
  return true;
}

int main()
{
  Scene scene{};
  g_scene = &scene;
  ViewLayer removed{};
  set_name(removed.name, "LayerA");
  g_target = &removed;
  scene.view_layers.first = &removed;

  Scene other_scene{};
  wmWindow matching{}, other_scene_match{}, different_layer{};
  matching.scene = &scene; matching.id = 1;
  other_scene_match.scene = &other_scene; other_scene_match.id = 2;
  different_layer.scene = &scene; different_layer.id = 3;
  set_name(matching.view_layer_name, "LayerA");
  set_name(other_scene_match.view_layer_name, "LayerA");
  set_name(different_layer.view_layer_name, "LayerB");
  matching.next = &other_scene_match;
  other_scene_match.next = &different_layer;

  wmWindowManager manager{};
  manager.windows.first = &matching;
  g_manager = &manager;
  Main main{};
  main.wm.first = &manager;

  assert(!ED_scene_view_layer_delete(&main, &scene, &removed, nullptr));
  assert(g_events.empty() && g_torn_down.empty() && g_layer_linked);

  g_poll_accepts = true;
  assert(ED_scene_view_layer_delete(&main, &scene, &removed, nullptr));
  assert((g_events == std::vector<int>{1, 2, 3}));
  assert((g_torn_down == std::vector<int>{1}));
  assert(!g_layer_linked && scene.view_layers.first == nullptr);
}
'''


class PencilPaintViewLayerTeardownTests(unittest.TestCase):
    def test_teardown_precedes_parent_and_child_view_layer_mutation(self):
        self.assertIn('CTX_wm_window_set(C, win);', OWNER_TEARDOWN)
        self.assertIn('WM_event_ipad_pencil_paint_owner_teardown(C, win, nullptr, nullptr);',
                      OWNER_TEARDOWN)
        self.assertIn('win->ghostwin != nullptr', WINDOW_LAYER_SETUP)
        self.assertIn('!STREQ(win->view_layer_name, view_layer->name)', WINDOW_LAYER_SETUP)
        self.assertLess(
            WINDOW_LAYER_SETUP.index('wm_window_ipad_pencil_paint_owner_teardown(wm, win);'),
            WINDOW_LAYER_SETUP.index('STRNCPY_UTF8(win->view_layer_name, view_layer->name)'))
        hook = 'wm_window_ipad_pencil_paint_owner_teardown(wm, win_iter);'
        self.assertLess(SET_VIEW_LAYER.index(hook),
                        SET_VIEW_LAYER.index('STRNCPY_UTF8(win_iter->view_layer_name'))
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(SOURCE_FIXTURE)

    def test_missing_view_layer_repair_runs_inside_guarded_scene_change(self):
        pinned_sources = PIN_ROOT / 'source'
        direct_calls = []
        for path in pinned_sources.rglob('*'):
            if not path.is_file() or path.suffix not in {'.c', '.cc', '.cpp', '.h', '.hh'}:
                continue
            source = path.read_text(encoding='utf-8', errors='replace')
            if 'WM_window_ensure_active_view_layer(win);' in source:
                direct_calls.append((path.relative_to(pinned_sources).as_posix(),
                                     source.count('WM_window_ensure_active_view_layer(win);')))
        self.assertEqual(direct_calls, [('blender/editors/screen/screen_edit.cc', 1)])
        teardown = 'WM_event_ipad_pencil_paint_owner_teardown(C, win, nullptr, nullptr);'
        scene_write = 'win->scene = scene;'
        fallback = 'WM_window_ensure_active_view_layer(win);'
        self.assertLess(SCENE_CHANGE_FALLBACK_PREFIX.index(teardown),
                        SCENE_CHANGE_FALLBACK_PREFIX.index(scene_write))
        self.assertLess(SCENE_CHANGE_FALLBACK_PREFIX.index(scene_write),
                        SCENE_CHANGE_FALLBACK_PREFIX.index(fallback))
        self.assertIn('if (scene && BKE_view_layer_find(scene, win->view_layer_name) == nullptr)',
                      ENSURE_ACTIVE_VIEW_LAYER)
        self.assertLess(ENSURE_ACTIVE_VIEW_LAYER.index('BKE_view_layer_default_view(scene)'),
                        ENSURE_ACTIVE_VIEW_LAYER.index('STRNCPY_UTF8(win->view_layer_name'))
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(FALLBACK_SOURCE_FIXTURE)

    def test_delete_retires_matching_windows_before_unlink_and_only_after_poll(self):
        poll = VIEW_LAYER_DELETE.index('if (view_layer_remove_poll(scene, layer) == false)')
        refusal = VIEW_LAYER_DELETE.index('return false;', poll)
        teardown = VIEW_LAYER_DELETE.index('WM_event_ipad_pencil_paint_owner_teardown(')
        unset_nodes = VIEW_LAYER_DELETE.index('view_layer_remove_unset_nodetrees(')
        unlink = VIEW_LAYER_DELETE.index('BLI_remlink(&scene->view_layers, layer);')
        self.assertLess(refusal, teardown)
        self.assertLess(teardown, unset_nodes)
        self.assertLess(unset_nodes, unlink)
        self.assertIn('paint_owner_win->scene == scene', VIEW_LAYER_DELETE)
        self.assertIn('STREQ(paint_owner_win->view_layer_name, layer->name)', VIEW_LAYER_DELETE)
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(
            VIEW_LAYER_DELETE_SOURCE_FIXTURE)


if __name__ == '__main__':
    unittest.main(verbosity=2)
