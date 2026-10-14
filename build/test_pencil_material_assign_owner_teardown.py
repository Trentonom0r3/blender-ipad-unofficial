"""Run real material callbacks, outer RNA pointer frames and shared WM scan.

Native Cancel and Main/list/context queries remain instrumented boundaries.
The pinned material assign/get/array/length bodies run without rewriting; only
allocator, length synchronization and dependency graph effects are modeled.
Generated setter adapters model makesrna forwarding. This is host evidence,
not execution of Python, UIKit, a full Blender Main, or device paint behavior.
"""
from pathlib import Path
import hashlib
import re
import os
import shutil
import subprocess
import tempfile
import unittest

from test_compact_shelf import function
from test_touch_extrude import changed_source, PIN_ROOT
from test_pencil_rna_override_owner_teardown import PREFIX as ID_PREFIX

ROOT = Path(__file__).resolve().parents[1]
PIN = "d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e"
OBJECT_PATH = "source/blender/makesrna/intern/rna_object.cc"
ACCESS_PATH = "source/blender/makesrna/intern/rna_access.cc"
WM_PATH = "source/blender/windowmanager/intern/wm_event_system.cc"
WM_API_PATH = "source/blender/windowmanager/WM_api.hh"
MATERIAL_PATH = "source/blender/blenkernel/intern/material.cc"
PYTHON_PATH = "source/blender/python/intern/bpy_rna.cc"
MATERIAL_PINNED_BLOB = "1d2f0cf4e5bc2fee76f360a26fa3d814b1b367bc"
OBJECT = changed_source(OBJECT_PATH)
ACCESS = changed_source(ACCESS_PATH)
WM = changed_source(WM_PATH)
WM_API = changed_source(WM_API_PATH)
MATERIAL = (ROOT / "build/tests/pinned_material_assign.inc.cc").read_text(encoding="utf-8")
MATERIAL_LIMIT = re.search(r"^#define MAXMAT .+$", MATERIAL, re.MULTILINE).group(0)
MATERIAL_SNIPPET_SHA256 = {'BKE_object_material_array_p': '476e2238d8b5f6cb25f05bd1f5803c7c7a64eb846f929ad1ad111ff265f8d71e', 'BKE_object_material_len_p': 'bfc41d22d08d61cee81eeb1d2d16d8b51bf09d573df846a6e5d57f7def6fba98', 'BKE_id_material_array_p': 'b78c1841871ca0c3d428d793f3989cb6089fd075cabfb303a87dbd1e43c7cf89', 'BKE_id_material_len_p': '7eade3ce92c9bcecefd62e5c6b84d32b80c198666f188688ee419453bc0ef842', 'BKE_object_material_get_p': '4d9310a10839fc4b5a36bfcd7d6da037f301f0643bf249aecc8e10e84ee2e6b2', 'BKE_object_material_get': 'c8b147e3b6d7bcb14c04780479bb4563444bd4c0048ce2633b4b8580e0ecc257', 'object_material_assign': 'e33ef4e132aa62cdb0dfda50e2de4f71a4e48263d5ce4dd399a736ac1b7eb264', 'BKE_object_material_assign': '2abea090e8eb21be7e0b8a487e617b1cc38f3ee58c1798a5b851be1e3f3f779c'}
PYTHON = changed_source(PYTHON_PATH)

# Source seams are selected only after the complete candidate overlay is applied.
# No shortened patch context substitutes for the actual callback/outer frame.
SETTERS = [function(OBJECT, "static void " + name + "(") for name in
           ("rna_Object_active_material_set", "rna_MaterialSlot_material_set")]
GETTERS = [function(OBJECT, "static PointerRNA " + name + "(") for name in
           ("rna_Object_active_material_get", "rna_MaterialSlot_material_get")]
SLOT_INDEX = function(OBJECT, "static int rna_MaterialSlot_index(")
OUTER = function(ACCESS, "void RNA_property_pointer_set(")
WM_NEXT = function(WM, "bool WM_event_ipad_pencil_paint_owner_teardown_next(")
MATERIAL_BODIES = "\n".join(function(MATERIAL, signature) for signature in (
    "Material ***BKE_object_material_array_p(",
    "short *BKE_object_material_len_p(",
    "Material ***BKE_id_material_array_p(",
    "short *BKE_id_material_len_p(",
    "Material **BKE_object_material_get_p(",
    "Material *BKE_object_material_get(",
    "static void object_material_assign(",
    "void BKE_object_material_assign(",
))

PREFIX = ID_PREFIX.replace("#include <vector>", "#include <vector>\n#include <cstring>\n#include <cstdlib>\n#include <memory>\n#include <unordered_map>\n#include <string>\n#include <optional>")
PREFIX = PREFIX.replace("enum ID_Type { ID_OB=", "enum ID_Type { ID_MA='M'|('A'<<8), ID_ME='M'|('E'<<8), ID_CU='C'|('U'<<8), ID_CU_LEGACY=ID_CU, ID_GD_LEGACY='G'|('D'<<8), ID_MB='M'|('B'<<8), ID_CV='C'|('V'<<8), ID_PT='P'|('T'<<8), ID_VO='V'|('O'<<8), ID_GP='G'|('P'<<8), ID_NT='N'|('T'<<8), ID_OB=")
PREFIX = PREFIX.replace("int tag=ID_TAG_EXTERN;ID *newid=nullptr;", "int tag=ID_TAG_EXTERN;int us=10,flag=0;ID *newid=nullptr;")
PREFIX = PREFIX.replace("static Main *CTX_data_main(const bContext *C){return C->main;}", "static void (*g_context_main_hook)()=nullptr;\nstatic Main *CTX_data_main(const bContext *C){if(g_context_main_hook){auto hook=g_context_main_hook;g_context_main_hook=nullptr;hook();}return C?C->main:nullptr;}")

