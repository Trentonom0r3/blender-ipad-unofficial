"""Execute opaque Python GizmoGroup preparation and completed-canvas admission.

The driver compiles extracted production functions at O0/O2. Native-shaped
lists, allocation, registration and GPU pixel storage are explicit fixture
boundaries. Stock Blender pixels are separate evidence; this is no iOS proof.
"""
from pathlib import Path
import argparse, hashlib, json, subprocess, sys, tempfile, time, unittest, uuid

parser = argparse.ArgumentParser(add_help=False)
parser.add_argument('--repo', type=Path, default=Path(__file__).resolve().parents[1])
parser.add_argument('--source-root', '--source-dir', dest='source_root', type=Path)
parser.add_argument('--output-dir', type=Path)
parser.add_argument('--opt-level', choices=['0', '2', 'both'], default='both')
OPTIONS, UNITTEST_ARGS = parser.parse_known_args()
REPO = OPTIONS.repo.resolve()
OUT = (OPTIONS.output_dir or Path(tempfile.mkdtemp(prefix='gizmo-prepare-admission-'))).resolve()

class GizmoPrepareAdmissionTests(unittest.TestCase):
    def test_actual_prepare_hierarchy_probe_and_full_redraw(self):
        OUT.mkdir(parents=True, exist_ok=True)
        driver = REPO / 'build/tests/gizmo_prepare_admission_models.py'
        report_path = OUT / 'test-results.json'
        if report_path.exists():
            report_path.rename(OUT / f'previous-report-{time.time_ns()}.json')
        nonce = uuid.uuid4().hex
        started_ns = time.time_ns()
        command = [sys.executable, str(driver), '--repo', str(REPO),
                   '--output-dir', str(OUT), '--opt-level', OPTIONS.opt_level,
                   '--run-nonce', nonce]
        if OPTIONS.source_root:
            command += ['--source-dir', str(OPTIONS.source_root.resolve())]
        run = subprocess.run(command, capture_output=True, text=True, encoding='utf-8', errors='replace')
        (OUT / 'driver.log').write_text(run.stdout + run.stderr, encoding='utf-8')
        self.assertEqual(run.returncode, 0, run.stdout + run.stderr)
        self.assertTrue(report_path.is_file(), 'driver produced no fresh report')
        report = json.loads(report_path.read_text(encoding='utf-8'))
        self.assertEqual(report['status'], 'PASS')
        self.assertEqual(report['run_nonce'], nonce, 'stale result report')
        self.assertGreaterEqual(report['started_ns'], started_ns)
        self.assertEqual(report['script_sha256'], hashlib.sha256(driver.read_bytes()).hexdigest())
        self.assertEqual(report['test_sha256'], hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
        self.assertEqual(report['bridge_driver_sha256'], hashlib.sha256((REPO / 'build/tests/knife_pan_bridge_models.py').read_bytes()).hexdigest())
        self.assertTrue(report['actual_prepare_hierarchy_probe_and_full_redraw'])
        self.assertEqual(report['historical_revision'], '30da0be80a073ef6a6fc5ce634a2039bbb946afd')
        self.assertEqual(report['historical_expected_failures'], 6 if OPTIONS.opt_level == 'both' else 3)
        self.assertEqual(report['current_case_count'], 26)
        self.assertEqual(report['count'], 58 if OPTIONS.opt_level == 'both' else 29)
        self.assertTrue(all(result['passed'] for result in report['results']))

if __name__ == '__main__':
    unittest.main(argv=[sys.argv[0], *UNITTEST_ARGS])
