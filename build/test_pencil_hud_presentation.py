"""Execute native HUD content/compositor receipts and ordinary-input routing.

Fresh context/list/GPU boundaries are fixtures, not target UIKit/modal proof.
Set BLENDER_IPAD_HUD_SOURCE_ROOT while reviewing the un-emitted candidate.
"""
import os
from pathlib import Path
import unittest
from test_touch_extrude import changed_source
from test_compact_shelf import function
import test_ipad_panels


def source(path):
    root = os.environ.get('BLENDER_IPAD_HUD_SOURCE_ROOT')
    return (Path(root) / path).read_text(encoding='utf-8') if root else changed_source(path)


SCREEN = source('source/blender/editors/screen/screen_ipad_panels.cc')
DRAW = source('source/blender/windowmanager/intern/wm_draw.cc')
HEADER = source('source/blender/editors/include/ED_ipad_panels.hh')
RECEIPTS = SCREEN[SCREEN.index('namespace {\nstruct IPadHUDOwner {'):
                  SCREEN.index('\nvoid ED_ipad_editing_canvas_parts',
                               SCREEN.index('namespace {\nstruct IPadHUDOwner {'))]

WORLD = r"""
#include <algorithm>
#include <array>
#include <cassert>
#include <cstdint>
#include <cstring>
#include <limits>
#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <utility>
#include <string>
#include <functional>
struct rcti {int xmin=0,xmax=0,ymin=0,ymax=0;};
struct rctf {float xmin=0,xmax=0,ymin=0,ymax=0;};
void BLI_rcti_translate(rcti *r,int x,int y){r->xmin+=x;r->xmax+=x;r->ymin+=y;r->ymax+=y;}
bool BLI_rcti_isect(const rcti *a,const rcti *b,rcti *r){
 *r={std::max(a->xmin,b->xmin),std::min(a->xmax,b->xmax),std::max(a->ymin,b->ymin),std::min(a->ymax,b->ymax)};
 return r->xmin<=r->xmax&&r->ymin<=r->ymax;
}
int BLI_rcti_size_x(const rcti *r){return r->xmax-r->xmin;}
int BLI_rcti_size_y(const rcti *r){return r->ymax-r->ymin;}
void BLI_strncpy(char *dst,const char *src,size_t n){size_t size=std::min(n-1,std::strlen(src));std::memcpy(dst,src,size);dst[size]=0;}
#define LISTBASE_FOREACH(T,var,list) for(T var : *(list))
template<class T>int BLI_findindex(const std::vector<T*> *v,const T *p){auto i=std::find(v->begin(),v->end(),p);return i==v->end()?-1:int(i-v->begin());}
constexpr int RGN_TYPE_HUD=1,RGN_TYPE_WINDOW=2,SPACE_VIEW3D=3;
constexpr int RGN_FLAG_HIDDEN=1,RGN_FLAG_HIDDEN_BY_USER=2,RGN_FLAG_TOO_SMALL=4,RGN_FLAG_POLL_FAILED=8;
constexpr int RGN_ALIGN_FLOAT=1,RGN_ALIGN_LEFT=2,RGN_ALIGN_RIGHT=3;
#define RGN_ALIGN_ENUM_FROM_MASK(v) (v)
struct RegionRuntime{bool visible=true,ipad_canvas=false;uint64_t ipad_hud_content_lifetime=0;void *draw_buffer=reinterpret_cast<void*>(7);rcti ipad_canvas_rect;};
struct ARegion{int regiontype=RGN_TYPE_HUD,flag=0,alignment=RGN_ALIGN_FLOAT;bool overlap=true;float alpha=1;RegionRuntime *runtime;rcti winrct;};
struct AreaRuntime{int ipad_layer=1;};
struct ScrArea{int spacetype=SPACE_VIEW3D;bool visible=true;AreaRuntime runtime;std::vector<ARegion*> regionbase;};
struct ID{uint32_t session_uid;};
struct bScreen{bool enabled=true;std::vector<ScrArea*> areabase;ID id{19};};
struct wmWindow{int winid=11,height=800;bScreen *screen;};
int WM_window_native_pixel_x(const wmWindow*){return 600;}
int WM_window_native_pixel_y(const wmWindow *w){return w->height;}
float UI_SCALE_FAC=1;
struct UndoStack{uint64_t ipad_lifetime_id=23,ipad_mutation_generation=31;};
struct wmOperatorType{uint64_t ipad_lifetime_id=37;};
struct wmOperator{wmOperatorType *type;uint64_t lifetime=41;};
struct WMRuntime{UndoStack *undo_stack;std::vector<wmOperator*> operators{};};
std::vector<wmOperatorType*> registered_types;
const std::vector<wmOperatorType*> &WM_operatortypes_registered_get(){return registered_types;}
uint64_t WM_operator_touch_lifetime_id(const wmOperator *op){return op->lifetime;}
struct wmWindowManager{std::vector<wmWindow*> windows;WMRuntime *runtime;ID id{501};};
struct bToolRef{char idname[64]="builtin.move";};
struct bContext{wmWindowManager *wm;wmWindow *win;ScrArea *area=nullptr;ARegion *region=nullptr;ARegion *origin=nullptr;bToolRef tool;bool valid=true;uint64_t scene=101,object=201,mode=0;};
wmWindowManager *CTX_wm_manager(bContext *C){return C->wm;}
wmOperator *WM_operator_last_redo(const bContext *C){return C->wm->runtime->operators.empty()?nullptr:C->wm->runtime->operators.back();}
wmWindow *CTX_wm_window(bContext *C){return C->win;}
uintptr_t main_address=1;
void *CTX_data_main(bContext*){return reinterpret_cast<void*>(main_address);}
ScrArea *CTX_wm_area(bContext *C){return C->area;}
ARegion *CTX_wm_region(bContext *C){return C->region;}
void CTX_wm_area_set(bContext *C,ScrArea *a){C->area=a;C->region=nullptr;}
void CTX_wm_region_set(bContext *C,ARegion *r){C->region=r;}
bScreen *WM_window_get_active_screen(const wmWindow *w){return w->screen;}
bool ED_ipad_panels_enabled(const bScreen *s){return s->enabled;}
bool ED_ipad_panels_area_visible(const ScrArea *a){return a->visible;}
ARegion *UI_ipad_corner_hud_window(bContext *C,ScrArea *a,ARegion*){return C->area==a?C->origin:nullptr;}
bool UI_ipad_context_capture(bContext *C,uint64_t *v){if(!C->valid)return false;
 uint64_t values[13]={1,uint64_t(uintptr_t(C->win)),uint64_t(uintptr_t(C->win->screen)),uint64_t(uintptr_t(C->area)),uint64_t(uintptr_t(C->region)),19,C->scene,C->object,301,C->mode,401,uint64_t(C->win->winid),501};
 std::copy(values,values+13,v);return true;}
bToolRef *WM_toolsystem_ref_from_context(bContext *C){return &C->tool;}
int redraws=0;
void ED_region_tag_redraw(ARegion*){++redraws;}
std::unordered_map<ARegion*,std::unordered_set<std::string>> native_blocks;
std::vector<std::string> freed_blocks;
std::function<void(bContext*,ARegion*)> onfree;
void UI_block_discard_named_rebuild(bContext *C,ARegion *hud,const char *name){
 auto found=native_blocks.find(hud);if(found==native_blocks.end()||!found->second.erase(name))return;
 freed_blocks.push_back(name);auto callback=onfree;if(callback)callback(C,hud);
}
namespace blender {using float4=std::array<float,4>;namespace gpu{struct Texture{};struct Shader{};struct Batch{};}}
constexpr float GLA_PIXEL_OFS=0.375f;
constexpr int GPU_BLEND_ALPHA_PREMULT=1,GPU_BLEND_NONE=0,GPU_SHADER_2D_IMAGE_RECT_COLOR=1,GPU_UNIFORM_COLOR=1;
blender::gpu::Texture texture;blender::gpu::Shader shader;blender::gpu::Batch batch;int gpu_draws=0;
float ED_region_blend_alpha(ARegion *r){return r->alpha;}
void GPU_blend(int){}
blender::gpu::Texture *wm_draw_region_texture(ARegion*,int){return &texture;}
blender::gpu::Shader *GPU_shader_get_builtin_shader(int){return &shader;}
void GPU_shader_bind(blender::gpu::Shader*){}
int GPU_shader_get_builtin_uniform(blender::gpu::Shader*,int){return 1;}
int GPU_shader_get_uniform(blender::gpu::Shader*,const char*){return 1;}
int GPU_shader_get_sampler_binding(blender::gpu::Shader*,const char*){return 1;}
void GPU_texture_bind(blender::gpu::Texture*,int){}
void GPU_shader_uniform_float_ex(blender::gpu::Shader*,int,int,int,const float*){}
void GPU_shader_uniform_float_ex(blender::gpu::Shader*,int,int,int,blender::float4){}
blender::gpu::Batch *GPU_batch_preset_quad(){return &batch;}
void GPU_batch_set_shader(blender::gpu::Batch*,blender::gpu::Shader*){}
void GPU_batch_draw(blender::gpu::Batch*){++gpu_draws;}
void GPU_texture_unbind(blender::gpu::Texture*){}
"""


