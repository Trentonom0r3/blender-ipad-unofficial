"""Exercise shipped precision ownership, releases, navigation and cached state."""
import unittest
import test_ipad_panels
import test_transform_tool_properties


def block(code, anchor):
    start = code.index(anchor)
    opening = code.index('{', start)
    depth = 0
    for end in range(opening, len(code)):
        depth += (code[end] == '{') - (code[end] == '}')
        if depth == 0:
            return code[start:end + 1]
    raise AssertionError(anchor)


class FineDragLifecycleTests(unittest.TestCase):
    def test_shift_and_navigation_leave_keyboard_state_independent(self):
        code = test_transform_tool_properties.patched_lines('source/blender/editors/transform/transform.cc')
        helper = block(code, 'bool transform_tool_precision(')
        release = block(code, 'else if (event->prev_val == KM_RELEASE)')
        release = release.replace('else if', 'if', 1)
        code = test_transform_tool_properties.patched_lines('source/blender/editors/transform/transform_ops.cc')
        navigation = block(code, 'if (t->modifiers & MOD_PRECISION)')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#define WITH_APPLE_CROSSPLATFORM
#include <cassert>
#include <cstring>
#include <initializer_list>
constexpr int MOD_PRECISION=2, MOD_SNAP_INVERT=4, TREDRAW_HARD=1, KM_RELEASE=2;
struct PropertyRNA {};
struct PointerRNA { bool available=true, baseline=false; };
struct wmOperator { PointerRNA *ptr; };
struct MouseInput { bool precision; double accumulated; };
struct TransInfo { int modifiers, redraw=0, resets=0; MouseInput mouse; };
struct wmEvent { int prev_val; };
PropertyRNA *RNA_struct_find_property(PointerRNA *ptr,const char *key) {
  assert(std::strcmp(key,"ipad_tool_precision")==0);
  static PropertyRNA prop; return ptr->available ? &prop : nullptr;
}
bool RNA_property_boolean_get(PointerRNA *ptr,PropertyRNA *) { return ptr->baseline; }
HELPER
void transform_input_virtual_mval_reset(TransInfo *t) { ++t->resets; t->mouse.accumulated=0; }
void shift_release(TransInfo *t,wmOperator *op,const wmEvent *event) {
__RELEASE_CODE__
}
void navigation_start(TransInfo *t,wmOperator *op) {
NAVIGATION
}
int main() {
  assert(!transform_tool_precision(nullptr));
  wmOperator null_op{nullptr}; assert(!transform_tool_precision(&null_op));
  for(bool fine:{false,true}) {
    for(bool available:{false,true}) {
      PointerRNA ptr{available,fine}; wmOperator op{&ptr}; wmEvent event{KM_RELEASE};
      const bool configured=fine && available;
      // Physical Shift release clears its native modifier and snap precision,
      // while a deliberate fine pointer gain survives without synthesizing Shift.
      TransInfo t{MOD_PRECISION|MOD_SNAP_INVERT,0,0,{true,37.0}};
      shift_release(&t,&op,&event);
      assert(t.modifiers==MOD_SNAP_INVERT && t.mouse.precision==configured);
      assert(t.mouse.accumulated==37 && t.redraw==TREDRAW_HARD && t.resets==0);
      // Navigating mid-drag must not erase configured gain or its displacement.
      t={MOD_PRECISION|MOD_SNAP_INVERT,0,0,{true,37.0}};
      navigation_start(&t,&op);
      assert(t.modifiers==MOD_SNAP_INVERT);
      assert(t.mouse.precision==configured && t.resets==!configured);
      assert(t.mouse.accumulated==(configured ? 37 : 0));
      // No temporary keyboard precision: navigation cleanup changes nothing.
      t={MOD_SNAP_INVERT,0,0,{configured,19.0}};
      navigation_start(&t,&op);
      assert(t.modifiers==MOD_SNAP_INVERT && t.mouse.precision==configured);
      assert(t.mouse.accumulated==19 && t.resets==0);
    }
  }
}
'''.replace('HELPER', helper).replace('__RELEASE_CODE__', release).replace('NAVIGATION', navigation))

    def test_runtime_marker_is_hidden_and_not_replayed_by_shortcuts(self):
        code = test_transform_tool_properties.patched_lines('source/blender/editors/transform/transform_ops.cc')
        start = code.index('    prop = RNA_def_boolean(ot->srna, "ipad_tool_precision"')
        end = code.index('RNA_def_property_flag(prop, PROP_HIDDEN | PROP_SKIP_SAVE);', start)
        definition = code[start:end + len('RNA_def_property_flag(prop, PROP_HIDDEN | PROP_SKIP_SAVE);')]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#include <cassert>
#include <cstring>
constexpr int PROP_HIDDEN=1, PROP_SKIP_SAVE=2;
struct PropertyRNA { int flags=0; bool default_value=true; };
struct wmOperatorType { void *srna=nullptr; };
PropertyRNA definition;
PropertyRNA *RNA_def_boolean(void *,const char *name,bool default_value,const char *,const char *) {
  assert(std::strcmp(name,"ipad_tool_precision")==0);
  definition.default_value=default_value; return &definition;
}
void RNA_def_property_flag(PropertyRNA *prop,int flags) { prop->flags=flags; }
void register_property(wmOperatorType *ot) {
  PropertyRNA *prop;
DEFINITION
}
int main() {
  wmOperatorType ot; register_property(&ot);
  assert(!definition.default_value && definition.flags==(PROP_HIDDEN|PROP_SKIP_SAVE));
  // WM's last-properties contract excludes SKIP_SAVE, even after a fine tool
  // modal stores True. The next G/R/S invocation has the default False marker.
  bool cached_marker=true;
  bool shortcut_marker=(definition.flags & PROP_SKIP_SAVE) ? definition.default_value : cached_marker;
  assert(!shortcut_marker);
}
'''.replace('DEFINITION', definition))


if __name__ == '__main__':
    unittest.main()
