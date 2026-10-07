"""Execute connected fixed-root constructor and explicit pending Numbers scopes.

Native RNA, registries and UI lists are fixture APIs; not a target modal build.
"""
import re
from pathlib import Path
import unittest
from test_touch_extrude import changed_source
from test_tool_ring import ring_source
from test_pencil_callback_disposal import definition
from test_pencil_rna_owner import SOURCE, RECEIPT, WORLD, FUNCTIONS
from test_pencil_numbers import NUMBERS_WORLD
import test_ipad_panels

HEADER = changed_source('source/blender/editors/interface/interface_intern.hh')
DECLARATIONS = '\n'.join(definition(HEADER, marker) + ';' for marker in (
    'struct uiIPadNumbersConstructorContext {', 'class uiIPadNumbersConstructorScope {'))
PUBLIC_PREPARE = re.search(r'bool UI_ipad_rna_prepare\([^;]+;', changed_source(
    'source/blender/editors/include/UI_interface_c.hh')).group(0)
NATIVE = '\n'.join(definition(SOURCE, marker) for marker in (
    'static uintptr_t ui_ipad_numbers_constructor_type(',
    'uiIPadNumbersConstructorScope::uiIPadNumbersConstructorScope(',
    'uiIPadNumbersConstructorScope::~uiIPadNumbersConstructorScope(',
    'static bool ui_ipad_rna_constructor_root(',
    'static bool ui_ipad_rna_constructor_match(',
    'static bool ui_ipad_rna_constructor_capture(', 'bool UI_ipad_rna_prepare(',
    'bool ui_ipad_numbers_bind(', 'bool ui_ipad_but_rna_rebind(',
    'bool ui_ipad_numbers_but_rebind('))
PINNED_SCALARS = (Path(__file__).parent / 'fixtures/pinned_ui_scalar_access.hh').read_text(encoding='utf-8')
for _signature in ('double ui_but_value_get(', 'void ui_but_value_set('):
    _prefix = definition(SOURCE, _signature).split('{', 1)[1].splitlines()[1]
    NATIVE += '\n' + definition(PINNED_SCALARS, _signature).replace('{', '{\n' + _prefix, 1)

def world():
    s = re.sub(r'// Initial pending constructors.*?ConstructorBoundary ui_ipad_numbers_constructor;\n',
               '', WORLD, flags=re.S)
    s = s.replace('struct Scene{ID id;};', 'struct ToolSettings{};struct Scene{ID id;ToolSettings *toolsettings=nullptr;};')
    s = s.replace('struct wmOperatorType{StructRNA *srna=nullptr;};',
                  'struct wmOperatorType{StructRNA *srna=nullptr;uint64_t ipad_lifetime_id=0;};')
    s = re.sub(r'uiPopupBlockHandle \*ui_ipad_registered_popup_resolve\([^\n]+\n',
               'uiPopupBlockHandle *ui_ipad_registered_popup_resolve(bContext *,const ipad_ring::ActionOrigin &,uint64_t);\n', s)
    return s

CONSTRUCTOR_NUMBERS_WORLD = NUMBERS_WORLD.replace(
    'std::vector<std::unique_ptr<uiBut>> buttons;};',
    'std::vector<std::unique_ptr<uiBut>> buttons;uiPopupBlockHandle *handle=nullptr;};')

SUPPORT = r'''
#define STREQ(a,b) (std::strcmp(a,b)==0)
constexpr int RNA_NO_INDEX=-1;
StructRNA RNA_ToolSettings,RNA_TransformOrientationSlot;
ipad_ring::ActionOrigin current_origin=origin();
ipad_ring::ActionOrigin ui_ipad_action_origin_current(){return current_origin;}
int type_guards=0;
class uiIPadNumbersTypeGuard {
 bool guarded=false;
 public:
 explicit uiIPadNumbersTypeGuard(uintptr_t address){guarded=address!=0;if(guarded)++type_guards;}
 ~uiIPadNumbersTypeGuard(){if(guarded)--type_guards;}
 bool valid()const{return guarded;}
};
// Execute the audited native first-block/handle predicate as an external UI
// registry API. Full native WM handler resolution has separate source tests.
uiPopupBlockHandle *ui_ipad_registered_popup_resolve(bContext *C,const ipad_ring::ActionOrigin &o,uint64_t life){
 return C->live&&registered_popup&&registered_popup->ipad_popup_lifetime==life&&
  registered_popup->ipad_action_origin.lifetime==o.lifetime&&
  registered_popup->region->runtime->uiblocks.first->handle==registered_popup?registered_popup:nullptr;
}
'''

