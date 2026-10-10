"""Characterize current GHOST->WM flag conversion and pinned paint release semantics.

Exact button constructor, WM conversion prefix and native release branch execute. Native handler replacement,
paint geometry, allocations and Line finalization are modeled. This is an audit
of legacy completion, not a corrected Pencil stream or device acceptance.
"""
from pathlib import Path
import unittest
import preflight,test_ipad_panels
from test_compact_shelf import function
from test_touch_extrude import changed_source
REPO=Path(__file__).resolve().parents[1]
COMMON=r"""
#include <cassert>
#include <array>
#include <cstdint>
using GHOST_TEventType=int;using GHOST_TButton=int;
struct GHOST_IWindow{};struct GHOST_TabletData{float pressure=1;};
struct GHOST_TEventButtonData{GHOST_TButton button;GHOST_TabletData tablet;bool is_cancelled,is_direct_tool;uint64_t ipad_hud_generation,ipad_hud_serial;bool is_direct_finger=false;uint64_t ipad_finger_paint_generation=0;};
struct GHOST_Event{void*data_=nullptr;GHOST_Event(uint64_t,int,GHOST_IWindow*){};};
enum{GHOST_kEventButtonDown=1,GHOST_kEventButtonUp=2,LEFTMOUSE=3,MIDDLEMOUSE=4,KM_PRESS=5,KM_RELEASE=6,WM_EVENT_IS_DIRECT_TOOL=8,WM_EVENT_IS_POINTER_CANCEL=16,WM_EVENT_IS_DIRECT_FINGER=256,OPERATOR_FINISHED=1,OPERATOR_RUNNING_MODAL=2};
struct wmEvent{int type=0,val=0,flag=0,mval[2]{4,7};uint64_t ipad_hud_generation=0,ipad_hud_serial=0;};
int wm_event_type_from_ghost_button(int,int){return LEFTMOUSE;}
struct bContext{};struct wmOperator{int lifetime;};
struct PaintStroke{int event_type=LEFTMOUSE;int line_finishes=0,completed=0,owner=0;};
using float2=std::array<float,2>;using wmOperatorStatus=int;
void paint_stroke_line_constrain(PaintStroke*,float2){}
void paint_stroke_line_end(bContext*,wmOperator*op,PaintStroke*stroke,float2){assert(op->lifetime==stroke->owner);++stroke->line_finishes;}
void stroke_done(bContext*,wmOperator*op,PaintStroke*stroke){assert(op->lifetime==stroke->owner);++stroke->completed;}
"""
class PaintTerminalContractTests(unittest.TestCase):
 @classmethod
 def setUpClass(cls):
  header=changed_source('intern/ghost/intern/GHOST_EventButton.hh')
  cls.constructor=header[header.index('class GHOST_EventButton :'):]
  wm=changed_source('source/blender/windowmanager/intern/wm_event_system.cc')
  start=wm.index('      /* Get value and type from GHOST.')
  cls.convert=wm[start:wm.index('      /* Get tablet data. */',start)]
  pin=preflight.pinned_commit(REPO)
  generic=preflight.get_source(pin,'source/blender/editors/sculpt_paint/paint_stroke.cc',REPO/'.cache/preflight',False).decode('utf-8')
  modal=function(generic,'wmOperatorStatus paint_stroke_modal(')
  start=modal.index('  float2 mouse;\n  if (event->type == stroke->event_type && !first_modal)')
  cls.release=modal[start:modal.index('  else if (ELEM(event->type, EVT_RETKEY, EVT_SPACEKEY))',start)]
 def run_cpp(self,main):
  native_convert='wmEvent convert(const GHOST_TEventButtonData *bd,int type){wmEvent event;'+self.convert+'return event;}\n'
  native_release='wmOperatorStatus consume(bContext*C,wmOperator*op,const wmEvent*event,PaintStroke**stroke_p){auto*stroke=*stroke_p;bool first_modal=false;'+self.release+'return OPERATOR_RUNNING_MODAL;}\n'
  test_ipad_panels.IPadWorkspacePanelsTests()._run_source(COMMON+self.constructor+native_convert+native_release+main)
 def test_pointer_cancel_flag_is_not_paint_rollback(self):
  self.run_cpp(r"""
int main(){GHOST_IWindow window;for(bool cancelled:{false,true}){
 GHOST_EventButton packet(1,GHOST_kEventButtonUp,&window,LEFTMOUSE,GHOST_TabletData{},cancelled);
 auto*bd=static_cast<GHOST_TEventButtonData*>(packet.data_);auto event=convert(bd,GHOST_kEventButtonUp);
 assert(event.val==KM_RELEASE&&event.type==LEFTMOUSE&&!event.ipad_hud_serial&&!event.ipad_hud_generation);
 assert(bool(event.flag&WM_EVENT_IS_POINTER_CANCEL)==cancelled);
 bContext C;wmOperator op{41};PaintStroke stroke;stroke.owner=41;PaintStroke*active=&stroke;
 assert(consume(&C,&op,&event,&active)==OPERATOR_FINISHED&&!active);
 assert(stroke.line_finishes==1&&stroke.completed==1);
}}
""")
 def test_legacy_release_cannot_distinguish_replacement_stroke_owner(self):
  self.run_cpp(r"""
int main(){GHOST_IWindow window;GHOST_EventButton old_packet(1,GHOST_kEventButtonUp,&window,LEFTMOUSE,GHOST_TabletData{},true);
 auto event=convert(static_cast<GHOST_TEventButtonData*>(old_packet.data_),GHOST_kEventButtonUp);
 // Native handler replacement is modeled deliberately: the unleased release reaches a new active stroke.
 bContext C;wmOperator replacement{99};PaintStroke stroke;stroke.owner=99;PaintStroke*active=&stroke;
 assert(consume(&C,&replacement,&event,&active)==OPERATOR_FINISHED&&!active);
 assert(stroke.line_finishes==1&&stroke.completed==1);
}
""")

if __name__=='__main__':unittest.main()
