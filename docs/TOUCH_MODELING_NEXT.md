# Next native modeling interaction

Prioritize actual interaction and preserve the accepted nine-tool Pencil ring, Inspector, native editors, external input and Files work. Finish exact-source Extrude compilation/artifact verification and any real failures first. This is a read-only source audit, with no Bevel implementation or device evidence.

Pinned Blender source d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e:

- space_toolsystem_toolbar.py940–946 exposes builtin.bevel with native settings and VIEW3D_GGT_tool_generic_handle_normal. blender_default.py7629–7636 invokes mesh.bevel with release_confirm=True.
- editmesh_bevel.cc289–297 snapshots all participating unique edit meshes;338 restores the baseline before each preview;443–463 cancellation restores/frees backups and updates normals/topology/status.
- Release confirmation at688–694 precedes ordinary modal handling. Direct pointer interruption must call native cancel and clear workspace status before that conversion, returning CANCELLED without applying topology.
- The native operator at1073–1082 owns invoke/modal/cancel and Undo. The generic normal tool widget uses its fallback tool keymap and has no Extrude-style is_redo/Undo-pop binding.

Next coherent increment: Edit Mesh only direct canvas admission for builtin.bevel, pointer interruption before release confirmation, concise active-tool feedback and preservation of native width type, segments, profile, edge/vertex affect and advanced settings through native Tools. Audit contact-start coordinates before adding admission: an invoke at the drag threshold must not introduce a displacement jump. Preserve external input and do not assume the transform Fine Drag gain applies; Bevel has its own mouse-to-width precision logic.

Native Bevel retains raw edit-object and custom-profile pointers. Audit owner/region destruction and locked shape-key eligibility before claiming safe touch cancellation. Meaningful checks are preview topology then Cancel, release then one-step Undo/Redo, multi-object meshes, empty selection, two-finger interruption and Pencil menu/hardware handoff. Source/host/package evidence cannot establish iPad comfort. Keep the ring unchanged; access Bevel through native Tools.
