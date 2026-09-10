# Tablet UX implementation

## Current engineering state

See [PROJECT_HANDOFF.md](PROJECT_HANDOFF.md) for the latest implementation,
validation evidence, remaining window audit, and exact iPad test protocol. The
secondary-window repair adds a native Close View footer outside Blender content;
its device behavior is not yet validated. Native Files pickers are still pending.

## Selected direction: Canvas First

### Device feedback follow-up

The first Canvas entry was registered as an additional header, placing it after
the desktop header contents where narrow viewports could hide it. It now draws at
the start of the existing viewport header. The iOS-only module registers directly
instead of depending on embedded Python's executable path. Inspection of the
downloaded IPA confirmed that the original module was installed.

One-finger pans previously generated both a left-button drag and trackpad scroll
events. They now generate only scrolling, anchored at the gesture origin. Taps
still activate controls; Pencil dragging remains the precision path for sliders,
gizmos, selection boxes, and drawing. This intentionally means a finger swipe over
a slider scrolls the panel instead of changing its value. Mouse/trackpad handling
is separate and unchanged. Validate that two-finger gestures cannot leave a
selection or pressed button behind when fingers land at different times.

The reported loading slowdown is not yet reproduced or attributed. Input logging
is disabled in this source. Source checks cannot establish startup performance or
prove touch behavior; both still require device measurements.

Concept B is the selected product direction: floating contextual controls and a
larger canvas, with the complete Blender interface available on demand. Quick
controls supplement existing functionality; they must not replace full editors,
menus, tool shelves, or properties. Pencil Pro, fingers, and keyboard are the
primary device-validation setup; no mouse is required for acceptance.

The first UI foundation adds an iPad-only **Canvas** header popover using Blender's
existing UI toolkit and operators. It offers touch-sized navigation, transform
tools, undo/redo, playback, camera controls, and menu search. Tools, Sidebar, and
Asset Shelf can be toggled independently. **Expand Canvas / Restore Editors** uses
Blender's existing reversible area maximization, retaining the surrounding editor
layout. No global scale or saved startup layout is forced. The full tool shelf
remains the route to tools beyond the quick selection.

This is an initial floating popover, not yet the persistent floating dock pictured
in the concept. On-device validation must check popover placement, operator
context, touch acquisition, portrait layout, and editor restoration before
extending the interface. Verify with a non-default workspace and an existing
project, including Sculpt and Grease Pencil modes. The Pencil squeeze compiler
failure from the first Actions run is addressed by annotating the delegate method
with `API_AVAILABLE(ios(17.5))` while retaining its SDK and runtime guards.

## Architecture

This repository distributes an overlay patch, not a complete Blender checkout. Its
upstream base is `d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e`. Apply the patch to that
revision using the existing build workflow. The local source checkout discovered
during this investigation was `D:/dev/Projects/Repos/blendpad/blender-ipad-unofficial`.

* `intern/ghost/intern/GHOST_WindowIOS.mm`: UIKit windows, recognizers, Pencil,
  GameController keyboard/mouse input, and translation into GHOST events. This
  code uses manual Objective-C reference counting.
* `intern/ghost/intern/GHOST_SystemIOS.mm`: application delegate, Metal-driven
  Blender event loop, incoming document URLs, and security-scoped file access.
  `handleOpenDocumentRequest` posts an existing `GHOST_kEventOpenMainFile` event.
* `source/blender/windowmanager/intern/wm_event_system.cc`: file-selector operator
  ownership and asynchronous completion. `WM_event_add_fileselect` installs a
  handler retaining the originating window/area/region. Completion restores that
  context and executes the operator. A native picker must preserve this lifecycle.
* `source/blender/windowmanager/intern/wm_files.cc`: project loading, unsaved-change
  confirmation, script-execution checks, saving, autosaving, and recovery.
* `source/blender/editors/interface/view2d/view2d_ops.cc`: panel and 2D editor
  scrolling. Input routing here affects both touch and real middle-button drags.
* `intern/ghost/intern/GHOST_SystemPathsCocoa.mm`: shared Apple application support
  and Documents paths. The iOS plist already enables file sharing and opening in
  place. Merely adding those keys again would not provide a native file picker.
* `build/apply_branding.sh` and `.github/workflows/build-ipa.yml`: final bundle
  branding, packaging, and the macOS/Xcode build path.

The older development notes describe some bugs subsequently fixed by their own
last section. Treat the actual patch as authoritative. Existing pressure, tilt,
hover, two-finger navigation, and edge-swipe hooks should be extended, not replaced.
`GHOST_TabletData` contains pressure and X/Y tilt but no barrel-roll field. Routing
roll into brush rotation would require a deliberate upstream-facing event change.

