
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37948344263\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101607420 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea>:
101607420:     	ldrh	w8, [x2, #0x52]
101607424:     	tbz	w8, #0x3, 0x1016075b0 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x190>
101607428:     	sub	sp, sp, #0x70
10160742c:     	stp	x24, x23, [sp, #0x30]
101607430:     	stp	x22, x21, [sp, #0x40]
101607434:     	stp	x20, x19, [sp, #0x50]
101607438:     	stp	x29, x30, [sp, #0x60]
10160743c:     	add	x29, sp, #0x60
101607440:     	mov	x19, x2
101607444:     	mov	x20, x1
101607448:     	mov	x21, x0
10160744c:     	mov	x0, x1
101607450:     	bl	0x104a3c568 <__Z27WM_window_get_active_screenPK8wmWindow>
101607454:     	mov	x22, x0
101607458:     	mov	x1, sp
10160745c:     	mov	x0, x20
101607460:     	bl	0x100b8e468 <__Z26WM_window_screen_rect_calcPK8wmWindowP4rcti>
101607464:     	mov	x2, sp
101607468:     	mov	x0, x22
10160746c:     	mov	x1, x19
101607470:     	bl	0x1016075b4 <__ZL16area_calc_totrctPK7bScreenP7ScrAreaPK4rcti>
101607474:     	ldur	q1, [x19, #0x38]
101607478:     	ldur	q0, [x19, #0x38]
10160747c:     	stp	q0, q1, [sp, #0x10]
101607480:     	ldr	x1, [x19, #0x78]
101607484:     	add	x2, sp, #0x20
101607488:     	add	x3, sp, #0x10
10160748c:     	mov	x0, x19
101607490:     	mov	w4, #0x0                ; =0
101607494:     	bl	0x10160c814 <__ZL21region_rect_recursiveP7ScrAreaP7ARegionP4rctiS4_i>
101607498:     	mov	x0, x20
10160749c:     	mov	x1, x19
1016074a0:     	bl	0x10161f008 <__Z33ED_ipad_panels_main_region_layoutPK8wmWindowP7ScrArea>
1016074a4:     	cbz	w0, 0x1016074c8 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xa8>
1016074a8:     	ldur	q0, [x19, #0x38]
1016074ac:     	stp	q0, q0, [sp, #0x10]
1016074b0:     	ldr	x1, [x19, #0x78]
1016074b4:     	add	x2, sp, #0x20
1016074b8:     	add	x3, sp, #0x10
1016074bc:     	mov	x0, x19
1016074c0:     	mov	w4, #0x0                ; =0
1016074c4:     	bl	0x10160c814 <__ZL21region_rect_recursiveP7ScrAreaP7ARegionP4rctiS4_i>
1016074c8:     	mov	x0, x20
1016074cc:     	mov	x1, x22
1016074d0:     	mov	x2, x19
1016074d4:     	bl	0x10160771c <__ZL15area_azone_initPK8wmWindowPK7bScreenP7ScrArea>
1016074d8:     	ldr	x23, [x19, #0x78]
1016074dc:     	cbz	x23, 0x101607580 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x160>
1016074e0:     	mov	w24, #0xa0              ; =160
1016074e4:     	b	0x101607500 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xe0>
1016074e8:     	mov	x0, x22
1016074ec:     	mov	x1, x19
1016074f0:     	mov	x2, x23
1016074f4:     	bl	0x101607958 <__ZL17region_azones_addPK7bScreenP7ScrAreaP7ARegion>
1016074f8:     	ldr	x23, [x23]
1016074fc:     	cbz	x23, 0x101607580 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x160>
101607500:     	ldrh	w8, [x23, #0xc4]
101607504:     	tbnz	w8, #0xa, 0x1016074f8 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xd8>
101607508:     	ands	w10, w8, #0x3
10160750c:     	cset	w9, ne
101607510:     	ldrh	w11, [x23, #0xc2]
101607514:     	tst	w11, w24
101607518:     	b.eq	0x101607544 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x124>
10160751c:     	cmp	w10, #0x0
101607520:     	ldr	x11, [x23, #0x8]
101607524:     	ccmp	x11, #0x0, #0x0, eq
101607528:     	cset	w9, ne
10160752c:     	cmp	w10, #0x0
101607530:     	ccmp	x11, #0x0, #0x4, eq
101607534:     	b.eq	0x101607544 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x124>
101607538:     	ldrh	w9, [x11, #0xc4]
10160753c:     	tst	w9, #0x3
101607540:     	cset	w9, ne
101607544:     	ldr	x10, [x23, #0x128]
101607548:     	ldrb	w11, [x10]
10160754c:     	ubfx	w8, w8, #1, #1
101607550:     	cmp	w11, #0x0
101607554:     	csel	w8, w8, w9, ne
101607558:     	eor	w8, w8, #0x1
10160755c:     	strh	w8, [x10, #0x2b0]
101607560:     	ldr	x8, [x23, #0x128]
101607564:     	ldr	x8, [x8, #0xb8]
101607568:     	ldr	x8, [x8, #0x18]
10160756c:     	cbz	x8, 0x1016074e8 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xc8>
101607570:     	mov	x0, x21
101607574:     	mov	x1, x23
101607578:     	blr	x8
10160757c:     	b	0x1016074e8 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xc8>
101607580:     	ldr	x8, [x20, #0xf0]
101607584:     	add	x1, x8, #0x14
101607588:     	mov	x0, x19
10160758c:     	bl	0x1016346b0 <__Z21ED_area_azones_updateP7ScrAreaPKi>
101607590:     	ldrh	w8, [x19, #0x52]
101607594:     	and	w8, w8, #0xfffffff7
101607598:     	strh	w8, [x19, #0x52]
10160759c:     	ldp	x29, x30, [sp, #0x60]
1016075a0:     	ldp	x20, x19, [sp, #0x50]
1016075a4:     	ldp	x22, x21, [sp, #0x40]
1016075a8:     	ldp	x24, x23, [sp, #0x30]
1016075ac:     	add	sp, sp, #0x70
1016075b0:     	ret
