"""Execute native interaction admission, owner proof and exactly-once disposal.

UI contexts, mesh containers and callbacks are fixtures, not target modal proof.
"""
import unittest
from test_touch_extrude import changed_source
from test_tool_ring import ring_source
from test_compact_shelf import function
import test_ipad_panels

HANDLERS=changed_source('source/blender/editors/interface/interface_handlers.cc')
HEADER=changed_source('source/blender/editors/include/UI_interface_c.hh')
MESH=changed_source('source/blender/editors/space_view3d/view3d_buttons.cc')

def definition(source, marker):
    # Native forward declarations can be in the surrounding diff context.
    return function(source[source.rindex(marker):],marker)

PARAMS=definition(HEADER,'struct uiBlockInteraction_Params {')+';'
API=HEADER[HEADER.index('using uiBlockInteractionBeginFn'):HEADER.index('\n};',HEADER.index('struct uiBlockInteraction_CallbackData {'))+3]
HANDLE=definition(HANDLERS,'struct uiBlockInteraction_Handle {')+';'
LIFETIME='\n'.join(definition(HANDLERS,s) for s in (
    'static uiBlockInteraction_Handle *ui_block_interaction_begin(',
    'static void ui_block_interaction_end(',
    'static void ui_block_interaction_update(',
    'static void ui_block_interaction_release('))

COMMON=r'''
#include <cassert>
#include <cstdint>
#include <cstdlib>
#include <memory>
#include <unordered_set>
#include <vector>
namespace ipad_ring=blender::ui::ipad;
using uint=unsigned int;
template<class T>struct Vector:std::vector<T>{
 using std::vector<T>::vector;void append(T value){this->push_back(value);}
 int64_t size()const{return int64_t(std::vector<T>::size());}
};
int allocations=0,disposals=0;
template<class T>T *MEM_new(const char *){++allocations;return new T();}
template<class T>void MEM_delete(T *p){++disposals;delete p;}
template<class T>T *MEM_malloc_arrayN(int n,const char *){++allocations;return static_cast<T *>(std::malloc(sizeof(T)*n));}
void *MEM_reallocN(void *p,size_t bytes){return std::realloc(p,bytes);}
void MEM_freeN(void *p){++disposals;std::free(p);}
#define BLI_assert(value) assert(value)
'''

WORLD=COMMON+r'''
struct bContext{bool live=true,owner=true,retire_begin=false,retire_update=false;};
bool ui_ipad_action_origin_valid(bContext *C,const ipad_ring::ActionOrigin &origin){return !origin.present()||(C&&C->live);}
'''+PARAMS+'\n'+API+'\n'+HANDLE+r'''
constexpr int UI_BUT_DRAG_MULTI=1;
struct uiBut{bool active=true;int flag=0,retval=7;};
struct uiBlock{ipad_ring::ActionOrigin ipad_action_origin;uiBlockInteraction_CallbackData custom_interaction_callbacks{};Vector<std::unique_ptr<uiBut>> buttons;};
int BLI_sortutil_cmp_int(const void *a,const void *b){int x=*static_cast<const int *>(a),y=*static_cast<const int *>(b);return (x>y)-(x<y);}
int BLI_array_deduplicate_ordered(int *values,int n){if(!n)return 0;int j=1;for(int i=1;i<n;++i)if(values[i]!=values[j-1])values[j++]=values[i];return j;}
static void ui_block_interaction_end(bContext *,uiBlockInteraction_CallbackData *,uiBlockInteraction_Handle *);
'''+LIFETIME+r'''
int begins=0,updates=0,ends=0,retirements=0,validations=0;
void *begin(bContext *C,const uiBlockInteraction_Params *params,void *){
 ++begins;assert(params->unique_retval_ids_len==1&&params->unique_retval_ids[0]==7);
 if(C->retire_begin)C->live=false;
 return MEM_new<int>("owned cache");
}
void end(bContext *,const uiBlockInteraction_Params *,void *,void *owned){++ends;MEM_delete(static_cast<int *>(owned));}
void dispose(void *owned){++retirements;MEM_delete(static_cast<int *>(owned));}
bool validate(bContext *C,const void *,const void *){++validations;return C&&C->owner;}
void update(bContext *C,const uiBlockInteraction_Params *,void *,void *){++updates;if(C->retire_update)C->live=false;}
uiBlock block(){uiBlock result;std::array<uint64_t,13> values;values.fill(1);
 result.ipad_action_origin=ipad_ring::ActionOrigin::capture(values,"builtin.move",1);
 result.custom_interaction_callbacks={begin,end,update,nullptr,dispose,validate,true};
 result.buttons.push_back(std::make_unique<uiBut>());result.buttons.push_back(std::make_unique<uiBut>());return result;}
'''

