"""Execute the shared workspace tool-change paint-owner retirement path."""
import unittest

from test_compact_shelf import function
from test_touch_extrude import changed_source
import test_ipad_panels


TOOL_PATH = 'source/blender/windowmanager/intern/wm_toolsystem.cc'
TOOL = changed_source(TOOL_PATH)
HELPERS = '\n\n'.join(function(TOOL, marker) for marker in (
    'static bool toolsystem_ipad_window_is_live(',
    'static bool toolsystem_ipad_workspace_is_live(',
    'static bool toolsystem_ipad_pencil_owner_in_window(',
    'static bool toolsystem_ipad_pencil_owner_in_area(',
    'static bool toolsystem_ipad_other_manager_has_pencil_owner(',
    'static bool toolsystem_ipad_pencil_lifetime_is_live(',
    'static bool toolsystem_ipad_pencil_paint_owners_teardown(',
))
SETTER = function(TOOL, 'void WM_toolsystem_ref_set_from_runtime(')
GUARD_START = SETTER.index('#ifdef WITH_APPLE_CROSSPLATFORM')
GUARD_END = SETTER.index('if (tref->runtime)', GUARD_START)
SETTER_GUARD = SETTER[GUARD_START:GUARD_END]


class PencilToolSwitchTeardownTests(unittest.TestCase):
    def test_private_event_handler_types_have_their_native_header(self):
        self.assertIn('#include "wm_event_system.hh"', TOOL)

    def test_workspace_mutation_retires_matching_owners_before_unlink(self):
        self.assertLess(SETTER.index('toolsystem_ipad_pencil_paint_owners_teardown'),
                        SETTER.index('toolsystem_unlink_ref'))
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#define WITH_APPLE_CROSSPLATFORM
#include <cassert>
#include <cstdint>
#include <cstring>
#include <initializer_list>
#include <string>
#include <vector>
struct ListBase { void *first=nullptr; };
struct wmWindow; struct wmWindowManager; struct WorkSpace; struct bToolRef;
struct ViewLayer { const char *name="ViewLayer"; };
struct Scene { ViewLayer *layer=nullptr; };
struct ScrArea { ScrArea *next=nullptr; int spacetype=1, mode=7; };
struct bScreen { ListBase areabase; };
struct wmEventHandler { wmEventHandler *next=nullptr; int type=0; };
struct wmEventHandler_Op : wmEventHandler {
  uint64_t ipad_pencil_operator_lifetime=0;
  uint64_t ipad_pencil_paint_serial=0;
  uintptr_t ipad_pencil_area=0;
};
struct wmWindow {
  wmWindow *next=nullptr; void *runtime=nullptr;
  WorkSpace *workspace=nullptr; bScreen *screen=nullptr; Scene *scene=nullptr;
  const char *view_layer_name="ViewLayer"; ListBase modalhandlers;
};
struct ID { ID *next=nullptr; };
struct wmWindowManager : ID { ID id; ListBase windows; };
struct Main { ListBase workspaces; ListBase wm; };
struct bToolKey { int space_type=0, mode=0; };
struct bToolRef { int space_type=0, mode=0; bool runtime=true; char idname[64]="builtin.move"; };
struct WorkSpace { WorkSpace *next=nullptr; bToolRef *ref=nullptr; };
struct bContext { Main *main=nullptr; wmWindowManager *wm=nullptr; wmWindow *win=nullptr; };
#define LISTBASE_FOREACH(type,var,list) \
  for (type var=static_cast<type>((list)->first); var!=nullptr; var=static_cast<type>(var->next))
