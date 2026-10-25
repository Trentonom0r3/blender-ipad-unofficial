"""Execute the candidate's complete pre-modal Knife HUD stream dispatcher.

Actual owner/binding/queue/request bodies and full HUD dispatcher execute together.
Native UI state and compositor hit/owner APIs are explicit boundaries; separate
native UI and receipt suites execute those bodies. No UIKit/full scheduler proof.
"""
from pathlib import Path
import argparse, importlib.util, json, hashlib, os, shutil, subprocess, sys, tempfile, unittest
P=argparse.ArgumentParser(add_help=False)
P.add_argument('--repo',type=Path,default=Path(__file__).resolve().parents[1])
P.add_argument('--source-root',type=Path);P.add_argument('--cache-dir',type=Path)
P.add_argument('--output-dir',type=Path);P.add_argument('--opt-level',choices=('0','2'),default='0')
O,ARGS=P.parse_known_args();R=O.repo.resolve();OUT=O.output_dir or Path(tempfile.mkdtemp(prefix='knife-hud-dispatch-'));OUT.mkdir(parents=True,exist_ok=True)
sys.path.insert(0,str(R/'build'))
spec=importlib.util.spec_from_file_location('knife_owner_model',R/'build/test_pencil_knife_owner_dispatch.py');owner=importlib.util.module_from_spec(spec);spec.loader.exec_module(owner)
DISPATCH=owner.function(owner.WM,'static bool wm_ipad_knife_hud_dispatch(')
TYPES=owner.WM[owner.WM.index('struct wmIPadKnifeHardwareContact {'):owner.WM.index('static bool wm_ipad_knife_hud_dispatch(')]
MODEL=r'''
static wmIPadKnifeOwner presented_owner;
static ARegion*presented_hud=nullptr;
static bool higher_owned=false,covered=true,receipt_current=true,ui_pressed=false,kind_knife=true;
static uint64_t hit_generation=55;
static bool UI_ipad_knife_hud_generation(bContext*,wmWindow*,uint64_t gen){return kind_knife&&gen==55;}
static int ui_calls=0,retire_calls=0;
static bool point_inside(const int p[2]){return p[0]>=0&&p[0]<=200&&p[1]>=0&&p[1]<=100;}
static bool UI_ipad_knife_hud_owner(bContext*C,wmWindow*w,uint64_t generation,wmIPadKnifeOwner&out,ARegion**hud){
 out={};*hud=nullptr;if(generation!=55||higher_owned||!receipt_current)return false;
 wmIPadKnifeOwner now;if(!WM_ipad_knife_owner_capture(C,w,C->area,now)||now!=presented_owner)return false;
 out=presented_owner;*hud=presented_hud;return true;
}
static bool UI_ipad_knife_hud_hit(bContext*C,wmWindow*w,const int p[2],uint64_t&gen,wmIPadKnifeOwner&out,ARegion**hud){
 gen=0;out={};*hud=nullptr;if(higher_owned||!covered||!point_inside(p))return false;
 gen=hit_generation;UI_ipad_knife_hud_owner(C,w,gen,out,hud);return true;
}
static void ED_ipad_hud_input_retire(bContext*,wmWindow*,uint64_t){++retire_calls;ui_pressed=false;}
static bool UI_ipad_knife_hud_event_handle(bContext*C,const wmEvent*e){
 assert(WM_ipad_knife_hud_scope_active(C));assert(C->region==presented_hud);++ui_calls;inside_ui=true;
 if(e->type==LEFTMOUSE&&e->val==KM_PRESS)ui_pressed=true;
 if(e->type==WINDEACTIVATE)ui_pressed=false;
 if(e->type==LEFTMOUSE&&e->val==KM_RELEASE){
  if(ui_pressed&&point_inside(e->xy)&&!(e->flag&WM_EVENT_IS_POINTER_CANCEL))WM_ipad_knife_action_queue(C,presented_owner,wmIPadKnifeAction::Confirm);
  ui_pressed=false;
 }
 inside_ui=false;return true;
}
'''
MAIN=r'''
int main(int argc,char**argv){assert(argc==2);std::string c=argv[1];{
 Fixture f;wm_ipad_knife_hardware_contacts.clear();presented_owner=f.owner;presented_hud=&f.hud;
 higher_owned=false;covered=receipt_current=kind_knife=true;hit_generation=55;ui_pressed=false;ui_calls=retire_calls=0;
 auto event=[&](int type,int val,int x=40,int y=40,bool tagged=false,int flags=0){wmEvent e;e.type=type;e.val=val;e.xy[0]=x;e.xy[1]=y;e.flag=flags;if(tagged){e.ipad_hud_generation=55;e.ipad_hud_serial=66;}return wm_ipad_knife_hud_dispatch(&f.C,&f.win,&e);};
 if(c=="hardware-inside"){
  assert(event(LEFTMOUSE,KM_PRESS));assert(ui_pressed&&event_queue.empty());assert(event(MOUSEMOVE,0,80,80));assert(event(LEFTMOUSE,KM_RELEASE,80,80));assert(event_queue.size()==1&&native_calls==0&&wm_ipad_knife_hardware_contacts.empty());assert(f.C.area==&f.area&&f.C.region==&f.region);
 }else if(c=="tagged-inside"){
  assert(event(MOUSEMOVE,0,40,40,true));assert(event(LEFTMOUSE,KM_PRESS,40,40,true));assert(event(LEFTMOUSE,KM_RELEASE,40,40,true));assert(event_queue.size()==1&&native_calls==0);
 }else if(c=="tagged-higher-press"){
  higher_owned=true;assert(event(LEFTMOUSE,KM_PRESS,40,40,true));assert(ui_calls==0&&retire_calls==1&&event_queue.empty());
 }else if(c=="tagged-different-footprint"){
  hit_generation=56;assert(event(LEFTMOUSE,KM_PRESS,40,40,true));assert(ui_calls==0&&retire_calls==1&&event_queue.empty());
 }else if(c=="tagged-standard-hud"){
  kind_knife=false;assert(!event(LEFTMOUSE,KM_PRESS,40,40,true));assert(ui_calls==0&&retire_calls==0&&event_queue.empty());
 }else if(c=="tagged-stale-knife"){
  receipt_current=false;assert(event(LEFTMOUSE,KM_PRESS,40,40,true));assert(event(MOUSEMOVE,0,800,800,true));assert(event(LEFTMOUSE,KM_RELEASE,800,800,true));assert(ui_calls==0&&event_queue.empty());
 }else if(c=="hardware-outside"){
  assert(event(LEFTMOUSE,KM_PRESS));assert(event(MOUSEMOVE,0,800,800));assert(event(LEFTMOUSE,KM_RELEASE,800,800));assert(event_queue.empty()&&wm_ipad_knife_hardware_contacts.empty());
 }else if(c=="canvas-origin"){
  assert(!event(LEFTMOUSE,KM_PRESS,800,800));assert(!event(MOUSEMOVE,0,40,40));assert(!event(LEFTMOUSE,KM_RELEASE));assert(ui_calls==0&&event_queue.empty());
 }else if(c=="stale-covered-press"){
  receipt_current=false;assert(event(LEFTMOUSE,KM_PRESS));assert(wm_ipad_knife_hardware_contacts.size()==1);assert(event(MOUSEMOVE,0,800,800));assert(event(LEFTMOUSE,KM_RELEASE,800,800));assert(event_queue.empty()&&ui_calls==0&&wm_ipad_knife_hardware_contacts.empty());
 }else if(c=="window-id-tail"){
  assert(event(LEFTMOUSE,KM_PRESS));++f.win.winid;assert(event(MOUSEMOVE,0,800,800));assert(event(LEFTMOUSE,KM_RELEASE,800,800));assert(event_queue.empty()&&wm_ipad_knife_hardware_contacts.empty());
 }else if(c=="owner-loss-tail"){
  assert(event(LEFTMOUSE,KM_PRESS));++f.object.id.session_uid;assert(event(MOUSEMOVE,0,800,800));assert(event(LEFTMOUSE,KM_RELEASE));assert(event_queue.empty()&&retire_calls>0);
 }else if(c=="higher-new-press"){
  higher_owned=true;assert(!event(LEFTMOUSE,KM_PRESS));assert(!event(LEFTMOUSE,KM_RELEASE));assert(ui_calls==0&&wm_ipad_knife_hardware_contacts.empty());
 }else if(c=="higher-after-press"){
  assert(event(LEFTMOUSE,KM_PRESS));higher_owned=true;assert(event(MOUSEMOVE,0));assert(event(LEFTMOUSE,KM_RELEASE));assert(event_queue.empty()&&retire_calls>0);
 }else if(c=="pointer-cancel"){
  assert(event(LEFTMOUSE,KM_PRESS));assert(event(LEFTMOUSE,KM_RELEASE,40,40,false,WM_EVENT_IS_POINTER_CANCEL));assert(event_queue.empty()&&wm_ipad_knife_hardware_contacts.empty());
 }else if(c=="deactivate"){
  assert(event(LEFTMOUSE,KM_PRESS));assert(event(WINDEACTIVATE,0));assert(event_queue.empty()&&!ui_pressed&&wm_ipad_knife_hardware_contacts.empty());
 }else if(c=="new-press-replaces-old"){
  assert(event(LEFTMOUSE,KM_PRESS));assert(event(LEFTMOUSE,KM_PRESS));assert(retire_calls==1);assert(event(LEFTMOUSE,KM_RELEASE));assert(event_queue.size()==1&&native_calls==0);
 }else if(c=="unmatched-release"){
  assert(!event(LEFTMOUSE,KM_RELEASE));assert(ui_calls==0&&event_queue.empty());
 }else if(c=="scope-reentry"){
  f.scope();assert(!event(LEFTMOUSE,KM_PRESS));assert(event_queue.empty()&&ui_calls==0);wm_ipad_knife_ui_scope={};
 }else if(c=="capacity-inert-tail"){
  std::vector<wmWindow>windows(65);for(auto&w:windows){w.runtime=&f.winruntime;w.winid=400+int(&w-windows.data());BLI_addtail(&f.manager.windows,&w);wm_ipad_knife_hardware_contacts[uintptr_t(&w)]={{},uint64_t(w.winid),55};}
  receipt_current=false;assert(event(LEFTMOUSE,KM_PRESS));assert(wm_ipad_knife_hardware_contacts.count(uintptr_t(&f.win)));assert(event(LEFTMOUSE,KM_RELEASE));assert(event_queue.empty());
 }else assert(false);
 assert(native_calls==0&&provider_callbacks==0);wm_ipad_knife_hardware_contacts.clear();
 }std::cout<<"PASS "<<c<<" full actual premodal HUD dispatcher; hierarchy/UI are external boundaries\n";
}
'''
CASES=('hardware-inside','tagged-inside','tagged-higher-press','tagged-different-footprint','tagged-standard-hud','tagged-stale-knife','hardware-outside','canvas-origin','stale-covered-press','window-id-tail','owner-loss-tail','higher-new-press','higher-after-press','pointer-cancel','deactivate','new-press-replaces-old','unmatched-release','scope-reentry','capacity-inert-tail')
def unit():
 s=owner.PRELUDE.replace('#include <map>','#include <map>\n#include <unordered_map>')
 s=s.replace('struct wmWindow:Link{','struct wmWindow:Link{bool event_queue_check_click=true,event_queue_check_drag=true;')
 s=s.replace('struct wmEvent{','constexpr int LEFTMOUSE=110,MOUSEMOVE=111,INBETWEEN_MOUSEMOVE=112,WINDEACTIVATE=113,KM_PRESS=1,KM_RELEASE=2,WM_EVENT_IS_POINTER_CANCEL=64;\nstruct wmEvent{int flag=0;uint64_t ipad_hud_generation=0,ipad_hud_serial=0;')
 owners='\n'.join(owner.BODIES[s] for s in owner.OWNER_SIGNATURES[:6])
 tail='\n'.join(owner.BODIES[s] for s in owner.OWNER_SIGNATURES[6:])
 fixture=owner.TEST_MAIN[:owner.TEST_MAIN.index('int main(')]
 return s+owner.HEADER_BODY+owner.UI_PREDICATE+owner.OWNER_ENUM+owners+owner.REQUEST_TYPES+tail+MODEL+TYPES+DISPATCH+fixture+MAIN
