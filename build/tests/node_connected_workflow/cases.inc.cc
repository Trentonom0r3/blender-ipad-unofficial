
namespace workflow {
namespace T=transport;
namespace N=native_current;
namespace H=native_historical;
static int scenarios=0;
static_assert(int(T::MOUSEPAN)==int(N::MOUSEPAN));
static_assert(int(T::MOUSEMOVE)==int(N::MOUSEMOVE));
static_assert(int(T::WM_EVENT_IS_PENCIL_PRECISION_PAN)==N::WM_EVENT_IS_PENCIL_PRECISION_PAN);

// Explicit host pointer-queue boundary. Actual Trackpad ingestion and all
// coalescing execute unchanged. Pointer records remain queue barriers in order.
static void ingest_packet(T::Fixture&f,const T::GHOST_Event*packet){
 if(packet->type==T::GHOST_kEventTrackpad){T::ingest(&f.win,packet);return;}
 T::wmEvent event=f.state;event.flag=T::eWM_EventFlag(0);
 if(packet->type==T::GHOST_kEventCursorMove){
  auto&data=*static_cast<const T::GHOST_TEventCursorData*>(packet->data_);
  event.type=T::MOUSEMOVE;event.val=T::KM_NOTHING;event.xy[0]=data.x;event.xy[1]=data.y;
  T::wm_cursor_position_from_ghost_screen_coords(&f.win,&event.xy[0],&event.xy[1]);
  T::copy_v2_v2_int(event.prev_xy,f.state.xy);T::copy_v2_v2_int(f.state.xy,event.xy);
 }else if(packet->type==T::GHOST_kEventButtonDown||packet->type==T::GHOST_kEventButtonUp){
  auto&data=*static_cast<const T::GHOST_TEventButtonData*>(packet->data_);
  assert(data.button==T::GHOST_kButtonMaskLeft);
  event.type=N::LEFTMOUSE;event.val=packet->type==T::GHOST_kEventButtonDown?N::KM_PRESS:N::KM_RELEASE;
 }else{assert(false);}
 T::wm_event_add_intern(&f.win,&event);
}
static void transfer_new(T::Fixture&f,size_t&consumed){
 while(consumed<T::system_owner.queue.size())ingest_packet(f,T::system_owner.queue[consumed++]);
}
static void configure(T::Fixture&f,bool control=false,bool finger=false){
 f.state.modifier=control?N::KM_CTRL:0;f.state.keymodifier=N::EVENT_NONE;
 if(finger){f.sender.pencil=false;f.touch.type=T::UITouchTypeDirect;f.sender.gesture_contact.reset();
  assert(f.sender.gesture_contact.begin(T::ios_touch_device(&f.touch),uintptr_t(&f.touch),f.sender.sample));}
}
static N::wmEvent copy_to_native(const T::wmEvent&source){
 N::wmEvent result;result.type=source.type;result.val=source.val;result.flag=int(source.flag);
 result.modifier=source.modifier;result.keymodifier=source.keymodifier;
 for(int i=0;i<2;++i){result.xy[i]=source.xy[i];result.prev_xy[i]=source.prev_xy[i];}
 assert(result.type==source.type&&result.val==source.val&&result.flag==int(source.flag));
 assert(result.modifier==source.modifier&&result.keymodifier==source.keymodifier);
 for(int i=0;i<2;++i)assert(result.xy[i]==source.xy[i]&&result.prev_xy[i]==source.prev_xy[i]);
 return result;
}
static H::wmEvent copy_to_historical(const T::wmEvent&source){
 H::wmEvent result;result.type=source.type;result.val=source.val;result.flag=int(source.flag);
 result.modifier=source.modifier;result.keymodifier=source.keymodifier;
 for(int i=0;i<2;++i){result.xy[i]=source.xy[i];result.prev_xy[i]=source.prev_xy[i];}
 return result;
}
static std::vector<T::wmEvent>pan_events(const T::Fixture&f){
 std::vector<T::wmEvent>result;for(auto*event:f.runtime.event_queue.items)if(event->type==T::MOUSEPAN)result.push_back(*event);return result;
}
static bool changed(const N::Connected&f){auto&r=f.region.v2d.cur;return r.xmin!=0||r.xmax!=100||r.ymin!=0||r.ymax!=100;}
static bool changed(const H::Connected&f){auto&r=f.region.v2d.cur;return r.xmin!=0||r.xmax!=100||r.ymin!=0||r.ymax!=100;}
static void assert_pointer_sequence(bool finger,int moves){
 std::vector<int>expected{T::GHOST_kEventCursorMove};
 if(!finger)expected.push_back(T::GHOST_kEventButtonDown);
 for(int i=0;i<moves;++i){expected.push_back(T::GHOST_kEventTrackpad);if(!finger)expected.push_back(T::GHOST_kEventCursorMove);}
 expected.push_back(finger?T::GHOST_kEventCursorMove:T::GHOST_kEventButtonUp);
 assert(T::system_owner.queue.size()==expected.size());
 for(size_t i=0;i<expected.size();++i)assert(T::system_owner.queue[i]->type==expected[i]);
}
static std::vector<std::string>original_packets(bool control,bool finger,int moves){
 T::Fixture f;configure(f,control,finger);
 f.action(T::UIGestureRecognizerStateBegan,{110,100},{10,0},true);
 for(int i=1;i<=moves;++i)f.action(T::UIGestureRecognizerStateChanged,{110.+5*i,100.-2*i},{10.+5*i,-2.*i},true);
 f.action(T::UIGestureRecognizerStateEnded,{110.+5*moves,100.-2*moves},{10.+5*moves,-2.*moves},true);
 return T::packets();
}
static void pure_and_finger(){
 for(bool control:{false,true})for(bool finger:{false,true})for(int moves:{1,3}){
  auto reference=original_packets(control,finger,moves);T::Fixture f;configure(f,control,finger);size_t consumed=0;
  f.action(T::UIGestureRecognizerStateBegan,{110,100},{10,0});transfer_new(f,consumed);
  for(int i=1;i<=moves;++i){f.action(T::UIGestureRecognizerStateChanged,{110.+5*i,100.-2*i},{10.+5*i,-2.*i});transfer_new(f,consumed);}
  f.action(T::UIGestureRecognizerStateEnded,{110.+5*moves,100.-2*moves},{10.+5*moves,-2.*moves});transfer_new(f,consumed);
  assert(T::packets()==reference);assert_pointer_sequence(finger,moves);
  auto pans=pan_events(f);assert(pans.size()==size_t(finger?1:moves));N::Connected native;
  for(auto&pan:pans){assert(T::sourcebit(pan)==!finger);auto event=copy_to_native(pan);
   auto expected=finger?N::eIPadNodeView2DDispatch::None:control?N::eIPadNodeView2DDispatch::StockCtrlZoom:N::eIPadNodeView2DDispatch::StockPan;
   assert(native.classify(event)==expected);N::counts={};assert(native.dispatch(event)==N::WM_HANDLER_BREAK);
   if(!finger){assert(N::counts.poll==1);N::no_lifecycle();assert(!changed(native));}
   else{assert(N::counts.poll==1&&N::counts.create==1&&N::counts.alloc==1&&N::counts.finished==1);assert(changed(native));}
  }
  ++scenarios;
 }
}
static void hardware_and_mixed(){
 for(bool control:{false,true}){
  // Existing defaulted backend constructor never supplies the physical label.
  {T::Fixture f;configure(f,control);T::GHOST_EventTrackpad hardware(9,T::window,T::GHOST_kTrackpadEventScroll,120,99,3,-4,false);
   assert(T::pd(&hardware).is_physical_pencil_precision_pan==0);T::ingest(&f.win,&hardware);auto pans=pan_events(f);assert(pans.size()==1&&!T::sourcebit(pans[0]));
   N::Connected native;auto event=copy_to_native(pans[0]);assert(native.classify(event)==N::eIPadNodeView2DDispatch::None);N::counts={};assert(native.dispatch(event)==N::WM_HANDLER_BREAK);assert(N::counts.create==1&&changed(native));++scenarios;}
  // A hardware PAN arrives after Begin and immediately before the physical
  // Changed batch. Its real adjacent aggregate must remain unclassified.
  {T::Fixture f;configure(f,control);size_t consumed=0;f.action(T::UIGestureRecognizerStateBegan,{110,100},{10,0});transfer_new(f,consumed);
   T::GHOST_EventTrackpad hardware(9,T::window,T::GHOST_kTrackpadEventScroll,120,99,3,-4,false);T::ingest(&f.win,&hardware);
   f.action(T::UIGestureRecognizerStateChanged,{115,98},{15,-2});transfer_new(f,consumed);auto pans=pan_events(f);
   assert(pans.size()==1&&!T::sourcebit(pans[0]));assert(pans[0].xy[0]-pans[0].prev_xy[0]==8&&pans[0].xy[1]-pans[0].prev_xy[1]==6);
   N::Connected native;auto event=copy_to_native(pans[0]);assert(native.classify(event)==N::eIPadNodeView2DDispatch::None);N::counts={};assert(native.dispatch(event)==N::WM_HANDLER_BREAK);assert(N::counts.create==1&&changed(native));++scenarios;}
  // In the reverse legal order the actual paired cursor is a queue barrier;
  // preserve two PAN packets, denying only the pure physical contribution.
  {T::Fixture f;configure(f,control);size_t consumed=0;f.action(T::UIGestureRecognizerStateBegan,{110,100},{10,0});transfer_new(f,consumed);
   f.action(T::UIGestureRecognizerStateChanged,{115,98},{15,-2});transfer_new(f,consumed);
   T::GHOST_EventTrackpad hardware(9,T::window,T::GHOST_kTrackpadEventScroll,120,99,3,-4,false);T::ingest(&f.win,&hardware);auto pans=pan_events(f);
   assert(pans.size()==2&&T::sourcebit(pans[0])&&!T::sourcebit(pans[1]));N::Connected native;
   auto physical=copy_to_native(pans[0]);N::counts={};assert(native.dispatch(physical)==N::WM_HANDLER_BREAK);N::no_lifecycle();assert(!changed(native));
   auto external=copy_to_native(pans[1]);N::counts={};assert(native.dispatch(external)==N::WM_HANDLER_BREAK);assert(N::counts.create==1&&changed(native));++scenarios;}
 }
}
static int require_denial(bool old_producer){
 T::Fixture f;configure(f);size_t consumed=0;f.action(T::UIGestureRecognizerStateBegan,{110,100},{10,0},old_producer);transfer_new(f,consumed);
 f.action(T::UIGestureRecognizerStateChanged,{115,98},{15,-2},old_producer);transfer_new(f,consumed);auto pans=pan_events(f);assert(pans.size()==1);
 int creates=0;bool moved=false;int result=0;
 if(old_producer){N::Connected native;auto event=copy_to_native(pans[0]);N::counts={};result=native.dispatch(event);creates=N::counts.create;moved=changed(native);}
 else{assert(T::sourcebit(pans[0]));H::Connected native;auto event=copy_to_historical(pans[0]);H::counts={};result=native.dispatch(event);creates=H::counts.create;moved=changed(native);}
 if(creates||moved){std::cerr<<"WORKFLOW_REQUIRED_DENIAL_FAILED "<<(old_producer?"original-producer":"original-native-invoke")<<" action="<<result<<" creates="<<creates<<" shifted="<<moved<<"\n";return 17;}
 return 0;
}
}
int main(int argc,char**argv){
 if(argc>1)return workflow::require_denial(std::string(argv[1])=="--require-old-producer-denial");
 workflow::pure_and_finger();workflow::hardware_and_mixed();
 std::cout<<workflow::scenarios<<" actual producer-to-native workflow scenarios passed\n";
}
