"""Execute the HUD first-layout context contract and native animation consumer.

Owner/layout functions come from the current shipped patch/review source. Pinned
native setter and panel-animation bodies are copied unchanged below. Reference
adapters only match the existing owner's fixture bContext representation; Python
context-dictionary invalidation is excluded. WM/list/timer/GPU accessors remain
fixture boundaries. This is not evidence that the iPad binary launches.
"""
import hashlib
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
import unittest

_here = Path(__file__).resolve().parent
repo = _here.parent
if not (repo / 'patches/blender-ipad.patch').is_file():
    repo = Path(os.environ.get('BLENDER_IPAD_REPO_ROOT',
                              'D:/dev/Projects/Repos/blendpad/blender-ipad-unofficial'))
sys.path.insert(0, str(repo / 'build'))
sys.path.insert(0, str(_here))
import test_pencil_hud_presentation as hud
from test_compact_shelf import function

# Exact d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e/context.cc setter bodies and
# interface_panel.cc panel_handle_data_ensure/panel_activate_state bodies.
PIN_SETTERS = 'void CTX_wm_area_set(bContext *C, ScrArea *area)\n{\n  C->wm.area = area;\n  C->wm.region = nullptr;\n\n#ifdef WITH_PYTHON\n  if (C->data.py_context != nullptr) {\n    const char *members[] = {PYCTX_AREA_MEMBERS};\n    BPY_context_dict_clear_members_array(\n        &C->data.py_context, C->data.py_context_orig, members, ARRAY_SIZE(members));\n  }\n#endif\n}\nvoid CTX_wm_region_set(bContext *C, ARegion *region)\n{\n  C->wm.region = region;\n\n#ifdef WITH_PYTHON\n  if (C->data.py_context != nullptr) {\n    const char *members[] = {PYCTX_REGION_MEMBERS};\n    BPY_context_dict_clear_members_array(\n        &C->data.py_context, C->data.py_context_orig, members, ARRAY_SIZE(members));\n  }\n#endif\n}'
PIN_ANIMATION = 'static void panel_handle_data_ensure(const bContext *C,\n                                     wmWindow *win,\n                                     const ARegion *region,\n                                     Panel *panel,\n                                     const uiHandlePanelState state)\n{\n  BLI_assert(ELEM(state, PANEL_STATE_DRAG, PANEL_STATE_ANIMATION));\n\n  if (panel->activedata == nullptr) {\n    panel->activedata = MEM_callocN(sizeof(uiHandlePanelData), __func__);\n    WM_event_add_ui_handler(C,\n                            &win->modalhandlers,\n                            ui_handler_panel,\n                            ui_handler_remove_panel,\n                            panel,\n                            eWM_EventHandlerFlag(0));\n  }\n\n  uiHandlePanelData *data = static_cast<uiHandlePanelData *>(panel->activedata);\n\n  /* Only create a new timer if necessary. Reuse can occur when PANEL_STATE_ANIMATION follows\n   * PANEL_STATE_DRAG for example (i.e. panel->activedata was present already). */\n  if (!data->animtimer) {\n    data->animtimer = WM_event_timer_add(CTX_wm_manager(C), win, TIMER, ANIMATION_INTERVAL);\n  }\n\n  data->state = state;\n  data->startx = win->eventstate->xy[0];\n  data->starty = win->eventstate->xy[1];\n  data->startofsx = panel->ofsx;\n  data->startofsy = panel->ofsy;\n  data->start_cur_xmin = region->v2d.cur.xmin;\n  data->start_cur_ymin = region->v2d.cur.ymin;\n  data->starttime = BLI_time_now_seconds();\n}\nstatic void panel_activate_state(const bContext *C, Panel *panel, const uiHandlePanelState state)\n{\n  uiHandlePanelData *data = static_cast<uiHandlePanelData *>(panel->activedata);\n  wmWindow *win = CTX_wm_window(C);\n  ARegion *region = CTX_wm_region(C);\n\n  if (data != nullptr && data->state == state) {\n    return;\n  }\n\n  if (state == PANEL_STATE_DRAG) {\n    panel_custom_data_active_set(panel);\n\n    panel_set_flag_recursive(panel, PNL_SELECT, true);\n    panel_set_runtime_flag_recursive(panel, PANEL_IS_DRAG_DROP, true);\n\n    panel_handle_data_ensure(C, win, region, panel, state);\n\n    /* Initiate edge panning during drags for scrolling beyond the initial region view. */\n    wmOperatorType *ot = WM_operatortype_find("VIEW2D_OT_edge_pan", true);\n    ui_handle_afterfunc_add_operator(ot, blender::wm::OpCallContext::InvokeDefault);\n  }\n  else if (state == PANEL_STATE_ANIMATION) {\n    panel_set_flag_recursive(panel, PNL_SELECT, false);\n\n    panel_handle_data_ensure(C, win, region, panel, state);\n  }\n  else if (state == PANEL_STATE_EXIT) {\n    panel_set_runtime_flag_recursive(panel, PANEL_IS_DRAG_DROP, false);\n\n    BLI_assert(data != nullptr);\n\n    if (data->animtimer) {\n      WM_event_timer_remove(CTX_wm_manager(C), win, data->animtimer);\n      data->animtimer = nullptr;\n    }\n\n    MEM_freeN(data);\n    panel->activedata = nullptr;\n\n    WM_event_remove_ui_handler(\n        &win->modalhandlers, ui_handler_panel, ui_handler_remove_panel, panel, false);\n  }\n\n  ED_region_tag_redraw(region);\n}'
PIN_SHA256 = '549d4b2f7a0922624bb2d0430979214f12837013150a20fc0d3a807041ca83f4'
OLD_OWNER_CAPTURE = 'static bool ipad_hud_owner_capture(bContext *C, wmWindow *win, ScrArea *area,\n                                    ARegion *hud, IPadHUDOwner &owner)\n{\n  owner = {};\n  if (!ipad_hud_window_live(C, win)) return false;\n  bScreen *screen = WM_window_get_active_screen(win);\n  if (!screen || !ED_ipad_panels_enabled(screen) || !area ||\n      BLI_findindex(&screen->areabase, area) == -1 || !hud ||\n      BLI_findindex(&area->regionbase, hud) == -1 || hud->regiontype != RGN_TYPE_HUD ||\n      !hud->runtime->ipad_hud_content_lifetime || area->spacetype != SPACE_VIEW3D ||\n      !ED_ipad_panels_area_visible(area) || !hud->runtime->visible ||\n      (hud->flag & (RGN_FLAG_HIDDEN | RGN_FLAG_HIDDEN_BY_USER | RGN_FLAG_TOO_SMALL |\n                    RGN_FLAG_POLL_FAILED))) return false;\n  /* This function resolves only fresh list members. Never cast an old receipt\n   * address back into a region. The corner lifecycle owns quad-view selection. */\n  ScrArea *previous_area = CTX_wm_area(C);\n  ARegion *previous_region = CTX_wm_region(C);\n  CTX_wm_area_set(C, area);\n  ARegion *window = UI_ipad_corner_hud_window(C, area, hud);\n  if (!window || BLI_findindex(&area->regionbase, window) == -1 ||\n      window->regiontype != RGN_TYPE_WINDOW || !window->runtime->visible) {\n    CTX_wm_region_set(C, previous_region);\n    CTX_wm_area_set(C, previous_area);\n    return false;\n  }\n  CTX_wm_region_set(C, window);\n  const bool captured = UI_ipad_context_capture(C, owner.context.data()) &&\n                        owner.context[1] == uint64_t(uintptr_t(win));\n  if (captured) {\n    const bToolRef *tool = WM_toolsystem_ref_from_context(C);\n    BLI_strncpy(owner.tool.data(), tool ? tool->idname : "", owner.tool.size());\n    const wmWindowManager *wm = CTX_wm_manager(C);\n    const UndoStack *undo = wm->runtime ? wm->runtime->undo_stack : nullptr;\n    if (undo) {\n      owner.undo_address = uint64_t(uintptr_t(undo));\n      owner.undo_lifetime = undo->ipad_lifetime_id;\n      owner.undo_mutation = undo->ipad_mutation_generation;\n    }\n    if (wmOperator *redo = WM_operator_last_redo(C)) {\n      if (BLI_findindex(&wm->runtime->operators, redo) == -1) {\n        CTX_wm_region_set(C, previous_region); CTX_wm_area_set(C, previous_area); return false;\n      }\n      wmOperatorType *registered_type = nullptr;\n      for (wmOperatorType *type : WM_operatortypes_registered_get()) {\n        if (type == redo->type) { registered_type = type; break; }\n      }\n      if (!registered_type || !registered_type->ipad_lifetime_id) {\n        CTX_wm_region_set(C, previous_region); CTX_wm_area_set(C, previous_area); return false;\n      }\n      owner.redo_address = uint64_t(uintptr_t(redo));\n      owner.redo_lifetime = WM_operator_touch_lifetime_id(redo);\n      owner.redo_type_address = uint64_t(uintptr_t(registered_type));\n      owner.redo_type_lifetime = registered_type->ipad_lifetime_id;\n      if (!owner.redo_lifetime) {\n        CTX_wm_region_set(C, previous_region); CTX_wm_area_set(C, previous_area); return false;\n      }\n    }\n    owner.hud_address = uint64_t(uintptr_t(hud));\n    owner.hud_lifetime = hud->runtime->ipad_hud_content_lifetime;\n    owner.buffer_address = uint64_t(uintptr_t(hud->runtime->draw_buffer));\n    owner.region_rect = hud->winrct;\n    owner.window_width = WM_window_native_pixel_x(win);\n    owner.window_height = WM_window_native_pixel_y(win);\n    owner.ui_scale = UI_SCALE_FAC;\n    owner.valid = true;\n  }\n  CTX_wm_region_set(C, previous_region);\n  CTX_wm_area_set(C, previous_area);\n  return captured;\n}'


