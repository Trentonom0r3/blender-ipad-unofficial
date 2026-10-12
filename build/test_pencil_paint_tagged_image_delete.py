"""Execute tagged Image teardown and audit native multi-delete consumers."""
from pathlib import Path
import re
import unittest

import test_ipad_panels
from test_compact_shelf import function
from test_touch_extrude import changed_source


WM_PATH = "source/blender/windowmanager/intern/wm_event_system.cc"
OUTLINER_EDIT_PATH = "source/blender/editors/space_outliner/outliner_edit.cc"
OUTLINER_TOOLS_PATH = "source/blender/editors/space_outliner/outliner_tools.cc"
PATCH = (Path(__file__).resolve().parents[1] / "patches/blender-ipad.patch").read_text(encoding="utf-8")
PINNED_OUTLINER_TOOLS = (
    Path(__file__).resolve().parents[1]
    / ".cache/preflight/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e"
    / OUTLINER_TOOLS_PATH
).read_text(encoding="utf-8")

WM_SOURCE = changed_source(WM_PATH)
IMAGE_FIND = function(WM_SOURCE, "static ID *wm_ipad_pencil_paint_image_find(")
TAGGED_IMAGE_TEARDOWN = function(
    WM_SOURCE, "bool WM_event_ipad_pencil_paint_tagged_images_teardown("
)
OUTLINER_EDIT_SOURCE = changed_source(OUTLINER_EDIT_PATH)
OUTLINER_TOOLS_SOURCE = changed_source(OUTLINER_TOOLS_PATH)
OVERRIDE_IMAGE_GUARD = function(
    OUTLINER_TOOLS_SOURCE, "static bool id_override_clear_single_ipad_image_owners("
)


TAGGED_IMAGE_CPP = r"""
#include <algorithm>
#include <cassert>
#include <cstdint>
#include <vector>
struct ID { ID *next=nullptr;uint64_t session_uid=0;int tag=0; };
struct ListBase { void *first=nullptr; };
struct Main { ListBase images; };
static Main *G_MAIN=nullptr;
constexpr int ID_TAG_DOIT=1;
#define LISTBASE_FOREACH(type,item,list) \
  for(type item=static_cast<type>((list)->first);item;item=item->next)
""" + IMAGE_FIND + r"""
static std::vector<uint64_t> teardown_uids;
static uint64_t fail_uid=0,remove_uid=0,untag_uid=0,add_uid=0;
static Main *replace_main=nullptr;
static ID *added_image=nullptr;
static void unlink_image(Main &main,uint64_t uid){
  ID *prev=nullptr,*item=static_cast<ID*>(main.images.first);
  while(item&&item->session_uid!=uid){prev=item;item=item->next;}
  assert(item);
  if(prev)prev->next=item->next;else main.images.first=item->next;
  item->next=nullptr;
}
bool WM_event_ipad_pencil_paint_image_teardown(Main *main,uint64_t uid){
  assert(main==G_MAIN);
  teardown_uids.push_back(uid);
  if(uid==fail_uid)return false;
  if(uid==remove_uid)unlink_image(*main,uid);
  if(uid==untag_uid){
    ID *item=static_cast<ID*>(main->images.first);
    while(item&&item->session_uid!=uid)item=item->next;
    assert(item);item->tag&=~ID_TAG_DOIT;
  }
  if(uid==add_uid){
    assert(added_image);
    added_image->session_uid=77;added_image->tag=ID_TAG_DOIT;
    added_image->next=static_cast<ID*>(main->images.first);main->images.first=added_image;
  }
  if(replace_main)G_MAIN=replace_main;
  return true;
}
""" + TAGGED_IMAGE_TEARDOWN + r"""
static void reset(Main &main){
  G_MAIN=&main;teardown_uids.clear();fail_uid=remove_uid=untag_uid=add_uid=0;
  replace_main=nullptr;added_image=nullptr;
}
int main(){
  {
    Main main;reset(main);
    assert(WM_event_ipad_pencil_paint_tagged_images_teardown(&main));
    assert(teardown_uids.empty());
  }
  {
    Main main;ID a,b,c;a.session_uid=1;a.tag=ID_TAG_DOIT;b.session_uid=2;
    c.session_uid=3;c.tag=ID_TAG_DOIT;a.next=&b;b.next=&c;main.images.first=&a;reset(main);
    assert(WM_event_ipad_pencil_paint_tagged_images_teardown(&main));
    assert((teardown_uids==std::vector<uint64_t>{1,3}));
    assert((a.tag&ID_TAG_DOIT)&&(c.tag&ID_TAG_DOIT));
  }
  {
    Main main;ID a,b;a.session_uid=4;a.tag=ID_TAG_DOIT;b.session_uid=5;b.tag=ID_TAG_DOIT;
    a.next=&b;main.images.first=&a;reset(main);fail_uid=5;
    assert(!WM_event_ipad_pencil_paint_tagged_images_teardown(&main));
    assert((teardown_uids==std::vector<uint64_t>{4,5}));
  }
  {
    Main main;ID a;a.session_uid=6;a.tag=ID_TAG_DOIT;main.images.first=&a;reset(main);
    remove_uid=6;
    assert(!WM_event_ipad_pencil_paint_tagged_images_teardown(&main));
    assert(teardown_uids.size()==1&&!main.images.first);
  }
  {
    Main main;ID a;a.session_uid=7;a.tag=ID_TAG_DOIT;main.images.first=&a;reset(main);
    untag_uid=7;
    assert(!WM_event_ipad_pencil_paint_tagged_images_teardown(&main));
  }
  {
    Main main;ID a,added;a.session_uid=8;a.tag=ID_TAG_DOIT;main.images.first=&a;reset(main);
    add_uid=8;added_image=&added;
    assert(!WM_event_ipad_pencil_paint_tagged_images_teardown(&main));
  }
  {
    Main main,other;ID a;a.session_uid=9;a.tag=ID_TAG_DOIT;main.images.first=&a;reset(main);
    replace_main=&other;
    assert(!WM_event_ipad_pencil_paint_tagged_images_teardown(&main));
    assert(G_MAIN==&other);
  }
  {
    Main main;ID a;a.session_uid=0;a.tag=ID_TAG_DOIT;main.images.first=&a;reset(main);
    assert(!WM_event_ipad_pencil_paint_tagged_images_teardown(&main));
    assert(teardown_uids.empty());
  }
  {
    Main main;ID a,b;a.session_uid=10;a.tag=ID_TAG_DOIT;b.session_uid=10;b.tag=ID_TAG_DOIT;
    a.next=&b;main.images.first=&a;reset(main);
    assert(!WM_event_ipad_pencil_paint_tagged_images_teardown(&main));
    assert(teardown_uids.empty());
  }
}
"""


