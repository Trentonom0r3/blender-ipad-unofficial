
#include <cassert>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <string>
#include <memory>
#include <optional>
#include <variant>
#include <vector>
#define WITH_APPLE_CROSSPLATFORM

struct Link { Link *next=nullptr; };
struct ListBase { Link *first=nullptr; };
#define LISTBASE_FOREACH(type, item, list) \
  for (type item=static_cast<type>((list)->first); item; \
       item=static_cast<type>(reinterpret_cast<Link *>(item)->next))
#define NDEBUG
#define BLI_assert(value) assert(value)
#define OB_DATA_SUPPORT_ID(value) true
#define GS(name) static_cast<short>((static_cast<unsigned char>((name)[0]) << 8) | \
                                    static_cast<unsigned char>((name)[1]))

struct ID : Link {
  uint64_t session_uid=0;
  uint32_t tag=0;int flag=0;
  char name[64]{};
  int users=0;
};
struct Object : Link { ID id; int type=0; int mode=0; ID *data=nullptr; };
struct Mesh : ID {};
struct bArmature : ID {};
struct wmEventHandler : Link { int type=0; };
struct wmEventHandler_Op : wmEventHandler {
  uint64_t ipad_pencil_paint_serial=0;
  uint64_t ipad_pencil_operator_lifetime=0;
  uint64_t ipad_pencil_owner_values[19]{};
  bool registered=true;
};
struct wmWindow : Link { int winid=0; void *runtime=reinterpret_cast<void *>(1); ListBase handlers,modalhandlers; };
struct wmWindowManager : Link { ID id; ListBase windows; };
struct Main { ListBase objects,meshes,wm; };
struct bContext { Main *main=nullptr; wmWindowManager *wm=nullptr; wmWindow *win=nullptr; };

struct StructRNA {const char *identifier;bool id=false;StructRNA *base=nullptr;};
static StructRNA RNA_ID{"ID",true},RNA_Object{"Object",true,&RNA_ID},RNA_Mesh{"Mesh",true,&RNA_ID};
static StructRNA RNA_Material{"Material",true,&RNA_ID};
struct PointerRNA {void *data=nullptr;ID *owner_id=nullptr;StructRNA *type=nullptr;
 PointerRNA(void *value=nullptr):data(value){}
 template<class T>T *data_as()const{return static_cast<T*>(data);}
};
static PointerRNA PointerRNA_NULL{};
struct Scene {};
struct ReportList;
enum {PROP_POINTER=1,PROP_ID_REFCOUNT=2,PROP_NEVER_NULL=4,PROP_ID_SELF_CHECK=8,PROP_EDITABLE=16,
 RNA_MAGIC=123,RPT_STORE=4,IDP_ID=1,IDP_GROUP=2,IDP_FLAG_STATIC_TYPE=4,ID_FLAG_EMBEDDED_DATA=8};
struct PropertyRNA {int magic=RNA_MAGIC,type=PROP_POINTER,flag=PROP_ID_REFCOUNT;const char *identifier="data";};
struct PointerPropertyRNA:PropertyRNA {
 StructRNA *type=&RNA_Mesh;PointerRNA(*get)(PointerRNA*)=nullptr;
 void(*set)(PointerRNA*,PointerRNA,ReportList*)=nullptr;
};
struct IDProperty {int type=IDP_ID;const char *name="idprop";};

struct ReportList { std::string message; };
static constexpr int RPT_ERROR=2;
static void rna_Object_data_set(PointerRNA *,PointerRNA,ReportList *);
static Main *G_MAIN=nullptr;
constexpr int WM_HANDLER_TYPE_OP=7, OB_MODE_EDIT=1, OB_EMPTY=99, OB_MESH=1, OB_ARMATURE=2;
constexpr int ID_TAG_NO_MAIN=1;
constexpr short ID_ME=static_cast<short>('M'<<8|'E');
constexpr short ID_IM=static_cast<short>('I'<<8|'M');
constexpr short ID_CU_LEGACY=static_cast<short>('C'<<8|'U');

