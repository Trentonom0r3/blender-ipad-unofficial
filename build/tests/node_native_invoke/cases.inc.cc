static constexpr bool historical=HISTORICAL_SOURCE;
static int scenarios=0;
static wmOperatorStatus foreign_exec(bContext*,wmOperator*){return OPERATOR_FINISHED;}
static wmOperatorStatus foreign_invoke(bContext*,wmOperator*,const wmEvent*){return OPERATOR_FINISHED;}
static wmOperatorStatus foreign_modal(bContext*,wmOperator*,const wmEvent*){return OPERATOR_RUNNING_MODAL;}
static void foreign_cancel(bContext*,wmOperator*){}
static bool foreign_poll(bContext*){return true;}
static bool foreign_py_poll(bContext*,wmOperatorType*){return true;}
static void foreign_extension(){}
struct Fixture{
 wmWindowManager wm;wmWindow win;ScrArea area;ARegion region;bScreen screen;
 ARegionRuntime runtime;bContext C;wmOperatorType pan,zoom;StructRNA ps,zs;
 Fixture(){region.runtime=&runtime;area.regionbase.first=area.regionbase.last=&region;C.wm=&wm;C.win=&win;C.area=&area;C.region=&region;
 C.screen=&screen;pan.srna=&ps;zoom.srna=&zs;VIEW2D_OT_pan(&pan);VIEW2D_OT_zoom(&zoom);
 registry[pan.idname]=&pan;registry[zoom.idname]=&zoom;counts={};context_trace.clear();last_op=nullptr;scalar_values.clear();U={};}
 wmEvent event(bool zoom_event=false){wmEvent e;e.flag=WM_EVENT_IS_PENCIL_PRECISION_PAN;
 if(zoom_event)e.modifier=KM_CTRL;return e;}
};
static void unchanged(const Fixture&f){assert(f.region.v2d.cur.xmin==0&&f.region.v2d.cur.xmax==100);
 assert(f.region.v2d.cur.ymin==0&&f.region.v2d.cur.ymax==100);assert(!(f.region.v2d.flag&V2D_IS_NAVIGATING));}
static void no_lifecycle(){assert(!counts.alloc&&!counts.free&&!counts.create&&!counts.operator_free);
 assert(!counts.ids&&!counts.reports&&!counts.finished&&!counts.last_init&&!counts.redraw&&!counts.sync);
 assert(!counts.mousemove&&!counts.cursor&&!counts.timer&&!counts.modal_add&&!counts.ui_cancel&&!counts.rect_changed&&!counts.region_co);}
