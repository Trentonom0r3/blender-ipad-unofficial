/* SPDX-FileCopyrightText: 2025 Blender Authors
 *
 * SPDX-License-Identifier: GPL-2.0-or-later */

#include "GHOST_WindowIOS.hh"

#include "GHOST_ContextIOS.hh"
#include "GHOST_SystemIOS.hh"
#include "GHOST_ProjectImport-api.hh"
#include "GHOST_NavigationIOS.hh"

#include "GHOST_C-api.h"
#include "GHOST_Debug.hh"
#include "GHOST_EventButton.hh"
#include "GHOST_EventPencilRing.hh"
#include "GHOST_WindowManager.hh"
#include "GHOST_EventCursor.hh"
#include "GHOST_EventDragnDrop.hh"
#include "GHOST_EventKey.hh"
#include "GHOST_EventWheel.hh"
#include "GHOST_EventTouch.hh"
#include "GHOST_EventTrackpad.hh"

#import <GameController/GameController.h>
#import <Metal/Metal.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>
#import <UIKit/UIPencilInteraction.h>

#include <string>
#include <unordered_map>

/* Debug input logging — disabled for release. Uncomment to re-enable NSLog spam
 * (HOVER/MOUSEMOVED/IPAN/KEY/TABLET/etc.) for diagnosing input issues. */
// #define IOS_INPUT_LOGGING
#if defined(IOS_INPUT_LOGGING)
#  define IOS_INPUT_LOG(...) NSLog(__VA_ARGS__)
#else
#  define IOS_INPUT_LOG(...)
#endif

/* Scale applied to middle-drag PAN (Shift+wheel) trackpad deltas. Blender's iOS
 * view3d.move trackpad path amplifies our delta ~6x (formula mx = 2*xy - prev_xy
 * plus its zfac conversion; measured: 0.5 still overshot ~3x), so we pre-divide
 * to make the grabbed point track the cursor ~1:1. Orbit is left unscaled.
 * Lower = pans less. */
#define MMB_PAN_SCALE 0.17f

// #define IOS_WINDOW_LOGGING
#if defined(IOS_WINDOW_LOGGING)
#  define IOS_WINDOW_LOG(...) NSLog(__VA_ARGS__)
#else
#  define IOS_WINDOW_LOG(...)
#endif

struct TouchData {
  CGPoint pos;
  bool part_of_multitouch = false;
};

typedef struct UserInputEvent {
  enum EventTypes {
    CURSOR_MOVE,
    PAN_GESTURE,
    PAN_GESTURE_TWO_FINGERS,
    PAN_GESTURE_THREE_FINGERS,
    PINCH_GESTURE,
    LEFT_BUTTON_DOWN,
    LEFT_BUTTON_UP,
    PENCIL_CONTEXT_MENU,
    PENCIL_TOOL_PALETTE,
  };
  EventTypes event_list[10];
  int num_events;
  CGPoint location;
  CGPoint translation;
  CGFloat distance;
  bool pencil_used;
  bool tablet_snapshot_valid = false;
  GHOST_TabletData tablet_snapshot = GHOST_TABLET_DATA_NONE;
  bool direct_touch = false;
  bool cancelled = false;
  bool direct_tool = false;
  bool direct_finger = false;
  uint64_t finger_paint_generation = 0;
  uint64_t hud_generation = 0, hud_serial = 0;
  ghost::ios::PencilPaintContact pencil_paint;

  UserInputEvent(CGPoint *loc, CGPoint *tran, CGFloat *dist, bool pencil)
  {
    num_events = 0;
    location = loc ? *loc : CGPointMake(-1.0f, -1.0f);
    translation = tran ? *tran : CGPointMake(0.0f, 0.0f);
    distance = dist ? *dist : 0.0f;
    pencil_used = pencil;
  }

  void set_tablet_snapshot(const GHOST_TabletData &sample)
  {
    tablet_snapshot = sample;
    tablet_snapshot_valid = true;
  }

  void add_event(EventTypes event_type)
  {
    GHOST_ASSERT(num_events <= sizeof(event_list) / sizeof(*event_list),
                 "add_event: Failed to add event");
    event_list[num_events] = event_type;
    num_events++;
  }

  NSString *getEventTypeDesc(EventTypes event_type) const
  {
    switch (event_type) {
      case CURSOR_MOVE:
        return @"CM";
      case PAN_GESTURE:
        return @"PAN";
      case PAN_GESTURE_TWO_FINGERS:
        return @"PAN2F";
      case PAN_GESTURE_THREE_FINGERS:
        return @"PAN3F";
      case PINCH_GESTURE:
        return @"PINCH";
      case LEFT_BUTTON_DOWN:
        return @"LB-DOWN";
      case LEFT_BUTTON_UP:
        return @"LB-UP";
      case PENCIL_CONTEXT_MENU:
        return @"PENCIL-TAP";
      case PENCIL_TOOL_PALETTE:
        return @"PENCIL-TOOLS";
    }
    BLI_assert_unreachable();
    return @"Event undefined";
  }

} UserInputEvent;


static ghost::ios::PencilRingContact ios_ring_contact_at_start(
    GHOST_WindowIOS *window, UIView *owner_view, NSSet<UITouch *> *touches)
{
  ghost::ios::PencilRingContact result;
  const auto receipt = ghost::ios::pencil_ring_presentation(window);
  /* Registry absence needs no GHOST-window dereference. A retained recognizer
   * from an older native view cannot capture a reused window address. */
  if (!receipt.lifetime || !receipt.contact_enabled || window->getView() != owner_view) return result;
  for (UITouch *touch in touches) {
    if (touch.type != UITouchTypeDirect && touch.type != UITouchTypePencil) continue;
    CGPoint location = [touch locationInView:owner_view];
    const CGPoint origin = window->scalePointToWindow(location);
    result.begin(receipt, int(origin.x), int(origin.y));
    break;
  }
  return result;
}
static void ios_ring_packet(GHOST_SystemIOS *system, GHOST_WindowIOS *window,
                            const ghost::ios::PencilRingContact &contact,
                            GHOST_TPencilRingPhase phase, CGPoint point)
{
  if (!contact.lifetime || !contact.serial) return;
  const GHOST_TEventPencilRingData packet{contact.lifetime, contact.generation,
      int(point.x), int(point.y), phase, contact.serial, 0.0f};
  system->pushEvent(new GHOST_EventPencilRing(system->getMilliSeconds(), window, packet));
}

/* Sample before UIKit advances state or resets its touch storage. Only this
 * recognizer's physical contact can supply device/pressure/tilt to its action. */
static ghost::ios::TouchDevice ios_touch_device(UITouch *touch)
{
  if (!touch) return ghost::ios::TouchDevice::Unknown;
  switch (touch.type) {
    case UITouchTypePencil: return ghost::ios::TouchDevice::Pencil;
    case UITouchTypeDirect: return ghost::ios::TouchDevice::Finger;
    case UITouchTypeIndirect:
    case UITouchTypeIndirectPointer: return ghost::ios::TouchDevice::Indirect;
  }
  return ghost::ios::TouchDevice::Unknown;
}
static ghost::ios::PencilSample ios_pencil_sample(UITouch *touch, UIView *view)
{
  if (!touch || touch.type != UITouchTypePencil || !view) return {};
  return ghost::ios::pencil_sample(touch.force, touch.maximumPossibleForce,
                                   [touch azimuthAngleInView:view], touch.altitudeAngle);
}
static GHOST_TabletData ios_tablet_snapshot(const ghost::ios::PencilSample &sample)
{
  GHOST_TabletData result = GHOST_TABLET_DATA_NONE;
  result.Active = GHOST_kTabletModeStylus;
  result.Pressure = sample.valid ? sample.pressure : 0.0f;
  result.Xtilt = sample.valid ? sample.xtilt : 0.0f;
  result.Ytilt = sample.valid ? sample.ytilt : 0.0f;
  return result;
}

/* GHOSTUITapGesture interface for capturing taps. */
@interface GHOSTUITapGestureRecognizer : UITapGestureRecognizer
{
  ghost::ios::GestureContact gesture_contact;
  ghost::ios::TouchAdmission touch_admission;
  GHOST_WindowIOS *ring_window;
  ghost::ios::PencilRingContact ring_origin;
  ghost::ios::HUDContact hud_origin;
  uint64_t finger_paint_origin;
  ghost::ios::PencilPaintContact pencil_paint_origin;
}

- (CGPoint)getScaledTouchPoint:(GHOST_WindowIOS *)window;
- (BOOL)gestureUsesPencil;
- (BOOL)pencilContactDown;
- (ghost::ios::PencilSample)pencilSample;
- (BOOL)touchStreamAllowed;
- (void)setRingWindow:(GHOST_WindowIOS *)value;
- (ghost::ios::PencilRingContact)ringContact;
- (ghost::ios::HUDContact)hudContact;
- (BOOL)gestureUsesFinger;
- (uint64_t)fingerPaintGeneration;
- (ghost::ios::PencilPaintContact)pencilPaintContact;
- (void)invalidateTouchStream;

@end

@implementation GHOSTUITapGestureRecognizer

- (void)setRingWindow:(GHOST_WindowIOS *)value { ring_window = value; }
- (ghost::ios::PencilRingContact)ringContact { return ring_origin; }
- (ghost::ios::HUDContact)hudContact { return hud_origin; }
- (BOOL)gestureUsesFinger { return gesture_contact.touch && gesture_contact.device == ghost::ios::TouchDevice::Finger; }
- (uint64_t)fingerPaintGeneration { return finger_paint_origin; }
- (ghost::ios::PencilPaintContact)pencilPaintContact { return pencil_paint_origin; }

- (CGPoint)getScaledTouchPoint:(GHOST_WindowIOS *)window
{
  CGPoint touch_point = [self locationInView:window->getView()];
  return window->scalePointToWindow(touch_point);
}

- (BOOL)touchStreamAllowed
{
  return touch_admission.allowed();
}

- (void)invalidateTouchStream
{
  touch_admission.interrupt();
}