PANEL_WORLD = r"""
#include <cstdlib>
#include <stdexcept>
enum uiHandlePanelState{PANEL_STATE_DRAG=1,PANEL_STATE_ANIMATION=2,PANEL_STATE_EXIT=3};
struct wmTimer{};wmTimer native_timer;
struct uiHandlePanelData{uiHandlePanelState state;wmTimer *animtimer;int startx,starty,startofsx,startofsy;float start_cur_xmin,start_cur_ymin;double starttime;};
struct Panel{void *activedata=nullptr;int ofsx=5,ofsy=6;};
constexpr int PNL_SELECT=1,PANEL_IS_DRAG_DROP=2,TIMER=3;
constexpr double ANIMATION_INTERVAL=.02;
#define BLI_assert(v) assert(v)
#define ELEM(v,a,b) ((v)==(a)||(v)==(b))
void *MEM_callocN(size_t size,const char*){return std::calloc(1,size);}
void MEM_freeN(void *p){std::free(p);}
int ui_handler_panel(){return 0;}
void ui_handler_remove_panel(bContext*,void*){}
enum eWM_EventHandlerFlag{HANDLER_ZERO=0};
int animation_handlers=0,animation_timers=0;
template<class F,class G>void WM_event_add_ui_handler(const bContext*,std::vector<int>*,F,G,Panel*,eWM_EventHandlerFlag){++animation_handlers;}
template<class F,class G>void WM_event_remove_ui_handler(std::vector<int>*,F,G,Panel*,bool){--animation_handlers;}
wmTimer *WM_event_timer_add(wmWindowManager*,wmWindow*,int,double){++animation_timers;return &native_timer;}
void WM_event_timer_remove(wmWindowManager*,wmWindow*,wmTimer*){--animation_timers;}
double BLI_time_now_seconds(){return 1.25;}
void panel_custom_data_active_set(Panel*){}
void panel_set_flag_recursive(Panel*,int,bool){}
void panel_set_runtime_flag_recursive(Panel*,int,bool){}
wmOperatorType *WM_operatortype_find(const char*,bool){return nullptr;}
namespace blender::wm{enum class OpCallContext{InvokeDefault};}
void ui_handle_afterfunc_add_operator(wmOperatorType*,blender::wm::OpCallContext){}
"""

