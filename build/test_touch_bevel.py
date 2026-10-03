"""Compile the shipped direct Bevel lifecycle and native pointer-width mapping."""
from pathlib import Path
import unittest
import test_ipad_panels
from test_touch_extrude import changed_source

PREFIX = r'''
#define WITH_APPLE_CROSSPLATFORM
#include <cassert>
#include <cstdint>
#include <cstring>
#include <vector>
#include <cmath>
#include <algorithm>
#define STREQ(a,b) (std::strcmp((a),(b)) == 0)
#define LISTBASE_FOREACH(T, v, lb) for (T v = static_cast<T>((lb)->first); v; v = v->next)
template<class T> struct Vector : std::vector<T> {
  using std::vector<T>::vector;
  void append(const T &value) { this->push_back(value); }
};
template<class T> T *MEM_new(const char *) { return new T(); }
template<class T> void MEM_delete(T *p) { delete p; }
constexpr int OB_MESH=1, SPACE_VIEW3D=2, RGN_TYPE_WINDOW=3, SCE_SELECT_FACE=4;
#define NUM_VALUE_KINDS 4
struct NumInput {};
struct ListBase { void *first=nullptr; };
struct ID { uint32_t session_uid=0; };
struct Key { ID id; };
struct BMesh { int shapenr=1, totvertsel=2, vertices=8; std::vector<int> attributes{1,2,3}; };
struct BMEditMesh { BMesh *bm; int selectmode=1; };
struct EditOwner { BMEditMesh *value; BMEditMesh *get() const { return value; } };
struct MeshRuntime { EditOwner edit_mesh; };
struct Mesh { Mesh *next=nullptr; ID id; Key *key=nullptr; MeshRuntime *runtime; };
struct Object { Object *next=nullptr; ID id; int type=OB_MESH; void *data; bool locked=false; };
struct ARegionType { int callbacks=0; };
struct RegionRuntime { ARegionType *type; };
struct ARegion { ARegion *next=nullptr; int regiontype=RGN_TYPE_WINDOW; RegionRuntime *runtime; };
struct ScrArea { ScrArea *next=nullptr; int spacetype=SPACE_VIEW3D; ListBase regionbase; };
struct bScreen { bScreen *next=nullptr; ID id; ListBase areabase; };
struct Scene { ID id; };
struct Main { ListBase objects, meshes, screens; };
struct bToolRef { const char *idname="builtin.bevel"; };
struct CurveProfile { std::vector<int> points{2,5,8}; };
struct BMBackup { BMesh *bmcopy=nullptr; };
struct ReportList { int locks=0; };
struct wmOperatorType { const char *idname="MESH_OT_bevel"; };
struct wmOperator { void *customdata=nullptr; wmOperatorType *type; ReportList *reports; };
struct bContext { Main *main; Scene *scene; bScreen *screen; ScrArea *area; ARegion *region;
  bToolRef tool; bool edit=true; Vector<Object *> selected; };
int copies=0, profile_copies=0, profile_frees=0, restores=0, frees=0;
int detaches=0, updates=0, flushes=0, statuses=0, redraws=0, warnings=0;
constexpr int RPT_WARNING=1;
void BKE_report(ReportList *, int, const char *) { ++warnings; }
struct { int moving=0; } G;
Main *CTX_data_main(bContext *C) { return C->main; }
Scene *CTX_data_scene(bContext *C) { return C->scene; }
Main *CTX_data_view_layer(bContext *C) { return C->main; }
bContext *CTX_wm_view3d(bContext *C) { return C; }
bScreen *CTX_wm_screen(bContext *C) { return C->screen; }
ScrArea *CTX_wm_area(bContext *C) { return C->area; }
ARegion *CTX_wm_region(bContext *C) { return C->region; }
void CTX_wm_area_set(bContext *C, ScrArea *a) { C->area=a; }
void CTX_wm_region_set(bContext *C, ARegion *r) { C->region=r; }
bool ED_operator_editmesh(bContext *C) { return C->edit; }
const bToolRef *WM_toolsystem_ref_from_context(bContext *C) { assert(C->area); return &C->tool; }
BMEditMesh *BKE_editmesh_from_object(Object *o) {
  return static_cast<Mesh *>(o->data)->runtime->edit_mesh.get();
}
bool BKE_view_layer_base_find(Main *main, Object *wanted) {
  LISTBASE_FOREACH(Object *, object, &main->objects) { if (object==wanted) return true; }
  return false;
}
bContext *selected_context=nullptr;
Vector<Object *> BKE_view_layer_array_from_objects_in_edit_mode_unique_data(Scene *, Main *, bContext *) {
  Vector<Object *> unique;
  for (Object *o : selected_context->selected) {
    bool exists=false; for (Object *u : unique) exists |= u->data==o->data;
    if (!exists) unique.append(o);
  }
  return unique;
}
namespace blender::ed::object {
bool shape_key_report_if_locked(Object *o, ReportList *r) {
  if (o->locked) ++r->locks; return o->locked;
}
}
BMBackup EDBM_redo_state_store(BMEditMesh *em) { ++copies; return {new BMesh(*em->bm)}; }
void EDBM_redo_state_free(BMBackup *b) { if(b->bmcopy) {++frees; delete b->bmcopy; b->bmcopy=nullptr;} }
void EDBM_redo_state_restore_and_free(BMBackup *b, BMEditMesh *em, bool tris) {
  assert(tris); ++restores; *em->bm=*b->bmcopy; EDBM_redo_state_free(b);
}
struct EDBMUpdate_Params { bool calc_looptris=false, calc_normals=false, is_destructive=false; };
void EDBM_update(Mesh *, EDBMUpdate_Params *p) {
  assert(p->calc_normals && p->is_destructive); ++updates;
}
void EDBM_selectmode_flush(BMEditMesh *) { ++flushes; }
CurveProfile *BKE_curveprofile_copy(CurveProfile *p) {
  if (!p) return nullptr; ++profile_copies; return new CurveProfile(*p);
}
void BKE_curveprofile_free(CurveProfile *p) { if(p) {++profile_frees; delete p;} }
struct SpaceType { ARegionType *type; };
SpaceType *registered_space=nullptr;
SpaceType *BKE_spacetype_from_id(int) { return registered_space; }
ARegionType *BKE_regiontype_from_id(const SpaceType *s, int) { return s->type; }
bool ED_region_draw_cb_exit(ARegionType *type, void *handle) {
  assert(type->callbacks==1); --type->callbacks; ++detaches; delete static_cast<int *>(handle); return true;
}
void ED_area_status_text(ScrArea *, const char *) { ++statuses; }
void ED_region_tag_redraw(ARegion *r) { assert(r); ++redraws; }
'''

