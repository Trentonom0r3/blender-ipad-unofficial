"""Exercise the native pre-free Brush lease teardown and its Outliner callers."""
from test_compact_shelf import function
from test_touch_extrude import changed_source
from pathlib import Path
import subprocess
import tempfile
import test_ipad_panels
import preflight
import unittest


WM_PATH = "source/blender/windowmanager/intern/wm_event_system.cc"
OUTLINER_EDIT_PATH = "source/blender/editors/space_outliner/outliner_edit.cc"
OUTLINER_TOOLS_PATH = "source/blender/editors/space_outliner/outliner_tools.cc"
WM_API_PATH = "source/blender/windowmanager/WM_api.hh"
RNA_MAIN_API_PATH = "source/blender/makesrna/intern/rna_main_api.cc"
PATCH = (Path(__file__).resolve().parents[1] / "patches/blender-ipad.patch").read_text(encoding="utf-8")
WM = changed_source(WM_PATH)
BRUSH_UID_TEARDOWN = function(WM, "static bool wm_ipad_pencil_paint_brush_uid_teardown(")
BRUSH_DIRECT_TEARDOWN = function(WM, "bool WM_event_ipad_pencil_paint_brush_teardown(")
BRUSH_TEARDOWN = function(WM, "bool WM_event_ipad_pencil_paint_tagged_brushes_teardown(")
RNA_MAIN_API = changed_source(RNA_MAIN_API_PATH)
RNA_BRUSH_REMOVE_GUARD = function(RNA_MAIN_API, "static bool rna_Main_brush_remove_guard(")
RNA_OBJECT_REMOVE_GUARD = function(RNA_MAIN_API, "static bool rna_Main_object_remove_guard(")
RNA_MESH_REMOVE_GUARD = function(RNA_MAIN_API, "static bool rna_Main_mesh_remove_guard(")


def patch_section(path):
    marker = f"diff --git a/{path} b/{path}\n"
    return PATCH.split(marker, 1)[1].split("diff --git ", 1)[0]


ROOT = Path(__file__).resolve().parents[1]


