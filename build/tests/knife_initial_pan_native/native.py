"""Execute real native profile/factory/context bodies in a bounded C++17 link probe."""
from pathlib import Path
import argparse, hashlib, json, os, re, shutil, subprocess, sys
p=argparse.ArgumentParser();p.add_argument('--repo',type=Path,required=True);p.add_argument('--source-root',type=Path);p.add_argument('--cache-dir',type=Path);p.add_argument('--output-dir',type=Path,required=True);a=p.parse_args()
REPO=a.repo.resolve();OUT=a.output_dir.resolve();OUT.mkdir(parents=True,exist_ok=True);HERE=Path(__file__).resolve().parent
sys.path.insert(0,str(REPO/'build'));import preflight,test_touch_extrude as touch
PIN=preflight.pinned_commit(REPO);CACHE=(a.cache_dir or REPO/'.cache/preflight').resolve();touch.PIN_ROOT=CACHE/PIN;touch.PATCH_TEXT=(REPO/'patches/blender-ipad.patch').read_text(encoding='utf-8');touch.changed_source.cache_clear()
BASE={};SOURCES={};HASHES={};SLICES={}
def sha(s):return hashlib.sha256(s.encode()).hexdigest()
def source(path):
 if path in SOURCES:return SOURCES[path]
 base=preflight.get_source(PIN,path,CACHE,False).decode();BASE[path]=base
 changed=f'diff --git a/{path} b/{path}\n' in touch.PATCH_TEXT
 current=touch.changed_source(path) if changed else base
 if a.source_root and changed:assert (a.source_root/path).is_file(),path+' missing from explicit current source root'
 if a.source_root and (a.source_root/path).is_file():
  actual=(a.source_root/path).read_text(encoding='utf-8');assert actual==current,path+' differs from current overlay'
 SOURCES[path]=current;HASHES[path]=sha(current);return current
