"""Execute the Image Paint image-ownership guard against pinned native source."""
from pathlib import Path
import unittest

import test_ipad_panels
from test_compact_shelf import function
from test_touch_extrude import changed_source


WM_PATH = "source/blender/windowmanager/intern/wm_event_system.cc"
RNA_PATH = "source/blender/makesrna/intern/rna_main_api.cc"
PAINT_PATH = "source/blender/editors/sculpt_paint/paint_image_ops_paint.cc"
PROJECTION_PATH = "source/blender/editors/sculpt_paint/paint_image_proj.cc"
WRAPPER_PATH = "source/blender/python/intern/bpy_operator_wrap.cc"
PATCH = (Path(__file__).resolve().parents[1] / "patches/blender-ipad.patch").read_text(encoding="utf-8")


def patch_section(path):
    marker = f"diff --git a/{path} b/{path}\n"
    return PATCH.split(marker, 1)[1].split("diff --git ", 1)[0]

WM_SOURCE = changed_source(WM_PATH)
IMAGE_FIND = function(WM_SOURCE, "static ID *wm_ipad_pencil_paint_image_find(")
IMAGE_TEARDOWN = function(WM_SOURCE, "bool WM_event_ipad_pencil_paint_image_teardown(")
RNA_SOURCE = changed_source(RNA_PATH)
RNA_IMAGE_GUARD = function(RNA_SOURCE, "static bool rna_Main_image_remove_guard(")
PAINT_SOURCE = changed_source(PAINT_PATH)
PAINT_CALLBACK = function(PAINT_SOURCE, "static eWMOperatorIDUse paint_image_pencil_id_use(")
PROJECTION_SOURCE = changed_source(PROJECTION_PATH)
PROJECTION_IMAGE_USE = function(PROJECTION_SOURCE, "bool paint_proj_stroke_uses_image(")


PAINT_CALLBACK_CPP = r"""
#include <cassert>
#include <cstdint>
enum class eWMOperatorIDUse : uint8_t { Unknown, NotUsed, Used };
constexpr int ID_IM=1, ID_ME=2;
#define GS(name) ((name)[0]=='I' && (name)[1]=='M' ? ID_IM : ID_ME)
struct ID { char name[66]="IMImage"; };
struct Image {};
struct wmOperator { void *customdata=nullptr; };
struct PaintStroke { void *mode_data=nullptr; };
struct AbstractPaintMode {
  virtual ~AbstractPaintMode()=default;
  virtual eWMOperatorIDUse stroke_image_use(void *,const Image *) const=0;
};
struct PaintOperation { AbstractPaintMode *mode=nullptr;void *stroke_handle=nullptr; };
static void *paint_stroke_mode_data(PaintStroke *stroke){return stroke->mode_data;}
""" + PAINT_CALLBACK + r"""
struct TestMode : AbstractPaintMode {
  eWMOperatorIDUse result=eWMOperatorIDUse::Used;
  const Image *received_image=nullptr;
  eWMOperatorIDUse stroke_image_use(void *handle,const Image *image) const override {
    assert(handle==this);
    const_cast<TestMode *>(this)->received_image=image;
    return result;
  }
};
int main(){
  ID image,mesh;mesh.name[1]='E';wmOperator op;
  assert(paint_image_pencil_id_use(nullptr,&image)==eWMOperatorIDUse::Unknown);
  assert(paint_image_pencil_id_use(&op,&image)==eWMOperatorIDUse::Unknown);
  assert(paint_image_pencil_id_use(&op,&mesh)==eWMOperatorIDUse::Unknown);
  PaintStroke stroke;op.customdata=&stroke;
  assert(paint_image_pencil_id_use(&op,&image)==eWMOperatorIDUse::Unknown);
  TestMode mode;PaintOperation operation{&mode,&mode};stroke.mode_data=&operation;
  assert(paint_image_pencil_id_use(&op,&image)==eWMOperatorIDUse::Used);
  assert(mode.received_image==reinterpret_cast<const Image *>(&image));
  mode.result=eWMOperatorIDUse::NotUsed;
  assert(paint_image_pencil_id_use(&op,&image)==eWMOperatorIDUse::NotUsed);
  mode.result=eWMOperatorIDUse::Unknown;
  operation.mode=nullptr;
  assert(paint_image_pencil_id_use(&op,&image)==eWMOperatorIDUse::Unknown);
  operation.mode=&mode;operation.stroke_handle=nullptr;
  assert(paint_image_pencil_id_use(&op,&image)==eWMOperatorIDUse::Unknown);
}
"""


