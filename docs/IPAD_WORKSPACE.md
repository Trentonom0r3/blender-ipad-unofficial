# iPad workspace design and delivery

## User decisions — 2026-09-10

The current Canvas controls location is rejected as the primary interface.
The user explicitly assigns Pencil double tap to the left-toolbar tools (selection,
move, rotate, scale and other mode tools). Pencil Pro squeeze stays the existing
right-click/context menu. These are distinct surfaces and actions. The user further
specified a **radial** Pencil palette. Code 34fd27e implements the new mapping and
first radial surface; host tests pass, iOS compilation/device acceptance are pending.

The goal is a substantial iPad interaction/presentation redesign retaining Blender's
editors, operators and familiar scene/gizmo behavior. Adding commands to the existing
Canvas popover is not the redesign. The agent owns design, prioritization and delivery.

## Intended workspace — design defaults, not yet implemented

* **Center:** viewport dominates, with Blender selection outlines and gizmos. Hide
  the permanent left tool shelf in tablet mode only after its replacement works.
* **Pencil tool palette:** double tap opens a compact transient palette near the
  last valid viewport Pencil position, clamped inside the viewport and safe area.
  Use a stable radial layout of touch-sized tools, per the user's explicit preference.
  Object mode starts with Select, Move, Rotate and Scale; source remaining tools
  from Blender's current mode/tool system, with a More Tools route. Selecting a
  tool dismisses the palette. Outside tap, double tap again and Escape dismiss it.
  Missing/stale cursor placement falls back to an accessible viewport edge.
* **Context menu:** squeeze continues to invoke Blender's context menu at the
  precision cursor. It is not repurposed for tool selection.
* **Touch fallback:** a small Tools edge button opens the identical palette, with
  active-tool indication. Finger-only and non-double-tap Pencil users retain access.
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

## Next session: milestone 1 — tools at the Pencil

Source checkpoint: 34fd27e implements dedicated GHOST/WM Pencil event, radial menu,
touch Tools header entry and separate squeeze context click. The existing Canvas
popover loses its duplicate tool grid and becomes temporary Workspace controls.
More Tools opens Blender's toolbar popup; Hide/Show Shelf preserves full tool access.
Current physical positions: Select west, Move east, Rotate south, Scale north.
Toolbar visibility is not automatically changed in saved layouts. Touch edge-button
placement, active-tool header indication and more mode-specific choices remain refinement.
Build and precise pending device protocol are in PROJECT_HANDOFF.md.

Ship one complete vertical slice, not another visual-only prototype:

1. Inspect the existing Pencil delegate, cursor ownership, mode tool registry,
   Canvas popover and preview tools. Preserve working pressure/tilt/stroke handling.
2. Route double tap to a dedicated Blender tablet-tool action; keep squeeze's
   existing context-click path. Do not hijack a conventional desktop shortcut.
3. Implement the palette using existing Blender tools/operators and a touch entry
   point. Prototype its actual shipped layout in the host preview.
4. Stop presenting the old Canvas popover as the primary tool selector. Retain
   still-needed commands through accessible fallback paths. Make toolbar hiding
   reversible and tablet-specific; don't hide tools until the replacement exists.
5. Validate, commit, build once for coherent code, and give the tester the exact
   artifact and protocol. Report compile/device failures honestly, not as delivery.

Acceptance:

* Object mode: double tap > Move > translate > Undo, then double tap > Select works.
* Squeeze still opens exactly one context menu, without switching tools.
* During an active Pencil stroke/drag, neither action causes accidental tool changes
  or unbalanced button events. Inspect and preserve iPadOS action preferences.
* Palette stays reachable at all viewport edges and after rotation. Outside tap,
  Escape and repeat double tap close it without a scene edit or stuck modal state.
* Touch Tools opens the same palette. Mouse/keyboard controls continue to work.
* Edit Mesh exposes valid tools; unsupported modes keep their existing tool access.
* Separate evidence: actual-code host preview, patch checks, iOS build/IPA, then
  M5 iPad/Pencil acceptance. Do not report preview gestures as hardware tests.

Only after this slice is coherent, proceed to milestone 2: Scene/Inspector drawers
and the camera-blocking workflow. Then playback/project chrome and broader editor
adaptation. Files integration continues as a separate necessary product capability;
unrelated Files work should not consume the entire next UI milestone session.

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
