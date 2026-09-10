"""Experimental Windows preview; not shipped in the iPad overlay yet."""
from bpy.types import GizmoGroup
import bpy
import blf


def draw_labels():
    context = bpy.context
    space = context.space_data
    if not space or space.type != 'VIEW_3D' or space.show_region_toolbar or not space.show_gizmo:
        return
    scale = context.preferences.system.ui_scale
    labels = ('Select', 'Move', 'Rotate', 'Scale', 'Canvas') if context.mode in {'OBJECT', 'EDIT_MESH'} else ('Canvas',)
    blf.size(0, 12 * scale)
    blf.color(0, 0.9, 0.9, 0.9, 1.0)
    for index, label in enumerate(labels):
        width, _ = blf.dimensions(0, label)
        blf.position(0, (44 + index * 56) * scale - width / 2, 16 * scale, 0)
        blf.draw(0, label)


class VIEW3D_GGT_tablet_preview_dock(GizmoGroup):
    bl_idname = 'VIEW3D_GGT_tablet_preview_dock'
    bl_label = 'Tablet Quick Controls Preview'
    bl_space_type = 'VIEW_3D'
    bl_region_type = 'WINDOW'
    bl_options = {'PERSISTENT', 'SCALE'}

    @classmethod
    def poll(cls, context):
        return not context.space_data.show_region_toolbar

    def setup(self, context):
        self.buttons = []
        for icon, tool in (
            ('RESTRICT_SELECT_OFF', 'builtin.select_box'),
            ('EMPTY_ARROWS', 'builtin.move'),
            ('DRIVER_ROTATIONAL_DIFFERENCE', 'builtin.rotate'),
            ('ARROW_LEFTRIGHT', 'builtin.scale'),
            ('TOOL_SETTINGS', None),
        ):
            button = self.gizmos.new('GIZMO_GT_button_2d')
            button.icon = icon
            button.draw_options = {'BACKDROP', 'OUTLINE'}
            button.color = (0.2, 0.2, 0.2)
            button.alpha = 0.9
            button.color_highlight = (0.35, 0.55, 0.85)
            button.alpha_highlight = 1.0
            button.backdrop_fill_alpha = 0.9
            button.scale_basis = 22
            button.use_tooltip = True
            if tool:
                button.target_set_operator('wm.tool_set_by_id').name = tool
            else:
                props = button.target_set_operator('wm.call_panel')
                props.name = 'VIEW3D_PT_ipad_controls'
                props.keep_open = True
            self.buttons.append((button, tool))

    def draw_prepare(self, context):
        scale = context.preferences.system.ui_scale
        index = 0
        active = context.workspace.tools.from_space_view3d_mode(context.mode, create=False)
        for button, tool in self.buttons:
            button.hide = bool(tool and context.mode not in {'OBJECT', 'EDIT_MESH'})
            if button.hide:
                continue
            button.matrix_basis.translation = (44 * scale + index * 56 * scale, 48 * scale, 0)
            button.color = ((0.2, 0.4, 0.7) if tool and active and active.idname == tool
                            else (0.2, 0.2, 0.2))
            index += 1


classes = (VIEW3D_GGT_tablet_preview_dock,)
