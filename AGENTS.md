# Blender iPad development

## Direct Extrude interaction — completed source candidate, 2026-10-03

The current source enables direct finger/Pencil Extrude Region drags in Edit Mesh, with a short active-tool "drag selection, lift to finish" cue. The approved nine-tool ring, Inspector, native editors, hardware input, Fine/Numbers/selection controls and Files work are preserved. Initial cancellation restores independent native BMesh snapshots after the transform child releases its data. Cancelling a redo-handle adjustment restores the already accepted extrusion through native Redo after operator, gizmo and handled-event teardown, before another queued input; dispatch returns immediately after consumed recovery. Success retains native operator/Undo registration. Source patch SHA-256 `a1d16b0a298476fe7b2d7c1463dfe052173b1d431dcd41f8ffe9cc4c577bdd97`.

Runtime Undo lifetime IDs plus mutation generations protect accepted/baseline steps, including skipped steps and failed pushes. Registered-operator identity stays outside DNA and is erased before destruction; gizmo allocation/binding IDs reject same-address replacement. Claims are tri-state and reject before geometry. Snapshot rejection is null-safe and unexpected context-free destruction only discards. Recovery resolves live WM/window/scene/screen/area/region, view layer, native tool and active edit owner; native Mesh Undo refs resolve every encoded owner and data UID through the current Main, including secondary objects. PRE callbacks are revalidated before decode; POST callbacks cannot leave stale viewport pointers or silently change the completed history.

Touch redo admission checks other modal owners before popping Undo. Guarded pop uses the exact accepted step after UNDO_PRE instead of retaining native name-lookup pointers. The bounded adjustment accepts Mesh traversal only when its preceding MemFile is already active, and its scene/active owner/all participating objects still match; a path which could reload Main or a changed context is refused before pop. Preserve this guard until cross-mode recovery has separate proof. Do not replace it with generic unguarded ED_undo_pop_op or restore by assigning step_active.

All 69 host tests and 83-file pinned-source preflight pass for this candidate, including compiled shipped transaction, macro terminal/invoke, receipts, callback/context/history mutation, implicit MemFile, all-owner and allocator-reuse checks. Stock host Blender 5.1.2 validates native BMesh-copy data and accepted-step Redo plus subsequent Undo/Redo geometry with explicit headless checkpoints and modeled provisional rollback. It does not execute the new native modal/gizmo lifecycle. Native Release build and downloaded exact-source IPA verification are still pending; latest verified IPA remains Fine run 37071311608 at 333c525. There is no device acceptance or visual preview for this increment.

Continue the full goal independently. Prioritize actual interaction; import expansion remains deferred. Build the exact completed source once, fix real native failures and verify its downloaded IPA before calling it ready. Device checks remain selected face → native Extrude tool → finger/Pencil drag → lift → one-step Undo/Redo; initial interruption and accepted edit → redo handle → Cancel must preserve geometry/history, including multi-object meshes, shape keys and Pencil menu/input handoff. Then audit the next native modeling-tool gesture and touch feedback without redesigning the accepted ring. Earlier gated-foundation sections are historical and superseded by this completed source candidate.

## Verified Fine Drag IPA — 2026-10-02

Exact-source [iOS run 37071311608](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/37071311608) at `333c5257c6e42b7d633657cf4196d8a7f2c5fdb5` passed cloud preflight, native Release compilation, packaging and upload. Artifact `Blender-iPad-Unofficial-ipa` id `11255996019` has GitHub archive size 248,466,532 bytes, digest `sha256:5d37bef14ca2386c620245b86411d9f4a2ae8519f698d19d363c30d2ab3999c8`, and expires 2026-12-31T22:13:28Z. Downloaded IPA is 248,466,364 bytes, SHA-256 `18e6c2438c60c9952b76d28c3b570cf984fc8f88d9531231bbef93aff9e491e9`. Full CRC across 3,368 entries, arm64 iPhoneOS bundle/Mach-O, startup resources and preserved Files/library/recovery markers pass. Entire packaged interaction Python matches this exact source, including Fine Drag and its active-header suffix. All 57 host tests and 66-file preflight passed before dispatch; real host Blender verified Fine RNA/control alongside native transform/selection geometry wiring. This is source/host and package evidence; there is no visual preview, automatic device Undo proof or iPad acceptance for this increment.

