"""Execute bounded real Node switch query/newspace/public RNA algorithms.

All extracted algorithms remain byte-for-byte complete. The explicit host models
provide list storage, initialized registry, raw context primitives, Paint/native
exit and editor-factory boundaries, rather than replacing source-under-test logic.
"""
from pathlib import Path
from datetime import datetime, timezone
import argparse
import hashlib
import importlib.util
import json
import shutil
import subprocess
import sys
import tempfile

HERE = Path(__file__).resolve().parent
parser = argparse.ArgumentParser()
parser.add_argument('--repo', type=Path, default=HERE.parents[2])
parser.add_argument('--source-root', type=Path)
parser.add_argument('--cache-dir', type=Path)
parser.add_argument('--output-dir', type=Path)
options = parser.parse_args()
REPO = options.repo.resolve()
OUT = (options.output_dir or Path(tempfile.mkdtemp(prefix='node-editor-switch-'))).resolve()
OUT.mkdir(parents=True, exist_ok=True)
CACHE = (options.cache_dir or REPO / '.cache/preflight').resolve()
sys.path.insert(0, str(REPO / 'build'))
import preflight
import test_touch_extrude as touch
PIN = preflight.pinned_commit(REPO)
touch.PIN_ROOT = CACHE / PIN
touch.PATCH_TEXT = (REPO / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
touch.changed_source.cache_clear()
PATCHED = dict(preflight.patch_files(touch.PATCH_TEXT))
WM = 'source/blender/windowmanager/intern/wm_event_system.cc'
AREA = 'source/blender/editors/screen/area.cc'
SCREEN = 'source/blender/editors/screen/screen_edit.cc'
RNA = 'source/blender/makesrna/intern/rna_screen.cc'
NODE = 'source/blender/editors/space_node/node_relationships.cc'
LIST = 'source/blender/blenlib/intern/listbase.cc'
# Fetch every prerequisite before changed_source's direct cached reads. This
# avoids relying on earlier full-suite ordering or a developer's populated cache.
PATHS = [WM, AREA, SCREEN, RNA, NODE, LIST,
         'source/blender/editors/include/ED_node.hh',
         'source/blender/windowmanager/WM_api.hh',
         'source/blender/windowmanager/wm_event_system.hh',
         'source/blender/makesdna/DNA_windowmanager_types.h',
         'source/blender/windowmanager/intern/wm_operator_type.cc',
         'source/blender/blenkernel/intern/context.cc']
INPUTS = {}


def sha(data):
    return hashlib.sha256(data).hexdigest()


def source(path):
    if path in PATCHED and PATCHED[path]:
        preflight.get_source(PIN, path, CACHE, False)
    if options.source_root and path in PATCHED:
        target = options.source_root / path
        if not target.is_file():
            raise ValueError('Explicit materialized current input missing: ' + str(target))
        data = target.read_bytes()
        origin = 'explicit-current-source-root'
    elif path in PATCHED:
        data = touch.changed_source(path).encode()
        origin = 'whole-pin-plus-current-patch'
    else:
        data = preflight.get_source(PIN, path, CACHE, False)
        origin = 'unchanged-pinned-primary'
    INPUTS[path] = {'sha256': sha(data), 'origin': origin}
    return data.decode('utf-8')


SOURCES = {path: source(path) for path in PATHS}


def function(text, marker):
    """Select an entire actual definition without editing its algorithm."""
    start = text.index(marker)
    while True:
        opening = text.index('{', start)
        if ';' not in text[start:opening]:
            # Actual selected top-level functions close at column zero. This
            # also ignores brace characters in their explanatory comments.
            return text[start:text.index('\n}', opening) + 2]
        start = text.index(marker, start + len(marker))


historical = json.loads((HERE / 'historical_sources.json').read_text())
assert historical['pin'] == PIN
HIST = {}
for name, record in historical['files'].items():
    data = (HERE / name).read_bytes()
    assert sha(data) == record['sha256'], ('frozen historical fixture changed', name)
    HIST[name] = data.decode()

query_signatures = [
    'static const wmOperatorType *wm_ipad_node_link_registered_type(',
    'static bool wm_ipad_node_link_type_switch_allowed(',
    'static bool wm_ipad_node_link_operator_switch_allowed(',
    'bool WM_event_ipad_node_link_editor_switch_allowed(',
]
query = '\n\n'.join(function(SOURCES[WM], s) for s in query_signatures)
profile = function(SOURCES[NODE], 'bool node_link_modal_type(')
newspace = function(SOURCES[AREA], 'bool ED_area_newspace(')
area_exit = function(SOURCES[SCREEN], 'bool ED_area_exit(')
rna = '\n\n'.join(function(SOURCES[RNA], s) for s in historical['files']['historical_rna_screen.inc.cc']['signatures'])
replacements = '\n\n'.join(function(SOURCES[WM], s) for s in historical['files']['historical_wm_event_system.inc.cc']['signatures'])
registration = function(SOURCES[NODE], 'void NODE_OT_link(')
# These unchanged actual corridors are preserved as exact controls. A change
# needs a deliberate new review, never an automatic fixture migration.
for actual, name in [(area_exit, 'historical_screen_edit.inc.cc'),
                     (rna, 'historical_rna_screen.inc.cc'),
                     (replacements, 'historical_wm_event_system.inc.cc'),
                     (registration, 'historical_node_registration.inc.cc')]:
    assert actual + '\n' == HIST[name], ('previously accepted corridor changed', name)
# Compile-time omission of customdata/tree members is an additional executable
# check; these source checks make any new boundary review explicit as well.
for forbidden in ['customdata', 'linkdrag', 'edittree', 'CTX_data_', 'CTX_wm_window(',
                  'CTX_wm_area(', 'CTX_wm_region(', 'CTX_wm_screen(', 'WM_operator_poll(',
                  'CTX_wm_window_set(', 'CTX_wm_area_set(', 'CTX_wm_region_set(',
                  'MEM_', 'new ', 'BKE_', 'report', 'WM_window_get_active_screen(']:
    assert forbidden not in query, ('query acquired an unreviewed boundary', forbidden)
# Check calls, rather than forbidding callback names used as pure addresses.
for callback in ['node_link_invoke', 'node_link_modal', 'node_link_cancel', 'ED_operator_node_editable']:
    assert callback + '(' not in profile
assert 'WM_event_ipad_node_link_editor_switch_allowed(' in SOURCES['source/blender/windowmanager/WM_api.hh']
assert 'bool node_link_modal_type(' in SOURCES['source/blender/editors/include/ED_node.hh']

list_code = '\n\n'.join(function(SOURCES[LIST], s) for s in
                          ['void BLI_addhead(', 'void BLI_addtail(', 'void BLI_remlink(', 'int BLI_findindex('])
list_code += '\nvoid BLI_freelinkN(ListBase *list,void *ptr){BLI_remlink(list,ptr);++counts.frees;}\n'
prefix = (HERE / 'models.inc.cc').read_text() + '\n' + list_code
prefix += '\nnamespace blender::ed::space_node {\n' + registration + '\n}\n'
prefix += '\nnamespace historical_registration {\n' + HIST['historical_node_registration.inc.cc'] + '\n}\n'
prefix += '\n#ifdef WITH_APPLE_CROSSPLATFORM\nnamespace blender::ed::space_node {\n' + profile + '\n}\n' + query + '\n#endif\n'
prefix += '\n' + replacements + '\n' + area_exit
cases = (HERE / 'cases.inc.cc').read_text()
compiler = next((p for p in [shutil.which('clang++'), shutil.which('g++'),
    r'C:/Program Files/LLVM/bin/clang++.exe',
    r'C:/Program Files/Microsoft Visual Studio/18/Insiders/VC/Tools/Llvm/x64/bin/clang++.exe']
    if p and Path(p).is_file()), None)
assert compiler, 'C++17 compiler required: connected test was not executed'
executions = []
generated = {}
for kind in ['current-apple', 'historical-apple', 'current-nonapple']:
    actual_newspace = HIST['historical_area.inc.cc'] if kind == 'historical-apple' else newspace
    code = prefix + '\n' + actual_newspace + '\n' + rna + '\n' + cases
    cpp = OUT / (kind + '.cc')
    cpp.write_text(code, encoding='utf-8', newline='\n')
    generated[kind] = sha(cpp.read_bytes())
    for optimization in ['-O0', '-O2']:
        tag = kind + '-' + optimization[1:]
        binary = OUT / (tag + ('.exe' if sys.platform == 'win32' else ''))
        flags = ['-DCURRENT_APPLE=0'] if kind == 'current-nonapple' else ['-DWITH_APPLE_CROSSPLATFORM=1', '-DCURRENT_APPLE=1']
        command = [str(compiler), '-std=c++17', optimization, *flags, str(cpp), '-o', str(binary)]
        built = subprocess.run(command, capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=120)
        (OUT / (tag + '-compile.log')).write_text(built.stdout + built.stderr, encoding='utf-8')
        assert built.returncode == 0, (tag, built.stdout, built.stderr)
        args = ['--require-historical-refusal'] if kind == 'historical-apple' else []
        run = subprocess.run([str(binary), *args], capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=60)
        record = {'case': kind, 'optimization': optimization, 'returncode': run.returncode, 'stdout': run.stdout, 'stderr': run.stderr}
        executions.append(record)
        (OUT / 'executions.json').write_text(json.dumps(executions, indent=2) + '\n')
        if kind == 'historical-apple':
            assert run.returncode == 17 and 'EDITOR_SWITCH_REQUIRED_REFUSAL_FAILED' in run.stderr, record
            for fact in ['switched=1', 'listed=1', 'area_null=1', 'region_null=1', 'cancel=0']:
                assert fact in run.stderr, record
        else:
            assert run.returncode == 0 and 'bounded actual editor-switch scenarios passed:' in run.stdout, record
report = {
 'status': 'PASS_BOUNDED_ACTUAL_NODE_EDITOR_SWITCH_REFUSAL',
 'utc': datetime.now(timezone.utc).isoformat(), 'pin': PIN,
 'patch_sha256': sha((REPO / 'patches/blender-ipad.patch').read_bytes()),
 'driver_sha256': sha(Path(__file__).read_bytes()), 'inputs': INPUTS,
 'fixture_sha256': {p.name: sha(p.read_bytes()) for p in HERE.iterdir() if p.is_file()},
 'historical_provenance': historical, 'generated_cpp_sha256': generated,
 'function_sha256': {'query_and_dependencies': sha(query.encode()), 'native_profile': sha(profile.encode()),
                     'whole_newspace': sha(newspace.encode()), 'whole_rna_get_set_update': sha(rna.encode())},
 'executions': executions, 'native_abi_or_device_claim': False,
 'boundaries': [
  'Actual complete native NODE_OT_link registration/profile, WM query/dependencies, whole ED_area_newspace, unchanged whole ED_area_exit, public RNA Area.type get/set/update, actual modal area/region replacement and BLI list algorithms execute at O0/O2.',
  'Host structs model relevant named fields/intrusive storage, not native ABI/layout. Running operators intentionally have no customdata/tree/drag/node/socket members; query compilation cannot read them.',
  'Initialized operator-registry lookup and nonallocating Span iteration use explicit storage adapters. Production registry initialization may allocate on first-ever access; ordinary modal registration precedes this supported UI query.',
  'Native callbacks are address identities assigned by actual registration. Poll/invoke/modal/Cancel are not dispatched. Paint, region exit/local-handler cleanup, header alignment, editor factory, RNA property definitions, redraw/notifier/DEG and title boundaries are instrumented.',
  'Actual ED_area_exit calls the region-exit boundary which executes actual modal-region replacement; actual modal-area replacement executes afterward. Historical source control establishes prospective loss and retained registration, not native crash execution or full next-event dispatch.',
  'Raw context field getters/setters model saved window/area/region and clearing order; real context setters also affect scene/workspace/screen/Python context state. The public RNA path performs its preexisting context work; only the new query and early direct refusal avoid provider-sensitive getters.',
  'Finish/Escape are external native-terminal boundaries: test executes actual BLI_remlink of the handler and then fresh query/newspace retry. No synthetic terminal or native Cancel is invoked and no full native-terminal/Undo proof is claimed.',
  'Only editor changes departing SPACE_NODE through ED_area_newspace/public RNA Area.type are claimed. Same-type/other-editor/nonApple fallback is preserved; Area.ui_type outer refresh, joins/swaps/region/screen exits and arbitrary corrupted-list or callback safety are outside this family.',
 ],
}
(OUT / 'editor-switch-report.json').write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')
print(json.dumps({'status': report['status'], 'report': str(OUT / 'editor-switch-report.json')}, indent=2))
