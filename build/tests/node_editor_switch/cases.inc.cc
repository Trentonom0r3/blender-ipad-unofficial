
static int scenarios=0;
#define CHECK(value) do { if(!(value)){std::fprintf(stderr,"CHECK failed line %d: %s\n",__LINE__,#value);std::abort();} }while(false)
struct Fixture {
 Main main;wmWindowManager manager,manager2;wmWindow win,other_win;bScreen screen,other_screen;
 ScrArea area,other_area;ARegion region,other_region;SpaceLink old_space;
 wmOperatorType native,other_type,macro_type;wmOperator root,child,other_child;wmEventHandler_Op handler;
 bContext C;PointerRNA ptr;
 Fixture(){
  G_MAIN=&main;BLI_addtail(&main.wm,&manager);BLI_addtail(&manager.windows,&win);BLI_addtail(&manager.windows,&other_win);
  win.screen=&screen;other_win.screen=&other_screen;
  BLI_addtail(&screen.areabase,&area);BLI_addtail(&other_screen.areabase,&other_area);
  BLI_addtail(&area.regionbase,&region);BLI_addtail(&other_area.regionbase,&other_region);
  region.canary=0xfedcba9876543210ULL;area.canary=0x123456789abcdef0ULL;
  node_space={};view_space={};node_space.exit=original_area_exit;node_space.free=free_space;node_space.create=create_space;
  view_space.free=free_space;view_space.create=create_space;
  area.spacetype=SPACE_NODE;area.type=&node_space;area.butspacetype_subtype=23;
  other_area.spacetype=SPACE_VIEW3D;other_area.type=&view_space;
  old_space.spacetype=SPACE_NODE;BLI_addtail(&area.spacedata,&old_space);
  blender::ed::space_node::NODE_OT_link(&native);
  other_type.idname="OTHER_OT_modal";other_type.modal=unrelated_modal;other_type.invoke=unrelated_invoke;
  macro_type.idname="OTHER_OT_macro";macro_type.flag=OPTYPE_MACRO;macro_type.modal=unrelated_modal;
  registered_native=&native;registered_types={&native,&other_type,&macro_type};
  root.type=&native;child.type=&native;other_child.type=&other_type;
  handler.head.type=WM_HANDLER_TYPE_OP;handler.op=&root;handler.context.area=&area;handler.context.region=&region;
  C={&main,&manager,&win,&area,&region};ptr={&screen,&area};paint_allowed=true;
  reset();
 }
 void add_handler(){BLI_addtail(&win.modalhandlers,&handler);}
 void reset(){counts={};context_trace.clear();}
 #if CURRENT_APPLE
 bool query(){return WM_event_ipad_node_link_editor_switch_allowed(&C,&area);}
 #endif
 bool switch_direct(int type=SPACE_VIEW3D,bool skip=true){return ED_area_newspace(&C,&area,type,skip);}
 void public_switch(int type=SPACE_VIEW3D){rna_Area_type_set(&ptr,type);rna_Area_type_update(&C,&ptr);}
};
struct Snapshot {
 int spacetype,butspacetype_subtype;SpaceType *type;void(*exit)(wmWindowManager *,ScrArea *);
 ListBase spacedata,regionbase;wmOperator *op;wmOperatorType *optype;ScrArea *handler_area;ARegion *handler_region;
 std::uint64_t area_canary,region_canary;
 Snapshot(Fixture &f):spacetype(f.area.spacetype),butspacetype_subtype(f.area.butspacetype_subtype),type(f.area.type),exit(f.area.type->exit),spacedata(f.area.spacedata),regionbase(f.area.regionbase),op(f.handler.op),optype(f.root.type),handler_area(f.handler.context.area),handler_region(f.handler.context.region),area_canary(f.area.canary),region_canary(f.region.canary){}
 void unchanged(Fixture &f){
  CHECK(f.area.spacetype==spacetype && f.area.type==type && f.area.type->exit==exit);
  CHECK(f.area.butspacetype_subtype==butspacetype_subtype);
  CHECK(f.area.spacedata.first==spacedata.first && f.area.spacedata.last==spacedata.last);
  CHECK(f.area.regionbase.first==regionbase.first && f.area.regionbase.last==regionbase.last);
  CHECK(f.handler.op==op && f.root.type==optype && f.handler.context.area==handler_area && f.handler.context.region==handler_region);
  CHECK(f.area.canary==area_canary && f.region.canary==region_canary);
 }
};
#if CURRENT_APPLE
static void pure_query(Fixture &f,bool expected){
 Snapshot before(f);const auto C=f.C;f.reset();CHECK(f.query()==expected);before.unchanged(f);
 CHECK(counts.side_effects()==0 && context_trace.empty());
 CHECK(counts.window_get==0 && counts.area_get==0 && counts.region_get==0 && counts.data_get==0);
 CHECK(f.C.window==C.window && f.C.area==C.area && f.C.region==C.region);++scenarios;
}
static void native_profile_cases(){
 using blender::ed::space_node::node_link_modal_type;
 Fixture f;f.reset();CHECK(node_link_modal_type(&f.native));CHECK(!node_link_modal_type(nullptr));
 wmOperatorType old_native;historical_registration::NODE_OT_link(&old_native);CHECK(node_link_modal_type(&old_native));
 wmOperatorType saved=f.native;
 #define PROFILE_REJECT(field,value) f.native=saved;f.native.field=value;CHECK(!node_link_modal_type(&f.native));++scenarios
 PROFILE_REJECT(invoke,unrelated_invoke);PROFILE_REJECT(modal,unrelated_modal);PROFILE_REJECT(poll,unrelated_poll);PROFILE_REJECT(cancel,unrelated_cancel);
 PROFILE_REJECT(exec,unrelated_exec);PROFILE_REJECT(pyop_poll,unrelated_pyop);
 PROFILE_REJECT(flag,OPTYPE_REGISTER|OPTYPE_UNDO);PROFILE_REJECT(flag,saved.flag|OPTYPE_MACRO);
 // Extension storage does not confer an invocation grant: this denial-only
 // profile still refuses when the native callbacks are unchanged.
 f.native=saved;f.native.rna_ext={reinterpret_cast<void *>(1),reinterpret_cast<void *>(1),reinterpret_cast<void *>(1),reinterpret_cast<void *>(1)};CHECK(node_link_modal_type(&f.native));++scenarios;
 PROFILE_REJECT(macro.first,reinterpret_cast<void *>(1));PROFILE_REJECT(macro.last,reinterpret_cast<void *>(1));
 #undef PROFILE_REJECT
 CHECK(counts.side_effects()==0);++scenarios;
}
static void query_cases(){
 {Fixture f;pure_query(f,true);CHECK(counts.registry_find==0 && counts.registry_span==0);}
 {Fixture f;f.add_handler();pure_query(f,false);}
 {Fixture f;f.add_handler();f.handler.head.flag=WM_HANDLER_DO_FREE;pure_query(f,false);}
 {Fixture f;f.add_handler();f.handler.context.win=&f.other_win;pure_query(f,false);}
 {Fixture f;f.add_handler();f.handler.context.region=nullptr;pure_query(f,false);}
 {Fixture f;f.add_handler();f.handler.is_fileselect=true;pure_query(f,false);}
 {Fixture f;f.add_handler();f.C.main=reinterpret_cast<Main *>(1);pure_query(f,false);}
 {Fixture f;f.add_handler();f.C.window=&f.other_win;f.C.area=&f.other_area;f.C.region=&f.other_region;pure_query(f,false);}
 {Fixture f;f.add_handler();f.C.window=reinterpret_cast<wmWindow *>(1);pure_query(f,false);}
 {Fixture f;f.add_handler();f.C.window=nullptr;pure_query(f,false);}
 {Fixture f;f.add_handler();BLI_remlink(&f.manager.windows,&f.win);BLI_addtail(&f.main.wm,&f.manager2);BLI_addtail(&f.manager2.windows,&f.win);pure_query(f,false);}
 {Fixture f;f.add_handler();BLI_remlink(&f.win.modalhandlers,&f.handler);BLI_addtail(&f.other_win.modalhandlers,&f.handler);pure_query(f,false);}
 {Fixture f;f.add_handler();f.win.screen=nullptr;BLI_listbase_clear(&f.screen.areabase);pure_query(f,false);}
 {Fixture f;f.win.screen=nullptr;BLI_listbase_clear(&f.screen.areabase);pure_query(f,true);}
 {Fixture f;BLI_listbase_clear(&f.manager.windows);pure_query(f,true);}
 {Fixture f;f.add_handler();f.handler.context.area=&f.other_area;f.handler.op=reinterpret_cast<wmOperator *>(1);pure_query(f,true);CHECK(counts.registry_find==0 && counts.registry_span==0);}
 {Fixture f;f.add_handler();f.handler.head.type=WM_HANDLER_TYPE_UI;f.handler.op=reinterpret_cast<wmOperator *>(1);pure_query(f,true);}
 {Fixture f;f.add_handler();f.root.type=&f.other_type;pure_query(f,true);}
 {Fixture f;f.add_handler();f.root.type=&f.other_type;f.handler.head.flag=WM_HANDLER_DO_FREE;pure_query(f,true);}
 {Fixture f;f.add_handler();f.handler.op=nullptr;pure_query(f,false);}
 {Fixture f;f.add_handler();f.root.type=nullptr;pure_query(f,false);}
 {Fixture f;f.add_handler();f.root.type=reinterpret_cast<wmOperatorType *>(1);pure_query(f,false);}
 {Fixture f;f.add_handler();registered_native=nullptr;pure_query(f,false);}
 {Fixture f;f.add_handler();registered_types={&f.other_type,&f.macro_type};pure_query(f,false);}
 {Fixture f;f.add_handler();f.native.modal=unrelated_modal;pure_query(f,false);}
 {Fixture f;f.add_handler();f.other_type=f.native;f.other_type.idname="OTHER_OT_native_link_clone";f.root.type=&f.other_type;pure_query(f,false);}
 {Fixture f;f.add_handler();f.other_type.idname="NODE_OT_link";f.root.type=&f.other_type;registered_native=&f.other_type;pure_query(f,false);}
 {Fixture f;f.add_handler();f.root.type=&f.macro_type;BLI_addtail(&f.root.macro,&f.child);f.root.opm=&f.child;f.child.opm=&f.root;pure_query(f,false);}
 {Fixture f;f.add_handler();f.root.type=&f.macro_type;BLI_addtail(&f.root.macro,&f.other_child);f.root.opm=&f.other_child;f.other_child.opm=&f.root;pure_query(f,true);}
 {Fixture f;f.add_handler();f.root.type=&f.macro_type;BLI_addtail(&f.root.macro,&f.other_child);f.root.opm=&f.child;f.child.opm=&f.root;pure_query(f,false);}
 {Fixture f;f.add_handler();f.root.type=&f.macro_type;BLI_addtail(&f.root.macro,&f.other_child);f.root.opm=reinterpret_cast<wmOperator *>(1);pure_query(f,false);}
 {Fixture f;f.add_handler();f.root.type=&f.macro_type;BLI_addtail(&f.root.macro,&f.child);f.root.opm=nullptr;pure_query(f,false);}
 {Fixture f;f.add_handler();f.root.type=&f.other_type;BLI_addtail(&f.root.macro,&f.child);f.root.opm=&f.child;f.child.opm=&f.root;pure_query(f,false);}
 {Fixture f;f.add_handler();f.root.type=&f.macro_type;BLI_addtail(&f.root.macro,&f.child);f.root.opm=&f.child;f.child.opm=&f.root;f.child.type=reinterpret_cast<wmOperatorType *>(1);pure_query(f,false);}
 {Fixture f;f.add_handler();f.root.type=&f.macro_type;BLI_addtail(&f.root.macro,&f.child);f.root.opm=&f.child;f.child.opm=&f.other_child;pure_query(f,false);}
 {Fixture f;f.add_handler();f.root.type=&f.macro_type;BLI_addtail(&f.root.macro,&f.other_child);f.root.opm=&f.other_child;f.other_child.opm=&f.root;f.other_child.prev=&f.child;pure_query(f,false);}
 {Fixture f;f.add_handler();f.root.type=&f.macro_type;BLI_addtail(&f.root.macro,&f.other_child);f.root.opm=&f.other_child;f.other_child.opm=&f.root;f.root.macro.last=&f.child;pure_query(f,false);}
 {Fixture f;f.add_handler();f.root.type=&f.macro_type;BLI_addtail(&f.root.macro,&f.other_child);f.root.opm=&f.other_child;f.other_child.opm=&f.root;f.other_child.macro.first=&f.child;pure_query(f,false);}
 {Fixture f;f.add_handler();f.C.wm=nullptr;pure_query(f,false);}
 {Fixture f;f.add_handler();f.C.wm=reinterpret_cast<wmWindowManager *>(1);pure_query(f,false);}
 {Fixture f;f.add_handler();G_MAIN=nullptr;pure_query(f,false);}
 {Fixture f;f.add_handler();BLI_listbase_clear(&f.main.wm);pure_query(f,false);}
 {Fixture f;f.reset();CHECK(!WM_event_ipad_node_link_editor_switch_allowed(nullptr,&f.area));CHECK(!WM_event_ipad_node_link_editor_switch_allowed(&f.C,nullptr));CHECK(counts.side_effects()==0);++scenarios;}
 {Fixture f;auto *opaque=reinterpret_cast<ScrArea *>(1);f.add_handler();f.handler.context.area=opaque;f.reset();CHECK(!WM_event_ipad_node_link_editor_switch_allowed(&f.C,opaque));CHECK(counts.side_effects()==0);++scenarios;}
}
static void refusal_cases(){
 for(bool skip:{false,true}){
  Fixture f;f.add_handler();Snapshot before(f);f.reset();CHECK(!f.switch_direct(SPACE_VIEW3D,skip));before.unchanged(f);
  CHECK(counts.side_effects()==0 && counts.alignment_read==0 && counts.window_get==0 && context_trace.empty());++scenarios;
 }
 {
  Fixture f;f.add_handler();Snapshot before(f);
  f.C.window=&f.other_win;f.C.area=&f.other_area;f.C.region=&f.other_region;const auto C=f.C;
  rna_Area_type_set(&f.ptr,SPACE_VIEW3D);CHECK(rna_Area_type_get(&f.ptr)==SPACE_VIEW3D);f.reset();rna_Area_type_update(&f.C,&f.ptr);
  before.unchanged(f);CHECK(f.area.butspacetype==SPACE_EMPTY && rna_Area_type_get(&f.ptr)==SPACE_NODE);
  CHECK(f.C.window==C.window && f.C.area==C.area && f.C.region==C.region);
  CHECK(context_trace==std::vector<std::string>({"window","area","region","window","area","region"}));
  CHECK(counts.side_effects()==0 && counts.alignment_read==0 && counts.window_get==1);++scenarios;
 }
 {
  Fixture f;f.add_handler();f.root.type=&f.macro_type;BLI_addtail(&f.root.macro,&f.child);f.root.opm=&f.child;f.child.opm=&f.root;
  Snapshot before(f);f.reset();f.public_switch();before.unchanged(f);
  CHECK(f.area.butspacetype==SPACE_EMPTY && f.win.modalhandlers.first==&f.handler && f.root.opm==&f.child && f.child.opm==&f.root);
  CHECK(f.root.macro.first==&f.child && f.root.macro.last==&f.child && counts.side_effects()==0);++scenarios;
 }
 {
  Fixture f;f.add_handler();f.handler.head.flag=WM_HANDLER_DO_FREE;Snapshot before(f);f.reset();CHECK(!f.switch_direct());before.unchanged(f);
  CHECK(f.win.modalhandlers.first==&f.handler && f.handler.head.flag==WM_HANDLER_DO_FREE && counts.side_effects()==0 && context_trace.empty());++scenarios;
 }
 for(int terminal:{1,2}){
  Fixture f;f.add_handler();f.reset();CHECK(!f.switch_direct());
  // Native Finish/Escape handling is an explicit external boundary here. We execute
  // the actual intrusive-list removal and query the resulting fresh list; no Cancel
  // callback or substitute native modal dispatch is invoked by this test.
  BLI_remlink(&f.win.modalhandlers,&f.handler);CHECK(f.win.modalhandlers.first==nullptr);f.reset();
  CHECK(f.switch_direct());CHECK(f.area.spacetype==SPACE_VIEW3D && f.area.type==&view_space);
  CHECK(counts.creates==1 && counts.region_exit==1 && counts.paint==1 && counts.cancel==0 && counts.poll==0);
  CHECK(f.handler.context.area==&f.area && f.handler.context.region==&f.region);++scenarios;(void)terminal;
 }
}
#endif
static void fallback_cases(){
 {Fixture f;f.reset();CHECK(f.switch_direct());CHECK(f.area.spacetype==SPACE_VIEW3D);CHECK(f.area.spacedata.first==&made_space);CHECK(f.old_space.regionbase.first==&f.region);CHECK(f.area.regionbase.first==&made_region);CHECK(f.area.type==&view_space);CHECK(node_space.exit==original_area_exit);CHECK(counts.paint==1 && counts.region_exit==1 && counts.creates==1 && counts.init==1 && counts.mousemove==1);CHECK(counts.notifier==2 && counts.title==1 && counts.redraw==1 && counts.refresh==1 && counts.area_exit==0);++scenarios;}
 {Fixture f;f.reset();CHECK(f.switch_direct(SPACE_VIEW3D,false));CHECK(counts.area_exit==1 && node_space.exit==original_area_exit);++scenarios;}
 {Fixture f;f.add_handler();f.reset();CHECK(f.switch_direct(SPACE_NODE));CHECK(f.area.spacetype==SPACE_NODE && f.handler.context.area==&f.area && f.handler.context.region==&f.region);CHECK(counts.registry_find==0 && counts.registry_span==0 && counts.paint==0 && counts.creates==0 && counts.redraw==1 && counts.title==1 && counts.notifier==1 && f.area.butspacetype_subtype==0);++scenarios;}
 {Fixture f;f.add_handler();node_space.space_subtype_item_extend=reinterpret_cast<void *>(1);node_space.space_subtype_get=subtype_get;node_space.space_subtype_set=subtype_set;f.area.butspacetype_subtype=-1;f.reset();CHECK(f.switch_direct(SPACE_NODE));CHECK(counts.subtype_get==1 && counts.subtype_set==1 && f.area.butspacetype_subtype==0 && counts.paint==0);++scenarios;}
 {Fixture f;f.add_handler();f.area.spacetype=SPACE_VIEW3D;f.area.type=&view_space;f.root.type=&f.native;f.reset();CHECK(f.switch_direct(SPACE_NODE));CHECK(counts.registry_find==0 && counts.registry_span==0 && f.area.spacetype==SPACE_NODE);++scenarios;}
 {Fixture f;f.add_handler();f.root.type=&f.other_type;f.reset();CHECK(f.switch_direct());CHECK(counts.creates==1 && f.handler.context.area==nullptr && f.handler.context.region==nullptr && f.win.modalhandlers.first==&f.handler && counts.cancel==0);++scenarios;}
 {Fixture f;paint_allowed=false;Snapshot before(f);f.reset();CHECK(!f.switch_direct());before.unchanged(f);CHECK(counts.paint==1 && counts.creates==0 && node_space.exit==original_area_exit);++scenarios;}
 {Fixture f;f.reset();rna_Area_type_update(&f.C,&f.ptr);CHECK(counts.side_effects()==0 && context_trace.empty());for(int type:{SPACE_EMPTY,SPACE_TOPBAR,SPACE_STATUSBAR})rna_Area_type_set(&f.ptr,type);CHECK(f.area.butspacetype==SPACE_EMPTY);++scenarios;}
 {Fixture f;f.reset();f.public_switch();CHECK(f.area.spacetype==SPACE_VIEW3D && f.area.butspacetype==SPACE_EMPTY && rna_Area_type_get(&f.ptr)==SPACE_VIEW3D);CHECK(counts.deg==1 && counts.main_notifier==1 && counts.redraw==2);CHECK(f.C.window==&f.win && f.C.area==&f.area && f.C.region==&f.region);++scenarios;}
 {Fixture f;SpaceLink stored;ARegion stored_region;stored.spacetype=SPACE_VIEW3D;stored.link_flag=SPACE_FLAG_TYPE_WAS_ACTIVE;BLI_addtail(&stored.regionbase,&stored_region);BLI_addtail(&f.area.spacedata,&stored);f.reset();CHECK(f.switch_direct());CHECK(f.area.spacedata.first==&stored && f.area.regionbase.first==&stored_region && f.old_space.regionbase.first==&f.region && stored.regionbase.first==nullptr);CHECK((stored.link_flag&SPACE_FLAG_TYPE_WAS_ACTIVE)==0 && counts.creates==0 && counts.frees==0);++scenarios;}
 {Fixture f;SpaceLink stored;stored.spacetype=SPACE_VIEW3D;BLI_addtail(&f.area.spacedata,&stored);f.reset();CHECK(f.switch_direct());CHECK(counts.frees==2 && counts.creates==1 && f.area.spacedata.first==&made_space);++scenarios;}
}
static int historical_required_refusal(){
 Fixture f;f.add_handler();f.reset();f.public_switch();
 bool lost=f.area.spacetype==SPACE_VIEW3D && f.handler.context.area==nullptr && f.handler.context.region==nullptr && f.win.modalhandlers.first==&f.handler;
 CHECK(lost && counts.paint==1 && counts.region_exit==1 && counts.creates==1 && counts.cancel==0);
 std::fprintf(stderr,"EDITOR_SWITCH_REQUIRED_REFUSAL_FAILED: switched=%d listed=%d area_null=%d region_null=%d cancel=%d\n",f.area.spacetype==SPACE_VIEW3D,f.win.modalhandlers.first==&f.handler,f.handler.context.area==nullptr,f.handler.context.region==nullptr,counts.cancel);
 return 17;
}
int main(int argc,char **argv){
 #if CURRENT_APPLE
 native_profile_cases();
 #endif
 if(argc>1 && std::string(argv[1])=="--require-historical-refusal")return historical_required_refusal();
 #if CURRENT_APPLE
 query_cases();refusal_cases();fallback_cases();
 #else
 // Same complete newspace/RNA source compiled without the Apple guard preserves
 // the native route, including the documented old active-Node loss boundary.
 Fixture f;f.add_handler();f.reset();f.public_switch();CHECK(f.area.spacetype==SPACE_VIEW3D && f.handler.context.area==nullptr && f.handler.context.region==nullptr);CHECK(counts.registry_find==0 && counts.registry_span==0 && counts.cancel==0);++scenarios;
 #endif
 std::printf("bounded actual editor-switch scenarios passed: %d\n",scenarios);return 0;
}
