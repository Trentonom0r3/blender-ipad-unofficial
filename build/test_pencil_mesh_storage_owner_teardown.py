"""Execute eight real Mesh RNA consumers, the shared ID helper and WM owner scan.

Native Cancel, Mesh storage/allocation and dependency graph callbacks are
instrumented boundaries. The four pinned ED add admission wrappers are real;
this does not execute UIKit, full Blender Main or native geometry algorithms.
"""
from pathlib import Path
import hashlib
import re
import unittest

import test_ipad_panels
from test_compact_shelf import function
from test_touch_extrude import changed_source, PIN_ROOT
from test_pencil_rna_override_owner_teardown import PREFIX as ID_PREFIX, HELPERS, WM_OWNER_NEXT

ROOT = Path(__file__).resolve().parents[1]
PIN = "d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e"
MESH_PATH = "source/blender/makesrna/intern/rna_mesh.cc"
API_PATH = "source/blender/makesrna/intern/rna_mesh_api.cc"
ED_PATH = "source/blender/editors/mesh/mesh_data.cc"
MESH = changed_source(MESH_PATH)
API = changed_source(API_PATH)
# Complete pinned ED admission functions, from source blob
# 1baaf55900650236ffbe7a1e00c0be161d90e1e5 at PIN. Inner allocation and
# zero-count behavior below these wrappers remains an instrumented boundary.
ED_PINNED_BLOB = "1baaf55900650236ffbe7a1e00c0be161d90e1e5"
ED_SNIPPET_SHA256 = {'ED_mesh_verts_add': '83b755102658239863923fae2e6805612b2f271aed57e933111b29e653f7c572', 'ED_mesh_edges_add': '805968f1448f8fe9a0de73943f5c0c1634da3b66fd4d3eeae98baab68010f586', 'ED_mesh_loops_add': 'a446575b2b78ae33e571a71bbed0e0247b2ef5f3d5edf5e0c81b1c0c1ced72bc', 'ED_mesh_faces_add': 'c12e19dd97d29359172376f5832d55d3a85728dfe61c111714b4445d2a8df633'}
ED = r"""
void ED_mesh_verts_add(Mesh *mesh, ReportList *reports, int count)
{
  if (mesh->runtime->edit_mesh) {
    BKE_report(reports, RPT_ERROR, "Cannot add vertices in edit mode");
    return;
  }
  mesh_add_verts(mesh, count);
}

void ED_mesh_edges_add(Mesh *mesh, ReportList *reports, int count)
{
  if (mesh->runtime->edit_mesh) {
    BKE_report(reports, RPT_ERROR, "Cannot add edges in edit mode");
    return;
  }
  mesh_add_edges(mesh, count);
}

void ED_mesh_loops_add(Mesh *mesh, ReportList *reports, int count)
{
  if (mesh->runtime->edit_mesh) {
    BKE_report(reports, RPT_ERROR, "Cannot add loops in edit mode");
    return;
  }
  mesh_add_loops(mesh, count);
}

void ED_mesh_faces_add(Mesh *mesh, ReportList *reports, int count)
{
  if (mesh->runtime->edit_mesh) {
    BKE_report(reports, RPT_ERROR, "Cannot add faces in edit mode");
    return;
  }
  mesh_add_faces(mesh, count);
}
"""
MESH_HELPER = function(MESH, "static bool rna_Mesh_paint_owner_teardown(")
ADD_NAMES = ("rna_Mesh_vertices_add", "rna_Mesh_edges_add",
             "rna_Mesh_loops_add", "rna_Mesh_polygons_add")
API_NAMES = ("rna_Mesh_clear_geometry", "rna_Mesh_update", "rna_Mesh_validate",
             "rna_Mesh_validate_material_indices")
CALLBACK_NAMES = ADD_NAMES + API_NAMES
CALLBACKS = [function(MESH, ("static " if "static void " + name + "(" in MESH else "") + "void " + name + "(") for name in ADD_NAMES]
CALLBACKS += [function(API, ("static " if "static " + result + name + "(" in API else "") + result + name + "(") for name, result in zip(
    API_NAMES, ("void ", "void ", "bool ", "bool "))]
ED_NAMES = ("ED_mesh_verts_add", "ED_mesh_edges_add", "ED_mesh_loops_add", "ED_mesh_faces_add")
ED_CALLBACKS = [function(ED, "void " + name + "(") for name in ED_NAMES]
PREFIX = ID_PREFIX.replace("#include <vector>", "#include <vector>\n#include <string>").replace("ID_OB='O' | ('B'<<8)", "ID_ME='M' | ('E'<<8), ID_OB='O' | ('B'<<8)")
# The fixture supplies nullable implicit-Main plumbing for direct native calls.
# The nullable result matches the pinned ctx_data_pointer_verify null-C branch,
# which returns true with null output before provider dispatch. This fixture
# models the getter; it does not execute the native getter or interpreter.
PREFIX = PREFIX.replace("static Main *CTX_data_main(const bContext *C){return C->main;}",
                        "static Main *CTX_data_main(const bContext *C){return C?C->main:nullptr;}")
