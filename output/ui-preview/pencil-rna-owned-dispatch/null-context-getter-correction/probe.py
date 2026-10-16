from pathlib import Path
import ast
import datetime
import hashlib
import json
import subprocess
import sys
import tempfile

repo = Path('D:/dev/Projects/Repos/blendpad/blender-ipad-unofficial')
sys.path.insert(0, str(repo / 'build'))
from test_compact_shelf import function

pin = 'd9b6fe34ddce527d93b97c0bf42ad92cebac4e4e'
primary = repo / '.cache/preflight' / pin / 'source/blender/blenkernel/intern/context.cc'
source = primary.read_text(encoding='utf-8')
fragments = {name: function(source, signature) for name, signature in (
    ('verify', 'static bool ctx_data_pointer_verify('),
    ('main', 'Main *CTX_data_main('),
    ('scene', 'Scene *CTX_data_scene('),
)}
assert 'if (C == nullptr)' in fragments['verify']
model = r'''
#include <cassert>
#include <cstdio>
#define BLI_assert(v) assert(v)
struct Main {};
struct Scene {};
struct bContext { struct { Main *main; Scene *scene; } data; };
enum { CTX_RESULT_OK=1, CTX_DATA_TYPE_POINTER=1 };
struct bContextDataResult { int type; struct { void *data; } ptr; };
static int provider_calls=0;
static int ctx_data_get(bContext *,const char *,bContextDataResult *) {
  ++provider_calls; assert(false && "null context must not query a provider"); return 0;
}
'''
main = r'''
int main() {
  int sentinel=1; void *output=&sentinel;
  assert(ctx_data_pointer_verify(nullptr,"unused",&output));
  assert(output==nullptr);
  assert(CTX_data_main(nullptr)==nullptr);
  assert(CTX_data_scene(nullptr)==nullptr);
  assert(provider_calls==0);
  std::puts("PASS exact pinned null-context verify/Main/Scene: no provider dispatch");
}
'''
probe = '\n'.join((model, *fragments.values(), main))
out = repo / 'output/ui-preview/pencil-rna-owned-dispatch/null-context-getter-correction'
out.mkdir(parents=True, exist_ok=True)
cc = out / 'probe.cc'
cc.write_bytes(probe.encode())
clang = 'C:/Program Files/LLVM/bin/clang++.exe'
executions = []
with tempfile.TemporaryDirectory(prefix='pencil-null-context-proof-') as tmp:
    for opt in ('O0', 'O2'):
        exe = Path(tmp) / (opt + '.exe')
        compile_result = subprocess.run([clang, '-std=c++17', '-Wall', '-Wextra', '-Werror', '-pedantic', '-' + opt, str(cc), '-o', str(exe)], capture_output=True, text=True)
        (out / (opt + '-compile.log')).write_bytes((compile_result.stdout + compile_result.stderr).encode())
        if compile_result.returncode:
            raise SystemExit(compile_result.stderr)
        result = subprocess.run([str(exe)], capture_output=True, text=True)
        (out / (opt + '-execution.log')).write_bytes((result.stdout + result.stderr).encode())
        if result.returncode:
            raise SystemExit(result.stderr)
        executions.append({'optimization': opt, 'exit_code': result.returncode, 'output': result.stdout.strip()})

fixture = repo / 'build/test_pencil_mesh_storage_owner_teardown.py'
before = fixture.read_bytes()
old = ('# This is modeled input, not execution of pinned CTX_data_main(nullptr): the\n'
       '# native getter dereferences C->data.main. Provider/interpreter behavior is outside\n'
       '# this direct-callback proof.').encode()
new = ('# The nullable result matches the pinned ctx_data_pointer_verify null-C branch,\n'
       '# which returns true with null output before provider dispatch. This fixture\n'
       '# models the getter; it does not execute the native getter or interpreter.').encode()
normalized = before.replace(b'\r\n', b'\n')
assert old in normalized
after_normalized = normalized.replace(old, new, 1)
after = after_normalized.replace(b'\n', b'\r\n') if b'\r\n' in before else after_normalized
assert ast.dump(ast.parse(before.decode('utf-8'))) == ast.dump(ast.parse(after.decode('utf-8')))
fixture.write_bytes(after)
report = {
    'timestamp_utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
    'status': 'evidence_correction_only_production_overlay_unchanged',
    'pin': pin,
    'correction': 'ctx_data_pointer_verify(nullptr) sets output to nullptr and returns true before provider dispatch. CTX_data_main/scene therefore return nullptr without reaching C->data fallback. Earlier stronger null-dereference claims omitted this early return and are withdrawn.',
    'primary': {'path': str(primary), 'sha256': hashlib.sha256(primary.read_bytes()).hexdigest(), 'anchors': 'context.cc418-434 and1135-1158'},
    'fragments': {name: {'sha256': hashlib.sha256(body.encode()).hexdigest(), 'source': body} for name, body in fragments.items()},
    'executions': executions,
    'fixture': {'path': str(fixture), 'before_sha256': hashlib.sha256(before).hexdigest(), 'after_sha256': hashlib.sha256(after).hexdigest(), 'python_ast_identical': True, 'change': 'Python comment only; no C++ source string, assertion, expectation, test name, production or patch change'},
    'superseded_claims': [
        'build/test_pencil_mesh_storage_owner_teardown.py previous comment79-81',
        'independent-final-test-outer-review.json previous stronger getter assertion at46; historical report retained with this addendum',
    ],
    'scope': 'Executes exact three primary native bodies for null context at O0/O2; model ctx_data_get is an unreachable assertion boundary. Does not execute full Python assignment, native rna_property_update callbacks, Main/Scene storage allocation, interpreter, WM, UIKit or device.',
    'full_update_policy': 'Getter null safety does not establish downstream full-update null-C support. Direct fixed setter, RNA_property_update_main and full owned Python transaction are separate contracts; new owner-present/null-C refusal is a bounded support choice, not a getter-crash workaround.',
    'production_source': '196b54ca63a8fa558225479711de2426a83f8c53',
    'production_patch_sha256': hashlib.sha256((repo/'patches/blender-ipad.patch').read_bytes().replace(b'\r\n',b'\n')).hexdigest(),
}
(out.parent / 'null-context-getter-correction.json').write_bytes((json.dumps(report, indent=2) + '\n').encode())
(out / 'probe.py').write_bytes(Path(__file__).read_bytes())
print(json.dumps({'status': report['status'], 'executions': executions, 'python_ast_identical': True, 'patch': report['production_patch_sha256']}))
