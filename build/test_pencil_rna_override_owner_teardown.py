"""Execute the exact RNA override callbacks and registered WM owner scan.

Native cancellation and ID operations are instrumented boundaries; this does
not execute UIKit, an entire Blender Main, or native library override internals.
"""
from pathlib import Path
import hashlib
import re
import unittest

import test_ipad_panels
from test_compact_shelf import function
from test_touch_extrude import changed_source
from test_pencil_paint_outliner_override_clear import WM_OWNER_NEXT, WM_OWNER_NEXT_CPP

RNA_PATH = "source/blender/makesrna/intern/rna_ID.cc"
RNA = changed_source(RNA_PATH)
HELPER_START = RNA.index("#ifdef WITH_APPLE_CROSSPLATFORM\nstruct RnaIDOverrideIdentity")
HELPERS = RNA[HELPER_START:RNA.index("static ID *rna_ID_override_create(", HELPER_START)]
CALLBACK_NAMES = (
    "rna_ID_override_create", "rna_ID_override_hierarchy_create",
    "rna_ID_override_library_reset", "rna_ID_override_library_destroy",
    "rna_ID_override_library_resync", "rna_ID_user_remap", "rna_ID_make_local",
)
CALLBACK_RETURNS = ("ID *", "ID *", "void ", "void ", "bool ", "void ", "ID *")
CALLBACKS = [function(RNA, "static " + result + name + "(")
             for result, name in zip(CALLBACK_RETURNS, CALLBACK_NAMES)]

# Reuse the strict scan fixture's context/list/native Cancel boundary, then
# execute its exact production helper together with the real RNA consumers.
PREFIX = WM_OWNER_NEXT_CPP.split(WM_OWNER_NEXT, 1)[0]
PREFIX = PREFIX.replace("#include <vector>", "#include <vector>\n#include <algorithm>\n#include <type_traits>\n#include <tuple>\n#define UNUSED_VARS(...) (void)std::forward_as_tuple(__VA_ARGS__)\n#define WITH_APPLE_CROSSPLATFORM\n#define BLI_assert assert")
PREFIX = PREFIX.replace("struct ID { uint32_t session_uid=0; };", r"""
enum ID_Type { ID_OB='O' | ('B'<<8), ID_SCE='S' | ('C'<<8),
               ID_LI='L' | ('I'<<8), ID_GR='G' | ('R'<<8) };
enum { ID_TAG_EXTERN=1<<2, ID_TAG_NEW=1<<1 };
struct Library;
struct IDOverrideLibrary;
struct ID {
  char name[3]={'O','B',0}; uint32_t session_uid=0;
  Library *lib=nullptr; IDOverrideLibrary *override_library=nullptr;
  int tag=ID_TAG_EXTERN;ID *newid=nullptr;
  short fixture_list_type=short(ID_OB);
  ID(ID_Type type=ID_OB,uint32_t uid=0):session_uid(uid) {
    name[0]=char(int(type)&255);name[1]=char(int(type)>>8);fixture_list_type=short(type);
  }
};
struct Library { ID id{ID_LI,0}; };
struct IDOverrideLibrary { ID *reference=nullptr,*hierarchy_root=nullptr; int flag=0; };
static ID_Type GS(const char *name) {
  return ID_Type(static_cast<unsigned char>(name[0]) |
                 (static_cast<unsigned char>(name[1])<<8));
}
#define ID_IS_LINKED(id) ((id)->lib != nullptr)
#define ID_IS_OVERRIDABLE_LIBRARY(id) ((id)->lib && ((id)->tag & ID_TAG_EXTERN))
#define ID_IS_OVERRIDE_LIBRARY_REAL(id) ((id)->override_library && (id)->override_library->reference)
""")
PREFIX = PREFIX.replace("struct Main { ListBase wm; };", "struct Main { ListBase wm; std::vector<ID*> ids; };")
PREFIX = PREFIX.replace("struct ARegion {};", r"""
struct ARegion {};
struct ViewLayer { ViewLayer *next=nullptr; };
struct Scene { ID id{ID_SCE,0}; ListBase view_layers; };
struct Collection { ID id{ID_GR,0}; };
struct ReportList { int errors=0; };
struct BlendFileReadReport { ReportList *reports=nullptr; };
enum { RPT_ERROR=1,RPT_ERROR_INVALID_INPUT=2,LIBOVERRIDE_FLAG_NO_HIERARCHY=1,
       ID_TAG_DOIT=1,ID_REMAP_SKIP_INDIRECT_USAGE=1,NC_ID=1,NA_ADDED=2,
       NC_WM=4,ND_LIB_OVERRIDE_CHANGED=8,NC_WINDOW=16,ID_REMAP_SKIP_NEVER_NULL_USAGE=32,
       LIB_ID_MAKELOCAL_ASSET_DATA_CLEAR=64 };
static void BKE_reportf(ReportList *reports,int,const char*,...) {
  assert(reports);++reports->errors;
}
static ID *BKE_libblock_find_session_uid(Main *main,short type,uint32_t uid) {
  // Native lookup chooses the fixed typed Main list, then matches the UID.
  // Mutating name bytes must not silently change which list owns the ID.
  for (ID *id:main->ids) if (id->fixture_list_type==type && id->session_uid==uid) return id;
  return nullptr;
}
""")
PREFIX = PREFIX.replace("static bool WM_event_ipad_pencil_paint_owner_teardown(\n", "static void (*g_cancel_hook)()=nullptr;\nstatic bool WM_event_ipad_pencil_paint_owner_teardown(\n")
PREFIX = PREFIX.replace("  return true;\n}\n", "  if(g_cancel_hook)g_cancel_hook();\n  return true;\n}\n")

