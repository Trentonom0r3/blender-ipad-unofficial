"""Compile the shipped tool-basis policy and combined child ownership path."""
from pathlib import Path
import unittest
import test_ipad_panels


def patched_lines(path):
    patch = (Path(__file__).resolve().parents[1] / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
    section = patch.split(f'diff --git a/{path} b/{path}\n', 1)[1].split('diff --git ', 1)[0]
    return '\n'.join(line[1:] for line in section.splitlines()
                     if line.startswith((' ', '+')) and not line.startswith('+++'))


class TransformToolPropertiesTests(unittest.TestCase):
    def test_view_rotation_ring_keeps_native_gizmo_dispatch(self):
        code = patched_lines('source/blender/windowmanager/intern/wm_event_system.cc')
        start = code.index('        WM_toolsystem_ref_properties_for_transform(',
                           code.index('Native gizmos still own their basis'))
        end = code.index(';', start) + 1
        dispatch = code[start:end]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r"""
#include <cassert>
#include <initializer_list>
constexpr int WM_HANDLER_TYPE_KEYMAP=1, WM_HANDLER_TYPE_GIZMO=2;
struct Handler { int type; };
bool injected=false;
void WM_toolsystem_ref_properties_for_transform(int,int,int *,int,bool orientation) { injected=orientation; }
void dispatch(Handler *handler_base) {
  int C=0,keymap_tool=0,tool_properties=0,ot=0;
DISPATCH
}
int main() {
  for(int type:{WM_HANDLER_TYPE_KEYMAP,WM_HANDLER_TYPE_GIZMO}) {
    Handler handler{type}; dispatch(&handler);
    assert(injected==(type==WM_HANDLER_TYPE_KEYMAP));
  }
}
""".replace('DISPATCH', dispatch))

    def test_native_tool_basis_and_explicit_gizmo_precedence(self):
        code = patched_lines('source/blender/windowmanager/intern/wm_toolsystem.cc')
        start = code.index('void WM_toolsystem_ref_properties_for_transform(')
        helper = code[start:code.index('\n#endif', start)]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#include <cassert>
