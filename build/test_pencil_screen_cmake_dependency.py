"""Actual native CMake private/public header ownership regression.

Executes pinned CMake definitions and full current value-only headers. Native
library source lists alone use small stand-ins; no iOS SDK/device proof.
"""
from pathlib import Path
import argparse,hashlib,json,subprocess,sys,tempfile,time,unittest
parser=argparse.ArgumentParser(add_help=False)
parser.add_argument('--output-dir',type=Path)
OPT,ARGS=parser.parse_known_args()
REPO=Path(__file__).resolve().parents[1]
class ScreenGhostDependencyTests(unittest.TestCase):
 def test_actual_cmake_visibility_and_native_public_headers(self):
  out=(OPT.output_dir or Path(tempfile.mkdtemp(prefix='screen-ghost-cmake-'))).resolve();out.mkdir(parents=True,exist_ok=True)
  driver=REPO/'build/tests/knife_screen_cmake/run_visibility.py';report_path=out/'report.json'
  if report_path.exists():report_path.rename(out/f'previous-report-{time.time_ns()}.json')
  run=subprocess.run([sys.executable,'-X','utf8',str(driver),'--repo',str(REPO),'--output-dir',str(out)],cwd=REPO,capture_output=True,text=True,encoding='utf-8',errors='replace',timeout=600)
  (out/'driver.log').write_bytes((run.stdout+run.stderr).encode());self.assertEqual(run.returncode,0,run.stdout+run.stderr)
  self.assertTrue(report_path.is_file(),'driver produced no fresh report');report=json.loads(report_path.read_text())
  self.assertEqual(report['script_sha256'],hashlib.sha256(driver.read_bytes()).hexdigest())
  self.assertEqual(report['status'],'PASS_ACTUAL_CMAKE_VISIBILITY_OLD_FAILURE_FIXED_SUCCESS_NONAPPLE_UNCHANGED')
  self.assertTrue(report['actual_full_GHOST_header_used'] and report['no_fake_header_body'] and report['no_fabricated_include_flags'])
  self.assertEqual(len(report['results']),4)
  for case in report['results']:
   expected=case['corrected'] or not case['AppleCrossPlatform'];self.assertEqual(case['syntax_returncode']==0,expected)
   self.assertEqual(case['Ghost_public_include_visible'],case['corrected'] and case['AppleCrossPlatform'])
   self.assertIn('wm_type=STATIC_LIBRARY',case['ownership']);self.assertIn('$<LINK_ONLY:bf_intern_ghost>',case['ownership'])
  self.assertTrue(report['nonApple_include_sets_identical'])
if __name__=='__main__':unittest.main(argv=[sys.argv[0]]+ARGS)
