"""Exercise the shipped modal callbacks with simulated Blender context transitions."""
from pathlib import Path
import unittest

import test_ipad_panels


class ResizeLifetimeTests(unittest.TestCase):
    def test_modal_owner_and_cancellation(self):
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        path = 'source/blender/editors/screen/screen_ipad_panels.cc'
        section = patch.split(f'diff --git a/{path} b/{path}\n', 1)[1].split('diff --git ', 1)[0]
        source = ''.join(line[1:] for line in section.splitlines(True)
                         if line.startswith('+') and not line.startswith('+++'))
        callbacks = source.split('struct ResizeData {', 1)[1].split('}  // namespace', 1)[0]
        callbacks = ('struct ResizeData {' + callbacks).split('struct SeamDragData {', 1)[0]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(PREFIX + callbacks + CASES)


PREFIX = r'''
#include "ipad_workspace_panels.hh"
#include <cassert>
#include <iostream>
namespace policy = blender::ed::ipad::panels;
using policy::Edge;
struct bScreen {
  bScreen *next = nullptr;
  struct { unsigned int session_uid; } id{1};
  float ipad_panel_size[2]{0, 0};
  float ipad_panel_extent[2]{0, 0};
  bool do_refresh = false, do_draw = false, enabled = true, panel_open = true;
};
struct ListBase { bScreen *first; };
struct Main { ListBase screens; };
#define LISTBASE_FOREACH(type, name, list) for (type name = (list)->first; name; name = name->next)
struct wmWindow {policy::Rect bounds{0,0,1200,900};};
struct bContext { Main *main; bScreen *screen; wmWindow *window; };
struct wmOperator { void *customdata = nullptr; int *ptr; };
struct wmEvent { int type; int val; int xy[2]; int flag = 0; };
using wmOperatorStatus = int;
enum { OPERATOR_CANCELLED, OPERATOR_RUNNING_MODAL, OPERATOR_FINISHED,
       EVT_ESCKEY, RIGHTMOUSE, WINDEACTIVATE, LEFTMOUSE, KM_RELEASE,
       MOUSEMOVE, INBETWEEN_MOUSEMOVE };
template<class T, class... A> bool ELEM(T v, A... a) { return ((v == a) || ...); }
template<class T> T *MEM_new(const char *, const T &value) { return new T(value); }
template<class T> void MEM_delete(T *value) { delete value; }
constexpr int WM_EVENT_IS_POINTER_CANCEL = 1 << 6;
constexpr float UI_SCALE_FAC = 2;
Main *CTX_data_main(bContext *C) { return C->main; }
bScreen *CTX_wm_screen(bContext *C) { return C->screen; }
wmWindow *CTX_wm_window(bContext *C) { return C->window; }
bool ED_ipad_panels_enabled(bScreen *s) { return s && s->enabled; }
int RNA_int_get(int *p, const char *) { return *p; }
void WM_event_add_modal_handler(bContext *, wmOperator *) {}
int refreshes = 0;
void tag_layout(bContext *, wmWindow *) { ++refreshes; }
struct Model {
  void *main;
  policy::State state;
  policy::Layout layout;
  policy::Rect bounds{0,0,1200,900};
  policy::Metrics metrics;
};
Model make_model(bContext *C, wmWindow *win) {
  Model m{};
  m.main = C->screen;
  m.bounds = win->bounds;
  if (C->screen->panel_open) {
    m.state.side.active_id = 1;
    m.state.bottom.active_id = 2;
  }
  m.state.side_width = int(C->screen->ipad_panel_size[0] * UI_SCALE_FAC);
  m.state.bottom_height = int(C->screen->ipad_panel_size[1] * UI_SCALE_FAC);
  m.state.side_height = int(C->screen->ipad_panel_extent[0] * UI_SCALE_FAC);
  m.state.bottom_width = int(C->screen->ipad_panel_extent[1] * UI_SCALE_FAC);
  m.layout = policy::layout(m.bounds, m.state, m.metrics);
  return m;
}
'''

