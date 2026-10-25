
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101623d40 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion>:
101623d40:     	stp	x20, x19, [sp, #-0x20]!
101623d44:     	stp	x29, x30, [sp, #0x10]
101623d48:     	add	x29, sp, #0x10
101623d4c:     	mov	x19, x1
101623d50:     	mov	x20, x0
101623d54:     	ldrsh	w2, [x1, #0xb8]
101623d58:     	ldrsh	w3, [x1, #0xba]
101623d5c:     	add	x0, x1, #0x10
101623d60:     	mov	w1, #0x4                ; =4
101623d64:     	bl	0x101fdc100 <__Z23UI_view2d_region_reinitP6View2Dsii>
101623d68:     	ldrh	w8, [x19, #0xc2]
101623d6c:     	tst	w8, #0x3
101623d70:     	b.eq	0x101623d7c <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x3c>
101623d74:     	mov	w8, #0x1                ; =1
101623d78:     	b	0x101623d84 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x44>
101623d7c:     	tbz	w8, #0x2, 0x101623d94 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x54>
101623d80:     	mov	w8, #0x2                ; =2
101623d84:     	ldrh	w9, [x19, #0x78]
101623d88:     	and	w9, w9, #0xfffc
101623d8c:     	orr	w8, w9, w8
101623d90:     	strh	w8, [x19, #0x78]
101623d94:     	ldr	x8, [x20, #0x5c0]
101623d98:     	ldr	x0, [x8, #0xc8]
101623d9c:     	adrp	x1, 0x104cf7000 <__ZL3hex+0x12b34d>
101623da0:     	add	x1, x1, #0x7e
101623da4:     	mov	w2, #0x0                ; =0
101623da8:     	mov	w3, #0x0                ; =0
101623dac:     	bl	0x100b74398 <__Z16WM_keymap_ensureP11wmKeyConfigPKcii>
101623db0:     	mov	x1, x0
101623db4:     	ldr	x8, [x19, #0x128]
101623db8:     	add	x0, x8, #0x270
101623dbc:     	ldp	x29, x30, [sp, #0x10]
101623dc0:     	ldp	x20, x19, [sp], #0x20
101623dc4:     	b	0x100b58c1c <__Z27WM_event_add_keymap_handlerP8ListBaseP8wmKeyMap>
