# iPad workspace design and delivery

## Goal clarification: usability over a fixed UI mechanism

Follow the goal clarification in `docs/PRODUCT_DIRECTION.md` (or
`PRODUCT_DIRECTION.md` from this docs directory). It supersedes wording below
that treats a particular rail, panel or lock mechanism as immutable. Preserve the
underlying capabilities and lessons; improve the design when evidence supports a
better iPad interaction. Preserve the working Pencil mappings and external input.
Judge progress by complete workflows in installable builds and actual-device
acceptance, while continuing unfinished workspace and Files requirements.

## Current Inspector iteration — source only, 2026-09-24

The user tested IPA run 35975045387 and reports that the Inspector opens too
wide, resists further shrinking, and lacks visible desktop-style category icons.
The next source candidate restores the native Properties navigation strip on the
left of its floating editor, retains the labeled native enum picker in the
header, lowers the Inspector-only minimum side width to 280 scaled units, and
opens it at 35% of usable content width when no saved width exists. The native
enum still controls filtering, active context, search highlighting and the
dynamic object-data icon. Saved widths and other side editors are unchanged.
Host tests and pinned-source preflight pass; no IPA or device validation exists
for this iteration yet. Check fresh and saved Layout, portrait and narrow
windows, dense Properties fields, and Inspector/Scene switching on device.

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
The next source checkpoint also raises the Inspector's minimum side width to 360
scaled UI units and makes the two permanent rails 44 units wide where space permits,
tapering to 28 in narrow windows. This responds to cramped native controls and
undersized rail hit targets identified in a read-only review. Exact-source IPA
run 35850985308 passed native iOS compilation and packaging; device judgment is open.
Verified IPA run `35975045387` at source `86c0591` initially collapses the
native Tool Header for an unsaved factory/new Layout workspace in Object Mode.
The labeled Settings entry after Tools reopens the same row. Opened projects
and dedicated workspaces retain saved visibility, even when they start in
Object Mode; changing modes within Layout keeps the current setting until
Settings is used. Native compilation and IPA packaging pass. Device checks
remain open, including narrow-window rail paging and saved-workspace persistence.
Source implementation, host preview, packaged iOS build and device acceptance
must remain distinct. Judge further changes by common tasks on the device.

## Latest user refinement — left rail, global lock and working splits

Latest feedback: the permanent Layout button is rejected and reportedly
interferes with native bottom-panel tabs (Sculpt General/Paint/Simulation).
Remove it from the permanent rail, preserve discoverable workspace editing,
and verify native tab input ownership. Independent subagent UX reviews are
authorized; use them to challenge design and input assumptions.

Device refinement, 2026-09-13: Sculpt opens its real brush shelf by default on first
eligible use, then remembers closure. The shipped desktop startup saves that shelf
hidden, so iPad needs an explicit default. Center the native toolbar using its own
preferred width. Pin must respond to finger/Pencil taps; navigation controls must
accept finger/Pencil press-drag-release with mouse-equivalent behavior. Preserve
finger scrolling outside navigation and the established Pencil radial mappings.

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


## Active milestone: usable everyday iPad workflows

The updated product goal prioritizes felt usability in an installable build.
The floating-panel design below remains the implementation baseline; its
mechanisms may evolve under the goal clarification above. Its feature checklist alone
is not acceptance: verify opening a project, selecting/moving an object, adjusting
a camera/property, switching/dismissing panels, undo, save and reopen using touch
and Pencil. Preserve working radial tools and external input. See PRODUCT_DIRECTION
for the complete goal and delivery sequence.

The labeled Inspector change is present in verified IPA build 35698122851 at source
`cb7966c`; its iPad acceptance is still pending. Saved-layout history and exact-edge
join are in verified IPA run 35833417772 at source `0a7b005`. Follow-up run 35833932550
failed because the patch's new-file hunk count omitted the closing lines of
`screen_ipad_panels.cc`. The patch and preflight now check matching hunk totals; all
29 host tests and pinned-source preflight pass. Corrected commit `965bb70` is in
verified IPA run 35835722868. Follow-up `e7cce60` adds distinct saved-layout
restore labels; its verified IPA is run 35837932326. The latest source-check and
build status is in PROJECT_HANDOFF.md. Save/reopen behavior, multiple-window
lifecycle and device acceptance remain open.
Continue improving settings and panel interactions that interrupt common workflows,
while retaining native functionality.

