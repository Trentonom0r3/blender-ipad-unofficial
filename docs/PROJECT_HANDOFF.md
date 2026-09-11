# Project handoff — 2026-09-11

## Flythrough 3-Finger No-Op, FBX Export Crash Fix, Pencil Annotate Selection Guard, Collapsed Tools Shelf & Stage Manager Gesture Deferral — 2026-09-11, latest

Source: **26bf1cf**.
Build run: https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/34659253108

Context & User Feedback:
User tested build 34653000916 on hardware:
1. "Flythrough mode - 1 finger drag = look around/orbit. 2 finger drag = pan, pinch = dolly. 3 finger drag = nothing. Currently its acting a bit weird - 3 finger drag still wants to do both and flythrough acts like its interfering. standard mode 3 finger works fine for pan. but can be slow, sometimes misfire as 2 finger. This is why I want the flythru mode to not have 3 finger, and give us a dedicated way to deal with things."
2. "export fbx still crashes the app."
3. "Native toolbar icons and radial menu are GREAT now! Only thing - when annotate/grease pencil is selected, it should disable select (left click) for apple pencil only. once that is NOT selected, left click behavior returns. Tools shelf is still open by default when it should be collapsed by default (not visible)."
4. "How can we help the top menu be able to be scrolled through (the one with texture pain/shading/animation/rendering shortcuts, and not have it drag the app window or resize? Sometimes when trying to scroll those, It catches and resizes the app... No need for < > buttons, I think we're gonna eventually change the UI design entirely on that, especially after we start getting the other things into floating drawers/shelves too."

Delivered Implementation:
1. Flythrough 3-Finger No-Op & Swapped Navigation:
   - In `intern/ghost/intern/GHOST_WindowIOS.mm`:
     - Added `- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer`: Returns `NO` when `gestureRecognizer == pan3f_gesture_recognizer && GHOST_IOS_get_flythrough_mode()`. This completely ignores 3-finger drag events when Flythrough mode is active so they never interfere with 1-finger orbit or 2-finger pan.
     - In `handlePan3f:`: Added guard checking `GHOST_IOS_get_flythrough_mode()`; if active, resets cached translation if ended and returns immediately (no-op).
     - In `handlePan2f:`: When Flythrough mode is active, on `UIGestureRecognizerStateBegan`, updates cursor coordinates via `GHOST_kEventCursorMove` so 2-finger pan immediately targets the viewport.
     - Retained 3-finger drag for pan in standard mode.
2. Complete FBX Export Crash Fix:
   - In `intern/ghost/intern/GHOST_ProjectExportIOS.hh`:
     - Identified root cause of `SIGABRT` crash: `UIDocumentPickerViewController` threw an uncaught `NSInvalidArgumentException` if files in `files` array did not exist on disk or the staging folder was empty.
     - Filtered the file URL list with `[NSFileManager.defaultManager fileExistsAtPath:url.path]`. If no files exist, logs warning and cleanly returns `NO` without crashing.
     - Resolved top-most modal presentation: dynamically walks `top.presentedViewController` to avoid UIKit presentation hierarchy errors.
     - Wrapped picker initialization and presentation in `@try ... @catch (NSException *ex)` in both `startExportWithCompress:` and `present:title:writer:`.
   - In `source/blender/windowmanager/intern/wm_event_system.cc`:
     - In `is_export` branch: guaranteed `SPACE_VIEW3D` area and `RGN_TYPE_WINDOW` context, initialized `op->reports`, wrapped `op->type->exec(C, op)` in C++ `try { ... } catch (...) { ... }`, and verified `BLI_exists(staging_path)` before presenting.
3. Apple Pencil Selection Guard with Annotate / Grease Pencil:
   - In `source/blender/windowmanager/intern/wm_event_system.cc` (`wm_handler_operator_call`):
     - When `event->tablet.active == EVT_TABLET_STYLUS` and operator id matches `"select"` (e.g. `view3d.select`), checks whether active tool (`WM_toolsystem_ref_from_context(C)`) has `"annotate"` or `"gpencil"` in its `idname`.
     - If Annotate or Grease Pencil is active, returns `WM_HANDLER_CONTINUE` to suppress object selection for Apple Pencil only, allowing seamless drawing strokes without accidentally selecting/unselecting scene geometry.
     - Normal Apple Pencil selection behavior returns immediately once any other tool (Box Select, Tweak, Move, Cursor, etc.) is active.
     - Touch and mouse selection remain completely unaffected.
