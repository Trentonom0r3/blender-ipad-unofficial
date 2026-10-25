
#include <algorithm>
#include <array>
#include <cassert>
#include <cmath>
#include <cstdint>
#include <cstring>
#include <iostream>
#include <string>
#include <vector>
#define WITH_APPLE_CROSSPLATFORM
#define WIN32
/* SPDX-License-Identifier: GPL-2.0-or-later */


#include <algorithm>
#include <cmath>
#include <cstdint>
#include <cstring>
#include <unordered_map>
#include <utility>
#include <vector>

namespace ghost::ios {

/* Window-owned snapshots in native content pixels, top-left origin. Both UIKit
 * gesture callbacks and Blender drawing run on the main thread. No editor or
 * operator pointers cross the GHOST boundary. */
enum class PointerCaptureKind { None, Navigation, WorkspaceResize, ToolManipulation };

/* Tool choice expresses editing intent. Keep ordinary finger navigation in
 * other tools/paint modes, and leave flythrough/indirect input to their existing paths. */
inline bool direct_edit_tool(const char *tool, const char *mode)
{
  if (!tool || !mode || !(std::strcmp(mode, "OBJECT") == 0 ||
                         std::strcmp(mode, "POSE") == 0 ||
                         std::strncmp(mode, "EDIT_", 5) == 0)) {
    return false;
  }
  return std::strcmp(tool, "builtin.select_box") == 0 ||
         std::strcmp(tool, "builtin.select_lasso") == 0 ||
         std::strcmp(tool, "builtin.move") == 0 ||
         std::strcmp(tool, "builtin.rotate") == 0 ||
         std::strcmp(tool, "builtin.scale") == 0 ||
         std::strcmp(tool, "builtin.transform") == 0 ||
         ((std::strcmp(tool, "builtin.extrude_region") == 0 ||
           std::strcmp(tool, "builtin.bevel") == 0) &&
          std::strcmp(mode, "EDIT_MESH") == 0);
}

/* Recognizer-owned admission survives hardware-down/up until UIKit reset.
 * An idle interruption never rejects the first subsequent fresh touch. */
struct TouchAdmission {
  bool active = false;
  bool interrupted = false;
  void begin() { if (!active) { active = true; interrupted = false; } }
  void interrupt() { if (active) { interrupted = true; } }
  bool allowed() const { return !interrupted; }
  void reset() { active = false; interrupted = false; }
};

/* Value-only device and samples belong to one recognizer contact. A nearby
 * Pencil/hover must not relabel a finger, and a valid zero force stays zero. */
enum class TouchDevice { Unknown, Finger, Pencil, Indirect };
struct PencilSample {
  bool valid = false;
  float pressure = 0.0f, xtilt = 0.0f, ytilt = 0.0f;
  bool calibrated = false;
};
/* maximum_force <= 0 means UIKit has no calibrated force; retain the native
 * unknown-force fallback. Calibrated zero is a real light/ended sample. */
inline PencilSample pencil_sample(double force, double maximum_force,
                                  double azimuth, double altitude)
{
  if (!std::isfinite(force) || !std::isfinite(maximum_force) ||
      !std::isfinite(azimuth) || !std::isfinite(altitude)) return {};
  return {true, float(std::clamp(maximum_force > 0.0 ? force / maximum_force : 1.0,
                                 0.0, 1.0)),
          float(std::sin(azimuth) * std::cos(altitude)),
          float(-std::cos(azimuth) * std::cos(altitude)), maximum_force > 0.0};
}
inline uint64_t pencil_contact_serial_next = 1;
inline uint64_t pencil_contact_serial_new()
{
  if (pencil_contact_serial_next == UINT64_MAX) return 0;
  return pencil_contact_serial_next++;
}
struct PencilPaintContact {
  uint64_t serial = 0, generation = 0;
  uintptr_t region = 0;
  int origin_x = 0, origin_y = 0;
  bool valid() const { return serial && generation && region; }
};
inline bool pencil_paint_contact_equal(const PencilPaintContact &a,
                                       const PencilPaintContact &b)
{
  return a.valid() && b.valid() && a.serial == b.serial &&
         a.generation == b.generation && a.region == b.region &&
         a.origin_x == b.origin_x && a.origin_y == b.origin_y;
}
struct GestureContact {
  TouchDevice device = TouchDevice::Unknown;
  uintptr_t touch = 0;
  uint64_t serial = 0;
  bool down = false;
  PencilSample latest{}, peak{};
  bool begin(TouchDevice kind, uintptr_t identity, const PencilSample &sample)
  {
    if (touch || !identity || kind == TouchDevice::Unknown) return false;
    device = kind;
    touch = identity;
    serial = kind == TouchDevice::Pencil ? pencil_contact_serial_new() : 0;
    down = true;
    update(identity, sample);
    return true;
  }
  void update(uintptr_t identity, PencilSample sample)
  {
    if (!touch || identity != touch || device != TouchDevice::Pencil || !sample.valid ||
        !std::isfinite(sample.pressure) || !std::isfinite(sample.xtilt) ||
        !std::isfinite(sample.ytilt)) return;
    sample.pressure = std::clamp(sample.pressure, 0.0f, 1.0f);
    sample.xtilt = std::clamp(sample.xtilt, -1.0f, 1.0f);
    sample.ytilt = std::clamp(sample.ytilt, -1.0f, 1.0f);
    latest = sample;
    /* A calibrated tap sample supersedes unknown-force fallback, even at zero.
     * Later loss of calibration cannot promote a measured peak to full force. */
    if (!peak.valid || (sample.calibrated && !peak.calibrated) ||
        (sample.calibrated == peak.calibrated && sample.pressure > peak.pressure)) peak = sample;
  }
  bool pencil() const { return touch && device == TouchDevice::Pencil; }
  bool pencil_down() const { return down && pencil(); }
  void end(uintptr_t identity) { if (touch && identity == touch) down = false; }
  void reset() { *this = {}; }
};

struct NavigationRect {
  int xmin, ymin, xmax, ymax;
  PointerCaptureKind kind = PointerCaptureKind::Navigation;
  bool direct_selection = false;
  uint64_t hud_generation = 0;
  bool contains(const int x, const int y) const
  {
    return x >= xmin && x <= xmax && y >= ymin && y <= ymax;
  }
};

/* Last-presented owned ring capture is separate from navigation: ordinary popup
 * drawing clears navigation, but must not replace an admitted ring's contact.
 * Main-thread values only; no UI/editor/tool/property pointers cross this seam. */
struct PencilRingPresentation {
  uint64_t lifetime = 0, generation = 0;
  NavigationRect bounds{};
  bool contact_enabled = true;
};
inline uint64_t pencil_ring_lifetime_next = 1;
inline uint64_t new_pencil_ring_lifetime()
{
  if (pencil_ring_lifetime_next == UINT64_MAX) return 0;
  return pencil_ring_lifetime_next++;
}
inline std::unordered_map<const void *, PencilRingPresentation> pencil_ring_presentations;
inline PencilRingPresentation pencil_ring_presentation(const void *window)
{
  const auto found = pencil_ring_presentations.find(window);
  return found == pencil_ring_presentations.end() ? PencilRingPresentation{} : found->second;
}
inline bool publish_pencil_ring(const void *window, PencilRingPresentation receipt)
{
  if (!window || !receipt.lifetime || !receipt.generation ||
      receipt.bounds.xmin >= receipt.bounds.xmax || receipt.bounds.ymin >= receipt.bounds.ymax)
    return false;
  const auto previous = pencil_ring_presentation(window);
  if (previous.lifetime > receipt.lifetime ||
      (previous.lifetime == receipt.lifetime && previous.generation > receipt.generation))
    return false;
  if (previous.lifetime == receipt.lifetime && previous.generation == receipt.generation &&
      (previous.bounds.xmin != receipt.bounds.xmin || previous.bounds.xmax != receipt.bounds.xmax ||
       previous.bounds.ymin != receipt.bounds.ymin || previous.bounds.ymax != receipt.bounds.ymax))
    return false;
  pencil_ring_presentations[window] = receipt;
  return true;
}
inline void retire_pencil_ring(const void *window, uint64_t lifetime)
{
  if (pencil_ring_presentation(window).lifetime == lifetime)
    pencil_ring_presentations.erase(window);
}

inline void pencil_ring_contact_enabled(const void *window, uint64_t lifetime, bool enabled)
{
  auto found = pencil_ring_presentations.find(window);
  if (found != pencil_ring_presentations.end() && found->second.lifetime == lifetime)
    found->second.contact_enabled = enabled;
}
inline uint64_t pencil_ring_contact_next = 1;
struct PencilRingContact {
  uint64_t lifetime = 0, generation = 0, serial = 0;
  int origin_x = 0, origin_y = 0;
  bool captured = false, ended = false;
  bool begin(const PencilRingPresentation &receipt, int x, int y)
  {
    *this = PencilRingContact{};
    if (!receipt.lifetime || !receipt.generation || !receipt.contact_enabled ||
        !receipt.bounds.contains(x, y) || pencil_ring_contact_next == UINT64_MAX) return false;
    lifetime = receipt.lifetime; generation = receipt.generation;
    serial = pencil_ring_contact_next++;
    origin_x = x; origin_y = y; captured = true;
    return true;
  }
  bool finish()
  {
    if (!captured || ended) return false;
    captured = false; ended = true;
    return true;
  }
};

inline std::unordered_map<const void *, std::vector<NavigationRect>> navigation_regions;

inline void set_navigation_regions(const void *window, std::vector<NavigationRect> regions)
{
  if (window) {
    navigation_regions[window] = std::move(regions);
  }
}

inline PointerCaptureKind pointer_capture_hit(const void *window, const int x, const int y,
                                              const bool allow_tool_drag = true)
{
  const auto found = navigation_regions.find(window);
  if (found == navigation_regions.end()) {
    return PointerCaptureKind::None;
  }
  for (const NavigationRect &rect : found->second) {
    if (rect.contains(x, y) &&
        (allow_tool_drag || rect.kind != PointerCaptureKind::ToolManipulation)) {
      return rect.kind;
    }
  }
  return PointerCaptureKind::None;
}

/* Point-selection provenance follows the same exposed-canvas snapshot, with
 * first-hit priority for navigation, resize handles and covered UI. */
inline bool selection_hit(const void *window, const int x, const int y, const bool enabled = true)
{
  const auto found = navigation_regions.find(window);
  if (!enabled || found == navigation_regions.end()) {
    return false;
  }
  for (const NavigationRect &rect : found->second) {
    if (rect.contains(x, y)) {
      return rect.kind == PointerCaptureKind::ToolManipulation && rect.direct_selection;
    }
  }
  return false;
}


/* Original contact presentation, independent of later recognizer thresholds,
 * native redraw, hover and coalesced mouse samples. */
struct HUDContact {
  uint64_t generation = 0, serial = 0;
  int x = 0, y = 0;
};
inline uint64_t hud_contact_next = 1;
inline HUDContact hud_contact_at_start(const void *window, int x, int y)
{
  const auto found = navigation_regions.find(window);
  if (found == navigation_regions.end()) return {};
  for (const NavigationRect &rect : found->second) {
    if (!rect.contains(x, y)) continue;
    if (rect.kind != PointerCaptureKind::Navigation || !rect.hud_generation) return {};
    const uint64_t serial = hud_contact_next != UINT64_MAX ? hud_contact_next++ : UINT64_MAX;
    return HUDContact{rect.hud_generation, serial, x, y};
  }
  return {};
}

inline bool navigation_hit(const void *window, const int x, const int y)
{
  return pointer_capture_hit(window, x, y) != PointerCaptureKind::None;
}

/* Only a completed native paint-canvas presentation grants early Finger
 * suppression. Tokens are frozen at physical Tap Begin, never recomputed on
 * lift. Their only semantic action is consumption, including stale tokens. */
struct FingerPaintRect {
  NavigationRect bounds;
  uint64_t generation = 0;
  uintptr_t region = 0;
};
inline uint64_t finger_paint_texture_next = 1;
inline uint64_t new_finger_paint_texture()
{
  return finger_paint_texture_next != UINT64_MAX ? finger_paint_texture_next++ : 0;
}
inline std::unordered_map<const void *, std::vector<FingerPaintRect>> finger_paint_regions;
inline void set_finger_paint_regions(const void *window, std::vector<FingerPaintRect> regions)
{
  if (window) finger_paint_regions[window] = std::move(regions);
}
inline uint64_t finger_paint_at_start(const void *window, int x, int y)
{
  if (pencil_ring_presentation(window).lifetime || navigation_hit(window, x, y)) return 0;
  const auto found = finger_paint_regions.find(window);
  if (found == finger_paint_regions.end()) return 0;
  for (const FingerPaintRect &rect : found->second)
    if (rect.generation && rect.bounds.contains(x, y)) return rect.generation;
  return 0;
}
inline PencilPaintContact pencil_paint_at_start(const void *window,
                                                int x,
                                                int y,
                                                const uint64_t serial)
{
  if (!serial || pencil_ring_presentation(window).lifetime || navigation_hit(window, x, y)) return {};
  const auto found = finger_paint_regions.find(window);
  if (found == finger_paint_regions.end()) return {};
  for (const FingerPaintRect &rect : found->second) {
    if (rect.generation && rect.region && rect.bounds.contains(x, y))
      return {serial, rect.generation, rect.region, x, y};
  }
  return {};
}
inline bool pencil_paint_ticket_live(const void *window,
                                     const PencilPaintContact &contact)
{
  if (!contact.valid() || pencil_ring_presentation(window).lifetime ||
      navigation_hit(window, contact.origin_x, contact.origin_y)) return false;
  const auto found = finger_paint_regions.find(window);
  if (found == finger_paint_regions.end()) return false;
  for (const FingerPaintRect &rect : found->second)
    if (rect.generation == contact.generation && rect.region == contact.region &&
        rect.bounds.contains(contact.origin_x, contact.origin_y)) return true;
  return false;
}
inline std::vector<NavigationRect> finger_paint_subtract(
    const std::vector<NavigationRect> &parts, const NavigationRect &blocker)
{
  std::vector<NavigationRect> result;
  for (const auto &part : parts) {
    const int xmin = std::max(part.xmin, blocker.xmin), xmax = std::min(part.xmax, blocker.xmax);
    const int ymin = std::max(part.ymin, blocker.ymin), ymax = std::min(part.ymax, blocker.ymax);
    if (xmin > xmax || ymin > ymax) { result.push_back(part); continue; }
    for (const auto &next : {NavigationRect{part.xmin, part.ymin, xmin - 1, part.ymax},
                             NavigationRect{xmax + 1, part.ymin, part.xmax, part.ymax},
                             NavigationRect{xmin, part.ymin, xmax, ymin - 1},
                             NavigationRect{xmin, ymax + 1, xmax, part.ymax}})
      if (next.xmin <= next.xmax && next.ymin <= next.ymax) result.push_back(next);
  }
  return result;
}

/* Hold the kind selected at gesture begin even if drawing replaces the hit map.
 * One finish produces one release. Repeated terminal callbacks are inert. */
struct PointerCapture {
  PointerCaptureKind kind = PointerCaptureKind::None;
  bool ended = false;
  bool active() const { return kind != PointerCaptureKind::None; }
  void begin(const PointerCaptureKind hit) { kind = hit; ended = false; }
  struct End { bool release; bool cancelled; };
  End finish(const bool interrupted)
  {
    /* Interrupted native navigation uses the same terminal provenance as editing.
     * A normal lift still confirms, and ended streams cannot release twice. */
    const End result{active(), interrupted && active()};
    ended |= result.release;
    kind = PointerCaptureKind::None;
    return result;
  }
};

inline void forget_navigation_window(const void *window)
{
  navigation_regions.erase(window);
  finger_paint_regions.erase(window);
  pencil_ring_presentations.erase(window);
}

}  // namespace ghost::ios

