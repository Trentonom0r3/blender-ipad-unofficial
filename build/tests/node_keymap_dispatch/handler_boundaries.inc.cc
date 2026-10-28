static bool interface_locked=false;static int interface_checks=0,post_calls=0;
static bool wm_operator_check_locked_interface(bContext*,wmOperatorType*){++interface_checks;return !interface_locked;}
static const char*BLI_strcasestr(const char*a,const char*b){return std::strstr(a,b);}
static bToolRef*WM_toolsystem_ref_from_context(bContext*){return nullptr;}
namespace blender::wm{enum class OpCallContext{InvokeDefault};}
static void WM_operator_name_call(bContext*,const char*,blender::wm::OpCallContext,void*,wmEvent*){std::abort();}
struct wmGizmo{int flag=0;};struct wmGizmoMap{};struct wmEventHandler_Gizmo{wmEventHandler head;wmGizmoMap*gizmo_map;};
enum{WM_GIZMO_OPERATOR_TOOL_INIT=1};
static wmGizmo*wm_gizmomap_highlight_get(wmGizmoMap*){return nullptr;}
static void WM_toolsystem_ref_properties_init_for_keymap(bToolRef*,PointerRNA*p,PointerRNA*s,wmOperatorType*){*p=*s;}
static void WM_toolsystem_ref_properties_for_transform(bContext*,bToolRef*,PointerRNA*,wmOperatorType*,bool){}