MODEL = MATERIAL_LIMIT + "\n" + r"""
#define BLI_assert_msg(value,message) assert(value)
template<class T,class... R> static bool fixture_elem(T value,R... rest) {return ((value==rest)||...);}
#define ELEM(value,...) fixture_elem(value,__VA_ARGS__)
#define OB_DATA_SUPPORT_ID(type) ELEM(type,ID_ME,ID_CU_LEGACY,ID_MB,ID_GD_LEGACY,ID_CV,ID_PT,ID_VO,ID_GP)
#define FOREACH_MAIN_ID_BEGIN(main,id) { for(ID *fixture_id:(main)->ids) { id=fixture_id;
#define FOREACH_MAIN_ID_END }}
static int clamp_i(int value,int low,int high){return std::max(low,std::min(value,high));}
enum { OB_MESH=1,OB_CURVES_LEGACY,OB_FONT,OB_SURF,OB_MBALL,OB_CURVES,
       OB_POINTCLOUD,OB_VOLUME,OB_GREASE_PENCIL,OB_EMPTY,OB_MODE_EDIT=1<<3,
       USER_MAT_ON_OB=1,ID_RECALC_SYNC_TO_EVAL=2,ID_RECALC_GEOMETRY=4,
       PROP_POINTER=1,PROP_ID_REFCOUNT=2,PROP_EDITABLE=4,PROP_NEVER_NULL=8,
       PROP_ID_SELF_CHECK=16,ID_FLAG_EMBEDDED_DATA=32,IDP_ID=1,IDP_GROUP=2,
       IDP_FLAG_STATIC_TYPE=4,BKE_MAT_ASSIGN_EXISTING=0,BKE_MAT_ASSIGN_USERPREF=1,
       BKE_MAT_ASSIGN_OBDATA=2,BKE_MAT_ASSIGN_OBJECT=3,
       PROP_CONTEXT_UPDATE=1<<8,PROP_CONTEXT_PROPERTY_UPDATE=(1<<8)|(1<<9),
       PROP_NO_DEG_UPDATE=1<<10,PROP_DEG_SYNC_ONLY=1<<11,PROP_IDPROPERTY=1<<12,
       ID_RECALC_PARAMETERS=1<<8,ID_RECALC_TRANSFORM=1<<9,
       NA_EDITED=1<<3,NC_MATERIAL=1<<8,ND_SHADING=1<<9,NC_OBJECT=1<<10,
       ND_OB_SHADING=1<<11,ND_SHADING_LINKS=1<<12,RPT_STORE=1<<4 };
#define ID_TYPE_USE_COPY_ON_EVAL(type) ((type)==ID_OB)
struct {int flag=USER_MAT_ON_OB;} U;
struct Material {ID id{ID_MA,0};void *gp_style=nullptr;};
struct Mesh {ID id{ID_ME,0};Material **mat=nullptr;short totcol=0;};
struct Curve {ID id{ID_CU,0};Material **mat=nullptr;short totcol=0;};
struct bGPdata {ID id{ID_GD_LEGACY,0};Material **mat=nullptr;short totcol=0;};
struct MetaBall {ID id{ID_MB,0};Material **mat=nullptr;short totcol=0;};
struct Curves {ID id{ID_CV,0};Material **mat=nullptr;short totcol=0;};
struct PointCloud {ID id{ID_PT,0};Material **mat=nullptr;short totcol=0;};
struct Volume {ID id{ID_VO,0};Material **mat=nullptr;short totcol=0;};
struct GreasePencil {ID id{ID_GP,0};Material **material_array=nullptr;short material_array_num=0;};
struct Object {ID id{ID_OB,0};void *data=nullptr;short type=OB_MESH;int totcol=0,actcol=1;
  int mode=0;Material **mat=nullptr;char *matbits=nullptr;};
struct StructRNA {const char *identifier;bool id=false;StructRNA *base=nullptr;};
static StructRNA RNA_ID{"ID",true},RNA_Object{"Object",true,&RNA_ID};
static StructRNA RNA_Material{"Material",true,&RNA_ID},RNA_MaterialSlot{"MaterialSlot"};
struct AncestorPointerRNA {StructRNA *type=nullptr;void *data=nullptr;};
template<class T> struct FixtureVector : std::vector<T> {
  using std::vector<T>::vector;bool is_empty()const{return this->empty();}
};
struct PointerRNA {
  ID *owner_id=nullptr;StructRNA *type=nullptr;void *data=nullptr;
  FixtureVector<AncestorPointerRNA> ancestors{};
  template<class T> T *data_as() const {return static_cast<T*>(data);}
};
[[maybe_unused]] static const PointerRNA PointerRNA_NULL{};
enum {RNA_MAGIC=0x1234};
struct PropertyRNA {
  int magic=RNA_MAGIC;int flag=PROP_EDITABLE|PROP_ID_REFCOUNT;
  const char *identifier="";int type=PROP_POINTER,noteflag=0;
  void (*update)(Main*,Scene*,PointerRNA*)=nullptr;
};
using ContextPropUpdateFunc=void(*)(bContext*,PointerRNA*,PropertyRNA*);
using ContextUpdateFunc=void(*)(bContext*,PointerRNA*);
struct PointerPropertyRNA : PropertyRNA {
  StructRNA *type=&RNA_Material;
  PointerRNA (*get)(PointerRNA*)=nullptr;
  void (*set)(PointerRNA*,PointerRNA,ReportList*)=nullptr;
};
struct IDProperty {int type=IDP_ID;const char *name="idprop";};
static IDProperty *rna_idproperty_check(PropertyRNA **,PointerRNA*){return nullptr;}
static int RNA_property_type(const PropertyRNA *prop){return prop->type;}
static PropertyRNA *rna_ensure_property(PropertyRNA *prop){return prop;}
static void BKE_report(ReportList *reports,int,const char*){if(reports)++reports->errors;}
static bool RNA_struct_is_a(const StructRNA *type,const StructRNA *base){
  while(type){if(type==base)return true;type=type->base;}return false;
}
static bool RNA_struct_is_ID(const StructRNA *type){return type&&type->id;}
static StructRNA *RNA_property_pointer_type(PointerRNA*,PropertyRNA *prop){return static_cast<PointerPropertyRNA*>(prop)->type;}
static IDProperty *RNA_struct_system_idprops(PointerRNA*,bool){return nullptr;}
static void IDP_AssignID(IDProperty*,ID*,int){assert(false);}
static void rna_idproperty_touch(IDProperty*){assert(false);}
static void IDP_ReplaceInGroup_ex(IDProperty*,IDProperty*,IDProperty*,int){assert(false);}
static void IDP_ReplaceInGroup(IDProperty*,IDProperty*){assert(false);}
namespace blender::bke::idprop {
static std::unique_ptr<IDProperty> create(const char*,ID*,int){assert(false);return {};}
}
static PointerRNA RNA_id_pointer_create(ID *id){return {id,id?&RNA_Material:nullptr,id};}
static Main *g_operation_main=nullptr;
static bool g_allow_owner=false;
static int g_native_assigns=0,g_native_tags=0,g_relations=0,g_object_syncs=0,g_data_syncs=0;
static int g_getters=0,g_refcount_reads=0,g_allocations=0,g_refcount_plus=0,g_refcount_minus=0;
static int g_notifiers=0,g_publishes=0,g_property_update_calls=0;
static ID *g_last_tag=nullptr;
static std::unordered_map<void*,size_t> g_alloc_sizes;
static bool has_owner(Main *main){
  if(!main)return false;
  LISTBASE_FOREACH(wmWindowManager*,wm,&main->wm){
    LISTBASE_FOREACH(wmWindow*,win,&wm->windows){
      for(ListBase *list:{&win->handlers,&win->modalhandlers}){
        LISTBASE_FOREACH(wmEventHandler*,base,list){
          if(base->type==WM_HANDLER_TYPE_OP&&
             reinterpret_cast<wmEventHandler_Op*>(base)->ipad_pencil_paint_serial)return true;
        }
      }
    }
  }return false;
}
static bool live_id(ID *id){
  return !id||(g_operation_main&&std::find(g_operation_main->ids.begin(),g_operation_main->ids.end(),id)!=g_operation_main->ids.end());
}
static int fixture_refcount(const ID *id){assert(live_id(const_cast<ID*>(id)));++g_refcount_reads;return id->us;}
#define ID_REFCOUNTING_USERS(id) fixture_refcount(id)
static bool BKE_id_is_in_global_main(ID *id){return !id||(G_MAIN&&std::find(G_MAIN->ids.begin(),G_MAIN->ids.end(),id)!=G_MAIN->ids.end());}
static bool DEG_is_evaluated(const Object *ob){return (ob->id.tag&128)!=0;}
static void native_effect(){assert(g_allow_owner||!has_owner(g_operation_main));}
template<class T> static T *MEM_calloc_arrayN(size_t count,const char*){
  native_effect();++g_allocations;void *p=std::calloc(count,sizeof(T));assert(p);g_alloc_sizes[p]=count*sizeof(T);return static_cast<T*>(p);
}
static void MEM_freeN(void *p){if(p){assert(g_alloc_sizes.count(p));g_alloc_sizes.erase(p);std::free(p);}}
static void *MEM_recallocN_id(void *old,size_t bytes,const char*){
  native_effect();++g_allocations;void *p=std::calloc(1,bytes);assert(p);
  if(old){assert(g_alloc_sizes.count(old));std::memcpy(p,old,std::min(bytes,g_alloc_sizes[old]));MEM_freeN(old);}
  g_alloc_sizes[p]=bytes;return p;
}
static void id_us_min(ID *id){native_effect();assert(live_id(id));--id->us;++g_refcount_minus;}
static void id_us_plus(ID *id){native_effect();assert(live_id(id));++id->us;++g_refcount_plus;}
static void BKE_object_materials_sync_length(Main*,Object*,ID*){native_effect();++g_object_syncs;}
static void BKE_objects_materials_sync_length_all(Main*,ID*){native_effect();++g_data_syncs;}
static void DEG_id_tag_update(ID *id,int){native_effect();assert(live_id(id));++g_native_tags;g_last_tag=id;}
static void DEG_relations_tag_update(Main*){native_effect();++g_relations;}
struct wmMsgBus {};
static wmMsgBus *CTX_wm_message_bus(const bContext*){return nullptr;}
static Scene *CTX_data_scene(const bContext*){return nullptr;}
static void WM_msg_publish_rna(wmMsgBus*,PointerRNA*,PropertyRNA*){native_effect();++g_publishes;}
static void WM_main_add_notifier(int,void*){native_effect();++g_notifiers;}
static int g_generic_sets=0;
static void generic_set(PointerRNA*,PointerRNA,ReportList*){++g_generic_sets;}
// Native getter and assign names are adapted at the boundary so execution can
// check stale outer-frame accesses. Their primary source bodies are unchanged.
"""

