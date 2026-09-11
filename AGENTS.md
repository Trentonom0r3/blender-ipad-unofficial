# Blender iPad development

Before changing code, read `docs/PRODUCT_DIRECTION.md`, `docs/IPAD_WORKSPACE.md`
and the newest section of `docs/PROJECT_HANDOFF.md`, then inspect HEAD and the diff.
Preserve existing implementation and distinguish prototypes from shipped changes.

The user is the hardware tester, not the project manager. Own implementation and
reversible design choices. Ask for hardware evidence or consequential subjective
decisions only when needed. Do not restart design discovery each session.

Current design milestone and acceptance criteria live in `docs/IPAD_WORKSPACE.md`.
The latest user priority is native Files replacement; preserve the working radial UI. Fix confirmed P0
regressions as necessary, then return to the milestone. Do not keep expanding the
Canvas popover: the user rejected its location and role as the primary tool surface.

User-approved Pencil mapping: squeeze opens radial tool selection; double tap opens the
context/right-click menu. Do not merge these actions. Preserve desktop input.

Checkpoint coherent code and update the handoff with exact build/commit, evidence,
unfinished work and the next implementation step. Source checks, previews, iOS
compilation, packaging and real-device acceptance are separate gates. Do not claim
a task is device-validated because its build succeeds. Avoid repeated unchanged
builds and long build-polling loops with no useful independent work.

Native Files is the active engineering priority. The user explicitly wants the desktop
filesystem picker removed, including its proposed advanced fallback. Preserve importer
options and library data-block selection through dedicated surfaces, not a Unix browser.
The compact nine-tool ring (empty center, tighter small buttons, shelf initially hidden)
is a concept awaiting user review; do not change its production geometry yet.
