"""Execute the exact-three owned pointer transaction and its enclosing callers.

The actual candidate producer/native setter/WM/generic Debug/update/Python source
is compiled. Native context callbacks, ID containers, allocation/refcount helpers,
Curve/pose kernels, interpreter objects and depsgraph are explicit host models.
The portable Mesh/multires/PBVH and material resize/sync bodies execute unchanged;
Main object-list storage, locking and allocation remain explicit models. This is neither a full
Blender runtime nor allocator/UAF/UIKit/device evidence.
"""
from pathlib import Path
import hashlib
import re
import shutil
import subprocess
import tempfile
import unittest

from test_compact_shelf import function
from test_touch_extrude import changed_source
import test_pencil_material_assign_owner_teardown as material

ROOT = Path(__file__).resolve().parents[1]
PIN = "d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e"
OBJECT_PATH = "source/blender/makesrna/intern/rna_object.cc"
ACCESS_PATH = "source/blender/makesrna/intern/rna_access.cc"
PYTHON_PATH = "source/blender/python/intern/bpy_rna.cc"
OBJECT = changed_source(OBJECT_PATH)
ACCESS = changed_source(ACCESS_PATH)
PYTHON = changed_source(PYTHON_PATH)
NATIVE = (ROOT / "build/tests/pinned_pointer_assignment_native.inc.cc").read_text(encoding="utf-8")
BASELINE = (ROOT / "build/tests/pinned_pointer_assignment_prequery_baseline.inc.cc").read_text(encoding="utf-8")
BASELINE_HASH = "dfdd2d992507c6a37f5c204c83d364707406b58055766caf64912049e1e254e3"
NATIVE_SIGNATURES = (
    "void BKE_mesh_assign_object(",
    "void multires_force_sculpt_rebuild(",
    "void BKE_sculptsession_free_pbvh(",
)
NATIVE_HASHES = {
    "void BKE_mesh_assign_object(": "7ec7195e590b3ebdbf4d5d598ef1229d6c57f84e9baa4222078ab5e4ff6a4105",
    "void multires_force_sculpt_rebuild(": "c8e7974e75cf0f15e1502a91c8dacba1d84188dc2aa98a410e1f01ae07848bb3",
    "void BKE_sculptsession_free_pbvh(": "12a7bd3f655f338ba8a1eb615b2631fd79cdb7c574ef4549f413e3a73c6c9e65",
}
NATIVE_MATERIAL_SIGNATURES = ('void BKE_id_material_resize(', 'static void object_material_active_index_sanitize(', 'void BKE_object_material_resize(', 'void BKE_object_materials_sync_length(', 'void BKE_objects_materials_sync_length_all(')
NATIVE_HASHES.update({'void BKE_id_material_resize(': 'd27014b65e7c0d4f8ece29f4e219beaf8185f700fef50197fe8b852ad3d4889e', 'static void object_material_active_index_sanitize(': 'af12b3afe51f30b0ddda0b8237af16fa6da1b3549357a83c403cf1bde3c25ad4', 'void BKE_object_material_resize(': '2deb1322a22ff69c28bc764e5c6475b58de660226fd9570eafcd29fe01020d02', 'void BKE_object_materials_sync_length(': '9643e63aad5555f840449c69912261f3dcadf623e81f7054844bf84518d15fba', 'void BKE_objects_materials_sync_length_all(': '2a23cfa46f586d0e1ac25b8570903ec34c0fc87f2bcec6a0466d1e1e42cfc6dd'})
NATIVE_CONTEXT_SIGNATURES = ('static bool ctx_data_pointer_verify(', 'Main *CTX_data_main(', 'Scene *CTX_data_scene(')
NATIVE_HASHES.update({'static bool ctx_data_pointer_verify(': 'fcc2e65ff9837ddea19edd007afcd6b4ed5422e44ab003f42c373ec0f93df297', 'Main *CTX_data_main(': '9edd620127f61045d102060567b81f0f0636c82eec98ae180fa4001eeaedba38', 'Scene *CTX_data_scene(': '8dcb91664e04592709dd8285658ec35f5c90415b23c3a7a00b267c4fe3360f78'})


def replace_once(source, old, new):
    if source.count(old) != 1:
        raise AssertionError(f"Fixture source seam changed: {old[:100]!r}")
    return source.replace(old, new, 1)


def python_frame():
    """Execute actual scope, pointer/report branch, normal cleanup and late tail.

    Conversion/type checks preceding this branch remain the interpreter model.
    Ordinary selected ID/None values have null value_new; a nonnull synthetic
    cleanup callback is tested only as an explicit enclosing contract boundary.
    """
    conversion = function(PYTHON, "static int pyrna_py_to_prop(")
    scope = conversion[conversion.index("{") + 1:conversion.index("  /* XXX hard limits")]
    start = conversion.index("            ReportList reports;", conversion.index("/* Data == nullptr, assign to RNA. */"))
    end = conversion.index("\n          }\n          else", start)
    common = conversion[start:end]
    cleanup = next(line for line in conversion.splitlines() if line == "        Py_XDECREF(value_new);")
    tail = conversion[conversion.index("  /* Owned assignments do not read"):]
    return ("static int fixture_python_assignment(PointerRNA *ptr,PropertyRNA *prop,"
            "BPy_StructRNA *param,PyObject *value_new){\n" + scope + common + "\n" + cleanup + "\n" + tail)


PYTHON_STUB_MODEL = r"""
#include <cassert>
#include <cstdint>
#include <memory>
#include <optional>
#include <vector>
#define WITH_APPLE_CROSSPLATFORM
struct bContext{};struct PropertyRNA{};
struct PointerRNA{void *data=nullptr;std::vector<uintptr_t>ancestors;};
static const PointerRNA PointerRNA_NULL{};
struct ReportList{int errors=0;};
struct PyObject{};struct BPy_StructRNA{std::optional<PointerRNA>ptr;};
static PyObject exception;static PyObject *PyExc_RuntimeError=&exception;
enum{RPT_STORE=1,RPT_ERROR=2};
enum class eRNAPointerAssignmentResult{Unrelated,NativeBaseline,AppliedOwned,Refused};
struct RNAPointerAssignmentReceipt{PointerRNA target,value;bool consumed=false;};
static bContext *g_context=nullptr,*g_saved_context=nullptr;
static std::optional<PointerRNA>g_original_target;
static BPy_StructRNA g_param;
static bool g_related=true,g_invalidate=false,g_begin_error=false,g_change_begin_context=false;
static bool g_change_cleanup_context=false;
static eRNAPointerAssignmentResult g_result=eRNAPointerAssignmentResult::AppliedOwned;
static int g_begin_calls=0,g_set_calls=0,g_finish_calls=0,g_free_calls=0;
static int g_update_calls=0,g_error_calls=0,g_decrefs=0;
static void BKE_reports_init(ReportList *reports,int){*reports={};}
static void BKE_report(ReportList *reports,int,const char*){++reports->errors;}
static bContext *BPY_context_get(){return g_context;}
static bool RNA_property_is_pointer_assignment(PropertyRNA*){return g_related;}
static eRNAPointerAssignmentResult RNA_property_pointer_assignment_begin_owned(
 bContext *C,const PointerRNA *target,PropertyRNA*,const PointerRNA *value,
 ReportList *reports,RNAPointerAssignmentReceipt **receipt){
 ++g_begin_calls;assert(C==g_saved_context);assert(target!=&*g_original_target);
 assert(target->ancestors==g_original_target->ancestors);
 assert(target->ancestors.data()!=g_original_target->ancestors.data());
 if(value->data){assert(value->ancestors==g_param.ptr->ancestors);
  assert(value->ancestors.data()!=g_param.ptr->ancestors.data());}
 if(g_result==eRNAPointerAssignmentResult::AppliedOwned){
  *receipt=new RNAPointerAssignmentReceipt{*target,*value,false};++g_set_calls;
 }
 if(g_begin_error)++reports->errors;
 if(g_invalidate){g_original_target.reset();g_param.ptr.reset();}
 if(g_change_begin_context)g_context=nullptr;
 return g_result;
}
static bool RNA_property_pointer_assignment_finish_owned(
 bContext *C,RNAPointerAssignmentReceipt *receipt,ReportList*){
 assert(C==g_saved_context&&receipt&&!receipt->consumed);receipt->consumed=true;
 assert(receipt->target.data==reinterpret_cast<void*>(11));++g_finish_calls;return true;
}
static void RNA_property_pointer_assignment_receipt_free(RNAPointerAssignmentReceipt *receipt)noexcept{
 if(receipt){++g_free_calls;delete receipt;}
}
static void RNA_property_pointer_set(PointerRNA *ptr,PropertyRNA*,PointerRNA,ReportList*){
 assert(g_original_target&&ptr==&*g_original_target);++g_set_calls;
}
static int BPy_reports_to_error(ReportList *reports,PyObject*,bool){
 if(reports->errors){++g_error_calls;return -1;}return 0;
}
static void Py_XDECREF(PyObject *value){if(value){++g_decrefs;if(g_change_cleanup_context)g_context=nullptr;}}
static void PyErr_SetString(PyObject*,const char*){++g_error_calls;}
static bool RNA_property_update_check(PropertyRNA*){return true;}
static void RNA_property_update(bContext *C,PointerRNA *ptr,PropertyRNA*){
 assert(C==g_saved_context&&g_original_target&&ptr==&*g_original_target);++g_update_calls;
}
static void reset_python(bContext *C){
 g_context=g_saved_context=C;g_original_target=PointerRNA{reinterpret_cast<void*>(11),{1,2,3}};
 g_param.ptr=PointerRNA{reinterpret_cast<void*>(22),{4,5,6}};
 g_related=true;g_invalidate=g_begin_error=g_change_begin_context=g_change_cleanup_context=false;
 g_result=eRNAPointerAssignmentResult::AppliedOwned;
 g_begin_calls=g_set_calls=g_finish_calls=g_free_calls=g_update_calls=g_error_calls=g_decrefs=0;
}
"""


