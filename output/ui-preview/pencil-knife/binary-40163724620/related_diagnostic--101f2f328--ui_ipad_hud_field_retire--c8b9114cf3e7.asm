
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f2f328 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField>:
101f2f328:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f2f32c:     	ldr	x9, [x8, #0x70]
101f2f330:     	cbz	x9, 0x101f2f61c <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x2f4>
101f2f334:     	ldr	x10, [x1, #0x10]
101f2f338:     	fmov	d0, x9
101f2f33c:     	cnt.8b	v0, v0
101f2f340:     	uaddlv.8b	h0, v0
101f2f344:     	fmov	w11, s0
101f2f348:     	cmp	x11, #0x1
101f2f34c:     	b.hi	0x101f2f35c <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x34>
101f2f350:     	sub	x8, x9, #0x1
101f2f354:     	and	x12, x8, x10
101f2f358:     	b	0x101f2f370 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x48>
101f2f35c:     	mov	x12, x10
101f2f360:     	cmp	x10, x9
101f2f364:     	b.lo	0x101f2f370 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x48>
101f2f368:     	udiv	x8, x10, x9
101f2f36c:     	msub	x12, x8, x9, x10
101f2f370:     	sub	sp, sp, #0x70
101f2f374:     	stp	x24, x23, [sp, #0x30]
101f2f378:     	stp	x22, x21, [sp, #0x40]
101f2f37c:     	stp	x20, x19, [sp, #0x50]
101f2f380:     	stp	x29, x30, [sp, #0x60]
101f2f384:     	add	x29, sp, #0x60
101f2f388:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f2f38c:     	ldr	x8, [x8, #0x68]
101f2f390:     	ldr	x8, [x8, x12, lsl #3]
101f2f394:     	cbz	x8, 0x101f2f608 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x2e0>
101f2f398:     	ldr	x8, [x8]
101f2f39c:     	cbz	x8, 0x101f2f608 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x2e0>
101f2f3a0:     	sub	x13, x9, #0x1
101f2f3a4:     	b	0x101f2f3bc <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x94>
101f2f3a8:     	ldr	x14, [x8, #0x10]
101f2f3ac:     	cmp	x14, x10
101f2f3b0:     	b.eq	0x101f2f3f4 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0xcc>
101f2f3b4:     	ldr	x8, [x8]
101f2f3b8:     	cbz	x8, 0x101f2f608 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x2e0>
101f2f3bc:     	ldr	x14, [x8, #0x8]
101f2f3c0:     	cmp	x14, x10
101f2f3c4:     	b.eq	0x101f2f3a8 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x80>
101f2f3c8:     	cmp	x11, #0x1
101f2f3cc:     	b.hi	0x101f2f3d8 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0xb0>
101f2f3d0:     	and	x14, x14, x13
101f2f3d4:     	b	0x101f2f3e8 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0xc0>
101f2f3d8:     	cmp	x14, x9
101f2f3dc:     	b.lo	0x101f2f3e8 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0xc0>
101f2f3e0:     	udiv	x15, x14, x9
101f2f3e4:     	msub	x14, x15, x9, x14
101f2f3e8:     	cmp	x14, x12
101f2f3ec:     	b.eq	0x101f2f3b4 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x8c>
101f2f3f0:     	b	0x101f2f608 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x2e0>
101f2f3f4:     	ldr	x9, [x8, #0x20]
101f2f3f8:     	ldr	x10, [x1, #0x8]
101f2f3fc:     	cmp	x9, x10
101f2f400:     	b.ne	0x101f2f608 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x2e0>
101f2f404:     	mov	x19, x0
101f2f408:     	adrp	x10, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f2f40c:     	ldr	x10, [x10, #0x98]
101f2f410:     	cbz	x10, 0x101f2f4cc <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x1a4>
101f2f414:     	ldr	x11, [x1, #0x30]
101f2f418:     	fmov	d0, x10
101f2f41c:     	cnt.8b	v0, v0
101f2f420:     	uaddlv.8b	h0, v0
101f2f424:     	fmov	w12, s0
101f2f428:     	cmp	x12, #0x1
101f2f42c:     	b.hi	0x101f2f43c <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x114>
101f2f430:     	sub	x13, x10, #0x1
101f2f434:     	and	x13, x13, x11
101f2f438:     	b	0x101f2f450 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x128>
101f2f43c:     	mov	x13, x11
101f2f440:     	cmp	x11, x10
101f2f444:     	b.lo	0x101f2f450 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x128>
101f2f448:     	udiv	x13, x11, x10
101f2f44c:     	msub	x13, x13, x10, x11
101f2f450:     	adrp	x14, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f2f454:     	ldr	x14, [x14, #0x90]
101f2f458:     	ldr	x14, [x14, x13, lsl #3]
101f2f45c:     	cbz	x14, 0x101f2f4cc <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x1a4>
101f2f460:     	ldr	x14, [x14]
101f2f464:     	cbz	x14, 0x101f2f4cc <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x1a4>
101f2f468:     	sub	x15, x10, #0x1
101f2f46c:     	b	0x101f2f484 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x15c>
101f2f470:     	ldr	x16, [x14, #0x10]
101f2f474:     	cmp	x16, x11
101f2f478:     	b.eq	0x101f2f4bc <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x194>
101f2f47c:     	ldr	x14, [x14]
101f2f480:     	cbz	x14, 0x101f2f4cc <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x1a4>
101f2f484:     	ldr	x16, [x14, #0x8]
101f2f488:     	cmp	x16, x11
101f2f48c:     	b.eq	0x101f2f470 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x148>
101f2f490:     	cmp	x12, #0x1
101f2f494:     	b.hi	0x101f2f4a0 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x178>
101f2f498:     	and	x16, x16, x15
101f2f49c:     	b	0x101f2f4b0 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x188>
101f2f4a0:     	cmp	x16, x10
101f2f4a4:     	b.lo	0x101f2f4b0 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x188>
101f2f4a8:     	udiv	x17, x16, x10
101f2f4ac:     	msub	x16, x17, x10, x16
101f2f4b0:     	cmp	x16, x13
101f2f4b4:     	b.eq	0x101f2f47c <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x154>
101f2f4b8:     	b	0x101f2f4cc <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x1a4>
101f2f4bc:     	ldr	x10, [x14, #0x18]
101f2f4c0:     	cmp	x10, x9
101f2f4c4:     	b.ne	0x101f2f4cc <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x1a4>
101f2f4c8:     	str	x9, [x14, #0x20]
101f2f4cc:     	adrp	x0, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f2f4d0:     	add	x0, x0, #0x68
101f2f4d4:     	mov	x20, x1
101f2f4d8:     	mov	x1, x8
101f2f4dc:     	bl	0x101f37a88 <__ZNSt3__112__hash_tableINS_17__hash_value_typeIy14uiIPadHUDFieldEENS_22__unordered_map_hasherIyS3_NS_4hashIyEENS_8equal_toIyEELb1EEENS_21__unordered_map_equalIyS3_S8_S6_Lb1EEENS_9allocatorIS3_EEE5eraseENS_21__hash_const_iteratorIPNS_11__hash_nodeIS3_PvEEEE>
101f2f4e0:     	str	xzr, [sp, #0x8]
101f2f4e4:     	add	x2, sp, #0x8
101f2f4e8:     	mov	x0, x19
101f2f4ec:     	mov	x21, x20
101f2f4f0:     	mov	x1, x20
101f2f4f4:     	bl	0x101f36ac0 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion>
101f2f4f8:     	cbz	x0, 0x101f2f608 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x2e0>
101f2f4fc:     	mov	x23, x0
101f2f500:     	mov	w8, #0x1                ; =1
101f2f504:     	strb	w8, [x0, #0x390]
101f2f508:     	ldr	w8, [x0, #0x18]
101f2f50c:     	orr	w8, w8, #0x2000
101f2f510:     	str	w8, [x0, #0x18]
101f2f514:     	ldr	x8, [x0, #0x3d0]
101f2f518:     	cbnz	x8, 0x101f2f524 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x1fc>
101f2f51c:     	ldr	x8, [x23, #0x3d8]
101f2f520:     	cbz	x8, 0x101f2f608 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x2e0>
101f2f524:     	mov	x0, x19
101f2f528:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f2f52c:     	mov	x20, x0
101f2f530:     	mov	x0, x19
101f2f534:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
101f2f538:     	mov	x22, x0
101f2f53c:     	mov	x0, x19
101f2f540:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f2f544:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
101f2f548:     	add	x24, x0, #0x1c0
101f2f54c:     	ldr	x24, [x24]
101f2f550:     	cbz	x24, 0x101f2f574 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x24c>
101f2f554:     	ldr	x1, [sp, #0x8]
101f2f558:     	add	x0, x24, #0x78
101f2f55c:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101f2f560:     	cmn	w0, #0x1
101f2f564:     	b.eq	0x101f2f54c <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x224>
101f2f568:     	mov	x0, x19
101f2f56c:     	mov	x1, x24
101f2f570:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
101f2f574:     	ldr	x1, [sp, #0x8]
101f2f578:     	mov	x0, x19
101f2f57c:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
101f2f580:     	ldr	x8, [x23, #0x3d8]
101f2f584:     	cbz	x8, 0x101f2f5c0 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x298>
101f2f588:     	ldr	x9, [x23, #0x3d0]
101f2f58c:     	cmp	x8, x9
101f2f590:     	b.eq	0x101f2f5c0 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x298>
101f2f594:     	mov	x0, x19
101f2f598:     	stp	x23, x19, [sp, #0x20]
101f2f59c:     	ldr	x1, [x8, #0x18]
101f2f5a0:     	add	x8, sp, #0x28
101f2f5a4:     	add	x9, sp, #0x20
101f2f5a8:     	adrp	x3, 0x101f49000 <__ZL25ui_handle_menus_recursiveP8bContextPK7wmEventP18uiPopupBlockHandleibbb+0x170c>
101f2f5ac:     	add	x3, x3, #0xf54
101f2f5b0:     	stp	x8, x9, [sp, #0x10]
101f2f5b4:     	add	x4, sp, #0x10
101f2f5b8:     	mov	x2, x23
101f2f5bc:     	bl	0x101f319d8 <__ZL29with_but_active_as_semi_modalP8bContextP7ARegionP5uiButN7blender11FunctionRefIFvvEEE>
101f2f5c0:     	mov	x0, x19
101f2f5c4:     	mov	x1, x21
101f2f5c8:     	mov	x2, #0x0                ; =0
101f2f5cc:     	bl	0x101f36ac0 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion>
101f2f5d0:     	cbz	x0, 0x101f2f5f8 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x2d0>
101f2f5d4:     	mov	x1, x0
101f2f5d8:     	ldr	x2, [x0, #0x3d0]
101f2f5dc:     	cbz	x2, 0x101f2f5f8 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField+0x2d0>
101f2f5e0:     	mov	w8, #0x1                ; =1
101f2f5e4:     	strb	w8, [x2, #0x2c]
101f2f5e8:     	mov	x0, x19
101f2f5ec:     	mov	w3, #0x0                ; =0
101f2f5f0:     	mov	w4, #0x1                ; =1
101f2f5f4:     	bl	0x101f31410 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb>
101f2f5f8:     	mov	x0, x19
101f2f5fc:     	mov	x1, x20
101f2f600:     	mov	x2, x22
101f2f604:     	bl	0x101f8f7a8 <__Z30ui_ipad_action_context_restoreP8bContextmm>
101f2f608:     	ldp	x29, x30, [sp, #0x60]
101f2f60c:     	ldp	x20, x19, [sp, #0x50]
101f2f610:     	ldp	x22, x21, [sp, #0x40]
101f2f614:     	ldp	x24, x23, [sp, #0x30]
101f2f618:     	add	sp, sp, #0x70
101f2f61c:     	ret
