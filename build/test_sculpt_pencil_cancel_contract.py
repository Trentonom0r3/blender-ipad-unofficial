"""Execute the pinned Sculpt topology decision inside its native cancel callback.

The Sculpt mode callback and dynamic-topology predicate are extracted from the
exact Blender pin. Context, undo restoration, allocation and the shared generic
paint cancellation boundary are modeled; this is not device input or a claim that
every paint mode rolls back on cancellation.
"""
import unittest

import test_ipad_panels
from test_compact_shelf import function
from test_touch_extrude import changed_source


SCULPT = 'source/blender/editors/sculpt_paint/sculpt.cc'
COMMON = r"""
#include <cassert>
#include <cstdint>
#include <vector>
constexpr uint32_t BRUSH_ANCHORED=1, BRUSH_DRAG_DOT=2;
namespace bke::pbvh {
enum class Type { Mesh, BMesh };
struct Tree { Type value=Type::Mesh; Type type() const { return value; } };
}
struct StrokeCache { bool alt_smooth=false; };
struct SculptSession { StrokeCache *cache=nullptr; };
struct Brush { uint32_t flag=0; bool supports_dyntopo=false; };
struct Paint { Brush *brush=nullptr; };
struct Sculpt { Paint paint; };
struct ToolSettings { Sculpt *sculpt=nullptr; };
struct Object { SculptSession *sculpt=nullptr; bke::pbvh::Tree pbvh; };
struct Depsgraph {};
struct PaintStroke {};
struct wmOperator { void *customdata=nullptr; };
struct bContext { Depsgraph *depsgraph=nullptr; Object *object=nullptr; ToolSettings *settings=nullptr; };
int undo_restore_calls=0, generic_cancel_calls=0, cache_free_calls=0, texture_exit_calls=0;
std::vector<int> order;
Depsgraph *CTX_data_depsgraph_pointer(const bContext *C) { return C->depsgraph; }
Object *CTX_data_active_object(const bContext *C) { return C->object; }
ToolSettings *CTX_data_tool_settings(const bContext *C) { return C->settings; }
Brush *BKE_paint_brush_for_read(Paint *paint) { return paint->brush; }
namespace bke::object {
const bke::pbvh::Tree *pbvh_get(const Object &object) { return &object.pbvh; }
}
namespace bke::brush {
bool supports_dyntopo(const Brush &brush) { return brush.supports_dyntopo; }
}
namespace blender::ed::sculpt_paint::undo {
void restore_from_undo_step(const Depsgraph &, Sculpt &, Object &) {
  ++undo_restore_calls; order.push_back(1);
}
}
void paint_stroke_cancel(bContext *, wmOperator *, PaintStroke *) {
  ++generic_cancel_calls; order.push_back(2);
}
void MEM_delete(StrokeCache *cache) {
  if (cache) { ++cache_free_calls; delete cache; order.push_back(3); }
}
void brush_exit_tex(Sculpt &) { ++texture_exit_calls; order.push_back(4); }
void reset() { undo_restore_calls=generic_cancel_calls=cache_free_calls=texture_exit_calls=0; order.clear(); }
"""


class SculptPencilCancelContractTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.native = changed_source(SCULPT)
        cls.dyntopo = function(cls.native, 'bool stroke_is_dyntopo(')
        cls.cancel = function(cls.native, 'static void sculpt_brush_stroke_cancel(')

    def run_cpp(self, main):
        source = COMMON + r"""
namespace blender::ed::sculpt_paint::dyntopo {
""" + self.dyntopo + r"""
}
namespace blender::ed::sculpt_paint {
""" + self.cancel + r"""
}
""" + main
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(source)

    def test_non_dyntopo_cancel_restores_then_runs_native_cleanup_order(self):
        self.run_cpp(r"""
int main() {
  reset(); Depsgraph depsgraph; StrokeCache *cache=new StrokeCache; SculptSession session{cache};
  Object object{&session, {bke::pbvh::Type::Mesh}}; Brush brush; Sculpt sculpt{{&brush}};
  ToolSettings settings{&sculpt}; bContext C{&depsgraph,&object,&settings};
  PaintStroke stroke; wmOperator op{&stroke};
  blender::ed::sculpt_paint::sculpt_brush_stroke_cancel(&C,&op);
  assert(undo_restore_calls==1 && generic_cancel_calls==1 && cache_free_calls==1);
  assert(texture_exit_calls==1 && session.cache==nullptr);
  assert((order==std::vector<int>{1,2,3,4}));
}
""")

    def test_dyntopo_cancel_skips_mesh_undo_restore_but_still_cleans_cache(self):
        self.run_cpp(r"""
int main() {
  reset(); Depsgraph depsgraph; StrokeCache *cache=new StrokeCache; SculptSession session{cache};
  Object object{&session, {bke::pbvh::Type::BMesh}};
  Brush brush; brush.supports_dyntopo=true; Sculpt sculpt{{&brush}};
  ToolSettings settings{&sculpt}; bContext C{&depsgraph,&object,&settings};
  PaintStroke stroke; wmOperator op{&stroke};
  blender::ed::sculpt_paint::sculpt_brush_stroke_cancel(&C,&op);
  assert(undo_restore_calls==0 && generic_cancel_calls==1 && cache_free_calls==1);
  assert(texture_exit_calls==1 && session.cache==nullptr);
  assert((order==std::vector<int>{2,3,4}));
}
""")

    def test_alt_smooth_and_native_non_dyntopo_flags_keep_their_restore_rule(self):
        self.run_cpp(r"""
int main() {
  for (bool alt_smooth : {false,true}) {
    reset(); Depsgraph depsgraph; StrokeCache *cache=new StrokeCache{alt_smooth};
    SculptSession session{cache}; Object object{&session, {bke::pbvh::Type::BMesh}};
    Brush brush; brush.supports_dyntopo=true;
    if (!alt_smooth) brush.flag=BRUSH_ANCHORED;
    Sculpt sculpt{{&brush}}; ToolSettings settings{&sculpt};
    bContext C{&depsgraph,&object,&settings}; PaintStroke stroke; wmOperator op{&stroke};
    blender::ed::sculpt_paint::sculpt_brush_stroke_cancel(&C,&op);
    assert(undo_restore_calls==1 && generic_cancel_calls==1 && cache_free_calls==1);
    assert((order==std::vector<int>{1,2,3,4}));
  }
}
""")

    def test_callback_keeps_native_context_and_cleanup_owners_explicit(self):
        self.assertIn('const Brush &brush = *BKE_paint_brush_for_read(&sd.paint);', self.cancel)
        self.assertIn('undo::restore_from_undo_step(depsgraph, sd, ob);', self.cancel)
        self.assertLess(self.cancel.index('undo::restore_from_undo_step'), self.cancel.index('paint_stroke_cancel'))
        self.assertLess(self.cancel.index('paint_stroke_cancel'), self.cancel.index('MEM_delete(ss.cache)'))
        self.assertLess(self.cancel.index('MEM_delete(ss.cache)'), self.cancel.index('brush_exit_tex(sd)'))


if __name__ == '__main__':
    unittest.main(verbosity=2)
