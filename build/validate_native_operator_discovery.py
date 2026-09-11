"""Run in host Blender: exercise the actual shipped native-operator guards.

Native iOS operators aren't compiled on the host. Substitute an existing C++
operator name to test discovery through the real registry, not a Python operator
mock (Python-registered classes would conceal the bpy.types regression).
This does not validate UIKit presentation or provider writes.
"""
import ast
from pathlib import Path

import bpy

patch = (Path(__file__).resolve().parents[1] / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
count = 0
for line in patch.splitlines():
    if not line.startswith('+') or not line[1:].lstrip().startswith('if '):
        continue
    if not any(name in line for name in ('save_copy_to_files', 'save_as_to_files', 'import_project_from_files')):
        continue

    class SubstituteOperator(ast.NodeTransformer):
        def __init__(self, native_name, rna_name):
            self.native_name = native_name
            self.rna_name = rna_name

        def visit_Constant(self, node):
            if isinstance(node.value, str):
                if node.value in ('save_copy_to_files', 'save_as_to_files', 'import_project_from_files'):
                    node.value = self.native_name
                elif node.value in ('WM_OT_save_copy_to_files', 'WM_OT_save_as_to_files', 'WM_OT_import_project_from_files'):
                    node.value = self.rna_name
            return node

    for name, rna_name, expected in (
        ('save_as_mainfile', 'WM_OT_save_as_mainfile', True),
        ('nonexistent_ipad_discovery_test', 'WM_OT_nonexistent_ipad_discovery_test', False),
    ):
        # Parse afresh because NodeTransformer mutates its input.
        tree = ast.Expression(ast.parse(line[1:].strip() + '\n    pass').body[0].test)
        tree = SubstituteOperator(name, rna_name).visit(tree)
        actual = eval(compile(ast.fix_missing_locations(tree), '<shipped operator guard>', 'eval'), {'bpy': bpy})
        assert actual == expected, (line, name, actual, expected)
    count += 1

assert count == 3, f'Expected Save As, Save Copy and View3D iPad guards; found {count}'
print('PASS: all three native Files guards discover C++ operators and reject missing operators')
