"""Execute connected View draw/capture/dispatch; native lists/RNA are boundaries.

This does not execute target modal/GPU/UIKit or establish iPad acceptance.
"""
import ast
import types
import unittest
from test_touch_extrude import changed_source
from test_pencil_callback_disposal import definition
import test_ipad_panels

HANDLERS=changed_source('source/blender/editors/interface/interface_handlers.cc')
PYTHON=changed_source('scripts/startup/bl_ui/space_view3d_ipad.py')
PRELUDE=r"""
#include <cassert>
#include <cstdint>
#include <cstring>
#include <map>
#include <string>
#define STREQ(a,b) (std::strcmp(a,b)==0)
template<typename T,typename... V> bool elem(T a,V... v){return ((a==v)||...);}
#define ELEM(a,...) elem(a,__VA_ARGS__)
inline constexpr int RV3D_CAMOB=2,RV3D_LOCK_ROTATION=1,RV3D_BOXVIEW=2,RV3D_LOCK_LOCATION=8,RV3D_LOCK_ZOOM_AND_DOLLY=16;
inline constexpr int RV3D_LOCK_ANY_TRANSFORM=25,RV3D_VIEW_TOP=5,RV3D_VIEW_FRONT=1,RV3D_VIEW_RIGHT=4;
#define RV3D_LOCK_FLAGS(r) ((r)->viewlock|(r)->runtime_viewlock)
struct RegionView3D{int persp=1,viewlock=0,runtime_viewlock=0;void *sms=nullptr,*smooth_timer=nullptr;};
struct ARegion{void *regiondata;};struct View3D{};
struct bContext{bool valid=true,redirect=false;ARegion *region;View3D *view;};
bool UI_ipad_context_capture(bContext *C,uint64_t*){return C&&C->valid;}
ARegion *CTX_wm_region(bContext *C){return C->region;}
View3D *CTX_wm_view3d(bContext *C){return C->view;}
bool ED_view3d_context_user_region(bContext *C,View3D **view,ARegion **region){*view=C->view;*region=C->redirect?nullptr:C->region;return true;}
struct Origin{bool owned=true,corner=false;bool present()const{return owned;}};
struct uiBlock{Origin ipad_action_origin;uint64_t ipad_view_region_data=999;};
bool ui_ipad_action_origin_valid(bContext *C,const Origin&){return C&&C->valid;}
void *CTX_wm_area(bContext*){return nullptr;}
bool rebind_enabled=true;int rebinds=0,restores=0;
bool ui_ipad_action_origin_rebind(bContext*,const Origin&){++rebinds;return rebind_enabled;}
void ui_ipad_action_context_restore(bContext*,uintptr_t,uintptr_t){++restores;}
namespace blender::wm{enum class OpCallContext{ExecRegionWin,InvokeRegionWin,ExecDefault};}
struct uiAfterFunc{Origin ipad_action_origin;bool ipad_view_guarded=true;uint64_t ipad_view_region_data=0;blender::wm::OpCallContext opcontext=blender::wm::OpCallContext::ExecRegionWin;};
struct wmOperatorType{const char *idname;int flag=0;void *exec=reinterpret_cast<void*>(1),*invoke=nullptr,*srna=reinterpret_cast<void*>(2);};
inline constexpr int PROP_BOOLEAN=1,PROP_ENUM=2;
struct PropertyRNA{int type=PROP_BOOLEAN,array=0,value=0;bool explicit_value=true;};
struct PointerRNA{void *type=reinterpret_cast<void*>(2),*data=reinterpret_cast<void*>(3);std::map<std::string,PropertyRNA> props;};
PropertyRNA *RNA_struct_find_property(PointerRNA *p,const char *name){auto i=p->props.find(name);return i==p->props.end()?nullptr:&i->second;}
int RNA_property_type(PropertyRNA *p){return p->type;}
int RNA_property_array_length(PointerRNA*,PropertyRNA *p){return p->array;}
bool RNA_struct_property_is_set(PointerRNA *p,const char *name){return p->props.at(name).explicit_value;}
RegionView3D *mutated=nullptr;int reads=0,mutate_at=0;
int RNA_property_boolean_get(PointerRNA*,PropertyRNA *p){if(++reads==mutate_at&&mutated)mutated->persp=RV3D_CAMOB;return p->value;}
int RNA_property_enum_get(PointerRNA*,PropertyRNA *p){return p->value;}
"""