### Floating panels for every workspace

Implementation is in progress. PROJECT_HANDOFF.md records exact source, build,
artifact and device evidence. Earlier successful builds do not validate newer changes.

### Layout and native content

Apply the presentation at fresh launch, project load and workspace switching.
Preserve each default and saved workspace's native editors, working splits and
editor state. A workspace can have several working editors, including non-3D
editors. Supporting editors retain side or bottom placement based on the saved
layout, rather than a rule that all editors of one type belong on one edge.

Keep matching, permanent, noncollapsible vertical rails on both edges:

- Left: Tools and launchers for supporting bottom editors and brush shelves.
  Tools opens the actual narrow vertical native toolbar independently of bottom
  content. Bottom launchers open actual editors or shelves at the bottom.
- Right: native Item/Tool/View sidebar categories, Scene (full Outliner), Inspector
  (full Properties), and other supporting side editors supplied by that workspace.

A tap opens native content beside its rail, or at the bottom for bottom launchers.
Switching replaces the content of that area. At most one side and one bottom panel
are open, plus the independent Tools toolbar. No custom subset editors, More detour,
wrapper title rows, X buttons, footer launchers or footer pin controls. The native
status bar retains its original purpose. Closing content leaves its rail visible.

Keep panels within actual editor WINDOW content bounds, including variable Sculpt
headers. Avoid overlap between Tools and bottom content and between side and bottom
panels. Drawing, hit testing and native operator context must agree even when a
floating region extends over another working editor. Preserve selection, tools,
scroll/zoom, editor settings, undo and saved layout data through all transitions.

### Global lock and defaults

One always-reachable circular lock sits beneath navigation near the outer right
rail. Editors without that navigation stack use an equivalent control. It locks
Tools, side and bottom content together, including panels opened after locking.
Switching content preserves the lock. Tapping an active locked launcher does not
close its content. Unlocking restores ordinary outside-tap and active-tab dismissal.

Use native Tools visibility on first adaptation. Sculpt opens its real brush shelf
on first eligible use, even though shipped desktop layouts save it hidden. Wait
until the shelf is available, preserve an already selected bottom editor and remember
explicit closure. Center Tools using the native preferred toolbar width.

### Resizing and workspace editing

Start floating panels at their maximum useful size, remember workspace sizes and
clamp them to usable bounds. Broad handles must work with finger, Pencil and pointer
while locked or unlocked. Two-axis panel sizing, horizontal/vertical working-editor
splits, touch resizing of split seams and panel launcher reordering are required.
Keep these controls reachable in portrait, landscape, narrow Stage Manager windows,
with safe areas and an onscreen keyboard.

Current source offers side-width and bottom-height strips, two-axis corner sizing,
native split commands, working-editor content swapping and draggable seams for
recursive and irregular layouts. These are source-implemented and host-tested;
exact build/device evidence is in PROJECT_HANDOFF.md. Arrange Launchers offers
earlier/later ordering within each physical rail; device/save-reload acceptance
remains pending. A later checkpoint added Save Layout/History, native screen-copy restore,
automatic checkpoints before split/swap/join, a retained-editor exact-edge join,
and guarded removal; see the latest PROJECT_HANDOFF.md entry. Source and host-helper
tests pass. Native builds for those features passed; save/reopen, multiple-window
lifecycle and device acceptance remain open. Restoration and reversal must preserve native editor state
rather than discard a workspace.

### Acceptance criteria

1. Fresh launch, project open and every bundled workspace immediately show their
   working editors and permanent rails. Saved and custom layouts retain their
   identities, working splits and native editor state.
2. Each right launcher opens its real sidebar category or full editor. Tools opens
   the narrow native toolbar from the left. There are no custom wrapper rows or
   subset editors. Navigation remains reachable.
3. Left bottom launchers open native Timeline, node editors or brush shelves at
   the bottom where applicable. Main node editors remain working editors. Sculpt
   defaults to visible brushes once eligible and remembers explicit closure.
4. Tools, one side panel and one bottom panel coexist. Lock, open another panel,
   switch content, use the canvas, unlock and dismiss with finger/Pencil/pointer.
   One global lock governs the complete sequence and stays reachable.
5. Resize panels in both axes and resize working seams using touch controls. Split
   horizontally/vertically, reorder launchers and reverse layout edits. Switch
   workspaces and return; verify remembered geometry and native editor state.
