"""Execute native ring owner/draw gates and selection-property receipt seams.

Native UI lists/RNA/GPU draw are fixtures; this is not target modal/device proof.
"""
import unittest
from test_compact_shelf import function
from test_touch_extrude import changed_source
from test_touch_mode_access import WORLD, IDENTITY, POLICY
import test_ipad_panels
from test_pencil_ring_foundation import browse_source, ghost_source

NATIVE = changed_source('source/blender/editors/interface/regions/interface_region_menu_pie.cc')
TOOL = function(NATIVE, 'std::string ui_ipad_ring_tool_identity(')
GATES = '\n'.join(function(NATIVE, signature) for signature in (
    'bool ui_ipad_ring_waits_for_draw(', 'void ui_ipad_ring_draw_completed('))

UI_FIXTURE = r'''
namespace ipad_ring=blender::ui::ipad;
[[maybe_unused]] constexpr int UI_PIE_IPAD_TOOLS=128,UI_PIE_IPAD_SELECTION=512;
struct uiBlock;
struct uiPopupBlockHandle{
 bool can_refresh=true;
 struct{void *arg=nullptr;uiBlock *(*handle_create_func)(bContext *,uiPopupBlockHandle *,void *)=nullptr;}popup_create_vars;
 ipad_ring::ActionOrigin ipad_action_origin{};
};
template<class T>struct Vector:std::vector<T>{bool is_empty()const{return this->empty();}};
struct uiBlock{
 ipad_ring::ActionOrigin ipad_action_origin{};
 uiBlock *next=nullptr;struct{int flags=UI_PIE_IPAD_TOOLS;}pie_data;
 uiPopupBlockHandle *handle=nullptr;uint64_t ipad_ring_lifetime=0,ipad_ring_generation=0;
 Vector<int> buttons;
};
struct uiIPadRingData{
 ipad_ring::RingContextIdentity context;ipad_ring::Rect viewport{},window_rect{};
 float unit=20;std::string menu="VIEW3D_MT_ipad_selection_ring";
 uint64_t lifetime=1,generation=1,presented_generation=0;
 std::string tool_identity="builtin.select_box";bool input_suspended=true;int visible_count=9,window_height=768;
};
[[maybe_unused]] static uiBlock *ui_ipad_ring_create(bContext *,uiPopupBlockHandle *,void *){return nullptr;}
'''


