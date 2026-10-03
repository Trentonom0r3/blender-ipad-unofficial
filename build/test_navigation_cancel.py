"""Compile shipped navigation classification/dispatch; model its native apply contract."""
import unittest
import test_ipad_panels
from test_touch_extrude import changed_source


def function(source, signature):
    start = source.index(signature)
    opening = source.index('{', start)
    depth = 0
    for i in range(opening, len(source)):
        depth += (source[i] == '{') - (source[i] == '}')
        if not depth:
            return source[start:i + 1]
    raise AssertionError('Incomplete shipped function')


class NavigationCancelTests(unittest.TestCase):
    def test_interruption_precedes_confirm_switch_and_axis_snap(self):
        source = changed_source('source/blender/editors/space_view3d/view3d_navigate.cc')
        shipped = '\n'.join(function(source, signature) for signature in (
            'static eV3D_OpEvent view3d_navigate_event(',
            'wmOperatorStatus view3d_navigate_modal_fn(',
            'void view3d_navigate_cancel_fn('))
        harness = r'''
#include <cassert>
#include <initializer_list>
using wmOperatorStatus = int;
enum eV3D_OpEvent { VIEW_PASS, VIEW_APPLY, VIEW_CONFIRM, VIEW_CANCEL };
enum { VIEW_MODAL_CANCEL, VIEW_MODAL_CONFIRM, VIEWROT_MODAL_AXIS_SNAP_ENABLE,
       VIEWROT_MODAL_AXIS_SNAP_DISABLE, VIEWROT_MODAL_SWITCH_ZOOM,
       VIEWROT_MODAL_SWITCH_MOVE, VIEWROT_MODAL_SWITCH_ROTATE };
enum { EVT_MODAL_MAP = 10, TIMER, MOUSEMOVE, LEFTMOUSE, EVT_ESCKEY, OTHER };
enum { KM_RELEASE = 1, KM_PRESS = 2, WM_EVENT_IS_POINTER_CANCEL = 64 };
enum { OPERATOR_RUNNING_MODAL = 1, OPERATOR_FINISHED = 2, OPERATOR_CANCELLED = 4 };
struct bContext { int frees = 0, restores = 0, keys = 0, undos = 0;
                  int ends = 0, timer_removes = 0, invokes = 0, type_sets = 0; };
struct View3D {};
struct RegionView3D { int persp = 4; };
struct wmTimer {};
struct wmEvent { int type, val, flag = 0; void *customdata = nullptr; int xy[2]{}; };
struct PointerRNA {};
struct ViewOpsData;
struct ViewOpsType { const char *idname;
  wmOperatorStatus (*apply_fn)(bContext *, ViewOpsData *, eV3D_OpEvent, const int *); };
struct wmOperatorType { const char *name; };
struct wmOperator { void *customdata; wmOperatorType *type; PointerRNA *ptr = nullptr; };
struct ViewOpsData {
  const ViewOpsType *nav_type;
  struct { int event_type = LEFTMOUSE; int persp_with_auto_persp_applied = 5; } init;
  RegionView3D *rv3d; View3D *v3d; wmTimer *timer = nullptr; bool axis_snap = true;
  void end_navigation(bContext *C) {
    ++C->ends;
    if (timer) { ++C->timer_removes; timer = nullptr; }
  }
};
// Model only the existing native apply/cleanup contract. No geometry proof.
wmOperatorStatus apply(bContext *C, ViewOpsData *, eV3D_OpEvent code, const int *) {
  if (code == VIEW_CANCEL) { ++C->restores; return OPERATOR_CANCELLED; }
  if (code == VIEW_CONFIRM) { ++C->keys; return OPERATOR_FINISHED; }
  return OPERATOR_RUNNING_MODAL;
}
const ViewOpsType ViewOpsType_zoom{"zoom", apply}, ViewOpsType_move{"move", apply},
                  ViewOpsType_rotate{"rotate", apply};
wmOperatorType operator_type{"Navigation"};
bContext *current_context;
wmOperatorType *WM_operatortype_find(const char *, bool) { return &operator_type; }
void WM_operator_type_set(wmOperator *op, wmOperatorType *type) {
  op->type = type; ++current_context->type_sets;
}
wmOperatorStatus view3d_navigation_invoke_generic(bContext *C, ViewOpsData *, const wmEvent *,
    PointerRNA *, const ViewOpsType *, const float *) {
  ++C->invokes; return OPERATOR_RUNNING_MODAL;
}
void ED_view3d_camera_lock_undo_push(const char *, View3D *, RegionView3D *, bContext *C) {
  ++C->undos;
}
void viewops_data_free(bContext *C, ViewOpsData *vod) {
  vod->end_navigation(C); ++C->frees;
}
SHIPPED
int main() {
  View3D view;
  for (const ViewOpsType *nav : {&ViewOpsType_move, &ViewOpsType_rotate, &ViewOpsType_zoom}) {
    for (bool interrupted : {false, true}) {
      bContext C; current_context = &C;
      RegionView3D region; ViewOpsData vod{nav, {}, &region, &view};
      wmOperator op{&vod, &operator_type};
      wmEvent release{LEFTMOUSE, KM_RELEASE, interrupted ? WM_EVENT_IS_POINTER_CANCEL : 0};
      const auto result = view3d_navigate_modal_fn(&C, &op, &release);
#ifdef WITH_APPLE_CROSSPLATFORM
      const bool cancel = interrupted;
#else
      const bool cancel = false;
#endif
      assert(result == (cancel ? OPERATOR_CANCELLED : OPERATOR_FINISHED));
      assert(C.restores == int(cancel) && C.keys == int(!cancel));
      assert(C.undos == int(!cancel) && C.frees == 1 && C.ends == 1);
      assert(!op.customdata && !C.invokes && !C.type_sets);
    }
  }
  for (int value : {VIEW_MODAL_CONFIRM, VIEWROT_MODAL_SWITCH_ZOOM,
                   VIEWROT_MODAL_SWITCH_MOVE, VIEWROT_MODAL_SWITCH_ROTATE,
                   VIEWROT_MODAL_AXIS_SNAP_ENABLE, VIEWROT_MODAL_AXIS_SNAP_DISABLE}) {
    bContext C; current_context = &C;
    RegionView3D region; ViewOpsData vod{&ViewOpsType_move, {}, &region, &view};
    wmOperator op{&vod, &operator_type};
    wmEvent event{EVT_MODAL_MAP, value, WM_EVENT_IS_POINTER_CANCEL};
    assert(op.customdata == &vod);
#ifdef WITH_APPLE_CROSSPLATFORM
    assert(view3d_navigate_modal_fn(&C, &op, &event) == OPERATOR_CANCELLED);
    assert(vod.nav_type == &ViewOpsType_move && vod.axis_snap && region.persp == 4);
    assert(C.restores == 1 && !C.keys && !C.undos && !C.invokes && !C.type_sets);
    assert(C.frees == 1 && !op.customdata);
#else
    assert(view3d_navigate_event(&vod, &event) != VIEW_CANCEL);
#endif
  }
  {
    bContext C; current_context = &C;
    RegionView3D region; ViewOpsData vod{&ViewOpsType_move, {}, &region, &view};
    wmTimer timer; vod.timer = &timer;
    wmOperator op{&vod, &operator_type};
    wmEvent tick{TIMER, 0, 0, &timer};
    assert(view3d_navigate_modal_fn(&C, &op, &tick) == OPERATOR_RUNNING_MODAL);
    assert(!C.frees && !C.undos && op.customdata == &vod);
    wmEvent escape{EVT_ESCKEY, KM_PRESS};
    assert(view3d_navigate_modal_fn(&C, &op, &escape) == OPERATOR_CANCELLED);
    assert(C.restores == 1 && C.timer_removes == 1 && C.frees == 1);
    assert(!C.keys && !C.undos && !op.customdata);
  }
  {
    bContext C; current_context = &C;
    RegionView3D region; ViewOpsData vod{&ViewOpsType_move, {}, &region, &view};
    wmOperator op{&vod, &operator_type};
    wmEvent switch_zoom{EVT_MODAL_MAP, VIEWROT_MODAL_SWITCH_ZOOM};
    assert(view3d_navigate_modal_fn(&C, &op, &switch_zoom) == OPERATOR_RUNNING_MODAL);
    assert(vod.nav_type == &ViewOpsType_zoom && C.type_sets == 1 && C.ends == 1);
    assert(C.invokes == 1 && !C.frees && !C.undos && op.customdata == &vod);
    wmEvent escape{EVT_ESCKEY, KM_PRESS};
    assert(view3d_navigate_modal_fn(&C, &op, &escape) == OPERATOR_CANCELLED);
    assert(C.restores == 1 && C.frees == 1 && !C.undos && !op.customdata);
  }
  {
    bContext C; current_context = &C;
    RegionView3D region; ViewOpsData vod{&ViewOpsType_move, {}, &region, &view};
    wmOperator op{&vod, &operator_type};
    // Destruction is deliberately non-restoring; old spatial context may be gone.
    view3d_navigate_cancel_fn(&C, &op);
    assert(C.frees == 1 && !op.customdata && !C.restores && !C.undos && !C.keys);
  }
}
'''.replace('SHIPPED', shipped)
        for ios in (False, True):
            with self.subTest(ios=ios):
                define = '#define WITH_APPLE_CROSSPLATFORM\n' if ios else ''
                test_ipad_panels.IPadWorkspacePanelsTests()._run_source(define + harness)


if __name__ == '__main__':
    unittest.main()