- (BOOL)gestureUsesPencil { return gesture_contact.pencil(); }
- (BOOL)pencilContactDown { return gesture_contact.pencil_down(); }
- (ghost::ios::PencilSample)pencilSample { return gesture_contact.peak; }

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  const bool fresh_contact = !touch_admission.active;
  touch_admission.begin();
  if (fresh_contact) {
    if (touches.count == 1) {
      for (UITouch *touch in touches) {
        gesture_contact.begin(ios_touch_device(touch), reinterpret_cast<uintptr_t>(touch),
                              ios_pencil_sample(touch, self.view));
      }
    }
    ring_origin = ios_ring_contact_at_start(ring_window, self.view, touches);
    hud_origin = {};
    finger_paint_origin = 0;
    pencil_paint_origin = {};
    if (ring_window && self.view == ring_window->getView() && touches.count == 1) {
      for (UITouch *touch in touches) {
        if (!(touch.type == UITouchTypePencil || touch.type == UITouchTypeDirect)) continue;
        CGPoint local = [touch locationInView:self.view];
        CGPoint origin = ring_window->scalePointToWindow(local);
        hud_origin = ghost::ios::hud_contact_at_start(ring_window, int(origin.x), int(origin.y));
        if (gesture_contact.device == ghost::ios::TouchDevice::Finger && !ring_origin.captured && !hud_origin.generation)
          finger_paint_origin = ghost::ios::finger_paint_at_start(ring_window, int(origin.x), int(origin.y));
        if (gesture_contact.device == ghost::ios::TouchDevice::Pencil && !ring_origin.captured && !hud_origin.generation)
          pencil_paint_origin = ghost::ios::pencil_paint_at_start(
              ring_window, int(origin.x), int(origin.y), gesture_contact.serial);
      }
    }
  }
  [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  for (UITouch *touch in touches) {
    gesture_contact.update(reinterpret_cast<uintptr_t>(touch), ios_pencil_sample(touch, self.view));
  }
  [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  for (UITouch *touch in touches) {
    gesture_contact.update(reinterpret_cast<uintptr_t>(touch), ios_pencil_sample(touch, self.view));
  }
  [super touchesEnded:touches withEvent:event];
  for (UITouch *touch in touches) {
    gesture_contact.end(reinterpret_cast<uintptr_t>(touch));
  }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  for (UITouch *touch in touches) {
    gesture_contact.update(reinterpret_cast<uintptr_t>(touch), ios_pencil_sample(touch, self.view));
  }
  [super touchesCancelled:touches withEvent:event];
  for (UITouch *touch in touches) {
    gesture_contact.end(reinterpret_cast<uintptr_t>(touch));
  }
}

- (void)reset
{
  ring_origin = ghost::ios::PencilRingContact{};
  hud_origin = {};
  finger_paint_origin = 0;
  pencil_paint_origin = {};
  touch_admission.reset();
  gesture_contact.reset();
  [super reset];
}

@end

/* GHOSTUITapGesture interface for capturing taps. */
@interface GHOSTUIPanGestureRecognizer : UIPanGestureRecognizer
{
  CGPoint cached_translation;
  /* Device and finite samples are frozen before superclass action delivery. */
  ghost::ios::GestureContact gesture_contact;
  ghost::ios::TouchAdmission touch_admission;
  GHOST_WindowIOS *ring_window;
  ghost::ios::PencilRingContact ring_origin;
  ghost::ios::HUDContact hud_origin;
  ghost::ios::PencilPaintContact pencil_paint_origin;
}
- (CGPoint)getScaledTouchPoint:(GHOST_WindowIOS *)window;
- (CGPoint)getScaledTranslation:(GHOST_WindowIOS *)window;

- (void)setCachedTranslation:(CGPoint)translation;
- (CGPoint)getCachedTranslation;
- (BOOL)gestureUsesPencil;
- (BOOL)gestureUsesFinger;
- (BOOL)pencilContactDown;
- (ghost::ios::PencilSample)pencilSample;
- (BOOL)touchStreamAllowed;
- (void)setRingWindow:(GHOST_WindowIOS *)value;
- (ghost::ios::PencilRingContact)ringContact;
- (ghost::ios::HUDContact)hudContact;
- (ghost::ios::PencilPaintContact)pencilPaintContact;
- (void)invalidateTouchStream;
@end

@implementation GHOSTUIPanGestureRecognizer

- (void)setRingWindow:(GHOST_WindowIOS *)value { ring_window = value; }
- (ghost::ios::PencilRingContact)ringContact { return ring_origin; }
- (ghost::ios::HUDContact)hudContact { return hud_origin; }
- (ghost::ios::PencilPaintContact)pencilPaintContact { return pencil_paint_origin; }

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  const bool fresh_contact = !touch_admission.active;
  touch_admission.begin();
  if (fresh_contact) {
    if (touches.count == 1) {
      for (UITouch *touch in touches) {
        gesture_contact.begin(ios_touch_device(touch), reinterpret_cast<uintptr_t>(touch),
                              ios_pencil_sample(touch, self.view));
      }
    }
    ring_origin = ios_ring_contact_at_start(ring_window, self.view, touches);
    hud_origin = {};
    pencil_paint_origin = {};
    if (ring_window && self.view == ring_window->getView() && touches.count == 1) {
      for (UITouch *touch in touches) {
        if (!(touch.type == UITouchTypePencil || touch.type == UITouchTypeDirect)) continue;
        CGPoint local = [touch locationInView:self.view];
        CGPoint origin = ring_window->scalePointToWindow(local);
        hud_origin = ghost::ios::hud_contact_at_start(ring_window, int(origin.x), int(origin.y));
        if (gesture_contact.device == ghost::ios::TouchDevice::Pencil &&
            !ring_origin.captured && !hud_origin.generation)
          pencil_paint_origin = ghost::ios::pencil_paint_at_start(
              ring_window, int(origin.x), int(origin.y), gesture_contact.serial);
      }
    }
  }
  [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  for (UITouch *touch in touches) {
    gesture_contact.update(reinterpret_cast<uintptr_t>(touch), ios_pencil_sample(touch, self.view));
  }
  [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  for (UITouch *touch in touches) {
    gesture_contact.update(reinterpret_cast<uintptr_t>(touch), ios_pencil_sample(touch, self.view));
  }
  [super touchesEnded:touches withEvent:event];
  for (UITouch *touch in touches) {
    gesture_contact.end(reinterpret_cast<uintptr_t>(touch));
  }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  for (UITouch *touch in touches) {
    gesture_contact.update(reinterpret_cast<uintptr_t>(touch), ios_pencil_sample(touch, self.view));
  }
  [super touchesCancelled:touches withEvent:event];
  for (UITouch *touch in touches) {
    gesture_contact.end(reinterpret_cast<uintptr_t>(touch));
  }
}

- (void)reset
{
  ring_origin = ghost::ios::PencilRingContact{};
  hud_origin = {};
  pencil_paint_origin = {};
  touch_admission.reset();
  gesture_contact.reset();
  [super reset];
  cached_translation = CGPointZero;
}

- (BOOL)touchStreamAllowed
{
  return touch_admission.allowed();
}

- (void)invalidateTouchStream
{
  touch_admission.interrupt();
}

- (BOOL)gestureUsesPencil { return gesture_contact.pencil(); }
- (BOOL)gestureUsesFinger { return gesture_contact.touch && gesture_contact.device == ghost::ios::TouchDevice::Finger; }
- (BOOL)pencilContactDown { return gesture_contact.pencil_down(); }
- (ghost::ios::PencilSample)pencilSample { return gesture_contact.latest; }

- (CGPoint)getScaledTouchPoint:(GHOST_WindowIOS *)window
{
  CGPoint touch_point = [self locationInView:window->getView()];
  return window->scalePointToWindow(touch_point);
}

- (CGPoint)getScaledTranslation:(GHOST_WindowIOS *)window
{
  CGPoint translation = [self translationInView:window->getView()];
  return window->scalePointToWindow(translation);
}

- (CGPoint)getRelativeTranslation:(CGPoint)translation
{
  CGPoint relative_translation;
  relative_translation.x = translation.x - cached_translation.x;
  relative_translation.y = translation.y - cached_translation.y;
  return relative_translation;
}

- (void)setCachedTranslation:(CGPoint)translation
{
  cached_translation = translation;
}

- (CGPoint)getCachedTranslation
{
  return cached_translation;
}
@end

@interface GHOSTUIHoverGestureRecognizer : UIHoverGestureRecognizer
- (CGPoint)getScaledTouchPoint:(GHOST_WindowIOS *)window;
@end

@implementation GHOSTUIHoverGestureRecognizer

- (CGPoint)getScaledTouchPoint:(GHOST_WindowIOS *)window
{
  CGPoint touch_point = [self locationInView:window->getView()];
  return window->scalePointToWindow(touch_point);
}
@end

@interface GHOSTUIPinchGestureRecognizer : UIPinchGestureRecognizer
{
  CGFloat cached_distance;
  BOOL direct_touch;
}
- (CGPoint)getScaledTouchPoint:(GHOST_WindowIOS *)window touch_id:(int)touch_id;
- (CGFloat)getScaledDistance:(GHOST_WindowIOS *)window;
- (CGPoint)getPinchMidpoint:(GHOST_WindowIOS *)window;
- (void)setCachedDistance:(CGFloat)distance;
- (CGFloat)getCachedDistance;
- (BOOL)isDirectTouch;
@end

@implementation GHOSTUIPinchGestureRecognizer
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  /* The recognizer requires one touch type per gesture. Trackpads retain their
   * normal zoom preferences; only fingers on the screen opt into auto depth. */
  if (touches.count) {
    direct_touch = touches.anyObject.type == UITouchTypeDirect;
  }
  [super touchesBegan:touches withEvent:event];
}

- (void)reset
{
  [super reset];
  direct_touch = NO;
  cached_distance = 0;
}

- (BOOL)isDirectTouch
{
  return direct_touch;
}

- (CGPoint)getScaledTouchPoint:(GHOST_WindowIOS *)window touch_id:(int)touch_id
{
  CGPoint touch_point = [self locationOfTouch:touch_id inView:window->getView()];
  return window->scalePointToWindow(touch_point);
}

- (CGFloat)getScaledDistance:(GHOST_WindowIOS *)window
{
  CGPoint touch_point0 = [self locationOfTouch:0 inView:window->getView()];
  CGPoint touch_point1 = [self locationOfTouch:1 inView:window->getView()];
  touch_point0 = window->scalePointToWindow(touch_point0);
  touch_point1 = window->scalePointToWindow(touch_point1);
  float dx = touch_point1.x - touch_point0.x;
  float dy = touch_point1.y - touch_point0.y;
  CGFloat point_distance = sqrt(dx * dx + dy * dy);
  return point_distance;
}

- (CGPoint)getPinchMidpoint:(GHOST_WindowIOS *)window
{
  CGPoint touch_point0 = [self locationOfTouch:0 inView:window->getView()];
  CGPoint touch_point1 = [self locationOfTouch:1 inView:window->getView()];
  touch_point0 = window->scalePointToWindow(touch_point0);
  touch_point1 = window->scalePointToWindow(touch_point1);
  CGPoint midPoint = CGPointMake((touch_point0.x + touch_point1.x) / 2.0f,
                                 (touch_point0.y + touch_point1.y) / 2.0f);
  return midPoint;
}

- (void)setCachedDistance:(CGFloat)distance
{
  cached_distance = distance;
}

- (CGFloat)getCachedDistance
{
  return cached_distance;
}
@end

/* GHOSTUIWindow interface. */
@interface GHOSTUIWindow : UIWindow <UIGestureRecognizerDelegate, UIPencilInteractionDelegate>
{
  GHOST_SystemIOS *system;
  GHOST_WindowIOS *window;

  GHOSTUITapGestureRecognizer *tap_gesture_recognizer;
  GHOSTUITapGestureRecognizer *tap2f_gesture_recognizer;
  GHOSTUITapGestureRecognizer *tap3f_gesture_recognizer;
  GHOSTUITapGestureRecognizer *tap4f_gesture_recognizer;
  GHOSTUIPanGestureRecognizer *pan_gesture_recognizer;
  GHOSTUIPanGestureRecognizer *pan2f_gesture_recognizer;
  GHOSTUIPanGestureRecognizer *pan3f_gesture_recognizer;
  GHOSTUIPanGestureRecognizer *indirect_pan_gesture_recognizer;
  GHOSTUIPinchGestureRecognizer *zoom_gesture_recognizer;
  UIPanGestureRecognizer *scroll_gesture_recognizer;
  CGFloat last_scroll_y;
  CGFloat last_scroll_x;
  CGFloat scroll_accum_y;
  GHOSTUIHoverGestureRecognizer *hover_gesture_recognizer;
  GHOSTUIHoverGestureRecognizer *ring_hover_gesture_recognizer;
  ghost::ios::PencilRingContact ring_hover_capture;
  UIPencilInteraction *pencil_interaction;
  UIScreenEdgePanGestureRecognizer *edge_swipe_left;
  UIScreenEdgePanGestureRecognizer *edge_swipe_right;
  // GHOSTUILongPressGestureRecognizer *long_press_gesture_recognizer;

  /* Data from the Apple pencil */
  UITouch *current_pencil_touch;
  GHOST_TabletData tablet_data;
  bool last_tap_with_pencil;
  CGPoint last_pencil_location;
  uint64_t last_pencil_location_time;

  /* Keyboard handling. */
  UITextField *text_field;
  std::string original_text;
  bool onscreen_keyboard_active;
  std::string text_field_string;
  bool text_field_string_valid;
  GHOST_KeyboardProperties current_keyboard_properties;
  bool external_keyboard_connected;
  bool native_chrome_hovered;
  ghost::ios::PointerCapture pointer_capture;
  ghost::ios::HUDContact pointer_hud_contact;
  bool pointer_finger_contact;
  ghost::ios::PencilRingContact ring_capture;
  ghost::ios::PencilPaintContact pencil_paint_enqueued;
  uint64_t pencil_paint_retired_serial;
  bool pencil_paint_enqueued_down;
  CGPoint pencil_paint_last_location;
  GHOST_TabletData pencil_paint_last_tablet;
  bool external_mouse_connected;
  bool mouse_left_pressed;
  bool mouse_middle_pressed;
  bool mouse_right_pressed;
  CGFloat mouse_cursor_x;
  CGFloat mouse_cursor_y;
  bool mouse_pos_valid;
  /* True while an external-mouse left/middle-button drag is being driven by the
   * indirect-pointer pan recognizer (accurate absolute coords). Suppresses the
   * GCMouse delta path so the two don't fight. */
  bool indirect_pointer_dragging;
  /* Previous accurate absolute position during an indirect-pointer drag, used to
   * compute exact orbit/pan deltas for the middle button. */
  CGFloat indirect_prev_x;
  CGFloat indirect_prev_y;
  /* External-keyboard Shift state + latched drag mode: plain middle drag = orbit
   * (trackpad scroll); Shift+middle = native grab-pan via accurate CURSOR_MOVE. */
  bool shift_pressed;
  bool indirect_is_orbit;
  bool indirect_is_pan;
  /* Sub-pixel remainder carried across scaled pan deltas, so a low MMB_PAN_SCALE
   * doesn't truncate slow movements to integer 0. */
  float pan_accum_x;
  float pan_accum_y;

  /* Toolbar */
  bool toolbar_enabled;
  UIToolbar *toolbar;
  UIBarButtonItem *toolbar_tip_item;
  UIBarButtonItem *toolbar_live_text_item;
  UIBarButtonItem *toolbar_done_editing_item;
  UIBarButtonItem *toolbar_cancel_editing_item;
}

- (void)setSystemAndWindowIOS:(GHOST_SystemIOS *)sysCocoa windowIOS:(GHOST_WindowIOS *)winCocoa;

/* Blender event generation. */
- (void)generateUserInputEvents:(const UserInputEvent &)event_info;

/* Gesture recognizers. */
- (void)registerGestureRecognizers;
- (void)cancelPointerCapture;
- (void)cancelRingHover;
- (void)handlePencilRingHover:(GHOSTUIHoverGestureRecognizer *)sender;
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
    shouldRecognizeSimultaneouslyWithGestureRecognizer:
        (UIGestureRecognizer *)otherGestureRecognizer;
- (void)handleTap:(GHOSTUITapGestureRecognizer *)sender;
- (void)handlePan:(GHOSTUIPanGestureRecognizer *)sender;
- (void)handlePan2f:(GHOSTUIPanGestureRecognizer *)sender;
- (void)handlePan3f:(GHOSTUIPanGestureRecognizer *)sender;
- (void)handleIndirectPan:(GHOSTUIPanGestureRecognizer *)sender;
- (void)handleZoom:(GHOSTUIPinchGestureRecognizer *)sender;
- (void)handleScroll:(UIPanGestureRecognizer *)sender;

/* Native chrome is outside the Blender input surface. */
- (void)setNativeChromeHovered:(BOOL)hovered;

/* On screen keyboard handling */
- (UITextField *)getUITextField;
- (const GHOST_TabletData)getTabletData;
- (GHOST_TSuccess)popupOnscreenKeyboard:(const GHOST_KeyboardProperties &)keyboard_properties;
- (GHOST_TSuccess)hideOnscreenKeyboard;
- (const char *)getLastKeyboardString;
@end

/* The first live GHOST window is the workspace. Parentless render/duplicate
 * windows also need an escape path; window count alone must not close the workspace. */
static bool ios_can_close_window(GHOST_SystemIOS *system, GHOST_IWindow *window)
{
  const auto &windows = system->getWindowManager()->getWindows();
  return windows.size() > 1 && windows.front() != window &&
         system->getWindowManager()->getWindowFound(window);
}

/* GameController handlers belong to the input device, not a particular UIWindow.
 * Resolve both event destination and button state on each callback, including
 * after an auxiliary view closes or a device reconnects. */
static GHOSTUIWindow *ios_active_input_window(GHOST_SystemIOS *system)
{
  GHOST_IWindow *active = system->getWindowManager()->getActiveWindow();
  if (!system->getWindowManager()->getWindowFound(active)) {
    return nil;
  }
  return (GHOSTUIWindow *)static_cast<GHOST_WindowIOS *>(active)->getView().window;
}

/* Shared across callback reinstallation when the active view changes. */
static bool ios_escape_closes_window = false;

@implementation GHOSTUIWindow
- (void)setNativeChromeHovered:(BOOL)hovered
{
  native_chrome_hovered = hovered;
}

- (void)setSystemAndWindowIOS:(GHOST_SystemIOS *)sys windowIOS:(GHOST_WindowIOS *)win
{
  system = sys;
  window = win;
  text_field = nil;
  original_text.clear();
  onscreen_keyboard_active = false;
  text_field_string.clear();
  text_field_string_valid = false;
  current_pencil_touch = nil;
  tablet_data = GHOST_TABLET_DATA_NONE;
  toolbar_enabled = true;
  toolbar = nil;
  last_tap_with_pencil = false;
  indirect_pointer_dragging = false;
  native_chrome_hovered = false;
  pointer_capture = {};
  pointer_finger_contact = false;
  ring_hover_capture = {};
  ring_hover_gesture_recognizer = nil;
  shift_pressed = false;
  indirect_is_orbit = false;
  indirect_is_pan = false;
  pan_accum_x = 0.0f;
  pan_accum_y = 0.0f;
  external_keyboard_connected = [GCKeyboard coalescedKeyboard] != nil;

  /* Register for notifications of chnanges to the onscreen keyboard. */
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWillChange:)
                                               name:UIKeyboardWillChangeFrameNotification
                                             object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWillChange:)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWillChange:)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];

  /* Check whether we've linked the GameController framework. */
  if (&GCKeyboardDidConnectNotification != NULL) {
    /* Register for notifcations an external keyboard has been added/removed. */
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(externalKeyboardChange:)
                                                 name:GCKeyboardDidConnectNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(externalKeyboardChange:)
                                                 name:GCKeyboardDidDisconnectNotification
                                               object:nil];
  }

  /* Register for notifications that an external mouse has been connected/current. */
  if (&GCMouseDidBecomeCurrentNotification != NULL) {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(externalMouseChange:)
                                                 name:GCMouseDidBecomeCurrentNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(externalMouseChange:)
                                                 name:GCMouseDidConnectNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(externalMouseChange:)
                                                 name:GCMouseDidDisconnectNotification
                                               object:nil];
  }
}

