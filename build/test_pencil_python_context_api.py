"""Compile the actual public Python API header used by native RNA.

The core uint typedef is isolated; this is declaration/include evidence, not
Python runtime initialization, GIL ownership, UIKit, or target link execution.
"""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile
import unittest

from test_touch_extrude import changed_source, PIN_ROOT

HEADER = "source/blender/python/BPY_extern.hh"


class PencilPythonContextApiTests(unittest.TestCase):
    def test_actual_public_header_declares_the_existing_context_getter(self):
        candidates = [shutil.which("clang++"), shutil.which("g++")]
        if os.name == "nt":
            candidates += [r"C:\Program Files\LLVM\bin\clang++.exe"]
        compiler = next((str(p) for p in candidates if p and Path(p).is_file()), None)
        if not compiler:
            self.skipTest("C++17 compiler unavailable; public API header not compiled")
        baseline = (PIN_ROOT / HEADER).read_text(encoding="utf-8")
        candidate = changed_source(HEADER)
        self.assertNotIn("BPY_context_get", baseline)
        self.assertIn("bContext *BPY_context_get();", candidate)
        self.assertIn('#  include "BPY_extern.hh"',
                      changed_source("source/blender/makesrna/intern/rna_access.cc"))
        with tempfile.TemporaryDirectory(prefix="ipad-python-context-api-") as directory:
            work = Path(directory)
            (work / "BLI_sys_types.h").write_text("#pragma once\nusing uint = unsigned int;\n")
            test = work / "test.cc"
            test.write_text('''#include <type_traits>
#include "BPY_extern.hh"
using ContextGetter = bContext *(*)();
static_assert(std::is_same_v<decltype(&BPY_context_get), ContextGetter>);
bool saved_context_matches(bContext *saved) { return BPY_context_get() == saved; }
''', encoding="utf-8")
            args = [compiler, "-std=c++17", "-Wall", "-Wextra", "-Werror", "-pedantic",
                    "-fsyntax-only", "-I", str(work), str(test)]
            (work / "BPY_extern.hh").write_text(baseline, encoding="utf-8")
            failed = subprocess.run(args, capture_output=True, text=True)
            self.assertNotEqual(failed.returncode, 0, "Original header must reproduce the missing declaration")
            self.assertIn("BPY_context_get", failed.stderr)
            (work / "BPY_extern.hh").write_text(candidate, encoding="utf-8")
            passed = subprocess.run(args, capture_output=True, text=True)
            self.assertEqual(passed.returncode, 0, passed.stderr)


if __name__ == "__main__":
    unittest.main()