6. Repeat opening, closing, resizing and workspace switching in portrait, landscape,
   narrow windows and with the keyboard. Verify actual header clearance, no blocked
   essential controls, aligned drawing/input and correct context across split areas.
   In Object Mode, toggle the left-rail Settings entry and confirm the complete
   native Tool Header returns; check Sculpt and other modes keep their controls.
7. Native navigation controls accept finger and Pencil press-drag-release like a
   mouse. Verify cancellation, multi-touch interruption, popup occlusion, fullscreen,
   temporary views and quad views. Preserve direct finger navigation elsewhere.
8. Preserve squeeze tools, double-tap context menu, pressure/tilt/hover, keyboard,
   mouse, trackpad and hot-plug input. Desktop builds retain desktop behavior.

Aim for roughly 44-point targets where practical while keeping the rails narrow.
Do not globally enlarge Blender. Host geometry checks and previews cannot establish
UIKit input, GPU compositing, native operator lifetime or real-device usability.

## Existing Pencil tools to preserve

* **Pencil Squeeze:** opens the nine-tool radial palette.
* **Pencil Double Tap:** opens the context menu (right-click).
* **Left Tools button:** opens the native vertical toolbar for touch access.
  Native visibility controls and keyboard toggles use the same panel state.
* Preserve the existing ring geometry, all nine tools and hover behavior. This panel
  milestone does not change the radial design; use the current source and
  PROJECT_HANDOFF.md for its implementation and validation state.
* Selecting a tool dismisses the palette. Outside tap, squeeze again and Escape
  dismiss without executing a tool or moving scene objects. Preserve desktop input.

Panel work must reuse these controls without repurposing the approved gestures.

## Native Files and other unfinished work

Native Open, Save As, Save Copy, unsaved Save and model import/export have incremental
implementations. Their exact source/build history is in PROJECT_HANDOFF.md. Preserve
that work while implementing the active workspace milestone. FBX export currently
reports unsupported because NumPy is unavailable; do not describe every model format
as working or infer complete Files acceptance from a native picker appearing.
The next local source candidate adds an explicit folder-copy import for projects
with sibling assets; PROJECT_HANDOFF records its unbuilt status and limits.

Source `5e11388` removes the retained `bContext *` callbacks from project Save As
and Save Copy. UIKit sends a native event to a live modal operator; Blender performs
serialization and Save As identity updates when that operator has a current context.
Its first native build failed on a truncated model-exporter header; source `bd240bf`
restores that separate route and adds regression coverage. Replacement iOS run
`35846812298` passed native Release compilation and IPA packaging; the artifact
was downloaded and checked. See PROJECT_HANDOFF.md for exact build evidence,
pending device acceptance. A later checkpoint, source `e88e377` in verified IPA
run `35858987938`, changes Save As to retain a bookmark for a moved Files document
and coordinates subsequent ordinary Save through local staging. This remains
unaccepted on device and does not yet solve sibling assets, multi-document
identity or all recovery paths.
The unbuilt follow-up source preserves the unsaved marker when the user edits
after Save or Save As stages its snapshot but before the Files write completes.
Device acceptance must exercise that delayed-provider case as well as an
unchanged Save that clears the marker.

The durable Files contract still requires correct document identity for later Save,
security scopes/bookmarks, actual provider I/O coordination, project-folder/sibling
asset access, exporter sidecars/options, cancellation, Open Recent, Link/Append and
recovery. See PRODUCT_DIRECTION.md. UI changes must not erase these unfinished items.

The user also reported that Frame Scene changes navigation feel and limits zoom.
Preserve that report as unresolved; do not change navigation preferences or projection
speculatively while working on panel presentation.

## How sessions stay aligned

PRODUCT_DIRECTION owns the overall contract; this file owns the workspace design
and active UI milestone; PROJECT_HANDOFF owns current facts and next steps.
AGENTS.md requires reading them. Label every item as planned, source-implemented,
compiled, previewed or device-accepted. Record why a design changes; no silent drift.

At session end record what the user can newly do, the exact changed code/build,
validation limits, and the smallest next implementation step. If a confirmed P0
interrupts the milestone, record it and resume the milestone once addressed.
The human supplies device observations and final judgment on consequential design
choices; ordinary layout, coding and backlog decomposition belong to the agent.
