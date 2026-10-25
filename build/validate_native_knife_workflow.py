"""Disposable stock native Knife workflow probe; no patched iPad/device proof.

Run in a separate stock Blender GUI process with factory startup, autoexec disabled
and --enable-event-simulate. All mouse/key events target its own Window API.
No operating-system input injection, cursor warp or user project is used.
"""
from pathlib import Path
from datetime import datetime, timezone
import hashlib
import json
import tempfile
import traceback
import bpy
import bmesh
from mathutils import Vector
from bpy_extras.view3d_utils import location_3d_to_region_2d

REPO = Path(__file__).resolve().parents[1]
OUT = REPO / 'output/ui-preview/pencil-knife/host-baseline'
OUT.mkdir(parents=True, exist_ok=True)
RESULT = OUT / 'native-knife-workflow.json'
ERROR = OUT / 'native-knife-error.txt'
PROGRESS = OUT / 'native-knife-progress.json'
SHOTS = ('pending-after-lift.png', 'pending-after-rightclick.png',
         'finished-cut.png', 'empty-knife.png', 'pending-before-escape.png',
         'after-escape.png')
for old in (RESULT, ERROR, PROGRESS, *(OUT / name for name in SHOTS)):
    old.unlink(missing_ok=True)

bpy.context.preferences.use_preferences_save = False
bpy.context.preferences.filepaths.use_auto_save_temporary_files = False
bpy.context.preferences.filepaths.temporary_directory = tempfile.mkdtemp(
    prefix='disposable-native-knife-') + '/'
bpy.context.preferences.view.show_splash = False
bpy.context.preferences.view.show_tooltips = False

STEP = 0
FRAMES = []
BASELINE = None
FINISHED = None
POINTS = {}
OBJECT_NAME = 'DisposableKnifePlane'
START = datetime.now(timezone.utc).isoformat()


def write(path, value):
    path.write_bytes((json.dumps(value, indent=2) + '\n').encode('utf-8'))


def native_context():
    windows = list(bpy.context.window_manager.windows)
    assert len(windows) == 1, ('isolated-window-count', len(windows))
    window = windows[0]
    area = next(a for a in window.screen.areas if a.type == 'VIEW_3D')
    region = next(r for r in area.regions if r.type == 'WINDOW')
    assert region.width > 200 and region.height > 200, ('no-native-canvas', region.width, region.height)
    return window, area, region


def modal_rows(window):
    return [{'identifier': op.bl_rna.identifier,
             'bl_idname': getattr(op, 'bl_idname', ''),
             'name': getattr(op, 'name', '')}
            for op in window.modal_operators]


def knife_live(window):
    return any(row['identifier'] == 'MESH_OT_knife_tool' or
               row['bl_idname'] == 'MESH_OT_knife_tool'
               for row in modal_rows(window))


def geometry():
    obj = bpy.data.objects.get(OBJECT_NAME)
    assert obj is not None and obj.type == 'MESH', 'disposable mesh missing'
    assert obj.mode == 'EDIT', ('native-edit-mode', obj.mode)
    bm = bmesh.from_edit_mesh(obj.data)
    coord = {v: tuple(round(float(x), 6) for x in v.co) for v in bm.verts}
    payload = {'vertices': sorted(coord.values()),
               'edges': sorted(tuple(sorted((coord[e.verts[0]], coord[e.verts[1]]))) for e in bm.edges),
               'faces': sorted(tuple(sorted(coord[v] for v in face.verts)) for face in bm.faces)}
    return {'vertices': len(bm.verts), 'edges': len(bm.edges), 'faces': len(bm.faces),
            'sha256': hashlib.sha256(json.dumps(payload, sort_keys=True).encode()).hexdigest()}


def snapshot(name, screenshot=None):
    window, area, region = native_context()
    row = {'name': name, 'step': STEP, 'geometry': geometry(),
           'modal_operators': modal_rows(window), 'knife_live': knife_live(window),
           'canvas': {'x': region.x, 'y': region.y, 'width': region.width, 'height': region.height}}
    FRAMES.append(row)
    if screenshot:
        bpy.ops.screen.screenshot(filepath=str(OUT / screenshot))
    return row


def event(window, kind, value, point, **kwargs):
    window.event_simulate(type=kind, value=value, x=point[0], y=point[1], **kwargs)


