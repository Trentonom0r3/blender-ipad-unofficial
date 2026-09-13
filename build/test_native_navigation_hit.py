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
}
''', encoding='utf-8')
            binary = root / 'test.exe'
            subprocess.run([compiler, '-std=c++17', '-Wall', '-Wextra', '-Werror',
                            str(root / 'test.cc'), '-o', str(binary)], check=True)
            subprocess.run([str(binary)], check=True)


if __name__ == '__main__':
    unittest.main()
