"""Actual physical Pencil producer, queue gates and native PAN parity.

Compiles the exact current GHOST producer and recognizer methods at O0/O2;
checks complete ordinary event packets and retained native advanced controls.
UIKit scheduling, rendering and native initial operator binding remain modeled.
"""
from pathlib import Path
import argparse,hashlib,json,subprocess,sys,tempfile,time,unittest
parser=argparse.ArgumentParser(add_help=False)
parser.add_argument('--source-root',type=Path)
parser.add_argument('--output-dir',type=Path)
OPT,ARGS=parser.parse_known_args()
REPO=Path(__file__).resolve().parents[1]
class KnifePanGhostTests(unittest.TestCase):
 def test_actual_producer_packets_and_native_parity_at_O0_O2(self):
  out=(OPT.output_dir or Path(tempfile.mkdtemp(prefix='knife-pan-ghost-'))).resolve()
  out.mkdir(parents=True,exist_ok=True)
  driver=REPO/'build/tests/knife_pan_ghost/run_connected.py'
  command=[sys.executable,'-X','utf8',str(driver),'--repo',str(REPO),'--output-dir',str(out)]
  if OPT.source_root:command+=['--source-root',str(OPT.source_root)]
  report_path=out/'report.json'
  if report_path.exists():report_path.rename(out/f'previous-report-{time.time_ns()}.json')
  result=subprocess.run(command,cwd=REPO,capture_output=True,text=True,encoding='utf-8',errors='replace',timeout=600)
  (out/'driver.log').write_bytes((result.stdout+result.stderr).encode())
  self.assertEqual(result.returncode,0,result.stdout+result.stderr)
  self.assertTrue(report_path.is_file(),'driver produced no fresh report')
  report=json.loads(report_path.read_text())
  self.assertEqual(report['driver_sha256'],hashlib.sha256(driver.read_bytes()).hexdigest(),'stale driver result')
  self.assertEqual(report['status'],'PASS_BOUNDED_GHOST_COMPONENT')
  self.assertTrue(report['generator_unchanged'])
  expected={'packets','gates','physical','priority','native-controls','old-ctrl','new-ctrl','old-must-fail'}
  self.assertEqual(len(report['runs']),16)
  for opt in ['-O0','-O2']:
   cases=[x for x in report['runs'] if x['optimization']==opt]
   self.assertEqual({x['case'] for x in cases},expected)
   for x in cases:
    if x['case']=='old-must-fail':
     self.assertNotEqual(x['returncode'],0)
     self.assertIn('pans==0',x['stderr'])
    else:self.assertEqual(x['returncode'],0,x)
if __name__=='__main__':unittest.main(argv=[sys.argv[0]]+ARGS)
