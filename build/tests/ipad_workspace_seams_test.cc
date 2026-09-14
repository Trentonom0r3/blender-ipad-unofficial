#include "ipad_workspace_panels.hh"
#include <cassert>
#include <iostream>
#include <set>
namespace p = blender::ed::ipad::panels;
int main()
{
  // Two working editors above connected, hidden supporting editors.
  std::vector<p::SeamVertex> vertices{{0,0},{400,0},{1000,0},
                                     {0,100},{400,100},{1000,100},
                                     {0,700},{400,700},{1000,700}};
  std::vector<p::SeamEdge> edges{{1,4},{4,7},{0,1},{3,4},{6,7}};
  std::vector<p::SeamFace> faces{{{0,3,4,1}},{{1,4,5,2}},
                                {{3,6,7,4}},{{4,7,8,5}}};
  auto selected = p::seam_connected_vertices(vertices, edges, 1, true);
  assert(selected.size() == vertices.size());
  for (std::size_t i=0; i<selected.size(); ++i) {
    assert(selected[i] == (i==1 || i==4 || i==7));
  }
  auto limits = p::seam_saved_limits(vertices, faces, selected, true, 100, 40);
  assert(limits.valid && limits.minimum == -300 && limits.maximum == 500);
  // A narrow hidden bottom editor constrains the wider working editor above it.
  auto supporting_vertices = vertices;
  supporting_vertices.push_back({350,0}); supporting_vertices.push_back({350,100});
  auto supporting_faces = faces;
  supporting_faces[0] = {{{9,10,4,1}}};
  supporting_faces.push_back({{{0,3,10,9}}});
  auto supporting_selection = p::seam_connected_vertices(supporting_vertices, edges, 1, true);
  limits = p::seam_saved_limits(supporting_vertices, supporting_faces,
                                supporting_selection, true, 100, 40);
  assert(limits.valid && limits.minimum == 0 && limits.maximum == 500);
  // Per-face interior border padding is supplied by the native adapter.
  faces[1].minimum_width = 120;
  limits = p::seam_saved_limits(vertices, faces, selected, true, 100, 40);
  assert(limits.valid && limits.maximum == 480);
  faces[1].minimum_width = 0;
  // Same coordinate, disconnected edge: no accidental propagation.
  vertices.push_back({400,800}); vertices.push_back({400,900});
  edges.push_back({9,10});
  selected = p::seam_connected_vertices(vertices, edges, 1, true);
  assert(!selected[9] && !selected[10]);
  auto partial = selected; partial[4] = false;
  assert(!p::seam_saved_limits(vertices, faces, partial, true, 100, 40).valid);
  assert(p::seam_connected_vertices(vertices, edges, 99, true).empty());
  auto broken = edges; broken.push_back({0,100});
  assert(p::seam_connected_vertices(vertices, broken, 1, true).empty());
  auto degenerate = vertices; degenerate[7] = degenerate[4];
  assert(p::seam_connected_vertices(degenerate,edges,1,true).empty());
  // Signed native coordinates preserve the limits; oversized coordinates fail.
  auto negative = vertices;
  for (auto &v : negative) { v.x -= 1000; v.y -= 1000; }
  limits = p::seam_saved_limits(negative,faces,selected,true,100,40);
  assert(limits.valid && limits.minimum == -300 && limits.maximum == 500);
  negative[0].x = std::numeric_limits<int>::min();
  assert(!p::seam_saved_limits(negative,faces,selected,true,100,40).valid);
  // Transposition must produce the same constraints for horizontal seams.
  for (auto &v : vertices) { std::swap(v.x,v.y); }
  for (auto &f : faces) { std::swap(f.vertices[1],f.vertices[3]); }
  selected = p::seam_connected_vertices(vertices, edges, 1, false);
  limits = p::seam_saved_limits(vertices, faces, selected, false, 40, 100);
  assert(limits.valid && limits.minimum == -300 && limits.maximum == 500);
  // Nested split mapping: child uses its own display/saved node, not the root.
  std::vector<p::Area> areas{{0,{0,0,401,701},p::Role::Working},
                             {1,{400,0,1001,301},p::Role::Working},
                             {2,{400,300,1001,701},p::Role::Working}};
  const p::Rect bounds{20,30,1220,830};
  std::vector<p::WorkingSeam> seams;
  const auto placed = p::working_layout(areas,bounds,4,&seams);
  const auto ordinary = p::working_layout(areas,bounds);
  assert(seams.size() == 2 && placed.size() == ordinary.size());
  for (std::size_t i=0; i<placed.size(); ++i) {
    assert(placed[i].id==ordinary[i].id);
    assert(placed[i].original.xmin==ordinary[i].original.xmin);
    assert(placed[i].original.xmax==ordinary[i].original.xmax);
    assert(placed[i].original.ymin==ordinary[i].original.ymin);
    assert(placed[i].original.ymax==ordinary[i].original.ymax);
  }
  assert(seams[0].vertical && seams[0].coordinate==400);
  assert(seams[0].before==std::vector<int>{0});
  assert((seams[0].after==std::vector<int>{1,2}));
  assert(!seams[1].vertical && seams[1].coordinate==300);
  assert(seams[1].display_bounds.xmin > bounds.xmin);
  for (int d=-2000; d<=2000; ++d) {
    assert(p::seam_saved_delta(seams[0],-d)==-p::seam_saved_delta(seams[0],d));
  }
  assert(p::seam_saved_delta(seams[0],1200)==1001);
  assert(p::seam_saved_delta(seams[1],800)==701);
  assert(p::seam_display_valid(placed,placed,bounds,150,100));
  auto candidate=placed;
  candidate[0].original.xmax=candidate[0].original.xmin+10;
  assert(!p::seam_display_valid(placed,candidate,bounds,150,100));
  candidate=placed; candidate[0].original.xmax=bounds.xmax;
  assert(!p::seam_display_valid(placed,candidate,bounds,150,100));
  candidate=placed; candidate[0].id=candidate[1].id;
  assert(!p::seam_display_valid(placed,candidate,bounds,150,100));
  candidate=placed; candidate.pop_back();
  assert(!p::seam_display_valid(placed,candidate,bounds,150,100));
  std::vector<p::Area> small{{0,{0,0,20,20},p::Role::Working}};
  std::vector<p::Area> larger{{0,{0,0,40,40},p::Role::Working}};
  assert(p::seam_display_valid(small,larger,{0,0,100,100},150,100));
  larger[0].original.xmax = 10;
  assert(!p::seam_display_valid(small,larger,{0,0,100,100},150,100));
  // Two separated working editors must not imply an existing shared saved edge.
  std::vector<p::Area> separated{{0,{0,0,301,701},p::Role::Working},
                                 {1,{400,0,1001,701},p::Role::Working}};
  seams.clear();
  p::working_layout(separated,bounds,4,&seams);
  assert(seams.size()==1 && seams[0].coordinate==300);
  // Adapter must resolve adjacency in saved topology before offering this seam.
  p::WorkingSeam handle_seam{true,400,{0,0,1000,700},{0,0,1000,700},{398,0,402,700},{0},{1}};
  const p::Rect handle_bounds{0,0,1000,700};
  auto handle=p::seam_handle_rect(handle_seam,handle_bounds,{},44);
  assert(handle.width()==44 && handle.height()==44);
  auto below=p::seam_handle_rect(handle_seam,handle_bounds,{{0,328,1000,700}},44);
  assert(!below.empty() && below.ymax<=328);
  auto above=p::seam_handle_rect(handle_seam,handle_bounds,{{0,0,1000,372}},44);
  assert(!above.empty() && above.ymin>=372);
  assert(p::seam_handle_rect(handle_seam,handle_bounds,{handle_bounds},44).empty());
  for(int extent=1;extent<90;++extent){
    auto hit=p::seam_handle_rect(handle_seam,handle_bounds,{{}},extent);
    assert(hit.width()==extent && hit.height()==extent);
    assert(hit.xmin>=0 && hit.xmax<=1000 && hit.ymin>=0 && hit.ymax<=700);
  }
  handle_seam.vertical=false;handle_seam.line={0,398,1000,402};
  handle=p::seam_handle_rect(handle_seam,handle_bounds,{},44);
  assert(!handle.empty() && handle.ymin==402);
  // A non-slicing pinwheel has shared inclusive native border vertices.
  // Scaling those duplicate pixels must not overlap editor draw/input bounds.
  std::vector<p::Area> pinwheel{{0,{0,0,601,301},p::Role::Working},
                               {1,{600,0,901,601},p::Role::Working},
                               {2,{300,600,901,901},p::Role::Working},
                               {3,{0,300,301,901},p::Role::Working},
                               {4,{300,300,601,601},p::Role::Working}};
  for (int transpose=0; transpose<2; ++transpose) {
    for (int extent : {1,2,3,8,44,301,900,1400}) {
      for (int gap : {0,1,4,9,100}) {
        const p::Rect target{-20,30,-20+extent,30+extent*2};
        seams.clear();
        const auto layout=p::working_layout(pinwheel,target,gap,&seams);
        assert(layout.size()==5 && seams.empty());
        for (std::size_t i=0;i<layout.size();++i) {
          const auto &r=layout[i].original;
          assert(layout[i].id==pinwheel[i].id);
          assert(r.xmin>=target.xmin && r.xmax<=target.xmax);
          assert(r.ymin>=target.ymin && r.ymax<=target.ymax);
          assert(r.xmin<=r.xmax && r.ymin<=r.ymax);
          for (std::size_t j=0;j<i;++j) {
            const auto &other=layout[j].original;
            assert(std::min(r.xmax,other.xmax)<=std::max(r.xmin,other.xmin) ||
                   std::min(r.ymax,other.ymax)<=std::max(r.ymin,other.ymin));
          }
        }
        if (gap==0) {
          long long area=0;
          for (const auto &entry:layout) area+=entry.original.width()*entry.original.height();
          assert(area==static_cast<long long>(target.width())*target.height());
        }
      }
    }
    for(auto &area:pinwheel) {
      std::swap(area.original.xmin,area.original.ymin);
      std::swap(area.original.xmax,area.original.ymax);
    }
  }
  // Fallback adjacency is local pair identity, never a fabricated full-span cut.
  const std::set<std::pair<int,int>> expected_pairs{{0,1},{0,3},{0,4},{1,2},
                                                   {1,4},{2,3},{2,4},{3,4}};
  for (int transpose=0; transpose<2; ++transpose) {
    for (int gap : {0,1,4,9}) {
      const p::Rect target{-70,40,1280,1840};
      std::vector<p::WorkingFallback> nodes;
      seams.clear();
      const auto displayed=p::working_layout(pinwheel,target,gap,&seams,&nodes);
      assert(seams.empty() && nodes.size()==1);
      assert((nodes[0].members==std::vector<int>{0,1,2,3,4}));
      assert(nodes[0].saved_bounds.width()==901 && nodes[0].display_bounds.width()==1350);
      const auto adjacent=p::working_adjacencies(pinwheel,displayed,nodes);
      assert(adjacent.size()==8);
      std::set<std::pair<int,int>> actual_pairs;
      int vertical=0;
      for (const auto &edge:adjacent) {
        actual_pairs.emplace(std::min(edge.before_id,edge.after_id),
                             std::max(edge.before_id,edge.after_id));
        vertical+=edge.vertical;
        assert(edge.coordinate==300 || edge.coordinate==600);
        assert(edge.saved_max-edge.saved_min==300);
        assert(edge.node.members==nodes[0].members);
        const auto &before=displayed[edge.before_id].original;
        const auto &after=displayed[edge.after_id].original;
        if(edge.vertical) {
          assert(edge.line.xmin==before.xmax && edge.line.xmax==after.xmin);
          assert(edge.line.ymin==std::max(before.ymin,after.ymin));
          assert(edge.line.ymax==std::min(before.ymax,after.ymax));
          assert(edge.line.ymax>edge.line.ymin && edge.line.width()==gap);
        }
        else {
          assert(edge.line.ymin==before.ymax && edge.line.ymax==after.ymin);
          assert(edge.line.xmin==std::max(before.xmin,after.xmin));
          assert(edge.line.xmax==std::min(before.xmax,after.xmax));
          assert(edge.line.xmax>edge.line.xmin && edge.line.height()==gap);
        }
      }
      assert(vertical==4 && actual_pairs==expected_pairs);
    }
    for(auto &area:pinwheel) {
      std::swap(area.original.xmin,area.original.ymin);
      std::swap(area.original.xmax,area.original.ymax);
    }
  }
  // Shared coordinate alone must not join corner-only or disconnected contacts.
  std::vector<p::Area> corner{{0,{0,0,101,101},p::Role::Working},
                             {1,{100,100,201,201},p::Role::Working}};
  std::vector<p::WorkingFallback> manual{{{0,0,201,201},{0,0,200,200},{0,1}}};
  assert(p::working_adjacencies(corner,corner,manual).empty());
  std::vector<p::Area> separate{{0,{0,0,101,101},p::Role::Working},
                               {1,{100,0,201,101},p::Role::Working},
                               {2,{0,200,101,301},p::Role::Working},
                               {3,{100,200,201,301},p::Role::Working}};
  auto separate_display=separate;
  for(auto &area:separate_display) { --area.original.xmax; --area.original.ymax; }
  manual={{{0,0,201,301},{0,0,200,300},{0,1,2,3}}};
  auto separate_edges=p::working_adjacencies(separate,separate_display,manual);
  assert(separate_edges.size()==2);
  assert(separate_edges[0].before_id==0 && separate_edges[0].after_id==1);
  assert(separate_edges[1].before_id==2 && separate_edges[1].after_id==3);
  assert(separate_edges[0].coordinate==separate_edges[1].coordinate);
  assert(separate_edges[0].saved_max<separate_edges[1].saved_min);
  // Collapsed displayed cells and invalid displayed overlap expose no local edge.
  separate_display[0].original.xmax=0;
  separate_display[2].original.xmax=150;
  assert(p::working_adjacencies(separate,separate_display,manual).empty());
  // A fallback nested beneath a recursive cut retains its own mapping/member IDs.
  auto nested=pinwheel;
  nested.push_back({5,{900,0,1201,901},p::Role::Working});
  const p::Rect nested_bounds{20,30,1620,1030};
  std::vector<p::WorkingFallback> nested_nodes;
  seams.clear();
  const auto nested_display=p::working_layout(nested,nested_bounds,4,&seams,&nested_nodes);
  assert(seams.size()==1 && nested_nodes.size()==1);
  assert(seams[0].vertical && seams[0].coordinate==900);
  assert((nested_nodes[0].members==std::vector<int>{0,1,2,3,4}));
  assert(nested_nodes[0].display_bounds.xmax<nested_bounds.xmax);
  assert(nested_nodes[0].saved_bounds.xmax==901);
  const auto nested_edges=p::working_adjacencies(nested,nested_display,nested_nodes);
  assert(nested_edges.size()==8);
  for(const auto &edge:nested_edges) {
    assert(edge.before_id!=5 && edge.after_id!=5);
    assert(edge.node.display_bounds.xmax==nested_nodes[0].display_bounds.xmax);
    assert(edge.line.xmax<=nested_nodes[0].display_bounds.xmax);
  }
  const auto untraced=p::working_layout(nested,nested_bounds,4);
  for(std::size_t i=0;i<untraced.size();++i) {
    assert(untraced[i].id==nested_display[i].id);
    const auto &a=untraced[i].original, &b=nested_display[i].original;
    assert(a.xmin==b.xmin && a.ymin==b.ymin && a.xmax==b.xmax && a.ymax==b.ymax);
  }
  std::cout << "PASS: seam provenance, saved constraints, hidden/connected editors, "
               "horizontal symmetry, invalid topology and displayed minima\n";
}
