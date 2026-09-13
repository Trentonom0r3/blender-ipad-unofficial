"""Compile behavior tests against the exact workspace policy shipped in the overlay."""
from pathlib import Path
import os
import json
import re
import shutil
import subprocess
import tempfile
import unittest


class IPadWorkspacePanelsTests(unittest.TestCase):
    def _run_source(self, test_source):
        candidates = [shutil.which('clang++'), shutil.which('g++')]
        if os.name == 'nt':
            candidates += [r'C:\Program Files\LLVM\bin\clang++.exe',
                           r'C:\Program Files\Microsoft Visual Studio\2022\Preview\VC\Tools\Llvm\x64\bin\clang++.exe',
                           r'C:\Program Files\Microsoft Visual Studio\18\Insiders\VC\Tools\Llvm\x64\bin\clang++.exe']
        compiler = next((str(p) for p in candidates if p and Path(p).is_file()), None)
        if not compiler:
            self.skipTest('C++17 compiler unavailable; workspace behavior tests were not run')
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        path = 'source/blender/editors/screen/ipad_workspace_panels.hh'
        marker = f'diff --git a/{path} b/{path}\n'
        self.assertIn(marker, patch)
        section = patch.split(marker, 1)[1].split('diff --git ', 1)[0]
        self.assertIn('--- /dev/null\n', section)
        header = ''.join(line[1:] for line in section.splitlines(True)
                         if line.startswith('+') and not line.startswith('+++'))
        with tempfile.TemporaryDirectory(prefix='ipad-workspace-test-') as directory:
            work = Path(directory)
            (work / 'ipad_workspace_panels.hh').write_text(header, encoding='utf-8')
            test = work / 'test.cc'
            test.write_text(test_source, encoding='utf-8')
            binary = work / ('tests.exe' if os.name == 'nt' else 'tests')
            subprocess.run([compiler, '-std=c++17', '-Wall', '-Wextra', '-Werror', '-pedantic',
                            str(test), '-o', str(binary)], cwd=work, check=True)
            subprocess.run([str(binary)], cwd=work, check=True)

    def test_workspace_placement_locking_resize_and_overflow(self):
        repo = Path(__file__).resolve().parents[1]
        self._run_source((repo / 'build/tests/ipad_workspace_panels_test.cc').read_text(encoding='utf-8'))

    def test_shipped_workspace_layouts(self):
        repo = Path(__file__).resolve().parents[1]
        fixture = json.loads((repo / 'build/tests/ipad_workspace_layouts.json').read_text(encoding='utf-8'))
        workflow = (repo / '.github/workflows/build-ipa.yml').read_text(encoding='utf-8')
        pinned = re.search(r'BLENDER_COMMIT: ([0-9a-f]{40})', workflow).group(1)
        self.assertEqual(fixture['source_commit'], pinned, 'Re-audit layouts when upstream changes')
        self.assertEqual(len(fixture['cases']), 33)
        calls = []
        for case in fixture['cases']:
            areas = ','.join('{%d,{%s},p::Role::%s}' % (
                a['id'], ','.join(map(str, a['rect'])), a['role']) for a in case['areas'])
            calls.append('verify({%s},%d,{%s},{%s},%s);' % (
                areas, case['primary'], ','.join(map(str, case['bottom'])), ','.join(map(str, case['working'])), json.dumps(case['name'])))
        self._run_source(r'''
#include "ipad_workspace_panels.hh"
#include <iostream>
#include <set>
#include <stdexcept>
#include <string>
namespace p = blender::ed::ipad::panels;
static int cases = 0;
static void verify(std::vector<p::Area> original, int primary,
                   std::set<int> bottom, std::set<int> working, const char *name)
{
  for (int sx : {1, 2}) {
    for (int sy : {1, 3}) {
      auto areas = original;
      for (auto &a : areas) {
        a.original = {a.original.xmin * sx - 137, a.original.ymin * sy + 63,
                      a.original.xmax * sx - 137, a.original.ymax * sy + 63};
      }
      const auto mapping = p::classify(areas, 3);
      std::set<int> ids, actual_bottom, actual_working;
      for (const auto &area : mapping.working) {
        if (!ids.insert(area.id).second) {
          throw std::runtime_error(std::string(name) + ": duplicate working editor");
        }
        actual_working.insert(area.id);
      }
      if (actual_working != working) {
        throw std::runtime_error(std::string(name) + ": working split lost or misclassified");
      }
      for (const p::Rect bounds : {p::Rect{17,29,1041,797}, p::Rect{0,0,768,1024}, p::Rect{0,0,320,480}}) {
        const auto placed = p::working_layout(mapping.working, bounds);
        if (placed.size() != working.size()) {
          throw std::runtime_error(std::string(name) + ": working editor dropped during layout");
        }
        for (size_t i = 0; i < placed.size(); ++i) {
          const auto a = placed[i].original;
          if (a.empty() || a.xmin < bounds.xmin || a.ymin < bounds.ymin ||
              a.xmax > bounds.xmax || a.ymax > bounds.ymax) {
            throw std::runtime_error(std::string(name) + ": working editor outside bounds");
          }
          for (size_t j = i + 1; j < placed.size(); ++j) {
            const auto b = placed[j].original;
            if (a.xmin < b.xmax && b.xmin < a.xmax && a.ymin < b.ymax && b.ymin < a.ymax) {
              throw std::runtime_error(std::string(name) + ": overlapping working editors");
            }
          }
        }
      }
      for (const auto &panel : mapping.panels) {
        if (!ids.insert(panel.id).second) {
          throw std::runtime_error(std::string(name) + ": duplicate editor");
        }
        if (panel.edge == p::Edge::Bottom) {
          actual_bottom.insert(panel.id);
        }
      }
      if (mapping.primary_id != primary || actual_bottom != bottom || ids.size() != areas.size()) {
        throw std::runtime_error(std::string(name) + ": incorrect main editor or edge placement");
      }
      ++cases;
    }
  }
}
int main() { try {
''' + '\n'.join(calls) + r'''
  std::cout << "PASS: " << cases << " shipped-layout placement/scaling cases\n";
  return 0;
} catch (const std::exception &error) {
  std::cerr << error.what() << "\n";
  return 1;
}
}
''')


if __name__ == '__main__':
    unittest.main()
