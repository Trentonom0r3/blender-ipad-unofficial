// Canonical tuple expectations are independent of native raw-field setters.
static int checks=0;
#define CHECK(x) do{++checks;if(!(x)){std::cerr<<"CHECK failed "<<__LINE__<<": "<<#x<<"\n";std::abort();}}while(0)
struct Expected{const char*name;int type,val,shift,ctrl;bool repeat=false,any=false;};
static const Expected canonical[]={
 {"VIEW2D_OT_scroller_activate",LEFTMOUSE,KM_PRESS,0,0},
 {"VIEW2D_OT_scroller_activate",MIDDLEMOUSE,KM_PRESS,0,0},
 {"VIEW2D_OT_pan",MIDDLEMOUSE,KM_PRESS,0,0},
 {"VIEW2D_OT_pan",MIDDLEMOUSE,KM_PRESS,1,0},
 {"VIEW2D_OT_pan",MOUSEPAN,KM_ANY,0,0},
 {"VIEW2D_OT_scroll_right",WHEELDOWNMOUSE,KM_PRESS,0,1},
 {"VIEW2D_OT_scroll_right",WHEELRIGHTMOUSE,KM_PRESS,0,0},
 {"VIEW2D_OT_scroll_left",WHEELUPMOUSE,KM_PRESS,0,1},
 {"VIEW2D_OT_scroll_left",WHEELLEFTMOUSE,KM_PRESS,0,0},
 {"VIEW2D_OT_scroll_down",WHEELDOWNMOUSE,KM_PRESS,1,0},
 {"VIEW2D_OT_scroll_up",WHEELUPMOUSE,KM_PRESS,1,0},
 {"VIEW2D_OT_ndof",NDOF_MOTION,KM_ANY,0,0},
 {"VIEW2D_OT_zoom_out",WHEELOUTMOUSE,KM_PRESS,0,0},
 {"VIEW2D_OT_zoom_in",WHEELINMOUSE,KM_PRESS,0,0},
 {"VIEW2D_OT_zoom_out",EVT_PADMINUS,KM_PRESS,0,0,true},
 {"VIEW2D_OT_zoom_in",EVT_PADPLUSKEY,KM_PRESS,0,0,true},
 {"VIEW2D_OT_zoom",MOUSEPAN,KM_ANY,0,1},
 {"VIEW2D_OT_smoothview",TIMER1,KM_ANY,0,0,false,true},
 {"VIEW2D_OT_scroll_down",WHEELDOWNMOUSE,KM_PRESS,0,0},
 {"VIEW2D_OT_scroll_up",WHEELUPMOUSE,KM_PRESS,0,0},
 {"VIEW2D_OT_scroll_right",WHEELDOWNMOUSE,KM_PRESS,0,0},
 {"VIEW2D_OT_scroll_left",WHEELUPMOUSE,KM_PRESS,0,0},
 {"VIEW2D_OT_zoom",MIDDLEMOUSE,KM_PRESS,0,1},
 {"VIEW2D_OT_zoom",MOUSEZOOM,KM_ANY,0,0},
 {"VIEW2D_OT_zoom_border",EVT_BKEY,KM_PRESS,1,0},
};
static wmKeyMapItem* item_at(wmKeyMap*km,int pos){auto*k=static_cast<wmKeyMapItem*>(km->items.first);while(--pos&&k)k=k->next;return k;}
static void verify_map(wmKeyMap*km,bool effective,bool ndof,int idbase=0){
 CHECK(STREQ(km->idname,"View2D"));CHECK(km->spaceid==0);CHECK(km->regionid==0);CHECK(!km->owner_id[0]);CHECK(!km->poll&&!km->poll_modal_item&&!km->modal_items);CHECK(!km->diff_items.first&&!km->diff_items.last);
 CHECK(km->flag==(effective?KEYMAP_USER:KEYMAP_UPDATE));CHECK(km->kmi_id==idbase+25);
 int pos=0;std::set<int>ids;wmKeyMapItem*previous=nullptr;
 LISTBASE_FOREACH(wmKeyMapItem*,kmi,&km->items){
  CHECK(pos<25);const Expected&e=canonical[pos];++pos;
  CHECK(kmi->prev==previous);previous=kmi;CHECK(STREQ(kmi->idname,e.name));CHECK(kmi->id==idbase+pos);CHECK(ids.insert(kmi->id).second);
  CHECK(kmi->type==e.type);CHECK(kmi->val==e.val);CHECK(kmi->direction==KM_ANY);
  CHECK(kmi->shift==(e.any?KM_ANY:e.shift));CHECK(kmi->ctrl==(e.any?KM_ANY:e.ctrl));CHECK(kmi->alt==(e.any?KM_ANY:0));CHECK(kmi->oskey==(e.any?KM_ANY:0));CHECK(kmi->hyper==(e.any?KM_ANY:0));
  CHECK(kmi->keymodifier==EVENT_NONE);CHECK(kmi->maptype==0);CHECK(kmi->propvalue==0);CHECK(!kmi->propvalue_str[0]);
  CHECK(kmi->flag==((effective?0:KMI_UPDATE)|(e.repeat?0:KMI_REPEAT_IGNORE)));
  IDProperty*p=kmi->properties;CHECK(p);CHECK(p->type==IDP_GROUP);CHECK(p->subtype==0);CHECK(p->flag==0);CHECK(STREQ(p->name,"wmOpItemProp"));CHECK(p->len==0);CHECK(p->totallen==0);CHECK(!p->next&&!p->prev);CHECK(!p->data.group.first&&!p->data.group.last);CHECK(!p->data.pointer);CHECK(p->data.val==0&&p->data.val2==0);CHECK(!p->ui_data);
  CHECK(kmi->ptr);CHECK(kmi->ptr->owner_id==nullptr);CHECK(kmi->ptr->data==p);CHECK(kmi->ptr->ancestors.is_empty());
  auto*ot=WM_operatortype_find(kmi->idname,false);CHECK(kmi->ptr->type==(ot?ot->srna:&RNA_OperatorProperties));
  CHECK((pos==12&&!ndof)==(kmi->ptr->type==&RNA_OperatorProperties));
 }
 CHECK(pos==25);CHECK(km->items.last==previous);CHECK(!previous->next);
}
static void map_json(wmKeyMap*km){
 std::cout<<"{\"flag\":"<<km->flag<<",\"kmi_id\":"<<km->kmi_id<<",\"items\":[";int pos=0;
 LISTBASE_FOREACH(wmKeyMapItem*,k,&km->items){
  if(pos++)std::cout<<",";auto*p=k->properties;
  std::cout<<"{\"position\":"<<pos<<",\"id\":"<<k->id<<",\"idname\":\""<<k->idname<<"\",\"type\":"<<k->type<<",\"val\":"<<int(k->val)<<",\"direction\":"<<int(k->direction)<<",\"shift\":"<<int(k->shift)<<",\"ctrl\":"<<int(k->ctrl)<<",\"alt\":"<<int(k->alt)<<",\"oskey\":"<<int(k->oskey)<<",\"hyper\":"<<int(k->hyper)<<",\"keymodifier\":"<<k->keymodifier<<",\"maptype\":"<<int(k->maptype)<<",\"propvalue\":"<<k->propvalue<<",\"flag\":"<<int(k->flag)<<",\"properties\":{\"name\":\""<<p->name<<"\",\"type\":"<<int(p->type)<<",\"subtype\":"<<int(p->subtype)<<",\"flag\":"<<p->flag<<",\"len\":"<<p->len<<",\"totallen\":"<<p->totallen<<",\"children_empty\":true,\"ui_data_null\":true},\"pointer\":{\"data_coherent\":true,\"owner_null\":true,\"ancestors_empty\":true,\"srna\":\""<<k->ptr->type->identifier<<"\"}}";
 }
 std::cout<<"]}";
}
static void one_case(bool ndof){
 register_operators(ndof);wmRuntime runtime{};wmWindowManager wm{};wm.runtime=&runtime;G_MAIN->wm.first=&wm;
 auto*defaultconf=WM_keyconfig_new(&wm,"Blender",false);auto*addonconf=WM_keyconfig_new(&wm,"Blender addon",false);auto*userconf=WM_keyconfig_new(&wm,"Blender user",false);
 runtime.defaultconf=defaultconf;runtime.addonconf=addonconf;runtime.userconf=userconf;
 CHECK(runtime.keyconfigs.first==defaultconf);CHECK(runtime.keyconfigs.last==userconf);CHECK(defaultconf->next==addonconf);CHECK(addonconf->next==userconf);CHECK(defaultconf->flag==0);CHECK(addonconf->flag==0);CHECK(userconf->flag==0);
 wmKeyMap*km=rna_KeyMaps_new(defaultconf,nullptr,"View2D",0,0,false,false);CHECK(km);CHECK(defaultconf->keymaps.first==km);CHECK(defaultconf->keymaps.last==km);CHECK(km->flag==KEYMAP_UPDATE);CHECK(km->kmi_id==0);
 actual_import(km);verify_map(km,false,ndof);
 // Actual canonical effective construction. No user/addon map exists here.
 auto*effective=wm_keymap_patch_update(&userconf->keymaps,km,nullptr,nullptr);CHECK(userconf->keymaps.first==effective);CHECK(userconf->keymaps.last==effective);
 verify_map(km,false,ndof);verify_map(effective,true,ndof);
 CHECK(!wm_keymap_test_and_clear_update(effective));verify_map(km,false,ndof);
 for(int i=1;i<=25;++i){auto*a=item_at(km,i);auto*b=item_at(effective,i);CHECK(a!=b);CHECK(a->properties!=b->properties);CHECK(a->ptr!=b->ptr);CHECK(a->ptr->type==b->ptr->type);CHECK(a->id==b->id);}
 wmEvent event{};event.type=MOUSEPAN;event.val=KM_NOTHING;
 CHECK(item_at(effective,5)->val==KM_ANY);CHECK(wm_eventmatch(&event,item_at(effective,5)));CHECK(!wm_eventmatch(&event,item_at(effective,17)));
 event.modifier=KM_CTRL;CHECK(!wm_eventmatch(&event,item_at(effective,5)));CHECK(wm_eventmatch(&event,item_at(effective,17)));
 event.modifier=KM_SHIFT;CHECK(!wm_eventmatch(&event,item_at(effective,5)));CHECK(!wm_eventmatch(&event,item_at(effective,17)));
 // Public copy API allocates independent raw group/ptr, retains repeat and tags
 // new item UPDATE; direct internal copy clears UPDATE and does not reassign id.
 wmKeyMap copy_target{};copy_target.kmi_id=73;
 auto*public_copy=rna_KeyMap_item_new_from_item(&copy_target,nullptr,item_at(km,5),false);CHECK(public_copy->id==74);CHECK(public_copy->flag==(KMI_REPEAT_IGNORE|KMI_UPDATE));CHECK(public_copy->properties!=item_at(km,5)->properties);CHECK(public_copy->ptr->owner_id==nullptr);CHECK(public_copy->ptr->type==WM_operatortype_find("VIEW2D_OT_pan",false)->srna);
 auto*internal_copy=wm_keymap_item_copy(item_at(km,5));CHECK(internal_copy->id==5);CHECK(internal_copy->flag==KMI_REPEAT_IGNORE);CHECK(internal_copy->properties!=item_at(km,5)->properties);
 // Fresh ordinary map can have canonical order with ids26..50 after clear/import.
 // Do not infer fixed IDs from positions or reset id counter in a classifier.
 WM_keymap_clear(km);CHECK(km->kmi_id==25);CHECK(!km->items.first&&!km->items.last);actual_import(km);verify_map(km,false,ndof,25);
 auto*reconstructed=wm_keymap_patch_update(&userconf->keymaps,km,nullptr,nullptr);verify_map(reconstructed,true,ndof,25);verify_map(km,false,ndof,25);
 std::cout<<"{\"runtime_config_membership\":true,\"ndof_registered\":"<<(ndof?"true":"false")<<",\"default_after_reimport\":";map_json(km);std::cout<<",\"effective_after_reimport\":";map_json(reconstructed);std::cout<<",\"pan_item_val\":-1,\"pan_event_val\":0,\"pan_native_match\":true,\"ctrlzoom_native_match\":true,\"default_update_preserved\":true,\"fresh_ids\":[1,25],\"reimport_ids\":[26,50],\"public_copy_assigned_id\":74}";
}
int main(){
 std::cout<<"{\"status\":\"PASS\",\"cases\":[";one_case(true);std::cout<<",";one_case(false);CHECK(refine_calls==0);CHECK(sanitize_visits>0);std::cout<<"],\"assertions\":"<<checks<<",\"calloc_calls\":"<<calloc_calls<<",\"new_calls\":"<<new_calls<<",\"dup_calls\":"<<dup_calls<<",\"sanitize_visits\":"<<sanitize_visits<<",\"unexpected_pointer_refine\":"<<refine_calls<<"}\n";
}
