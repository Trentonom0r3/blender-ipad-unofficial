# iPad workspace design and delivery

## Direct Extrude interaction — completed source candidate, 2026-10-03

The first Extrude native build is run 37093936400 at a9f0f28334094e70063d4504c41ac72a04df0849. Cloud preflight passed and Release compilation started. A later source-backed refinement binds redo admission to the registered Extrude operator's active named Undo step, preventing a later unrelated selection/geometry step from becoming its baseline. All 69 host tests and 83-file preflight pass again. This later correction needs its own exact-source native build. GitHub observation subsequently returned TLS handshake timeouts; that does not establish native build failure or success. Inspect the live run before dispatching a replacement. Neither source is a ready/device-accepted Extrude IPA yet. Exact a9f0f28 host Blender tool/header wiring also passes, with native headless keymaps initialized through register_ensure; its script/report are preserved in the calling chat's visualization directory. See TOUCH_MODELING_NEXT.md for the independent Bevel audit. Continuation should run near the October 3 07:50:54 UTC five-hour reset (2:55 AM America/Chicago). Do not use the free reset credit without a user request.

The current source enables direct finger/Pencil Extrude Region drags in Edit Mesh, with a short active-tool "drag selection, lift to finish" cue. The approved nine-tool ring, Inspector, native editors, hardware input, Fine/Numbers/selection controls and Files work are preserved. Initial cancellation restores independent native BMesh snapshots after the transform child releases its data. Cancelling a redo-handle adjustment restores the already accepted extrusion through native Redo after operator, gizmo and handled-event teardown, before another queued input; dispatch returns immediately after consumed recovery. Success retains native operator/Undo registration. Source patch SHA-256 `d76b55e1ca07275d5d30f35612fa671fdc35abb3854a27cc2e8919055ef4edd2`.

Runtime Undo lifetime IDs plus mutation generations protect accepted/baseline steps, including skipped steps and failed pushes. Registered-operator identity stays outside DNA and is erased before destruction; gizmo allocation/binding IDs reject same-address replacement. Claims are tri-state and reject before geometry. Snapshot rejection is null-safe and unexpected context-free destruction only discards. Recovery resolves live WM/window/scene/screen/area/region, view layer, native tool and active edit owner; native Mesh Undo refs resolve every encoded owner and data UID through the current Main, including secondary objects. PRE callbacks are revalidated before decode; POST callbacks cannot leave stale viewport pointers or silently change the completed history.

Touch redo admission requires the registered Extrude operator's named native step to be the active accepted step, and checks other modal owners before popping Undo. A later unrelated selection/geometry step cannot become a redo-adjust baseline. Guarded pop uses the exact accepted step after UNDO_PRE instead of retaining native name-lookup pointers. The bounded adjustment accepts Mesh traversal only when its preceding MemFile is already active, and its scene/active owner/all participating objects still match; a path which could reload Main or a changed context is refused before pop. Preserve this guard until cross-mode recovery has separate proof. Do not replace it with generic unguarded ED_undo_pop_op or restore by assigning step_active.

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

Preserve accepted squeeze/double-tap, Inspector, native editors, hardware input and existing Files work. Continue actual interaction independently; import/Portable Project Copy expansion stays deferred. Focused device acceptance remains select → constrain/drag or Numbers → finish/Cancel → automatic one-step Undo/Redo; orientation agreement between canvas and gizmos; popover fit in portrait/landscape and split views; and two-finger navigation with panels open. Next source work should audit native touch precision/edit feedback before expanding chrome: do not simulate held Shift or scale UIKit coordinates. Full first-class iPad goal remains incomplete. Earlier source-candidate/package sections are historical.

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
## Current interaction increment — 2026-10-02

Prioritize actual object/edit interaction per the user's latest direction. The existing mechanisms may evolve to serve that outcome; keep the accepted Inspector and Pencil ring. Further Files/portable-copy expansion is deferred.

For native Move, Rotate, Scale and Transform in Object, Pose and Edit modes, direct screen drags begin at the actual contact point and use Blender's tool/gizmo path. Finger navigation in other tools remains, and two-finger orbit/pinch zoom are available with a transform tool. Native navigation buttons and workspace resize grips win hit testing; Tool drags can start only in the currently exposed WINDOW canvas, outside headers/rails/panels, and visible popups clear the capture map. The capture owns its stream through release or cancellation. Interrupted transforms restore their original state rather than treating cancellation as release-confirm. Open panels stay geometrically stable during a captured editing stroke, even when unlocked; this deliberately supersedes the earlier blanket rule that every canvas press must be consumed to dismiss panels. Ordinary taps retain that dismissal rule. Header Undo/Redo are directly reachable. External pointer events do not carry this direct-tool provenance.

Device check: choose Move via squeeze or Tools, drag the cube/gizmo with a finger and Pencil, then lift to confirm and Undo/Redo. Repeat Rotate/Scale, Edit/Pose, with an unlocked panel open, in portrait and a narrow window. Orbit with two fingers and pinch while the tool is active. Interrupt a drag by adding a second finger or backgrounding the app; no partial transform should remain. Check Select-mode navigation, context double tap, native menu scrolling and keyboard/mouse transforms. This source candidate has no device acceptance.

## Files copy feedback and library staging — 2026-10-01

