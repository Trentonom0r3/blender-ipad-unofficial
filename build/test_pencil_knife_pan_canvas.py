"""Execute actual native Knife owner/scope/callback/content/widget source.

Use --source-root for a materialized candidate; default reconstructs patch+pin.
Native rendering, allocation, lists, operator/type registries, context accessors
and native type identity are explicit instrumented boundaries. Full Blender
translation units, SDK/GPU/UIKit and device acceptance remain unproved.
"""
from pathlib import Path
import argparse,hashlib,json,os,shutil,subprocess,sys,tempfile,unittest
parser=argparse.ArgumentParser(add_help=False)
parser.add_argument('--repo',type=Path,default=Path(__file__).resolve().parents[1])
parser.add_argument('--source-root',type=Path)
parser.add_argument('--cache-dir',type=Path)
parser.add_argument('--output-dir',type=Path)
parser.add_argument('--opt-level',choices=('0','2'))
OPTIONS,UNITTEST_ARGS=parser.parse_known_args()
REPO=OPTIONS.repo.resolve()
OUT=OPTIONS.output_dir.resolve() if OPTIONS.output_dir else Path(tempfile.mkdtemp(prefix='knife-pan-canvas-'))
OUT.mkdir(parents=True,exist_ok=True)
sys.path.insert(0,str(REPO/'build'))
SOURCES={}
if not OPTIONS.source_root:
 import preflight
 import test_touch_extrude as touch
 PIN=preflight.pinned_commit(REPO)
 CACHE=OPTIONS.cache_dir.resolve() if OPTIONS.cache_dir else REPO/'.cache/preflight'
 touch.PIN_ROOT=CACHE/PIN
 touch.changed_source.cache_clear()
def read(path):
 if path not in SOURCES:
  if OPTIONS.source_root:SOURCES[path]=(OPTIONS.source_root/path).read_text(encoding='utf-8')
  else:
   marker=f'diff --git a/{path} b/{path}\n'
   if marker in touch.PATCH_TEXT:
    section=touch.PATCH_TEXT.split(marker,1)[1].split('diff --git ',1)[0]
    if '\n--- /dev/null\n' not in '\n'+section:preflight.get_source(PIN,path,CACHE,False)
    SOURCES[path]=touch.changed_source(path)
   else:SOURCES[path]=preflight.get_source(PIN,path,CACHE,False).decode('utf-8')
 return SOURCES[path]
def function(s,sig):
 a=s.index(sig);b=s.index('{',a);depth=0
 for e in range(b,len(s)):
  depth+=(s[e]=='{')-(s[e]=='}')
  if not depth:return s[a:e+1]
 raise AssertionError(sig)
wm=read('source/blender/windowmanager/intern/wm_event_system.cc');draw=read('source/blender/windowmanager/intern/wm_draw.cc');space=read('source/blender/editors/space_api/spacetypes.cc');knife=read('source/blender/editors/mesh/editmesh_knife.cc')
header=read('source/blender/windowmanager/WM_ipad_knife.hh').replace('#pragma once', '')
drawheader=read('source/blender/windowmanager/wm_draw.hh').replace('#  include "WM_ipad_knife.hh"','').replace('#pragma once', '')
structcb=function(space,'struct RegionDrawCB {')+';'
sigs=['static wmWindowManager *wm_ipad_knife_window_manager(','static bool wm_ipad_knife_owner_read(','static void wm_ipad_knife_modal_handler_bind(','bool WM_ipad_knife_owner_capture(','bool WM_ipad_knife_owner_present(','ARegion *WM_ipad_knife_owner_region(','bool WM_ipad_knife_canvas_scope_capture(','bool WM_ipad_knife_draw_callback_known(']
blocks={s:function(wm,s) for s in sigs}
bodies='\n'.join([function(knife,'bool ED_mesh_knife_modal_origin('),function(knife,'bool ED_mesh_knife_draw_callback_known('),wm[wm.index('enum eIPadKnifeOwnerIndex {'):wm.index('static wmWindowManager *wm_ipad_knife_window_manager(')],*blocks.values(),structcb,function(space,'bool ED_region_knife_pan_callbacks_safe('),function(space,'static void ed_region_draw_cb_draw('),function(draw,'static uint64_t wm_ipad_knife_canvas_content_next('),function(draw,'static void wm_ipad_knife_canvas_stamp_finish(')])
# Source seam checks cover the actual producer, avoiding an invented stamp caller.
area_draw=function(draw,'static void wm_draw_area_offscreen(')
for text in ['const bool knife_canvas_valid = !stereo','(region->runtime->do_draw & RGN_DRAW) != 0','wm_ipad_knife_canvas_stamp_finish(','paint_partial || (region->runtime->do_draw & RGN_DRAW_PARTIAL) != 0']:
 assert text in area_draw,text
