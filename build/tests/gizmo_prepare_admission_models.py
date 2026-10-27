"""Bounded actual-source execution; never edits or repairs production source.

Existing bridge records provide explicit native list/object/registry/allocation
boundaries. Group callbacks below are controlled emitters into a modeled GPU
pixel counter. Actual pixels are established separately by the stock Blender
counterexample, never by this portable C++ fixture. This is no SDK/device test.
"""
from pathlib import Path
import argparse, ast, atexit, hashlib, json, os, re, shutil, subprocess, sys, time

parser = argparse.ArgumentParser()
parser.add_argument('--repo', type=Path, required=True)
parser.add_argument('--source-dir', type=Path)
parser.add_argument('--output-dir', type=Path, required=True)
parser.add_argument('--opt-level', choices=['0', '2', 'both'], default='both')
parser.add_argument('--run-nonce', required=True)
OPT = parser.parse_args()
STARTED_NS = time.time_ns()
REPO = OPT.repo.resolve()
OUT = OPT.output_dir.resolve()
OUT.mkdir(parents=True, exist_ok=True)
HISTORICAL_REVISION = '30da0be80a073ef6a6fc5ce634a2039bbb946afd'
HISTORICAL_FIXTURE_SHA256 = 'f36d8b15a8d473f62e4a2bed30514d938bd91da15810409f6c5dde6aae180910'
HISTORICAL_PATCH_SHA256 = '2be762dedb0f15238beb6f5a5cc77d09edcc62210cf3beced3cb9cb3bbc6c912'
REPORT_WRITTEN = False
FAILURE = dict(kind='INCOMPLETE', message='Driver did not complete compilation and all controls')
results = []
report_path = OUT / 'test-results.json'
if report_path.exists():
    report_path.rename(OUT / f'previous-driver-report-{time.time_ns()}.json')

def sha(data):
    return hashlib.sha256(data if isinstance(data, bytes) else data.encode()).hexdigest()

SCRIPT_SHA256 = sha(Path(__file__).read_bytes())
TEST_SHA256 = sha((REPO / 'build/test_pencil_gizmo_prepare_admission.py').read_bytes())

def failed_report():
    if not REPORT_WRITTEN:
        report = dict(status='FAIL_OR_INCOMPLETE', started_ns=STARTED_NS,
                      run_nonce=OPT.run_nonce, script_sha256=SCRIPT_SHA256,
                      test_sha256=TEST_SHA256,
                      count=len(results), results=results, failure=FAILURE,
                      actual_prepare_hierarchy_probe_and_full_redraw=False,
                      historical_revision=HISTORICAL_REVISION)
        report_path.write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')

def record_exception(kind, value, traceback):
    global FAILURE
    FAILURE = dict(kind=kind.__name__, message=str(value))
    sys.__excepthook__(kind, value, traceback)

atexit.register(failed_report)
sys.excepthook = record_exception

def function(source, signature):
    start = source.index(signature)
    brace = source.index('{', start)
    depth = 0
    for end in range(brace, len(source)):
        depth += (source[end] == '{') - (source[end] == '}')
        if depth == 0:
            return source[start:end + 1]
    raise AssertionError(signature)

bridge_driver = REPO / 'build/tests/knife_pan_bridge_models.py'
bridge_text = bridge_driver.read_text(encoding='utf-8')
bridge_ast = ast.parse(bridge_text)
main_index = next(i for i, node in enumerate(bridge_ast.body)
                  if isinstance(node, ast.Assign) and any(isinstance(t, ast.Name) and t.id == 'main' for t in node.targets))
bridge_fixture = ast.literal_eval(bridge_ast.body[main_index].value)
bridge_fixture = bridge_fixture[:bridge_fixture.index('int main(')]

if OPT.source_dir:
    ROOT = OPT.source_dir.resolve()