def cpp_run(source, *, debug=True, apple=True, expected=0):
    candidates = [shutil.which("clang++"), shutil.which("g++"), r"C:/Program Files/LLVM/bin/clang++.exe"]
    compiler = next((str(path) for path in candidates if path and Path(path).is_file()), None)
    if not compiler:
        raise unittest.SkipTest("A C++ compiler is required")
    if not apple:
        source = source.replace("#define WITH_APPLE_CROSSPLATFORM\n", "")
    if not debug:
        # Keep fixture assert active; only actual production #ifndef NDEBUG reads it.
        source = replace_once(source, "#include <cassert>", "#include <cassert>\n#define NDEBUG")
    with tempfile.TemporaryDirectory(prefix="pencil-pointer-assignment-") as directory:
        root = Path(directory)
        source_path, binary = root / "test.cc", root / "test.exe"
        source_path.write_bytes(source.encode())
        command = [compiler, "-std=c++17", "-Wall", "-Wextra", "-Werror", "-Wno-unused-function",
                   "-Wno-unused-variable", "-pedantic", str(source_path), "-o", str(binary)]
        compiled = subprocess.run(command, capture_output=True, text=True)
        if compiled.returncode:
            raise AssertionError(compiled.stdout + compiled.stderr)
        executed = subprocess.run([str(binary)], capture_output=True, text=True)
        if executed.returncode != expected:
            raise AssertionError(f"exit={executed.returncode}, expected={expected}\n" + executed.stdout + executed.stderr)
        return executed.stdout


PUBLIC_API = r"""
using PropPointerSetFunc=void(*)(PointerRNA*,PointerRNA,ReportList*);
void RNA_property_pointer_set(PointerRNA*,PropertyRNA*,PointerRNA,ReportList*);
static bool BKE_reports_contain(ReportList *reports,int){return reports->errors>0;}
enum{ND_DRAW=1<<15};
enum class eRNAPointerAssignmentResult {Unrelated,NativeBaseline,AppliedOwned,Refused};
struct RNAPointerAssignmentReceipt;struct RnaPointerAssignmentState;
bool RNA_property_is_pointer_assignment(PropertyRNA*);
eRNAPointerAssignmentResult RNA_property_pointer_assignment_begin_owned(
 bContext*,const PointerRNA*,PropertyRNA*,const PointerRNA*,ReportList*,RNAPointerAssignmentReceipt**);
bool RNA_property_pointer_assignment_finish_owned(bContext*,RNAPointerAssignmentReceipt*,ReportList*);
void RNA_property_pointer_assignment_receipt_free(RNAPointerAssignmentReceipt*)noexcept;
bool RNA_pointer_assignment_native_admit(const PointerRNA*,int,bool,ReportList*);
RnaPointerAssignmentState *RNA_pointer_assignment_state_create(Main*,const PointerRNA*,const PointerRNA*,int,ReportList*);
bool RNA_pointer_assignment_state_validate(Main*,const RnaPointerAssignmentState*);
bool RNA_pointer_assignment_state_mark_applied(Main*,RnaPointerAssignmentState*,ReportList*);
void RNA_pointer_assignment_state_free(RnaPointerAssignmentState*)noexcept;
void Object_data_set(PointerRNA*,PointerRNA,ReportList*);
"""

CONTEXT_MODEL = r"""
static int g_main_queries=0,g_scene_queries=0;
static std::vector<std::string>g_provider_events;
static void(*g_provider_hook)(const char*)=nullptr;

"""

NATIVE_MODEL = r"""
namespace blender {}
struct ResetValue{bool present=false;void reset(){present=false;}void clear_and_shrink(){present=false;}};
struct SculptSession{
 ResetValue pbvh,edge_to_face_offsets,edge_to_face_indices,edge_to_face_map;
 ResetValue vert_to_edge_offsets,vert_to_edge_indices,vert_to_edge_map,preview_verts,topology_island_cache;
 struct{ResetValue boundary;}vertex_info;
 struct{ResetValue fake_neighbor_index;}fake_neighbors;
 int clear_calls=0;void clear_active_elements(bool persistent){assert(!persistent);++clear_calls;}
};
struct bArmature{ID id{ID_AR,0};};struct Image{ID id{ID_IM,0};};
static StructRNA RNA_Mesh{"Mesh",true,&RNA_ID},RNA_Image{"Image",true,&RNA_ID};
static StructRNA RNA_Curve{"Curve",true,&RNA_ID},RNA_Armature{"Armature",true,&RNA_ID};
static bContext *g_bpy_context=nullptr;
static bContext *BPY_context_get(){return g_bpy_context;}
static int g_mesh_assigns=0,g_rebuild_flushes=0,g_modifier_tests=0,g_curve_tests=0,g_pose_rebuilds=0;
static int g_lookup_calls=0,g_message_bus_calls=0,g_nonnull_receipt_frees=0;
static bContext *g_expected_update_context=nullptr;
static PointerPropertyRNA *g_lookup_properties[4]{};
static bool g_replace_property=false;
static PointerPropertyRNA g_replacement_property;
static void multires_flush_sculpt_updates(Object *ob){native_effect();assert(ob&&live_id(&ob->id));++g_rebuild_flushes;}
static void BKE_modifiers_test_object(Object *ob){native_effect();assert(live_id(&ob->id));++g_modifier_tests;}
// Native Curve/pose kernels are explicit bounded call models. Their real
// allocations/channels/Nurb storage are not executed or claimed as proof.
static void BKE_curve_type_test(Object *ob,bool complete){
 native_effect();assert(complete&&live_id(&ob->id));++g_curve_tests;
 ob->type=static_cast<Curve*>(ob->data)->ob_type;
}
static void BKE_pose_rebuild(Main*,Object *ob,bArmature *armature,bool sort){
 native_effect();assert(sort&&live_id(&ob->id)&&live_id(&armature->id));++g_pose_rebuilds;
 ob->pose=reinterpret_cast<void*>(uintptr_t(0x1234));
}
static Mesh *BKE_mesh_wrapper_ensure_subdivision(Mesh *mesh){assert(mesh&&live_id(&mesh->id));++g_getters;return mesh;}
static PropertyRNA *RNA_struct_find_property(PointerRNA *ptr,const char *name){
 ++g_lookup_calls;
 int profile=ptr->type==&RNA_MaterialSlot?2:std::string(name)=="data"?3:1;
 return g_replace_property?&g_replacement_property:g_lookup_properties[profile];
}
static PropertyRNA *RNA_struct_type_find_property(StructRNA *type,const char *name){
 PointerRNA ptr;ptr.type=type;return RNA_struct_find_property(&ptr,name);
}
"""