#define system system_ptr
using CGFloat=double;
struct CGPoint { double x=0,y=0; };
CGPoint CGPointMake(double x,double y) { return {x,y}; }
const CGPoint CGPointZero{};
bool CGPointEqualToPoint(CGPoint a,CGPoint b) { return a.x==b.x&&a.y==b.y; }
#define GHOST_ASSERT(c,m) assert(c)
using GHOST_TEventType=int; using GHOST_TButton=int; using GHOST_SystemHandle=void*;
enum { GHOST_kEventCursorMove=1,GHOST_kEventButtonDown,GHOST_kEventButtonUp,GHOST_kEventTrackpad,
 GHOST_kEventKeyDown,GHOST_kEventKeyUp,GHOST_kKeyLeftShift,GHOST_kEventPencilToolPalette,
 GHOST_kPencilRingBegin,GHOST_kPencilRingMotion,GHOST_kPencilRingEnd,GHOST_kPencilRingCancel,
 GHOST_kButtonMaskLeft=1,GHOST_kButtonMaskRight=2,GHOST_kTrackpadEventScroll=20,
 GHOST_kTrackpadEventMagnifyTouch,GHOST_kTrackpadEventMagnify,GHOST_kTrackpadEventSmartMagnify,
 GHOST_kTrackpadEventRotate,GHOST_kTabletModeStylus };
struct GHOST_TabletData { int Active=0; float Pressure=1,Xtilt=0,Ytilt=0; };
const GHOST_TabletData GHOST_TABLET_DATA_NONE{};
struct GHOST_IWindow{};
struct GHOST_TEventCursorData { int32_t x,y; GHOST_TabletData tablet; bool is_direct_tool;
 uint64_t ipad_hud_generation,ipad_hud_serial;bool is_direct_finger;uint64_t ipad_finger_paint_generation;
 uint64_t ipad_pencil_paint_serial,ipad_pencil_paint_generation;uintptr_t ipad_pencil_paint_region;
 int32_t ipad_pencil_paint_origin_x,ipad_pencil_paint_origin_y; };
struct GHOST_TEventButtonData { GHOST_TButton button;GHOST_TabletData tablet;bool is_cancelled,is_direct_tool;
 uint64_t ipad_hud_generation,ipad_hud_serial;bool is_direct_finger;uint64_t ipad_finger_paint_generation;
 uint64_t ipad_pencil_paint_serial,ipad_pencil_paint_generation;uintptr_t ipad_pencil_paint_region;
 int32_t ipad_pencil_paint_origin_x,ipad_pencil_paint_origin_y; };
struct GHOST_TEventTrackpadData { int subtype,x,y,deltaX,deltaY;bool isDirectionInverted;int numFingers; };
struct GHOST_Event { void *data_=nullptr;int type;GHOST_Event(uint64_t,int t,GHOST_IWindow*):type(t){}
 virtual ~GHOST_Event()=default; };
class GHOST_EventCursor : public GHOST_Event {
 public:
  /**
   * Constructor.
   * \param msec: The time this event was generated.
   * \param type: The type of this event.
   * \param x: The x-coordinate of the location the cursor was at the time of the event.
   * \param y: The y-coordinate of the location the cursor was at the time of the event.
   * \param tablet: The tablet data associated with this event.
   */
  GHOST_EventCursor(uint64_t msec,
                    GHOST_TEventType type,
                    GHOST_IWindow *window,
                    int32_t x,
                    int32_t y,
                    const GHOST_TabletData &tablet,
                    bool is_direct_tool = false,
                    uint64_t ipad_hud_generation = 0,
                    uint64_t ipad_hud_serial = 0,
                    bool is_direct_finger = false,
                    uint64_t ipad_finger_paint_generation = 0,
                    uint64_t ipad_pencil_paint_serial = 0,
                    uint64_t ipad_pencil_paint_generation = 0,
                    uintptr_t ipad_pencil_paint_region = 0,
                    int32_t ipad_pencil_paint_origin_x = 0,
                    int32_t ipad_pencil_paint_origin_y = 0)
      : GHOST_Event(msec, type, window), cursor_event_data_({x, y, tablet, is_direct_tool, ipad_hud_generation, ipad_hud_serial, is_direct_finger, ipad_finger_paint_generation, ipad_pencil_paint_serial, ipad_pencil_paint_generation, ipad_pencil_paint_region, ipad_pencil_paint_origin_x, ipad_pencil_paint_origin_y})
  {
    data_ = &cursor_event_data_;
  }

 protected:
  /** The x,y-coordinates of the cursor position. */
  GHOST_TEventCursorData cursor_event_data_;
};

class GHOST_EventButton : public GHOST_Event {
 public:
  /**
   * Constructor.
   * \param time: The time this event was generated.
   * \param type: The type of this event.
   * \param window: The window of this event.
   * \param button: The state of the buttons were at the time of the event.
   * \param tablet: The tablet data associated with this event.
   * \param is_cancelled: An interrupted gesture release that must not confirm a drag.
   */
  GHOST_EventButton(uint64_t time,
                    GHOST_TEventType type,
                    GHOST_IWindow *window,
                    GHOST_TButton button,
                    const GHOST_TabletData &tablet,
                    bool is_cancelled = false,
                    bool is_direct_tool = false,
                    uint64_t ipad_hud_generation = 0,
                    uint64_t ipad_hud_serial = 0,
                    bool is_direct_finger = false,
                    uint64_t ipad_finger_paint_generation = 0,
                     uint64_t ipad_pencil_paint_serial = 0,
                     uint64_t ipad_pencil_paint_generation = 0,
                     uintptr_t ipad_pencil_paint_region = 0,
                     int32_t ipad_pencil_paint_origin_x = 0,
                     int32_t ipad_pencil_paint_origin_y = 0)
      : GHOST_Event(time, type, window), button_event_data_({button, tablet, is_cancelled, is_direct_tool, ipad_hud_generation, ipad_hud_serial, is_direct_finger, ipad_finger_paint_generation, ipad_pencil_paint_serial, ipad_pencil_paint_generation, ipad_pencil_paint_region, ipad_pencil_paint_origin_x, ipad_pencil_paint_origin_y})
  {
    data_ = &button_event_data_;
  }

 protected:
  /** The button event data. */
  GHOST_TEventButtonData button_event_data_;
};

// Trackpad/key storage models the ABI; actual generator arguments execute.
struct GHOST_EventTrackpad:GHOST_Event { GHOST_TEventTrackpadData d;
 GHOST_EventTrackpad(uint64_t t,GHOST_IWindow*w,int s,int x,int y,int dx,int dy,bool inv,int n):
 GHOST_Event(t,GHOST_kEventTrackpad,w),d{s,x,y,dx,dy,inv,n}{data_=&d;} };
struct GHOST_EventKey:GHOST_Event { int key;GHOST_EventKey(uint64_t t,int type,GHOST_IWindow*w,int k,bool,void*):
 GHOST_Event(t,type,w),key(k){} };
struct System { std::vector<GHOST_Event*> queue; uint64_t getMilliSeconds(){return 19;}
 void pushEvent(GHOST_Event*event){queue.push_back(event);}
 void clear(){for(auto*event:queue)delete event;queue.clear();} };
System system_owner;System*system=&system_owner;GHOST_IWindow ghost_window;GHOST_IWindow*window=&ghost_window;
uint64_t GHOST_GetMilliSeconds(void*){return 19;}
constexpr CGFloat MMB_PAN_SCALE=1;
ghost::ios::PencilPaintContact pencil_paint_enqueued;
bool pencil_paint_enqueued_down=false;uint64_t pencil_paint_retired_serial=0;
CGPoint pencil_paint_last_location,last_pencil_location;
uint64_t last_pencil_location_time=0;GHOST_TabletData pencil_paint_last_tablet,tablet_data;
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

} UserInputEvent;

static GHOST_TabletData ios_tablet_snapshot(const ghost::ios::PencilSample &sample)
{
  GHOST_TabletData result = GHOST_TABLET_DATA_NONE;
  result.Active = GHOST_kTabletModeStylus;
  result.Pressure = sample.valid ? sample.pressure : 0.0f;
  result.Xtilt = sample.valid ? sample.xtilt : 0.0f;
  result.Ytilt = sample.valid ? sample.ytilt : 0.0f;
  return result;
}
void generateUserInputEvents(const UserInputEvent &event_info) {
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
          GHOST_ASSERT(false, "GHOST_SystemIOS::generateUserInputEvents unsupported event type");
      }
    }

}
enum { UIGestureRecognizerStateBegan=1,UIGestureRecognizerStateChanged,UIGestureRecognizerStateEnded,
 UIGestureRecognizerStateCancelled,UIGestureRecognizerStateFailed };
struct Sender {int state=UIGestureRecognizerStateBegan;bool pencil=true;
 CGPoint touch_point{110,100},translation{10,0},cached;
 ghost::ios::PencilSample sample{true,.4f,.2f,-.1f};ghost::ios::PencilPaintContact contact;
 ghost::ios::HUDContact hud;ghost::ios::PencilRingContact ring;
 ghost::ios::TouchAdmission touch_admission;
 Sender(){touch_admission.begin();}
 bool touchStreamAllowed()
{
  return touch_admission.allowed();
}
 void invalidateTouchStream()
{
  touch_admission.interrupt();
}
 void setCachedTranslation(CGPoint p){cached=p;}
 CGPoint getRelativeTranslation(CGPoint p){return {p.x-cached.x,p.y-cached.y};} };
ghost::ios::PointerCapture pointer_capture;ghost::ios::HUDContact pointer_hud_contact;
ghost::ios::PencilRingContact ring_capture;bool pointer_finger_contact=false;
bool mouse_left_pressed=false,mouse_middle_pressed=false,mouse_right_pressed=false,flythrough=false;
double mouse_cursor_x=0,mouse_cursor_y=0;bool GHOST_IOS_get_flythrough_mode(){return flythrough;}
std::vector<int> ring_packets;
void ios_ring_packet(System*,GHOST_IWindow*,const ghost::ios::PencilRingContact&,int phase,CGPoint){ring_packets.push_back(phase);}
Sender tap_gesture_recognizer;Sender*pan_gesture_recognizer=nullptr;
void cancelRingHover(){}
void producer(Sender &sender)
{
  if (!sender.touchStreamAllowed()) {
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
  CGPoint touch_point = sender.touch_point;
  CGPoint translation = sender.translation;
  const bool pencil_pan = sender.pencil;
  const GHOST_TabletData gesture_tablet = ios_tablet_snapshot(sender.sample);

  if (sender.state == UIGestureRecognizerStateBegan) {
    ring_capture = sender.ring;
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
    pointer_hud_contact = sender.hud;
    pointer_finger_contact = !sender.pencil;
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
      generateUserInputEvents(begin);
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
    generateUserInputEvents(pointer);
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
        sender.setCachedTranslation(translation);
        mouse_cursor_x = touch_point.x;
        mouse_cursor_y = touch_point.y;
        UserInputEvent cursor_info(&touch_point, nullptr, nullptr, false);
        cursor_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
        generateUserInputEvents(cursor_info);
      }
      else if (sender.state == UIGestureRecognizerStateChanged) {
        CGPoint rel_tran = sender.getRelativeTranslation(translation);
        sender.setCachedTranslation(translation);
        if (!CGPointEqualToPoint(rel_tran, CGPointZero)) {
          UserInputEvent event_info(&touch_point, &rel_tran, nullptr, false);
          event_info.add_event(UserInputEvent::EventTypes::PAN_GESTURE_TWO_FINGERS);
          generateUserInputEvents(event_info);
        }
      }
      else if (sender.state == UIGestureRecognizerStateEnded ||
               sender.state == UIGestureRecognizerStateCancelled ||
               sender.state == UIGestureRecognizerStateFailed)
      {
        sender.setCachedTranslation(CGPointMake(0.0f, 0.0f));
        /* End the anchored pan stream so UI gesture captures cannot leak into
         * a later trackpad scroll or another finger gesture. */
        UserInputEvent cursor_info(&touch_point, nullptr, nullptr, false);
        cursor_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
        generateUserInputEvents(cursor_info);
      }
      return;
    }
    CGPoint origin = CGPointMake(touch_point.x - translation.x,
                                 touch_point.y - translation.y);
    UserInputEvent scroll_info(&origin, nullptr, nullptr, false);
    if (sender.state == UIGestureRecognizerStateBegan) {
      sender.setCachedTranslation(translation);
      scroll_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
    }
    else if (sender.state == UIGestureRecognizerStateChanged) {
      scroll_info.translation = sender.getRelativeTranslation(translation);
      sender.setCachedTranslation(translation);
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
    generateUserInputEvents(scroll_info);
    return;
  }
  UserInputEvent event_info(&touch_point, nullptr, nullptr, pencil_pan);
  if (pencil_pan) {
    event_info.set_tablet_snapshot(gesture_tablet);
    event_info.pencil_paint = sender.contact;
  }

  if (sender.state == UIGestureRecognizerStateBegan ||
      sender.state == UIGestureRecognizerStateChanged)
  {
    /* Register initial click for click and drag support. */
    if (sender.state == UIGestureRecognizerStateBegan) {
      /* Set inital translation */
      sender.setCachedTranslation(translation);
      event_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
      event_info.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_DOWN);
    }

    /* Calculate translation change since last begin/change event */
    CGPoint relative_translation = sender.getRelativeTranslation(translation);
    /* Update cached translation */
    sender.setCachedTranslation(translation);
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
  generateUserInputEvents(event_info);
}
void cancel_capture()
{
  cancelRingHover();
  /* End the exact uncaptured Pencil press before UIKit contact owners are
   * invalidated. This emits one native terminal only after the down was queued. */
  if (pencil_paint_enqueued_down) {
    CGPoint location = pencil_paint_last_location;
    UserInputEvent release(&location, nullptr, nullptr, true);
    release.set_tablet_snapshot(pencil_paint_last_tablet);
    release.pencil_paint = pencil_paint_enqueued;
    release.cancelled = true;
    release.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_UP);
    generateUserInputEvents(release);
  }
  tap_gesture_recognizer.invalidateTouchStream();
  pan_gesture_recognizer->invalidateTouchStream();
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
    generateUserInputEvents(release);
  }
  pointer_hud_contact = {};
  pointer_finger_contact = false;
}

