# Product direction and decisions

## Preserve the default Blender header; remove only added controls - 2026-10-07

The latest human clarification explicitly preserves Blender's normal top menu/viewport header and removes the added controls around Flythrough. This supersedes the previous caption-only replacement. The entire space_view3d.py overlay section is removed and its materialized file matches the exact upstream pin. draw_canvas_header remains an inert compatibility helper (False/no widgets), with no live header hook. Default Blender menus/controls draw normally. The custom Flythrough action is retained in the Tools ring tail with its existing icon; Native Controls still exposes the same native tool header. Canvas View is removed because no viewport-header replacement remains. Independent bounded source review verified exact-header parity and Flythrough's close-then-guarded-native-dispatch path, with no new blocker.

The two squeeze/hidden-scroll fixes from2497f49 remain unchanged. Its in-flight run37663357744 has passed native Release and reached postcompile packaging/cache steps; inspect before any replacement. That earlier source contains a caption-only header and **does not satisfy this latest clarification**, so do not present it as the final package. New complete source passes all204 host tests,97-file offline pinned preflight/diff,110 native/font label checks and an inspected actual stock-host default-header preview. Verification now requires the entire packaged default viewport-header module to match the pin. Patch SHA2561013d6efe8e41f9976c63dcff9f06fc3d1e147db40cc022dd06cf1a8703ddc66; Python6c0ed9e1f66431161841432dedd678073d029ef1073439dd55256e8291e23d9a. The source is currently uncommitted/unbuilt; commit/push the coherent clarification, build exact source once, fix actual failures and verify full IPA. No corrected iPad ring acceptance exists. Source/stock-host/package/device evidence stay separate.

The user's Save-seems-to-work feedback stays narrow; keep existing Color/sidebar/keyboard/Files fixes intact. Preserve native Pencil ring icons/home/empty center, squeeze/rotation/barrel Home, Inspector/editors/splits/hardware and bounded recovery. Prior extra-header-removal snapshots below are historical; latest human direction wins. Continue independently; full goal remains unfinished.

## Device-reported squeeze and dead-page regression correction - 2026-10-07

The human reports that after the latest ring package, Pencil squeeze opens nothing; top-bar controls can show a ring but selection and rotation do not work. They reject those duplicate top-bar controls. They also report **"Save seems to work"**, which is narrow positive device evidence, not acceptance of every older-project open/write/reopen case. The prior native/package success at756126e/run37638940238 is **not ring interaction acceptance**. Prior broad wording about the complete workflow described packaged source and is superseded by this actual device report.

Two source-backed integration gaps were reproduced. The exact pinned WM_operator_call_py adds Undo suppression depth for default Python undo=False even for non-Undo UI operators. The squeeze Python delegate therefore failed WM_event_ipad_mode_safe. It now calls call_menu_pie with explicit native undo=True semantics; the registered popup has no OPTYPE_UNDO, real enclosing editing depth and all modal/recovery/job guards still refuse. Native popup scrolling also treated hidden overflow inventory rows as linear menu rows, setting CLIPBOTTOM/TOP and UI_SCROLLED on visible edge tools. The actual draw receipt requires every visible button, so its publication stayed suspended. Tagged paged rings now clear retained scrolloffset and skip linear hidden-row extrema/scroll tests; all unrelated native menus/children retain the existing path. No context setter or provenance guard was relaxed.

Compact headers now show only the actual editing caption. Duplicate Ring, clickable-context, Controls, Ring UI and trial Shelf header buttons are removed. Canvas View in the Layout/Mode ring restores compact presentation after Native Controls; earlier full-header Bevel/Camera/Flythrough access remains. Source checks execute exact pinned Python bridge and current mode safety, actual popup scrolltest and refresh branch with43 retained/9visible buttons,10,000 old-flag/offset cycles and ordinary-popup parity. All **204 host tests**, **98-file offline pinned preflight**, diff check and exact packaged-font measurements of **110 labels** at44px/32px pass. A real stock-host caption-only header was rendered and inspected; adaptation/fit capability and target44-unit sizing remain modeled. UIKit delivery, patched native GPU/modal and device behavior are unverified. Canonical LF patch SHA256 **b9b8b9343d2747cd433e8377a9927d82c1face3081472a1e4997175dc61e45c4**; candidate Pythonf5aba49850de305bcedb3fd36feaf1808df27ae498efdd519621107f7516b213. Fixture: build/fixtures/pinned_python_operator_call.cc; cases: build/test_pencil_popup_integration.py; header evidence: output/ui-preview/pencil-ring-foundation/header/move.*.

Bounded independent review completed without a new blocker; it verified initial/refresh paths, projection, unrelated-menu parity and Canvas View reachability. The correction is currently uncommitted/unbuilt. Commit/push the coherent exact source, build once, fix actual native failures and verify the downloaded full IPA/arm64/entire UI/toolbar/native icons. Do not rebuild unchanged756126e or call the source fix device proof. Preserve all other Pencil/barrel/native-tool/empty-center/Inspector/editor/hardware/Files/recovery behavior. Import/deep-camera expansion stays deferred. Full goal remains unfinished; continue independently without waiting for device feedback.

## Full Pencil-first ring IPA verified - 2026-10-07

Exact source **756126e9cb78386096687cba7d133f0b77415d4b** passed native iOS Release in [run37638940238](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/37638940238). The full downloaded IPA passed archive CRC for3368 entries, arm64 executable/iPhoneOS bundle, exact whole interaction UI and patched toolbar, Base/native-header/Numbers markers, entire pinned native tool definitions and all129 literal native icon assets. Artifact11492841572 is248552303 bytes; IPA248552135 bytes, SHA256 a10c1c71e98f36fe5f572e0f82487485e6b75a86a29992d7f74423f65c02621a. Canonical LF patch SHA256507d7cc3306d7a467f56a6ccb7b550c3b1e656e3a14f6385965e65ac6e39a1c0. Download: C:/Users/tjerf/AppData/Local/Temp/blender-ipad-run-37638940238/Blender-iPad-Unofficial.ipa. Durable exact-source report: output/ui-preview/pencil-ring-foundation/ipa-37638940238-verification.json. This supersedes Mode37181963133 as the latest verified package; no iPad device acceptance is claimed.

This is the complete approved squeeze-to-Base/category/rotating native Tools increment, with current category Home on PENCIL-barrel double-tap, optional hover barrel roll, repeat-squeeze close, full measured upright labels, native icons and default-off trial shelf/reversible full-header recovery. It preserves the original valid Object/Edit nine home positions, empty center, accepted Inspector/native editors/splits/hardware/Files and bounded Extrude/Bevel recovery. The package also contains missing-brush Color poll/draw guards, shared native sidebar root/context/workspace admission, and connected owned software-keyboard Cancel/final bytes with valid empty/no-result semantics. All runtime/property/callback/input/disposal guards remain intact; no unchanged rebuild is needed.

The reported older-project internal Open and Save/Save As/Save Copy traceback is fixed at the audited source path and packaged, but the user's older projects/iOS provider writes are unverified. Whether earlier Save wrote is unknown. Original error reproduction and disposable stock-host Save/reopen remain host evidence. Focused device checks: squeeze Base; enter/rotate Tools and explicitly tap; Pencil-barrel double-tap Home and repeat squeeze close; mode/context changes; Numbers Done/empty/Cancel; open a copy of an affected old project internally, change one visible value, Save and reopen, then Save As/Save Copy. Record the first failure and exact build without assuming clearing the traceback proves file writes. Continue independent Pencil-first interaction work without waiting for feedback; import/deep-camera expansion stays deferred except regressions. Keep the full goal unfinished and use ordinary windows (78percent five-hour/28percent weekly at15:04UTC; reset17:37:42UTC/12:37:42PM Chicago; heartbeat12:45PM). Never use a free reset credit without explicit request.

## Exported gizmo header path correction - 2026-10-07

Exact run37636426674 at c000718897b30035960f37592956ed8cf3feb792 passed cloud preflight and Configure, then failed native Release at interface.cc71: WM_gizmo_api.hh was not found. The header exists in the pin under windowmanager/gizmo; the interface target links bf::windowmanager, whose exported root does not make the nested filename an unqualified include. Both gizmo includes now use gizmo/WM_gizmo_api.hh and gizmo/WM_gizmo_types.hh. The exact API/type declarations and all registry/RNA/owner guards remain unchanged. Log: .cache/ring-native-failure-37636426674.log.

