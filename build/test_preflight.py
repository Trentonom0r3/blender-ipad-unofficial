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

    def test_patched_python_is_parsed(self):
        invalid = PATCH.replace('source/example.cc', 'source/example.py').replace('+new', '+if')
        with self.assertRaises(SyntaxError):
            check_patch(invalid, patch_files(invalid), lambda _: b'old\n')


if __name__ == '__main__':
    unittest.main()
