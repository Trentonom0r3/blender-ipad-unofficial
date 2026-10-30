static int scenarios=0;
static bool native_knife_poll(bContext*){return true;}
static wmOperatorStatus replacement_zoom_invoke(bContext*C,wmOperator*op,const wmEvent*e){return viewzoom_invoke(C,op,e);}
static wmOperatorStatus replacement_zoom_exec(bContext*C,wmOperator*op){return viewzoom_exec(C,op);}
static wmOperatorStatus replacement_zoom_modal(bContext*C,wmOperator*op,const wmEvent*e){return view3d_navigate_modal_fn(C,op,e);}
static void replacement_zoom_cancel(bContext*C,wmOperator*op){view3d_navigate_cancel_fn(C,op);}
static bool replacement_zoom_poll(bContext*C){return view3d_zoom_or_dolly_poll(C);}
static bool replacement_python_poll(bContext*,wmOperatorType*){return true;}
static void replacement_extension(){}
static wmKeyMapItem*zoom_item(wmKeyMap*map){LISTBASE_FOREACH(wmKeyMapItem*,i,&map->items)if(STREQ(i->idname,"VIEW3D_OT_zoom")&&i->type==MOUSEPAN)return i;return nullptr;}
static wmKeyMapItem*panning_item(wmKeyMap*map){LISTBASE_FOREACH(wmKeyMapItem*,i,&map->items)if(i->propvalue==KNF_MODAL_PANNING)return i;return nullptr;}
struct ConnectedKnife{
 Main main;wmWindowManager wm;wmRuntime runtime;wmWindow win;wmWindowRuntime wr;
 ScrArea area;ARegion region;ARegionRuntime rr;bScreen screen;Scene scene;ViewLayer layer;
 Base base;Object object;Mesh mesh;View3D view;RegionView3D rv;Depsgraph deps;bContext C;
 wmEventHandler_Keymap handler{};wmOperatorType knife,zoom,move,rotate;StructRNA ks,zs,ms,rs;
 wmKeyMap *def=nullptr,*eff=nullptr,*modaldef=nullptr,*modaleff=nullptr;wmOperator*owner_op=nullptr;
 ConnectedKnife(bool start=true,bool swapped=false){
  G_MAIN=&main;registry.clear();lifetimes.clear();scalar_values.clear();native_queue.clear();native_trace.clear();native_sizes.clear();U={};wm_eventemulation_mouse=EVENT_NONE;
  nav_allocations=nav_frees=autokeys=knife_starts=0;knife_start_had_registered_owner=false;
  wm.runtime=&runtime;wm.id.session_uid=11;screen.id.session_uid=12;scene.id.session_uid=13;object.id.session_uid=14;mesh.id.session_uid=15;
  BLI_addtail(&main.wm,&wm);BLI_addtail(&main.screens,&screen);BLI_addtail(&main.scenes,&scene);BLI_addtail(&main.objects,&object);BLI_addtail(&main.meshes,&mesh);
  BLI_addtail(&wm.windows,&win);win.runtime=&wr;win.screen=&screen;win.scene=&scene;BLI_addtail(&screen.areabase,&area);area.spacetype=SPACE_VIEW3D;
  region.runtime=&rr;region.regiondata=&rv;region.winrct={0,1000,0,1000};BLI_addtail(&area.regionbase,&region);BLI_addtail(&area.spacedata,&view);
  BLI_addtail(&scene.view_layers,&layer);BLI_addtail(&layer.object_bases,&base);layer.basact=&base;base.object=&object;object.data=&mesh;
  C.wm=&wm;C.win=&win;C.area=&area;C.region=&region;C.screen=&screen;C.object=&object;C.depsgraph=&deps;audit_active_window=&win;
  zoom.srna=&zs;VIEW3D_OT_zoom(&zoom);
  knife.srna=&ks;knife.ipad_lifetime_id=16;MESH_OT_knife_tool(&knife);
  registry[zoom.idname]=&zoom;registry[knife.idname]=&knife;
  move=zoom;move.name="Move View";move.idname="VIEW3D_OT_move";move.srna=&ms;move.poll=view3d_location_poll;move.invoke=viewmove_invoke;move.exec=nullptr;registry[move.idname]=&move;
  rotate=zoom;rotate.name="Rotate View";rotate.idname="VIEW3D_OT_rotate";rotate.srna=&rs;rotate.poll=view3d_rotation_poll;rotate.invoke=viewrotate_invoke;rotate.exec=nullptr;registry[rotate.idname]=&rotate;
  runtime.defaultconf=WM_keyconfig_new(&wm,"Blender",false);runtime.userconf=WM_keyconfig_new(&wm,"Blender user",false);
  def=rna_KeyMaps_new(runtime.defaultconf,nullptr,"3D View",SPACE_VIEW3D,RGN_TYPE_WINDOW,false,false);
  actual_import_view3d_pan(def,swapped);
  eff=wm_keymap_patch_update(&runtime.userconf->keymaps,def,nullptr,nullptr);
  modaldef=knifetool_modal_keymap(runtime.defaultconf);actual_import_knife_modal(modaldef);
  modaleff=wm_keymap_patch_update(&runtime.userconf->keymaps,modaldef,nullptr,nullptr);knife.modalkeymap=modaldef;
  handler.head.type=WM_HANDLER_TYPE_KEYMAP;handler.keymap=def;BLI_addtail(&rr.handlers,&handler.head);
  interface_locked=false;counts={};last_op=nullptr;
  if(start)begin();
 }
 void begin(){wmEvent down;down.type=LEFTMOUSE;down.val=KM_PRESS;down.mval[0]=110;down.mval[1]=100;
  assert(win.modalhandlers.first==nullptr);assert(wm_operator_invoke(&C,&knife,&down,nullptr,nullptr,false,true)==OPERATOR_RUNNING_MODAL);owner_op=last_op;assert(owner_op&&win.modalhandlers.first);
  wmIPadKnifeOwner owner;assert(WM_ipad_knife_owner_capture(&C,&win,&area,owner));assert(owner.values[K_OPERATOR]==uintptr_t(owner_op));assert(knife_start_had_registered_owner&&knife_starts==1);assert(data()->mode==MODE_DRAGGING&&data()->is_drag_hold);
  counts={};nav_allocations=nav_frees=autokeys=0;native_trace.clear();
 }
 KnifeTool_OpData*data(){return static_cast<KnifeTool_OpData*>(owner_op->customdata);}
 void modal(wmEvent&e){wmEvent_ModalMapStore save;wm_event_modalkeymap_begin(&C,owner_op,&e,&save);assert(e.type==MOUSEPAN);auto result=knifetool_modal(&C,owner_op,&e);assert(result==OPERATOR_PASS_THROUGH&&actual_modal_status_tail(result)==WM_HANDLER_CONTINUE);wm_event_modalkeymap_end(&e,&save);assert(owner_op&&win.modalhandlers.first);}
 wmEvent event(){wmEvent e;e.type=MOUSEPAN;e.val=KM_NOTHING;e.flag=WM_EVENT_IS_PENCIL_PRECISION_PAN;e.modifier=KM_CTRL;e.xy[0]=120;e.xy[1]=797;e.prev_xy[0]=115;e.prev_xy[1]=800;return e;}
 eIPadNativePanDispatch classify(wmEvent&e){return wm_ipad_knife_pan_zoom_dispatch(&C,&e,&rr.handlers,&handler,eff,zoom_item(eff));}
 int dispatch(wmEvent&e){return wm_handlers_do_keymap_with_keymap_handler(&C,&e,&rr.handlers,&handler,eff,false);}
};
static void no_allocation(const ConnectedKnife&f){assert(!counts.create&&!counts.alloc&&!counts.operator_free&&!counts.finished&&!nav_allocations&&!nav_frees);assert(f.rv.dist==10);}
static void positives(){for(bool swapped:{false,true})for(int mode:{MODE_IDLE,MODE_DRAGGING,MODE_CONNECT}){ConnectedKnife f(true,swapped);f.data()->mode=mode;auto e=f.event();auto before=e;
 wmEvent ctrl;ctrl.type=EVT_LEFTCTRLKEY;ctrl.val=KM_PRESS;ctrl.modifier=KM_CTRL;wmEvent_ModalMapStore save;wm_event_modalkeymap_begin(&f.C,f.owner_op,&ctrl,&save);assert(ctrl.type==EVT_MODAL_MAP&&ctrl.val==KNF_MODAL_IGNORE_SNAP_ON);assert(knifetool_modal(&f.C,f.owner_op,&ctrl)==OPERATOR_RUNNING_MODAL);wm_event_modalkeymap_end(&ctrl,&save);assert(f.data()->ignore_vert_snapping&&f.data()->ignore_edge_snapping);f.modal(e);
 assert(ED_view3d_native_zoom_type_is(&f.zoom)&&ED_mesh_knife_modal_navigation_may_be_denied(f.owner_op));assert(f.classify(e)==eIPadNativePanDispatch::StockKnifeCtrlZoom);counts={};
 assert(f.dispatch(e)==WM_HANDLER_BREAK);assert(counts.poll==1);no_allocation(f);assert(std::memcmp(&e,&before,sizeof(e))==0);assert(f.owner_op&&f.win.modalhandlers.first);++scenarios;}
 std::cout<<"PASS actual initial native Knife registration -> strict original owner -> chosen static dispatch -> full invoke -> real poll -> refusal before allocation\n";}
