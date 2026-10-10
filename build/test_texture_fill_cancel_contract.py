"""Execute the pinned Image Paint Fill completion callback through native cancel.

This records Blender's mode-specific cancellation semantics for an admitted
Texture Paint owner. In this pinned revision `paint_cancel` reaches the shared
stroke-done callback, which applies the Fill brush before ending native image
undo. This is a stock native behavior characterization, not rollback or iPad
device evidence.
"""
from pathlib import Path
import unittest

import preflight
import test_ipad_panels
from test_compact_shelf import function


REPO = Path(__file__).resolve().parents[1]
PIN = preflight.pinned_commit(REPO)
CACHE = REPO / '.cache/preflight'
IMAGE_PAINT = preflight.get_source(
    PIN,
    'source/blender/editors/sculpt_paint/paint_image_ops_paint.cc',
    CACHE,
    False,
).decode('utf-8')
STROKE = preflight.get_source(
    PIN,
    'source/blender/editors/sculpt_paint/paint_stroke.cc',
    CACHE,
    False,
).decode('utf-8')
IMAGE_DONE = function(IMAGE_PAINT, 'static void paint_stroke_done(')
IMAGE_CANCEL = function(IMAGE_PAINT, 'static void paint_cancel(')
STROKE_DONE = function(STROKE, 'static void stroke_done(')
STROKE_CANCEL = function(STROKE, 'void paint_stroke_cancel(')


CPP = r"""
#include <cassert>
struct bContext;
struct wmOperator;
struct PaintStroke;
struct Paint;
struct Brush;
struct Scene;
struct ToolSettings;
struct ImagePaintSettings;
struct PaintRuntime { float brush_rotation=2.0f, brush_rotation_sec=3.0f; };
namespace bke { using PaintRuntime = ::PaintRuntime; }
struct Paint { PaintRuntime *runtime=nullptr; Brush *brush=nullptr; };
struct Brush {
  struct { int brush_angle_mode=0; } mtex,mask_mtex;
  int image_brush_type=0,flag=0;
};
struct ImagePaintSettings { int flag=1; Paint paint; };
struct ToolSettings { ImagePaintSettings imapaint; };
struct Scene { ToolSettings *toolsettings=nullptr; };
struct bContext { Scene *scene=nullptr; Paint *active_paint=nullptr; };
struct PaintOperation;
struct PaintStroke {
  Paint *paint=nullptr;
  Brush *brush=nullptr;
  bool stroke_started=false;
  void *mode_data=nullptr;
  void (*redraw)(bContext*,PaintStroke*,bool)=nullptr;
  void (*done)(const bContext*,PaintStroke*)=nullptr;
};
struct wmOperator { void *customdata=nullptr; };
struct AbstractPaintMode {
  int *bucket_calls=nullptr,*gradient_calls=nullptr,*handle_done_calls=nullptr;
  void paint_bucket_fill(const bContext*,const Paint*,Brush*,PaintStroke*,void*,float*,float*) {
    ++*bucket_calls;
  }
  void paint_gradient_fill(const bContext*,const Paint*,Brush*,PaintStroke*,void*,float*,float*) {
    ++*gradient_calls;
  }
  void paint_stroke_done(void*) { ++*handle_done_calls; }
};
struct PaintOperation {
  AbstractPaintMode *mode=nullptr;
  void *stroke_handle=nullptr;
  float startmouse[2]{1,2},prevmouse[2]{3,4};
};
constexpr int IMAGEPAINT_DRAWING=1;
constexpr int IMAGE_PAINT_BRUSH_TYPE_FILL=4;
constexpr int BRUSH_USE_GRADIENT=8;
constexpr int MTEX_ANGLE_RAKE=16;
int undo_end_calls=0,free_calls=0,done_calls=0;
bool print_pressure_status_enabled(){return false;}
void ED_workspace_status_text(bContext*,const char*){}
Scene *CTX_data_scene(const bContext *C){return C->scene;}
Paint *BKE_paint_get_active_from_context(const bContext *C){return C->active_paint;}
Brush *BKE_paint_brush(Paint *paint){return paint->brush;}
void *paint_stroke_mode_data(PaintStroke *stroke){return stroke->mode_data;}
void ED_image_undo_push_end(){++undo_end_calls;}
void paint_stroke_free(bContext*,wmOperator*,PaintStroke*){++free_calls;}
"""


