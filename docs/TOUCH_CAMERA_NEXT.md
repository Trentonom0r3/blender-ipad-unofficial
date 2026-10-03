# Next native camera interaction — pinned-source audit, 2026-10-03

Prioritize actual touch/Pencil interaction while preserving accepted ring/mappings, Inspector, native editors, external input and Files. Camera header controls are implemented in the newer source candidate; exact native build/package status is in PROJECT_HANDOFF. No device acceptance or completed locked-camera gesture lifecycle is claimed. Import expansion remains deferred.

Pinned Blender d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e:

- view3d_navigate_view_camera.cc52–106 uses viewport camera, Scene when scenelocked, then active camera/first view-layer camera fallback; view changes retain prior view and do not move the camera. Do not block Camera View merely because Scene.camera is null when a local camera exists.
- view3d_view.cc60–121 aligns actual v3d.camera, preserves protected transform channels, polls editable camera/unlocked user region/outside camera view and registers native Undo. The Camera picker and lens controls must target that same viewport camera.
- rna_space.cc1048–1079/5234–5241/5411–5417 synchronize Scene from Space.camera only when scenelocked; use_local_camera is the native inverse scene-lock property. region_3d is the camera region in quad view.
- view3d_utils.cc603–606 requires editable v3d.camera plus lock flag and camera view for camera-follow navigation. Synchronization630–669 can move the camera's root parent when OB_TRANSFORM_ADJUST_ROOT_PARENT_FOR_VIEW_LOCK is enabled; target ownership/rollback must cover that parent chain and protected channels.
- view3d_navigate_view_move.cc88–100 and view3d_navigate_view_zoom.cc492–505 apply trackpad-style samples and finish immediately, potentially autokeying. UIKit begin/end/cancel currently has no continuous Blender transaction for those samples.
- view3d_navigate.cc638–649 explicitly pushes locked-camera Undo on successful modal navigation. The immediate invoke path577–596 lacks that push, so direct pan/pinch samples cannot be assumed to produce one Undo per physical gesture.
- ViewOpsData::state_restore106–171 restores viewport state and synchronizes the currently referenced camera, explicitly retaining autokeys. Generic view3d_navigate_cancel_fn654–658 only frees state; it does not invoke state_restore.
- Unlocked camera-view pan/zoom changes framing offsets/magnification; locked perspective zoom moves camera pose, while orthographic handling differs (view3d_navigate_view_zoom.cc334–340).

Next native source work must establish direct gesture phases/provenance from UIKit/GHOST to Blender, original window/viewport/Scene/view-layer/camera/root-parent identities, cancellation after operator cleanup, deferred or safely reversible autokeying, frame/history mutation guards, and one native Undo step per completed gesture. Do not use current camera pointers or synthetic cancelled release as proof of rollback. Do not silently redefine external trackpad/NDOF navigation, reuse model-tool DIRECT_TOOL indiscriminately, or assign UndoStack.step_active.

First audit exact GHOST trackpad/pinch constructors and recognizer interruption/ownership, native per-sample invoke and modal navigation dispatch. Capture geometry/transform ownership before the first sample; validate parent-chain and animated-frame changes before terminal work. Preserve native constraints and disabled/linked owners, root-parent behavior, camera offsets, orthographic/perspective semantics, autokey preferences and other editor input. Host modeling or explicit headless checkpoints cannot prove native touch lifecycle or device comfort.

The current header exposes existing native view/align/selector/Lens/Scale actions. A new lock-camera shortcut is deliberately withheld pending this lifecycle proof. Source/package/device gates remain distinct; continue independently without waiting for device feedback.
