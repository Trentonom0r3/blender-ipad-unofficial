# Tablet UI visual review

The three `concept-*.png` files are AI-generated proposals based on the user's
iPad screenshot, created with the built-in image generation tool. They are not
implementation screenshots. In particular, the generated Workspace menu has
macOS-like styling; the actual menu must use UIKit's iPad presentation. Icons,
spacing, and panel behavior are proposals rather than pixel-exact specifications.

`windows-current-implementation.png` is an actual Blender 5.1.2 screenshot, captured
by Blender's screenshot operator. It verifies registration and visibility of the
Canvas entry at the start of the viewport header, not native menus, drawer
behavior, or persistent floating controls. The target iPad build uses a different
Blender revision (5.0.0).

Run the isolated preview in PowerShell:

```powershell
& 'D:\Program Files\blender.exe' --factory-startup --disable-autoexec --python build/preview_tablet_ui.py
```

The script extracts the actual Python module from the overlay patch and registers
it only in this process. It does not replace installed scripts or save preferences
or a startup file. Close this preview normally when finished.

Review loop: prototype in real Blender, capture landscape/portrait screenshots,
independent visual review, correct clipping and discoverability, then validate
UIKit menus/Pencil/touch and performance on iPad. Windows alone is insufficient
for a tablet usability sign-off.

## Live sequence review

The preview now captures `windows-01-full-layout.png`, `windows-02-expanded.png`,
`windows-03-restored.png`, and `windows-04-canvas-open.png` at a requested client
size of 1280 by 882 pixels. It checks exact restoration of editor types and sizes.
An initial live panel test found invalid transform icon identifiers; the overlay
now uses icons verified in both Windows Blender and the pinned source revision.

`build/tablet_dock_preview.py` adds an experimental persistent five-button dock
when the tool shelf is hidden. It uses Blender's standard 2D gizmo buttons and
existing tool-selection operators, with visible text labels. It is preview-only,
not yet in the iPad patch. Select/Move/Rotate/Scale are limited to Object and Mesh
Edit modes; the Canvas shortcut remains in other modes. Disabling gizmos also
hides this prototype dock; the header Canvas entry remains available.

The independent review found the large popover suitable as an occasional control
sheet, not a persistent control surface. Default restored Properties widths are
too narrow at this window size; match the iPad's starting panel proportions for
further comparison. Native menu integration and true overlay editor drawers are
not implemented in this preview.
# Radial tool palette — 34fd27e

`pencil-tools-object.png` and `pencil-tools-edit-mesh.png` show the actual overlay
Python UI running in host Blender 5.1.2. `pencil-tools-host-checks.json` records
successful core tool activation in those modes. Reproduce with
`D:/Program Files/blender.exe --factory-startup --disable-autoexec --python build/preview_pencil_tools.py`.
These previews do not include the new iOS GHOST events or C++ pie interaction changes.
They are not evidence of Pencil input, iOS sizing, edge clamping or device usability.
