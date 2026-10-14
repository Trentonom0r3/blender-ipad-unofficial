"""Execute actual material collection callbacks, native bodies and producers.

The registered-owner scan runs unchanged. Native Cancel, Main/context queries,
allocation, refcount/freeing, geometry-index updates and interpreter conversion
are instrumented boundaries, not Blender/device execution or rollback proof.
The method producer owns values before the modeled callback-bearing Main lookup;
no-owner to no-owner arbitrary ID deletion remains the native baseline, outside
this proof. A same-address, same-zero-UID replacement with an identical invalid-
Pop count is not distinguishable by the bounded lightweight admission receipt.
"""
from pathlib import Path
import hashlib
import os
import re
import shutil
import subprocess
import tempfile
import unittest

from test_compact_shelf import function
from test_touch_extrude import changed_source, PIN_ROOT
import test_pencil_material_assign_owner_teardown as assignment

ROOT = Path(__file__).resolve().parents[1]
PIN = "d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e"
MATERIAL_BLOB = "1d2f0cf4e5bc2fee76f360a26fa3d814b1b367bc"
NATIVE = (ROOT / "build/tests/pinned_material_collection.inc.cc").read_text(encoding="utf-8")
HASHES = {
 "Material ***BKE_object_material_array_p(": "476e2238d8b5f6cb25f05bd1f5803c7c7a64eb846f929ad1ad111ff265f8d71e",
 "short *BKE_object_material_len_p(": "bfc41d22d08d61cee81eeb1d2d16d8b51bf09d573df846a6e5d57f7def6fba98",
 "Material ***BKE_id_material_array_p(": "b78c1841871ca0c3d428d793f3989cb6089fd075cabfb303a87dbd1e43c7cf89",
 "short *BKE_id_material_len_p(": "7eade3ce92c9bcecefd62e5c6b84d32b80c198666f188688ee419453bc0ef842",
 "static void material_data_index_remove_id(": "25492ec12aacc6897b85c71a1e815a0a1ccdcce6438ce5a9c989831ef465fa40",
 "static void material_data_index_clear_id(": "cbcab696c6823ddecb68b7ab5b840743f27f3f614761512cc95bab115688b83f",
 "void BKE_id_material_append(": "d8660df8bdfc7d7aa2dd12ae93342e9cd351dab8dafaa67e26ed60291bad8baa",
 "Material *BKE_id_material_pop(": "57f6b01bbc245af70a20980537c7b1ca0da7cf238c6e83fd27fe87b8f2e738a6",
 "void BKE_id_material_clear(": "41435f70fe96c954ce21546f637b691a36af078ceb3b480fe68e28f3f85c82bb",
 "void BKE_id_material_assign(": "d5b999646b9527d951e280796886b14c4302d3ed7fccdb39e42eb42258788da5",
}
PREFIX = assignment.PREFIX.replace("struct Main { ListBase wm; std::vector<ID*> ids; };", "struct Main { ListBase wm,objects; std::vector<ID*> ids; };")
context_main = next(line for line in PREFIX.splitlines() if line.startswith("static Main *CTX_data_main("))
PREFIX = PREFIX.replace("static void (*g_context_main_hook)()=nullptr;\n", "")
PREFIX = PREFIX.replace(context_main, r"""
static int g_main_lookups=0;
static void (*g_context_main_hook)()=nullptr;
static Main *CTX_data_main(const bContext *C){
 ++g_main_lookups;auto hook=g_context_main_hook;g_context_main_hook=nullptr;if(hook)hook();return C?C->main:nullptr;
}
""")
MODEL = assignment.MODEL.replace(
 "static void id_us_min(ID *id){native_effect();", "static void id_us_min(ID *id){if(!id)return;native_effect();"
).replace("static void id_us_plus(ID *id){native_effect();", "static void id_us_plus(ID *id){if(!id)return;native_effect();")
MODEL = MODEL.replace("struct Object {ID id{ID_OB,0};", "struct Object {ID id{ID_OB,0};Object *next=nullptr;")
MODEL = MODEL.replace("short type=OB_MESH,totcol=0,actcol=1;", "short type=OB_MESH;int totcol=0,actcol=1;")

EXTRA = r"""
#include <limits>
#define WITH_PYTHON
enum class eRNAMaterialCollectionOperation {Append,Pop,Clear,Assign};
enum {PROP_COLLECTION=17,ND_DRAW=1<<16};
static StructRNA RNA_Mesh{"Mesh",true,&RNA_ID}, RNA_Curve{"Curve",true,&RNA_ID};
static StructRNA RNA_TextCurve{"TextCurve",true,&RNA_Curve}, RNA_SurfaceCurve{"SurfaceCurve",true,&RNA_Curve};
static StructRNA RNA_MetaBall{"MetaBall",true,&RNA_ID}, RNA_Curves{"Curves",true,&RNA_ID};
static StructRNA RNA_PointCloud{"PointCloud",true,&RNA_ID}, RNA_Volume{"Volume",true,&RNA_ID};
static StructRNA RNA_GreasePencilv3{"GreasePencilv3",true,&RNA_ID};
static StructRNA RNA_IDMaterials{"IDMaterials"};
static void fixture_model_anchors(){(void)U;(void)RNA_Object;(void)RNA_MaterialSlot;(void)RNA_TextCurve;(void)RNA_SurfaceCurve;}
struct CollectionPropertyRNA : PropertyRNA {
 bool (*assignint)(PointerRNA*,int,const PointerRNA*)=nullptr;
};
struct FunctionRNA {int profile=0;};
FunctionRNA rna_IDMaterials_append_func{1},rna_IDMaterials_pop_func{2},rna_IDMaterials_clear_func{3};
struct ParameterList {FunctionRNA *func=nullptr;Material *material=nullptr;int index=-1;Material *result=nullptr;bool missing=false;};
static void RNA_parameter_get_lookup(ParameterList *p,const char *name,void **out){
 if(p->missing){*out=nullptr;return;}*out=std::strcmp(name,"material")==0?static_cast<void*>(&p->material):static_cast<void*>(&p->index);
}
static void RNA_parameter_set_lookup(ParameterList *p,const char*,const void *value){p->result=*static_cast<Material *const *>(value);}
static bContext *BPY_context_get();
static int g_native_appends=0,g_native_pops=0,g_native_clears=0;
static int g_index_mesh_remove=0,g_index_curve_remove=0,g_index_gp_remove=0;
static int g_index_mesh_clear=0,g_index_curve_clear=0;
static void *MEM_reallocN(void *p,size_t bytes){return MEM_recallocN_id(p,bytes,"fixture realloc");}
static void BKE_mesh_material_index_remove(Mesh*,short){native_effect();++g_index_mesh_remove;}
static void BKE_curve_material_index_remove(Curve*,short){native_effect();++g_index_curve_remove;}
static void BKE_grease_pencil_material_index_remove(GreasePencil*,short){native_effect();++g_index_gp_remove;}
static void BKE_mesh_material_index_clear(Mesh*){native_effect();++g_index_mesh_clear;}
static void BKE_curve_material_index_clear(Curve*){native_effect();++g_index_curve_clear;}
"""

