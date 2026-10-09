
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37874166837\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010160a46c <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion>:
10160a46c:     	stp	x20, x19, [sp, #-0x20]!
10160a470:     	stp	x29, x30, [sp, #0x10]
10160a474:     	add	x29, sp, #0x10
10160a478:     	mov	x19, x1
10160a47c:     	mov	x20, x0
10160a480:     	ldrsh	w2, [x1, #0xb8]
10160a484:     	ldrsh	w3, [x1, #0xba]
10160a488:     	add	x0, x1, #0x10
10160a48c:     	mov	w1, #0x4                ; =4
10160a490:     	bl	0x101fbac38 <__Z23UI_view2d_region_reinitP6View2Dsii>
10160a494:     	ldrh	w8, [x19, #0xc2]
10160a498:     	tst	w8, #0x3
10160a49c:     	b.eq	0x10160a4a8 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x3c>
10160a4a0:     	mov	w8, #0x1                ; =1
10160a4a4:     	b	0x10160a4b0 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x44>
10160a4a8:     	tbz	w8, #0x2, 0x10160a4c0 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x54>
10160a4ac:     	mov	w8, #0x2                ; =2
10160a4b0:     	ldrh	w9, [x19, #0x78]
10160a4b4:     	and	w9, w9, #0xfffc
10160a4b8:     	orr	w8, w9, w8
10160a4bc:     	strh	w8, [x19, #0x78]
10160a4c0:     	ldr	x8, [x20, #0x5c0]
10160a4c4:     	ldr	x0, [x8, #0xc8]
10160a4c8:     	adrp	x1, 0x104cd4000 <__ZL3hex+0x12a74d>
10160a4cc:     	add	x1, x1, #0x116
10160a4d0:     	mov	w2, #0x0                ; =0
10160a4d4:     	mov	w3, #0x0                ; =0
10160a4d8:     	bl	0x100b6c144 <__Z16WM_keymap_ensureP11wmKeyConfigPKcii>
10160a4dc:     	mov	x1, x0
10160a4e0:     	ldr	x8, [x19, #0x128]
10160a4e4:     	add	x0, x8, #0x270
10160a4e8:     	ldp	x29, x30, [sp, #0x10]
10160a4ec:     	ldp	x20, x19, [sp], #0x20
10160a4f0:     	b	0x100b52218 <__Z27WM_event_add_keymap_handlerP8ListBaseP8wmKeyMap>
