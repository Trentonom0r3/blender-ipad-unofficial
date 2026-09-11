# Project handoff — 2026-09-10

## Native Files menu discovery repair — 2026-09-11, latest

Source: **053d387**. Repair build dispatched:
https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/34564379590
Compilation/IPA completion not yet checked; inspect this run next.

Device report: pinch feels much better (user specifically mentions Frame Selection;
do not infer acceptance of every Frame Scene/camera/orthographic case). Save Copy
still opened the desktop file browser and failed writing Untitled.blend at the app
container root. Attached screenshots establish that the native route was not used.
Combined build 34561710319 completed successfully; this was a runtime UI-routing bug.

Root cause reproduced in host Blender 5.1.2: registered C++ operators are absent
from bpy.types. `hasattr(bpy.types, "WM_OT_save_as_mainfile")` is false even though
`bpy.ops.wm.save_as_mainfile.get_rna_type()` succeeds. Our Save Copy feature check
therefore selected the desktop fallback. The same check hid Import Project from
Files in the File menu, file context menu and Workspace panel. Checking hasattr
on bpy.ops is also wrong: its dynamic wrapper exists even for nonexistent names.

Changed all four checks to registry membership via `dir(bpy.ops.wm)`. The existing
native export/import implementations are preserved. `validate_native_operator_discovery.py`
extracts the shipped guard expressions and evaluates them against an actual native
C++ operator (name substituted for host testing) and a missing operator. All four
pass. This avoids Python-registered mock classes, which would conceal this defect.
Source preflight passes across 32 pinned files. UIKit/provider validation still pending.
Earlier host Save Copy tests only checked writer semantics and missed menu discovery.

Device test for the repair build:
1. File > Save Copy must show Name + Compress + Choose Destination, then the native
   Files picker. The desktop directory listing in the screenshot must not appear.
2. Save `copy-test.blend` to On My iPad; verify it exists in Files. Repeat to iCloud.
3. Cancel a second copy at the native picker; expect the workspace and unchanged
   original Save target/unsaved state. No false success report.
4. File > Import Project from Files should now be visible; choose the test copy and
   confirm it opens after the usual unsaved-changes protection.
If the desktop picker still appears, obtain exact entry point/build; do not ask the
user to navigate Unix directories as the intended solution.

Ordinary Open/Save/Save As, library selection and general import/export remain
unconverted. This repair makes the two existing native operations reachable; it
is not completion of the full native Files replacement. Radial layout unchanged.

## Direct-pinch depth navigation — latest follow-up

Source commit: **ed0b94e**. Build requested (queues behind Save Copy):
https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/34561710319
This build includes both native Save Copy and the pinch adaptation.

User confirmed that **Frame Selection after Frame Scene restores the expected
navigation**. This supports a view-pivot/depth issue; it is not evidence of a stuck
modal tool. No projection label was reported. The precise hardware cause remains
unconfirmed until the following change is tested.

Implemented a targeted adaptation: direct screen pinches enable Blender's existing
depth navigation and cursor-position zoom. Frame Scene remains stock Frame All;
its scene framing, object selection and global navigation preferences are unchanged.
Camera view is excluded, including locked-camera workflows. Indirect trackpad/mouse
input retains existing preference behavior. Auto depth samples geometry under the
pinch midpoint, falling back to Blender's current depth when no surface is available.

Input path: GHOSTUIPinchGestureRecognizer tracks UITouchTypeDirect and resets that
state per gesture (exclusive touch types); UserInputEvent carries the source;
GHOST_kTrackpadEventMagnifyTouch maps to ordinary MOUSEZOOM plus
WM_EVENT_IS_TOUCH_PINCH. Queue coalescing keeps direct and indirect deltas separate.
ViewOpsData::init_navigation enables only supported depth/zoom flags for this
source outside camera view. Existing use_cursor_init=false handling remains intact.
The event flag enum's maximum was updated to include the new bit.

Validation: source preflight applies to 32 pinned files. New host-compiled test
extracts the shipped policy and checks 64 preference/support combinations, each
against null, indirect, non-zoom, camera, perspective and orthographic input, in
both iOS-enabled and desktop compilations. This does not test UIKit touch routing,
GPU depth reads, pinch feel or performance. iOS compilation/device testing pending.
The existing native Save Copy build 34561079484 is still in progress at checkpoint.
Build concurrency now queues new requests rather than cancelling active work.

Device protocol for the new build:
1. Default cube scene: Frame Scene, then pinch with the midpoint over the cube.
   Expect to approach the cube naturally without needing Frame Selection first.
2. Repeat after Frame Selection; check for sudden depth jumps or sideways drift.
3. Pinch over empty background; confirm navigation remains controllable.
4. Repeat in orthographic view and with a complex scene; report stutter if present.
5. Camera View: pinch must retain its previous camera-frame behavior. With a mouse
   or trackpad connected, verify zoom/orbit remains as before.

Native Files remains the main unfinished milestone. No additional Files routes
were converted in this follow-up. Compact ring remains concept-only; this user's
message confirmed navigation recovery, not an explicit review of its geometry.

## Native Save Copy and compact-ring concept — latest

