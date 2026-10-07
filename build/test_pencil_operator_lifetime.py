"""Execute registered operator identity capture/resolve and wrapper preservation.

The registry and WM type layout are fixture boundaries, not an iOS build.
"""
import re
import unittest
from test_touch_extrude import changed_source
from test_pencil_callback_disposal import definition
import test_ipad_panels

REGISTRY=changed_source('source/blender/windowmanager/intern/wm_operator_type.cc')
WRAPPER=changed_source('source/blender/python/intern/bpy_operator_wrap.cc')
HANDLERS=changed_source('source/blender/editors/interface/interface_handlers.cc')
HEADER=changed_source('source/blender/editors/interface/interface_ipad_rna.hh')

class PencilOperatorLifetimeTests(unittest.TestCase):
    def test_all_registered_allocations_stamp_and_python_copy_preserves_identity(self):
        allocations=re.findall(r'(?:wmOperatorType \*)?ot = MEM_callocN<wmOperatorType>\("operatortype"\);\n  ot->ipad_lifetime_id = wm_ipad_operator_lifetime_allocate\(\);',REGISTRY)
        self.assertEqual(len(allocations),3)
        types=changed_source('source/blender/windowmanager/WM_types.hh')
        self.assertIn('short flag;\n  /** Runtime registration identity;',types)
        self.assertIn('uint64_t ipad_lifetime_id;',types)
        self.assertNotIn('uint64_t ipad_lifetime_id =',types)
        body=definition(WRAPPER,'void BPY_RNA_operator_wrapper(')
        copy=body[body.index('  StructRNA *srna = ot->srna;'):body.index('  /* Use i18n')]
        allocator=definition(REGISTRY,'static uint64_t wm_ipad_operator_lifetime_allocate(')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#include <cassert>
#include <cstdint>
#include <type_traits>
static uint64_t wm_ipad_operator_next_lifetime=1;
struct StructRNA{};
struct wmOperatorType{const char *name;StructRNA *srna;uint64_t ipad_lifetime_id;};
static_assert(std::is_trivial_v<wmOperatorType>);
'''+allocator+r'''
void wrapper(wmOperatorType *ot,void *userdata){
'''+copy+r'''}
int main(){StructRNA schema;wmOperatorType dummy{},live{};live.srna=&schema;
 assert(dummy.ipad_lifetime_id==0);
 for(uint64_t i=1;i<=10000;++i){live.ipad_lifetime_id=wm_ipad_operator_lifetime_allocate();assert(live.ipad_lifetime_id==i);
  wrapper(&live,&dummy);assert(live.ipad_lifetime_id==i&&live.srna==&schema);}
 wm_ipad_operator_next_lifetime=UINT64_MAX-1;assert(wm_ipad_operator_lifetime_allocate()==UINT64_MAX-1);
 for(int i=0;i<10000;++i)assert(wm_ipad_operator_lifetime_allocate()==0);
}
''')

    def test_fresh_registry_lookup_refuses_missing_reloaded_and_reused_type(self):
        receipt=definition(HEADER,'struct uiIPadOperatorReceipt {')+';'
        functions='\n'.join(definition(HANDLERS,s) for s in (
            'static wmOperatorType *ui_ipad_operator_type_live(',
            'static uiIPadOperatorReceipt ui_ipad_operator_capture(',
            'static wmOperatorType *ui_ipad_operator_resolve('))
        dispatch=definition(HANDLERS,'static void ui_apply_but_funcs_after(')
        start=dispatch.index('if (after.optype && ipad_ring_allowed && allowed())')
        self.assertLess(start,dispatch.index('ui_ipad_operator_resolve(after.ipad_operator)'))
        self.assertIn('dispatch_type,',dispatch)
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#include <cassert>
#include <cstdint>
#include <string>
#include <vector>
struct StructRNA{};
struct wmOperatorType{uint64_t ipad_lifetime_id=0;const char *idname=nullptr;StructRNA *srna=nullptr;};
std::vector<wmOperatorType *> registry;int lookups=0;
const std::vector<wmOperatorType *> &WM_operatortypes_registered_get(){++lookups;return registry;}
'''+receipt+functions+r'''
int main(){StructRNA schema,other_schema;wmOperatorType type{7,"VIEW3D_OT_native",&schema};registry={&type};
 auto receipt=ui_ipad_operator_capture(&type);assert(receipt.lifetime==7);
 for(int i=0;i<10000;++i){assert(ui_ipad_operator_resolve(receipt)==&type);registry.clear();
  assert(!ui_ipad_operator_resolve(receipt));registry={&type};
  ++type.ipad_lifetime_id;assert(!ui_ipad_operator_resolve(receipt));--type.ipad_lifetime_id;}
 type.idname="VIEW3D_OT_other";assert(!ui_ipad_operator_resolve(receipt));type.idname="VIEW3D_OT_native";
 type.srna=&other_schema;assert(!ui_ipad_operator_resolve(receipt));type.srna=&schema;
 // Even identical name, type and srna addresses cannot admit a reloaded registration.
 ++type.ipad_lifetime_id;assert(!ui_ipad_operator_resolve(receipt));
 registry.clear();assert(ui_ipad_operator_capture(reinterpret_cast<wmOperatorType *>(1)).lifetime==0);
 receipt.address=1;assert(!ui_ipad_operator_resolve(receipt));
 registry={&type};type.ipad_lifetime_id=0;assert(ui_ipad_operator_capture(&type).lifetime==0);
 assert(!ui_ipad_operator_resolve({}));assert(lookups>30000);
}
''')

if __name__=='__main__':
    unittest.main()
