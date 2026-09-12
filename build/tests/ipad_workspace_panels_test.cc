/* SPDX-License-Identifier: GPL-2.0-or-later */
#include "ipad_workspace_panels.hh"

#include <iostream>
#include <stdexcept>
#include <string>

namespace p = blender::ed::ipad::panels;
static int checks = 0;

static void check(const bool condition, const char *message)
{
  ++checks;
  if (!condition) {
    throw std::runtime_error(message);
  }
}

static bool same(const p::Rect a, const p::Rect b)
{
  return a.xmin == b.xmin && a.ymin == b.ymin && a.xmax == b.xmax && a.ymax == b.ymax;
}

static bool contains(const p::Rect outer, const p::Rect inner)
{
  return inner.empty() || (inner.xmin >= outer.xmin && inner.xmax <= outer.xmax &&
                           inner.ymin >= outer.ymin && inner.ymax <= outer.ymax);
}

static bool overlaps(const p::Rect a, const p::Rect b)
{
  return !a.empty() && !b.empty() && a.xmin < b.xmax && b.xmin < a.xmax &&
         a.ymin < b.ymax && b.ymin < a.ymax;
}

static p::Edge edge(const p::Mapping &mapping, const int id)
{
  for (const p::Panel &panel : mapping.panels) {
    if (panel.id == id) {
      return panel.edge;
    }
  }
  throw std::runtime_error("Missing panel ID " + std::to_string(id));
}

static void classification()
{
  /* Default Layout: main viewport, lower Timeline, right Outliner/Properties. */
  std::vector<p::Area> areas{{10, {0, 180, 920, 800}},
                            {20, {0, 0, 920, 180}},
                            {30, {920, 560, 1200, 800}, p::Role::Service},
                            {40, {920, 0, 1200, 560}, p::Role::Service}};
  const auto before = areas;
  auto mapping = p::classify(areas);
  check(mapping.primary_id == 10, "Layout primary");
  check(mapping.panels.size() == 3, "No duplicate or discarded secondary editors");
  check(edge(mapping, 20) == p::Edge::Bottom, "Timeline stays at bottom");
  check(edge(mapping, 30) == p::Edge::Side && edge(mapping, 40) == p::Edge::Side,
        "Outliner and Properties remain side editors");
  for (std::size_t i = 0; i < areas.size(); ++i) {
    check(same(areas[i].original, before[i].original), "Saved area rectangles are immutable");
  }

  /* Shading: even an enormous lower node editor must not replace top content. */
  mapping = p::classify({{1, {0, 700, 1000, 900}},
                          {2, {0, 0, 1000, 700}},
                          {3, {1000, 0, 1300, 900}, p::Role::Service}});
  check(mapping.primary_id == 1, "Top row wins over larger bottom node editor");
  check(edge(mapping, 2) == p::Edge::Bottom, "Bottom node editor placement preserved");

  /* Animation/UV/Compositing/Video: types are intentionally absent from the
   * policy, so primary image/node/sequence/editor state remains the original. */
  for (const int primary_id : {100, 200, 300, 400}) {
    mapping = p::classify({{primary_id + 1, {600, 240, 1000, 900}},
                            {primary_id, {0, 240, 600, 900}},
                            {primary_id + 2, {0, 0, 1000, 240}},
                            {primary_id + 3, {1000, 0, 1300, 900}, p::Role::Service}});
    check(mapping.primary_id == primary_id, "Workspace's largest top content stays primary");
    check(edge(mapping, primary_id + 1) == p::Edge::Side, "Second top content is a side tab");
    check(edge(mapping, primary_id + 2) == p::Edge::Bottom, "Lower editor remains a bottom tab");
  }

  /* Multiple bottom panels, top-edge tolerance and deterministic ties. */
  mapping = p::classify({{9, {500, 200, 1000, 800}}, {4, {0, 200, 500, 800}},
                          {7, {500, 0, 1000, 200}}, {8, {0, 0, 500, 200}}});
  check(mapping.primary_id == 4, "Equal top editors choose leftmost deterministically");
  check(edge(mapping, 8) == p::Edge::Bottom, "Bottom area below primary preserved");
  check(edge(mapping, 7) == p::Edge::Bottom, "Lower lateral content editor stays in the bottom row");
  mapping = p::classify({{1, {0, 100, 700, 800}}, {2, {700, 100, 900, 801}}});
  check(mapping.primary_id == 1, "One-pixel top seam tolerance");
  mapping = p::classify({{1, {0, 0, 900, 800}, p::Role::Service},
                          {2, {900, 0, 1200, 800}, p::Role::Service}});
  check(mapping.primary_id == 1, "Service-only custom workspace remains usable");
  check(p::classify({}).primary_id == -1, "Empty workspace handled");
  check(p::classify({{-1, {0, 0, 100, 100}}, {1, {0, 0, 0, 100}}}).primary_id == -1,
        "Invalid and empty descriptors ignored");
}

