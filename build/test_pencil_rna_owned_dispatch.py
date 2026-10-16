"""Execute owned ID/Mesh Python producers and native borrowed refusal frontiers.

This executes the actual 15 RNA native bodies, owned dispatcher and strict WM
scan in an instrumented host environment. Main/list/refinement/context queries,
ParameterList/Python conversion, allocation, depsgraph and native BKE operations
remain explicit boundaries. It is not interpreter, UIKit, device or rollback
proof. Initially absent arbitrary provider deletion remains the native baseline.
"""
from pathlib import Path
import os
import hashlib
import re
import shutil
import subprocess
import tempfile
import unittest

from test_compact_shelf import function
from test_touch_extrude import changed_source
import test_pencil_rna_override_owner_teardown as ids
import test_pencil_mesh_storage_owner_teardown as mesh

ROOT = Path(__file__).resolve().parents[1]
ID_NAMES = ids.CALLBACK_NAMES
MESH_NAMES = mesh.CALLBACK_NAMES


def fixture_prefix():
    prefix = ids.PREFIX.replace("#include <vector>", "#include <vector>\n#include <array>\n#include <cstdio>\n#include <map>\n#include <string>\n#include <optional>\n#include <cstring>\n#include <memory>")
    prefix = prefix.replace("ID_OB='O' | ('B'<<8)", "ID_ME='M' | ('E'<<8), ID_OB='O' | ('B'<<8)")
    prefix = prefix.replace("char name[3]", "char name[66]")
    prefix = prefix.replace("int tag=ID_TAG_EXTERN;ID *newid=nullptr;", "int tag=ID_TAG_EXTERN;int flag=0;ID *newid=nullptr;")
    prefix = prefix.replace("struct ReportList { int errors=0; };", "struct ReportList { int errors=0; const char *last=nullptr; };")
    line = next(line for line in prefix.splitlines() if line.startswith("static Main *CTX_data_main("))
    prefix = prefix.replace(line, r"""
static void (*g_main_hook)()=nullptr;
static int g_main_queries=0;
static Main *CTX_data_main(const bContext *C){
 ++g_main_queries;auto hook=g_main_hook;g_main_hook=nullptr;if(hook)hook();return C?C->main:nullptr;
}
""")
    return prefix


RNA_MODEL = r"""
#define WITH_PYTHON
#define BPy_BEGIN_ALLOW_THREADS ((void)0)
#define BPy_END_ALLOW_THREADS ((void)0)
#define FOREACH_MAIN_ID_BEGIN(main,id) { for(ID *fixture_id:(main)->ids) { id=fixture_id;
#define FOREACH_MAIN_ID_END }}
struct StructRNA {const char *identifier; StructRNA *base=nullptr;};
static StructRNA RNA_ID{"ID"},RNA_Object{"Object",&RNA_ID},RNA_Mesh{"Mesh",&RNA_ID};
static StructRNA RNA_Scene{"Scene",&RNA_ID},RNA_Collection{"Collection",&RNA_ID};
static StructRNA RNA_Library{"Library",&RNA_ID},RNA_IDOverrideLibrary{"IDOverrideLibrary"};
static StructRNA RNA_MeshVertices{"MeshVertices"},RNA_MeshEdges{"MeshEdges"};
static StructRNA RNA_MeshLoops{"MeshLoops"},RNA_MeshPolygons{"MeshPolygons"};
static StructRNA RNA_Function{"Function"};
struct AncestorPointerRNA {StructRNA *type=nullptr;void *data=nullptr;};
template<class T> struct FixtureVector : std::vector<T> {
 using std::vector<T>::vector;bool is_empty()const{return this->empty();}
};
struct PointerRNA {ID *owner_id=nullptr;StructRNA *type=nullptr;void *data=nullptr;
 FixtureVector<AncestorPointerRNA> ancestors{};};
static bool RNA_struct_is_a(const StructRNA *type,const StructRNA *base){
 while(type){if(type==base)return true;type=type->base;}return false;
}
static bool RNA_struct_is_ID(const StructRNA *type){return RNA_struct_is_a(type,&RNA_ID);}
static short RNA_type_to_ID_code(const StructRNA *type){
 if(type==&RNA_Object)return ID_OB;if(type==&RNA_Mesh)return ID_ME;
 if(type==&RNA_Scene)return ID_SCE;if(type==&RNA_Collection)return ID_GR;if(type==&RNA_Library)return ID_LI;return 0;
}
struct FunctionRNA;
struct ParameterList;
using CallFunc=void(*)(bContext*,ReportList*,PointerRNA*,ParameterList*);
struct FunctionRNA {const char *identifier="unknown";CallFunc call=nullptr;};
struct RawParameter {std::array<unsigned char,16> storage{};size_t size=0;};
struct ParameterList {FunctionRNA *func=nullptr;std::map<std::string,RawParameter> values;};
template<class T> static void param(ParameterList &parms,const char *name,T value){
 auto &slot=parms.values[name];slot.storage.fill(0x5a);slot.size=sizeof(T);std::memcpy(slot.storage.data(),&value,sizeof(T));
}
template<class T> static T result(ParameterList &parms,const char *name){
 auto found=parms.values.find(name);assert(found!=parms.values.end()&&found->second.size==sizeof(T));
 T value{};std::memcpy(&value,found->second.storage.data(),sizeof(T));return value;
}
FunctionRNA rna_ID_override_create_func{"override_create"};
FunctionRNA rna_ID_override_hierarchy_create_func{"override_hierarchy_create"};
FunctionRNA rna_IDOverrideLibrary_reset_func{"reset"},rna_IDOverrideLibrary_destroy_func{"destroy"};
FunctionRNA rna_IDOverrideLibrary_resync_func{"resync"},rna_ID_user_remap_func{"user_remap"};
FunctionRNA rna_ID_make_local_func{"make_local"};
FunctionRNA rna_MeshVertices_add_func{"add"},rna_MeshEdges_add_func{"add"};
FunctionRNA rna_MeshLoops_add_func{"add"},rna_MeshPolygons_add_func{"add"};
FunctionRNA rna_Mesh_update_func{"update"},rna_Mesh_clear_geometry_func{"clear_geometry"};
FunctionRNA rna_Mesh_validate_func{"validate"},rna_Mesh_validate_material_indices_func{"validate_material_indices"};
static ID *g_heap_destroy_id=nullptr,*g_destroyed_id=nullptr;
static int g_parameter_writes=0;
static void RNA_parameter_get_lookup(ParameterList *parms,const char *name,void **out){
 auto found=parms->values.find(name);*out=found==parms->values.end()?nullptr:found->second.storage.data();
}
static void RNA_parameter_set_lookup(ParameterList *parms,const char *name,const void *value){
 auto found=parms->values.find(name);assert(found!=parms->values.end());
 std::memcpy(found->second.storage.data(),value,found->second.size);++g_parameter_writes;
}
static bContext *g_bpy_context=nullptr;
static bContext *BPY_context_get(){return g_bpy_context;}
static bool RNA_function_is_id_storage_mutation(const FunctionRNA *);
static bool RNA_function_id_storage_call_absent(const FunctionRNA *,ReportList *);
static bool RNA_function_id_storage_call_owned(bContext *,PointerRNA *,FunctionRNA *,ParameterList *,ReportList *);
"""


