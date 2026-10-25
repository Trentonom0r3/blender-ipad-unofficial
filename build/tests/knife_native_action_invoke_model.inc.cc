/* SPDX-License-Identifier: GPL-2.0-or-later
 * Host instrumentation only; actual Knife modal/helper bodies come from declared source.
 * Geometry, allocator disposal, matrices, hits and numeric evaluation are modeled. */
static wmOperatorStatus knifetool_invoke(bContext*,wmOperator*,const wmEvent*){++calls.invoke;return OPERATOR_RUNNING_MODAL;}
static wmOperatorStatus foreign_invoke(bContext*,wmOperator*,const wmEvent*){return OPERATOR_RUNNING_MODAL;}
static wmOperatorStatus foreign_modal(bContext*,wmOperator*,const wmEvent*){return OPERATOR_RUNNING_MODAL;}
static void foreign_cancel(bContext*,wmOperator*){}
