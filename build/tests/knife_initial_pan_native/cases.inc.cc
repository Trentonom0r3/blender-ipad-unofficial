#include "public.hh"
#include "native-types.hh"
static_assert(std::is_same_v<decltype(&ED_view3d_native_zoom_type_is),bool(*)(const wmOperatorType*)>);
static_assert(std::is_same_v<decltype(&ED_mesh_knife_modal_navigation_may_be_denied),bool(*)(const wmOperator*)>);
static int checks=0;
#define CHECK(x) do{++checks;if(!(x)){std::cerr<<"CHECK line "<<__LINE__<<" failed\n";return 1;}}while(false)
static wmOperatorStatus foreign_exec(bContext*,wmOperator*){++native_callback_calls;return OPERATOR_FINISHED;}
static wmOperatorStatus foreign_invoke(bContext*,wmOperator*,const wmEvent*){++native_callback_calls;return OPERATOR_FINISHED;}
static wmOperatorStatus foreign_modal(bContext*,wmOperator*,const wmEvent*){++native_callback_calls;return OPERATOR_RUNNING_MODAL;}
static void foreign_cancel(bContext*,wmOperator*){++native_callback_calls;}
static bool foreign_poll(bContext*){++native_callback_calls;return true;}
static bool foreign_py_poll(bContext*,wmOperatorType*){++native_callback_calls;return true;}
static int foreign_extension(bContext*,PointerRNA*,FunctionRNA*,ParameterList*){++native_callback_calls;return 0;}
static void foreign_free(void*){++native_callback_calls;}
int main(){
 wmOperatorType *zoom,*knife;fixture_register_types(&zoom,&knife);
 CHECK(zoom&&knife&&zoom->srna&&knife->srna);
 CHECK(ED_view3d_native_zoom_type_is(zoom));CHECK(!ED_view3d_native_zoom_type_is(nullptr));
 CHECK(!ED_view3d_native_zoom_type_is(knife));
 CHECK(zoom->flag==(OPTYPE_BLOCKING|OPTYPE_GRAB_CURSOR_XY));
 CHECK(zoom->srna->properties.size()==4);
 CHECK(zoom->srna->properties[0]->name=="mx"&&zoom->srna->properties[1]->name=="my"&&zoom->srna->properties[2]->name=="delta"&&zoom->srna->properties[3]->name=="use_cursor_init");
 wmOperatorTypeMacro macro{};
 for(int field=0;field<13;++field){auto t=*zoom;
  switch(field){case 0:t.poll=foreign_poll;break;case 1:t.exec=foreign_exec;break;case 2:t.invoke=foreign_invoke;break;case 3:t.modal=foreign_modal;break;case 4:t.cancel=foreign_cancel;break;case 5:t.flag^=OPTYPE_UNDO;break;case 6:t.pyop_poll=foreign_py_poll;break;case 7:t.rna_ext.data=&t;break;case 8:t.rna_ext.srna=t.srna;break;case 9:t.rna_ext.call=foreign_extension;break;case 10:t.rna_ext.free=foreign_free;break;case 11:t.macro.first=&macro;t.macro.last=&macro;break;case 12:t.macro.last=&macro;break;}
  CHECK(!ED_view3d_native_zoom_type_is(&t));CHECK(native_callback_calls==0);
 }
 auto renamed=*zoom;renamed.idname="OTHER_OT_native_clone";CHECK(ED_view3d_native_zoom_type_is(&renamed));
 // The helper proves callback profile, not registry membership or chosen dispatch.
 Scene scene;ViewLayer layer;View3D view;ARegion region;RegionView3D rv;Object object;
 KnifeTool_OpData data;data.vc.scene=&scene;data.vc.view_layer=&layer;data.vc.v3d=&view;data.vc.region=&region;data.vc.rv3d=&rv;data.vc.obedit=&object;
 wmOperator op{};op.type=knife;op.customdata=&data;
 // Use only defined native enum values. A cast beyond this unfixed enum's
 // value range is undefined in C++17 and cannot prove corrupt-storage behavior.
 for(const auto mode : {MODE_IDLE,MODE_DRAGGING,MODE_CONNECT,MODE_PANNING}){data.mode=mode;CHECK(ED_mesh_knife_modal_navigation_may_be_denied(&op)==(mode!=MODE_PANNING));CHECK(native_callback_calls==0);}
 data.mode=MODE_IDLE;
 CHECK(!ED_mesh_knife_modal_navigation_may_be_denied(nullptr));
 auto test_origin=[&](){return ED_mesh_knife_modal_navigation_may_be_denied(&op);};
 data.vc.scene=nullptr;CHECK(!test_origin());data.vc.scene=&scene;
 data.vc.view_layer=nullptr;CHECK(!test_origin());data.vc.view_layer=&layer;
 data.vc.v3d=nullptr;CHECK(!test_origin());data.vc.v3d=&view;
 data.vc.region=nullptr;CHECK(!test_origin());data.vc.region=&region;
 data.vc.rv3d=nullptr;CHECK(!test_origin());data.vc.rv3d=&rv;
 data.vc.obedit=nullptr;CHECK(!test_origin());data.vc.obedit=&object;
 op.customdata=nullptr;CHECK(!test_origin());op.customdata=&data;
 op.type=nullptr;CHECK(!test_origin());op.type=knife;
 op.opm=&op;CHECK(!test_origin());op.opm=nullptr;
 op.macro.first=&op;CHECK(!test_origin());op.macro.first=nullptr;
 auto bad=*knife;bad.invoke=foreign_invoke;op.type=&bad;CHECK(!test_origin());
 bad=*knife;bad.modal=foreign_modal;CHECK(!test_origin());bad=*knife;bad.cancel=foreign_cancel;CHECK(!test_origin());
 bad=*knife;bad.macro.first=&macro;bad.macro.last=&macro;CHECK(!test_origin());
 bad=*knife;bad.flag|=OPTYPE_MACRO;CHECK(!test_origin());op.type=knife;
 CHECK(test_origin());CHECK(native_callback_calls==0);
 ScrArea area;area.spacedata.first=&view;region.regiondata=&rv;bContext C{};C.wm.area=&area;C.wm.region=&region;
 C.wm.operator_poll_msg_dyn_params.free_fn=fixture_dynamic_free;C.wm.operator_poll_msg_dyn_params.user_data=&C;
 dynamic_free_calls=python_member_calls=0;
 CHECK(fixture_zoom_poll(&C));CHECK(dynamic_free_calls==0&&python_member_calls==0);
 rv.viewlock=RV3D_LOCK_ZOOM_AND_DOLLY;CHECK(!fixture_zoom_poll(&C));CHECK(dynamic_free_calls==0);
 rv.viewlock=0;rv.runtime_viewlock=RV3D_LOCK_ZOOM_AND_DOLLY;CHECK(!fixture_zoom_poll(&C));CHECK(dynamic_free_calls==0);
 rv.runtime_viewlock=0;CHECK(fixture_zoom_poll(&C));CHECK(dynamic_free_calls==0);
 int eligible_dynamic_free_calls=dynamic_free_calls;
 C.wm.region=nullptr;CHECK(!fixture_zoom_poll(&C));CHECK(dynamic_free_calls==1);CHECK(C.wm.operator_poll_msg!=nullptr);
 CHECK(!C.wm.operator_poll_msg_dyn_params.free_fn&&!C.wm.operator_poll_msg_dyn_params.user_data);
 int missing_region_dynamic_free_calls=dynamic_free_calls;C.wm.region=&region;
 for(int missing=0;missing<3;++missing){auto save=C;auto save_area=area;auto save_region=region;
  if(missing==0)C.wm.area=nullptr;if(missing==1)area.spacetype=0;if(missing==2)region.regiondata=nullptr;
  CHECK(!fixture_zoom_poll(&C));C=save;area=save_area;region=save_region;
 }
 native_main_thread=false;CHECK(!fixture_zoom_poll(&C));native_main_thread=true;
 C.data.py_context=&C;python_member_calls=0;CHECK(fixture_zoom_poll(&C));
#ifdef WITH_PYTHON
 CHECK(python_member_calls==4);
#else
 CHECK(python_member_calls==0);
#endif
 C.data.py_context=nullptr;python_member_calls=0;CHECK(fixture_zoom_poll(&C));CHECK(python_member_calls==0);
 CHECK(native_callback_calls==0);
 std::cout<<"{\"status\":\"PASS\",\"assertions\":"<<checks<<",\"eligible_dynamic_free_calls\":"<<eligible_dynamic_free_calls<<",\"missing_region_dynamic_free_calls\":"<<missing_region_dynamic_free_calls<<",\"native_callback_calls\":"<<native_callback_calls<<"}\n";
}
