# Portable Blender project copy on iPad

Status: source audit, 2026-10-02. The latest packaged IPA is run 36952644773 at `1abeea2`; it can snapshot one `.blend` with its containing folder, but no exported project has device portability acceptance.

## Current boundary

A Link/Append pick is copied to an app-owned `Documents/Libraries/BlenderLibrary-UUID` snapshot. The new folder choice retains assets inside that selected folder, so the library can use its relative textures while it remains in the app. A main `.blend` sent elsewhere without this snapshot still depends on a path unavailable there. The current iPad Save Copy branch in `wm_save_to_files_modal` deliberately writes with `BLO_WRITE_PATH_REMAP_ABSOLUTE`, preserving the active filepath and dirty marker while making an independent single-file copy; changing that default would not carry library bytes or sidecars.

A simple chain of Blender's existing Pack Linked Libraries and Save Copy operators is insufficient. In the [pinned Blender packing source](https://github.com/blender/blender/blob/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e/source/blender/blenkernel/intern/packedFile.cc#L801-L835), `BKE_packedfile_pack_all_libraries` refuses any non-relative library path before it packs. `BKE_packedfile_pack_all` also skips movie and image-sequence resources. The packing operators mutate the active Main and are undoable; cancellation after packing would leave the current session changed unless the flow explicitly manages that state. The existing External Data menu still exposes these operators for users who understand their limits.

## Target workflow

Offer an explicit **Portable Project Copy** alongside ordinary Save Copy. It should create a separate project and its referenced library folders in a visible app-owned export folder, preserve relative paths within that folder, and let the user copy the complete folder through Files. The active project path, provider bookmark, scene edits and ordinary Save/Save Copy behavior must remain unchanged. The current `wm_file_write` already runs pre-save callbacks and edit/asset flushes even for Save Copy, so byte-for-byte immutability of the live Main cannot be assumed. Missing or inaccessible dependencies should be listed before publishing; a partial bundle must not be labeled portable.

The [pinned blend writer](https://github.com/blender/blender/blob/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e/source/blender/blenloader/intern/writefile.cc#L1725-L1845) audit found that `BLO_write_file` temporarily changes `Main.filepath` for remapping and backs up/restores enumerated paths when `use_save_as_copy` is true. That protects ordinary path changes, but it does not itself copy library bytes or redirect individual libraries into a bundle. The next implementation step is a staged-write spike: inventory the exact library paths in the live Main, map each to a copied sibling folder, write a separate `.blend` with those paths, and restore every temporary path on both success and failure. Check that the staged file reopens with the copied links before any Files export UI is added. Only after that source-backed seam is established should the native Files folder-export and cancellation lifecycle be added. Packing may be an optional separate route, but it must report absolute-path and unsupported-resource limits rather than silently claiming a self-contained file.

## Acceptance

- Link from a folder with a `.blend` and relative texture, save a main project, export the portable copy, move the whole export folder through Files, and reopen it after the original app-owned library location is unavailable. Linked objects and textures must resolve.
- Repeat with multiple linked libraries, nested paths, a missing dependency and a provider whose access is revoked. Failure must retain the current scene and an intact prior export.
- Cancel before and after staging; no partial visible bundle or stale callback remains. A successful export is visible and manageable in Files.
- Ordinary Save, Save As, Save Copy, Append, Pencil, touch editors and external input keep their existing behavior. Host/source checks and native IPA packaging are separate from a real iPad move-and-reopen test.
