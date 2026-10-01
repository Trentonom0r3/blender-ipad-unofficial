# Provider-backed Open Recent design

Status: source audit and implementation plan, 2026-10-01. No source change or device acceptance is claimed here. Latest verified IPA: run 36889708972 at b3faf93.

Open Project from Files creates an app-owned working .blend and stores a provider bookmark, documentPath and digest in BlenderWorkingProjectBookmarks. Ordinary Save refuses to overwrite a provider document whose digest changed. Open Recent currently reads the working path directly, so an external edit can leave the user looking at an old local snapshot. Only entries with a bookmark, a documentPath different from the working path, and a digest qualify. Same-path Save As, independent Open Project Copy and folder import do not.

## State flow

1. Intercept linked Recent before file read in both WM_OT_open_mainfile invoke and exec paths. Capture canonical path, load_ui/use_scripts choices and a unique ticket. Do not retain bContext or wmOperator across UIKit callbacks.
2. Before prompting to discard unsaved scene edits, asynchronously resolve the bookmark, access its security scope, and coordinate a provider read into private staging. Compare provider and local mirror bytes against the recorded digest. This phase must not mutate the mirror, metadata or active scene. Show a cancellable Checking Files project sheet.
3. If both match, proceed with normal open. If the provider changed but the mirror still matches, retain the staged provider snapshot for later commit. If the provider is unavailable, offer Retry, explicit Open Local Copy or Cancel. If the local mirror changed, leave both revisions intact and present a recovery choice; never silently overwrite either.
4. Enter Blender's existing unsaved-change dialog exactly once, carrying the original properties and ticket. Checking first lets the dialog cover edits made while the asynchronous read ran. Cancellation discards the stage and leaves the active scene and mirror intact.
5. At the final OPEN state, validate ticket, path and local digest again. Atomically install a staged refresh, update its recorded digest/bookmark, and read with the captured options. Retain a recoverable prior mirror until read success. A provider edit after staging is caught by the existing Save digest guard.
6. Invalidate requests on cancel, replacement by another open, lost window, teardown and completion. Native callbacks check generation and live-window identity; startup removes abandoned private stages.

Do not simply post GHOST_kEventOpenMainFile at completion: wm_window.cc creates a fresh WM_OT_open_mainfile invocation without the ticket or original options, potentially showing a second unsaved dialog. wm_open_mainfile_exec currently bypasses the state dispatcher, so it also needs the linked guard.

## Acceptance matrix

- Unchanged provider and mirror: one normal open, no extra dialog.
- Changed provider, unchanged mirror: refreshed project opens; Recent and digest advance; Save succeeds if provider remains at that revision.
- Provider changes again during preparation or dialog: Save refuses to overwrite its newer revision.
- Changed mirror, offline provider or invalid bookmark: no automatic replacement; Retry, explicit local-copy recovery and Cancel preserve both revisions.
- Unsaved current scene: one save/discard prompt; cancellation preserves scene; edits during preparation are covered.
- Slow-read cancellation, window loss, new open or relaunch: no stale callback may open another project, mutate metadata or publish a partial mirror.
- Same-path Save As, Open Project Copy, folder import, desktop builds and external input keep their normal open behavior.

Host tests should cover classification, state transitions, ticket validation, dialog placement and source wiring. An exact-source iOS Release build verifies native compilation and packaging; real iPad Files provider and touch behavior require separate device testing.