else:
    sys.path.insert(0, str(REPO / 'build'))
    import preflight, test_touch_extrude as touch
    pin = preflight.pinned_commit(REPO)
    cache = REPO / '.cache/preflight'
    touch.PIN_ROOT = cache / pin
    touch.changed_source.cache_clear()
    wrapper_ast = ast.parse((REPO / 'build/test_pencil_knife_pan_bridge.py').read_text(encoding='utf-8'))
    paths = next(ast.literal_eval(n.value) for n in wrapper_ast.body if isinstance(n, ast.Assign)
                 and any(isinstance(t, ast.Name) and t.id == 'PATHS' for t in n.targets))
    ROOT = OUT / 'materialized'
    for path in paths:
        marker = f'diff --git a/{path} b/{path}\n'
        data = touch.changed_source(path) if marker in touch.PATCH_TEXT else preflight.get_source(pin, path, cache, False).decode('utf-8')
        target = ROOT / path
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(data, encoding='utf-8', newline='\n')

# Reuse data shapes and the actual connected hierarchy/context/probe chain, not
# its old assertions or case runner. All replacements below are fixture records.
sys.path.insert(0, str(REPO / 'build'))
import preflight
pin = preflight.pinned_commit(REPO)
for path in ['source/blender/blenkernel/intern/context.cc',
             'source/blender/blenkernel/intern/workspace.cc',
             'intern/ghost/intern/GHOST_EventManager.cc',
             'intern/ghost/intern/GHOST_System.hh']:
    preflight.get_source(pin, path, REPO / '.cache/preflight', False)

namespace = {'__file__': str(bridge_driver), '__name__': 'gizmo_prepare_bridge_boundary'}
saved_argv = sys.argv
sys.argv = [str(bridge_driver), '--repo', str(REPO), '--source-dir', str(ROOT),
            '--output-dir', str(OUT), '--opt-level', OPT.opt_level]
try:
    exec(compile(ast.Module(body=bridge_ast.body[:main_index], type_ignores=[]), str(bridge_driver), 'exec'), namespace)
finally:
    sys.argv = saved_argv
source = namespace['source']

def shape(signature, replacement):
    global source
    original = function(source, signature) + ';'
    assert source.count(original) == 1, signature
    source = source.replace(original, replacement)

shape('struct wmGizmoType{', 'struct wmGizmoType{void(*draw)()=nullptr;};')
shape('struct wmGizmo:Link{', 'struct wmGizmo:Link{wmGizmoGroup*parent_gzgroup=nullptr;wmGizmoType*type=nullptr;int flag=0,state=0;float matrix_basis[4][4]{},scale_basis=1;};')
shape('struct wmGizmoGroupType{', '''struct wmGizmoGroupType{char idname[64]="UNKNOWN",owner_id[128]{};int flag=0;struct{void*call=nullptr;}rna_ext;void*keymap=(void*)1;bool(*poll)(const bContext*,wmGizmoGroupType*)=nullptr;void(*setup)(const bContext*,wmGizmoGroup*)=nullptr;void(*refresh)(const bContext*,wmGizmoGroup*)=nullptr;void(*draw_prepare)(const bContext*,wmGizmoGroup*)=nullptr;};''')
shape('struct wmGizmoGroup:Link{', 'struct wmGizmoGroup:Link{wmGizmoGroupType*type=nullptr;wmGizmoMap*parent_gzmap=nullptr;int tag_remove=0,init_flag=1;struct{int any=0;}hide;ListBase gizmos;};')
shape('struct wmGizmoMap{', 'struct wmGizmoMap{ListBase groups;bool is_init=true;int update_flag[2]{};struct{wmGizmo*modal=nullptr;}gzmap_context;};')
shape('struct ARegionRuntime{', 'struct ARegionRuntime{int do_draw=0;ListBase uiblocks;wmGizmoMap*gizmo_map=nullptr;bool ipad_floating=false,visible=true,ipad_canvas=true;ARegionType*type=nullptr;void*headerstr=nullptr;rcti ipad_canvas_rect;wmDrawBuffer*draw_buffer=nullptr;bool ipad_finger_paint_overlay_blocked=false,ipad_finger_paint_navigation_drawn=false,ipad_knife_canvas_unknown_widgets=false;std::array<uint64_t,23>ipad_knife_canvas_drawn_owner{};};')
shape('struct AreaRuntime{', 'struct AreaRuntime{rcti ipad_navigation_rect;int ipad_layer=1;bool is_tool_set=true;bToolRef*tool=nullptr;};')
shape('struct wmWindow:Link{', 'struct wmWindow:Link{void*stereo3d_format=nullptr;int sizex=800,sizey=600;void*ghostwin=(void*)55;wmEvent*eventstate=nullptr;ListBase gesture,drawcalls;int winid=17;WorkSpaceInstanceHook*workspace_hook=nullptr;wmWindowRuntime*runtime=nullptr;ListBase modalhandlers;bScreen*screen=nullptr;Scene*scene=nullptr;char view_layer_name[64]="Layer";};')
bridge_fixture = bridge_fixture.replace('othertype.poll=+[]()->bool', 'othertype.poll=+[](const bContext*,wmGizmoGroupType*)->bool')

