
// Storage/allocation, window coordinates and simulation-global adapters only.
// Actual native branch/functions are appended by the driver, unchanged.
#include <deque>
#include <new>
enum {MOUSEPAN=100,MOUSEZOOM,MOUSESMARTZOOM,MOUSEROTATE,MOUSEMOVE,KM_NOTHING};
struct wmEvent {wmEvent*next=nullptr,*prev=nullptr;int type=0,val=0,xy[2]{},prev_xy[2]{},modifier=13,keymodifier=17;
 eWM_EventFlag flag=eWM_EventFlag(0);float pressure=.7f;int sentinel=55;};
struct EventList {std::deque<wmEvent*>items;wmEvent*last=nullptr;};
struct Runtime {EventList event_queue;};
struct wmWindow {Runtime*runtime;wmEvent*eventstate;};
template<class T>T*MEM_callocN(const char*){return new T{};}
void BLI_addtail(EventList*list,wmEvent*event){list->items.push_back(event);list->last=event;}
void wm_event_free_last(wmWindow*win){auto&list=win->runtime->event_queue;delete list.items.back();list.items.pop_back();list.last=list.items.empty()?nullptr:list.items.back();}
void clear(wmWindow*win){while(win->runtime->event_queue.last)wm_event_free_last(win);}
void copy_v2_v2_int(int*a,const int*b){a[0]=b[0];a[1]=b[1];}
void wm_cursor_position_from_ghost_screen_coords(wmWindow*,int*x,int*y){*x+=3;*y=900-*y;}
struct{int f=1;}G;constexpr int G_FLAG_EVENT_SIMULATE=1;
#define BLI_assert_unreachable() assert(false)
#define ISKEYBOARD_OR_BUTTON(type) false
#define ISKEYBOARD(type) false
void wm_event_state_update_and_click_set_ex(wmEvent*,uint64_t,wmEvent*,uint64_t*,bool,bool){assert(false);}