enum { LEFTMOUSE=100,MIDDLEMOUSE,KM_PRESS,KM_RELEASE,KM_NOTHING,MOUSEMOVE,MOUSEPAN,MOUSEZOOM,
 MOUSESMARTZOOM,MOUSEROTATE,TIMER,OPERATOR_FINISHED=1,OPERATOR_RUNNING_MODAL=2,
 OPERATOR_CANCELLED=4,OPERATOR_PASS_THROUGH=8,WM_HANDLER_HANDLED=16,
 WM_EVENT_IS_TOUCH_PINCH=1,WM_EVENT_IS_POINTER_CANCEL=2,WM_EVENT_IS_DIRECT_TOOL=4,
 WM_EVENT_IS_DIRECT_FINGER=8,WM_EVENT_SCROLL_INVERT=16,WM_EVENT_MULTITOUCH_TWO_FINGERS=32,
 WM_EVENT_MULTITOUCH_THREE_FINGERS=64,WM_PENCIL_PAINT_PHASE_NONE=0,
 WM_PENCIL_PAINT_PHASE_PREPRESS=1,WM_PENCIL_PAINT_PHASE_BEGIN=2,
 WM_PENCIL_PAINT_PHASE_MOTION=3,WM_PENCIL_PAINT_PHASE_END=4,WM_HANDLER_TYPE_OP=1,
 WM_HANDLER_DO_FREE=2,RGN_TYPE_WINDOW=1,SPACE_VIEW3D=1,RGN_FLAG_HIDDEN=1,
 RGN_FLAG_TOO_SMALL=2,RGN_FLAG_POLL_FAILED=4,OB_MODE_SCULPT=1,OB_MODE_VERTEX_PAINT=2,
 OB_MODE_WEIGHT_PAINT=4,OB_MODE_TEXTURE_PAINT=8,OPTYPE_UNDO=1 };
using wmOperatorStatus=int;using float2=std::array<float,2>;
template<class...T>bool ELEM(int n,T...xs){return ((n==xs)||...);}
#define ISTIMER(t) ((t)==TIMER)
template<class T>struct List {std::vector<T*> items;T*first=nullptr;void add(T*x){items.push_back(x);if(!first)first=x;} };
#define LISTBASE_FOREACH(type,name,list) for(type name : (list)->items)
struct ID {uint64_t session_uid=17;};
struct ARegionRuntime {bool visible=true,ipad_canvas=true;};
struct rcti {int xmin=0,xmax=1000,ymin=0,ymax=1000;};
struct ARegion {int regiontype=RGN_TYPE_WINDOW,flag=0;ARegionRuntime*runtime=nullptr; void*regiondata=nullptr;rcti winrct;int winx=1000,winy=1000;};
struct ScrArea {int spacetype=SPACE_VIEW3D;List<ARegion>regionbase;};
struct bScreen {ID id;List<ScrArea>areabase;};
struct wmEventHandler {int type=WM_HANDLER_TYPE_OP,flag=0;bool freed=false;};
struct Runtime {struct{void*last=nullptr;}event_queue;uint64_t ipad_pencil_paint_queued_serial=0,ipad_pencil_paint_queued_generation=0,
 ipad_pencil_paint_retired_serial=0,ipad_pencil_paint_cancelled_serial=0,
 ipad_pencil_paint_cancelled_generation=0;uintptr_t ipad_pencil_paint_queued_region=0;
 int32_t ipad_pencil_paint_queued_origin_xy[2]{};bool ipad_pencil_paint_queued_down=false;};
struct wmWindow {Runtime*runtime=nullptr;GHOST_IWindow*ghostwin=nullptr;List<wmEventHandler>modalhandlers;bScreen*screen=nullptr;};
struct wmWindowManager {int op_undo_depth=0;intptr_t undo_id=7,register_id=9;};
struct IPadFingerPaintOwner {std::array<uint64_t,19>values{};std::array<char,64>tool{};bool valid=true;};
struct StrokeCache {bool alt_smooth=false;};
namespace bke::pbvh {enum class Type{Mesh,BMesh};struct Tree{Type value=Type::Mesh;Type type()const{return value;}};}
struct SculptSession {StrokeCache*cache=nullptr;};
struct Brush {uint32_t flag=0;bool supports_dyntopo=false;};
constexpr uint32_t BRUSH_ANCHORED=1,BRUSH_DRAG_DOT=2;
struct Paint {Brush*brush=nullptr;};struct Sculpt {Paint paint;};struct VPaint{Paint paint;};
struct ToolSettings {Sculpt*sculpt=nullptr;VPaint*wpaint=nullptr,*vpaint=nullptr;};
constexpr int PSYS_TOT_VG=2,ID_RECALC_PSYS_RESET=1,NC_OBJECT=2,ND_DRAW=4;
struct ParticleSystem {int vgroup[PSYS_TOT_VG]{},recalc=0;};
struct Object {SculptSession*sculpt=nullptr;bke::pbvh::Tree pbvh;List<ParticleSystem>particlesystem;void*data=nullptr;};struct Depsgraph{};
int BKE_object_defgroup_active_index_get(Object*){return 1;}
void DEG_id_tag_update(ID*,int){}
void WM_event_add_notifier(const void*,int,Object*){}
struct bContext {wmWindow*win=nullptr;wmWindowManager*manager=nullptr;ScrArea*area=nullptr;
 ARegion*region=nullptr;bScreen*screen=nullptr;IPadFingerPaintOwner owner;
 bool capture_valid=true;Depsgraph*depsgraph=nullptr;Object*object=nullptr;ToolSettings*settings=nullptr;};
struct wmTabletData {int active=0;float pressure=1;std::array<float,2>tilt{};bool is_motion_absolute=false;};
struct wmEvent {int prev_xy[2]{};int type=0,val=0,flag=0,xy[2]{},mval[2]{4,7};wmTabletData tablet;
 bool ipad_pencil_paint_down=false;uint64_t ipad_hud_generation=0,ipad_hud_serial=0,
 ipad_pencil_paint_serial=0,ipad_pencil_paint_generation=0;uintptr_t ipad_pencil_paint_region=0;
 int ipad_pencil_paint_origin_xy[2]{};uint8_t ipad_pencil_paint_phase=0;};
struct wmOperator;
struct wmOperatorType {void(*cancel)(bContext*,wmOperator*)=nullptr;void(*modal)()=nullptr;
 int flag=OPTYPE_UNDO;bool modalkeymap=false;uint64_t ipad_lifetime_id=29;};
struct PointerRNA{};struct wmOperator {PointerRNA*ptr=nullptr;wmOperatorType*type=nullptr;wmOperator*opm=nullptr;void*customdata=nullptr;
 uint64_t lifetime=31;bool freed=false,finished=false;};
struct wmEventHandler_Op {wmEventHandler head;bool is_fileselect=false;
 struct {wmWindow*win=nullptr;ScrArea*area=nullptr;ARegion*region=nullptr;}context;
 uint64_t ipad_pencil_paint_serial=0,ipad_pencil_paint_generation=0,
 ipad_pencil_operator_lifetime=31,ipad_pencil_type_lifetime=29,
 ipad_pencil_type_address=0,ipad_pencil_screen_uid=17;
 uintptr_t ipad_pencil_area=0,ipad_pencil_region=0;int ipad_pencil_paint_mode=0;
 int32_t ipad_pencil_origin_x=0,ipad_pencil_origin_y=0;
 uint64_t ipad_pencil_owner_values[19]{};char ipad_pencil_owner_tool[64]{};wmOperator*op=nullptr;};
int BLI_findindex(const List<wmEventHandler>*list,const wmEventHandler*h){
 auto i=std::find(list->items.begin(),list->items.end(),h);return i==list->items.end()?-1:int(i-list->items.begin());}
wmWindow*CTX_wm_window(bContext*C){return C->win;}wmWindowManager*CTX_wm_manager(bContext*C){return C->manager;}
ScrArea*CTX_wm_area(bContext*C){return C->area;}ARegion*CTX_wm_region(bContext*C){return C->region;}
bScreen*CTX_wm_screen(bContext*C){return C->screen;}
bScreen*WM_window_get_active_screen(wmWindow*w){return w->screen;}
bool ED_ipad_finger_paint_capture(bContext*C,IPadFingerPaintOwner&owner){owner=C->owner;return C->capture_valid&&owner.valid;}
bool WM_operator_touch_lifetime_matches(const wmOperator*op,uint64_t id){return op&&op->lifetime==id;}
void copy_v2_v2_int(int*a,const int*b){a[0]=b[0];a[1]=b[1];}
// Coordinate conversion and tablet preference transform are explicit ABI boundaries.
void wm_cursor_position_from_ghost_screen_coords(wmWindow*,int*x,int*y){*x+=3;*y=900-*y;}
void wm_stereo3d_mouse_offset_apply(wmWindow*,int*xy){xy[0]+=2;}
void wm_tablet_data_from_ghost(const GHOST_TabletData*d,wmTabletData*out){
 out->active=d->Active;out->pressure=d->Pressure;out->tilt={d->Xtilt,d->Ytilt};out->is_motion_absolute=d->Active!=0;}
int wm_event_type_from_ghost_button(int,int){return LEFTMOUSE;}
int shared_state_updates=0;std::vector<wmEvent>wm_queue;