MESH_WORLD=COMMON+r'''
namespace blender{
template<class T>using Vector=::Vector<T>;
template<class T>struct Set:std::unordered_set<T>{void add(T v){this->insert(v);}bool remove(T v){return bool(this->erase(v));}bool is_empty()const{return this->empty();}};
template<class=void>struct BitVector{struct Bit{void set(){}};explicit BitVector(int){}Bit operator[](int){return {};}};
}
struct BMVert{bool selected=false;float x=0;};struct BMFace{};
struct BMesh{int totvert=2,totedge=1,totloop=2,totface=1;void *vpool,*epool,*lpool,*fpool;Vector<BMVert *> vertices;Vector<BMFace *> faces;};
struct BMEditMesh{BMesh *bm;};struct Runtime{struct{BMEditMesh *value;BMEditMesh *get(){return value;}}edit_mesh;};
struct Mesh{Runtime *runtime;};struct Object{int type=1;void *data;};
struct UndoStack{uint64_t ipad_lifetime_id=7,ipad_mutation_generation=9;};struct WindowManagerRuntime{UndoStack *undo_stack;};struct wmWindowManager{WindowManagerRuntime *runtime;};
struct View3D{};struct TransformProperties{bool tag_for_update=true;};
struct bContext{Object *object;wmWindowManager *wm;View3D view;TransformProperties props;};
Object *CTX_data_edit_object(bContext *C){return C->object;}wmWindowManager *CTX_wm_manager(bContext *C){return C->wm;}
View3D *CTX_wm_view3d(bContext *C){return &C->view;}TransformProperties current_props;
TransformProperties *v3d_transform_props_ensure(View3D *){return &current_props;}
constexpr int OB_MESH=1,BM_VERTS_OF_MESH=1,BM_FACES_OF_MESH=2,BM_ELEM_SELECT=1,B_TRANSFORM_PANEL_MEDIAN=1008;
struct BMIter{};
size_t mesh_count(BMesh *bm,int kind){return kind==BM_VERTS_OF_MESH?size_t(bm->vertices.size()):size_t(bm->faces.size());}
void *mesh_element(BMesh *bm,int kind,size_t i){return kind==BM_VERTS_OF_MESH?static_cast<void *>(bm->vertices[i]):static_cast<void *>(bm->faces[i]);}
#define BM_ITER_MESH(elem,iter,bm,kind) for(size_t mesh_i=0;mesh_i<mesh_count(bm,kind)&&((void)(iter),(elem)=static_cast<decltype(elem)>(mesh_element(bm,kind,mesh_i)),true);++mesh_i)
#define BM_ITER_MESH_INDEX(elem,iter,bm,kind,index) for((index)=0;size_t(index)<mesh_count(bm,kind)&&((void)(iter),(elem)=static_cast<decltype(elem)>(mesh_element(bm,kind,index)),true);++(index))
bool BM_elem_flag_test(BMVert *v,int){return v->selected;}
struct BMPartialUpdate_Params{bool do_normals,do_tessellate;};
struct BMPartialUpdate{Vector<BMVert *> verts;Vector<BMFace *> faces;BMPartialUpdate_Params params={};};
int mesh_updates=0,partial_creations=0,partial_disposals=0;
BMPartialUpdate *BM_mesh_partial_create_from_verts_group_single(BMesh &bm,BMPartialUpdate_Params params,blender::BitVector<> &,int){++partial_creations;return new BMPartialUpdate{bm.vertices,bm.faces,params};}
void BM_mesh_partial_destroy(BMPartialUpdate *p){++partial_disposals;delete p;}
void BKE_editmesh_looptris_and_normals_calc_with_partial(BMEditMesh *,BMPartialUpdate *){++mesh_updates;}
int BLI_array_findindex(const int *items,uint n,const int *needle){for(uint i=0;i<n;++i)if(items[i]==*needle)return int(i);return -1;}
'''+PARAMS+'\n'+definition(MESH,'struct EditMeshPartialUpdateData {')+';\n'+'\n'.join(definition(MESH,s) for s in (
    'static bool editmesh_partial_update_validate_fn(',
    'static void *editmesh_partial_update_begin_fn(',
    'static void editmesh_partial_update_dispose_fn(',
    'static void editmesh_partial_update_end_fn(',
    'static void editmesh_partial_update_update_fn('))