def merged_models():
    native = mesh.NATIVE
    native = native.replace("static int g_writes=0,g_cache_dirty=0,g_tags=0,g_notifiers=0,g_anim_frees=0,g_required=0;", "static int g_cache_dirty=0,g_anim_frees=0,g_required=0;")
    native = native.replace("static bool g_allow_owner=false,g_validate_result=false,g_material_result=false;", "static bool g_validate_result=false,g_material_result=false;")
    native = native.replace(function(native, "static bool has_owner("), "")
    native = native.replace(function(native, "static void WM_main_add_notifier("), "")
    id_native=ids.NATIVE
    old="static void BKE_id_delete(Main *main,ID *id) {native_write(main,id);++g_deletes;}"
    deletion=r"""
static void fixture_native_delete(Main *main,ID *id){
 native_write(main,id);++g_deletes;
 if(id==g_heap_destroy_id){main->ids.erase(std::remove(main->ids.begin(),main->ids.end(),id),main->ids.end());
  g_destroyed_id=id;delete id;g_heap_destroy_id=nullptr;}
}
static void BKE_id_delete(Main *main,ID *id){fixture_native_delete(main,id);}
"""
    assert old in id_native
    id_native=id_native.replace(old,deletion)
    old=function(id_native,"static void BKE_lib_override_library_delete(")
    id_native=id_native.replace(old,"static void BKE_lib_override_library_delete(Main *main,ID *id){fixture_native_delete(main,id);}")
    id_native="static void fixture_native_delete(Main *,ID *);\n"+id_native
    return id_native + native


def source_parts():
    source=changed_source(ids.RNA_PATH)
    # The production author supplies the exact marker after all seven ID bodies.
    marker=source.index("/* Exact owned ID/Mesh RNA dispatch")
    owned_function=function(source,"bool RNA_function_id_storage_call_owned(")
    end=source.index(owned_function,marker)+len(owned_function)
    owned=source[marker:end]
    py=changed_source("source/blender/python/intern/bpy_rna.cc")
    access=changed_source("source/blender/makesrna/intern/rna_access.cc")
    generic=function(access,"int RNA_function_call(")
    return owned,py,generic


def callbacks():
    sources=[changed_source(mesh.MESH_PATH),changed_source(mesh.API_PATH)]
    output=[]
    for index,(name,kind) in enumerate(zip(MESH_NAMES,("void ",)*6+("bool ",)*2)):
        source=sources[0] if index<4 else sources[1]
        signature=kind+name+"("
        if "static "+signature in source:signature="static "+signature
        output.append(function(source,signature))
    return "\n".join(output)


def source_with_main(main,mode="id",legacy_owned=False):
    owned,py,generic=source_parts()
    support=ids.TEST_SUPPORT if mode=="id" else mesh.SUPPORT
    reset="g_main_hook=nullptr;g_main_queries=0;g_bpy_context=&C;g_parameter_writes=0;g_destroyed_id=nullptr;g_heap_destroy_id=nullptr;"
    support=support.replace("g_cancel_hook=nullptr;", "g_cancel_hook=nullptr;"+reset)
    native=merged_models()
    functions="\n".join(ids.CALLBACKS)+"\n"+callbacks()
    result="\n".join((fixture_prefix(),RNA_MODEL,native,ids.WM_OWNER_NEXT,
        "\n".join(mesh.ED_CALLBACKS),ids.HELPERS,mesh.MESH_HELPER,functions,owned,generic))
    if legacy_owned:result+="\n"+legacy_adapters(mode)
    result+="\n"+support
    return result+"\n"+main


def compile_run(source, expected_failure_marker=None):
    candidates=[shutil.which("clang++"),shutil.which("g++")]
    if os.name=="nt":candidates.append(r"C:/Program Files/LLVM/bin/clang++.exe")
    compiler=next((str(p) for p in candidates if p and Path(p).is_file()),None)
    if not compiler:raise unittest.SkipTest("C++17 compiler unavailable; owned dispatcher was not executed")
    with tempfile.TemporaryDirectory(prefix="ipad-rna-owned-dispatch-") as folder:
        work=Path(folder);test=work/"test.cc";test.write_text(source,encoding="utf-8")
        binary=work/("tests.exe" if os.name=="nt" else "tests")
        subprocess.run([compiler,"-std=c++17","-Wall","-Wextra","-Werror","-pedantic","-Wno-unused-function","-Wno-unused-variable",str(test),"-o",str(binary)],check=True,cwd=work)
        executed=subprocess.run([str(binary)],cwd=work,capture_output=True,text=True)
        output=executed.stdout+executed.stderr
        if expected_failure_marker is not None:
            if executed.returncode==0 or expected_failure_marker not in output:
                raise AssertionError("Historical baseline did not fail at the proved regression frontier: "+output)
        elif executed.returncode:
            raise AssertionError("Connected C++ fixture failed: "+output)
        return executed


