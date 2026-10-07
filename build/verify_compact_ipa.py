"""Verify the downloaded compact-control IPA against an exact successful revision.

Usage: python build/verify_compact_ipa.py RUN_ID FULL_SHA DOWNLOAD_FOLDER
Only package/source evidence; physical input and device comfort remain unverified.
"""
from pathlib import Path
import hashlib
import ast
import json
import plistlib
import re
import tempfile
import struct
import subprocess
import sys
import zipfile
from preflight import get_source

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
toolbar_path='scripts/startup/bl_ui/space_view3d_toolbar.py'
toolbar_expected=None
toolbar_marker=f'diff --git a/{toolbar_path} b/{toolbar_path}\n'
workflow=execute(['git','show',revision+':.github/workflows/build-ipa.yml']).decode('utf-8')
pin=re.search(r'^  BLENDER_COMMIT: ([0-9a-f]{40})\s*$',workflow,re.MULTILINE).group(1)
if toolbar_marker.encode() in patch:
    section=toolbar_marker+patch.decode('utf-8').split(toolbar_marker,1)[1].split('diff --git ',1)[0]
    with tempfile.TemporaryDirectory(prefix='ipad-exact-toolbar-') as directory:
        staged=Path(directory)/toolbar_path
        staged.parent.mkdir(parents=True,exist_ok=True)
        staged.write_bytes(get_source(pin,toolbar_path,repo/'.cache/preflight',False))
        subprocess.run(['git','apply','-'],input=section.encode('utf-8'),cwd=directory,check=True)
        toolbar_expected=staged.read_text(encoding='utf-8')
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
    has_pencil_entry_fix = "bpy.ops.wm.call_menu_pie('INVOKE_DEFAULT', True, **options)" in expected
    has_default_native_header = b'diff --git a/scripts/startup/bl_ui/space_view3d.py ' not in patch
    has_contact_only_browsing = b'+  /* Ring browsing is contact-only.' in patch
    has_current_tool_shortcut = 'def ipad_active_tool_options_button(layout, context):' in expected
    has_view_category = 'class VIEW3D_MT_ipad_view_ring' in expected
    has_compact_next_drag = 'bl_label = "Next drag"' in expected
    if has_compact_next_drag:
        panel = next(n for n in ast.parse(actual).body if isinstance(n,ast.ClassDef) and n.name=='VIEW3D_PT_ipad_transform')
        panel_source = ast.get_source_segment(actual,panel)
        assert 'bl_ui_units_x = 14' in panel_source
        assert 'ipad_transform_numbers' not in panel_source
        assert 'ipad_active_tool_options_button' not in actual
        assert "ring == 'NEXT_DRAG'" in actual
        assert b'+  uint64_t refused_generation = 0;' in patch
        assert b'+  ui_ipad_ring_inventory_capture(block, *data);' in patch
        assert b'+    radius = 4.9f * unit;' in patch

    if has_view_category:
        assert "layout.ipad_view_navigation_mask()" in actual
        assert "layout.operator_context = 'EXEC_REGION_WIN'" in actual
        for marker in ('VIEW3D_MT_ipad_view_ring', 'ipad_view_navigation_mask'):
            assert marker.encode() in binary, marker
        assert b'+      if (dispatch_type && ui_ipad_view_dispatch_allowed(' in patch
        assert b'+  uint64_t ipad_view_region_data = 0;' in patch
    if has_current_tool_shortcut:
        assert 'ipad_active_tool_options_button(layout, context)' in actual
        assert "text=labels[active_id] + ' Options'" in actual
        assert b'+        data.touch_tools, kind == ipad_ring::RingKind::Base);' in patch
    if has_contact_only_browsing:
        assert b'+    ring_hover_gesture_recognizer = [[' not in patch
        assert b'+    system->pushEvent(new GHOST_EventPencilRing(system->getMilliSeconds(), window, packet));' not in patch
        assert b'+bool ui_ipad_ring_roll_input(bContext * /*C*/, uiBlock * /*block*/, const wmEvent * /*event*/)' in patch
        assert b'+      result = data->browse.motion(packet.lifetime, event->xy[0], event->xy[1]);' in patch
    if has_pencil_entry_fix:
        header_node = next(n for n in ast.parse(actual).body if isinstance(n,ast.FunctionDef) and n.name=='draw_canvas_header')
        header_source = ast.get_source_segment(actual,header_node)
        for removed in ('wm.ipad_tool_palette','wm.call_menu_pie','view3d.ipad_native_controls',
                        'view3d.ipad_ring_interface','view3d.ipad_shelf_visibility'):
            assert removed not in header_source,removed
        if not has_default_native_header:
            assert "text='Canvas View'" in actual
    if has_base:
        for marker in ('class VIEW3D_MT_ipad_base_ring','class VIEW3D_MT_ipad_tool_inventory',
                       'class VIEW3D_OT_ipad_native_tool','class VIEW3D_OT_ipad_native_controls',
                       'class VIEW3D_OT_ipad_shelf_visibility','ipad_editing_shelf_enabled',
                       'def draw_canvas_header(layout, context)'):
            assert marker in actual,marker
        header,=[n for n in names if n.endswith('/bl_ui/space_view3d.py')]
        header_text=archive.read(header).decode('utf-8').replace('\r\n','\n')
        if has_default_native_header:
            native_header_pin=get_source(pin,'scripts/startup/bl_ui/space_view3d.py',repo/'.cache/preflight',False).decode('utf-8').replace('\r\n','\n')
            assert header_text==native_header_pin,'Default Blender header differs from pinned source'
        else:
            assert 'if draw_canvas_header(layout, context):\n            return' in header_text
        for marker in ('VIEW3D_MT_ipad_base_ring','VIEW3D_MT_ipad_tool_inventory',
                       'VIEW3D_OT_ipad_native_controls','VIEW3D_OT_ipad_transform_numbers',
                       'ipad_pencil_header_supported','ipad_editing_shelf_enabled'):
            assert marker.encode() in binary,marker
        assert any(n.endswith('/datafiles/fonts/Inter.woff2') for n in names)
    if toolbar_expected is not None:
        toolbar,=[n for n in names if n.endswith('/'+toolbar_path)]
        toolbar_actual=archive.read(toolbar).decode('utf-8').replace('\r\n','\n')
        assert toolbar_actual==toolbar_expected,'Entire packaged toolbar differs from exact source'
        color=toolbar_actual.split('class VIEW3D_PT_tools_brush_color(',1)[1].split('\n\nclass ',1)[0]
        assert color.count('if settings is None or settings.brush is None:')==2
    topbar,=[n for n in names if n.endswith('/bl_ui/space_topbar.py')]
    menu=archive.read(topbar);assert b'wm.link' in menu and b'wm.append' in menu
    native_toolbar_path='scripts/startup/bl_ui/space_toolsystem_toolbar.py'
    assert f'diff --git a/{native_toolbar_path} b/{native_toolbar_path}\n'.encode() not in patch
    native_toolbar,=[n for n in names if n.endswith('/'+native_toolbar_path)]
    native_toolbar_text=archive.read(native_toolbar).decode('utf-8').replace('\r\n','\n')
    native_toolbar_pin=get_source(pin,native_toolbar_path,repo/'.cache/preflight',False).decode('utf-8').replace('\r\n','\n')
    assert native_toolbar_text==native_toolbar_pin,'Native tool definitions differ from exact pinned source'
    native_icons={k.value.value for node in ast.walk(ast.parse(native_toolbar_text))
                  if isinstance(node,ast.Call) and isinstance(node.func,ast.Name) and node.func.id=='dict'
                  for k in node.keywords if k.arg=='icon' and isinstance(k.value,ast.Constant)
                  and isinstance(k.value.value,str) and '.' in k.value.value}
    assert len(native_icons)>100,'Native icon inventory extraction was incomplete'
    for asset in sorted(native_icons):
        assert any(n.endswith('/datafiles/icons/'+asset+'.dat') for n in names),asset
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
    'compact_base_next_drag_and_final_draw_continuity':has_compact_next_drag,
    'explicit_native_pencil_entry_and_no_added_header_controls':has_pencil_entry_fix,
    'entire_default_blender_viewport_header_matches_exact_pin':has_base and has_default_native_header,
    'exact_build_source_uses_contact_only_browsing':has_contact_only_browsing,
    'current_tool_options_in_base_with_stable_native_slots':has_current_tool_shortcut,
    'viewport_view_category_with_presented_identity_and_exec_guards':has_view_category,
    'entire_packaged_toolbar_matches_exact_source':toolbar_expected is not None,
    'native_tool_definitions_match_exact_pin':True,
    'native_tool_icon_files_checked':len(native_icons),
    'device_acceptance':False}
(folder/'verification.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
(folder/'artifact-metadata.json').write_text(json.dumps(metadata,indent=2)+'\n',encoding='utf-8')
print(json.dumps(report,indent=2))
