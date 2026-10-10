
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-38019754190\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010160e27c <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion>:
10160e27c:     	stp	x20, x19, [sp, #-0x20]!
10160e280:     	stp	x29, x30, [sp, #0x10]
10160e284:     	add	x29, sp, #0x10
10160e288:     	mov	x19, x1
10160e28c:     	mov	x20, x0
10160e290:     	ldrsh	w2, [x1, #0xb8]
10160e294:     	ldrsh	w3, [x1, #0xba]
10160e298:     	add	x0, x1, #0x10
10160e29c:     	mov	w1, #0x4                ; =4
10160e2a0:     	bl	0x101fbfd34 <__Z23UI_view2d_region_reinitP6View2Dsii>
10160e2a4:     	ldrh	w8, [x19, #0xc2]
10160e2a8:     	tst	w8, #0x3
10160e2ac:     	b.eq	0x10160e2b8 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x3c>
10160e2b0:     	mov	w8, #0x1                ; =1
10160e2b4:     	b	0x10160e2c0 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x44>
10160e2b8:     	tbz	w8, #0x2, 0x10160e2d0 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x54>
10160e2bc:     	mov	w8, #0x2                ; =2
10160e2c0:     	ldrh	w9, [x19, #0x78]
10160e2c4:     	and	w9, w9, #0xfffc
10160e2c8:     	orr	w8, w9, w8
10160e2cc:     	strh	w8, [x19, #0x78]
10160e2d0:     	ldr	x8, [x20, #0x5c0]
10160e2d4:     	ldr	x0, [x8, #0xc8]
10160e2d8:     	adrp	x1, 0x104cd9000 <__ZL3hex+0x12a5c5>
10160e2dc:     	add	x1, x1, #0x306
10160e2e0:     	mov	w2, #0x0                ; =0
10160e2e4:     	mov	w3, #0x0                ; =0
10160e2e8:     	bl	0x100b6dc40 <__Z16WM_keymap_ensureP11wmKeyConfigPKcii>
10160e2ec:     	mov	x1, x0
10160e2f0:     	ldr	x8, [x19, #0x128]
10160e2f4:     	add	x0, x8, #0x270
10160e2f8:     	ldp	x29, x30, [sp, #0x10]
10160e2fc:     	ldp	x20, x19, [sp], #0x20
10160e300:     	b	0x100b534f4 <__Z27WM_event_add_keymap_handlerP8ListBaseP8wmKeyMap>
