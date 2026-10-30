"""Compose existing actual-source generators into one compiled host program."""
from pathlib import Path
from datetime import datetime, timezone
import argparse
import ast
import hashlib
import importlib.util
import json
import re
import shutil
import subprocess
import sys
import tempfile

HERE = Path(__file__).resolve().parent
parser = argparse.ArgumentParser()
parser.add_argument('--repo', type=Path, default=HERE.parents[2])
parser.add_argument('--source-root', type=Path)
parser.add_argument('--output-dir', type=Path)
options = parser.parse_args()
REPO = options.repo.resolve()
OUT = (options.output_dir or Path(tempfile.mkdtemp(prefix='node-workflow-'))).resolve()
OUT.mkdir(parents=True, exist_ok=True)
sys.path.insert(0, str(REPO / 'build'))
import preflight
import test_touch_extrude as touch
PIN = preflight.pinned_commit(REPO)
CACHE = REPO / '.cache/preflight'
touch.PIN_ROOT = CACHE / PIN
touch.PATCH_TEXT = (REPO / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
touch.changed_source.cache_clear()
SOURCE_PATHS = [
    'intern/ghost/intern/GHOST_WindowIOS.mm', 'intern/ghost/GHOST_NavigationIOS.hh',
    'intern/ghost/GHOST_Types.h', 'intern/ghost/intern/GHOST_EventTrackpad.hh',
    'source/blender/windowmanager/WM_types.hh',
    'source/blender/windowmanager/intern/wm_event_system.cc',
    'source/blender/windowmanager/wm_event_system.hh',
    'source/blender/editors/interface/view2d/view2d_ops.cc',
    'source/blender/editors/include/UI_view2d.hh',
]
INPUTS = {}


def sha(value):
    return hashlib.sha256(value).hexdigest()


def load(path, name):
    specification = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(specification)
    sys.modules[name] = module
    specification.loader.exec_module(module)
    return module


def replace_once(text, old, new):
    assert text.count(old) == 1, (old[:80], text.count(old))
    return text.replace(old, new, 1)


def function(text, marker):
    start = text.index(marker)
    opening = text.index('{', start)
    depth, end = 1, opening + 1
    while depth:
        depth += (text[end] == '{') - (text[end] == '}')
        end += 1
    return text[start:end]


SOURCE = options.source_root.resolve() if options.source_root else OUT / 'materialized'
if not options.source_root:
    SOURCE.mkdir(exist_ok=True)
    patch_files = dict(preflight.patch_files(touch.PATCH_TEXT))
    for path in SOURCE_PATHS:
        if path in patch_files:
            if patch_files[path]:
                preflight.get_source(PIN, path, CACHE, False)
            data = touch.changed_source(path).encode()
        else:
            data = preflight.get_source(PIN, path, CACHE, False)
        target = SOURCE / path
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(data)
for path in SOURCE_PATHS:
    assert (SOURCE / path).is_file(), ('missing explicit materialized input', path)
    INPUTS[path] = sha((SOURCE / path).read_bytes())

# Pre-fetch the complete baseline inventory before the composite's direct reads.
# This makes standalone execution independent of any earlier test ordering.
baseline_driver = REPO / 'build/tests/node_keymap_baseline/baseline.py'
baseline = load(baseline_driver, 'workflow_baseline')
for path in baseline.PATHS.values():
    data = preflight.get_source(PIN, path, CACHE, False)
    INPUTS['pinned:' + path] = sha(data)

# Reuse the transport driver's actual generation phase, ending before its first
# generated-file write/compile/run statement. No source-under-test algorithm is
# reconstructed or repaired here. The existing prefix is parsed as Python AST.
transport_driver = REPO / 'build/tests/node_precision_transport/run_connected.py'
tree = ast.parse(transport_driver.read_text(encoding='utf-8'))
end = next(i for i, node in enumerate(tree.body)
           if isinstance(node, ast.Assign)
           and any(isinstance(t, ast.Name) and t.id == 'path' for t in node.targets)
           and 'actual-node-precision-transport.cc' in ast.unparse(node.value))
namespace = {'__file__': str(transport_driver), '__name__': 'workflow_transport_generation'}
saved_argv = sys.argv
try:
    sys.argv = [str(transport_driver), '--repo', str(REPO), '--source-root', str(SOURCE),
                '--output-dir', str(OUT / 'transport-generation')]
    exec(compile(ast.Module(body=tree.body[:end], type_ignores=[]), str(transport_driver), 'exec'), namespace)
finally:
    sys.argv = saved_argv
transport_code = namespace['code']
transport_main = function(transport_code, 'int main(')
transport_code = replace_once(transport_code, transport_main, '')
for path, value in namespace['INPUTS'].items():
    INPUTS['transport:' + path] = sha(value.encode())

composite_driver = REPO / 'build/tests/node_keymap_dispatch/connected.py'
composite = load(composite_driver, 'workflow_native_composite')
native_code, composite_metadata = composite.build(REPO, SOURCE)
native_main = function(native_code, 'int main(')
native_code = replace_once(native_code, native_main, '')
invoke_module = sys.modules['node_invoke_composite']

# Synchronize only the transport fixture's adapter event numbers to actual pin
# declarations, so every bridged queued scalar (including type) is copied exactly.
event_path = 'source/blender/windowmanager/wm_event_types.hh'
event_source = preflight.get_source(PIN, event_path, CACHE, False).decode('utf-8')
event_declarations = event_source[:event_source.index('enum eEventType_Mask {')].replace('#pragma once', '')
old_constants = 'enum {MOUSEPAN=100,MOUSEZOOM,MOUSESMARTZOOM,MOUSEROTATE,MOUSEMOVE,KM_NOTHING};'
new_constants = ('enum {MOUSEPAN=production_event_values::MOUSEPAN, MOUSEZOOM=production_event_values::MOUSEZOOM, '
                 'MOUSESMARTZOOM=production_event_values::MOUSESMARTZOOM, MOUSEROTATE=production_event_values::MOUSEROTATE, '
                 'MOUSEMOVE=production_event_values::MOUSEMOVE, KM_NOTHING=0};')
transport_code = replace_once(transport_code, old_constants, new_constants)

# Keep a second native namespace with the exact original pinned invoke body.
# An explicit signature adapter discards the new scalar, leaving the historical
# production algorithm unchanged; required-denial controls must fail precisely.
current_invoke = invoke_module.function(native_code, 'static wmOperatorStatus wm_operator_invoke(')
old_invoke = invoke_module.function(invoke_module.BASE[invoke_module.WM_PATH], 'static wmOperatorStatus wm_operator_invoke(')
old_invoke = old_invoke.replace('wm_operator_invoke(', 'wm_operator_invoke_historical(', 1)
signature_adapter = '''
static wmOperatorStatus wm_operator_invoke(bContext*C,wmOperatorType*ot,const wmEvent*event,
 PointerRNA*properties,ReportList*reports,const bool poll_only,bool use_last_properties,
 [[maybe_unused]] eIPadNativePanDispatch profile=eIPadNativePanDispatch::None){
 return wm_operator_invoke_historical(C,ot,event,properties,reports,poll_only,use_last_properties);
}
'''
historical_native_code = replace_once(native_code, current_invoke, old_invoke + '\n' + signature_adapter)

includes = set()


def encapsulate(name, code):
    includes.update(re.findall(r'^\s*#\s*include\s*(<[^>]+>)\s*$', code, re.MULTILINE))
    code = re.sub(r'^\s*#\s*include\s*<[^>]+>\s*$', '', code, flags=re.MULTILINE)
    assert not re.search(r'^\s*#\s*include', code, re.MULTILINE), 'unexpected nonstandard include'
    macros = sorted(set(re.findall(r'^\s*#\s*define\s+([A-Za-z_]\w*)', code, re.MULTILINE)))
    return '\nnamespace ' + name + ' {\n' + code + '\n}\n' + '\n'.join('#undef ' + m for m in macros) + '\n'


body = encapsulate('transport', transport_code)
body += encapsulate('native_current', native_code)
body += encapsulate('native_historical', historical_native_code)
body += (HERE / 'cases.inc.cc').read_text(encoding='utf-8')
code = '\n'.join('#include ' + header for header in sorted(includes))
code += '\nnamespace production_event_values {\n' + event_declarations + '\n}\n' + body
cpp = OUT / 'actual-producer-to-native-dispatch.cc'
cpp.write_text(code, encoding='utf-8', newline='\n')
compiler = next((p for p in [shutil.which('clang++'), shutil.which('g++'),
                            r'C:/Program Files/LLVM/bin/clang++.exe',
                            r'C:/Program Files/Microsoft Visual Studio/18/Insiders/VC/Tools/Llvm/x64/bin/clang++.exe']
                 if p and Path(p).is_file()), None)
assert compiler, 'C++17 compiler required'
executions = []
for optimization in ['-O0', '-O2']:
    binary = OUT / ('workflow-' + optimization[1:] + ('.exe' if sys.platform == 'win32' else ''))
    built = subprocess.run([str(compiler), '-std=c++17', optimization, str(cpp), '-o', str(binary)],
                           capture_output=True, text=True)
    (OUT / (optimization[1:] + '-compile.log')).write_text(built.stdout + built.stderr, encoding='utf-8')
    assert built.returncode == 0, built.stderr
    for case in ['current', 'old-producer', 'old-invoke']:
        arguments = [] if case == 'current' else ['--require-' + case + '-denial']
        run = subprocess.run([str(binary)] + arguments, capture_output=True, text=True)
        record = {'optimization': optimization, 'case': case, 'returncode': run.returncode,
                  'stdout': run.stdout, 'stderr': run.stderr}
        executions.append(record)
        (OUT / 'executions.json').write_text(json.dumps(executions, indent=2) + '\n')
        if case == 'current':
            assert run.returncode == 0 and 'actual producer-to-native workflow scenarios passed' in run.stdout, record
        else:
            assert run.returncode == 17 and 'WORKFLOW_REQUIRED_DENIAL_FAILED' in run.stderr and 'creates=1' in run.stderr, record

fixture_inputs = [HERE / 'cases.inc.cc', transport_driver, composite_driver, baseline_driver,
                  REPO / 'build/test_pencil_node_native_invoke.py']
for folder in ['node_precision_transport', 'node_keymap_dispatch', 'node_keymap_baseline', 'node_native_invoke']:
    fixture_inputs.extend(p for p in (REPO / 'build/tests' / folder).rglob('*')
                          if p.is_file() and p.suffix in ['.py', '.cc', '.json'])
report = {'status': 'PASS_BOUNDED_ACTUAL_PRODUCER_TO_NATIVE_DISPATCH',
          'utc': datetime.now(timezone.utc).isoformat(), 'pin': PIN,
          'patch_sha256': sha((REPO / 'patches/blender-ipad.patch').read_bytes()),
          'driver_sha256': sha(Path(__file__).read_bytes()),
          'source_root': str(SOURCE), 'inputs': INPUTS,
          'fixture_sha256': {str(p.relative_to(REPO)): sha(p.read_bytes()) for p in set(fixture_inputs)},
          'generated_cpp_sha256': sha(cpp.read_bytes()), 'executions': executions,
          'original_invoke_body_sha256': sha(old_invoke.encode()),
          'composite_metadata': composite_metadata,
          'native_abi_or_device_claim': False,
          'boundaries': [
              'One compiled program executes actual generated producer/generator/constructor/Trackpad ingestion+merge and actual raw-import/classifier/full regular dispatcher/nonmodal private call slice/full invoke/poll/native View2D bodies.',
              'The bridge copies exact queued type/value/flags/modifier/keymodifier/xy/prev_xy scalars between explicit host structs. Adapter event constants are synchronized to exact pinned declarations. This is not a native wmEvent ABI/layout proof.',
              'Non-Trackpad pointer queue barriers use an explicit host adapter while exact actual GHOST pointer payload/order parity is checked. Native pointer ingestion, node selection/hit/acquisition/history and UIKit scheduling are outside this family.',
              'Mixed hardware-before-Pencil executes actual adjacent Trackpad AND coalescing. Pencil-before-hardware retains its actual paired cursor barrier, so the two native PAN packets remain separate.',
              'Old producer source is the frozen complete original method; old invoke source is the complete immutable pinned method plus an explicitly disclosed signature-only adapter. Historical required-denial failures are expected controls, not a corrected-source fallback.',
              'Native allocation/context/RNA/registry/rendering/timer/cursor and geometry application remain the existing named component adapters. No callback/lifetime/device/geometry/history/Undo acceptance is asserted.',
          ]}
(OUT / 'workflow-report.json').write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')
print(json.dumps({'status': report['status'], 'report': str(OUT / 'workflow-report.json'),
                  'executions': executions}, indent=2))
