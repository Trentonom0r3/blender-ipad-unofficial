
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37883530390\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101606ea0 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea>:
101606ea0:     	ldrh	w8, [x2, #0x52]
101606ea4:     	tbz	w8, #0x3, 0x101607030 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x190>
101606ea8:     	sub	sp, sp, #0x70
101606eac:     	stp	x24, x23, [sp, #0x30]
101606eb0:     	stp	x22, x21, [sp, #0x40]
101606eb4:     	stp	x20, x19, [sp, #0x50]
101606eb8:     	stp	x29, x30, [sp, #0x60]
101606ebc:     	add	x29, sp, #0x60
101606ec0:     	mov	x19, x2
101606ec4:     	mov	x20, x1
101606ec8:     	mov	x21, x0
101606ecc:     	mov	x0, x1
101606ed0:     	bl	0x104a3c048 <__Z27WM_window_get_active_screenPK8wmWindow>
101606ed4:     	mov	x22, x0
101606ed8:     	mov	x1, sp
101606edc:     	mov	x0, x20
101606ee0:     	bl	0x100b8dee4 <__Z26WM_window_screen_rect_calcPK8wmWindowP4rcti>
101606ee4:     	mov	x2, sp
101606ee8:     	mov	x0, x22
101606eec:     	mov	x1, x19
101606ef0:     	bl	0x101607034 <__ZL16area_calc_totrctPK7bScreenP7ScrAreaPK4rcti>
101606ef4:     	ldur	q1, [x19, #0x38]
101606ef8:     	ldur	q0, [x19, #0x38]
101606efc:     	stp	q0, q1, [sp, #0x10]
101606f00:     	ldr	x1, [x19, #0x78]
101606f04:     	add	x2, sp, #0x20
101606f08:     	add	x3, sp, #0x10
101606f0c:     	mov	x0, x19
101606f10:     	mov	w4, #0x0                ; =0
101606f14:     	bl	0x10160c294 <__ZL21region_rect_recursiveP7ScrAreaP7ARegionP4rctiS4_i>
101606f18:     	mov	x0, x20
101606f1c:     	mov	x1, x19
101606f20:     	bl	0x10161ea88 <__Z33ED_ipad_panels_main_region_layoutPK8wmWindowP7ScrArea>
101606f24:     	cbz	w0, 0x101606f48 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xa8>
101606f28:     	ldur	q0, [x19, #0x38]
101606f2c:     	stp	q0, q0, [sp, #0x10]
101606f30:     	ldr	x1, [x19, #0x78]
101606f34:     	add	x2, sp, #0x20
101606f38:     	add	x3, sp, #0x10
101606f3c:     	mov	x0, x19
101606f40:     	mov	w4, #0x0                ; =0
101606f44:     	bl	0x10160c294 <__ZL21region_rect_recursiveP7ScrAreaP7ARegionP4rctiS4_i>
101606f48:     	mov	x0, x20
101606f4c:     	mov	x1, x22
101606f50:     	mov	x2, x19
101606f54:     	bl	0x10160719c <__ZL15area_azone_initPK8wmWindowPK7bScreenP7ScrArea>
101606f58:     	ldr	x23, [x19, #0x78]
101606f5c:     	cbz	x23, 0x101607000 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x160>
101606f60:     	mov	w24, #0xa0              ; =160
101606f64:     	b	0x101606f80 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xe0>
101606f68:     	mov	x0, x22
101606f6c:     	mov	x1, x19
101606f70:     	mov	x2, x23
101606f74:     	bl	0x1016073d8 <__ZL17region_azones_addPK7bScreenP7ScrAreaP7ARegion>
101606f78:     	ldr	x23, [x23]
101606f7c:     	cbz	x23, 0x101607000 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x160>
101606f80:     	ldrh	w8, [x23, #0xc4]
101606f84:     	tbnz	w8, #0xa, 0x101606f78 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xd8>
101606f88:     	ands	w10, w8, #0x3
101606f8c:     	cset	w9, ne
101606f90:     	ldrh	w11, [x23, #0xc2]
101606f94:     	tst	w11, w24
101606f98:     	b.eq	0x101606fc4 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x124>
101606f9c:     	cmp	w10, #0x0
101606fa0:     	ldr	x11, [x23, #0x8]
101606fa4:     	ccmp	x11, #0x0, #0x0, eq
101606fa8:     	cset	w9, ne
101606fac:     	cmp	w10, #0x0
101606fb0:     	ccmp	x11, #0x0, #0x4, eq
101606fb4:     	b.eq	0x101606fc4 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x124>
101606fb8:     	ldrh	w9, [x11, #0xc4]
101606fbc:     	tst	w9, #0x3
101606fc0:     	cset	w9, ne
101606fc4:     	ldr	x10, [x23, #0x128]
101606fc8:     	ldrb	w11, [x10]
101606fcc:     	ubfx	w8, w8, #1, #1
101606fd0:     	cmp	w11, #0x0
101606fd4:     	csel	w8, w8, w9, ne
101606fd8:     	eor	w8, w8, #0x1
101606fdc:     	strh	w8, [x10, #0x2b0]
101606fe0:     	ldr	x8, [x23, #0x128]
101606fe4:     	ldr	x8, [x8, #0xb8]
101606fe8:     	ldr	x8, [x8, #0x18]
101606fec:     	cbz	x8, 0x101606f68 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xc8>
101606ff0:     	mov	x0, x21
101606ff4:     	mov	x1, x23
101606ff8:     	blr	x8
101606ffc:     	b	0x101606f68 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xc8>
101607000:     	ldr	x8, [x20, #0xf0]
101607004:     	add	x1, x8, #0x14
101607008:     	mov	x0, x19
10160700c:     	bl	0x101634130 <__Z21ED_area_azones_updateP7ScrAreaPKi>
101607010:     	ldrh	w8, [x19, #0x52]
101607014:     	and	w8, w8, #0xfffffff7
101607018:     	strh	w8, [x19, #0x52]
10160701c:     	ldp	x29, x30, [sp, #0x60]
101607020:     	ldp	x20, x19, [sp, #0x50]
101607024:     	ldp	x22, x21, [sp, #0x40]
101607028:     	ldp	x24, x23, [sp, #0x30]
10160702c:     	add	sp, sp, #0x70
101607030:     	ret
