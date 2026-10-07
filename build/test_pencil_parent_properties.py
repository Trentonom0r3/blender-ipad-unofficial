"""Execute copied parent leases and native enum/presentation refusal ordering.

UI lists execute native lease code; RNA/field and GPU APIs are fixture boundaries.
"""
import unittest
from test_touch_extrude import changed_source
from test_tool_ring import ring_source
from test_pencil_callback_disposal import definition
from test_pencil_button_lease import SOURCE, HEADER, WORLD, LEASE
import test_ipad_panels

POPUP = changed_source('source/blender/editors/interface/regions/interface_region_popup.cc')
MENU = changed_source('source/blender/editors/interface/regions/interface_region_menu_popup.cc')
PARENT_WORLD = LEASE + '\n' + WORLD.replace(LEASE, '').replace(
    'void *handle_func_arg=nullptr;};', 'void *handle_func_arg=nullptr;uiIPadButtonLease ipad_parent_button{};void *evil_C=nullptr;};')
PARENT_WORLD = PARENT_WORLD.replace('int retval=3;};', r'''int retval=3;
 ButType type=ButType::Menu;void *rnaprop=nullptr;int rnapoin=0;
 int (*menu_step_func)(bContext *,int,void *)=nullptr;void *poin=nullptr;std::string str="Enum";};''')
PARENT = '\n'.join(definition(SOURCE, marker) for marker in (
    'uiIPadParentButtonScope::uiIPadParentButtonScope(',
    'uiIPadParentButtonScope::~uiIPadParentButtonScope(',
    'uiIPadButtonLease ui_ipad_parent_button_current(',
    'uiBut *ui_ipad_parent_button_resolve('))
SUPPORT = r'''
#include <cstdio>
enum class ButType{Menu};
'''
FIELD_API = r'''
#define BLI_assert(x) assert(x)
bool bound=true;int field_checks=0,metadata_reads=0,custom_calls=0;
bool ui_ipad_numbers_but_rebind(uiBut *){++field_checks;return bound;}
constexpr int PROP_ENUM=1;
int RNA_property_type(void *){++metadata_reads;return PROP_ENUM;}
int RNA_property_enum_get(int *,void *){++metadata_reads;return 3;}
int RNA_property_enum_step(bContext *,int *,void *,int current,int direction){return current+direction;}
int custom_step(bContext *,int,void *){++custom_calls;return 9;}
'''

class PencilParentPropertyTests(unittest.TestCase):
    def run_source(self, main, extra=''):
        declaration = definition(HEADER, 'class uiIPadParentButtonScope {') + ';'
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(
            ring_source().replace('#pragma once', '') + SUPPORT + PARENT_WORLD + FIELD_API + declaration +
            '\nstatic thread_local uiIPadButtonLease ui_ipad_scoped_parent_button;\n' + PARENT + extra + main)

    def test_parent_metadata_requires_same_drawn_button_lifetime_and_fresh_field(self):
        self.run_source(r'''
int main(){Fixture f;uiBlock child;child.ipad_action_origin=origin();child.ipad_parent_button=ui_ipad_button_lease_capture(f.but());
 auto saved=f.but();for(int i=0;i<10000;++i){
  assert(ui_ipad_parent_button_resolve(&f.C,&child,saved)==saved);
  ++saved->ipad_ui_lifetime;int checks=field_checks;
  assert(!ui_ipad_parent_button_resolve(&f.C,&child,saved)&&field_checks==checks);--saved->ipad_ui_lifetime;
 }
 bound=false;assert(!ui_ipad_parent_button_resolve(&f.C,&child,saved));bound=true;
 int checks=field_checks;assert(!ui_ipad_parent_button_resolve(&f.C,&child,reinterpret_cast<void *>(1))&&field_checks==checks);
 f.block.active=false;assert(!ui_ipad_parent_button_resolve(&f.C,&child,saved));f.block.active=true;
 child.ipad_parent_button={};assert(!ui_ipad_parent_button_resolve(&f.C,&child,saved));
 child.ipad_action_origin={};checks=field_checks;
 assert(ui_ipad_parent_button_resolve(&f.C,&child,saved)==saved&&field_checks==checks);
}
''')

    def test_nested_parent_scope_restores_value_without_container_ownership(self):
        self.run_source(r'''
int main(){static_assert(std::is_trivially_copyable_v<uiIPadButtonLease>);Fixture f;
 auto lease=ui_ipad_button_lease_capture(f.but());assert(!ui_ipad_parent_button_current().origin.present());
 for(int i=0;i<10000;++i){uiIPadParentButtonScope scope(lease);assert(ui_ipad_parent_button_current().button_lifetime==19);
  try{uiIPadParentButtonScope child({});assert(!ui_ipad_parent_button_current().origin.present());throw 1;}catch(int){}
  assert(ui_ipad_parent_button_current().button_lifetime==19);
 }
 assert(!ui_ipad_parent_button_current().origin.present());
}
''')

    def test_native_enum_step_refuses_unknown_owned_function_and_stale_metadata(self):
        native = '\n'.join(definition(MENU, marker) for marker in (
            'bool ui_but_menu_step_poll(', 'int ui_but_menu_step('))
        self.run_source(r'''
int main(){Fixture f;f.but()->rnaprop=reinterpret_cast<void *>(1);
 for(int i=0;i<10000;++i){assert(ui_but_menu_step_poll(f.but()));assert(ui_but_menu_step(f.but(),1)==4);}
 bound=false;int reads=metadata_reads;assert(!ui_but_menu_step_poll(f.but())&&metadata_reads==reads);bound=true;
 f.but()->menu_step_func=custom_step;assert(!ui_but_menu_step_poll(f.but())&&custom_calls==0);
 f.block.ipad_action_origin={};assert(ui_but_menu_step(f.but(),1)==9&&custom_calls==1);
}
''', native)

    def test_enum_refresh_shortcut_and_early_draw_guards_precede_metadata(self):
        refresh = definition(POPUP, 'uiBlock *ui_popup_block_refresh(')
        self.assertLess(refresh.index('ui_ipad_button_lease_resolve'), refresh.index('create_func(C'))
        self.assertLess(refresh.index('parent_valid'), refresh.index('create_func(C'))
        creator = definition(POPUP, 'uiPopupBlockHandle *ui_popup_block_create(')
        self.assertLess(creator.index('ui_ipad_button_lease_capture'), creator.index('ui_popup_block_refresh'))
        enum = definition(SOURCE, 'static void ui_def_but_rna__menu(')
        self.assertLess(enum.index('ui_ipad_parent_button_resolve'), enum.index('RNA_property_enum_get'))
        shortcut = definition(SOURCE, 'static std::optional<std::string> ui_but_event_property_operator_string(')
        self.assertLess(shortcut.index('ui_ipad_parent_button_resolve'), shortcut.index('but_parent->rnaprop'))
        draw = definition(SOURCE, 'void UI_block_draw(')
        early = draw[:draw.index('uiStyle style')]
        self.assertEqual(early.count('ui_ipad_ring_draw_presented(block, nullptr, {}, {});'), 3)
        self.assertIn('ui_ipad_numbers_but_rebind', early)

if __name__ == '__main__':
    unittest.main()
