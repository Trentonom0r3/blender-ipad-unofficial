# Product direction and decisions

## Contextual Pencil radial — completed source candidate, 2026-10-03

Squeeze still opens the nine familiar tools with an empty center. Inactive tools activate normally; tapping the active Select/Move/Rotate/Scale/usable Transform button (marked with an ellipsis) opens its controls in the same native ring style. Lasso now highlights the existing Select position. Selection exposes Box/Lasso, Replace/Add/Remove and Mesh Vertex/Edge/Face; other supported selection modes get native All/Clear/Invert. Transform exposes Free/X/Y/Z, Fine, Snap, transient Numbers and native More. Tools returns to the original nine positions at the original anchor. Settings stay open and rebuild actual active state, so several preferences can be set before dismissal and the next drag. Numbers and selection actions close through ordinary native callbacks. Dismissing preferences does not undo already applied tool settings. Squeeze/double-tap mappings, advanced native access, Inspector, hardware, Files and bounded Extrude/Bevel recovery are preserved.

Native popup data now owns only a menu ID, anchor values and context/geometry receipts, with a free callback and fresh native menu draw. Exact menu IDs and nine-button counts are enforced; no new desktop pie behavior is admitted. Setting persistence is captured before native operator ownership transfers into the delayed callback. Before redraw and input, current list membership, Main, screen/scene/Object/data session IDs, mode and menu poll are checked without dereferencing saved owners. Changes to WINDOW/exposed bounds or UI scale close the popup before native refresh height stabilization can move it outside the canvas. Rejected buttons are immediately hidden/disabled. Actual originating WINDOW selection handles quad-view and prefers the event's viewport over overlapping backgrounds; native bounds exclude exposed service panels, drawn shelf and navigation. Context controls use 44-unit heights, a bounded narrow grid and fail closed with an expand-viewport explanation if they cannot fit.

Patch SHA-256 `8ccb252b14eaa5d3461b406ad844f392a07f966c25947cb02b66c0d6ebd84017`. All 83 host tests and 87-file pinned-source preflight pass. Real stock Blender 5.1.2 verifies native ring routes/selection/tool properties/axis/Fine/Snap/combined child ownership, truthful advanced selection modes, original nine tools and transform/numeric geometry/Undo guards. Quad/overlap target selection and C++ geometry/receipt/close-policy tests are modeled source evidence. Independent native lifecycle review found deferred-operator classification and popup height-stabilization issues; both are fixed and re-review found no further material blocker. Actual native grid-content previews are in output/ui-preview/context-rings/move.png and mesh.png. They verify host UILayout, icons and active state, not target ring placement, refresh or input.

This candidate needs one exact-source native build and downloaded full IPA/arm64/entire packaged UI verification. Latest verified IPA remains shelf run 37129200104 at ee2f351; it does not include these rings. No device acceptance is claimed. The persistent shelf remains a trial and retains finger/advanced routes for this increment. Next reassess a minimal/optional shelf with a clear finger launcher and complete native Selection/transform access; do not leave duplicate permanent controls by default or remove the finger route blindly. Continue perceptible select/manipulate/constrain/precise entry/finish/Cancel/Undo improvements without waiting for feedback. Import expansion and deep camera transactions remain deferred except actual regression fixes. Earlier snapshots are historical; do not rebuild an unchanged earlier revision.

## User direction — build on the Pencil radial, 2026-10-03

After looking at the actual host screenshots, the user points out that the Pencil radial already exists and says modifying it may be the cleanest UI style for this work. This is the latest design priority, superseding mode-switch-first continuation and treating the persistent editing shelf as a trial, not accepted final design. Continue the full first-class iPad goal independently. Build a perceptible active-tool editing experience around the existing native radial style; reassess persistent canvas chrome rather than expanding the shelf by default. Own reversible design choices and do not make the user the designer.

Preserve functional squeeze to tools, double-tap to native context/right-click, the familiar nine base tool positions and the intentionally empty center. The user now authorizes evolving the radial presentation; older preserve-geometry instructions do not prohibit an intentional context layer. Native selection/transform properties, operations and complete advanced access remain authoritative. Keep accepted Inspector, native editors/splits, hardware input and Files working. Import expansion and deep camera transactions remain deferred except necessary regression fixes.