Latest user report: nine-tool ring works great on iPad. Requested compact ring,
no center Settings, shelf hidden initially; **concept before implementing**.
`output/ui-preview/pencil-tools-compact-concept.png` was presented; awaiting review.
It is an illustrative mockup, not a host render. Production ring/shelf unchanged.
Current gesture mapping remains squeeze = tools, double tap = context menu.

User explicitly reprioritized **complete native Files replacement**, including Open,
Open Recent, Save/Save As, Link/Append, Import/Export. The previous requirement for
a desktop-browser advanced fallback is superseded. AGENTS, PRODUCT_DIRECTION and
IPAD_WORKSPACE now agree; older handoff sections are historical, not current orders.

### Implemented in this checkpoint

File > Save Copy now uses `wm.save_copy_to_files` on iOS. A small options dialog
collects name/compression, then UIKit's export picker selects the destination.
`GHOST_ProjectExportIOS.hh` (included only by GHOST_SystemIOS.mm) serializes a
temporary .blend via a synchronous C++ callback, then presents
`initForExportingURLs:asCopy:YES`. No Blender context/operator/callback is retained
across native interaction. UIKit owns provider copying/overwrite UI. Picker cancel,
completion and swipe dismissal release the source and presenter; repeated requests
are guarded. Only the UUID staging directory is deleted, never a destination URL.

Blender calls the existing wm_file_write with `use_save_as_copy=true` and absolute
asset remapping. Temporary staging must never become the working Save target or the
base for relative assets. Global compression flags are restored. No premature Saved
report is emitted before native completion. Plain Save/Save As remain unchanged.
Scripted `wm.save_as_mainfile(copy=True)` also remains the original synchronous API.

**Limit:** this is an independent copy, not external-document Save As. Unpacked
assets remain absolute references; they are not bundled or portable automatically.
Options explain Pack Resources; even packing does not support every external type.
Local scene serialization remains synchronous, like ordinary Blender save. Only
provider transfer is handed off to UIKit. Orphan staging after app termination can
remain in the OS temporary directory until purged; no project is stored only there.

Touched overlay sections: GHOST_ProjectImport-api.hh (export declaration), new
GHOST_ProjectExportIOS.hh, GHOST_SystemIOS.mm include, wm_files.cc/.hh,
wm_operators.cc registration, space_topbar.py conditional Save Copy route.

### Validation and build

Source commit: **9b1adf5**, pushed on `codex/ipad-secondary-view-escape`.
Build dispatched: https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/34561079484
Inspect this run next; do not dispatch another for documentation-only changes.

* Offline preflight: applies to 30 pinned files; Python/plist checks pass.
* Preflight checker: six tests pass. Tool geometry: 75 placements + fallback pass.
* Host Blender 5.1.2: existing nine-tool validation passes.
* `build/validate_save_copy_contract.py`: host upstream Save Copy contains edits,
  preserves original bytes, working filepath and dirty state. Background undo must
  be pushed explicitly to model an interactive dirty file. This validates reused
  upstream semantics, **not patched native C++, UIKit, or provider behavior**.
* iOS compilation/IPA/device validation of this new export path pending.

### Device test once this build succeeds

1. Open a disposable locally saved scene, move its cube without saving. File >
   Save Copy > name `copy-test` > Choose Destination > On My iPad. Verify the copy
   exists in Files; reimport a copy and confirm the changed cube position.
2. Before reopening, ordinary Save must still update the original project (not the
   exported copy). After Save Copy, unsaved-change protection must remain active.
3. Repeat Save Copy but cancel the destination picker; expect return to workspace,
   no changed Save target, no false Saved report. Repeat and swipe-dismiss if enabled.
4. Repeat to iCloud and an attached external drive; inspect the destination in Files.
   Test an existing filename to exercise system overwrite behavior.
5. Repeat open/cancel five times. Rotate the iPad with the picker open; ensure Cancel
   stays reachable. Test a packed texture; do not expect unpacked assets to transfer.

### Frame Scene report — unresolved

User reports different orbit/movement and limited zoom after Frame Scene. Button
calls stock `view3d.view_all`; no custom navigation mode was found. Pinned
view3d_navigate_view_all.cc frames bounds (including cameras/lights) and changes
view distance/orbit center. view3d_navigate_view_zoom.cc clamps distance to
ED_view3d_dist_soft_range_get. handleZoom emits ordinary trackpad magnification.
Do not claim a cause or fix yet. Asked user whether Frame Selection on the cube
restores zoom and whether viewport label is User Perspective or User Orthographic;
answer pending. No gesture/projection preferences changed speculatively.

### Next implementation, not yet started

1. Replace file-selection lifecycle for native Open/import while retaining options,
   unsaved-change handling, and a live originating operator/context. Audit
   WM_event_add_fileselect (~4424) and wm_handler_fileselect_do (~2810) in
   wm_event_system.cc. Native completion must skip desktop temporary-area restore;
   ordinary exec/report/undo/free behavior should be reused. Cancel on operator free.
2. Own security-scoped original URLs/bookmarks; coordinate actual reads/writes.
   Old scratch `document_impl.hh` incorrectly coordinated path extraction only.
   Do not merge it. Worker coordination with main-thread execution needs explicit
   cancellation/lifetime design; never block the main loop waiting for cloud access.
