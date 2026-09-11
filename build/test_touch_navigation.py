"""Compile the shipped navigation policy in isolation, without UIKit/GPU claims."""
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest


class TouchNavigationTests(unittest.TestCase):
    def test_shipped_policy_preserves_indirect_and_camera_input(self):
        patch = (Path(__file__).resolve().parents[1] / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        section = patch.split('diff --git a/source/blender/editors/space_view3d/view3d_navigate.cc ', 1)[1].split('diff --git ', 1)[0]
        code = '\n'.join(line[1:] for line in section.splitlines()
                         if line.startswith((' ', '+')) and not line.startswith('+++'))
        start = code.index('  eViewOpsFlag viewops_flag =')
        end = code.index('  constexpr eViewOpsFlag viewops_flag_dynamic_ofs', start)
        policy = code[start:end]
        compiler = shutil.which('clang++') or shutil.which('g++')
        if not compiler and Path('C:/Program Files/LLVM/bin/clang++.exe').exists():
            compiler = 'C:/Program Files/LLVM/bin/clang++.exe'
        self.assertIsNotNone(compiler, 'A C++ compiler is required')
        harness = r'''
#include <cassert>
using eViewOpsFlag = int;
constexpr int VIEWOPS_FLAG_DEPTH_NAVIGATE = 1, VIEWOPS_FLAG_ZOOM_TO_MOUSE = 2;
constexpr int MOUSEZOOM = 10, WM_EVENT_IS_TOUCH_PINCH = 32, RV3D_CAMOB = 2;
struct Event { int type, flag; };
struct Nav { int flag; };
struct Region { int persp; };
int preferences;
int viewops_flag_from_prefs() { return preferences; }
int evaluate(const Event *event, const Nav *nav_type, const Region *rv3d) {
POLICY
  return viewops_flag;
}
int main() {
  const Event direct{MOUSEZOOM, WM_EVENT_IS_TOUCH_PINCH};
  const Event indirect{MOUSEZOOM, 0};
  const Event rotate{11, WM_EVENT_IS_TOUCH_PINCH};
  const Region perspective{0}, ortho{1}, camera{RV3D_CAMOB};
  for (int pref = 0; pref < 8; ++pref) {
    preferences = pref;
    for (int supported = 0; supported < 8; ++supported) {
      const Nav nav{supported};
      const int baseline = pref & supported;
      assert(evaluate(nullptr, &nav, &perspective) == baseline);
      assert(evaluate(&indirect, &nav, &perspective) == baseline);
      assert(evaluate(&rotate, &nav, &perspective) == baseline);
      assert(evaluate(&direct, &nav, &camera) == baseline);
#ifdef WITH_APPLE_CROSSPLATFORM
      const int expected = baseline | (supported & 3);
#else
      const int expected = baseline;
#endif
      assert(evaluate(&direct, &nav, &perspective) == expected);
      assert(evaluate(&direct, &nav, &ortho) == expected);
    }
  }
}
'''.replace('POLICY', policy)
        with tempfile.TemporaryDirectory(prefix='touch-navigation-') as directory:
            source = Path(directory) / 'policy.cc'
            source.write_text(harness, encoding='utf-8')
            for ios in (False, True):
                exe = Path(directory) / ('ios.exe' if ios else 'desktop.exe')
                args = [compiler, '-std=c++17', str(source), '-o', str(exe)]
                if ios:
                    args.append('-DWITH_APPLE_CROSSPLATFORM')
                subprocess.run(args, check=True)
                subprocess.run([str(exe)], check=True)


if __name__ == '__main__':
    unittest.main()
