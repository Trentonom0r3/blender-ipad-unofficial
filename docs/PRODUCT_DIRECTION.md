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
* Adapt **all workspace layouts** to floating panels while preserving the purpose,
  editor contents and state of each default or saved layout. The central working
  editor need not be a 3D Viewport. Do not flatten every workspace into one layout.
* Keep narrow vertical right tabs permanently available, matching Blender's sidebar
  and avoiding navigation gizmos. A tap opens the real Blender editor or sidebar
  category beside its button. Scene uses Outliner; Inspector uses Properties. Show
  native editor contents without custom Item/Scene title, Pin or X wrapper bars.
* Put bottom launchers in the existing status/footer bar. Timeline, nodes and brush
  shelves retain their bottom placement where the original layout places them
  there. Bound floating panels to the actual editor WINDOW region, accounting for
  variable headers such as Sculpt. No custom subset or More detour.
* Small footer Pin Panels controls independently keep one side and one bottom area
  open. Switching panels preserves that area's pin and replaces the displayed editor;
  it never stacks panels. Start at the maximum useful size, provide horizontal side
  and vertical bottom resizing while pinned or unpinned, and remember sizes per
  workspace. Details are in IPAD_WORKSPACE.md.
* Global UI enlargement is not the solution. Adapt targets, scrolling, density,
  placement and presentation. The user rejected the Canvas popover as the primary
  control surface. Replace that role with the Pencil tool palette and workspace
  surfaces in IPAD_WORKSPACE.md; do not keep expanding the popover.
* Finger navigation/general UI and Pencil precision/creative input are the guiding
  distinction. Preserve pressure/tilt/hover work. Every new mapping needs a purpose.
* User-approved mapping: Pencil squeeze opens the **radial** tool palette; double tap
  opens the context/right-click menu. Preserve the existing nine-tool ring and geometry;
  see the handoff for implementation and validation status.
* Every secondary/fullscreen view needs a discoverable escape without hover or a
  keyboard. Restoration must preserve workspace state.
* Normal file workflows must use iPad Files concepts, not require Unix paths.
  A renamed desktop File Browser does not meet the goal.

## Decisions and evidence

| Decision | Reason / status |
| --- | --- |
| Reuse Blender operators and editor state | Preserve functionality and avoid parallel implementations. Established. |
| Floating panels across every workspace | User-approved contract; implementation in progress. Each layout supplies its editors and placement. The previous custom Scene/Inspector drawers do not fulfill it. |
| Narrow native-style right tabs and bottom footer launchers | Latest user-approved refinement. Keep navigation gizmos and variable editor headers clear; show the actual editor without custom wrapper chrome. Implementation and validation are tracked in the handoff. |
| Independent side/bottom area pins and resize | Footer controls pin each area; switching replaces its editor while preserving its pin. Start at maximum useful size and remember user resizing. Source implementation, preview, iOS compilation and device acceptance are separate gates. |
| Reversible Canvas maximization | Increase working space without replacing saved layouts. Existing implementation has host restoration evidence; full device matrix pending. It is not the final workspace panel architecture. |
| Native Close View footer | Immediate escape without covering content. Device confirms closing works; touch flicker reported. Transitional chrome, not final floating-editor design. |
| Explicit, idempotent Metal setup | Lifecycle-only setup caused black startup. Repair 7451cf1 restores startup on device. Preserve explicit initialization. |
| GPU backing textures match content drawable | Native footer reduces content height; UIScreen is no longer its framebuffer size. Correction 1d8e6a7 has separate validation history in the handoff. |
| One active Metal view in the existing window architecture | Existing main loop/presentation assumes it. Floating Blender editors need explicit drawing, input, context and lifecycle ownership; opening separate UIKit windows alone does not satisfy the workspace contract. |
| Persistent fullscreen Back | Touch must not depend on a hover-revealed icon. Implemented; exact validation status is in the handoff. |
| Desktop filesystem picker must be replaced | User decision supersedes the previous advanced-browser fallback. Preserve options and internal library data-block selection in dedicated surfaces. |

## Native Files implementation contract

Native Open, Save As, Save Copy, unsaved Save and model import/export have incremental
implementations recorded in PROJECT_HANDOFF.md. The original 4eeb43d project-copy
import is historical, not the full current route inventory. Native Open copies the
chosen project into visible Projects storage. Save As and Save Copy now use native
compression prompts and Files destination selection. FBX export is currently guarded
as unsupported due to the unavailable NumPy dependency; do not claim full format
coverage or full Files lifecycle acceptance from these routes.

Preserve the platform document service connected to the existing file-selector
operator lifecycle. Supported normal workflows should present UIKit document
pickers. No desktop filesystem-browser fallback in the final product. During
incremental implementation, clearly identify routes still awaiting replacement;
do not remove working functionality before its replacement exists.

1. Preserve originating context, options, cancellation, undo, reports and script
   execution checks for open/import/export.
2. Preserve document identity: ordinary Save updates the working document. Do not
   silently turn Save As into a local copy plus an unrelated exported copy. Explicit
   Export/Save Copy can create independent copies. Updating Blender's stored path
   alone does not establish permission or provider-safe subsequent Save.
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

Retain the unfinished audits for external document identity and later Save, provider
coordination, permissions/bookmarks, sibling assets and sidecars, operator options,
Open Recent, Link/Append, recovery and cancellation. Existing source/build checks are
not evidence that these complete workflows have passed on hardware.

The old scratch document service is a prototype, not an accepted architecture.
Its coordinator protected path copying, not subsequent reads, and its Save Copy
route did not implement normal external Save. Reuse the lifecycle investigation;
review and correct the implementation before adopting it.

## Priority and validation gates

Label evidence separately: source checks, host preview, compilation, iOS build,
IPA packaging, simulator, actual device. Build success is not touch/Files validation.
Startup and closing success does not imply pressure, mouse, restoration or performance
acceptance. Record device reports narrowly.

Current priority: implement the user-approved floating-panel workspace contract,
including startup, every workspace, actual editor reuse, permanent buttons,
independent side/bottom area pins and resizing. The latest refinement uses native-style
right tabs, footer launchers and pin controls, real WINDOW bounds and native editor
content without extra wrapper bars. This supersedes the earlier instruction
to prioritize Files over workspace panels. Preserve Files implementation and its
unfinished lifecycle work, the working radial palette and the unresolved Frame Scene
navigation report. Address confirmed P0 regressions before extending the milestone.

Finish coherent repairs before starting larger rewrites. Avoid cancelling build
after build for small additions. The overlay is source of truth; scratch source
materializations are not. The actual checkout path is in PROJECT_HANDOFF.md.
