"""Inventory exact pinned Blender paths that can detach a Pencil paint owner.

This static audit complements the source-executing teardown fixtures. It does
not execute WM callbacks or establish UIKit/device behavior.
"""
from pathlib import Path
import re
import unittest

from test_compact_shelf import function
from test_touch_extrude import changed_source

ROOT = Path(__file__).resolve().parents[1]
WORKFLOW = (ROOT / '.github/workflows/build-ipa.yml').read_text(encoding='utf-8')
PIN = re.search(r'^  BLENDER_COMMIT: ([0-9a-f]{40})\s*$', WORKFLOW, re.MULTILINE).group(1)
PIN_ROOT = ROOT / '.cache' / 'preflight' / PIN

AREA_PATH = 'source/blender/editors/screen/area.cc'
SCREEN_PATH = 'source/blender/editors/screen/screen_edit.cc'
SCREEN_OPS_PATH = 'source/blender/editors/screen/screen_ops.cc'
WM_PATH = 'source/blender/windowmanager/intern/wm_event_system.cc'


def pinned(path):
    return (PIN_ROOT / path).read_text(encoding='utf-8')


def calls(source, name):
    return len(re.findall(r'\b' + re.escape(name) + r'\s*\(', source))


AREA = pinned(AREA_PATH)
SCREEN_BASE = pinned(SCREEN_PATH)
SCREEN = changed_source(SCREEN_PATH)
SCREEN_OPS = changed_source(SCREEN_OPS_PATH)
WM = changed_source(WM_PATH)


class PencilPaintDestructiveRouteTests(unittest.TestCase):
    def test_every_pinned_live_area_region_pointer_replacement_is_classified(self):
        # These are call-site inventories (the WM implementation/declarations
        # are excluded). A newly added native path must receive an explicit
        # owner-lifecycle review before this allowlist is updated.
        self.assertEqual(calls(AREA, 'WM_event_modal_handler_region_replace'), 1)
        self.assertEqual(calls(SCREEN_BASE, 'WM_event_modal_handler_region_replace'), 1)
        self.assertEqual(calls(SCREEN_OPS, 'WM_event_modal_handler_region_replace'), 1)
        self.assertEqual(calls(AREA, 'WM_event_modal_handler_area_replace'), 1)
        self.assertEqual(calls(SCREEN_BASE, 'WM_event_modal_handler_area_replace'), 1)

        offscreen_exit = function(AREA, 'static void area_offscreen_exit(')
        self.assertEqual(calls(offscreen_exit, 'WM_event_modal_handler_region_replace'), 1)
        offscreen_create = function(AREA, 'ScrArea *ED_area_offscreen_create(')
        self.assertNotIn('BLI_addtail(&screen->areabase', offscreen_create)

        region_registered = function(WM, 'static bool wm_ipad_pencil_paint_handler_registered(')
        self.assertIn('LISTBASE_FOREACH (ScrArea *, area, &screen->areabase)', region_registered)
        self.assertIn('uintptr_t(area) != handler->ipad_pencil_area', region_registered)

        region_exit = function(SCREEN, 'void ED_region_exit(')
        region_teardown = 'WM_event_ipad_pencil_paint_owner_teardown(C, win, nullptr, region);'
        self.assertLess(region_exit.index(region_teardown),
                        region_exit.index('region->runtime->type->exit'))
        self.assertLess(region_exit.index(region_teardown),
                        region_exit.index('WM_event_modal_handler_region_replace'))

        area_exit = function(SCREEN, 'void ED_area_exit(')
        area_teardown = 'WM_event_ipad_pencil_paint_owner_teardown(C, paint_owner_win, area, nullptr);'
        self.assertLess(area_exit.index(area_teardown),
                        area_exit.index('WM_event_modal_handler_area_replace'))
        self.assertLess(area_exit.index(area_teardown), area_exit.index('area->type->exit'))

        pullout = function(SCREEN_OPS, 'static wmOperatorStatus area_join_modal(')
        pullout_teardown = 'WM_event_ipad_pencil_paint_owner_teardown(C, jd->win1, jd->sa1, nullptr);'
        self.assertLess(pullout.index(pullout_teardown),
                        pullout.index('WM_event_modal_handler_region_replace(jd->win1'))

    def test_all_pinned_area_removals_flow_through_the_reviewed_exit(self):
        screen_delarea = function(SCREEN, 'static void screen_delarea(')
        self.assertLess(screen_delarea.index('ED_area_exit(C, area);'),
                        screen_delarea.index('BKE_screen_area_free(area);'))
        area_newspace = function(changed_source(AREA_PATH), 'void ED_area_newspace(')
        self.assertLess(area_newspace.index('ED_area_exit(C, area);'),
                        area_newspace.index('area->spacetype = type;'))
        swapspace = function(changed_source(AREA_PATH), 'void ED_area_swapspace(')
        self.assertEqual(calls(swapspace, 'ED_area_exit'), 2)
        self.assertLess(swapspace.index('ED_area_exit(C, sa2);'),
                        swapspace.index('ED_area_data_copy(sa1, sa2, true);'))

    def test_file_read_and_window_close_retire_before_modal_list_destruction(self):
        files = changed_source('source/blender/windowmanager/intern/wm_files.cc')
        setup = function(files, 'static BlendFileReadWMSetupData *wm_file_read_setup_wm_init(')
        hook = 'WM_event_ipad_pencil_paint_owner_teardown(C, win, nullptr, nullptr);'
        self.assertLess(setup.index(hook), setup.index('WM_event_remove_handlers(C, &win->modalhandlers);'))

        window = changed_source('source/blender/windowmanager/intern/wm_window.cc')
        close = function(window, 'void wm_window_close(')
        self.assertLess(close.index(hook), close.index('BLI_remlink(&wm->windows, win);'))
        self.assertLess(close.index(hook), close.index('WM_event_remove_handlers(C, &win->modalhandlers);'))

    def test_native_modal_handler_bulk_removal_callers_remain_bounded(self):
        # Blender's low-level API frees without a cancel callback. Scan every
        # cached pinned C/C++ source file so a new caller cannot evade review.
        matches = []
        for source in (PIN_ROOT / 'source').rglob('*'):
            if source.suffix not in {'.c', '.cc', '.h', '.hh'}:
                continue
            for line_number, line in enumerate(
                    source.read_text(encoding='utf-8').splitlines(), 1):
                if not re.search(r'\bWM_event_remove_modal_handler_all\s*\(', line):
                    continue
                if re.search(r'\bvoid\s+WM_event_remove_modal_handler_all\s*\(', line):
                    continue  # declaration or implementation, not a caller
                matches.append((source.relative_to(PIN_ROOT).as_posix(), line_number))
        expected_path = 'source/blender/makesrna/intern/rna_wm.cc'
        self.assertEqual([path for path, _ in matches], [expected_path, expected_path])

        rna = pinned(expected_path)
        invoke = function(rna, 'static wmOperatorStatus rna_operator_invoke_cb(')
        execute = function(rna, 'static wmOperatorStatus rna_operator_exec_cb(')
        for callback in (invoke, execute):
            self.assertIn('op->type->rna_ext.call(C, &opr, func, &list)', callback)
            self.assertIn('if (UNLIKELY(has_error))', callback)
            self.assertLess(callback.index('if (UNLIKELY(has_error))'),
                            callback.index('WM_event_remove_modal_handler_all(op, false);'))



if __name__ == '__main__':
    unittest.main(verbosity=2)
