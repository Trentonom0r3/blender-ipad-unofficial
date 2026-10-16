from pathlib import Path
import sys,subprocess,tempfile,json,hashlib,datetime
repo=Path(r'D:/dev/Projects/Repos/blendpad/blender-ipad-unofficial')
sys.path.insert(0,str(repo/'build'))
from test_compact_shelf import function
from test_touch_extrude import changed_source
import test_pencil_object_data_teardown as data
import test_pencil_material_assign_owner_teardown as material
work=Path(tempfile.mkdtemp(prefix='pencil-object-data-outer-'))
object_source=changed_source('source/blender/makesrna/intern/rna_object.cc')
access=changed_source('source/blender/makesrna/intern/rna_access.cc')
ui=changed_source('source/blender/editors/interface/interface_handlers.cc')
# These are disposable models derived from the existing unchanged setter/WM
# fixture. Retained memory is marked as removed; no allocator UAF is claimed.
prefix=data.HARNESS.split('/* ACTUAL_SOURCE */')[0]
prefix=prefix.replace('uint32_t tag=0;','uint32_t tag=0;int flag=0;')
prefix=prefix.replace('#include <string>','#include <string>\n#include <memory>\n#include <optional>\n#include <variant>\n#include <vector>')
prefix=prefix.replace('struct PointerRNA { void *data=nullptr; };',r"""
struct StructRNA {const char *identifier;bool id=false;StructRNA *base=nullptr;};
static StructRNA RNA_ID{"ID",true},RNA_Object{"Object",true,&RNA_ID},RNA_Mesh{"Mesh",true,&RNA_ID};
static StructRNA RNA_Material{"Material",true,&RNA_ID};
struct PointerRNA {void *data=nullptr;ID *owner_id=nullptr;StructRNA *type=nullptr;
 PointerRNA(void *value=nullptr):data(value){}
 template<class T>T *data_as()const{return static_cast<T*>(data);}
};
static PointerRNA PointerRNA_NULL{};
struct Scene {};
struct ReportList;
enum {PROP_POINTER=1,PROP_ID_REFCOUNT=2,PROP_NEVER_NULL=4,PROP_ID_SELF_CHECK=8,PROP_EDITABLE=16,
 RNA_MAGIC=123,RPT_STORE=4,IDP_ID=1,IDP_GROUP=2,IDP_FLAG_STATIC_TYPE=4,ID_FLAG_EMBEDDED_DATA=8};
struct PropertyRNA {int magic=RNA_MAGIC,type=PROP_POINTER,flag=PROP_ID_REFCOUNT;const char *identifier="data";};
struct PointerPropertyRNA:PropertyRNA {
 StructRNA *type=&RNA_Mesh;PointerRNA(*get)(PointerRNA*)=nullptr;
 void(*set)(PointerRNA*,PointerRNA,ReportList*)=nullptr;
};
struct IDProperty {int type=IDP_ID;const char *name="idprop";};
""")
prefix=prefix.replace('static bool refuse_native_teardown=false', 'static void (*g_probe_hook)()=nullptr;\nstatic bool refuse_native_teardown=false')
prefix=prefix.replace('  if(replace_main_on_teardown)G_MAIN=&replacement_main;\n  return true;', '  if(replace_main_on_teardown)G_MAIN=&replacement_main;\n  if(g_probe_hook)g_probe_hook();\n  return true;')
model=r"""
#define BLI_assert_msg(value,message) assert(value)
template<class T,class...R>static bool fixture_elem(T value,R...other){return((value==other)||...);}
#define ELEM(value,...) fixture_elem(value,__VA_ARGS__)
static Object *g_removed_object=nullptr;static ID *g_removed_data=nullptr;static PointerRNA *g_dead_wrapper=nullptr;
static int g_stale_object_getters=0,g_stale_data_getters=0,g_stale_wrapper_getters=0,g_stale_refcounts=0;
static int g_getters=0,g_refcounts=0,g_late_updates=0,g_stale_owner_tags=0,g_stale_wrapper_updates=0,g_update_context_changes=0;
static int g_tags=0,g_relations=0,g_notifiers=0,g_material_boundary_calls=0;
static bContext *g_original_context=nullptr;
static bool RNA_struct_is_a(const StructRNA *type,const StructRNA *base){while(type){if(type==base)return true;type=type->base;}return false;}
static bool RNA_struct_is_ID(const StructRNA *type){return type&&type->id;}
static PropertyRNA *rna_ensure_property(PropertyRNA *prop){return prop;}
static int RNA_property_type(PropertyRNA *prop){return prop->type;}
static IDProperty *rna_idproperty_check(PropertyRNA**,PointerRNA*){return nullptr;}
static StructRNA *RNA_property_pointer_type(PointerRNA*,PropertyRNA *prop){return static_cast<PointerPropertyRNA*>(prop)->type;}
static IDProperty *RNA_struct_system_idprops(PointerRNA*,bool){return nullptr;}
static void IDP_AssignID(IDProperty*,ID*,int){assert(false);}
static void rna_idproperty_touch(IDProperty*){assert(false);}
static void IDP_ReplaceInGroup_ex(IDProperty*,IDProperty*,IDProperty*,int){assert(false);}
static void IDP_ReplaceInGroup(IDProperty*,IDProperty*){assert(false);}
namespace blender::bke::idprop {static std::unique_ptr<IDProperty> create(const char*,ID*,int){assert(false);return {};}}
static void BKE_reportf(ReportList *reports,int,const char *message,...){if(reports)reports->message=message;}
static int fixture_refcount(const ID *id){++g_refcounts;if(id==g_removed_data)++g_stale_refcounts;return id->users;}
#define ID_REFCOUNTING_USERS(id) fixture_refcount(id)
static Mesh *BKE_mesh_wrapper_ensure_subdivision(Mesh *mesh){if(mesh==g_removed_data)++g_stale_data_getters;return mesh;}
static PointerRNA RNA_id_pointer_create(ID *id){PointerRNA ptr{id};ptr.owner_id=id;ptr.type=id?&RNA_Mesh:nullptr;return ptr;}
static bool WM_event_ipad_pencil_paint_owner_teardown_next(bContext*,Main*,bool*){++g_material_boundary_calls;assert(false);return false;}
static bool RNA_object_material_assign_paint_owner_teardown(bContext*,PointerRNA*,PointerRNA,bool,ReportList*){++g_material_boundary_calls;assert(false);return false;}
void Object_active_material_set(PointerRNA*,PointerRNA,ReportList*){assert(false);}
void MaterialSlot_material_set(PointerRNA*,PointerRNA,ReportList*){assert(false);}
enum {ID_RECALC_GEOMETRY=16,NC_OBJECT=32,ND_DRAW=64};
static void DEG_id_tag_update(ID *id,int){++g_tags;if(g_removed_object&&id==&g_removed_object->id)++g_stale_owner_tags;}
static void DEG_relations_tag_update(Main*){++g_relations;}
static void WM_main_add_notifier(int,void*){++g_notifiers;}
"""
actual='\n'.join((data.RNA_LOOKUPS,data.OBJECT_OWNER_HELPER,data.OBJECT_OWNER_API,data.DATA_SETTER,
 function(object_source,'static PointerRNA rna_Object_data_get('),material.ACCESS_HELPERS,
 function(access,'void RNA_property_pointer_set(')))