static void fallbacks(){for(int why=0;why<12;++why){ConnectedKnife f;auto e=f.event();
 switch(why){case 0:e.flag=0;break;case 1:U.flag|=USER_TWOBUTTONMOUSE;break;case 2:f.data()->mode=MODE_PANNING;break;case 3:f.owner_op->opm=f.owner_op;break;case 4:f.zoom.invoke=replacement_zoom_invoke;break;case 5:f.eff->flag|=KEYMAP_UPDATE;break;case 6:f.C.py_dict=&f;break;case 7:f.mesh.id.session_uid++;break;case 8:panning_item(f.modaleff)->type=EVT_BKEY;break;case 9:panning_item(f.modaleff)->val=KM_PRESS;break;case 10:f.handler.post.user_data=&f;break;case 11:e.flag|=WM_EVENT_MULTITOUCH_TWO_FINGERS;break;}
 assert(f.classify(e)==eIPadNativePanDispatch::None);counts={};assert(f.dispatch(e)==WM_HANDLER_BREAK);assert(counts.create==1&&counts.finished==1&&nav_allocations==1&&nav_frees==1);assert(std::fabs(f.rv.dist-10.197044f)<.00001f);++scenarios;
 }
 {ConnectedKnife f(false);auto e=f.event();assert(f.classify(e)==eIPadNativePanDispatch::None);assert(f.dispatch(e)==WM_HANDLER_BREAK);assert(counts.create==1&&f.rv.dist!=10);++scenarios;}
 std::cout<<"PASS missing/stale owner, custom profile/map/modal delegation, Python, emulation preference and multi-source native fallback changes real Zoom state\n";}
