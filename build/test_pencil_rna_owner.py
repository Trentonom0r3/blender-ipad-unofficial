"""Execute changed fresh-ID RNA path, shape, Undo and ancestor rebinding.

External native RNA APIs are fixtures. Tool/pending-operator proof is separate.
"""
import unittest
from test_touch_extrude import changed_source
from test_tool_ring import ring_source
from test_pencil_callback_disposal import definition
import test_ipad_panels

SOURCE=changed_source('source/blender/editors/interface/interface.cc')
RECEIPT=changed_source('source/blender/editors/interface/interface_ipad_rna.hh').replace('#pragma once','')
FUNCTIONS='\n'.join(definition(SOURCE,s) for s in (
 'static uint64_t ui_ipad_rna_address(', 'static bool ui_ipad_rna_main_member(',
 'bool ui_ipad_context_store_rebind(',
 'static ID *ui_ipad_rna_id_root(',
 'static void ui_ipad_rna_history_capture(', 'static bool ui_ipad_rna_history_matches(',
 'static bool ui_ipad_rna_is_tool(', 'static bool ui_ipad_rna_tool_root(',
 'static bool ui_ipad_rna_id_matches(', 'static uiIPadRNAPathStep ui_ipad_rna_backend_step(',
 'bool ui_ipad_numbers_popup_valid(', 'static bool ui_ipad_rna_pending_root(',
 'static bool ui_ipad_rna_group_path(', 'static bool ui_ipad_rna_backend_preflight(',
 'static bool ui_ipad_rna_runtime_leaf(', 'static bool ui_ipad_rna_static_path(',
 'static bool ui_ipad_rna_static_walk(', 'static bool ui_ipad_rna_shape(',
 'static bool ui_ipad_rna_finish_capture(', 'static bool ui_ipad_rna_tool_capture(',
 'bool ui_ipad_rna_capture(', 'bool ui_ipad_rna_resolve('))

