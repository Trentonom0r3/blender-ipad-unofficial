# Product direction and decisions

## Goal clarification: usability over a fixed UI mechanism

Build a full Blender experience that feels as though iPad was an intended
platform: comfortable, discoverable and predictable with fingers and Apple
Pencil, while remaining natural with a keyboard, mouse or trackpad. Preserve
Blender's real editors, advanced functionality and normal project compatibility.

The current rails, floating panels, global lock and layout controls are a working
design, not immutable product requirements. Preserve the problems they solve:
reachable tools, useful canvas space, discoverable navigation, independent native
editors, working splits, reversible layouts and retained editor state. Improve or
replace a mechanism when evidence supports a better interaction; document the
reason and check that earlier problems do not return. Do not redesign functioning
controls merely for novelty. Preserve the confirmed working Pencil squeeze radial
and double-tap context mapping.

Own reversible design and implementation decisions. Deliver coherent, installable
increments with a short account of what visibly changed. Judge progress through
complete touch/Pencil workflows: open a real project, navigate, select and move an
object, adjust a camera and properties, switch and dismiss panels, undo, save and
reopen. Check portrait, landscape, narrow windows and external input. Continue
broader editing and native Files requirements; this first workflow is a delivery
checkpoint, not the limit of Blender's supported capabilities.

Exact-source IPA run `35975045387` at `86c0591` passed native compilation,
packaging and artifact verification. Ask the user to test its everyday workflows
on iPad before choosing the next interaction change. Keep source implementation,
host tests, packaged IPA and actual-device acceptance separate. The full goal
remains active until the product outcome is satisfied.

## Latest user refinement — perceptible iPad usability, 2026-09-20

The user reports that the last successful build still feels like desktop Blender
with a little touch added. Their recording shows touch launchers opening dense
native Inspector contents and a narrow icon-only category strip. Pencil squeeze
and the existing radial tools work; preserve them. Own reversible design choices
without asking the user to specify the interface or manage implementation.

Prioritize a visibly more usable Inspector: a labeled current-category selector,
large labeled category choices, and full-width native property contents. Keep
native context filtering, search, pinning, editor state and advanced panels. This
refines the existing workspace contract; it does not replace Blender's editors or
remove the remaining splits, layout reversal, input and Files requirements.
The follow-up source review found that narrow saved Inspector widths can still
cramp native fields; its new 360-unit floor yields to actual window bounds. Rails
now expand to 44-unit touch targets when there is room and contract toward 28
units in narrow windows. Validate this on device before treating it as a solution
to the broader desktop-like feel. Exact-source IPA run 35850985308 passed native
Release compilation and packaging; device acceptance remains open.
Provider-aware Save source `e88e377` also passed native Release compilation and
IPA packaging in run 35858987938. Its Files behavior and the broader touch design
still need iPad acceptance.
Revisiting the user's recording shows three dense rows above the canvas: global
menus/workspaces, the 3D View header, and the Tool Header. Verified IPA run
`35975045387` initially collapses the native Tool Header only for an unsaved
factory/new Layout workspace in Object Mode. A left-rail Settings control
restores that same row. Sculpting and opened projects retain their saved
visibility, including a saved project named Layout. Preserve mode-specific
controls and external-input routes; verify this behavior and its effect on
felt usability on the iPad before treating it as an improvement.
Source implementation, host preview, packaged iOS build and device acceptance
must remain distinct. Judge further changes by common tasks on the device.

## Latest user refinement — left rail, global lock and working splits

Latest feedback: the permanent Layout button is rejected and reportedly
interferes with native bottom-panel tabs (Sculpt General/Paint/Simulation).
Remove it from the permanent rail, preserve discoverable workspace editing,
and verify native tab input ownership. Independent subagent UX reviews are
authorized; use them to challenge design and input assumptions.

This section supersedes older right-side Tools/footer launcher/per-edge pin wording.
Keep permanent matching vertical rails on both edges. Tools and bottom-editor/brush
launchers belong on the **left**. Tools opens the actual native narrow vertical
toolbar independently; bottom editors and shelves still open at the **bottom** and
must not overlap Tools. Native Item/Tool/View categories, Scene (Outliner), Inspector
(Properties) and supporting side editors stay on the **right**.

Use one always-reachable circular global panel lock beneath the native navigation
buttons, with an equivalent control in editors lacking that stack. It locks Tools,
side and bottom content together, including panels opened after locking. Switching
content preserves the global lock; unlocking restores ordinary dismissal. Remove
the footer launcher and pin controls. Keep native editor contents and useful saved
sizes; the status bar resumes its original purpose.

Preserve working-editor splits instead of reducing every workspace to one canvas.
Provide horizontal/vertical split, two-axis resizing and panel reordering through
touch-usable controls. These are part of the requested outcome; do not report the
milestone complete after relocating buttons alone. The native Pan/Move navigation
button must accept Pencil press-and-drag just as Zoom does, while preserving direct
finger navigation, external pointer input and the approved radial/Pencil mappings.


Read this for the durable product direction, IPAD_WORKSPACE.md for the active redesign
and acceptance criteria, TABLET_UX.md for implementation detail,
and PROJECT_HANDOFF.md for the latest work and validation. Update decisions when
evidence changes; do not restart the design each session.

## Goal and user

Develop the existing Blender iPad app into a coherent, comfortable touch and
Apple Pencil experience for real work, while preserving Blender's full editor
architecture, project compatibility, advanced capabilities and normal external
keyboard/mouse/trackpad use. The user should be able to remove the keyboard and
continue without tiny unexplained controls, awkward panel transitions or missing
touch equivalents for essential actions.

