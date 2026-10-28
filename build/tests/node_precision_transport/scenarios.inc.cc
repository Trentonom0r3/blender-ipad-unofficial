
bool sourcebit(const wmEvent&e){return bool(e.flag&WM_EVENT_IS_PENCIL_PRECISION_PAN);}
const GHOST_TEventTrackpadData&pd(const GHOST_Event*e){return *static_cast<const GHOST_TEventTrackpadData*>(e->data_);}
struct Fixture {Runtime runtime;wmEvent state;wmWindow win{&runtime,&state};Sender sender;UITouch touch;
 Fixture(){system_owner.clear();pointer_capture={};ring_capture={};pointer_hud_contact={};pointer_finger_contact=false;
 mouse_left_pressed=mouse_middle_pressed=mouse_right_pressed=flythrough=false;pencil_paint_enqueued={};pencil_paint_enqueued_down=false;
 sender.gesture_contact.begin(ios_touch_device(&touch),uintptr_t(&touch),sender.sample);}
 ~Fixture(){clear(&win);system_owner.clear();}
 void action(int state,CGPoint point,CGPoint delta,bool old=false){sender.state=state;sender.touch_point=point;sender.translation=delta;
 if(old)producer_old(sender);else producer(sender);}
};
std::vector<std::string>packets(){std::vector<std::string>r;for(auto*e:system_owner.queue){
 std::string value=std::to_string(e->type)+":";
 if(e->type==GHOST_kEventTrackpad){auto&p=pd(e);value+=std::to_string(p.subtype)+","+std::to_string(p.x)+","+std::to_string(p.y)+","+std::to_string(p.deltaX)+","+std::to_string(p.deltaY)+","+std::to_string(p.isDirectionInverted)+","+std::to_string(p.numFingers);}
 else if(e->type==GHOST_kEventCursorMove){auto&p=*static_cast<GHOST_TEventCursorData*>(e->data_);value+=std::to_string(p.x)+","+std::to_string(p.y)+","+std::to_string(p.tablet.Pressure)+","+std::to_string(p.tablet.Xtilt)+","+std::to_string(p.tablet.Ytilt)+","+std::to_string(p.ipad_pencil_paint_serial)+","+std::to_string(p.ipad_hud_serial);}
 else if(e->type==GHOST_kEventButtonDown||e->type==GHOST_kEventButtonUp){auto&p=*static_cast<GHOST_TEventButtonData*>(e->data_);value+=std::to_string(p.button)+","+std::to_string(p.tablet.Pressure)+","+std::to_string(p.is_cancelled)+","+std::to_string(p.ipad_pencil_paint_serial);}
 r.push_back(value);}return r;}