- (void)registerGestureRecognizers
{
  /** Create Gesture recognisers. */
  /* Tap gesture recognizer. */
  tap_gesture_recognizer = [[GHOSTUITapGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(handleTap:)];
  tap_gesture_recognizer.delegate = self;
  [tap_gesture_recognizer setRingWindow:window];
  tap_gesture_recognizer.cancelsTouchesInView = false;
  tap_gesture_recognizer.allowedTouchTypes = @[ @(UITouchTypePencil), @(UITouchTypeDirect) ];
  [window->getView() addGestureRecognizer:tap_gesture_recognizer];

  /* Two-finger tap gesture recognizer. */
  tap2f_gesture_recognizer = [[GHOSTUITapGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(handleTap2F:)];
  tap2f_gesture_recognizer.delegate = self;
  tap2f_gesture_recognizer.allowedTouchTypes = @[ @(UITouchTypeDirect),
      @(UITouchTypeIndirect), @(UITouchTypeIndirectPointer) ];
  tap2f_gesture_recognizer.cancelsTouchesInView = false;
  tap2f_gesture_recognizer.delaysTouchesBegan = YES;
  tap2f_gesture_recognizer.numberOfTouchesRequired = 2;
  [window->getView() addGestureRecognizer:tap2f_gesture_recognizer];

  /* Three-finger tap gesture recognizer. */
  tap3f_gesture_recognizer = [[GHOSTUITapGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(handleTap3F:)];
  tap3f_gesture_recognizer.delegate = self;
  tap3f_gesture_recognizer.allowedTouchTypes = @[ @(UITouchTypeDirect),
      @(UITouchTypeIndirect), @(UITouchTypeIndirectPointer) ];
  tap3f_gesture_recognizer.cancelsTouchesInView = false;
  tap3f_gesture_recognizer.delaysTouchesBegan = YES;
  tap3f_gesture_recognizer.numberOfTouchesRequired = 3;
  [window->getView() addGestureRecognizer:tap3f_gesture_recognizer];

  /* Four-finger tap gesture recognizer. */
  tap4f_gesture_recognizer = [[GHOSTUITapGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(handleTap4F:)];
  tap4f_gesture_recognizer.delegate = self;
  tap4f_gesture_recognizer.allowedTouchTypes = @[ @(UITouchTypeDirect),
      @(UITouchTypeIndirect), @(UITouchTypeIndirectPointer) ];
  tap4f_gesture_recognizer.cancelsTouchesInView = false;
  tap4f_gesture_recognizer.delaysTouchesBegan = YES;
  tap4f_gesture_recognizer.numberOfTouchesRequired = 4;
  [window->getView() addGestureRecognizer:tap4f_gesture_recognizer];

  /* Pan gesture recognizer - static UI. */
  pan_gesture_recognizer = [[GHOSTUIPanGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(handlePan:)];
  pan_gesture_recognizer.delegate = self;
  [pan_gesture_recognizer setRingWindow:window];
  pan_gesture_recognizer.cancelsTouchesInView = false;
  /* Allow scrolling only with a single finger. */
  pan_gesture_recognizer.minimumNumberOfTouches = 1;
  pan_gesture_recognizer.maximumNumberOfTouches = 1;
  /* Allow finger and pencil. */
  pan_gesture_recognizer.allowedTouchTypes = @[ @(UITouchTypePencil), @(UITouchTypeDirect) ];
  [window->getView() addGestureRecognizer:pan_gesture_recognizer];

  /* A pencil/finger DRAG (paint/sculpt stroke) must not also fire a tap "click":
   * make the tap wait for the pan to fail first. Otherwise each stroke gets a
   * spurious full-pressure tap-dab overlaid (the Apple Pencil "mouse-click
   * overlap" / first-dab full pressure / end->start line). A pure tap (no drag)
   * still clicks, just after the pan fails. */
  [tap_gesture_recognizer requireGestureRecognizerToFail:pan_gesture_recognizer];

  /* Indirect-pointer (external mouse) drag recognizer.
   * A left-button mouse drag is delivered to UIKit as a UITouchTypeIndirectPointer
   * touch; -locationInView: then yields the accurate, OS-accelerated absolute
   * pointer position for the whole drag. We drive the cursor from that for
   * box-select etc. instead of GCMouse raw deltas (unaccelerated -> they drift).
   * Button down/up still come from GCMouse. Only left-button drags produce this
   * touch, so middle/right drags keep using the delta path unchanged. */
  if (@available(iOS 13.4, *)) {
    indirect_pan_gesture_recognizer = [[GHOSTUIPanGestureRecognizer alloc]
        initWithTarget:self
                action:@selector(handleIndirectPan:)];
    indirect_pan_gesture_recognizer.delegate = self;
    indirect_pan_gesture_recognizer.cancelsTouchesInView = false;
    indirect_pan_gesture_recognizer.minimumNumberOfTouches = 1;
    indirect_pan_gesture_recognizer.maximumNumberOfTouches = 1;
    indirect_pan_gesture_recognizer.allowedTouchTypes = @[ @(UITouchTypeIndirectPointer) ];
    [window->getView() addGestureRecognizer:indirect_pan_gesture_recognizer];
  }

  /* Pan gesture recognizer - two fingers 3D UI. */
  pan2f_gesture_recognizer = [[GHOSTUIPanGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(handlePan2f:)];
  pan2f_gesture_recognizer.delegate = self;
  pan2f_gesture_recognizer.allowedTouchTypes = @[ @(UITouchTypeDirect),
      @(UITouchTypeIndirect), @(UITouchTypeIndirectPointer) ];
  pan2f_gesture_recognizer.cancelsTouchesInView = false;
  /* Two finger gestures only.  */
  pan2f_gesture_recognizer.minimumNumberOfTouches = 2;
  pan2f_gesture_recognizer.maximumNumberOfTouches = 2;
  [window->getView() addGestureRecognizer:pan2f_gesture_recognizer];

  /* Pan gesture recognizer - three fingers 3D UI. */
  pan3f_gesture_recognizer = [[GHOSTUIPanGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(handlePan3f:)];
  pan3f_gesture_recognizer.delegate = self;
  pan3f_gesture_recognizer.allowedTouchTypes = @[ @(UITouchTypeDirect),
      @(UITouchTypeIndirect), @(UITouchTypeIndirectPointer) ];
  pan3f_gesture_recognizer.cancelsTouchesInView = false;
  pan3f_gesture_recognizer.minimumNumberOfTouches = 3;
  pan3f_gesture_recognizer.maximumNumberOfTouches = 3;
  [window->getView() addGestureRecognizer:pan3f_gesture_recognizer];
  [tap3f_gesture_recognizer requireGestureRecognizerToFail:pan3f_gesture_recognizer];


  /* Pinch/Zoom gesture recognizer. */
  zoom_gesture_recognizer = [[GHOSTUIPinchGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(handleZoom:)];
  zoom_gesture_recognizer.delegate = self;
  zoom_gesture_recognizer.requiresExclusiveTouchType = YES;
  zoom_gesture_recognizer.allowedTouchTypes = @[ @(UITouchTypeDirect),
      @(UITouchTypeIndirect), @(UITouchTypeIndirectPointer) ];
  zoom_gesture_recognizer.cancelsTouchesInView = false;
  [window->getView() addGestureRecognizer:zoom_gesture_recognizer];

  /* Scroll gesture recognizer - mouse wheel and trackpad scroll (indirect pointer). */
  scroll_gesture_recognizer = [[UIPanGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(handleScroll:)];
  scroll_gesture_recognizer.delegate = self;
  scroll_gesture_recognizer.cancelsTouchesInView = false;
  /* Do not consume finger/pencil touches; only handle pointer scroll. */
  scroll_gesture_recognizer.allowedTouchTypes = @[];
  if (@available(iOS 13.4, *)) {
    scroll_gesture_recognizer.allowedScrollTypesMask = UIScrollTypeMaskAll;
  }
  [window->getView() addGestureRecognizer:scroll_gesture_recognizer];

  /* Edge swipe. */
  edge_swipe_left = [[UIScreenEdgePanGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(handleEdgeSwipe:)];
  edge_swipe_left.edges = UIRectEdgeLeft;
  edge_swipe_left.delegate = self;
  [window->getView() addGestureRecognizer:edge_swipe_left];

  edge_swipe_right = [[UIScreenEdgePanGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(handleEdgeSwipe:)];
  edge_swipe_right.edges = UIRectEdgeRight;
  edge_swipe_right.delegate = self;
  [window->getView() addGestureRecognizer:edge_swipe_right];

  /* Apple Pencil hover recognizer. */
  hover_gesture_recognizer = [[GHOSTUIHoverGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(handleHover:)];
  hover_gesture_recognizer.delegate = self;
  [window->getView() addGestureRecognizer:hover_gesture_recognizer];
  /* Ring browsing is contact-only. Keep the ordinary hover recognizer for
   * cursor/highlight feedback; do not attach a barrel-roll navigation sensor. */
  current_pencil_touch = nil;

  /**  Apple Pencil double-tap. */
  pencil_interaction = [[UIPencilInteraction alloc] init];
  pencil_interaction.delegate = self;
  [window->getView() addInteraction:pencil_interaction];
}

/* Turn the user inputs into Blender events.
 * We batch up the events rather than send them directly in the gesture
 * recognisers to ensure we don't interleave events if we detect simultaneous
 * inputs. */
- (void)generateUserInputEvents:(const UserInputEvent &)event_info
{
  /* Lock access to ensure all input-events are received sequentially. */
  @synchronized(self) {
    /* Finger/indirect samples must not inherit a nearby Pencil's hover data. */
    const GHOST_TabletData event_tablet = event_info.pencil_used ?
        (event_info.tablet_snapshot_valid ? event_info.tablet_snapshot : tablet_data) :
        GHOST_TABLET_DATA_NONE;
    const ghost::ios::PencilPaintContact contact = event_info.pencil_paint;
    const bool tagged_pencil = contact.valid();
    auto same_contact = [&]() {
      return ghost::ios::pencil_paint_contact_equal(contact, pencil_paint_enqueued);
    };
    for (int i = 0; i < event_info.num_events; i++) {
      UserInputEvent::EventTypes event_type = event_info.event_list[i];
      const bool pointer_event = event_type == UserInputEvent::EventTypes::CURSOR_MOVE ||
          event_type == UserInputEvent::EventTypes::LEFT_BUTTON_DOWN ||
          event_type == UserInputEvent::EventTypes::LEFT_BUTTON_UP;
      if (pointer_event) {
        if (pencil_paint_enqueued_down) {
          /* One contact owns the shared GHOST pointer until its exact terminal. */
          if (!tagged_pencil || !same_contact()) continue;
        }
        else if (tagged_pencil &&
                 (contact.serial <= pencil_paint_retired_serial ||
                  !ghost::ios::pencil_paint_ticket_live(window, contact) ||
                  event_type == UserInputEvent::EventTypes::LEFT_BUTTON_UP))
        {
          continue;
        }
      }
      IOS_INPUT_LOG(@"%d-%@ %f,%f",
                    i,
                    event_info.getEventTypeDesc(event_type),
                    event_info.location.x,
                    event_info.location.y);

      switch (event_type) {
        case UserInputEvent::EventTypes::CURSOR_MOVE:
          if (event_info.pencil_used) {
            last_pencil_location = event_info.location;
            last_pencil_location_time = system->getMilliSeconds();
          }
          system->pushEvent(
              new GHOST_EventCursor(GHOST_GetMilliSeconds((GHOST_SystemHandle)system),
                                    GHOST_kEventCursorMove,
                                    window,
                                    event_info.location.x,
                                    event_info.location.y,
                                    event_tablet,
                                    event_info.direct_tool, event_info.hud_generation, event_info.hud_serial,
                                    event_info.direct_finger, event_info.finger_paint_generation,
                                    contact.serial, contact.generation, contact.region,
                                    contact.origin_x, contact.origin_y));
          if (tagged_pencil && pencil_paint_enqueued_down && same_contact()) {
            pencil_paint_last_location = event_info.location;
            pencil_paint_last_tablet = event_tablet;
          }
          break;
        case UserInputEvent::EventTypes::PAN_GESTURE:
          system->pushEvent(
              new GHOST_EventTrackpad(GHOST_GetMilliSeconds((GHOST_SystemHandle)system),
                                      window,
                                      GHOST_kTrackpadEventScroll,
                                      event_info.location.x,
                                      event_info.location.y,
                                      event_info.translation.x,
                                      event_info.translation.y,
                                      false,
                                      1));
          break;
        case UserInputEvent::EventTypes::PAN_GESTURE_TWO_FINGERS:
          system->pushEvent(
              new GHOST_EventTrackpad(GHOST_GetMilliSeconds((GHOST_SystemHandle)system),
                                      window,
                                      GHOST_kTrackpadEventScroll,
                                      event_info.location.x,
                                      event_info.location.y,
                                      event_info.translation.x,
                                      event_info.translation.y,
                                      true,
                                      2));
          break;
        case UserInputEvent::EventTypes::PAN_GESTURE_THREE_FINGERS: {
          static CGFloat g_pan_accum_x = 0.0f;
          static CGFloat g_pan_accum_y = 0.0f;
          g_pan_accum_x += event_info.translation.x * MMB_PAN_SCALE;
          g_pan_accum_y += event_info.translation.y * MMB_PAN_SCALE;
          int32_t step_x = (int32_t)g_pan_accum_x;
          int32_t step_y = (int32_t)g_pan_accum_y;
          g_pan_accum_x -= step_x;
          g_pan_accum_y -= step_y;
          if (step_x != 0 || step_y != 0) {
            system->pushEvent(
                new GHOST_EventKey(GHOST_GetMilliSeconds((GHOST_SystemHandle)system),
                                   GHOST_kEventKeyDown,
                                   window,
                                   GHOST_kKeyLeftShift,
                                   false,
                                   nullptr));
            system->pushEvent(
                new GHOST_EventTrackpad(GHOST_GetMilliSeconds((GHOST_SystemHandle)system),
                                        window,
                                        GHOST_kTrackpadEventScroll,
                                        event_info.location.x,
                                        event_info.location.y,
                                        step_x,
                                        step_y,
                                        true,
                                        2));
            system->pushEvent(
                new GHOST_EventKey(GHOST_GetMilliSeconds((GHOST_SystemHandle)system),
                                   GHOST_kEventKeyUp,
                                   window,
                                   GHOST_kKeyLeftShift,
                                   false,
                                   nullptr));
          }
          break;
        }
        case UserInputEvent::EventTypes::LEFT_BUTTON_DOWN:
          if (tagged_pencil && pencil_paint_enqueued_down) break;
          if (tagged_pencil && !ghost::ios::pencil_paint_ticket_live(window, contact)) break;
          system->pushEvent(
              new GHOST_EventButton(GHOST_GetMilliSeconds((GHOST_SystemHandle)system),
                                    GHOST_kEventButtonDown,
                                    window,
                                    GHOST_kButtonMaskLeft,
                                    event_tablet,
                                    false,
                                    event_info.direct_tool, event_info.hud_generation, event_info.hud_serial,
                                    event_info.direct_finger, event_info.finger_paint_generation,
                                    contact.serial, contact.generation, contact.region,
                                    contact.origin_x, contact.origin_y));
          if (tagged_pencil) {
            /* Mark ownership only after the actual event has been enqueued. */
            pencil_paint_enqueued = contact;
            pencil_paint_enqueued_down = true;
            pencil_paint_last_location = event_info.location;
            pencil_paint_last_tablet = event_tablet;
          }
          break;
        case UserInputEvent::EventTypes::LEFT_BUTTON_UP:
          system->pushEvent(
              new GHOST_EventButton(GHOST_GetMilliSeconds((GHOST_SystemHandle)system),
                                    GHOST_kEventButtonUp, window, GHOST_kButtonMaskLeft, event_tablet,
                                    event_info.cancelled,
                                    event_info.direct_tool, event_info.hud_generation, event_info.hud_serial,
                                    event_info.direct_finger, event_info.finger_paint_generation,
                                    contact.serial, contact.generation, contact.region,
                                    contact.origin_x, contact.origin_y));
          if (tagged_pencil) {
            pencil_paint_last_location = event_info.location;
            pencil_paint_last_tablet = event_tablet;
            pencil_paint_enqueued_down = false;
            pencil_paint_retired_serial = std::max(pencil_paint_retired_serial, contact.serial);
            pencil_paint_enqueued = {};
          }
          break;
        case UserInputEvent::EventTypes::PINCH_GESTURE:
          system->pushEvent(
              new GHOST_EventTrackpad(GHOST_GetMilliSeconds((GHOST_SystemHandle)system),
                                      window,
                                      event_info.direct_touch ? GHOST_kTrackpadEventMagnifyTouch :
                                                                GHOST_kTrackpadEventMagnify,
                                      event_info.location.x,
                                      event_info.location.y,
                                      event_info.distance,
                                      0,
                                      false,
                                      2));
          break;
        case UserInputEvent::EventTypes::PENCIL_TOOL_PALETTE:
          system->pushEvent(new GHOST_Event(system->getMilliSeconds(),
                                           GHOST_kEventPencilToolPalette, window));
          break;
        case UserInputEvent::EventTypes::PENCIL_CONTEXT_MENU:
          /* Simulate clicking with the right mouse button. */
          system->pushEvent(
              new GHOST_EventButton(GHOST_GetMilliSeconds((GHOST_SystemHandle)system),
                                    GHOST_kEventButtonDown,
                                    window,
                                    GHOST_kButtonMaskRight,
                                    GHOST_TABLET_DATA_NONE));
          system->pushEvent(
              new GHOST_EventButton(GHOST_GetMilliSeconds((GHOST_SystemHandle)system),
                                    GHOST_kEventButtonUp,
                                    window,
                                    GHOST_kButtonMaskRight,
                                    GHOST_TABLET_DATA_NONE));
          break;
        default:
          GHOST_ASSERT(FALSE, "GHOST_SystemIOS::generateUserInputEvents unsupported event type");
      }
    }
  }
}

/* Allow simultaneous gestures for two finger pans and zooms but nothing else. */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
    shouldRecognizeSimultaneouslyWithGestureRecognizer:
        (UIGestureRecognizer *)otherGestureRecognizer
{
  if ((gestureRecognizer == ring_hover_gesture_recognizer &&
       otherGestureRecognizer == hover_gesture_recognizer) ||
      (gestureRecognizer == hover_gesture_recognizer &&
       otherGestureRecognizer == ring_hover_gesture_recognizer)) return YES;
  if (GHOST_IOS_get_flythrough_mode()) {
    /* In Flythrough mode, 2-finger pan and pinch dolly must be mutually exclusive
     * to eliminate jitter, stutter, and conflicting camera movements. */
    return NO;
  }

  if ((gestureRecognizer == pan2f_gesture_recognizer &&
       otherGestureRecognizer == zoom_gesture_recognizer) ||
      (gestureRecognizer == zoom_gesture_recognizer &&
       otherGestureRecognizer == pan2f_gesture_recognizer))
  {
    return YES;
  }

  return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)recognizer shouldReceiveTouch:(UITouch *)touch
{
  /* Reject at touch-down, so lifting after a hardware release cannot synthesize
   * a new click/release from a touch that began inside that hardware drag. */
  if ((recognizer == tap_gesture_recognizer || recognizer == pan_gesture_recognizer) &&
      (touch.type == UITouchTypeDirect || touch.type == UITouchTypePencil) &&
      (mouse_left_pressed || mouse_middle_pressed || mouse_right_pressed)) {
    return NO;
  }
  return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
  if (gestureRecognizer == pan3f_gesture_recognizer && GHOST_IOS_get_flythrough_mode()) {
    return NO;
  }
  return YES;
}

/* Override touch methods to capture the UITouch object. */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  [super touchesBegan:touches withEvent:event];

  for (UITouch *touch in touches) {
    if (touch.type == UITouchTypePencil) {
      current_pencil_touch = touch;
      break;
    }
  }
}

/* Get updated tablet data. */
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  [super touchesMoved:touches withEvent:event];

  /* Check if one of the touches was from a pencil. */
  if (current_pencil_touch) {
    /* Iterate through all pencil touches. */
    for (UITouch *touch in touches) {
      if (touch.type == UITouchTypePencil) {
        current_pencil_touch = touch;

        tablet_data.Active = GHOST_kTabletModeStylus;

        /* Map apple pessure Range to Blender range: 0.0 (not touching) to 1.0 (full pressure). */
        tablet_data.Pressure = current_pencil_touch.maximumPossibleForce > 0.0 ?
                                   current_pencil_touch.force /
                                       current_pencil_touch.maximumPossibleForce :
                                   0.0f;

        CGFloat azimuthAngle = [current_pencil_touch azimuthAngleInView:window->getView()];
        CGFloat altitudeAngle = [current_pencil_touch altitudeAngle];

        /* Calculate the maximum possible tilt (1.0) when altitude is 0. */
        CGFloat maxTilt = cos(0);

        /* Convert to x and y tilt - range -1.0 (left) to +1.0 (right). */
        tablet_data.Xtilt = sin(azimuthAngle) * cos(altitudeAngle) / maxTilt;
        tablet_data.Ytilt = -cos(azimuthAngle) * cos(altitudeAngle) / maxTilt;
        IOS_INPUT_LOG(
            @"TABLET: X:%f,Y:%f,P:%f", tablet_data.Xtilt, tablet_data.Ytilt, tablet_data.Pressure);
        break;
      }
    }
  }
}

/* Reset tablet data. */
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  [super touchesEnded:touches withEvent:event];
  if (current_pencil_touch && [touches containsObject:current_pencil_touch]) {
    current_pencil_touch = nil;
    tablet_data = GHOST_TABLET_DATA_NONE;
  }
}

/* Reset tablet data. */
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  [super touchesCancelled:touches withEvent:event];
  if (current_pencil_touch && [touches containsObject:current_pencil_touch]) {
    current_pencil_touch = nil;
    tablet_data = GHOST_TABLET_DATA_NONE;
  }
}

- (void)handleTap:(GHOSTUITapGestureRecognizer *)sender
{
  /* Hardware ownership can begin after this touch was admitted. */
  if (sender.state != UIGestureRecognizerStateEnded ||
      ![sender touchStreamAllowed] ||
      mouse_left_pressed || mouse_middle_pressed || mouse_right_pressed) {
    return;
  }
  CGPoint touch_point = [sender getScaledTouchPoint:window];
  const auto ring = [sender ringContact];
  if (ring.captured) {
    ios_ring_packet(system, window, ring, GHOST_kPencilRingBegin,
                    CGPointMake(ring.origin_x, ring.origin_y));
    ios_ring_packet(system, window, ring, GHOST_kPencilRingEnd, touch_point);
    return;
  }
  last_tap_with_pencil = [sender gestureUsesPencil];
  const GHOST_TabletData gesture_tablet = ios_tablet_snapshot([sender pencilSample]);
  if (last_tap_with_pencil) tablet_data = gesture_tablet;

  const auto hud = [sender hudContact];
  if (hud.generation) touch_point = CGPointMake(hud.x, hud.y);
  UserInputEvent event_info(&touch_point, nullptr, nullptr, last_tap_with_pencil);
  if (last_tap_with_pencil) event_info.set_tablet_snapshot(gesture_tablet);
  event_info.direct_finger = [sender gestureUsesFinger];
  event_info.finger_paint_generation = event_info.direct_finger ? [sender fingerPaintGeneration] : 0;
  event_info.pencil_paint = last_tap_with_pencil ? [sender pencilPaintContact] : ghost::ios::PencilPaintContact{};
  event_info.hud_generation = hud.generation;
  event_info.hud_serial = hud.serial;
  event_info.direct_tool = !hud.generation && ghost::ios::selection_hit(
      window, int(touch_point.x), int(touch_point.y), !GHOST_IOS_get_flythrough_mode());
  if (event_info.direct_tool) event_info.pencil_paint = {};

  /* Send events to indicate a 'click' on event end. */
  if (sender.state == UIGestureRecognizerStateEnded) {
    event_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
    event_info.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_DOWN);
    event_info.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_UP);
  }

  [self generateUserInputEvents:event_info];

  if (last_tap_with_pencil) {
    tablet_data = GHOST_TABLET_DATA_NONE;
  }
}

- (void)handleTap2F:(GHOSTUITapGestureRecognizer *)sender
{
  if (sender.state != UIGestureRecognizerStateEnded) {
    return;
  }

  CGPoint touch_point = [sender locationInView:window->getView()];
  CGFloat scale = [window->getView() contentScaleFactor];
  touch_point.x *= scale;
  touch_point.y *= scale;

  system->pushEvent(new GHOST_Event(
      GHOST_GetMilliSeconds((GHOST_SystemHandle)system), GHOST_kEventTwoFingerTap, window));
}

- (void)handleTap3F:(GHOSTUITapGestureRecognizer *)sender
{
  if (sender.state != UIGestureRecognizerStateEnded) {
    return;
  }

  CGPoint touch_point = [sender locationInView:window->getView()];
  CGFloat scale = [window->getView() contentScaleFactor];
  touch_point.x *= scale;
  touch_point.y *= scale;

  system->pushEvent(new GHOST_Event(
      GHOST_GetMilliSeconds((GHOST_SystemHandle)system), GHOST_kEventThreeFingerTap, window));
}

- (void)handleTap4F:(GHOSTUITapGestureRecognizer *)sender
{
  if (sender.state != UIGestureRecognizerStateEnded) {
    return;
  }

  CGPoint touch_point = [sender locationInView:window->getView()];
  CGFloat scale = [window->getView() contentScaleFactor];
  touch_point.x *= scale;
  touch_point.y *= scale;

  system->pushEvent(new GHOST_Event(
      GHOST_GetMilliSeconds((GHOST_SystemHandle)system), GHOST_kEventFourFingerTap, window));
}

- (void)handleScroll:(UIPanGestureRecognizer *)sender
{
  /* translationInView accumulates from gesture start; track delta per update. */
  if (sender.state == UIGestureRecognizerStateBegan) {
    last_scroll_y = 0.0f;
    last_scroll_x = 0.0f;
    return;
  }
  if (sender.state == UIGestureRecognizerStateChanged) {
    CGPoint t = [sender translationInView:window->getView()];
    CGFloat dy = t.y - last_scroll_y;
    CGFloat dx = t.x - last_scroll_x;
    last_scroll_y = t.y;
    last_scroll_x = t.x;

    /* Accumulate; emit one wheel step per threshold of movement. */
    scroll_accum_y += dy;
    const CGFloat step = 20.0f;
    while (scroll_accum_y >= step) {
      scroll_accum_y -= step;
      system->pushEvent(new GHOST_EventWheel(
          GHOST_GetMilliSeconds((GHOST_SystemHandle)system),
          window, GHOST_kEventWheelAxisVertical, -1));
    }
    while (scroll_accum_y <= -step) {
      scroll_accum_y += step;
      system->pushEvent(new GHOST_EventWheel(
          GHOST_GetMilliSeconds((GHOST_SystemHandle)system),
          window, GHOST_kEventWheelAxisVertical, 1));
    }
    (void)dx;
    return;
  }
  if (sender.state == UIGestureRecognizerStateEnded ||
      sender.state == UIGestureRecognizerStateCancelled ||
      sender.state == UIGestureRecognizerStateFailed) {
    scroll_accum_y = 0.0f;
    return;
  }
}

- (void)cancelPointerCapture
{
  [self cancelRingHover];
  /* End the exact uncaptured Pencil press before UIKit contact owners are
   * invalidated. This emits one native terminal only after the down was queued. */
  if (pencil_paint_enqueued_down) {
    CGPoint location = pencil_paint_last_location;
    UserInputEvent release(&location, nullptr, nullptr, true);
    release.set_tablet_snapshot(pencil_paint_last_tablet);
    release.pencil_paint = pencil_paint_enqueued;
    release.cancelled = true;
    release.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_UP);
    [self generateUserInputEvents:release];
  }
  [tap_gesture_recognizer invalidateTouchStream];
  [pan_gesture_recognizer invalidateTouchStream];
  if (ring_capture.finish()) {
    ios_ring_packet(system, window, ring_capture, GHOST_kPencilRingCancel,
                    CGPointMake(ring_capture.origin_x, ring_capture.origin_y));
  }
  const auto end = pointer_capture.finish(true);
  if (end.release) {
    CGPoint location = CGPointMake(mouse_cursor_x, mouse_cursor_y);
    UserInputEvent release(&location, nullptr, nullptr, false);
    release.cancelled = end.cancelled;
    release.direct_finger = pointer_finger_contact;
    /* The recognizer was invalidated above; use the pointer owner's original
     * presentation, never the current HUD or a reset recognizer. */
    release.hud_generation = pointer_hud_contact.generation;
    release.hud_serial = pointer_hud_contact.serial;
    release.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_UP);
    [self generateUserInputEvents:release];
  }
  pointer_hud_contact = {};
  pointer_finger_contact = false;
}

- (void)handlePan:(GHOSTUIPanGestureRecognizer *)sender
{
  if (![sender touchStreamAllowed]) {
    return;
  }
  /* A hardware drag owns the shared pointer until its matched release.
   * Suppress this entire newly started touch stream, even if it outlasts that release. */
  if (sender.state == UIGestureRecognizerStateBegan &&
      (mouse_left_pressed || mouse_middle_pressed || mouse_right_pressed)) {
    pointer_hud_contact = {};
    pointer_capture.begin(ghost::ios::PointerCaptureKind::None);
    pointer_capture.ended = true;
    return;
  }
  CGPoint touch_point = [sender getScaledTouchPoint:window];
  CGPoint translation = [sender getScaledTranslation:window];
  const bool pencil_pan = [sender gestureUsesPencil];
  const GHOST_TabletData gesture_tablet = ios_tablet_snapshot([sender pencilSample]);

  if (sender.state == UIGestureRecognizerStateBegan) {
    ring_capture = [sender ringContact];
    if (ring_capture.captured) {
      ios_ring_packet(system, window, ring_capture, GHOST_kPencilRingBegin,
                      CGPointMake(ring_capture.origin_x, ring_capture.origin_y));
    }
  }
  if (ring_capture.ended) return;
  if (ring_capture.captured) {
    const bool terminal = sender.state == UIGestureRecognizerStateEnded ||
        sender.state == UIGestureRecognizerStateCancelled || sender.state == UIGestureRecognizerStateFailed;
    if (terminal) {
      const auto phase = sender.state == UIGestureRecognizerStateEnded ?
          GHOST_kPencilRingEnd : GHOST_kPencilRingCancel;
      ios_ring_packet(system, window, ring_capture, phase, touch_point);
      ring_capture.finish();
    }
    else ios_ring_packet(system, window, ring_capture, GHOST_kPencilRingMotion, touch_point);
    return; /* Never synthesize mouse presses, scrolling or an ordinary release. */
  }
  if (pencil_pan) tablet_data = gesture_tablet;
  /* Use the rendered navigation hit rectangles, not a fixed screen corner.
   * Start at the actual touch origin: UIKit recognizes a pan only after movement,
   * which can already put a Pencil/finger outside a small round button. */
  if (sender.state == UIGestureRecognizerStateBegan) {
    pointer_hud_contact = [sender hudContact];
    pointer_finger_contact = [sender gestureUsesFinger];
    const auto hud = pointer_hud_contact;
    CGPoint origin = hud.generation ? CGPointMake(hud.x, hud.y) :
        CGPointMake(touch_point.x - translation.x, touch_point.y - translation.y);
    pointer_capture.begin(ghost::ios::pointer_capture_hit(
        window, int(origin.x), int(origin.y), !GHOST_IOS_get_flythrough_mode()));
    if (hud.generation) pointer_capture.begin(ghost::ios::PointerCaptureKind::Navigation);
    if (pointer_capture.active()) {
      UserInputEvent begin(&origin, nullptr, nullptr, pencil_pan);
      if (pencil_pan) begin.set_tablet_snapshot(gesture_tablet);
      begin.direct_finger = pointer_finger_contact;
      begin.hud_generation = hud.generation;
      begin.hud_serial = hud.serial;
      begin.direct_tool = pointer_capture.kind == ghost::ios::PointerCaptureKind::ToolManipulation;
      begin.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
      begin.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_DOWN);
      [self generateUserInputEvents:begin];
    }
  }
  if (pointer_capture.ended) {
    return;
  }
  if (pointer_capture.active()) {
    UserInputEvent pointer(&touch_point, nullptr, nullptr, pencil_pan);
    if (pencil_pan) pointer.set_tablet_snapshot(gesture_tablet);
    pointer.direct_finger = pointer_finger_contact;
    pointer.hud_generation = pointer_hud_contact.generation;
    pointer.hud_serial = pointer_hud_contact.serial;
    pointer.direct_tool = pointer_capture.kind == ghost::ios::PointerCaptureKind::ToolManipulation;
    pointer.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
    if (sender.state == UIGestureRecognizerStateEnded ||
        sender.state == UIGestureRecognizerStateCancelled ||
        sender.state == UIGestureRecognizerStateFailed) {
      const auto end = pointer_capture.finish(sender.state != UIGestureRecognizerStateEnded);
      pointer.cancelled = end.cancelled;
      if (end.release) {
        pointer.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_UP);
      }
    }
    [self generateUserInputEvents:pointer];
    if (pointer_capture.ended) { pointer_hud_contact = {}; pointer_finger_contact = false; }
    return;
  }
  /* Finger motion outside navigation is scrolling. Keep the
   * event position at the gesture origin so scrolling across another control
   * cannot retarget the gesture. Pencil continues through the precision path. */
  if (!pencil_pan) {
    if (GHOST_IOS_get_flythrough_mode()) {
      /* Flythrough mode: 1-finger drag looks around (orbits/tilts camera). */
      if (sender.state == UIGestureRecognizerStateBegan) {
        [sender setCachedTranslation:translation];
        mouse_cursor_x = touch_point.x;
        mouse_cursor_y = touch_point.y;
        UserInputEvent cursor_info(&touch_point, nullptr, nullptr, false);
        cursor_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
        [self generateUserInputEvents:cursor_info];
      }
      else if (sender.state == UIGestureRecognizerStateChanged) {
        CGPoint rel_tran = [sender getRelativeTranslation:translation];
        [sender setCachedTranslation:translation];
        if (!CGPointEqualToPoint(rel_tran, CGPointZero)) {
          UserInputEvent event_info(&touch_point, &rel_tran, nullptr, false);
          event_info.add_event(UserInputEvent::EventTypes::PAN_GESTURE_TWO_FINGERS);
          [self generateUserInputEvents:event_info];
        }
      }
      else if (sender.state == UIGestureRecognizerStateEnded ||
               sender.state == UIGestureRecognizerStateCancelled ||
               sender.state == UIGestureRecognizerStateFailed)
      {
        [sender setCachedTranslation:CGPointMake(0.0f, 0.0f)];
        /* End the anchored pan stream so UI gesture captures cannot leak into
         * a later trackpad scroll or another finger gesture. */
        UserInputEvent cursor_info(&touch_point, nullptr, nullptr, false);
        cursor_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
        [self generateUserInputEvents:cursor_info];
      }
      return;
    }
    CGPoint origin = CGPointMake(touch_point.x - translation.x,
                                 touch_point.y - translation.y);
    UserInputEvent scroll_info(&origin, nullptr, nullptr, false);
    if (sender.state == UIGestureRecognizerStateBegan) {
      [sender setCachedTranslation:translation];
      scroll_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
    }
    else if (sender.state == UIGestureRecognizerStateChanged) {
      scroll_info.translation = [sender getRelativeTranslation:translation];
      [sender setCachedTranslation:translation];
      if (!CGPointEqualToPoint(scroll_info.translation, CGPointZero)) {
        scroll_info.add_event(UserInputEvent::EventTypes::PAN_GESTURE);
      }
    }
    else if (sender.state == UIGestureRecognizerStateEnded ||
             sender.state == UIGestureRecognizerStateCancelled ||
             sender.state == UIGestureRecognizerStateFailed)
    {
      scroll_info.location = touch_point;
      scroll_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
    }
    [self generateUserInputEvents:scroll_info];
    return;
  }
  UserInputEvent event_info(&touch_point, nullptr, nullptr, pencil_pan);
  if (pencil_pan) {
    event_info.set_tablet_snapshot(gesture_tablet);
    event_info.pencil_paint = [sender pencilPaintContact];
  }

  if (sender.state == UIGestureRecognizerStateBegan ||
      sender.state == UIGestureRecognizerStateChanged)
  {
    /* Register initial click for click and drag support. */
    if (sender.state == UIGestureRecognizerStateBegan) {
      /* Set inital translation */
      [sender setCachedTranslation:translation];
      event_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
      event_info.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_DOWN);
    }

    /* Calculate translation change since last begin/change event */
    CGPoint relative_translation = [sender getRelativeTranslation:translation];
    /* Update cached translation */
    [sender setCachedTranslation:translation];
    /* A paint contact owns cursor motion; trackpad pan would interrupt its stroke. */
    if (!event_info.pencil_paint.valid() &&
        !CGPointEqualToPoint(relative_translation, CGPointMake(0.0f, 0.0f))) {
      event_info.translation = relative_translation;
      event_info.add_event(UserInputEvent::EventTypes::PAN_GESTURE);
    }

    /* Update cursor position on change */
    if (sender.state == UIGestureRecognizerStateChanged) {
      event_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
    }
  }

  /* Mouse release for pan. */
  if (sender.state == UIGestureRecognizerStateEnded ||
      sender.state == UIGestureRecognizerStateCancelled ||
      sender.state == UIGestureRecognizerStateFailed)
  {
    event_info.cancelled = event_info.pencil_paint.valid() &&
                           sender.state != UIGestureRecognizerStateEnded;
    event_info.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_UP);
  }
  [self generateUserInputEvents:event_info];
}