NATIVE_ADAPTERS = r"""
#undef BKE_object_material_get
#undef BKE_object_material_assign
static Material *BKE_object_material_get(Object *ob,short act){
  assert(live_id(&ob->id));++g_getters;return fixture_native_material_get(ob,act);
}
static Material *BKE_object_material_get_eval(Object *ob,short act){
  // Evaluated geometry resolution is outside this bounded fixture.
  assert(live_id(&ob->id));++g_getters;return fixture_native_material_get(ob,act);
}
static void BKE_object_material_assign(Main *main,Object *ob,Material *ma,short act,int mode){
  native_effect();assert(live_id(&ob->id)&&(!ma||live_id(&ma->id)));++g_native_assigns;
  fixture_native_material_assign(main,ob,ma,act,mode);
}
"""

GENERATED_ADAPTERS = r"""
// Generated functions forward the fixed pointer-setter ABI to its callback.
static PointerRNA Object_active_material_get(PointerRNA *ptr){return rna_Object_active_material_get(ptr);}
static PointerRNA MaterialSlot_material_get(PointerRNA *ptr){return rna_MaterialSlot_material_get(ptr);}
void Object_active_material_set(PointerRNA *ptr,PointerRNA value,ReportList *reports){rna_Object_active_material_set(ptr,value,reports);}
void MaterialSlot_material_set(PointerRNA *ptr,PointerRNA value,ReportList *reports){rna_MaterialSlot_material_set(ptr,value,reports);}
"""