static void append(ListBase &list,Link *item) { item->next=list.first; list.first=item; }
static void unlink(ListBase &list,Link *target) {
  Link *prior=nullptr,*item=list.first;
  while(item&&item!=target){prior=item;item=item->next;}
  if(!item)return;
  if(prior)prior->next=item->next;else list.first=item->next;
  item->next=nullptr;
}
static ListBase *which_libbase(Main *main,short idcode) {
  if(idcode==static_cast<short>('O'<<8|'B'))return &main->objects;
  if(idcode==ID_ME)return &main->meshes;
  return nullptr;
}
static bContext *CTX_create(){return new bContext{};}
static void CTX_data_main_set(bContext *C,Main *main){C->main=main;}
static void CTX_wm_manager_set(bContext *C,wmWindowManager *wm){C->wm=wm;}
static void CTX_wm_window_set(bContext *C,wmWindow *win){C->win=win;}
static void CTX_free(bContext *C){delete C;}
static void (*g_probe_hook)()=nullptr;
static bool refuse_native_teardown=false,replace_main_on_teardown=false;
static bool mutate_data_on_teardown=false,reenter_setter_on_teardown=false;
static int teardown_calls=0,assign_calls=0,mutation_order=0;
static Main replacement_main;
static Object *target_object=nullptr;
static ID *side_data=nullptr;
static std::string inner_report;
static bool owner_registered_in(const wmWindow *win,const wmEventHandler_Op *target) {
  for(Link *item=win->modalhandlers.first;item;item=item->next)if(item==target)return true;
  return false;
}
static bool wm_ipad_pencil_paint_handler_registered(wmWindow *win,wmEventHandler_Op *handler) {
  return win&&handler&&handler->registered&&owner_registered_in(win,handler);
}
static bool WM_event_ipad_pencil_paint_owner_teardown(
    bContext *C,wmWindow *win,const void *,const void *,uint64_t scene_uid,
    uint64_t object_uid,uint64_t) {
  assert(C&&C->main==G_MAIN&&C->wm&&C->win==win);
  ++teardown_calls;mutation_order=mutation_order*10+1;
  if(refuse_native_teardown)return false;
  for(Link *item=win->modalhandlers.first;item;) {
    Link *next=item->next;
    if(reinterpret_cast<wmEventHandler *>(item)->type==WM_HANDLER_TYPE_OP) {
      auto *op=reinterpret_cast<wmEventHandler_Op *>(item);
      if(op->ipad_pencil_paint_serial&&op->ipad_pencil_owner_values[7]==object_uid&&
         (!scene_uid||op->ipad_pencil_owner_values[6]==scene_uid))unlink(win->modalhandlers,item);
    }
    item=next;
  }
  if(reenter_setter_on_teardown) {
    reenter_setter_on_teardown=false;
    ReportList reports;
    PointerRNA ptr{target_object}; PointerRNA value{side_data};
    rna_Object_data_set(&ptr,value,&reports);
    inner_report=reports.message;
  }
  if(mutate_data_on_teardown)target_object->data=side_data;
  if(replace_main_on_teardown)G_MAIN=&replacement_main;
  if(g_probe_hook)g_probe_hook();
  return true;
}
static void BKE_report(ReportList *reports,int,const char *message) { if(reports)reports->message=message; }
static void id_us_min(ID *id){if(id)--id->users;}
static void id_us_plus(ID *id){if(id)++id->users;}
static void BKE_mesh_assign_object(Main *,Object *object,Mesh *mesh) {
  ++assign_calls;mutation_order=mutation_order*10+2;
  if(object->data)id_us_min(object->data);
  id_us_plus(mesh);
  object->data=mesh;
}
static void BKE_object_materials_sync_length(Main *,Object *,ID *){}
static void BKE_curve_type_test(Object *,bool){}
static void BKE_pose_rebuild(Main *,Object *,bArmature *,bool){}



#define BLI_assert_msg(value,message) assert(value)
template<class T,class...R>static bool fixture_elem(T value,R...other){return((value==other)||...);}
#define ELEM(value,...) fixture_elem(value,__VA_ARGS__)
static Object *g_removed_object=nullptr;static ID *g_removed_data=nullptr;static PointerRNA *g_dead_wrapper=nullptr;
static int g_stale_object_getters=0,g_stale_data_getters=0,g_stale_wrapper_getters=0,g_stale_refcounts=0;
static int g_getters=0,g_refcounts=0,g_late_updates=0,g_stale_owner_tags=0,g_stale_wrapper_updates=0,g_update_context_changes=0;
static int g_tags=0,g_relations=0,g_notifiers=0,g_material_boundary_calls=0;
static bContext *g_original_context=nullptr;
static bool RNA_struct_is_a(const StructRNA *type,const StructRNA *base){while(type){if(type==base)return true;type=type->base;}return false;}
static bool RNA_struct_is_ID(const StructRNA *type){return type&&type->id;}
static PropertyRNA *rna_ensure_property(PropertyRNA *prop){return prop;}
static int RNA_property_type(PropertyRNA *prop){return prop->type;}
static IDProperty *rna_idproperty_check(PropertyRNA**,PointerRNA*){return nullptr;}
static StructRNA *RNA_property_pointer_type(PointerRNA*,PropertyRNA *prop){return static_cast<PointerPropertyRNA*>(prop)->type;}
static IDProperty *RNA_struct_system_idprops(PointerRNA*,bool){return nullptr;}
static void IDP_AssignID(IDProperty*,ID*,int){assert(false);}
static void rna_idproperty_touch(IDProperty*){assert(false);}
static void IDP_ReplaceInGroup_ex(IDProperty*,IDProperty*,IDProperty*,int){assert(false);}
static void IDP_ReplaceInGroup(IDProperty*,IDProperty*){assert(false);}
namespace blender::bke::idprop {static std::unique_ptr<IDProperty> create(const char*,ID*,int){assert(false);return {};}}
static void BKE_reportf(ReportList *reports,int,const char *message,...){if(reports)reports->message=message;}
static int fixture_refcount(const ID *id){++g_refcounts;if(id==g_removed_data)++g_stale_refcounts;return id->users;}
#define ID_REFCOUNTING_USERS(id) fixture_refcount(id)
static Mesh *BKE_mesh_wrapper_ensure_subdivision(Mesh *mesh){if(mesh==g_removed_data)++g_stale_data_getters;return mesh;}
static PointerRNA RNA_id_pointer_create(ID *id){PointerRNA ptr{id};ptr.owner_id=id;ptr.type=id?&RNA_Mesh:nullptr;return ptr;}
static bool WM_event_ipad_pencil_paint_owner_teardown_next(bContext*,Main*,bool*){++g_material_boundary_calls;assert(false);return false;}
static bool RNA_object_material_assign_paint_owner_teardown(bContext*,PointerRNA*,PointerRNA,bool,ReportList*){++g_material_boundary_calls;assert(false);return false;}
void Object_active_material_set(PointerRNA*,PointerRNA,ReportList*){assert(false);}
void MaterialSlot_material_set(PointerRNA*,PointerRNA,ReportList*){assert(false);}
enum {ID_RECALC_GEOMETRY=16,NC_OBJECT=32,ND_DRAW=64};
static void DEG_id_tag_update(ID *id,int){++g_tags;if(g_removed_object&&id==&g_removed_object->id)++g_stale_owner_tags;}
static void DEG_relations_tag_update(Main*){++g_relations;}
static void WM_main_add_notifier(int,void*){++g_notifiers;}

#ifdef WITH_APPLE_CROSSPLATFORM
static Object *rna_Object_main_find_by_uid(Main *bmain, const uint64_t session_uid)
{
  if (!bmain || !session_uid) return nullptr;
  Object *found = nullptr;
  LISTBASE_FOREACH (Object *, candidate, &bmain->objects) {
    if (candidate->id.session_uid != session_uid) continue;
    if (found) return nullptr;
    found = candidate;
  }
  return found;
}

