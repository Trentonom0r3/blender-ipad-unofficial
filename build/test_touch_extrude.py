"""Compile shipped transaction and macro terminal code, including failure ownership."""
from pathlib import Path
import unittest
import test_ipad_panels


def changed_source(path):
    patch = (Path(__file__).resolve().parents[1] / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
    section = patch.split(f'diff --git a/{path} b/{path}\n', 1)[1].split('diff --git ', 1)[0]
    return '\n'.join(line[1:] for line in section.splitlines()
                     if line.startswith((' ', '+')) and not line.startswith('+++'))


class TouchExtrudeTests(unittest.TestCase):
    def test_full_snapshot_success_cancel_and_replaced_owners(self):
        source = changed_source('source/blender/editors/mesh/editmesh_extrude.cc')
        transaction = source.split('/* The macro owns these independent', 1)[1].split('#endif', 1)[0]
        transaction = '/* The macro owns these independent' + transaction
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#include <cassert>
#include <cstdint>
#include <cstring>
#include <initializer_list>
#include <vector>
#include <utility>
template<class T> struct Vector : std::vector<T> {
  using std::vector<T>::vector;
  bool is_empty() const { return this->empty(); }
  void append(const T &value) { this->push_back(value); }
};
struct ID { uint32_t session_uid; };
struct Key { ID id; };
struct BMesh { int shapenr = 1; int totvertsel = 3; int vertices = 8;
  std::vector<int> attributes{1,2,3}; std::vector<int> shape_data{4,5,6}; };
struct BMEditMesh { BMesh *bm; };
struct EditOwner { BMEditMesh *value; BMEditMesh *get() const { return value; } };
struct Runtime { EditOwner edit_mesh; };
struct Mesh { Mesh *next; ID id; Key *key; Runtime *runtime; };
struct Object { void *data; bool locked; };
struct Main { struct { Mesh *first; } meshes; };
struct bToolRef { const char *idname; };
struct ReportList { int locked = 0; };
struct bContext { Main *main; bToolRef *tool; Vector<Object *> objects; bool edit = true; };
struct BMBackup { BMesh *bmcopy; };
int copies = 0, restores = 0, releases = 0, updates = 0;
template<class T> T *MEM_new(const char *) { return new T(); }
template<class T> void MEM_delete(T *p) { delete p; }
const bToolRef *WM_toolsystem_ref_from_context(bContext *C) { return C->tool; }
bool ED_operator_editmesh(bContext *C) { return C->edit; }
bContext *CTX_data_scene(bContext *C) { return C; }
bContext *CTX_data_view_layer(bContext *C) { return C; }
bContext *CTX_wm_view3d(bContext *C) { return C; }
Main *CTX_data_main(bContext *C) { return C->main; }
BMEditMesh *BKE_editmesh_from_object(Object *object) {
  return static_cast<Mesh *>(object->data)->runtime->edit_mesh.get();
}
Vector<Object *> BKE_view_layer_array_from_objects_in_edit_mode_unique_data(
    bContext *C, bContext *, bContext *) {
  Vector<Object *> unique;
  for (Object *object : C->objects) {
    bool found = false;
    for (Object *prior : unique) { found |= prior->data == object->data; }
    if (!found) { unique.append(object); }
  }
  return unique;
}
namespace blender::ed::object {
bool shape_key_report_if_locked(Object *object, ReportList *reports) {
  if (object->locked) { ++reports->locked; }
  return object->locked;
}
}
BMBackup EDBM_redo_state_store(BMEditMesh *em) {
  ++copies; return {new BMesh(*em->bm)};
}
void EDBM_redo_state_free(BMBackup *backup) {
  if (backup->bmcopy) { ++releases; delete backup->bmcopy; backup->bmcopy = nullptr; }
}
void EDBM_redo_state_restore_and_free(BMBackup *backup, BMEditMesh *em, bool looptris) {
  assert(!looptris); ++restores; *em->bm = *backup->bmcopy;
  EDBM_redo_state_free(backup);
}
struct EDBMUpdate_Params { bool calc_looptris = false, calc_normals = false, is_destructive = false; };
void EDBM_update(Mesh *, EDBMUpdate_Params *params) {
  assert(params->calc_looptris && params->calc_normals && params->is_destructive); ++updates;
}
#define STREQ(a,b) (std::strcmp(a,b) == 0)
#define LISTBASE_FOREACH(type,var,list) for (type var=(list)->first; var; var=var->next)
__TRANSACTION__
int main() {
  bToolRef tool{"builtin.extrude_region"}; ReportList reports;
  Key key{{80}}; BMesh a, b; BMEditMesh ea{&a}, eb{&b};
  Runtime ra{{&ea}}, rb{{&eb}}; Mesh mb{nullptr,{2},&key,&rb}, ma{&mb,{1},nullptr,&ra};
  Main main{{&ma}}; Object oa{&ma,false}, ob{&mb,false}, shared{&ma,false};
  bContext C{&main,&tool,{&oa,&ob,&shared}};
  void *data = EDBM_touch_extrude_begin(&C,&reports);
  assert(data && copies == 2); // Same Mesh referenced twice is acquired once.
  a.vertices = b.vertices = 14; a.attributes = {9}; b.shape_data = {10}; a.totvertsel = 6;
  EDBM_touch_extrude_finish(&C,data,true);
  assert(a.vertices == 8 && b.vertices == 8 && a.totvertsel == 3);
  assert(a.attributes == std::vector<int>({1,2,3}) && b.shape_data == std::vector<int>({4,5,6}));
  assert(restores == 2 && releases == 2 && updates == 2);
  data = EDBM_touch_extrude_begin(&C,&reports); a.vertices = b.vertices = 14;
  EDBM_touch_extrude_finish(&C,data,false);
  assert(a.vertices == 14 && b.vertices == 14 && restores == 2 && releases == 4);
  // A locked second owner rejects the complete transaction before any copies.
  ob.locked = true; assert(!EDBM_touch_extrude_begin(&C,&reports));
  assert(copies == 4 && reports.locked == 1); ob.locked = false;
  data = EDBM_touch_extrude_begin(&C,&reports); a.vertices = b.vertices = 20;
  // Removing one owner cannot dereference it; remaining owner still restores.
  main.meshes.first = &mb; EDBM_touch_extrude_finish(&C,data,true);
  assert(a.vertices == 20 && b.vertices == 14 && restores == 3 && releases == 6);
  main.meshes.first = &ma;
  data = EDBM_touch_extrude_begin(&C,&reports); b.shapenr = 2; b.vertices = 30;
  EDBM_touch_extrude_finish(&C,data,true);
  assert(b.vertices == 30 && restores == 4 && releases == 8);
  // Changed Key, edit representation and UID each invalidate their target.
  for (int kind : {0,1,2,3}) {
    data = EDBM_touch_extrude_begin(&C,&reports); b.vertices += 2;
    BMEditMesh replacement{&b}; Key other{{81}};
    if (kind == 0) { mb.key = &other; }
    if (kind == 1) { rb.edit_mesh.value = &replacement; }
    if (kind == 2) { mb.id.session_uid = 77; }
    if (kind == 3) { eb.bm = &a; }
    const int changed = b.vertices;
    EDBM_touch_extrude_finish(&C,data,true); assert(b.vertices == changed);
    mb.key = &key; rb.edit_mesh.value = &eb; mb.id.session_uid = 2; eb.bm = &b;
  }
  data = EDBM_touch_extrude_begin(&C,&reports); const int unchanged = a.vertices;
  EDBM_touch_extrude_discard(data); assert(a.vertices == unchanged);
  assert(copies == releases); EDBM_touch_extrude_discard(nullptr);
  tool.idname = "builtin.move"; assert(!EDBM_touch_extrude_begin(&C,&reports));
  tool.idname = "builtin.extrude_region"; C.edit = false;
  assert(!EDBM_touch_extrude_begin(&C,&reports));
}
'''.replace('__TRANSACTION__', transaction))

    def test_macro_terminal_results_and_context_free_discard(self):
        source = changed_source('source/blender/windowmanager/intern/wm_operator_type.cc')
        start = source.index('struct MacroData {')
        end = source.index('/* Macro exec only runs exec calls. */', start)
        terminal = source[start:end]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#define WITH_APPLE_CROSSPLATFORM
#include <cassert>
#include <initializer_list>
using wmOperatorStatus = int;
constexpr int OPERATOR_FINISHED=1, OPERATOR_CANCELLED=2, OPERATOR_INTERFACE=4, OPERATOR_RUNNING_MODAL=8;
struct bContext { bool child_cleaned = true; };
struct wmOperator { void *customdata=nullptr; };
namespace blender::bke {
enum class TouchUndoPhase { Empty, PendingInvoke, Ready };
struct TouchUndoRecovery { TouchUndoPhase phase=TouchUndoPhase::Empty; };
}
int receipts=0, warnings=0;
void ED_undo_touch_finish(bContext *C,const blender::bke::TouchUndoRecovery &receipt,bool cancelled) {
  assert(C->child_cleaned);
  receipts += cancelled && receipt.phase!=blender::bke::TouchUndoPhase::Empty;
}
constexpr int RPT_WARNING=1;
void WM_global_report(int,const char *) {++warnings;}
int finished=0, restored=0, freed=0;
template<class T> T *MEM_new(const char *) { return new T{}; }
template<class T> void MEM_delete(T *data) { delete data; }
template<class T> void MEM_freeN(T *data) { delete data; }
void EDBM_touch_extrude_discard(void *data) { if(data) { ++freed; } }
bool EDBM_touch_extrude_finish(bContext *C, void *data, bool cancelled) {
  assert(C->child_cleaned); if(!data){return true;}
  ++finished; restored += cancelled; ++freed; return true;
}
__TERMINAL__
int main() {
  bContext C; int token=0;
  for (bool owned : {false,true}) {
    for (int prior : {0,OPERATOR_FINISHED}) {
      for (int status : {OPERATOR_FINISHED,OPERATOR_CANCELLED,OPERATOR_INTERFACE}) {
        wmOperator op; wm_macro_start(&op);
        auto *md=static_cast<MacroData *>(op.customdata); md->retval=prior;
        md->touch_extrude=owned ? &token : nullptr;
        const int result=wm_macro_end(&C,&op,status);
        const bool cancelled=status!=OPERATOR_FINISHED;
        const int expected=owned && cancelled ? OPERATOR_CANCELLED :
                           cancelled && prior ? OPERATOR_FINISHED : status;
        assert(result==expected);
        if(op.customdata) { wm_operator_macro_discard_touch(&op); }
        assert(!op.customdata);
      }
    }
  }
  assert(finished==6 && restored==4 && freed==6);
  // Mid-drag keeps its transaction; only context-free destruction releases it.
  wmOperator op; wm_macro_start(&op);
  static_cast<MacroData *>(op.customdata)->touch_extrude=&token;
  assert(wm_macro_end(&C,&op,OPERATOR_RUNNING_MODAL)==OPERATOR_RUNNING_MODAL && op.customdata);
  wm_operator_macro_discard_touch(&op); wm_operator_macro_discard_touch(&op);
  assert(!op.customdata && finished==6 && freed==7);
  // Claimed accepted-state receipt, rejected snapshot: no provisional geometry.
  wm_macro_start(&op);
  static_cast<MacroData *>(op.customdata)->touch_recovery.phase=blender::bke::TouchUndoPhase::PendingInvoke;
  assert(wm_macro_end(&C,&op,OPERATOR_CANCELLED)==OPERATOR_CANCELLED);
  assert(!op.customdata && receipts==1 && finished==6 && warnings==0);
  // Unexpected free never schedules a decode of the owned receipt.
  wm_macro_start(&op);
  static_cast<MacroData *>(op.customdata)->touch_recovery.phase=blender::bke::TouchUndoPhase::PendingInvoke;
  wm_operator_macro_discard_touch(&op); assert(receipts==1);

}
'''.replace('__TERMINAL__', terminal))

    def test_undo_lifetime_ids_survive_initialized_push_and_address_reuse(self):
        import test_fine_drag_lifecycle
        source=changed_source('source/blender/blenkernel/intern/undo_system.cc')
        layout=changed_source('source/blender/blenkernel/BKE_undo_system.hh')
        step=layout.split('struct UndoStep {',1)[1].split('char name[64];',1)[0]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r"""
#define WITH_APPLE_CROSSPLATFORM
#include <cstddef>
#include <cstdint>
struct UndoStep { __STEP_PREFIX__ };
static_assert(offsetof(UndoStep,next)==0);
static_assert(offsetof(UndoStep,prev)==sizeof(void *));
static_assert(offsetof(UndoStep,ipad_lifetime_id)>=2*sizeof(void *));
int main() {}
""".replace('__STEP_PREFIX__',step))
        helper=test_fine_drag_lifecycle.block(source,'static uint64_t undosys_touch_lifetime_id()')
        start=source.index('    /* An initialized step keeps its identity')
        end=source.index('\n#endif',start)
        assignment=source[start:end]
        self.assertEqual(source.count('us->ipad_lifetime_id = undosys_touch_lifetime_id();'),2)
        self.assertIn('ustack->ipad_lifetime_id = undosys_touch_lifetime_id();',source)
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r"""
#include <cassert>
#include <atomic>
#include <cstdint>
#include <set>
#define BLI_assert assert
struct UndoStep { uint64_t ipad_lifetime_id=0; };
struct UndoStack { UndoStep *step_init=nullptr; };
__HELPER__
void encode(UndoStack *ustack,UndoStep *us) {
__ASSIGNMENT__
  ustack->step_init=nullptr;
}
int main() {
  std::set<uint64_t> identities;
  UndoStep arena;
  for(int i=0;i<10000;++i) {
    arena.ipad_lifetime_id=undosys_touch_lifetime_id();
    const uint64_t initialized=arena.ipad_lifetime_id;
    UndoStack stack{&arena}; encode(&stack,&arena);
    assert(arena.ipad_lifetime_id==initialized && !stack.step_init);
    assert(initialized && identities.insert(initialized).second);
    encode(&stack,&arena); // Fresh allocation at the same address has a fresh ID.
    assert(arena.ipad_lifetime_id!=initialized && identities.insert(arena.ipad_lifetime_id).second);
  }
}
""".replace('__HELPER__',helper).replace('__ASSIGNMENT__',assignment))

    def test_extrude_admission_is_mesh_only(self):
        source = changed_source('intern/ghost/GHOST_NavigationIOS.hh')
        start = source.index('inline bool direct_edit_tool(')
        end = source.index('\n}',start) + len('\n}')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r"""
#include <cassert>
#include <cstring>
#include <initializer_list>
__ADMISSION__
int main() {
  for(const char *mode:{"OBJECT","POSE","EDIT_MESH","EDIT_CURVE","SCULPT"}) {
    assert(direct_edit_tool("builtin.extrude_region",mode)==(std::strcmp(mode,"EDIT_MESH")==0));
  }
  assert(direct_edit_tool("builtin.move","EDIT_MESH"));
  assert(direct_edit_tool("builtin.select_box","EDIT_MESH"));
}
""".replace('__ADMISSION__',source[start:end]))

    def test_batched_threshold_motion_keeps_touch_ownership(self):
        source = changed_source('source/blender/windowmanager/intern/wm_event_system.cc')
        start = source.index('    event_last->type = INBETWEEN_MOUSEMOVE;')
        end = source.index('event_last->flag &= WM_EVENT_IS_DIRECT_TOOL;', start)
        demotion = source[start:end + len('event_last->flag &= WM_EVENT_IS_DIRECT_TOOL;')]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r"""
#include <cassert>
#include <initializer_list>
constexpr int MOUSEMOVE=1,INBETWEEN_MOUSEMOVE=2,WM_EVENT_IS_DIRECT_TOOL=128;
struct Event { int type=MOUSEMOVE, flag=0, x=0; };
void queue_next(Event *event_last) {
__DEMOTION__
}
int main() {
  for(bool touch:{false,true}) {
    Event moves[3]={{MOUSEMOVE,(touch ? 128 : 0)|4,2},
                    {MOUSEMOVE,(touch ? 128 : 0)|8,12},
                    {MOUSEMOVE,touch ? 128 : 0,20}};
    queue_next(&moves[0]); queue_next(&moves[1]);
    assert(moves[0].type==INBETWEEN_MOUSEMOVE && moves[1].type==INBETWEEN_MOUSEMOVE);
    // The first threshold crossing is the intermediate sample, not the last.
    int drag_flags=-1;
    for(const Event &move:moves) { if(move.x>10) { drag_flags=move.flag; break; } }
    assert(drag_flags==(touch ? WM_EVENT_IS_DIRECT_TOOL : 0));
  }
}
""".replace('__DEMOTION__',demotion))

    def test_child_cleanup_precedes_rollback_and_cursor_defaults(self):
        source = changed_source('source/blender/windowmanager/intern/wm_operator_type.cc')
        cancel = source.split('static void wm_macro_cancel(', 1)[1]
        self.assertLess(cancel.index('op->opm->type->cancel(C, op->opm)'),
                        cancel.index('wm_macro_end(C, op, OPERATOR_CANCELLED)'))
        modal = source.split('static wmOperatorStatus wm_macro_modal(', 1)[1].split('static void wm_macro_cancel', 1)[0]
        self.assertLess(modal.index('opm->type->modal(C, opm, event)'), modal.index('wm_macro_end(C, op, retval)'))
        invoke = source.split('static wmOperatorStatus wm_macro_invoke(', 1)[1].split('static wmOperatorStatus wm_macro_modal', 1)[0]
        self.assertLess(invoke.index('EDBM_touch_extrude_begin'), invoke.index('wm_macro_invoke_internal'))
        self.assertIn('WM_EVENT_IS_DIRECT_TOOL', invoke)
        self.assertIn('MESH_OT_extrude_context_move', invoke)
        cursor = changed_source('intern/ghost/intern/GHOST_EventCursor.hh')
        self.assertIn('bool is_direct_tool = false', cursor)
        self.assertIn('{x, y, tablet, is_direct_tool, ipad_hud_generation, ipad_hud_serial}', cursor)
        events = changed_source('source/blender/windowmanager/intern/wm_event_system.cc')
        self.assertIn('if (cd->is_direct_tool)', events)
        self.assertIn('CLICK_DRAG inherits motion provenance', events)
        free = changed_source('source/blender/windowmanager/intern/wm.cc')
        self.assertIn('op->type->flag & OPTYPE_MACRO', free)
        self.assertIn('wm_operator_macro_discard_touch(op)', free)


if __name__ == '__main__':
    unittest.main()
