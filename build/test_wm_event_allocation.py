"""Compile the actual complete pinned event schema with the shipped HUD fields.
Enum/vector dependencies are POD fixture boundaries; no target input claim.
"""
from pathlib import Path
import re,unittest
from test_touch_extrude import changed_source
from test_compact_shelf import function
import test_ipad_panels
ROOT=Path(__file__).resolve().parents[1]
BASE=(ROOT/'build/fixtures/pinned_wm_event.hh').read_text(encoding='utf-8')
PREFIX=r"""
#include <cassert>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <type_traits>
#include <vector>
using wmEventType=short;using wmEventModifierFlag=int;using eWM_EventFlag=int;
namespace blender {struct float2{float data[2];};}
"""
def actual_schema():
 src=changed_source('source/blender/windowmanager/WM_types.hh')
 field=re.findall(r'  uint64_t ipad_hud_generation[^;]*;',src)
 assert len(field)==1
 return BASE.replace('  wmTabletData tablet;', '  wmTabletData tablet;\n'+field[0])

class WMEventAllocationTests(unittest.TestCase):
 def test_complete_native_schema_preserves_calloc_contract_and_copy(self):
  schema=actual_schema()
  broken=schema.replace('  uint64_t ipad_hud_generation, ipad_hud_serial;',
                        '  uint64_t ipad_hud_generation=0, ipad_hud_serial=0;')
  test_ipad_panels.IPadWorkspacePanelsTests()._run_source(PREFIX+schema+'\nnamespace rejected {\n'+broken+'\n}\n'+r"""
static_assert(std::is_trivial_v<wmEvent>, "Native MEM_callocN requires trivial wmEvent");
static_assert(std::is_trivially_copyable_v<wmEvent>);
static_assert(std::is_standard_layout_v<wmEvent>);
static_assert(!std::is_trivial_v<rejected::wmEvent>, "Reproduce the actual failing initializer contract");
int main(){
 for(uint64_t i=1;i<10001;++i){
  auto *state=static_cast<wmEvent*>(std::calloc(1,sizeof(wmEvent)));
  assert(state&&!state->ipad_hud_generation&&!state->ipad_hud_serial);
  wmEvent value{};assert(!value.ipad_hud_generation&&!value.ipad_hud_serial);
  state->ipad_hud_generation=17;state->ipad_hud_serial=i;
  wmEvent copied=*state;assert(copied.ipad_hud_generation==17&&copied.ipad_hud_serial==i);
  std::free(state);
 }
}
""")
  workflow=(ROOT/'.github/workflows/build-ipa.yml').read_text(encoding='utf-8')
  pin=re.search(r'BLENDER_COMMIT: ([0-9a-f]{40})',workflow).group(1)
  self.assertIn(pin,BASE)

 def test_real_synthetic_motion_clears_physical_contact(self):
  event=changed_source('source/blender/windowmanager/intern/wm_event_system.cc')
  helper=function(event,'static wmEvent *wm_event_add_mousemove_to_head(')
  test_ipad_panels.IPadWorkspacePanelsTests()._run_source(PREFIX+actual_schema()+r"""
constexpr int MOUSEMOVE=1,KM_NOTHING=0;
struct Runtime{std::vector<wmEvent*>event_queue;};
struct wmWindow{wmEvent *event_last_handled;Runtime *runtime;};
void wm_event_custom_clear(wmEvent *e){e->custom=0;e->customdata=nullptr;}
void copy_v2_v2_int(int *a,const int *b){a[0]=b[0];a[1]=b[1];}
wmEvent *wm_event_add_intern(wmWindow *w,const wmEvent *e){auto *p=new wmEvent(*e);w->runtime->event_queue.push_back(p);return p;}
void BLI_remlink(std::vector<wmEvent*> *q,wmEvent *e){assert(q->back()==e);q->pop_back();}
void BLI_addhead(std::vector<wmEvent*> *q,wmEvent *e){q->insert(q->begin(),e);}
HELPER
int main(){
 Runtime runtime;wmEvent handled{};handled.ipad_hud_generation=17;handled.ipad_hud_serial=29;
 handled.xy[0]=55;handled.xy[1]=66;handled.modifier=7;handled.tablet.pressure=.3f;
 handled.flag=15;handled.custom=8;handled.customdata=&runtime;handled.utf8_buf[0]='x';
 for(bool previous:{false,true}){
  wmWindow window{previous?&handled:nullptr,&runtime};
  auto *result=wm_event_add_mousemove_to_head(&window);
  assert(!result->ipad_hud_generation&&!result->ipad_hud_serial);
  assert(result->type==MOUSEMOVE&&result->val==KM_NOTHING&&!result->flag&&!result->custom&&!result->customdata);
  assert(result->xy[0]==(previous?55:0)&&result->prev_xy[0]==result->xy[0]);
  assert(result->modifier==(previous?7:0));assert(!result->utf8_buf[0]);
  assert(runtime.event_queue.front()==result);delete result;runtime.event_queue.clear();
 }
 assert(handled.ipad_hud_generation==17&&handled.ipad_hud_serial==29);
}
""".replace('HELPER',helper))

if __name__=='__main__':unittest.main()
