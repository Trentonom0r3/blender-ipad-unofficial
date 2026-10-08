
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37847847360\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101606e90 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea>:
101606e90:     	ldrh	w8, [x2, #0x52]
101606e94:     	tbz	w8, #0x3, 0x101607020 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x190>
101606e98:     	sub	sp, sp, #0x70
101606e9c:     	stp	x24, x23, [sp, #0x30]
101606ea0:     	stp	x22, x21, [sp, #0x40]
101606ea4:     	stp	x20, x19, [sp, #0x50]
101606ea8:     	stp	x29, x30, [sp, #0x60]
101606eac:     	add	x29, sp, #0x60
101606eb0:     	mov	x19, x2
101606eb4:     	mov	x20, x1
101606eb8:     	mov	x21, x0
101606ebc:     	mov	x0, x1
101606ec0:     	bl	0x104a3b0a8 <__Z27WM_window_get_active_screenPK8wmWindow>
101606ec4:     	mov	x22, x0
101606ec8:     	mov	x1, sp
101606ecc:     	mov	x0, x20
101606ed0:     	bl	0x100b8ded8 <__Z26WM_window_screen_rect_calcPK8wmWindowP4rcti>
101606ed4:     	mov	x2, sp
101606ed8:     	mov	x0, x22
101606edc:     	mov	x1, x19
101606ee0:     	bl	0x101607024 <__ZL16area_calc_totrctPK7bScreenP7ScrAreaPK4rcti>
101606ee4:     	ldur	q1, [x19, #0x38]
101606ee8:     	ldur	q0, [x19, #0x38]
101606eec:     	stp	q0, q1, [sp, #0x10]
101606ef0:     	ldr	x1, [x19, #0x78]
101606ef4:     	add	x2, sp, #0x20
101606ef8:     	add	x3, sp, #0x10
101606efc:     	mov	x0, x19
101606f00:     	mov	w4, #0x0                ; =0
101606f04:     	bl	0x10160c284 <__ZL21region_rect_recursiveP7ScrAreaP7ARegionP4rctiS4_i>
101606f08:     	mov	x0, x20
101606f0c:     	mov	x1, x19
101606f10:     	bl	0x10161e06c <__Z33ED_ipad_panels_main_region_layoutPK8wmWindowP7ScrArea>
101606f14:     	cbz	w0, 0x101606f38 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xa8>
101606f18:     	ldur	q0, [x19, #0x38]
101606f1c:     	stp	q0, q0, [sp, #0x10]
101606f20:     	ldr	x1, [x19, #0x78]
101606f24:     	add	x2, sp, #0x20
101606f28:     	add	x3, sp, #0x10
101606f2c:     	mov	x0, x19
101606f30:     	mov	w4, #0x0                ; =0
101606f34:     	bl	0x10160c284 <__ZL21region_rect_recursiveP7ScrAreaP7ARegionP4rctiS4_i>
101606f38:     	mov	x0, x20
101606f3c:     	mov	x1, x22
101606f40:     	mov	x2, x19
101606f44:     	bl	0x10160718c <__ZL15area_azone_initPK8wmWindowPK7bScreenP7ScrArea>
101606f48:     	ldr	x23, [x19, #0x78]
101606f4c:     	cbz	x23, 0x101606ff0 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x160>
101606f50:     	mov	w24, #0xa0              ; =160
101606f54:     	b	0x101606f70 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xe0>
101606f58:     	mov	x0, x22
101606f5c:     	mov	x1, x19
101606f60:     	mov	x2, x23
101606f64:     	bl	0x1016073c8 <__ZL17region_azones_addPK7bScreenP7ScrAreaP7ARegion>
101606f68:     	ldr	x23, [x23]
101606f6c:     	cbz	x23, 0x101606ff0 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x160>
101606f70:     	ldrh	w8, [x23, #0xc4]
101606f74:     	tbnz	w8, #0xa, 0x101606f68 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xd8>
101606f78:     	ands	w10, w8, #0x3
101606f7c:     	cset	w9, ne
101606f80:     	ldrh	w11, [x23, #0xc2]
101606f84:     	tst	w11, w24
101606f88:     	b.eq	0x101606fb4 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x124>
101606f8c:     	cmp	w10, #0x0
101606f90:     	ldr	x11, [x23, #0x8]
101606f94:     	ccmp	x11, #0x0, #0x0, eq
101606f98:     	cset	w9, ne
101606f9c:     	cmp	w10, #0x0
101606fa0:     	ccmp	x11, #0x0, #0x4, eq
101606fa4:     	b.eq	0x101606fb4 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x124>
101606fa8:     	ldrh	w9, [x11, #0xc4]
101606fac:     	tst	w9, #0x3
101606fb0:     	cset	w9, ne
101606fb4:     	ldr	x10, [x23, #0x128]
101606fb8:     	ldrb	w11, [x10]
101606fbc:     	ubfx	w8, w8, #1, #1
101606fc0:     	cmp	w11, #0x0
101606fc4:     	csel	w8, w8, w9, ne
101606fc8:     	eor	w8, w8, #0x1
101606fcc:     	strh	w8, [x10, #0x2b0]
101606fd0:     	ldr	x8, [x23, #0x128]
101606fd4:     	ldr	x8, [x8, #0xb8]
101606fd8:     	ldr	x8, [x8, #0x18]
101606fdc:     	cbz	x8, 0x101606f58 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xc8>
101606fe0:     	mov	x0, x21
101606fe4:     	mov	x1, x23
101606fe8:     	blr	x8
101606fec:     	b	0x101606f58 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xc8>
101606ff0:     	ldr	x8, [x20, #0xf0]
101606ff4:     	add	x1, x8, #0x14
101606ff8:     	mov	x0, x19
101606ffc:     	bl	0x1016331f8 <__Z21ED_area_azones_updateP7ScrAreaPKi>
101607000:     	ldrh	w8, [x19, #0x52]
101607004:     	and	w8, w8, #0xfffffff7
101607008:     	strh	w8, [x19, #0x52]
10160700c:     	ldp	x29, x30, [sp, #0x60]
101607010:     	ldp	x20, x19, [sp, #0x50]
101607014:     	ldp	x22, x21, [sp, #0x40]
101607018:     	ldp	x24, x23, [sp, #0x30]
10160701c:     	add	sp, sp, #0x70
101607020:     	ret