PREFIX = PREFIX.replace("struct ReportList { int errors=0; };",
                        "struct ReportList { int errors=0; const char *last=nullptr; };")

NATIVE = r"""
struct Mesh;
static Main *g_operation_main=nullptr;
static Mesh *g_expected_mesh=nullptr,*g_last_mesh=nullptr;
static int g_writes=0,g_cache_dirty=0,g_tags=0,g_notifiers=0,g_anim_frees=0,g_required=0;
static int g_edge_calcs=0,g_tess_clears=0,g_validates=0,g_material_validates=0;
static int g_add_calls[4]{},g_last_count=0,g_last_tag=-1;
static bool g_allow_owner=false,g_validate_result=false,g_material_result=false;
static bool g_last_verbose=false,g_last_clean=false,g_last_calc_edges=false;
static bool has_owner(Main *main) {
  LISTBASE_FOREACH(wmWindowManager*,wm,&main->wm) {
    LISTBASE_FOREACH(wmWindow*,win,&wm->windows) {
      for(ListBase *list:{&win->handlers,&win->modalhandlers}) {
        LISTBASE_FOREACH(wmEventHandler*,base,list) {
          if(base->type==WM_HANDLER_TYPE_OP &&
             reinterpret_cast<wmEventHandler_Op*>(base)->ipad_pencil_paint_serial) return true;
        }
      }
    }
  }
  return false;
}
static void native_admission(Mesh *mesh) {
  assert(g_operation_main&&mesh&&mesh==g_expected_mesh);
  assert(g_allow_owner||!has_owner(g_operation_main));g_last_mesh=mesh;
}
struct DirtyCache {
  Mesh *owner=nullptr;int dirtied=0;
  void tag_dirty(){native_admission(owner);++dirtied;++g_cache_dirty;}
};
struct MeshRuntime {
  void *edit_mesh=nullptr;
  DirtyCache loose_edges_cache,vert_normals_cache,face_normals_cache,corner_normals_cache;
  DirtyCache vert_normals_true_cache,face_normals_true_cache;
};
struct Mesh {
  ID id{ID_ME,0};int verts_num=4,edges_num=6,corners_num=12,faces_num=4,totface_legacy=0;
  MeshRuntime runtime_storage;MeshRuntime *runtime=&runtime_storage;
  Mesh() {
    for(auto *cache:{&runtime->loose_edges_cache,&runtime->vert_normals_cache,
        &runtime->face_normals_cache,&runtime->corner_normals_cache,
        &runtime->vert_normals_true_cache,&runtime->face_normals_true_cache})cache->owner=this;
  }
};
enum {NC_GEOM=128,ND_DATA=256,ID_RECALC_GEOMETRY_ALL_MODES=512};
static void BKE_report(ReportList *reports,int,const char *message) {
  assert(reports);++reports->errors;reports->last=message;
}
// Allocation/CustomData mutation is a modeled boundary below the exact ED
// wrappers. The pinned inners are separately checked for their zero admission.
static void mesh_add(Mesh *mesh,int count,int kind) {
  ++g_add_calls[kind];g_last_count=count;
  if(count==0)return;
  native_admission(mesh);++g_writes;
  switch(kind) {
    case 0:mesh->verts_num+=count;break;case 1:mesh->edges_num+=count;break;
    case 2:mesh->corners_num+=count;break;case 3:mesh->faces_num+=count;break;
  }
}
static void mesh_add_verts(Mesh *mesh,int count){mesh_add(mesh,count,0);}
static void mesh_add_edges(Mesh *mesh,int count){mesh_add(mesh,count,1);}
static void mesh_add_loops(Mesh *mesh,int count){mesh_add(mesh,count,2);}
static void mesh_add_faces(Mesh *mesh,int count){mesh_add(mesh,count,3);}
static void BKE_mesh_clear_geometry_and_metadata(Mesh *mesh) {
  native_admission(mesh);++g_writes;mesh->verts_num=mesh->edges_num=mesh->corners_num=mesh->faces_num=0;
}
static void BKE_animdata_free(ID *id,bool do_id_user) {
  assert(!do_id_user);native_admission(reinterpret_cast<Mesh*>(id));++g_anim_frees;
}
namespace blender::bke {
static void mesh_ensure_required_data_layers(Mesh &mesh) {native_admission(&mesh);++g_required;}
static void mesh_calc_edges(Mesh &mesh,bool keep,bool select) {
  assert(select);native_admission(&mesh);++g_writes;++g_edge_calcs;g_last_calc_edges=keep;
}
}
static void BKE_mesh_tessface_clear(Mesh *mesh){native_admission(mesh);++g_tess_clears;}
static void DEG_id_tag_update(ID *id,int flags) {
  native_admission(reinterpret_cast<Mesh*>(id));++g_tags;g_last_tag=flags;
}
static void WM_main_add_notifier(int event,void *mesh) {
  assert(event==(NC_GEOM|ND_DATA));native_admission(static_cast<Mesh*>(mesh));++g_notifiers;
}
static void WM_event_add_notifier(bContext*,int event,void *mesh) {
  assert(event==(NC_GEOM|ND_DATA));native_admission(static_cast<Mesh*>(mesh));++g_notifiers;
}
static bool BKE_mesh_validate(Mesh *mesh,bool verbose,bool clean) {
  native_admission(mesh);++g_validates;++g_writes;
  g_last_verbose=verbose;g_last_clean=clean;
  // Native validate can mutate CustomData while its final result is false.
  return g_validate_result;
}
static bool BKE_mesh_validate_material_indices(Mesh *mesh) {
  native_admission(mesh);++g_material_validates;++g_writes;
  if(g_material_result)DEG_id_tag_update(&mesh->id,512);
  return g_material_result;
}
"""

