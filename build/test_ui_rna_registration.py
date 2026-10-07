"""Compile RNA-generated argument lists against the actual native helpers.

Common registration bodies are exact pinned fixtures; no native Xcode proof.
"""
import re
from pathlib import Path
import unittest
from test_touch_extrude import changed_source
from test_compact_shelf import function
import test_ipad_panels

SOURCE = changed_source('source/blender/makesrna/intern/rna_ui_api.cc')
COMMON = (Path(__file__).parent / 'fixtures/pinned_ui_rna_common.cc').read_text(encoding='utf-8')

def registration(source, name):
    match = re.search(r'func = RNA_def_function\(srna, "' + name + r'", "(\w+)"\);', source)
    body = source[match.end():]
    return match[1], body.split('func = RNA_def_function(', 1)[0]

def expand_common(body):
    pattern = r'(api_ui_item_(?:rna_common|common|common_text|common_translation))\(func\);'
    while re.search(pattern, body):
        body = re.sub(pattern, lambda m: function(COMMON, m[1] + '(').split('{', 1)[1][:-1], body)
    return body

def generated_arguments(body):
    # RNA preprocessing preserves declaration order, prepending self/context.
    body = expand_common(body)
    fields = re.findall(r'RNA_def_(pointer|string|boolean|property)\(\s*func,\s*"([^"]+)"', body)
    types = {'pointer': 'PointerRNA*', 'string': 'const char*', 'boolean': 'bool', 'property': 'int'}
    arguments = ['(uiLayout*)nullptr']
    if re.search(r'RNA_def_function_flag\(func,\s*FUNC_USE_CONTEXT\)', body):
        arguments.append('(bContext*)nullptr')
    arguments += ['std::declval<' + types[kind] + '>()' for kind, _ in fields]
    return arguments, fields

class UIRegistrationTests(unittest.TestCase):
    def test_generated_calls_match_real_helper_signatures_and_context_flags(self):
        declarations, checks = [], []
        for name in ('prop_with_popover', 'prop_with_menu', 'prop_tabs_enum'):
            helper, body = registration(SOURCE, name)
            declaration = function(SOURCE, 'static void ' + helper + '(').split('{', 1)[0]
            declarations.append(declaration.replace('static ', '', 1) + ';')
            arguments, _ = generated_arguments(body)
            checks.append('static_assert(std::is_same_v<decltype(' + helper + '(' + ','.join(arguments) + ')),void>);')
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(
            '#include <type_traits>\n#include <utility>\nstruct uiLayout;struct PointerRNA;struct bContext;\n' +
            '\n'.join(declarations + checks) + '\nint main(){}\n')

    def test_tab_style_belongs_only_to_tabs_and_preserves_inspector_default(self):
        _, tabs = registration(SOURCE, 'prop_tabs_enum')
        self.assertRegex(tabs, r'RNA_def_boolean\(func,\s*"use_tab_style",\s*true,')
        _, fields = generated_arguments(tabs)
        self.assertEqual(fields[-1], ('boolean', 'use_tab_style'))
        for name in ('prop_with_popover', 'prop_with_menu'):
            _, body = registration(SOURCE, name)
            self.assertNotIn('use_tab_style', body)
            self.assertNotIn('FUNC_USE_CONTEXT', body)
        inspector = changed_source('scripts/startup/bl_ui/space_properties.py')
        self.assertIn('use_tab_style=False', inspector)

if __name__ == '__main__': unittest.main()
