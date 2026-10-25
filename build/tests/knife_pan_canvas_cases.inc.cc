
static void native_draw(){}
static void foreign_draw(const bContext*,ARegion*r,void*p){++executed;saw_unknown_before=r->runtime->ipad_knife_canvas_unknown_widgets;if(p)BLI_remlink(&r->runtime->type->drawcalls,p);}
struct Fixture{
 Main main;wmWindowManager manager;wmWindow win;wmWindowRuntime winruntime;bScreen screen;ScrArea area;ARegion region;ARegionRuntime runtime;ARegionType art;Scene scene;ViewLayer layer;Base base;Object object;Mesh mesh;MeshRuntime meshrt;BMEditMesh em;WorkSpace workspace;WorkSpaceLayout layout;WorkSpaceInstanceHook hook;wmOperatorType type;wmOperator op;wmEventHandler_Op handler;Link v3d,rv3d;wmIPadKnifeOwner owner;bContext C;KnifeTool_OpData kcd;RegionDrawCB cb;wmDrawBuffer buffer{};
 Fixture(){lifetimes.clear();G_MAIN=&main;registered_type=&type;manager.id.session_uid=11;screen.id.session_uid=12;scene.id.session_uid=13;object.id.session_uid=14;mesh.id.session_uid=15;type.ipad_lifetime_id=16;workspace.id.session_uid=18;
 BLI_addtail(&main.wm,&manager);BLI_addtail(&main.screens,&screen);BLI_addtail(&main.scenes,&scene);BLI_addtail(&main.objects,&object);BLI_addtail(&main.meshes,&mesh);BLI_addtail(&main.workspaces,&workspace);BLI_addtail(&workspace.layouts,&layout);layout.screen=&screen;hook={&workspace,&layout};win.workspace_hook=&hook;
 BLI_addtail(&manager.windows,&win);win.runtime=&winruntime;win.screen=&screen;win.scene=&scene;BLI_addtail(&screen.areabase,&area);BLI_addtail(&area.regionbase,&region);BLI_addtail(&area.spacedata,&v3d);region.runtime=&runtime;region.regiondata=&rv3d;runtime.type=&art;art.draw=native_draw;
 BLI_addtail(&scene.view_layers,&layer);BLI_addtail(&layer.object_bases,&base);layer.basact=&base;base.object=&object;object.data=&mesh;mesh.runtime=&meshrt;meshrt.edit_mesh=&em;
 op.type=&type;op.customdata=&kcd;kcd.vc={&scene,&layer,&v3d,&region,&rv3d,&object};kcd.draw_handle=&cb;cb={};cb.draw=knifetool_draw;cb.customdata=&kcd;cb.type=REGION_DRAW_POST_VIEW;handler.op=&op;handler.context={&win,&area,&region,nullptr};BLI_addtail(&win.modalhandlers,&handler.head);C={&manager,&win,&area,&region};wm_ipad_knife_modal_handler_bind(&win,&area,&region,&handler);assert(WM_ipad_knife_owner_present(&C,&win,&area,owner));buffer.viewport=(GPUViewport*)1;runtime.draw_buffer=&buffer;native_width=800;native_height=600;ui_scale=1;executed=0;saw_known_before=saw_unknown_before=false;
 }
 bool scope(std::array<uint64_t,32>&s){return WM_ipad_knife_canvas_scope_capture(&C,&win,&area,&region,s);}
 bool known(const void*h=nullptr,void(*fn)(const bContext*,ARegion*,void*)=knifetool_draw,const void*d=nullptr,int t=REGION_DRAW_POST_VIEW){wmIPadKnifeOwner out;bool ok=WM_ipad_knife_draw_callback_known(&C,&region,h?h:&cb,fn,d?d:&kcd,t,out);assert(ok?out==owner:!out.valid());return ok;}
 void reset(){runtime.ipad_knife_canvas_unknown_widgets=false;runtime.ipad_knife_canvas_drawn_owner={};}
 void draw_callbacks(){ed_region_draw_cb_draw(&C,&region,&art,REGION_DRAW_POST_VIEW);}
 void full(bool partial=false){std::array<uint64_t,32>s;bool v=scope(s);wm_ipad_knife_canvas_stamp_finish(&C,&win,&area,&region,s,v,partial);}
};
int main(int argc,char**argv){assert(argc==2);std::string which=argv[1];Fixture f;std::array<uint64_t,32>s{};assert(f.scope(s));
 if(which.rfind("loop-",0)==0){
  if(which=="loop-known"||which=="loop-owner-loss")BLI_addtail(&f.art.drawcalls,&f.cb);
  if(which=="loop-unknown-self-removal"||which=="loop-unknown-cached"||which=="loop-unknown-cleared"){f.cb.draw=foreign_draw;f.cb.customdata=&f.cb;BLI_addtail(&f.art.drawcalls,&f.cb);}
  if(which=="loop-before-after")draw_mutation=1;
  if(which=="loop-owner-loss")draw_mutation=2;
  f.runtime.do_draw=which=="loop-overlay-only"?8:RGN_DRAW|(which=="loop-partial"?RGN_DRAW_PARTIAL:0);
  wm_draw_area_offscreen(&f.C,&f.win,&f.area,which=="loop-stereo");
  auto first=f.buffer.ipad_knife_canvas_stamp;
  if(which=="loop-stereo"||which=="loop-partial"||which=="loop-overlay-only"||which=="loop-before-after"||which=="loop-owner-loss")assert(!first.valid);
  else assert(first.valid&&first.content);
  if(which=="loop-full")assert(draw_calls==1&&!first.unknown_widgets);
  if(which=="loop-known")assert(first.drawn_owner==f.owner.values&&saw_known_before&&!first.unknown_widgets);
  if(which=="loop-redraw-token"){f.runtime.do_draw=RGN_DRAW;wm_draw_area_offscreen(&f.C,&f.win,&f.area,false);assert(draw_calls==2&&f.buffer.ipad_knife_canvas_stamp.content>first.content&&f.buffer.ipad_knife_canvas_stamp.scope==first.scope);}
  if(which=="loop-cached"||which=="loop-unknown-cached"){wm_draw_area_offscreen(&f.C,&f.win,&f.area,false);assert(draw_calls==1&&f.buffer.ipad_knife_canvas_stamp.content==first.content);}
  if(which=="loop-unknown-self-removal"||which=="loop-unknown-cached"||which=="loop-unknown-cleared")assert(first.unknown_widgets&&!f.art.drawcalls.first&&saw_unknown_before);
  if(which=="loop-unknown-cleared"){f.runtime.do_draw=RGN_DRAW;wm_draw_area_offscreen(&f.C,&f.win,&f.area,false);assert(!f.buffer.ipad_knife_canvas_stamp.unknown_widgets&&f.buffer.ipad_knife_canvas_stamp.content>first.content);}
 }
 else if(which=="drag-sticky-before-draw"||which=="drag-self-removal-sticky"||which=="drag-previous-opaque-preserved"||which=="drag-none"){wmWindowManagerRuntime wmrt;Link drag;f.manager.runtime=&wmrt;auto&frame=ipad_knife_hierarchy_frames[uintptr_t(&f.win)];if(which=="drag-previous-opaque-preserved")frame.opaque_window_callback=true;if(which!="drag-none")BLI_addtail(&wmrt.drags,&drag);drag_remove_self=which=="drag-self-removal-sticky";actual_drag_composition(&f.C,&f.win);if(which=="drag-none")assert(drag_draws==0&&!frame.opaque_window_callback&&!frame.callbacks_observed);else assert(drag_draws==1&&drag_saw_sticky&&frame.callbacks_observed&&frame.opaque_window_callback);if(drag_remove_self){assert(!wmrt.drags.first);ED_ipad_knife_hierarchy_window_callbacks(&f.C,&f.win,false);assert(frame.opaque_window_callback);}}
 else if(which=="gizmo-unknown"||which=="gizmo-navigation"){wmGizmoMap map;wmGizmoGroupType gt;wmGizmoGroup group;wmGizmoType type;wmGizmo gz;LinkData link;ListBase drawlist;Link member;BLI_addtail(&map.groups,&member);if(which=="gizmo-navigation")gt.idname="VIEW3D_GGT_navigate";group.type=&gt;type.draw=gizmo_draw;gz.parent_gzgroup=&group;gz.type=&type;link.data=&gz;BLI_addtail(&drawlist,&link);gizmos_draw_list(&map,&f.C,&drawlist);assert(executed==1&&!drawlist.first);if(which=="gizmo-unknown")assert(saw_unknown_before&&f.runtime.ipad_finger_paint_overlay_blocked);else assert(!f.runtime.ipad_knife_canvas_unknown_widgets&&f.runtime.ipad_finger_paint_navigation_drawn);}
 else if(which=="paintcursor-self-removal"){wmWindowManagerRuntime wmrt;NativeEventState state;wmPaintCursor pc;f.manager.runtime=&wmrt;f.win.eventstate=&state;f.screen.active_region=&f.region;pc.draw=cursor_draw;pc.customdata=&pc;BLI_addtail(&wmrt.paintcursors,&pc);wm_paintcursor_draw(&f.C,&f.area,&f.region);assert(saw_unknown_before&&executed==1&&!wmrt.paintcursors.first&&f.runtime.ipad_knife_canvas_unknown_widgets&&!f.runtime.ipad_finger_paint_overlay_blocked);}
 else if(which=="scope32"){assert(s[0]==uintptr_t(&f.main)&&s[2]==11&&s[4]==17&&s[6]==12&&s[8]==uintptr_t(&f.v3d)&&s[10]==uintptr_t(&f.rv3d)&&s[12]==18&&s[14]==13&&s[17]==14&&s[19]==15&&s[20]==800&&s[21]==600&&s[22]==0x3f800000&&s[23]==uintptr_t(&f.art)&&s[24]==0&&s[25]==799&&s[26]==0&&s[27]==599&&s[28]==0&&s[29]==799&&s[30]==0&&s[31]==599);}
 else if(which=="exact-cookie")assert(f.known());
 else if(which=="foreign-cookie")assert(!f.known(&f.kcd));
 else if(which=="function-only")assert(!f.known(&f.kcd,knifetool_draw,&f.kcd));
 else if(which=="foreign-function")assert(!f.known(nullptr,foreign_draw));
 else if(which=="foreign-data")assert(!f.known(nullptr,knifetool_draw,&f.op));
 else if(which=="foreign-type")assert(!f.known(nullptr,knifetool_draw,nullptr,8));
 else if(which=="known-foreign-layout"){f.hook.act_layout=(WorkSpaceLayout*)1;assert(!f.known());}
 else if(which=="known-foreign-workspace"){f.hook.active=(WorkSpace*)1;assert(!f.known());}
 else if(which=="foreign-region"){f.kcd.vc.region=nullptr;assert(!f.known());}
 else if(which=="operator-lifetime"){++lifetimes[&f.op];assert(!f.known());}
 else if(which=="type-lifetime"){++f.type.ipad_lifetime_id;assert(!f.known());}
 else if(which=="owner-removed"){BLI_remlink(&f.win.modalhandlers,&f.handler);f.handler.op=(wmOperator*)1;assert(!f.known());}
 else if(which=="owner-replaced"){wmEventHandler_Op other=f.handler;BLI_remlink(&f.win.modalhandlers,&f.handler);BLI_addtail(&f.win.modalhandlers,&other);assert(!f.known());}
 else if(which=="callback-list-known"){BLI_addtail(&f.art.drawcalls,&f.cb);wmIPadKnifeOwner out;assert(ED_region_knife_pan_callbacks_safe(&f.C,&f.region,out)&&out==f.owner&&executed==0);}
 else if(which=="callback-list-empty"){wmIPadKnifeOwner out;assert(ED_region_knife_pan_callbacks_safe(&f.C,&f.region,out)&&!out.valid());}
 else if(which=="callback-list-duplicate"){RegionDrawCB other=f.cb;BLI_addtail(&f.art.drawcalls,&f.cb);BLI_addtail(&f.art.drawcalls,&other);wmIPadKnifeOwner out;assert(!ED_region_knife_pan_callbacks_safe(&f.C,&f.region,out)&&!out.valid()&&executed==0);}
 else if(which=="callback-list-foreign"){f.cb.customdata=&f.op;BLI_addtail(&f.art.drawcalls,&f.cb);wmIPadKnifeOwner out;assert(!ED_region_knife_pan_callbacks_safe(&f.C,&f.region,out)&&!out.valid()&&executed==0);}
 else if(which=="callback-known-stamp"){BLI_addtail(&f.art.drawcalls,&f.cb);f.draw_callbacks();assert(saw_known_before&&executed==1&&f.runtime.ipad_finger_paint_overlay_blocked&&!f.runtime.ipad_knife_canvas_unknown_widgets);f.full();assert(f.buffer.ipad_knife_canvas_stamp.valid&&f.buffer.ipad_knife_canvas_stamp.drawn_owner==f.owner.values);}
 else if(which=="callback-self-removal"){f.cb.draw=foreign_draw;f.cb.customdata=&f.cb;BLI_addtail(&f.art.drawcalls,&f.cb);f.draw_callbacks();assert(executed==1&&saw_unknown_before&&!f.art.drawcalls.first&&f.runtime.ipad_knife_canvas_unknown_widgets);f.full();assert(f.buffer.ipad_knife_canvas_stamp.valid&&f.buffer.ipad_knife_canvas_stamp.unknown_widgets);wmIPadKnifeOwner out;assert(ED_region_knife_pan_callbacks_safe(&f.C,&f.region,out));assert(f.buffer.ipad_knife_canvas_stamp.unknown_widgets);}
 else if(which=="full-redraw-token-cached-retention"){f.full();auto first=f.buffer.ipad_knife_canvas_stamp;assert(first.valid&&first.content);f.full();auto second=f.buffer.ipad_knife_canvas_stamp;assert(second.content>first.content&&second.scope==first.scope&&second.drawn_owner==first.drawn_owner&&second.unknown_widgets==first.unknown_widgets);f.reset();assert(f.buffer.ipad_knife_canvas_stamp.content==second.content);}
 else if(which=="unknown-changes-token"){f.full();auto first=f.buffer.ipad_knife_canvas_stamp.content;f.runtime.ipad_knife_canvas_unknown_widgets=true;f.full();assert(f.buffer.ipad_knife_canvas_stamp.content>first);first=f.buffer.ipad_knife_canvas_stamp.content;f.full();assert(f.buffer.ipad_knife_canvas_stamp.content>first);first=f.buffer.ipad_knife_canvas_stamp.content;f.reset();f.full();assert(f.buffer.ipad_knife_canvas_stamp.content>first);}
 else if(which=="owner-changes-token"){f.full();auto first=f.buffer.ipad_knife_canvas_stamp.content;f.runtime.ipad_knife_canvas_drawn_owner=f.owner.values;f.full();assert(f.buffer.ipad_knife_canvas_stamp.content>first);}
 else if(which=="known-rendered-owner-stale"){f.runtime.ipad_knife_canvas_drawn_owner=f.owner.values;++lifetimes[&f.op];f.full();assert(!f.buffer.ipad_knife_canvas_stamp.valid);}
 else if(which=="partial"){f.full();f.full(true);assert(!f.buffer.ipad_knife_canvas_stamp.valid);}
 else if(which=="stereo"){f.full();f.buffer.stereo=true;f.full();assert(!f.buffer.ipad_knife_canvas_stamp.valid);}
 else if(which=="allocation"){f.full();auto first=f.buffer.ipad_knife_canvas_stamp.content;wmDrawBuffer fresh{};fresh.viewport=(GPUViewport*)1;f.runtime.draw_buffer=&fresh;f.full();assert(fresh.ipad_knife_canvas_stamp.content>first);}
 else if(which=="allocation-failure"){f.buffer.viewport=nullptr;f.full();assert(!f.buffer.ipad_knife_canvas_stamp.valid);}
 else if(which=="scope-drift-during-draw"){++f.scene.id.session_uid;wm_ipad_knife_canvas_stamp_finish(&f.C,&f.win,&f.area,&f.region,s,true,false);assert(!f.buffer.ipad_knife_canvas_stamp.valid);}
 else if(which=="geometry-changes-token"){f.full();auto first=f.buffer.ipad_knife_canvas_stamp.content;f.region.winrct.xmax=798;f.runtime.ipad_canvas_rect.xmax=798;f.full();assert(f.buffer.ipad_knife_canvas_stamp.valid&&f.buffer.ipad_knife_canvas_stamp.content>first);}
 else if(which=="workspace-removed"){BLI_remlink(&f.main.workspaces,&f.workspace);assert(!f.scope(s));}
 else if(which=="layout-removed"){BLI_remlink(&f.workspace.layouts,&f.layout);f.hook.act_layout=(WorkSpaceLayout*)1;assert(!f.scope(s));}
 else if(which=="main-removed"){G_MAIN=nullptr;assert(!f.scope(s));}
 else if(which=="window-removed"){BLI_remlink(&f.manager.windows,&f.win);assert(!f.scope(s));}
 else if(which=="screen-removed"){BLI_remlink(&f.main.screens,&f.screen);assert(!f.scope(s));}
 else if(which=="area-removed"){BLI_remlink(&f.screen.areabase,&f.area);assert(!f.scope(s));}
 else if(which=="region-removed"){BLI_remlink(&f.area.regionbase,&f.region);assert(!f.scope(s));}
 else if(which=="scene-removed"){BLI_remlink(&f.main.scenes,&f.scene);assert(!f.scope(s));}
 else if(which=="object-removed"){BLI_remlink(&f.main.objects,&f.object);assert(!f.scope(s));}
 else if(which=="mesh-removed"){BLI_remlink(&f.main.meshes,&f.mesh);assert(!f.scope(s));}
 else if(which=="missing-editmesh"){f.meshrt.edit_mesh=nullptr;assert(!f.scope(s));}
 else if(which=="missing-bmesh"){f.em.bm=nullptr;assert(!f.scope(s));}
 else if(which=="out-of-sync"){f.layer.flag|=VIEW_LAYER_OUT_OF_SYNC;assert(!f.scope(s));}
 else if(which=="foreign-basact"){Base replacement;f.layer.basact=&replacement;assert(!f.scope(s));}
 else if(which=="hidden-region"){f.runtime.visible=false;assert(!f.scope(s));}
 else if(which=="locked-draw"){f.art.do_lock=true;assert(!f.scope(s));}
 else if(which=="status-text"){f.runtime.headerstr=(void*)1;assert(!f.scope(s));}
 else if(which=="minimized"){f.area.winx=2;assert(!f.scope(s));}
 else if(which=="invalid-geometry"){f.region.winrct.xmax=800;assert(!f.scope(s));}
 else if(which=="invalid-canvas"){f.runtime.ipad_canvas_rect.xmax=800;assert(!f.scope(s));}
 else if(which=="invalid-scale"){ui_scale=0;assert(!f.scope(s));}
 else if(which=="nan-scale"){ui_scale=std::numeric_limits<float>::quiet_NaN();assert(!f.scope(s));}
 else if(which=="positive-inf-scale"){ui_scale=std::numeric_limits<float>::infinity();assert(!f.scope(s));}
 else if(which=="negative-inf-scale"){ui_scale=-std::numeric_limits<float>::infinity();assert(!f.scope(s));}
 else assert(false&&"unknown test");
 assert(provider_callbacks==0&&native_calls==0);std::cout<<which<<" PASS\n";
}