## Implemented first pass

* Restore one-finger scrolling in ordinary panels and in the File Browser's side
  regions. Preserve two-finger scrolling in file/asset content and the asset shelf,
  where a one-finger drag has selection semantics. Allow real middle-button pan.
* Exclude Pencil from multi-finger recognizers while retaining direct and indirect
  input types. A Pencil plus one finger must not count as two-finger navigation.
* Allow simultaneous two-finger pan and pinch symmetrically, but remove simultaneous
  single-finger/Pencil drag plus pinch recognition.
* Capture the Pencil before the recognizer's superclass processes touch begin;
  clear tracked Pencil touches only when that touch ends, or the recognizer resets.
  Finger lift/cancellation no longer unconditionally clears Pencil pressure.
* Prevent hover completion from resetting an active stroke's tablet data, and guard
  the remaining pressure sampling path against division by zero.
* Balance double-tap's synthesized context click with a right-button release.
  Double-tap and Pencil Pro squeeze open the existing Blender context menu at the
  current precision cursor. Neither fires during a Pencil stroke or mouse drag.
  Both respect their respective system Ignore preferences. Squeeze fires only on
  the ended phase and is guarded for both SDK and runtime availability (iOS 17.5).
  Other system action preferences are currently mapped to this context action;
  configurable brush/eraser mappings are not implemented.
* Put new autosaves in `Documents/Recovery`, which the existing file-sharing plist
  exposes in Files. Recover Auto Save starts there through the same path helper.
  If directory creation fails, retain the existing temporary-directory fallback.
  Normal successful-exit cleanup is unchanged, as is Recover Last Session's
  `quit.blend` location. Existing temporary autosaves are not moved or deleted.

Global UI scale, desktop keymaps, brush engines, and project data formats are unchanged.

## Next implementation boundaries

This pass does **not** implement native open/import/save/export pickers, responsive
layouts, larger hit targets, share sheets, drag/drop, barrel roll, or haptics.

1. Add an asynchronous UIKit document service connected to the existing file-selector
   handler lifecycle. Keep Blender's importer/exporter options available. Handle
   cancellation, operator/window destruction, multiple selection, and errors before
   executing the original operator in its preserved context.
2. Define document ownership explicitly: app-owned project copies versus documents
   edited in place. Preserve relative texture/cache/library dependencies. The current
   load-time start/stop security-scope calls are not sufficient evidence that deferred
   resource loads, background operations, and later saves retain external access.
   Use coordinated I/O and bookmarks with explicit lifetime management where needed.
3. Provide compact, touch-sized contextual viewport controls for camera view,
   framing, transforms, and panel visibility; reuse Blender operators. Keep saved
   desktop layouts and external keyboard/mouse workflows available. Adapt to actual
   window bounds and safe areas instead of specific 11-inch or 13-inch device names.

## Validation

The changed source hunks were applied to the pinned upstream files on Windows.
There is no Xcode, UIKit SDK, simulator, or attached iPad available in that environment.
Patch applicability is **not** a compile test or a claim of working device behavior.
The existing macOS build workflow must compile this patch before sideload testing.

Device acceptance checks:

1. In Properties and a viewport sidebar, drag empty panel space with one finger;
   verify scrolling. Drag a numeric field with Pencil to change its value; a finger
   swipe should scroll. In File
   Browser content, verify one-finger selection and two-finger scrolling separately.
2. With a mouse, test middle-drag in UV/Image editors, orbit, Shift-middle pan,
   marquee selection, and a secondary window. Test Magic Keyboard trackpad pinch.
3. Paint a light-pressure stroke, put down and lift a finger, then lift the Pencil.
   Verify no full-pressure dab, reset, stray line, or accidental viewport navigation.
   Repeat while hover starts/stops and after a system interruption.
4. Double-tap or squeeze over selected geometry. Verify one context menu, followed
   by normal selection/dragging (no stuck right button). Repeat during a stroke,
   cancel a squeeze, and set each Pencil action to Ignore in iPadOS Settings.
5. Modify an unsaved project and wait for the configured autosave interval. Verify
   Files > On My iPad > Blender iPad > Recovery contains the autosave. Verify File >
   Recover > Auto Save opens that folder and can recover the scene. Check an existing
   project too. Normal quitting may remove the current autosave, as in upstream.
6. Run the checks in portrait and landscape on the available M5 iPad, with and
   without the Magic Keyboard. Keep results separate from source review.

Apple API references:

* [Pencil squeeze handling](https://developer.apple.com/documentation/applepencil/handling-squeezes-from-apple-pencil)
* [Document picker](https://developer.apple.com/documentation/uikit/uidocumentpickerviewcontroller)