SUPPORT = r"""
struct Fixture {
  Main main,foreign;wmWindowManager wm;wmWindow win,second;
  wmEventHandler_Op owner,other_owner;bContext C;Object object,other_object,replacement;
  Mesh mesh,other_mesh;Material old_material,new_material,other_material,replacement_material;
  Library library,other_library;ID reference,root;IDOverrideLibrary override,other_override;
  ReportList reports;PointerRNA ptr,value;PointerPropertyRNA property;
  Fixture(bool slot=false){
    wm.id.session_uid=1;wm.windows.first=&win;win.winid=10;win.runtime=&win;
    main.wm.first=&wm;G_MAIN=&main;C={&main,&wm,&win,nullptr,nullptr};
    g_operation_main=&main;g_allow_owner=true;
    g_cancel_ok=true;g_change_context=g_replace_main=g_spawn=false;
    g_remove_foreign_window=g_remove_foreign_manager=false;g_cancel_calls=0;
    g_context_allocs=g_context_frees=0;g_original=&C;g_other_main=&foreign;
    g_cancel_hook=nullptr;g_context_main_hook=nullptr;g_spawn_window=nullptr;g_spawned={};
    library.id.session_uid=100;other_library.id.session_uid=101;
    object.id.session_uid=200;other_object.id.session_uid=201;replacement.id.session_uid=200;
    mesh.id.session_uid=300;other_mesh.id.session_uid=301;
    old_material.id.session_uid=400;new_material.id.session_uid=401;other_material.id.session_uid=402;
    replacement_material.id.session_uid=401;reference.session_uid=500;root.session_uid=501;
    reference.lib=&library;override.reference=&reference;override.hierarchy_root=&root;
    main.ids={&library.id,&other_library.id,&object.id,&other_object.id,&mesh.id,&other_mesh.id,
              &old_material.id,&new_material.id,&other_material.id,&reference,&root};foreign.ids=main.ids;
    object.data=&mesh;other_object.data=&mesh;replacement.data=&mesh;
    object.totcol=mesh.totcol=2;object.actcol=1;
    object.mat=MEM_calloc_arrayN<Material*>(2,"fixture object");
    object.matbits=MEM_calloc_arrayN<char>(2,"fixture bits");
    mesh.mat=MEM_calloc_arrayN<Material*>(2,"fixture data");
    object.mat[0]=&other_material;object.mat[1]=&other_material;
    mesh.mat[0]=mesh.mat[1]=&old_material;
    ptr={&object.id,slot?&RNA_MaterialSlot:&RNA_Object,slot?reinterpret_cast<void*>(uintptr_t(&object.id)+1):&object};
    value={&new_material.id,&RNA_Material,&new_material};
    property.identifier=slot?"material":"active_material";
    property.get=slot?MaterialSlot_material_get:Object_active_material_get;
    property.set=slot?MaterialSlot_material_set:Object_active_material_set;
    property.noteflag=NC_OBJECT;property.update=rna_MaterialSlot_update;
    g_allow_owner=false;reset_counters();
  }
  ~Fixture(){for(auto entry:g_alloc_sizes)std::free(entry.first);g_alloc_sizes.clear();}
  void reset_counters(){g_native_assigns=g_native_tags=g_relations=g_object_syncs=g_data_syncs=0;
    g_getters=g_refcount_reads=g_allocations=g_refcount_plus=g_refcount_minus=0;g_last_tag=nullptr;
    g_notifiers=g_publishes=g_property_update_calls=g_generic_sets=0;}
  void add_owner(bool both=false){
    owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=7;
    owner.ipad_pencil_operator_lifetime=70;win.modalhandlers.first=&owner;
    if(both){win.next=&second;second.winid=20;second.runtime=&second;
      other_owner.type=WM_HANDLER_TYPE_OP;other_owner.ipad_pencil_paint_serial=8;
      other_owner.ipad_pencil_operator_lifetime=80;second.modalhandlers.first=&other_owner;}
  }
  void direct(){property.set(&ptr,value,&reports);}
  void outer(){RNA_property_pointer_set(&ptr,&property,value,&reports);}
  bool preflight(bContext *context){return RNA_property_material_assign_paint_owner_teardown(context,&ptr,&property,value,&reports);}
  void update(){RNA_property_update(&C,&ptr,&property);}
};
static void assert_no_native(){assert(g_native_assigns==0&&g_native_tags==0&&g_relations==0&&
  g_object_syncs==0&&g_data_syncs==0&&g_allocations==0&&g_refcount_plus==0&&g_refcount_minus==0&&g_notifiers==0&&g_publishes==0);}
static Fixture *g_fixture=nullptr;
enum Mutation {None,RemoveObject,ObjectUID,ObjectType,ReplaceObject,DataAddress,RemoveData,DataUID,DataType,
  IncomingUID,IncomingType,RemoveIncoming,ReplaceIncoming,OldUID,OldType,RemoveOld,
  ObjectLibrary,DataLibrary,IncomingLibrary,OldLibrary,LibraryUID,LibraryType,RemoveLibrary,
  OverrideAddress,OverrideFlag,OverrideReference,ReferenceUID,ReferenceType,RemoveReference,
  OverrideRoot,RootUID,RootType,RemoveRoot,ClearOverride,ClearReference,
  ObjectTypeNumber,ActiveIndex,ObjectCount,DataCount,ObjectArray,DataArray,LinkArray,LinkBit,
  OldSlot,OtherSlot,MainReplace,Context,Nested};
static Mutation g_mutation=None;static int g_mutate_after=1;static bool g_nested_result=true,g_nested_context=false;
static void mutation_hook(){
  if(g_cancel_calls<g_mutate_after)return;
  Fixture &f=*g_fixture;
  auto remove=[&](ID *id){f.main.ids.erase(std::remove(f.main.ids.begin(),f.main.ids.end(),id),f.main.ids.end());};
  switch(g_mutation){
    case None:break;
    case RemoveObject:remove(&f.object.id);break;case ObjectUID:++f.object.id.session_uid;break;
    case ObjectType:f.object.id.name[0]='Z';break;
    case ReplaceObject:remove(&f.object.id);f.main.ids.push_back(&f.replacement.id);break;
    case DataAddress:f.object.data=&f.other_mesh;break;case RemoveData:remove(&f.mesh.id);break;
    case DataUID:++f.mesh.id.session_uid;break;case DataType:f.mesh.id.name[0]='Z';break;
    case IncomingUID:++f.new_material.id.session_uid;break;case IncomingType:f.new_material.id.name[0]='Z';break;
    case RemoveIncoming:remove(&f.new_material.id);break;
    case ReplaceIncoming:remove(&f.new_material.id);f.main.ids.push_back(&f.replacement_material.id);break;
    case OldUID:++f.old_material.id.session_uid;break;case OldType:f.old_material.id.name[0]='Z';break;
    case RemoveOld:remove(&f.old_material.id);break;
    case ObjectLibrary:f.object.id.lib=&f.other_library;break;case DataLibrary:f.mesh.id.lib=&f.other_library;break;
    case IncomingLibrary:f.new_material.id.lib=&f.other_library;break;case OldLibrary:f.old_material.id.lib=&f.other_library;break;
    case LibraryUID:++f.library.id.session_uid;break;case LibraryType:f.library.id.name[0]='Z';break;
    case RemoveLibrary:remove(&f.library.id);break;
    case OverrideAddress:f.object.id.override_library=&f.other_override;break;
    case OverrideFlag:f.override.flag^=2;break;case OverrideReference:f.override.reference=&f.other_material.id;break;
    case ReferenceUID:++f.reference.session_uid;break;case ReferenceType:f.reference.name[0]='Z';break;
    case RemoveReference:remove(&f.reference);break;
    case OverrideRoot:f.override.hierarchy_root=&f.other_material.id;break;
    case RootUID:++f.root.session_uid;break;case RootType:f.root.name[0]='Z';break;case RemoveRoot:remove(&f.root);break;
    case ClearOverride:f.object.id.override_library=nullptr;break;case ClearReference:f.override.reference=nullptr;break;
    case ObjectTypeNumber:f.object.type=OB_CURVES;break;case ActiveIndex:++f.object.actcol;break;
    case ObjectCount:--f.object.totcol;break;case DataCount:--f.mesh.totcol;break;
    case ObjectArray:f.object.mat=nullptr;break;case DataArray:f.mesh.mat=nullptr;break;
    case LinkArray:f.object.matbits=nullptr;break;case LinkBit:f.object.matbits[0]^=1;f.object.matbits[1]^=1;break;
    case OldSlot:f.mesh.mat[0]=f.mesh.mat[1]=&f.other_material;break;
    case OtherSlot:f.mesh.mat[0]=&f.other_material;break;
    case MainReplace:G_MAIN=&f.foreign;break;case Context:f.C.area=&g_replacement_area;break;
    case Nested:{ReportList reports;g_nested_result=RNA_property_material_assign_paint_owner_teardown(g_nested_context?&f.C:nullptr,&f.ptr,&f.property,f.value,&reports);
      assert(!g_nested_result&&reports.errors>0);
      bool did=true;assert(!WM_event_ipad_pencil_paint_owner_teardown_next(&f.C,&f.main,&did)&&!did);
      assert(!WM_event_ipad_pencil_paint_owner_teardown_next(nullptr,&f.main,nullptr));
      f.property.set(&f.ptr,f.value,&reports);RNA_property_pointer_set(&f.ptr,&f.property,f.value,&reports);
      f.update();assert_no_native();break;}
  }
}
static void mutate(Fixture &f,Mutation mutation,int after=1){g_fixture=&f;g_mutation=mutation;g_mutate_after=after;g_cancel_hook=mutation_hook;}
"""