CPP = r"""
#include <cassert>
#include <cstdint>
#include <vector>
struct ID { ID *next=nullptr; uint64_t session_uid=0; int tag=0; };
struct ListBase { void *first=nullptr; };
struct wmEventHandler { int type=0; wmEventHandler *next=nullptr; };
struct wmEventHandler_Op : wmEventHandler {
  uint64_t ipad_pencil_paint_serial=0, ipad_pencil_operator_lifetime=0;
  uint64_t ipad_pencil_owner_values[19]{};
};
struct wmWindow { wmWindow *next=nullptr; int runtime=1; ListBase handlers,modalhandlers; };
struct wmWindowManager { wmWindowManager *next=nullptr; ListBase windows; };
struct Main { ListBase wm,brushes; };
struct bContext { Main *main=nullptr; wmWindowManager *wm=nullptr; wmWindow *win=nullptr; };
static Main *G_MAIN=nullptr;
constexpr int ID_TAG_DOIT=1, WM_HANDLER_TYPE_OP=2;
#define LISTBASE_FOREACH(type,item,list) \
  for(type item=static_cast<type>((list)->first);item;item=item->next)

bContext *CTX_create(){return new bContext{};}
void CTX_data_main_set(bContext *C,Main *main){C->main=main;}
void CTX_wm_manager_set(bContext *C,wmWindowManager *wm){C->wm=wm;}
void CTX_wm_window_set(bContext *C,wmWindow *win){C->win=win;}
void CTX_free(bContext *C){delete C;}

static bool contains(const ListBase &list,const wmEventHandler *target){
  for(auto *item=static_cast<const wmEventHandler*>(list.first);item;item=item->next)
    if(item==target)return true;
  return false;
}
bool wm_ipad_pencil_paint_handler_registered(wmWindow *win,wmEventHandler_Op *handler){
  return win&&win->runtime&&handler&&contains(
      win->modalhandlers,static_cast<const wmEventHandler*>(handler));
}
static void unlink_handler(ListBase &list,wmEventHandler *target){
  wmEventHandler *prev=nullptr,*item=static_cast<wmEventHandler*>(list.first);
  while(item&&item!=target){prev=item;item=item->next;}
  if(item){if(prev)prev->next=item->next;else list.first=item->next;item->next=nullptr;}
}
static int teardown_calls=0;
static uint64_t torn_brushes[16]{};
static wmWindow *torn_windows[16]{};
static bool refuse_teardown=false,reenter_teardown=false;
static wmEventHandler_Op replacement{};
void WM_event_ipad_pencil_paint_owner_teardown(
    bContext *C,wmWindow *win,const void*,const void*,uint64_t,uint64_t,uint64_t brush_uid){
  assert(C&&C->main==G_MAIN&&C->wm&&C->win==win&&brush_uid);
  torn_brushes[teardown_calls]=brush_uid;torn_windows[teardown_calls]=win;++teardown_calls;
  if(refuse_teardown)return;
  for(auto *base=static_cast<wmEventHandler*>(win->modalhandlers.first);base;){
    auto *next=base->next;
    if(base->type==WM_HANDLER_TYPE_OP){
      auto *owner=reinterpret_cast<wmEventHandler_Op*>(base);
      if(owner->ipad_pencil_paint_serial&&owner->ipad_pencil_owner_values[16]==brush_uid){
        unlink_handler(win->modalhandlers,base);
        if(reenter_teardown){
          reenter_teardown=false;
          replacement.type=WM_HANDLER_TYPE_OP;
          replacement.ipad_pencil_paint_serial=2;
          replacement.ipad_pencil_operator_lifetime=owner->ipad_pencil_operator_lifetime+1;
          replacement.ipad_pencil_owner_values[16]=brush_uid;
          replacement.next=static_cast<wmEventHandler*>(win->modalhandlers.first);
          win->modalhandlers.first=&replacement;
        }
      }
    }
    base=next;
  }
}

""" + BRUSH_UID_TEARDOWN + "\n" + BRUSH_DIRECT_TEARDOWN + "\n" + BRUSH_TEARDOWN + r"""

static void add_owner(wmWindow &win,wmEventHandler_Op &owner,uint64_t brush_uid,uint64_t lifetime){
  owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=1;
  owner.ipad_pencil_operator_lifetime=lifetime;owner.ipad_pencil_owner_values[16]=brush_uid;
  owner.next=static_cast<wmEventHandler*>(win.modalhandlers.first);win.modalhandlers.first=&owner;
}
int main(){
  {
    Main main;G_MAIN=&main;
    ID first{nullptr,101,ID_TAG_DOIT},second{nullptr,202,ID_TAG_DOIT},untouched{nullptr,303,0};
    first.next=&second;second.next=&untouched;main.brushes.first=&first;
    wmWindowManager wm1,wm2;wm1.next=&wm2;main.wm.first=&wm1;
    wmWindow a,b,unrelated;a.next=&b;b.next=&unrelated;wm1.windows.first=&a;wm2.windows.first=&unrelated;
    wmEventHandler_Op first_owner,second_owner,unrelated_owner;
    add_owner(a,first_owner,101,11);add_owner(b,second_owner,202,12);add_owner(unrelated,unrelated_owner,303,13);
    teardown_calls=0;refuse_teardown=false;reenter_teardown=false;
    assert(WM_event_ipad_pencil_paint_tagged_brushes_teardown(&main));
    assert(teardown_calls==2&&torn_brushes[0]==101&&torn_brushes[1]==202);
    assert(torn_windows[0]==&a&&torn_windows[1]==&b);
    assert(!a.modalhandlers.first&&!b.modalhandlers.first);
    assert(unrelated.modalhandlers.first==&unrelated_owner);
    assert((first.tag&ID_TAG_DOIT)&&(second.tag&ID_TAG_DOIT));
  }
  {
    /* Direct bpy.data collection removal is scoped by Brush UID; it does not
     * consume unrelated Outliner ID_TAG_DOIT work. */
    Main main;G_MAIN=&main;
    ID tagged{nullptr,707,ID_TAG_DOIT},direct{nullptr,808,0};
    tagged.next=&direct;main.brushes.first=&tagged;
    wmWindowManager wm;main.wm.first=&wm;wmWindow win;wm.windows.first=&win;
    wmEventHandler_Op tagged_owner,direct_owner;
    add_owner(win,tagged_owner,707,70);add_owner(win,direct_owner,808,80);
    teardown_calls=0;refuse_teardown=false;reenter_teardown=false;
    assert(WM_event_ipad_pencil_paint_brush_teardown(&main,808));
    assert(teardown_calls==1&&torn_brushes[0]==808&&torn_windows[0]==&win);
    assert(win.modalhandlers.first==&tagged_owner);
    assert((tagged.tag&ID_TAG_DOIT)&&!(direct.tag&ID_TAG_DOIT));
  }
  {
    /* A tagged delete cannot proceed if the only matching owner is outside the
     * registered modal list: the caller must clear ID_TAG_DOIT and refuse. */
    Main main;G_MAIN=&main;ID brush{nullptr,404,ID_TAG_DOIT};main.brushes.first=&brush;
    wmWindowManager wm;main.wm.first=&wm;wmWindow win;wm.windows.first=&win;
    wmEventHandler_Op owner;add_owner(win,owner,404,41);unlink_handler(win.modalhandlers,&owner);
    owner.next=static_cast<wmEventHandler*>(win.handlers.first);win.handlers.first=&owner;
    teardown_calls=0;
    assert(!WM_event_ipad_pencil_paint_tagged_brushes_teardown(&main));
    assert(teardown_calls==0&&(brush.tag&ID_TAG_DOIT));
  }
  {
    /* A strict teardown refusal is fail-closed and leaves the pending ID tagged
     * only until the Outliner caller clears the delete batch. */
    Main main;G_MAIN=&main;ID brush{nullptr,505,ID_TAG_DOIT};main.brushes.first=&brush;
    wmWindowManager wm;main.wm.first=&wm;wmWindow win;wm.windows.first=&win;
    wmEventHandler_Op owner;add_owner(win,owner,505,51);refuse_teardown=true;teardown_calls=0;
    assert(!WM_event_ipad_pencil_paint_tagged_brushes_teardown(&main));
    assert(teardown_calls==1&&win.modalhandlers.first==&owner&&(brush.tag&ID_TAG_DOIT));
    refuse_teardown=false;
  }
  {
    /* Native cancellation may install a replacement lease; restart from the
     * live Main and retire it without dereferencing the old handler. */
    Main main;G_MAIN=&main;ID brush{nullptr,606,ID_TAG_DOIT};main.brushes.first=&brush;
    wmWindowManager wm;main.wm.first=&wm;wmWindow win;wm.windows.first=&win;
    wmEventHandler_Op owner;add_owner(win,owner,606,61);reenter_teardown=true;teardown_calls=0;
    assert(WM_event_ipad_pencil_paint_tagged_brushes_teardown(&main));
    assert(teardown_calls==2&&!win.modalhandlers.first);
  }
}
"""


