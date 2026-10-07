"""Run shipped Numbers arithmetic with the exact pinned native parser.

Allocator/vector and unit normalization are fixture APIs; not target modal proof.
"""
from pathlib import Path
import re
import unittest
from test_touch_extrude import changed_source
from test_pencil_callback_disposal import definition
import test_ipad_panels

SOURCE=changed_source('source/blender/editors/interface/interface.cc')
HANDLERS=changed_source('source/blender/editors/interface/interface_handlers.cc')
FIXTURES=Path(__file__).parent/'fixtures'
WORLD=r'''
#include <cassert>
#include <algorithm>
#include <vector>
#include <string>
#include <cstdlib>
#include <cmath>
#include <cstring>
#ifdef _WIN32
#include <malloc.h>
#define alloca _alloca
#else
#include <alloca.h>
#endif
#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif
#define BLI_array_alloca(a,n) static_cast<double *>(alloca(sizeof(double)*(n)))
#define BLI_assert(x) assert(x)
#define BLI_assert_msg(x,msg) assert(x)
#define STREQ(a,b) (std::strcmp(a,b)==0)
#define CLAMP_MIN(a,b) ((a)=std::max((a),(b)))
#define CLAMP_MAX(a,b) ((a)=std::min((a),(b)))
#define CLAMP(a,b,c) ((a)=std::max((b),std::min((a),(c))))
template<class T,class... U>bool elem(const T &v,const U &... u){return ((v==u)||...);}
#define ELEM(...) elem(__VA_ARGS__)
int allocations=0;
template<class T>T *MEM_new(const char *){++allocations;return new T{};}
template<class T>void MEM_delete(T *p){if(p){--allocations;delete p;}}
namespace blender{template<class T>struct Vector:std::vector<T>{
 using std::vector<T>::vector;int size()const{return int(std::vector<T>::size());}
 void append(T value){this->push_back(value);}T &last(){return this->back();}
 T *begin(){return this->data();}T *end(){return this->data()+this->size();}
 void clear_and_shrink(){this->clear();this->shrink_to_fit();}
};}
struct UnitSettings{int system=1;double scale=2,preferred=100;};
double BKE_unit_value_scale(const UnitSettings &u,int,double){return u.scale;}
bool BKE_unit_string_contains_unit(const char *s,int){return std::strstr(s,"cm")!=nullptr;}
bool BKE_unit_replace_string(char *out,int,const char *,double scale,int,int){std::string s=out;s.replace(s.find("cm"),2,"*0.01");s+="/"+std::to_string(scale);std::memcpy(out,s.c_str(),s.size()+1);return true;}
double BKE_unit_apply_preferred_unit(const UnitSettings &u,int,double v){return v*u.preferred;}
#define STRNCPY_UTF8(a,b) std::memcpy(a,b,std::strlen(b)+1)
'''

