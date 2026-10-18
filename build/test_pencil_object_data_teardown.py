"""Retain Object.data native semantics and the Object-UID WM retirement primitive.

The setter now uses the shared whole-assignment admission API. This narrow
fixture models that callback-free boundary as all-owner absence; the actual
API, owned producer, original identity, Debug frame and late update are run by
test_pencil_pointer_assignment_transaction.py. It no longer claims that the
borrowed Object.data setter itself cancels matching Object-UID owners.
"""
from test_compact_shelf import function
import test_ipad_panels
from test_touch_extrude import PIN_ROOT, changed_source
import unittest
from pathlib import Path
import subprocess
import tempfile

WM = changed_source("source/blender/windowmanager/intern/wm_event_system.cc")
RNA = changed_source("source/blender/makesrna/intern/rna_object.cc")
OBJECT_OWNER_HELPER = function(WM, "static bool wm_ipad_pencil_paint_object_uid_teardown(")
OBJECT_OWNER_API = function(WM, "bool WM_event_ipad_pencil_paint_object_teardown(")
DATA_SETTER = function(RNA, "static void rna_Object_data_set(")

HARNESS = r"""
#include <cassert>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <string>
#define WITH_APPLE_CROSSPLATFORM

struct Link { Link *next=nullptr; };
struct ListBase { Link *first=nullptr; };
#define LISTBASE_FOREACH(type, item, list) \
  for (type item=static_cast<type>((list)->first); item; \
       item=static_cast<type>(reinterpret_cast<Link *>(item)->next))
#define BLI_assert(value) assert(value)
#define OB_DATA_SUPPORT_ID(value) true
#define GS(name) static_cast<short>((static_cast<unsigned char>((name)[0]) << 8) | \
                                    static_cast<unsigned char>((name)[1]))

struct ID : Link {
  uint64_t session_uid=0;
  uint32_t tag=0;
  char name[64]{};
  int users=0;
};
struct Object : Link { ID id; int type=0; int mode=0; ID *data=nullptr; };
struct Mesh : ID {};
struct bArmature : ID {};
struct wmEventHandler : Link { int type=0; };
struct wmEventHandler_Op : wmEventHandler {
  uint64_t ipad_pencil_paint_serial=0;
  uint64_t ipad_pencil_operator_lifetime=0;
  uint64_t ipad_pencil_owner_values[19]{};
  bool registered=true;
};
struct wmWindow : Link { int winid=0; void *runtime=reinterpret_cast<void *>(1); ListBase handlers,modalhandlers; };
struct wmWindowManager : Link { ID id; ListBase windows; };
struct Main { ListBase objects,meshes,wm; };
struct bContext { Main *main=nullptr; wmWindowManager *wm=nullptr; wmWindow *win=nullptr; };
struct PointerRNA { void *data=nullptr; };
struct ReportList { std::string message; };
static constexpr int RPT_ERROR=2;
static void rna_Object_data_set(PointerRNA *,PointerRNA,ReportList *);
static Main *G_MAIN=nullptr;
constexpr int WM_HANDLER_TYPE_OP=7, OB_MODE_EDIT=1, OB_EMPTY=99, OB_MESH=1, OB_ARMATURE=2;
constexpr int ID_TAG_NO_MAIN=1;
constexpr short ID_IM=static_cast<short>('I'<<8|'M');
constexpr short ID_CU_LEGACY=static_cast<short>('C'<<8|'U');

static void append(ListBase &list,Link *item) { item->next=list.first; list.first=item; }
static void unlink(ListBase &list,Link *target) {
  Link *prior=nullptr,*item=list.first;
  while(item&&item!=target){prior=item;item=item->next;}
  if(!item)return;
  if(prior)prior->next=item->next;else list.first=item->next;
  item->next=nullptr;
}
static bContext *CTX_create(){return new bContext{};}
static void CTX_data_main_set(bContext *C,Main *main){C->main=main;}
static void CTX_wm_manager_set(bContext *C,wmWindowManager *wm){C->wm=wm;}
static void CTX_wm_window_set(bContext *C,wmWindow *win){C->win=win;}
static void CTX_free(bContext *C){delete C;}
static bool refuse_native_teardown=false,replace_main_on_teardown=false;
static bool mutate_data_on_teardown=false,reenter_setter_on_teardown=false;
static int teardown_calls=0,assign_calls=0,mutation_order=0;
static Main replacement_main;
static Object *target_object=nullptr;
static ID *side_data=nullptr;
static std::string inner_report;
static bool owner_registered_in(const wmWindow *win,const wmEventHandler_Op *target) {
  for(Link *item=win->modalhandlers.first;item;item=item->next)if(item==target)return true;
  return false;
}
static bool wm_ipad_pencil_paint_handler_registered(wmWindow *win,wmEventHandler_Op *handler) {
  return win&&handler&&handler->registered&&owner_registered_in(win,handler);
}
static bool WM_event_ipad_pencil_paint_owner_teardown(
    bContext *C,wmWindow *win,const void *,const void *,uint64_t scene_uid,
    uint64_t object_uid,uint64_t) {
  assert(C&&C->main==G_MAIN&&C->wm&&C->win==win);
  ++teardown_calls;mutation_order=mutation_order*10+1;
  if(refuse_native_teardown)return false;
  for(Link *item=win->modalhandlers.first;item;) {
    Link *next=item->next;
    if(reinterpret_cast<wmEventHandler *>(item)->type==WM_HANDLER_TYPE_OP) {
      auto *op=reinterpret_cast<wmEventHandler_Op *>(item);
      if(op->ipad_pencil_paint_serial&&op->ipad_pencil_owner_values[7]==object_uid&&
         (!scene_uid||op->ipad_pencil_owner_values[6]==scene_uid))unlink(win->modalhandlers,item);
    }
    item=next;
  }
  if(reenter_setter_on_teardown) {
    reenter_setter_on_teardown=false;
    ReportList reports;
    PointerRNA ptr{target_object}; PointerRNA value{side_data};
    rna_Object_data_set(&ptr,value,&reports);
    inner_report=reports.message;
  }
  if(mutate_data_on_teardown)target_object->data=side_data;
  if(replace_main_on_teardown)G_MAIN=&replacement_main;
  return true;
}
static void BKE_report(ReportList *reports,int,const char *message) { if(reports)reports->message=message; }
static void id_us_min(ID *id){if(id)--id->users;}
static void id_us_plus(ID *id){if(id)++id->users;}
static void BKE_mesh_assign_object(Main *,Object *object,Mesh *mesh) {
  ++assign_calls;mutation_order=mutation_order*10+2;
  if(object->data)id_us_min(object->data);
  id_us_plus(mesh);
  object->data=mesh;
}
static void BKE_object_materials_sync_length(Main *,Object *,ID *){}
static void BKE_curve_type_test(Object *,bool){}
static void BKE_pose_rebuild(Main *,Object *,bArmature *,bool){}


// EXPLICIT NARROW ADMISSION BOUNDARY MODEL. Never calls cancellation, does not
// inspect self, and refuses every registered owner, including other objects.
// The actual implementation and original-context drain are tested separately.
static bool RNA_pointer_assignment_native_admit(const PointerRNA*,int profile,bool update,ReportList *reports){
  assert(profile==3&&!update);
  if(G_MAIN){
    LISTBASE_FOREACH(wmWindowManager*,wm,&G_MAIN->wm){
      LISTBASE_FOREACH(wmWindow*,win,&wm->windows){
        for(ListBase *list:{&win->handlers,&win->modalhandlers}){
          LISTBASE_FOREACH(wmEventHandler*,base,list){
            if(base->type==WM_HANDLER_TYPE_OP&&reinterpret_cast<wmEventHandler_Op*>(base)->ipad_pencil_paint_serial){
              BKE_report(reports,RPT_ERROR,"modeled borrowed admission refused");return false;
            }
          }
        }
      }
    }
    return true;
  }
  BKE_report(reports,RPT_ERROR,"modeled borrowed admission missing Main");return false;
}

/* ACTUAL_SOURCE */

static void reset(Main &main,wmWindowManager &wm,wmWindow &win,Object &object,Mesh &old_mesh,Mesh &new_mesh) {
  G_MAIN=&main; main.objects={}; main.meshes={}; main.wm={}; wm.windows={}; win.handlers={}; win.modalhandlers={};
  object={};old_mesh={};new_mesh={};wm={};win={};
  object.id.session_uid=10;std::snprintf(object.id.name,sizeof(object.id.name),"%s","OBCube");object.type=OB_MESH;object.data=&old_mesh;
  old_mesh.session_uid=20;std::snprintf(old_mesh.name,sizeof(old_mesh.name),"%s","MEMeshOld");old_mesh.users=1;
  new_mesh.session_uid=21;std::snprintf(new_mesh.name,sizeof(new_mesh.name),"%s","MEMeshNew");
  wm.id.session_uid=30;win.winid=40;append(main.objects,&object);append(main.meshes,&old_mesh);append(main.meshes,&new_mesh);
  append(wm.windows,&win);append(main.wm,&wm);
  refuse_native_teardown=false;replace_main_on_teardown=false;mutate_data_on_teardown=false;reenter_setter_on_teardown=false;
  teardown_calls=assign_calls=mutation_order=0;target_object=&object;side_data=&new_mesh;inner_report.clear();
}
[[maybe_unused]] static void add_owner(wmWindow &win,wmEventHandler_Op &owner,uint64_t object_uid,uint64_t scene_uid,uint64_t lifetime) {
  owner={};owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=1;owner.ipad_pencil_operator_lifetime=lifetime;
  owner.ipad_pencil_owner_values[6]=scene_uid;owner.ipad_pencil_owner_values[7]=object_uid;append(win.modalhandlers,&owner);
}
[[maybe_unused]] static void set_data(Object &object,ID *id,ReportList &reports) {
  PointerRNA ptr{&object},value{id};rna_Object_data_set(&ptr,value,&reports);
}
/* TEST_MAIN */
"""

