#pragma once
#include <cassert>
#include <climits>
#include <cmath>
#include <cstddef>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <map>
#include <string>
#include <type_traits>
#include <vector>
#define ATTR_WARN_UNUSED_RESULT
#define BLI_INLINE inline
#define BLI_assert(x) assert(x)
#define UNLIKELY(x) (x)
#define UNUSED_VARS(...) ((void)0)
#define CLOG_WARN(...) ((void)0)
#define LISTBASE_FOREACH(T,v,l) for(T v=static_cast<T>((l)->first);v;v=v->next)
template<class T,class...U> bool ELEM(const T&x,const U&...v){return ((x==v)||...);}
struct ARegion;struct BMEditMesh;struct Depsgraph;struct IDProperty;struct Main;
struct Object;struct Scene;struct ScrArea;struct View3D;struct ViewLayer;
struct RegionView3D;struct bContext;struct bContextStore;struct bScreen;
struct WorkSpace;struct wmWindowManager;struct wmWindow;struct wmGizmoGroup;
struct wmEvent;struct wmOperator;struct wmOperatorType;struct wmKeyMap;
struct PointerRNA;struct ReportList;struct PropertyRNA;struct StructRNA;
struct FunctionRNA;struct ParameterList;struct uiLayout;struct ViewOpsData;
NATIVE_DECLARATIONS
// Explicit storage boundaries. Actual operator/context/public declarations and
// field-accessing helper bodies above/below are not rewritten by these models.
struct PropertyRNA { std::string name; int flag=0; };
struct StructRNA { std::vector<PropertyRNA*> properties; };
struct Scene{};struct ViewLayer{};struct View3D{};struct Object{};
struct RegionView3D { char viewlock=0,runtime_viewlock=0; };
struct ARegion { int regiontype=0;void*regiondata=nullptr; };
struct ScrArea { int spacetype=1;ListBase spacedata{}; };
struct PointerRNA { void*data=nullptr;StructRNA*type=nullptr; };
struct wmEvent{};
struct bContextDataResult { PointerRNA ptr; };
struct KnifeTool_OpData { ViewContext vc{}; KnifeMode mode=MODE_IDLE; };
inline int native_callback_calls=0,python_member_calls=0,dynamic_free_calls=0;
inline bool native_main_thread=true;
inline StructRNA RNA_Area{},RNA_Region{},RNA_OperatorProperties{};
inline int BLENDER_RNA=0,rna_enum_operator_property_tag_items=0;
inline int ot_prop_basic_count=-1;
inline std::map<std::string,wmOperatorType*> registry;
inline constexpr int SPACE_VIEW3D=1,RGN_TYPE_WINDOW=0,WM_CURSOR_PICK_AREA=1;
inline constexpr int PROP_HIDDEN=1,PROP_SKIP_SAVE=2,PROP_ANGLE=3;
inline constexpr const char*BLT_I18NCONTEXT_ID_MESH="Mesh";
inline constexpr const char*BLT_I18NCONTEXT_OPERATOR_DEFAULT="Operator";
inline bool BLI_thread_is_main(){return native_main_thread;}
inline bool BPY_context_member_get(bContext*,const char*,bContextDataResult*){++python_member_calls;return false;}
inline bool RNA_struct_is_a(StructRNA*a,const StructRNA*b){return a==b;}
inline const char*RNA_struct_identifier(StructRNA*){return "host RNA descriptor";}
template<class T>T*MEM_callocN(const char*){return new T{};}
template<class...T>StructRNA*RNA_def_struct_ptr(T...){return new StructRNA{};}
template<class...T>void RNA_def_struct_property_tags(T...){}
template<class...T>void RNA_def_struct_translation_context(T...){}
template<class...T>PropertyRNA*RNA_def_int(StructRNA*s,const char*n,T...){auto*p=new PropertyRNA{n};s->properties.push_back(p);return p;}
template<class...T>PropertyRNA*RNA_def_boolean(StructRNA*s,const char*n,T...){auto*p=new PropertyRNA{n};s->properties.push_back(p);return p;}
template<class...T>PropertyRNA*RNA_def_float(StructRNA*s,const char*n,T...){auto*p=new PropertyRNA{n};s->properties.push_back(p);return p;}
template<class...T>PropertyRNA*RNA_def_enum(StructRNA*s,const char*n,T...){auto*p=new PropertyRNA{n};s->properties.push_back(p);return p;}
inline void RNA_def_property_flag(PropertyRNA*p,int f){p->flag|=f;}
template<class...T>void RNA_def_property_subtype(T...){}
template<class...T>void RNA_def_property_translation_context(T...){}
#define DEG2RADF(x) ((x)*0.017453292519943295f)
inline wmOperatorType*WM_operatortype_find(const char*n,bool){auto i=registry.find(n);return i==registry.end()?nullptr:i->second;}
void fixture_register_types(wmOperatorType**,wmOperatorType**);
bool fixture_zoom_poll(bContext*);
void fixture_dynamic_free(bContext*,void*);
