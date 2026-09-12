# Blender iPad development

Before changing code, read `docs/PRODUCT_DIRECTION.md`, `docs/IPAD_WORKSPACE.md`
and the newest section of `docs/PROJECT_HANDOFF.md`, then inspect HEAD and the diff.
Preserve existing implementation and distinguish prototypes from shipped changes.

The user is the hardware tester, not the project manager. Own implementation and
reversible design choices. Ask for hardware evidence or consequential subjective
decisions only when needed. Do not restart design discovery each session.

The latest user-approved UI priority is floating workspace panels across **all**
workspace layouts. Keep each layout's editor identity and state, with permanent
noncollapsible edge buttons opening the actual Blender editors beside them. Use
narrow vertical right tabs like Blender's sidebar, clear of navigation gizmos, and
put bottom launchers in the existing status/footer bar.
Scene is the Outliner and Inspector is Properties; do not recreate partial versions
or require a More button to reach the real editor. Bottom editors and brush shelves
open at the bottom according to their existing layout placement. Show native editor
content without custom Item/Scene title, Pin or X wrappers. Small footer Pin Panels
controls pin one side and one bottom area independently; switching editors preserves
that area's pin and replaces its current panel without stacking. Start panels at
their maximum useful size, allow horizontal side and vertical bottom resizing when
pinned or unpinned, and remember sizes per workspace. Place panels within the real
editor WINDOW region so variable headers, including Sculpt, stay clear. See
`docs/IPAD_WORKSPACE.md` for interaction and acceptance details.

This contract supersedes the earlier custom Scene/Inspector drawer design and the
instruction to prioritize Files over workspace UI. Preserve the existing Files work
and its unfinished lifecycle requirements. Fix confirmed P0 regressions as necessary,
then return to the active milestone. Do not keep expanding the Canvas popover: the
user rejected its location and role as the primary tool surface.

User-approved Pencil mapping: squeeze opens radial tool selection; double tap opens
the context/right-click menu. Do not merge these actions. Preserve the existing
nine-tool ring, its current geometry, touch fallback and desktop input. The workspace
panel milestone does not authorize an unrelated radial redesign.

Checkpoint coherent code and update the handoff with exact build/commit, evidence,
unfinished work and the next implementation step. Source checks, previews, iOS
compilation, packaging and real-device acceptance are separate gates. Do not claim
a task is device-validated because its build succeeds. Avoid repeated unchanged
builds and long build-polling loops with no useful independent work.

Native Files remains required. The user explicitly wants the desktop filesystem
picker removed, including its proposed advanced fallback. Preserve importer options
and library data-block selection through dedicated surfaces, not a Unix browser.
Workspace UI work must not discard unfinished document identity, security scope,
provider coordination, sidecar, cancellation or recovery requirements.