def connected_source(main, *, python=False, historical=False):
    """Assemble actual candidate code; there is no materialization fallback."""
    prefix = material.PREFIX
    prefix = replace_once(prefix, "#define WITH_APPLE_CROSSPLATFORM", "#define WITH_APPLE_CROSSPLATFORM\n#define WITH_PYTHON\n#define FIXTURE_REAL_POINTER_ASSIGNMENT")
    prefix = replace_once(prefix, "#include <vector>", "#include <vector>\n#include <array>\n#include <new>\n#include <utility>")
    prefix = replace_once(prefix, "enum ID_Type { ID_MA=", "enum ID_Type { ID_IM='I'|('M'<<8), ID_AR='A'|('R'<<8), ID_LA='L'|('A'<<8),ID_CA='C'|('A'<<8),ID_LT='L'|('T'<<8),ID_SPK='S'|('P'<<8),ID_LP='L'|('P'<<8),ID_SCR='S'|('R'<<8), ID_MA=")
    prefix = replace_once(prefix, "char name[3]={'O','B',0};", "char name[66]={'O','B',0};")
    prefix = replace_once(prefix, "enum { ID_TAG_EXTERN=1<<2, ID_TAG_NEW=1<<1 };",
                          "enum { ID_TAG_EXTERN=1<<2, ID_TAG_NEW=1<<1,ID_TAG_NO_MAIN=1<<5,ID_TAG_INDIRECT=1<<6,ID_TAG_MISSING=1<<7 };")
    prefix = replace_once(prefix, "  ScrArea *area=nullptr; ARegion *region=nullptr;\n};", r"""
  ScrArea *area=nullptr; ARegion *region=nullptr;
  struct{Main *main=nullptr;Scene *scene=nullptr;}data;
  bContext(Main *m=nullptr,wmWindowManager *manager=nullptr,wmWindow *window=nullptr,
           ScrArea *a=nullptr,ARegion *r=nullptr):main(m),wm(manager),win(window),area(a),region(r){data.main=m;}
};""")
    prefix = replace_once(prefix, "static Main *CTX_data_main(const bContext *C){if(g_context_main_hook){auto hook=g_context_main_hook;g_context_main_hook=nullptr;hook();}return C?C->main:nullptr;}",
                          "static Main *CTX_data_main(const bContext *C);")
    prefix = replace_once(prefix, "static void CTX_data_main_set(bContext *C,Main *x){C->main=x;}",
                          "static void CTX_data_main_set(bContext *C,Main *x){C->main=C->data.main=x;}")
    prefix = replace_once(prefix, "struct ListBase { void *first=nullptr; };", "struct ListBase { void *first=nullptr;bool fixture_single=false; };")
    prefix = replace_once(prefix, "struct Main { ListBase wm; std::vector<ID*> ids; };", "struct Main { ListBase wm,screens,scenes,objects; std::vector<ID*> ids; };")
    prefix = replace_once(prefix, "int us=10,flag=0;ID *newid=nullptr;", "int us=10,flag=0;ID *newid=nullptr;void *next=nullptr;")
    prefix = replace_once(prefix, "struct wmWindow;", "struct wmWindow;struct bScreen;")
    prefix = replace_once(prefix, "  ListBase handlers,modalhandlers;", "  ListBase handlers,modalhandlers;short sizex=1024,sizey=768;bScreen *screen=nullptr;")
    prefix = replace_once(prefix, "struct ScrArea {};", "struct ScrArea {ScrArea *next=nullptr;ListBase regionbase;};\nstruct bScreen {ID id{ID_SCR,0};ListBase areabase,regionbase;};")
    prefix = replace_once(prefix, "struct ARegion {};", "struct ARegion {ARegion *next=nullptr;void *runtime=nullptr;int regiontype=1;};")
    prefix = replace_once(prefix, "struct Scene { ID id{ID_SCE,0}; ListBase view_layers; };", "struct Scene { ID id{ID_SCE,0};Scene *next=nullptr;ListBase view_layers; };")
    prefix = replace_once(prefix, "  struct{Main *main=nullptr;Scene *scene=nullptr;}data;", "  struct{Main *main=nullptr;Scene *scene=nullptr;}data;bScreen *screen=nullptr;")
    prefix = replace_once(prefix, "  int i=0;\n  for(auto *wm", "  if(list->fixture_single)return list->first==target?0:-1;\n  int i=0;\n  for(auto *wm")
    prefix += "\nstatic bScreen *CTX_wm_screen(const bContext *C){return C->screen;}\nstatic bScreen *WM_window_get_active_screen(wmWindow *win){return win->screen;}\n"
    model = material.MODEL
    model = replace_once(model, "#define OB_DATA_SUPPORT_ID(type) ELEM(type,ID_ME,", "#define OB_DATA_SUPPORT_ID(type) ELEM(type,ID_AR,ID_LA,ID_CA,ID_LT,ID_SPK,ID_LP,ID_ME,")
    model = replace_once(model, "#define BLI_assert_msg", "struct SculptSession;\n#define BLI_assert_msg")
    model = replace_once(model, "struct {int flag=USER_MAT_ON_OB;} U;", "enum{OB_ARMATURE=100,OB_LAMP,OB_CAMERA,OB_LATTICE,OB_SPEAKER,OB_LIGHTPROBE,OB_GPENCIL_LEGACY};\nstruct {int flag=USER_MAT_ON_OB;} U;")
    model = replace_once(model, "struct Curve {ID id{ID_CU,0};Material **mat=nullptr;short totcol=0;};",
                         "struct Curve {ID id{ID_CU,0};Material **mat=nullptr;short totcol=0;short ob_type=OB_CURVES_LEGACY;int flag=0;};")
    model = replace_once(model, "  int mode=0;Material **mat=nullptr;char *matbits=nullptr;};",
                         "  int mode=0;Material **mat=nullptr;char *matbits=nullptr;SculptSession *sculpt=nullptr;void *pose=nullptr;};")
    model = replace_once(model, "static PointerRNA RNA_id_pointer_create(ID *id){return {id,id?&RNA_Material:nullptr,id};}",
                         "static PointerRNA RNA_id_pointer_create(ID *id);")
    model = replace_once(model, "static void id_us_min(ID *id){native_effect();assert(live_id(id));--id->us;++g_refcount_minus;}",
                         "static void id_us_min(ID *id){if(!id)return;native_effect();assert(live_id(id));--id->us;++g_refcount_minus;}")
    model = replace_once(model, "static void id_us_plus(ID *id){native_effect();assert(live_id(id));++id->us;++g_refcount_plus;}",
                         "static void id_us_plus(ID *id){if(!id)return;native_effect();assert(live_id(id));++id->us;++g_refcount_plus;if(id->tag&ID_TAG_INDIRECT){id->tag&=~ID_TAG_INDIRECT;id->tag|=ID_TAG_EXTERN;}}")
    model = replace_once(model, "static Scene *CTX_data_scene(const bContext*){return nullptr;}",
                         "static Scene *CTX_data_scene(const bContext*);")
    model = replace_once(model, "static wmMsgBus *CTX_wm_message_bus(const bContext*){return nullptr;}",
                         "static bContext *g_message_bus_context=nullptr;\nstatic wmMsgBus g_message_bus;\nstatic wmMsgBus *CTX_wm_message_bus(const bContext *C){g_message_bus_context=const_cast<bContext*>(C);return &g_message_bus;}")
    if historical:
        model = replace_once(model,
            "static void DEG_id_tag_update(ID *id,int){native_effect();assert(live_id(id));++g_native_tags;g_last_tag=id;}",
            "static int g_historical_stale_tags=0;\nstatic void DEG_id_tag_update(ID *id,int){native_effect();if(!live_id(id))++g_historical_stale_tags;++g_native_tags;g_last_tag=id;}")
    model = replace_once(model,
        "static void BKE_object_materials_sync_length(Main*,Object*,ID*){native_effect();++g_object_syncs;}",
        "static void BKE_object_materials_sync_length(Main*,Object*,ID*);")
    model = replace_once(model,
        "static void BKE_objects_materials_sync_length_all(Main*,ID*){native_effect();++g_data_syncs;}",
        "static void BKE_objects_materials_sync_length_all(Main*,ID*);")
    native_model = NATIVE_MODEL + r"""
// Main's linked object storage and lock operations are explicit host models.
// The pinned all-object loop itself executes below, including user-count cutoff.
static int g_main_lock_depth=0,g_main_locks=0,g_main_unlocks=0;
static void BKE_main_lock(Main *main){assert(main==g_operation_main&&g_main_lock_depth==0);++g_main_lock_depth;++g_main_locks;}
static void BKE_main_unlock(Main *main){assert(main==g_operation_main&&g_main_lock_depth==1);--g_main_lock_depth;++g_main_unlocks;}
static void *MEM_recallocN(void *old,size_t bytes){return MEM_recallocN_id(old,bytes,"native material resize");}
static size_t MEM_allocN_len(const void *allocation){
 if(!allocation)return 0;
 auto found=g_alloc_sizes.find(const_cast<void*>(allocation));assert(found!=g_alloc_sizes.end());
 return found->second;
}

static PointerRNA RNA_id_pointer_create(ID *id){
 StructRNA *type=nullptr;if(id){switch(GS(id->name)){
 case ID_ME:type=&RNA_Mesh;break;case ID_IM:type=&RNA_Image;break;
 case ID_CU:type=&RNA_Curve;break;case ID_AR:type=&RNA_Armature;break;
 default:type=&RNA_Material;break;}}
 return {id,type,id};
}
"""
    providers = r"""
enum{CTX_RESULT_OK=1,CTX_DATA_TYPE_POINTER=1};
struct bContextDataResult{int type=CTX_DATA_TYPE_POINTER;PointerRNA ptr;};
static int ctx_data_get(bContext *C,const char *member,bContextDataResult*){
 if(std::string(member)=="blend_data"){
  ++g_main_queries;if(g_context_main_hook){auto callback=g_context_main_hook;g_context_main_hook=nullptr;callback();}
 }else ++g_scene_queries;
 g_provider_events.emplace_back(member);if(g_provider_hook)g_provider_hook(member);
 (void)C;return 0;
}
"""
    # Exact native getter/verify null-C behavior is retained. Provider lookup,
    # Python dispatch and recursion are modeled only at ctx_data_get.
    # Tracked exact bodies keep clean CI independent of incidental local caches.
    providers += "\n".join(function(NATIVE, signature) for signature in NATIVE_CONTEXT_SIGNATURES)
    state_start = OBJECT.rfind("#ifdef WITH_APPLE_CROSSPLATFORM", 0, OBJECT.index("struct RnaMaterialIDIdentity"))
    state = OBJECT[state_start:OBJECT.index("static void rna_Object_active_material_set(")]
    setters = "\n".join(function(OBJECT, "static void " + name + "(") for name in (
        "rna_Object_data_set", "rna_Object_active_material_set", "rna_MaterialSlot_material_set"))
    getters = "\n".join(function(OBJECT, "static PointerRNA " + name + "(") for name in (
        "rna_Object_data_get", "rna_Object_active_material_get", "rna_MaterialSlot_material_get"))
    access_start = ACCESS.index("/* IPAD_POINTER_ASSIGNMENT_TRANSACTION_BEGIN */")
    access_end = ACCESS.index("/* IPAD_POINTER_ASSIGNMENT_TRANSACTION_END */", access_start)
    transaction = ACCESS[access_start:access_end]
    transaction = replace_once(transaction,
        "void RNA_property_pointer_assignment_receipt_free(",
        "void fixture_actual_pointer_assignment_receipt_free(")
    free_boundary = r"""
void RNA_property_pointer_assignment_receipt_free(RNAPointerAssignmentReceipt *receipt)noexcept{
 if(receipt)++g_nonnull_receipt_frees;
 fixture_actual_pointer_assignment_receipt_free(receipt);
}
"""
    old_access_start = ACCESS.rfind("#ifdef WITH_APPLE_CROSSPLATFORM", 0, ACCESS.index("static int rna_material_assignment_profile"))
    access_helpers = ACCESS[old_access_start:access_start]
    updates = "\n".join(function(OBJECT, signature) for signature in (
        "static void rna_Object_internal_update(", "void rna_Object_internal_update_data_impl(",
        "void rna_Object_internal_update_data_dependency(", "void rna_Object_data_update(",
        "static void rna_MaterialSlot_update(", "static void rna_Object_active_material_update(",
        "static void rna_MaterialSlot_material_update("))
    updates += "\n" + "\n".join(function(ACCESS, signature) for signature in (
        "static void rna_property_update(", "bool RNA_property_update_check(",
        "void RNA_property_update(", "void RNA_property_update_main("))
    adapters = material.GENERATED_ADAPTERS + r"""
static PointerRNA Object_data_get(PointerRNA *ptr){return rna_Object_data_get(ptr);}
void Object_data_set(PointerRNA *ptr,PointerRNA value,ReportList *reports){rna_Object_data_set(ptr,value,reports);}
"""
    material_sync = "\n".join(function(NATIVE, signature) for signature in NATIVE_MATERIAL_SIGNATURES)
    for name in ("BKE_object_materials_sync_length", "BKE_objects_materials_sync_length_all"):
        material_sync = replace_once(material_sync, "void " + name + "(", "static void fixture_native_" + name + "(")
    material_sync += r"""
static void BKE_object_materials_sync_length(Main *main,Object *object,ID *id){
 native_effect();++g_object_syncs;fixture_native_BKE_object_materials_sync_length(main,object,id);
}
static void BKE_objects_materials_sync_length_all(Main *main,ID *id){
 native_effect();++g_data_syncs;fixture_native_BKE_objects_materials_sync_length_all(main,id);
}
"""
    native_bodies = material_sync + "\n" + "\n".join(function(NATIVE, signature) for signature in reversed(NATIVE_SIGNATURES))
    native_bodies = replace_once(native_bodies, "void BKE_mesh_assign_object(", "static void fixture_BKE_mesh_assign_object(")
    native_bodies += "\nstatic void BKE_mesh_assign_object(Main *main,Object *object,Mesh *mesh){++g_mesh_assigns;fixture_BKE_mesh_assign_object(main,object,mesh);}"
    support = material.SUPPORT[:material.SUPPORT.index("static Fixture *g_fixture")]
    return "\n".join((prefix, model, PUBLIC_API, native_model, CONTEXT_MODEL, providers,
        material.WM_NEXT, "#define BKE_object_material_get fixture_native_material_get\n"
        "#define BKE_object_material_assign fixture_native_material_assign", material.MATERIAL_BODIES,
        material.NATIVE_ADAPTERS, native_bodies, state, material.SLOT_INDEX, getters, setters,
        adapters, access_helpers, transaction, function(ACCESS, "void RNA_property_pointer_set("),
        updates, free_boundary, support, TRANSACTION_SUPPORT,
        CONNECTED_PYTHON_MODEL + python_frame() if python else "",
        function(BASELINE,"void RNA_property_update(").replace("void RNA_property_update(","static void historical_RNA_property_update(",1) if historical else "", main))


