
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37948344263\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010160a9fc <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion>:
10160a9fc:     	stp	x20, x19, [sp, #-0x20]!
10160aa00:     	stp	x29, x30, [sp, #0x10]
10160aa04:     	add	x29, sp, #0x10
10160aa08:     	mov	x19, x1
10160aa0c:     	mov	x20, x0
10160aa10:     	ldrsh	w2, [x1, #0xb8]
10160aa14:     	ldrsh	w3, [x1, #0xba]
10160aa18:     	add	x0, x1, #0x10
10160aa1c:     	mov	w1, #0x4                ; =4
10160aa20:     	bl	0x101fbc128 <__Z23UI_view2d_region_reinitP6View2Dsii>
10160aa24:     	ldrh	w8, [x19, #0xc2]
10160aa28:     	tst	w8, #0x3
10160aa2c:     	b.eq	0x10160aa38 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x3c>
10160aa30:     	mov	w8, #0x1                ; =1
10160aa34:     	b	0x10160aa40 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x44>
10160aa38:     	tbz	w8, #0x2, 0x10160aa50 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x54>
10160aa3c:     	mov	w8, #0x2                ; =2
10160aa40:     	ldrh	w9, [x19, #0x78]
10160aa44:     	and	w9, w9, #0xfffc
10160aa48:     	orr	w8, w9, w8
10160aa4c:     	strh	w8, [x19, #0x78]
10160aa50:     	ldr	x8, [x20, #0x5c0]
10160aa54:     	ldr	x0, [x8, #0xc8]
10160aa58:     	adrp	x1, 0x104cd5000 <__ZL3hex+0x12a24d>
10160aa5c:     	add	x1, x1, #0x666
10160aa60:     	mov	w2, #0x0                ; =0
10160aa64:     	mov	w3, #0x0                ; =0
10160aa68:     	bl	0x100b6c6d4 <__Z16WM_keymap_ensureP11wmKeyConfigPKcii>
10160aa6c:     	mov	x1, x0
10160aa70:     	ldr	x8, [x19, #0x128]
10160aa74:     	add	x0, x8, #0x270
10160aa78:     	ldp	x29, x30, [sp, #0x10]
10160aa7c:     	ldp	x20, x19, [sp], #0x20
10160aa80:     	b	0x100b5222c <__Z27WM_event_add_keymap_handlerP8ListBaseP8wmKeyMap>
