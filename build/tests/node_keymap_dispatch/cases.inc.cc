static int scenarios=0;
static wmKeyMapItem*item_at(wmKeyMap*map,int p){auto*i=static_cast<wmKeyMapItem*>(map->items.first);while(--p&&i)i=i->next;return i;}
struct Connected{
 wmWindowManager wm;wmRuntime runtime;wmWindow win;ScrArea area;ARegion region;ARegionRuntime rr;bScreen screen;bContext C;wmEventHandler_Keymap handler{};wmKeyMap*def=nullptr,*eff=nullptr;
 Connected(bool ndof=true){register_operators(ndof);wm.runtime=&runtime;G_MAIN->wm.first=&wm;
 runtime.defaultconf=WM_keyconfig_new(&wm,"Blender",false);runtime.addonconf=WM_keyconfig_new(&wm,"Blender addon",false);runtime.userconf=WM_keyconfig_new(&wm,"Blender user",false);
 def=rna_KeyMaps_new(runtime.defaultconf,nullptr,"View2D",SPACE_EMPTY,RGN_TYPE_WINDOW,false,false);actual_import(def);eff=wm_keymap_patch_update(&runtime.userconf->keymaps,def,nullptr,nullptr);
 region.runtime=&rr;BLI_addtail(&area.regionbase,&region);handler.head.type=WM_HANDLER_TYPE_KEYMAP;handler.keymap=def;BLI_addtail(&rr.handlers,&handler.head);
 C.wm=&wm;C.win=&win;C.area=&area;C.region=&region;C.screen=&screen;U={};counts={};scalar_values.clear();last_op=nullptr;interface_locked=false;interface_checks=0;}
 wmEvent event(bool zoom=false){wmEvent e;e.type=MOUSEPAN;e.val=KM_NOTHING;e.modifier=zoom?KM_CTRL:0;e.flag=WM_EVENT_IS_PENCIL_PRECISION_PAN;return e;}
 eIPadNodeView2DDispatch classify(wmEvent&e){return wm_ipad_node_view2d_dispatch(&C,&e,&rr.handlers,&handler,eff,item_at(eff,e.modifier?17:5));}
 int dispatch(wmEvent&e){return wm_handlers_do_keymap_with_keymap_handler(&C,&e,&rr.handlers,&handler,eff,false);}
};
static void no_lifecycle(){assert(!counts.alloc&&!counts.free&&!counts.create&&!counts.operator_free&&!counts.ids&&!counts.reports&&!counts.finished&&!counts.last_init&&!counts.redraw&&!counts.sync&&!counts.mousemove&&!counts.cursor&&!counts.timer&&!counts.modal_add&&!counts.ui_cancel&&!counts.rect_changed&&!counts.region_co);}
static void stock_positives(){for(bool ndof:{true,false})for(bool zoom:{false,true}){Connected f(ndof);auto e=f.event(zoom);auto before=e;assert(f.classify(e)==(zoom?eIPadNodeView2DDispatch::StockCtrlZoom:eIPadNodeView2DDispatch::StockPan));counts={};assert(f.dispatch(e)==WM_HANDLER_BREAK);assert(counts.poll==1);no_lifecycle();assert(std::memcmp(&e,&before,sizeof e)==0);assert(f.region.v2d.cur.xmin==0&&f.region.v2d.cur.xmax==100&&f.region.v2d.cur.ymin==0&&f.region.v2d.cur.ymax==100);++scenarios;}}
static void mutation_matrix(){
 for(int pos=1;pos<=25;++pos)for(int field=0;field<18;++field){Connected f;auto e=f.event();auto*i=item_at(f.eff,pos);
 switch(field){case 0:i->id=-1;break;case 1:i->maptype=1;break;case 2:i->direction=1;break;case 3:i->val=KM_RELEASE;break;case 4:i->shift=KM_ANY;break;case 5:i->ctrl=KM_ANY;break;case 6:i->alt=KM_ANY;break;case 7:i->oskey=KM_ANY;break;case 8:i->hyper=KM_ANY;break;case 9:i->keymodifier=EVT_BKEY;break;case 10:i->propvalue=1;break;case 11:i->propvalue_str[0]='X';break;case 12:i->flag^=KMI_REPEAT_IGNORE;break;case 13:i->properties->len=1;break;case 14:i->ptr->data=nullptr;break;case 15:i->ptr->owner_id=reinterpret_cast<ID*>(&f);break;case 16:i->ptr->type=&RNA_Struct;break;case 17:i->idname[0]='X';break;}
 // ANY modifier fields of TIMER1 were already ANY; replace those with NOTHING.
 if(pos==18&&field>=4&&field<=8){if(field==4)i->shift=0;if(field==5)i->ctrl=0;if(field==6)i->alt=0;if(field==7)i->oskey=0;if(field==8)i->hyper=0;}
 assert(f.classify(e)==eIPadNodeView2DDispatch::None);++scenarios;
 }
 for(int which=0;which<16;++which){Connected f;auto e=f.event();
 switch(which){case 0:f.eff->flag|=KEYMAP_UPDATE;break;case 1:f.eff->flag|=KEYMAP_USER_MODIFIED;break;case 2:f.def->flag|=KEYMAP_USER;break;case 3:f.def->owner_id[0]='X';break;case 4:f.handler.post.user_data=&f;break;case 5:f.handler.dynamic.user_data=&f;break;case 6:f.handler.head.flag=1;break;case 7:f.handler.keymap=f.eff;break;case 8:f.handler.keymap_tool=reinterpret_cast<bToolRef*>(&f);break;case 9:f.rr.handlers={};break;case 10:f.runtime.keyconfigs={};break;case 11:f.def->kmi_id++;break;case 12:f.eff->items.last=f.eff->items.first;break;case 13:item_at(f.eff,4)->id=item_at(f.eff,5)->id;break;case 14:f.eff->diff_items.first=&f;break;case 15:f.eff->modal_items=&f;break;}
 assert(f.classify(e)==eIPadNodeView2DDispatch::None);++scenarios;
 }
}
static void native_fallback(){for(bool zoom:{false,true})for(int why=0;why<4;++why){Connected f;auto e=f.event(zoom);if(why==0)e.flag=0;if(why==1)f.eff->flag|=KEYMAP_UPDATE;if(why==2)item_at(f.eff,1)->flag|=KMI_INACTIVE;if(why==3)f.def->owner_id[0]='X';
 assert(f.classify(e)==eIPadNodeView2DDispatch::None);counts={};assert(f.dispatch(e)==WM_HANDLER_BREAK);assert(counts.create==1&&counts.alloc==1&&counts.finished==1);assert(f.region.v2d.cur.xmin!=0||f.region.v2d.cur.ymin!=0||f.region.v2d.cur.xmax!=100||f.region.v2d.cur.ymax!=100);++scenarios;}
 {Connected f;auto e=f.event();f.C.py_dict=&f;counts={};assert(f.classify(e)==eIPadNodeView2DDispatch::None);assert(counts.context==0);++scenarios;}
 {Connected f;auto e=f.event();interface_locked=true;assert(f.dispatch(e)==WM_HANDLER_CONTINUE);assert(!counts.poll&&!counts.create&&!counts.alloc);++scenarios;}
 {Connected f;auto e=f.event();f.region.v2d.keepofs=V2D_LOCKOFS_X|V2D_LOCKOFS_Y;assert(f.dispatch(e)==WM_HANDLER_CONTINUE);assert(counts.poll==1&&!counts.create);++scenarios;}
}

