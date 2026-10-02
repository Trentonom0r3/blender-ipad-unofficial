# Blender iPad development

## Verified multi-library folder IPA — 2026-10-02

Exact-source run 36957402486 at 79a265f passed native Release build and downloaded IPA archive, arm64 bundle and packaged library-choice checks; see `docs/PROJECT_HANDOFF.md`. A Link/Append Files folder may contain several `.blend` files and the app asks which one to use while retaining the copied folder and its relative assets. This addition has no iPad device acceptance; the user's earlier “works” reply covers only the original single-file chooser. Continue touch and complete Files outcomes, especially portable sharing of projects with linked libraries. Preserve Pencil squeeze radial, double-tap context, accepted Inspector, native editors and external input. Keep source, packaged build and device evidence distinct.


## Verified library-folder Link/Append IPA — 2026-10-01

Exact-source run 36952644773 at 1abeea2 passed native Release build and downloaded IPA archive, arm64 bundle and packaged folder-marker checks; see `docs/PROJECT_HANDOFF.md`. Link/Append can now copy a selected folder containing one `.blend` with relative assets, or keep the existing single-file route. Folder selection, relative textures and cancellation have no device acceptance. The user's earlier "works" reply supports only the original chooser. Preserve accepted Pencil squeeze radial, double-tap, Inspector, native editors and external input. Continue touch/Files usability and portable project sharing; source, packaged build and device evidence are separate.

## Verified first Files open repair IPA — 2026-10-01

Exact-source run 36950741895 at 4a777b6 passed native Release build and downloaded IPA archive/bundle checks; see `docs/PROJECT_HANDOFF.md`. It fixes the fresh direct Files open ticket-zero cancellation and makes Recent Retry/Open Local Copy wait for alert dismissal; a successfully opened local copy saves independently of the Files original. No iPad device acceptance is claimed. Preserve accepted Pencil squeeze radial, double-tap, Inspector, native editors, external input and the user's focused Link/Append chooser result. Continue complete Files and touch usability, especially sibling assets and linked-library portability; distinguish source, package and device evidence.

## Verified Files-backed Open Recent IPA — 2026-10-01

Exact-source run 36926276105 at 675badc passed native Release build and downloaded IPA integrity/bundle checks; see `docs/PROJECT_HANDOFF.md`. Provider-backed Open Recent now checks Files before the unsaved-scene decision, handles conflict/offline/local-copy choices, and waits for terminal asynchronous Save success. The first direct Files open avoids a duplicate check when the scene is clean. No device acceptance is claimed. Preserve Pencil squeeze radial, double-tap, accepted Inspector, native editors and external input. Continue touch/Files usability and linked-library portability; distinguish source, package and device evidence.

## Verified Files copy lifecycle IPA — 2026-10-01

Exact-source iOS run 36889708972 at
`b3faf9340c9548c36d1fe58c5f7a2685c676daa1` passed native Release build,
packaging and downloaded IPA checks; see `docs/PROJECT_HANDOFF.md` for evidence.
After Files selection, model/library imports show a cancellable preparation
sheet and visible copy-failure explanation. Library copies are staged under a
hidden name and moved into visible `Documents/Libraries` only when complete;
abandoned stages are cleaned on startup. The user's earlier "works" reply
supports the Link/Append chooser in run 36850574490, not this new copy UI.
Continue independent touch/Files work. Next, provider-backed Open Recent needs
an asynchronous source check before opening its local working copy; preserve
unsaved scene edits and local mirror conflicts.

## Focused Link/Append iPad response — 2026-10-01

The user answered "works" to a question about IPA run 36850574490 opening
the Link/Append data-block chooser after Files selection and linked objects
remaining after save/reopen. Treat that focused flow as user-reported working.
The reply did not describe multi-selection, options, cancellation, large-file
copying, provider refresh, project portability or external input. Preserve
the accepted flow and continue unfinished Files lifecycle work.

## Goal clarification: usability over a fixed UI mechanism

Follow the goal clarification in `docs/PRODUCT_DIRECTION.md` (or
`PRODUCT_DIRECTION.md` from this docs directory). It supersedes wording below
that treats a particular rail, panel or lock mechanism as immutable. Preserve the
underlying capabilities and lessons; improve the design when evidence supports a
better iPad interaction. Preserve the working Pencil mappings and external input.
Judge progress by complete workflows in installable builds and actual-device
acceptance, while continuing unfinished workspace and Files requirements.

## Link/Append Files checkpoint — 2026-10-01