ADAPTERS = r"""
#undef BKE_id_material_append
#undef BKE_id_material_pop
#undef BKE_id_material_clear
#undef BKE_id_material_assign
static void BKE_id_material_append(Main *m,ID *id,Material *ma){
  assert(live_id(id)&&(!ma||live_id(&ma->id)));native_effect();++g_native_appends;
  fixture_native_material_append(m,id,ma);
}
static Material *BKE_id_material_pop(Main *m,ID *id,int i){
  assert(live_id(id));native_effect();++g_native_pops;return fixture_native_material_pop(m,id,i);
}
static void BKE_id_material_clear(Main *m,ID *id){
  assert(live_id(id));native_effect();++g_native_clears;fixture_native_material_clear(m,id);
}
static void BKE_id_material_assign(Main *m,ID *id,Material *ma,short i){
  assert(live_id(id)&&(!ma||live_id(&ma->id)));++g_native_assigns;
  fixture_native_material_assign(m,id,ma,i);
}
"""

SUPPORT = r"""
struct Fixture {
 Main main,foreign;wmWindowManager wm;wmWindow win,second;
 wmEventHandler_Op owner,other_owner;bContext C;
 Mesh mesh;Curve curve;MetaBall metaball;Curves curves;PointCloud points;Volume volume;GreasePencil grease;
 Object object,other_object;Material old_material,incoming,other_material,replacement;
 Library library,other_library;ID reference,root;IDOverrideLibrary override,other_override;
 ID *data=nullptr;PointerRNA ptr,value;ReportList reports;
 Fixture(int type=ID_ME,int count=2){
  wm.id.session_uid=1;wm.windows.first=&win;win.winid=10;win.runtime=&win;
  main.wm.first=&wm;G_MAIN=&main;C={&main,&wm,&win,nullptr,nullptr};
  g_operation_main=&main;g_allow_owner=true;
  g_cancel_ok=true;g_change_context=g_replace_main=g_spawn=false;
  g_remove_foreign_window=g_remove_foreign_manager=false;g_cancel_calls=0;
  g_context_allocs=g_context_frees=0;g_original=&C;g_other_main=&foreign;
  g_cancel_hook=nullptr;g_spawn_window=nullptr;g_spawned={};
  g_main_lookups=0;g_context_main_hook=nullptr;
  library.id.session_uid=100;other_library.id.session_uid=101;
  object.id.session_uid=200;other_object.id.session_uid=201;
  mesh.id.session_uid=300;curve.id.session_uid=301;metaball.id.session_uid=302;
  curves.id.session_uid=303;points.id.session_uid=304;volume.id.session_uid=305;grease.id.session_uid=306;
  old_material.id.session_uid=400;incoming.id.session_uid=401;other_material.id.session_uid=402;
  replacement.id.session_uid=401;reference.session_uid=500;root.session_uid=501;
  old_material.id.us=incoming.id.us=other_material.id.us=100000;
  reference.lib=&library;override.reference=&reference;override.hierarchy_root=&root;
  StructRNA *rna=nullptr;int object_type=0;
  switch(type){
   case ID_ME:data=&mesh.id;rna=&RNA_Mesh;object_type=OB_MESH;break;
   case ID_CU_LEGACY:data=&curve.id;rna=&RNA_Curve;object_type=OB_CURVES_LEGACY;break;
   case ID_MB:data=&metaball.id;rna=&RNA_MetaBall;object_type=OB_MBALL;break;
   case ID_CV:data=&curves.id;rna=&RNA_Curves;object_type=OB_CURVES;break;
   case ID_PT:data=&points.id;rna=&RNA_PointCloud;object_type=OB_POINTCLOUD;break;
   case ID_VO:data=&volume.id;rna=&RNA_Volume;object_type=OB_VOLUME;break;
   case ID_GP:data=&grease.id;rna=&RNA_GreasePencilv3;object_type=OB_GREASE_PENCIL;break;
   default:assert(false);
  }
  object.data=other_object.data=data;object.type=other_object.type=short(object_type);
  main.objects.first=&object;object.next=&other_object;
  main.ids={&library.id,&other_library.id,data,&object.id,&other_object.id,
            &old_material.id,&incoming.id,&other_material.id,&reference,&root};foreign.ids=main.ids;
  ptr={data,rna,data};value={&incoming.id,&RNA_Material,&incoming};
  slots(count);g_allow_owner=false;reset_counters();
 }
 ~Fixture(){for(auto entry:g_alloc_sizes)std::free(entry.first);g_alloc_sizes.clear();}
 short &count(){return *BKE_id_material_len_p(data);}
 Material **&array(){return *BKE_id_material_array_p(data);}
 void slots(int n){bool saved=g_allow_owner;g_allow_owner=true;
  if(array())MEM_freeN(array());array()=n?MEM_calloc_arrayN<Material*>(size_t(n),"fixture collection"):nullptr;count()=short(n);
  for(int i=0;i<n;++i)array()[i]=&old_material;
  for(Object *ob:{&object,&other_object}){
   if(ob->mat)MEM_freeN(ob->mat);if(ob->matbits)MEM_freeN(ob->matbits);
   ob->mat=n?MEM_calloc_arrayN<Material*>(size_t(n),"fixture ob materials"):nullptr;
   ob->matbits=n?MEM_calloc_arrayN<char>(size_t(n),"fixture bits"):nullptr;ob->totcol=short(n);ob->actcol=n?1:0;
   for(int i=0;i<n;++i)ob->mat[i]=&other_material;
  }g_allow_owner=saved;
 }
 void reset_counters(){g_native_appends=g_native_pops=g_native_clears=g_native_assigns=0;
  g_native_tags=g_relations=g_object_syncs=g_data_syncs=g_getters=g_refcount_reads=0;
  g_allocations=g_refcount_plus=g_refcount_minus=g_notifiers=g_publishes=g_property_update_calls=0;
  g_index_mesh_remove=g_index_curve_remove=g_index_gp_remove=g_index_mesh_clear=g_index_curve_clear=0;
 }
 void add_owner(bool both=false){
  owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=7;owner.ipad_pencil_operator_lifetime=70;
  win.modalhandlers.first=&owner;
  if(both){win.next=&second;second.winid=20;second.runtime=&second;
   other_owner.type=WM_HANDLER_TYPE_OP;other_owner.ipad_pencil_paint_serial=8;
   other_owner.ipad_pencil_operator_lifetime=80;second.modalhandlers.first=&other_owner;}
 }
 bool prepare(eRNAMaterialCollectionOperation op,bContext *ctx=nullptr,int index=0){
  PointerRNA target=ptr;if(op!=eRNAMaterialCollectionOperation::Assign)target.type=&RNA_IDMaterials;
  uintptr_t incoming_address=(op==eRNAMaterialCollectionOperation::Assign||op==eRNAMaterialCollectionOperation::Append)?uintptr_t(value.data):0;
  return RNA_id_materials_paint_owner_teardown(ctx,&main,&target,incoming_address,op,index,&reports);
 }
 void apply(eRNAMaterialCollectionOperation op,int index=0){
  switch(op){case eRNAMaterialCollectionOperation::Append:fixture_append(data,&main,static_cast<Material*>(value.data),&reports);break;
   case eRNAMaterialCollectionOperation::Pop:(void)rna_IDMaterials_pop_id(data,&main,&reports,index);break;
   case eRNAMaterialCollectionOperation::Clear:fixture_clear(data,&main,&reports);break;
   case eRNAMaterialCollectionOperation::Assign:(void)rna_IDMaterials_assign_int(&ptr,index,&value);break;}
 }
};
static void assert_no_native(){assert(g_native_appends==0&&g_native_pops==0&&g_native_clears==0&&g_native_assigns==0&&
 g_native_tags==0&&g_relations==0&&g_data_syncs==0&&g_object_syncs==0&&g_allocations==0&&
 g_refcount_plus==0&&g_refcount_minus==0&&g_notifiers==0&&g_publishes==0&&
 g_index_mesh_remove==0&&g_index_curve_remove==0&&g_index_gp_remove==0&&g_index_mesh_clear==0&&g_index_curve_clear==0);}
static Fixture *g_fixture=nullptr;
static int g_mutation=0;
static bool g_nested_result=true;
static void mutation_hook(){Fixture &f=*g_fixture;
 auto remove=[&](ID *id){f.main.ids.erase(std::remove(f.main.ids.begin(),f.main.ids.end(),id),f.main.ids.end());};
 switch(g_mutation){
 case 1:remove(f.data);break;case 2:++f.data->session_uid;break;case 3:f.data->name[0]='Z';break;
 case 4:remove(&f.incoming.id);break;case 5:++f.incoming.id.session_uid;break;case 6:f.incoming.id.name[0]='Z';break;
 case 7:remove(&f.old_material.id);break;case 8:++f.old_material.id.session_uid;break;
 case 9:f.array()[1]=&f.other_material;break;case 10:f.array()=nullptr;break;case 11:--f.count();break;
 case 12:f.data->lib=&f.other_library;break;case 13:++f.library.id.session_uid;break;
 case 14:f.library.id.name[0]='Z';break;case 15:remove(&f.library.id);break;
 case 16:f.override.flag^=2;break;case 17:f.override.reference=&f.other_material.id;break;
 case 18:++f.root.session_uid;break;case 19:remove(&f.reference);break;
 case 20:f.object.data=&f.mesh;break;case 21:++f.object.id.session_uid;break;
 case 22:f.object.type=OB_EMPTY;break;case 23:++f.object.actcol;break;case 24:--f.object.totcol;break;
 case 25:f.object.mat=nullptr;break;case 26:f.other_object.matbits[0]^=1;break;
 case 27:f.other_object.mat[1]=&f.old_material;break;case 28:remove(&f.other_object.id);break;
 case 29:f.data->us++;break;case 30:f.incoming.id.tag^=ID_TAG_EXTERN;break;
 case 31:f.C.area=&g_replacement_area;break;case 32:G_MAIN=&f.foreign;break;
 case 33:{g_nested_result=f.prepare(eRNAMaterialCollectionOperation::Append,&f.C);
   assert(!g_nested_result);f.apply(eRNAMaterialCollectionOperation::Append);assert_no_native();break;}
 case 34:f.object.actcol+=65536;break;
 case 35:f.main.objects.first=&f.other_object;f.other_object.next=&f.object;f.object.next=nullptr;break;
 default:break;
 }
}
static void mutate(Fixture &f,int kind){g_fixture=&f;g_mutation=kind;g_cancel_hook=mutation_hook;}
"""

