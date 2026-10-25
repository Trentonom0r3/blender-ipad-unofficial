/* SPDX-License-Identifier: GPL-2.0-or-later
 * Geometry fixture instrumentation: registered original owner, font metrics,
 * native matrix conversion and allocator are explicit model boundaries.
 * Production policy/readiness functions are extracted by the Python runner. */
int main(){int checks=0;
 for(float v:{1.f,1.25f,1.5f,2.f,3.f}){scale=v;unit=int(std::floor(18*v+.5f))+2*std::max(1,int(72*v/64));
  for(int w:{44,80,120,160,200,250,400,800})for(int h:{44,60,80,100,140,300}){
   const int bw[2]={int(95*v),int(105*v)};rcti b{0,w-1,0,h-1};int z[2];for(bool horizontal:{false,true})if(ipad_knife_hud_fit(b,bw,std::ceil(44*v)+1,horizontal,z)){
    assert(int(v*(z[0]+.5f))<=w&&int(v*(z[1]+.5f))<=h);++checks;
   }
  }
 }
 scale=1.25f;unit=25;RegionRuntime ra,rb,rh;ra.ipad_canvas_rect={0,399,0,99};rb.ipad_canvas_rect={0,399,0,299};ARegion a,b,hud;a.runtime=&ra;b.runtime=&rb;hud.runtime=&rh;hud.regiontype=RGN_TYPE_HUD;a.next=&b;b.next=&hud;a.winrct={0,399,0,99};b.winrct={420,819,0,299};ScrArea area;area.regionbase.first=&a;bContext C{&area,&a};IPadKnifeHUDLayout v;assert(ipad_knife_hud_layout(&C,v)&&v.fits&&v.canvas==&a&&v.horizontal);++checks;
 ra.ipad_canvas_rect={0,89,0,89};assert(ipad_knife_hud_layout(&C,v)&&v.fits&&v.canvas==&b&&!v.horizontal);++checks;
 rb.visible=false;assert(ipad_knife_hud_layout(&C,v)&&!v.fits&&v.canvas==&a);++checks;rb.visible=true;ra.ipad_canvas_rect={0,399,0,299};assert(ipad_knife_hud_layout(&C,v)&&v.fits&&!v.horizontal);++checks;
 HudRegionData data{};hud.regiondata=&data;data.ipad_knife_fit=true;data.ipad_knife_scale=scale;data.ipad_knife_canvas=uintptr_t(&a);data.ipad_knife_bounds=ipad_knife_hud_bounds(&a);data.ipad_knife_button_width[0]=140;data.ipad_knife_button_width[1]=150;data.ipad_knife_button_height=55;
 hud.winrct={6,205,6,125};uiBlock block;PanelType pt;PanelRuntime pr{&block};Panel panel{nullptr,true,&pt,&pr};hud.panels.first=&panel;IPadKnifeHUDAction req[2]{{{},wmIPadKnifeAction::Confirm},{{},wmIPadKnifeAction::Cancel}};
 for(int i=0;i<2;++i){auto button=std::make_unique<uiBut>();button->func_argN=&req[i];button->rect={10.f,200.f,10.f+56*i,66.f+56*i};block.buttons.push_back(std::move(button));}
 assert(UI_ipad_knife_hud_geometry_ready(&C,&hud));++checks;
 block.buttons[0]->rect.xmax=100;assert(!UI_ipad_knife_hud_geometry_ready(&C,&hud));block.buttons[0]->rect.xmax=200;++checks;
 block.buttons[1]->rect.ymax=block.buttons[1]->rect.ymin+54;assert(!UI_ipad_knife_hud_geometry_ready(&C,&hud));block.buttons[1]->rect.ymax=122;++checks;
 block.buttons[1]->flag=UI_BUT_DISABLED;assert(!UI_ipad_knife_hud_geometry_ready(&C,&hud));block.buttons[1]->flag=0;++checks;
 req[1].action=wmIPadKnifeAction::Confirm;assert(!UI_ipad_knife_hud_geometry_ready(&C,&hud));req[1].action=wmIPadKnifeAction::Cancel;++checks;
 hud.winrct.ymax=100;assert(!UI_ipad_knife_hud_geometry_ready(&C,&hud));hud.winrct.ymax=125;++checks;
 ra.ipad_canvas_rect.xmax--;assert(!UI_ipad_knife_hud_geometry_ready(&C,&hud));ra.ipad_canvas_rect.xmax++;++checks;
 data.ipad_knife_scale=2;assert(!UI_ipad_knife_hud_geometry_ready(&C,&hud));data.ipad_knife_scale=scale;++checks;
 data.ipad_knife_fit=false;assert(!UI_ipad_knife_hud_geometry_ready(&C,&hud));++checks;
 std::cout<<"PASS "<<checks<<" source-executing fit/selection/actual-button readiness checks; WM owner,font,matrix,allocator boundaries explicit\n";}
