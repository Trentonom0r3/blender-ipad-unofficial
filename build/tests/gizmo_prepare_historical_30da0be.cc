/* Frozen exact production 30da0be functions. Native source is not repaired here. */
static void gizmomap_prepare_drawing(wmGizmoMap *gzmap,
                                     const bContext *C,
                                     ListBase *draw_gizmos,
                                     const eWM_GizmoFlagMapDrawStep drawstep)
{
  if (!gzmap || BLI_listbase_is_empty(&gzmap->groups)) {
    return;
  }

  gzmap->is_init = false;

  wmGizmo *gz_modal = gzmap->gzmap_context.modal;

  /* Allow refresh functions to ask to be refreshed again, clear before the loop below. */
  const bool do_refresh = gzmap->update_flag[drawstep] & GIZMOMAP_IS_REFRESH_CALLBACK;
  gzmap->update_flag[drawstep] &= ~GIZMOMAP_IS_REFRESH_CALLBACK;

  LISTBASE_FOREACH (wmGizmoGroup *, gzgroup, &gzmap->groups) {
    /* Check group visibility - drawstep first to avoid unnecessary call of group poll callback. */
    if (!wm_gizmogroup_is_visible_in_drawstep(gzgroup, drawstep)) {
      continue;
    }

    if (gz_modal && (gzgroup == gz_modal->parent_gzgroup)) {
      if (gzgroup->type->flag & WM_GIZMOGROUPTYPE_DRAW_MODAL_EXCLUDE) {
        continue;
      }
    }
    else { /* Don't poll modal gizmo since some poll functions unlink. */
      if (!WM_gizmo_group_type_poll(C, gzgroup->type)) {
        continue;
      }
      /* When modal only show other gizmo groups tagged with #WM_GIZMOGROUPTYPE_DRAW_MODAL_ALL. */
      if (gz_modal && ((gzgroup->type->flag & WM_GIZMOGROUPTYPE_DRAW_MODAL_ALL) == 0)) {
        continue;
      }
    }

    /* Needs to be initialized on first draw. */
    /* XXX weak: Gizmo-group may skip refreshing if it's invisible
     * (map gets untagged nevertheless). */
    if (do_refresh) {
      /* Force refresh again. */
      gzgroup->init_flag &= ~WM_GIZMOGROUP_INIT_REFRESH;
    }
    /* Calls `setup`, `setup_keymap` and `refresh` if they're defined. */
    WM_gizmogroup_ensure_init(C, gzgroup);

    /* Check after ensure which can run refresh and update this value. */
    if (gzgroup->hide.any != 0) {
      continue;
    }

    /* Prepare drawing. */
    if (gzgroup->type->draw_prepare) {
      gzgroup->type->draw_prepare(C, gzgroup);
    }

    LISTBASE_FOREACH (wmGizmo *, gz, &gzgroup->gizmos) {
      gizmo_prepare_drawing(gzmap, gz, C, draw_gizmos, drawstep);
    }
  }

  gzmap->update_flag[drawstep] &= ~GIZMOMAP_IS_PREPARE_DRAW;
}

