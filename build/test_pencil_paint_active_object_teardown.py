"""Run the pinned active-object RNA setter through strict live Pencil teardown."""
from test_compact_shelf import function
import test_ipad_panels
from test_touch_extrude import changed_source
import unittest
import re


RNA = changed_source('source/blender/makesrna/intern/rna_layer.cc')
HELPER = function(RNA, 'static bool rna_LayerObjects_active_object_teardown(')
SETTER = function(RNA, 'static void rna_LayerObjects_active_object_set(')
SELECT = changed_source('source/blender/editors/object/object_select.cc')
BASE_ACTIVATE = function(SELECT, 'void base_activate(')
OBJECT_ADD = changed_source('source/blender/editors/object/object_add.cc')

NATIVE_MOCKS = r"""
struct StructRNA {};
struct PropertyRNA {};
static StructRNA layer_objects_type;
static PropertyRNA active_property;
static bool missing_layer_objects_type=false;
static bool missing_active_property=false;
static int refresh_calls=0;
static int rna_set_calls=0;

static Scene *CTX_data_scene(const bContext *C){return C&&C->win?C->win->scene:nullptr;}
static ViewLayer *CTX_data_view_layer(const bContext *C){return C&&C->win?C->win->view_layer:nullptr;}
static Main *CTX_data_main(const bContext *C){return C?C->main:nullptr;}
static StructRNA *RNA_struct_find(const char *identifier) {
  return !missing_layer_objects_type&&STREQ(identifier,"LayerObjects") ? &layer_objects_type : nullptr;
}
static PointerRNA RNA_pointer_create_discrete(ID *owner,StructRNA *,void *data) {
  void *owner_data=owner;
  if(G_MAIN) LISTBASE_FOREACH(Scene *,scene,&G_MAIN->scenes) if(&scene->id==owner) {
    owner_data=scene;
    break;
  }
  return PointerRNA{owner_data,data};
}
static PropertyRNA *RNA_struct_find_property(PointerRNA *ptr,const char *identifier) {
  return ptr&&ptr->owner_id&&ptr->data&&!missing_active_property&&STREQ(identifier,"active") ?
             &active_property : nullptr;
}
static Object *object_from_id(ID *id) {
  if(!G_MAIN||!id)return nullptr;
  LISTBASE_FOREACH(Object *,object,&G_MAIN->objects) if(&object->id==id)return object;
  return nullptr;
}
static PointerRNA RNA_id_pointer_create(ID *id) {
  return PointerRNA{nullptr,object_from_id(id)};
}
static void BKE_reports_init(ReportList *reports,int) { reports->message.clear(); }
static bool BKE_reports_contain(ReportList *reports,int) {
  return reports&&!reports->message.empty();
}
static void BKE_reports_free(ReportList *) {}
static void RNA_property_pointer_set(
    PointerRNA *ptr,PropertyRNA *property,PointerRNA value,ReportList *reports) {
  assert(ptr&&property==&active_property);
  ++rna_set_calls;
  rna_LayerObjects_active_object_set(ptr,value,reports);
}
static void base_active_refresh(Main *main,Scene *scene,ViewLayer *layer) {
  assert(main==G_MAIN&&scene&&layer);
  ++refresh_calls;
}
"""


