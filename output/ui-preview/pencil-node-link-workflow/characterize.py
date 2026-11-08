"""Output-only bounded Node link source characterization; no acceptance test registration."""
from pathlib import Path
import ast,datetime,hashlib,json,re,shutil,subprocess,sys
REPO=Path(__file__).resolve().parents[3]
OUT=Path(__file__).resolve().parent
sys.path.insert(0,str(REPO/'build'))
import preflight
import test_touch_extrude as touch
PIN=preflight.pinned_commit(REPO)
PATCH=(REPO/'patches/blender-ipad.patch').read_text(encoding='utf-8')
INPUTS={}
EXTRACTS={}
def sha(b):return hashlib.sha256(b).hexdigest()
def src(p):
 b=preflight.get_source(PIN,p,REPO/'.cache/preflight',False) if f'diff --git a/{p} b/{p}\n' not in PATCH else touch.changed_source(p).encode()
 INPUTS[p]=sha(b)
 return b.decode().replace('\r\n','\n')
def function(s,marker):
 start=s.index(marker);op=s.index('{',start)
 while ';' in s[start:op]:
  start=s.index(marker,start+len(marker));op=s.index('{',start)
 depth=1;end=op+1
 while depth:
  depth+=(s[end]=='{')-(s[end]=='}');end+=1
 return s[start:end]
def get(s,marker):
 v=function(s,marker);EXTRACTS[marker]={'sha256':sha(v.encode()),'bytes':len(v)};return v
# Execute only the existing transport driver's source-generation prefix. No tests,
# compile, scenario generator, queue models or registered acceptance tests are invoked.
# The existing generation prefix does execute static source/parity assertions.
driver=REPO/'build/tests/node_precision_transport/run_connected.py';tree=ast.parse(driver.read_text())
stop=next(i for i,n in enumerate(tree.body) if isinstance(n,ast.AugAssign) and 'queue_models.inc.cc' in ast.unparse(n.value))
ns={'__file__':str(driver),'__name__':'read_only_producer_generation'};argv=sys.argv
try:
 sys.argv=[str(driver),'--repo',str(REPO),'--output-dir',str(OUT/'producer-generation')]
 exec(compile(ast.Module(body=tree.body[:stop],type_ignores=[]),str(driver),'exec'),ns)
finally:sys.argv=argv
transport=ns['code']
# Replace frozen fixture cursor/button class bodies with actual current class bodies.
for cls,path in [('GHOST_EventCursor','intern/ghost/intern/GHOST_EventCursor.hh'),('GHOST_EventButton','intern/ghost/intern/GHOST_EventButton.hh')]:
 current=src(path);old=function(transport,'class '+cls+' :')+';';new=get(current,'class '+cls+' :')+';';assert transport.count(old)==1;transport=transport.replace(old,new,1)
wm=src('source/blender/windowmanager/intern/wm_event_system.cc');query=src('source/blender/windowmanager/intern/wm_event_query.cc');node=src('source/blender/editors/space_node/node_relationships.cc');poll=src('source/blender/editors/screen/screen_ops.cc');types=src('source/blender/windowmanager/WM_types.hh')
parts=[]
for marker in ['static void wm_region_mouse_co(', 'static bool wm_event_is_double_click(', 'static void wm_event_prev_values_set(', 'static void wm_event_prev_click_set(', 'static void wm_event_state_update_and_click_set_ex(']:
 if marker!='static bool wm_event_is_double_click(':parts.append(get(wm,marker))