Choose Move/Rotate/Scale/Transform, tap its header control, and toggle Fine Drag for deliberate canvas and native gizmo drags. It uses native use_accurate gain (Move/Scale about one tenth, Rotate one thirtieth); physical Shift retains native modifier and snap-increment ownership. Fine Drag does not promise finer snapping. Explicit gizmo bases/keymap properties retain precedence, including the view-facing rotation ring. A hidden SKIP_SAVE invocation marker preserves configured gain through Shift release, mode changes and navigation; native use_accurate RNA/cache registration stays unchanged. Numbers remains exact and transient. Preserve accepted Pencil ring/mappings, Inspector, native editors, hardware input and existing Files work; actual interaction remains the priority and import expansion is deferred.

Continue independently toward the full iPad outcome. Focused device checks remain select → constrained/fine drag or Numbers → finish/Cancel → automatic one-step Undo/Redo, orientation agreement, split/portrait fit and overlapping touch/external input. The goal is not complete. Continuation is scheduled near the October 3 02:46 UTC five-hour reset at 9:50 PM America/Chicago; recheck limits rather than assume old usage. Do not consume the free reset credit without a user request. Earlier candidate/package sections are historical.

## Local Extrude rollback foundation — admission gated, 2026-10-02

Uncommitted patches/blender-ipad.patch plus build/test_touch_extrude.py and the preflight CI step form a later local source candidate. Patch SHA-256 `8e96bfe0b489e0d5085191a40077cb12cfe9bcbe38c7529c396839cb09007af4`. It has 63 host tests and 74-file pinned-source preflight, with no native build or device evidence. Preserve it and audit the actual diff before editing; it is not contained in the verified Fine IPA. New direct Extrude admission is deliberately disabled and a compiled regression enforces that gate; the existing native tool/input paths remain.

The foundation adds cursor DIRECT_TOOL provenance (ordinary constructors default false), preserves only that flag when batched moves become INBETWEEN_MOUSEMOVE, and owns independent native BMesh snapshots in MacroData for direct MESH_OT_extrude_context_move invocations. It snapshots selected unique Mesh owners before geometry, rejects locked participating shape keys, restores only live session-UID/edit-mesh/BMesh/Key/shapenr matches after the child frees TransData, and bypasses macro prior-FINISHED conversion only for its transaction. Success frees snapshots; context-free operator destruction discards them without touching geometry. Tests compile the shipped transaction/terminal code, covering multi-owner sharing, geometry/selection/custom-data models, cancel/success, owner/key/shape replacement, context-free free and batched threshold crossing. Native BM_mesh_copy source preserves all CD_MASK_BMESH layouts, element data, selection history, active face and shape identity; real iPad shapes remain unverified.

Independent review found a real redo-adjust gap: wm_gizmo_group.cc423–434 calls ED_undo_pop_op before invoking an is_redo handle, so the current invoke snapshot represents geometry before the already accepted extrusion. Cancelling would remove that accepted edit instead of returning to it. Do not enable admission or dispatch this candidate unchanged. Next work must distinguish initial strokes from redo adjustment and preserve the accepted geometry/Undo state through redo cancellation (or prove a safe exclusion of redo handles from new capture). Do not merely skip the transaction if native cancellation loses the prior displacement. Audit the native redo/exec lifetime, then add meaningful regressions, exact-source native compilation and downloaded IPA checks. Import/Portable Project Copy expansion stays deferred.

The local candidate now also adds runtime-only ipad_lifetime_id to UndoStack/UndoStep under WITH_APPLE_CROSSPLATFORM, using an atomic monotonic allocator for stack creation and both step-allocation paths. The initialized-step path keeps its original identity when encoded/pushed. UndoStep retains next/prev as its first members for native ListBase ABI; compiled offsetof checks and 10,000 initialized/reused-address identity cases pass. All 63 host tests and 74-file pinned-source preflight pass. These identities are a prerequisite for a recovery receipt; no deferred receipt/callback or direct Extrude admission is enabled, and the new code has no native build. Audit remaining allocation/clone paths before using the identities. Preserve both host validators and their JSON reports along with the source/tests.

## Verified touch transform controls IPA — 2026-10-02

