"""Execute actual Pencil PAN transport sources with explicit host adapters.

The producer, generator, payload, constructor, ingestion branch, coalescer and
public replay boundary execute at O0/O2. UIKit timing and target ABI remain
separate native/device obligations.
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


class NodePrecisionTransportTests(unittest.TestCase):
    def test_actual_connected_transport_and_historical_controls_at_O0_O2(self):
        output = (OPTIONS.output_dir or Path(tempfile.mkdtemp(prefix='node-precision-'))).resolve()
        output.mkdir(parents=True, exist_ok=True)
        driver = REPO / 'build/tests/node_precision_transport/run_connected.py'
        command = [sys.executable, '-X', 'utf8', str(driver), '--repo', str(REPO),
                   '--output-dir', str(output)]
        if OPTIONS.source_root:
            command += ['--source-root', str(OPTIONS.source_root)]
        result = subprocess.run(command, cwd=REPO, capture_output=True, text=True,
                                encoding='utf-8', errors='replace', timeout=600)
        (output / 'driver.log').write_text(result.stdout + result.stderr, encoding='utf-8')
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        report = json.loads((output / 'report.json').read_text())
        self.assertEqual(report['status'], 'PASS_BOUNDED_CONNECTED_TRANSPORT')
        self.assertEqual(report['driver_sha256'], hashlib.sha256(driver.read_bytes()).hexdigest())
        self.assertTrue(report['old_fields_and_packets_exact'])
        for optimization in ['-O0', '-O2']:
            runs = [r for r in report['runs'] if r['optimization'] == optimization]
            self.assertEqual(len(runs), 8)
            for run in runs:
                if run['case'].startswith('old-'):
                    self.assertNotEqual(run['returncode'], 0, run)
                    self.assertIn(run['expected_failure'], run['stderr'])
                else:
                    self.assertEqual(run['returncode'], 0, run)
        self.assertEqual(len(report['header_runs']), 2)
        self.assertTrue(all(r['returncode'] == 0 for r in report['header_runs']))
        self.assertEqual(report['actual_default_backend_calls'], 11)
        self.assertEqual(len(report['old_header_controls']), 2)
        self.assertTrue(all(r['old_callers_valid'] and r['missing_source_field_returncode'] != 0
                            for r in report['old_header_controls']))


if __name__ == '__main__':
    unittest.main(argv=[sys.argv[0]] + ARGS)