class TextureFillCancelContractTests(unittest.TestCase):
    def run_native(self, main):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(
            CPP + IMAGE_DONE + STROKE_DONE + STROKE_CANCEL + IMAGE_CANCEL + main
        )

    def test_native_modal_cancel_completes_fill_then_ends_owned_resources(self):
        self.run_native(r"""
int main(){
  PaintRuntime runtime;Brush brush;brush.image_brush_type=IMAGE_PAINT_BRUSH_TYPE_FILL;
  ToolSettings settings;settings.imapaint.paint={&runtime,&brush};Scene scene{&settings};
  int bucket=0,gradient=0,handle_done=0;AbstractPaintMode mode{&bucket,&gradient,&handle_done};
  PaintOperation operation{&mode,reinterpret_cast<void*>(1)};
  PaintStroke stroke;stroke.paint=&settings.imapaint.paint;stroke.brush=&brush;
  stroke.stroke_started=true;stroke.mode_data=&operation;stroke.done=paint_stroke_done;
  wmOperator op{&stroke};bContext C{&scene,&settings.imapaint.paint};
  paint_cancel(&C,&op);
  assert(bucket==1&&gradient==0);
  assert(handle_done==1&&operation.stroke_handle==nullptr);
  assert(undo_end_calls==1&&free_calls==1&&settings.imapaint.flag==0);
  assert(runtime.brush_rotation==0&&runtime.brush_rotation_sec==0);
}
""")

    def test_native_cancel_uses_gradient_fill_when_that_is_the_active_fill_mode(self):
        self.run_native(r"""
int main(){
  PaintRuntime runtime;Brush brush;brush.image_brush_type=IMAGE_PAINT_BRUSH_TYPE_FILL;
  brush.flag=BRUSH_USE_GRADIENT;ToolSettings settings;settings.imapaint.paint={&runtime,&brush};
  Scene scene{&settings};int bucket=0,gradient=0,handle_done=0;
  AbstractPaintMode mode{&bucket,&gradient,&handle_done};
  PaintOperation operation{&mode,reinterpret_cast<void*>(1)};
  PaintStroke stroke;stroke.paint=&settings.imapaint.paint;stroke.brush=&brush;
  stroke.stroke_started=true;stroke.mode_data=&operation;stroke.done=paint_stroke_done;
  wmOperator op{&stroke};bContext C{&scene,&settings.imapaint.paint};
  paint_cancel(&C,&op);
  assert(bucket==0&&gradient==1&&handle_done==1&&operation.stroke_handle==nullptr);
  assert(undo_end_calls==1&&free_calls==1);
}
""")

    def test_native_cancel_of_unstarted_stroke_skips_done_callback(self):
        self.run_native(r"""
int main(){
  PaintRuntime runtime;Brush brush;brush.image_brush_type=IMAGE_PAINT_BRUSH_TYPE_FILL;
  ToolSettings settings;settings.imapaint.paint={&runtime,&brush};Scene scene{&settings};
  int bucket=0,gradient=0,handle_done=0;AbstractPaintMode mode{&bucket,&gradient,&handle_done};
  PaintOperation operation{&mode,reinterpret_cast<void*>(1)};
  PaintStroke stroke;stroke.paint=&settings.imapaint.paint;stroke.brush=&brush;
  stroke.stroke_started=false;stroke.mode_data=&operation;stroke.done=paint_stroke_done;
  wmOperator op{&stroke};bContext C{&scene,&settings.imapaint.paint};
  paint_cancel(&C,&op);
  assert(bucket==0&&gradient==0&&handle_done==0);
  assert(undo_end_calls==0&&free_calls==1);
}
""")


if __name__ == '__main__':
    unittest.main()
