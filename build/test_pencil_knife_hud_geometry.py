"""Execute current Knife HUD fit/selection and finished-button readiness policy.

Run with --repo PATH [--cache-dir PATH] [--source-root PATH] [--output-dir PATH].
Normal runs reconstruct the complete candidate overlay from its explicit pin.
The source-root option permits isolated pre-integration source. Production
functions are always extracted from those actual files, never corrected here.
The 67 controls retain modeled original-owner/font/matrix/allocator boundaries;
stock native widget observations and target device behavior are separate.
"""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import os
import shutil
import subprocess
import sys
import tempfile
import unittest


parser = argparse.ArgumentParser(add_help=False)
parser.add_argument('--repo', type=Path, default=Path(__file__).resolve().parents[1])
parser.add_argument('--cache-dir', type=Path)
parser.add_argument('--source-root', type=Path)
parser.add_argument('--output-dir', type=Path)
OPTIONS, UNITTEST_ARGS = parser.parse_known_args()
REPO = OPTIONS.repo.resolve()
FIXTURES = Path(__file__).resolve().parent / 'tests'
OUT = OPTIONS.output_dir.resolve() if OPTIONS.output_dir else Path(
    tempfile.mkdtemp(prefix='pencil-knife-geometry-'))
OUT.mkdir(parents=True, exist_ok=True)
sys.path.insert(0, str(REPO / 'build'))


def load_helper(name):
    spec = importlib.util.spec_from_file_location(name, REPO / 'build' / (name + '.py'))
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


preflight = load_helper('preflight')
touch = load_helper('test_touch_extrude')
function = load_helper('test_compact_shelf').function
PIN = preflight.pinned_commit(REPO)
CACHE = OPTIONS.cache_dir.resolve() if OPTIONS.cache_dir else REPO / '.cache/preflight'
HUD_PATH = 'source/blender/editors/interface/regions/interface_region_hud.cc'
AREA_PATH = 'source/blender/editors/screen/area.cc'
INPUTS = {path: preflight.get_source(PIN, path, CACHE, False).decode('utf-8')
          for path in (HUD_PATH, AREA_PATH)}
touch.PIN_ROOT = CACHE / PIN
touch.changed_source.cache_clear()


def source(path):
    if OPTIONS.source_root:
        return (OPTIONS.source_root / path).read_text(encoding='utf-8')
    marker = f'diff --git a/{path} b/{path}\n'
    return touch.changed_source(path) if marker in touch.PATCH_TEXT else INPUTS[path]


def between(text, first, end):
    begin = text.index(first)
    return text[begin:text.index(end, begin)]


def digest(text):
    return hashlib.sha256(text.encode()).hexdigest()


HUD = source(HUD_PATH)
AREA = source(AREA_PATH)
SIGNATURES = ('static int ipad_knife_hud_logical_size(',
              'static rcti ipad_knife_hud_bounds(',
              'static bool ipad_knife_hud_fit(',
              'static bool ipad_knife_hud_layout(',
              'bool UI_ipad_knife_hud_geometry_ready(')
FUNCTIONS = '\n'.join(function(HUD, signature) for signature in SIGNATURES)
STORAGE = between(HUD, 'struct HudRegionData {', 'static bool last_redo_poll(')
LAYOUT = between(HUD, 'struct IPadKnifeHUDLayout {', '/* Native FLOAT sizes')
MODELS = (FIXTURES / 'knife_hud_geometry_models.inc.cc').read_text(encoding='utf-8')
CASES = (FIXTURES / 'knife_hud_geometry_cases.inc.cc').read_text(encoding='utf-8')
CPP = MODELS + STORAGE + LAYOUT + FUNCTIONS + CASES


class KnifeHUDGeometryTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        candidates = [shutil.which('clang++'), shutil.which('g++')]
        if os.name == 'nt':
            candidates += [r'C:/Program Files/LLVM/bin/clang++.exe',
                           r'C:/Program Files/Microsoft Visual Studio/18/Insiders/VC/Tools/Llvm/x64/bin/clang++.exe']
        cls.compiler = next((str(p) for p in candidates if p and Path(p).is_file()), None)
        cls.results = []

    @classmethod
    def tearDownClass(cls):
        report = {
            'pin': PIN,
            'source_root': str(OPTIONS.source_root) if OPTIONS.source_root else None,
            'source_hashes': {HUD_PATH: digest(HUD), AREA_PATH: digest(AREA)},
            'function_hashes': {signature: digest(function(HUD, signature))
                                for signature in SIGNATURES},
            'fixture_hashes': {'models': digest(MODELS), 'cases': digest(CASES)},
            'compiler_results': cls.results,
            'boundaries': [
                'Exact current fit, placement-selection and actual-button readiness bodies execute.',
                'Registered original WM owner and font metrics are modeled; no native font rasterizer runs here.',
                'Fresh native lists, Panel/button state and block matrix are instrumentation with retained storage.',
                'Stock native widget visual/hit reports are separate from this source regression.',
                'No target native HUD layout engine, GPU/compositor, WM scheduler, UIKit or device proof.',
            ],
        }
        (OUT / 'geometry-test-report.json').write_bytes((json.dumps(report, indent=2) + '\n').encode())

    def run_native_policy(self, optimization):
        if not self.compiler:
            self.skipTest('C++17 compiler unavailable; native geometry source controls did not run')
        label = optimization[1:]
        cpp = OUT / ('knife-geometry-' + label + '.cc')
        cpp.write_bytes(CPP.encode())
        binary = OUT / ('knife-geometry-' + label + ('.exe' if os.name == 'nt' else ''))
        compiled = subprocess.run([self.compiler, '-std=c++17', optimization, '-Werror',
                                   str(cpp), '-o', str(binary)],
                                  text=True, encoding='utf-8', errors='replace', capture_output=True)
        (OUT / ('compile-' + label + '.log')).write_bytes((compiled.stdout + compiled.stderr).encode())
        self.assertEqual(compiled.returncode, 0, compiled.stdout + compiled.stderr)
        executed = subprocess.run([str(binary)], text=True, encoding='utf-8',
                                  errors='replace', capture_output=True)
        (OUT / ('run-' + label + '.log')).write_bytes((executed.stdout + executed.stderr).encode())
        type(self).results.append({'optimization': optimization,
                                   'compile_returncode': compiled.returncode,
                                   'execution_returncode': executed.returncode,
                                   'stdout': executed.stdout, 'stderr': executed.stderr})
        self.assertEqual(executed.returncode, 0, executed.stdout + executed.stderr)
        self.assertIn('PASS 67 source-executing fit/selection/actual-button readiness checks',
                      executed.stdout)

    def test_actual_policy_O0(self):
        self.run_native_policy('-O0')

    def test_actual_policy_O2(self):
        self.run_native_policy('-O2')

    def test_layout_and_measured_admission_are_connected(self):
        self.assertIn('UI_ipad_knife_hud_geometry(C, geometry, nullptr)',
                      function(AREA, 'static bool ui_ipad_corner_panels_size('))
        draw = function(HUD, 'static void ipad_knife_hud_draw(')
        self.assertIn('hrd->ipad_knife_button_width[0] = geometry.button_width[0]', draw)
        self.assertIn('column->enabled_set(geometry.fits)', draw)
        ready = function(HUD, 'bool UI_ipad_knife_hud_geometry_ready(')
        for callback in ('UI_fontstyle', 'UI_style_get', 'IFACE_(', 'CTX_data_',
                         'ipad_knife_hud_layout('):
            self.assertNotIn(callback, ready)
        self.assertIn('ui_block_to_window_rctf(', ready)
        self.assertIn('count == 2', ready)
        active = function(HUD, 'bool UI_ipad_knife_hud_active(')
        self.assertIn('ipad_knife_hud_origin(C)', active)
        self.assertNotIn('ipad_knife_hud_layout(', active)


if __name__ == '__main__':
    unittest.main(argv=[sys.argv[0]] + UNITTEST_ARGS)