- (void)handleIndirectPan:(GHOSTUIPanGestureRecognizer *)sender
{
  /* Indirect-pointer (external mouse) drag. Fires for left AND middle button,
   * giving the accurate, OS-accelerated absolute pointer position.
   *  - Left (box-select) / Shift+middle (pan): emit accurate CURSOR_MOVE so
   *    Blender's native modal operators (box-select, view3d.move grab-pan) track
   *    the cursor with NO drift.
   *  - Plain middle (orbit): emit trackpad-scroll from the accurate delta
   *    (numFingers=2) = the iPad's native trackpad-orbit path.
   * Button down/up + Shift come from GCMouse/GCKeyboard; Blender's keymap maps
   * MIDDLEMOUSE->view3d.rotate and Shift+MIDDLEMOUSE->view3d.move. */
  CGPoint touch_point = [sender getScaledTouchPoint:window];

  if (sender.state == UIGestureRecognizerStateBegan) {
    indirect_pointer_dragging = true;
    /* Plain middle = orbit via trackpad (view3d.rotate). Shift+middle = pan:
     * take the CURSOR_MOVE (else-branch) path so accurate cursor positions drive
     * Blender's NATIVE view3d.move modal grab-pan (we relaxed its iOS guard to
     * start on a MIDDLEMOUSE press) — exact, depth/zoom-correct, no scalar. */
    indirect_is_orbit = (mouse_middle_pressed && !shift_pressed);
    indirect_is_pan = false;
    pan_accum_x = 0.0f;
    pan_accum_y = 0.0f;
    indirect_prev_x = touch_point.x;
    indirect_prev_y = touch_point.y;
    tablet_data = GHOST_TABLET_DATA_NONE;
    IOS_INPUT_LOG(@"IPAN begin x=%.1f y=%.1f M=%d shift=%d pan=%d", touch_point.x, touch_point.y, mouse_middle_pressed, shift_pressed, indirect_is_pan);
    if (!indirect_is_orbit) {
      mouse_cursor_x = touch_point.x;
      mouse_cursor_y = touch_point.y;
      UserInputEvent event_info(&touch_point, nullptr, nullptr, false);
      event_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
      [self generateUserInputEvents:event_info];
    }
    return;
  }

  if (sender.state == UIGestureRecognizerStateChanged) {
    int32_t ddx = (int32_t)(touch_point.x - indirect_prev_x);
    int32_t ddy = (int32_t)(touch_point.y - indirect_prev_y);
    indirect_prev_x = touch_point.x;
    indirect_prev_y = touch_point.y;
    if (indirect_is_orbit) {
      /* Middle drag -> trackpad scroll (numFingers=2). Blender: plain = orbit
       * (view3d.rotate), Shift = pan (view3d.move). Pan deltas are scaled by
       * MMB_PAN_SCALE to counter view3d.move's 2x trackpad formula. */
      int32_t pddx, pddy;
      if (indirect_is_pan) {
        /* Scale down + carry the sub-pixel remainder so slow pans aren't lost. */
        pan_accum_x += ddx * MMB_PAN_SCALE;
        pan_accum_y += ddy * MMB_PAN_SCALE;
        pddx = (int32_t)pan_accum_x;
        pddy = (int32_t)pan_accum_y;
        pan_accum_x -= pddx;
        pan_accum_y -= pddy;
      }
      else {
        pddx = ddx;
        pddy = ddy;
      }
      if (pddx != 0 || pddy != 0) {
        system->pushEvent(new GHOST_EventTrackpad(
            system->getMilliSeconds(), window, GHOST_kTrackpadEventScroll,
            (int32_t)touch_point.x, (int32_t)touch_point.y,
            pddx, pddy, true, 2));
      }
      IOS_INPUT_LOG(@"IPAN trackpad pan=%d ddx=%d ddy=%d -> %d,%d", indirect_is_pan, ddx, ddy, pddx, pddy);
    }
    else {
      mouse_cursor_x = touch_point.x;
      mouse_cursor_y = touch_point.y;
      tablet_data = GHOST_TABLET_DATA_NONE;
      UserInputEvent event_info(&touch_point, nullptr, nullptr, false);
      event_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
      [self generateUserInputEvents:event_info];
      IOS_INPUT_LOG(@"IPAN drag x=%.1f y=%.1f", touch_point.x, touch_point.y);
    }
    return;
  }

  if (sender.state == UIGestureRecognizerStateEnded ||
      sender.state == UIGestureRecognizerStateCancelled ||
      sender.state == UIGestureRecognizerStateFailed)
  {
    if (!indirect_is_orbit) {
      /* Emit the exact final position so box-select / pan end-point is accurate. */
      mouse_cursor_x = touch_point.x;
      mouse_cursor_y = touch_point.y;
      tablet_data = GHOST_TABLET_DATA_NONE;
      UserInputEvent event_info(&touch_point, nullptr, nullptr, false);
      event_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
      [self generateUserInputEvents:event_info];
      IOS_INPUT_LOG(@"IPAN end  x=%.1f y=%.1f", touch_point.x, touch_point.y);
    }
    indirect_pointer_dragging = false;
  }
}

- (void)handlePan2f:(GHOSTUIPanGestureRecognizer *)sender
{
  if (sender.state == UIGestureRecognizerStateBegan) {
    [self cancelPointerCapture];
  }
  /* Translation can be non-zero on begin event */
  if (sender.state == UIGestureRecognizerStateBegan ||
      sender.state == UIGestureRecognizerStateChanged)
  {
    CGPoint translation = [sender getScaledTranslation:window];

    /* Calculate translation relative to previous cached value. */
    CGPoint relative_translation = [sender getRelativeTranslation:translation];

    /* Cache new translation. */
    [sender setCachedTranslation:translation];

    /* Generate pan event if translation is non zero. */
    if (!CGPointEqualToPoint(relative_translation, CGPointMake(0.0f, 0.0f))) {
      CGPoint touch_point = [sender getScaledTouchPoint:window];
      if (GHOST_IOS_get_flythrough_mode()) {
        /* Flythrough mode: 2-finger drag = Pan (view3d.move). */
        if (sender.state == UIGestureRecognizerStateBegan) {
          mouse_cursor_x = touch_point.x;
          mouse_cursor_y = touch_point.y;
          UserInputEvent cursor_info(&touch_point, nullptr, nullptr, false);
          cursor_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
          [self generateUserInputEvents:cursor_info];
        }
        UserInputEvent event_info(&touch_point, &relative_translation, nullptr, false);
        event_info.add_event(UserInputEvent::EventTypes::PAN_GESTURE_THREE_FINGERS);
        [self generateUserInputEvents:event_info];
        return;
      }
      bool pencil_pan = current_pencil_touch ? true : false;
      UserInputEvent event_info(&touch_point, &relative_translation, nullptr, pencil_pan);
      event_info.add_event(UserInputEvent::EventTypes::PAN_GESTURE_TWO_FINGERS);
      [self generateUserInputEvents:event_info];
    }
  }
  else if (sender.state == UIGestureRecognizerStateEnded ||
           sender.state == UIGestureRecognizerStateCancelled ||
           sender.state == UIGestureRecognizerStateFailed)
  {
    /* Set translation back to zero. */
    [sender setCachedTranslation:CGPointMake(0.0f, 0.0f)];
  }
}

