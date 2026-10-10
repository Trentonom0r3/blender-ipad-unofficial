"""Execute Vertex Paint cancellation through the pinned generic stroke lifecycle.

Mode completion, generic cancel/free and the patched Vertex callback come from
pinned source. Data owners and notifier/timer boundaries are modeled; this does
not prove target UIKit/GHOST delivery or rollback of Vertex Paint values.
"""
from pathlib import Path
import unittest
import preflight
import test_ipad_panels
from test_compact_shelf import function
from test_touch_extrude import changed_source

REPO = Path(__file__).resolve().parents[1]
VERTEX = 'source/blender/editors/sculpt_paint/paint_vertex.cc'
STROKE = 'source/blender/editors/sculpt_paint/paint_stroke.cc'
COMMON = r"""
#include <cassert>
#include <cstdint>
struct StrokeCache { bool alt_smooth=false; };
struct SculptSession { StrokeCache *cache=nullptr; };
struct Object { SculptSession *sculpt=nullptr; };
struct ViewContext { Object *obact=nullptr; };
struct VPaintData { ViewContext vc; };
struct PaintRuntime { bool draw_anchored=true,stroke_active=true; float brush_rotation=2,brush_rotation_sec=3; };
namespace bke { using PaintRuntime=::PaintRuntime; }
struct Paint { PaintRuntime *runtime=nullptr; };
struct VPaint { Paint paint; };
struct ToolSettings { VPaint *vpaint=nullptr; };
struct RegionView3D { int rflag=16; };
struct Brush { struct {int brush_angle_mode=0;} mtex,mask_mtex; };
struct PaintStroke { Paint *paint=nullptr; Brush *brush=nullptr; bool stroke_started=false;
 void *timer=nullptr,*stroke_cursor=nullptr,*mode_data=nullptr;
 void (*redraw)(struct bContext*,PaintStroke*,bool)=nullptr;
 void (*done)(const struct bContext*,PaintStroke*)=nullptr; };
struct wmOperator { void *customdata=nullptr; };
struct bContext { Object *object=nullptr; ToolSettings *settings=nullptr;
 RegionView3D *rv3d=nullptr; void *manager=nullptr,*window=nullptr; };
enum { MTEX_ANGLE_RAKE=1,RV3D_PAINTING=16,NC_OBJECT=2,ND_DRAW=4 };
using eOverlayFlags=int;
int cache_frees=0,stroke_frees=0,smooth_restores=0,notifiers=0,status_clears=0;
int timer_frees=0,cursor_frees=0,overrides=0,final_redraws=0;
Object *CTX_data_active_object(const bContext*C){return C->object;}
ToolSettings *CTX_data_tool_settings(const bContext*C){return C->settings;}
RegionView3D *CTX_wm_region_view3d(const bContext*C){return C->rv3d;}
void *CTX_wm_manager(const bContext*C){return C->manager;}
void *CTX_wm_window(const bContext*C){return C->window;}
void *paint_stroke_mode_data(PaintStroke*s){return s->mode_data;}
bool print_pressure_status_enabled(){return true;}
void ED_workspace_status_text(bContext*,void*){++status_clears;}
void BKE_paint_set_overlay_override(eOverlayFlags){++overrides;}
void WM_event_timer_remove(void*,void*,void*){++timer_frees;}
struct wmPaintCursor{};
void WM_paint_cursor_end(wmPaintCursor*){++cursor_frees;}
void WM_event_add_notifier(const bContext*,int,Object*){++notifiers;}
void MEM_delete(StrokeCache *cache){if(cache){++cache_frees;delete cache;}}
void MEM_delete(PaintStroke *stroke){if(stroke){++stroke_frees;delete stroke;}}
namespace vwpaint { void smooth_brush_toggle_off(Paint*,StrokeCache*cache){
 assert(cache&&cache->alt_smooth);cache->alt_smooth=false;++smooth_restores;} }
"""

class VertexPaintCancelTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.vertex = changed_source(VERTEX)
        pin = preflight.pinned_commit(REPO)
        cls.generic = preflight.get_source(
            pin, STROKE, REPO / '.cache/preflight', False).decode('utf-8')
        cls.bodies = '\n'.join((
            function(cls.vertex, 'static void vpaint_stroke_done('),
            function(cls.generic, 'void paint_stroke_free('),
            function(cls.generic, 'static void stroke_done('),
            function(cls.generic, 'void paint_stroke_cancel('),
            function(cls.vertex, 'static void vpaint_cancel('),
        ))

    def run_cpp(self, main):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(
            COMMON + self.bodies + main)

    def test_started_cancel_restores_alt_smooth_before_single_cache_free(self):
        self.run_cpp(r"""
int main(){
 for(int i=0;i<1000;++i){
  cache_frees=stroke_frees=smooth_restores=notifiers=status_clears=0;
  timer_frees=cursor_frees=overrides=final_redraws=0;
  PaintRuntime runtime;Paint paint{&runtime};Brush brush;
  VPaint vp{paint};ToolSettings settings{&vp};
  SculptSession session{new StrokeCache{true}};Object object{&session};
  VPaintData data{{&object}};RegionView3D rv3d;
  bContext C{&object,&settings,&rv3d};
  PaintStroke *stroke=new PaintStroke{&paint,&brush,true,nullptr,nullptr,&data,nullptr,vpaint_stroke_done};
  wmOperator op{stroke};
  vpaint_cancel(&C,&op);op.customdata=nullptr;
  assert(!session.cache&&cache_frees==1&&smooth_restores==1);
  assert(stroke_frees==1&&notifiers==1&&status_clears==1);
  assert(!(rv3d.rflag&RV3D_PAINTING)&&!runtime.draw_anchored&&!runtime.stroke_active);
 }
}
""")

    def test_unstarted_cancel_preserves_unowned_cache(self):
        self.run_cpp(r"""
int main(){
 StrokeCache *existing=new StrokeCache{true};
 PaintRuntime runtime;Paint paint{&runtime};Brush brush;
 VPaint vp{paint};ToolSettings settings{&vp};
 SculptSession session{existing};Object object{&session};
 VPaintData data{{&object}};RegionView3D rv3d;
 bContext C{&object,&settings,&rv3d};
 PaintStroke *stroke=new PaintStroke{&paint,&brush,false,nullptr,nullptr,&data,nullptr,vpaint_stroke_done};
 wmOperator op{stroke};
 vpaint_cancel(&C,&op);op.customdata=nullptr;
 assert(session.cache==existing&&cache_frees==0&&!smooth_restores&&!notifiers);
 assert(stroke_frees==1&&status_clears==1&&!runtime.stroke_active);
 delete existing;session.cache=nullptr;
}
""")

    def test_vertex_cancel_leaves_cache_ownership_to_started_completion(self):
        cancel = function(self.vertex, 'static void vpaint_cancel(')
        done = function(self.vertex, 'static void vpaint_stroke_done(')
        self.assertNotIn('MEM_delete(ob.sculpt->cache)', cancel)
        self.assertIn('paint_stroke_cancel(C, op, (PaintStroke *)op->customdata);', cancel)
        self.assertIn('if (ss.cache && ss.cache->alt_smooth)', done)
        self.assertIn('MEM_delete(ob.sculpt->cache);', done)
        self.assertIn('ot->cancel = vpaint_cancel;', self.vertex)

if __name__=='__main__':
 unittest.main(verbosity=2)