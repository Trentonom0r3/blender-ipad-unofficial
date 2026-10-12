"""Execute live View Layer and Workspace switches with native Pencil teardown."""
import unittest

from test_compact_shelf import function
import test_ipad_panels
import test_pencil_paint_view_layer_teardown as view_layer


WINDOW = view_layer.WINDOW
FIND_MANAGER = function(WINDOW, 'static wmWindowManager *wm_window_ipad_find_manager(')
FIND_WINDOW = function(WINDOW, 'static wmWindow *wm_window_ipad_find_window(')
SNAPSHOT_STRUCT = WINDOW[WINDOW.index('struct wmWindowIPadPaintContextSnapshot {'):
                         WINDOW.index('};', WINDOW.index('struct wmWindowIPadPaintContextSnapshot {')) + 2]
SNAPSHOT = function(WINDOW, 'static wmWindowIPadPaintContextSnapshot wm_window_ipad_context_snapshot(')
CONTEXT_MATCHES = function(WINDOW, 'static bool wm_window_ipad_context_matches(')
HAS_OWNER = function(WINDOW, 'static bool wm_window_ipad_has_pencil_paint_owner(')
OWNER_TEARDOWN = function(WINDOW, 'static bool wm_window_ipad_pencil_paint_owner_teardown(')
SET_VIEW_LAYER = function(WINDOW, 'void WM_window_set_active_view_layer(wmWindow *win, ViewLayer *view_layer)\n{')
SET_WORKSPACE = function(WINDOW, 'void WM_window_set_active_workspace(bContext *C, wmWindow *win, WorkSpace *workspace)\n{')


