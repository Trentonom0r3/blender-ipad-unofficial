# Blender iPad development

Before changing code, read `docs/PRODUCT_DIRECTION.md`, `docs/IPAD_WORKSPACE.md`
and the newest section of `docs/PROJECT_HANDOFF.md`, then inspect HEAD and the diff.
Preserve existing implementation and distinguish prototypes from shipped changes.

The user is the hardware tester, not the project manager. Own implementation and
reversible design choices. Ask for hardware evidence or consequential subjective
decisions only when needed. Do not restart design discovery each session.

Current design milestone and acceptance criteria live in `docs/IPAD_WORKSPACE.md`.
Deliver that usable workflow before adding unrelated features. Fix confirmed P0
regressions as necessary, then return to the milestone. Do not keep expanding the
Canvas popover: the user rejected its location and role as the primary tool surface.

User-approved Pencil mapping: double tap opens radial tool selection; squeeze retains the
context/right-click menu. Do not merge these actions. Preserve desktop input.

Checkpoint coherent code and update the handoff with exact build/commit, evidence,
unfinished work and the next implementation step. Source checks, previews, iOS
compilation, packaging and real-device acceptance are separate gates. Do not claim
a task is device-validated because its build succeeds. Avoid repeated unchanged
builds and long build-polling loops with no useful independent work.
