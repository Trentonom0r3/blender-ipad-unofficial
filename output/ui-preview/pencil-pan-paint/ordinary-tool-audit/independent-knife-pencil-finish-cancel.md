Pencil-only native Knife finish/cancel exposure audit (source only)

Patch 40533b999524fc2ecbe84de08ca0591f76c69abb62db0310b4329f4c8c29bc1e; Blender pin d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e.

BOUNDED_SOURCE_EXPOSURE_GAP_NO_PENCIL_FINISH_CANCEL_PAIR_FOUND

No standard visible Pencil Finish/Cancel pair for a live Knife was found. Barrel double-tap can Stop the current cut, but it does not Confirm or fully Cancel after ADD_CUT has started. Status hints are labels; keyboard Cancel restores text and sends Enter.

no-visible-finish-cancel-pair
Within the inspected current standard iPad/native UI routes, no Pencil-visible Finish/Cancel action pair targets an active native Knife. This is a bounded source exposure gap, not a device-observed stuck state.
Source: space_view3d_ipad.py:714-810, space_view3d_ipad.py:1051-1160, space_view3d_ipad.py:1498-1575, space_toolsystem_toolbar.py:1115-1146.

corner-and-inspector
The registered corner HUD panels are Next drag (transform-only poll), Selection (Box/Lasso-only poll), and View. Native Knife Active Tool/Inspector/header draw_settings exposes occlusion, only-selected, xray, measurements, angle snapping and increment; it has widget=None and no terminal buttons. An ordinary new region button alone would not establish reachability because Knife modal receives input first and consumes mapped LMB/unknown events.
Source: space_view3d_ipad.py:720-810, space_view3d_ipad.py:1567-1570, space_toolsystem_toolbar.py:1115-1146, space_toolsystem_common.py:172-187, space_toolsystem_common.py:798-832, space_view3d.py:6249-6254, wm_event_system.cc:6246-6267, wm_event_system.cc:6285-6295, editmesh_knife.cc:4380-4413, editmesh_knife.cc:4556-4557.

status-hints-are-not-buttons
Knife knife_update_header publishes WorkspaceStatus Confirm and Cancel hints. The pinned uiTemplateInputStatus priority branch draws each WorkspaceStatus item with uiItemL_ex, then returns. They are labels, not a Pencil event source. The alternate WM modal keymap status path is also status display.
Source: editmesh_knife.cc:1062-1105, interface_template_status.cc:260-289, space_statusbar.py:9-17, wm_event_system.cc:9294-9342.

squeeze-does-not-cancel-knife
Pencil squeeze is ignored during screen contact/held mouse buttons; after contact it calls cancelPointerCapture then queues optional cursor plus PENCIL_TOOL_PALETTE, not Escape. WM maps this to PENCIL_TOOL_PALETTE KM_PRESS; it reaches modal handlers before ordinary WM keymap. Native Knife has no matching modal item or raw pass-through for this type and returns RUNNING_MODAL. Thus default ordinary active Knife does not gain a ring/Cancel route from squeeze. Existing paint-owner pre-dispatch is paint-specific and cannot be inferred for Knife serial0.
Source: GHOST_WindowIOS.mm:2005-2028, wm_event_system.cc:8501-8504, wm_event_system.cc:6209-6212, wm_event_system.cc:6246-6267, editmesh_knife.cc:4138-4181, editmesh_knife.cc:4453-4478, editmesh_knife.cc:4556-4557, blender_default.py:835.

barrel-double-tap-is-native-stop
Outside an already open ring, permitted Pencil barrel double-tap between contacts queues PENCIL_CONTEXT_MENU, which emits RIGHTMOUSE down/up. Native default Knife maps right press to NEW_CUT. Before any ADD_CUT no_cuts=true it cancels; once ADD_CUT set no_cuts=false, it only knife_finish_cut+MODE_IDLE and leaves the operator modal. The More Tools Knife launch uses wait_for_input=false, invokes ADD_CUT immediately, and therefore sets no_cuts=false at the first admitted stroke even if no useful geometry was produced. Barrel double-tap is a source-exposed Stop current cut route, not full Cancel or Confirm after cutting. An existing ring instead receives barrel Home.
Source: GHOST_WindowIOS.mm:1142-1155, GHOST_WindowIOS.mm:1980-2002, blender_default.py:6253, blender_default.py:7664-7672, editmesh_knife.cc:4364-4381, editmesh_knife.cc:4610-4619.

