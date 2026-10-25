
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f43670 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv>:
101f43670:     	stp	x20, x19, [sp, #-0x20]!
101f43674:     	stp	x29, x30, [sp, #0x10]
101f43678:     	add	x29, sp, #0x10
101f4367c:     	ldr	x8, [x0]
101f43680:     	ldrb	w8, [x8]
101f43684:     	cmp	w8, #0x1
101f43688:     	b.ne	0x101f43814 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x1a4>
101f4368c:     	ldp	x9, x10, [x0, #0x8]
101f43690:     	mov	x8, x0
101f43694:     	ldr	x0, [x9]
101f43698:     	ldr	x9, [x10, #0x1a0]
101f4369c:     	cbz	x9, 0x101f436d0 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x60>
101f436a0:     	adrp	x10, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f436a4:     	ldr	x10, [x10, #0x70]
101f436a8:     	cbz	x10, 0x101f43814 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x1a4>
101f436ac:     	fmov	d0, x10
101f436b0:     	cnt.8b	v0, v0
101f436b4:     	uaddlv.8b	h0, v0
101f436b8:     	fmov	w11, s0
101f436bc:     	cmp	x11, #0x1
101f436c0:     	b.hi	0x101f43798 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x128>
101f436c4:     	sub	x12, x10, #0x1
101f436c8:     	and	x12, x12, x9
101f436cc:     	b	0x101f437ac <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x13c>
101f436d0:     	mov	x19, x8
101f436d4:     	add	x1, x10, #0xe8
101f436d8:     	bl	0x101f8f1cc <__Z27ui_ipad_action_origin_validP8bContextRKN7blender2ui4ipad12ActionOriginE>
101f436dc:     	cbz	w0, 0x101f43818 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x1a8>
101f436e0:     	ldr	x8, [x19, #0x10]
101f436e4:     	ldrb	w9, [x8, #0x2d8]
101f436e8:     	cmp	w9, #0x1
101f436ec:     	b.ne	0x101f4373c <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0xcc>
101f436f0:     	mov	x20, x19
101f436f4:     	ldr	x9, [x19, #0x8]
101f436f8:     	ldr	x0, [x9]
101f436fc:     	ldr	x2, [x8, #0x2d0]
101f43700:     	add	x1, x8, #0xe8
101f43704:     	bl	0x101f34c80 <__Z32ui_ipad_registered_popup_resolveP8bContextRKN7blender2ui4ipad12ActionOriginEy>
101f43708:     	cbz	x0, 0x101f43818 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x1a8>
101f4370c:     	ldp	x9, x8, [x20, #0x8]
101f43710:     	ldr	x19, [x9]
101f43714:     	ldr	x2, [x8, #0x2d0]
101f43718:     	add	x1, x8, #0xe8
101f4371c:     	mov	x0, x19
101f43720:     	bl	0x101f34c80 <__Z32ui_ipad_registered_popup_resolveP8bContextRKN7blender2ui4ipad12ActionOriginEy>
101f43724:     	mov	x1, x0
101f43728:     	mov	x0, x19
101f4372c:     	bl	0x101f05db0 <__Z27ui_ipad_numbers_popup_validP8bContextP18uiPopupBlockHandle>
101f43730:     	cbz	w0, 0x101f43818 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x1a8>
101f43734:     	mov	x19, x20
101f43738:     	ldr	x8, [x20, #0x10]
101f4373c:     	ldr	x9, [x8, #0x3d8]
101f43740:     	cbz	x9, 0x101f43770 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x100>
101f43744:     	mov	x20, x19
101f43748:     	ldr	x9, [x19, #0x8]
101f4374c:     	ldr	x0, [x9]
101f43750:     	add	x1, x8, #0xe8
101f43754:     	add	x2, x8, #0x3e0
101f43758:     	add	x3, x8, #0x380
101f4375c:     	add	x4, x8, #0x3d8
101f43760:     	bl	0x101f083ec <__Z19ui_ipad_rna_resolveP8bContextRKN7blender2ui4ipad12ActionOriginERK16uiIPadRNAReceiptR10PointerRNARP11PropertyRNA>
101f43764:     	cbz	w0, 0x101f43818 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x1a8>
101f43768:     	mov	x19, x20
101f4376c:     	ldr	x8, [x20, #0x10]
101f43770:     	ldrb	w9, [x8, #0x578]
101f43774:     	cmp	w9, #0x1
101f43778:     	b.ne	0x101f43824 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x1b4>
101f4377c:     	ldr	x9, [x19, #0x8]
101f43780:     	ldr	x0, [x9]
101f43784:     	add	x1, x8, #0xe8
101f43788:     	add	x2, x8, #0x550
101f4378c:     	ldp	x29, x30, [sp, #0x10]
101f43790:     	ldp	x20, x19, [sp], #0x20
101f43794:     	b	0x101f05b68 <__Z28ui_ipad_context_store_rebindP8bContextRKN7blender2ui4ipad12ActionOriginER13bContextStore>
101f43798:     	mov	x12, x9
101f4379c:     	cmp	x10, x9
101f437a0:     	b.hi	0x101f437ac <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x13c>
101f437a4:     	udiv	x12, x9, x10
101f437a8:     	msub	x12, x12, x10, x9
101f437ac:     	adrp	x13, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f437b0:     	ldr	x13, [x13, #0x68]
101f437b4:     	ldr	x13, [x13, x12, lsl #3]
101f437b8:     	cbz	x13, 0x101f43814 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x1a4>
101f437bc:     	ldr	x13, [x13]
101f437c0:     	cbz	x13, 0x101f43814 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x1a4>
101f437c4:     	sub	x14, x10, #0x1
101f437c8:     	b	0x101f437e0 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x170>
101f437cc:     	ldr	x15, [x13, #0x10]
101f437d0:     	cmp	x15, x9
101f437d4:     	b.eq	0x101f4382c <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x1bc>
101f437d8:     	ldr	x13, [x13]
101f437dc:     	cbz	x13, 0x101f43814 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x1a4>
101f437e0:     	ldr	x15, [x13, #0x8]
101f437e4:     	cmp	x15, x9
101f437e8:     	b.eq	0x101f437cc <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x15c>
101f437ec:     	cmp	x11, #0x1
101f437f0:     	b.hi	0x101f437fc <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x18c>
101f437f4:     	and	x15, x15, x14
101f437f8:     	b	0x101f4380c <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x19c>
101f437fc:     	cmp	x15, x10
101f43800:     	b.lo	0x101f4380c <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x19c>
101f43804:     	udiv	x16, x15, x10
101f43808:     	msub	x15, x16, x10, x15
101f4380c:     	cmp	x15, x12
101f43810:     	b.eq	0x101f437d8 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x168>
101f43814:     	mov	w0, #0x0                ; =0
101f43818:     	ldp	x29, x30, [sp, #0x10]
101f4381c:     	ldp	x20, x19, [sp], #0x20
101f43820:     	ret
101f43824:     	mov	w0, #0x1                ; =1
101f43828:     	b	0x101f43818 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x1a8>
101f4382c:     	mov	x19, x8
101f43830:     	add	x1, x13, #0x18
101f43834:     	mov	x2, #0x0                ; =0
101f43838:     	mov	w3, #0x1                ; =1
101f4383c:     	bl	0x101f2ec10 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b>
101f43840:     	cbz	w0, 0x101f43818 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x1a8>
101f43844:     	ldp	x9, x10, [x19, #0x8]
101f43848:     	ldr	x0, [x9]
101f4384c:     	b	0x101f436d4 <__ZZL24ui_apply_but_funcs_afterP8bContextENK3$_0clEv+0x64>
