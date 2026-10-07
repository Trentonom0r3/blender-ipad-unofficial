"""Actual stock-host UILayout content preview; the admitted target cue is modeled.

Run Blender --factory-startup --python build/preview_touch_stroke_cue.py -- --case move|narrow.
This does not execute the new target C++ callback, compositor or UIKit gestures.
"""
from pathlib import Path
import hashlib,json,sys
import bpy

repo=Path(__file__).resolve().parents[1]
case=sys.argv[sys.argv.index('--case')+1] if '--case' in sys.argv else 'move'
width=212 if case=='narrow' else 256
output=repo/'output/ui-preview/stroke-cue';output.mkdir(parents=True,exist_ok=True)
patch=(repo/'patches/blender-ipad.patch').read_text(encoding='utf-8')
for text in ('Lift to apply','Two-finger drag to cancel'):
 assert 'IFACE_("'+text+'")' in patch
bpy.context.preferences.view.show_splash=False
area=next(a for a in bpy.context.window.screen.areas if a.type=='VIEW_3D')
region=next(r for r in area.regions if r.type=='WINDOW')
status='Move along global X · Fine' if case=='move' else 'Scale · Free'

class WM_OT_touch_stroke_cue_preview(bpy.types.Operator):
 bl_idname='wm.touch_stroke_cue_preview'
 bl_label='Live Transform Cue · Host Content Preview'
 def invoke(self,context,event):return context.window_manager.invoke_popup(self,width=width)
 def draw(self,context):
  column=self.layout.column(align=True)
  for text in (status,'Lift to apply','Two-finger drag to cancel'):
   row=column.row();row.alignment='CENTER';row.label(text=text)
 def execute(self,context):return {'FINISHED'}
bpy.utils.register_class(WM_OT_touch_stroke_cue_preview)
step=0

def tick():
 global step
 try:
  if step==0:
   with bpy.context.temp_override(area=area,region=region):
    bpy.ops.wm.tool_set_by_id(name='builtin.move' if case=='move' else 'builtin.scale')
   area.tag_redraw()
  elif step==1:
   with bpy.context.temp_override(area=area,region=region):
    bpy.context.window.cursor_warp(region.x+region.width//2,region.y+135)
    bpy.ops.wm.touch_stroke_cue_preview('INVOKE_DEFAULT')
  elif step==2:
   bpy.ops.screen.screenshot(filepath=str(output/(case+'.png')))
   (output/(case+'.json')).write_text(json.dumps({'host':bpy.app.version_string,'case':case,'layout_width':width,
    'status':status,'canonical_patch_sha256':hashlib.sha256(patch.encode()).hexdigest(),
    'scope':'Actual stock-host native UILayout content in a temporary popup. Admitted stroke state is modeled; target C++ capsule geometry/draw, native modal ownership, UIKit timing and device acceptance are unverified.'},indent=2)+'\n',encoding='utf-8')
  elif step==3:
   bpy.ops.wm.quit_blender();return None
  step+=1;return 1.5
 except Exception:
  import traceback
  (output/(case+'-error.txt')).write_text(traceback.format_exc(),encoding='utf-8')
  bpy.ops.wm.quit_blender();return None
bpy.app.timers.register(tick,first_interval=3)