static void polls(){for(bool runtime_lock:{false,true}){ConnectedKnife f;auto e=f.event();if(runtime_lock)f.rv.runtime_viewlock=RV3D_LOCK_ZOOM_AND_DOLLY;else f.rv.viewlock=RV3D_LOCK_ZOOM_AND_DOLLY;assert(f.classify(e)==eIPadNativePanDispatch::StockKnifeCtrlZoom);counts={};assert(f.dispatch(e)==WM_HANDLER_CONTINUE);assert(counts.poll==1);no_allocation(f);++scenarios;}
 std::cout<<"PASS actual native regular and runtime Zoom-lock polls refuse without allocation\n";}
static void emulation(){for(int pref:{USER_EMU_MMB_MOD_ALT,USER_EMU_MMB_MOD_OSKEY}){ConnectedKnife f;auto e=f.event();U.flag=USER_TWOBUTTONMOUSE;U.mouse_emulate_3_button_modifier=pref;wmEvent b;b.type=LEFTMOUSE;b.val=KM_PRESS;b.modifier=pref==USER_EMU_MMB_MOD_ALT?KM_ALT:KM_OSKEY;wm_eventemulation(&b,false);assert(b.type==MIDDLEMOUSE&&wm_eventemulation_mouse==MIDDLEMOUSE);U.flag=0;assert(f.classify(e)==eIPadNativePanDispatch::None);counts={};assert(f.dispatch(e)==WM_HANDLER_BREAK&&counts.create==1&&f.rv.dist!=10);U.flag=USER_TWOBUTTONMOUSE;b.type=LEFTMOUSE;b.val=KM_RELEASE;wm_eventemulation(&b,false);U.flag=0;assert(wm_eventemulation_mouse==EVENT_NONE);f.rv.dist=10;assert(f.classify(e)==eIPadNativePanDispatch::StockKnifeCtrlZoom);++scenarios;}
 std::cout<<"PASS actual Alt/OSKey emulation latch preserves fallback after preference switches off\n";}
