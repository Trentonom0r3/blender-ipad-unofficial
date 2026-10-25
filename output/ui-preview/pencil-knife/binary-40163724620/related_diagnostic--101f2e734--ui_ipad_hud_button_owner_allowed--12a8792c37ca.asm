
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f2e734 <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut>:
101f2e734:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f2e738:     	ldr	x9, [x8, #0x70]
101f2e73c:     	cbz	x9, 0x101f2e7fc <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0xc8>
101f2e740:     	ldr	x10, [x1, #0x8]
101f2e744:     	fmov	d0, x9
101f2e748:     	cnt.8b	v0, v0
101f2e74c:     	uaddlv.8b	h0, v0
101f2e750:     	fmov	w11, s0
101f2e754:     	cmp	x11, #0x1
101f2e758:     	b.hi	0x101f2e768 <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0x34>
101f2e75c:     	sub	x8, x9, #0x1
101f2e760:     	and	x13, x8, x10
101f2e764:     	b	0x101f2e77c <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0x48>
101f2e768:     	mov	x13, x10
101f2e76c:     	cmp	x10, x9
101f2e770:     	b.lo	0x101f2e77c <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0x48>
101f2e774:     	udiv	x8, x10, x9
101f2e778:     	msub	x13, x8, x9, x10
101f2e77c:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f2e780:     	ldr	x8, [x8, #0x68]
101f2e784:     	ldr	x12, [x8, x13, lsl #3]
101f2e788:     	cbz	x12, 0x101f2e7fc <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0xc8>
101f2e78c:     	ldr	x14, [x12]
101f2e790:     	cbz	x14, 0x101f2e7fc <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0xc8>
101f2e794:     	sub	x12, x9, #0x1
101f2e798:     	b	0x101f2e7b0 <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0x7c>
101f2e79c:     	ldr	x15, [x14, #0x10]
101f2e7a0:     	cmp	x15, x10
101f2e7a4:     	b.eq	0x101f2e7e8 <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0xb4>
101f2e7a8:     	ldr	x14, [x14]
101f2e7ac:     	cbz	x14, 0x101f2e7fc <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0xc8>
101f2e7b0:     	ldr	x15, [x14, #0x8]
101f2e7b4:     	cmp	x10, x15
101f2e7b8:     	b.eq	0x101f2e79c <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0x68>
101f2e7bc:     	cmp	x11, #0x1
101f2e7c0:     	b.hi	0x101f2e7cc <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0x98>
101f2e7c4:     	and	x15, x15, x12
101f2e7c8:     	b	0x101f2e7dc <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0xa8>
101f2e7cc:     	cmp	x15, x9
101f2e7d0:     	b.lo	0x101f2e7dc <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0xa8>
101f2e7d4:     	udiv	x16, x15, x9
101f2e7d8:     	msub	x15, x16, x9, x15
101f2e7dc:     	cmp	x15, x13
101f2e7e0:     	b.eq	0x101f2e7a8 <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0x74>
101f2e7e4:     	b	0x101f2e7fc <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0xc8>
101f2e7e8:     	cbz	x10, 0x101f2e7fc <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0xc8>
101f2e7ec:     	cmp	x11, #0x1
101f2e7f0:     	b.hi	0x101f2e804 <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0xd0>
101f2e7f4:     	and	x13, x12, x10
101f2e7f8:     	b	0x101f2e818 <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0xe4>
101f2e7fc:     	mov	w0, #0x1                ; =1
101f2e800:     	ret
101f2e804:     	mov	x13, x10
101f2e808:     	cmp	x9, x10
101f2e80c:     	b.hi	0x101f2e818 <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0xe4>
101f2e810:     	udiv	x13, x10, x9
101f2e814:     	msub	x13, x13, x9, x10
101f2e818:     	ldr	x8, [x8, x13, lsl #3]
101f2e81c:     	cbz	x8, 0x101f2e884 <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0x150>
101f2e820:     	ldr	x14, [x8]
101f2e824:     	cbnz	x14, 0x101f2e848 <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0x114>
101f2e828:     	mov	w0, #0x0                ; =0
101f2e82c:     	ret
101f2e830:     	ldr	x8, [x14, #0x10]
101f2e834:     	cmp	x8, x10
101f2e838:     	b.eq	0x101f2e88c <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0x158>
101f2e83c:     	mov	w8, #0x0                ; =0
101f2e840:     	ldr	x14, [x14]
101f2e844:     	cbz	x14, 0x101f2e884 <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0x150>
101f2e848:     	ldr	x8, [x14, #0x8]
101f2e84c:     	cmp	x8, x10
101f2e850:     	b.eq	0x101f2e830 <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0xfc>
101f2e854:     	cmp	x11, #0x1
101f2e858:     	b.hi	0x101f2e864 <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0x130>
101f2e85c:     	and	x8, x8, x12
101f2e860:     	b	0x101f2e874 <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0x140>
101f2e864:     	cmp	x8, x9
101f2e868:     	b.lo	0x101f2e874 <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0x140>
101f2e86c:     	udiv	x15, x8, x9
101f2e870:     	msub	x8, x15, x9, x8
101f2e874:     	cmp	x8, x13
101f2e878:     	b.eq	0x101f2e83c <__Z32ui_ipad_hud_button_owner_allowedP8bContextPK5uiBut+0x108>
101f2e87c:     	mov	w0, #0x0                ; =0
101f2e880:     	ret
101f2e884:     	mov	x0, x8
101f2e888:     	ret
101f2e88c:     	add	x1, x14, #0x18
101f2e890:     	mov	x2, #0x0                ; =0
101f2e894:     	mov	w3, #0x1                ; =1
101f2e898:     	b	0x101f2ec10 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b>
