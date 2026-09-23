"""Exercise preflight against real git apply and malformed/untrusted patch paths."""

import unittest

from preflight import check_patch, patch_files


PATCH = '''diff --git a/source/example.cc b/source/example.cc
--- a/source/example.cc
+++ b/source/example.cc
@@ -1 +1 @@
-old
+new
'''


class PreflightTests(unittest.TestCase):
    def test_existing_source_patch(self):
        check_patch(PATCH, patch_files(PATCH), lambda _: b'old\n')

    def test_stale_hunk_count_is_rejected(self):
        patch = '''diff --git a/new.cc b/new.cc
new file mode 100644
--- /dev/null
+++ b/new.cc
@@ -0,0 +1,1 @@
+first line
+second line
'''
        with self.assertRaisesRegex(ValueError, 'hunk counts do not match'):
            check_patch(patch, patch_files(patch), lambda _: self.fail('New files need no source'))

    def test_wrong_upstream_is_rejected(self):
        import subprocess
        with self.assertRaises(subprocess.CalledProcessError):
            check_patch(PATCH, patch_files(PATCH), lambda _: b'different\n')

    def test_new_file_does_not_fetch_upstream(self):
        patch = '''diff --git a/new.py b/new.py
new file mode 100644
--- /dev/null
+++ b/new.py
@@ -0,0 +1 @@
+value = 1
'''
        def unexpected(_):
            self.fail('A new file must not be downloaded')
        check_patch(patch, patch_files(patch), unexpected)

    def test_unsafe_paths_are_rejected_before_download(self):
        for name in ('../escape', '.git/config', 'C:/escape', '/absolute', 'a/../../escape',
                     'a\\escape', 'a//escape'):
            with self.subTest(name=name), self.assertRaises(ValueError):
                patch_files(f'diff --git a/{name} b/{name}\n')

    def test_duplicates_and_empty_input_are_rejected(self):
        for patch in ('', PATCH + PATCH):
            with self.assertRaises(ValueError):
                patch_files(patch)

    def test_duplicate_ipad_registration_is_rejected(self):
        registration = 'WM_operatortype_append(SCREEN_OT_ipad_launcher_arrange);'
        patch = PATCH.replace('source/example.cc', 'source/blender/editors/screen/screen_ops.cc')
        patch = patch.replace('@@ -1 +1 @@', '@@ -1 +1,2 @@')
        patch = patch.replace('+new', '+' + registration + '\n+' + registration)
        with self.assertRaisesRegex(ValueError, 'Duplicate iPad operator registration'):
            check_patch(patch, patch_files(patch), lambda _: b'old\n')

    def test_unique_ipad_registrations_pass(self):
        patch = PATCH.replace('source/example.cc', 'source/blender/editors/screen/screen_ops.cc')
        patch = patch.replace('@@ -1 +1 @@', '@@ -1 +1,2 @@')
        patch = patch.replace('+new', '+WM_operatortype_append(SCREEN_OT_ipad_launcher_arrange);\n'
                              '+WM_operatortype_append(SCREEN_OT_ipad_launcher_move);')
        check_patch(patch, patch_files(patch), lambda _: b'old\n')

    def test_added_bli_header_must_exist_in_pinned_source(self):
        patch = PATCH.replace('+new', '+#include "BLI_missing.hh"')
        def load(path):
            if path == 'source/example.cc':
                return b'old\n'
            self.assertEqual(path, 'source/blender/blenlib/BLI_missing.hh')
            raise ValueError('Missing pinned header')
        with self.assertRaisesRegex(ValueError, 'Missing pinned header'):
            check_patch(patch, patch_files(patch), load)

    def test_added_bli_header_is_verified_once(self):
        patch = PATCH.replace('@@ -1 +1 @@', '@@ -1 +1,2 @@')
        patch = patch.replace('+new', '+#include "BLI_memory_utils.hh"\n'
                              '+#include "BLI_memory_utils.hh"')
        requested = []
        def load(path):
            requested.append(path)
            return b'old\n' if path == 'source/example.cc' else b'#pragma once\n'
        check_patch(patch, patch_files(patch), load)
        self.assertEqual(requested.count('source/blender/blenlib/BLI_memory_utils.hh'), 1)

    def test_patched_python_is_parsed(self):
        invalid = PATCH.replace('source/example.cc', 'source/example.py').replace('+new', '+if')
        with self.assertRaises(SyntaxError):
            check_patch(invalid, patch_files(invalid), lambda _: b'old\n')


if __name__ == '__main__':
    unittest.main()