class PencilNumbersExpressionTests(unittest.TestCase):
    def test_native_arithmetic_refuses_python_nonfinite_and_releases_every_parse(self):
        header=(FIXTURES/'pinned_expr_pylike_eval.h').read_text(encoding='utf-8').replace('#pragma once','')
        parser=(FIXTURES/'pinned_expr_pylike_eval.cc').read_text(encoding='utf-8')
        parser=re.sub(r'^#include "[^"]+"\s*$', '', parser, flags=re.M)
        # Upstream deliberately initializes the remainder of two aggregates
        # to zero. Limit this warning exception to that unchanged pinned body.
        parser='#pragma GCC diagnostic push\n#pragma GCC diagnostic ignored "-Wmissing-field-initializers"\n'+parser+'\n#pragma GCC diagnostic pop\n'
        native=definition(SOURCE,'static bool ui_ipad_numbers_eval_native(')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(WORLD+header+parser+native+r'''
int main(){double value=99;for(int i=0;i<10000;++i){
 assert(ui_ipad_numbers_eval_native("2*(3+4)",nullptr,0,&value)&&value==14);
 assert(ui_ipad_numbers_eval_native("sin(pi/2)",nullptr,0,&value)&&std::abs(value-1)<1e-12);
 assert(allocations==0);
}
 for(const char *s:{"__import__('bpy').ops.wm.read_homefile()","bpy.context.scene","1/0","sqrt(-1)","1e309","#frame","1,2","(2+"}){
  value=99;assert(!ui_ipad_numbers_eval_native(s,nullptr,0,&value)&&value==99&&allocations==0);
 }
 std::string long_input(256,'1');assert(!ui_ipad_numbers_eval_native(long_input.c_str(),nullptr,0,&value));
 assert(ui_ipad_numbers_eval_native("",nullptr,0,&value)&&value==0);
 UnitSettings unit;assert(ui_ipad_numbers_eval_native("2",&unit,1,&value)&&value==100);
 assert(ui_ipad_numbers_eval_native("20cm",&unit,1,&value)&&std::abs(value-0.1)<1e-12);
 unit.scale=0;assert(!ui_ipad_numbers_eval_native("2",&unit,1,&value)&&allocations==0);
}
''')
        actual=definition(SOURCE,'bool ui_but_string_eval_number(')
        branch=actual.split('but->block->ipad_action_origin.present()',1)[1].split('  if (str[0]',1)[0]
        for text in ('unit = *but->block->unit;', 'ui_ipad_rna_main_member', 'ui_ipad_numbers_eval_native'):
            self.assertIn(text,branch)
        self.assertNotIn('but->block->unit != &scene->unit',branch)
        self.assertNotIn('BPY_',branch)
        # Execute the actual owned branch with the native block-owned unit
        # copy living at a different address from the originating Scene.
        admission=actual[:actual.index("  if (str[0]")]+"  return false;\n}\n"
        ui=r'''
enum class uiIPadRNAOwner{PopupProperties};struct Receipt{uiIPadRNAOwner owner=uiIPadRNAOwner::PopupProperties;};
struct ID{};struct Scene{UnitSettings unit;};struct bContext{Scene *scene=nullptr;bool live=true;};
struct Origin{bool present()const{return true;}};
struct uiBlock{UnitSettings *unit=nullptr;Origin ipad_action_origin;};struct uiBut{uiBlock *block=nullptr;Receipt ipad_rna_receipt;};
bool ui_ipad_numbers_but_rebind(uiBut *){return true;}bool ui_but_is_unit(const uiBut *){return true;}
Scene *CTX_data_scene(bContext *C){return C->scene;}bool ui_ipad_rna_main_member(bContext *C,ID *id){return C->live&&id==reinterpret_cast<ID *>(C->scene);}
int UI_but_unit_type_get(const uiBut *){return 1;}int *CTX_wm_reports(bContext *){return nullptr;}
constexpr int RPT_ERROR=1;void BKE_report(int *,int,const char *){}
#define RNA_SUBTYPE_UNIT_VALUE(v) (v)
'''
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(WORLD+header+parser+native+ui+admission+r'''
int main(){Scene scene;UnitSettings presented=scene.unit;presented.preferred=10;uiBlock block{&presented,{}};uiBut but{&block,{}};bContext C{&scene,true};double value=99;
 assert(&presented!=&scene.unit);assert(ui_but_string_eval_number(&C,&but,"2",&value)&&value==10);
 C.live=false;assert(!ui_but_string_eval_number(&C,&but,"2",&value));C.live=true;
 block.unit=nullptr;assert(!ui_but_string_eval_number(&C,&but,"2",&value)&&allocations==0);
}
''')
        setter=definition(SOURCE,'bool ui_but_string_set(')
        self.assertIn('!but->block->ipad_action_origin.present() &&',setter)
        self.assertIn('if (but->block->ipad_action_origin.present()) return false;',setter)

    def test_array_paste_accepts_complete_finite_values_only(self):
        parse=definition(HANDLERS,'static bool ui_ipad_numbers_parse_array(')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source('#include <cctype>\n'+WORLD+parse+r'''
int main(){float values[3];for(int i=0;i<10000;++i){assert(ui_ipad_numbers_parse_array(" [ 1, -2.5, 3e2 ] ",values,3));assert(values[0]==1&&values[1]==-2.5f&&values[2]==300);}
 for(const char *s:{"[nan,2,3]","[inf,2,3]","[1e309,2,3]","[1e99,2,3]","[1,2,3] junk","[1,2]","[1,2,3,4]","", "1,2,3"})assert(!ui_ipad_numbers_parse_array(s,values,3));
 assert(!ui_ipad_numbers_parse_array("[1]",values,0));
}
''')
        paste=definition(HANDLERS,'static void ui_but_paste_numeric_array(')
        self.assertIn('but->block->ipad_action_origin.present() ?',paste)
        self.assertLess(paste.index('ui_ipad_numbers_parse_array'),paste.index('ui_but_set_float_array'))

if __name__=='__main__':unittest.main()
