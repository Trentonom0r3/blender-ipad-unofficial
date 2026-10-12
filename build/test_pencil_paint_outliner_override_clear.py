"""Execute the native Outliner override-clear Pencil-owner preflight."""
from pathlib import Path
import unittest

import test_ipad_panels
from test_compact_shelf import function
from test_touch_extrude import changed_source


OUTLINER_TOOLS_PATH = "source/blender/editors/space_outliner/outliner_tools.cc"
OUTLINER_SOURCE = changed_source(OUTLINER_TOOLS_PATH)
OVERRIDE_GUARD = function(
    OUTLINER_SOURCE, "static bool id_override_clear_single_ipad_paint_owners("
)
OVERRIDE_PROCESS = function(
    OUTLINER_SOURCE, "static bool id_override_library_clear_single_process("
)


OVERRIDE_GUARD_CPP = r"""
#include <algorithm>
#include <cassert>
#include <cstdint>
#include <cstring>
#include <utility>
#include <vector>

template<class T> struct Vector : std::vector<T> {
  using std::vector<T>::vector;
  void append(const T &value) { this->push_back(value); }
  bool is_empty() const { return this->empty(); }
  T &first() { return this->front(); }
};
template<class T> struct Set : std::vector<T> {
  bool contains(const T &value) const {
    return std::find(this->begin(), this->end(), value) != this->end();
  }
  void add(const T &value) { this->push_back(value); }
};
template<class K, class V> struct Map {
  std::vector<std::pair<K, V>> values;
  auto items() const { return values; }
  Vector<K> keys() const {
    Vector<K> result;
    for (const auto &item : values) result.append(item.first);
    return result;
  }
  size_t size() const { return values.size(); }
  bool contains(const K &key) const {
    for (const auto &item : values) if (item.first == key) return true;
    return false;
  }
  const V &lookup(const K &key) const {
    for (const auto &item : values) if (item.first == key) return item.second;
    std::abort();
  }
  void add(const K &key, const V &value) { values.emplace_back(key, value); }
  void remove(const K &key) {
    values.erase(std::remove_if(values.begin(), values.end(),
                                [&](const auto &item) { return item.first == key; }),
                 values.end());
  }
};
struct IDOverrideLibrary;
struct ID {
  char name[2]{};
  uint32_t session_uid = 0;
  IDOverrideLibrary *override_library = nullptr;
  ID(const char *type = "OB", uint32_t uid = 0) : session_uid(uid) {
    name[0] = type[0]; name[1] = type[1];
  }
};
struct IDOverrideLibrary { ID *reference = nullptr; };
struct OutlinerLiboverrideDataIDRoot {
  ID *id_root_reference = nullptr;
  ID *id_hierarchy_root_override = nullptr;
  ID *id_instance_hint = nullptr;
  bool is_override_instancing_object = false;
};
struct ListBase { void *first = nullptr; };
struct wmWindowManager;
struct wmWindow;
struct wmEventHandler {
  wmEventHandler *next = nullptr;
  int type = 0;
};
struct wmEventHandler_Op : wmEventHandler {
  uint64_t ipad_pencil_paint_serial = 0;
  uint64_t ipad_pencil_operator_lifetime = 0;
};
struct wmWindow {
  wmWindow *next = nullptr;
  wmWindowManager *owner_wm = nullptr;
  int winid = 0;
  bool runtime = true;
  ListBase handlers, modalhandlers;
};
struct wmWindowManager {
  wmWindowManager *next = nullptr;
  ID id{"WM", 1};
  ListBase windows;
};
struct ScrArea {};
struct ARegion {};
struct Scene {};
struct ViewLayer {};
struct Main { ListBase wm; std::vector<ID *> ids; };
struct OutlinerLibOverrideData {
  Map<ID *, Vector<OutlinerLiboverrideDataIDRoot>> id_hierarchy_roots;
};
struct bContext {
  Main *main = nullptr;
  wmWindowManager *wm = nullptr;
  wmWindow *win = nullptr;
  ScrArea *area = nullptr;
  ARegion *region = nullptr;
  Scene *scene = nullptr;
  ViewLayer *view_layer = nullptr;
};
static Main *G_MAIN = nullptr;
enum { WM_HANDLER_TYPE_OP = 7 };
#define GS(name) (short((static_cast<unsigned char>(name[0]) << 8) | static_cast<unsigned char>(name[1])))
#define LISTBASE_FOREACH(type, item, list) \
  for (type item = static_cast<type>((list)->first); item; item = item->next)
static Main *CTX_data_main(const bContext *C) { return C->main; }
static wmWindowManager *CTX_wm_manager(const bContext *C) { return C->wm; }
static wmWindow *CTX_wm_window(const bContext *C) { return C->win; }
static ScrArea *CTX_wm_area(const bContext *C) { return C->area; }
static ARegion *CTX_wm_region(const bContext *C) { return C->region; }
static Scene *CTX_data_scene(const bContext *C) { return C->scene; }
static ViewLayer *CTX_data_view_layer(const bContext *C) { return C->view_layer; }
static void CTX_data_main_set(bContext *C, Main *value) { C->main = value; }
static void CTX_wm_manager_set(bContext *C, wmWindowManager *value) { C->wm = value; }
static void CTX_wm_window_set(bContext *C, wmWindow *value) { C->win = value; }
static bContext *CTX_create() { return new bContext; }
static void CTX_free(bContext *C) { delete C; }
static int BLI_findindex(const ListBase *list, const void *target) {
  int index = 0;
  for (auto *wm = static_cast<wmWindowManager *>(list->first); wm; wm = wm->next, index++) {
    if (wm == target) return index;
  }
  return -1;
}
static ID *BKE_libblock_find_session_uid(Main *main, short type, uint32_t uid) {
  ID *found = nullptr;
  for (ID *id : main->ids) {
    if (id->session_uid == uid && GS(id->name) == type) {
      assert(!found);
      found = id;
    }
  }
  return found;
}
static bContext *original_context = nullptr;
static OutlinerLibOverrideData *callback_data = nullptr;
static Main *replacement_main = nullptr;
static ID *replacement_reference = nullptr;
static bool refuse_teardown = false, remove_root = false, mutate_map = false;
static bool change_original_context = false, remove_owner_window = false, respawn_owner = false;
static int teardown_calls = 0;
static wmEventHandler_Op spawned_owner;
static wmWindow *spawn_window = nullptr;
static Main *current_main = nullptr;
static ID *root_id = nullptr;
static IDOverrideLibrary *root_override = nullptr;
static void append_handler(ListBase &list, wmEventHandler_Op *handler) {
  handler->next = nullptr;
  if (!list.first) { list.first = handler; return; }
  auto *item = static_cast<wmEventHandler *>(list.first);
  while (item->next) item = item->next;
  item->next = handler;
}
static void remove_pencil_handlers(ListBase &list) {
  auto *previous = static_cast<wmEventHandler *>(nullptr);
  auto *item = static_cast<wmEventHandler *>(list.first);
  while (item) {
    auto *next = item->next;
    if (item->type == WM_HANDLER_TYPE_OP &&
        reinterpret_cast<wmEventHandler_Op *>(item)->ipad_pencil_paint_serial) {
      if (previous) previous->next = next; else list.first = next;
    }
    else previous = item;
    item = next;
  }
}
static bool WM_event_ipad_pencil_paint_owner_teardown(
    bContext *C, wmWindow *win, const ScrArea *, const ARegion *) {
  assert(C && CTX_data_main(C) == G_MAIN && CTX_wm_window(C) == win);
  assert(CTX_wm_manager(C) == win->owner_wm);
  teardown_calls++;
  if (refuse_teardown) return false;
  remove_pencil_handlers(win->modalhandlers);
  if (change_original_context) original_context->scene = nullptr;
  if (remove_owner_window) {
    auto *manager = win->owner_wm;
    auto *previous = static_cast<wmWindow *>(nullptr);
    auto *item = static_cast<wmWindow *>(manager->windows.first);
    while (item && item != win) { previous = item; item = item->next; }
    assert(item);
    if (previous) previous->next = item->next; else manager->windows.first = item->next;
    item->next = nullptr;
  }
  if (remove_root) {
    current_main->ids.erase(std::remove(current_main->ids.begin(), current_main->ids.end(), root_id),
                            current_main->ids.end());
  }
  if (replacement_reference) root_override->reference = replacement_reference;
  if (mutate_map) callback_data->id_hierarchy_roots.remove(root_id);
  if (replacement_main) G_MAIN = replacement_main;
  if (respawn_owner) {
    respawn_owner = false;
    assert(spawn_window);
    spawned_owner.type = WM_HANDLER_TYPE_OP;
    spawned_owner.ipad_pencil_paint_serial = 99;
    spawned_owner.ipad_pencil_operator_lifetime = 909;
    append_handler(spawn_window->modalhandlers, &spawned_owner);
  }
  return true;
}
""" + OVERRIDE_GUARD + r"""
static void reset(Main &main, OutlinerLibOverrideData &data, bContext &C,
                  wmWindowManager &wm, wmWindow &win, ID &reference, ID &root,
                  IDOverrideLibrary &override) {
  root.name[0]='O';root.name[1]='B';root.session_uid=2;root.override_library=&override;
  reference.name[0]='O';reference.name[1]='B';reference.session_uid=3;
  override.reference=&reference;
  main.ids={&reference,&root};
  wm.id.session_uid=1;win.winid=10;win.owner_wm=&wm;win.runtime=true;
  wm.windows.first=&win;win.next=nullptr;wm.next=nullptr;main.wm.first=&wm;
  data.id_hierarchy_roots.values.clear();
  data.id_hierarchy_roots.add(&root,Vector<OutlinerLiboverrideDataIDRoot>{});
  G_MAIN=&main;C={&main,&wm,&win,new ScrArea,new ARegion,new Scene,new ViewLayer};
  original_context=&C;callback_data=&data;current_main=&main;root_id=&root;root_override=&override;
  replacement_main=nullptr;replacement_reference=nullptr;
  refuse_teardown=remove_root=mutate_map=change_original_context=remove_owner_window=respawn_owner=false;
  teardown_calls=0;spawn_window=nullptr;spawned_owner={};
}
static void cleanup_context(bContext &C) {
  delete C.area;delete C.region;delete C.scene;delete C.view_layer;
}
int main() {
  {
    Main main;OutlinerLibOverrideData data;bContext C;wmWindowManager wm;wmWindow win;
    ID reference,root;IDOverrideLibrary override;reset(main,data,C,wm,win,reference,root,override);
    assert(id_override_clear_single_ipad_paint_owners(&C,&main,data));
    assert(teardown_calls==0);
    cleanup_context(C);
  }
  {
    Main main;OutlinerLibOverrideData data;bContext C;wmWindowManager wm;wmWindow win;
    ID reference,root,image_reference,image_root,brush_reference,brush_root;
    IDOverrideLibrary override,image_override,brush_override;
    reset(main,data,C,wm,win,reference,root,override);
    image_reference.name[0]='I';image_reference.name[1]='M';image_reference.session_uid=4;
    image_root.name[0]='I';image_root.name[1]='M';image_root.session_uid=5;
    image_root.override_library=&image_override;image_override.reference=&image_reference;
    brush_reference.name[0]='B';brush_reference.name[1]='R';brush_reference.session_uid=6;
    brush_root.name[0]='B';brush_root.name[1]='R';brush_root.session_uid=7;
    brush_root.override_library=&brush_override;brush_override.reference=&brush_reference;
    main.ids.insert(main.ids.end(),{&image_reference,&image_root,&brush_reference,&brush_root});
    data.id_hierarchy_roots.add(&image_root,Vector<OutlinerLiboverrideDataIDRoot>{});
    data.id_hierarchy_roots.add(&brush_root,Vector<OutlinerLiboverrideDataIDRoot>{});
    assert(id_override_clear_single_ipad_paint_owners(&C,&main,data));
    assert(teardown_calls==0&&data.id_hierarchy_roots.size()==3);
    cleanup_context(C);
  }
  {
    Main main,other;OutlinerLibOverrideData data;bContext C;
    wmWindowManager wm1,wm2;wmWindow win1,win2;ID reference,root;IDOverrideLibrary override;
    reset(main,data,C,wm1,win1,reference,root,override);
    wm1.next=&wm2;wm2.id.session_uid=4;wm2.windows.first=&win2;win2.winid=20;win2.owner_wm=&wm2;
    win1.next=nullptr;main.wm.first=&wm1;
    wmEventHandler_Op owner;owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=7;
    owner.ipad_pencil_operator_lifetime=70;append_handler(win2.modalhandlers,&owner);
    assert(id_override_clear_single_ipad_paint_owners(&C,&main,data));
    assert(teardown_calls==1&&!win2.modalhandlers.first);
    cleanup_context(C);
  }
  {
    Main main;OutlinerLibOverrideData data;bContext C;wmWindowManager wm;wmWindow win;
    ID reference,root;IDOverrideLibrary override;reset(main,data,C,wm,win,reference,root,override);
    wmEventHandler_Op owner;owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=7;
    owner.ipad_pencil_operator_lifetime=70;append_handler(win.handlers,&owner);
    assert(!id_override_clear_single_ipad_paint_owners(&C,&main,data));
    assert(teardown_calls==0&&main.ids.size()==2);
    cleanup_context(C);
  }
  {
    Main main;OutlinerLibOverrideData data;bContext C;wmWindowManager wm;wmWindow win;
    ID reference,root;IDOverrideLibrary override;reset(main,data,C,wm,win,reference,root,override);
    wmEventHandler_Op owner;owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=7;
    owner.ipad_pencil_operator_lifetime=70;append_handler(win.modalhandlers,&owner);
    refuse_teardown=true;
    assert(!id_override_clear_single_ipad_paint_owners(&C,&main,data));
    assert(teardown_calls==1&&main.ids.size()==2&&data.id_hierarchy_roots.size()==1);
    cleanup_context(C);
  }
  {
    Main main;OutlinerLibOverrideData data;bContext C;wmWindowManager wm;wmWindow win;
    ID reference,root,other_reference;IDOverrideLibrary override;
    reset(main,data,C,wm,win,reference,root,override);
    other_reference.session_uid=4;other_reference.name[0]='O';other_reference.name[1]='B';
    main.ids.push_back(&other_reference);
    wmEventHandler_Op owner;owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=7;
    owner.ipad_pencil_operator_lifetime=70;append_handler(win.modalhandlers,&owner);
    replacement_reference=&other_reference;
    assert(!id_override_clear_single_ipad_paint_owners(&C,&main,data));
    assert(teardown_calls==1&&data.id_hierarchy_roots.size()==1);
    cleanup_context(C);
  }
  {
    Main main;OutlinerLibOverrideData data;bContext C;wmWindowManager wm;wmWindow win;
    ID reference,root;IDOverrideLibrary override;
    reset(main,data,C,wm,win,reference,root,override);
    wmEventHandler_Op owner;owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=7;
    owner.ipad_pencil_operator_lifetime=70;append_handler(win.modalhandlers,&owner);
    change_original_context=true;
    assert(!id_override_clear_single_ipad_paint_owners(&C,&main,data));
    assert(teardown_calls==1&&main.ids.size()==2);
    cleanup_context(C);
  }
  {
    Main main;OutlinerLibOverrideData data;bContext C;wmWindowManager wm;wmWindow win;
    ID reference,root;IDOverrideLibrary override;
    reset(main,data,C,wm,win,reference,root,override);
    wmEventHandler_Op owner;owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=7;
    owner.ipad_pencil_operator_lifetime=70;append_handler(win.modalhandlers,&owner);
    remove_root=true;
    assert(!id_override_clear_single_ipad_paint_owners(&C,&main,data));
    assert(teardown_calls==1&&!data.id_hierarchy_roots.values.empty());
    cleanup_context(C);
  }
  {
    Main main;OutlinerLibOverrideData data;bContext C;wmWindowManager wm;wmWindow win;
    ID reference,root;IDOverrideLibrary override;
    reset(main,data,C,wm,win,reference,root,override);
    wmEventHandler_Op owner;owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=7;
    owner.ipad_pencil_operator_lifetime=70;append_handler(win.modalhandlers,&owner);
    mutate_map=true;
    assert(!id_override_clear_single_ipad_paint_owners(&C,&main,data));
    assert(teardown_calls==1&&data.id_hierarchy_roots.values.empty());
    cleanup_context(C);
  }
  {
    Main main,other;OutlinerLibOverrideData data;bContext C;wmWindowManager wm;wmWindow win;
    ID reference,root;IDOverrideLibrary override;
    reset(main,data,C,wm,win,reference,root,override);
    wmEventHandler_Op owner;owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=7;
    owner.ipad_pencil_operator_lifetime=70;append_handler(win.modalhandlers,&owner);
    replacement_main=&other;
    assert(!id_override_clear_single_ipad_paint_owners(&C,&main,data));
    assert(teardown_calls==1&&G_MAIN==&other&&main.ids.size()==2);
    cleanup_context(C);
  }
  {
    Main main;OutlinerLibOverrideData data;bContext C;wmWindowManager wm;wmWindow win;
    ID reference,root;IDOverrideLibrary override;
    reset(main,data,C,wm,win,reference,root,override);
    wmEventHandler_Op owner;owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=7;
    owner.ipad_pencil_operator_lifetime=70;append_handler(win.modalhandlers,&owner);
    remove_owner_window=true;
    assert(!id_override_clear_single_ipad_paint_owners(&C,&main,data));
    assert(teardown_calls==1&&main.ids.size()==2);
    cleanup_context(C);
  }
  {
    Main main;OutlinerLibOverrideData data;bContext C;wmWindowManager wm;wmWindow win;
    ID reference,root;IDOverrideLibrary override;
    reset(main,data,C,wm,win,reference,root,override);
    wmEventHandler_Op first,second;first.type=second.type=WM_HANDLER_TYPE_OP;
    first.ipad_pencil_paint_serial=7;first.ipad_pencil_operator_lifetime=70;
    append_handler(win.modalhandlers,&first);
    wmWindowManager wm2;wmWindow win2;wm2.id.session_uid=8;wm2.windows.first=&win2;
    win2.winid=80;win2.owner_wm=&wm2;wm.next=&wm2;spawn_window=&win2;respawn_owner=true;
    second.type=WM_HANDLER_TYPE_OP;second.ipad_pencil_paint_serial=8;
    second.ipad_pencil_operator_lifetime=80;append_handler(win2.modalhandlers,&second);
    assert(id_override_clear_single_ipad_paint_owners(&C,&main,data));
    assert(teardown_calls==2&&!win.modalhandlers.first&&!win2.modalhandlers.first);
    cleanup_context(C);
  }
}
"""


class PencilPaintOutlinerOverrideClearTests(unittest.TestCase):
    def test_override_owner_preflight_executes_native_context_and_refusal_paths(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(OVERRIDE_GUARD_CPP)

    def test_override_preflight_runs_before_remap_delete_and_undo_push(self):
        self.assertLess(
            OVERRIDE_PROCESS.index("id_override_clear_single_ipad_paint_owners"),
            OVERRIDE_PROCESS.index("BKE_libblock_remap"),
        )
        self.assertLess(
            OVERRIDE_PROCESS.index("BKE_libblock_remap"),
            OVERRIDE_PROCESS.index("BKE_id_delete"),
        )
        call = OUTLINER_SOURCE.index(
            "if (!id_override_library_clear_single_process(C, op->reports, override_data))"
        )
        cancelled = OUTLINER_SOURCE.index("return OPERATOR_CANCELLED;", call)
        undo = OUTLINER_SOURCE.index('ED_undo_push(C, "Clear Overridden Data")', call)
        self.assertLess(call, cancelled)
        self.assertLess(cancelled, undo)


if __name__ == "__main__":
    unittest.main()
