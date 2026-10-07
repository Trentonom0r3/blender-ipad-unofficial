"""Execute value provenance, native child creation and live context rebinding.

RNA tree/callback ownership and target popup/gesture lifetimes remain separate.
"""
import unittest
from test_tool_ring import ring_source
import test_ipad_panels
from test_touch_extrude import changed_source
from test_compact_shelf import function
from test_touch_mode_access import WORLD, IDENTITY

NATIVE=changed_source('source/blender/editors/interface/regions/interface_region_menu_pie.cc')
POPUP=changed_source('source/blender/editors/interface/regions/interface_region_popup.cc')

ORIGIN_WORLD=WORLD+r'''
#define LISTBASE_FOREACH(type,var,list) for(type var=(list)->first;var;var=var->next)
void CTX_wm_area_set(bContext *C,ScrArea *area){C->area=area;}
void CTX_wm_region_set(bContext *C,ARegion *region){C->region=region;}
std::string live_tool="builtin.move";int tool_reads=0;
std::string ui_ipad_ring_tool_identity(bContext *){++tool_reads;return live_tool;}
'''+IDENTITY+'\n'+function(NATIVE,'bool ui_ipad_action_origin_valid(')+'\n'+function(NATIVE,'bool ui_ipad_action_origin_rebind(')

def creator_scope():
    header=changed_source('source/blender/editors/interface/interface_intern.hh')
    begin=header.index('class uiIPadActionOriginScope {')
    declaration=header[begin:header.index('\n};',begin)+3]
    return 'static thread_local ipad_ring::ActionOrigin ui_ipad_scoped_action_origin;\n'+declaration+'\n'+'\n'.join(function(NATIVE,s) for s in (
        'uiIPadActionOriginScope::uiIPadActionOriginScope(',
        'uiIPadActionOriginScope::~uiIPadActionOriginScope(',
        'ipad_ring::ActionOrigin ui_ipad_action_origin_current('))

