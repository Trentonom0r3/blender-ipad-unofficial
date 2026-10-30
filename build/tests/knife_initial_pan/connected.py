"""Actual native initial-Knife owner to selected dispatch/invoke regression.

Extends the retained raw-import/dispatch/invoke generator's named host models.
Only its explicitly inactive Knife adapters are replaced with actual source.
"""
from pathlib import Path
from datetime import datetime, timezone
import argparse, hashlib, importlib.util, json, re, shutil, subprocess, sys, tempfile

HERE=Path(__file__).resolve().parent
WM_PATH='source/blender/windowmanager/intern/wm_event_system.cc'
KNIFE_PATH='source/blender/editors/mesh/editmesh_knife.cc'
ZOOM_PATH='source/blender/editors/space_view3d/view3d_navigate_view_zoom.cc'
NAV_PATH='source/blender/editors/space_view3d/view3d_navigate.cc'
PATHS=[WM_PATH,KNIFE_PATH,ZOOM_PATH,NAV_PATH,
 'source/blender/editors/space_view3d/view3d_navigate_view_move.cc','source/blender/editors/space_view3d/view3d_navigate_view_rotate.cc',
 'source/blender/windowmanager/WM_types.hh','source/blender/windowmanager/wm_event_system.hh',
 'source/blender/windowmanager/WM_ipad_knife.hh','source/blender/editors/include/ED_mesh.hh',
 'source/blender/editors/interface/view2d/view2d_ops.cc','source/blender/editors/include/UI_view2d.hh',
 'source/blender/blenkernel/intern/context.cc','source/blender/editors/screen/screen_ops.cc',
 'source/blender/makesdna/DNA_view3d_types.h','source/blender/makesdna/DNA_userdef_types.h',
 'source/blender/editors/space_view3d/view3d_navigate.hh']

def sha(x):return hashlib.sha256(x if isinstance(x,bytes) else x.encode()).hexdigest()
def load(path,name):
 spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);sys.modules[name]=m;spec.loader.exec_module(m);return m