PROJECTION_CPP = r"""
#include <cassert>
#include <cstdint>
struct Image {};
struct ProjPaintImage { Image *ima=nullptr; };
struct ProjPaintState {
  Image *stencil_ima=nullptr, *canvas_ima=nullptr, *clone_ima=nullptr;
  Image *reproject_image=nullptr;
  int image_tot=0;
  ProjPaintImage *projImages=nullptr;
};
struct ProjStrokeHandle {
  bool is_clone_cursor_pick=false;
  int ps_views_tot=0;
  ProjPaintState *ps_views[8]{};
};
""" + PROJECTION_IMAGE_USE + r"""
int main(){
  Image target,other;
  bool known=false;
  assert(!paint_proj_stroke_uses_image(nullptr,&target,&known)&&!known);
  ProjStrokeHandle handle;
  assert(!paint_proj_stroke_uses_image(&handle,&target,&known)&&!known);
  handle.is_clone_cursor_pick=true;
  assert(!paint_proj_stroke_uses_image(&handle,&target,&known)&&known);
  handle.is_clone_cursor_pick=false;
  handle.ps_views_tot=1;
  ProjPaintState state;
  handle.ps_views[0]=&state;
  assert(!paint_proj_stroke_uses_image(&handle,&target,&known)&&known);
  state.stencil_ima=&target;
  assert(paint_proj_stroke_uses_image(&handle,&target,&known)&&known);
  state.stencil_ima=nullptr;state.canvas_ima=&target;
  assert(paint_proj_stroke_uses_image(&handle,&target,&known)&&known);
  state.canvas_ima=nullptr;state.clone_ima=&target;
  assert(paint_proj_stroke_uses_image(&handle,&target,&known)&&known);
  state.clone_ima=nullptr;state.reproject_image=&target;
  assert(paint_proj_stroke_uses_image(&handle,&target,&known)&&known);
  state.reproject_image=nullptr;
  ProjPaintImage images[2]{{&other},{&target}};
  state.image_tot=2;state.projImages=images;
  assert(paint_proj_stroke_uses_image(&handle,&target,&known)&&known);
  assert(paint_proj_stroke_uses_image(&handle,&other,&known)&&known);
  images[1].ima=&other;
  assert(!paint_proj_stroke_uses_image(&handle,&target,&known)&&known);
  handle.ps_views_tot=9;
  assert(!paint_proj_stroke_uses_image(&handle,&target,&known)&&!known);
  handle.ps_views_tot=1;handle.ps_views[0]=nullptr;
  assert(!paint_proj_stroke_uses_image(&handle,&target,&known)&&!known);
  handle.ps_views[0]=&state;state.image_tot=-1;
  assert(!paint_proj_stroke_uses_image(&handle,&target,&known)&&!known);
  state.image_tot=1;state.projImages=nullptr;
  assert(!paint_proj_stroke_uses_image(&handle,&target,&known)&&!known);
}
"""


