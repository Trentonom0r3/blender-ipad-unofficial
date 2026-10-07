"""Execute native tool classification for the owned admission wrapper.

This preserves the stock widget's tool-icon branch; it is not a GPU preview.
"""
import unittest
from test_touch_extrude import changed_source
from test_compact_shelf import function
import test_ipad_panels

class PencilNativeToolStyleTests(unittest.TestCase):
    def test_owned_wrapper_keeps_native_tool_styling_without_reclassifying_other_buttons(self):
        source=changed_source('source/blender/editors/interface/interface_query.cc')
        body=function(source,'bool UI_but_is_tool(')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#include <cassert>
#include <cstdint>
#include <cstring>
#define STREQ(a,b) (std::strcmp(a,b)==0)
constexpr int UI_PIE_IPAD_TOOLS=256;
struct wmOperatorType{const char *idname;};
struct uiBlock{struct{int flags=UI_PIE_IPAD_TOOLS;}pie_data;uint64_t ipad_ring_lifetime=7;};
struct uiBut{wmOperatorType *optype;uiBlock *block;};
wmOperatorType native{"WM_OT_tool_set_by_id"},wrapper{"VIEW3D_OT_ipad_native_tool"},other{"VIEW3D_OT_ipad_transform_axis"};
wmOperatorType *g_ot_tool_set_by_id=nullptr;int lookups=0;
wmOperatorType *WM_operatortype_find(const char *name,bool){++lookups;assert(STREQ(name,native.idname));return &native;}
BODY
int main(){uiBlock block;uiBut but{&wrapper,&block};
 for(int i=0;i<10000;++i)assert(UI_but_is_tool(&but));assert(!lookups);
 but.block=nullptr;assert(!UI_but_is_tool(&but)&&lookups==1);but.block=&block;
 block.pie_data.flags=0;assert(!UI_but_is_tool(&but));block.pie_data.flags=UI_PIE_IPAD_TOOLS;
 block.ipad_ring_lifetime=0;assert(!UI_but_is_tool(&but));block.ipad_ring_lifetime=7;
 but.optype=&other;assert(!UI_but_is_tool(&but));but.optype=nullptr;assert(!UI_but_is_tool(&but));
 // All ordinary native tool buttons retain the original classification.
 but.optype=&native;but.block=nullptr;assert(UI_but_is_tool(&but)&&lookups==1);
 but.block=&block;block.pie_data.flags=0;block.ipad_ring_lifetime=0;assert(UI_but_is_tool(&but));
}
'''.replace('BODY',body))

if __name__=='__main__':unittest.main()