gizmo_path = 'source/blender/windowmanager/gizmo/intern/wm_gizmo_map.cc'
group_path = 'source/blender/windowmanager/gizmo/intern/wm_gizmo_group.cc'
panels_path = 'source/blender/editors/screen/screen_ipad_panels.cc'
draw_path = 'source/blender/windowmanager/intern/wm_draw.cc'
gizmo = (ROOT / gizmo_path).read_text(encoding='utf-8')
panels = (ROOT / panels_path).read_text(encoding='utf-8')
draw = (ROOT / draw_path).read_text(encoding='utf-8')
sys.path.insert(0, str(REPO / 'build'))
import preflight
pin = preflight.pinned_commit(REPO)
group = preflight.get_source(pin, group_path, REPO / '.cache/preflight', False).decode('utf-8')
prepare = function(gizmo, 'static void gizmomap_prepare_drawing(')
capture = function(panels, 'static bool ipad_knife_hierarchy_native_capture(')
full_loop = function(draw, 'static void wm_ipad_finger_rect_copy(') + '\n' + function(draw, 'static void wm_draw_area_offscreen(')
actual_group = '\n'.join(function(group, sig) for sig in [
    'bool wm_gizmogroup_is_visible_in_drawstep(',
    'bool WM_gizmo_group_type_poll(', 'void WM_gizmogroup_ensure_init('])
boundary = r'''
#define BLI_assert_unreachable() assert(false)
using eWM_GizmoFlagMapDrawStep=int;
constexpr int WM_GIZMOMAP_DRAWSTEP_2D=0,WM_GIZMOMAP_DRAWSTEP_3D=1;
constexpr int WM_GIZMOGROUPTYPE_3D=1,WM_GIZMOGROUPTYPE_DRAW_MODAL_EXCLUDE=2,WM_GIZMOGROUPTYPE_DRAW_MODAL_ALL=4;
constexpr int WM_GIZMOGROUP_INIT_REFRESH=2,GIZMOMAP_IS_REFRESH_CALLBACK=1,GIZMOMAP_IS_PREPARE_DRAW=2;
static int pixel_counter=0,poll_calls=0,setup_calls=0,keymap_calls=0,refresh_calls=0,prepare_calls=0,per_gizmo_calls=0,region_draws=0;
static bool callback_markers_valid=true;
static bool expect_mark=true,poll_result=true,hide_in_setup=false,hide_in_refresh=false,remove_gizmos=false;
static std::string emit_phase="prepare",unlink_phase;
static wmGizmoGroup*active_group=nullptr;
static const bContext*callback_context=nullptr;
static bool BKE_workspace_owner_id_check(const WorkSpace*,const char*){return true;}
static WorkSpace*CTX_wm_workspace(const bContext*C){return C->wm.window->workspace_hook->active;}
static void observe(const bContext*C,const char*phase){
 ARegion*r=CTX_wm_region(C);assert(r&&r->runtime);
 callback_markers_valid &= r->runtime->ipad_knife_canvas_unknown_widgets==expect_mark;
 callback_markers_valid &= r->runtime->ipad_finger_paint_overlay_blocked==expect_mark;
 if(emit_phase==phase)pixel_counter+=17; // GPU storage boundary, never measured GPU pixels.
 if(unlink_phase==phase&&BLI_findindex(&active_group->parent_gzmap->groups,active_group)!=-1)
   BLI_remlink(&active_group->parent_gzmap->groups,active_group); // Unlink only; native allocator lifetime is outside this model.
}
static bool callback_poll(const bContext*C,wmGizmoGroupType*){++poll_calls;observe(C,"poll");return poll_result;}
static void callback_setup(const bContext*C,wmGizmoGroup*g){++setup_calls;observe(C,"setup");if(hide_in_setup)g->hide.any=1;}
static void callback_refresh(const bContext*C,wmGizmoGroup*g){++refresh_calls;observe(C,"refresh");if(hide_in_refresh)g->hide.any=1;}
static void callback_prepare(const bContext*C,wmGizmoGroup*g){++prepare_calls;observe(C,"prepare");if(remove_gizmos)g->gizmos={};}
static void wm_gizmogrouptype_setup_keymap(wmGizmoGroupType*t,wmKeyConfig*){++keymap_calls;observe(callback_context,"keymap");t->keymap=(void*)1;}
static void WM_gizmo_group_refresh(const bContext*C,wmGizmoGroup*g){if(!g->hide.any&&g->type->refresh)g->type->refresh(C,g);} // Callback wrapper boundary; no delay-for-tweak branch in any control.
static bool gizmo_prepare_drawing(wmGizmoMap*,wmGizmo*,const bContext*,ListBase*,eWM_GizmoFlagMapDrawStep){++per_gizmo_calls;return false;} // Per-gizmo GPU selection is outside the empty-group obligation.
'''
source += boundary + actual_group + '\n' + prepare