def key(window, kind, point):
    event(window, kind, 'PRESS', point)
    event(window, kind, 'RELEASE', point)


def progress(status='running', **extra):
    write(PROGRESS, {'status': status, 'step': STEP, 'frames': FRAMES, **extra})


def fail(error):
    ERROR.write_bytes(error.encode('utf-8'))
    write(RESULT, {'status': 'failed', 'started_utc': START, 'step': STEP,
                   'host_version': bpy.app.version_string, 'error': error,
                   'frames': FRAMES, 'device_acceptance': False})
    print('NATIVE_KNIFE_PROBE_FAILED', STEP, error, flush=True)
    bpy.ops.wm.quit_blender()


def tick():
    global STEP, BASELINE, FINISHED, POINTS
    try:
        assert not bpy.app.background, 'native GUI process required'
        assert bpy.app.use_event_simulate, '--enable-event-simulate required'
        window, area, region = native_context()
        with bpy.context.temp_override(window=window, area=area, region=region):
            if STEP == 0:
                bpy.ops.object.select_all(action='SELECT')
                bpy.ops.object.delete(use_global=False)
                bpy.ops.mesh.primitive_plane_add(size=4)
                bpy.context.object.name = OBJECT_NAME
                bpy.ops.object.mode_set(mode='EDIT')
                bpy.ops.view3d.view_axis(type='TOP', align_active=False)
                bpy.ops.view3d.view_selected(use_all_regions=False)
                bpy.ops.wm.tool_set_by_id(name='builtin.knife')
                assert bpy.ops.ed.undo_push(message='Disposable native Knife baseline') == {'FINISHED'}
                area.tag_redraw()
            elif STEP == 1:
                BASELINE = snapshot('original-plane')['geometry']
                assert (BASELINE['vertices'], BASELINE['edges'], BASELINE['faces']) == (4, 4, 1)
                for name, world in [('left', (-2, 0, 0)), ('right', (2, 0, 0)),
                                    ('bottom', (0, -2, 0)), ('top', (0, 2, 0))]:
                    p = location_3d_to_region_2d(region, area.spaces.active.region_3d, Vector(world))
                    assert p is not None, ('unprojected', name)
                    POINTS[name] = (round(region.x + p.x), round(region.y + p.y))
                    assert region.x < POINTS[name][0] < region.x + region.width
                    assert region.y < POINTS[name][1] < region.y + region.height
                event(window, 'MOUSEMOVE', 'NOTHING', POINTS['left'])
            elif STEP == 2:
                event(window, 'LEFTMOUSE', 'PRESS', POINTS['left'])
            elif STEP == 3:
                assert knife_live(window), modal_rows(window)
                snapshot('knife-invoked-from-native-tool')
                event(window, 'MOUSEMOVE', 'NOTHING', POINTS['right'])
            elif STEP == 4:
                assert knife_live(window)
                assert geometry() == BASELINE
                event(window, 'LEFTMOUSE', 'RELEASE', POINTS['right'])
            elif STEP == 5:
                row = snapshot('pending-cut-after-lift', 'pending-after-lift.png')
                assert row['knife_live'] and row['geometry'] == BASELINE
                key(window, 'LEFTMOUSE', POINTS['right'])
            elif STEP == 6:
                row = snapshot('native-endpoint-added-before-stop')
                assert row['knife_live'] and row['geometry'] == BASELINE
                key(window, 'RIGHTMOUSE', POINTS['right'])
            elif STEP == 7:
                row = snapshot('pending-cut-after-native-new-cut', 'pending-after-rightclick.png')
                assert row['knife_live'] and row['geometry'] == BASELINE
                key(window, 'RET', POINTS['right'])
            elif STEP == 8:
                row = snapshot('native-enter-finished', 'finished-cut.png')
                assert not row['knife_live']
                FINISHED = row['geometry']
                assert FINISHED != BASELINE and FINISHED['faces'] >= 2, (BASELINE, FINISHED)
                assert bpy.ops.ed.undo() == {'FINISHED'}
            elif STEP == 9:
                assert snapshot('one-undo-after-finish')['geometry'] == BASELINE
                assert bpy.ops.ed.redo() == {'FINISHED'}
            elif STEP == 10:
                assert snapshot('one-redo-after-finish')['geometry'] == FINISHED
                status = bpy.ops.mesh.knife_tool('INVOKE_REGION_WIN', wait_for_input=True)
                assert status == {'RUNNING_MODAL'}, status
            elif STEP == 11:
                assert snapshot('empty-knife-before-confirm', 'empty-knife.png')['knife_live']
                key(window, 'RET', POINTS['right'])
            elif STEP == 12:
                row = snapshot('empty-native-confirm')
                assert not row['knife_live'] and row['geometry'] == FINISHED
                assert bpy.ops.ed.undo() == {'FINISHED'}
            elif STEP == 13:
                assert snapshot('one-undo-after-empty-confirm')['geometry'] == BASELINE
                assert bpy.ops.ed.redo() == {'FINISHED'}
            elif STEP == 14:
                assert snapshot('redo-after-empty-confirm')['geometry'] == FINISHED
                bpy.ops.wm.tool_set_by_id(name='builtin.knife')
                event(window, 'MOUSEMOVE', 'NOTHING', POINTS['bottom'])
            elif STEP == 15:
                event(window, 'LEFTMOUSE', 'PRESS', POINTS['bottom'])
            elif STEP == 16:
                assert snapshot('escape-case-native-knife-invoked')['knife_live']
                event(window, 'MOUSEMOVE', 'NOTHING', POINTS['top'])
            elif STEP == 17:
                assert knife_live(window)
                event(window, 'LEFTMOUSE', 'RELEASE', POINTS['top'])
            elif STEP == 18:
                row = snapshot('escape-case-after-lift')
                assert row['knife_live'] and row['geometry'] == FINISHED
                key(window, 'LEFTMOUSE', POINTS['top'])
            elif STEP == 19:
                row = snapshot('pending-cut-before-native-escape', 'pending-before-escape.png')
                assert row['knife_live'] and row['geometry'] == FINISHED
                key(window, 'ESC', POINTS['top'])
            elif STEP == 20:
                row = snapshot('native-escape-cancelled', 'after-escape.png')
                assert not row['knife_live'] and row['geometry'] == FINISHED
                assert bpy.ops.ed.undo() == {'FINISHED'}
            elif STEP == 21:
                assert snapshot('one-undo-after-escape')['geometry'] == BASELINE
                assert bpy.ops.ed.redo() == {'FINISHED'}
            elif STEP == 22:
                assert snapshot('one-redo-after-escape')['geometry'] == FINISHED
                result = {'status': 'passed', 'started_utc': START,
                          'completed_utc': datetime.now(timezone.utc).isoformat(),
                          'host_version': bpy.app.version_string,
                          'host_binary': bpy.app.binary_path,
                          'host_build_hash': bpy.app.build_hash.decode(),
                          'event_transport': 'Isolated Window.event_simulate mouse/key events; no operating-system input injection',
                          'actual_native_knife_modal': True, 'lift_keeps_modal': True,
                          'rightclick_new_cut_keeps_modal': True,
                          'native_enter_commits_geometry': True,
                          'one_native_undo_redo': True,
                          'empty_confirm_keeps_geometry_and_one_undo_reaches_original': True,
                          'native_escape_keeps_original_geometry_and_one_undo_reaches_original': True,
                          'original_geometry': BASELINE, 'finished_geometry': FINISHED,
                          'projected_points': POINTS, 'frames': FRAMES,
                          'scope': 'Actual disposable stock5.1.2 native Knife modal/geometry/history baseline on a visible XY plane, via its real native tool input and native Enter/Escape. Whole target5.0 patched UI, Pencil/UIKit/GHOST contact transport and future Finish/Cancel button dispatch are not executed.',
                          'device_acceptance': False}
                write(RESULT, result)
                progress('passed')
                print('NATIVE_KNIFE_PROBE_PASSED', json.dumps({'original': BASELINE, 'finished': FINISHED}), flush=True)
            else:
                bpy.ops.wm.quit_blender()
                return None
        if STEP != 22:
            progress()
        STEP += 1
        return 1.2
    except Exception:
        fail(traceback.format_exc())
        return None


write(RESULT, {'status': 'running', 'started_utc': START, 'device_acceptance': False})
bpy.app.timers.register(tick, first_interval=4)
