"""Execute shipped contextual-ring geometry, ownership receipts and close policy."""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile
import unittest
from test_tool_ring import ring_source

TEST = r'''
#include "interface_ipad_tool_ring.hh"
#include <cassert>
#include <iostream>
using namespace blender::ui::ipad;
bool overlap(const Rect &a, const Rect &b) {
  return a.xmin < b.xmax && b.xmin < a.xmax && a.ymin < b.ymax && b.ymin < a.ymax;
}
int main() {
  int placements = 0;
  for (float unit : {20.f, 40.f}) {
    for (Rect view : {Rect{0,1024,0,768}, Rect{72,690,155,950},
                      Rect{420,760,390,730}, Rect{120,310,90,600}}) {
      view = {view.xmin * unit/20, view.xmax * unit/20,
              view.ymin * unit/20, view.ymax * unit/20};
      for (float x : {view.xmin - 200, view.xmin, (view.xmin + view.xmax)/2, view.xmax, view.xmax + 200}) {
        for (float y : {view.ymin - 200, view.ymin, (view.ymin + view.ymax)/2, view.ymax, view.ymax + 200}) {
          auto ring = tool_ring_layout(unit, view, x, y, true);
          assert(ring.fits && !ring.needs_scroll);
          for (size_t i = 0; i < 9; ++i) {
            auto &a = ring.buttons[i];
            assert(a.xmin >= view.xmin && a.xmax <= view.xmax);
            assert(a.ymin >= view.ymin && a.ymax <= view.ymax);
            assert(a.xmax-a.xmin >= 4.399f*unit && a.ymax-a.ymin >= 2.199f*unit);
            for (size_t j = i+1; j < 9; ++j) assert(!overlap(a,ring.buttons[j]));
            if (!ring.grid) {
              assert(ring.anchor_x < a.xmin || ring.anchor_x > a.xmax ||
                     ring.anchor_y < a.ymin || ring.anchor_y > a.ymax);
            }
          }
          ++placements;
        }
      }
    }
  }
  assert(!tool_ring_layout(20,{0,60,0,800},0,0,true).fits);
  assert(!tool_ring_layout(20,{0,360,0,80},0,0,true).fits);
  assert(ring_kind("VIEW3D_MT_ipad_tools") == RingKind::Tools);
  assert(ring_kind("VIEW3D_MT_ipad_selection_ring") == RingKind::Selection);
  assert(ring_kind("VIEW3D_MT_ipad_transform_ring") == RingKind::Transform);
  assert(ring_kind("VIEW3D_MT_ipad_transform_ring_extra") == RingKind::None);
  assert(ring_kind("VIEW3D_MT_object") == RingKind::None);
  assert(ring_kind(nullptr) == RingKind::None);
  for (auto kind : {RingKind::Tools, RingKind::Selection, RingKind::Transform}) {
    for (auto action : {"WM_OT_call_menu_pie", "VIEW3D_OT_ipad_transform_numbers", "ED_OT_undo",
                        "ED_OT_redo", "OBJECT_OT_mode_set", "OBJECT_OT_select_all"}) {
      assert(!ring_setting_stays_open(kind,action));
    }
    assert(!ring_setting_stays_open(kind,nullptr));
  }
  assert(ring_setting_stays_open(RingKind::Selection,"VIEW3D_OT_ipad_selection_tool"));
  assert(ring_setting_stays_open(RingKind::Selection,"MESH_OT_select_mode"));
  assert(!ring_setting_stays_open(RingKind::Transform,"MESH_OT_select_mode"));
  assert(!ring_setting_stays_open(RingKind::Tools,"VIEW3D_OT_ipad_selection_tool"));
  assert(ring_setting_stays_open(RingKind::Transform,"VIEW3D_OT_ipad_transform_axis"));
  assert(ring_setting_stays_open(RingKind::Transform,"VIEW3D_OT_ipad_transform_option"));
  assert(!ring_setting_stays_open(RingKind::Selection,"VIEW3D_OT_ipad_transform_axis"));
  Rect original{30,800,100,700};
  assert(ring_viewport_matches(original,original));
  for (auto field : {&Rect::xmin,&Rect::xmax,&Rect::ymin,&Rect::ymax}) {
    Rect resized = original;
    ++(resized.*field);
    assert(!ring_viewport_matches(original,resized));
  }
  RingContextIdentity accepted{1,2,3,4,5,6,7,8,9,10};
  assert(ring_context_matches(accepted,accepted));
  for (auto field : {&RingContextIdentity::main, &RingContextIdentity::window,
                     &RingContextIdentity::screen, &RingContextIdentity::area,
                     &RingContextIdentity::region}) {
    auto changed = accepted;
    ++(changed.*field);
    assert(!ring_context_matches(accepted,changed));
  }
  for (auto field : {&RingContextIdentity::screen_uid, &RingContextIdentity::scene_uid,
                     &RingContextIdentity::object_uid, &RingContextIdentity::data_uid}) {
    auto reused_address = accepted;
    ++(reused_address.*field);
    assert(!ring_context_matches(accepted,reused_address));
  }
  auto changed_mode = accepted;
  ++changed_mode.mode;
  assert(!ring_context_matches(accepted,changed_mode));
  std::cout << "PASS: " << placements << " bounded touch-sized placements, explicit routes, setting-only persistence, changed-context receipts\n";
}
'''

class ContextRingTests(unittest.TestCase):
    def test_geometry_context_lifetime_and_terminal_actions(self):
        compiler = shutil.which('clang++') or shutil.which('g++') or shutil.which('c++')
        if not compiler and os.name == 'nt':
            candidate = Path('C:/Program Files/LLVM/bin/clang++.exe')
            if candidate.exists():
                compiler = str(candidate)
        self.assertIsNotNone(compiler, 'A host C++ compiler is required')
        with tempfile.TemporaryDirectory(prefix='ipad-context-ring-') as directory:
            work = Path(directory)
            (work / 'interface_ipad_tool_ring.hh').write_text(ring_source(),encoding='utf-8')
            (work / 'test.cc').write_text(TEST,encoding='utf-8')
            binary = work / ('test.exe' if os.name == 'nt' else 'test')
            subprocess.run([compiler,'-std=c++17','-Wall','-Wextra','-Werror',str(work/'test.cc'),'-o',str(binary)],check=True)
            subprocess.run([str(binary)],check=True)

if __name__ == '__main__':
    unittest.main()