TRANSACTION_SUPPORT = r"""
struct TransactionFixture:Fixture{
 int profile=3;bScreen screen;ScrArea area;ARegion region;Scene scene;
 Curve old_curve,new_curve;Image old_image,new_image;bArmature old_armature,new_armature;
 SculptSession sculpt;RNAPointerAssignmentReceipt *receipt=nullptr;
 TransactionFixture(int selected=3):Fixture(selected==2),profile(selected){
  // Enumerate every modeled live Object through the same linked-list shape
  // used by the pinned synchronization loop; membership receipts use main.ids.
  main.objects.first=&object;object.id.next=&other_object;other_object.id.next=nullptr;
  g_main_lock_depth=g_main_locks=g_main_unlocks=0;
  screen.id.session_uid=600;scene.id.session_uid=601;
  main.screens.first=&screen;main.screens.fixture_single=true;main.scenes.first=&scene;
  screen.areabase.first=&area;screen.areabase.fixture_single=true;
  screen.regionbase.fixture_single=true;area.regionbase.first=&region;area.regionbase.fixture_single=true;
  region.runtime=&region;C.screen=win.screen=&screen;C.area=&area;C.region=&region;C.data.scene=&scene;
  main.ids.push_back(&screen.id);main.ids.push_back(&scene.id);
  g_replace_property=false;for(auto &entry:g_lookup_properties)entry=nullptr;g_lookup_properties[profile]=&property;g_bpy_context=&C;
  if(profile==3){
   ptr={&object.id,&RNA_Object,&object};value={&other_mesh.id,&RNA_Mesh,&other_mesh};
   property.identifier="data";property.type=&RNA_Mesh;property.get=Object_data_get;property.set=Object_data_set;
   property.update=rna_Object_data_update;property.noteflag=0;
   other_mesh.totcol=2;other_mesh.mat=MEM_calloc_arrayN<Material*>(2,"incoming mesh");
   other_mesh.mat[0]=other_mesh.mat[1]=&old_material;
  }else property.update=profile==1?rna_Object_active_material_update:rna_MaterialSlot_material_update;
  g_provider_hook=nullptr;g_provider_events.clear();g_main_queries=g_scene_queries=0;
  g_mesh_assigns=g_rebuild_flushes=g_modifier_tests=g_curve_tests=g_pose_rebuilds=0;
  g_nonnull_receipt_frees=0;reset_counters();
 }
 ~TransactionFixture(){RNA_property_pointer_assignment_receipt_free(receipt);}
 eRNAPointerAssignmentResult begin(){return RNA_property_pointer_assignment_begin_owned(&C,&ptr,&property,&value,&reports,&receipt);}
 bool finish(){return RNA_property_pointer_assignment_finish_owned(&C,receipt,&reports);}
 void clear_update_counters(){g_native_tags=g_relations=g_notifiers=g_publishes=0;
  g_main_queries=g_scene_queries=0;g_provider_events.clear();g_message_bus_context=nullptr;}
 void empty_material_storage(){
  // Construct an actual empty allocation state, not a count-only truncation
  // with populated physical cells that no zero-length receipt can observe.
  MEM_freeN(object.mat);MEM_freeN(object.matbits);MEM_freeN(mesh.mat);
  object.mat=nullptr;object.matbits=nullptr;mesh.mat=nullptr;
  object.actcol=object.totcol=mesh.totcol=0;
 }
 void erase(ID *id){main.ids.erase(std::remove(main.ids.begin(),main.ids.end(),id),main.ids.end());}
};
"""


