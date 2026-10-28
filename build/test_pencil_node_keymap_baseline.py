"""Execute actual pinned native View2D keymap import/add/copy/property baseline.

The companion extracts native bodies and exact DNA/PointerRNA declarations.
Host allocator, registry and scalar RNA schema boundaries are documented in the
new result report. This prerequisite covers both NDOF registration profiles.
"""
from pathlib import Path
import argparse, importlib.util, json, subprocess, sys, tempfile, unittest
parser=argparse.ArgumentParser(add_help=False)
parser.add_argument('--repo',type=Path,default=Path(__file__).resolve().parents[1])
parser.add_argument('--source-dir',type=Path)
parser.add_argument('--output-dir',type=Path)
parser.add_argument('--opt-level',choices=['0','2','both'],default='both')
OPTIONS,UNITTEST_ARGS=parser.parse_known_args()
REPO=OPTIONS.repo.resolve()
OUT=(OPTIONS.output_dir or Path(tempfile.mkdtemp(prefix='node-keymap-baseline-'))).resolve()
class PencilNodeKeymapBaselineTests(unittest.TestCase):
 def test_actual_native_registration_import_and_copy(self):
  driver=Path(__file__).parent/'tests/node_keymap_baseline/baseline.py'
  command=[sys.executable,str(driver),'--repo',str(REPO),'--output-dir',str(OUT),'--opt-level',OPTIONS.opt_level]
  if OPTIONS.source_dir:command.extend(['--source-dir',str(OPTIONS.source_dir)])
  run=subprocess.run(command,capture_output=True,text=True)
  OUT.mkdir(parents=True,exist_ok=True)
  (OUT/'driver.log').write_text(run.stdout+run.stderr,encoding='utf-8')
  self.assertEqual(run.returncode,0,run.stdout+run.stderr)
  report=json.loads((OUT/'baseline-report.json').read_text())
  self.assertEqual(report['status'],'PASS')
  self.assertEqual([e['opt'] for e in report['executions']],['0','2'] if OPTIONS.opt_level=='both' else [OPTIONS.opt_level])
  for result in report['executions']:
   self.assertEqual([c['ndof_registered'] for c in result['cases']],[True,False])
   self.assertEqual(result['unexpected_pointer_refine'],0)
   for case in result['cases']:
    self.assertEqual(len(case['effective_after_reimport']['items']),25)
    self.assertEqual(case['effective_after_reimport']['kmi_id'],50)
    self.assertEqual(case['default_after_reimport']['flag'],64)
    self.assertEqual(case['effective_after_reimport']['flag'],2)
    self.assertEqual(case['pan_item_val'],-1)
    self.assertEqual(case['pan_event_val'],0)
    self.assertTrue(case['pan_native_match'])
    self.assertTrue(case['ctrlzoom_native_match'])
    self.assertTrue(case['default_update_preserved'])
if __name__=='__main__':unittest.main(argv=[sys.argv[0],*UNITTEST_ARGS])
