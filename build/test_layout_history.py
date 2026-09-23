"""Compile exact saved-layout recognition and reference checks from the overlay."""
from pathlib import Path
import unittest

import test_ipad_panels


def added_functions(patch, source_path, signatures):
    section = patch.split(f'diff --git a/{source_path} b/{source_path}\n', 1)[1].split('diff --git ', 1)[0]
    source = ''.join(line[1:] for line in section.splitlines(True)
                     if line.startswith('+') and not line.startswith('+++'))
    result = []
    for signature in signatures:
        start = source.index(signature)
        brace = source.index('{', start)
        depth = 0
        for pos in range(brace, len(source)):
            depth += source[pos] == '{'
            depth -= source[pos] == '}'
            if depth == 0:
                result.append(source[start:pos + 1])
                break
        else:
            raise AssertionError(f'Unterminated function {signature}')
    return '\n'.join(result)


class LayoutHistoryTests(unittest.TestCase):
    def test_swap_refuses_to_mutate_without_checkpoint(self):
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        function = added_functions(
            patch,
            'source/blender/editors/screen/screen_ipad_panels.cc',
            ['static wmOperatorStatus working_swap_exec'])
        capture = function.index('if (!ED_ipad_panels_layout_checkpoint_capture(C, "Before Swap"))')
        cancel = function.index('return OPERATOR_CANCELLED;', capture)
        mutation = function.index('ED_area_swapspace(C, source, model.areas[target]);')
        self.assertLess(capture, cancel)
        self.assertLess(cancel, mutation)

    def test_checkpoint_validity_and_all_native_references(self):
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        functions = added_functions(
            patch,
            'source/blender/editors/screen/screen_ipad_layout_history.cc',
            ['bool layout_is_checkpoint', 'std::string layout_unique_name',
             'bool layout_checkpoint_referenced'])
        panels = added_functions(
            patch,
            'source/blender/editors/screen/screen_ipad_panels.cc',
            ['static bool working_areas_are_full_edge_neighbors',
             'static int working_area_index_after_join',
             'static void working_area_indices_remap_after_join'])
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(PREFIX + functions + panels + CASES)

    def test_restore_names_outgoing_checkpoints_uniquely(self):
        repo = Path(__file__).resolve().parents[1]
        patch = (repo / 'patches/blender-ipad.patch').read_text(encoding='utf-8')
        restore = added_functions(
            patch,
            'source/blender/editors/screen/screen_ipad_layout_history.cc',
            ['static wmOperatorStatus layout_restore_exec'])
        unique_name = restore.index('layout_unique_name(workspace, "Before Restore")')
        set_name = restore.index('BKE_workspace_layout_name_set(workspace, outgoing, outgoing_name.c_str())')
        self.assertLess(unique_name, set_name)


PREFIX = r'''
#include <cassert>
#include <iostream>
#include <string>
#include <vector>
constexpr int screen_ipad_layout_checkpoint = 4;
constexpr int SCREENNORMAL = 0;
struct ScrArea {ScrArea *next=nullptr;int direction=-1,offset1=0,offset2=0;};
struct ListBase {void *first=nullptr;};
struct bScreen {int flag=0,state=0;bool temp=false,fullscreen=false,used=false;ListBase areabase;int ipad_panel_active[2]{},ipad_panel_owner=0;};
struct WorkSpaceLayout {WorkSpaceLayout *next=nullptr;bScreen *screen=nullptr;std::string name;};
struct WorkSpaceDataRelation {WorkSpaceDataRelation *next=nullptr;void *value=nullptr;};
struct WorkSpace {ListBase layouts,hook_layout_relations;};
struct WorkSpaceInstanceHook {WorkSpaceLayout *act_layout=nullptr,*temp_layout_store=nullptr;};
struct wmWindow {wmWindow *next=nullptr;WorkSpaceInstanceHook *workspace_hook=nullptr;};
struct wmWindowManager {wmWindowManager *next=nullptr;ListBase windows;};
struct Main {ListBase wm;};
#define LISTBASE_FOREACH(type,var,list) for(type var=static_cast<type>((list)->first);var;var=var->next)
enum eScreenDir {SCREEN_DIR_NONE=-1,SCREEN_DIR_E=1};
eScreenDir area_getorientation(ScrArea *source,ScrArea *) {return eScreenDir(source->direction);}
void area_getoffsets(ScrArea *source,ScrArea *,eScreenDir,int *a,int *b) {*a=source->offset1;*b=source->offset2;}
int BLI_findindex(const ListBase *list,const ScrArea *wanted) {int i=0;for(auto *a=static_cast<ScrArea *>(list->first);a;a=a->next,++i)if(a==wanted)return i;return -1;}
struct Model {std::vector<ScrArea *> areas;};
const char *BKE_workspace_layout_name_get(const WorkSpaceLayout *layout) {return layout->name.c_str();}
const bScreen *BKE_workspace_layout_screen_get(const WorkSpaceLayout *layout) {return layout->screen;}
bool BKE_screen_is_fullscreen_area(const bScreen *screen) {return screen->fullscreen;}
bool BKE_screen_is_used(const bScreen *screen) {return screen->used;}
'''