class PencilPaintBrushDeleteTests(unittest.TestCase):
    def test_tagged_brush_owners_retire_across_windows_and_fail_closed(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(CPP)

    def test_every_outliner_delete_retires_before_free(self):
        edit = patch_section(OUTLINER_EDIT_PATH)
        tools = patch_section(OUTLINER_TOOLS_PATH)
        api = patch_section(WM_API_PATH)
        self.assertIn("bool WM_event_ipad_pencil_paint_tagged_brushes_teardown(Main *bmain);", api)
        self.assertNotIn('#include "WM_event_system.hh"', edit)
        self.assertNotIn('#include "WM_event_system.hh"', tools)
        click_delete = edit.split("@@ -601,2 +602,12", 1)[1].split("@@ -2385,5 +2392,16", 1)[0]
        purge_delete = edit.split("@@ -2385,5 +2392,16", 1)[1]
        delete_branch = tools.split("@@ -2958,4 +2959,14", 1)[1].split("@@ -3092,3 +3098,13", 1)[0]
        library_delete = tools.split("@@ -3092,3 +3098,13", 1)[1]
        helper = "WM_event_ipad_pencil_paint_tagged_brushes_teardown(bmain)"
        for body in (click_delete, purge_delete, delete_branch, library_delete):
            new_source = "\n".join(line[1:] for line in body.splitlines()
                                    if line.startswith(("+", " ")) and not line.startswith("+++"))
            self.assertLess(new_source.index(helper), new_source.index("BKE_id_multi_tagged_delete(bmain);"))
            self.assertIn("BKE_main_id_tag_all(bmain, ID_TAG_DOIT, false)", new_source)
            self.assertIn("return OPERATOR_CANCELLED", new_source)

    def test_library_delete_runs_the_guard_before_free_and_undo(self):
        section = patch_section(OUTLINER_TOOLS_PATH)
        hunk = section.split("@@ -3092,3 +3098,13 @@", 1)[1]
        body = "\n".join(
            line[1:] for line in hunk.splitlines()
            if line.startswith((" ", "+")) and not line.startswith("+++")
        )
        cpp = r"""
#include <cassert>
#define WITH_APPLE_CROSSPLATFORM
constexpr int ID_TAG_DOIT=1, OPERATOR_CANCELLED=-1, id_delete_tag_fn=1;
struct Main {};
struct bContext {};
struct wmOperator { void *reports=nullptr; };
struct Scene {};
struct SpaceOutliner {};
static Main main_data;
static bContext context;
static wmOperator operation;
static Scene scene_data;
static SpaceOutliner outliner;
static int calls[16], call_count=0;
static bool allow_teardown=true;
static bool allow_image_teardown=true;
void BKE_main_id_tag_all(Main*,int,bool){calls[call_count++]=1;}
void outliner_do_libdata_operation(bContext*,void*,Scene*,SpaceOutliner*,int){calls[call_count++]=2;}
bool WM_event_ipad_pencil_paint_tagged_brushes_teardown(Main*){
  calls[call_count++]=3;return allow_teardown;
}
bool WM_event_ipad_pencil_paint_tagged_images_teardown(Main*){
  calls[call_count++]=4;return allow_image_teardown;
}
void BKE_id_multi_tagged_delete(Main*){calls[call_count++]=5;}
void ED_undo_push(bContext*,const char*){calls[call_count++]=6;}
static int run_library_delete(){
  Main *bmain=&main_data;bContext *C=&context;wmOperator *op=&operation;
  Scene *scene=&scene_data;SpaceOutliner *space_outliner=&outliner;
""" + body + r"""
  ED_undo_push(C,"Delete Library");
  return 0;
}
int main(){
  allow_teardown=true;allow_image_teardown=true;call_count=0;
  assert(run_library_delete()==0);
  assert(call_count==6&&calls[0]==1&&calls[1]==2&&calls[2]==3&&calls[3]==4&&calls[4]==5&&calls[5]==6);
  allow_teardown=false;call_count=0;
  assert(run_library_delete()==OPERATOR_CANCELLED);
  assert(call_count==4&&calls[0]==1&&calls[1]==2&&calls[2]==3&&calls[3]==1);
  allow_teardown=true;allow_image_teardown=false;call_count=0;
  assert(run_library_delete()==OPERATOR_CANCELLED);
  assert(call_count==5&&calls[0]==1&&calls[1]==2&&calls[2]==3&&calls[3]==4&&calls[4]==1);
}
"""
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(cpp)

    def test_python_collection_removal_retires_brush_before_either_free_path(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(RNA_REMOVE_CPP)

    def test_python_collection_removal_reacquires_brush_after_native_callback(self):
        source = patch_section(RNA_MAIN_API_PATH)
        body = "\n".join(
            line[1:] for line in source.splitlines()
            if line.startswith((" ", "+")) and not line.startswith("+++")
        )
        helper = "WM_event_ipad_pencil_paint_brush_teardown(bmain, brush_uid)"
        self.assertIn("GS(id->name) != ID_BR", body)
        self.assertIn("!do_unlink && ID_REAL_USERS(id) > 0", body)
        self.assertIn(helper, body)
        guard_call = "rna_Main_brush_remove_guard(bmain, reports, id_ptr, do_unlink)"
        self.assertLess(body.index(guard_call), body.index("if (do_unlink) {"))
        self.assertIn("id = static_cast<ID *>(id_ptr->data)", body)
        self.assertIn("candidate->session_uid == brush_uid", body)
        self.assertIn("id_ptr->data = live_brush", body)
        self.assertIn("id->tag & ID_TAG_NO_MAIN", body)
        self.assertLess(body.index("ID_TAG_NO_MAIN"), body.index(helper))

        object_helper = "WM_event_ipad_pencil_paint_mode_exit(bmain, scene, object)"
        object_guard = "rna_Main_object_remove_guard(bmain, reports, id_ptr, do_unlink)"
        self.assertIn(object_helper, body)
        self.assertIn("handler->ipad_pencil_owner_values[7] == object_uid", body)
        self.assertIn("id_ptr->data = live_object", body)
        self.assertLess(body.index(object_guard), body.index("if (do_unlink) {"))
        self.assertLess(body.index("if (G_MAIN != bmain) {\n    return true;"), body.index(object_guard))
        self.assertLess(body.index("id_ptr->data = live_object"), body.index("if (!mode_exit_succeeded)"))

    def test_python_collection_object_removal_retires_or_refuses_live_owner(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(
            OBJECT_REMOVE_CPP + RNA_OBJECT_REMOVE_GUARD + r"""
int main()
{
  {
    reset(); Main main; G_MAIN=&main; Scene scene; scene.session_uid=11;
    Object object; object.session_uid=101; object.mode=OB_MODE_SCULPT;
    main.scenes.first=&scene; main.objects.first=&object; PointerRNA ptr{&object}; ReportList reports;
    assert(rna_Main_object_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==1&&ptr.data==&object&&reports.errors==0);
  }
  {
    reset(); Main main; G_MAIN=&main; Scene scene; scene.session_uid=12;
    Object object; object.session_uid=102; object.mode=OB_MODE_SCULPT;
    main.scenes.first=&scene; main.objects.first=&object; PointerRNA ptr{&object}; ReportList reports;
    mode_exit_allowed=false;
    assert(!rna_Main_object_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==1&&reports.errors==1&&ptr.data==&object);
  }
  {
    reset(); Main main; G_MAIN=&main; Scene scene; scene.session_uid=13;
    Object old_object; old_object.session_uid=103; old_object.mode=OB_MODE_SCULPT;
    Object replacement; replacement.session_uid=103; replacement.mode=OB_MODE_SCULPT;
    main.scenes.first=&scene; main.objects.first=&old_object; PointerRNA ptr{&old_object}; ReportList reports;
    replacement_object=&replacement;
    replace_object_during_exit=true;
    assert(rna_Main_object_remove_guard(&main,&reports,&ptr,true));
    assert(ptr.data==&replacement&&main.objects.first==&replacement);
  }
  {
    reset(); Main main; G_MAIN=&main; Scene scene; scene.session_uid=131;
    Object old_object; old_object.session_uid=1310; old_object.mode=OB_MODE_SCULPT;
    Object replacement; replacement.session_uid=1310; replacement.mode=OB_MODE_SCULPT;
    main.scenes.first=&scene; main.objects.first=&old_object; PointerRNA ptr{&old_object}; ReportList reports;
    replacement_object=&replacement;
    replace_object_during_exit=true; mode_exit_allowed=false;
    assert(!rna_Main_object_remove_guard(&main,&reports,&ptr,true));
    assert(ptr.data==&replacement&&main.objects.first==&replacement&&reports.errors==1);
  }
  {
    reset(); Main main; G_MAIN=&main; Object object; object.session_uid=104;
    main.objects.first=&object; PointerRNA ptr{&object}; ReportList reports;
    wmWindowManager wm; wmWindow win; wmEventHandler_Op owner;
    main.wm.first=&wm; wm.windows.first=&win; win.modalhandlers.first=&owner;
    owner.type=WM_HANDLER_TYPE_OP; owner.ipad_pencil_paint_serial=1;
    owner.ipad_pencil_owner_values[7]=104;
    assert(!rna_Main_object_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==0&&reports.errors==1&&ptr.data==&object);
  }
  {
    reset(); Main main; G_MAIN=&main; Scene scene; scene.session_uid=15;
    Object object; object.session_uid=105; object.mode=OB_MODE_SCULPT;
    main.scenes.first=&scene; main.objects.first=&object; PointerRNA ptr{&object}; ReportList reports;
    wmWindowManager wm; wmWindow win; wmEventHandler_Op owner;
    main.wm.first=&wm; wm.windows.first=&win; win.modalhandlers.first=&owner;
    owner.type=WM_HANDLER_TYPE_OP; owner.ipad_pencil_paint_serial=2;
    owner.ipad_pencil_owner_values[7]=105;
    assert(!rna_Main_object_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==1&&reports.errors==1&&ptr.data==&object);
  }
  {
    reset(); Main main; G_MAIN=&main; Object object; object.session_uid=106;
    main.objects.first=&object; PointerRNA ptr{&object}; ReportList reports;
    wmWindowManager wm; wmWindow win; wmEventHandler_Op owner;
    main.wm.first=&wm; wm.windows.first=&win; win.modalhandlers.first=&owner;
    owner.type=WM_HANDLER_TYPE_OP; owner.ipad_pencil_paint_serial=3;
    owner.ipad_pencil_owner_values[7]=999;
    assert(rna_Main_object_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==0&&ptr.data==&object&&reports.errors==0);
  }
  {
    reset(); Main main; G_MAIN=&main; Scene scene; scene.session_uid=17;
    Object object; object.session_uid=107; object.mode=OB_MODE_SCULPT;
    main.objects.first=&object; PointerRNA ptr{&object}; ReportList reports;
    assert(!rna_Main_object_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==0&&reports.errors==1);
  }
  {
    reset(); Main main; G_MAIN=&main; Object object; object.session_uid=108;
    object.tag=ID_TAG_NO_MAIN; PointerRNA ptr{&object}; ReportList reports;
    assert(rna_Main_object_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==0&&ptr.data==&object&&reports.errors==0);
  }
  {
    reset(); Main main; Main unrelated_main; G_MAIN=&unrelated_main;
    Object object; object.session_uid=1081; object.mode=OB_MODE_SCULPT;
    PointerRNA ptr{&object}; ReportList reports;
    assert(rna_Main_object_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==0&&ptr.data==&object&&reports.errors==0);
  }
  {
    reset(); Main main; Main replaced_main; G_MAIN=&main; Scene scene; scene.session_uid=1082;
    Object object; object.session_uid=1082; object.mode=OB_MODE_SCULPT;
    main.scenes.first=&scene; main.objects.first=&object; PointerRNA ptr{&object}; ReportList reports;
    replace_global_main_during_exit=&replaced_main;
    assert(!rna_Main_object_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==1&&ptr.invalidated&&ptr.data==nullptr&&reports.errors==1);
  }
  {
    reset(); Main main; G_MAIN=&main; Object object; object.session_uid=109; object.users=2;
    main.objects.first=&object; PointerRNA ptr{&object}; ReportList reports;
    assert(rna_Main_object_remove_guard(&main,&reports,&ptr,false));
    assert(mode_exit_calls==0&&ptr.data==&object&&reports.errors==0);
  }
  {
    reset(); Main main; G_MAIN=&main; Scene scene; scene.session_uid=19;
    Object object; object.mode=OB_MODE_SCULPT; main.scenes.first=&scene;
    main.objects.first=&object; PointerRNA ptr{&object}; ReportList reports;
    assert(!rna_Main_object_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==0&&reports.errors==1);
  }
}
""")


    def test_python_collection_mesh_guard_runs_before_force_delete(self):
        section = patch_section(RNA_MAIN_API_PATH)
        body = "\n".join(
            line[1:] for line in section.splitlines()
            if line.startswith(("+", " ")) and not line.startswith("+++")
        )
        self.assertIn('#    include "wm_event_system.hh"', body)
        self.assertIn("handler->ipad_pencil_owner_values[8] != mesh_uid", body)
        self.assertIn("WM_event_ipad_pencil_paint_mode_exit(bmain, owner_scene, owner_object)", body)
        guard = "rna_Main_mesh_remove_guard(bmain, reports, id_ptr, do_unlink)"
        self.assertLess(body.index(guard), body.index("if (do_unlink) {"))
        self.assertLess(body.index("id_ptr->data = live_mesh"), body.index("if (do_unlink) {"))

    def test_event_handler_header_hunk_applies_inside_rna_runtime(self):
        commit = preflight.pinned_commit(ROOT)
        upstream = preflight.get_source(
            commit, RNA_MAIN_API_PATH, ROOT / ".cache/preflight", offline=True)
        marker = f"diff --git a/{RNA_MAIN_API_PATH} b/{RNA_MAIN_API_PATH}\n"
        start = PATCH.index(marker)
        end = PATCH.find("\ndiff --git ", start + len(marker))
        file_patch = PATCH[start:end if end >= 0 else None]
        with tempfile.TemporaryDirectory(prefix="rna-runtime-include-", dir=ROOT) as directory:
            relative = Path(directory).relative_to(ROOT).as_posix()
            target = Path(directory) / RNA_MAIN_API_PATH
            target.parent.mkdir(parents=True)
            target.write_bytes(upstream)
            patch_path = Path(directory) / "rna-main.patch"
            patch_path.write_text(file_patch + "\n", encoding="utf-8", newline="\n")
            subprocess.run(
                ["git", "apply", f"--directory={relative}", str(patch_path)],
                cwd=ROOT, check=True, capture_output=True, text=True)
            applied = target.read_text(encoding="utf-8")
        runtime = applied.index("#ifdef RNA_RUNTIME")
        helpers = applied.index("static bool rna_Main_brush_remove_guard")
        event_header = applied.index('#    include "wm_event_system.hh"')
        apple_guard = applied.rfind("#  ifdef WITH_APPLE_CROSSPLATFORM", 0, event_header)
        self.assertLess(runtime, apple_guard)
        self.assertLess(apple_guard, event_header)
        self.assertLess(event_header, helpers)

    def test_python_collection_mesh_removal_retires_each_live_owner(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(MESH_REMOVE_CPP)

OBJECT_REMOVE_CPP = r"""
#include <cassert>
#include <cstdint>
constexpr int ID_TAG_NO_MAIN=4, ID_OB=2, RPT_ERROR=3, WM_HANDLER_TYPE_OP=1;
constexpr int OB_MODE_SCULPT=1<<0, OB_MODE_VERTEX_PAINT=1<<1,
              OB_MODE_WEIGHT_PAINT=1<<2, OB_MODE_TEXTURE_PAINT=1<<3;
static int active_idcode=ID_OB;
#define GS(name) active_idcode
#define ID_REAL_USERS(id) ((id)->users)
struct ID { ID *next=nullptr; uint64_t session_uid=0; int tag=0,users=0; char name[66]="OBObject"; };
struct Scene : ID {};
struct Object : ID { ID &id; int mode=0; Object():id(*this){} };
struct ListBase { void *first=nullptr; };
struct wmEventHandler { wmEventHandler *next=nullptr; int type=0; };
struct wmEventHandler_Op : wmEventHandler {
  uint64_t ipad_pencil_paint_serial=0;
  uint64_t ipad_pencil_owner_values[19]{};
};
struct wmWindow { wmWindow *next=nullptr; ListBase handlers,modalhandlers; };
struct wmWindowManager { wmWindowManager *next=nullptr; ListBase windows; };
struct Main { ListBase brushes,objects,scenes,wm; };
struct ReportList { int errors=0; };
struct PointerRNA { void *data=nullptr; bool invalidated=false; void invalidate(){data=nullptr;invalidated=true;} };
static Main *G_MAIN=nullptr;
#define LISTBASE_FOREACH(type,item,list) \
  for(type item=static_cast<type>((list)->first);item;item=static_cast<type>(item->next))
static int mode_exit_calls=0;
static bool mode_exit_allowed=true,replace_object_during_exit=false;
static Main *replace_global_main_during_exit=nullptr;
static Object *replacement_object=nullptr;
static void remove_object(Main *main,Object *object){
  ID *previous=nullptr,*current=static_cast<ID*>(main->objects.first);
  while(current&&current!=static_cast<ID*>(object)){previous=current;current=current->next;}
  if(current){if(previous)previous->next=current->next;else main->objects.first=current->next;current->next=nullptr;}
}
void BKE_report(ReportList *reports,int,const char*){if(reports)++reports->errors;}
bool WM_event_ipad_pencil_paint_mode_exit(Main *main,Scene *scene,Object *object){
  ++mode_exit_calls;assert(main==G_MAIN&&scene);
  if(replace_object_during_exit){const uint64_t uid=object->session_uid;remove_object(main,object);
    replacement_object->session_uid=uid;main->objects.first=replacement_object;}
  if(replace_global_main_during_exit)G_MAIN=replace_global_main_during_exit;
  return mode_exit_allowed;
}
static void reset(){mode_exit_calls=0;mode_exit_allowed=true;replace_object_during_exit=false;replacement_object=nullptr;replace_global_main_during_exit=nullptr;active_idcode=ID_OB;}
"""


MESH_REMOVE_CPP = r"""
#include <cassert>
#include <cstdint>
#include <initializer_list>
constexpr int ID_ME=4, ID_TAG_NO_MAIN=8, RPT_ERROR=3, WM_HANDLER_TYPE_OP=1;
constexpr int OB_MODE_SCULPT=1<<0, OB_MODE_VERTEX_PAINT=1<<1,
              OB_MODE_WEIGHT_PAINT=1<<2, OB_MODE_TEXTURE_PAINT=1<<3;
static int active_idcode=ID_ME;
#define GS(name) active_idcode
#define ID_REAL_USERS(id) ((id)->users)
#define ELEM(value,a,b,c,d) ((value)==(a)||(value)==(b)||(value)==(c)||(value)==(d))
struct ID { ID *next=nullptr; uint64_t session_uid=0; int tag=0,users=0; char name[66]="MEmesh"; };
struct Scene : ID { ID &id; Scene():id(*this){} };
struct Object : ID { ID &id; ID *data=nullptr; int mode=0; Object():id(*this){} };
struct ListBase { void *first=nullptr; };
struct wmEventHandler { wmEventHandler *next=nullptr; int type=0; };
struct wmEventHandler_Op : wmEventHandler {
  uint64_t ipad_pencil_paint_serial=0, ipad_pencil_operator_lifetime=0;
  int ipad_pencil_paint_mode=0; uint64_t ipad_pencil_owner_values[19]{};
};
struct wmWindow { wmWindow *next=nullptr; int runtime=1; ListBase handlers,modalhandlers; };
struct wmWindowManager { wmWindowManager *next=nullptr; ListBase windows; };
struct Main { ListBase meshes,objects,scenes,wm; };
struct ReportList { int errors=0; };
struct PointerRNA { void *data=nullptr; bool invalidated=false; void invalidate(){data=nullptr;invalidated=true;} };
static Main *G_MAIN=nullptr;
#define LISTBASE_FOREACH(type,item,list) \
  for(type item=static_cast<type>((list)->first);item;item=static_cast<type>(item->next))
static int mode_exit_calls=0;
static bool mode_exit_allowed=true,leave_owner_registered=false,delete_mesh_during_exit=false;
static Main *replace_global_main_during_exit=nullptr;
static void unlink_handler(ListBase &list,wmEventHandler *target){
  wmEventHandler *previous=nullptr,*current=static_cast<wmEventHandler*>(list.first);
  while(current&&current!=target){previous=current;current=current->next;}
  if(current){if(previous)previous->next=current->next;else list.first=current->next;current->next=nullptr;}
}
static void unlink_mesh(Main *main,ID *target){
  ID *previous=nullptr,*current=static_cast<ID*>(main->meshes.first);
  while(current&&current!=target){previous=current;current=current->next;}
  if(current){if(previous)previous->next=current->next;else main->meshes.first=current->next;current->next=nullptr;}
}
void BKE_report(ReportList *reports,int,const char*){if(reports)++reports->errors;}
bool WM_event_ipad_pencil_paint_mode_exit(Main *main,Scene *scene,Object *object){
  ++mode_exit_calls;assert(main==G_MAIN&&scene&&object);
  if(!mode_exit_allowed)return false;
  const uint64_t object_uid=object->id.session_uid;
  const int mode=object->mode&(OB_MODE_SCULPT|OB_MODE_VERTEX_PAINT|OB_MODE_WEIGHT_PAINT|OB_MODE_TEXTURE_PAINT);
  if(!leave_owner_registered){
    LISTBASE_FOREACH(wmWindowManager*,wm,&main->wm) LISTBASE_FOREACH(wmWindow*,win,&wm->windows) {
      for(ListBase *handlers:{&win->handlers,&win->modalhandlers})
        for(auto *base=static_cast<wmEventHandler*>(handlers->first);base;){
          auto *next=base->next;
          if(base->type==WM_HANDLER_TYPE_OP){
            auto *owner=reinterpret_cast<wmEventHandler_Op*>(base);
            if(owner->ipad_pencil_paint_serial&&owner->ipad_pencil_owner_values[7]==object_uid&&
               owner->ipad_pencil_paint_mode==mode)unlink_handler(*handlers,base);
          }
          base=next;
        }
    }
  }
  if(delete_mesh_during_exit)unlink_mesh(main,static_cast<ID*>(main->meshes.first));
  if(replace_global_main_during_exit)G_MAIN=replace_global_main_during_exit;
  return true;
}
static void add_owner(wmWindow &win,wmEventHandler_Op &owner,uint64_t mesh_uid,
                      uint64_t scene_uid,uint64_t object_uid,uint64_t lifetime,int mode,
                      bool modal=true){
  owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=1;
  owner.ipad_pencil_operator_lifetime=lifetime;owner.ipad_pencil_paint_mode=mode;
  owner.ipad_pencil_owner_values[6]=scene_uid;owner.ipad_pencil_owner_values[7]=object_uid;
  owner.ipad_pencil_owner_values[8]=mesh_uid;owner.ipad_pencil_owner_values[9]=uint64_t(mode);
  ListBase &list=modal?win.modalhandlers:win.handlers;
  owner.next=static_cast<wmEventHandler*>(list.first);list.first=&owner;
}
static void reset(){
  mode_exit_calls=0;mode_exit_allowed=true;leave_owner_registered=false;
  delete_mesh_during_exit=false;replace_global_main_during_exit=nullptr;active_idcode=ID_ME;
}
""" + RNA_MESH_REMOVE_GUARD + r"""
int main(){
  {
    reset();Main main;G_MAIN=&main;Scene scene;scene.session_uid=10;main.scenes.first=&scene;
    ID mesh;mesh.session_uid=500;main.meshes.first=&mesh;
    Object object;object.session_uid=100;object.mode=OB_MODE_SCULPT;object.data=&mesh;main.objects.first=&object;
    wmWindowManager wm;main.wm.first=&wm;wmWindow win;wm.windows.first=&win;
    wmEventHandler_Op owner;add_owner(win,owner,500,10,100,20,OB_MODE_SCULPT);
    PointerRNA ptr{&mesh};ReportList reports;
    assert(rna_Main_mesh_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==1&&!win.modalhandlers.first&&ptr.data==&mesh&&!reports.errors);
  }
  {
    reset();Main main;G_MAIN=&main;Scene scene;scene.session_uid=11;main.scenes.first=&scene;
    ID mesh;mesh.session_uid=501;main.meshes.first=&mesh;
    Object object;object.session_uid=101;object.mode=OB_MODE_SCULPT;object.data=&mesh;main.objects.first=&object;
    wmWindowManager wm;main.wm.first=&wm;wmWindow win;wm.windows.first=&win;
    wmEventHandler_Op owner;add_owner(win,owner,501,11,101,21,OB_MODE_SCULPT);
    PointerRNA ptr{&mesh};ReportList reports;mode_exit_allowed=false;
    assert(!rna_Main_mesh_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==1&&win.modalhandlers.first==&owner&&ptr.data==&mesh&&reports.errors==1);
  }
  {
    reset();Main main;G_MAIN=&main;Scene scene;scene.session_uid=12;main.scenes.first=&scene;
    ID mesh;mesh.session_uid=502;main.meshes.first=&mesh;
    ID other_mesh;other_mesh.session_uid=900;
    Object object;object.session_uid=102;object.mode=OB_MODE_SCULPT;object.data=&other_mesh;main.objects.first=&object;
    wmWindowManager wm;main.wm.first=&wm;wmWindow win;wm.windows.first=&win;
    wmEventHandler_Op owner;add_owner(win,owner,502,12,102,22,OB_MODE_SCULPT);
    PointerRNA ptr{&mesh};ReportList reports;
    assert(!rna_Main_mesh_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==0&&win.modalhandlers.first==&owner&&reports.errors==1);
  }
  {
    reset();Main main;G_MAIN=&main;Scene scene;scene.session_uid=120;main.scenes.first=&scene;
    ID mesh;mesh.session_uid=5020;main.meshes.first=&mesh;
    Object object;object.session_uid=1020;object.mode=OB_MODE_SCULPT;object.data=&mesh;main.objects.first=&object;
    wmWindowManager wm;main.wm.first=&wm;wmWindow win;wm.windows.first=&win;
    wmEventHandler_Op owner;add_owner(win,owner,5020,120,1020,220,OB_MODE_SCULPT);
    PointerRNA ptr{&mesh};ReportList reports;leave_owner_registered=true;
    assert(!rna_Main_mesh_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==1&&win.modalhandlers.first==&owner&&reports.errors==1);
  }
  {
    reset();Main main;G_MAIN=&main;Scene scene;scene.session_uid=13;main.scenes.first=&scene;
    ID mesh;mesh.session_uid=503;main.meshes.first=&mesh;
    Object first;first.session_uid=103;first.mode=OB_MODE_SCULPT;first.data=&mesh;
    Object second;second.session_uid=104;second.mode=OB_MODE_WEIGHT_PAINT;second.data=&mesh;
    first.next=&second;main.objects.first=&first;
    wmWindowManager wm;main.wm.first=&wm;wmWindow win;wm.windows.first=&win;
    wmEventHandler_Op a,b;add_owner(win,a,503,13,103,23,OB_MODE_SCULPT);
    add_owner(win,b,503,13,104,24,OB_MODE_WEIGHT_PAINT);
    PointerRNA ptr{&mesh};ReportList reports;
    assert(rna_Main_mesh_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==2&&!win.modalhandlers.first&&!reports.errors);
  }
  {
    reset();Main main;G_MAIN=&main;Scene scene;scene.session_uid=14;main.scenes.first=&scene;
    ID mesh;mesh.session_uid=504;main.meshes.first=&mesh;
    wmWindowManager wm;main.wm.first=&wm;wmWindow win;wm.windows.first=&win;
    wmEventHandler_Op unrelated;add_owner(win,unrelated,999,14,105,25,OB_MODE_SCULPT);
    PointerRNA ptr{&mesh};ReportList reports;
    assert(rna_Main_mesh_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==0&&win.modalhandlers.first==&unrelated&&!reports.errors);
  }
  {
    reset();Main main;G_MAIN=&main;Scene scene;scene.session_uid=15;main.scenes.first=&scene;
    ID mesh;mesh.session_uid=505;main.meshes.first=&mesh;
    Object object;object.session_uid=106;object.mode=OB_MODE_SCULPT;object.data=&mesh;main.objects.first=&object;
    wmWindowManager wm;main.wm.first=&wm;wmWindow win;wm.windows.first=&win;
    wmEventHandler_Op owner;add_owner(win,owner,505,15,106,26,OB_MODE_SCULPT);
    PointerRNA ptr{&mesh};ReportList reports;delete_mesh_during_exit=true;
    assert(!rna_Main_mesh_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==1&&!ptr.data&&ptr.invalidated&&reports.errors==0);
  }
  {
    reset();Main main;Main replaced;G_MAIN=&main;Scene scene;scene.session_uid=16;main.scenes.first=&scene;
    ID mesh;mesh.session_uid=506;main.meshes.first=&mesh;
    Object object;object.session_uid=107;object.mode=OB_MODE_SCULPT;object.data=&mesh;main.objects.first=&object;
    wmWindowManager wm;main.wm.first=&wm;wmWindow win;wm.windows.first=&win;
    wmEventHandler_Op owner;add_owner(win,owner,506,16,107,27,OB_MODE_SCULPT);
    PointerRNA ptr{&mesh};ReportList reports;replace_global_main_during_exit=&replaced;
    assert(!rna_Main_mesh_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==1&&ptr.invalidated&&!ptr.data&&reports.errors==1);
  }
  {
    reset();Main main;G_MAIN=&main;Scene scene;scene.session_uid=17;main.scenes.first=&scene;
    ID mesh;mesh.session_uid=507;mesh.tag=ID_TAG_NO_MAIN;main.meshes.first=&mesh;
    PointerRNA ptr{&mesh};ReportList reports;
    assert(rna_Main_mesh_remove_guard(&main,&reports,&ptr,true)&&mode_exit_calls==0);
  }
  {
    reset();Main main;G_MAIN=&main;ID mesh;mesh.session_uid=508;mesh.users=3;
    main.meshes.first=&mesh;PointerRNA ptr{&mesh};ReportList reports;
    assert(rna_Main_mesh_remove_guard(&main,&reports,&ptr,false)&&mode_exit_calls==0);
  }
  {
    reset();Main main;Main other;G_MAIN=&other;ID mesh;mesh.session_uid=509;
    PointerRNA ptr{&mesh};ReportList reports;
    assert(rna_Main_mesh_remove_guard(&main,&reports,&ptr,true)&&mode_exit_calls==0);
  }
  {
    reset();Main main;G_MAIN=&main;Scene scene;scene.session_uid=18;main.scenes.first=&scene;
    ID mesh;mesh.session_uid=510;main.meshes.first=&mesh;
    wmWindowManager wm;main.wm.first=&wm;wmWindow win;wm.windows.first=&win;
    wmEventHandler_Op owner;add_owner(win,owner,510,18,999,28,OB_MODE_SCULPT,false);
    PointerRNA ptr{&mesh};ReportList reports;
    assert(!rna_Main_mesh_remove_guard(&main,&reports,&ptr,true));
    assert(mode_exit_calls==0&&win.handlers.first==&owner&&reports.errors==1);
  }
}
"""

RNA_REMOVE_CPP = r"""
#include <cassert>
#include <cstdint>
#include <vector>
#define WITH_APPLE_CROSSPLATFORM
constexpr int ID_BR=1, ID_OB=2, ID_TAG_NO_MAIN=4, RPT_ERROR=3;
constexpr int NC_WINDOW=5, LIB_ID_FREE_NO_USER_REFCOUNT=1, LIB_ID_FREE_NO_UI_USER=2;
static int active_idcode=ID_BR;
#define GS(name) active_idcode
#define ID_REAL_USERS(id) ((id)->users)
struct ID { ID *next=nullptr; uint64_t session_uid=0; int tag=0, users=0; char name[66]="BRBrush"; };
struct ListBase { void *first=nullptr; };
struct Main { ListBase brushes; };
struct ReportList { int errors=0; };
struct PointerRNA { void *data=nullptr; bool invalidated=false; void invalidate(){data=nullptr;invalidated=true;} };
#define LISTBASE_FOREACH(type,item,list) \
  for(type item=static_cast<type>((list)->first);item;item=item->next)
static std::vector<int> calls;
static bool allow_teardown=true,delete_during_teardown=false;
static int last_free_flags=-1;
static void remove_id(Main *main,ID *target){
  ID *previous=nullptr,*current=static_cast<ID*>(main->brushes.first);
  while(current&&current!=target){previous=current;current=current->next;}
  if(current){if(previous)previous->next=current->next;else main->brushes.first=current->next;current->next=nullptr;}
}
void BKE_report(ReportList *reports,int,const char*){if(reports)++reports->errors;}
void BKE_id_delete(Main *main,ID *id){calls.push_back(2);remove_id(main,id);}
void BKE_id_free_ex(Main *main,ID *id,int flags,bool){calls.push_back(3);last_free_flags=flags;remove_id(main,id);}
void WM_main_add_notifier(int,void*){calls.push_back(4);}
bool WM_event_ipad_pencil_paint_brush_teardown(Main *main,uint64_t uid){
  calls.push_back(1);
  if(delete_during_teardown){
    for(ID *candidate=static_cast<ID*>(main->brushes.first);candidate;candidate=candidate->next)
      if(candidate->session_uid==uid){BKE_id_delete(main,candidate);break;}
    return true;
  }
  return allow_teardown;
}
""" + RNA_BRUSH_REMOVE_GUARD + r"""
static void run_remove(Main *bmain,ReportList *reports,PointerRNA *ptr,
                       bool do_unlink,bool do_id_user,bool do_ui_user){
  ID *id=static_cast<ID*>(ptr->data);
  if(!rna_Main_brush_remove_guard(bmain,reports,ptr,do_unlink))return;
  id=static_cast<ID*>(ptr->data);
  if(id->tag&ID_TAG_NO_MAIN){BKE_report(reports,RPT_ERROR,"ID is outside Main");return;}
  if(do_unlink){BKE_id_delete(bmain,id);ptr->invalidate();WM_main_add_notifier(NC_WINDOW,nullptr);}
  else if(ID_REAL_USERS(id)<=0){
    const int flag=(do_id_user?0:LIB_ID_FREE_NO_USER_REFCOUNT)|
                   (do_ui_user?0:LIB_ID_FREE_NO_UI_USER);
    BKE_id_free_ex(bmain,id,flag,true);ptr->invalidate();
  }
  else BKE_report(reports,RPT_ERROR,"Brush still has users");
}
static void reset(){calls.clear();allow_teardown=true;delete_during_teardown=false;last_free_flags=-1;active_idcode=ID_BR;}
int main(){
  {
    reset();Main main;ReportList reports;ID brush;brush.session_uid=11;main.brushes.first=&brush;PointerRNA ptr{&brush};
    run_remove(&main,&reports,&ptr,true,true,true);
    assert((calls==std::vector<int>{1,2,4})&&ptr.invalidated&&!main.brushes.first);
  }
  {
    reset();Main main;ReportList reports;ID brush;brush.session_uid=22;brush.users=0;main.brushes.first=&brush;PointerRNA ptr{&brush};
    run_remove(&main,&reports,&ptr,false,false,false);
    assert((calls==std::vector<int>{1,3})&&last_free_flags==3&&ptr.invalidated&&!main.brushes.first);
  }
  {
    reset();Main main;ReportList reports;ID brush;brush.session_uid=33;main.brushes.first=&brush;PointerRNA ptr{&brush};allow_teardown=false;
    run_remove(&main,&reports,&ptr,true,true,true);
    assert((calls==std::vector<int>{1})&&reports.errors==1&&!ptr.invalidated&&main.brushes.first==&brush);
  }
  {
    reset();Main main;ReportList reports;ID brush;brush.session_uid=44;main.brushes.first=&brush;PointerRNA ptr{&brush};delete_during_teardown=true;
    run_remove(&main,&reports,&ptr,true,true,true);
    assert((calls==std::vector<int>{1,2})&&ptr.invalidated&&!main.brushes.first);
  }
  {
    reset();Main main;ReportList reports;ID brush;brush.session_uid=55;brush.users=2;main.brushes.first=&brush;PointerRNA ptr{&brush};
    run_remove(&main,&reports,&ptr,false,true,true);
    assert(calls.empty()&&reports.errors==1&&main.brushes.first==&brush);
  }
  {
    reset();Main main;ReportList reports;ID other;other.session_uid=66;main.brushes.first=&other;PointerRNA ptr{&other};active_idcode=ID_OB;
    run_remove(&main,&reports,&ptr,true,true,true);
    assert((calls==std::vector<int>{2,4})&&ptr.invalidated&&!main.brushes.first);
  }
  {
    /* Keep Blender's original outside-Main report and live RNA pointer; do not
     * run a Brush teardown or invalidate the pointer for an out-of-Main ID. */
    reset();Main main;ReportList reports;ID brush;brush.session_uid=67;brush.tag=ID_TAG_NO_MAIN;
    main.brushes.first=nullptr;PointerRNA ptr{&brush};
    run_remove(&main,&reports,&ptr,true,true,true);
    assert(calls.empty()&&reports.errors==1&&!ptr.invalidated&&ptr.data==&brush&&!main.brushes.first);
  }
  {
    reset();Main main;ReportList reports;ID brush;brush.session_uid=0;main.brushes.first=&brush;PointerRNA ptr{&brush};
    run_remove(&main,&reports,&ptr,true,true,true);
    assert(calls.empty()&&reports.errors==1&&main.brushes.first==&brush);
  }
}
"""


if __name__ == "__main__":
    unittest.main(verbosity=2)
