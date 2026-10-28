
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