CPP = r"""
#include <cassert>
#include <cstdint>
#include <cstdarg>
#include <cstdio>
#include <cstring>
#include <string>

struct Link { Link *next=nullptr; };
struct ListBase { Link *first=nullptr; };
#define LISTBASE_FOREACH(type, item, list)   for(type item=static_cast<type>((list)->first); item;       item=static_cast<type>(reinterpret_cast<Link *>(item)->next))
#define STREQ(a,b) (std::strcmp((a),(b))==0)
#define STRNCPY_UTF8(dst,src) std::snprintf((dst),sizeof(dst),"%s",(src))

struct ID { uint64_t session_uid=0; char name[64]="OBObject"; };
struct Object : Link { ID id; };
struct Base : Link { Object *object=nullptr; };
struct ViewLayer : Link { char name[64]="ViewLayer"; ListBase bases; Base *basact=nullptr; };
struct Scene : Link { ID id; ListBase view_layers; };
struct wmEventHandler : Link { int type=0; };
struct wmEventHandler_Op : wmEventHandler {
  uint64_t ipad_pencil_paint_serial=0;
  uint64_t ipad_pencil_operator_lifetime=0;
  uint64_t ipad_pencil_owner_values[19]{};
};
struct wmWindow : Link {
  int winid=0;
  void *runtime=reinterpret_cast<void *>(1);
  Scene *scene=nullptr;
  ViewLayer *view_layer=nullptr;
  ListBase handlers,modalhandlers;
};
struct wmWindowManager : Link { ID id; ListBase windows; };
struct Main { ListBase scenes,objects,wm; };
struct bContext { Main *main=nullptr; wmWindowManager *wm=nullptr; wmWindow *win=nullptr; };
struct PointerRNA { void *owner_id=nullptr; void *data=nullptr; };
struct ReportList { std::string message; };
static Main *G_MAIN=nullptr;
constexpr int WM_HANDLER_TYPE_OP=7, RPT_ERROR=2, RPT_STORE=1;

static int BLI_findindex(const ListBase *list,const void *target) {
  int index=0;
  for(Link *item=list->first;item;item=item->next,++index) if(item==target)return index;
  return -1;
}
static void BKE_view_layer_synced_ensure(const Scene *,ViewLayer *) {}
static Object *BKE_view_layer_active_object_get(ViewLayer *layer) {
  return layer&&layer->basact?layer->basact->object:nullptr;
}
static Base *BKE_view_layer_base_find(ViewLayer *layer,Object *object) {
  if(!layer||!object)return nullptr;
  LISTBASE_FOREACH(Base *,base,&layer->bases) if(base->object==object)return base;
  return nullptr;
}
static Scene *WM_window_get_active_scene(const wmWindow *win){return win?win->scene:nullptr;}
static ViewLayer *WM_window_get_active_view_layer(const wmWindow *win){return win?win->view_layer:nullptr;}
static bContext *CTX_create(){return new bContext{};}
static void CTX_data_main_set(bContext *C,Main *main){C->main=main;}
static void CTX_wm_manager_set(bContext *C,wmWindowManager *wm){C->wm=wm;}
static void CTX_wm_window_set(bContext *C,wmWindow *win){C->win=win;}
static void CTX_free(bContext *C){delete C;}
static void BKE_reportf(ReportList *reports,int,const char *format,...) {
  char text[256]; va_list args; va_start(args,format); std::vsnprintf(text,sizeof(text),format,args); va_end(args);
  if(reports)reports->message=text;
}

static bool refuse_teardown=false;
static int teardown_calls=0;
static uint64_t teardown_scene_uid=0,teardown_object_uid=0;
static int teardown_behavior=0;
static Object *callback_object=nullptr;
static Main replacement_main;
static void unlink_handler(ListBase &list,Link *target) {
  Link *previous=nullptr,*item=list.first;
  while(item&&item!=target){previous=item;item=item->next;}
  if(item){if(previous)previous->next=item->next;else list.first=item->next;item->next=nullptr;}
}
bool WM_event_ipad_pencil_paint_owner_teardown(
    bContext *C,wmWindow *win,const void *,const void *,uint64_t scene_uid,uint64_t object_uid,uint64_t=0) {
  assert(C&&C->main==G_MAIN&&C->wm&&C->win==win);
  assert(BLI_findindex(&C->wm->windows,win)>=0);
  teardown_scene_uid=scene_uid;teardown_object_uid=object_uid;++teardown_calls;
  if(refuse_teardown)return false;
  for(Link *base=win->modalhandlers.first;base;){
    Link *next=base->next;
    if(reinterpret_cast<wmEventHandler *>(base)->type==WM_HANDLER_TYPE_OP){
      auto *op=reinterpret_cast<wmEventHandler_Op *>(base);
      if(op->ipad_pencil_paint_serial&&op->ipad_pencil_owner_values[6]==scene_uid&&
         op->ipad_pencil_owner_values[7]==object_uid)unlink_handler(win->modalhandlers,base);
    }
    base=next;
  }
  if(teardown_behavior==1&&callback_object) {
    for(Link *base=win->modalhandlers.first;base;){
      Link *next=base->next;
      if(reinterpret_cast<wmEventHandler *>(base)->type==WM_HANDLER_TYPE_OP) {
        auto *op=reinterpret_cast<wmEventHandler_Op *>(base);
        if(op->ipad_pencil_paint_serial&&op->ipad_pencil_owner_values[6]==scene_uid&&
           op->ipad_pencil_owner_values[7]==object_uid)unlink_handler(win->modalhandlers,base);
      }
      base=next;
    }
    /* Cancellation callback re-enters Blender and changes the active object. */
    auto *layer=win->view_layer;
    layer->basact=BKE_view_layer_base_find(layer,callback_object);
  }
  if(teardown_behavior==2) G_MAIN=&replacement_main;
  return true;
}

static thread_local bool rna_layer_pencil_active_teardown_in_progress=false;
#define WITH_APPLE_CROSSPLATFORM
""" + HELPER + chr(10) + SETTER + chr(10) + NATIVE_MOCKS + chr(10) + BASE_ACTIVATE + r"""

static void append(ListBase &list,Link *item) {
  item->next=list.first;list.first=item;
}
static void add_owner(wmWindow &win,wmEventHandler_Op &owner,uint64_t scene_uid,uint64_t object_uid,uint64_t lifetime) {
  owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=1;
  owner.ipad_pencil_operator_lifetime=lifetime;
  owner.ipad_pencil_owner_values[6]=scene_uid;owner.ipad_pencil_owner_values[7]=object_uid;
  owner.ipad_pencil_owner_values[10]=uintptr_t(win.view_layer);
  append(win.modalhandlers,&owner);
}
static void setup(Main &main,Scene &scene,ViewLayer &layer,Object &old_object,Object &new_object,
                  Base &old_base,Base &new_base,wmWindowManager &wm,wmWindow &win) {
  G_MAIN=&main;scene.id.session_uid=100;old_object.id.session_uid=200;new_object.id.session_uid=201;
  std::snprintf(layer.name,sizeof(layer.name),"%s","LayerA");scene.view_layers.first=&layer;
  old_base.object=&old_object;new_base.object=&new_object;old_base.next=&new_base;
  layer.bases.first=&old_base;layer.basact=&old_base;
  main.scenes.first=&scene;main.objects.first=&old_object;old_object.next=&new_object;new_object.next=nullptr;
  wm.id.session_uid=300;wm.windows.first=&win;win.winid=4;win.scene=&scene;win.view_layer=&layer;
  win.next=nullptr;main.wm.first=&wm;
  refuse_teardown=false;teardown_calls=0;teardown_scene_uid=teardown_object_uid=0;
  teardown_behavior=0;callback_object=nullptr;
  refresh_calls=0;rna_set_calls=0;missing_layer_objects_type=false;missing_active_property=false;
}
int main() {
  {
    Main main;Scene scene;ViewLayer layer,other_layer;Object old_object,new_object;Base old_base,new_base;
    wmWindowManager wm,other_wm;wmWindow first,second,other_layer_window;
    setup(main,scene,layer,old_object,new_object,old_base,new_base,wm,first);
    second.scene=&scene;second.view_layer=&layer;
    std::snprintf(other_layer.name,sizeof(other_layer.name),"%s","LayerB");other_layer_window.scene=&scene;other_layer_window.view_layer=&other_layer;
    first.next=&second;second.next=&other_layer_window;wm.windows.first=&first;
    other_wm.id.session_uid=301;main.wm.first=&wm;wm.next=&other_wm;other_wm.windows.first=nullptr;
    wmEventHandler_Op first_owner,second_owner,unrelated_owner;
    add_owner(first,first_owner,100,200,10);add_owner(second,second_owner,100,200,11);
    add_owner(other_layer_window,unrelated_owner,100,200,12);
    PointerRNA ptr{&scene,&layer},value{nullptr,&new_object};ReportList reports;
    rna_LayerObjects_active_object_set(&ptr,value,&reports);
    assert(layer.basact==&new_base&&teardown_calls==2);
    assert(teardown_scene_uid==100&&teardown_object_uid==200);
    assert(!first.modalhandlers.first&&!second.modalhandlers.first);
    assert(other_layer_window.modalhandlers.first==&unrelated_owner);
  }
  {
    Main main;Scene scene;ViewLayer layer;Object old_object,new_object;Base old_base,new_base;
    wmWindowManager wm;wmWindow win;setup(main,scene,layer,old_object,new_object,old_base,new_base,wm,win);
    wmEventHandler_Op owner;add_owner(win,owner,100,200,20);refuse_teardown=true;
    PointerRNA ptr{&scene,&layer},value{nullptr,&new_object};ReportList reports;
    rna_LayerObjects_active_object_set(&ptr,value,&reports);
    assert(layer.basact==&old_base&&win.modalhandlers.first==&owner);
    assert(teardown_calls==1&&!reports.message.empty());
  }
  {
    Main main;Scene scene;ViewLayer layer;Object old_object,new_object;Base old_base,new_base;
    wmWindowManager wm;wmWindow win;setup(main,scene,layer,old_object,new_object,old_base,new_base,wm,win);
    wmEventHandler_Op owner;owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=1;
    owner.ipad_pencil_owner_values[6]=100;owner.ipad_pencil_owner_values[7]=200;
    append(win.handlers,&owner);
    PointerRNA ptr{&scene,&layer},value{nullptr,&new_object};ReportList reports;
    rna_LayerObjects_active_object_set(&ptr,value,&reports);
    assert(layer.basact==&old_base&&teardown_calls==0&&!reports.message.empty());
  }
  {
    Main main;Scene scene;ViewLayer layer;Object old_object,new_object,foreign_object;Base old_base,new_base;
    wmWindowManager wm;wmWindow win;setup(main,scene,layer,old_object,new_object,old_base,new_base,wm,win);
    foreign_object.id.session_uid=202;
    PointerRNA ptr{&scene,&layer},value{nullptr,&foreign_object};ReportList reports;
    rna_LayerObjects_active_object_set(&ptr,value,&reports);
    assert(layer.basact==&old_base&&teardown_calls==0);
    assert(reports.message.find("does not contain")!=std::string::npos);
  }
  {
    Main main;Scene scene;ViewLayer layer,other_layer;Object old_object,new_object;Base old_base,new_base;
    wmWindowManager wm;wmWindow win;setup(main,scene,layer,old_object,new_object,old_base,new_base,wm,win);
    std::snprintf(other_layer.name,sizeof(other_layer.name),"%s","LayerB");
    layer.next=&other_layer;
    wmEventHandler_Op owner;add_owner(win,owner,100,200,35);
    win.view_layer=&other_layer;
    PointerRNA ptr{&scene,&layer},value{nullptr,&new_object};ReportList reports;
    rna_LayerObjects_active_object_set(&ptr,value,&reports);
    assert(layer.basact==&old_base&&teardown_calls==0);
    assert(reports.message.find("prevented safe")!=std::string::npos);
  }
  {
    Main main;Scene scene;ViewLayer layer;Object old_object,new_object;Base old_base,new_base;
    wmWindowManager wm;wmWindow win;setup(main,scene,layer,old_object,new_object,old_base,new_base,wm,win);
    wmEventHandler_Op owner;add_owner(win,owner,100,200,40);
    PointerRNA ptr{&scene,&layer},value{};ReportList reports;
    rna_LayerObjects_active_object_set(&ptr,value,&reports);
    assert(layer.basact==nullptr&&teardown_calls==1&&!win.modalhandlers.first);
  }
  {
    Main main;Scene scene;ViewLayer layer;Object old_object,new_object;Base old_base,new_base;
    wmWindowManager wm;wmWindow win;setup(main,scene,layer,old_object,new_object,old_base,new_base,wm,win);
    wmEventHandler_Op owner;add_owner(win,owner,100,200,50);
    PointerRNA ptr{&scene,&layer},value{nullptr,&old_object};ReportList reports;
    rna_LayerObjects_active_object_set(&ptr,value,&reports);
    assert(layer.basact==&old_base&&teardown_calls==0&&win.modalhandlers.first==&owner);
  }
  {
    Main main;Scene scene;ViewLayer layer;Object old_object,new_object;Base old_base,new_base;
    wmWindowManager wm;wmWindow win;setup(main,scene,layer,old_object,new_object,old_base,new_base,wm,win);
    wmEventHandler_Op owner;add_owner(win,owner,100,200,60);
    teardown_behavior=1;callback_object=&new_object;
    PointerRNA ptr{&scene,&layer},value{nullptr,&new_object};ReportList reports;
    rna_LayerObjects_active_object_set(&ptr,value,&reports);
    assert(layer.basact==&new_base&&teardown_calls==1);
    /* The callback's change is preserved; the outer setter refuses to overwrite it. */
    assert(reports.message.find("prevented safe")!=std::string::npos);
  }
  {
    Main main;Scene scene;ViewLayer layer;Object old_object,new_object;Base old_base,new_base;
    wmWindowManager wm;wmWindow win;setup(main,scene,layer,old_object,new_object,old_base,new_base,wm,win);
    wmEventHandler_Op owner;add_owner(win,owner,100,200,70);
    teardown_behavior=2;
    PointerRNA ptr{&scene,&layer},value{nullptr,&new_object};ReportList reports;
    rna_LayerObjects_active_object_set(&ptr,value,&reports);
    G_MAIN=&main;
    assert(layer.basact==&old_base&&teardown_calls==1&&reports.message.find("prevented safe")!=std::string::npos);
  }
  {
    Main main;Scene scene;ViewLayer layer;Object old_object,new_object;Base old_base,new_base;
    wmWindowManager wm;wmWindow win;setup(main,scene,layer,old_object,new_object,old_base,new_base,wm,win);
    G_MAIN=nullptr;
    PointerRNA ptr{&scene,&layer},value{nullptr,&new_object};ReportList reports;
    rna_LayerObjects_active_object_set(&ptr,value,&reports);
    assert(layer.basact==&new_base&&teardown_calls==0);
    G_MAIN=&main;
  }

  {
    Main main;Scene scene;ViewLayer layer;Object old_object,new_object;Base old_base,new_base;
    wmWindowManager wm;wmWindow first,second;
    setup(main,scene,layer,old_object,new_object,old_base,new_base,wm,first);
    second.scene=&scene;second.view_layer=&layer;first.next=&second;wm.windows.first=&first;
    wmEventHandler_Op first_owner,second_owner;
    add_owner(first,first_owner,100,200,81);add_owner(second,second_owner,100,200,82);
    bContext context{&main,&wm,&first};
    base_activate(&context,&new_base);
    assert(layer.basact==&new_base&&teardown_calls==2&&refresh_calls==1&&rna_set_calls==1);
    assert(!first.modalhandlers.first&&!second.modalhandlers.first);
  }
  {
    Main main;Scene scene;ViewLayer layer;Object old_object,new_object;Base old_base,new_base;
    wmWindowManager wm;wmWindow win;
    setup(main,scene,layer,old_object,new_object,old_base,new_base,wm,win);
    wmEventHandler_Op owner;add_owner(win,owner,100,200,83);refuse_teardown=true;
    bContext context{&main,&wm,&win};
    base_activate(&context,&new_base);
    assert(layer.basact==&old_base&&win.modalhandlers.first==&owner);
    assert(teardown_calls==1&&refresh_calls==0&&rna_set_calls==1);
  }
  {
    Main main;Scene scene;ViewLayer layer,other_layer;Object old_object,new_object;Base old_base,new_base;
    wmWindowManager wm;wmWindow win,other_win;
    setup(main,scene,layer,old_object,new_object,old_base,new_base,wm,win);
    std::snprintf(other_layer.name,sizeof(other_layer.name),"%s","LayerB");
    layer.next=&other_layer;other_win.scene=&scene;other_win.view_layer=&other_layer;
    win.next=&other_win;wm.windows.first=&win;
    wmEventHandler_Op owner;add_owner(other_win,owner,100,200,84);
    bContext context{&main,&wm,&win};
    base_activate(&context,&new_base);
    assert(layer.basact==&new_base&&refresh_calls==1&&teardown_calls==0);
    assert(other_win.modalhandlers.first==&owner);
  }
  {
    Main main;Scene scene;ViewLayer layer;Object old_object,new_object;Base old_base,new_base;
    wmWindowManager wm;wmWindow win;
    setup(main,scene,layer,old_object,new_object,old_base,new_base,wm,win);
    wmEventHandler_Op owner;add_owner(win,owner,100,200,85);
    bContext context{&main,&wm,&win};
    base_activate(&context,nullptr);
    assert(layer.basact==nullptr&&!win.modalhandlers.first);
    assert(teardown_calls==1&&refresh_calls==1);
  }
  {
    Main main;Scene scene;ViewLayer layer;Object old_object,new_object,foreign_object;Base old_base,new_base,foreign_base;
    wmWindowManager wm;wmWindow win;
    setup(main,scene,layer,old_object,new_object,old_base,new_base,wm,win);
    foreign_object.id.session_uid=202;foreign_base.object=&foreign_object;
    new_object.next=&foreign_object;foreign_object.next=nullptr;
    bContext context{&main,&wm,&win};
    base_activate(&context,&foreign_base);
    assert(layer.basact==&old_base&&refresh_calls==0&&teardown_calls==0);
  }
  {
    Main main;Scene scene;ViewLayer layer;Object old_object,new_object;Base old_base,new_base;
    wmWindowManager wm;wmWindow win;
    setup(main,scene,layer,old_object,new_object,old_base,new_base,wm,win);
    wmEventHandler_Op owner;add_owner(win,owner,100,200,86);
    teardown_behavior=1;callback_object=&new_object;
    bContext context{&main,&wm,&win};
    base_activate(&context,&new_base);
    assert(layer.basact==&new_base&&refresh_calls==0&&teardown_calls==1);
  }
  {
    Main main;Scene scene;ViewLayer layer;Object old_object,new_object;Base old_base,new_base;
    wmWindowManager wm;wmWindow win;
    setup(main,scene,layer,old_object,new_object,old_base,new_base,wm,win);
    missing_active_property=true;
    bContext context{&main,&wm,&win};
    base_activate(&context,&new_base);
    assert(layer.basact==&old_base&&refresh_calls==0&&rna_set_calls==0);
  }
  {
    Main main;Scene scene;ViewLayer layer;Object old_object,new_object;Base old_base,new_base;
    wmWindowManager wm;wmWindow win;
    setup(main,scene,layer,old_object,new_object,old_base,new_base,wm,win);
    missing_layer_objects_type=true;
    bContext context{&main,&wm,&win};
    base_activate(&context,&new_base);
    assert(layer.basact==&old_base&&refresh_calls==0&&rna_set_calls==0);
  }
  {
    Main main;Scene scene;ViewLayer layer;Object old_object,new_object;Base old_base,bad_base;
    wmWindowManager wm;wmWindow win;
    setup(main,scene,layer,old_object,new_object,old_base,bad_base,wm,win);
    bad_base.object=nullptr;
    bContext context{&main,&wm,&win};
    base_activate(&context,&bad_base);
    assert(layer.basact==&old_base&&refresh_calls==0&&rna_set_calls==0);
  }

}
"""


