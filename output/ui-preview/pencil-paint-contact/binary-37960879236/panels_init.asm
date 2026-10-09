
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37960879236\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010160c744 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion>:
10160c744:     	stp	x20, x19, [sp, #-0x20]!
10160c748:     	stp	x29, x30, [sp, #0x10]
10160c74c:     	add	x29, sp, #0x10
10160c750:     	mov	x19, x1
10160c754:     	mov	x20, x0
10160c758:     	ldrsh	w2, [x1, #0xb8]
10160c75c:     	ldrsh	w3, [x1, #0xba]
10160c760:     	add	x0, x1, #0x10
10160c764:     	mov	w1, #0x4                ; =4
10160c768:     	bl	0x101fbde70 <__Z23UI_view2d_region_reinitP6View2Dsii>
10160c76c:     	ldrh	w8, [x19, #0xc2]
10160c770:     	tst	w8, #0x3
10160c774:     	b.eq	0x10160c780 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x3c>
10160c778:     	mov	w8, #0x1                ; =1
10160c77c:     	b	0x10160c788 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x44>
10160c780:     	tbz	w8, #0x2, 0x10160c798 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x54>
10160c784:     	mov	w8, #0x2                ; =2
10160c788:     	ldrh	w9, [x19, #0x78]
10160c78c:     	and	w9, w9, #0xfffc
10160c790:     	orr	w8, w9, w8
10160c794:     	strh	w8, [x19, #0x78]
10160c798:     	ldr	x8, [x20, #0x5c0]
10160c79c:     	ldr	x0, [x8, #0xc8]
10160c7a0:     	adrp	x1, 0x104cd7000 <__ZL3hex+0x12a515>
10160c7a4:     	add	x1, x1, #0x39e
10160c7a8:     	mov	w2, #0x0                ; =0
10160c7ac:     	mov	w3, #0x0                ; =0
10160c7b0:     	bl	0x100b6c6d4 <__Z16WM_keymap_ensureP11wmKeyConfigPKcii>
10160c7b4:     	mov	x1, x0
10160c7b8:     	ldr	x8, [x19, #0x128]
10160c7bc:     	add	x0, x8, #0x270
10160c7c0:     	ldp	x29, x30, [sp, #0x10]
10160c7c4:     	ldp	x20, x19, [sp], #0x20
10160c7c8:     	b	0x100b5222c <__Z27WM_event_add_keymap_handlerP8ListBaseP8wmKeyMap>
