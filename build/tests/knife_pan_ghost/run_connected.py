"""Isolated actual-source GHOST Knife paired-PAN component proof."""
from pathlib import Path
from datetime import datetime,timezone
import ast,hashlib,json,re,subprocess
import argparse,shutil,sys,tempfile
FIXTURES=Path(__file__).resolve().parent
DEFAULT_REPO=next(p for p in Path(__file__).resolve().parents if (p/'build/preflight.py').is_file())
parser=argparse.ArgumentParser()
parser.add_argument('--repo',type=Path,default=DEFAULT_REPO)
parser.add_argument('--source-root',type=Path)
parser.add_argument('--cache-dir',type=Path)
parser.add_argument('--output-dir',type=Path)
options=parser.parse_args()
REPO=options.repo.resolve()
SRC=options.source_root.resolve() if options.source_root else None
OUT=options.output_dir.resolve() if options.output_dir else FIXTURES
OUT.mkdir(parents=True,exist_ok=True)
sys.path.insert(0,str(REPO/'build'))
import preflight,test_touch_extrude as touch
PIN=preflight.pinned_commit(REPO)
CACHE_BASE=options.cache_dir.resolve() if options.cache_dir else REPO/'.cache/preflight'
CACHE=CACHE_BASE/PIN
touch.PIN_ROOT=CACHE
touch.PATCH_TEXT=(REPO/'patches/blender-ipad.patch').read_text(encoding='utf-8')
touch.changed_source.cache_clear()
RETAINED=FIXTURES/'retained-connected-models.inc.cc'
INPUTS={}
def read(p):return p.read_text(encoding='utf-8-sig')
def current_source(rel):
 if SRC:
  value=read(SRC/rel)
 else:
  marker=f'diff --git a/{rel} b/{rel}\n'
  if marker in touch.PATCH_TEXT:
   needed=dict(preflight.patch_files(touch.PATCH_TEXT))[rel]
   if needed:preflight.get_source(PIN,rel,CACHE_BASE,False)
   value=touch.changed_source(rel)
  else:value=preflight.get_source(PIN,rel,CACHE_BASE,False).decode('utf-8')
 INPUTS[rel]=value
 return value
def upstream_source(rel):
 value=preflight.get_source(PIN,rel,CACHE_BASE,False).decode('utf-8')
 INPUTS['upstream:'+rel]=value
 return value
def sha(s):return hashlib.sha256(s.encode()).hexdigest()
def function(s,m):
 start=s.index(m);brace=s.index('{',start)
 while ';' in s[start:brace]:
  start=s.index(m,start+len(m));brace=s.index('{',start)
 depth=1;i=brace+1
 while depth:
  if s[i]=='{':depth+=1
  elif s[i]=='}':depth-=1
  i+=1
 return s[start:i]
def between(s,a,b):
 start=s.index(a);return s[start:s.index(b,start)]
def replace_once(s,a,b):
 assert s.count(a)==1,(a[:100],s.count(a));return s.replace(a,b,1)
IOS=current_source('intern/ghost/intern/GHOST_WindowIOS.mm');NAV=current_source('intern/ghost/GHOST_NavigationIOS.hh')
BASELINE=read(FIXTURES/'baseline-GHOST_WindowIOS.mm')
old=read(RETAINED)
assert hashlib.sha256(RETAINED.read_bytes()).hexdigest()=='d84915f3be68f3a58fbb41e332c7a7229c5e1f0a652e65ac334eb5b0a8d38541'
legacy_ast=ast.parse(read(REPO/'build/test_pencil_pan_paint_producer.py'))
translations=next(ast.literal_eval(n.value) for n in legacy_ast.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='TRANSLATIONS' for t in n.targets))
translations.update({'[sender recognizeKnifePan]':'sender.recognizeKnifePan()','[sender omitKnifePairedPan]':'sender.omitKnifePairedPan()'})
def translate_pan(s,name):
 s=s.replace('- (void)handlePan:(GHOSTUIPanGestureRecognizer *)sender','void '+name+'(Sender &sender)')
 for a,b in translations.items():s=s.replace(a,b)
 assert '[sender ' not in s and '[self ' not in s
 return s
