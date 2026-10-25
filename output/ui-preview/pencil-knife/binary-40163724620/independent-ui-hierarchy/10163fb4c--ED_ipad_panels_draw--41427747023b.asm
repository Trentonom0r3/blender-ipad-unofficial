
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163fb4c <__Z19ED_ipad_panels_drawP8bContextP8wmWindow>:
10163fb4c:     	stp	d15, d14, [sp, #-0xa0]!
10163fb50:     	stp	d13, d12, [sp, #0x10]
10163fb54:     	stp	d11, d10, [sp, #0x20]
10163fb58:     	stp	d9, d8, [sp, #0x30]
10163fb5c:     	stp	x28, x27, [sp, #0x40]
10163fb60:     	stp	x26, x25, [sp, #0x50]
10163fb64:     	stp	x24, x23, [sp, #0x60]
10163fb68:     	stp	x22, x21, [sp, #0x70]
10163fb6c:     	stp	x20, x19, [sp, #0x80]
10163fb70:     	stp	x29, x30, [sp, #0x90]
10163fb74:     	add	x29, sp, #0x90
10163fb78:     	sub	sp, sp, #0x300
10163fb7c:     	mov	x19, x1
10163fb80:     	mov	x20, x0
10163fb84:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
10163fb88:     	ldr	x8, [x8, #0x7f0]
10163fb8c:     	ldr	x8, [x8]
10163fb90:     	stur	x8, [x29, #-0xa8]
10163fb94:     	mov	x0, x1
10163fb98:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
10163fb9c:     	cbz	x0, 0x1016407e4 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc98>
10163fba0:     	adrp	x8, 0x106d88000 <_build_commit_date>
10163fba4:     	add	x8, x8, #0x28
10163fba8:     	ldrb	w8, [x8, #0xc21]
10163fbac:     	tbnz	w8, #0x0, 0x1016407e4 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc98>
10163fbb0:     	mov	x21, x0
10163fbb4:     	ldrb	w8, [x0, #0x1ee]
10163fbb8:     	cbnz	w8, 0x1016407e4 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc98>
10163fbbc:     	ldrb	w8, [x21, #0x1ef]
10163fbc0:     	cbnz	w8, 0x1016407e4 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc98>
10163fbc4:     	mov	x8, sp
10163fbc8:     	mov	x0, x20
10163fbcc:     	mov	x1, x19
10163fbd0:     	bl	0x101633654 <__ZN12_GLOBAL__N_110make_modelEP8bContextP8wmWindow>
10163fbd4:     	ldrb	w8, [sp, #0x1c6]
10163fbd8:     	cmp	w8, #0x1
10163fbdc:     	b.ne	0x10163fbec <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xa0>
10163fbe0:     	strb	w8, [x21, #0x1f1]
10163fbe4:     	mov	x0, x19
10163fbe8:     	bl	0x100b596a8 <__Z22WM_event_add_mousemoveP8wmWindow>
10163fbec:     	mov	w0, #0x1                ; =1
10163fbf0:     	bl	0x100a61d38 <__Z9GPU_blend9eGPUBlend>
10163fbf4:     	add	x27, sp, #0x1e0
10163fbf8:     	ldp	x8, x9, [sp, #0x20]
10163fbfc:     	cmp	x8, x9
10163fc00:     	b.eq	0x10163fdb0 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x264>
10163fc04:     	mov	x10, sp
10163fc08:     	add	x23, x10, #0x174
10163fc0c:     	ldr	w10, [sp, #0x80]
10163fc10:     	mov	x11, x8
10163fc14:     	ldr	w12, [x11]
10163fc18:     	cmp	w12, w10
10163fc1c:     	b.eq	0x10163fc30 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xe4>
10163fc20:     	add	x11, x11, #0x48
10163fc24:     	cmp	x11, x9
10163fc28:     	b.ne	0x10163fc14 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc8>
10163fc2c:     	b	0x10163fcd4 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x188>
10163fc30:     	ldr	q0, [x23]
10163fc34:     	str	q0, [sp, #0x230]
10163fc38:     	adrp	x1, 0x104b94000 <_zlibVersion+0x104b94000>
10163fc3c:     	add	x1, x1, #0x314
10163fc40:     	add	x0, sp, #0x230
10163fc44:     	mov	w2, #0x0                ; =0
10163fc48:     	mov	w3, #0x0                ; =0
10163fc4c:     	bl	0x1016408dc <__ZN12_GLOBAL__N_18draw_boxERKN7blender2ed4ipad6panels4RectEPKcbb>
10163fc50:     	adrp	x22, 0x106d88000 <_build_commit_date>
10163fc54:     	add	x22, x22, #0xe08
10163fc58:     	mov	w8, #0x2654             ; =9812
10163fc5c:     	ldr	d0, [x22, x8]
10163fc60:     	ldp	d1, d2, [x23]
10163fc64:     	add.2s	v1, v1, v2
10163fc68:     	scvtf.2s	v1, v1
10163fc6c:     	movi.2s	v2, #0x3f, lsl #24
10163fc70:     	fmul.2s	v1, v1, v2
10163fc74:     	adrp	x8, 0x10519a000 <__ZTSN9Freestyle12IteratorBaseINS_18ViewVertexInternal20edge_nonconst_traitsENS_23InputIteratorTag_TraitsEEE+0x3e>
10163fc78:     	ldr	d2, [x8, #0x450]
10163fc7c:     	fmul.2s	v0, v2, v0[0]
10163fc80:     	fsub.2s	v2, v1, v0
10163fc84:     	str	s2, [sp, #0x1e0]
10163fc88:     	fadd.2s	v0, v1, v0
10163fc8c:     	add	x8, sp, #0x1e0
10163fc90:     	add	x8, x8, #0xc
10163fc94:     	st1.s	{ v0 }[1], [x8]
10163fc98:     	mov.s	v0[1], v2[1]
10163fc9c:     	stur	d0, [x27, #0x4]
10163fca0:     	add	x1, sp, #0x1c8
10163fca4:     	mov	w0, #0xb                ; =11
10163fca8:     	bl	0x101fab464 <__Z19UI_GetThemeColor4fviPf>
10163fcac:     	mov	w8, #0x6666             ; =26214
10163fcb0:     	movk	w8, #0x3ee6, lsl #16
10163fcb4:     	str	w8, [sp, #0x1d4]
10163fcb8:     	ldr	s0, [x22, #0x2654]
10163fcbc:     	fadd	s0, s0, s0
10163fcc0:     	add	x0, sp, #0x1e0
10163fcc4:     	add	x2, sp, #0x1c8
10163fcc8:     	mov	w1, #0x1                ; =1
10163fccc:     	bl	0x101f277f0 <__Z20UI_draw_roundbox_4fvPK4rctfbfPKf>
10163fcd0:     	ldp	x8, x9, [sp, #0x20]
10163fcd4:     	cmp	x8, x9
10163fcd8:     	b.eq	0x10163fdb0 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x264>
10163fcdc:     	ldr	w10, [sp, #0x88]
10163fce0:     	ldr	w11, [x8]
10163fce4:     	cmp	w11, w10
10163fce8:     	b.eq	0x10163fcfc <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x1b0>
10163fcec:     	add	x8, x8, #0x48
10163fcf0:     	cmp	x8, x9
10163fcf4:     	b.ne	0x10163fce0 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x194>
10163fcf8:     	b	0x10163fdb0 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x264>
10163fcfc:     	mov	x8, sp
10163fd00:     	add	x8, x8, #0x184
10163fd04:     	ldr	q0, [x8]
10163fd08:     	str	q0, [sp, #0x230]
10163fd0c:     	adrp	x1, 0x104b94000 <_zlibVersion+0x104b94000>
10163fd10:     	add	x1, x1, #0x314
10163fd14:     	add	x0, sp, #0x230
10163fd18:     	mov	w2, #0x0                ; =0
10163fd1c:     	mov	w3, #0x0                ; =0
10163fd20:     	bl	0x1016408dc <__ZN12_GLOBAL__N_18draw_boxERKN7blender2ed4ipad6panels4RectEPKcbb>
10163fd24:     	ldr	w8, [sp, #0x184]
10163fd28:     	ldr	w9, [sp, #0x18c]
10163fd2c:     	add	w8, w9, w8
10163fd30:     	scvtf	s0, w8, #0x1
10163fd34:     	ldr	s1, [sp, #0x190]
10163fd38:     	scvtf	s1, s1
10163fd3c:     	adrp	x22, 0x106d88000 <_build_commit_date>
10163fd40:     	add	x22, x22, #0xe08
10163fd44:     	ldr	s2, [x22, #0x2654]
10163fd48:     	fmov	s3, #-6.00000000
10163fd4c:     	fmul	s3, s2, s3
10163fd50:     	fadd	s1, s1, s3
10163fd54:     	fmov	s3, #18.00000000
10163fd58:     	fmul	s3, s2, s3
10163fd5c:     	fadd	s2, s2, s2
10163fd60:     	fsub	s4, s0, s3
10163fd64:     	fadd	s0, s0, s3
10163fd68:     	str	s4, [sp, #0x1e0]
10163fd6c:     	str	s0, [sp, #0x1e4]
10163fd70:     	fsub	s0, s1, s2
10163fd74:     	fadd	s1, s1, s2
10163fd78:     	str	s0, [sp, #0x1e8]
10163fd7c:     	str	s1, [sp, #0x1ec]
10163fd80:     	add	x1, sp, #0x1c8
10163fd84:     	mov	w0, #0xb                ; =11
10163fd88:     	bl	0x101fab464 <__Z19UI_GetThemeColor4fviPf>
10163fd8c:     	mov	w8, #0x6666             ; =26214
10163fd90:     	movk	w8, #0x3ee6, lsl #16
10163fd94:     	str	w8, [sp, #0x1d4]
10163fd98:     	ldr	s0, [x22, #0x2654]
10163fd9c:     	fadd	s0, s0, s0
10163fda0:     	add	x0, sp, #0x1e0
10163fda4:     	add	x2, sp, #0x1c8
10163fda8:     	mov	w1, #0x1                ; =1
10163fdac:     	bl	0x101f277f0 <__Z20UI_draw_roundbox_4fvPK4rctfbfPKf>
10163fdb0:     	add	x8, sp, #0x1c8
10163fdb4:     	mov	x0, sp
10163fdb8:     	mov	x1, x21
10163fdbc:     	bl	0x101634d0c <__ZN12_GLOBAL__N_17buttonsERKNS_5ModelEPK7bScreen>
10163fdc0:     	ldp	x22, x25, [sp, #0x1c8]
10163fdc4:     	cmp	x22, x25
10163fdc8:     	b.eq	0x1016402e4 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x798>
10163fdcc:     	adrp	x23, 0x104b94000 <_zlibVersion+0x104b94000>
10163fdd0:     	add	x23, x23, #0x314
10163fdd4:     	adrp	x24, 0x106d88000 <_build_commit_date>
10163fdd8:     	add	x24, x24, #0xe08
10163fddc:     	add	x26, sp, #0x230
10163fde0:     	fmov	s8, #-6.00000000
10163fde4:     	fmov	s9, wzr
10163fde8:     	fmov	s10, #6.00000000
10163fdec:     	mov	w28, #0x10              ; =16
10163fdf0:     	fmov	s11, #16.00000000
10163fdf4:     	fmov	s12, #0.50000000
10163fdf8:     	movi.2s	v13, #0x3f, lsl #24
10163fdfc:     	b	0x10163fe1c <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x2d0>
10163fe00:     	mov	w3, #0x0                ; =0
10163fe04:     	ldrb	w2, [x22, #0x34]
10163fe08:     	mov	x0, x22
10163fe0c:     	bl	0x1016408dc <__ZN12_GLOBAL__N_18draw_boxERKN7blender2ed4ipad6panels4RectEPKcbb>
10163fe10:     	add	x22, x22, #0x38
10163fe14:     	cmp	x22, x25
10163fe18:     	b.eq	0x1016402e4 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x798>
10163fe1c:     	ldrb	w8, [x22, #0x35]
10163fe20:     	tbnz	w8, #0x0, 0x10163fe10 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x2c4>
10163fe24:     	ldr	w8, [x22, #0x28]
10163fe28:     	cmp	w8, #0x4
10163fe2c:     	b.eq	0x10163ffc4 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x478>
10163fe30:     	cmp	w8, #0x5
10163fe34:     	b.eq	0x10163ff10 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x3c4>
10163fe38:     	cmp	w8, #0x6
10163fe3c:     	b.ne	0x101640274 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x728>
10163fe40:     	ldr	x8, [x19, #0xf0]
10163fe44:     	cbz	x8, 0x10163fe70 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x324>
10163fe48:     	ldr	w9, [x8, #0x14]
10163fe4c:     	ldr	w10, [x22]
10163fe50:     	ldr	w11, [x22, #0x8]
10163fe54:     	cmp	w9, w10
10163fe58:     	ccmp	w9, w11, #0x0, ge
10163fe5c:     	b.ge	0x10163fe70 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x324>
10163fe60:     	ldr	w8, [x8, #0x18]
10163fe64:     	ldr	w9, [x22, #0x4]
10163fe68:     	cmp	w8, w9
10163fe6c:     	b.ge	0x1016402c4 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x778>
10163fe70:     	mov	w3, #0x0                ; =0
10163fe74:     	mov	x0, x22
10163fe78:     	mov	x1, x23
10163fe7c:     	mov	w2, #0x0                ; =0
10163fe80:     	bl	0x1016408dc <__ZN12_GLOBAL__N_18draw_boxERKN7blender2ed4ipad6panels4RectEPKcbb>
10163fe84:     	ldr	w8, [x22, #0x2c]
10163fe88:     	cmp	w8, #0x0
10163fe8c:     	mov	w8, #0x2654             ; =9812
10163fe90:     	ldr	d0, [x24, x8]
10163fe94:     	cset	w8, eq
10163fe98:     	ldp	d1, d2, [x22]
10163fe9c:     	add.2s	v1, v2, v1
10163fea0:     	scvtf.2s	v1, v1
10163fea4:     	fmul.2s	v1, v1, v13
10163fea8:     	dup.2s	v2, w8
10163feac:     	shl.2s	v2, v2, #0x1f
10163feb0:     	cmlt.2s	v2, v2, #0
10163feb4:     	adrp	x8, 0x10519a000 <__ZTSN9Freestyle12IteratorBaseINS_18ViewVertexInternal20edge_nonconst_traitsENS_23InputIteratorTag_TraitsEEE+0x3e>
10163feb8:     	ldr	d3, [x8, #0x458]
10163febc:     	adrp	x8, 0x10519a000 <__ZTSN9Freestyle12IteratorBaseINS_18ViewVertexInternal20edge_nonconst_traitsENS_23InputIteratorTag_TraitsEEE+0x3e>
10163fec0:     	ldr	d4, [x8, #0x460]
10163fec4:     	bsl.8b	v2, v4, v3
10163fec8:     	fmul.2s	v0, v2, v0[0]
10163fecc:     	fsub.2s	v2, v1, v0
10163fed0:     	str	s2, [sp, #0x230]
10163fed4:     	fadd.2s	v0, v1, v0
10163fed8:     	add	x8, x26, #0xc
10163fedc:     	st1.s	{ v0 }[1], [x8]
10163fee0:     	mov.s	v0[1], v2[1]
10163fee4:     	stur	d0, [x27, #0x54]
10163fee8:     	add	x1, sp, #0x1e0
10163feec:     	mov	w0, #0xb                ; =11
10163fef0:     	bl	0x101fab464 <__Z19UI_GetThemeColor4fviPf>
10163fef4:     	ldr	s0, [x24, #0x2654]
10163fef8:     	fadd	s0, s0, s0
10163fefc:     	add	x0, sp, #0x230
10163ff00:     	add	x2, sp, #0x1e0
10163ff04:     	mov	w1, #0x1                ; =1
10163ff08:     	bl	0x101f277f0 <__Z20UI_draw_roundbox_4fvPK4rctfbfPKf>
10163ff0c:     	b	0x10163fe10 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x2c4>
10163ff10:     	ldrb	w8, [x22, #0x34]
10163ff14:     	cmp	w8, #0x0
10163ff18:     	cinc	w0, w28, eq
10163ff1c:     	add	x1, sp, #0x230
10163ff20:     	bl	0x101fab464 <__Z19UI_GetThemeColor4fviPf>
10163ff24:     	ldr	s0, [x22]
10163ff28:     	scvtf	s0, s0
10163ff2c:     	ldp	s1, s2, [x22, #0x8]
10163ff30:     	scvtf	s1, s1
10163ff34:     	str	s0, [sp, #0x1e0]
10163ff38:     	str	s1, [sp, #0x1e4]
10163ff3c:     	ldr	s0, [x22, #0x4]
10163ff40:     	scvtf	s0, s0
10163ff44:     	scvtf	s1, s2
10163ff48:     	str	s0, [sp, #0x1e8]
10163ff4c:     	str	s1, [sp, #0x1ec]
10163ff50:     	mov	w0, #0xf                ; =15
10163ff54:     	bl	0x101f274c4 <__Z27UI_draw_roundbox_corner_seti>
10163ff58:     	ldr	w8, [x22, #0x8]
10163ff5c:     	ldr	w9, [x22]
10163ff60:     	sub	w8, w8, w9
10163ff64:     	bic	w8, w8, w8, asr #31
10163ff68:     	ucvtf	s0, w8, #0x1
10163ff6c:     	add	x0, sp, #0x1e0
10163ff70:     	add	x2, sp, #0x230
10163ff74:     	mov	w1, #0x1                ; =1
10163ff78:     	bl	0x101f277f0 <__Z20UI_draw_roundbox_4fvPK4rctfbfPKf>
10163ff7c:     	ldp	w8, w9, [x22]
10163ff80:     	ldp	w10, w11, [x22, #0x8]
10163ff84:     	add	w8, w10, w8
10163ff88:     	scvtf	s0, w8
10163ff8c:     	ldr	s1, [x24, #0x2654]
10163ff90:     	fmul	s1, s1, s11
10163ff94:     	fsub	s0, s0, s1
10163ff98:     	add	w8, w11, w9
10163ff9c:     	scvtf	s2, w8
10163ffa0:     	fmul	s0, s0, s12
10163ffa4:     	fsub	s1, s2, s1
10163ffa8:     	fmul	s1, s1, s12
10163ffac:     	ldrb	w8, [x22, #0x34]
10163ffb0:     	cmp	w8, #0x0
10163ffb4:     	mov	w8, #0x15               ; =21
10163ffb8:     	cinc	w0, w8, ne
10163ffbc:     	bl	0x101f51948 <__Z12UI_icon_drawffi>
10163ffc0:     	b	0x10163fe10 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x2c4>
10163ffc4:     	ldr	w8, [x22, #0x30]
10163ffc8:     	cmp	w8, #0x1
10163ffcc:     	b.ne	0x10163fe10 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x2c4>
10163ffd0:     	ldr	x8, [x19, #0xf0]
10163ffd4:     	cbz	x8, 0x101640000 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x4b4>
10163ffd8:     	ldr	w9, [x8, #0x14]
10163ffdc:     	ldr	w10, [x22]
10163ffe0:     	ldr	w11, [x22, #0x8]
10163ffe4:     	cmp	w9, w10
10163ffe8:     	ccmp	w9, w11, #0x0, ge
10163ffec:     	b.ge	0x101640000 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x4b4>
10163fff0:     	ldr	w8, [x8, #0x18]
10163fff4:     	ldr	w9, [x22, #0x4]
10163fff8:     	cmp	w8, w9
10163fffc:     	b.ge	0x1016402d4 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x788>
101640000:     	mov	w3, #0x0                ; =0
101640004:     	mov	x0, x22
101640008:     	mov	x1, x23
10164000c:     	mov	w2, #0x0                ; =0
101640010:     	bl	0x1016408dc <__ZN12_GLOBAL__N_18draw_boxERKN7blender2ed4ipad6panels4RectEPKcbb>
101640014:     	mov	x26, x24
101640018:     	ldp	w27, w28, [x22]
10164001c:     	ldp	w23, w24, [x22, #0x8]
101640020:     	add	x1, sp, #0x230
101640024:     	mov	w0, #0xb                ; =11
101640028:     	bl	0x101fab464 <__Z19UI_GetThemeColor4fviPf>
10164002c:     	add	w8, w23, w27
101640030:     	scvtf	s15, w8, #0x1
101640034:     	add	w8, w24, w28
101640038:     	scvtf	s14, w8, #0x1
10164003c:     	mov	x24, x26
101640040:     	ldr	s0, [x26, #0x2654]
101640044:     	ldp	w8, w9, [x22, #0x8]
101640048:     	ldp	w10, w11, [x22]
10164004c:     	sub	w12, w8, w10
101640050:     	bic	w12, w12, w12, asr #31
101640054:     	ucvtf	s1, w12, #0x3
101640058:     	sub	w12, w9, w11
10164005c:     	bic	w12, w12, w12, asr #31
101640060:     	ucvtf	s2, w12, #0x3
101640064:     	fadd	s3, s0, s0
101640068:     	fcmp	s1, s3
10164006c:     	fcsel	s1, s1, s3, mi
101640070:     	fmul	s3, s0, s8
101640074:     	fcmp	s2, s1
101640078:     	fcsel	s0, s2, s1, mi
10164007c:     	fadd	s1, s15, s3
101640080:     	scvtf	s2, w10
101640084:     	fadd	s2, s0, s2
101640088:     	scvtf	s4, w8
10164008c:     	fsub	s4, s4, s0
101640090:     	fcmp	s4, s1
101640094:     	fcsel	s4, s4, s1, mi
101640098:     	fcmp	s1, s2
10164009c:     	fcsel	s1, s2, s4, mi
1016400a0:     	fadd	s2, s14, s3
1016400a4:     	scvtf	s3, w11
1016400a8:     	fadd	s3, s0, s3
1016400ac:     	scvtf	s4, w9
1016400b0:     	fsub	s4, s4, s0
1016400b4:     	fcmp	s4, s2
1016400b8:     	fcsel	s4, s4, s2, mi
1016400bc:     	fcmp	s2, s3
1016400c0:     	fcsel	s2, s3, s4, mi
1016400c4:     	fsub	s3, s1, s0
1016400c8:     	fadd	s1, s0, s1
1016400cc:     	str	s3, [sp, #0x1e0]
1016400d0:     	str	s1, [sp, #0x1e4]
1016400d4:     	fsub	s1, s2, s0
1016400d8:     	fadd	s2, s0, s2
1016400dc:     	str	s1, [sp, #0x1e8]
1016400e0:     	str	s2, [sp, #0x1ec]
1016400e4:     	add	x0, sp, #0x1e0
1016400e8:     	add	x2, sp, #0x230
1016400ec:     	mov	w1, #0x1                ; =1
1016400f0:     	bl	0x101f277f0 <__Z20UI_draw_roundbox_4fvPK4rctfbfPKf>
1016400f4:     	ldr	s0, [x24, #0x2654]
1016400f8:     	ldp	w8, w9, [x22, #0x8]
1016400fc:     	ldp	w10, w11, [x22]
101640100:     	sub	w12, w8, w10
101640104:     	bic	w12, w12, w12, asr #31
101640108:     	ucvtf	s1, w12, #0x3
10164010c:     	sub	w12, w9, w11
101640110:     	bic	w12, w12, w12, asr #31
101640114:     	ucvtf	s2, w12, #0x3
101640118:     	fadd	s3, s0, s0
10164011c:     	fcmp	s1, s3
101640120:     	fcsel	s1, s1, s3, mi
101640124:     	fmul	s3, s0, s9
101640128:     	fcmp	s2, s1
10164012c:     	fcsel	s0, s2, s1, mi
101640130:     	fadd	s1, s15, s3
101640134:     	scvtf	s2, w10
101640138:     	fadd	s2, s0, s2
10164013c:     	scvtf	s4, w8
101640140:     	fsub	s4, s4, s0
101640144:     	fcmp	s4, s1
101640148:     	fcsel	s4, s4, s1, mi
10164014c:     	fcmp	s1, s2
101640150:     	fcsel	s1, s2, s4, mi
101640154:     	fadd	s2, s14, s3
101640158:     	scvtf	s3, w11
10164015c:     	fadd	s3, s0, s3
101640160:     	scvtf	s4, w9
101640164:     	fsub	s4, s4, s0
101640168:     	fcmp	s4, s2
10164016c:     	fcsel	s4, s4, s2, mi
101640170:     	fcmp	s2, s3
101640174:     	fcsel	s2, s3, s4, mi
101640178:     	fsub	s3, s1, s0
10164017c:     	fadd	s1, s0, s1
101640180:     	str	s3, [sp, #0x1e0]
101640184:     	str	s1, [sp, #0x1e4]
101640188:     	fsub	s1, s2, s0
10164018c:     	fadd	s2, s0, s2
101640190:     	str	s1, [sp, #0x1e8]
101640194:     	str	s2, [sp, #0x1ec]
101640198:     	add	x0, sp, #0x1e0
10164019c:     	add	x2, sp, #0x230
1016401a0:     	mov	w1, #0x1                ; =1
1016401a4:     	bl	0x101f277f0 <__Z20UI_draw_roundbox_4fvPK4rctfbfPKf>
1016401a8:     	ldr	s0, [x24, #0x2654]
1016401ac:     	ldp	w8, w9, [x22, #0x8]
1016401b0:     	ldp	w10, w11, [x22]
1016401b4:     	sub	w12, w8, w10
1016401b8:     	bic	w12, w12, w12, asr #31
1016401bc:     	ucvtf	s1, w12, #0x3
1016401c0:     	sub	w12, w9, w11
1016401c4:     	bic	w12, w12, w12, asr #31
1016401c8:     	ucvtf	s2, w12, #0x3
1016401cc:     	fadd	s3, s0, s0
1016401d0:     	fcmp	s1, s3
1016401d4:     	fcsel	s1, s1, s3, mi
1016401d8:     	fmul	s3, s0, s10
1016401dc:     	fcmp	s2, s1
1016401e0:     	fcsel	s0, s2, s1, mi
1016401e4:     	fadd	s1, s15, s3
1016401e8:     	scvtf	s2, w10
1016401ec:     	fadd	s2, s0, s2
1016401f0:     	scvtf	s4, w8
1016401f4:     	fsub	s4, s4, s0
1016401f8:     	fcmp	s4, s1
1016401fc:     	fcsel	s4, s4, s1, mi
101640200:     	fcmp	s1, s2
101640204:     	fcsel	s1, s2, s4, mi
101640208:     	fadd	s2, s14, s3
10164020c:     	scvtf	s3, w11
101640210:     	fadd	s3, s0, s3
101640214:     	scvtf	s4, w9
101640218:     	fsub	s4, s4, s0
10164021c:     	fcmp	s4, s2
101640220:     	fcsel	s4, s4, s2, mi
101640224:     	fcmp	s2, s3
101640228:     	fcsel	s2, s3, s4, mi
10164022c:     	fsub	s3, s1, s0
101640230:     	fadd	s1, s0, s1
101640234:     	str	s3, [sp, #0x1e0]
101640238:     	str	s1, [sp, #0x1e4]
10164023c:     	fsub	s1, s2, s0
101640240:     	fadd	s2, s0, s2
101640244:     	str	s1, [sp, #0x1e8]
101640248:     	str	s2, [sp, #0x1ec]
10164024c:     	add	x0, sp, #0x1e0
101640250:     	add	x2, sp, #0x230
101640254:     	mov	w1, #0x1                ; =1
101640258:     	bl	0x101f277f0 <__Z20UI_draw_roundbox_4fvPK4rctfbfPKf>
10164025c:     	add	x27, sp, #0x1e0
101640260:     	adrp	x23, 0x104b94000 <_zlibVersion+0x104b94000>
101640264:     	add	x23, x23, #0x314
101640268:     	add	x26, sp, #0x230
10164026c:     	mov	w28, #0x10              ; =16
101640270:     	b	0x10163fe10 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x2c4>
101640274:     	add	x1, x22, #0x10
101640278:     	ldrsb	w8, [x22, #0x27]
10164027c:     	tbz	w8, #0x1f, 0x101640284 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x738>
101640280:     	ldr	x1, [x1]
101640284:     	ldr	x8, [x19, #0xf0]
101640288:     	cbz	x8, 0x10163fe00 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x2b4>
10164028c:     	ldr	w9, [x8, #0x14]
101640290:     	ldr	w10, [x22]
101640294:     	ldr	w11, [x22, #0x8]
101640298:     	cmp	w9, w10
10164029c:     	ccmp	w9, w11, #0x0, ge
1016402a0:     	b.ge	0x10163fe00 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x2b4>
1016402a4:     	ldr	w8, [x8, #0x18]
1016402a8:     	ldr	w9, [x22, #0x4]
1016402ac:     	cmp	w8, w9
1016402b0:     	b.lt	0x10163fe00 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x2b4>
1016402b4:     	ldr	w9, [x22, #0xc]
1016402b8:     	cmp	w8, w9
1016402bc:     	cset	w3, lt
1016402c0:     	b	0x10163fe04 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x2b8>
1016402c4:     	ldr	w9, [x22, #0xc]
1016402c8:     	cmp	w8, w9
1016402cc:     	cset	w3, lt
1016402d0:     	b	0x10163fe74 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x328>
1016402d4:     	ldr	w9, [x22, #0xc]
1016402d8:     	cmp	w8, w9
1016402dc:     	cset	w3, lt
1016402e0:     	b	0x101640004 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x4b8>
1016402e4:     	mov	w0, #0x0                ; =0
1016402e8:     	bl	0x100a61d38 <__Z9GPU_blend9eGPUBlend>
1016402ec:     	mov	x2, sp
1016402f0:     	mov	x0, x19
1016402f4:     	mov	x1, x21
1016402f8:     	bl	0x101637e90 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE>
1016402fc:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
101640300:     	ldr	x8, [x8, #0x9b0]
101640304:     	cbz	x8, 0x101640794 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc48>
101640308:     	fmov	d0, x8
10164030c:     	cnt.8b	v0, v0
101640310:     	uaddlv.8b	h0, v0
101640314:     	fmov	w9, s0
101640318:     	cmp	x9, #0x1
10164031c:     	b.hi	0x10164032c <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x7e0>
101640320:     	sub	x10, x8, #0x1
101640324:     	and	x10, x10, x19
101640328:     	b	0x101640340 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x7f4>
10164032c:     	mov	x10, x19
101640330:     	cmp	x8, x19
101640334:     	b.hi	0x101640340 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x7f4>
101640338:     	udiv	x10, x19, x8
10164033c:     	msub	x10, x10, x8, x19
101640340:     	adrp	x11, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
101640344:     	ldr	x11, [x11, #0x9a8]
101640348:     	ldr	x11, [x11, x10, lsl #3]
10164034c:     	cbz	x11, 0x101640794 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc48>
101640350:     	ldr	x22, [x11]
101640354:     	cbz	x22, 0x101640794 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc48>
101640358:     	sub	x11, x8, #0x1
10164035c:     	b	0x101640374 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x828>
101640360:     	ldr	x12, [x22, #0x10]
101640364:     	cmp	x12, x19
101640368:     	b.eq	0x1016403ac <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x860>
10164036c:     	ldr	x22, [x22]
101640370:     	cbz	x22, 0x101640794 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc48>
101640374:     	ldr	x12, [x22, #0x8]
101640378:     	cmp	x12, x19
10164037c:     	b.eq	0x101640360 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x814>
101640380:     	cmp	x9, #0x1
101640384:     	b.hi	0x101640390 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x844>
101640388:     	and	x12, x12, x11
10164038c:     	b	0x1016403a0 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x854>
101640390:     	cmp	x12, x8
101640394:     	b.lo	0x1016403a0 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x854>
101640398:     	udiv	x13, x12, x8
10164039c:     	msub	x12, x13, x8, x12
1016403a0:     	cmp	x12, x10
1016403a4:     	b.eq	0x10164036c <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x820>
1016403a8:     	b	0x101640794 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc48>
1016403ac:     	ldrb	w8, [x22, #0x20]
1016403b0:     	cmp	w8, #0x1
1016403b4:     	b.ne	0x101640794 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc48>
1016403b8:     	ldr	x8, [x22, #0x18]
1016403bc:     	ldrsw	x9, [x19, #0xc0]
1016403c0:     	ldr	x10, [sp, #0x18]
1016403c4:     	cmp	x8, x9
1016403c8:     	ccmp	x10, #0x0, #0x4, eq
1016403cc:     	b.eq	0x101640794 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc48>
1016403d0:     	stur	xzr, [x27, #0x8d]
1016403d4:     	movi.16b	v0, #0x0
1016403d8:     	stp	q0, q0, [sp, #0x250]
1016403dc:     	stp	q0, q0, [sp, #0x230]
1016403e0:     	stur	q0, [x27, #0x98]
1016403e4:     	stur	q0, [x27, #0xa8]
1016403e8:     	stur	q0, [x27, #0xb8]
1016403ec:     	stur	q0, [x27, #0xc8]
1016403f0:     	stur	q0, [x27, #0xd8]
1016403f4:     	stur	q0, [x27, #0xe8]
1016403f8:     	strh	wzr, [sp, #0x2d8]
1016403fc:     	add	x2, sp, #0x230
101640400:     	mov	x0, x20
101640404:     	mov	x1, x19
101640408:     	bl	0x10164c264 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE>
10164040c:     	tbz	w0, #0x0, 0x101640548 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x9fc>
101640410:     	mov	x25, #0x0               ; =0
101640414:     	mov	x8, sp
101640418:     	add	x9, x8, #0x124
10164041c:     	ldr	q0, [x9]
101640420:     	add	x9, x8, #0x114
101640424:     	ldr	q1, [x9]
101640428:     	stp	q0, q1, [sp, #0x1e0]
10164042c:     	add	x9, x8, #0x134
101640430:     	ldr	q0, [x9]
101640434:     	add	x9, x8, #0x154
101640438:     	ldr	q1, [x9]
10164043c:     	stp	q0, q1, [sp, #0x200]
101640440:     	add	x8, x8, #0x164
101640444:     	ldr	q0, [x8]
101640448:     	str	q0, [sp, #0x220]
10164044c:     	add	x26, sp, #0x1e0
101640450:     	b	0x10164046c <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x920>
101640454:     	stp	x23, x24, [x9]
101640458:     	add	x23, x9, #0x10
10164045c:     	str	x23, [sp, #0x2c8]
101640460:     	add	x25, x25, #0x10
101640464:     	cmp	x25, #0x50
101640468:     	b.eq	0x10164055c <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xa10>
10164046c:     	add	x10, x26, x25
101640470:     	ldr	w9, [x10, #0x8]
101640474:     	ldr	w8, [x10]
101640478:     	cmp	w9, w8
10164047c:     	b.le	0x101640460 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x914>
101640480:     	ldr	w11, [x10, #0xc]
101640484:     	ldr	w10, [x10, #0x4]
101640488:     	cmp	w11, w10
10164048c:     	b.le	0x101640460 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x914>
101640490:     	sub	w9, w9, #0x1
101640494:     	sub	w11, w11, #0x1
101640498:     	orr	x23, x8, x9, lsl #32
10164049c:     	orr	x24, x10, x11, lsl #32
1016404a0:     	ldr	x9, [sp, #0x2c8]
1016404a4:     	ldr	x8, [sp, #0x2d0]
1016404a8:     	cmp	x9, x8
1016404ac:     	b.lo	0x101640454 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x908>
1016404b0:     	ldr	x19, [sp, #0x2c0]
1016404b4:     	sub	x20, x9, x19
1016404b8:     	asr	x27, x20, #4
1016404bc:     	add	x9, x27, #0x1
1016404c0:     	lsr	x10, x9, #60
1016404c4:     	cbnz	x10, 0x101640830 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xce4>
1016404c8:     	sub	x8, x8, x19
1016404cc:     	asr	x10, x8, #3
1016404d0:     	cmp	x10, x9
1016404d4:     	csel	x9, x10, x9, hi
1016404d8:     	mov	x10, #0x7ffffffffffffff0 ; =9223372036854775792
1016404dc:     	cmp	x8, x10
1016404e0:     	mov	x8, #0xfffffffffffffff  ; =1152921504606846975
1016404e4:     	csel	x28, x9, x8, lo
1016404e8:     	cbz	x28, 0x101640504 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x9b8>
1016404ec:     	lsr	x8, x28, #60
1016404f0:     	cbnz	x8, 0x101640840 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xcf4>
1016404f4:     	lsl	x0, x28, #4
1016404f8:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
1016404fc:     	mov	x21, x0
101640500:     	b	0x101640508 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x9bc>
101640504:     	mov	x21, #0x0               ; =0
101640508:     	add	x8, x21, x27, lsl #4
10164050c:     	add	x27, x21, x28, lsl #4
101640510:     	stp	x23, x24, [x8]
101640514:     	add	x23, x8, #0x10
101640518:     	mov	x0, x21
10164051c:     	mov	x1, x19
101640520:     	mov	x2, x20
101640524:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
101640528:     	str	x21, [sp, #0x2c0]
10164052c:     	str	x23, [sp, #0x2c8]
101640530:     	str	x27, [sp, #0x2d0]
101640534:     	cbz	x19, 0x101640540 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x9f4>
101640538:     	mov	x0, x19
10164053c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101640540:     	add	x27, sp, #0x1e0
101640544:     	b	0x10164045c <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0x910>
101640548:     	ldr	x0, [sp, #0x2c0]
10164054c:     	cbz	x0, 0x101640764 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc18>
101640550:     	str	x0, [sp, #0x2c8]
101640554:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101640558:     	b	0x101640764 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc18>
10164055c:     	ldp	x25, x26, [sp, #0x1c8]
101640560:     	b	0x101640574 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xa28>
101640564:     	stp	x23, x24, [x9]
101640568:     	add	x23, x9, #0x10
10164056c:     	str	x23, [sp, #0x2c8]
101640570:     	add	x25, x25, #0x38
101640574:     	cmp	x25, x26
101640578:     	b.eq	0x101640654 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xb08>
10164057c:     	ldr	w9, [x25, #0x8]
101640580:     	ldr	w8, [x25]
101640584:     	cmp	w9, w8
101640588:     	b.le	0x101640570 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xa24>
10164058c:     	ldr	w11, [x25, #0xc]
101640590:     	ldr	w10, [x25, #0x4]
101640594:     	cmp	w11, w10
101640598:     	b.le	0x101640570 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xa24>
10164059c:     	sub	w9, w9, #0x1
1016405a0:     	sub	w11, w11, #0x1
1016405a4:     	orr	x23, x8, x9, lsl #32
1016405a8:     	orr	x24, x10, x11, lsl #32
1016405ac:     	ldr	x9, [sp, #0x2c8]
1016405b0:     	ldr	x8, [sp, #0x2d0]
1016405b4:     	cmp	x9, x8
1016405b8:     	b.lo	0x101640564 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xa18>
1016405bc:     	ldr	x19, [sp, #0x2c0]
1016405c0:     	sub	x20, x9, x19
1016405c4:     	asr	x27, x20, #4
1016405c8:     	add	x9, x27, #0x1
1016405cc:     	lsr	x10, x9, #60
1016405d0:     	cbnz	x10, 0x101640848 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xcfc>
1016405d4:     	sub	x8, x8, x19
1016405d8:     	asr	x10, x8, #3
1016405dc:     	cmp	x10, x9
1016405e0:     	csel	x9, x10, x9, hi
1016405e4:     	mov	x10, #0x7ffffffffffffff0 ; =9223372036854775792
1016405e8:     	cmp	x8, x10
1016405ec:     	mov	x8, #0xfffffffffffffff  ; =1152921504606846975
1016405f0:     	csel	x28, x9, x8, lo
1016405f4:     	cbz	x28, 0x101640610 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xac4>
1016405f8:     	lsr	x8, x28, #60
1016405fc:     	cbnz	x8, 0x101640858 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd0c>
101640600:     	lsl	x0, x28, #4
101640604:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
101640608:     	mov	x21, x0
10164060c:     	b	0x101640614 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xac8>
101640610:     	mov	x21, #0x0               ; =0
101640614:     	add	x8, x21, x27, lsl #4
101640618:     	add	x27, x21, x28, lsl #4
10164061c:     	stp	x23, x24, [x8]
101640620:     	add	x23, x8, #0x10
101640624:     	mov	x0, x21
101640628:     	mov	x1, x19
10164062c:     	mov	x2, x20
101640630:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
101640634:     	str	x21, [sp, #0x2c0]
101640638:     	str	x23, [sp, #0x2c8]
10164063c:     	str	x27, [sp, #0x2d0]
101640640:     	cbz	x19, 0x10164064c <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xb00>
101640644:     	mov	x0, x19
101640648:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10164064c:     	add	x27, sp, #0x1e0
101640650:     	b	0x10164056c <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xa20>
101640654:     	mov	w8, #0x1                ; =1
101640658:     	strb	w8, [sp, #0x2d8]
10164065c:     	ldur	x8, [x27, #0x8d]
101640660:     	mov	x19, x22
101640664:     	ldr	x0, [x19, #0x70]!
101640668:     	ldp	q1, q0, [sp, #0x250]
10164066c:     	ldp	q3, q2, [sp, #0x230]
101640670:     	stur	q2, [x19, #-0x38]
101640674:     	stur	q1, [x19, #-0x28]
101640678:     	stur	q0, [x19, #-0x18]
10164067c:     	stur	x8, [x19, #-0xb]
101640680:     	stur	q3, [x19, #-0x48]
101640684:     	cbz	x0, 0x101640698 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xb4c>
101640688:     	str	x0, [x22, #0x78]
10164068c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101640690:     	stp	xzr, xzr, [x19]
101640694:     	str	xzr, [x19, #0x10]
101640698:     	ldur	q0, [x27, #0x98]
10164069c:     	mov	x20, x22
1016406a0:     	ldr	x0, [x20, #0x88]!
1016406a4:     	stur	q0, [x20, #-0x18]
1016406a8:     	ldr	x8, [sp, #0x288]
1016406ac:     	stur	x8, [x20, #-0x8]
1016406b0:     	add	x8, sp, #0x230
1016406b4:     	stp	xzr, xzr, [x8, #0x50]
1016406b8:     	stur	xzr, [x8, #0x48]
1016406bc:     	add	x19, sp, #0x230
1016406c0:     	cbz	x0, 0x1016406d4 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xb88>
1016406c4:     	str	x0, [x22, #0x90]
1016406c8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
1016406cc:     	stp	xzr, xzr, [x20]
1016406d0:     	str	xzr, [x20, #0x10]
1016406d4:     	ldr	q0, [sp, #0x290]
1016406d8:     	mov	x20, x22
1016406dc:     	ldr	x0, [x20, #0xa0]!
1016406e0:     	stur	q0, [x20, #-0x18]
1016406e4:     	ldr	x8, [sp, #0x2a0]
1016406e8:     	stur	x8, [x20, #-0x8]
1016406ec:     	stp	xzr, xzr, [x19, #0x68]
1016406f0:     	stur	xzr, [x19, #0x60]
1016406f4:     	cbz	x0, 0x101640708 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xbbc>
1016406f8:     	str	x0, [x22, #0xa8]
1016406fc:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101640700:     	stp	xzr, xzr, [x20]
101640704:     	str	xzr, [x20, #0x10]
101640708:     	ldur	q0, [x27, #0xc8]
10164070c:     	mov	x19, x22
101640710:     	ldr	x0, [x19, #0xb8]!
101640714:     	stur	q0, [x19, #-0x18]
101640718:     	ldr	x8, [sp, #0x2b8]
10164071c:     	stur	x8, [x19, #-0x8]
101640720:     	str	xzr, [sp, #0x2b8]
101640724:     	str	xzr, [sp, #0x2b0]
101640728:     	str	xzr, [sp, #0x2a8]
10164072c:     	cbz	x0, 0x101640740 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xbf4>
101640730:     	str	x0, [x22, #0xc0]
101640734:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101640738:     	stp	xzr, xzr, [x19]
10164073c:     	str	xzr, [x19, #0x10]
101640740:     	ldr	q0, [sp, #0x2c0]
101640744:     	stur	q0, [x22, #0xb8]
101640748:     	ldr	x8, [sp, #0x2d0]
10164074c:     	str	x8, [x22, #0xc8]
101640750:     	add	x8, sp, #0x230
101640754:     	stp	xzr, xzr, [x8, #0x98]
101640758:     	stur	xzr, [x8, #0x90]
10164075c:     	ldrh	w8, [sp, #0x2d8]
101640760:     	strh	w8, [x22, #0xd0]
101640764:     	ldr	x0, [sp, #0x2a8]
101640768:     	cbz	x0, 0x101640774 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc28>
10164076c:     	str	x0, [sp, #0x2b0]
101640770:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101640774:     	ldr	x0, [sp, #0x290]
101640778:     	cbz	x0, 0x101640784 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc38>
10164077c:     	str	x0, [sp, #0x298]
101640780:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101640784:     	ldr	x0, [sp, #0x278]
101640788:     	cbz	x0, 0x101640794 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc48>
10164078c:     	str	x0, [sp, #0x280]
101640790:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101640794:     	ldr	x19, [sp, #0x1c8]
101640798:     	cbz	x19, 0x1016407dc <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc90>
10164079c:     	ldr	x20, [sp, #0x1d0]
1016407a0:     	mov	x0, x19
1016407a4:     	cmp	x20, x19
1016407a8:     	b.ne	0x1016407bc <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc70>
1016407ac:     	b	0x1016407d4 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc88>
1016407b0:     	sub	x20, x20, #0x38
1016407b4:     	cmp	x20, x19
1016407b8:     	b.eq	0x1016407d0 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc84>
1016407bc:     	ldursb	w8, [x20, #-0x11]
1016407c0:     	tbz	w8, #0x1f, 0x1016407b0 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc64>
1016407c4:     	ldur	x0, [x20, #-0x28]
1016407c8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
1016407cc:     	b	0x1016407b0 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xc64>
1016407d0:     	ldr	x0, [sp, #0x1c8]
1016407d4:     	str	x19, [sp, #0x1d0]
1016407d8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
1016407dc:     	mov	x0, sp
1016407e0:     	bl	0x101636124 <__ZN12_GLOBAL__N_15ModelD1Ev>
1016407e4:     	ldur	x8, [x29, #-0xa8]
1016407e8:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
1016407ec:     	ldr	x9, [x9, #0x7f0]
1016407f0:     	ldr	x9, [x9]
1016407f4:     	cmp	x9, x8
1016407f8:     	b.ne	0x10164082c <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xce0>
1016407fc:     	add	sp, sp, #0x300
101640800:     	ldp	x29, x30, [sp, #0x90]
101640804:     	ldp	x20, x19, [sp, #0x80]
101640808:     	ldp	x22, x21, [sp, #0x70]
10164080c:     	ldp	x24, x23, [sp, #0x60]
101640810:     	ldp	x26, x25, [sp, #0x50]
101640814:     	ldp	x28, x27, [sp, #0x40]
101640818:     	ldp	d9, d8, [sp, #0x30]
10164081c:     	ldp	d11, d10, [sp, #0x20]
101640820:     	ldp	d13, d12, [sp, #0x10]
101640824:     	ldp	d15, d14, [sp], #0xa0
101640828:     	ret
10164082c:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
101640830:     	add	x8, sp, #0x230
101640834:     	add	x0, x8, #0x90
101640838:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
10164083c:     	b	0x10164085c <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd10>
101640840:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
101640844:     	b	0x10164085c <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd10>
101640848:     	add	x8, sp, #0x230
10164084c:     	add	x0, x8, #0x90
101640850:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
101640854:     	b	0x10164085c <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd10>
101640858:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
10164085c:     	brk	#0x1
101640860:     	b	0x101640870 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd24>
101640864:     	b	0x101640870 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd24>
101640868:     	b	0x101640870 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd24>
10164086c:     	b	0x101640870 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd24>
101640870:     	mov	x19, x0
101640874:     	add	x0, sp, #0x230
101640878:     	bl	0x10164c0b8 <__ZN12_GLOBAL__N_126IPadKnifeHierarchySnapshotD1Ev>
10164087c:     	b	0x1016408c4 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd78>
101640880:     	mov	x19, x0
101640884:     	b	0x1016408cc <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd80>
101640888:     	mov	x19, x0
10164088c:     	b	0x1016408cc <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd80>
101640890:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
101640894:     	mov	x19, x0
101640898:     	b	0x1016408cc <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd80>
10164089c:     	b	0x1016408c0 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd74>
1016408a0:     	mov	x19, x0
1016408a4:     	b	0x1016408cc <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd80>
1016408a8:     	b	0x1016408c0 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd74>
1016408ac:     	b	0x1016408c0 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd74>
1016408b0:     	b	0x1016408c0 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd74>
1016408b4:     	b	0x1016408c0 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd74>
1016408b8:     	b	0x1016408c0 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd74>
1016408bc:     	b	0x1016408c0 <__Z19ED_ipad_panels_drawP8bContextP8wmWindow+0xd74>
1016408c0:     	mov	x19, x0
1016408c4:     	add	x0, sp, #0x1c8
1016408c8:     	bl	0x1016360b4 <__ZNSt3__16vectorIN12_GLOBAL__N_16ButtonENS_9allocatorIS2_EEED1B8ne190102Ev>
1016408cc:     	mov	x0, sp
1016408d0:     	bl	0x101636124 <__ZN12_GLOBAL__N_15ModelD1Ev>
1016408d4:     	mov	x0, x19
1016408d8:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