assert area_draw.index('knife_canvas_before') < area_draw.index('ED_region_do_draw(C, region)') < area_draw.index('wm_ipad_knife_canvas_stamp_finish(')
assert 'ipad_knife_canvas_stamp' not in function(draw,'static void wm_draw_window_area_layer(')
onscreen=function(draw,'static void wm_draw_window_onscreen(')
assert onscreen.index('ipad_knife_canvas_unknown_widgets = false') < onscreen.index('wm_draw_window_area_layer(')
assert 'ipad_knife_canvas_unknown_widgets = true' in function(read('source/blender/windowmanager/gizmo/intern/wm_gizmo_map.cc'),'static void gizmos_draw_list(')
for forbidden in ['CTX_data_','WM_toolsystem_','BKE_view_layer_synced','ED_region_draw_cb_draw(','WM_operator_name_call','WM_operator_touch_lifetime_id(']:
 assert forbidden not in blocks['bool WM_ipad_knife_canvas_scope_capture('],forbidden

full_loop=function(draw,'static void wm_ipad_finger_rect_copy(')+function(draw,'static void wm_draw_area_offscreen(')
gizmo_loop=function(read('source/blender/windowmanager/gizmo/intern/wm_gizmo_map.cc'),'static void gizmos_draw_list(')
paintcursor_loop=function(draw,'static void wm_paintcursor_draw(')
drag_start=onscreen.index('  if (wm->runtime->drags.first) {')
drag_block=function(onscreen[drag_start:],'  if (wm->runtime->drags.first) {')
assert drag_block.index('ED_ipad_knife_hierarchy_window_callbacks(C, win, true)') < drag_block.index('wm_drags_draw(C, win)')
hierarchy_source=read('source/blender/editors/screen/screen_ipad_panels.cc')
drag_helper=function(hierarchy_source,'void ED_ipad_knife_hierarchy_window_callbacks(')
drag_actual=drag_helper+'\nstatic void actual_drag_composition(bContext*C,wmWindow*win){wmWindowManager*wm=CTX_wm_manager(C);\n'+drag_block+'\n}'



CASES=['loop-full', 'loop-redraw-token', 'loop-cached', 'loop-partial', 'loop-overlay-only', 'loop-stereo', 'loop-before-after', 'loop-known', 'loop-owner-loss', 'loop-unknown-self-removal', 'loop-unknown-cached', 'loop-unknown-cleared', 'drag-sticky-before-draw', 'drag-self-removal-sticky', 'drag-previous-opaque-preserved', 'drag-none', 'gizmo-unknown', 'gizmo-navigation', 'paintcursor-self-removal', 'scope32', 'exact-cookie', 'known-foreign-layout', 'known-foreign-workspace', 'foreign-cookie', 'function-only', 'foreign-function', 'foreign-data', 'foreign-type', 'foreign-region', 'operator-lifetime', 'type-lifetime', 'owner-removed', 'owner-replaced', 'callback-list-known', 'callback-list-empty', 'callback-list-duplicate', 'callback-list-foreign', 'callback-known-stamp', 'callback-self-removal', 'full-redraw-token-cached-retention', 'unknown-changes-token', 'owner-changes-token', 'known-rendered-owner-stale', 'partial', 'stereo', 'allocation', 'allocation-failure', 'scope-drift-during-draw', 'geometry-changes-token', 'workspace-removed', 'layout-removed', 'main-removed', 'window-removed', 'screen-removed', 'area-removed', 'region-removed', 'scene-removed', 'object-removed', 'mesh-removed', 'missing-editmesh', 'missing-bmesh', 'out-of-sync', 'foreign-basact', 'hidden-region', 'locked-draw', 'status-text', 'minimized', 'invalid-geometry', 'invalid-canvas', 'invalid-scale', 'nan-scale', 'positive-inf-scale', 'negative-inf-scale']

FIXTURE_FILES=('knife_pan_canvas_models.inc.cc','knife_pan_canvas_draw_models.inc.cc','knife_pan_canvas_cases.inc.cc')
FIXTURE_ROOT=Path(__file__).resolve().parent/'tests'
fixtures=[(FIXTURE_ROOT/p).read_text(encoding='utf-8') for p in FIXTURE_FILES]
source=fixtures[0]+header+drawheader+bodies+fixtures[1]+full_loop+gizmo_loop+paintcursor_loop+drag_actual+fixtures[2]
nonapple_wm=wm[wm.index('#else',wm.index('static void wm_ipad_knife_modal_handler_bind(')):]
nonapple_stubs=function(nonapple_wm,'bool WM_ipad_knife_canvas_scope_capture(')+function(nonapple_wm,'bool WM_ipad_knife_draw_callback_known(')
nonapple_main=r"""
static void callback(const bContext*,ARegion*,void*){++executed;}
int main(){bContext C;ARegionRuntime runtime;ARegionType art;ARegion region;runtime.type=&art;region.runtime=&runtime;RegionDrawCB cb{};cb.draw=callback;cb.type=REGION_DRAW_POST_VIEW;BLI_addtail(&art.drawcalls,&cb);wmIPadKnifeOwner owner;owner.values.fill(1);std::array<uint64_t,32>scope;scope.fill(1);
 assert((!WM_ipad_knife_canvas_scope_capture(&C,nullptr,nullptr,&region,scope)&&scope==std::array<uint64_t,32>{}));
 assert(!ED_region_knife_pan_callbacks_safe(&C,&region,owner)&&!owner.valid()&&executed==0);
 ed_region_draw_cb_draw(&C,&region,&art,REGION_DRAW_POST_VIEW);
 assert(executed==1&&!runtime.ipad_finger_paint_overlay_blocked&&!runtime.ipad_knife_canvas_unknown_widgets&&!runtime.ipad_knife_canvas_drawn_owner[0]);
 std::cout<<"nonApple-stubs-current-callback PASS\n";
}
"""
nonapple_source=fixtures[0].replace('#define WITH_APPLE_CROSSPLATFORM 1','')+header+nonapple_stubs+structcb+function(space,'bool ED_region_knife_pan_callbacks_safe(')+function(space,'static void ed_region_draw_cb_draw(')+nonapple_main

