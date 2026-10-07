"""Patched Color poll with real stock-host contexts, plus native file writes.

No legacy user file or iOS provider/UI/modal execution is claimed.
"""
from pathlib import Path
import hashlib
import json
import sys
import tempfile
import types
import bpy

repo=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(repo/'build'))
from test_brush_color_context import PAINT,COLOR
namespace={}
exec(PAINT,namespace)
namespace['Panel']=bpy.types.Panel
namespace['View3DPaintPanel']=namespace['UnifiedPaintPanel']
namespace['draw_color_settings']=lambda *args,**kwargs: None
exec(COLOR,namespace)
color=namespace['VIEW3D_PT_tools_brush_color']
pinned_toolbar=(repo/'.cache/preflight/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e/scripts/startup/bl_ui/space_view3d_toolbar.py').read_text(encoding='utf-8')
original_class='class VIEW3D_PT_tools_brush_color('+pinned_toolbar.split('class VIEW3D_PT_tools_brush_color(',1)[1].split('\n\nclass ',1)[0]
exec(original_class,namespace)
original_color=namespace['VIEW3D_PT_tools_brush_color']
checks=[]

def viewport():
    area=next(a for a in bpy.context.window.screen.areas if a.type=='VIEW_3D')
    region=next(r for r in area.regions if r.type=='WINDOW')
    return area,region

area,region=viewport()
with bpy.context.temp_override(area=area,region=region):
    bpy.ops.object.mode_set(mode='OBJECT')
    bpy.ops.wm.tool_set_by_id(name='builtin.move')
    try:
        original_color.poll(bpy.context)
    except AttributeError as error:
        assert str(error)=="'NoneType' object has no attribute 'brush'"
        checks.append({'context':'Object/Move before guard','original_poll_error':str(error)})
    else:
        raise AssertionError('Original pinned Color poll did not reproduce the reported traceback')
    assert color.poll(bpy.context) is False
    checks.append({'context':'Object/Move','poll':False})
    bpy.ops.object.mode_set(mode='SCULPT')
    bpy.ops.wm.tool_set_by_id(name='builtin.move')
    assert color.poll(bpy.context) is False
    checks.append({'context':'Sculpt/non-brush Move','poll':False})
    bpy.ops.object.mode_set(mode='OBJECT')
area.type='FILE_BROWSER'
try:
    browser_region=next(r for r in area.regions if r.type=='WINDOW')
    with bpy.context.temp_override(area=area,region=browser_region):
        assert color.poll(bpy.context) is False
        checks.append({'context':'native File Browser','poll':False})
finally:
    area.type='VIEW_3D'

with tempfile.TemporaryDirectory(prefix='blender-panel-host-save-') as directory:
    root=Path(directory)
    original=root/'project.blend'
    save_as=root/'renamed.blend'
    copy=root/'copy.blend'
    cube=bpy.data.objects['Cube']
    cube.location.x=1.25
    assert bpy.ops.wm.save_as_mainfile(filepath=str(original),check_existing=False)=={'FINISHED'}
    assert original.is_file() and original.stat().st_size>1000
    cube.location.x=2.5
    assert bpy.ops.wm.save_mainfile()=={'FINISHED'}
    assert bpy.ops.wm.open_mainfile(filepath=str(original))=={'FINISHED'}
    assert bpy.data.objects['Cube'].location.x==2.5
    checks.append({'action':'Save and reopen','written':True,'reopened_transform':2.5})
    bpy.data.objects['Cube'].location.x=3.75
    assert bpy.ops.wm.save_as_mainfile(filepath=str(save_as),check_existing=False)=={'FINISHED'}
    assert Path(bpy.data.filepath)==save_as and save_as.is_file()
    assert bpy.ops.wm.open_mainfile(filepath=str(save_as))=={'FINISHED'}
    assert bpy.data.objects['Cube'].location.x==3.75
    checks.append({'action':'Save As and reopen','written':True,'reopened_transform':3.75})
    bpy.data.objects['Cube'].location.x=5.0
    active=bpy.data.filepath
    assert bpy.ops.wm.save_as_mainfile(filepath=str(copy),copy=True,check_existing=False)=={'FINISHED'}
    assert bpy.data.filepath==active and copy.is_file()
    assert bpy.ops.wm.open_mainfile(filepath=str(copy))=={'FINISHED'}
    assert bpy.data.objects['Cube'].location.x==5.0
    checks.append({'action':'Save Copy and reopen','written':True,'active_path_preserved':True,'reopened_transform':5.0})
    area,region=viewport()
    with bpy.context.temp_override(area=area,region=region):
        assert color.poll(bpy.context) is False
        checks.append({'context':'reopened project/native viewport','poll':False})

patch=(repo/'patches/blender-ipad.patch').read_text(encoding='utf-8')
report={'source_patch_sha256':hashlib.sha256(patch.encode()).hexdigest(),
        'host_blender':bpy.app.version_string,'checks':checks,
        'evidence_scope':'actual stock-host contexts and native file writes; exact pinned paint selector and patched Color class',
        'limitations':['not the user\'s older files','not target iPad UIKit/sidebar draw','not iOS provider Open/Save'],
        'device_acceptance':False}
output=repo/'output/ui-preview/pencil-ring-foundation/brush-project-host-checks.json'
output.write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
print(json.dumps(report,indent=2))
