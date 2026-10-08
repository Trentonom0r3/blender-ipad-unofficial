"""Synthetic ARM64 alias/CFG algorithm cases. Not replacement-binary evidence."""
import importlib.util
import unittest
from pathlib import Path
p=Path(__file__).with_name('audit_hud_macho.py')
spec=importlib.util.spec_from_file_location('audit',p)
audit=importlib.util.module_from_spec(spec);spec.loader.exec_module(audit)

class Aliases(unittest.TestCase):
    def code(self,overwrite=None,no_size=False,pointee=False):
        ins={0x100:('mov','x22, x0'),0x104:('cbz','x0, 0x114'),0x108:('ret',''),
             0x114:('bl','0x900 <'+audit.CREATE+'>'),0x118:('nop',''),
             0x11c:('cbz','x22, 0x124'),0x120:('ret',''),
             0x124:('bl','0xa00 <'+audit.SIZE+'>'),0x128:('bl','0xb00 <'+audit.FLOAT+'>'),0x12c:('ret','')}
        if overwrite:ins[0x118]=overwrite
        if no_size:ins[0x124]=('nop','')
        if pointee:
            ins[0x118]=('ldr','x23, [x0, #0x120]')
            # Explore both unknown field values before the original finder-null check.
            ins[0x11c]=('cbnz','x23, 0x130')
            ins[0x130]=('cbz','x22, 0x124')
            ins[0x134]=('ret','')
            ins[0x120]=('b','0x124')
        return {'start':0x100,'end':0x138,'symbol':'synthetic','ins':ins}
    def test_finder_alias_zero_survives_native_call(self):
        self.assertEqual(audit.refresh_audit(self.code())['status'],'passed')
    def test_unknown_pointee_needs_no_calloc_assumption(self):
        self.assertEqual(audit.refresh_audit(self.code(pointee=True))['status'],'passed')
    def test_overwriting_original_alias_exposes_real_unsized_return(self):
        self.assertEqual(audit.refresh_audit(self.code(('mov','x22, x0')))['status'],'failed')
    def test_explicit_nonzero_alias_exposes_real_unsized_return(self):
        self.assertEqual(audit.refresh_audit(self.code(('mov','x22, #0x1')))['status'],'failed')
    def test_volatile_alias_cannot_survive_call(self):
        fn=self.code();fn['ins'][0x100]=('mov','x2, x0');fn['ins'][0x11c]=('cbz','x2, 0x124')
        self.assertEqual(audit.refresh_audit(fn)['status'],'failed')
    def test_old_missing_size_still_fails(self):
        self.assertEqual(audit.refresh_audit(self.code(no_size=True))['status'],'failed')
    def test_unknown_32_bit_truncation_not_pointer_alias_proof(self):
        fn=self.code();fn['ins'][0x100]=('mov','w22, w0')
        self.assertEqual(audit.refresh_audit(fn)['status'],'failed')
    def test_missing_alias_unrelated_unknowns_do_not_refine_together(self):
        fn=self.code();fn['ins'][0x100]=('nop','')
        self.assertEqual(audit.refresh_audit(fn)['status'],'failed')

    def test_directed_back_edge_cycle_is_inconclusive(self):
        fn=self.code();fn['ins'][0x118]=('b','0x114')
        result=audit.refresh_audit(fn)
        self.assertEqual(result['status'],'inconclusive')
        self.assertFalse(result['flow_proof']['acyclic'])
        self.assertIn(('0x118','0x114'),result['flow_proof']['backward_address_edges'])


if __name__=='__main__':unittest.main(verbosity=2)