def compiled_prefix():
    public = function(HEADER, 'struct IPadHUDPresentedRect {') + ';'
    blend = function(DRAW, 'static bool wm_draw_region_blend_receipt(')
    layer = function(DRAW, 'static void wm_draw_window_area_layer(')
    a = layer.index('      if (region->overlap) {', layer.index('/* Blend in overlapping area regions. */'))
    b = layer.index('\n    }\n  }', a)
    producer = 'void native_overlap(bContext *C,wmWindow *win,ScrArea *area,ARegion *region){\n' + layer[a:b] + '\n}'
    return '#define WITH_APPLE_CROSSPLATFORM\n' + WORLD + public + RECEIPTS + blend + producer


class PencilHUDPresentationTests(unittest.TestCase):
    def run_native(self, test):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(compiled_prefix() + test)

    def test_actual_compositor_footprint_success_and_early_returns(self):
        self.run_native(r"""
int main(){RegionRuntime rt;ARegion hud{RGN_TYPE_HUD,0,RGN_ALIGN_FLOAT,true,1,&rt,{17,96,29,68}};rcti drawn{999,999,999,999};
 rt.draw_buffer=nullptr;assert(!wm_draw_region_blend_receipt(&hud,0,true,&drawn));assert(drawn.xmin==999&&gpu_draws==0);
 rt.draw_buffer=&hud;hud.alpha=0;assert(!wm_draw_region_blend_receipt(&hud,0,true,&drawn));assert(gpu_draws==0);
 hud.alpha=1;assert(wm_draw_region_blend_receipt(&hud,0,true,&drawn));assert(gpu_draws==1);
 assert(drawn.xmin==17&&drawn.xmax==97&&drawn.ymin==29&&drawn.ymax==69);
 hud.alignment=RGN_ALIGN_LEFT;hud.alpha=.5f;assert(wm_draw_region_blend_receipt(&hud,0,true,&drawn));assert(drawn.xmax<97);
 hud.alignment=RGN_ALIGN_RIGHT;assert(wm_draw_region_blend_receipt(&hud,0,true,&drawn));assert(drawn.xmin>17);
}
""")

    def test_connected_cached_draw_history_geometry_and_frozen_generation(self):
        self.run_native(r"""
int main(){RegionRuntime hr,cr;cr.ipad_canvas=true;cr.ipad_canvas_rect={0,299,0,399};
 ARegion hud{RGN_TYPE_HUD,0,RGN_ALIGN_FLOAT,true,1,&hr,{100,299,70,169}};
 ARegion canvas{RGN_TYPE_WINDOW,0,RGN_ALIGN_FLOAT,false,1,&cr,{80,379,50,449}};
 ScrArea area;area.regionbase={&hud,&canvas};bScreen screen;screen.areabase={&area};wmWindow win{11,800,&screen};
 UndoStack undo;WMRuntime runtime{&undo};wmWindowManager wm{{&win},&runtime};bContext C{&wm,&win,nullptr,nullptr,&canvas,{},true,101,201,0};
 wmOperatorType native_type;wmOperator accepted_redo{&native_type};runtime.operators={&accepted_redo};registered_types={&native_type};
 auto layout=[&](){ED_ipad_hud_layout_begin(&C,&win,&area,&hud);ED_ipad_hud_layout_end(&C,&win,&area,&hud);ED_ipad_hud_draw_end(&C,&win,&area,&hud);};
 auto composite=[&](){std::vector<IPadHUDPresentedRect> rects;ED_ipad_hud_compositor_begin(&C,&win);native_overlap(&C,&win,&area,&hud);ED_ipad_hud_compositor_end(&C,&win,rects);return rects;};
 layout();auto first=composite();assert(first.size()==1&&first[0].xmin==100&&first[0].ymax==169);
 uint64_t accepted=first[0].generation;assert(accepted&&ED_ipad_hud_input_admit(&C,&win,accepted));
 assert(C.area==nullptr&&C.region==nullptr);
 // Same-address operator/type reuse and current runtime history membership remain authoritative.
 ++accepted_redo.lifetime;assert(!ED_ipad_hud_input_admit(&C,&win,accepted));--accepted_redo.lifetime;
 ++native_type.ipad_lifetime_id;assert(!ED_ipad_hud_input_admit(&C,&win,accepted));--native_type.ipad_lifetime_id;
 registered_types.clear();assert(!ED_ipad_hud_input_admit(&C,&win,accepted));registered_types={&native_type};
 runtime.operators.clear();assert(!ED_ipad_hud_input_admit(&C,&win,accepted));runtime.operators={&accepted_redo};
 // Cached composition preserves the exact generation and origin receipt.
 for(int i=0;i<10000;++i){auto cached=composite();assert(cached.size()==1&&cached[0].generation==accepted);assert(ED_ipad_hud_input_admit(&C,&win,accepted));}
 // Pending hide leaves old protected pixels but forbids invoking their fields.
 hud.flag|=RGN_FLAG_HIDDEN;hr.visible=false;hud.winrct={};assert(!ED_ipad_hud_input_admit(&C,&win,accepted));
 assert(ipad_hud_frames.at(uintptr_t(&win)).presented.front().generation==accepted);
 ED_ipad_hud_compositor_begin(&C,&win);std::vector<IPadHUDPresentedRect> omitted;ED_ipad_hud_compositor_end(&C,&win,omitted);assert(omitted.empty());
 hud.flag=0;hr.visible=true;hud.winrct={100,299,70,169};layout();first=composite();accepted=first[0].generation;
 // A newer history may not authenticate an old cached texture.
 ++undo.ipad_mutation_generation;assert(!ED_ipad_hud_input_admit(&C,&win,accepted));
 auto stale=composite();assert(stale.size()==1&&!ED_ipad_hud_input_admit(&C,&win,stale[0].generation));
 layout();auto refreshed=composite();assert(refreshed[0].generation!=accepted&&ED_ipad_hud_input_admit(&C,&win,refreshed[0].generation));
 assert(!ED_ipad_hud_input_admit(&C,&win,accepted));accepted=refreshed[0].generation;
 // Semantic changes during native layout refuse that generated UI.
 ED_ipad_hud_layout_begin(&C,&win,&area,&hud);++C.scene;ED_ipad_hud_layout_end(&C,&win,&area,&hud);ED_ipad_hud_draw_end(&C,&win,&area,&hud);
 auto interrupted=composite();assert(!ED_ipad_hud_input_admit(&C,&win,interrupted[0].generation));
 layout();refreshed=composite();accepted=refreshed[0].generation;
 ++win.height;assert(!ED_ipad_hud_input_admit(&C,&win,accepted));--win.height;
 UI_SCALE_FAC=1.5f;assert(!ED_ipad_hud_input_admit(&C,&win,accepted));UI_SCALE_FAC=1;
 ++C.object;assert(!ED_ipad_hud_input_admit(&C,&win,accepted));--C.object;
 ++C.mode;assert(!ED_ipad_hud_input_admit(&C,&win,accepted));--C.mode;
 BLI_strncpy(C.tool.idname,"builtin.rotate",64);assert(!ED_ipad_hud_input_admit(&C,&win,accepted));BLI_strncpy(C.tool.idname,"builtin.move",64);
 ++undo.ipad_lifetime_id;assert(!ED_ipad_hud_input_admit(&C,&win,accepted));--undo.ipad_lifetime_id;
 hr.draw_buffer=&C;assert(!ED_ipad_hud_input_admit(&C,&win,accepted));layout();refreshed=composite();accepted=refreshed[0].generation;
 // Native controls/Inspector coverage shrinks the exposed canvas. Old contact cannot retarget.
 cr.ipad_canvas_rect.xmin=140;assert(!ED_ipad_hud_input_admit(&C,&win,accepted));refreshed=composite();assert(refreshed[0].xmin==220);
 assert(!ED_ipad_hud_input_admit(&C,&win,accepted));assert(ED_ipad_hud_input_admit(&C,&win,refreshed[0].generation));
 hud.winrct.xmin=230;assert(!ED_ipad_hud_input_admit(&C,&win,refreshed[0].generation));
 // Same-address native region replacement gets a fresh lifetime, never the old capability.
 cr.ipad_canvas_rect.xmin=0;hud.winrct={100,299,70,169};
 for(int i=0;i<10000;++i){hr.ipad_hud_content_lifetime=0;layout();auto next=composite();assert(next[0].generation!=accepted);assert(!ED_ipad_hud_input_admit(&C,&win,accepted));accepted=next[0].generation;}
 // Lifetime/generation exhaustion cannot expose drawn UI to canvas capture.
 ipad_hud_next_identity=std::numeric_limits<uint64_t>::max();hud.winrct.xmax=250;layout();auto exhausted=composite();
 assert(exhausted.size()==1&&exhausted[0].generation==std::numeric_limits<uint64_t>::max());
 assert(!ED_ipad_hud_input_admit(&C,&win,exhausted[0].generation));ipad_hud_next_identity=900001;
 screen.enabled=false;assert(!ED_ipad_hud_input_admit(&C,&win,accepted));
 ED_ipad_hud_compositor_begin(&C,&win);std::vector<IPadHUDPresentedRect> retired;ED_ipad_hud_compositor_end(&C,&win,retired);assert(retired.empty());
 screen.enabled=true;layout();first=composite();accepted=first[0].generation;wm.windows.clear();assert(!ED_ipad_hud_input_admit(&C,&win,accepted));
 ED_ipad_hud_forget_window(&win);assert(ipad_hud_frames.empty());
}
""")

    def test_stale_retirement_is_named_onfree_and_reacquires_after_callbacks(self):
        self.run_native(r"""
int main(){RegionRuntime hr,cr;cr.ipad_canvas=true;cr.ipad_canvas_rect={0,499,0,699};
 ARegion hud{RGN_TYPE_HUD,0,RGN_ALIGN_FLOAT,true,1,&hr,{100,299,70,169}};
 ARegion canvas{RGN_TYPE_WINDOW,0,RGN_ALIGN_FLOAT,false,1,&cr,{0,499,0,699}};
 ScrArea area;area.regionbase={&hud,&canvas};bScreen screen;screen.areabase={&area};wmWindow win{11,800,&screen};
 UndoStack undo;WMRuntime runtime{&undo};wmWindowManager wm{{&win},&runtime};bContext C{&wm,&win,nullptr,nullptr,&canvas,{},true,101,201,0};
 auto publish=[&](){ED_ipad_hud_layout_begin(&C,&win,&area,&hud);ED_ipad_hud_layout_end(&C,&win,&area,&hud);ED_ipad_hud_draw_end(&C,&win,&area,&hud);
  ED_ipad_hud_compositor_begin(&C,&win);native_overlap(&C,&win,&area,&hud);std::vector<IPadHUDPresentedRect> out;ED_ipad_hud_compositor_end(&C,&win,out);assert(out.size()==1);return out[0].generation;};
 auto blocks=[&](){native_blocks[&hud]={"VIEW3D_PT_ipad_corner_transform","VIEW3D_PT_ipad_corner_selection","VIEW3D_PT_ipad_corner_view","OPERATOR_PT_redo","UNRELATED_PT_extension"};freed_blocks.clear();onfree={};};
 auto generation=publish();blocks();++undo.ipad_mutation_generation;assert(!ED_ipad_hud_input_admit(&C,&win,generation));
 ED_ipad_hud_input_retire(&C,&win,generation);assert(freed_blocks.size()==4&&native_blocks[&hud].count("UNRELATED_PT_extension"));
 assert(C.area==nullptr&&C.region==nullptr);int count=int(freed_blocks.size());ED_ipad_hud_input_retire(&C,&win,generation);assert(int(freed_blocks.size())==count);
 // Registry destruction in onfree cannot invalidate a retained frame iterator/reference.
 generation=publish();blocks();onfree=[&](bContext*,ARegion*){ipad_hud_frames.clear();};
 ED_ipad_hud_input_retire(&C,&win,generation);assert(freed_blocks.size()==4);
 // A same-address HUD replacement must not dispose its newly allocated blocks.
 generation=publish();blocks();onfree=[&](bContext*,ARegion*){hr.ipad_hud_content_lifetime=0;};int tagged=redraws;
 ED_ipad_hud_input_retire(&C,&win,generation);assert(freed_blocks.size()==1&&redraws==tagged);
 generation=publish();blocks();onfree=[&](bContext*,ARegion*){++screen.id.session_uid;};tagged=redraws;
 ED_ipad_hud_input_retire(&C,&win,generation);assert(freed_blocks.size()==1&&redraws==tagged);--screen.id.session_uid;
 generation=publish();blocks();onfree=[&](bContext*,ARegion*){wm.windows.clear();};tagged=redraws;
 ED_ipad_hud_input_retire(&C,&win,generation);assert(freed_blocks.size()==1&&redraws==tagged&&C.area==nullptr&&C.region==nullptr);wm.windows={&win};
 // Closing/replacing the old Main prevents later cleanup through the previous UI tree.
 generation=publish();blocks();onfree=[&](bContext*,ARegion*){main_address=999;};tagged=redraws;
 ED_ipad_hud_input_retire(&C,&win,generation);assert(freed_blocks.size()==1&&redraws==tagged);main_address=1;
 // Changes to scene/tool/history are why retirement happens, not permission to restore RNA.
 generation=publish();blocks();onfree=[&](bContext *context,ARegion*){++context->scene;++undo.ipad_mutation_generation;};
 ED_ipad_hud_input_retire(&C,&win,generation);assert(freed_blocks.size()==4);onfree={};
 for(int i=0;i<10000;++i){generation=publish();blocks();ED_ipad_hud_input_retire(&C,&win,generation);assert(freed_blocks.size()==4);ED_ipad_hud_input_retire(&C,&win,generation);assert(freed_blocks.size()==4);}
}
""")
        retire = function(SCREEN, 'void ED_ipad_hud_input_retire(')
        self.assertIn('owner = presentation.owner', retire)
        self.assertNotIn('EVT_BUT_CANCEL', retire)
        self.assertNotIn('RNA_', retire)
        self.assertNotIn('WM_operator_', retire)
        self.assertIn('UI_block_discard_named_rebuild(C, hud, name)', retire)
        self.assertLess(retire.index('UI_block_discard_named_rebuild('),
                        retire.index('ARegion *fresh_hud = ipad_hud_retire_region('))

    def test_native_producer_order_and_completed_publication_contract(self):
        offscreen = function(DRAW, 'static void wm_draw_area_offscreen(')
        self.assertLess(offscreen.index('WM_toolsystem_update_from_context('),
                        offscreen.index('UI_ipad_corner_hud_refresh('))
        self.assertLess(offscreen.index('UI_ipad_corner_hud_refresh('),
                        offscreen.index('ED_ipad_hud_layout_begin('))
        self.assertLess(offscreen.index('ED_ipad_hud_layout_begin('), offscreen.index('ED_region_do_layout('))
        self.assertLess(offscreen.index('ED_region_do_layout('), offscreen.index('ED_ipad_hud_layout_end('))
        self.assertLess(offscreen.rindex('ED_region_do_draw('), offscreen.index('ED_ipad_hud_draw_end('))
        onscreen = function(DRAW, 'static void wm_draw_window_onscreen(')
        self.assertLess(onscreen.index('ED_ipad_hud_compositor_begin('), onscreen.index('wm_draw_window_area_layer('))
        self.assertLess(onscreen.index('wm_software_cursor_motion_clear_with_window('), onscreen.index('ED_ipad_hud_compositor_end('))
        self.assertLess(onscreen.index('ED_ipad_hud_compositor_end('), onscreen.index('PointerCaptureKind::ToolManipulation'))
        self.assertIn('PointerCaptureKind::Navigation, false', onscreen)
        self.assertIn('hit.hud_generation = r.generation', onscreen)
        self.assertLess(onscreen.index('navigation.clear()'), onscreen.index('set_navigation_regions('))


if __name__ == '__main__':
    unittest.main()