keyboard-is-text-only-not-escape
The iOS onscreen keyboard is requested by native UI text/numeric editing, not by Knife modal. Its Done sends Enter only while keyboard-active. Its Cancel restores original text and calls that same Enter generator; it sends no Escape. It is not a general Knife cancel control. No inspected visible iPad command keyboard launcher exposes Enter/Space/Escape for a live Knife session. An already-active text-edit keyboard cannot be assumed to dispatch Enter to Knife instead of its owning text edit.
Source: interface_handlers.cc:4400-4442, GHOST_WindowIOS.mm:2094-2111, GHOST_WindowIOS.mm:2176-2187, GHOST_WindowIOS.mm:2775-2792.

lift-and-navigation-not-terminals
Pencil up maps native ADD_CUT release, clears drag holding and continues Knife. Raw pan/zoom/rotate/wheel/NDOF pass through without confirm/cancel. Existing direct-tool POINTER_CANCEL is not interpreted by Knife; neither lift nor two-finger navigation proves whole-session Cancel.
Source: blender_default.py:6248, editmesh_knife.cc:4380-4413, editmesh_knife.cc:4438-4461, editmesh_knife.cc:4556-4557, GHOST_WindowIOS.mm:1742-1788.

Smallest coherent control contract

A compact, persistent Knife-active control pair in the existing viewport corner/exposed HUD area: Finish Knife and Cancel Knife. Show it only for the actual live original native MESH_OT_knife_tool modal, not merely because the toolbar tool is Knife. Keep native multi-cut input between explicit terminal actions. Do not redesign Base ring or make lift/squeeze/two-finger drag a whole-session terminal.

Finish Knife: Dispatch the native KNF_MODAL_CONFIRM semantic through the original registered Knife modal and ordinary WM status cleanup. Keep native finish+exit, empty-cut CANCELLED/no undo push, otherwise FINISHED/native history.

Cancel Knife: Dispatch native KNF_MODAL_CANCEL through the original registered Knife modal and normal WM cleanup. Preserve Escape semantics; do not call finish or emulate right-click NEW_CUT.

End current cut: Retain native right-click/barrel NEW_CUT semantics separately. A third button is optional; do not relabel this as full Cancel.

reachability
Reserve the actually presented button contact before Knife can treat LMB as ADD_CUT. A normal Python region button that sits behind the native modal does not prove usability. Hit admission must be limited to those visible rendered control bounds; reserve the complete press/motion/release stream so tapping a terminal control cannot add a cut underneath.

target_lifetime
Use copied window/area/region and original operator/type lifetime values plus presented generation, resolving a fresh unique live registered Knife owner at action time. Keep operator/handler pointers local only during validated WM dispatch; no retained old operator pointer and no replacement target. Rejected/stale UI contacts remain consumed until physical termination; do not become canvas input or act on a replacement Knife.

cleanup
Normal WM native FINISHED/CANCELLED result owns reports/history/operator/handler disposal and removes controls. If Knife ends or context/owner changes while a control contact is pending, retire that presentation and consume its remaining UI tail once. Do not synthesize an unleased mouse release or invoke the Knife operator again.

required_before_implementation
Review exact source owner binding, pre-modal UI hit routing and rendered fit at current accepted corner layout. Connected validation must execute actual native confirm/cancel/NEW_CUT/lift branches and normal WM terminal cleanup with stale owner/replacement UI tails. Exact package/compiled/device gates remain separate.

Preserved native meanings
Enter/Numpad Enter/Space: Confirm (finish+exit; empty confirm cancels)
Escape: full native Cancel/exit
Right mouse/barrel default context action: NEW_CUT; cancel only before no_cuts becomes false, otherwise Stop current cut+idle
Pencil release: stop drag holding, retain Knife modal and pending multi-cut session
Ctrl-Z: native per-cut undo; do not replace with global history pop
Native Ctrl/Shift/numeric/axis/cut-through/angle/depth handling remains independent

Evidence limits
No device or UIKit/WM runtime execution. UI fit/reachability on an actual iPad remains unproved.
No claim that every possible accessibility mapping, custom keymap, add-on or external OS feature has been excluded. This is the standard current source path, default native Knife map and visible controls inspected.
No universal geometry/rollback/history guarantee; controls must preserve exact native action semantics.
Line references use full reconstructed current overlay sources or exact pinned additional files, never stale Temp source.