Latest verified exact-source package remains shelf [run 37129200104](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/37129200104) at `ee2f351eaf98c8920a6d109ebf3f4886af691190`, patch SHA-256 `1cfa0f01c6e8ea50c0eaf3254f11fd88e7b882f755d37c8050dd727cb63fcc13`. Native Release, downloaded full CRC/arm64/entire packaged UI/native icon checks, 82 host tests and 87-file preflight pass. It contains the editing shelf, not the proposed contextual radial. The screenshot feedback does not establish device acceptance. No source change or unchanged rebuild is needed for this design checkpoint. See the bounded source audit at the top of TOUCH_EDITING_NEXT for implementation seams and input/geometry requirements.

## Verified canvas editing shelf IPA — 2026-10-03

Exact-source [IPA run 37129200104](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/37129200104) at `ee2f351eaf98c8920a6d109ebf3f4886af691190` passed cloud preflight, native Release, packaging/upload and downloaded IPA checks. This is the final native-tool-icon revision; parent run 37128013312 at 7114c24 also compiled but is superseded. The new everyday shelf exposes Select/Move/Rotate/Scale, Undo/Redo, selection shape/operation/mesh element icons and transform Free/X/Y/Z/Fine/Snap/Numbers directly in the exposed canvas. It removes duplicate primary header entries, uses equal touch-sized cells, wraps narrow layouts, and restores header controls where a shelf cannot fit. Native operations/properties remain authoritative; advanced controls and accepted Inspector/Pencil/native editors/hardware/Files are preserved.

Patch SHA-256 `1cfa0f01c6e8ea50c0eaf3254f11fd88e7b882f755d37c8050dd727cb63fcc13`. 82 host tests and 87-file preflight pass. Host native transform/RNA/geometry validation and actual Blender 5.1.2 layout screenshots pass; the screenshots in output/ui-preview/editing-shelf show a temporary host popup, not iOS anchoring/input. Independent native lifecycle and UX reviews found the compact Scale glyph issue and quad-view fallback issue; both are corrected in this final source.

Artifact id `11276411762`, archive metadata 248,483,742 bytes, metadata digest `sha256:c8ac3d1b784e47cff99adf2220340896c8d5f2651939e46aa13b28e58d2223d5`, expiry 2027-01-01T14:19:34Z. Downloaded IPA 248,483,574 bytes, SHA-256 `8ce25c2bc86e64940d9790c366a17bce100aaf928acef1422ca2677d89926e32`. Full CRC across 3,368 entries, arm64 Mach-O/iPhoneOS com.unofficial.blenderipad 5.0.0, startup/Files/library/recovery markers, entire packaged interaction Python equal exact ee2f351 source, native shelf/RNA and Bevel rollback markers, and all four native tool icon assets pass. IPA and metadata are in `%TEMP%/blender-ipad-run-37129200104`. No iPad device acceptance is claimed; packaging does not prove finger/Pencil ownership, anchor geometry or comfort.

Continue the full goal independently with perceptible interaction prioritized. Next inspect actual daily mode switching and active modal feedback; implement a coherent visible increment where native Object/Edit/mesh context or constrain/finish/Cancel/Undo still require tiny desktop controls. Own reversible choices, retain complete native mode/tool access and audit per-WINDOW bounds, split/portrait layouts and pointer ownership. Do not treat existing operations or robustness fixes alone as substantial product progress. Camera/gesture lifecycle requirements remain in TOUCH_CAMERA_NEXT, deferred unless needed for visible interaction or confirmed regressions; import expansion remains deferred. Focused device acceptance remains shelf taps not selecting/dragging through UI, Inspector stability, Select/Move/X/Fine/Snap/Numbers, lift/Cancel/Undo and narrow/split/portrait comfort. Continue without waiting for feedback. Earlier pending/source entries are historical; no unchanged rebuild is needed.

## Visible editing shelf — source checkpoint, 2026-10-03