WM_CPP = r"""
#include <cassert>
#include <cstdint>
struct ID { ID *next=nullptr; uint64_t session_uid=0; };
struct ListBase { void *first=nullptr; };
struct wmEventHandler { int type=0; wmEventHandler *next=nullptr; };
enum class eWMOperatorIDUse : uint8_t { Unknown, NotUsed, Used };
struct wmOperator;
struct wmOperatorType {
  eWMOperatorIDUse (*ipad_id_use)(const wmOperator *, const ID *)=nullptr;
  bool known=true;
  int image_count=0;
  const ID *images[4]{};
};
struct wmOperator { wmOperatorType *type=nullptr; };
struct wmEventHandler_Op : wmEventHandler {
  uint64_t ipad_pencil_paint_serial=0, ipad_pencil_operator_lifetime=0;
  int ipad_pencil_paint_mode=0;
  uint64_t ipad_pencil_owner_values[19]{};
  wmOperator *op=nullptr;
  bool registered=true;
};
struct wmWindow { wmWindow *next=nullptr; bool runtime=true; ListBase handlers,modalhandlers; };
struct wmWindowManager { wmWindowManager *next=nullptr; ListBase windows; };
struct Main { ListBase images,wm; };
struct bContext { Main *main=nullptr; wmWindowManager *wm=nullptr; wmWindow *win=nullptr; };
struct ScrArea {};
struct ARegion {};
static Main *G_MAIN=nullptr;
constexpr int WM_HANDLER_TYPE_OP=1, OB_MODE_TEXTURE_PAINT=8;
#define LISTBASE_FOREACH(type,item,list) \
  for(type item=static_cast<type>((list)->first);item;item=item->next)

bContext *CTX_create(){return new bContext{};}
void CTX_data_main_set(bContext *C,Main *main){C->main=main;}
void CTX_wm_manager_set(bContext *C,wmWindowManager *wm){C->wm=wm;}
void CTX_wm_window_set(bContext *C,wmWindow *win){C->win=win;}
void CTX_free(bContext *C){delete C;}
bool wm_ipad_pencil_paint_handler_registered(wmWindow *win,wmEventHandler_Op *handler){
  if(!win||!win->runtime||!handler||!handler->registered||!handler->op||!handler->op->type)return false;
  for(auto *item=static_cast<wmEventHandler*>(win->modalhandlers.first);item;item=item->next)
    if(item==handler)return true;
  return false;
}
static int teardown_calls=0;
static bool refuse_teardown=false,replace_main=false,delete_image=false,replace_owner=false;
static Main *replacement_main=nullptr;
static ID *target_image=nullptr;
static wmEventHandler_Op *replacement_handler=nullptr;
static void unlink_handler(ListBase &list,wmEventHandler *target){
  wmEventHandler *prev=nullptr,*item=static_cast<wmEventHandler*>(list.first);
  while(item&&item!=target){prev=item;item=item->next;}
  if(item){if(prev)prev->next=item->next;else list.first=item->next;item->next=nullptr;}
}
static void unlink_image(Main &main,ID *target){
  ID *prev=nullptr,*item=static_cast<ID*>(main.images.first);
  while(item&&item!=target){prev=item;item=item->next;}
  if(item){if(prev)prev->next=item->next;else main.images.first=item->next;item->next=nullptr;}
}
void WM_event_ipad_pencil_paint_owner_teardown(
    bContext *C,wmWindow *win,const ScrArea*,const ARegion*,uint64_t scene_uid,uint64_t object_uid){
  assert(C&&C->main==G_MAIN&&C->win==win&&scene_uid&&object_uid);
  ++teardown_calls;
  if(replace_main){G_MAIN=replacement_main;return;}
  if(delete_image){unlink_image(*C->main,target_image);return;}
  if(refuse_teardown)return;
  wmEventHandler_Op *matched=nullptr;
  for(auto *base=static_cast<wmEventHandler*>(win->modalhandlers.first);base;base=base->next){
    if(base->type!=WM_HANDLER_TYPE_OP)continue;
    auto *handler=reinterpret_cast<wmEventHandler_Op*>(base);
    if(handler->ipad_pencil_paint_serial&&handler->ipad_pencil_owner_values[6]==scene_uid&&
       handler->ipad_pencil_owner_values[7]==object_uid){matched=handler;break;}
  }
  if(!matched)return;
  unlink_handler(win->modalhandlers,matched);
  if(replace_owner){
    replace_owner=false;
    assert(replacement_handler);
    replacement_handler->type=WM_HANDLER_TYPE_OP;
    replacement_handler->ipad_pencil_paint_serial=2;
    replacement_handler->ipad_pencil_operator_lifetime=matched->ipad_pencil_operator_lifetime+1;
    replacement_handler->ipad_pencil_paint_mode=OB_MODE_TEXTURE_PAINT;
    replacement_handler->ipad_pencil_owner_values[6]=scene_uid;
    replacement_handler->ipad_pencil_owner_values[7]=object_uid;
    replacement_handler->ipad_pencil_owner_values[9]=OB_MODE_TEXTURE_PAINT;
    replacement_handler->op=matched->op;
    replacement_handler->next=static_cast<wmEventHandler*>(win->modalhandlers.first);
    win->modalhandlers.first=replacement_handler;
  }
}
""" + IMAGE_FIND + "\n" + IMAGE_TEARDOWN + r"""

static eWMOperatorIDUse image_set_use(const wmOperator *op,const ID *image){
  if(!op||!op->type||!op->type->known)return eWMOperatorIDUse::Unknown;
  for(int i=0;i<op->type->image_count;i++)if(op->type->images[i]==image)return eWMOperatorIDUse::Used;
  return eWMOperatorIDUse::NotUsed;
}

static void link_handler(wmWindow &win,wmEventHandler_Op &handler,uint64_t scene,uint64_t object,uint64_t lifetime){
  handler.type=WM_HANDLER_TYPE_OP;handler.ipad_pencil_paint_serial=1;
  handler.ipad_pencil_operator_lifetime=lifetime;handler.ipad_pencil_paint_mode=OB_MODE_TEXTURE_PAINT;
  handler.ipad_pencil_owner_values[6]=scene;handler.ipad_pencil_owner_values[7]=object;
  handler.ipad_pencil_owner_values[9]=OB_MODE_TEXTURE_PAINT;
  handler.next=static_cast<wmEventHandler*>(win.modalhandlers.first);win.modalhandlers.first=&handler;
}
static void reset(Main &main){
  G_MAIN=&main;teardown_calls=0;refuse_teardown=replace_main=delete_image=replace_owner=false;
  replacement_main=nullptr;target_image=nullptr;replacement_handler=nullptr;
}
int main(){
  {
    Main main;reset(main);ID image;image.session_uid=90;main.images.first=&image;target_image=&image;
    wmWindowManager manager;main.wm.first=&manager;wmWindow win;manager.windows.first=&win;
    wmOperatorType state;state.ipad_id_use=image_set_use;wmOperator op{&state};
    wmEventHandler_Op owner;owner.op=&op;link_handler(win,owner,10,20,30);
    assert(WM_event_ipad_pencil_paint_image_teardown(&main,90));
    assert(teardown_calls==0&&win.modalhandlers.first==&owner);
  }
  {
    Main main;reset(main);ID image;image.session_uid=91;main.images.first=&image;target_image=&image;
    wmWindowManager manager;main.wm.first=&manager;wmWindow win;manager.windows.first=&win;
    wmOperatorType state;state.ipad_id_use=image_set_use;state.images[0]=&image;state.image_count=1;wmOperator op{&state};
    wmEventHandler_Op owner;owner.op=&op;link_handler(win,owner,11,21,31);
    assert(WM_event_ipad_pencil_paint_image_teardown(&main,91));
    assert(teardown_calls==1&&!win.modalhandlers.first);
  }
  {
    Main main;reset(main);ID image;image.session_uid=92;main.images.first=&image;
    wmWindowManager manager;main.wm.first=&manager;wmWindow win;manager.windows.first=&win;
    wmOperatorType state;state.ipad_id_use=image_set_use;state.known=false;state.images[0]=&image;state.image_count=1;wmOperator op{&state};
    wmEventHandler_Op owner;owner.op=&op;link_handler(win,owner,12,22,32);
    assert(!WM_event_ipad_pencil_paint_image_teardown(&main,92));
    assert(teardown_calls==0&&win.modalhandlers.first==&owner);
  }
  {
    Main main;reset(main);ID image;image.session_uid=93;main.images.first=&image;
    wmWindowManager manager;main.wm.first=&manager;wmWindow win;manager.windows.first=&win;
    wmOperatorType state;state.ipad_id_use=image_set_use;state.images[0]=&image;state.image_count=1;wmOperator op{&state};
    wmEventHandler_Op owner;owner.op=&op;link_handler(win,owner,13,23,33);
    owner.next=nullptr;win.modalhandlers.first=nullptr;win.handlers.first=&owner;
    assert(!WM_event_ipad_pencil_paint_image_teardown(&main,93));
    assert(teardown_calls==0&&win.handlers.first==&owner);
  }
  {
    Main main;reset(main);ID image;image.session_uid=94;main.images.first=&image;target_image=&image;
    wmWindowManager manager;main.wm.first=&manager;wmWindow win;manager.windows.first=&win;
    wmOperatorType state;state.ipad_id_use=image_set_use;state.images[0]=&image;state.image_count=1;wmOperator op{&state};
    wmEventHandler_Op owner;owner.op=&op;link_handler(win,owner,14,24,34);
    refuse_teardown=true;
    assert(!WM_event_ipad_pencil_paint_image_teardown(&main,94));
    assert(teardown_calls==1&&win.modalhandlers.first==&owner);
  }
  {
    Main main;reset(main);ID image;image.session_uid=95;main.images.first=&image;target_image=&image;
    wmWindowManager manager;main.wm.first=&manager;wmWindow win;manager.windows.first=&win;
    wmOperatorType state;state.ipad_id_use=image_set_use;state.images[0]=&image;state.image_count=1;wmOperator op{&state};
    wmEventHandler_Op owner,replacement;owner.op=&op;link_handler(win,owner,15,25,35);
    replacement_handler=&replacement;replace_owner=true;
    assert(WM_event_ipad_pencil_paint_image_teardown(&main,95));
    assert(teardown_calls==2&&!win.modalhandlers.first);
  }
  {
    Main main,other;reset(main);ID image;image.session_uid=96;main.images.first=&image;target_image=&image;
    wmWindowManager manager;main.wm.first=&manager;wmWindow win;manager.windows.first=&win;
    wmOperatorType state;state.ipad_id_use=image_set_use;state.images[0]=&image;state.image_count=1;wmOperator op{&state};
    wmEventHandler_Op owner;owner.op=&op;link_handler(win,owner,16,26,36);
    replacement_main=&other;replace_main=true;
    assert(!WM_event_ipad_pencil_paint_image_teardown(&main,96));
    assert(teardown_calls==1&&G_MAIN==&other);
  }
  {
    Main main;reset(main);ID image;image.session_uid=97;main.images.first=&image;target_image=&image;
    wmWindowManager manager;main.wm.first=&manager;wmWindow win;manager.windows.first=&win;
    wmOperatorType state;state.ipad_id_use=image_set_use;state.images[0]=&image;state.image_count=1;wmOperator op{&state};
    wmEventHandler_Op owner;owner.op=&op;link_handler(win,owner,17,27,37);
    delete_image=true;
    assert(!WM_event_ipad_pencil_paint_image_teardown(&main,97));
    assert(teardown_calls==1&&!main.images.first);
  }
  {
    Main main;reset(main);ID image;image.session_uid=98;main.images.first=&image;
    wmWindowManager manager;main.wm.first=&manager;wmWindow win;manager.windows.first=&win;
    wmOperatorType image_state;image_state.ipad_id_use=image_set_use;
    image_state.images[0]=&image;image_state.image_count=1;wmOperator image_op{&image_state};
    wmOperatorType other_state;other_state.ipad_id_use=image_set_use;wmOperator other_op{&other_state};
    wmEventHandler_Op image_owner,other_owner;image_owner.op=&image_op;other_owner.op=&other_op;
    link_handler(win,image_owner,18,28,38);
    link_handler(win,other_owner,18,28,39);
    assert(!WM_event_ipad_pencil_paint_image_teardown(&main,98));
    assert(teardown_calls==0&&win.modalhandlers.first==&other_owner&&other_owner.next==&image_owner);
  }
}
"""


