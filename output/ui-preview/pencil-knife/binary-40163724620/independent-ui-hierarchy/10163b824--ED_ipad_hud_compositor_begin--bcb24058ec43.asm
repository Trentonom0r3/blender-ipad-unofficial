
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163b824 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow>:
10163b824:     	sub	sp, sp, #0xb0
10163b828:     	stp	x24, x23, [sp, #0x70]
10163b82c:     	stp	x22, x21, [sp, #0x80]
10163b830:     	stp	x20, x19, [sp, #0x90]
10163b834:     	stp	x29, x30, [sp, #0xa0]
10163b838:     	add	x29, sp, #0xa0
10163b83c:     	mov	x19, x1
10163b840:     	mov	x20, x0
10163b844:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163b848:     	cbz	x19, 0x10163c510 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xcec>
10163b84c:     	cbz	x0, 0x10163c510 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xcec>
10163b850:     	add	x0, x0, #0x1a0
10163b854:     	mov	x1, x19
10163b858:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163b85c:     	cmn	w0, #0x1
10163b860:     	b.eq	0x10163c510 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xcec>
10163b864:     	mov	x0, x20
10163b868:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163b86c:     	cbz	x0, 0x10163bc28 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x404>
10163b870:     	movi.16b	v0, #0x0
10163b874:     	stp	q0, q0, [sp, #0x40]
10163b878:     	mov	w8, #0x3f800000         ; =1065353216
10163b87c:     	str	w8, [sp, #0x60]
10163b880:     	stp	q0, q0, [sp, #0x10]
10163b884:     	str	w8, [sp, #0x30]
10163b888:     	ldr	x20, [x0, #0x1a0]
10163b88c:     	cbnz	x20, 0x10163b8c8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xa4>
10163b890:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163b894:     	ldr	x0, [x8, #0xa08]
10163b898:     	cbnz	x0, 0x10163b934 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x110>
10163b89c:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163b8a0:     	ldr	x0, [x8, #0x9e0]
10163b8a4:     	cbz	x0, 0x10163bbd8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x3b4>
10163b8a8:     	adrp	x20, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163b8ac:     	adrp	x21, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163b8b0:     	adrp	x22, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163b8b4:     	adrp	x23, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163b8b8:     	add	x23, x23, #0x9e0
10163b8bc:     	b	0x10163ba0c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x1e8>
10163b8c0:     	ldr	x20, [x20]
10163b8c4:     	cbz	x20, 0x10163b890 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x6c>
10163b8c8:     	str	x20, [sp, #0x8]
10163b8cc:     	add	x0, sp, #0x40
10163b8d0:     	add	x1, sp, #0x8
10163b8d4:     	add	x2, sp, #0x8
10163b8d8:     	bl	0x10164ba44 <__ZNSt3__112__hash_tableIyNS_4hashIyEENS_8equal_toIyEENS_9allocatorIyEEE25__emplace_unique_key_argsIyJRKyEEENS_4pairINS_15__hash_iteratorIPNS_11__hash_nodeIyPvEEEEbEERKT_DpOT0_>
10163b8dc:     	mov	x0, x20
10163b8e0:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
10163b8e4:     	cbz	x0, 0x10163b8c0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x9c>
10163b8e8:     	ldr	x21, [x0, #0x1c0]
10163b8ec:     	cbnz	x21, 0x10163b8fc <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xd8>
10163b8f0:     	b	0x10163b8c0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x9c>
10163b8f4:     	ldr	x21, [x21]
10163b8f8:     	cbz	x21, 0x10163b8c0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x9c>
10163b8fc:     	ldr	x22, [x21, #0x78]
10163b900:     	cbnz	x22, 0x10163b910 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xec>
10163b904:     	b	0x10163b8f4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xd0>
10163b908:     	ldr	x22, [x22]
10163b90c:     	cbz	x22, 0x10163b8f4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xd0>
10163b910:     	ldr	x1, [x22, #0x128]
10163b914:     	ldr	x8, [x1, #0xb0]!
10163b918:     	cbz	x8, 0x10163b908 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xe4>
10163b91c:     	add	x0, sp, #0x10
10163b920:     	mov	x2, x1
10163b924:     	bl	0x10164ba44 <__ZNSt3__112__hash_tableIyNS_4hashIyEENS_8equal_toIyEENS_9allocatorIyEEE25__emplace_unique_key_argsIyJRKyEEENS_4pairINS_15__hash_iteratorIPNS_11__hash_nodeIyPvEEEEbEERKT_DpOT0_>
10163b928:     	b	0x10163b908 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xe4>
10163b92c:     	bl	0x10164bd00 <__ZNSt3__112__hash_tableINS_17__hash_value_typeImN12_GLOBAL__N_112IPadHUDFrameEEENS_22__unordered_map_hasherImS4_NS_4hashImEENS_8equal_toImEELb1EEENS_21__unordered_map_equalImS4_S9_S7_Lb1EEENS_9allocatorIS4_EEE5eraseENS_21__hash_const_iteratorIPNS_11__hash_nodeIS4_PvEEEE>
10163b930:     	cbz	x0, 0x10163b89c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x78>
10163b934:     	ldr	x8, [sp, #0x48]
10163b938:     	cbz	x8, 0x10163b92c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x108>
10163b93c:     	ldr	x9, [x0, #0x10]
10163b940:     	fmov	d0, x8
10163b944:     	cnt.8b	v0, v0
10163b948:     	uaddlv.8b	h0, v0
10163b94c:     	fmov	w10, s0
10163b950:     	cmp	x10, #0x1
10163b954:     	b.hi	0x10163b964 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x140>
10163b958:     	sub	x11, x8, #0x1
10163b95c:     	and	x11, x11, x9
10163b960:     	b	0x10163b978 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x154>
10163b964:     	mov	x11, x9
10163b968:     	cmp	x9, x8
10163b96c:     	b.lo	0x10163b978 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x154>
10163b970:     	udiv	x11, x9, x8
10163b974:     	msub	x11, x11, x8, x9
10163b978:     	ldr	x12, [sp, #0x40]
10163b97c:     	ldr	x12, [x12, x11, lsl #3]
10163b980:     	cbz	x12, 0x10163b92c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x108>
10163b984:     	ldr	x12, [x12]
10163b988:     	cbz	x12, 0x10163b92c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x108>
10163b98c:     	sub	x13, x8, #0x1
10163b990:     	b	0x10163b9a8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x184>
10163b994:     	ldr	x14, [x12, #0x10]
10163b998:     	cmp	x14, x9
10163b99c:     	b.eq	0x10163b9e0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x1bc>
10163b9a0:     	ldr	x12, [x12]
10163b9a4:     	cbz	x12, 0x10163b92c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x108>
10163b9a8:     	ldr	x14, [x12, #0x8]
10163b9ac:     	cmp	x9, x14
10163b9b0:     	b.eq	0x10163b994 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x170>
10163b9b4:     	cmp	x10, #0x1
10163b9b8:     	b.hi	0x10163b9c4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x1a0>
10163b9bc:     	and	x14, x14, x13
10163b9c0:     	b	0x10163b9d4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x1b0>
10163b9c4:     	cmp	x14, x8
10163b9c8:     	b.lo	0x10163b9d4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x1b0>
10163b9cc:     	udiv	x15, x14, x8
10163b9d0:     	msub	x14, x15, x8, x14
10163b9d4:     	cmp	x14, x11
10163b9d8:     	b.eq	0x10163b9a0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x17c>
10163b9dc:     	b	0x10163b92c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x108>
10163b9e0:     	ldr	x0, [x0]
10163b9e4:     	cbnz	x0, 0x10163b934 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x110>
10163b9e8:     	b	0x10163b89c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x78>
10163b9ec:     	str	x14, [x10]
10163b9f0:     	str	xzr, [x0]
10163b9f4:     	ldr	x8, [x22, #0x9e8]
10163b9f8:     	sub	x8, x8, #0x1
10163b9fc:     	str	x8, [x22, #0x9e8]
10163ba00:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163ba04:     	mov	x0, x24
10163ba08:     	cbz	x24, 0x10163bbd8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x3b4>
10163ba0c:     	ldr	x8, [sp, #0x18]
10163ba10:     	cbz	x8, 0x10163bab4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x290>
10163ba14:     	ldr	x9, [x0, #0x10]
10163ba18:     	fmov	d0, x8
10163ba1c:     	cnt.8b	v0, v0
10163ba20:     	uaddlv.8b	h0, v0
10163ba24:     	fmov	w10, s0
10163ba28:     	cmp	x10, #0x1
10163ba2c:     	b.hi	0x10163ba3c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x218>
10163ba30:     	sub	x11, x8, #0x1
10163ba34:     	and	x11, x11, x9
10163ba38:     	b	0x10163ba50 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x22c>
10163ba3c:     	mov	x11, x9
10163ba40:     	cmp	x9, x8
10163ba44:     	b.lo	0x10163ba50 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x22c>
10163ba48:     	udiv	x11, x9, x8
10163ba4c:     	msub	x11, x11, x8, x9
10163ba50:     	ldr	x12, [sp, #0x10]
10163ba54:     	ldr	x12, [x12, x11, lsl #3]
10163ba58:     	cbz	x12, 0x10163bab4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x290>
10163ba5c:     	ldr	x12, [x12]
10163ba60:     	cbz	x12, 0x10163bab4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x290>
10163ba64:     	sub	x13, x8, #0x1
10163ba68:     	b	0x10163ba80 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x25c>
10163ba6c:     	ldr	x14, [x12, #0x10]
10163ba70:     	cmp	x14, x9
10163ba74:     	b.eq	0x10163bbd0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x3ac>
10163ba78:     	ldr	x12, [x12]
10163ba7c:     	cbz	x12, 0x10163bab4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x290>
10163ba80:     	ldr	x14, [x12, #0x8]
10163ba84:     	cmp	x9, x14
10163ba88:     	b.eq	0x10163ba6c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x248>
10163ba8c:     	cmp	x10, #0x1
10163ba90:     	b.hi	0x10163ba9c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x278>
10163ba94:     	and	x14, x14, x13
10163ba98:     	b	0x10163baac <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x288>
10163ba9c:     	cmp	x14, x8
10163baa0:     	b.lo	0x10163baac <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x288>
10163baa4:     	udiv	x15, x14, x8
10163baa8:     	msub	x14, x15, x8, x14
10163baac:     	cmp	x14, x11
10163bab0:     	b.eq	0x10163ba78 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x254>
10163bab4:     	ldr	x9, [x20, #0x9d8]
10163bab8:     	ldr	x8, [x0, #0x8]
10163babc:     	fmov	d0, x9
10163bac0:     	cnt.8b	v0, v0
10163bac4:     	uaddlv.8b	h0, v0
10163bac8:     	fmov	w11, s0
10163bacc:     	cmp	x11, #0x1
10163bad0:     	b.hi	0x10163bae0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x2bc>
10163bad4:     	sub	x10, x9, #0x1
10163bad8:     	and	x8, x10, x8
10163badc:     	b	0x10163baf0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x2cc>
10163bae0:     	cmp	x8, x9
10163bae4:     	b.lo	0x10163baf0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x2cc>
10163bae8:     	udiv	x10, x8, x9
10163baec:     	msub	x8, x10, x9, x8
10163baf0:     	ldr	x24, [x0]
10163baf4:     	ldr	x12, [x21, #0x9d0]
10163baf8:     	ldr	x13, [x12, x8, lsl #3]
10163bafc:     	mov	x10, x13
10163bb00:     	ldr	x13, [x13]
10163bb04:     	cmp	x13, x0
10163bb08:     	b.ne	0x10163bafc <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x2d8>
10163bb0c:     	cmp	x10, x23
10163bb10:     	b.eq	0x10163bb48 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x324>
10163bb14:     	ldr	x13, [x10, #0x8]
10163bb18:     	cmp	x11, #0x1
10163bb1c:     	b.hi	0x10163bb2c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x308>
10163bb20:     	sub	x14, x9, #0x1
10163bb24:     	and	x13, x13, x14
10163bb28:     	b	0x10163bb3c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x318>
10163bb2c:     	cmp	x13, x9
10163bb30:     	b.lo	0x10163bb3c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x318>
10163bb34:     	udiv	x14, x13, x9
10163bb38:     	msub	x13, x14, x9, x13
10163bb3c:     	mov	x14, x24
10163bb40:     	cmp	x13, x8
10163bb44:     	b.eq	0x10163bb8c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x368>
10163bb48:     	cbz	x24, 0x10163bb84 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x360>
10163bb4c:     	ldr	x13, [x24, #0x8]
10163bb50:     	cmp	x11, #0x1
10163bb54:     	b.hi	0x10163bb64 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x340>
10163bb58:     	sub	x14, x9, #0x1
10163bb5c:     	and	x15, x13, x14
10163bb60:     	b	0x10163bb78 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x354>
10163bb64:     	mov	x15, x13
10163bb68:     	cmp	x13, x9
10163bb6c:     	b.lo	0x10163bb78 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x354>
10163bb70:     	udiv	x14, x13, x9
10163bb74:     	msub	x15, x14, x9, x13
10163bb78:     	mov	x14, x24
10163bb7c:     	cmp	x15, x8
10163bb80:     	b.eq	0x10163bb94 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x370>
10163bb84:     	str	xzr, [x12, x8, lsl #3]
10163bb88:     	ldr	x14, [x0]
10163bb8c:     	cbz	x14, 0x10163b9ec <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x1c8>
10163bb90:     	ldr	x13, [x14, #0x8]
10163bb94:     	cmp	x11, #0x1
10163bb98:     	b.hi	0x10163bba8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x384>
10163bb9c:     	sub	x9, x9, #0x1
10163bba0:     	and	x13, x13, x9
10163bba4:     	b	0x10163bbb8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x394>
10163bba8:     	cmp	x13, x9
10163bbac:     	b.lo	0x10163bbb8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x394>
10163bbb0:     	udiv	x11, x13, x9
10163bbb4:     	msub	x13, x11, x9, x13
10163bbb8:     	cmp	x13, x8
10163bbbc:     	b.eq	0x10163b9ec <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x1c8>
10163bbc0:     	ldr	x8, [x21, #0x9d0]
10163bbc4:     	str	x10, [x8, x13, lsl #3]
10163bbc8:     	ldr	x14, [x0]
10163bbcc:     	b	0x10163b9ec <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x1c8>
10163bbd0:     	ldr	x0, [x0]
10163bbd4:     	cbnz	x0, 0x10163ba0c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x1e8>
10163bbd8:     	ldr	x0, [sp, #0x20]
10163bbdc:     	cbz	x0, 0x10163bbf0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x3cc>
10163bbe0:     	ldr	x20, [x0]
10163bbe4:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163bbe8:     	mov	x0, x20
10163bbec:     	cbnz	x20, 0x10163bbe0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x3bc>
10163bbf0:     	ldr	x0, [sp, #0x10]
10163bbf4:     	str	xzr, [sp, #0x10]
10163bbf8:     	cbz	x0, 0x10163bc00 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x3dc>
10163bbfc:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163bc00:     	ldr	x0, [sp, #0x50]
10163bc04:     	cbz	x0, 0x10163bc18 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x3f4>
10163bc08:     	ldr	x20, [x0]
10163bc0c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163bc10:     	mov	x0, x20
10163bc14:     	cbnz	x20, 0x10163bc08 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x3e4>
10163bc18:     	ldr	x0, [sp, #0x40]
10163bc1c:     	str	xzr, [sp, #0x40]
10163bc20:     	cbz	x0, 0x10163bc28 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x404>
10163bc24:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163bc28:     	adrp	x22, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163bc2c:     	ldr	x23, [x22, #0x9b0]
10163bc30:     	adrp	x21, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163bc34:     	cbz	x23, 0x10163bc5c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x438>
10163bc38:     	fmov	d0, x23
10163bc3c:     	cnt.8b	v0, v0
10163bc40:     	uaddlv.8b	h0, v0
10163bc44:     	fmov	w8, s0
10163bc48:     	cmp	x8, #0x1
10163bc4c:     	b.hi	0x10163bc60 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x43c>
10163bc50:     	sub	x9, x23, #0x1
10163bc54:     	and	x24, x9, x19
10163bc58:     	b	0x10163bc74 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x450>
10163bc5c:     	b	0x10163bcd8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x4b4>
10163bc60:     	mov	x24, x19
10163bc64:     	cmp	x23, x19
10163bc68:     	b.hi	0x10163bc74 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x450>
10163bc6c:     	udiv	x9, x19, x23
10163bc70:     	msub	x24, x9, x23, x19
10163bc74:     	ldr	x9, [x21, #0x9a8]
10163bc78:     	ldr	x9, [x9, x24, lsl #3]
10163bc7c:     	cbz	x9, 0x10163bcd8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x4b4>
10163bc80:     	ldr	x20, [x9]
10163bc84:     	cbz	x20, 0x10163bcd8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x4b4>
10163bc88:     	sub	x9, x23, #0x1
10163bc8c:     	b	0x10163bca4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x480>
10163bc90:     	ldr	x10, [x20, #0x10]
10163bc94:     	cmp	x10, x19
10163bc98:     	b.eq	0x10163c040 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x81c>
10163bc9c:     	ldr	x20, [x20]
10163bca0:     	cbz	x20, 0x10163bcd8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x4b4>
10163bca4:     	ldr	x10, [x20, #0x8]
10163bca8:     	cmp	x10, x19
10163bcac:     	b.eq	0x10163bc90 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x46c>
10163bcb0:     	cmp	x8, #0x1
10163bcb4:     	b.hi	0x10163bcc0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x49c>
10163bcb8:     	and	x10, x10, x9
10163bcbc:     	b	0x10163bcd0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x4ac>
10163bcc0:     	cmp	x10, x23
10163bcc4:     	b.lo	0x10163bcd0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x4ac>
10163bcc8:     	udiv	x11, x10, x23
10163bccc:     	msub	x10, x11, x23, x10
10163bcd0:     	cmp	x10, x24
10163bcd4:     	b.eq	0x10163bc9c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x478>
10163bcd8:     	mov	w0, #0x1a0              ; =416
10163bcdc:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10163bce0:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163bce4:     	add	x8, x8, #0x9b8
10163bce8:     	stp	x0, x8, [sp, #0x40]
10163bcec:     	stp	xzr, x19, [x0]
10163bcf0:     	str	x19, [x0, #0x10]
10163bcf4:     	movi.16b	v0, #0x0
10163bcf8:     	stur	q0, [x0, #0x28]
10163bcfc:     	stur	q0, [x0, #0x38]
10163bd00:     	stur	q0, [x0, #0x48]
10163bd04:     	stur	q0, [x0, #0x58]
10163bd08:     	stur	q0, [x0, #0x68]
10163bd0c:     	stur	q0, [x0, #0x78]
10163bd10:     	stur	q0, [x0, #0x88]
10163bd14:     	stur	q0, [x0, #0x98]
10163bd18:     	stur	q0, [x0, #0xa8]
10163bd1c:     	stur	q0, [x0, #0xb8]
10163bd20:     	stur	q0, [x0, #0xc8]
10163bd24:     	stur	q0, [x0, #0xd8]
10163bd28:     	stur	q0, [x0, #0xe8]
10163bd2c:     	stur	q0, [x0, #0xf8]
10163bd30:     	str	xzr, [x0, #0x198]
10163bd34:     	str	q0, [x0, #0x18]!
10163bd38:     	stp	q0, q0, [x0, #0xf0]
10163bd3c:     	stp	q0, q0, [x0, #0x110]
10163bd40:     	stp	q0, q0, [x0, #0x130]
10163bd44:     	stp	q0, q0, [x0, #0x150]
10163bd48:     	str	q0, [x0, #0x170]
10163bd4c:     	mov	w9, #0x1                ; =1
10163bd50:     	strb	w9, [sp, #0x50]
10163bd54:     	ldr	x9, [x8, #0x8]
10163bd58:     	add	x9, x9, #0x1
10163bd5c:     	ucvtf	s0, x9
10163bd60:     	ldr	s1, [x8, #0x10]
10163bd64:     	cbz	x23, 0x10163bd78 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x554>
10163bd68:     	ucvtf	s2, x23
10163bd6c:     	fmul	s2, s1, s2
10163bd70:     	fcmp	s2, s0
10163bd74:     	b.pl	0x10163bfbc <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x798>
10163bd78:     	lsl	x8, x23, #1
10163bd7c:     	cmp	x23, #0x3
10163bd80:     	b.lo	0x10163bd94 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x570>
10163bd84:     	sub	x9, x23, #0x1
10163bd88:     	tst	x23, x9
10163bd8c:     	cset	w9, eq
10163bd90:     	b	0x10163bd98 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x574>
10163bd94:     	mov	w9, #0x0                ; =0
10163bd98:     	eor	w9, w9, #0x1
10163bd9c:     	orr	x8, x8, x9
10163bda0:     	fdiv	s0, s0, s1
10163bda4:     	fcvtpu	x9, s0
10163bda8:     	cmp	x8, x9
10163bdac:     	csel	x20, x8, x9, hi
10163bdb0:     	subs	x8, x20, #0x1
10163bdb4:     	b.ne	0x10163bdc0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x59c>
10163bdb8:     	mov	w20, #0x2               ; =2
10163bdbc:     	b	0x10163bdd8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x5b4>
10163bdc0:     	tst	x20, x8
10163bdc4:     	b.eq	0x10163bdd8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x5b4>
10163bdc8:     	mov	x0, x20
10163bdcc:     	bl	0x104b70e80 <_zlibVersion+0x104b70e80>
10163bdd0:     	mov	x20, x0
10163bdd4:     	ldr	x23, [x22, #0x9b0]
10163bdd8:     	cmp	x20, x23
10163bddc:     	b.ls	0x10163be54 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x630>
10163bde0:     	lsr	x8, x20, #61
10163bde4:     	cbnz	x8, 0x10163c528 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xd04>
10163bde8:     	lsl	x0, x20, #3
10163bdec:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10163bdf0:     	mov	x8, x0
10163bdf4:     	ldr	x0, [x21, #0x9a8]
10163bdf8:     	str	x8, [x21, #0x9a8]
10163bdfc:     	cbz	x0, 0x10163be04 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x5e0>
10163be00:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163be04:     	mov	x8, #0x0                ; =0
10163be08:     	str	x20, [x22, #0x9b0]
10163be0c:     	ldr	x9, [x21, #0x9a8]
10163be10:     	str	xzr, [x9, x8, lsl #3]
10163be14:     	add	x8, x8, #0x1
10163be18:     	cmp	x20, x8
10163be1c:     	b.ne	0x10163be0c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x5e8>
10163be20:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163be24:     	ldr	x9, [x8, #0x9b8]
10163be28:     	cbz	x9, 0x10163bf8c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x768>
10163be2c:     	ldr	x10, [x9, #0x8]
10163be30:     	fmov	d0, x20
10163be34:     	cnt.8b	v0, v0
10163be38:     	uaddlv.8b	h0, v0
10163be3c:     	fmov	w8, s0
10163be40:     	cmp	x8, #0x1
10163be44:     	b.hi	0x10163beb4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x690>
10163be48:     	sub	x11, x20, #0x1
10163be4c:     	and	x10, x10, x11
10163be50:     	b	0x10163bec4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x6a0>
10163be54:     	b.hs	0x10163bf8c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x768>
10163be58:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163be5c:     	add	x8, x8, #0x9c0
10163be60:     	ldr	x9, [x8]
10163be64:     	ucvtf	s0, x9
10163be68:     	ldr	s1, [x8, #0x8]
10163be6c:     	fdiv	s0, s0, s1
10163be70:     	fcvtpu	x0, s0
10163be74:     	cmp	x23, #0x3
10163be78:     	b.lo	0x10163bf60 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x73c>
10163be7c:     	fmov	d0, x23
10163be80:     	cnt.8b	v0, v0
10163be84:     	uaddlv.8b	h0, v0
10163be88:     	fmov	w8, s0
10163be8c:     	cmp	x8, #0x1
10163be90:     	b.hi	0x10163bf60 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x73c>
10163be94:     	sub	x8, x0, #0x1
10163be98:     	clz	x8, x8
10163be9c:     	neg	x8, x8
10163bea0:     	mov	w9, #0x1                ; =1
10163bea4:     	lsl	x8, x9, x8
10163bea8:     	cmp	x0, #0x2
10163beac:     	csel	x0, x0, x8, lo
10163beb0:     	b	0x10163bf64 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x740>
10163beb4:     	cmp	x10, x20
10163beb8:     	b.lo	0x10163bec4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x6a0>
10163bebc:     	udiv	x11, x10, x20
10163bec0:     	msub	x10, x11, x20, x10
10163bec4:     	adrp	x11, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163bec8:     	add	x11, x11, #0x9a8
10163becc:     	ldr	x12, [x11], #0x10
10163bed0:     	str	x11, [x12, x10, lsl #3]
10163bed4:     	ldr	x11, [x9]
10163bed8:     	cbz	x11, 0x10163bf8c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x768>
10163bedc:     	sub	x12, x20, #0x1
10163bee0:     	b	0x10163bf20 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x6fc>
10163bee4:     	ldr	x14, [x11]
10163bee8:     	str	x14, [x9]
10163beec:     	ldr	x14, [x21, #0x9a8]
10163bef0:     	ldr	x14, [x14, x13, lsl #3]
10163bef4:     	ldr	x14, [x14]
10163bef8:     	str	x14, [x11]
10163befc:     	ldr	x14, [x21, #0x9a8]
10163bf00:     	ldr	x13, [x14, x13, lsl #3]
10163bf04:     	str	x11, [x13]
10163bf08:     	mov	x11, x9
10163bf0c:     	mov	x13, x10
10163bf10:     	mov	x9, x11
10163bf14:     	ldr	x11, [x11]
10163bf18:     	mov	x10, x13
10163bf1c:     	cbz	x11, 0x10163bf8c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x768>
10163bf20:     	ldr	x13, [x11, #0x8]
10163bf24:     	cmp	x8, #0x1
10163bf28:     	b.hi	0x10163bf34 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x710>
10163bf2c:     	and	x13, x13, x12
10163bf30:     	b	0x10163bf44 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x720>
10163bf34:     	cmp	x13, x20
10163bf38:     	b.lo	0x10163bf44 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x720>
10163bf3c:     	udiv	x14, x13, x20
10163bf40:     	msub	x13, x14, x20, x13
10163bf44:     	cmp	x13, x10
10163bf48:     	b.eq	0x10163bf0c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x6e8>
10163bf4c:     	ldr	x14, [x21, #0x9a8]
10163bf50:     	ldr	x15, [x14, x13, lsl #3]
10163bf54:     	cbnz	x15, 0x10163bee4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x6c0>
10163bf58:     	str	x9, [x14, x13, lsl #3]
10163bf5c:     	b	0x10163bf10 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x6ec>
10163bf60:     	bl	0x104b70e80 <_zlibVersion+0x104b70e80>
10163bf64:     	cmp	x20, x0
10163bf68:     	csel	x20, x20, x0, hi
10163bf6c:     	cmp	x20, x23
10163bf70:     	b.hs	0x10163bf8c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x768>
10163bf74:     	cbnz	x20, 0x10163bde0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x5bc>
10163bf78:     	ldr	x0, [x21, #0x9a8]
10163bf7c:     	str	xzr, [x21, #0x9a8]
10163bf80:     	cbz	x0, 0x10163bf88 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x764>
10163bf84:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163bf88:     	str	xzr, [x22, #0x9b0]
10163bf8c:     	ldr	x23, [x22, #0x9b0]
10163bf90:     	sub	x8, x23, #0x1
10163bf94:     	tst	x23, x8
10163bf98:     	b.ne	0x10163bfa4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x780>
10163bf9c:     	and	x24, x8, x19
10163bfa0:     	b	0x10163bfbc <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x798>
10163bfa4:     	cmp	x23, x19
10163bfa8:     	b.ls	0x10163bfb4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x790>
10163bfac:     	mov	x24, x19
10163bfb0:     	b	0x10163bfbc <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x798>
10163bfb4:     	udiv	x8, x19, x23
10163bfb8:     	msub	x24, x8, x23, x19
10163bfbc:     	ldr	x8, [x21, #0x9a8]
10163bfc0:     	ldr	x8, [x8, x24, lsl #3]
10163bfc4:     	ldr	x20, [sp, #0x40]
10163bfc8:     	cbz	x8, 0x10163bfd8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x7b4>
10163bfcc:     	ldr	x9, [x8]
10163bfd0:     	str	x9, [x20]
10163bfd4:     	b	0x10163c02c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x808>
10163bfd8:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163bfdc:     	add	x8, x8, #0x9a8
10163bfe0:     	ldr	x9, [x8, #0x10]!
10163bfe4:     	str	x9, [x20]
10163bfe8:     	str	x20, [x8]
10163bfec:     	ldr	x9, [x21, #0x9a8]
10163bff0:     	str	x8, [x9, x24, lsl #3]
10163bff4:     	ldr	x8, [x20]
10163bff8:     	cbz	x8, 0x10163c030 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x80c>
10163bffc:     	ldr	x8, [x8, #0x8]
10163c000:     	sub	x9, x23, #0x1
10163c004:     	tst	x23, x9
10163c008:     	b.ne	0x10163c014 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x7f0>
10163c00c:     	and	x8, x8, x9
10163c010:     	b	0x10163c024 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x800>
10163c014:     	cmp	x8, x23
10163c018:     	b.lo	0x10163c024 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x800>
10163c01c:     	udiv	x9, x8, x23
10163c020:     	msub	x8, x9, x23, x8
10163c024:     	ldr	x9, [x21, #0x9a8]
10163c028:     	add	x8, x9, x8, lsl #3
10163c02c:     	str	x20, [x8]
10163c030:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163c034:     	ldr	x9, [x8, #0x9c0]
10163c038:     	add	x9, x9, #0x1
10163c03c:     	str	x9, [x8, #0x9c0]
10163c040:     	ldrsw	x8, [x19, #0xc0]
10163c044:     	mov	x21, x20
10163c048:     	ldr	x0, [x21, #0x70]!
10163c04c:     	stur	x8, [x21, #-0x58]
10163c050:     	mov	w8, #0x1                ; =1
10163c054:     	sturh	w8, [x21, #-0x50]
10163c058:     	sturb	wzr, [x21, #-0x4e]
10163c05c:     	movi.16b	v0, #0x0
10163c060:     	stur	q0, [x21, #-0x48]
10163c064:     	stur	q0, [x21, #-0x38]
10163c068:     	stur	q0, [x21, #-0x28]
10163c06c:     	stur	q0, [x21, #-0x18]
10163c070:     	stur	xzr, [x21, #-0xb]
10163c074:     	cbz	x0, 0x10163c088 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x864>
10163c078:     	str	x0, [x20, #0x78]
10163c07c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163c080:     	stp	xzr, xzr, [x21]
10163c084:     	str	xzr, [x21, #0x10]
10163c088:     	mov	x22, x20
10163c08c:     	ldr	x0, [x22, #0x88]!
10163c090:     	stp	xzr, xzr, [x21]
10163c094:     	str	xzr, [x21, #0x10]
10163c098:     	cbz	x0, 0x10163c0ac <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x888>
10163c09c:     	str	x0, [x20, #0x90]
10163c0a0:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163c0a4:     	stp	xzr, xzr, [x22]
10163c0a8:     	str	xzr, [x22, #0x10]
10163c0ac:     	mov	x21, x20
10163c0b0:     	ldr	x0, [x21, #0xa0]!
10163c0b4:     	stp	xzr, xzr, [x22]
10163c0b8:     	str	xzr, [x22, #0x10]
10163c0bc:     	cbz	x0, 0x10163c0d0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x8ac>
10163c0c0:     	str	x0, [x20, #0xa8]
10163c0c4:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163c0c8:     	stp	xzr, xzr, [x21]
10163c0cc:     	str	xzr, [x21, #0x10]
10163c0d0:     	mov	x22, x20
10163c0d4:     	ldr	x0, [x22, #0xb8]!
10163c0d8:     	stp	xzr, xzr, [x21]
10163c0dc:     	str	xzr, [x21, #0x10]
10163c0e0:     	cbz	x0, 0x10163c0f4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x8d0>
10163c0e4:     	str	x0, [x20, #0xc0]
10163c0e8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163c0ec:     	stp	xzr, xzr, [x22]
10163c0f0:     	str	xzr, [x22, #0x10]
10163c0f4:     	stp	xzr, xzr, [x22]
10163c0f8:     	strh	wzr, [x22, #0x18]
10163c0fc:     	str	xzr, [x22, #0x10]
10163c100:     	ldr	x8, [x20, #0x188]
10163c104:     	str	x8, [x20, #0x190]
10163c108:     	adrp	x22, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163c10c:     	ldr	x23, [x22, #0xa00]
10163c110:     	adrp	x21, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163c114:     	cbz	x23, 0x10163c13c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x918>
10163c118:     	fmov	d0, x23
10163c11c:     	cnt.8b	v0, v0
10163c120:     	uaddlv.8b	h0, v0
10163c124:     	fmov	w8, s0
10163c128:     	cmp	x8, #0x1
10163c12c:     	b.hi	0x10163c140 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x91c>
10163c130:     	sub	x9, x23, #0x1
10163c134:     	and	x20, x9, x19
10163c138:     	b	0x10163c154 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x930>
10163c13c:     	b	0x10163c1b8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x994>
10163c140:     	mov	x20, x19
10163c144:     	cmp	x23, x19
10163c148:     	b.hi	0x10163c154 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x930>
10163c14c:     	udiv	x9, x19, x23
10163c150:     	msub	x20, x9, x23, x19
10163c154:     	ldr	x9, [x21, #0x9f8]
10163c158:     	ldr	x9, [x9, x20, lsl #3]
10163c15c:     	cbz	x9, 0x10163c1b8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x994>
10163c160:     	ldr	x24, [x9]
10163c164:     	cbz	x24, 0x10163c1b8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x994>
10163c168:     	sub	x9, x23, #0x1
10163c16c:     	b	0x10163c184 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x960>
10163c170:     	ldr	x10, [x24, #0x10]
10163c174:     	cmp	x10, x19
10163c178:     	b.eq	0x10163c4d4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xcb0>
10163c17c:     	ldr	x24, [x24]
10163c180:     	cbz	x24, 0x10163c1b8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x994>
10163c184:     	ldr	x10, [x24, #0x8]
10163c188:     	cmp	x10, x19
10163c18c:     	b.eq	0x10163c170 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x94c>
10163c190:     	cmp	x8, #0x1
10163c194:     	b.hi	0x10163c1a0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x97c>
10163c198:     	and	x10, x10, x9
10163c19c:     	b	0x10163c1b0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x98c>
10163c1a0:     	cmp	x10, x23
10163c1a4:     	b.lo	0x10163c1b0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x98c>
10163c1a8:     	udiv	x11, x10, x23
10163c1ac:     	msub	x10, x11, x23, x10
10163c1b0:     	cmp	x10, x20
10163c1b4:     	b.eq	0x10163c17c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x958>
10163c1b8:     	mov	w0, #0x58               ; =88
10163c1bc:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10163c1c0:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163c1c4:     	add	x8, x8, #0xa08
10163c1c8:     	stp	x0, x8, [sp, #0x40]
10163c1cc:     	stp	xzr, x19, [x0]
10163c1d0:     	str	x19, [x0, #0x10]
10163c1d4:     	movi.16b	v0, #0x0
10163c1d8:     	stur	q0, [x0, #0x18]
10163c1dc:     	stur	q0, [x0, #0x28]
10163c1e0:     	stur	q0, [x0, #0x38]
10163c1e4:     	stur	q0, [x0, #0x48]
10163c1e8:     	mov	w9, #0x1                ; =1
10163c1ec:     	strb	w9, [sp, #0x50]
10163c1f0:     	ldr	x9, [x8, #0x8]
10163c1f4:     	add	x9, x9, #0x1
10163c1f8:     	ucvtf	s0, x9
10163c1fc:     	ldr	s1, [x8, #0x10]
10163c200:     	cbz	x23, 0x10163c214 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0x9f0>
10163c204:     	ucvtf	s2, x23
10163c208:     	fmul	s2, s1, s2
10163c20c:     	fcmp	s2, s0
10163c210:     	b.pl	0x10163c450 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xc2c>
10163c214:     	lsl	x8, x23, #1
10163c218:     	sub	x9, x23, #0x1
10163c21c:     	tst	x23, x9
10163c220:     	cset	w9, eq
10163c224:     	cmp	x23, #0x3
10163c228:     	csel	w9, wzr, w9, lo
10163c22c:     	eor	w9, w9, #0x1
10163c230:     	orr	x8, x8, x9
10163c234:     	fdiv	s0, s0, s1
10163c238:     	fcvtpu	x9, s0
10163c23c:     	cmp	x8, x9
10163c240:     	csel	x20, x8, x9, hi
10163c244:     	subs	x8, x20, #0x1
10163c248:     	b.ne	0x10163c254 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xa30>
10163c24c:     	mov	w20, #0x2               ; =2
10163c250:     	b	0x10163c26c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xa48>
10163c254:     	tst	x20, x8
10163c258:     	b.eq	0x10163c26c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xa48>
10163c25c:     	mov	x0, x20
10163c260:     	bl	0x104b70e80 <_zlibVersion+0x104b70e80>
10163c264:     	mov	x20, x0
10163c268:     	ldr	x23, [x22, #0xa00]
10163c26c:     	cmp	x20, x23
10163c270:     	b.ls	0x10163c2e8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xac4>
10163c274:     	lsr	x8, x20, #61
10163c278:     	cbnz	x8, 0x10163c530 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xd0c>
10163c27c:     	lsl	x0, x20, #3
10163c280:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10163c284:     	mov	x8, x0
10163c288:     	ldr	x0, [x21, #0x9f8]
10163c28c:     	str	x8, [x21, #0x9f8]
10163c290:     	cbz	x0, 0x10163c298 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xa74>
10163c294:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163c298:     	mov	x8, #0x0                ; =0
10163c29c:     	str	x20, [x22, #0xa00]
10163c2a0:     	ldr	x9, [x21, #0x9f8]
10163c2a4:     	str	xzr, [x9, x8, lsl #3]
10163c2a8:     	add	x8, x8, #0x1
10163c2ac:     	cmp	x20, x8
10163c2b0:     	b.ne	0x10163c2a0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xa7c>
10163c2b4:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163c2b8:     	ldr	x9, [x8, #0xa08]
10163c2bc:     	cbz	x9, 0x10163c420 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xbfc>
10163c2c0:     	ldr	x10, [x9, #0x8]
10163c2c4:     	fmov	d0, x20
10163c2c8:     	cnt.8b	v0, v0
10163c2cc:     	uaddlv.8b	h0, v0
10163c2d0:     	fmov	w8, s0
10163c2d4:     	cmp	x8, #0x1
10163c2d8:     	b.hi	0x10163c348 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xb24>
10163c2dc:     	sub	x11, x20, #0x1
10163c2e0:     	and	x10, x10, x11
10163c2e4:     	b	0x10163c358 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xb34>
10163c2e8:     	b.hs	0x10163c420 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xbfc>
10163c2ec:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163c2f0:     	add	x8, x8, #0xa10
10163c2f4:     	ldr	x9, [x8]
10163c2f8:     	ucvtf	s0, x9
10163c2fc:     	ldr	s1, [x8, #0x8]
10163c300:     	fdiv	s0, s0, s1
10163c304:     	fcvtpu	x0, s0
10163c308:     	cmp	x23, #0x3
10163c30c:     	b.lo	0x10163c3f4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xbd0>
10163c310:     	fmov	d0, x23
10163c314:     	cnt.8b	v0, v0
10163c318:     	uaddlv.8b	h0, v0
10163c31c:     	fmov	w8, s0
10163c320:     	cmp	x8, #0x1
10163c324:     	b.hi	0x10163c3f4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xbd0>
10163c328:     	sub	x8, x0, #0x1
10163c32c:     	clz	x8, x8
10163c330:     	neg	x8, x8
10163c334:     	mov	w9, #0x1                ; =1
10163c338:     	lsl	x8, x9, x8
10163c33c:     	cmp	x0, #0x2
10163c340:     	csel	x0, x0, x8, lo
10163c344:     	b	0x10163c3f8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xbd4>
10163c348:     	cmp	x10, x20
10163c34c:     	b.lo	0x10163c358 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xb34>
10163c350:     	udiv	x11, x10, x20
10163c354:     	msub	x10, x11, x20, x10
10163c358:     	adrp	x11, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163c35c:     	add	x11, x11, #0x9f8
10163c360:     	ldr	x12, [x11], #0x10
10163c364:     	str	x11, [x12, x10, lsl #3]
10163c368:     	ldr	x11, [x9]
10163c36c:     	cbz	x11, 0x10163c420 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xbfc>
10163c370:     	sub	x12, x20, #0x1
10163c374:     	b	0x10163c3b4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xb90>
10163c378:     	ldr	x14, [x11]
10163c37c:     	str	x14, [x9]
10163c380:     	ldr	x14, [x21, #0x9f8]
10163c384:     	ldr	x14, [x14, x13, lsl #3]
10163c388:     	ldr	x14, [x14]
10163c38c:     	str	x14, [x11]
10163c390:     	ldr	x14, [x21, #0x9f8]
10163c394:     	ldr	x13, [x14, x13, lsl #3]
10163c398:     	str	x11, [x13]
10163c39c:     	mov	x11, x9
10163c3a0:     	mov	x13, x10
10163c3a4:     	mov	x9, x11
10163c3a8:     	ldr	x11, [x11]
10163c3ac:     	mov	x10, x13
10163c3b0:     	cbz	x11, 0x10163c420 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xbfc>
10163c3b4:     	ldr	x13, [x11, #0x8]
10163c3b8:     	cmp	x8, #0x1
10163c3bc:     	b.hi	0x10163c3c8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xba4>
10163c3c0:     	and	x13, x13, x12
10163c3c4:     	b	0x10163c3d8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xbb4>
10163c3c8:     	cmp	x13, x20
10163c3cc:     	b.lo	0x10163c3d8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xbb4>
10163c3d0:     	udiv	x14, x13, x20
10163c3d4:     	msub	x13, x14, x20, x13
10163c3d8:     	cmp	x13, x10
10163c3dc:     	b.eq	0x10163c3a0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xb7c>
10163c3e0:     	ldr	x14, [x21, #0x9f8]
10163c3e4:     	ldr	x15, [x14, x13, lsl #3]
10163c3e8:     	cbnz	x15, 0x10163c378 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xb54>
10163c3ec:     	str	x9, [x14, x13, lsl #3]
10163c3f0:     	b	0x10163c3a4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xb80>
10163c3f4:     	bl	0x104b70e80 <_zlibVersion+0x104b70e80>
10163c3f8:     	cmp	x20, x0
10163c3fc:     	csel	x20, x20, x0, hi
10163c400:     	cmp	x20, x23
10163c404:     	b.hs	0x10163c420 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xbfc>
10163c408:     	cbnz	x20, 0x10163c274 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xa50>
10163c40c:     	ldr	x0, [x21, #0x9f8]
10163c410:     	str	xzr, [x21, #0x9f8]
10163c414:     	cbz	x0, 0x10163c41c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xbf8>
10163c418:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163c41c:     	str	xzr, [x22, #0xa00]
10163c420:     	ldr	x23, [x22, #0xa00]
10163c424:     	sub	x8, x23, #0x1
10163c428:     	tst	x23, x8
10163c42c:     	b.ne	0x10163c438 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xc14>
10163c430:     	and	x20, x8, x19
10163c434:     	b	0x10163c450 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xc2c>
10163c438:     	cmp	x23, x19
10163c43c:     	b.ls	0x10163c448 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xc24>
10163c440:     	mov	x20, x19
10163c444:     	b	0x10163c450 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xc2c>
10163c448:     	udiv	x8, x19, x23
10163c44c:     	msub	x20, x8, x23, x19
10163c450:     	ldr	x8, [x21, #0x9f8]
10163c454:     	ldr	x8, [x8, x20, lsl #3]
10163c458:     	ldr	x24, [sp, #0x40]
10163c45c:     	cbz	x8, 0x10163c46c <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xc48>
10163c460:     	ldr	x9, [x8]
10163c464:     	str	x9, [x24]
10163c468:     	b	0x10163c4c0 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xc9c>
10163c46c:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163c470:     	add	x8, x8, #0x9f8
10163c474:     	ldr	x9, [x8, #0x10]!
10163c478:     	str	x9, [x24]
10163c47c:     	str	x24, [x8]
10163c480:     	ldr	x9, [x21, #0x9f8]
10163c484:     	str	x8, [x9, x20, lsl #3]
10163c488:     	ldr	x8, [x24]
10163c48c:     	cbz	x8, 0x10163c4c4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xca0>
10163c490:     	ldr	x8, [x8, #0x8]
10163c494:     	sub	x9, x23, #0x1
10163c498:     	tst	x23, x9
10163c49c:     	b.ne	0x10163c4a8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xc84>
10163c4a0:     	and	x8, x8, x9
10163c4a4:     	b	0x10163c4b8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xc94>
10163c4a8:     	cmp	x8, x23
10163c4ac:     	b.lo	0x10163c4b8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xc94>
10163c4b0:     	udiv	x9, x8, x23
10163c4b4:     	msub	x8, x9, x23, x8
10163c4b8:     	ldr	x9, [x21, #0x9f8]
10163c4bc:     	add	x8, x9, x8, lsl #3
10163c4c0:     	str	x24, [x8]
10163c4c4:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163c4c8:     	ldr	x9, [x8, #0xa10]
10163c4cc:     	add	x9, x9, #0x1
10163c4d0:     	str	x9, [x8, #0xa10]
10163c4d4:     	ldrsw	x8, [x19, #0xc0]
10163c4d8:     	str	x8, [x24, #0x18]
10163c4dc:     	ldp	x19, x20, [x24, #0x40]
10163c4e0:     	b	0x10163c4e8 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xcc4>
10163c4e4:     	sub	x20, x20, #0x220
10163c4e8:     	cmp	x20, x19
10163c4ec:     	b.eq	0x10163c504 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xce0>
10163c4f0:     	ldur	x0, [x20, #-0x20]
10163c4f4:     	cbz	x0, 0x10163c4e4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xcc0>
10163c4f8:     	stur	x0, [x20, #-0x18]
10163c4fc:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163c500:     	b	0x10163c4e4 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xcc0>
10163c504:     	str	x19, [x24, #0x48]
10163c508:     	mov	w8, #0x1                ; =1
10163c50c:     	strb	w8, [x24, #0x20]
10163c510:     	ldp	x29, x30, [sp, #0xa0]
10163c514:     	ldp	x20, x19, [sp, #0x90]
10163c518:     	ldp	x22, x21, [sp, #0x80]
10163c51c:     	ldp	x24, x23, [sp, #0x70]
10163c520:     	add	sp, sp, #0xb0
10163c524:     	ret
10163c528:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
10163c52c:     	b	0x10163c534 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xd10>
10163c530:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
10163c534:     	brk	#0x1
10163c538:     	mov	x19, x0
10163c53c:     	add	x0, sp, #0x40
10163c540:     	bl	0x10164be6c <__ZNSt3__110unique_ptrINS_11__hash_nodeINS_17__hash_value_typeImN12_GLOBAL__N_112IPadHUDFrameEEEPvEENS_22__hash_node_destructorINS_9allocatorIS7_EEEEED1B8ne190102Ev>
10163c544:     	mov	x0, x19
10163c548:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
10163c54c:     	mov	x19, x0
10163c550:     	add	x0, sp, #0x40
10163c554:     	bl	0x10164c118 <__ZNSt3__110unique_ptrINS_11__hash_nodeINS_17__hash_value_typeImN12_GLOBAL__N_123IPadKnifeHierarchyFrameEEEPvEENS_22__hash_node_destructorINS_9allocatorIS7_EEEEED1B8ne190102Ev>
10163c558:     	mov	x0, x19
10163c55c:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
10163c560:     	b	0x10163c568 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xd44>
10163c564:     	b	0x10163c568 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow+0xd44>
10163c568:     	mov	x19, x0
10163c56c:     	add	x0, sp, #0x10
10163c570:     	bl	0x100186df0 <__ZNSt3__118unordered_multimapIPvPN3ccl11ShaderInputENS_4hashIS1_EENS_8equal_toIS1_EENS_9allocatorINS_4pairIKS1_S4_EEEEED1B8ne190102Ev>
10163c574:     	add	x0, sp, #0x40
10163c578:     	bl	0x100186df0 <__ZNSt3__118unordered_multimapIPvPN3ccl11ShaderInputENS_4hashIS1_EENS_8equal_toIS1_EENS_9allocatorINS_4pairIKS1_S4_EEEEED1B8ne190102Ev>
10163c57c:     	mov	x0, x19
10163c580:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