static bool rna_Object_main_contains_pointer(Main *bmain, const Object *object)
{
  if (!bmain || !object) return false;
  LISTBASE_FOREACH (Object *, candidate, &bmain->objects) {
    if (candidate == object) return true;
  }
  return false;
}

static ID *rna_Object_data_main_find_by_uid(Main *bmain,
                                            const short idcode,
                                            const uint64_t session_uid)
{
  if (!bmain || !session_uid) return nullptr;
  ListBase *ids = which_libbase(bmain, idcode);
  if (!ids) return nullptr;
  ID *found = nullptr;
  LISTBASE_FOREACH (ID *, candidate, ids) {
    if (candidate->session_uid != session_uid) continue;
    if (found) return nullptr;
    found = candidate;
  }
  return found;
}

static thread_local bool rna_object_data_pencil_teardown_in_progress = false;
#endif

static bool wm_ipad_pencil_paint_object_uid_teardown(Main *bmain, const uint64_t object_uid)
{
  if (!bmain || G_MAIN != bmain || !object_uid) return false;
  int object_matches = 0;
  LISTBASE_FOREACH (Object *, object, &bmain->objects) {
    object_matches += object->id.session_uid == object_uid;
  }
  if (object_matches != 1) return false;

  for (int attempt = 0; attempt < 256; attempt++) {
    if (G_MAIN != bmain) return false;
    uintptr_t owner_wm_identity = 0;
    uintptr_t owner_win_identity = 0;
    uint64_t owner_wm_uid = 0;
    int owner_winid = 0;
    bool refused = false;

    LISTBASE_FOREACH (wmWindowManager *, wm, &bmain->wm) {
      LISTBASE_FOREACH (wmWindow *, win, &wm->windows) {
        auto inspect = [&](ListBase *handlers, const bool modal) {
          LISTBASE_FOREACH (wmEventHandler *, base, handlers) {
            if (base->type != WM_HANDLER_TYPE_OP) continue;
            const auto *handler = reinterpret_cast<const wmEventHandler_Op *>(base);
            if (!handler->ipad_pencil_paint_serial ||
                handler->ipad_pencil_owner_values[7] != object_uid)
            {
              continue;
            }
            if (!modal || !win->runtime || !handler->ipad_pencil_owner_values[6] ||
                !handler->ipad_pencil_operator_lifetime ||
                !wm_ipad_pencil_paint_handler_registered(
                    win, const_cast<wmEventHandler_Op *>(handler)))
            {
              refused = true;
              return;
            }
            if (!owner_win_identity) {
              owner_wm_identity = uintptr_t(wm);
              owner_win_identity = uintptr_t(win);
              owner_wm_uid = wm->id.session_uid;
              owner_winid = win->winid;
            }
          }
        };
        inspect(&win->handlers, false);
        if (refused) return false;
        inspect(&win->modalhandlers, true);
        if (refused) return false;
      }
    }
    if (!owner_win_identity) return G_MAIN == bmain;
    if (!owner_wm_uid || !owner_winid) return false;

    wmWindowManager *owner_wm = nullptr;
    wmWindow *owner_win = nullptr;
    LISTBASE_FOREACH (wmWindowManager *, wm, &bmain->wm) {
      if (uintptr_t(wm) != owner_wm_identity || wm->id.session_uid != owner_wm_uid) continue;
      LISTBASE_FOREACH (wmWindow *, win, &wm->windows) {
        if (uintptr_t(win) == owner_win_identity && win->winid == owner_winid) {
          owner_wm = wm;
          owner_win = win;
          break;
        }
      }
      break;
    }
    if (!owner_wm || !owner_win || !owner_win->runtime) return false;

    bContext *owner_C = CTX_create();
    if (!owner_C) return false;
    CTX_data_main_set(owner_C, bmain);
    CTX_wm_manager_set(owner_C, owner_wm);
    CTX_wm_window_set(owner_C, owner_win);
    const bool teardown_succeeded = WM_event_ipad_pencil_paint_owner_teardown(
        owner_C, owner_win, nullptr, nullptr, 0, object_uid, 0);
    CTX_free(owner_C);
    if (!teardown_succeeded || G_MAIN != bmain) return false;

    bool owner_window_still_live = false;
    LISTBASE_FOREACH (wmWindowManager *, wm, &bmain->wm) {
      if (uintptr_t(wm) != owner_wm_identity || wm->id.session_uid != owner_wm_uid) continue;
      LISTBASE_FOREACH (wmWindow *, win, &wm->windows) {
        if (uintptr_t(win) == owner_win_identity && win->winid == owner_winid) {
          owner_window_still_live = true;
          LISTBASE_FOREACH (wmEventHandler *, base, &win->modalhandlers) {
            if (base->type != WM_HANDLER_TYPE_OP) continue;
            const auto *handler = reinterpret_cast<const wmEventHandler_Op *>(base);
            if (handler->ipad_pencil_paint_serial &&
                handler->ipad_pencil_owner_values[7] == object_uid)
            {
              return false;
            }
          }
          LISTBASE_FOREACH (wmEventHandler *, base, &win->handlers) {
            if (base->type != WM_HANDLER_TYPE_OP) continue;
            const auto *handler = reinterpret_cast<const wmEventHandler_Op *>(base);
            if (handler->ipad_pencil_paint_serial &&
                handler->ipad_pencil_owner_values[7] == object_uid)
            {
              return false;
            }
          }
          break;
        }
      }
      break;
    }
    if (!owner_window_still_live) return false;
  }
  return false;
}
bool WM_event_ipad_pencil_paint_object_teardown(Main *bmain, const uint64_t object_uid)
{
  return wm_ipad_pencil_paint_object_uid_teardown(bmain, object_uid);
}
static void rna_Object_data_set(PointerRNA *ptr, PointerRNA value, ReportList *reports)
{
  Object *ob = static_cast<Object *>(ptr->data);
  ID *id = static_cast<ID *>(value.data);

#ifdef WITH_APPLE_CROSSPLATFORM
  Main *owner_main = G_MAIN;
  const uint64_t object_uid = ob->id.session_uid;
  const bool object_is_in_main = owner_main && rna_Object_main_contains_pointer(owner_main, ob);
  if (!(ob->mode & OB_MODE_EDIT) && id != static_cast<ID *>(ob->data) && object_is_in_main) {
    if (!object_uid || rna_Object_main_find_by_uid(owner_main, object_uid) != ob) {
      BKE_report(reports, RPT_ERROR, "Active Pencil paint refused ambiguous object identity");
      return;
    }
    if (rna_object_data_pencil_teardown_in_progress) {
      BKE_report(reports, RPT_ERROR, "Active Pencil paint prevented re-entrant object data change");
      return;
    }
    const int object_type = ob->type;
    const int object_mode = ob->mode;
    ID *old_data = static_cast<ID *>(ob->data);
    const short old_data_idcode = old_data ? GS(old_data->name) : 0;
    const uint64_t old_data_uid = old_data ? old_data->session_uid : 0;
    const short new_data_idcode = id ? GS(id->name) : 0;
    const uint64_t new_data_uid = id ? id->session_uid : 0;
    if ((old_data && ((old_data->tag & ID_TAG_NO_MAIN) || !old_data_uid)) ||
        (id && ((id->tag & ID_TAG_NO_MAIN) || !new_data_uid)))
    {
      BKE_report(reports, RPT_ERROR, "Active Pencil paint prevented unsafe object data change");
      return;
    }
    if (old_data &&
        rna_Object_data_main_find_by_uid(owner_main, old_data_idcode, old_data_uid) != old_data)
    {
      BKE_report(reports, RPT_ERROR, "Active Pencil paint prevented stale object data change");
      return;
    }

    struct ReentrancyGuard {
      ReentrancyGuard() { rna_object_data_pencil_teardown_in_progress = true; }
      ~ReentrancyGuard() { rna_object_data_pencil_teardown_in_progress = false; }
    } reentrancy_guard;
    if (!WM_event_ipad_pencil_paint_object_teardown(owner_main, object_uid) ||
        G_MAIN != owner_main)
    {
      BKE_report(reports, RPT_ERROR, "Active Pencil paint prevented safe object data change");
      return;
    }

    Object *live_object = rna_Object_main_find_by_uid(owner_main, object_uid);
    ID *live_old_data = old_data ?
                            rna_Object_data_main_find_by_uid(
                                owner_main, old_data_idcode, old_data_uid) :
                            nullptr;
    ID *live_new_data = id ?
                            rna_Object_data_main_find_by_uid(
                                owner_main, new_data_idcode, new_data_uid) :
                            nullptr;
    if (G_MAIN != owner_main || live_object != ob || !live_object ||
        live_object->id.session_uid != object_uid || live_object->type != object_type ||
        live_object->mode != object_mode || live_object->data != old_data ||
        (old_data && live_old_data != old_data) || (id && live_new_data != id))
    {
      BKE_report(reports, RPT_ERROR, "Active Pencil paint refused changed object data context");
      return;
    }
    ob = live_object;
    id = live_new_data;
  }
#endif


  if (ob->mode & OB_MODE_EDIT) {
    return;
  }

  /* assigning nullptr only for empties */
  if ((id == nullptr) && (ob->type != OB_EMPTY)) {
    return;
  }

  if (id && ((id->tag & ID_TAG_NO_MAIN) != (ob->id.tag & ID_TAG_NO_MAIN))) {
    BKE_report(reports,
               RPT_ERROR,
               "Can only assign evaluated data to evaluated object, or original data to "
               "original object");
    return;
  }

  if (ob->type == OB_EMPTY) {
    if (ob->data) {
      id_us_min(static_cast<ID *>(ob->data));
      ob->data = nullptr;
    }

    if (!id || GS(id->name) == ID_IM) {
      id_us_plus(id);
      ob->data = id;
    }
  }
  else if (ob->type == OB_MESH) {
    BKE_mesh_assign_object(G_MAIN, ob, reinterpret_cast<Mesh *>(id));
  }
  else {
    if (ob->data) {
      id_us_min(static_cast<ID *>(ob->data));
    }

    /* no need to type-check here ID. this is done in the _typef() function */
    BLI_assert(OB_DATA_SUPPORT_ID(GS(id->name)));
    id_us_plus(id);

    ob->data = id;
    BKE_object_materials_sync_length(G_MAIN, ob, id);

    if (GS(id->name) == ID_CU_LEGACY) {
      BKE_curve_type_test(ob, true);
    }
    else if (ob->type == OB_ARMATURE) {
      BKE_pose_rebuild(G_MAIN, ob, static_cast<bArmature *>(ob->data), true);
    }
  }
}
static PointerRNA rna_Object_data_get(PointerRNA *ptr)
{
  Object *ob = static_cast<Object *>(ptr->data);
  if (ob->type == OB_MESH) {
    Mesh *mesh = static_cast<Mesh *>(ob->data);
    mesh = BKE_mesh_wrapper_ensure_subdivision(mesh);
    return RNA_id_pointer_create(reinterpret_cast<ID *>(mesh));
  }
  return RNA_id_pointer_create(reinterpret_cast<ID *>(ob->data));
}
#ifdef WITH_APPLE_CROSSPLATFORM
extern void Object_active_material_set(PointerRNA *, PointerRNA, ReportList *);
extern void MaterialSlot_material_set(PointerRNA *, PointerRNA, ReportList *);