Exact-source IPA run 36848386081 at 3d70e9e passed native Release compile,
packaging and downloaded artifact checks after native Files selection began
using persistent app-owned library snapshots. It has no device acceptance.
The subsequent touch chooser source is now packaged in exact-source IPA
run 36850574490 at 5e1a693, with 42 host tests, 57-file pinned-source
preflight, native Release compile, IPA integrity and bundled UI checks passing.
Continue real-device workflow acceptance and the remaining Files lifecycle. Preserve the accepted Inspector,
Pencil squeeze radial, double-tap context and external input. The library
copy is a snapshot and linked-project portability remains open.

## Latest continuation directive — 2026-10-01

The user explicitly renewed the full goal: continue independently without
waiting for hardware feedback, use the available five-hour and weekly usage
windows, and schedule a resume near renewal when limits run low. This
supersedes the earlier request below to pause at each device test gate. Keep
the Files IPA's iPad behavior unverified and invite a focused device report
when useful, but continue source-backed work that does not require it. The
recurring continuation heartbeat is active again.

The next source candidate hardens native model-import picker callbacks. A
unique lease is assigned to each file-select operator and invalidated on
free; delayed success/cancel callbacks check the lease, live window manager
and handler before touching Blender state. Rejected or stale staged copies
are removed. All 41 host tests, pinned-source preflight and exact-source iOS run
36832783348 pass. The downloaded IPA passed integrity and bundle checks;
device behavior remains unverified. Preserve model import options and the
approved Pencil and external-input behavior.

## Verified Files-linked IPA; device test gate — 2026-10-01

Exact-source iOS run 36829384514 at 5839961e187614b2467452d6cfa3bf5bb1ada0ff
succeeded. Cloud preflight, native Release compilation, packaging, artifact
upload, downloaded IPA CRC, arm64 bundle metadata and packaged action checks
passed. The user has not tested the linked Files workflow on iPad. The next
step is their short device check of Open Project from Files, ordinary Save
updating the Files original, and reopen after app relaunch. Check that Open
Project Copy still saves independently and Import Project Folder retains
relative assets; an external-edit conflict check is useful if practical.
The user asked development to stop when hardware testing is needed. Notify
them with this run and pause the heartbeat and goal until their report.
Do not infer provider behavior from package checks. Full artifact evidence
is in PROJECT_HANDOFF.

## Files-linked project opening candidate — source only, 2026-10-01

The user finds the current Inspector acceptable, so work moved to Files. The
new explicit Open Project from Files route coordinates a local working copy,
retains a bookmark for the selected provider document, and routes ordinary
Save through the existing coordinated writer. The independent Open Project
Copy and Import Project Folder choices remain. Linked projects store a content
fingerprint and refuse a provider write when the source differs or cannot be
checked; Save As preserves edits in that case. After a successful provider
write, the local working file is refreshed for Open Recent and relative paths.
A provider write that succeeds while local refresh fails has a distinct error.
Single-file opening still requires packed assets if sibling resources matter;
folder import remains the choice for full relative assets. All 40 host tests,
pinned-source preflight and exact-source iOS run 36829384514 pass. This is not
iPad device acceptance; see PROJECT_HANDOFF for artifact evidence.

## Latest device feedback — 2026-10-01

After receiving the focused test request for exact-source IPA run 36818147730,
the user replied, "seems fine to me." Treat the Inspector's current appearance
and sizing as acceptable for now; no specific problems were reported. This
brief report does not verify every fresh/saved, portrait, Files or external-input
case. The requested testing pause is over. Continue the active first-class
iPad goal, preserving the working Pencil mappings and native editors. Avoid
another Inspector redesign without new evidence. The latest verified package
is still run 36818147730 at e3a4eff; see PROJECT_HANDOFF for exact evidence.

## Inspector saved-width follow-up — 2026-10-01

The active goal resumed after the verified 35984874300 test request; no user
device report on that IPA has been recorded. A source audit found that Inspector
and Scene shared ipad_panel_size[0]. Thus a previously saved wide side editor
could override the new 35% Inspector default in an existing project. Source
e3a4effc1bc22ae5e09f03ade007b927e27861ed gives Inspector a separate
saved width: zero in older projects chooses its compact default, later drags
persist independently, and other side editors keep their saved width. The
modal resize path restores the right preference on cancellation. All 39 host
tests and pinned-source preflight pass. Exact-source iOS run 36818147730
at e3a4eff succeeded: native Release compilation, IPA packaging, artifact
download and integrity checks passed. Exact artifact metadata is in
PROJECT_HANDOFF. This is packaged-build evidence, not iPad acceptance. The
user should now test this IPA in a saved project and a fresh Layout, including
Scene/Inspector width switching and the native Properties icons. Explicitly
notify them and pause development until their report; preserve Pencil and
external input. Do not retry an earlier source merely to repeat host checks.