WORLD=r'''
#include <cassert>
#include <climits>
#include <cstring>
#include <map>
#include <optional>
#include <tuple>
#include <variant>
namespace ipad_ring=blender::ui::ipad;
#define UNUSED_VARS(...) (void)std::tie(__VA_ARGS__)
#define GS(name) (uint16_t(uint8_t((name)[0]))|(uint16_t(uint8_t((name)[1]))<<8))
constexpr int RNA_MAX_ARRAY_DIMENSION=3,PROP_IDPROPERTY=1;
enum PropertyType{PROP_BOOLEAN,PROP_FLOAT,PROP_POINTER,PROP_COLLECTION,PROP_INT,PROP_ENUM,PROP_STRING};
struct StructRNA;struct PropertyRNA;
struct ID{char name[66]={'S','C'};unsigned int session_uid=7;StructRNA *schema=nullptr;};
struct Main{std::vector<ID *> ids;};
#define FOREACH_MAIN_ID_BEGIN(main,id) for(ID *live_id:(main)->ids){id=live_id;
#define FOREACH_MAIN_ID_END }
ID *BKE_libblock_find_session_uid(Main *main,short type,uint32_t uid){for(ID *id:main->ids)if(GS(id->name)==type&&id->session_uid==uid)return id;return nullptr;}
struct PointerRNA{ID *owner_id=nullptr;StructRNA *type=nullptr;void *data=nullptr;std::vector<int> ancestors;};
struct bContextStoreEntry{std::string name;std::variant<PointerRNA,std::string,int64_t> value;};
struct bContextStore{std::vector<bContextStoreEntry> entries;bool used=false;};
struct PropertyRNA{std::string name,path;int flags=0;PropertyType type=PROP_FLOAT;bool array=false;int dim=0,len=0;std::array<int,3> shape{};PointerRNA target;};
struct StructRNA{std::map<std::string,PropertyRNA *> fields;};
StructRNA RNA_WorkSpaceTool;
struct Scene{ID id;};struct Object{ID id;void *data=nullptr;};struct bScreen{ID id;};struct Brush{ID id;};
struct Paint{Brush *brush=nullptr;};struct UndoStack{uint64_t ipad_lifetime_id=11,ipad_mutation_generation=19;};
struct WindowManagerRuntime{UndoStack *undo_stack=nullptr;};struct wmWindowManager{ID id;WindowManagerRuntime *runtime=nullptr;};
enum {IDP_GROUP=1,IDP_IDPARRAY,IDP_ARRAY,IDP_FLOAT,IDP_DOUBLE,IDP_BOOLEAN,IDP_INT,IDP_STRING};
struct IDProperty{IDProperty *next=nullptr;int type=IDP_GROUP,subtype=0,len=0;char name[64]{};struct {struct{IDProperty *first=nullptr;}group;void *pointer=nullptr;}data;};
#define IDP_IDPArray(prop) (static_cast<IDProperty *>((prop)->data.pointer))
#define LISTBASE_FOREACH(type,var,list) for(type var=(list)->first;var;var=var->next)
const void *retired_group=nullptr;
IDProperty *IDP_GetPropertyFromGroup(const IDProperty *group,const char *name){assert(group!=retired_group&&group->type==IDP_GROUP);for(IDProperty *p=group->data.group.first;p;p=p->next)if(std::strcmp(p->name,name)==0)return p;return nullptr;}
struct WorkSpace{ID id;};struct bToolRef{int space_type=1,mode=0;char idname[64]="builtin.move";IDProperty *properties=nullptr;};
struct wmOperatorType{StructRNA *srna=nullptr;};struct wmGizmoGroupType{StructRNA *srna=nullptr;};
struct wmOperator{wmOperatorType *type=nullptr;PointerRNA *ptr=nullptr;IDProperty *properties=nullptr;};
struct uiBlock;struct PopupRuntime{void *unused=nullptr;struct{uiBlock *first=nullptr;} uiblocks;};
struct PopupRegion{PopupRuntime *runtime=nullptr;};
struct uiPopupBlockHandle{bool ipad_numbers=false;uint64_t ipad_numbers_type=0,ipad_numbers_operator=0,ipad_numbers_ptr=0,ipad_numbers_properties=0,ipad_popup_lifetime=0;ipad_ring::ActionOrigin ipad_action_origin;wmOperator *popup_op=nullptr;PopupRegion *region=nullptr;};
uiPopupBlockHandle *registered_popup=nullptr;
std::map<std::string,wmOperatorType *> operators;std::map<std::string,wmGizmoGroupType *> gizmos;int tool_lookups=0;
struct bContext{bool live=true;Scene *scene=nullptr;Object *object=nullptr;bScreen *screen=nullptr;wmWindowManager *manager=nullptr;Paint *paint=nullptr;WorkSpace *workspace=nullptr;bToolRef *tool=nullptr;Main *main=nullptr;};
Main *CTX_data_main(bContext *C){return C->main;}
Scene *CTX_data_scene(bContext *C){return C->scene;}
Object *CTX_data_active_object(bContext *C){return C->object;}
bScreen *CTX_wm_screen(bContext *C){return C->screen;}
wmWindowManager *CTX_wm_manager(bContext *C){return C->manager;}
WorkSpace *CTX_wm_workspace(bContext *C){return C->workspace;}
bToolRef *WM_toolsystem_ref_from_context(bContext *C){return C->tool;}
wmOperatorType *WM_operatortype_find(const char *name,bool quiet){assert(quiet);auto it=operators.find(name);return it==operators.end()?nullptr:it->second;}
wmGizmoGroupType *WM_gizmogrouptype_find(const char *name,bool quiet){assert(quiet);auto it=gizmos.find(name);return it==gizmos.end()?nullptr:it->second;}
PointerRNA RNA_pointer_create_discrete(ID *id,StructRNA *type,void *data){return {id,type,data,{91}};}
// Initial pending constructors have a separate explicit-owner fixture.
bool ui_ipad_rna_constructor_root(bContext *,const ipad_ring::ActionOrigin &,const uiIPadRNAReceipt &,PointerRNA &){return false;}
struct ConstructorBoundary{void *op=nullptr;uiIPadRNAReceipt binding;};
ConstructorBoundary ui_ipad_numbers_constructor;
bool WM_toolsystem_ref_properties_get_ex(bToolRef *tool,const char *name,StructRNA *type,PointerRNA *ptr){++tool_lookups;auto *group=IDP_GetPropertyFromGroup(tool->properties,tool->idname);auto *subgroup=group?IDP_GetPropertyFromGroup(group,name):nullptr;*ptr=RNA_pointer_create_discrete(nullptr,type,subgroup);return bool(subgroup);}
Paint *BKE_paint_get_active_from_context(bContext *C){return C->paint;}
Brush *BKE_paint_brush(Paint *paint){return paint->brush;}
bool ui_ipad_action_origin_valid(bContext *C,const ipad_ring::ActionOrigin &origin){return !origin.present()||C->live;}
uiPopupBlockHandle *ui_ipad_registered_popup_resolve(bContext *C,const ipad_ring::ActionOrigin &o,uint64_t life){return C->live&&registered_popup&&registered_popup->ipad_popup_lifetime==life&&registered_popup->ipad_action_origin.lifetime==o.lifetime?registered_popup:nullptr;}
int path_captures=0,finds=0,pointer_gets=0,collection_gets=0,lengths=0,ensures=0;int callback=0,collection_index=0;bContext *active_context=nullptr;IDProperty *callback_parent=nullptr;
PointerRNA RNA_id_pointer_create(ID *id){assert(id&&id!=reinterpret_cast<ID *>(1));return {id,id->schema,id,{91}};}
PropertyRNA *RNA_struct_find_property(PointerRNA *ptr,const char *name){
 assert(ptr->data!=reinterpret_cast<void *>(1)&&ptr->type!=reinterpret_cast<StructRNA *>(1));++finds;
 auto it=ptr->type->fields.find(name);return it==ptr->type->fields.end()?nullptr:it->second;
}
int RNA_property_flag(PropertyRNA *prop){return prop->flags;}
PropertyType RNA_property_type(PropertyRNA *prop){return prop->type;}
PointerRNA RNA_property_pointer_get(PointerRNA *ptr,PropertyRNA *prop){++pointer_gets;if(prop->flags&PROP_IDPROPERTY){auto *group=static_cast<IDProperty *>(ptr->data);auto *node=IDP_GetPropertyFromGroup(group,prop->name.c_str());if(!node||node->type!=IDP_GROUP)++ensures;}if(callback==1)active_context->live=false;auto result=prop->target;if(callback==5){callback_parent->data.group.first=nullptr;retired_group=result.data;}result.ancestors={91,92};return result;}
bool RNA_property_collection_lookup_int(PointerRNA *,PropertyRNA *prop,int index,PointerRNA *next){++collection_gets;if(index!=collection_index)return false;*next=prop->target;next->ancestors={91,92};return true;}
std::optional<std::string> RNA_path_from_ID_to_property(const PointerRNA *ptr,PropertyRNA *prop){assert(ptr->data!=reinterpret_cast<void *>(1));++path_captures;return prop->path;}
bool RNA_struct_contains_property(PointerRNA *ptr,PropertyRNA *needle){for(auto &entry:ptr->type->fields)if(entry.second==needle)return true;return false;}
const char *RNA_property_identifier(PropertyRNA *prop){return prop->name.c_str();}
bool RNA_property_array_check(PropertyRNA *prop){return prop->array;}
int RNA_property_array_dimension(const PointerRNA *,PropertyRNA *prop,int *shape){std::copy(prop->shape.begin(),prop->shape.end(),shape);if(callback==2)active_context->live=false;if(callback==4)callback_parent->data.group.first=nullptr;return prop->dim;}
int RNA_property_array_length(PointerRNA *,PropertyRNA *prop){++lengths;if(callback==3)active_context->live=false;return prop->len;}
ipad_ring::ActionOrigin origin(){return ipad_ring::ActionOrigin::capture({1,2,3,4,5,6,7,8,9,0,11,12,13},"builtin.move",7);}
struct Fixture{
 StructRNA root,child;PropertyRNA value{"value","settings.value",0,PROP_FLOAT,true,1,3,{3,0,0},{}};
 int data=17;PropertyRNA settings{"settings","",0,PROP_POINTER,false,0,0,{}, {}};
 Scene scene;Object object;ID object_data;bScreen screen;Brush brush;Paint paint{&brush};UndoStack undo;wmWindowManager manager;
 bContext C{true,&scene,&object,&screen,&manager,&paint};PointerRNA ptr;
 WindowManagerRuntime manager_runtime;Main main;
 Fixture(){root.fields["settings"]=&settings;child.fields["value"]=&value;
  int uid=1;for(ID *id:{&scene.id,&object.id,&object_data,&screen.id,&manager.id,&brush.id}){id->schema=&root;id->session_uid=uid++;main.ids.push_back(id);}
  C.main=&main;
  object.data=&object_data;manager_runtime.undo_stack=&undo;manager.runtime=&manager_runtime;bind(&scene.id);active_context=&C;}
 void bind(ID *id){settings.target={id,&child,&data,{1,2}};ptr=settings.target;ptr.ancestors={1,2};}
};
struct ToolFixture:Fixture{
 WorkSpace workspace;bToolRef tool;IDProperty top,active,subgroup,nested,leaf;wmOperatorType ot;wmGizmoGroupType gt;
 ToolFixture(bool gizmo=false){
  auto name=[](char (&target)[64],std::string_view value){assert(value.size()<64);std::copy(value.begin(),value.end(),target);target[value.size()]='\0';};
  name(active.name,"builtin.move");name(subgroup.name,gizmo?"VIEW3D_GGT_native":"VIEW3D_OT_native");name(nested.name,"settings");name(leaf.name,"value");
  top.data.group.first=&active;active.data.group.first=&subgroup;subgroup.data.group.first=&nested;nested.data.group.first=&leaf;tool.properties=&top;
  leaf.type=IDP_ARRAY;leaf.subtype=IDP_FLOAT;leaf.len=3;
  workspace.id.session_uid=99;main.ids.push_back(&workspace.id);
  C.workspace=&workspace;C.tool=&tool;ot.srna=&root;gt.srna=&root;operators.clear();gizmos.clear();
  if(gizmo)gizmos[subgroup.name]=&gt;else operators[subgroup.name]=&ot;
  value.flags=settings.flags=PROP_IDPROPERTY;settings.target={nullptr,&child,&nested,{1}};ptr=settings.target;ptr.ancestors={1};
 }
};
'''

