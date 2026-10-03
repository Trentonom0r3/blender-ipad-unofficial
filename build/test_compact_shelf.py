"""Compile presented-layout receipts and native handler admission from shipped source.

Mocks supply native owners/RNA and free callbacks; no UIKit/device input is claimed.
"""
import unittest
import test_ipad_panels
from test_touch_extrude import changed_source


def function(source, signature):
    start = source.index(signature)
    return source[start:source.index('\n}', start) + 2]


class CompactShelfTests(unittest.TestCase):
    def test_compact_and_expanded_fit_and_touch_widths(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r"""
#include "ipad_workspace_panels.hh"
#include <cassert>
namespace p=blender::ed::ipad::panels;
int main() {
 for(float scale:{1.f,1.5f,2.f}) for(int w:{190,208,232,264,288,332,400,600,768,1366})
 for(int h:{180,212,280,400,700,1024}) for(bool expanded:{false,true}) {
  const p::Rect canvas{17,29,17+int(w*scale),29+int(h*scale)};
  const auto shelf=p::editing_shelf(canvas,{},scale,expanded);
  if(shelf.empty()) continue;
  assert(shelf.width()<=int((expanded?736:336)*scale));
  const float inner=shelf.width()/scale-16;
  const int cells=expanded?(inner<308?3:inner>=560?8:4):(inner<264?3:5);
  assert(inner/cells>=44);
  assert(shelf.height()<=int((expanded?244:164)*scale));
  assert(shelf.ymax+int(80*scale)<=canvas.ymax);
 }
 const auto compact=p::editing_shelf({0,0,1024,834},{},1,false);
 const auto expanded=p::editing_shelf({0,0,1024,834},{},1,true);
 assert(compact.width()==336&&compact.height()==120);
 assert(expanded.width()==736&&expanded.height()==152);
 assert(p::editing_shelf({0,0,220,700},{},1,false).empty());
 // A compact bar can fit where the full layout cannot, retaining the native fallback otherwise.
 assert(!p::editing_shelf({0,0,340,230},{},1,false).empty());
 assert(p::editing_shelf({0,0,340,230},{},1,true).empty());
}
""")

    def test_queued_events_retire_only_shelf_and_never_lookup_stale_buttons(self):
        screen = changed_source('source/blender/editors/screen/screen_ipad_panels.cc')
        handlers = changed_source('source/blender/editors/interface/interface_handlers.cc')
        interface = changed_source('source/blender/editors/interface/interface.cc')
        helpers = '\n'.join(function(screen, signature) for signature in (
            'static bool editing_shelf_expanded(', 'static bool editing_shelf_rect_equal(',
            'bool ED_ipad_editing_shelf_hit(', 'bool ED_ipad_editing_shelf_stale(',
            'void ED_ipad_editing_shelf_invalidate('))
        helpers += '\n' + function(handlers, 'static int ui_ipad_shelf_input_guard(')
        start = interface.index('void UI_block_discard_rebuild(')
        helpers = '\n'.join(function(interface, signature) for signature in (
            'void UI_block_discard_rebuild(', 'void UI_block_discard_named_rebuild(')) + '\n' + helpers
        prefixes=[]
        for signature in ('static int ui_region_handler(', 'static int ui_handler_region_menu('):
            start=handlers.index(signature)
            end=handlers.index('  uiBut *but = ui_region_find_active_but(region);',start)
            prefixes.append(handlers[start:end] + '  (void)retval; ++lookups; return 99;\n}')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r"""
#define WITH_APPLE_CROSSPLATFORM
#include <cassert>
#include <map>
#include <string>
#include <vector>
#include <algorithm>
constexpr int PROP_BOOLEAN=1, WM_UI_HANDLER_BREAK=1, WM_UI_HANDLER_CONTINUE=0;
constexpr int LEFTMOUSE=1,MOUSEMOVE=2,GESTURE=3,KEYBOARD=4;
#define ISMOUSE(t) ((t)==LEFTMOUSE||(t)==MOUSEMOVE)
#define ISMOUSE_GESTURE(t) ((t)==GESTURE)
struct rcti {int xmin=0,xmax=0,ymin=0,ymax=0;};
struct PropertyRNA {int type=PROP_BOOLEAN,length=0;bool value=false;};
struct wmWindowManager {int id=0;PropertyRNA *property=nullptr;};
struct PointerRNA {wmWindowManager *wm;};
struct uiBlock {std::string name;uiBlock *oldblock=nullptr;bool active=false,freed=false;};
struct Map {
 std::map<std::string,uiBlock*> values;
 uiBlock *lookup_default(std::string k,uiBlock *fallback) {auto it=values.find(k);return it==values.end()?fallback:it->second;}
 void remove_as(std::string k){values.erase(k);}
};
struct Runtime {
 Map block_name_map;std::vector<uiBlock*> uiblocks;
 bool ipad_editing_shelf_presented=true,ipad_editing_shelf_visible=true,ipad_editing_shelf_expanded=false;
 float ipad_editing_shelf_scale=1;
 rcti ipad_editing_shelf_window_rect{100,900,200,800},ipad_editing_shelf_presented_rect{112,447,212,331};
};
struct ARegion {Runtime *runtime; rcti winrct{100,900,200,800};};
struct bContext {wmWindowManager *wm;ARegion *region,*popup=nullptr;bool fits=true;rcti desired{12,347,12,131};};
struct wmEvent {int type;int xy[2];};
float scale=1;
#define UI_SCALE_FAC scale
int lookups=0,frees=0,cancels=0,redraws=0;
wmWindowManager *CTX_wm_manager(bContext *C){return C->wm;}
ARegion *CTX_wm_region(bContext *C){return C->region;}
ARegion *CTX_wm_region_popup(bContext *C){return C->popup;}
PointerRNA RNA_id_pointer_create(int *id){return {reinterpret_cast<wmWindowManager*>(id)};}
PropertyRNA *RNA_struct_find_property(PointerRNA *p,const char *key){assert(std::string(key)=="ipad_editing_shelf_expanded");return p->wm->property;}
int RNA_property_type(PropertyRNA *p){return p->type;}
int RNA_property_array_length(PointerRNA *,PropertyRNA *p){return p->length;}
bool RNA_property_boolean_get(PointerRNA *,PropertyRNA *p){return p->value;}
void BLI_rcti_translate(rcti *r,int x,int y){r->xmin+=x;r->xmax+=x;r->ymin+=y;r->ymax+=y;}
bool BLI_rcti_isect_pt_v(const rcti *r,const int p[2]){return p[0]>=r->xmin&&p[0]<=r->xmax&&p[1]>=r->ymin&&p[1]<=r->ymax;}
bool ED_ipad_editing_shelf_rect(bContext *C,const ARegion *,rcti &r){r=C->desired;return C->fits;}
void editing_shelf_visible_set(bContext *,ARegion *r,bool value){r->runtime->ipad_editing_shelf_visible=value;}
void ED_region_tag_redraw(ARegion *){++redraws;}
bool BLI_listbase_is_empty(std::vector<uiBlock*> *items){return items->empty();}
void BLI_remlink(std::vector<uiBlock*> *items,uiBlock *block){auto it=std::find(items->begin(),items->end(),block);assert(it!=items->end());items->erase(it);}
void UI_block_free(const bContext *,uiBlock *block){assert(!block->freed);block->freed=true;++frees;if(block->active){block->active=false;++cancels;}}
HELPERS
PREFIXES
int main(){
 PropertyRNA property;wmWindowManager wm;wm.property=&property;
 Runtime runtime;ARegion region{&runtime};bContext C{&wm,&region};
 // Missing/re-registered/non-scalar RNA never leaves a cached owner.
 assert(!editing_shelf_expanded(&C));property.value=true;assert(editing_shelf_expanded(&C));
 property.type=2;assert(!editing_shelf_expanded(&C));property.type=1;property.length=1;
 assert(!editing_shelf_expanded(&C));property.length=0;wm.property=nullptr;assert(!editing_shelf_expanded(&C));
 PropertyRNA replacement;wm.property=&replacement;C.wm=nullptr;assert(!editing_shelf_expanded(&C));C.wm=&wm;
 const wmEvent old_tap{LEFTMOUSE,{120,220}},outside{LEFTMOUSE,{600,600}},gesture{GESTURE,{120,220}},key{KEYBOARD,{120,220}};
 assert(!ED_ipad_editing_shelf_stale(&C,&region));assert(ui_ipad_shelf_input_guard(&C,&region,&old_tap)==-1);
 assert(ui_region_handler(&C,&old_tap,nullptr)==0); // Empty, current block list.
 for(int change=0;change<6;++change){
  runtime=Runtime{};region.winrct=runtime.ipad_editing_shelf_window_rect;scale=1;C.fits=true;C.desired={12,347,12,131};replacement.value=false;
  uiBlock old{"VIEW3D_HT_ipad_editing_shelf",nullptr,true},fresh{"VIEW3D_HT_ipad_editing_shelf",&old,true},other{"other",nullptr,true};
  runtime.uiblocks={&fresh,&old,&other};runtime.block_name_map.values={{fresh.name,&fresh},{other.name,&other}};
  if(change==0)replacement.value=true;
  if(change==1)scale=2;
  if(change==2)region.winrct.xmin+=20;
  if(change==3)C.desired.xmax+=100;
  if(change==4)C.fits=false;
  if(change==5)runtime.ipad_editing_shelf_visible=false;
  assert(ED_ipad_editing_shelf_stale(&C,&region));
  const int before_lookup=lookups,before_free=frees,before_cancel=cancels;
  // Either native dispatch route must return without dereferencing retired controls.
  assert((change%2?ui_handler_region_menu:ui_region_handler)(&C,&old_tap,nullptr)==1);
  assert(lookups==before_lookup&&frees==before_free+2&&cancels==before_cancel+2);
  assert(!other.freed&&other.active&&runtime.uiblocks.size()==1);
  assert(runtime.block_name_map.lookup_default("other",nullptr)==&other);
  assert(runtime.ipad_editing_shelf_presented&&!runtime.ipad_editing_shelf_visible);
  assert(ED_ipad_editing_shelf_hit(&C,old_tap.xy));
  assert(ui_region_handler(&C,&gesture,nullptr)==1);assert(ui_handler_region_menu(&C,&key,nullptr)==0);
  assert(ui_region_handler(&C,&outside,nullptr)==0&&lookups==before_lookup);
  // More queued input remains shielded even when no native blocks remain.
  runtime.uiblocks.clear();assert(ui_region_handler(&C,&old_tap,nullptr)==1);
  assert(frees==before_free+2);
 }
 // Owned popup dispatch remains on the native popup path, not its stale parent footprint.
 C.popup=&region;const int before=lookups;
 assert(ui_handler_region_menu(&C,&old_tap,nullptr)==99&&lookups==before+1);C.popup=nullptr;
 // A real redraw clears the receipt when no shelf is presented.
 runtime.ipad_editing_shelf_presented=false;assert(!ED_ipad_editing_shelf_hit(&C,old_tap.xy));
 assert(ui_ipad_shelf_input_guard(&C,&region,&old_tap)==-1);
}
""".replace('HELPERS',helpers).replace('PREFIXES','\n'.join(prefixes)))

    def test_direct_edit_exclusion_uses_clipped_presented_global_receipt(self):
        source=changed_source('source/blender/editors/screen/screen_ipad_panels.cc')
        helper=function(source,'void ED_ipad_editing_canvas_parts(')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r"""
#include "ipad_workspace_panels.hh"
#include <cassert>
#include <vector>
#include <algorithm>
namespace policy=blender::ed::ipad::panels;
using Rect=policy::Rect;
struct rcti {int xmin,xmax,ymin,ymax;};
struct Runtime {rcti ipad_canvas_rect{0,399,0,399},ipad_editing_shelf_presented_rect{112,447,212,331};bool ipad_editing_shelf_presented=true;};
struct ARegion {Runtime *runtime;rcti winrct{100,499,200,599};};
struct bContext {};
rcti to_rect(Rect r){return {r.xmin,r.xmax-1,r.ymin,r.ymax-1};}
void BLI_rcti_translate(rcti *r,int x,int y){r->xmin+=x;r->xmax+=x;r->ymin+=y;r->ymax+=y;}
bool BLI_rcti_isect(const rcti *a,const rcti *b,rcti *out){*out={std::max(a->xmin,b->xmin),std::min(a->xmax,b->xmax),std::max(a->ymin,b->ymin),std::min(a->ymax,b->ymax)};return out->xmin<=out->xmax&&out->ymin<=out->ymax;}
bool hit(rcti r,int x,int y){return x>=r.xmin&&x<=r.xmax&&y>=r.ymin&&y<=r.ymax;}
HELPER
int main(){
 Runtime runtime;ARegion region{&runtime};
 for(int offset:{0,80,400,-400})for(bool presented:{false,true}){
  region.winrct={100+offset,499+offset,200,599};runtime.ipad_editing_shelf_presented=presented;
  std::vector<rcti> parts;ED_ipad_editing_canvas_parts(nullptr,&region,parts);
  for(int x=region.winrct.xmin;x<=region.winrct.xmax;x+=7)for(int y=200;y<=599;y+=7){
   int owners=presented&&hit(runtime.ipad_editing_shelf_presented_rect,x,y);
   for(auto part:parts)owners+=hit(part,x,y);
   assert(owners==1);
  }
 }
}
""".replace('HELPER',helper))


    def test_resolved_native_button_bounds_reject_overflow(self):
        helper=function(changed_source('source/blender/editors/interface/interface.cc'),
                        'bool UI_block_buttons_fit_rect(')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r"""
#include <cassert>
#include <memory>
#include <vector>
struct rcti {int xmin,xmax,ymin,ymax;};
struct rctf {float xmin,xmax,ymin,ymax;};
struct uiBut {rctf rect;};
struct uiBlock {std::vector<std::unique_ptr<uiBut>> buttons;};
HELPER
int main(){
 uiBlock block;const rcti bounds{10,201,20,179};
 for(rctf rect: {rctf{10,74,20,64},rctf{74,138,20,64},rctf{138,202,20,64},rctf{10,202,160,180}})
  block.buttons.push_back(std::make_unique<uiBut>(uiBut{rect}));
 assert(UI_block_buttons_fit_rect(&block,bounds));
 for(auto field:{&rctf::xmin,&rctf::xmax,&rctf::ymin,&rctf::ymax}){
  auto &rect=block.buttons.back()->rect;auto saved=rect;
  rect.*field=(field==&rctf::xmin?9.f:field==&rctf::ymin?19.f:field==&rctf::xmax?203.f:181.f);
  assert(!UI_block_buttons_fit_rect(&block,bounds));rect=saved;
 }
}
""".replace('HELPER',helper))

    def test_finger_geometry_option_survives_native_ring_transitions(self):
        from test_tool_ring import ring_source
        code=changed_source('source/blender/editors/interface/regions/interface_region_menu_pie.cc')
        self.assertIn('data->touch_tools = touch_targets;',code)
        transfer='RNA_boolean_set(but->opptr, "ipad_touch_targets", data.touch_tools);'
        self.assertIn(transfer,code)
        predicate='kind != ipad_ring::RingKind::Tools || data.touch_tools'
        self.assertIn(predicate,code)
        self.assertIn('ipad_ring && RNA_boolean_get(op->ptr, "ipad_touch_targets")',
                      changed_source('source/blender/windowmanager/intern/wm_operators.cc'))
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(ring_source().replace('#pragma once', '')+r"""
#include <cassert>
#include <string>
namespace ipad_ring=blender::ui::ipad;
struct Data {bool touch_tools;};
struct Props {bool finger=false;};
struct Button {Props *opptr;};
void RNA_boolean_set(Props *p,const char *name,bool value){assert(std::string(name)=="ipad_touch_targets");p->finger=value;}
void transfer(const Data &data,Button *but){TRANSFER}
int main(){
 for(bool finger:{false,true}){
  Data data{finger};
  for(auto kind:{ipad_ring::RingKind::Tools,ipad_ring::RingKind::Transform,
                 ipad_ring::RingKind::Selection,ipad_ring::RingKind::Tools}){
   const auto geometry=ipad_ring::tool_ring_layout(20,{0,1024,0,768},512,384,PREDICATE);
   assert(geometry.fits);
   for(auto r:geometry.buttons)assert(r.ymax-r.ymin>=(kind==ipad_ring::RingKind::Tools&&!finger?25.999f:43.999f));
   if(kind==ipad_ring::RingKind::Tools&&!finger)
    for(auto r:geometry.buttons)assert(r.ymax-r.ymin<44.f);
   Props deferred;Button but{&deferred};transfer(data,&but);
   assert(deferred.finger==finger);data.touch_tools=deferred.finger;
  }
 }
}
""".replace('TRANSFER',transfer).replace('PREDICATE',predicate))


if __name__ == '__main__':
    unittest.main()