OBJECT_HELPER_START = OBJECT.rfind("#ifdef WITH_APPLE_CROSSPLATFORM", 0, OBJECT.index("struct RnaMaterialIDIdentity"))
OBJECT_HELPERS = OBJECT[OBJECT_HELPER_START:OBJECT.index("static void rna_Object_active_material_set(")]
ACCESS_HELPER_START = ACCESS.rfind("#ifdef WITH_APPLE_CROSSPLATFORM", 0, ACCESS.index("static int rna_material_assignment_profile"))
ACCESS_COLLECTION_START = ACCESS.rfind("#ifdef WITH_APPLE_CROSSPLATFORM", 0, ACCESS.index("extern bool rna_IDMaterials_assign_int"))
ACCESS_HELPERS = ACCESS[ACCESS_HELPER_START:ACCESS_COLLECTION_START]
MATERIAL_UPDATE = "\n".join(function(OBJECT, signature) for signature in (
    "static void rna_Object_internal_update(", "static void rna_MaterialSlot_update("))
UPDATE = "\n".join(function(ACCESS, signature) for signature in (
    "static void rna_property_update(", "bool RNA_property_update_check(", "void RNA_property_update("))

# Run the exact pointer-conversion/report and trailing-update blocks, keeping
# optional PointerRNA storage at function scope as in pyrna_py_to_prop. Python
# object conversion/type checks and interpreter exceptions are modeled here.
PYTHON_CONVERSION = function(PYTHON, "static int pyrna_py_to_prop(")
PYTHON_SCOPE = PYTHON_CONVERSION[PYTHON_CONVERSION.index("{")+1:PYTHON_CONVERSION.index("  /* XXX hard limits")]
PYTHON_COMMON_START = PYTHON_CONVERSION.index("            ReportList reports;", PYTHON_CONVERSION.index("/* Data == nullptr, assign to RNA. */"))
PYTHON_COMMON_END = PYTHON_CONVERSION.index("\n          }\n          else", PYTHON_COMMON_START)
PYTHON_COMMON = PYTHON_CONVERSION[PYTHON_COMMON_START:PYTHON_COMMON_END]
PYTHON_LATE = PYTHON_CONVERSION[PYTHON_CONVERSION.index("  /* Run RNA property functions. */"):]
PYTHON_MODEL = r"""
struct PyObject {};
struct BPy_StructRNA {std::optional<PointerRNA> ptr;};
static PyObject exception;static PyObject *PyExc_RuntimeError=&exception;
static bContext *g_bpy_context=nullptr;
static int g_reports_to_error=0,g_python_errors=0,g_decrefs=0;
static bool g_check_saved_pointer=false;
static PointerRNA *g_original_python_pointer=nullptr;
static bContext *BPY_context_get(){return g_bpy_context;}
static void BKE_reports_init(ReportList *reports,int){*reports={};}
static int BPy_reports_to_error(ReportList *reports,PyObject*,bool){
  ++g_reports_to_error;if(reports->errors){++g_python_errors;return -1;}return 0;
}
static void Py_XDECREF(PyObject *value){if(value)++g_decrefs;}
static void PyErr_SetString(PyObject*,const char*){++g_python_errors;}
static void RNA_property_update(bContext *C,PointerRNA *ptr,PropertyRNA *prop){
  ++g_property_update_calls;
  if(g_check_saved_pointer)assert(ptr!=g_original_python_pointer);
  fixture_native_property_update(C,ptr,prop);
}
"""
PYTHON_FRAME = "static int fixture_python_assignment(PointerRNA *ptr,PropertyRNA *prop,BPy_StructRNA *param,PyObject *value_new){\n" + PYTHON_SCOPE + PYTHON_COMMON + "\n" + PYTHON_LATE
PYTHON_SUPPORT = r"""
static std::optional<PointerRNA> g_python_target;
static BPy_StructRNA g_python_param;
static int g_python_mutation=0;
static void python_storage_hook(){
  Fixture &f=*g_fixture;
  g_python_target.reset();g_python_param.ptr.reset();
  if(g_python_mutation==1){f.main.ids.erase(std::remove(f.main.ids.begin(),f.main.ids.end(),&f.object.id),f.main.ids.end());}
  if(g_python_mutation==2)g_bpy_context=nullptr;
}
static int python_assign(Fixture &f,bool null_value=false,int mutation=0){
  g_fixture=&f;g_python_mutation=mutation;g_bpy_context=&f.C;
  g_python_target=f.ptr;g_python_param.ptr=f.value;
  g_reports_to_error=g_python_errors=g_decrefs=0;
  g_check_saved_pointer=true;g_original_python_pointer=&*g_python_target;
  if(mutation>=0)g_cancel_hook=python_storage_hook;
  PyObject value_new;
  return fixture_python_assignment(&*g_python_target,&f.property,null_value?nullptr:&g_python_param,&value_new);
}
"""


def source_with_main(main):
    return "\n".join((PREFIX, MODEL, WM_NEXT,
        "#define BKE_object_material_get fixture_native_material_get\n"
        "#define BKE_object_material_assign fixture_native_material_assign", MATERIAL_BODIES,
        NATIVE_ADAPTERS, OBJECT_HELPERS, SLOT_INDEX, "\n".join(GETTERS),
        "\n".join(SETTERS), GENERATED_ADAPTERS, ACCESS_HELPERS, OUTER, MATERIAL_UPDATE,
        "#define RNA_property_update fixture_native_property_update", UPDATE,
        "#undef RNA_property_update", PYTHON_MODEL, PYTHON_FRAME, SUPPORT, PYTHON_SUPPORT, main))