Exact-source [iOS run 37003547524](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/37003547524) at `648e4c8f2c8e0f298a307d4ac03f6438fe8bbfed` passed cloud preflight, native Release compilation, packaging and upload. Artifact `Blender-iPad-Unofficial-ipa` id `11225204049` has GitHub archive size 248,462,257 bytes, digest `sha256:8a042386dd0a32bdd5c28a38d2e784fc40ba47f99970d771c95c931467b9246e`, and expires 2026-12-31T11:53:51Z. Downloaded IPA is 248,462,089 bytes, SHA-256 `f2119d1236ab79195a4965928022af4e6230409b47c72fa417a6df6356a4176d`. Full ZIP CRC across 3,368 entries, arm64 iPhoneOS bundle/Mach-O metadata, startup resources and preserved Files/library/recovery markers pass. The entire packaged interaction Python matches this exact source, including header Transform access, axis/plane constraints, snapping options and transient numeric dialogs. All 55 host tests and 64-file pinned-source preflight passed. Host Blender 5.1.2 verified actual native geometry, orientation/pivot semantics, guarded cancellation and Undo/Redo with explicit headless checkpoints. These are source/host and package checks; there is no host visual preview, automatic device Undo proof or iPad acceptance for this increment.

Choose Move/Rotate/Scale/Transform through the unchanged Pencil tools, then tap its active header button for Free/X/Y/Z, Move/Scale planes, native orientation/pivot/Snap and Numbers. Combined Transform also exposes its canvas drag action. Numbers applies a precise vector, axis/angle or factors only on OK, independently of drag constraints, and does not leave offsets in later drags. Generic tool drags now resolve the native per-tool orientation, while shortcuts and actual gizmo handles keep native behavior. Independent property copies preserve explicit release-confirm settings. Numeric dialogs reject changed originating viewport, selections/components/bones, observed basis/pivot or frame; nullable GP frames and unsupported text-edit mode are guarded.

Preserve accepted squeeze/double-tap, Inspector, native editors, hardware input and existing Files work. Continue actual interaction independently; import/Portable Project Copy expansion stays deferred. Focused device acceptance remains select → constrain/drag or Numbers → finish/Cancel → automatic one-step Undo/Redo; orientation agreement between canvas and gizmos; popover fit in portrait/landscape and split views; and two-finger navigation with panels open. Next source work should audit native touch precision/edit feedback before expanding chrome: do not simulate held Shift or scale UIKit coordinates. Full first-class iPad goal remains incomplete. Earlier source-candidate/package sections are historical. Continuation is scheduled for October 6 at 10:35 PM America/Chicago (October 7 03:35 UTC), near the weekly reset at 03:32 UTC; weekly usage was 98%. Recheck limits and adjust the following heartbeat after reset.

## Verified touch point-selection IPA — 2026-10-02

Exact-source [iOS run 36988063800](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/36988063800) at `455a5d14245d6acfeaa3e1eee323adae62e98da6` passed cloud preflight, native Release compilation, packaging and upload. Artifact `Blender-iPad-Unofficial-ipa` id `11218339205` has GitHub archive size 248,458,093 bytes, digest `sha256:3091138777755ec48c5f1a36208da0562549a3eb0a957a05c7f1d96aeca9da6c`, and expires 2026-12-31 09:08:30 UTC. The downloaded IPA is 248,457,925 bytes, SHA-256 `1e5e86d3605d3873cdcfa38fc1ef49cb0e2a73dbcb1d4b47c0ee90e65d3ffa9a`. Full ZIP CRC across 3,368 entries, arm64 iPhoneOS bundle/Mach-O metadata, startup resources and preserved Files/library/recovery markers pass. Packaged interaction Python matches the exact source. All 52 host tests, 62-file pinned-source preflight and real host Blender UI/tool checks passed. There is no iPad device acceptance or host visual preview for this increment.

Replace/Add/Remove now applies to unmodified individual finger/Pencil taps as well as Box/Lasso drags. Empty Add/Remove retains selection; deliberate selection taps keep open panels and split geometry stable. Native hardware clicks, modifiers, advanced shape modes and other tool taps retain their paths. Pending one-finger taps/pans interrupted by hardware-down or a Pencil popup stay inert through UIKit reset, including a hardware-up before touch lift; idle interruptions allow fresh touch. Source policy tests and packaging do not prove UIKit scheduling or device comfort.

