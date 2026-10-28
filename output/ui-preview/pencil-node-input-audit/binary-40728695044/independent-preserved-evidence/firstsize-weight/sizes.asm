
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101622954 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea>:
101622954:     	ldrh	w8, [x2, #0x52]
101622958:     	tbz	w8, #0x3, 0x101622ae4 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x190>
10162295c:     	sub	sp, sp, #0x70
101622960:     	stp	x24, x23, [sp, #0x30]
101622964:     	stp	x22, x21, [sp, #0x40]
101622968:     	stp	x20, x19, [sp, #0x50]
10162296c:     	stp	x29, x30, [sp, #0x60]
101622970:     	add	x29, sp, #0x60
101622974:     	mov	x19, x2
101622978:     	mov	x20, x1
10162297c:     	mov	x21, x0
101622980:     	mov	x0, x1
101622984:     	bl	0x104a61074 <__Z27WM_window_get_active_screenPK8wmWindow>
101622988:     	mov	x22, x0
10162298c:     	mov	x1, sp
101622990:     	mov	x0, x20
101622994:     	bl	0x100b983d8 <__Z26WM_window_screen_rect_calcPK8wmWindowP4rcti>
101622998:     	mov	x2, sp
10162299c:     	mov	x0, x22
1016229a0:     	mov	x1, x19
1016229a4:     	bl	0x101622ae8 <__ZL16area_calc_totrctPK7bScreenP7ScrAreaPK4rcti>
1016229a8:     	ldur	q1, [x19, #0x38]
1016229ac:     	ldur	q0, [x19, #0x38]
1016229b0:     	stp	q0, q1, [sp, #0x10]
1016229b4:     	ldr	x1, [x19, #0x78]
1016229b8:     	add	x2, sp, #0x20
1016229bc:     	add	x3, sp, #0x10
1016229c0:     	mov	x0, x19
1016229c4:     	mov	w4, #0x0                ; =0
1016229c8:     	bl	0x101627e10 <__ZL21region_rect_recursiveP7ScrAreaP7ARegionP4rctiS4_i>
1016229cc:     	mov	x0, x20
1016229d0:     	mov	x1, x19
1016229d4:     	bl	0x10163aad4 <__Z33ED_ipad_panels_main_region_layoutPK8wmWindowP7ScrArea>
1016229d8:     	cbz	w0, 0x1016229fc <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xa8>
1016229dc:     	ldur	q0, [x19, #0x38]
1016229e0:     	stp	q0, q0, [sp, #0x10]
1016229e4:     	ldr	x1, [x19, #0x78]
1016229e8:     	add	x2, sp, #0x20
1016229ec:     	add	x3, sp, #0x10
1016229f0:     	mov	x0, x19
1016229f4:     	mov	w4, #0x0                ; =0
1016229f8:     	bl	0x101627e10 <__ZL21region_rect_recursiveP7ScrAreaP7ARegionP4rctiS4_i>
1016229fc:     	mov	x0, x20
101622a00:     	mov	x1, x22
101622a04:     	mov	x2, x19
101622a08:     	bl	0x101622c50 <__ZL15area_azone_initPK8wmWindowPK7bScreenP7ScrArea>
101622a0c:     	ldr	x23, [x19, #0x78]
101622a10:     	cbz	x23, 0x101622ab4 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x160>
101622a14:     	mov	w24, #0xa0              ; =160
101622a18:     	b	0x101622a34 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xe0>
101622a1c:     	mov	x0, x22
101622a20:     	mov	x1, x19
101622a24:     	mov	x2, x23
101622a28:     	bl	0x101622e8c <__ZL17region_azones_addPK7bScreenP7ScrAreaP7ARegion>
101622a2c:     	ldr	x23, [x23]
101622a30:     	cbz	x23, 0x101622ab4 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x160>
101622a34:     	ldrh	w8, [x23, #0xc4]
101622a38:     	tbnz	w8, #0xa, 0x101622a2c <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xd8>
101622a3c:     	ands	w10, w8, #0x3
101622a40:     	cset	w9, ne
101622a44:     	ldrh	w11, [x23, #0xc2]
101622a48:     	tst	w11, w24
101622a4c:     	b.eq	0x101622a78 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x124>
101622a50:     	cmp	w10, #0x0
101622a54:     	ldr	x11, [x23, #0x8]
101622a58:     	ccmp	x11, #0x0, #0x0, eq
101622a5c:     	cset	w9, ne
101622a60:     	cmp	w10, #0x0
101622a64:     	ccmp	x11, #0x0, #0x4, eq
101622a68:     	b.eq	0x101622a78 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x124>
101622a6c:     	ldrh	w9, [x11, #0xc4]
101622a70:     	tst	w9, #0x3
101622a74:     	cset	w9, ne
101622a78:     	ldr	x10, [x23, #0x128]
101622a7c:     	ldrb	w11, [x10]
101622a80:     	ubfx	w8, w8, #1, #1
101622a84:     	cmp	w11, #0x0
101622a88:     	csel	w8, w8, w9, ne
101622a8c:     	eor	w8, w8, #0x1
101622a90:     	strh	w8, [x10, #0x368]
101622a94:     	ldr	x8, [x23, #0x128]
101622a98:     	ldr	x8, [x8, #0x170]
101622a9c:     	ldr	x8, [x8, #0x18]
101622aa0:     	cbz	x8, 0x101622a1c <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xc8>
101622aa4:     	mov	x0, x21
101622aa8:     	mov	x1, x23
101622aac:     	blr	x8
101622ab0:     	b	0x101622a1c <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xc8>
101622ab4:     	ldr	x8, [x20, #0xf0]
101622ab8:     	add	x1, x8, #0x14
101622abc:     	mov	x0, x19
101622ac0:     	bl	0x1016555c8 <__Z21ED_area_azones_updateP7ScrAreaPKi>
101622ac4:     	ldrh	w8, [x19, #0x52]
101622ac8:     	and	w8, w8, #0xfffffff7
101622acc:     	strh	w8, [x19, #0x52]
101622ad0:     	ldp	x29, x30, [sp, #0x60]
101622ad4:     	ldp	x20, x19, [sp, #0x50]
101622ad8:     	ldp	x22, x21, [sp, #0x40]
101622adc:     	ldp	x24, x23, [sp, #0x30]
101622ae0:     	add	sp, sp, #0x70
101622ae4:     	ret