ADAPTERS = r"""
static bContext *fixture_effective_context(Main *main,bContext *C,bContext &fallback){
 if(!C){fallback.main=main;C=&fallback;}g_bpy_context=C;return C;
}
static StructRNA *fixture_id_type(ID *id){
 switch(GS(id->name)){case ID_ME:return &RNA_Mesh;case ID_SCE:return &RNA_Scene;
  case ID_GR:return &RNA_Collection;case ID_LI:return &RNA_Library;default:return &RNA_Object;}
}
static PointerRNA fixture_id_target(ID *id){return {id,fixture_id_type(id),id};}
static PointerRNA fixture_override_target(ID *id,IDOverrideLibrary *data){return {id,&RNA_IDOverrideLibrary,data};}
static bool fixture_dispatch(bContext *C,PointerRNA target,FunctionRNA &func,ParameterList &parms,ReportList *reports){
 parms.func=&func;return RNA_function_id_storage_call_owned(C,&target,&func,&parms,reports);
}
static ID *fixture_owned_rna_ID_override_create(ID *id,Main *main,bContext *C,bool remap){
#ifdef WITH_APPLE_CROSSPLATFORM
 bContext fallback;C=fixture_effective_context(main,C,fallback);ParameterList parms;ReportList reports;
 param(parms,"remap_local_usages",remap);param<ID*>(parms,"id",nullptr);
 return fixture_dispatch(C,fixture_id_target(id),rna_ID_override_create_func,parms,&reports)?result<ID*>(parms,"id"):nullptr;
#else
 return rna_ID_override_create(id,main,C,remap);
#endif
}
static ID *fixture_owned_rna_ID_override_hierarchy_create(ID *id,Main *main,bContext *C,Scene *scene,ViewLayer *layer,ID *hint,bool editable){
#ifdef WITH_APPLE_CROSSPLATFORM
 bContext fallback;C=fixture_effective_context(main,C,fallback);ParameterList parms;ReportList reports;
 param(parms,"scene",scene);param(parms,"view_layer",layer);param(parms,"reference",hint);
 param(parms,"do_fully_editable",editable);param<ID*>(parms,"id",nullptr);
 return fixture_dispatch(C,fixture_id_target(id),rna_ID_override_hierarchy_create_func,parms,&reports)?result<ID*>(parms,"id"):nullptr;
#else
 return rna_ID_override_hierarchy_create(id,main,C,scene,layer,hint,editable);
#endif
}
static void fixture_owned_rna_ID_override_library_reset(ID *id,IDOverrideLibrary *data,Main *main,bContext *C,ReportList *reports,bool hierarchy,bool system){
#ifdef WITH_APPLE_CROSSPLATFORM
 bContext fallback;C=fixture_effective_context(main,C,fallback);ParameterList parms;
 param(parms,"do_hierarchy",hierarchy);param(parms,"set_system_override",system);
 (void)fixture_dispatch(C,fixture_override_target(id,data),rna_IDOverrideLibrary_reset_func,parms,reports);
#else
 rna_ID_override_library_reset(id,data,main,C,reports,hierarchy,system);
#endif
}
static void fixture_owned_rna_ID_override_library_destroy(ID *id,IDOverrideLibrary *data,Main *main,bContext *C,ReportList *reports,bool hierarchy){
#ifdef WITH_APPLE_CROSSPLATFORM
 bContext fallback;C=fixture_effective_context(main,C,fallback);ParameterList parms;
 param(parms,"do_hierarchy",hierarchy);
 (void)fixture_dispatch(C,fixture_override_target(id,data),rna_IDOverrideLibrary_destroy_func,parms,reports);
#else
 rna_ID_override_library_destroy(id,data,main,C,reports,hierarchy);
#endif
}
static bool fixture_owned_rna_ID_override_library_resync(ID *id,IDOverrideLibrary *data,Main *main,bContext *C,ReportList *reports,Scene *scene,ViewLayer *layer,Collection *residual,bool enforce,bool whole){
#ifdef WITH_APPLE_CROSSPLATFORM
 bContext fallback;C=fixture_effective_context(main,C,fallback);ParameterList parms;
 param(parms,"scene",scene);param(parms,"view_layer",layer);param(parms,"residual_storage",residual);
 param(parms,"do_hierarchy_enforce",enforce);param(parms,"do_whole_hierarchy",whole);param(parms,"success",false);
 return fixture_dispatch(C,fixture_override_target(id,data),rna_IDOverrideLibrary_resync_func,parms,reports)&&result<bool>(parms,"success");
#else
 return rna_ID_override_library_resync(id,data,main,C,reports,scene,layer,residual,enforce,whole);
#endif
}
static void fixture_owned_rna_ID_user_remap(ID *id,Main *main,bContext *C,ID *other){
#ifdef WITH_APPLE_CROSSPLATFORM
 bContext fallback;C=fixture_effective_context(main,C,fallback);ParameterList parms;ReportList reports;
 param(parms,"new_id",other);(void)fixture_dispatch(C,fixture_id_target(id),rna_ID_user_remap_func,parms,&reports);
#else
 rna_ID_user_remap(id,main,C,other);
#endif
}
static ID *fixture_owned_rna_ID_make_local(ID *id,Main *main,bContext *C,bool proxy,bool clear_override,bool asset){
#ifdef WITH_APPLE_CROSSPLATFORM
 bContext fallback;C=fixture_effective_context(main,C,fallback);ParameterList parms;ReportList reports;
 param(parms,"clear_proxy",proxy);param(parms,"clear_liboverride",clear_override);param(parms,"clear_asset_data",asset);param<ID*>(parms,"id",nullptr);
 return fixture_dispatch(C,fixture_id_target(id),rna_ID_make_local_func,parms,&reports)?result<ID*>(parms,"id"):nullptr;
#else
 return rna_ID_make_local(id,main,C,proxy,clear_override,asset);
#endif
}
static bool fixture_owned_mesh(Mesh *input,Main *main,bContext *C,ReportList *reports,int profile,int count=1,bool first=false,bool second=true){
 bContext fallback;C=fixture_effective_context(main,C,fallback);ParameterList parms;
 StructRNA *types[]={&RNA_MeshVertices,&RNA_MeshEdges,&RNA_MeshLoops,&RNA_MeshPolygons,&RNA_Mesh,&RNA_Mesh,&RNA_Mesh,&RNA_Mesh};
 FunctionRNA *funcs[]={&rna_MeshVertices_add_func,&rna_MeshEdges_add_func,&rna_MeshLoops_add_func,&rna_MeshPolygons_add_func,
  &rna_Mesh_clear_geometry_func,&rna_Mesh_update_func,&rna_Mesh_validate_func,&rna_Mesh_validate_material_indices_func};
 if(profile<4)param(parms,"count",count);
 if(profile==5){param(parms,"calc_edges",first);param(parms,"calc_edges_loose",second);}
 if(profile==6){param(parms,"verbose",first);param(parms,"clean_customdata",second);}
 if(profile>=6)param(parms,"result",false);
 PointerRNA target{reinterpret_cast<ID*>(input),types[profile],input};
 const bool ok=fixture_dispatch(C,target,*funcs[profile],parms,reports);
 return profile>=6?ok&&result<bool>(parms,"result"):ok;
}
"""