3. Native Save As must preserve destination identity for later Save; do not relabel
   this copy-export service as Save As. Open Recent and ordinary Save bypass the
   generic file selector, so they need access restoration/coordinated I/O too.
4. Link/Append need native .blend selection followed by an internal data-block
   selector; Files cannot browse inside a .blend. Preserve importer/exporter options,
   sidecar outputs and project-folder grants. Desktop dialogs are still present on
   these unconverted routes; full removal remains unfinished.

Apple export API reference:
https://developer.apple.com/documentation/uikit/uidocumentpickerviewcontroller/init(forexporting:ascopy:)

## Nine-tool ring compiler repair — latest

Run 34545890260 failed with one compiler error in `interface_region_menu_pie.cc:103`:
`UI_BUT_ALIGN_BOTTOM` was undeclared. The Blender RNA button alignment constant is
`UI_BUT_ALIGN_DOWN`. Corrected to `UI_BUT_ALIGN_DOWN`.
The authoritative patch and scratch implementation/generator are synchronized.
Full source preflight passes for 29 files, C++ geometry test passes, and headless
Blender validation passes.

Replacement build: https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/34557117227

## Nine-tool ring with swapped gesture mapping — prior checkpoint

Took over from an interrupted agent session / partial run where the nine-tool radial
concept was authorized and gestures were swapped per user request:
* **Pencil Squeeze** opens the nine-tool radial palette (`PENCIL_TOOL_PALETTE` = 0x0205).
* **Pencil Double Tap** opens the context menu (`PENCIL_CONTEXT_MENU` / right-click).
* **Header Tools** directly toggles the left tool shelf (`space_data.show_region_toolbar`).
* **Center Settings** provides a popup menu with "Show/Hide Tool Shelf" toggle.

Commit: **73ac8c3** on `codex/ipad-secondary-view-escape`.
Build: https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/34545890260

Delivered implementation & handover fixes:
* Corrected `IPAD_RADIAL_TOOLS` in `space_view3d_ipad.py` and generator: replaced invalid
  `'ANNOTATE'` icon identifier with Blender's built-in `'GREASEPENCIL'`, resolving the
  `AssertionError: ANNOTATE` test crash from the prior partial run.
* Updated `build/validate_pencil_tools.py` to test toolbar visibility toggling outside
  `temp_override` for headless compatibility.
* C++ 10-button geometry in `interface_ipad_tool_ring.hh` handles ring layout and narrow-screen
  grid fallback. `interface_region_menu_pie.cc`, `interface_handlers.cc`, and `interface.cc`
  handle placement, dismissal on gap/outside tap or second squeeze, and clean background rendering.

Evidence:
* `python -m unittest discover -s build -p test_tool_ring.py -v`: PASS (75 edge placements,
  ring order, center, scaling, no overlaps, narrow fallback).
* `& 'D:\Program Files\blender.exe' --background --factory-startup --disable-autoexec --python-exit-code 1 --python build/validate_pencil_tools.py`:
  PASS (9 tool slots in Object & Edit mesh modes, tool activation, no accidental cube insertion,
  header and settings shelf toggles). Evidence saved to `output/ui-preview/nine-tools-validation.json`.
* `python build/preflight.py`: PASS (clean patch application to 29 pinned source files, valid
  plist and script syntax).
* `.github/workflows/preflight.yml` updated to include `test_tool_ring.py`.

Device test protocol after next CI build:
1. Hover Pencil over cube, squeeze Pencil Pro: expect nine-tool radial ring centered near cursor.
2. Double tap Pencil: expect standard right-click context menu, not the tool ring.
3. Squeeze again with ring open, or tap gap/outside: expect ring dismissal without moving objects.
4. Squeeze > Move, translate cube, Undo; squeeze > Select. Repeat in Edit Mesh mode.
5. Tap header Tools button: expect left tool shelf to toggle visibility.
6. Open ring, tap center Settings > Hide/Show Tool Shelf: expect shelf toggle.
7. Verify Add Cube selects the interactive tool and does not insert an unrequested object.

## Device success and requested concept — prior checkpoint

User says repaired radial build "works perfectly." Record this as positive iPad
feedback, not separate acceptance of every unreported edge case or native Files.
They now request header Tools as shelf toggle, nine direct radial tools and Settings,
visually closer to the Z shading pie. See newest IPAD_WORKSPACE.md section and
`output/ui-preview/pencil-tools-nine-concept.png`. Concept generated and presented;
no application code changed. User explicitly wants to review before implementation.
Do not autonomously implement this revision or skip to drawers before that response.

## Radial build compiler repair — latest

Run 34537653252 failed with one reported compiler error in the new outside-tap
handler: `ui_window_to_block_fl(region, block, xy)` supplied three arguments.
Pinned interface_intern.hh:754 requires separate `float *x, float *y` arguments.
**5f68206** corrects it to `ui_window_to_block_fl(region, block, &xy[0], &xy[1])`.
The authoritative patch and scratch implementation/generator are synchronized.
Full source preflight still passes for 27 files, and diff whitespace checks pass.
No interaction or layout changes were made in this repair.

