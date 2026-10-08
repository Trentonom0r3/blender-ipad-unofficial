'''First-layout prerequisites through actual native HUD initialization functions.

Geometry placement, keymap registration and View2D reinit are explicit fixture
boundaries. Native sizing/floating/panel/HUD init bodies are pinned, unchanged.
The old refresh is reconstructed by removing its new initialization/reacquisition
seams; the downstream panel contract rejects its zeroed View2D before layout.
This does not prove target UIKit/GPU or device startup.
'''
from pathlib import Path
import unittest
from test_compact_shelf import function
import test_pencil_hud_presentation as presentation
import test_ipad_panels

repo=Path(__file__).resolve().parents[1]
fixture=Path(__file__).with_name('pinned_hud_initialization.cc')
if not fixture.exists():fixture=repo/'build/fixtures/pinned_hud_initialization.cc'
NATIVE=fixture.read_text(encoding='utf-8')
HUD=presentation.source('source/blender/editors/interface/regions/interface_region_hud.cc')
REFRESH=function(HUD,'void UI_ipad_corner_hud_refresh(')
DATA=function(HUD,'struct HudRegionData {')+';'
WORLD=r'''
#include <algorithm>
#include <cassert>
#include <cmath>
#include <cstdlib>
#include <vector>
#define WITH_APPLE_CROSSPLATFORM
#define UNUSED_VARS(...) (void)0
#define BLI_assert(v) assert(v)
#define LISTBASE_FOREACH(T,v,list) for(T v:*(list))
inline constexpr int RGN_TYPE_HUD=1,RGN_TYPE_WINDOW=2,RGN_FLAG_HIDDEN=1,
 RGN_FLAG_HIDDEN_BY_USER=2,RGN_FLAG_TOO_SMALL=4,RGN_FLAG_POLL_FAILED=8,
 RGN_FLAG_TEMP_REGIONDATA=16,AREA_FLAG_REGION_SIZE_UPDATE=1,
 RGN_ALIGN_FLOAT=0,RGN_ALIGN_LEFT=1,RGN_ALIGN_RIGHT=2,
 V2D_COMMONVIEW_PANELS_UI=1,V2D_SCROLL_LEFT=1,V2D_SCROLL_RIGHT=2,SPACE_EMPTY=0;
struct rcti{int xmin=0,xmax=0,ymin=0,ymax=0;};
struct rctf{float xmin=0,xmax=0,ymin=0,ymax=0;};
void BLI_rcti_init(rcti*r,int a,int b,int c,int d){*r={a,b,c,d};}
int BLI_rcti_size_x(const rcti*r){return r->xmax-r->xmin;}
int BLI_rcti_size_y(const rcti*r){return r->ymax-r->ymin;}
struct View2D{rcti mask;rctf cur,tot;int scroll=0;float maxzoom=0,minzoom=0;bool initialized=false;};
struct ARegion;struct wmWindowManager;
struct ARegionType{void(*init)(wmWindowManager*,ARegion*)=nullptr;};
struct Runtime{ARegionType*type=nullptr;bool visible=false;
 rcti ipad_canvas_rect{7,999,9,999};float offset_x=0,offset_y=0;int handlers=0;};
struct ARegion{int regiontype=RGN_TYPE_HUD,alignment=RGN_ALIGN_FLOAT,flag=0;
 Runtime*runtime;void*regiondata=nullptr;View2D v2d{};rcti winrct{};int winx=0,winy=0;};
struct ScrArea{int type=1,flag=0;std::vector<ARegion*>regionbase;};
struct bScreen{};struct EventState{int xy[2]={0,0};};
struct wmWindow{EventState state;EventState*eventstate=&state;};
struct WMRuntime{void*defaultconf=nullptr;};
struct wmWindowManager{WMRuntime storage;WMRuntime*runtime=&storage;};
struct bContext{ScrArea*area;ARegion*canvas;bool supported=true;};
wmWindowManager wm;wmWindow win;bScreen screen;wmWindowManager*CTX_wm_manager(bContext*){return &wm;}
wmWindow*CTX_wm_window(bContext*){return &win;}ScrArea*CTX_wm_area(bContext*C){return C->area;}
ARegion*UI_ipad_corner_canvas(bContext*C){return C->supported?C->canvas:nullptr;}
ARegion*BKE_area_find_region_type(ScrArea*a,int kind){for(auto*r:a->regionbase)if(r->regiontype==kind)return r;return nullptr;}
ARegionType art,canvas_art;ARegionType*BKE_regiontype_from_id(int,int){return &art;}
Runtime new_runtime;ARegion new_region{RGN_TYPE_HUD,RGN_ALIGN_FLOAT,0,&new_runtime};
ARegion*hud_region_add(ScrArea*a){new_runtime={};new_region={RGN_TYPE_HUD,RGN_ALIGN_FLOAT,0,&new_runtime};a->regionbase.push_back(&new_region);return &new_region;}
template<class T>T*MEM_callocN(const char*){return static_cast<T*>(std::calloc(1,sizeof(T)));}
void ED_area_tag_region_size_update(ScrArea*a,ARegion*){a->flag|=AREA_FLAG_REGION_SIZE_UPDATE;}
void ED_region_tag_redraw(ARegion*){}
void hud_region_hide(ARegion*r){r->flag|=RGN_FLAG_HIDDEN;}
void UI_view2d_scroller_size_get(View2D*,bool,float*x,float*y){*x=3;*y=5;}
void UI_view2d_region_reinit(View2D*v,int,int x,int y){
 assert(x>0&&y>0);if(!v->initialized){v->cur=v->tot={0,float(x),0,float(y)};v->initialized=true;}}
struct wmKeyMap{};wmKeyMap keymap;
wmKeyMap*WM_keymap_ensure(void*,const char*,int,int){return &keymap;}
void WM_event_add_keymap_handler(int*handlers,wmKeyMap*){++*handlers;}
void UI_region_handlers_add(int*handlers){++*handlers;}
const bScreen*WM_window_get_active_screen(wmWindow*){return &screen;}
void WM_window_screen_rect_calc(wmWindow*,rcti*r){*r={0,1199,0,799};}
void area_calc_totrct(const bScreen*,ScrArea*,rcti*){}
void area_azone_init(wmWindow*,const bScreen*,ScrArea*){}
void region_azones_add(const bScreen*,ScrArea*,ARegion*){}
void ED_area_azones_update(ScrArea*,int*){}
void region_evaulate_visibility(ARegion*r){r->runtime->visible=!(r->flag&(RGN_FLAG_HIDDEN|RGN_FLAG_TOO_SMALL));}
void area_region_rects_calc(wmWindow*,ScrArea*a){
 for(auto*r:a->regionbase){if(r->regiontype==RGN_TYPE_HUD){
  r->winrct={int(r->runtime->offset_x),int(r->runtime->offset_x)+239,
             int(r->runtime->offset_y),int(r->runtime->offset_y)+43};r->winx=240;r->winy=44;}}}
'''

