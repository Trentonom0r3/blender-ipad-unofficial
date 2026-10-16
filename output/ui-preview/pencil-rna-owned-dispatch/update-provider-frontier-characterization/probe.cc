
#include <cassert>
#include <cstdio>
#include <string>
#include <vector>
#include <cstring>
#define WITH_APPLE_CROSSPLATFORM
#define BLI_assert(value) assert(value)
struct ID{int token=1;};
struct Main{};struct Scene{};struct ReportList{int errors=0;};
struct bContext {struct {Main *main=nullptr;Scene *scene=nullptr;}data;};
enum {CTX_RESULT_MEMBER_NOT_FOUND=0,CTX_RESULT_OK=1,CTX_DATA_TYPE_POINTER=1};
struct bContextDataResult {int type=CTX_DATA_TYPE_POINTER;struct{void *data=nullptr;}ptr;};
struct PointerRNA{ID *owner_id=nullptr;void *data=nullptr;};
enum{RNA_MAGIC=123,PROP_POINTER=1,RPT_ERROR=1};
struct PropertyRNA{int magic=RNA_MAGIC,type=PROP_POINTER;};
struct PointerPropertyRNA:PropertyRNA{void(*set)(PointerRNA*,PointerRNA,ReportList*)=nullptr;};
static Main *G_MAIN=nullptr;
static bool owner=false;
static ID *target=nullptr,*removed_id=nullptr;
static int scenario=0,provider_calls=0,absence_queries=0,suffix_calls=0;
static int first_owner_reads=0,tombstoned_owner_reads=0,modeled_tags=0;
static std::vector<std::string>events;
static void Object_active_material_set(PointerRNA*,PointerRNA,ReportList*){}
static void MaterialSlot_material_set(PointerRNA*,PointerRNA,ReportList*){}
static void Object_data_set_identity_only(PointerRNA*,PointerRNA,ReportList*){}
static PropertyRNA *rna_ensure_property(PropertyRNA *prop){return prop;}
static void BKE_report(ReportList *reports,int,const char*){++reports->errors;}
// Provider-chain dispatch is modeled at ctx_data_get. The verify helper and
// public CTX_data getters below are exact pinned bodies. No Python/provider
// interpreter executes.
static int ctx_data_get(bContext*,const char *member,bContextDataResult*){
 ++provider_calls;events.emplace_back(member);
 const bool is_main=std::strcmp(member,"blend_data")==0;
 const bool is_scene=std::strcmp(member,"scene")==0;
 if((scenario==1&&is_main)||(scenario==2&&is_scene)){
   owner=false;removed_id=target;events.emplace_back("retire_owner_remove_target");
 }
 if((scenario==3&&is_main)||(scenario==4&&is_scene)){
   owner=true;events.emplace_back("acquire_owner");
 }
 if(scenario==6&&is_main){removed_id=target;events.emplace_back("remove_target_without_owner");}
 return CTX_RESULT_MEMBER_NOT_FOUND;
}
// The WM absence endpoint is an explicit value-only boundary model, not the
// production shared WM owner scan. A null output requests no Cancel.
static bool WM_event_ipad_pencil_paint_owner_teardown_next(bContext *C,Main *main,bool *did){
 assert(C==nullptr&&main==G_MAIN&&did==nullptr);++absence_queries;
 events.emplace_back(owner?"absence_refused":"absence_passed");return !owner;
}

