"""Connected left-corner placement/exposure/compositor/queued-input checks.

Actual refresh and exposure/receipt implementations execute. Native model/font
construction and initial float geometry are explicit fixture boundaries; this
is not patched GPU/UIKit or device acceptance.
"""
import unittest
import test_pencil_hud_presentation as p
import test_pencil_hud_initialization as i
import test_ipad_panels

class PencilHUDPlacementTests(unittest.TestCase):
    def run_native(self, test):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(p.compiled_prefix()+test)

    def test_native_exposure_left_empty_rail_and_measured_chrome(self):
        self.run_native(r'''
int main(){
 RegionRuntime cr;cr.ipad_canvas=true;cr.ipad_canvas_rect={56,939,6,679};
 ARegion canvas{RGN_TYPE_WINDOW,0,RGN_ALIGN_FLOAT,true,1,&cr,{200,1199,100,799}};
 ScrArea area;area.regionbase={&canvas};bScreen screen;screen.areabase={&area};
 wmWindow win{11,900,&screen};WMRuntime wr{nullptr};wmWindowManager wm{{&win},&wr};bContext C{&wm,&win,nullptr,nullptr,nullptr,{}};
 hud_model.main=&area;hud_model.bounds={200,100,1200,800};
 hud_buttons={{{206,600,250,790}},{{206,480,250,596}},{{206,360,250,476}}};
 rcti e;auto capture=[&](){hud_model.layout.canvas={canvas.winrct.xmin+cr.ipad_canvas_rect.xmin,canvas.winrct.ymin+cr.ipad_canvas_rect.ymin,canvas.winrct.xmin+cr.ipad_canvas_rect.xmax+1,canvas.winrct.ymin+cr.ipad_canvas_rect.ymax+1};ipad_hud_chrome_capture(&win,&screen,hud_model);};
 auto exposed=[&](rcti h){capture();assert(ED_ipad_hud_exposed_rect(&C,&win,&area,&canvas,h,e));};
 // Collapsed headers sit below actual buttons, retaining native bottom/right.
 exposed({208,448,111,211});assert(e.xmin==200&&e.xmax==1139&&e.ymin==106);
 // Expanded controls entering the launcher column reserve the old canvas edge.
 exposed({208,648,111,410});assert(e.xmin==256);
 // Every visible higher panel blocks the extension. Empty panels do not.
 for(Rect *panel:{&hud_model.layout.tools_panel,&hud_model.layout.side_panel,&hud_model.layout.bottom_panel}){
  *panel={220,106,400,400};exposed({208,448,111,211});assert(e.xmin==256);*panel={};
 }
 // Touching a launcher boundary is allowed; one pixel of overlap is not.
 hud_buttons={{{206,212,250,400}}};exposed({208,448,111,211});assert(e.xmin==200);
 exposed({208,448,111,212});assert(e.xmin==256);
 screen.do_refresh=true;exposed({208,448,111,211});assert(e.xmin==256);screen.do_refresh=false;
 exposed({208,448,90,190});assert(e.xmin==256); // Preserve bottom editor/header clipping.
 canvas.flag=RGN_FLAG_HIDDEN;assert(!ED_ipad_hud_exposed_rect(&C,&win,&area,&canvas,{208,448,111,211},e));canvas.flag=0;
 ARegion quad=canvas;area.regionbase.push_back(&quad);exposed({208,448,111,211});assert(e.xmin==256);area.regionbase.pop_back();
 // Native float margins and exposure translate with nonzero split/portrait panes.
 for(int origin:{0,200,900})for(int scale:{1,2}){
  canvas.winrct={origin,origin+799*scale,50,50+899*scale};cr.ipad_canvas_rect={56*scale,739*scale,6*scale,879*scale};
  hud_model.bounds={origin,50,origin+800*scale,50+900*scale};
  hud_buttons={{{origin+6*scale,50+500*scale,origin+50*scale,50+880*scale}}};
  exposed({origin+8*scale,origin+248*scale,50+11*scale,50+111*scale});assert(e.xmin==origin);
  exposed({origin+8*scale,origin+248*scale,50+11*scale,50+550*scale});assert(e.xmin==origin+56*scale);
 }
 wm.windows.clear();assert(!ED_ipad_hud_exposed_rect(&C,&win,&area,&canvas,{},e));
}
''')

    def test_actual_composite_and_old_footprint_after_launcher_or_panel_change(self):
        self.run_native(r'''
int main(){
 RegionRuntime cr,hr;cr.ipad_canvas=true;cr.ipad_canvas_rect={56,539,6,679};
 ARegion canvas{RGN_TYPE_WINDOW,0,RGN_ALIGN_FLOAT,true,1,&cr,{0,599,0,799}};
 ARegion hud{RGN_TYPE_HUD,0,RGN_ALIGN_FLOAT,true,1,&hr,{8,247,11,110}};
 ScrArea area;area.regionbase={&canvas,&hud};bScreen screen;screen.areabase={&area};
 wmWindow win{11,800,&screen};UndoStack undo;WMRuntime runtime{&undo};wmWindowManager wm{{&win},&runtime};
 bContext C{&wm,&win,nullptr,nullptr,nullptr,{}};C.origin=&canvas;hud_model.main=&area;hud_model.bounds={0,0,600,800};
 hud_buttons={{{6,500,50,790}}};hud_model.layout.canvas={56,6,540,680};ipad_hud_chrome_capture(&win,&screen,hud_model);
 ED_ipad_hud_layout_begin(&C,&win,&area,&hud);ED_ipad_hud_layout_end(&C,&win,&area,&hud);ED_ipad_hud_draw_end(&C,&win,&area,&hud);
 auto composite=[&](){std::vector<IPadHUDPresentedRect> rs;ED_ipad_hud_compositor_begin(&C,&win);native_overlap(&C,&win,&area,&hud);ED_ipad_hud_compositor_end(&C,&win,rs);return rs;};
 auto first=composite();assert(first.size()==1&&first[0].xmin==8&&first[0].xmax==247);
 uint64_t gen=first[0].generation;assert(ED_ipad_hud_input_admit(&C,&win,gen));
 for(int n=0;n<10000;++n){auto cached=composite();assert(cached[0].generation==gen&&cached[0].xmin==8);}
 // Higher chrome appearing before redraw refuses the old left fields; receipt
 // continues shielding the old pixels until a completed compositing pass.
 hud_buttons.push_back({{6,10,50,200}});ipad_hud_chrome_capture(&win,&screen,hud_model);assert(!ED_ipad_hud_input_admit(&C,&win,gen));
 assert(ipad_hud_frames.at(uintptr_t(&win)).presented[0].rects[0].xmin==8);
 auto covered=composite();assert(covered[0].xmin==56&&covered[0].generation!=gen);
 hud_buttons.pop_back();hud_model.layout.tools_panel={56,6,160,680};ipad_hud_chrome_capture(&win,&screen,hud_model);
 assert(!ED_ipad_hud_input_admit(&C,&win,gen));
 hud_model.layout.tools_panel={};ipad_hud_chrome_capture(&win,&screen,hud_model);auto restored=composite();assert(restored[0].xmin==8);
 assert(ED_ipad_hud_input_admit(&C,&win,restored[0].generation));
 // HUD movement itself still invalidates prior field geometry, preserving guards.
 hud.winrct.xmin=56;assert(!ED_ipad_hud_input_admit(&C,&win,restored[0].generation));
 assert(C.area==nullptr&&C.region==nullptr);
}
''')

    def test_connected_refresh_changes_only_left_offset_and_preserves_native_init(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(i.WORLD+i.DATA+i.NATIVE+i.REFRESH+r'''
int main(){art.init=hud_region_init;Runtime cr;cr.type=&canvas_art;cr.visible=true;cr.ipad_canvas_rect={56,999,9,999};
 ARegion canvas{RGN_TYPE_WINDOW,RGN_ALIGN_FLOAT,0,&cr};ScrArea area;area.regionbase={&canvas};bContext C{&area,&canvas};
 left_clear=false;UI_ipad_corner_hud_refresh(&C,&area);ED_area_update_region_sizes(&wm,&win,&area);
 assert(new_runtime.offset_x==56&&new_runtime.offset_y==9);
 auto*data=static_cast<HudRegionData*>(new_region.regiondata);data->regionid=RGN_TYPE_WINDOW;data->redo_suppressed=false;
 auto*owned=new_region.regiondata;left_clear=true;UI_ipad_corner_hud_refresh(&C,&area);
 ED_area_update_region_sizes(&wm,&win,&area);assert(new_region.winrct.xmin==3&&new_region.winrct.ymin==9);
 assert(new_region.regiondata==owned&&data->regionid==RGN_TYPE_WINDOW&&!data->redo_suppressed);
 assert(new_region.v2d.initialized&&new_runtime.handlers>=2);
 left_clear=false;UI_ipad_corner_hud_refresh(&C,&area);ED_area_update_region_sizes(&wm,&win,&area);
 assert(new_region.winrct.xmin==56&&new_region.winrct.ymin==9);std::free(new_region.regiondata);
}
''')

    def test_expansion_rechecked_before_final_native_placement_in_same_frame(self):
        offscreen=p.function(p.DRAW,'static void wm_draw_area_offscreen(')
        marker='  /* Expansion/collapse changes the measured HUD span during native layout.'
        start=offscreen.index('#ifdef WITH_APPLE_CROSSPLATFORM',offscreen.index(marker)-45)
        stop=offscreen.index('  ED_area_update_region_sizes(wm, win, area);',start)+len('  ED_area_update_region_sizes(wm, win, area);')
        final=offscreen[start:stop]
        self.assertLess(offscreen.index('ED_region_do_layout('),start)
        self.assertLess(stop,offscreen.index('/* Then do actual drawing of regions. */'))
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(i.WORLD+i.DATA+i.NATIVE+i.REFRESH+r'''
int main(){art.init=hud_region_init;Runtime cr;cr.type=&canvas_art;cr.visible=true;cr.ipad_canvas_rect={56,999,9,999};
 ARegion canvas{RGN_TYPE_WINDOW,RGN_ALIGN_FLOAT,0,&cr};ScrArea area_storage;area_storage.regionbase={&canvas};bContext context{&area_storage,&canvas};
 left_clear=true;corner_block_y=300;fixture_hud_height=100;
 UI_ipad_corner_hud_refresh(&context,&area_storage);ED_area_update_region_sizes(&::wm,&::win,&area_storage);
 assert(new_region.winrct.xmin==3);
 // Native panel sizing changes the full stack after the initial refresh.
 fixture_hud_height=400;new_region.winy=400;new_region.winrct.ymax=new_region.winrct.ymin+399;
 ED_area_tag_region_size_update(&area_storage,&new_region);
 // Frozen old ordering would draw x=3 overlapping the launcher column.
 assert(new_region.winrct.xmin==3&&new_region.winrct.ymax>=corner_block_y);
 bContext*C=&context;ScrArea*area=&area_storage;wmWindowManager*wm=&::wm;wmWindow*win=&::win;
'''+final+r'''
 assert(new_region.winrct.xmin==56&&new_region.winrct.ymin==9&&new_region.winy==400);
 // Collapse fits below launchers and returns left in this same measured pass.
 fixture_hud_height=100;new_region.winy=100;new_region.winrct.ymax=new_region.winrct.ymin+99;
 ED_area_tag_region_size_update(area,&new_region);
'''+final+r'''
 assert(new_region.winrct.xmin==3&&new_region.winrct.ymin==9);std::free(new_region.regiondata);
}
''')

if __name__=='__main__':unittest.main()
