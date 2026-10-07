"""Run the patched Color poll/draw with Blender's exact pinned paint selector.

RNA/tool contexts are fixtures; actual file writes are a separate host check.
"""
from pathlib import Path
from types import ModuleType, SimpleNamespace as NS
import sys
import unittest
from unittest.mock import patch
from test_touch_extrude import changed_source

PAINT = (Path(__file__).parent / 'fixtures/pinned_paint_selector.py').read_text(encoding='utf-8')
TOOLBAR = changed_source('scripts/startup/bl_ui/space_view3d_toolbar.py')
COLOR = TOOLBAR.split('class VIEW3D_PT_tools_brush_color(',1)[1].split('\n\nclass ',1)[0]
COLOR = 'class VIEW3D_PT_tools_brush_color(' + COLOR

def setup():
    namespace = {}
    exec(PAINT, namespace)
    namespace['Panel'] = type('Panel', (), {})
    namespace['View3DPaintPanel'] = namespace['UnifiedPaintPanel']
    namespace['draw_color_settings'] = lambda *args, **kwargs: namespace['draws'].append((args,kwargs))
    namespace['draws'] = []
    exec(COLOR, namespace)
    module = ModuleType('bl_ui.space_toolsystem_common')
    module.ToolSelectPanelHelper = NS(tool_active_from_context=lambda context: context.active_tool)
    return namespace,module

def context(mode='OBJECT', brush_tool=False, brush=None, space='VIEW_3D'):
    paint = NS(brush=brush)
    settings = NS(sculpt=paint,vertex_paint=paint,weight_paint=paint,image_paint=paint)
    return NS(mode=mode,active_tool=NS(use_brushes=brush_tool),space_data=NS(type=space),
              tool_settings=settings,image_paint_object=None,vertex_paint_object=None,sculpt_object=None)

class BrushColorTests(unittest.TestCase):
    def test_nonbrush_object_file_browser_and_missing_settings_or_brush_refuse_safely(self):
        env,module=setup();color=env['VIEW3D_PT_tools_brush_color'];panel=color();panel.layout=NS()
        with patch.dict(sys.modules, {'bl_ui.space_toolsystem_common':module}):
            for C in (context(), context('SCULPT',False), context('SCULPT',True),
                      context('SCULPT',True,NS(), 'FILE_BROWSER')):
                self.assertFalse(color.poll(C));panel.draw(C)
            C=context('SCULPT',True);C.tool_settings.sculpt=None
            self.assertFalse(color.poll(C));panel.draw(C)
            C.active_tool=None;self.assertFalse(color.poll(C));panel.draw(C)
        self.assertEqual(env['draws'],[])

    def test_native_color_capabilities_and_context_loss_between_poll_and_draw(self):
        env,module=setup();color=env['VIEW3D_PT_tools_brush_color'];panel=color();panel.layout=NS()
        with patch.dict(sys.modules, {'bl_ui.space_toolsystem_common':module}):
            for mode,owner,capability in (
                ('SCULPT','sculpt_object','sculpt_capabilities'),
                ('PAINT_VERTEX','vertex_paint_object','vertex_paint_capabilities'),
                ('PAINT_TEXTURE','image_paint_object','image_paint_capabilities')):
                brush=NS(**{capability:NS(has_color=True)})
                C=context(mode,True,brush);setattr(C,owner,NS())
                self.assertTrue(color.poll(C));panel.draw(C)
                getattr(brush,capability).has_color=False;self.assertFalse(color.poll(C))
                C.active_tool.use_brushes=False;panel.draw(C)
        self.assertEqual(len(env['draws']),3)

if __name__ == '__main__': unittest.main()