def legacy_adapters(mode):
    adapters=ADAPTERS
    for i,name in enumerate(MESH_NAMES):
        result_type="bool" if i>=6 else "void"
        signature=result_type+" fixture_owned_"+name+"(Mesh *input,Main *main,bContext *C,ReportList *reports"
        if i<4:signature+=",int count"
        if i in (5,6):signature+=",bool first,bool second"
        adapters+=signature+"){\n#ifdef WITH_APPLE_CROSSPLATFORM\n"
        invocation="fixture_owned_mesh(input,main,C,reports,"+str(i)
        if i<4:invocation+=",count"
        elif i in (5,6):invocation+=",1,first,second"
        adapters+=("return " if i>=6 else "(void)")+invocation+");\n#else\n"
        args="input,main,C,reports"+( ",count" if i<4 else ",first,second" if i in (5,6) else "")
        adapters+=("return " if i>=6 else "")+name+"("+args+");\n#endif\n}\n"
    names=ID_NAMES+MESH_NAMES
    adapters+="\n"+"\n".join("#define "+name+" fixture_owned_"+name for name in names)+"\n"
    return adapters


ID_CALL_SUPPORT = r"""
struct OwnedCall {PointerRNA target;FunctionRNA *func=nullptr;ParameterList parms;};
static OwnedCall owned_call(Fixture &f,int profile){
 OwnedCall call;
 switch(profile){
 case 0:call.target=fixture_id_target(&f.linked);call.func=&rna_ID_override_create_func;
  param(call.parms,"remap_local_usages",true);param<ID*>(call.parms,"id",nullptr);break;
 case 1:call.target=fixture_id_target(&f.linked);call.func=&rna_ID_override_hierarchy_create_func;
  param(call.parms,"scene",&f.scene);param(call.parms,"view_layer",&f.layer);param(call.parms,"reference",&f.hint);
  param(call.parms,"do_fully_editable",false);param<ID*>(call.parms,"id",nullptr);break;
 case 2:call.target=fixture_override_target(&f.overridden,&f.override);call.func=&rna_IDOverrideLibrary_reset_func;
  param(call.parms,"do_hierarchy",true);param(call.parms,"set_system_override",false);break;
 case 3:call.target=fixture_override_target(&f.overridden,&f.override);call.func=&rna_IDOverrideLibrary_destroy_func;
  param(call.parms,"do_hierarchy",false);break;
 case 4:call.target=fixture_override_target(&f.overridden,&f.override);call.func=&rna_IDOverrideLibrary_resync_func;
  param(call.parms,"scene",&f.scene);param(call.parms,"view_layer",&f.layer);param(call.parms,"residual_storage",&f.residual);
  param(call.parms,"do_hierarchy_enforce",false);param(call.parms,"do_whole_hierarchy",false);param(call.parms,"success",false);break;
 case 5:call.target=fixture_id_target(&f.linked);call.func=&rna_ID_user_remap_func;param(call.parms,"new_id",&f.hint);g_expected_remap=&f.hint;break;
 case 6:call.target=fixture_id_target(&f.linked);call.func=&rna_ID_make_local_func;
  param(call.parms,"clear_proxy",true);param(call.parms,"clear_liboverride",false);param(call.parms,"clear_asset_data",true);param<ID*>(call.parms,"id",nullptr);break;
 default:assert(false);
 }
 call.parms.func=call.func;return call;
}
"""

MESH_CALL_SUPPORT = r"""
struct OwnedCall {PointerRNA target;FunctionRNA *func=nullptr;ParameterList parms;};
static OwnedCall owned_call(Fixture &f,int profile){
 StructRNA *types[]={&RNA_MeshVertices,&RNA_MeshEdges,&RNA_MeshLoops,&RNA_MeshPolygons,&RNA_Mesh,&RNA_Mesh,&RNA_Mesh,&RNA_Mesh};
 FunctionRNA *funcs[]={&rna_MeshVertices_add_func,&rna_MeshEdges_add_func,&rna_MeshLoops_add_func,&rna_MeshPolygons_add_func,
  &rna_Mesh_clear_geometry_func,&rna_Mesh_update_func,&rna_Mesh_validate_func,&rna_Mesh_validate_material_indices_func};
 OwnedCall call;call.target={&f.mesh.id,types[profile],&f.mesh};call.func=funcs[profile];call.parms.func=call.func;
 if(profile<4)param(call.parms,"count",3);
 if(profile==5){param(call.parms,"calc_edges",false);param(call.parms,"calc_edges_loose",false);}
 if(profile==6){param(call.parms,"verbose",false);param(call.parms,"clean_customdata",true);}
 if(profile>=6)param(call.parms,"result",false);
 return call;
}
"""


PYTHON_MODEL = r"""
using Py_ssize_t=long long;
struct PyObject {int kind=0;};
struct PropertyRNA {int kind=0;};
struct ParameterIterator {bool valid=false;PropertyRNA *parm=nullptr;void *data=nullptr;};
static PyObject g_none,g_python_return,g_python_error;
static PyObject *Py_None=&g_none,*PyExc_RuntimeError=&g_python_error;
static std::optional<PointerRNA> g_python_target;
static int g_python_errors=0,g_reports_checked=0,g_return_conversions=0,g_parameter_frees=0;
static int g_pointer_creations=0,g_null_parent_creations=0,g_material_dispatches=0;
static ID *g_last_return_id=nullptr;static bool g_last_return_bool=false;
static void BKE_reports_init(ReportList *reports,int){*reports={};}
enum {RPT_STORE=2,PARM_OUTPUT=1};
static int BPy_reports_to_error(ReportList *reports,PyObject*,bool){
 ++g_reports_checked;if(reports->errors){++g_python_errors;return -1;}return 0;
}
static void PyErr_SetString(PyObject*,const char*){++g_python_errors;}
static PointerRNA RNA_pointer_create_discrete(ID *id,StructRNA *type,void *data){
 assert(!id||id!=g_destroyed_id);++g_pointer_creations;if(!id)++g_null_parent_creations;
 return {id,type,data};
}
static PyObject *pyrna_param_to_py(PointerRNA *parent,PropertyRNA *prop,void *data){
 assert(g_reports_checked==1&&g_python_errors==0&&parent->owner_id==nullptr);
 ++g_return_conversions;
 if(prop->kind==1){g_last_return_id=*static_cast<ID**>(data);
  assert(!g_last_return_id||g_last_return_id!=g_destroyed_id);
 }else{assert(prop->kind==2);g_last_return_bool=*static_cast<bool*>(data);}
 return &g_python_return;
}
static int RNA_parameter_flag(PropertyRNA*){return PARM_OUTPUT;}
static void RNA_parameter_list_begin(ParameterList*,ParameterIterator *iter){iter->valid=false;}
static void RNA_parameter_list_next(ParameterIterator *iter){iter->valid=false;}
static void RNA_parameter_list_end(ParameterIterator*){}
static void RNA_parameter_list_free(ParameterList *parms){++g_parameter_frees;parms->values.clear();}
static PyObject *PyTuple_New(int){assert(false);return nullptr;}
static void PyTuple_SET_ITEM(PyObject*,int,PyObject*){assert(false);}
static bool RNA_function_is_id_materials_mutation(const FunctionRNA*){return false;}
static bool RNA_function_id_materials_call_owned(bContext*,PointerRNA*,FunctionRNA*,ParameterList*,ReportList*){
 ++g_material_dispatches;assert(false);return false;
}
#define Py_RETURN_NONE return Py_None
static void reset_python(const OwnedCall &call){
 g_python_target=call.target;g_python_errors=g_reports_checked=g_return_conversions=g_parameter_frees=0;
 g_pointer_creations=g_null_parent_creations=g_material_dispatches=0;
 g_last_return_id=nullptr;g_last_return_bool=false;
}
"""


