"""Compile and test the actual portable geometry shipped in the overlay."""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile
import unittest


def ring_source():
    patch = (Path(__file__).resolve().parents[1] / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
    path = 'source/blender/editors/interface/interface_ipad_tool_ring.hh'
    section = patch.split(f'diff --git a/{path} b/{path}\n', 1)[1].split('diff --git ', 1)[0]
    return '\n'.join(line[1:] for line in section.splitlines()
                     if line.startswith('+') and not line.startswith('+++')) + '\n'


TEST = r'''
#include "interface_ipad_tool_ring.hh"
#include <cassert>
#include <iostream>
using namespace blender::ui::ipad;
void check(ToolRingLayout layout, Rect view, bool contained = true) {
  constexpr float eps = .01f;
  assert(layout.buttons.size() == 9);
  for (size_t i = 0; i < layout.buttons.size(); ++i) {
    const Rect &a = layout.buttons[i];
    assert(a.xmax - a.xmin >= 55.9f);
    assert(a.ymax - a.ymin >= 25.9f);
    if (contained) {
      assert(a.xmin >= view.xmin - eps && a.xmax <= view.xmax + eps);
      assert(a.ymin >= view.ymin - eps && a.ymax <= view.ymax + eps);
    }
    for (size_t j = i + 1; j < layout.buttons.size(); ++j) {
      const Rect &b = layout.buttons[j];
      assert(std::min(a.xmax,b.xmax) - std::max(a.xmin,b.xmin) <= eps ||
             std::min(a.ymax,b.ymax) - std::max(a.ymin,b.ymin) <= eps);
    }
  }
}
int main() {
  for (Rect view : {Rect{0,1024,0,768}, Rect{0,768,0,1024}, Rect{200,1100,100,900}}) {
    for (float x : {-1000.f, 0.f, 250.f, 512.f, 1200.f}) {
      for (float y : {-1000.f, 0.f, 350.f, 768.f, 1500.f}) {
        auto layout = tool_ring_layout(20, view, x, y);
        assert(!layout.grid && !layout.needs_scroll);
        check(layout, view);
      }
    }
  }
  Rect view{0,1024,0,768};
  auto ring = tool_ring_layout(20,view,512,384);
  // Verify empty center: center coordinate (512, 384) is not occupied by any button.
  for (size_t i = 0; i < 9; ++i) {
    assert(512 < ring.buttons[i].xmin || 512 > ring.buttons[i].xmax ||
           384 < ring.buttons[i].ymin || 384 > ring.buttons[i].ymax);
  }
  assert(ring.buttons[0].ymin > 384); // Select north.
  assert(ring.buttons[1].xmin > 512); // Clockwise Cursor NE.
  assert(ring.buttons[8].xmax < 512); // Add Cube NW.
  for (Rect narrow : {Rect{0,200,0,700}, Rect{0,800,0,180}}) {
    auto grid = tool_ring_layout(20,narrow,0,0);
    assert(grid.grid && !grid.needs_scroll);
    check(grid,narrow);
  }
  auto short_grid = tool_ring_layout(20,{0,360,0,80},0,0);
  assert(short_grid.grid && short_grid.needs_scroll);
  check(short_grid,{0,360,0,80},false);
  auto scaled = tool_ring_layout(40,{0,2048,0,1536},1024,768);
  for (size_t i=0;i<9;++i) {
    assert(std::abs(scaled.buttons[i].xmin - ring.buttons[i].xmin * 2) < .01f);
    assert(std::abs(scaled.buttons[i].ymin - ring.buttons[i].ymin * 2) < .01f);
  }
  std::cout << "PASS: 75 edge placements, ring order, empty center, scaling, no overlaps, narrow fallback\n";
}
'''


class ToolRingTests(unittest.TestCase):
    def test_shipped_cpp_geometry(self):
        compiler = shutil.which('clang++') or shutil.which('g++') or shutil.which('c++')
        if not compiler and os.name == 'nt':
            candidate = Path('C:/Program Files/LLVM/bin/clang++.exe')
            if candidate.exists():
                compiler = str(candidate)
        self.assertIsNotNone(compiler, 'A host C++ compiler is required for ring geometry tests')
        with tempfile.TemporaryDirectory(prefix='ipad-tool-ring-') as directory:
            work = Path(directory)
            (work / 'interface_ipad_tool_ring.hh').write_text(ring_source(), encoding='utf-8')
            (work / 'test.cc').write_text(TEST, encoding='utf-8')
            binary = work / ('test.exe' if os.name == 'nt' else 'test')
            subprocess.run([compiler, '-std=c++17', '-Wall', '-Wextra', '-Werror',
                            str(work / 'test.cc'), '-o', str(binary)], check=True)
            subprocess.run([str(binary)], check=True)


if __name__ == '__main__':
    unittest.main()
