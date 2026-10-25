# Knife integration audit

The apparent 60,114-line overlay change came from replacing large or whole-file
baseline context with three-line context. Both patches were canonical LF. This
was patch representation churn; exact source reconstruction was still required.

The audit applies baseline, initial candidate and context-preserved candidate
with raw Git using core.autocrlf=false and core.eol=lf. It verifies all 132 prior
section targets and all new targets. Exactly eight old sections plus four new
overlay sections change; 124 old patch sections are byte-identical. All seven
interaction Python and all 13 GHOST source targets are byte-identical.

Every prior hunk context range is retained in the regenerated changed sections.
The final diff has 1,401 lines (1,212 insertions/189 deletions). Empty context
markers in only regenerated sections use the prior archived-patch convention;
this changes no applied source and passes git diff --check.

Online preflight used the unmodified upstream checker and recorded genuine 404
absence for the new WM_ipad_knife.hh file. Offline preflight then passed all 136
files. Source preflight is neither a native compile nor device evidence.

The first attempted strict source comparison let host Git convert outputs to
CRLF. The preserved patch-vs-materialization.diff records that rejected host
conversion comparison only, not a native source defect. The final exact-byte
proof explicitly disables conversion.

The replacement local .cache/integrate-knife-candidate.py never writes the source
materialization. It preserves baseline context and guards all source changes.
Later authoritative source updates require --refresh-materialization, and the
future ED_ipad_panels.hh/wm_draw.cc hooks require explicit --include options.

Full-suite results are recorded separately. The candidate remains unvalidated
and must not be built until affected/full checks and final review pass.