static void post_mutate(wmKeyMap*,wmKeyMapItem*,void*data){++post_calls;static_cast<wmEvent*>(data)->modifier=KM_SHIFT;}
static void extra_controls(){
 {Connected f;auto e=f.event();f.handler.post.post_fn=post_mutate;f.handler.post.user_data=&e;post_calls=0;assert(f.classify(e)==eIPadNodeView2DDispatch::None);counts={};assert(f.dispatch(e)==WM_HANDLER_BREAK);assert(post_calls==1&&e.modifier==KM_SHIFT&&counts.create==1);++scenarios;}
 {Connected f;auto e=f.event();f.def->flag=KEYMAP_EXPANDED|KEYMAP_CHILDREN_EXPANDED;f.eff->flag|=KEYMAP_EXPANDED|KEYMAP_CHILDREN_EXPANDED;item_at(f.eff,5)->flag|=KMI_EXPANDED;assert(f.classify(e)==eIPadNodeView2DDispatch::StockPan);counts={};assert(f.dispatch(e)==WM_HANDLER_BREAK);no_lifecycle();++scenarios;}
 {Connected f;auto e=f.event();WM_keymap_clear(f.def);actual_import(f.def);f.eff=wm_keymap_patch_update(&f.runtime.userconf->keymaps,f.def,nullptr,nullptr);assert(item_at(f.eff,5)->id==30);assert(f.classify(e)==eIPadNodeView2DDispatch::StockPan);counts={};assert(f.dispatch(e)==WM_HANDLER_BREAK);no_lifecycle();++scenarios;}
 {Connected f;auto e=f.event();item_at(f.eff,1)->properties->data.group.first=&f;assert(f.classify(e)==eIPadNodeView2DDispatch::None);++scenarios;}
 {Connected f;auto e=f.event();item_at(f.eff,1)->properties->data.group.last=&f;assert(f.classify(e)==eIPadNodeView2DDispatch::None);++scenarios;}
 {Connected f;auto e=f.event();auto*i=item_at(f.eff,1);BLI_remlink(&f.eff->items,i);BLI_addtail(&f.eff->items,i);assert(f.classify(e)==eIPadNodeView2DDispatch::None);++scenarios;}
 {Connected f;auto e=f.event();rna_KeyMap_item_new(f.eff,nullptr,"view2d.pan",MOUSEPAN,KM_ANY,false,0,0,0,0,0,0,KM_ANY,false,false);assert(f.classify(e)==eIPadNodeView2DDispatch::None);++scenarios;}
 {Connected f;auto e=f.event();auto*other=WM_keyconfig_new(&f.wm,"custom",true);(void)other;std::snprintf(U.keyconfigstr,sizeof U.keyconfigstr,"custom");assert(f.classify(e)==eIPadNodeView2DDispatch::None);++scenarios;}
 {Connected f;auto e=f.event();auto*duplicate=wm_keymap_copy(f.def);BLI_addtail(&f.runtime.defaultconf->keymaps,duplicate);assert(f.classify(e)==eIPadNodeView2DDispatch::None);++scenarios;}
 {Connected f;auto e=f.event(true);f.region.v2d.keepzoom=V2D_LOCKZOOM_X|V2D_LOCKZOOM_Y;assert(f.dispatch(e)==WM_HANDLER_CONTINUE);assert(counts.poll==1&&!counts.create);++scenarios;}
 {Connected f;auto e=f.event();assert(native_invoke(&f.C,WM_operatortype_find("VIEW2D_OT_pan",false),&e)==OPERATOR_FINISHED);assert(counts.create==1&&(f.region.v2d.cur.xmin!=0||f.region.v2d.cur.ymin!=0));++scenarios;}
}
int main(){stock_positives();mutation_matrix();native_fallback();extra_controls();std::cout<<"connected actual raw-import/classifier/regular-handler/private-call/invoke/poll/View2D scenarios passed "<<scenarios<<"\n";}