class PencilMaterialAssignOwnerTeardownTests(unittest.TestCase):
    def run_cpp(self, main, apple=True, debug=True):
        source = source_with_main(main)
        if not apple:
            source = source.replace("#define WITH_APPLE_CROSSPLATFORM\n", "")
        if not debug:
            # cassert was included before this definition, so fixture assertions
            # stay active while production uses its real Release preprocessor path.
            source = source.replace("\n#define BLI_assert_msg", "\n#define NDEBUG\n#define BLI_assert_msg", 1)
        candidates = [shutil.which("clang++"), shutil.which("g++")]
        if os.name == "nt":
            candidates += [r"C:\Program Files\LLVM\bin\clang++.exe",
                           r"C:\Program Files\Microsoft Visual Studio\2022\Preview\VC\Tools\Llvm\x64\bin\clang++.exe",
                           r"C:\Program Files\Microsoft Visual Studio\18\Insiders\VC\Tools\Llvm\x64\bin\clang++.exe"]
        compiler = next((str(path) for path in candidates if path and Path(path).is_file()), None)
        if not compiler:
            self.skipTest("C++17 compiler unavailable; material behavior fixtures were not run")
        with tempfile.TemporaryDirectory(prefix="ipad-material-owner-") as directory:
            work = Path(directory)
            test = work / "test.cc"
            test.write_text(source, encoding="utf-8")
            binary = work / ("tests.exe" if os.name == "nt" else "tests")
            subprocess.run([compiler, "-std=c++17", "-Wall", "-Wextra", "-Werror", "-pedantic",
                            "-Wno-unused-function", str(test), "-o", str(binary)], cwd=work, check=True)
            subprocess.run([str(binary)], cwd=work, check=True)

    def test_native_int_active_index_change_cannot_wrap_snapshot(self):
        self.run_cpp(r"""
int main(){for(bool slot:{false,true}){
  Fixture f(slot);f.add_owner();g_fixture=&f;
  g_cancel_hook=[](){g_fixture->object.actcol+=65536;};
  assert(!f.preflight(&f.C)&&f.reports.errors>0&&g_cancel_calls==1);
  assert(f.object.actcol==65537);assert_no_native();
}}
""")

    def test_context_query_that_retires_owner_still_revalidates_inputs(self):
        self.run_cpp(r"""
int main(){for(bool slot:{false,true})for(bool change_uid:{false,true}){
  Fixture f(slot);f.add_owner();g_fixture=&f;
  if(change_uid)g_context_main_hook=[](){auto &x=*g_fixture;x.win.modalhandlers.first=nullptr;++x.object.id.session_uid;};
  else g_context_main_hook=[](){auto &x=*g_fixture;x.win.modalhandlers.first=nullptr;x.object.actcol+=65536;};
  assert(!f.preflight(&f.C)&&f.reports.errors>0&&g_cancel_calls==0&&!has_owner(&f.main));
  assert_no_native();
}}
""")

    def test_native_over_limit_and_unsupported_storage_keep_direct_and_outer_refusal_parity(self):
        for apple in (True, False):
            for debug in (True, False):
                self.run_cpp(r"""
int main(){assert(MAXMAT==32766);for(bool slot:{false,true})for(bool over_limit:{false,true})for(bool outer:{false,true}){
  Fixture f(slot);
  if(over_limit){
    if(slot)f.ptr.data=reinterpret_cast<void*>(uintptr_t(&f.object.id)+MAXMAT);
    else f.object.actcol=MAXMAT+1;
  }
  else f.object.type=OB_EMPTY;
  if(outer)f.outer();else f.direct();
  assert(g_native_assigns==1&&g_cancel_calls==0&&f.reports.errors==0);
  assert(g_native_tags==(slot?0:1));if(!slot)assert(g_last_tag==&f.new_material.id);
  assert(g_relations==0&&g_allocations==0&&g_object_syncs==0&&g_data_syncs==0);
  assert(g_refcount_plus==0&&g_refcount_minus==0&&f.old_material.id.us==10&&f.new_material.id.us==10);
  assert(f.object.totcol==2&&f.mesh.totcol==2&&f.mesh.mat[0]==&f.old_material&&f.mesh.mat[1]==&f.old_material);
}}
""", apple=apple, debug=debug)

    def test_registered_owner_refusal_still_precedes_native_over_limit_or_storage_admission(self):
        self.run_cpp(r"""
int main(){for(bool slot:{false,true})for(bool over_limit:{false,true})for(bool outer:{false,true}){
  Fixture f(slot);f.add_owner();
  if(over_limit){if(slot)f.ptr.data=reinterpret_cast<void*>(uintptr_t(&f.object.id)+MAXMAT);else f.object.actcol=MAXMAT+1;}
  else f.object.type=OB_EMPTY;
  if(outer)f.outer();else f.direct();
  assert(f.reports.errors>0&&g_cancel_calls==0&&has_owner(&f.main));
  assert(g_getters==0&&g_refcount_reads==0);assert_no_native();
}
for(bool slot:{false,true}){Fixture f(slot);f.object.type=OB_EMPTY;f.add_owner();
  assert(!f.preflight(nullptr)&&g_cancel_calls==0&&f.reports.errors>0);assert_no_native();}
{Fixture f(true);f.ptr.data=reinterpret_cast<void*>(uintptr_t(&f.object.id)+MAXMAT);f.add_owner();
  assert(!f.preflight(nullptr)&&g_cancel_calls==0&&f.reports.errors>0);assert_no_native();}
}
""")

    def test_shared_wm_keeps_default_context_strict_and_queries_callback_free(self):
        self.run_cpp(r"""
int main(){for(bool slot:{false,true}){
  Fixture f(slot);f.add_owner();bool did=true;
  assert(!WM_event_ipad_pencil_paint_owner_teardown_next(nullptr,&f.main,&did)&&!did);
  assert(!WM_event_ipad_pencil_paint_owner_teardown_next(nullptr,&f.main,nullptr,
    eIPadPencilPaintOwnerContextPolicy::MaterialAssignmentOriginal));
  assert(!WM_event_ipad_pencil_paint_owner_teardown_next(&f.C,&f.main,&did,
    static_cast<eIPadPencilPaintOwnerContextPolicy>(99))&&!did);
  assert(g_cancel_calls==0&&g_context_allocs==0);assert_no_native();
  assert(WM_event_ipad_pencil_paint_owner_teardown_next(nullptr,&f.main,&did,
    eIPadPencilPaintOwnerContextPolicy::MaterialAssignmentOriginal)&&did);
  assert(g_cancel_calls==1&&!has_owner(&f.main));
}}
""")

    def test_foreign_context_with_no_owner_keeps_native_material_behavior(self):
        self.run_cpp(r"""
int main(){for(bool slot:{false,true}){Fixture f(slot);bContext foreign_context;foreign_context.main=&f.foreign;
  assert(f.preflight(&foreign_context)&&g_cancel_calls==0&&g_context_allocs==0);f.outer();
  assert(g_native_assigns==1&&f.reports.errors==0);
}}
""")

    def test_invalid_identity_ancestor_slot_and_duplicate_membership_refuse_before_cancel(self):
        self.run_cpp(r"""
int main(){for(bool slot:{false,true})for(int invalid=0;invalid<10;++invalid){
  Fixture f(slot);f.add_owner();
  if(invalid==0)f.object.id.session_uid=0;if(invalid==1)f.new_material.id.session_uid=0;
  if(invalid==2)f.main.ids.push_back(&f.object.id);
  if(invalid==3)f.ptr.type=&RNA_Material;
  if(invalid==4)f.value.owner_id=&f.old_material.id;
  if(invalid==5)f.value.type=&RNA_Object;
  if(invalid==6)f.value.ancestors.push_back({&RNA_Object,&f.object});
  if(invalid==7)f.ptr.ancestors.push_back({&RNA_Object,&f.other_object});
  if(invalid==8)f.ptr.data=slot?reinterpret_cast<void*>(uintptr_t(&f.object.id)+2):nullptr;
  if(invalid==9)f.mesh.mat[1]=reinterpret_cast<Material*>(&f.library);
  assert(!f.preflight(nullptr)&&f.reports.errors>0&&g_cancel_calls==0);
  assert(g_getters==0&&g_refcount_reads==0);assert_no_native();
}}
""")

    def test_live_owner_same_value_edit_and_actcol_zero_growth_keep_native_semantics(self):
        self.run_cpp(r"""
int main(){for(bool slot:{false,true}){
  Fixture f(slot);f.add_owner();f.object.mode=OB_MODE_EDIT;
  f.value={&f.old_material.id,&RNA_Material,&f.old_material};assert(f.preflight(nullptr));f.outer();
  assert(g_cancel_calls==1&&g_native_assigns==1&&g_relations==1&&f.old_material.id.us==10);
}
{Fixture f;f.object.actcol=f.object.totcol=f.mesh.totcol=0;f.add_owner();
  assert(f.preflight(nullptr)&&g_getters==0);f.outer();
  assert(g_cancel_calls==1&&f.object.totcol==1&&f.mesh.totcol==1&&f.mesh.mat[0]==&f.new_material);
  assert(f.object.matbits[0]==0&&g_allocations==3&&f.old_material.id.us==10&&f.new_material.id.us==11);}
}
""")

    def test_registered_material_flags_match_native_nullable_refcount_behavior(self):
        for identifier in ("material", "active_material"):
            start = OBJECT.index('RNA_def_property(srna, "' + identifier + '", PROP_POINTER, PROP_NONE)')
            end = OBJECT.index('prop = RNA_def_property(', start + 1)
            definition = OBJECT[start:end]
            self.assertIn('RNA_def_property_flag(prop, PROP_EDITABLE | PROP_ID_REFCOUNT)', definition)
            self.assertNotIn('PROP_NEVER_NULL', definition)
            self.assertNotIn('PROP_CONTEXT_UPDATE', definition)

    def test_unconditional_ui_update_after_setter_refusal_is_callback_free(self):
        self.run_cpp(r"""
int main(){for(bool slot:{false,true}){Fixture f(slot);f.add_owner();f.outer();f.update();
  assert(f.reports.errors>0&&g_cancel_calls==0&&has_owner(&f.main)&&g_property_update_calls==1);
  assert(g_getters==0&&g_refcount_reads==0);assert_no_native();
}
for(bool slot:{false,true}){Fixture f(slot);f.add_owner();assert(f.preflight(&f.C));f.outer();f.update();
  assert(f.reports.errors==0&&g_property_update_calls==1&&g_notifiers==3&&g_publishes==1);
  assert(g_relations==2&&g_native_tags>1);
}}
""")

    def test_python_conversion_copies_target_and_value_before_native_callback(self):
        for debug in (True, False):
            self.run_cpp(r"""
int main(){for(bool slot:{false,true})for(bool clear:{false,true}){
  Fixture f(slot);f.add_owner();assert(python_assign(f,clear)==0);
  assert(!g_python_target&&!g_python_param.ptr&&g_cancel_calls==1);
  assert(g_reports_to_error==1&&g_python_errors==0&&g_decrefs==0&&g_property_update_calls==1);
  assert(f.mesh.mat[slot?1:0]==(clear?nullptr:&f.new_material)&&g_native_assigns==1);
  assert(f.old_material.id.us==9&&f.new_material.id.us==(clear?10:11));
}}
""", debug=debug)

    def test_python_report_refusal_precedes_late_update_and_saved_pointer_reads(self):
        self.run_cpp(r"""
int main(){for(bool slot:{false,true})for(int refusal=0;refusal<3;++refusal){
  Fixture f(slot);f.add_owner();if(refusal==0)g_cancel_ok=false;
  assert(python_assign(f,false,refusal)==-1);
  assert(g_reports_to_error==1&&g_python_errors==1&&g_decrefs==1&&g_property_update_calls==0);
  assert(g_getters==0&&g_refcount_reads==0);assert_no_native();
}}
""")

    def test_material_profile_uses_actual_setter_identity_and_preserves_generic_noop(self):
        self.run_cpp(r"""
int main(){for(bool slot:{false,true}){Fixture f(slot);assert(RNA_property_is_material_assignment(&f.property));
  f.property.set=generic_set;f.add_owner();assert(!RNA_property_is_material_assignment(&f.property));
  assert(f.preflight(nullptr)&&g_cancel_calls==0);f.outer();
  assert(g_generic_sets==1&&g_native_assigns==0&&f.reports.errors==0&&has_owner(&f.main));
  assert(f.old_material.id.us==10&&f.new_material.id.us==10);
}}
""")

    def test_primary_native_material_source_has_exact_pinned_snippet_hashes(self):
        for name, expected in MATERIAL_SNIPPET_SHA256.items():
            signature = re.search(r"(?:static )?[^\n]*\b" + re.escape(name) + r"\(", MATERIAL).group(0)
            self.assertEqual(hashlib.sha256(function(MATERIAL, signature).encode()).hexdigest(), expected, name)
        self.assertIn(PIN, MATERIAL)
        self.assertIn(MATERIAL_PINNED_BLOB, MATERIAL)
        self.assertEqual(MATERIAL_LIMIT, "#define MAXMAT (32767 - 1)")
        limit_header = PIN_ROOT / "source/blender/makesdna/DNA_material_types.h"
        if limit_header.is_file():
            self.assertIn(MATERIAL_LIMIT, limit_header.read_text(encoding="utf-8"))
        cached = PIN_ROOT / MATERIAL_PATH
        if cached.is_file():
            raw = cached.read_text(encoding="utf-8").encode("utf-8")
            self.assertEqual(hashlib.sha1(b"blob " + str(len(raw)).encode() + b"\0" + raw).hexdigest(), MATERIAL_PINNED_BLOB)

    def test_direct_setters_and_outer_frames_refuse_owners_before_getter_tag_or_native_write(self):
        for debug in (True, False):
            self.run_cpp(r"""
int main(){for(bool slot:{false,true})for(bool outer:{false,true}){
  Fixture f(slot);f.add_owner();if(outer)f.outer();else f.direct();
  assert(f.reports.errors>0&&g_cancel_calls==0&&has_owner(&f.main));
  assert(g_getters==0&&g_refcount_reads==0);assert_no_native();
}}
""", debug=debug)

    def test_explicit_preflight_drains_all_windows_then_actual_outer_frame_assigns(self):
        for debug in (True, False):
            self.run_cpp(r"""
int main(){for(bool slot:{false,true})for(bool context:{false,true}){
  Fixture f(slot);f.add_owner(true);assert(f.preflight(context?&f.C:nullptr));
  assert(g_cancel_calls==2&&!has_owner(&f.main)&&g_getters==0&&g_refcount_reads==0);
  assert(g_context_allocs==2&&g_context_frees==2);assert_no_native();f.outer();
  assert(g_native_assigns==1&&g_relations==1&&f.reports.errors==0);
  assert(f.mesh.mat[slot?1:0]==&f.new_material);
  assert(f.old_material.id.us==9&&f.new_material.id.us==11);
  assert(g_refcount_minus==1&&g_refcount_plus==1);
}}
""", debug=debug)

    def test_fresh_typed_id_library_and_direct_slot_state_changes_refuse_without_debug_captures(self):
        self.run_cpp(r"""
int main(){for(bool slot:{false,true})for(Mutation change:{RemoveObject,ObjectUID,ObjectType,ReplaceObject,
  DataAddress,RemoveData,DataUID,DataType,IncomingUID,IncomingType,RemoveIncoming,ReplaceIncoming,
  OldUID,OldType,RemoveOld,ObjectLibrary,DataLibrary,IncomingLibrary,OldLibrary,LibraryUID,LibraryType,
  RemoveLibrary,ObjectTypeNumber,ActiveIndex,ObjectCount,DataCount,ObjectArray,DataArray,LinkArray,LinkBit,OldSlot,MainReplace}){
  Fixture f(slot);f.object.id.lib=f.mesh.id.lib=f.new_material.id.lib=f.old_material.id.lib=&f.library;
  f.add_owner(true);mutate(f,change);assert(!f.preflight(nullptr));
  assert(g_cancel_calls>=1&&f.reports.errors>0&&g_getters==0&&g_refcount_reads==0);assert_no_native();
}}
""")

    def test_override_state_and_relations_of_every_participant_are_revalidated(self):
        self.run_cpp(r"""
int main(){for(bool slot:{false,true})for(int participant=0;participant<4;++participant)
  for(Mutation change:{OverrideFlag,OverrideReference,ReferenceUID,ReferenceType,RemoveReference,OverrideRoot,RootUID,RootType,RemoveRoot}){
    Fixture f(slot);ID *ids[]={&f.object.id,&f.mesh.id,&f.new_material.id,&f.old_material.id};
    ids[participant]->override_library=&f.override;f.add_owner();mutate(f,change);
    assert(!f.preflight(nullptr)&&g_cancel_calls==1&&f.reports.errors>0);
    assert(g_getters==0&&g_refcount_reads==0);assert_no_native();
  }
  for(bool slot:{false,true})for(Mutation change:{OverrideAddress,ClearOverride,ClearReference}){
    Fixture f(slot);f.object.id.override_library=&f.override;f.add_owner();mutate(f,change);
    assert(!f.preflight(nullptr)&&f.reports.errors>0);assert_no_native();
  }
}
""")

    def test_registered_handler_refusal_and_nested_preflight_are_connected(self):
        self.run_cpp(r"""
int main(){for(bool slot:{false,true})for(int invalid=0;invalid<5;++invalid){
  Fixture f(slot);f.add_owner();
  if(invalid==0)g_cancel_ok=false;if(invalid==1)f.owner.registered=false;
  if(invalid==2)f.owner.ipad_pencil_operator_lifetime=0;
  if(invalid==3)f.win.handlers.first=&f.owner,f.win.modalhandlers.first=nullptr;
  if(invalid==4)f.win.runtime=nullptr;
  assert(!f.preflight(nullptr)&&f.reports.errors>0&&has_owner(&f.main));
  assert(g_cancel_calls==(invalid==0?1:0));assert_no_native();
}
for(bool slot:{false,true})for(bool context:{false,true}){
  Fixture f(slot);f.add_owner();g_nested_context=context;mutate(f,Nested);assert(f.preflight(context?&f.C:nullptr));
  assert(!g_nested_result&&g_cancel_calls==1&&!has_owner(&f.main));assert_no_native();
  f.outer();assert(g_native_assigns==1);
}}
""")

    def test_reentrant_new_owner_drains_and_second_cancel_revalidates_state(self):
        self.run_cpp(r"""
int main(){for(bool slot:{false,true}){
  Fixture f(slot);f.add_owner();g_spawn=true;g_spawn_window=&f.win;
  assert(f.preflight(nullptr)&&g_cancel_calls==2&&!has_owner(&f.main));f.outer();assert(g_native_assigns==1);
}
for(bool slot:{false,true})for(Mutation change:{IncomingUID,DataCount,OldSlot,LinkBit}){
  Fixture f(slot);f.add_owner(true);mutate(f,change,2);
  assert(!f.preflight(nullptr)&&g_cancel_calls==2&&f.reports.errors>0);assert_no_native();
}}
""")

    def test_native_null_same_value_link_bit_slot_offset_and_edit_mode_semantics(self):
        for debug in (True, False):
            self.run_cpp(r"""
int main(){for(bool slot:{false,true})for(bool object_link:{false,true})for(int value_kind=0;value_kind<3;++value_kind){
  Fixture f(slot);int index=slot?1:0;f.object.mode=OB_MODE_EDIT;
  if(object_link)f.object.matbits[index]=1,f.object.mat[index]=&f.old_material;
  if(value_kind==0)f.value=PointerRNA_NULL;
  if(value_kind==1)f.value={&f.old_material.id,&RNA_Material,&f.old_material};
  f.outer();assert(f.reports.errors==0&&g_cancel_calls==0&&g_native_assigns==1&&g_relations==1);
  Material *current=object_link?f.object.mat[index]:f.mesh.mat[index];
  assert(current==(value_kind==0?nullptr:value_kind==1?&f.old_material:&f.new_material));
  assert(f.old_material.id.us==(value_kind==1?10:9));
  assert(f.new_material.id.us==(value_kind==2?11:10));
  assert(g_object_syncs==(object_link?1:0)&&g_data_syncs==(object_link?0:1));
  assert(f.object.matbits[index]==(object_link?1:0));
}}
""", debug=debug)

    def test_native_actcol_zero_growth_existing_default_and_nonapple_owner_behavior(self):
        self.run_cpp(r"""
int main(){
  {Fixture f;f.object.actcol=0;f.object.totcol=0;f.mesh.totcol=0;f.outer();
    assert(g_native_assigns==1&&f.object.totcol==1&&f.mesh.totcol==1);
    assert(f.object.matbits[0]==0&&f.mesh.mat[0]==&f.new_material&&g_allocations==3);
    assert(f.new_material.id.us==11&&g_refcount_minus==0);}
  {Fixture f(true);f.ptr.data=reinterpret_cast<void*>(uintptr_t(&f.object.id)+3);f.outer();
    assert(f.object.totcol==4&&f.mesh.totcol==4&&f.mesh.mat[3]==&f.new_material);
    assert(f.mesh.mat[0]==&f.old_material&&f.object.matbits[3]==0);}
}
""", debug=False)
        self.run_cpp(r"""
int main(){for(bool slot:{false,true}){Fixture f(slot);f.add_owner();g_allow_owner=true;f.outer();
  assert(g_cancel_calls==0&&has_owner(&f.main)&&g_native_assigns==1&&f.reports.errors==0);}}
""", apple=False)

    def test_wrong_rna_value_type_never_null_self_and_generic_property_keep_native_admission(self):
        self.run_cpp(r"""
int main(){for(bool slot:{false,true}){
  {Fixture f(slot);f.value.type=&RNA_Object;f.add_owner();f.outer();
    assert(f.reports.errors>0&&g_cancel_calls==0&&g_getters==0);assert_no_native();}
  {Fixture f(slot);f.property.flag|=PROP_NEVER_NULL;f.value=PointerRNA_NULL;f.outer();assert_no_native();}
  {Fixture f(slot);f.property.flag|=PROP_ID_SELF_CHECK;f.value.owner_id=f.ptr.owner_id;f.outer();assert_no_native();}
}}
""")


if __name__ == "__main__":
    unittest.main()