NATIVE = r"""
static int g_writes=0,g_tags=0,g_notifiers=0,g_reset_single=0,g_reset_hierarchy=0;
static int g_remaps=0,g_deletes=0,g_resyncs=0,g_creates=0,g_hierarchy_creates=0;
static int g_make_locals=0,g_metadata_locals=0,g_newptr_clears=0,g_make_local_flags=0;
static int g_remap_flags=0,g_last_notifier=0;
static bool g_make_local_copy=true;
static ID *g_expected_remap=nullptr,*g_last_new_id=nullptr,*g_last_cleared=nullptr;
static bool g_allow_owner=false,g_last_system=false,g_last_enforce=false,g_last_editable=false;
static ID *g_result_id=nullptr,*g_last_id=nullptr,*g_last_hint=nullptr;
static Scene *g_last_scene=nullptr;static ViewLayer *g_last_layer=nullptr;
static Collection *g_last_residual=nullptr;
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
static void native_write(Main *main,ID *id) {
  assert(main&&id);assert(g_allow_owner||!has_owner(main));++g_writes;g_last_id=id;
}
static void BKE_main_id_tag_all(Main *main,int,bool) {
  assert(g_allow_owner||!has_owner(main));++g_tags;
}
static ID *BKE_lib_override_library_create_from_id(Main *main,ID *id,bool) {
  native_write(main,id);++g_creates;return g_result_id;
}
static void BKE_lib_override_library_create(Main *main,Scene *scene,ViewLayer *layer,
    void*,ID *id,ID *root,ID *hint,ID **result,bool editable) {
  assert(id==root);native_write(main,id);++g_hierarchy_creates;
  g_last_scene=scene;g_last_layer=layer;g_last_hint=hint;g_last_editable=editable;*result=g_result_id;
}
static void BKE_lib_override_library_id_hierarchy_reset(Main *main,ID *id,bool system) {
  native_write(main,id);++g_reset_hierarchy;g_last_system=system;
}
static void BKE_lib_override_library_id_reset(Main *main,ID *id,bool system) {
  native_write(main,id);++g_reset_single;g_last_system=system;
}
static void BKE_lib_override_library_delete(Main *main,ID *id) {
  native_write(main,id);++g_deletes;
}
static void BKE_libblock_remap(Main *main,ID *id,ID *reference,int flags) {
  assert(reference==(g_expected_remap ? g_expected_remap : id->override_library->reference));
  native_write(main,id);++g_remaps;g_last_new_id=reference;g_remap_flags=flags;
}
static void BKE_lib_id_make_local(Main *main,ID *id,int flags) {
  native_write(main,id);++g_make_locals;g_make_local_flags=flags;
  if(g_make_local_copy)id->newid=g_result_id;
  else id->lib=nullptr;
}
static void BKE_lib_override_library_make_local(Main *main,ID *id) {
  assert(main&&id);++g_metadata_locals;id->override_library=nullptr;
}
static void BKE_id_newptr_and_tag_clear(ID *id) {
  // Pinned BKE_id_newptr_and_tag_clear clears the target's NEW tag, not
  // self's tag, and has no state write when the old newid is null.
  assert(id);++g_newptr_clears;g_last_cleared=id;
  if(id->newid){id->newid->tag &= ~ID_TAG_NEW;id->newid=nullptr;}
}
static void BKE_id_delete(Main *main,ID *id) {native_write(main,id);++g_deletes;}
static bool BKE_lib_override_library_resync(Main *main,Scene *scene,ViewLayer *layer,
    ID *root,Collection *residual,bool enforce,BlendFileReadReport *reports) {
  assert(reports&&reports->reports);native_write(main,root);++g_resyncs;
  g_last_scene=scene;g_last_layer=layer;g_last_residual=residual;g_last_enforce=enforce;return true;
}
static void WM_main_add_notifier(int event,void*) {++g_notifiers;g_last_notifier=event;}
"""

