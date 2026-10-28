"""Actual Pencil producer and queued PAN values reach actual native dispatch.

One host C++ program includes both complete generated component families. Only
explicit model storage/constant boundaries are adapted; policy outcomes are
computed by the actual producer, queue, classifier, dispatch and invoke bodies.
"""
from pathlib import Path
import argparse
import hashlib
import json
import subprocess
import sys
import tempfile
import unittest

parser = argparse.ArgumentParser(add_help=False)
parser.add_argument('--source-root', type=Path)
parser.add_argument('--output-dir', type=Path)
OPTIONS, ARGS = parser.parse_known_args()
REPO = Path(__file__).resolve().parents[1]


class NodeConnectedWorkflowTests(unittest.TestCase):
    def test_actual_producer_queue_to_native_dispatch_O0_O2(self):
        output = (OPTIONS.output_dir or Path(tempfile.mkdtemp(prefix='node-connected-workflow-'))).resolve()
        output.mkdir(parents=True, exist_ok=True)
        driver = REPO / 'build/tests/node_connected_workflow/connected.py'
        command = [sys.executable, '-X', 'utf8', str(driver), '--repo', str(REPO),
                   '--output-dir', str(output)]
        if OPTIONS.source_root:
            command += ['--source-root', str(OPTIONS.source_root)]
        result = subprocess.run(command, cwd=REPO, text=True, capture_output=True,
                                encoding='utf-8', errors='replace', timeout=600)
        (output / 'driver.log').write_text(result.stdout + result.stderr, encoding='utf-8')
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        report = json.loads((output / 'workflow-report.json').read_text())
        self.assertEqual(report['status'], 'PASS_BOUNDED_ACTUAL_PRODUCER_TO_NATIVE_DISPATCH')
        self.assertEqual(report['driver_sha256'], hashlib.sha256(driver.read_bytes()).hexdigest())
        self.assertEqual(len(report['executions']), 6)
        for execution in report['executions']:
            expected = 0 if execution['case'] == 'current' else 17
            self.assertEqual(execution['returncode'], expected, execution)
            if expected:
                self.assertIn('WORKFLOW_REQUIRED_DENIAL_FAILED', execution['stderr'])
                self.assertIn('creates=1', execution['stderr'])
        self.assertFalse(report['native_abi_or_device_claim'])


if __name__ == '__main__':
    unittest.main(argv=[sys.argv[0]] + ARGS)