CONNECTED_PYTHON_MODEL = r"""
struct PyObject{};struct BPy_StructRNA{std::optional<PointerRNA>ptr;};
static PyObject exception;static PyObject *PyExc_RuntimeError=&exception;
static int g_python_errors=0,g_python_decrefs=0;
static std::optional<PointerRNA>g_python_target;static BPy_StructRNA g_python_param;
static void BKE_reports_init(ReportList *reports,int){*reports={};}
static int BPy_reports_to_error(ReportList *reports,PyObject*,bool){if(reports->errors){++g_python_errors;return -1;}return 0;}
static void Py_XDECREF(PyObject *value){if(value)++g_python_decrefs;}
static void PyErr_SetString(PyObject*,const char*){++g_python_errors;}
static void invalidate_python_storage(){g_python_target.reset();g_python_param.ptr.reset();}
"""

FAULT_SUPPORT = r"""
static TransactionFixture *g_transaction=nullptr;static int g_fault=0;
static std::string g_fault_stage;
static void apply_fault(){
 TransactionFixture &f=*g_transaction;
 switch(g_fault){
 case 1:++f.object.id.session_uid;break;
 case 2:f.erase(&f.object.id);break;
 case 3:++f.other_mesh.id.session_uid;break;
 case 4:f.object.data=&f.mesh;break;
 case 5:g_replace_property=true;break;
 case 6:f.region.runtime=nullptr;break;
 case 7:++f.screen.id.session_uid;break;
 case 8:f.add_owner();break;
 case 9:++f.library.id.session_uid;break;
 default:assert(false);
 }
}
static void provider_fault(const char *member){
 if(g_fault_stage==member){g_provider_hook=nullptr;apply_fault();}
}
static void cancel_fault(){apply_fault();}
"""