class PencilObjectDataTeardownTests(unittest.TestCase):
    def _run(self, main):
        actual = "\n".join((OBJECT_OWNER_HELPER, OBJECT_OWNER_API, DATA_SETTER))
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(
            HARNESS.replace("/* ACTUAL_SOURCE */", actual).replace("/* TEST_MAIN */", main)
        )

    def test_exact_patch_applies_guard_inside_native_setter(self):
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / "patches/blender-ipad.patch").read_text(encoding="utf-8")
        marker = "diff --git a/source/blender/makesrna/intern/rna_object.cc b/source/blender/makesrna/intern/rna_object.cc\n"
        self.assertEqual(patch.count(marker), 1)
        section_start = patch.index(marker)
        section_end = patch.find("\ndiff --git ", section_start + len(marker))
        section = patch[section_start:] if section_end < 0 else patch[section_start:section_end + 1]
        rel = Path("source/blender/makesrna/intern/rna_object.cc")
        with tempfile.TemporaryDirectory(prefix="ipad-rna-object-patch-") as temporary:
            checkout = Path(temporary)
            target = checkout / rel
            target.parent.mkdir(parents=True)
            target.write_bytes((PIN_ROOT / rel).read_bytes())
            initialized = subprocess.run(["git", "init", "-q"], cwd=checkout, capture_output=True)
            self.assertEqual(initialized.returncode, 0, initialized.stderr.decode("utf-8", "replace"))
            applied = subprocess.run(
                ["git", "apply", "--whitespace=error-all", "-"],
                cwd=checkout,
                input=section.encode("utf-8"),
                capture_output=True,
            )
            self.assertEqual(applied.returncode, 0, applied.stderr.decode("utf-8", "replace"))
            source = target.read_text(encoding="utf-8")
        setter_start = source.index("static void rna_Object_data_set(")
        setter_open = source.index("{", setter_start)
        depth = 0
        setter_end = None
        for index in range(setter_open, len(source)):
            if source[index] == "{":
                depth += 1
            elif source[index] == "}":
                depth -= 1
                if depth == 0:
                    setter_end = index
                    break
        setter = source[setter_start:setter_end + 1]
        guard = setter.index("RNA_pointer_assignment_native_admit(ptr, 3, false, reports)")
        first_self_read = setter.index("Object *ob =")
        native_assignment = setter.index("BKE_mesh_assign_object")
        self.assertLess(guard, first_self_read)
        self.assertLess(first_self_read, native_assignment)
        self.assertNotIn("WM_event_ipad_pencil_paint_object_teardown", setter)

    def test_native_no_owner_assignment_refcounts_same_mesh_edit_and_null(self):
        self._run(r"""
int main(){for(int scenario=0;scenario<6;++scenario){
  Main main;wmWindowManager wm;wmWindow win;Object object;Mesh old_mesh,new_mesh;
  reset(main,wm,win,object,old_mesh,new_mesh);ReportList reports;
  ID *value=&new_mesh;
  if(scenario==1)value=&old_mesh;
  if(scenario==2)object.mode=OB_MODE_EDIT;
  if(scenario==3)value=nullptr;
  if(scenario==4)object.id.session_uid=0;
  if(scenario==5)unlink(main.objects,&object); // native non-Main/evaluated baseline
  set_data(object,value,reports);
  assert(teardown_calls==0&&reports.message.empty());
  if(scenario==2||scenario==3){
    assert(object.data==&old_mesh&&assign_calls==0&&old_mesh.users==1&&new_mesh.users==0);
  }else if(scenario==1){
    assert(object.data==&old_mesh&&assign_calls==1&&old_mesh.users==1&&new_mesh.users==0);
  }else{
    assert(object.data==&new_mesh&&assign_calls==1&&old_mesh.users==0&&new_mesh.users==1);
  }
}}
""")

    def test_borrowed_setter_refuses_all_owners_before_self_read_or_native_change(self):
        self._run(r"""
int main(){for(int scenario=0;scenario<7;++scenario){
  Main main;wmWindowManager wm;wmWindow first,second;Object object;Mesh old_mesh,new_mesh;
  reset(main,wm,first,object,old_mesh,new_mesh);wmEventHandler_Op owner;
  wmWindow *owner_win=&first;
  if(scenario==1){second.winid=41;append(wm.windows,&second);owner_win=&second;}
  add_owner(*owner_win,owner,scenario==2?999:10,50,103);
  if(scenario==3){unlink(owner_win->modalhandlers,&owner);append(owner_win->handlers,&owner);}
  if(scenario==4)object.mode=OB_MODE_EDIT;
  ReportList reports;PointerRNA ptr{scenario==6?reinterpret_cast<void*>(uintptr_t(1)):&object};
  PointerRNA value{scenario==5?&old_mesh:&new_mesh};
  rna_Object_data_set(&ptr,value,&reports);
  assert(assign_calls==0&&teardown_calls==0&&!reports.message.empty());
  assert(object.data==&old_mesh&&old_mesh.users==1&&new_mesh.users==0);
  assert(owner.ipad_pencil_paint_serial==1);
}}
""")

    def test_retained_object_uid_primitive_reacquires_windows_and_preserves_foreign_owner(self):
        self._run(r"""
int main(){
  Main main;wmWindowManager wm;wmWindow first,second;Object object,foreign;Mesh old_mesh,new_mesh;
  reset(main,wm,first,object,old_mesh,new_mesh);second.winid=41;append(wm.windows,&second);
  wmEventHandler_Op a,b,other;add_owner(first,a,10,50,101);add_owner(second,b,10,51,102);
  foreign.id.session_uid=11;append(main.objects,&foreign);add_owner(second,other,11,51,103);
  assert(WM_event_ipad_pencil_paint_object_teardown(&main,10));
  assert(teardown_calls==2&&assign_calls==0&&mutation_order==11);
  assert(!first.modalhandlers.first&&second.modalhandlers.first==&other);
  assert(object.data==&old_mesh&&old_mesh.users==1&&new_mesh.users==0);
}
""")

    def test_retained_object_uid_primitive_refuses_stale_context_and_preserves_callback_effects(self):
        self._run(r"""
int main(){for(int scenario=0;scenario<7;++scenario){
  Main main;wmWindowManager wm;wmWindow win;Object object,duplicate;Mesh old_mesh,new_mesh;
  reset(main,wm,win,object,old_mesh,new_mesh);wmEventHandler_Op owner;add_owner(win,owner,10,50,103);
  if(scenario==0)refuse_native_teardown=true;
  if(scenario==1)owner.registered=false;
  if(scenario==2){unlink(win.modalhandlers,&owner);append(win.handlers,&owner);}
  if(scenario==3)replace_main_on_teardown=true;
  if(scenario==4){duplicate.id.session_uid=10;append(main.objects,&duplicate);}
  if(scenario==5)mutate_data_on_teardown=true;
  if(scenario==6)object.id.session_uid=0;
  const bool ok=WM_event_ipad_pencil_paint_object_teardown(&main,10);
  assert(ok==(scenario==5));assert(assign_calls==0);
  if(scenario==0||scenario==3||scenario==5)assert(teardown_calls==1);else assert(teardown_calls==0);
  assert(object.data==(scenario==5?&new_mesh:&old_mesh));
  if(scenario==3)assert(G_MAIN==&replacement_main);
}}
""")