# Render/allocation boundary functions let the *entire* actual full-area draw
# loop decide whether to reset transient evidence and mint a new texture stamp.
draw_boundary = r'''
constexpr int RGN_FLAG_POLL_FAILED=16,RGN_FLAG_DYNAMIC_SIZE=32,RGN_FLAG_TOO_SMALL=64,RGN_DRAW=1,RGN_DRAW_PARTIAL=2;
using eStereoViews=int;constexpr int STEREO_LEFT_ID=0,STEREO_RIGHT_ID=1;
struct IPadFingerPaintOwner{bool valid=false;std::array<uint64_t,19>values{};std::array<char,64>tool{};};
static Main*CTX_data_main(bContext*){return G_MAIN;}
static Scene*CTX_data_scene(bContext*C){return C->wm.window->scene;}
static ViewLayer*CTX_data_view_layer(bContext*C){return BKE_view_layer_find(C->wm.window->scene,C->wm.window->view_layer_name);}
static void WM_toolsystem_update_from_context(bContext*,WorkSpace*,Scene*,ViewLayer*,ScrArea*){assert(false);}
static void UI_ipad_corner_hud_refresh(bContext*,ScrArea*){}
static const char*wm_area_name(ScrArea*){return "area";}
static void GPU_debug_group_begin(const char*){}static void GPU_debug_group_end(){}
static void ED_ipad_hud_layout_begin(bContext*,wmWindow*,ScrArea*,ARegion*){}
static void ED_region_do_layout(bContext*,ARegion*){}
static void ED_ipad_hud_layout_end(bContext*,wmWindow*,ScrArea*,ARegion*){}
static void ED_area_update_region_sizes(wmWindowManager*,wmWindow*,ScrArea*){}
static bool WM_region_use_viewport(ScrArea*,ARegion*){return true;}
static void ED_ipad_finger_paint_capture(bContext*,IPadFingerPaintOwner&){}
static bool wm_draw_region_stereo_set(Main*,ScrArea*,ARegion*,int){return true;}
static void wm_draw_region_buffer_create(Scene*,ARegion*r,bool stereo,bool){assert(r->runtime->draw_buffer);r->runtime->draw_buffer->stereo=stereo;}
static void wm_draw_region_bind(ARegion*,int){}static void wm_draw_region_unbind(ARegion*){}
static void ED_region_do_draw(bContext*C,ARegion*r){++region_draws;pixel_counter=0;ListBase drawn;gizmomap_prepare_drawing(r->runtime->gizmo_map,C,&drawn,WM_GIZMOMAP_DRAWSTEP_2D);assert(!drawn.first);}
static void GPU_viewport_stereo_composite(GPUViewport*,void*){}
static void ED_ipad_hud_draw_end(bContext*,wmWindow*,ScrArea*,ARegion*){}
static void BLI_rcti_translate(rcti*r,int x,int y){r->xmin+=x;r->xmax+=x;r->ymin+=y;r->ymax+=y;}
static void BLI_strncpy(char*d,const char*s,size_t n){std::strncpy(d,s,n);}
static void ED_region_tag_redraw(ARegion*){}
'''
source += draw_boundary + full_loop + '\n'
source += function(panels, 'void ED_ipad_knife_hierarchy_region_presented(') + '\n'
source += function(panels, 'void ED_ipad_knife_hierarchy_window_callbacks(') + '\n' + bridge_fixture