The model importer and Link/Append library picker now show a cancellable
Preparing sheet after Files selection, and a clear alert if the coordinated
copy fails. A library is copied into a hidden staging folder, then moved to
visible `Documents/Libraries` only when complete. Cancel invalidates the
Blender callback immediately; an already-running file copy can finish in the
background before its staging folder is removed. Abandoned staging folders
are removed on next launch. Exact-source IPA run 36889708972 passed build and
artifact checks; this interaction still needs an iPad usability check.

## Focused Link/Append device response — 2026-10-01

The user replied "works" to a focused check of run 36850574490's
Files-to-data-block chooser and linked-object save/reopen path. This supports
the core interaction on device; cancellation, options, multi-select, provider
refresh, portability and external input remain unverified.

## Current touch Link/Append IPA — packaged, device check open, 2026-10-01

Exact-source run 36850574490 at 5e1a693 passed native iOS Release compile,
IPA packaging and downloaded archive/bundle/script verification. Link and
Append use Apple Files for `.blend` selection, then a focused Blender
data-block list with search, category back, All/Clear and options. The iPad
interaction and saved/reopened linked paths have not been checked on device.
The selected library is a durable app-owned snapshot; refreshing it from its
Files original and shipping it with a project remain unfinished.

## Verified Link/Append IPA; touch chooser candidate — 2026-10-01

Exact-source iOS run 36848386081 compiled and packaged the native Files
`.blend` picker and durable library copy. IPA integrity and arm64 bundle
checks pass; iPad acceptance is pending. The next source candidate keeps
Blender's in-library category/data-block list and options, hides filesystem
shortcuts, and exposes Search, category back, All/Clear and Options in the
top bar. Its 42 host tests and 57-file pinned-source preflight pass; native
build and device usability remain pending. Libraries are snapshots, and
linked projects need their library copies to remain available.

## Link/Append Files bridge — source candidate, 2026-10-01

Link and Append select a `.blend` through Apple Files, coordinate a persistent
copy under `Documents/Libraries`, then start Blender's own selector inside that
library for data-block categories and names. Existing multiselect and options
remain. The copy is a snapshot, so provider refresh and sibling assets are
unfinished. Source checks pass; native build and device usability are pending.

## Goal clarification: usability over a fixed UI mechanism

Follow the goal clarification in `docs/PRODUCT_DIRECTION.md` (or
`PRODUCT_DIRECTION.md` from this docs directory). It supersedes wording below
that treats a particular rail, panel or lock mechanism as immutable. Preserve the
underlying capabilities and lessons; improve the design when evidence supports a
better iPad interaction. Preserve the working Pencil mappings and external input.
Judge progress by complete workflows in installable builds and actual-device
acceptance, while continuing unfinished workspace and Files requirements.

## Continued work while device feedback is pending — 2026-10-01

The user asked to keep developing independently until usage limits, so the
earlier hardware-test pause no longer blocks source-backed improvements.
The linked Files IPA remains unaccepted on device. A new source candidate
guards delayed native model-import callbacks with an operator lease and
cleans staged copies rejected after cancellation or context changes.
It passes host checks, pinned-source preflight and exact-source iOS IPA
run 36832783348; iPad behavior is still open. Preserve current Inspector
design and Pencil mappings unless new evidence warrants change.

## Files-linked open — packaged, device check needed, 2026-10-01

The iPad File menu and workspace controls now offer Open Project from Files
beside Open Project Copy and Import Project Folder. The linked route works from
a coordinated local file while ordinary Save targets the provider original,
then refreshes the local working file. It retains document access and checks
the provider content before writing, failing closed if an external edit or
unreadable state prevents comparison. This passed source/host checks and exact-source iOS IPA run 36829384514;
Files-provider device tests remain pending. Relative sibling assets are not
imported by the single-file route.

## Current device response — 2026-10-01

The user answered the latest Inspector IPA test request with "seems fine to
me." The existing Inspector design can stand while work continues elsewhere.
No individual fresh/saved, orientation, Pencil or external-input steps were
described, so do not mark the complete workspace acceptance matrix finished.

## Inspector width persistence follow-up — source, 2026-10-01

The first narrower Inspector IPA was verified as a package, but a source audit
found that its 35% opening width is bypassed by a width previously saved for
any side editor. Follow-up source e3a4eff stores Inspector width separately.
Existing projects initially use the compact default for Inspector; a new
Inspector resize persists, and other side-editor widths stay intact. Modal
cancel restores the preference belonging to the editor that began the drag.
All 39 host tests and pinned-source preflight pass. Exact-source iOS run
36818147730 passed native Release compilation, packaging and downloaded IPA
verification. Real-device behavior is still untested. Compare fresh and
saved projects, Scene/Inspector switching, width resize/cancel and the native
Properties icons on this exact IPA.

## Current Inspector iteration — packaged, device check needed, 2026-09-24

The user tested IPA run 35975045387 and reports that the Inspector opens too
wide, resists further shrinking, and lacks visible desktop-style category
icons. Exact-source IPA run 35984874300 at 46bd48d restores the native
Properties navigation strip on the left of its floating editor, retains the
labeled native enum picker in the header, lowers the Inspector-only minimum
side width to 280 scaled units, and opens it at 35% of usable content width
when no saved width exists. The native enum still controls filtering, active
context, search highlighting and the dynamic object-data icon. Saved widths
and other side editors are unchanged. Host tests, pinned-source preflight,
native iOS compilation, packaging and artifact checks pass; real-device
acceptance of this iteration is still open. Check fresh and saved Layout,
portrait and narrow windows, dense Properties fields, and Inspector/Scene
switching.

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
