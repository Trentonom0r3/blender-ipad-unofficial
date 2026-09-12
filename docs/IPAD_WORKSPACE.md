# iPad workspace design and delivery

## Active milestone: floating panels for every workspace

**User-approved contract; implementation in progress.** This replaces the earlier
custom Scene/Inspector drawer design. The user reported that startup still showed
the desktop default arrangement and clarified that all workspace layouts should
retain their existing editors while presenting supporting areas as floating panels.
The contract below is not a claim of source completion, compilation or device
acceptance; PROJECT_HANDOFF.md records those gates against exact code/builds.

### Preserve each workspace's identity

* Adapt every default and saved workspace, including workspaces whose main editor
  is an image, node graph, animation editor or other Blender editor. Keep the main
  working area and the tools appropriate to that layout.
* Use existing layout placement to decide where supporting editors open. Side
  editors open at the side; bottom editors open at the bottom. A node editor that
  is the main workspace editor remains the main editor; one in the bottom area
  becomes a bottom panel. Do not classify every editor of one type identically.
* Preserve saved editor instances, contents, editor-specific settings, selection,
  scroll/zoom state and Blender operator context through opening, closing and
  workspace switching. Presentation changes must not destroy the saved layout.
* Apply the iPad presentation at startup, file load and workspace switching. Users
  should not have to manually maximize a desktop layout each time.

### Permanent buttons and real Blender panels

* Keep the button rails permanently visible and noncollapsible. Closing content
  leaves its button available. No chevron, hidden sidebar state or precise border
  drag should make the rail disappear.
* Use the Item / Tool / View category interaction as the model: tapping a button
  opens its panel directly adjacent to that button, floating over the working area.
  Selecting another button switches the visible panel for that area; tapping the
  active unlocked button closes its content. Side and bottom areas are independent.
* Reuse the actual Blender editors and sidebar categories. **Scene = Outliner;
  Inspector = Properties.** Their full functions remain available in the floating
  presentation. Do not maintain custom object lists, transform/brush-only Inspector
  copies, duplicated selection state or a More button to reach the real editor.
* Expose the supporting panels present in that workspace, with clear editor names.
  Timeline, node editors and brush/asset shelves open as bottom floating panels
  when the underlying layout places them at the bottom. Reuse the real Timeline
  and shelf rather than substituting a limited playback strip or brush controls.
* Keep workspace switching, project/save status, Camera View and Frame Selection
  discoverable. Preserve the clean header and working tool controls; do not restore
  the rejected Canvas popover as the primary surface.

### Locking and resizing

* Offer a visible lock control in each open panel. At most one side panel and one
  bottom panel can be locked open independently; both may be open together.
* Locking keeps that panel open during ordinary canvas work and outside taps.
  Unlocking restores ordinary panel behavior. An explicit choice of another panel
  in that same area replaces the current panel and clears its lock; it must not
  silently accumulate overlapping locked panels. The other area's lock is unchanged.
* A locked panel's active rail button does not dismiss it. Keep its unlock control
  reachable so the user can unlock and close it without a keyboard or border drag.
* Resize side panels using a broad handle on their inner edge; resize bottom panels
  using a broad handle along their top edge. Support finger, Pencil and pointer.
  Use touch-friendly hit areas instead of requiring Blender's thin split borders.
* Remember the user's panel sizes per workspace. Locking does not disable resizing.
  Opening/switching panels and revisiting a workspace must not reset chosen sizes.
* Clamp sizes to available content bounds and usable minimums. Rotation, narrow
  Stage Manager windows, safe areas and an onscreen keyboard must leave rail,
  resize, unlock and dismissal controls reachable. Avoid side/bottom overlap that
  blocks essential controls when both are open.

### Acceptance criteria

1. Fresh launch, project open and switching through all bundled workspaces show
   each layout's main editor with permanent floating panel buttons immediately.
2. Item / Tool / View and editor buttons open adjacent real content. Closing a
   panel never hides its rail. Scene exposes the full Outliner and Inspector the
   full Properties editor, including functions absent from earlier custom drawers.
3. Timeline, bottom node editors and native brush shelves open from bottom buttons
   in applicable layouts. Workspaces with a node editor as their main area retain it.
4. A side panel and bottom panel can coexist. Lock either or both, interact with the
   main editor, resize while locked, unlock and close. Switching within one area
   affects only that area's panel and lock.
5. Resize with finger, Pencil and pointer; switch away and return to the workspace.
   Verify remembered sizes and reachable controls in portrait, landscape and narrow
   windows. Verify drawing and hit testing follow the resized bounds exactly.
6. Open/close panels repeatedly and switch workspaces without losing editor state,
   object selection, node context, active tools, undo history or saved layout data.
7. Preserve squeeze tools, double-tap context menu, pressure/tilt/hover, navigation,
   keyboard shortcuts, mouse buttons, trackpad input and device hot-plugging.
8. Verify normal desktop builds retain their existing layouts and input behavior.

Aim for roughly 44-point interactive targets in tablet surfaces. Do not globally
enlarge Blender or force a new workspace when an input device connects. A host
concept can demonstrate interaction; only the real iPad build can validate touch,
rendering, panel input ownership and usability.

## Existing Pencil tools to preserve

* **Pencil Squeeze:** opens the nine-tool radial palette.
* **Pencil Double Tap:** opens the context menu (right-click).
* **Header Tools button:** toggles the full left toolbar shelf for touch access.
* Preserve the existing ring geometry, all nine tools and hover behavior. This panel
  milestone does not change the radial design; use the current source and
  PROJECT_HANDOFF.md for its implementation and validation state.
* Selecting a tool dismisses the palette. Outside tap, squeeze again and Escape
  dismiss without executing a tool or moving scene objects. Preserve desktop input.

Panel work must reuse these controls without repurposing the approved gestures.

## Native Files and other unfinished work

Native Open, Save As, Save Copy, unsaved Save and model import/export have incremental
implementations. Their exact source/build history is in PROJECT_HANDOFF.md. Preserve
that work while implementing the active workspace milestone. FBX export currently
reports unsupported because NumPy is unavailable; do not describe every model format
as working or infer complete Files acceptance from a native picker appearing.

The durable Files contract still requires correct document identity for later Save,
security scopes/bookmarks, actual provider I/O coordination, project-folder/sibling
asset access, exporter sidecars/options, cancellation, Open Recent, Link/Append and
recovery. See PRODUCT_DIRECTION.md. UI changes must not erase these unfinished items.

The user also reported that Frame Scene changes navigation feel and limits zoom.
Preserve that report as unresolved; do not change navigation preferences or projection
speculatively while working on panel presentation.

## How sessions stay aligned

PRODUCT_DIRECTION owns the overall contract; this file owns the workspace design
and active UI milestone; PROJECT_HANDOFF owns current facts and next steps.
AGENTS.md requires reading them. Label every item as planned, source-implemented,
compiled, previewed or device-accepted. Record why a design changes; no silent drift.

At session end record what the user can newly do, the exact changed code/build,
validation limits, and the smallest next implementation step. If a confirmed P0
interrupts the milestone, record it and resume the milestone once addressed.
The human supplies device observations and final judgment on consequential design
choices; ordinary layout, coding and backlog decomposition belong to the agent.
