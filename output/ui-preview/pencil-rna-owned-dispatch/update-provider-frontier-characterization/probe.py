from pathlib import Path
import sys,subprocess,tempfile,json,hashlib,datetime,shutil
repo=Path(r'D:/dev/Projects/Repos/blendpad/blender-ipad-unofficial')
sys.path.insert(0,str(repo/'build'))
from test_compact_shelf import function
from test_touch_extrude import changed_source,PIN_ROOT
access_path='source/blender/makesrna/intern/rna_access.cc'
context_path='source/blender/blenkernel/intern/context.cc'
access=changed_source(access_path)
context=(PIN_ROOT/context_path).read_text(encoding='utf-8')
wrapper=function(access,'void RNA_property_update(')
profile=function(access,'static int rna_material_assignment_profile(')
absence=function(access,'static bool rna_material_assignment_owner_absent(')
verify=function(context,'static bool ctx_data_pointer_verify(')
getters='\n'.join(function(context,signature)for signature in('Main *CTX_data_main(','Scene *CTX_data_scene('))
inner=function(access,'static void rna_property_update(')
prefix_end=inner.index('#endif')+len('#endif')
inner_prefix=inner[:prefix_end]
assert 'rna_material_assignment_owner_absent(prop, nullptr)' in inner_prefix
# No update semantics are duplicated: only the first-owner-read/tag suffix is
# explicitly modeled after the exact current inner gate prefix.
inner_probe=inner_prefix+r'''
  (void)C;(void)bmain;(void)scene;(void)is_rna;
  events.emplace_back("MODELED_SUFFIX");++suffix_calls;
  ++first_owner_reads;
  if(ptr->owner_id==removed_id)++tombstoned_owner_reads;
  ++modeled_tags;
}
'''
model=r'''
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
'''
main=r'''
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
'''
work=Path(tempfile.mkdtemp(prefix='pencil-update-provider-frontier-'))
source='\n'.join((model,verify,getters,profile,absence,inner_probe,wrapper,main))
cc=work/'probe.cc';cc.write_bytes(source.encode())
results={}
clang=r'C:/Program Files/LLVM/bin/clang++.exe'
for opt in('O0','O2'):
 exe=work/f'probe-{opt}.exe'
 compiled=subprocess.run([clang,'-std=c++17','-Wall','-Wextra','-Werror','-pedantic',f'-{opt}',str(cc),'-o',str(exe)],capture_output=True,text=True)
 (work/f'{opt}-compile.log').write_text(compiled.stdout+compiled.stderr,encoding='utf-8')
 if compiled.returncode:raise SystemExit(f'compile failed {work}: {compiled.stderr}')
 executed=subprocess.run([str(exe)],capture_output=True,text=True)
 (work/f'{opt}-execution.log').write_text(executed.stdout+executed.stderr,encoding='utf-8')
 if executed.returncode:raise SystemExit(f'execution failed {work}: {executed.stderr}')
 results[opt]=[json.loads(line)for line in executed.stdout.splitlines()]
 assert len(results[opt])==21
out=repo/'output/ui-preview/pencil-rna-owned-dispatch'
evidence=out/'update-provider-frontier-characterization';evidence.mkdir(parents=True,exist_ok=True)
for path in work.iterdir():
 if path.suffix!='.exe':shutil.copyfile(path,evidence/path.name)
shutil.copyfile(Path(__file__),evidence/'probe.py')
fragments={'RNA_property_update':wrapper,'ctx_data_pointer_verify':verify,'CTX_data_main_and_scene':getters,'rna_material_assignment_profile':profile,'rna_material_assignment_owner_absent':absence,'rna_property_update_prefix_before_suffix':inner_prefix}
report={
 'title':'Disposable RNA update context-provider frontier characterization',
 'timestamp_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),
 'status':'42 bounded source-executing scenarios passed; prospective boundary evidence only; no corrective source',
 'pin':'d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e',
 'production_source':'196b54ca63a8fa558225479711de2426a83f8c53',
 'production_patch_sha256':'fe816827b12a53fcb9555d95d5f1dd9066fd24b91988c8038b819a0083e10127',
 'scenario_legend':{'0':'No registered owner, no provider mutation','1':'Initially owned: Main provider retires owner and removes target','2':'Initially owned: Scene provider retires owner and removes target','3':'Initially absent: Main provider acquires owner','4':'Initially absent: Scene provider acquires owner','5':'Initially owned, no provider mutation','6':'Initially absent: Main provider removes target without owner acquisition'},
 'source_files_sha256':{access_path:hashlib.sha256(access.encode()).hexdigest(),context_path:hashlib.sha256(context.encode()).hexdigest()},
 'actual_source_fragments':{name:{'sha256':hashlib.sha256(text.encode()).hexdigest(),'source':text}for name,text in fragments.items()},
 'execution':{'compiler':clang,'language':'C++17','optimizations':['O0','O2'],'scenarios_each':21,'exit_status':0,'workdir':str(work),'rows':results},
 'observations':[
  'Actual public RNA_property_update evaluates both actual CTX_data getters before entering the actual inner material absence gate prefix. C++ does not guarantee source left-to-right function argument evaluation; execution events record observed order only.',
  'A modeled provider retirement/removal makes the later material absence helper pass; its exact identity-only property profile has no target receipt, so the explicitly modeled suffix observes a tombstoned original owner.',
  'A modeled provider acquisition is refused by both material profiles before the modeled suffix, but both provider callbacks have already executed.',
  'Object.data is not one of the two actual material profiles: no absence query runs and the modeled suffix proceeds in all scenarios, including owner-present and removed-target scenarios.',
  'No-owner and owner-present controls preserve current profile behavior. Target removal without an owner is a native-baseline callback frontier outside the existing owner gate, not a claim of broad no-owner safety.'
 ],
 'boundaries':[
  'ctx_data_get callback dispatch is modeled. Exact pinned ctx_data_pointer_verify and public CTX_data_main/CTX_data_scene getters execute and fall back to live non-null C data; interpreter/provider recursion is not executed. Null-C calls are not exercised and no null-C full-update claim is made.',
  'The WM absence endpoint is modeled as registered-owner bool; actual shared WM scan, handler/Brush state, native Cancel and disposal are not executed.',
  'Only the exact rna_property_update prefix through the Apple material absence gate executes. First-owner read, tag and rest of inner update are expressly modeled, not a proof of full native tagging/depsgraph/notification behavior.',
  'Target and PointerRNA backing memory is retained and marked with tombstones. No real freed pointer is dereferenced; no allocator UAF, native failure, UIKit timing or device proof is claimed.',
  'No Object.data setter, generic pointer Debug frame, Python conversion or UI event tail executes in this probe; their separate earlier characterization remains separately scoped.',
  'No production or tracked test files were edited; no build is requested by this characterization.'
 ]
}
(out/'update-provider-frontier-characterization.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
print(json.dumps({'report':str(out/'update-provider-frontier-characterization.json'),'scenarios':42,'workdir':str(work),'status':'pass'},indent=2))