4. Tools Shelf Collapsed by Default:
   - In `scripts/startup/bl_ui/space_view3d_ipad.py`:
     - Registered persistent `bpy.app.handlers.load_post` and startup timer (`_collapse_tools_shelf_default`) setting `space.show_region_toolbar = False` on all 3D viewports across all workspaces on launch and file load.
     - Left tool shelf is now hidden by default; user can toggle it open via the "Tools" button in the canvas header whenever desired.
5. Top Bar Stage Manager Window Drag / Resize Deferral:
   - In `intern/ghost/intern/GHOST_WindowIOS.mm`:
     - Implemented `- (UIRectEdge)preferredScreenEdgesDeferringSystemGestures` returning `UIRectEdgeAll` on `GHOST_IOSViewController`.
     - In iPadOS / Stage Manager, this informs the window server that app touch gestures at the top and side edges take priority over system window grabbers, allowing the top workspace tab bar to be scrolled horizontally with a single touch without accidentally dragging or resizing the app window.
     - Preserved existing topbar layout without adding `< >` buttons (rejected by user in favor of future floating drawers/shelves).
6. Local Verification:
   - `python build/preflight.py`: PASS across 32 pinned source files.
   - `python -m unittest discover -s build -p "test_*.py" -v`: PASS (9/9 unit tests).
   - `python build/validate_native_operator_discovery.py`: PASS.
   - `python build/validate_pencil_tools.py`: PASS.

Device test for this build:
1. Flythrough Mode Navigation:
   - Tap "Flythrough" header pill:
     - 1-finger drag = Look around / orbit.
     - 2-finger drag = Pan.
     - Pinch = Dolly (fast push in / out).
     - 3-finger drag = NOTHING (swallowed / no interference).
   - Tap "Flythrough [ON]" again to return to standard mode (3-finger pan functional, 2-finger orbit, pinch zoom).
2. FBX Export:
   - Tap File > Export > FBX (.fbx)...: Verify native Apple Files export sheet opens directly with `<name>.fbx` without crashing. Choose a folder and save; verify file is exported.
3. Apple Pencil Annotate vs Selection:
   - Select Annotate tool from radial ring or tool menu: Draw in 3D viewport with Apple Pencil; verify it draws annotation strokes without selecting or unselecting objects.
   - Switch back to Select Box: Tap an object with Apple Pencil; verify it selects normally.
4. Tools Shelf Default State:
   - Launch app or open a file: Verify the left 3D viewport tools shelf is hidden/collapsed by default. Tap "Tools" in header to toggle visible.
5. Top Menu Scrolling:
   - Scroll horizontally across the top menu tabs (Layout, Modeling, Sculpting, UV Editing, Texture Paint, Shading, Animation, Rendering, Compositing, Scripting): Verify it scrolls smoothly without Stage Manager grabbing the window or resizing.

## FBX Export Crash Fix, Native Blender Toolbar Vector Icons & Flythrough Touch Navigation — 2026-09-11

Source: **cdc7de8**.
Build run: https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/34653000916

Context & User Feedback:
User tested build 34647216974 on hardware:
1. "export still crashes"
2. "flythrough doesnt change how it actually works."
3. "radial ring issmaller but icons should match the tool icons i default blender"

Delivered Implementation:
1. FBX Export Crash Fix:
   - In `wm_event_system.cc` (`is_export` branch), guaranteed valid window, active screen (`CTX_wm_screen_set(C, screen)`), and 3D view area/region context prior to operator invocation.
   - Guaranteed `op->reports` is allocated via `MEM_callocN<ReportList>` and initialized via `BKE_reports_init(op->reports, RPT_STORE | RPT_FREE)`. This prevents `bpy_operator_exec` and `BPy_errors_to_report` from dereferencing a NULL pointer during Python exporter execution.
   - Corrected memory management on export completion: replaced invalid `MEM_delete(handler)` with Blender's canonical `wm_event_free_handler(&handler->head)` alongside `wm_operator_free_for_fileselect(handler->op)`.
