"""Guard the native project-save handoff against retaining Blender context in UIKit."""

from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
PATCH = (ROOT / "patches/blender-ipad.patch").read_text(encoding="utf-8")


def diff_for(path: str) -> str:
    marker = f"diff --git a/{path} b/{path}\n"
    start = PATCH.index(marker)
    end = PATCH.find("\ndiff --git ", start + len(marker))
    return PATCH[start:] if end < 0 else PATCH[start:end]


class ProjectSaveLifecycleTests(unittest.TestCase):
    def test_blender_serializes_only_from_the_live_modal_operator(self):
        files = diff_for("source/blender/windowmanager/intern/wm_files.cc")
        self.assertIn("WM_event_add_modal_handler(C, op)", files)
        self.assertIn("wm_file_write(C, staging_path, flags, remap, true, op->reports)", files)
        self.assertIn("GHOST_IOS_project_export_take_action", files)
        self.assertNotIn("[C](const char *staging_path", files)
        self.assertNotIn("GHOST_IOS_export_project(", files)
        self.assertNotIn("GHOST_IOS_save_as_project(", files)

    def test_native_picker_holds_no_blender_context_or_writer_callback(self):
        save = diff_for("intern/ghost/intern/GHOST_ProjectSaveIOS.hh")
        self.assertIn("GHOST_kEventIOSProjectExport, _window", save)
        self.assertIn("_pendingAction = action", save)
        self.assertNotIn("bContext", save)
        self.assertNotIn("std::function", save)

        model_export = diff_for("intern/ghost/intern/GHOST_ProjectExportIOS.hh")
        self.assertNotIn("_compressWriter", model_export)
        self.assertNotIn("_on_saved", model_export)
        self.assertNotIn("presentWithCompressPrompt", model_export)

    def test_native_action_reaches_the_blender_modal_event(self):
        ghost_types = diff_for("intern/ghost/GHOST_Types.h")
        wm_event_types = diff_for("source/blender/windowmanager/wm_event_types.hh")
        event_system = diff_for("source/blender/windowmanager/intern/wm_event_system.cc")
        self.assertIn("GHOST_kEventIOSProjectExport", ghost_types)
        self.assertIn("IPAD_PROJECT_EXPORT = 0x0206", wm_event_types)
        self.assertIn("event.type = IPAD_PROJECT_EXPORT", event_system)


if __name__ == "__main__":
    unittest.main()