static int rna_material_assignment_profile(PropertyRNA *prop)
{
  if (!prop || prop->magic != RNA_MAGIC || prop->type != PROP_POINTER) return 0;
  const PointerPropertyRNA *pprop = reinterpret_cast<PointerPropertyRNA *>(prop);
  if (pprop->set == Object_active_material_set) return 1;
  if (pprop->set == MaterialSlot_material_set) return 2;
  return 0;
}

static bool rna_material_assignment_owner_absent(PropertyRNA *prop, ReportList *reports)
{
  if (!rna_material_assignment_profile(prop)) return true;
  if (G_MAIN &&
      WM_event_ipad_pencil_paint_owner_teardown_next(nullptr, G_MAIN, nullptr))
  {
    return true;
  }
  if (reports) BKE_report(reports, RPT_ERROR, "Material assignment was refused while a Pencil paint owner is active");
  return false;
}
#endif

bool RNA_property_is_material_assignment(PropertyRNA *prop)
{
#ifdef WITH_APPLE_CROSSPLATFORM
  return rna_material_assignment_profile(rna_ensure_property(prop)) != 0;
#else
  UNUSED_VARS(prop);
  return false;
#endif
}

bool RNA_property_material_assign_paint_owner_teardown(bContext *C,
                                                       PointerRNA *ptr,
                                                       PropertyRNA *prop,
                                                       PointerRNA value,
                                                       ReportList *reports)
{
#ifdef WITH_APPLE_CROSSPLATFORM
  const int profile = rna_material_assignment_profile(rna_ensure_property(prop));
  if (profile) {
    return RNA_object_material_assign_paint_owner_teardown(
        C, ptr, value, profile == 2, reports);
  }
#else
  UNUSED_VARS(C, ptr, prop, value, reports);
#endif
  return true;
}


