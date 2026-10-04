from pathlib import Path
import sys,json
import bpy
case=sys.argv[sys.argv.index('--case')+1] if '--case' in sys.argv else 'object'
repo=Path(__file__).resolve().parents[1]
output=repo/'output/ui-preview/canvas-mode-audit'
output.mkdir(parents=True,exist_ok=True)
bpy.context.preferences.view.show_splash=False
area=next(a for a in bpy.context.window.screen.areas if a.type=='VIEW_3D');region=next(r for r in area.regions if r.type=='WINDOW')
class WM_OT_mode_access_audit(bpy.types.Operator):
    bl_idname='wm.mode_access_audit';bl_label='Native Modes · Host Audit Only'
    def invoke(self,context,event):return context.window_manager.invoke_popup(self,width=320)
    def draw(self,context):
        column=self.layout.column();column.operator_context='INVOKE_REGION_WIN';column.scale_y=2.2
        column.label(text='Current: '+context.active_object.mode.title())
        column.operator_enum('object.mode_set','mode')
    def execute(self,context):return {'FINISHED'}
bpy.utils.register_class(WM_OT_mode_access_audit)
step=0
def tick():
    global step
    if step==0:
        with bpy.context.temp_override(area=area,region=region):
            if case=='edit':bpy.ops.object.mode_set(mode='EDIT')
            bpy.context.window.cursor_warp(region.x+region.width//2,region.y+300)
            bpy.ops.wm.mode_access_audit('INVOKE_DEFAULT')
    elif step==1:
        bpy.ops.screen.screenshot(filepath=str(output/(case+'.png')))
        (output/(case+'.json')).write_text(json.dumps({'host':bpy.app.version_string,'case':case,
            'scope':'Source audit of native dynamic mode enum in scaled stock-host UILayout; not integrated/shipping iPad mode UI or input evidence.'},indent=2)+'\n',encoding='utf-8')
    elif step==2:
        bpy.ops.wm.quit_blender();return None
    step+=1;return 2
bpy.app.timers.register(tick,first_interval=3)