OVERRIDE_IMAGE_GUARD_CPP = r"""
#include <cassert>
#include <cstdint>
#include <vector>
struct ID { ID *next=nullptr;uint64_t session_uid=0;char name[2]={'O','\0'}; };
struct ListBase { void *first=nullptr; };
struct Main { ListBase images; };
struct ImageRoots { std::vector<ID*> values; const std::vector<ID*>& keys() const{return values;} };
struct OutlinerLibOverrideData { ImageRoots id_hierarchy_roots; };
template<class T> struct Vector:std::vector<T>{void append(const T&v){this->push_back(v);}};
template<class T> struct Set{
  std::vector<T> values;
  bool contains(const T&v)const{for(const T&x:values)if(x==v)return true;return false;}
  void add(const T&v){values.push_back(v);}
};
static Main *G_MAIN=nullptr;
constexpr char ID_IM='I';
#define GS(name) ((name)[0])
#define LISTBASE_FOREACH(type,item,list) \
  for(type item=static_cast<type>((list)->first);item;item=item->next)
static std::vector<uint64_t> calls;
static uint64_t fail_uid=0,remove_uid=0;
static Main *replace_main=nullptr;
static void unlink_image(Main &main,uint64_t uid){
  ID *prev=nullptr,*item=static_cast<ID*>(main.images.first);
  while(item&&item->session_uid!=uid){prev=item;item=item->next;}
  assert(item);
  if(prev)prev->next=item->next;else main.images.first=item->next;
  item->next=nullptr;
}
bool WM_event_ipad_pencil_paint_image_teardown(Main *main,uint64_t uid){
  calls.push_back(uid);
  if(uid==fail_uid)return false;
  if(uid==remove_uid)unlink_image(*main,uid);
  if(replace_main)G_MAIN=replace_main;
  return true;
}
""" + OVERRIDE_IMAGE_GUARD + r"""
static void reset(Main &main){G_MAIN=&main;calls.clear();fail_uid=remove_uid=0;replace_main=nullptr;}
int main(){
  {
    Main main;ID object;OutlinerLibOverrideData data;data.id_hierarchy_roots.values={&object};reset(main);
    assert(id_override_clear_single_ipad_image_owners(&main,data));assert(calls.empty());
  }
  {
    Main main;ID a,b,object;a.name[0]=b.name[0]=ID_IM;a.session_uid=1;b.session_uid=2;
    a.next=&b;main.images.first=&a;OutlinerLibOverrideData data;data.id_hierarchy_roots.values={&a,&object,&b};reset(main);
    assert(id_override_clear_single_ipad_image_owners(&main,data));assert((calls==std::vector<uint64_t>{1,2}));
  }
  {
    Main main;ID a,b;a.name[0]=b.name[0]=ID_IM;a.session_uid=3;b.session_uid=4;
    a.next=&b;main.images.first=&a;OutlinerLibOverrideData data;data.id_hierarchy_roots.values={&a,&b};reset(main);fail_uid=4;
    assert(!id_override_clear_single_ipad_image_owners(&main,data));assert((calls==std::vector<uint64_t>{3,4}));
  }
  {
    Main main,other;ID a;a.name[0]=ID_IM;a.session_uid=5;main.images.first=&a;
    OutlinerLibOverrideData data;data.id_hierarchy_roots.values={&a};reset(main);replace_main=&other;
    assert(!id_override_clear_single_ipad_image_owners(&main,data));assert(G_MAIN==&other);assert(calls.size()==1);
  }
  {
    Main main;ID a,b;a.name[0]=b.name[0]=ID_IM;a.session_uid=6;b.session_uid=7;
    a.next=&b;main.images.first=&a;OutlinerLibOverrideData data;data.id_hierarchy_roots.values={&a,&b};reset(main);remove_uid=6;
    assert(!id_override_clear_single_ipad_image_owners(&main,data));assert((calls==std::vector<uint64_t>{6}));
  }
  {
    Main main;ID a,b;a.name[0]=b.name[0]=ID_IM;a.session_uid=8;b.session_uid=8;
    OutlinerLibOverrideData data;data.id_hierarchy_roots.values={&a,&b};reset(main);
    assert(!id_override_clear_single_ipad_image_owners(&main,data));assert(calls.empty());
  }
  {
    Main main;ID a;a.name[0]=ID_IM;a.session_uid=0;OutlinerLibOverrideData data;
    data.id_hierarchy_roots.values={&a};reset(main);
    assert(!id_override_clear_single_ipad_image_owners(&main,data));assert(calls.empty());
  }
}
"""