updates='\n'.join(function(object_source,sig)for sig in('void rna_Object_internal_update_data_impl(',
 'void rna_Object_internal_update_data_dependency(','void rna_Object_data_update('))
tracked=r"""
static PointerRNA tracked_get(PointerRNA *ptr){++g_getters;
 if(ptr==g_dead_wrapper)++g_stale_wrapper_getters;
 if(ptr->data==g_removed_object)++g_stale_object_getters;
 return rna_Object_data_get(ptr);
}
static bool RNA_property_update_check(PropertyRNA*){return true;}
static void RNA_property_update(bContext *C,PointerRNA *ptr,PropertyRNA*){
 ++g_late_updates;if(ptr==g_dead_wrapper)++g_stale_wrapper_updates;
 if(C!=g_original_context)++g_update_context_changes;
 rna_Object_data_update(C?C->main:nullptr,nullptr,ptr);
}
"""
python_model=r"""
struct PyObject{};struct BPy_StructRNA{std::optional<PointerRNA>ptr;};
static PyObject exception;static PyObject *PyExc_RuntimeError=&exception;
static bContext *g_bpy_context=nullptr;static int g_reports_to_error=0,g_python_errors=0,g_decrefs=0;
static bContext *BPY_context_get(){return g_bpy_context;}
static void BKE_reports_init(ReportList *reports,int){*reports={};}
static int BPy_reports_to_error(ReportList *reports,PyObject*,bool){++g_reports_to_error;if(!reports->message.empty()){++g_python_errors;return -1;}return 0;}
static void Py_XDECREF(PyObject *value){if(value)++g_decrefs;}
static void PyErr_SetString(PyObject*,const char*){++g_python_errors;}
"""
python_frame='static int probe_python_assignment(PointerRNA *ptr,PropertyRNA *prop,BPy_StructRNA *param,PyObject *value_new){\n'+material.PYTHON_SCOPE+material.PYTHON_COMMON+'\n'+material.PYTHON_LATE
ui_fn=function(ui,'static void ui_selectcontext_apply(')
start=ui_fn.index('        const PointerRNA &other_value = std::get<PointerRNA>(delta);')
end=ui_fn.index('\n      }',start)
pointer_branch=ui_fn[start:end]
ui_frame='static void probe_ui_selected_tail(bContext *C,PointerRNA lptr,PropertyRNA *prop,PointerRNA value){\nPropertyRNA *lprop=prop;std::variant<PointerRNA>delta{value};\n'+pointer_branch+'\n'+ui_fn[ui_fn.index('      RNA_property_update(C, &lptr, prop);',end):].split('\n',1)[0]+'\n}\n'
post=data.HARNESS.split('/* ACTUAL_SOURCE */')[1].split('int main()')[0]
probe=r"""
static Main *g_probe_main=nullptr;static Object *g_probe_object=nullptr,*g_replace_object=nullptr;
static ID *g_probe_old=nullptr,*g_probe_new=nullptr;static PointerRNA *g_probe_ptr=nullptr;
static bContext *g_switched_context=nullptr;static int g_mutation=0;
static void probe_hook(){
 if(g_mutation==1||g_mutation==2){unlink(g_probe_main->objects,g_probe_object);g_removed_object=g_probe_object;
  if(g_mutation==2)append(g_probe_main->objects,g_replace_object);}
 if(g_mutation==3){unlink(g_probe_main->meshes,g_probe_old);g_removed_data=g_probe_old;}
 if(g_mutation==4){unlink(g_probe_main->meshes,g_probe_new);g_removed_data=g_probe_new;}
 if(g_mutation==5)g_dead_wrapper=g_probe_ptr;
 if(g_mutation==6)g_bpy_context=g_switched_context;
}
static void reset_probe(Main &main,Object &object,Object &replacement,Mesh &old_mesh,Mesh &new_mesh,bContext &C,PointerRNA &ptr){
 replacement=object;replacement.next=nullptr;
 g_removed_object=nullptr;g_removed_data=nullptr;g_dead_wrapper=nullptr;
 g_stale_object_getters=g_stale_data_getters=g_stale_wrapper_getters=g_stale_refcounts=0;
 g_getters=g_refcounts=g_late_updates=g_stale_owner_tags=g_stale_wrapper_updates=g_update_context_changes=0;
 g_tags=g_relations=g_notifiers=g_material_boundary_calls=0;g_reports_to_error=g_python_errors=g_decrefs=0;
 g_original_context=&C;g_bpy_context=&C;g_probe_main=&main;g_probe_object=&object;g_replace_object=&replacement;
 g_probe_old=&old_mesh;g_probe_new=&new_mesh;g_probe_ptr=&ptr;g_probe_hook=probe_hook;
}
static void print_record(const char *name,int result,ReportList &reports){
 std::printf("{\"name\":\"%s\",\"result\":%d,\"teardown\":%d,\"assignment\":%d,\"getters\":%d,\"stale_object_getters\":%d,\"stale_data_boundary\":%d,\"stale_wrapper_getters\":%d,\"refcounts\":%d,\"stale_refcounts\":%d,\"updates\":%d,\"stale_owner_tags\":%d,\"stale_wrapper_updates\":%d,\"update_context_changes\":%d,\"reported\":%d}\n",
 name,result,teardown_calls,assign_calls,g_getters,g_stale_object_getters,g_stale_data_getters,g_stale_wrapper_getters,
 g_refcounts,g_stale_refcounts,g_late_updates,g_stale_owner_tags,g_stale_wrapper_updates,g_update_context_changes,int(!reports.message.empty()));
 assert(g_material_boundary_calls==0);
}
int main(){
 for(g_mutation=1;g_mutation<=4;++g_mutation){
  Main main;wmWindowManager wm;wmWindow win;Object object,replacement;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
  bContext C{&main,&wm,&win};PointerRNA ptr{&object},value{&new_mesh};ptr.owner_id=&object.id;ptr.type=&RNA_Object;value.owner_id=&new_mesh;value.type=&RNA_Mesh;
  reset_probe(main,object,replacement,old_mesh,new_mesh,C,ptr);wmEventHandler_Op owner;add_owner(win,owner,10,50,10);
  PointerPropertyRNA property;property.get=tracked_get;property.set=rna_Object_data_set;
  ReportList reports;RNA_property_pointer_set(&ptr,&property,value,&reports);
  assert(teardown_calls==1&&assign_calls==0&&!reports.message.empty());
#ifndef NDEBUG
  if(g_mutation<3)assert(g_stale_object_getters==1);else assert(g_stale_refcounts>=1);
#else
  assert(g_getters==0&&g_refcounts==0);
#endif
  print_record(g_mutation==1?"debug_owner_removed":g_mutation==2?"debug_owner_replaced":g_mutation==3?"debug_old_data_removed":"debug_incoming_removed",0,reports);
 }
 for(int scenario:{1,5,6}){
  Main main,other_main;wmWindowManager wm;wmWindow win;Object object,replacement;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
  bContext C{&main,&wm,&win},other_C{&other_main,nullptr,nullptr};PointerRNA ptr{&object},value{&new_mesh};ptr.owner_id=&object.id;ptr.type=&RNA_Object;value.owner_id=&new_mesh;value.type=&RNA_Mesh;
  reset_probe(main,object,replacement,old_mesh,new_mesh,C,ptr);g_switched_context=&other_C;g_mutation=scenario;wmEventHandler_Op owner;add_owner(win,owner,10,50,11);
  PointerPropertyRNA property;property.get=tracked_get;property.set=rna_Object_data_set;
  BPy_StructRNA param;param.ptr=value;PyObject new_value;ReportList reports;
  const int result=probe_python_assignment(&ptr,&property,&param,&new_value);
  if(scenario==1)assert(result==-1&&g_late_updates==0&&assign_calls==0);
  if(scenario==5)assert(result==0&&g_stale_wrapper_updates==1&&assign_calls==1);
  if(scenario==6)assert(result==0&&g_update_context_changes==1&&assign_calls==1);
  print_record(scenario==1?"python_owner_removed_report_gate":scenario==5?"python_wrapper_tombstone":"python_context_switch",result,reports);
 }
 for(g_mutation=1;g_mutation<=2;++g_mutation){
  Main main;wmWindowManager wm;wmWindow win;Object object,replacement;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
  bContext C{&main,&wm,&win};PointerRNA ptr{&object},value{&new_mesh};ptr.owner_id=&object.id;ptr.type=&RNA_Object;value.owner_id=&new_mesh;value.type=&RNA_Mesh;
  reset_probe(main,object,replacement,old_mesh,new_mesh,C,ptr);wmEventHandler_Op owner;add_owner(win,owner,10,50,12);
  PointerPropertyRNA property;property.get=tracked_get;property.set=rna_Object_data_set;ReportList reports;
  probe_ui_selected_tail(&C,ptr,&property,value);
  assert(teardown_calls==1&&assign_calls==0&&g_late_updates==1&&g_stale_owner_tags==1);
  print_record(g_mutation==1?"ui_owner_removed_update":"ui_owner_replaced_update",0,reports);
 }
 for(int control=0;control<5;++control){
  Main main;wmWindowManager wm;wmWindow win;Object object,replacement;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
  bContext C{&main,&wm,&win};PointerRNA ptr{&object},value{&new_mesh};ptr.owner_id=&object.id;ptr.type=&RNA_Object;value.owner_id=&new_mesh;value.type=&RNA_Mesh;
  reset_probe(main,object,replacement,old_mesh,new_mesh,C,ptr);g_mutation=0;wmEventHandler_Op owner;
  if(control) add_owner(win,owner,10,50,13);
  if(control==1)object.mode=OB_MODE_EDIT;
  if(control==2)value=PointerRNA{&old_mesh},value.owner_id=&old_mesh,value.type=&RNA_Mesh;
  if(control==3)value=PointerRNA_NULL;
  if(control==4)value.type=&RNA_Object;
  PointerPropertyRNA property;property.get=tracked_get;property.set=rna_Object_data_set;ReportList reports;
  RNA_property_pointer_set(&ptr,&property,value,&reports);
  if(control==0)assert(assign_calls==1&&teardown_calls==0&&reports.message.empty());
  if(control==1)assert(assign_calls==0&&teardown_calls==0&&reports.message.empty());
  if(control==2)assert(assign_calls==1&&teardown_calls==0&&old_mesh.users==1&&reports.message.empty());
  if(control==3)assert(assign_calls==0&&teardown_calls==1&&reports.message.empty());
  if(control==4)assert(assign_calls==0&&teardown_calls==0&&!reports.message.empty());
  print_record(control==0?"control_no_owner":control==1?"control_Edit":control==2?"control_same_pointer":control==3?"control_null_nonempty":"control_type_error",0,reports);
 }
}
"""
source='\n'.join((prefix,model,actual,updates,tracked,python_model,python_frame,ui_frame,post,probe))
compiler=r'C:/Program Files/LLVM/bin/clang++.exe'
records=[]
for release in(False,True):
 text=source
 if release:text=text.replace('#define BLI_assert(value)','#define NDEBUG\n#define BLI_assert(value)',1)
 name='release'if release else'debug';src=work/(name+'.cc');exe=work/(name+'.exe');src.write_bytes(text.encode())
 compiled=subprocess.run([compiler,'-std=c++17','-Wall','-Wextra','-Werror','-pedantic','-Wno-unused-function','-Wno-unused-variable',str(src),'-o',str(exe)],capture_output=True,text=True)
 (work/(name+'-compile.log')).write_text(compiled.stdout+compiled.stderr)
 if compiled.returncode:print(compiled.stderr);raise SystemExit(compiled.returncode)
 result=subprocess.run([str(exe)],capture_output=True,text=True)
 (work/(name+'-execution.log')).write_text(result.stdout+result.stderr)
 if result.returncode:print(result.stdout,result.stderr);raise SystemExit(result.returncode)
 scenarios=[json.loads(line)for line in result.stdout.splitlines()if line.startswith('{')]
 records.append({'mode':name,'source':str(src),'source_sha256':hashlib.sha256(text.encode()).hexdigest(),'compile_exit':0,'execution_exit':0,'scenarios':scenarios})