wmEvent*wm_event_add_intern(wmWindow*win,const wmEvent*event){wm_queue.push_back(*event);win->runtime->event_queue.last=&wm_queue.back();return &wm_queue.back();}
void wm_event_free_last(wmWindow*win){wm_queue.pop_back();win->runtime->event_queue.last=wm_queue.empty()?nullptr:&wm_queue.back();}
static wmEvent *wm_event_add_trackpad(wmWindow *win, const wmEvent *event, int deltax, int deltay)
{
  /* Ignore in between trackpad events for performance, we only need high accuracy
   * for painting with mouse moves, for navigation using the accumulated value is ok. */
  const wmEvent *event_last = static_cast<wmEvent *>(win->runtime->event_queue.last);
  if (event_last && event_last->type == event->type &&
      (event_last->flag & WM_EVENT_IS_TOUCH_PINCH) == (event->flag & WM_EVENT_IS_TOUCH_PINCH))
  {
    deltax += event_last->xy[0] - event_last->prev_xy[0];
    deltay += event_last->xy[1] - event_last->prev_xy[1];

    wm_event_free_last(win);
  }

  /* Set prev_xy, the delta is computed from this in operators. */
  wmEvent *event_new = wm_event_add_intern(win, event);
  event_new->prev_xy[0] = event_new->xy[0] - deltax;
  event_new->prev_xy[1] = event_new->xy[1] - deltay;

  return event_new;
}
void queue_native(wmWindow*win,GHOST_Event*packet){
 const int type=packet->type;const void*customdata=packet->data_;
 bool ipad_pencil_tagged=false;ghost::ios::PencilPaintContact ipad_pencil_contact{};
 bool ipad_pencil_dispatch_down=false;uint8_t ipad_pencil_dispatch_phase=WM_PENCIL_PAINT_PHASE_NONE;
   /* Consume the whole proven Finger canvas group before cursor/click state,
   * modal delivery or cross-window redirection. Old frozen tokens still shield
   * queued pixels; they never cancel or release a Pencil/hardware owner. */
  if (type == GHOST_kEventCursorMove) {
    const auto *packet = static_cast<const GHOST_TEventCursorData *>(customdata);
    if (packet->is_direct_finger && packet->ipad_finger_paint_generation) return;
  }
  else if (ELEM(type, GHOST_kEventButtonDown, GHOST_kEventButtonUp)) {
    const auto *packet = static_cast<const GHOST_TEventButtonData *>(customdata);
    if (packet->is_direct_finger && packet->ipad_finger_paint_generation) return;
  }

#ifdef WITH_APPLE_CROSSPLATFORM
  if (ELEM(type, GHOST_kEventCursorMove, GHOST_kEventButtonDown, GHOST_kEventButtonUp)) {
    uint64_t serial = 0, generation = 0;
    uintptr_t region = 0;
    int origin_x = 0, origin_y = 0;
    GHOST_TButton button = GHOST_kButtonMaskLeft;
    if (type == GHOST_kEventCursorMove) {
      const auto *packet = static_cast<const GHOST_TEventCursorData *>(customdata);
      serial = packet->ipad_pencil_paint_serial;
      generation = packet->ipad_pencil_paint_generation;
      region = packet->ipad_pencil_paint_region;
      origin_x = packet->ipad_pencil_paint_origin_x;
      origin_y = packet->ipad_pencil_paint_origin_y;
    }
    else {
      const auto *packet = static_cast<const GHOST_TEventButtonData *>(customdata);
      serial = packet->ipad_pencil_paint_serial;
      generation = packet->ipad_pencil_paint_generation;
      region = packet->ipad_pencil_paint_region;
      origin_x = packet->ipad_pencil_paint_origin_x;
      origin_y = packet->ipad_pencil_paint_origin_y;
      button = packet->button;
    }
    const bool any_contact_value = serial || generation || region || origin_x || origin_y;
    if (any_contact_value) {
      if (!serial || !generation || !region || !win || !win->runtime ||
          (type != GHOST_kEventCursorMove && button != GHOST_kButtonMaskLeft)) return;
      ipad_pencil_contact = {serial, generation, region, origin_x, origin_y};
      auto *runtime = win->runtime;
      const auto matches_queued = [&]() {
        return runtime->ipad_pencil_paint_queued_serial == serial &&
               runtime->ipad_pencil_paint_queued_generation == generation &&
               runtime->ipad_pencil_paint_queued_region == region &&
               runtime->ipad_pencil_paint_queued_origin_xy[0] == origin_x &&
               runtime->ipad_pencil_paint_queued_origin_xy[1] == origin_y;
      };
      const auto clear_queued = [&]() {
        runtime->ipad_pencil_paint_queued_serial = 0;
        runtime->ipad_pencil_paint_queued_generation = 0;
        runtime->ipad_pencil_paint_queued_region = 0;
        runtime->ipad_pencil_paint_queued_origin_xy[0] = 0;
        runtime->ipad_pencil_paint_queued_origin_xy[1] = 0;
        runtime->ipad_pencil_paint_queued_down = false;
      };
      /* Consume cancelled contact packets before shared pointer-state updates. */
      if (runtime->ipad_pencil_paint_cancelled_serial == serial &&
          runtime->ipad_pencil_paint_cancelled_generation == generation)
      {
        if (type == GHOST_kEventButtonUp) {
          runtime->ipad_pencil_paint_retired_serial = std::max(
              runtime->ipad_pencil_paint_retired_serial, serial);
          runtime->ipad_pencil_paint_cancelled_serial = 0;
          runtime->ipad_pencil_paint_cancelled_generation = 0;
          if (runtime->ipad_pencil_paint_queued_serial == serial &&
              runtime->ipad_pencil_paint_queued_generation == generation)
          {
            clear_queued();
          }
        }
        return;
      }
      if (type == GHOST_kEventCursorMove) {
        if (runtime->ipad_pencil_paint_queued_serial) {
          if (!matches_queued()) return;
        }
        else {
          if (serial <= runtime->ipad_pencil_paint_retired_serial ||
              !ghost::ios::pencil_paint_ticket_live(win->ghostwin, ipad_pencil_contact)) return;
          runtime->ipad_pencil_paint_queued_serial = serial;
          runtime->ipad_pencil_paint_queued_generation = generation;
          runtime->ipad_pencil_paint_queued_region = region;
          runtime->ipad_pencil_paint_queued_origin_xy[0] = origin_x;
          runtime->ipad_pencil_paint_queued_origin_xy[1] = origin_y;
          runtime->ipad_pencil_paint_queued_down = false;
        }
        ipad_pencil_dispatch_down = runtime->ipad_pencil_paint_queued_down;
        ipad_pencil_dispatch_phase = ipad_pencil_dispatch_down ?
                                        WM_PENCIL_PAINT_PHASE_MOTION :
                                        WM_PENCIL_PAINT_PHASE_PREPRESS;
      }
      else if (type == GHOST_kEventButtonDown) {
        if ((runtime->ipad_pencil_paint_queued_serial &&
             (!matches_queued() || runtime->ipad_pencil_paint_queued_down)) ||
            (!runtime->ipad_pencil_paint_queued_serial &&
             serial <= runtime->ipad_pencil_paint_retired_serial) ||
            !ghost::ios::pencil_paint_ticket_live(win->ghostwin, ipad_pencil_contact))
        {
          if (matches_queued() && !runtime->ipad_pencil_paint_queued_down) {
            runtime->ipad_pencil_paint_retired_serial = std::max(
                runtime->ipad_pencil_paint_retired_serial, serial);
            clear_queued();
          }
          return;
        }
        if (!runtime->ipad_pencil_paint_queued_serial) {
          runtime->ipad_pencil_paint_queued_serial = serial;
          runtime->ipad_pencil_paint_queued_generation = generation;
          runtime->ipad_pencil_paint_queued_region = region;
          runtime->ipad_pencil_paint_queued_origin_xy[0] = origin_x;
          runtime->ipad_pencil_paint_queued_origin_xy[1] = origin_y;
        }
        runtime->ipad_pencil_paint_queued_down = true;
        ipad_pencil_dispatch_down = true;
        ipad_pencil_dispatch_phase = WM_PENCIL_PAINT_PHASE_BEGIN;
      }
      else {
        if (!matches_queued() || !runtime->ipad_pencil_paint_queued_down) return;
        ipad_pencil_dispatch_down = true;
        ipad_pencil_dispatch_phase = WM_PENCIL_PAINT_PHASE_END;
        runtime->ipad_pencil_paint_retired_serial = std::max(
            runtime->ipad_pencil_paint_retired_serial, serial);
        clear_queued();
      }
      ipad_pencil_tagged = true;
    }
  }
#endif


 wmEvent event,event_state_value;wmEvent*event_state=&event_state_value;
 if(type==GHOST_kEventCursorMove){
  const auto*cd=static_cast<const GHOST_TEventCursorData*>(customdata);
        copy_v2_v2_int(event.xy, &cd->x);
      wm_cursor_position_from_ghost_screen_coords(win, &event.xy[0], &event.xy[1]);

      wm_stereo3d_mouse_offset_apply(win, event.xy);
      wm_tablet_data_from_ghost(&cd->tablet, &event.tablet);
      event.ipad_hud_generation = cd->ipad_hud_generation;
      event.ipad_hud_serial = cd->ipad_hud_serial;
#ifdef WITH_APPLE_CROSSPLATFORM
      event.ipad_pencil_paint_serial = cd->ipad_pencil_paint_serial;
      event.ipad_pencil_paint_generation = cd->ipad_pencil_paint_generation;
      event.ipad_pencil_paint_region = cd->ipad_pencil_paint_region;
      event.ipad_pencil_paint_origin_xy[0] = cd->ipad_pencil_paint_origin_x;
      event.ipad_pencil_paint_origin_xy[1] = cd->ipad_pencil_paint_origin_y;
      wm_cursor_position_from_ghost_screen_coords(
          win, &event.ipad_pencil_paint_origin_xy[0], &event.ipad_pencil_paint_origin_xy[1]);
      wm_stereo3d_mouse_offset_apply(win, event.ipad_pencil_paint_origin_xy);
      event.ipad_pencil_paint_down = ipad_pencil_dispatch_down;
      event.ipad_pencil_paint_phase = ipad_pencil_dispatch_phase;
#endif
      if (cd->is_direct_finger) event.flag |= WM_EVENT_IS_DIRECT_FINGER;
      if (cd->is_direct_tool) {
        /* CLICK_DRAG inherits motion provenance, not the initiating button. */
        event.flag |= WM_EVENT_IS_DIRECT_TOOL;
      }

      event.type = MOUSEMOVE;
      event.val = KM_NOTHING;

  ++shared_state_updates;
 }else if(ELEM(type,GHOST_kEventButtonDown,GHOST_kEventButtonUp)){
  const auto*bd=static_cast<const GHOST_TEventButtonData*>(customdata);
        /* Get value and type from GHOST.
       *
       * NOTE(@ideasman42): Unknown mouse buttons are treated as middle-mouse (historic stuff).
       * GHOST should never generate unknown events and this logic can probably be removed. */
      event.val = (type == GHOST_kEventButtonDown) ? KM_PRESS : KM_RELEASE;
      event.type = wm_event_type_from_ghost_button(bd->button, MIDDLEMOUSE);
      event.ipad_hud_generation = bd->ipad_hud_generation;
      event.ipad_hud_serial = bd->ipad_hud_serial;
#ifdef WITH_APPLE_CROSSPLATFORM
      event.ipad_pencil_paint_serial = bd->ipad_pencil_paint_serial;
      event.ipad_pencil_paint_generation = bd->ipad_pencil_paint_generation;
      event.ipad_pencil_paint_region = bd->ipad_pencil_paint_region;
      event.ipad_pencil_paint_origin_xy[0] = bd->ipad_pencil_paint_origin_x;
      event.ipad_pencil_paint_origin_xy[1] = bd->ipad_pencil_paint_origin_y;
      wm_cursor_position_from_ghost_screen_coords(
          win, &event.ipad_pencil_paint_origin_xy[0], &event.ipad_pencil_paint_origin_xy[1]);
      wm_stereo3d_mouse_offset_apply(win, event.ipad_pencil_paint_origin_xy);
      event.ipad_pencil_paint_down = ipad_pencil_dispatch_down;
      event.ipad_pencil_paint_phase = ipad_pencil_dispatch_phase;
#endif
      if (bd->is_direct_finger) event.flag |= WM_EVENT_IS_DIRECT_FINGER;
      if (bd->is_direct_tool) {
        event.flag |= WM_EVENT_IS_DIRECT_TOOL;
      }
      if (type == GHOST_kEventButtonUp && bd->is_cancelled) {
        event.flag |= WM_EVENT_IS_POINTER_CANCEL;
      }


  wm_tablet_data_from_ghost(&bd->tablet,&event.tablet);++shared_state_updates;
 }else if(type==GHOST_kEventTrackpad){
  const auto*pd=static_cast<const GHOST_TEventTrackpadData*>(customdata);
        int delta[2] = {pd->deltaX, -pd->deltaY};
      switch (pd->subtype) {
        case GHOST_kTrackpadEventMagnifyTouch:
          event.flag |= WM_EVENT_IS_TOUCH_PINCH;
          [[fallthrough]];
        case GHOST_kTrackpadEventMagnify:
          event.type = MOUSEZOOM;
          delta[0] = -delta[0];
          delta[1] = -delta[1];
          break;
        case GHOST_kTrackpadEventSmartMagnify:
          event.type = MOUSESMARTZOOM;
          break;
        case GHOST_kTrackpadEventRotate:
          event.type = MOUSEROTATE;
          break;
        case GHOST_kTrackpadEventScroll:
        default:
          event.type = MOUSEPAN;
          break;
      }

      copy_v2_v2_int(event.xy, &pd->x);
      wm_cursor_position_from_ghost_screen_coords(win, &event.xy[0], &event.xy[1]);
      copy_v2_v2_int(event_state->xy, event.xy);
      event.val = KM_NOTHING;

      /* The direction is inverted from the device due to system preferences. */
      if (pd->isDirectionInverted) {
        event.flag |= WM_EVENT_SCROLL_INVERT;
      }

      /* Distinguish between single finger and multi-finger events for iOS.*/
      if (pd->numFingers == 2) {
        event.flag |= WM_EVENT_MULTITOUCH_TWO_FINGERS;
      }
      else if (pd->numFingers == 3) {
        event.flag |= WM_EVENT_MULTITOUCH_THREE_FINGERS;
      }
#if !defined(WIN32) && !defined(__APPLE__)
      /* Ensure "auto" is used when supported. */
      char trackpad_scroll_direction = U.trackpad_scroll_direction;
      if ((WM_capabilities_flag() & WM_CAPABILITY_TRACKPAD_PHYSICAL_DIRECTION) == 0) {
        switch (eUserpref_TrackpadScrollDir(trackpad_scroll_direction)) {
          case USER_TRACKPAD_SCROLL_DIR_TRADITIONAL: {
            event.flag &= ~WM_EVENT_SCROLL_INVERT;
            break;
          }
          case USER_TRACKPAD_SCROLL_DIR_NATURAL: {
            event.flag |= WM_EVENT_SCROLL_INVERT;
            break;
          }
        }
      }
#endif


  wm_event_add_trackpad(win,&event,delta[0],delta[1]);return;
 }else return;
 (void)ipad_pencil_tagged;wm_event_add_intern(win,&event);
}
struct VPaintData {struct {Object*obact=nullptr;}vc;};
struct PaintStroke {int event_type=LEFTMOUSE;void*mode_data=nullptr;};
void*paint_stroke_mode_data(PaintStroke*stroke){return stroke->mode_data;}
int line_finalizers=0,done_calls=0,cache_frees=0,undo_restores=0,texture_exits=0,
 modal_releases=0,cancel_calls=0,reports=0,operator_frees=0,handler_frees=0,finished_calls=0;
std::vector<int>native_order;
namespace vertex {static void vpaint_stroke_done(const bContext*,PaintStroke*);}
namespace weight {static void wpaint_stroke_done(const bContext*,PaintStroke*);}
void stroke_done(bContext*C,wmOperator*op,PaintStroke*stroke){++done_calls;native_order.push_back(30);
 if(C->owner.values[9]==OB_MODE_VERTEX_PAINT)vertex::vpaint_stroke_done(C,stroke);
 if(C->owner.values[9]==OB_MODE_WEIGHT_PAINT)weight::wpaint_stroke_done(C,stroke);
 op->customdata=nullptr;}
void paint_stroke_line_constrain(PaintStroke*,float2&){}
void paint_stroke_line_end(bContext*,wmOperator*,PaintStroke*,float2){++line_finalizers;native_order.push_back(10);}
Depsgraph*CTX_data_depsgraph_pointer(const bContext*C){return C->depsgraph;}
Object*CTX_data_active_object(const bContext*C){return C->object;}
ToolSettings*CTX_data_tool_settings(const bContext*C){return C->settings;}
Brush*BKE_paint_brush_for_read(Paint*p){return p->brush;}
namespace bke::object {const bke::pbvh::Tree*pbvh_get(const Object&o){return &o.pbvh;}}
namespace bke::brush {bool supports_dyntopo(const Brush&b){return b.supports_dyntopo;}}
namespace blender::ed::sculpt_paint::undo {void restore_from_undo_step(const Depsgraph&,Sculpt&,Object&){++undo_restores;native_order.push_back(5);}}
void MEM_delete(StrokeCache*p){if(p){++cache_frees;native_order.push_back(20);delete p;}}
void brush_exit_tex(Sculpt&){++texture_exits;native_order.push_back(40);}
namespace vwpaint {void smooth_brush_toggle_off(Paint*,StrokeCache*cache){assert(cache);native_order.push_back(25);}}
void paint_stroke_cancel(bContext *C, wmOperator *op, PaintStroke *stroke)
{
  stroke_done(C, op, stroke);
}
namespace blender::ed::sculpt_paint::dyntopo {bool stroke_is_dyntopo(const Object &object, const Brush &brush)
{
  const SculptSession &ss = *object.sculpt;
  const bke::pbvh::Tree &pbvh = *bke::object::pbvh_get(object);
  return ((pbvh.type() == bke::pbvh::Type::BMesh) && (!ss.cache || (!ss.cache->alt_smooth)) &&
          /* Requires mesh restore, which doesn't work with
           * dynamic-topology. */
          !(brush.flag & BRUSH_ANCHORED) && !(brush.flag & BRUSH_DRAG_DOT) &&
          bke::brush::supports_dyntopo(brush));
}}
namespace blender::ed::sculpt_paint {static void sculpt_brush_stroke_cancel(bContext *C, wmOperator *op)
{
  using namespace blender::ed::sculpt_paint;
  const Depsgraph &depsgraph = *CTX_data_depsgraph_pointer(C);
  Object &ob = *CTX_data_active_object(C);
  SculptSession &ss = *ob.sculpt;
  Sculpt &sd = *CTX_data_tool_settings(C)->sculpt;
  const Brush &brush = *BKE_paint_brush_for_read(&sd.paint);

  /* XXX Canceling strokes that way does not work with dynamic topology,
   *     user will have to do real undo for now. See #46456. */
  if (ss.cache && !dyntopo::stroke_is_dyntopo(ob, brush)) {
    undo::restore_from_undo_step(depsgraph, sd, ob);
  }

  paint_stroke_cancel(C, op, static_cast<PaintStroke *>(op->customdata));

  MEM_delete(ss.cache);
  ss.cache = nullptr;

  brush_exit_tex(sd);
}}
namespace vertex {static void vpaint_stroke_done(const bContext *C, PaintStroke *stroke)
{
  VPaintData *vpd = static_cast<VPaintData *>(paint_stroke_mode_data(stroke));
  Object &ob = *vpd->vc.obact;

  SculptSession &ss = *ob.sculpt;

  if (ss.cache && ss.cache->alt_smooth) {
    ToolSettings *ts = CTX_data_tool_settings(C);
    VPaint &vp = *ts->vpaint;
    vwpaint::smooth_brush_toggle_off(&vp.paint, ss.cache);
  }

  WM_event_add_notifier(C, NC_OBJECT | ND_DRAW, &ob);

  MEM_delete(ob.sculpt->cache);
  ob.sculpt->cache = nullptr;
}
static void vpaint_cancel(bContext *C, wmOperator *op)
{
  paint_stroke_cancel(C, op, (PaintStroke *)op->customdata);
}}
namespace weight {static void wpaint_stroke_done(const bContext *C, PaintStroke * /*stroke*/)
{
  Object &ob = *CTX_data_active_object(C);

  SculptSession &ss = *ob.sculpt;

  if (ss.cache->alt_smooth) {
    ToolSettings &ts = *CTX_data_tool_settings(C);
    VPaint &vp = *ts.wpaint;
    vwpaint::smooth_brush_toggle_off(&vp.paint, ss.cache);
  }

