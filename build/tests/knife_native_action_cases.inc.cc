/* SPDX-License-Identifier: GPL-2.0-or-later
 * Host instrumentation only; actual Knife modal/helper bodies come from declared source.
 * Geometry, allocator disposal, matrices, hits and numeric evaluation are modeled. */
int scenarios=0;
void reset(){calls={};exit_region=nullptr;mats_region=nullptr;}
struct Fixture{
 bContext C;Scene scene;ViewLayer layer;View3D v3d;ARegion original,other;RegionView3D rv3d;Object object;
 KnifeTool_OpData data;wmOperatorType type;wmOperator op;wmEvent input;
 Fixture(){data.vc={&scene,&layer,&v3d,&original,&rv3d,&object};data.region=&other;data.objects={&object};
 type.invoke=knifetool_invoke;type.modal=knifetool_modal;type.cancel=knifetool_cancel;op.type=&type;op.customdata=&data;
 input.type=999;input.val=KM_PRESS;input.prev_type=887;input.prev_val=8;input.xy[0]=301;input.xy[1]=502;input.mval[0]=-19;input.mval[1]=62;
 input.modifier=0;input.flag=0x7fffffff;input.customdata=reinterpret_cast<void*>(uintptr_t(0x12345));input.utf8_buf[0]='8';input.utf8_buf[1]='\0';}
};
int main(){
 {Fixture f;reset();assert(ED_mesh_knife_modal_type(&f.type));assert(!ED_mesh_knife_modal_type(nullptr));
  wmOperatorType fake=f.type;fake.invoke=foreign_invoke;assert(!ED_mesh_knife_modal_type(&fake));fake=f.type;fake.modal=foreign_modal;assert(!ED_mesh_knife_modal_type(&fake));fake=f.type;fake.cancel=foreign_cancel;assert(!ED_mesh_knife_modal_type(&fake));fake=f.type;fake.flag=OPTYPE_MACRO;assert(!ED_mesh_knife_modal_type(&fake));fake=f.type;fake.macro.first=&fake;assert(!ED_mesh_knife_modal_type(&fake));assert(!calls.invoke&&!calls.exit);++scenarios;}
 {Fixture f;reset();MeshKnifeModalOrigin o;assert(ED_mesh_knife_modal_origin(&f.op,o));assert(o.scene==&f.scene&&o.view_layer==&f.layer&&o.v3d==&f.v3d&&o.region==&f.original&&o.rv3d==&f.rv3d&&o.object==&f.object);assert(o.region!=f.data.region);++scenarios;}
 {Fixture f;reset();MeshKnifeModalOrigin o{&f.scene,&f.layer,&f.v3d,&f.original,&f.rv3d,&f.object};assert(!ED_mesh_knife_modal_origin(nullptr,o));assert(!o.scene&&!o.region&&!o.object);
  f.op.opm=&f.op;f.op.customdata=reinterpret_cast<void*>(uintptr_t(1));assert(!ED_mesh_knife_modal_origin(&f.op,o));assert(!o.region);f.op.opm=nullptr;f.op.macro.first=&f.op;assert(!ED_mesh_knife_modal_origin(&f.op,o));assert(!o.region);f.op.macro.first=nullptr;wmOperatorType fake=f.type;fake.modal=foreign_modal;f.op.type=&fake;assert(!ED_mesh_knife_modal_origin(&f.op,o));assert(!o.region);f.op.type=&f.type;f.op.customdata=nullptr;assert(!ED_mesh_knife_modal_origin(&f.op,o));assert(!calls.exit&&!calls.invoke);++scenarios;}
 {Fixture f;reset();MeshKnifeModalOrigin o;f.data.vc.region=nullptr;assert(!ED_mesh_knife_modal_origin(&f.op,o));assert(!o.scene&&!o.region&&!o.object);++scenarios;}
 for(bool confirm:{false,true}){
  Fixture f;reset();auto *saved=f.op.customdata;
  assert(ED_mesh_knife_modal_action(nullptr,&f.op,&f.input,confirm)==OPERATOR_PASS_THROUGH);
  assert(ED_mesh_knife_modal_action(&f.C,nullptr,&f.input,confirm)==OPERATOR_PASS_THROUGH);
  assert(ED_mesh_knife_modal_action(&f.C,&f.op,nullptr,confirm)==OPERATOR_PASS_THROUGH);
  f.op.opm=&f.op;f.op.customdata=reinterpret_cast<void*>(uintptr_t(1));assert(ED_mesh_knife_modal_action(&f.C,&f.op,&f.input,confirm)==OPERATOR_PASS_THROUGH);f.op.opm=nullptr;
  f.op.macro.first=&f.op;assert(ED_mesh_knife_modal_action(&f.C,&f.op,&f.input,confirm)==OPERATOR_PASS_THROUGH);f.op.macro.first=nullptr;
  wmOperatorType fake=f.type;fake.modal=foreign_modal;f.op.type=&fake;assert(ED_mesh_knife_modal_action(&f.C,&f.op,&f.input,confirm)==OPERATOR_PASS_THROUGH);assert(f.op.customdata==reinterpret_cast<void*>(uintptr_t(1)));f.op.type=&f.type;
  f.op.customdata=nullptr;assert(ED_mesh_knife_modal_action(&f.C,&f.op,&f.input,confirm)==OPERATOR_PASS_THROUGH);f.op.customdata=saved;
  assert(!calls.finish&&!calls.exit&&!calls.redraw&&!calls.status&&!calls.init_mats&&!calls.invoke&&!calls.numeric);++scenarios;
 }
 {Fixture f;reset();f.data.totkvert=4;std::array<unsigned char,sizeof(wmEvent)> original;std::memcpy(original.data(),&f.input,sizeof f.input);
  assert(ED_mesh_knife_modal_action(&f.C,&f.op,&f.input,true)==OPERATOR_FINISHED);
  assert(calls.finish==1&&calls.exit==1&&calls.redraw==1&&calls.status==1&&calls.init_mats==1&&!calls.invoke&&!calls.numeric&&!calls.updates&&!calls.add_cut&&!calls.start_cut);
  assert(exit_region==&f.original&&mats_region==&f.rv3d&&!f.op.customdata);assert(std::memcmp(original.data(),&f.input,sizeof f.input)==0);++scenarios;
 }
 {Fixture f;reset();f.data.totkvert=0;assert(ED_mesh_knife_modal_action(&f.C,&f.op,&f.input,true)==OPERATOR_CANCELLED);assert(calls.finish==1&&calls.exit==1&&calls.status==1&&!calls.invoke&&!f.op.customdata);++scenarios;}
 {Fixture f;reset();f.data.totkvert=9;assert(ED_mesh_knife_modal_action(&f.C,&f.op,&f.input,false)==OPERATOR_CANCELLED);assert(!calls.finish&&calls.exit==1&&calls.status==1&&!calls.invoke&&!calls.updates&&!f.op.customdata);++scenarios;}
 {Fixture f;reset();f.data.totkvert=9;f.data.angle_snapping=true;f.data.num.active=true;assert(ED_mesh_knife_modal_action(&f.C,&f.op,&f.input,false)==OPERATOR_CANCELLED);assert(calls.numeric==1&&!calls.finish&&calls.exit==1&&!calls.updates&&!f.op.customdata);++scenarios;}
 {Fixture f;reset();f.data.totkvert=9;f.data.angle_snapping=true;f.data.num.active=true;
  wmEvent unsafe=f.input;unsafe.type=EVT_MODAL_MAP;unsafe.val=KNF_MODAL_CANCEL;assert(knifetool_modal(&f.C,&f.op,&unsafe)==OPERATOR_RUNNING_MODAL);assert(calls.numeric==1&&!calls.finish&&!calls.exit&&calls.updates==1&&f.op.customdata);++scenarios;}
 {Fixture f;reset();f.data.no_cuts=false;wmEvent stop{};stop.type=EVT_MODAL_MAP;stop.val=KNF_MODAL_NEW_CUT;assert(knifetool_modal(&f.C,&f.op,&stop)==OPERATOR_RUNNING_MODAL);assert(calls.finish_cut==1&&!calls.finish&&!calls.exit&&f.op.customdata);++scenarios;}
 {Fixture f;reset();f.data.no_cuts=false;f.data.is_drag_hold=true;f.data.mode=MODE_DRAGGING;wmEvent up{};up.type=EVT_MODAL_MAP;up.val=KNF_MODAL_ADD_CUT;up.prev_val=KM_RELEASE;assert(knifetool_modal(&f.C,&f.op,&up)==OPERATOR_RUNNING_MODAL);assert(!f.data.is_drag_hold&&!calls.finish&&!calls.exit&&f.op.customdata);++scenarios;}
 std::cout<<"PASS "<<scenarios<<" native-helper scenarios; full original Knife modal executes with explicit external/BKE/storage boundaries\n";
}