SUPPORT = r"""
struct Fixture {
  Main main,foreign;wmWindowManager wm;wmWindow win,second;wmEventHandler_Op owner,other_owner;
  bContext C;Mesh mesh,replacement;Library library,other_library;
  ID reference,root,other_reference;IDOverrideLibrary override,other_override;ReportList reports;
  Fixture() {
    wm.id.session_uid=1;wm.windows.first=&win;win.winid=10;win.runtime=&win;
    main.wm.first=&wm;G_MAIN=&main;C={&main,&wm,&win,nullptr,nullptr};
    g_cancel_ok=true;g_change_context=g_replace_main=g_spawn=false;
    g_remove_foreign_window=g_remove_foreign_manager=false;g_cancel_calls=0;
    g_context_allocs=g_context_frees=0;g_original=&C;g_other_main=&foreign;
    g_cancel_hook=nullptr;g_spawn_window=nullptr;g_spawned={};
    library.id.session_uid=100;other_library.id.session_uid=101;
    mesh.id.session_uid=200;replacement.id.session_uid=200;
    reference.session_uid=202;reference.lib=&library;root.session_uid=203;other_reference.session_uid=204;
    override.reference=&reference;override.hierarchy_root=&root;
    main.ids={&library.id,&other_library.id,&mesh.id,&reference,&root,&other_reference};foreign.ids=main.ids;
    g_operation_main=&main;g_expected_mesh=&mesh;g_last_mesh=nullptr;
    g_writes=g_cache_dirty=g_tags=g_notifiers=g_anim_frees=g_required=0;
    g_edge_calcs=g_tess_clears=g_validates=g_material_validates=0;
    for(auto &count:g_add_calls)count=0;
    g_last_count=0;g_last_tag=-1;g_allow_owner=false;
    g_validate_result=g_material_result=g_last_verbose=g_last_clean=g_last_calc_edges=false;
  }
  void add_owner(bool both=false) {
    owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=7;
    owner.ipad_pencil_operator_lifetime=70;win.modalhandlers.first=&owner;
    if(both) {
      win.next=&second;second.winid=20;second.runtime=&second;
      other_owner.type=WM_HANDLER_TYPE_OP;other_owner.ipad_pencil_paint_serial=8;
      other_owner.ipad_pencil_operator_lifetime=80;second.modalhandlers.first=&other_owner;
    }
  }
};
static bool call_action(Fixture &f,int action,bContext *C=nullptr,Main *main=nullptr,int count=1,
                        bool first=false,bool second=true,Mesh *input=nullptr) {
  main=main?main:&f.main;g_operation_main=main;
  Mesh *mesh=input?input:&f.mesh;
  switch(action) {
    case 0:rna_Mesh_vertices_add(mesh,main,C,&f.reports,count);return true;
    case 1:rna_Mesh_edges_add(mesh,main,C,&f.reports,count);return true;
    case 2:rna_Mesh_loops_add(mesh,main,C,&f.reports,count);return true;
    case 3:rna_Mesh_polygons_add(mesh,main,C,&f.reports,count);return true;
    case 4:rna_Mesh_clear_geometry(mesh,main,C,&f.reports);return true;
    case 5:rna_Mesh_update(mesh,main,C,&f.reports,first,second);return true;
    case 6:return rna_Mesh_validate(mesh,main,C,&f.reports,first,second);
    case 7:return rna_Mesh_validate_material_indices(mesh,main,C,&f.reports);
  }
  assert(false);return false;
}
static void assert_no_write() {
  assert(g_writes==0&&g_cache_dirty==0&&g_tags==0&&g_notifiers==0);
  assert(g_anim_frees==0&&g_required==0&&g_edge_calcs==0&&g_tess_clears==0);
  assert(g_validates==0&&g_material_validates==0);
  for(auto count:g_add_calls)assert(count==0);
}
static Fixture *g_fixture=nullptr;
enum Mutation {None,RemoveMesh,MeshUID,MeshType,ReplaceMesh,MeshLibrary,LibraryUID,LibraryType,
  RemoveLibrary,ReplaceLibrary,OverrideAddress,OverrideFlag,OverrideReference,ReferenceUID,
  ReferenceType,RemoveReference,OverrideRoot,RootUID,RemoveRoot,ClearOverride,
  ClearReference,Context,MainReplace,EnterEdit};
static Mutation g_mutation=None;static int g_mutate_after=1;
static void mutation_hook() {
  if(g_cancel_calls<g_mutate_after)return;
  Fixture &f=*g_fixture;
  auto remove=[&](ID *id){f.main.ids.erase(std::remove(f.main.ids.begin(),f.main.ids.end(),id),f.main.ids.end());};
  switch(g_mutation) {
    case None:break;
    case RemoveMesh:remove(&f.mesh.id);break;case MeshUID:++f.mesh.id.session_uid;break;
    case MeshType:f.mesh.id.name[0]='Z';break;
    case ReplaceMesh:remove(&f.mesh.id);f.main.ids.push_back(&f.replacement.id);break;
    case MeshLibrary:f.mesh.id.lib=&f.other_library;break;case LibraryUID:++f.library.id.session_uid;break;
    case LibraryType:f.library.id.name[0]='Z';break;case RemoveLibrary:remove(&f.library.id);break;
    case ReplaceLibrary:remove(&f.library.id);f.other_library.id.session_uid=100;f.main.ids.push_back(&f.other_library.id);break;
    case OverrideAddress:f.mesh.id.override_library=&f.other_override;break;
    case OverrideFlag:f.override.flag^=2;break;case OverrideReference:f.override.reference=&f.other_reference;break;
    case ReferenceUID:++f.reference.session_uid;break;case ReferenceType:f.reference.name[0]='Z';break;
    case RemoveReference:remove(&f.reference);break;case OverrideRoot:f.override.hierarchy_root=&f.other_reference;break;
    case RootUID:++f.root.session_uid;break;case RemoveRoot:remove(&f.root);break;
    case ClearOverride:f.mesh.id.override_library=nullptr;break;case ClearReference:f.override.reference=nullptr;break;
    case Context:f.C.region=reinterpret_cast<ARegion*>(uintptr_t(123));break;
    case MainReplace:G_MAIN=&f.foreign;break;
    case EnterEdit:f.mesh.runtime->edit_mesh=&f.mesh;break;
  }
}
static void mutate(Fixture &f,Mutation mutation) {g_fixture=&f;g_mutation=mutation;g_mutate_after=1;g_cancel_hook=mutation_hook;}
"""