class PencilRNAOwnerTests(unittest.TestCase):
    def run_source(self,main,apple=True):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(
            ('#define WITH_APPLE_CROSSPLATFORM\n' if apple else '')+
            ring_source().replace('#pragma once','')+RECEIPT+WORLD+FUNCTIONS+main)

    def test_each_fresh_id_root_and_full_pointer_ancestor_replacement(self):
        main=r'''
int main(){Fixture f;
 std::vector<std::pair<uiIPadRNAOwner,ID *>> roots{{uiIPadRNAOwner::Scene,&f.scene.id},{uiIPadRNAOwner::Object,&f.object.id},{uiIPadRNAOwner::ObjectData,&f.object_data},{uiIPadRNAOwner::Screen,&f.screen.id},{uiIPadRNAOwner::WindowManager,&f.manager.id},{uiIPadRNAOwner::Brush,&f.brush.id}};
 for(auto [kind,id]:roots){f.bind(id);uiIPadRNAReceipt receipt;
  assert(ui_ipad_rna_capture(&f.C,origin(),f.ptr,&f.value,2,receipt)&&receipt.owner==kind&&receipt.index==2);
  const int captures=path_captures;PointerRNA old{reinterpret_cast<ID *>(1),reinterpret_cast<StructRNA *>(1),reinterpret_cast<void *>(1),{1,2,3}};PropertyRNA *prop=reinterpret_cast<PropertyRNA *>(1);
  for(int i=0;i<10000;++i){assert(ui_ipad_rna_resolve(&f.C,origin(),receipt,old,prop));assert(old.ancestors==std::vector<int>({91,92})&&old.data==&f.data&&prop==&f.value);}
  assert(path_captures==captures);
 }
 // Unrelated/unowned native UI retains its existing payload and no RNA reads.
 PointerRNA ordinary{nullptr,nullptr,reinterpret_cast<void *>(1),{7}};PropertyRNA *prop=reinterpret_cast<PropertyRNA *>(1);uiIPadRNAReceipt invalid;
 const int reads=finds;assert(ui_ipad_rna_resolve(&f.C,{},invalid,ordinary,prop));assert(ordinary.ancestors==std::vector<int>{7}&&finds==reads);
}
'''
        self.run_source(main)
        self.run_source(main,False)

    def test_uid_reuse_history_excursions_brush_and_storage_replacement_refuse(self):
        self.run_source(r'''
int main(){Fixture f;uiIPadRNAReceipt receipt;assert(ui_ipad_rna_capture(&f.C,origin(),f.ptr,&f.value,0,receipt));
 auto resolve=[&](){PointerRNA old{nullptr,reinterpret_cast<StructRNA *>(1),reinterpret_cast<void *>(1),{1}};PropertyRNA *prop=reinterpret_cast<PropertyRNA *>(1);return ui_ipad_rna_resolve(&f.C,origin(),receipt,old,prop);};
 ++f.scene.id.session_uid;int reads=finds;assert(!resolve()&&finds==reads);--f.scene.id.session_uid;
 f.scene.id.name[0]='X';assert(!resolve());f.scene.id.name[0]='S';
 ++f.undo.ipad_mutation_generation;assert(!resolve());--f.undo.ipad_mutation_generation;
 ++f.undo.ipad_lifetime_id;assert(!resolve());--f.undo.ipad_lifetime_id;
 UndoStack replacement;f.manager.runtime->undo_stack=&replacement;assert(!resolve());f.manager.runtime->undo_stack=&f.undo;
 Scene replacement_scene;f.C.scene=&replacement_scene;assert(!resolve());f.C.scene=&f.scene;
 f.settings.target.data=reinterpret_cast<void *>(1);assert(!resolve());f.settings.target.data=&f.data;
 PropertyRNA replacement_prop=f.value;f.child.fields["value"]=&replacement_prop;assert(!resolve());f.child.fields["value"]=&f.value;
 ++f.value.len;assert(!resolve());--f.value.len;++f.value.shape[0];assert(!resolve());--f.value.shape[0];
 f.C.live=false;assert(!resolve());f.C.live=true;assert(resolve());
 f.bind(&f.brush.id);assert(ui_ipad_rna_capture(&f.C,origin(),f.ptr,&f.value,0,receipt));
 Brush other;f.paint.brush=&other;assert(!resolve());f.paint.brush=&f.brush;assert(resolve());
 f.C.paint=nullptr;assert(!resolve());
}
''')

    def test_runtime_idproperty_or_callback_loss_refuses_before_ensuring_or_next_read(self):
        self.run_source(r'''
int main(){Fixture f;uiIPadRNAReceipt receipt;assert(ui_ipad_rna_capture(&f.C,origin(),f.ptr,&f.value,0,receipt));
 auto resolve=[&](){PointerRNA old;PropertyRNA *prop=nullptr;return ui_ipad_rna_resolve(&f.C,origin(),receipt,old,prop);};
 f.settings.flags=PROP_IDPROPERTY;int gets=pointer_gets;assert(!resolve()&&pointer_gets==gets&&ensures==0);f.settings.flags=0;
 f.value.flags=PROP_IDPROPERTY;assert(!resolve()&&ensures==0);f.value.flags=0;
 callback=1;assert(!resolve());callback=0;f.C.live=true;
 callback=2;int reads=lengths;assert(!resolve()&&lengths==reads);callback=0;f.C.live=true;
 callback=3;assert(!resolve());callback=0;f.C.live=true;
 assert(resolve());
 // Missing native property and malformed/unbounded paths do not mutate storage.
 f.child.fields.erase("value");assert(!resolve()&&ensures==0);f.child.fields["value"]=&f.value;
 for(std::string path:std::vector<std::string>{"settings[\"named\"].value","settings[-1].value","settings[2147483648].value","settings..value","settings.",std::string(1025,'x')}){
  f.value.path=path;assert(!ui_ipad_rna_capture(&f.C,origin(),f.ptr,&f.value,0,receipt));
 }
 std::vector<uiIPadRNAPathStep> steps;assert(ui_ipad_rna_static_path("slots[0].type",steps)&&steps.size()==2&&steps[0].index==0);
 assert(!ui_ipad_rna_static_path(std::string_view("bad\0field",9),steps));
 f.value.path="settings.value";assert(!ui_ipad_rna_capture(&f.C,origin(),f.ptr,&f.value,3,receipt));
}
''')

    def test_native_operator_and_gizmo_subgroups_are_find_only_and_context_specific(self):
        self.run_source(r'''
int main(){
 for(bool gizmo:{false,true}){
  ToolFixture f(gizmo);uiIPadRNAReceipt receipt;
  assert(ui_ipad_rna_capture(&f.C,origin(),f.ptr,&f.value,1,receipt));
  assert(receipt.owner==(gizmo?uiIPadRNAOwner::ToolGizmo:uiIPadRNAOwner::ToolOperator));
  assert(receipt.steps.size()==2&&receipt.steps[0].backend_address==uint64_t(reinterpret_cast<uintptr_t>(&f.nested)));
  const int captures=path_captures;
  auto resolve=[&](){PointerRNA old{nullptr,reinterpret_cast<StructRNA *>(1),reinterpret_cast<void *>(1),{1}};PropertyRNA *prop=reinterpret_cast<PropertyRNA *>(1);
   bool valid=ui_ipad_rna_resolve(&f.C,origin(),receipt,old,prop);if(valid)assert(old.data==&f.nested&&old.ancestors==std::vector<int>({91,92}));return valid;};
  for(int i=0;i<10000;++i)assert(resolve());assert(path_captures==captures&&ensures==0);
  ++f.tool.mode;assert(!resolve());--f.tool.mode;++f.tool.space_type;assert(!resolve());--f.tool.space_type;
  f.tool.idname[0]='x';assert(!resolve());f.tool.idname[0]='b';
  ++f.workspace.id.session_uid;assert(!resolve());--f.workspace.id.session_uid;
  bToolRef other_tool=f.tool;f.C.tool=&other_tool;assert(!resolve());f.C.tool=&f.tool;
  f.top.type=IDP_ARRAY;int lookups=tool_lookups;assert(!resolve()&&tool_lookups==lookups);f.top.type=IDP_GROUP;
  f.active.type=IDP_ARRAY;assert(!resolve());f.active.type=IDP_GROUP;
  f.subgroup.type=IDP_ARRAY;assert(!resolve());f.subgroup.type=IDP_GROUP;
  f.nested.type=IDP_ARRAY;int gets=pointer_gets;assert(!resolve()&&pointer_gets==gets);f.nested.type=IDP_GROUP;
  f.subgroup.data.group.first=nullptr;assert(!resolve()&&pointer_gets==gets);f.subgroup.data.group.first=&f.nested;
  StructRNA other_type;f.ot.srna=f.gt.srna=&other_type;assert(!resolve());f.ot.srna=f.gt.srna=&f.root;
  f.leaf.type=IDP_STRING;assert(!resolve()&&ensures==0);f.leaf.type=IDP_ARRAY;
  f.leaf.subtype=IDP_BOOLEAN;assert(!resolve());f.leaf.subtype=IDP_FLOAT;
  ++f.leaf.len;assert(!resolve());--f.leaf.len;assert(resolve());
  // A shape callback can remove nested storage without changing canvas/IDs.
  callback_parent=&f.subgroup;callback=4;assert(!resolve()&&ensures==0);callback=0;f.subgroup.data.group.first=&f.nested;
  // Pointer traversal can retire its returned nested group while the Main,
  // Workspace, ToolRef and registered subgroup remain completely unchanged.
  callback=5;assert(!resolve()&&ensures==0);callback=0;retired_group=nullptr;f.subgroup.data.group.first=&f.nested;
  assert(resolve());
 }
}
''')

    def test_removed_main_owner_refuses_before_candidate_dereference(self):
        self.run_source(r'''
int main(){Fixture f;uiIPadRNAReceipt receipt;
 assert(ui_ipad_rna_capture(&f.C,origin(),f.ptr,&f.value,0,receipt));
 PointerRNA old;PropertyRNA *prop=nullptr;
 f.main.ids.erase(f.main.ids.begin());int reads=finds;
 assert(!ui_ipad_rna_resolve(&f.C,origin(),receipt,old,prop)&&finds==reads);
 assert(!ui_ipad_rna_capture(&f.C,origin(),f.ptr,&f.value,0,receipt));
 // Even a poisoned context candidate must only be compared with Main lists.
 f.C.scene=reinterpret_cast<Scene *>(1);f.ptr.owner_id=reinterpret_cast<ID *>(1);
 assert(!ui_ipad_rna_capture(&f.C,origin(),f.ptr,&f.value,0,receipt));
 f.C.object=reinterpret_cast<Object *>(1);f.ptr.owner_id=reinterpret_cast<ID *>(2);
 assert(!ui_ipad_rna_capture(&f.C,origin(),f.ptr,&f.value,0,receipt));
 f.C.main=nullptr;assert(!ui_ipad_rna_capture(&f.C,origin(),f.ptr,&f.value,0,receipt));
}
''')

    def test_frozen_context_tool_rebinds_and_unproved_pointer_entries_refuse(self):
        self.run_source(r'''
int main(){ToolFixture f;PointerRNA tool{&f.workspace.id,&RNA_WorkSpaceTool,&f.tool,{1,2,3}};
 bContextStore store{{{"label",std::string("native")},{"index",int64_t(7)},{"tool",tool}}};
 assert(ui_ipad_context_store_rebind(&f.C,origin(),store));
 auto &fresh=std::get<PointerRNA>(store.entries[2].value);
 assert(fresh.ancestors==std::vector<int>{91}&&fresh.owner_id==&f.workspace.id&&fresh.data==&f.tool);
 store.entries.push_back({"edit_object",PointerRNA{reinterpret_cast<ID *>(1),reinterpret_cast<StructRNA *>(1),reinterpret_cast<void *>(1),{}}});
 assert(!ui_ipad_context_store_rebind(&f.C,origin(),store));
 // Hardware/unowned native dialogs keep their existing context semantics.
 assert(ui_ipad_context_store_rebind(&f.C,{},store));store.entries.pop_back();
 bToolRef replacement=f.tool;f.C.tool=&replacement;assert(!ui_ipad_context_store_rebind(&f.C,origin(),store));f.C.tool=&f.tool;
 auto &current=std::get<PointerRNA>(store.entries[2].value);
 current.type=reinterpret_cast<StructRNA *>(1);assert(!ui_ipad_context_store_rebind(&f.C,origin(),store));current.type=&RNA_WorkSpaceTool;
 f.main.ids.pop_back();assert(!ui_ipad_context_store_rebind(&f.C,origin(),store));f.main.ids.push_back(&f.workspace.id);
 f.C.live=false;assert(!ui_ipad_context_store_rebind(&f.C,origin(),store));
}
''')

    def test_nested_native_idproperty_array_and_default_materialization(self):
        self.run_source(r'''
int main(){ToolFixture f;IDProperty items[2];IDProperty array;array.type=IDP_IDPARRAY;array.len=2;array.data.pointer=items;
 std::copy_n("settings",9,array.name);items[1].data.group.first=&f.leaf;f.subgroup.data.group.first=&array;
 collection_index=1;f.settings.type=PROP_COLLECTION;f.settings.target.data=&items[1];f.ptr=f.settings.target;
 uiIPadRNAReceipt receipt;assert(ui_ipad_rna_capture(&f.C,origin(),f.ptr,&f.value,-1,receipt));
 assert(receipt.steps[0].index==1&&receipt.steps[0].backend_length==2);
 auto resolve=[&](){PointerRNA ptr;PropertyRNA *prop=nullptr;return ui_ipad_rna_resolve(&f.C,origin(),receipt,ptr,prop);};
 assert(resolve());array.len=1;int gets=collection_gets;assert(!resolve()&&collection_gets==gets);array.len=2;
 items[1].type=IDP_ARRAY;assert(!resolve()&&collection_gets==gets);items[1].type=IDP_GROUP;
 array.data.pointer=nullptr;assert(!resolve());array.data.pointer=items;assert(resolve());
 // A native unset scalar uses its declared default. Its first legitimate
 // write may create compatible storage without changing the owning group.
 ToolFixture defaults;defaults.value.array=false;defaults.value.dim=0;defaults.value.len=0;defaults.value.shape={};
 defaults.nested.data.group.first=nullptr;assert(ui_ipad_rna_capture(&defaults.C,origin(),defaults.ptr,&defaults.value,0,receipt));
 PointerRNA ptr;PropertyRNA *prop=nullptr;assert(ui_ipad_rna_resolve(&defaults.C,origin(),receipt,ptr,prop));
 defaults.leaf.type=IDP_DOUBLE;defaults.leaf.subtype=0;defaults.leaf.len=0;defaults.nested.data.group.first=&defaults.leaf;
 assert(ui_ipad_rna_resolve(&defaults.C,origin(),receipt,ptr,prop));
 defaults.leaf.type=IDP_STRING;assert(!ui_ipad_rna_resolve(&defaults.C,origin(),receipt,ptr,prop)&&ensures==0);
 // A pending operator is not a ToolRef group just because its owner_id is null.
 defaults.ptr.data=reinterpret_cast<void *>(1);assert(!ui_ipad_rna_capture(&defaults.C,origin(),defaults.ptr,&defaults.value,0,receipt));
}
''')

if __name__=='__main__':unittest.main()