Replacement build: https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/34539552197
Dispatched at this checkpoint; successful compilation/IPA packaging remain pending.
Inspect this replacement run next, not the failed run. Device test protocol below
is unchanged and should only be used after the replacement build succeeds.

## Radial Pencil tools — latest implementation checkpoint

User requested a radial palette and authorized continuing implementation. **34fd27e**
is pushed on codex/ipad-secondary-view-escape. Build:
https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/34537653252
At writing: CI preflight passed, iOS build running. Inspect this exact run next;
fix actual compiler errors if any, and do not rebuild unchanged code.

Prior native Files build **34514560095 / 4eeb43d succeeded**. Device import behavior
is still unverified. The old black-screen report is resolved; do not reopen it.

Radial source changes through overlay:

* GHOST_WindowIOS tracks recent Pencil cursor moves; double tap sends dedicated
  GHOST_kEventPencilDoubleTap without synthesizing mouse/keyboard buttons. Squeeze
  retains its prior context-click path. Existing stroke/drag/Ignore guards retained.
* GHOST_Types, wm_event_types, wm_event_system and rna_wm expose PENCIL_DOUBLE_TAP
  as touch event 0x0205. Default Screen keymap invokes wm.ipad_tool_palette with
  any modifiers, so connected keyboard modifiers do not block this Pencil action.
* Python operator selects viewport under cursor, current viewport, or largest view
  as fallback, then invokes actual Blender pie. Menu queries current tools; core
  slots stay in stable directions and are disabled when absent in current mode.
* Pie uses tap-to-select even when invoked by a discrete Pencil event or search;
  iPad-only menu flag implements repeat-double-tap and outside-bounds dismissal.
  Center is clamped away from viewport edges; existing window-edge correction
  remains in use. No desktop shortcut was reused or reassigned.
* Header Tools is the touch fallback. Old Canvas tool grid removed, remaining
  controls labeled Workspace. Pie More Tools and Hide/Show Shelf retain full access.
  No automatic tool-shelf hiding or saved-layout rewriting was added.

Evidence: six preflight checker tests pass; complete overlay applies to 27 pinned
files. Python/plist/shell checks pass. Actual host Blender **5.1.2** preview displays
the shipped Python menu and invokes its wrapper operator. Core Select/Move/Rotate/
Scale activate successfully in both Object and Edit Mesh modes. Preview caught
truncated labels; fixed with consistent widths and reran successfully. Screenshots
and JSON evidence in output/ui-preview/pencil-tools-*. Target Blender is pinned 5.0.
Host binary does not contain new GHOST events or pie C++ handling: no native gesture,
clamping, repeat-tap, outside-click or iPad acceptance is claimed from this preview.
Reproduce: `D:/Program Files/blender.exe --factory-startup --disable-autoexec --python build/preview_pencil_tools.py`.

Device protocol after build success (no app/data deletion):

1. Hover Pencil over cube, double tap. Choose Move, move cube, Undo, then double
   tap > Select. Repeat in Edit Mesh. Expect one palette with readable tool labels.
2. Close palette, squeeze: expect the existing context menu, not the tool palette.
3. Double tap with palette open: close only. Tap clearly beyond palette: close
   without selecting/moving geometry. Escape closes it with keyboard attached.
4. Repeat at four viewport corners and after rotation. Tools stay on-screen. With
   no Pencil, header Tools opens the same palette. More Tools and Hide/Show Shelf
   must retain a way to select every tool and restore the shelf.
5. During an active Pencil stroke/drag try double tap/squeeze: no tool switch,
   context menu or stuck stroke. Check iPadOS Ignore and keyboard/mouse still work.

Outstanding: device sizing/edge behavior, alternate keyconfigs (default binding is
implemented), stale cursor placement after rotation, mode-specific radial tools
outside Object/Edit Mesh, persistent active-tool indicator and final edge placement.
Squeeze while a pie is open follows ordinary right-click cancellation; reopening
context requires another squeeze. No intentionally partial tracked functions.
After this build/interaction gate, continue Scene/Inspector drawers for camera
blocking, per IPAD_WORKSPACE.md. Do not restart design or grow Workspace popover.

## Latest user design direction — next session priority

Read `docs/IPAD_WORKSPACE.md` and root `AGENTS.md` before proceeding. User rejects
Canvas popover's placement/role and wants tangible redesign progress next session.
Approved mapping: **Pencil double tap = tool palette; squeeze = context/right click**.
Current code still maps both to context click. No gesture code changed in this
design update. The next UI implementation is milestone 1 in IPAD_WORKSPACE.md;
its acceptance criteria and broader workspace design are recorded there.
Do not spend the next entire session extending Files or writing another roadmap.
First inspect the pending native-import build for failures, then implement the
Pencil tool palette while preserving existing input. Broader drawer/layout designs
are proposed defaults, not user-approved placements or delivered features.

## Native project import checkpoint — latest

User explicitly clarified the black screen was already fixed. Do not ask them to
retest that old regression. The earlier ambiguous-build note below is superseded.

Implemented and pushed **4eeb43d**, `feat(ipad): import project copies through native Files picker`.
Build: https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/34514560095
At checkpoint: CI preflight passed; iOS build running. No device acceptance yet.

Delivered source behavior:

