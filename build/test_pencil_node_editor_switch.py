"""Connected actual-source native Node editor-switch refusal and old failure."""
from pathlib import Path
import argparse
import hashlib
import json
import re
import subprocess
import sys
import tempfile
import unittest

parser = argparse.ArgumentParser(add_help=False)
parser.add_argument('--source-root', type=Path)
parser.add_argument('--cache-dir', type=Path)
parser.add_argument('--output-dir', type=Path)
OPTIONS, ARGS = parser.parse_known_args()
REPO = Path(__file__).resolve().parents[1]


class NodeEditorSwitchTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.output = (OPTIONS.output_dir or Path(tempfile.mkdtemp(prefix='node-editor-switch-test-'))).resolve()
        cls.output.mkdir(parents=True, exist_ok=True)
        cls.driver = REPO / 'build/tests/node_editor_switch/connected.py'
        command = [sys.executable, '-X', 'utf8', str(cls.driver), '--repo', str(REPO), '--output-dir', str(cls.output)]
        if OPTIONS.source_root:
            command += ['--source-root', str(OPTIONS.source_root)]
        if OPTIONS.cache_dir:
            command += ['--cache-dir', str(OPTIONS.cache_dir)]
        result = subprocess.run(command, cwd=REPO, text=True, capture_output=True,
                                encoding='utf-8', errors='replace', timeout=600)
        (cls.output / 'driver.log').write_text(result.stdout + result.stderr, encoding='utf-8')
        if result.returncode:
            raise AssertionError(result.stdout + result.stderr)
        cls.report = json.loads((cls.output / 'editor-switch-report.json').read_text())

    def test_connected_query_full_newspace_public_rna_O0_O2(self):
        report = self.report
        self.assertEqual(report['status'], 'PASS_BOUNDED_ACTUAL_NODE_EDITOR_SWITCH_REFUSAL')
        self.assertEqual(report['driver_sha256'], hashlib.sha256(self.driver.read_bytes()).hexdigest())
        current = [r for r in report['executions'] if r['case'] == 'current-apple']
        self.assertEqual(len(current), 2)
        for execution in current:
            self.assertEqual(execution['returncode'], 0, execution)
            count = int(re.search(r'scenarios passed: (\d+)', execution['stdout'])[1])
            self.assertGreaterEqual(count, 65)
        self.assertFalse(report['native_abi_or_device_claim'])

    def test_historical_actual_failure_and_nonapple_native_fallback_O0_O2(self):
        self.assertEqual(len(self.report['executions']), 6)
        old = [r for r in self.report['executions'] if r['case'] == 'historical-apple']
        nonapple = [r for r in self.report['executions'] if r['case'] == 'current-nonapple']
        self.assertEqual(len(old), 2)
        self.assertEqual(len(nonapple), 2)
        for execution in old:
            self.assertEqual(execution['returncode'], 17, execution)
            self.assertIn('EDITOR_SWITCH_REQUIRED_REFUSAL_FAILED', execution['stderr'])
            for fact in ['switched=1', 'listed=1', 'area_null=1', 'region_null=1', 'cancel=0']:
                self.assertIn(fact, execution['stderr'])
        for execution in nonapple:
            self.assertEqual(execution['returncode'], 0, execution)
        self.assertEqual(self.report['historical_provenance']['production_source'],
                         'a2b7a81c9d40c1273ad2dc13a600810940b1e30d')


if __name__ == '__main__':
    unittest.main(argv=[sys.argv[0]] + ARGS)
