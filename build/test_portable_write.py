"""Compile the shipped portable writer path scope, including failure restoration."""
from pathlib import Path
import unittest
import test_ipad_panels

class PortableWriteTests(unittest.TestCase):
    def test_all_or_nothing_and_restoration(self):
        patch = (Path(__file__).resolve().parents[1] / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        path = 'source/blender/windowmanager/intern/wm_ipad_portable_write.hh'
        section = patch.split(f'diff --git a/{path} b/{path}\n', 1)[1].split('diff --git ', 1)[0]
        header = ''.join(line[1:] for line in section.splitlines(True)
                         if line.startswith('+') and not line.startswith('+++'))
        header = header.replace('#pragma once\n', '')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(header + CASES)

CASES = r"""
#include <cassert>
#include <iostream>
#include <stdexcept>
#include <type_traits>
using namespace blender::wm::ipad;
static_assert(!std::is_copy_constructible_v<PortablePathScope>);
static_assert(!std::is_move_constructible_v<PortablePathScope>);
int main()
{
  char a[64] = "/original/library.blend";
  char b[64] = "//original/texture.png";
  const std::string old_a = a, old_b = b;
  {
    PortablePathScope scope({{a, sizeof(a), "//Libraries/library.blend"},
                             {b, sizeof(b), "//Assets/texture.png"}});
    assert(scope.apply());
    assert(std::string(a) == "//Libraries/library.blend");
    assert(std::string(b) == "//Assets/texture.png");
    assert(!scope.apply());
    /* A failed writer returns through this same scope. */
  }
  assert(std::string(a) == old_a && std::string(b) == old_b);
  try {
    PortablePathScope scope({{a, sizeof(a), "//Libraries/library.blend"}});
    assert(scope.apply());
    throw std::runtime_error("writer failure");
  }
  catch (const std::runtime_error &) {}
  assert(std::string(a) == old_a);
  {
    PortablePathScope scope({{a, sizeof(a), "//valid"},
                             {b, sizeof(b), std::string(sizeof(b), 'x')}});
    assert(!scope.apply());
    assert(std::string(a) == old_a && std::string(b) == old_b);
  }
  {
    PortablePathScope scope({{a, sizeof(a), "//first"}, {a, sizeof(a), "//alias"}});
    assert(!scope.apply());
    assert(std::string(a) == old_a);
  }
  {
    PortablePathScope scope({{a, sizeof(a), "//first"}, {a + 1, sizeof(a) - 1, "//overlap"}});
    assert(!scope.apply());
    assert(std::string(a) == old_a);
  }
  {
    PortablePathScope scope({{a, sizeof(a), "//first"}, {nullptr, 10, "//invalid"}});
    assert(!scope.apply());
    assert(std::string(a) == old_a);
  }
  {
    char unterminated[8] = {'x','x','x','x','x','x','x','x'};
    PortablePathScope scope({{a, sizeof(a), "//first"}, {unterminated, sizeof(unterminated), "//x"}});
    assert(!scope.apply());
    assert(std::string(a) == old_a && unterminated[0] == 'x');
  }
  {
    PortablePathScope scope({{a, sizeof(a), std::string("//x\0hidden", 10)}});
    assert(!scope.apply());
    assert(std::string(a) == old_a);
  }
  {
    PortablePathScope scope({{a, sizeof(a), "//Libraries/\xc3\xa9.blend"}});
    assert(scope.apply());
    scope.restore();
    scope.restore();
    assert(std::string(a) == old_a);
  }
  {
    PortablePathScope empty({});
    assert(empty.apply());
  }
  std::cout << "PASS: portable path set validation, aliases, UTF-8, writer failure and unconditional restoration\n";
}
"""
