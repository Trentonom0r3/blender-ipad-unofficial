"""Connected actual-source initial Knife PAN regression; no SDK/device claim."""
from pathlib import Path
import argparse,hashlib,json,subprocess,sys,tempfile,unittest
parser=argparse.ArgumentParser(add_help=False)
parser.add_argument('--source-root',type=Path);parser.add_argument('--output-dir',type=Path)
OPTIONS,ARGS=parser.parse_known_args();REPO=Path(__file__).resolve().parents[1]
class KnifeInitialPanTests(unittest.TestCase):
 def test_actual_owner_chosen_dispatch_invoke_and_controls_O0_O2(self):
  out=(OPTIONS.output_dir or Path(tempfile.mkdtemp(prefix='knife-initial-pan-'))).resolve();out.mkdir(parents=True,exist_ok=True)
  driver=REPO/'build/tests/knife_initial_pan/connected.py';cmd=[sys.executable,'-X','utf8',str(driver),'--repo',str(REPO),'--output-dir',str(out)]
  if OPTIONS.source_root:cmd+=['--source-root',str(OPTIONS.source_root)]
  r=subprocess.run(cmd,cwd=REPO,capture_output=True,text=True,encoding='utf-8',errors='replace',timeout=600);(out/'driver.log').write_text(r.stdout+r.stderr,encoding='utf-8')
  self.assertEqual(r.returncode,0,r.stdout+r.stderr);report=json.loads((out/'report.json').read_text());self.assertEqual(report['status'],'PASS_BOUNDED_ACTUAL_KNIFE_INITIAL_PAN');self.assertFalse(report['native_abi_or_device_claim']);self.assertEqual(len(report['executions']),4)
  self.assertEqual(report['driver_sha256'],hashlib.sha256(driver.read_bytes()).hexdigest())
  for execution in report['executions']:
   self.assertEqual(execution['returncode'],0 if execution['case']=='current' else 17,execution)
   if execution['case']=='current':self.assertGreaterEqual(execution['scenarios'],67)
   else:self.assertIn('KNIFE_REQUIRED_DENIAL_FAILED exact_old_source=3d7b248 creates=1 nav_allocations=1',execution['stderr'])
if __name__=='__main__':unittest.main(argv=[sys.argv[0]]+ARGS)
