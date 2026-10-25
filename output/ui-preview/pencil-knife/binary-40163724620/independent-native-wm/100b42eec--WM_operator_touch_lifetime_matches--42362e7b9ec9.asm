
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b42eec <__Z34WM_operator_touch_lifetime_matchesPK10wmOperatory>:
100b42eec:     	adrp	x8, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b42ef0:     	ldr	x8, [x8, #0x328]
100b42ef4:     	cbz	x8, 0x100b42fd0 <__Z34WM_operator_touch_lifetime_matchesPK10wmOperatory+0xe4>
100b42ef8:     	lsr	x9, x0, #32
100b42efc:     	ubfiz	x10, x0, #3, #29
100b42f00:     	add	x10, x10, #0x8
100b42f04:     	eor	x10, x10, x9
100b42f08:     	mov	x11, #0x2d69            ; =11625
100b42f0c:     	movk	x11, #0xeb38, lsl #16
100b42f10:     	movk	x11, #0xea08, lsl #32
100b42f14:     	movk	x11, #0x9ddf, lsl #48
100b42f18:     	mul	x10, x10, x11
100b42f1c:     	eor	x9, x9, x10, lsr #47
100b42f20:     	eor	x9, x9, x10
100b42f24:     	mul	x9, x9, x11
100b42f28:     	eor	x9, x9, x9, lsr #47
100b42f2c:     	mul	x9, x9, x11
100b42f30:     	fmov	d0, x8
100b42f34:     	cnt.8b	v0, v0
100b42f38:     	uaddlv.8b	h0, v0
100b42f3c:     	fmov	w10, s0
100b42f40:     	cmp	x10, #0x1
100b42f44:     	b.hi	0x100b42f54 <__Z34WM_operator_touch_lifetime_matchesPK10wmOperatory+0x68>
100b42f48:     	sub	x11, x8, #0x1
100b42f4c:     	and	x11, x11, x9
100b42f50:     	b	0x100b42f68 <__Z34WM_operator_touch_lifetime_matchesPK10wmOperatory+0x7c>
100b42f54:     	mov	x11, x9
100b42f58:     	cmp	x9, x8
100b42f5c:     	b.lo	0x100b42f68 <__Z34WM_operator_touch_lifetime_matchesPK10wmOperatory+0x7c>
100b42f60:     	udiv	x11, x9, x8
100b42f64:     	msub	x11, x11, x8, x9
100b42f68:     	adrp	x12, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b42f6c:     	ldr	x12, [x12, #0x320]
100b42f70:     	ldr	x12, [x12, x11, lsl #3]
100b42f74:     	cbz	x12, 0x100b42fd0 <__Z34WM_operator_touch_lifetime_matchesPK10wmOperatory+0xe4>
100b42f78:     	ldr	x12, [x12]
100b42f7c:     	cbz	x12, 0x100b42fd0 <__Z34WM_operator_touch_lifetime_matchesPK10wmOperatory+0xe4>
100b42f80:     	sub	x13, x8, #0x1
100b42f84:     	b	0x100b42f9c <__Z34WM_operator_touch_lifetime_matchesPK10wmOperatory+0xb0>
100b42f88:     	ldr	x14, [x12, #0x10]
100b42f8c:     	cmp	x14, x0
100b42f90:     	b.eq	0x100b42fd8 <__Z34WM_operator_touch_lifetime_matchesPK10wmOperatory+0xec>
100b42f94:     	ldr	x12, [x12]
100b42f98:     	cbz	x12, 0x100b42fd0 <__Z34WM_operator_touch_lifetime_matchesPK10wmOperatory+0xe4>
100b42f9c:     	ldr	x14, [x12, #0x8]
100b42fa0:     	cmp	x14, x9
100b42fa4:     	b.eq	0x100b42f88 <__Z34WM_operator_touch_lifetime_matchesPK10wmOperatory+0x9c>
100b42fa8:     	cmp	x10, #0x1
100b42fac:     	b.hi	0x100b42fb8 <__Z34WM_operator_touch_lifetime_matchesPK10wmOperatory+0xcc>
100b42fb0:     	and	x14, x14, x13
100b42fb4:     	b	0x100b42fc8 <__Z34WM_operator_touch_lifetime_matchesPK10wmOperatory+0xdc>
100b42fb8:     	cmp	x14, x8
100b42fbc:     	b.lo	0x100b42fc8 <__Z34WM_operator_touch_lifetime_matchesPK10wmOperatory+0xdc>
100b42fc0:     	udiv	x15, x14, x8
100b42fc4:     	msub	x14, x15, x8, x14
100b42fc8:     	cmp	x14, x11
100b42fcc:     	b.eq	0x100b42f94 <__Z34WM_operator_touch_lifetime_matchesPK10wmOperatory+0xa8>
100b42fd0:     	mov	w0, #0x0                ; =0
100b42fd4:     	ret
100b42fd8:     	ldr	x8, [x12, #0x18]
100b42fdc:     	cmp	x8, x1
100b42fe0:     	cset	w0, eq
100b42fe4:     	ret
