"""Audit actual canvas blit and legacy WM button delivery ordering.

These checks characterize connected native code. GPU completion, pointer-state
internals and cross-window hit tests are modeled; no canvas/terminal fix exists.
"""
import unittest
from test_touch_extrude import changed_source
from test_compact_shelf import function
import test_ipad_panels

class PaintCanvasContractTests(unittest.TestCase):
 def test_actual_nonoverlap_canvas_blit_counts_cached_viewport_and_offscreen(self):
  source=changed_source('source/blender/windowmanager/intern/wm_draw.cc')
  blit=function(source,'static bool wm_draw_region_blit(')
  layers=function(source,'static void wm_draw_window_area_layer(')
  self.assertIn('if (region->overlap == false)',layers)
  self.assertIn('wm_draw_region_blit(region, view)',layers)
  self.assertLess(layers.index('wm_draw_region_blit(region, view)'),layers.index('wm_draw_region_blend_receipt'))
  test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#include <cassert>
#include <cstdint>
struct rcti{int xmin,ymin,xmax,ymax;};
struct GPUViewport{int texture_owner;};struct GPUOffscreen{int texture_owner;};
struct Buffer{GPUViewport *viewport;GPUOffscreen *offscreen;};
struct Runtime{Buffer *draw_buffer;};struct ARegion{Runtime *runtime;rcti winrct;};
int draws=0,last_view=-2,owner=-1,x=0,y=0;
void GPU_viewport_draw_to_screen(GPUViewport*v,int view,const rcti*r){++draws;last_view=view;owner=v->texture_owner;x=r->xmin;y=r->ymin;}
void GPU_offscreen_draw_to_screen(GPUOffscreen*v,int a,int b){++draws;owner=v->texture_owner;x=a;y=b;}
'''+blit+r'''
int main(){Runtime rt{nullptr};ARegion r{&rt,{3,4,700,800}};
 wm_draw_region_blit(&r,-1);assert(draws==0); // missing buffer presents nothing
 GPUViewport viewport{71};GPUOffscreen offscreen{81};Buffer buffer{&viewport,&offscreen};rt.draw_buffer=&buffer;
 for(int i=0;i<10000;++i){wm_draw_region_blit(&r,-1);assert(owner==71&&last_view==0&&x==3&&y==4);}
 wm_draw_region_blit(&r,1);assert(last_view==1); // stereo viewport remains native
 buffer.viewport=nullptr;wm_draw_region_blit(&r,1);assert(owner==81&&x==3&&y==4);
 assert(draws==10002);
 // GPU buffer owner remains old until actual texture replacement. No redraw or
 // desired mode/region flag is consulted by this native cached compositing path.
 viewport.texture_owner=72;buffer.viewport=&viewport;wm_draw_region_blit(&r,0);assert(owner==72);
}
''')
 def test_actual_button_branch_updates_pointer_before_optional_window_redirect(self):
  source=changed_source('source/blender/windowmanager/intern/wm_event_system.cc')
  start=source.index('    case GHOST_kEventButtonDown:',source.index('void wm_event_add_ghostevent('))
  end=source.index('    /* Keyboard. */',start)
  case=source[start:end]
  self.assertLess(case.index('wm_event_state_update_and_click_set'),case.index('wm_event_cursor_other_windows'))
  test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#include <cassert>
#include <cstdint>
#include <initializer_list>
using GHOST_TEventType=int;
enum{GHOST_kEventButtonDown=1,GHOST_kEventButtonUp=2,KM_PRESS=1,KM_RELEASE=2,MIDDLEMOUSE=3,LEFTMOUSE=4,WM_EVENT_IS_DIRECT_TOOL=8,WM_EVENT_IS_POINTER_CANCEL=16,WM_EVENT_IS_DIRECT_FINGER=256};
struct GHOST_TabletData{int value=0;};struct GHOST_TEventButtonData{int button;GHOST_TabletData tablet;bool is_cancelled,is_direct_tool;uint64_t ipad_hud_generation,ipad_hud_serial;bool is_direct_finger=false;uint64_t ipad_finger_paint_generation=0;};
struct wmEvent{int type=0,val=0,flag=0,modifier=0,keymodifier=0,prev_type=0,prev_val=0,xy[2]{3,4};GHOST_TabletData tablet;uint64_t ipad_hud_generation=0,ipad_hud_serial=0;};
struct wmWindow{wmEvent *eventstate;int delivered=0;wmEvent last{};};struct wmWindowManager{wmWindow *other;};
int updates=0,emulations=0,hit_tests=0;
int wm_event_type_from_ghost_button(int,int){return LEFTMOUSE;}
void wm_tablet_data_from_ghost(const GHOST_TabletData *a,GHOST_TabletData*b){*b=*a;}
void wm_eventemulation(wmEvent*,bool){++emulations;}
void wm_event_state_update_and_click_set(wmEvent*e,int,wmEvent*s,int*,int){++updates;s->type=e->type;s->val=e->val;}
wmWindow*wm_event_cursor_other_windows(wmWindowManager*wm,wmWindow*,wmEvent*){++hit_tests;return wm->other;}
void copy_v2_v2_int(int*d,const int*s){d[0]=s[0];d[1]=s[1];}
void wm_event_add_intern(wmWindow*w,wmEvent*e){++w->delivered;w->last=*e;}
void deliver(wmWindowManager*wm,wmWindow*win,int type,const GHOST_TEventButtonData*customdata){
 wmEvent event=*win->eventstate;int event_time_ms=0,previous=0;int*event_state_prev_press_time_ms_p=&previous;auto*event_state=win->eventstate;
 switch(type){
'''+case+r'''
 default:assert(false);}}
int main(){
 for(uint64_t destination_serial:{uint64_t(0),uint64_t(33)}){
  updates=emulations=hit_tests=0;wmEvent first,second;
  second.ipad_hud_serial=destination_serial;second.ipad_hud_generation=34;second.flag=64;
  wmWindow origin{&first},other{&second};wmWindowManager wm{&other};
  for(bool cancel:{false,true}){GHOST_TEventButtonData packet{1,{7},cancel,true,71,81};
   int was=updates;deliver(&wm,&origin,GHOST_kEventButtonUp,&packet);assert(updates==was+1&&first.val==KM_RELEASE);
   if(!cancel){assert(other.delivered==1&&origin.delivered==0);assert(other.last.tablet.value==7);
    assert(other.last.ipad_hud_serial==destination_serial&&other.last.ipad_hud_generation==34&&other.last.flag==64);}
   else{assert(origin.delivered==1&&origin.last.ipad_hud_serial==81);assert(origin.last.flag&WM_EVENT_IS_POINTER_CANCEL);}
  }
  assert(updates==2&&emulations==2&&hit_tests==1);
 }
 // Pointer mutation happened in origin even when normal release was redirected.
 // Destination fields may be zero or stale; neither copies the source provenance.
 // Semantic modal ownership and actual pointer internals are not executed here.
}
''')

if __name__=='__main__':unittest.main()