TEST_SUPPORT = r"""
struct Fixture {
  Main main,foreign;wmWindowManager wm;wmWindow win,second;wmEventHandler_Op owner,other_owner;
  bContext C;Library library,other_library;ID linked,overridden,reference,root,created,hint;
  IDOverrideLibrary override,other_override;Scene scene;ViewLayer layer;Collection residual;
  ReportList reports;
  Fixture() {
    wm.id.session_uid=1;wm.windows.first=&win;win.winid=10;win.runtime=&win;
    main.wm.first=&wm;G_MAIN=&main;C={&main,&wm,&win,nullptr,nullptr};
    g_cancel_ok=true;g_change_context=g_replace_main=g_spawn=false;
    g_remove_foreign_window=g_remove_foreign_manager=false;g_cancel_calls=0;
    g_context_allocs=g_context_frees=0;g_original=&C;g_other_main=&foreign;
    g_cancel_hook=nullptr;g_spawn_window=nullptr;g_spawned={};
    library.id.session_uid=100;other_library.id.session_uid=101;
    linked.session_uid=200;linked.lib=&library;
    overridden.session_uid=201;reference.session_uid=202;reference.lib=&library;
    root.session_uid=203;created.session_uid=204;hint.session_uid=205;
    override.reference=&reference;override.hierarchy_root=&root;overridden.override_library=&override;
    scene.id.session_uid=300;scene.view_layers.first=&layer;residual.id.session_uid=400;
    main.ids={&library.id,&other_library.id,&linked,&overridden,&reference,&root,&created,&hint,
              &scene.id,&residual.id};foreign.ids=main.ids;
    g_writes=g_tags=g_notifiers=g_reset_single=g_reset_hierarchy=0;
    g_remaps=g_deletes=g_resyncs=g_creates=g_hierarchy_creates=0;
    g_make_locals=g_metadata_locals=g_newptr_clears=g_make_local_flags=0;
    g_remap_flags=g_last_notifier=0;g_make_local_copy=true;
    g_expected_remap=g_last_new_id=g_last_cleared=nullptr;
    g_allow_owner=false;g_result_id=&created;g_last_id=g_last_hint=nullptr;
    g_last_scene=nullptr;g_last_layer=nullptr;g_last_residual=nullptr;
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
static Fixture *g_fixture=nullptr;
enum Mutation {None,RemoveID,IDUID,IDType,LinkedLibrary,LibraryUID,RemoveLibrary,
  OverrideAddress,OverrideFlag,OverrideReference,ReferenceUID,RemoveReference,
  OverrideRoot,RootUID,RemoveRoot,ClearOverride,ClearReference,SceneUID,RemoveScene,
  RemoveLayer,ResidualUID,HintUID,HintType,HintLibrary,RemoveHint,
  LibraryType,NewptrNull,NewptrChanged,NewptrUID,UnlinkPrimary,Overridable,Context,MainReplace};
static Mutation g_mutation=None;
static void mutation_hook() {
  Fixture &f=*g_fixture;
  auto remove=[&](ID *id) {f.main.ids.erase(std::remove(f.main.ids.begin(),f.main.ids.end(),id),f.main.ids.end());};
  switch(g_mutation) {
    case None:break;
    case RemoveID:remove(&f.overridden);remove(&f.linked);break;
    case IDUID:++f.overridden.session_uid;++f.linked.session_uid;break;
    case IDType:f.overridden.name[0]='Z';f.linked.name[0]='Z';break;
    case LinkedLibrary:f.linked.lib=&f.other_library;break;
    case LibraryUID:++f.library.id.session_uid;break;
    case RemoveLibrary:remove(&f.library.id);break;
    case OverrideAddress:f.overridden.override_library=&f.other_override;break;
    case OverrideFlag:f.override.flag^=2;break;
    case OverrideReference:f.override.reference=&f.hint;break;
    case ReferenceUID:++f.reference.session_uid;break;
    case RemoveReference:remove(&f.reference);break;
    case OverrideRoot:f.override.hierarchy_root=&f.hint;break;
    case RootUID:++f.root.session_uid;break;
    case RemoveRoot:remove(&f.root);break;
    case ClearOverride:f.overridden.override_library=nullptr;break;
    case ClearReference:f.override.reference=nullptr;break;
    case SceneUID:++f.scene.id.session_uid;break;
    case RemoveScene:remove(&f.scene.id);break;
    case RemoveLayer:f.scene.view_layers.first=nullptr;break;
    case ResidualUID:++f.residual.id.session_uid;break;
    case HintUID:++f.hint.session_uid;break;
    case HintType:f.hint.name[0]='Z';break;
    case HintLibrary:f.hint.lib=&f.other_library;break;
    case RemoveHint:remove(&f.hint);break;
    case LibraryType:f.library.id.name[0]='Z';break;
    case NewptrNull:f.linked.newid=nullptr;break;
    case NewptrChanged:f.linked.newid=&f.hint;break;
    case NewptrUID:++f.root.session_uid;break;
    case UnlinkPrimary:f.linked.lib=nullptr;break;
    case Overridable:f.linked.tag &= ~ID_TAG_EXTERN;break;
    case Context:f.C.region=reinterpret_cast<ARegion*>(uintptr_t(123));break;
    case MainReplace:G_MAIN=&f.foreign;break;
  }
}
static void mutate(Fixture &f,Mutation mutation) {
  g_fixture=&f;g_mutation=mutation;g_cancel_hook=mutation_hook;
}
static void assert_no_write(const Fixture &f) {
  assert(g_writes==0&&g_tags==0&&g_notifiers==0);
  assert(f.reports.errors>0);
}
"""


def source_with_main(main):
    # The fixtures compile all seven actual consumers each time. Taking volatile
    # addresses prevents the compiler from discarding consumers absent in this
    # case, while preserving -Werror for source signature/narrowing mistakes.
    anchors = "static void fixture_emit_consumers(){\n" + "\n".join(
        f"volatile auto consumer{i}=&{name};(void)consumer{i};"
        for i, name in enumerate(CALLBACK_NAMES + ("mutate", "assert_no_write", "BKE_libblock_find_session_uid", "WM_event_ipad_pencil_paint_owner_teardown_next"))
    ) + "\n}\n"
    main = re.sub(r"int main\(\)\s*\{", "int main(){fixture_emit_consumers();", main, count=1)
    return PREFIX + WM_OWNER_NEXT + NATIVE + HELPERS + "\n".join(CALLBACKS) + TEST_SUPPORT + anchors + main