report={'status':'executed_disposable_retained_storage_characterization_no_correction','timestamp_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'source_revision':'5a7deb6f4ad8f74afaa3f8a30dd3859dbc091e83','patch_sha256':hashlib.sha256((repo/'patches/blender-ipad.patch').read_bytes()).hexdigest(),'temporary_directory':str(work),'executions':records,'actual_source':['Object.data setter/getter/UID lookup','registered Object-UID WM helper/export','RNA_property_pointer_set Debug/Release body and exact material-only profile guard','Python pointer conversion/report and late-update source blocks','native UI selected-pointer set/update source lines','Object.data dependency/update callbacks'],'boundaries':['No production or tracked fixture change; backing storage intentionally retained and tombstoned, not freed.','Native cancellation callback, RNA metadata/refinement, evaluated subdivision, Python wrapper invalidation/context and UI selected-target scaffolding are modeled.','Tombstone counters identify post-callback access/update boundaries, not a real allocator UAF, current Release crash, UIKit timing, device path or proof every native Cancel deletes IDs.','Python owner-removal report prevents its late update; Debug getter/refcount accesses occur before that report gate.','Null nonempty control retains current teardown-before-native-null-return order; no optimization or corrective semantics claimed.']}
out=repo/'output/ui-preview/pencil-rna-owned-dispatch/object-data-outer-characterization.json';out.write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({'report':str(out),'temporary_directory':str(work),'modes':[(x['mode'],len(x['scenarios']))for x in records]},indent=2))