- (void)handlePan3f:(GHOSTUIPanGestureRecognizer *)sender
{
  if (sender.state == UIGestureRecognizerStateBegan) {
    [self cancelPointerCapture];
  }
  if (GHOST_IOS_get_flythrough_mode()) {
    if (sender.state == UIGestureRecognizerStateEnded ||
        sender.state == UIGestureRecognizerStateCancelled ||
        sender.state == UIGestureRecognizerStateFailed)
    {
      [sender setCachedTranslation:CGPointZero];
    }
    return;
  }
  if (sender.state == UIGestureRecognizerStateBegan ||
      sender.state == UIGestureRecognizerStateChanged)
  {
    CGPoint translation = [sender getScaledTranslation:window];
    CGPoint relative_translation = [sender getRelativeTranslation:translation];
    [sender setCachedTranslation:translation];
    if (!CGPointEqualToPoint(relative_translation, CGPointZero)) {
      CGPoint touch_point = [sender getScaledTouchPoint:window];
      UserInputEvent event_info(&touch_point, &relative_translation, nullptr, false);
      event_info.add_event(UserInputEvent::EventTypes::PAN_GESTURE_THREE_FINGERS);
      [self generateUserInputEvents:event_info];
    }
  }
  else if (sender.state == UIGestureRecognizerStateEnded ||
           sender.state == UIGestureRecognizerStateCancelled ||
           sender.state == UIGestureRecognizerStateFailed)
  {
    [sender setCachedTranslation:CGPointZero];
  }
}

- (void)handleEdgeSwipe:(UIScreenEdgePanGestureRecognizer *)gesture
{
  if (gesture.state != UIGestureRecognizerStateEnded) {
    return;
  }

  UIView *view = window->getView();
  CGPoint location = [gesture locationInView:view];
  CGSize viewSize = view.bounds.size;

  GHOST_TTouchEventSubTypes ghostEventType;

  if (gesture.edges == UIRectEdgeLeft) {
    ghostEventType = GHOST_kTouchEventEdgeSwipeInLeft;
  }
  else if (gesture.edges == UIRectEdgeRight) {
    ghostEventType = GHOST_kTouchEventEdgeSwipeInRight;
  }
  else {
    /* For now only handle left/right. */
    return;
  }

  system->pushEvent(new GHOST_EventTouch(
      system->getMilliSeconds(), window, ghostEventType, location.x, location.y));
}

- (void)cancelRingHover
{
  ring_hover_capture.finish();
}

- (void)handlePencilRingHover:(GHOSTUIHoverGestureRecognizer *)sender
{
  /* A queued callback from a previously installed sensor is harmless. Hover
   * must never move the choices under the Pencil; only tip contact can browse. */
  (void)sender;
  ring_hover_capture.finish();
}

- (void)handleHover:(GHOSTUIHoverGestureRecognizer *)sender
{
  IOS_INPUT_LOG(@"HOVER fired, btn_pressed=%d", mouse_left_pressed);
  /* A captured finger/Pencil drag owns both cursor and tablet samples.
   * Apply this to hover end too; clearing pressure mid-stroke also corrupts input. */
  if (pointer_capture.active() || current_pencil_touch ||
      [pan_gesture_recognizer pencilContactDown]) {
    return;
  }
  if (sender.state == UIGestureRecognizerStateBegan ||
      sender.state == UIGestureRecognizerStateChanged)
  {
    /* While a pencil is actually touching (an active paint/sculpt stroke),
     * handlePan drives the cursor. A stray hover CURSOR_MOVE here uses the
     * (stale) hover position and jerks the brush — notably back toward the
     * stroke start on lift (the "end->start line" / "dot at start"). So skip
     * hover entirely while the pencil is down. (Mouse box-select is unaffected:
     * current_pencil_touch is nil for a mouse drag.) */
    if (current_pencil_touch != nil) {
      return;
    }
    CGPoint hover_point = [sender getScaledTouchPoint:window];
    /* Always seed/refresh the tracked cursor position from hover. */
    mouse_cursor_x = hover_point.x;
    mouse_cursor_y = hover_point.y;
    mouse_pos_valid = true;

    bool is_pencil = (current_pencil_touch != nil);
    if (external_mouse_connected && !is_pencil) {
      /* DRAG_HYBRID: mouse present. Keep tracked position synced to hover's
       * accurate absolute coords (already done above). Only emit the cursor
       * move when NOT dragging; during a drag the button is held, hover is
       * unreliable, and mouseMovedHandler drives the cursor instead. */
      /* DRAG_HOVER_ACCURATE: emit the cursor move even while a button is
       * held. Hover gives the accurate absolute position, so this snaps the
       * cursor back each time it fires and stops delta drift from
       * accumulating over a drag (improves box-select end-point accuracy). */
      tablet_data = GHOST_TABLET_DATA_NONE;
      UserInputEvent event_info(&hover_point, nullptr, nullptr, false);
      event_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
      [self generateUserInputEvents:event_info];
      return;
    }
    /* Pencil / no-mouse path: original behaviour (stylus hover). */
    tablet_data.Active = GHOST_kTabletModeStylus;
    UserInputEvent event_info(&hover_point, nullptr, nullptr, true);
    event_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
    [self generateUserInputEvents:event_info];
  }
  else if (sender.state == UIGestureRecognizerStateEnded ||
           sender.state == UIGestureRecognizerStateCancelled ||
           sender.state == UIGestureRecognizerStateFailed)
  {
    if (!current_pencil_touch && ![pan_gesture_recognizer pencilContactDown]) {
      tablet_data = GHOST_TABLET_DATA_NONE;
    }
  }
}

- (void)handleZoom:(GHOSTUIPinchGestureRecognizer *)sender
{
  if (sender.state == UIGestureRecognizerStateBegan) {
    [self cancelPointerCapture];
  }
  /* Ignore any calls where don't have two touches to work with. */
  if ([sender numberOfTouches] < 2) {
    return;
  }

  static CGFloat g_flythrough_zoom_accum = 0.0f;

  /* Pinch/Zoom gestures */
  if (sender.state == UIGestureRecognizerStateBegan) {
    /* Set an initial distance value. */
    CGFloat point_distance = [sender getScaledDistance:window];
    [sender setCachedDistance:point_distance];
    g_flythrough_zoom_accum = 0.0f;
  }
  else if (sender.state == UIGestureRecognizerStateChanged) {

    /* Calculate change in distance since last event */
    CGFloat point_distance = [sender getScaledDistance:window];
    CGFloat relative_dist = point_distance - [sender getCachedDistance];

    /* Updated cached distance. */
    [sender setCachedDistance:point_distance];

    /* Send pinch/zoom event. */
    if (fabs(relative_dist) > 0.0) {
      /* Calculate midpoint between the two touch points. */
      CGPoint midPoint = [sender getPinchMidpoint:window];

      CGFloat dist = relative_dist;
      if (GHOST_IOS_get_flythrough_mode()) {
        /* Apply 2.0x gain with exponential moving average to eliminate touch jitter and choppiness */
        g_flythrough_zoom_accum = 0.60f * g_flythrough_zoom_accum + 0.40f * (relative_dist * 2.0f);
        dist = g_flythrough_zoom_accum;
      }
      UserInputEvent event_info(&midPoint, nullptr, &dist, false);
      event_info.direct_touch = [sender isDirectTouch];
      event_info.add_event(UserInputEvent::EventTypes::PINCH_GESTURE);
      [self generateUserInputEvents:event_info];
    }
  }
  /* Reset accumulated zoom state. */
  else if (sender.state == UIGestureRecognizerStateEnded ||
           sender.state == UIGestureRecognizerStateCancelled ||
           sender.state == UIGestureRecognizerStateFailed)
  {
    g_flythrough_zoom_accum = 0.0f;
  }
}

- (void)pencilInteractionDidTap:(UIPencilInteraction *)interaction
{
  if ([UIPencilInteraction preferredTapAction] == UIPencilPreferredActionIgnore ||
      current_pencil_touch || [pan_gesture_recognizer pencilContactDown] ||
      mouse_left_pressed || mouse_middle_pressed || mouse_right_pressed)
  {
    return;
  }
  /* Finish a finger-owned stream before a popup can take its release. */
  [self cancelPointerCapture];
  const auto ring = ghost::ios::pencil_ring_presentation(window);
  if (ring.lifetime) {
    /* This callback is the Pencil BARREL gesture. No screen double-tap route.
     * Snapshot the presented owner now; delayed delivery must never reset a
     * replacement ring or fall through into the canvas context menu. */
    const GHOST_TEventPencilRingData receipt{ring.lifetime, ring.generation,
        (ring.bounds.xmin + ring.bounds.xmax) / 2,
        (ring.bounds.ymin + ring.bounds.ymax) / 2, GHOST_kPencilRingHome, 0, 0.0f};
    system->pushEvent(new GHOST_EventPencilRing(system->getMilliSeconds(), window, receipt));
    return;
  }
  UserInputEvent event_info(nullptr, nullptr, nullptr, true);
  event_info.add_event(UserInputEvent::EventTypes::PENCIL_CONTEXT_MENU);
  [self generateUserInputEvents:event_info];
}

#if defined(__IPHONE_17_5) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_17_5
- (void)pencilInteraction:(UIPencilInteraction *)interaction
       didReceiveSqueeze:(UIPencilInteractionSqueeze *)squeeze API_AVAILABLE(ios(17.5))
{
  if (@available(iOS 17.5, *)) {
    if (squeeze.phase != UIPencilInteractionPhaseEnded ||
        [UIPencilInteraction preferredSqueezeAction] == UIPencilPreferredActionIgnore ||
        current_pencil_touch || [pan_gesture_recognizer pencilContactDown] ||
        mouse_left_pressed || mouse_middle_pressed || mouse_right_pressed)
    {
      return;
    }
    [self cancelPointerCapture];
    /* Prefer the recent Pencil position even if a connected mouse moved since.
     * A stale/missing position is handled by the viewport operator's fallback. */
    const bool recent_position = last_pencil_location_time != 0 &&
                                 system->getMilliSeconds() - last_pencil_location_time < 30000;
    UserInputEvent event_info(recent_position ? &last_pencil_location : nullptr,
                             nullptr, nullptr, true);
    if (recent_position) {
      event_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
    }
    event_info.add_event(UserInputEvent::EventTypes::PENCIL_TOOL_PALETTE);
    [self generateUserInputEvents:event_info];
  }
}
#endif

- (void)beginFrame
{
}

- (void)endFrame
{
}

- (void)initToolbar
{
  /* This gets the current view size */
  UIView *ui_view = window->getView();
  CGSize frame_size = [ui_view sizeThatFits:CGSizeMake(0.0f, 0.0f)];
  /* Create a toolbar the width of the screen. */
  toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, frame_size.width, 44)];
  toolbar.barStyle = UIBarStyleDefault;
  toolbar.translucent = true;
  /* IOS_FIXME - Despite following Apple guidelines this toolbar still
   * appears to apparently violate the view constraints. It displays fine
   * but generates a lot of warning output to the console. */
  toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
  toolbar.translatesAutoresizingMaskIntoConstraints = NO;
  [toolbar sizeToFit];

  toolbar_tip_item = [[UIBarButtonItem alloc] initWithTitle:@""
                                                      style:UIBarButtonItemStylePlain
                                                     target:nil
                                                     action:nil];

  toolbar_live_text_item = [[UIBarButtonItem alloc] initWithTitle:@""
                                                            style:UIBarButtonItemStylePlain
                                                           target:nil
                                                           action:nil];

  toolbar_done_editing_item = [[UIBarButtonItem alloc]
      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                           target:nil
                           action:@selector(handleDoneButton)];

  toolbar_cancel_editing_item = [[UIBarButtonItem alloc]
      initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                           target:nil
                           action:@selector(handleCancelButton)];

  /* Prevents editing of tip and live text fields. */
  toolbar_tip_item.enabled = NO;
  toolbar_live_text_item.enabled = NO;
  toolbar_live_text_item.tintColor = UIColor.blackColor;

  /* Set the live text to a fixed width. */
  /* IOS_FIXME - should this be set dynamically? Need to move out of init if so. */
  toolbar_live_text_item.width = 150.0f;

  toolbar.items = @[
    toolbar_tip_item,
    toolbar_live_text_item,
    toolbar_done_editing_item,
    toolbar_cancel_editing_item
  ];
}

- (void)generateKeyboardReturnEvent
{
  /*
   Only push the event back if the keyboard is active otherwise we may generate new
   spurious events.
   */
  if (onscreen_keyboard_active) {
    /*
     This event should cause ui_textedit_end() to be called which will
     hide the keyboard.
     */
    system->pushEvent(new GHOST_EventKey(GHOST_GetMilliSeconds((GHOST_SystemHandle)system),
                                         GHOST_kEventKeyDown,
                                         window,
                                         GHOST_kKeyEnter,
                                         false,
                                         nullptr));
  }
  else {
    IOS_INPUT_LOG(@"Ignoring handleKeyboardReturn %@", text_field.text);
  }
}

- (void)handleKeyboardReturn:(UITextField *)text_field
{
  @synchronized(self) {
    IOS_INPUT_LOG(@"handleKeyboardReturn %@", text_field.text);
    [self generateKeyboardReturnEvent];
  }
}

- (void)handleKeyboardEditChange:(UITextField *)text_field
{
  @synchronized(self) {

    /* Update the text in the tool bar as the edits arrive. */
    if (toolbar_live_text_item) {
      toolbar_live_text_item.title = text_field.text;
      /* Force toolbar to update */
      [toolbar setNeedsLayout];
      [toolbar layoutIfNeeded];
    }
    IOS_INPUT_LOG(@"Keyboard Edit change detected %@", text_field.text);

    /* IOS_FIXME - Enabling this will propogate text changes back into the Blender text field
     as they happen. Since pushing back individual key presses appears to be difficult this
     might be the best we can do. However this currently causes a segmentation fault if you delete
     text as the Blender-side string ends up being NULL in some cases. */
    bool push_edits_back_to_blender = false;

    if (push_edits_back_to_blender) {
      system->pushEvent(new GHOST_EventKey(GHOST_GetMilliSeconds((GHOST_SystemHandle)system),
                                           GHOST_kEventKeyDown,
                                           window,
                                           GHOST_kKeyTextEdit,
                                           false,
                                           nullptr));
    }
  }
}

- (void)handleKeyboardEditBegin:(UITextField *)text_field
{
  @synchronized(self) {
    IOS_INPUT_LOG(@"Keyboard Edit begin detected %@", text_field.text);
  }
}

- (void)handleKeyboardEditEnd:(UITextField *)text_field
{
  @synchronized(self) {
    /*
     This can get called when the keyboard is minimised
     so send a return keypress to emulate effective end
     of editing. Otherwise Blender's focus will remain
     on the text field.
     */
    IOS_INPUT_LOG(@"Keyboard Edit end detected %@", text_field.text);
    [self generateKeyboardReturnEvent];
  }
}

- (void)handleDoneButton
{
  IOS_INPUT_LOG(@"Keyboard Done button press detected %@", text_field.text);
  [self generateKeyboardReturnEvent];
}

- (void)handleCancelButton
{
  IOS_INPUT_LOG(@"Keyboard Cancel button press detected %@", text_field.text);
  /* Restore the original text and return */
  text_field.text = [NSString stringWithUTF8String:original_text.c_str()];
  [self generateKeyboardReturnEvent];
}

/*
 * Add a text field so we can handle input from a popup keyboard and
 * attach it to our root window.
 */
- (void)initUITextField
{
  /* Initialise it if we have not already done so. */
  if (!text_field) {
    text_field = [[UITextField alloc] init];

    text_field.contentScaleFactor = window->getWindowScaleFactor();

    if (toolbar_enabled) {
      [self initToolbar];
      text_field.inputAccessoryView = toolbar;
    }

    [window->rootWindow addSubview:text_field];

    /* Add a handler for when 'return' is pressed on keyboard. */
    [text_field addTarget:self
                   action:@selector(handleKeyboardReturn:)
         forControlEvents:UIControlEventEditingDidEndOnExit];

    /* Add a handler for when the text field changes. */
    [text_field addTarget:self
                   action:@selector(handleKeyboardEditChange:)
         forControlEvents:UIControlEventEditingChanged];

    /* Add a handler for when user edits a text field. */
    [text_field addTarget:self
                   action:@selector(handleKeyboardEditBegin:)
         forControlEvents:UIControlEventEditingDidBegin];

    /* Add a handler for when user finishes editing a text field. */
    [text_field addTarget:self
                   action:@selector(handleKeyboardEditEnd:)
         forControlEvents:UIControlEventEditingDidEnd];
  }
}

- (void)convertWindowCoordToDisplayCoordWithWindow:(int)windowX
                                           windowY:(int)windowY
                                          displayX:(double *)displayX
                                          displayY:(double *)displayY
                                             flipY:(BOOL)flipY
{
  float pixelScale = window->getWindowScaleFactor();
  CGSize logicalWindowSize = window->getLogicalWindowSize();

  *displayX = (double)windowX / pixelScale;
  *displayY = (double)windowY / pixelScale;

  if (flipY) {
    *displayY = logicalWindowSize.height - *displayY;
  }
}

- (UITextField *)getUITextField
{
  return text_field;
}

