"""Compose actual native raw-map import, chosen dispatch and complete invocation."""
from pathlib import Path
import argparse,hashlib,importlib.util,json,re,shutil,subprocess,sys,time
HERE=Path(__file__).resolve().parent

def load(path,name):
 spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);sys.modules[name]=m;spec.loader.exec_module(m);return m

def build(repo,source):
 old=sys.argv;sys.argv=[str(repo/'build/test_pencil_node_native_invoke.py'),'--repo',str(repo),'--source-root',str(source)]
 inv=load(repo/'build/test_pencil_node_native_invoke.py','node_invoke_composite');sys.argv=old
 base=load(repo/'build/tests/node_keymap_baseline/baseline.py','node_baseline_composite')
 # Fetch every fixed-pin raw-map prerequisite before any direct cache read.
 baseline,metadata=base.build_source(repo,source)
 prefix=inv.build_native_prefix()
 # Existing View2D fixture keeps exact PointerRNA and external scalar values.
 # Extend model dependencies, never algorithm bodies, for real keymap objects.
 prefix=prefix.replace('struct Link{void*next=nullptr,*prev=nullptr;};','struct Link{Link*next=nullptr,*prev=nullptr;};')
 prefix=prefix.replace('#include <map>','#include <map>\n#include <memory>\n#include <cstdio>\n#include <cstddef>')
 prefix=prefix.replace('struct wmWindowManager{int op_undo_depth=0;};','struct wmRuntime;struct wmWindowManager{int op_undo_depth=0;wmRuntime*runtime=nullptr;};')
 prefix=prefix.replace('struct wmEvent{int type=', 'struct wmTabletData{int active=0;};\nstruct wmEvent{int direction=0;char utf8_buf[8]{};wmTabletData tablet;int type=')
 prefix=prefix.replace('struct UserDef{int uiflag=0,viewzoom=USER_ZOOM_DOLLY;} U;','struct UserDef{int uiflag=0,viewzoom=USER_ZOOM_DOLLY;char keyconfigstr[64]{},app_template[64]{};} U;')
 prefix=prefix.replace('struct StructRNA{};','struct StructRNA{std::string identifier;};')
 prefix=prefix.replace('struct PropertyRNA{};','struct PropertyRNA{int type=0,flag=0;};')
 prefix=prefix.replace('template<class T>T*MEM_callocN(const char*){++counts.alloc;return new T{};}','static std::map<void*,size_t> native_sizes;\ntemplate<class T>T*MEM_callocN(const char*){++counts.alloc;void*p=std::calloc(1,sizeof(T));assert(p);native_sizes[p]=sizeof(T);return static_cast<T*>(p);}')
 prefix=prefix.replace('template<class T>void MEM_freeN(T*p){++counts.free;delete p;}','template<class T>void MEM_freeN(T*p){++counts.free;native_sizes.erase(p);std::free(p);}')
 prefix=prefix.replace('template<class...T>void RNA_def_int(T...){ }','template<class...T>PropertyRNA*RNA_def_int(T...){static PropertyRNA p;return &p;}\ntemplate<class...T>PropertyRNA*RNA_def_boolean(T...){static PropertyRNA p;return &p;}')
 prefix=prefix.replace('bool use_cursor_init=false;','bool use_cursor_init=true;')
 # Additional exact DNA/enum declarations are inserted before the actual context
 # domain, whose native BLI_findindex dependency must already exist.
 cache=repo/'.cache/preflight'/base.PIN
 sources={k:(source/p if k in ('eventsystem','view2d') else cache/p).read_text(encoding='utf-8') for k,p in base.PATHS.items()}
 def f(key,sig):return base.body(sources[key],sig)
 def st(key,sig):
  b=f(key,sig)
  return b+' '+sig.split()[2]+';' if sig.startswith('typedef ') else b+';'
 defs='\nstruct IDPropertyUIData{};\n'
 for key,sig in [('dna_id','typedef struct IDPropertyData {'),('dna_id','typedef struct IDProperty {'),('idheader','union IDPropertyTemplate {'),('dna','typedef struct wmKeyMapItem {'),('dna','typedef struct wmKeyMapDiffItem {'),('dna','typedef struct wmKeyMap {'),('dna','typedef struct wmKeyConfig {'),('kmheader','struct KeyMapItem_Params {')]:defs+=st(key,sig)+'\n'
 for name in ['eIDPropertyType','eIDPropertySubType','eIDPropertyFlag']:defs+=f('dna_enum','typedef enum '+name+' {')+' '+name+';\n'
 for start,end in [('/** #wmKeyMapItem.flag */','/** #wmKeyMapItem.maptype */'),('/** #wmKeyMapItem.maptype */','/**\n * Stored in WM'),('/** #wmKeyMap.flag */','/**\n * This is similar to addon-preferences'),('/** #wmKeyConfig.flag */','/**\n * This one is the operator itself')]:defs+=sources['dna'][sources['dna'].index(start):sources['dna'].index(end)]+'\n'
 # Native constants not supplied by the invoke model come from exact headers.
 events=sources['events'][:sources['events'].index('enum eEventType_Mask {')].replace('#pragma once','')
 defs+='namespace native_events {\n'+events+'\n}\n'
 names=set(re.findall(r'^\s*([A-Z][A-Z0-9_]+)\s*=',events,re.M));present=set(re.findall(r'\b([A-Z][A-Z0-9_]+)\s*=',prefix))
 defs+='\n'.join('constexpr int '+n+'=native_events::'+n+';' for n in sorted(names-present) if not n.startswith('NDOF_BUTTON_'))+'\n'
 defs+='enum{KM_ANY=-1,KM_SHIFT=1,KM_ALT=4,KM_OSKEY=8,KM_HYPER=16,KM_PRESS_DRAG=5,KM_TEXTINPUT=-2,KM_MOD_HELD=1,SPACE_EMPTY=0,OPTYPE_LOCK_BYPASS=1024,OPTYPE_INTERNAL=2048};\n'
 wmtypes=(source/'source/blender/windowmanager/WM_types.hh').read_text()
 for name in ['WM_EVENT_MULTITOUCH_THREE_FINGERS','WM_EVENT_IS_TOUCH_PINCH','WM_EVENT_IS_POINTER_CANCEL','WM_EVENT_IS_DIRECT_TOOL','WM_EVENT_IS_DIRECT_FINGER','WM_EVENT_IS_REPEAT']:
  if name in present:continue
  expr=re.search(r'\b'+name+r'\s*=\s*([^,\n]+)',wmtypes)[1];defs+='constexpr int '+name+'='+expr+';\n'
 defs+=(HERE/'dependencies.inc.cc').read_text()
 defs+='\n'+f('lists','int BLI_findindex(') if 'int BLI_findindex(' not in prefix else ''
 point=prefix.index('static bool wm_ipad_node_view2d_event_context(')
 prefix=prefix[:point]+defs+'\n'+prefix[point:]
 native=[]
 for sig in ['void BLI_addhead(','void BLI_addtail(','void BLI_remlink(','void BLI_freelinkN(','void *BLI_findstring(']:native.append(f('lists',sig))
 native += [f('idprop','IDProperty *IDP_New('),'namespace blender::bke::idprop {\n'+f('idcreate','std::unique_ptr<IDProperty, IDPropertyDeleter> create_group(').replace('const eIDPropertyFlag flags)','const eIDPropertyFlag flags = {})')+'\n}',f('idprop','static IDProperty *idp_generic_copy('),f('idprop','static IDProperty *IDP_CopyGroup('),f('idprop','IDProperty *IDP_CopyProperty_ex('),f('idprop','IDProperty *IDP_CopyProperty('),f('rna_access','PointerRNA RNA_pointer_create_discrete(')]
 native += [f('operators',sig) for sig in ['void WM_operator_properties_create_ptr(','void WM_operator_properties_create(','void WM_operator_properties_alloc(','void WM_operator_properties_sanitize(','size_t WM_operator_bl_idname(']]
 native += ['enum{WM_KEYMAP_UPDATE_RECONFIGURE=1};static char wm_keymap_update_flag=0;',f('keymap','void WM_keyconfig_update_tag(')]
 native += [f('keymap',sig) for sig in ['wmKeyConfig *WM_keyconfig_new(','static wmKeyMapItem *wm_keymap_item_copy(','static void wm_keymap_item_free_data(','static void wm_keymap_item_properties_set(','static wmKeyMapDiffItem *wm_keymap_diff_item_copy(','static void wm_keymap_diff_item_free(','static wmKeyMap *wm_keymap_new(','static wmKeyMap *wm_keymap_copy(','void WM_keymap_clear(','static void keymap_event_set(','static void keymap_item_set_id(','wmKeyMapItem *WM_keymap_add_item(','wmKeyMapItem *WM_keymap_add_item_copy(','wmKeyMap *WM_keymap_list_find(','wmKeyMap *WM_keymap_ensure(','static wmKeyMap *wm_keymap_patch_update(']]
 native += [f('rna_api',sig) for sig in ['static int16_t keymap_item_modifier_flag_from_args(','static wmKeyMapItem *rna_KeyMap_item_new(','static wmKeyMap *rna_KeyMaps_new(']]
 native += [f('keymap','bool WM_keymap_poll('),f('eventsystem','BLI_INLINE bool wm_eventmatch(')]
 # Preserve actual generator/importer captured native calls, already passed by
 # the prerequisite, and register every non-pan/zoom actual operator descriptor.
 actual_import=base.body(baseline,'static void actual_import(')
 setup=base.body(baseline,'static void register_operators(')
 missing=[]
 for name in dict.fromkeys(e['python_idname'].split('.')[1] for e in metadata['generated_inventory']):
  if name in ('pan','zoom'):continue
  reg=f('view2d','static void VIEW2D_OT_'+name+'(');missing.append(reg)
 known=set(re.findall(r'\b(?:void|bool|wmOperatorStatus)\s+(\w+)\s*\(',prefix))
 callbacks={}
 for role,name in re.findall(r'ot->(exec|invoke|modal|cancel|poll) = ([A-Za-z0-9_]+);','\n'.join(missing)):
  if name in known:continue
  signature={'exec':'wmOperatorStatus {name}(bContext*,wmOperator*)','invoke':'wmOperatorStatus {name}(bContext*,wmOperator*,const wmEvent*)','modal':'wmOperatorStatus {name}(bContext*,wmOperator*,const wmEvent*)','cancel':'void {name}(bContext*,wmOperator*)','poll':'bool {name}(bContext*)'}[role]
  callbacks[name]='static '+signature.format(name=name)+'{std::abort();}'
 native+=list(callbacks.values())
 # Nonselected schema scalar helpers are explicit inert RNA-definition boundaries.
 native+=['static void WM_operator_properties_gesture_box(wmOperatorType*){}\nstatic void WM_operator_properties_gesture_box_zoom(wmOperatorType*){}',*missing,setup,actual_import]
 helpers=f('eventsystem','struct wmIPadNodeView2DItem {')+';\n'
 a=sources['eventsystem'].index('static constexpr wmIPadNodeView2DItem wm_ipad_node_view2d_items[]');b=sources['eventsystem'].index('static bool wm_ipad_node_view2d_string_is(',a)
 helpers+=sources['eventsystem'][a:b]
 for sig in ['static bool wm_ipad_node_view2d_string_is(','static const wmKeyMap *wm_ipad_node_view2d_map_find(','static bool wm_ipad_node_view2d_map_is(','static eIPadNativePanDispatch wm_ipad_node_view2d_dispatch(']:helpers+=f('eventsystem',sig)+'\n'
 header=(source/'source/blender/windowmanager/wm_event_system.hh').read_text()
 handlerdecl=base.body(header,'enum eWM_EventHandlerType {')+';\n'
 handlerdecl+='using EventHandlerPoll=bool(*)(const wmWindow*,const ScrArea*,const ARegion*,const wmEvent*);\nusing eWM_EventHandlerFlag=int;\n'
 handlerdecl+='struct wmEventHandler_KeymapDynamic;using wmEventHandler_KeymapDynamicFn=void(*)(wmWindowManager*,wmWindow*,wmEventHandler_KeymapDynamic*,wmKeyMap**);\n'
 for sig in ['struct wmEventHandler {','struct wmEventHandler_KeymapPost {','struct wmEventHandler_KeymapDynamic {','struct wmEventHandler_Keymap {']:handlerdecl+=base.body(header,sig)+';\n'
 # Native regular dispatcher executes fully. Only modal/Tool/Gizmo branches of
 # private handler call are outside this nonmodal slice, never falsely covered.
 full=f('eventsystem','static eHandlerActionFlag wm_handler_operator_call(')
 a=full.index('    wmOperatorType *ot = WM_operatortype_find(kmi_idname, false);')
 b=full.index('      /* Link gizmo if',a)
 mapping=full[full.index('  /* Finished and pass through flag as handled. */'):]
 bridge='static eHandlerActionFlag wm_handler_operator_call(bContext*C,ListBase*handlers,wmEventHandler*handler_base,wmEvent*event,PointerRNA*properties,const char*kmi_idname,bool use_cursor_region,eIPadNativePanDispatch ipad_node_view2d){wmOperatorStatus retval=OPERATOR_PASS_THROUGH;\n'+full[a:b]+'}\n'+mapping
 # Retained Node-only context has no registered Knife. This boundary grants
 # no denial and never models the new actual owner policy as passing.
 helpers+='static eIPadNativePanDispatch wm_ipad_knife_pan_zoom_dispatch(bContext*,const wmEvent*,const ListBase*,const wmEventHandler_Keymap*,const wmKeyMap*,const wmKeyMapItem*){return eIPadNativePanDispatch::None;}\n'
 regular=f('eventsystem','static eHandlerActionFlag wm_handlers_do_keymap_with_keymap_handler(')
 action_enum=base.body(sources['eventsystem'],'enum eHandlerActionFlag {')+';\n'
 # Native bitmask operators are represented as int in the portable boundary.
 action_enum=action_enum.replace('enum eHandlerActionFlag {','enum {')+'using eHandlerActionFlag=int;\n#define WM_HANDLER_CONTINUE 0\n'
 code=prefix+'\n'+action_enum+handlerdecl+'\n'+'\n'.join(native)+'\n'+helpers+'\n'+(HERE/'handler_boundaries.inc.cc').read_text()+'\n'+bridge+'\n#define PRINT if(do_debug_handler)printf\n'+regular+'\n'+(HERE/'cases.inc.cc').read_text()
 metadata['connected_native_invocation_prefix_sha256']=hashlib.sha256(inv.build_native_prefix().encode()).hexdigest()
 metadata['actual_classifier_sha256']=hashlib.sha256(helpers.encode()).hexdigest()
 metadata['actual_regular_handler_sha256']=hashlib.sha256(regular.encode()).hexdigest()
 metadata['actual_private_call_nonmodal_slice_sha256']=hashlib.sha256(bridge.encode()).hexdigest()
 return code,metadata