main = r'''
static void restore(Fixture&f){CTX_wm_area_set(&f.C,&f.area);CTX_wm_region_set(&f.C,&f.region);}
static void full_draw(Fixture&f,int flags=RGN_DRAW){f.runtime.do_draw=flags;wm_draw_area_offscreen(&f.C,&f.win,&f.area,false);restore(f);}
static bool native_settled(Fixture&f){IPadKnifeHierarchyNative n;assert(ipad_knife_hierarchy_native_capture(&f.C,&f.win,n));return n.settled;}
static bool same_stamp(const wmIPadKnifeCanvasStamp&a,const wmIPadKnifeCanvasStamp&b){return a.valid==b.valid&&a.content==b.content&&a.scope==b.scope&&a.drawn_owner==b.drawn_owner&&a.unknown_widgets==b.unknown_widgets;}
int main(int argc,char**argv){assert(argc==2);std::string which=argv[1];Fixture f;f.live();assert(f.capture().valid());
 auto previous=f.capture();
 f.map.groups={};wmGizmoGroupType type;wmGizmoGroup g;wmGizmo gz;g.type=&type;g.parent_gzmap=&f.map;g.init_flag=0;type.rna_ext.call=(void*)1;
 type.poll=callback_poll;type.setup=callback_setup;type.refresh=callback_refresh;type.draw_prepare=callback_prepare;type.keymap=nullptr;
 BLI_addtail(&f.map.groups,&g);active_group=&g;callback_context=&f.C;
 if(which.rfind("current-",0)==0){
   if(which=="current-new-after-capture")assert(!f.validate(previous));
   if(which=="current-removal-tagged")g.tag_remove=1;
   if(which=="current-hidden")g.hide.any=1;
   if(which=="current-initialized")g.init_flag=WM_GIZMOGROUP_INIT_SETUP|WM_GIZMOGROUP_INIT_REFRESH;
   if(which=="current-navigation-name")std::strcpy(type.idname,"VIEW3D_GGT_navigate");
   if(which=="current-native-empty")type.rna_ext.call=nullptr;
   f.present();bool allowed=f.capture().valid();
   std::cout<<"WITNESS current allowed="<<allowed<<" settled="<<native_settled(f)<<std::endl;
   if(which=="current-native-empty")assert(allowed&&native_settled(f));
   else assert(!allowed&&!native_settled(f));
   assert(poll_calls==0&&setup_calls==0&&refresh_calls==0&&prepare_calls==0&&pixel_counter==0);
 }
 else if(which.rfind("cache-",0)==0){
   unlink_phase="prepare";full_draw(f);auto stamp=f.buffer.ipad_knife_canvas_stamp;
   std::cout<<"WITNESS cache valid="<<stamp.valid<<" unknown="<<stamp.unknown_widgets<<" modeled_pixels="<<pixel_counter<<" groups="<<bool(f.map.groups.first)<<std::endl;
   assert(stamp.valid&&stamp.unknown_widgets&&pixel_counter==17&&!f.map.groups.first);
   assert(f.runtime.ipad_finger_paint_overlay_blocked&&f.runtime.ipad_knife_canvas_unknown_widgets);
   f.present();assert(!f.capture().valid());int before=region_draws;
   if(which=="cache-no-redraw"){full_draw(f,0);f.present();assert(region_draws==before&&pixel_counter==17&&same_stamp(f.buffer.ipad_knife_canvas_stamp,stamp)&&!f.capture().valid());}
   else if(which=="cache-runtime-reset"){f.runtime.ipad_knife_canvas_unknown_widgets=false;f.runtime.ipad_finger_paint_overlay_blocked=false;f.present();assert(pixel_counter==17&&same_stamp(f.buffer.ipad_knife_canvas_stamp,stamp)&&!f.capture().valid());}
   else if(which=="cache-full-clears"){full_draw(f);f.present();assert(region_draws==before+1&&pixel_counter==0&&!f.buffer.ipad_knife_canvas_stamp.unknown_widgets&&f.buffer.ipad_knife_canvas_stamp.content>stamp.content&&f.capture().valid());}
   else if(which=="cache-partial-refuses"){full_draw(f,RGN_DRAW|RGN_DRAW_PARTIAL);f.present();assert(!f.buffer.ipad_knife_canvas_stamp.valid&&!f.capture().valid());full_draw(f);f.present();assert(f.capture().valid());}
   else assert(false);
 }
 else {
   int drawstep=WM_GIZMOMAP_DRAWSTEP_2D;
   if(which=="prepare-poll-pixels-false"){emit_phase="poll";poll_result=false;}
   if(which=="prepare-poll-unlinks"){emit_phase="poll";unlink_phase="poll";poll_result=false;}
   if(which=="prepare-setup-hides"){emit_phase="setup";hide_in_setup=true;}
   if(which=="prepare-setup-unlinks"){emit_phase="setup";unlink_phase="setup";hide_in_setup=true;}
   if(which=="prepare-refresh-unlinks"){emit_phase="refresh";unlink_phase="refresh";hide_in_refresh=true;}
   if(which=="prepare-draw-unlinks")unlink_phase="prepare";
   if(which=="prepare-removes-final-gizmos"){BLI_addtail(&g.gizmos,&gz);remove_gizmos=true;}
   if(which=="prepare-drawstep-skipped"){type.flag=WM_GIZMOGROUPTYPE_3D;expect_mark=false;emit_phase="none";}
   if(which=="prepare-native-empty"){type.rna_ext.call=nullptr;expect_mark=false;emit_phase="none";}
   if(which=="prepare-modal-exclude"){gz.parent_gzgroup=&g;f.map.gzmap_context.modal=&gz;type.flag=WM_GIZMOGROUPTYPE_DRAW_MODAL_EXCLUDE;emit_phase="none";}
   if(which=="prepare-modal-other-excluded"){f.map.gzmap_context.modal=&gz;emit_phase="poll";}
   if(which=="prepare-force-refresh"){g.init_flag=WM_GIZMOGROUP_INIT_SETUP|WM_GIZMOGROUP_INIT_REFRESH;f.map.update_flag[drawstep]=GIZMOMAP_IS_REFRESH_CALLBACK|GIZMOMAP_IS_PREPARE_DRAW;}
   if(which=="prepare-already-initialized")g.init_flag=WM_GIZMOGROUP_INIT_SETUP|WM_GIZMOGROUP_INIT_REFRESH;
   ListBase selected;gizmomap_prepare_drawing(&f.map,&f.C,&selected,drawstep);
   std::cout<<"WITNESS prepare unknown="<<f.runtime.ipad_knife_canvas_unknown_widgets<<" blocked="<<f.runtime.ipad_finger_paint_overlay_blocked<<" modeled_pixels="<<pixel_counter<<std::endl;
   bool skipped=which=="prepare-drawstep-skipped"||which=="prepare-modal-exclude";
   assert(f.runtime.ipad_knife_canvas_unknown_widgets==expect_mark&&f.runtime.ipad_finger_paint_overlay_blocked==expect_mark);
   assert(!selected.first&&per_gizmo_calls==0);
   if(skipped)assert(poll_calls==0&&setup_calls==0&&refresh_calls==0&&prepare_calls==0&&pixel_counter==0);
   else {
     assert(poll_calls==1);
     bool poll_only=which=="prepare-poll-pixels-false"||which=="prepare-poll-unlinks"||which=="prepare-modal-other-excluded";
     if(poll_only)assert(setup_calls==0&&refresh_calls==0&&prepare_calls==0&&pixel_counter==17);
     else if(which=="prepare-setup-hides"||which=="prepare-setup-unlinks")assert(setup_calls==1&&keymap_calls==1&&refresh_calls==0&&prepare_calls==0&&pixel_counter==17);
     else if(which=="prepare-refresh-unlinks")assert(setup_calls==1&&keymap_calls==1&&refresh_calls==1&&prepare_calls==0&&pixel_counter==17);
     else if(which=="prepare-already-initialized")assert(setup_calls==0&&keymap_calls==0&&refresh_calls==0&&prepare_calls==1&&pixel_counter==17);
     else if(which=="prepare-force-refresh")assert(setup_calls==0&&keymap_calls==0&&refresh_calls==1&&prepare_calls==1&&pixel_counter==17);
     else assert(setup_calls==1&&keymap_calls==1&&refresh_calls==1&&prepare_calls==1&&pixel_counter==(expect_mark?17:0));
   }
   if(!unlink_phase.empty())assert(!f.map.groups.first);
   if(remove_gizmos)assert(!g.gizmos.first);
   assert(!(f.map.update_flag[drawstep]&GIZMOMAP_IS_PREPARE_DRAW));
 }
 assert(callback_markers_valid);
 assert(provider_callbacks==0&&native_calls==0&&poison_calls==0&&ctx_allocs==ctx_frees);
 std::cout<<which<<" PASS modeled_pixels="<<pixel_counter<<" callbacks="<<poll_calls<<","<<setup_calls<<","<<keymap_calls<<","<<refresh_calls<<","<<prepare_calls<<"\n";
}
'''
source += main
cases = ['prepare-empty-pixels', 'prepare-poll-pixels-false', 'prepare-poll-unlinks',
         'prepare-setup-hides', 'prepare-setup-unlinks', 'prepare-refresh-unlinks',
         'prepare-draw-unlinks', 'prepare-removes-final-gizmos', 'prepare-drawstep-skipped',
         'prepare-native-empty', 'prepare-modal-exclude', 'prepare-modal-other-excluded',
         'prepare-force-refresh', 'prepare-already-initialized', 'current-empty',
         'current-hidden', 'current-uninitialized', 'current-initialized', 'current-removal-tagged',
         'current-navigation-name', 'current-native-empty', 'current-new-after-capture',
         'cache-no-redraw', 'cache-runtime-reset', 'cache-full-clears', 'cache-partial-refuses']
