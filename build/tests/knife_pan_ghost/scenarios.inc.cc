int callbacks=0,captures=0,recognitions=0,native_modifier=0,native_keymodifier=0;
bool native_safe=true,corrupt_result=false;
ghost::ios::PencilKnifePanContact native_stamp;
void reset_native(){actual_manager.events_.clear();system_owner.event_manager=&actual_manager;
 callbacks=captures=recognitions=native_modifier=native_keymodifier=0;native_safe=true;corrupt_result=false;
 native_stamp={};native_stamp.content=99;native_stamp.tool_ref=0;native_stamp.intent=ghost::ios::PencilKnifePanIntent::Live;
 for(size_t i=0;i<native_stamp.scope.size();++i)native_stamp.scope[i]=1000+i;
 for(size_t i=0;i<native_stamp.owner.size();++i)native_stamp.owner[i]=2000+i;
 super_begin_hook={};super_begins=super_resets=0;
}
bool native_probe(const void*win,bool capture,const ghost::ios::PencilKnifePanContact&original,ghost::ios::PencilKnifePanContact&result){
 ++callbacks;if(capture)++captures;else ++recognitions;
 if(win!=window||!native_safe||(native_stamp.intent==ghost::ios::PencilKnifePanIntent::Tool&&(native_modifier||native_keymodifier)))return false;
 result=native_stamp;result.serial=original.serial;result.origin_x=original.origin_x;result.origin_y=original.origin_y;
 if(corrupt_result)++result.serial;return true;
}
void install(){reset_native();ghost::ios::set_pencil_knife_pan_probe(native_probe);}
void physical(Fixture&f,UITouch&t){f.expire();f.sender.contact={};f.sender.reset();f.sender.touchesBegan({&t});f.sender.pencil=t.type==UITouchTypePencil;}
using Packets=std::vector<std::string>;
std::string packet(GHOST_Event*e){std::ostringstream o;o<<std::setprecision(20)<<e->type;
 auto tablet=[&](const GHOST_TabletData&t){o<<','<<t.Active<<','<<t.Pressure<<','<<t.Xtilt<<','<<t.Ytilt;};
 if(e->type==GHOST_kEventCursorMove){auto*d=static_cast<GHOST_TEventCursorData*>(e->data_);o<<','<<d->x<<','<<d->y;tablet(d->tablet);
 o<<','<<d->is_direct_tool<<','<<d->ipad_hud_generation<<','<<d->ipad_hud_serial<<','<<d->is_direct_finger<<','<<d->ipad_finger_paint_generation<<','<<d->ipad_pencil_paint_serial<<','<<d->ipad_pencil_paint_generation<<','<<d->ipad_pencil_paint_region<<','<<d->ipad_pencil_paint_origin_x<<','<<d->ipad_pencil_paint_origin_y;
 }else if(e->type==GHOST_kEventButtonDown||e->type==GHOST_kEventButtonUp){auto*d=static_cast<GHOST_TEventButtonData*>(e->data_);o<<','<<d->button;tablet(d->tablet);
 o<<','<<d->is_cancelled<<','<<d->is_direct_tool<<','<<d->ipad_hud_generation<<','<<d->ipad_hud_serial<<','<<d->is_direct_finger<<','<<d->ipad_finger_paint_generation<<','<<d->ipad_pencil_paint_serial<<','<<d->ipad_pencil_paint_generation<<','<<d->ipad_pencil_paint_region<<','<<d->ipad_pencil_paint_origin_x<<','<<d->ipad_pencil_paint_origin_y;
 }else if(e->type==GHOST_kEventTrackpad){auto*d=static_cast<GHOST_TEventTrackpadData*>(e->data_);o<<','<<d->subtype<<','<<d->x<<','<<d->y<<','<<d->deltaX<<','<<d->deltaY<<','<<d->isDirectionInverted<<','<<d->numFingers;}return o.str();}
