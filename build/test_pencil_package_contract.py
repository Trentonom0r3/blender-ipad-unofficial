"""Positive and rejection checks for exact packaged ring content."""
import unittest
from pencil_ring_contract import verify_nine_base_contract
from test_touch_extrude import changed_source
from test_tool_ring import ring_source
SOURCE=changed_source('scripts/startup/bl_ui/space_view3d_ipad.py')
POLICY=ring_source()
class PackageContractTests(unittest.TestCase):
    def test_exact_current_package_contract(self):
        self.assertEqual(len(verify_nine_base_contract(SOURCE,POLICY)['base_actions']),9)
    def test_old_smaller_base_geometry_is_rejected(self):
        with self.assertRaises(AssertionError):verify_nine_base_contract(SOURCE,POLICY.replace('7.6f * unit','4.9f * unit'))
    def test_duplicate_direct_tool_is_rejected(self):
        bad=SOURCE.replace("for name in ('builtin.select_box', 'builtin.move', 'builtin.rotate', 'builtin.scale', 'builtin.cursor'):","for name in ('builtin.select_box', 'builtin.rotate', 'builtin.rotate', 'builtin.scale', 'builtin.cursor'):")
        self.assertNotEqual(bad,SOURCE)
        with self.assertRaises(AssertionError):verify_nine_base_contract(bad,POLICY)
    def test_utility_tail_is_rejected(self):
        bad=SOURCE.replace('ipad_draw_native_tool_inventory(layout, context, more_tools=True)','ipad_draw_native_tool_inventory(layout, context, more_tools=True)\n        layout.operator(\'view3d.ipad_native_controls\', text=\'Native Controls\')')
        with self.assertRaises(AssertionError):verify_nine_base_contract(bad,POLICY)
if __name__=='__main__':unittest.main()
