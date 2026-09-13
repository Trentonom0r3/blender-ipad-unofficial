# Workspace validation evidence

The objective is the complete usable iPad app. Passing the checks here proves only
the named layer; it does not complete the product or substitute for device acceptance.

## Shipped layout audit

`build/tests/ipad_workspace_layouts.json` records 33 saved layouts from the factory
startup and the 2D Animation, Sculpting, VFX and Video Editing app templates. Inputs
come from the verified IPA for source e986044, Actions run 34711564344.

The factory startup is embedded in the Mach-O executable. Its extracted bytes match
the pinned upstream LFS SHA-256 exactly:
`5cecc6388292bc565d366a0a88d9139425d9cce2ac85e645fad41541febd4659` (885,428 bytes).
Template bytes are extracted unchanged from the IPA; their hashes are in the fixture.
Blender 5.1.2 on Windows reads the saved RNA area bounds. This is a host file-reading
check, not execution of the iOS layout adapter; runtime borders and header geometry
still require native validation. Additional legacy screens saved inside templates
are included as well as each primary workspace layout.

Reproduce the extraction and inventory without opening UI or saving preferences:

```powershell
python build/inspect_ipad_workspaces.py --ipa path/to/Blender-iPad-Unofficial.ipa --blender 'D:/Program Files/blender.exe'
python -m unittest discover -s build -p 'test_ipad_panels.py' -v
```

The inventory tool verifies packaged data against the recorded hashes before asking
Blender to read it. It writes generated files under `output/workspace-audit`. A changed
upstream pin or startup hash requires a new inspection, not silently regenerated
expectations. The compiled fixture suite runs the actual shipped C++ policy with
independently reviewed primary/editor-edge expectations at four scales/translations
per layout (132 cases), including no lost or duplicated editors.

The audit found and now covers:

- Scripting: full-height Text Editor remains primary; Console and Info below the
  shorter neighboring viewport become bottom panels.
- Masking and Motion Tracking: the dominant footage view remains primary even when
  auxiliary graphs are above it. A small clip view in a custom layout does not take
  over a larger editor.
- Geometry Nodes/Shading: lower node graphs stay bottom; the upper editor stays
  primary. UV Editing, Compositing and Rendering retain their image/node canvas.
- Video Editing: preview stays primary and its lower sequencer stays bottom.

The Scripting fixture fails against 2d8b666's placement behavior and passes with the
repair. Tests also distinguish a smaller bottom footage view from a dominant canvas.

## Device follow-up source repairs

The newest source adds exact native pin press/release capture, native startup shelf
visibility and toolbar sizing, plus GHOST navigation-only pointer streams for direct
touch/Pencil. A per-window snapshot lifecycle test covers replacement, hiding and
window destruction. Both Move and Rotate invocation guards are compiled for iOS
and desktop. These are source checks; the device report confirms earlier left-rail
and Move behavior only, without naming an exact installed run.

## Remaining acceptance gates

| Layer | Evidence | Still required |
| --- | --- | --- |
| Saved layout classification | Compiled policy and 33 shipped layout fixtures | Saved/custom layout changes beyond the fixtures |
| Geometry, pins, preferred sizes | Compiled policy cases including both panels and narrow bounds | Real region drawing and input bounds after rotation/header changes |
| Native editor reuse/context | Source review and iOS compilation checkpoints in PROJECT_HANDOFF | Selection, undo, editor state, context menus and repeated switching on device |
| Side tab typography and selection | BLF/native API review; captured press/release implementation | Device rendering, hover, tooltips, long labels and drag-away cancellation |
| Finger/Pencil/pointer resize | Source integration with GHOST and shared clamped policy | All three input paths on hardware, pinned and unpinned |
| Left/right launcher reachability | Permanent rail geometry and captured tab release | Small Stage Manager widths, overflow and onscreen keyboard |
| Global panel lock | Native navigation gizmo plus fallback; compiled shared lock behavior | Hardware accessibility with navigation hidden, camera/quad views and all editor types |
| Pencil Pan button | Compiled actual invocation guard for desktop/iOS | Pencil press/drag/release on native Move with panels open and closed |
| Working editor splits | Reviewed working sets for 33 layouts; split reconstruction at three window shapes, native split/swap source and multi-editor draw/hit routing | iOS compile; device context/undo/editor preservation; seam resize and launcher reordering |
| Full iPad workflow | Existing Files/Pencil work retained | Native document identity/provider lifecycle, recovery, exports and end-to-end creative tasks |

The old Python dock preview does not execute the C++ floating editor compositor and
must not be used as proof that the new workspace implementation works. Record actual
commit/run, file-reading evidence, build status and hardware observations separately.
