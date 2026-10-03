# Next native modeling interaction

## Direct Bevel interaction — source candidate, 2026-10-03

The later source candidate enables Edit Mesh finger/Pencil Bevel through the existing native Tools, plus a compact Bevel header popover for native Affect, Width Type, Segments, Profile Type/Shape, Clamp Overlap and Loop Slide. Its cue is "Drag outward, lift to finish". Advanced native settings and the approved nine-tool ring remain available. Only unmodified direct Bevel CLICK_DRAG prioritizes its native tool map over fallback selection; taps, keyboard modifiers and hardware retain their order. Contact-start displacement and native radial pixel margin/Shift gain are retained; transform Fine Drag does not apply to Bevel.

Native preview/rollback backups are reused. Every selected unique edit owner is checked for locked shape keys before acquisition. Direct previews require the original live Object/Mesh/edit-BMesh/key/shape and viewport/scene/tool context. Cancel restores each surviving original Mesh even after its representative shared Object was removed/rebound, discards replaced representations, and warns if restoration is incomplete. A copied native CurveProfile and registration-owner draw detachment make cleanup independent of the old viewport; context-free operator destruction only frees owned data. Workspace switches clear stale spatial context. Pointer cancellation precedes native release confirmation.

All 79 host tests passed, followed by the targeted 10 Bevel tests after the final workspace-teardown correction; 84-file pinned-source preflight and git diff --check pass. Real stock Blender 5.1.2 verifies tool/header/popover properties, retained advanced RNA and native width/segments/profile geometry plus Undo/Redo with explicit headless checkpoints. Compiled tests execute the shipped lifecycle, routing, admission, interruption barrier and native precision mapping with modeled owners/geometry; the host does not execute the new native touch modal lifecycle. Patch SHA-256 `80efe9e5ea535e52d62f1bc4fb19315988bb96276d1afd32d2d385a3bec86cd1`. This candidate still needs its exact native build and downloaded IPA verification; latest verified IPA is corrected Extrude run 37108274789 at 761d62a. No Bevel visual preview or device acceptance is claimed.

Build this exact coherent source once, fix actual native failures and verify the downloaded full archive/arm64 bundle/entire packaged UI. Focused device checks remain selected edge/vertex → native Bevel → outward drag → lift → Undo/Redo, preview → two-finger/Pencil-menu/hardware interruption → rollback, multi-object/shared meshes, custom profiles, shape keys and portrait/narrow settings fit. Preserve accepted Inspector/Pencil mappings, native editors, external input and Files. Continue the full goal without waiting for device feedback; import expansion stays deferred. See TOUCH_MODELING_NEXT.md for the original pinned audit and new evidence.

## Historical Bevel admission audit

The source above implements the bounded audit below; its earlier read-only/gated wording is historical. Native/package/device gates remain distinct.

Prioritize actual interaction and preserve the accepted nine-tool Pencil ring, Inspector, native editors, external input and Files work. Finish exact-source Extrude compilation/artifact verification and any real failures first. This is a read-only source audit, with no Bevel implementation or device evidence.

Pinned Blender source d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e:

- space_toolsystem_toolbar.py940–946 exposes builtin.bevel with native settings and VIEW3D_GGT_tool_generic_handle_normal. blender_default.py7629–7636 invokes mesh.bevel with release_confirm=True.
- editmesh_bevel.cc289–297 snapshots all participating unique edit meshes;338 restores the baseline before each preview;443–463 cancellation restores/frees backups and updates normals/topology/status.
- Release confirmation at688–694 precedes ordinary modal handling. Direct pointer interruption must call native cancel and clear workspace status before that conversion, returning CANCELLED without applying topology.
- The native operator at1073–1082 owns invoke/modal/cancel and Undo. The generic normal tool widget uses its fallback tool keymap and has no Extrude-style is_redo/Undo-pop binding.

Next coherent increment: Edit Mesh only direct canvas admission for builtin.bevel, pointer interruption before release confirmation, concise active-tool feedback and preservation of native width type, segments, profile, edge/vertex affect and advanced settings through native Tools. Audit contact-start coordinates before adding admission: an invoke at the drag threshold must not introduce a displacement jump. Preserve external input and do not assume the transform Fine Drag gain applies; Bevel has its own mouse-to-width precision logic.

Native Bevel retains raw edit-object and custom-profile pointers. Audit owner/region destruction and locked shape-key eligibility before claiming safe touch cancellation. Meaningful checks are preview topology then Cancel, release then one-step Undo/Redo, multi-object meshes, empty selection, two-finger interruption and Pencil menu/hardware handoff. Source/host/package evidence cannot establish iPad comfort. Keep the ring unchanged; access Bevel through native Tools.
