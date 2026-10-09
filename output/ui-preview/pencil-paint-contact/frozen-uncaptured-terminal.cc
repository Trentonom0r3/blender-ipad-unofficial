/* SPDX-License-Identifier: GPL-2.0-or-later */


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
  pencil_ring_presentations.erase(window);
}

}  // namespace ghost::ios
#include <cassert>
#include <iostream>
using namespace ghost::ios;
struct CGPoint{double x,y;};CGPoint CGPointMake(double x,double y){return{x,y};}
struct UserInputEvent{enum class EventTypes{CURSOR_MOVE,LEFT_BUTTON_DOWN,LEFT_BUTTON_UP};
 uint64_t hud_generation=0,hud_serial=0;bool cancelled=false;std::vector<EventTypes>events;
 UserInputEvent(const CGPoint*,void*,void*,bool){}void add_event(EventTypes e){events.push_back(e);}};
int main(){assert(!direct_edit_tool("builtin.brush","SCULPT"));
 for(int ordering=0;ordering<2;++ordering){PointerCapture pointer_capture;HUDContact pointer_hud_contact;TouchAdmission tap,pan;
  double mouse_cursor_x=30,mouse_cursor_y=50;int downs=0,ups=0;
  auto send=[&](const UserInputEvent &e){for(auto event:e.events){if(event==UserInputEvent::EventTypes::LEFT_BUTTON_DOWN)++downs;if(event==UserInputEvent::EventTypes::LEFT_BUTTON_UP)++ups;}};
  auto cancel=[&](){
  
  tap.interrupt();
  pan.interrupt();
  const auto end = pointer_capture.finish(true);
  if (end.release) {
    CGPoint location = CGPointMake(mouse_cursor_x, mouse_cursor_y);
    UserInputEvent release(&location, nullptr, nullptr, false);
    release.cancelled = end.cancelled;
    /* The recognizer was invalidated above; use the pointer owner's original
     * presentation, never the current HUD or a reset recognizer. */
    release.hud_generation = pointer_hud_contact.generation;
    release.hud_serial = pointer_hud_contact.serial;
    release.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_UP);
    send(release);
  }
  pointer_hud_contact = {};
};
  auto terminal=[&](){  if (!pan.allowed()) {
    return;
  }

   CGPoint touch_point{mouse_cursor_x,mouse_cursor_y};UserInputEvent event_info(&touch_point,nullptr,nullptr,true);
   event_info.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_UP);send(event_info);};
  tap.begin();pan.begin();CGPoint touch_point{30,50};UserInputEvent event_info(&touch_point,nullptr,nullptr,true);
  event_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);
      event_info.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_DOWN);
  send(event_info);assert(downs==1&&!pointer_capture.active());
  if(ordering==0){terminal();cancel();assert(ups==1);}else{cancel();terminal();assert(ups==0);}
  std::cout<<"{\"ordering\":\""<<(ordering==0?"terminal_then_interrupt":"interrupt_then_terminal_before_reset")<<"\",\"presses\":"<<downs<<",\"terminals\":"<<ups<<"}\n";
 }
}
