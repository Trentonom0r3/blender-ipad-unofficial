
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101626a38 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion>:
101626a38:     	stp	x20, x19, [sp, #-0x20]!
101626a3c:     	stp	x29, x30, [sp, #0x10]
101626a40:     	add	x29, sp, #0x10
101626a44:     	mov	x19, x1
101626a48:     	mov	x20, x0
101626a4c:     	ldrsh	w2, [x1, #0xb8]
101626a50:     	ldrsh	w3, [x1, #0xba]
101626a54:     	add	x0, x1, #0x10
101626a58:     	mov	w1, #0x4                ; =4
101626a5c:     	bl	0x101fe07a8 <__Z23UI_view2d_region_reinitP6View2Dsii>
101626a60:     	ldrh	w8, [x19, #0xc2]
101626a64:     	tst	w8, #0x3
101626a68:     	b.eq	0x101626a74 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x3c>
101626a6c:     	mov	w8, #0x1                ; =1
101626a70:     	b	0x101626a7c <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x44>
101626a74:     	tbz	w8, #0x2, 0x101626a8c <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x54>
101626a78:     	mov	w8, #0x2                ; =2
101626a7c:     	ldrh	w9, [x19, #0x78]
101626a80:     	and	w9, w9, #0xfffc
101626a84:     	orr	w8, w9, w8
101626a88:     	strh	w8, [x19, #0x78]
101626a8c:     	ldr	x8, [x20, #0x5c0]
101626a90:     	ldr	x0, [x8, #0xc8]
101626a94:     	adrp	x1, 0x104cfb000 <__ZL3hex+0x12aa0d>
101626a98:     	add	x1, x1, #0xabe
101626a9c:     	mov	w2, #0x0                ; =0
101626aa0:     	mov	w3, #0x0                ; =0
101626aa4:     	bl	0x100b7632c <__Z16WM_keymap_ensureP11wmKeyConfigPKcii>
101626aa8:     	mov	x1, x0
101626aac:     	ldr	x8, [x19, #0x128]
101626ab0:     	add	x0, x8, #0x328
101626ab4:     	ldp	x29, x30, [sp, #0x10]
101626ab8:     	ldp	x20, x19, [sp], #0x20
101626abc:     	b	0x100b597f8 <__Z27WM_event_add_keymap_handlerP8ListBaseP8wmKeyMap>