FIXTURE = r'''
struct Fixture {
  ARegionType type; SpaceType space{&type}; RegionRuntime rr{&type}; ARegion region{nullptr,RGN_TYPE_WINDOW,&rr};
  ScrArea area{nullptr,SPACE_VIEW3D,{&region}}; bScreen screen{nullptr,{100},{&area}}; Scene scene{{101}};
  BMesh bm1,bm2; BMEditMesh em1{&bm1},em2{&bm2}; MeshRuntime mr1{{&em1}},mr2{{&em2}};
  Key key{{200}}; Mesh mesh2{nullptr,{302},nullptr,&mr2}; Mesh mesh1{&mesh2,{301},&key,&mr1};
  Object ob2{nullptr,{402},OB_MESH,&mesh2}; Object shared{&ob2,{403},OB_MESH,&mesh1};
  Object ob1{&shared,{401},OB_MESH,&mesh1}; Main main{{&ob1},{&mesh1},{&screen}};
  bContext C{&main,&scene,&screen,&area,&region,{},true,{}};
  wmOperatorType optype; ReportList reports; wmOperator op{nullptr,&optype,&reports}; CurveProfile preset;
  Fixture() { registered_space=&space; selected_context=&C; C.selected={&ob1,&shared,&ob2}; }
  BevelData *begin() {
    auto *data=MEM_new<BevelData>("fixture"); data->is_modal=true; data->custom_profile=&preset;
    data->ob_store.append({&ob1,EDBM_redo_state_store(&em1)});
    data->ob_store.append({&ob2,EDBM_redo_state_store(&em2)});
    data->draw_handle_pixel=new int(1); type.callbacks=1; G.moving=1;
    touch_bevel_acquire(&C,data); op.customdata=data; return data;
  }
  void preview() { bm1.vertices=24; bm2.vertices=30; bm1.attributes={9}; }
};
'''

