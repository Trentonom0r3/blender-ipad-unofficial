static int live_control_cases(){int n=0;
 /* Actual Circle SIZE applies before cursor move and immediate release. The
  * selection exec boundary reports IDs so an event-reorder regression is visible. */
 for(int delta:{20,-20}){
  Fixture f;PointerRNA ptr;wmOperatorType ot;ot.exec=circle_select_exec;
  wmOperator op;op.ptr=&ptr;op.type=&ot;auto*g=new wmGesture{};
  auto*rect=new rcti{};rect->xmin=0;rect->ymin=0;rect->xmax=10;
  g->customdata=rect;op.customdata=g;selected_ids.clear();circle_execs=0;circle_ends=0;
  circle_points={{20,0},{23,0},{25,0},{29,0},{35,0},{37,0}};
  wmEvent pan;pan.type=EVT_MODAL_MAP;pan.val=GESTURE_MODAL_CIRCLE_SIZE;
  pan.prev_xy[1]=0;pan.xy[1]=delta;pan.flag=WM_EVENT_IS_PENCIL_PRECISION_PAN;
  assert(WM_gesture_circle_modal(&f.C,&op,&pan)==OPERATOR_RUNNING_MODAL);
  assert(RNA_int_get(&ptr,"radius")== (delta>0?16:4));assert(circle_execs==0);
  wmEvent cursor=pan;cursor.type=MOUSEMOVE;cursor.xy[0]=20;cursor.xy[1]=0;
  assert(WM_gesture_circle_modal(&f.C,&op,&cursor)==OPERATOR_RUNNING_MODAL);
  const std::vector<int>expected=delta>0?std::vector<int>{0,1,2,3,4}:std::vector<int>{0,1};
  assert(selected_ids==expected);assert(circle_execs==1);
  wmEvent release=cursor;release.type=EVT_MODAL_MAP;release.val=GESTURE_MODAL_NOP;
  assert(WM_gesture_circle_modal(&f.C,&op,&release)==OPERATOR_FINISHED);
  assert(!op.customdata&&circle_ends==1&&selected_ids==expected);++n;
 }
 /* Actual Transform radius branch and complete native falloff calculation;
  * coordinate application is a visible geometry boundary. */
 for(int delta:{20,-20}){
  TransData data[3];data[0].flag=TD_SELECTED;data[1].rdist=5;data[2].rdist=10.5f;
  TransDataContainer tc;tc.data=data;tc.data_len=3;TransInfo t;t.containers={&tc};
  wmEvent pan;pan.type=MOUSEPAN;pan.val=TFM_MODAL_PROPSIZE;pan.xy[1]=delta;pan.prev_xy[1]=0;
  transform_propsize(&t,&pan);const float radius=delta>0?11.f:9.f;
  assert(std::fabs(t.prop_size-radius)<.00001f);assert(t.redraw&TREDRAW_HARD);
  assert(data[0].factor==1);assert(std::fabs(data[1].factor-(radius-5)/radius)<.00001f);
  assert((data[2].factor>0)==(delta>0));
  for(auto&td:data)td.loc=td.initial+10*td.factor;
  assert(data[0].loc==10);assert((data[2].loc>0)==(delta>0));++n;
 }
 return n;
}