Packets snapshot(bool omit_pan=false){Packets r;for(auto*e:system_owner.queue)if(!(omit_pan&&e->type==GHOST_kEventTrackpad))r.push_back(packet(e));return r;}
void act(Fixture&f,bool baseline,int state,CGPoint p,CGPoint tr){f.sender.state=state;f.sender.touch_point=p;f.sender.translation=tr;if(baseline)producer_baseline(f.sender);else producer(f.sender);}
Packets stream(bool baseline,bool admitted,int terminal_state,bool ctrl_after=false){Fixture f;install();native_safe=admitted;UITouch t;physical(f,t);Packets result;
 for(int phase:std::array<int,4>{UIGestureRecognizerStateBegan,UIGestureRecognizerStateChanged,UIGestureRecognizerStateChanged,terminal_state}){
  CGPoint tr=phase==UIGestureRecognizerStateBegan?CGPoint{13,4}:CGPoint{21,-3};
  if(ctrl_after&&phase!=UIGestureRecognizerStateBegan){native_modifier=1;native_safe=false;native_stamp.content=900;}
  act(f,baseline,phase,{100+tr.x,100+tr.y},tr);auto part=snapshot(baseline&&admitted);result.insert(result.end(),part.begin(),part.end());
  assert(f.sender.cached.x==tr.x||phase==terminal_state);system_owner.clear();
 }
 if(!baseline&&admitted){assert(callbacks==2&&captures==1&&recognitions==1);assert(f.sender.omitKnifePairedPan());}
 return result;
}
void exact_packets(){for(int end:{UIGestureRecognizerStateEnded,UIGestureRecognizerStateCancelled,UIGestureRecognizerStateFailed}){
 assert(stream(false,true,end)==stream(true,true,end));assert(stream(false,false,end)==stream(true,false,end));
 assert(stream(false,true,end,true)==stream(true,true,end,true));}
 std::cout<<"PASS exact packet values/order/tablet/terminal/cached translation; admitted PAN deletion only\n";
}
void gate_cases(){
 {install();auto*saved=system;system=nullptr;assert(!ghost::ios::pencil_knife_pan_at_start(window,100,100,77).valid());ghost::ios::PencilKnifePanContact original=native_stamp;original.serial=77;assert(!ghost::ios::pencil_knife_pan_recognize(window,original)&&callbacks==0);system=saved;}

 for(int key:{GHOST_kEventKeyDown,GHOST_kEventKeyUp})for(bool before_capture:{false,true}){
  Fixture f;install();UITouch t;f.expire();f.sender.contact={};f.sender.reset();
  if(before_capture)system_owner.pushEvent(new GHOST_EventKey(19,key,window,GHOST_kKeyLeftShift,false,nullptr));
  f.sender.touchesBegan({&t});if(!before_capture)system_owner.pushEvent(new GHOST_EventKey(19,key,window,GHOST_kKeyLeftShift,false,nullptr));
  int initial=callbacks;f.action(UIGestureRecognizerStateBegan);assert(!f.sender.omitKnifePairedPan()&&callbacks==initial);
  system_owner.clear();f.action(UIGestureRecognizerStateChanged,{120,104},{20,4});assert(system_owner.queue.size()==2&&callbacks==initial);
 }
 for(bool missing:{false,true}){Fixture f;install();UITouch t;
  if(missing)system_owner.event_manager=nullptr;else ghost::ios::set_pencil_knife_pan_probe(nullptr);
  physical(f,t);f.action(UIGestureRecognizerStateBegan);assert(!f.sender.omitKnifePairedPan()&&callbacks==0);}
 for(bool manager_missing:{false,true}){Fixture f;install();UITouch t;physical(f,t);int calls=callbacks;
  if(manager_missing)system_owner.event_manager=nullptr;else ghost::ios::set_pencil_knife_pan_probe(nullptr);
  f.action(UIGestureRecognizerStateBegan);assert(!f.sender.omitKnifePairedPan()&&callbacks==calls);}
 for(int which:{0,1})for(bool after:{false,true}){Fixture f;install();UITouch t;native_stamp.intent=ghost::ios::PencilKnifePanIntent::Tool;native_stamp.tool_ref=71;
  if(!after)(which?native_keymodifier:native_modifier)=1;physical(f,t);
  if(after)(which?native_keymodifier:native_modifier)=1;
  f.action(UIGestureRecognizerStateBegan);assert(!f.sender.omitKnifePairedPan());system_owner.clear();f.action(UIGestureRecognizerStateChanged,{120,104},{20,4});assert(system_owner.queue.size()==2);}
 {Fixture f;install();native_stamp.intent=ghost::ios::PencilKnifePanIntent::Live;native_stamp.tool_ref=0;native_modifier=1;UITouch t;physical(f,t);f.action(UIGestureRecognizerStateBegan);assert(f.sender.omitKnifePairedPan());}
 for(bool modified:{false,true}){Fixture f;install();native_stamp.intent=ghost::ios::PencilKnifePanIntent::Tool;native_stamp.tool_ref=71;native_stamp.owner={};native_modifier=modified;UITouch t;physical(f,t);assert(!f.sender.pencil_knife_pan_origin.valid());f.action(UIGestureRecognizerStateBegan);assert(!f.sender.omitKnifePairedPan());system_owner.clear();f.action(UIGestureRecognizerStateChanged,{120,104},{20,4});assert(system_owner.queue.size()==2);}
 for(int index:{0,2,6,17,19}){Fixture f;install();native_stamp.owner[index]=0;UITouch t;physical(f,t);f.action(UIGestureRecognizerStateBegan);assert(!f.sender.pencil_knife_pan_origin.valid()&&!f.sender.omitKnifePairedPan());}
 {Fixture f;install();native_stamp.intent=ghost::ios::PencilKnifePanIntent::Tool;native_stamp.tool_ref=71;UITouch t;physical(f,t);int calls=callbacks;native_stamp.intent=ghost::ios::PencilKnifePanIntent::Live;native_stamp.tool_ref=0;f.action(UIGestureRecognizerStateBegan);assert(!f.sender.omitKnifePairedPan()&&callbacks==calls);system_owner.clear();f.action(UIGestureRecognizerStateChanged,{120,104},{20,4});assert(system_owner.queue.size()==2);}
 for(int field=0;field<60;++field){Fixture f;install();UITouch t;physical(f,t);if(field<32)++native_stamp.scope[field];else if(field<55)++native_stamp.owner[field-32];else if(field==55)++native_stamp.content;else if(field==56)++native_stamp.tool_ref;else if(field==57)native_stamp.intent=ghost::ios::PencilKnifePanIntent::Tool;else if(field==58)native_safe=false;else corrupt_result=true;
  f.action(UIGestureRecognizerStateBegan);assert(!f.sender.omitKnifePairedPan());system_owner.clear();f.action(UIGestureRecognizerStateChanged,{120,104},{20,4});assert(system_owner.queue.size()==2);}
 {Fixture f;install();UITouch t;physical(f,t);native_safe=false;native_safe=true;f.action(UIGestureRecognizerStateBegan);assert(f.sender.omitKnifePairedPan());}
 std::cout<<"PASS pending Down/Up before capture/recognition, absent callback/manager, initial modifiers, scope/content/owner/variant equality, original Live owner and initial Tool fallback\n";
}
void physical_cases(){
 for(int test=0;test<9;++test){Fixture f;install();UITouch t;
  if(test==0)t.type=UITouchTypeDirect;else if(test==1)t.view=&foreign_view;else if(test==2)t.local.x=-1;else if(test==3)t.local.x=700;else if(test==4)t.local.y=700;else if(test==5)t.local.x=std::numeric_limits<double>::infinity();else if(test==6)t.local.y=std::numeric_limits<double>::quiet_NaN();
  f.expire();f.sender.contact={};f.sender.reset();if(test==7)f.sender.ring_window=nullptr;
  if(test==8)f.sender.touchesBegan({&t,&t});else f.sender.touchesBegan({&t});
  assert(!f.sender.pencil_knife_pan_origin.valid()&&callbacks==0&&super_begins==1);
 }
 {Fixture f;install();UITouch t;f.expire();f.sender.contact={};f.sender.reset();
  super_begin_hook=[&]{assert(f.sender.pencil_knife_pan_origin.valid());f.action(UIGestureRecognizerStateBegan);};
  f.sender.touchesBegan({&t});super_begin_hook={};assert(f.sender.omitKnifePairedPan()&&callbacks==2);}
 {Fixture f;install();UITouch t;physical(f,t);f.action(UIGestureRecognizerStateBegan);const auto receipt=f.sender.pencil_knife_pan_origin;int calls=callbacks;system_owner.clear();
  UITouch extra;extra.type=UITouchTypeDirect;extra.view=&foreign_view;f.sender.touchesBegan({&extra});
  assert(f.sender.pencil_knife_pan_origin.serial==receipt.serial&&f.sender.omitKnifePairedPan()&&callbacks==calls);
  native_safe=false;system_owner.pushEvent(new GHOST_EventKey(19,GHOST_kEventKeyDown,window,GHOST_kKeyLeftShift,false,nullptr));system_owner.clear();
  f.action(UIGestureRecognizerStateChanged,{120,104},{20,4});assert(system_owner.queue.size()==1&&callbacks==calls);
  f.action(UIGestureRecognizerStateBegan);assert(callbacks==calls);
  f.sender.invalidateTouchStream();assert(!f.sender.omitKnifePairedPan()&&!f.sender.pencil_knife_pan_origin.valid());}
 {Fixture f;install();UITouch t;physical(f,t);f.action(UIGestureRecognizerStateChanged,{120,104},{20,4});assert(callbacks==1&&!f.sender.omitKnifePairedPan());}
 {Fixture f;install();UITouch t;physical(f,t);f.action(UIGestureRecognizerStateBegan);auto serial=f.sender.pencil_knife_pan_origin.serial;f.sender.reset();assert(!f.sender.omitKnifePairedPan()&&!f.sender.knife_pan_recognized&&!f.sender.pencil_knife_pan_origin.valid());
  f.sender.touchesBegan({&t});assert(f.sender.pencil_knife_pan_origin.serial>serial&&!f.sender.omitKnifePairedPan());f.sender.forgetKnifePanContact();assert(!f.sender.pencil_knife_pan_origin.valid());}
 for(int priority=0;priority<2;++priority){Fixture f;install();UITouch t;f.expire();f.sender.contact={};f.sender.reset();
  if(priority==0){ghost::ios::PencilRingPresentation p;p.lifetime=1;p.generation=1;p.bounds={0,0,700,700};assert(ghost::ios::publish_pencil_ring(window,p));}
  else ghost::ios::set_navigation_regions(window,{{0,0,700,700,ghost::ios::PointerCaptureKind::Navigation,false,77}});
  f.sender.touchesBegan({&t});assert(callbacks==0&&!f.sender.pencil_knife_pan_origin.valid());}
 std::cout<<"PASS physical actor/origin/finite/view/ring/HUD, pre-super capture, extra-contact frozen decision, Changed no-query, reset/invalidate/fresh serial\n";
}
void priority_cases(){for(int kind=0;kind<5;++kind){Fixture f;install();UITouch t;physical(f,t);int calls=callbacks;
 if(kind==0)mouse_left_pressed=true;else if(kind==1)f.sender.ring.captured=true;
 else if(kind==2)ghost::ios::set_navigation_regions(window,{{0,0,700,700,ghost::ios::PointerCaptureKind::Navigation}});
 else if(kind==3)ghost::ios::set_navigation_regions(window,{{0,0,700,700,ghost::ios::PointerCaptureKind::WorkspaceResize}});
 else ghost::ios::set_navigation_regions(window,{{0,0,700,700,ghost::ios::PointerCaptureKind::ToolManipulation}});
 f.action(UIGestureRecognizerStateBegan);assert(callbacks==calls&&!f.sender.knife_pan_recognized);}
 movement();for(int state:{3,4,5})for(int mode:{1,2,4,8})terminal(state,mode,false);
 untagged_and_finger();native_navigation();early_routes();
 std::cout<<"PASS retained paint/native terminal/Finger/hardware/ring/HUD/tool/resize/navigation/trackpad/pinch routes\n";
}
void ctrl_failure(bool historical,bool require_corrected=false){Fixture f;install();native_stamp.intent=ghost::ios::PencilKnifePanIntent::Live;native_stamp.tool_ref=0;native_modifier=1;UITouch t;physical(f,t);
 act(f,historical,UIGestureRecognizerStateBegan,{110,100},{10,0});system_owner.clear();act(f,historical,UIGestureRecognizerStateChanged,{115,103},{15,3});
 assert(system_owner.queue.size()==size_t(historical?2:1));f.transfer();
 auto initial=audit_rv.dist;wmOperator op;PointerRNA ptr;op.ptr=&ptr;int pans=0;
 for(auto&ev:wm_queue)if(ev.type==MOUSEPAN){++pans;assert(knife_unmapped_branch(&ev)==OPERATOR_PASS_THROUGH);assert(viewzoom_invoke(&f.C,&op,&ev)==OPERATOR_FINISHED);}
 if(historical){assert(pans==1&&std::fabs(audit_rv.dist-10.197f)<.0001f);std::cout<<"OLD_CTRL_KNIFE_PAN_ZOOM "<<initial<<" -> "<<audit_rv.dist<<"\n";}
 if(require_corrected)assert(pans==0);
 if(!historical){assert(pans==0&&audit_rv.dist==initial);std::cout<<"PASS admitted Ctrl Knife PAN absent; native zoom reachability removed\n";}
}
void native_controls(){for(bool baseline:{false,true}){Fixture f;install();native_safe=false;UITouch t;physical(f,t);
 act(f,baseline,UIGestureRecognizerStateBegan,{110,100},{10,0});system_owner.clear();
 act(f,baseline,UIGestureRecognizerStateChanged,{115,120},{15,20});assert(system_owner.queue.size()==2);
 auto*d=static_cast<GHOST_TEventTrackpadData*>(system_owner.queue[0]->data_);assert(d->deltaX==5&&d->deltaY==20&&d->numFingers==1);parity::consume(d->deltaY);
 assert(system_owner.queue[1]->type==GHOST_kEventCursorMove&&!f.sender.omitKnifePairedPan());}}
int main(int argc,char**argv){assert(argc==2);assert(ghost::ios::pencil_knife_pan_probe==nullptr);std::string test=argv[1];
 if(test=="packets")exact_packets();else if(test=="gates")gate_cases();else if(test=="physical")physical_cases();else if(test=="priority")priority_cases();else if(test=="native-controls")native_controls();else if(test=="old-must-fail")ctrl_failure(true,true);else if(test=="old-ctrl")ctrl_failure(true);else if(test=="new-ctrl")ctrl_failure(false);else assert(false);
 system_owner.clear();std::cout<<"PASS "<<test<<"\n";return 0;}