class TouchBevelTests(unittest.TestCase):
    def test_native_capture_admission_is_mesh_only(self):
        source=changed_source('intern/ghost/GHOST_NavigationIOS.hh')
        native='inline bool direct_edit_tool('+source.split('inline bool direct_edit_tool(',1)[1].split('/* Recognizer-owned admission',1)[0]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source('#include <cassert>\n#include <cstring>\n'+native+r'''
int main() {
  assert(direct_edit_tool("builtin.bevel","EDIT_MESH"));
  assert(!direct_edit_tool("builtin.bevel","OBJECT"));
  assert(!direct_edit_tool("builtin.bevel","EDIT_CURVE"));
  assert(!direct_edit_tool("builtin.bevel","POSE"));
  assert(!direct_edit_tool("builtin.bevel","SCULPT"));
  assert(direct_edit_tool("builtin.move","OBJECT"));
  assert(direct_edit_tool("builtin.extrude_region","EDIT_MESH"));
  assert(direct_edit_tool("builtin.select_box","EDIT_MESH"));
  assert(!direct_edit_tool(nullptr,"EDIT_MESH") && !direct_edit_tool("builtin.bevel",nullptr));
}
''')

    def lifecycle(self, main):
        source=changed_source('source/blender/editors/mesh/editmesh_bevel.cc')
        shipped=source.split('struct BevelObjectStore {',1)[1].split('\nenum {',1)[0]
        main=main.replace('int main() {','int main() {\n(void)&touch_bevel_selection_unlocked; (void)&touch_bevel_context_valid; (void)&touch_bevel_finish;',1)
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(PREFIX+'struct BevelObjectStore {'+shipped+FIXTURE+main)

    def test_native_backup_cancel_success_and_profile_independence(self):
        self.lifecycle(r'''
int main() {
  Fixture f; assert(touch_bevel_selection_unlocked(&f.C,&f.op)); auto *data=f.begin();
  assert(touch_bevel_context_valid(&f.C,data)); assert(data->custom_profile!=&f.preset);
  f.preset.points={99}; assert(data->custom_profile->points==std::vector<int>({2,5,8}));
  f.preview(); touch_bevel_finish(&f.C,&f.op,true);
  assert(f.bm1.vertices==8 && f.bm2.vertices==8 && f.bm1.attributes==std::vector<int>({1,2,3}));
  assert(restores==2 && frees==2 && detaches==1 && profile_frees==1 && f.op.customdata==nullptr);
  assert(f.preset.points==std::vector<int>({99}) && G.moving==0);
  data=f.begin(); f.preview(); touch_bevel_finish(&f.C,&f.op,false);
  assert(f.bm1.vertices==24 && f.bm2.vertices==30 && restores==2);
  assert(frees==4 && detaches==2 && profile_copies==2 && profile_frees==2 && data!=f.op.customdata);
}
''')

    def test_removed_representative_preserves_shared_mesh_rollback(self):
        self.lifecycle(r'''
int main() {
  Fixture f; auto *data=f.begin(); f.preview();
  f.main.objects.first=&f.shared; f.ob1.data=&f.mesh2;
  assert(!touch_bevel_owner(&f.C,data,data->ob_store[0]));
  assert(touch_bevel_mesh(&f.C,data,data->ob_store[0])==&f.mesh1);
  assert(!touch_bevel_context_valid(&f.C,data));
  touch_bevel_finish(&f.C,&f.op,true);
  assert(f.bm1.vertices==8 && f.bm2.vertices==8 && restores==2 && frees==2);
}
''')

    def test_replaced_key_edit_and_mesh_owners_are_never_restored(self):
        self.lifecycle(r'''
int main() {
  { Fixture f; auto *data=f.begin(); f.preview(); f.mesh1.id.session_uid=999;
    assert(!touch_bevel_context_valid(&f.C,data)); touch_bevel_finish(&f.C,&f.op,true);
    assert(f.bm1.vertices==24 && f.bm2.vertices==8); }
  { Fixture f; f.begin(); f.preview(); f.key.id.session_uid++;
    touch_bevel_finish(&f.C,&f.op,true); assert(f.bm1.vertices==24 && f.bm2.vertices==8); }
  { Fixture f; f.begin(); f.preview(); BMesh replacement; replacement.vertices=99; f.em1.bm=&replacement;
    touch_bevel_finish(&f.C,&f.op,true); assert(replacement.vertices==99 && f.bm1.vertices==24); }
  { Fixture f; f.begin(); f.preview(); f.bm1.shapenr++;
    touch_bevel_finish(&f.C,&f.op,true); assert(f.bm1.vertices==24 && f.bm2.vertices==8); }
  assert(restores==4 && frees==8 && detaches==4 && profile_frees==4 && warnings==4);
}
''')

    def test_missing_viewport_and_context_free_destruction_release_owned_storage(self):
        self.lifecycle(r'''
int main() {
  Fixture f; auto *data=f.begin(); f.preview(); f.area.regionbase.first=nullptr;
  assert(!touch_bevel_context_valid(&f.C,data)); touch_bevel_finish(&f.C,&f.op,true);
  assert(f.bm1.vertices==8 && f.C.area==nullptr && f.C.region==nullptr);
  assert(statuses==0 && redraws==0 && detaches==1);
  f.area.regionbase.first=&f.region; f.C.area=&f.area; f.C.region=&f.region;
  f.begin(); f.preview(); f.main.objects.first=nullptr; f.main.meshes.first=nullptr;
  EDBM_touch_bevel_discard(&f.op); EDBM_touch_bevel_discard(&f.op);
  assert(f.bm1.vertices==24 && f.bm2.vertices==30 && restores==2 && frees==4);
  assert(detaches==2 && profile_frees==2 && f.op.customdata==nullptr);
  Fixture g; auto *guarded=g.begin(); bScreen other{nullptr,{999},{}}; g.C.screen=&other;
  assert(!touch_bevel_context_valid(&g.C,guarded)); g.preview(); touch_bevel_finish(&g.C,&g.op,true);
  assert(g.C.area==nullptr && g.C.region==nullptr && g.bm1.vertices==8 && restores==4);
}
''')

    def test_locked_secondary_owner_and_empty_selection_reject_before_acquisition(self):
        self.lifecycle(r'''
int main() {
  Fixture f; f.ob2.locked=true;
  assert(!touch_bevel_selection_unlocked(&f.C,&f.op)); assert(f.reports.locks==1);
  assert(copies==0 && profile_copies==0 && f.op.customdata==nullptr);
  f.ob2.locked=false; f.bm1.totvertsel=0; f.bm2.totvertsel=0;
  assert(!touch_bevel_selection_unlocked(&f.C,&f.op));
  f.bm1.totvertsel=2; assert(touch_bevel_selection_unlocked(&f.C,&f.op));
  f.begin(); EDBM_touch_bevel_discard(&f.op); assert(copies==2 && frees==2);
}
''')

    def test_native_radial_mapping_contact_origin_margin_and_shift_gain(self):
        source=changed_source('source/blender/editors/mesh/editmesh_bevel.cc')
        initial='static void edbm_bevel_calc_initial_length'+source.split('static void edbm_bevel_calc_initial_length',1)[1].split('static void edbm_bevel_mouse_set_value',1)[0]
        mouse='static void edbm_bevel_mouse_set_value'+source.split('static void edbm_bevel_mouse_set_value',2)[2].split('static void edbm_bevel_numinput_set_value',1)[0]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#include <cassert>