- (void)setupKeyboard:(const GHOST_KeyboardProperties &)keyboard_properties
{
  /* Initialise it if we have not already done so */
  if (!text_field) {
    [self initUITextField];
  }

  /* A new input session must not inherit the last software result. */
  text_field_string.clear();
  text_field_string_valid = false;

  /* Save this set of keyboard properties */
  current_keyboard_properties = keyboard_properties;

  /* Convert the text box coords to display coords */
  CGRect displayRect;
  [self convertWindowCoordToDisplayCoordWithWindow:keyboard_properties.text_box_origin[0]
                                           windowY:keyboard_properties.text_box_origin[1]
                                          displayX:&displayRect.origin.x
                                          displayY:&displayRect.origin.y
                                             flipY:true];

  [self convertWindowCoordToDisplayCoordWithWindow:keyboard_properties.text_box_size[0]
                                           windowY:keyboard_properties.text_box_size[1]
                                          displayX:&displayRect.size.width
                                          displayY:&displayRect.size.height
                                             flipY:false];

  /* Where to display the text on-screen. */
  text_field.frame = displayRect;

  /* Initialise text with existing string. */
  text_field.text = keyboard_properties.text_string ?
                        [NSString stringWithUTF8String:keyboard_properties.text_string] :
                        @"";
  /* Own the Cancel value beyond UIKit/autorelease storage. */
  original_text = keyboard_properties.text_string ? keyboard_properties.text_string : "";

  /* Set keyboard type and text alignment.
   * NOTE - the keyboard type is only honoured if using an Apple
   * pencil or if the keyboard is floating.
   * Otherwise it will just be the default full screen type. */
  switch (keyboard_properties.keyboard_type) {
    case GHOST_KeyboardProperties::ascii_keyboard_type: {
      text_field.keyboardType = UIKeyboardTypeASCIICapable;
      text_field.textAlignment = NSTextAlignmentLeft;
      break;
    }
    case GHOST_KeyboardProperties::decimal_numpad_keyboard_type: {
      text_field.keyboardType = UIKeyboardTypeDecimalPad;
      text_field.textAlignment = NSTextAlignmentCenter;
      break;
    }
    case GHOST_KeyboardProperties::numpad_keyboard_type: {
      text_field.keyboardType = UIKeyboardTypeNumberPad;
      text_field.textAlignment = NSTextAlignmentCenter;
      break;
    }
    default: {
      /* What's the sensible baviour here? Default? Assert? */
      text_field.keyboardType = UIKeyboardTypeDefault;
      text_field.textAlignment = NSTextAlignmentLeft;
    }
  }
  /* Reset keyboard type to default if not using Apple Pencil
   * or it's not floating. (Need to add floating detection.) */
  if (!last_tap_with_pencil) {
    // text_field.keyboardType = UIKeyboardTypeDefault;
  }

  /* Set light/dark mode or adopt system default. */
  text_field.keyboardAppearance = UIKeyboardAppearanceDefault;

  /* This seems sensible given Blender's typical behaviour. */
  text_field.autocorrectionType = UITextAutocorrectionTypeNo;
  text_field.spellCheckingType = UITextSpellCheckingTypeNo;

  /* Set font size. */
  float fontSize = keyboard_properties.font_size / window->getWindowScaleFactor();
  text_field.font = [UIFont systemFontOfSize:fontSize];

  /* Set font color. */
  text_field.textColor = [UIColor colorWithRed:keyboard_properties.font_color[0]
                                         green:keyboard_properties.font_color[1]
                                          blue:keyboard_properties.font_color[2]
                                         alpha:keyboard_properties.font_color[3]];

  /* Initial highlighting and text-cursor position. */
  switch (keyboard_properties.inital_text_state) {
    case GHOST_KeyboardProperties::select_all_text: {
      [text_field selectAll:nil];
      break;
    }
    case GHOST_KeyboardProperties::select_text_range: {
      UITextPosition *startPosition = [text_field
          positionFromPosition:text_field.beginningOfDocument
                        offset:keyboard_properties.text_select_range[0]];
      UITextPosition *endPosition = [text_field
          positionFromPosition:text_field.beginningOfDocument
                        offset:keyboard_properties.text_select_range[1]];
      text_field.selectedTextRange = [text_field textRangeFromPosition:startPosition
                                                            toPosition:endPosition];
      break;
    }
    case GHOST_KeyboardProperties::move_cursor_to_start: {
      UITextPosition *beginning = text_field.beginningOfDocument;
      text_field.selectedTextRange = [text_field textRangeFromPosition:beginning
                                                            toPosition:beginning];
      break;
    }
    case GHOST_KeyboardProperties::move_cursor_to_end: {
      UITextPosition *end = text_field.endOfDocument;
      text_field.selectedTextRange = [text_field textRangeFromPosition:end toPosition:end];
      break;
    }
    default: {
      GHOST_ASSERT(FALSE, "GHOST_SystemIOS::setupTextField unsupported text select option");
    }
  }

  /* Setup the tool bar if it's enabled. */
  if (toolbar_enabled) {
    toolbar_live_text_item.title = text_field.text;
    toolbar_tip_item.title = keyboard_properties.tip_text ?
                                 [NSString stringWithCString:keyboard_properties.tip_text
                                                    encoding:NSUTF8StringEncoding] :
                                 @"";
  }
}

/* Convert an iOS GCKeyCode (USB HID usage) to a Blender GHOST_TKey.
 * Added for external keyboard shortcut support. */
/* Map a GHOST key (+ shift) to its typed UTF-8 character for printable keys.
 * Needed so numeric input in transforms (G/S/R then a number), text fields and
 * search boxes receive the character — GHOST carries it in GHOST_EventKey's
 * utf8_buf, which we previously left null. Fills out[6] (NUL-terminated) and
 * returns true when the key produces text; returns false for non-text keys. */
static bool ghost_key_to_utf8(GHOST_TKey key, bool shift, char out[6])
{
  out[0] = '\0';
  out[1] = '\0';
  /* Letters: GHOST_kKeyA..Z hold 'A'..'Z'; lower-case unless Shift held. */
  if (key >= GHOST_kKeyA && key <= GHOST_kKeyZ) {
    out[0] = shift ? (char)key : (char)(key + 0x20);
    return true;
  }
  /* Number row: GHOST_kKey0..9 hold '0'..'9'; Shift -> US-layout symbols. */
  if (key >= GHOST_kKey0 && key <= GHOST_kKey9) {
    static const char shifted[10] = {')', '!', '@', '#', '$', '%', '^', '&', '*', '('};
    out[0] = shift ? shifted[key - GHOST_kKey0] : (char)key;
    return true;
  }
  /* Numpad digits. */
  if (key >= GHOST_kKeyNumpad0 && key <= GHOST_kKeyNumpad9) {
    out[0] = (char)('0' + (key - GHOST_kKeyNumpad0));
    return true;
  }
  switch (key) {
    case GHOST_kKeyPeriod:         out[0] = shift ? '>' : '.'; return true;
    case GHOST_kKeyComma:          out[0] = shift ? '<' : ','; return true;
    case GHOST_kKeyMinus:          out[0] = shift ? '_' : '-'; return true;
    case GHOST_kKeyPlus:           out[0] = '+'; return true;
    case GHOST_kKeyEqual:          out[0] = shift ? '+' : '='; return true;
    case GHOST_kKeySlash:          out[0] = shift ? '?' : '/'; return true;
    case GHOST_kKeySemicolon:      out[0] = shift ? ':' : ';'; return true;
    case GHOST_kKeyQuote:          out[0] = shift ? '"' : '\''; return true;
    case GHOST_kKeyLeftBracket:    out[0] = shift ? '{' : '['; return true;
    case GHOST_kKeyRightBracket:   out[0] = shift ? '}' : ']'; return true;
    case GHOST_kKeyBackslash:      out[0] = shift ? '|' : '\\'; return true;
    case GHOST_kKeyAccentGrave:    out[0] = shift ? '~' : '`'; return true;
    case GHOST_kKeySpace:          out[0] = ' '; return true;
    case GHOST_kKeyNumpadPeriod:   out[0] = '.'; return true;
    case GHOST_kKeyNumpadPlus:     out[0] = '+'; return true;
    case GHOST_kKeyNumpadMinus:    out[0] = '-'; return true;
    case GHOST_kKeyNumpadAsterisk: out[0] = '*'; return true;
    case GHOST_kKeyNumpadSlash:    out[0] = '/'; return true;
    default: return false;
  }
}

static GHOST_TKey ghost_key_from_gckeycode(GCKeyCode code)
{
  if (code >= GCKeyCodeKeyA && code <= GCKeyCodeKeyZ) {
    return (GHOST_TKey)(GHOST_kKeyA + (code - GCKeyCodeKeyA));
  }
  if (code >= GCKeyCodeOne && code <= GCKeyCodeNine) {
    return (GHOST_TKey)(GHOST_kKey1 + (code - GCKeyCodeOne));
  }
  if (code == GCKeyCodeZero) return GHOST_kKey0;
  if (code == GCKeyCodeSpacebar)          return GHOST_kKeySpace;
  if (code == GCKeyCodeReturnOrEnter)     return GHOST_kKeyEnter;
  if (code == GCKeyCodeEscape)            return GHOST_kKeyEsc;
  if (code == GCKeyCodeTab)               return GHOST_kKeyTab;
  if (code == GCKeyCodeDeleteOrBackspace) return GHOST_kKeyBackSpace;
  if (code == GCKeyCodeDeleteForward)     return GHOST_kKeyDelete;
  if (code == GCKeyCodeLeftArrow)         return GHOST_kKeyLeftArrow;
  if (code == GCKeyCodeRightArrow)        return GHOST_kKeyRightArrow;
  if (code == GCKeyCodeUpArrow)           return GHOST_kKeyUpArrow;
  if (code == GCKeyCodeDownArrow)         return GHOST_kKeyDownArrow;
  if (code == GCKeyCodeLeftShift)         return GHOST_kKeyLeftShift;
  if (code == GCKeyCodeRightShift)        return GHOST_kKeyRightShift;
  if (code == GCKeyCodeLeftControl)       return GHOST_kKeyLeftControl;
  if (code == GCKeyCodeRightControl)      return GHOST_kKeyRightControl;
  if (code == GCKeyCodeLeftAlt)           return GHOST_kKeyLeftAlt;
  if (code == GCKeyCodeRightAlt)          return GHOST_kKeyRightAlt;
  if (code == GCKeyCodeLeftGUI)           return GHOST_kKeyLeftOS;
  if (code == GCKeyCodeRightGUI)          return GHOST_kKeyRightOS;
  if (code == GCKeyCodeHyphen)            return GHOST_kKeyMinus;
  if (code == GCKeyCodeEqualSign)         return GHOST_kKeyEqual;
  if (code == GCKeyCodeComma)             return GHOST_kKeyComma;
  if (code == GCKeyCodePeriod)            return GHOST_kKeyPeriod;
  if (code == GCKeyCodeSlash)             return GHOST_kKeySlash;
  if (code == GCKeyCodeSemicolon)         return GHOST_kKeySemicolon;
  if (code == GCKeyCodeQuote)             return GHOST_kKeyQuote;
  if (code == GCKeyCodeBackslash)         return GHOST_kKeyBackslash;
  if (code == GCKeyCodeOpenBracket)       return GHOST_kKeyLeftBracket;
  if (code == GCKeyCodeCloseBracket)      return GHOST_kKeyRightBracket;
  if (code == GCKeyCodeGraveAccentAndTilde) return GHOST_kKeyAccentGrave;
  if (code == GCKeyCodeF1)  return GHOST_kKeyF1;
  if (code == GCKeyCodeF2)  return GHOST_kKeyF2;
  if (code == GCKeyCodeF3)  return GHOST_kKeyF3;
  if (code == GCKeyCodeF4)  return GHOST_kKeyF4;
  if (code == GCKeyCodeF5)  return GHOST_kKeyF5;
  if (code == GCKeyCodeF6)  return GHOST_kKeyF6;
  if (code == GCKeyCodeF7)  return GHOST_kKeyF7;
  if (code == GCKeyCodeF8)  return GHOST_kKeyF8;
  if (code == GCKeyCodeF9)  return GHOST_kKeyF9;
  if (code == GCKeyCodeF10) return GHOST_kKeyF10;
  if (code == GCKeyCodeF11) return GHOST_kKeyF11;
  if (code == GCKeyCodeF12) return GHOST_kKeyF12;
  return GHOST_kKeyUnknown;
}


- (void)externalMouseChange:(NSNotification *)notification
{
  GCMouse *mouse = [GCMouse current];
  external_mouse_connected = (mouse != nil);
  IOS_INPUT_LOG(@"External Mouse %s", external_mouse_connected ? "Connected" : "Disconnected");

  if (mouse && mouse.mouseInput) {
    GHOST_SystemIOS *sys = system;
    GCMouseInput *mouse_input = mouse.mouseInput;
    IOS_INPUT_LOG(@"Mouse handlers registering. scroll=%@ yAxis=%@",
                  mouse_input.scroll, mouse_input.scroll.yAxis);

    mouse_input.leftButton.pressedChangedHandler =
        ^(GCControllerButtonInput *button, float value, BOOL pressed) {
          /* A button-down can open another window before button-up arrives.
           * Release its live originating view, not the newly active view. */
          if (!pressed) {
            for (GHOST_IWindow *candidate : sys->getWindowManager()->getWindows()) {
              GHOSTUIWindow *owner = (GHOSTUIWindow *)
                  static_cast<GHOST_WindowIOS *>(candidate)->getView().window;
              if (owner && owner->mouse_left_pressed) {
                owner->mouse_left_pressed = false;
                sys->pushEvent(new GHOST_EventButton(
                    sys->getMilliSeconds(), GHOST_kEventButtonUp, candidate,
                    GHOST_kButtonMaskLeft, GHOST_TABLET_DATA_NONE));
              }
            }
            return;
          }
          GHOSTUIWindow *strong_self = ios_active_input_window(sys);
          if (!strong_self || strong_self->native_chrome_hovered) {
            return;
          }
          [strong_self cancelPointerCapture];
          if (strong_self) {
            strong_self->mouse_left_pressed = pressed ? true : false;
          }
          GHOST_IWindow *active_win_l = sys->getWindowManager()->getActiveWindow();
          if (!active_win_l) { return; }
          sys->pushEvent(new GHOST_EventButton(
              GHOST_GetMilliSeconds((GHOST_SystemHandle)sys),
              pressed ? GHOST_kEventButtonDown : GHOST_kEventButtonUp,
              active_win_l, GHOST_kButtonMaskLeft, GHOST_TABLET_DATA_NONE));
        };

    mouse_input.rightButton.pressedChangedHandler =
        ^(GCControllerButtonInput *button, float value, BOOL pressed) {
          /* A button-down can open another window before button-up arrives.
           * Release its live originating view, not the newly active view. */
          if (!pressed) {
            for (GHOST_IWindow *candidate : sys->getWindowManager()->getWindows()) {
              GHOSTUIWindow *owner = (GHOSTUIWindow *)
                  static_cast<GHOST_WindowIOS *>(candidate)->getView().window;
              if (owner && owner->mouse_right_pressed) {
                owner->mouse_right_pressed = false;
                sys->pushEvent(new GHOST_EventButton(
                    sys->getMilliSeconds(), GHOST_kEventButtonUp, candidate,
                    GHOST_kButtonMaskRight, GHOST_TABLET_DATA_NONE));
              }
            }
            return;
          }
          GHOSTUIWindow *ss = ios_active_input_window(sys);
          if (!ss || ss->native_chrome_hovered) {
            return;
          }
          [ss cancelPointerCapture];
          if (ss) { ss->mouse_right_pressed = pressed ? true : false; }
          GHOST_IWindow *active_win_r = sys->getWindowManager()->getActiveWindow();
          if (!active_win_r) { return; }
          sys->pushEvent(new GHOST_EventButton(
              GHOST_GetMilliSeconds((GHOST_SystemHandle)sys),
              pressed ? GHOST_kEventButtonDown : GHOST_kEventButtonUp,
              active_win_r, GHOST_kButtonMaskRight, GHOST_TABLET_DATA_NONE));
        };

    mouse_input.middleButton.pressedChangedHandler =
        ^(GCControllerButtonInput *button, float value, BOOL pressed) {
          /* A button-down can open another window before button-up arrives.
           * Release its live originating view, not the newly active view. */
          if (!pressed) {
            for (GHOST_IWindow *candidate : sys->getWindowManager()->getWindows()) {
              GHOSTUIWindow *owner = (GHOSTUIWindow *)
                  static_cast<GHOST_WindowIOS *>(candidate)->getView().window;
              if (owner && owner->mouse_middle_pressed) {
                owner->mouse_middle_pressed = false;
                sys->pushEvent(new GHOST_EventButton(
                    sys->getMilliSeconds(), GHOST_kEventButtonUp, candidate,
                    GHOST_kButtonMaskMiddle, GHOST_TABLET_DATA_NONE));
              }
            }
            return;
          }
          GHOSTUIWindow *ss = ios_active_input_window(sys);
          if (!ss || ss->native_chrome_hovered) {
            return;
          }
          [ss cancelPointerCapture];
          if (ss) { ss->mouse_middle_pressed = pressed ? true : false; }
          IOS_INPUT_LOG(@"MIDDLE button pressed=%d", pressed);
          GHOST_IWindow *active_win_m = sys->getWindowManager()->getActiveWindow();
          if (!active_win_m) { return; }
          sys->pushEvent(new GHOST_EventButton(
              GHOST_GetMilliSeconds((GHOST_SystemHandle)sys),
              pressed ? GHOST_kEventButtonDown : GHOST_kEventButtonUp,
              active_win_m, GHOST_kButtonMaskMiddle, GHOST_TABLET_DATA_NONE));
        };

    /* Mouse movement via GCMouse: deltas accumulated into a tracked cursor
     * position so movement shares the mouse path with clicks (enables drag). */
    mouse_input.mouseMovedHandler =
        ^(GCMouseInput *m, float dx, float dy) {
          GHOSTUIWindow *s = ios_active_input_window(sys);
          if (!s) {
            return;
          }
          GHOST_WindowIOS *win = s->window;
          /* DRAG_HYBRID: only drive the cursor from deltas while dragging
           * (button held), starting from the hover-synced position. */
          bool mouse_any_pressed = s->mouse_left_pressed ||
                                   s->mouse_middle_pressed ||
                                   s->mouse_right_pressed;
          IOS_INPUT_LOG(@"MOUSEMOVED L=%d M=%d R=%d dx=%f dy=%f", s->mouse_left_pressed, s->mouse_middle_pressed, s->mouse_right_pressed, dx, dy);
          if (!mouse_any_pressed) {
            return;
          }

          /* MMB_ORBIT_NATIVE (fallback): middle-button drag -> trackpad scroll
           * (numFingers=2, isDirectionInverted=true) = the two-finger pan path the
           * iPad build uses to orbit. This runs only until the indirect-pointer
           * recognizer engages; once it does, handleIndirectPan drives orbit/pan
           * from the accurate absolute delta (no drift). Uses raw GCMouse deltas,
           * so it only covers the brief pre-recognition slop at drag start. */
          if (s->mouse_middle_pressed && !s->indirect_pointer_dragging && !s->shift_pressed) {
            const float oscale = (float)win->getWindowScaleFactor();
            const float pk = s->shift_pressed ? MMB_PAN_SCALE : 1.0f;
            sys->pushEvent(new GHOST_EventTrackpad(
                GHOST_GetMilliSeconds((GHOST_SystemHandle)sys),
                win, GHOST_kTrackpadEventScroll,
                (int32_t)s->mouse_cursor_x, (int32_t)s->mouse_cursor_y,
                (int32_t)(dx * oscale * pk), (int32_t)(-dy * oscale * pk),
                true, 2));
            return;
          }
          /* If the indirect-pointer recognizer is driving this (left-button)
           * drag, it supplies accurate absolute positions; skip the lossy delta
           * integration so the two paths don't fight (box-select accuracy). */
          if (s->indirect_pointer_dragging) {
            return;
          }

          const float scale = (float)win->getWindowScaleFactor();
          s->mouse_cursor_x += dx * scale;
          s->mouse_cursor_y -= dy * scale;

          GHOST_Rect b;
          win->getClientBounds(b);
          float maxx = (float)b.getWidth();
          float maxy = (float)b.getHeight();
          if (s->mouse_cursor_x < 0) s->mouse_cursor_x = 0;
          if (s->mouse_cursor_y < 0) s->mouse_cursor_y = 0;
          if (s->mouse_cursor_x > maxx) s->mouse_cursor_x = maxx;
          if (s->mouse_cursor_y > maxy) s->mouse_cursor_y = maxy;

          sys->pushEvent(new GHOST_EventCursor(
              GHOST_GetMilliSeconds((GHOST_SystemHandle)sys),
              GHOST_kEventCursorMove, win,
              (int32_t)s->mouse_cursor_x, (int32_t)s->mouse_cursor_y,
              GHOST_TABLET_DATA_NONE));
        };

    /* Mouse wheel / scroll. */
    mouse_input.scroll.yAxis.valueChangedHandler =
        ^(GCControllerAxisInput *axis, float value) {
          IOS_INPUT_LOG(@"Scroll Y handler fired, value=%f", value);
          if (value == 0.0f) {
            return;
          }
          GHOSTUIWindow *active = ios_active_input_window(sys);
          if (!active || active->native_chrome_hovered) { return; }
          GHOST_WindowIOS *win = active->window;
          int delta = (value > 0.0f) ? 1 : -1;
          IOS_INPUT_LOG(@"Scroll Y pushing wheel event, delta=%d", delta);
          sys->pushEvent(new GHOST_EventWheel(
              GHOST_GetMilliSeconds((GHOST_SystemHandle)sys),
              win, GHOST_kEventWheelAxisVertical, delta));
        };
  }
}