void RNA_property_pointer_set(PointerRNA *ptr,
                              PropertyRNA *prop,
                              PointerRNA ptr_value,
                              ReportList *reports)
{
  /* Detect IDProperty and retrieve the actual PropertyRNA pointer before cast. */
  IDProperty *idprop = rna_idproperty_check(&prop, ptr);

  PointerPropertyRNA *pprop = (PointerPropertyRNA *)prop;
  BLI_assert(RNA_property_type(prop) == PROP_POINTER);

  /* This is a 'real' RNA property, not an IDProperty or a dynamic RNA property using an IDProperty
   * as backend storage. */
  if (pprop->set) {
    if (ptr_value.type != nullptr && !RNA_struct_is_a(ptr_value.type, pprop->type)) {
      BKE_reportf(reports,
                  RPT_ERROR,
                  "%s: expected %s type, not %s",
                  __func__,
                  pprop->type->identifier,
                  ptr_value.type->identifier);
      return;
    }

#ifdef WITH_APPLE_CROSSPLATFORM
    /* Borrowed native UI frames do not own a callback boundary. Refuse before
     * Debug getters retain old/new IDs; Python explicitly prepares beforehand. */
    if (!rna_material_assignment_owner_absent(prop, reports)) return;
#endif

#ifndef NDEBUG
    /* NOTE: By design, it can be safely assumed that both old and new ID pointers are valid when
     * accessed through RNA. Handling of invalid ID pointers, e.g. freed ones etc., should never
     * happen through RNA code, but directly on underlying (DNA) data.
     *
     * Setters are also not expected to free or otherwise invalidate ID pointers. So storing them
     * here should be safe. */
    BLI_assert(pprop->get);
    const bool is_id_refcounting = (prop->flag & PROP_ID_REFCOUNT) != 0;

    const PointerRNA old_id_ptr = pprop->get(ptr);
    BLI_assert_msg(!is_id_refcounting || !old_id_ptr.data || RNA_struct_is_ID(old_id_ptr.type),
                   "If the property is tagged with ID reference-counting, "
                   "its current value should be null or an ID");
    const ID *old_id = (old_id_ptr.type && RNA_struct_is_ID(old_id_ptr.type)) ?
                           old_id_ptr.data_as<ID>() :
                           nullptr;
    const int old_id_old_refcount = old_id ? ID_REFCOUNTING_USERS(old_id) : 0;

    const ID *new_id = (ptr_value.type && RNA_struct_is_ID(ptr_value.type)) ?
                           ptr_value.data_as<ID>() :
                           nullptr;
    const int new_id_old_refcount = new_id ? ID_REFCOUNTING_USERS(new_id) : 0;
#endif

    if (!((prop->flag & PROP_NEVER_NULL) && ptr_value.data == nullptr) &&
        !((prop->flag & PROP_ID_SELF_CHECK) && ptr->owner_id == ptr_value.owner_id))
    {
      pprop->set(ptr, ptr_value, reports);
    }

#ifndef NDEBUG
    /* NOTE: Current checks are relatively flexible, but do expect 'reasonable' behavior (ID
     * handling) from custom setters.
     *
     * Should there be some very uncommon setter behavior, e.g. unassigning an ID from the property
     * automatically assigning it to several other reference-counting usages, this will have to be
     * tweaked, e.g. by adding a special 'skip checks' flag to such RNA properties. */
    PointerRNA current_id_ptr = pprop->get(ptr);
    BLI_assert_msg(
        !is_id_refcounting || !current_id_ptr.data || RNA_struct_is_ID(current_id_ptr.type),
        "If the property is tagged with ID reference-counting, its current value should be "
        "null or an ID");
    ID *current_id = (current_id_ptr.type && RNA_struct_is_ID(current_id_ptr.type)) ?
                         static_cast<ID *>(current_id_ptr.data) :
                         nullptr;

    if (old_id) {
      const int old_id_new_refcount = ID_REFCOUNTING_USERS(old_id);
      if (ELEM(old_id, new_id, current_id)) {
        BLI_assert_msg(old_id_new_refcount == old_id_old_refcount,
                       "Reassigning the same ID to a RNA pointer property, or assignment failure, "
                       "should not modify the original ID user-count");
      }
      else if (is_id_refcounting) {
        BLI_assert_msg(
            old_id_new_refcount < old_id_old_refcount,
            "Unassigning an ID from a reference-counting RNA pointer property should decrease "
            "its user-count");
      }
      else {
        BLI_assert_msg(
            old_id_new_refcount == old_id_old_refcount,
            "Unassigning an ID from a non-reference-counting RNA pointer property should not "
            "modify its user-count");
      }
    }
    if (new_id && new_id != old_id) {
      const int new_id_new_refcount = ID_REFCOUNTING_USERS(new_id);
      if (current_id == old_id) {
        BLI_assert_msg(new_id_new_refcount == new_id_old_refcount,
                       "Failed assigning a new ID to a RNA pointer property, should not modify "
                       "the new ID user-count");
      }
      else if (is_id_refcounting) {
        BLI_assert_msg(
            new_id_new_refcount > new_id_old_refcount,
            "Assigning an ID to a reference-counting RNA pointer property should increase "
            "its user-count");
      }
      else {
        BLI_assert_msg(
            new_id_new_refcount == new_id_old_refcount,
            "Assigning an ID to a non-reference-counting RNA pointer property should not "
            "modify its user-count");
      }
    }
#endif

    return;
  }

  /* Assigning to an IDProperty. */
  ID *value = static_cast<ID *>(ptr_value.data);

  if (ptr_value.type != nullptr && !RNA_struct_is_a(ptr_value.type, &RNA_ID)) {
    BKE_reportf(
        reports, RPT_ERROR, "%s: expected ID type, not %s", __func__, ptr_value.type->identifier);
    return;
  }
  if (value && (value->flag & ID_FLAG_EMBEDDED_DATA) != 0) {
    BKE_reportf(reports, RPT_ERROR, "%s: cannot assign an embedded ID to an IDProperty", __func__);
    return;
  }

  /* We got an existing IDProperty. */
  if (idprop != nullptr) {
    /* Not-yet-defined ID IDProps have an IDP_GROUP type, not an IDP_ID one - because of reasons?
     * XXX This has to be investigated fully - there might be a good reason for it, but off hands
     * this seems really weird... */
    if (idprop->type == IDP_ID) {
      IDP_AssignID(idprop, value, 0);
      rna_idproperty_touch(idprop);
    }
    else {
      BLI_assert(idprop->type == IDP_GROUP);
      IDProperty *group = RNA_struct_system_idprops(ptr, true);
      BLI_assert(group != nullptr);

      IDP_ReplaceInGroup_ex(
          group,
          blender::bke::idprop::create(idprop->name, value, IDP_FLAG_STATIC_TYPE).release(),
          idprop,
          0);
    }
  }
  /* IDProperty disguised as RNA property (and not yet defined in ptr). */
  else if (prop->flag & PROP_EDITABLE) {
    if (IDProperty *group = RNA_struct_system_idprops(ptr, true)) {
      IDP_ReplaceInGroup(
          group,
          blender::bke::idprop::create(prop->identifier, value, IDP_FLAG_STATIC_TYPE).release());
    }
  }
}
void rna_Object_internal_update_data_impl(PointerRNA *ptr)
{
  DEG_id_tag_update(ptr->owner_id, ID_RECALC_GEOMETRY);
  WM_main_add_notifier(NC_OBJECT | ND_DRAW, ptr->owner_id);
}
void rna_Object_internal_update_data_dependency(Main *bmain, Scene * /*scene*/, PointerRNA *ptr)
{
  DEG_relations_tag_update(bmain);
  rna_Object_internal_update_data_impl(ptr);
}
void rna_Object_data_update(Main *bmain, Scene *scene, PointerRNA *ptr)
{
  rna_Object_internal_update_data_dependency(bmain, scene, ptr);
}