SETUP = r"""
struct Fixture{
 RegionRuntime hr,cr,oldrt;ARegion hud,canvas,prior_region,alien_region;ScrArea area,prior_area;
 bScreen screen;wmEvent event;wmWindow win;UndoStack undo;WMRuntime runtime;wmWindowManager wm;
 wmOperatorType type;wmOperator op;bContext C;
 wmWindow *arg_win;ScrArea *arg_area;ARegion *arg_hud;
 Fixture():runtime{&undo},wm{{&win},&runtime},op{&type},C{&wm,&win,&area,&hud,&canvas,{},true,101,201,0}{
  hr.ipad_hud_content_lifetime=31;hud.runtime=&hr;hud.winrct={10,160,20,180};hud.v2d.cur={7,9,11,13};
  canvas.runtime=&cr;canvas.regiontype=RGN_TYPE_WINDOW;canvas.v2d.cur={101,102,201,202};
  prior_region.runtime=&oldrt;prior_region.regiontype=RGN_TYPE_WINDOW;alien_region.runtime=&oldrt;
  area.regionbase={&hud,&canvas};prior_area.regionbase={&prior_region};screen.areabase={&area,&prior_area};
  win.screen=&screen;win.eventstate=&event;arg_win=&win;arg_area=&area;arg_hud=&hud;
  C.valid=true;wrong_context_window=false;last_redo_override=nullptr;registered_types={&type};
 }
};
void animation_after_capture(Fixture &f){
 // Deterministic native consumer contract instead of deliberately crashing this host process.
 if(CTX_wm_area(&f.C)!=&f.area || CTX_wm_region(&f.C)!=&f.hud)
  throw std::runtime_error("first-layout animation requires its HUD context");
 Panel panel;panel_activate_state(&f.C,&panel,PANEL_STATE_ANIMATION);
 auto *data=static_cast<uiHandlePanelData*>(panel.activedata);
 assert(data&&data->start_cur_xmin==7&&data->start_cur_ymin==11);
 assert(data->startx==13&&data->starty==17);
 panel_activate_state(&f.C,&panel,PANEL_STATE_EXIT);assert(!panel.activedata);
}
"""