class PencilCallbackDisposalTests(unittest.TestCase):
    def run_cpp(self,code):
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(ring_source().replace('#pragma once','')+'\n'+code)

    def test_native_begin_requires_audited_profile_and_balances_failed_capture(self):
        self.run_cpp(WORLD+r'''
int main(){bContext C;auto b=block();auto &cb=b.custom_interaction_callbacks;
 cb.dispose_fn=nullptr;assert(!ui_block_interaction_begin(&C,&b,false)&&!begins&&!allocations);cb.dispose_fn=dispose;
 cb.validate_fn=nullptr;assert(!ui_block_interaction_begin(&C,&b,false)&&!begins&&!allocations);cb.validate_fn=validate;
 cb.preserves_ui=false;assert(!ui_block_interaction_begin(&C,&b,false)&&!begins&&!allocations);cb.preserves_ui=true;
 C.live=false;assert(!ui_block_interaction_begin(&C,&b,false)&&!begins&&!allocations);C.live=true;
 C.owner=false;assert(!ui_block_interaction_begin(&C,&b,false)&&!begins&&!allocations);C.owner=true;
 // Allocation cleanup still works if a fixture deliberately violates the
 // non-UI-mutating profile by losing its context inside begin.
 C.retire_begin=true;assert(!ui_block_interaction_begin(&C,&b,false));
 assert(begins==1&&retirements==1&&!ends&&allocations==disposals);
 C.live=true;C.retire_begin=false;auto *handle=ui_block_interaction_begin(&C,&b,false);
 assert(handle&&handle->validate_fn==validate&&handle->dispose_fn==dispose);
 handle->user_count=1;ui_block_interaction_release(&C,&cb,handle,true);
 assert(!handle&&ends==1&&updates==1&&allocations==disposals);
}
''')

    def test_shared_native_release_orders_owner_loss_and_exactly_once_disposal(self):
        self.run_cpp(WORLD+r'''
int main(){bContext C;auto b=block();auto &cb=b.custom_interaction_callbacks;
 for(int i=0;i<10000;++i){C.live=C.owner=true;auto *active=ui_block_interaction_begin(&C,&b,false);auto *deferred=active;active->user_count=2;
  if(i%2){ui_block_interaction_release(&C,&cb,active,false);C.live=false;ui_block_interaction_release(&C,&cb,deferred,true);}
  else{C.owner=false;ui_block_interaction_release(&C,&cb,deferred,true);ui_block_interaction_release(&C,&cb,active,false);}
  assert(!active&&!deferred&&retirements==i+1&&!updates&&!ends&&allocations==disposals);
  ui_block_interaction_release(&C,&cb,active,false);ui_block_interaction_release(&C,&cb,deferred,true);
 }
 C.live=C.owner=true;C.retire_update=true;auto *h=ui_block_interaction_begin(&C,&b,false);h->user_count=1;
 ui_block_interaction_release(&C,&cb,h,true);assert(!h&&updates==1&&!ends&&retirements==10001);
 // The captured disposer survives replacement of the block callback profile.
 C.live=C.owner=true;C.retire_update=false;h=ui_block_interaction_begin(&C,&b,false);h->user_count=1;
 cb.dispose_fn=nullptr;cb.validate_fn=nullptr;C.live=false;ui_block_interaction_release(&C,&cb,h,true);assert(retirements==10002);
 // Unrelated ordinary native interactions preserve their old callback route.
 b.ipad_action_origin={};cb.preserves_ui=false;h=ui_block_interaction_begin(&C,&b,true);assert(h);h->user_count=1;
 ui_block_interaction_release(&C,&cb,h,true);assert(!h&&updates==2&&ends==1&&allocations==disposals);
}
''')

    def test_admitted_callback_owner_pair_survives_native_block_refresh(self):
        self.run_cpp(WORLD+r'''
int observed=0,new_calls=0;void *original_arg=nullptr;
void admitted_update(bContext *,const uiBlockInteraction_Params *,void *arg,void *){assert(arg==original_arg);++observed;}
void admitted_end(bContext *,const uiBlockInteraction_Params *,void *arg,void *owned){assert(arg==original_arg);++observed;MEM_delete(static_cast<int *>(owned));}
void replacement_update(bContext *,const uiBlockInteraction_Params *,void *,void *){++new_calls;}
void replacement_end(bContext *,const uiBlockInteraction_Params *,void *,void *owned){++new_calls;MEM_delete(static_cast<int *>(owned));}
int main(){bContext C;auto b=block();int old_owner=7,new_owner=8;original_arg=&old_owner;
 auto &cb=b.custom_interaction_callbacks;cb.arg1=original_arg;cb.update_fn=admitted_update;cb.end_fn=admitted_end;
 for(int i=0;i<10000;++i){auto *h=ui_block_interaction_begin(&C,&b,false);h->user_count=1;
  auto fresh=cb;fresh.arg1=&new_owner;fresh.update_fn=replacement_update;fresh.end_fn=replacement_end;fresh.validate_fn=nullptr;fresh.dispose_fn=nullptr;fresh.preserves_ui=false;
  // Model native UI_block_update_from_old migrating active ownership to the
  // fresh block's callback table, while the old original owner remains live.
  ui_block_interaction_update(&C,&fresh,h);
  if(i%2){fresh={};} // A retired profile cannot suppress the captured end.
  ui_block_interaction_release(&C,&fresh,h,false);
  assert(!h&&!new_calls&&observed==2*(i+1)&&allocations==disposals);
 }
 // Ordinary UI callbacks still follow the fresh native table.
 b.ipad_action_origin={};auto *h=ui_block_interaction_begin(&C,&b,false);h->user_count=1;
 auto fresh=cb;fresh.arg1=&new_owner;fresh.update_fn=replacement_update;fresh.end_fn=replacement_end;
 ui_block_interaction_release(&C,&fresh,h,true);assert(!h&&new_calls==2&&allocations==disposals);
}
''')

    def test_native_mesh_validator_rejects_decode_pool_selection_and_cached_pointee_changes(self):
        test=r'''
int main(){BMVert v0{true},v1{false};BMFace f0;int pools[5];
 BMesh bm{2,1,2,1,&pools[0],&pools[1],&pools[2],&pools[3],{&v0,&v1},{&f0}};
 BMEditMesh em{&bm};Runtime runtime{{&em}};Mesh mesh{&runtime};Object object{OB_MESH,&mesh};
 UndoStack stack;WindowManagerRuntime manager_runtime{&stack};wmWindowManager wm{&manager_runtime};bContext C{&object,&wm,{},{} };
 assert(!editmesh_partial_update_validate_fn(&C,reinterpret_cast<void *>(1),nullptr));
 int retval=B_TRANSFORM_PANEL_MEDIAN;uiBlockInteraction_Params params{false,&retval,1};
 auto *data=static_cast<EditMeshPartialUpdateData *>(editmesh_partial_update_begin_fn(&C,&params,&em));assert(data&&partial_creations==1);
 auto valid=[&](){return editmesh_partial_update_validate_fn(&C,&em,data);};assert(valid());
 v0.x=9;assert(valid()); // This cache intentionally supports coordinate changes.
 auto *original=C.object;C.object=nullptr;assert(!valid());C.object=original;
 object.type=2;assert(!valid());object.type=OB_MESH;
 Runtime replacement{{reinterpret_cast<BMEditMesh *>(1)}};mesh.runtime=&replacement;assert(!valid());mesh.runtime=&runtime;
 auto *old_bm=em.bm;em.bm=reinterpret_cast<BMesh *>(1);assert(!valid());em.bm=old_bm;
 void **pool_fields[]{&bm.vpool,&bm.epool,&bm.lpool,&bm.fpool};
 for(auto **p:pool_fields){auto old=*p;*p=&pools[4];assert(!valid());*p=old;}
 int *counts[]{&bm.totvert,&bm.totedge,&bm.totloop,&bm.totface};for(int *p:counts){++*p;assert(!valid());--*p;}
 v0.selected=false;v1.selected=true;assert(!valid());v0.selected=true;v1.selected=false;
 auto *cached_v=data->partial->verts[0];data->partial->verts[0]=reinterpret_cast<BMVert *>(1);assert(!valid());data->partial->verts[0]=cached_v;
 auto *cached_f=data->partial->faces[0];data->partial->faces[0]=reinterpret_cast<BMFace *>(1);assert(!valid());data->partial->faces[0]=cached_f;
#ifdef WITH_APPLE_CROSSPLATFORM
 ++stack.ipad_mutation_generation;assert(!valid());--stack.ipad_mutation_generation;
 ++stack.ipad_lifetime_id;assert(!valid());--stack.ipad_lifetime_id;
 UndoStack same_values;wm.runtime->undo_stack=&same_values;assert(!valid());wm.runtime->undo_stack=&stack;
#endif
 assert(valid());editmesh_partial_update_update_fn(&C,&params,&em,data);assert(mesh_updates==1);
 current_props.tag_for_update=true;editmesh_partial_update_end_fn(nullptr,&params,reinterpret_cast<void *>(1),data);
 assert(partial_disposals==1&&allocations==disposals);editmesh_partial_update_dispose_fn(nullptr);
 retval=42;assert(!editmesh_partial_update_begin_fn(&C,&params,&em));
}
'''
        self.run_cpp('#define WITH_APPLE_CROSSPLATFORM\n'+MESH_WORLD+test)
        self.run_cpp(MESH_WORLD+test)

    def test_native_profile_and_both_releases_are_connected_without_ui_mutating_callbacks(self):
        self.assertIn('after.custom_interaction_handle, interaction_allowed)',HANDLERS)
        self.assertIn('interaction_allowed ? C : nullptr',HANDLERS)
        self.assertIn('data->custom_interaction_handle, false)',HANDLERS)
        self.assertIn('callback_data.preserves_ui = true;',MESH)
        self.assertIn('callback_data.validate_fn = editmesh_partial_update_validate_fn;',MESH)
        self.assertIn('callback_data.dispose_fn = editmesh_partial_update_dispose_fn;',MESH)
        for marker in ('static void *editmesh_partial_update_begin_fn(',
                       'static void editmesh_partial_update_update_fn(',
                       'static bool editmesh_partial_update_validate_fn('):
            body=definition(MESH,marker)
            for prohibited in ('WM_operator','RNA_property_update','UI_block_begin','CTX_wm_area_set','BLI_remlink'):
                self.assertNotIn(prohibited,body)

if __name__=='__main__':unittest.main()