- (void)externalKeyboardChange:(NSNotification *)notification
{
  external_keyboard_connected = [GCKeyboard coalescedKeyboard] != nil;
  if (!external_keyboard_connected) {
    ios_escape_closes_window = false;
    shift_pressed = false;
  }
  IOS_INPUT_LOG(@"External Keyboard %s",
                external_keyboard_connected ? "Connected" : "Disconnected");

  if (external_keyboard_connected) {
    GCKeyboard *kb = [GCKeyboard coalescedKeyboard];
    /* Activation can happen with Shift already held in another view. */
    shift_pressed = [[kb.keyboardInput buttonForKeyCode:GCKeyCodeLeftShift] isPressed] ||
                    [[kb.keyboardInput buttonForKeyCode:GCKeyCodeRightShift] isPressed];
    IOS_INPUT_LOG(@"KEYBOARD HANDLER REGISTERING kb=%@", kb);
    GHOST_SystemIOS *sys = system;

    kb.keyboardInput.keyChangedHandler =
        ^(GCKeyboardInput *keyboard, GCControllerButtonInput *key,
          GCKeyCode keyCode, BOOL pressed) {
          GHOST_TKey ghost_key = ghost_key_from_gckeycode(keyCode);
          IOS_INPUT_LOG(@"KEY gccode=%ld ghost=%d pressed=%d", (long)keyCode, (int)ghost_key, pressed);
          if (ghost_key == GHOST_kKeyLeftShift || ghost_key == GHOST_kKeyRightShift) {
            GHOSTUIWindow *sk = ios_active_input_window(sys);
            if (sk) {
              sk->shift_pressed = [[keyboard buttonForKeyCode:GCKeyCodeLeftShift] isPressed] ||
                                  [[keyboard buttonForKeyCode:GCKeyCodeRightShift] isPressed];
            }
          }
          /* Consume the complete closing key sequence, including repeat and release.
           * Otherwise a held Escape can close several views or leak into the workspace. */
          if (ghost_key == GHOST_kKeyEsc) {
            if (ios_escape_closes_window) {
              ios_escape_closes_window = pressed;
              return;
            }
            GHOST_IWindow *active = sys->getWindowManager()->getActiveWindow();
            if (pressed && ios_can_close_window(sys, active)) {
              ios_escape_closes_window = true;
              sys->pushEvent(new GHOST_Event(sys->getMilliSeconds(), GHOST_kEventWindowClose, active));
              return;
            }
          }
          if (ghost_key == GHOST_kKeyUnknown) {
            return;
          }
          /* Provide the typed character for printable keys (press events only) so
           * transform numeric input (G/S/R + number), text fields and search work.
           * Was always null before, which silently dropped typed characters. */
          char key_utf8[6] = {0};
          const char *key_utf8_ptr = nullptr;
          if (pressed) {
            GHOSTUIWindow *su = ios_active_input_window(sys);
            bool shift_held = su ? su->shift_pressed : false;
            if (ghost_key_to_utf8(ghost_key, shift_held, key_utf8)) {
              key_utf8_ptr = key_utf8;
            }
          }
          /* ACTIVE_WINDOW_INPUT: target the active window so popups get keys. */
          GHOST_IWindow *active_win = sys->getWindowManager()->getActiveWindow();
          if (!active_win) { return; }
          /* Invalidate acquisition before enqueue: a new physical touch can
           * arrive before native WM processes this modifier transition. */
          ghost::ios::finger_paint_regions.clear();
          sys->pushEvent(new GHOST_EventKey(
              GHOST_GetMilliSeconds((GHOST_SystemHandle)sys),
              pressed ? GHOST_kEventKeyDown : GHOST_kEventKeyUp,
              active_win,
              ghost_key,
              false,
              key_utf8_ptr));
        };
  }
  else {
    GCKeyboard *kb = [GCKeyboard coalescedKeyboard];
    if (kb) {
      kb.keyboardInput.keyChangedHandler = nil;
    }
  }
}

/* IOS_FIXME - Not currently used, could be removed. */
- (void)keyboardWillChange:(NSNotification *)notification
{

  CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
  /* Sometimes we see a zero value for the end-frame value, possibly because... timing? */
  if (keyboardRect.size.width == 0 || keyboardRect.size.height == 0) {
    keyboardRect = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
  }
}

- (const GHOST_TabletData)getTabletData
{
  return tablet_data;
}

- (GHOST_TSuccess)popupOnscreenKeyboard:(const GHOST_KeyboardProperties &)keyboard_properties
{
  @synchronized(self) {
    IOS_INPUT_LOG(@"Keyboard popup request received %@", text_field.text);
    [self setupKeyboard:keyboard_properties];

    if (!onscreen_keyboard_active) {
      text_field.userInteractionEnabled = YES;
      if (![text_field becomeFirstResponder]) {
        text_field.userInteractionEnabled = NO;
        text_field.text = nil;
        GHOST_ASSERT(FALSE, "GHOST_SystemIOS::popupOnScreenKeyboard Failed to display keyboard");
        return GHOST_kFailure;
      }
      onscreen_keyboard_active = true;
    }
  }
  return GHOST_kSuccess;
}

- (GHOST_TSuccess)hideOnscreenKeyboard
{
  /* Lock access around keyboard handling events. */
  @synchronized(self) {
    IOS_INPUT_LOG(@"Keyboard hide request received %@", text_field.text);

    if (onscreen_keyboard_active) {
      /*
       This must come first so that any of the keyboard event handlers that get
       triggered in response to shutting down the keyboard don't do anything
       (like generating events back to Blender)
       */
      onscreen_keyboard_active = false;

      /* Copy the final bytes while UIKit still owns the text, including valid empty input. */
      const char *input = [[text_field text] UTF8String];
      text_field_string_valid = input != nullptr;
      text_field_string = input ? input : "";

      /* Shut down the keyboard. */
      [text_field resignFirstResponder];
      /*
       IOS_FIXME - Note: This may cause the console to display the warning message:
       "-[UIApplication _touchesEvent] will no longer work as expected. Please stop using it."
       But since this is being generated by Apple OS code there's nothing obvious to fix it right
       now.
       */

      IOS_INPUT_LOG(@"Resigned keyboard responder");
      /*
       This is required to disable any subsequent interactions with the text field that could
       potentially bypass Blender's input handling (since the UITextField is now live
       on the view)
       */
      text_field.userInteractionEnabled = NO;

      /* Delete the text field copy of the string */
      text_field.text = nil;
    }
  }
  IOS_INPUT_LOG(@"Text field value was %s",
                text_field_string_valid ? text_field_string.c_str() : "(no software input)");
  return GHOST_kSuccess;
}

- (const char *)getLastKeyboardString
{
  /* Lock access around keyboard handling events */
  @synchronized(self) {

    /* Empty text is a valid edit; nullptr means there is no software result. */
    if (text_field.text) {
      const char *input = [[text_field text] UTF8String];
      text_field_string_valid = input != nullptr;
      text_field_string = input ? input : "";
    }
    return text_field_string_valid ? text_field_string.c_str() : nullptr;
  }
}

@end

@interface GHOST_IOSViewController : UIViewController

- (nonnull instancetype)initWithMetalKitView:(nonnull MTKView *)mtkView
                                  secondary:(BOOL)secondary;
- (void)closeSecondaryView:(id)sender;
- (void)nativeChromeHover:(UIHoverGestureRecognizer *)sender;
- (void)updateSecondaryViewControls;
- (void)initializeMetalRenderer;

@end

@implementation GHOST_IOSViewController
{
  MTKView *_view;
  GHOST_IOSMetalRenderer *_renderer;
  UIView *_return_bar;
  UILabel *_window_label;
}

- (nonnull instancetype)initWithMetalKitView:(nonnull MTKView *)mtkView
                                  secondary:(BOOL)secondary
{
  self = [super init];
  if (self) {
    _view = mtkView;
    _view.multipleTouchEnabled = YES;
    if (secondary) {
      /* Keep content at (0, 0): all existing GHOST input remains content-local.
       * Reserve a native footer instead of covering Blender's editor controls. */
      UIView *container = [[UIView alloc] initWithFrame:mtkView.frame];
      [container addSubview:mtkView];
      _return_bar = [[UIView alloc] init];
      _return_bar.backgroundColor = [UIColor secondarySystemBackgroundColor];
      [container addSubview:_return_bar];
      [_return_bar release]; /* Owned by container. */
      UIHoverGestureRecognizer *chrome_hover = [[UIHoverGestureRecognizer alloc]
          initWithTarget:self action:@selector(nativeChromeHover:)];
      chrome_hover.allowedTouchTypes = @[ @(UITouchTypeIndirectPointer) ];
      [_return_bar addGestureRecognizer:chrome_hover];
      [chrome_hover release];

      UIButton *close = [UIButton buttonWithType:UIButtonTypeSystem];
      [close setTitle:NSLocalizedString(@"Close View", nil) forState:UIControlStateNormal];
      close.titleLabel.font = [UIFont boldSystemFontOfSize:17];
      close.accessibilityHint = NSLocalizedString(@"Close this view and return to Blender", nil);
      close.accessibilityIdentifier = @"blender.close-secondary-view";
      [close addTarget:self action:@selector(closeSecondaryView:)
           forControlEvents:UIControlEventTouchUpInside];
      close.translatesAutoresizingMaskIntoConstraints = NO;
      [_return_bar addSubview:close];

      _window_label = [[UILabel alloc] init];
      _window_label.font = [UIFont systemFontOfSize:15];
      _window_label.textColor = [UIColor secondaryLabelColor];
      _window_label.translatesAutoresizingMaskIntoConstraints = NO;
      [_window_label setContentCompressionResistancePriority:UILayoutPriorityDefaultLow
                                                    forAxis:UILayoutConstraintAxisHorizontal];
      [_return_bar addSubview:_window_label];
      [_window_label release];
      [NSLayoutConstraint activateConstraints:@[
        [close.trailingAnchor constraintEqualToAnchor:_return_bar.safeAreaLayoutGuide.trailingAnchor constant:-12],
        [close.topAnchor constraintEqualToAnchor:_return_bar.topAnchor constant:4],
        [close.heightAnchor constraintEqualToConstant:48],
        [close.widthAnchor constraintGreaterThanOrEqualToConstant:120],
        [_window_label.leadingAnchor constraintEqualToAnchor:_return_bar.safeAreaLayoutGuide.leadingAnchor constant:16],
        [_window_label.trailingAnchor constraintLessThanOrEqualToAnchor:close.leadingAnchor constant:-12],
        [_window_label.centerYAnchor constraintEqualToAnchor:close.centerYAnchor],
      ]];
      self.view = container;
      [container release];
    }
    else {
      self.view = mtkView;
    }
  }
  return self;
}

- (void)viewDidLayoutSubviews
{
  [super viewDidLayoutSubviews];
  if (_return_bar) {
    const CGRect bounds = self.view.bounds;
    const CGFloat footer = _return_bar.hidden ? 0 :
        MIN(bounds.size.height, 56 + self.view.safeAreaInsets.bottom);
    const CGRect content_frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height - footer);
    const CGRect footer_frame = CGRectMake(0, bounds.size.height - footer, bounds.size.width, footer);
    /* Touch/highlight changes can trigger layout without changing the geometry.
     * Do not ask MTKView to resize its drawable again in that case. */
    if (!CGRectEqualToRect(_view.frame, content_frame)) {
      _view.frame = content_frame;
    }
    if (!CGRectEqualToRect(_return_bar.frame, footer_frame)) {
      _return_bar.frame = footer_frame;
    }
  }
}

- (void)setTitle:(NSString *)title
{
  [super setTitle:title];
  _window_label.text = title;
}

- (void)nativeChromeHover:(UIHoverGestureRecognizer *)sender
{
  /* GameController also sees native button clicks. Do not forward their button
   * downs or wheel events to the last Blender cursor location underneath. */
  GHOSTUIWindow *native_window = (GHOSTUIWindow *)self.view.window;
  [native_window setNativeChromeHovered:
      sender.state == UIGestureRecognizerStateBegan ||
      sender.state == UIGestureRecognizerStateChanged];
}

- (void)updateSecondaryViewControls
{
  if (!_return_bar) {
    return;
  }
  GHOST_SystemIOS *system = static_cast<GHOST_SystemIOS *>(GHOST_ISystem::getSystem());
  for (GHOST_IWindow *candidate : system->getWindowManager()->getWindows()) {
    if (static_cast<GHOST_WindowIOS *>(candidate)->getView() == _view) {
      /* If the original workspace was deliberately closed, the first surviving
       * window becomes the workspace: don't leave an inert Close View button. */
      _return_bar.hidden = !ios_can_close_window(system, candidate);
      [self.view setNeedsLayout];
      [self.view layoutIfNeeded];
      break;
    }
  }
}

- (void)closeSecondaryView:(id)sender
{
  GHOST_SystemIOS *system = static_cast<GHOST_SystemIOS *>(GHOST_ISystem::getSystem());
  /* Resolve from the live window list; never retain a raw C++ window in a UIKit
   * action that can outlive its owner. Route through Blender for job/selector cleanup. */
  for (GHOST_IWindow *candidate : system->getWindowManager()->getWindows()) {
    GHOST_WindowIOS *window = static_cast<GHOST_WindowIOS *>(candidate);
    if (window->getView() == _view && ios_can_close_window(system, window)) {
      system->pushEvent(new GHOST_Event(system->getMilliSeconds(), GHOST_kEventWindowClose, window));
      return;
    }
  }
}

- (void)dealloc
{
  _view.delegate = nil;
  [_renderer release];
  [super dealloc];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self initializeMetalRenderer];
}

- (UIRectEdge)preferredScreenEdgesDeferringSystemGestures
{
  return UIRectEdgeAll;
}

- (void)initializeMetalRenderer
{
  /* The view is assigned in init, so loadViewIfNeeded is not an initialization
   * guarantee. This delegate drives Blender's main loop, not just its drawing.
   * Explicit setup is required; tolerate a later UIKit viewDidLoad callback. */
  if (_renderer) {
    return;
  }
  _view.enableSetNeedsDisplay = NO;
  _view.device = MTLCreateSystemDefaultDevice();
  _view.clearColor = MTLClearColorMake(0, 0, 0, 1.0);
  _view.paused = NO;
  _view.colorPixelFormat = MTLPixelFormatBGRA8Unorm;
  _view.autoResizeDrawable = YES;
  _view.contentMode = UIViewContentModeScaleToFill;
  _view.contentScaleFactor = [[UIScreen mainScreen] scale];
  /* Set the refresh rate to the screen's maximum. There may be some value in capping
   * this value to preserve battery life (60fps seems to work well). */
  _view.preferredFramesPerSecond = [UIScreen mainScreen].maximumFramesPerSecond;
  _renderer = [[GHOST_IOSMetalRenderer alloc] initWithMetalKitView:_view];
  if (!_renderer) {
    NSLog(@"Renderer initialization failed");
    return;
  }

  [_renderer mtkView:_view drawableSizeWillChange:_view.drawableSize];

  _view.delegate = _renderer;
}

- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  /* Make the Home Indicator (the bottom-center white navigation bar) auto-hide when possible. */
  return YES;
}

@end

GHOST_WindowIOS::GHOST_WindowIOS(GHOST_SystemIOS *system_ios,
                                 const char *title,
                                 int32_t left,
                                 int32_t bottom,
                                 uint32_t width,
                                 uint32_t height,
                                 GHOST_TWindowState state,
                                 GHOST_TDrawingContextType type,
                                 const GHOST_ContextParams &context_params,
                                 bool is_dialog,
                                 GHOST_WindowIOS *parent_window)
    : GHOST_Window(width, height, state, context_params, false), metal_view_(nil)
{
  full_screen_ = false;
  is_dialog_ = is_dialog;
  system_ios_ = system_ios;
  /* Parent window will be the window that focus is returned to upon close. */
  parent_window_ = parent_window;
  window_title_ = nullptr;

  /* Create MTKView. */
  metal_view_ = [[MTKView alloc] initWithFrame:CGRectMake(left, bottom, width, height)];
  GHOST_ASSERT(metal_view_, "metalview not valid");

  /* Create view controller. */
  UIApplication *app = [UIApplication sharedApplication];
  GHOST_ASSERT(app, "App not valid");
  id<UIApplicationDelegate> app_delegate = [app delegate];
  GHOST_ASSERT(app_delegate, "App not valid");

  GHOSTUIWindow *ghost_rootWindow = nullptr;

  if (full_screen_) {
    /* Init window at native res. */
    ghost_rootWindow = [[GHOSTUIWindow alloc] init];
    /* Ensure fullscreen. */
    CGRect rect = [UIScreen mainScreen].bounds;
    rootWindow.frame = rect;
  }
  else {
    /* Init window at specified size. */
    ghost_rootWindow = [[GHOSTUIWindow alloc]
        initWithFrame:CGRectMake(left, bottom, width, height)];
    [ghost_rootWindow setClipsToBounds:YES];
  }

  rootWindow = (UIWindow *)ghost_rootWindow;

  [ghost_rootWindow setSystemAndWindowIOS:system_ios_ windowIOS:this];
  rootWindow.windowLevel = UIWindowLevelAlert;

  GHOST_ASSERT(rootWindow, "UIWindow not valid");
  const bool secondary = !system_ios_->getWindowManager()->getWindows().empty();
  uiview_controller_ = [[GHOST_IOSViewController alloc] initWithMetalKitView:metal_view_
                                                                secondary:secondary];
  [uiview_controller_ loadViewIfNeeded];
  [(GHOST_IOSViewController *)uiview_controller_ initializeMetalRenderer];
  GHOST_ASSERT(metal_view_.delegate != nil, "Metal main-loop delegate not initialized");
  GHOST_ASSERT(uiview_controller_, "UIViewController not valid");

  /* Set presentation style depending on whether main window, dialog or temporary window. */
  if (full_screen_) {
    /* Initial window has no parent and is always fullscreen. */
    uiview_controller_.modalPresentationStyle = UIModalPresentationFullScreen;
  }
  else {
    /* Initial window has no parent and is always fullscreen. */
    uiview_controller_.modalPresentationStyle = UIModalPresentationPageSheet;
  }
  rootWindow.rootViewController = uiview_controller_;
  [uiview_controller_.view setNeedsLayout];
  [uiview_controller_.view layoutIfNeeded];

  /* Create UIView */
  GHOST_ASSERT(width > 0 && height > 0, "invalid wh");
  /* GHOST/Metal and all gesture recognizers use only the content, not native chrome. */
  uiview_ = metal_view_;
  [uiview_ retain];
  GHOST_ASSERT(uiview_, "uiview not valid");

  /* Initialize Metal device. */
  metal_view_.device = MTLCreateSystemDefaultDevice();

  /* Enable HDR/EDR Support. */
  CAMetalLayer *metalLayer = (CAMetalLayer *)metal_view_.layer;
  metalLayer.wantsExtendedDynamicRangeContent = YES;
  metalLayer.pixelFormat = MTLPixelFormatRGBA16Float;
  CGColorSpaceRef colorspace = CGColorSpaceCreateWithName(kCGColorSpaceExtendedSRGB);
  metalLayer.colorspace = colorspace;
  CGColorSpaceRelease(colorspace);

  setDrawingContextType(type);
  updateDrawingContext();
  activateDrawingContext();

  setTitle(title);

  /* Gesture recognizers. */
  [ghost_rootWindow registerGestureRecognizers];

  deferred_swap_buffers_count = 0;

  /* Deactive the parent (if it exists) and activate this one. */
  if (parent_window_) {
    parent_window_->requestToDeactivateWindow();
  }

  /* Make it the key window if there is no other window.
   * (Otherwise there will never be a call to drawInMTKView) */
  if (!system_ios_->current_active_window_) {
    request_to_make_active_ = true;
    makeKeyWindow();
  }
  /* Activate this window at the end of the next draw loop. */
  else {
    requestToActivateWindow();
  }
}

