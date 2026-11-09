void WM_event_modal_handler_area_replace(wmWindow *win, const ScrArea *old_area, ScrArea *new_area)
{
  LISTBASE_FOREACH (wmEventHandler *, handler_base, &win->modalhandlers) {
    if (handler_base->type == WM_HANDLER_TYPE_OP) {
      wmEventHandler_Op *handler = (wmEventHandler_Op *)handler_base;
      /* File-select handler is quite special.
       * it needs to keep old area stored in handler, so don't change it. */
      if ((handler->context.area == old_area) && (handler->is_fileselect == false)) {
        handler->context.area = new_area;
      }
    }
  }
}

void WM_event_modal_handler_region_replace(wmWindow *win,
                                           const ARegion *old_region,
                                           ARegion *new_region)
{
  LISTBASE_FOREACH (wmEventHandler *, handler_base, &win->modalhandlers) {
    if (handler_base->type == WM_HANDLER_TYPE_OP) {
      wmEventHandler_Op *handler = (wmEventHandler_Op *)handler_base;
      /* File-select handler is quite special.
       * it needs to keep old region stored in handler, so don't change it. */
      if ((handler->context.region == old_region) && (handler->is_fileselect == false)) {
        handler->context.region = new_region;
        handler->context.region_type = new_region ? new_region->regiontype : int(RGN_TYPE_WINDOW);
      }
    }
  }
}