#include <cstring>
#include <string>
#include <set>
#include <initializer_list>
#define STREQ(a,b) (std::strcmp(a,b)==0)
#define STRPREFIX(a,b) (std::strncmp(a,b,std::strlen(b))==0)
constexpr int SPACE_VIEW3D=1, SCE_ORIENT_TRANSLATE=1, SCE_ORIENT_ROTATE=2, SCE_ORIENT_SCALE=3;
struct Scene { int orientation[4]={0,11,22,33}; bool use[4]={true,true,true,true}; };
struct bContext { Scene *scene; const char *mode; };
struct bToolRef { int space_type; const char *idname; bool stored_fine=false; };
struct wmOperatorType { const char *idname; };
struct PointerRNA { std::set<std::string> explicit_props; int orientation=-1; bool fine=false,baseline=false; };
const char *CTX_data_mode_string(const bContext *C) { return C->mode; }
Scene *CTX_data_scene(const bContext *C) { return C->scene; }
bool RNA_struct_property_is_set(PointerRNA *ptr,const char *key) { return ptr->explicit_props.count(key); }
int BKE_scene_orientation_get_index(Scene *scene,int slot) {
  return scene->orientation[scene->use[slot] ? slot : 0];
}
void RNA_enum_set(PointerRNA *ptr,const char *key,int value) {
  assert(STREQ(key,"orient_type")); ptr->orientation=value; ptr->explicit_props.insert(key);
}
bool WM_toolsystem_ref_properties_get_from_operator(bToolRef *tool,const wmOperatorType *,PointerRNA *ptr) {
  ptr->fine=tool->stored_fine;
  if(tool->stored_fine) ptr->explicit_props.insert("use_accurate");
  return tool->stored_fine;
}
bool RNA_boolean_get(PointerRNA *ptr,const char *key) { assert(STREQ(key,"use_accurate")); return ptr->fine; }
void RNA_boolean_set(PointerRNA *ptr,const char *key,bool value) {
  assert(STREQ(key,"ipad_tool_precision")); ptr->baseline=value;
}
void WM_toolsystem_ref_properties_for_transform(const bContext *,bToolRef *,PointerRNA *,const wmOperatorType *,bool=true);
HELPER
int main() {
  Scene scene;
  bContext C{&scene,"OBJECT"};
  const char *tools[]={"builtin.move","builtin.rotate","builtin.scale","builtin.transform","builtin.select_box"};
  const char *operators[]={"TRANSFORM_OT_translate","TRANSFORM_OT_rotate","TRANSFORM_OT_resize","VIEW3D_OT_select_box"};
  for(int tool=0;tool<5;++tool) {
    for(int op=0;op<4;++op) {
      for(int space:{SPACE_VIEW3D,2}) {
        for(const char *mode:{"OBJECT","POSE","EDIT_MESH","EDIT_ARMATURE","SCULPT", "PAINT_WEIGHT"}) {
          for(const char *explicit_prop:{"", "orient_type", "orient_matrix", "orient_matrix_type"}) {
            for(bool use:{false,true}) {
              for(bool custom:{false,true}) {
                bToolRef tref{space,tools[tool]}; wmOperatorType ot{operators[op]}; PointerRNA ptr;
                if(*explicit_prop) ptr.explicit_props.insert(explicit_prop);
                C.mode=mode;
                int slot=tool==3 ? 1 : tool+1;
                const bool matching=(tool<3 && tool==op) || (tool==3 && op<3);
                const bool eligible=matching && space==SPACE_VIEW3D && !*explicit_prop &&
                    (STREQ(mode,"OBJECT") || STREQ(mode,"POSE") || STRPREFIX(mode,"EDIT_"));
                if(slot<4) { scene.use[slot]=use; scene.orientation[slot]=custom ? 105 : slot*11; }
                WM_toolsystem_ref_properties_for_transform(&C,&tref,&ptr,&ot);
                assert(ptr.orientation==(eligible ? scene.orientation[use ? slot : 0] : -1));
              }
            }
          }
        }
      }
    }
  }
  PointerRNA ptr; wmOperatorType ot{operators[0]}; bToolRef tref{SPACE_VIEW3D,tools[0]};
  WM_toolsystem_ref_properties_for_transform(&C,nullptr,&ptr,&ot);
  C.mode="OBJECT"; C.scene=nullptr;
  WM_toolsystem_ref_properties_for_transform(&C,&tref,&ptr,&ot);
  assert(ptr.orientation==-1);
  C.scene=&scene;
  for(bool configured:{false,true}) {
    for(bool merged:{false,true}) {
      for(bool use_orientation:{false,true}) {
        for(const char *explicit_prop:{"", "orient_type", "orient_matrix", "orient_matrix_type"}) {
          PointerRNA fine_ptr; fine_ptr.fine=merged;
          if(*explicit_prop) fine_ptr.explicit_props.insert(explicit_prop);
          tref.stored_fine=configured;
          WM_toolsystem_ref_properties_for_transform(&C,&tref,&fine_ptr,&ot,use_orientation);
          assert(fine_ptr.baseline==(configured && merged));
          assert((fine_ptr.orientation!=-1)==(use_orientation && !*explicit_prop));
        }
      }
    }
  }
}
'''.replace('HELPER', helper))
        event_code = patched_lines('source/blender/windowmanager/intern/wm_event_system.cc')
        self.assertIn('WM_toolsystem_ref_properties_for_transform(C, keymap_tool, &tool_properties, ot,', event_code)

    def test_combined_transform_owns_two_independent_copies(self):
        code = patched_lines('source/blender/editors/transform/transform_ops.cc')
        start = code.index('        PointerRNA op_ptr;', code.index('WM_toolsystem_ref_properties_init_for_keymap') - 500)
        end = code.index('WM_operator_properties_free(&op_ptr);', start) + len('WM_operator_properties_free(&op_ptr);')
        wrapper = code[start:end]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#define WITH_APPLE_CROSSPLATFORM
#include <cassert>
#include <map>
#include <set>
#include <string>
#include <initializer_list>
using Properties=std::map<std::string,int>;
struct PointerRNA { Properties *data=nullptr; };
struct wmOperatorType { std::string idname; };
struct bToolRef { std::map<std::string,Properties> children; };
struct Context {};
struct Event {};
namespace wm { enum class OpCallContext { InvokeDefault }; }
std::set<Properties *> live;
Properties retained;
int frees=0, calls=0;
Properties *allocate(Properties value={}) {
  auto *p=new Properties(value); assert(live.insert(p).second); return p;
}
void WM_operator_properties_create_ptr(PointerRNA *ptr,wmOperatorType *) { ptr->data=allocate(); }
void RNA_boolean_set(PointerRNA *ptr,const char *key,bool value) { (*ptr->data)[key]=value; }
void WM_toolsystem_ref_properties_init_for_keymap(bToolRef *tool,PointerRNA *dst,
                                                  PointerRNA *src,wmOperatorType *ot) {
  // Native API contract: copy the seed, fill only absent child properties.
  dst->data=allocate(*src->data);
  const auto child=tool->children.find(ot->idname);
  if(child!=tool->children.end()) for(const auto &p:child->second) dst->data->insert(p);
}
void WM_toolsystem_ref_properties_for_transform(Context *,bToolRef *,PointerRNA *ptr,wmOperatorType *) {
  ptr->data->insert({"orient_type",11});
}
void WM_operator_name_call_ptr(Context *,wmOperatorType *,wm::OpCallContext,
                              PointerRNA *ptr,const Event *) {
  ++calls; retained=*ptr->data; // Real operator creation deep-copies even RUNNING_MODAL.
}
void WM_operator_properties_free(PointerRNA *ptr) {
  assert(live.erase(ptr->data)==1); ++frees; delete ptr->data; ptr->data=nullptr;
}
void invoke(Context *C,bToolRef *tref,wmOperatorType *ot,const Event *event) {
WRAPPER
}
int main() {
  Context C; Event event;
  for(const char *child:{"TRANSFORM_OT_translate","TRANSFORM_OT_rotate","TRANSFORM_OT_resize"}) {
    for(bool has_props:{false,true}) {
      bToolRef tool;
      tool.children["unrelated"]={{"constraint_axis",99}};
      if(has_props) tool.children[child]={{"release_confirm",0},{"constraint_axis",3}};
      const auto before=tool.children;
      wmOperatorType ot{child};
      const int previous_frees=frees, previous_calls=calls;
      invoke(&C,&tool,&ot,&event);
      assert(live.empty() && frees==previous_frees+2 && calls==previous_calls+1);
      assert(retained.at("release_confirm")==1 && retained.at("orient_type")==11);
      assert(retained.count("constraint_axis")==unsigned(has_props));
      if(has_props) assert(retained.at("constraint_axis")==3);
      retained["constraint_axis"]=7;
      assert(tool.children==before); // Retained modal state never aliases tool or freed seed.
    }
  }
}
'''.replace('WRAPPER', wrapper))


if __name__ == '__main__':
    unittest.main()