PAN=function(IOS,'- (void)handlePan:(GHOSTUIPanGestureRecognizer *)sender\n{')
OLD_PAN=function(BASELINE,'- (void)handlePan:(GHOSTUIPanGestureRecognizer *)sender\n{')
ADDITION='  if (sender.state == UIGestureRecognizerStateBegan) {\n    [sender recognizeKnifePan];\n  }\n  const bool omit_knife_paired_pan = [sender omitKnifePairedPan];\n'
assert PAN.replace(ADDITION,'').replace('!event_info.pencil_paint.valid() && !omit_knife_paired_pan &&','!event_info.pencil_paint.valid() &&')==OLD_PAN
assert function(old,'void producer(Sender &sender)')==translate_pan(OLD_PAN,'producer')
for marker in ['- (void)generateUserInputEvents:','- (void)handleIndirectPan:','- (void)handlePan2f:','- (void)handlePan3f:','- (void)handleZoom:','- (void)cancelPointerCapture']:
 assert function(IOS,marker)==function(BASELINE,marker),marker
# Retained connected generator has only its documented logging translation.
g=function(IOS,'- (void)generateUserInputEvents:');g=g[g.index('    const GHOST_TabletData event_tablet ='):g.rfind('  }\n}')]
g=re.sub(r'      IOS_INPUT_LOG\([\s\S]*?\);\n','',g).replace('FALSE','false')
ret_g=function(old,'void generateUserInputEvents(')
assert re.sub(r'\s+','',g)==re.sub(r'\s+','',ret_g[ret_g.index('{')+1:ret_g.rfind('}')])
for name in ('GHOST_EventCursor','GHOST_EventButton'):
 actual=current_source('intern/ghost/intern/'+name+'.hh');assert function(old,'class '+name+' :')==function(actual,'class '+name+' :')