## Current Inspector package — 2026-09-24

The user's test of IPA 35975045387 found broad working behavior but a basic
visual design, an Inspector that opened too wide and could not shrink enough,
and no visible desktop Properties icons. The new exact-source IPA run
35984874300 at 46bd48ddc60cada6abbe3b0bed501358623c6e65 restores
Blender's native Properties icon strip beside a labeled header picker and
reduces the Inspector-specific opening share from 45% to 35% and minimum
width from 360 to 280 scaled UI units. Other side editors and saved user
widths are preserved. All 38 host tests, pinned-source preflight, native iOS
Release compilation, packaging and artifact verification pass; exact metadata
is in PROJECT_HANDOFF. This does not prove device visibility or comfort. The
user now needs to test the exact new IPA; explicitly notify them and stop
development until feedback arrives. Preserve the working Pencil mappings and
external input. Failed run 35983302880 at 39f708d had a stale split_previous
reference, repaired before the successful replacement; do not retry it.

## Updated goal — 2026-09-21

The user explicitly requested updating the goal after reviewing progress. The
success criterion is comfortable everyday iPad use while preserving full Blender
capability and external input. Follow the revised Goal and user section in
`docs/PRODUCT_DIRECTION.md`. Prioritize visible workflow improvements in coherent,
installable builds; the workspace feature list remains required but does not by
itself establish usability. Preserve the confirmed working Pencil squeeze radial.
Own reversible decisions and ask for device evidence only when needed.

The latest successful feature IPA is run 35984874300 at source 46bd48d.
It includes the narrower Inspector and native category icon strip along with
the earlier project-folder import, per-project Files bookmarks, provider Save
completion fixes and Layout Tool Header adaptation. The artifact was downloaded
and verified; see PROJECT_HANDOFF for hashes and bundle metadata. This is
packaged-build evidence, not acceptance of the new Inspector on iPad. The user
has provided device feedback on the preceding IPA and should now test this one
before further visual decisions. The broader usability, workspace and Files
requirements remain open.

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


Before changing code, read `docs/PRODUCT_DIRECTION.md`, `docs/IPAD_WORKSPACE.md`
and the newest section of `docs/PROJECT_HANDOFF.md`, then inspect HEAD and the diff.
Preserve existing implementation and distinguish prototypes from shipped changes.

The user is the hardware tester, not the project manager. Own implementation and
reversible design choices. Ask for hardware evidence or consequential subjective
decisions only when needed. Do not restart design discovery each session.

The current UI implementation follows the rail, global lock and working split
design above, subject to the goal clarification at the top of this file.
Apply it at startup, file load and workspace switching. Preserve native editor
instances and state. Bound floating content to actual WINDOW regions, accounting
for variable headers, and align drawing with input. See `docs/IPAD_WORKSPACE.md`
for the current acceptance criteria. Historical handoff entries describe earlier
implementations; they do not override the current contract.

This contract supersedes the earlier custom Scene/Inspector drawer design and the
instruction to prioritize Files over workspace UI. Preserve the existing Files work
and its unfinished lifecycle requirements. Fix confirmed P0 regressions as necessary,
then return to the active milestone. Do not keep expanding the Canvas popover: the
user rejected its location and role as the primary tool surface.

User-approved Pencil mapping: squeeze opens radial tool selection; double tap opens
the context/right-click menu. Do not merge these actions. Preserve the existing
nine-tool ring, its current geometry, touch fallback and desktop input. The workspace
panel milestone does not authorize an unrelated radial redesign.

Checkpoint coherent code and update the handoff with exact build/commit, evidence,
unfinished work and the next implementation step. Source checks, previews, iOS
compilation, packaging and real-device acceptance are separate gates. Do not claim
a task is device-validated because its build succeeds. Avoid repeated unchanged
builds and long build-polling loops with no useful independent work.

Native Files remains required. The user explicitly wants the desktop filesystem
picker removed, including its proposed advanced fallback. Preserve importer options
and library data-block selection through dedicated surfaces, not a Unix browser.
Workspace UI work must not discard unfinished document identity, security scope,
provider coordination, sidecar, cancellation or recovery requirements.