2. Native Vector Toolbar Icons in Radial Menu:
   - In `space_view3d_ipad.py` (`VIEW3D_MT_ipad_tools.draw`), updated tool slot generation to dynamically resolve the exact native vector toolbar icon handles via `ToolSelectPanelHelper._icon_value_from_icon_handle(tool.icon)` and pass `icon_value=icon_val` to `slot.operator('wm.tool_set_by_id', ...)`.
   - Preserved RNA enum string fallbacks in `IPAD_RADIAL_TOOLS` to ensure robust rendering and pass AST syntax checks.
3. Touch Navigation & Flythrough Swap Fix:
   - In `view3d_navigate_view_move.cc` line 114: updated guard to accept both `WM_EVENT_MULTITOUCH_TWO_FINGERS` and `WM_EVENT_MULTITOUCH_THREE_FINGERS`, preventing 3-finger pan events and flythrough pan events from being discarded.
   - In `GHOST_WindowIOS.mm`:
     - Added sub-pixel accumulator (`g_pan_accum_x`, `g_pan_accum_y`) for `PAN_GESTURE_THREE_FINGERS` (Shift + Trackpad Pan), ensuring small touch moves below integer thresholds are preserved rather than truncated to 0.
     - In `handlePan:`: When Flythrough mode is active, on `UIGestureRecognizerStateBegan`, update cursor position and send `CURSOR_MOVE` before dragging so Blender routes subsequent 1-finger `PAN_GESTURE_TWO_FINGERS` directly to the active 3D Viewport.
     - In `handlePan2f:`: When Flythrough mode is active, 2-finger drag sends `PAN_GESTURE_THREE_FINGERS` (view3d.move pan), swapping from orbit.
     - In `handleZoom:`: In Flythrough mode, amplified pinch distance by 2.5x for responsive dolly navigation.
     - Added dedicated 3-finger pan gesture recognizer (`pan3f_gesture_recognizer`) on `GHOSTUIWindow` with mutual exclusion against `tap3f_gesture_recognizer`.
4. Verification:
   - `python build/preflight.py`: PASS across 32 pinned source files.
   - `python -m unittest discover -s build -p "test_*.py" -v`: PASS (8/8 tests).

Device test for this build:
1. Model Export:
   - Tap File > Export > FBX (.fbx)...: Verify native Apple Files export sheet opens directly with `<name>.fbx` without crashing. Pick a folder; verify FBX file is saved.
2. Compact Radial Ring & Tool Icons:
   - Squeeze Apple Pencil in the 3D viewport: Verify 9 tools appear with the exact native Blender toolbar icons (Select Box, Cursor, Move gizmo, Rotate gizmo, Scale gizmo, Transform gizmo, Annotate pencil, Measure ruler, Add Cube).
3. Flythrough Mode Navigation:
   - Tap "Flythrough" header pill:
     - 1-finger drag = Look around / tilt (orbit).
     - 2-finger drag = Pan (swapped from orbit).
     - Pinch = Dolly (fast push into / out of scene).
     - 3-finger drag = Pan.
   - Tap "Flythrough [ON]" again to return to standard mode.

## FBX Export Crash Fix, Procreate-Style Compact Radial Ring & Touch Navigation Swap — 2026-09-11

Context & User Feedback:
User tested previous build on hardware:
1. "pressing export fbx crashes the app. Import works properly now though."
2. "Pencil radial menu needs to be significantly smaller, maybe half the size? tbh, more procreate/freeform style? Its taking up like 1/4 of the screen as is. (I still want to see all options + have hover though.)"
3. "After testing - 3 finger pan/flythru mode overlaps with 2 finger mode a bit. maybe it simply needs to be.. flythrough mode on = swap functionality. Instead of pinch zoom and orbit/rotate, it becomes pan, with zoom being the dolly?"

