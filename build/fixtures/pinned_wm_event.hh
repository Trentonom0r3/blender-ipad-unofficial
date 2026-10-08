/* SPDX-License-Identifier: GPL-2.0-or-later */
/* Exact pinned native declarations from WM_types.hh at d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e.
 * Enum/vector dependencies are provided as POD boundaries by the host test. */
struct wmTabletData {
  /** 0=EVT_TABLET_NONE, 1=EVT_TABLET_STYLUS, 2=EVT_TABLET_ERASER. */
  int active;
  /** Range 0.0 (not touching) to 1.0 (full pressure). */
  float pressure;
  /**
   * X axis range: -1.0 (left) to +1.0 (right).
   * Y axis range: -1.0 (away from user) to +1.0 (toward user).
   */
  blender::float2 tilt;
  /** Interpret mouse motion as absolute as typical for tablets. */
  char is_motion_absolute;
};

struct wmEvent {
  wmEvent *next, *prev;

  /** Event code itself (short, is also in key-map). */
  wmEventType type;
  /** Press, release, scroll-value. */
  short val;
  /** Mouse pointer position, screen coord. */
  int xy[2];
  /** Region relative mouse position (name convention before Blender 2.5). */
  int mval[2];
  /**
   * A single UTF8 encoded character.
   *
   * - Not null terminated although it may not be set `(utf8_buf[0] == '\0')`.
   * - #BLI_str_utf8_size_or_error() must _always_ return a valid value,
   *   check when assigning so we don't need to check on every access after.
   */
  char utf8_buf[6];

  /** Modifier states: #KM_SHIFT, #KM_CTRL, #KM_ALT, #KM_OSKEY & #KM_HYPER. */
  wmEventModifierFlag modifier;

  /** The direction (for #KM_PRESS_DRAG events only). */
  int8_t direction;

  /**
   * Raw-key modifier (allow using any key as a modifier).
   * Compatible with values in `type`.
   */
  wmEventType keymodifier;

  /** Tablet info, available for mouse move and button events. */
  wmTabletData tablet;

  eWM_EventFlag flag;

  /* Custom data. */

  /** Custom data type, stylus, 6-DOF, see `wm_event_types.hh`. */
  short custom;
  short customdata_free;
  /**
   * The #wmEvent::type implies the following #wmEvent::custodata.
   *
   * - #EVT_ACTIONZONE_AREA / #EVT_ACTIONZONE_FULLSCREEN / #EVT_ACTIONZONE_FULLSCREEN:
   *   Uses #sActionzoneData.
   * - #EVT_DROP: uses #ListBase of #wmDrag (also #wmEvent::custom == #EVT_DATA_DRAGDROP).
   *   Typically set to #wmWindowManger::drags.
   * - #EVT_FILESELECT: uses #wmOperator.
   * - #EVT_XR_ACTION: uses #wmXrActionData (also #wmEvent::custom == #EVT_DATA_XR).
   * - #NDOF_MOTION: uses #wmNDOFMotionData (also #wmEvent::custom == #EVT_DATA_NDOF_MOTION).
   * - #TIMER: uses #wmTimer (also #wmEvent::custom == #EVT_DATA_TIMER).
   */
  void *customdata;

  /* Previous State. */

  /** The previous value of `type`. */
  wmEventType prev_type;
  /** The previous value of `val`. */
  short prev_val;
  /**
   * The previous value of #wmEvent.xy,
   * Unlike other previous state variables, this is set on any mouse motion.
   * Use `prev_press_*` for the value at time of pressing.
   */
  int prev_xy[2];

  /* Previous Press State (when `val == KM_PRESS`). */

  /** The `type` at the point of the press action. */
  wmEventType prev_press_type;
  /**
   * The location when the key is pressed.
   * used to enforce drag threshold & calculate the `direction`.
   */
  int prev_press_xy[2];
  /** The `modifier` at the point of the press action. */
  wmEventModifierFlag prev_press_modifier;
  /** The `keymodifier` at the point of the press action. */
  wmEventType prev_press_keymodifier;
};
