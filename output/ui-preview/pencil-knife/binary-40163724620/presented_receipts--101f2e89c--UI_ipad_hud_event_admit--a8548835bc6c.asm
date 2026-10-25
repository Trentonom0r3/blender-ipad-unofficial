
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f2e89c <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent>:
101f2e89c:     	stp	x28, x27, [sp, #-0x40]!
101f2e8a0:     	stp	x22, x21, [sp, #0x10]
101f2e8a4:     	stp	x20, x19, [sp, #0x20]
101f2e8a8:     	stp	x29, x30, [sp, #0x30]
101f2e8ac:     	add	x29, sp, #0x30
101f2e8b0:     	sub	sp, sp, #0x340
101f2e8b4:     	stp	x2, x0, [x29, #-0x40]
101f2e8b8:     	ldr	x8, [x2, #0x48]
101f2e8bc:     	cbz	x8, 0x101f2e8d8 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x3c>
101f2e8c0:     	ldr	x8, [x2, #0x50]
101f2e8c4:     	add	x9, x8, #0x1
101f2e8c8:     	cmp	x9, #0x2
101f2e8cc:     	b.hs	0x101f2e8f8 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x5c>
101f2e8d0:     	mov	w20, #0x0               ; =0
101f2e8d4:     	b	0x101f2e8dc <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x40>
101f2e8d8:     	mov	w20, #0x1               ; =1
101f2e8dc:     	and	w0, w20, #0x1
101f2e8e0:     	add	sp, sp, #0x340
101f2e8e4:     	ldp	x29, x30, [sp, #0x30]
101f2e8e8:     	ldp	x20, x19, [sp, #0x20]
101f2e8ec:     	ldp	x22, x21, [sp, #0x10]
101f2e8f0:     	ldp	x28, x27, [sp], #0x40
101f2e8f4:     	ret
101f2e8f8:     	mov	x19, x1
101f2e8fc:     	stur	x1, [x29, #-0x48]
101f2e900:     	adrp	x9, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f2e904:     	ldr	x10, [x9, #0x98]
101f2e908:     	cbz	x10, 0x101f2e930 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x94>
101f2e90c:     	fmov	d0, x10
101f2e910:     	cnt.8b	v0, v0
101f2e914:     	uaddlv.8b	h0, v0
101f2e918:     	fmov	w11, s0
101f2e91c:     	cmp	x11, #0x1
101f2e920:     	b.hi	0x101f2e93c <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0xa0>
101f2e924:     	sub	x9, x10, #0x1
101f2e928:     	and	x12, x9, x19
101f2e92c:     	b	0x101f2e950 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0xb4>
101f2e930:     	mov	w11, #0x0               ; =0
101f2e934:     	mov	x9, #0x0                ; =0
101f2e938:     	b	0x101f2e9d8 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x13c>
101f2e93c:     	mov	x12, x19
101f2e940:     	cmp	x10, x19
101f2e944:     	b.hi	0x101f2e950 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0xb4>
101f2e948:     	udiv	x9, x19, x10
101f2e94c:     	msub	x12, x9, x10, x19
101f2e950:     	adrp	x9, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f2e954:     	ldr	x9, [x9, #0x90]
101f2e958:     	ldr	x9, [x9, x12, lsl #3]
101f2e95c:     	cbz	x9, 0x101f2e9d0 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x134>
101f2e960:     	ldr	x9, [x9]
101f2e964:     	cbz	x9, 0x101f2e9d0 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x134>
101f2e968:     	sub	x13, x10, #0x1
101f2e96c:     	b	0x101f2e984 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0xe8>
101f2e970:     	ldr	x14, [x9, #0x10]
101f2e974:     	cmp	x14, x19
101f2e978:     	b.eq	0x101f2ebcc <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x330>
101f2e97c:     	ldr	x9, [x9]
101f2e980:     	cbz	x9, 0x101f2e9bc <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x120>
101f2e984:     	ldr	x14, [x9, #0x8]
101f2e988:     	cmp	x14, x19
101f2e98c:     	b.eq	0x101f2e970 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0xd4>
101f2e990:     	cmp	x11, #0x1
101f2e994:     	b.hi	0x101f2e9a0 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x104>
101f2e998:     	and	x14, x14, x13
101f2e99c:     	b	0x101f2e9b0 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x114>
101f2e9a0:     	cmp	x14, x10
101f2e9a4:     	b.lo	0x101f2e9b0 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x114>
101f2e9a8:     	udiv	x15, x14, x10
101f2e9ac:     	msub	x14, x15, x10, x14
101f2e9b0:     	cmp	x14, x12
101f2e9b4:     	b.eq	0x101f2e97c <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0xe0>
101f2e9b8:     	mov	x9, #0x0                ; =0
101f2e9bc:     	mov	x10, #0x0               ; =0
101f2e9c0:     	mov	w11, #0x0               ; =0
101f2e9c4:     	cmp	x8, x10
101f2e9c8:     	b.hi	0x101f2e9d8 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x13c>
101f2e9cc:     	b	0x101f2e9f8 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x15c>
101f2e9d0:     	mov	w11, #0x0               ; =0
101f2e9d4:     	mov	x10, #0x0               ; =0
101f2e9d8:     	ldrh	w12, [x2, #0x10]
101f2e9dc:     	cmp	w12, #0x4
101f2e9e0:     	b.eq	0x101f2e9f8 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x15c>
101f2e9e4:     	cmp	w12, #0x1
101f2e9e8:     	b.ne	0x101f2e8d0 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x34>
101f2e9ec:     	ldrh	w12, [x2, #0x12]
101f2e9f0:     	cmp	w12, #0x1
101f2e9f4:     	b.ne	0x101f2e8d0 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x34>
101f2e9f8:     	cbz	w11, 0x101f2ea20 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x184>
101f2e9fc:     	cmp	x8, x10
101f2ea00:     	b.ne	0x101f2ea20 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x184>
101f2ea04:     	ldrh	w10, [x2, #0x10]
101f2ea08:     	cmp	w10, #0x1
101f2ea0c:     	b.ne	0x101f2ea20 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x184>
101f2ea10:     	ldrh	w10, [x2, #0x12]
101f2ea14:     	cmp	w10, #0x2
101f2ea18:     	b.ne	0x101f2ea20 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x184>
101f2ea1c:     	str	x8, [x9, #0x20]
101f2ea20:     	sub	x8, x29, #0x38
101f2ea24:     	sub	x9, x29, #0x48
101f2ea28:     	stp	x8, x9, [x29, #-0x60]
101f2ea2c:     	sub	x8, x29, #0x40
101f2ea30:     	stur	x8, [x29, #-0x50]
101f2ea34:     	adrp	x21, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f2ea38:     	add	x21, x21, #0x78
101f2ea3c:     	b	0x101f2ea54 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x1b8>
101f2ea40:     	ldr	x0, [sp, #0x290]
101f2ea44:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2ea48:     	ldrsb	w8, [sp, #0x22f]
101f2ea4c:     	tbnz	w8, #0x1f, 0x101f2eb5c <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x2c0>
101f2ea50:     	tbz	w22, #0x0, 0x101f2e8dc <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x40>
101f2ea54:     	ldr	x21, [x21]
101f2ea58:     	cbz	x21, 0x101f2eba8 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x30c>
101f2ea5c:     	add	x0, sp, #0x188
101f2ea60:     	add	x1, x21, #0x18
101f2ea64:     	bl	0x101f368e0 <__ZN14uiIPadHUDFieldC2ERKS_>
101f2ea68:     	ldr	x9, [sp, #0x188]
101f2ea6c:     	ldur	x8, [x29, #-0x40]
101f2ea70:     	ldr	x10, [x8, #0x48]
101f2ea74:     	cmp	x9, x10
101f2ea78:     	b.ne	0x101f2eac8 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x22c>
101f2ea7c:     	ldr	x9, [sp, #0x190]
101f2ea80:     	ldr	x8, [x8, #0x50]
101f2ea84:     	cmp	x9, x8
101f2ea88:     	b.ne	0x101f2eac8 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x22c>
101f2ea8c:     	ldrb	w8, [sp, #0x30e]
101f2ea90:     	tbnz	w8, #0x0, 0x101f2eb24 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x288>
101f2ea94:     	ldur	x0, [x29, #-0x38]
101f2ea98:     	add	x1, sp, #0x188
101f2ea9c:     	mov	x2, #0x0                ; =0
101f2eaa0:     	mov	w3, #0x1                ; =1
101f2eaa4:     	bl	0x101f2ec10 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b>
101f2eaa8:     	cbz	w0, 0x101f2eae8 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x24c>
101f2eaac:     	sub	x0, x29, #0x60
101f2eab0:     	bl	0x101f2f12c <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv>
101f2eab4:     	mov	x20, x0
101f2eab8:     	mov	w22, #0x0               ; =0
101f2eabc:     	ldrsb	w8, [sp, #0x2ff]
101f2eac0:     	tbz	w8, #0x1f, 0x101f2ead4 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x238>
101f2eac4:     	b	0x101f2eb34 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x298>
101f2eac8:     	mov	w22, #0x1               ; =1
101f2eacc:     	ldrsb	w8, [sp, #0x2ff]
101f2ead0:     	tbnz	w8, #0x1f, 0x101f2eb34 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x298>
101f2ead4:     	ldrsb	w8, [sp, #0x2d7]
101f2ead8:     	tbnz	w8, #0x1f, 0x101f2eb44 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x2a8>
101f2eadc:     	ldrsb	w8, [sp, #0x2a7]
101f2eae0:     	tbz	w8, #0x1f, 0x101f2eb54 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x2b8>
101f2eae4:     	b	0x101f2ea40 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x1a4>
101f2eae8:     	ldur	x20, [x29, #-0x38]
101f2eaec:     	mov	x0, sp
101f2eaf0:     	add	x1, sp, #0x188
101f2eaf4:     	bl	0x101f368e0 <__ZN14uiIPadHUDFieldC2ERKS_>
101f2eaf8:     	mov	x1, sp
101f2eafc:     	mov	x0, x20
101f2eb00:     	bl	0x101f2f328 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField>
101f2eb04:     	ldrsb	w8, [sp, #0x177]
101f2eb08:     	tbnz	w8, #0x1f, 0x101f2eb6c <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x2d0>
101f2eb0c:     	ldrsb	w8, [sp, #0x14f]
101f2eb10:     	tbnz	w8, #0x1f, 0x101f2eb7c <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x2e0>
101f2eb14:     	ldrsb	w8, [sp, #0x11f]
101f2eb18:     	tbnz	w8, #0x1f, 0x101f2eb8c <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x2f0>
101f2eb1c:     	ldrsb	w8, [sp, #0xa7]
101f2eb20:     	tbnz	w8, #0x1f, 0x101f2eb9c <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x300>
101f2eb24:     	mov	w22, #0x0               ; =0
101f2eb28:     	mov	w20, #0x0               ; =0
101f2eb2c:     	ldrsb	w8, [sp, #0x2ff]
101f2eb30:     	tbz	w8, #0x1f, 0x101f2ead4 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x238>
101f2eb34:     	ldr	x0, [sp, #0x2e8]
101f2eb38:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2eb3c:     	ldrsb	w8, [sp, #0x2d7]
101f2eb40:     	tbz	w8, #0x1f, 0x101f2eadc <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x240>
101f2eb44:     	ldr	x0, [sp, #0x2c0]
101f2eb48:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2eb4c:     	ldrsb	w8, [sp, #0x2a7]
101f2eb50:     	tbnz	w8, #0x1f, 0x101f2ea40 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x1a4>
101f2eb54:     	ldrsb	w8, [sp, #0x22f]
101f2eb58:     	tbz	w8, #0x1f, 0x101f2ea50 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x1b4>
101f2eb5c:     	ldr	x0, [sp, #0x218]
101f2eb60:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2eb64:     	tbnz	w22, #0x0, 0x101f2ea54 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x1b8>
101f2eb68:     	b	0x101f2e8dc <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x40>
101f2eb6c:     	ldr	x0, [sp, #0x160]
101f2eb70:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2eb74:     	ldrsb	w8, [sp, #0x14f]
101f2eb78:     	tbz	w8, #0x1f, 0x101f2eb14 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x278>
101f2eb7c:     	ldr	x0, [sp, #0x138]
101f2eb80:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2eb84:     	ldrsb	w8, [sp, #0x11f]
101f2eb88:     	tbz	w8, #0x1f, 0x101f2eb1c <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x280>
101f2eb8c:     	ldr	x0, [sp, #0x108]
101f2eb90:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2eb94:     	ldrsb	w8, [sp, #0xa7]
101f2eb98:     	tbz	w8, #0x1f, 0x101f2eb24 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x288>
101f2eb9c:     	ldr	x0, [sp, #0x90]
101f2eba0:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2eba4:     	b	0x101f2eb24 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x288>
101f2eba8:     	ldp	x8, x0, [x29, #-0x40]
101f2ebac:     	ldr	x2, [x8, #0x48]
101f2ebb0:     	mov	x1, x19
101f2ebb4:     	bl	0x10163dcc4 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy>
101f2ebb8:     	cbz	w0, 0x101f2e8d0 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x34>
101f2ebbc:     	sub	x0, x29, #0x60
101f2ebc0:     	bl	0x101f2f12c <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv>
101f2ebc4:     	mov	x20, x0
101f2ebc8:     	b	0x101f2e8dc <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x40>
101f2ebcc:     	ldp	x10, x11, [x9, #0x18]
101f2ebd0:     	cmp	x8, x11
101f2ebd4:     	ccmp	x8, x10, #0x0, hi
101f2ebd8:     	b.lo	0x101f2e8d0 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x34>
101f2ebdc:     	mov	w11, #0x1               ; =1
101f2ebe0:     	cmp	x8, x10
101f2ebe4:     	b.hi	0x101f2e9d8 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x13c>
101f2ebe8:     	b	0x101f2e9f8 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x15c>
101f2ebec:     	mov	x19, x0
101f2ebf0:     	mov	x0, sp
101f2ebf4:     	bl	0x101f2f620 <__ZN14uiIPadHUDFieldD1Ev>
101f2ebf8:     	b	0x101f2ec00 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent+0x364>
101f2ebfc:     	mov	x19, x0
101f2ec00:     	add	x0, sp, #0x188
101f2ec04:     	bl	0x101f2f620 <__ZN14uiIPadHUDFieldD1Ev>
101f2ec08:     	mov	x0, x19
101f2ec0c:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
