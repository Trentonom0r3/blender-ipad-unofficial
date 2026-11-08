
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101623394 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea>:
101623394:     	ldrh	w8, [x2, #0x52]
101623398:     	tbz	w8, #0x3, 0x101623524 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x190>
10162339c:     	sub	sp, sp, #0x70
1016233a0:     	stp	x24, x23, [sp, #0x30]
1016233a4:     	stp	x22, x21, [sp, #0x40]
1016233a8:     	stp	x20, x19, [sp, #0x50]
1016233ac:     	stp	x29, x30, [sp, #0x60]
1016233b0:     	add	x29, sp, #0x60
1016233b4:     	mov	x19, x2
1016233b8:     	mov	x20, x1
1016233bc:     	mov	x21, x0
1016233c0:     	mov	x0, x1
1016233c4:     	bl	0x104a61c34 <__Z27WM_window_get_active_screenPK8wmWindow>
1016233c8:     	mov	x22, x0
1016233cc:     	mov	x1, sp
1016233d0:     	mov	x0, x20
1016233d4:     	bl	0x100b98e0c <__Z26WM_window_screen_rect_calcPK8wmWindowP4rcti>
1016233d8:     	mov	x2, sp
1016233dc:     	mov	x0, x22
1016233e0:     	mov	x1, x19
1016233e4:     	bl	0x101623528 <__ZL16area_calc_totrctPK7bScreenP7ScrAreaPK4rcti>
1016233e8:     	ldur	q1, [x19, #0x38]
1016233ec:     	ldur	q0, [x19, #0x38]
1016233f0:     	stp	q0, q1, [sp, #0x10]
1016233f4:     	ldr	x1, [x19, #0x78]
1016233f8:     	add	x2, sp, #0x20
1016233fc:     	add	x3, sp, #0x10
101623400:     	mov	x0, x19
101623404:     	mov	w4, #0x0                ; =0
101623408:     	bl	0x101628850 <__ZL21region_rect_recursiveP7ScrAreaP7ARegionP4rctiS4_i>
10162340c:     	mov	x0, x20
101623410:     	mov	x1, x19
101623414:     	bl	0x10163b514 <__Z33ED_ipad_panels_main_region_layoutPK8wmWindowP7ScrArea>
101623418:     	cbz	w0, 0x10162343c <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xa8>
10162341c:     	ldur	q0, [x19, #0x38]
101623420:     	stp	q0, q0, [sp, #0x10]
101623424:     	ldr	x1, [x19, #0x78]
101623428:     	add	x2, sp, #0x20
10162342c:     	add	x3, sp, #0x10
101623430:     	mov	x0, x19
101623434:     	mov	w4, #0x0                ; =0
101623438:     	bl	0x101628850 <__ZL21region_rect_recursiveP7ScrAreaP7ARegionP4rctiS4_i>
10162343c:     	mov	x0, x20
101623440:     	mov	x1, x22
101623444:     	mov	x2, x19
101623448:     	bl	0x101623690 <__ZL15area_azone_initPK8wmWindowPK7bScreenP7ScrArea>
10162344c:     	ldr	x23, [x19, #0x78]
101623450:     	cbz	x23, 0x1016234f4 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x160>
101623454:     	mov	w24, #0xa0              ; =160
101623458:     	b	0x101623474 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xe0>
10162345c:     	mov	x0, x22
101623460:     	mov	x1, x19
101623464:     	mov	x2, x23
101623468:     	bl	0x1016238cc <__ZL17region_azones_addPK7bScreenP7ScrAreaP7ARegion>
10162346c:     	ldr	x23, [x23]
101623470:     	cbz	x23, 0x1016234f4 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x160>
101623474:     	ldrh	w8, [x23, #0xc4]
101623478:     	tbnz	w8, #0xa, 0x10162346c <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xd8>
10162347c:     	ands	w10, w8, #0x3
101623480:     	cset	w9, ne
101623484:     	ldrh	w11, [x23, #0xc2]
101623488:     	tst	w11, w24
10162348c:     	b.eq	0x1016234b8 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x124>
101623490:     	cmp	w10, #0x0
101623494:     	ldr	x11, [x23, #0x8]
101623498:     	ccmp	x11, #0x0, #0x0, eq
10162349c:     	cset	w9, ne
1016234a0:     	cmp	w10, #0x0
1016234a4:     	ccmp	x11, #0x0, #0x4, eq
1016234a8:     	b.eq	0x1016234b8 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x124>
1016234ac:     	ldrh	w9, [x11, #0xc4]
1016234b0:     	tst	w9, #0x3
1016234b4:     	cset	w9, ne
1016234b8:     	ldr	x10, [x23, #0x128]
1016234bc:     	ldrb	w11, [x10]
1016234c0:     	ubfx	w8, w8, #1, #1
1016234c4:     	cmp	w11, #0x0
1016234c8:     	csel	w8, w8, w9, ne
1016234cc:     	eor	w8, w8, #0x1
1016234d0:     	strh	w8, [x10, #0x368]
1016234d4:     	ldr	x8, [x23, #0x128]
1016234d8:     	ldr	x8, [x8, #0x170]
1016234dc:     	ldr	x8, [x8, #0x18]
1016234e0:     	cbz	x8, 0x10162345c <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xc8>
1016234e4:     	mov	x0, x21
1016234e8:     	mov	x1, x23
1016234ec:     	blr	x8
1016234f0:     	b	0x10162345c <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xc8>
1016234f4:     	ldr	x8, [x20, #0xf0]
1016234f8:     	add	x1, x8, #0x14
1016234fc:     	mov	x0, x19
101623500:     	bl	0x101656008 <__Z21ED_area_azones_updateP7ScrAreaPKi>
101623504:     	ldrh	w8, [x19, #0x52]
101623508:     	and	w8, w8, #0xfffffff7
10162350c:     	strh	w8, [x19, #0x52]
101623510:     	ldp	x29, x30, [sp, #0x60]
101623514:     	ldp	x20, x19, [sp, #0x50]
101623518:     	ldp	x22, x21, [sp, #0x40]
10162351c:     	ldp	x24, x23, [sp, #0x30]
101623520:     	add	sp, sp, #0x70
101623524:     	ret