PYTHON_MODEL = r"""
using Py_ssize_t=long long;
struct PyObject {};
struct BPy_StructRNA : PyObject {std::optional<PointerRNA> ptr;};
struct BPy_PropertyRNA {std::optional<PointerRNA> ptr;PropertyRNA *prop=nullptr;};
struct ParameterIterator {bool valid=false;PropertyRNA *parm=nullptr;void *data=nullptr;};
static StructRNA RNA_Function{"Function"};
static PyObject g_none,g_error,g_return;
static PyObject *Py_None=&g_none,*PyExc_RuntimeError=&g_error,*PyExc_IndexError=&g_error;
static bContext *g_bpy_context=nullptr;
static int g_python_errors=0,g_reports_to_error=0,g_return_conversions=0,g_parameter_frees=0;
static int g_collection_lengths=0,g_collection_assignments=0,g_function_calls=0,g_funcptr_creates=0;
static bool g_after_cancel=false,g_check_owned=false;
static const PointerRNA *g_original_target=nullptr,*g_original_value=nullptr;
static bContext *BPY_context_get(){return g_bpy_context;}
static void BKE_reports_init(ReportList *r,int){*r={};}
static int BPy_reports_to_error(ReportList *r,PyObject*,bool){++g_reports_to_error;if(r->errors){++g_python_errors;return -1;}return 0;}
static void PyErr_SetString(PyObject*,const char*){++g_python_errors;}
static void PyErr_Format(PyObject*,const char*,...){++g_python_errors;}
static int RNA_property_collection_length(PointerRNA *ptr,PropertyRNA*){
 ++g_collection_lengths;assert(live_id(ptr->owner_id));
 if(g_after_cancel&&g_check_owned)assert(ptr!=g_original_target);
 return *BKE_id_material_len_p(ptr->owner_id);
}
static PointerRNA RNA_pointer_create_discrete(ID *id,StructRNA *type,void *data){
 assert(live_id(id));++g_funcptr_creates;return {id,type,data};
}
static PyObject *pyrna_param_to_py(PointerRNA *ptr,PropertyRNA*,void *data){
 assert(g_reports_to_error==1&&g_python_errors==0&&live_id(ptr->owner_id));
 Material *ma=*static_cast<Material**>(data);assert(!ma||live_id(&ma->id));++g_return_conversions;return ma?&g_return:Py_None;
}
enum {PARM_OUTPUT=1};
static int RNA_parameter_flag(PropertyRNA*){return PARM_OUTPUT;}
static void RNA_parameter_list_begin(ParameterList*,ParameterIterator *iter){iter->valid=false;}
static void RNA_parameter_list_next(ParameterIterator *iter){iter->valid=false;}
static void RNA_parameter_list_end(ParameterIterator*){}
static void RNA_parameter_list_free(ParameterList*){++g_parameter_frees;}
static PyObject *PyTuple_New(int){return &g_return;}
static void PyTuple_SET_ITEM(PyObject*,int,PyObject*){}
#define Py_RETURN_NONE return Py_None
#define PYRNA_PROP_CHECK_INT(self) assert((self)->ptr.has_value())
static void RNA_function_call(bContext *C,ReportList *reports,PointerRNA *ptr,FunctionRNA *func,ParameterList *parms){
 assert(live_id(ptr->owner_id));if(g_check_owned)assert(ptr!=g_original_target);++g_function_calls;
 Main *main=C?CTX_data_main(C):nullptr;
 if(func==&rna_IDMaterials_append_func)fixture_append(ptr->owner_id,main,parms->material,reports);
 else if(func==&rna_IDMaterials_pop_func)parms->result=rna_IDMaterials_pop_id(ptr->owner_id,main,reports,parms->index);
 else if(func==&rna_IDMaterials_clear_func)fixture_clear(ptr->owner_id,main,reports);
 else assert(false);
}
"""

