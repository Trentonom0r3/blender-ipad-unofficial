/* Native initialization bodies from Blender d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e.
 * area.cc and interface_region_hud.cc; surrounding geometry/keymap dependencies
 * are explicit test boundaries. This is not target GPU/UIKit evidence. */
static void region_update_rect(ARegion *region)
{
  region->winx = BLI_rcti_size_x(&region->winrct) + 1;
  region->winy = BLI_rcti_size_y(&region->winrct) + 1;

  /* v2d mask is used to subtract scrollbars from a 2d view. Needs initialize here. */
  BLI_rcti_init(&region->v2d.mask, 0, region->winx - 1, 0, region->winy - 1);
}

void ED_region_floating_init(ARegion *region)
{
  BLI_assert(region->alignment == RGN_ALIGN_FLOAT);

  /* refresh can be called before window opened */
  region_evaulate_visibility(region);

  region_update_rect(region);
}

void ED_region_panels_init(wmWindowManager *wm, ARegion *region)
{
  UI_view2d_region_reinit(&region->v2d, V2D_COMMONVIEW_PANELS_UI, region->winx, region->winy);

  /* Place scroll bars to the left if left-aligned, right if right-aligned. */
  if (region->alignment & RGN_ALIGN_LEFT) {
    region->v2d.scroll &= ~V2D_SCROLL_RIGHT;
    region->v2d.scroll |= V2D_SCROLL_LEFT;
  }
  else if (region->alignment & RGN_ALIGN_RIGHT) {
    region->v2d.scroll &= ~V2D_SCROLL_LEFT;
    region->v2d.scroll |= V2D_SCROLL_RIGHT;
  }

  wmKeyMap *keymap = WM_keymap_ensure(
      wm->runtime->defaultconf, "View2D Buttons List", SPACE_EMPTY, RGN_TYPE_WINDOW);
  WM_event_add_keymap_handler(&region->runtime->handlers, keymap);
}

static void hud_region_init(wmWindowManager *wm, ARegion *region)
{
  ED_region_panels_init(wm, region);

  /* Reset zoom from panels init because we don't want zoom allowed for redo panel. */
  region->v2d.maxzoom = 1.0f;
  region->v2d.minzoom = 1.0f;

  UI_region_handlers_add(&region->runtime->handlers);
  region->flag |= RGN_FLAG_TEMP_REGIONDATA;
}

void ED_area_update_region_sizes(wmWindowManager *wm, wmWindow *win, ScrArea *area)
{
  if (!(area->flag & AREA_FLAG_REGION_SIZE_UPDATE)) {
    return;
  }
  const bScreen *screen = WM_window_get_active_screen(win);

  rcti window_rect;
  WM_window_screen_rect_calc(win, &window_rect);
  area_calc_totrct(screen, area, &window_rect);

  /* region rect sizes */
  area_region_rects_calc(win, area);

  /* Dynamically sized regions may have changed region sizes, so we have to force azone update. */
  area_azone_init(win, screen, area);

  LISTBASE_FOREACH (ARegion *, region, &area->regionbase) {
    if (region->flag & RGN_FLAG_POLL_FAILED) {
      continue;
    }
    region_evaulate_visibility(region);

    /* region size may have changed, init does necessary adjustments */
    if (region->runtime->type->init) {
      region->runtime->type->init(wm, region);
    }

    /* Some AZones use View2D data which is only updated in region init, so call that first! */
    region_azones_add(screen, area, region);
  }
  ED_area_azones_update(area, win->eventstate->xy);

  area->flag &= ~AREA_FLAG_REGION_SIZE_UPDATE;
}
