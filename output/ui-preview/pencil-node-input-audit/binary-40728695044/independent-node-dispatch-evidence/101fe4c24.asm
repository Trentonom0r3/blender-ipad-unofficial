
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101fe4c24 <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb>:
101fe4c24:     	cbz	x0, 0x101fe4d34 <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0x110>
101fe4c28:     	ldrh	w8, [x0, #0xe4]
101fe4c2c:     	cmp	w8, #0x14
101fe4c30:     	b.ne	0x101fe4c6c <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0x48>
101fe4c34:     	ldr	x8, [x0, #0xb8]
101fe4c38:     	cbnz	x8, 0x101fe4c6c <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0x48>
101fe4c3c:     	ldr	x8, [x0, #0xa0]
101fe4c40:     	cbnz	x8, 0x101fe4c6c <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0x48>
101fe4c44:     	ldr	x8, [x0, #0xa8]
101fe4c48:     	cbnz	x8, 0x101fe4c6c <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0x48>
101fe4c4c:     	ldr	x8, [x0, #0xc0]
101fe4c50:     	cbnz	x8, 0x101fe4c6c <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0x48>
101fe4c54:     	ldr	x8, [x0, #0xc8]
101fe4c58:     	cbnz	x8, 0x101fe4c6c <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0x48>
101fe4c5c:     	ldr	x8, [x0, #0xd0]
101fe4c60:     	cbnz	x8, 0x101fe4c6c <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0x48>
101fe4c64:     	ldr	x8, [x0, #0xd8]
101fe4c68:     	cbz	x8, 0x101fe4c74 <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0x50>
101fe4c6c:     	mov	w0, #0x0                ; =0
101fe4c70:     	ret
101fe4c74:     	ldr	x8, [x0, #0x50]
101fe4c78:     	cbz	w1, 0x101fe4cd4 <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0xb0>
101fe4c7c:     	adrp	x9, 0x101fe4000 <__Z24UI_view2d_edge_pan_applyP8bContextP17View2DEdgePanDataPKi+0x3c>
101fe4c80:     	add	x9, x9, #0xd38
101fe4c84:     	cmp	x8, x9
101fe4c88:     	b.ne	0x101fe4c6c <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0x48>
101fe4c8c:     	ldr	x8, [x0, #0x28]
101fe4c90:     	adrp	x9, 0x101fe4000 <__Z24UI_view2d_edge_pan_applyP8bContextP17View2DEdgePanDataPKi+0x3c>
101fe4c94:     	add	x9, x9, #0xd84
101fe4c98:     	cmp	x8, x9
101fe4c9c:     	b.ne	0x101fe4c6c <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0x48>
101fe4ca0:     	ldr	x8, [x0, #0x38]
101fe4ca4:     	adrp	x9, 0x101fe4000 <__Z24UI_view2d_edge_pan_applyP8bContextP17View2DEdgePanDataPKi+0x3c>
101fe4ca8:     	add	x9, x9, #0xe6c
101fe4cac:     	cmp	x8, x9
101fe4cb0:     	b.ne	0x101fe4c6c <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0x48>
101fe4cb4:     	ldr	x8, [x0, #0x48]
101fe4cb8:     	adrp	x9, 0x101fe5000 <__ZL20view_zoomdrag_invokeP8bContextP10wmOperatorPK7wmEvent+0x194>
101fe4cbc:     	add	x9, x9, #0x1bc
101fe4cc0:     	cmp	x8, x9
101fe4cc4:     	b.ne	0x101fe4c6c <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0x48>
101fe4cc8:     	adrp	x8, 0x101fe5000 <__ZL20view_zoomdrag_invokeP8bContextP10wmOperatorPK7wmEvent+0x194>
101fe4ccc:     	add	x8, x8, #0x534
101fe4cd0:     	b	0x101fe4d28 <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0x104>
101fe4cd4:     	adrp	x9, 0x101fe5000 <__ZL20view_zoomdrag_invokeP8bContextP10wmOperatorPK7wmEvent+0x194>
101fe4cd8:     	add	x9, x9, #0x5c0
101fe4cdc:     	cmp	x8, x9
101fe4ce0:     	b.ne	0x101fe4c6c <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0x48>
101fe4ce4:     	ldr	x8, [x0, #0x28]
101fe4ce8:     	adrp	x9, 0x101fe5000 <__ZL20view_zoomdrag_invokeP8bContextP10wmOperatorPK7wmEvent+0x194>
101fe4cec:     	add	x9, x9, #0x5e8
101fe4cf0:     	cmp	x8, x9
101fe4cf4:     	b.ne	0x101fe4c6c <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0x48>
101fe4cf8:     	ldr	x8, [x0, #0x38]
101fe4cfc:     	adrp	x9, 0x101fe5000 <__ZL20view_zoomdrag_invokeP8bContextP10wmOperatorPK7wmEvent+0x194>
101fe4d00:     	add	x9, x9, #0x6f0
101fe4d04:     	cmp	x8, x9
101fe4d08:     	b.ne	0x101fe4c6c <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0x48>
101fe4d0c:     	ldr	x8, [x0, #0x48]
101fe4d10:     	adrp	x9, 0x101fe5000 <__ZL20view_zoomdrag_invokeP8bContextP10wmOperatorPK7wmEvent+0x194>
101fe4d14:     	add	x9, x9, #0x94c
101fe4d18:     	cmp	x8, x9
101fe4d1c:     	b.ne	0x101fe4c6c <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb+0x48>
101fe4d20:     	adrp	x8, 0x101fe5000 <__ZL20view_zoomdrag_invokeP8bContextP10wmOperatorPK7wmEvent+0x194>
101fe4d24:     	add	x8, x8, #0xaf4
101fe4d28:     	ldr	x9, [x0, #0x40]
101fe4d2c:     	cmp	x9, x8
101fe4d30:     	cset	w0, eq
101fe4d34:     	ret
