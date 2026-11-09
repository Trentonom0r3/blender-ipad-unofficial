bool ED_area_newspace(bContext *C, ScrArea *area, int type, const bool skip_region_exit)
{
  wmWindow *win = CTX_wm_window(C);
  SpaceType *st = BKE_spacetype_from_id(type);

  if (area->spacetype != type) {
    SpaceLink *slold = static_cast<SpaceLink *>(area->spacedata.first);
    /* store area->type->exit callback */
    void (*area_exit)(wmWindowManager *, ScrArea *) = area->type ? area->type->exit : nullptr;
    /* When the user switches between space-types from the type-selector,
     * changing the header-type is jarring (especially when using Ctrl-MouseWheel).
     *
     * However, add-on install for example, forces the header to the top which shouldn't
     * be applied back to the previous space type when closing - see: #57724
     *
     * Newly-created windows won't have any space data, use the alignment
     * the space type defaults to in this case instead
     * (needed for preferences to have space-type on bottom).
     */

    bool sync_header_alignment = false;
    RegionTypeAlignInfo region_align_info[RGN_TYPE_NUM];
    if ((slold != nullptr) && (slold->link_flag & SPACE_FLAG_TYPE_TEMPORARY) == 0) {
      region_align_info_from_area(area, region_align_info);
      sync_header_alignment = true;
    }

    /* in some cases (opening temp space) we don't want to
     * call area exit callback, so we temporarily unset it */
    if (skip_region_exit && area->type) {
      area->type->exit = nullptr;
    }

    if (!ED_area_exit(C, area)) {
      if (skip_region_exit && area->type) {
        area->type->exit = area_exit;
      }
      return false;
    }

    /* restore old area exit callback */
    if (skip_region_exit && area->type) {
      area->type->exit = area_exit;
    }

    area->spacetype = type;
    area->type = st;

    /* If st->create may be called, don't use context until then. The
     * area->type->context() callback has changed but data may be invalid
     * (e.g. with properties editor) until space-data is properly created */

    /* check previously stored space */
    SpaceLink *sl = nullptr;
    LISTBASE_FOREACH (SpaceLink *, sl_iter, &area->spacedata) {
      if (sl_iter->spacetype == type) {
        sl = sl_iter;
        break;
      }
    }

    /* old spacedata... happened during work on 2.50, remove */
    if (sl && BLI_listbase_is_empty(&sl->regionbase)) {
      st->free(sl);
      BLI_freelinkN(&area->spacedata, sl);
      if (slold == sl) {
        slold = nullptr;
      }
      sl = nullptr;
    }

    if (sl) {
      /* swap regions */
      slold->regionbase = area->regionbase;
      area->regionbase = sl->regionbase;
      BLI_listbase_clear(&sl->regionbase);
      /* SPACE_FLAG_TYPE_WAS_ACTIVE is only used to go back to a previously active space that is
       * overlapped by temporary ones. It's now properly activated, so the flag should be cleared
       * at this point. */
      sl->link_flag &= ~SPACE_FLAG_TYPE_WAS_ACTIVE;

      /* put in front of list */
      BLI_remlink(&area->spacedata, sl);
      BLI_addhead(&area->spacedata, sl);
    }
    else {
      /* new space */
      if (st) {
        /* Don't get scene from context here which may depend on space-data. */
        Scene *scene = WM_window_get_active_scene(win);
        sl = st->create(area, scene);
        BLI_addhead(&area->spacedata, sl);

        /* swap regions */
        if (slold) {
          slold->regionbase = area->regionbase;
        }
        area->regionbase = sl->regionbase;
        BLI_listbase_clear(&sl->regionbase);
      }
    }

    /* Sync header alignment. */
    if (sync_header_alignment) {
      region_align_info_to_area(area, region_align_info);
    }

    ED_area_init(C, win, area);

    /* tell WM to refresh, cursor types etc */
    WM_event_add_mousemove(win);

    /* send space change notifier */
    WM_event_add_notifier(C, NC_SPACE | ND_SPACE_CHANGED, area);

    ED_area_tag_refresh(area);
  }

  /* Set area space subtype if applicable. */
  if (st && st->space_subtype_item_extend != nullptr) {
    if (area->butspacetype_subtype == -1) {
      /* Indication (probably from space_type_set_or_cycle) to ignore the
       * area's current subtype and use last-used, as saved in the space. */
      area->butspacetype_subtype = st->space_subtype_get(area);
    }
    st->space_subtype_set(area, area->butspacetype_subtype);
  }

  /* Whether setting a subtype or not we need to clear this value. Not just unneeded
   * but can interfere with the next change. Operations can change the type without
   * specifying a subtype (assumed zero) and we don't want to use the old subtype. */
  area->butspacetype_subtype = 0;

  if (BLI_listbase_is_single(&CTX_wm_screen(C)->areabase)) {
    /* If there is only one area update the window title. */
    WM_window_title(CTX_wm_manager(C), CTX_wm_window(C));
  }

  /* See #WM_capabilities_flag code-comments for details on the background check. */
  if (!G.background) {
    /* If window decoration styles are supported, send a notification to re-apply them. */
    if (WM_capabilities_flag() & WM_CAPABILITY_WINDOW_DECORATION_STYLES) {
      WM_event_add_notifier(C, NC_WINDOW, nullptr);
    }
  }

  /* also redraw when re-used */
  ED_area_tag_redraw(area);
  return true;
}