oldnav=old[old.index('/* SPDX-License-Identifier: GPL-2.0-or-later */'):old.index('}  // namespace ghost::ios')+len('}  // namespace ghost::ios')]
code=replace_once(old,oldnav,NAV.replace('#pragma once',''))
code=replace_once(code,function(code,'void producer(Sender &sender)'),translate_pan(PAN,'producer')+'\n'+translate_pan(OLD_PAN,'producer_baseline'))
code=code[:code.index('int main(){')]
# Synchronize the retained explicit vector/list adapter after modeled WM consumption.
code=replace_once(code,'void queue_native(wmWindow*win,GHOST_Event*packet){','void queue_native(wmWindow*win,GHOST_Event*packet){\n if(wm_queue.empty())win->runtime->event_queue.last=nullptr;')
UI=r'''
#include <functional>
#include <limits>
#include <sstream>
#include <iomanip>
struct CGRect {double x=0,y=0,w=700,h=700;};
bool CGRectContainsPoint(CGRect r,CGPoint p){return p.x>=r.x&&p.y>=r.y&&p.x<r.x+r.w&&p.y<r.y+r.h;}
struct UIView {CGRect bounds;};UIView model_view,foreign_view;
enum {UITouchTypeDirect=1,UITouchTypePencil,UITouchTypeIndirect,UITouchTypeIndirectPointer};
struct UITouch {int type=UITouchTypePencil;UIView*view=&model_view;CGPoint local{100,100};
 double force=.4,maximumPossibleForce=1,azimuth=0,altitudeAngle=1;
 CGPoint locationInView(UIView*){return local;}double azimuthAngleInView(UIView*){return azimuth;}};
struct Touches {std::vector<UITouch*>items;size_t count;Touches(std::initializer_list<UITouch*>v):items(v),count(items.size()) {}};
std::function<void()> super_begin_hook;int super_begins=0,super_resets=0;
void superBegan(){++super_begins;if(super_begin_hook)super_begin_hook();}void superReset(){++super_resets;}
'''
code=replace_once(code,'struct GHOST_IWindow{};',UI+'\nstruct GHOST_IWindow{UIView*view=&model_view;UIView*getView(){return view;}CGPoint scalePointToWindow(CGPoint p){return p;}};\nusing GHOST_WindowIOS=GHOST_IWindow;')
code=replace_once(code,'virtual ~GHOST_Event()=default;','int getType() const{return type;} virtual ~GHOST_Event()=default;')
QUEUE=upstream_source('intern/ghost/intern/GHOST_EventManager.cc')
queue=r'''
#include <deque>
using GHOST_IEvent=GHOST_Event;using GHOST_TSuccess=int;enum{GHOST_kSuccess=1,GHOST_kFailure=0};
struct GHOST_EventManager {using TEventStack=std::deque<const GHOST_IEvent*>;TEventStack events_;
 uint32_t getNumEvents(GHOST_TEventType type);GHOST_TSuccess pushEvent(const GHOST_IEvent*event);};
'''+function(QUEUE,'uint32_t GHOST_EventManager::getNumEvents(GHOST_TEventType type)')+'\n'+function(QUEUE,'GHOST_TSuccess GHOST_EventManager::pushEvent(')+'\nGHOST_EventManager actual_manager;\n'
oldsys=function(code,'struct System {')+';'
system=oldsys.replace('std::vector<GHOST_Event*> queue;','std::vector<GHOST_Event*> queue;GHOST_EventManager*event_manager=&actual_manager;GHOST_EventManager*getEventManager()const{return event_manager;}')
system=system.replace('queue.push_back(event);','actual_manager.pushEvent(event);queue.push_back(event);').replace('void clear(){','void clear(){actual_manager.events_.clear();')
code=replace_once(code,oldsys,queue+system)
wrapper=between(IOS,'namespace ghost::ios {\n\nstatic bool pencil_knife_pan_keyboard_queue_clear()','}  // namespace ghost::ios')+'}  // namespace ghost::ios\n'
code=replace_once(code,'enum { UIGestureRecognizerStateBegan=1,','using GHOST_System=System;struct GHOST_ISystem {static GHOST_System*getSystem(){return system;}};\n'+wrapper+'enum { UIGestureRecognizerStateBegan=1,')
recognizer=IOS.split('@implementation GHOSTUIPanGestureRecognizer',1)[1].split('@end',1)[0]
def objc(s):
 s=s.replace('NSSet<UITouch *> *touches','const Touches &touches').replace('UIEvent *event','int event')
 s=s.replace('for (UITouch *touch in touches)','for (UITouch *touch : touches.items)')
 for a,b in {'[self forgetKnifePanContact]':'forgetKnifePanContact()','[super touchesBegan:touches withEvent:event]':'superBegan()',
 '[super reset]':'superReset()','[touch locationInView:self.view]':'touch->locationInView(view)',
 '[touch locationInView:owner_view]':'touch->locationInView(owner_view)','[touch azimuthAngleInView:view]':'touch->azimuthAngleInView(view)',
 'self.view.bounds':'view->bounds','self.view':'view','touch.type':'touch->type','touch.view':'touch->view',
 'touch.force':'touch->force','touch.maximumPossibleForce':'touch->maximumPossibleForce','touch.altitudeAngle':'touch->altitudeAngle',
 'pencil_paint_origin':'contact','ring_origin':'ring','hud_origin':'hud'}.items():s=s.replace(a,b)
 assert '[' not in s,s
 return s
helpers='\n'.join(objc(function(IOS,m)) for m in ['static ghost::ios::PencilRingContact ios_ring_contact_at_start(','static ghost::ios::TouchDevice ios_touch_device(','static ghost::ios::PencilSample ios_pencil_sample('])
methods=[]
for sig,new in [('- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event','void touchesBegan(const Touches &touches,int event=0)'),('- (void)reset','void reset()'),('- (BOOL)touchStreamAllowed','bool touchStreamAllowed()'),('- (void)invalidateTouchStream','void invalidateTouchStream()'),('- (void)forgetKnifePanContact','void forgetKnifePanContact()'),('- (void)recognizeKnifePan','void recognizeKnifePan()'),('- (BOOL)omitKnifePairedPan','bool omitKnifePairedPan()')]:
 methods.append(objc(function(recognizer,sig).replace(sig,new)))
