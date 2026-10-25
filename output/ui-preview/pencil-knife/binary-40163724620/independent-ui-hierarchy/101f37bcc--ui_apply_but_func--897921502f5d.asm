
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f37bcc <__ZL17ui_apply_but_funcP8bContextP5uiBut>:
101f37bcc:     	sub	sp, sp, #0x140
101f37bd0:     	stp	x28, x27, [sp, #0xf0]
101f37bd4:     	stp	x24, x23, [sp, #0x100]
101f37bd8:     	stp	x22, x21, [sp, #0x110]
101f37bdc:     	stp	x20, x19, [sp, #0x120]
101f37be0:     	stp	x29, x30, [sp, #0x130]
101f37be4:     	add	x29, sp, #0x130
101f37be8:     	mov	x19, x1
101f37bec:     	mov	x21, x0
101f37bf0:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
101f37bf4:     	ldr	x8, [x8, #0x7f0]
101f37bf8:     	ldr	x8, [x8]
101f37bfc:     	stur	x8, [x29, #-0x48]
101f37c00:     	bl	0x101f093c4 <__Z33ui_ipad_but_self_callback_allowedP8bContextP5uiBut>
101f37c04:     	cbz	w0, 0x101f3837c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x7b0>
101f37c08:     	mov	x0, x19
101f37c0c:     	bl	0x101f05a30 <__Z26ui_ipad_numbers_but_rebindP5uiBut>
101f37c10:     	cbz	w0, 0x101f3837c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x7b0>
101f37c14:     	ldr	x20, [x19, #0x420]
101f37c18:     	add	x1, x20, #0x3b0
101f37c1c:     	mov	x0, x21
101f37c20:     	bl	0x101f8f1cc <__Z27ui_ipad_action_origin_validP8bContextRKN7blender2ui4ipad12ActionOriginE>
101f37c24:     	cbz	w0, 0x101f3837c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x7b0>
101f37c28:     	ldr	x8, [x19, #0xa0]
101f37c2c:     	cbnz	x8, 0x101f37c68 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x9c>
101f37c30:     	ldr	x8, [x19, #0xd0]
101f37c34:     	cbnz	x8, 0x101f37c68 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x9c>
101f37c38:     	ldr	x8, [x19, #0xd8]
101f37c3c:     	cbnz	x8, 0x101f37c68 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x9c>
101f37c40:     	ldr	x8, [x19, #0x110]
101f37c44:     	cbnz	x8, 0x101f37c68 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x9c>
101f37c48:     	ldr	x8, [x19, #0x140]
101f37c4c:     	cbnz	x8, 0x101f37c68 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x9c>
101f37c50:     	ldr	x8, [x19, #0x3b0]
101f37c54:     	cbnz	x8, 0x101f37c68 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x9c>
101f37c58:     	ldr	x8, [x19, #0x258]
101f37c5c:     	cbnz	x8, 0x101f37c68 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x9c>
101f37c60:     	ldr	x8, [x20, #0x2d8]
101f37c64:     	cbz	x8, 0x101f38400 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x834>
101f37c68:     	ldr	x8, [x19, #0x420]
101f37c6c:     	ldr	x8, [x8, #0x418]
101f37c70:     	cbz	x8, 0x101f37c94 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0xc8>
101f37c74:     	adrp	x0, 0x104d51000 <__ZL3hex+0x18534d>
101f37c78:     	add	x0, x0, #0x8cf
101f37c7c:     	mov	w1, #0x1                ; =1
101f37c80:     	bl	0x100b7bc38 <__Z20WM_operatortype_findPKcb>
101f37c84:     	cbz	x0, 0x101f37c94 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0xc8>
101f37c88:     	ldr	x8, [x19, #0x3b0]
101f37c8c:     	cmp	x8, x0
101f37c90:     	b.eq	0x101f383b0 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x7e4>
101f37c94:     	ldr	x8, [x19, #0xa0]
101f37c98:     	cbz	x8, 0x101f37cb4 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0xe8>
101f37c9c:     	ldr	x8, [x19, #0xa8]
101f37ca0:     	cmp	x8, x19
101f37ca4:     	b.eq	0x101f37cbc <__ZL17ui_apply_but_funcP8bContextP5uiBut+0xf0>
101f37ca8:     	ldr	x8, [x19, #0xb0]
101f37cac:     	cmp	x8, x19
101f37cb0:     	b.eq	0x101f37cbc <__ZL17ui_apply_but_funcP8bContextP5uiBut+0xf0>
101f37cb4:     	mov	w23, #0x0               ; =0
101f37cb8:     	b	0x101f37d10 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x144>
101f37cbc:     	ldr	x8, [x20, #0x418]
101f37cc0:     	cbz	x8, 0x101f37d0c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x140>
101f37cc4:     	mov	x8, sp
101f37cc8:     	mov	x0, x19
101f37ccc:     	bl	0x101f053a0 <__Z28ui_ipad_button_lease_capturePK5uiBut>
101f37cd0:     	mov	x1, sp
101f37cd4:     	mov	x0, x21
101f37cd8:     	bl	0x101f05434 <__Z28ui_ipad_button_lease_resolveP8bContextRK17uiIPadButtonLease>
101f37cdc:     	cmp	x0, x19
101f37ce0:     	b.ne	0x101f3837c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x7b0>
101f37ce4:     	ldp	x8, x1, [x19, #0xa0]
101f37ce8:     	ldr	x2, [x19, #0xb0]
101f37cec:     	mov	x0, x21
101f37cf0:     	blr	x8
101f37cf4:     	mov	x1, sp
101f37cf8:     	mov	x0, x21
101f37cfc:     	bl	0x101f05434 <__Z28ui_ipad_button_lease_resolveP8bContextRK17uiIPadButtonLease>
101f37d00:     	mov	x19, x0
101f37d04:     	cbz	x0, 0x101f3837c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x7b0>
101f37d08:     	ldr	x20, [x19, #0x420]
101f37d0c:     	mov	w23, #0x1               ; =1
101f37d10:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101f37d14:     	add	x8, x8, #0x6d0
101f37d18:     	ldr	x8, [x8]
101f37d1c:     	adrp	x2, 0x104d51000 <__ZL3hex+0x18534d>
101f37d20:     	add	x2, x2, #0x8be
101f37d24:     	mov	w0, #0x5d8              ; =1496
101f37d28:     	mov	w1, #0x8                ; =8
101f37d2c:     	mov	w3, #0x1                ; =1
101f37d30:     	blr	x8
101f37d34:     	mov	x22, x0
101f37d38:     	add	x24, x0, #0x3b0
101f37d3c:     	mov	w1, #0x5c0              ; =1472
101f37d40:     	bl	0x104b71840 <_zlibVersion+0x104b71840>
101f37d44:     	str	x24, [x22, #0x398]
101f37d48:     	str	x24, [x22, #0x3a0]
101f37d4c:     	add	x8, x22, #0x3d0
101f37d50:     	str	x8, [x22, #0x3a8]
101f37d54:     	add	x8, x22, #0x3e8
101f37d58:     	add	x9, x22, #0x418
101f37d5c:     	movi.16b	v0, #0x0
101f37d60:     	str	q0, [x22, #0x530]
101f37d64:     	strb	wzr, [x22, #0x540]
101f37d68:     	str	xzr, [x22, #0x5c0]
101f37d6c:     	str	xzr, [x22, #0x5d0]
101f37d70:     	str	xzr, [x22, #0x5c8]
101f37d74:     	stp	q0, q0, [x8]
101f37d78:     	stur	q0, [x8, #0x1e]
101f37d7c:     	stp	q0, q0, [x9]
101f37d80:     	stp	q0, q0, [x9, #0x20]
101f37d84:     	stp	q0, q0, [x9, #0x40]
101f37d88:     	stp	q0, q0, [x9, #0x60]
101f37d8c:     	stp	q0, q0, [x9, #0x80]
101f37d90:     	stp	q0, q0, [x9, #0xa0]
101f37d94:     	stp	q0, q0, [x9, #0xc0]
101f37d98:     	strh	wzr, [x22, #0x4f8]
101f37d9c:     	adrp	x0, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f37da0:     	add	x0, x0, #0x2d8
101f37da4:     	mov	x1, x22
101f37da8:     	bl	0x10078fe38 <__Z11BLI_addtailP8ListBasePv>
101f37dac:     	add	x8, x22, #0xe8
101f37db0:     	ldp	q0, q1, [x20, #0x3b0]
101f37db4:     	ldp	q2, q3, [x20, #0x3d0]
101f37db8:     	stp	q2, q3, [x8, #0x20]
101f37dbc:     	stur	q1, [x22, #0xf8]
101f37dc0:     	stur	q0, [x22, #0xe8]
101f37dc4:     	ldp	q0, q1, [x20, #0x3f0]
101f37dc8:     	ldr	q2, [x20, #0x410]
101f37dcc:     	ldr	q3, [x20, #0x420]
101f37dd0:     	stp	q2, q3, [x8, #0x60]
101f37dd4:     	stp	q0, q1, [x8, #0x40]
101f37dd8:     	ldr	q0, [x20, #0x430]
101f37ddc:     	ldr	q1, [x20, #0x440]
101f37de0:     	ldr	q2, [x20, #0x450]
101f37de4:     	ldrb	w9, [x20, #0x460]
101f37de8:     	strb	w9, [x22, #0x198]
101f37dec:     	stp	q1, q2, [x8, #0x90]
101f37df0:     	str	q0, [x8, #0x80]
101f37df4:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f37df8:     	ldr	x9, [x8, #0x70]
101f37dfc:     	cbz	x9, 0x101f37ea4 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x2d8>
101f37e00:     	ldr	x8, [x19, #0x8]
101f37e04:     	fmov	d0, x9
101f37e08:     	cnt.8b	v0, v0
101f37e0c:     	uaddlv.8b	h0, v0
101f37e10:     	fmov	w10, s0
101f37e14:     	cmp	x10, #0x1
101f37e18:     	b.hi	0x101f37e28 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x25c>
101f37e1c:     	sub	x11, x9, #0x1
101f37e20:     	and	x11, x11, x8
101f37e24:     	b	0x101f37e3c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x270>
101f37e28:     	mov	x11, x8
101f37e2c:     	cmp	x8, x9
101f37e30:     	b.lo	0x101f37e3c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x270>
101f37e34:     	udiv	x11, x8, x9
101f37e38:     	msub	x11, x11, x9, x8
101f37e3c:     	adrp	x12, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f37e40:     	ldr	x12, [x12, #0x68]
101f37e44:     	ldr	x12, [x12, x11, lsl #3]
101f37e48:     	cbz	x12, 0x101f37ea4 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x2d8>
101f37e4c:     	ldr	x12, [x12]
101f37e50:     	cbz	x12, 0x101f37ea4 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x2d8>
101f37e54:     	sub	x13, x9, #0x1
101f37e58:     	b	0x101f37e70 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x2a4>
101f37e5c:     	ldr	x14, [x12, #0x10]
101f37e60:     	cmp	x14, x8
101f37e64:     	b.eq	0x101f37ea8 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x2dc>
101f37e68:     	ldr	x12, [x12]
101f37e6c:     	cbz	x12, 0x101f37ea4 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x2d8>
101f37e70:     	ldr	x14, [x12, #0x8]
101f37e74:     	cmp	x8, x14
101f37e78:     	b.eq	0x101f37e5c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x290>
101f37e7c:     	cmp	x10, #0x1
101f37e80:     	b.hi	0x101f37e8c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x2c0>
101f37e84:     	and	x14, x14, x13
101f37e88:     	b	0x101f37e9c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x2d0>
101f37e8c:     	cmp	x14, x9
101f37e90:     	b.lo	0x101f37e9c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x2d0>
101f37e94:     	udiv	x15, x14, x9
101f37e98:     	msub	x14, x15, x9, x14
101f37e9c:     	cmp	x14, x11
101f37ea0:     	b.eq	0x101f37e68 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x29c>
101f37ea4:     	mov	x8, #0x0                ; =0
101f37ea8:     	str	x8, [x22, #0x1a0]
101f37eac:     	ldr	x8, [x20, #0x3a8]
101f37eb0:     	cbz	x8, 0x101f37ec8 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x2fc>
101f37eb4:     	ldr	x8, [x8, #0x1a0]
101f37eb8:     	str	x8, [x22, #0x2d0]
101f37ebc:     	ldr	x8, [x20, #0x3a8]
101f37ec0:     	cbz	x8, 0x101f37ec8 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x2fc>
101f37ec4:     	ldrb	w8, [x8, #0x1a9]
101f37ec8:     	and	w8, w8, #0x1
101f37ecc:     	strb	w8, [x22, #0x2d8]
101f37ed0:     	cbz	w23, 0x101f37ef0 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x324>
101f37ed4:     	ldr	x8, [x20, #0x418]
101f37ed8:     	cbnz	x8, 0x101f37ef8 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x32c>
101f37edc:     	ldp	x8, x1, [x19, #0xa0]
101f37ee0:     	ldr	x2, [x19, #0xb0]
101f37ee4:     	mov	x0, x21
101f37ee8:     	blr	x8
101f37eec:     	b	0x101f37ef8 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x32c>
101f37ef0:     	ldr	x8, [x19, #0xa0]
101f37ef4:     	str	x8, [x22, #0x10]
101f37ef8:     	ldr	x8, [x19, #0xa8]
101f37efc:     	str	x8, [x22, #0x18]
101f37f00:     	ldr	x8, [x19, #0xb0]
101f37f04:     	str	x8, [x22, #0x20]
101f37f08:     	ldr	x0, [x19, #0xd0]
101f37f0c:     	cbz	x0, 0x101f37f30 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x364>
101f37f10:     	add	x8, x19, #0xb8
101f37f14:     	cmp	x0, x8
101f37f18:     	b.eq	0x101f37f38 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x36c>
101f37f1c:     	ldr	x8, [x0]
101f37f20:     	ldr	x8, [x8, #0x10]
101f37f24:     	blr	x8
101f37f28:     	str	x0, [sp, #0x18]
101f37f2c:     	b	0x101f37f50 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x384>
101f37f30:     	str	xzr, [sp, #0x18]
101f37f34:     	b	0x101f37f50 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x384>
101f37f38:     	mov	x8, sp
101f37f3c:     	str	x8, [sp, #0x18]
101f37f40:     	ldr	x8, [x0]
101f37f44:     	ldr	x8, [x8, #0x18]
101f37f48:     	mov	x1, sp
101f37f4c:     	blr	x8
101f37f50:     	mov	x23, sp
101f37f54:     	mov	x0, sp
101f37f58:     	add	x1, x22, #0x28
101f37f5c:     	bl	0x101f1c948 <__ZNSt3__110__function12__value_funcIFvR8bContextEE4swapB8ne190102ERS5_>
101f37f60:     	ldr	x0, [sp, #0x18]
101f37f64:     	cmp	x0, x23
101f37f68:     	b.eq	0x101f37f78 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x3ac>
101f37f6c:     	cbz	x0, 0x101f37f88 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x3bc>
101f37f70:     	mov	w8, #0x28               ; =40
101f37f74:     	b	0x101f37f7c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x3b0>
101f37f78:     	mov	w8, #0x20               ; =32
101f37f7c:     	ldr	x9, [x0]
101f37f80:     	ldr	x8, [x9, x8]
101f37f84:     	blr	x8
101f37f88:     	ldr	x8, [x19, #0xd8]
101f37f8c:     	str	x8, [x22, #0x48]
101f37f90:     	ldr	x0, [x19, #0xe0]
101f37f94:     	cbz	x0, 0x101f37fa0 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x3d4>
101f37f98:     	ldr	x8, [x19, #0xf0]
101f37f9c:     	blr	x8
101f37fa0:     	str	x0, [x22, #0x50]
101f37fa4:     	ldr	x8, [x19, #0xe8]
101f37fa8:     	str	x8, [x22, #0x58]
101f37fac:     	ldr	x8, [x19, #0x110]
101f37fb0:     	str	x8, [x22, #0x60]
101f37fb4:     	ldr	x8, [x19, #0x118]
101f37fb8:     	str	x8, [x22, #0x68]
101f37fbc:     	ldr	x8, [x19, #0x120]
101f37fc0:     	str	x8, [x22, #0x70]
101f37fc4:     	ldr	x0, [x19, #0x140]
101f37fc8:     	cbz	x0, 0x101f37fec <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x420>
101f37fcc:     	add	x8, x19, #0x128
101f37fd0:     	cmp	x0, x8
101f37fd4:     	b.eq	0x101f37ff4 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x428>
101f37fd8:     	ldr	x8, [x0]
101f37fdc:     	ldr	x8, [x8, #0x10]
101f37fe0:     	blr	x8
101f37fe4:     	str	x0, [sp, #0x18]
101f37fe8:     	b	0x101f3800c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x440>
101f37fec:     	str	xzr, [sp, #0x18]
101f37ff0:     	b	0x101f3800c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x440>
101f37ff4:     	mov	x8, sp
101f37ff8:     	str	x8, [sp, #0x18]
101f37ffc:     	ldr	x8, [x0]
101f38000:     	ldr	x8, [x8, #0x18]
101f38004:     	mov	x1, sp
101f38008:     	blr	x8
101f3800c:     	mov	x23, sp
101f38010:     	mov	x0, sp
101f38014:     	add	x1, x22, #0x78
101f38018:     	bl	0x101f1bb78 <__ZNSt3__110__function12__value_funcIFvRNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEE4swapB8ne190102ERSA_>
101f3801c:     	ldr	x0, [sp, #0x18]
101f38020:     	cmp	x0, x23
101f38024:     	b.eq	0x101f38034 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x468>
101f38028:     	cbz	x0, 0x101f38044 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x478>
101f3802c:     	mov	w8, #0x28               ; =40
101f38030:     	b	0x101f38038 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x46c>
101f38034:     	mov	w8, #0x20               ; =32
101f38038:     	ldr	x9, [x0]
101f3803c:     	ldr	x8, [x9, x8]
101f38040:     	blr	x8
101f38044:     	add	x0, x19, #0x148
101f38048:     	ldrsb	w8, [x22, #0xaf]
101f3804c:     	tbz	w8, #0x1f, 0x101f38064 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x498>
101f38050:     	ldur	x8, [x22, #0x98]
101f38054:     	mov	x23, x0
101f38058:     	mov	x0, x8
101f3805c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f38060:     	mov	x0, x23
101f38064:     	ldr	q0, [x0]
101f38068:     	ldr	x8, [x0, #0x10]
101f3806c:     	stur	x8, [x22, #0xa8]
101f38070:     	stur	q0, [x22, #0x98]
101f38074:     	strb	wzr, [x19, #0x15f]
101f38078:     	strb	wzr, [x19, #0x148]
101f3807c:     	adrp	x1, 0x104b94000 <_zlibVersion+0x104b94000>
101f38080:     	add	x1, x1, #0x314
101f38084:     	bl	0x104b70ec8 <_zlibVersion+0x104b70ec8>
101f38088:     	ldr	x8, [x20, #0x2d8]
101f3808c:     	str	x8, [x22, #0xb0]
101f38090:     	ldr	x8, [x20, #0x2e0]
101f38094:     	str	x8, [x22, #0xb8]
101f38098:     	ldrsh	w8, [x19, #0x26]
101f3809c:     	str	w8, [x22, #0xc0]
101f380a0:     	ldr	x8, [x20, #0x3a8]
101f380a4:     	cbz	x8, 0x101f380b0 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x4e4>
101f380a8:     	ldr	x8, [x8, #0x270]
101f380ac:     	str	x8, [x22, #0xc8]
101f380b0:     	ldrb	w8, [x19, #0x3ae]
101f380b4:     	tbnz	w8, #0x0, 0x101f381ec <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x620>
101f380b8:     	ldr	x8, [x22, #0x150]
101f380bc:     	cbz	x8, 0x101f38134 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x568>
101f380c0:     	ldr	x0, [x19, #0x3b0]
101f380c4:     	mov	x8, sp
101f380c8:     	bl	0x101f37488 <__ZL24ui_ipad_operator_capturePK14wmOperatorType>
101f380cc:     	ldr	q0, [sp]
101f380d0:     	str	q0, [x22, #0x2a0]
101f380d4:     	ldr	x8, [sp, #0x10]
101f380d8:     	str	x8, [x22, #0x2b0]
101f380dc:     	add	x23, x22, #0x2b8
101f380e0:     	ldrsb	w8, [x22, #0x2cf]
101f380e4:     	tbz	w8, #0x1f, 0x101f380f0 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x524>
101f380e8:     	ldr	x0, [x23]
101f380ec:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f380f0:     	ldur	q0, [sp, #0x18]
101f380f4:     	str	q0, [x23]
101f380f8:     	ldr	x8, [sp, #0x28]
101f380fc:     	str	x8, [x23, #0x10]
101f38100:     	ldr	x8, [x22, #0x150]
101f38104:     	cbz	x8, 0x101f38134 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x568>
101f38108:     	ldr	x8, [x22, #0x2a8]
101f3810c:     	cbz	x8, 0x101f38134 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x568>
101f38110:     	add	x0, x22, #0x2a0
101f38114:     	bl	0x101f3764c <__ZL24ui_ipad_operator_resolveRK21uiIPadOperatorReceipt>
101f38118:     	bl	0x101f3841c <__ZL23ui_ipad_view_action_bitPK14wmOperatorType>
101f3811c:     	cmp	w0, #0x0
101f38120:     	cset	w8, ne
101f38124:     	strb	w8, [x22, #0x290]
101f38128:     	cbz	w0, 0x101f38134 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x568>
101f3812c:     	ldr	x8, [x20, #0x550]
101f38130:     	str	x8, [x22, #0x298]
101f38134:     	ldrb	w8, [x20, #0x750]
101f38138:     	tbz	w8, #0x7, 0x101f381c4 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x5f8>
101f3813c:     	ldr	x8, [x19, #0x3b0]
101f38140:     	cbz	x8, 0x101f381c4 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x5f8>
101f38144:     	mov	w8, #0x1                ; =1
101f38148:     	strb	w8, [x22, #0x1a8]
101f3814c:     	add	x2, x22, #0x1b0
101f38150:     	mov	x0, x21
101f38154:     	mov	x1, x20
101f38158:     	bl	0x101f94d2c <__Z27UI_ipad_ring_reopen_captureP8bContextPK7uiBlockR23uiIPadRingReopenRequest>
101f3815c:     	mov	x8, sp
101f38160:     	mov	x0, x21
101f38164:     	mov	x1, x19
101f38168:     	bl	0x101f8fd78 <__Z29ui_ipad_ring_selection_targetP8bContextPK5uiBut>
101f3816c:     	add	x23, x22, #0x368
101f38170:     	ldrsb	w8, [x22, #0x37f]
101f38174:     	tbz	w8, #0x1f, 0x101f38180 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x5b4>
101f38178:     	ldr	x0, [x23]
101f3817c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f38180:     	ldr	q0, [sp]
101f38184:     	str	q0, [x23]
101f38188:     	ldr	x8, [sp, #0x10]
101f3818c:     	str	x8, [x23, #0x10]
101f38190:     	add	x23, x22, #0x2e0
101f38194:     	add	x3, x22, #0x348
101f38198:     	add	x4, x22, #0x360
101f3819c:     	mov	x0, x21
101f381a0:     	mov	x1, x20
101f381a4:     	mov	x2, x23
101f381a8:     	bl	0x101f8fb94 <__Z27ui_ipad_ring_action_captureP8bContextPK7uiBlockPyRNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEERy>
101f381ac:     	tbnz	w0, #0x0, 0x101f381c4 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x5f8>
101f381b0:     	str	xzr, [x23, #0x60]
101f381b4:     	movi.16b	v0, #0x0
101f381b8:     	stp	q0, q0, [x23, #0x40]
101f381bc:     	stp	q0, q0, [x23, #0x20]
101f381c0:     	stp	q0, q0, [x23]
101f381c4:     	ldr	x8, [x19, #0x3b0]
101f381c8:     	str	x8, [x22, #0xd0]
101f381cc:     	add	x8, x19, #0x3af
101f381d0:     	ldrb	w9, [x19, #0x3af]
101f381d4:     	strb	w9, [x22, #0xd8]
101f381d8:     	ldr	x9, [x19, #0x3b8]
101f381dc:     	str	x9, [x22, #0xe0]
101f381e0:     	strb	wzr, [x19, #0x3bf]
101f381e4:     	movi.16b	v0, #0x0
101f381e8:     	str	q0, [x8]
101f381ec:     	add	x8, x19, #0x1f8
101f381f0:     	ldr	q0, [x8]
101f381f4:     	ldr	x8, [x19, #0x208]
101f381f8:     	str	x8, [x22, #0x390]
101f381fc:     	str	q0, [x22, #0x380]
101f38200:     	add	x0, x22, #0x398
101f38204:     	add	x1, x19, #0x210
101f38208:     	bl	0x100020504 <__ZN7blender21copy_assign_containerINS_6VectorI18AncestorPointerRNALx2ENS_16GuardedAllocatorEEEEERT_S6_RKS5_>
101f3820c:     	ldr	x8, [x19, #0x258]
101f38210:     	str	x8, [x22, #0x3d8]
101f38214:     	add	x21, x19, #0x268
101f38218:     	ldr	q0, [x21]
101f3821c:     	str	q0, [x22, #0x3e0]
101f38220:     	ldp	q0, q1, [x21, #0x10]
101f38224:     	ldp	q2, q3, [x21, #0x30]
101f38228:     	str	q3, [x22, #0x420]
101f3822c:     	str	q2, [x22, #0x410]
101f38230:     	stp	q0, q1, [x22, #0x3f0]
101f38234:     	ldp	q0, q1, [x21, #0x50]
101f38238:     	ldr	q2, [x21, #0x70]
101f3823c:     	ldr	x8, [x19, #0x2e8]
101f38240:     	str	x8, [x22, #0x460]
101f38244:     	str	q2, [x22, #0x450]
101f38248:     	str	q1, [x22, #0x440]
101f3824c:     	str	q0, [x22, #0x430]
101f38250:     	add	x0, x22, #0x468
101f38254:     	add	x1, x19, #0x2f0
101f38258:     	bl	0x104b70f64 <_zlibVersion+0x104b70f64>
101f3825c:     	add	x0, x22, #0x480
101f38260:     	add	x1, x19, #0x308
101f38264:     	bl	0x104b70f64 <_zlibVersion+0x104b70f64>
101f38268:     	add	x0, x22, #0x498
101f3826c:     	add	x1, x19, #0x320
101f38270:     	bl	0x104b70f64 <_zlibVersion+0x104b70f64>
101f38274:     	add	x0, x22, #0x4b0
101f38278:     	add	x1, x19, #0x338
101f3827c:     	bl	0x104b70f64 <_zlibVersion+0x104b70f64>
101f38280:     	add	x8, x22, #0x3e0
101f38284:     	cmp	x8, x21
101f38288:     	b.eq	0x101f382b8 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x6ec>
101f3828c:     	ldr	x1, [x19, #0x350]
101f38290:     	ldr	x2, [x19, #0x358]
101f38294:     	sub	x8, x2, x1
101f38298:     	asr	x8, x8, #3
101f3829c:     	mov	x9, #0x8e39             ; =36409
101f382a0:     	movk	x9, #0x38e3, lsl #16
101f382a4:     	movk	x9, #0xe38e, lsl #32
101f382a8:     	movk	x9, #0x8e38, lsl #48
101f382ac:     	mul	x3, x8, x9
101f382b0:     	add	x0, x22, #0x4c8
101f382b4:     	bl	0x101f19d2c <__ZNSt3__16vectorI17uiIPadRNAPathStepNS_9allocatorIS1_EEE18__assign_with_sizeB8ne190102IPS1_S6_EEvT_T0_l>
101f382b8:     	add	x8, x22, #0x4e0
101f382bc:     	add	x9, x19, #0x368
101f382c0:     	ldr	q0, [x9]
101f382c4:     	ldur	q1, [x9, #0xa]
101f382c8:     	stur	q1, [x8, #0xa]
101f382cc:     	str	q0, [x22, #0x4e0]
101f382d0:     	ldrb	w8, [x19, #0x21]
101f382d4:     	cmp	w8, #0x21
101f382d8:     	b.ne	0x101f382f4 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x728>
101f382dc:     	ldr	x8, [x19, #0x458]
101f382e0:     	str	x8, [x22, #0x508]
101f382e4:     	ldr	x8, [x19, #0x450]
101f382e8:     	str	x8, [x22, #0x500]
101f382ec:     	movi.16b	v0, #0x0
101f382f0:     	str	q0, [x19, #0x450]
101f382f4:     	ldr	x8, [x19, #0x3d0]
101f382f8:     	cbz	x8, 0x101f3834c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x780>
101f382fc:     	ldr	x9, [x8, #0x2e8]
101f38300:     	cbz	x9, 0x101f3834c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x780>
101f38304:     	add	x9, x20, #0x2e8
101f38308:     	ldp	q0, q1, [x9]
101f3830c:     	ldr	q2, [x9, #0x20]
101f38310:     	ldrb	w9, [x20, #0x318]
101f38314:     	strb	w9, [x22, #0x540]
101f38318:     	str	q2, [x22, #0x530]
101f3831c:     	str	q1, [x22, #0x520]
101f38320:     	str	q0, [x22, #0x510]
101f38324:     	ldr	x8, [x8, #0x2e8]
101f38328:     	str	x8, [x22, #0x548]
101f3832c:     	ldr	x9, [x22, #0x8]
101f38330:     	cbz	x9, 0x101f38340 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x774>
101f38334:     	ldr	x10, [x9, #0x548]
101f38338:     	cmp	x10, x8
101f3833c:     	b.eq	0x101f383e0 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x814>
101f38340:     	ldr	w9, [x8, #0x128]
101f38344:     	add	w9, w9, #0x1
101f38348:     	str	w9, [x8, #0x128]
101f3834c:     	ldr	x1, [x19, #0xf8]
101f38350:     	cbz	x1, 0x101f3835c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x790>
101f38354:     	add	x0, x22, #0x550
101f38358:     	bl	0x100b4f6a0 <__ZNSt3__18optionalI13bContextStoreEaSB8ne190102IRKS1_vEERS2_OT_>
101f3835c:     	mov	x0, x19
101f38360:     	bl	0x101f735b0 <__Z31ui_but_drawstr_without_sep_charPK5uiBut>
101f38364:     	mov	x2, x0
101f38368:     	mov	x3, x1
101f3836c:     	add	x0, x22, #0x5c0
101f38370:     	mov	x1, x2
101f38374:     	mov	x2, x3
101f38378:     	bl	0x104b70ed4 <_zlibVersion+0x104b70ed4>
101f3837c:     	ldur	x8, [x29, #-0x48]
101f38380:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
101f38384:     	ldr	x9, [x9, #0x7f0]
101f38388:     	ldr	x9, [x9]
101f3838c:     	cmp	x9, x8
101f38390:     	b.ne	0x101f38414 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x848>
101f38394:     	ldp	x29, x30, [sp, #0x130]
101f38398:     	ldp	x20, x19, [sp, #0x120]
101f3839c:     	ldp	x22, x21, [sp, #0x110]
101f383a0:     	ldp	x24, x23, [sp, #0x100]
101f383a4:     	ldp	x28, x27, [sp, #0xf0]
101f383a8:     	add	sp, sp, #0x140
101f383ac:     	ret
101f383b0:     	mov	x8, sp
101f383b4:     	mov	x0, x19
101f383b8:     	bl	0x101f053a0 <__Z28ui_ipad_button_lease_capturePK5uiBut>
101f383bc:     	mov	x1, sp
101f383c0:     	mov	x0, x21
101f383c4:     	bl	0x101f05434 <__Z28ui_ipad_button_lease_resolveP8bContextRK17uiIPadButtonLease>
101f383c8:     	cmp	x0, x19
101f383cc:     	b.ne	0x101f3837c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x7b0>
101f383d0:     	mov	x0, x19
101f383d4:     	mov	w1, #0x0                ; =0
101f383d8:     	bl	0x101f9b474 <__Z28UI_popup_menu_close_from_butPK5uiButb>
101f383dc:     	b	0x101f37c94 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0xc8>
101f383e0:     	movi.16b	v0, #0x0
101f383e4:     	str	q0, [x9, #0x540]
101f383e8:     	str	q0, [x9, #0x530]
101f383ec:     	str	q0, [x9, #0x520]
101f383f0:     	str	q0, [x9, #0x510]
101f383f4:     	ldr	x1, [x19, #0xf8]
101f383f8:     	cbnz	x1, 0x101f38354 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x788>
101f383fc:     	b	0x101f3835c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x790>
101f38400:     	ldr	x8, [x20, #0x3a8]
101f38404:     	cbz	x8, 0x101f3837c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x7b0>
101f38408:     	ldr	x8, [x8, #0x270]
101f3840c:     	cbnz	x8, 0x101f37c68 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x9c>
101f38410:     	b	0x101f3837c <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x7b0>
101f38414:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
101f38418:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