class PencilRNAOverrideOwnerTeardownTests(unittest.TestCase):
    def run_cpp(self, main):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(source_with_main(main))

    def test_native_no_owner_and_optional_arguments_preserve_api_behavior(self):
        self.run_cpp(r"""
int main() {
  for(int context=0;context<4;++context) {
    Fixture f;bContext *C=context==0?nullptr:&f.C;
    if(context==0)f.main.wm.first=nullptr;
    if(context==3)f.C.win=nullptr;
    if(context==1)f.C.wm=nullptr,f.C.win=nullptr;
    assert(rna_ID_override_create(&f.linked,&f.main,C,true)==&f.created);
    assert(g_creates==1&&g_tags==2&&g_cancel_calls==0);
    assert(rna_ID_override_hierarchy_create(&f.linked,&f.main,C,&f.scene,&f.layer,nullptr,true)==&f.created);
    assert(g_hierarchy_creates==1&&g_last_hint==nullptr&&g_last_editable);
    rna_ID_override_library_reset(&f.overridden,&f.override,&f.main,C,&f.reports,false,true);
    assert(g_reset_single==1&&g_last_system);
    rna_ID_override_library_reset(&f.overridden,&f.override,&f.main,C,&f.reports,true,false);
    assert(g_reset_hierarchy==1&&!g_last_system);
    assert(rna_ID_override_library_resync(&f.overridden,&f.override,&f.main,C,&f.reports,
                                        &f.scene,nullptr,nullptr,true,true));
    assert(g_resyncs==1&&g_last_id==&f.root&&g_last_layer==nullptr&&g_last_residual==nullptr&&g_last_enforce);
    rna_ID_override_library_destroy(&f.overridden,&f.override,&f.main,C,&f.reports,false);
    assert(g_remaps==1&&g_deletes==1);
    rna_ID_override_library_destroy(&f.overridden,&f.override,&f.main,C,&f.reports,true);
    assert(g_deletes==2&&f.reports.errors==0&&g_cancel_calls==0);
  }
}
""")

    def test_owner_retirement_precedes_each_actual_native_callback_write(self):
        self.run_cpp(r"""
int main() {
  for(int action=0;action<5;++action) {
    Fixture f;f.add_owner(true);
    switch(action) {
      case 0:assert(rna_ID_override_create(&f.linked,&f.main,&f.C,true)==&f.created);break;
      case 1:assert(rna_ID_override_hierarchy_create(&f.linked,&f.main,&f.C,&f.scene,&f.layer,nullptr,false)==&f.created);break;
      case 2:rna_ID_override_library_reset(&f.overridden,&f.override,&f.main,&f.C,&f.reports,true,true);break;
      case 3:rna_ID_override_library_destroy(&f.overridden,&f.override,&f.main,&f.C,&f.reports,false);break;
      case 4:assert(rna_ID_override_library_resync(&f.overridden,&f.override,&f.main,&f.C,&f.reports,
                     &f.scene,nullptr,nullptr,false,false));break;
    }
    assert(g_cancel_calls==2&&!has_owner(&f.main)&&g_writes>0&&f.reports.errors==0);
    assert(g_context_allocs==2&&g_context_frees==2);
  }
}
""")

    def test_missing_ui_context_refuses_owner_without_cancel_or_writes(self):
        self.run_cpp(r"""
int main() {
  for(int context=0;context<3;++context) {
    for(int action=0;action<5;++action) {
      Fixture f;f.add_owner();bContext *C=context==0?nullptr:&f.C;
      if(context==1)f.C.wm=nullptr,f.C.win=nullptr;
      if(context==2)f.C.win=nullptr;
      switch(action) {
        case 0:assert(!rna_ID_override_create(&f.linked,&f.main,C,true));break;
        case 1:assert(!rna_ID_override_hierarchy_create(&f.linked,&f.main,C,&f.scene,&f.layer,nullptr,false));break;
        case 2:rna_ID_override_library_reset(&f.overridden,&f.override,&f.main,C,&f.reports,true,false);break;
        case 3:rna_ID_override_library_destroy(&f.overridden,&f.override,&f.main,C,&f.reports,false);break;
        case 4:assert(!rna_ID_override_library_resync(&f.overridden,&f.override,&f.main,C,&f.reports,
                      &f.scene,&f.layer,nullptr,false,false));break;
      }
      assert(g_cancel_calls==0&&has_owner(&f.main)&&g_writes==0&&g_tags==0&&g_notifiers==0);
      if(action>=2)assert(f.reports.errors>0);
    }
  }
}
""")

    def test_creation_without_remap_and_foreign_main_do_not_drain_active_owners(self):
        self.run_cpp(r"""
int main() {
  {
    Fixture f;f.add_owner();g_allow_owner=true;
    assert(rna_ID_override_create(&f.linked,&f.main,nullptr,false)==&f.created);
    assert(g_creates==1&&g_tags==0&&g_cancel_calls==0&&has_owner(&f.main));
  }
  {
    Fixture f;f.add_owner();
    assert(rna_ID_override_create(&f.linked,&f.foreign,nullptr,true)==&f.created);
    assert(g_cancel_calls==0&&has_owner(&f.main)&&g_writes==1);
    rna_ID_override_library_reset(&f.overridden,&f.override,&f.foreign,nullptr,&f.reports,false,false);
    assert(g_reset_single==1&&g_cancel_calls==0&&has_owner(&f.main));
  }
}
""")

    def test_cancel_callback_identity_and_override_changes_refuse_mutation(self):
        self.run_cpp(r"""
int main() {
  for(Mutation mutation:{RemoveID,IDUID,IDType,LibraryUID,RemoveLibrary,OverrideAddress,
      OverrideFlag,OverrideReference,ReferenceUID,RemoveReference,OverrideRoot,RootUID,
      RemoveRoot,ClearOverride,ClearReference,Context,MainReplace}) {
    for(int action=0;action<3;++action) {
      Fixture f;f.add_owner();mutate(f,mutation);
      switch(action) {
        case 0:rna_ID_override_library_reset(&f.overridden,&f.override,&f.main,&f.C,&f.reports,true,false);break;
        case 1:rna_ID_override_library_destroy(&f.overridden,&f.override,&f.main,&f.C,&f.reports,false);break;
        case 2:assert(!rna_ID_override_library_resync(&f.overridden,&f.override,&f.main,&f.C,&f.reports,
                      &f.scene,&f.layer,nullptr,false,true));break;
      }
      assert(g_cancel_calls==1);assert_no_write(f);
    }
  }
  for(Mutation mutation:{RemoveID,IDUID,IDType,LinkedLibrary,LibraryUID,RemoveLibrary,Overridable,Context,MainReplace}) {
    Fixture f;f.add_owner();mutate(f,mutation);
    assert(!rna_ID_override_create(&f.linked,&f.main,&f.C,true));
    assert(g_cancel_calls==1&&g_writes==0&&g_tags==0&&g_notifiers==0);
  }
}
""")

    def test_scene_layer_and_related_id_changes_refuse_actual_consumers(self):
        self.run_cpp(r"""
int main() {
  for(Mutation mutation:{SceneUID,RemoveScene,RemoveLayer,HintUID}) {
    Fixture f;f.add_owner();mutate(f,mutation);
    assert(!rna_ID_override_hierarchy_create(&f.linked,&f.main,&f.C,&f.scene,&f.layer,&f.hint,false));
    assert(g_cancel_calls==1&&g_writes==0&&g_tags==0&&g_notifiers==0);
  }
  for(Mutation mutation:{SceneUID,RemoveScene,RemoveLayer,ResidualUID}) {
    Fixture f;f.add_owner();mutate(f,mutation);
    assert(!rna_ID_override_library_resync(&f.overridden,&f.override,&f.main,&f.C,&f.reports,
                  &f.scene,&f.layer,&f.residual,false,false));
    assert(g_cancel_calls==1);assert_no_write(f);
  }
  {
    Fixture f;f.add_owner();g_cancel_ok=false;
    rna_ID_override_library_destroy(&f.overridden,&f.override,&f.main,&f.C,&f.reports,false);
    assert(g_cancel_calls==1&&has_owner(&f.main));assert_no_write(f);
  }
}
""")

    def test_native_cancel_can_free_an_input_before_rna_reacquisition(self):
        self.run_cpp(r"""
static Main *g_delete_main=nullptr;static ID *g_delete_input=nullptr;
static void delete_input_hook() {
  auto &ids=g_delete_main->ids;
  ids.erase(std::remove(ids.begin(),ids.end(),g_delete_input),ids.end());
  delete g_delete_input;g_delete_input=nullptr;
}
int main() {
  for(int input=0;input<3;++input) {
    Fixture f;f.add_owner();ID *heap=new ID(ID_OB,700);heap->lib=&f.library;
    f.main.ids.push_back(heap);g_delete_main=&f.main;g_delete_input=heap;
    g_cancel_hook=delete_input_hook;
    if(input==0) {
      assert(!rna_ID_override_create(heap,&f.main,&f.C,true));
      assert(g_writes==0&&g_tags==0&&g_notifiers==0);
    }
    if(input==1) {
      f.override.reference=heap;
      rna_ID_override_library_reset(&f.overridden,&f.override,&f.main,&f.C,&f.reports,true,false);
      assert_no_write(f);
    }
    if(input==2) {
      f.override.hierarchy_root=heap;
      assert(!rna_ID_override_library_resync(&f.overridden,&f.override,&f.main,&f.C,&f.reports,
                         &f.scene,&f.layer,nullptr,false,true));
      assert_no_write(f);
    }
    assert(g_cancel_calls==1&&g_delete_input==nullptr&&!has_owner(&f.main));
  }
}
""")

    def test_non_apple_callbacks_retain_unguarded_native_behavior(self):
        source = source_with_main(r"""
int main() {
  Fixture f;f.add_owner();g_allow_owner=true;
  f.linked.session_uid=0;f.library.id.session_uid=0;
  assert(rna_ID_override_create(&f.linked,&f.main,nullptr,true)==&f.created);
  assert(rna_ID_override_hierarchy_create(&f.linked,&f.main,nullptr,&f.scene,&f.layer,nullptr,true)==&f.created);
  rna_ID_override_library_reset(&f.overridden,&f.override,&f.main,nullptr,&f.reports,true,true);
  rna_ID_override_library_destroy(&f.overridden,&f.override,&f.main,nullptr,&f.reports,false);
  assert(rna_ID_override_library_resync(&f.overridden,&f.override,&f.main,nullptr,&f.reports,
                      &f.scene,nullptr,nullptr,false,false));
  g_expected_remap=&f.hint;
  rna_ID_user_remap(&f.linked,&f.main,nullptr,&f.hint);
  assert(rna_ID_make_local(&f.linked,&f.main,nullptr,true,false,true)==&f.created);
  assert(g_make_locals==1&&g_newptr_clears==1&&g_last_new_id==&f.hint);
  assert(g_cancel_calls==0&&has_owner(&f.main)&&g_creates==1&&g_hierarchy_creates==1&&
         g_reset_hierarchy==1&&g_remaps==2&&g_deletes==1&&g_resyncs==1&&f.reports.errors==0);
}
""").replace("#define WITH_APPLE_CROSSPLATFORM\n", "")
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(source)

    def test_user_remap_preserves_native_type_admission_and_context_free_success(self):
        self.run_cpp(r"""
int main() {
  for(int admission=0;admission<2;++admission) {
    Fixture f;f.add_owner();
    ID *new_id=admission==0?&f.linked:&f.hint;
    if(admission==1)f.hint.name[0]='G',f.hint.name[1]='R';
    rna_ID_user_remap(&f.linked,&f.main,&f.C,new_id);
    assert(g_cancel_calls==0&&has_owner(&f.main)&&g_writes==0&&g_notifiers==0);
  }
  for(int context=0;context<3;++context) {
    Fixture f;bContext *C=context==0?nullptr:&f.C;
    if(context==1)f.C.wm=nullptr,f.C.win=nullptr;
    if(context==2)f.add_owner(true);
    g_expected_remap=&f.hint;
    rna_ID_user_remap(&f.linked,&f.main,C,&f.hint);
    assert(g_remaps==1&&g_last_id==&f.linked&&g_last_new_id==&f.hint);
    assert(g_remap_flags==(ID_REMAP_SKIP_INDIRECT_USAGE|ID_REMAP_SKIP_NEVER_NULL_USAGE));
    assert(g_notifiers==1&&g_last_notifier==NC_WINDOW&&!has_owner(&f.main));
    assert(g_cancel_calls==(context==2?2:0));
  }
  {
    Fixture f;f.add_owner();g_expected_remap=&f.hint;
    rna_ID_user_remap(&f.linked,&f.foreign,nullptr,&f.hint);
    assert(g_remaps==1&&g_cancel_calls==0&&has_owner(&f.main));
  }
}
""")

    def test_user_remap_refuses_stale_source_target_and_missing_owner_context(self):
        self.run_cpp(r"""
int main() {
  for(Mutation mutation:{RemoveID,IDUID,IDType,LinkedLibrary,LibraryUID,LibraryType,
                         RemoveLibrary,HintUID,HintType,HintLibrary,RemoveHint,Context,MainReplace}) {
    Fixture f;f.add_owner(true);mutate(f,mutation);g_expected_remap=&f.hint;
    rna_ID_user_remap(&f.linked,&f.main,&f.C,&f.hint);
    assert(g_cancel_calls==1&&g_remaps==0&&g_writes==0&&g_notifiers==0);
    assert(f.second.modalhandlers.first==&f.other_owner);
  }
  for(int refusal=0;refusal<3;++refusal) {
    Fixture f;f.add_owner();g_expected_remap=&f.hint;bContext *C=&f.C;
    if(refusal==0)C=nullptr;
    if(refusal==1)f.C.wm=nullptr,f.C.win=nullptr;
    if(refusal==2)g_cancel_ok=false;
    rna_ID_user_remap(&f.linked,&f.main,C,&f.hint);
    assert(g_cancel_calls==(refusal==2?1:0)&&has_owner(&f.main));
    assert(g_remaps==0&&g_writes==0&&g_notifiers==0);
  }
}
""")

    def test_linked_make_local_uses_fresh_native_result_and_clears_newptr_once(self):
        self.run_cpp(r"""
int main() {
  for(int copy=0;copy<2;++copy) {
    for(int cleanup=0;cleanup<2;++cleanup) {
      Fixture f;f.add_owner(true);g_make_local_copy=bool(copy);
      f.linked.tag|=ID_TAG_NEW;f.created.tag|=ID_TAG_NEW;
      if(cleanup)f.created.override_library=&f.override;
      ID *result=rna_ID_make_local(&f.linked,&f.main,&f.C,false,bool(cleanup),bool(cleanup));
      assert(result==(copy?&f.created:&f.linked));
      assert(g_make_locals==1&&g_cancel_calls==2&&!has_owner(&f.main));
      assert(g_make_local_flags==(cleanup?LIB_ID_MAKELOCAL_ASSET_DATA_CLEAR:0));
      assert(g_newptr_clears==1&&g_last_cleared==&f.linked&&f.linked.newid==nullptr);
      assert(f.linked.tag&ID_TAG_NEW);
      if(copy)assert((f.created.tag&ID_TAG_NEW)==0);
      assert(g_metadata_locals==(copy&&cleanup?1:0));
      if(copy&&cleanup)assert(f.created.override_library==nullptr);
    }
  }
  for(int context=0;context<2;++context) {
    Fixture f;bContext *C=context?&f.C:nullptr;
    if(context)f.C.wm=nullptr,f.C.win=nullptr;
    assert(rna_ID_make_local(&f.linked,&f.main,C,true,false,false)==&f.created);
    assert(g_cancel_calls==0&&g_make_locals==1&&g_make_local_flags==0&&g_newptr_clears==1);
  }
  {
    Fixture f;f.add_owner();
    assert(rna_ID_make_local(&f.linked,&f.foreign,nullptr,true,false,true)==&f.created);
    assert(g_cancel_calls==0&&has_owner(&f.main)&&g_make_locals==1&&g_newptr_clears==1);
  }
}
""")

    def test_linked_make_local_preexisting_newid_is_rebound_or_refused_before_cleanup(self):
        self.run_cpp(r"""
int main() {
  {
    Fixture f;f.add_owner();f.linked.newid=&f.root;f.linked.tag|=ID_TAG_NEW;
    assert(rna_ID_make_local(&f.linked,&f.main,&f.C,true,false,false)==&f.created);
    assert(g_cancel_calls==1&&g_make_locals==1&&g_newptr_clears==1&&f.linked.newid==nullptr);
    assert(g_last_cleared==&f.linked&&g_result_id==&f.created&&f.root.session_uid==203);
  }
  for(Mutation mutation:{NewptrNull,NewptrChanged,NewptrUID,UnlinkPrimary}) {
    Fixture f;f.add_owner(true);f.linked.newid=&f.root;f.linked.tag|=ID_TAG_NEW;
    mutate(f,mutation);
    assert(!rna_ID_make_local(&f.linked,&f.main,&f.C,true,true,true));
    const bool early=mutation==NewptrUID||mutation==UnlinkPrimary;
    assert(g_cancel_calls==(early?1:2)&&g_make_locals==0&&g_newptr_clears==0&&g_metadata_locals==0);
    assert(f.linked.tag&ID_TAG_NEW);
    assert(bool(f.second.modalhandlers.first)==early);
  }
  {
    Fixture f;f.add_owner();assert(f.linked.newid==nullptr);mutate(f,NewptrChanged);
    assert(!rna_ID_make_local(&f.linked,&f.main,&f.C,true,false,false));
    assert(g_cancel_calls==1&&g_make_locals==0&&g_newptr_clears==0&&f.linked.newid==&f.hint);
  }
}
""")

    def test_make_local_local_metadata_branch_does_not_cancel_paint(self):
        self.run_cpp(r"""
int main() {
  {
    Fixture f;f.add_owner();f.overridden.tag|=ID_TAG_NEW;
    assert(rna_ID_make_local(&f.overridden,&f.main,nullptr,false,false,false)==&f.overridden);
    assert(g_cancel_calls==0&&has_owner(&f.main)&&g_make_locals==0&&g_metadata_locals==1);
    assert(f.overridden.override_library==nullptr&&g_newptr_clears==1);
  }
  {
    Fixture f;f.add_owner();f.root.newid=&f.created;f.created.override_library=&f.override;
    assert(rna_ID_make_local(&f.root,&f.main,nullptr,true,true,true)==&f.created);
    assert(g_cancel_calls==0&&has_owner(&f.main)&&g_make_locals==0&&g_metadata_locals==1);
    assert(g_newptr_clears==1&&f.root.newid==nullptr&&f.created.override_library==nullptr);
  }
}
""")

    def test_linked_make_local_refuses_changes_before_native_data_or_cleanup(self):
        self.run_cpp(r"""
int main() {
  for(Mutation mutation:{RemoveID,IDUID,IDType,LinkedLibrary,LibraryUID,LibraryType,
                         RemoveLibrary,Context,MainReplace}) {
    Fixture f;f.add_owner(true);mutate(f,mutation);
    f.linked.newid=&f.root;f.linked.tag|=ID_TAG_NEW;
    assert(!rna_ID_make_local(&f.linked,&f.main,&f.C,true,true,true));
    assert(g_cancel_calls==1&&g_make_locals==0&&g_newptr_clears==0&&g_metadata_locals==0);
    assert(f.linked.newid==&f.root&&(f.linked.tag&ID_TAG_NEW));
    assert(f.second.modalhandlers.first==&f.other_owner);
  }
  for(int refusal=0;refusal<3;++refusal) {
    Fixture f;f.add_owner();bContext *C=&f.C;
    if(refusal==0)C=nullptr;
    if(refusal==1)f.C.wm=nullptr,f.C.win=nullptr;
    if(refusal==2)g_cancel_ok=false;
    assert(!rna_ID_make_local(&f.linked,&f.main,C,true,false,false));
    assert(g_cancel_calls==(refusal==2?1:0)&&has_owner(&f.main));
    assert(g_make_locals==0&&g_newptr_clears==0&&g_metadata_locals==0);
  }
}
""")

    def test_pinned_generator_and_registration_match_real_callback_types(self):
        fixture = Path(__file__).parent / "tests/pencil_rna_function_call_order.cc"
        generator = fixture.read_text(encoding="utf-8")
        self.assertEqual(hashlib.sha256(generator.encode()).hexdigest(),
                         "4d14f4f49655f553966e42d2422d739339cb9879281df0aafe05df776b37efae")
        registrations = {
            "override_create": (CALLBACK_NAMES[0], "ID*", "ID*"),
            "override_hierarchy_create": (CALLBACK_NAMES[1], "ID*", "ID*"),
            "reset": (CALLBACK_NAMES[2], "void", "IDOverrideLibrary*"),
            "destroy": (CALLBACK_NAMES[3], "void", "IDOverrideLibrary*"),
            "resync": (CALLBACK_NAMES[4], "bool", "IDOverrideLibrary*"),
            "user_remap": (CALLBACK_NAMES[5], "void", "ID*"),
            "make_local": (CALLBACK_NAMES[6], "ID*", "ID*"),
        }
        flag_bits = {"FUNC_USE_SELF_ID": 1, "FUNC_NO_SELF": 2, "FUNC_USE_SELF_TYPE": 4,
                     "FUNC_USE_MAIN": 8, "FUNC_USE_CONTEXT": 16, "FUNC_USE_REPORTS": 32}
        checks, emitted_checks = [], []
        for name, (callback, result, self_type) in registrations.items():
            marker = f'func = RNA_def_function(srna, "{name}", "{callback}");'
            self.assertIn(marker, RNA)
            body = RNA.split(marker, 1)[1].split("func = RNA_def_function(", 1)[0]
            flag_match = re.search(r'RNA_def_function_flag\(func, ([^;]+)\);', body)
            self.assertIsNotNone(flag_match)
            flags = set(re.findall(r"FUNC_\w+", flag_match[1]))
            self.assertTrue({"FUNC_USE_MAIN", "FUNC_USE_CONTEXT"}.issubset(flags))
            self.assertFalse(flags - flag_bits.keys())
            parameters, tokens = [], []
            if "FUNC_USE_SELF_ID" in flags:
                parameters.append("ID*")
                tokens.append("_selfid")
            parameters.append(self_type)
            tokens.append("_self")
            for flag, kind, token in (("FUNC_USE_MAIN", "Main*", "CTX_data_main(C)"),
                                      ("FUNC_USE_CONTEXT", "bContext*", "C"),
                                      ("FUNC_USE_REPORTS", "ReportList*", "reports")):
                if flag in flags:
                    parameters.append(kind)
                    tokens.append(token)
            # Exact definition order supplies ordinary inputs; only the property
            # marked RNA_def_function_return is excluded, as in makesrna.
            properties = list(re.finditer(
                r'RNA_def_(pointer|boolean)\(\s*func,\s*"([^"]+)"(?:,\s*"([^"]+)")?', body))
            returns = list(re.finditer(r"RNA_def_function_return\(func, parm\)", body))
            returned = {max((prop for prop in properties if prop.start() < ret.start()),
                            key=lambda prop: prop.start()).start() for ret in returns}
            for prop in properties:
                if prop.start() not in returned:
                    parameters.append(prop[3] + "*" if prop[1] == "pointer" else "bool")
            if name in ("reset", "destroy", "resync"):
                self.assertTrue({"FUNC_USE_SELF_ID", "FUNC_USE_REPORTS"}.issubset(flags))
            else:
                self.assertNotIn("FUNC_USE_SELF_ID", flags)
            checks.append("static_assert(std::is_same_v<decltype(&" + callback + ")," + result + "(*)(" + ",".join(parameters) + ")>);")
            emitted_checks.append('assert(generated_prefix(' + str(sum(flag_bits[f] for f in flags)) +
                                  ')=="' + ", ".join(tokens) + '");')
        harness = r"""
#include <cstdio>
#include <string>
enum {FUNC_USE_SELF_ID=1,FUNC_NO_SELF=2,FUNC_USE_SELF_TYPE=4,
      FUNC_USE_MAIN=8,FUNC_USE_CONTEXT=16,FUNC_USE_REPORTS=32};
static std::string generated_prefix(int flags) {
  FILE *f=nullptr;
#ifdef _MSC_VER
  assert(tmpfile_s(&f)==0);
#else
  f=tmpfile();
#endif
  assert(f);struct Function {int flag;} value{flags};auto *func=&value;
  int first=1;
""" + generator + r"""
  fflush(f);rewind(f);char bytes[256]{};size_t count=fread(bytes,1,sizeof(bytes)-1,f);
  fclose(f);return std::string(bytes,count);
}
"""
        self.run_cpp(harness + "\n".join(checks) + "\nint main(){Fixture f;" +
                     "".join(emitted_checks) +
                     "assert(rna_ID_override_create(&f.linked,&f.main,&f.C,false));}\n")
        metadata = function(RNA, "static void rna_ID_override_library_operations_update(")
        self.assertNotIn("paint_owner_teardown", metadata)
        self.assertNotIn("bContext *", metadata.split("{", 1)[0])


if __name__ == "__main__":
    unittest.main()