OPTS=[OPTIONS.opt_level] if OPTIONS.opt_level else ['0','2']
class KnifePanCanvasTests(unittest.TestCase):
 @classmethod
 def setUpClass(cls):
  cls.results=[];cls.executables={}
  cls.cpp=OUT/'actual_native_canvas.cc';cls.cpp.write_text(source,encoding='utf-8',newline='\n')
  compiler=shutil.which('clang++') or ('C:/Program Files/LLVM/bin/clang++.exe' if os.name=='nt' else shutil.which('g++'))
  if not compiler:raise RuntimeError('A C++17 compiler is required')
  for opt in OPTS:
   exe=OUT/('actual-native-canvas-O'+opt+('.exe' if os.name=='nt' else ''))
   build=subprocess.run([compiler,'-std=c++17','-O'+opt,str(cls.cpp),'-o',str(exe)],capture_output=True,text=True,encoding='utf-8',errors='replace')
   (OUT/f'compile-O{opt}.log').write_text(build.stdout+build.stderr,encoding='utf-8')
   if build.returncode:raise RuntimeError('Native canvas fixture compilation failed: '+str(OUT/f'compile-O{opt}.log'))
   cls.executables[opt]=exe
  cpp=OUT/'actual-nonApple-canvas.cc';cpp.write_text(nonapple_source,encoding='utf-8',newline='\n')
  exe=OUT/('actual-nonApple-canvas'+('.exe' if os.name=='nt' else ''))
  build=subprocess.run([compiler,'-std=c++17',str(cpp),'-o',str(exe)],capture_output=True,text=True,encoding='utf-8',errors='replace')
  (OUT/'compile-nonApple.log').write_text(build.stdout+build.stderr,encoding='utf-8')
  if build.returncode:raise RuntimeError('NonApple canvas fixture compilation failed: '+str(OUT/'compile-nonApple.log'))
  cls.executables['nonApple']=exe
 @classmethod
 def tearDownClass(cls):
  complete=len(cls.results)==len(CASES)*len(OPTS)+1;passed=all(r['returncode']==0 for r in cls.results)
  report={'status':'PASS' if complete and passed else 'FAIL_OR_INCOMPLETE','case_count':len(CASES),'opt_levels':OPTS,'results':cls.results,
   'source_root':str(OPTIONS.source_root) if OPTIONS.source_root else 'PATCH_PLUS_PIN',
   'source_hashes':{p:hashlib.sha256(v.encode()).hexdigest() for p,v in SOURCES.items()},
   'actual_native_functions':{s:hashlib.sha256(v.encode()).hexdigest() for s,v in blocks.items()},
   'actual_draw_loop_sha256':hashlib.sha256(full_loop.encode()).hexdigest(),
   'actual_gizmo_loop_sha256':hashlib.sha256(gizmo_loop.encode()).hexdigest(),
   'actual_paintcursor_loop_sha256':hashlib.sha256(paintcursor_loop.encode()).hexdigest(),
   'actual_drag_composition_sha256':hashlib.sha256(drag_actual.encode()).hexdigest(),
   'harness_sha256':hashlib.sha256(source.encode()).hexdigest(),
   'test_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
   'fixture_hashes':{p:hashlib.sha256((FIXTURE_ROOT/p).read_bytes()).hexdigest() for p in FIXTURE_FILES},
   'boundaries':__doc__,'native_sdk_or_gpu_build':False,'device_acceptance':False}
  (OUT/'test-results.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
 def test_nonApple_stubs_and_current_callback_inspection(self):
  self.run_case('nonApple','nonApple-stubs-current-callback')
 def run_case(self,opt,case):
  run=subprocess.run([str(self.executables[opt]),case],capture_output=True,text=True,encoding='utf-8',errors='replace')
  self.results.append(dict(opt=opt,case=case,returncode=run.returncode,stdout=run.stdout,stderr=run.stderr))
  self.assertEqual(run.returncode,0,run.stdout+run.stderr)
for _opt in OPTS:
 for _case in CASES:
  def runtime_test(self,opt=_opt,case=_case):self.run_case(opt,case)
  setattr(KnifePanCanvasTests,'test_O'+_opt+'_'+_case.replace('-','_'),runtime_test)
if __name__=='__main__':unittest.main(argv=[sys.argv[0]]+UNITTEST_ARGS)