static PointerRNA tracked_get(PointerRNA *ptr){++g_getters;
 if(ptr==g_dead_wrapper)++g_stale_wrapper_getters;
 if(ptr->data==g_removed_object)++g_stale_object_getters;
 return rna_Object_data_get(ptr);
}
static bool RNA_property_update_check(PropertyRNA*){return true;}
static void RNA_property_update(bContext *C,PointerRNA *ptr,PropertyRNA*){
 ++g_late_updates;if(ptr==g_dead_wrapper)++g_stale_wrapper_updates;
 if(C!=g_original_context)++g_update_context_changes;
 rna_Object_data_update(C?C->main:nullptr,nullptr,ptr);
}


struct PyObject{};struct BPy_StructRNA{std::optional<PointerRNA>ptr;};
static PyObject exception;static PyObject *PyExc_RuntimeError=&exception;
static bContext *g_bpy_context=nullptr;static int g_reports_to_error=0,g_python_errors=0,g_decrefs=0;
static bContext *BPY_context_get(){return g_bpy_context;}
static void BKE_reports_init(ReportList *reports,int){*reports={};}
static int BPy_reports_to_error(ReportList *reports,PyObject*,bool){++g_reports_to_error;if(!reports->message.empty()){++g_python_errors;return -1;}return 0;}
static void Py_XDECREF(PyObject *value){if(value)++g_decrefs;}
static void PyErr_SetString(PyObject*,const char*){++g_python_errors;}

