
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f8cc54 <__Z28UI_ipad_knife_hud_panel_typePK9PanelType>:
101f8cc54:     	cbz	x0, 0x101f8cc88 <__Z28UI_ipad_knife_hud_panel_typePK9PanelType+0x34>
101f8cc58:     	ldr	x8, [x0, #0x2b0]
101f8cc5c:     	adrp	x9, 0x101f8c000 <__ZL35ui_colorpicker_rgb_slider_update_cbP8bContextPvS1_+0xb0>
101f8cc60:     	add	x9, x9, #0xce0
101f8cc64:     	cmp	x8, x9
101f8cc68:     	b.eq	0x101f8cc74 <__Z28UI_ipad_knife_hud_panel_typePK9PanelType+0x20>
101f8cc6c:     	mov	w0, #0x0                ; =0
101f8cc70:     	ret
101f8cc74:     	ldr	x8, [x0, #0x2c8]
101f8cc78:     	adrp	x9, 0x101f8c000 <__ZL35ui_colorpicker_rgb_slider_update_cbP8bContextPvS1_+0xb0>
101f8cc7c:     	add	x9, x9, #0xcfc
101f8cc80:     	cmp	x8, x9
101f8cc84:     	cset	w0, eq
101f8cc88:     	ret
