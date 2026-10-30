static wmOperatorStatus wm_operator_invoke(bContext *C,
                                           wmOperatorType *ot,
                                           const wmEvent *event,
                                           PointerRNA *properties,
                                           ReportList *reports,
                                           const bool poll_only,
                                           bool use_last_properties,
                                           [[maybe_unused]] eIPadNodeView2DDispatch ipad_node_view2d =
                                               eIPadNodeView2DDispatch::None)
{
  wmOperatorStatus retval = OPERATOR_PASS_THROUGH;

  /* This is done because complicated setup is done to call this function
   * that is better not duplicated. */
  if (poll_only) {
    return wmOperatorStatus(WM_operator_poll(C, ot));
  }

#ifdef WITH_APPLE_CROSSPLATFORM
  if (!wm_ipad_node_view2d_event_context(C, event, ipad_node_view2d) ||
      !ED_view2d_native_pan_zoom_type_is(
          ot, ipad_node_view2d == eIPadNodeView2DDispatch::StockCtrlZoom))
  {
    ipad_node_view2d = eIPadNodeView2DDispatch::None;
  }
#endif
  if (WM_operator_poll(C, ot)) {
#ifdef WITH_APPLE_CROSSPLATFORM
    if (wm_ipad_node_view2d_event_context(C, event, ipad_node_view2d) &&
        ED_view2d_native_pan_zoom_type_is(
            ot, ipad_node_view2d == eIPadNodeView2DDispatch::StockCtrlZoom))
    {
      /* No operator or native View2D state has been allocated. This consumed
       * default navigation attempt needs no cancel/free callback. */
      return OPERATOR_CANCELLED;
    }
#endif
    wmWindowManager *wm = CTX_wm_manager(C);
    const intptr_t undo_id_prev = wm_operator_undo_active_id(wm);
    const intptr_t register_id_prev = wm_operator_register_active_id(wm);

    /* If `reports == nullptr`, they'll be initialized. */
    wmOperator *op = wm_operator_create(wm, ot, properties, reports);

    CLOG_AT_LEVEL(WM_LOG_OPERATORS,
                  /* Avoid logging very noisy hover/timer driven operators at info level. */
                  ((op->type->flag & OPTYPE_REGISTER) ? CLG_LEVEL_INFO : CLG_LEVEL_DEBUG),
                  "Started %s",
                  WM_operator_pystring(C, op, false, true).c_str());

    const bool is_nested_call = (wm->op_undo_depth != 0);

    if (event != nullptr) {
      op->flag |= OP_IS_INVOKE;
    }

    /* Initialize setting from previous run. */
    if (!is_nested_call && use_last_properties) { /* Not called by a Python script. */
      WM_operator_last_properties_init(op);
    }

    if ((event == nullptr) || (event->type != MOUSEMOVE)) {
      CLOG_DEBUG(WM_LOG_EVENTS,
                 "Handle event %d win %p op %s",
                 event ? event->type : 0,
                 CTX_wm_screen(C)->active_region,
                 ot->idname);
    }

    if (op->type->invoke && event) {
      /* Make a copy of the event as it's `const` and the #wmEvent.mval to be written into. */
      wmEvent event_temp = *event;
      wm_region_mouse_co(C, &event_temp);

      if (op->type->flag & OPTYPE_UNDO) {
        wm->op_undo_depth++;
      }

      retval = op->type->invoke(C, op, &event_temp);
      OPERATOR_RETVAL_CHECK(retval);

      if (op->type->flag & OPTYPE_UNDO && CTX_wm_manager(C) == wm) {
        wm->op_undo_depth--;
      }
    }
    else if (op->type->exec) {
      if (op->type->flag & OPTYPE_UNDO) {
        wm->op_undo_depth++;
      }

      retval = op->type->exec(C, op);
      OPERATOR_RETVAL_CHECK(retval);

      if (op->type->flag & OPTYPE_UNDO && CTX_wm_manager(C) == wm) {
        wm->op_undo_depth--;
      }
    }
    else {
      /* Debug, important to leave a while, should never happen. */
      CLOG_ERROR(WM_LOG_OPERATORS, "Invalid operator call '%s'", op->idname);
    }

    /* NOTE: if the report is given as an argument then assume the caller will deal with displaying
     * them currently Python only uses this. */
    if (!(retval & OPERATOR_HANDLED) && (retval & (OPERATOR_FINISHED | OPERATOR_CANCELLED))) {
      /* Only show the report if the report list was not given in the function. */
      wm_operator_reports(C, op, retval, (reports != nullptr));
    }

    if (retval & OPERATOR_HANDLED) {
      /* Do nothing, #wm_operator_exec() has been called somewhere. */
    }
    else if (retval & OPERATOR_FINISHED) {
      const bool has_undo_step = (undo_id_prev != wm_operator_undo_active_id(wm));
      const bool has_register = (register_id_prev != wm_operator_register_active_id(wm));
      const bool store = !is_nested_call && use_last_properties;
      wm_operator_finished(C, op, false, store, has_undo_step, has_register);
    }
    else if (retval & OPERATOR_RUNNING_MODAL) {
      /* Take ownership of reports (in case python provided its own). */
      op->reports->flag |= RPT_FREE;

      /* Grab cursor during blocking modal operators (X11)
       * Also check for macro. */
      if (ot->flag & OPTYPE_BLOCKING || (op->opm && op->opm->type->flag & OPTYPE_BLOCKING)) {
        eWM_CursorWrapAxis wrap = WM_CURSOR_WRAP_NONE;
        const rcti *wrap_region = nullptr;

        if (event && (U.uiflag & USER_CONTINUOUS_MOUSE)) {
          const wmOperator *op_test = op->opm ? op->opm : op;
          const wmOperatorType *ot_test = op_test->type;
          if ((ot_test->flag & OPTYPE_GRAB_CURSOR_XY) || (op_test->flag & OP_IS_MODAL_GRAB_CURSOR))
          {
            wrap = WM_CURSOR_WRAP_XY;
          }
          else if (ot_test->flag & OPTYPE_GRAB_CURSOR_X) {
            wrap = WM_CURSOR_WRAP_X;
          }
          else if (ot_test->flag & OPTYPE_GRAB_CURSOR_Y) {
            wrap = WM_CURSOR_WRAP_Y;
          }
        }

        if (wrap) {
          ARegion *region = CTX_wm_region(C);
          ScrArea *area = CTX_wm_area(C);

          /* Wrap only in X for header. */
          if (region && RGN_TYPE_IS_HEADER_ANY(region->regiontype)) {
            wrap = WM_CURSOR_WRAP_X;
          }

          if (region && region->regiontype == RGN_TYPE_WINDOW &&
              BLI_rcti_isect_pt_v(&region->winrct, event->xy))
          {
            wrap_region = &region->winrct;
          }
          else if (area && BLI_rcti_isect_pt_v(&area->totrct, event->xy)) {
            wrap_region = &area->totrct;
          }
        }

        WM_cursor_grab_enable(CTX_wm_window(C), wrap, wrap_region, false);
      }

      /* Cancel UI handlers, typically tool-tips that can hang around
       * while dragging the view or worse, that stay there permanently
       * after the modal operator has swallowed all events and passed
       * none to the UI handler. */
      wm_event_handler_ui_cancel(C);
    }
    else {
      WM_operator_free(op);
    }
  }

  return retval;
}
