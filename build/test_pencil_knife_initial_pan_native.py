"""C++17 native Knife/zoom profile, public declaration and poll regression.

The companion executes exact current helpers, factories and native context/poll
bodies with authentic operator declarations. It is bounded host-source evidence,
not a full Blender translation-unit, SDK, allocation or device proof.
"""
from pathlib import Path
import argparse, json, subprocess, sys, tempfile, unittest
parser = argparse.ArgumentParser(add_help=False)
parser.add_argument('--repo', type=Path, default=Path(__file__).resolve().parents[1])
parser.add_argument('--source-root', type=Path)
parser.add_argument('--cache-dir', type=Path)
parser.add_argument('--output-dir', type=Path)
OPTIONS, UNITTEST_ARGS = parser.parse_known_args()
REPO = OPTIONS.repo.resolve()
OUT = (OPTIONS.output_dir or Path(tempfile.mkdtemp(prefix='knife-initial-native-'))).resolve()
class PencilKnifeInitialPanNativeTests(unittest.TestCase):
    def test_exact_native_profiles_declarations_and_poll(self):
        command = [sys.executable, str(REPO/'build/tests/knife_initial_pan_native/native.py'),
                   '--repo', str(REPO), '--output-dir', str(OUT)]
        for name, value in [('source-root', OPTIONS.source_root), ('cache-dir', OPTIONS.cache_dir)]:
            if value: command += ['--'+name, str(value.resolve())]
        result = subprocess.run(command, capture_output=True, text=True)
        OUT.mkdir(parents=True, exist_ok=True)
        (OUT/'driver.log').write_text(result.stdout+result.stderr, encoding='utf-8')
        self.assertEqual(result.returncode, 0, result.stdout+result.stderr)
        report = json.loads((OUT/'native-profile-report.json').read_text(encoding='utf-8'))
        self.assertEqual(report['status'], 'PASS')
        self.assertEqual(len(report['executions']), 8)
        for result in report['executions']:
            self.assertEqual(result['assertions'], 81)
            self.assertEqual(result['eligible_dynamic_free_calls'], 0)
            self.assertEqual(result['missing_region_dynamic_free_calls'], 1)
            self.assertEqual(result['native_callback_calls'], 0)
        self.assertTrue(report['link_contract']['creator_to_view3d_route'])
        self.assertEqual([r['stage'] for r in report['historical_missing_seams']],
                         ['old-public-declaration-compile', 'old-source-definition-link'])
        self.assertTrue(all(r['returncode'] != 0 for r in report['historical_missing_seams']))
if __name__ == '__main__':
    unittest.main(argv=[sys.argv[0], *UNITTEST_ARGS])
