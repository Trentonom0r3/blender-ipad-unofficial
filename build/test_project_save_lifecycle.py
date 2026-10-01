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

    def test_native_import_callback_uses_a_live_operator_lease(self):
        events = diff_for("source/blender/windowmanager/intern/wm_event_system.cc")
        self.assertIn("ipad_native_import_tokens.erase(file_operator)", events)
        self.assertIn("ipad_native_import_tokens[op] = picker_token", events)
        self.assertIn("[wm, op, picker_token](const char *local_path)", events)
        self.assertIn("[wm, op, picker_token]()", events)
        self.assertEqual(
            events.count("wm_ipad_import_operator_is_live(wm, op, picker_token)"), 4
        )
        self.assertIn("it->second != token", events)
        self.assertIn("!G_MAIN", events)
        self.assertLess(
            events.index("LISTBASE_FOREACH (wmWindowManager *, manager, &G_MAIN->wm)"),
            events.index("LISTBASE_FOREACH (wmWindow *, win, &candidate->windows)"),
        )
        self.assertNotIn("auto is_op_live =", events)
        importer = diff_for("intern/ghost/intern/GHOST_ProjectImportIOS.hh")
        api = diff_for("intern/ghost/GHOST_ProjectImport-api.hh")
        self.assertIn("std::function<bool(const char *local_path)>", api)
        self.assertIn("const bool accepted = copied && onPicked", importer)
        self.assertIn("if (!accepted)", importer)
        self.assertIn("removeItemAtURL:importDir", importer)
        self.assertIn("return false;", events)
        self.assertIn("WM_event_fileselect_event(wm, op, EVT_FILESELECT_EXEC);\n+              return true;", events)

    def test_link_append_files_copy_survives_and_cancel_cleans_up(self):
        events = diff_for("source/blender/windowmanager/intern/wm_event_system.cc")
        importer = diff_for("intern/ghost/intern/GHOST_ProjectImportIOS.hh")
        api = diff_for("intern/ghost/GHOST_ProjectImport-api.hh")
        self.assertIn('STREQ(idname, "WM_OT_link") || STREQ(idname, "WM_OT_append")', events)
        self.assertIn('GHOST_IOS_pick_blend_library(', events)
        self.assertIn("browser_path.push_back('/')", events)
        self.assertIn('WM_event_fileselect_event(wm, op, EVT_FILESELECT_FULL_OPEN)', events)
        self.assertIn('ipad_native_library_paths.erase(handler->op)', events)
        self.assertIn('GHOST_IOS_discard_blend_library(library->second.c_str())', events)
        self.assertIn('URLByAppendingPathComponent:@"Libraries" isDirectory:YES', importer)
        self.assertIn('libraryCopy ? @"BlenderLibrary" : @"BlenderImport"', importer)
        self.assertIn('coordinateReadingItemAtURL:source', importer)
        self.assertIn('libraryCopy:YES', importer)
        self.assertIn('GHOST_IOS_discard_blend_library', api)

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

    def test_project_switch_waits_for_a_completed_save(self):
        files = diff_for("source/blender/windowmanager/intern/wm_files.cc")
        branch = files[files.index("+      if ((status & OPERATOR_FINISHED) == 0) {"):]
        branch = branch[:branch.index("diff --git ") if "diff --git " in branch else len(branch)]
        self.assertIn("         execute_callback = false;", branch)
        self.assertIn("+        if ((status & OPERATOR_RUNNING_MODAL) && callback) {", branch)
        self.assertIn("Finish saving to Files, then open the project again", branch)
        self.assertIn("data->post_close_callback = ipad_close_callback_handoff", files)
        self.assertIn("GHOST_IOS_project_export_queue_close_resume(ticket)", files)
        self.assertIn("wm_ipad_close_after_save_resume(bContext *C", files)
        self.assertIn("wm_close_file_dialog(C, pending.callback)", files)
        self.assertIn("execute_callback && ipad_close_callback_handoff == nullptr", files)
        self.assertIn("WM_generic_callback_free(data->post_close_callback)", files)
        self.assertIn("window != pending.window || CTX_data_main(C) != pending.main", files)
        self.assertIn("ipad_file_modified_generation != pending.modification_generation", files)
        event_types = diff_for("intern/ghost/GHOST_Types.h")
        window = diff_for("source/blender/windowmanager/intern/wm_window.cc")
        native_save = diff_for("intern/ghost/intern/GHOST_ProjectSaveIOS.hh")
        self.assertIn("GHOST_kEventIOSProjectCloseResume", event_types)
        self.assertIn("wm_ipad_close_after_save_resume(C, win", window)
        self.assertIn("data_ = &ticket_", native_save)

    def test_provider_recent_checks_before_unsaved_prompt_and_validates_ticket(self):
        native = diff_for("intern/ghost/intern/GHOST_ProjectRecentIOS.hh")
        files = diff_for("source/blender/windowmanager/intern/wm_files.cc")
        window = diff_for("source/blender/windowmanager/intern/wm_window.cc")
        api = diff_for("intern/ghost/GHOST_ProjectImport-api.hh")
        self.assertIn("coordinateReadingItemAtURL:provider", native)
        self.assertIn("[self showResult]", native)
        self.assertIn("_localDigest isEqualToData:_expectedDigest", native)
        self.assertIn("_providerDigest isEqualToData:_expectedDigest", native)
        self.assertIn("GHOST_IOS_recent_project_is_ready", api)
        self.assertIn("GHOST_IOS_recent_project_is_ready(recent->path, recent->ticket)", window)
        self.assertIn("if (recent->load_ui_set)", window)
        self.assertIn("if (recent->use_scripts_set)", window)
        self.assertLess(files.index("GHOST_IOS_recent_project_begin(path,"),
                        files.index("GHOST_IOS_recent_project_commit(filepath, recent_ticket)"))
        self.assertIn("GHOST_IOS_recent_project_commit(filepath, recent_ticket)", files)
        self.assertIn("GHOST_IOS_recent_project_finish_open(recent_ticket, success)", files)
        self.assertIn("GHOST_IOS_recent_project_cancel();", files)

    def test_files_linked_open_keeps_document_identity_and_local_working_file(self):
        importer = diff_for("intern/ghost/intern/GHOST_ProjectImportIOS.hh")
        save = diff_for("intern/ghost/intern/GHOST_ProjectSaveIOS.hh")
        api = diff_for("intern/ghost/GHOST_ProjectImport-api.hh")
        files = diff_for("source/blender/windowmanager/intern/wm_files.cc")
        menu = diff_for("scripts/startup/bl_ui/space_topbar.py")

        self.assertIn("GHOST_IOS_open_provider_project()", api)
        self.assertIn("presentWithFolderMode:NO linkedMode:YES", importer)
        self.assertIn("presentWithFolderMode:NO linkedMode:NO", importer)
        self.assertIn("presentWithFolderMode:YES linkedMode:NO", importer)
        self.assertIn("bookmarkDataWithOptions:0", importer)
        self.assertIn("if (!linkedBookmark.length || !linkedDigest.length)", importer)
        self.assertIn("GHOST_IOS_remember_imported_project_bookmark(file.path, documentPath, bookmark, digest)", importer)
        self.assertLess(
            importer.index("handleOpenDocumentRequest(file.path)"),
            importer.index("GHOST_IOS_remember_imported_project_bookmark(file.path, documentPath, bookmark, digest)"),
        )

        self.assertIn('@"documentPath": documentPath', save)
        self.assertIn('@"digest": digest', save)
        self.assertIn('@"bookmark": bookmark', save)
        self.assertIn("_documentPath = [documentPath copy]", save)
        self.assertIn("_workingPath = [path copy]", save)
        self.assertIn("[destination.path isEqualToString:expected]", save)
        self.assertIn("coordinateWritingItemAtURL:destination", save)
        self.assertIn("[bytes writeToFile:working options:NSDataWritingAtomic", save)
        self.assertIn("GHOST_IOSProjectExportAction_MirrorFailed", api)
        self.assertIn("GHOST_IOSProjectExportAction_Conflict", api)
        self.assertIn("[currentDigest isEqualToData:expectedDigest]", save)
        self.assertIn("GHOST_IOS_remember_project_digest(working, newDigest)", save)
        self.assertIn("GHOST_IOSProjectExportAction_MirrorFailed", files)
        self.assertIn("WM_OT_open_provider_project_from_files", files)
        self.assertIn("wm.open_provider_project_from_files", menu)
        self.assertIn("Open Project Copy...", menu)

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
