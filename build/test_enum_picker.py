"""Compile the exact native enum style/highlight helper against UI ownership mocks."""
from pathlib import Path
import unittest
import test_ipad_panels


class EnumPickerTests(unittest.TestCase):
    def test_styles_highlight_offsets_separators_and_empty_context(self):
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        name = 'source/blender/editors/interface/interface_layout.cc'
        section = patch.split(f'diff --git a/{name} b/{name}\n', 1)[1].split('diff --git ', 1)[0]
        source = ''.join(line[1:] if line.startswith((' ', '+')) else '\n' if line == '\n' else ''
                         for line in section.splitlines(True) if not line.startswith('+++'))
        start = source.index('static void ui_item_enum_expand_tabs(')
        helper = source[start:source.index('\n}\n', start) + 3]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(PREFIX + helper + CASES)


PREFIX = r'''
#include <algorithm>
#include <cassert>
#include <iostream>
#include <memory>
#include <optional>
#include <string>
#include <vector>
using StringRef = std::string;
enum class ButType {Tab, Row, Separator};
struct uiBut {ButType type=ButType::Row; int flag=0,drawflag=0;};
struct Buttons : std::vector<std::unique_ptr<uiBut>> {
 int size()const{return int(std::vector<std::unique_ptr<uiBut>>::size());}
};
struct uiBlock {Buttons buttons;};
struct uiLayout {};
struct bContext {int alignment_queries=0;};
struct PointerRNA {};
struct PropertyRNA {int count=3;};
constexpr int UI_BUT_HAS_QUICK_TOOLTIP=1,UI_BUT_INACTIVE=2,AREA_EDGE=4;
#define BLI_assert(condition) assert(condition)
#define SET_FLAG_FROM_TEST(value,test,flag) do{if(test)value|=flag;else value&=~flag;}while(false)
void UI_but_drawflag_enable(uiBut *button,int flag){button->drawflag|=flag;}
bContext *CTX_wm_region(bContext *C){return C;}
int ui_but_align_opposite_to_area_align_get(bContext *C){++C->alignment_queries;return AREA_EDGE;}
namespace blender {
template<class T,int> struct Array {
 std::unique_ptr<T[]> values;int size;
 explicit Array(int n):values(new T[n]),size(n){}
 T *data(){return values.get();}
 T operator[](int i)const{assert(i>=0&&i<size);return values[i];}
};
}
int RNA_property_array_length(PointerRNA *,PropertyRNA *){return 3;}
void RNA_property_boolean_get_array(PointerRNA *,PropertyRNA *,bool *values){values[0]=true;values[1]=true;values[2]=false;}
void ui_item_enum_expand_exec(uiLayout *,uiBlock *block,PointerRNA *,PropertyRNA *prop,
                             const std::optional<StringRef>,int,ButType type,bool){
 for(int i=0;i<prop->count;++i){auto b=std::make_unique<uiBut>();b->type=i==1?ButType::Separator:type;block->buttons.push_back(std::move(b));}
}
'''
CASES = r'''
int main(){
 for(bool tabs:{false,true})for(bool search:{false,true})for(bool icons:{false,true}){
  bContext C;uiLayout layout;uiBlock block;PointerRNA ptr;PropertyRNA prop,highlight;
  for(int i=0;i<2;++i){auto b=std::make_unique<uiBut>();b->flag=128;block.buttons.push_back(std::move(b));}
  ui_item_enum_expand_tabs(&layout,&C,&block,&ptr,&prop,&ptr,search?&highlight:nullptr,std::nullopt,20,icons,tabs);
  assert(block.buttons.size()==5);
  assert(block.buttons[0]->flag==128&&block.buttons[1]->flag==128);
  assert(block.buttons[2]->type==(tabs?ButType::Tab:ButType::Row));
  assert(block.buttons[3]->type==ButType::Separator);
  assert(block.buttons[4]->type==(tabs?ButType::Tab:ButType::Row));
  assert(!(block.buttons[2]->flag&UI_BUT_INACTIVE));
  assert(bool(block.buttons[4]->flag&UI_BUT_INACTIVE)==search);
  assert(C.alignment_queries==(tabs?3:0));
  for(int i=2;i<5;++i){assert(bool(block.buttons[i]->drawflag&AREA_EDGE)==tabs);assert(bool(block.buttons[i]->drawflag&UI_BUT_HAS_QUICK_TOOLTIP)==icons);}
  prop.count=0;C.alignment_queries=0;
  ui_item_enum_expand_tabs(&layout,&C,&block,&ptr,&prop,&ptr,&highlight,std::nullopt,20,icons,tabs);
  assert(block.buttons.size()==5&&C.alignment_queries==0);
 }
 std::cout<<"PASS: native tab/row styles, existing buttons, search highlight offsets, separators and empty enums\n";
}
'''