# Mask non-code so braces in messages/comments cannot truncate actual bodies.
def body(s,signature):
 start=s.index(signature);masked=re.sub(r'/\*[\s\S]*?\*/|//[^\n]*|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'',lambda m:' '*len(m[0]),s)
 opening=masked.index('{',start);depth=0
 for i in range(opening,len(s)):
  depth+=(masked[i]=='{')-(masked[i]=='}')
  if depth==0:return s[start:i+1]
 raise ValueError(signature)
def pick(key,s,sig):
 value=body(s,sig);SLICES[key+'::'+sig]=sha(value);return value
paths={'knife':'source/blender/editors/mesh/editmesh_knife.cc','zoom':'source/blender/editors/space_view3d/view3d_navigate_view_zoom.cc','nav':'source/blender/editors/space_view3d/view3d_navigate.cc','mesh_header':'source/blender/editors/include/ED_mesh.hh','view_header':'source/blender/editors/include/ED_view3d.hh','wm':'source/blender/windowmanager/intern/wm_event_system.cc','wmtypes':'source/blender/windowmanager/WM_types.hh','dna':'source/blender/makesdna/DNA_windowmanager_types.h','list':'source/blender/makesdna/DNA_listBase.h','listapi':'source/blender/blenlib/BLI_listbase.h','rna':'source/blender/makesrna/RNA_types.hh','context':'source/blender/blenkernel/intern/context.cc','context_header':'source/blender/blenkernel/BKE_context.hh','screen':'source/blender/editors/screen/screen_ops.cc','status':'source/blender/makesdna/DNA_windowmanager_enums.h','viewdna':'source/blender/makesdna/DNA_view3d_types.h','util':'source/blender/blenlib/BLI_utildefines.h','nav_header':'source/blender/editors/space_view3d/view3d_navigate.hh','props':'source/blender/windowmanager/intern/wm_operator_props.cc','factory':'source/blender/windowmanager/intern/wm_operator_type.cc'}
s={key:source(path) for key,path in paths.items()}
for key,name in [('zoom','ED_view3d_native_zoom_type_is'),('knife','ED_mesh_knife_modal_navigation_may_be_denied')]:assert 'bool '+name+'(' in s[key]
assert '#include "ED_view3d.hh"' in s['zoom'] and '#include "ED_view3d.hh"' in s['wm']
assert s['view_header'].index('struct wmOperatorType;') < s['view_header'].index('bool ED_view3d_native_zoom_type_is(')
# Source-backed CMake route; no host SDK/link-closure claim beyond this graph.
cmake_paths=['source/creator/CMakeLists.txt','source/blender/windowmanager/CMakeLists.txt','source/blender/blenkernel/CMakeLists.txt','source/blender/makesrna/intern/CMakeLists.txt','source/blender/editors/space_api/CMakeLists.txt','source/blender/editors/space_view3d/CMakeLists.txt','source/blender/editors/mesh/CMakeLists.txt','source/blender/editors/CMakeLists.txt','build_files/cmake/macros.cmake']
cmake={path:source(path) for path in cmake_paths}
checks=[(cmake_paths[0],'PRIVATE bf::windowmanager'),(cmake_paths[1],'PRIVATE bf::blenkernel'),(cmake_paths[2],'  bf_rna\n'),(cmake_paths[3],'  bf_editor_space_api\n'),(cmake_paths[3],'  bf_editor_mesh\n'),(cmake_paths[4],'  bf_editor_space_view3d\n'),(cmake_paths[5],'  view3d_navigate_view_zoom.cc\n'),(cmake_paths[5],'blender_add_lib(bf_editor_space_view3d'),(cmake_paths[6],'  editmesh_knife.cc\n'),(cmake_paths[6],'blender_add_lib(bf_editor_mesh'),(cmake_paths[7],'  add_subdirectory(space_view3d)'),(cmake_paths[8],'    blender_link_libraries(${name} "${library_deps}")')]
for path,literal in checks:assert literal in cmake[path],(path,literal)
link_contract={'creator_to_view3d_route':['blender','bf::windowmanager','bf::blenkernel','bf_rna','bf_editor_space_api','bf_editor_space_view3d'],'mesh_route':['bf_rna','bf_editor_mesh'],'source_anchors':[{'path':path,'line':cmake[path][:cmake[path].index(literal)].count('\n')+1,'literal':literal.strip()} for path,literal in checks],'limit':'Actual source-backed dependency edges; no full CMake configure, native SDK or whole-link closure proof.'}
# Relevant authentic public declarations are included in two independent TUs.
forwards='\n'.join(sorted(set(re.findall(r'^struct \w+;',s['mesh_header']+s['view_header'],re.M))))
def declaration(text,name):
 value=re.search(r'^bool '+name+r'\([^;]+;',text,re.M)[0];SLICES['public:declaration::'+name]=sha(value);return value
public='#pragma once\n'+forwards+'\n'+pick('public:origin',s['mesh_header'],'struct MeshKnifeModalOrigin {')+';\n'
for text,name in [(s['view_header'],'ED_view3d_native_zoom_type_is'),(s['mesh_header'],'ED_mesh_knife_modal_type'),(s['mesh_header'],'ED_mesh_knife_modal_origin'),(s['mesh_header'],'ED_mesh_knife_modal_navigation_may_be_denied')]:public+=declaration(text,name)+'\n'
(OUT/'public.hh').write_text(public,encoding='utf-8',newline='\n')
macro_lines=s['util'].splitlines();macro_start=next(i for i,line in enumerate(macro_lines) if line.startswith('#  define ENUM_OPERATORS('));macro_selected=[]
for line in macro_lines[macro_start:]:
 macro_selected.append(line)
 if not line.endswith('\\'):break
macro='\n'.join(macro_selected)
# The macro extraction includes exact continuing lines and no algorithm rewrite.
decls=macro+'\n'+pick('decl:status',s['status'],'enum wmOperatorStatus {')+';\nENUM_OPERATORS(wmOperatorStatus,OPERATOR_INTERFACE);\n'
decls+=pick('decl:list',s['list'],'typedef struct ListBase {')+' ListBase;\n'
for name in ['StructCallbackFunc','StructFreeFunc']:decls+=re.search(r'using '+name+r' = [\s\S]*?;',s['rna'])[0]+'\n'
decls+=pick('decl:extension',s['rna'],'struct ExtensionRNA {')+';\n'
decls+='#ifdef WITH_APPLE_CROSSPLATFORM\n'+pick('decl:iduse',s['wmtypes'],'enum class eWMOperatorIDUse')+';\n#endif\n'
decls+=pick('decl:operator_type',s['wmtypes'],'struct wmOperatorType {')+';\n'
decls+=pick('decl:operator',s['dna'],'typedef struct wmOperator {')+' wmOperator;\n'
decls+=pick('decl:macro',s['dna'],'typedef struct wmOperatorTypeMacro {')+' wmOperatorTypeMacro;\n'
decls+=pick('decl:view_context',s['view_header'],'struct ViewContext {')+';\n'
decls+=pick('decl:poll_message',s['context_header'],'struct bContextPollMsgDyn_Params {')+';\n'
decls+=pick('decl:context',s['context'],'struct bContext {')+';\n'
decls+=pick('decl:operator_flags',s['wmtypes'][s['wmtypes'].index('/** #wmOperatorType.flag */'):],'enum {')+';\n'
decls+=pick('decl:knife_mode',s['knife'],'enum KnifeMode')+';\n'
for marker in ['enum {\n  KNF_CONSTRAIN_ANGLE_MODE_NONE','enum {\n  KNF_MEASUREMENT_NONE']:
 decls+=pick('decl:'+marker,s['knife'],marker)+';\n'
for marker,name in [('enum eV3D_OpPropFlag','eV3D_OpPropFlag'),('enum eV3D_OpEvent',''),('enum eViewOpsFlag','eViewOpsFlag')]:
 decls+=pick('decl:'+marker,s['nav_header'],marker)+';\n'
 if name:decls+='ENUM_OPERATORS('+name+', '+('V3D_OP_PROP_USE_MOUSE_INIT' if name=='eV3D_OpPropFlag' else 'VIEWOPS_FLAG_INIT_ZFAC')+');\n'
decls+=pick('decl:viewops',s['nav_header'],'struct ViewOpsType {')+';\n'
decls+=pick('decl:enumitem',s['rna'],'struct EnumPropertyItem {')+';\n'
locks='enum {\n  /**\n   * Used to lock axis views';decls+=pick('decl:locks',s['viewdna'],locks)+';\n'+re.search(r'^#define RV3D_LOCK_FLAGS[^\n]+',s['viewdna'],re.M)[0]+'\n'
models=(HERE/'models.inc.hh').read_text(encoding='utf-8-sig').replace('NATIVE_DECLARATIONS',decls).replace('struct ARegion;','struct ID;struct ARegion;',1)
(OUT/'native-types.hh').write_text(models,encoding='utf-8',newline='\n')
def definitions(historical=False):
 code='#include "public.hh"\n#include "native-types.hh"\n'
 def add(key,sig):
  nonlocal code;code+='\n'+pick(key,s[key],sig)+'\n'
 add('context','void *CTX_py_dict_get(');add('context','static void *ctx_wm_python_context_get(')
 for sig in ['ScrArea *CTX_wm_area(','ARegion *CTX_wm_region(','RegionView3D *CTX_wm_region_view3d(','void CTX_wm_operator_poll_msg_clear(','void CTX_wm_operator_poll_msg_set(']:add('context',sig)
 add('screen','bool ED_operator_region_view3d_active(');add('nav','static bool view3d_navigation_poll_impl(');add('nav','bool view3d_zoom_or_dolly_poll(')
 add('wm','bool WM_operator_poll(');add('listapi','BLI_INLINE bool BLI_listbase_is_empty(')
 code+='''
static wmOperatorStatus viewzoom_exec(bContext*,wmOperator*){++native_callback_calls;return OPERATOR_CANCELLED;}
static wmOperatorStatus view3d_navigate_modal_fn(bContext*,wmOperator*,const wmEvent*){++native_callback_calls;return OPERATOR_CANCELLED;}
static void view3d_navigate_cancel_fn(bContext*,wmOperator*){++native_callback_calls;}
static wmOperatorStatus viewzoom_invoke_impl(bContext*,ViewOpsData*,const wmEvent*,PointerRNA*){++native_callback_calls;return OPERATOR_CANCELLED;}
static wmOperatorStatus viewzoom_modal_impl(bContext*,ViewOpsData*,eV3D_OpEvent,const int*){++native_callback_calls;return OPERATOR_CANCELLED;}
static wmOperatorStatus view3d_navigate_invoke_impl(bContext*,wmOperator*,const wmEvent*,const ViewOpsType*){++native_callback_calls;return OPERATOR_CANCELLED;}
extern const ViewOpsType ViewOpsType_zoom;
static wmOperatorStatus knifetool_invoke(bContext*,wmOperator*,const wmEvent*){++native_callback_calls;return OPERATOR_CANCELLED;}
static wmOperatorStatus knifetool_modal(bContext*,wmOperator*,const wmEvent*){++native_callback_calls;return OPERATOR_CANCELLED;}
static void knifetool_cancel(bContext*,wmOperator*){++native_callback_calls;}
static bool ED_operator_editmesh_view3d(bContext*){++native_callback_calls;return false;}
'''
 add('zoom','static wmOperatorStatus viewzoom_invoke(')
 add('props','void WM_operator_properties_use_cursor_init(');add('nav','void view3d_operator_properties_common(')
 # Exact old factories are unchanged; this historical probe checks missing symbols only.
 factory_zoom=BASE[paths['zoom']] if historical else s['zoom'];factory_knife=BASE[paths['knife']] if historical else s['knife']
 code+='\n'+pick('factory:zoom:old' if historical else 'factory:zoom',factory_zoom,'void VIEW3D_OT_zoom(')+'\n'
 code+='\n'+pick('factory:knife:old' if historical else 'factory:knife',factory_knife,'void MESH_OT_knife_tool(')+'\n'
 for name in ['KNIFE_DEFAULT_ANGLE_SNAPPING_INCREMENT','KNIFE_MIN_ANGLE_SNAPPING_INCREMENT','KNIFE_MAX_ANGLE_SNAPPING_INCREMENT']:
  code=code.replace('#include "native-types.hh"','#include "native-types.hh"\n'+re.search(r'^#define '+name+r'[^\n]+',s['knife'],re.M)[0],1)
 if not historical:
  add('zoom','bool ED_view3d_native_zoom_type_is(')
  for sig in ['bool ED_mesh_knife_modal_type(','bool ED_mesh_knife_modal_origin(','bool ED_mesh_knife_modal_navigation_may_be_denied(']:add('knife',sig)
 code+='\n'+pick('definition:viewops',s['zoom'],'const ViewOpsType ViewOpsType_zoom =')+';\n'
 code+='\nstatic uint64_t wm_ipad_operator_next_lifetime=1;\n'+pick('factory:lifetime',s['factory'],'static uint64_t wm_ipad_operator_lifetime_allocate(')+'\n'
 add('factory','static wmOperatorType *wm_operatortype_append__begin(')
 code+='\nstatic void wm_operatortype_append__end(wmOperatorType*ot){assert(ot&&ot->name&&ot->idname&&ot->srna);registry[ot->idname]=ot;}\n'
 add('factory','void WM_operatortype_append(')
 code+='''
void fixture_register_types(wmOperatorType**zoom,wmOperatorType**knife){registry.clear();WM_operatortype_append(VIEW3D_OT_zoom);WM_operatortype_append(MESH_OT_knife_tool);*zoom=registry.at("VIEW3D_OT_zoom");*knife=registry.at("MESH_OT_knife_tool");}
bool fixture_zoom_poll(bContext*C){return WM_operator_poll(C,registry.at("VIEW3D_OT_zoom"));}
void fixture_dynamic_free(bContext*,void*){++dynamic_free_calls;}
'''
 return code
compiler=next((str(x) for x in [shutil.which('clang++'),shutil.which('g++'),r'C:/Program Files/LLVM/bin/clang++.exe'] if x and Path(x).is_file()),None)
assert compiler,'C++17 compiler required; no native execution occurred'
current=definitions();(OUT/'definitions.cc').write_text(current,encoding='utf-8',newline='\n');(OUT/'caller.cc').write_text((HERE/'cases.inc.cc').read_text(encoding='utf-8-sig'),encoding='utf-8',newline='\n')
executions=[]
for apple in [False,True]:
 for python in [False,True]:
  for opt in ['0','2']:
   tag=f'apple{int(apple)}-python{int(python)}-O{opt}';exe=OUT/(tag+('.exe' if os.name=='nt' else ''));args=[compiler,'-std=c++17','-Werror','-O'+opt,'-I',str(OUT)]
   if apple:args+=['-DWITH_APPLE_CROSSPLATFORM=1']
   if python:args+=['-DWITH_PYTHON=1']
   cp=subprocess.run(args+[str(OUT/'definitions.cc'),str(OUT/'caller.cc'),'-o',str(exe)],capture_output=True,text=True);(OUT/(tag+'-compile.log')).write_text(cp.stdout+cp.stderr)
   assert cp.returncode==0,cp.stdout+cp.stderr
   run=subprocess.run([str(exe)],capture_output=True,text=True);(OUT/(tag+'-run.log')).write_text(run.stdout+run.stderr);assert run.returncode==0,run.stdout+run.stderr
   executions.append({'apple':apple,'python':python,'optimization':opt,**json.loads(run.stdout)})
# Old exact fixed-pin headers have no new APIs. Distinguish compilation from link absence.
oldpublic='\n'.join(sorted(set(re.findall(r'^struct \w+;',BASE[paths['view_header']]+BASE[paths['mesh_header']],re.M))))+'\n'
oldprobe=oldpublic+'\nint main(){return ED_view3d_native_zoom_type_is(nullptr)||ED_mesh_knife_modal_navigation_may_be_denied(nullptr);}\n'
(OUT/'old-public.cc').write_text(oldprobe);cp=subprocess.run([compiler,'-std=c++17','-Werror','-c',str(OUT/'old-public.cc'),'-o',str(OUT/'old-public.o')],capture_output=True,text=True)
(OUT/'old-public-compile.log').write_text(cp.stdout+cp.stderr);assert cp.returncode!=0 and all(name in cp.stderr for name in ['ED_view3d_native_zoom_type_is','ED_mesh_knife_modal_navigation_may_be_denied'])
olddefs=definitions(True);(OUT/'old-definitions.cc').write_text(olddefs,encoding='utf-8',newline='\n')
cp2=subprocess.run([compiler,'-std=c++17','-Werror','-O0','-I',str(OUT),str(OUT/'old-definitions.cc'),str(OUT/'caller.cc'),'-o',str(OUT/'old-source.exe')],capture_output=True,text=True)
(OUT/'old-source-link.log').write_text(cp2.stdout+cp2.stderr);assert cp2.returncode!=0 and ('undefined symbol' in cp2.stderr or 'undefined reference' in cp2.stderr) and all(name in cp2.stderr for name in ['ED_view3d_native_zoom_type_is','ED_mesh_knife_modal_navigation_may_be_denied']),cp2.stderr
report={'status':'PASS','pin':PIN,'patch_sha256':hashlib.sha256((REPO/'patches/blender-ipad.patch').read_bytes()).hexdigest(),'source_sha256':HASHES,'extracted_source_sha256':SLICES,'executions':executions,'historical_missing_seams':[{'stage':'old-public-declaration-compile','returncode':cp.returncode},{'stage':'old-source-definition-link','returncode':cp2.returncode}],'link_contract':link_contract,'limits':['Exact native wmOperatorType/ExtensionRNA/wmOperator/ViewContext/bContext and helper public declaration snippets compile in separate TUs; complete public header dependency trees and complete Blender translation units are not compiled.','Actual helpers, native type factories, WM append begin/append, context native getters, View3D/WM polling and poll-message clear/set execute; RNA descriptor allocation/schema access, registry append end, main-thread query, Python override bridge and non-poll navigation callbacks are explicit host boundaries.','KnifeTool_OpData and region/area backing are narrow storage adapters; owner lifetime, membership, event routing, modal-map/delegation and actual navigation/geometry are owned by the separate connected suite.','All four defined native KnifeMode states execute, including MODE_PANNING refusal. Out-of-range enum conversion/storage corruption is not a defined C++17 control and is not claimed.','Historical controls use exact fixed-pin old factories and absence of API declarations/definitions; they prove missing-seam detection only, not the original behavioural Ctrl-PAN navigation failure.','APPLE/PYTHON macro matrix is host C++17 evidence; target platform SDK, runtime layout/ABI, real RNA/allocator, complete CMake graph and device evidence remain separate.'],'generated_sha256':{'public.hh':sha(public),'native-types.hh':sha(models),'definitions.cc':sha(current)}}
(OUT/'native-profile-report.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n');print(json.dumps({'status':'PASS','executions':len(executions),'assertions':[r['assertions'] for r in executions]}))