class PencilViewTests(unittest.TestCase):
    def test_live_mask_respects_actual_and_runtime_locks_camera_timers_and_redirect(self):
        functions='\n'.join(definition(HANDLERS,s) for s in (
            'int UI_ipad_view_navigation_mask(', 'int UI_ipad_view_navigation_layout_mask('))
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(PRELUDE+functions+r"""
int main(){RegionView3D view;ARegion region{&view};View3D space;bContext C{true,false,&region,&space};uint64_t identity=0;
 assert(UI_ipad_view_navigation_mask(&C,&identity)==7);assert(identity==uint64_t(reinterpret_cast<uintptr_t>(&view)));
 for(int i=0;i<10000;++i){for(int native:{0,1,2,8,16,25})for(int runtime:{0,1,2,8,16,25}){
  view.viewlock=native;view.runtime_viewlock=runtime;int flags=native|runtime;
  int expected=(flags&2)?0:((flags&24)?0:1)|((flags&1)?0:2)|((flags&25)?0:4);
  identity=999;assert(UI_ipad_view_navigation_mask(&C,&identity)==expected);
  if(!expected)assert(identity==0);
 }}
 view.viewlock=view.runtime_viewlock=0;
 C.redirect=true;assert(UI_ipad_view_navigation_mask(&C,&identity)==1);C.redirect=false;
 for(int kind=0;kind<3;++kind){view.persp=kind==0?RV3D_CAMOB:1;view.sms=kind==1?&view:nullptr;view.smooth_timer=kind==2?&view:nullptr;
  identity=999;assert(UI_ipad_view_navigation_mask(&C,&identity)==0&&identity==0);}
 view.persp=1;view.sms=view.smooth_timer=nullptr;uiBlock block;
 assert(UI_ipad_view_navigation_layout_mask(&C,&block)==7&&block.ipad_view_region_data==uint64_t(reinterpret_cast<uintptr_t>(&view)));
 C.valid=false;assert(UI_ipad_view_navigation_layout_mask(&C,&block)==0&&block.ipad_view_region_data==0);
 C.valid=true;region.regiondata=nullptr;block.ipad_view_region_data=999;
 assert(UI_ipad_view_navigation_layout_mask(&C,&block)==0&&block.ipad_view_region_data==0);
}
""")

    def test_exact_dispatch_refuses_state_owner_context_type_and_property_changes(self):
        functions='\n'.join(definition(HANDLERS,s) for s in (
            'int UI_ipad_view_navigation_mask(', 'static int ui_ipad_view_action_bit(',
            'static bool ui_ipad_view_dispatch_allowed('))
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(PRELUDE+functions+r"""
int main(){RegionView3D view,other;ARegion region{&view};View3D space;bContext C{true,false,&region,&space};
 uiAfterFunc after;after.ipad_view_region_data=uint64_t(reinterpret_cast<uintptr_t>(&view));
 wmOperatorType all{"VIEW3D_OT_view_all"},selected{"VIEW3D_OT_view_selected"},axis{"VIEW3D_OT_view_axis"},projection{"VIEW3D_OT_view_persportho"};
 PointerRNA frame;frame.props={{"use_all_regions",{}},{"center",{}}};
 assert(ui_ipad_view_dispatch_allowed(&C,after,&all,&frame));
 assert(ui_ipad_view_dispatch_allowed(&C,after,&selected,&frame));
 assert(ui_ipad_view_dispatch_allowed(&C,after,&projection,nullptr));
 PointerRNA axes;axes.props={{"type",{PROP_ENUM,0,5,true}},{"relative",{}},{"align_active",{}}};
 for(int value:{1,4,5}){axes.props["type"].value=value;assert(ui_ipad_view_dispatch_allowed(&C,after,&axis,&axes));}
 for(int value:{0,2,3,6,8}){axes.props["type"].value=value;assert(!ui_ipad_view_dispatch_allowed(&C,after,&axis,&axes));}
 axes.props["type"].value=5;
 for(auto name:{"use_all_regions","center"}){auto &p=frame.props[name];p.value=1;assert(!ui_ipad_view_dispatch_allowed(&C,after,&all,&frame));p.value=0;
  p.explicit_value=false;assert(!ui_ipad_view_dispatch_allowed(&C,after,&all,&frame));p.explicit_value=true;
  p.array=1;assert(!ui_ipad_view_dispatch_allowed(&C,after,&all,&frame));p.array=0;}
 for(auto name:{"relative","align_active"}){auto &p=axes.props[name];p.value=1;assert(!ui_ipad_view_dispatch_allowed(&C,after,&axis,&axes));p.value=0;}
 assert(!ui_ipad_view_dispatch_allowed(&C,after,&axis,nullptr));
 frame.type=nullptr;assert(!ui_ipad_view_dispatch_allowed(&C,after,&all,&frame));frame.type=all.srna;
 for(int i=0;i<10000;++i){region.regiondata=&other;assert(!ui_ipad_view_dispatch_allowed(&C,after,&projection,nullptr));region.regiondata=&view;
  view.persp=RV3D_CAMOB;assert(!ui_ipad_view_dispatch_allowed(&C,after,&projection,nullptr));view.persp=1;
  C.redirect=true;assert(!ui_ipad_view_dispatch_allowed(&C,after,&axis,&axes));C.redirect=false;}
 for(auto context:{blender::wm::OpCallContext::InvokeRegionWin,blender::wm::OpCallContext::ExecDefault}){after.opcontext=context;assert(!ui_ipad_view_dispatch_allowed(&C,after,&all,&frame));}
 after.opcontext=blender::wm::OpCallContext::ExecRegionWin;
 all.flag=1;assert(!ui_ipad_view_dispatch_allowed(&C,after,&all,&frame));all.flag=0;
 all.invoke=&view;assert(!ui_ipad_view_dispatch_allowed(&C,after,&all,&frame));all.invoke=nullptr;
 all.exec=nullptr;assert(!ui_ipad_view_dispatch_allowed(&C,after,&all,&frame));all.exec=&view;
 mutated=&view;reads=0;mutate_at=2;assert(!ui_ipad_view_dispatch_allowed(&C,after,&all,&frame));view.persp=1;mutate_at=0;
 after.ipad_action_origin.owned=false;C.valid=false;assert(ui_ipad_view_dispatch_allowed(&C,after,reinterpret_cast<wmOperatorType*>(1),nullptr));
}
""")
        producer=definition(HANDLERS,'static void ui_apply_but_func(')
        self.assertIn('after->ipad_view_region_data = block->ipad_view_region_data',producer)
        self.assertLess(producer.index('after->ipad_view_region_data ='),producer.index('but->optype = nullptr'))
        dispatch=definition(HANDLERS,'static void ui_apply_but_funcs_after(')
        self.assertLess(dispatch.index('ui_ipad_operator_resolve(after.ipad_operator)'),dispatch.index('ui_ipad_view_dispatch_allowed('))
        self.assertLess(dispatch.index('ui_ipad_view_dispatch_allowed('),dispatch.index('WM_operator_name_call_ptr('))
        self.assertLess(dispatch.index('ui_ipad_view_dispatch_allowed('),dispatch.index('WM_operator_name_call_ptr_with_depends_on_cursor('))

    def test_actual_python_menu_properties_context_disabled_state_and_base_return(self):
        records=[]
        class Layout:
            def __init__(self,parent=None): self.parent=parent;self.enabled=True;self.operator_context=None
            def column(self):return Layout(self)
            def row(self):return Layout(self)
            def ipad_view_navigation_mask(self):return mask
            def operator(self,name,**kwargs):
                chain=[];p=self
                while p:chain.append(p);p=p.parent
                context=next((p.operator_context for p in chain if p.operator_context),None)
                props=types.SimpleNamespace()
                records.append((name,kwargs,props,all(p.enabled for p in chain),context));return props
        tree=ast.parse(PYTHON);nodes=[n for n in tree.body if getattr(n,'name','') in {'VIEW3D_MT_ipad_view_ring','ipad_base_return'}]
        ns={'Menu':object};exec(compile(ast.Module(body=nodes,type_ignores=[]),'actual-view.py','exec'),ns)
        context=types.SimpleNamespace(region_data=types.SimpleNamespace(view_perspective='PERSP'))
        for mask in range(8):
            records.clear();ns['VIEW3D_MT_ipad_view_ring'].draw(types.SimpleNamespace(layout=Layout()),context)
            self.assertEqual(len(records),7)
            for index in range(6):
                self.assertEqual(records[index][4],'EXEC_REGION_WIN')
                self.assertEqual(records[index][3],bool(mask & (1 if index<2 else 2 if index<5 else 4)))
            self.assertEqual(vars(records[0][2]),{'use_all_regions':False})
            self.assertEqual(vars(records[1][2]),{'use_all_regions':False,'center':False})
            for index,value,icon in ((2,'TOP','TRIA_UP'),(3,'FRONT','NONE'),(4,'RIGHT','TRIA_RIGHT')):
                self.assertEqual(vars(records[index][2]),{'type':value,'align_active':False,'relative':False})
                self.assertEqual(records[index][1]['icon'],icon)
            self.assertEqual(records[5][1]['text'],'Orthographic')
            self.assertEqual(records[6][2].name,'VIEW3D_MT_ipad_base_ring')
            self.assertEqual(records[6][4],'INVOKE_REGION_WIN')
        context.region_data.view_perspective='ORTHO';records.clear()
        ns['VIEW3D_MT_ipad_view_ring'].draw(types.SimpleNamespace(layout=Layout()),context)
        self.assertEqual(records[5][1]['text'],'Perspective')

    def test_context_rna_return_contract_and_native_radial_classification(self):
        rna=changed_source('source/blender/makesrna/intern/rna_ui_api.cc')
        body=definition(rna,'static int rna_uiLayout_ipad_view_navigation_mask(')
        self.assertIn('uiLayout *layout, bContext *C',body)
        self.assertIn('UI_ipad_view_navigation_layout_mask(C, layout->block())',body)
        registration=rna[rna.index('func = RNA_def_function(srna, "ipad_view_navigation_mask"'):]
        registration=registration[:registration.index('/* radial/pie layout */')]
        self.assertIn('RNA_def_function_flag(func, FUNC_USE_CONTEXT);',registration)
        self.assertNotIn('FUNC_NO_SELF',registration)
        self.assertIn('RNA_def_function_return(func, parm)',registration)
        self.assertEqual(registration.count('RNA_def_int('),1)
        header=changed_source('source/blender/editors/interface/interface_ipad_tool_ring.hh')
        self.assertIn('"VIEW3D_MT_ipad_view_ring") == 0) return RingKind::View',header)
        self.assertIn('kind == RingKind::View',definition(header,'inline bool ring_uses_pages('))
        self.assertNotIn('RingKind::View',definition(header,'inline bool ring_setting_stays_open('))
        # Never relax owned field admission to make this context-only API work.
        field=definition(changed_source('source/blender/editors/interface/interface.cc'),'bool UI_ipad_rna_prepare(')
        self.assertIn('if (!ptr || !prop) return false;',field)

if __name__=='__main__':unittest.main()