SOURCE = r'''
#include <cassert>
#include <cstddef>
#include <cstdint>
#include <cstring>
#include <vector>

struct ID { unsigned int session_uid = 0; };
struct ListBase { void *first = nullptr; };
struct Scene;
struct WorkSpace;
struct bScreen { bScreen *next = nullptr; ID id; bool temp = false; };
struct WorkSpace { WorkSpace *next = nullptr; ID id; };
struct ViewLayer { char name[64]{}; };
struct wmEventHandler { wmEventHandler *next = nullptr; int type = 0; };
struct wmEventHandler_Op : wmEventHandler { uint64_t ipad_pencil_paint_serial = 0; };
struct WorkspaceHook { WorkSpace *workspace = nullptr; bScreen *screen = nullptr; };
struct wmWindow {
  wmWindow *next = nullptr;
  wmWindow *parent = nullptr;
  int winid = 0;
  void *runtime = nullptr;
  void *ghostwin = nullptr;
  char view_layer_name[64]{};
  WorkspaceHook *workspace_hook = nullptr;
  Scene *scene = nullptr;
  ListBase handlers, modalhandlers;
};
struct wmWindowManager { wmWindowManager *next = nullptr; ListBase windows; };
struct Scene { Scene *next = nullptr; ID id; };
struct Main { ListBase wm, screens, workspaces, scenes; };
struct bContext { Main *main = nullptr; wmWindowManager *manager = nullptr; wmWindow *window = nullptr; };
struct ScrArea;
struct ARegion;

template<class T> struct Vector : std::vector<T> {
  void append(const T &value) { this->push_back(value); }
};
namespace blender { template<class T> using Vector = ::Vector<T>; }
enum { WM_HANDLER_TYPE_OP = 1 };
static Main *G_MAIN = nullptr;
static Main g_replacement_main;
static bool g_replace_main = false;
static ViewLayer g_target_layer{{"LayerB"}};
static int g_refuse_id = -1;
static int g_change_screen_id = -1;
static int g_change_workspace_id = -1;
static int g_remove_window_id = -1;
static WorkSpace *g_callback_workspace = nullptr;
static wmWindow *g_reentrant_owner_window = nullptr;
static wmEventHandler_Op g_reentrant_owner;
static std::vector<int> g_events;

#define WITH_APPLE_CROSSPLATFORM
#define STREQ(a,b) (std::strcmp((a),(b)) == 0)
#define BLI_assert(condition) assert(condition)
#define LISTBASE_FOREACH(type, var, list) \
  for (type var = static_cast<type>((list)->first); var; var = var->next)
static void copy_name(char *dst, std::size_t capacity, const char *src)
{
  assert(std::strlen(src) < capacity);
  std::memcpy(dst, src, std::strlen(src) + 1);
}
#define STRNCPY_UTF8(dst,src) copy_name((dst), sizeof(dst), (src))
Main *CTX_data_main(bContext *C) { return C->main; }
wmWindowManager *CTX_wm_manager(bContext *C) { return C->manager; }
bContext *CTX_create() { return new bContext(); }
void CTX_free(bContext *C) { delete C; }
void CTX_data_main_set(bContext *C, Main *main) { C->main = main; }
void CTX_wm_manager_set(bContext *C, wmWindowManager *wm) { C->manager = wm; }
void CTX_wm_window_set(bContext *C, wmWindow *win) { C->window = win; }
WorkSpace *WM_window_get_active_workspace(const wmWindow *win)
{
  return win->workspace_hook->workspace;
}
bScreen *WM_window_get_active_screen(const wmWindow *win)
{
  return win->workspace_hook->screen;
}
Scene *WM_window_get_active_scene(const wmWindow *win) { return win->scene; }
bScreen *BKE_workspace_active_screen_get(WorkspaceHook *hook) { return hook->screen; }
ViewLayer *BKE_view_layer_find(Scene *, const char *name)
{
  return STREQ(name, g_target_layer.name) || STREQ(name, "LayerA") ? &g_target_layer : nullptr;
}
void ED_render_view_layer_changed(Main *, bScreen *screen)
{
  assert(screen);
  g_events.push_back(300 + int(screen->id.session_uid));
}
void ED_workspace_change(WorkSpace *workspace, bContext *, wmWindowManager *, wmWindow *win)
{
  g_events.push_back(200 + win->winid);
  win->workspace_hook->workspace = workspace;
}
void WM_event_ipad_pencil_paint_owner_teardown(bContext *C,
                                                wmWindow *win,
                                                const ScrArea *,
                                                const ARegion *)
{
  assert(C && C->main == G_MAIN && C->window == win);
  const bool had_owner = win->modalhandlers.first || win->handlers.first;
  if (had_owner) g_events.push_back(100 + win->winid);
  if (win->winid == g_remove_window_id) {
    wmWindowManager *wm = C->manager;
    wmWindow *previous = nullptr;
    for (wmWindow *candidate = static_cast<wmWindow *>(wm->windows.first); candidate;
         candidate = candidate->next)
    {
      if (candidate->winid == 2) {
        if (previous) previous->next = candidate->next;
        else wm->windows.first = candidate->next;
        break;
      }
      previous = candidate;
    }
  }
  if (win->winid == g_change_screen_id) {
    win->workspace_hook->screen = static_cast<bScreen *>(G_MAIN->screens.first)->next->next;
  }
  if (win->winid == g_change_workspace_id) {
    for (wmWindow *candidate = static_cast<wmWindow *>(C->manager->windows.first); candidate;
         candidate = candidate->next)
    {
      if (candidate->winid == 2) candidate->workspace_hook->workspace = g_callback_workspace;
    }
  }
  if (win->winid == 2 && g_reentrant_owner_window) {
    g_reentrant_owner_window->modalhandlers.first = &g_reentrant_owner;
  }
  if (win->winid == g_refuse_id) return;
  win->modalhandlers.first = nullptr;
  win->handlers.first = nullptr;
  if (g_replace_main) G_MAIN = &g_replacement_main;
}

__HELPERS__
__OWNER_TEARDOWN__
__SET_VIEW_LAYER__
__SET_WORKSPACE__

static wmEventHandler_Op root_owner, child_owner;
static void add_owners(wmWindow &root, wmWindow &child)
{
  root_owner = {};
  child_owner = {};
  root_owner.type = child_owner.type = WM_HANDLER_TYPE_OP;
  root_owner.ipad_pencil_paint_serial = 101;
  child_owner.ipad_pencil_paint_serial = 202;
  root.modalhandlers.first = &root_owner;
  child.modalhandlers.first = &child_owner;
}
int main()
{
  Main main;
  G_MAIN = &main;
  Scene scene{}; scene.id.session_uid = 50; main.scenes.first = &scene;
  WorkSpace original{}, target{}, alternate{};
  original.id.session_uid = 10; target.id.session_uid = 11; alternate.id.session_uid = 12;
  original.next = &target; target.next = &alternate; main.workspaces.first = &original;
  bScreen root_screen{}, child_screen{}, other_screen{}, changed_screen{}, temp_screen{};
  root_screen.id.session_uid = 20; child_screen.id.session_uid = 21;
  other_screen.id.session_uid = 22; changed_screen.id.session_uid = 23;
  temp_screen.id.session_uid = 24; temp_screen.temp = true;
  root_screen.next = &child_screen; child_screen.next = &other_screen;
  other_screen.next = &changed_screen; changed_screen.next = &temp_screen;
  main.screens.first = &root_screen;
  WorkspaceHook root_hook{&original, &root_screen}, child_hook{&original, &child_screen};
  WorkspaceHook unrelated_hook{&original, &other_screen}, temp_hook{&original, &temp_screen};
  int runtime_token = 1;
  wmWindow root{}, child{}, unrelated{}, temporary{};
  root.winid=1; root.runtime=&runtime_token; root.scene=&scene; root.workspace_hook=&root_hook;
  child.winid=2; child.runtime=&runtime_token; child.scene=&scene; child.parent=&root;
  child.workspace_hook=&child_hook;
  unrelated.winid=3; unrelated.runtime=&runtime_token; unrelated.scene=&scene;
  unrelated.workspace_hook=&unrelated_hook;
  temporary.winid=4; temporary.runtime=&runtime_token; temporary.scene=&scene;
  temporary.parent=&root; temporary.workspace_hook=&temp_hook;
  STRNCPY_UTF8(root.view_layer_name,"LayerA"); STRNCPY_UTF8(child.view_layer_name,"LayerA");
  STRNCPY_UTF8(unrelated.view_layer_name,"LayerA"); STRNCPY_UTF8(temporary.view_layer_name,"LayerA");
  root.next=&child; child.next=&unrelated; unrelated.next=&temporary;
  wmWindowManager manager{}; manager.windows.first=&root; main.wm.first=&manager;
  bContext C{&main,&manager,&root};

  add_owners(root, child);
  WM_window_set_active_view_layer(&root, &g_target_layer);
  assert((g_events == std::vector<int>{101,102,320,321,324}));
  assert(STREQ(root.view_layer_name,"LayerB") && STREQ(child.view_layer_name,"LayerB"));
  assert(STREQ(temporary.view_layer_name,"LayerB"));
  assert(unrelated.modalhandlers.first == nullptr && unrelated.view_layer_name[0] == 'L');

  g_events.clear(); STRNCPY_UTF8(root.view_layer_name,"LayerA");
  STRNCPY_UTF8(child.view_layer_name,"LayerA");
  add_owners(root, child); g_refuse_id=2;
  WM_window_set_active_view_layer(&root, &g_target_layer);
  assert((g_events == std::vector<int>{101,102}));
  assert(STREQ(root.view_layer_name,"LayerA") && STREQ(child.view_layer_name,"LayerA"));
  assert(child.modalhandlers.first == &child_owner);

  g_events.clear(); g_refuse_id=-1; add_owners(root,child); g_change_screen_id=1;
  WM_window_set_active_view_layer(&root, &g_target_layer);
  assert((g_events == std::vector<int>{101}));
  assert(STREQ(root.view_layer_name,"LayerA") && STREQ(child.view_layer_name,"LayerA"));
  root_hook.screen=&root_screen; g_change_screen_id=-1;

  g_events.clear(); add_owners(root,child); g_replace_main=true;
  WM_window_set_active_view_layer(&root, &g_target_layer);
  assert((g_events == std::vector<int>{101}));
  assert(STREQ(root.view_layer_name,"LayerA") && STREQ(child.view_layer_name,"LayerA"));
  G_MAIN=&main; g_replace_main=false;

  g_events.clear(); add_owners(root,child);
  g_reentrant_owner.type = WM_HANDLER_TYPE_OP;
  g_reentrant_owner.ipad_pencil_paint_serial = 303;
  g_reentrant_owner_window = &root;
  WM_window_set_active_view_layer(&root, &g_target_layer);
  assert((g_events == std::vector<int>{101,102}));
  assert(STREQ(root.view_layer_name,"LayerA") && STREQ(child.view_layer_name,"LayerA"));
  assert(root.modalhandlers.first == &g_reentrant_owner);
  root.modalhandlers.first = nullptr;
  g_reentrant_owner_window = nullptr;

  g_events.clear(); add_owners(root,child); g_refuse_id=2;
  WM_window_set_active_workspace(&C,&root,&target);
  assert((g_events == std::vector<int>{101,102}));
  assert(root_hook.workspace==&original && child_hook.workspace==&original);
  assert(temp_hook.workspace==&original);

  g_events.clear(); g_refuse_id=-1; add_owners(root,child);
  WM_window_set_active_workspace(&C,&root,&target);
  assert((g_events == std::vector<int>{101,102,201,202}));
  assert(root_hook.workspace==&target && child_hook.workspace==&target);
  assert(temp_hook.workspace==&original && unrelated_hook.workspace==&original);

  g_events.clear(); root_hook.workspace=&original; child_hook.workspace=&original;
  add_owners(root,child); g_change_workspace_id=1; g_callback_workspace=&alternate;
  WM_window_set_active_workspace(&C,&root,&target);
  assert((g_events == std::vector<int>{101,102}));
  assert(root_hook.workspace==&original && child_hook.workspace==&alternate);
  g_change_workspace_id=-1; child_hook.workspace=&original;

  g_events.clear(); add_owners(root,child); g_remove_window_id=1;
  WM_window_set_active_workspace(&C,&root,&target);
  assert((g_events == std::vector<int>{101}));
  assert(root_hook.workspace==&original && child_hook.workspace==&original);
}
'''

HELPERS = '\n'.join((FIND_MANAGER, FIND_WINDOW, SNAPSHOT_STRUCT, SNAPSHOT,
                      CONTEXT_MATCHES, HAS_OWNER))
SOURCE = SOURCE.replace('__HELPERS__', HELPERS)
SOURCE = SOURCE.replace('__OWNER_TEARDOWN__', OWNER_TEARDOWN)
SOURCE = SOURCE.replace('__SET_VIEW_LAYER__', SET_VIEW_LAYER)
SOURCE = SOURCE.replace('__SET_WORKSPACE__', SET_WORKSPACE)


class PencilPaintWindowContextSwitchTests(unittest.TestCase):
    def test_teardown_refusal_or_owner_context_change_blocks_layer_and_workspace_switch(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(SOURCE)


if __name__ == '__main__':
    unittest.main(verbosity=2)