static int probe_python_assignment(PointerRNA *ptr,PropertyRNA *prop,BPy_StructRNA *param,PyObject *value_new){

#ifdef WITH_APPLE_CROSSPLATFORM
  std::optional<PointerRNA> material_assign_target;
  bContext *material_assign_context = nullptr;
#endif
            ReportList reports;
            BKE_reports_init(&reports, RPT_STORE);
#ifdef WITH_APPLE_CROSSPLATFORM
            if (RNA_property_is_material_assignment(prop)) {
              material_assign_context = BPY_context_get();
              material_assign_target.emplace(*ptr);
              const PointerRNA material_value =
                  (param == nullptr) ? PointerRNA_NULL : *param->ptr;
              ptr = &*material_assign_target;
              const bool prepared = RNA_property_material_assign_paint_owner_teardown(
                  material_assign_context, ptr, prop, material_value, &reports);
              if (BPY_context_get() != material_assign_context) {
                BKE_report(&reports, RPT_ERROR, "Material assignment was refused: Python context changed");
              }
              else if (prepared) {
                RNA_property_pointer_set(ptr, prop, material_value, &reports);
              }
            }
            else
#endif
            {
              RNA_property_pointer_set(
                  ptr, prop, (param == nullptr) ? PointerRNA_NULL : *param->ptr, &reports);
            }
            const int err = BPy_reports_to_error(&reports, PyExc_RuntimeError, true);
            if (err == -1) {
              Py_XDECREF(value_new);
              return -1;
            }
  /* Run RNA property functions. */
  if (RNA_property_update_check(prop)) {
#ifdef WITH_APPLE_CROSSPLATFORM
    if (material_assign_target) {
      if (BPY_context_get() != material_assign_context) {
        PyErr_SetString(PyExc_RuntimeError, "Material assignment context changed before update");
        return -1;
      }
      RNA_property_update(material_assign_context, ptr, prop);
    }
    else
#endif
    {
      RNA_property_update(BPY_context_get(), ptr, prop);
    }
  }

  return 0;
}
static void probe_ui_selected_tail(bContext *C,PointerRNA lptr,PropertyRNA *prop,PointerRNA value){
PropertyRNA *lprop=prop;std::variant<PointerRNA>delta{value};
        const PointerRNA &other_value = std::get<PointerRNA>(delta);
        RNA_property_pointer_set(&lptr, lprop, other_value, nullptr);
      RNA_property_update(C, &lptr, prop);
}



static void reset(Main &main,wmWindowManager &wm,wmWindow &win,Object &object,Mesh &old_mesh,Mesh &new_mesh) {
  G_MAIN=&main; main.objects={}; main.meshes={}; main.wm={}; wm.windows={}; win.handlers={}; win.modalhandlers={};
  object={};old_mesh={};new_mesh={};wm={};win={};
  object.id.session_uid=10;std::snprintf(object.id.name,sizeof(object.id.name),"%s","OBCube");object.type=OB_MESH;object.data=&old_mesh;
  old_mesh.session_uid=20;std::snprintf(old_mesh.name,sizeof(old_mesh.name),"%s","MEMeshOld");old_mesh.users=1;
  new_mesh.session_uid=21;std::snprintf(new_mesh.name,sizeof(new_mesh.name),"%s","MEMeshNew");
  wm.id.session_uid=30;win.winid=40;append(main.objects,&object);append(main.meshes,&old_mesh);append(main.meshes,&new_mesh);
  append(wm.windows,&win);append(main.wm,&wm);
  refuse_native_teardown=false;replace_main_on_teardown=false;mutate_data_on_teardown=false;reenter_setter_on_teardown=false;
  teardown_calls=assign_calls=mutation_order=0;target_object=&object;side_data=&new_mesh;inner_report.clear();
}
static void add_owner(wmWindow &win,wmEventHandler_Op &owner,uint64_t object_uid,uint64_t scene_uid,uint64_t lifetime) {
  owner={};owner.type=WM_HANDLER_TYPE_OP;owner.ipad_pencil_paint_serial=1;owner.ipad_pencil_operator_lifetime=lifetime;
  owner.ipad_pencil_owner_values[6]=scene_uid;owner.ipad_pencil_owner_values[7]=object_uid;append(win.modalhandlers,&owner);
}
static void set_data(Object &object,ID *id,ReportList &reports) {
  PointerRNA ptr{&object},value{id};rna_Object_data_set(&ptr,value,&reports);
}


