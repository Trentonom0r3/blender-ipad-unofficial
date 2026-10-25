"""Execute actual Knife action helpers and the complete unchanged native modal.

Run with --repo PATH [--cache-dir PATH] [--source-dir PATH] [--output-dir PATH].
The candidate must provide the actual new helpers: this fixture never inserts or
repairs production code. The temporary source directory supports pre-overlay
integration; normal runs reconstruct the complete current overlay from its pin.
Geometry/BKE, allocation/freeing, matrices/hits, status and numeric evaluation
are explicit instrumentation. This is not WM cleanup, Undo, UI, UIKit or device
proof. Native NEW_CUT and lift controls demonstrate why neither means Finish.
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


DEFAULT_REPO = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(add_help=False)
parser.add_argument('--repo', type=Path, default=DEFAULT_REPO)
parser.add_argument('--cache-dir', type=Path)
parser.add_argument('--source-dir', type=Path)
parser.add_argument('--output-dir', type=Path)
OPTIONS, UNITTEST_ARGS = parser.parse_known_args()
REPO = OPTIONS.repo.resolve()
OUT = OPTIONS.output_dir.resolve() if OPTIONS.output_dir else Path(
    tempfile.mkdtemp(prefix='pencil-knife-native-action-'))
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
KNIFE_PATH = 'source/blender/editors/mesh/editmesh_knife.cc'
HEADER_PATH = 'source/blender/editors/include/ED_mesh.hh'
NUM_PATH = 'source/blender/editors/util/numinput.cc'
INPUTS = {path: preflight.get_source(PIN, path, CACHE, False).decode('utf-8')
          for path in (KNIFE_PATH, HEADER_PATH, NUM_PATH)}
touch.PIN_ROOT = CACHE / PIN
touch.changed_source.cache_clear()


def source(path):
    if OPTIONS.source_dir:
        # Missing candidate files are errors, never silently replaced by baseline.
        return (OPTIONS.source_dir / path).read_text(encoding='utf-8')
    marker = f'diff --git a/{path} b/{path}\n'
    return touch.changed_source(path) if marker in touch.PATCH_TEXT else INPUTS[path]


def between(text, first, end):
    begin = text.index(first)
    return text[begin:text.index(end, begin)]


def sha(text):
    return hashlib.sha256(text.encode()).hexdigest()


SIGNATURES = ('bool ED_mesh_knife_modal_type(', 'bool ED_mesh_knife_modal_origin(',
              'wmOperatorStatus ED_mesh_knife_modal_action(')
MODAL_SIGNATURE = 'static wmOperatorStatus knifetool_modal('
KNIFE = source(KNIFE_PATH)
HEADER = source(HEADER_PATH)
MODAL = function(KNIFE, MODAL_SIGNATURE)
HELPERS = '\n\n'.join(function(KNIFE, signature) for signature in SIGNATURES)
PUBLIC = between(HEADER, 'struct MeshKnifeModalOrigin {',
                 '/* `editmesh_preselect_edgering.cc` */')
ENUMS = between(KNIFE, 'enum {\n  KNF_MODAL_CANCEL',
                '/* -------------------------------------------------------------------- */\n/** \\name Drawing')
NUM_FALLBACK = between(INPUTS[NUM_PATH],
                       '  if (!updated && !utf8_buf && event->utf8_buf[0]) {',
                       '\n\n  /* Up to this point')
CTRL_GATE = between(INPUTS[NUM_PATH],
                    '  if (!updated && (event->modifier & KM_CTRL)) {', '\n\n')
PREFIX = (REPO / 'build/tests/knife_native_action_models.inc.cc').read_text(
    encoding='utf-8').replace('NUM_FALLBACK', NUM_FALLBACK).replace('NUM_CTRL_GATE', CTRL_GATE)
WRAPPERS = '\n\n'.join(function(KNIFE, signature) for signature in (
    'static void knifetool_exit(', 'static void knifetool_finish(',
    'static void knifetool_cancel('))
INVOKE = (REPO / 'build/tests/knife_native_action_invoke_model.inc.cc').read_text(encoding='utf-8')
CASES = (REPO / 'build/tests/knife_native_action_cases.inc.cc').read_text(encoding='utf-8')


def generated(helpers=HELPERS):
    return '\n'.join((PREFIX, ENUMS, PUBLIC, WRAPPERS, MODAL, INVOKE, helpers, CASES))


class KnifeNativeActionTests(unittest.TestCase):
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
            'source_dir': str(OPTIONS.source_dir) if OPTIONS.source_dir else None,
            'source_hashes': {KNIFE_PATH: sha(KNIFE), HEADER_PATH: sha(HEADER)},
            'declared_pin_hashes': {path: sha(text) for path, text in INPUTS.items()},
            'actual_modal_sha256': sha(MODAL), 'actual_helpers_sha256': sha(HELPERS),
            'numeric_fallback_sha256': sha(NUM_FALLBACK), 'ctrl_gate_sha256': sha(CTRL_GATE),
            'results': cls.results,
            'boundaries': [
                'Full unchanged native modal and actual exit/finish/cancel wrappers execute.',
                'Invoke is an identity-only model: no action may reinvoke it.',
                'Geometry finish_ex, allocator exit_ex, viewport/hit/cut/status functions are instrumentation with retained storage.',
                'Pinned numeric UTF8 fallback and Ctrl refusal execute; evaluator and remaining input handling are modeled.',
                'No registered WM ownership, normal handler/history cleanup, UI/GPU/UIKit, ABI or device proof.',
            ],
        }
        (OUT / 'native-action-report.json').write_bytes((json.dumps(report, indent=2) + '\n').encode())

    def compile_and_run(self, label, optimization, helpers=HELPERS, expected_success=True):
        if not self.compiler:
            self.skipTest('C++17 compiler unavailable; native helper/modal probe did not run')
        path = OUT / (label + '.cc')
        path.write_bytes(generated(helpers).encode())
        binary = OUT / (label + ('.exe' if os.name == 'nt' else ''))
        command = [self.compiler, '-std=c++17', optimization, '-Werror', str(path), '-o', str(binary)]
        compiled = subprocess.run(command, text=True, encoding='utf-8', errors='replace', capture_output=True)
        (OUT / (label + '-compile.log')).write_bytes((compiled.stdout + compiled.stderr).encode())
        self.assertEqual(compiled.returncode, 0, compiled.stdout + compiled.stderr)
        run = subprocess.run([str(binary)], text=True, encoding='utf-8', errors='replace', capture_output=True)
        (OUT / (label + '-run.log')).write_bytes((run.stdout + run.stderr).encode())
        type(self).results.append({'label': label, 'optimization': optimization,
                                   'compile_returncode': compiled.returncode,
                                   'execution_returncode': run.returncode,
                                   'expected_success': expected_success,
                                   'stdout': run.stdout, 'stderr': run.stderr})
        if expected_success:
            self.assertEqual(run.returncode, 0, run.stdout + run.stderr)
            self.assertIn('PASS 13 native-helper scenarios', run.stdout)
        else:
            self.assertNotEqual(run.returncode, 0, 'Regression control unexpectedly passed')
        return run

    def test_actual_modal_unchanged_and_original_public_origin(self):
        self.assertEqual(MODAL, function(INPUTS[KNIFE_PATH], MODAL_SIGNATURE))
        self.assertIn('ARegion *region = nullptr;', PUBLIC)
        origin = function(KNIFE, SIGNATURES[1])
        self.assertIn('kcd->vc.region', origin)
        self.assertIn('kcd->vc.obedit', origin)
        self.assertNotIn('knifetool_invoke(', function(KNIFE, SIGNATURES[2]))

    def test_historical_native_has_no_action_api(self):
        # Exact pin is a missing-feature control, not an injected implementation.
        # Its unchanged NEW_CUT/lift behavior also executes in each compiled run.
        for signature in SIGNATURES:
            with self.assertRaises(ValueError):
                function(INPUTS[KNIFE_PATH], signature)

    def test_actual_helper_and_full_modal_O0(self):
        self.compile_and_run('actual-O0', '-O0')

    def test_actual_helper_and_full_modal_O2(self):
        self.compile_and_run('actual-O2', '-O2')

    def test_blind_event_copy_regression_is_detected(self):
        # Prospective unsafe implementation control, never substituted in normal runs.
        self.assertEqual(HELPERS.count('wmEvent modal_event{};'), 1)
        unsafe = HELPERS.replace('wmEvent modal_event{};', 'wmEvent modal_event = *event;')
        result = self.compile_and_run('unsafe-event-copy-control', '-O2', unsafe, False)
        self.assertIn('OPERATOR_CANCELLED', result.stderr)

    def test_same_name_foreign_modal_regression_is_detected(self):
        # The native idname is unchanged; exact callback checks must be exercised.
        predicate = function(KNIFE, SIGNATURES[0])
        replacement = 'bool ED_mesh_knife_modal_type(const wmOperatorType *type) { return type != nullptr; }'
        result = self.compile_and_run('unsafe-type-control', '-O2', HELPERS.replace(predicate, replacement), False)
        self.assertIn('ED_mesh_knife_modal_type', result.stderr)


if __name__ == '__main__':
    unittest.main(argv=[sys.argv[0]] + UNITTEST_ARGS)
