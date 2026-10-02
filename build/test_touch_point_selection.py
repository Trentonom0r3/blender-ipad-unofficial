"""Compile the shipped direct point-pick/native-property mapping."""
from pathlib import Path
import unittest
import test_ipad_panels


class TouchPointSelectionTests(unittest.TestCase):
    def test_native_mapping_preserves_external_and_advanced_selection(self):
        patch = (Path(__file__).resolve().parents[1] / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        section = patch.split('diff --git a/source/blender/editors/space_view3d/view3d_select.cc ', 1)[1].split('diff --git ', 1)[0]
        code = '\n'.join(line[1:] for line in section.splitlines()
                         if line.startswith((' ', '+')) and not line.startswith('+++'))
        start = code.index('#ifdef WITH_APPLE_CROSSPLATFORM')
        end = code.index('#endif', start) + len('#endif')
        guard = code[start:end]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r"""
#define WITH_APPLE_CROSSPLATFORM
#include <cassert>
#include <cstring>
#include <initializer_list>
#define STREQ(a,b) (std::strcmp(a,b)==0)
#define STRPREFIX(a,b) (std::strncmp(a,b,std::strlen(b))==0)
#define ELEM(v,a,b,c) ((v)==(a)||(v)==(b)||(v)==(c))
constexpr int LEFTMOUSE = 1, MIDDLEMOUSE = 2, WM_EVENT_IS_DIRECT_TOOL = 128;
constexpr int SEL_OP_SET = 0, SEL_OP_ADD = 1, SEL_OP_SUB = 2, SEL_OP_AND = 3;
struct Properties { bool extend=false, deselect=false, toggle=true, deselect_all=true, select_passthrough=true; };
struct bToolRef { const char *idname; int operation; bool stored=true; };
struct bContext { const char *mode; bToolRef *tool; };
struct Event { int type, flag, modifier, keymodifier; };
struct PointerRNA { Properties *values=nullptr; bToolRef *tool=nullptr; };
struct wmOperator { PointerRNA *ptr; };
struct wmOperatorType {};
const char *CTX_data_mode_string(bContext *C) { return C->mode; }
bToolRef *WM_toolsystem_ref_from_context(bContext *C) { return C->tool; }
wmOperatorType *WM_operatortype_find(const char *, bool) { static wmOperatorType op; return &op; }
bool WM_toolsystem_ref_properties_get_from_operator(bToolRef *tool, wmOperatorType *, PointerRNA *p) {
  p->tool = tool; return tool->stored;
}
int RNA_enum_get(PointerRNA *p, const char *) { return p->tool->operation; }
void RNA_boolean_set(PointerRNA *p, const char *name, bool value) {
  if (STREQ(name,"extend")) p->values->extend=value;
  else if (STREQ(name,"deselect")) p->values->deselect=value;
  else if (STREQ(name,"toggle")) p->values->toggle=value;
  else if (STREQ(name,"deselect_all")) p->values->deselect_all=value;
  else if (STREQ(name,"select_passthrough")) p->values->select_passthrough=value;
  else assert(false);
}
void map(bContext *C, wmOperator *op, const Event *event) {
GUARD
}
int main() {
  for (const char *tool_id : {"builtin.select_box","builtin.select_lasso","builtin.move"}) {
    for (const char *mode : {"OBJECT","POSE","EDIT_MESH","EDIT_CURVE","SCULPT","PAINT_TEXTURE"}) {
      for (int operation : {SEL_OP_SET,SEL_OP_ADD,SEL_OP_SUB,SEL_OP_AND}) {
        for (int modifier : {0,1}) for (int keymodifier : {0,1}) {
          for (int flag : {0,WM_EVENT_IS_DIRECT_TOOL}) for (int type : {LEFTMOUSE,MIDDLEMOUSE}) {
            for (bool stored : {false,true}) {
              bToolRef tool{tool_id,operation,stored};
              bContext C{mode,&tool};
              Properties props;
              PointerRNA ptr{&props};
              wmOperator op{&ptr};
              Event event{type,flag,modifier,keymodifier};
              map(&C,&op,&event);
              const bool mapped = !STREQ(tool_id,"builtin.move") &&
                  !STREQ(mode,"SCULPT") && !STREQ(mode,"PAINT_TEXTURE") &&
                  operation != SEL_OP_AND && !modifier && !keymodifier &&
                  flag && type == LEFTMOUSE && stored;
              if (mapped) {
                assert(props.extend == (operation == SEL_OP_ADD));
                assert(props.deselect == (operation == SEL_OP_SUB));
                assert(!props.toggle && !props.select_passthrough);
                assert(props.deselect_all == (operation == SEL_OP_SET));
              }
              else {
                assert(!props.extend && !props.deselect && props.toggle &&
                       props.deselect_all && props.select_passthrough);
              }
            }
          }
        }
      }
    }
  }
  bContext C{"OBJECT",nullptr};
  Properties props;
  PointerRNA ptr{&props};
  wmOperator op{&ptr};
  Event event{LEFTMOUSE,WM_EVENT_IS_DIRECT_TOOL,0,0};
  map(&C,&op,&event);
  assert(props.toggle && props.select_passthrough); // Removed tool remains native.
}
""".replace('GUARD', guard))


if __name__ == '__main__':
    unittest.main()