* File menu, File context menu and Canvas expose **Import Project from Files**.
  It is deliberately an independent copy, not external-document Open/Save support.
* UIKit `initForOpeningContentTypes:asCopy:YES` selects one `.blend`. A worker
  coordinates the actual copy into visible `Documents/Projects/<name - UUID>/<name>.blend`.
  Balanced security scope; no long-lived bookmark is needed for this import mode.
* Normal GHOST open-file event invokes Blender's existing unsaved-changes handling.
  Ordinary Save subsequently updates this local copy. External original is untouched.
* Imported/native-open events disable scripts and retain the current UI layout.
  Advanced Open still has the existing options. Pack assets into the source project:
  importing one file does NOT bring sibling textures, libraries or other dependencies.
* Picker Cancel/swipe dismissal and copy Cancel are handled. Generation checks reject
  late completions; canceled completed copies are removed. No Blender operator or
  bContext pointer is retained across UIKit. Presenter must still be the live active
  workspace before posting the open event. Failure to open leaves the local copy.
* Native importer delegate is application-lifetime by design (UIKit delegate is non-owning).
  Objective-C manual memory management is preserved. Copy I/O is off the main thread.

Modified upstream systems via `patches/blender-ipad.patch`: new GHOST_ProjectImport-api.hh
and GHOST_ProjectImportIOS.hh (included by GHOST_SystemIOS.mm), UniformTypeIdentifiers
framework link, wm_files.cc/.hh operator, wm_operators.cc registration, wm_window.cc
native-open defaults, space_topbar.py and space_view3d_ipad.py entry points.

Validation: all six existing preflight tests pass; complete overlay applies to 19
pinned source files; plist and Python/shell syntax checks pass. These are source
checks, not UIKit behavior or successful compilation. Full iOS build above is the
next gate. No native Files device tests, simulator tests or preview acceptance claimed.

Next session: inspect that exact build, fix compilation errors if any, and do not
rebuild unchanged source. On success ask for this short device protocol:

1. Canvas > Import Project from Files, Cancel; repeat twice. Workspace remains usable.
2. Import a small packed `.blend` from On My iPad, then one from iCloud Drive.
   Verify current scene's unsaved-changes prompt works (test Cancel and Discard).
3. Move an object, Save Project. Find the copy in Files > On My iPad > Blender iPad
   > Projects, reopen it and confirm the edit. Verify the original did not change.
4. Import the same filename twice: both copies survive. Cancel a larger import and
   immediately start another; the canceled project must never open later.
5. Repeat picker Cancel in portrait and landscape, and test swipe dismissal if offered.

Known limits: only `.blend` copy import, not generic asset import/export, project-folder
grants, coordinated external Save/Save As, incoming app URL repair or share sheet.
Native provider download UI, cancellation timing, memory/lifetime, low-storage failure
and big-file performance remain device-unverified. The next Files increment should
handle project-folder dependencies and real external document ownership, not disguise
copy import as native Save As. Secondary-window flicker fix still needs device evidence.
No intentionally partial tracked implementation. At checkpoint usage was 94% consumed;
preserve this state before further architecture work. Actual checkout is under blendpad.

## Latest scheduled follow-up — supersedes status entries below

Read [PRODUCT_DIRECTION.md](PRODUCT_DIRECTION.md) for the durable product goal and
design decisions. Earlier sections below preserve investigation history.

**Device evidence:** build 7451cf1 / run 34472852514 compiled and packaged. User
confirms startup now works and Preferences/other secondary views have a working
Close View footer. Touching these views causes flicker, especially import/export
selectors. Native Files and stronger tablet adaptation remain explicit priorities.
Do not infer full input/restoration/performance acceptance from this feedback.

**Current repair code: 1d8e6a7**, branch codex/ipad-secondary-view-escape, pushed.
Build: [34507393057](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/34507393057).
Run 34507393057 is confirmed successful: preflight and iOS build jobs passed,
and the Blender-iPad-Unofficial-ipa artifact is available (248336007 bytes).
Device acceptance of this repair remains pending. The latest conversation reports
a black launch without identifying the installed run; confirm build identity before
treating this as either the known earlier regression or a new regression in 1d8e6a7.
The real checkout remains under Repos/blendpad, as below.

Changed iOS source through the overlay:

* GHOST_ContextIOS::metalUpdateFramebuffer now uses MTKView.drawableSize instead
  of UIScreen bounds. Native chrome reduced content height but GPU backing textures
  still used the whole screen. This is a concrete mismatch; whether it explains
  all flicker remains unproven. Preserve old texture on transient zero-size layout.
* GHOST_WindowIOS controller changes content/footer frames only when they differ;
  touch/highlight layout passes must not repeatedly resize the Metal drawable.
* GHOST_SystemIOS ignores a draw callback from another view while a different
  window is active. Presentation must use the active view's own drawable callback.

Explicit initializeMetalRenderer from the startup repair is preserved. Six existing
preflight tests pass; the overlay applies to 13 pinned files and Python/plist/shell
syntax checks pass. No native SDK/simulator or iPad is available on this Windows host.
No native document prototype was merged. No intentionally partial tracked code.