static void queue_controls(){for(bool mixed:{false,true}){ConnectedKnife f;auto e=f.event();wm_event_add_trackpad(&f.win,&e,2,-1);if(mixed)e.flag=0;auto*q=wm_event_add_trackpad(&f.win,&e,3,-2);assert(native_queue.size()==1&&q->prev_xy[0]==115&&q->prev_xy[1]==800);assert(bool(q->flag&WM_EVENT_IS_PENCIL_PRECISION_PAN)==!mixed);f.modal(*q);counts={};assert(f.dispatch(*q)==WM_HANDLER_BREAK);if(mixed){assert(counts.create==1&&f.rv.dist!=10);}else no_allocation(f);++scenarios;}
 std::cout<<"PASS actual physical+physical queue denial and mixed-source AND-cleared native fallback\n";}
static void delegated_controls(){for(bool pan_binding:{false,true}){ConnectedKnife f;KeyMapItem_Params p{};p.type=pan_binding?MOUSEPAN:EVT_BKEY;p.value=pan_binding?KM_ANY:KM_PRESS;p.modifier=KM_ANY;p.direction=KM_ANY;
 auto*i=WM_modalkeymap_add_item(f.modaleff,&p,KNF_MODAL_PANNING);i->flag|=KMI_REPEAT_IGNORE;
 wmEvent delegated;delegated.type=p.type;delegated.val=KM_PRESS;wmEvent_ModalMapStore save;wm_event_modalkeymap_begin(&f.C,f.owner_op,&delegated,&save);assert(delegated.type==EVT_MODAL_MAP&&delegated.val==KNF_MODAL_PANNING);assert(knifetool_modal(&f.C,f.owner_op,&delegated)==OPERATOR_PASS_THROUGH&&f.data()->mode==MODE_PANNING);wm_event_modalkeymap_end(&delegated,&save);
 auto e=f.event();if(!pan_binding){wm_event_modalkeymap_begin(&f.C,f.owner_op,&e,&save);assert(e.type==MOUSEPAN);assert(knifetool_modal(&f.C,f.owner_op,&e)==OPERATOR_PASS_THROUGH&&f.data()->mode==MODE_DRAGGING);wm_event_modalkeymap_end(&e,&save);}
 assert(f.classify(e)==eIPadNativePanDispatch::None);counts={};assert(f.dispatch(e)==WM_HANDLER_BREAK&&counts.create==1&&f.rv.dist!=10);++scenarios;}
 {ConnectedKnife f;wmOperatorType custom=f.zoom;custom.idname="CUSTOM_OT_zoom";registry[custom.idname]=&custom;rna_KeyMap_item_new(f.eff,nullptr,"custom.zoom",MOUSEPAN,KM_ANY,false,0,1,0,0,0,0,KM_ANY,false,true);auto e=f.event();counts={};assert(f.dispatch(e)==WM_HANDLER_BREAK&&counts.create==1&&f.rv.dist!=10);++scenarios;}
 std::cout<<"PASS actual custom keyboard/PAN modal delegation and actually selected custom Zoom retain native state changes\n";}
static void profile_controls(){for(int field=0;field<13;++field){ConnectedKnife f;wmOperatorType copy=f.zoom;wmOperatorTypeMacro macro;
 switch(field){case 0:copy.poll=replacement_zoom_poll;break;case 1:copy.exec=replacement_zoom_exec;break;case 2:copy.invoke=replacement_zoom_invoke;break;case 3:copy.modal=replacement_zoom_modal;break;case 4:copy.cancel=replacement_zoom_cancel;break;case 5:copy.flag^=OPTYPE_UNDO;break;case 6:copy.pyop_poll=replacement_python_poll;break;case 7:copy.rna_ext.data=&f;break;case 8:copy.rna_ext.srna=&f.ks;break;case 9:copy.rna_ext.call=replacement_extension;break;case 10:copy.rna_ext.free=replacement_extension;break;case 11:copy.macro.first=&macro;break;case 12:copy.macro.last=&macro;break;}
 counts={};assert(!ED_view3d_native_zoom_type_is(&copy));assert(!counts.context&&!counts.py&&!counts.poll&&!counts.create&&!counts.alloc);++scenarios;}
 std::cout<<"PASS actual pure Zoom callback/flags/Python/RNA/macro profile mutation controls without callbacks or allocation\n";}