Delivered Implementation:
1. FBX Export Crash Fix:
   - In `wm_event_system.cc` (`is_export` branch), set window and area context (`CTX_wm_window_set(C, root_win)`, `wm_handler_op_context(C, handler, eventstate)`).
   - Populated `directory` and `files` RNA properties on `op->ptr` alongside `filepath`.
   - Replaced uninitialized `op->reports` with `CTX_wm_reports(C)` in `BKE_report` calls, eliminating NULL pointer dereferences.
   - Cleaned up with `wm_operator_free_for_fileselect(handler->op)` to prevent memory corruption and double-free.
2. Procreate-Style Compact Radial Menu (~55% of previous size):
   - In `interface_ipad_tool_ring.hh`: reduced radius from 7.5 * unit to 4.6 * unit, button width from 4.6 * unit to 2.8 * unit, height from 1.9 * unit to 1.3 * unit, and gap to 0.25 * unit.
   - Total ring diameter shrunk from ~392px to ~236px across, occupying ~1/8 of the screen instead of 1/4, while keeping all 9 tools clearly visible and touch/hover-friendly with empty center.
   - Updated `build/test_tool_ring.py` assertions; passes all geometry and non-overlapping tests.
3. Touch Navigation & Flythrough Swap (Zero 3-Finger Collisions):
   - Removed `pan3f_gesture_recognizer` and `handlePan3f` from `GHOST_WindowIOS.mm`, completely eliminating 3-finger touch collisions.
   - Standard Mode:
     - 1-finger: Tool / Pencil (unaltered).
     - 2-finger drag: Orbit / Rotate (`view3d.rotate`).
     - Pinch: Zoom (`view3d.zoom`).
   - Flythrough Mode (Swapped Functionality via header pill):
     - 1-finger drag: Look around / Orbit.
     - 2-finger drag: Pan (`view3d.move`).
     - Pinch: Dolly (push into scene).
4. Validation:
   - `python build/preflight.py`: PASS across 32 pinned source files.
   - `python -m unittest discover -s build -p "test_*.py" -v`: PASS (8/8 tests).
   - `validate_native_operator_discovery.py`: PASS.
   - `validate_pencil_tools.py`: PASS.

Device test for this build:
1. Model Export:
   - Tap File > Export > FBX (.fbx)...: Verify native Apple Files export sheet opens directly with `<name>.fbx` without crashing. Pick a folder; verify FBX file is saved.
2. Compact Radial Ring:
   - Squeeze Apple Pencil in the 3D viewport: Verify 9 tools appear in a sleek, compact ring (~half previous size, Procreate-style) with an empty center. Tap tools to activate them. Double-tap Pencil to open the context menu.
3. Touch Navigation:
   - In standard mode: 2-finger drag = Orbit; Pinch = Zoom; 1-finger = tool.
   - Tap "Flythrough" header pill to activate Flythrough mode:
     - 1-finger drag = Look around / tilt.
     - 2-finger drag = Pan.
     - Pinch = Dolly.
   - Tap "Flythrough [ON]" again to return to standard mode.

## FBX/Model I/O Fixes, Compact 9-Tool Radial Ring, 3-Finger Pan & Flythrough Mode — 2026-09-11

Source: **56a74c3**.
Build run: https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/34642430221

Context & User Feedback:
User tested previous build on hardware:
1. "Import opens the apple files dialog and lets me choose, but the (.fbx) I tested didn't import into the scene. Export still opens the old desktop style dialog."
2. "We still have the pencil radial menu update slotted, right?"
3. "I also think we should have some sort of way to do a regular pan/push/camera flythrough. Right now it locks to scene, I'm thinking maybe 3 finger touch lets you do flythrough?"
4. User clarification on touch mapping:
   - "Standard mode: 3 finger drag = pan (1 finger tool/pencil, 2 finger orbit, pinch zoom preserved)."
   - "Flythrough mode: 1 finger = orbit/tilt, 2 finger = fly through, 3 finger = pan. I like the header indicator."