def python_test_source(main,mode="id"):
    source=owned_test_source("",mode)+PYTHON_MODEL
    py=source_parts()[1]
    method=function(py,"static PyObject *pyrna_func_call(")
    tail=method[method.index("  ret = nullptr;",method.index("/* Parse function parameters. */")):]
    frame=r"""
static PyObject *python_method(OwnedCall &call,int kind){
 reset_python(call);PointerRNA *self_ptr=&*g_python_target;FunctionRNA *self_func=call.func;
 ParameterList &parms=call.parms;ParameterIterator iter;PropertyRNA result_prop{kind};
 PropertyRNA *parm=nullptr,*pret_single=&result_prop;
 void *retdata_single=nullptr;int err=0,i=0,ret_len=kind?1:0;PyObject *ret=nullptr;
 if(kind)RNA_parameter_get_lookup(&parms,kind==1?"id":self_func==&rna_IDOverrideLibrary_resync_func?"success":"result",&retdata_single);
 PointerRNA funcptr=RNA_pointer_create_discrete(self_ptr->owner_id,&RNA_Function,self_func);
"""
    return source+frame+tail+main


def owned_test_source(main,mode="id"):
    source=source_with_main("",mode)
    support=ID_CALL_SUPPORT if mode=="id" else MESH_CALL_SUPPORT
    # Adapters are ordinary test consumers of the real owned public dispatcher.
    # Their macro aliases are omitted for native borrowed-path checks.
    adapters=legacy_adapters(mode).split("#define rna_ID_override_create",1)[0]
    return source+"\n"+adapters+support+main

# The generated wrapper model follows the pinned makesrna frontier: cache raw
# self/parameter values, resolve implicit Main, call the unchanged native body,
# then write only owned output storage. Parser/GIL/provider timing is modeled.
def generated_wrapper_model(mode):
    prelude=r"""
static int g_generated_profile=0,g_generated_calls=0;
template<class T> static T generated_input(ParameterList *parms,const char *name){
 void *data=nullptr;RNA_parameter_get_lookup(parms,name,&data);assert(data);return *static_cast<T*>(data);
}
static void generated_wrapper(bContext *C,ReportList *reports,PointerRNA *ptr,ParameterList *parms){
 ++g_generated_calls;ID *_selfid=ptr->owner_id;void *_self=ptr->data;
 bool first=false,second=false,third=false;int count=0;
 Scene *scene=nullptr;ViewLayer *layer=nullptr;ID *related=nullptr;Collection *residual=nullptr;
 ID *id_result=nullptr;bool bool_result=false;
"""
    if mode=="id":
        parse=r"""
 switch(g_generated_profile){
 case 0:first=generated_input<bool>(parms,"remap_local_usages");break;
 case 1:scene=generated_input<Scene*>(parms,"scene");layer=generated_input<ViewLayer*>(parms,"view_layer");
  related=generated_input<ID*>(parms,"reference");first=generated_input<bool>(parms,"do_fully_editable");break;
 case 2:first=generated_input<bool>(parms,"do_hierarchy");second=generated_input<bool>(parms,"set_system_override");break;
 case 3:first=generated_input<bool>(parms,"do_hierarchy");break;
 case 4:scene=generated_input<Scene*>(parms,"scene");layer=generated_input<ViewLayer*>(parms,"view_layer");
  residual=generated_input<Collection*>(parms,"residual_storage");first=generated_input<bool>(parms,"do_hierarchy_enforce");
  second=generated_input<bool>(parms,"do_whole_hierarchy");break;
 case 5:related=generated_input<ID*>(parms,"new_id");break;
 case 6:first=generated_input<bool>(parms,"clear_proxy");second=generated_input<bool>(parms,"clear_liboverride");
  third=generated_input<bool>(parms,"clear_asset_data");break;
 default:assert(false);
 }
 Main *main=CTX_data_main(C);
 switch(g_generated_profile){
 case 0:id_result=rna_ID_override_create(static_cast<ID*>(_self),main,C,first);RNA_parameter_set_lookup(parms,"id",&id_result);break;
 case 1:id_result=rna_ID_override_hierarchy_create(static_cast<ID*>(_self),main,C,scene,layer,related,first);RNA_parameter_set_lookup(parms,"id",&id_result);break;
 case 2:rna_ID_override_library_reset(_selfid,static_cast<IDOverrideLibrary*>(_self),main,C,reports,first,second);break;
 case 3:rna_ID_override_library_destroy(_selfid,static_cast<IDOverrideLibrary*>(_self),main,C,reports,first);break;
 case 4:bool_result=rna_ID_override_library_resync(_selfid,static_cast<IDOverrideLibrary*>(_self),main,C,reports,scene,layer,residual,first,second);RNA_parameter_set_lookup(parms,"success",&bool_result);break;
 case 5:rna_ID_user_remap(static_cast<ID*>(_self),main,C,related);break;
 case 6:id_result=rna_ID_make_local(static_cast<ID*>(_self),main,C,first,second,third);RNA_parameter_set_lookup(parms,"id",&id_result);break;
 }
 (void)count;
}
"""
    else:
        parse=r"""
 if(g_generated_profile<4)count=generated_input<int>(parms,"count");
 if(g_generated_profile==5){first=generated_input<bool>(parms,"calc_edges");second=generated_input<bool>(parms,"calc_edges_loose");}
 if(g_generated_profile==6){first=generated_input<bool>(parms,"verbose");second=generated_input<bool>(parms,"clean_customdata");}
 Main *main=CTX_data_main(C);Mesh *native_mesh=static_cast<Mesh*>(_self);
 switch(g_generated_profile){
 case 0:rna_Mesh_vertices_add(native_mesh,main,C,reports,count);break;
 case 1:rna_Mesh_edges_add(native_mesh,main,C,reports,count);break;
 case 2:rna_Mesh_loops_add(native_mesh,main,C,reports,count);break;
 case 3:rna_Mesh_polygons_add(native_mesh,main,C,reports,count);break;
 case 4:rna_Mesh_clear_geometry(native_mesh,main,C,reports);break;
 case 5:rna_Mesh_update(native_mesh,main,C,reports,first,second);break;
 case 6:bool_result=rna_Mesh_validate(native_mesh,main,C,reports,first,second);RNA_parameter_set_lookup(parms,"result",&bool_result);break;
 case 7:bool_result=rna_Mesh_validate_material_indices(native_mesh,main,C,reports);RNA_parameter_set_lookup(parms,"result",&bool_result);break;
 }
 (void)_selfid;(void)third;(void)scene;(void)layer;(void)related;(void)residual;(void)id_result;
}
"""
    return prelude+parse


