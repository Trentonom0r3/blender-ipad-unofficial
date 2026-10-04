"""Stock-host native mode admission audit; not an integrated iPad mode feature.

Run factory Blender with --background --python. Actual mode is observed after
native calls; callback UI compatibility and target modal ownership are separate.
"""
from pathlib import Path
import json
import tempfile
import bpy

repo=Path(__file__).resolve().parents[1]
output=repo/'output/ui-preview/canvas-mode-audit'
output.mkdir(parents=True,exist_ok=True)
area=next(a for a in bpy.context.window.screen.areas if a.type=='VIEW_3D')
region=next(r for r in area.regions if r.type=='WINDOW')
records=[]

def active(obj):
    current=bpy.context.view_layer.objects.active
    if current and current.mode!='OBJECT':bpy.ops.object.mode_set(mode='OBJECT')
    for item in bpy.context.selected_objects:item.select_set(False)
    bpy.context.view_layer.objects.active=obj
    if obj:obj.select_set(True)
    bpy.context.view_layer.update()

def attempt(case,mode):
    obj=bpy.context.view_layer.objects.active
    before=obj.mode if obj else None
    poll=bpy.ops.object.mode_set.poll()
    try:status=sorted(bpy.ops.object.mode_set(mode=mode))
    except (RuntimeError,TypeError) as exc:status={'error':str(exc)}
    observed=bpy.context.view_layer.objects.active
    record={'case':case,'requested':mode,'poll':poll,'before':before,
            'status':status,'observed_mode':observed.mode if observed else None,
            'observed_context_mode':bpy.context.mode,
            'observed_type':observed.type if observed else None}
    records.append(record)
    return record

with bpy.context.temp_override(area=area,region=region):
    cube=bpy.context.view_layer.objects.active
    cube.name='ModeAccessAuditMesh'
    for mode in ('EDIT','OBJECT'):
        record=attempt('editable mesh',mode)
        assert record['observed_mode']==mode,record
    cube.hide_set(True)
    record=attempt('mesh with local hide_set flag','EDIT')
    assert record['observed_mode']=='EDIT',record
    bpy.ops.object.mode_set(mode='OBJECT')
    cube.hide_set(False)
    cube.hide_viewport=True
    record=attempt('mesh disabled in viewport','EDIT')
    assert record['observed_mode']=='OBJECT',record
    cube.hide_viewport=False
    active(None)
    record=attempt('no active object','EDIT')
    assert not record['poll'] and record['observed_mode'] is None,record
    active(cube)
    with tempfile.TemporaryDirectory(prefix='ipad-mode-linked-audit-') as directory:
        library=Path(directory)/'library.blend'
        bpy.data.libraries.write(str(library),{cube.data})
        with bpy.data.libraries.load(str(library),link=True) as (src,dst):dst.meshes=[cube.data.name]
        linked=dst.meshes[0]
        obj=bpy.data.objects.new('ModeAuditLocalObjectLinkedData',linked)
        bpy.context.collection.objects.link(obj)
        active(obj)
        record=attempt('local object with linked mesh data','EDIT')
        assert record['observed_mode']=='OBJECT',record
        active(cube)
        bpy.data.objects.remove(obj,do_unlink=True)
        bpy.data.meshes.remove(linked)
    light=next(o for o in bpy.context.scene.objects if o.type=='LIGHT')
    active(light)
    record=attempt('incompatible Light Edit request','EDIT')
    assert record['observed_mode']=='OBJECT',record
    armature=bpy.data.armatures.new('ModeAuditArmature')
    obj=bpy.data.objects.new('ModeAuditArmature',armature)
    bpy.context.collection.objects.link(obj)
    active(obj)
    for mode in ('EDIT','OBJECT','POSE','OBJECT'):
        record=attempt('editable armature',mode)
        assert record['observed_mode']==mode,record
    curve=bpy.data.curves.new('ModeAuditLegacyCurve','CURVE')
    curve.splines.new('POLY').points.add(1)
    obj=bpy.data.objects.new('ModeAuditLegacyCurve',curve)
    bpy.context.collection.objects.link(obj)
    active(obj)
    for mode in ('EDIT','OBJECT'):
        record=attempt('editable legacy curve',mode)
        assert record['observed_mode']==mode,record

report={'host':bpy.app.version_string,
        'scope':'Actual stock-host native operator admission and observed state. No shipping iPad Mode UI, target callback receipts, automatic modal Undo or device input acceptance.',
        'records':records}
(output/'native-admission.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
print(json.dumps(report,indent=2))