class PencilRNAConstructorTests(unittest.TestCase):
    def run_source(self, main):
        code = ('#define WITH_APPLE_CROSSPLATFORM\n' + ring_source().replace('#pragma once', '') +
                RECEIPT + world() + CONSTRUCTOR_NUMBERS_WORLD + SUPPORT + DECLARATIONS + PUBLIC_PREPARE + r'''
static thread_local uiIPadNumbersConstructorContext ui_ipad_numbers_constructor;
static bool ui_ipad_rna_constructor_root(bContext *,const ipad_ring::ActionOrigin &,
                                        const uiIPadRNAReceipt &,PointerRNA &);
''' + FUNCTIONS + NATIVE + main)
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(code)

    def test_scene_fixed_profiles_refuse_unproved_metadata_and_repair_ancestors(self):
        self.run_source(r'''
int main(){Fixture f;ToolSettings settings;uiBlock block;block.ipad_action_origin=origin();block.evil_C=&f.C;
 f.scene.toolsettings=&settings;f.root.fields.clear();RNA_ToolSettings.fields.clear();
 PropertyRNA parent{"tool_settings","",0,PROP_POINTER,false,0,0,{}, {}};
 parent.target={&f.scene.id,&RNA_ToolSettings,&settings,{1,2}};f.root.fields["tool_settings"]=&parent;
 PropertyRNA snap{"use_snap","",0,PROP_BOOLEAN,false,0,0,{}, {}};RNA_ToolSettings.fields["use_snap"]=&snap;
 PointerRNA ptr=parent.target;PropertyRNA *field=nullptr;
 for(int i=0;i<10000;++i){ptr.ancestors={1};field=nullptr;assert(UI_ipad_rna_prepare(&block,&ptr,&field,"use_snap"));
  assert(field==&snap&&ptr.ancestors==std::vector<int>({91,92}));}
 field=reinterpret_cast<PropertyRNA *>(1);assert(!UI_ipad_rna_prepare(&block,&ptr,&field));
 assert(field==reinterpret_cast<PropertyRNA *>(1));
 field=nullptr;assert(!UI_ipad_rna_prepare(&block,&ptr,&field,"unproved"));
 auto saved=ptr;ptr.owner_id=reinterpret_cast<ID *>(1);ptr.type=reinterpret_cast<StructRNA *>(1);ptr.data=reinterpret_cast<void *>(1);
 int old_finds=finds;assert(!UI_ipad_rna_prepare(&block,&ptr,&field,"use_snap")&&finds==old_finds);ptr=saved;
 ++f.scene.id.session_uid;f.main.ids.clear();assert(!UI_ipad_rna_prepare(&block,&ptr,&field,"use_snap"));
 block.ipad_action_origin={};ptr=saved;field=nullptr;
 assert(UI_ipad_rna_prepare(&block,&ptr,&field,"use_snap")&&field==&snap);
 assert(UI_ipad_rna_prepare(&block,nullptr,nullptr));
}
''')

    def test_orientation_slots_and_complete_native_snap_options_use_literal_paths(self):
        self.run_source(r'''
int main(){Fixture f;ToolSettings settings;uiBlock block;block.ipad_action_origin=origin();block.evil_C=&f.C;
 f.scene.toolsettings=&settings;f.root.fields.clear();RNA_ToolSettings.fields.clear();RNA_TransformOrientationSlot.fields.clear();
 PropertyRNA parent{"tool_settings","",0,PROP_POINTER,false,0,0,{}, {}};
 parent.target={&f.scene.id,&RNA_ToolSettings,&settings,{}};f.root.fields["tool_settings"]=&parent;
 std::vector<PropertyRNA> fields;fields.reserve(20);
 for(const char *name:{"transform_pivot_point","use_snap","snap_target","snap_elements_base","snap_elements_individual",
  "use_snap_grid_absolute","use_snap_peel_object","use_snap_to_same_target","snap_face_nearest_steps",
  "use_snap_align_rotation","use_snap_backface_culling","use_snap_self","use_snap_edit","use_snap_nonedit",
  "use_snap_selectable","use_snap_translate","use_snap_rotate","use_snap_scale","snap_angle_increment_3d",
  "snap_angle_increment_3d_precision"}){PropertyRNA leaf;leaf.name=name;leaf.type=PROP_ENUM;fields.push_back(leaf);
  RNA_ToolSettings.fields[name]=&fields.back();PointerRNA ptr=parent.target;PropertyRNA *field=nullptr;
  assert(UI_ipad_rna_prepare(&block,&ptr,&field,name)&&field==&fields.back());}
 PropertyRNA collection{"transform_orientation_slots","",0,PROP_COLLECTION,false,0,0,{}, {}};
 PropertyRNA leaf{"type","",0,PROP_ENUM,false,0,0,{}, {}};RNA_TransformOrientationSlot.fields["type"]=&leaf;
 int slot_data=3;collection.target={&f.scene.id,&RNA_TransformOrientationSlot,&slot_data,{}};
 f.root.fields["transform_orientation_slots"]=&collection;
 for(int slot=0;slot<4;++slot){collection_index=slot;PointerRNA ptr=collection.target;PropertyRNA *field=&leaf;
  uiIPadRNAReceipt receipt;PointerRNA fresh;PropertyRNA *actual=nullptr;
  assert(ui_ipad_rna_constructor_capture(&block,ptr,field,nullptr,-1,receipt,fresh,actual));
  assert(receipt.steps[0].index==slot&&actual==&leaf&&receipt.property_id=="type");}
}
''')

    def test_fine_and_combined_gizmo_roots_are_typed_find_only_and_consumers_rebind(self):
        self.run_source(r'''
int main(){
 for(const char *id:{"TRANSFORM_OT_translate","TRANSFORM_OT_rotate","TRANSFORM_OT_resize","VIEW3D_GGT_xform_gizmo"}){
  bool gizmo=STREQ(id,"VIEW3D_GGT_xform_gizmo");ToolFixture f(gizmo);operators.clear();gizmos.clear();
  std::memcpy(f.subgroup.name,id,std::strlen(id)+1);if(gizmo)gizmos[id]=&f.gt;else operators[id]=&f.ot;
  const char *name=gizmo?"drag_action":"use_accurate";std::memcpy(f.leaf.name,name,std::strlen(name)+1);f.leaf.type=IDP_BOOLEAN;
  f.subgroup.data.group.first=&f.leaf;f.root.fields.clear();f.value.name=name;f.value.type=PROP_BOOLEAN;
  f.value.array=false;f.value.dim=f.value.len=0;f.value.shape={};f.root.fields[name]=&f.value;
  uiBlock block;block.ipad_action_origin=origin();block.evil_C=&f.C;
  PointerRNA ptr{nullptr,&f.root,&f.subgroup,{1}};PropertyRNA *field=&f.value;
  uiIPadRNAReceipt receipt;PointerRNA fresh;PropertyRNA *actual=nullptr;int old_ensures=ensures;
  assert(ui_ipad_rna_constructor_capture(&block,ptr,field,nullptr,0,receipt,fresh,actual));
  assert(ensures==old_ensures&&receipt.steps.size()==1&&fresh.ancestors==std::vector<int>({91}));
  uiBut but;but.block=&block;but.rnapoin=ptr;but.rnaprop=field;but.ipad_rna_receipt=receipt;
  for(int i=0;i<10000;++i){ui_but_value_set(&but,1);assert(ui_but_value_get(&but)==1);}
  int old_writes=value_writes;f.leaf.type=IDP_STRING;ui_but_value_set(&but,0);assert(value_writes==old_writes&&ensures==old_ensures);
  field=reinterpret_cast<PropertyRNA *>(1);assert(!UI_ipad_rna_prepare(&block,&ptr,&field));
 }
}
''')

    def test_pending_constructor_scope_handoff_refresh_and_retired_bootstrap(self):
        self.run_source(r'''
int main(){NumbersFixture f;f.ot.ipad_lifetime_id=71;f.block.handle=&f.handle;auto &C=f.native.C;current_origin=origin();
 auto construct=[&](){PointerRNA ptr=f.ptr;PropertyRNA *field=&f.field;uiIPadRNAReceipt receipt;PointerRNA fresh;PropertyRNA *actual=nullptr;
  assert(ui_ipad_rna_constructor_capture(&f.block,ptr,field,nullptr,1,receipt,fresh,actual));
  f.but()->ipad_rna_receipt=receipt;f.but()->rnapoin=fresh;return receipt;};
 for(int i=0;i<10000;++i){
  assert(!ui_ipad_numbers_constructor.op);uiIPadRNAReceipt bootstrap;
  {uiIPadNumbersConstructorScope scope(&C,&f.op,true);assert(type_guards==1);
   bootstrap=construct();assert(bootstrap.popup_lifetime==0&&ui_ipad_numbers_but_rebind(f.but()));
   assert(ui_ipad_numbers_bind(&C,&f.handle));assert(f.but()->ipad_rna_receipt.popup_lifetime==91);
   {uiIPadNumbersConstructorScope ordinary(&C,nullptr,false);assert(type_guards==1&&ui_ipad_numbers_constructor.op==&f.op);}
  }
  assert(type_guards==0&&!ui_ipad_numbers_constructor.op);
  PointerRNA ptr;PropertyRNA *field=nullptr;assert(!ui_ipad_rna_resolve(&C,origin(),bootstrap,ptr,field));
  assert(ui_ipad_numbers_but_rebind(f.but()));
 }
 // Registered old block is live when refresh enters. The new first block is
 // unfinished and is deliberately unavailable to registered-popup scanning.
 uiBlock new_block;new_block.ipad_action_origin=origin();new_block.evil_C=&C;
 {uiIPadNumbersConstructorScope refresh(&C,&f.op,true,&f.handle);f.runtime.uiblocks.first=&new_block;
  assert(!ui_ipad_registered_popup_resolve(&C,origin(),91));
  PointerRNA ptr=f.ptr;PropertyRNA *field=&f.field;uiIPadRNAReceipt receipt;PointerRNA fresh;PropertyRNA *actual=nullptr;
  assert(ui_ipad_rna_constructor_capture(&new_block,ptr,field,nullptr,1,receipt,fresh,actual));
  assert(receipt.popup_lifetime==91);
  auto button=std::make_unique<uiBut>();button->block=&new_block;button->rnapoin=fresh;button->rnaprop=actual;
  button->rnaindex=1;button->ipad_rna_receipt=receipt;new_block.buttons.push_back(std::move(button));
  assert(ui_ipad_numbers_but_rebind(new_block.buttons.front().get()));
  new_block.handle=&f.handle;assert(ui_ipad_numbers_bind(&C,&f.handle));}
 assert(ui_ipad_numbers_but_rebind(new_block.buttons.front().get())&&type_guards==0);
 f.runtime.uiblocks.first=&f.block;
 {uiIPadNumbersConstructorScope scope(&C,&f.op,true);++f.native.undo.ipad_mutation_generation;
  PointerRNA ptr=f.ptr;PropertyRNA *field=nullptr;assert(!UI_ipad_rna_prepare(&f.block,&ptr,&field,"offset"));--f.native.undo.ipad_mutation_generation;}
 operators.clear();{uiIPadNumbersConstructorScope absent(&C,reinterpret_cast<wmOperator *>(1),true);
  assert(!ui_ipad_numbers_constructor.op&&type_guards==0);}
}
''')

    def test_real_python_layout_and_button_entrypoints_prepare_before_metadata(self):
        python = changed_source('source/blender/makesrna/intern/rna_ui_api.cc')
        layout = changed_source('source/blender/editors/interface/interface_layout.cc')
        self.assertIn('#include "UI_interface_c.hh"', python)
        for name in ('rna_uiItemR(', 'rna_uiItemR_with_popover(', 'rna_uiItemR_with_menu(',
                     'rna_uiItemMenuEnumR(', 'rna_uiItemEnumR_string('):
            body = definition(python, 'static void ' + name)
            self.assertIn('UI_ipad_rna_prepare', body)
            self.assertNotIn('RNA_struct_find_property(ptr, propname)', body)
        for name in ('prop', 'prop_enum', 'props_enum', 'prop_with_popover', 'prop_with_menu',
                     'prop_menu_enum', 'prop_search', 'prop_tabs_enum', 'decorator'):
            for match in re.finditer(r'void uiLayout::' + name + r'\(', layout):
                body = layout[layout.index('{', match.start()) + 1:]
                self.assertIn('UI_ipad_rna_prepare', body[:200])
        constructor = definition(SOURCE, 'static uiBut *ui_def_but_rna(')
        self.assertLess(constructor.index('ui_ipad_rna_constructor_capture'), constructor.index('RNA_property_type'))
        self.assertLess(constructor.index('but->ipad_rna_receipt ='), constructor.index('RNA_property_editable_info'))
        self.assertNotIn('RNA_property_identifier(incoming_property)', SOURCE)
        native = changed_source('source/blender/editors/interface/regions/interface_region_menu_popup.cc')
        creator = definition(native, 'void UI_popup_block_ex(')
        self.assertLess(creator.index('uiIPadNumbersConstructorScope'), creator.index('ui_popup_block_create'))
        self.assertLess(creator.index('UI_popup_handlers_add'), creator.index('ui_ipad_numbers_bind'))
        self.assertIn('use_tab_style', python)  # Accepted Inspector API remains.

if __name__ == '__main__':
    unittest.main()
