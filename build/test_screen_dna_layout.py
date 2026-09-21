"""Check explicit SDNA member alignment for both serialized pointer widths."""
from pathlib import Path
import re
import unittest
import test_ipad_panels


class ScreenDNALayoutTests(unittest.TestCase):
    def test_runtime_explicit_alignment_for_32_and_64_bit_dna(self):
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        path = 'source/blender/makesdna/DNA_screen_types.h'
        section = patch.split(f'diff --git a/{path} b/{path}\n', 1)[1].split('diff --git ', 1)[0]
        # This hunk includes every runtime field, including upstream tool/padding.
        after = ''.join(line[1:] for line in section.splitlines(True)
                        if line.startswith((' ', '+')) and not line.startswith('+++'))
        start = after.index('  struct bToolRef *tool;')
        body = after[start:after.index('} ScrArea_Runtime;', start)]
        body = re.sub(r'/\*.*?\*/', '', body, flags=re.S)
        fields = []
        for declaration in body.split(';'):
            declaration = declaration.strip()
            if not declaration:
                continue
            match = re.fullmatch(r'(struct bToolRef\s*\*|void\s*\*|char|int|uint64_t|rcti)\s*(\w+)(\[\d+\])?', declaration)
            self.assertIsNotNone(match, f'Extend DNA layout check for: {declaration}')
            kind, name, array = match.groups()
            if '*' in kind:
                cpp_type, alignment = 'Pointer', 'sizeof(Pointer)'
            else:
                cpp_type = {'char': 'char', 'int': 'std::int32_t',
                            'uint64_t': 'std::uint64_t', 'rcti': 'rcti'}[kind]
                alignment = {'char': '1', 'int': '4', 'uint64_t': '8', 'rcti': '4'}[kind]
            fields.append((cpp_type, name, array or '', alignment))
        self.assertTrue(any(name == 'ipad_launcher_session' for _, name, _, _ in fields))
        declaration = '\n'.join(f'{kind} {name}{array};' for kind, name, array, _ in fields)
        checks = '\n'.join(f'static_assert(offsetof(RuntimeDNA<Pointer>, {name}) % ({alignment}) == 0, "Unpadded {name}");'
                           for _, name, _, alignment in fields)
        source = r'''
#include <cstddef>
#include <cstdint>
#include <iostream>
struct rcti {std::int32_t xmin, xmax, ymin, ymax;};
// SDNA requires explicit padding. Letting C++ insert padding hides this bug.
#pragma pack(push, 1)
template<class Pointer> struct RuntimeDNA {
''' + declaration + r'''
};
#pragma pack(pop)
template<class Pointer> void verify() {
''' + checks + r'''
static_assert(sizeof(RuntimeDNA<Pointer>) % 8 == 0, "Unpadded runtime tail");
}
int main() {
verify<std::uint32_t>();
verify<std::uint64_t>();
std::cout << "PASS: exact runtime DNA fields have explicit 32/64-bit member and tail alignment\n";
}
'''
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(source)
