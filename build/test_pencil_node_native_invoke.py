"""Execute actual Node dispatch/invoke/poll and native View2D state at O0/O2.

The fixture extracts production function bodies; it never inserts a policy into
the source under test. Native allocation, context access, RNA scalar storage and
redraw/timer/cursor boundaries are instrumented. This is a bounded source probe,
not a full Blender build, arbitrary callback/lifetime proof or device evidence.
"""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import unittest

PARSER = argparse.ArgumentParser(add_help=False)
PARSER.add_argument('--repo', type=Path, default=Path(__file__).resolve().parents[1])
PARSER.add_argument('--source-root', type=Path)
PARSER.add_argument('--cache-dir', type=Path)
PARSER.add_argument('--output-dir', type=Path)
OPTIONS, UNITTEST_ARGS = PARSER.parse_known_args()
REPO = OPTIONS.repo.resolve()
CACHE = OPTIONS.cache_dir.resolve() if OPTIONS.cache_dir else REPO / '.cache/preflight'
OUT = OPTIONS.output_dir.resolve() if OPTIONS.output_dir else Path(tempfile.mkdtemp(prefix='pencil-node-native-invoke-'))
OUT.mkdir(parents=True, exist_ok=True)
sys.path.insert(0, str(REPO / 'build'))


def helper(name):
    spec = importlib.util.spec_from_file_location(name, REPO / 'build' / (name + '.py'))
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


preflight = helper('preflight')
touch = helper('test_touch_extrude')
PIN = preflight.pinned_commit(REPO)
WM_PATH = 'source/blender/windowmanager/intern/wm_event_system.cc'
VIEW_PATH = 'source/blender/editors/interface/view2d/view2d_ops.cc'
UI_PATH = 'source/blender/editors/include/UI_view2d.hh'
GESTURE_PATH = 'source/blender/windowmanager/intern/wm_gesture_ops.cc'
TRANSFORM_PATH = 'source/blender/editors/transform/transform.cc'
GENERICS_PATH = 'source/blender/editors/transform/transform_generics.cc'
RNA_PATH = 'source/blender/makesrna/RNA_types.hh'
PATHS = (WM_PATH, VIEW_PATH, UI_PATH, GESTURE_PATH, TRANSFORM_PATH, GENERICS_PATH, RNA_PATH)
BASE = {p: preflight.get_source(PIN, p, CACHE, False).decode('utf-8') for p in PATHS}
touch.PIN_ROOT = CACHE / PIN
touch.changed_source.cache_clear()


def source(path):
    if OPTIONS.source_root and (OPTIONS.source_root / path).is_file():
        return (OPTIONS.source_root / path).read_text(encoding='utf-8')
    return touch.changed_source(path) if f'diff --git a/{path} b/{path}\n' in touch.PATCH_TEXT else BASE[path]


def function(text, signature):
    """Extract one complete, top-level function, excluding forward declarations."""
    start = text.index(signature)
    while True:
        opening = text.index('{', start)
        if ';' not in text[start:opening]:
            return text[start:text.index('\n}', opening) + 2]
        start = text.index(signature, start + len(signature))


def between(text, first, last):
    start = text.index(first)
    return text[start:text.index(last, start)]


WM, VIEW, UI, GESTURE, TRANSFORM, GENERICS, RNA = (source(p) for p in PATHS)
PROFILE_SIG = 'bool ED_view2d_native_pan_zoom_type_is('
VIEW_SIGNATURES = (
    'static float view2d_scroll_delta_y_snap_page_size(',
    'static bool view_pan_poll(', 'static void view_pan_init(',
    'static void view_pan_apply_ex(', 'static void view_pan_apply(',
    'static void view_pan_exit(', 'static wmOperatorStatus view_pan_exec(',
    'static wmOperatorStatus view_pan_invoke(', 'static wmOperatorStatus view_pan_modal(',
    'static void view_pan_cancel(', 'static void VIEW2D_OT_pan(',
    'static bool view_zoom_poll(', 'static void view_zoomdrag_init(',
    'static void view_zoomdrag_apply(', 'static void view_zoomdrag_exit(',
    'static void view_zoomdrag_cancel(', 'static wmOperatorStatus view_zoomdrag_exec(',
    'static wmOperatorStatus view_zoomdrag_invoke(',
    'static wmOperatorStatus view_zoomdrag_modal(', 'static void VIEW2D_OT_zoom(',
)
VIEW_STRUCTS = between(VIEW, 'struct v2dViewPanData {', 'static bool view_pan_poll(')
VIEW_STRUCTS += between(VIEW, 'struct v2dViewZoomData {', '/**\n * Clamp by convention')
VIEW_BODIES = '\n\n'.join(function(VIEW, s) for s in VIEW_SIGNATURES)
FIXTURE = REPO / 'build/tests/node_native_invoke'