**Device protocol after repair build succeeds:** launch/orbit, open Preferences,
tap and scroll for 20 seconds, then Close View. Repeat with Open, Save As, one import
and export selector; cancel each and reopen immediately. Rotate an open secondary
view and tap its top/bottom fields: watch for flicker, stretching, gray strips or
offset input. Repeat open/close ten times and relaunch once. If flicker persists,
report whether content, footer or individual controls blink; a short recording/log
would distinguish layout from partial-redraw/swapchain issues.

**Next autonomous step:** inspect that exact build and fix any compile failure.
Do not rebuild unchanged code while waiting for device feedback. Then implement
native Files selection tied to WM_event_add_fileselect/wm_handler_fileselect_do,
following PRODUCT_DIRECTION.md. Preserve advanced browser/options. The old scratch
prototype's coordinated-path-copy is not coordinated Blender I/O, and its local
copy/export workflow does not satisfy ordinary external Save semantics.

If flicker remains, inspect partial-redraw preservation across the Metal swapchain
and the static prevDrawable/current_drawable_presented shared across contexts.
Do not assume that the corrected size mismatch was the only cause.

## P0 device regression — startup black screen

User installed successful build 34470580555 (code 9e0995c) on iPad and reports
completely black startup. **That build fails hardware acceptance.** Earlier
pending-build statements below are historical. Suspend the broad test protocol.

Likely cause found in renderer lifecycle: controller assigns self.view during
init, but constructor now relied on loadViewIfNeeded to run viewDidLoad. Metal
delegate initialization can be skipped; drawInMTKView drives WM_main_loop_body,
so missing delegate prevents Blender's UI/main loop from running at all.
Repair separates initializeMetalRenderer from viewDidLoad, explicitly invokes it
from the GHOST constructor, and guards against double setup. A debug assertion
checks delegate installation. This restores explicit startup initialization while
retaining native footer/input fixes. Source-validated only until repair CI/device
results are recorded; root cause is not yet confirmed on hardware.

Repair acceptance: install the repair IPA without deleting the app/data; launch
and verify the workspace appears, orbit the cube, then open/close Preferences
once. Force-quit and relaunch three times. Only resume broader tests if this passes.
If still black, obtain startup device logs and isolate the remaining view ownership
changes against de0058c; do not continue tablet features on a broken startup.

## Resume here — final checkpoint

Branch: `codex/ipad-secondary-view-escape`, pushed to origin. Final **code** commit:
`9e0995c` (subsequent handoff-only commits do not change the IPA source).
Final iOS build: [34470580555](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/34470580555).
At handoff this run is pending/in progress; **no successful iOS compilation or IPA
packaging is claimed for the new changes**. Earlier session build attempts were
superseded during source review, not accepted validation. No new iPad tests ran.

Next session: inspect that exact run first. If failed, retrieve `gh run view
34470580555 --repo Trentonom0r3/blender-ipad-unofficial --log-failed`, fix the actual
failure, preflight and rebuild. If successful, give the user that run's IPA artifact
and the device protocol below, clearly identifying code commit 9e0995c. Prioritize
Preferences and file-selector close/reopen, render result return, fullscreen Back,
and mouse press/release across window transitions. Do not claim all P0 window
behavior solved without these tests. Then continue native Files implementation,
using the prototype review discoveries below rather than blindly merging staging.

All implementation in this branch is complete at source level; no intentionally
half-written function or feature flag remains. Six existing preflight tests and
patch/Python/plist/shell checks pass. Pending iOS compile, UIKit behavior, input
behavior and resource-lifetime testing are the material uncertainties. Session
budget was 86% used at the final check, so no larger Files refactor was started.

## Checkout and starting evidence

The Codex-opened `D:/dev/Projects/Repos/blender-ipad-unofficial` folder is an old
scratch/staging directory with an incomplete `.git` (refs only). **The real overlay
checkout is `D:/dev/Projects/Repos/blendpad/blender-ipad-unofficial`.** Starting HEAD:
`de0058cfbad1822360d943769af3ae830d585f70`, clean `main`, tracking `origin/main`.
Always give gh `--repo Trentonom0r3/blender-ipad-unofficial`: its default resolved
to the upstream fork and initially returned unrelated old runs.

Reviewed latest four commits, TABLET_UX, DEV_NOTES (including its superseding §13),
patch, plist, packaging/preflight, preview scripts/readme/logs, pinned GHOST,
window manager, screen, render and file-selector source. No AGENTS.md found.

* `de0058c`: Canvas header moved first; finger pan emits scrolling only; host UI
  preview and prototype gizmo dock. Actions build/packaging succeeded, run
  [34450921559](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/34450921559).
* `1aab05a`: select correct iOS bundle for packaging; Python module packaging check.
* `f3b0720`: Canvas popover, Pencil squeeze availability fix; successful IPA run.
* `2c62ce6`: input, accessible recovery, preflight/cache work; its first iOS compile
  failed and was subsequently fixed. Do not infer failures persist from old notes.
* DEV_NOTES §13 reports earlier actual iPad validation of keyboard shortcuts,
  indirect-pointer box selection/orbit/pan, Pencil starts, and render-window close.
  This is historical evidence, not device validation of today's revision.