Next source work is native axis/orientation/pivot/snapping and transient numeric transforms, using the audited child-property and orientation-slot seams in TOUCH_EDITING_NEXT.md. Preserve accepted Pencil mappings/ring, Inspector, native editors, external input and existing Files work; defer import/Portable Project Copy expansion. Continue independently without waiting for device feedback. Focused acceptance is point/shape Add/Remove and empty picks, mesh target choices, Undo, stable open panels and overlapping touch/mouse streams. Earlier candidate sections below are historical. Continuation remains scheduled near the 11:22 UTC five-hour reset.

## Direct point selection — reviewed source candidate, 2026-10-02

The next interaction candidate extends the quick Replace/Add/Remove choices to individual unmodified finger/Pencil taps with native Box/Lasso active, including empty Add/Remove retaining the existing selection. A per-window exposed-canvas selection snapshot gives navigation/resize/covered UI first priority and excludes transform-tool taps, other tools, flythrough and hardware clicks. Native point-pick flags and operators retain active-target/edit-mode/Undo semantics. Unsupported native shape operations and keyboard modifiers follow their existing path. Deliberate Box/Lasso taps now keep panels and split geometry stable just like their direct drags, rather than spending the first tap solely dismissing/rehosting panels; other ordinary tap dismissal stays unchanged.

Recognizers reject new touch input during hardware ownership and retain a pending stream's interruption through UIKit reset. Hardware-down or an allowed Pencil popup invalidates pending one-finger taps/pans even before recognition, so a later hardware-up cannot readmit the old finger lift. An idle interruption does not poison a fresh touch. Independent source review passes; compiled mapping/admission/occlusion checks, all 52 host tests, 62-file pinned-source preflight and preserved real host Blender controls pass. These checks validate source policy and Python wiring, not UIKit scheduling or iPad comfort. This candidate still needs its exact native build and downloaded IPA verification; latest verified package remains run 36984752140 at 8dad728.

Continue independently without waiting for device input, preserving accepted Pencil mappings/ring, Inspector, native editors and external input. Next actual interaction increment remains native axis/orientation/pivot/snapping and transient numeric transforms from TOUCH_EDITING_NEXT.md. Keep import/Portable Project Copy expansion deferred. Device checks remain direct point/shape Add/Remove and empty picks, modifiers, Undo, stable open panels and overlapping touch/mouse ownership.

## Verified direct selection IPA — 2026-10-02

Exact-source [iOS run 36984752140](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/36984752140) at `8dad7282bb219f823bc15ad0ec8c523e14e25d33` passed cloud preflight, native Release compilation, packaging and upload. Artifact `Blender-iPad-Unofficial-ipa` id `11217606665` has GitHub archive size 248,462,199 bytes, digest `sha256:9e7ee24444af9329c3c9f84b2abdb8a6be32064460722b41e5eb9b18da6ce0f9`, and expires 2026-12-31 08:33:58 UTC. The downloaded IPA is 248,462,031 bytes, SHA-256 `bb21fecfa4917dffd24e36a906dbefa815d3e6d79a93f2cf2e9139baea730191`. Full ZIP CRC across 3,368 entries, arm64 iPhoneOS bundle/Mach-O metadata, startup resources and preserved Files/library/recovery markers pass. The entire packaged space_view3d_ipad.py matches this exact source, including the Selection popover and header. All 51 host tests, 61-file pinned-source preflight and headless Blender 5.1.2 selection/tool/header wiring pass. This is packaged-source evidence; no host visual preview or actual iPad acceptance is claimed.

The visible interaction increment adds direct finger/Pencil Box and Lasso drags, Replace/Add/Remove choices for shapes, All/Clear/Invert and mesh Vertex/Edge/Face, while keeping complete native selection commands. Header feedback shows shape and operation. Interrupted shapes do not apply; allowed Pencil menus and hardware button-down hand off an existing captured drag safely. New pan streams starting during a hardware drag are suppressed. Ordinary point taps still use native Blender selection behavior, and touch taps during a hardware drag remain a separately audited gap; do not claim complete mixed-input acceptance. Working Pencil mappings, accepted Inspector, native editors/external modifier selection and existing Files work are preserved.

