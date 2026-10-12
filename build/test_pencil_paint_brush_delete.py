"""Exercise the native pre-free Brush lease teardown and its Outliner callers."""
from test_compact_shelf import function
from test_touch_extrude import changed_source
from pathlib import Path
import test_ipad_panels
import unittest


WM_PATH = "source/blender/windowmanager/intern/wm_event_system.cc"
OUTLINER_EDIT_PATH = "source/blender/editors/space_outliner/outliner_edit.cc"
OUTLINER_TOOLS_PATH = "source/blender/editors/space_outliner/outliner_tools.cc"
WM_API_PATH = "source/blender/windowmanager/WM_api.hh"
PATCH = (Path(__file__).resolve().parents[1] / "patches/blender-ipad.patch").read_text(encoding="utf-8")
WM = changed_source(WM_PATH)
BRUSH_TEARDOWN = function(WM, "bool WM_event_ipad_pencil_paint_tagged_brushes_teardown(")


def patch_section(path):
    marker = f"diff --git a/{path} b/{path}\n"
    return PATCH.split(marker, 1)[1].split("diff --git ", 1)[0]


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

""" + BRUSH_TEARDOWN + r"""

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

    def test_every_generic_outliner_delete_retires_before_free(self):
        edit = patch_section(OUTLINER_EDIT_PATH)
        tools = patch_section(OUTLINER_TOOLS_PATH)
        api = patch_section(WM_API_PATH)
        self.assertIn("bool WM_event_ipad_pencil_paint_tagged_brushes_teardown(Main *bmain);", api)
        self.assertNotIn('#include "WM_event_system.hh"', edit)
        self.assertNotIn('#include "WM_event_system.hh"', tools)
        click_delete = edit.split("@@ -601,2 +602,8", 1)[1].split("@@ -2387,3", 1)[0]
        purge_delete = edit.split("@@ -2385,5 +2392,11", 1)[1]
        delete_branch = tools.split("@@ -2958,4 +2959,10", 1)[1]
        helper = "WM_event_ipad_pencil_paint_tagged_brushes_teardown(bmain)"
        for body in (click_delete, purge_delete, delete_branch):
            new_source = "\n".join(line[1:] for line in body.splitlines()
                                    if line.startswith(("+", " ")) and not line.startswith("+++"))
            self.assertLess(new_source.index(helper), new_source.index("BKE_id_multi_tagged_delete(bmain);"))
            self.assertIn("BKE_main_id_tag_all(bmain, ID_TAG_DOIT, false)", new_source)
            self.assertIn("return OPERATOR_CANCELLED", new_source)


if __name__ == "__main__":
    unittest.main(verbosity=2)