class PencilRingNativeTests(unittest.TestCase):
    def run_cpp(self, code):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(POLICY+'\n'+code)

    def test_actual_resolved_draw_publishes_pixel_receipt_and_clipped_pages_stay_shielded(self):
        helper=function(NATIVE,'void ui_ipad_ring_draw_presented(')
        browse=browse_source().replace('#pragma once','').replace('#include "interface_ipad_tool_ring.hh"','')
        ghost=ghost_source().replace('#pragma once','')
        self.run_cpp(browse+ghost+r'''
#include <cassert>
#define WITH_APPLE_CROSSPLATFORM
namespace ipad_ring=blender::ui::ipad;
constexpr int UI_PIE_IPAD_TOOLS=128,UI_HIDDEN=1,UI_RETURN_CANCEL=1;
struct bContext{};struct uiBlock;struct rcti{int xmin,xmax,ymin,ymax;};
int BLI_rcti_size_x(const rcti *r){return r->xmax-r->xmin;}
int BLI_rcti_size_y(const rcti *r){return r->ymax-r->ymin;}
struct ARegion{rcti winrct;};
struct uiIPadRingDrawItem{int index;rcti rect;};
struct uiPopupBlockHandle{void *region=nullptr;bool can_refresh=true;struct{void *arg=nullptr;uiBlock *(*handle_create_func)(bContext *,uiPopupBlockHandle *,void *)=nullptr;}popup_create_vars;int menuretval=0;};
struct uiBut{int flag=0;bool ipad_ring_label_fit=true;};
struct uiBlock{struct{int flags=UI_PIE_IPAD_TOOLS;}pie_data;uiPopupBlockHandle *handle=nullptr;uint64_t ipad_ring_lifetime=1,ipad_ring_generation=1;std::vector<uiBut *> buttons;};
struct uiIPadRingData{
 std::string menu="VIEW3D_MT_ipad_tool_inventory";
 uint64_t lifetime=1,generation=1,presented_generation=0,contact_serial=0,roll_serial=0,roll_generation=0;int visible_count=9,inventory_count=43;
 ipad_ring::Rect viewport{40,900,50,700};float unit=20;int window_height=768;
 uint64_t refused_generation=0;bool navigation_rebuild=false;std::string inventory_key="native43";std::vector<bool> refresh_taps=std::vector<bool>(43,true);
 bool input_suspended=true;void *ghost_window=reinterpret_cast<void *>(uint64_t(71));ipad_ring::RingBrowseState browse;
};
[[maybe_unused]] static uiBlock *ui_ipad_ring_create(bContext *,uiPopupBlockHandle *,void *){return nullptr;}
bool ui_ipad_ring_child_open(const uiBlock *){return false;}
static void ui_ipad_ring_inventory_capture(const uiBlock*,uiIPadRingData&){}
void ED_region_tag_refresh_ui(void*){}
HELPER
int main(){
 uiIPadRingData data;data.browse.open(1);uiPopupBlockHandle handle{nullptr,true,{&data,ui_ipad_ring_create}};
 uiBlock block;block.handle=&handle;ARegion region{{300,700,150,600}};
 const auto page=ipad_ring::ring_page_layout(20,data.viewport,500,375,43,0);
 auto local=[&](ipad_ring::Rect r){return rcti{int(std::round(r.xmin))-region.winrct.xmin,int(std::round(r.xmax))-region.winrct.xmin,int(std::round(r.ymin))-region.winrct.ymin,int(std::round(r.ymax))-region.winrct.ymin};};
 std::vector<uiIPadRingDrawItem> items;
 for(int i=0;i<9;++i)items.push_back({page.indices[i],local(page.buttons[i])});
 auto bounds=local(page.footprint);auto present=[&](){ui_ipad_ring_draw_presented(&block,&region,bounds,items);};
 uiBut label_button;block.buttons.push_back(&label_button);
 auto next=[&](){++data.generation;data.browse.desired_generation=data.generation;block.ipad_ring_generation=data.generation;};
 label_button.ipad_ring_label_fit=false;present();assert(data.input_suspended&&!data.browse.ready()&&handle.menuretval==UI_RETURN_CANCEL);
 assert(!ghost::ios::pencil_ring_presentation(data.ghost_window).lifetime);
 label_button.flag=UI_HIDDEN;handle.menuretval=0;present();assert(data.input_suspended);next();present();assert(!data.input_suspended);
 label_button.flag=0;label_button.ipad_ring_label_fit=true;
 auto missing=items.back();items.pop_back();present();assert(data.input_suspended&&!data.browse.ready());items.push_back(missing);
 next();present();assert(data.browse.ready());
 int old=items[0].rect.xmin;items[0].rect.xmin=-1;present();assert(data.input_suspended);items[0].rect.xmin=old;next();present();
 old=items[0].index;items[0].index=43;present();assert(data.input_suspended);items[0].index=old;next();present();
 data.viewport.xmin=page.footprint.xmin+1;present();assert(data.input_suspended);data.viewport.xmin=40;next();present();
 assert(!data.input_suspended&&data.browse.ready());auto receipt=ghost::ios::pencil_ring_presentation(data.ghost_window);
 assert(receipt.lifetime==1&&receipt.generation==data.generation&&receipt.bounds.xmin==int(page.footprint.xmin));
 assert(receipt.bounds.ymin==768-int(page.footprint.ymax)&&receipt.bounds.ymax==768-int(page.footprint.ymin)-1);
 assert(data.browse.presented[0].identity==data.menu+":0");assert(data.browse.presented[0].bounds.xmin==std::round(page.buttons[0].xmin));
 data.browse.contact=true;data.browse.contact_valid=true;data.contact_serial=9;
 data.browse.roll_seeded=true;data.roll_serial=10;data.roll_generation=data.generation;
 ui_ipad_ring_draw_presented(&block,nullptr,{},{});
 assert(data.input_suspended&&!data.browse.ready()&&!data.browse.contact_valid&&!data.contact_serial&&!data.roll_serial&&!data.roll_generation);
 assert(!ghost::ios::pencil_ring_presentation(data.ghost_window).lifetime);
 present();assert(data.input_suspended);next();present();assert(data.browse.ready());
 auto original_bounds=bounds;++bounds.xmin;++bounds.xmax;for(auto &item:items){++item.rect.xmin;++item.rect.xmax;}
 present();assert(data.input_suspended&&!data.browse.ready()&&data.browse.presented.empty());
 assert(!ghost::ios::pencil_ring_presentation(data.ghost_window).lifetime);
 bounds=original_bounds;for(auto &item:items){--item.rect.xmin;--item.rect.xmax;}present();assert(data.input_suspended);next();present();
 // Cached redraw preserves the receipt; a stale block never advances it.
 present();assert(data.browse.ready());++data.generation;data.browse.desired_generation=data.generation;data.input_suspended=true;
 present();assert(data.input_suspended&&ghost::ios::pencil_ring_presentation(data.ghost_window).generation==data.generation-1);
 block.ipad_ring_generation=data.generation;present();assert(!data.input_suspended&&data.browse.ready());
 assert(ghost::ios::publish_pencil_ring(data.ghost_window,{2,1,{30,40,70,80}}));
 data.input_suspended=true;present();assert(data.input_suspended);
 ghost::ios::retire_pencil_ring(data.ghost_window,1);assert(ghost::ios::pencil_ring_presentation(data.ghost_window).lifetime==2);
 block.ipad_ring_lifetime=2;present();assert(data.input_suspended);
 block.ipad_ring_lifetime=1;handle.popup_create_vars.handle_create_func=nullptr;present();assert(data.input_suspended);
 handle.popup_create_vars.handle_create_func=ui_ipad_ring_create;handle.popup_create_vars.arg=nullptr;present();assert(data.input_suspended);

}
'''.replace('HELPER',helper))

    def test_draw_gate_requires_current_owned_generation_and_all_drawn_buttons(self):
        world=WORLD.replace('constexpr int RGN_TYPE_WINDOW','[[maybe_unused]] constexpr int RGN_TYPE_WINDOW')
        self.run_cpp(world+UI_FIXTURE+GATES+r'''
int main(){
 uiIPadRingData data;uiPopupBlockHandle handle{true,{&data,ui_ipad_ring_create}};
 uiBlock block;block.handle=&handle;block.ipad_ring_lifetime=1;block.ipad_ring_generation=1;
 block.buttons.resize(9);assert(ui_ipad_ring_waits_for_draw(&block));
 for(int count:{0,1,8,10}){ui_ipad_ring_draw_completed(&block,count);assert(ui_ipad_ring_waits_for_draw(&block));}
 ui_ipad_ring_draw_completed(&block,9);assert(!ui_ipad_ring_waits_for_draw(&block));
 // Cached-region redraw retains the same last-drawn generation.
 ui_ipad_ring_draw_completed(&block,9);assert(data.presented_generation==1&&!data.input_suspended);
 data.input_suspended=true;data.generation=2;
 ui_ipad_ring_draw_completed(&block,9);assert(ui_ipad_ring_waits_for_draw(&block)&&data.presented_generation==1);
 block.ipad_ring_generation=2;ui_ipad_ring_draw_completed(&block,8);assert(data.input_suspended);
 ui_ipad_ring_draw_completed(&block,9);assert(!ui_ipad_ring_waits_for_draw(&block)&&data.presented_generation==2);
 // A retired/replaced ring cannot be admitted by an old block or old teardown.
 data.lifetime=2;data.input_suspended=true;ui_ipad_ring_draw_completed(&block,9);assert(data.input_suspended);
 block.ipad_ring_lifetime=2;handle.popup_create_vars.handle_create_func=nullptr;
 ui_ipad_ring_draw_completed(&block,9);assert(data.input_suspended&&ui_ipad_ring_waits_for_draw(&block));
 handle.popup_create_vars.handle_create_func=ui_ipad_ring_create;handle.popup_create_vars.arg=nullptr;
 ui_ipad_ring_draw_completed(&block,9);assert(ui_ipad_ring_waits_for_draw(&block));
 block.pie_data.flags=0;assert(!ui_ipad_ring_waits_for_draw(&block));
}
''')

    def test_requested_selection_enum_is_copied_and_only_native_targets_admitted(self):
        helper=function(NATIVE,'std::string ui_ipad_ring_selection_target(')
        self.run_cpp(r'''
#include <cassert>
#include <string>
#include <cstring>
#define STREQ(a,b) (std::strcmp(a,b)==0)
struct bContext{};struct PropertyRNA{int type=1,array=0;};
struct PointerRNA{PropertyRNA *prop=nullptr;int value=0;std::string identifier="builtin.select_box";bool resolves=true;};
struct wmOperatorType{const char *idname="VIEW3D_OT_ipad_selection_tool";};
struct uiBut{wmOperatorType *optype;PointerRNA *opptr;};constexpr int PROP_ENUM=1;
PropertyRNA *RNA_struct_find_property(PointerRNA *p,const char *){return p->prop;}
int RNA_property_type(PropertyRNA *p){return p->type;}
int RNA_property_array_length(PointerRNA *,PropertyRNA *p){return p->array;}
int RNA_property_enum_get(PointerRNA *p,PropertyRNA *){return p->value;}
bool RNA_property_enum_identifier(bContext *,PointerRNA *p,PropertyRNA *,int,const char **out){*out=p->identifier.c_str();return p->resolves;}
HELPER
int main(){bContext C;PropertyRNA prop;PointerRNA ptr{&prop};wmOperatorType ot;uiBut but{&ot,&ptr};
 auto target=ui_ipad_ring_selection_target(&C,&but);assert(target=="builtin.select_box");
 ptr.identifier="builtin.select_lasso";assert(target=="builtin.select_box"&&ui_ipad_ring_selection_target(&C,&but)==ptr.identifier);
 ptr.identifier="builtin.rotate";assert(ui_ipad_ring_selection_target(&C,&but).empty());
 ptr.identifier="builtin.select_box";ptr.resolves=false;assert(ui_ipad_ring_selection_target(&C,&but).empty());ptr.resolves=true;
 prop.array=1;assert(ui_ipad_ring_selection_target(&C,&but).empty());prop.array=0;
 prop.type=0;assert(ui_ipad_ring_selection_target(&C,&but).empty());prop.type=1;
 ptr.prop=nullptr;assert(ui_ipad_ring_selection_target(&C,&but).empty());ptr.prop=&prop;
 but.opptr=nullptr;assert(ui_ipad_ring_selection_target(&C,&but).empty());but.opptr=&ptr;
 ot.idname="WM_OT_tool_set_by_id";assert(ui_ipad_ring_selection_target(&C,&but).empty());
 but.optype=nullptr;assert(ui_ipad_ring_selection_target(&C,&but).empty());
}
'''.replace('HELPER',helper))

    def test_live_page_validation_short_circuits_owners_before_tool_lookup(self):
        helper=function(NATIVE,'static bool ui_ipad_ring_data_valid(')
        self.run_cpp(WORLD+UI_FIXTURE+IDENTITY+r'''
#define WITH_APPLE_CROSSPLATFORM
struct bToolRef{const char *idname="builtin.select_box";};bToolRef tool;int tool_lookups=0;
bToolRef *WM_toolsystem_ref_from_context(const bContext *){++tool_lookups;return &tool;}
TOOL
struct MenuType{};MenuType menu;bool polls=true,safe=true;int safety_checks=0;
MenuType *WM_menutype_find(const char *,bool){return &menu;}
bool WM_menutype_poll(bContext *,MenuType *){return polls;}
bool WM_event_ipad_mode_safe(bContext *){++safety_checks;return safe;}
int native_height=768;
std::array<int,2> WM_window_native_pixel_size(wmWindow *){return {1024,native_height};}
constexpr float UI_UNIT_X=20;
ipad_ring::Rect ui_ipad_ring_window_rect(bContext *){return {20,800,30,700};}
ipad_ring::Rect ui_ipad_ring_viewport(bContext *){return {40,700,80,650};}
HELPER
int main(){Fixture f;uiIPadRingData data;data.context=ui_ipad_ring_identity(&f.C);
 data.viewport=ui_ipad_ring_viewport(&f.C);data.window_rect=ui_ipad_ring_window_rect(&f.C);
 assert(ui_ipad_ring_data_valid(&f.C,data));
 int lookups=tool_lookups;Object override=f.object;f.C.object=&override;
 assert(!ui_ipad_ring_data_valid(&f.C,data)&&tool_lookups==lookups);f.C.object=&f.object;
 f.scene.view_layers.first=nullptr;assert(!ui_ipad_ring_data_valid(&f.C,data)&&tool_lookups==lookups);f.scene.view_layers.first=&f.layer;
 f.area.regionbase.first=nullptr;assert(!ui_ipad_ring_data_valid(&f.C,data)&&tool_lookups==lookups);f.area.regionbase.first=&f.region;
 tool.idname="builtin.rotate";int checks=safety_checks;assert(!ui_ipad_ring_data_valid(&f.C,data)&&safety_checks==checks);tool.idname="builtin.select_box";
 safe=false;assert(!ui_ipad_ring_data_valid(&f.C,data));safe=true;
 native_height=800;assert(!ui_ipad_ring_data_valid(&f.C,data));native_height=768;
 polls=false;assert(!ui_ipad_ring_data_valid(&f.C,data));polls=true;
 data.unit=40;assert(!ui_ipad_ring_data_valid(&f.C,data));data.unit=20;
 data.viewport.xmax-=1;assert(!ui_ipad_ring_data_valid(&f.C,data));
}
'''.replace('TOOL',TOOL).replace('HELPER',helper))

    def test_rebase_reacquires_exact_live_ring_target_and_blocks_until_draw(self):
        world=WORLD.replace('struct RegionRuntime{bool visible=true;};',
            'struct uiBlock;struct RegionRuntime{bool visible=true;List<uiBlock> uiblocks;};').replace(
            'struct bScreen{ID id;List<ScrArea> areabase;};',
            'struct bScreen{ID id;List<ScrArea> areabase;List<ARegion> regionbase;};').replace(
            'bScreen screen{{8},{&area}};', 'bScreen screen{{8},{&area},{}};')
        helper=function(NATIVE,'void ui_ipad_ring_selection_rebase(')
        self.run_cpp(world+UI_FIXTURE+IDENTITY+r'''
#define LISTBASE_FOREACH(type,var,list) for(type var=(list)->first;var;var=var->next)
struct bToolRef{const char *idname="builtin.select_box";};bToolRef tool;
bToolRef *WM_toolsystem_ref_from_context(const bContext *){return &tool;}
TOOL
int refreshes=0,redraws=0;
void ED_region_tag_refresh_ui(ARegion *){++refreshes;}
void ED_region_tag_redraw(ARegion *){++redraws;}
REBASE
GATES
int main(){Fixture f;uint64_t receipt[13];assert(UI_ipad_context_capture(&f.C,receipt));
 RegionRuntime popup_runtime;ARegion popup{nullptr,&popup_runtime};f.screen.regionbase.first=&popup;
 uiIPadRingData data;data.context=ui_ipad_ring_identity(&f.C);data.input_suspended=false;data.presented_generation=1;
 uiPopupBlockHandle handle{true,{&data,ui_ipad_ring_create}};uiBlock block;
 block.handle=&handle;block.pie_data.flags|=UI_PIE_IPAD_SELECTION;block.ipad_ring_lifetime=1;block.ipad_ring_generation=1;block.buttons.resize(9);
 popup_runtime.uiblocks.first=&block;
 const std::string before="builtin.select_box",requested="builtin.select_lasso";
 auto rebase=[&](uint64_t id=1){ui_ipad_ring_selection_rebase(&f.C,receipt,before,requested,id);};
 rebase();assert(refreshes==0);tool.idname="builtin.select_lasso";
 rebase(2);assert(refreshes==0);handle.can_refresh=false;rebase();assert(refreshes==0);handle.can_refresh=true;
 handle.popup_create_vars.handle_create_func=nullptr;rebase();assert(refreshes==0);handle.popup_create_vars.handle_create_func=ui_ipad_ring_create;
 ++f.data.session_uid;rebase();assert(refreshes==0);--f.data.session_uid;
 data.tool_identity="builtin.rotate";rebase();assert(refreshes==0);data.tool_identity=before;
 rebase();assert(refreshes==1&&redraws==1&&data.tool_identity==requested&&data.input_suspended&&ui_ipad_ring_waits_for_draw(&block));
 // Only a newly rebuilt, actually drawn page can receive another choice.
 data.generation=2;ui_ipad_ring_draw_completed(&block,9);assert(data.input_suspended);
 block.ipad_ring_generation=2;ui_ipad_ring_draw_completed(&block,9);assert(!ui_ipad_ring_waits_for_draw(&block));
 data.lifetime=2;data.tool_identity=before;data.input_suspended=true;rebase();assert(refreshes==1&&data.input_suspended);
}
'''.replace('TOOL',TOOL).replace('REBASE',helper).replace('GATES',GATES))

    def test_native_draw_and_both_lookup_routes_use_the_gate(self):
        drawing=changed_source('source/blender/editors/interface/interface.cc')
        drawing=drawing[drawing.index('  /* widgets */'):]
        self.assertLess(drawing.index('ui_but_to_pixelrect(&rect, region, block, but.get())'),
                        drawing.index('++ipad_drawn_buttons'))
        self.assertLess(drawing.index('BLF_batch_draw_end()'),drawing.index('ui_ipad_ring_draw_completed('))
        handlers=changed_source('source/blender/editors/interface/interface_handlers.cc')
        popup=handlers[handlers.index('  uiBlock *root_block ='):]
        self.assertLess(popup.index('ui_ipad_ring_waits_for_draw(root_block)'),popup.index('ui_handle_menus_recursive('))
        modal=handlers[handlers.index('  uiBlock *ipad_root ='):]
        self.assertLess(modal.index('ui_ipad_ring_waits_for_draw(ipad_root)'),modal.index('ui_region_find_active_but(region)'))


if __name__=='__main__':unittest.main()
