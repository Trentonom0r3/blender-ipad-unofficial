"""Execute fresh native UI-list admission after immediate callbacks.

This proves value/lifetime refusal in fixtures, not target modal or RNA ownership.
"""
import unittest
from test_touch_extrude import changed_source
from test_tool_ring import ring_source
from test_pencil_callback_disposal import definition
from test_pencil_popup_ownership import COMMON
import test_ipad_panels

SOURCE=changed_source('source/blender/editors/interface/interface.cc')
HEADER=changed_source('source/blender/editors/interface/interface_intern.hh')
HANDLERS=changed_source('source/blender/editors/interface/interface_handlers.cc')
POPUP=changed_source('source/blender/editors/interface/regions/interface_region_popup.cc')

LEASE=definition(HEADER,'struct uiIPadButtonLease {')+';'
WORLD=COMMON.replace('struct uiBlock;struct Runtime', 'struct uiBut;struct uiBlock;struct Runtime').replace(
    'struct uiBlock{uiBlock *next=nullptr;bool active=true;uiPopupBlockHandle *handle=nullptr;};',
    'struct uiBlock{uiBlock *next=nullptr;bool active=true;uiPopupBlockHandle *handle=nullptr;ipad_ring::ActionOrigin ipad_action_origin;std::vector<std::unique_ptr<uiBut>> buttons;void (*handle_func)(bContext *,void *,int)=nullptr;void *handle_func_arg=nullptr;};').replace(
    'struct wmOperator{};', 'struct bContext;struct wmOperator{};')
WORLD='#include <memory>\n'+WORLD+LEASE+r'''
struct uiBut{uiBlock *block=nullptr;uint64_t ipad_ui_lifetime=0;void (*func)(bContext *,void *,void *)=nullptr;void *func_arg1=nullptr,*func_arg2=nullptr;int retval=3;};
'''+definition(SOURCE,'uiIPadButtonLease ui_ipad_button_lease_capture(')+'\n'+definition(SOURCE,'uiBut *ui_ipad_button_lease_resolve(')+r'''
struct Fixture{
 uiPopupBlockHandle handle{11,0,nullptr,origin(),nullptr};uiBlock block;
 Runtime runtime;ARegion region{nullptr,&runtime};bScreen screen{{&region}};
 wmWindow win{nullptr,&screen,{}};wmWindowManager wm{{&win}};bContext C{true,&win,&wm};
 Fixture(){handle.region=&region;block.handle=&handle;block.ipad_action_origin=origin();runtime.uiblocks.first=&block;
  block.buttons.push_back(std::make_unique<uiBut>());block.buttons[0]->block=&block;block.buttons[0]->ipad_ui_lifetime=19;}
 uiBut *but(){return block.buttons[0].get();}
};
'''