def run(repo,source,out):
 out.mkdir(parents=True,exist_ok=True);code,metadata=build(repo,source);cpp=out/'actual-connected-keymap-dispatch.cc';cpp.write_text(code,encoding='utf-8',newline='\n')
 compiler=shutil.which('clang++') or 'C:/Program Files/LLVM/bin/clang++.exe';results=[]
 for opt in ('0','2'):
  tag='O'+opt;exe=out/('actual-dispatch-'+tag+('.exe' if sys.platform=='win32' else ''))
  for name in ('compile-'+tag+'.log','execute-'+tag+'.log'):
   old=out/name
   if old.exists():old.rename(out/(str(time.time_ns())+'-'+name))
  built=subprocess.run([compiler,'-std=c++17','-O'+opt,str(cpp),'-o',str(exe)],capture_output=True,text=True);(out/('compile-'+tag+'.log')).write_text(built.stdout+built.stderr,encoding='utf-8');assert built.returncode==0,built.stderr
  tested=subprocess.run([str(exe)],capture_output=True,text=True);(out/('execute-'+tag+'.log')).write_text(tested.stdout+tested.stderr,encoding='utf-8');assert tested.returncode==0,tested.stdout+tested.stderr;results.append({'optimization':tag,'stdout':tested.stdout})
 report=metadata|{'status':'PASS','executions':results,'generated_cpp_sha256':hashlib.sha256(cpp.read_bytes()).hexdigest(),'boundaries_additional':['Allocator/primitive RNA schema/getters/native registry/context/rendering are instrumented host boundaries; exact DNA/PointerRNA storage and actual map native initialization execute','Complete actual selected regular handler and classifier execute; private handler call uses actual nonmodal lookup/interface/tool-properties/invoke/result mapping slice; modal/Gizmo/Tool post-link branch is outside this fixture','Complete actual wm_operator_invoke, WM_operator_poll and native View2D pan/zoom functions execute from shared invoke fixture prefix. No geometry or zero allocation outcome is replaced by a scalar stub.'],'target_or_device_execution':False}
 (out/'dispatch-report.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8');print(json.dumps({'status':'PASS','report':str(out/'dispatch-report.json'),'executions':results}))
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--repo',type=Path,required=True);p.add_argument('--source-dir',type=Path,required=True);p.add_argument('--output-dir',type=Path,required=True);a=p.parse_args();run(a.repo,a.source_dir,a.output_dir)