constexpr int WM_HANDLER_TYPE_OP=1;
bool refuse_cancel=false;
wmWindow *replace_context_window=nullptr;
bool add_foreign_owner_on_cancel=false;
wmWindow *foreign_owner_window=nullptr;
ScrArea *foreign_owner_area=nullptr;
wmEventHandler_Op *foreign_owner_handler=nullptr;
bToolRef *tool_ref_changed_on_cancel=nullptr;
std::vector<std::string> calls;
bool same(const char *a,const char *b) { return a && b && std::strcmp(a,b)==0; }
bool STREQ(const char *a,const char *b) { return same(a,b); }
template<size_t N> void STRNCPY_UTF8(char (&dst)[N],const char *src) {
  size_t length=std::strlen(src); if(length>=N) length=N-1;
  std::memcpy(dst,src,length); dst[length]='\0';
}
Main *CTX_data_main(const bContext *C) { return C ? C->main : nullptr; }
wmWindowManager *CTX_wm_manager(const bContext *C) { return C ? C->wm : nullptr; }
wmWindow *CTX_wm_window(const bContext *C) { return C ? C->win : nullptr; }
WorkSpace *WM_window_get_active_workspace(wmWindow *win) { return win->workspace; }
bScreen *WM_window_get_active_screen(wmWindow *win) { return win->screen; }
const Scene *WM_window_get_active_scene(wmWindow *win) { return win->scene; }
ViewLayer *BKE_view_layer_find(const Scene *scene,const char *name) {
  return scene && scene->layer && same(scene->layer->name,name) ? scene->layer : nullptr;
}
int WM_toolsystem_mode_from_spacetype(const Scene *,ViewLayer *,ScrArea *area,int) {
  return area->mode;
}
bToolRef *WM_toolsystem_ref_find(WorkSpace *workspace,const bToolKey *key) {
  return workspace && workspace->ref && workspace->ref->space_type==key->space_type &&
      workspace->ref->mode==key->mode ? workspace->ref : nullptr;
}
void append(ListBase *list,wmEventHandler *node) {
  node->next=nullptr;
  if(!list->first) { list->first=node; return; }
  auto *tail=static_cast<wmEventHandler *>(list->first);
  while(tail->next) tail=tail->next;
  tail->next=node;
}
void WM_event_ipad_pencil_paint_owner_teardown(bContext *C,wmWindow *win,
                                               const ScrArea *area,void *) {
  wmEventHandler *previous=nullptr;
  auto *base=static_cast<wmEventHandler *>(win->modalhandlers.first);
  while(base) {
    auto *next=base->next;
    if(base->type==WM_HANDLER_TYPE_OP) {
      auto *op=reinterpret_cast<wmEventHandler_Op *>(base);
      if(op->ipad_pencil_paint_serial && op->ipad_pencil_area==uintptr_t(area)) {
        calls.push_back("cancel-"+std::to_string(op->ipad_pencil_operator_lifetime));
        if(!refuse_cancel) {
          if(previous) previous->next=next; else win->modalhandlers.first=next;
        } else previous=base;
      } else previous=base;
    } else previous=base;
    base=next;
  }
  if(add_foreign_owner_on_cancel) {
    assert(foreign_owner_window && foreign_owner_area && foreign_owner_handler);
    add_foreign_owner_on_cancel=false;
    foreign_owner_handler->type=WM_HANDLER_TYPE_OP;
    foreign_owner_handler->ipad_pencil_operator_lifetime=41;
    foreign_owner_handler->ipad_pencil_paint_serial=141;
    foreign_owner_handler->ipad_pencil_area=uintptr_t(foreign_owner_area);
    append(&foreign_owner_window->modalhandlers,foreign_owner_handler);
  }
  if(tool_ref_changed_on_cancel) {
    std::memcpy(tool_ref_changed_on_cancel->idname,"builtin.select",sizeof("builtin.select"));
    tool_ref_changed_on_cancel=nullptr;
  }
  if(replace_context_window) C->win=replace_context_window;
}

HELPERS

bool set_tool(bContext *C,Main *bmain,WorkSpace *workspace,bToolRef *tref,const char *idname) {
  bool changed=false;
  const auto mutate=[&]() {
    Main *setter_main=bmain;
    (void)setter_main;
    SETTER_GUARD
    if(tref->runtime) calls.push_back("unlink");
    assert(std::strlen(idname)<sizeof(tref->idname));
    std::memcpy(tref->idname,idname,std::strlen(idname)+1);
    calls.push_back("mutate");
    changed=true;
  };
  mutate();
  return changed;
}

