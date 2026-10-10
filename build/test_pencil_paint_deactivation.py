"""Execute the native GHOST deactivation branch and prove owner-first ordering."""
import unittest

from test_compact_shelf import function
from test_pencil_paint_contact_lease import cpp_block
from test_touch_extrude import changed_source


WINDOW = changed_source('source/blender/windowmanager/intern/wm_window.cc')
GHOST_PROC = function(WINDOW, 'static bool ghost_event_proc(')
DEACTIVATION = cpp_block(GHOST_PROC, 'case GHOST_kEventWindowDeactivate:')
ACTIVATION = cpp_block(GHOST_PROC, 'case GHOST_kEventWindowActivate:')
WM_EVENTS = changed_source('source/blender/windowmanager/intern/wm_event_system.cc')
WM_EVENT_LOOP = function(WM_EVENTS, 'void wm_event_do_handlers(')
WM_MAIN = changed_source('source/blender/windowmanager/intern/wm.cc')
WM_MAIN_LOOP = function(WM_MAIN, 'void WM_main_loop_body(')


CPP_FIXTURE = r'''
#include <cassert>
#include <cstdint>
#include <vector>
struct bContext {};
struct wmWindowManager {};
struct wmWindow { bool active = true; };
struct ScrArea {};
struct ARegion {};
struct wmEvent {};
using GHOST_TEventDataPtr = void *;
using GHOST_TEventType = int;
constexpr int GHOST_kEventWindowDeactivate = 1;
std::vector<int> g_order;
#define WITH_APPLE_CROSSPLATFORM
void WM_event_ipad_pencil_paint_owner_teardown(
    bContext *, wmWindow *, const ScrArea *, const ARegion *)
{
  g_order.push_back(1);
}
void wm_window_update_eventstate_modifiers_clear(
    wmWindowManager *, wmWindow *, uint64_t)
{
  g_order.push_back(2);
}
void wm_event_add_ghostevent(
    wmWindowManager *, wmWindow *, GHOST_TEventType, GHOST_TEventDataPtr, uint64_t)
{
  g_order.push_back(3);
}

void execute_deactivation_case()
{
  bContext *C = nullptr;
  wmWindowManager manager;
  wmWindow window;
  wmWindowManager *wm = &manager;
  wmWindow *win = &window;
  GHOST_TEventType type = GHOST_kEventWindowDeactivate;
  GHOST_TEventDataPtr data = nullptr;
  uint64_t event_time_ms = 42;
  switch (type) {
    DEACTIVATION_CASE
    default: break;
  }
  assert((g_order == std::vector<int>{1, 2, 3}));
  assert(!window.active);
}
#undef WITH_APPLE_CROSSPLATFORM

int main() { execute_deactivation_case(); }
'''


class PencilPaintDeactivationTests(unittest.TestCase):
    def test_owner_is_retired_synchronously_before_deactivation_is_queued(self):
        self.assertLess(
            DEACTIVATION.index('WM_event_ipad_pencil_paint_owner_teardown('),
            DEACTIVATION.index('wm_window_update_eventstate_modifiers_clear('),
        )
        self.assertLess(
            DEACTIVATION.index('WM_event_ipad_pencil_paint_owner_teardown('),
            DEACTIVATION.index('wm_event_add_ghostevent('),
        )
        self.assertNotIn('WM_event_ipad_pencil_paint_owner_teardown(', ACTIVATION)
        self.assertLess(
            WM_MAIN_LOOP.index('wm_window_events_process(C);'),
            WM_MAIN_LOOP.index('wm_event_do_handlers(C);'),
        )
        self.assertLess(
            WM_EVENT_LOOP.index('LISTBASE_FOREACH (wmWindow *'),
            WM_EVENT_LOOP.index('while ((event = static_cast<wmEvent *>(win->runtime->event_queue.first)))'),
        )
        source = CPP_FIXTURE.replace('DEACTIVATION_CASE', DEACTIVATION)
        import test_ipad_panels
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(source)


if __name__ == '__main__':
    unittest.main(verbosity=2)