# Queries must precede the actual double-click/update body declarations.
parts=[get(query,m) for m in ['int WM_event_drag_threshold(', 'bool WM_event_drag_test_with_delta(', 'bool WM_event_drag_test(', 'void WM_event_drag_start_mval(']]+parts
# Preserve actual double-click algorithm even though connected samples disable it.
i=next(i for i,p in enumerate(parts) if 'static void wm_event_state_update_and_click_set_ex(' in p)
parts.insert(i,get(wm,'static bool wm_event_is_double_click('))
view=src('source/blender/editors/interface/view2d/view2d.cc');node_intern=src('source/blender/editors/space_node/node_intern.hh');padding_function=function(src('source/blender/editors/space_node/node_edit.cc'),'bNodeSocket *node_find_indicated_socket(');padding_prefix=padding_function[padding_function.index('  const float view2d_scale'):padding_function.index('  bNodeTree &tree')];EXTRACTS['exact native socket finder padding prefix']={'sha256':sha(padding_prefix.encode()),'bytes':len(padding_prefix)};parts.append(get(view,'float UI_view2d_scale_get_x('));parts.append(re.search(r'^#define NODE_SOCKSIZE .+$',node_intern,re.M).group());parts.append('static std::array<float,2> actual_socket_padding(ARegion &region) {\n'+padding_prefix+'  return {max_distance,padded_socket_size};\n}');
parts += [get(poll,'bool ED_operator_node_editable('),get(node,'static bool dragged_links_are_detached('),get(node,'static bool should_create_drag_link_search_menu('),get(node,'static bool need_drag_link_tooltip('),get(node,'static void node_link_cancel('),get(node,'enum class NodeLinkAction :')+';',get(node,'static wmOperatorStatus node_link_modal('),get(node,'static wmOperatorStatus node_link_invoke('),get(wm,'static void wm_event_modalkeymap_begin('),get(wm,'static void wm_event_modalkeymap_end(')]
call=function(wm,'static eHandlerActionFlag wm_handler_operator_call(');start=call.index('      wmEvent_ModalMapStore event_backup;');end=call.index('\n    }\n    else {',start);status=call[start:end];EXTRACTS['derived modal call through normal terminal cleanup slice']={'sha256':sha(status.encode()),'bytes':len(status)}
handlers=get(wm,'static eHandlerActionFlag wm_handlers_do(')
events=src('source/blender/windowmanager/wm_event_types.hh');events=events[:events.index('enum eEventType_Mask {')].replace('#pragma once','').replace('enum wmEventType :','enum pinned_wmEventType :')
adapters=(OUT/'characterization-adapters.cc').read_text(encoding='utf-8-sig');adapters=adapters.replace('SOURCE_BODIES','\n\n'.join(parts)).replace('HANDLERS_BODY',handlers).replace('STATUS_BODY',status)
adapters=adapters.replace('namespace native_link {','namespace native_link {\n'+events,1)
# Standard C++ includes must remain outside fixture namespaces.
includes=set(re.findall(r'^\s*#\s*include\s*(<[^>]+>)\s*$',transport+'\n'+adapters,re.M))
transport=re.sub(r'^\s*#\s*include\s*<[^>]+>\s*$','',transport,flags=re.M)
adapters=re.sub(r'^\s*#\s*include\s*<[^>]+>\s*$','',adapters,flags=re.M)
macros=set(re.findall(r'^\s*#\s*define\s+(\w+)',transport,re.M))
code='\n'.join('#include '+i for i in sorted(includes))+'\nnamespace transport {\n'+transport+'\n}\n'+'\n'.join('#undef '+m for m in sorted(macros))+'\n'+adapters
cpp=OUT/'actual-node-link-characterization.cc';cpp.write_bytes(code.encode())
compiler=next((p for p in [shutil.which('clang++'),shutil.which('g++'),'C:/Program Files/LLVM/bin/clang++.exe','C:/Program Files/Microsoft Visual Studio/18/Insiders/VC/Tools/Llvm/x64/bin/clang++.exe'] if p and Path(p).is_file()),None)
assert compiler
runs=[]
for opt in ['-O0','-O2']:
 binary=OUT/('characterization-'+opt[1:]+'.exe');r=subprocess.run([compiler,'-std=c++17',opt,str(cpp),'-o',str(binary)],capture_output=True,text=True);(OUT/(opt[1:]+'-compile.log')).write_text(r.stdout+r.stderr)
 if r.returncode:
  print(r.stderr[:20000]);sys.exit(r.returncode)
 r=subprocess.run([str(binary)],capture_output=True,text=True);run={'optimization':opt,'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr};runs.append(run);(OUT/'characterization-executions.json').write_text(json.dumps(runs,indent=2)+'\n')
 if r.returncode:print(json.dumps(run,indent=2));sys.exit(r.returncode)
report={'status':'PASS_BOUNDED_SOURCE_CHARACTERIZATION; NOT END_TO_END_GRAPH_HISTORY_PROOF','utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'pin':PIN,'production_patch_sha256':sha((REPO/'patches/blender-ipad.patch').read_bytes()),'driver_sha256':sha(Path(__file__).read_bytes()),'adapter_sha256':sha((OUT/'characterization-adapters.cc').read_bytes()),'generated_cpp_sha256':sha(cpp.read_bytes()),'inputs':INPUTS,'source_extracts':EXTRACTS,'producer_generation_input_hashes':{p:sha(v.encode()) for p,v in ns['INPUTS'].items()},'executions':runs,'boundaries':['Actual current ordinary handlePan producer, UserInputEvent, generator and current cursor/button/trackpad class bodies execute with message-syntax/SDK-object adapters. UIKit callbacks and real recognition thresholds do not execute.','Packet-to-WM bridge is explicitly modeled for single-window no-emulation untagged pointer scalars and top-left fixture conversion. It invokes actual WM press/click state function; it is NOT full wm_event_add_ghostevent execution or target coordinate/ABI proof.','Actual complete wm_handlers_do executes with its intern dispatcher replaced by a recorded exact-stock-binding corridor; actual editable poll condition, WM_event_drag_start_mval and native node_link_invoke execute. Operator allocation/registration, native keymap matching and native node_link_init/socket graph acquisition are explicit boundaries.','Actual node_link_modal, detached/search policy and node_link_cancel execute; native socket lookup, graph commit/search-popup creation, invariants and edge pan effects are explicit recorded boundaries. No BKE graph algorithm is imitated.','The exact native derived modal-call/normal terminal cleanup slice executes including actual modalmap begin/end with evaluated-binding matcher adapter, report/Finished-versus-free/unlink/handler branches. wm_operator_finished, graph mutation, registry, Undo/Redo and actual allocation/lifetimes are instrumented boundaries.','Native socket max-distance/padded-size prefix and actual UI_view2d_scale_get_x execute under supplied View2D/U.widget_unit fixtures. Full native nearest-socket/visibility/occlusion/header/multi-input selection does not execute.',
 'The original first compiler diagnostic and first runtime diagnostic are retained. The runtime failure was the explicit context adapter failing to restore original modal region after native cleanup cleared C.region; only that adapter was repaired. It is not a target or native application crash.',
 'No new registered acceptance tests, production/CI edits, target build, stock5.1.2 execution, iOS SDK execution or device acceptance.','No corrective proposal follows these supplied-sample branches. The exact native socket finder/real BKE/GUI/history baseline remains necessary before a user-facing gap is asserted.']}
(OUT/'characterization-report.json').write_bytes((json.dumps(report,indent=2)+'\n').encode());print(json.dumps({'status':report['status'],'runs':runs,'report':str(OUT/'characterization-report.json')},indent=2))