PYTHON_SUPPORT = r"""
static BPy_PropertyRNA g_python_target;
static BPy_StructRNA g_python_value;
static int g_python_mutation=0;
static void python_hook(){
 Fixture &f=*g_fixture;g_after_cancel=true;g_python_target.ptr.reset();g_python_value.ptr.reset();
 if(g_python_mutation==1)f.main.ids.erase(std::remove(f.main.ids.begin(),f.main.ids.end(),f.data),f.main.ids.end());
 if(g_python_mutation==2)f.main.ids.erase(std::remove(f.main.ids.begin(),f.main.ids.end(),&f.incoming.id),f.main.ids.end());
 if(g_python_mutation==3)g_bpy_context=nullptr;
 if(g_python_mutation==4)f.C.area=&g_replacement_area;
 if(g_python_mutation==5)f.main.ids.erase(std::remove(f.main.ids.begin(),f.main.ids.end(),&f.old_material.id),f.main.ids.end());
 if(g_python_mutation==6)++f.data->session_uid;
 if(g_python_mutation==7)++f.incoming.id.session_uid;
 if(g_python_mutation==8)f.data->name[0]='Z';
 if(g_python_mutation==9)--f.count();
}
static void python_lookup_owner_vanish_hook(){python_hook();g_fixture->win.modalhandlers.first=nullptr;}
static void python_lookup_spawn_owner_hook(){python_hook();g_fixture->add_owner();}
static void reset_python(Fixture &f,int mutation){
 g_fixture=&f;g_bpy_context=&f.C;g_python_target.ptr=f.ptr;g_python_value.ptr=f.value;
 g_original_target=&*g_python_target.ptr;g_original_value=&*g_python_value.ptr;
 g_python_mutation=mutation;g_after_cancel=false;g_check_owned=true;
 g_python_errors=g_reports_to_error=g_return_conversions=g_parameter_frees=0;
 g_collection_lengths=g_collection_assignments=g_function_calls=g_funcptr_creates=0;
 g_cancel_hook=python_hook;
}
static int python_assign(Fixture &f,int mutation=0,Py_ssize_t key=0,bool nullable=false){
 static CollectionPropertyRNA property;property.type=PROP_COLLECTION;property.assignint=rna_IDMaterials_assign_int;
 reset_python(f,mutation);g_python_target.prop=&property;
 return pyrna_prop_collection_ass_subscript_int(&g_python_target,key,nullable?Py_None:static_cast<PyObject*>(&g_python_value));
}
static PyObject *python_method(Fixture &f,int profile,int mutation=0,bool nullable=false,int index=-1){
 reset_python(f,mutation);g_python_target.ptr->type=&RNA_IDMaterials;
 FunctionRNA *func=profile==1?&rna_IDMaterials_append_func:profile==2?&rna_IDMaterials_pop_func:&rna_IDMaterials_clear_func;
 ParameterList parms;parms.func=func;parms.material=nullable?nullptr:&f.incoming;parms.index=index;
 return fixture_python_method(&*g_python_target.ptr,func,parms,profile==2?1:0);
}
"""


def source_parts():
    obj = changed_source(assignment.OBJECT_PATH)
    ids = changed_source("source/blender/makesrna/intern/rna_ID.cc")
    access = changed_source(assignment.ACCESS_PATH)
    py = changed_source(assignment.PYTHON_PATH)
    # Shared typed-ID capture is exact production code, independently of the
    # existing assignment-specific snapshot and helper.
    private = obj[obj.index("struct RnaMaterialIDIdentity"):obj.index("struct RnaMaterialAssignState")]
    private += function(obj, "static short rna_material_data_type(")
    collection_start = obj.rfind("#ifdef WITH_APPLE_CROSSPLATFORM", 0, obj.index("struct RnaMaterialCollection"))
    collection_end = obj.index("static int rna_Object_active_material_editable(", collection_start)
    collection = obj[collection_start:collection_end]
    signatures = []
    for result, name in (("bool ","rna_IDMaterials_assign_int"), ("void ","rna_IDMaterials_append_id"),
                         ("Material *","rna_IDMaterials_pop_id"),("void ","rna_IDMaterials_clear_id")):
        signature = result + name + "("
        if "static " + signature in ids:
            signature = "static " + signature
        signatures.append(signature)
    callbacks = [function(ids, signature) for signature in signatures]
    append_reports = "ReportList" in callbacks[1].split("{", 1)[0]
    clear_reports = "ReportList" in callbacks[3].split("{", 1)[0]
    adapters = "static void fixture_append(ID *id,Main *m,Material *ma,ReportList *reports){" + (
        "rna_IDMaterials_append_id(id,m,ma,reports);" if append_reports else "(void)reports;rna_IDMaterials_append_id(id,m,ma);") + "}\n"
    adapters += "static void fixture_clear(ID *id,Main *m,ReportList *reports){" + (
        "rna_IDMaterials_clear_id(id,m,reports);" if clear_reports else "(void)reports;rna_IDMaterials_clear_id(id,m);") + "}\n"
    return private, collection, "\n".join(callbacks), adapters, access, py


def source_with_main(main):
    private, collection, callbacks, adapters, access, py = source_parts()
    block_start = access.rfind("#ifdef WITH_APPLE_CROSSPLATFORM", 0, access.index("extern bool rna_IDMaterials_assign_int"))
    access_block = access[block_start:access.index("static CLG_LogRef LOG", block_start)]
    generic = function(access, "bool RNA_property_collection_assign_int(")
    index_macro = re.search(r"#define PYRNA_PROP_COLLECTION_ABS_INDEX.*?(?=\n\n)", py, re.S).group(0)
    indexed = function(py, "static int pyrna_prop_collection_ass_subscript_int(")
    method = function(py, "static PyObject *pyrna_func_call(")
    method_tail = method[method.index("  ret = nullptr;", method.index("/* Parse function parameters. */")):]
    method_frame = """static PyObject *fixture_python_method(PointerRNA *self_ptr,FunctionRNA *self_func,ParameterList &parms,int ret_len){
ParameterIterator iter;PropertyRNA *parm=nullptr;PropertyRNA *pret_single=nullptr;
void *retdata_single=&parms.result;int err=0,i=0;PyObject *ret=nullptr;
PointerRNA funcptr=RNA_pointer_create_discrete(self_ptr->owner_id,&RNA_Function,self_func);
""" + method_tail
    generic_wrapper = r"""
#undef RNA_property_collection_assign_int
static bool RNA_property_collection_assign_int(PointerRNA *ptr,PropertyRNA *prop,int index,const PointerRNA *value){
 if(g_check_owned){assert(ptr!=g_original_target);assert(value!=g_original_value);}
 ++g_collection_assignments;return fixture_native_collection_assign(ptr,prop,index,value);
}
"""
    return "\n".join((PREFIX, MODEL, EXTRA, assignment.WM_NEXT,
        "#define BKE_id_material_append fixture_native_material_append\n"
        "#define BKE_id_material_pop fixture_native_material_pop\n"
        "#define BKE_id_material_clear fixture_native_material_clear\n"
        "#define BKE_id_material_assign fixture_native_material_assign", NATIVE, ADAPTERS,
        "#ifdef WITH_APPLE_CROSSPLATFORM", private, "#endif", collection,
        callbacks, adapters, access_block, SUPPORT, PYTHON_MODEL,
        "#define RNA_property_collection_assign_int fixture_native_collection_assign", generic,
        generic_wrapper, index_macro, indexed, method_frame, PYTHON_SUPPORT, main))