def function(s,m):
 start=s.index(m)
 while True:
  brace=s.index('{',start)
  if ';' not in s[start:brace]:break
  start=s.index(m,start+len(m))
 masked=re.sub(r'/\*[\s\S]*?\*/|//[^\n]*|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'',lambda x:' '*len(x[0]),s)
 d=1;i=brace+1
 while d:d+=(masked[i]=='{')-(masked[i]=='}');i+=1
 return s[start:i]
def once(s,a,b):
 assert s.count(a)==1,(a[:100],s.count(a));return s.replace(a,b,1)

def build(repo,source):
 composite=load(repo/'build/tests/node_keymap_dispatch/connected.py','knife_dispatch_composite')
 code,metadata=composite.build(repo,source)
 inv=sys.modules['node_invoke_composite']
 wm=(source/WM_PATH).read_text();knife=(source/KNIFE_PATH).read_text();zoom=(source/ZOOM_PATH).read_text();nav=(source/NAV_PATH).read_text()
 text={p:(source/p).read_text() for p in PATHS};extracted={}
 def f(s,m):v=function(s,m);extracted[m]={'sha256':sha(v),'text':v};return v
 # Remove only the retained scenarios. All raw importer/native algorithms stay.
 code=code[:code.index('static int scenarios=0;')]
 # Extend the explicit host backing objects; no production function is repaired.
 changes={
  'struct Link{Link*next=nullptr,*prev=nullptr;};':'struct Scene;struct Object;struct Depsgraph;struct wmKeyMap;\nstruct Link{Link*next=nullptr,*prev=nullptr;};',
  'struct ID{};':'struct ID{uint64_t session_uid=0;};',
  'struct ARegion:Link{int regiontype=RGN_TYPE_WINDOW;':'struct ARegion:Link{int flag=0;void*regiondata=nullptr;int winx=1000,winy=1000;int regiontype=RGN_TYPE_WINDOW;',
  'struct ScrArea{int spacetype=SPACE_NODE;rcti totrct;ListBase regionbase;};':'struct ScrArea:Link{int spacetype=SPACE_NODE;rcti totrct;ListBase regionbase,spacedata;};',
  'struct bScreen{void*active_region=nullptr;};':'struct bScreen:Link{ID id;ListBase areabase;void*active_region=nullptr;};',
  'struct wmTimer{};struct wmWindow{};':'struct wmTimer{};struct wmWindowRuntime{struct{void*last=nullptr;}event_queue;};struct wmWindow:Link{int winid=17;wmWindowRuntime*runtime=nullptr;void*ghostwin=nullptr;ListBase modalhandlers;bScreen*screen=nullptr;Scene*scene=nullptr;char view_layer_name[64]="Layer";};',
  'struct wmRuntime;struct wmWindowManager{int op_undo_depth=0;wmRuntime*runtime=nullptr;};':'struct wmRuntime;struct wmWindowManager:Link{ID id;ListBase windows;int op_undo_depth=0;wmRuntime*runtime=nullptr;};',
  'void*py_dict=nullptr;void*rv3d=nullptr;};':'void*py_dict=nullptr;void*rv3d=nullptr;Object*object=nullptr;Depsgraph*depsgraph=nullptr;};',
  'struct wmEvent{int direction=0;':'struct wmEvent{int prev_type=0,prev_val=0;int direction=0;',
  'struct wmOperatorType{const char*name=':'struct wmOperatorType{uint64_t ipad_lifetime_id=0;wmKeyMap*modalkeymap=nullptr;const char*name=',
  'struct wmOperator{wmOperatorType*type=':'struct wmOperator{ListBase macro;wmOperatorType*type=',
  'struct UserDef{int uiflag=0,viewzoom=USER_ZOOM_DOLLY;':'struct UserDef{int flag=0,mouse_emulate_3_button_modifier=0;int uiflag=0,viewzoom=USER_ZOOM_DOLLY;',
  'struct Main{ListBase wm{};};':'struct Main{ListBase wm{},screens{},scenes{},objects{},meshes{};};',
  'static void WM_event_add_modal_handler(bContext*,wmOperator*op){++counts.modal_add;last_op=op;}':'struct wmEventHandler_Op;static wmEventHandler_Op*WM_event_add_modal_handler(bContext*,wmOperator*);',
  'bool use_cursor_init=true;':'bool use_cursor_init=false;',
 }
 for a,b in changes.items():code=once(code,a,b)
 code=once(code,'bool use_cursor_init=false;','bool use_cursor_init=false;bool only_selected=false,use_occlude_geometry=true,xray=true,wait_for_input=false;float angle_snapping_increment=.5235987756f;')
 code=once(code,'static bool RNA_boolean_get(PointerRNA*p,const char*){return scalar_values[p].use_cursor_init;}','static bool RNA_boolean_get(PointerRNA*p,const char*n){auto&v=scalar_values[p];if(std::strcmp(n,"only_selected")==0)return v.only_selected;if(std::strcmp(n,"use_occlude_geometry")==0)return v.use_occlude_geometry;if(std::strcmp(n,"xray")==0)return v.xray;if(std::strcmp(n,"wait_for_input")==0)return v.wait_for_input;return v.use_cursor_init;}')
 # ID is needed by backing objects before PointerRNA's original declaration.
 code=once(code,'struct ID{uint64_t session_uid=0;};','')
 code=once(code,'struct ARegionRuntime{','struct ID{uint64_t session_uid=0;};\nstruct ARegionRuntime{')
 # Move the exact native handler declarations ahead of new owner functions.
 hs=code.index('enum eWM_EventHandlerType {');he=hs+len(function(code[hs:],'enum eWM_EventHandlerType {'))+1
 he=code.index('struct wmEventHandler_Keymap {',he)+len(function(code[code.index('struct wmEventHandler_Keymap {',he):],'struct wmEventHandler_Keymap {'))+1
 handlers=code[hs:he];code=code[:hs]+code[he:]
 enum_lock=function(text['source/blender/makesdna/DNA_view3d_types.h'],'enum {\n  /**\n   * Used to lock axis views')+';\n'
 macro_lock=re.search(r'^#define RV3D_LOCK_FLAGS[^\n]+',text['source/blender/makesdna/DNA_view3d_types.h'],re.M)[0]+'\n'
 pref='enum{'+','.join(re.search(r'\b'+n+r'\s*=\s*([^,\n]+)',text['source/blender/makesdna/DNA_userdef_types.h'])[0] for n in ['USER_TWOBUTTONMOUSE','USER_NONUMPAD','USER_EMU_MMB_MOD_ALT','USER_EMU_MMB_MOD_OSKEY'])+','+','.join(re.search(r'\b'+n+r'\s*=\s*([^,\n]+)',text['source/blender/windowmanager/WM_types.hh'])[0] for n in ['KM_DBL_CLICK','WM_EVENT_SCROLL_INVERT'])+'};\n'
 origin=f(text['source/blender/editors/include/ED_mesh.hh'],'struct MeshKnifeModalOrigin {')+';\n'
 extra=handlers+'\n'+enum_lock+macro_lock+pref+'struct ViewLayer;struct View3D;\n'+origin+(HERE/'native_models.inc.cc').read_text()
 # Current native getter/poll code, not copied lock arithmetic.
 for s,m in [(text['source/blender/blenkernel/intern/context.cc'],'RegionView3D *CTX_wm_region_view3d('),(text['source/blender/editors/screen/screen_ops.cc'],'bool ED_operator_region_view3d_active('),(nav,'static bool view3d_navigation_poll_impl('),(nav,'bool view3d_zoom_or_dolly_poll('),(nav,'bool view3d_location_poll('),(nav,'bool view3d_rotation_poll('),(nav,'void ViewOpsData::init_context(')]:extra+='\n'+f(s,m)
 old_get=function(code,'static void*CTX_wm_region_view3d(');code=once(code,old_get,'static struct RegionView3D*CTX_wm_region_view3d(const bContext*);')
 # Actual complete Knife modal/invoke and read-only origin/mode helper.
 for marker in ['enum KnifeMode','enum {\n  KNF_MODAL_CANCEL','enum {\n  KNF_CONSTRAIN_ANGLE_MODE_NONE','enum {\n  KNF_CONSTRAIN_AXIS_NONE','enum {\n  KNF_CONSTRAIN_AXIS_MODE_NONE','enum {\n  KNF_MEASUREMENT_NONE']:
  extra+='\n'+f(knife,marker)+';\n'
 owner_header=text['source/blender/windowmanager/WM_ipad_knife.hh'];extra+='\n'+owner_header[owner_header.index('constexpr int WM_IPAD_KNIFE_OWNER_VALUES'):owner_header.index('enum class wmIPadKnifeAction')]
 extra+='\n'+wm[wm.index('enum eIPadKnifeOwnerIndex {'):wm.index('static wmWindowManager *wm_ipad_knife_window_manager(')]
 for m in ['static wmWindowManager *wm_ipad_knife_window_manager(','static bool wm_ipad_knife_owner_read(','static void wm_ipad_knife_modal_handler_bind(','bool WM_ipad_knife_owner_capture(']:extra+='\n'+f(wm,m)
 for m in ['static void wm_handler_operator_insert(','wmEventHandler_Op *WM_event_add_modal_handler_ex(','wmEventHandler_Op *WM_event_add_modal_handler(']:extra+='\n'+f(wm,m)
 for m in ['static wmOperatorStatus knifetool_modal(','static wmOperatorStatus knifetool_invoke(','bool ED_mesh_knife_modal_type(','bool ED_mesh_knife_modal_origin(','bool ED_mesh_knife_modal_navigation_may_be_denied(']:extra+='\n'+f(knife,m)
 # Actual Zoom mathematical functions and wrappers. Unused modal/cancel callbacks
 # are unsupported descriptor boundaries, never executed in these scenarios.
 for m in ['static void view_zoom_to_window_xy_3d(','static float viewzoom_scale_value(','static float viewzoom_scale_value_offset(','static void viewzoom_apply_3d(','static void viewzoom_apply(','static wmOperatorStatus viewzoom_invoke_impl(']:extra+='\n'+f(zoom,m)
 extra+='\nstatic const ViewOpsType ViewOpsType_zoom{0,"VIEW3D_OT_zoom",view3d_zoom_or_dolly_poll,viewzoom_invoke_impl,nullptr};\n'
 for s,m in [(nav,'static wmOperatorStatus view3d_navigation_invoke_generic('),(nav,'wmOperatorStatus view3d_navigate_invoke_impl('),(zoom,'static wmOperatorStatus viewzoom_invoke('),(zoom,'static wmOperatorStatus viewzoom_exec(')]:extra+='\n'+f(s,m)
 extra+='\n'+f(zoom,'bool ED_view3d_native_zoom_type_is(')
 move=text['source/blender/editors/space_view3d/view3d_navigate_view_move.cc'];rotate=text['source/blender/editors/space_view3d/view3d_navigate_view_rotate.cc']
 for s,m in [(move,'static wmOperatorStatus viewmove_invoke_impl('),(rotate,'static wmOperatorStatus viewrotate_invoke_impl(')]:extra+='\n'+f(s,m)
 extra+='\nstatic const ViewOpsType ViewOpsType_move{0,"VIEW3D_OT_move",view3d_location_poll,viewmove_invoke_impl,nullptr},ViewOpsType_rotate{0,"VIEW3D_OT_rotate",view3d_rotation_poll,viewrotate_invoke_impl,nullptr};\n'
 for s,m in [(move,'static wmOperatorStatus viewmove_invoke('),(rotate,'static wmOperatorStatus viewrotate_invoke(')]:extra+='\n'+f(s,m)
 # All actual callback/profile/owner queries are available before shared invoke.
 point=code.index('static bool wm_ipad_node_view2d_event_context(');code=code[:point]+extra+'\n'+code[point:]
 code=once(code,'static bool wm_ipad_knife_precision_pan_event_context(bContext*,const wmEvent*){return false;}',f(wm,'static bool wm_ipad_knife_precision_pan_event_context('))
 code=once(code,'static bool ED_view3d_native_zoom_type_is(const wmOperatorType*){assert(false&&"Node-only fixture entered Knife profile");return false;}','')
 # Helpers need the exact retained bounded string predicate already defined in
 # the classifier segment; insert only after that definition.
 helpers='\n'.join(f(wm,m) for m in ['static const wmKeyMap *wm_ipad_knife_pan_map_find(','static bool wm_ipad_knife_pan_map_header_is(','static const wmKeyMapItem *wm_ipad_knife_pan_zoom_item(','static const wmKeyMapItem *wm_ipad_knife_panning_item(','static bool wm_ipad_knife_precision_pan_owner_context(','static eIPadNativePanDispatch wm_ipad_knife_pan_zoom_dispatch('])
 stub='static eIPadNativePanDispatch wm_ipad_knife_pan_zoom_dispatch(bContext*,const wmEvent*,const ListBase*,const wmEventHandler_Keymap*,const wmKeyMap*,const wmKeyMapItem*){return eIPadNativePanDispatch::None;}'
 code=once(code,stub,helpers)
 latch=re.search(r'^static int wm_eventemulation_mouse = EVENT_NONE;',wm,re.M)[0]
 # Existing latch is a scalar relocated in production; no new tracker is modeled.
 code=once(code,'static bool wm_ipad_knife_precision_pan_event_context(bContext*,const wmEvent*);',latch+'\nstatic bool wm_ipad_knife_precision_pan_event_context(bContext*,const wmEvent*);')
 code+='\nusing wmEventModifierFlag=int;\n'+f(wm,'static void wm_eventemulation(')+'\n'+f(wm,'static wmEvent *wm_event_add_trackpad(')
 keysource=(repo/'.cache/preflight'/inv.PIN/'source/blender/windowmanager/intern/wm_keymap.cc').read_text()
 code=once(code,'static wmKeyMap*WM_modalkeymap_ensure(wmKeyConfig*,const char*,const void*){std::abort();}','struct EnumPropertyItem;static wmKeyMap*WM_modalkeymap_ensure(wmKeyConfig*,const char*,const EnumPropertyItem*);')
 rna=(repo/'.cache/preflight'/inv.PIN/'source/blender/makesrna/intern/rna_access.cc').read_text();rna_api=(repo/'.cache/preflight'/inv.PIN/'source/blender/makesrna/intern/rna_wm_api.cc').read_text();rna_types=(repo/'.cache/preflight'/inv.PIN/'source/blender/makesrna/RNA_types.hh').read_text()
 code+='\n'+f(rna_types,'struct EnumPropertyItem {')+';\nenum{RPT_WARNING=2};\n'
 properties=f(text['source/blender/editors/space_view3d/view3d_navigate.hh'],'enum eV3D_OpPropFlag')+';\ninline eV3D_OpPropFlag operator|(eV3D_OpPropFlag a,eV3D_OpPropFlag b){return eV3D_OpPropFlag(int(a)|int(b));}\n'
 properties+='constexpr int '+re.search(r'\bPROP_SKIP_SAVE\s*=\s*([^,\n]+)',rna_types)[0]+';\n'
 code=once(code,'static void view3d_operator_properties_common(wmOperatorType*,int){}',properties+f(nav,'void view3d_operator_properties_common('))
 code+='\n'+f(zoom,'void VIEW3D_OT_zoom(')
 code+='\n'+f(knife,'void MESH_OT_knife_tool(')
 for m in ['wmKeyMap *WM_modalkeymap_ensure(','wmKeyMap *WM_modalkeymap_find(','void WM_modalkeymap_assign(','wmKeyMapItem *WM_modalkeymap_add_item(','wmKeyMapItem *WM_modalkeymap_add_item_str(']:code+='\n'+f(keysource,m)
 code+='\n'+f(knife,'wmKeyMap *knifetool_modal_keymap(')
 for m in ['int RNA_enum_from_identifier(','bool RNA_enum_value_from_id(']:code+='\n'+f(rna,m)
 code+='\n'+f(rna_api,'static wmKeyMapItem *rna_KeyMap_item_new_modal(')
 code+='\n'+f(keysource,'wmKeyMap *WM_keymap_active(')+'\nusing wmEventType=int;\n'+f(wm,'struct wmEvent_ModalMapStore {')+';\n'
 for m in ['static wmKeyMapItem *wm_eventmatch_modal_keymap_items(','static void wm_event_modalkeymap_begin(','static void wm_event_modalkeymap_end(']:code+='\n'+f(wm,m)
 call_body=f(wm,'static eHandlerActionFlag wm_handler_operator_call(');tail=call_body[call_body.index('  /* Finished and pass through flag as handled. */'):]
 code+='\nstatic eHandlerActionFlag actual_modal_status_tail(wmOperatorStatus retval){\n'+tail
 old_path=HERE/'historical-3d7b248-invoke.inc.cc';old=old_path.read_text().rstrip('\n');oldmeta=json.loads((HERE/'historical-3d7b248-invoke.json').read_text());assert sha(old_path.read_bytes())==oldmeta['fixture_sha256'];assert sha(old)==oldmeta['body_sha256']
 current=f(wm,'static wmOperatorStatus wm_operator_invoke(')
 wrapper='''
static bool historical_source_mode=false;
static wmOperatorStatus wm_operator_invoke(bContext*C,wmOperatorType*ot,const wmEvent*event,
 PointerRNA*properties,ReportList*reports,const bool poll_only,bool use_last_properties,
 eIPadNativePanDispatch dispatch=eIPadNativePanDispatch::None){
 if(historical_source_mode)return wm_operator_invoke_historical(C,ot,event,properties,reports,poll_only,use_last_properties);
 return wm_operator_invoke_current(C,ot,event,properties,reports,poll_only,use_last_properties,dispatch);
}
'''
 code=once(code,current,current.replace('wm_operator_invoke(','wm_operator_invoke_current(',1)+'\n'+old.replace('wm_operator_invoke(','wm_operator_invoke_historical(',1)+'\n'+wrapper)
 metadata['historical_invoke_provenance']=oldmeta
 generator=(repo/'.cache/preflight'/inv.PIN/'scripts/presets/keyconfig/keymap_data/blender_default.py').read_text();ns={};exec(compile(generator,'fixed-pin-default-keymaps.py','exec'),ns)
 profiles=[ns['km_view3d'](ns['Params'](use_v3d_mmb_pan=swap)) for swap in [False,True]];modal=ns['km_knife_tool_modal_map'](None)
 metadata['actual_generator_profiles']={'view3d':profiles,'knife_modal':modal}
 def event_name(name):
  aliases={'NONE':'EVENT_NONE','TRACKPADPAN':'MOUSEPAN','ESC':'EVT_ESCKEY','RET':'EVT_RETKEY','NUMPAD_ENTER':'EVT_PADENTER','BACK_SPACE':'EVT_BACKSPACEKEY','SPACE':'EVT_SPACEKEY','LEFT_SHIFT':'EVT_LEFTSHIFTKEY','RIGHT_SHIFT':'EVT_RIGHTSHIFTKEY','LEFT_CTRL':'EVT_LEFTCTRLKEY','RIGHT_CTRL':'EVT_RIGHTCTRLKEY','LEFT_ALT':'EVT_LEFTALTKEY','RIGHT_ALT':'EVT_RIGHTALTKEY','OSKEY':'EVT_OSKEY','HYPER':'EVT_HYPER'}
  return aliases.get(name,'EVT_'+name+'KEY' if len(name)==1 and name.isalpha() else name)
 def call(binding,modal_action=None,operator=None):
  vals=[event_name(binding['type']),{'ANY':'KM_ANY','PRESS':'KM_PRESS','RELEASE':'KM_RELEASE','DOUBLE_CLICK':'KM_DBL_CLICK'}[binding['value']],str(bool(binding.get('any'))).lower(),*(str(int(binding.get(k,False))) for k in ['shift','ctrl','alt','oskey','hyper']),event_name(binding.get('key_modifier','NONE')),'KM_ANY',str(bool(binding.get('repeat'))).lower()]
  if modal_action is not None:return 'rna_KeyMap_item_new_modal(km,nullptr,'+json.dumps(modal_action)+','+','.join(vals)+');'
  return 'rna_KeyMap_item_new(km,nullptr,'+json.dumps(operator)+','+','.join(vals)+',false);'
 code+='\nstatic void actual_import_view3d_pan(wmKeyMap*km,bool swapped){if(swapped){\n'+'\n'.join(call(b,operator=name) for name,b,_ in profiles[1][2]['items'] if b['type']=='TRACKPADPAN')+'\n}else{\n'+'\n'.join(call(b,operator=name) for name,b,_ in profiles[0][2]['items'] if b['type']=='TRACKPADPAN')+'\n}}\n'
 code+='\nstatic void actual_import_knife_modal(wmKeyMap*km){\n'+'\n'.join(call(b,modal_action=action) for action,b,_ in modal[2]['items'])+'\n}\n'
 code+='\n'+(HERE/'cases.inc.cc').read_text()
 assert all('std::abort()' not in v['text'] for v in extracted.values())
 code=code.replace('std::abort();','std::cerr<<"UNSUPPORTED_MODEL_DEPENDENCY "<<__func__<<std::endl;std::abort();')
 assert 'Node-only fixture entered Knife profile' not in code
 assert 'wm_ipad_knife_precision_pan_event_context(bContext*,const wmEvent*){return false;}' not in code
 assert stub not in code
 for marker,entry in extracted.items():
  if marker=='static wmOperatorStatus wm_operator_invoke(':assert entry['text'].replace('wm_operator_invoke(','wm_operator_invoke_current(',1) in code
  elif marker!='static eHandlerActionFlag wm_handler_operator_call(':assert entry['text'] in code,('actual source body changed during composition',marker)
 metadata['knife_extracted_source']=extracted
 return code,metadata,inv

def main():
 p=argparse.ArgumentParser();p.add_argument('--repo',type=Path,default=HERE.parents[2]);p.add_argument('--source-root',type=Path);p.add_argument('--output-dir',type=Path);a=p.parse_args()
 repo=a.repo.resolve();out=(a.output_dir or Path(tempfile.mkdtemp(prefix='knife-initial-native-'))).resolve();out.mkdir(parents=True,exist_ok=True)
 sys.path.insert(0,str(repo/'build'));import preflight,test_touch_extrude as touch
 pin=preflight.pinned_commit(repo);cache=repo/'.cache/preflight';touch.PIN_ROOT=cache/pin;touch.PATCH_TEXT=(repo/'patches/blender-ipad.patch').read_text();touch.changed_source.cache_clear()
 source=a.source_root.resolve() if a.source_root else out/'materialized';source.mkdir(parents=True,exist_ok=True)
 inputs={};patchfiles=dict(preflight.patch_files(touch.PATCH_TEXT))
 for rel in PATHS:
  if rel in patchfiles:
   if patchfiles[rel]:preflight.get_source(pin,rel,cache,False)
   data=(source/rel).read_bytes() if a.source_root else touch.changed_source(rel).encode()
  else:data=preflight.get_source(pin,rel,cache,False)
  target=source/rel
  if a.source_root and rel not in patchfiles and target.exists():
   assert target.read_text()==data.decode().replace('\r\n','\n'),('explicit materialized unchanged input differs from pin',rel)
   data=target.read_bytes()
  if not a.source_root or not target.exists():target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(data)
  inputs[rel]=sha(data)
 report={'status':'GENERATING_PENDING_EXECUTION','utc':datetime.now(timezone.utc).isoformat(),'pin':pin,'source_root':str(source),'source_mode':'explicit materialization' if a.source_root else 'authoritative patch plus fixed pin','inputs':inputs,'patch_sha256':sha((repo/'patches/blender-ipad.patch').read_bytes()),'driver_sha256':sha(Path(__file__).read_bytes()),'fixture_sha256':{str(p.relative_to(repo)):sha(p.read_bytes()) for p in HERE.iterdir() if p.is_file() and p.suffix in ['.py','.cc','.json']},'executions':[],'native_abi_or_device_claim':False,
 'boundaries':[
 'Full current native Knife invoke/modal and MESH_OT_knife_tool registration, native modal registration/bind and strict manager/owner-read/capture, source origin/type/mode helpers execute over real connected backing objects. Initial setup is invoked through full native wm_operator_invoke; initial tool-selection/poll acceptance and geometry application remain named external boundaries. No accepted physical DOWN or general lease follows.',
 'Actual generated default View3D profiles are evaluated in Python; all three TRACKPADPAN bindings per profile are imported via actual native RNA/map constructors/IDProperty allocation/PointerRNA/copy. The complete 114-entry View3D map is inventoried but only its three PAN bindings are instantiated. Full generated Knife modal map is imported with actual native enum registration/lookup/modal RNA constructor/copy.',
 'Complete selected regular native keymap handler and actual Knife static classifier execute; private handler call executes its unchanged nonmodal lookup/interface/tool-properties/invoke/result-mapping slice. Modal processing executes full native Knife modal and exact WM final status tail, not the whole modal WM context/cleanup scheduler.',
 'Actual shared denial profile, full current wm_operator_invoke and WM_operator_poll, actual active View3D getter/region and regular+runtime lock polls, source Zoom registration/profile and full native Zoom invoke/apply/scale/distance math execute. Operator, RNA schema/scalar defaults, native context providers, cursor, redraw/autokey/camera helpers and ViewOpsData init_navigation are explicit instrumented dependencies. Tested perspective has zoom-to-cursor off.',
 'Whole actual current wm_event_add_trackpad executes source-class AND merge over instrumented queue storage; physical source input starts at the actual WM precision flag. Actual UIKit producer classification is covered by the separately retained producer/transport families, not re-proved here.',
 'Actual Move/Rotate one-finger guards, polls and full invoke/init bodies execute. Advanced application functions are instrumented geometry boundaries that record reachability; no advanced navigation geometry/state result is claimed. Unsupported callback/modal/cancel paths abort rather than simulate success.',
 'Exact old verified3d7b248 whole native invocation body is frozen with authenticated full-source/body hashes. Only definition names change; a disclosed signature wrapper discards the new selected scalar for the old function. Old required-denial controls must fail with exit17 and actual creates1/nav-allocation1/distance change. No production algorithm is auto-corrected.',
 'Primitive backing objects (Knife mode backing is int, exercised only with declared native enum values), native registries, allocation/free, schema emission, source-context provider return values and geometry/setup are host boundaries. This is not native ABI/layout, full translation-unit, SDK/UIKit/device, universal callback/lifetime, geometry/history/Undo or Cancel rollback acceptance.'
 ]}
 def save():(out/'report.json').write_text(json.dumps(report,indent=2)+'\n')
 save();code,meta,inv=build(repo,source);cpp=out/'actual-connected-initial-knife.cc';cpp.write_text(code,encoding='utf-8',newline='\n');report['generated_cpp_sha256']=sha(code);report['metadata']=meta;report['invocation_runtime_source_sha256']={rel:sha(inv.source(rel)) for rel in inv.PATHS}
 for folder in ['node_keymap_dispatch','node_keymap_baseline','node_native_invoke']:
  report['fixture_sha256'].update({str(p.relative_to(repo)):sha(p.read_bytes()) for p in (repo/'build/tests'/folder).iterdir() if p.is_file() and p.suffix in ['.py','.cc','.json']})
 for rel in ['build/test_pencil_node_native_invoke.py','build/test_pencil_knife_initial_pan.py','build/preflight.py','build/test_touch_extrude.py','.github/workflows/build-ipa.yml']:report['fixture_sha256'][rel]=sha((repo/rel).read_bytes())
 save()
 compiler=next(x for x in [shutil.which('clang++'),shutil.which('g++'),r'C:/Program Files/LLVM/bin/clang++.exe'] if x and Path(x).is_file())
 for opt in ['-O0','-O2']:
  binary=out/('knife-initial-'+opt[1:]+('.exe' if sys.platform=='win32' else ''))
  report['compiler']={'path':str(compiler),'sha256':sha(Path(compiler).read_bytes())};save()
  c=subprocess.run([compiler,'-std=c++17',opt,str(cpp),'-o',str(binary)],capture_output=True,text=True);(out/(opt[1:]+'-compile.log')).write_text(c.stdout+c.stderr)
  if c.returncode:raise RuntimeError(c.stderr[-8000:])
  for case,args,expected in [('current',[],0),('exact-old-required-denial',['--require-old-denial'],17)]:
   run=subprocess.run([str(binary)]+args,capture_output=True,text=True);(out/(opt[1:]+'-'+case+'-run.log')).write_text(run.stdout+run.stderr);report['executions'].append({'optimization':opt,'case':case,'returncode':run.returncode,'stdout':run.stdout,'stderr':run.stderr});save()
   if run.returncode!=expected:raise RuntimeError(str(report['executions'][-1]))
   if expected:assert 'KNIFE_REQUIRED_DENIAL_FAILED exact_old_source=3d7b248 creates=1 nav_allocations=1' in run.stderr,report['executions'][-1]
   else:
    matched=re.search(r'actual connected initial Knife scenarios passed (\d+)',run.stdout);assert matched and int(matched[1])>=67,report['executions'][-1]
    report['executions'][-1]['scenarios']=int(matched[1]);save()
 report['status']='PASS_BOUNDED_ACTUAL_KNIFE_INITIAL_PAN';save();print(json.dumps({'status':report['status'],'report':str(out/'report.json')}))
if __name__=='__main__':main()