Continue actual interaction independently without waiting for device input. Next source-backed increment: protect point taps from active hardware drags and extend explicit Replace/Add/Remove to direct Box/Lasso point picks without changing hardware clicks or modifiers; then expose native axis/orientation/pivot/snapping and transient numeric transforms. The pinned seam and ownership constraints are in TOUCH_EDITING_NEXT.md. Do not resume import/Portable Project Copy expansion. Focused device checks remain Box/Lasso with finger/Pencil, Replace/Add/Remove, mesh element choices, Undo, interrupted capture/menu handoff and two-finger orbit/pinch. Earlier source-candidate pending-build wording below is historical.

## Direct selection interaction — source candidate, 2026-10-02

The next interaction increment makes native Select Box and Select Lasso own direct finger/Pencil canvas drags in Object, Pose and Edit modes, with two-finger orbit and pinch still available. A focused Selection popover in the viewport header exposes Box/Lasso, Replace/Add/Remove, native All/Clear/Invert, mesh Vertex/Edge/Face and the complete mode-specific selection menu. The header shows the active shape and operation. Native tool properties retain external Shift/Control overrides; advanced native selection modes are preserved until an explicit quick-choice change. Flythrough retains navigation ownership and offers an explicit Exit Flythrough to Select action.

UIKit interruption cleans up Box/Lasso previews before selection applies. Pencil squeeze/context and accepted hardware mouse button-down cancel an existing capture before handing over the pointer; the old finger stream cannot later release the new owner. A new touch stream beginning during a hardware drag is suppressed through lift. Circle Select remains on its native path because it changes selection during motion; no new rollback guarantee is claimed for it. Pencil mappings/ring, accepted Inspector, native editors and existing Files work are preserved.

All 51 host tests, 61-file pinned-source preflight and headless Blender 5.1.2 native selection/tool/header wiring pass. This is source evidence only until the final exact revision builds and its IPA is verified; no host visual preview or device acceptance is claimed. Latest verified package remains interaction run 36979119999 at e3d8b29. Next device checks: Box/Lasso Replace/Add/Remove with finger/Pencil, mesh element choices, Undo, interrupted drag/menu/input handoff and two-finger navigation. Continue actual editing/navigation/precision improvements independently; import/Portable Project Copy expansion remains deferred.

## Interaction package checkpoint — 2026-10-02

Exact-source IPA run 36979119999 at e3d8b29 passed native Release build and downloaded archive, arm64 bundle and exact packaged UI checks. It includes direct transform-tool finger/Pencil drags, interruption rollback, stable first strokes, hover isolation, active-tool feedback and header Undo/Redo. All 50 host checks and pinned-source preflight pass; host Blender verifies tool/header wiring. There is no device acceptance for this increment. The user's latest priority remains actual interaction; preserve existing Files work and defer further import/portable-copy expansion. Continue selecting/manipulating, navigation and reversible editing improvements independently, preserving accepted Pencil mappings, Inspector, native editors and external input. See docs/PROJECT_HANDOFF.md (PROJECT_HANDOFF.md from this docs directory) for exact artifact evidence and focused device checks.
## Current priority — actual interaction, 2026-10-02

The user explicitly redirected work: "I think we need to make progress on actual interaction. We've bee too focused on the improt and stuff." This supersedes earlier next steps calling for Portable Project Copy or more import expansion. Preserve the existing Files foundation and fix actual regressions, but prioritize selecting/manipulating objects, navigation, edit confirmation/cancellation and undo in perceptible installable increments. Preserve accepted Pencil squeeze radial, double-tap context, Inspector, native editors and external input. Continue independently without waiting for device input; keep device acceptance separate from source/package evidence.

The current source candidate gives native Move/Rotate/Scale/Transform tools direct finger/Pencil drags in Object, Pose and Edit modes, starts captured drags at the real contact point, rolls back interrupted transforms and keeps panels stable during the first editing stroke. Undo/Redo are directly in the viewport header. Existing finger navigation remains in other tools, and two-finger orbit/pinch zoom remain available while manipulating. Check exact-source native build and device comfort before claiming acceptance. Latest verified IPA is run 36974715979 at 134ee8d, an internal writer foundation with no portable-export UI. See docs/PROJECT_HANDOFF.md.

