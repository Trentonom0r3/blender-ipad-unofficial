
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f4630c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut>:
101f4630c:     	stp	x28, x27, [sp, #-0x60]!
101f46310:     	stp	x26, x25, [sp, #0x10]
101f46314:     	stp	x24, x23, [sp, #0x20]
101f46318:     	stp	x22, x21, [sp, #0x30]
101f4631c:     	stp	x20, x19, [sp, #0x40]
101f46320:     	stp	x29, x30, [sp, #0x50]
101f46324:     	add	x29, sp, #0x50
101f46328:     	sub	sp, sp, #0x340
101f4632c:     	mov	x20, x2
101f46330:     	mov	x21, x1
101f46334:     	mov	x19, x0
101f46338:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f4633c:     	ldr	x8, [x8, #0x70]
101f46340:     	cbz	x8, 0x101f463e8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xdc>
101f46344:     	ldr	x9, [x20, #0x8]
101f46348:     	fmov	d0, x8
101f4634c:     	cnt.8b	v0, v0
101f46350:     	uaddlv.8b	h0, v0
101f46354:     	fmov	w10, s0
101f46358:     	cmp	x10, #0x1
101f4635c:     	b.hi	0x101f4636c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x60>
101f46360:     	sub	x11, x8, #0x1
101f46364:     	and	x11, x11, x9
101f46368:     	b	0x101f46380 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x74>
101f4636c:     	mov	x11, x9
101f46370:     	cmp	x9, x8
101f46374:     	b.lo	0x101f46380 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x74>
101f46378:     	udiv	x11, x9, x8
101f4637c:     	msub	x11, x11, x8, x9
101f46380:     	adrp	x12, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f46384:     	ldr	x12, [x12, #0x68]
101f46388:     	ldr	x12, [x12, x11, lsl #3]
101f4638c:     	cbz	x12, 0x101f463e8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xdc>
101f46390:     	ldr	x22, [x12]
101f46394:     	cbz	x22, 0x101f463e8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xdc>
101f46398:     	sub	x12, x8, #0x1
101f4639c:     	b	0x101f463b4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa8>
101f463a0:     	ldr	x13, [x22, #0x10]
101f463a4:     	cmp	x13, x9
101f463a8:     	b.eq	0x101f46574 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x268>
101f463ac:     	ldr	x22, [x22]
101f463b0:     	cbz	x22, 0x101f463e8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xdc>
101f463b4:     	ldr	x13, [x22, #0x8]
101f463b8:     	cmp	x13, x9
101f463bc:     	b.eq	0x101f463a0 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x94>
101f463c0:     	cmp	x10, #0x1
101f463c4:     	b.hi	0x101f463d0 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xc4>
101f463c8:     	and	x13, x13, x12
101f463cc:     	b	0x101f463e0 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xd4>
101f463d0:     	cmp	x13, x8
101f463d4:     	b.lo	0x101f463e0 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xd4>
101f463d8:     	udiv	x14, x13, x8
101f463dc:     	msub	x13, x14, x8, x13
101f463e0:     	cmp	x13, x11
101f463e4:     	b.eq	0x101f463ac <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa0>
101f463e8:     	ldr	x8, [x21, #0x48]
101f463ec:     	cbz	x8, 0x101f4683c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x530>
101f463f0:     	ldr	x8, [x21, #0x50]
101f463f4:     	cbz	x8, 0x101f4683c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x530>
101f463f8:     	ldrh	w8, [x21, #0x10]
101f463fc:     	cmp	w8, #0x1
101f46400:     	b.ne	0x101f4683c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x530>
101f46404:     	ldrh	w8, [x21, #0x12]
101f46408:     	cmp	w8, #0x1
101f4640c:     	b.ne	0x101f4683c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x530>
101f46410:     	ldr	x8, [x20, #0x3d0]
101f46414:     	cbz	x8, 0x101f4683c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x530>
101f46418:     	ldr	w9, [x8, #0x24]
101f4641c:     	cmp	w9, #0x1
101f46420:     	b.ne	0x101f4683c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x530>
101f46424:     	ldr	x22, [x8, #0x18]
101f46428:     	cbz	x22, 0x101f4683c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x530>
101f4642c:     	ldrh	w8, [x22, #0xc0]
101f46430:     	cmp	w8, #0x8
101f46434:     	b.ne	0x101f4683c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x530>
101f46438:     	ldp	w8, w9, [x21, #0x14]
101f4643c:     	stp	w9, w8, [sp, #0x10]
101f46440:     	ldr	x1, [x20, #0x420]
101f46444:     	add	x2, sp, #0x14
101f46448:     	add	x3, sp, #0x10
101f4644c:     	mov	x0, x22
101f46450:     	bl	0x101f09c18 <__Z18ui_window_to_blockPK7ARegionPK7uiBlockPiS5_>
101f46454:     	ldp	s1, s0, [sp, #0x10]
101f46458:     	scvtf	s0, s0
101f4645c:     	scvtf	s1, s1
101f46460:     	add	x0, x20, #0x70
101f46464:     	bl	0x1007fc8e4 <__Z17BLI_rctf_isect_ptPK4rctfff>
101f46468:     	tbz	w0, #0x0, 0x101f4683c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x530>
101f4646c:     	mov	x0, x19
101f46470:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f46474:     	mov	x1, x0
101f46478:     	ldr	x2, [x21, #0x48]
101f4647c:     	mov	x0, x19
101f46480:     	bl	0x10163dcc4 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy>
101f46484:     	tbz	w0, #0x0, 0x101f46cb4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9a8>
101f46488:     	movi.16b	v0, #0x0
101f4648c:     	add	x8, sp, #0x15d
101f46490:     	stur	q0, [x8, #0xff]
101f46494:     	add	x24, sp, #0x1a0
101f46498:     	stp	q0, q0, [sp, #0x240]
101f4649c:     	stp	q0, q0, [sp, #0x220]
101f464a0:     	stp	q0, q0, [sp, #0x200]
101f464a4:     	stp	q0, q0, [sp, #0x1e0]
101f464a8:     	stp	q0, q0, [sp, #0x1c0]
101f464ac:     	stp	q0, q0, [sp, #0x270]
101f464b0:     	stp	q0, q0, [sp, #0x290]
101f464b4:     	stp	q0, q0, [sp, #0x2b0]
101f464b8:     	stp	q0, q0, [sp, #0x2d0]
101f464bc:     	stp	q0, q0, [sp, #0x2f0]
101f464c0:     	str	xzr, [sp, #0x310]
101f464c4:     	mov	w8, #-0x1               ; =-1
101f464c8:     	str	w8, [sp, #0x318]
101f464cc:     	add	x8, x24, #0x17c
101f464d0:     	stur	wzr, [x8, #0x7]
101f464d4:     	str	xzr, [x8]
101f464d8:     	ldur	q1, [x21, #0x48]
101f464dc:     	stp	q1, q0, [sp, #0x1a0]
101f464e0:     	add	x3, sp, #0x1a0
101f464e4:     	mov	x0, x19
101f464e8:     	mov	x1, x20
101f464ec:     	mov	x2, x22
101f464f0:     	bl	0x101f36c80 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField>
101f464f4:     	tbz	w0, #0x0, 0x101f46cac <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9a0>
101f464f8:     	add	x2, sp, #0x1a0
101f464fc:     	mov	x0, x19
101f46500:     	mov	x1, x20
101f46504:     	bl	0x101f36f18 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField>
101f46508:     	mov	x22, x0
101f4650c:     	ldr	x8, [x20, #0x420]
101f46510:     	adrp	x1, 0x104cf7000 <__ZL3hex+0x12b34d>
101f46514:     	add	x1, x1, #0x6e5
101f46518:     	add	x0, x8, #0x228
101f4651c:     	bl	0x100910920 <__ZNSt3__1eqB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_>
101f46520:     	cbz	w0, 0x101f46538 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x22c>
101f46524:     	ldr	x8, [x20, #0x258]
101f46528:     	cmp	x8, #0x0
101f4652c:     	cset	w8, eq
101f46530:     	orr	w8, w8, w22
101f46534:     	tbz	w8, #0x0, 0x101f46cac <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9a0>
101f46538:     	ldrb	w8, [sp, #0x325]
101f4653c:     	cmp	w8, #0x1
101f46540:     	b.ne	0x101f4655c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x250>
101f46544:     	mov	x0, x20
101f46548:     	bl	0x101f40e4c <__ZL26ui_ipad_hud_single_numericPK5uiBut>
101f4654c:     	cbz	w0, 0x101f46cac <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9a0>
101f46550:     	ldr	x8, [x20, #0x3d0]
101f46554:     	mov	w9, #0x3                ; =3
101f46558:     	str	w9, [x8, #0x110]
101f4655c:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f46560:     	ldr	x22, [x8, #0x78]
101f46564:     	cbz	x22, 0x101f467dc <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x4d0>
101f46568:     	adrp	x23, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f4656c:     	add	x23, x23, #0x68
101f46570:     	b	0x101f467a4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x498>
101f46574:     	add	x0, sp, #0x1a0
101f46578:     	add	x1, x22, #0x18
101f4657c:     	bl	0x101f368e0 <__ZN14uiIPadHUDFieldC2ERKS_>
101f46580:     	ldrb	w8, [sp, #0x326]
101f46584:     	cmp	w8, #0x1
101f46588:     	b.ne	0x101f465d4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x2c8>
101f4658c:     	ldr	x8, [x21, #0x48]
101f46590:     	cbnz	x8, 0x101f465d4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x2c8>
101f46594:     	ldrh	w8, [x21, #0x10]
101f46598:     	cmp	w8, #0x1
101f4659c:     	b.ne	0x101f465d4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x2c8>
101f465a0:     	ldrh	w8, [x21, #0x12]
101f465a4:     	cmp	w8, #0x1
101f465a8:     	b.ne	0x101f465d4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x2c8>
101f465ac:     	ldr	x8, [x20, #0x3d0]
101f465b0:     	cbz	x8, 0x101f465d4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x2c8>
101f465b4:     	ldr	w8, [x8, #0x24]
101f465b8:     	cmp	w8, #0x1
101f465bc:     	b.ne	0x101f465d4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x2c8>
101f465c0:     	adrp	x0, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f465c4:     	add	x0, x0, #0x68
101f465c8:     	mov	x1, x22
101f465cc:     	bl	0x101f37a88 <__ZNSt3__112__hash_tableINS_17__hash_value_typeIy14uiIPadHUDFieldEENS_22__unordered_map_hasherIyS3_NS_4hashIyEENS_8equal_toIyEELb1EEENS_21__unordered_map_equalIyS3_S8_S6_Lb1EEENS_9allocatorIS3_EEE5eraseENS_21__hash_const_iteratorIPNS_11__hash_nodeIS3_PvEEEE>
101f465d0:     	b	0x101f466a4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x398>
101f465d4:     	add	x1, sp, #0x1a0
101f465d8:     	mov	x0, x19
101f465dc:     	mov	x2, #0x0                ; =0
101f465e0:     	mov	w3, #0x1                ; =1
101f465e4:     	bl	0x101f2ec10 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b>
101f465e8:     	cbz	w0, 0x101f4663c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x330>
101f465ec:     	ldrb	w8, [sp, #0x325]
101f465f0:     	cmp	w8, #0x1
101f465f4:     	b.ne	0x101f46678 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x36c>
101f465f8:     	ldr	x8, [x20, #0x3d0]
101f465fc:     	cbz	x8, 0x101f46678 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x36c>
101f46600:     	ldrb	w9, [x8, #0x114]
101f46604:     	tbnz	w9, #0x0, 0x101f4663c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x330>
101f46608:     	ldr	x9, [x8, #0x118]
101f4660c:     	cbnz	x9, 0x101f4663c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x330>
101f46610:     	ldr	x9, [x8, #0x120]
101f46614:     	cbnz	x9, 0x101f4663c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x330>
101f46618:     	ldr	w9, [x8, #0x110]
101f4661c:     	sub	w9, w9, #0x1
101f46620:     	cmp	w9, #0x2
101f46624:     	b.lo	0x101f4663c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x330>
101f46628:     	ldrb	w9, [x8, #0x2e1]
101f4662c:     	tbnz	w9, #0x0, 0x101f4663c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x330>
101f46630:     	ldp	x9, x8, [x8, #0x140]
101f46634:     	cmp	x9, x8
101f46638:     	b.eq	0x101f46678 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x36c>
101f4663c:     	add	x0, sp, #0x18
101f46640:     	add	x1, sp, #0x1a0
101f46644:     	bl	0x101f368e0 <__ZN14uiIPadHUDFieldC2ERKS_>
101f46648:     	add	x1, sp, #0x18
101f4664c:     	mov	x0, x19
101f46650:     	bl	0x101f2f328 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField>
101f46654:     	ldrsb	w8, [sp, #0x18f]
101f46658:     	tbnz	w8, #0x1f, 0x101f466c8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x3bc>
101f4665c:     	ldrsb	w8, [sp, #0x167]
101f46660:     	tbnz	w8, #0x1f, 0x101f466d8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x3cc>
101f46664:     	ldrsb	w8, [sp, #0x137]
101f46668:     	tbnz	w8, #0x1f, 0x101f466e8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x3dc>
101f4666c:     	ldrsb	w8, [sp, #0xbf]
101f46670:     	tbz	w8, #0x1f, 0x101f46700 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x3f4>
101f46674:     	b	0x101f466f8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x3ec>
101f46678:     	ldrb	w8, [sp, #0x326]
101f4667c:     	cmp	w8, #0x1
101f46680:     	b.ne	0x101f466a4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x398>
101f46684:     	ldr	x8, [x21, #0x48]
101f46688:     	ldr	x9, [sp, #0x1a0]
101f4668c:     	cmp	x8, x9
101f46690:     	b.ne	0x101f466a4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x398>
101f46694:     	ldr	x8, [x21, #0x50]
101f46698:     	ldr	x9, [sp, #0x1a8]
101f4669c:     	cmp	x8, x9
101f466a0:     	b.eq	0x101f46700 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x3f4>
101f466a4:     	ldrsb	w8, [sp, #0x317]
101f466a8:     	tbnz	w8, #0x1f, 0x101f46760 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x454>
101f466ac:     	ldrsb	w8, [sp, #0x2ef]
101f466b0:     	tbnz	w8, #0x1f, 0x101f46770 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x464>
101f466b4:     	ldrsb	w8, [sp, #0x2bf]
101f466b8:     	tbnz	w8, #0x1f, 0x101f46780 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x474>
101f466bc:     	ldrsb	w8, [sp, #0x247]
101f466c0:     	tbz	w8, #0x1f, 0x101f463e8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xdc>
101f466c4:     	b	0x101f46790 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x484>
101f466c8:     	ldr	x0, [sp, #0x178]
101f466cc:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f466d0:     	ldrsb	w8, [sp, #0x167]
101f466d4:     	tbz	w8, #0x1f, 0x101f46664 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x358>
101f466d8:     	ldr	x0, [sp, #0x150]
101f466dc:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f466e0:     	ldrsb	w8, [sp, #0x137]
101f466e4:     	tbz	w8, #0x1f, 0x101f4666c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x360>
101f466e8:     	ldr	x0, [sp, #0x120]
101f466ec:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f466f0:     	ldrsb	w8, [sp, #0xbf]
101f466f4:     	tbz	w8, #0x1f, 0x101f46700 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x3f4>
101f466f8:     	ldr	x0, [sp, #0xa8]
101f466fc:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f46700:     	ldrsb	w8, [sp, #0x317]
101f46704:     	tbnz	w8, #0x1f, 0x101f46724 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x418>
101f46708:     	ldrsb	w8, [sp, #0x2ef]
101f4670c:     	tbnz	w8, #0x1f, 0x101f46734 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x428>
101f46710:     	ldrsb	w8, [sp, #0x2bf]
101f46714:     	tbnz	w8, #0x1f, 0x101f46744 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x438>
101f46718:     	ldrsb	w8, [sp, #0x247]
101f4671c:     	tbz	w8, #0x1f, 0x101f46cb4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9a8>
101f46720:     	b	0x101f46754 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x448>
101f46724:     	ldr	x0, [sp, #0x300]
101f46728:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f4672c:     	ldrsb	w8, [sp, #0x2ef]
101f46730:     	tbz	w8, #0x1f, 0x101f46710 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x404>
101f46734:     	ldr	x0, [sp, #0x2d8]
101f46738:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f4673c:     	ldrsb	w8, [sp, #0x2bf]
101f46740:     	tbz	w8, #0x1f, 0x101f46718 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x40c>
101f46744:     	ldr	x0, [sp, #0x2a8]
101f46748:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f4674c:     	ldrsb	w8, [sp, #0x247]
101f46750:     	tbz	w8, #0x1f, 0x101f46cb4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9a8>
101f46754:     	ldr	x0, [sp, #0x230]
101f46758:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f4675c:     	b	0x101f46cb4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9a8>
101f46760:     	ldr	x0, [sp, #0x300]
101f46764:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f46768:     	ldrsb	w8, [sp, #0x2ef]
101f4676c:     	tbz	w8, #0x1f, 0x101f466b4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x3a8>
101f46770:     	ldr	x0, [sp, #0x2d8]
101f46774:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f46778:     	ldrsb	w8, [sp, #0x2bf]
101f4677c:     	tbz	w8, #0x1f, 0x101f466bc <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x3b0>
101f46780:     	ldr	x0, [sp, #0x2a8]
101f46784:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f46788:     	ldrsb	w8, [sp, #0x247]
101f4678c:     	tbz	w8, #0x1f, 0x101f463e8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xdc>
101f46790:     	ldr	x0, [sp, #0x230]
101f46794:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f46798:     	b	0x101f463e8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xdc>
101f4679c:     	ldr	x22, [x22]
101f467a0:     	cbz	x22, 0x101f467dc <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x4d0>
101f467a4:     	add	x1, x22, #0x18
101f467a8:     	mov	x0, x19
101f467ac:     	mov	x2, #0x0                ; =0
101f467b0:     	bl	0x101f36ac0 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion>
101f467b4:     	cbz	x0, 0x101f467c8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x4bc>
101f467b8:     	ldr	x8, [x0, #0x3d0]
101f467bc:     	cbnz	x8, 0x101f4679c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x490>
101f467c0:     	ldr	x8, [x0, #0x3d8]
101f467c4:     	cbnz	x8, 0x101f4679c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x490>
101f467c8:     	mov	x0, x23
101f467cc:     	mov	x1, x22
101f467d0:     	bl	0x101f37a88 <__ZNSt3__112__hash_tableINS_17__hash_value_typeIy14uiIPadHUDFieldEENS_22__unordered_map_hasherIyS3_NS_4hashIyEENS_8equal_toIyEELb1EEENS_21__unordered_map_equalIyS3_S8_S6_Lb1EEENS_9allocatorIS3_EEE5eraseENS_21__hash_const_iteratorIPNS_11__hash_nodeIS3_PvEEEE>
101f467d4:     	mov	x22, x0
101f467d8:     	cbnz	x0, 0x101f467a4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x498>
101f467dc:     	add	x22, x24, #0x10
101f467e0:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f467e4:     	ldr	x8, [x8, #0x80]
101f467e8:     	cmp	x8, #0x3f
101f467ec:     	b.ls	0x101f46804 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x4f8>
101f467f0:     	adrp	x0, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f467f4:     	add	x0, x0, #0x68
101f467f8:     	mov	x1, x22
101f467fc:     	bl	0x101f3682c <__ZNKSt3__113unordered_mapIy14uiIPadHUDFieldNS_4hashIyEENS_8equal_toIyEENS_9allocatorINS_4pairIKyS1_EEEEE5countB8ne190102ERS8_>
101f46800:     	cbz	x0, 0x101f46cac <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9a0>
101f46804:     	stur	x22, [x29, #-0x60]
101f46808:     	adrp	x0, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f4680c:     	add	x0, x0, #0x68
101f46810:     	adrp	x2, 0x10636c000 <_zlibVersion+0x10636c000>
101f46814:     	ldr	x2, [x2, #0x188]
101f46818:     	sub	x3, x29, #0x60
101f4681c:     	sub	x4, x29, #0x61
101f46820:     	mov	x1, x22
101f46824:     	bl	0x101f4740c <__ZNSt3__112__hash_tableINS_17__hash_value_typeIy14uiIPadHUDFieldEENS_22__unordered_map_hasherIyS3_NS_4hashIyEENS_8equal_toIyEELb1EEENS_21__unordered_map_equalIyS3_S8_S6_Lb1EEENS_9allocatorIS3_EEE25__emplace_unique_key_argsIyJRKNS_21piecewise_construct_tENS_5tupleIJRKyEEENSJ_IJEEEEEENS_4pairINS_15__hash_iteratorIPNS_11__hash_nodeIS3_PvEEEEbEERKT_DpOT0_>
101f46828:     	add	x0, x0, #0x18
101f4682c:     	add	x1, sp, #0x1a0
101f46830:     	bl	0x101f3731c <__ZN14uiIPadHUDFieldaSEOS_>
101f46834:     	add	x0, sp, #0x1a0
101f46838:     	bl	0x101f2f620 <__ZN14uiIPadHUDFieldD1Ev>
101f4683c:     	mov	x0, x19
101f46840:     	mov	x1, x20
101f46844:     	bl	0x101f093c4 <__Z33ui_ipad_but_self_callback_allowedP8bContextP5uiBut>
101f46848:     	tbz	w0, #0x0, 0x101f468c4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x5b8>
101f4684c:     	mov	x0, x20
101f46850:     	bl	0x101f05a30 <__Z26ui_ipad_numbers_but_rebindP5uiBut>
101f46854:     	cbz	w0, 0x101f46cb4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9a8>
101f46858:     	ldr	x8, [x20, #0x420]
101f4685c:     	add	x1, x8, #0x3b0
101f46860:     	mov	x0, x19
101f46864:     	bl	0x101f8f1cc <__Z27ui_ipad_action_origin_validP8bContextRKN7blender2ui4ipad12ActionOriginE>
101f46868:     	tbz	w0, #0x0, 0x101f468c4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x5b8>
101f4686c:     	ldr	x23, [x20, #0x3d0]
101f46870:     	ldr	w27, [x23, #0x24]
101f46874:     	ldr	x24, [x20, #0x420]
101f46878:     	ldr	x22, [x23, #0x18]
101f4687c:     	cmp	w27, #0x2
101f46880:     	b.gt	0x101f46900 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x5f4>
101f46884:     	cmp	w27, #0x1
101f46888:     	b.eq	0x101f46980 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x674>
101f4688c:     	cmp	w27, #0x2
101f46890:     	b.ne	0x101f46d60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa54>
101f46894:     	ldrh	w8, [x21, #0x10]
101f46898:     	cmp	w8, #0x110
101f4689c:     	b.ne	0x101f46a74 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x768>
101f468a0:     	ldr	x8, [x21, #0x88]
101f468a4:     	ldr	x9, [x23, #0x38]
101f468a8:     	cmp	x8, x9
101f468ac:     	b.ne	0x101f46a74 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x768>
101f468b0:     	mov	x0, x19
101f468b4:     	mov	x1, x20
101f468b8:     	mov	w2, #0xa                ; =10
101f468bc:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f468c0:     	b	0x101f46a74 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x768>
101f468c4:     	ldr	x8, [x20, #0x420]
101f468c8:     	ldr	x8, [x8, #0x3a8]
101f468cc:     	cbz	x8, 0x101f468d8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x5cc>
101f468d0:     	mov	w9, #0x1                ; =1
101f468d4:     	str	w9, [x8, #0x28c]
101f468d8:     	ldr	x2, [x20, #0x3d0]
101f468dc:     	mov	w24, #0x1               ; =1
101f468e0:     	cbz	x2, 0x101f46cb8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9ac>
101f468e4:     	strb	w24, [x2, #0x2c]
101f468e8:     	mov	x0, x19
101f468ec:     	mov	x1, x20
101f468f0:     	mov	w3, #0x0                ; =0
101f468f4:     	mov	w4, #0x1                ; =1
101f468f8:     	bl	0x101f31410 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb>
101f468fc:     	b	0x101f46cb8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9ac>
101f46900:     	cmp	w27, #0x3
101f46904:     	b.eq	0x101f469b8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x6ac>
101f46908:     	cmp	w27, #0x8
101f4690c:     	b.ne	0x101f46d60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa54>
101f46910:     	ldrh	w8, [x21, #0x10]
101f46914:     	cmp	w8, #0x3
101f46918:     	b.eq	0x101f46a28 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x71c>
101f4691c:     	cmp	w8, #0x4
101f46920:     	b.ne	0x101f46a60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x754>
101f46924:     	ldr	x8, [x23, #0xf0]
101f46928:     	cbz	x8, 0x101f46940 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x634>
101f4692c:     	ldr	x0, [x8, #0x1e0]
101f46930:     	cbz	x0, 0x101f46940 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x634>
101f46934:     	add	x1, x21, #0x14
101f46938:     	bl	0x101f72a70 <__Z27ui_region_contains_point_pxPK7ARegionPKi>
101f4693c:     	tbnz	w0, #0x0, 0x101f46a60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x754>
101f46940:     	mov	x0, x22
101f46944:     	mov	x1, x21
101f46948:     	bl	0x101f72eb8 <__Z22ui_but_find_mouse_overPK7ARegionPK7wmEvent>
101f4694c:     	cbz	x0, 0x101f46a60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x754>
101f46950:     	ldr	x8, [x0, #0x3d0]
101f46954:     	cmp	x8, x23
101f46958:     	b.eq	0x101f46a60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x754>
101f4695c:     	ldrb	w8, [x20, #0x21]
101f46960:     	cmp	w8, #0xf
101f46964:     	b.eq	0x101f46970 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x664>
101f46968:     	mov	w8, #0x1                ; =1
101f4696c:     	strb	w8, [x23, #0x2c]
101f46970:     	mov	x0, x19
101f46974:     	mov	x1, x20
101f46978:     	mov	w2, #0xa                ; =10
101f4697c:     	b	0x101f46a5c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x750>
101f46980:     	ldrh	w8, [x21, #0x10]
101f46984:     	cmp	w8, #0x103
101f46988:     	b.gt	0x101f469f0 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x6e4>
101f4698c:     	cmp	w8, #0xe
101f46990:     	b.hi	0x101f46d60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa54>
101f46994:     	mov	w9, #0x1                ; =1
101f46998:     	lsl	w9, w9, w8
101f4699c:     	mov	w10, #0x4c04            ; =19460
101f469a0:     	tst	w9, w10
101f469a4:     	b.eq	0x101f46b6c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x860>
101f469a8:     	mov	x0, x19
101f469ac:     	mov	x1, x20
101f469b0:     	bl	0x101f31358 <__Z27UI_but_tooltip_timer_removeP8bContextP5uiBut>
101f469b4:     	b	0x101f46d60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa54>
101f469b8:     	ldrh	w8, [x21, #0x10]
101f469bc:     	cmp	w8, #0x4
101f469c0:     	b.eq	0x101f46abc <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x7b0>
101f469c4:     	cmp	w8, #0x110
101f469c8:     	b.eq	0x101f46a7c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x770>
101f469cc:     	cmp	w8, #0x104
101f469d0:     	b.ne	0x101f46b50 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x844>
101f469d4:     	mov	w24, #0x1               ; =1
101f469d8:     	strb	w24, [x23, #0x2c]
101f469dc:     	mov	x0, x19
101f469e0:     	mov	x1, x20
101f469e4:     	mov	w2, #0xa                ; =10
101f469e8:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f469ec:     	b	0x101f46d78 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa6c>
101f469f0:     	mov	w9, #0x5024             ; =20516
101f469f4:     	cmp	w8, w9
101f469f8:     	b.eq	0x101f46a0c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x700>
101f469fc:     	cmp	w8, #0x110
101f46a00:     	b.eq	0x101f46c14 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x908>
101f46a04:     	cmp	w8, #0x104
101f46a08:     	b.ne	0x101f46d60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa54>
101f46a0c:     	mov	w8, #0x1                ; =1
101f46a10:     	strb	w8, [x23, #0x2c]
101f46a14:     	mov	x0, x19
101f46a18:     	mov	x1, x20
101f46a1c:     	mov	w2, #0xa                ; =10
101f46a20:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f46a24:     	b	0x101f46d60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa54>
101f46a28:     	ldrh	w8, [x21, #0x12]
101f46a2c:     	cmp	w8, #0x1
101f46a30:     	b.ne	0x101f46a60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x754>
101f46a34:     	mov	x0, x22
101f46a38:     	mov	x1, x21
101f46a3c:     	bl	0x101f72eb8 <__Z22ui_but_find_mouse_overPK7ARegionPK7wmEvent>
101f46a40:     	cbz	x0, 0x101f46a60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x754>
101f46a44:     	mov	x1, x0
101f46a48:     	ldr	x8, [x0, #0x3d0]
101f46a4c:     	cmp	x8, x23
101f46a50:     	b.ne	0x101f46a60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x754>
101f46a54:     	mov	x0, x19
101f46a58:     	mov	w2, #0x1                ; =1
101f46a5c:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f46a60:     	mov	x0, x19
101f46a64:     	mov	x1, x24
101f46a68:     	mov	x2, x20
101f46a6c:     	mov	x3, x21
101f46a70:     	bl	0x101f32afc <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent>
101f46a74:     	mov	w24, #0x0               ; =0
101f46a78:     	b	0x101f46d78 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa6c>
101f46a7c:     	ldr	x8, [x21, #0x88]
101f46a80:     	ldr	x9, [x23, #0xb0]
101f46a84:     	mov	w24, #0x1               ; =1
101f46a88:     	cmp	x8, x9
101f46a8c:     	b.ne	0x101f46d78 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa6c>
101f46a90:     	strb	w24, [x23, #0x2c]
101f46a94:     	mov	x0, x19
101f46a98:     	mov	x1, x20
101f46a9c:     	mov	w2, #0xa                ; =10
101f46aa0:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f46aa4:     	ldr	x8, [x20, #0x160]
101f46aa8:     	ldr	x1, [x23, #0x18]
101f46aac:     	mov	x0, x19
101f46ab0:     	mov	x2, x20
101f46ab4:     	blr	x8
101f46ab8:     	b	0x101f46d78 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa6c>
101f46abc:     	add	x2, x21, #0x14
101f46ac0:     	mov	x0, x20
101f46ac4:     	mov	x1, x22
101f46ac8:     	bl	0x101f729cc <__Z24ui_but_contains_point_pxPK5uiButPK7ARegionPKi>
101f46acc:     	cbz	w0, 0x101f46bec <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x8e0>
101f46ad0:     	ldr	x8, [x23, #0xb0]
101f46ad4:     	cbz	x8, 0x101f46b28 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x81c>
101f46ad8:     	ldrb	w8, [x20, #0x18]
101f46adc:     	tbz	w8, #0x0, 0x101f46b28 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x81c>
101f46ae0:     	mov	x0, x21
101f46ae4:     	bl	0x100b4cfe8 <__Z23WM_event_drag_thresholdPK7wmEvent>
101f46ae8:     	ldr	d0, [x21, #0xa0]
101f46aec:     	ldur	d1, [x21, #0x14]
101f46af0:     	sabd.2s	v2, v0, v1
101f46af4:     	dup.2s	v2, v2[1]
101f46af8:     	saba.2s	v2, v0, v1
101f46afc:     	fmov	w8, s2
101f46b00:     	cmp	w8, w0
101f46b04:     	b.le	0x101f46b28 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x81c>
101f46b08:     	ldp	x0, x1, [x23]
101f46b0c:     	ldr	x2, [x23, #0xb0]
101f46b10:     	bl	0x100b93b90 <__Z21WM_event_timer_removeP15wmWindowManagerP8wmWindowP7wmTimer>
101f46b14:     	ldp	x0, x1, [x23]
101f46b18:     	fmov	d0, xzr
101f46b1c:     	mov	w2, #0x110              ; =272
101f46b20:     	bl	0x100b9613c <__Z18WM_event_timer_addP15wmWindowManagerP8wmWindow11wmEventTyped>
101f46b24:     	str	x0, [x23, #0xb0]
101f46b28:     	ldr	w8, [x20, #0x18]
101f46b2c:     	tbnz	w8, #0x0, 0x101f46cdc <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9d0>
101f46b30:     	mov	w9, #0x5                ; =5
101f46b34:     	orr	w8, w8, w9
101f46b38:     	str	w8, [x20, #0x18]
101f46b3c:     	strb	wzr, [x23, #0x2c]
101f46b40:     	ldr	x0, [x23, #0x18]
101f46b44:     	bl	0x10161f34c <__Z31ED_region_tag_redraw_no_rebuildP7ARegion>
101f46b48:     	mov	w24, #0x1               ; =1
101f46b4c:     	b	0x101f46d78 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa6c>
101f46b50:     	mov	x0, x19
101f46b54:     	mov	x1, x24
101f46b58:     	mov	x2, x20
101f46b5c:     	mov	x3, x21
101f46b60:     	bl	0x101f32afc <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent>
101f46b64:     	mov	w24, #0x1               ; =1
101f46b68:     	b	0x101f46d78 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa6c>
101f46b6c:     	cmp	w8, #0x1
101f46b70:     	b.eq	0x101f46c60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x954>
101f46b74:     	cmp	w8, #0x4
101f46b78:     	b.ne	0x101f46d60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa54>
101f46b7c:     	mov	x0, x22
101f46b80:     	mov	x1, x21
101f46b84:     	bl	0x101f72eb8 <__Z22ui_but_find_mouse_overPK7ARegionPK7wmEvent>
101f46b88:     	mov	x25, x0
101f46b8c:     	mov	x0, x24
101f46b90:     	bl	0x101f736a4 <__Z16ui_block_is_menuPK7uiBlock>
101f46b94:     	cbz	w0, 0x101f46ba4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x898>
101f46b98:     	mov	x0, x24
101f46b9c:     	bl	0x101f736c8 <__Z20ui_block_is_pie_menuPK7uiBlock>
101f46ba0:     	cbz	w0, 0x101f46bb8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x8ac>
101f46ba4:     	add	x2, x21, #0x14
101f46ba8:     	mov	x0, x20
101f46bac:     	mov	x1, x22
101f46bb0:     	bl	0x101f729cc <__Z24ui_but_contains_point_pxPK5uiButPK7ARegionPKi>
101f46bb4:     	cbz	w0, 0x101f46bd0 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x8c4>
101f46bb8:     	cbz	x25, 0x101f46ce4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9d8>
101f46bbc:     	mov	x0, x25
101f46bc0:     	bl	0x101f725e0 <__Z18ui_but_is_editablePK5uiBut>
101f46bc4:     	cbz	w0, 0x101f46ce4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9d8>
101f46bc8:     	cmp	x25, x20
101f46bcc:     	b.eq	0x101f46ce4 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9d8>
101f46bd0:     	mov	w8, #0x1                ; =1
101f46bd4:     	strb	w8, [x23, #0x2c]
101f46bd8:     	mov	x0, x19
101f46bdc:     	mov	x1, x20
101f46be0:     	mov	w2, #0xa                ; =10
101f46be4:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f46be8:     	b	0x101f46d50 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa44>
101f46bec:     	ldr	w8, [x20, #0x18]
101f46bf0:     	mov	w24, #0x1               ; =1
101f46bf4:     	tbz	w8, #0x0, 0x101f46d78 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa6c>
101f46bf8:     	mov	w9, #-0x6               ; =-6
101f46bfc:     	and	w8, w8, w9
101f46c00:     	str	w8, [x20, #0x18]
101f46c04:     	strb	w24, [x23, #0x2c]
101f46c08:     	ldr	x0, [x23, #0x18]
101f46c0c:     	bl	0x10161f34c <__Z31ED_region_tag_redraw_no_rebuildP7ARegion>
101f46c10:     	b	0x101f46d78 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa6c>
101f46c14:     	ldr	x8, [x21, #0x88]
101f46c18:     	ldr	x2, [x23, #0xa8]
101f46c1c:     	cmp	x8, x2
101f46c20:     	b.ne	0x101f46d60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa54>
101f46c24:     	ldp	x0, x1, [x23]
101f46c28:     	bl	0x100b93b90 <__Z21WM_event_timer_removeP15wmWindowManagerP8wmWindowP7wmTimer>
101f46c2c:     	str	xzr, [x23, #0xa8]
101f46c30:     	add	x2, x21, #0x14
101f46c34:     	mov	x0, x20
101f46c38:     	mov	x1, x22
101f46c3c:     	bl	0x101f729cc <__Z24ui_but_contains_point_pxPK5uiButPK7ARegionPKi>
101f46c40:     	tbnz	w0, #0x0, 0x101f46c4c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x940>
101f46c44:     	ldr	x8, [x20, #0x3d0]
101f46c48:     	cbz	x8, 0x101f46d60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa54>
101f46c4c:     	mov	x0, x19
101f46c50:     	mov	x1, x20
101f46c54:     	mov	w2, #0x8                ; =8
101f46c58:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f46c5c:     	b	0x101f46d60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa54>
101f46c60:     	ldrh	w8, [x21, #0x12]
101f46c64:     	cmp	w8, #0x2
101f46c68:     	b.ne	0x101f46d60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa54>
101f46c6c:     	ldrb	w8, [x24, #0x34a]
101f46c70:     	tbz	w8, #0x6, 0x101f46d60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa54>
101f46c74:     	ldrb	w8, [x20, #0x19]
101f46c78:     	tbnz	w8, #0x5, 0x101f46d60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa54>
101f46c7c:     	mov	x0, x20
101f46c80:     	bl	0x101f7282c <__Z29ui_but_is_popover_once_compatPK5uiBut>
101f46c84:     	cbz	w0, 0x101f46efc <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xbf0>
101f46c88:     	strb	wzr, [x23, #0x2c]
101f46c8c:     	mov	x0, x19
101f46c90:     	mov	x1, x20
101f46c94:     	mov	w2, #0xa                ; =10
101f46c98:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f46c9c:     	ldr	x8, [x24, #0x3a8]
101f46ca0:     	mov	w9, #0x1                ; =1
101f46ca4:     	str	w9, [x8, #0x28c]
101f46ca8:     	b	0x101f46d60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa54>
101f46cac:     	add	x0, sp, #0x1a0
101f46cb0:     	bl	0x101f2f620 <__ZN14uiIPadHUDFieldD1Ev>
101f46cb4:     	mov	w24, #0x1               ; =1
101f46cb8:     	mov	x0, x24
101f46cbc:     	add	sp, sp, #0x340
101f46cc0:     	ldp	x29, x30, [sp, #0x50]
101f46cc4:     	ldp	x20, x19, [sp, #0x40]
101f46cc8:     	ldp	x22, x21, [sp, #0x30]
101f46ccc:     	ldp	x24, x23, [sp, #0x20]
101f46cd0:     	ldp	x26, x25, [sp, #0x10]
101f46cd4:     	ldp	x28, x27, [sp], #0x60
101f46cd8:     	ret
101f46cdc:     	mov	w24, #0x1               ; =1
101f46ce0:     	b	0x101f46d78 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa6c>
101f46ce4:     	mov	x0, x19
101f46ce8:     	bl	0x1000b3bb8 <__Z13CTX_wm_screenPK8bContext>
101f46cec:     	cbz	x0, 0x101f46d28 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa1c>
101f46cf0:     	mov	x25, x0
101f46cf4:     	ldr	x8, [x0, #0x218]
101f46cf8:     	cbz	x8, 0x101f46d28 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa1c>
101f46cfc:     	mov	x0, x21
101f46d00:     	bl	0x100b4cfe8 <__Z23WM_event_drag_thresholdPK7wmEvent>
101f46d04:     	ldr	x8, [x25, #0x218]
101f46d08:     	ldur	d0, [x8, #0x2c]
101f46d0c:     	ldur	d1, [x21, #0x14]
101f46d10:     	sabd.2s	v2, v0, v1
101f46d14:     	dup.2s	v2, v2[1]
101f46d18:     	saba.2s	v2, v0, v1
101f46d1c:     	fmov	w8, s2
101f46d20:     	cmp	w8, w0
101f46d24:     	b.le	0x101f46d50 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa44>
101f46d28:     	cbz	x22, 0x101f46d44 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa38>
101f46d2c:     	ldr	x8, [x22, #0x128]
101f46d30:     	ldr	x8, [x8, #0x260]
101f46d34:     	cbz	x8, 0x101f46d44 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa38>
101f46d38:     	strb	wzr, [x8, #0x372]
101f46d3c:     	ldr	x8, [x8]
101f46d40:     	cbnz	x8, 0x101f46d38 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa2c>
101f46d44:     	mov	x0, x19
101f46d48:     	mov	x1, x20
101f46d4c:     	bl	0x101f384b0 <__ZL26button_tooltip_timer_resetP8bContextP5uiBut>
101f46d50:     	mov	x0, x20
101f46d54:     	mov	x1, x23
101f46d58:     	mov	x2, x21
101f46d5c:     	bl	0x101f3f2d8 <__ZL40ui_do_but_extra_operator_icons_mousemoveP5uiButP18uiHandleButtonDataPK7wmEvent>
101f46d60:     	mov	x0, x19
101f46d64:     	mov	x1, x24
101f46d68:     	mov	x2, x20
101f46d6c:     	mov	x3, x21
101f46d70:     	bl	0x101f32afc <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent>
101f46d74:     	mov	x24, x0
101f46d78:     	ldr	x2, [x20, #0x3d0]
101f46d7c:     	cbz	x2, 0x101f46cb8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9ac>
101f46d80:     	ldr	w8, [x2, #0x24]
101f46d84:     	cmp	w8, #0xa
101f46d88:     	b.ne	0x101f46cb8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9ac>
101f46d8c:     	ldr	x23, [x2, #0x2f8]
101f46d90:     	ldr	w25, [x2, #0x2f0]
101f46d94:     	ldrb	w8, [x2, #0x2c]
101f46d98:     	tbz	w8, #0x0, 0x101f46de0 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xad4>
101f46d9c:     	cmp	x23, #0x0
101f46da0:     	cset	w3, eq
101f46da4:     	mov	x0, x19
101f46da8:     	mov	x1, x20
101f46dac:     	mov	w4, #0x0                ; =0
101f46db0:     	bl	0x101f31410 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb>
101f46db4:     	cbz	x23, 0x101f46e9c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xb90>
101f46db8:     	mov	x0, x23
101f46dbc:     	bl	0x101f10848 <__Z21ui_but_range_set_softP5uiBut>
101f46dc0:     	mov	x0, x23
101f46dc4:     	bl	0x101f107c8 <__Z21ui_but_range_set_hardP5uiBut>
101f46dc8:     	mov	x0, x19
101f46dcc:     	mov	x1, x22
101f46dd0:     	mov	x2, x23
101f46dd4:     	mov	x3, x25
101f46dd8:     	bl	0x101f32854 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType>
101f46ddc:     	b	0x101f46cb8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9ac>
101f46de0:     	ldr	x8, [x2, #0x40]
101f46de4:     	cbz	x8, 0x101f46d9c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa90>
101f46de8:     	ldrb	w8, [x8]
101f46dec:     	cbnz	w8, 0x101f46d9c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa90>
101f46df0:     	ldr	x0, [x20, #0x258]
101f46df4:     	cbz	x0, 0x101f46d9c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa90>
101f46df8:     	str	x2, [sp, #0x8]
101f46dfc:     	bl	0x10124f7f8 <__Z17RNA_property_typeP11PropertyRNA>
101f46e00:     	ldr	x2, [sp, #0x8]
101f46e04:     	cmp	w0, #0x2
101f46e08:     	b.eq	0x101f46e20 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xb14>
101f46e0c:     	ldr	x0, [x20, #0x258]
101f46e10:     	bl	0x10124f7f8 <__Z17RNA_property_typeP11PropertyRNA>
101f46e14:     	ldr	x2, [sp, #0x8]
101f46e18:     	cmp	w0, #0x1
101f46e1c:     	b.ne	0x101f46d9c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa90>
101f46e20:     	ldr	x0, [x2, #0x40]
101f46e24:     	cbz	x0, 0x101f46e44 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xb38>
101f46e28:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101f46e2c:     	add	x8, x8, #0x690
101f46e30:     	ldr	x8, [x8]
101f46e34:     	mov	w1, #0x0                ; =0
101f46e38:     	blr	x8
101f46e3c:     	ldr	x2, [sp, #0x8]
101f46e40:     	str	xzr, [x2, #0x40]
101f46e44:     	add	x1, x2, #0x68
101f46e48:     	mov	x0, x20
101f46e4c:     	mov	x26, x2
101f46e50:     	bl	0x101f47348 <__ZL23ui_button_value_defaultP5uiButPd>
101f46e54:     	ldr	x28, [x26, #0x118]
101f46e58:     	cbnz	x28, 0x101f46e74 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xb68>
101f46e5c:     	mov	w8, #0x1                ; =1
101f46e60:     	ldr	x2, [sp, #0x8]
101f46e64:     	strb	w8, [x2, #0x129]
101f46e68:     	b	0x101f46d9c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa90>
101f46e6c:     	ldr	x28, [x28]
101f46e70:     	cbz	x28, 0x101f46e5c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xb50>
101f46e74:     	ldr	x8, [x28, #0x8]
101f46e78:     	ldr	x26, [x8, #0x8]
101f46e7c:     	add	x1, sp, #0x1a0
101f46e80:     	mov	x0, x26
101f46e84:     	bl	0x101f47348 <__ZL23ui_button_value_defaultP5uiButPd>
101f46e88:     	cbz	w0, 0x101f46e6c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xb60>
101f46e8c:     	ldr	d0, [sp, #0x1a0]
101f46e90:     	mov	x0, x26
101f46e94:     	bl	0x101f0e860 <__Z16ui_but_value_setP5uiButd>
101f46e98:     	b	0x101f46e6c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xb60>
101f46e9c:     	ldrh	w8, [x21, #0x10]
101f46ea0:     	mov	w9, #0x5024             ; =20516
101f46ea4:     	cmp	w8, w9
101f46ea8:     	b.ne	0x101f46eb8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xbac>
101f46eac:     	ldrh	w8, [x21, #0x12]
101f46eb0:     	cmp	w8, #0x1
101f46eb4:     	b.eq	0x101f46cb8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9ac>
101f46eb8:     	cmp	w27, #0x9
101f46ebc:     	b.hi	0x101f46cb8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9ac>
101f46ec0:     	mov	w8, #0x1                ; =1
101f46ec4:     	lsl	w8, w8, w27
101f46ec8:     	mov	w9, #0x203              ; =515
101f46ecc:     	tst	w8, w9
101f46ed0:     	b.eq	0x101f46cb8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9ac>
101f46ed4:     	mov	x0, x22
101f46ed8:     	mov	x1, x21
101f46edc:     	bl	0x101f72eb8 <__Z22ui_but_find_mouse_overPK7ARegionPK7wmEvent>
101f46ee0:     	cmp	x0, x20
101f46ee4:     	b.ne	0x101f46cb8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0x9ac>
101f46ee8:     	mov	x0, x19
101f46eec:     	mov	x1, x22
101f46ef0:     	mov	x2, x20
101f46ef4:     	mov	w3, #0x0                ; =0
101f46ef8:     	b	0x101f46dd8 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xacc>
101f46efc:     	mov	x0, x20
101f46f00:     	bl	0x101f72608 <__Z26ui_but_is_editable_as_textPK5uiBut>
101f46f04:     	cbz	w0, 0x101f46d60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa54>
101f46f08:     	mov	x0, x19
101f46f0c:     	mov	x1, x22
101f46f10:     	mov	x2, x20
101f46f14:     	mov	w3, #0x3                ; =3
101f46f18:     	bl	0x101f39638 <__ZL25ui_handle_button_activateP8bContextP7ARegionP5uiBut20uiButtonActivateType>
101f46f1c:     	b	0x101f46d60 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xa54>
101f46f20:     	b	0x101f46f40 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xc34>
101f46f24:     	b	0x101f46f40 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xc34>
101f46f28:     	b	0x101f46f40 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xc34>
101f46f2c:     	b	0x101f46f40 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xc34>
101f46f30:     	mov	x19, x0
101f46f34:     	add	x0, sp, #0x18
101f46f38:     	bl	0x101f2f620 <__ZN14uiIPadHUDFieldD1Ev>
101f46f3c:     	b	0x101f46f44 <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut+0xc38>
101f46f40:     	mov	x19, x0
101f46f44:     	add	x0, sp, #0x1a0
101f46f48:     	bl	0x101f2f620 <__ZN14uiIPadHUDFieldD1Ev>
101f46f4c:     	mov	x0, x19
101f46f50:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