GHOST_WindowIOS::~GHOST_WindowIOS()
{
  ghost::ios::forget_navigation_window(this);
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

  releaseNativeHandles();
  [[NSNotificationCenter defaultCenter] removeObserver:rootWindow];

  /* Restore application control and display to parent window. */
  if (parent_window_ && system_ios_->getWindowManager()->getWindowFound(parent_window_)) {
    parent_window_->requestToActivateWindow();
    parent_window_ = nil;
  }
  else {
    /* Top-level window with no parent (e.g. the render-result window): hand
     * control back to another remaining window (the main window) so input and
     * display return to it. Without this, disposing the render window leaves the
     * screen showing it — the "render window won't close on ESC" bug. */
    for (GHOST_IWindow *iter_win : system_ios_->getWindowManager()->getWindows()) {
      if (iter_win != this) {
        static_cast<GHOST_WindowIOS *>(iter_win)->requestToActivateWindow();
        break;
      }
    }
  }
  /* We have no choice but to resign, however this seems like it might cause issues. */
  if (system_ios_->current_active_window_ == this) {
    IOS_WINDOW_LOG(@"~GHOST_WindowIOS(): Warning, deactivating the active window %p?", this);
    requestToDeactivateWindow();
    resignKeyWindow();
  }

  if (metal_view_) {
    metal_view_.delegate = nil;
    [metal_view_ release];
    metal_view_ = nil;
  }
  if (uiview_) {
    [uiview_ release];
    uiview_ = nil;
  }

  /* Release window. */
  if (rootWindow) {
    /* Hide first: a plain release keeps a system-retained, still-visible UIWindow
     * on screen (this is why the top-level render window appeared not to close). */
    rootWindow.hidden = YES;
    [rootWindow release];
    rootWindow = nil;
  }
  if (uiview_controller_) {
    [uiview_controller_ release];
    uiview_controller_ = nil;
  }

  if (window_title_) {
    free(window_title_);
    window_title_ = nullptr;
  }

  [pool drain];
}

#pragma mark accessors

bool GHOST_WindowIOS::getValid() const
{
  MTKView *view = metal_view_;
  return GHOST_Window::getValid() && uiview_ != NULL && view != NULL;
}

void *GHOST_WindowIOS::getOSWindow() const
{
  return (void *)uiview_;
}

GHOST_TSuccess GHOST_WindowIOS::swapBuffers()
{
  deferred_swap_buffers_count++;
  return GHOST_kSuccess;
}

void GHOST_WindowIOS::flushDeferredSwapBuffers()
{
  if (deferred_swap_buffers_count) {

    /* These two messages should be made asserts when we've fixed all the issues. */
    if (!getValid()) {
      IOS_WINDOW_LOG(@"Ignoring swap (invalid) con(%p) (win=%p)", getContext(), this);
      return;
    }

    if (!is_active_window_) {
      IOS_WINDOW_LOG(@"Ignoring swap (not active window) con(%p) (win=%p)", getContext(), this);
      return;
    }

    IOS_WINDOW_LOG(@"Swapping (ui_View)%p (mtkView)%p con(%p) (win=%p) (sc=%d)",
                   uiview_,
                   metal_view_,
                   getContext(),
                   this,
                   deferred_swap_buffers_count);

    GHOST_ContextIOS *context = reinterpret_cast<GHOST_ContextIOS *>(getContext());
    context->swapBuffers();
    deferred_swap_buffers_count = 0;
  }
}

void GHOST_WindowIOS::beginFrame()
{
  GHOSTUIWindow *ui_window = (GHOSTUIWindow *)rootWindow;
  [ui_window beginFrame];
}

void GHOST_WindowIOS::endFrame()
{
  GHOSTUIWindow *ui_window = (GHOSTUIWindow *)rootWindow;
  [ui_window endFrame];
}

void GHOST_WindowIOS::setTitle(const char *title)
{
  if (window_title_) {
    free(window_title_);
    window_title_ = nullptr;
  }
  window_title_ = (char *)malloc(strlen(title) + 1);
  if (!window_title_) {
    GHOST_ASSERT(getValid(), "GHOST_WindowIOS::setTitle(): Failed to alloc mem for window title");
  }
  strcpy(window_title_, title);
  NSString *window_title = [NSString stringWithCString:title encoding:NSUTF8StringEncoding];
  uiview_controller_.title = window_title;
}

std::string GHOST_WindowIOS::getTitle() const
{
  return window_title_;
}

void GHOST_WindowIOS::needsDisplayUpdate()
{
  [uiview_ setNeedsDisplay];
}

void GHOST_WindowIOS::getWindowBounds(GHOST_Rect &bounds) const
{
  GHOST_ASSERT(getValid(), "GHOST_WindowIOS::getWindowBounds(): window invalid");

  CGRect screenRect = rootWindow.frame;
  CGFloat scale = [UIScreen mainScreen].scale;
  CGFloat screenWidth = screenRect.size.width * scale;
  CGFloat screenHeight = screenRect.size.height * scale;

  bounds.b_ = screenHeight;
  bounds.l_ = rootWindow.frame.origin.x;
  bounds.r_ = screenWidth;
  bounds.t_ = rootWindow.frame.origin.y;
}

void GHOST_WindowIOS::getClientBounds(GHOST_Rect &bounds) const
{
  GHOST_ASSERT(getValid(), "GHOST_WindowIOS::getWindowBounds(): window invalid");

  CGRect screenRect = metal_view_.bounds;
  CGFloat scale = [UIScreen mainScreen].scale;
  CGFloat screenWidth = screenRect.size.width * scale;
  CGFloat screenHeight = screenRect.size.height * scale;

  bounds.b_ = screenHeight;
  bounds.l_ = 0;
  bounds.r_ = screenWidth;
  bounds.t_ = 0;
}

GHOST_TSuccess GHOST_WindowIOS::setClientWidth(uint32_t /*width*/)
{
  /* Ignore on iOS fow now. */
  return GHOST_kSuccess;
}

GHOST_TSuccess GHOST_WindowIOS::setClientHeight(uint32_t /*height*/)
{
  /* Ignore on iOS fow now. */
  return GHOST_kSuccess;
}

GHOST_TSuccess GHOST_WindowIOS::setClientSize(uint32_t /*width*/, uint32_t /*height*/)
{
  /* Ignore on iOS fow now. */
  return GHOST_kSuccess;
}

GHOST_TWindowState GHOST_WindowIOS::getState() const
{
  /* TODO: Implement. */
  return GHOST_kWindowStateNormal;
}

void GHOST_WindowIOS::screenToClient(int32_t inX, int32_t inY, int32_t &outX, int32_t &outY) const
{
  /* Pass through for fullscreen windows.
   * TODO: Support coordinate mapping for sized windows. */
  outX = inX;
  outY = inY;
}

void GHOST_WindowIOS::clientToScreen(int32_t inX, int32_t inY, int32_t &outX, int32_t &outY) const
{
  /* Pass through for fullscreen windows.
   * TODO: Support coordinate mapping for sized windows. */
  outX = inX;
  outY = inY;
}

void GHOST_WindowIOS::screenToClientIntern(int32_t inX,
                                           int32_t inY,
                                           int32_t &outX,
                                           int32_t &outY) const
{
  /* Pass through for fullscreen windows.
   * TODO: Support coordinate mapping for sized windows. */
  outX = inX;
  outY = inY;
}

void GHOST_WindowIOS::clientToScreenIntern(int32_t inX,
                                           int32_t inY,
                                           int32_t &outX,
                                           int32_t &outY) const
{
  /* Pass through for fullscreen windows.
   * TODO: Support coordinate mapping for sized windows. */
  outX = inX;
  outY = inY;
}

/* called for event, when window leaves monitor to another */
void GHOST_WindowIOS::setNativePixelSize(void) {}

/**
 * \note Fullscreen switch is not actual fullscreen with display capture.
 * As this capture removes all OS X window manager features.
 *
 * Instead, the menu bar and the dock are hidden, and the window is made border-less and
 * enlarged. Thus, process switch, exposé, spaces, ... still work in fullscreen mode
 */
GHOST_TSuccess GHOST_WindowIOS::setState(GHOST_TWindowState /*state*/)
{
  // Ignore on iOS?
  return GHOST_kSuccess;
}

GHOST_TSuccess GHOST_WindowIOS::setModifiedState(bool isUnsavedChanges)
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

  [pool drain];
  return GHOST_Window::setModifiedState(isUnsavedChanges);
}

GHOST_TSuccess GHOST_WindowIOS::setOrder(GHOST_TWindowOrder /*order*/)
{
  /* TODO: Support or deprecate for iOS */
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

  GHOST_ASSERT(getValid(), "GHOST_WindowIOS::setOrder(): window invalid");

  [pool drain];
  return GHOST_kSuccess;
}

#pragma mark Drawing context

GHOST_Context *GHOST_WindowIOS::newDrawingContext(GHOST_TDrawingContextType type)
{

  if (type == GHOST_kDrawingContextTypeMetal) {

    GHOST_Context *context = new GHOST_ContextIOS(want_context_params_, uiview_, metal_view_);

    if (context->initializeDrawingContext())
      return context;
    else
      delete context;
  }

  return NULL;
}

#pragma mark invalidate

GHOST_TSuccess GHOST_WindowIOS::invalidate()
{
  GHOST_ASSERT(getValid(), "GHOST_WindowIOS::invalidate(): window invalid");
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  [pool drain];
  return GHOST_kSuccess;
}

#pragma mark Progress bar

GHOST_TSuccess GHOST_WindowIOS::setProgressBar(float /*progress*/)
{
  return GHOST_kSuccess;
}

static void postNotification() {}

GHOST_TSuccess GHOST_WindowIOS::endProgressBar()
{
  return GHOST_kSuccess;
}

#pragma mark Cursor handling

void GHOST_WindowIOS::loadCursor(bool /*visible*/, GHOST_TStandardCursor /*shape*/) const {}

bool GHOST_WindowIOS::isDialog() const
{
  return is_dialog_;
}

GHOST_TSuccess GHOST_WindowIOS::setWindowCursorVisibility(bool /*visible*/)
{
  return GHOST_kSuccess;
}

GHOST_TSuccess GHOST_WindowIOS::setWindowCursorGrab(GHOST_TGrabCursorMode /*mode*/)
{
  return GHOST_kSuccess;
}

GHOST_TSuccess GHOST_WindowIOS::setWindowCursorShape(GHOST_TStandardCursor /*shape*/)
{
  return GHOST_kSuccess;
}

GHOST_TSuccess GHOST_WindowIOS::hasCursorShape(GHOST_TStandardCursor /*shape*/)
{
  return GHOST_kSuccess;
}

/** Reverse the bits in a uint16_t */
static uint16_t uns16ReverseBits(uint16_t shrt)
{
  shrt = ((shrt >> 1) & 0x5555) | ((shrt << 1) & 0xAAAA);
  shrt = ((shrt >> 2) & 0x3333) | ((shrt << 2) & 0xCCCC);
  shrt = ((shrt >> 4) & 0x0F0F) | ((shrt << 4) & 0xF0F0);
  shrt = ((shrt >> 8) & 0x00FF) | ((shrt << 8) & 0xFF00);
  return shrt;
}

GHOST_TSuccess GHOST_WindowIOS::setWindowCustomCursorShape(const uint8_t * /*bitmap*/,
                                                           const uint8_t * /*mask*/,
                                                           const int /*size*/[2],
                                                           const int /*hot_spot*/[2],
                                                           bool /*canInvertColor*/)
{
  /* Passthrough for iOS. */
  return GHOST_kSuccess;
}

uint16_t GHOST_WindowIOS::getDPIHint()
{
  return 288;
}

GHOST_TSuccess GHOST_WindowIOS::popupOnscreenKeyboard(
    const GHOST_KeyboardProperties &keyboard_properties)
{
  GHOSTUIWindow *ghost_rootWindow = (GHOSTUIWindow *)rootWindow;
  return [ghost_rootWindow popupOnscreenKeyboard:keyboard_properties];
}

GHOST_TSuccess GHOST_WindowIOS::hideOnscreenKeyboard()
{
  GHOSTUIWindow *ghost_rootWindow = (GHOSTUIWindow *)rootWindow;
  return [ghost_rootWindow hideOnscreenKeyboard];
}

const char *GHOST_WindowIOS::getLastKeyboardString()
{
  GHOSTUIWindow *ghost_rootWindow = (GHOSTUIWindow *)rootWindow;
  return [ghost_rootWindow getLastKeyboardString];
}

UITextField *GHOST_WindowIOS::getUITextField()
{
  GHOSTUIWindow *ghost_rootWindow = (GHOSTUIWindow *)rootWindow;
  return [ghost_rootWindow getUITextField];
}

const GHOST_TabletData GHOST_WindowIOS::getTabletData()
{
  GHOSTUIWindow *ghost_rootWindow = (GHOSTUIWindow *)rootWindow;
  return [ghost_rootWindow getTabletData];
}

/* This is the size of the window pre-scaled */
CGSize GHOST_WindowIOS::getLogicalWindowSize()
{
  return metal_view_.frame.size;
}

/* This is the size of the window post-scaled */
CGSize GHOST_WindowIOS::getNativeWindowSize()
{
  return metal_view_.drawableSize;
}

float GHOST_WindowIOS::getWindowScaleFactor()
{
  return [[UIScreen mainScreen] scale];
}

/* Indicate that we want this window to be the next active one. */
void GHOST_WindowIOS::requestToActivateWindow()
{
  /* Check we're not already active. */
  if (system_ios_->current_active_window_ != this) {
    /* Replace any outstanding requests. */
    if (system_ios_->next_active_window_) {
      system_ios_->next_active_window_->requestToDeactivateWindow();
    }
    request_to_make_active_ = true;
    system_ios_->next_active_window_ = this;
  }
}

void GHOST_WindowIOS::requestToDeactivateWindow()
{
  if (system_ios_->next_active_window_ == this) {
    IOS_WINDOW_LOG(@"requestToDeactivateWindow(): Has something gone wrong? %p", this);
    system_ios_->next_active_window_ = nullptr;
  }
  request_to_make_active_ = false;
}

bool GHOST_WindowIOS::makeKeyWindow()
{
  if (!getValid()) {
    IOS_WINDOW_LOG(@"Failed to activate (invalid) con(%p) (win=%p)", getContext(), this);
    return false;
  }

  GHOST_ContextIOS *context = reinterpret_cast<GHOST_ContextIOS *>(getContext());
  GHOST_ASSERT(rootWindow != nil, "GHOST_WindowIOS::makeKeyWindow() root window required");
  GHOST_ASSERT(context != nullptr, "GHOST_WindowIOS::makeKeyWindow() context required");
  GHOST_ASSERT(request_to_make_active_,
               "GHOST_WindowIOS::makeKeyWindow() must request activation first");

  /* Make window primary visible window. */
  [rootWindow makeKeyAndVisible];
  [(GHOST_IOSViewController *)uiview_controller_ updateSecondaryViewControls];
  /* Enable the drawInMTKView() calls for this window. */
  metal_view_.paused = NO;

  IOS_WINDOW_LOG(@"Key Window: (ui_View)%p (mtkView)%p con(%p) (win=%p)",
                 uiview_,
                 metal_view_,
                 getContext(),
                 this);

  system_ios_->current_active_window_ = this;
  /* Install handlers for devices that were connected before the app/view opened. */
  GHOSTUIWindow *input_window = (GHOSTUIWindow *)rootWindow;
  [input_window setNativeChromeHovered:NO];
  [input_window externalMouseChange:nil];
  [input_window externalKeyboardChange:nil];
  is_active_window_ = true;
  request_to_make_active_ = false;
  return true;
}

void GHOST_WindowIOS::resignKeyWindow()
{
  GHOST_ASSERT(system_ios_->current_active_window_ == this,
               "GHOST_WindowIOS::resignKeyWindow(): Can only resign current active window");
  GHOST_ASSERT(is_active_window_,
               "GHOST_WindowIOS::resignKeyWindow(): Can't resign non active window");
  GHOST_ASSERT(!request_to_make_active_,
               "GHOST_WindowIOS::resignKeyWindow(): activation request outstanding");

  [(GHOSTUIWindow *)rootWindow cancelPointerCapture];
  /* Disable the drawInMTKView() calls for this window. */
  metal_view_.paused = YES;
  /* Wait until any outstanding presents in flight are done. */
  while (uiview_controller_.beingPresented) {
  }
  IOS_WINDOW_LOG(@"Resigning Key Window: (ui_View)%p (mtkView)%p con(%p) (win=%p)",
                 uiview_,
                 metal_view_,
                 getContext(),
                 this);
  is_active_window_ = false;
  system_ios_->current_active_window_ = nullptr;
}

CGPoint GHOST_WindowIOS::scalePointToWindow(CGPoint &point)
{
  CGPoint scaled_point;
  scaled_point.x = point.x * getWindowScaleFactor();
  scaled_point.y = point.y * getWindowScaleFactor();
  return scaled_point;
}

#ifdef WITH_INPUT_IME
void GHOST_WindowIOS::beginIME(
    int32_t /*x*/, int32_t /*y*/, int32_t /*w*/, int32_t /*h*/, bool /*completed*/)
{
  /* Passthrough for iOS. */
}

void GHOST_WindowIOS::endIME()
{
  /* Passthrough for iOS. */
}
#endif /* WITH_INPUT_IME */