The current coherent source adds an editor-local native UI shelf at the bottom of each exposed 3D WINDOW. Select/Move/Rotate/Scale and Undo/Redo are directly reachable. Select shows Box/Lasso, Replace/Add/Remove and Mesh Vertex/Edge/Face. Transform shows Free/X/Y/Z, Fine, Snap and Numbers without opening the previous popover; native orientation/pivot/plane/snap details remain under More. The caption shows actual native mode/tool/constraint/orientation/precision/snap state. This changes everyday presentation and access, not Blender's available modeling capabilities. Native operations/properties remain authoritative.

Equal grid cells preserve 44-unit touch widths and heights; narrower viewports wrap precision controls. Tiny/short/rejected layouts retain the original header controls; all WINDOW regions must have a shelf before quad-view suppresses that shared fallback. The shelf is clipped to exposed canvas geometry around rails/panels/headers/splits and avoids navigation UI. Native WINDOW UI handlers precede gizmos/tool keymaps; padding cannot click through. GHOST direct-drag maps exclude successfully drawn shelf bounds, and shelf taps do not dismiss or rehost service panels. Failed native layout fits discard both UI-block generations without retaining pointers or unprotected hits.

Visual review caught a nearly invisible Scale icon in the compact row. The final source uses Blender's native tool silhouettes, with labels as a fallback if an asset cannot load; current move/mesh/narrow previews show the corrected layout. The existing verified IPA contains the required native icon assets. Parent source 7114c24 is in native Release build 37128013312 and cloud preflight passed. It lacks this later icon correction. Build the exact final source once, after checking live runs; do not call the parent's package the corrected outcome.

82 compiled host tests, 87-file pinned-source preflight, real host Blender 5.1.2 native transform/RNA/geometry validation and independent native-lifecycle/UX source reviews pass. Real host screenshots are in output/ui-preview/editing-shelf: before.png, move.png, mesh.png and narrow.png. They show the exact Python UILayout; the after shelf is rendered in a temporary host popup because stock Blender lacks the iOS WINDOW hook. Popup placement/outline and desktop panels differ. These are layout evidence, not iPad anchor/input/device acceptance. Patch SHA-256 `1cfa0f01c6e8ea50c0eaf3254f11fd88e7b882f755d37c8050dd727cb63fcc13`. This source needs its exact native build and downloaded IPA checks; latest verified IPA remains 37112191770 at 855f6bd. Do not rebuild that unchanged older source.

Continue the full goal independently, prioritizing perceptible selecting/manipulating/constraining/precise entry/finish/Cancel/Undo. Preserve accepted Inspector, Pencil ring/squeeze/double-tap, native editors/splits, hardware and Files. Camera ownership requirements remain in TOUCH_CAMERA_NEXT but are deferred; import expansion remains deferred. Device acceptance for this shelf is still open; do not make packaging or source checks stand in for it.

## User correction — visible everyday interaction, 2026-10-03

The user says the reported Extrude/Bevel/Camera operations were already possible and asks what actually feels different. Do not present existing Blender capabilities, input routing/cancellation fixes or settings shortcuts as a substantial new iPad experience. The latest verified IPA remains 37112191770 at 855f6bd; its underlying robustness changes are real, but the larger desktop-feel problem is still open. No new device acceptance follows from this feedback.

Supersede the next camera-transaction-first priority with a perceptible everyday canvas editing milestone. First audit the actual current viewport header/tool/selection/transform controls and own a coherent visible improvement: a clear active editing context with touch-sized, directly reachable selection/axis/precision/snapping/numeric controls, reducing repeated small-button/popover traversal and duplicate desktop chrome. Use native operations and properties. Choose placement after checking actual WINDOW bounds, existing rails, panels, split/narrow/portrait layouts and touch occlusion; preserve accepted Inspector, Pencil ring/squeeze/double-tap, native editors/splits and external input. Do not add a generic Canvas settings bucket or require the user to design it.

Acceptance is a noticeable improvement in select → manipulate → constrain/precise value → finish/Cancel → Undo, supported by an actual host UI preview where feasible, exact-source package checks and later device evidence. Record the visible before/after and which steps become easier; tests and compilation alone do not establish this product outcome. Deferred camera/gesture lifecycle requirements remain in TOUCH_CAMERA_NEXT and must not be discarded, but pursue them next only when needed for this visible interaction or a confirmed regression. Import expansion remains deferred. This entry changes priorities only; it does not claim the editing presentation has been implemented.