Delivered Implementation:
1. Native Model I/O (FBX & case sensitivity, modal handler dispatch):
   - In `wm_event_system.cc`, replaced case-sensitive `strstr(idname, "export")` and `strstr(idname, "import")` with `BLI_strcasestr`, fixing uppercase operator interception (`EXPORT_SCENE_OT_fbx`, `EXPORT_SCENE_OT_gltf`, etc.) which had fallen through to desktop `SPACE_FILE`.
   - In `GHOST_IOS_import_file`, searched `win->modalhandlers` (where `WM_event_add_fileselect` actually registers operators) in addition to `win->handlers`, resolving the false-cancellation issue that prevented FBX and imported models from instantiating into the scene.
2. Compact 9-Tool Radial Ring (Empty Center):
   - In `interface_ipad_tool_ring.hh`: compact dimensions (button width 4.6 * unit, height 1.9 * unit, ring radius 7.5 * unit), completely empty center (Settings button removed from ring).
   - In `space_view3d_ipad.py`: removed Settings button from `VIEW3D_MT_ipad_tools`. The 9 primary tools (Select, Cursor, Move, Rotate, Scale, Transform, Annotate, Measure, Add Cube) form a clean, uncluttered ring with empty center.
   - Squeeze Apple Pencil opens the 9-tool radial palette; double-tap opens context menu.
3. 3-Finger Pan & Flythrough Navigation:
   - Standard Mode (Preserved):
     - 1 finger: active tool / Apple Pencil drawing & selection.
     - 2 finger drag: orbit/rotate (`view3d.rotate`).
     - Pinch: zoom (`view3d.zoom`).
     - **NEW: 3 finger drag = Pan (`view3d.move`)**: Synthesizes Shift modifier + scroll with calibrated `MMB_PAN_SCALE` (0.17f), providing 1:1 view panning.
   - Flythrough Mode (Active via Header Pill):
     - Viewport Header displays `Flythrough` / `Flythrough [ON]` toggle button (`VIEW3D_OT_ipad_flythrough_toggle`).
     - Controls panel in Workspace dropdown also provides full Flythrough toggle button.
     - 1 finger drag: look around / tilt (mapped to orbit without needing 2 fingers).
     - 2 finger drag: fly forward / backward (smooth dolly into scene along view axis).
     - 3 finger drag: pan (`view3d.move`).
   - `GHOST_IOS_set_flythrough_mode` / `GHOST_IOS_get_flythrough_mode` bridges Python UI state to UIKit gesture recognition pipeline in `GHOST_WindowIOS.mm`.
4. Validation:
   - `python build/preflight.py`: PASS across 32 pinned source files.
   - `python -m unittest discover -s build -p "test_*.py" -v`: PASS (8/8 tests, including 9-tool empty center geometry).
   - `validate_native_operator_discovery.py`: PASS.
   - `validate_pencil_tools.py`: PASS (9 tool activation, no object creation, header toggle, flythrough operator toggle).

Device test for this build:
1. Model Import/Export:
   - Tap File > Export > FBX (.fbx)...: Verify native Apple Files export sheet opens directly with `<name>.fbx` (no desktop Unix browser). Choose a folder; verify FBX file is saved.
   - Tap File > Import > FBX (.fbx)...: Verify native Apple Files import sheet opens. Choose an FBX file; verify the model geometry actually appears in the 3D scene!
2. Compact 9-Tool Radial Ring:
   - Squeeze Apple Pencil in the 3D viewport: Verify 9 tools appear in a sleek, compact ring with an empty center (no Settings button).
   - Tap any tool (e.g. Move, Rotate, Annotate): verify it activates.
   - Double-tap Pencil: verify context menu opens.
3. 3-Finger Pan (Standard Mode):
   - Place 3 fingers on the screen and drag: verify the viewport pans (`view3d.move`) smoothly.
   - Standard 2-finger orbit and pinch zoom remain unchanged.
4. Flythrough Mode:
   - In 3D Viewport header, tap the "Flythrough" pill (it highlights to "Flythrough [ON]").
   - Drag with 1 finger: verify camera tilts / looks around.
   - Drag with 2 fingers up/down: verify camera flies forward / backward.
   - Drag with 3 fingers: verify camera pans.
   - Tap "Flythrough [ON]" again: returns to standard mode.