  if (ob.particlesystem.first) {
    LISTBASE_FOREACH (ParticleSystem *, psys, &ob.particlesystem) {
      for (int i = 0; i < PSYS_TOT_VG; i++) {
        if (psys->vgroup[i] == BKE_object_defgroup_active_index_get(&ob)) {
          psys->recalc |= ID_RECALC_PSYS_RESET;
          break;
        }
      }
    }
  }

  DEG_id_tag_update((ID *)ob.data, 0);

  WM_event_add_notifier(C, NC_OBJECT | ND_DRAW, &ob);

  MEM_delete(ob.sculpt->cache);
  ob.sculpt->cache = nullptr;
}
static void wpaint_cancel(bContext *C, wmOperator *op)
{
  /* For a started stroke, wpaint_stroke_done restores the smooth brush and owns cache
   * cleanup. A refused start has not created a cache. Keep it alive through completion. */
  paint_stroke_cancel(C, op, (PaintStroke *)op->customdata);
}}
namespace texture {static void paint_cancel(bContext *C, wmOperator *op)
{
  paint_stroke_cancel(C, op, static_cast<PaintStroke *>(op->customdata));
}}
void native_modal_marker(){}
std::array<wmOperatorType,4>registered_types;
static const char *wm_ipad_pencil_paint_operator_id(const int mode)
{
  switch (mode) {
    case OB_MODE_SCULPT: return "SCULPT_OT_brush_stroke";
    case OB_MODE_VERTEX_PAINT: return "PAINT_OT_vertex_paint";
    case OB_MODE_WEIGHT_PAINT: return "PAINT_OT_weight_paint";
    case OB_MODE_TEXTURE_PAINT: return "PAINT_OT_image_paint";
    default: return nullptr;
  }
}
wmOperatorType*WM_operatortype_find(const char*name,bool){
 const std::array<const char*,4>names{"SCULPT_OT_brush_stroke","PAINT_OT_vertex_paint","PAINT_OT_weight_paint","PAINT_OT_image_paint"};
 for(size_t i=0;i<names.size();++i)if(name&&std::strcmp(names[i],name)==0)return &registered_types[i];return nullptr;}
static bool wm_ipad_pencil_paint_handler_registered(wmWindow *win,
                                                    const wmEventHandler_Op *handler)
{
  if (!win || !handler || !win->runtime || handler->head.type != WM_HANDLER_TYPE_OP ||
      (handler->head.flag & WM_HANDLER_DO_FREE) || handler->is_fileselect ||
      (handler->context.win && handler->context.win != win) ||
      BLI_findindex(&win->modalhandlers, &handler->head) == -1 ||
      !handler->ipad_pencil_operator_lifetime || !handler->ipad_pencil_type_lifetime ||
      !handler->ipad_pencil_type_address || !handler->ipad_pencil_screen_uid ||
      !handler->ipad_pencil_paint_mode || !handler->op ||
      !WM_operator_touch_lifetime_matches(handler->op, handler->ipad_pencil_operator_lifetime))
  {
    return false;
  }

  const char *idname = wm_ipad_pencil_paint_operator_id(handler->ipad_pencil_paint_mode);
  wmOperatorType *registered_type = idname ? WM_operatortype_find(idname, false) : nullptr;
  bScreen *screen = WM_window_get_active_screen(win);
  if (!registered_type || !screen || screen->id.session_uid != handler->ipad_pencil_screen_uid ||
      uintptr_t(registered_type) != handler->ipad_pencil_type_address ||
      registered_type->ipad_lifetime_id != handler->ipad_pencil_type_lifetime ||
      handler->op->type != registered_type || handler->op->opm || !registered_type->modal ||
      !registered_type->cancel)
  {
    return false;
  }

  bool found_context = false;
  LISTBASE_FOREACH (ScrArea *, area, &screen->areabase) {
    if (uintptr_t(area) != handler->ipad_pencil_area) continue;
    LISTBASE_FOREACH (ARegion *, region, &area->regionbase) {
      if (uintptr_t(region) == handler->ipad_pencil_region &&
          region->regiontype == RGN_TYPE_WINDOW && region->runtime && region->runtime->visible)
      {
        found_context = true;
        break;
      }
    }
    break;
  }
  return found_context;
}
static bool wm_ipad_pencil_paint_modal_owner_matches(
    bContext *C, wmWindow *win, const wmEventHandler_Op *handler, const bool teardown)
{
  if (!C || !win || !handler || CTX_wm_window(C) != win ||
      CTX_wm_area(C) != handler->context.area ||
      CTX_wm_region(C) != handler->context.region) return false;

  bScreen *screen = WM_window_get_active_screen(win);
  if (!screen || CTX_wm_screen(C) != screen ||
      screen->id.session_uid != handler->ipad_pencil_screen_uid) return false;

  ScrArea *owner_area = nullptr;
  ARegion *owner_region = nullptr;
  LISTBASE_FOREACH (ScrArea *, area, &screen->areabase) {
    if (uintptr_t(area) != handler->ipad_pencil_area) continue;
    owner_area = area;
    LISTBASE_FOREACH (ARegion *, region, &area->regionbase) {
      if (uintptr_t(region) == handler->ipad_pencil_region) {
        owner_region = region;
        break;
      }
    }
    break;
  }
  if (!owner_area || owner_area->spacetype != SPACE_VIEW3D || !owner_region ||
      !owner_region->runtime || owner_region->regiontype != RGN_TYPE_WINDOW ||
      !owner_region->runtime->visible)
  {
    return false;
  }
  /* A live region being torn down can already be hidden, too small, poll-failed, or
   * have lost its canvas geometry. Only the explicit teardown path may ignore those
   * presentation flags; keep every original typed owner and lifetime check below. */
  if (!teardown &&
      (!owner_region->runtime->ipad_canvas ||
       (owner_region->flag & (RGN_FLAG_HIDDEN | RGN_FLAG_TOO_SMALL | RGN_FLAG_POLL_FAILED))))
  {
    return false;
  }

  IPadFingerPaintOwner current;
  if (!ED_ipad_finger_paint_capture(C, current) ||
      int(current.values[9]) != handler->ipad_pencil_paint_mode) return false;
  for (int i = 0; i <= 12; i++) {
    if (handler->ipad_pencil_owner_values[i] != current.values[i]) return false;
  }
  for (int i : {17, 18}) {
    if (handler->ipad_pencil_owner_values[i] != current.values[i]) return false;
  }
  return std::strcmp(handler->ipad_pencil_owner_tool, current.tool.data()) == 0;
}
enum class eIPadPencilPaintModalEvent:uint8_t{OwnedContact,StaleContact,Timer,Interrupt};
enum class eIPadPencilPaintModalAdmission:uint8_t{Dispatch,Consume,Cancel};
static bool wm_ipad_pencil_paint_event_matches_handler(
    const wmEvent *event, const wmEventHandler_Op *handler)
{
  return event && handler && event->ipad_pencil_paint_down &&
         ELEM(event->ipad_pencil_paint_phase,
              WM_PENCIL_PAINT_PHASE_MOTION,
              WM_PENCIL_PAINT_PHASE_END) &&
         handler->ipad_pencil_paint_serial == event->ipad_pencil_paint_serial &&
         handler->ipad_pencil_paint_generation == event->ipad_pencil_paint_generation &&
         handler->ipad_pencil_region == event->ipad_pencil_paint_region &&
         handler->ipad_pencil_origin_x == event->ipad_pencil_paint_origin_xy[0] &&
         handler->ipad_pencil_origin_y == event->ipad_pencil_paint_origin_xy[1];
}
static eIPadPencilPaintModalEvent wm_ipad_pencil_paint_modal_event_classify(
    const wmEvent *event, const wmEventHandler_Op *handler)
{
  if (wm_ipad_pencil_paint_event_matches_handler(event, handler)) {
    return eIPadPencilPaintModalEvent::OwnedContact;
  }
  if (event && handler && event->ipad_pencil_paint_serial &&
      event->ipad_pencil_paint_serial <= handler->ipad_pencil_paint_serial)
  {
    /* A delayed or malformed old contact must never end the current stroke. */
    return eIPadPencilPaintModalEvent::StaleContact;
  }
  return event && ISTIMER(event->type) ? eIPadPencilPaintModalEvent::Timer :
                                        eIPadPencilPaintModalEvent::Interrupt;
}
static eIPadPencilPaintModalAdmission wm_ipad_pencil_paint_modal_admit(
    bContext *C,
    wmWindow *win,
    const wmEvent *event,
    const wmEventHandler_Op *handler,
    const bool teardown = false)
{
  const eIPadPencilPaintModalEvent contact_event =
      wm_ipad_pencil_paint_modal_event_classify(event, handler);
  if (contact_event == eIPadPencilPaintModalEvent::StaleContact) {
    return eIPadPencilPaintModalAdmission::Consume;
  }
  if (!wm_ipad_pencil_paint_handler_registered(win, handler) ||
      !wm_ipad_pencil_paint_modal_owner_matches(C, win, handler, teardown))
  {
    return eIPadPencilPaintModalAdmission::Consume;
  }
  if (contact_event == eIPadPencilPaintModalEvent::Interrupt) {
    return eIPadPencilPaintModalAdmission::Cancel;
  }
  return eIPadPencilPaintModalAdmission::Dispatch;
}
static void wm_ipad_pencil_paint_cancelled_contact_mark(
    wmWindow *win, const wmEventHandler_Op *handler)
{
  if (!win || !win->runtime || !handler || !handler->ipad_pencil_paint_serial ||
      !handler->ipad_pencil_paint_generation)
  {
    return;
  }
  auto *runtime = win->runtime;
  runtime->ipad_pencil_paint_cancelled_serial = handler->ipad_pencil_paint_serial;
  runtime->ipad_pencil_paint_cancelled_generation = handler->ipad_pencil_paint_generation;
}
static bool wm_ipad_pencil_paint_cancelled_contact_consume(
    wmWindow *win, const wmEvent *event)
{
  if (!win || !win->runtime || !event || !event->ipad_pencil_paint_down ||
      !event->ipad_pencil_paint_serial ||
      !ELEM(event->ipad_pencil_paint_phase,
            WM_PENCIL_PAINT_PHASE_BEGIN,
            WM_PENCIL_PAINT_PHASE_MOTION,
            WM_PENCIL_PAINT_PHASE_END))
  {
    return false;
  }
  auto *runtime = win->runtime;
  if (runtime->ipad_pencil_paint_cancelled_serial != event->ipad_pencil_paint_serial ||
      runtime->ipad_pencil_paint_cancelled_generation != event->ipad_pencil_paint_generation)
  {
    return false;
  }
  if (event->ipad_pencil_paint_phase == WM_PENCIL_PAINT_PHASE_END) {
    runtime->ipad_pencil_paint_cancelled_serial = 0;
    runtime->ipad_pencil_paint_cancelled_generation = 0;
  }
  return true;
}
wmOperatorStatus native_release(bContext*C,wmOperator*op,const wmEvent*event,PaintStroke**stroke_p){
 auto*stroke=*stroke_p;bool first_modal=false;  float2 mouse;
  if (event->type == stroke->event_type && !first_modal) {
    if (event->val == KM_RELEASE) {
      mouse = {float(event->mval[0]), float(event->mval[1])};
      paint_stroke_line_constrain(stroke, mouse);
      paint_stroke_line_end(C, op, stroke, mouse);
      stroke_done(C, op, stroke);
      *stroke_p = nullptr;
      return OPERATOR_FINISHED;
    }
  }
 return OPERATOR_RUNNING_MODAL;}
void wm_operator_reports(bContext*,wmOperator*,int,bool){++reports;native_order.push_back(50);}
void WM_window_status_area_tag_redraw(wmWindow*){}
intptr_t wm_operator_undo_active_id(wmWindowManager*wm){return wm->undo_id;}
intptr_t wm_operator_register_active_id(wmWindowManager*wm){return wm->register_id;}
// The native finished body owns registration/history/possible free. Model only
// the call boundary; this fixture makes no claim about its storage/history effects.
void wm_operator_finished(bContext*C,wmOperator*op,bool repeat,bool store,
                          bool has_undo_step,bool has_register){
 assert(C->manager->op_undo_depth==0&&!op->freed&&!op->finished&&!op->customdata);
 assert(!repeat&&store&&!has_undo_step&&!has_register);
 op->finished=true;++finished_calls;native_order.push_back(55);
}
void WM_operator_free(wmOperator*op){assert(!op->freed);op->freed=true;++operator_frees;native_order.push_back(60);}
void WM_cursor_grab_disable(wmWindow*,void*){}
void BLI_remlink(List<wmEventHandler>*list,void*item){auto*h=static_cast<wmEventHandler*>(item);
 auto i=std::find(list->items.begin(),list->items.end(),h);assert(i!=list->items.end());list->items.erase(i);native_order.push_back(70);}
void wm_event_free_handler(wmEventHandler*h){h->freed=true;++handler_frees;native_order.push_back(80);}
int consume_native(bContext*C,wmWindow*win,wmEventHandler_Op*handler,wmEvent*event){
 if(wm_ipad_pencil_paint_cancelled_contact_consume(win,event))return WM_HANDLER_HANDLED;
 const auto admission=wm_ipad_pencil_paint_modal_admit(C,win,event,handler);
 if(admission==eIPadPencilPaintModalAdmission::Consume)return WM_HANDLER_HANDLED;
 wmOperator*op=handler->op;wmOperatorType*ot=op->type;wmWindowManager*wm=CTX_wm_manager(C);
 auto*handlers=&win->modalhandlers;bool ipad_pencil_paint_interrupt=false;
 ipad_pencil_paint_interrupt =
            admission == eIPadPencilPaintModalAdmission::Cancel ||
            (admission == eIPadPencilPaintModalAdmission::Dispatch && event &&
             (event->flag & WM_EVENT_IS_POINTER_CANCEL));
 int retval=OPERATOR_RUNNING_MODAL;
 const intptr_t undo_id_prev=wm_operator_undo_active_id(wm);
 const intptr_t register_id_prev=wm_operator_register_active_id(wm);
 if (ot->flag & OPTYPE_UNDO) {
        wm->op_undo_depth++;
      }
 if (ipad_pencil_paint_interrupt) {
#ifdef WITH_APPLE_CROSSPLATFORM
        if (handler->ipad_pencil_paint_serial) {
          wm_ipad_pencil_paint_cancelled_contact_mark(win, handler);
        }
#endif
        ot->cancel(C, op);
        retval = OPERATOR_CANCELLED | OPERATOR_PASS_THROUGH;
      }
 if(!ipad_pencil_paint_interrupt){
  if(event->type==LEFTMOUSE&&event->val==KM_RELEASE){++modal_releases;auto*stroke=static_cast<PaintStroke*>(op->customdata);
   retval=native_release(C,op,event,&stroke);op->customdata=stroke;}
 }
 else ++cancel_calls;
 if (ot->flag & OPTYPE_UNDO && CTX_wm_manager(C) == wm) {
        wm->op_undo_depth--;
      }
 if (retval & (OPERATOR_CANCELLED | OPERATOR_FINISHED)) {
          wm_operator_reports(C, op, retval, false);

          wmOperator *op_test = handler->op->opm ? handler->op->opm : handler->op;
          if (op_test->type->modalkeymap) {
            WM_window_status_area_tag_redraw(win);
          }
        }
 if (retval & OPERATOR_FINISHED) {
          const bool has_undo_step = (undo_id_prev != wm_operator_undo_active_id(wm));
          const bool has_register = (register_id_prev != wm_operator_register_active_id(wm));

          wm_operator_finished(C, op, false, true, has_undo_step, has_register);
          handler->op = nullptr;
        }
 else if (retval & (OPERATOR_CANCELLED | OPERATOR_FINISHED)) {
          WM_operator_free(op);
          handler->op = nullptr;
        }
 if (retval & (OPERATOR_CANCELLED | OPERATOR_FINISHED)) {
          WM_cursor_grab_disable(CTX_wm_window(C), nullptr);

          BLI_remlink(handlers, handler);
          wm_event_free_handler(&handler->head);

          /* Prevent silly errors from operator users. */
          // retval &= ~OPERATOR_PASS_THROUGH;
        }
 return retval;
}

