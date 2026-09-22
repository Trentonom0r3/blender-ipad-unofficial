"""Check exact screen SDNA member alignment for both serialized pointer widths."""
from pathlib import Path
import re
import unittest
import test_ipad_panels


def dna_fields(body):
    body = re.sub(r'/\*.*?\*/', '', body, flags=re.S)
    body = re.sub(r'DNA_DEFINE_CXX_METHODS\([^)]*\)', '', body).replace('DNA_DEPRECATED', '')
    fields = []
    for declaration in body.split(';'):
        declaration = declaration.strip()
        if not declaration:
            continue
        match = re.fullmatch(r'(struct \w+|\w+)\s+(.+)', declaration, flags=re.S)
        if not match:
            raise AssertionError(f'Extend DNA layout check for: {declaration}')
        kind, members = match.groups()
        for member in members.split(','):
            match = re.fullmatch(r'(\*?)\s*(\w+)(\[\d+\])?', member.strip())
            if not match:
                raise AssertionError(f'Extend DNA member check for: {member}')
            pointer, name, array = match.groups()
            if pointer:
                cpp_type, alignment = 'Pointer', 'sizeof(Pointer)'
            else:
                cpp_type, alignment = {
                    'char': ('char', '1'), 'short': ('std::int16_t', '2'),
                    'int': ('std::int32_t', '4'), 'uint64_t': ('std::uint64_t', '8'),
                    'rcti': ('rcti', '4'), 'ListBase': ('ListBase<Pointer>', 'sizeof(Pointer)'),
                    'ScrArea_Runtime': ('RuntimeDNA<Pointer>', '8'),
                }[kind]
            fields.append((cpp_type, name, array or '', alignment))
    return fields


class ScreenDNALayoutTests(unittest.TestCase):
    def test_editor_and_runtime_explicit_alignment_for_both_pointer_widths(self):
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        path = 'source/blender/makesdna/DNA_screen_types.h'
        section = patch.split(f'diff --git a/{path} b/{path}\n', 1)[1].split('diff --git ', 1)[0]
        # Extended context retains both complete declarations from the pinned header.
        after = ''.join(line[1:] for line in section.splitlines(True)
                        if line.startswith((' ', '+')) and not line.startswith('+++'))
        definitions, checks = [], []
        for native, model in [('ScrArea_Runtime', 'RuntimeDNA'), ('ScrArea', 'AreaDNA')]:
            start = after.index('typedef struct '+native+' {') + len('typedef struct '+native+' {')
            body = after[start:after.index('} '+native+';', start)]
            fields = dna_fields(body)
            declaration = '\n'.join(f'{kind} {name}{array};' for kind, name, array, _ in fields)
            definitions.append(f'template<class Pointer> struct {model} {{\n{declaration}\n}};')
            checks += [f'static_assert(offsetof({model}<Pointer>, {name}) % ({alignment}) == 0, "Unpadded {native}.{name}");'
                       for _, name, _, alignment in fields]
            checks.append(f'static_assert(sizeof({model}<Pointer>) % 8 == 0, "Unpadded {native} tail");')
        source = r'''
#include <cstddef>
#include <cstdint>
#include <iostream>
struct rcti {std::int32_t xmin, xmax, ymin, ymax;};
// SDNA requires explicit padding. C++ automatic padding would hide these bugs.
#pragma pack(push, 1)
template<class Pointer> struct ListBase {Pointer first, last;};
''' + '\n'.join(definitions) + r'''
#pragma pack(pop)
template<class Pointer> void verify() {
''' + '\n'.join(checks) + r'''
}
int main() {
verify<std::uint32_t>();
verify<std::uint64_t>();
std::cout << "PASS: exact editor/runtime DNA have explicit 32/64-bit member and tail alignment\n";
}
'''
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(source)
