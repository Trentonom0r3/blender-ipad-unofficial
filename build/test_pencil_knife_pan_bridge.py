"""Execute fresh native Knife PAN bridge, queues, context and completed canvas.

The companion model driver extracts actual changed and pinned native function
bodies. Native-shaped backing objects, allocation, GPU/system and operator/type
registries are explicit boundaries; no SDK/UIKit/device claim is made.
"""
from pathlib import Path
import argparse,hashlib,json,subprocess,sys,tempfile,time,unittest
parser=argparse.ArgumentParser(add_help=False)
parser.add_argument('--repo',type=Path,default=Path(__file__).resolve().parents[1])
parser.add_argument('--source-dir',type=Path)
parser.add_argument('--output-dir',type=Path)
parser.add_argument('--opt-level',choices=['0','2','both'],default='both')
OPTIONS,UNITTEST_ARGS=parser.parse_known_args()
REPO=OPTIONS.repo.resolve()
OUT=(OPTIONS.output_dir or Path(tempfile.mkdtemp(prefix='knife-pan-bridge-tests-'))).resolve()
PATHS=[
 'source/blender/windowmanager/intern/wm_event_system.cc',
 'source/blender/windowmanager/intern/wm_draw.cc',
 'source/blender/editors/space_api/spacetypes.cc',
 'source/blender/editors/mesh/editmesh_knife.cc',
 'source/blender/windowmanager/WM_ipad_knife.hh',
 'source/blender/windowmanager/wm_draw.hh',
 'source/blender/windowmanager/intern/wm_window.cc',
 'source/blender/editors/screen/screen_ipad_panels.cc',
 'source/blender/windowmanager/intern/wm_toolsystem.cc',
 'source/blender/windowmanager/wm_event_types.hh',
 'source/blender/windowmanager/gizmo/intern/wm_gizmo_map.cc',
 'intern/ghost/GHOST_NavigationIOS.hh',
 'intern/ghost/intern/GHOST_WindowIOS.mm',
]
class PencilKnifePanBridgeTests(unittest.TestCase):
 @classmethod
 def setUpClass(cls):
  OUT.mkdir(parents=True,exist_ok=True)
  if OPTIONS.source_dir:
   cls.source_dir=OPTIONS.source_dir.resolve()
  else:
   sys.path.insert(0,str(REPO/'build'))
   import preflight,test_touch_extrude as touch
   pin=preflight.pinned_commit(REPO)
   cache=REPO/'.cache/preflight'
   touch.PIN_ROOT=cache/pin;touch.changed_source.cache_clear()
   cls.source_dir=OUT/'materialized';cls.source_dir.mkdir(exist_ok=True)
   for path in PATHS:
    marker=f'diff --git a/{path} b/{path}\n'
    text=touch.changed_source(path) if marker in touch.PATCH_TEXT else preflight.get_source(pin,path,cache,False).decode('utf-8')
    target=cls.source_dir/path;target.parent.mkdir(parents=True,exist_ok=True);target.write_text(text,encoding='utf-8',newline='\n')
   # These unchanged pinned implementations execute in the fixture too.
   for path in ['source/blender/blenkernel/intern/context.cc','source/blender/blenkernel/intern/workspace.cc','intern/ghost/intern/GHOST_EventManager.cc','intern/ghost/intern/GHOST_System.hh']:
    preflight.get_source(pin,path,cache,False)
 def test_actual_native_bridge_and_completed_canvas(self):
  driver=Path(__file__).parent/'tests/knife_pan_bridge_models.py'
  if not driver.is_file():driver=Path(__file__).with_name('knife_pan_bridge_models.py')
  command=[sys.executable,str(driver),'--repo',str(REPO),'--source-dir',str(self.source_dir),'--output-dir',str(OUT),'--opt-level',OPTIONS.opt_level]
  report_path=OUT/'test-results.json'
  if report_path.exists():report_path.rename(OUT/f'previous-report-{time.time_ns()}.json')
  run=subprocess.run(command,capture_output=True,text=True)
  (OUT/'driver.log').write_text(run.stdout+run.stderr,encoding='utf-8')
  self.assertEqual(run.returncode,0,run.stdout+run.stderr)
  self.assertTrue(report_path.is_file(),'driver produced no new result report')
  report=json.loads(report_path.read_text())
  self.assertEqual(report['status'],'PASS')
  self.assertTrue(report.get('connected_ghost_native_chain'))
  self.assertEqual(report['script_sha256'],hashlib.sha256(driver.read_bytes()).hexdigest(),'stale source-driver report')
  self.assertGreaterEqual(report['count'],84 if OPTIONS.opt_level!='both' else 168)
if __name__=='__main__':unittest.main(argv=[sys.argv[0],*UNITTEST_ARGS])