class PencilRNAOwnedDispatchTests(unittest.TestCase):
    def run_cpp(self,main,mode="id"):
        compile_run(owned_test_source(main,mode))

    def test_owned_exact_fifteen_profiles_retire_before_same_native_bodies(self):
        for mode,count in (("id",7),("mesh",8)):
            self.run_cpp("int main(){for(int i=0;i<"+str(count)+r""";++i){
 Fixture f;f.add_owner(true);OwnedCall call=owned_call(f,i);
 assert(RNA_function_is_id_storage_mutation(call.func));
 assert(RNA_function_id_storage_call_owned(&f.C,&call.target,call.func,&call.parms,&f.reports));
 assert(g_cancel_calls==2&&!has_owner(&f.main)&&g_writes+g_tags>0&&f.reports.errors==0);
}}
""",mode)

    def test_borrowed_native_bodies_refuse_before_invalid_self_or_admission_read(self):
        self.run_cpp(r"""
int main(){Fixture f;f.add_owner();auto *bad=reinterpret_cast<ID*>(uintptr_t(0x20));
 auto *data=reinterpret_cast<IDOverrideLibrary*>(uintptr_t(0x30));
 assert(!rna_ID_override_create(bad,&f.main,&f.C,false));
 assert(!rna_ID_override_hierarchy_create(bad,&f.main,&f.C,nullptr,nullptr,nullptr,false));
 rna_ID_override_library_reset(bad,data,&f.main,&f.C,&f.reports,false,false);
 rna_ID_override_library_destroy(bad,data,&f.main,&f.C,&f.reports,false);
 assert(!rna_ID_override_library_resync(bad,data,&f.main,&f.C,&f.reports,nullptr,nullptr,nullptr,false,false));
 rna_ID_user_remap(bad,&f.main,&f.C,bad);
 assert(!rna_ID_make_local(bad,&f.main,&f.C,true,false,true));
 assert(g_cancel_calls==0&&g_main_queries==0&&g_writes==0&&g_tags==0&&g_notifiers==0);
}
""")
        self.run_cpp(r"""
int main(){Fixture f;f.add_owner();auto *bad=reinterpret_cast<Mesh*>(uintptr_t(0x20));
 rna_Mesh_vertices_add(bad,&f.main,&f.C,&f.reports,0);
 rna_Mesh_edges_add(bad,&f.main,&f.C,&f.reports,0);
 rna_Mesh_loops_add(bad,&f.main,&f.C,&f.reports,0);
 rna_Mesh_polygons_add(bad,&f.main,&f.C,&f.reports,0);
 rna_Mesh_clear_geometry(bad,&f.main,&f.C,&f.reports);
 rna_Mesh_update(bad,&f.main,&f.C,&f.reports,false,false);
 assert(!rna_Mesh_validate(bad,&f.main,&f.C,&f.reports,false,true));
 assert(!rna_Mesh_validate_material_indices(bad,&f.main,&f.C,&f.reports));
 assert(g_cancel_calls==0&&g_main_queries==0);assert_no_write();
}
""","mesh")

    def test_owner_retiring_context_provider_cannot_hide_changed_id_receipt(self):
        self.run_cpp(r"""
static int change=0;
static void query_hook(){auto &f=*g_fixture;f.win.modalhandlers.first=nullptr;
 if(change==0)++f.linked.session_uid;
 if(change==1)f.main.ids.erase(std::remove(f.main.ids.begin(),f.main.ids.end(),&f.linked),f.main.ids.end());
 if(change==2)++f.library.id.session_uid;
 if(change==3)++f.scene.id.session_uid;
 if(change==4)f.scene.view_layers.first=nullptr;
 if(change==5)++f.hint.session_uid;
}
int main(){for(change=0;change<6;++change){
 Fixture f;f.add_owner();OwnedCall call=owned_call(f,1);g_fixture=&f;g_main_hook=query_hook;
 assert(!RNA_function_id_storage_call_owned(&f.C,&call.target,call.func,&call.parms,&f.reports));
 assert(g_main_queries==1&&g_cancel_calls==0&&!has_owner(&f.main)&&f.reports.errors>0&&g_writes==0&&g_tags==0);
}}
""")

    def test_owner_retiring_context_provider_cannot_hide_changed_mesh_receipt(self):
        self.run_cpp(r"""
static int change=0;
static void query_hook(){auto &f=*g_fixture;f.win.modalhandlers.first=nullptr;
 if(change==0)++f.mesh.id.session_uid;
 if(change==1)f.main.ids.erase(std::remove(f.main.ids.begin(),f.main.ids.end(),&f.mesh.id),f.main.ids.end());
 if(change==2)++f.library.id.session_uid;
 if(change==3)f.override.flag^=2;
}
int main(){for(change=0;change<4;++change)for(int profile=0;profile<8;++profile){
 Fixture f;f.mesh.id.lib=&f.library;f.mesh.id.override_library=&f.override;f.add_owner();
 OwnedCall call=owned_call(f,profile);g_fixture=&f;g_main_hook=query_hook;
 assert(!RNA_function_id_storage_call_owned(&f.C,&call.target,call.func,&call.parms,&f.reports));
 assert(g_main_queries==1&&g_cancel_calls==0&&!has_owner(&f.main)&&f.reports.errors>0);assert_no_write();
}}
""","mesh")

    def test_new_owner_acquired_by_initially_absent_Main_lookup_is_refused(self):
        for mode,count in (("id",7),("mesh",8)):
            self.run_cpp(r"""
static void acquire_hook(){g_fixture->add_owner();}
int main(){for(int profile=0;profile<"""+str(count)+r""";++profile){
 Fixture f;OwnedCall call=owned_call(f,profile);g_fixture=&f;g_main_hook=acquire_hook;
 assert(!RNA_function_id_storage_call_owned(&f.C,&call.target,call.func,&call.parms,&f.reports));
 assert(g_main_queries==1&&g_cancel_calls==0&&has_owner(&f.main)&&f.reports.errors>0&&g_writes==0&&g_tags==0);
}}
""",mode)

    def test_no_owner_routes_use_one_Main_lookup_and_exact_boolean_storage(self):
        for mode,count in (("id",7),("mesh",8)):
            self.run_cpp("int main(){for(int profile=0;profile<"+str(count)+r""";++profile){
 Fixture f;OwnedCall call=owned_call(f,profile);
 assert(RNA_function_id_storage_call_owned(&f.C,&call.target,call.func,&call.parms,&f.reports));
 assert(g_main_queries==1&&g_cancel_calls==0&&f.reports.errors==0&&g_writes+g_tags>0);
 for(const auto &entry:call.parms.values){const auto &slot=entry.second;
  for(size_t byte=slot.size;byte<slot.storage.size();++byte)assert(slot.storage[byte]==0x5a);
 }
}}
""",mode)

    def test_unknown_function_identity_does_not_capture_or_drain(self):
        self.run_cpp(r"""
int main(){Fixture f;f.add_owner();FunctionRNA unknown{"override_create"};
 assert(!RNA_function_is_id_storage_mutation(&unknown));
 assert(RNA_function_id_storage_call_absent(&unknown,&f.reports));
 assert(g_cancel_calls==0&&g_main_queries==0&&g_writes==0&&f.reports.errors==0);
}
""")

    def test_actual_Python_tail_owns_target_and_gates_exact_fifteen_returns(self):
        for mode,count in (("id",7),("mesh",8)):
            body=r"""
static void dispose_python_wrapper(){g_python_target.reset();}
int main(){for(int profile=0;profile<COUNT;++profile){
 Fixture f;f.add_owner(true);OwnedCall call=owned_call(f,profile);
 if(MODE_ID && profile>=2 && profile<=4)call.target.ancestors.push_back({&RNA_Object,call.target.owner_id});
 g_cancel_hook=dispose_python_wrapper;
 const int kind=MODE_ID?(profile==0||profile==1||profile==6?1:profile==4?2:0):(profile>=6?2:0);
 PyObject *returned=python_method(call,kind);
 assert(returned!=nullptr&&!g_python_target&&g_cancel_calls==2&&!has_owner(&f.main));
 assert(g_reports_checked==1&&g_python_errors==0&&g_parameter_frees==1&&g_material_dispatches==0);
 assert(g_return_conversions==int(kind!=0)&&g_pointer_creations==2&&g_null_parent_creations==1);
 assert(g_writes+g_tags>0);
 if(MODE_ID&&kind==1)assert(g_last_return_id==g_result_id);
 if(MODE_ID&&kind==2)assert(g_last_return_bool);
 if(!MODE_ID&&kind==2)assert(!g_last_return_bool);
}}
""".replace("COUNT",str(count)).replace("MODE_ID","true" if mode=="id" else "false")
            compile_run(python_test_source(body,mode))

    def test_actual_Python_tail_handles_native_destroy_without_old_parent_read(self):
        compile_run(python_test_source(r"""
static void dispose_python_wrapper(){g_python_target.reset();}
int main(){for(bool hierarchy:{false,true}){
 Fixture f;auto *heap=new ID(ID_OB,700);heap->override_library=&f.override;f.main.ids.push_back(heap);
 OwnedCall call=owned_call(f,3);call.target=fixture_override_target(heap,&f.override);
 param(call.parms,"do_hierarchy",hierarchy);g_heap_destroy_id=heap;f.add_owner();g_cancel_hook=dispose_python_wrapper;
 assert(python_method(call,0)==Py_None);
 assert(g_heap_destroy_id==nullptr&&g_destroyed_id==heap&&g_deletes==1&&!g_python_target);
 assert(g_return_conversions==0&&g_parameter_frees==1&&g_python_errors==0&&g_reports_checked==1);
 assert(g_pointer_creations==2&&g_null_parent_creations==1&&g_cancel_calls==1);
}}
"""))

    def test_actual_Python_report_context_and_changed_parameter_refusal_clean_metadata(self):
        compile_run(python_test_source(r"""
static OwnedCall *active_call=nullptr;static int mutation=0;
static void refuse_hook(){g_python_target.reset();
 if(mutation==0)++g_fixture->linked.session_uid;
 if(mutation==1)g_bpy_context=nullptr;
 if(mutation==2)param(active_call->parms,"remap_local_usages",false);
}
int main(){for(mutation=0;mutation<3;++mutation){
 Fixture f;f.add_owner(true);OwnedCall call=owned_call(f,0);g_fixture=&f;active_call=&call;g_cancel_hook=refuse_hook;
 assert(python_method(call,1)==nullptr);
 assert(g_writes==0&&g_tags==0);
 if(mutation==1){assert(g_cancel_calls==2&&!has_owner(&f.main));}
 else{assert(g_cancel_calls==1&&f.second.modalhandlers.first==&f.other_owner);}
 assert(g_python_errors==1&&g_reports_checked==1&&g_return_conversions==0&&g_parameter_frees==1);
 assert(g_pointer_creations==2&&g_null_parent_creations==1&&!g_python_target);
}
{Fixture f;f.add_owner();OwnedCall call=owned_call(f,0);g_cancel_ok=false;
 assert(python_method(call,1)==nullptr&&g_cancel_calls==1&&g_writes==0);
 assert(g_python_errors==1&&g_return_conversions==0&&g_parameter_frees==1);}
}
"""))

    def test_portable_actual_old_helper_fails_changed_identity_contract(self):
        baseline=(ROOT/"build/tests/pinned_rna_owner_prequery_baseline.inc.cc").read_text(encoding="utf-8")
        body=function(baseline,"static bool rna_ID_paint_owner_teardown(")
        self.assertEqual(hashlib.sha256(body.encode()).hexdigest(),"0f5b2dd4ce2a46fe4407ec441b608510f3cbd747fbd377e3a4b3445cf3288630")
        historical=body.replace("static bool rna_ID_paint_owner_teardown(","static bool fixture_prequery_baseline(",1)
        hook=r"""
static int mutation=0;
static void retire_then_change(){auto &f=*g_fixture;f.win.modalhandlers.first=nullptr;
 if(mutation==0)++f.overridden.session_uid;
 else f.main.ids.erase(std::remove(f.main.ids.begin(),f.main.ids.end(),&f.overridden),f.main.ids.end());
}
"""
        for mutation in (0,1):
            main=r"""
int main(){Fixture f;f.add_owner();ID *input=&f.overridden;g_fixture=&f;
 mutation=MUTATION;g_main_hook=retire_then_change;
 const bool admitted=fixture_prequery_baseline(&f.C,&f.main,&input,nullptr,0,nullptr,nullptr,&f.reports,"baseline");
 assert(g_cancel_calls==0&&g_writes==0&&admitted);
 std::fputs("BASELINE_CHANGED_ID_ADMITTED\n",stderr);
 assert(!admitted);
}
""".replace("MUTATION",str(mutation))
            compile_run(owned_test_source(historical+hook+main),expected_failure_marker="BASELINE_CHANGED_ID_ADMITTED")
        self.run_cpp(hook+r"""
int main(){for(mutation=0;mutation<2;++mutation){
 Fixture f;f.add_owner();ID *input=&f.overridden;g_fixture=&f;g_main_hook=retire_then_change;
 assert(!rna_ID_paint_owner_teardown(&f.C,&f.main,&input,nullptr,0,nullptr,nullptr,&f.reports,"candidate"));
 assert(g_cancel_calls==0&&g_writes==0&&f.reports.errors>0);
}}
""")

    def test_generic_RNA_wrapper_model_refuses_new_owner_before_poisoned_self_or_override_read(self):
        for mode,count in (("id",7),("mesh",8)):
            main=r"""
static void acquire_owner(){g_fixture->add_owner();}
int main(){for(int profile=0;profile<COUNT;++profile){
 {Fixture f;f.add_owner();OwnedCall call=owned_call(f,profile);g_generated_profile=profile;
  call.func->call=generated_wrapper;g_generated_calls=0;
  assert(RNA_function_call(&f.C,&f.reports,&call.target,call.func,&call.parms)==-1);
  assert(g_generated_calls==0&&g_main_queries==0&&g_cancel_calls==0&&g_writes==0&&g_tags==0);}
 {Fixture f;OwnedCall call=owned_call(f,profile);g_generated_profile=profile;
  call.func->call=generated_wrapper;g_generated_calls=0;g_fixture=&f;g_main_hook=acquire_owner;
  // Invalid numeric self/override tokens model cached values invalidated by a provider.
  // Related Scene/ViewLayer/new-ID/residual parameters remain valid in this case.
  // The wrapper reads only these pointer values before its modeled Main lookup.
  call.target.owner_id=reinterpret_cast<ID*>(uintptr_t(0x20));call.target.data=reinterpret_cast<void*>(uintptr_t(0x30));
  assert(RNA_function_call(&f.C,&f.reports,&call.target,call.func,&call.parms)==0);
  assert(g_generated_calls==1&&g_main_queries==1&&g_cancel_calls==0&&has_owner(&f.main));
  assert(g_writes==0&&g_tags==0&&g_notifiers==0);}
 {Fixture f;OwnedCall call=owned_call(f,profile);g_generated_profile=profile;
  call.func->call=generated_wrapper;g_generated_calls=0;
  assert(RNA_function_call(&f.C,&f.reports,&call.target,call.func,&call.parms)==0);
  assert(g_generated_calls==1&&g_main_queries==1&&g_cancel_calls==0&&g_writes+g_tags>0);}
}}
""".replace("COUNT",str(count))
            self.run_cpp(generated_wrapper_model(mode)+main,mode)

    def test_owned_zero_add_on_evaluated_non_Main_keeps_native_Edit_admission_without_query(self):
        self.run_cpp(r"""
static void unexpected_query(){assert(false);}
int main(){for(int profile=0;profile<4;++profile)for(bool edit:{false,true})for(bool null_context:{false,true}){
 Fixture f;f.add_owner();f.mesh.id.session_uid=0;
 f.main.ids.erase(std::remove(f.main.ids.begin(),f.main.ids.end(),&f.mesh.id),f.main.ids.end());
 if(edit)f.mesh.runtime->edit_mesh=&f.mesh;
 OwnedCall call=owned_call(f,profile);param(call.parms,"count",0);
 bContext *C=null_context?nullptr:&f.C;g_bpy_context=C;g_main_hook=unexpected_query;
 assert(RNA_function_id_storage_call_owned(C,&call.target,call.func,&call.parms,&f.reports));
 assert(g_main_queries==0&&g_cancel_calls==0&&has_owner(&f.main)&&f.reports.errors==int(edit));
 assert(g_writes==0&&g_tags==0&&g_cache_dirty==0&&g_notifiers==0);
 assert(g_add_calls[profile]==int(!edit));
}}
""","mesh")

    def test_owned_unprovable_foreign_target_refuses_before_provider(self):
        for mode,count in (("id",7),("mesh",8)):
            self.run_cpp(r"""
static void unexpected_query(){assert(false);}
int main(){for(int profile=0;profile<COUNT;++profile){
 Fixture f;f.add_owner();OwnedCall call=owned_call(f,profile);
 f.main.ids.erase(std::remove(f.main.ids.begin(),f.main.ids.end(),call.target.owner_id),f.main.ids.end());
 f.C.main=&f.foreign;g_main_hook=unexpected_query;
 assert(!RNA_function_id_storage_call_owned(&f.C,&call.target,call.func,&call.parms,&f.reports));
 assert(g_main_queries==0&&g_cancel_calls==0&&has_owner(&f.main)&&g_writes==0&&g_tags==0&&f.reports.errors>0);
}}
""".replace("COUNT",str(count)),mode)


if __name__=="__main__":
    unittest.main()