def prefix(old=False):
    world = hud.WORLD
    # Native bodies see an exact wm.area/wm.region representation; references adapt
    # only the existing receipt fixture's separate scalar slots, without changing setters.
    area_stub = re.search(r'void CTX_wm_area_set[^\n]*\n', world).group(0)
    region_stub = re.search(r'void CTX_wm_region_set[^\n]*\n', world).group(0)
    setters = ('namespace native_context {\n'
               'struct bContext{struct{ScrArea *&area;ARegion *&region;}wm;};\n' +
               PIN_SETTERS + '\n}\n'
               'void CTX_wm_area_set(bContext *C,ScrArea *area){native_context::bContext adapter{{C->area,C->region}};native_context::CTX_wm_area_set(&adapter,area);}\n'
               'void CTX_wm_region_set(bContext *C,ARegion *region){native_context::bContext adapter{{C->area,C->region}};native_context::CTX_wm_region_set(&adapter,region);}\n')
    world = world.replace(area_stub, setters).replace(region_stub, '')
    world = world.replace('struct ARegion{', 'struct View2D{rctf cur;};\nstruct ARegion{') if 'struct ARegion{' in world else world.replace('struct ARegion {', 'struct View2D{rctf cur;};\nstruct ARegion {')
    world = world.replace('rcti winrct;};', 'rcti winrct;View2D v2d;};')
    world = world.replace('struct wmWindow{', 'struct wmEvent{int xy[2]={13,17};};\nstruct wmWindow{')
    world = world.replace('bScreen *screen;};', 'bScreen *screen;wmEvent *eventstate=nullptr;std::vector<int> modalhandlers;};')
    for name in ('CTX_wm_manager', 'CTX_wm_window', 'CTX_wm_area', 'CTX_wm_region'):
        world = world.replace(name + '(bContext *C)', name + '(const bContext *C)')
    world = world.replace('bool UI_ipad_context_capture(', 'bool fixture_context_capture(', 1)
    world += ('\nbool wrong_context_window=false;\n'
              'bool UI_ipad_context_capture(bContext *C,uint64_t *v){bool ok=fixture_context_capture(C,v);if(ok&&wrong_context_window)v[1]=999;return ok;}\n')
    world = world.replace('wmOperator *WM_operator_last_redo(', 'wmOperator *fixture_last_redo(', 1)
    world += ('wmOperator *last_redo_override=nullptr;\n'
              'wmOperator *WM_operator_last_redo(const bContext *C){return last_redo_override?last_redo_override:fixture_last_redo(C);}\n')
    current = hud.compiled_prefix().replace(hud.WORLD, world, 1)
    if old:
        capture = function(current, 'static bool ipad_hud_owner_capture(')
        current = current.replace(capture, OLD_OWNER_CAPTURE.strip(), 1)
    return current + PANEL_WORLD + PIN_ANIMATION + SETUP