## Verified native navigation Cancel IPA — 2026-10-03

Latest exact-source [IPA run 37112191770](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/37112191770) at `855f6bd5f0f871c4ab41bfe2098af35c0162e530` passed cloud preflight, native Release, packaging/upload and downloaded full archive/arm64/entire packaged UI checks. It includes direct Extrude and Bevel, native Bevel settings, viewport Camera controls, and native Escape-equivalent cancellation of interrupted finger/Pencil Move/Rotate/Zoom button drags. Ordinary lift confirms; generic destruction remains non-restoring. All 80 host tests and 84-file pinned preflight pass. Shipped patch SHA-256 `09e2a9955fc6b4fc1467f352d1affc052c7f9cd165977734e3a01c2453a25290`. No visual preview, direct native modal runtime test or iPad acceptance is claimed.

Artifact id `11270250897`, archive 248,478,820 bytes, digest `sha256:e0b0466559ecf7d43a708a69144bb1f2b8f7f43517da61e7585add6a04d1f5fc`, expires 2027-01-01T09:11:13Z. Downloaded IPA 248,478,652 bytes, SHA-256 `2ef576fdd9dfe11bc798e30a5f6deb402b3e6be3ab0d8147d145bd75bf49ca52`. Full CRC across 3,368 entries, arm64 Mach-O/iPhoneOS bundle com.unofficial.blenderipad 5.0.0, startup/Files/library/recovery markers and entire packaged interaction Python equal exact 855 source. Native Bevel rollback binary marker and Extrude/Bevel/Camera UI markers pass. Evidence and IPA are in `%TEMP%/blender-ipad-run-37112191770`.

Continue the full goal independently with actual interaction prioritized and import expansion deferred. Next source work is the shared direct pan/pinch session and native camera/history ownership in TOUCH_CAMERA_NEXT, including explicit phases/source/identity, fixed origin, simultaneous recognizer and handoff ownership, explicit constructor defaults, terminal event retention through queue coalescing, original camera/root-parent identities, deferred autokey and compatible history. Escape parity does not prove full camera/autokey rollback or whole-gesture Undo. Preserve accepted Pencil ring/mappings, Inspector, native editors, hardware and Files. Earlier pending-build/source-candidate sections are historical; this verified source needs no unchanged rebuild.

## Native navigation build and next gesture ownership — 2026-10-03

Completed navigation interruption source `855f6bd5f0f871c4ab41bfe2098af35c0162e530` is in native [run 37112191770](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/37112191770). Cloud preflight passed; last native observation was healthy source fetch. It has 80 host tests, 84-file pinned preflight and independent review, patch SHA-256 `09e2a9955fc6b4fc1467f352d1affc052c7f9cd165977734e3a01c2453a25290`. Inspect this run, fix actual native errors if any and verify the downloaded IPA before calling its cancellation change ready. Latest verified IPA remains Bevel/Camera run 37111045332 at b525e68. No device acceptance is established.

Next actual-interaction target is one per-window direct pan/pinch navigation session, shared by simultaneous recognizers, with explicit phases/provenance and fixed originating viewport. TOUCH_CAMERA_NEXT records the exact transport/handoff audit and native original-camera/root-parent/autokey/MemFile-history requirements. Existing sample packets lack gesture terminal events, and camera-lock checks do not prove all transformed parent owners. Do not enable new locked-camera gesture admission or claim cancellation/one-step Undo from transport tests alone. Preserve accepted ring/mappings, Inspector, native editors, external input and Files; import expansion remains deferred. Continue independently near the next ordinary usage reset; do not spend the free reset credit without a user request. Earlier sections are historical.

## Native navigation interruption — source candidate; Bevel/Camera IPA verified, 2026-10-03

Latest verified exact-source IPA is [run 37111045332](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/37111045332) at `b525e68980de4eb63bfa6feb26cfbfc9cc1b386f`: cloud preflight, native Release, downloaded full archive, arm64 iPhoneOS bundle and entire packaged UI checks pass. It includes corrected Extrude, direct Edit Mesh Bevel with native settings/rollback, and viewport Camera view/align/Scene-or-Local selector/Lens/Scale controls. Bevel's first 7329776 build failed on EVT_NONE; the b525 source corrects it to EVENT_NONE. No device acceptance or visual preview is claimed. Exact artifact evidence is in PROJECT_HANDOFF.

