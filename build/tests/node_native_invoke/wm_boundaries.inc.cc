/* Allocator/lifecycle boundaries are observable and do not implement the guard. */
static intptr_t wm_operator_undo_active_id(wmWindowManager*){++counts.ids;return 1;}
static intptr_t wm_operator_register_active_id(wmWindowManager*){++counts.ids;return 2;}
static wmOperator*wm_operator_create(wmWindowManager*,wmOperatorType*ot,PointerRNA*p,ReportList*r){
 ++counts.create;auto*op=new wmOperator{};op->type=ot;op->idname=ot->idname;
 op->ptr=new PointerRNA(p?*p:PointerRNA{});scalar_values[op->ptr]=p?scalar_values[p]:ScalarProperties{};
 op->reports=r?r:new ReportList{};last_op=op;return op;}
static void WM_operator_free(wmOperator*op){++counts.operator_free;scalar_values.erase(op->ptr);delete op->ptr;delete op->reports;delete op;if(last_op==op)last_op=nullptr;}
static void wm_operator_reports(bContext*,wmOperator*,wmOperatorStatus,bool){++counts.reports;}
static void wm_operator_finished(bContext*,wmOperator*op,bool,bool,bool,bool){++counts.finished;WM_operator_free(op);}
static void WM_operator_last_properties_init(wmOperator*){++counts.last_init;}
static void wm_region_mouse_co(bContext*,wmEvent*){++counts.region_co;}
static void WM_cursor_grab_enable(wmWindow*,int,const rcti*,bool){++counts.cursor;}
static void wm_event_handler_ui_cancel(bContext*){++counts.ui_cancel;}
