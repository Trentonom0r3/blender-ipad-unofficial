"""Pinned actual native keymap import/add/property/copy baseline.

Exposes build_source(repo, source_dir) for the connected Node fixture.
No production source or old fixture is changed by this test.
"""
from pathlib import Path
import argparse, ast, hashlib, json, re, shutil, subprocess, sys, time
PIN='d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e'
HERE=Path(__file__).resolve().parent
PATHS={
 'keymap':'source/blender/windowmanager/intern/wm_keymap.cc',
 'operators':'source/blender/windowmanager/intern/wm_operators.cc',
 'props':'source/blender/windowmanager/intern/wm_operator_props.cc',
 'rna_api':'source/blender/makesrna/intern/rna_wm_api.cc',
 'rna_wm':'source/blender/makesrna/intern/rna_wm.cc',
 'rna_access':'source/blender/makesrna/intern/rna_access.cc',
 'rna_types':'source/blender/makesrna/RNA_types.hh',
 'dna':'source/blender/makesdna/DNA_windowmanager_types.h',
 'dna_id':'source/blender/makesdna/DNA_ID.h',
 'dna_enum':'source/blender/makesdna/DNA_ID_enums.h',
 'listtypes':'source/blender/makesdna/DNA_listBase.h',
 'lists':'source/blender/blenlib/intern/listbase.cc',
 'idprop':'source/blender/blenkernel/intern/idprop.cc',
 'idcreate':'source/blender/blenkernel/intern/idprop_create.cc',
 'idheader':'source/blender/blenkernel/BKE_idprop.hh',
 'kmheader':'source/blender/windowmanager/WM_keymap.hh',
 'wmtypes':'source/blender/windowmanager/WM_types.hh',
 'events':'source/blender/windowmanager/wm_event_types.hh',
 'generator':'scripts/presets/keyconfig/keymap_data/blender_default.py',
 'importer':'scripts/modules/bl_keymap_utils/io.py',
 'view2d':'source/blender/editors/interface/view2d/view2d_ops.cc',
 'eventsystem':'source/blender/windowmanager/intern/wm_event_system.cc',
}
# Mask comments/strings while locating braces. Returned body is original source
# with normalized newlines; no algorithm body is rewritten.
def body(s,sig,semicolon=False):
 a=s.index(sig); b=s.index('{',a)
 masked=re.sub(r'/\*[\s\S]*?\*/|//[^\n]*|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'',lambda m:' '*len(m[0]),s)
 d=0
 for e in range(b,len(s)):
  d+=(masked[e]=='{')-(masked[e]=='}')
  if d==0:return s[a:e+1]+(';' if semicolon else '')
 raise AssertionError(sig)
def py_functions(s,names):
 tree=ast.parse(s); selected=[n for n in tree.body if isinstance(n,(ast.FunctionDef,ast.AsyncFunctionDef)) and n.name in names]
 assert {n.name for n in selected}==set(names)
 scope={};exec(compile(ast.Module(body=selected,type_ignores=[]),'<actual-pinned-functions>','exec'),scope)
 return scope

def build_source(repo,source_dir=None):
 sys.path.insert(0,str(repo/'build'));import preflight
 assert preflight.pinned_commit(repo)==PIN
 sources={}; hashes={}; origins={}; extracted=[]
 for key,path in PATHS.items():
  candidate=source_dir/path if source_dir and key in ('eventsystem','view2d') else None
  data=candidate.read_bytes() if candidate and candidate.exists() else preflight.get_source(PIN,path,repo/'.cache/preflight',False)
  sources[key]=data.decode('utf-8').replace('\r\n','\n');hashes[path]=hashlib.sha256(data).hexdigest();origins[path]=str(candidate) if candidate and candidate.exists() else 'fixed-pin-cache'
 def f(key,sig):
  text=body(sources[key],sig);extracted.append({'path':PATHS[key],'signature':sig,'sha256':hashlib.sha256(text.encode()).hexdigest()});return text
 def st(key,sig):
  text=body(sources[key],sig)
  if sig.startswith('typedef struct '):
   name=sig.split()[2];return text+' '+name+';'
  return text+';'
 s=sources
 # Actual importer records calls passed through actual native RNA entry point.
 generated=py_functions(s['generator'],['km_view2d'])['km_view2d'](None)
 calls=[]
 class Items:
  def new(self,name,**kwargs):calls.append((name,kwargs));return object()
 class Map: keymap_items=Items()
 py_functions(s['importer'],['keymap_init_from_data','_init_properties_from_data'])['keymap_init_from_data'](Map(),generated[2]['items'])
 assert len(calls)==25 and all(entry[2] is None for entry in generated[2]['items'])
 enumtype=body(s['rna_wm'],'const EnumPropertyItem rna_enum_event_type_items[]')
 enumvalue=body(s['rna_wm'],'const EnumPropertyItem rna_enum_event_value_items[]')
 type_names=dict((b,a) for a,b in re.findall(r'\{\s*([A-Z][A-Z_0-9]*),\s*"([A-Z_0-9]+)"',enumtype))
 value_names=dict((b,a) for a,b in re.findall(r'\{\s*([A-Z][A-Z_0-9]*),\s*"([A-Z_0-9]+)"',enumvalue))
 defaults={'any':False,'shift':0,'ctrl':0,'alt':0,'oskey':0,'hyper':0,'key_modifier':0,'direction':-1,'repeat':False,'head':False}
 api=s['rna_api'][s['rna_api'].index('void RNA_api_keymapitems('):]
 for literal in ['RNA_def_boolean(func, "any", false','RNA_def_enum(func, "direction", rna_enum_event_direction_items, KM_ANY','RNA_def_boolean(func, "repeat", false','RNA_def_boolean(func,\n                  "head",\n                  false']:
  assert literal in api,literal
 for name in ('shift','ctrl','alt','oskey','hyper'):assert f'RNA_def_int(func, "{name}", KM_NOTHING' in api
 assert 'RNA_def_enum(func, "key_modifier", rna_enum_event_type_items, 0' in api
 import_calls=[];expected=[]
 for pos,(name,args) in enumerate(calls,1):
  a=defaults|args
  vals=[json.dumps(name),type_names[a['type']],value_names[a['value']],str(a['any']).lower(),*[str(int(a[n])) for n in ('shift','ctrl','alt','oskey','hyper')],str(a['key_modifier']),str(a['direction']),str(a['repeat']).lower(),str(a['head']).lower()]
  import_calls.append('rna_KeyMap_item_new(km,nullptr,'+','.join(vals)+');')
  expected.append({'position':pos,'python_idname':name,'args':args})
 pre=HERE.joinpath('native_boundaries.inc.cc').read_text()
 decl=st('listtypes','typedef struct Link {')+'\n'+st('listtypes','typedef struct ListBase {')+'\n'
 decl+=st('dna_id','typedef struct IDPropertyData {')+'\n'+st('dna_id','typedef struct IDProperty {')+'\n'
 for name in ['eIDPropertyType','eIDPropertySubType','eIDPropertyFlag']:
  decl+=st('dna_enum','typedef enum '+name+' {').replace('};','} '+name+';')+'\n'
 decl+=st('idheader','union IDPropertyTemplate {')+'\n'
 decl+=st('dna','typedef struct wmKeyMapItem {')+'\n'+st('dna','typedef struct wmKeyMapDiffItem {')+'\n'+st('dna','typedef struct wmKeyMap {')+'\n'+st('dna','typedef struct wmKeyConfig {')+'\n'
 for start,end in [('/** #wmKeyMapItem.flag */','/** #wmKeyMapItem.maptype */'),('/** #wmKeyMapItem.maptype */','/**\n * Stored in WM'),('/** #wmKeyMap.flag */','/**\n * This is similar to addon-preferences')]:
  decl+=s['dna'][s['dna'].index(start):s['dna'].index(end)]+'\n'
 decl+=s['dna'][s['dna'].index('/** #wmKeyConfig.flag */'):s['dna'].index('/**\n * This one is the operator itself')]+ '\n'
 decl+=st('kmheader','struct KeyMapItem_Params {')+'\n'
 decl+=st('wmtypes','enum wmEventModifierFlag : uint8_t {')+'\n'
 decl+=body(s['wmtypes'][s['wmtypes'].index('/** #wmKeyMapItem.val */'):],'enum {',True)+'\n'
 decl+='enum { KM_TEXTINPUT=-2 };\n'
 decl+=s['events'][:s['events'].index('enum eEventType_Mask {')].replace('#pragma once','')+'\n'
 decl+=st('wmtypes','enum eWM_EventFlag {')+'\n'
 decl+='struct StructRNA;\n'+st('rna_types','struct AncestorPointerRNA {')+'\nconstexpr int64_t ANCESTOR_POINTERRNA_DEFAULT_SIZE=2;\n'
 decl+=st('rna_types','struct PointerRNA {')+'\n'+st('rna_types','enum PropertyType {')+'\n'
 boundary=r"""
struct PropertyRNA{std::string identifier;int type;int flag=0;};
struct StructRNA{std::string identifier;std::vector<PropertyRNA*> properties;};
static StructRNA RNA_OperatorProperties{"OperatorProperties",{}};
static StructRNA RNA_Struct{"Struct",{}};
using callback=void(*)();
struct wmOperatorType{const char*name=nullptr;const char*description=nullptr;const char*idname=nullptr;StructRNA*srna=nullptr;callback exec=nullptr,invoke=nullptr,modal=nullptr,cancel=nullptr,poll=nullptr;int flag=0;};
static std::map<std::string,wmOperatorType*> registry;
static wmOperatorType* WM_operatortype_find(const char*n,bool){auto i=registry.find(n);return i==registry.end()?nullptr:i->second;}
static void rna_pointer_refine(PointerRNA&){++refine_calls;std::abort();}
static IDPropertyUIData* IDP_ui_data_copy(const IDProperty*){std::abort();}
static char* IDP_String(IDProperty*p){return static_cast<char*>(p->data.pointer);}
static ID* IDP_Id(IDProperty*p){return static_cast<ID*>(p->data.pointer);}
static void id_us_plus(ID*){std::abort();}
static int idp_size_table[11]{};
struct IDPropertyDeleter{void operator()(IDProperty*p)const{MEM_freeN(p);}};
static IDProperty* IDP_CopyProperty_ex(const IDProperty*,int);
static IDProperty* IDP_CopyString(const IDProperty*,int){std::abort();}
static IDProperty* IDP_CopyID(const IDProperty*,int){std::abort();}
static IDProperty* IDP_CopyArray(const IDProperty*,int){std::abort();}
static IDProperty* IDP_CopyIDPArray(const IDProperty*,int){std::abort();}
static void IDP_FreeProperty(IDProperty*p){assert(!p->data.group.first&&!p->data.group.last);MEM_freeN(p);}
static int RNA_property_type(PropertyRNA*p){++sanitize_visits;return p->type;}
static StructRNA* RNA_property_pointer_type(PointerRNA*,PropertyRNA*){std::abort();}
static bool RNA_struct_is_a(StructRNA*a,StructRNA*b){return a==b;}
static PointerRNA RNA_property_pointer_get(PointerRNA*,PropertyRNA*){std::abort();}
static void RNA_def_property_flag(PropertyRNA*p,int flag){p->flag|=flag;}
static void RNA_def_property_clear_flag(PropertyRNA*p,int flag){p->flag&=~flag;}
#define RNA_STRUCT_BEGIN(ptr,prop) for(PropertyRNA* prop:(ptr)->type->properties) {
#define RNA_STRUCT_END }
enum {PROP_HIDDEN=1<<0,PROP_SKIP_SAVE=1<<1,PROP_ENUM_NO_CONTEXT=1<<2};
enum {OPTYPE_BLOCKING=1<<0,OPTYPE_GRAB_CURSOR_XY=1<<1,OPTYPE_LOCK_BYPASS=1<<2,OPTYPE_INTERNAL=1<<3};
static PropertyRNA* property_add(StructRNA*s,const char*n,int type){auto*p=new PropertyRNA{n,type};s->properties.push_back(p);return p;}
template<class...A>PropertyRNA* RNA_def_int(StructRNA*s,const char*n,A...){return property_add(s,n,PROP_INT);}
template<class...A>PropertyRNA* RNA_def_boolean(StructRNA*s,const char*n,A...){return property_add(s,n,PROP_BOOLEAN);}
template<class...A>PropertyRNA* RNA_def_float(StructRNA*s,const char*n,A...){return property_add(s,n,PROP_FLOAT);}
struct Main{ListBase wm;};static Main main_data{};static Main* G_MAIN=&main_data;
static void BLI_listbase_clear(ListBase*l){l->first=l->last=nullptr;}
static size_t BLI_strncpy_rlen(char*d,const char*s,size_t n){auto len=std::min(std::strlen(s),n-1);std::memcpy(d,s,len);d[len]=0;return len;}
static void BLI_strncpy(char*d,const char*s,size_t n){BLI_strncpy_rlen(d,s,n);}
static void BLI_str_toupper_ascii(char*d,size_t n){for(size_t i=0;i<n;++i)d[i]=char(std::toupper(static_cast<unsigned char>(d[i])));}
#define OP_PY_SEP_CHAR '.'
#define OP_MAX_PY_IDNAME 61
#define OP_PY_SEP_LEN 1
#define OP_BL_SEP_STRING "_OT_"
#define OP_BL_SEP_LEN 4
static void WM_operator_properties_free(PointerRNA*p){if(p->data)IDP_FreeProperty(static_cast<IDProperty*>(p->data));p->data=nullptr;}
static void WM_keymap_clear(wmKeyMap*);
static void BLI_freelinkN(ListBase*,void*);
static wmKeyMap* WM_keymap_list_find(ListBase*,const char*,int,int);
static void WM_keyconfig_update_tag(wmKeyMap*,wmKeyMapItem*);
static wmKeyMapItem* wm_keymap_find_item_equals(wmKeyMap*,wmKeyMapItem*){std::abort();}
static wmKeyMapItem* wm_keymap_find_item_equals_result(wmKeyMap*,wmKeyMapItem*){std::abort();}
static void wm_keymap_addon_add(wmKeyMap*,wmKeyMap*){std::abort();}
static void wm_keymap_patch(wmKeyMap*,wmKeyMap*){std::abort();}
struct wmRuntime{ListBase keyconfigs{};wmKeyConfig*defaultconf=nullptr,*addonconf=nullptr,*userconf=nullptr;};struct wmWindowManager:ID{wmRuntime*runtime;};
static wmKeyMap* WM_modalkeymap_ensure(wmKeyConfig*,const char*,const void*){std::abort();}
struct wmTabletData{int active=0;};struct wmEvent{int type=0,val=0,direction=0,modifier=0,keymodifier=0,flag=0;char utf8_buf[8]{};wmTabletData tablet;};
static int WM_userdef_event_map(int type){return type;}
"""
 blocks=[]
 for sig in ['void BLI_addhead(','void BLI_addtail(','void BLI_remlink(','void BLI_freelinkN(','void *BLI_findstring(']:blocks.append(f('lists',sig))
 blocks += [f('idprop','IDProperty *IDP_New('), 'namespace blender::bke::idprop {\n'+f('idcreate','std::unique_ptr<IDProperty, IDPropertyDeleter> create_group(').replace('const eIDPropertyFlag flags)','const eIDPropertyFlag flags = {})')+'\n}', f('idprop','static IDProperty *idp_generic_copy('),f('idprop','static IDProperty *IDP_CopyGroup('),f('idprop','IDProperty *IDP_CopyProperty_ex('),f('idprop','IDProperty *IDP_CopyProperty('),f('rna_access','PointerRNA RNA_pointer_create_discrete(')]
 blocks += [f('operators',sig) for sig in ['void WM_operator_properties_create_ptr(','void WM_operator_properties_create(','void WM_operator_properties_alloc(','void WM_operator_properties_sanitize(','size_t WM_operator_bl_idname(']]
 blocks += [f('props',sig) for sig in ['void WM_operator_properties_border(','void WM_operator_properties_gesture_box_ex(','void WM_operator_properties_use_cursor_init(','void WM_operator_properties_gesture_box(','void WM_operator_properties_gesture_box_zoom(']]
 registrations=[]
 for name in dict.fromkeys(name.split('.')[1] for name,args in calls):registrations.append(f('view2d','static void VIEW2D_OT_'+name+'('))
 callbacks=sorted(set(re.findall(r'ot->(?:exec|invoke|modal|cancel|poll) = ([a-zA-Z0-9_]+);','\n'.join(registrations))))
 blocks += ['\n'.join('static void '+name+'(){std::abort();}' for name in callbacks),*registrations]
 blocks += ['enum{WM_KEYMAP_UPDATE_RECONFIGURE=1};static char wm_keymap_update_flag=0;', f('keymap','void WM_keyconfig_update_tag(')]
 blocks += [f('keymap',sig) for sig in ['wmKeyConfig *WM_keyconfig_new(','static wmKeyMapItem *wm_keymap_item_copy(','static void wm_keymap_item_free_data(','static void wm_keymap_item_properties_set(','static wmKeyMapDiffItem *wm_keymap_diff_item_copy(','static void wm_keymap_diff_item_free(','static wmKeyMap *wm_keymap_new(','static wmKeyMap *wm_keymap_copy(','void WM_keymap_clear(','static void keymap_event_set(','static void keymap_item_set_id(','wmKeyMapItem *WM_keymap_add_item(','wmKeyMapItem *WM_keymap_add_item_copy(','wmKeyMap *WM_keymap_list_find(','wmKeyMap *WM_keymap_ensure(','static wmKeyMap *wm_keymap_patch_update(','static bool wm_keymap_test_and_clear_update(']]
 blocks += [f('rna_api',sig) for sig in ['static int16_t keymap_item_modifier_flag_from_args(','static wmKeyMapItem *rna_KeyMap_item_new(','static wmKeyMapItem *rna_KeyMap_item_new_from_item(','static wmKeyMap *rna_KeyMaps_new(']]
 blocks += [f('eventsystem','BLI_INLINE bool wm_eventmatch(')]
 forward='\nvoid WM_operator_properties_create(PointerRNA*,const char*);\nIDProperty* IDP_CopyProperty(const IDProperty*);\nvoid WM_operator_properties_sanitize(PointerRNA*,bool);\n'
 setup='\nstatic void register_operators(bool ndof){\nregistry.clear();\n'
 for name in dict.fromkeys(name.split('.')[1] for name,args in calls):
  setup+=('if(ndof)' if name=='ndof' else '')+'{auto*ot=new wmOperatorType;ot->srna=new StructRNA;VIEW2D_OT_'+name+'(ot);ot->srna->identifier=ot->idname;registry[ot->idname]=ot;}\n'
 setup+='}\nstatic void actual_import(wmKeyMap*km){\n'+'\n'.join(import_calls)+'\n}\n'
 native=pre+decl+boundary+forward+'\n'.join(blocks)+setup
 metadata={'pin':PIN,'primary_source_sha256':hashes,'source_origins':origins,'extracted_native_bodies':extracted,'generated_inventory':expected,'executed_python_functions':['km_view2d','keymap_init_from_data'],'boundaries':['guarded allocation uses tracked host calloc/malloc/new; MEM_dupallocN exact-size tracked copy','blender::Vector/Span backing uses std::vector; exact native PointerRNA declaration/methods and discrete creation body execute','RNA scalar schema registration uses host descriptors populated by actual native View2D registrations and actual gesture/cursor property helpers; iteration and primitive RNA type/flag accessors are boundaries; no nested PointerRNA branch is supplied','operator registry lookup returns the executed native registration descriptor; callback bodies abort because never invoked in keymap baseline','UTF-8/native string helpers limited to all-ASCII canonical identifiers; actual operator name conversion executes','WM_keymap_patch_update runs actual no-addon/no-user canonical branch; unexercised diff/legacy/addon helper branches abort','native event matcher runs actual body; userdef event remapping is identity for positive MOUSEPAN controls','full Blender translation units, actual guarded allocator/RNA engine, target build and device execution are outside this bounded host fixture']}
 return native,metadata

def run(repo,source_dir,out,opt_level='both'):
 out.mkdir(parents=True,exist_ok=True)
 native,metadata=build_source(repo,source_dir)
 native+=HERE.joinpath('native_cases.inc.cc').read_text()
 cpp=out/'actual-keymap-baseline.cc';cpp.write_text(native,encoding='utf-8',newline='\n')
 compiler=shutil.which('clang++') or ('C:/Program Files/LLVM/bin/clang++.exe' if sys.platform=='win32' else shutil.which('g++'))
 assert compiler and Path(compiler).is_file(),compiler
 results=[]
 for opt in ('0','2') if opt_level=='both' else (opt_level,):
  for logname in (f'compile-O{opt}.log',f'execute-O{opt}.log'):
   prior=out/logname
   if prior.exists():prior.rename(out/(str(time.time_ns())+'-'+logname))
  exe=out/('baseline-O'+opt+('.exe' if sys.platform=='win32' else ''))
  command=[compiler,'-std=c++17','-O'+opt,'-UNDEBUG',str(cpp),'-o',str(exe)]
  start=time.time();compiled=subprocess.run(command,capture_output=True,text=True)
  (out/f'compile-O{opt}.log').write_text(compiled.stdout+compiled.stderr,encoding='utf-8')
  assert compiled.returncode==0,compiled.stderr
  executed=subprocess.run([str(exe)],capture_output=True,text=True)
  (out/f'execute-O{opt}.log').write_text(executed.stdout+executed.stderr,encoding='utf-8')
  assert executed.returncode==0,executed.stdout+executed.stderr
  result=json.loads(executed.stdout);assert result['status']=='PASS';result['opt']=opt;result['elapsed_seconds']=time.time()-start;results.append(result)
 assert len({json.dumps({k:v for k,v in r.items() if k not in ('opt','elapsed_seconds')},sort_keys=True) for r in results})==1
 report=metadata|{'status':'PASS','utc':__import__('datetime').datetime.now(__import__('datetime').timezone.utc).isoformat(),'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'fixture_sha256':{p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in [HERE/'native_boundaries.inc.cc',HERE/'native_cases.inc.cc']},'generated_cpp_sha256':hashlib.sha256(cpp.read_bytes()).hexdigest(),'executions':results,'native_translation_unit_claim':False,'production_edits':False,'target_or_device_execution':False,'prerequisite_only':True}
 (out/'baseline-report.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
 print(json.dumps({'status':'PASS','O_levels':[r['opt'] for r in results],'assertions_per_execution':results[0]['assertions'],'report':str(out/'baseline-report.json')}))
 return report
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--repo',type=Path,required=True);p.add_argument('--source-dir',type=Path);p.add_argument('--output-dir',type=Path,required=True);p.add_argument('--opt-level',choices=['0','2','both'],default='both');a=p.parse_args();run(a.repo.resolve(),a.source_dir,a.output_dir.resolve(),a.opt_level)
