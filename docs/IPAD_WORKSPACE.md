# iPad workspace design and delivery

## Nine-tool ring with swapped gesture mapping — implemented

User approved the nine-tool radial arrangement with updated mapping:
* **Pencil Squeeze**: opens the nine-tool radial palette.
* **Pencil Double Tap**: opens the context menu (right-click).
* **Header Tools button**: toggles the left toolbar shelf directly (`space_data.show_region_toolbar`).
* **Settings in center**: menu with "Show/Hide Tool Shelf" toggle.

Implementation took over from an interrupted/partial agent session and completed:
* Geometry: custom 10-button placement in `interface_ipad_tool_ring.hh` (9 clockwise tools: Select, Cursor, Move, Rotate, Scale, Transform, Annotate, Measure, Add Cube; plus central Settings button). Adaptive grid fallback handles narrow viewports.
* Dismissal: second squeeze or tapping outside/between buttons dismisses without executing tools or moving scene objects.
* Shipped icons: Annotate uses Blender's built-in `GREASEPENCIL` icon identifier.
* Add Cube selects the interactive tool (`builtin.primitive_cube_add`), confirmed not to create objects on activation.
* Verification: host C++ geometry tests pass, headless Blender tool activation tests pass in Object and Edit Mesh modes, and patch preflight passes across all 29 pinned source files.

## Latest requested refinement — concept only, awaiting review

User says the current radial selector works great on iPad. Requested changes:
* Hide the left shelf initially; header Tools remains the explicit visibility toggle.
* Remove center Settings; leave the center empty.
* Keep all nine tools, use shorter/slimmer Z-menu-like buttons, and reduce radial spacing.
* Preserve squeeze = tools and double tap = context menu.

Concept: `output/ui-preview/pencil-tools-compact-concept.png`. This is an illustrative
mockup, not a render or validation of implemented geometry. No production radial or
shelf-default changes in this revision until the user reviews the concept.

Native Files replacement now takes engineering priority over further drawers/UI work.
The user also reports Frame Scene changes navigation feel and limits zoom. Preserve
that report as unresolved; the button currently invokes stock `view3d.view_all`.

## Intended workspace — design defaults, not yet implemented

* **Center:** viewport dominates, with Blender selection outlines and gizmos. Hide
  the permanent left tool shelf in tablet mode only after its replacement works.
* **Pencil tool palette:** squeeze opens a compact transient palette near the
  last valid viewport Pencil position, clamped inside the viewport and safe area.
  Use a stable radial layout of touch-sized tools, per the user's explicit preference.
  Object mode has nine direct tools from Blender's mode/tool system. Selecting a
  tool dismisses the palette. Outside tap, squeeze again and Escape dismiss it.
  Missing/stale cursor placement falls back to an accessible viewport edge.
* **Context menu:** double tap continues to invoke Blender's context menu at the
  precision cursor. It is not repurposed for tool selection.
* **Touch fallback:** header Tools toggles the full left shelf. Finger-only users retain tool access.
* **Right edge:** Scene and Inspector tabs open one drawer at a time. Scene finds,
  selects and hides objects/cameras. Inspector starts with selection transforms
  and camera lens; More opens the appropriate full Blender editor. Do not duplicate
  Blender data or maintain a second selection state. Drawers close explicitly and
  by their tab; they never require accurate border dragging to escape.
* **Bottom:** a compact playback/scrub strip expands into the full Timeline on
  demand. Camera View and Frame Selection are immediately accessible scene actions.
* **Top:** compact project/save/status and workspace switching. Full Blender is a
  reversible state, with an obvious return to the tablet workspace. Preserve saved
  editor layouts rather than rewriting every project on load.
* **Portrait/narrow windows:** narrower single-column drawers or bottom sheets,
  bounded to available space; opening a surface must leave its dismissal reachable.
  Exact placement/size is adjusted from preview and device evidence, not frozen here.

Aim for roughly 44-point interactive targets in tablet surfaces. Do not globally
enlarge Blender. Preserve keyboard shortcuts, mouse buttons, trackpad navigation
and hot-plugging. Do not force a new workspace when an input device connects.

## Delivery state and next priority

The nine-tool Pencil milestone is implemented and received positive hardware feedback.
The current ring retains its center Settings until the compact concept is approved.
Do not rebuild the old six-tool/More Tools design or restore the superseded gesture mapping.

Next engineering milestone is the native Files lifecycle, preserving document identity,
operator settings, sidecar assets, cancellation and unsaved-change handling. An explicit
Save Copy is useful but does not fulfill in-place Save As. See PRODUCT_DIRECTION.md and
the newest PROJECT_HANDOFF.md section for implementation status and exact next steps.

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
