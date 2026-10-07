"""Verify the downloaded compact-control IPA against an exact successful revision.

Usage: python build/verify_compact_ipa.py RUN_ID FULL_SHA DOWNLOAD_FOLDER
Only package/source evidence; physical input and device comfort remain unverified.
"""
from pathlib import Path
import hashlib
import json
import plistlib
import struct
import subprocess
import sys
import zipfile

run_id,revision,directory=sys.argv[1:]
repo=Path(__file__).resolve().parents[1]
folder=Path(directory)
def execute(args):return subprocess.check_output(args,cwd=repo)
run=json.loads(execute(['gh','run','view',run_id,'--repo','Trentonom0r3/blender-ipad-unofficial',
                       '--json','headSha,status,conclusion,url']))
assert run['status']=='completed' and run['conclusion']=='success',run
assert run['headSha']==revision,run
metadata=json.loads(execute(['gh','api','repos/Trentonom0r3/blender-ipad-unofficial/actions/runs/'+run_id+'/artifacts']))
artifact,=[a for a in metadata['artifacts'] if a['name']=='Blender-iPad-Unofficial-ipa' and not a['expired']]
ipa,=folder.glob('*.ipa')
patch=execute(['git','show',revision+':patches/blender-ipad.patch'])
worktree=(repo/'patches/blender-ipad.patch').read_bytes()
assert worktree.replace(b'\r\n',b'\n')==patch
path='scripts/startup/bl_ui/space_view3d_ipad.py'
section=patch.decode('utf-8').split(f'diff --git a/{path} b/{path}\n',1)[1].split('diff --git ',1)[0]
expected=''.join(line[1:] for line in section.splitlines(True) if line.startswith('+') and not line.startswith('+++'))
with zipfile.ZipFile(ipa) as archive:
    assert archive.testzip() is None,'Full IPA CRC failure'
    names=archive.namelist();root='Payload/Blender.app/'
    info=plistlib.loads(archive.read(root+'Info.plist'))
    binary=archive.read(root+info['CFBundleExecutable'])
    magic,cpu,_,kind=struct.unpack('<4I',binary[:16])
    assert (magic,cpu,kind)==(0xfeedfacf,0x100000c,2)
    assert info.get('CFBundleSupportedPlatforms')==['iPhoneOS']
    assert info.get('CFBundleIdentifier')=='com.unofficial.blenderipad'
    assert any(n.endswith('/startup.blend') for n in names)
    script,=[n for n in names if n.endswith('/'+path)]
    actual=archive.read(script).decode('utf-8').replace('\r\n','\n')
    assert actual==expected,'Entire packaged interaction Python differs from exact source'
    for marker in ('draw_compact_editing_shelf','class VIEW3D_OT_ipad_shelf_toggle',
                   'ipad_editing_shelf_expanded',"text='Undo'","text='Redo'","text='Expand'","text='Collapse'",
                   'props.ipad_touch_targets',"text=label + '…'",'class VIEW3D_MT_ipad_selection_ring',
                   'class VIEW3D_MT_ipad_transform_ring','ipad_numeric_target','ipad_palette_target',
                   'class VIEW3D_PT_ipad_bevel','class VIEW3D_PT_ipad_transform',
                   'all(region.ipad_editing_shelf_visible','Fine Drag','use_accurate'):
        assert marker in actual,marker
    for marker in ('iPadToolRing','ipad_touch_targets','ipad_editing_shelf_expanded',
                   'ipad_anchor_override','ipad_anchor_x','ipad_anchor_y',
                   'VIEW3D_HT_ipad_editing_shelf','Native editing controls were drawn in this viewport',
                   'Expand this viewport to show Pencil controls',
                   'The mesh changed during Bevel; some preview geometry could not be restored',
                   'Choose Library File or Folder','Preparing Library Folder',
                   'Copying the folder and its relative assets','Choose Library File',
                   'The complete folder was copied. Which .blend should Link or Append use?',
                   'Retry Files','Open Local Copy'):
        assert marker.encode() in binary or marker.encode('utf-16le') in binary,marker
    has_modes='class VIEW3D_MT_ipad_modes' in expected
    if has_modes:
        for marker in ('class VIEW3D_MT_ipad_modes','def ipad_mode_button','def ipad_mode_item',
                       "self.layout.operator_enum('object.mode_set', 'mode')"):
            assert marker in actual,marker
        for marker in ('VIEW3D_MT_ipad_modes','Expand this viewport to show modes'):
            assert marker.encode() in binary,marker
    has_base = "options = {'name': 'VIEW3D_MT_ipad_base_ring'}" in expected
    if has_base:
        for marker in ('class VIEW3D_MT_ipad_base_ring','class VIEW3D_MT_ipad_tool_inventory',
                       'class VIEW3D_OT_ipad_native_tool','class VIEW3D_OT_ipad_native_controls',
                       'class VIEW3D_OT_ipad_shelf_visibility','ipad_editing_shelf_enabled',
                       'def draw_canvas_header(layout, context)', 'return compact'):
            assert marker in actual,marker
        header,=[n for n in names if n.endswith('/bl_ui/space_view3d.py')]
        header_text=archive.read(header).decode('utf-8').replace('\r\n','\n')
        assert 'if draw_canvas_header(layout, context):\n            return' in header_text
        for marker in ('VIEW3D_MT_ipad_base_ring','VIEW3D_MT_ipad_tool_inventory',
                       'VIEW3D_OT_ipad_native_controls','VIEW3D_OT_ipad_transform_numbers',
                       'ipad_pencil_header_supported','ipad_editing_shelf_enabled'):
            assert marker.encode() in binary,marker
        assert any(n.endswith('/datafiles/fonts/Inter.woff2') for n in names)
    topbar,=[n for n in names if n.endswith('/bl_ui/space_topbar.py')]
    menu=archive.read(topbar);assert b'wm.link' in menu and b'wm.append' in menu
    for asset in ('ops.generic.select_box','ops.transform.translate','ops.transform.rotate','ops.transform.resize'):
        assert any(n.endswith('/datafiles/icons/'+asset+'.dat') for n in names),asset
report={'run':run,'artifact':artifact,'ipa':{'path':str(ipa),'bytes':ipa.stat().st_size,
    'sha256':hashlib.sha256(ipa.read_bytes()).hexdigest(),'zip_entries':len(names),
    'bundle_id':info['CFBundleIdentifier'],'version':info.get('CFBundleShortVersionString'),
    'arm64_ios':True,'full_crc':True},
    'source_patch_sha256':hashlib.sha256(patch).hexdigest(),
    'windows_worktree_patch_sha256':hashlib.sha256(worktree).hexdigest(),
    'worktree_matches_source_after_lf_normalization':True,
    'entire_packaged_interaction_ui_matches_exact_source':True,
    'compact_controls_and_native_finger_option_markers':True,
    'preserved_ring_transform_bevel_files_and_native_icon_markers':True,
    'native_mode_chooser_and_current_mode_ui_markers':has_modes,
    'base_ring_and_native_header_return_markers':has_base,
    'device_acceptance':False}
(folder/'verification.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
(folder/'artifact-metadata.json').write_text(json.dumps(metadata,indent=2)+'\n',encoding='utf-8')
print(json.dumps(report,indent=2))