class PencilHUDLaunchTests(unittest.TestCase):
    def run_native(self, body, old=False, expected=0):
        candidates = [shutil.which('clang++'), shutil.which('g++')]
        if os.name == 'nt':
            candidates += [r'C:\Program Files\LLVM\bin\clang++.exe',
                           r'C:\Program Files\Microsoft Visual Studio\18\Insiders\VC\Tools\Llvm\x64\bin\clang++.exe']
        compiler = next((p for p in candidates if p and Path(p).is_file()), None)
        if not compiler:
            self.skipTest('C++17 compiler unavailable; launch-context code was not executed')
        with tempfile.TemporaryDirectory(prefix='pencil-hud-launch-') as directory:
            work = Path(directory); cpp = work / 'test.cc'; binary = work / ('test.exe' if os.name == 'nt' else 'test')
            cpp.write_text(prefix(old) + body, encoding='utf-8')
            result = subprocess.run([compiler, '-std=c++17', '-Wall', '-Wextra', '-Werror',
                                     '-pedantic', str(cpp), '-o', str(binary)],
                                    cwd=work, capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            result = subprocess.run([str(binary)], cwd=work, capture_output=True, text=True)
            self.assertEqual(result.returncode, expected, result.stdout + result.stderr)

    def test_first_layout_preserves_hud_before_actual_native_animation(self):
        self.run_native(r"""
int main(){Fixture f;
 CTX_wm_area_set(&f.C,&f.area);assert(CTX_wm_region(&f.C)==nullptr);CTX_wm_region_set(&f.C,&f.hud);
 ED_ipad_hud_layout_begin(&f.C,&f.win,&f.area,&f.hud);animation_after_capture(f);
 ED_ipad_hud_layout_end(&f.C,&f.win,&f.area,&f.hud);animation_after_capture(f);
 ED_ipad_hud_draw_end(&f.C,&f.win,&f.area,&f.hud);animation_after_capture(f);
 assert(ipad_hud_contents.at(f.hr.ipad_hud_content_lifetime).texture.valid);
 assert(animation_handlers==0&&animation_timers==0);
}
""")

    def test_success_and_callback_free_refusal_paths_preserve_caller_context(self):
        self.run_native(r"""
int main(){
 {Fixture f;f.C.area=&f.prior_area;f.C.region=&f.prior_region;IPadHUDOwner owner;
  assert(ipad_hud_owner_capture(&f.C,&f.win,&f.area,&f.hud,owner));
  assert(f.C.area==&f.prior_area&&f.C.region==&f.prior_region&&owner.valid);}
 for(int kind=0;kind<31;++kind){Fixture f;IPadHUDOwner owner;owner.valid=true;
  ScrArea *saved_area=f.C.area;ARegion *saved_region=f.C.region;
  switch(kind){
   case 0:f.C.wm=nullptr;break;case 1:f.arg_win=nullptr;break;case 2:f.wm.windows.clear();break;
   case 3:f.win.screen=nullptr;break;case 4:f.screen.enabled=false;break;case 5:f.arg_area=nullptr;break;
   case 6:f.screen.areabase.clear();break;case 7:f.arg_hud=nullptr;break;
   case 8:f.area.regionbase.erase(f.area.regionbase.begin());break;case 9:f.hud.regiontype=RGN_TYPE_WINDOW;break;
   case 10:f.hr.ipad_hud_content_lifetime=0;break;case 11:f.area.spacetype=99;break;
   case 12:f.area.visible=false;break;case 13:f.hr.visible=false;break;
   case 14:f.hud.flag=RGN_FLAG_HIDDEN;break;case 15:f.hud.flag=RGN_FLAG_HIDDEN_BY_USER;break;
   case 16:f.hud.flag=RGN_FLAG_TOO_SMALL;break;case 17:f.hud.flag=RGN_FLAG_POLL_FAILED;break;
   case 18:f.C.origin=nullptr;break;case 19:f.C.origin=&f.alien_region;break;
   case 20:f.canvas.regiontype=RGN_TYPE_HUD;break;case 21:f.cr.visible=false;break;
   case 22:f.C.valid=false;break;case 23:wrong_context_window=true;break;
   case 24:last_redo_override=&f.op;break;
   case 25:last_redo_override=&f.op;f.runtime.operators={&f.op};registered_types.clear();break;
   case 26:last_redo_override=&f.op;f.runtime.operators={&f.op};f.type.ipad_lifetime_id=0;break;
   case 27:last_redo_override=&f.op;f.runtime.operators={&f.op};f.op.lifetime=0;break;
   case 28:f.C.area=&f.prior_area;f.C.region=&f.prior_region;saved_area=&f.prior_area;saved_region=&f.prior_region;f.C.origin=nullptr;break;
   case 29:f.C.area=&f.prior_area;f.C.region=&f.prior_region;saved_area=&f.prior_area;saved_region=&f.prior_region;f.C.valid=false;break;
   case 30:f.C.area=&f.prior_area;f.C.region=&f.prior_region;saved_area=&f.prior_area;saved_region=&f.prior_region;last_redo_override=&f.op;break;
  }
  assert(!ipad_hud_owner_capture(&f.C,f.arg_win,f.arg_area,f.arg_hud,owner));
  assert(!owner.valid&&f.C.area==saved_area&&f.C.region==saved_region);
 }
}
""")

    def test_failed_source_is_negative_control_for_first_layout(self):
        # Preserve the exact failed capture body: return81 at its broken native
        # animation precondition rather than intentionally dereference null.
        self.run_native(r"""
int main(){Fixture f;ED_ipad_hud_layout_begin(&f.C,&f.win,&f.area,&f.hud);
 try{animation_after_capture(f);}catch(const std::runtime_error&){return 81;}return 0;}
""", old=True, expected=81)

    def test_native_bodies_and_first_layout_call_order(self):
        self.assertEqual(hashlib.sha256((PIN_SETTERS+'\n'+PIN_ANIMATION).encode()).hexdigest(), PIN_SHA256)
        self.assertIn('C->wm.region = nullptr;', PIN_SETTERS)
        self.assertIn('ARegion *region = CTX_wm_region(C);', PIN_ANIMATION)
        self.assertIn('data->start_cur_xmin = region->v2d.cur.xmin;', PIN_ANIMATION)
        draw = function(hud.DRAW, 'static void wm_draw_area_offscreen(')
        layout = draw[draw.index('/* Compute UI layouts'):draw.index('ED_area_update_region_sizes(')]
        self.assertLess(layout.index('CTX_wm_region_set(C, region)'), layout.index('ED_ipad_hud_layout_begin('))
        self.assertLess(layout.index('ED_ipad_hud_layout_begin('), layout.index('ED_region_do_layout('))
        self.assertLess(layout.index('ED_region_do_layout('), layout.index('ED_ipad_hud_layout_end('))
        self.assertLess(layout.index('ED_ipad_hud_layout_end('), layout.index('CTX_wm_region_set(C, nullptr)'))


if __name__ == '__main__':
    unittest.main()