Preflight now validates new WM includes at their actual exported pinned paths as well as BLI dependencies. All13 preflight checker tests, including the two new unqualified-refusal/qualified-resolution cases, and98-file offline pinned preflight/diff check pass. The previous full200-test behavioral suite passed at c000718; this correction changes only the two include paths and the checker, so no broader behavioral rerun was added. Canonical LF patch SHA256 **507d7cc3306d7a467f56a6ccb7b550c3b1e656e3a14f6385965e65ac6e39a1c0**. Next commit/push this correction and build its exact source once; fix actual remaining native failures, then verify the full downloaded IPA with the expanded exact-source/native-icon checker. Full Base/category/rotating Tools workflow, keyboard ownership and older-project Color/sidebar regression fixes remain connected. Latest verified package remains Mode37181963133@07938989bfcad34b323519ede65bfec7e968b914; no ring IPA or device acceptance exists. Full goal remains unfinished, with old-project Save success still unknown on the iPad.

## Native redraw declaration and connected keyboard text ownership - 2026-10-07

Exact run37630330486 at e3f37cca8bc7f2edfeafba40e6cfe03bbbb3f627 passed cloud preflight/Configure and the prior coordinate call, then failed Release with eight undeclared redraw/refresh calls in interface_region_menu_pie.cc. The source now includes their pinned declaring header ED_screen.hh. Redraw/input semantics and all ownership gates are unchanged. Full failure log: .cache/ring-native-failure-37630330486.log.

A bounded connected Numbers/input audit also found borrowed keyboard text: original Cancel text was autoreleased and final UTF8String bytes were read after clearing UIKit text. GHOSTUIWindow now owns original/final std::string storage, clears result validity per new session, copies final bytes before responder/text teardown, preserves valid empty text versus no result, and returns Failure without marking active when first-responder admission fails. Both actual native text consumers skip absent results and preserve the hardware/native buffer. Existing key/modifier/Done/EditEnd dispatch is unchanged; duplicate terminal causality was not established and no device symptom is attributed to it. Independent bounded review found no new concrete blocker.

All **200 host tests**, **98-file offline pinned-source preflight** and diff check pass at canonical LF patch SHA256 **3b134626ea6b0864252731a9c5566944ab49dbdc5484341eb3b995e5bb2b379f**. New connected source fixtures execute the modified keyboard methods and native end/EVT_TEXTEDIT branches for long Unicode/source replacement, Cancel, hide/fetch, empty text, later sessions, nil/failed activation and native-buffer preservation. UIKit properties/selectors/locking/responder delivery are translated fixture boundaries; this does not establish target autorelease scheduling, UIKit delivery, modal ownership or device behavior. build/test_ios_keyboard_text.py is included in cloud preflight. The IPA verifier now checks the entire exact pinned native tool definition module and all129 literal native icon assets in addition to full archive/arm64/entire interaction UI/toolbar/Base/header markers. This verifier still needs the successful ring IPA.

The older-project internal Open/Save/Save As/Save Copy regression remains a priority alongside the approved full Base/category/rotating Tools workflow. Whether the user's Save wrote is unknown. Exact original Color traceback reproduction, guarded poll and disposable stock-host writes/reopens passed earlier; they do not prove the user's old files or iOS provider workflows. Next commit/push this coherent correction, build exact source once, fix actual failures and verify the full downloaded IPA. Latest verified package remains Mode37181963133@07938989bfcad34b323519ede65bfec7e968b914. No new ring IPA or device acceptance exists. Preserve all Pencil/Inspector/editor/hardware/Files/recovery behavior; import/deep-camera expansion remains deferred. Full goal stays unfinished.

## Native contact coordinate correction - 2026-10-07

Exact run37626171193 at6ee601a919d6b4d44e0d3f82a89fb70959a70579 passed cloud preflight and iOS Configure, then failed Release with one reported error: GHOST_WindowIOS.mm139 passed UIKit's temporary CGPoint to pinned scalePointToWindow(CGPoint &). The source now captures a named mutable CGPoint and calls the unchanged native conversion API, matching existing callers. Contact lifetime, original presented generation, window/view checks, serials, ownership and scene shielding are unchanged. The prior generated RNA signature errors are absent from this failure log; full native completion is still required. Log: .cache/ring-native-failure-37626171193.log.

All **198 host tests**, **98-file offline pinned-source preflight** and diff check pass at canonical LF patch SHA256 **91e1d0ae7589f42dbbd653219998695d916c5743d3de71e26aa86bdc64ebba89**. New contact-source execution compiles the actual named-value call with the exact pinned mutable coordinate signature/body, verifies scaled/truncated contact origin, Pencil/direct admission, rejected old UIView, disabled capture and absent-window early return. Objective-C enumeration, location selector and type getter are translated fixture boundaries; this is not target UIKit delivery or native modal proof. Fixture: build/fixtures/pinned_ios_coordinate_contract.cc.

The actual stock-host regression runner now reproduces the exact original Color error ('NoneType' object has no attribute 'brush') in Object/Move, then verifies the patched poll safely refuses that same context. Earlier native Save/Save As/Save Copy write/reopen and active-copy-path checks remain host-only evidence; report sourcef41f622 and unchanged Color/paint selectors. It does not establish the user's older projects or iOS providers work. Keep that reported regression a priority alongside the ring. Reusable docs/PENCIL_FIRST_GOAL_PROMPT.txt now reflects the connected workflow and regression rather than a stale partial foundation.

Next commit/push this coherent native correction and build its exact revision once, fixing actual errors and verifying the downloaded full IPA/arm64/entire interaction UI/toolbar/native icons. Latest verified package remains Mode37181963133@07938989bfcad34b323519ede65bfec7e968b914; no ring IPA or device acceptance. Preserve the full approved Pencil-first workflow and every existing property/callback/input/recovery guard; broader import/deep camera expansion stays deferred. Keep the full goal unfinished and continue independently. Historical entries below retain their original evidence.

## Color fixture correction and actual host file-write check - 2026-10-07

Run 37625458964 at a3ad4f7147c377df64aeca4c0f945d55dad9a9b8 stopped in cloud preflight; iOS compilation was skipped. The generated-call and native sidebar tests passed. The Color test extraction accidentally included the next class after blank context lines were normalized in the unified diff. It now stops at the next class independently of blank-line encoding. The final normalized patch passes all197 host tests again and remains unchanged at canonical LF SHA256 f41f6226ca498dd38661f5ce8545bcb41e0a9dffa624d23d896e983ec86736f4. No production admission was relaxed. Failure log: .cache/ring-panel-cloud-failure-37625458964.log.

Actual stock Blender5.1.2 checks also pass for patched Color poll with real Object/Move, Sculpt/non-brush Move, native File Browser and reopened-project contexts. Native Save, Save As and Save Copy wrote disposable files; reopening verified the respective transform values, and Save Copy preserved the active path. This is host evidence with exact pinned paint selector and patched Color class, **not** the user's older files, target UIKit/sidebar draw or iOS provider Open/Save. Reproducible runner: build/validate_brush_project_regression.py; report: output/ui-preview/pencil-ring-foundation/brush-project-host-checks.json. Next commit/push the fixture correction and build that exact revision once; no ring IPA exists yet. Full Pencil-first goal remains unfinished.

## Native API build correction and reported paint-panel regression - 2026-10-07

Run 37596936984 at 715951d passed cloud preflight/Configure but failed native Release: generated RNA calls had one extra argument for prop_with_popover and one missing argument for prop_tabs_enum. The accepted default-true use_tab_style declaration was registered on the wrong API. It now belongs only to prop_tabs_enum, preserving FUNC_USE_CONTEXT there, both actual helper signatures, Inspector's False caller and the existing owned-property gates. The full failure log remains .cache/ring-native-failure-37596936984.log.

The human reports Color Picker poll line383 exceptions while opening some older projects internally and during Save/Save As/Save Copy; Files-app Open in Blender can open those projects. Whether Save actually wrote is unknown. The source now guards missing paint settings/brush in the actual Color poll and draw. More materially, iPad category discovery no longer polls every child/context-incompatible panel directly: it calls the same native panel_add_check used by sidebar layout. Roots, editor context and workspace owner are admitted before poll; failed regions are excluded before bootstrap/discovery. View3D and Image context selectors are factored from their existing native layout and reused exactly, including Image's nonnull empty array. Other supported working editor sidebars retain native null-context parity. This fixes the source traceback path; it does not establish that iOS provider opening/writing or the user's older files work.

All **197 host tests**, **98-file offline pinned-source preflight** and diff check pass. Six new source/fixture tests compile actual schema-derived calls and execute child/context/owner refusal, failed regions, native View3D/Image context arrays, missing settings/brush, non-brush/File Browser contexts, native color capabilities and poll-to-draw context loss. Independent bounded source review found no new blocker. Exact pinned common API/paint/admission bodies are fixtures; native registry, UI lists and context accessors remain fixture boundaries. IPA verification now also compares the entire packaged toolbar to exact materialized source. Canonical LF patch SHA256 **f41f6226ca498dd38661f5ce8545bcb41e0a9dffa624d23d896e983ec86736f4**; interaction Python is unchanged at 09bf199bd78e02a2c12c4669ca7e583c06241dfd91a546b7f6cb0a6a81a0f7aa.