historical_path = REPO / 'build/tests/gizmo_prepare_historical_30da0be.cc'
historical_text = historical_path.read_text(encoding='utf-8')
historical_provenance = json.loads((historical_path.with_suffix('.json')).read_text(encoding='utf-8'))
assert historical_provenance['revision'] == HISTORICAL_REVISION
assert historical_provenance['patch_git_blob_sha256'] == HISTORICAL_PATCH_SHA256
assert historical_provenance['fixture_sha256'] == sha(historical_path.read_bytes()) == HISTORICAL_FIXTURE_SHA256, 'historical source fixture modified'
old_prepare = function(historical_text, 'static void gizmomap_prepare_drawing(')
old_capture = function(historical_text, 'static bool ipad_knife_hierarchy_native_capture(')
assert sha(old_prepare) == historical_provenance['prepare_sha256']
assert sha(old_capture) == historical_provenance['capture_sha256']
historical_source = source.replace(prepare, old_prepare).replace(capture, old_capture)
historical_cases = ['prepare-empty-pixels', 'current-empty', 'cache-no-redraw']
historical_obligations = {
    'prepare-empty-pixels': ('f.runtime.ipad_knife_canvas_unknown_widgets==expect_mark&&f.runtime.ipad_finger_paint_overlay_blocked==expect_mark',
                             'WITNESS prepare unknown=0 blocked=0 modeled_pixels=17'),
    'current-empty': ('!allowed&&!native_settled(f)', 'WITNESS current allowed=1 settled=1'),
    'cache-no-redraw': ('stamp.valid&&stamp.unknown_widgets&&pixel_counter==17&&!f.map.groups.first',
                        'WITNESS cache valid=1 unknown=0 modeled_pixels=17 groups=0'),
}
compiler = shutil.which('clang++') or shutil.which('g++') or r'C:/Program Files/LLVM/bin/clang++.exe'
for opt in (['0', '2'] if OPT.opt_level == 'both' else [OPT.opt_level]):
    for label, text, selected in [('current', source, cases), ('historical', historical_source, historical_cases)]:
        cpp = OUT / f'actual-gizmo-prepare-{label}.cc'
        cpp.write_text(text, encoding='utf-8', newline='\n')
        exe = OUT / f'actual-gizmo-prepare-{label}-O{opt}{".exe" if os.name == "nt" else ""}'
        build = subprocess.run([compiler, '-std=c++17', '-DWIN32=1', '-O' + opt, str(cpp), '-o', str(exe)], capture_output=True, text=True, timeout=120)
        (OUT / f'compile-{label}-O{opt}.log').write_text(build.stdout + build.stderr, encoding='utf-8')
        if build.returncode:
            FAILURE = dict(kind='COMPILATION', source=label, opt=opt, returncode=build.returncode,
                           log=str(OUT / f'compile-{label}-O{opt}.log'))
            print(build.stderr)
            sys.exit(build.returncode)
        for case in selected:
            run = subprocess.run([str(exe), case], capture_output=True, text=True, timeout=30)
            expected_failure = label == 'historical'
            assertion, witness = historical_obligations[case] if expected_failure else ('', '')
            passed = (run.returncode != 0 and assertion in run.stderr and
                      'assert' in run.stderr.lower() and witness in run.stdout) if expected_failure else run.returncode == 0
            results.append(dict(opt=opt, source=label, case=case, returncode=run.returncode,
                                expected_failure=expected_failure, expected_assertion=assertion,
                                required_witness=witness, passed=passed, stdout=run.stdout, stderr=run.stderr))