CASES = r'''
int main() {
 bScreen screen; WorkSpaceLayout layout; layout.screen=&screen;
 screen.flag=screen_ipad_layout_checkpoint;
 assert(layout_is_checkpoint(&layout));
 screen.temp=true; assert(!layout_is_checkpoint(&layout)); screen.temp=false;
 screen.fullscreen=true; assert(!layout_is_checkpoint(&layout)); screen.fullscreen=false;
 screen.state=1; assert(!layout_is_checkpoint(&layout)); screen.state=SCREENNORMAL;
 screen.flag=0; assert(!layout_is_checkpoint(&layout)); screen.flag=screen_ipad_layout_checkpoint;

 WorkSpace workspace; Main main; WorkSpaceDataRelation relation; relation.value=&layout;
 workspace.hook_layout_relations.first=&relation;
 assert(layout_checkpoint_referenced(&main,&workspace,&layout));
 relation.value=nullptr;
 WorkSpaceInstanceHook hook; wmWindow win; wmWindowManager wm;
 win.workspace_hook=&hook; wm.windows.first=&win; main.wm.first=&wm;
 hook.act_layout=&layout; assert(layout_checkpoint_referenced(&main,&workspace,&layout));
 hook.act_layout=nullptr; hook.temp_layout_store=&layout;
 assert(layout_checkpoint_referenced(&main,&workspace,&layout));
 hook.temp_layout_store=nullptr;
 assert(!layout_checkpoint_referenced(&main,&workspace,&layout));
 screen.used=true; assert(layout_checkpoint_referenced(&main,&workspace,&layout));

 WorkSpace names; WorkSpaceLayout first,second,third,fourth; first.name="Before Split";first.next=&second;
 second.name="Before Split 2";second.next=&third;third.name="Before Restore";third.next=&fourth;
 fourth.name="Before Restore 2";names.layouts.first=&first;
 assert(layout_unique_name(&names,"Before Split")=="Before Split 3");
 assert(layout_unique_name(&names,"Before Swap")=="Before Swap");
 assert(layout_unique_name(&names,"Before Restore")=="Before Restore 3");

 ScrArea keep,removed,last;keep.direction=SCREEN_DIR_E;keep.next=&last;
 assert(working_areas_are_full_edge_neighbors(&keep,&removed));
 keep.offset1=1;assert(!working_areas_are_full_edge_neighbors(&keep,&removed));keep.offset1=0;keep.offset2=-1;
 assert(!working_areas_are_full_edge_neighbors(&keep,&removed));keep.offset2=0;keep.direction=SCREEN_DIR_NONE;
 assert(!working_areas_are_full_edge_neighbors(&keep,&removed));
 bScreen live;live.areabase.first=&keep;live.ipad_panel_active[0]=1;live.ipad_panel_active[1]=2;live.ipad_panel_owner=3;
 Model before{{&keep,&removed,&last}};
 working_area_indices_remap_after_join(&live,before,&removed);
 assert(live.ipad_panel_active[0]==1 && live.ipad_panel_active[1]==0 && live.ipad_panel_owner==2);
 live.ipad_panel_active[0]=-2;working_area_indices_remap_after_join(&live,before,&removed);
 assert(live.ipad_panel_active[0]==-2);
 std::cout << "PASS: saved layout flags and workspace/window references are preserved\n";
}
'''
