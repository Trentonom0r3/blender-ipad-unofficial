"""Connected actual-source transport proof; no target or device claim."""
from pathlib import Path
from datetime import datetime, timezone
import argparse
import ast
import hashlib
import json
import re
import shutil
import subprocess
import sys
import tempfile

FIXTURES = Path(__file__).resolve().parent
parser = argparse.ArgumentParser()
parser.add_argument('--repo', type=Path, default=FIXTURES.parents[2])
parser.add_argument('--source-root', type=Path)
parser.add_argument('--cache-dir', type=Path)
parser.add_argument('--output-dir', type=Path)
options = parser.parse_args()
REPO = options.repo.resolve()
OUT = (options.output_dir or Path(tempfile.mkdtemp(prefix='node-precision-'))).resolve()
OUT.mkdir(parents=True, exist_ok=True)
sys.path.insert(0, str(REPO / 'build'))
import preflight
import test_touch_extrude as touch
PIN = preflight.pinned_commit(REPO)
CACHE = options.cache_dir or REPO / '.cache/preflight'
touch.PIN_ROOT = CACHE / PIN
touch.PATCH_TEXT = (REPO / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
touch.changed_source.cache_clear()
INPUTS = {}


def read(path):
    return path.read_text(encoding='utf-8-sig')


def source(path):
    if options.source_root and (options.source_root / path).is_file():
        value = read(options.source_root / path)
    elif f'diff --git a/{path} b/{path}\n' in touch.PATCH_TEXT:
        needed = dict(preflight.patch_files(touch.PATCH_TEXT))[path]
        if needed:
            preflight.get_source(PIN, path, CACHE, False)
        value = touch.changed_source(path)
    else:
        value = upstream(path)
    INPUTS[path] = value
    return value


def upstream(path):
    # All inputs are the immutable Blender pin, independently of audit artifacts.
    value = preflight.get_source(PIN, path, CACHE, False).decode('utf-8')
    INPUTS['upstream:' + path] = value
    return value


def function(text, marker):
    start = text.index(marker)
    opening = text.index('{', start)
    while ';' in text[start:opening]:
        start = text.index(marker, start + len(marker))
        opening = text.index('{', start)
    depth, end = 1, opening + 1
    while depth:
        depth += (text[end] == '{') - (text[end] == '}')
        end += 1
    return text[start:end]


def between(text, start, end):
    begin = text.index(start)
    return text[begin:text.index(end, begin)]


def replace_once(text, old, new):
    assert text.count(old) == 1, (old[:80], text.count(old))
    return text.replace(old, new, 1)


def typedef(text, name):
    end = text.index('} ' + name + ';') + len('} ' + name + ';')
    start = text.rfind('typedef struct {', 0, end)
    assert start >= 0
    return text[start:end]


def sha(value):
    return hashlib.sha256(value.encode()).hexdigest()


def constructions(text):
    result, cursor = [], 0
    while True:
        start = text.find('new GHOST_EventTrackpad(', cursor)
        if start < 0:
            return result
        opening = text.index('(', start)
        depth, end = 1, opening + 1
        while depth:
            depth += (text[end] == '(') - (text[end] == ')')
            end += 1
        result.append(text[start:end])
        cursor = end


BASELINE = json.loads(read(FIXTURES / 'baseline.json'))
BASE = BASELINE['components']
assert {k: sha(v) for k, v in BASE.items()} == BASELINE['sha256']
IOS = source('intern/ghost/intern/GHOST_WindowIOS.mm')
NAV = source('intern/ghost/GHOST_NavigationIOS.hh')
TYPES = source('intern/ghost/GHOST_Types.h')
TRACKPAD = source('intern/ghost/intern/GHOST_EventTrackpad.hh')
WM = source('source/blender/windowmanager/intern/wm_event_system.cc')
WM_TYPES = source('source/blender/windowmanager/WM_types.hh')
UTIL = upstream('source/blender/blenlib/BLI_utildefines.h')
PAN = function(IOS, '- (void)handlePan:(GHOSTUIPanGestureRecognizer *)sender\n{')
GENERATOR = function(IOS, '- (void)generateUserInputEvents:')
tag_assignment = ('      event_info.physical_pencil_precision_pan =\n'
                  '          sender.state == UIGestureRecognizerStateChanged && [sender pencilContactDown];\n')
assert PAN.replace(tag_assignment, '') == BASE['producer'], 'Producer changed outside exact classification assignment'
generator_extension = '1,\n                                      event_info.physical_pencil_precision_pan));'
assert GENERATOR.replace(generator_extension, '1));') == BASE['generator'], 'Generator changed old packets'
PAYLOAD = typedef(TYPES, 'GHOST_TEventTrackpadData')
assert PAYLOAD.replace('  /** Actual ordinary physical Pencil precision PAN; event-local source class only. */\n  char is_physical_pencil_precision_pan;\n', '') == BASE['payload']
enum = function(WM_TYPES, 'enum eWM_EventFlag') + ';\n'
enum += re.search(r'ENUM_OPERATORS\(eWM_EventFlag, [^)]+\);', WM_TYPES).group() + '\n'
enum_macro = between(UTIL, '#  define ENUM_OPERATORS(_enum_type, _max_enum_value)', '\n#else')
assert 'ENUM_OPERATORS(eWM_EventFlag, WM_EVENT_IS_PENCIL_PRECISION_PAN)' in enum
assert 'WM_EVENT_IS_PENCIL_PRECISION_PAN = (1 << 9)' in enum
merge = function(WM, 'static wmEvent *wm_event_add_trackpad(')
public = function(WM, 'wmEvent *WM_event_add(')
intern = function(WM, 'static wmEvent *wm_event_add_intern(')
simulate = function(WM, 'wmEvent *WM_event_add_simulate(')
branch = between(WM[WM.index('void wm_event_add_ghostevent('):], '    case GHOST_kEventTrackpad: {', '    /* Multi-touch. */')
state_reset = between(WM[WM.index('void wm_event_add_ghostevent('):], '  event = *event_state;', '  event.ipad_hud_generation')
assert state_reset == '  event = *event_state;\n  event.flag = (eWM_EventFlag)0;\n'
assert 'const eWM_EventFlag event_state_flag_mask = WM_EVENT_IS_REPEAT;' in WM

# Reuse the retained explicit UIKit/message/storage adapter, replacing every
# relevant producer/constructor/generator declaration with current actual source.
code = read(FIXTURES / 'host_models.inc.cc')
assert sha(code) == BASELINE['host_models_origin']['frozen_prefix_sha256']
old_nav = between(code, '/* SPDX-License-Identifier: GPL-2.0-or-later */', '}  // namespace ghost::ios') + '}  // namespace ghost::ios'
code = replace_once(code, old_nav, NAV.replace('#pragma once', ''))
code = replace_once(code, 'struct GHOST_TEventTrackpadData { int subtype,x,y,deltaX,deltaY;bool isDirectionInverted;int numFingers; };',
                    'using GHOST_TTrackpadEventSubTypes=int; using uint=unsigned int;\n' + PAYLOAD)
start = code.index('struct GHOST_EventTrackpad:GHOST_Event')
end = code.index('struct GHOST_EventKey:', start)
code = code[:start] + function(TRACKPAD, 'class GHOST_EventTrackpad :') + ';\n' + code[end:]
actual_user = function(IOS, 'typedef struct UserInputEvent')
actual_user = actual_user[:actual_user.index('  NSString *getEventTypeDesc(')] + '} UserInputEvent;'
code = replace_once(code, function(code, 'typedef struct UserInputEvent') + ' UserInputEvent;', actual_user)
g = GENERATOR[GENERATOR.index('    const GHOST_TabletData event_tablet ='):GENERATOR.rfind('  }\n}')]
g = re.sub(r'      IOS_INPUT_LOG\([\s\S]*?\);\n', '', g).replace('FALSE', 'false')
code = replace_once(code, function(code, 'void generateUserInputEvents('),
                    'void generateUserInputEvents(const UserInputEvent &event_info) {\n' + g + '\n}')
old_sender = function(code, 'struct Sender {') + ';'
sender = old_sender.replace('bool pencil=true;', 'bool pencil=true; bool omit_knife=false; ghost::ios::GestureContact gesture_contact;')
method = function(IOS, '- (BOOL)pencilContactDown')
method = method.replace('- (BOOL)pencilContactDown', 'bool pencilContactDown()')
sender = sender.replace(' Sender(){', ' void recognizeKnifePan(){} bool omitKnifePairedPan(){return omit_knife;}\n' + method + '\n Sender(){')
code = replace_once(code, old_sender, sender)
touch_device = function(IOS, 'static ghost::ios::TouchDevice ios_touch_device(')
touch_device = touch_device.replace('touch.type', 'touch->type')
code += '\nenum{UITouchTypeDirect=1,UITouchTypePencil,UITouchTypeIndirect,UITouchTypeIndirectPointer};\nstruct UITouch{int type=UITouchTypePencil;};\n' + touch_device
legacy_ast = ast.parse(read(REPO / 'build/test_pencil_pan_paint_producer.py'))
translations = next(ast.literal_eval(n.value) for n in legacy_ast.body if isinstance(n, ast.Assign)
                    and any(isinstance(t, ast.Name) and t.id == 'TRANSLATIONS' for t in n.targets))
translations['[sender pencilContactDown]'] = 'sender.pencilContactDown()'


def translate_pan(body, name):
    result = body.replace('- (void)handlePan:(GHOSTUIPanGestureRecognizer *)sender', 'void ' + name + '(Sender &sender)')
    for old, new in translations.items():
        result = result.replace(old, new)
    assert '[sender ' not in result and '[self ' not in result
    return result


code += '\n' + translate_pan(PAN, 'producer') + '\n' + translate_pan(BASE['producer'], 'producer_old')
code += '\n' + enum_macro + '\n' + enum
code += read(FIXTURES / 'queue_models.inc.cc')
code += '\n' + intern + '\n' + public + '\n' + simulate + '\n' + merge
code += '\n' + BASE['merge'].replace('wm_event_add_trackpad(', 'wm_event_add_trackpad_old(', 1)
code += '\n' + BASE['public_enqueue'].replace('WM_event_add(', 'WM_event_add_old(', 1)
code += '\nvoid ingest(wmWindow *win,const GHOST_Event *packet,bool old=false) {\n wmEvent event; wmEvent *event_state=win->eventstate;\n' + state_reset
code += '\n switch(packet->type){\n' + branch.replace('          customdata);', '          packet->data_);')
code += '\n default: break; }\n}\n'
old_branch = BASE['trackpad_branch'].replace('          customdata);', '          packet->data_);')
code += '\nvoid ingest_old(wmWindow *win,const GHOST_Event *packet) {\n wmEvent event; wmEvent *event_state=win->eventstate;\n' + state_reset
code += '\n switch(packet->type){\n' + old_branch + '\n default: break; }\n}\n'
code += read(FIXTURES / 'scenarios.inc.cc')
path = OUT / 'actual-node-precision-transport.cc'
path.write_text(code, encoding='utf-8', newline='\n')
compiler = next((Path(p) for p in [shutil.which('clang++'), shutil.which('g++'), r'C:/Program Files/LLVM/bin/clang++.exe',
                                  r'C:/Program Files/Microsoft Visual Studio/18/Insiders/VC/Tools/Llvm/x64/bin/clang++.exe']
                 if p and Path(p).is_file()), None)
assert compiler, 'C++17 compiler required'
runs = []
cases = {'producer': None, 'constructor': None, 'queue': None, 'replay': None,
         'old-producer': 'positive == 1', 'old-ingestion': 'positive == 1',
         'old-merge': '!tagged', 'old-replay': '!tagged'}
for optimization in ['-O0', '-O2']:
    exe = OUT / ('transport-' + optimization[1:] + '.exe')
    result = subprocess.run([str(compiler), '-std=c++17', optimization, '-Wall', '-Wextra', str(path), '-o', str(exe)], capture_output=True, text=True)
    (OUT / (optimization[1:] + '-compile.log')).write_text(result.stdout + result.stderr)
    assert result.returncode == 0, result.stderr
    for case, expected in cases.items():
        result = subprocess.run([str(exe), case], capture_output=True, text=True)
        run = {'optimization': optimization, 'case': case, 'returncode': result.returncode,
               'stdout': result.stdout, 'stderr': result.stderr, 'expected_failure': expected}
        runs.append(run)
        (OUT / 'runs.json').write_text(json.dumps(runs, indent=2) + '\n')
        if expected:
            assert result.returncode != 0 and expected in result.stderr, run
        else:
            assert result.returncode == 0, run

# Compile untouched full production headers, with only the allocator dependency
# stubbed. This detects incomplete/invalid header extracts and ABI drift.
header_dir = OUT / 'headers'
header_dir.mkdir(exist_ok=True)
for rel in ['intern/ghost/GHOST_Types.h', 'intern/ghost/GHOST_IEvent.hh',
            'intern/ghost/intern/GHOST_Event.hh', 'intern/ghost/intern/GHOST_EventTrackpad.hh']:
    (header_dir / Path(rel).name).write_text(source(rel), encoding='utf-8', newline='\n')
(header_dir / 'MEM_guardedalloc.h').write_text('#pragma once\nusing uint=unsigned int;\n#define MEM_CXX_CLASS_ALLOC_FUNCS(...)\n')
header_code = '#include "GHOST_EventTrackpad.hh"\n#include <cassert>\n#include <cstddef>\nint main(){\n'
header_code += ('static_assert(sizeof(GHOST_TEventTrackpadData)==28);\n'
                'static_assert(alignof(GHOST_TEventTrackpadData)==4);\n'
                'static_assert(offsetof(GHOST_TEventTrackpadData,isDirectionInverted)==20);\n'
                'static_assert(offsetof(GHOST_TEventTrackpadData,is_physical_pencil_precision_pan)==21);\n'
                'static_assert(offsetof(GHOST_TEventTrackpadData,numFingers)==24);\n')
for args in ['false', 'true, 1', 'false, 2', 'true, 3']:
    header_code += '{GHOST_EventTrackpad e(1,nullptr,GHOST_kTrackpadEventScroll,10,20,3,-4,' + args + ');auto*p=static_cast<const GHOST_TEventTrackpadData*>(e.getData());assert(p->is_physical_pencil_precision_pan==0);}\n'
header_code += '{GHOST_EventTrackpad e(1,nullptr,GHOST_kTrackpadEventScroll,10,20,3,-4,false,1,true);auto*p=static_cast<const GHOST_TEventTrackpadData*>(e.getData());assert(p->is_physical_pencil_precision_pan==1);}\n}\n'
backend_calls = []
for rel, count in [('intern/ghost/intern/GHOST_SystemCocoa.mm', 4),
                   ('intern/ghost/intern/GHOST_SystemWayland.cc', 3),
                   ('intern/ghost/intern/GHOST_SystemWin32.cc', 2)]:
    calls = constructions(upstream(rel))
    assert len(calls) == count, (rel, len(calls))
    backend_calls += calls
ios_calls = constructions(IOS)
assert len(ios_calls) == 6
backend_calls += ios_calls[-2:]
backend_models = r'''
#define UNPACK2(a) a[0],a[1]
#define system system_ptr
struct Sys {uint64_t getMilliSeconds(){return 9;}} sys_object;
Sys*system=&sys_object,*sys=&sys_object;
uint64_t getMessageTime(Sys*){return 9;}
uint64_t GHOST_GetMilliSeconds(GHOST_SystemHandle){return 9;}
int wl_fixed_to_int(int value){return value;}
void actual_backend_calls(){
 GHOST_IWindow *window=nullptr,*win=nullptr,*active_window=nullptr;
 struct {double timestamp=2,magnification=.2,rotation=.3;bool isDirectionInvertedFromDevice=true;}event;
 struct{double x=3,y=-4;}delta;
 struct{int x=3,y=-4,scale=5;bool isScrollDirectionInverted=true;}trackpad_info;
 struct{bool has_event_ms=true;uint64_t event_ms=9;int smooth_xy[2]{3,-4};bool inverted_xy[2]{false,true};}ps;
 struct{Sys*system=&sys_object;}seat_object;auto*seat=&seat_object;
 uint64_t event_ms=9;int event_xy[2]{10,20},x=10,y=20,cursor_x=10,cursor_y=20;
 int scale_as_delta_px=3,rotation_as_delta_px=4,pddx=3,pddy=4;
 struct{double x=10,y=20;}touch_point;
 struct{double mouse_cursor_x=10,mouse_cursor_y=20;}sender;auto*s=&sender;
 double dx=3,dy=4,oscale=1,pk=1;
 CALLS
}
'''
backend_body = '\n'.join('{auto*e=' + call + ';auto*p=static_cast<const GHOST_TEventTrackpadData*>(e->getData());assert(p->is_physical_pencil_precision_pan==0);delete e;}' for call in backend_calls)
header_code = header_code.replace('int main(){', backend_models.replace('CALLS', backend_body) + '\nint main(){actual_backend_calls();')
header_path = OUT / 'full-header-layout.cc'
header_path.write_text(header_code, encoding='utf-8')
header_runs = []
for optimization in ['-O0', '-O2']:
    exe = OUT / ('headers-' + optimization[1:] + '.exe')
    result = subprocess.run([str(compiler), '-std=c++17', optimization, '-I', str(header_dir), str(header_path), '-o', str(exe)], capture_output=True, text=True)
    (OUT / (optimization[1:] + '-headers-compile.log')).write_text(result.stdout + result.stderr)
    assert result.returncode == 0, result.stderr
    result = subprocess.run([str(exe)], capture_output=True, text=True)
    assert result.returncode == 0, result.stderr
    header_runs.append({'optimization': optimization, 'returncode': result.returncode})

# The historical public header set is independently compile-valid for its exact
# old callers. Its deliberate missing-source-byte failure is then checked using
# the unchanged new assertion body, rather than a malformed fixture.
historical_dir = OUT / 'historical-headers'
historical_dir.mkdir(exist_ok=True)
for item in header_dir.iterdir():
    if item.is_file():
        (historical_dir / item.name).write_bytes(item.read_bytes())
(historical_dir / 'GHOST_Types.h').write_text(TYPES.replace(PAYLOAD, BASE['payload']), encoding='utf-8', newline='\n')
(historical_dir / 'GHOST_EventTrackpad.hh').write_text(BASE['constructor'], encoding='utf-8', newline='\n')
old_body = backend_models.replace('CALLS', '\n'.join('{auto*e=' + call + ';delete e;}' for call in backend_calls))
old_header = OUT / 'historical-valid-headers.cc'
old_header.write_text('#include "GHOST_EventTrackpad.hh"\n#include <cstddef>\n' + old_body +
                      '\nint main(){static_assert(sizeof(GHOST_TEventTrackpadData)==28);static_assert(offsetof(GHOST_TEventTrackpadData,numFingers)==24);actual_backend_calls();}\n', encoding='utf-8')
old_header_controls = []
for optimization in ['-O0', '-O2']:
    exe = OUT / ('historical-headers-' + optimization[1:] + '.exe')
    valid = subprocess.run([str(compiler), '-std=c++17', optimization, '-I', str(historical_dir), str(old_header), '-o', str(exe)], capture_output=True, text=True)
    assert valid.returncode == 0, valid.stderr
    result = subprocess.run([str(exe)], capture_output=True, text=True)
    assert result.returncode == 0, result.stderr
    negative = subprocess.run([str(compiler), '-std=c++17', optimization, '-I', str(historical_dir), str(header_path), '-o', str(exe)], capture_output=True, text=True)
    assert negative.returncode != 0 and 'is_physical_pencil_precision_pan' in negative.stderr, negative.stderr
    (OUT / (optimization[1:] + '-historical-missing-field.log')).write_text(negative.stdout + negative.stderr)
    old_header_controls.append({'optimization': optimization, 'old_callers_valid': True,
                                'missing_source_field_returncode': negative.returncode,
                                'expected_failure': 'is_physical_pencil_precision_pan'})

report = {'status': 'PASS_BOUNDED_CONNECTED_TRANSPORT', 'utc': datetime.now(timezone.utc).isoformat(),
          'driver_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
          'source_root': str(options.source_root) if options.source_root else 'authoritative overlay',
          'old_fields_and_packets_exact': True, 'inputs': {k: sha(v) for k, v in INPUTS.items()},
          'fixture_sha256': {str(p.relative_to(REPO)): hashlib.sha256(p.read_bytes()).hexdigest()
                             for p in [FIXTURES / 'baseline.json', FIXTURES / 'queue_models.inc.cc',
                                       FIXTURES / 'scenarios.inc.cc', FIXTURES / 'host_models.inc.cc',
                                       REPO / 'build/test_pencil_pan_paint_producer.py']},
          'generated_source_sha256': sha(code), 'runs': runs, 'header_runs': header_runs,
          'actual_default_backend_calls': len(backend_calls),
          'old_header_controls': old_header_controls,
          'boundaries': ['Actual source method bodies and constructor execute with named C++ UIKit/message adapters; no UIKit scheduler or target SDK execution.',
                         'Actual GHOST payload and event headers compile intact with an allocator macro stub; host size/offset proof only, target ABI remains untested.',
                         'WM Trackpad branch, transient flag reset, internal/public enqueue, simulation and coalescer execute; list allocation/scheduling/context/window coordinate transforms use explicit bounded adapters.',
                         'Denial-only physical source class; no accepted DOWN, identity continuity, lease, current owner or complete mixed-stream protection.',
                         'No native build, simulator, target binary, device, graph edit/history/Undo or geometry acceptance from this component test.']}
(OUT / 'report.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps({'status': report['status'], 'runs': len(runs), 'report': str(OUT / 'report.json')}, indent=2))
