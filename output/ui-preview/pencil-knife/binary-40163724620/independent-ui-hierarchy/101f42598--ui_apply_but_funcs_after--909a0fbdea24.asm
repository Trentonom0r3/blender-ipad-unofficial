
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f42598 <__ZL24ui_apply_but_funcs_afterP8bContext>:
101f42598:     	stp	x28, x27, [sp, #-0x60]!
101f4259c:     	stp	x26, x25, [sp, #0x10]
101f425a0:     	stp	x24, x23, [sp, #0x20]
101f425a4:     	stp	x22, x21, [sp, #0x30]
101f425a8:     	stp	x20, x19, [sp, #0x40]
101f425ac:     	stp	x29, x30, [sp, #0x50]
101f425b0:     	add	x29, sp, #0x50
101f425b4:     	mov	w9, #0x1000             ; =4096
101f425b8:     	adrp	x16, 0x106365000 <_zlibVersion+0x106365000>
101f425bc:     	ldr	x16, [x16, #0x758]
101f425c0:     	blr	x16
101f425c4:     	sub	sp, sp, #0x1, lsl #12   ; =0x1000
101f425c8:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
101f425cc:     	ldr	x8, [x8, #0x7f0]
101f425d0:     	ldr	x8, [x8]
101f425d4:     	stur	x8, [x29, #-0x68]
101f425d8:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f425dc:     	add	x8, x8, #0x2d8
101f425e0:     	str	x0, [sp, #0x70]
101f425e4:     	ldr	q0, [x8]
101f425e8:     	str	q0, [sp, #0x60]
101f425ec:     	stp	xzr, xzr, [x8]
101f425f0:     	ldr	x24, [sp, #0x60]
101f425f4:     	cbz	x24, 0x101f43500 <__ZL24ui_apply_but_funcs_afterP8bContext+0xf68>
101f425f8:     	add	x8, sp, #0x200
101f425fc:     	add	x27, sp, #0x578
101f42600:     	add	x9, sp, #0x520
101f42604:     	add	x21, x9, #0x30
101f42608:     	add	x22, x9, #0x50
101f4260c:     	add	x10, x27, #0x348
101f42610:     	add	x9, x27, #0x5c0
101f42614:     	stp	x9, x10, [sp, #0x10]
101f42618:     	add	x8, x8, #0x17c
101f4261c:     	str	x8, [sp, #0x8]
101f42620:     	adrp	x20, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101f42624:     	add	x20, x20, #0x690
101f42628:     	b	0x101f4263c <__ZL24ui_apply_but_funcs_afterP8bContext+0xa4>
101f4262c:     	add	x0, sp, #0x578
101f42630:     	bl	0x101f440a0 <__ZN11uiAfterFuncD2Ev>
101f42634:     	mov	x24, x19
101f42638:     	cbz	x19, 0x101f43500 <__ZL24ui_apply_but_funcs_afterP8bContext+0xf68>
101f4263c:     	ldr	x19, [x24]
101f42640:     	add	x0, sp, #0x578
101f42644:     	mov	x1, x24
101f42648:     	bl	0x101f43890 <__ZN11uiAfterFuncC2ERKS_>
101f4264c:     	add	x0, sp, #0x60
101f42650:     	mov	x1, x24
101f42654:     	bl	0x10078fe64 <__Z11BLI_remlinkP8ListBasePv>
101f42658:     	mov	x0, x24
101f4265c:     	bl	0x101f440a0 <__ZN11uiAfterFuncD2Ev>
101f42660:     	ldr	x8, [x20]
101f42664:     	mov	w1, #0x1                ; =1
101f42668:     	blr	x8
101f4266c:     	ldr	x0, [sp, #0x70]
101f42670:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f42674:     	mov	x23, x0
101f42678:     	ldr	x0, [sp, #0x70]
101f4267c:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
101f42680:     	mov	x24, x0
101f42684:     	ldrb	w8, [sp, #0x6d0]
101f42688:     	cmp	w8, #0x1
101f4268c:     	b.ne	0x101f426a4 <__ZL24ui_apply_but_funcs_afterP8bContext+0x10c>
101f42690:     	ldr	x0, [sp, #0x70]
101f42694:     	add	x1, x27, #0xe8
101f42698:     	bl	0x101f8f618 <__Z28ui_ipad_action_origin_rebindP8bContextRKN7blender2ui4ipad12ActionOriginE>
101f4269c:     	ldrb	w8, [sp, #0x6d0]
101f426a0:     	b	0x101f426a8 <__ZL24ui_apply_but_funcs_afterP8bContext+0x110>
101f426a4:     	mov	w0, #0x1                ; =1
101f426a8:     	strb	w0, [sp, #0x5f]
101f426ac:     	ldr	x9, [sp, #0x70]
101f426b0:     	stp	x9, x23, [sp, #0x38]
101f426b4:     	str	x24, [sp, #0x48]
101f426b8:     	strb	w8, [sp, #0x50]
101f426bc:     	add	x8, sp, #0x5f
101f426c0:     	str	x8, [sp, #0x20]
101f426c4:     	add	x8, sp, #0x70
101f426c8:     	stp	x8, x27, [sp, #0x28]
101f426cc:     	ldrb	w8, [sp, #0xaf0]
101f426d0:     	cmp	w8, #0x1
101f426d4:     	b.ne	0x101f42708 <__ZL24ui_apply_but_funcs_afterP8bContext+0x170>
101f426d8:     	add	x0, sp, #0x20
101f426dc:     	bl	0x101f43670 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv>
101f426e0:     	cbz	w0, 0x101f42708 <__ZL24ui_apply_but_funcs_afterP8bContext+0x170>
101f426e4:     	ldrb	w8, [sp, #0xaf0]
101f426e8:     	tbz	w8, #0x0, 0x101f43540 <__ZL24ui_apply_but_funcs_afterP8bContext+0xfa8>
101f426ec:     	ldr	x0, [sp, #0x70]
101f426f0:     	add	x1, x27, #0x550
101f426f4:     	bl	0x1000b1c50 <__Z13CTX_store_setP8bContextPK13bContextStore>
101f426f8:     	mov	w24, #0x1               ; =1
101f426fc:     	ldr	x8, [sp, #0x640]
101f42700:     	cbnz	x8, 0x101f42714 <__ZL24ui_apply_but_funcs_afterP8bContext+0x17c>
101f42704:     	b	0x101f42770 <__ZL24ui_apply_but_funcs_afterP8bContext+0x1d8>
101f42708:     	mov	w24, #0x0               ; =0
101f4270c:     	ldr	x8, [sp, #0x640]
101f42710:     	cbz	x8, 0x101f42770 <__ZL24ui_apply_but_funcs_afterP8bContext+0x1d8>
101f42714:     	add	x0, sp, #0x20
101f42718:     	bl	0x101f43670 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv>
101f4271c:     	cbz	w0, 0x101f42770 <__ZL24ui_apply_but_funcs_afterP8bContext+0x1d8>
101f42720:     	ldr	x8, [sp, #0x6c8]
101f42724:     	cbz	x8, 0x101f42754 <__ZL24ui_apply_but_funcs_afterP8bContext+0x1bc>
101f42728:     	ldr	x0, [sp, #0x70]
101f4272c:     	ldr	x2, [sp, #0x848]
101f42730:     	add	x1, x27, #0xe8
101f42734:     	bl	0x101f34c80 <__Z32ui_ipad_registered_popup_resolveP8bContextRKN7blender2ui4ipad12ActionOriginEy>
101f42738:     	cbz	x0, 0x101f42770 <__ZL24ui_apply_but_funcs_afterP8bContext+0x1d8>
101f4273c:     	ldr	x1, [x0, #0x270]
101f42740:     	ldr	x8, [sp, #0x640]
101f42744:     	cmp	x1, x8
101f42748:     	b.ne	0x101f42770 <__ZL24ui_apply_but_funcs_afterP8bContext+0x1d8>
101f4274c:     	cbnz	x1, 0x101f4275c <__ZL24ui_apply_but_funcs_afterP8bContext+0x1c4>
101f42750:     	b	0x101f42770 <__ZL24ui_apply_but_funcs_afterP8bContext+0x1d8>
101f42754:     	ldr	x1, [sp, #0x640]
101f42758:     	cbz	x1, 0x101f42770 <__ZL24ui_apply_but_funcs_afterP8bContext+0x1d8>
101f4275c:     	ldr	x8, [x1, #0x58]
101f42760:     	ldr	x8, [x8, #0x30]
101f42764:     	cbz	x8, 0x101f42770 <__ZL24ui_apply_but_funcs_afterP8bContext+0x1d8>
101f42768:     	ldr	x0, [sp, #0x70]
101f4276c:     	blr	x8
101f42770:     	str	xzr, [sp, #0x528]
101f42774:     	str	xzr, [sp, #0x520]
101f42778:     	str	xzr, [sp, #0x530]
101f4277c:     	str	x21, [sp, #0x538]
101f42780:     	str	x21, [sp, #0x540]
101f42784:     	str	x22, [sp, #0x548]
101f42788:     	ldr	x8, [sp, #0x658]
101f4278c:     	cbz	x8, 0x101f427dc <__ZL24ui_apply_but_funcs_afterP8bContext+0x244>
101f42790:     	ldr	q0, [x8]
101f42794:     	ldr	x9, [x8, #0x10]
101f42798:     	str	x9, [sp, #0x530]
101f4279c:     	str	q0, [sp, #0x520]
101f427a0:     	add	x9, sp, #0x520
101f427a4:     	add	x0, x9, #0x18
101f427a8:     	add	x1, x8, #0x18
101f427ac:     	bl	0x100020504 <__ZN7blender21copy_assign_containerINS_6VectorI18AncestorPointerRNALx2ENS_16GuardedAllocatorEEEEERT_S6_RKS5_>
101f427b0:     	ldr	x23, [sp, #0x658]
101f427b4:     	cbz	x23, 0x101f427dc <__ZL24ui_apply_but_funcs_afterP8bContext+0x244>
101f427b8:     	ldr	x0, [x23, #0x18]
101f427bc:     	add	x8, x23, #0x30
101f427c0:     	cmp	x0, x8
101f427c4:     	b.eq	0x101f427cc <__ZL24ui_apply_but_funcs_afterP8bContext+0x234>
101f427c8:     	bl	0x100ae425c <_MEM_freeN>
101f427cc:     	ldr	x8, [x20]
101f427d0:     	mov	x0, x23
101f427d4:     	mov	w1, #0x1                ; =1
101f427d8:     	blr	x8
101f427dc:     	ldrb	w8, [sp, #0x720]
101f427e0:     	cmp	w8, #0x1
101f427e4:     	b.ne	0x101f42868 <__ZL24ui_apply_but_funcs_afterP8bContext+0x2d0>
101f427e8:     	ldr	x0, [sp, #0x70]
101f427ec:     	add	x1, x27, #0x2e0
101f427f0:     	bl	0x101f8f008 <__Z23UI_ipad_context_matchesP8bContextPKy>
101f427f4:     	cbz	w0, 0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f427f8:     	ldr	x0, [sp, #0x70]
101f427fc:     	add	x8, sp, #0xe60
101f42800:     	bl	0x101f8f56c <__Z26ui_ipad_ring_tool_identityPK8bContext>
101f42804:     	ldrb	w8, [sp, #0xe77]
101f42808:     	sxtb	w23, w8
101f4280c:     	ldr	x9, [sp, #0xe68]
101f42810:     	cmp	w23, #0x0
101f42814:     	csel	x2, x9, x8, lt
101f42818:     	ldrb	w9, [sp, #0x8d7]
101f4281c:     	sxtb	w8, w9
101f42820:     	ldr	x10, [sp, #0x8c8]
101f42824:     	cmp	w8, #0x0
101f42828:     	csel	x9, x10, x9, lt
101f4282c:     	cmp	x2, x9
101f42830:     	b.ne	0x101f42870 <__ZL24ui_apply_but_funcs_afterP8bContext+0x2d8>
101f42834:     	ldr	x9, [sp, #0xe60]
101f42838:     	cmp	w23, #0x0
101f4283c:     	add	x10, sp, #0xe60
101f42840:     	csel	x0, x9, x10, lt
101f42844:     	ldr	x9, [sp, #0x8c0]
101f42848:     	cmp	w8, #0x0
101f4284c:     	ldr	x8, [sp, #0x18]
101f42850:     	csel	x1, x9, x8, lt
101f42854:     	bl	0x104b72368 <_zlibVersion+0x104b72368>
101f42858:     	cmp	w0, #0x0
101f4285c:     	cset	w25, eq
101f42860:     	tbz	w23, #0x1f, 0x101f42880 <__ZL24ui_apply_but_funcs_afterP8bContext+0x2e8>
101f42864:     	b	0x101f42878 <__ZL24ui_apply_but_funcs_afterP8bContext+0x2e0>
101f42868:     	mov	w25, #0x1               ; =1
101f4286c:     	b	0x101f42884 <__ZL24ui_apply_but_funcs_afterP8bContext+0x2ec>
101f42870:     	mov	w25, #0x0               ; =0
101f42874:     	tbz	w23, #0x1f, 0x101f42880 <__ZL24ui_apply_but_funcs_afterP8bContext+0x2e8>
101f42878:     	ldr	x0, [sp, #0xe60]
101f4287c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f42880:     	ldrb	w8, [sp, #0x720]
101f42884:     	eor	w8, w8, #0x1
101f42888:     	and	w0, w8, w25
101f4288c:     	tbnz	w8, #0x0, 0x101f4289c <__ZL24ui_apply_but_funcs_afterP8bContext+0x304>
101f42890:     	cbz	w25, 0x101f4289c <__ZL24ui_apply_but_funcs_afterP8bContext+0x304>
101f42894:     	ldr	x0, [sp, #0x70]
101f42898:     	bl	0x100b54460 <__Z23WM_event_ipad_mode_safeP8bContext>
101f4289c:     	ldr	x8, [sp, #0x648]
101f428a0:     	cbz	x8, 0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f428a4:     	tbz	w0, #0x0, 0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f428a8:     	add	x0, sp, #0x20
101f428ac:     	bl	0x101f43670 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv>
101f428b0:     	cbz	w0, 0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f428b4:     	ldr	x8, [sp, #0x6c8]
101f428b8:     	cbz	x8, 0x101f428d0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x338>
101f428bc:     	add	x0, x27, #0x2a0
101f428c0:     	bl	0x101f3764c <__ZL24ui_ipad_operator_resolveRK21uiIPadOperatorReceipt>
101f428c4:     	mov	x26, x0
101f428c8:     	cbnz	x26, 0x101f428d8 <__ZL24ui_apply_but_funcs_afterP8bContext+0x340>
101f428cc:     	b	0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f428d0:     	ldr	x26, [sp, #0x648]
101f428d4:     	cbz	x26, 0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f428d8:     	ldr	x25, [sp, #0x70]
101f428dc:     	ldr	x28, [sp, #0x658]
101f428e0:     	ldr	x8, [sp, #0x6c8]
101f428e4:     	cmp	x28, #0x0
101f428e8:     	add	x9, sp, #0x520
101f428ec:     	csel	x9, xzr, x9, eq
101f428f0:     	str	x9, [sp, #0xe60]
101f428f4:     	cbz	x8, 0x101f429f4 <__ZL24ui_apply_but_funcs_afterP8bContext+0x45c>
101f428f8:     	ldrb	w8, [sp, #0x808]
101f428fc:     	cmp	w8, #0x1
101f42900:     	b.ne	0x101f429f4 <__ZL24ui_apply_but_funcs_afterP8bContext+0x45c>
101f42904:     	ldr	x23, [x26, #0x8]
101f42908:     	cbz	x23, 0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f4290c:     	mov	x0, x23
101f42910:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f42914:     	add	x1, x1, #0x8ee
101f42918:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f4291c:     	cbz	w0, 0x101f4296c <__ZL24ui_apply_but_funcs_afterP8bContext+0x3d4>
101f42920:     	mov	x0, x23
101f42924:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f42928:     	add	x1, x1, #0x901
101f4292c:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f42930:     	cbz	w0, 0x101f4296c <__ZL24ui_apply_but_funcs_afterP8bContext+0x3d4>
101f42934:     	mov	x0, x23
101f42938:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f4293c:     	add	x1, x1, #0x919
101f42940:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f42944:     	cbz	w0, 0x101f43098 <__ZL24ui_apply_but_funcs_afterP8bContext+0xb00>
101f42948:     	mov	x0, x23
101f4294c:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f42950:     	add	x1, x1, #0x92d
101f42954:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f42958:     	cmp	w0, #0x0
101f4295c:     	cset	w8, eq
101f42960:     	lsl	w23, w8, #2
101f42964:     	cbnz	w23, 0x101f42974 <__ZL24ui_apply_but_funcs_afterP8bContext+0x3dc>
101f42968:     	b	0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f4296c:     	mov	w23, #0x1               ; =1
101f42970:     	cbz	w23, 0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f42974:     	ldrb	w8, [sp, #0x650]
101f42978:     	cmp	w8, #0x7
101f4297c:     	b.ne	0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f42980:     	ldr	x8, [sp, #0x810]
101f42984:     	cbz	x8, 0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f42988:     	ldrh	w8, [x26, #0xe4]
101f4298c:     	cbnz	w8, 0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f42990:     	ldr	x8, [x26, #0x28]
101f42994:     	cbz	x8, 0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f42998:     	ldr	x8, [x26, #0x38]
101f4299c:     	cbnz	x8, 0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f429a0:     	str	xzr, [sp, #0xcd8]
101f429a4:     	add	x1, sp, #0xcd8
101f429a8:     	mov	x0, x25
101f429ac:     	bl	0x101f2e4c4 <__Z28UI_ipad_view_navigation_maskP8bContextPy>
101f429b0:     	tst	w0, w23
101f429b4:     	b.eq	0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f429b8:     	ldr	x8, [sp, #0xcd8]
101f429bc:     	ldr	x9, [sp, #0x810]
101f429c0:     	cmp	x8, x9
101f429c4:     	b.ne	0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f429c8:     	cmp	w23, #0x4
101f429cc:     	b.ne	0x101f432cc <__ZL24ui_apply_but_funcs_afterP8bContext+0xd34>
101f429d0:     	add	x1, sp, #0xcd8
101f429d4:     	mov	x0, x25
101f429d8:     	bl	0x101f2e4c4 <__Z28UI_ipad_view_navigation_maskP8bContextPy>
101f429dc:     	tst	w0, w23
101f429e0:     	b.eq	0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f429e4:     	ldr	x8, [sp, #0xcd8]
101f429e8:     	ldr	x9, [sp, #0x810]
101f429ec:     	cmp	x8, x9
101f429f0:     	b.ne	0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f429f4:     	add	x0, sp, #0xe60
101f429f8:     	add	x1, x27, #0xe8
101f429fc:     	bl	0x101f8f07c <__ZN23uiIPadActionOriginScopeC1ERKN7blender2ui4ipad12ActionOriginE>
101f42a00:     	ldr	x28, [sp, #0x658]
101f42a04:     	ldr	x8, [sp, #0x798]
101f42a08:     	cmp	x28, #0x0
101f42a0c:     	add	x9, sp, #0x520
101f42a10:     	csel	x2, xzr, x9, eq
101f42a14:     	ldrb	w9, [sp, #0x7a7]
101f42a18:     	sxtb	w10, w9
101f42a1c:     	cmp	w10, #0x0
101f42a20:     	csel	x8, x8, x9, lt
101f42a24:     	cbz	x8, 0x101f42a5c <__ZL24ui_apply_but_funcs_afterP8bContext+0x4c4>
101f42a28:     	ldr	x8, [sp, #0x728]
101f42a2c:     	cbz	x8, 0x101f42a5c <__ZL24ui_apply_but_funcs_afterP8bContext+0x4c4>
101f42a30:     	ldr	x8, [sp, #0x730]
101f42a34:     	cbz	x8, 0x101f42a5c <__ZL24ui_apply_but_funcs_afterP8bContext+0x4c4>
101f42a38:     	ldr	x8, [x26, #0x8]
101f42a3c:     	cbz	x8, 0x101f42a5c <__ZL24ui_apply_but_funcs_afterP8bContext+0x4c4>
101f42a40:     	ldr	x8, [x26, #0xa0]
101f42a44:     	cbnz	x8, 0x101f42a5c <__ZL24ui_apply_but_funcs_afterP8bContext+0x4c4>
101f42a48:     	ldr	x23, [sp, #0x70]
101f42a4c:     	mov	x0, x23
101f42a50:     	mov	x1, x26
101f42a54:     	bl	0x100b7dd58 <__Z29WM_operator_depends_on_cursorR8bContextR14wmOperatorTypeP10PointerRNA>
101f42a58:     	tbz	w0, #0x0, 0x101f42fb0 <__ZL24ui_apply_but_funcs_afterP8bContext+0xa18>
101f42a5c:     	ldr	x0, [sp, #0x70]
101f42a60:     	ldrsb	w2, [sp, #0x650]
101f42a64:     	ldrb	w8, [sp, #0xb4f]
101f42a68:     	sxtb	w9, w8
101f42a6c:     	ldr	x10, [sp, #0x658]
101f42a70:     	ldr	x11, [sp, #0xb38]
101f42a74:     	ldr	x12, [sp, #0xb40]
101f42a78:     	cmp	w9, #0x0
101f42a7c:     	ldr	x9, [sp, #0x10]
101f42a80:     	csel	x5, x11, x9, lt
101f42a84:     	csel	x6, x12, x8, lt
101f42a88:     	cmp	x10, #0x0
101f42a8c:     	add	x8, sp, #0x520
101f42a90:     	csel	x3, xzr, x8, eq
101f42a94:     	mov	x1, x26
101f42a98:     	mov	x4, #0x0                ; =0
101f42a9c:     	bl	0x100b4f3b8 <__Z48WM_operator_name_call_ptr_with_depends_on_cursorP8bContextP14wmOperatorTypeN7blender2wm13OpCallContextEP10PointerRNAPK7wmEventNS3_9StringRefE>
101f42aa0:     	ldrb	w8, [sp, #0x8f7]
101f42aa4:     	sxtb	w9, w8
101f42aa8:     	ldr	x10, [sp, #0x8e8]
101f42aac:     	cmp	w9, #0x0
101f42ab0:     	csel	x8, x10, x8, lt
101f42ab4:     	cbz	x8, 0x101f42ad0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x538>
101f42ab8:     	ldr	x0, [sp, #0x70]
101f42abc:     	ldr	x4, [sp, #0x8d8]
101f42ac0:     	add	x1, x27, #0x2e0
101f42ac4:     	add	x3, x27, #0x368
101f42ac8:     	ldr	x2, [sp, #0x18]
101f42acc:     	bl	0x101f93f44 <__Z29ui_ipad_ring_selection_rebaseP8bContextPKyRKNSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEESB_y>
101f42ad0:     	ldrb	w8, [sp, #0x720]
101f42ad4:     	cmp	w8, #0x1
101f42ad8:     	b.ne	0x101f42ae8 <__ZL24ui_apply_but_funcs_afterP8bContext+0x550>
101f42adc:     	mov	w0, #0x100a0000         ; =269090816
101f42ae0:     	mov	x1, #0x0                ; =0
101f42ae4:     	bl	0x100b4d89c <__Z20WM_main_add_notifierjPv>
101f42ae8:     	add	x0, sp, #0xe60
101f42aec:     	bl	0x101f8f114 <__ZN23uiIPadActionOriginScopeD1Ev>
101f42af0:     	ldr	x8, [sp, #0x658]
101f42af4:     	cbz	x8, 0x101f42b00 <__ZL24ui_apply_but_funcs_afterP8bContext+0x568>
101f42af8:     	add	x0, sp, #0x520
101f42afc:     	bl	0x100b7f6e8 <__Z27WM_operator_properties_freeP10PointerRNA>
101f42b00:     	ldr	x8, [sp, #0x908]
101f42b04:     	cbz	x8, 0x101f42b24 <__ZL24ui_apply_but_funcs_afterP8bContext+0x58c>
101f42b08:     	add	x0, sp, #0x20
101f42b0c:     	bl	0x101f43670 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv>
101f42b10:     	cbz	w0, 0x101f42b24 <__ZL24ui_apply_but_funcs_afterP8bContext+0x58c>
101f42b14:     	ldr	x0, [sp, #0x70]
101f42b18:     	ldr	x2, [sp, #0x950]
101f42b1c:     	add	x1, x27, #0x380
101f42b20:     	bl	0x101253864 <__Z19RNA_property_updateP8bContextP10PointerRNAP11PropertyRNA>
101f42b24:     	cbz	w24, 0x101f42b34 <__ZL24ui_apply_but_funcs_afterP8bContext+0x59c>
101f42b28:     	ldr	x0, [sp, #0x70]
101f42b2c:     	mov	x1, #0x0                ; =0
101f42b30:     	bl	0x1000b1c50 <__Z13CTX_store_setP8bContextPK13bContextStore>
101f42b34:     	ldr	x8, [sp, #0x608]
101f42b38:     	cbz	x8, 0x101f42b60 <__ZL24ui_apply_but_funcs_afterP8bContext+0x5c8>
101f42b3c:     	add	x0, sp, #0x20
101f42b40:     	bl	0x101f43670 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv>
101f42b44:     	cbz	w0, 0x101f42b60 <__ZL24ui_apply_but_funcs_afterP8bContext+0x5c8>
101f42b48:     	ldr	x0, [sp, #0x608]
101f42b4c:     	cbz	x0, 0x101f43538 <__ZL24ui_apply_but_funcs_afterP8bContext+0xfa0>
101f42b50:     	ldr	x8, [x0]
101f42b54:     	ldr	x8, [x8, #0x30]
101f42b58:     	add	x1, x27, #0x98
101f42b5c:     	blr	x8
101f42b60:     	ldr	x8, [sp, #0x588]
101f42b64:     	cbz	x8, 0x101f42be4 <__ZL24ui_apply_but_funcs_afterP8bContext+0x64c>
101f42b68:     	add	x0, sp, #0x20
101f42b6c:     	bl	0x101f43670 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv>
101f42b70:     	cbz	w0, 0x101f42be4 <__ZL24ui_apply_but_funcs_afterP8bContext+0x64c>
101f42b74:     	ldrb	w8, [sp, #0x850]
101f42b78:     	cmp	w8, #0x1
101f42b7c:     	b.ne	0x101f42bd0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x638>
101f42b80:     	ldr	x0, [sp, #0x70]
101f42b84:     	ldr	x2, [sp, #0x848]
101f42b88:     	add	x1, x27, #0xe8
101f42b8c:     	bl	0x101f34c80 <__Z32ui_ipad_registered_popup_resolveP8bContextRKN7blender2ui4ipad12ActionOriginEy>
101f42b90:     	mov	x23, x0
101f42b94:     	cbz	x0, 0x101f42be4 <__ZL24ui_apply_but_funcs_afterP8bContext+0x64c>
101f42b98:     	ldr	x0, [sp, #0x588]
101f42b9c:     	bl	0x100b82708 <__Z31UI_ipad_numbers_dialog_callbackPFvP8bContextPvS1_E>
101f42ba0:     	cbz	w0, 0x101f42be4 <__ZL24ui_apply_but_funcs_afterP8bContext+0x64c>
101f42ba4:     	ldr	x1, [x23, #0x210]
101f42ba8:     	ldr	x8, [sp, #0x590]
101f42bac:     	cmp	x1, x8
101f42bb0:     	b.ne	0x101f42be4 <__ZL24ui_apply_but_funcs_afterP8bContext+0x64c>
101f42bb4:     	ldr	x8, [x23, #0x1e0]
101f42bb8:     	ldr	x8, [x8, #0x128]
101f42bbc:     	ldr	x2, [x8, #0x260]
101f42bc0:     	ldr	x8, [sp, #0x588]
101f42bc4:     	ldr	x0, [sp, #0x70]
101f42bc8:     	blr	x8
101f42bcc:     	b	0x101f42be4 <__ZL24ui_apply_but_funcs_afterP8bContext+0x64c>
101f42bd0:     	ldr	x0, [sp, #0x70]
101f42bd4:     	ldr	x8, [sp, #0x588]
101f42bd8:     	ldr	x1, [sp, #0x590]
101f42bdc:     	ldr	x2, [sp, #0x598]
101f42be0:     	blr	x8
101f42be4:     	ldr	x8, [sp, #0x5b8]
101f42be8:     	cbz	x8, 0x101f42c10 <__ZL24ui_apply_but_funcs_afterP8bContext+0x678>
101f42bec:     	add	x0, sp, #0x20
101f42bf0:     	bl	0x101f43670 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv>
101f42bf4:     	cbz	w0, 0x101f42c10 <__ZL24ui_apply_but_funcs_afterP8bContext+0x678>
101f42bf8:     	ldr	x0, [sp, #0x5b8]
101f42bfc:     	cbz	x0, 0x101f43538 <__ZL24ui_apply_but_funcs_afterP8bContext+0xfa0>
101f42c00:     	ldr	x1, [sp, #0x70]
101f42c04:     	ldr	x8, [x0]
101f42c08:     	ldr	x8, [x8, #0x30]
101f42c0c:     	blr	x8
101f42c10:     	ldr	x8, [sp, #0x5c0]
101f42c14:     	cbz	x8, 0x101f42c38 <__ZL24ui_apply_but_funcs_afterP8bContext+0x6a0>
101f42c18:     	add	x0, sp, #0x20
101f42c1c:     	bl	0x101f43670 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv>
101f42c20:     	cbz	w0, 0x101f42c38 <__ZL24ui_apply_but_funcs_afterP8bContext+0x6a0>
101f42c24:     	ldr	x0, [sp, #0x70]
101f42c28:     	ldr	x1, [sp, #0x5c8]
101f42c2c:     	ldr	x8, [sp, #0x5c0]
101f42c30:     	ldr	x2, [sp, #0x598]
101f42c34:     	blr	x8
101f42c38:     	ldr	x0, [sp, #0x5c8]
101f42c3c:     	cbz	x0, 0x101f42c48 <__ZL24ui_apply_but_funcs_afterP8bContext+0x6b0>
101f42c40:     	ldr	x8, [sp, #0x5d0]
101f42c44:     	blr	x8
101f42c48:     	ldr	x8, [sp, #0x628]
101f42c4c:     	cbz	x8, 0x101f42c88 <__ZL24ui_apply_but_funcs_afterP8bContext+0x6f0>
101f42c50:     	add	x0, sp, #0x20
101f42c54:     	bl	0x101f43670 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv>
101f42c58:     	cbz	w0, 0x101f42c88 <__ZL24ui_apply_but_funcs_afterP8bContext+0x6f0>
101f42c5c:     	ldr	x26, [sp, #0x70]
101f42c60:     	ldr	x8, [sp, #0x628]
101f42c64:     	ldr	x24, [sp, #0x630]
101f42c68:     	adrp	x9, 0x101662000 <__Z29ED_undo_is_memfile_compatiblePK8bContext+0x44>
101f42c6c:     	add	x9, x9, #0x84c
101f42c70:     	cmp	x8, x9
101f42c74:     	b.eq	0x101f42d98 <__ZL24ui_apply_but_funcs_afterP8bContext+0x800>
101f42c78:     	ldr	w2, [sp, #0x638]
101f42c7c:     	mov	x0, x26
101f42c80:     	mov	x1, x24
101f42c84:     	blr	x8
101f42c88:     	ldr	x8, [sp, #0x5d8]
101f42c8c:     	cbz	x8, 0x101f42cb0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x718>
101f42c90:     	add	x0, sp, #0x20
101f42c94:     	bl	0x101f43670 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv>
101f42c98:     	cbz	w0, 0x101f42cb0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x718>
101f42c9c:     	ldr	x0, [sp, #0x70]
101f42ca0:     	ldr	x8, [sp, #0x5d8]
101f42ca4:     	ldr	x1, [sp, #0x5e0]
101f42ca8:     	ldr	x2, [sp, #0x5e8]
101f42cac:     	blr	x8
101f42cb0:     	ldr	x0, [sp, #0x5e8]
101f42cb4:     	cbz	x0, 0x101f42cbc <__ZL24ui_apply_but_funcs_afterP8bContext+0x724>
101f42cb8:     	bl	0x100ae425c <_MEM_freeN>
101f42cbc:     	ldr	x8, [sp, #0xa80]
101f42cc0:     	cbz	x8, 0x101f42ccc <__ZL24ui_apply_but_funcs_afterP8bContext+0x734>
101f42cc4:     	ldr	x0, [sp, #0xa78]
101f42cc8:     	blr	x8
101f42ccc:     	ldr	x8, [sp, #0xac0]
101f42cd0:     	cbz	x8, 0x101f42cf8 <__ZL24ui_apply_but_funcs_afterP8bContext+0x760>
101f42cd4:     	add	x0, sp, #0x20
101f42cd8:     	bl	0x101f43670 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv>
101f42cdc:     	mov	x3, x0
101f42ce0:     	ldr	x8, [sp, #0x70]
101f42ce4:     	cmp	w0, #0x0
101f42ce8:     	csel	x0, x8, xzr, ne
101f42cec:     	add	x1, x27, #0x510
101f42cf0:     	add	x2, x27, #0x548
101f42cf4:     	bl	0x101f38fc0 <__ZL28ui_block_interaction_releaseP8bContextP31uiBlockInteraction_CallbackDataRP25uiBlockInteraction_Handleb>
101f42cf8:     	add	x0, sp, #0x20
101f42cfc:     	bl	0x101f43670 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv>
101f42d00:     	cbz	w0, 0x101f42d34 <__ZL24ui_apply_but_funcs_afterP8bContext+0x79c>
101f42d04:     	ldr	x1, [sp, #0x950]
101f42d08:     	add	x0, x27, #0x380
101f42d0c:     	bl	0x101f2e2dc <__ZL17ui_rna_is_userdefP10PointerRNAP11PropertyRNA>
101f42d10:     	cbz	w0, 0x101f42d34 <__ZL24ui_apply_but_funcs_afterP8bContext+0x79c>
101f42d14:     	mov	w8, #0x1                ; =1
101f42d18:     	adrp	x9, 0x106d88000 <_build_commit_date>
101f42d1c:     	add	x9, x9, #0xe08
101f42d20:     	mov	w10, #0x3568            ; =13672
101f42d24:     	strb	w8, [x9, x10]
101f42d28:     	mov	w0, #0x2000000          ; =33554432
101f42d2c:     	mov	x1, #0x0                ; =0
101f42d30:     	bl	0x100b4d89c <__Z20WM_main_add_notifierjPv>
101f42d34:     	ldrb	w8, [sp, #0xaf8]
101f42d38:     	cbz	w8, 0x101f42d6c <__ZL24ui_apply_but_funcs_afterP8bContext+0x7d4>
101f42d3c:     	add	x0, sp, #0x20
101f42d40:     	bl	0x101f43670 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv>
101f42d44:     	cbz	w0, 0x101f42d6c <__ZL24ui_apply_but_funcs_afterP8bContext+0x7d4>
101f42d48:     	ldr	x0, [sp, #0x70]
101f42d4c:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101f42d50:     	bl	0x100b432ec <__Z23WM_operator_stack_clearP15wmWindowManager>
101f42d54:     	add	x0, sp, #0x20
101f42d58:     	bl	0x101f43670 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv>
101f42d5c:     	cbz	w0, 0x101f42d6c <__ZL24ui_apply_but_funcs_afterP8bContext+0x7d4>
101f42d60:     	ldr	x0, [sp, #0x70]
101f42d64:     	add	x1, x27, #0x580
101f42d68:     	bl	0x101661a3c <__Z12ED_undo_pushP8bContextPKc>
101f42d6c:     	ldr	x0, [sp, #0x538]
101f42d70:     	cmp	x0, x21
101f42d74:     	b.eq	0x101f42d7c <__ZL24ui_apply_but_funcs_afterP8bContext+0x7e4>
101f42d78:     	bl	0x100ae425c <_MEM_freeN>
101f42d7c:     	ldrb	w8, [sp, #0x50]
101f42d80:     	cmp	w8, #0x1
101f42d84:     	b.ne	0x101f4262c <__ZL24ui_apply_but_funcs_afterP8bContext+0x94>
101f42d88:     	ldp	x0, x1, [sp, #0x38]
101f42d8c:     	ldr	x2, [sp, #0x48]
101f42d90:     	bl	0x101f8f7a8 <__Z30ui_ipad_action_context_restoreP8bContextmm>
101f42d94:     	b	0x101f4262c <__ZL24ui_apply_but_funcs_afterP8bContext+0x94>
101f42d98:     	ldr	x9, [sp, #0x718]
101f42d9c:     	str	x9, [sp, #0x518]
101f42da0:     	adrp	x10, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f42da4:     	ldr	x10, [x10, #0x70]
101f42da8:     	cbz	x10, 0x101f42c78 <__ZL24ui_apply_but_funcs_afterP8bContext+0x6e0>
101f42dac:     	fmov	d0, x10
101f42db0:     	cnt.8b	v0, v0
101f42db4:     	uaddlv.8b	h0, v0
101f42db8:     	fmov	w11, s0
101f42dbc:     	cmp	x11, #0x1
101f42dc0:     	b.hi	0x101f42dd0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x838>
101f42dc4:     	sub	x12, x10, #0x1
101f42dc8:     	and	x12, x12, x9
101f42dcc:     	b	0x101f42de4 <__ZL24ui_apply_but_funcs_afterP8bContext+0x84c>
101f42dd0:     	mov	x12, x9
101f42dd4:     	cmp	x10, x9
101f42dd8:     	b.hi	0x101f42de4 <__ZL24ui_apply_but_funcs_afterP8bContext+0x84c>
101f42ddc:     	udiv	x12, x9, x10
101f42de0:     	msub	x12, x12, x10, x9
101f42de4:     	adrp	x13, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f42de8:     	ldr	x13, [x13, #0x68]
101f42dec:     	ldr	x13, [x13, x12, lsl #3]
101f42df0:     	cbz	x13, 0x101f42c78 <__ZL24ui_apply_but_funcs_afterP8bContext+0x6e0>
101f42df4:     	ldr	x13, [x13]
101f42df8:     	cbz	x13, 0x101f42c78 <__ZL24ui_apply_but_funcs_afterP8bContext+0x6e0>
101f42dfc:     	sub	x14, x10, #0x1
101f42e00:     	b	0x101f42e18 <__ZL24ui_apply_but_funcs_afterP8bContext+0x880>
101f42e04:     	ldr	x15, [x13, #0x10]
101f42e08:     	cmp	x15, x9
101f42e0c:     	b.eq	0x101f42e50 <__ZL24ui_apply_but_funcs_afterP8bContext+0x8b8>
101f42e10:     	ldr	x13, [x13]
101f42e14:     	cbz	x13, 0x101f42c78 <__ZL24ui_apply_but_funcs_afterP8bContext+0x6e0>
101f42e18:     	ldr	x15, [x13, #0x8]
101f42e1c:     	cmp	x15, x9
101f42e20:     	b.eq	0x101f42e04 <__ZL24ui_apply_but_funcs_afterP8bContext+0x86c>
101f42e24:     	cmp	x11, #0x1
101f42e28:     	b.hi	0x101f42e34 <__ZL24ui_apply_but_funcs_afterP8bContext+0x89c>
101f42e2c:     	and	x15, x15, x14
101f42e30:     	b	0x101f42e44 <__ZL24ui_apply_but_funcs_afterP8bContext+0x8ac>
101f42e34:     	cmp	x15, x10
101f42e38:     	b.lo	0x101f42e44 <__ZL24ui_apply_but_funcs_afterP8bContext+0x8ac>
101f42e3c:     	udiv	x16, x15, x10
101f42e40:     	msub	x15, x16, x10, x15
101f42e44:     	cmp	x15, x12
101f42e48:     	b.eq	0x101f42e10 <__ZL24ui_apply_but_funcs_afterP8bContext+0x878>
101f42e4c:     	b	0x101f42c78 <__ZL24ui_apply_but_funcs_afterP8bContext+0x6e0>
101f42e50:     	add	x0, sp, #0xe60
101f42e54:     	add	x1, x13, #0x18
101f42e58:     	bl	0x101f368e0 <__ZN14uiIPadHUDFieldC2ERKS_>
101f42e5c:     	add	x8, sp, #0x200
101f42e60:     	ldrb	w25, [x8, #0xde5]
101f42e64:     	cmp	w25, #0x1
101f42e68:     	b.ne	0x101f43254 <__ZL24ui_apply_but_funcs_afterP8bContext+0xcbc>
101f42e6c:     	ldr	x8, [sp, #0xf30]
101f42e70:     	cmp	x8, x24
101f42e74:     	add	x24, sp, #0x200
101f42e78:     	b.ne	0x101f430a4 <__ZL24ui_apply_but_funcs_afterP8bContext+0xb0c>
101f42e7c:     	add	x1, sp, #0xe60
101f42e80:     	mov	x0, x26
101f42e84:     	mov	x2, #0x0                ; =0
101f42e88:     	mov	w3, #0x1                ; =1
101f42e8c:     	bl	0x101f2ec10 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b>
101f42e90:     	tbz	w0, #0x0, 0x101f430a4 <__ZL24ui_apply_but_funcs_afterP8bContext+0xb0c>
101f42e94:     	mov	x0, x26
101f42e98:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101f42e9c:     	ldr	x8, [x0, #0x5c0]
101f42ea0:     	ldr	x23, [x8, #0x68]
101f42ea4:     	cbnz	x23, 0x101f42eec <__ZL24ui_apply_but_funcs_afterP8bContext+0x954>
101f42ea8:     	add	x0, sp, #0xb50
101f42eac:     	add	x1, sp, #0xe60
101f42eb0:     	bl	0x101f368e0 <__ZN14uiIPadHUDFieldC2ERKS_>
101f42eb4:     	add	x1, sp, #0xb50
101f42eb8:     	mov	x0, x26
101f42ebc:     	bl	0x101f2f328 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField>
101f42ec0:     	ldrsb	w8, [sp, #0xcc7]
101f42ec4:     	tbnz	w8, #0x1f, 0x101f4321c <__ZL24ui_apply_but_funcs_afterP8bContext+0xc84>
101f42ec8:     	ldrsb	w8, [sp, #0xc9f]
101f42ecc:     	tbnz	w8, #0x1f, 0x101f4322c <__ZL24ui_apply_but_funcs_afterP8bContext+0xc94>
101f42ed0:     	ldrsb	w8, [sp, #0xc6f]
101f42ed4:     	tbnz	w8, #0x1f, 0x101f4323c <__ZL24ui_apply_but_funcs_afterP8bContext+0xca4>
101f42ed8:     	ldrsb	w8, [sp, #0xbf7]
101f42edc:     	tbz	w8, #0x1f, 0x101f43254 <__ZL24ui_apply_but_funcs_afterP8bContext+0xcbc>
101f42ee0:     	b	0x101f4324c <__ZL24ui_apply_but_funcs_afterP8bContext+0xcb4>
101f42ee4:     	ldr	x23, [x23]
101f42ee8:     	cbz	x23, 0x101f42ea8 <__ZL24ui_apply_but_funcs_afterP8bContext+0x910>
101f42eec:     	ldr	x8, [sp, #0xf30]
101f42ef0:     	cmp	x8, x23
101f42ef4:     	b.ne	0x101f42ee4 <__ZL24ui_apply_but_funcs_afterP8bContext+0x94c>
101f42ef8:     	ldr	x1, [sp, #0xf38]
101f42efc:     	mov	x0, x23
101f42f00:     	bl	0x100b42eec <__Z34WM_operator_touch_lifetime_matchesPK10wmOperatory>
101f42f04:     	tbz	w0, #0x0, 0x101f42ee4 <__ZL24ui_apply_but_funcs_afterP8bContext+0x94c>
101f42f08:     	mov	x0, x26
101f42f0c:     	mov	x1, x23
101f42f10:     	bl	0x1016625e0 <__Z23ED_undo_operator_repeatP8bContextP10wmOperator>
101f42f14:     	tbz	w0, #0x0, 0x101f43340 <__ZL24ui_apply_but_funcs_afterP8bContext+0xda8>
101f42f18:     	movi.16b	v0, #0x0
101f42f1c:     	stur	q0, [x24, #0xbc]
101f42f20:     	stp	q0, q0, [sp, #0x2a0]
101f42f24:     	stp	q0, q0, [sp, #0x280]
101f42f28:     	stp	q0, q0, [sp, #0x260]
101f42f2c:     	stp	q0, q0, [sp, #0x240]
101f42f30:     	stp	q0, q0, [sp, #0x220]
101f42f34:     	stp	q0, q0, [sp, #0x200]
101f42f38:     	stp	q0, q0, [x24, #0xd0]
101f42f3c:     	stp	q0, q0, [x24, #0xf0]
101f42f40:     	stp	q0, q0, [x24, #0x110]
101f42f44:     	stp	q0, q0, [x24, #0x130]
101f42f48:     	stp	q0, q0, [x24, #0x150]
101f42f4c:     	str	xzr, [x24, #0x170]
101f42f50:     	mov	w8, #-0x1               ; =-1
101f42f54:     	str	w8, [sp, #0x378]
101f42f58:     	ldr	x8, [sp, #0x8]
101f42f5c:     	stur	wzr, [x8, #0x7]
101f42f60:     	str	xzr, [x8]
101f42f64:     	add	x1, sp, #0xe60
101f42f68:     	add	x2, sp, #0x200
101f42f6c:     	mov	x0, x26
101f42f70:     	mov	w3, #0x0                ; =0
101f42f74:     	bl	0x101f2ec10 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b>
101f42f78:     	cbz	w0, 0x101f43364 <__ZL24ui_apply_but_funcs_afterP8bContext+0xdcc>
101f42f7c:     	add	x1, sp, #0x518
101f42f80:     	adrp	x0, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f42f84:     	add	x0, x0, #0x68
101f42f88:     	bl	0x101f3677c <__ZNSt3__113unordered_mapIy14uiIPadHUDFieldNS_4hashIyEENS_8equal_toIyEENS_9allocatorINS_4pairIKyS1_EEEEE4findB8ne190102ERS8_>
101f42f8c:     	cbz	x0, 0x101f43384 <__ZL24ui_apply_but_funcs_afterP8bContext+0xdec>
101f42f90:     	ldr	x8, [x0, #0x20]
101f42f94:     	ldr	x9, [sp, #0xe68]
101f42f98:     	cmp	x8, x9
101f42f9c:     	b.ne	0x101f43384 <__ZL24ui_apply_but_funcs_afterP8bContext+0xdec>
101f42fa0:     	add	x0, x0, #0x18
101f42fa4:     	add	x1, sp, #0x200
101f42fa8:     	bl	0x101f3731c <__ZN14uiIPadHUDFieldaSEOS_>
101f42fac:     	b	0x101f43384 <__ZL24ui_apply_but_funcs_afterP8bContext+0xdec>
101f42fb0:     	ldr	x25, [x26, #0x8]
101f42fb4:     	mov	x0, x25
101f42fb8:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f42fbc:     	add	x1, x1, #0xd0a
101f42fc0:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f42fc4:     	cbz	w0, 0x101f430e0 <__ZL24ui_apply_but_funcs_afterP8bContext+0xb48>
101f42fc8:     	mov	x0, x25
101f42fcc:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f42fd0:     	add	x1, x1, #0xd1f
101f42fd4:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f42fd8:     	cbz	w0, 0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f42fdc:     	mov	x0, x25
101f42fe0:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f42fe4:     	add	x1, x1, #0xa7e
101f42fe8:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f42fec:     	cbz	w0, 0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f42ff0:     	mov	x0, x25
101f42ff4:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f42ff8:     	add	x1, x1, #0xa9c
101f42ffc:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f43000:     	cbz	w0, 0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f43004:     	mov	x0, x25
101f43008:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f4300c:     	add	x1, x1, #0xaba
101f43010:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f43014:     	cbz	w0, 0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f43018:     	mov	x0, x25
101f4301c:     	adrp	x1, 0x104bd5000 <__ZL3hex+0x934d>
101f43020:     	add	x1, x1, #0x821
101f43024:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f43028:     	cbz	w0, 0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f4302c:     	mov	x0, x25
101f43030:     	adrp	x1, 0x104bd5000 <__ZL3hex+0x934d>
101f43034:     	add	x1, x1, #0x762
101f43038:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f4303c:     	cbz	w0, 0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f43040:     	mov	x0, x25
101f43044:     	adrp	x1, 0x104cf9000 <__ZL3hex+0x12d34d>
101f43048:     	add	x1, x1, #0x932
101f4304c:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f43050:     	cbz	w0, 0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f43054:     	mov	x0, x26
101f43058:     	bl	0x101f3841c <__ZL23ui_ipad_view_action_bitPK14wmOperatorType>
101f4305c:     	cbz	w0, 0x101f43390 <__ZL24ui_apply_but_funcs_afterP8bContext+0xdf8>
101f43060:     	ldr	x0, [sp, #0x70]
101f43064:     	ldrsb	w2, [sp, #0x650]
101f43068:     	ldr	x8, [sp, #0x658]
101f4306c:     	cmp	x8, #0x0
101f43070:     	add	x8, sp, #0x520
101f43074:     	csel	x3, xzr, x8, eq
101f43078:     	mov	x1, x26
101f4307c:     	mov	x4, #0x0                ; =0
101f43080:     	bl	0x100b4effc <__Z25WM_operator_name_call_ptrP8bContextP14wmOperatorTypeN7blender2wm13OpCallContextEP10PointerRNAPK7wmEvent>
101f43084:     	mov	x2, x0
101f43088:     	ldr	x0, [sp, #0x70]
101f4308c:     	add	x1, x27, #0x1b0
101f43090:     	bl	0x101f95660 <__Z25UI_ipad_ring_reopen_queueP8bContextRK23uiIPadRingReopenRequest16wmOperatorStatus>
101f43094:     	b	0x101f42aa0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x508>
101f43098:     	mov	w23, #0x2               ; =2
101f4309c:     	cbnz	w23, 0x101f42974 <__ZL24ui_apply_but_funcs_afterP8bContext+0x3dc>
101f430a0:     	b	0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f430a4:     	add	x0, sp, #0xcd8
101f430a8:     	add	x1, sp, #0xe60
101f430ac:     	bl	0x101f368e0 <__ZN14uiIPadHUDFieldC2ERKS_>
101f430b0:     	add	x1, sp, #0xcd8
101f430b4:     	mov	x0, x26
101f430b8:     	bl	0x101f2f328 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField>
101f430bc:     	ldrsb	w8, [sp, #0xe4f]
101f430c0:     	tbnz	w8, #0x1f, 0x101f431e4 <__ZL24ui_apply_but_funcs_afterP8bContext+0xc4c>
101f430c4:     	ldrsb	w8, [sp, #0xe27]
101f430c8:     	tbnz	w8, #0x1f, 0x101f431f4 <__ZL24ui_apply_but_funcs_afterP8bContext+0xc5c>
101f430cc:     	ldrsb	w8, [sp, #0xdf7]
101f430d0:     	tbnz	w8, #0x1f, 0x101f43204 <__ZL24ui_apply_but_funcs_afterP8bContext+0xc6c>
101f430d4:     	ldrsb	w8, [sp, #0xd7f]
101f430d8:     	tbz	w8, #0x1f, 0x101f43254 <__ZL24ui_apply_but_funcs_afterP8bContext+0xcbc>
101f430dc:     	b	0x101f43214 <__ZL24ui_apply_but_funcs_afterP8bContext+0xc7c>
101f430e0:     	cbz	x28, 0x101f42a5c <__ZL24ui_apply_but_funcs_afterP8bContext+0x4c4>
101f430e4:     	ldr	x8, [sp, #0x528]
101f430e8:     	ldr	x9, [x26, #0x88]
101f430ec:     	cmp	x8, x9
101f430f0:     	b.ne	0x101f42a5c <__ZL24ui_apply_but_funcs_afterP8bContext+0x4c4>
101f430f4:     	add	x0, sp, #0x520
101f430f8:     	adrp	x1, 0x104c0b000 <__ZL3hex+0x3f34d>
101f430fc:     	add	x1, x1, #0xe45
101f43100:     	bl	0x10124f538 <__Z24RNA_struct_find_propertyP10PointerRNAPKc>
101f43104:     	mov	x25, x0
101f43108:     	add	x0, sp, #0x520
101f4310c:     	adrp	x1, 0x104b7d000 <_zlibVersion+0x104b7d000>
101f43110:     	add	x1, x1, #0xf8a
101f43114:     	bl	0x10124f538 <__Z24RNA_struct_find_propertyP10PointerRNAPKc>
101f43118:     	cbz	x25, 0x101f42a5c <__ZL24ui_apply_but_funcs_afterP8bContext+0x4c4>
101f4311c:     	mov	x28, x0
101f43120:     	cbz	x0, 0x101f42a5c <__ZL24ui_apply_but_funcs_afterP8bContext+0x4c4>
101f43124:     	mov	x0, x25
101f43128:     	bl	0x10124f7f8 <__Z17RNA_property_typeP11PropertyRNA>
101f4312c:     	cmp	w0, #0x3
101f43130:     	b.ne	0x101f42a5c <__ZL24ui_apply_but_funcs_afterP8bContext+0x4c4>
101f43134:     	mov	x0, x28
101f43138:     	bl	0x10124f7f8 <__Z17RNA_property_typeP11PropertyRNA>
101f4313c:     	cmp	w0, #0x3
101f43140:     	b.ne	0x101f42a5c <__ZL24ui_apply_but_funcs_afterP8bContext+0x4c4>
101f43144:     	add	x0, sp, #0x520
101f43148:     	mov	x1, x25
101f4314c:     	bl	0x101257d48 <__Z26RNA_property_string_lengthP10PointerRNAP11PropertyRNA>
101f43150:     	cmp	w0, #0x7f
101f43154:     	b.gt	0x101f42a5c <__ZL24ui_apply_but_funcs_afterP8bContext+0x4c4>
101f43158:     	add	x0, sp, #0x520
101f4315c:     	mov	x1, x28
101f43160:     	bl	0x101257d48 <__Z26RNA_property_string_lengthP10PointerRNAP11PropertyRNA>
101f43164:     	cmp	w0, #0x7f
101f43168:     	b.gt	0x101f42a5c <__ZL24ui_apply_but_funcs_afterP8bContext+0x4c4>
101f4316c:     	add	x0, sp, #0x520
101f43170:     	add	x2, sp, #0xcd8
101f43174:     	mov	x1, x25
101f43178:     	bl	0x101257ce0 <__Z23RNA_property_string_getP10PointerRNAP11PropertyRNAPc>
101f4317c:     	add	x0, sp, #0x520
101f43180:     	add	x2, sp, #0xb50
101f43184:     	mov	x1, x28
101f43188:     	bl	0x101257ce0 <__Z23RNA_property_string_getP10PointerRNAP11PropertyRNAPc>
101f4318c:     	ldr	x8, [sp, #0xcd8]
101f43190:     	ldr	x9, [sp, #0xce0]
101f43194:     	mov	x10, #0x6977            ; =26999
101f43198:     	movk	x10, #0x646e, lsl #16
101f4319c:     	movk	x10, #0x776f, lsl #32
101f431a0:     	movk	x10, #0x772e, lsl #48
101f431a4:     	eor	x8, x8, x10
101f431a8:     	mov	x10, #0x726f            ; =29295
101f431ac:     	movk	x10, #0x736b, lsl #16
101f431b0:     	movk	x10, #0x6170, lsl #32
101f431b4:     	movk	x10, #0x6563, lsl #48
101f431b8:     	eor	x9, x9, x10
101f431bc:     	ldrb	w10, [sp, #0xce8]
101f431c0:     	orr	x8, x8, x9
101f431c4:     	orr	x8, x8, x10
101f431c8:     	cbnz	x8, 0x101f42a5c <__ZL24ui_apply_but_funcs_afterP8bContext+0x4c4>
101f431cc:     	add	x1, x27, #0x1b0
101f431d0:     	add	x2, sp, #0xb50
101f431d4:     	mov	x0, x23
101f431d8:     	bl	0x101f9550c <__Z36UI_ipad_ring_reopen_workspace_targetP8bContextR23uiIPadRingReopenRequestPKc>
101f431dc:     	tbz	w0, #0x0, 0x101f42a5c <__ZL24ui_apply_but_funcs_afterP8bContext+0x4c4>
101f431e0:     	b	0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f431e4:     	ldr	x0, [sp, #0xe38]
101f431e8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f431ec:     	ldrsb	w8, [sp, #0xe27]
101f431f0:     	tbz	w8, #0x1f, 0x101f430cc <__ZL24ui_apply_but_funcs_afterP8bContext+0xb34>
101f431f4:     	ldr	x0, [sp, #0xe10]
101f431f8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f431fc:     	ldrsb	w8, [sp, #0xdf7]
101f43200:     	tbz	w8, #0x1f, 0x101f430d4 <__ZL24ui_apply_but_funcs_afterP8bContext+0xb3c>
101f43204:     	ldr	x0, [sp, #0xde0]
101f43208:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f4320c:     	ldrsb	w8, [sp, #0xd7f]
101f43210:     	tbz	w8, #0x1f, 0x101f43254 <__ZL24ui_apply_but_funcs_afterP8bContext+0xcbc>
101f43214:     	ldr	x0, [sp, #0xd68]
101f43218:     	b	0x101f43250 <__ZL24ui_apply_but_funcs_afterP8bContext+0xcb8>
101f4321c:     	ldr	x0, [sp, #0xcb0]
101f43220:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f43224:     	ldrsb	w8, [sp, #0xc9f]
101f43228:     	tbz	w8, #0x1f, 0x101f42ed0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x938>
101f4322c:     	ldr	x0, [sp, #0xc88]
101f43230:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f43234:     	ldrsb	w8, [sp, #0xc6f]
101f43238:     	tbz	w8, #0x1f, 0x101f42ed8 <__ZL24ui_apply_but_funcs_afterP8bContext+0x940>
101f4323c:     	ldr	x0, [sp, #0xc58]
101f43240:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f43244:     	ldrsb	w8, [sp, #0xbf7]
101f43248:     	tbz	w8, #0x1f, 0x101f43254 <__ZL24ui_apply_but_funcs_afterP8bContext+0xcbc>
101f4324c:     	ldr	x0, [sp, #0xbe0]
101f43250:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f43254:     	add	x23, sp, #0x200
101f43258:     	ldrsb	w8, [x23, #0xdd7]
101f4325c:     	tbnz	w8, #0x1f, 0x101f43280 <__ZL24ui_apply_but_funcs_afterP8bContext+0xce8>
101f43260:     	ldrsb	w8, [x23, #0xdaf]
101f43264:     	tbnz	w8, #0x1f, 0x101f43290 <__ZL24ui_apply_but_funcs_afterP8bContext+0xcf8>
101f43268:     	ldrsb	w8, [sp, #0xf7f]
101f4326c:     	tbnz	w8, #0x1f, 0x101f432a0 <__ZL24ui_apply_but_funcs_afterP8bContext+0xd08>
101f43270:     	ldrsb	w8, [sp, #0xf07]
101f43274:     	tbnz	w8, #0x1f, 0x101f432b0 <__ZL24ui_apply_but_funcs_afterP8bContext+0xd18>
101f43278:     	tbnz	w25, #0x0, 0x101f42c88 <__ZL24ui_apply_but_funcs_afterP8bContext+0x6f0>
101f4327c:     	b	0x101f432bc <__ZL24ui_apply_but_funcs_afterP8bContext+0xd24>
101f43280:     	ldr	x0, [sp, #0xfc0]
101f43284:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f43288:     	ldrsb	w8, [x23, #0xdaf]
101f4328c:     	tbz	w8, #0x1f, 0x101f43268 <__ZL24ui_apply_but_funcs_afterP8bContext+0xcd0>
101f43290:     	ldr	x0, [sp, #0xf98]
101f43294:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f43298:     	ldrsb	w8, [sp, #0xf7f]
101f4329c:     	tbz	w8, #0x1f, 0x101f43270 <__ZL24ui_apply_but_funcs_afterP8bContext+0xcd8>
101f432a0:     	ldr	x0, [sp, #0xf68]
101f432a4:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f432a8:     	ldrsb	w8, [sp, #0xf07]
101f432ac:     	tbz	w8, #0x1f, 0x101f43278 <__ZL24ui_apply_but_funcs_afterP8bContext+0xce0>
101f432b0:     	ldr	x0, [sp, #0xef0]
101f432b4:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f432b8:     	tbnz	w25, #0x0, 0x101f42c88 <__ZL24ui_apply_but_funcs_afterP8bContext+0x6f0>
101f432bc:     	ldr	x26, [sp, #0x70]
101f432c0:     	ldr	x8, [sp, #0x628]
101f432c4:     	ldr	x24, [sp, #0x630]
101f432c8:     	b	0x101f42c78 <__ZL24ui_apply_but_funcs_afterP8bContext+0x6e0>
101f432cc:     	cbz	x28, 0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f432d0:     	ldr	x8, [sp, #0x528]
101f432d4:     	ldr	x9, [x26, #0x88]
101f432d8:     	cmp	x8, x9
101f432dc:     	b.ne	0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f432e0:     	ldr	x8, [sp, #0x530]
101f432e4:     	cbz	x8, 0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f432e8:     	add	x8, sp, #0xe60
101f432ec:     	str	x8, [sp, #0xb50]
101f432f0:     	cmp	w23, #0x2
101f432f4:     	b.eq	0x101f43470 <__ZL24ui_apply_but_funcs_afterP8bContext+0xed8>
101f432f8:     	cmp	w23, #0x1
101f432fc:     	b.ne	0x101f429d0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x438>
101f43300:     	add	x0, sp, #0xb50
101f43304:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f43308:     	add	x1, x1, #0xced
101f4330c:     	bl	0x101f44018 <__ZZL29ui_ipad_view_dispatch_allowedP8bContextRK11uiAfterFuncP14wmOperatorTypeP10PointerRNAENK3$_0clEPKc>
101f43310:     	cbz	w0, 0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f43314:     	ldr	x0, [x26, #0x8]
101f43318:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f4331c:     	add	x1, x1, #0x8ee
101f43320:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f43324:     	cbnz	w0, 0x101f429d0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x438>
101f43328:     	add	x0, sp, #0xb50
101f4332c:     	adrp	x1, 0x104c17000 <__ZL3hex+0x4b34d>
101f43330:     	add	x1, x1, #0x556
101f43334:     	bl	0x101f44018 <__ZZL29ui_ipad_view_dispatch_allowedP8bContextRK11uiAfterFuncP14wmOperatorTypeP10PointerRNAENK3$_0clEPKc>
101f43338:     	tbnz	w0, #0x0, 0x101f429d0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x438>
101f4333c:     	b	0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f43340:     	add	x0, sp, #0x390
101f43344:     	add	x1, sp, #0xe60
101f43348:     	bl	0x101f368e0 <__ZN14uiIPadHUDFieldC2ERKS_>
101f4334c:     	add	x1, sp, #0x390
101f43350:     	mov	x0, x26
101f43354:     	bl	0x101f2f328 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField>
101f43358:     	add	x0, sp, #0x390
101f4335c:     	bl	0x101f2f620 <__ZN14uiIPadHUDFieldD1Ev>
101f43360:     	b	0x101f43254 <__ZL24ui_apply_but_funcs_afterP8bContext+0xcbc>
101f43364:     	add	x0, sp, #0x78
101f43368:     	add	x1, sp, #0xe60
101f4336c:     	bl	0x101f368e0 <__ZN14uiIPadHUDFieldC2ERKS_>
101f43370:     	add	x1, sp, #0x78
101f43374:     	mov	x0, x26
101f43378:     	bl	0x101f2f328 <__ZL24ui_ipad_hud_field_retireP8bContext14uiIPadHUDField>
101f4337c:     	add	x0, sp, #0x78
101f43380:     	bl	0x101f2f620 <__ZN14uiIPadHUDFieldD1Ev>
101f43384:     	add	x0, sp, #0x200
101f43388:     	bl	0x101f2f620 <__ZN14uiIPadHUDFieldD1Ev>
101f4338c:     	b	0x101f43254 <__ZL24ui_apply_but_funcs_afterP8bContext+0xcbc>
101f43390:     	mov	x0, x25
101f43394:     	adrp	x1, 0x104d3d000 <__ZL3hex+0x17134d>
101f43398:     	add	x1, x1, #0x77e
101f4339c:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f433a0:     	cbz	w0, 0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f433a4:     	mov	x0, x25
101f433a8:     	adrp	x1, 0x104d2e000 <__ZL3hex+0x16234d>
101f433ac:     	add	x1, x1, #0x1a7
101f433b0:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f433b4:     	cbz	w0, 0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f433b8:     	mov	x0, x25
101f433bc:     	adrp	x1, 0x104d2e000 <__ZL3hex+0x16234d>
101f433c0:     	add	x1, x1, #0x4f
101f433c4:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f433c8:     	cbz	w0, 0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f433cc:     	mov	x0, x25
101f433d0:     	adrp	x1, 0x104d20000 <__ZL3hex+0x15434d>
101f433d4:     	add	x1, x1, #0xc8c
101f433d8:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f433dc:     	cbz	w0, 0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f433e0:     	mov	x0, x25
101f433e4:     	adrp	x1, 0x104d25000 <__ZL3hex+0x15934d>
101f433e8:     	add	x1, x1, #0x22e
101f433ec:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f433f0:     	cbz	w0, 0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f433f4:     	mov	x0, x25
101f433f8:     	adrp	x1, 0x104d1e000 <__ZL3hex+0x15234d>
101f433fc:     	add	x1, x1, #0xda4
101f43400:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f43404:     	cbz	w0, 0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f43408:     	mov	x0, x25
101f4340c:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f43410:     	add	x1, x1, #0xd3a
101f43414:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f43418:     	cbz	w0, 0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f4341c:     	mov	x0, x25
101f43420:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f43424:     	add	x1, x1, #0xd50
101f43428:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f4342c:     	cbz	w0, 0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f43430:     	mov	x0, x25
101f43434:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f43438:     	add	x1, x1, #0xd64
101f4343c:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f43440:     	cbz	w0, 0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f43444:     	mov	x0, x25
101f43448:     	adrp	x1, 0x104d43000 <__ZL3hex+0x17734d>
101f4344c:     	add	x1, x1, #0x237
101f43450:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f43454:     	cbz	w0, 0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f43458:     	mov	x0, x25
101f4345c:     	adrp	x1, 0x104d26000 <__ZL3hex+0x15a34d>
101f43460:     	add	x1, x1, #0x911
101f43464:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f43468:     	cbnz	w0, 0x101f42a5c <__ZL24ui_apply_but_funcs_afterP8bContext+0x4c4>
101f4346c:     	b	0x101f43060 <__ZL24ui_apply_but_funcs_afterP8bContext+0xac8>
101f43470:     	add	x0, sp, #0x520
101f43474:     	adrp	x1, 0x104b7d000 <_zlibVersion+0x104b7d000>
101f43478:     	add	x1, x1, #0xf3f
101f4347c:     	bl	0x10124f538 <__Z24RNA_struct_find_propertyP10PointerRNAPKc>
101f43480:     	mov	x28, x0
101f43484:     	cbz	x0, 0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f43488:     	mov	x0, x28
101f4348c:     	bl	0x10124f7f8 <__Z17RNA_property_typeP11PropertyRNA>
101f43490:     	cmp	w0, #0x4
101f43494:     	b.ne	0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f43498:     	ldr	x0, [sp, #0xe60]
101f4349c:     	adrp	x1, 0x104b7d000 <_zlibVersion+0x104b7d000>
101f434a0:     	add	x1, x1, #0xf3f
101f434a4:     	bl	0x10125e69c <__Z26RNA_struct_property_is_setP10PointerRNAPKc>
101f434a8:     	cbz	w0, 0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f434ac:     	add	x0, sp, #0xb50
101f434b0:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f434b4:     	add	x1, x1, #0xcfd
101f434b8:     	bl	0x101f44018 <__ZZL29ui_ipad_view_dispatch_allowedP8bContextRK11uiAfterFuncP14wmOperatorTypeP10PointerRNAENK3$_0clEPKc>
101f434bc:     	cbz	w0, 0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f434c0:     	add	x0, sp, #0xb50
101f434c4:     	adrp	x1, 0x104ce6000 <__ZL3hex+0x11a34d>
101f434c8:     	add	x1, x1, #0xf5b
101f434cc:     	bl	0x101f44018 <__ZZL29ui_ipad_view_dispatch_allowedP8bContextRK11uiAfterFuncP14wmOperatorTypeP10PointerRNAENK3$_0clEPKc>
101f434d0:     	cbz	w0, 0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f434d4:     	ldr	x0, [sp, #0xe60]
101f434d8:     	mov	x1, x28
101f434dc:     	bl	0x101258624 <__Z21RNA_property_enum_getP10PointerRNAP11PropertyRNA>
101f434e0:     	cmp	w0, #0x5
101f434e4:     	b.hi	0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f434e8:     	mov	w8, #0x1                ; =1
101f434ec:     	lsl	w8, w8, w0
101f434f0:     	mov	w9, #0x32               ; =50
101f434f4:     	tst	w8, w9
101f434f8:     	b.ne	0x101f429d0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x438>
101f434fc:     	b	0x101f42af0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x558>
101f43500:     	ldur	x8, [x29, #-0x68]
101f43504:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
101f43508:     	ldr	x9, [x9, #0x7f0]
101f4350c:     	ldr	x9, [x9]
101f43510:     	cmp	x9, x8
101f43514:     	b.ne	0x101f43548 <__ZL24ui_apply_but_funcs_afterP8bContext+0xfb0>
101f43518:     	add	sp, sp, #0x1, lsl #12   ; =0x1000
101f4351c:     	ldp	x29, x30, [sp, #0x50]
101f43520:     	ldp	x20, x19, [sp, #0x40]
101f43524:     	ldp	x22, x21, [sp, #0x30]
101f43528:     	ldp	x24, x23, [sp, #0x20]
101f4352c:     	ldp	x26, x25, [sp, #0x10]
101f43530:     	ldp	x28, x27, [sp], #0x60
101f43534:     	ret
101f43538:     	bl	0x1001dde20 <__ZNSt3__125__throw_bad_function_callB8ne190102Ev>
101f4353c:     	b	0x101f43544 <__ZL24ui_apply_but_funcs_afterP8bContext+0xfac>
101f43540:     	bl	0x100018a18 <__ZNSt3__127__throw_bad_optional_accessB8ne190102Ev>
101f43544:     	brk	#0x1
101f43548:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
101f4354c:     	mov	x19, x0
101f43550:     	add	x0, sp, #0x78
101f43554:     	bl	0x101f2f620 <__ZN14uiIPadHUDFieldD1Ev>
101f43558:     	b	0x101f43574 <__ZL24ui_apply_but_funcs_afterP8bContext+0xfdc>
101f4355c:     	b	0x101f43570 <__ZL24ui_apply_but_funcs_afterP8bContext+0xfd8>
101f43560:     	mov	x19, x0
101f43564:     	add	x0, sp, #0x390
101f43568:     	bl	0x101f2f620 <__ZN14uiIPadHUDFieldD1Ev>
101f4356c:     	b	0x101f435b4 <__ZL24ui_apply_but_funcs_afterP8bContext+0x101c>
101f43570:     	mov	x19, x0
101f43574:     	add	x0, sp, #0x200
101f43578:     	bl	0x101f2f620 <__ZN14uiIPadHUDFieldD1Ev>
101f4357c:     	b	0x101f435b4 <__ZL24ui_apply_but_funcs_afterP8bContext+0x101c>
101f43580:     	mov	x19, x0
101f43584:     	add	x0, sp, #0xb50
101f43588:     	bl	0x101f2f620 <__ZN14uiIPadHUDFieldD1Ev>
101f4358c:     	b	0x101f435b4 <__ZL24ui_apply_but_funcs_afterP8bContext+0x101c>
101f43590:     	b	0x101f435b0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x1018>
101f43594:     	b	0x101f435b0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x1018>
101f43598:     	mov	x19, x0
101f4359c:     	add	x0, sp, #0xcd8
101f435a0:     	bl	0x101f2f620 <__ZN14uiIPadHUDFieldD1Ev>
101f435a4:     	b	0x101f435b4 <__ZL24ui_apply_but_funcs_afterP8bContext+0x101c>
101f435a8:     	b	0x101f435b0 <__ZL24ui_apply_but_funcs_afterP8bContext+0x1018>
101f435ac:     	b	0x101f435cc <__ZL24ui_apply_but_funcs_afterP8bContext+0x1034>
101f435b0:     	mov	x19, x0
101f435b4:     	add	x0, sp, #0xe60
101f435b8:     	bl	0x101f2f620 <__ZN14uiIPadHUDFieldD1Ev>
101f435bc:     	b	0x101f43650 <__ZL24ui_apply_but_funcs_afterP8bContext+0x10b8>
101f435c0:     	b	0x101f4364c <__ZL24ui_apply_but_funcs_afterP8bContext+0x10b4>
101f435c4:     	b	0x101f4364c <__ZL24ui_apply_but_funcs_afterP8bContext+0x10b4>
101f435c8:     	b	0x101f4364c <__ZL24ui_apply_but_funcs_afterP8bContext+0x10b4>
101f435cc:     	mov	x19, x0
101f435d0:     	add	x0, sp, #0xe60
101f435d4:     	bl	0x101f8f114 <__ZN23uiIPadActionOriginScopeD1Ev>
101f435d8:     	b	0x101f43650 <__ZL24ui_apply_but_funcs_afterP8bContext+0x10b8>
101f435dc:     	b	0x101f43604 <__ZL24ui_apply_but_funcs_afterP8bContext+0x106c>
101f435e0:     	b	0x101f4364c <__ZL24ui_apply_but_funcs_afterP8bContext+0x10b4>
101f435e4:     	mov	x19, x0
101f435e8:     	b	0x101f43658 <__ZL24ui_apply_but_funcs_afterP8bContext+0x10c0>
101f435ec:     	b	0x101f4364c <__ZL24ui_apply_but_funcs_afterP8bContext+0x10b4>
101f435f0:     	mov	x19, x0
101f435f4:     	b	0x101f43658 <__ZL24ui_apply_but_funcs_afterP8bContext+0x10c0>
101f435f8:     	b	0x101f43604 <__ZL24ui_apply_but_funcs_afterP8bContext+0x106c>
101f435fc:     	mov	x19, x0
101f43600:     	b	0x101f43660 <__ZL24ui_apply_but_funcs_afterP8bContext+0x10c8>
101f43604:     	mov	x19, x0
101f43608:     	cbz	w1, 0x101f4361c <__ZL24ui_apply_but_funcs_afterP8bContext+0x1084>
101f4360c:     	mov	x0, x19
101f43610:     	bl	0x1000144bc <___clang_call_terminate>
101f43614:     	b	0x101f4364c <__ZL24ui_apply_but_funcs_afterP8bContext+0x10b4>
101f43618:     	mov	x19, x0
101f4361c:     	mov	x0, x19
101f43620:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
101f43624:     	mov	x19, x0
101f43628:     	b	0x101f43660 <__ZL24ui_apply_but_funcs_afterP8bContext+0x10c8>
101f4362c:     	mov	x19, x0
101f43630:     	b	0x101f43660 <__ZL24ui_apply_but_funcs_afterP8bContext+0x10c8>
101f43634:     	b	0x101f4364c <__ZL24ui_apply_but_funcs_afterP8bContext+0x10b4>
101f43638:     	b	0x101f4364c <__ZL24ui_apply_but_funcs_afterP8bContext+0x10b4>
101f4363c:     	mov	x19, x0
101f43640:     	b	0x101f43658 <__ZL24ui_apply_but_funcs_afterP8bContext+0x10c0>
101f43644:     	mov	x19, x0
101f43648:     	b	0x101f43660 <__ZL24ui_apply_but_funcs_afterP8bContext+0x10c8>
101f4364c:     	mov	x19, x0
101f43650:     	add	x0, sp, #0x520
101f43654:     	bl	0x100013e10 <__ZN7blender2ed12sculpt_paint18FillToolTargetInfoD1Ev>
101f43658:     	add	x0, sp, #0x38
101f4365c:     	bl	0x101f43850 <__ZZL24ui_apply_but_funcs_afterP8bContextEN20CornerContextRestoreD1Ev>
101f43660:     	add	x0, sp, #0x578
101f43664:     	bl	0x101f440a0 <__ZN11uiAfterFuncD2Ev>
101f43668:     	mov	x0, x19
101f4366c:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
