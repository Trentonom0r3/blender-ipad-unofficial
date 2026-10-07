# Pencil viewport View category: implementation audit

October 7, 2026. Latest package37674139551@cb77143 contains current-tool options and fixed Base positions; it does not contain this View category. Independent read-only review of pin d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e found the following contract. This is an implementation audit, not target interaction evidence.

The user wants everyday Pencil-only editing. A dedicated View category could place Frame Selection, Frame Scene, Top, Front, Right and Perspective/Orthographic within the existing ring vocabulary, with Base return. Use proper native icons, existing operator semantics and no extra permanent header/shelf chrome. Preserve native headers, Tools/home and contact-only browsing. Deep camera/Flythrough transactions stay deferred.

## Exact native semantics

- view3d.view_all and view_selected are exec-only, flags0 and FINISHED even for empty selection. Explicit use_all_regions=False. view_all center=False: center=True resets Scene.cursor in view3d_navigate_view_all.cc449.
- view3d.view_axis is exec-only, type must explicitly be TOP/FRONT/RIGHT; align_active=False and relative=False, native SKIP_SAVE booleans (view3d_navigate_view_axis.cc45/158).
- view3d.view_persportho is exec-only, no properties (view3d_edit.cc481-520).
- EXEC_REGION_WIN gives zero smooth duration through WM_operator_smooth_viewtx_get. INVOKE can return FINISHED while rv3d->sms/TIMER1 remains active (view3d_navigate_smoothview.cc348-357); force finishing existing smooth view463-466 can sync/autokey a camera.
- Frame operations can move/autokey a locked camera despite flags0. Axis/projection use ED_view3d_context_user_region, which can redirect a locked quad pane to another pane. RV3D_BOXVIEW can synchronize panes even with use_all_regions=False.
- view3d_utils.cc603 defines actual camera-lock admission: editable camera plus V3D_LOCK_CAMERA plus CAMOB. Reject camera projection in this bounded View route, not ordinary noncamera views merely because the checkbox is checked.

## Required connected admission

Freshly validate originating WINDOW/RegionView3D identity immediately after registered operator type resolution and before deferred dispatch. The existing13-field ActionOrigin does not include rv3d/projection/locks/smooth state. No retained old RNA/operator/region pointers across native operations. Guard both presentation and dispatch; exact operator properties must be prepared before dispatch.

Refuse CAMOB, existing sms/smooth_timer, linked BOXVIEW, and redirected user-region resolution. Frame commands must respect zoom/dolly locks; axis respects rotation locks; projection respects ANY_TRANSFORM. Preserve single-pane semantics, no camera/root-parent/autokey/history changes, no timer ownership hidden behind FINISHED. Do not widen deep camera ownership to finish this small surface.

Use POD numeric value receipts if native popup handles are extended: refresh memcpy-copies the handle. Or capture a bounded scalar View identity in the actual deferred operator record, with fresh proof before dispatch. Choose a coherent policy before implementation. Avoid disconnected helper work. Category enumeration/native ring allowlist, child origins, menu return and source registration must all remain connected.

Base currently has five permanent actions plus an optional tool shortcut. Additional permanent categories need stable slots even when the optional tool shortcut is absent. Own one deliberate placement change rather than shifting unrelated targets per context. At most9 Base entries, empty center/gaps, no placeholder buttons.

## Meaningful verification

Execute exact post-resolution admission source against same-owner projection/lock/timer changes, redirected quad target, changed rv3d identity and stale registered type. Check actual native operator properties/context and ordinary popup parity. Stock-host native EXEC should demonstrate changed view while mesh/object/cursor/camera/root-parent/keyframes and Undo stay unchanged. Inspect actual source UI contents/icons and measured labels; host layout is not patched target GPU geometry. Then build exact completed source once and verify full downloaded IPA. The connected implementation now follows this contract; see newest PROJECT_HANDOFF. Source/host checks pass; no native View build or device acceptance yet.