class PencilActionOriginTests(unittest.TestCase):
    def test_native_refresh_copy_is_independent_and_context_or_tool_change_refuses(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(ring_source().replace('#pragma once','')+r'''
#include <cassert>
#include <string>
int main(){using blender::ui::ipad::ActionOrigin;
 std::array<uint64_t,13> live{1,2,3,4,5,6,7,8,9,0,11,12,13};
 auto origin=ActionOrigin::capture(live,"builtin.move",7);assert(origin.present()&&origin.matches(live,"builtin.move"));
 struct NativeHandleFixture{int before=19;ActionOrigin origin;int after=23;};
 NativeHandleFixture original{19,origin,23},copy;
 std::memcpy(&copy,&original,sizeof(copy));original.origin.tool[0]='x';original.origin.context[0]=99;
 assert(copy.before==19&&copy.after==23&&copy.origin.matches(live,"builtin.move"));
 for(int i=0;i<13;++i){auto changed=live;++changed[i];assert(!copy.origin.matches(changed,"builtin.move"));}
 assert(!copy.origin.matches(live,"builtin.rotate"));
 assert(!ActionOrigin::capture(live,"builtin.move",0).present());
 auto missing=live;missing[4]=0;assert(!ActionOrigin::capture(missing,"builtin.move",7).present());
 assert(!ActionOrigin::capture(live,std::string_view("bad\0id",6),7).present());
 const std::string too_long(64,'x');assert(!ActionOrigin::capture(live,too_long,7).present());
 // Empty native tool is a valid context, not an invented fallback tool.
 assert(ActionOrigin::capture(live,"",7).matches(live,""));
}
''')

    def test_root_populates_native_copyable_fields_without_changing_child_layout(self):
        source=changed_source('source/blender/editors/interface/regions/interface_region_menu_pie.cc')
        self.assertIn('handle->ipad_action_origin = block->ipad_action_origin;',source)
        self.assertIn('sizeof(bToolRef::idname) == ipad_ring::ActionOrigin::tool_capacity',source)
        fields=changed_source('source/blender/editors/interface/interface_intern.hh')
        self.assertEqual(fields.count('ActionOrigin ipad_action_origin{};'),2)

    def test_rebind_requires_live_native_lists_before_old_area_region_or_tool_access(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(ring_source().replace('#pragma once','')+ORIGIN_WORLD+r'''
int main(){
 Fixture f;auto *C=&f.C;uint64_t values[13];assert(UI_ipad_context_capture(C,values));
 std::array<uint64_t,13> copied;std::copy(values,values+13,copied.begin());
 auto origin=ipad_ring::ActionOrigin::capture(copied,live_tool,7);
 ScrArea unrelated;ARegion unrelated_region;C->area=&unrelated;C->region=&unrelated_region;
 assert(ui_ipad_action_origin_rebind(C,origin)&&C->area==&f.area&&C->region==&f.region);
 // Removal means even a deliberately unreadable old address is never followed.
 C->area=reinterpret_cast<ScrArea *>(1);C->region=reinterpret_cast<ARegion *>(1);
 f.screen.areabase.first=nullptr;tool_reads=0;
 assert(!ui_ipad_action_origin_rebind(C,origin)&&tool_reads==0);
 f.screen.areabase.first=&f.area;f.area.regionbase.first=nullptr;
 assert(!ui_ipad_action_origin_rebind(C,origin)&&tool_reads==0);
 f.area.regionbase.first=&f.region;
 ++f.screen.id.session_uid;assert(!ui_ipad_action_origin_rebind(C,origin)&&tool_reads==0);--f.screen.id.session_uid;
 ++f.window.winid;assert(!ui_ipad_action_origin_rebind(C,origin)&&tool_reads==0);--f.window.winid;
 ++f.wm.id.session_uid;assert(!ui_ipad_action_origin_rebind(C,origin)&&tool_reads==0);--f.wm.id.session_uid;
 Main other;C->main=&other;assert(!ui_ipad_action_origin_rebind(C,origin)&&tool_reads==0);C->main=&f.main;
 live_tool="builtin.rotate";assert(!ui_ipad_action_origin_rebind(C,origin));
 assert(C->area==reinterpret_cast<ScrArea *>(1)&&C->region==reinterpret_cast<ARegion *>(1));
 live_tool="builtin.move";assert(ui_ipad_action_origin_rebind(C,origin));
 f.object.mode=1;assert(!ui_ipad_action_origin_valid(C,origin));f.object.mode=0;
 ++f.data.session_uid;assert(!ui_ipad_action_origin_valid(C,origin));--f.data.session_uid;
 // Ordinary native popups need no iPad editing owner or tool lookup.
 C->area=nullptr;C->region=nullptr;tool_reads=0;
 assert(ui_ipad_action_origin_valid(C,{})&&ui_ipad_action_origin_rebind(C,{})&&tool_reads==0);
}
''')

    def test_creator_scope_restores_after_nested_children_and_exception(self):
        header=changed_source('source/blender/editors/interface/interface_intern.hh')
        begin=header.index('class uiIPadActionOriginScope {')
        declaration=header[begin:header.index('\n};',begin)+3]
        # Native UNDO operators draw their initial dialog inside op_undo_depth;
        # provenance must remain separate from a new-input admission check.
        self.assertNotIn('WM_event_ipad_mode_safe',function(NATIVE,'bool ui_ipad_action_origin_valid('))
        scope='static thread_local ipad_ring::ActionOrigin ui_ipad_scoped_action_origin;\n'+declaration+'\n'+'\n'.join(function(NATIVE,s) for s in (
            'uiIPadActionOriginScope::uiIPadActionOriginScope(',
            'uiIPadActionOriginScope::~uiIPadActionOriginScope(',
            'ipad_ring::ActionOrigin ui_ipad_action_origin_current('))
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(ring_source().replace('#pragma once','')+r'''
#include <cassert>
namespace ipad_ring=blender::ui::ipad;
'''+scope+r'''
int main(){
 std::array<uint64_t,13> values{1,2,3,4,5,6,7,8,9,0,11,12,13};
 auto root=ipad_ring::ActionOrigin::capture(values,"builtin.move",7);
 auto child=ipad_ring::ActionOrigin::capture(values,"builtin.move",8);
 assert(!ui_ipad_action_origin_current().present());
 for(int i=0;i<10000;++i){
  uiIPadActionOriginScope admitted(root);assert(ui_ipad_action_origin_current().lifetime==7);
  {uiIPadActionOriginScope ordinary({});assert(!ui_ipad_action_origin_current().present());}
  assert(ui_ipad_action_origin_current().lifetime==7);
  try{uiIPadActionOriginScope nested(child);assert(ui_ipad_action_origin_current().lifetime==8);throw 1;}catch(int){}
  assert(ui_ipad_action_origin_current().lifetime==7);
 }
 assert(!ui_ipad_action_origin_current().present());
}
''')

    def test_native_child_draw_refusal_and_memcpy_transfer_preserve_origin(self):
        begin=POPUP.index('  /* Origin is installed before the first child draw')
        create=POPUP[begin:POPUP.index("  /* Don't create accelerator keys",begin)]
        begin=POPUP.index('  if (block->handle) {',begin)
        transfer=POPUP[begin:POPUP.index('  /* set UI_BLOCK_NUMSELECT',begin)]
        # Execute the pinned native direction of transfer, not a substitute
        # assignment that could reverse source and destination ownership.
        self.assertIn('memcpy(block->handle, handle, sizeof(uiPopupBlockHandle));',transfer)
        self.assertIn('MEM_delete(handle);',transfer)
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(ring_source().replace('#pragma once','')+r'''
#include <cassert>
namespace blender::ui{enum class EmbossType{Emboss};}
namespace ipad_ring=blender::ui::ipad;
struct bContext{bool live=true;};struct Region{void *regiondata=nullptr;};
'''+creator_scope()+r'''
struct uiIPadButtonLease{ipad_ring::ActionOrigin origin{};};
struct uiBlock;struct uiPopupBlockHandle{ipad_ring::ActionOrigin ipad_action_origin;int menuretval=0;struct{void *but=nullptr,*butregion=nullptr;}popup_create_vars;uint64_t ipad_popup_lifetime=1;bool ipad_numbers=false;void *popup_op=nullptr;uiIPadButtonLease ipad_parent_button{};};
struct uiIPadParentButtonScope{explicit uiIPadParentButtonScope(const uiIPadButtonLease &){}};
void *ui_ipad_button_lease_resolve(bContext *,const uiIPadButtonLease &){return nullptr;}
bool ui_ipad_numbers_but_rebind(void *){return false;}
// Constructor ownership is exercised in its explicit pending-owner fixture.
struct uiIPadNumbersConstructorScope{uiIPadNumbersConstructorScope(bContext *,void *,bool,uiPopupBlockHandle *){}};
struct uiBlock{uiPopupBlockHandle *handle=nullptr;ipad_ring::ActionOrigin ipad_action_origin;uiIPadButtonLease ipad_parent_button{};};
constexpr int UI_RETURN_CANCEL=2;int creates=0,disposals=0;uint64_t expected_creator_origin=7;uiBlock result;
bool ui_ipad_action_origin_valid(bContext *C,const ipad_ring::ActionOrigin &o){return !o.present()||C->live;}
bool ui_ipad_numbers_popup_valid(bContext *,uiPopupBlockHandle *){return true;}
bool ui_ipad_numbers_bind(bContext *,uiPopupBlockHandle *){return true;}
template<class T>void MEM_delete(T *p){++disposals;delete p;}
uiBlock *UI_block_begin(bContext *,Region *,const char *,blender::ui::EmbossType){result={};return &result;}
uiBlock *native_create(bContext *,Region *,void *){assert(ui_ipad_action_origin_current().lifetime==expected_creator_origin);++creates;result={};result.ipad_action_origin=ui_ipad_action_origin_current();return &result;}
uiBlock *native_handle_create(bContext *,uiPopupBlockHandle *,void *){assert(ui_ipad_action_origin_current().lifetime==expected_creator_origin);++creates;result={};result.ipad_action_origin=ui_ipad_action_origin_current();result.handle=new uiPopupBlockHandle{};return &result;}
using Create=uiBlock *(*)(bContext *,Region *,void *);using HandleCreate=uiBlock *(*)(bContext *,uiPopupBlockHandle *,void *);
uiBlock *refresh(bContext *C,uiPopupBlockHandle *handle,Region *region,void *but,void *butregion,Create create_func,HandleCreate handle_create_func){void *arg=nullptr;
'''+create+transfer+r'''
 (void)but;(void)butregion;return block;
}
int main(){
 std::array<uint64_t,13> values{1,2,3,4,5,6,7,8,9,0,11,12,13};
 auto origin=ipad_ring::ActionOrigin::capture(values,"builtin.move",7);
 bContext C;Region region;int parent=0;
 auto *handle=new uiPopupBlockHandle{origin,0,{&parent,&parent}};
 uiBlock *block=refresh(&C,handle,&region,&parent,&parent,native_create,nullptr);
 assert(creates==1&&disposals==0&&block->handle==handle&&block->ipad_action_origin.matches(values,"builtin.move"));delete handle;
 handle=new uiPopupBlockHandle{origin,0,{&parent,&parent}};
 block=refresh(&C,handle,&region,&parent,&parent,nullptr,native_handle_create);
 assert(creates==2&&disposals==1&&block->handle!=handle&&block->ipad_action_origin.matches(values,"builtin.move"));
 assert(block->handle->ipad_action_origin.matches(values,"builtin.move"));delete block->handle;
 C.live=false;handle=new uiPopupBlockHandle{origin,0,{&parent,&parent}};
 block=refresh(&C,handle,&region,reinterpret_cast<void *>(1),reinterpret_cast<void *>(1),native_create,nullptr);
 assert(creates==2&&handle->menuretval==UI_RETURN_CANCEL&&!handle->popup_create_vars.but&&!handle->popup_create_vars.butregion);
 assert(block->ipad_action_origin.lifetime==7);delete handle;
 // A present owner without an allocated popup nonce cannot run its creator.
 C.live=true;handle=new uiPopupBlockHandle{origin,0,{},0};
 block=refresh(&C,handle,&region,nullptr,nullptr,native_create,nullptr);
 assert(creates==2&&handle->menuretval==UI_RETURN_CANCEL);delete handle;
 assert(!ui_ipad_action_origin_current().present());
 // Unowned native dialogs continue normal drawing under unrelated context.
 expected_creator_origin=0;
 handle=new uiPopupBlockHandle{};block=refresh(&C,handle,&region,nullptr,nullptr,native_create,nullptr);
 assert(creates==3&&!block->ipad_action_origin.present());delete handle;
}
''')

    def test_stale_refresh_cannot_draw_old_rna_or_install_unvalidated_context(self):
        world=ORIGIN_WORLD.replace('struct RegionRuntime{bool visible=true;};',
            'struct uiBlock;struct RegionRuntime{bool visible=true;List<uiBlock> uiblocks;int do_draw=0;};')
        world=world.replace('List<ScrArea> areabase;','List<ScrArea> areabase;List<ARegion> regionbase;')
        world=world.replace('bScreen screen{{8},{&area}};','bScreen screen{{8},{&area},{}};')
        restore=function(NATIVE,'void ui_ipad_action_context_restore(')
        refresh=function(POPUP,'static void ui_block_region_refresh(')
        draw=function(POPUP,'static void ui_block_region_draw(')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(ring_source().replace('#pragma once','')+world+restore+r'''
#define LISTBASE_FOREACH_MUTABLE(type,var,list) LISTBASE_FOREACH(type,var,list)
#define BLI_assert assert
[[maybe_unused]] constexpr int RGN_TYPE_TEMPORARY=4,RGN_REFRESH_UI=8,UI_RETURN_CANCEL=2;
ScrArea *CTX_wm_area(const bContext *C){return C->area;}
ARegion *CTX_wm_region(const bContext *C){return C->region;}
struct uiBut{};
struct uiPopupBlockHandle{ipad_ring::ActionOrigin ipad_action_origin;bool can_refresh=true;ScrArea *ctx_area=nullptr;ARegion *ctx_region=nullptr;int menuretval=0;struct{uiBut *but=nullptr;ARegion *butregion=nullptr;}popup_create_vars;};
struct uiBlock{uiBlock *next=nullptr;uiPopupBlockHandle *handle=nullptr;ipad_ring::ActionOrigin ipad_action_origin;};
int refreshes=0,draws=0,retired_draws=0;ScrArea *expected_area;ARegion *expected_region;bool remove_owner=false;
void ui_ipad_ring_draw_presented(const uiBlock *,const ARegion *,const std::array<int,4> &,const std::vector<int> &){++retired_draws;}
void ui_popup_block_refresh(bContext *C,uiPopupBlockHandle *,ARegion *,uiBut *){
 assert(C->area==expected_area&&C->region==expected_region);++refreshes;
 if(remove_owner)C->window->screen->areabase.first=nullptr;
}
void UI_block_draw(const bContext *C,uiBlock *){assert(C->area==expected_area&&C->region==expected_region);++draws;}
'''+refresh+draw+r'''
int main(){
 Fixture f;auto *C=&f.C;expected_area=&f.area;expected_region=&f.region;
 uint64_t values[13];assert(UI_ipad_context_capture(C,values));std::array<uint64_t,13> copied;std::copy(values,values+13,copied.begin());
 auto origin=ipad_ring::ActionOrigin::capture(copied,live_tool,7);
 uiPopupBlockHandle handle{origin,true,reinterpret_cast<ScrArea *>(1),reinterpret_cast<ARegion *>(1),0,{}};
 uiBlock block{nullptr,&handle,origin};RegionRuntime runtime{true,{&block},RGN_REFRESH_UI};ARegion popup{nullptr,&runtime,RGN_TYPE_TEMPORARY};
 ui_block_region_refresh(C,&popup);assert(refreshes==1&&C->area==&f.area&&C->region==&f.region);
 ui_block_region_draw(C,&popup);assert(draws==1&&C->area==&f.area&&C->region==&f.region);
 // Refused refresh leaves the old block cached: the draw route must also guard.
 runtime.do_draw=RGN_REFRESH_UI;f.area.regionbase.first=nullptr;
 ui_block_region_refresh(C,&popup);ui_block_region_draw(C,&popup);
 assert(refreshes==1&&draws==1&&retired_draws==1&&handle.menuretval==UI_RETURN_CANCEL&&C->region==nullptr);
 f.area.regionbase.first=&f.region;C->region=&f.region;handle.menuretval=0;runtime.do_draw=RGN_REFRESH_UI;
 remove_owner=true;ui_block_region_refresh(C,&popup);
 assert(refreshes==2&&C->area==nullptr&&C->region==nullptr);
 ui_block_region_draw(C,&popup);assert(draws==1&&retired_draws==2&&handle.menuretval==UI_RETURN_CANCEL);
 // Membership restoration rejects unreadable saved pointers without following them.
 ui_ipad_action_context_restore(C,1,1);assert(!C->area&&!C->region);
}
''')

if __name__=='__main__':unittest.main()