* Latest device feedback recorded in TABLET_UX: Canvas was hidden; one-finger
  scrolling needed correction; loading slowdown remains unexplained. Latest
  corrections have build evidence but no recorded device acceptance.
* `output/ui-preview/concept-*.png` are generated concepts. Windows screenshots are
  Blender 5.1.2 host UI evidence; target is pinned Blender 5.0.0. Persistent dock is
  **preview only**. Preserve Canvas First; do not replace it with a new design.
* Native document service in the **scratch `staged` patch** is **not in HEAD**.
  Treat it as an uncompiled prototype for review, not implementation to copy blindly.
  Actual patch only adds Documents/Recovery. Existing plist enables Files exposure
  and incoming `.blend` URLs; no native open/save/import/export pickers yet.

## Implemented: secondary-view escape and input lifetime

Overlay changes in `GHOST_WindowIOS.mm` and `GHOST_SystemIOS.mm`:

* Secondary UIWindows (including parentless render/duplicate windows) reserve a
  native footer with window title and a 120-by-48-point **Close View** button.
  Footer accounts for bottom safe area. Content stays at origin (0,0), with smaller
  height; GHOST gestures/Metal use the content view, not the container. No Blender
  controls are covered. The main workspace has no footer.
* Button enqueues normal `GHOST_kEventWindowClose`; no direct UIKit dismissal or
  forced screen edits. Resolve the live owner from MTKView before queuing. Existing
  `wm_window_close` cleans handlers, editor state, jobs and GHOST events. Parentless
  return/hide fix is preserved; parent is checked for liveness before dereference.
* First live GHOST window is protected from the shortcut. Escape consumes press,
  repeats and release for a closing gesture, so holding it cannot cascade through
  windows or send a stray key-up to the workspace. Disconnect clears that state.
* GameController callbacks no longer capture an auxiliary C++ window/unsafe UIKit
  owner. Resolve active window and its input state per callback. Mouse scroll and
  fallback motion now target that same live view. Install handlers on activation
  for already-connected devices. Reconnect/held-modifier behavior needs device QA.
* Remove redundant native retains; pair content ownership explicitly. Controller
  initializes renderer through `loadViewIfNeeded` instead of manually invoking
  `viewDidLoad`; releases renderer on deallocation. Remove closing UIWindow's
  notification observers. Initialize previously unset `is_dialog_`.
* Drawable-size callback targets the resized MTKView's actual owner; initialization
  of an inactive auxiliary view must not resize the currently active workspace.