CASES = r'''
int main() {
  bScreen a, b;
  b.id.session_uid = 2;
  a.next = &b;
  Main main{{&a}};
  wmWindow window, other_window;
  bContext C{&main, &a, &window};
  int axis = 0;
  wmOperator op{nullptr, &axis};
  wmEvent begin{LEFTMOUSE, 0, {600, 300}};
  wmEvent move{MOUSEMOVE, 0, {650, 350}};
  wmEvent release{LEFTMOUSE, KM_RELEASE, {650, 350}};
  wmEvent escape{EVT_ESCKEY, 0, {0, 0}};
  auto start = [&]() {
    C = {&main, &a, &window}; a.enabled = a.panel_open = true;
    assert(resize_invoke(&C, &op, &begin) == OPERATOR_RUNNING_MODAL);
    assert(op.customdata);
    assert(resize_modal(&C, &op, &move) == OPERATOR_RUNNING_MODAL);
  };
  // Exact UI-unit deltas at scale 2, away from all clamps; preserve the other panel.
  for (int mode : {2,3}) {
    axis=mode;window.bounds={0,0,2400,1800};
    a.ipad_panel_size[0]=400;a.ipad_panel_size[1]=200;
    a.ipad_panel_extent[0]=500;a.ipad_panel_extent[1]=400;
    assert(resize_invoke(&C,&op,&begin)==OPERATOR_RUNNING_MODAL);
    assert(resize_modal(&C,&op,&move)==OPERATOR_RUNNING_MODAL);
    assert(a.ipad_panel_size[0]==(mode==2?375:400));
    assert(a.ipad_panel_size[1]==(mode==3?225:200));
    assert(a.ipad_panel_extent[0]==(mode==2?475:500));
    assert(a.ipad_panel_extent[1]==(mode==3?425:400));
    wmEvent reverse{MOUSEMOVE,0,{550,250}};
    assert(resize_modal(&C,&op,&reverse)==OPERATOR_RUNNING_MODAL);
    assert(a.ipad_panel_size[0]==(mode==2?425:400));
    assert(a.ipad_panel_size[1]==(mode==3?175:200));
    assert(a.ipad_panel_extent[0]==(mode==2?525:500));
    assert(a.ipad_panel_extent[1]==(mode==3?375:400));
    assert(resize_modal(&C,&op,&escape)==OPERATOR_CANCELLED);
    assert(a.ipad_panel_size[0]==400 && a.ipad_panel_size[1]==200);
    assert(a.ipad_panel_extent[0]==500 && a.ipad_panel_extent[1]==400);
  }
  window.bounds={0,0,1200,900};
  for (axis = 0; axis != 4; ++axis) {
    a.ipad_panel_size[axis % 2] = 0;
    a.ipad_panel_extent[axis % 2] = 0;
    start();
    assert(a.ipad_panel_size[axis % 2] > 0);
    assert((a.ipad_panel_extent[axis % 2] > 0) == (axis >= 2));
    assert(resize_modal(&C, &op, &escape) == OPERATOR_CANCELLED);
    assert(a.ipad_panel_size[axis % 2] == 0 && !op.customdata);
    assert(a.ipad_panel_extent[axis % 2] == 0);
    // A workspace switch must restore A and leave B's preference untouched.
    a.ipad_panel_size[axis % 2] = 123;
    b.ipad_panel_size[axis % 2] = 287;
    a.ipad_panel_extent[axis % 2] = 219; b.ipad_panel_extent[axis % 2] = 331;
    start();
    C.screen = &b;
    int before_refresh = refreshes;
    assert(resize_modal(&C, &op, &release) == OPERATOR_CANCELLED);
    assert(a.ipad_panel_size[axis % 2] == 123 && b.ipad_panel_size[axis % 2] == 287);
    assert(a.do_refresh && a.do_draw && refreshes == before_refresh);
    assert(a.ipad_panel_extent[axis % 2] == 219 && b.ipad_panel_extent[axis % 2] == 331);
    // Removed owner: no dereference or restore into the surviving screen.
    start();
    main.screens.first = &b; C.screen = &b;
    assert(resize_modal(&C, &op, &move) == OPERATOR_CANCELLED);
    assert(b.ipad_panel_size[axis % 2] == 287 && !op.customdata);
    main.screens.first = &a;
    // Same address reused by a new screen must not match the captured session UID.
    start();
    a.id.session_uid = 3; a.ipad_panel_size[axis % 2] = 311;
    assert(resize_modal(&C, &op, &move) == OPERATOR_CANCELLED);
    assert(a.ipad_panel_size[axis % 2] == 311);
    a.id.session_uid = 1;
    // Rotation/window resizing invalidates the pointer-to-size mapping before release.
    float prior_size=a.ipad_panel_size[axis % 2], prior_extent=a.ipad_panel_extent[axis % 2];
    start(); window.bounds.xmax=900;
    assert(resize_modal(&C,&op,&release)==OPERATOR_CANCELLED);
    assert(a.ipad_panel_size[axis % 2]==prior_size && a.ipad_panel_extent[axis % 2]==prior_extent);
    window.bounds.xmax=1200;
    start(); C.window = &other_window;
    assert(resize_modal(&C, &op, &move) == OPERATOR_CANCELLED);
    start(); a.enabled = false;
    assert(resize_modal(&C, &op, &release) == OPERATOR_CANCELLED);
    start(); a.panel_open = false;
    assert(resize_modal(&C, &op, &move) == OPERATOR_CANCELLED);
    start();
    float committed = a.ipad_panel_size[axis % 2];
    float committed_extent = a.ipad_panel_extent[axis % 2];
    assert(resize_modal(&C, &op, &release) == OPERATOR_FINISHED);
    assert(a.ipad_panel_size[axis % 2] == committed && !op.customdata);
    assert(a.ipad_panel_extent[axis % 2] == committed_extent);
    assert(resize_modal(&C, &op, &move) == OPERATOR_CANCELLED);
    for (int event_type : {RIGHTMOUSE, WINDEACTIVATE}) {
      float original = a.ipad_panel_size[axis % 2];
      start();
      wmEvent cancel_event{event_type, 0, {0, 0}};
      assert(resize_modal(&C, &op, &cancel_event) == OPERATOR_CANCELLED);
      assert(a.ipad_panel_size[axis % 2] == original && !op.customdata);
    }
    float original = a.ipad_panel_size[axis % 2];
    start(); C.screen = nullptr; C.window = nullptr;
    resize_cancel(&C, &op);
    assert(a.ipad_panel_size[axis % 2] == original && !op.customdata);
    resize_cancel(&C, &op);
    original = a.ipad_panel_size[axis % 2];
    start();
    wmEvent interrupted = release;
    interrupted.flag = WM_EVENT_IS_POINTER_CANCEL;
    assert(resize_modal(&C, &op, &interrupted) == OPERATOR_CANCELLED);
    assert(a.ipad_panel_size[axis % 2] == original && !op.customdata);
    start(); C.main = nullptr; C.screen = nullptr; C.window = nullptr;
    resize_cancel(&C, &op);
    assert(!op.customdata);
  }
  C = {&main, &a, &window};
  axis = 4;
  assert(resize_invoke(&C, &op, &begin) == OPERATOR_CANCELLED);
  axis = 0; a.panel_open = false;
  assert(resize_invoke(&C, &op, &begin) == OPERATOR_CANCELLED);
  std::cout << "Panel modal lifecycle: both axes, context changes, owner removal, "
               "UID reuse, cancellation and confirmation passed\n";
}
'''

