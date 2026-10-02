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


if __name__ == '__main__':
    unittest.main()
