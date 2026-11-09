bool ED_area_exit(bContext *C, ScrArea *area)
{
  wmWindowManager *wm = CTX_wm_manager(C);
  wmWindow *win = CTX_wm_window(C);
  ScrArea *prevsa = CTX_wm_area(C);
  ARegion *prevar = CTX_wm_region(C);
#ifdef WITH_APPLE_CROSSPLATFORM
  if (!screen_ipad_paint_owner_teardown_area(C, area)) {
    screen_ipad_context_restore_live(C, win, prevsa, prevar);
    return false;
  }
#endif

  if (area->type && area->type->exit) {
    area->type->exit(wm, area);
  }

  CTX_wm_area_set(C, area);

  LISTBASE_FOREACH (ARegion *, region, &area->regionbase) {
    if (!ED_region_exit(C, region)) {
#ifdef WITH_APPLE_CROSSPLATFORM
      screen_ipad_context_restore_live(C, win, prevsa, prevar);
#else
      CTX_wm_area_set(C, prevsa);
#endif
      return false;
    }
  }

  if (!WM_event_remove_handlers(C, &area->handlers)) {
#ifdef WITH_APPLE_CROSSPLATFORM
    screen_ipad_context_restore_live(C, win, prevsa, prevar);
#else
    CTX_wm_area_set(C, prevsa);
#endif
    return false;
  }
  WM_event_modal_handler_area_replace(win, area, nullptr);

#ifdef WITH_APPLE_CROSSPLATFORM
  screen_ipad_context_restore_live(C, win, prevsa, prevar);
#else
  CTX_wm_area_set(C, prevsa);
#endif
  return true;
}