static bool ipad_knife_hierarchy_native_capture(bContext *C, wmWindow *win,
                                               IPadKnifeHierarchyNative &r_native)
{
  r_native = {};
  wmWindowManager *wm = CTX_wm_manager(C);
  if (!wm || !win || CTX_wm_window(C) != win || BLI_findindex(&wm->windows, win) == -1)
    return false;
  bScreen *screen = WM_window_get_active_screen(win);
  if (!screen || !ED_ipad_panels_enabled(screen)) return false;
  r_native.identity = {uint64_t(uintptr_t(G_MAIN)), uint64_t(uintptr_t(wm)),
                       wm->id.session_uid, uint64_t(uintptr_t(win)), uint64_t(win->winid),
                       uint64_t(uintptr_t(screen)), screen->id.session_uid};
  r_native.width = WM_window_native_pixel_x(win);
  r_native.height = WM_window_native_pixel_y(win);
  r_native.scale = UI_SCALE_FAC;
  /* Native window draw callbacks run after the area/HUD compositor. Their
   * pixels and input are opaque here; no fresh Knife action can be proved. */
  r_native.settled = !screen->do_refresh && !win->drawcalls.first && wm->runtime &&
                     !wm->runtime->drags.first;
  LISTBASE_FOREACH (ScrArea *, area, &screen->areabase) {
    const bool visible = ED_ipad_panels_area_visible(area);
    const View3D *v3d = area->spacetype == SPACE_VIEW3D ?
                           static_cast<const View3D *>(area->spacedata.first) : nullptr;
    const bool navigation = v3d &&
        !(v3d->gizmo_flag & (V3D_GIZMO_HIDE | V3D_GIZMO_HIDE_NAVIGATE)) &&
        ((U.uiflag & USER_SHOW_GIZMO_NAVIGATE) || U.mini_axis_type == USER_MINI_AXIS_TYPE_GIZMO);
    if (area->flag & AREA_FLAG_REGION_SIZE_UPDATE) r_native.settled = false;
    r_native.state.push_back({0, uint64_t(uintptr_t(area)), uint64_t(area->spacetype),
                              uint64_t(area->runtime.ipad_layer), uint64_t(area->flag & AREA_FLAG_REGION_SIZE_UPDATE),
                              uint64_t(area->totrct.xmin), uint64_t(area->totrct.xmax),
                              uint64_t(area->totrct.ymin), uint64_t(area->totrct.ymax),
                              uint64_t(navigation), uint64_t(v3d ? v3d->gizmo_flag : 0)});
    if (visible && area->runtime.ipad_layer != 1 && ipad_knife_rect_has_pixels(area->totrct))
      r_native.higher.push_back({0, area->totrct});
    LISTBASE_FOREACH (ARegion *, region, &area->regionbase) {
      if (!region->runtime) return false;
      const auto &runtime = *region->runtime;
      const rcti &rect = region->winrct, &canvas = runtime.ipad_canvas_rect;
      r_native.state.push_back({1, uint64_t(uintptr_t(area)), uint64_t(uintptr_t(region)),
                                uint64_t(region->regiontype), uint64_t(region->flag),
                                uint64_t(runtime.visible), uint64_t(runtime.ipad_floating),
                                uint64_t(runtime.ipad_canvas), uint64_t(uintptr_t(runtime.draw_buffer)),
                                uint64_t(rect.xmin), uint64_t(rect.xmax), uint64_t(rect.ymin), uint64_t(rect.ymax),
                                uint64_t(canvas.xmin), uint64_t(canvas.xmax), uint64_t(canvas.ymin), uint64_t(canvas.ymax),
                                uint64_t(uintptr_t(runtime.gizmo_map))});
      if (!visible || !runtime.visible || !ipad_knife_rect_has_pixels(rect)) continue;
      if (region->regiontype != RGN_TYPE_HUD) {
        r_native.required.push_back({uint64_t(uintptr_t(area)), uint64_t(uintptr_t(region)),
                                     uint64_t(uintptr_t(runtime.draw_buffer)), rect});
      }
      if (region->regiontype != RGN_TYPE_WINDOW)
        r_native.higher.push_back({uint64_t(uintptr_t(region)), rect});
      if (region->regiontype != RGN_TYPE_WINDOW || !runtime.gizmo_map) continue;
      /* Snapshot every current native gizmo without invoking poll/setup. Even
       * hidden/uninitialized additions must match a completed presentation. A
       * visible non-navigation gizmo has no proved bounded footprint. */
      LISTBASE_FOREACH (wmGizmoGroup *, group, WM_gizmomap_group_list(runtime.gizmo_map)) {
        r_native.state.push_back({4, uint64_t(uintptr_t(region)), uint64_t(uintptr_t(group)),
                                  uint64_t(uintptr_t(group->type)), uint64_t(group->tag_remove),
                                  uint64_t(group->hide.any), uint64_t(group->init_flag)});
        const bool known_navigation = navigation && group->type &&
            STREQ(group->type->idname, "VIEW3D_GGT_navigate");
        if (!group->type) r_native.settled = false;
        LISTBASE_FOREACH (wmGizmo *, gizmo, &group->gizmos) {
          r_native.state.push_back({5, uint64_t(uintptr_t(region)), uint64_t(uintptr_t(group)),
                                    uint64_t(uintptr_t(gizmo)), uint64_t(uintptr_t(gizmo->type)),
                                    uint64_t(gizmo->flag), uint64_t(gizmo->state)});
          /* Exact flag-only no-draw gates from wm_gizmo_is_visible. No
           * custom group poll or gizmo hit/draw callback is consulted. */
          const bool flag_visible = !(gizmo->flag & WM_GIZMO_HIDDEN) &&
              !((gizmo->state & WM_GIZMO_STATE_MODAL) &&
                !(gizmo->flag & (WM_GIZMO_DRAW_MODAL | WM_GIZMO_DRAW_VALUE))) &&
              !((gizmo->flag & WM_GIZMO_DRAW_HOVER) &&
                !(gizmo->state & (WM_GIZMO_STATE_HIGHLIGHT | WM_GIZMO_STATE_SELECT)));
          if (!known_navigation && !group->hide.any &&
              (group->init_flag & WM_GIZMOGROUP_INIT_SETUP) && flag_visible)
            r_native.settled = false;
        }
      }
      if (!navigation) continue;
      /* The area cache is overwritten by every quad WINDOW. Read each current
       * native navigation group instead, without polling or draw callbacks. */
      LISTBASE_FOREACH (wmGizmoGroup *, group, WM_gizmomap_group_list(runtime.gizmo_map)) {
        if (!group->type || !STREQ(group->type->idname, "VIEW3D_GGT_navigate")) continue;
        r_native.state.push_back({2, uint64_t(uintptr_t(region)), uint64_t(uintptr_t(group)),
                                  uint64_t(uintptr_t(group->type)), uint64_t(group->tag_remove),
                                  uint64_t(group->hide.any), uint64_t(group->init_flag)});
        if (group->tag_remove || group->hide.any) continue;
        if (!(group->init_flag & WM_GIZMOGROUP_INIT_SETUP)) r_native.settled = false;
        LISTBASE_FOREACH (wmGizmo *, gizmo, &group->gizmos) {
          const float x = gizmo->matrix_basis[3][0], y = gizmo->matrix_basis[3][1];
          const float scale = gizmo->scale_basis;
          r_native.state.push_back({3, uint64_t(uintptr_t(region)), uint64_t(uintptr_t(gizmo)),
                                    uint64_t(gizmo->flag), ipad_knife_float_value(x),
                                    ipad_knife_float_value(y), ipad_knife_float_value(scale)});
          if (gizmo->flag & WM_GIZMO_HIDDEN) continue;
          if (!std::isfinite(x) || !std::isfinite(y) || !std::isfinite(scale) || scale < 0 ||
              double(std::abs(x)) > double(INT_MAX) / 4 || double(std::abs(y)) > double(INT_MAX) / 4 ||
              double(scale) * UI_SCALE_FAC > double(INT_MAX) / 4) {
            r_native.settled = false;
            continue;
          }
          /* Same bounded footprint as VIEW3D navigation draw_prepare. This
           * excludes input; it never grants a callback or action capability. */
          const int radius = int(scale * UI_SCALE_FAC + 4 * UI_SCALE_FAC);
          const int px = rect.xmin + int(x), py = rect.ymin + int(y);
          r_native.higher.push_back({uint64_t(uintptr_t(region)),
                                      {px - radius, px + radius, py - radius, py + radius}});
        }
      }
    }
  }
  return true;
}
