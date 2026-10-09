
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37960879236\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101609168 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea>:
101609168:     	ldrh	w8, [x2, #0x52]
10160916c:     	tbz	w8, #0x3, 0x1016092f8 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x190>
101609170:     	sub	sp, sp, #0x70
101609174:     	stp	x24, x23, [sp, #0x30]
101609178:     	stp	x22, x21, [sp, #0x40]
10160917c:     	stp	x20, x19, [sp, #0x50]
101609180:     	stp	x29, x30, [sp, #0x60]
101609184:     	add	x29, sp, #0x60
101609188:     	mov	x19, x2
10160918c:     	mov	x20, x1
101609190:     	mov	x21, x0
101609194:     	mov	x0, x1
101609198:     	bl	0x104a3e2a8 <__Z27WM_window_get_active_screenPK8wmWindow>
10160919c:     	mov	x22, x0
1016091a0:     	mov	x1, sp
1016091a4:     	mov	x0, x20
1016091a8:     	bl	0x100b8e468 <__Z26WM_window_screen_rect_calcPK8wmWindowP4rcti>
1016091ac:     	mov	x2, sp
1016091b0:     	mov	x0, x22
1016091b4:     	mov	x1, x19
1016091b8:     	bl	0x1016092fc <__ZL16area_calc_totrctPK7bScreenP7ScrAreaPK4rcti>
1016091bc:     	ldur	q1, [x19, #0x38]
1016091c0:     	ldur	q0, [x19, #0x38]
1016091c4:     	stp	q0, q1, [sp, #0x10]
1016091c8:     	ldr	x1, [x19, #0x78]
1016091cc:     	add	x2, sp, #0x20
1016091d0:     	add	x3, sp, #0x10
1016091d4:     	mov	x0, x19
1016091d8:     	mov	w4, #0x0                ; =0
1016091dc:     	bl	0x10160e55c <__ZL21region_rect_recursiveP7ScrAreaP7ARegionP4rctiS4_i>
1016091e0:     	mov	x0, x20
1016091e4:     	mov	x1, x19
1016091e8:     	bl	0x101620d50 <__Z33ED_ipad_panels_main_region_layoutPK8wmWindowP7ScrArea>
1016091ec:     	cbz	w0, 0x101609210 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xa8>
1016091f0:     	ldur	q0, [x19, #0x38]
1016091f4:     	stp	q0, q0, [sp, #0x10]
1016091f8:     	ldr	x1, [x19, #0x78]
1016091fc:     	add	x2, sp, #0x20
101609200:     	add	x3, sp, #0x10
101609204:     	mov	x0, x19
101609208:     	mov	w4, #0x0                ; =0
10160920c:     	bl	0x10160e55c <__ZL21region_rect_recursiveP7ScrAreaP7ARegionP4rctiS4_i>
101609210:     	mov	x0, x20
101609214:     	mov	x1, x22
101609218:     	mov	x2, x19
10160921c:     	bl	0x101609464 <__ZL15area_azone_initPK8wmWindowPK7bScreenP7ScrArea>
101609220:     	ldr	x23, [x19, #0x78]
101609224:     	cbz	x23, 0x1016092c8 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x160>
101609228:     	mov	w24, #0xa0              ; =160
10160922c:     	b	0x101609248 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xe0>
101609230:     	mov	x0, x22
101609234:     	mov	x1, x19
101609238:     	mov	x2, x23
10160923c:     	bl	0x1016096a0 <__ZL17region_azones_addPK7bScreenP7ScrAreaP7ARegion>
101609240:     	ldr	x23, [x23]
101609244:     	cbz	x23, 0x1016092c8 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x160>
101609248:     	ldrh	w8, [x23, #0xc4]
10160924c:     	tbnz	w8, #0xa, 0x101609240 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xd8>
101609250:     	ands	w10, w8, #0x3
101609254:     	cset	w9, ne
101609258:     	ldrh	w11, [x23, #0xc2]
10160925c:     	tst	w11, w24
101609260:     	b.eq	0x10160928c <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x124>
101609264:     	cmp	w10, #0x0
101609268:     	ldr	x11, [x23, #0x8]
10160926c:     	ccmp	x11, #0x0, #0x0, eq
101609270:     	cset	w9, ne
101609274:     	cmp	w10, #0x0
101609278:     	ccmp	x11, #0x0, #0x4, eq
10160927c:     	b.eq	0x10160928c <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x124>
101609280:     	ldrh	w9, [x11, #0xc4]
101609284:     	tst	w9, #0x3
101609288:     	cset	w9, ne
10160928c:     	ldr	x10, [x23, #0x128]
101609290:     	ldrb	w11, [x10]
101609294:     	ubfx	w8, w8, #1, #1
101609298:     	cmp	w11, #0x0
10160929c:     	csel	w8, w8, w9, ne
1016092a0:     	eor	w8, w8, #0x1
1016092a4:     	strh	w8, [x10, #0x2b0]
1016092a8:     	ldr	x8, [x23, #0x128]
1016092ac:     	ldr	x8, [x8, #0xb8]
1016092b0:     	ldr	x8, [x8, #0x18]
1016092b4:     	cbz	x8, 0x101609230 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xc8>
1016092b8:     	mov	x0, x21
1016092bc:     	mov	x1, x23
1016092c0:     	blr	x8
1016092c4:     	b	0x101609230 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xc8>
1016092c8:     	ldr	x8, [x20, #0xf0]
1016092cc:     	add	x1, x8, #0x14
1016092d0:     	mov	x0, x19
1016092d4:     	bl	0x1016363f8 <__Z21ED_area_azones_updateP7ScrAreaPKi>
1016092d8:     	ldrh	w8, [x19, #0x52]
1016092dc:     	and	w8, w8, #0xfffffff7
1016092e0:     	strh	w8, [x19, #0x52]
1016092e4:     	ldp	x29, x30, [sp, #0x60]
1016092e8:     	ldp	x20, x19, [sp, #0x50]
1016092ec:     	ldp	x22, x21, [sp, #0x40]
1016092f0:     	ldp	x24, x23, [sp, #0x30]
1016092f4:     	add	sp, sp, #0x70
1016092f8:     	ret