class PencilActiveObjectTeardownTests(unittest.TestCase):
    def test_actual_rna_setter_retires_only_matching_live_owners_before_mutation(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(CPP)

    def test_actual_native_base_activation_uses_guarded_rna_and_refreshes_only_on_success(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(CPP)

    def test_object_creation_does_not_repeat_a_refused_native_active_object_write(self):
        block = re.search(
            r'if \(act_base\) \{(?P<body>.*?)\n  \}',
            OBJECT_ADD,
            re.DOTALL,
        )
        self.assertIsNotNone(block)
        self.assertIn('base_activate(C, act_base);', block.group('body'))
        self.assertNotIn('view_layer->basact = act_base;', block.group('body'))

    def test_non_apple_native_active_write_remains_available(self):
        self.assertIn('#else\n  view_layer->basact = base;\n#endif', BASE_ACTIVATE)

    def test_runtime_headers_expose_global_main_and_event_handler_layout(self):
        self.assertIn('#  include "BKE_global.hh"', RNA)
        self.assertIn('#  include "wm_event_system.hh"', RNA)

    def test_rna_setter_uses_existing_context_free_owner_teardown_api(self):
        self.assertIn('WM_event_ipad_pencil_paint_owner_teardown(', HELPER)
        self.assertIn('rna_LayerObjects_active_object_teardown(', SETTER)
        self.assertLess(SETTER.index('rna_LayerObjects_active_object_teardown('),
                        SETTER.index('view_layer->basact = basact_test;'))
        self.assertIn('Object *new_object = static_cast<Object *>(value.data);', SETTER)
        self.assertIn('if (!new_object || BKE_view_layer_base_find(view_layer, new_object)', SETTER)


if __name__ == '__main__':
    unittest.main()
