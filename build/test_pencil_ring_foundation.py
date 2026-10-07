"""Execute the shipped ring navigation state against contact/presentation sequences."""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile
import unittest
from test_tool_ring import ring_source

def browse_source():
    patch = (Path(__file__).resolve().parents[1] / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
    path = 'source/blender/editors/interface/interface_ipad_ring_browse.hh'
    section = patch.split(f'diff --git a/{path} b/{path}\n', 1)[1].split('diff --git ', 1)[0]
    return '\n'.join(line[1:] for line in section.splitlines()
                     if line.startswith('+') and not line.startswith('+++')) + '\n'

def ghost_source():
    patch = (Path(__file__).resolve().parents[1] / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
    path = 'intern/ghost/GHOST_NavigationIOS.hh'
    section = patch.split(f'diff --git a/{path} b/{path}\n', 1)[1].split('diff --git ', 1)[0]
    return '\n'.join(line[1:] for line in section.splitlines()
                     if line.startswith('+') and not line.startswith('+++')) + '\n'

CPP = r'''
#include "interface_ipad_ring_browse.hh"
#include "GHOST_NavigationIOS.hh"
#include <cassert>
#include <cstdlib>
#include <limits>
using namespace blender::ui::ipad;
using Result = RingInputResult;
std::vector<RingPresentedItem> items(int first=0) {
  const auto shape = tool_ring_layout(20, {0,1000,0,800}, 500,400);
  std::vector<RingPresentedItem> result;
  for(int i=0;i<9;++i) result.push_back({shape.buttons[i],"native-tool-"+std::to_string((first+i)%43)});
  return result;
}
bool present(RingBrowseState &s) {
  return s.publish(s.lifetime,s.desired_generation,items(s.first_item()),43,{0,1000,0,800},500,400,20,"complete-native43",s.rotating);
}
void open(RingBrowseState &s,uint64_t id=19) { s.open(id); assert(present(s)); }
int main(int argc,char **argv) {
  assert(argc==2);
  int which=std::atoi(argv[1]);
  RingBrowseState s; open(s);
  if(which==1) {
    assert(s.press(19,500,492).result==Result::Shield);
    assert(s.motion(19,502,492).result==Result::Shield);
    const auto tap=s.release(19,502,492,false);
    assert(tap.result==Result::Tap && tap.identity=="native-tool-0");
    assert(s.release(19,500,492,false).result==Result::Shield);
    assert(s.press(19,500,400).result==Result::Shield);
    assert(s.release(19,500,400,false).result==Result::Close);
  }
  if(which==2) {
    s.press(19,500,492);
    for(int i=1;i<=10;++i) {
      float angle=i*.2f;
      assert(s.motion(19,500+std::sin(angle)*92,400+std::cos(angle)*92).result==Result::Rebuild);
      assert(!s.ready());
      assert(present(s));
    }
    const auto lifted=s.release(19,items(s.first_item())[0].bounds.xmin+2,
                                items(s.first_item())[0].bounds.ymin+2,false);
    assert(lifted.result==Result::Rebuild && lifted.identity.empty());
    assert(std::floor(s.phase)==s.phase);
    assert(present(s));
    assert(s.release(19,500,492,false).result==Result::Shield);
  }
  if(which==3) {
    s.press(19,500,492);
    ++s.desired_generation;
    assert(s.publish(19,s.desired_generation,items(1),43,{0,1000,0,800},500,400,20));
    assert(s.release(19,500,492,false).result==Result::Shield);
    s.press(19,500,492); s.home(19);
    assert(present(s));
    assert(s.release(19,500,492,false).result==Result::Shield);
    s.press(19,500,492);
    assert(s.release(19,500,492,true).result==Result::Shield);
    assert(s.release(19,500,492,false).result==Result::Shield);
  }
  if(which==4) {
    s.press(19,500,492); s.retire(); open(s,20);
    assert(s.release(19,500,492,false).result==Result::Shield);
    assert(s.roll(19,1,true).result==Result::Shield);
    assert(s.home(19).result==Result::Shield);
    assert(s.phase==0 && s.ready() && !s.contact);
    s.press(20,500,492);
    s.press(20,items(1)[1].bounds.xmin+1,items(1)[1].bounds.ymin+1);
    assert(s.release(20,500,492,false).identity=="native-tool-0");
  }
  if(which==5) {
    assert(s.roll(19,0,true,true).result==Result::Shield);
    assert(s.roll(19,.04f,true).result==Result::Shield && s.phase==0);
    assert(s.roll(19,.32f,true).result==Result::Rebuild && s.phase!=0);
    assert(present(s));
    const float stable=s.phase;
    s.roll(19,3.12f,true,true);
    assert(s.roll(19,-3.12f,true).result==Result::Shield && s.phase==stable);
    // Discontinuous grip-angle changes seed without jumping through tools.
    assert(s.roll(19,-1.f,true).result==Result::Shield && s.phase==stable);
    s.roll(19,0,false);
    assert(s.roll(19,2,true).result==Result::Shield && s.phase==stable);
    s.press(19,500,492);
    assert(s.roll(19,3,true).result==Result::Shield);
    s.release(19,500,492,true);
    assert(s.roll(19,0,true).result==Result::Shield && s.phase==stable);
  }
  if(which==7) {
    using namespace ghost::ios;
    int window_a=0, window_b=0;
    const uint64_t a=new_pencil_ring_lifetime(), b=new_pencil_ring_lifetime();
    assert(a && b>a);
    assert(publish_pencil_ring(&window_a,{a,1,{10,20,300,400}}));
    assert(!publish_pencil_ring(&window_a,{a,0,{10,20,300,400}}));
    assert(!publish_pencil_ring(&window_a,{a,1,{11,20,300,400}}));
    assert(publish_pencil_ring(&window_a,{b,1,{10,20,300,400}}));
    assert(!publish_pencil_ring(&window_a,{a,2,{10,20,300,400}}));
    retire_pencil_ring(&window_a,a);
    assert(pencil_ring_presentation(&window_a).lifetime==b);
    assert(pencil_ring_presentation(&window_b).lifetime==0);
    set_navigation_regions(&window_a,{});
    assert(pencil_ring_presentation(&window_a).lifetime==b);
    assert(pointer_capture_hit(&window_a,20,30)==PointerCaptureKind::None);
    assert(publish_pencil_ring(&window_b,{new_pencil_ring_lifetime(),1,{0,0,100,100}}));
    forget_navigation_window(&window_a);
    assert(pencil_ring_presentation(&window_a).lifetime==0);
    assert(pencil_ring_presentation(&window_b).lifetime!=0);
    for(int i=0;i<10000;++i) {
      auto fresh=new_pencil_ring_lifetime();
      assert(publish_pencil_ring(&window_b,{fresh,1,{0,0,100,100}}));
      retire_pencil_ring(&window_b,fresh-1);
      assert(pencil_ring_presentation(&window_b).lifetime==fresh);
    }
    forget_navigation_window(&window_b);
  }
  if(which==6) {
    auto duplicate=items(); duplicate[1].identity=duplicate[0].identity;
    assert(!s.publish(19,1,duplicate,43,{0,1000,0,800},500,400,20));
    auto outside=items(); outside[0].bounds.xmin=-1;
    assert(!s.publish(19,1,outside,43,{0,1000,0,800},500,400,20));
    assert(!s.publish(19,2,items(),43,{0,1000,0,800},500,400,20));
    assert(!s.publish(20,1,items(),43,{0,1000,0,800},500,400,20));
    assert(!s.publish(19,1,items(),43,{0,1000,0,800},500,400,0));
    assert(s.roll(19,std::numeric_limits<float>::quiet_NaN(),true).result==Result::Shield);
    for(int i=0;i<10000;++i) {
      s.press(19,500,492);
      assert(s.motion(19,520,490).result==Result::Rebuild);
      assert(present(s));
      assert(s.release(19,520,490,true).result==Result::Rebuild);
      assert(!s.rotating && present(s));
      assert(s.first_item()>=0 && s.first_item()<43);
    }
  }
}
'''

class PencilRingFoundationTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        compiler = shutil.which('clang++') or shutil.which('g++') or shutil.which('c++')
        if not compiler and os.name == 'nt':
            candidate = Path('C:/Program Files/LLVM/bin/clang++.exe')
            if candidate.exists(): compiler = str(candidate)
        if not compiler: raise AssertionError('A host C++ compiler is required')
        cls.workspace = tempfile.TemporaryDirectory(prefix='ipad-ring-browse-test-')
        work = Path(cls.workspace.name)
        (work / 'interface_ipad_tool_ring.hh').write_text(ring_source(), encoding='utf-8')
        (work / 'interface_ipad_ring_browse.hh').write_text(browse_source(), encoding='utf-8')
        (work / 'GHOST_NavigationIOS.hh').write_text(ghost_source(), encoding='utf-8')
        (work / 'test.cc').write_text(CPP, encoding='utf-8')
        cls.binary = work / ('test.exe' if os.name == 'nt' else 'test')
        subprocess.run([compiler,'-std=c++17','-Wall','-Wextra','-Werror',str(work/'test.cc'),
                        '-o',str(cls.binary)], check=True)
    @classmethod
    def tearDownClass(cls): cls.workspace.cleanup()
    def run_case(self, case): subprocess.run([str(self.binary),str(case)], check=True)
    def test_tap_uses_presented_identity_and_gap_closes(self): self.run_case(1)
    def test_rotation_and_terminal_snap_never_select(self): self.run_case(2)
    def test_redraw_reset_and_cancellation_refuse_old_release(self): self.run_case(3)
    def test_retired_lifetime_and_repeated_contact_cannot_retarget(self): self.run_case(4)
    def test_hover_roll_wrap_grip_filter_contact_and_reacquisition(self): self.run_case(5)
    def test_invalid_presentations_and_ten_thousand_cancelled_browses(self): self.run_case(6)
    def test_window_publication_retirement_reuse_and_navigation_independence(self): self.run_case(7)

if __name__ == '__main__': unittest.main()