def source_with_main(main):
    # Historical owner-retirement expectations now enter the same explicit
    # owned producer as Python. Native borrowed refusal is tested separately.
    from test_pencil_rna_owned_dispatch import source_with_main as owned_source
    return owned_source(main, mode="mesh", legacy_owned=True)


class PencilMeshStorageOwnerTeardownTests(unittest.TestCase):
    def run_cpp(self, main, apple=True, borrowed=False):
        if borrowed:
            from test_pencil_rna_owned_dispatch import source_with_main as native_source
            source = native_source(main, mode="mesh", legacy_owned=False)
        else:
            source = source_with_main(main)
        if not apple:
            source = source.replace("#define WITH_APPLE_CROSSPLATFORM\n", "")
        from test_pencil_rna_owned_dispatch import compile_run
        compile_run(source)

    def test_all_eight_live_consumers_retire_all_registered_owners_before_native_mutation(self):
        self.run_cpp(r"""
int main() {
  for(int action=0;action<8;++action) {
    Fixture f;f.add_owner(true);call_action(f,action,&f.C);
    assert(g_cancel_calls==2&&!has_owner(&f.main)&&f.reports.errors==0);
    assert(g_context_allocs==2&&g_context_frees==2&&g_last_mesh==&f.mesh);
    assert(g_writes+g_cache_dirty>0);
  }
}
""")

    def test_refusal_and_missing_ui_context_precede_writes_dirtiness_and_tags(self):
        self.run_cpp(r"""
int main() {
  for(int refusal=0;refusal<5;++refusal) {
    for(int action=0;action<8;++action) {
      Fixture f;f.add_owner();bContext *C=&f.C;
      if(refusal==0)C=nullptr;if(refusal==1)f.C.wm=nullptr;
      if(refusal==2)f.C.win=nullptr;if(refusal==3)g_cancel_ok=false;
      if(refusal==4)f.owner.ipad_pencil_operator_lifetime=0;
      if(action>=6)assert(!call_action(f,action,C));else call_action(f,action,C);
      assert(g_cancel_calls==(refusal==3?1:0)&&has_owner(&f.main)&&f.reports.errors>0);
      assert_no_write();
    }
  }
}
""")

    def test_typed_mesh_and_library_changes_after_first_cancel_refuse_before_second_owner(self):
        self.run_cpp(r"""
int main() {
  for(Mutation mutation:{RemoveMesh,MeshUID,MeshType,ReplaceMesh,MeshLibrary,LibraryUID,
      LibraryType,RemoveLibrary,ReplaceLibrary,Context,MainReplace}) {
    for(int action=0;action<8;++action) {
      Fixture f;f.mesh.id.lib=&f.library;f.add_owner(true);mutate(f,mutation);
      if(action>=6)assert(!call_action(f,action,&f.C));else call_action(f,action,&f.C);
      assert(g_cancel_calls==1&&f.second.modalhandlers.first==&f.other_owner);
      assert(f.reports.errors>0);assert_no_write();
    }
  }
}
""")

    def test_mesh_override_relations_are_reacquired_after_every_cancel(self):
        self.run_cpp(r"""
int main() {
  for(Mutation mutation:{OverrideAddress,OverrideFlag,OverrideReference,ReferenceUID,
      ReferenceType,RemoveReference,OverrideRoot,RootUID,RemoveRoot,ClearOverride,ClearReference}) {
    for(int action=0;action<8;++action) {
      Fixture f;f.mesh.id.override_library=&f.override;f.add_owner(true);mutate(f,mutation);
      if(action>=6)assert(!call_action(f,action,&f.C));else call_action(f,action,&f.C);
      assert(g_cancel_calls==1&&f.second.modalhandlers.first==&f.other_owner);
      assert(f.reports.errors>0);assert_no_write();
    }
  }
}
""")

    def test_second_cancel_revalidates_id_library_override_and_context(self):
        self.run_cpp(r"""
int main() {
  for(Mutation mutation:{MeshUID,LibraryType,OverrideReference,Context}) {
    for(int action=0;action<8;++action) {
      Fixture f;f.mesh.id.override_library=&f.override;
      if(mutation==LibraryType)f.mesh.id.lib=&f.library;
      f.add_owner(true);mutate(f,mutation);g_mutate_after=2;
      if(action>=6)assert(!call_action(f,action,&f.C));else call_action(f,action,&f.C);
      assert(g_cancel_calls==2&&!has_owner(&f.main)&&f.reports.errors>0);assert_no_write();
    }
  }
}
""")

    def test_registered_scan_refuses_invalid_handler_and_drains_reentrant_new_owner(self):
        self.run_cpp(r"""
int main() {
  for(int invalid=0;invalid<3;++invalid) {
    for(int action=0;action<8;++action) {
      Fixture f;f.add_owner();
      if(invalid==0)f.owner.registered=false;
      if(invalid==1)f.win.handlers.first=&f.owner,f.win.modalhandlers.first=nullptr;
      if(invalid==2)f.win.runtime=nullptr;
      if(action>=6)assert(!call_action(f,action,&f.C));else call_action(f,action,&f.C);
      assert(g_cancel_calls==0&&has_owner(&f.main)&&f.reports.errors>0);assert_no_write();
    }
  }
  for(int action=0;action<8;++action) {
    Fixture f;f.add_owner();g_spawn=true;g_spawn_window=&f.win;
    call_action(f,action,&f.C);
    assert(g_cancel_calls==2&&!has_owner(&f.main)&&f.reports.errors==0);
    assert(g_writes+g_cache_dirty>0&&g_context_allocs==2&&g_context_frees==2);
  }
}
""")
    def test_evaluated_mesh_without_uid_preserves_no_owner_behavior_and_refuses_live_owner(self):
        self.run_cpp(r"""
int main() {
  for(int context=0;context<3;++context) {
    for(int action=0;action<8;++action) {
      if(action==5)continue; // update requires a native notifier context.
      Fixture f;f.mesh.id.session_uid=0;bContext *C=context==0?nullptr:&f.C;
      if(context==1)f.C.wm=nullptr,f.C.win=nullptr;
      if(context==2)f.C.win=nullptr;
      call_action(f,action,C);
      assert(g_cancel_calls==0&&f.reports.errors==0&&g_writes+g_cache_dirty>0);
    }
  }
  {
    Fixture f;f.mesh.id.session_uid=0;call_action(f,5,&f.C);
    assert(g_cancel_calls==0&&f.reports.errors==0&&g_cache_dirty>0&&g_notifiers==1);
  }
  for(int action=0;action<8;++action) {
    Fixture f;f.mesh.id.session_uid=0;f.add_owner();
    if(action>=6)assert(!call_action(f,action,&f.C));else call_action(f,action,&f.C);
    assert(g_cancel_calls==0&&has_owner(&f.main)&&f.reports.errors>0);assert_no_write();
  }
}
""")

    def test_modeled_implicit_prefix_and_null_Main_direct_native_callbacks_for_seven_apis(self):
        self.run_cpp(r"""
// Argument ordering matches the makesrna implicit prefix checked below.
// The nullable getter is a fixture boundary: actual native callbacks receive
// modeled null Main inputs. The pinned getter/generated wrapper is not executed.
static bool generated_call(Fixture &f,int action,bContext *C) {
  Mesh *_self=&f.mesh;ReportList *reports=&f.reports;g_operation_main=&f.main;
  switch(action) {
    case 0:rna_Mesh_vertices_add(_self,CTX_data_main(C),C,reports,1);return true;
    case 1:rna_Mesh_edges_add(_self,CTX_data_main(C),C,reports,1);return true;
    case 2:rna_Mesh_loops_add(_self,CTX_data_main(C),C,reports,1);return true;
    case 3:rna_Mesh_polygons_add(_self,CTX_data_main(C),C,reports,1);return true;
    case 4:rna_Mesh_clear_geometry(_self,CTX_data_main(C),C,reports);return true;
    case 6:return rna_Mesh_validate(_self,CTX_data_main(C),C,reports,false,true);
    case 7:return rna_Mesh_validate_material_indices(_self,CTX_data_main(C),C,reports);
  }
  assert(false);return false;
}
int main() {
  assert(CTX_data_main(nullptr)==nullptr);
  for(int action:{0,1,2,3,4,6,7}) {
    {
      Fixture f;f.mesh.id.session_uid=0;generated_call(f,action,nullptr);
      assert(g_cancel_calls==0&&f.reports.errors==0&&g_writes>0&&g_last_mesh==&f.mesh);
    }
    for(int uid:{0,200}) {
      Fixture f;f.mesh.id.session_uid=uint32_t(uid);f.add_owner();
      if(action>=6)assert(!generated_call(f,action,nullptr));else generated_call(f,action,nullptr);
      assert(g_cancel_calls==0&&has_owner(&f.main)&&f.reports.errors>0);assert_no_write();
    }
    for(int invalid=0;invalid<2;++invalid) {
      Fixture f;bContext *C=nullptr;
      if(invalid==0)G_MAIN=nullptr;
      else C=&f.C,f.C.main=nullptr;
      if(action>=6)assert(!generated_call(f,action,C));else generated_call(f,action,C);
      assert(g_cancel_calls==0);
      if(invalid==0){assert(f.reports.errors>0);assert_no_write();}
      else{assert(f.reports.errors==0&&g_writes>0&&g_last_mesh==&f.mesh);}
    }
  }
}
""", borrowed=True)

    def test_actual_wm_absence_query_has_no_cancel_and_refuses_bad_context_or_handlers(self):
        self.run_cpp(r"""
int main() {
  for(int context=0;context<3;++context) {
    Fixture f;bContext *C=context==0?nullptr:&f.C;
    if(context==1)f.C.wm=nullptr,f.C.win=nullptr;
    assert(WM_event_ipad_pencil_paint_owner_teardown_next(C,&f.main,nullptr));
    assert(g_cancel_calls==0&&g_context_allocs==0);
    f.add_owner();
    assert(!WM_event_ipad_pencil_paint_owner_teardown_next(C,&f.main,nullptr));
    assert(g_cancel_calls==0&&g_context_allocs==0&&has_owner(&f.main));
  }
  for(int invalid=0;invalid<4;++invalid) {
    Fixture f;f.add_owner();
    if(invalid==0)f.owner.registered=false;
    if(invalid==1)f.win.handlers.first=&f.owner,f.win.modalhandlers.first=nullptr;
    if(invalid==2)f.owner.ipad_pencil_operator_lifetime=0;
    if(invalid==3)f.win.runtime=nullptr;
    assert(!WM_event_ipad_pencil_paint_owner_teardown_next(&f.C,&f.main,nullptr));
    assert(g_cancel_calls==0&&g_context_allocs==0&&has_owner(&f.main));
  }
  {
    Fixture f;f.C.main=&f.foreign;
    assert(!WM_event_ipad_pencil_paint_owner_teardown_next(&f.C,&f.main,nullptr));
    assert(!WM_event_ipad_pencil_paint_owner_teardown_next(nullptr,&f.foreign,nullptr));
    assert(g_cancel_calls==0&&g_context_allocs==0);
  }
}
""")
    def test_no_owner_context_free_and_foreign_main_preserve_native_semantics(self):
        self.run_cpp(r"""
int main() {
  for(int context=0;context<4;++context) {
    for(int action=0;action<8;++action) {
      if(action==5)continue; // update requires a native notifier context.
      Fixture f;bContext *C=context==0?nullptr:&f.C;
      if(context==1)f.C.wm=nullptr,f.C.win=nullptr,f.mesh.id.session_uid=0;
      if(context==2)f.C.win=nullptr;
      Main *main=&f.main;
      if(context==3)f.add_owner(),main=&f.foreign,C=nullptr;
      call_action(f,action,C,main);
      if(context==3){assert(g_cancel_calls==0&&f.reports.errors>0);assert_no_write();}
      else assert(g_cancel_calls==0&&f.reports.errors==0&&g_writes+g_cache_dirty>0);
      assert(bool(has_owner(&f.main))==(context==3));
    }
  }
}
""")

    def test_add_edit_errors_precede_zero_and_do_not_cancel_owners(self):
        self.run_cpp(r"""
int main() {
  const char *errors[]={"Cannot add vertices in edit mode","Cannot add edges in edit mode",
                        "Cannot add loops in edit mode","Cannot add faces in edit mode"};
  for(int action=0;action<4;++action) {
    for(int edit=0;edit<2;++edit) {
      for(int count:{0,3}) {
        if(!edit&&count)continue;
        Fixture f;f.add_owner();if(edit)f.mesh.runtime->edit_mesh=&f.mesh;
        call_action(f,action,nullptr,nullptr,count);
        assert(g_cancel_calls==0&&has_owner(&f.main)&&g_writes==0&&g_cache_dirty==0&&g_tags==0);
        assert(f.reports.errors==edit);
        if(edit){assert(std::string(f.reports.last)==errors[action]);for(auto calls:g_add_calls)assert(calls==0);}
        else assert(g_add_calls[action]==1&&g_last_count==0);
      }
    }
  }
}
""")

    def test_add_rechecks_native_edit_admission_after_cancel(self):
        self.run_cpp(r"""
int main() {
  for(int action=0;action<4;++action) {
    Fixture f;f.add_owner();mutate(f,EnterEdit);call_action(f,action,&f.C);
    assert(g_cancel_calls==1&&!has_owner(&f.main)&&f.reports.errors==1);
    assert_no_write();
  }
}
""")

    def test_native_update_conditions_cache_dirtiness_and_boolean_returns_are_preserved(self):
        self.run_cpp(r"""
int main() {
  for(int geometry=0;geometry<4;++geometry) {
    for(int calc=0;calc<2;++calc) {
      for(int loose=0;loose<2;++loose) {
        Fixture f;f.mesh.faces_num=geometry==1?1:0;f.mesh.totface_legacy=geometry==2?1:0;
        f.mesh.edges_num=geometry==3?1:0;f.add_owner();
        call_action(f,5,&f.C,nullptr,1,bool(calc),bool(loose));
        assert(g_edge_calcs==(calc||geometry==1||geometry==2));
        if(g_edge_calcs)assert(g_last_calc_edges==bool(calc));
        assert(g_cache_dirty==5+loose&&g_tess_clears==1&&g_tags==1&&g_last_tag==0&&g_notifiers==1);
      }
    }
  }
  for(int result=0;result<2;++result) {
    for(int verbose=0;verbose<2;++verbose) {
      for(int clean=0;clean<2;++clean) {
        Fixture f;f.add_owner();g_validate_result=bool(result);
        assert(call_action(f,6,&f.C,nullptr,1,bool(verbose),bool(clean))==bool(result));
        assert(g_validates==1&&g_writes==1&&g_last_verbose==bool(verbose)&&g_last_clean==bool(clean));
      }
    }
    Fixture f;f.add_owner();g_material_result=bool(result);
    assert(call_action(f,7,&f.C)==bool(result));
    assert(g_material_validates==1&&g_writes==1&&g_tags==result);
  }
  {
    Fixture f;f.mesh.runtime->edit_mesh=&f.mesh;f.add_owner();call_action(f,4,&f.C);
    assert(g_writes==1&&g_anim_frees==1&&g_required==1&&g_tags==1&&g_last_tag==ID_RECALC_GEOMETRY_ALL_MODES);
    assert(f.mesh.verts_num==0&&g_notifiers==1&&f.reports.errors==0);
  }
}
""")

    def test_non_apple_consumers_keep_native_mutations_and_do_not_drain_owner(self):
        self.run_cpp(r"""
int main() {
  for(int action=0;action<8;++action) {
    Fixture f;f.add_owner();g_allow_owner=true;f.mesh.id.session_uid=0;
    call_action(f,action,action==5?&f.C:nullptr);
    assert(g_cancel_calls==0&&has_owner(&f.main)&&f.reports.errors==0&&g_writes+g_cache_dirty>0);
  }
}
""", apple=False)

    def test_cancel_can_free_mesh_or_library_without_using_stale_inputs(self):
        self.run_cpp(r"""
static Main *g_delete_main=nullptr;static ID *g_delete_input=nullptr;
static void free_input_hook() {
  auto &ids=g_delete_main->ids;ids.erase(std::remove(ids.begin(),ids.end(),g_delete_input),ids.end());
  if(GS(g_delete_input->name)==ID_ME)delete reinterpret_cast<Mesh*>(g_delete_input);
  else delete reinterpret_cast<Library*>(g_delete_input);
  g_delete_input=nullptr;
}
int main() {
  for(int input=0;input<2;++input) {
    for(int action=0;action<8;++action) {
      Fixture f;f.add_owner(true);Mesh *mesh=&f.mesh;
      if(input==0) {mesh=new Mesh;mesh->id.session_uid=700;f.main.ids.push_back(&mesh->id);g_delete_input=&mesh->id;}
      else {auto *library=new Library;library->id.session_uid=701;f.main.ids.push_back(&library->id);
            f.mesh.id.lib=library;g_delete_input=&library->id;}
      g_delete_main=&f.main;g_cancel_hook=free_input_hook;
      if(action>=6)assert(!call_action(f,action,&f.C,nullptr,1,false,true,mesh));
      else call_action(f,action,&f.C,nullptr,1,false,true,mesh);
      assert(g_delete_input==nullptr&&g_cancel_calls==1&&f.reports.errors>0);assert_no_write();
    }
  }
}
""")

    def test_pinned_actual_ed_admission_and_eight_live_route_scope_are_explicit(self):
        self.assertEqual(PIN_ROOT.name, PIN)
        self.assertEqual(len(CALLBACK_NAMES), 8)
        self.assertEqual(ED_PINNED_BLOB, "1baaf55900650236ffbe7a1e00c0be161d90e1e5")
        for name, inner in zip(ED_NAMES, ("verts", "edges", "loops", "faces")):
            body = function(ED, "void " + name + "(")
            self.assertEqual(hashlib.sha256(body.encode()).hexdigest(), ED_SNIPPET_SHA256[name])
            self.assertLess(body.index("edit_mesh"), body.index("mesh_add_" + inner))
        for name in ("verts", "edges"):
            marker = f'func = RNA_def_function(srna, "remove", "ED_mesh_{name}_remove");'
            region = MESH[MESH.index(marker)-70:MESH.index(marker)+len(marker)]
            self.assertIn("#  if 0 /* BMESH_TODO", region)
        gpu = function(API, "static void rna_Mesh_update_gpu_tag(")
        self.assertNotIn("paint_owner_teardown", gpu)
        self.assertIn("BKE_mesh_batch_cache_dirty_tag", gpu)

    def test_real_registrations_generate_exact_implicit_and_ordinary_argument_abi(self):
        generator = (ROOT / "build/tests/pencil_rna_function_call_order.cc").read_text(encoding="utf-8")
        self.assertEqual(hashlib.sha256(generator.encode()).hexdigest(), "4d14f4f49655f553966e42d2422d739339cb9879281df0aafe05df776b37efae")
        bits = {"FUNC_USE_SELF_ID": 1, "FUNC_NO_SELF": 2, "FUNC_USE_SELF_TYPE": 4,
                "FUNC_USE_MAIN": 8, "FUNC_USE_CONTEXT": 16, "FUNC_USE_REPORTS": 32}
        checks, emitted = [], []
        for callback in CALLBACK_NAMES:
            source = MESH if callback in ADD_NAMES else API
            marker = re.search(r'func = RNA_def_function\(srna, "([^"]+)", "' + callback + r'"\);', source)
            self.assertIsNotNone(marker)
            body = source[marker.end():].split("func = RNA_def_function(", 1)[0]
            flags = set(re.findall(r"FUNC_\w+", re.search(r'RNA_def_function_flag\(func, ([^;]+)\);', body)[1]))
            self.assertEqual(flags, {"FUNC_USE_MAIN", "FUNC_USE_CONTEXT", "FUNC_USE_REPORTS"})
            props = list(re.finditer(r'RNA_def_(boolean|int)\(\s*func,\s*"([^"]+)"\s*,\s*(false|true|0)', body))
            returns = list(re.finditer(r"RNA_def_function_return\(func, parm\)", body))
            returned = {max((p for p in props if p.start() < ret.start()), key=lambda p: p.start()).start() for ret in returns}
            ordinary = [p for p in props if p.start() not in returned]
            expected = {"rna_Mesh_update": [("calc_edges", "false"), ("calc_edges_loose", "false")],
                        "rna_Mesh_validate": [("verbose", "false"), ("clean_customdata", "true")],
                        "rna_Mesh_validate_material_indices": [], "rna_Mesh_clear_geometry": []}
            self.assertEqual([(p[2], p[3]) for p in ordinary], expected.get(callback, [("count", "0")]))
            self.assertEqual(len(returned), int(callback in API_NAMES[2:]))
            parameters = ["Mesh*", "Main*", "bContext*", "ReportList*"] + ["bool" if p[1] == "boolean" else "int" for p in ordinary]
            result = "bool" if callback in API_NAMES[2:] else "void"
            checks.append("static_assert(std::is_same_v<decltype(&" + callback + ")," + result + "(*)(" + ",".join(parameters) + ")>);")
            emitted.append('assert(generated_prefix(' + str(sum(bits[f] for f in flags)) + ')=="_self, CTX_data_main(C), C, reports");')
        harness = r"""
#include <cstdio>
#include <string>
enum {FUNC_USE_SELF_ID=1,FUNC_NO_SELF=2,FUNC_USE_SELF_TYPE=4,FUNC_USE_MAIN=8,FUNC_USE_CONTEXT=16,FUNC_USE_REPORTS=32};
static std::string generated_prefix(int flags) {
  FILE *f=nullptr;
#ifdef _MSC_VER
  assert(tmpfile_s(&f)==0);
#else
  f=tmpfile();
#endif
  assert(f);struct Function {int flag;} value{flags};auto *func=&value;int first=1;
""" + generator + r"""
  fflush(f);rewind(f);char bytes[256]{};size_t count=fread(bytes,1,sizeof(bytes)-1,f);fclose(f);return std::string(bytes,count);
}
"""
        self.run_cpp(harness + "\n".join(checks) + "\nint main(){Fixture f;" + "".join(emitted) + "call_action(f,0);}\n")


if __name__ == "__main__":
    unittest.main()