Decision: retain the current one-active-Metal-view model for this reversible P0
repair. Merely setting `modalPresentationStyle` on a root controller never presents
an actual sheet. True simultaneous floating Blender editors need rendering/context
work; do not mistake today's footer for that completed architecture.
[UIKit safe areas](https://developer.apple.com/documentation/uikit/uiview/safearealayoutguide)
keep native chrome clear of system insets. Code uses MRC, not ARC; avoid `__weak`.

## Window audit and remaining priorities

| Context | Existing lifecycle / present status |
| --- | --- |
| Preferences, auxiliary editor, duplicate window | GHOST secondary window; new native Close View and guarded Escape |
| Render result in separate window | Often no parent; new footer, preserved remaining-window activation/hide |
| File Browser in new window | Close routes through window/editor cleanup; must validate selector cancellation and reopening |
| File Browser in maximized existing area | Existing Cancel control / selector lifecycle; native footer does not cover this state |
| Canvas Expand / normal maximization | Existing reversible operator and Canvas Restore Editors; host restoration evidence only |
| Fullscreen area with hidden headers | Existing tiny hover-revealed corner exit; persistent enlarged Back target now implemented; needs iOS validation |
| Blender popover, confirmation, operator dialog | Same-window modal handler; own Cancel/outside/Escape semantics, not a GHOST secondary window |
| Native onscreen keyboard | Existing accessory Done/Cancel; verify while closing a secondary view |

Highest next steps:
1. Compile and package this revision; fix any UIKit/compiler failure before device handoff.
2. Validate new fullscreen Back control. `editors/screen/area.cc` now draws a
   persistent labelled Back button (4.8 by 2.4 widget units, inset from the corner),
   and `screen_ops.cc` tests the same full rectangle on the first tap. No hover
   fade or ongoing animation invalidation on iOS. Existing fullscreen action-zone
   operator still owns restoration. Desktop behavior is unchanged.
3. Implement native document service after auditing scratch prototype ownership,
   cancellation, security scopes, deferred asset reads, file-provider coordination,
   bookmarks, and distinction between local working copy vs external saved file.
   Preserve Blender selector handler and importer/exporter options.
4. Finish recovery accessibility (Recover Last Session still uses quit.blend in
   temporary storage), then Canvas/Pencil refinement based on device results.

## Validation and reproduction

Current new code: **source validation only until CI result is recorded below**.
Windows has no Xcode/UIKit SDK, simulator or attached iPad. No new device, Pencil,
performance, thermal, memory or battery validation. Existing six preflight unit
tests pass; full patch applies to pinned source; Python/plist/shell syntax pass.

Commands (run in real checkout):
```
python -m unittest discover -s build -p test_preflight.py -v
python build/preflight.py --cache-dir D:/dev/Projects/Repos/blender-ipad-unofficial/.preflight-cache --offline
```
Scratch materialized sources are `.cache/window-work` (own git init, ignored).
Important: `git apply` from a subdirectory of the overlay repo can silently skip
paths; initialize an isolated scratch repo or apply outside the repo. Preflight
already uses an external temporary directory and is not affected. Scratch helper
scripts are not required by the build; authoritative source is the overlay patch.

### M5 iPad / Pencil Pro test protocol (after a successful new IPA)

Use a disposable scene with a moved cube, a second camera, and a non-default split
layout. Record the IPA's commit/run, orientation, and attached input devices.

1. With keyboard detached, open Preferences and tap **Close View** with a finger.
   Repeat 10 times, then 10 with Pencil. Verify the original scene, selected object,
   active camera and editor splits survive, and selection/navigation still work.
2. Rotate Preferences portrait/landscape before closing. Tap controls near the top
   and bottom of the Blender content. Verify no vertical offset or covered controls;
   footer remains above the home indicator. Repeat with onscreen keyboard visible.
3. Open File > Open, cancel with Close View, then repeat with Save As and one import
   and export selector. Reopen each immediately. No unintended file write, stuck
   operator, missing confirmation, lost scene edit, or blocked second selector.
4. Set Render display to New Window. Render the default cube, close its result,
   render again, close again. Repeat while render is running; record cancellation
   behavior. Main workspace must return instead of a frozen result window.
5. Open a second Blender window/area window, then Preferences from it. Close the
   innermost view and verify return to its parent, then close the outer window.
6. Attach keyboard with Preferences open. Hold Escape for two seconds, release:
   only that view closes. In workspace, G then Escape still cancels the transform.
   Disconnect/reconnect while Escape/Shift is held; check subsequent normal keys.
7. With mouse/trackpad, scroll Preferences, close it, middle-drag orbit and
   Shift-middle-drag pan in workspace. Repeat after reconnecting in Preferences.
   Click the native footer: watch for an unintended Blender click before closing.
8. Open a project and repeat 20 secondary-view cycles. Report crashes, stale UI,
   growing memory (if measurable), loss of Pencil pressure or navigation. Do not
   certify this by a Windows screenshot.

Native footer pointer hover now suppresses GameController button-down/wheel
forwarding, with matched releases for Blender drags; verify on device that footer
clicks cannot edit the last Blender cursor location. Known unresolved risks: fullscreen Back artwork/hit targets need device validation;
Escape currently closes a secondary window even if an inner Blender popup is open
(inherited semantics); native Files and provider-safe saving remain unimplemented.
No staged native-document prototype was merged in this pass.


### Fullscreen follow-up acceptance

In a disposable split layout, use the editor View > Area > Toggle Fullscreen Area
command (the variant that hides headers). With Pencil out of hover range, verify
**Back** is visible at the upper right immediately. Tap once with a finger; verify
exact original splits return. Repeat in Properties, Image Editor, Shader Editor,
Sculpt and Grease Pencil, portrait and landscape, at default and smaller UI scales.
Repeat ten times. Tap near all four edges of Back: entire background should work.
Move Pencil elsewhere: Back must remain visible. Check ordinary Canvas Expand /
Restore still works and no new control appears on a normal desktop build.

Initial native-footer build: `b76365e`, Actions run 34468971151. Fullscreen change
is a separate checkpoint and needs a subsequent build containing both changes.


### Final source-review follow-up

* A pointer-only hover recognizer on the native footer suppresses GameController
  button-down and wheel delivery to Blender while using that footer. Releases
  still finish an already-started Blender drag; unmatched releases are ignored.
* Activating a surviving secondary window after explicitly closing the original
  workspace hides its footer if it is now the first live window. No inert Close
  View control should remain on the sole workspace.
* `filesel.cc: ED_fileselect_exit` sends EVT_FILESELECT_EXTERNAL_CANCEL when the
  File Browser window is closed, then clears `sfile->op`. This confirms source
  ownership for the new native close route; repeated cancellation needs device QA.
* [GameController handlerQueue](https://developer.apple.com/documentation/gamecontroller/gcdevice/handlerqueue)
  defaults to the main queue. The port does not override it; active-window lookup
  and UIKit teardown remain on that queue.
* Scratch native-document prototype review found that NSFileCoordinator protects
  only copying the URL path, not Blender's later read. Do not call that coordinated
  file access. Review interactive dismissal/delegate completion and security-scope
  limits too before promoting it. No native-document code was added to the patch.


### Input ownership correction

Mouse button release now visits live windows and releases whichever view recorded
that button-down. Opening a secondary view on mouse-down must not leave the original
view's drag flag stuck or release a button that the new view never received. Closed
windows are absent from that lookup; their events are removed by GHOST disposal.
Shift state is sampled from both physical Shift keys on activation and key changes,
so holding it while switching views preserves pan rather than unexpectedly orbiting.
Device regression: open Preferences with the mouse, close it, move without pressing
anything (no drag); hold Shift while closing Preferences, then middle-drag (pan).
Also press both Shift keys, release one, then middle-drag: pan should remain active.

Build 34469863293 targets 8a2e12e (before this input ownership correction). A final
build of the newer checkpoint is required even if that earlier build succeeds.