class PencilHUDInitializationTests(unittest.TestCase):
    def run_native(self,test):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(WORLD+DATA+NATIVE+REFRESH+test)

    def test_zeroed_created_copied_hidden_and_valid_redo_before_first_layout(self):
        self.run_native(r'''
bool panel_ready(const ARegion*r){return r&&r->runtime->visible&&r->runtime->type&&
 r->winx>0&&r->winy>0&&r->v2d.initialized&&r->v2d.cur.xmax>r->v2d.cur.xmin&&
 r->v2d.cur.ymax>r->v2d.cur.ymin&&r->runtime->handlers>=2&&(r->flag&RGN_FLAG_TEMP_REGIONDATA);}
int main(){
 art.init=hud_region_init;Runtime cr;cr.type=&canvas_art;cr.visible=true;
 ARegion canvas{RGN_TYPE_WINDOW,RGN_ALIGN_FLOAT,0,&cr};ScrArea area;area.regionbase={&canvas};bContext C{&area,&canvas};
 UI_ipad_corner_hud_refresh(&C,&area);assert(panel_ready(&new_region));
 auto*data=static_cast<HudRegionData*>(new_region.regiondata);assert(data->regionid==-1&&data->redo_suppressed);
 // Caller finishes the queued native placement pass before drawing.
 ED_area_update_region_sizes(&wm,&win,&area);assert(new_region.winrct.xmin==7&&new_region.winrct.ymin==9);
 data->regionid=RGN_TYPE_WINDOW;data->region_index_hint=0;data->redo_suppressed=false;
 new_region.v2d.cur.xmin=12;auto*saved=data;
 UI_ipad_corner_hud_refresh(&C,&area);assert(new_region.regiondata==saved&&data->regionid==RGN_TYPE_WINDOW&&!data->redo_suppressed);
 assert(new_region.v2d.cur.xmin==12);new_region.flag|=RGN_FLAG_HIDDEN;
 UI_ipad_corner_hud_refresh(&C,&area);assert(panel_ready(&new_region)&&new_region.regiondata==saved&&new_region.v2d.cur.xmin==12);
 // Native region copying clears temporary region storage and View2D runtime.
 std::free(new_region.regiondata);new_region.regiondata=nullptr;new_region.v2d={};new_runtime.handlers=0;
 UI_ipad_corner_hud_refresh(&C,&area);assert(panel_ready(&new_region));
 data=static_cast<HudRegionData*>(new_region.regiondata);assert(data->regionid==-1&&data->redo_suppressed);
 new_region.flag|=RGN_FLAG_HIDDEN_BY_USER;auto count=new_runtime.handlers;
 UI_ipad_corner_hud_refresh(&C,&area);assert(new_runtime.handlers==count);
 std::free(new_region.regiondata);
}
''')

    def test_old_first_draw_lacks_native_initialization(self):
        # Mutate only the new initialization call out of the real creator, then
        # classify its actual result instead of dereferencing/animating bad data.
        old=REFRESH.replace('    ED_area_update_region_sizes(CTX_wm_manager(C), CTX_wm_window(C), area);','')
        self.assertNotEqual(old,REFRESH)
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(WORLD+DATA+NATIVE+old+r'''
int main(){art.init=hud_region_init;Runtime cr;cr.type=&canvas_art;cr.visible=true;
 ARegion canvas{RGN_TYPE_WINDOW,RGN_ALIGN_FLOAT,0,&cr};ScrArea area;area.regionbase={&canvas};bContext C{&area,&canvas};
 UI_ipad_corner_hud_refresh(&C,&area);
 assert(new_runtime.visible&&!new_region.v2d.initialized&&new_runtime.handlers==0);
 assert(new_region.v2d.cur.xmax==new_region.v2d.cur.xmin);
 std::free(new_region.regiondata);
}
''')

if __name__=='__main__':unittest.main()