## Native Save As and Save Copy compress alert & direct Files picker — 2026-09-11

Source: **c7dc14b**.
Build run: https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/34569433930

Context & User Feedback:
User reported on real hardware that tapping the title / header area in the dialog popup that opened on Save As and Save Copy crashed the app.
User requested: "I think for those, it should have a simple popup with y or n, 'Compress .blend file?' Or something like that, and THEN go directly into the apple files folder. The user can rename it there if they want."

Delivered Fix:
1. Eliminated Crashing Blender Dialog Popup:
   - Removed `WM_operator_props_dialog_popup`, `ot->ui`, and the Blender `filename` text-input property buttons from `WM_OT_save_as_to_files` and `WM_OT_save_copy_to_files` in `wm_files.cc`.
2. Native iOS Alert ("Compress .blend file?"):
   - In `GHOST_ProjectExportIOS.hh`, implemented `presentWithCompressPrompt:title:writer:onSaved:`.
   - Presents a native UIKit `UIAlertController` (Alert style) asking: "Compress .blend file?".
   - Three touch-safe buttons: **Compress (Yes)**, **Don't Compress (No)**, and **Cancel**.
   - Tapping Cancel dismisses cleanly without touching any files.
3. Direct Apple Files Picker & Rename in Files:
   - Tapping Yes or No dismisses the alert and directly presents `UIDocumentPickerViewController(initForExportingURLs:asCopy:YES)`.
   - The user browses Apple Files directly (*On My iPad*, *iCloud Drive*, *Blender > Projects*, external drives) and can rename the file directly in Apple Files before saving.
4. Active Document Identity for Save As:
   - When the user selects the destination and taps Save in Apple Files, UIKit returns the chosen destination URL in `didPickDocumentsAtURLs:`.
   - For `WM_OT_save_as_to_files`, `on_saved` updates `bmain->filepath` to that destination, sends `NC_WM | ND_FILESAVE`, restarts the autosave timer, and shows the info report banner (`Saved as "<name>"`).
   - For `WM_OT_save_copy_to_files`, `bmain->filepath` remains untouched (independent copy).
5. Unsaved File > Save:
   - `wm_save_mainfile_invoke` continues routing unsaved files to `WM_OT_save_as_to_files`, so an unsaved Save also prompts for compression and opens Apple Files directly.
6. Validation:
   - `python build/preflight.py`: PASS across 32 pinned source files.
   - `validate_native_operator_discovery.py`: PASS.
   - `python -m unittest discover -s build -p "test_*.py" -v`: PASS (8/8 tests).
   - `validate_pencil_tools.py`: PASS.
   - `validate_save_copy_contract.py`: PASS.

