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
        self.assertIn("@interface GHOST_IOSProjectExporter", model_export)
        self.assertIn("@implementation GHOST_IOSProjectExporter", model_export)
        self.assertIn("bool GHOST_IOS_export_file", model_export)

    def test_model_exporter_header_keeps_interface_separate_from_implementation(self):
        model_export = diff_for("intern/ghost/intern/GHOST_ProjectExportIOS.hh")
        declaration = model_export.index("@interface GHOST_IOSProjectExporter")
        interface_end = model_export.index("@end", declaration)
        implementation = model_export.index("@implementation GHOST_IOSProjectExporter")
        self.assertLess(interface_end, implementation)
        self.assertIn("writer:(const std::function<bool(const char *)> &)writer;", model_export)
        self.assertGreater(model_export.index("bool GHOST_IOS_export_file"), implementation)

    def test_native_action_reaches_the_blender_modal_event(self):
        ghost_types = diff_for("intern/ghost/GHOST_Types.h")
        wm_event_types = diff_for("source/blender/windowmanager/wm_event_types.hh")
        event_system = diff_for("source/blender/windowmanager/intern/wm_event_system.cc")
        self.assertIn("GHOST_kEventIOSProjectExport", ghost_types)
        self.assertIn("IPAD_PROJECT_EXPORT = 0x0206", wm_event_types)
        self.assertIn("event.type = IPAD_PROJECT_EXPORT", event_system)

    def test_save_as_moves_document_and_preserves_provider_identity(self):
        save = diff_for("intern/ghost/intern/GHOST_ProjectSaveIOS.hh")
        files = diff_for("source/blender/windowmanager/intern/wm_files.cc")
        self.assertIn("_saveCopy = saveCopy", save)
        self.assertIn("asCopy:_saveCopy", save)
        self.assertIn("[document startAccessingSecurityScopedResource]", save)
        self.assertIn("[document stopAccessingSecurityScopedResource]", save)
        self.assertIn("bookmarkDataWithOptions:0", save)
        self.assertIn('BlenderWorkingProjectBookmark', save)
        self.assertIn('BlenderWorkingProjectPath', save)
        self.assertIn("_generation == generation && _picker", save)
        self.assertIn("GHOST_IOSProjectExportAction_Failed", files)
        self.assertIn("GHOST_IOS_project_document_bookmark_matches(blendfile_path)", files)

    def test_ordinary_save_waits_for_coordinated_provider_write(self):
        save = diff_for("intern/ghost/intern/GHOST_ProjectSaveIOS.hh")
        files = diff_for("source/blender/windowmanager/intern/wm_files.cc")
        menu = diff_for("scripts/startup/bl_ui/space_topbar.py")
        self.assertIn("GHOST_IOS_project_document_bookmark_matches(filepath)", files)
        self.assertIn("return wm_save_provider_invoke(C, op)", files)
        self.assertIn("GHOST_IOS_project_export_publish_update()", files)
        self.assertIn("WM_event_add_modal_handler(C, op)", files)
        self.assertIn("coordinateWritingItemAtURL:destination", save)
        self.assertIn("NSFileCoordinatorWritingForReplacing", save)
        self.assertIn("[destination startAccessingSecurityScopedResource]", save)
        self.assertIn("[destination stopAccessingSecurityScopedResource]", save)
        self.assertIn("_generation == generation && !_picker", save)
        self.assertIn("native_files = \"save_as_to_files\" in dir(bpy.ops.wm)", menu)

    def test_project_folder_import_preserves_sibling_files_and_native_open_lifecycle(self):
        importer = diff_for("intern/ghost/intern/GHOST_ProjectImportIOS.hh")
        api = diff_for("intern/ghost/GHOST_ProjectImport-api.hh")
        files = diff_for("source/blender/windowmanager/intern/wm_files.cc")
        menu = diff_for("scripts/startup/bl_ui/space_topbar.py")
        self.assertIn("GHOST_IOS_import_project_folder()", api)
        self.assertIn("presentWithFolderMode:YES", importer)
        self.assertIn("folderMode ? @[UTTypeFolder]", importer)
        self.assertIn("initForOpeningContentTypes:types asCopy:NO", importer)
        self.assertIn("[source startAccessingSecurityScopedResource]", importer)
        self.assertIn("coordinateReadingItemAtURL:source", importer)
        self.assertIn("[manager copyItemAtURL:readURL toURL:destination", importer)
        self.assertIn("contentsOfDirectoryAtURL:readURL", importer)
        self.assertIn("[source URLByAppendingPathComponent:name]", importer)
        self.assertIn("[self copyItemAtURL:childSource toURL:childDestination", importer)
        self.assertIn("_copyProgress = [[NSProgress progressWithTotalUnitCount:1] retain]", importer)
        self.assertIn("[copyProgress cancel]", importer)
        self.assertIn("if (copyProgress.cancelled)", importer)
        self.assertIn("progress:copyProgress error:&copy_error", importer)
        self.assertIn("enumeratorAtURL:stagingDestination", importer)
        self.assertIn("NSDirectoryEnumerationSkipsPackageDescendants", importer)
        self.assertIn("Choose Project File", importer)
        self.assertIn("handleOpenDocumentRequest(file.path)", importer)
        self.assertIn("generation != _generation", importer)
        self.assertIn("if (_busy && ![self hasLivePresenter])", importer)
        self.assertIn("[_picker dismissViewControllerAnimated:NO completion:nil]", importer)
        self.assertIn("WM_OT_import_project_folder_from_files", files)
        self.assertIn("wm.import_project_folder_from_files", menu)


if __name__ == "__main__":
    unittest.main()