A later navigation source candidate makes interrupted finger/Pencil drags on native Move/Rotate/Zoom buttons use Blender's existing Escape cancellation, while ordinary lift still finishes. PointerCapture emits one cancelled release and suppresses later UIKit callbacks; the native classifier checks cancellation before release confirmation, axis snapping or navigation-mode switching. Generic teardown cancellation remains non-restoring. All 80 host tests, 84-file pinned-source preflight and diff checks pass. The compiled regression executes shipped classification/modal/teardown control flow with modeled apply/cleanup, including timer/mode switching and desktop parity; it is not native geometry or device proof. Patch SHA-256 `09e2a9955fc6b4fc1467f352d1affc052c7f9cd165977734e3a01c2453a25290`. This later candidate needs one exact-source native build and downloaded IPA verification.

The narrow improvement is native Escape parity for an existing navigation modal. It does not reverse completed camera/projection clicks, remove already-created animation keys, retain the original camera across context changes, preserve a pre-switch navigation baseline or implement one Undo per direct pan/pinch gesture. Preserve native teardown semantics and the bounded Extrude recovery guards. Continue the full goal independently with actual interaction prioritized and import expansion deferred; preserve accepted Pencil ring/mappings, Inspector, native editors, external input and Files. Next audited interaction work is direct gesture lifecycle/ownership in TOUCH_CAMERA_NEXT. Earlier candidate/build sections are historical.

## Viewport Camera controls and Bevel compile repair — source candidate, 2026-10-03

The later candidate adds a compact Camera popover in the actual viewport header, with native View/Leave Camera View, Align Camera to View, Scene/Local camera selection and perspective Lens or orthographic Scale. It targets `space.camera`, matching native alignment and local-camera navigation, rather than blindly changing `scene.camera`. Native picker RNA keeps Scene synchronization when local camera is off. Linked camera alignment retains native polling and linked lens data is read-only. The older Controls surface's scene-only gate/target is corrected without expanding its role. Flythrough retains its current path; the accepted Pencil ring/Inspector, native editors, external input and Files are preserved.

Bevel native run 37110163462 at `73297760bbcb571cdbe3bbbd0652e3ab19d4d748` passed cloud preflight but failed Release compilation on the new keymap guard: nonexistent EVT_NONE at wm_event_system.cc3883. The native enum is EVENT_NONE, now corrected in source and the compiled routing regression; do not retry unchanged 7329776. The Bevel lifecycle/settings increment remains included in this candidate. All 79 host tests and 84-file pinned-source preflight pass after the correction, and git diff --check is clean. Stock Blender 5.1.2 verifies Camera header/native property ownership, local camera with no Scene camera, perspective/orthographic presentation, native Scene/Local synchronization, linked-camera polling/read-only lens, and actual local-camera alignment plus Undo/Redo with explicit headless checkpoints. Patch SHA-256 `063e50117325de718d5f666cfd05c9d6625fa17470129018da276c6776ca0974`.

This exact completed source needs one replacement native build and downloaded full archive/arm64/entire packaged UI verification. Latest verified IPA remains corrected Extrude run 37108274789 at 761d62a. No Bevel/Camera IPA, host visual preview or device acceptance is claimed yet. Camera controls do not fix locked-camera gesture transactions: source audit found direct pan/pinch samples finish immediately, lack gesture-level Undo and may autokey; native generic cancellation does not remove autokeys and may move a root parent. Do not add a new lock-camera shortcut or promise cancellable camera manipulation until those requirements are implemented. See TOUCH_CAMERA_NEXT.md for the next native interaction seam.

Continue independently toward the full goal, with actual interaction prioritized and import expansion deferred. Device checks for this candidate: Bevel edge/vertex → outward drag → lift/Cancel → Undo/Redo and interrupted shared-owner/custom-profile edits; Camera view/return, local versus Scene target, align, lens/orthographic changes, native readonly behavior, portrait/narrow/split fit and external input. Preserve earlier bounded Extrude recovery guards. Earlier candidate/build entries below are historical.