class PencilMaterialCollectionOwnerTeardownTests(unittest.TestCase):
    def run_cpp(self, main, apple=True, debug=True):
        source = source_with_main(main)
        if not apple:
            source = source.replace("#define WITH_APPLE_CROSSPLATFORM\n", "")
        if not debug:
            source = source.replace("\n#define BLI_assert_msg", "\n#define NDEBUG\n#define BLI_assert_msg", 1)
        candidates = [shutil.which("clang++"), shutil.which("g++")]
        if os.name == "nt":
            candidates += [r"C:\Program Files\LLVM\bin\clang++.exe",
                           r"C:\Program Files\Microsoft Visual Studio\18\Insiders\VC\Tools\Llvm\x64\bin\clang++.exe"]
        compiler = next((str(p) for p in candidates if p and Path(p).is_file()), None)
        if not compiler:
            self.skipTest("C++17 compiler unavailable; collection fixtures were not executed")
        with tempfile.TemporaryDirectory(prefix="ipad-material-collection-") as directory:
            work = Path(directory)
            test = work / "test.cc"
            test.write_text(source, encoding="utf-8")
            binary = work / ("tests.exe" if os.name == "nt" else "tests")
            subprocess.run([compiler, "-std=c++17", "-Wall", "-Wextra", "-Werror", "-pedantic",
                            "-Wno-unused-function", str(test), "-o", str(binary)], cwd=work, check=True)
            subprocess.run([str(binary)], cwd=work, check=True)

    def test_exact_pinned_native_primary_bodies_and_portable_provenance(self):
        for signature, digest in HASHES.items():
            self.assertEqual(hashlib.sha256(function(NATIVE, signature).encode()).hexdigest(), digest)
        self.assertIn(PIN, NATIVE)
        self.assertIn(MATERIAL_BLOB, NATIVE)
        self.assertIn("#define MAXMAT (32767 - 1)", NATIVE)
        cached = PIN_ROOT / assignment.MATERIAL_PATH
        if cached.is_file():
            raw = cached.read_text(encoding="utf-8").encode()
            self.assertEqual(hashlib.sha1(b"blob " + str(len(raw)).encode() + b"\0" + raw).hexdigest(), MATERIAL_BLOB)

    def test_native_no_owner_nullable_append_pop_clear_and_assignment_effects(self):
        self.run_cpp(r"""
int main(){for(int type:{ID_ME,ID_CU_LEGACY,ID_MB,ID_CV,ID_PT,ID_VO,ID_GP}){
 {Fixture f(type);f.value={};f.apply(eRNAMaterialCollectionOperation::Append);
  assert(f.count()==3&&f.array()[2]==nullptr&&g_native_appends==1&&g_refcount_plus==0);
  assert(g_allocations==1&&g_data_syncs==1&&g_native_tags==1&&g_relations==1&&g_notifiers==2);}
 {Fixture f(type);f.array()[1]=nullptr;Material *ma=rna_IDMaterials_pop_id(f.data,&f.main,&f.reports,-1);
  assert(ma==nullptr&&f.reports.errors==0&&f.count()==1&&g_native_pops==1&&g_refcount_minus==0);
  assert(g_data_syncs==1&&g_relations==1&&g_native_tags==2&&g_notifiers==2);}
 {Fixture f(type,1);Material *ma=rna_IDMaterials_pop_id(f.data,&f.main,&f.reports,0);
  assert(ma==&f.old_material&&f.count()==0&&f.array()==nullptr&&g_refcount_minus==1);
  assert(g_data_syncs==0&&g_allocations==0&&g_native_tags==2&&g_notifiers==2);}
 {Fixture f(type,0);f.apply(eRNAMaterialCollectionOperation::Clear);
  assert(f.count()==0&&f.array()==nullptr&&g_native_clears==1&&g_refcount_minus==0);
  assert(g_data_syncs==1&&g_relations==1&&g_native_tags==2&&g_notifiers==2);
  assert(g_index_mesh_clear==(type==ID_ME)&&g_index_curve_clear==(type==ID_CU_LEGACY));}
 {Fixture f(type);f.value={};assert(rna_IDMaterials_assign_int(&f.ptr,0,&f.value));
  assert(f.array()[0]==nullptr&&f.count()==2&&g_native_assigns==1&&g_refcount_minus==1&&g_refcount_plus==0);
  assert(g_data_syncs==1&&g_native_tags==1&&g_relations==1);}
 assert(g_cancel_calls==0);
}}
""")

    def test_direct_callbacks_only_query_absence_and_invalid_indices_keep_native_errors(self):
        self.run_cpp(r"""
int main(){for(auto op:{eRNAMaterialCollectionOperation::Append,eRNAMaterialCollectionOperation::Pop,
 eRNAMaterialCollectionOperation::Clear,eRNAMaterialCollectionOperation::Assign}){
 Fixture f;f.add_owner();f.apply(op);assert(g_cancel_calls==0&&g_context_allocs==0&&has_owner(&f.main));assert_no_native();}
for(int i:{-3,2,32767}){Fixture f;f.add_owner();assert(!rna_IDMaterials_assign_int(&f.ptr,i,&f.value));assert_no_native();
 assert(rna_IDMaterials_pop_id(f.data,&f.main,&f.reports,i)==nullptr&&f.reports.errors==1&&g_cancel_calls==0);assert_no_native();}
}
""")

    def test_explicit_producer_preflight_drains_all_windows_before_all_four_native_callbacks(self):
        self.run_cpp(r"""
int main(){for(bool context:{false,true})for(auto op:{eRNAMaterialCollectionOperation::Append,
 eRNAMaterialCollectionOperation::Pop,eRNAMaterialCollectionOperation::Clear,eRNAMaterialCollectionOperation::Assign}){
 Fixture f;f.add_owner(true);assert(f.prepare(op,context?&f.C:nullptr));assert_no_native();
 assert(g_cancel_calls==2&&g_context_allocs==2&&g_context_frees==2&&!has_owner(&f.main));f.apply(op);
 assert(f.reports.errors==0&&g_native_appends+g_native_pops+g_native_clears+g_native_assigns==1);
}}
""")

    def test_cancel_failure_and_changed_context_or_main_refuse_before_native_mutation(self):
        self.run_cpp(r"""
int main(){for(auto op:{eRNAMaterialCollectionOperation::Append,eRNAMaterialCollectionOperation::Pop,
 eRNAMaterialCollectionOperation::Clear,eRNAMaterialCollectionOperation::Assign})for(int kind:{0,31,32}){
 Fixture f;f.add_owner();if(kind==0)g_cancel_ok=false;else mutate(f,kind);
 assert(!f.prepare(op,&f.C)&&f.reports.errors>0&&g_cancel_calls==1);assert_no_native();
}}
""")

    def test_fresh_data_material_library_override_and_participant_changes_refuse(self):
        self.run_cpp(r"""
int main(){for(int kind=1;kind<=30;++kind){Fixture f(ID_CU_LEGACY);f.add_owner();
 f.data->lib=&f.library;f.data->override_library=&f.override;
 f.incoming.id.lib=&f.library;f.old_material.id.lib=&f.library;f.other_material.id.lib=&f.library;
 mutate(f,kind);assert(!f.prepare(eRNAMaterialCollectionOperation::Append,&f.C));
 assert(f.reports.errors>0&&g_cancel_calls==1);assert_no_native();
}}
""")

    def test_full_short_count_and_native_MAXMAT_asymmetric_admission(self):
        self.run_cpp(r"""
int main(){assert(MAXMAT==32766);
 {Fixture f(ID_ME,32766);f.add_owner();assert(f.prepare(eRNAMaterialCollectionOperation::Append));
  f.apply(eRNAMaterialCollectionOperation::Append);assert(f.count()==32767&&f.array()[32766]==&f.incoming);
  assert(g_cancel_calls==1&&g_native_appends==1&&g_data_syncs==1&&g_refcount_plus==1);}
 {Fixture f(ID_ME,32767);f.add_owner();
  assert(f.prepare(eRNAMaterialCollectionOperation::Assign,nullptr,32766));
  assert(g_cancel_calls==0&&has_owner(&f.main));
  assert(rna_IDMaterials_assign_int(&f.ptr,32766,&f.value));
  assert(g_native_assigns==1&&f.array()[32766]==&f.old_material&&g_native_tags==0&&g_relations==0&&g_refcount_plus==0);}
 {Fixture f(ID_ME,32767);f.add_owner();
  assert(f.prepare(eRNAMaterialCollectionOperation::Pop,nullptr,32766));f.apply(eRNAMaterialCollectionOperation::Pop,32766);
  assert(g_cancel_calls==1&&f.count()==32766&&g_refcount_minus==1);}
}
""", debug=False)

    def test_native_int_object_active_index_and_order_are_not_truncated_during_recapture(self):
        self.run_cpp(r"""
int main(){static_assert(sizeof(Object::totcol)==sizeof(int));static_assert(sizeof(Object::actcol)==sizeof(int));
 for(int kind:{34,35}){Fixture f;f.add_owner();mutate(f,kind);
  assert(!f.prepare(eRNAMaterialCollectionOperation::Append,&f.C)&&f.reports.errors>0);assert_no_native();
 }}
""")

    def test_nested_explicit_direct_and_query_refuse_during_native_cancel(self):
        self.run_cpp(r"""
int main(){Fixture f;f.add_owner();mutate(f,33);assert(f.prepare(eRNAMaterialCollectionOperation::Append,&f.C));
 assert(!g_nested_result&&g_cancel_calls==1);assert_no_native();f.reports={};f.apply(eRNAMaterialCollectionOperation::Append);
 assert(g_native_appends==1&&f.count()==3);
}
""")

    def test_nonactive_main_no_owner_and_nonapple_paths_keep_native_behavior(self):
        self.run_cpp(r"""
int main(){
 {Fixture f;f.add_owner();Mesh foreign_data;Material foreign_material;
  foreign_data.id.session_uid=900;foreign_material.id.session_uid=901;
  f.foreign.ids={&foreign_data.id,&foreign_material.id};g_operation_main=&f.foreign;
  PointerRNA target{&foreign_data.id,&RNA_IDMaterials,&foreign_data};
  assert(RNA_id_materials_paint_owner_teardown(&f.C,&f.foreign,&target,uintptr_t(&foreign_material),eRNAMaterialCollectionOperation::Append,0,&f.reports));
  fixture_append(&foreign_data.id,&f.foreign,&foreign_material,&f.reports);
  assert(g_cancel_calls==0&&g_native_appends==1&&foreign_data.totcol==1&&has_owner(&f.main));}
 {Fixture f;bContext wrong;wrong.main=&f.foreign;assert(f.prepare(eRNAMaterialCollectionOperation::Append,&wrong));
  f.apply(eRNAMaterialCollectionOperation::Append);assert(g_cancel_calls==0&&g_native_appends==1);}
}
""")
        self.run_cpp(r"""
int main(){Fixture f;f.add_owner();g_allow_owner=true;f.apply(eRNAMaterialCollectionOperation::Append);
 assert(g_cancel_calls==0&&g_native_appends==1&&has_owner(&f.main));}
""", apple=False)

    def test_indexed_producer_owns_both_RNA_values_through_native_callback(self):
        for debug in (True, False):
            self.run_cpp(r"""
int main(){for(int type:{ID_ME,ID_CU_LEGACY,ID_MB,ID_CV,ID_PT,ID_VO,ID_GP})for(bool nullable:{false,true}){
 Fixture f(type);f.add_owner();assert(python_assign(f,0,-1,nullable)==0);
 assert(!g_python_target.ptr&&!g_python_value.ptr&&g_cancel_calls==1);
 assert(g_collection_assignments==1&&g_collection_lengths==1&&g_reports_to_error==1&&g_python_errors==0);
 assert(f.array()[1]==(nullable?nullptr:&f.incoming)&&g_native_assigns==1&&g_refcount_minus==1&&g_refcount_plus==(!nullable));
}}
""", debug=debug)

    def test_indexed_preparation_refusal_exits_before_assign_and_length_error_frame(self):
        self.run_cpp(r"""
int main(){for(int mutation:{1,2,3,4,5}){
 Fixture f;f.add_owner();assert(python_assign(f,mutation)==-1);
 assert(g_python_errors==1&&g_reports_to_error==1&&g_collection_assignments==0&&g_collection_lengths==0);
 assert(g_cancel_calls==1);assert_no_native();}
{Fixture f;f.add_owner();g_cancel_ok=false;assert(python_assign(f)==-1);
 assert(g_python_errors==1&&g_collection_assignments==0&&g_collection_lengths==0);assert_no_native();}
}
""")

    def test_method_producer_owns_target_and_parsed_nullable_default_return_storage(self):
        self.run_cpp(r"""
int main(){for(int profile:{1,2,3})for(bool nullable:{false,true}){
 Fixture f;if(profile==2&&nullable)f.array()[1]=nullptr;f.add_owner();
 assert(python_method(f,profile,0,nullable)!=nullptr);
 assert(!g_python_target.ptr&&!g_python_value.ptr&&g_cancel_calls==1);
 assert(g_function_calls==0&&g_funcptr_creates==2&&g_reports_to_error==1&&g_parameter_frees==1&&g_python_errors==0);
 assert(g_return_conversions==(profile==2));
 if(profile==1)assert(f.count()==3&&f.array()[2]==(nullable?nullptr:&f.incoming));
 if(profile==2)assert(f.count()==1&&g_refcount_minus==(!nullable));
 if(profile==3)assert(f.count()==0&&g_refcount_minus==2);
}}
""")

    def test_method_report_refusal_precedes_generated_raw_self_call_and_pop_return_conversion(self):
        self.run_cpp(r"""
int main(){for(int profile:{1,2,3})for(int mutation:{1,3,4,5}){
 Fixture f;f.add_owner();assert(python_method(f,profile,mutation)==nullptr);
 assert(g_function_calls==0&&g_funcptr_creates==1&&g_reports_to_error==1&&g_return_conversions==0&&g_parameter_frees==1);
 assert(g_python_errors==1&&g_cancel_calls==1);assert_no_native();}
{Fixture f;f.add_owner();assert(python_method(f,1,2)==nullptr);
 assert(g_function_calls==0&&g_return_conversions==0&&g_python_errors==1);assert_no_native();}
}
""")

    def test_profile_identity_generic_direct_and_no_owner_evaluated_uid_zero_paths(self):
        self.run_cpp(r"""
int main(){
 {Fixture f;CollectionPropertyRNA prop;prop.type=PROP_COLLECTION;prop.assignint=rna_IDMaterials_assign_int;
  assert(RNA_property_is_id_materials_assignment(&prop));prop.assignint=nullptr;
  f.add_owner();assert(!RNA_property_is_id_materials_assignment(&prop));
  assert(RNA_property_id_materials_paint_owner_teardown(&f.C,&f.ptr,&prop,0,&f.value,&f.reports));
  assert(!RNA_property_collection_assign_int(&f.ptr,&prop,0,&f.value));assert_no_native();}
 {Fixture f;f.add_owner();FunctionRNA generic{1};ParameterList parms;parms.func=&generic;
  assert(!RNA_function_is_id_materials_mutation(&generic));
  (void)parms;
  assert(g_cancel_calls==0);assert_no_native();}
 {Fixture f;f.data->session_uid=f.incoming.id.session_uid=0;f.apply(eRNAMaterialCollectionOperation::Append);
  assert(g_native_appends==1&&f.count()==3&&g_cancel_calls==0);}
 {Fixture f;f.data->session_uid=0;f.add_owner();assert(!f.prepare(eRNAMaterialCollectionOperation::Append));assert_no_native();}
 {Fixture f;G_MAIN=nullptr;f.apply(eRNAMaterialCollectionOperation::Append);
  assert(g_cancel_calls==0&&f.count()==2);assert_no_native();}
}
""")

    def test_python_invalid_index_admission_precedes_drain_and_preserves_native_errors(self):
        self.run_cpp(r"""
int main(){for(int index:{-3,2,32767}){
 {Fixture f;f.add_owner();assert(python_assign(f,0,index)==-1);
  assert(g_cancel_calls==0&&g_python_errors==1&&has_owner(&f.main));assert_no_native();}
 {Fixture f;f.add_owner();assert(python_method(f,2,0,false,index)==nullptr);
  assert(g_cancel_calls==0&&g_function_calls==0&&g_return_conversions==0&&g_python_errors==1);assert_no_native();}
}}
""")

    def test_wrong_method_context_cannot_mutate_active_main_target(self):
        self.run_cpp(r"""
int main(){for(int profile:{1,2,3}){
 Fixture f;f.add_owner();f.C.main=&f.foreign;
 assert(python_method(f,profile)==nullptr);
 assert(g_cancel_calls==0&&g_function_calls==0&&g_return_conversions==0&&g_python_errors==1);assert_no_native();
}}
""")

    def test_method_context_Main_lookup_runs_once_and_owns_values_before_callback(self):
        self.run_cpp(r"""
int main(){for(int profile:{1,2,3}){
 Fixture f;assert(python_method(f,profile)!=nullptr);
 assert(g_main_lookups==1&&g_function_calls==0&&g_parameter_frees==1&&g_python_errors==0);
}
for(int profile:{1,2,3})for(int mutation:{0,3}){
 Fixture f;reset_python(f,mutation);g_python_target.ptr->type=&RNA_IDMaterials;
 FunctionRNA *func=profile==1?&rna_IDMaterials_append_func:profile==2?&rna_IDMaterials_pop_func:&rna_IDMaterials_clear_func;
 ParameterList parms;parms.func=func;parms.material=&f.incoming;
 g_context_main_hook=python_hook;
 PyObject *result=fixture_python_method(&*g_python_target.ptr,func,parms,profile==2?1:0);
 assert(g_main_lookups==1&&!g_python_target.ptr&&!g_python_value.ptr&&g_function_calls==0);
 assert(g_return_conversions==(mutation==0&&profile==2));
 assert(g_parameter_frees==1);
 if(mutation==3){assert(result==nullptr&&g_python_errors==1);assert_no_native();}
 else assert(result!=nullptr&&g_python_errors==0&&g_native_appends+g_native_pops+g_native_clears==1);
}
}
""")

    def test_collection_registration_nullable_required_append_and_pop_default_are_unchanged(self):
        ids = changed_source("source/blender/makesrna/intern/rna_ID.cc")
        append = ids[ids.index('func = RNA_def_function(srna, "append",'):ids.index('func = RNA_def_function(srna, "pop",')]
        pop = ids[ids.index('func = RNA_def_function(srna, "pop",'):ids.index('func = RNA_def_function(srna, "clear",')]
        clear = ids[ids.index('func = RNA_def_function(srna, "clear",'):]
        clear = clear[:clear.index("}")]
        self.assertIn("FUNC_USE_MAIN", append)
        self.assertIn("PARM_REQUIRED", append)
        self.assertNotIn("PROP_NEVER_NULL", append)
        self.assertRegex(pop, r"RNA_def_function_flag\(func, (?:FUNC_USE_MAIN \| FUNC_USE_REPORTS|FUNC_USE_REPORTS \| FUNC_USE_MAIN)\)")
        self.assertRegex(pop, r'RNA_def_int\(\s*func, "index", -1,')
        self.assertIn("FUNC_USE_MAIN", clear)
        self.assertNotIn("FUNC_USE_CONTEXT", append + pop + clear)

    def test_owner_disappearing_during_context_lookup_does_not_hide_deleted_native_inputs(self):
        self.run_cpp(r"""
int main(){for(int profile:{1,2,3})for(int mutation:{0,1,6}){
 Fixture f;f.add_owner();reset_python(f,mutation);g_python_target.ptr->type=&RNA_IDMaterials;
 FunctionRNA *func=profile==1?&rna_IDMaterials_append_func:profile==2?&rna_IDMaterials_pop_func:&rna_IDMaterials_clear_func;
 ParameterList parms;parms.func=func;parms.material=&f.incoming;
 g_context_main_hook=python_lookup_owner_vanish_hook;
 PyObject *result=fixture_python_method(&*g_python_target.ptr,func,parms,profile==2?1:0);
 assert(g_main_lookups==1&&g_cancel_calls==0&&!has_owner(&f.main)&&g_function_calls==0);
 if(mutation!=0){assert(result==nullptr&&g_python_errors==1&&g_return_conversions==0);assert_no_native();}
 else assert(result!=nullptr&&g_python_errors==0&&g_native_appends+g_native_pops+g_native_clears==1);
}
{Fixture f;f.add_owner();reset_python(f,2);g_python_target.ptr->type=&RNA_IDMaterials;
 ParameterList parms;parms.func=&rna_IDMaterials_append_func;parms.material=&f.incoming;
 g_context_main_hook=python_lookup_owner_vanish_hook;
 assert(fixture_python_method(&*g_python_target.ptr,&rna_IDMaterials_append_func,parms,0)==nullptr);
 assert(g_main_lookups==1&&g_cancel_calls==0&&g_python_errors==1);assert_no_native();}
}
""")

    def test_fresh_recapture_runs_after_successful_WM_absence_return_without_cancel(self):
        self.run_cpp(r"""
int main(){for(int mutation:{0,1,2,6,7}){
 Fixture f;f.add_owner();reset_python(f,mutation);g_context_main_hook=python_lookup_owner_vanish_hook;
 const bool prepared=f.prepare(eRNAMaterialCollectionOperation::Append,&f.C);
 assert(g_cancel_calls==0&&!has_owner(&f.main));assert_no_native();
 if(mutation==0){assert(prepared);f.apply(eRNAMaterialCollectionOperation::Append);assert(g_native_appends==1);}
 else assert(!prepared&&f.reports.errors>0);
}}
""")

    def test_owner_appearing_during_initially_absent_context_lookup_refuses(self):
        self.run_cpp(r"""
int main(){for(int profile:{1,2,3}){
 Fixture f;reset_python(f,0);g_python_target.ptr->type=&RNA_IDMaterials;
 FunctionRNA *func=profile==1?&rna_IDMaterials_append_func:profile==2?&rna_IDMaterials_pop_func:&rna_IDMaterials_clear_func;
 ParameterList parms;parms.func=func;parms.material=&f.incoming;g_context_main_hook=python_lookup_spawn_owner_hook;
 assert(fixture_python_method(&*g_python_target.ptr,func,parms,profile==2?1:0)==nullptr);
 assert(g_main_lookups==1&&g_cancel_calls==0&&has_owner(&f.main)&&g_function_calls==0&&g_return_conversions==0);
 assert(g_parameter_frees==1&&g_python_errors==1);assert_no_native();
}}
""")


    def test_invalid_pop_preserves_native_error_without_full_owned_storage_capture(self):
        self.run_cpp(r"""
int main(){for(int malformed:{0,1,2}){
 Fixture f;f.add_owner();if(malformed==1)f.data->session_uid=0;if(malformed==2)f.array()=nullptr;
 assert(python_method(f,2,0,false,99)==nullptr);
 assert(g_main_lookups==1&&g_cancel_calls==0&&has_owner(&f.main));
 assert(g_function_calls==0&&g_funcptr_creates==2&&g_return_conversions==0&&g_python_errors==1&&g_parameter_frees==1);
 assert_no_native();
}
for(int mutation:{1,6,8,9}){
 Fixture f;f.add_owner();reset_python(f,mutation);g_python_target.ptr->type=&RNA_IDMaterials;
 ParameterList parms;parms.func=&rna_IDMaterials_pop_func;parms.index=99;
 g_context_main_hook=python_lookup_owner_vanish_hook;
 assert(fixture_python_method(&*g_python_target.ptr,&rna_IDMaterials_pop_func,parms,1)==nullptr);
 assert(g_main_lookups==1&&g_cancel_calls==0&&g_funcptr_creates==1&&g_return_conversions==0&&g_python_errors==1);
 assert_no_native();
}}
""")

    def test_no_owner_method_uses_native_data_self_independent_from_owner_id(self):
        self.run_cpp(r"""
int main(){for(int profile:{1,2,3}){
 Fixture f;reset_python(f,0);g_python_target.ptr->type=&RNA_IDMaterials;
 g_python_target.ptr->owner_id=&f.object.id;
 FunctionRNA *func=profile==1?&rna_IDMaterials_append_func:profile==2?&rna_IDMaterials_pop_func:&rna_IDMaterials_clear_func;
 ParameterList parms;parms.func=func;parms.material=&f.incoming;
 assert(fixture_python_method(&*g_python_target.ptr,func,parms,profile==2?1:0)!=nullptr);
 assert(g_main_lookups==1&&g_cancel_calls==0&&g_function_calls==0&&g_python_errors==0);
 assert(g_native_appends+g_native_pops+g_native_clears==1);
}}
""")

    def test_foreign_Main_must_prove_disjoint_target_and_reject_owned_data_alias(self):
        self.run_cpp(r"""
int main(){
 {Fixture f;f.add_owner();assert(!RNA_id_materials_paint_owner_absent(&f.foreign,f.data,&f.reports));
  assert(!RNA_id_materials_paint_owner_teardown(&f.C,&f.foreign,&f.ptr,uintptr_t(&f.incoming),
    eRNAMaterialCollectionOperation::Append,0,&f.reports));
  fixture_append(f.data,&f.foreign,&f.incoming,&f.reports);
  assert(g_cancel_calls==0&&f.reports.errors>0);assert_no_native();}
for(int profile:{1,2,3}){
 Fixture f;Mesh foreign_data;foreign_data.id.session_uid=900;f.foreign.ids={&foreign_data.id};
 f.add_owner();reset_python(f,0);f.C.main=&f.foreign;g_operation_main=&f.foreign;
 g_python_target.ptr->type=&RNA_IDMaterials;g_python_target.ptr->owner_id=&foreign_data.id;
 FunctionRNA *func=profile==1?&rna_IDMaterials_append_func:profile==2?&rna_IDMaterials_pop_func:&rna_IDMaterials_clear_func;
 ParameterList parms;parms.func=func;parms.material=&f.incoming;
 assert(fixture_python_method(&*g_python_target.ptr,func,parms,profile==2?1:0)==nullptr);
 assert(g_cancel_calls==0&&g_function_calls==0&&g_return_conversions==0&&g_python_errors==1);assert_no_native();
}}
""")


if __name__ == "__main__":
    unittest.main()