#include <cmath>
#include <algorithm>
#define OFFSET_VALUE 0
#define OFFSET_VALUE_PERCENT 1
#define PROFILE_VALUE 2
#define SEGMENTS_VALUE 3
#define NUM_VALUE_KINDS 4
#define KM_SHIFT 1
#define MVAL_PIXEL_MARGIN 5.0f
#define CLAMP(v,lo,hi) (v = std::clamp(v,lo,hi))
static const char *value_rna_name[4] = {"offset","offset_pct","profile","segments"};
static const float value_start[4]={0,0,0.5f,1};
static const float value_clamp_min[4]={0,0,0,1}, value_clamp_max[4]={1e6f,100,1,1000};
struct BevelData { float mcenter[2]{50,0}; float initial_length[4]{-1,-1,-1,-1};
  float scale[4]{0.2f,0.5f,0.01f,0.04f}; float shift_value[4]{-1,-1,-1,-1}; short value_mode=0; float segments=1; };
struct Props { float values[4]{0,0,0.5f,1}; };
struct wmOperator { BevelData *customdata; Props *ptr; };
struct wmEvent { int mval[2]; int modifier=0; };
float len_v2(const float v[2]) { return std::sqrt(v[0]*v[0]+v[1]*v[1]); }
int index(const char *name) { for(int i=0;i<4;i++) if(name==value_rna_name[i])return i; return -1; }
float RNA_float_get(Props *p,const char *name) { return p->values[index(name)]; }
void RNA_float_set(Props *p,const char *name,float v) { p->values[index(name)]=v; }
void RNA_int_set(Props *p,const char *name,int v) { p->values[index(name)]=float(v); }
'''+initial+mouse+r'''
int main() {
  BevelData data; Props props; wmOperator op{&data,&props}; wmEvent contact{{100,0}}, threshold{{120,0}};
  edbm_bevel_calc_initial_length(&op,&contact,false);
  edbm_bevel_mouse_set_value(&op,&threshold); assert(std::abs(props.values[0]-3)<1e-6f);
  wmEvent further{{140,0},KM_SHIFT}; edbm_bevel_mouse_set_value(&op,&further);
  assert(std::abs(props.values[0]-3.4f)<1e-6f); further.mval[0]=150; edbm_bevel_mouse_set_value(&op,&further);
  assert(std::abs(props.values[0]-3.6f)<1e-6f);
  further.modifier=0; edbm_bevel_mouse_set_value(&op,&further); assert(props.values[0]==9);
  wmEvent inward{{80,0}}; edbm_bevel_mouse_set_value(&op,&inward); assert(props.values[0]==0);
  data.value_mode=SEGMENTS_VALUE; wmEvent segment_start{{100,0}};
  edbm_bevel_calc_initial_length(&op,&segment_start,true); edbm_bevel_mouse_set_value(&op,&threshold);
  assert(data.segments>1 && props.values[3]>=1);
}
''')

    def test_interruption_precedes_release_confirmation_and_free_is_contextless(self):
        source=changed_source('source/blender/editors/mesh/editmesh_bevel.cc')
        modal=source.split('static wmOperatorStatus edbm_bevel_modal(',1)[1].split('static void edbm_bevel_ui',1)[0]
        self.assertLess(modal.index('WM_EVENT_IS_POINTER_CANCEL'),modal.index('release_confirm'))
        invoke=source.split('static wmOperatorStatus edbm_bevel_invoke(',1)[1].split('static void edbm_bevel_mouse_set_value',1)[0]
        self.assertLess(invoke.index('touch_bevel_selection_unlocked'),invoke.index('edbm_bevel_init'))
        self.assertIn('WM_event_drag_start_mval(event, CTX_wm_region(C), contact.mval)',invoke)
        self.assertIn('edbm_bevel_mouse_set_value(op, event)',invoke)
        wm=changed_source('source/blender/windowmanager/intern/wm.cc')
        self.assertIn('EDBM_touch_bevel_discard(op);',wm)

    def test_native_keymap_result_prioritizes_only_intentional_bevel_strokes(self):
        source=changed_source('source/blender/windowmanager/intern/wm_event_system.cc')
        block='/* An intentional Bevel canvas stroke'+source.split('/* An intentional Bevel canvas stroke',1)[1].split('#endif',1)[0]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#include <cassert>
#include <cstring>
#include <utility>
#define STREQ(a,b) (std::strcmp(a,b)==0)
#define ELEM(a,b,c) ((a)==(b)||(a)==(c))
constexpr int LEFTMOUSE=1, KM_PRESS_DRAG=2, EVT_NONE=0, WM_EVENT_IS_DIRECT_TOOL=4;
struct Event { int type=LEFTMOUSE,val=KM_PRESS_DRAG,flag=WM_EVENT_IS_DIRECT_TOOL,modifier=0,keymodifier=0; };
struct Runtime { const char *keymap="Bevel"; };
struct Tool { const char *idname="builtin.bevel"; Runtime *runtime; };
void WM_event_get_keymap_from_toolsystem_with_gizmos() {}
void WM_event_get_keymap_from_toolsystem() {}
void other_keymap() {}
struct Handler { Tool *keymap_tool; struct {void(*keymap_fn)();} dynamic; };
struct Keymap { const char *idname; };
struct Result { Keymap *keymaps[2]; int keymaps_len=2; };
struct Context { bool edit=true; };
bool ED_operator_editmesh(Context *C) { return C->edit; }
void route(Context *C, Event *event, Handler *handler, Result &km_result) {
'''+block+r'''
}
int main() {
  Runtime runtime; Tool tool{"builtin.bevel",&runtime}; Handler handler{&tool,{WM_event_get_keymap_from_toolsystem_with_gizmos}};
  Keymap selection{"Select"}, bevel{"Bevel"}; Context C; Event event;
  auto run=[&]() { Result result{{&selection,&bevel},2}; route(&C,&event,&handler,result); return result.keymaps[0]; };
  assert(run()==&bevel);
  event.flag=0; assert(run()==&selection); event.flag=WM_EVENT_IS_DIRECT_TOOL;
  event.modifier=1; assert(run()==&selection); event.modifier=0;
  event.keymodifier=8; assert(run()==&selection); event.keymodifier=0;
  event.val=3; assert(run()==&selection); event.val=KM_PRESS_DRAG;
  C.edit=false; assert(run()==&selection); C.edit=true;
  handler.dynamic.keymap_fn=other_keymap; assert(run()==&selection);
  handler.dynamic.keymap_fn=WM_event_get_keymap_from_toolsystem; assert(run()==&bevel);
  tool.idname="builtin.move"; assert(run()==&selection); tool.idname="builtin.bevel";
  Result missing{{&selection,&selection},2}; route(&C,&event,&handler,missing); assert(missing.keymaps[0]==&selection);
  assert(std::strcmp(selection.idname,"Select")==0 && std::strcmp(bevel.idname,"Bevel")==0);
}
''')

    def test_compiled_cancel_barrier_cannot_become_release_confirm(self):
        source=changed_source('source/blender/editors/mesh/editmesh_bevel.cc')
        head='static wmOperatorStatus edbm_bevel_modal('+source.split('static wmOperatorStatus edbm_bevel_modal(',1)[1].split('  const bool has_numinput',1)[0]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#define WITH_APPLE_CROSSPLATFORM
