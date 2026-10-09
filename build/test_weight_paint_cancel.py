"""Execute patched Weight Paint cancel against exact pinned completion/free code.

Native function bodies are source-backed. Allocation, context, brush switching,
timer/cursor and notifier boundaries are modeled; this does not prove rollback,
UIKit delivery or device acceptance. The cache wrapper catches the old null access
before dereferencing it, so the negative test does not deliberately crash.
"""
from pathlib import Path
import unittest
import preflight
import test_ipad_panels
from test_compact_shelf import function
from test_touch_extrude import changed_source

REPO=Path(__file__).resolve().parents[1]
WEIGHT='source/blender/editors/sculpt_paint/paint_weight.cc'
STROKE='source/blender/editors/sculpt_paint/paint_stroke.cc'
COMMON=r"""
#include <cassert>
#include <stdexcept>
#include <initializer_list>
struct ID{};
struct StrokeCache{bool alt_smooth=false;};
struct CheckedCache{StrokeCache *value=nullptr;
 StrokeCache *operator->() const{if(!value)throw std::runtime_error("null cache");return value;}
 CheckedCache& operator=(std::nullptr_t){value=nullptr;return *this;}};
int cache_frees=0,stroke_frees=0,mode_frees=0,timer_frees=0,cursor_frees=0;
int smooth_restores=0,notifiers=0,tags=0,status_clears=0,redraws=0;
struct ParticleSystem{ParticleSystem*next=nullptr;int vgroup[2]{0,2};int recalc=0;};
struct ListBase{ParticleSystem *first=nullptr;};
#define LISTBASE_FOREACH(type, name, list) for(type name=(list)->first;name;name=name->next)
#define PSYS_TOT_VG 2
#define ID_RECALC_PSYS_RESET 8
#define NC_OBJECT 2
#define ND_DRAW 4
#define RV3D_PAINTING 16
#define MTEX_ANGLE_RAKE 32
struct SculptSession{CheckedCache cache;};
struct Object{SculptSession *sculpt;ListBase particlesystem;void *data;};
struct PaintRuntime{bool draw_anchored=true,stroke_active=true;float brush_rotation=3,brush_rotation_sec=4;};
namespace bke{using PaintRuntime=::PaintRuntime;}
struct Paint{PaintRuntime *runtime;};struct VPaint{Paint paint;};
struct ToolSettings{VPaint *wpaint;};
struct Brush{struct{int brush_angle_mode=0;}mtex,mask_mtex;};
struct RegionView3D{int rflag=RV3D_PAINTING;};
struct bContext{Object *object;ToolSettings *settings;RegionView3D *rv3d;};
struct wmOperator{void *customdata=nullptr;};
struct PaintStroke{Paint *paint;Brush *brush;bool stroke_started;void *timer,*stroke_cursor;
 void(*redraw)(bContext*,PaintStroke*,bool)=nullptr;
 void(*done)(const bContext*,PaintStroke*)=nullptr;
 ~PaintStroke(){if(stroke_started)++mode_frees;}};
Object *CTX_data_active_object(const bContext*C){return C->object;}
ToolSettings *CTX_data_tool_settings(const bContext*C){return C->settings;}
RegionView3D *CTX_wm_region_view3d(const bContext*C){return C->rv3d;}
void *CTX_wm_manager(const bContext*){return nullptr;}void *CTX_wm_window(const bContext*){return nullptr;}
void MEM_delete(CheckedCache cache){if(cache.value){++cache_frees;delete cache.value;}}
void MEM_delete(PaintStroke *stroke){++stroke_frees;delete stroke;}
namespace vwpaint{void smooth_brush_toggle_off(Paint*p,CheckedCache cache){
 assert(p&&cache.value&&cache->alt_smooth);++smooth_restores;cache->alt_smooth=false;}}
int BKE_object_defgroup_active_index_get(Object*){return 2;}
void DEG_id_tag_update(ID*,int){++tags;}void WM_event_add_notifier(const bContext*,int,Object*){++notifiers;}
using eOverlayFlags=int;void BKE_paint_set_overlay_override(eOverlayFlags){}
void WM_event_timer_remove(void*,void*,void*){++timer_frees;}
struct wmPaintCursor{};void WM_paint_cursor_end(wmPaintCursor*){++cursor_frees;}
bool print_pressure_status_enabled(){return true;}void ED_workspace_status_text(bContext*,void*){++status_clears;}
void reset(){cache_frees=stroke_frees=mode_frees=timer_frees=cursor_frees=0;
 smooth_restores=notifiers=tags=status_clears=redraws=0;}
"""