static void owner_controls(){for(int field=0;field<13;++field){ConnectedKnife f;auto e=f.event();auto*h=reinterpret_cast<wmEventHandler_Op*>(f.win.modalhandlers.first);
 switch(field){case 0:++f.wm.id.session_uid;break;case 1:++f.screen.id.session_uid;break;case 2:++f.object.id.session_uid;break;case 3:++f.mesh.id.session_uid;break;case 4:++f.knife.ipad_lifetime_id;break;case 5:h->head.flag|=WM_HANDLER_DO_FREE;break;case 6:h->context.area=nullptr;break;case 7:f.object.mode=0;break;case 8:f.layer.flag|=VIEW_LAYER_OUT_OF_SYNC;break;case 9:f.win.runtime=nullptr;break;case 10:f.rr.visible=false;break;case 11:f.area.regionbase={};break;case 12:f.knife.modalkeymap=f.modaleff;break;}
 assert(f.classify(e)==eIPadNativePanDispatch::None);counts={};assert(f.dispatch(e)==WM_HANDLER_BREAK&&counts.create==1&&f.rv.dist!=10);++scenarios;}
 {ConnectedKnife f;ARegion other;ARegionRuntime other_runtime;other.runtime=&other_runtime;other.regiondata=&f.rv;other.winrct=f.region.winrct;BLI_addtail(&f.area.regionbase,&other);f.C.region=&other;
 wmIPadKnifeOwner owner;assert(WM_ipad_knife_owner_capture(&f.C,&f.win,&f.area,owner));assert(owner.values[K_REGION]==uintptr_t(&f.region));assert(!wm_ipad_knife_precision_pan_owner_context(&f.C));auto e=f.event();assert(f.classify(e)==eIPadNativePanDispatch::None);counts={};assert(f.dispatch(e)==WM_HANDLER_BREAK&&counts.create==1&&f.rv.dist!=10);++scenarios;}
 std::cout<<"PASS actual strict original owner identity/context/lifetime and distinct valid WINDOW region preserve native fallback\n";}
static void native_controls(){for(bool swapped:{false,true})for(int modifiers:std::array<int,2>{0,KM_SHIFT}){ConnectedKnife f(true,swapped);auto e=f.event();e.modifier=modifiers;assert(f.classify(e)==eIPadNativePanDispatch::None);counts={};assert(f.dispatch(e)==WM_HANDLER_BREAK);assert(counts.create==1&&counts.finished==1&&!nav_allocations&&f.rv.dist==10);++scenarios;}
 for(bool rotate:{false,true})for(int flag:std::array<int,2>{WM_EVENT_MULTITOUCH_TWO_FINGERS,WM_EVENT_MULTITOUCH_THREE_FINGERS}){ConnectedKnife f;auto e=f.event();e.flag=flag;native_move_apply_calls=native_rotate_apply_calls=0;auto*ot=rotate?&f.rotate:&f.move;counts={};assert(wm_operator_invoke(&f.C,ot,&e,nullptr,nullptr,false,true)==OPERATOR_FINISHED);bool reached=!rotate||(flag&WM_EVENT_MULTITOUCH_TWO_FINGERS);assert(nav_allocations==int(reached));assert(native_move_apply_calls==int(!rotate&&reached)&&native_rotate_apply_calls==int(rotate&&reached));++scenarios;}
 for(bool rotate:{false,true})for(int type:std::array<int,2>{LEFTMOUSE,MIDDLEMOUSE}){ConnectedKnife f;auto e=f.event();e.type=type;e.val=KM_PRESS;e.modifier=0;e.flag=0;counts={};assert(wm_operator_invoke(&f.C,rotate?&f.rotate:&f.move,&e,nullptr,nullptr,false,true)==OPERATOR_RUNNING_MODAL);assert(counts.create==1&&nav_allocations==1&&last_op&&last_op->customdata);++scenarios;}
 std::cout<<"PASS both actual generated View3D PAN profiles, advanced multi-finger init and direct native/hardware presses\n";}
static int required_old_denial(){ConnectedKnife f;auto e=f.event();assert(f.classify(e)==eIPadNativePanDispatch::StockKnifeCtrlZoom);historical_source_mode=true;counts={};int action=f.dispatch(e);historical_source_mode=false;
 assert(action==WM_HANDLER_BREAK&&counts.create==1&&nav_allocations==1&&nav_frees==1&&std::fabs(f.rv.dist-10.197044f)<.00001f);
 std::cerr<<"KNIFE_REQUIRED_DENIAL_FAILED exact_old_source=3d7b248 creates="<<counts.create<<" nav_allocations="<<nav_allocations<<" distance="<<std::setprecision(10)<<f.rv.dist<<"\n";return 17;}
int main(int argc,char**argv){std::cout<<std::setprecision(10);if(argc>1){assert(std::string(argv[1])=="--require-old-denial");return required_old_denial();}positives();fallbacks();polls();emulation();queue_controls();delegated_controls();profile_controls();owner_controls();native_controls();std::cout<<"actual connected initial Knife scenarios passed "<<scenarios<<"\n";}