Next build the exact coherent correction once and inspect actual native failures, then verify the downloaded full IPA/arm64/entire interaction UI/toolbar/native icons. Latest verified IPA remains Mode37181963133@07938989bfcad34b323519ede65bfec7e968b914; no ring IPA/device acceptance exists. Preserve the full approved Base/category/rotating-tools workflow and every ownership/input/recovery guard. Prioritize this reported open/save regression alongside the ring; broader import/deep camera expansion remains deferred. Continue independently with the full goal unfinished. Historical entries below retain their original evidence.

## Numbers CI fixture corrected; replacement build - 2026-10-07

Run 37596437285 at fce222e stopped in cloud preflight before iOS compilation. The Numbers lifecycle fixture omitted <cstdint>; Windows provided uintptr_t through an incidental include, while Ubuntu correctly refused it. The fixture now includes its integer types explicitly; all three affected source-executing tests pass again. Production WM_types.hh already includes <cstdint>, and the native patch/Python are unchanged. This is a test portability correction, not an iPad code or ownership relaxation.

Corrected exact revision **715951de4b64524115426652f73535047de0f6de** is committed/pushed and building once in [run 37596936984](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/37596936984). Exact headSha was confirmed; last observation at 09:00 UTC was complete cloud preflight success and native iOS/Xcode Configure in progress with no failed step. Inspect this replacement before any dispatch. Fix actual failures; on success download and run `python build/verify_compact_ipa.py 37596936984 715951de4b64524115426652f73535047de0f6de <download folder>` for full exact-source package verification. No ring IPA/native compile/device acceptance yet. Source patch SHA256 7b973f111cdd7abc24243532ff189367b20ae96422ad9e6e83bb5cc26595a8c6 and Python 09bf199bd78e02a2c12c4669ca7e583c06241dfd91a546b7f6cb0a6a81a0f7aa retain the 191-test/96-file/109-label/host-header evidence below. Latest verified package remains Mode run 37181963133 at 07938989bfcad34b323519ede65bfec7e968b914. Keep the full goal unfinished; later handoff changes are documentation only.

## Pencil-first native build dispatched - 2026-10-07

Completed source **fce222e07ff08f14767da964069b181bc762ce2d** is committed/pushed and building once in [run 37596437285](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/37596437285). Exact headSha was confirmed; first observation was preflight in progress. No replacement or unchanged build was dispatched. Git was clean after the source commit. Canonical LF patch SHA256 7b973f111cdd7abc24243532ff189367b20ae96422ad9e6e83bb5cc26595a8c6; Python 09bf199bd78e02a2c12c4669ca7e583c06241dfd91a546b7f6cb0a6a81a0f7aa. All 191 host tests, 96-file pinned preflight, 109 measured labels and exact native inventories pass; seven actual stock-header previews and independent bounded workflow review passed with target capability/sizing/modal/device limits retained.

This source enables the full approved Base/category/rotating native Tools workflow and turns the trial shelf off by default. It is not a new IPA or device acceptance. Inspect 37596437285 before replacement dispatches; fix actual cloud/native failures in current source, and on success download the full IPA and run `python build/verify_compact_ipa.py 37596437285 fce222e07ff08f14767da964069b181bc762ce2d <download folder>`. Verify full CRC, arm64/iPhoneOS bundle, entire exact interaction UI, Base/header return markers and native tool icons. Latest verified package is still Mode run 37181963133 at 07938989bfcad34b323519ede65bfec7e968b914. Later documentation commits do not change the building source. Continue independently; preserve the full unfinished goal and all accepted Pencil/Inspector/editor/input/Files/recovery behavior. Source/host/package/device evidence remain separate.

## Base-first Pencil workflow connected - 2026-10-07

The complete candidate now enters the approved Base ring from Pencil squeeze: Layout/Mode, Tools, Undo, Redo and Select. Native paged categories replace at the same canvas origin; history acts directly; repeat squeeze closes. Tools retains all compatible native inventory/group members, native icons and original Object/Edit nine home positions, with Native Controls and Base appended after the inventory. Selection/Transform options also return to Base. Circular contact browsing and optional hover barrel roll never activate tools; Pencil BARREL double-tap resets the current category Home. This is connected source, not a ready IPA or device acceptance.

The old floating editing shelf is off by default through a separate live scalar WindowManager preference, matched by native geometry and Python WINDOW Header poll. Shelf is an optional shared preference across adapted 3D viewports, reachable from the full/native header. The existing compact/expanded layouts and named stale-block/old-footprint shielding remain. Disabling between draw and queued input executes the same native teardown path while unrelated hardware input passes.

A supported adapted Object/EditMesh/Pose viewport with its tool header hidden now draws only Ring, the actual mode/tool/axis/Fine/Snap or selection caption, and Controls. VIEW3D_HT_header explicitly returns when handled instead of continuing into duplicate desktop chrome. Current native tool-header visibility is the per-viewport full-header return state: Controls and existing left-rail Settings restore it; Ring UI returns to the compact header. Saved projects/workspaces with visible tool headers keep their full interface until Ring UI is chosen. The read-only native Area capability proves enabled adaptation, one visible WINDOW, actual WINDOW and exposed canvas >=24 by14 UI units; unadapted/small/quad/maximized/Sculpt/Paint/broader modes retain Blender's complete header and Controls recovery. Camera/Flythrough and existing active-Bevel access remain on the full header.

Brush Access deliberately offers the native header handoff and does not draw broader BrushAssetShelf/active-tool templates under owned provenance. Those native templates remain outside the bounded Scene/Tool/Numbers profiles. Transform More retains the proven Pivot/Snap/orientation/Fine/gizmo properties, native Snap Options and pending Numbers. Existing property/parent/callback/disposal admission, active contact serials/presented generations, atomic native/GHOST draw receipts and recovery guards are preserved.

