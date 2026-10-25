
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f2f12c <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv>:
101f2f12c:     	sub	sp, sp, #0x60
101f2f130:     	stp	x24, x23, [sp, #0x20]
101f2f134:     	stp	x22, x21, [sp, #0x30]
101f2f138:     	stp	x20, x19, [sp, #0x40]
101f2f13c:     	stp	x29, x30, [sp, #0x50]
101f2f140:     	add	x29, sp, #0x50
101f2f144:     	mov	x19, x0
101f2f148:     	adrp	x22, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f2f14c:     	ldr	x8, [x22, #0xa8]
101f2f150:     	cmp	x8, #0x40
101f2f154:     	b.lo	0x101f2f2b0 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x184>
101f2f158:     	ldr	x8, [x19]
101f2f15c:     	ldr	x0, [x8]
101f2f160:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101f2f164:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f2f168:     	ldr	x1, [x8, #0xa0]
101f2f16c:     	cbz	x1, 0x101f2f1e4 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0xb8>
101f2f170:     	mov	x20, x0
101f2f174:     	adrp	x21, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f2f178:     	add	x21, x21, #0x90
101f2f17c:     	b	0x101f2f188 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x5c>
101f2f180:     	mov	x1, x23
101f2f184:     	cbz	x1, 0x101f2f1e4 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0xb8>
101f2f188:     	cbz	x20, 0x101f2f1c0 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x94>
101f2f18c:     	ldr	x8, [x20, #0x1a0]
101f2f190:     	cbz	x8, 0x101f2f1c0 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x94>
101f2f194:     	mov	w9, #0x0                ; =0
101f2f198:     	ldr	x10, [x1, #0x10]
101f2f19c:     	cmp	x10, x8
101f2f1a0:     	cset	w11, eq
101f2f1a4:     	orr	w9, w9, w11
101f2f1a8:     	ldr	x8, [x8]
101f2f1ac:     	cbnz	x8, 0x101f2f19c <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x70>
101f2f1b0:     	tbz	w9, #0x0, 0x101f2f1c0 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x94>
101f2f1b4:     	ldr	x1, [x1]
101f2f1b8:     	cbnz	x1, 0x101f2f188 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x5c>
101f2f1bc:     	b	0x101f2f1e4 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0xb8>
101f2f1c0:     	ldr	x23, [x1]
101f2f1c4:     	mov	x8, sp
101f2f1c8:     	mov	x0, x21
101f2f1cc:     	bl	0x100b43e20 <__ZNSt3__112__hash_tableIiNS_4hashIiEENS_8equal_toIiEENS_9allocatorIiEEE6removeENS_21__hash_const_iteratorIPNS_11__hash_nodeIiPvEEEE>
101f2f1d0:     	ldr	x0, [sp]
101f2f1d4:     	str	xzr, [sp]
101f2f1d8:     	cbz	x0, 0x101f2f180 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x54>
101f2f1dc:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2f1e0:     	b	0x101f2f180 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x54>
101f2f1e4:     	ldr	x8, [x22, #0xa8]
101f2f1e8:     	cmp	x8, #0x40
101f2f1ec:     	b.lo	0x101f2f2b0 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x184>
101f2f1f0:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f2f1f4:     	ldr	x8, [x8, #0x98]
101f2f1f8:     	cbz	x8, 0x101f2f2a8 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x17c>
101f2f1fc:     	ldr	x9, [x19, #0x8]
101f2f200:     	ldr	x9, [x9]
101f2f204:     	fmov	d0, x8
101f2f208:     	cnt.8b	v0, v0
101f2f20c:     	uaddlv.8b	h0, v0
101f2f210:     	fmov	w10, s0
101f2f214:     	cmp	x10, #0x1
101f2f218:     	b.hi	0x101f2f228 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0xfc>
101f2f21c:     	sub	x11, x8, #0x1
101f2f220:     	and	x11, x11, x9
101f2f224:     	b	0x101f2f23c <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x110>
101f2f228:     	mov	x11, x9
101f2f22c:     	cmp	x9, x8
101f2f230:     	b.lo	0x101f2f23c <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x110>
101f2f234:     	udiv	x11, x9, x8
101f2f238:     	msub	x11, x11, x8, x9
101f2f23c:     	adrp	x12, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f2f240:     	ldr	x12, [x12, #0x90]
101f2f244:     	ldr	x12, [x12, x11, lsl #3]
101f2f248:     	cbz	x12, 0x101f2f2a8 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x17c>
101f2f24c:     	ldr	x12, [x12]
101f2f250:     	cbz	x12, 0x101f2f2a8 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x17c>
101f2f254:     	sub	x13, x8, #0x1
101f2f258:     	b	0x101f2f274 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x148>
101f2f25c:     	ldr	x14, [x12, #0x10]
101f2f260:     	cmp	x14, x9
101f2f264:     	b.eq	0x101f2f2b0 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x184>
101f2f268:     	mov	w0, #0x0                ; =0
101f2f26c:     	ldr	x12, [x12]
101f2f270:     	cbz	x12, 0x101f2f310 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x1e4>
101f2f274:     	ldr	x14, [x12, #0x8]
101f2f278:     	cmp	x9, x14
101f2f27c:     	b.eq	0x101f2f25c <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x130>
101f2f280:     	cmp	x10, #0x1
101f2f284:     	b.hi	0x101f2f290 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x164>
101f2f288:     	and	x14, x14, x13
101f2f28c:     	b	0x101f2f2a0 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x174>
101f2f290:     	cmp	x14, x8
101f2f294:     	b.lo	0x101f2f2a0 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x174>
101f2f298:     	udiv	x15, x14, x8
101f2f29c:     	msub	x14, x15, x8, x14
101f2f2a0:     	cmp	x14, x11
101f2f2a4:     	b.eq	0x101f2f268 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x13c>
101f2f2a8:     	mov	w0, #0x0                ; =0
101f2f2ac:     	b	0x101f2f310 <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x1e4>
101f2f2b0:     	ldr	x1, [x19, #0x8]
101f2f2b4:     	str	x1, [sp]
101f2f2b8:     	adrp	x0, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f2f2bc:     	add	x0, x0, #0x90
101f2f2c0:     	adrp	x2, 0x10636c000 <_zlibVersion+0x10636c000>
101f2f2c4:     	ldr	x2, [x2, #0x188]
101f2f2c8:     	mov	x3, sp
101f2f2cc:     	add	x4, sp, #0x1f
101f2f2d0:     	bl	0x101f377c4 <__ZNSt3__112__hash_tableINS_17__hash_value_typeIm21uiIPadHUDContactStateEENS_22__unordered_map_hasherImS3_NS_4hashImEENS_8equal_toImEELb1EEENS_21__unordered_map_equalImS3_S8_S6_Lb1EEENS_9allocatorIS3_EEE25__emplace_unique_key_argsImJRKNS_21piecewise_construct_tENS_5tupleIJRKmEEENSJ_IJEEEEEENS_4pairINS_15__hash_iteratorIPNS_11__hash_nodeIS3_PvEEEEbEERKT_DpOT0_>
101f2f2d4:     	ldr	x8, [x19, #0x10]
101f2f2d8:     	ldr	x8, [x8]
101f2f2dc:     	ldr	x8, [x8, #0x50]
101f2f2e0:     	str	x8, [x0, #0x18]
101f2f2e4:     	ldr	x8, [x19, #0x10]
101f2f2e8:     	ldr	x8, [x8]
101f2f2ec:     	ldrh	w9, [x8, #0x10]
101f2f2f0:     	cmp	w9, #0x1
101f2f2f4:     	b.ne	0x101f2f30c <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x1e0>
101f2f2f8:     	ldrh	w9, [x8, #0x12]
101f2f2fc:     	cmp	w9, #0x2
101f2f300:     	b.ne	0x101f2f30c <__ZZ23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEventENK3$_0clEv+0x1e0>
101f2f304:     	ldr	x8, [x8, #0x50]
101f2f308:     	str	x8, [x0, #0x20]
101f2f30c:     	mov	w0, #0x1                ; =1
101f2f310:     	ldp	x29, x30, [sp, #0x50]
101f2f314:     	ldp	x20, x19, [sp, #0x40]
101f2f318:     	ldp	x22, x21, [sp, #0x30]
101f2f31c:     	ldp	x24, x23, [sp, #0x20]
101f2f320:     	add	sp, sp, #0x60
101f2f324:     	ret