static void mutate_profile(wmOperatorType&t,int field,Fixture&f,wmOperatorTypeMacro&macro){
 switch(field){
 case 0:t.poll=foreign_poll;break;case 1:t.exec=foreign_exec;break;
 case 2:t.invoke=foreign_invoke;break;case 3:t.modal=foreign_modal;break;
 case 4:t.cancel=foreign_cancel;break;case 5:t.flag^=OPTYPE_UNDO;break;
 case 6:t.pyop_poll=foreign_py_poll;break;case 7:t.rna_ext.data=&f;break;
 case 8:t.rna_ext.srna=&f.ps;break;case 9:t.rna_ext.call=foreign_extension;break;
 case 10:t.rna_ext.free=foreign_extension;break;case 11:t.macro.first=&macro;t.macro.last=&macro;break;
 case 12:t.macro.last=&macro;break;}
}
static void profile_cases(){
 Fixture f;wmOperatorTypeMacro macro;assert(ED_view2d_native_pan_zoom_type_is(&f.pan,false));
 assert(ED_view2d_native_pan_zoom_type_is(&f.zoom,true));
 assert(!ED_view2d_native_pan_zoom_type_is(nullptr,false));
 assert(!ED_view2d_native_pan_zoom_type_is(&f.pan,true));assert(!ED_view2d_native_pan_zoom_type_is(&f.zoom,false));
 for(bool zoom:{false,true})for(int field=0;field<13;++field){
  wmOperatorType t=zoom?f.zoom:f.pan;
  mutate_profile(t,field,f,macro);
  assert(!ED_view2d_native_pan_zoom_type_is(&t,zoom));++scenarios;
 }
 no_lifecycle();++scenarios;
}
static void positive_cases(){
 for(bool zoom:{false,true}){
  Fixture f;wmEvent event=f.event(zoom);const auto before=event;
  auto status=native_invoke(&f.C,zoom?&f.zoom:&f.pan,&event,zoom?2:1);
  assert(std::memcmp(&event,&before,sizeof(event))==0);
  if(historical){assert(status==OPERATOR_FINISHED);assert(counts.create==1&&counts.alloc==1);
   assert(f.region.v2d.cur.xmin!=0||f.region.v2d.cur.ymin!=0);
  }else{assert(status==OPERATOR_CANCELLED);assert(counts.poll==1);assert(counts.py==2&&counts.profile==2);
   assert(!context_trace.empty()&&context_trace.front()=="py");
   auto poll=std::find(context_trace.begin(),context_trace.end(),"poll");
   assert(poll!=context_trace.end());assert(std::find(poll,context_trace.end(),"py")!=context_trace.end());
   assert(std::count(context_trace.begin(),context_trace.end(),"area")==2);
   assert(std::count(context_trace.begin(),context_trace.end(),"region")==3);
   unchanged(f);no_lifecycle();}
  ++scenarios;
 }
 Fixture f;auto e=f.event();for(int i=0;i<5;++i){
  e.prev_xy[0]=e.xy[0];++e.xy[0];
  auto result=native_invoke(&f.C,&f.pan,&e,1);
  assert(result==(historical?OPERATOR_FINISHED:OPERATOR_CANCELLED));
 }
 assert(f.region.v2d.cur.xmin==(historical?-5.f:0.f));++scenarios;
}
static void poll_cases(){
 for(bool zoom:{false,true})for(int reason=0;reason<3;++reason){
  Fixture f;wmEvent e=f.event(zoom);
  if(reason==0){if(zoom)f.region.v2d.keepzoom=V2D_LOCKZOOM_X|V2D_LOCKZOOM_Y;
   else f.region.v2d.keepofs=V2D_LOCKOFS_X|V2D_LOCKOFS_Y;}
  if(reason==1)f.C.region=nullptr;
  if(reason==2){if(!zoom)continue;f.C.rv3d=&f;}
  assert(native_invoke(&f.C,zoom?&f.zoom:&f.pan,&e,zoom?2:1)==OPERATOR_PASS_THROUGH);
  assert(counts.poll==1);unchanged(f);no_lifecycle();++scenarios;
 }
 for(bool zoom:{false,true})for(bool lock:{false,true}){
  Fixture f;auto e=f.event(zoom);if(lock){f.region.v2d.keepofs=3;f.region.v2d.keepzoom=3;}
  assert(native_invoke(&f.C,zoom?&f.zoom:&f.pan,&e,zoom?2:1,nullptr,true)==(!lock));
  assert(counts.poll==1);no_lifecycle();unchanged(f);++scenarios;
 }
}
static void fallback_cases(){
 for(bool zoom:{false,true})for(int field=0;field<10;++field){
  Fixture f;wmEvent e=f.event(zoom);int profile=zoom?2:1;
  switch(field){case 0:profile=0;break;case 1:e.flag=0;break;
   case 2:e.modifier=zoom?0:KM_CTRL;break;case 3:e.val=KM_PRESS;break;
   case 4:e.keymodifier=10;break;case 5:f.area.spacetype=SPACE_SEQ;break;
   case 6:f.region.regiontype=RGN_TYPE_HEADER;break;case 7:f.C.py_dict=&f;break;
   case 8:profile=zoom?1:2;break;case 9:e.flag|=WM_EVENT_MULTITOUCH_TWO_FINGERS;break;}
  const auto result=native_invoke(&f.C,zoom?&f.zoom:&f.pan,&e,profile);
  /* A two-finger marker is not ordinary physical Pencil provenance. */
  assert(result==OPERATOR_FINISHED);assert(counts.create==1&&counts.finished==1);
  assert(counts.alloc==1&&counts.free==1&&counts.rect_changed==1);
  if(field==7&&!historical){assert(context_trace.size()>2&&context_trace[0]=="py"&&context_trace[1]=="poll");}
  assert(f.region.v2d.cur.xmin!=0||f.region.v2d.cur.ymin!=0);++scenarios;
 }
 /* A changed native callback profile follows the existing ordinary invoke. */
 for(int field=0;field<13;++field){Fixture f;auto e=f.event();
  wmOperatorType child;child.idname="FIXTURE_OT_macro_child";registry[child.idname]=&child;
  wmOperatorTypeMacro macro;macro.idname=child.idname;mutate_profile(f.pan,field,f,macro);
  assert(native_invoke(&f.C,&f.pan,&e,1)==OPERATOR_FINISHED);assert(counts.create==1);++scenarios;
 }
 /* Explicit/eventless exec and pinch remain native. */
 for(bool zoom:{false,true}){Fixture f;PointerRNA p;RNA_float_set(&p,"deltax",1);RNA_float_set(&p,"deltay",2);
  assert(native_invoke(&f.C,zoom?&f.zoom:&f.pan,nullptr,0,&p)==OPERATOR_FINISHED);
  assert(counts.create==1&&f.region.v2d.cur.xmin!=0);++scenarios;}
 {Fixture f;auto e=f.event(true);e.type=MOUSEZOOM;
  assert(native_invoke(&f.C,&f.zoom,&e,2)==OPERATOR_FINISHED);assert(f.region.v2d.cur.xmin!=0);++scenarios;}
}
static void live_navigation_cases(){
 for(bool zoom:{false,true}){Fixture f;auto e=f.event(zoom);e.type=MIDDLEMOUSE;e.val=KM_PRESS;
  auto*ot=zoom?&f.zoom:&f.pan;assert(native_invoke(&f.C,ot,&e,0)==OPERATOR_RUNNING_MODAL);
  auto*op=last_op;assert(op&&counts.modal_add==1&&(f.region.v2d.flag&V2D_IS_NAVIGATING));
  wmEvent motion=e;motion.type=MOUSEMOVE;motion.xy[0]+=4;motion.xy[1]+=7;
  assert(ot->modal(&f.C,op,&motion)==OPERATOR_RUNNING_MODAL);
  assert(f.region.v2d.cur.xmin!=0||f.region.v2d.cur.ymin!=0);
  wmEvent release=motion;release.type=MIDDLEMOUSE;release.val=KM_RELEASE;
  assert(ot->modal(&f.C,op,&release)==OPERATOR_FINISHED);
  assert(!op->customdata&&!(f.region.v2d.flag&V2D_IS_NAVIGATING));
  WM_operator_free(op);assert(counts.alloc==counts.free);++scenarios;
 }
}
static int required_denial_control(bool zoom){Fixture f;auto event=f.event(zoom);
 auto result=native_invoke(&f.C,zoom?&f.zoom:&f.pan,&event,zoom?2:1);
 if(result!=OPERATOR_CANCELLED||counts.create||f.region.v2d.cur.xmin!=0||f.region.v2d.cur.ymin!=0){
  std::cerr<<"NODE_REQUIRED_DENIAL_FAILED "<<(zoom?"CtrlZoom":"Pan")<<" status="<<result
   <<" creates="<<counts.create<<" xmin="<<f.region.v2d.cur.xmin<<" ymin="<<f.region.v2d.cur.ymin<<"\n";return 17;}
 return 0;
}
int main(int argc,char**argv){if(argc>1)return required_denial_control(std::string(argv[1])=="--require-zoom-denial");
 profile_cases();positive_cases();poll_cases();fallback_cases();live_navigation_cases();scenarios+=live_control_cases();
 std::cout<<scenarios<<" native-invoke scenarios passed"<<(historical?" (original navigation failure retained)":"")<<"\n";}