static void interaction()
{
  p::State state;
  check(!state.side.open() && !state.bottom.open(), "Startup panels closed");
  check(!state.toggle_lock(p::Edge::Side), "Cannot lock nonexistent panel");
  check(state.tap(p::Edge::Side, 1) == p::TapResult::Opened, "Tap opens side");
  check(state.tap(p::Edge::Bottom, 2) == p::TapResult::Opened, "Tap opens bottom independently");
  check(state.tap(p::Edge::Side, 3) == p::TapResult::Switched, "Tap switches unlocked side");
  check(state.bottom.active_id == 2, "Switch side preserves bottom editor");
  check(state.toggle_lock(p::Edge::Side), "Lock active side");
  check(state.tap(p::Edge::Side, 3) == p::TapResult::Locked, "Active pinned tab stays open on tap");
  check(!state.dismiss(p::Edge::Side), "Outside/close action does not dismiss pinned side");
  check(state.tap(p::Edge::Side, 1) == p::TapResult::Switched, "Explicitly selecting different tab replaces pinned panel");
  check(!state.side.locked && state.side.active_id == 1, "Explicit switch clears lock in selected edge");
  check(state.toggle_lock(p::Edge::Side), "Replacement panel can be pinned");
  check(state.toggle_lock(p::Edge::Bottom), "Independent bottom lock");
  check(state.side.locked && state.bottom.locked, "Both edges can be pinned together");
  check(state.tap(p::Edge::Side, 6) == p::TapResult::Switched, "Side switch works while both edges pinned");
  check(!state.side.locked && state.bottom.locked && state.bottom.active_id == 2,
        "Explicit side switch clears only side lock and leaves bottom editor untouched");
  check(state.toggle_lock(p::Edge::Side), "Relock side after switch");
  check(state.toggle_lock(p::Edge::Side), "Unpin side");
  check(state.tap(p::Edge::Side, 6) == p::TapResult::Closed, "Active unpinned tab closes");
  check(state.bottom.locked && state.bottom.active_id == 2, "Side close preserves pinned bottom");
  check(state.tap(p::Edge::Side, -1) == p::TapResult::Invalid, "Invalid tab has no effect");
  state.reconcile({{9, p::Edge::Side, {}}});
  check(!state.bottom.open() && !state.bottom.locked, "Removed editor releases stale active/pin state");
  state.tap(p::Edge::Side, 9);
  state.toggle_lock(p::Edge::Side);
  state.reconcile({{9, p::Edge::Bottom, {}}});
  check(!state.side.open(), "Reclassified editor cannot leave stale side pin");
  p::State other_workspace;
  check(!other_workspace.side.open() && !other_workspace.bottom.open(), "Fresh workspace state independent");
}

static void geometry()
{
  p::State state;
  state.tap(p::Edge::Side, 1);
  state.tap(p::Edge::Bottom, 2);
  /* Exhaustive realistic portrait, landscape, split-screen bounds and offset
   * origins: all visible surfaces stay inside safe bounds without collisions. */
  for (int width = 96; width <= 2048; width += 37) {
    for (int height = 96; height <= 1536; height += 43) {
      for (const int requested : {-100, 320, 100000}) {
        state.side_width = requested;
        state.bottom_height = requested;
        const p::Rect bounds{17, 29, 17 + width, 29 + height};
        const auto l = p::layout(bounds, state);
        const std::vector<p::Rect> visible{l.canvas, l.side_rail, l.bottom_rail,
                                           l.side_panel, l.bottom_panel};
        for (std::size_t i = 0; i < visible.size(); ++i) {
          check(contains(bounds, visible[i]), "Surface inside safe bounds");
          check(!visible[i].empty(), "Canvas, permanent rails and open panels stay nonempty");
          for (std::size_t j = i + 1; j < visible.size(); ++j) {
            check(!overlaps(visible[i], visible[j]), "Side, bottom, rails, canvas do not collide");
          }
        }
        check(contains(l.side_panel, l.side_resize), "Side handle reachable inside panel");
        check(contains(l.bottom_panel, l.bottom_resize), "Bottom handle reachable inside panel");
        check(l.side_resize.xmin == l.side_panel.xmin, "Side handle on inner edge");
        check(l.bottom_resize.ymax == l.bottom_panel.ymax, "Bottom handle on top edge");
      }
    }
  }
  p::State closed;
  const auto l = p::layout({0, 0, 1024, 768}, closed);
  check(!l.side_rail.empty() && !l.bottom_rail.empty(), "Closed panels retain visible rails");
  check(l.side_panel.empty() && l.bottom_panel.empty(), "Closed panels reserve no panel space");
  check(p::layout({}, state).canvas.empty(), "Zero-sized window handled");
  check(p::layout({50, 50, 10, 10}, state).canvas.empty(), "Inverted window bounds handled");
}