#include <cassert>
enum wmOperatorStatus { OPERATOR_CANCELLED, OPERATOR_FINISHED };
constexpr int WM_EVENT_IS_POINTER_CANCEL=1;
struct BevelData { struct {bool active=true;} touch; };
struct bContext { bool valid=true; };
struct wmOperator { void *customdata; };
struct wmEvent { int flag=0; };
int cancels=0, statuses=0, confirmations=0;
bool touch_bevel_context_valid(bContext *C, BevelData *) { return C->valid; }
void edbm_bevel_cancel(bContext *, wmOperator *op) { ++cancels; op->customdata=nullptr; }
void ED_workspace_status_text(bContext *, const char *) { ++statuses; }
'''+head+r'''
  ++confirmations; return OPERATOR_FINISHED;
}
int main() {
  BevelData data; bContext C; wmOperator op{&data}; wmEvent cancelled{WM_EVENT_IS_POINTER_CANCEL};
  assert(edbm_bevel_modal(&C,&op,&cancelled)==OPERATOR_CANCELLED);
  assert(cancels==1 && statuses==1 && confirmations==0 && op.customdata==nullptr);
  op.customdata=&data; C.valid=false; wmEvent release;
  assert(edbm_bevel_modal(&C,&op,&release)==OPERATOR_CANCELLED && confirmations==0);
  op.customdata=&data; C.valid=true;
  assert(edbm_bevel_modal(&C,&op,&release)==OPERATOR_FINISHED && confirmations==1);
  data.touch.active=false; op.customdata=&data;
  assert(edbm_bevel_modal(&C,&op,&cancelled)==OPERATOR_FINISHED && cancels==2);
}
''')

if __name__=='__main__': unittest.main()