class WeightPaintCancelTests(unittest.TestCase):
 @classmethod
 def setUpClass(cls):
  cls.pin=preflight.pinned_commit(REPO)
  load=lambda path:preflight.get_source(cls.pin,path,REPO/'.cache/preflight',False).decode('utf-8')
  cls.original=load(WEIGHT)
  cls.generic=load(STROKE)
  cls.patched=changed_source(WEIGHT)
  cls.bodies='\n'.join([
   function(cls.patched,'static void wpaint_stroke_done('),
   function(cls.generic,'void paint_stroke_free('),
   function(cls.generic,'static void stroke_done('),
   function(cls.generic,'void paint_stroke_cancel('),
   function(cls.patched,'static void wpaint_cancel(')])
 def run_cpp(self,body,old=False):
  legacy=function(self.original,'static void wpaint_cancel(').replace('wpaint_cancel(', 'legacy_cancel(',1) if old else ''
  test_ipad_panels.IPadWorkspacePanelsTests()._run_source(COMMON+self.bodies+legacy+body)
 def test_started_normal_and_smooth_completion_own_exactly_once_cleanup(self):
  self.run_cpp(r"""
int main(){for(int i=0;i<10000;++i){reset();bool smooth=i%2;
 SculptSession ss;ss.cache.value=new StrokeCache{smooth};ID id;ParticleSystem ps;
 Object ob{&ss,{&ps},&id};PaintRuntime runtime;VPaint vp{{&runtime}};ToolSettings ts{&vp};
 RegionView3D region;bContext C{&ob,&ts,&region};Brush brush;
 auto *stroke=new PaintStroke{&vp.paint,&brush,true,&id,&id,nullptr,wpaint_stroke_done};
 wmOperator op{stroke};wpaint_cancel(&C,&op);op.customdata=nullptr;
 assert(!ss.cache.value&&cache_frees==1&&stroke_frees==1&&mode_frees==1);
 assert(smooth_restores==int(smooth)&&notifiers==1&&tags==1&&ps.recalc==ID_RECALC_PSYS_RESET);
 assert(timer_frees==1&&cursor_frees==1&&status_clears==1&&!redraws);
 assert(!runtime.stroke_active&&!runtime.draw_anchored&&runtime.brush_rotation==0&&runtime.brush_rotation_sec==0);
 assert(!(region.rflag&RV3D_PAINTING));}}
""")
 def test_refused_start_does_not_delete_unowned_cache(self):
  self.run_cpp(r"""
int main(){for(bool foreign:{false,true}){reset();SculptSession ss;
 if(foreign)ss.cache.value=new StrokeCache{true};auto *original=ss.cache.value;
 ID id;Object ob{&ss,{},&id};PaintRuntime runtime;VPaint vp{{&runtime}};ToolSettings ts{&vp};
 bContext C{&ob,&ts,nullptr};Brush brush;brush.mtex.brush_angle_mode=MTEX_ANGLE_RAKE;
 auto *stroke=new PaintStroke{&vp.paint,&brush,false,nullptr,nullptr,nullptr,wpaint_stroke_done};
 wmOperator op{stroke};wpaint_cancel(&C,&op);op.customdata=nullptr;
 assert(ss.cache.value==original&&!cache_frees&&!smooth_restores&&!notifiers&&!tags);
 assert(stroke_frees==1&&!mode_frees&&!timer_frees&&!cursor_frees);
 assert(!runtime.stroke_active&&runtime.brush_rotation==3&&runtime.brush_rotation_sec==0);
 delete original;ss.cache=nullptr;}}
""")
 def test_old_order_reproduces_null_cache_before_mode_completion(self):
  self.run_cpp(r"""
int main(){(void)&wpaint_cancel;reset();SculptSession ss;ss.cache.value=new StrokeCache{true};ID id;
 Object ob{&ss,{},&id};PaintRuntime runtime;VPaint vp{{&runtime}};ToolSettings ts{&vp};
 bContext C{&ob,&ts,nullptr};Brush brush;
 auto *stroke=new PaintStroke{&vp.paint,&brush,true,&id,&id,nullptr,wpaint_stroke_done};
 wmOperator op{stroke};bool caught=false;try{legacy_cancel(&C,&op);}catch(const std::runtime_error&){caught=true;}
 assert(caught&&!ss.cache.value&&cache_frees==1&&!smooth_restores&&!notifiers&&!stroke_frees);
 delete stroke;op.customdata=nullptr;}
""",old=True)
 def test_pinned_refusals_precede_cache_creation_and_registration_is_unchanged(self):
  start=function(self.original,'static bool wpaint_stroke_test_start(')
  boundary=start.index('vwpaint::init_stroke(')
  refusals=[i for i in range(len(start)) if start.startswith('return false;',i)]
  self.assertEqual(len(refusals),4)
  self.assertTrue(all(i<boundary for i in refusals))
  self.assertNotIn('ss.cache',start[:boundary])
  self.assertNotIn('return false;',start[boundary:])
  self.assertIn('paint_stroke_set_mode_data(&stroke, std::move(wpd));',start[boundary:])
  self.assertIn('return true;',start[boundary:])
  normalized=lambda body:'\n'.join(line for line in body.splitlines() if line.strip())
  self.assertEqual(normalized(function(self.original,'void PAINT_OT_weight_paint(')),normalized(function(self.patched,'void PAINT_OT_weight_paint(')))
  self.assertIn('ot->cancel = wpaint_cancel;',self.patched)
  self.assertNotIn('MEM_delete',function(self.patched,'static void wpaint_cancel('))

if __name__=='__main__':unittest.main()