## Portable writer source and latest IPA — 2026-10-02

Latest verified package is exact-source run 36959654940 at 3cfd5b6, including a Save Copy linked-library notice; downloaded IPA checks pass, with no new device acceptance. The current writer source candidate adds a synchronous post-save-preparation resolver and scoped path restoration for Portable Project Copy. It has no export operator/UI yet. Continue the complete staged dependency-copy and relative-path project outcome; do not retain ID buffer pointers across native copying or save callbacks. See docs/PROJECT_HANDOFF.md and docs/PORTABLE_PROJECT_COPY.md. Preserve accepted Pencil, Inspector, native editors and external input.


## Verified multi-library folder IPA — 2026-10-02

Exact-source run 36957402486 at 79a265f passed native Release build and downloaded IPA archive, arm64 bundle and packaged library-choice checks; see `docs/PROJECT_HANDOFF.md`. A Link/Append Files folder may contain several `.blend` files and the app asks which one to use while retaining the copied folder and its relative assets. This addition has no iPad device acceptance; the user's earlier “works” reply covers only the original single-file chooser. Continue touch and complete Files outcomes, especially portable sharing of projects with linked libraries. Preserve Pencil squeeze radial, double-tap context, accepted Inspector, native editors and external input. Keep source, packaged build and device evidence distinct.


## Verified library-folder Link/Append IPA — 2026-10-01

Exact-source run 36952644773 at 1abeea2 passed native Release build and downloaded IPA archive, arm64 bundle and packaged folder-marker checks; see `docs/PROJECT_HANDOFF.md`. Link/Append can now copy a selected folder containing one `.blend` with relative assets, or keep the existing single-file route. Folder selection, relative textures and cancellation have no device acceptance. The user's earlier "works" reply supports only the original chooser. Preserve accepted Pencil squeeze radial, double-tap, Inspector, native editors and external input. Continue touch/Files usability and portable project sharing; source, packaged build and device evidence are separate.

## Verified first Files open repair IPA — 2026-10-01

Exact-source run 36950741895 at 4a777b6 passed native Release build and downloaded IPA archive/bundle checks; see `docs/PROJECT_HANDOFF.md`. It fixes the fresh direct Files open ticket-zero cancellation and makes Recent Retry/Open Local Copy wait for alert dismissal; a successfully opened local copy saves independently of the Files original. No iPad device acceptance is claimed. Preserve accepted Pencil squeeze radial, double-tap, Inspector, native editors, external input and the user's focused Link/Append chooser result. Continue complete Files and touch usability, especially sibling assets and linked-library portability; distinguish source, package and device evidence.

## Verified Files-backed Open Recent IPA — 2026-10-01

Exact-source run 36926276105 at 675badc passed native Release build and downloaded IPA integrity/bundle checks; see `docs/PROJECT_HANDOFF.md`. Provider-backed Open Recent now checks Files before the unsaved-scene decision, handles conflict/offline/local-copy choices, and waits for terminal asynchronous Save success. The first direct Files open avoids a duplicate check when the scene is clean. No device acceptance is claimed. Preserve Pencil squeeze radial, double-tap, accepted Inspector, native editors and external input. Continue touch/Files usability and linked-library portability; distinguish source, package and device evidence.

## Verified Files copy lifecycle IPA — 2026-10-01

Exact-source iOS run 36889708972 at
`b3faf9340c9548c36d1fe58c5f7a2685c676daa1` passed native Release build,
packaging and downloaded IPA checks; see `docs/PROJECT_HANDOFF.md` for evidence.
After Files selection, model/library imports show a cancellable preparation
sheet and visible copy-failure explanation. Library copies are staged under a
hidden name and moved into visible `Documents/Libraries` only when complete;
abandoned stages are cleaned on startup. The user's earlier "works" reply
supports the Link/Append chooser in run 36850574490, not this new copy UI.
Continue independent touch/Files work. Next, provider-backed Open Recent needs
an asynchronous source check before opening its local working copy; preserve
unsaved scene edits and local mirror conflicts.

## Focused Link/Append iPad response — 2026-10-01

The user answered "works" to a question about IPA run 36850574490 opening
the Link/Append data-block chooser after Files selection and linked objects
remaining after save/reopen. Treat that focused flow as user-reported working.
The reply did not describe multi-selection, options, cancellation, large-file
copying, provider refresh, project portability or external input. Preserve
the accepted flow and continue unfinished Files lifecycle work.

