"""Compile shipped Undo receipts/recovery with adversarial callback/lifetime models."""
import re
import unittest
from test_touch_extrude import changed_source
import test_ipad_panels

def receipt_source():
    return changed_source('source/blender/blenkernel/BKE_undo_touch.hh').split('#ifdef WITH_APPLE_CROSSPLATFORM',1)[1].split('#endif',1)[0]

CORE = r'''
#define WITH_APPLE_CROSSPLATFORM
#include <cassert>
#include <cstdint>
#include <cstring>
#include <initializer_list>
#include <unordered_map>
inline const int mesh_type=0, memfile_type=1;
inline const void *BKE_UNDOSYS_TYPE_MESH=&mesh_type,*BKE_UNDOSYS_TYPE_MEMFILE=&memfile_type;
struct UndoStep { UndoStep *next=nullptr; uint64_t ipad_lifetime_id=0; bool skip=false;
  UndoStep *prev=nullptr; const void *type=BKE_UNDOSYS_TYPE_MESH; };
struct UndoStack { UndoStep *step_active=nullptr, *step_init=nullptr;
  uint64_t ipad_lifetime_id=1, ipad_mutation_generation=0; int group_level=0; UndoStep *step_active_memfile=nullptr; };
'''

class TouchUndoRecoveryTests(unittest.TestCase):
    def run_cpp(self, code):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(code)

    def test_redo_gizmo_replacement_and_binding_reuse(self):
        import test_fine_drag_lifecycle
        source=changed_source('source/blender/windowmanager/gizmo/intern/wm_gizmo_group.cc')
        helper=test_fine_drag_lifecycle.block(source,'static wmGizmo *touch_extrude_live_gizmo(')
        identities=changed_source('source/blender/windowmanager/gizmo/intern/wm_gizmo.cc')
        allocator=test_fine_drag_lifecycle.block(identities,'static uint64_t wm_gizmo_touch_lifetime_id()')
        self.run_cpp(r'''
#include <cassert>
#include <cstdint>
#include <cstring>
#include <set>
#define BLI_assert assert
#define STREQ(a,b) (std::strcmp(a,b)==0)
#define LISTBASE_FOREACH(type,var,list) for(type var=(list)->first; var; var=var->next)
struct wmOperatorType { const char *idname="MESH_OT_extrude_context_move"; };
struct wmGizmoOpElem { wmOperatorType *type=nullptr; uint64_t ipad_binding_id=0; bool is_redo=true; };
struct wmGizmo { wmGizmo *next=nullptr; uint64_t ipad_lifetime_id=0; int highlight_part=0; wmGizmoOpElem binding; };
struct Gizmos { wmGizmo *first=nullptr; };
struct wmGizmoGroup { wmGizmoGroup *next=nullptr; bool tag_remove=false; Gizmos gizmos; };
struct Groups { wmGizmoGroup *first=nullptr; };
struct wmGizmoMap { Groups groups; };
struct Runtime { wmGizmoMap *gizmo_map=nullptr; };
struct ARegion { Runtime *runtime=nullptr; };
struct bContext { ARegion *region=nullptr; };
ARegion *CTX_wm_region(bContext *C){return C->region;}
wmGizmoOpElem *WM_gizmo_operator_get(wmGizmo *gz,int part){return part==0 ? &gz->binding : nullptr;}
__ALLOCATOR__
__HELPER__
int main(){
  wmOperatorType type; wmGizmo gz;
  gz.ipad_lifetime_id=wm_gizmo_touch_lifetime_id();
  gz.binding={&type,wm_gizmo_touch_lifetime_id(),true};
  const uint64_t id=gz.ipad_lifetime_id,binding_id=gz.binding.ipad_binding_id;
  wmGizmoGroup group{nullptr,false,{&gz}}; wmGizmoMap map{{&group}};
  Runtime runtime{&map}; ARegion region{&runtime}; bContext C{&region}; wmGizmoOpElem *binding=nullptr;
  assert(touch_extrude_live_gizmo(&C,&map,id,0,binding_id,&binding)==&gz && binding==&gz.binding);
  gz.binding.ipad_binding_id=wm_gizmo_touch_lifetime_id();
  assert(!touch_extrude_live_gizmo(&C,&map,id,0,binding_id,&binding));
  gz.binding.ipad_binding_id=binding_id; gz.ipad_lifetime_id=wm_gizmo_touch_lifetime_id();
  assert(!touch_extrude_live_gizmo(&C,&map,id,0,binding_id,&binding));
  gz.ipad_lifetime_id=id; group.tag_remove=true;
  assert(!touch_extrude_live_gizmo(&C,&map,id,0,binding_id,&binding)); group.tag_remove=false;
  group.gizmos.first=nullptr; assert(!touch_extrude_live_gizmo(&C,&map,id,0,binding_id,&binding));
  group.gizmos.first=&gz; runtime.gizmo_map=nullptr;
  assert(!touch_extrude_live_gizmo(&C,&map,id,0,binding_id,&binding));
  std::set<uint64_t> unique;
  for(int i=0;i<10000;++i){assert(unique.insert(wm_gizmo_touch_lifetime_id()).second);}
}
'''.replace('__ALLOCATOR__',allocator).replace('__HELPER__',helper))

    def test_rejected_claim_never_starts_snapshot_or_child(self):
        import test_fine_drag_lifecycle
        source=changed_source('source/blender/windowmanager/intern/wm_operator_type.cc')
        invoke=test_fine_drag_lifecycle.block(source,'static wmOperatorStatus wm_macro_invoke(')
        self.run_cpp(r'''
#define WITH_APPLE_CROSSPLATFORM
#include <cassert>
#include <cstring>
#define STREQ(a,b) (std::strcmp(a,b)==0)
using wmOperatorStatus=int;
constexpr int OPERATOR_CANCELLED=2,OPERATOR_FINISHED=1,WM_EVENT_IS_DIRECT_TOOL=1;
namespace blender::bke { enum class TouchUndoClaim {None,Claimed,Rejected}; struct TouchUndoRecovery{}; }
struct MacroData { void *touch_extrude=nullptr; blender::bke::TouchUndoRecovery touch_recovery; };
struct wmOperatorType { const char *idname="MESH_OT_extrude_context_move"; };
struct bContext {};
struct wmEvent { int flag=WM_EVENT_IS_DIRECT_TOOL; };
struct wmOperator { void *customdata=nullptr; wmOperatorType *type=nullptr; void *reports=nullptr;
  struct { void *first=nullptr; } macro; };
int children=0,snapshots=0; bool reject_snapshot=false;
auto claim=blender::bke::TouchUndoClaim::None;
void wm_macro_start(wmOperator *op){op->customdata=new MacroData{};}
wmOperatorStatus wm_macro_end(bContext *,wmOperator *op,int status){delete static_cast<MacroData *>(op->customdata); op->customdata=nullptr; return status;}
blender::bke::TouchUndoClaim ED_undo_touch_claim(bContext *,const wmEvent *,blender::bke::TouchUndoRecovery &){return claim;}
void *EDBM_touch_extrude_begin(bContext *,void *){++snapshots; return reject_snapshot ? nullptr : &snapshots;}
wmOperatorStatus wm_macro_invoke_internal(bContext *C,wmOperator *op,const wmEvent *,wmOperator *){++children; return wm_macro_end(C,op,OPERATOR_FINISHED);}
__INVOKE__
int main(){
  bContext C; wmOperatorType type; wmOperator op; op.type=&type; wmEvent event;
  claim=blender::bke::TouchUndoClaim::Rejected;
  assert(wm_macro_invoke(&C,&op,&event)==OPERATOR_CANCELLED && !snapshots && !children);
  claim=blender::bke::TouchUndoClaim::Claimed; reject_snapshot=true;
  assert(wm_macro_invoke(&C,&op,&event)==OPERATOR_CANCELLED && snapshots==1 && !children);
  claim=blender::bke::TouchUndoClaim::None; reject_snapshot=false;
  assert(wm_macro_invoke(&C,&op,&event)==OPERATOR_FINISHED && snapshots==2 && children==1);
  event.flag=0; claim=blender::bke::TouchUndoClaim::Rejected;
  assert(wm_macro_invoke(&C,&op,&event)==OPERATOR_FINISHED && snapshots==2 && children==2);
}
'''.replace('__INVOKE__',invoke))

    def test_exact_visible_target_generation_and_owner(self):
        self.run_cpp(CORE + receipt_source() + r'''
int main() {
  UndoStep accepted{nullptr,4,false}, hidden2{&accepted,3,true}, hidden1{&hidden2,2,true}, baseline{&hidden1,1,false};
  UndoStack stack; stack.step_active=&accepted;
  UndoTouchReceipt receipt;
  assert(BKE_undosys_touch_capture(&stack,receipt));
  stack.step_active=&baseline; ++stack.ipad_mutation_generation;
  assert(BKE_undosys_touch_seal(&stack,receipt));
  assert(BKE_undosys_touch_validate(&stack,receipt));
  // Hidden Mesh/MemFile steps lead to the first visible accepted target.
  hidden2.skip=false; assert(!BKE_undosys_touch_validate(&stack,receipt)); hidden2.skip=true;
  accepted.skip=true; assert(!BKE_undosys_touch_validate(&stack,receipt)); accepted.skip=false;
  UndoStep replacement{nullptr,5,false}; hidden2.next=&replacement;
  assert(!BKE_undosys_touch_validate(&stack,receipt)); hidden2.next=&accepted;
  ++stack.ipad_mutation_generation; // Undo+Redo excursion, same active/links/IDs.
  assert(!BKE_undosys_touch_validate(&stack,receipt));
  --stack.ipad_mutation_generation;
  stack.step_init=&replacement; assert(!BKE_undosys_touch_validate(&stack,receipt)); stack.step_init=nullptr;
  stack.group_level=1; assert(!BKE_undosys_touch_validate(&stack,receipt)); stack.group_level=0;
  stack.ipad_lifetime_id=7; assert(!BKE_undosys_touch_validate(&stack,receipt));
  assert(!BKE_undosys_touch_validate(nullptr,receipt));
}
''')

    def test_mutation_hooks_precede_all_callbacks_and_changes(self):
        source = changed_source('source/blender/blenkernel/intern/undo_system.cc')
        for name in ('BKE_undosys_stack_clear','BKE_undosys_stack_clear_active',
                     'BKE_undosys_stack_limit_steps_and_memory','BKE_undosys_step_push_init_with_type',
                     'BKE_undosys_step_push_with_type','BKE_undosys_step_load_data_ex',
                     'BKE_undosys_stack_group_begin','BKE_undosys_stack_group_end'):
            with self.subTest(name=name):
                match = re.search(r'\b'+name+r'\([^;]*?\)\n\{\n#ifdef WITH_APPLE_CROSSPLATFORM\n  undosys_touch_mutation\(ustack\);',source)
                self.assertIsNotNone(match)
        self.assertEqual(source.count('  undosys_touch_mutation(ustack);'),8)
        boundary = changed_source('source/blender/windowmanager/intern/wm_event_system.cc')
        pos = boundary.index('if (ED_undo_touch_recover(C))')
        self.assertIn('wm_event_free_last_handled(win, event);',boundary[max(0,pos-400):pos])
        self.assertRegex(boundary[pos:pos+100],r'GPU_render_end\(\);\s+return;')

    def test_callbacks_and_pending_invoke_ownership(self):
        runtime = changed_source('source/blender/blenkernel/BKE_wm_runtime.hh')
        values = runtime.split('enum class TouchUndoPhase',1)[1].split('#endif',1)[0]
        values = 'enum class TouchUndoPhase'+values
        editor = changed_source('source/blender/editors/undo/ed_undo.cc')
        implementation = editor.split('using blender::bke::TouchUndoPhase;',1)[1].split('#endif',1)[0]
        implementation = 'using blender::bke::TouchUndoPhase;'+implementation
        operator_source = changed_source('source/blender/windowmanager/intern/wm.cc')
        operator_identities = operator_source.split('static std::unordered_map<const wmOperator *, uint64_t> touch_operator_identities;',1)[1].split('#endif',1)[0]
        operator_identities = 'static std::unordered_map<const wmOperator *, uint64_t> touch_operator_identities;' + operator_identities
        operator_identities = '#define BLI_assert assert\n' + operator_identities
        self.run_cpp(CORE + receipt_source() + r'''
namespace blender::bke { __VALUES__ }
struct ID { uint32_t session_uid=0; };
struct Object { ID id; void *data=nullptr; };
struct ViewLayer {};
struct bToolRef { const char *idname="builtin.extrude_region"; };
struct ARegion { ARegion *next=nullptr; int regiontype=1; };
struct RegionList { ARegion *first=nullptr; };
struct ScrArea { ScrArea *next=nullptr; int spacetype=1; RegionList regionbase; };
struct AreaList { ScrArea *first=nullptr; };
struct bScreen { ID id; AreaList areabase; };
struct Scene { ID id; };
struct wmWindow { wmWindow *next=nullptr; int winid=1; Scene *scene=nullptr; bScreen *screen=nullptr; ViewLayer *layer=nullptr; };
struct WindowList { wmWindow *first=nullptr; };
struct wmOperatorType { const char *idname="MESH_OT_extrude_context_move"; };
struct wmOperator { wmOperator *next=nullptr; wmOperatorType *type=nullptr; };
struct OperatorList { wmOperator *first=nullptr; };
struct Runtime { OperatorList operators; UndoStack *undo_stack=nullptr; blender::bke::TouchUndoRecovery touch_undo_recovery; };
struct wmWindowManager { wmWindowManager *next=nullptr; ID id; WindowList windows; Runtime *runtime=nullptr; int op_undo_depth=0; };
struct ManagerList { wmWindowManager *first=nullptr; };
struct Main { ManagerList wm; void *lock=nullptr; };
struct wmEvent {};
struct bContext { Main *main=nullptr; wmWindowManager *wm=nullptr; wmWindow *win=nullptr;
  ScrArea *area=nullptr; ARegion *region=nullptr; Object *object=nullptr; bToolRef *tool=nullptr; bool edit=true; };
constexpr int SPACE_VIEW3D=1,RGN_TYPE_WINDOW=1,WM_JOB_TYPE_ANY=1,RPT_WARNING=1,G_DEBUG_IO=1;
constexpr int BKE_CB_EVT_REDO_PRE=1,BKE_CB_EVT_REDO_POST=2,BKE_CB_EVT_UNDO_PRE=3,BKE_CB_EVT_UNDO_POST=4,NC_WINDOW=1,NC_WM=2,ND_UNDO=4;
struct { int debug=0; } G;
#define LISTBASE_FOREACH(type,var,list) for(type var=(list)->first; var; var=var->next)
#define STREQ(a,b) (std::strcmp(a,b)==0)
Main *CTX_data_main(bContext *C){return C->main;}
wmWindowManager *CTX_wm_manager(bContext *C){return C->wm;}
wmWindow *CTX_wm_window(bContext *C){return C->win;}
Scene *CTX_data_scene(bContext *C){return C->win ? C->win->scene : nullptr;}
bScreen *CTX_wm_screen(bContext *C){return C->win->screen;}
ScrArea *CTX_wm_area(bContext *C){return C->area;}
ARegion *CTX_wm_region(bContext *C){return C->region;}
void CTX_wm_window_set(bContext *C,wmWindow *v){C->win=v;}
void CTX_wm_area_set(bContext *C,ScrArea *v){C->area=v;}
void CTX_wm_region_set(bContext *C,ARegion *v){C->region=v;}
bScreen *WM_window_get_active_screen(wmWindow *win){return win->screen;}
ViewLayer *WM_window_get_active_view_layer(wmWindow *win){return win->layer;}
ViewLayer *CTX_data_view_layer(bContext *C){return C->win->layer;}
Object *CTX_data_edit_object(bContext *C){return C->object;}
const bToolRef *WM_toolsystem_ref_from_context(bContext *C){return C->tool;}
bool ED_operator_editmesh(bContext *C){return C->edit;}
__OPERATOR_IDENTITIES__
wmOperator *WM_operator_last_redo(bContext *C){return C->wm->runtime->operators.first;}
int BLI_findindex(OperatorList *list,wmOperator *op){return list->first==op ? 0 : -1;}
bool mesh_context=true;
bool EDBM_touch_undo_context_matches(bContext *,const UndoStep *){return mesh_context;}
bool other_modal=false;
bool WM_event_touch_undo_safe(const wmWindow *){return !other_modal;}
int jobs=0, reports=0, redos=0, pops=0, pre=0, post=0, undo_pre=0, undo_post=0, active_refreshes=0, callback_mode=0;
bContext *callback_context=nullptr;
int WM_jobs_test(wmWindowManager *,Scene *,int){return jobs;}
void WM_jobs_kill_all(wmWindowManager *){jobs=0;}
void BLO_main_validate_libraries(Main *,void *){}
void WM_global_report(int,const char *){++reports;}
void BKE_callback_exec_id(Main *main,ID *,int kind){
  auto *C=callback_context;
  if(kind==BKE_CB_EVT_UNDO_PRE){
    ++undo_pre;
    if(callback_mode==7){++C->wm->runtime->undo_stack->ipad_mutation_generation;}
  }else if(kind==BKE_CB_EVT_UNDO_POST){++undo_post;}
  else if(kind==BKE_CB_EVT_REDO_PRE){
    ++pre;
    if(callback_mode==1){++C->wm->runtime->undo_stack->ipad_mutation_generation;}
    if(callback_mode==2){C->tool->idname="builtin.move";}
    if(callback_mode==3){main->wm.first=nullptr;}
    if(callback_mode==8){mesh_context=false;}
    if(callback_mode==5){
      auto *op=C->wm->runtime->operators.first;
      touch_operator_identities.erase(op); WM_operator_touch_lifetime_id(op);
    }
  }else{
    ++post;
    if(callback_mode==4){C->win->screen->areabase.first=nullptr;}
    if(callback_mode==6){++C->wm->runtime->undo_stack->ipad_mutation_generation;}
  }
}
bool BKE_undosys_step_load_data_ex(UndoStack *stack,bContext *,UndoStep *target,UndoStep *,bool use_skip){
  assert(use_skip); ++pops; ++stack->ipad_mutation_generation;
  while(target && target->skip){target=target->prev;} stack->step_active=target; return target!=nullptr;
}
bool BKE_undosys_step_redo(UndoStack *stack,bContext *){
  ++redos; ++stack->ipad_mutation_generation;
  UndoStep *target=stack->step_active->next; while(target&&target->skip){target=target->next;}
  stack->step_active=target; return target!=nullptr;
}
void WM_event_add_notifier(bContext *,int,void *){}
void WM_toolsystem_refresh_active(bContext *C){assert(C->area && C->region); ++active_refreshes;}
void WM_toolsystem_refresh_screen_all(Main *){}
namespace blender::ed::asset::list { void storage_tag_main_data_dirty(){} }
__IMPLEMENTATION__
int main(){
  UndoStep accepted{nullptr,9,false}, hidden{&accepted,8,true}, baseline{&hidden,7,false};
  accepted.prev=&hidden; hidden.prev=&baseline;
  UndoStack stack; Runtime runtime; runtime.undo_stack=&stack;
  wmOperatorType op_type; wmOperator accepted_op{nullptr,&op_type}; runtime.operators.first=&accepted_op;
  ARegion region; ScrArea area{nullptr,1,{&region}}; bScreen screen{{30},{&area}};
  Scene scene{{20}}; ViewLayer layer; wmWindow win{nullptr,1,&scene,&screen,&layer};
  wmWindowManager wm{nullptr,{10},{&win},&runtime}; Main main{{&wm}};
  ID mesh{50}; Object object{{40},&mesh}; bToolRef tool; wmEvent event, other_event;
  bContext C{&main,&wm,&win,&area,&region,&object,&tool}; callback_context=&C;
  auto prepare=[&](){
    main.wm.first=&wm; screen.areabase.first=&area; C.area=&area; C.region=&region;
    C.edit=true; tool.idname="builtin.extrude_region"; runtime.touch_undo_recovery={};
    other_modal=false; mesh_context=true; runtime.operators.first=&accepted_op;
    stack.step_active=&accepted; wm.op_undo_depth=0; callback_mode=0;
    assert(ED_undo_touch_begin(&C,&event));
    assert(ED_undo_touch_pop(&C) && stack.step_active==&baseline);
    assert(ED_undo_touch_seal(&C));
  };
  prepare(); blender::bke::TouchUndoRecovery owned;
  assert(ED_undo_touch_claim(&C,&event,owned)==blender::bke::TouchUndoClaim::Claimed);
  assert(runtime.touch_undo_recovery.phase==blender::bke::TouchUndoPhase::Empty);
  assert(!ED_undo_touch_recover(&C)); // Running child owns it, no premature native decode.
  ED_undo_touch_finish(&C,owned,true);
  assert(ED_undo_touch_recover(&C) && redos==1 && pre==1 && post==1 && wm.op_undo_depth==0);
  assert(stack.step_active==&accepted && !ED_undo_touch_recover(&C));
  prepare(); assert(ED_undo_touch_claim(&C,&other_event,owned)==blender::bke::TouchUndoClaim::Rejected);
  ED_undo_touch_finalize_invoke(&C); assert(ED_undo_touch_recover(&C) && redos==2);
  for(int mode:{1,2,3,4,5,6,8}){
    prepare(); ED_undo_touch_finalize_invoke(&C); callback_mode=mode;
    const int before=redos, refreshed=active_refreshes;
    assert(ED_undo_touch_recover(&C));
    assert(redos==before+(mode==4 || mode==6)); // PRE history/tool/owner changes never decode.
    if(mode==4){assert(!C.area && !C.region && active_refreshes==refreshed);}
    if(mode!=3){assert(wm.op_undo_depth==0);}
  }
  prepare(); C.edit=false; ED_undo_touch_finalize_invoke(&C);
  const int before=redos; assert(ED_undo_touch_recover(&C) && redos==before);
  prepare(); ED_undo_touch_claim(&C,&event,owned); ED_undo_touch_finish(&C,owned,false);
  assert(!ED_undo_touch_recover(&C)); // Accepted adjustment discards receipt.
  prepare(); ED_undo_touch_finalize_invoke(&C); other_modal=true;
  const int modal_before=redos; assert(ED_undo_touch_recover(&C) && redos==modal_before);
  prepare(); runtime.touch_undo_recovery={}; stack.step_active=&accepted;
  other_modal=true; assert(!ED_undo_touch_begin(&C,&event) && stack.step_active==&accepted);
  other_modal=false; mesh_context=false;
  assert(!ED_undo_touch_begin(&C,&event) && stack.step_active==&accepted);
  mesh_context=true;
  // Mesh decode's implicit MemFile is checked before any Undo pop.
  UndoStep memfile; memfile.type=BKE_UNDOSYS_TYPE_MEMFILE; baseline.prev=&memfile;
  assert(!ED_undo_touch_begin(&C,&event) && stack.step_active==&accepted);
  stack.step_active_memfile=&memfile; assert(ED_undo_touch_begin(&C,&event));
  callback_mode=7; const int pop_before=pops;
  assert(!ED_undo_touch_pop(&C) && pops==pop_before && stack.step_active==&accepted);
  assert(undo_pre==undo_post && wm.op_undo_depth==0);
  assert(reports>=5);
}
'''.replace('__VALUES__',values).replace('__IMPLEMENTATION__',implementation).replace('__OPERATOR_IDENTITIES__', operator_identities))

    def test_native_mesh_undo_refs_resolve_live_scene_owner_and_data(self):
        import test_fine_drag_lifecycle
        source=changed_source('source/blender/editors/mesh/editmesh_undo.cc')
        helper=test_fine_drag_lifecycle.block(source,'bool EDBM_touch_undo_context_matches(')
        self.run_cpp(r'''
#include <cassert>
#include <cstdint>
#include <cstring>
struct ID { uint32_t session_uid=0; const char *name=""; };
struct Mesh { ID id; };
struct Scene { ID id; };
struct Object { ID id; void *data=nullptr; int type=1; };
constexpr int OB_MESH=1; using uint=unsigned;
struct ViewLayer {};
struct UndoRefID_Scene { Scene *ptr=nullptr; char name[64]=""; char library_filepath_abs[64]=""; };
struct UndoRefID_Object { Object *ptr=nullptr; char name[64]=""; char library_filepath_abs[64]=""; };
struct UndoMesh { Mesh *mesh=nullptr; };
struct MeshUndoStep_Elem { UndoRefID_Object obedit_ref; UndoMesh data; };
void mesh_undosys_step_decode(){}
struct UndoType { void (*step_decode)(); };
inline const UndoType mesh_type{mesh_undosys_step_decode};
struct UndoStep { const UndoType *type=&mesh_type; };
struct MeshUndoStep { UndoStep step; UndoRefID_Scene scene_ref; MeshUndoStep_Elem *elems=nullptr; unsigned elems_len=0; };
struct Main { Scene *scene=nullptr; Object *object=nullptr; Object *second=nullptr; };
struct bContext { Main *main=nullptr; Scene *scene=nullptr; Object *object=nullptr; };
Main *CTX_data_main(bContext *C){return C->main;}
Scene *CTX_data_scene(bContext *C){return C->scene;}
Object *CTX_data_edit_object(bContext *C){return C->object;}
ViewLayer view_layer;
ViewLayer *CTX_data_view_layer(bContext *){return &view_layer;}
void BKE_view_layer_synced_ensure(Scene *,ViewLayer *){}
bool BKE_view_layer_base_find(ViewLayer *,Object *){return true;}
#define GS(name) ((name)[0])
ID *BKE_libblock_find_name_and_library_filepath(Main *main,int type,const char *name,const char *library){
  if(library){return nullptr;}
  if(type=='S' && !std::strcmp(name,main->scene->id.name+2)){return &main->scene->id;}
  if(type=='O' && !std::strcmp(name,main->object->id.name+2)){return &main->object->id;}
  if(type=='O' && main->second && !std::strcmp(name,main->second->id.name+2)){return &main->second->id;}
  return nullptr;
}
__HELPER__
int main(){
  Mesh mesh{{7,"MEMesh"}}, stored{{7,""}}; Scene scene{{2,"SCScene"}};
  Object object{{3,"OBObject"},&mesh}; Main main{&scene,&object}; bContext C{&main,&scene,&object};
  MeshUndoStep_Elem elem; elem.data.mesh=&stored; std::memcpy(elem.obedit_ref.name,"OBObject",sizeof("OBObject"));
  elem.obedit_ref.ptr=reinterpret_cast<Object *>(uintptr_t(1)); // Must never dereference an encoded ref.
  MeshUndoStep step; step.elems=&elem; step.elems_len=1; std::memcpy(step.scene_ref.name,"SCScene",sizeof("SCScene"));
  step.scene_ref.ptr=reinterpret_cast<Scene *>(uintptr_t(1));
  assert(EDBM_touch_undo_context_matches(&C,&step.step));
  stored.id.session_uid=8; assert(!EDBM_touch_undo_context_matches(&C,&step.step)); stored.id.session_uid=7;
  std::memcpy(step.scene_ref.name,"SCOther",sizeof("SCOther")); assert(!EDBM_touch_undo_context_matches(&C,&step.step));
  std::memcpy(step.scene_ref.name,"SCScene",sizeof("SCScene")); std::memcpy(elem.obedit_ref.name,"OBOther",sizeof("OBOther"));
  assert(!EDBM_touch_undo_context_matches(&C,&step.step)); std::memcpy(elem.obedit_ref.name,"OBObject",sizeof("OBObject"));
  std::memcpy(elem.obedit_ref.library_filepath_abs,"/other.blend",sizeof("/other.blend"));
  assert(!EDBM_touch_undo_context_matches(&C,&step.step)); elem.obedit_ref.library_filepath_abs[0]=0;
  MeshUndoStep_Elem elems[2]={elem,elem}; Mesh second_mesh{{8,"MESecond"}}, second_stored{{8,""}};
  Object second{{4,"OBSecond"},&second_mesh}; main.second=&second;
  elems[1].data.mesh=&second_stored; std::memcpy(elems[1].obedit_ref.name,"OBSecond",sizeof("OBSecond"));
  step.elems=elems; step.elems_len=2; assert(EDBM_touch_undo_context_matches(&C,&step.step));
  main.second=nullptr; assert(!EDBM_touch_undo_context_matches(&C,&step.step)); main.second=&second;
  second_mesh.id.session_uid=9; assert(!EDBM_touch_undo_context_matches(&C,&step.step));
  step.elems_len=0; assert(!EDBM_touch_undo_context_matches(&C,&step.step));
  assert(!EDBM_touch_undo_context_matches(&C,nullptr));
}
'''.replace('__HELPER__',helper))


if __name__ == '__main__':
    unittest.main()
