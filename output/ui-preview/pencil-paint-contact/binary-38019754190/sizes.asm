
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-38019754190\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010160aca0 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea>:
10160aca0:     	ldrh	w8, [x2, #0x52]
10160aca4:     	tbz	w8, #0x3, 0x10160ae30 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x190>
10160aca8:     	sub	sp, sp, #0x70
10160acac:     	stp	x24, x23, [sp, #0x30]
10160acb0:     	stp	x22, x21, [sp, #0x40]
10160acb4:     	stp	x20, x19, [sp, #0x50]
10160acb8:     	stp	x29, x30, [sp, #0x60]
10160acbc:     	add	x29, sp, #0x60
10160acc0:     	mov	x19, x2
10160acc4:     	mov	x20, x1
10160acc8:     	mov	x21, x0
10160accc:     	mov	x0, x1
10160acd0:     	bl	0x104a40180 <__Z27WM_window_get_active_screenPK8wmWindow>
10160acd4:     	mov	x22, x0
10160acd8:     	mov	x1, sp
10160acdc:     	mov	x0, x20
10160ace0:     	bl	0x100b8f9d4 <__Z26WM_window_screen_rect_calcPK8wmWindowP4rcti>
10160ace4:     	mov	x2, sp
10160ace8:     	mov	x0, x22
10160acec:     	mov	x1, x19
10160acf0:     	bl	0x10160ae34 <__ZL16area_calc_totrctPK7bScreenP7ScrAreaPK4rcti>
10160acf4:     	ldur	q1, [x19, #0x38]
10160acf8:     	ldur	q0, [x19, #0x38]
10160acfc:     	stp	q0, q1, [sp, #0x10]
10160ad00:     	ldr	x1, [x19, #0x78]
10160ad04:     	add	x2, sp, #0x20
10160ad08:     	add	x3, sp, #0x10
10160ad0c:     	mov	x0, x19
10160ad10:     	mov	w4, #0x0                ; =0
10160ad14:     	bl	0x101610094 <__ZL21region_rect_recursiveP7ScrAreaP7ARegionP4rctiS4_i>
10160ad18:     	mov	x0, x20
10160ad1c:     	mov	x1, x19
10160ad20:     	bl	0x101622888 <__Z33ED_ipad_panels_main_region_layoutPK8wmWindowP7ScrArea>
10160ad24:     	cbz	w0, 0x10160ad48 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xa8>
10160ad28:     	ldur	q0, [x19, #0x38]
10160ad2c:     	stp	q0, q0, [sp, #0x10]
10160ad30:     	ldr	x1, [x19, #0x78]
10160ad34:     	add	x2, sp, #0x20
10160ad38:     	add	x3, sp, #0x10
10160ad3c:     	mov	x0, x19
10160ad40:     	mov	w4, #0x0                ; =0
10160ad44:     	bl	0x101610094 <__ZL21region_rect_recursiveP7ScrAreaP7ARegionP4rctiS4_i>
10160ad48:     	mov	x0, x20
10160ad4c:     	mov	x1, x22
10160ad50:     	mov	x2, x19
10160ad54:     	bl	0x10160af9c <__ZL15area_azone_initPK8wmWindowPK7bScreenP7ScrArea>
10160ad58:     	ldr	x23, [x19, #0x78]
10160ad5c:     	cbz	x23, 0x10160ae00 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x160>
10160ad60:     	mov	w24, #0xa0              ; =160
10160ad64:     	b	0x10160ad80 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xe0>
10160ad68:     	mov	x0, x22
10160ad6c:     	mov	x1, x19
10160ad70:     	mov	x2, x23
10160ad74:     	bl	0x10160b1d8 <__ZL17region_azones_addPK7bScreenP7ScrAreaP7ARegion>
10160ad78:     	ldr	x23, [x23]
10160ad7c:     	cbz	x23, 0x10160ae00 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x160>
10160ad80:     	ldrh	w8, [x23, #0xc4]
10160ad84:     	tbnz	w8, #0xa, 0x10160ad78 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xd8>
10160ad88:     	ands	w10, w8, #0x3
10160ad8c:     	cset	w9, ne
10160ad90:     	ldrh	w11, [x23, #0xc2]
10160ad94:     	tst	w11, w24
10160ad98:     	b.eq	0x10160adc4 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x124>
10160ad9c:     	cmp	w10, #0x0
10160ada0:     	ldr	x11, [x23, #0x8]
10160ada4:     	ccmp	x11, #0x0, #0x0, eq
10160ada8:     	cset	w9, ne
10160adac:     	cmp	w10, #0x0
10160adb0:     	ccmp	x11, #0x0, #0x4, eq
10160adb4:     	b.eq	0x10160adc4 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x124>
10160adb8:     	ldrh	w9, [x11, #0xc4]
10160adbc:     	tst	w9, #0x3
10160adc0:     	cset	w9, ne
10160adc4:     	ldr	x10, [x23, #0x128]
10160adc8:     	ldrb	w11, [x10]
10160adcc:     	ubfx	w8, w8, #1, #1
10160add0:     	cmp	w11, #0x0
10160add4:     	csel	w8, w8, w9, ne
10160add8:     	eor	w8, w8, #0x1
10160addc:     	strh	w8, [x10, #0x2b0]
10160ade0:     	ldr	x8, [x23, #0x128]
10160ade4:     	ldr	x8, [x8, #0xb8]
10160ade8:     	ldr	x8, [x8, #0x18]
10160adec:     	cbz	x8, 0x10160ad68 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xc8>
10160adf0:     	mov	x0, x21
10160adf4:     	mov	x1, x23
10160adf8:     	blr	x8
10160adfc:     	b	0x10160ad68 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xc8>
10160ae00:     	ldr	x8, [x20, #0xf0]
10160ae04:     	add	x1, x8, #0x14
10160ae08:     	mov	x0, x19
10160ae0c:     	bl	0x101638190 <__Z21ED_area_azones_updateP7ScrAreaPKi>
10160ae10:     	ldrh	w8, [x19, #0x52]
10160ae14:     	and	w8, w8, #0xfffffff7
10160ae18:     	strh	w8, [x19, #0x52]
10160ae1c:     	ldp	x29, x30, [sp, #0x60]
10160ae20:     	ldp	x20, x19, [sp, #0x50]
10160ae24:     	ldp	x22, x21, [sp, #0x40]
10160ae28:     	ldp	x24, x23, [sp, #0x30]
10160ae2c:     	add	sp, sp, #0x70
10160ae30:     	ret