struct Fixture {
 Runtime runtime;wmWindowManager manager;ARegionRuntime rr;ARegion region{RGN_TYPE_WINDOW,0,&rr};
 ScrArea area;bScreen screen;wmWindow win{&runtime,&ghost_window};bContext C;
 SculptSession session;Object object{&session};Depsgraph depsgraph;Brush brush;Sculpt sculpt{{&brush}};
 ToolSettings settings{&sculpt};VPaint vpaint,wpaint;VPaintData vpaint_data;PaintStroke stroke;wmOperator op;wmEventHandler_Op owner;
 Sender sender;int mode;
 Fixture(int selected=OB_MODE_SCULPT):mode(selected){
  system_owner.clear();wm_queue.clear();ring_packets.clear();native_order.clear();pan_gesture_recognizer=&sender;
  pencil_paint_enqueued={};pencil_paint_enqueued_down=false;pencil_paint_retired_serial=0;
  pointer_capture={};pointer_hud_contact={};ring_capture={};pointer_finger_contact=false;
  mouse_left_pressed=mouse_middle_pressed=mouse_right_pressed=flythrough=false;
  line_finalizers=done_calls=cache_frees=undo_restores=texture_exits=modal_releases=cancel_calls=0;
  reports=operator_frees=handler_frees=shared_state_updates=finished_calls=0;
  ghost::ios::navigation_regions.clear();ghost::ios::finger_paint_regions.clear();
  ghost::ios::pencil_ring_presentations.clear();
  registered_types={};registered_types[0].cancel=blender::ed::sculpt_paint::sculpt_brush_stroke_cancel;
  registered_types[1].cancel=vertex::vpaint_cancel;registered_types[2].cancel=weight::wpaint_cancel;
  registered_types[3].cancel=texture::paint_cancel;
  for(auto&t:registered_types)t.modal=native_modal_marker;
  area.regionbase.add(&region);screen.areabase.add(&area);win.screen=&screen;
  C.win=&win;C.manager=&manager;C.area=&area;C.region=&region;C.screen=&screen;
  C.object=&object;C.depsgraph=&depsgraph;C.settings=&settings;
  settings.vpaint=&vpaint;settings.wpaint=&wpaint;vpaint_data.vc.obact=&object;stroke.mode_data=&vpaint_data;
  C.owner.values[9]=mode;std::strcpy(C.owner.tool.data(),"builtin_brush.Draw");
  auto index=mode==OB_MODE_SCULPT?0:mode==OB_MODE_VERTEX_PAINT?1:mode==OB_MODE_WEIGHT_PAINT?2:3;
  op.type=&registered_types[index];op.customdata=&stroke;session.cache=new StrokeCache;
  present(71);sender.contact=ghost::ios::pencil_paint_at_start(window,100,100,41);
  assert(sender.contact.valid());owner.op=&op;owner.context.area=&area;owner.context.region=&region;
  owner.ipad_pencil_type_address=uintptr_t(op.type);owner.ipad_pencil_area=uintptr_t(&area);
  owner.ipad_pencil_region=uintptr_t(&region);owner.ipad_pencil_paint_mode=mode;
  for(int i=0;i<19;++i)owner.ipad_pencil_owner_values[i]=C.owner.values[i];
  std::strcpy(owner.ipad_pencil_owner_tool,C.owner.tool.data());win.modalhandlers.add(&owner.head);
 }
 ~Fixture(){system_owner.clear();if(session.cache)delete session.cache;}
 void present(uint64_t generation){ghost::ios::set_finger_paint_regions(window,{{{0,0,700,700},generation,uintptr_t(&region)}});}
 void expire(){ghost::ios::set_finger_paint_regions(window,{});}
 void action(int state,CGPoint point={114,102},CGPoint translation={14,2}){
  sender.state=state;sender.touch_point=point;sender.translation=translation;producer(sender);}
 void transfer(){for(auto*packet:system_owner.queue)queue_native(&win,packet);system_owner.clear();}
 void bind(){
  // Initial native modal admission/brush allocation is the explicit setup boundary.
  // Queue receipt, tuple/lifetime/context registration and subsequent policy are real.
  assert(wm_queue.size()==2);const auto&begin=wm_queue.back();
  assert(begin.type==LEFTMOUSE&&begin.val==KM_PRESS&&begin.ipad_pencil_paint_down);
  assert(begin.ipad_pencil_paint_phase==WM_PENCIL_PAINT_PHASE_BEGIN);
  owner.ipad_pencil_paint_serial=begin.ipad_pencil_paint_serial;
  owner.ipad_pencil_paint_generation=begin.ipad_pencil_paint_generation;
  owner.ipad_pencil_origin_x=begin.ipad_pencil_paint_origin_xy[0];
  owner.ipad_pencil_origin_y=begin.ipad_pencil_paint_origin_xy[1];
  assert(wm_ipad_pencil_paint_handler_registered(&win,&owner));
  assert(wm_ipad_pencil_paint_modal_owner_matches(&C,&win,&owner,false));
  wm_queue.clear();
 }
 void begin(){action(UIGestureRecognizerStateBegan,{110,100},{10,0});
  assert(system_owner.queue.size()==2&&pencil_paint_enqueued_down);transfer();bind();}
 void dispatch(){for(auto&event:wm_queue)consume_native(&C,&win,&owner,&event);wm_queue.clear();}
 void check_packet(GHOST_Event*packet,bool cancel=false){
  if(packet->type==GHOST_kEventCursorMove){auto*d=static_cast<GHOST_TEventCursorData*>(packet->data_);
   assert(d->ipad_pencil_paint_serial==sender.contact.serial&&d->ipad_pencil_paint_generation==sender.contact.generation);
   assert(d->ipad_pencil_paint_region==sender.contact.region&&d->ipad_pencil_paint_origin_x==100&&d->ipad_pencil_paint_origin_y==100);
   assert(d->tablet.Active==GHOST_kTabletModeStylus&&d->tablet.Pressure==sender.sample.pressure&&d->tablet.Xtilt==sender.sample.xtilt);
  }else{auto*d=static_cast<GHOST_TEventButtonData*>(packet->data_);assert(d->is_cancelled==cancel);
   assert(d->ipad_pencil_paint_serial==sender.contact.serial&&d->ipad_pencil_paint_generation==sender.contact.generation);
   assert(d->ipad_pencil_paint_region==sender.contact.region&&d->ipad_pencil_paint_origin_x==100&&d->ipad_pencil_paint_origin_y==100);
   assert(d->tablet.Pressure==sender.sample.pressure&&d->tablet.Ytilt==sender.sample.ytilt);}
 }
 void check_cleanup(){assert(reports==1&&operator_frees==1&&handler_frees==1&&op.freed&&owner.head.freed&&finished_calls==0&&!op.finished);
  assert(owner.op==nullptr&&win.modalhandlers.items.empty()&&manager.op_undo_depth==0);
  assert(native_order.size()>=4);auto end=native_order.end();assert(std::vector<int>(end-4,end)==std::vector<int>({50,60,70,80}));}
 void check_finished(){assert(reports==1&&finished_calls==1&&operator_frees==0&&!op.freed&&op.finished&&handler_frees==1&&owner.head.freed);
  assert(owner.op==nullptr&&win.modalhandlers.items.empty()&&manager.op_undo_depth==0);
  assert(native_order.size()>=4);auto end=native_order.end();assert(std::vector<int>(end-4,end)==std::vector<int>({50,55,70,80}));}
};

void movement(){Fixture f;f.begin();
 for(auto translation:{CGPoint{14,2},CGPoint{14,2},CGPoint{21,-3}}){
  f.sender.sample={true,translation.x==14?.2f:0.f,.3f,-.4f};
  f.action(UIGestureRecognizerStateChanged,{100+translation.x,100+translation.y},translation);
  assert(system_owner.queue.size()==1&&system_owner.queue[0]->type==GHOST_kEventCursorMove);
  f.check_packet(system_owner.queue[0]);assert(f.sender.cached.x==translation.x&&f.sender.cached.y==translation.y);
  f.transfer();assert(wm_queue.size()==1&&wm_queue[0].type==MOUSEMOVE);
  assert(wm_queue[0].ipad_pencil_paint_down&&wm_queue[0].ipad_pencil_paint_phase==WM_PENCIL_PAINT_PHASE_MOTION);
  assert(wm_queue[0].ipad_pencil_paint_origin_xy[0]==105&&wm_queue[0].ipad_pencil_paint_origin_xy[1]==800);
  f.dispatch();assert(!cancel_calls&&!done_calls&&!line_finalizers&&!modal_releases);}
 f.action(UIGestureRecognizerStateEnded);assert(system_owner.queue.size()==1);f.check_packet(system_owner.queue[0]);
 f.transfer();f.dispatch();assert(modal_releases==1&&line_finalizers==1&&done_calls==1&&!cancel_calls);f.check_finished();}

void terminal(int state,int mode,bool expired,bool dyntopo=false){Fixture f(mode);f.begin();
 if(expired)f.expire();if(dyntopo){f.object.pbvh.value=bke::pbvh::Type::BMesh;f.brush.supports_dyntopo=true;}
 if(mode==OB_MODE_VERTEX_PAINT||mode==OB_MODE_WEIGHT_PAINT)f.session.cache->alt_smooth=true;
 f.action(state);assert(system_owner.queue.size()==1&&system_owner.queue[0]->type==GHOST_kEventButtonUp);
 bool cancelled=state!=UIGestureRecognizerStateEnded;f.check_packet(system_owner.queue[0],cancelled);
 assert(!pencil_paint_enqueued_down&&pencil_paint_retired_serial==41);
 f.transfer();assert(wm_queue.size()==1&&wm_queue[0].ipad_pencil_paint_phase==WM_PENCIL_PAINT_PHASE_END);
 assert(bool(wm_queue[0].flag&WM_EVENT_IS_POINTER_CANCEL)==cancelled);f.dispatch();
 if(cancelled)f.check_cleanup();else f.check_finished();
 if(cancelled){assert(cancel_calls==1&&!modal_releases&&!line_finalizers&&done_calls==1);
  if(mode==OB_MODE_SCULPT){assert(undo_restores==!dyntopo&&cache_frees==1&&texture_exits==1);
   assert(native_order[dyntopo?0:1]==30&&native_order[dyntopo?1:2]==20&&native_order[dyntopo?2:3]==40);}
  else if(mode==OB_MODE_VERTEX_PAINT||mode==OB_MODE_WEIGHT_PAINT){assert(cache_frees==1&&native_order[0]==30&&native_order[1]==25&&native_order[2]==20);}
  else assert(cache_frees==0&&native_order[0]==30);
 }else assert(!cancel_calls&&modal_releases==1&&line_finalizers==1&&done_calls==1);
 f.action(state);f.action(UIGestureRecognizerStateChanged,{125,101},{25,1});assert(system_owner.queue.empty());}

void expiry(){for(int state:{UIGestureRecognizerStateEnded,UIGestureRecognizerStateCancelled,UIGestureRecognizerStateFailed}){
 Fixture f;f.begin();f.expire();f.action(UIGestureRecognizerStateChanged);assert(system_owner.queue.size()==1);
 f.transfer();f.dispatch();assert(!cancel_calls);f.action(state);assert(system_owner.queue.size()==1);f.transfer();f.dispatch();assert(done_calls==1);}
 for(int state:{UIGestureRecognizerStateEnded,UIGestureRecognizerStateCancelled,UIGestureRecognizerStateFailed}){
 Fixture f;f.expire();f.action(UIGestureRecognizerStateBegan);assert(system_owner.queue.empty()&&!pencil_paint_enqueued_down);
 f.action(UIGestureRecognizerStateChanged);f.action(state);assert(system_owner.queue.empty());
 assert(!shared_state_updates&&!cancel_calls&&!done_calls);}
 {Fixture f;f.action(UIGestureRecognizerStateFailed);assert(system_owner.queue.empty());}}

void expiry_between_native_enqueues(){Fixture f;
 f.action(UIGestureRecognizerStateBegan);assert(system_owner.queue.size()==2);
 queue_native(&f.win,system_owner.queue[0]);assert(wm_queue.size()==1);
 f.expire();queue_native(&f.win,system_owner.queue[1]);system_owner.clear();
 assert(wm_queue.size()==1&&!f.runtime.ipad_pencil_paint_queued_down&&f.runtime.ipad_pencil_paint_retired_serial==41);
 wm_queue.clear();f.action(UIGestureRecognizerStateCancelled);f.transfer();assert(wm_queue.empty());
 assert(!cancel_calls&&!modal_releases&&!done_calls);}

void tuple_mismatch(){for(int field=0;field<5;++field){Fixture f;f.begin();auto original=f.sender.contact;
 switch(field){case 0:++f.sender.contact.serial;break;case 1:++f.sender.contact.generation;break;
 case 2:++f.sender.contact.region;break;case 3:++f.sender.contact.origin_x;break;case 4:++f.sender.contact.origin_y;break;}
 f.action(UIGestureRecognizerStateChanged);f.action(UIGestureRecognizerStateCancelled);assert(system_owner.queue.empty());
 assert(pencil_paint_enqueued_down&&ghost::ios::pencil_paint_contact_equal(pencil_paint_enqueued,original));
 assert(f.runtime.ipad_pencil_paint_queued_down&&!cancel_calls);
 f.sender.contact=original;f.action(UIGestureRecognizerStateEnded);f.transfer();f.dispatch();assert(done_calls==1&&!cancel_calls);}}