RNA_CPP = r"""
#include <cassert>
#include <cstdint>
constexpr int ID_IM=1, ID_ME=2, ID_TAG_NO_MAIN=4, RPT_ERROR=3;
static int active_idcode=ID_IM;
#define GS(name) (name[0]=='I'&&name[1]=='M'?ID_IM:ID_ME)
#define ID_REAL_USERS(id) ((id)->users)
struct ID { ID *next=nullptr;uint64_t session_uid=0;int tag=0,users=0;char name[66]="IMImage"; };
struct ListBase { void *first=nullptr; };
struct Main { ListBase images; };
struct ReportList { int errors=0; };
struct PointerRNA { void *data=nullptr;bool invalidated=false;void invalidate(){data=nullptr;invalidated=true;} };
static Main *G_MAIN=nullptr;
#define LISTBASE_FOREACH(type,item,list) \
  for(type item=static_cast<type>((list)->first);item;item=item->next)
void BKE_report(ReportList *reports,int,const char*){if(reports)++reports->errors;}
static bool allow_teardown=true,delete_during_teardown=false,replace_main=false;
static Main *replacement_main=nullptr;static ID *replacement_image=nullptr;
static int teardown_calls=0;
bool WM_event_ipad_pencil_paint_image_teardown(Main *main,uint64_t uid){
  ++teardown_calls;if(!allow_teardown)return false;
  if(replace_main){G_MAIN=replacement_main;return true;}
  ID *previous=nullptr,*item=static_cast<ID*>(main->images.first);
  while(item&&item->session_uid!=uid){previous=item;item=item->next;}
  if(!item)return false;
  if(delete_during_teardown){if(previous)previous->next=item->next;else main->images.first=item->next;return true;}
  if(replacement_image){replacement_image->session_uid=uid;replacement_image->next=item->next;
    if(previous)previous->next=replacement_image;else main->images.first=replacement_image;}
  return true;
}
""" + RNA_IMAGE_GUARD + r"""
static void reset(){allow_teardown=true;delete_during_teardown=replace_main=false;
  replacement_main=nullptr;replacement_image=nullptr;teardown_calls=0;active_idcode=ID_IM;}
int main(){
  {
    reset();Main main;G_MAIN=&main;ID image;image.session_uid=1;main.images.first=&image;
    PointerRNA ptr{&image};ReportList reports;replacement_image=new ID;
    assert(rna_Main_image_remove_guard(&main,&reports,&ptr,true));
    assert(teardown_calls==1&&ptr.data==replacement_image&&reports.errors==0);
    delete replacement_image;replacement_image=nullptr;
  }
  {
    reset();Main main;G_MAIN=&main;ID image;image.session_uid=2;image.users=4;
    main.images.first=&image;PointerRNA ptr{&image};ReportList reports;
    assert(rna_Main_image_remove_guard(&main,&reports,&ptr,false));
    assert(teardown_calls==0&&ptr.data==&image);
  }
  {
    reset();Main main,other;G_MAIN=&other;ID image;image.session_uid=3;
    PointerRNA ptr{&image};ReportList reports;
    assert(rna_Main_image_remove_guard(&main,&reports,&ptr,true)&&teardown_calls==0);
  }
  {
    reset();Main main;G_MAIN=&main;ID image;image.session_uid=4;image.tag=ID_TAG_NO_MAIN;
    PointerRNA ptr{&image};ReportList reports;
    assert(rna_Main_image_remove_guard(&main,&reports,&ptr,true)&&teardown_calls==0);
  }
  {
    reset();Main main;G_MAIN=&main;ID image;image.session_uid=5;image.name[1]='E';
    PointerRNA ptr{&image};ReportList reports;
    assert(rna_Main_image_remove_guard(&main,&reports,&ptr,true)&&teardown_calls==0);
  }
  {
    reset();Main main;G_MAIN=&main;ID image;image.session_uid=6;main.images.first=&image;
    PointerRNA ptr{&image};ReportList reports;allow_teardown=false;
    assert(!rna_Main_image_remove_guard(&main,&reports,&ptr,true));
    assert(teardown_calls==1&&!ptr.invalidated&&ptr.data==&image&&reports.errors==1);
  }
  {
    reset();Main main;G_MAIN=&main;ID image;image.session_uid=7;main.images.first=&image;
    PointerRNA ptr{&image};ReportList reports;delete_during_teardown=true;
    assert(!rna_Main_image_remove_guard(&main,&reports,&ptr,true));
    assert(ptr.invalidated&&!ptr.data&&reports.errors==0);
  }
  {
    reset();Main main,other;G_MAIN=&main;ID image;image.session_uid=8;main.images.first=&image;
    PointerRNA ptr{&image};ReportList reports;replacement_main=&other;replace_main=true;
    assert(!rna_Main_image_remove_guard(&main,&reports,&ptr,true));
    assert(ptr.invalidated&&!ptr.data&&reports.errors==0);
  }
}
"""