## Goal clarification: usability over a fixed UI mechanism

Follow the goal clarification in `docs/PRODUCT_DIRECTION.md` (or
`PRODUCT_DIRECTION.md` from this docs directory). It supersedes wording below
that treats a particular rail, panel or lock mechanism as immutable. Preserve the
underlying capabilities and lessons; improve the design when evidence supports a
better iPad interaction. Preserve the working Pencil mappings and external input.
Judge progress by complete workflows in installable builds and actual-device
acceptance, while continuing unfinished workspace and Files requirements.

## Link/Append Files checkpoint — 2026-10-01

Exact-source IPA run 36848386081 at 3d70e9e passed native Release compile,
packaging and downloaded artifact checks after native Files selection began
using persistent app-owned library snapshots. It has no device acceptance.
The subsequent touch chooser source is now packaged in exact-source IPA
run 36850574490 at 5e1a693, with 42 host tests, 57-file pinned-source
preflight, native Release compile, IPA integrity and bundled UI checks passing.
Continue real-device workflow acceptance and the remaining Files lifecycle. Preserve the accepted Inspector,
Pencil squeeze radial, double-tap context and external input. The library
copy is a snapshot and linked-project portability remains open.

## Latest continuation directive — 2026-10-01

The user explicitly renewed the full goal: continue independently without
waiting for hardware feedback, use the available five-hour and weekly usage
windows, and schedule a resume near renewal when limits run low. This
supersedes the earlier request below to pause at each device test gate. Keep
the Files IPA's iPad behavior unverified and invite a focused device report
when useful, but continue source-backed work that does not require it. The
recurring continuation heartbeat is active again.

The next source candidate hardens native model-import picker callbacks. A
unique lease is assigned to each file-select operator and invalidated on
free; delayed success/cancel callbacks check the lease, live window manager
and handler before touching Blender state. Rejected or stale staged copies
are removed. All 41 host tests, pinned-source preflight and exact-source iOS run
36832783348 pass. The downloaded IPA passed integrity and bundle checks;
device behavior remains unverified. Preserve model import options and the
approved Pencil and external-input behavior.

## Verified Files-linked IPA; device test gate — 2026-10-01

Exact-source iOS run 36829384514 at 5839961e187614b2467452d6cfa3bf5bb1ada0ff
succeeded. Cloud preflight, native Release compilation, packaging, artifact
upload, downloaded IPA CRC, arm64 bundle metadata and packaged action checks
passed. The user has not tested the linked Files workflow on iPad. The next
step is their short device check of Open Project from Files, ordinary Save
updating the Files original, and reopen after app relaunch. Check that Open
Project Copy still saves independently and Import Project Folder retains
relative assets; an external-edit conflict check is useful if practical.
The user asked development to stop when hardware testing is needed. Notify
them with this run and pause the heartbeat and goal until their report.
Do not infer provider behavior from package checks. Full artifact evidence
is in PROJECT_HANDOFF.

## Files-linked project opening candidate — source only, 2026-10-01

The user finds the current Inspector acceptable, so work moved to Files. The
new explicit Open Project from Files route coordinates a local working copy,
retains a bookmark for the selected provider document, and routes ordinary
Save through the existing coordinated writer. The independent Open Project
Copy and Import Project Folder choices remain. Linked projects store a content
fingerprint and refuse a provider write when the source differs or cannot be
checked; Save As preserves edits in that case. After a successful provider
write, the local working file is refreshed for Open Recent and relative paths.
A provider write that succeeds while local refresh fails has a distinct error.
Single-file opening still requires packed assets if sibling resources matter;
folder import remains the choice for full relative assets. All 40 host tests,
pinned-source preflight and exact-source iOS run 36829384514 pass. This is not
iPad device acceptance; see PROJECT_HANDOFF for artifact evidence.

## Latest device feedback — 2026-10-01