void replacement(){Fixture f;f.begin();auto old=f.sender.contact;
 f.action(UIGestureRecognizerStateCancelled);f.transfer();f.dispatch();assert(cancel_calls==1);
 // New generator lease; a separate native initial admission is not needed to
 // prove old producer packets cannot enter this replacement queue lease.
 f.present(72);f.sender.contact=ghost::ios::pencil_paint_at_start(window,100,100,42);
 f.action(UIGestureRecognizerStateBegan,{110,100},{10,0});f.transfer();assert(f.runtime.ipad_pencil_paint_queued_serial==42);
 f.owner.head.freed=false;f.owner.head.flag=0;f.op.freed=false;f.op.customdata=&f.stroke;
 ++f.op.lifetime;f.owner.ipad_pencil_operator_lifetime=f.op.lifetime;f.owner.op=&f.op;
 f.session.cache=new StrokeCache;f.win.modalhandlers.add(&f.owner.head);f.bind();
 auto replacement_contact=f.sender.contact;f.sender.contact=old;
 f.action(UIGestureRecognizerStateChanged);f.action(UIGestureRecognizerStateEnded);f.action(UIGestureRecognizerStateFailed);
 assert(system_owner.queue.empty()&&pencil_paint_enqueued.serial==42&&pencil_paint_enqueued_down);
 assert(f.runtime.ipad_pencil_paint_queued_serial==42&&f.runtime.ipad_pencil_paint_queued_down&&cancel_calls==1);
 f.sender.contact=replacement_contact;f.action(UIGestureRecognizerStateEnded);f.transfer();assert(wm_queue.size()==1);
 f.dispatch();assert(cancel_calls==1&&modal_releases==1&&line_finalizers==1&&done_calls==2&&operator_frees==1&&finished_calls==1&&handler_frees==2);}

void capture_cancel(){Fixture f;f.begin();f.action(UIGestureRecognizerStateChanged,{123,104},{23,4});
 f.transfer();f.dispatch();auto sample=f.sender.sample;f.expire();tablet_data.Pressure=.99f;
 cancel_capture();assert(system_owner.queue.size()==1);f.check_packet(system_owner.queue[0],true);
 assert(!f.sender.touchStreamAllowed());
 f.transfer();f.dispatch();assert(cancel_calls==1&&!modal_releases&&!line_finalizers&&done_calls==1);f.check_cleanup();
 assert(pencil_paint_last_location.x==123&&pencil_paint_last_tablet.Pressure==sample.pressure);
 cancel_capture();f.action(UIGestureRecognizerStateChanged);f.action(UIGestureRecognizerStateCancelled);f.action(UIGestureRecognizerStateEnded);
 assert(system_owner.queue.empty()&&cancel_calls==1);}

void owner_guards(){for(int mutation=0;mutation<10;++mutation){Fixture f;f.begin();f.action(UIGestureRecognizerStateCancelled);f.transfer();
 switch(mutation){case 0:f.win.modalhandlers.items.clear();break;case 1:++f.op.lifetime;break;
 case 2:++f.op.type->ipad_lifetime_id;break;case 3:f.owner.head.flag=WM_HANDLER_DO_FREE;break;
 case 4:f.C.owner.values[17]++;break;case 5:f.C.owner.values[9]=99;break;
 case 6:f.C.owner.tool[0]='X';break;case 7:f.rr.visible=false;break;
 case 8:f.region.runtime=nullptr;break;case 9:++f.screen.id.session_uid;break;}
 f.dispatch();assert(!cancel_calls&&!modal_releases&&!done_calls&&!operator_frees);}}

void untagged_and_finger(){for(bool pencil:{false,true})for(bool fly:{false,true}){
 Fixture f;f.sender.contact={};f.sender.pencil=pencil;flythrough=fly;
 f.action(UIGestureRecognizerStateBegan,{110,100},{10,0});assert(system_owner.queue.size()==(pencil?2:1));system_owner.clear();
 f.action(UIGestureRecognizerStateChanged,{115,103},{15,3});assert(system_owner.queue.size()==(pencil?2:1));
 auto*pan=system_owner.queue[0];assert(pan->type==GHOST_kEventTrackpad);
 auto*d=static_cast<GHOST_TEventTrackpadData*>(pan->data_);assert(d->subtype==GHOST_kTrackpadEventScroll);
 assert(d->numFingers==(!pencil&&fly?2:1)&&d->isDirectionInverted==(!pencil&&fly));
 assert(d->deltaX==5&&d->deltaY==3);assert(d->x==(!pencil&&!fly?100:115));
 if(pencil){auto*cursor=static_cast<GHOST_TEventCursorData*>(system_owner.queue[1]->data_);assert(cursor->tablet.Pressure==.4f&&!cursor->ipad_pencil_paint_serial);}
 system_owner.clear();f.action(UIGestureRecognizerStateCancelled);assert(system_owner.queue.size()==1);
 if(pencil)assert(!static_cast<GHOST_TEventButtonData*>(system_owner.queue[0]->data_)->is_cancelled);
 else assert(system_owner.queue[0]->type==GHOST_kEventCursorMove);
 }}

void native_navigation(){Fixture f;f.begin();CGPoint point{50,60},delta{5,-2};CGFloat distance=7;
 for(auto kind:{UserInputEvent::PAN_GESTURE,UserInputEvent::PAN_GESTURE_TWO_FINGERS,
                UserInputEvent::PAN_GESTURE_THREE_FINGERS,UserInputEvent::PINCH_GESTURE}){
  for(bool direct:{false,true}){UserInputEvent evt(&point,&delta,&distance,false);evt.direct_touch=direct;evt.add_event(kind);
   generateUserInputEvents(evt);assert(!system_owner.queue.empty());
   auto*pan=system_owner.queue[kind==UserInputEvent::PAN_GESTURE_THREE_FINGERS?1:0];assert(pan->type==GHOST_kEventTrackpad);
   auto*d=static_cast<GHOST_TEventTrackpadData*>(pan->data_);
   assert(d->subtype==(kind==UserInputEvent::PINCH_GESTURE?(direct?GHOST_kTrackpadEventMagnifyTouch:GHOST_kTrackpadEventMagnify):GHOST_kTrackpadEventScroll));
   if(kind==UserInputEvent::PAN_GESTURE_THREE_FINGERS){assert(system_owner.queue.size()==3);
    assert(system_owner.queue[0]->type==GHOST_kEventKeyDown&&system_owner.queue[2]->type==GHOST_kEventKeyUp);}
   f.transfer();assert(wm_queue.size()==1&&!wm_queue[0].ipad_pencil_paint_serial);
   auto admission=wm_ipad_pencil_paint_modal_admit(&f.C,&f.win,&wm_queue[0],&f.owner);
   assert(admission==eIPadPencilPaintModalAdmission::Cancel);
   if(kind==UserInputEvent::PINCH_GESTURE)assert(bool(wm_queue[0].flag&WM_EVENT_IS_TOUCH_PINCH)==direct);
   wm_queue.clear();}}
 // One independent hardware/navigation packet retains the real interrupt path.
 wmEvent hardware;hardware.type=MOUSEPAN;consume_native(&f.C,&f.win,&f.owner,&hardware);
 assert(cancel_calls==1&&!modal_releases&&!line_finalizers);f.check_cleanup();}

void early_routes(){
 {Fixture f;f.sender.invalidateTouchStream();f.action(UIGestureRecognizerStateBegan);assert(system_owner.queue.empty());}
 for(int button=0;button<3;++button){Fixture f;mouse_left_pressed=button==0;mouse_middle_pressed=button==1;mouse_right_pressed=button==2;
  f.action(UIGestureRecognizerStateBegan);assert(system_owner.queue.empty()&&pointer_capture.ended);}
 {Fixture f;f.sender.ring.captured=true;f.sender.ring.origin_x=100;f.sender.ring.origin_y=100;
  f.action(UIGestureRecognizerStateBegan);f.action(UIGestureRecognizerStateChanged);f.action(UIGestureRecognizerStateCancelled);
  assert(system_owner.queue.empty()&&ring_packets==std::vector<int>({GHOST_kPencilRingBegin,GHOST_kPencilRingMotion,GHOST_kPencilRingMotion,GHOST_kPencilRingCancel}));}
 for(bool tool:{false,true}){Fixture f;
  ghost::ios::NavigationRect rect{0,0,700,700};rect.kind=tool?ghost::ios::PointerCaptureKind::ToolManipulation:ghost::ios::PointerCaptureKind::Navigation;
  ghost::ios::set_navigation_regions(window,{rect});f.sender.contact={};
  if(!tool)f.sender.hud={8,9,100,100};
  f.action(UIGestureRecognizerStateBegan);assert(system_owner.queue.size()==3);system_owner.clear();
  f.action(UIGestureRecognizerStateChanged);assert(system_owner.queue.size()==1&&system_owner.queue[0]->type==GHOST_kEventCursorMove);system_owner.clear();
  f.action(UIGestureRecognizerStateCancelled);assert(system_owner.queue.size()==2);
  auto*d=static_cast<GHOST_TEventButtonData*>(system_owner.queue.back()->data_);assert(d->is_cancelled&&d->is_direct_tool==tool);
  if(!tool)assert(d->ipad_hud_generation==8&&d->ipad_hud_serial==9);
 }}

int retained_fixture_main(int argc,char**argv){assert(argc>=2);std::string name=argv[1];
 if(name=="movement")movement();else if(name=="expiry")expiry();else if(name=="mid_enqueue_expiry")expiry_between_native_enqueues();
 else if(name=="tuple")tuple_mismatch();else if(name=="replacement")replacement();else if(name=="capture")capture_cancel();
 else if(name=="owner")owner_guards();else if(name=="untagged")untagged_and_finger();
 else if(name=="navigation")native_navigation();else if(name=="early")early_routes();
 else if(name=="terminal"){assert(argc==6);terminal(std::stoi(argv[2]),std::stoi(argv[3]),std::stoi(argv[4]),std::stoi(argv[5]));}
 else assert(false);std::cout<<"PASS "<<name<<"\n";system_owner.clear();}

enum {WHEELUPMOUSE=200,WHEELDOWNMOUSE,NDOF_MOTION,VIEW_CONFIRM,VIEW_PASS,USER_ZOOM_CONTINUE,USER_ZOOM_SCALE,USER_ZOOM_DOLLY,USER_ZOOM_HORIZ=1,USER_ZOOM_INVERT=2,VIEWOPS_FLAG_ZOOM_TO_MOUSE=4,RV3D_CAMOB=10,RV3D_BOXVIEW=1};
using eViewZoom_Style=int;using eV3D_OpEvent=int;
#define UI_SCALE_FAC 1.0f
#define CLAMP(v,lo,hi) ((v)=std::clamp((v),(lo),(hi)))
#define RV3D_LOCK_FLAGS(v) 0
float max_ff(float a,float b){return std::max(a,b);}float len_v2v2_int(const int*a,const int*b){return std::hypot(float(a[0]-b[0]),float(a[1]-b[1]));}
int BLI_rcti_cent_x(const rcti*r){return (r->xmin+r->xmax)/2;}int BLI_rcti_cent_y(const rcti*r){return (r->ymin+r->ymax)/2;}
void negate_v3_v3(float*a,const float*b){for(int i=0;i<3;++i)a[i]=-b[i];}void negate_v3(float*a){for(int i=0;i<3;++i)a[i]=-a[i];}
void add_v3_v3v3(float*a,const float*b,const float*c){for(int i=0;i<3;++i)a[i]=b[i]+c[i];}void copy_v3_v3(float*a,const float*b){for(int i=0;i<3;++i)a[i]=b[i];}
void madd_v3_v3v3fl(float*a,const float*b,const float*c,float f){for(int i=0;i<3;++i)a[i]=b[i]+c[i]*f;}
struct RegionView3D{float dist=10,ofs[3]{};int persp=0;bool is_persp=true;};struct View3D{};struct Scene{};
namespace blender {template<class T>struct Bounds{T min,max;};}
struct PropertyRNA{};PropertyRNA*RNA_struct_find_property(PointerRNA*,const char*){static PropertyRNA p;return &p;}
bool RNA_property_is_set(PointerRNA*,PropertyRNA*){return false;}int RNA_property_int_get(PointerRNA*,PropertyRNA*){return 0;}bool RNA_property_boolean_get(PointerRNA*,PropertyRNA*){return false;}
struct {int uiflag=0,viewzoom=USER_ZOOM_DOLLY;} U;
double BLI_time_now_seconds(){return 1;}
int zoom_calls=0,autokeys=0,modal_adds=0,nav_frees=0;
float ED_view3d_calc_zfac(RegionView3D*,const float*){assert(false);return 0;}void ED_view3d_win_to_delta(ARegion*,const float*,float,float*){assert(false);}
blender::Bounds<float>ED_view3d_dist_soft_range_get(View3D*,bool){return {.01f,1000.0f};}
void ED_view3d_camera_lock_sync(Depsgraph*,View3D*,RegionView3D*){}void view3d_boxview_sync(ScrArea*,ARegion*){assert(false);}void ED_region_tag_redraw(ARegion*){}
bool ED_view3d_camera_lock_check(View3D*,RegionView3D*){return false;}
void view_zoom_apply_step(bContext*,Depsgraph*,Scene*,ScrArea*,ARegion*,int,const int*){assert(false);}
void ED_view3d_camera_lock_autokey(View3D*,RegionView3D*,bContext*,bool,bool){++autokeys;}
void*WM_event_timer_add(wmWindowManager*,wmWindow*,int,double){assert(false);return nullptr;}
struct ViewOpsType;
View3D audit_view;RegionView3D audit_rv;
struct ViewOpsData { struct{int event_xy[2]{},event_xy_offset[2]{};float dist=10;}init;struct{int event_xy[2]{};double time=0;}prev;
 int viewops_flag=0;Depsgraph*depsgraph=nullptr;Scene*scene=nullptr;ScrArea*area=nullptr;ARegion*region=nullptr;View3D*v3d=&audit_view;RegionView3D*rv3d=&audit_rv;void*timer=nullptr;
 void init_context(bContext*C){area=C->area;region=C->region;region->regiondata=rv3d;}
 void init_navigation(bContext*,const wmEvent*e,const ViewOpsType*,const float*,bool){copy_v2_v2_int(init.event_xy,e->xy);copy_v2_v2_int(prev.event_xy,e->xy);init.dist=rv3d->dist;}
};
struct ViewOpsType{int flag=0;const char*idname="";void*poll_fn=nullptr;wmOperatorStatus(*init_fn)(bContext*,ViewOpsData*,const wmEvent*,PointerRNA*)=nullptr;void*apply_fn=nullptr;};
void WM_event_add_modal_handler(bContext*,wmOperator*){++modal_adds;}void viewops_data_free(bContext*,ViewOpsData*v){++nav_frees;delete v;}void ED_view3d_smooth_view_force_finish(bContext*,View3D*,ARegion*){}
wmOperatorStatus knife_unmapped_branch(const wmEvent*event){switch(event->type){      case MOUSEPAN:
      case MOUSEZOOM:
      case MOUSEROTATE:
      case WHEELUPMOUSE:
      case WHEELDOWNMOUSE:
      case NDOF_MOTION:
        return OPERATOR_PASS_THROUGH;
 default:return OPERATOR_RUNNING_MODAL;}}
