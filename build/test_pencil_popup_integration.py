"""Execute the native seams omitted by the first ring presentation fixtures."""
import unittest
from pathlib import Path
from test_touch_extrude import changed_source
from test_compact_shelf import function
import test_ipad_panels


class PencilPopupIntegrationTests(unittest.TestCase):
    def test_python_ui_bridge_preserves_real_editing_depth_without_artificial_suppression(self):
        wm = changed_source('source/blender/windowmanager/intern/wm_event_system.cc')
        # The explicit Python undo argument preserves native dispatch; it does
        # not add Undo behavior to this non-Undo registered popup operator.
        registration = function(changed_source('source/blender/windowmanager/intern/wm_operators.cc'),
                                'static void WM_OT_call_menu_pie(')
        self.assertNotIn('OPTYPE_UNDO', registration)
        bridge = (Path(__file__).parent / 'fixtures/pinned_python_operator_call.cc').read_text(encoding='utf-8')
        safe = function(wm, 'bool WM_event_ipad_mode_safe(')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#include <cassert>
#include <vector>
using wmOperatorStatus=int;
constexpr int OPERATOR_CANCELLED=0,OPERATOR_FINISHED=1,WM_JOB_TYPE_ANY=1,WM_HANDLER_TYPE_GIZMO=2;
struct Scene{};struct wmEventHandler{int type=0;};struct wmWindow{std::vector<wmEventHandler*> modalhandlers;};
namespace blender::bke {enum class TouchUndoPhase{Empty,Pending};}
namespace blender::wm {enum class OpCallContext{Invoke};}
struct Runtime{struct{blender::bke::TouchUndoPhase phase=blender::bke::TouchUndoPhase::Empty;}touch_undo_recovery;};
struct wmWindowManager{int op_undo_depth=0;Runtime *runtime;};
struct bContext{wmWindowManager *wm;wmWindow *win;Scene *scene;};
struct wmOperatorType{};struct PointerRNA{};struct ReportList{};
struct{bool moving=false;}G;
#define LISTBASE_FOREACH(type,item,base) for(type item:*(base))
wmWindowManager *CTX_wm_manager(bContext *C){return C->wm;}
wmWindow *CTX_wm_window(bContext *C){return C->win;}
Scene *CTX_data_scene(bContext *C){return C->scene;}
bool WM_jobs_test(wmWindowManager *,Scene *,int){return false;}
bool WM_event_touch_undo_safe(wmWindow *){return true;}
SAFE
wmOperatorStatus wm_operator_call_internal(bContext *C,wmOperatorType *,PointerRNA *,ReportList *,
 blender::wm::OpCallContext,bool,void *){return WM_event_ipad_mode_safe(C)?OPERATOR_FINISHED:OPERATOR_CANCELLED;}