class PencilPaintTaggedImageDeleteTests(unittest.TestCase):
    def test_tagged_image_owner_teardown_reacquires_and_fails_closed(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(TAGGED_IMAGE_CPP)

    def test_every_native_tagged_delete_site_guards_images_before_free(self):
        sites = ((OUTLINER_EDIT_SOURCE, 2), (OUTLINER_TOOLS_SOURCE, 2))
        self.assertEqual(PATCH.count("WM_event_ipad_pencil_paint_tagged_images_teardown(bmain)"), 4)
        for source, expected_sites in sites:
            deletions = [match.start() for match in re.finditer("BKE_id_multi_tagged_delete\\(bmain\\)", source)]
            self.assertEqual(len(deletions), expected_sites)
            previous_delete = -1
            for delete in deletions:
                guard_branch = source.rfind(
                    "if (!WM_event_ipad_pencil_paint_tagged_images_teardown(bmain))", 0, delete
                )
                self.assertGreater(guard_branch, previous_delete)
                reset_tags = source.index("BKE_main_id_tag_all(bmain, ID_TAG_DOIT, false)", guard_branch)
                cancel = source.index("return OPERATOR_CANCELLED;", guard_branch)
                self.assertLess(guard_branch, reset_tags)
                self.assertIn("if (G_MAIN == bmain)", source[guard_branch:reset_tags])
                self.assertLess(reset_tags, cancel)
                self.assertLess(cancel, delete)
                previous_delete = delete

    def test_generic_library_override_image_teardown_precedes_remap_and_delete(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(OVERRIDE_IMAGE_GUARD_CPP)
        helper_start = OUTLINER_TOOLS_SOURCE.index(
            "static bool id_override_clear_single_ipad_image_owners("
        )
        function_start = OUTLINER_TOOLS_SOURCE.index(
            "static bool id_override_library_clear_single_process("
        )
        self.assertLess(helper_start, function_start)
        guard = OUTLINER_TOOLS_SOURCE.index(
            "id_override_clear_single_ipad_image_owners(bmain, data)", function_start
        )
        view_layer = OUTLINER_TOOLS_SOURCE.index("ViewLayer *view_layer = CTX_data_view_layer(C);", function_start)
        self.assertLess(function_start, guard)
        self.assertLess(guard, view_layer)

        patch_start = PATCH.index("diff --git a/source/blender/editors/space_outliner/outliner_tools.cc")
        patch_end = PATCH.index("diff --git ", patch_start + 1)
        patch_section = PATCH[patch_start:patch_end]
        patch_guard = patch_section.index("id_override_clear_single_ipad_image_owners(bmain, data)")
        hunk_start = patch_section.rfind("@@ -", 0, patch_guard)
        hunk = patch_section[hunk_start:patch_section.index("\n", hunk_start)]
        original_guard_line = int(re.match(r"@@ -(\d+),", hunk).group(1))
        pinned_function = PINNED_OUTLINER_TOOLS.index(
            "static void id_override_library_clear_single_process("
        )
        remap = PINNED_OUTLINER_TOOLS.index("BKE_libblock_remap(", pinned_function)
        deletion = PINNED_OUTLINER_TOOLS.index("BKE_id_delete(bmain, id)", remap)
        native_remap_line = PINNED_OUTLINER_TOOLS[:remap].count("\n") + 1
        self.assertLess(original_guard_line, native_remap_line)
        self.assertLess(remap, deletion)

        caller = OUTLINER_TOOLS_SOURCE.index("if (!id_override_library_clear_single_process(")
        self.assertIn("return OPERATOR_CANCELLED;", OUTLINER_TOOLS_SOURCE[caller:])
        native_call = PINNED_OUTLINER_TOOLS.index(
            "id_override_library_clear_single_process(C, op->reports, override_data);"
        )
        undo_push = PINNED_OUTLINER_TOOLS.index(
            'ED_undo_push(C, "Clear Overridden Data")', native_call
        )
        self.assertLess(native_call, undo_push)


if __name__ == "__main__":
    unittest.main()