After receiving the focused test request for exact-source IPA run 36818147730,
the user replied, "seems fine to me." Treat the Inspector's current appearance
and sizing as acceptable for now; no specific problems were reported. This
brief report does not verify every fresh/saved, portrait, Files or external-input
case. The requested testing pause is over. Continue the active first-class
iPad goal, preserving the working Pencil mappings and native editors. Avoid
another Inspector redesign without new evidence. The latest verified package
is still run 36818147730 at e3a4eff; see PROJECT_HANDOFF for exact evidence.

## Inspector saved-width follow-up — 2026-10-01

The active goal resumed after the verified 35984874300 test request; no user
device report on that IPA has been recorded. A source audit found that Inspector
and Scene shared ipad_panel_size[0]. Thus a previously saved wide side editor
could override the new 35% Inspector default in an existing project. Source
e3a4effc1bc22ae5e09f03ade007b927e27861ed gives Inspector a separate
saved width: zero in older projects chooses its compact default, later drags
persist independently, and other side editors keep their saved width. The
modal resize path restores the right preference on cancellation. All 39 host
tests and pinned-source preflight pass. Exact-source iOS run 36818147730
at e3a4eff succeeded: native Release compilation, IPA packaging, artifact
download and integrity checks passed. Exact artifact metadata is in
PROJECT_HANDOFF. This is packaged-build evidence, not iPad acceptance. The
user should now test this IPA in a saved project and a fresh Layout, including
Scene/Inspector width switching and the native Properties icons. Explicitly
notify them and pause development until their report; preserve Pencil and
external input. Do not retry an earlier source merely to repeat host checks.

## Current Inspector package — 2026-09-24

The user's test of IPA 35975045387 found broad working behavior but a basic
visual design, an Inspector that opened too wide and could not shrink enough,
and no visible desktop Properties icons. The new exact-source IPA run
35984874300 at 46bd48ddc60cada6abbe3b0bed501358623c6e65 restores
Blender's native Properties icon strip beside a labeled header picker and
reduces the Inspector-specific opening share from 45% to 35% and minimum
width from 360 to 280 scaled UI units. Other side editors and saved user
widths are preserved. All 38 host tests, pinned-source preflight, native iOS
Release compilation, packaging and artifact verification pass; exact metadata
is in PROJECT_HANDOFF. This does not prove device visibility or comfort. The
user now needs to test the exact new IPA; explicitly notify them and stop
development until feedback arrives. Preserve the working Pencil mappings and
external input. Failed run 35983302880 at 39f708d had a stale split_previous
reference, repaired before the successful replacement; do not retry it.

## Updated goal — 2026-09-21

The user explicitly requested updating the goal after reviewing progress. The
success criterion is comfortable everyday iPad use while preserving full Blender
capability and external input. Follow the revised Goal and user section in
`docs/PRODUCT_DIRECTION.md`. Prioritize visible workflow improvements in coherent,
installable builds; the workspace feature list remains required but does not by
itself establish usability. Preserve the confirmed working Pencil squeeze radial.
Own reversible decisions and ask for device evidence only when needed.

The latest successful feature IPA is run 35984874300 at source 46bd48d.
It includes the narrower Inspector and native category icon strip along with
the earlier project-folder import, per-project Files bookmarks, provider Save
completion fixes and Layout Tool Header adaptation. The artifact was downloaded
and verified; see PROJECT_HANDOFF for hashes and bundle metadata. This is
packaged-build evidence, not acceptance of the new Inspector on iPad. The user
has provided device feedback on the preceding IPA and should now test this one
before further visual decisions. The broader usability, workspace and Files
requirements remain open.

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


Before changing code, read `docs/PRODUCT_DIRECTION.md`, `docs/IPAD_WORKSPACE.md`
and the newest section of `docs/PROJECT_HANDOFF.md`, then inspect HEAD and the diff.
Preserve existing implementation and distinguish prototypes from shipped changes.

The user is the hardware tester, not the project manager. Own implementation and
reversible design choices. Ask for hardware evidence or consequential subjective
decisions only when needed. Do not restart design discovery each session.

The current UI implementation follows the rail, global lock and working split
design above, subject to the goal clarification at the top of this file.
Apply it at startup, file load and workspace switching. Preserve native editor
instances and state. Bound floating content to actual WINDOW regions, accounting
for variable headers, and align drawing with input. See `docs/IPAD_WORKSPACE.md`
for the current acceptance criteria. Historical handoff entries describe earlier
implementations; they do not override the current contract.

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