The primary user is a filmmaker: scene blocking, cameras, previs, environment
layout, simple modeling, review and quick on-set adjustments. Prioritize visible
improvements to these everyday tasks. Preserve the working Pencil squeeze radial
and double-tap context menu. Reuse native Blender state and operators. Own
reversible design choices and engineering; the user supplies device observations
and judges whether the result feels better, without managing the implementation.

Deliver coherent, installable builds with a short account of what visibly changed.
A source commit, passing tests, a desktop preview or successful compilation alone
cannot establish that an interaction is comfortable on an iPad.

### Immediate delivery sequence

1. Completed: diagnose the failed native build and produce a verified IPA for
   source `cb7966c`. The actual failure and replacement artifact are recorded in
   PROJECT_HANDOFF.md; do not retry the failed SHA.
2. Completed: package the saved-layout history and exact-edge join in verified IPA
   run `35833417772` at source `0a7b005`. The follow-up native build for `56f5e23`
   exposed a stale patch hunk count, now corrected with a preflight regression test.
   Corrected source `965bb70` passed native compilation and IPA packaging in run
   `35835722868`. Follow-up `e7cce60` adds distinct restore-history labels and is
   packaged in verified IPA run `35837932326`; see PROJECT_HANDOFF for artifact
   identity. Use this latest IPA for device validation:
   check Inspector category selection/settings/scrolling, then save, split, join,
   restore and reopen a layout with finger and Pencil, including a narrow window.
3. Improve the remaining everyday friction through complete workflows: selecting
   and transforming objects, adjusting cameras and settings, opening/dismissing
   panels, undoing changes, and saving/reopening projects. Choose the next change
   from observed friction; do not treat more launchers or layout features as proof
   of a better iPad experience.
4. Complete the remaining workspace restoration/reversal and native Files lifecycle
   requirements. Preserve all earlier functionality and unresolved regression
   reports while improving usability.

### Outcome used to judge progress

On the user's M5 iPad Pro with Pencil Pro and no keyboard attached, a representative
scene-blocking session should allow opening a project, selecting/moving an object,
adjusting a camera and a property, changing and dismissing panels, undoing an edit,
saving, and reopening with the intended state intact. Controls should be readable,
reachable and predictable in landscape, portrait and a narrow supported window.
Repeat the relevant workflow with external input to catch regressions.

For each increment, record the exact source/build and distinguish implemented,
host-previewed, packaged and device-verified behavior. Keep the overall goal open
until the usability outcome and remaining capability requirements are satisfied.

## Established direction

* **Canvas First** is selected. Keep permanent obstruction small. Put common
  commands on contextual surfaces; reveal dense editors when needed.
* Preserve every Blender editor, importer/exporter option and advanced workflow.
  Keyboard/mouse use remains supported. Tablet controls must not reduce features.
* Adapt **all workspace layouts** to floating panels while preserving the purpose,
  editor contents and state of each default or saved layout. The central working
  editor need not be a 3D Viewport. Do not flatten every workspace into one layout.
* Keep permanent matching vertical rails. Left launchers open the native Tools
  toolbar and supporting bottom editors/shelves; right launchers open native sidebar
  categories and supporting side editors. Scene is the full Outliner and Inspector
  the full Properties editor. Use actual WINDOW bounds, without custom wrapper bars.
* One circular global lock beneath navigation governs Tools, side and bottom panels,
  including later openings. Switching content preserves the lock. The native status
  bar carries neither panel launchers nor lock controls.
* Preserve working-editor splits. Provide horizontal/vertical split, touch seam
  resizing, two-axis floating panel sizing and launcher reordering, with useful
  remembered sizes and reachable controls. See IPAD_WORKSPACE.md for acceptance.
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
| Permanent left/right rails | Left Tools and bottom launchers; right native categories and side editors. Keep navigation and headers clear. Implementation and validation are tracked in the handoff. |
| Global lock and editable workspace geometry | One lock governs Tools, side and bottom. Switching preserves it. Two-axis panel sizing, working split resizing and launcher reordering remain required; partial source support is not acceptance. |
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

Source checkpoint `5e11388` routes Save As and Save Copy through a live Blender
modal operator event. UIKit now returns compression and picker choices without
retaining `bContext *`; serialization and document-state updates run under the
operator's current context. Save As stages with copy semantics so cancellation
does not replace the active path before a Files destination is chosen. The first
native build exposed an accidentally truncated, unrelated model-exporter header;
`bd240bf` restores that path and adds a regression test. Replacement iOS run
`35846812298` passed native Release compilation and IPA packaging for exact source
`bd240bf`; artifact identity is in PROJECT_HANDOFF. Device acceptance remains open.
This closes the callback-lifetime audit only. Provider-safe later Save, security
scopes/bookmarks and coordinated I/O remained unfinished at that checkpoint.
Verified IPA run `35858987938` at source `e88e377` adds a bookmark-backed,
coordinated ordinary Save route for documents moved into Files by Save As.
Hardware/provider acceptance, sibling assets and the rest of the Files lifecycle
remain open.

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

Current priority: deliver perceptible everyday iPad usability in installable builds,
starting with a successful current Inspector build and the workflow checks above.
Complete the floating-panel contract in IPAD_WORKSPACE.md, including permanent
rails, real editors, global lock, working splits, resizing, reordering and input
ownership across all layouts, as part of that usability outcome. Preserve the
native Files work, radial palette and unresolved Frame Scene navigation report.
Address confirmed P0 regressions before extending the milestone. Source, build,
packaging and actual device acceptance remain separate gates.

Finish coherent repairs before starting larger rewrites. Avoid cancelling build
after build for small additions. The overlay is source of truth; scratch source
materializations are not. The actual checkout path is in PROJECT_HANDOFF.md.