static void resizing()
{
  p::State state;
  const p::Rect landscape{0, 0, 1366, 1024};
  state.tap(p::Edge::Side, 8);
  state.tap(p::Edge::Bottom, 9);
  state.toggle_lock(p::Edge::Side);
  state.toggle_lock(p::Edge::Bottom);
  p::resize(state, p::Edge::Side, 410, landscape);
  p::resize(state, p::Edge::Bottom, 310, landscape);
  check(state.side_width == 410 && state.bottom_height == 310, "Remember independent dragged dimensions");
  check(state.side.locked && state.bottom.locked, "Resize preserves both locks");
  check(state.side.active_id == 8 && state.bottom.active_id == 9, "Resize preserves active editors");
  auto l = p::layout(landscape, state);
  check(l.side_panel.width() == 410 && l.bottom_panel.height() == 310, "Remembered sizes affect layout");
  l = p::layout({0, 0, 400, 320}, state);
  check(l.side_panel.width() < 410 && l.bottom_panel.height() < 310, "Rotation/shrink clamps visual dimensions");
  check(state.side_width == 410 && state.bottom_height == 310, "Passive resize preserves preferred dimensions");
  l = p::layout(landscape, state);
  check(l.side_panel.width() == 410 && l.bottom_panel.height() == 310, "Larger window restores preferences");
  p::resize(state, p::Edge::Side, 100000, landscape);
  check(state.side_width == p::layout(landscape, state).side_panel.width(), "Huge drag remembers clamped width");
  check(!p::layout(landscape, state).canvas.empty(), "Huge drag preserves usable canvas");
  p::resize(state, p::Edge::Bottom, -100, landscape);
  check(state.bottom_height == 120, "Negative drag clamps to bottom minimum");
  const auto before = state;
  p::resize(state, p::Edge::Side, 100, {});
  check(state.side_width == before.side_width, "Zero-sized window cannot erase size preference");
  state.toggle_lock(p::Edge::Side);
  state.tap(p::Edge::Side, 8);
  state.tap(p::Edge::Side, 5);
  check(state.side_width == before.side_width, "Size belongs to workspace edge across tabs");
  p::State another;
  check(another.side_width == 320 && another.bottom_height == 240, "Dimensions independent per workspace");
}

static void overflow()
{
  for (std::size_t count = 1; count <= 96; ++count) {
    for (int extent = 12; extent <= 1024; extent += 17) {
      auto page = p::rail_page(count, extent);
      std::size_t reached = 0;
      for (std::size_t index = 0; index < page.pages; ++index) {
        page = p::rail_page(count, extent, index);
        check(page.first == reached, "Pagination visits every tab without duplicates/gaps");
        check(page.count > 0, "Overflow leaves at least one visible tab");
        check(page.previous == (page.paged && index > 0), "Previous page availability");
        check(page.next == (index + 1 < page.pages), "Next page availability");
        const int controls = page.paged ? 2 : 0;
        const int targets = static_cast<int>(page.count) + controls;
        check(targets * page.button_extent + (targets - 1) * page.gap <= extent,
              "Tabs and paging controls fit rail extent");
        reached += page.count;
      }
      check(reached == count, "Every overflow tab is reachable");
      page = p::rail_page(count, extent, 99999);
      check(page.page + 1 == page.pages, "Stale overflow page clamps after layout change");
    }
  }
  check(p::rail_page(0, 800).pages == 0, "Empty rail has no pages");
  check(p::rail_page(10, 0).pages == 0, "Zero-length rail handled");
}

int main()
{
  try {
    classification();
    interaction();
    geometry();
    resizing();
    overflow();
    std::cout << "PASS: " << checks << " checks across classification, interaction, geometry, resizing, overflow\n";
    return 0;
  }
  catch (const std::exception &error) {
    std::cerr << "FAIL after " << checks << " checks: " << error.what() << '\n';
    return 1;
  }
}
