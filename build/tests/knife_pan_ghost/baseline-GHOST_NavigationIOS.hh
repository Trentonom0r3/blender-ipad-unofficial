/* SPDX-License-Identifier: GPL-2.0-or-later */
#pragma once

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
