/* SPDX-FileCopyrightText: 2007 Blender Authors
 *
 * SPDX-License-Identifier: GPL-2.0-or-later */

// Exact d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e native Python bridge.
wmOperatorStatus WM_operator_call_py(bContext *C,
                                     wmOperatorType *ot,
                                     blender::wm::OpCallContext context,
                                     PointerRNA *properties,
                                     ReportList *reports,
                                     const bool is_undo)
{
  wmOperatorStatus retval = OPERATOR_CANCELLED;
  /* Not especially nice using undo depth here. It's used so Python never
   * triggers undo or stores an operator's last used state. */
  wmWindowManager *wm = CTX_wm_manager(C);
  if (!is_undo && wm) {
    wm->op_undo_depth++;
  }

  retval = wm_operator_call_internal(C, ot, properties, reports, context, false, nullptr);

  if (!is_undo && wm && (wm == CTX_wm_manager(C))) {
    wm->op_undo_depth--;
  }

  return retval;
}
