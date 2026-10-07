# SPDX-License-Identifier: GPL-2.0-or-later
# Exact AST of unchanged paint selector from Blender d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e
class UnifiedPaintPanel:

    @staticmethod
    def get_brush_mode(context):
        """ Get the correct mode for this context. For any context where this returns None,
            no brush options should be displayed."""
        mode = context.mode
        if mode == 'PARTICLE':
            return None
        from bl_ui.space_toolsystem_common import ToolSelectPanelHelper
        tool = ToolSelectPanelHelper.tool_active_from_context(context)
        if not tool:
            return None
        if not tool.use_brushes:
            return None
        space_data = context.space_data
        tool_settings = context.tool_settings
        if space_data:
            space_type = space_data.type
            if space_type == 'IMAGE_EDITOR':
                return 'PAINT_2D'
            elif space_type in {'VIEW_3D', 'PROPERTIES'}:
                if mode == 'PAINT_TEXTURE':
                    if tool_settings.image_paint:
                        return mode
                    else:
                        return None
                return mode
        return None

    @staticmethod
    def paint_settings(context):
        tool_settings = context.tool_settings
        mode = UnifiedPaintPanel.get_brush_mode(context)
        if mode == 'SCULPT':
            return tool_settings.sculpt
        elif mode == 'PAINT_VERTEX':
            return tool_settings.vertex_paint
        elif mode == 'PAINT_WEIGHT':
            return tool_settings.weight_paint
        elif mode == 'PAINT_TEXTURE':
            return tool_settings.image_paint
        elif mode == 'PARTICLE':
            return tool_settings.particle_edit
        elif mode == 'PAINT_2D':
            return tool_settings.image_paint
        elif mode == 'SCULPT_CURVES':
            return tool_settings.curves_sculpt
        elif mode == 'PAINT_GREASE_PENCIL':
            return tool_settings.gpencil_paint
        elif mode == 'SCULPT_GREASE_PENCIL':
            return tool_settings.gpencil_sculpt_paint
        elif mode == 'WEIGHT_GREASE_PENCIL':
            return tool_settings.gpencil_weight_paint
        elif mode == 'VERTEX_GREASE_PENCIL':
            return tool_settings.gpencil_vertex_paint
        return None