oldsender=function(code,'struct Sender {')+';'
sender=r'''struct Sender {int state=UIGestureRecognizerStateBegan;bool pencil=true;
 CGPoint touch_point{110,100},translation{10,0},cached,cached_translation;
 ghost::ios::PencilSample sample{true,.4f,.2f,-.1f};ghost::ios::PencilPaintContact contact;
 ghost::ios::HUDContact hud;ghost::ios::PencilRingContact ring;
 ghost::ios::GestureContact gesture_contact;ghost::ios::TouchAdmission touch_admission;
 GHOST_WindowIOS*ring_window=window;UIView*view=&model_view;
 ghost::ios::PencilKnifePanContact pencil_knife_pan_origin;
 bool omit_knife_paired_pan=false,knife_pan_recognized=false;
 Sender(){touch_admission.begin();}
 METHODS
 void setCachedTranslation(CGPoint p){cached=p;cached_translation=p;}
 CGPoint getRelativeTranslation(CGPoint p){return {p.x-cached.x,p.y-cached.y};} };
'''.replace('METHODS','\n'.join(methods))
code=replace_once(code,oldsender,helpers+'\n'+sender)
zoom=upstream_source('source/blender/editors/space_view3d/view3d_navigate_view_zoom.cc')
native_functions=['static void view_zoom_to_window_xy_3d(','static float viewzoom_scale_value(','static float viewzoom_scale_value_offset(','static void viewzoom_apply_3d(','static void viewzoom_apply(','static wmOperatorStatus viewzoom_invoke_impl(','static wmOperatorStatus viewzoom_invoke(']
for marker in native_functions:assert function(code,marker)==function(zoom,marker),marker

# Actual native Circle/Transform bodies plus named bounded state adapters.
parity_models=read(FIXTURES/'native-parity-models.inc.cc')
parity_models=re.sub(r'^#include .*\n','',parity_models,flags=re.M)
circle=upstream_source('source/blender/windowmanager/intern/wm_gesture_ops.cc')
transform=upstream_source('source/blender/editors/transform/transform.cc')
transform_h=upstream_source('source/blender/editors/transform/transform.hh')
event_types=upstream_source('source/blender/windowmanager/wm_event_types.hh')
gesture_enums=between(event_types,'enum {\n  GESTURE_MODAL_CANCEL','\n};')+'\n};'
transform_enums=between(transform_h,'enum {\n  TFM_MODAL_CANCEL','\n};')+'\n};'
size_limits='\n'.join(re.findall(r'^#define T_PROP_SIZE_(?:MIN|MAX) .*$',transform_h,re.M))
size_body=between(transform,'      case TFM_MODAL_PROPSIZE:\n','      case TFM_MODAL_AUTOIK_LEN_INC:')
parity='\nnamespace parity {\n'+parity_models+'\n'+gesture_enums+'\n'+transform_enums+'\n'+size_limits+'\n'+function(circle,'wmOperatorStatus WM_gesture_circle_modal(')
parity+='\nvoid transform_size(TransInfo*t,const wmEvent*event){switch(event->val){\n'+size_body+'\ndefault:assert(false);}}\n'
parity+=r"""
void consume(int dy){assert(dy==20);wmWindow win;bContext C{&win};
 rcti rect;rect.xmax=25;wmGesture g{&rect};g.is_active=true;Properties p{25};wmOperator op{&g,&p};
 wmEvent ev;ev.type=EVT_MODAL_MAP;ev.val=GESTURE_MODAL_CIRCLE_SIZE;ev.prev_xy[1]=100;ev.xy[1]=100+dy;
 assert(WM_gesture_circle_modal(&C,&op,&ev)==OPERATOR_RUNNING_MODAL);assert(rect.xmax==31&&p.radius==31);
 View3D view;TransInfo t;t.view=&view;ev.val=TFM_MODAL_PROPSIZE;transform_size(&t,&ev);assert(std::fabs(t.prop_size-2.2f)<.00001f);
 std::cout<<"PASS native Circle 25->31; Transform 2->2.2 from retained actual producer dy20 PAN\n";}
}
"""
code+=parity

