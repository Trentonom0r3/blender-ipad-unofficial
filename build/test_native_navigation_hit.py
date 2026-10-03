"""Compile the shipped per-window navigation hit snapshot and lifecycle policy."""
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest


class NativeNavigationHitTests(unittest.TestCase):
    def test_window_ownership_replacement_and_destruction(self):
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        name = 'intern/ghost/GHOST_NavigationIOS.hh'
        section = patch.split(f'diff --git a/{name} b/{name}\n', 1)[1].split('diff --git ', 1)[0]
        header = ''.join(line[1:] for line in section.splitlines(True)
                         if line.startswith('+') and not line.startswith('+++'))
        compiler = shutil.which('clang++') or shutil.which('g++')
        if not compiler and Path('C:/Program Files/LLVM/bin/clang++.exe').is_file():
            compiler = 'C:/Program Files/LLVM/bin/clang++.exe'
        self.assertIsNotNone(compiler, 'C++ compiler required for navigation policy')
        with tempfile.TemporaryDirectory(prefix='native-navigation-') as directory:
            root = Path(directory)
            (root / 'GHOST_NavigationIOS.hh').write_text(header, encoding='utf-8')
            (root / 'test.cc').write_text(r'''
#include "GHOST_NavigationIOS.hh"
#include <cassert>
int main() {
  namespace nav = ghost::ios;
  int main_window = 1, auxiliary_window = 2;
  assert(!nav::navigation_hit(&main_window, 70, 110));
  nav::set_navigation_regions(&main_window, {{50,90,90,130}, {150,90,190,130}});
  assert(nav::navigation_hit(&main_window, 70, 110));
  assert(nav::navigation_hit(&main_window, 150, 90));
  assert(!nav::navigation_hit(&main_window, 100, 110));
  assert(!nav::navigation_hit(&auxiliary_window, 70, 110));
  nav::set_navigation_regions(&main_window, {{100,190,140,230}});
  assert(!nav::navigation_hit(&main_window, 70, 110));
  assert(nav::navigation_hit(&main_window, 110, 210));
  nav::set_navigation_regions(&main_window, {});
  assert(!nav::navigation_hit(&main_window, 110, 210));
  nav::set_navigation_regions(&auxiliary_window, {{0,0,40,40}});
  nav::forget_navigation_window(&auxiliary_window);
  assert(!nav::navigation_hit(&auxiliary_window, 20, 20));
  assert(nav::navigation_regions.count(&auxiliary_window) == 0);
  using Kind = nav::PointerCaptureKind;
  nav::set_navigation_regions(&main_window, {{10,20,50,60,Kind::WorkspaceResize},
                                            {80,20,120,60,Kind::Navigation}});
  assert(nav::pointer_capture_hit(&main_window, 10, 20) == Kind::WorkspaceResize);
  assert(nav::pointer_capture_hit(&main_window, 50, 60) == Kind::WorkspaceResize);
  assert(nav::pointer_capture_hit(&main_window, 51, 60) == Kind::None);
  assert(nav::pointer_capture_hit(&main_window, 90, 30) == Kind::Navigation);
  nav::PointerCapture capture;
  for (bool interrupted : {false, true}) {
    capture.begin(nav::pointer_capture_hit(&main_window, 30, 40));
    assert(capture.active() && !capture.ended);
    // Relayout during the drag cannot change its captured semantics.
    nav::set_navigation_regions(&main_window, {});
    auto end = capture.finish(interrupted);
    assert(end.release && end.cancelled == interrupted);
    assert(!capture.active() && capture.ended);
    end = capture.finish(true);
    assert(!end.release && !end.cancelled);
    nav::set_navigation_regions(&main_window, {{10,20,50,60,Kind::WorkspaceResize}});
  }
  nav::PointerCapture::End end{};
  for (bool interrupted : {false, true}) {
    capture.begin(Kind::Navigation);
    end = capture.finish(interrupted);
    assert(end.release && end.cancelled == interrupted);
    assert(capture.ended && !capture.active());
    assert(!capture.finish(interrupted).release); // UIKit's later lift stays inert.
  }
  for (const char *tool : {"builtin.select_box", "builtin.select_lasso", "builtin.move", "builtin.rotate", "builtin.scale", "builtin.transform"}) {
    for (const char *mode : {"OBJECT", "POSE", "EDIT_MESH", "EDIT_CURVE", "EDIT_ARMATURE"}) {
      assert(nav::direct_edit_tool(tool, mode));
    }
    for (const char *mode : {"SCULPT", "PAINT_TEXTURE", "PAINT_VERTEX", "PAINT_WEIGHT", ""}) {
      assert(!nav::direct_edit_tool(tool, mode));
    }
  }
  for (const char *tool : {"builtin.select_circle", "builtin.cursor", "builtin.annotate", "addon.move", ""}) {
    assert(!nav::direct_edit_tool(tool, "OBJECT"));
  }
  assert(!nav::direct_edit_tool(nullptr, "OBJECT"));
  assert(!nav::direct_edit_tool("builtin.move", nullptr));
  // Narrow navigation/resize controls win over the editing canvas beneath them.
  // An explicit None region represents covered UI and blocks that canvas too.
  nav::set_navigation_regions(&main_window, {{10,20,50,60,Kind::Navigation},
                                            {60,20,90,60,Kind::None},
                                            {0,0,300,200,Kind::ToolManipulation}});
  assert(nav::pointer_capture_hit(&main_window, 30, 40) == Kind::Navigation);
  assert(nav::pointer_capture_hit(&main_window, 70, 40) == Kind::None);
  assert(nav::pointer_capture_hit(&main_window, 150, 100) == Kind::ToolManipulation);
  assert(nav::pointer_capture_hit(&main_window, 150, 100, false) == Kind::None);
  assert(nav::pointer_capture_hit(&main_window, 30, 40, false) == Kind::Navigation);
  for (bool interrupted : {false, true}) {
    capture.begin(Kind::ToolManipulation);
    nav::set_navigation_regions(&main_window, {});
    end = capture.finish(interrupted);
    assert(end.release && end.cancelled == interrupted);
    assert(!capture.finish(true).release);
  }
  // Point taps are tagged only in Box/Lasso canvas snapshots, with first-hit
  // occlusion and per-window ownership; transform taps retain their old path.
  nav::set_navigation_regions(&main_window, {{10,20,50,60,Kind::Navigation},
                                            {60,20,90,60,Kind::None},
                                            {0,0,300,200,Kind::ToolManipulation,true}});
  assert(!nav::selection_hit(&main_window, 30, 40));
  assert(!nav::selection_hit(&main_window, 70, 40));
  assert(nav::selection_hit(&main_window, 150, 100));
  assert(!nav::selection_hit(&main_window, 150, 100, false));
  assert(!nav::selection_hit(&auxiliary_window, 150, 100));
  nav::set_navigation_regions(&main_window, {{0,0,300,200,Kind::ToolManipulation}});
  assert(!nav::selection_hit(&main_window, 150, 100));
  nav::TouchAdmission admission;
  admission.interrupt(); // Idle hardware click cannot poison the next touch.
  admission.begin();
  assert(admission.allowed());
  admission.interrupt(); // Pending tap/pan is invalidated before recognition.
  assert(!admission.allowed());
  admission.begin(); // An additional touch does not readmit the old stream.
  assert(!admission.allowed());
  // Hardware-up does not reset the admission; its later lift stays inert.
  assert(admission.active && !admission.allowed());
  admission.reset();
  admission.begin();
  assert(admission.allowed());
  capture.begin(Kind::None);
  assert(!capture.active() && !capture.ended);
  end = capture.finish(true);
  assert(!end.release && !end.cancelled);
}
''', encoding='utf-8')
            binary = root / 'test.exe'
            subprocess.run([compiler, '-std=c++17', '-Wall', '-Wextra', '-Werror',
                            str(root / 'test.cc'), '-o', str(binary)], check=True)
            subprocess.run([str(binary)], check=True)


if __name__ == '__main__':
    unittest.main()