def sha(text):
    return hashlib.sha256(text.encode()).hexdigest()


def build_native_prefix(historical=False):
    """Reusable whole native invoke/View2D prefix, excluding test cases/main."""
    wm_text = BASE[WM_PATH] if historical else WM
    invoke = function(wm_text, 'static wmOperatorStatus wm_operator_invoke(')
    poll = function(wm_text, 'bool WM_operator_poll(')
    prelude = (FIXTURE / 'models.inc.cc').read_text(encoding='utf-8')
    decls = function(RNA, 'struct AncestorPointerRNA {') + ';\n'
    decls += 'constexpr int64_t ANCESTOR_POINTERRNA_DEFAULT_SIZE=2;\n'
    decls += function(RNA, 'struct PointerRNA {') + ';\n'
    code = prelude.replace('POINTER_RNA_DECLS', decls)
    code += '\n' + VIEW_STRUCTS + '\n' + VIEW_BODIES
    profile = function(VIEW, PROFILE_SIG)
    code += '\n' + profile.replace(PROFILE_SIG, 'bool ED_view2d_native_pan_zoom_type_is_actual(', 1)
    code += '\nstatic bool ED_view2d_native_pan_zoom_type_is(const wmOperatorType*ot,bool zoom){++counts.profile;return ED_view2d_native_pan_zoom_type_is_actual(ot,zoom);}\n'
    code += '\n' + poll.replace('bool WM_operator_poll(', 'bool WM_operator_poll_actual(', 1)
    code += '\nstatic bool WM_operator_poll(bContext*C,wmOperatorType*ot){++counts.poll;context_trace.push_back("poll");return WM_operator_poll_actual(C,ot);}\n'
    code += '\n' + (FIXTURE / 'wm_boundaries.inc.cc').read_text(encoding='utf-8')
    enum = re.search(r'enum class eIPadNodeView2DDispatch\s*(?::[^\{]+)?\{[^}]+\};', WM)
    if enum is None:
        if not historical:
            raise ValueError('Actual production Node dispatch enum is missing')
        enum_text = 'enum class eIPadNodeView2DDispatch { None, StockPan, StockCtrlZoom };'
    else:
        enum_text = enum.group()
    code += '\n' + enum_text
    if not historical:
        code += '\n' + function(wm_text, 'static bool wm_ipad_node_view2d_event_context(')
    code += '\n' + invoke
    call = 'wm_operator_invoke(C,ot,event,properties,nullptr,poll_only,true'
    call += ')' if historical else ',static_cast<eIPadNodeView2DDispatch>(profile))'
    return code + '\nstatic wmOperatorStatus native_invoke(bContext*C,wmOperatorType*ot,const wmEvent*event,int profile=0,PointerRNA*properties=nullptr,bool poll_only=false){return ' + call + ';}\n'


class NodeNativeInvokeTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        candidates = [shutil.which('clang++'), shutil.which('g++')]
        if os.name == 'nt':
            candidates += [r'C:/Program Files/LLVM/bin/clang++.exe',
                           r'C:/Program Files/Microsoft Visual Studio/18/Insiders/VC/Tools/Llvm/x64/bin/clang++.exe']
        cls.compiler = next((str(p) for p in candidates if p and Path(p).is_file()), None)
        if cls.compiler is None:
            raise RuntimeError('C++17 compiler required: native invocation probe was not executed')

    def test_native_profile_declared_without_new_callback_surface(self):
        self.assertIn(PROFILE_SIG, UI)
        body = function(VIEW, PROFILE_SIG)
        for name in ('view_pan_poll', 'view_pan_exec', 'view_pan_invoke', 'view_pan_modal',
                     'view_pan_cancel', 'view_zoom_poll', 'view_zoomdrag_exec',
                     'view_zoomdrag_invoke', 'view_zoomdrag_modal', 'view_zoomdrag_cancel',
                     'pyop_poll', 'rna_ext.data', 'rna_ext.srna', 'rna_ext.call',
                     'rna_ext.free', 'macro.first', 'macro.last'):
            self.assertIn(name, body)
        self.assertNotIn('CTX_', body)
        self.assertNotIn('WM_operator_poll(', body)

    def compile_and_run(self, optimization, historical=False):
        code = build_native_prefix(historical)
        code += '\n' + (FIXTURE / 'control_models.inc.cc').read_text(encoding='utf-8')
        for sig in ('static void gesture_circle_apply(', 'wmOperatorStatus WM_gesture_circle_modal('):
            code += '\n' + function(GESTURE, sig)
        code += '\n' + function(GENERICS, 'void calculatePropRatio(')
        branch = between(TRANSFORM, '      case TFM_MODAL_PROPSIZE:\n        /* MOUSEPAN usage... */',
                         '      case TFM_MODAL_PROPSIZE_UP:')
        code += '\nstatic void transform_propsize(TransInfo*t,const wmEvent*event){switch(event->val){\n' + branch + '\n}}\n'
        code += '\nstatic int live_control_cases();\n'
        cases = (FIXTURE / 'cases.inc.cc').read_text(encoding='utf-8')
        code += '\n' + cases.replace('HISTORICAL_SOURCE', 'true' if historical else 'false')
        code += '\n' + (FIXTURE / 'control_cases.inc.cc').read_text(encoding='utf-8')
        tag = ('historical-' if historical else 'current-') + optimization.removeprefix('-')
        cpp, binary = OUT / (tag + '.cc'), OUT / (tag + ('.exe' if os.name == 'nt' else ''))
        cpp.write_text(code, encoding='utf-8', newline='\n')
        build = subprocess.run([self.compiler, '-std=c++17', optimization, '-Werror', str(cpp), '-o', str(binary)], capture_output=True, text=True)
        (OUT / (tag + '-compile.log')).write_text(build.stdout + build.stderr, encoding='utf-8')
        self.assertEqual(build.returncode, 0, build.stdout + build.stderr)
        run = subprocess.run([str(binary)], capture_output=True, text=True)
        (OUT / (tag + '-run.log')).write_text(run.stdout + run.stderr, encoding='utf-8')
        self.assertEqual(run.returncode, 0, run.stdout + run.stderr)
        self.assertIn('native-invoke scenarios passed', run.stdout)
        controls = []
        for kind in ('pan', 'zoom'):
            negative = subprocess.run([str(binary), f'--require-{kind}-denial'], capture_output=True, text=True)
            (OUT / (tag + f'-required-{kind}-denial.log')).write_text(negative.stdout + negative.stderr, encoding='utf-8')
            self.assertEqual(negative.returncode, 17 if historical else 0, negative.stdout + negative.stderr)
            if historical:
                self.assertIn('NODE_REQUIRED_DENIAL_FAILED', negative.stderr)
                self.assertIn('status=4 creates=1', negative.stderr)
            controls.append({'kind': kind, 'returncode': negative.returncode, 'stderr': negative.stderr})
        report = {'pin': PIN, 'optimization': optimization, 'historical': historical,
                  'source_sha256': {p: sha(source(p)) for p in PATHS},
                  'generated_sha256': sha(code), 'output': run.stdout,
                  'required_denial_controls': controls,
                  'observation': 'Only WM_operator_poll and ED_view2d_native_pan_zoom_type_is definition names are changed to add counter wrappers; their actual bodies remain verbatim.',
                  'boundaries': 'Explicit model structs/context/RNA allocation/redraw/cursor/timer; full actual invoke/poll and native pan/zoom/gesture-circle/calculatePropRatio bodies; actual Transform propsize case. Circle selection exec and final coordinate application are explicit geometry boundaries.'}
        (OUT / (tag + '.json')).write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')

    def test_connected_native_invoke_O0(self):
        self.compile_and_run('-O0')

    def test_connected_native_invoke_O2(self):
        self.compile_and_run('-O2')

    def test_original_native_failure_O0(self):
        self.compile_and_run('-O0', True)

    def test_original_native_failure_O2(self):
        self.compile_and_run('-O2', True)


if __name__ == '__main__':
    unittest.main(argv=[sys.argv[0]] + UNITTEST_ARGS)