All **191 host tests**, **96-file offline pinned preflight**, diff check, exact target5.0 native-inventory checks on stock5.1.2 and **109 measured native/navigation labels** fitting44px text area/32px height pass. Canonical LF patch SHA256 **7b973f111cdd7abc24243532ff189367b20ae96422ad9e6e83bb5cc26595a8c6**; candidate Python SHA256 **09bf199bd78e02a2c12c4669ca7e583c06241dfd91a546b7f6cb0a6a81a0f7aa**. Four new source-executing cases cover actual Base invoke/override, native fit/occlusion/quad refusal, explicit enclosing-header continuation and default-off poll; the existing queued-input fixture now executes disabled-before-redraw. Seven real stock-host header screenshots include before, Move, Edit Mesh, native Controls, Sculpt, narrow and quad. Native adapted capability/fit and target44-unit sizing are modeled in those previews; they do not execute target compositor, UIKit/modal or device input. Reports are in output/ui-preview/pencil-ring-foundation; screenshots are header/*.png. Independent reviews corrected the missing declaring header, exposed-canvas fit, full-header recovery and Bevel reachability.

Source is still uncommitted/unbuilt at this checkpoint. Latest verified IPA remains Mode run 37181963133 at 07938989bfcad34b323519ede65bfec7e968b914. Final bounded independent native-path review found no new concrete source blocker; next commit/push coherent exact source and dispatch one exact native build, fix actual native failures and verify downloaded full IPA/arm64/entire UI/header/native icons with build/verify_compact_ipa.py. No new ring package or device acceptance is claimed. Preserve the full goal and local Transform cue, accepted Inspector/native editors/splits/external input/Files/Extrude/Bevel. Import/deep camera expansion stays deferred. Earlier entries below are historical.

## Connected native property construction and parent ownership - 2026-10-07

The uncommitted source now connects real property construction before first incoming metadata. The public UI preparation gate is called by Python UILayout property entrypoints, native prop/enum/menu overloads and the low-level ui_def_but_rna/propname backstop. It resolves literal fresh current Scene ToolSettings Pivot/Snap and all native Snap Options, four orientation slots, typed find-only translate/rotate/resize Fine and combined xform drag_action. Incoming owner/data/type/property addresses are comparison keys only; the whole PointerRNA is replaced with fresh ancestors, and the receipt is installed before widget metadata/getters. Unowned string overloads retain one native lookup. Unsupported owned search/tabs/decorators refuse before metadata, retaining the explicit native-controls fallback. The accepted Inspector use_tab_style API is preserved.

All admitted owned scalar/string/vector/array/update/clipboard/multi-number paths now rebind the actual receipt; detached RNA updates and separate Undo recheck it. Unknown self callbacks still refuse before writes/Cancel restoration. Owned numeric expressions use the pure native evaluator and refuse Python/drivers; selected-scene propagation/autokey refuse. General broad Brush/template trees remain unadmitted and need deliberate native header handoff before workflow entry.

Numbers initial construction now has an explicit scope seeded by UI_popup_block_ex's owned pending op and disposal capability. Registered Numbers metadata is protected through initial draw, block_end, handler registration and completed bind. A zero popup lifetime resolves exclusively through that active scope. Registered refresh retains its lifetime but uses the exact active constructor during the temporary new-first-block/null-handle gap, then binds completed fields. Scope expiration refuses old bootstrap receipts. Shapes are fixed to offset/factors vectors of three, scalar angle and enum axis; native operator history is not required. This remains bounded to the exact shipped static class.

Native enum children now carry a copied POD parent-button lifetime on handle/block, captured before refresh and installed before UI_block_begin. Refresh reacquires the current native button and rebinds its property before callbacks; enum draw and shortcut metadata never read the old raw argument first. Owned custom menu-step functions refuse. Per-field draw checks precede widget/GPU metadata, and both inner block and outer region refusal invoke the existing zero-draw native/GHOST retirement path. Retired generations cannot retain their previous capture. Independent review found and corrected the registered-refresh gap, parent enum reads and outer skipped-draw retirement.

All **187 host tests**, **96-file offline pinned preflight**, diff check and exact packaged-font/native-label audit pass at canonical LF patch SHA256 **70fb60bd26a2dd266e8cf187510797203ca6f88fd8905cd958d854e43d702852**. Candidate Python SHA256 **ee8cff9cd7e338693340bb83a3b18baa1aeffdcf6624d6a2586c0b9d391b10d6**. Five constructor cases execute literal profiles, typed backend refusal, actual scalar consumers and 10,000 initial/registered pending handoffs; four parent cases execute native lease membership/lifetimes, nested scope restoration and native enum steps. Source-executing draw checks exercise a missing WINDOW and the same zero-draw GHOST retirement route. Native RNA/UI/GPU/registry APIs remain fixture boundaries; this is not target UIKit/modal/device proof. All95 native labels fit44px text area/32px height. Durable evidence: output/ui-preview/pencil-ring-foundation/verification.json, host-tests.log and native-label-measurements.json.

Squeeze still opens legacy Tools. Full base/category/rotating entry remains gated and unbuilt; latest verified IPA remains Mode run 37181963133 at 07938989bfcad34b323519ede65bfec7e968b914. Preserve all local source including Transform cue and the accepted Inspector/native editors/input/Files/recovery. Next finish truthful broad native fallback, base-first entry/category returns and trial shelf reduction, real host UI evidence where feasible, then commit/push coherent exact source, one native build and downloaded full IPA verification. Do not build a partial foundation or unchanged Mode; keep the full personal Pencil-first goal unfinished. Earlier entries below are historical.

## Connected native self-callback policy and controls fallback - 2026-10-07

The uncommitted source now refuses unknown owned immediate self callbacks before outer apply/event frames, Cancel restoration, scalar/vector/string access, clipboard and multi-number/update paths. The shared Numbers guard also applies this independent callback policy. Only the actual native enum-expansion constructor can tag the pinned Snap normalizer; admission checks exact function, self argument, captured enum value, valid two-step Scene.tool_settings receipt, fresh RNA ownership and current ToolSettings owner/type/data. The compiled native Snap getter/setter use snap_mode; their update callback is null. Normalization stays inline before deferred RNA update/popup_check and preserves native Shift behavior. General property constructors remain unconnected, so Snap controls are not yet admitted through the new workflow.

Direct writable-property access refuses unknown functions and block handlers before exposing PointerRNA. Owned redraw migration compares complete value receipts before any custom identity callback and refreshes retained button receipts before update. Native type conversion explicitly retires and clears a copied old self function/arguments before the old button is freed; fresh explicit callback setters reset retirement. A read-only independent review found that clearing only the tag lost old self provenance; the actual conversion fragment now executes that correction in tests.

An actual same-context deferred-dispatch gap is fixed: earlier detached callback/popup_check can unregister or reload a later operator type. Registered wmOperatorType now has a nonwrapping runtime lifetime at all three native allocation sites. The Python whole-type wrapper preserves it across the dummy copy. Detached records capture numeric membership before reading metadata and own lifetime/name/srna identity; each owned dispatch reacquires the current registry immediately after other admission, rejecting removed/reloaded/reused registrations. Unowned native dispatch retains its route. This runtime struct is not persisted DNA. The actual after-function loop executes registry removal/reload fixtures and still disposes all owned storage.

Independent review caught a native allocation compile blocker: a default member initializer made wmOperatorType non-trivial while native MEM_callocN requires trivial construction. Its new scalar now has no default initializer; calloc and dummy aggregate initialization zero it, and all published allocations stamp it. The test rejects a default initializer and executes a trivial scalar layout and preserved wrapper identity. This is not a full native compile. Only the ordinary owned ui_apply_but_func route captures the new type receipt; alternate after-function creators and menu-letter/operator search remain unadmitted follow-up routes.

Transform More and Brush panels now offer an explicit Native Controls action before broader properties. It restores the originating viewport's native header/tool header. Fresh named operator and button-lifetime admission mark the current popup for native closure before queuing the visibility action; current direct children propagate OK to the owned non-KEEP_OPEN ring. The API itself does not close parents synchronously or establish arbitrary deeper KEEP_OPEN cascade. Stock Blender executes the registered action and verifies tool/mode/workspace/object transforms remain unchanged. Advanced broad Brush fields still require constructor admission or deliberate fallback before entry is enabled.

All **178 host tests**, **96-file offline pinned preflight**, diff check, exact packaged-font/native-label measurement and current candidate stock-host inventory/action checks pass at canonical LF patch SHA256 **b77746cf638f3c3793e755e65d899c82dbb24e4d13c40746f12f3d2550f5123a**. Candidate Python SHA256 **ee8cff9cd7e338693340bb83a3b18baa1aeffdcf6624d6a2586c0b9d391b10d6**. Six self-call, three fallback and two registered-type cases include 10,000 repeated executions. All95 native ring labels still fit44px text area/32px height. Reports: output/ui-preview/pencil-ring-foundation/verification.json, native-label-measurements.json, native-inventory-wiring.json and host-tests.log. These are source/fixture/stock-host checks, not target UIKit/modal/GPU or device proof.

Squeeze still opens verified legacy Tools. The full approved base/category/rotating workflow remains gated and unbuilt; latest verified IPA is Mode run 37181963133 at 07938989bfcad34b323519ede65bfec7e968b914. Preserve every local change including Numbers, original native icons/labels and Transform cue. Next connect fixed fresh Scene/Tool constructor profiles and all native property consumers, including upstream UILayout/Python entrypoints before first metadata and a bounded initial Numbers construction exception. Then finish base-first entry/category returns/shelf reduction, actual host UI evidence where feasible and one coherent exact-source build/full IPA verification. Keep the full personal Pencil-first goal unfinished; import/deep camera expansion remains deferred. Ordinary weekly usage is near exhaustion; use available ordinary windows and never free reset credit without human request. Earlier entries are historical.

## Connected pending Numbers consumers and disposal - 2026-10-05

The uncommitted native source now connects actual temporary Numbers buttons to OperatorProperties: fresh current WM ID, registered operator srna and op->properties. Completed buttons bind after UI_popup_handlers_add and before draw. Initial constructor reads are a bounded exception for the shipped static Numbers class, not generic preconstructor admission. Fresh registered popup lifetime, current WM/window/screen/temp region/first active block, nonterminal state, Main/UID/Undo runtime and typed existing IDP shape prove each binding. Scalar/string/vector access, widget update, event/apply entry, clipboard/array paths, multi-number edits, deferred RNA and separate Undo now carry or recheck this proof. Pending fields refuse selected-scene propagation and autokey.

Numbers Cancel/OK retire and close before execution or Python decref. Onfree detaches UI and queues context-free disposal until native event/handler/list frames return; wm_event_do_handlers flushes after final GPU_render_end. Pre-unregister hooks consume registered dialogs and queued owners before type metadata disappears, with numeric type guards refusing reentrant removal. Pending callbacks reconstruct current popup arguments and first active block instead of old button/block pointers. Failed initial context still owns cleanup. Handle receipts remain POD for memcpy. This is context-free disposal while guarded type metadata is alive, not recovery after type storage is already freed. Generic operators remain outside this profile.

Numbers text now uses Blender's native BLI_expr_pylike evaluator with zero parameters and copied native block-owned presented unit settings with fresh Scene membership. It preserves native unit normalization without Python/global-namespace fallback or driver creation. Supported arithmetic/math work; unsupported Python, tuple-sum syntax, input of 256 bytes or more, nonfinite values and incomplete array paste refuse. Vector paste requires complete finite values. The exact pinned parser executes in fixtures; allocator/vector and unit normalization are fixture APIs, not full native unit/modal/device proof.

All **167 host tests**, **95-file offline pinned preflight**, diff check and repeated exact packaged-font/native-label stock-host audit pass at canonical LF patch SHA256 **5e9f993fb2086676c7eafc31303fddd2a8c859665a6d3d0e3f05bd3389766785**. Five Numbers property/consumer cases, three terminal/type-disposal cases and two native expression/array cases execute shipped source, including 10,000 repeated cases. All95 native labels still fit44px text area/32px height. Candidate Python remains9be48d75a75db5150b7f6c640e20b8909c5bb5b4fd5d8610629fd4a7bc4f98a5. Reports: output/ui-preview/pencil-ring-foundation/verification.json and native-label-measurements.json. These are source/fixture/stock-host checks, not target UIKit/modal/GPU or device evidence.

Squeeze still opens verified legacy Tools. The full base/category/rotating workflow remains gated and unbuilt; latest verified IPA is Mode run 37181963133 at 07938989bfcad34b323519ede65bfec7e968b914. Preserve every local change including native icon/label work and Transform cue. General Scene/Tool/Brush RNA helpers remain unconnected to native constructor/read/write admission; helper leases do not protect enclosing self-callback apply/event frames. Next connect these bounded actual consumers and callback policy, then base-first entry/category returns/shelf reduction, host UI evidence where feasible and one coherent exact-source build/full IPA verification. Keep the full personal Pencil-first goal unfinished; import/deep camera expansion remains deferred. Work until about95percent ordinary five-hour usage, checkpoint and resume near ordinary reset; never use free reset credit without human request. Earlier entries are historical.

## Native ring contacts and popup handoff — 2026-10-04

The human means **double-tap on the Pencil barrel**, never touchscreen double-tap. The full personal Pencil-first goal remains active. The uncommitted native candidate now connects actual-origin direct/Pencil contact packets and matched Begin/Motion/End/Cancel to the last drawn ring page. Per-contact serials and original presented generations prevent an old terminal from releasing a newer contact; captured old streams stay shielded from the scene or a replacement ring. Circular rotation and snap never select; taps resolve the same drawn item only after lift.

Native taps use Blender's ordinary press/release button handler, preserving apply, popup return, deferred operator and Undo ownership. The earlier EVT_BUT_OPEN-only helper did not apply ordinary tool buttons and was corrected. A live native child suspends both UIKit capture and the value-only native contact/roll state, while Pencil-barrel Home still reaches the parent. Navigation refresh cancels old active/semi-modal states before migration; ordinary parent refresh preserves a native child. Dispatch requires the active first block and an unretired matching native popup handler before reading its saved context. Owner loss exits the outer handler without old menu access. Scoped admitted cursor coordinates place native dialogs at the tap and restore only a live unchanged cursor; hardware button/modifier state is not synthesized.

Final same-source validation: **125 host tests**, **89-file offline pinned preflight**, diff check and exact packaged5.0 toolbar/candidate routing on stock5.1.2 pass. Canonical LF patch SHA256 **dd9d0fde164418a760720bfe725edfd5d70a8d3d59d702d07d682080b0ffed20**; candidate Python SHA256 **9be48d75a75db5150b7f6c640e20b8909c5bb5b4fd5d8610629fd4a7bc4f98a5**. Six new source-executing contact/activation/registered-dispatch fixtures include 10,000 repeated contact pairs, stale release, Cancel, redraw, child suspension, native But transitions, owner loss and safe context/cursor restoration. They do not execute UIKit or the target modal/GPU lifecycle. Durable report: output/ui-preview/pencil-ring-foundation/verification.json.

Preserve all local work and the Transform cue. Squeeze still opens verified legacy Tools; no new ring build or device acceptance exists. Latest verified package remains Mode0793898/run37181963133; HEAD eb12d7c is documentation/validation only. Next propagate value-only origin ownership through advanced native popup/RNA/function paths, implement hover-roll packets and measured full native labels, then finish coherent base-first entry/category returns and shelf reduction. Native uiPopupBlockHandle refresh uses memcpy: any propagated receipt there must be trivially copyable, without a std::string/container ownership hazard. Finish meaningful checks and actual host UI evidence where feasible before committing/pushing/building this complete workflow once; do not build a partial foundation or unchanged Mode. See PENCIL_RING_NATIVE_INTEGRATION.

## Native ring pages and Pencil barrel reset — 2026-10-04

Human clarification is explicit: **double-tap on the Pencil barrel**, never screen double-tap. The uncommitted source now has shared exact menu classification/anchoring, variable native radial pages with nine visible choices, stable common origin/extent, full compatible tool/brush routes and original Object/Edit home order. General deferred operator receipts validate live context plus the page's native tool identity; intentional Box/Lasso changes rebase only after observing the exact requested native tool.

Actual native popup drawing now publishes rounded button rectangles/identities and generation after widget/BLF flush. Missing/clipped/rejected redraws revoke admission; native/GHOST values commit together. Cached frames retain receipts. Refresh cancels active/semi-modal buttons before native migration without freeing the old block itself. Matching-lifetime teardown cannot erase replacement capture. Native window-height validation protects GHOST coordinate conversion. Repeat squeeze/Escape/deactivation close before the draw gate.

A dedicated event owns Pencil-barrel Home provenance from UIKit through GHOST and an independently allocated wmEvent payload. A global queued-event guard consumes retired/replaced/malformed receipts before any scene/new-popup route. Current-category Home resets navigation phase and invalidates an old contact, without invoking scene/tool/history operations. Outside a presented owned page, the existing Pencil right-click path remains. These are unbuilt source/fixture checks, not target gesture or device evidence.

Canonical LF patch SHA256 **261ed0dae01bde319bc699ba3d5a4db969e0e6141e6bb5ebea6d4e1ac09f6b5f**. All **119 host tests**, **89-file pinned preflight**, diff check and exact packaged5.0 toolbar/candidate routing on stock host5.1.2 pass. Candidate Python SHA256 5b77483da1455a19cb72c5d05992dfb627e183d9f8bf9489fd5d545f994ffbeb. Durable evidence: output/ui-preview/pencil-ring-foundation/verification.json. Preserve the Transform stroke cue and all local work.

The existing squeeze entry still opens verified Tools. Native circular-contact/tap dispatch, hover-roll packets, measured full labels, advanced callback ownership and coherent base-first entry/shelf reduction remain required before building. See PENCIL_RING_NATIVE_INTEGRATION. Latest verified IPA remains Mode0793898/run37181963133; no new native build or device acceptance. Do not rebuild Mode or dispatch a standalone partial foundation. Continue the full goal independently.



## Pencil ring native foundation — 2026-10-04

Final same-candidate validation: all105 host tests and88-file pinned preflight pass; git diff --check is clean. Evidence report: output/ui-preview/pencil-ring-foundation/verification.json. This is unbuilt foundation source; native integration and exact-source IPA remain required.

The active goal approves the base/category/rotating-tools workflow and provisional current-category home reset. Human clarification: double-tap means the gesture on the Pencil barrel, never a touchscreen double-tap. The local candidate now includes native context-filtered inventory/category/brush-access routes, guarded native tool activation, a value-only presented-input browsing state and a separate GHOST per-window ring receipt registry. Existing squeeze still enters the verified Tools ring; new category/inventory drawing and registry/state are intentionally not admitted until native popup/Pencil integration is complete. Preserve the prior Transform stroke cue and all local work.

Canonical LF patch SHA256 f50a84c00873952e83785d7996fdd297c541e9bd28d2022a6f84eb340769d3e5. Seven source-executing browsing/registry checks and 88-file pinned preflight pass. Exact packaged 5.0 tool definitions on stock Blender 5.1.2 confirm Object20/EditMesh43/Sculpt34/VertexPaint8/WeightPaint11/TexturePaint10 tools, original Object/Edit home order, native icon definitions, brush-asset routes and actual guarded tool activation/refusals. These do not execute target popup/gesture/roll lifetimes. Latest IPA remains verified Mode0793898/run37181963133, with no new build or device acceptance. Continue the coherent native integration in docs/PENCIL_RING_NATIVE_INTEGRATION.md; no standalone foundation or unchanged Mode build.

## Pencil roll browsing and contextual double-tap proposal — 2026-10-04

The user enthusiastically supports the rotating native-icon ring and proposes Pencil barrel roll for browsing plus double-tap to reset the ring. Explore roll as optional open-ring hover input; preserve circular drag and explicit tap selection, the existing Tools appearance and nine visible slots. Canvas double-tap remains native context/right-click. Open-ring reset is proposed; an optional clarification is pending on whether it returns the current category to its home view or returns to the base manipulation ring. The current-category home view is the recommended provisional interpretation, not a confirmed user answer. Do not change scene state, tool preferences or Undo history through reset. See docs/PENCIL_FIRST_RING_DIRECTION.md for the bounded gesture contract and Apple guidance. No native roll/reset source or device validation exists yet.

## Confirmed Pencil hierarchy; preserve native Tools and rotate overflow — 2026-10-04

The user confirmed the base manipulation ring concept ("Pretty much, yeah") and clarified that the current Tools ring is already good: preserve its appearance, proper existing Blender tool icons and familiar nine-tool home layout wherever those tools are valid. The previous concept's substitute glyphs are not a new icon system to implement. The user prefers exploring a rotating ring for additional tools over enlarging every radial menu to ten slots with a More button. Adopt nine visible slots and rotational overflow as the next reversible design direction; the initial five-category base remains fixed when it fits.

Circular Pencil drag should reveal additional compatible tools in the same footprint, keep glyphs/labels upright and snap to stable positions on lift. A rotation must never activate a tool; ordinary taps retain native tool selection and active-tool context access. Keep the original nine as the Object/Edit home view, and derive overflow from the actual native context's tool definitions, including grouped variants. Sculpt/Paint and other editors require their valid native tool inventory and existing brush/asset selection semantics, rather than a global nine-tool whitelist. A workspace name alone is not editing context. Refresh or close on mode/editor/owner changes and validate the presented native item before deferred action. Squeeze still closes the current ring; double-tap stays native context/right-click. Preserve the center, accepted Inspector, native editors/splits, hardware/Files and safe modal/Undo ownership. Improve measured label fit without a cosmetic tool/icon redesign.

The native-icon interaction prototype is C:/Users/tjerf/.codex/visualizations/2026/09/14/01a09e01-9bdd-7ac1-81bf-66b1660c4d7b/rotating-native-tool-ring.html. It uses original triangle icon geometry/colors and native tool definitions from verified Mode IPA run 37181963133 at 07938989bfcad34b323519ede65bfec7e968b914. Its Object/Edit lists are illustrative eighteen-tool subsets; it is not a complete native inventory or an iPad implementation. Browser checks cover nine visible choices, ordinary taps, circular drag revealing extras without selection, mode reset and readable nonoverlapping 768/320 layouts. Next audit the native popup/presented-layout/queued event/Pencil gesture lifecycle, then implement a coherent Pencil-first base/category/overflow increment with meaningful checks and one exact-source build. No unchanged Mode or standalone stroke-cue build is needed. The uncommitted Transform cue remains intact at canonical LF patch SHA-256 3920cf35cc071e490269738fe098cdfdb514b1fcad42935bd0682f83a60830e5 (98 host tests/87-file preflight, no native build). No new device acceptance is claimed. The initial confirmation hold is resolved; resume independent development under this direction. Earlier confirmation-hold and Tools-base preservation entries are historical.

## Human direction — Pencil-first base manipulation ring, 2026-10-04

The user now explicitly prioritizes a personal Pencil-first Blender workflow: everyday creating, selecting, manipulating, mode/workspace changes, precision and Undo/Redo should be possible without a trackpad or hardware keyboard. Preserve native Blender editors, accepted Inspector, double-tap context, existing Files and safe native operation ownership; hardware compatibility remains supported but is no longer the design priority. This supersedes the earlier requirement that squeeze's first ring must remain the nine tools in their existing base positions.

Squeeze should open a base manipulation ring, initially Layout/Mode, Tools, Undo, Redo and Select, with up to nine available slots and no obligation to fill or permanently fix the set. Category choices replace the current ring at the same origin with their options: Layout/Mode exposes radial mode/layout choices; Tools exposes tool choices; Select exposes selection controls; subsequent tool modifiers use the same radial vocabulary. Undo/Redo are direct actions. Repeat squeeze closes whichever ring is open. Prefer this hierarchy as the primary surface over the trial floating shelf. Keep full labels/icons readable without the photographed ellipses; aim for a footprint between the original small Pencil ring and the newer large finger ring, using measured wrapping and bounded font fitting rather than unlimited shrinking. Exact slot ordering, extra categories and return navigation are still illustrative.

The user requested confirmation of understanding and a lightweight concept before research/planning or implementation. output/concepts/pencil-base-ring.html shows the proposed base, category replacement, Tools → Move → X/Fine and squeeze close/reopen; it is a clickable concept, not native/device evidence. Record this direction now and hold production implementation/build dispatch until the user confirms the concept. The working goal remains unfinished. Latest verified IPA is Mode run 37181963133 at 07938989bfcad34b323519ede65bfec7e968b914, with no device acceptance. The later local Transform cue candidate remains intact and uncommitted, with 98 host tests and 87-file preflight passing; it has no native build and is deferred while this direction is confirmed. Its canonical LF patch SHA-256 is 3920cf35cc071e490269738fe098cdfdb514b1fcad42935bd0682f83a60830e5. Earlier implementation-next entries below are historical.

## Verified touch Mode IPA — 2026-10-04

Exact-source [run37181963133](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/37181963133) at`07938989bfcad34b323519ede65bfec7e968b914` passed native Release and downloaded full CRC across3,368 entries, arm64/iPhoneOS5.0.0 bundle, entire packaged interaction Python equality, Mode chooser/current-mode native markers and preserved radial/transform/Bevel/Files/icon checks. It adds the touch-sized Mode button beside compact context and a separate native compatible-mode chooser with current-state feedback; Sculpt/Paint/small/quad fallback uses the native header. Familiar Pencil squeeze presentation and accepted Inspector/native editors/hardware/Files remain. No iPad device acceptance is claimed.

Canonical LF patch SHA256`e00720f09a3ccea5a06b2124344e8c300b23cab619d280972df144968de5ac65`; WindowsCRLF`dedc2690638641d4b380d05a0011f2e612605de8beb1280672f022a2edcf58cf` matches after normalization. IPA248,489,272 bytes, SHA256`0b61246e87bd015d00e2bd3df06fe9c137f8caefa221fbff053cdda6f18bb41c`. Artifact11295752353 metadata248,489,440 bytes, digest`sha256:f22904d885fd24c6fdc0316f443a05d67f370ec75d06fde65e88cf21e8d9ed1a`, expiry2027-01-02T06:09:08Z. Durable report: output/ui-preview/mode-access/ipa-verification.json. Initial1cbdb85 failed on an invented uiStyle.widgetlabel field; corrected source uses pinned widget. The six source-executing Mode tests now also compile independent exact uiFontStyle/uiStyle declarations from pinned DNA_theme_types.h, preventing that model from inventing API fields. Prior94 host suite and87-file preflight passed; final Python is unchanged from five actual host previews. These are source/host/model/package checks, not device/modal proof.

Continue the full goal without waiting for device feedback; no unchanged rebuild is needed. Next bounded perceptible interaction is a transient admitted Move/Rotate/Scale stroke cue, using the existing native drawTransformPixel callback and postTrans teardown. Audit explicit direct drag/release-confirm/non-macro admission and live value receipt before drawing; use observed TransInfo mode/constraint and truthful Lift to apply / Two-finger drag to cancel wording. Exclude keyboard/EXEC/redo/macro children and keep native header feedback when the capsule cannot fit. Box/Lasso, immediate orbit-handoff claims and broader camera transactions remain separate audits. See docs/TOUCH_STROKE_CUE_NEXT.md. No stroke-cue source or native build exists yet; a TEMP mutator is prepared but unapplied. Import expansion remains deferred except regressions. Earlier source-pending entries below are historical.

## Touch Mode native font correction — 2026-10-04

Exact-source run37168831561 at1cbdb85 passed cloud preflight but failed native Release: UI_style_get_dpi()->widgetlabel does not exist in pinned5.0 uiStyle. The source now uses the native widget font style, matching existing pinned label measurement. The source-executing geometry/layout harness also models the real widget member. Its six tests,87-file pinned-source preflight and diff check pass. Previous94 host tests and five previews remain parent-source evidence; the packaged interaction Python is unchanged by this C++ correction. Canonical patch SHA256 e00720f09a3ccea5a06b2124344e8c300b23cab619d280972df144968de5ac65.

Build this corrected source once, inspect actual native errors and verify downloaded IPA before calling Mode ready. Latest verified IPA remains compact-only run37163440151 at3ff7242; there is no Mode package or device acceptance. Preserve all prior interaction contracts and continue the full goal independently. The next bounded UX recommendation is a transient admitted-stroke apply/cancel cue; no cue source or completed native lifetime audit exists yet. Earlier pending/source entries below are historical.

## Touch Mode access — completed source, 2026-10-04

The current production candidate adds a 44-unit Mode control beside the compact status labels, keeping compact 336-wide/120-or-164-high bounds and the existing Ring/context/Undo/Redo/Expand rows. Narrow mixed Mesh selection uses V/E/F in the caption; full native Selection labels and advanced access remain. Expanded controls reserve the taller Mode band with 176/220/268 caps. Native dynamic mode names/icons are built by operator_enum in a separate owned variable-count chooser; measured label widths decide one/two columns, current native Object mode is marked, and rejected-fit choices close with the native header fallback retained. Selecting a mode closes before execution. This is an access/presentation increment to existing Blender modes, not a new modeling capability.

The adapted main 3D HEADER now reserves 2.2 UI units plus padding (48 logical units by default) and uses the same predicate for native 44-unit button layout. It stays constant across modes/shelf visibility to avoid header-fit feedback, and supplies the Mode route in Sculpt/Paint or failed-fit/split/quad cases. Other native headers/TOOL_HEADER/editors retain their sizing. Accepted Inspector, familiar nine Pencil tools/empty center/squeeze presentation, double-tap, hardware, Files and bounded Extrude/Bevel recovery remain preserved.

Native layout receipts now include live WM/window ID/Main/screen/area/WINDOW/Scene/ViewLayer/active Object/data/mode values. Mode actions copy their receipt before property transfer and popup destruction, validate again at the deferred native call, short-circuit rejected context before modal lookup, retain ordinary property cleanup and redraw observed state after native execution. Admission requires drained touch Undo recovery, no operator/gizmo modal owner, no moving transform/job/Undo depth. Native child mode operators retain Undo ownership; FINISHED is not assumed to mean the mode changed. No old Object/edit/popup/RNA pointers are dereferenced after execution. Six source-executing tests cover dynamic geometry, live identity/override/rebinding, current native button flags/failed fit, popup destruction/rejected property cleanup, modal/recovery guards and actual header allocation/layout. The full host suite totals 94 tests, and 87-file pinned-source preflight passes. Actual stock Blender 5.1.2 tool/context/Mode/header routing, Sculpt/Paint return and clean compact/narrow/mixed/expanded host UILayout previews pass; these are stock-host and modeled-source evidence, not target modal/device proof. Independent native/UX reviews found and resolved lookup ordering, enum namespace, narrow caption and header clipping issues.

Canonical source patch SHA-256 `6c2232494df2788057b1b653b67022b6bd121d8547d9b2cfa5c02fae3e868287`. Build this exact completed source once after inspecting live runs, fix actual native errors and verify downloaded full CRC/arm64/entire packaged interaction Python/Mode native markers and preserved icons. Latest verified IPA remains compact run 37163440151 at 3ff7242; it does not include this Mode increment. No Mode IPA or iPad acceptance is claimed yet. Preserve the full goal and continue independently without waiting for device feedback; import expansion/deep camera transactions remain deferred except regressions. Device acceptance remains mode choice → actual selection/transform → lift/Cancel/native Undo/Redo, current-state feedback, translated/narrow/portrait/split/quad fit, Pencil and hardware. Source/host/model/package/device evidence must remain distinct. Earlier source-next snapshots below are historical.

## Verified compact finger controls IPA — 2026-10-04

Exact-source [run 37163440151](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/37163440151) at `3ff7242950329bc27018de3bdfab66132fac327b` passed cloud preflight, native Release, packaging/upload and downloaded IPA checks. It replaces the full shelf by default with Ring/current-tool context/labeled Undo/Redo/Expand, keeps full controls optional, and gives finger ring routes larger targets while preserving Pencil squeeze's familiar nine tools, original base sizing and empty center. Narrow history remains adjacent; More is labeled; header fallback offers Ring and Collapse when expansion cannot fit. Expand/Collapse is a shared presentation preference across 3D viewports. Native context/properties and advanced access, accepted Inspector, double-tap, editors/splits, hardware, Files and bounded Extrude/Bevel recovery remain preserved. Presented-layout receipts and named native teardown close the queued-input gap. These are visible access/presentation changes to existing capabilities.

Canonical Git/shipped LF patch SHA-256 `c5529b6d53e1d330db3481959c91aeefed026bc95bdcc2c4eceb134252454d82`; Windows worktree `c09d0c84f7f8fd340baca0331119465ff5a1dfade615cb042a07bf1f2b1d0e30` matches after LF normalization. All 88 host tests, 87-file pinned-source preflight, stock Blender 5.1.2 native property/routing checks and actual host grid previews pass. `build/verify_compact_ipa.py` verifies the successful exact SHA, full CRC across 3,368 entries, arm64 Mach-O/iPhoneOS bundle com.unofficial.blenderipad 5.0.0, entire packaged interaction Python equal source, compact/finger/ring/anchor native markers, preserved transform/Bevel/Files markers and native tool icon assets. IPA 248,493,453 bytes, SHA-256 `8387dc2d887a26c4dcc9c171afd1071f9050bf3b8b275eb915121f73343ce30f`. Artifact `11288747154` metadata 248,493,621 bytes, digest `sha256:fbfe3c7a2b2c6595cdea4464f7f45d022e2e66756d1ef3bb3afb08cf56037cee`, expiry 2027-01-01T23:58:19Z. Download and metadata are in `%TEMP%/blender-ipad-run-37163440151`; durable report is output/ui-preview/compact-shelf/ipa-verification.json.

No iPad device acceptance is claimed. Previews in output/ui-preview/compact-shelf are actual stock-host UILayout in temporary popups, with the new native-only finger flag modeled; they do not show the target compositor/anchor or execute UIKit input. Focused device acceptance is compact/expanded taps not editing through chrome, larger finger ring vs unchanged squeeze/return, multiple preference changes, actual context, Numbers/More, narrow/portrait/split/quad recovery, finish/Cancel/Undo and hardware. Continue independently without waiting for this feedback. No unchanged rebuild is needed. The full goal remains unfinished. The bounded Object/Edit mode audit in docs/TOUCH_MODE_ACCESS_NEXT.md records the next visible caption chooser, actual native admission checks and separate variable-count layout, live owner/deferred-action receipt, selected-state and Sculpt/Paint header-return requirements. No production Mode source exists. Implement that coherent increment next; the current IPA contains compact/ring changes only. Import expansion/deep camera transactions remain deferred except regressions. Earlier source-pending/audit-only snapshots below are historical.

## Compact finger controls — completed source, 2026-10-03

The canvas editing surface is compact by default: Ring, the actual supported tool context, labeled Undo/Redo and Expand. Compact width is capped at 336 logical units, with height 120 or 164 for the narrow explicit rows; the optional full shelf remains capped at 736. Selection captions show native Box/Lasso, Replace/Add/Remove or Custom, and Mesh Vertex/Edge/Face. Transform captions show the actual native child/constraint/orientation/Fine/Snap. Context buttons use an ellipsis and open the same native touch-sized ring. Transform with no chosen child offers Action; Bevel offers its native options; unrelated tools omit misleading context and retain Ring/history/Expand. Advanced Selection is Expand → labeled More. Expand/Collapse is intentionally a shared WindowManager presentation preference across 3D viewports; a rejected-fit/shared header keeps Ring and Collapse reachable so narrow splits can return to compact. Native left-rail Tools is unchanged.

Finger Ring and context access carry an explicit owned native larger-target option through ring transitions. The Pencil squeeze route keeps its previous base sizing, familiar nine positions and empty center, including after returning from a context ring; double-tap remains native right-click/context. Exact ring menu admission and owned callbacks remain. Accepted Inspector, native editors/splits, hardware/modifiers, Files and bounded Extrude/Bevel recovery are preserved. This changes visible access and permanent canvas chrome; it does not add new Blender modeling capabilities.

Native per-WINDOW presented value receipts now bind padding hits and direct-edit exclusion to the last successful draw. Before button lookup, both ordinary and non-popup modal UI handlers invalidate changed preference/fit/poll/window/scale, retire only the named shelf and previous generation, return immediately, shield repeated old-footprint mouse/gesture input and forward outside/hardware input. Blender's existing UI_block_free → ui_but_active_free(onfree=true) handles active cancellation. Live dynamic RNA lookup requires scalar boolean and retains no PropertyRNA. Actual resolved button rectangles are checked before accepting bounds: native vertical layout resolve returns the starting x, so end.x alone was not overflow evidence. Normal native draw ordering publishes the receipt before rebuilding UIKit hit maps.

Canonical LF patch SHA-256 `c5529b6d53e1d330db3481959c91aeefed026bc95bdcc2c4eceb134252454d82`; Windows worktree SHA-256 `c09d0c84f7f8fd340baca0331119465ff5a1dfade615cb042a07bf1f2b1d0e30`. All 88 host tests passed, including five new compiled source checks for fit/cell widths, queued events through both handlers, named two-generation modeled cancellation, clipped translated occlusion, actual resolved-button overflow and finger-size transition propagation. The 87-file pinned-source preflight and git diff --check pass. Actual stock Blender 5.1.2 validates compact/full routes, native tool/selection/transform RNA, global toggle, adjacent narrow history, truthful advanced access, header recovery and preserved nine tools. Native grid previews are in output/ui-preview/compact-shelf; before.png is d64e64c's full shelf, the after cases use current Python. These are temporary stock-host popups, with the new target-only finger flag recorded by an adapter; they do not execute target anchoring, UI teardown or UIKit input. Independent native and UX reviews found gesture/empty-block gaps, ineffective horizontal-fit checking, unlabeled disabled history and advanced access; all were corrected.

This source needs one exact-source native Release build and downloaded full IPA/arm64/entire packaged UI/native marker verification. The latest verified package remains contextual radial run 37146992437 at d64e64c; it has no compact bar. No compact package or device acceptance exists yet. Continue the full goal independently, prioritizing perceptible canvas interaction; import expansion/deep camera transactions remain deferred except regressions. Preserve all prior contracts. Device acceptance remains finger/Pencil ownership, Expand/Collapse in split/quad/portrait, larger finger ring and unchanged squeeze, actual context, Numbers/More, finish/Cancel/Undo and external input. Earlier audit-only/implementation-next entries below are historical.

## Compact finger shelf — native input audit checkpoint, 2026-10-03

Latest source/package remains verified contextual radial d64e64c, run 37146992437; Git was clean and live build inspection confirmed success. No production code or compact layout was changed in this continuation. Independent native review found a queued-input race that must be fixed before Expand/Collapse: native buttons retain last-drawn bounds while shelf hit/direct-edit exclusion currently recomputes desired bounds. RADIAL_FINGER_ACCESS_NEXT.md now records per-WINDOW presented receipts, guards before button lookup in both ordinary and modal UI handlers, shelf-specific cancellation/free, immediate returns and preservation of unrelated hardware input, plus guarded scalar-boolean dynamic RNA lookup. Redraw tagging alone is insufficient. This changes the next implementation action; it is source evidence, not a device result.

Continue the complete interaction milestone: implement the presented-state/teardown foundation together with compact default Ring/current-context/Undo/Redo/Expand, optional full shelf, touch-sized finger ring, truthful advanced access and header fallback; then run meaningful transition/geometry/host UI checks, exact-source native build and downloaded IPA verification. Keep all earlier preserved input/editor/Files contracts. Do not substitute this audit for the visible product change or rebuild unchanged d64. The five-hour account window is at 98 percent and resets October 3 23:10:38 UTC/6:10 PM Chicago; the active heartbeat is scheduled for 6:15 PM. Weekly usage is 77 percent. Keep the full goal active and do not use the free reset credit.

## Verified contextual Pencil radial IPA — 2026-10-03

Exact-source [run 37146992437](https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/37146992437) at `d64e64c9156fc0a767717ba6e65508b8a2551cc9` passed cloud preflight, native Release, packaging/upload and downloaded IPA checks. The first 2baec7a run 37145530578 failed on a missing DNA_space_types.h declaration; this corrected package supersedes it. Canonical Git/shipped LF patch SHA-256 `9e1f774bdc3f7b75a0e193836c8d15aaabc31dd379b1c515bb3f906859d6479c`; Windows CRLF worktree SHA-256 `d2b847483eac622e5859b603300718b44af51dc1be2a3b6ad1d162eba765698a`. These differ only in line endings, verified byte-for-byte after LF normalization. Earlier local-candidate digests describe the worktree bytes. All 83 host tests and 87-file pinned-source preflight pass; stock Blender 5.1.2 menu/property/geometry validators and actual grid-content previews support the unchanged Python UI. They do not execute the new target-native popup/refresh/input lifecycle.

Squeeze retains the familiar nine tools and empty center in normal ring layout. Tapping active Select/Move/Rotate/Scale/usable combined Transform (ellipsis cue) opens its controls in the same native ring style. Selection exposes Box/Lasso, Replace/Add/Remove and Mesh Vertex/Edge/Face; other supported selection modes get native All/Clear/Invert. Transform exposes Free/X/Y/Z, Fine, Snap, transient Numbers and native More. Settings stay open with fresh native active state so several preferences can be changed before dismissing and dragging; Numbers/actions close. Tools returns at the original anchor. Actual originating WINDOW, owned context/geometry receipts and exact native admission guard refresh and transitions. Pencil mappings, Inspector, native editors/splits, external input, Files and bounded Extrude/Bevel recovery remain preserved in source/package checks. These are access/presentation changes to existing capabilities; device comfort and acceptance are still open.

Artifact id `11282743186`, GitHub archive metadata 248,486,804 bytes, metadata digest `sha256:d6e74222206906b7d232f946b6b4a7ea6983415d3e50ca41c7fef74ac349d24a`, expiry 2027-01-01T19:11:29Z. Downloaded IPA 248,486,636 bytes, SHA-256 `c82d6603724c71cc1444a4d19185e4db7d9c9750e5a9ed31092876a4c4be6d4f`. Full CRC across 3,368 entries, arm64 Mach-O/iPhoneOS bundle com.unofficial.blenderipad 5.0.0, startup/Files/library/recovery markers, entire packaged interaction Python equal exact source, native anchor/popup markers and required native tool icons pass. IPA, artifact metadata and verification.json are in `%TEMP%/blender-ipad-run-37146992437`. Source-geometry diagrams and stock-host grid screenshots in output/ui-preview/context-rings are labeled supporting evidence, not an iPad ring screenshot or input proof. No unchanged rebuild is needed.

Continue the full first-class iPad goal independently, prioritizing actual interaction and the user's radial direction. The persistent expanded shelf remains a trial in this IPA. Next implement the compact default finger surface with optional expansion in docs/RADIAL_FINGER_ACCESS_NEXT.md: cap width and height, distinguish Ring from native left-rail Tools, keep Undo/Redo adjacent in narrow layouts, provide truthful supported context and advanced Selection via Expand → More, and retain a Ring launcher in native no-shelf header fallback. The base squeeze ring's current 26-unit heights are not a 44-unit finger guarantee; audit a native owned larger-layout option for the finger route while preserving squeeze presentation/order. Guard C/Python preference/fit agreement, stale blocks/hit targets and originating WINDOW/callback lifetimes before admission. Independent UX source review resolved four design-contract gaps; implementation remains next. Preserve accepted Inspector, native editors, Pencil mappings, hardware and Files. Import expansion and deep camera transactions stay deferred except confirmed regressions; TOUCH_CAMERA_NEXT requirements remain intact. Continue without waiting for device feedback.

Focused device acceptance remains: squeeze → active tool → several setting changes → dismiss/drag; actual active state; Numbers/More; second squeeze/gap Cancel; selection/axis/precision/Snap; split/quad/portrait/narrow fit; finish/Cancel/Undo and hardware. Packaging does not establish these outcomes. Earlier pending/failure/source entries below are historical.

## Contextual radial native compile repair — 2026-10-03

Run 37145530578 at 2baec7a passed cloud preflight but failed native Release compilation: interface_region_menu_pie.cc referenced SPACE_VIEW3D without its declaring DNA_space_types.h. The current source adds that header; no interaction design change is involved. Corrected patch SHA-256 `d2b847483eac622e5859b603300718b44af51dc1be2a3b6ad1d162eba765698a` passes 87-file pinned-source preflight, contextual geometry/receipt/persistence host checks and git diff --check. Earlier 83 full host tests and real host menu/property previews remain supporting evidence. Build this corrected source once and inspect actual failures, then verify the downloaded full IPA/arm64/entire packaged UI. No contextual radial IPA or device acceptance exists yet; the last verified package remains shelf run 37129200104 at ee2f351.

Continue the contextual Pencil direction and reassess the persistent shelf as a trial. Preserve nine tools, empty center, squeeze/double-tap, Inspector, native editors/splits, hardware and Files; import expansion remains deferred. The compiled source-geometry diagram in output/ui-preview/context-rings is labeled as modeled placement rather than a device rendering. Do not mistake this compiler repair for a visible usability milestone.

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
