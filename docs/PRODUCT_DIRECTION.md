# Product direction and decisions

Read this for the durable product direction, IPAD_WORKSPACE.md for the active redesign
and acceptance criteria, TABLET_UX.md for implementation detail,
and PROJECT_HANDOFF.md for the latest work and validation. Update decisions when
evidence changes; do not restart the design each session.

## Goal and user

Make Blender intentionally useful on iPad while retaining Blender's power and
identity. The primary user is a filmmaker: scene blocking, cameras, previs,
environment layout, simple modeling, review and quick on-set adjustments. Success
is opening a project, manipulating it, saving it and moving on with little friction.
The user tests M5 iPad Pro / Pencil Pro builds; the agent owns engineering,
prioritization and reversible product decisions.

## Established direction

* **Canvas First** is selected. Keep permanent obstruction small. Put common
  commands on contextual surfaces; reveal dense editors when needed.
* Preserve every Blender editor, importer/exporter option and advanced workflow.
  Keyboard/mouse use remains supported. Tablet controls must not reduce features.
* Global UI enlargement is not the solution. Adapt targets, scrolling, density,
  placement and presentation. The user rejected the Canvas popover as the primary
  control surface. Replace that role with the Pencil tool palette and workspace
  surfaces in IPAD_WORKSPACE.md; do not keep expanding the popover.
* Finger navigation/general UI and Pencil precision/creative input are the guiding
  distinction. Preserve pressure/tilt/hover work. Every new mapping needs a purpose.
* User-approved mapping: Pencil double tap opens a **radial** tool palette; squeeze
  retains the context/right-click menu. First source implementation is 34fd27e;
  see the workspace milestone and handoff for validation status.
* Every secondary/fullscreen view needs a discoverable escape without hover or a
  keyboard. Restoration must preserve workspace state.
* Normal file workflows must use iPad Files concepts, not require Unix paths.
  A renamed desktop File Browser does not meet the goal.

## Decisions and evidence

| Decision | Reason / status |
| --- | --- |
| Reuse Blender operators and editor state | Preserve functionality and avoid parallel implementations. Established. |
| Reversible Canvas maximization | Increase working space without replacing saved layouts. Implemented; host restoration evidence, full device matrix pending. |
| Native Close View footer | Immediate escape without covering content. Device confirms closing works; touch flicker reported. Transitional chrome, not final floating-editor design. |
| Explicit, idempotent Metal setup | Lifecycle-only setup caused black startup. Repair 7451cf1 restores startup on device. Preserve explicit initialization. |
| GPU backing textures match content drawable | Native footer reduces content height; UIScreen is no longer its framebuffer size. Correction 1d8e6a7 awaits validation. |
| One active Metal view for now | Existing main loop/presentation assumes it. Simultaneous floating editors need a separate rendering change. |
| Persistent fullscreen Back | Touch must not depend on a hover-revealed icon. Implemented, device acceptance pending. |
| Advanced Blender browser remains available | Native selection must preserve format options, Append/Link, directory selectors and custom exporters. Required. |

## Native Files implementation contract

Current incremental delivery (4eeb43d): **Import Project from Files** explicitly imports
an independent `.blend` copy into visible Projects storage using UIKit. Ordinary Save
updates that copy. The source project must have its external resources packed; sibling
assets are not imported. This does not fulfill external-document Open/Save/Save As.
The copy itself is performed inside NSFileCoordinator's accessor on a worker queue.
Source validation passes; native compilation/device acceptance are tracked in the handoff.

Implement a platform document service connected to the existing file-selector
operator lifecycle. Supported normal workflows should present UIKit document
pickers; Blender Browser & Options is the explicit advanced route/fallback.

1. Preserve originating context, options, cancellation, undo, reports and script
   execution checks for open/import/export.
2. Preserve document identity: ordinary Save updates the working document. Do not
   silently turn Save As into a local copy plus an unrelated exported copy. Explicit
   Export/Save Copy can create independent copies.
3. Own security-scoped URLs with balanced access, bookmarks, revocation/error
   handling and defined lifetime. File permission does not grant sibling texture
   or library access; support project-folder access.
4. Coordinate actual provider reads/writes, not just obtaining a path. Keep cloud
   downloads and native interaction from blocking the Blender/Metal main loop.
5. Cancel/dismiss/window destruction/project replacement must complete a request
   exactly once. Late callbacks cannot execute freed or reused operators.
6. Do not report an external save successful before its provider write succeeds.
   Preserve overwrite confirmation, exporter sidecars and format-specific options.
7. Projects and recovery must be findable in Files. Documents/Recovery is implemented
   for autosaves; Recover Last Session and broader ownership remain unresolved.

The old scratch document service is a prototype, not an accepted architecture.
Its coordinator protected path copying, not subsequent reads, and its Save Copy
route did not implement normal external Save. Reuse the lifecycle investigation;
review and correct the implementation before adopting it.

## Priority and validation gates

Label evidence separately: source checks, host preview, compilation, iOS build,
IPA packaging, simulator, actual device. Build success is not touch/Files validation.
Startup and closing success does not imply pressure, mouse, restoration or performance
acceptance. Record device reports narrowly.

Current UI milestone: Pencil double-tap tool palette, retaining squeeze for context
menu, followed by Scene/Inspector drawers. See IPAD_WORKSPACE.md. Address confirmed
P0 regressions when necessary, but return to this milestone instead of indefinitely
deferring the redesign for incremental platform additions. Native Files remains
necessary and unfinished. User feedback explicitly rejects desktop-like feel.

Finish coherent repairs before starting larger rewrites. Avoid cancelling build
after build for small additions. The overlay is source of truth; scratch source
materializations are not. The actual checkout path is in PROJECT_HANDOFF.md.