void append_window(wmWindowManager &wm,wmWindow &win) {
  win.next=nullptr;
  if(!wm.windows.first) { wm.windows.first=&win; return; }
  auto *tail=static_cast<wmWindow *>(wm.windows.first);
  while(tail->next) tail=tail->next;
  tail->next=&win;
}
void append_area(bScreen &screen,ScrArea &area) {
  area.next=nullptr;
  if(!screen.areabase.first) { screen.areabase.first=&area; return; }
  auto *tail=static_cast<ScrArea *>(screen.areabase.first);
  while(tail->next) tail=tail->next;
  tail->next=&area;
}
void add_owner(wmWindow &win,ScrArea &area,wmEventHandler_Op &owner,uint64_t life) {
  owner.type=WM_HANDLER_TYPE_OP; owner.ipad_pencil_operator_lifetime=life;
  owner.ipad_pencil_paint_serial=life+100; owner.ipad_pencil_area=uintptr_t(&area);
  append(&win.modalhandlers,&owner);
}
int main() {
  Main main; WorkSpace workspace,other_workspace; bToolRef ref,other_ref;
  ref.space_type=1; ref.mode=7; other_ref.space_type=1; other_ref.mode=7;
  workspace.ref=&ref; other_workspace.ref=&other_ref;
  /* Link workspaces through the native list fields. */
  main.workspaces.first=&workspace; workspace.next=&other_workspace; other_workspace.next=nullptr;
  wmWindowManager wm,foreign_wm;
  main.wm.first=&wm;
  wm.id.next=static_cast<ID *>(&foreign_wm);
  ViewLayer layer; Scene scene{&layer}; bScreen screen1,screen2,screen3,screen4,screen5;
  ScrArea area1,area2,area3,area_other_mode,area_other_workspace;
  area_other_mode.mode=99;
  append_area(screen1,area1); append_area(screen2,area2); append_area(screen3,area3);
  append_area(screen4,area_other_mode); append_area(screen5,area_other_workspace);
  wmWindow win1,win2,win3,win4,win5,foreign_win;
  for(wmWindow *win:{&win1,&win2,&win3,&win4,&win5,&foreign_win}) {
    win->runtime=reinterpret_cast<void *>(1); win->scene=&scene;
  }
  win1.workspace=&workspace; win1.screen=&screen1;
  win2.workspace=&workspace; win2.screen=&screen2;
  win3.workspace=&workspace; win3.screen=&screen3;
  win4.workspace=&workspace; win4.screen=&screen4;
  win5.workspace=&other_workspace; win5.screen=&screen5;
  foreign_win.workspace=&workspace; foreign_win.screen=&screen1;
  append_window(wm,win1); append_window(wm,win2); append_window(wm,win3);
  append_window(wm,win4); append_window(wm,win5);
  append_window(foreign_wm,foreign_win);
  wmEventHandler_Op owner1,owner2,owner3,unrelated1,unrelated2;
  add_owner(win1,area1,owner1,11); add_owner(win2,area2,owner2,12);
  add_owner(win3,area3,owner3,13);
  add_owner(win4,area_other_mode,unrelated1,14);
  add_owner(win5,area_other_workspace,unrelated2,15);
  bContext C{&main,&wm,&win1};
  assert(set_tool(&C,&main,&workspace,&ref,"builtin.rotate"));
  assert(same(ref.idname,"builtin.rotate"));
  assert(calls.size()==5 && calls[0]=="cancel-11" && calls[1]=="cancel-12" &&
         calls[2]=="cancel-13" && calls[3]=="unlink" && calls[4]=="mutate");
  assert(win4.modalhandlers.first==&unrelated1 && win5.modalhandlers.first==&unrelated2);

  /* An owner added by a native Cancel callback in another manager must stop the
   * shared ToolRef mutation, even though the initial cross-manager scan was clear. */
  calls.clear();
  wmEventHandler_Op reentrant_current,reentrant_foreign;
  add_owner(win1,area1,reentrant_current,40);
  foreign_owner_window=&foreign_win; foreign_owner_area=&area1;
  foreign_owner_handler=&reentrant_foreign; add_foreign_owner_on_cancel=true;
  assert(!set_tool(&C,&main,&workspace,&ref,"builtin.scale"));
  assert(same(ref.idname,"builtin.rotate"));
  assert(calls.size()==1 && calls[0]=="cancel-40");
  assert(foreign_win.modalhandlers.first==&reentrant_foreign);
  foreign_win.modalhandlers.first=nullptr;

  /* A pre-existing cross-manager owner is refused before any native mutation. */
  calls.clear();
  wmEventHandler_Op foreign_owner; add_owner(foreign_win,area1,foreign_owner,42);
  assert(!set_tool(&C,&main,&workspace,&ref,"builtin.scale"));
  assert(same(ref.idname,"builtin.rotate") && calls.empty());
  foreign_win.modalhandlers.first=nullptr;

  calls.clear(); refuse_cancel=true;
  bToolRef refused; refused.space_type=1; refused.mode=7;
  std::memcpy(refused.idname,"builtin.move",sizeof("builtin.move"));
  workspace.ref=&refused;
  wmEventHandler_Op blocked; add_owner(win1,area1,blocked,21);
  assert(!set_tool(&C,&main,&workspace,&refused,"builtin.scale"));
  assert(same(refused.idname,"builtin.move"));
  assert(calls.size()==1 && calls[0]=="cancel-21");
  refuse_cancel=false; replace_context_window=&win2;
  assert(!set_tool(&C,&main,&workspace,&refused,"builtin.scale"));
  assert(same(refused.idname,"builtin.move"));
  replace_context_window=nullptr; C.win=&win1;

  calls.clear();
  wmEventHandler_Op same_tool_owner; add_owner(win1,area1,same_tool_owner,31);
  assert(set_tool(&C,&main,&workspace,&refused,"builtin.move"));
  assert(calls.size()==2 && calls[0]=="unlink" && calls[1]=="mutate");
  assert(win1.modalhandlers.first==&same_tool_owner);

  /* A tagged owner without its lifetime proof also refuses before unlink. */
  calls.clear();
  win1.modalhandlers.first=nullptr;
  bToolRef lifetime_ref; lifetime_ref.space_type=1; lifetime_ref.mode=7;
  workspace.ref=&lifetime_ref;
  wmEventHandler_Op owner_without_lifetime;
  add_owner(win1,area1,owner_without_lifetime,50);
  owner_without_lifetime.ipad_pencil_operator_lifetime=0;
  assert(!set_tool(&C,&main,&workspace,&lifetime_ref,"builtin.rotate"));
  assert(same(lifetime_ref.idname,"builtin.move") && calls.empty());

  /* A synchronous callback that changes this same live ToolRef wins; the
   * outer stale request must not overwrite that reentrant selection. */
  win1.modalhandlers.first=nullptr;
  bToolRef reentrant_ref; reentrant_ref.space_type=1; reentrant_ref.mode=7;
  workspace.ref=&reentrant_ref;
  wmEventHandler_Op reentrant_owner; add_owner(win1,area1,reentrant_owner,60);
  tool_ref_changed_on_cancel=&reentrant_ref; calls.clear();
  assert(!set_tool(&C,&main,&workspace,&reentrant_ref,"builtin.scale"));
  assert(same(reentrant_ref.idname,"builtin.select"));
  assert(calls.size()==1 && calls[0]=="cancel-60");
  return 0;
}
'''.replace('HELPERS', HELPERS).replace('SETTER_GUARD', SETTER_GUARD))


if __name__ == '__main__':
    unittest.main()
