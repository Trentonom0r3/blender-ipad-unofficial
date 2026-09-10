# Project handoff — 2026-09-10

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
| Fullscreen area with hidden headers | Existing tiny hover-revealed corner exit; **remaining P0 touch discoverability gap** |
| Blender popover, confirmation, operator dialog | Same-window modal handler; own Cancel/outside/Escape semantics, not a GHOST secondary window |
| Native onscreen keyboard | Existing accessory Done/Cancel; verify while closing a secondary view |

Highest next steps:
1. Compile and package this revision; fix any UIKit/compiler failure before device handoff.
2. Make hidden-header fullscreen escape permanently discoverable and touch-sized.
   Pinned `editors/screen/area.cc`: `fullscreen_azone_init` starts alpha at zero;
   `area_draw_azone_fullscreen` draws the small icon. Audit action-zone hit testing
   and hover fade together; don't enlarge only the artwork.
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

Known unresolved risks: native mouse footer clicks also pass through GameController
and need device checking; fullscreen hidden-header exit still needs adaptation;
Escape currently closes a secondary window even if an inner Blender popup is open
(inherited semantics); native Files and provider-safe saving remain unimplemented.
No staged native-document prototype was merged in this pass.