## Direct Bevel interaction — source candidate, 2026-10-03

The later source candidate enables Edit Mesh finger/Pencil Bevel through the existing native Tools, plus a compact Bevel header popover for native Affect, Width Type, Segments, Profile Type/Shape, Clamp Overlap and Loop Slide. Its cue is "Drag outward, lift to finish". Advanced native settings and the approved nine-tool ring remain available. Only unmodified direct Bevel CLICK_DRAG prioritizes its native tool map over fallback selection; taps, keyboard modifiers and hardware retain their order. Contact-start displacement and native radial pixel margin/Shift gain are retained; transform Fine Drag does not apply to Bevel.

Native preview/rollback backups are reused. Every selected unique edit owner is checked for locked shape keys before acquisition. Direct previews require the original live Object/Mesh/edit-BMesh/key/shape and viewport/scene/tool context. Cancel restores each surviving original Mesh even after its representative shared Object was removed/rebound, discards replaced representations, and warns if restoration is incomplete. A copied native CurveProfile and registration-owner draw detachment make cleanup independent of the old viewport; context-free operator destruction only frees owned data. Workspace switches clear stale spatial context. Pointer cancellation precedes native release confirmation.

All 79 host tests passed, followed by the targeted 10 Bevel tests after the final workspace-teardown correction; 84-file pinned-source preflight and git diff --check pass. Real stock Blender 5.1.2 verifies tool/header/popover properties, retained advanced RNA and native width/segments/profile geometry plus Undo/Redo with explicit headless checkpoints. Compiled tests execute the shipped lifecycle, routing, admission, interruption barrier and native precision mapping with modeled owners/geometry; the host does not execute the new native touch modal lifecycle. Patch SHA-256 `80efe9e5ea535e52d62f1bc4fb19315988bb96276d1afd32d2d385a3bec86cd1`. This candidate still needs its exact native build and downloaded IPA verification; latest verified IPA is corrected Extrude run 37108274789 at 761d62a. No Bevel visual preview or device acceptance is claimed.

Build this exact coherent source once, fix actual native failures and verify the downloaded full archive/arm64 bundle/entire packaged UI. Focused device checks remain selected edge/vertex → native Bevel → outward drag → lift → Undo/Redo, preview → two-finger/Pencil-menu/hardware interruption → rollback, multi-object/shared meshes, custom profiles, shape keys and portrait/narrow settings fit. Preserve accepted Inspector/Pencil mappings, native editors, external input and Files. Continue the full goal without waiting for device feedback; import expansion stays deferred. See TOUCH_MODELING_NEXT.md for the original pinned audit and new evidence.

## Verified direct Extrude IPA — 2026-10-03

Exact-source [iOS run 37108274789](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/37108274789) at `761d62a8eec32ffac10fa16c75d2e09aeb638ebe` passed cloud preflight, native Release compilation, packaging and upload. Artifact `Blender-iPad-Unofficial-ipa` id `11268624242` has GitHub archive size 248,471,616 bytes, digest `sha256:00c2c1e9552b584ffb19baba0be62940d490d2e42d433badebd513be7279c1d0`, and expires 2027-01-01T08:01:05Z. Downloaded IPA is 248,471,448 bytes, SHA-256 `8a0058ac801f519101734c47c6f9b26fc44b9c472ba587ca8d17ea9ec9004bef`. Full CRC across 3,368 entries, arm64 iPhoneOS bundle/Mach-O, startup resources and preserved Files/library/recovery markers pass. The entire packaged interaction Python matches this exact source, including the Extrude cue and prior selection, transform, Fine and Numbers controls. Its shipped patch SHA-256 is `d76b55e1ca07275d5d30f35612fa671fdc35abb3854a27cc2e8919055ef4edd2`.

Select a mesh face, choose native Extrude Region in Tools, drag with finger/Pencil and lift to finish. Initial interruption restores native independent BMesh backups. Cancelling an accepted extrusion's redo-handle adjustment recovers that accepted edit through guarded native Redo after child/operator/gizmo/event cleanup. Registered operator/Undo-step identity, history generation, original viewport and all Mesh owners bound that recovery; cross-Main or changed-history paths remain refused. Hardware input, accepted Pencil ring/mappings and Inspector are preserved. All 69 source host tests and 83-file preflight passed for the packaged source. Stock host geometry/checkpoint and tool/header checks are supporting evidence only; there is no actual iPad acceptance or visual preview.

