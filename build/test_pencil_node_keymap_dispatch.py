"""Execute connected actual raw-keymap classification, native dispatch and View2D."""
from pathlib import Path
import argparse,json,subprocess,sys,tempfile,unittest
parser=argparse.ArgumentParser(add_help=False)
parser.add_argument('--repo',type=Path,default=Path(__file__).resolve().parents[1])
parser.add_argument('--source-dir',type=Path)
parser.add_argument('--output-dir',type=Path)
OPTIONS,UNITTEST_ARGS=parser.parse_known_args()
REPO=OPTIONS.repo.resolve()
OUT=(OPTIONS.output_dir or Path(tempfile.mkdtemp(prefix='node-keymap-dispatch-'))).resolve()
class PencilNodeKeymapDispatchTests(unittest.TestCase):
 @classmethod
 def setUpClass(cls):
  if OPTIONS.source_dir:cls.source=OPTIONS.source_dir.resolve();return
  sys.path.insert(0,str(REPO/'build'))
  import preflight,test_touch_extrude as touch
  pin=preflight.pinned_commit(REPO);touch.PIN_ROOT=REPO/'.cache/preflight'/pin;touch.changed_source.cache_clear()
  cls.source=OUT/'materialized';cls.source.mkdir(parents=True,exist_ok=True)
  for path in ['source/blender/windowmanager/intern/wm_event_system.cc','source/blender/windowmanager/WM_types.hh','source/blender/windowmanager/wm_event_system.hh','source/blender/editors/interface/view2d/view2d_ops.cc','source/blender/editors/include/UI_view2d.hh']:
   if f'diff --git a/{path} b/{path}\n' in touch.PATCH_TEXT:
    if dict(preflight.patch_files(touch.PATCH_TEXT))[path]:preflight.get_source(pin,path,REPO/'.cache/preflight',False)
    data=touch.changed_source(path)
   else:data=preflight.get_source(pin,path,REPO/'.cache/preflight',False).decode()
   file=cls.source/path;file.parent.mkdir(parents=True,exist_ok=True);file.write_text(data,encoding='utf-8',newline='\n')
 def test_actual_selected_keymap_to_native_invoke_and_view2d(self):
  driver=Path(__file__).parent/'tests/node_keymap_dispatch/connected.py'
  run=subprocess.run([sys.executable,str(driver),'--repo',str(REPO),'--source-dir',str(self.source),'--output-dir',str(OUT)],capture_output=True,text=True)
  OUT.mkdir(parents=True,exist_ok=True);(OUT/'driver.log').write_text(run.stdout+run.stderr,encoding='utf-8')
  self.assertEqual(run.returncode,0,run.stdout+run.stderr)
  report=json.loads((OUT/'dispatch-report.json').read_text());self.assertEqual(report['status'],'PASS')
  self.assertEqual([r['optimization'] for r in report['executions']],['O0','O2'])
  for r in report['executions']:self.assertIn('scenarios passed 492',r['stdout'])
if __name__=='__main__':unittest.main(argv=[sys.argv[0],*UNITTEST_ARGS])