static bool ctx_data_pointer_verify(const bContext *C, const char *member, void **pointer)
{
  /* if context is nullptr, pointer must be nullptr too and that is a valid return */
  if (C == nullptr) {
    *pointer = nullptr;
    return true;
  }

  bContextDataResult result;
  if (ctx_data_get((bContext *)C, member, &result) == CTX_RESULT_OK) {
    BLI_assert(result.type == CTX_DATA_TYPE_POINTER);
    *pointer = result.ptr.data;
    return true;
  }

  *pointer = nullptr;
  return false;
}
Main *CTX_data_main(const bContext *C)
{
  Main *bmain;
  if (ctx_data_pointer_verify(C, "blend_data", (void **)&bmain)) {
    return bmain;
  }

  return C->data.main;
}
Scene *CTX_data_scene(const bContext *C)
{
  Scene *scene;
  if (ctx_data_pointer_verify(C, "scene", (void **)&scene)) {
    return scene;
  }

  return C->data.scene;
}
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
static void rna_property_update(
    bContext *C, Main *bmain, Scene *scene, PointerRNA *ptr, PropertyRNA *prop)
{
  const bool is_rna = (prop->magic == RNA_MAGIC);
  prop = rna_ensure_property(prop);
#ifdef WITH_APPLE_CROSSPLATFORM
  /* UI callers can update after a void setter refusal. Do not tag/evaluate its
   * data through that fallback while the same paint owner is still registered. */
  if (!rna_material_assignment_owner_absent(prop, nullptr)) return;
#endif
  (void)C;(void)bmain;(void)scene;(void)is_rna;
  events.emplace_back("MODELED_SUFFIX");++suffix_calls;
  ++first_owner_reads;
  if(ptr->owner_id==removed_id)++tombstoned_owner_reads;
  ++modeled_tags;
}

void RNA_property_update(bContext *C, PointerRNA *ptr, PropertyRNA *prop)
{
  rna_property_update(C, CTX_data_main(C), CTX_data_scene(C), ptr, prop);
}

static void print_row(int profile){
 std::printf("{\"profile\":\"%s\",\"scenario\":%d,\"owner_final\":%s,\"provider_calls\":%d,\"absence_queries\":%d,\"suffix_calls\":%d,\"first_owner_reads\":%d,\"tombstoned_owner_reads\":%d,\"modeled_tags\":%d,\"events\":[",
 profile==0?"Object.data":profile==1?"Object.active_material":"MaterialSlot.material",scenario,owner?"true":"false",provider_calls,absence_queries,suffix_calls,first_owner_reads,tombstoned_owner_reads,modeled_tags);
 for(size_t i=0;i<events.size();++i)std::printf("%s\"%s\"",i?",":"",events[i].c_str());
 std::puts("]}");
}
int main(){
 for(int profile=0;profile<3;++profile)for(scenario=0;scenario<7;++scenario){
  Main main;Scene scene;ID id;target=&id;G_MAIN=&main;bContext C;C.data.main=&main;C.data.scene=&scene;
  owner=scenario==1||scenario==2||scenario==5;removed_id=nullptr;
  provider_calls=absence_queries=suffix_calls=first_owner_reads=tombstoned_owner_reads=modeled_tags=0;events.clear();
  PointerRNA ptr{&id,&id};PointerPropertyRNA prop;
  prop.set=profile==0?Object_data_set_identity_only:profile==1?Object_active_material_set:MaterialSlot_material_set;
  RNA_property_update(&C,&ptr,&prop);
  assert(provider_calls==2);
  const bool expected_suffix=profile==0||!owner;
  assert(suffix_calls==int(expected_suffix)&&first_owner_reads==int(expected_suffix));
  assert(absence_queries==(profile==0?0:1));
  assert(tombstoned_owner_reads==int(expected_suffix&&(scenario==1||scenario==2||scenario==6)));
  assert(events[0]=="blend_data"||events[0]=="scene");
  if(profile!=0){
   size_t query=events.size();for(size_t i=0;i<events.size();++i)if(events[i]=="absence_passed"||events[i]=="absence_refused")query=i;
   size_t main_provider=events.size(),scene_provider=events.size();
   for(size_t i=0;i<events.size();++i){if(events[i]=="blend_data")main_provider=i;if(events[i]=="scene")scene_provider=i;}
   assert(query>main_provider&&query>scene_provider);
  }
  print_row(profile);
 }
}