static Main *g_probe_main=nullptr;static Object *g_probe_object=nullptr,*g_replace_object=nullptr;
static ID *g_probe_old=nullptr,*g_probe_new=nullptr;static PointerRNA *g_probe_ptr=nullptr;
static bContext *g_switched_context=nullptr;static int g_mutation=0;
static void probe_hook(){
 if(g_mutation==1||g_mutation==2){unlink(g_probe_main->objects,g_probe_object);g_removed_object=g_probe_object;
  if(g_mutation==2)append(g_probe_main->objects,g_replace_object);}
 if(g_mutation==3){unlink(g_probe_main->meshes,g_probe_old);g_removed_data=g_probe_old;}
 if(g_mutation==4){unlink(g_probe_main->meshes,g_probe_new);g_removed_data=g_probe_new;}
 if(g_mutation==5)g_dead_wrapper=g_probe_ptr;
 if(g_mutation==6)g_bpy_context=g_switched_context;
}
static void reset_probe(Main &main,Object &object,Object &replacement,Mesh &old_mesh,Mesh &new_mesh,bContext &C,PointerRNA &ptr){
 replacement=object;replacement.next=nullptr;
 g_removed_object=nullptr;g_removed_data=nullptr;g_dead_wrapper=nullptr;
 g_stale_object_getters=g_stale_data_getters=g_stale_wrapper_getters=g_stale_refcounts=0;
 g_getters=g_refcounts=g_late_updates=g_stale_owner_tags=g_stale_wrapper_updates=g_update_context_changes=0;
 g_tags=g_relations=g_notifiers=g_material_boundary_calls=0;g_reports_to_error=g_python_errors=g_decrefs=0;
 g_original_context=&C;g_bpy_context=&C;g_probe_main=&main;g_probe_object=&object;g_replace_object=&replacement;
 g_probe_old=&old_mesh;g_probe_new=&new_mesh;g_probe_ptr=&ptr;g_probe_hook=probe_hook;
}
static void print_record(const char *name,int result,ReportList &reports){
 std::printf("{\"name\":\"%s\",\"result\":%d,\"teardown\":%d,\"assignment\":%d,\"getters\":%d,\"stale_object_getters\":%d,\"stale_data_boundary\":%d,\"stale_wrapper_getters\":%d,\"refcounts\":%d,\"stale_refcounts\":%d,\"updates\":%d,\"stale_owner_tags\":%d,\"stale_wrapper_updates\":%d,\"update_context_changes\":%d,\"reported\":%d}\n",
 name,result,teardown_calls,assign_calls,g_getters,g_stale_object_getters,g_stale_data_getters,g_stale_wrapper_getters,
 g_refcounts,g_stale_refcounts,g_late_updates,g_stale_owner_tags,g_stale_wrapper_updates,g_update_context_changes,int(!reports.message.empty()));
 assert(g_material_boundary_calls==0);
}
int main(){
 for(g_mutation=1;g_mutation<=4;++g_mutation){
  Main main;wmWindowManager wm;wmWindow win;Object object,replacement;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
  bContext C{&main,&wm,&win};PointerRNA ptr{&object},value{&new_mesh};ptr.owner_id=&object.id;ptr.type=&RNA_Object;value.owner_id=&new_mesh;value.type=&RNA_Mesh;
  reset_probe(main,object,replacement,old_mesh,new_mesh,C,ptr);wmEventHandler_Op owner;add_owner(win,owner,10,50,10);
  PointerPropertyRNA property;property.get=tracked_get;property.set=rna_Object_data_set;
  ReportList reports;RNA_property_pointer_set(&ptr,&property,value,&reports);
  assert(teardown_calls==1&&assign_calls==0&&!reports.message.empty());
#ifndef NDEBUG
  if(g_mutation<3)assert(g_stale_object_getters==1);else assert(g_stale_refcounts>=1);
#else
  assert(g_getters==0&&g_refcounts==0);
#endif
  print_record(g_mutation==1?"debug_owner_removed":g_mutation==2?"debug_owner_replaced":g_mutation==3?"debug_old_data_removed":"debug_incoming_removed",0,reports);
 }
 for(int scenario:{1,5,6}){
  Main main,other_main;wmWindowManager wm;wmWindow win;Object object,replacement;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
  bContext C{&main,&wm,&win},other_C{&other_main,nullptr,nullptr};PointerRNA ptr{&object},value{&new_mesh};ptr.owner_id=&object.id;ptr.type=&RNA_Object;value.owner_id=&new_mesh;value.type=&RNA_Mesh;
  reset_probe(main,object,replacement,old_mesh,new_mesh,C,ptr);g_switched_context=&other_C;g_mutation=scenario;wmEventHandler_Op owner;add_owner(win,owner,10,50,11);
  PointerPropertyRNA property;property.get=tracked_get;property.set=rna_Object_data_set;
  BPy_StructRNA param;param.ptr=value;PyObject new_value;ReportList reports;
  const int result=probe_python_assignment(&ptr,&property,&param,&new_value);
  if(scenario==1)assert(result==-1&&g_late_updates==0&&assign_calls==0);
  if(scenario==5)assert(result==0&&g_stale_wrapper_updates==1&&assign_calls==1);
  if(scenario==6)assert(result==0&&g_update_context_changes==1&&assign_calls==1);
  print_record(scenario==1?"python_owner_removed_report_gate":scenario==5?"python_wrapper_tombstone":"python_context_switch",result,reports);
 }
 for(g_mutation=1;g_mutation<=2;++g_mutation){
  Main main;wmWindowManager wm;wmWindow win;Object object,replacement;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
  bContext C{&main,&wm,&win};PointerRNA ptr{&object},value{&new_mesh};ptr.owner_id=&object.id;ptr.type=&RNA_Object;value.owner_id=&new_mesh;value.type=&RNA_Mesh;
  reset_probe(main,object,replacement,old_mesh,new_mesh,C,ptr);wmEventHandler_Op owner;add_owner(win,owner,10,50,12);
  PointerPropertyRNA property;property.get=tracked_get;property.set=rna_Object_data_set;ReportList reports;
  probe_ui_selected_tail(&C,ptr,&property,value);
  assert(teardown_calls==1&&assign_calls==0&&g_late_updates==1&&g_stale_owner_tags==1);
  print_record(g_mutation==1?"ui_owner_removed_update":"ui_owner_replaced_update",0,reports);
 }
 for(int control=0;control<5;++control){
  Main main;wmWindowManager wm;wmWindow win;Object object,replacement;Mesh old_mesh,new_mesh;reset(main,wm,win,object,old_mesh,new_mesh);
  bContext C{&main,&wm,&win};PointerRNA ptr{&object},value{&new_mesh};ptr.owner_id=&object.id;ptr.type=&RNA_Object;value.owner_id=&new_mesh;value.type=&RNA_Mesh;
  reset_probe(main,object,replacement,old_mesh,new_mesh,C,ptr);g_mutation=0;wmEventHandler_Op owner;
  if(control) add_owner(win,owner,10,50,13);
  if(control==1)object.mode=OB_MODE_EDIT;
  if(control==2)value=PointerRNA{&old_mesh},value.owner_id=&old_mesh,value.type=&RNA_Mesh;
  if(control==3)value=PointerRNA_NULL;
  if(control==4)value.type=&RNA_Object;
  PointerPropertyRNA property;property.get=tracked_get;property.set=rna_Object_data_set;ReportList reports;
  RNA_property_pointer_set(&ptr,&property,value,&reports);
  if(control==0)assert(assign_calls==1&&teardown_calls==0&&reports.message.empty());
  if(control==1)assert(assign_calls==0&&teardown_calls==0&&reports.message.empty());
  if(control==2)assert(assign_calls==1&&teardown_calls==0&&old_mesh.users==1&&reports.message.empty());
  if(control==3)assert(assign_calls==0&&teardown_calls==1&&reports.message.empty());
  if(control==4)assert(assign_calls==0&&teardown_calls==0&&!reports.message.empty());
  print_record(control==0?"control_no_owner":control==1?"control_Edit":control==2?"control_same_pointer":control==3?"control_null_nonempty":"control_type_error",0,reports);
 }
}
