"""Disposable stock GUI evidence only; no production or target iOS claim."""
from pathlib import Path
from datetime import datetime, timezone
import json, traceback, tempfile
import bpy, gpu
from gpu_extras.batch import batch_for_shader
from mathutils import Matrix

OUT = Path(__file__).resolve().parent
REPORT = OUT / 'host-result.json'
COUNTS = {'poll': 0, 'setup': 0, 'draw_prepare': 0}
SAMPLES = []
ERRORS = []
STEP = 0
START = datetime.now(timezone.utc).isoformat()
SHADER = None
BATCH = None
bpy.context.preferences.use_preferences_save = False
bpy.context.preferences.filepaths.use_auto_save_temporary_files = False
bpy.context.preferences.filepaths.temporary_directory = tempfile.mkdtemp(prefix='empty-gizmo-audit-') + '/'
bpy.context.preferences.view.show_splash = False
bpy.context.preferences.view.show_tooltips = False

class AUDIT_GGT_empty_prepare(bpy.types.GizmoGroup):
    bl_idname = 'AUDIT_GGT_empty_prepare'
    bl_label = 'Disposable empty prepare GPU audit'
    bl_space_type = 'VIEW_3D'
    bl_region_type = 'WINDOW'
    bl_options = {'PERSISTENT'}

    @classmethod
    def poll(cls, context):
        COUNTS['poll'] += 1
        return True

    def setup(self, context):
        COUNTS['setup'] += 1
        SAMPLES.append({'callback': 'setup', 'gizmo_count': len(self.gizmos)})

    def draw_prepare(self, context):
        global SHADER, BATCH
        COUNTS['draw_prepare'] += 1
        try:
            count = len(self.gizmos)
            assert count == 0, count
            if SHADER is None:
                SHADER = gpu.shader.from_builtin('UNIFORM_COLOR')
                BATCH = batch_for_shader(SHADER, 'TRIS', {'pos': [(-.6,-.4),(.6,-.4),(.6,.4),(-.6,-.4),(.6,.4),(-.6,.4)]})
            blend = gpu.state.blend_get()
            depth = gpu.state.depth_test_get()
            with gpu.matrix.push_pop(), gpu.matrix.push_pop_projection():
                gpu.matrix.load_identity()
                gpu.matrix.load_projection_matrix(Matrix.Identity(4))
                gpu.state.blend_set('NONE')
                gpu.state.depth_test_set('NONE')
                SHADER.bind()
                SHADER.uniform_float('color', (1,0,1,1))
                BATCH.draw(SHADER)
            gpu.state.depth_test_set(depth)
            gpu.state.blend_set(blend)
            if len(SAMPLES) < 30:
                SAMPLES.append({'callback': 'draw_prepare', 'gizmo_count': count, 'region': [context.region.x, context.region.y, context.region.width, context.region.height], 'viewport': list(gpu.state.viewport_get())})
        except Exception:
            ERRORS.append(traceback.format_exc())

def ctx():
    wins = list(bpy.context.window_manager.windows)
    assert len(wins) == 1, len(wins)
    win = wins[0]
    area = next(a for a in win.screen.areas if a.type == 'VIEW_3D')
    region = next(r for r in area.regions if r.type == 'WINDOW')
    return win, area, region

def report(status):
    win, area, region = ctx()
    REPORT.write_text(json.dumps({'status': status, 'started_utc': START, 'completed_utc': datetime.now(timezone.utc).isoformat(), 'host_version': bpy.app.version_string, 'host_build_hash': bpy.app.build_hash.decode(), 'host_binary': bpy.app.binary_path, 'background': bpy.app.background, 'callback_counts': COUNTS, 'samples': SAMPLES, 'errors': ERRORS, 'gizmo_created_by_probe': 0, 'space_type': 'VIEW_3D', 'group_options': ['PERSISTENT'], 'gpu_operation': 'UNIFORM_COLOR triangle batch, magenta rectangle, NDC [-0.6,-0.4] to [0.6,0.4], directly in draw_prepare; no gizmo draw callback', 'canvas': {'x': region.x, 'y': region.y, 'width': region.width, 'height': region.height}, 'screenshots': ['baseline.png','empty-group-draw-prepare.png','after-unregister.png'], 'scope': 'Stock Windows Blender host only; no target iOS/device acceptance; no production/source/test edits'}, indent=2) + '\n', encoding='utf-8')

def tick():
    global STEP
    try:
        win, area, region = ctx()
        with bpy.context.temp_override(window=win, area=area, region=region):
            if STEP == 0:
                area.spaces.active.show_gizmo = True
                area.tag_redraw()
            elif STEP == 1:
                bpy.ops.screen.screenshot(filepath=str(OUT / 'baseline.png'))
                bpy.utils.register_class(AUDIT_GGT_empty_prepare)
                area.tag_redraw()
            elif STEP == 2:
                area.tag_redraw()
            elif STEP == 3:
                bpy.ops.screen.screenshot(filepath=str(OUT / 'empty-group-draw-prepare.png'))
                assert COUNTS['draw_prepare'] > 0, COUNTS
                assert not ERRORS, ERRORS
                report('draw-captured')
                bpy.utils.unregister_class(AUDIT_GGT_empty_prepare)
                area.tag_redraw()
            elif STEP == 4:
                area.tag_redraw()
            elif STEP == 5:
                bpy.ops.screen.screenshot(filepath=str(OUT / 'after-unregister.png'))
                report('completed')
                bpy.ops.wm.quit_blender()
                return None
        STEP += 1
        return 0.7
    except Exception:
        ERRORS.append(traceback.format_exc())
        report('failed')
        bpy.ops.wm.quit_blender()
        return None

bpy.app.timers.register(tick, first_interval=2.0)