Older source a9f0f28 also compiled/packaged in run 37093936400, but lacked the later active named-step guard. Use corrected run 37108274789. Continue independently with actual interaction and defer import expansion; device acceptance remains face → drag → finish/Cancel → one-step Undo/Redo and accepted edit → redo adjustment → Cancel, including multi-owner meshes, shape keys, Pencil menus and hardware handoff. Earlier source-candidate/build-uncertainty entries below are historical.

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
## Interaction priority restored — 2026-10-02

The user says development has focused too much on import and wants progress on actual interaction. Deliver the next increments through selecting, moving/rotating/scaling, navigating, cancelling and undoing on the iPad. Keep Files work intact and defer further Portable Project Copy/import expansion unless a regression needs repair. A correct file pipeline does not establish comfortable everyday editing.

The first candidate makes a selected native transform tool own a direct finger/Pencil drag, with release to confirm and UIKit interruption to cancel. Two-finger orbit, pinch zoom, existing non-transform finger navigation and external input remain. Stable panel geometry lets the first editing stroke reach its tool; it is no longer consumed only to dismiss open panels. Header Undo/Redo make edits immediately reversible. The native tool/gizmo operators and their constraints are preserved. Source and package checks cannot establish whether this feels comfortable on the device.

## Multi-library folder package — 2026-10-02

Run 36957402486 at 79a265f passed native iOS Release build and downloaded IPA checks. A Link/Append Files folder with several `.blend` files now offers a native choice while retaining the folder's relative assets. Device interaction and provider behavior remain unverified; the accepted single-file chooser, Pencil mappings, Inspector, native editors and external input remain. Keep the main project plus linked-library portable-copy outcome separate; see `PORTABLE_PROJECT_COPY.md`.


## Library folder package — 2026-10-01

Run 36952644773 at 1abeea2 passed native iOS Release build and downloaded IPA checks for a Link/Append Files folder choice that retains relative assets around one `.blend`. Device provider behavior is still open. The original single-file chooser and accepted Pencil/Inspector remain. A saved main project still needs a separate portable sharing workflow for linked libraries; do not call this snapshot a portable project.

## Provider-backed Recent package — 2026-10-01

Run 36926276105 at 675badc passed native iOS Release build and downloaded IPA checks for a Files-backed Open Recent refresh and safe asynchronous Save-before-switch. Device provider behavior and touch comfort remain open. Continue complete Files, library portability and everyday iPad usability without treating packaging as acceptance.

## Cancellable Files preparation and complete library visibility — 2026-10-01

After a model or library is picked in Apple Files, show a native Preparing
sheet while Blender copies it. Cancel leaves the workspace in place; an access
or storage failure explains why no file opened. Publish a library in visible
`Documents/Libraries` only after its hidden staging copy completes, and clean
abandoned staging on launch. Keep the user-confirmed Link/Append chooser and
native editors. Exact-source IPA run 36889708972 passed native build and
package checks; the new sheet has no device comfort report. Provider-backed
Open Recent still needs to compare its Files original before reading the local
working copy.

## Focused Link/Append device response — 2026-10-01

The user reported "works" for the current run's Files-to-data-block chooser
and save/reopen question. Keep that working interaction. Continue native Files
lifecycle and broader iPad acceptance without treating a short answer as a
full provider, multi-select, options or external-input test.

## Current Link/Append IPA — packaged, device check open, 2026-10-01

Exact-source run 36850574490 at 5e1a693 passed native iOS compilation,
packaging and downloaded IPA checks. The iPad Link/Append route now begins in
Files and shows a simplified in-library data-block selector with search,
category back, All/Clear and options while keeping Blender's native data
handling. Device comfort, provider refresh, portability and full Files
lifecycle remain open; keep those distinct from packaged-build evidence.

## Verified Link/Append bridge and data-block chooser refinement — 2026-10-01