class PencilButtonLeaseTests(unittest.TestCase):
    def test_popup_region_restore_only_reacquires_current_native_members(self):
        resolver=definition(SOURCE,'ARegion *ui_ipad_popup_region_resolve(')
        region_handler=definition(HANDLERS,'static int ui_handler_region_menu(')
        popup_handler=definition(HANDLERS,'static int ui_popup_handler(')
        for handler in (region_handler,popup_handler):
            self.assertIn('ui_ipad_popup_region_resolve(C, uintptr_t(region_popup))',handler)
            self.assertLess(handler.index('ui_apply_but_funcs_after(C)'),handler.index('ui_ipad_popup_region_resolve(C, uintptr_t(region_popup))'))
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(ring_source().replace('#pragma once','')+WORLD+resolver+r'''
int main(){Fixture f;uintptr_t saved=uintptr_t(&f.region);
 assert(ui_ipad_popup_region_resolve(&f.C,saved)==&f.region);
 assert(!ui_ipad_popup_region_resolve(&f.C,1));
 f.screen.regionbase.first=nullptr;assert(!ui_ipad_popup_region_resolve(&f.C,saved));f.screen.regionbase.first=&f.region;
 bScreen replacement;f.win.screen=&replacement;assert(!ui_ipad_popup_region_resolve(&f.C,saved));f.win.screen=&f.screen;
 f.wm.windows.first=nullptr;f.C.window=reinterpret_cast<wmWindow *>(1);assert(!ui_ipad_popup_region_resolve(&f.C,saved));
 assert(!ui_ipad_popup_region_resolve(&f.C,0));
}
''')

    def test_resolve_requires_fresh_live_button_and_popup_lifetimes(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(ring_source().replace('#pragma once','')+WORLD+r'''
int main(){Fixture f;auto lease=ui_ipad_button_lease_capture(f.but());
 for(int i=0;i<10000;++i){
  assert(ui_ipad_button_lease_resolve(&f.C,lease)==f.but());
  ++f.but()->ipad_ui_lifetime;assert(!ui_ipad_button_lease_resolve(&f.C,lease));--f.but()->ipad_ui_lifetime;
  ++f.handle.ipad_popup_lifetime;assert(!ui_ipad_button_lease_resolve(&f.C,lease));--f.handle.ipad_popup_lifetime;
 }
 f.handle.menuretval=UI_RETURN_CANCEL;assert(!ui_ipad_button_lease_resolve(&f.C,lease));f.handle.menuretval=0;
 f.block.active=false;assert(!ui_ipad_button_lease_resolve(&f.C,lease));f.block.active=true;
 f.block.ipad_action_origin.tool[0]='x';assert(!ui_ipad_button_lease_resolve(&f.C,lease));f.block.ipad_action_origin=origin();
 f.block.ipad_action_origin.context[1]=9;assert(!ui_ipad_button_lease_resolve(&f.C,lease));f.block.ipad_action_origin=origin();
 f.C.live=false;assert(!ui_ipad_button_lease_resolve(&f.C,lease));f.C.live=true;
 f.wm.windows.first=nullptr;f.C.window=reinterpret_cast<wmWindow *>(1);assert(!ui_ipad_button_lease_resolve(&f.C,lease));f.C.window=&f.win;f.wm.windows.first=&f.win;
 f.block.buttons.clear();lease.button_address=1;assert(!ui_ipad_button_lease_resolve(&f.C,lease));
 f.screen.regionbase.first=nullptr;assert(!ui_ipad_button_lease_resolve(&f.C,lease));
 assert(!ui_ipad_button_lease_resolve(&f.C,{}));
}
''')

    def test_allocators_do_not_wrap_and_native_type_copy_keeps_new_identity(self):
        allocator=definition(SOURCE,'static uint64_t ui_ipad_button_lifetime_allocate(')
        popup_allocator=definition(POPUP,'static uint64_t ui_ipad_popup_lifetime_allocate(')
        start=SOURCE.index('  const uint64_t new_lifetime = but->ipad_ui_lifetime;')
        clone=SOURCE[start:SOURCE.index('  /* We didn',start)]
        self.assertIn('but->ipad_ui_lifetime = ui_ipad_button_lifetime_allocate();',SOURCE)
        self.assertIn('handle->ipad_popup_lifetime = ui_ipad_popup_lifetime_allocate();',POPUP)
        self.assertNotIn('handle->ipad_action_origin.present() && ui_ipad_popup_next_lifetime',POPUP)
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(ring_source().replace('#pragma once','')+r'''
#include <cassert>
#include <memory>
static uint64_t ui_ipad_button_next_lifetime=1,ui_ipad_popup_next_lifetime=1;
'''+allocator+'\n'+popup_allocator+r'''
struct uiBut{uint64_t ipad_ui_lifetime=0;int payload=0;bool ipad_snap_callback=true;};
int main(){
 for(uint64_t i=1;i<=10000;++i){assert(ui_ipad_button_lifetime_allocate()==i);assert(ui_ipad_popup_lifetime_allocate()==i);}
 auto old_but_ptr=std::make_unique<uiBut>();old_but_ptr->ipad_ui_lifetime=8;old_but_ptr->payload=19;
 uiBut fresh{10001,0};uiBut *but=&fresh;
'''+clone+r'''
 assert(but->ipad_ui_lifetime==10001&&but->payload==19&&old_but_ptr->ipad_ui_lifetime==8);
 ui_ipad_button_next_lifetime=UINT64_MAX-1;ui_ipad_popup_next_lifetime=UINT64_MAX-1;
 assert(ui_ipad_button_lifetime_allocate()==UINT64_MAX-1);assert(ui_ipad_popup_lifetime_allocate()==UINT64_MAX-1);
 for(int i=0;i<10000;++i){assert(!ui_ipad_button_lifetime_allocate());assert(!ui_ipad_popup_lifetime_allocate());}
}
''')

    def test_immediate_and_active_property_callbacks_cannot_continue_after_ui_rebuild(self):
        prefix=definition(HANDLERS,'static void ui_apply_but_func(')
        prefix=prefix[:prefix.index('  uiAfterFunc *after = ui_afterfunc_new();')]+r'''
 ++tails;assert(but&&block==but->block);
}
'''
        active=definition(HANDLERS,'void UI_context_active_but_prop_handle(')
        world=WORLD+r'''
#define ELEM(a,b,c) ((a)==(b)||(a)==(c))
int tails=0,functions=0,handles=0,updates=0,undos=0;int retire=0;Fixture *current=nullptr;
bool ui_afterfunc_check(uiBlock *,uiBut *){return true;}
bool ui_ipad_numbers_but_rebind(uiBut *){return true;}
// Callback classification is executed separately in test_pencil_self_callback.
bool ui_ipad_but_self_callback_allowed(bContext *,uiBut *){return true;}
bool ui_ipad_but_direct_property_allowed(bContext *,uiBut *){return true;}
bool ui_ipad_native_controls_prepare(bContext *,uiBut *){return true;}
uiBut *UI_context_active_but_get_respect_popup(bContext *){return current->but();}
void callback(bContext *,void *,void *){++functions;if(retire==1)current->block.buttons.clear();if(retire==2)++current->but()->ipad_ui_lifetime;}
void handle_callback(bContext *,void *,int){++handles;if(retire==3)current->block.active=false;}
void ui_but_update(uiBut *){++updates;if(retire==4)++current->handle.ipad_popup_lifetime;}
void ui_apply_but_undo(uiBut *){++undos;}
'''+prefix+active+r'''
int main(){
 for(int i=0;i<10000;++i){
  Fixture f;current=&f;f.but()->func=callback;f.but()->func_arg1=f.but();f.block.handle_func=handle_callback;
  retire=0;tails=functions=handles=updates=undos=0;ui_apply_but_func(&f.C,f.but());assert(functions==1&&tails==1);
  retire=2;tails=0;ui_apply_but_func(&f.C,f.but());assert(tails==0);
 }
 for(int terminal=0;terminal<=4;++terminal){
  Fixture f;current=&f;f.but()->func=callback;f.block.handle_func=handle_callback;retire=terminal;
  tails=functions=handles=updates=undos=0;UI_context_active_but_prop_handle(&f.C,true);
  assert(functions==1);
  if(terminal==1||terminal==2)assert(handles==0&&updates==0&&undos==0);
  else if(terminal==3)assert(handles==1&&updates==0&&undos==0);
  else if(terminal==4)assert(handles==1&&updates==1&&undos==0);
  else assert(handles==1&&updates==1&&undos==1);
 }
 // Native hardware/unowned route remains usable without ring lists or nonce.
 Fixture f;current=&f;f.block.ipad_action_origin={};f.but()->func=callback;retire=0;functions=0;
 UI_context_active_but_prop_handle(&f.C,false);assert(functions==1);
}
'''
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(ring_source().replace('#pragma once','')+world)

if __name__=='__main__':unittest.main()
