"""Host-only check of the upstream Save Copy semantics reused by native export.

Run with Blender --background --factory-startup --python-exit-code 1 --python ...
This does not exercise the patched C++ adapter, UIKit, or a Files provider.
"""
import hashlib
from pathlib import Path
import tempfile

import bpy


with tempfile.TemporaryDirectory(prefix="blender-copy-contract-") as directory:
    original = Path(directory) / "original.blend"
    copy = Path(directory) / "copy.blend"
    bpy.ops.wm.save_as_mainfile(filepath=str(original))
    original_digest = hashlib.sha256(original.read_bytes()).digest()
    bpy.ops.transform.translate(value=(3, 0, 0))
    # Background execution does not automatically push interactive operator undo.
    bpy.ops.ed.undo_push(message="Unsaved copy test")
    assert bpy.data.is_dirty, "The test must start with unsaved edits"
    expected_location = tuple(bpy.context.object.location)
    original_path = bpy.data.filepath
    result = bpy.ops.wm.save_as_mainfile(filepath=str(copy), copy=True)
    assert result == {'FINISHED'}
    assert bpy.data.filepath == original_path, "Save Copy changed the Save target"
    assert bpy.data.is_dirty, "Save Copy incorrectly cleared unsaved edits"
    assert hashlib.sha256(original.read_bytes()).digest() == original_digest
    assert copy.is_file()
    bpy.ops.wm.open_mainfile(filepath=str(copy), load_ui=False, use_scripts=False)
    assert tuple(bpy.data.objects['Cube'].location) == expected_location
    # Stop referencing a file in the temporary directory before cleanup.
    bpy.ops.wm.read_factory_settings(use_empty=True)

print("PASS: copy contains edits; original bytes, Save target and dirty state preserved")
