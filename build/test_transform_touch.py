"""Exercise the shipped transform interruption path against release-confirm."""
from pathlib import Path
import unittest
import test_ipad_panels


class TransformTouchTests(unittest.TestCase):
    def test_interruption_restores_instead_of_confirming(self):
        patch = (Path(__file__).resolve().parents[1] / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        section = patch.split('diff --git a/source/blender/editors/transform/transform_ops.cc ', 1)[1].split('diff --git ', 1)[0]
        code = '\n'.join(line[1:] for line in section.splitlines()
                         if line.startswith((' ', '+')) and not line.startswith('+++'))
        start = code.index('#ifdef WITH_APPLE_CROSSPLATFORM')
        end = code.index('#endif', start) + len('#endif')
        guard = code[start:end]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r"""
#define WITH_APPLE_CROSSPLATFORM
#include <cassert>
constexpr int WM_EVENT_IS_POINTER_CANCEL = 64;
constexpr int WM_EVENT_IS_DIRECT_TOOL = 128;
constexpr int TRANS_CANCEL = 2, OPERATOR_CANCELLED = 4, OPERATOR_FINISHED = 8;
struct Context {};
struct Event { int flag; };
struct Transform { int state = 0; int original = 4; int value = 7; };
struct Operator { int cleanups = 0; };
void transformEnd(Context *, Transform *t) {
  if (t->state == TRANS_CANCEL) { t->value = t->original; }
}
void transformops_exit(Context *, Operator *op) { ++op->cleanups; }
int modal(Context *C, Operator *op, const Event *event, Transform *t) {
GUARD
  // The normal release-confirm branch must not run after UIKit interruption.
  ++op->cleanups;
  return OPERATOR_FINISHED;
}
int main() {
  Context C;
  for (int flag : {0, WM_EVENT_IS_DIRECT_TOOL, WM_EVENT_IS_POINTER_CANCEL,
                   WM_EVENT_IS_POINTER_CANCEL | WM_EVENT_IS_DIRECT_TOOL}) {
    Transform t;
    Operator op;
    Event event{flag};
    const int result = modal(&C, &op, &event, &t);
    const bool interrupted = flag & WM_EVENT_IS_POINTER_CANCEL;
    assert(result == (interrupted ? OPERATOR_CANCELLED : OPERATOR_FINISHED));
    assert(t.value == (interrupted ? 4 : 7));
    assert(op.cleanups == 1);
  }
}
""".replace('GUARD', guard).replace('#include <cassert>', '#include <cassert>\n#include <initializer_list>'))


    def test_hover_and_tablet_samples_respect_drag_owner(self):
        patch = (Path(__file__).resolve().parents[1] / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        section = patch.split('diff --git a/intern/ghost/intern/GHOST_WindowIOS.mm ', 1)[1].split('diff --git ', 1)[0]
        code = '\n'.join(line[1:] for line in section.splitlines()
                         if line.startswith((' ', '+')) and not line.startswith('+++'))
        start = code.index('  if (pointer_capture.active() || current_pencil_touch ||')
        end = code.index('\n  }', start) + len('\n  }')
        guard = code[start:end].replace('[pan_gesture_recognizer pencilTouch]', 'recognizer_pencil')
        # The guard precedes every hover phase branch, including hover end.
        self.assertLess(end, code.index('  if (sender.state == UIGestureRecognizerStateBegan', end))
        start = code.index('    const GHOST_TabletData event_tablet =')
        end = code.index(';', start) + 1
        snapshot = code[start:end]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r"""
#include <cassert>
struct Capture { bool captured; bool active() const { return captured; } };
int hover(Capture pointer_capture, bool current_pencil_touch, bool recognizer_pencil) {
GUARD
  return 1;
}
using GHOST_TabletData = int;
constexpr int GHOST_TABLET_DATA_NONE = 0;
struct Event { bool pencil_used; };
int sample(Event event_info, int tablet_data) {
SNAPSHOT
  return event_tablet;
}
int main() {
  for (bool captured : {false, true}) {
    for (bool pencil : {false, true}) {
      for (bool recognizer : {false, true}) {
        assert(hover({captured}, pencil, recognizer) == !(captured || pencil || recognizer));
      }
    }
  }
  for (int hover_tablet : {0, 1, 2, 3}) {
    assert(sample({false}, hover_tablet) == GHOST_TABLET_DATA_NONE);
    assert(sample({true}, hover_tablet) == hover_tablet);
  }
}
""".replace('GUARD', guard.replace('return;', 'return 0;')).replace('SNAPSHOT', snapshot).replace('#include <cassert>', '#include <cassert>\n#include <initializer_list>'))
if __name__ == '__main__':
    unittest.main()
