"""Execute the Object.data RNA guard and native cross-window Pencil owner retirement."""
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
RNA_LOOKUPS = RNA.split(
    "#ifdef WITH_APPLE_CROSSPLATFORM\nstatic Object *rna_Object_main_find_by_uid", 1
)[1].split("#endif", 1)[0]
RNA_LOOKUPS = "#ifdef WITH_APPLE_CROSSPLATFORM\nstatic Object *rna_Object_main_find_by_uid" + RNA_LOOKUPS + "#endif\n"
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
constexpr short ID_ME=static_cast<short>('M'<<8|'E');
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
static ListBase *which_libbase(Main *main,short idcode) {
  if(idcode==static_cast<short>('O'<<8|'B'))return &main->objects;
  if(idcode==ID_ME)return &main->meshes;
  return nullptr;
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
static void add_owner(wmWindow &win,wmEventHandler_Op &owner,uint64_t object_uid,uint64_t scene_uid,uint64_t lifetime) {
  owner={};owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=1;owner.ipad_pencil_operator_lifetime=lifetime;
  owner.ipad_pencil_owner_values[6]=scene_uid;owner.ipad_pencil_owner_values[7]=object_uid;append(win.modalhandlers,&owner);
}
static void set_data(Object &object,ID *id,ReportList &reports) {
  PointerRNA ptr{&object},value{id};rna_Object_data_set(&ptr,value,&reports);
}
int main() {
  {
    Main main;wmWindowManager wm;wmWindow win;Object object;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
    ReportList reports;set_data(object,&new_mesh,reports);
    assert(object.data==&new_mesh&&assign_calls==1&&teardown_calls==0&&old_mesh.users==0&&new_mesh.users==1);
  }
  {
    Main main;wmWindowManager wm;wmWindow first,second;Object object;Mesh old_mesh,new_mesh;reset(main,wm,first,object,old_mesh,new_mesh);
    second.winid=41;append(wm.windows,&second);wmEventHandler_Op a,b;add_owner(first,a,10,50,101);add_owner(second,b,10,51,102);
    ReportList reports;set_data(object,&new_mesh,reports);
    assert(object.data==&new_mesh&&assign_calls==1&&teardown_calls==2&&mutation_order==112);
    assert(!first.modalhandlers.first&&!second.modalhandlers.first&&reports.message.empty());
  }
  {
    Main main;wmWindowManager wm;wmWindow win;Object object;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
    wmEventHandler_Op owner;add_owner(win,owner,10,50,103);refuse_native_teardown=true;
    ReportList reports;set_data(object,&new_mesh,reports);
    assert(object.data==&old_mesh&&assign_calls==0&&teardown_calls==1&&!reports.message.empty());
    assert(win.modalhandlers.first==&owner);
  }
  {
    Main main;wmWindowManager wm;wmWindow win;Object object;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
    wmEventHandler_Op owner;add_owner(win,owner,10,50,104);unlink(win.modalhandlers,&owner);append(win.handlers,&owner);
    ReportList reports;set_data(object,&new_mesh,reports);
    assert(object.data==&old_mesh&&assign_calls==0&&teardown_calls==0&&!reports.message.empty());
  }
  {
    Main main;wmWindowManager wm;wmWindow win;Object object;Mesh old_mesh,new_mesh,side_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
    side_mesh.session_uid=22;std::snprintf(side_mesh.name,sizeof(side_mesh.name),"%s","MEMeshSide");append(main.meshes,&side_mesh);
    wmEventHandler_Op owner;add_owner(win,owner,10,50,105);mutate_data_on_teardown=true;side_data=&side_mesh;
    ReportList reports;set_data(object,&new_mesh,reports);
    assert(object.data==&side_mesh&&assign_calls==0&&teardown_calls==1&&!reports.message.empty());
  }
  {
    Main main;wmWindowManager wm;wmWindow win;Object object;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
    wmEventHandler_Op owner;add_owner(win,owner,10,50,106);replace_main_on_teardown=true;
    ReportList reports;set_data(object,&new_mesh,reports);
    assert(object.data==&old_mesh&&assign_calls==0&&G_MAIN==&replacement_main&&!reports.message.empty());
  }
  {
    Main main;wmWindowManager wm;wmWindow win;Object object,foreign;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
    foreign.id.session_uid=11;std::snprintf(foreign.id.name,sizeof(foreign.id.name),"%s","OBOther");foreign.type=OB_MESH;append(main.objects,&foreign);
    wmEventHandler_Op owner;add_owner(win,owner,11,50,107);
    ReportList reports;set_data(object,&new_mesh,reports);
    assert(object.data==&new_mesh&&assign_calls==1&&teardown_calls==0&&win.modalhandlers.first==&owner);
  }
  {
    Main main;wmWindowManager wm;wmWindow win;Object object;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
    wmEventHandler_Op owner;add_owner(win,owner,10,50,108);reenter_setter_on_teardown=true;
    ReportList reports;set_data(object,&new_mesh,reports);
    assert(object.data==&new_mesh&&assign_calls==1&&teardown_calls==1&&!inner_report.empty());
  }
  {
    Main main;wmWindowManager wm;wmWindow win;Object object;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
    wmEventHandler_Op owner;add_owner(win,owner,10,50,109);object.mode=OB_MODE_EDIT;
    ReportList reports;set_data(object,&new_mesh,reports);
    assert(object.data==&old_mesh&&assign_calls==0&&teardown_calls==0);
  }
  {
    Main main;wmWindowManager wm;wmWindow win;Object object;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
    wmEventHandler_Op owner;add_owner(win,owner,10,50,110);
    ReportList reports;set_data(object,&old_mesh,reports);
    /* The pinned native setter still reassigns the same pointer and balances ID users. */
    assert(object.data==&old_mesh&&assign_calls==1&&teardown_calls==0&&old_mesh.users==1&&win.modalhandlers.first==&owner);
  }
  {
    Main main;wmWindowManager wm;wmWindow win;Object object,duplicate;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
    duplicate.id.session_uid=10;std::snprintf(duplicate.id.name,sizeof(duplicate.id.name),"%s","OBCopy");append(main.objects,&duplicate);
    wmEventHandler_Op owner;add_owner(win,owner,10,50,111);
    ReportList reports;set_data(object,&new_mesh,reports);
    assert(object.data==&old_mesh&&assign_calls==0&&teardown_calls==0&&!reports.message.empty());
    assert(win.modalhandlers.first==&owner);
  }
  {
    Main main;wmWindowManager wm;wmWindow win;Object object;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
    object.id.session_uid=0;
    ReportList reports;set_data(object,&new_mesh,reports);
    assert(object.data==&old_mesh&&assign_calls==0&&teardown_calls==0&&!reports.message.empty());
  }
  {
    Main main;wmWindowManager wm;wmWindow win;Object object,evaluated;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
    evaluated.id.session_uid=10;evaluated.type=OB_MESH;evaluated.data=&old_mesh;
    ReportList reports;set_data(evaluated,&new_mesh,reports);
    assert(evaluated.data==&new_mesh&&assign_calls==1&&teardown_calls==0);
  }
}
"""

class PencilObjectDataTeardownTests(unittest.TestCase):
    def _run(self):
        actual = "\n".join((RNA_LOOKUPS, OBJECT_OWNER_HELPER, OBJECT_OWNER_API, DATA_SETTER))
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(
            HARNESS.replace("/* ACTUAL_SOURCE */", actual)
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
        guard = source.index("WM_event_ipad_pencil_paint_object_teardown(owner_main, object_uid)", setter_start)
        native_assignment = source.index("BKE_mesh_assign_object", setter_start)
        helper = source.index("static Object *rna_Object_main_find_by_uid")
        self.assertIsNotNone(setter_end)
        self.assertLess(helper, setter_start)
        self.assertLess(setter_start, guard)
        self.assertLess(guard, native_assignment)
        self.assertLess(native_assignment, setter_end)

    def test_actual_object_data_setter_retires_matching_owners_before_native_change(self):
        self._run()

    def test_owner_loop_reacquires_windows_and_refuses_stale_or_replaced_context(self):
        self._run()

    def test_other_objects_same_pointer_and_edit_mode_keep_native_behavior(self):
        self._run()

    def test_reentrant_data_mutation_cannot_overwrite_cancel_callback_result(self):
        self._run()

if __name__ == "__main__":
    unittest.main()