class KnifeHUDDispatchTests(unittest.TestCase):
 @classmethod
 def setUpClass(cls):
  cls.results=[];(OUT/'report.json').write_text('{"status":"RUNNING"}')
  cpp=OUT/'actual-hud-dispatch.cc';cpp.write_bytes(unit().encode());cls.exe=OUT/('dispatch.exe' if os.name=='nt' else 'dispatch')
  compiler=shutil.which('clang++')or 'C:/Program Files/LLVM/bin/clang++.exe'
  r=subprocess.run([compiler,'-std=c++17','-O'+O.opt_level,str(cpp),'-o',str(cls.exe)],capture_output=True,text=True)
  (OUT/'compile.log').write_bytes((r.stdout+r.stderr).encode())
  if r.returncode:raise RuntimeError(r.stderr)
 @classmethod
 def tearDownClass(cls):
  report={'status':'PASS'if len(cls.results)==len(CASES) and all(x['code']==0 for x in cls.results)else'FAILED','cases':cls.results,'dispatcher_sha256':hashlib.sha256(DISPATCH.encode()).hexdigest(),'fixture_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'opt':O.opt_level,'limits':['Actual full WM HUD dispatcher and owner/queue bodies execute. UI state/hit/published receipt API behavior is modeled; separate native UI and actual screen receipt gates remain required.','No full scheduler/GHOST/UIKit/geometry/history/device proof. Source does not synthesize mouse down/up.']};(OUT/'report.json').write_bytes((json.dumps(report,indent=2)+'\n').encode())
 def run_case(self,c):
  r=subprocess.run([str(self.exe),c],capture_output=True,text=True);self.results.append({'case':c,'code':r.returncode,'stdout':r.stdout,'stderr':r.stderr});self.assertEqual(r.returncode,0,r.stdout+r.stderr)
for c in CASES:
 setattr(KnifeHUDDispatchTests,'test_'+c.replace('-','_'),lambda self,c=c:self.run_case(c))
if __name__=='__main__':unittest.main(argv=[sys.argv[0]]+ARGS)
