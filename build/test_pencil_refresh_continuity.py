"""Execute creator-refresh/publication/contact together, not modeled refresh.

Native lists/widgets/GPU and UIKit recognition remain fixture boundaries.
"""
import unittest
from test_compact_shelf import function
from test_touch_extrude import changed_source
from test_pencil_barrel_reset import POLICY,BROWSE,GHOST,TYPES,CONSTANTS
import test_ipad_panels

NATIVE=changed_source('source/blender/editors/interface/regions/interface_region_menu_pie.cc')
class PencilRefreshTests(unittest.TestCase):
    def run_cpp(self,source):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(POLICY+BROWSE+GHOST+source)

    def test_actual_creator_draw_and_contact_preserve_unchanged_only(self):
        create=function(NATIVE,'static uiBlock *ui_ipad_ring_create(')
        prefix=create[create.index('  auto &data ='):create.index('  uiBlock *block =')]
        publish=function(NATIVE,'void ui_ipad_ring_draw_presented(')
        contact=function(NATIVE,'bool ui_ipad_ring_contact_input(')
        capture=function(NATIVE,'static void ui_ipad_ring_inventory_capture(const uiBlock *block, uiIPadRingData &data)\n{')
        key=function(NATIVE,'static void ui_ipad_ring_key_value(')
        property_key=function(NATIVE,'static bool ui_ipad_ring_property_key(')
        self.run_cpp(TYPES+CONSTANTS+r"""
#define WITH_APPLE_CROSSPLATFORM
#include <cassert>
#include <memory>
#define LISTBASE_FOREACH(type,item,list) for(type item:*(list))
namespace ipad_ring=blender::ui::ipad;
inline constexpr int UI_HIDDEN=1,UI_SCROLLED=2,UI_BUT_DISABLED=4,UI_SELECT_DRAW=8,UI_HOVER=16;
#include <cstring>
template<typename T,typename...V>bool elem(T a,V...v){return ((a==v)||...);}
#define ELEM(a,...) elem(a,__VA_ARGS__)
inline constexpr int IDP_GROUP=6,IDP_INT=1,IDP_BOOLEAN=10,IDP_FLOAT=2,IDP_DOUBLE=8,IDP_ARRAY=5,IDP_STRING=0,IDP_ID=7;
struct IDProperty{char type=IDP_INT,subtype=0;short flag=0;char name[64]="props";struct{void *pointer=nullptr;std::vector<IDProperty*> group;int val=0,val2=0;}data;int len=0,totallen=0;};
struct PointerRNA{void *type=nullptr,*data=nullptr;};
struct wmOperatorType{uint64_t ipad_lifetime_id=4;const char *idname="VIEW3D_OT_ipad_native_tool";void *srna=(void*)17;};
wmOperatorType native;std::vector<wmOperatorType*> registered{&native};
std::vector<wmOperatorType*> WM_operatortypes_registered_get(){return registered;}
enum class ButType{But};
struct rcti{int xmin,xmax,ymin,ymax;};
int BLI_rcti_size_x(const rcti *r){return r->xmax-r->xmin;}int BLI_rcti_size_y(const rcti *r){return r->ymax-r->ymin;}
struct bContext{};struct uiBlock; struct wmEvent{int type,custom;void *customdata;int xy[2];};
struct Runtime{std::vector<uiBlock*> uiblocks;};
struct ARegion{rcti winrct{0,900,0,800};Runtime *runtime;};
struct uiBut{ButType type=ButType::But;int icon=1,iconadd=0,opcontext=0;bool operator_never_call=false;
 std::string str="tool";void *func=nullptr,*func_arg1=nullptr,*func_arg2=nullptr,*funcN=nullptr,*func_argN=nullptr;
 void *block_create_func=nullptr,*menu_create_func=nullptr,*poin=nullptr,*rnaprop=nullptr,*context=nullptr,*apply_func=nullptr,*pushed_state_func=nullptr;
 wmOperatorType *optype=&native;PointerRNA *opptr=nullptr;int flag=0;bool ipad_ring_label_fit=true;void *active=nullptr,*semi_modal_state=nullptr;};
struct uiPopupBlockHandle{ARegion *region;bool can_refresh=true;struct{void *arg;void (*handle_create_func)();}popup_create_vars;int menuretval=0;};
struct uiBlock{struct{int flags=UI_PIE_IPAD_TOOLS;}pie_data;uiPopupBlockHandle *handle;uint64_t ipad_ring_lifetime=7,ipad_ring_generation=1;std::vector<std::unique_ptr<uiBut>> buttons;};
struct uiIPadRingDrawItem{int index;ipad_ring::Rect rect;};
struct uiIPadRingData{std::string menu="VIEW3D_MT_ipad_tool_inventory";uint64_t lifetime=7,generation=1,presented_generation=0;
 uint64_t refused_generation=0;bool input_suspended=true,navigation_rebuild=false;int visible_count=9,inventory_count=43,window_height=800;
 float unit=20,phase=0;void *ghost_window;ipad_ring::Rect viewport{0,900,0,800};ipad_ring::RingBrowseState browse;
 std::string inventory_key="native-tool-inventory43";std::vector<bool> refresh_taps=std::vector<bool>(43,true);
 uint64_t contact_serial=0,contact_generation=0,roll_serial=0,roll_generation=0;};
void ui_ipad_ring_create(){}
KEY
PROPERTY
CAPTURE
bool valid=true,child=false;int redraws=0;
bool ui_ipad_ring_context_valid(bContext*,uiBlock*){return valid;}
bool ui_ipad_ring_child_open(const uiBlock*){return child;}
bool ui_ipad_ring_roll_input(bContext*,uiBlock*,const wmEvent*){return true;}
bool ui_ipad_ring_waits_for_draw(const uiBlock *b){auto *d=static_cast<uiIPadRingData*>(b->handle->popup_create_vars.arg);return d->input_suspended||b->ipad_ring_generation!=d->presented_generation;}
void ui_but_active_free(bContext*,uiBut *b){b->active=b->semi_modal_state=nullptr;}
void ui_but_semi_modal_state_free(bContext*,uiBut *b){b->semi_modal_state=nullptr;}
void ED_region_tag_refresh_ui(ARegion*){++redraws;}void ED_region_tag_redraw(ARegion*){++redraws;}
void refresh_prefix(bContext *C,uiPopupBlockHandle *handle,void *arg){PREFIX}
PUBLISH
CONTACT
int main(){bContext C;int ghost_key=0;Runtime runtime;ARegion region{{0,900,0,800},&runtime};uiIPadRingData data;data.ghost_window=&ghost_key;data.browse.open(7);
 uiPopupBlockHandle handle{&region,true,{&data,ui_ipad_ring_create},0};
 uiBlock block{{UI_PIE_IPAD_TOOLS},&handle,7,1,{}};runtime.uiblocks={&block};
 IDProperty properties[43];PointerRNA pointers[43];
 for(int i=0;i<43;++i){block.buttons.push_back(std::make_unique<uiBut>());properties[i].data.val=i;
  pointers[i]={native.srna,&properties[i]};block.buttons[i]->opptr=&pointers[i];}
 auto draw=[&](){auto page=ipad_ring::ring_page_layout(20,data.viewport,450,400,data.inventory_count,data.phase);
  std::vector<uiIPadRingDrawItem> items;for(auto &button:block.buttons)button->flag|=UI_HIDDEN;
  for(int i=0;i<int(page.indices.size());++i){items.push_back({page.indices[i],page.buttons[i]});block.buttons[page.indices[i]]->flag&=~UI_HIDDEN;}
  rcti bounds{int(page.footprint.xmin),int(page.footprint.xmax),int(page.footprint.ymin),int(page.footprint.ymax)};
  ui_ipad_ring_draw_presented(&block,&region,bounds,items);assert(!data.input_suspended);};
 auto refresh=[&](){refresh_prefix(&C,&handle,&data);block.ipad_ring_generation=data.generation;draw();};
 draw();assert(data.browse.continuity_first==1);
 GHOST_TEventPencilRingData packet{7,1,0,0,GHOST_kPencilRingBegin,11,0};wmEvent event{PENCIL_RING_INPUT,EVT_DATA_PENCIL_RING,&packet,{450,543}};
 uiBut *tap=nullptr;auto input=[&](GHOST_TPencilRingPhase phase){packet.phase=phase;assert(ui_ipad_ring_contact_input(&C,&block,&event,&tap));};
 // UIKit captured generation1 at touch-down; native refresh precedes recognized Begin.
 refresh();input(GHOST_kPencilRingBegin);assert(data.browse.contact&&data.contact_generation==1&&data.contact_serial==11);
 event.xy[0]=457;event.xy[1]=542;input(GHOST_kPencilRingMotion);assert(!data.browse.rotating);
 refresh();assert(data.browse.contact_valid&&data.browse.accumulated_angle>0);
 event.xy[0]=493;event.xy[1]=536;input(GHOST_kPencilRingMotion);assert(data.browse.rotating&&data.input_suspended&&redraws);
 refresh();assert(data.browse.contact_valid&&data.contact_generation==1);
 input(GHOST_kPencilRingEnd);assert(!tap&&!data.browse.contact&&data.input_suspended);refresh();
 assert(std::floor(data.phase)==data.phase);
 // A Begin from the old page is not newly admitted after intentional navigation.
 input(GHOST_kPencilRingBegin);assert(!data.browse.contact);
 // New same-page known operator taps survive a proven identical publication.
 data.browse.home(7);data.phase=0;refresh();packet.generation=data.presented_generation;packet.contact=12;event.xy[0]=450;event.xy[1]=543;
 input(GHOST_kPencilRingBegin);refresh();input(GHOST_kPencilRingEnd);assert(tap==block.buttons[0].get());
 // Opaque callbacks never gain tap permission just from equal addresses/layout.
 block.buttons[0]->func=(void*)123;refresh();packet.generation=data.presented_generation;packet.contact=13;
 input(GHOST_kPencilRingBegin);refresh();input(GHOST_kPencilRingEnd);assert(!tap);
 // Same-count reordered native tool/action values end continuity.
 block.buttons[0]->func=nullptr;refresh();packet.generation=data.presented_generation;packet.contact=14;
 input(GHOST_kPencilRingBegin);std::swap(block.buttons[0]->opptr,block.buttons[1]->opptr);refresh();assert(!data.browse.contact_valid);
 input(GHOST_kPencilRingEnd);assert(!tap);input(GHOST_kPencilRingBegin);assert(!data.browse.contact);
 // Final operator polling and migrated active properties are captured on draw.
 packet.generation=data.presented_generation;packet.contact=19;input(GHOST_kPencilRingBegin);
 auto before=data.inventory_key;block.buttons[0]->flag|=UI_BUT_DISABLED;refresh();assert(data.inventory_key!=before&&!data.browse.contact_valid);
 input(GHOST_kPencilRingCancel);block.buttons[0]->flag&=~UI_BUT_DISABLED;refresh();
 packet.generation=data.presented_generation;packet.contact=20;input(GHOST_kPencilRingBegin);
 before=data.inventory_key;properties[1].data.val=888;refresh();assert(data.inventory_key!=before&&!data.browse.contact_valid);input(GHOST_kPencilRingCancel);
 // Feedback, hidden overflow and allocation capacity alone leave action values stable.
 before=data.inventory_key;block.buttons[0]->flag|=UI_HOVER;properties[1].totallen=999;refresh();assert(data.inventory_key==before);
 block.buttons[0]->flag&=~UI_HOVER;
 // Retired types are compared against fresh registry before metadata is read.
 auto *oldtype=block.buttons[0]->optype;block.buttons[0]->optype=(wmOperatorType*)0xdeadbeef;refresh();assert(data.inventory_key.empty());
 block.buttons[0]->optype=oldtype;refresh();assert(!data.inventory_key.empty());
 before=data.inventory_key;++native.ipad_lifetime_id;refresh();assert(data.inventory_key!=before);
 // Changed actual projected bounds/unit are not benign redraws.
 packet.generation=data.presented_generation;packet.contact=15;input(GHOST_kPencilRingBegin);data.unit=21;refresh();assert(!data.browse.contact_valid);
 input(GHOST_kPencilRingCancel);assert(!tap);
 // A failed label publication retires native/GHOST receipt and the contact.
 packet.generation=data.presented_generation;packet.contact=16;input(GHOST_kPencilRingBegin);block.buttons[0]->ipad_ring_label_fit=false;
 auto page=ipad_ring::ring_page_layout(20,data.viewport,450,400,43,data.phase);std::vector<uiIPadRingDrawItem> items;
 for(int i=0;i<9;++i)items.push_back({page.indices[i],page.buttons[i]});
 rcti bounds{int(page.footprint.xmin),int(page.footprint.xmax),int(page.footprint.ymin),int(page.footprint.ymax)};
 ui_ipad_ring_draw_presented(&block,&region,bounds,items);assert(data.input_suspended&&!data.browse.contact);
 assert(!ghost::ios::pencil_ring_presentation(&ghost_key).lifetime);
 input(GHOST_kPencilRingEnd);assert(!tap);
 // Repair cannot resurrect a queued Begin from the refused generation.
 block.buttons[0]->ipad_ring_label_fit=true;packet.phase=GHOST_kPencilRingBegin;
 ui_ipad_ring_draw_presented(&block,&region,bounds,items);assert(data.input_suspended);
 refresh();input(GHOST_kPencilRingBegin);assert(!data.browse.contact);
 // Repeated source creator/publication pairs browse the complete native counts.
 for(int count:{34,43}){data.inventory_count=count;data.refresh_taps.assign(count,true);data.inventory_key="inventory"+std::to_string(count);
  data.browse.home(7);data.phase=0;refresh();
  for(int n=0;n<10000;++n){packet.generation=data.presented_generation;packet.contact=100+n;event.xy[0]=450;event.xy[1]=543;
   input(GHOST_kPencilRingBegin);refresh();event.xy[0]=457;event.xy[1]=542;input(GHOST_kPencilRingMotion);refresh();
   event.xy[0]=493;event.xy[1]=536;input(GHOST_kPencilRingMotion);refresh();input(GHOST_kPencilRingEnd);assert(!tap);refresh();}
 }
}
""".replace('PREFIX',prefix).replace('PUBLISH',publish).replace('CONTACT',contact).replace('CAPTURE',capture).replace('PROPERTY',property_key).replace('KEY',key))

    def test_owned_property_key_is_typed_callback_free_and_capacity_independent(self):
        key=function(NATIVE,'static void ui_ipad_ring_key_value(')
        prop=function(NATIVE,'static bool ui_ipad_ring_property_key(')
        self.run_cpp(r"""
#include <cassert>
#include <cstring>
#define LISTBASE_FOREACH(type,item,list) for(type item:*(list))
template<typename T,typename...V>bool elem(T a,V...v){return ((a==v)||...);}
#define ELEM(a,...) elem(a,__VA_ARGS__)
inline constexpr int IDP_GROUP=6,IDP_INT=1,IDP_BOOLEAN=10,IDP_FLOAT=2,IDP_DOUBLE=8,IDP_ARRAY=5,IDP_STRING=0,IDP_ID=7;
struct IDProperty{char type=IDP_GROUP,subtype=0;short flag=0;char name[64]="props";struct{void *pointer=nullptr;std::vector<IDProperty*> group;int val=0,val2=0;}data;int len=0,totallen=0;};
KEY
PROPERTY
int main(){IDProperty group,tool;tool.type=IDP_STRING;memcpy(tool.name,"name",5);char text[]="builtin.move";
 tool.data.pointer=text;tool.len=tool.totallen=sizeof(text);group.data.group={&tool};
 auto snapshot=[&](){int budget=16384;std::string value;assert(ui_ipad_ring_property_key(&group,value,budget));return value;};
 const auto original=snapshot();tool.totallen+=99;assert(snapshot()==original);
 tool.flag=1;assert(snapshot()!=original);tool.flag=0;
 text[8]='r';assert(snapshot()!=original);text[8]='m';
 IDProperty vector;vector.type=IDP_ARRAY;vector.subtype=IDP_FLOAT;float values[]={1,2,3};vector.data.pointer=values;vector.len=3;vector.totallen=7;group.data.group.push_back(&vector);
 auto before=snapshot();values[1]=4;assert(snapshot()!=before);
 vector.subtype=IDP_GROUP;int budget=16384;std::string key;assert(!ui_ipad_ring_property_key(&group,key,budget));
 vector.type=IDP_ID;key.clear();assert(!ui_ipad_ring_property_key(&group,key,budget));
 group.data.group={&group};budget=16384;key.clear();assert(!ui_ipad_ring_property_key(&group,key,budget));
 group.data.group={&tool};tool.len=tool.totallen+1;budget=16384;key.clear();assert(!ui_ipad_ring_property_key(&group,key,budget));
}
""".replace('KEY',key).replace('PROPERTY',prop))

if __name__=='__main__':unittest.main()
