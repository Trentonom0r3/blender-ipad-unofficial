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

WM_SOURCE = changed_source(WM_PATH)
IMAGE_FIND = function(WM_SOURCE, "static ID *wm_ipad_pencil_paint_image_find(")
TAGGED_IMAGE_TEARDOWN = function(
    WM_SOURCE, "bool WM_event_ipad_pencil_paint_tagged_images_teardown("
)
OUTLINER_EDIT_SOURCE = changed_source(OUTLINER_EDIT_PATH)
OUTLINER_TOOLS_SOURCE = changed_source(OUTLINER_TOOLS_PATH)


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
                self.assertLess(reset_tags, cancel)
                self.assertLess(cancel, delete)
                previous_delete = delete


if __name__ == "__main__":
    unittest.main()