void producer_cases(bool old=false){
 for(bool pencil:{false,true})for(bool live:{false,true})for(int terminal:{UIGestureRecognizerStateEnded,UIGestureRecognizerStateCancelled,UIGestureRecognizerStateFailed}){
  std::vector<std::string>reference;
  {Fixture f;f.sender.pencil=pencil;f.action(UIGestureRecognizerStateBegan,{110,100},{10,0},true);f.action(UIGestureRecognizerStateChanged,{115,98},{15,-2},true);f.action(terminal,{115,98},{15,-2},true);reference=packets();}
  {Fixture f;f.sender.pencil=pencil;f.sender.gesture_contact.down=live;
   f.action(UIGestureRecognizerStateBegan,{110,100},{10,0},old);f.action(UIGestureRecognizerStateChanged,{115,98},{15,-2},old);f.action(terminal,{115,98},{15,-2},old);
   assert(packets()==reference);int positive=0;for(auto*e:system_owner.queue)if(e->type==GHOST_kEventTrackpad)positive+=pd(e).is_physical_pencil_precision_pan==1;
   if(pencil&&live)assert(positive == 1);else assert(positive==0);
  }
 }
 // Zero movement, terminal without DOWN, missing/indirect actor and Knife/paint
 // omissions keep baseline packets and never acquire the source class.
 for(int kind=0;kind<4;++kind){Fixture f;
  if(kind==0)f.sender.gesture_contact.reset();
  if(kind==1)f.sender.gesture_contact.device=ghost::ios::TouchDevice::Indirect;
  if(kind==2)f.sender.omit_knife=true;
  f.action(UIGestureRecognizerStateChanged,{115,98},kind==3?CGPointZero:CGPoint{15,-2});
  for(auto*e:system_owner.queue)if(e->type==GHOST_kEventTrackpad)assert(pd(e).is_physical_pencil_precision_pan==0);
 }
 for(int state:{UIGestureRecognizerStateBegan,UIGestureRecognizerStateEnded,UIGestureRecognizerStateCancelled,UIGestureRecognizerStateFailed}){
  Fixture f;f.action(state,{110,100},{10,0});for(auto*e:system_owner.queue)if(e->type==GHOST_kEventTrackpad)assert(pd(e).is_physical_pencil_precision_pan==0);
 }
}
void constructor_cases(){Fixture f;CGPoint point{50,60},delta{5,-2};CGFloat distance=7;
 assert(ios_touch_device(nullptr)==ghost::ios::TouchDevice::Unknown);
 for(int kind:std::initializer_list<int>{UITouchTypeDirect,UITouchTypePencil,UITouchTypeIndirect,UITouchTypeIndirectPointer,99}){UITouch touch;touch.type=kind;
  auto expected=kind==UITouchTypePencil?ghost::ios::TouchDevice::Pencil:kind==UITouchTypeDirect?ghost::ios::TouchDevice::Finger:
      (kind==UITouchTypeIndirect||kind==UITouchTypeIndirectPointer)?ghost::ios::TouchDevice::Indirect:ghost::ios::TouchDevice::Unknown;
  assert(ios_touch_device(&touch)==expected);
 }
 for(auto kind:{UserInputEvent::PAN_GESTURE,UserInputEvent::PAN_GESTURE_TWO_FINGERS,UserInputEvent::PAN_GESTURE_THREE_FINGERS,UserInputEvent::PINCH_GESTURE}){
  UserInputEvent e(&point,&delta,&distance,true);assert(!e.physical_pencil_precision_pan);e.add_event(kind);generateUserInputEvents(e);
  for(auto*p:system_owner.queue)if(p->type==GHOST_kEventTrackpad)assert(pd(p).is_physical_pencil_precision_pan==0);system_owner.clear();
 }
 // Shared constructors explicitly initialize both defaults and the positive byte.
 for(bool tagged:{false,true}){GHOST_EventTrackpad e(9,window,GHOST_kTrackpadEventScroll,5,6,7,-8,true,1,tagged);auto&p=pd(&e);
 assert(p.is_physical_pencil_precision_pan==(tagged?1:0));assert(p.x==5&&p.y==6&&p.deltaX==7&&p.deltaY==-8&&p.isDirectionInverted&&p.numFingers==1);}
 GHOST_EventTrackpad omitted(9,window,GHOST_kTrackpadEventScroll,5,6,7,-8,true);assert(pd(&omitted).is_physical_pencil_precision_pan==0);
 eWM_EventFlag flags=WM_EVENT_IS_PENCIL_PRECISION_PAN|WM_EVENT_SCROLL_INVERT;flags&=~WM_EVENT_SCROLL_INVERT;assert(flags==WM_EVENT_IS_PENCIL_PRECISION_PAN);
}
void queue_cases(bool old_ingestion=false,bool old_merge=false){
 for(int raw:{0,1,2,-1})for(uint fingers:{1u,2u,3u})for(int subtype:std::initializer_list<int>{GHOST_kTrackpadEventScroll,GHOST_kTrackpadEventMagnify,GHOST_kTrackpadEventMagnifyTouch,GHOST_kTrackpadEventSmartMagnify,GHOST_kTrackpadEventRotate,99}){
  Fixture f;GHOST_EventTrackpad p(9,window,subtype,30,40,3,-4,true,fingers,true);const_cast<GHOST_TEventTrackpadData&>(pd(&p)).is_physical_pencil_precision_pan=char(raw);
  if(old_ingestion)ingest_old(&f.win,&p);else ingest(&f.win,&p);
  auto&e=*f.runtime.event_queue.last;bool tagged=sourcebit(e);int positive=tagged?1:0;
  if(raw==1&&fingers==1&&subtype==GHOST_kTrackpadEventScroll)assert(positive == 1);else assert(!tagged);
  assert(!(f.state.flag&WM_EVENT_IS_PENCIL_PRECISION_PAN));assert(e.modifier==13&&e.keymodifier==17&&e.sentinel==55&&e.pressure==.7f);
 }
 for(int mask=0;mask<8;++mask){Fixture f;int totalx=0,totaly=0;
  for(int i=0;i<3;++i){wmEvent e;e.type=MOUSEPAN;e.xy[0]=110+i;e.xy[1]=220+i;e.flag=eWM_EventFlag(WM_EVENT_SCROLL_INVERT|WM_EVENT_IS_DIRECT_TOOL|WM_EVENT_IS_DIRECT_FINGER);
   if(mask&(1<<i))e.flag|=WM_EVENT_IS_PENCIL_PRECISION_PAN;e.modifier=30+i;totalx+=i+1;totaly-=i+2;
   auto*out=old_merge?wm_event_add_trackpad_old(&f.win,&e,i+1,-i-2):wm_event_add_trackpad(&f.win,&e,i+1,-i-2);
   assert(f.runtime.event_queue.items.size()==1);assert(out->xy[0]-out->prev_xy[0]==totalx&&out->xy[1]-out->prev_xy[1]==totaly);
   bool tagged=sourcebit(*out);bool all=(mask&((1<<(i+1))-1))==((1<<(i+1))-1);if(all)assert(tagged);else assert(!tagged);
   assert(out->modifier==30+i);assert((out->flag&~WM_EVENT_IS_PENCIL_PRECISION_PAN)==(e.flag&~WM_EVENT_IS_PENCIL_PRECISION_PAN));
  }
 }
 // Different subtype or pinch class retains native separate-packet behavior.
 for(bool pinch:{false,true}){Fixture f;wmEvent a;a.type=MOUSEPAN;a.flag=WM_EVENT_IS_PENCIL_PRECISION_PAN;wm_event_add_trackpad(&f.win,&a,1,2);
  wmEvent b=a;if(pinch)b.flag|=WM_EVENT_IS_TOUCH_PINCH;else b.type=MOUSEZOOM;wm_event_add_trackpad(&f.win,&b,3,4);assert(f.runtime.event_queue.items.size()==2);assert(sourcebit(*f.runtime.event_queue.last));}
}
void replay_cases(bool old=false){Fixture f;wmEvent input;input.type=MOUSEPAN;input.flag=WM_EVENT_IS_PENCIL_PRECISION_PAN|WM_EVENT_IS_DIRECT_FINGER|WM_EVENT_SCROLL_INVERT;
 auto*out=old?WM_event_add_old(&f.win,&input):WM_event_add(&f.win,&input);bool tagged=sourcebit(*out);assert(!tagged);assert(sourcebit(input));
 assert(out->flag==(input.flag&~WM_EVENT_IS_PENCIL_PRECISION_PAN));clear(&f.win);
 out=WM_event_add_simulate(&f.win,&input);assert(!sourcebit(*out));assert(sourcebit(input));clear(&f.win);
 // A genuine packet after replay reaches private ingestion with its label intact.
 GHOST_EventTrackpad p(9,window,GHOST_kTrackpadEventScroll,30,40,3,-4,false,1,true);ingest(&f.win,&p);assert(sourcebit(*f.runtime.event_queue.last));
}
int main(int argc,char**argv){assert(argc==2);std::string mode=argv[1];
 if(mode=="producer"||mode=="old-producer")producer_cases(mode=="old-producer");
 else if(mode=="constructor")constructor_cases();
 else if(mode=="queue"||mode=="old-ingestion"||mode=="old-merge")queue_cases(mode=="old-ingestion",mode=="old-merge");
 else if(mode=="replay"||mode=="old-replay")replay_cases(mode=="old-replay");else assert(false);
 std::cout<<"PASS "<<mode<<"\n";
}