BRIDGE
int main(){
 Runtime runtime;wmWindowManager wm{0,&runtime};wmWindow win;Scene scene;bContext C{&wm,&win,&scene};
 wmOperatorType type;
 // Original Python default suppresses Undo by adding depth, despite this UI-only op.
 assert(WM_operator_call_py(&C,&type,blender::wm::OpCallContext::Invoke,nullptr,nullptr,false)==OPERATOR_CANCELLED);
 assert(wm.op_undo_depth==0);
 // Explicit native semantics admit the popup without weakening a real nested edit.
 assert(WM_operator_call_py(&C,&type,blender::wm::OpCallContext::Invoke,nullptr,nullptr,true)==OPERATOR_FINISHED);
 wm.op_undo_depth=1;
 assert(WM_operator_call_py(&C,&type,blender::wm::OpCallContext::Invoke,nullptr,nullptr,true)==OPERATOR_CANCELLED);
 assert(wm.op_undo_depth==1);wm.op_undo_depth=0;G.moving=true;
 assert(WM_operator_call_py(&C,&type,blender::wm::OpCallContext::Invoke,nullptr,nullptr,true)==OPERATOR_CANCELLED);
}
'''.replace('SAFE', safe).replace('BRIDGE', bridge))

    def test_actual_popup_scrolltest_keeps_hidden_inventory_from_disabling_drawn_page(self):
        popup = changed_source('source/blender/editors/interface/regions/interface_region_popup.cc')
        scroll = function(popup, 'void ui_popup_block_scrolltest(')
        # Execute the real refresh scroll branch too, with a retained old offset.
        start = popup.index('    const bool ipad_page =')
        end = popup.index('\n  }\n  /* Apply popup scroll offset', start)
        refresh = popup[start:end]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#include <cassert>
#include <algorithm>
#include <cfloat>
#include <memory>
#include <vector>
constexpr int UI_BLOCK_CLIPBOTTOM=1,UI_BLOCK_CLIPTOP=2,UI_SCROLLED=1,UI_HIDDEN=2,UI_PIE_IPAD_TOOLS=1;
constexpr float UI_MENU_SCROLL_ARROW=12,UI_MENU_SCROLL_PAD=2,UI_UNIT_Y=20;
struct Rect{float xmin=-200,xmax=200,ymin=-200,ymax=200;};
struct uiBut{int flag=0;Rect rect;};
struct uiBlock{int flag=0;struct{int flags=0;}pie_data;bool ipad_ring_full_labels=false;
 Rect rect;void *panel=nullptr;std::vector<std::unique_ptr<uiBut>> buttons;};
struct Handle{float scrolloffset=0;};
float min_ff(float a,float b){return std::min(a,b);}float max_ff(float a,float b){return std::max(a,b);}
bool ui_block_is_menu(uiBlock *){return true;}
void ui_layout_panel_popup_scroll_apply(void *,float){}
SCROLL_SOURCE_HERE
void refresh_scroll(uiBlock *block,Handle *handle){REFRESH}
int drawn(uiBlock &b){int n=0;for(auto &button:b.buttons)if(!(button->flag&(UI_HIDDEN|UI_SCROLLED)))++n;return n;}
int main(){
 uiBlock b;b.pie_data.flags=UI_PIE_IPAD_TOOLS;b.ipad_ring_full_labels=true;
 for(int i=0;i<43;++i){auto button=std::make_unique<uiBut>();
  if(i<9)button->rect={-40,40,i==0?-191.f:-40.f,i==0?-157.f:0.f};
  else{button->flag=UI_HIDDEN;button->rect={0,88,-1000.f-34*i,-966.f-34*i};}
  b.buttons.push_back(std::move(button));
 }
 // The unchanged ordinary-menu branch reproduces hidden overflow clipping.
 b.ipad_ring_full_labels=false;ui_popup_block_scrolltest(&b);
 assert((b.flag&UI_BLOCK_CLIPBOTTOM)&&(b.buttons[0]->flag&UI_SCROLLED)&&drawn(b)<9);
 b.ipad_ring_full_labels=true;Handle handle{70};refresh_scroll(&b,&handle);
 assert(handle.scrolloffset==0);ui_popup_block_scrolltest(&b);
 assert(!b.flag&&drawn(b)==9);
 for(int i=0;i<10000;++i){b.flag=UI_BLOCK_CLIPBOTTOM|UI_BLOCK_CLIPTOP;
  b.buttons[i%9]->flag|=UI_SCROLLED;handle.scrolloffset=70;
  refresh_scroll(&b,&handle);ui_popup_block_scrolltest(&b);
  assert(!b.flag&&drawn(b)==9&&handle.scrolloffset==0);
 }
 // Merely sharing full-label style cannot change an unrelated native popup.
 b.pie_data.flags=0;ui_popup_block_scrolltest(&b);assert(b.flag&UI_BLOCK_CLIPBOTTOM);
}
'''.replace('SCROLL_SOURCE_HERE', scroll).replace('REFRESH', refresh))


if __name__ == '__main__':
    unittest.main()
