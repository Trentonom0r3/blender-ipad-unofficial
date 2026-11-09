static int rna_Area_type_get(PointerRNA *ptr)
{
  ScrArea *area = (ScrArea *)ptr->data;
  /* Usually 'spacetype' is used. It lags behind a bit while switching area
   * type though, then we use 'butspacetype' instead (#41435). */
  return (area->butspacetype == SPACE_EMPTY) ? area->spacetype : area->butspacetype;
}

static void rna_Area_type_set(PointerRNA *ptr, int value)
{
  if (ELEM(value, SPACE_TOPBAR, SPACE_STATUSBAR)) {
    /* Special case: An area can not be set to show the top-bar editor (or
     * other global areas). However it should still be possible to identify
     * its type from Python. */
    return;
  }

  ScrArea *area = (ScrArea *)ptr->data;
  /* Empty areas are locked. */
  if ((value == SPACE_EMPTY) || (area->spacetype == SPACE_EMPTY)) {
    return;
  }

  area->butspacetype = value;
}

static void rna_Area_type_update(bContext *C, PointerRNA *ptr)
{
  bScreen *screen = (bScreen *)ptr->owner_id;
  ScrArea *area = (ScrArea *)ptr->data;

  /* Running update without having called 'set', see: #64049 */
  if (area->butspacetype == SPACE_EMPTY) {
    return;
  }

  wmWindowManager *wm = CTX_wm_manager(C);
  wmWindow *win;
  /* XXX this call still use context, so we trick it to work in the right context */
  for (win = static_cast<wmWindow *>(wm->windows.first); win; win = win->next) {
    if (screen == WM_window_get_active_screen(win)) {
      wmWindow *prevwin = CTX_wm_window(C);
      ScrArea *prevsa = CTX_wm_area(C);
      ARegion *prevar = CTX_wm_region(C);

      CTX_wm_window_set(C, win);
      CTX_wm_area_set(C, area);
      CTX_wm_region_set(C, nullptr);

      if (!ED_area_newspace(C, area, area->butspacetype, true)) {
        area->butspacetype = SPACE_EMPTY;
        CTX_wm_window_set(C, prevwin);
        CTX_wm_area_set(C, prevsa);
        CTX_wm_region_set(C, prevar);
        return;
      }
      ED_area_tag_redraw(area);

      /* Unset so that rna_Area_type_get uses spacetype instead. */
      area->butspacetype = SPACE_EMPTY;

      /* It is possible that new layers becomes visible. */
      if (area->spacetype == SPACE_VIEW3D) {
        DEG_tag_on_visible_update(CTX_data_main(C), false);
      }
      else if (area->spacetype == SPACE_NODE) {
        blender::ed::space_node::snode_set_context(*C);
      }

      CTX_wm_window_set(C, prevwin);
      CTX_wm_area_set(C, prevsa);
      CTX_wm_region_set(C, prevar);
      break;
    }
  }

  /* The set of visible geometry nodes gizmos depends on the visible node editors. So if a node
   * editor becomes visible/invisible, the gizmos have to be updated. */
  WM_main_add_notifier(NC_NODE | ND_NODE_GIZMO, nullptr);
}