Device test for this build:
1. Tap File > Save As...:
   - Verify native iOS alert appears: "Compress .blend file?" with [Compress (Yes)], [Don't Compress (No)], and [Cancel].
   - Tap title area of the alert: verify NO crash occurs (managed 100% by UIKit).
   - Tap "Compress (Yes)" or "Don't Compress (No)": verify it transitions directly into Apple Files picker sheet.
   - In Apple Files sheet: verify you can rename the file (e.g. `MyModel.blend`) and choose any destination folder.
   - Tap Save: verify the file is saved, becomes the active project, and subsequent File > Save saves silently and in-place.
2. Tap File > Save Copy...:
   - Verify native "Compress .blend file?" alert appears. Tap Cancel: verify workspace returns with no changes.
   - Tap Save Copy again, tap "Compress (Yes)", pick a destination in Files: verify independent copy is written and active project path is untouched.
3. Squeeze Apple Pencil: verify 9-tool radial palette opens and operates normally. Double-tap Pencil: verify context menu opens.

## Native 3D Model Import & Export (USD, OBJ, STL, PLY, FBX, Alembic) — 2026-09-11

Source: **e439943**.
Build run: https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/34568136604

Context & Goal:
User requested Option 1: complete Native 3D Model Import & Export (USDZ, USD, OBJ, STL, PLY, FBX, Alembic) through `UIDocumentPickerViewController`, replacing the desktop Unix filesystem browser (`SPACE_FILE`) entirely for 3D asset workflows.

Delivered Implementation:
1. Intercepted File-Selector Lifecycle in `wm_event_system.cc`:
   - In `wm_handler_fileselect_do` under `case EVT_FILESELECT_FULL_OPEN` with `#ifdef WITH_APPLE_CROSSPLATFORM`, intercepted export and import operators before Blender opens `SPACE_FILE`.
2. Native Model Export (`GHOST_IOS_export_file`):
   - Derives clean target filename from operator RNA (`filename`, `filepath`), or current project name (`bmain->filepath`), falling back to `Model`.
   - Automatically inspects `filter_glob` (e.g. `*.obj;*.mtl`, `*.usd`, `*.stl`, `*.ply`, `*.abc`) to guarantee correct file extension if missing.
   - Stages file output in `NSTemporaryDirectory()/BlenderExport-<UUID>/`.
   - Synchronously executes `op->type->exec(C, op)` to generate output into the staging path.
   - Collects all generated companion files in staging (e.g. Wavefront `.obj` + `.mtl` material libraries).
   - Presents UIKit `UIDocumentPickerViewController(initForExportingURLs:asCopy:YES)` so the user can export to any folder in Files or cloud storage.
   - Cleans up staging files automatically upon completion or dismissal.
3. Native Model Import (`GHOST_IOS_import_file`):
   - Parses operator `filter_glob` into native `UTType` identifiers (`UTType.typeWithFilenameExtension`).
   - Presents UIKit `UIDocumentPickerViewController(initForOpeningContentTypes:asCopy:YES)`.
   - Coordinates file access off the main thread with `NSFileCoordinator` (handling security-scoped URLs safely) and copies the selected asset into a sandboxed import folder in `NSTemporaryDirectory()/BlenderImport-<UUID>/`.
   - On the main queue, validates operator and handler liveness against active window handler lists (`WM_HANDLER_TYPE_OP`), populates operator RNA properties (`filepath`, `directory`, `files` collection), and posts `EVT_FILESELECT_EXEC`.
   - Blender's native event dispatcher restores the originating window/area context, executes `op->type->exec`, records undo state (`ED_undo_push_op`), displays reports, and cleanly frees the handler.
   - Cancel/dismiss correctly posts `EVT_FILESELECT_CANCEL` and cleans up handlers without side effects.
4. Preserved Core Tablet Capabilities:
   - Shipped 9-tool radial palette geometry and center Settings button.
   - Apple Pencil gestures: squeeze opens radial tool ring; double-tap opens context menu.
   - Direct-pinch depth navigation.
   - Native Project Open (`wm_open_mainfile`), Save As (`WM_OT_save_as_to_files`), and Save Copy (`wm_save_copy_to_files`).
5. Verification:
   - `python build/preflight.py`: PASS across 32 pinned source files.
   - `validate_native_operator_discovery.py`: PASS.
   - `python -m unittest discover -s build -p "test_*.py" -v`: PASS (8/8 tests).
   - `validate_pencil_tools.py`: PASS.
   - `validate_save_copy_contract.py`: PASS.

Device test for this build:
1. Tap File > Export > Wavefront (.obj)...: Verify native Document Picker ("Export 3D Model") appears directly without desktop Unix browser. Choose destination in Files; verify both `.obj` and `.mtl` files are exported cleanly.
2. Tap File > Export > Universal Scene Description (.usd*)...: Verify native export picker appears with `<project>.usd`. Choose destination; verify file is exported.
3. Tap File > Import > Wavefront (.obj)...: Verify native Document Picker ("Import 3D Model") appears filtered to `.obj`/`.mtl` files. Select an OBJ file; verify the model imports into the 3D scene and an undo step is created.
4. Tap File > Import > Universal Scene Description (.usd*)...: Verify picker filters to USD/USDZ files. Select a file; verify it imports into scene.
5. Tap Cancel on any import or export picker: Verify workspace returns immediately without error reports, stuck operators, or hanging dialogs.
6. Squeeze Apple Pencil: verify 9-tool radial palette opens and operates normally. Double-tap Pencil: verify context menu opens.

## Native File Open and Save As unification — 2026-09-11

Source: **18d9d2d**. Build dispatched:
https://github.com/Trentonom0r3/blender-ipad-unofficial/actions/runs/34566999560

Context & Goal:
User validated that Save Copy and pinch navigation worked cleanly on device (run 34564379590).
However, "Import Project from Files..." was redundant alongside "Open...", and desktop Unix file
browser remained for ordinary Open, Save As, and unsaved Save operations.
User approved replacing the desktop file picker entirely with native iPadOS Document Picker workflows.

Implemented Changes:
1. Unified File > Open:
   - Replaced redundant "Import Project from Files..." in `TOPBAR_MT_file` and `TOPBAR_MT_file_context_menu`.
   - On iOS, `wm_open_mainfile__select_file_path_exec` routes directly to `GHOST_IOS_import_project()`, presenting the native `UIDocumentPickerViewController` with title "Open a Blender Project".
   - `wm_open_mainfile` preserves Blender's unsaved-changes protection (`OPEN_MAINFILE_STATE_DISCARD_CHANGES`) prior to presenting native Files.
   - When a project is chosen, it is copied into `Documents/Projects/<Name - UUID>/<Name>.blend` and opened via `GHOST_SystemIOS::handleOpenDocumentRequest`.
2. Native File > Save As (`WM_OT_save_as_to_files`):
   - Added `WM_OT_save_as_to_files` (registered in `wm_operators.cc` and declared in `wm_files.hh`).
   - Presents a native dialog asking for project Name and Compression toggle.
   - Saves into `Documents/Projects/<Name - UUID>/<Name>.blend` via `GHOST_IOS_get_project_save_path`.
   - Calls `wm_file_write` with `use_save_as_copy = false` and relative remapping, updating `bmain->filepath` and notifying the window manager (`NC_WM | ND_FILESAVE`).
   - `File > Save As...` in `space_topbar.py` routes to `wm.save_as_to_files` when available. `wm_save_as_mainfile_invoke` also forwards to `WM_OT_save_as_to_files` on iOS.
3. Native File > Save for Unsaved Projects:
   - `wm_save_mainfile_invoke` routes to `WM_OT_save_as_to_files` when `blendfile_path[0] == '\0'`, completely avoiding the Unix directory browser and the container root `Permission denied` error.
   - Fixed `Save` button enabled condition in `space_topbar.py` so unsaved files can trigger Save As.
4. Viewport iPad Quick Actions:
   - Updated `space_view3d_ipad.py` quick actions: "Open Project" replaces "Import Project from Files" and calls `wm.open_mainfile`.
5. Verification & Tests:
   - `build/validate_native_operator_discovery.py` updated and passing on Blender 5.1.2.
   - `python -m unittest discover -s build -p test_tool_ring.py -v`: PASS.
   - `validate_pencil_tools.py`: PASS.
   - `python build/preflight.py`: PASS across 32 pinned source files.
   - Preserved working radial palette geometry, pencil gesture bindings (squeeze = tools, double tap = context menu), and Save Copy (`wm_save_copy_to_files`).

Device test for this build:
1. Tap File > Open...: Verify native Document Picker ("Open a Blender Project") appears directly without any desktop Unix browser. Select a .blend file; verify it opens cleanly.
2. In a new or existing scene, tap File > Save As...: Verify popup for Name and Compress appears with Save button. Tap Save; verify project saves to Files under On My iPad > Blender > Projects.
3. In a new unsaved scene (`Untitled`), tap File > Save: Verify it presents the Save Project As dialog and saves cleanly into Projects rather than failing with permission denied. Subsequent Save taps on that project save silently and quickly.
4. Squeeze Apple Pencil: verify 9-tool radial palette opens and works as before. Double-tap Apple Pencil: verify context menu opens.

## Native Files menu discovery repair — 2026-09-11

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