class PencilPaintImageRemoveTests(unittest.TestCase):
    def test_projection_paint_compares_every_native_image_reference(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(PROJECTION_CPP)

    def test_texture_paint_owner_scan_retires_only_proved_image_users(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(WM_CPP)

    def test_rna_image_guard_reacquires_after_native_callbacks(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(RNA_CPP)

    def test_generic_rna_remove_calls_image_guard_before_unlink(self):
        callsite = RNA_SOURCE[RNA_SOURCE.index("static void rna_Main_ID_remove("):]
        brush = callsite.index("rna_Main_brush_remove_guard")
        image = callsite.index("rna_Main_image_remove_guard")
        mesh = callsite.index("rna_Main_mesh_remove_guard")
        object_guard = callsite.index("rna_Main_object_remove_guard")
        unlink = callsite.index("if (do_unlink) {")
        self.assertLess(brush, image)
        self.assertLess(image, mesh)
        self.assertLess(mesh, object_guard)
        self.assertLess(object_guard, unlink)
        self.assertLess(mesh, unlink)

    def test_operator_type_callback_survives_python_wrapper_copy(self):
        wrapper = changed_source(WRAPPER_PATH)
        self.assertIn("const auto ipad_id_use = ot->ipad_id_use;", wrapper)
        self.assertIn("ot->ipad_id_use = ipad_id_use;", wrapper)
        self.assertIn("ot->ipad_id_use = paint_image_pencil_id_use;", PAINT_SOURCE)

    def test_paint_operator_image_callback_is_typed_and_fails_closed(self):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(PAINT_CALLBACK_CPP)
        self.assertIn("return eWMOperatorIDUse::Unknown;", PAINT_SOURCE)


if __name__ == "__main__":
    unittest.main()