class PointerAssignmentTransactionTests(unittest.TestCase):

    def test_actual_three_profile_transaction_drains_all_windows_and_preserves_native_update_context(self):
        cpp_run(connected_source(r"""
int main(){for(int profile:{1,2,3}){
 TransactionFixture f(profile);f.add_owner(true);
 assert(f.begin()==eRNAPointerAssignmentResult::AppliedOwned&&f.receipt);
 assert(g_cancel_calls==2&&!has_owner(&f.main));
 assert(profile==3?g_mesh_assigns==1:g_native_assigns==1);
 f.clear_update_counters();assert(f.finish());
 assert(g_main_queries==1&&g_scene_queries==1&&g_provider_events.size()==2);
 assert(g_provider_events[0]=="blend_data"&&g_provider_events[1]=="scene");
 assert(g_native_tags>0&&g_relations>0&&g_notifiers>0&&g_publishes==1);
 assert(g_message_bus_context==&f.C);
 assert(!f.finish());
}}
"""))

    def test_same_mesh_is_one_real_rebuild_and_balanced_users_after_unrelated_owner_retirement(self):
        cpp_run(connected_source(r"""
int main(){TransactionFixture f;f.value={&f.mesh.id,&RNA_Mesh,&f.mesh};
 f.object.sculpt=&f.sculpt;f.sculpt.pbvh.present=true;f.sculpt.edge_to_face_map.present=true;
 f.sculpt.vertex_info.boundary.present=true;int users=f.mesh.id.us;
 f.add_owner();assert(f.begin()==eRNAPointerAssignmentResult::AppliedOwned);
 assert(g_cancel_calls==1&&g_mesh_assigns==1&&g_rebuild_flushes==1&&g_modifier_tests==1);
 assert(!f.sculpt.pbvh.present&&!f.sculpt.edge_to_face_map.present&&!f.sculpt.vertex_info.boundary.present);
 assert(f.sculpt.clear_calls==1&&f.object.data==&f.mesh&&f.mesh.id.us==users);
 assert(g_refcount_minus==1&&g_refcount_plus==1);assert(f.finish());}
"""))

    def test_edit_and_null_silent_native_returns_still_have_one_owned_late_update(self):
        cpp_run(connected_source(r"""
int main(){for(bool edit:{false,true}){
 TransactionFixture f;if(edit)f.object.mode=OB_MODE_EDIT;else f.value=PointerRNA_NULL;
 f.add_owner();assert(f.begin()==eRNAPointerAssignmentResult::AppliedOwned);
 assert(g_cancel_calls==1&&g_mesh_assigns==0&&f.object.data==&f.mesh);
 f.clear_update_counters();assert(f.finish());assert(g_native_tags>0&&g_relations>0&&g_publishes==1);
}}
"""))

    def test_empty_curve_and_armature_native_branches_have_bounded_poststate_and_refcounts(self):
        cpp_run(connected_source(r"""
int main(){
 for(int empty_case=0;empty_case<3;++empty_case){
  TransactionFixture f;f.old_image.id.session_uid=700;f.new_image.id.session_uid=701;
  f.main.ids.push_back(&f.old_image.id);f.main.ids.push_back(&f.new_image.id);
  f.object.type=OB_EMPTY;f.object.totcol=0;f.object.data=&f.old_image;f.property.type=&RNA_Image;
  f.value=empty_case==0?PointerRNA_NULL:PointerRNA{empty_case==1?&f.new_image.id:&f.old_image.id,&RNA_Image,empty_case==1?static_cast<void*>(&f.new_image):&f.old_image};
  int old_users=f.old_image.id.us,new_users=f.new_image.id.us;
  assert(f.begin()==eRNAPointerAssignmentResult::AppliedOwned&&g_refcount_minus==1);
  assert(f.object.data==(empty_case==0?nullptr:empty_case==1?static_cast<void*>(&f.new_image):&f.old_image));
  assert(f.old_image.id.us==old_users-(empty_case==2?0:1));
  assert(f.new_image.id.us==new_users+(empty_case==1?1:0));assert(f.finish());
 }
 {
  TransactionFixture f;f.old_curve.id.session_uid=710;f.new_curve.id.session_uid=711;
  f.old_curve.totcol=f.new_curve.totcol=2;
  f.old_curve.mat=MEM_calloc_arrayN<Material*>(2,"old curve");f.new_curve.mat=MEM_calloc_arrayN<Material*>(2,"new curve");
  f.new_curve.ob_type=OB_SURF;f.main.ids.push_back(&f.old_curve.id);f.main.ids.push_back(&f.new_curve.id);
  f.object.type=OB_CURVES_LEGACY;f.object.data=&f.old_curve;f.property.type=&RNA_Curve;
  f.value={&f.new_curve.id,&RNA_Curve,&f.new_curve};
  assert(f.begin()==eRNAPointerAssignmentResult::AppliedOwned&&g_curve_tests==1&&f.object.type==OB_SURF);
  assert(f.object.data==&f.new_curve&&g_refcount_minus==1&&g_refcount_plus==1);assert(f.finish());
 }
 {
  TransactionFixture f;f.old_armature.id.session_uid=720;f.new_armature.id.session_uid=721;
  f.main.ids.push_back(&f.old_armature.id);f.main.ids.push_back(&f.new_armature.id);
  f.object.type=OB_ARMATURE;f.object.data=&f.old_armature;f.property.type=&RNA_Armature;
  f.value={&f.new_armature.id,&RNA_Armature,&f.new_armature};
  assert(f.begin()==eRNAPointerAssignmentResult::AppliedOwned&&g_pose_rebuilds==1&&f.object.pose);
  assert(f.object.data==&f.new_armature);assert(f.finish());
 }
}
"""))

    def test_receipts_refuse_identity_metadata_and_context_changes_after_each_provider(self):
        main = FAULT_SUPPORT + r"""
int main(){for(const char *stage:{"blend_data","scene"})for(int fault:{1,2,3,4,5,6,7}){
 TransactionFixture f;assert(f.begin()==eRNAPointerAssignmentResult::AppliedOwned);
 f.clear_update_counters();g_transaction=&f;g_fault=fault;g_fault_stage=stage;g_provider_hook=provider_fault;
 assert(!f.finish());assert(g_main_queries==1&&g_scene_queries==(std::string(stage)=="scene"?1:0));
 assert(g_native_tags==0&&g_relations==0&&g_notifiers==0&&g_publishes==0);
}}
"""
        cpp_run(connected_source(main))

    def test_first_owned_main_provider_cannot_replace_inputs_before_any_cancel_or_apply(self):
        main = FAULT_SUPPORT + r"""
int main(){for(int fault:{1,2,3,5,6,7}){
 TransactionFixture f;f.add_owner();g_transaction=&f;g_fault=fault;
 g_fault_stage="blend_data";g_provider_hook=provider_fault;
 assert(f.begin()==eRNAPointerAssignmentResult::Refused&&f.receipt==nullptr);
 assert(g_main_queries==1&&g_scene_queries==0&&g_cancel_calls==0&&g_mesh_assigns==0);
}}
"""
        cpp_run(connected_source(main))

    def test_new_owner_at_each_finish_provider_refuses_before_later_provider_or_tags(self):
        main = FAULT_SUPPORT + r"""
int main(){for(const char *stage:{"blend_data","scene"}){
 TransactionFixture f;assert(f.begin()==eRNAPointerAssignmentResult::AppliedOwned);
 f.clear_update_counters();g_transaction=&f;g_fault=8;g_fault_stage=stage;g_provider_hook=provider_fault;
 assert(!f.finish()&&has_owner(&f.main)&&g_cancel_calls==0);
 assert(g_main_queries==1&&g_scene_queries==(std::string(stage)=="scene"?1:0));
 assert(g_native_tags==0&&g_relations==0&&g_notifiers==0&&g_publishes==0);
}}
"""
        cpp_run(connected_source(main))

    def test_actual_borrowed_routes_refuse_before_poisoned_owner_reads_queries_or_writes(self):
        cpp_run(connected_source(r"""
int main(){for(int profile:{1,2,3})for(int route=0;route<5;++route){
 TransactionFixture f(profile);f.add_owner();PointerRNA poisoned=f.ptr;
 poisoned.owner_id=reinterpret_cast<ID*>(uintptr_t(1));poisoned.data=reinterpret_cast<void*>(uintptr_t(1));
 if(route==0)f.property.set(&poisoned,f.value,&f.reports);
 if(route==1)RNA_property_pointer_set(&poisoned,&f.property,f.value,&f.reports);
 if(route==2)RNA_property_update(&f.C,&poisoned,&f.property);
 if(route==3)RNA_property_update_main(&f.main,&f.scene,&poisoned,&f.property);
 if(route==4)f.property.update(&f.main,&f.scene,&poisoned);
 assert(g_cancel_calls==0&&g_main_queries==0&&g_scene_queries==0&&g_getters==0&&g_refcount_reads==0);
 assert(g_mesh_assigns==0&&g_native_assigns==0);assert_no_native();
}}
"""))

    def test_actual_borrowed_update_receipt_catches_initially_absent_provider_removal(self):
        main = FAULT_SUPPORT + r"""
int main(){for(int profile:{1,2,3}){
 TransactionFixture f(profile);g_transaction=&f;g_fault=2;
 g_fault_stage="blend_data";g_provider_hook=provider_fault;
 RNA_property_update(&f.C,&f.ptr,&f.property);
 assert(g_main_queries==1&&g_scene_queries==0&&g_cancel_calls==0);
 assert(g_native_tags==0&&g_relations==0&&g_notifiers==0&&g_publishes==0);
}}
"""
        cpp_run(connected_source(main))

    def test_debug_getter_cannot_steal_unarmed_native_set_lease(self):
        main = r"""
static PointerRNA g_nested_value;static int g_nested_calls=0,g_nested_reports=0;
static PointerRNA adversarial_get(PointerRNA *ptr){
 ++g_nested_calls;ReportList reports;Object_data_set(ptr,g_nested_value,&reports);
 g_nested_reports+=reports.errors;return rna_Object_data_get(ptr);
}
int main(){TransactionFixture f;f.property.get=adversarial_get;g_nested_value=f.value;
 assert(f.begin()==eRNAPointerAssignmentResult::AppliedOwned);
 assert(g_mesh_assigns==1&&g_nested_calls>=1&&g_nested_reports==g_nested_calls);assert(f.finish());}
"""
        cpp_run(connected_source(main))

    def test_actual_python_connected_owner_cancel_invalidates_wrappers_without_late_old_reads(self):
        main = r"""
int main(){for(int profile:{1,2,3}){
 TransactionFixture f(profile);f.add_owner();g_python_target=f.ptr;g_python_param.ptr=f.value;
 if(profile==2)g_python_target->ancestors.push_back({&RNA_Object,&f.object});
 g_cancel_hook=invalidate_python_storage;
 int result=fixture_python_assignment(&*g_python_target,&f.property,&g_python_param,nullptr);
 assert(result==0&&!g_python_target&&!g_python_param.ptr&&g_cancel_calls==1);
 assert(g_publishes==1&&g_message_bus_context==&f.C&&g_nonnull_receipt_frees==1);
 assert(g_python_errors==0&&g_python_decrefs==0);
}}
"""
        cpp_run(connected_source(main, python=True))

    def test_receipt_free_reads_no_context_or_removed_ids_and_does_not_undo_apply(self):
        cpp_run(connected_source(r"""
static void no_provider(const char*){assert(false);}
int main(){TransactionFixture f;assert(f.begin()==eRNAPointerAssignmentResult::AppliedOwned);
 void *applied=f.object.data;f.main.ids.clear();G_MAIN=nullptr;g_provider_hook=no_provider;
 f.C.wm=nullptr;f.C.win=nullptr;f.C.screen=nullptr;
 RNA_property_pointer_assignment_receipt_free(f.receipt);f.receipt=nullptr;
 assert(g_nonnull_receipt_frees==1&&f.object.data==applied&&g_mesh_assigns==1);}
"""))


    def test_release_production_keeps_fixture_assertions_and_actual_three_profile_effects(self):
        cpp_run(connected_source(r"""
int main(){for(int profile:{1,2,3}){
 TransactionFixture f(profile);f.add_owner();assert(f.begin()==eRNAPointerAssignmentResult::AppliedOwned);
 assert(g_cancel_calls==1&&g_getters==0&&g_refcount_reads==0);
 assert(profile==3?g_mesh_assigns==1:g_native_assigns==1);assert(f.finish());
 assert(g_message_bus_context==&f.C&&g_publishes==1);
}}
"""), debug=False)

    def test_nonapple_and_unsupported_noowner_inputs_remain_native_baseline(self):
        main = r"""
int main(){TransactionFixture f;f.ptr.owner_id=nullptr;
 assert(f.begin()==eRNAPointerAssignmentResult::NativeBaseline&&f.receipt==nullptr);
 f.ptr.owner_id=&f.object.id;RNA_property_pointer_set(&f.ptr,&f.property,f.value,&f.reports);
 RNA_property_update(&f.C,&f.ptr,&f.property);
 assert(g_mesh_assigns==1&&g_publishes==1&&g_cancel_calls==0);}
"""
        cpp_run(connected_source(main))
        cpp_run(connected_source(r"""
int main(){TransactionFixture f;
 assert(f.begin()==eRNAPointerAssignmentResult::Unrelated&&f.receipt==nullptr);
 RNA_property_pointer_set(&f.ptr,&f.property,f.value,&f.reports);
 RNA_property_update(&f.C,&f.ptr,&f.property);
 assert(g_mesh_assigns==1&&g_publishes==1&&g_cancel_calls==0);}
"""), apple=False)

    def test_actual_native_tag_mismatch_reports_before_python_late_update(self):
        cpp_run(connected_source(r"""
int main(){TransactionFixture f;f.other_mesh.id.tag|=ID_TAG_NO_MAIN;
 g_python_target=f.ptr;g_python_param.ptr=f.value;
 int result=fixture_python_assignment(&*g_python_target,&f.property,&g_python_param,nullptr);
 assert(result==-1&&g_python_errors>0&&g_mesh_assigns==0&&g_publishes==0);
 assert(f.object.data==&f.mesh&&g_cancel_calls==0);}
""", python=True))

    def test_nested_owned_and_borrowed_writes_during_cancel_cannot_mutate_or_steal_scope(self):
        main = FAULT_SUPPORT + r"""
static int nested_calls=0;
static void nested_assignment(){
 ++nested_calls;TransactionFixture &f=*g_transaction;
 RNAPointerAssignmentReceipt *receipt=nullptr;ReportList reports;
 assert(RNA_property_pointer_assignment_begin_owned(&f.C,&f.ptr,&f.property,&f.value,&reports,&receipt)==eRNAPointerAssignmentResult::Refused);
 assert(!receipt&&reports.errors>0);
 f.property.set(&f.ptr,f.value,&reports);RNA_property_pointer_set(&f.ptr,&f.property,f.value,&reports);
 RNA_property_update(&f.C,&f.ptr,&f.property);
 assert(g_mesh_assigns==0&&g_native_assigns==0&&g_native_tags==0&&g_publishes==0);
}
int main(){TransactionFixture f;f.add_owner();g_transaction=&f;g_cancel_hook=nested_assignment;
 assert(f.begin()==eRNAPointerAssignmentResult::AppliedOwned&&nested_calls==1&&g_mesh_assigns==1);
 assert(f.finish());
 TransactionFixture next;assert(next.begin()==eRNAPointerAssignmentResult::AppliedOwned&&next.finish());}
"""
        cpp_run(connected_source(main))

    def test_exact_historical_wrapper_reproduces_provider_retirement_stale_tag_boundary(self):
        self.assertEqual(hashlib.sha256(function(BASELINE,"void RNA_property_update(").encode()).hexdigest(), BASELINE_HASH)
        main = r"""
static TransactionFixture *baseline_fixture=nullptr;
static void retire_remove(const char *member){if(std::string(member)=="blend_data"){
 baseline_fixture->win.modalhandlers.first=nullptr;baseline_fixture->erase(&baseline_fixture->object.id);
 g_provider_hook=nullptr;
}}
int main(){for(int profile:{1,2,3}){
 {TransactionFixture f(profile);f.add_owner();baseline_fixture=&f;g_provider_hook=retire_remove;
  RNA_property_update(&f.C,&f.ptr,&f.property);
  assert(g_main_queries==0&&g_scene_queries==0&&g_historical_stale_tags==0&&g_publishes==0);}
 {TransactionFixture f(profile);f.add_owner();baseline_fixture=&f;g_provider_hook=retire_remove;
  historical_RNA_property_update(&f.C,&f.ptr,&f.property);
  assert(g_main_queries==1&&g_scene_queries==1&&g_historical_stale_tags>0&&g_publishes==1);
  g_historical_stale_tags=0;}
}}
"""
        cpp_run(connected_source(main,historical=True))


    def test_actual_bpy_context_only_change_during_cancel_refuses_before_native_assignment(self):
        cpp_run(connected_source(r"""
static void lose_python_context(){g_bpy_context=nullptr;}
int main(){for(int profile:{1,2,3}){
 TransactionFixture f(profile);f.add_owner();g_cancel_hook=lose_python_context;
 g_python_target=f.ptr;g_python_param.ptr=f.value;
 assert(fixture_python_assignment(&*g_python_target,&f.property,&g_python_param,nullptr)==-1);
 assert(g_cancel_calls==1&&g_bpy_context==nullptr&&g_python_errors>0);
 assert(g_mesh_assigns==0&&g_native_assigns==0&&g_native_tags==0&&g_publishes==0);
 assert(g_refcount_plus==0&&g_refcount_minus==0&&g_nonnull_receipt_frees==1);
 assert(g_main_queries==1&&g_scene_queries==0);
}}
""",python=True))

    def test_actual_completed_cancel_revalidates_original_ids_and_material_arrays(self):
        cpp_run(connected_source(r"""
static TransactionFixture *cancel_fixture=nullptr;static int cancellation_fault=0;
static void cancellation_identity_fault(){
 TransactionFixture &f=*cancel_fixture;
 switch(cancellation_fault){
 case 0:f.erase(&f.object.id);break;
 case 1:++static_cast<ID*>(f.value.data)->session_uid;break;
 case 2:f.erase(&f.mesh.id);break;
 case 3:++f.library.id.session_uid;break;
 case 4:f.override.reference=&f.other_material.id;break;
 case 5:f.object.matbits[0]^=1;break;
 case 6:f.object.actcol=2;break;
 case 7:g_replace_property=true;break;
 default:assert(false);
 }
}
int main(){for(int profile:{1,2,3})for(cancellation_fault=0;cancellation_fault<8;++cancellation_fault){
 TransactionFixture f(profile);f.object.id.lib=&f.library;f.object.id.override_library=&f.override;
 f.add_owner();cancel_fixture=&f;g_cancel_hook=cancellation_identity_fault;
 assert(f.begin()==eRNAPointerAssignmentResult::Refused&&f.receipt==nullptr);
 assert(g_cancel_calls==1&&g_mesh_assigns==0&&g_native_assigns==0);
 assert(g_refcount_plus==0&&g_refcount_minus==0&&g_publishes==0&&g_native_tags==0);
}}
"""))

    def test_actual_material_owned_poststates_keep_native_nullable_link_growth_and_same_value(self):
        cpp_run(connected_source(r"""
int main(){for(int profile:{1,2})for(int scenario=0;scenario<5;++scenario){
 TransactionFixture f(profile);
 if(scenario==0)f.value=PointerRNA_NULL;
 if(scenario==1){f.value={&f.old_material.id,&RNA_Material,&f.old_material};}
 if(scenario==2){f.object.matbits[profile==1?0:1]=1;}
 if(scenario==3){f.object.mode=OB_MODE_EDIT;}
 if(scenario==4&&profile==1)f.empty_material_storage();
 f.add_owner();assert(f.begin()==eRNAPointerAssignmentResult::AppliedOwned);
 assert(g_cancel_calls==1&&g_native_assigns==1&&f.reports.errors==0);
 assert(f.finish()&&g_publishes==1);
 const int slot=profile==1?0:1;
 Material *expected=scenario==0?nullptr:scenario==1?&f.old_material:&f.new_material;
 Material *actual=f.object.matbits[slot]?f.object.mat[slot]:f.mesh.mat[slot];
 assert(actual==expected);
 if(scenario==4&&profile==1)assert(f.object.totcol==1&&f.mesh.totcol==1);
}}
"""))

    def test_debug_and_release_native_getter_preserve_physical_material_suffix(self):
        source = connected_source(r"""
int main(){TransactionFixture f(1);
 f.object.totcol=2;f.object.actcol=2;f.mesh.totcol=1;
 f.object.matbits[1]=1;f.object.mat[1]=&f.old_material;
 const int old_users=f.old_material.id.us,new_users=f.new_material.id.us;
 Material **old_array=f.object.mat;char *old_bits=f.object.matbits;
 assert(g_alloc_sizes.at(old_array)==2*sizeof(Material*)&&g_alloc_sizes.at(old_bits)==2);
 f.add_owner();assert(f.begin()==eRNAPointerAssignmentResult::AppliedOwned&&f.receipt);
 assert(g_cancel_calls==1&&g_native_assigns==1&&g_object_syncs==1&&g_data_syncs==0);
 assert(f.object.totcol==2&&f.object.actcol==2&&f.mesh.totcol==2);
 assert(f.object.matbits[1]==1&&f.object.mat[1]==&f.new_material);
 assert(f.mesh.mat[0]==&f.old_material&&f.mesh.mat[1]==nullptr);
 assert(f.old_material.id.us==old_users-1&&f.new_material.id.us==new_users+1);
 assert(g_refcount_minus==1&&g_refcount_plus==1&&f.reports.errors==0);
#ifndef NDEBUG
 assert(g_getters==2&&g_allocations==3);
#else
 assert(g_getters==0&&g_allocations==1);
#endif
 assert(f.finish()&&g_publishes==1&&f.reports.errors==0);
}
""")
        cpp_run(source)
        cpp_run(source, debug=False)

    def test_debug_and_release_native_assignment_preserve_hidden_allocated_prefix(self):
        source = connected_source(r"""
int main(){for(int scenario:{0,1}){
 TransactionFixture f(1);
 if(scenario==0){
  f.object.totcol=2;f.object.actcol=2;f.mesh.totcol=1;
  f.object.matbits[1]=1;f.object.mat[1]=&f.old_material;
  // The real getter shrinks the logical count before receipt capture, while
  // native allocation still holds the selected object-linked second slot.
  assert(Object_active_material_get(&f.ptr).data==&f.old_material);
  assert(f.object.totcol==1&&MEM_allocN_len(f.object.mat)==2*sizeof(Material*));
 }else{
  // Keep previously allocated cells to exercise a separate, count-only
  // truncation state. Native assignment reuses the first physical Object cell.
  f.object.actcol=0;f.object.totcol=0;f.mesh.totcol=0;
 }
 const int old_users=f.old_material.id.us,new_users=f.new_material.id.us;
 f.add_owner();assert(f.begin()==eRNAPointerAssignmentResult::AppliedOwned&&f.receipt);
 assert(g_cancel_calls==1&&g_native_assigns==1&&f.reports.errors==0);
 assert(g_refcount_plus==1&&f.new_material.id.us==new_users+1);
 if(scenario==0){
  assert(g_object_syncs==1&&g_data_syncs==0&&g_allocations==3);
  assert(f.object.totcol==2&&f.object.actcol==2&&f.mesh.totcol==2);
  assert(f.object.matbits[1]==1&&f.object.mat[1]==&f.new_material);
  assert(f.mesh.mat[0]==&f.old_material&&f.mesh.mat[1]==nullptr);
  assert(g_refcount_minus==1&&f.old_material.id.us==old_users-1);
#ifndef NDEBUG
  assert(g_getters==3);
#else
  assert(g_getters==1);
#endif
 }else{
  assert(g_object_syncs==0&&g_data_syncs==1);
  assert(f.object.totcol==1&&f.object.actcol==1&&f.mesh.totcol==1);
  assert(f.object.matbits[0]==0&&f.object.mat[0]==&f.other_material);
  assert(f.mesh.mat[0]==&f.new_material);
  assert(g_refcount_minus==0&&f.old_material.id.us==old_users);
 }
 assert(f.finish()&&g_publishes==1&&f.reports.errors==0);
}}
""")
        cpp_run(source)
        cpp_run(source, debug=False)

    def test_native_material_sync_updates_shared_objects_and_sanitizes_active_indices(self):
        cpp_run(connected_source(r"""
int main(){TransactionFixture f(1);
 f.empty_material_storage();
 f.other_object.actcol=0;assert(f.other_object.totcol==0);
 f.add_owner();assert(f.begin()==eRNAPointerAssignmentResult::AppliedOwned);
 assert(g_native_assigns==1&&g_data_syncs==1&&g_object_syncs==0);
 assert(f.object.totcol==1&&f.object.actcol==1&&f.mesh.totcol==1);
 assert(f.other_object.totcol==1&&f.other_object.actcol==1);
 assert(f.other_object.mat&&f.other_object.matbits&&f.other_object.mat[0]==nullptr&&f.other_object.matbits[0]==0);
 assert(g_main_locks==1&&g_main_unlocks==1&&g_main_lock_depth==0);
 assert(f.finish()&&g_publishes==1);
}
"""))

    def test_exact_native_selected_ui_void_set_and_unconditional_update_are_borrowed(self):
        ui = changed_source('source/blender/editors/interface/interface_handlers.cc')
        body = function(ui, 'static void ui_selectcontext_apply(')
        start = body.index('        const PointerRNA &other_value = std::get<PointerRNA>(delta);')
        end = body.index('\n      }',start)
        branch = body[start:end]
        tail = body[body.index('      RNA_property_update(C, &lptr, prop);',end):].split('\n',1)[0]
        frame = ('static void fixture_selected_ui(bContext *C,PointerRNA lptr,PropertyRNA *prop,PointerRNA value){\n'
                 'PropertyRNA *lprop=prop;std::variant<PointerRNA>delta{value};\n'+branch+'\n'+tail+'\n}\n')
        main = frame+r"""
int main(){for(int profile:{1,2,3}){
 TransactionFixture f(profile);f.add_owner();
 fixture_selected_ui(&f.C,f.ptr,&f.property,f.value);
 assert(g_cancel_calls==0&&g_getters==0&&g_refcount_reads==0);
 assert(g_main_queries==0&&g_scene_queries==0&&g_mesh_assigns==0&&g_native_assigns==0);
 assert(g_publishes==0&&g_native_tags==0&&has_owner(&f.main));
}}
"""
        source=connected_source(main)
        source=replace_once(source,'#include <array>','#include <array>\n#include <variant>')
        cpp_run(source)
        cpp_run(source,debug=False)

    def test_actual_python_direct_assignment_callers_tail_return_conversion(self):
        for signature in ("static int pyrna_struct_setattro(","static int pyrna_prop_collection_setattro("):
            caller = function(PYTHON,signature)
            self.assertIn("return pyrna_py_to_prop(", caller)
            position = caller.index("return pyrna_py_to_prop(")
            semicolon = caller.index(";",position)
            # The selected branch directly returns conversion; remaining braces
            # or different-branch native fallbacks are not post-call ID reads.
            self.assertNotIn("pyrna_py_to_prop(",caller[semicolon+1:])

    def test_actual_python_owned_tail_uses_copied_storage_and_context_free_raii(self):
        main = r"""
int main(){
 bContext C;PropertyRNA property;
 for(bool null_value:{false,true}){
  reset_python(&C);g_invalidate=true;
  int result=fixture_python_assignment(&*g_original_target,&property,null_value?nullptr:&g_param,nullptr);
  assert(result==0&&g_begin_calls==1&&g_set_calls==1&&g_finish_calls==1&&g_free_calls==1);
  assert(g_update_calls==0&&g_error_calls==0&&g_decrefs==0&&!g_original_target);
 }
}
"""
        cpp_run(PYTHON_STUB_MODEL + python_frame() + main)

    def test_actual_python_reports_and_saved_context_refuse_without_finish_and_free_once(self):
        main = r"""
int main(){bContext C;PropertyRNA property;
 for(int failure=0;failure<4;++failure){
  reset_python(&C);
  if(failure==0)g_begin_error=true;
  if(failure==1)g_change_begin_context=true;
  if(failure==2)g_result=eRNAPointerAssignmentResult::Refused;
  if(failure==3)g_change_cleanup_context=true;
  PyObject synthetic_cleanup;
  int result=fixture_python_assignment(&*g_original_target,&property,&g_param,failure==3?&synthetic_cleanup:nullptr);
  assert(result==-1&&g_finish_calls==0&&g_update_calls==0&&g_error_calls>0);
  assert(g_free_calls==(failure==2?0:1));
  assert(g_decrefs==(failure==3?1:0));
 }
}
"""
        cpp_run(PYTHON_STUB_MODEL + python_frame() + main)

    def test_actual_python_native_baseline_and_unrelated_keep_one_native_set_and_update(self):
        main = r"""
int main(){bContext C;PropertyRNA property;
 for(int route=0;route<3;++route){
  reset_python(&C);
  if(route==0)g_related=false;
  if(route==1)g_result=eRNAPointerAssignmentResult::NativeBaseline;
  if(route==2)g_result=eRNAPointerAssignmentResult::Unrelated;
  int result=fixture_python_assignment(&*g_original_target,&property,&g_param,nullptr);
  assert(result==0&&g_set_calls==1&&g_update_calls==1&&g_finish_calls==0&&g_free_calls==0);
  assert(g_begin_calls==(route==0?0:1));
 }
}
"""
        cpp_run(PYTHON_STUB_MODEL + python_frame() + main)

    def test_portable_native_bodies_preserve_pinned_provenance(self):
        self.assertIn(PIN, NATIVE)
        self.assertIn("GPL-2.0-or-later", NATIVE)
        for signature, digest in NATIVE_HASHES.items():
            self.assertIn(digest, NATIVE)
            self.assertEqual(hashlib.sha256(function(NATIVE, signature).encode()).hexdigest(), digest)
        mesh = function(NATIVE, "void BKE_mesh_assign_object(")
        self.assertLess(mesh.index("multires_force_sculpt_rebuild(ob)"), mesh.index("id_us_min"))
        self.assertNotIn("old == mesh", mesh)


if __name__ == "__main__":
    unittest.main()