code+='\n'+read(FIXTURES/'scenarios.inc.cc')
source_path=OUT/'actual-ghost-connected.cc';source_path.write_text(code,encoding='utf-8',newline='\n')
compiler=next((Path(p) for p in [shutil.which('clang++'),shutil.which('g++'),r'C:/Program Files/LLVM/bin/clang++.exe',r'C:/Program Files/Microsoft Visual Studio/18/Insiders/VC/Tools/Llvm/x64/bin/clang++.exe'] if p and Path(p).is_file()),None)
assert compiler,'C++17 compiler required'
runs=[]
for opt in ['-O0','-O2']:
 exe=OUT/('actual-ghost-connected-'+opt[1:]+'.exe');command=[str(compiler),'-std=c++17',opt,'-Wall','-Wextra',str(source_path),'-o',str(exe)]
 built=subprocess.run(command,text=True,capture_output=True);(OUT/(opt[1:]+'-compile.log')).write_text(built.stdout+built.stderr)
 if built.returncode:raise RuntimeError(built.stderr)
 for case in ['packets','gates','physical','priority','native-controls','old-ctrl','new-ctrl','old-must-fail']:
  result=subprocess.run([str(exe),case],text=True,capture_output=True)
  entry={'optimization':opt,'case':case,'returncode':result.returncode,'stdout':result.stdout,'stderr':result.stderr};runs.append(entry)
  (OUT/'runs.json').write_text(json.dumps(runs,indent=2))
  if case=='old-must-fail':
   assert result.returncode!=0 and 'pans==0' in result.stderr,(case,entry)
  elif result.returncode:raise RuntimeError(str(entry))
report={'driver_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'status':'PASS_BOUNDED_GHOST_COMPONENT','utc':datetime.now(timezone.utc).isoformat(),'source_root':str(SRC) if SRC else 'current authoritative overlay reconstructed by retained exact-hunk helper','producer_sha256':sha(PAN),'baseline_producer_sha256':sha(OLD_PAN),'generator_unchanged':True,'producer_scope_oracle':'Actual baseline exact after removing only recognized-Begin/frozen bool read and !omit predicate. Actual candidate compiled unchanged; no simulated-correction fallback.',
 'inputs':{p:sha(value) for p,value in INPUTS.items()},'fixture_inputs':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [FIXTURES/'baseline-GHOST_NavigationIOS.hh',FIXTURES/'baseline-GHOST_WindowIOS.mm',RETAINED,FIXTURES/'native-parity-models.inc.cc',FIXTURES/'scenarios.inc.cc']},
 'generated_source':{'path':str(source_path),'sha256':sha(code)},'native_zoom_actual_functions':native_functions,'circle_transform_source':{'circle':sha(circle),'transform':sha(transform)},'runs':runs,
 'boundaries':['UIKit objects/messages/super scheduling are explicit C++ adapters; actual physical recognizer method bodies execute. No UIKit/device timing proof.','Native scope/content/intent probe is instrumented; actual fresh native bridge/frame queries require separate integrated acceptance.','Queue getNumEvents(type) and pushEvent are actual pinned functions; System lookup/queue clearing/WM scheduling remain adapters.','Preserved producer/generator and native paint/zoom slices execute with retained WM/BKE/context adapters. Initial brush setup/coordinate/tablet transform/native registration are instrumentation.','No native iOS build/compiled target/device/geometry/history/Undo/universal rollback claim. No production patch/test/build edits.']}
(OUT/'report.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({'status':report['status'],'runs':len(runs),'report':str(OUT/'report.json')},indent=2))