The first Link/Append bridge compiled and packaged in exact-source iOS run
36848386081; the downloaded IPA passed integrity and bundle checks, with
iPad behavior still unverified. The next source candidate removes the left
filesystem shortcut list after Files has already chosen the `.blend`, and
puts Search, category back, All/Clear and Options in a compact top bar. It
keeps the native Blender data-block list and operator options. Source checks
pass; this refinement needs its own build and device check. Linked libraries
are durable app-owned snapshots, so provider refresh and project portability
remain unfinished.

## Link/Append Files bridge — source candidate, 2026-10-01

Link and Append now begin with Apple Files selection of a `.blend` and keep a
durable app-owned library snapshot before Blender shows the data blocks inside
it. This retains native multiselection and operator options while removing the
desktop filesystem search from the first step. The snapshot does not
automatically follow changes to the provider original; sibling assets and
device comfort remain open. Source checks pass; native build and iPad
acceptance are next.

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

Exact-source IPA run 35984874300 at 46bd48d passed native compilation,
packaging and artifact verification after one compile repair. It addresses
the user's device report of a too-wide Inspector and missing visible desktop
category icons. Ask for a focused iPad check of this package before choosing
the next interaction or visual change. Keep source implementation, host tests,
packaged IPA and actual-device acceptance separate. The full goal remains
active until the product outcome is satisfied.

## Independent continuation and import lifetime — 2026-10-01

The user renewed independent development and asked to continue without
waiting for hardware input, scheduling a resume near account usage resets
when needed. The verified linked-Files IPA still awaits provider/device
acceptance. Meanwhile, source work now guards the native model-import
picker against delayed callbacks reaching a freed or reused Blender
operator and cleans abandoned staging. It passed exact-source IPA run
36832783348, but is not an iPad usability finding. Continue the broader
workspace and Files outcome rather than stopping at this reliability increment.

## Next Files workflow increment — packaged, device check needed, 2026-10-01

A new Open Project from Files choice links a local working project to the
selected Files document so ordinary Save can update it. The existing Open
Project Copy and complete-folder import remain explicit alternatives. A
content fingerprint blocks a stale local project from overwriting a provider
file changed elsewhere; Save As is the recovery path. Source checks and exact-source native IPA run 36829384514 pass; iPad
provider behavior is pending. The route is single-file:
projects with relative sibling textures or libraries still need folder import
or packed assets. Do not call this complete in-place Files support.

## Device response to current Inspector — 2026-10-01

The user replied "seems fine to me" to the request to test IPA run
36818147730. This supports proceeding with the current Inspector layout
rather than changing it again now. The report is brief; it is not a detailed
acceptance record for the full touch/Pencil workflow, Files lifecycle, narrow
windows or external input. Keep those requirements open and pursue the next
source-backed usability gap.

## Saved-project Inspector sizing follow-up — 2026-10-01

Source audit after the verified 35984874300 IPA found that all side editors
shared one saved width. The 35% Inspector default therefore applied only when
no side width was saved; a saved project could still open Inspector at a wide
width inherited from Scene or another editor. Source e3a4eff gives Inspector
its own persisted width, using the compact default in older projects until
the user resizes it, without changing other side editors. The 39 host tests and
pinned-source preflight pass; exact-source iOS run 36818147730 passed native
Release compilation, packaging and IPA artifact verification. This addresses
a source-backed gap, not a report that the previous IPA failed on device.
Ask for a focused check of saved-project Inspector width, native icons and
overall feel. Device judgment remains open for both visual design and sizing.

## Device feedback and next design change — 2026-09-24

The user says the latest IPA generally works, while the Inspector opens large,
cannot be reduced far enough, and shows category names without the familiar
desktop icons. Restore Blender's native Properties icon strip as a persistent
category cue and keep a labeled current-category picker in the header for
recognition and direct choice. Let the Inspector open at 35% rather than 45%
of usable width and shrink to 280 rather than 360 scaled UI units, yielding
to narrow window bounds. Keep existing saved widths unless the user drags, and
leave non-Inspector side editors' sizing alone. Validate category visibility,
header/search access, content readability, resizing, and Scene-to-Inspector
switching in exact-source IPA run 35984874300. Packaging passed, but device
acceptance of this new layout is open. Do not treat the user's broader visual
comment as acceptance of the new layout.

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