static void view_zoom_to_window_xy_3d(ARegion *region, float dfac, const int zoom_xy[2])
{
  RegionView3D *rv3d = static_cast<RegionView3D *>(region->regiondata);
  const float dist_new = rv3d->dist * dfac;

  if (zoom_xy != nullptr) {
    float dvec[3];
    float tvec[3];
    float tpos[3];
    float xy_delta[2];

    float zfac;

    negate_v3_v3(tpos, rv3d->ofs);

    xy_delta[0] = float(((zoom_xy[0] - region->winrct.xmin) * 2) - region->winx) / 2.0f;
    xy_delta[1] = float(((zoom_xy[1] - region->winrct.ymin) * 2) - region->winy) / 2.0f;

    /* Project cursor position into 3D space */
    zfac = ED_view3d_calc_zfac(rv3d, tpos);
    ED_view3d_win_to_delta(region, xy_delta, zfac, dvec);

    /* Calculate view target position for dolly */
    add_v3_v3v3(tvec, tpos, dvec);
    negate_v3(tvec);

    /* Offset to target position and dolly */
    copy_v3_v3(rv3d->ofs, tvec);
    rv3d->dist = dist_new;

    /* Calculate final offset */
    madd_v3_v3v3fl(rv3d->ofs, tvec, dvec, dfac);
  }
  else {
    rv3d->dist = dist_new;
  }
}
static float viewzoom_scale_value(const rcti *winrct,
                                  const eViewZoom_Style viewzoom,
                                  const bool zoom_invert,
                                  const bool zoom_invert_force,
                                  const int xy_curr[2],
                                  const int xy_init[2],
                                  const float val,
                                  const float val_orig,
                                  double *r_timer_lastdraw)
{
  float zfac;

  if (viewzoom == USER_ZOOM_CONTINUE) {
    double time = BLI_time_now_seconds();
    float time_step = float(time - *r_timer_lastdraw);
    float fac;

    if (U.uiflag & USER_ZOOM_HORIZ) {
      fac = float(xy_init[0] - xy_curr[0]);
    }
    else {
      fac = float(xy_init[1] - xy_curr[1]);
    }

    fac /= UI_SCALE_FAC;

    if (zoom_invert != zoom_invert_force) {
      fac = -fac;
    }

    zfac = 1.0f + ((fac / 20.0f) * time_step);
    *r_timer_lastdraw = time;
  }
  else if (viewzoom == USER_ZOOM_SCALE) {
    /* method which zooms based on how far you move the mouse */

    const int ctr[2] = {
        BLI_rcti_cent_x(winrct),
        BLI_rcti_cent_y(winrct),
    };
    float len_new = (5 * UI_SCALE_FAC) + (len_v2v2_int(ctr, xy_curr) / UI_SCALE_FAC);
    float len_old = (5 * UI_SCALE_FAC) + (len_v2v2_int(ctr, xy_init) / UI_SCALE_FAC);

    /* intentionally ignore 'zoom_invert' for scale */
    if (zoom_invert_force) {
      std::swap(len_new, len_old);
    }

    zfac = val_orig * (len_old / max_ff(len_new, 1.0f)) / val;
  }
  else { /* USER_ZOOM_DOLLY */
    float len_new = 5 * UI_SCALE_FAC;
    float len_old = 5 * UI_SCALE_FAC;

    if (U.uiflag & USER_ZOOM_HORIZ) {
      len_new += (winrct->xmax - (xy_curr[0])) / UI_SCALE_FAC;
      len_old += (winrct->xmax - (xy_init[0])) / UI_SCALE_FAC;
    }
    else {
      len_new += (winrct->ymax - (xy_curr[1])) / UI_SCALE_FAC;
      len_old += (winrct->ymax - (xy_init[1])) / UI_SCALE_FAC;
    }

    if (zoom_invert != zoom_invert_force) {
      std::swap(len_new, len_old);
    }

    zfac = val_orig * (2.0f * ((len_new / max_ff(len_old, 1.0f)) - 1.0f) + 1.0f) / val;
  }

  return zfac;
}
static float viewzoom_scale_value_offset(const rcti *winrct,
                                         const eViewZoom_Style viewzoom,
                                         const bool zoom_invert,
                                         const bool zoom_invert_force,
                                         const int xy_curr[2],
                                         const int xy_init[2],
                                         const int xy_offset[2],
                                         const float val,
                                         const float val_orig,
                                         double *r_timer_lastdraw)
{
  const int xy_curr_offset[2] = {
      xy_curr[0] + xy_offset[0],
      xy_curr[1] + xy_offset[1],
  };
  const int xy_init_offset[2] = {
      xy_init[0] + xy_offset[0],
      xy_init[1] + xy_offset[1],
  };
  return viewzoom_scale_value(winrct,
                              viewzoom,
                              zoom_invert,
                              zoom_invert_force,
                              xy_curr_offset,
                              xy_init_offset,
                              val,
                              val_orig,
                              r_timer_lastdraw);
}
static void viewzoom_apply_3d(ViewOpsData *vod,
                              const int xy[2],
                              const eViewZoom_Style viewzoom,
                              const bool zoom_invert,
                              const bool zoom_to_pos)
{
  const blender::Bounds<float> dist_range = ED_view3d_dist_soft_range_get(vod->v3d, false);
  float zfac = viewzoom_scale_value_offset(&vod->region->winrct,
                                           viewzoom,
                                           zoom_invert,
                                           false,
                                           xy,
                                           vod->init.event_xy,
                                           vod->init.event_xy_offset,
                                           vod->rv3d->dist,
                                           vod->init.dist,
                                           &vod->prev.time);

  if (zfac != 1.0f) {
    const float zfac_min = dist_range.min / vod->rv3d->dist;
    const float zfac_max = dist_range.max / vod->rv3d->dist;
    CLAMP(zfac, zfac_min, zfac_max);

    view_zoom_to_window_xy_3d(vod->region, zfac, zoom_to_pos ? vod->prev.event_xy : nullptr);
  }

  /* these limits were in old code too */
  CLAMP(vod->rv3d->dist, dist_range.min, dist_range.max);

  if (RV3D_LOCK_FLAGS(vod->rv3d) & RV3D_BOXVIEW) {
    view3d_boxview_sync(vod->area, vod->region);
  }

  ED_view3d_camera_lock_sync(vod->depsgraph, vod->v3d, vod->rv3d);

  ED_region_tag_redraw(vod->region);
}
void viewzoom_apply_camera(ViewOpsData*,const int*,eViewZoom_Style,bool,bool){assert(false);}
static void viewzoom_apply(ViewOpsData *vod,
                           const int xy[2],
                           const eViewZoom_Style viewzoom,
                           const bool zoom_invert)
{
  const bool zoom_to_pos = (vod->viewops_flag & VIEWOPS_FLAG_ZOOM_TO_MOUSE) != 0;

  if ((vod->rv3d->persp == RV3D_CAMOB) &&
      (vod->rv3d->is_persp && ED_view3d_camera_lock_check(vod->v3d, vod->rv3d)) == 0)
  {
    viewzoom_apply_camera(vod, xy, viewzoom, zoom_invert, zoom_to_pos);
  }
  else {
    viewzoom_apply_3d(vod, xy, viewzoom, zoom_invert, zoom_to_pos);
  }
}
static wmOperatorStatus viewzoom_invoke_impl(bContext *C,
                                             ViewOpsData *vod,
                                             const wmEvent *event,
                                             PointerRNA *ptr)
{
  int xy[2];

  PropertyRNA *prop;
  prop = RNA_struct_find_property(ptr, "mx");
  xy[0] = RNA_property_is_set(ptr, prop) ? RNA_property_int_get(ptr, prop) : event->xy[0];

  prop = RNA_struct_find_property(ptr, "my");
  xy[1] = RNA_property_is_set(ptr, prop) ? RNA_property_int_get(ptr, prop) : event->xy[1];

  prop = RNA_struct_find_property(ptr, "delta");
  const int delta = RNA_property_is_set(ptr, prop) ? RNA_property_int_get(ptr, prop) : 0;

  if (delta) {
    const bool do_zoom_to_mouse_pos = (vod->viewops_flag & VIEWOPS_FLAG_ZOOM_TO_MOUSE) != 0;
    view_zoom_apply_step(C,
                         vod->depsgraph,
                         vod->scene,
                         vod->area,
                         vod->region,
                         delta,
                         do_zoom_to_mouse_pos ? xy : nullptr);

    return OPERATOR_FINISHED;
  }

  eV3D_OpEvent event_code = ELEM(event->type, MOUSEZOOM, MOUSEPAN) ? VIEW_CONFIRM : VIEW_PASS;
  if (event_code == VIEW_CONFIRM) {
    if (U.uiflag & USER_ZOOM_HORIZ) {
      vod->init.event_xy[0] = vod->prev.event_xy[0] = xy[0];
    }
    else {
      /* Set y move = x move as MOUSEZOOM uses only x axis to pass magnification value */
      vod->init.event_xy[1] = vod->prev.event_xy[1] = vod->init.event_xy[1] + xy[0] -
                                                      event->prev_xy[0];
    }
    viewzoom_apply(vod, event->prev_xy, USER_ZOOM_DOLLY, (U.uiflag & USER_ZOOM_INVERT) != 0);
    ED_view3d_camera_lock_autokey(vod->v3d, vod->rv3d, C, false, true);

    return OPERATOR_FINISHED;
  }

  if (U.viewzoom == USER_ZOOM_CONTINUE) {
    /* needs a timer to continue redrawing */
    vod->timer = WM_event_timer_add(CTX_wm_manager(C), CTX_wm_window(C), TIMER, 0.01f);
    vod->prev.time = BLI_time_now_seconds();
  }

  return OPERATOR_RUNNING_MODAL;
}
const ViewOpsType ViewOpsType_zoom{0,"VIEW3D_OT_zoom",nullptr,viewzoom_invoke_impl,nullptr};
const ViewOpsType ViewOpsType_move{},ViewOpsType_rotate{};
static wmOperatorStatus view3d_navigation_invoke_generic(bContext *C,
                                                         ViewOpsData *vod,
                                                         const wmEvent *event,
                                                         PointerRNA *ptr,
                                                         const ViewOpsType *nav_type,
                                                         const float dyn_ofs_override[3])
{
  if (!nav_type->init_fn) {
    return OPERATOR_CANCELLED;
  }

  bool use_cursor_init = false;
  if (PropertyRNA *prop = RNA_struct_find_property(ptr, "use_cursor_init")) {
    use_cursor_init = RNA_property_boolean_get(ptr, prop);
  }

  vod->init_navigation(C, event, nav_type, dyn_ofs_override, use_cursor_init);
  ED_view3d_smooth_view_force_finish(C, vod->v3d, vod->region);

  return nav_type->init_fn(C, vod, event, ptr);
}
wmOperatorStatus view3d_navigate_invoke_impl(bContext *C,
                                             wmOperator *op,
                                             const wmEvent *event,
                                             const ViewOpsType *nav_type)
{
  ViewOpsData *vod = new ViewOpsData();
  vod->init_context(C);
  wmOperatorStatus ret = view3d_navigation_invoke_generic(
      C, vod, event, op->ptr, nav_type, nullptr);
  op->customdata = (void *)vod;

  if (ret == OPERATOR_RUNNING_MODAL) {
    WM_event_add_modal_handler(C, op);
    return OPERATOR_RUNNING_MODAL;
  }

  viewops_data_free(C, vod);
  op->customdata = nullptr;
  return ret;
}
static wmOperatorStatus viewzoom_invoke(bContext *C, wmOperator *op, const wmEvent *event)
{
  /* Near duplicate logic in #viewdolly_invoke(), changes here may apply there too. */
  return view3d_navigate_invoke_impl(C, op, event, &ViewOpsType_zoom);
}
static wmOperatorStatus viewmove_invoke(bContext *C, wmOperator *op, const wmEvent *event)
{
#ifdef WITH_APPLE_CROSSPLATFORM
  /* Filter finger-pan gestures only. Pencil/native gizmo LEFTMOUSE presses,
   * keyboard invocation and external mouse drags use Blender's modal path. */
  if (event->type == MOUSEPAN &&
      !(event->flag & (WM_EVENT_MULTITOUCH_TWO_FINGERS | WM_EVENT_MULTITOUCH_THREE_FINGERS)))
  {
    return OPERATOR_FINISHED;
  }
#endif

  return view3d_navigate_invoke_impl(C, op, event, &ViewOpsType_move);
}
static wmOperatorStatus viewrotate_invoke(bContext *C, wmOperator *op, const wmEvent *event)
{
#ifdef WITH_APPLE_CROSSPLATFORM
  /* Filter finger scrolling only; native gizmo and external pointer presses
   * must reach Blender's modal rotation path. */
  if (event->type == MOUSEPAN && !(event->flag & WM_EVENT_MULTITOUCH_TWO_FINGERS)) {
    return OPERATOR_FINISHED;
  }
#endif

  return view3d_navigate_invoke_impl(C, op, event, &ViewOpsType_rotate);
}
int main(){
 assert(!ghost::ios::direct_edit_tool("builtin.annotate","OBJECT"));assert(!ghost::ios::direct_edit_tool("builtin.measure","OBJECT"));assert(!ghost::ios::direct_edit_tool("builtin.knife","EDIT_MESH"));
 assert(ghost::ios::direct_edit_tool("builtin.select_box","OBJECT"));assert(ghost::ios::direct_edit_tool("builtin.select_lasso","EDIT_MESH"));
 Fixture f;f.sender.contact={};f.owner.ipad_pencil_paint_serial=0;f.expire();
 f.action(UIGestureRecognizerStateBegan,{110,100},{10,0});system_owner.clear();
 f.action(UIGestureRecognizerStateChanged,{115,103},{15,3});assert(system_owner.queue.size()==2);
 auto*packet=system_owner.queue[0];assert(packet->type==GHOST_kEventTrackpad);auto*pd=static_cast<GHOST_TEventTrackpadData*>(packet->data_);
 assert(pd->numFingers==1&&pd->deltaX==5&&pd->deltaY==3);assert(system_owner.queue[1]->type==GHOST_kEventCursorMove);
 f.transfer();assert(wm_queue.size()==2);wmEvent pan=wm_queue[0];assert(pan.type==MOUSEPAN&&pan.val==KM_NOTHING&&pan.ipad_pencil_paint_serial==0);
 // Actual full wm_event_add_trackpad above executes against an explicit queue container adapter.
 assert(pan.prev_xy[0]==pan.xy[0]-5&&pan.prev_xy[1]==pan.xy[1]+3);
 assert(knife_unmapped_branch(&pan)==OPERATOR_PASS_THROUGH);
 wmOperator zoom_op;PointerRNA ptr;zoom_op.ptr=&ptr;
 auto initial=audit_rv.dist;
 assert(viewrotate_invoke(&f.C,&zoom_op,&pan)==OPERATOR_FINISHED&&audit_rv.dist==initial&&nav_frees==0);
 assert(viewmove_invoke(&f.C,&zoom_op,&pan)==OPERATOR_FINISHED&&audit_rv.dist==initial&&nav_frees==0);
 // Actual keymap evaluated in Python chooses zoom only for Ctrl-TRACKPADPAN; normal/Shift select the wrappers above.
 assert(viewzoom_invoke(&f.C,&zoom_op,&pan)==OPERATOR_FINISHED);assert(audit_rv.dist!=initial&&nav_frees==1&&modal_adds==0&&autokeys==1);
 std::cout<<"PASS Ctrl Knife PAN: dist="<<initial<<" -> "<<audit_rv.dist<<"; native zoom finished; Knife PASS_THROUGH; no paint Cancel path\n";
}
