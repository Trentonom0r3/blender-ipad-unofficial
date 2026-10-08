# Bounded compiled launch correction evidence

The replacement run 37847847360 at 4c8d754 passes the two compiled launch obligations. The device-crashing run 37818071469 at eced375 fails both using the same helper. These checks do not execute UIKit, a GPU or the iPad application and do not establish device launch acceptance.

`build/audit_hud_macho.py` parses LC_UUID and disassembles bounded actual ARM64 symbol ranges with LLVM. It verifies every reachable post-mutation owner-capture return restores saved area before saved region, and that native sizing precedes floating initialization and feasible newly-created HUD returns. The actual compiled native size/init/panel View2D calls remain separate profiles; their runtime connection is supported by pinned source checks.

Refresh control flow must be acyclic. Both actual binaries satisfy that requirement, despite harmless backward-address branches to earlier shared blocks/epilogues. Distinct unknown tokens track live register values; x-register MOV establishes aliases and CBZ/CBNZ refines only those aliases. The standard native AArch64 call convention preserves x19 through x28. Loads do not prove pointee contents; there is no allocator-zero-memory assumption. Unsupported cycles, spills, inlining or unresolved calls are inconclusive. Nine positive/negative algorithm fixtures cover preserved/overwritten/volatile aliases, unrelated unknowns, truncation, missing sizing and cycle refusal.

`binary-37847847360/audit-initial-overapproximation.json` is retained as diagnostic history. Its initial failure overapproximated impossible creation exits because the first analyzer lacked MOV/CBZ equality refinement. The preserved finder result x22 is zero on the creation branch and forces native sizing before floating init. The refined helper applies that generic equality rule, passes the replacement and still rejects the original crash binary.

Reproduce locally on the Windows workspace with LLVM installed in C:/Program Files/LLVM/bin:

    python -B build/test_audit_hud_macho_alias.py
    python -B build/audit_hud_macho.py <extracted-Blender-Mach-O> --output-dir <isolated-audit-dir>

Package/source hashes and artifact identifiers are in the sibling exact IPA and source reports. Full private device logs remain outside the repository.