status = 'PASS' if all(r['passed'] for r in results) else 'FAIL'
report = dict(status=status, count=len(results), started_ns=STARTED_NS, run_nonce=OPT.run_nonce,
              script_sha256=SCRIPT_SHA256, test_sha256=TEST_SHA256,
              bridge_driver_sha256=sha(bridge_driver.read_bytes()), harness_sha256=sha(source),
              actual_prepare_sha256=sha(prepare), actual_native_capture_sha256=sha(capture),
              actual_full_draw_loop_sha256=sha(full_loop), actual_group_dispatch_sha256=sha(actual_group),
              source_sha256={p:sha((ROOT / p).read_bytes()) for p in [gizmo_path, panels_path, draw_path]},
              pinned_group_source_sha256=sha(group), current_case_count=len(cases),
              actual_prepare_hierarchy_probe_and_full_redraw=True,
              historical_revision=HISTORICAL_REVISION, historical_provenance=historical_provenance,
              historical_expected_failures=sum(r['expected_failure'] for r in results), results=results,
              source_root=str(ROOT), boundaries=__doc__, modeled_gpu_pixel_counter=True,
              stock_gpu_evidence='output/ui-preview/pencil-knife/gizmo-prepare-audit/evidence.json',
              native_sdk_or_gpu_build=False, device_acceptance=False)
report_path.write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')
REPORT_WRITTEN = True
print(json.dumps(dict(status=status, count=len(results), failed=[r for r in results if not r['passed']], harness_sha256=sha(source)), indent=2))
sys.exit(0 if status == 'PASS' else 1)
