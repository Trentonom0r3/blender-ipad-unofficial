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

static bool working(const p::Mapping &mapping, int id)
{
  for (const p::Area &area : mapping.working) {
    if (area.id == id) { return true; }
  }
  return false;
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
    check(working(mapping, primary_id + 1), "Second working editor stays visible in its split");
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
  mapping = p::classify({{1, {0, 400, 1000, 900}},
                         {2, {0, 0, 1000, 400}, p::Role::Canvas}});
  check(mapping.primary_id == 1 && edge(mapping, 2) == p::Edge::Bottom,
        "A smaller custom footage panel stays bottom instead of taking over the workspace");
  mapping = p::classify({{1, {0, 0, 1000, 650}, p::Role::Canvas},
                         {2, {0, 650, 500, 900}}, {3, {500, 650, 1000, 900}}});
  check(mapping.primary_id == 1 && working(mapping, 2) && working(mapping, 3),
        "Dominant footage stays primary beneath auxiliary top graphs");
}

static void split_geometry()
{
  const auto created = p::classify({{1, {0,500,1000,1000}, p::Role::Working},
                                    {2, {0,100,1000,500}, p::Role::Working},
                                    {3, {0,0,1000,100}}});
  check(working(created, 1) && working(created, 2) && edge(created, 3) == p::Edge::Bottom,
        "Explicit horizontal split keeps both editors working above the original Timeline");
  const std::vector<p::Area> scripting{{1, {0,600,400,1000}}, {2, {400,0,1000,1000}}};
  const auto before = scripting;
  const p::Rect bounds{10,20,1010,820};
  auto split = p::working_layout(scripting, bounds, 4);
  check(split.size() == 2, "Both Scripting working editors stay visible");
  check(split[0].original.ymin == 20 && split[0].original.ymax == 820,
        "Viewport fills the space vacated by lower floating Console/Info");
  check(split[0].original.xmax == 410 && split[1].original.xmin == 414,
        "Saved left/right split proportion is preserved with a usable seam");
  for (size_t i = 0; i < scripting.size(); ++i) {
    check(same(scripting[i].original, before[i].original), "Layout never mutates saved vertices");
  }
  const std::vector<p::Area> nested{{1, {0,0,1000,600}},
                                    {2, {0,600,600,1000}}, {3, {600,600,1000,1000}}};
  split = p::working_layout(nested, bounds, 4);
  check(split.size() == 3, "Footage and two upper VFX editors all remain visible");
  check(split[0].original.ymax < split[1].original.ymin &&
            split[1].original.xmax < split[2].original.xmin,
        "Horizontal and nested vertical splits are preserved together");
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
  check(state.side.locked && state.side.active_id == 1, "Replacement inherits the side area's pin");
  check(state.toggle_lock(p::Edge::Bottom), "Independent bottom lock");
  check(state.side.locked && state.bottom.locked, "Both edges can be pinned together");
  check(state.tap(p::Edge::Side, 6) == p::TapResult::Switched, "Side switch works while both edges pinned");
  check(state.side.locked && state.bottom.locked && state.bottom.active_id == 2,
        "Side replacement preserves both area pins and leaves bottom editor untouched");
  check(state.tap(p::Edge::Bottom, 7) == p::TapResult::Switched,
        "Bottom replacement remains available while pinned");
  check(state.bottom.locked && state.bottom.active_id == 7 && state.side.active_id == 6,
        "Bottom replacement inherits only its area state and does not stack panels");
  check(!state.dismiss(p::Edge::Bottom), "Replacement bottom remains pinned during canvas work");
  check(state.toggle_lock(p::Edge::Side), "Unpin side");
  check(state.tap(p::Edge::Side, 6) == p::TapResult::Closed, "Active unpinned tab closes");
  check(state.bottom.locked && state.bottom.active_id == 7, "Side close preserves pinned bottom");
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

static void sculpt_default()
{
  p::State state;
  check(!p::open_default_sculpt_shelf(state, false, false, true, 77),
        "Object mode does not open Sculpt brushes");
  check(!p::open_default_sculpt_shelf(state, true, false, false, 77),
        "Wait for the actual native brush shelf poll");
  check(p::open_default_sculpt_shelf(state, true, false, true, 77) && state.bottom.active_id == 77,
        "First eligible Sculpt use opens Brushes despite hidden desktop default");
  state.dismiss(p::Edge::Bottom);
  check(!p::open_default_sculpt_shelf(state, true, true, true, 77) && !state.bottom.open(),
        "Explicit closure after initialization stays closed");
  state.tap(p::Edge::Bottom, 88);
  check(!p::open_default_sculpt_shelf(state, true, false, true, 77) && state.bottom.active_id == 88,
        "First-use brushes never replace a chosen bottom editor");
}

static void global_lock_and_tools()
{
  p::State state;
  state.toggle_panels_lock();
  check(state.panels_locked, "Global lock can be enabled before opening panels");
  for (const auto edge : {p::Edge::Tools, p::Edge::Side, p::Edge::Bottom}) {
    check(state.tap(edge, int(edge) + 5) == p::TapResult::Opened,
          "Each panel opens independently while globally locked");
    check(!state.dismiss(edge), "Global lock prevents outside dismissal on every edge");
    check(state.tap(edge, int(edge) + 5) == p::TapResult::Locked,
          "Selected panel remains open while globally locked");
  }
  state.tap(p::Edge::Bottom, 30);
  check(state.tools.open() && state.side.open() && state.bottom.active_id == 30,
        "Bottom replacement preserves native Tools and side content");
  const auto before = p::layout({0, 0, 1366, 1024}, state);
  state.tap(p::Edge::Side, 31);
  check(same(before.tools_panel, p::layout({0, 0, 1366, 1024}, state).tools_panel),
        "Switching Inspector does not move or expand the Tools strip");
  check(before.tools_panel.width() == 48 && before.bottom_panel.xmin > before.tools_panel.xmax,
        "Native Tools is a narrow vertical strip independent of bottom content");
  state.toggle_panels_lock();
  for (const auto edge : {p::Edge::Tools, p::Edge::Side, p::Edge::Bottom}) {
    check(state.dismiss(edge), "One unlock restores ordinary dismissal for all panels");
  }
  const auto closed = p::layout({0, 0, 1366, 1024}, state);
  check(!closed.left_rail.empty() && !closed.side_rail.empty(),
        "Both launch rails stay visible with all panels closed");
}

static void geometry()
{
  p::State state;
  state.tap(p::Edge::Side, 1);
  state.tap(p::Edge::Bottom, 2);
  state.tap(p::Edge::Tools, 3);
  /* Exhaustive realistic portrait, landscape, split-screen bounds and offset
   * origins: all visible surfaces stay inside safe bounds without collisions. */
  for (int width = 96; width <= 2048; width += 37) {
    for (int height = 96; height <= 1536; height += 43) {
      for (const int requested : {-100, 0, 320, 100000}) {
        state.side_width = requested;
        state.bottom_height = requested;
        const p::Rect bounds{17, 29, 17 + width, 29 + height};
        const auto l = p::layout(bounds, state);
        const std::vector<p::Rect> visible{l.canvas, l.side_rail, l.left_rail, l.side_panel, l.bottom_panel, l.tools_panel};
        check(l.bottom_rail.empty(), "Left launchers reserve no bottom rail");
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
  check(!l.side_rail.empty() && l.side_rail.width() == 44,
        "Closed panels retain finger-sized vertical side rail");
  const auto narrow = p::layout({0, 0, 480, 768}, closed);
  check(narrow.left_rail.width() == 29 && narrow.side_rail.width() == 29,
        "Narrow windows reclaim canvas space with adaptive rails");
  check(l.bottom_rail.empty() && l.canvas.ymin == 8,
        "Closed panels leave bottom canvas clear");
  check(l.side_panel.empty() && l.bottom_panel.empty(), "Closed panels reserve no panel space");
  check(p::layout({}, state).canvas.empty(), "Zero-sized window handled");
  check(p::layout({50, 50, 10, 10}, state).canvas.empty(), "Inverted window bounds handled");

  p::State cramped_inspector;
  cramped_inspector.tap(p::Edge::Side, 4);
  cramped_inspector.tap(p::Edge::Bottom, 5);
  cramped_inspector.side_width = 180;
  p::Metrics inspector_metrics;
  inspector_metrics.minimum_side_width = 360;
  const auto readable = p::layout({0, 0, 1024, 768}, cramped_inspector, inspector_metrics);
  check(readable.side_panel.width() == 360 &&
            p::panel_content(readable, p::Edge::Side).width() == 336,
        "Saved narrow Inspector reopens with readable native content width");
  const auto constrained = p::layout({0, 0, 768, 900}, cramped_inspector, inspector_metrics);
  check(constrained.side_panel.width() < 360 && !constrained.canvas.empty() &&
            !overlaps(constrained.side_panel, constrained.bottom_panel),
        "Inspector width floor yields to narrow windows and preserves the canvas");
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
  check(another.side_width == 0 && another.bottom_height == 0,
        "Fresh workspace keeps automatic sizes independent of resized workspace");
}

static void automatic_sizes()
{
  p::State state;
  state.tap(p::Edge::Side, 1);
  state.tap(p::Edge::Bottom, 2);
  for (const p::Rect bounds : {p::Rect{0, 0, 1366, 1024}, p::Rect{0, 0, 1024, 1366},
                               p::Rect{20, 70, 788, 970}}) {
    const auto l = p::layout(bounds, state);
    check(l.side_panel.width() > 280 && l.bottom_panel.height() > 400,
          "Automatic defaults use useful available space in landscape and portrait");
    const int usable_width = l.side_panel.xmax - l.bottom_panel.xmin;
    check(l.bottom_panel.width() >= usable_width / 2,
          "Simultaneous automatic side panel leaves at least half width for bottom editor");
    check(l.canvas.height() > bounds.height() / 3 && l.canvas.width() > usable_width / 2,
          "Automatic defaults retain a meaningful canvas beside both open panels");
    check(l.side_panel.ymax < bounds.ymax && l.side_panel.ymin > bounds.ymin,
          "Actual WINDOW bounds anchor panels clear of native headers/status bar");
    check(!overlaps(l.side_panel, l.bottom_panel), "Automatic panels never overlap");
  }
  check(state.side_width == 0 && state.bottom_height == 0,
        "Automatic sizing remains automatic through passive rotation");
  const p::Rect bounds{0, 0, 1366, 1024};
  const auto automatic = p::layout(bounds, state);
  state.toggle_lock(p::Edge::Side);
  state.toggle_lock(p::Edge::Bottom);
  p::resize(state, p::Edge::Side, 100000, bounds);
  auto l = p::layout(bounds, state);
  check(l.bottom_panel.width() >= 320, "Dragging side to maximum preserves usable bottom editor width");
  p::resize(state, p::Edge::Side, 250, bounds);
  p::resize(state, p::Edge::Bottom, 180, bounds);
  l = p::layout(bounds, state);
  check(l.side_panel.width() == 250 && l.bottom_panel.height() == 180,
        "Explicit user resize overrides automatic maximum defaults");
  check(state.side.locked && state.bottom.locked, "Changing automatic sizes does not unpin areas");
  state.tap(p::Edge::Side, 3);
  state.tap(p::Edge::Bottom, 4);
  l = p::layout(bounds, state);
  check(state.side.locked && state.bottom.locked && l.side_panel.width() == 250 &&
            l.bottom_panel.height() == 180,
        "Replacement panels retain area pins and explicitly resized dimensions");
  check(l.canvas.width() > automatic.canvas.width() && l.canvas.height() > automatic.canvas.height(),
        "Shrinking panels returns space to working canvas");
  p::resize(state, p::Edge::Side, 0, bounds);
  check(state.side_width == 160, "Dragging to zero clamps to minimum instead of restoring automatic size");

  /* Non-status-bar hosts can opt into a separate bottom rail explicitly. */
  p::Metrics legacy_metrics;
  legacy_metrics.bottom_rail = true;
  legacy_metrics.bottom_rail_extent = 44;
  const auto alternate = p::layout(bounds, state, legacy_metrics);
  check(!alternate.bottom_rail.empty() && alternate.bottom_rail.height() == 44,
        "Explicit bottom-rail host still has usable launcher geometry");
  check(!overlaps(alternate.bottom_rail, alternate.bottom_panel) &&
            !overlaps(alternate.bottom_rail, alternate.side_panel),
        "Optional external-host rail never collides with panels");
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

static void native_shelf_geometry()
{
  for (int height = 0; height <= 180; ++height) {
    for (int handle : {0, 12, 24, 48, 240}) {
      p::Layout layout;
      layout.bottom_panel = {17, 29, 417, 29 + height};
      layout.bottom_resize = {17, 29 + height - std::min(height, handle), 417, 29 + height};
      const p::Rect content = p::panel_content(layout, p::Edge::Bottom);
      check(content.height() >= 0, "Bottom content never inverts in a short window");
      for (int header : {20, 26, 32, 52}) {
        const auto shelf = p::shelf_regions(content, header);
        check(contains(content, shelf.header), "Shelf header stays within native content");
        check(contains(content, shelf.body), "Shelf body stays within native content");
        check(!overlaps(shelf.header, layout.bottom_resize), "Category taps cannot hit resize");
        check(!overlaps(shelf.body, shelf.header), "Shelf body and header are disjoint");
        if (!content.empty()) {
          check(shelf.header.ymax == content.ymax, "Native shelf header is above assets");
          check(shelf.body.ymax == shelf.header.ymin, "Shelf subdivisions are contiguous");
        }
      }
    }
  }
}

static void two_axis_geometry()
{
  for (int width : {1,8,80,400,1200}) {
    for (int height : {1,8,80,400,900}) {
      for (int mask=0;mask<8;++mask) {
        for (int preferred : {0,1,200,4000}) {
          for (int corner : {0,24,44,200}) {
            p::State state;
            if(mask&1)state.side.active_id=1;
            if(mask&2)state.bottom.active_id=2;
            if(mask&4)state.tools.active_id=3;
            state.side_height=preferred;state.bottom_width=preferred;
            p::Metrics metrics;metrics.corner_extent=corner;
            const p::Rect bounds{-31,19,-31+width,19+height};
            const auto l=p::layout(bounds,state,metrics);
            check(state.side_height==preferred && state.bottom_width==preferred,
                  "Passive layout preserves secondary preferences including zero");
            check(contains(l.side_panel,l.side_corner) && contains(l.bottom_panel,l.bottom_corner),
                  "Diagonal grips remain inside their panels at tiny sizes");
            check(l.side_corner.width()>=0 && l.side_corner.height()>=0 &&
                    l.bottom_corner.width()>=0 && l.bottom_corner.height()>=0,
                  "Clamped diagonal grip geometry never inverts");
            const auto side=p::panel_content(l,p::Edge::Side);
            const auto bottom=p::panel_content(l,p::Edge::Bottom);
            check(contains(l.side_panel,side) && contains(l.bottom_panel,bottom),
                  "Native content stays inside two-axis panel bounds");
            check(side.width()>=0 && side.height()>=0 && bottom.width()>=0 && bottom.height()>=0,
                  "Chrome exclusion never inverts native content");
            check(!overlaps(side,l.side_corner) && !overlaps(side,l.side_resize) &&
                    !overlaps(bottom,l.bottom_corner) && !overlaps(bottom,l.bottom_resize),
                  "Native input is disjoint from primary and diagonal resize targets");
            const std::vector<p::Rect> blocks{l.side_panel,l.bottom_panel,l.tools_panel,
                                             l.left_rail,l.side_rail,l.canvas};
            for(std::size_t i=0;i<blocks.size();++i) {
              check(contains(bounds,blocks[i]),"Two-axis layout remains within header-excluded bounds");
              for(std::size_t j=0;j<i;++j)check(!overlaps(blocks[i],blocks[j]),
                                                "Panels, Tools, canvas and rails remain disjoint");
            }
          }
        }
      }
    }
  }
  p::State state;state.side.active_id=1;state.bottom.active_id=2;state.tools.active_id=3;
  state.toggle_panels_lock();
  const p::Rect bounds{0,0,1400,1000};
  const auto automatic=p::layout(bounds,state);
  p::resize_2d(state,p::Edge::Side,300,350,bounds);
  p::resize_2d(state,p::Edge::Bottom,400,220,bounds);
  auto l=p::layout(bounds,state);
  check(l.side_panel.width()==300 && l.side_panel.height()==350 &&
          l.bottom_panel.width()==400 && l.bottom_panel.height()==220,
        "Diagonal drag records both actual dimensions independently");
  check(l.side_panel.xmax==automatic.side_panel.xmax && l.side_panel.ymax==automatic.side_panel.ymax &&
          l.bottom_panel.xmin==automatic.bottom_panel.xmin && l.bottom_panel.ymin==automatic.bottom_panel.ymin,
        "Side anchors top-right and bottom anchors bottom-left");
  check(l.side_corner.width()==44 && l.side_corner.height()==44 &&
          l.bottom_corner.width()==44 && l.bottom_corner.height()==44,
        "Roomy panels expose full-size diagonal targets");
  check(l.side_resize.width()==24 && l.bottom_resize.height()==24,
        "Diagonal targets do not widen the full primary strips");
  auto small=p::layout({0,0,250,180},state);
  check(small.side_panel.height()<350 && small.bottom_panel.width()<400,
        "Small windows visually constrain remembered secondary dimensions");
  check(state.side_height==350 && state.bottom_width==400,
        "Rotation does not destroy secondary size preferences");
  check(same(p::layout(bounds,state).side_panel,l.side_panel) &&
          same(p::layout(bounds,state).bottom_panel,l.bottom_panel),
        "Returning to larger bounds restores both full panel rectangles");
  p::resize(state,p::Edge::Side,280,bounds);p::resize(state,p::Edge::Bottom,210,bounds);
  check(state.side_height==350 && state.bottom_width==400,
        "Legacy single-axis drags leave secondary preferences alone");
  check(state.side.active_id==1 && state.bottom.active_id==2 && state.tools.active_id==3 && state.panels_locked,
        "Resizing preserves content identities, Tools and the global lock");
  p::resize_2d(state,p::Edge::Side,-100,-100,bounds);
  p::resize_2d(state,p::Edge::Bottom,-100,-100,bounds);
  check(state.side_width==160 && state.side_height==120 &&
          state.bottom_width==320 && state.bottom_height==120,
        "Two-axis drags honor all native panel minimum dimensions when space permits");
  p::resize_2d(state,p::Edge::Side,10000,10000,bounds);
  p::resize_2d(state,p::Edge::Bottom,10000,10000,bounds);
  l=p::layout(bounds,state);
  check(state.side_width==l.side_panel.width() && state.side_height==l.side_panel.height() &&
          state.bottom_width==l.bottom_panel.width() && state.bottom_height==l.bottom_panel.height(),
        "Oversized drag preferences contain actual fitted dimensions");
  const auto before=state;
  p::resize_2d(state,p::Edge::Side,200,200,{});
  p::resize_2d(state,p::Edge::Tools,200,200,bounds);
  check(state.side_width==before.side_width && state.side_height==before.side_height &&
          state.bottom_width==before.bottom_width && state.bottom_height==before.bottom_height,
        "Empty bounds and Tools never change panel preferences");
}

int main()
{
  try {
    native_shelf_geometry();
    two_axis_geometry();
  classification();
    split_geometry();
    interaction();
    global_lock_and_tools();
    sculpt_default();
    geometry();
    resizing();
    automatic_sizes();
    overflow();
    std::cout << "PASS: " << checks << " checks across classification, interaction, geometry, resizing, overflow\n";
    return 0;
  }
  catch (const std::exception &error) {
    std::cerr << "FAIL after " << checks << " checks: " << error.what() << '\n';
    return 1;
  }
}
