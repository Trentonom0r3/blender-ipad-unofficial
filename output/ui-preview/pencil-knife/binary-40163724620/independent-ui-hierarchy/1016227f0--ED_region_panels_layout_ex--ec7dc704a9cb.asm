
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001016227f0 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_>:
1016227f0:     	stp	d11, d10, [sp, #-0x80]!
1016227f4:     	stp	d9, d8, [sp, #0x10]
1016227f8:     	stp	x28, x27, [sp, #0x20]
1016227fc:     	stp	x26, x25, [sp, #0x30]
101622800:     	stp	x24, x23, [sp, #0x40]
101622804:     	stp	x22, x21, [sp, #0x50]
101622808:     	stp	x20, x19, [sp, #0x60]
10162280c:     	stp	x29, x30, [sp, #0x70]
101622810:     	add	x29, sp, #0x70
101622814:     	sub	sp, sp, #0x50
101622818:     	mov	x21, x5
10162281c:     	mov	x22, x4
101622820:     	mov	x23, x3
101622824:     	mov	x26, x2
101622828:     	mov	x19, x1
10162282c:     	mov	x20, x0
101622830:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
101622834:     	ldr	x8, [x8, #0x7f0]
101622838:     	ldr	x8, [x8]
10162283c:     	stur	x8, [x29, #-0x78]
101622840:     	bl	0x1000b43e0 <__Z16CTX_wm_workspacePK8bContext>
101622844:     	mov	x24, x0
101622848:     	ldrh	w8, [x19, #0xc0]
10162284c:     	cmp	w8, #0x8
101622850:     	b.ne	0x101622864 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x74>
101622854:     	mov	x0, x20
101622858:     	bl	0x101f8c7c8 <__Z24UI_ipad_knife_hud_activePK8bContext>
10162285c:     	mov	x25, x0
101622860:     	b	0x101622868 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x78>
101622864:     	mov	w25, #0x0               ; =0
101622868:     	stur	xzr, [x29, #-0x90]
10162286c:     	ldr	x26, [x26, #0x8]
101622870:     	cbz	x26, 0x1016228c8 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0xd8>
101622874:     	cbz	w25, 0x101622884 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x94>
101622878:     	mov	x0, x26
10162287c:     	bl	0x101f8cc54 <__Z28UI_ipad_knife_hud_panel_typePK9PanelType>
101622880:     	cbz	w0, 0x10162286c <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x7c>
101622884:     	mov	x0, x20
101622888:     	mov	x1, x24
10162288c:     	mov	x2, x22
101622890:     	mov	x3, x21
101622894:     	mov	x4, x26
101622898:     	bl	0x101622710 <__ZL15panel_add_checkPK8bContextPK9WorkSpacePPKcS6_P9PanelType>
10162289c:     	cbz	w0, 0x10162286c <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x7c>
1016228a0:     	mov	w9, #0x10               ; =16
1016228a4:     	adrp	x16, 0x106365000 <_zlibVersion+0x106365000>
1016228a8:     	ldr	x16, [x16, #0x758]
1016228ac:     	blr	x16
1016228b0:     	sub	x2, sp, #0x10
1016228b4:     	mov	sp, x2
1016228b8:     	sub	x0, x29, #0x90
1016228bc:     	mov	x1, x26
1016228c0:     	bl	0x100730d24 <__Z26BLI_linklist_prepend_nlinkPP8LinkNodePvS0_>
1016228c4:     	b	0x10162286c <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x7c>
1016228c8:     	ldr	x8, [x19, #0x128]
1016228cc:     	str	xzr, [x8, #0xe8]
1016228d0:     	mov	x0, x20
1016228d4:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
1016228d8:     	mov	x26, x0
1016228dc:     	cbz	x21, 0x101622bf4 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x404>
1016228e0:     	mov	w8, #0x0                ; =0
1016228e4:     	adrp	x10, 0x106d88000 <_build_commit_date>
1016228e8:     	add	x10, x10, #0xe08
1016228ec:     	mov	w9, #0x2912             ; =10514
1016228f0:     	ldrh	w21, [x10, x9]
1016228f4:     	ldrh	w25, [x19, #0xc4]
1016228f8:     	ldrh	w9, [x19, #0x80]
1016228fc:     	and	w9, w9, #0xffffffe3
101622900:     	mov	w10, #0x12              ; =18
101622904:     	orr	w9, w9, w10
101622908:     	strh	w9, [x19, #0x80]
10162290c:     	ldrh	w9, [x19, #0x78]
101622910:     	ldrh	w10, [x19, #0xc2]
101622914:     	mov	w11, #0xfff4            ; =65524
101622918:     	and	w9, w9, w11
10162291c:     	tst	w10, #0x3
101622920:     	mov	w10, #0x1               ; =1
101622924:     	cinc	w10, w10, eq
101622928:     	orr	w9, w10, w9
10162292c:     	strh	w9, [x19, #0x78]
101622930:     	fmov	s8, wzr
101622934:     	cbz	w8, 0x1016229ac <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x1bc>
101622938:     	ldur	x22, [x29, #-0x90]
10162293c:     	mov	x0, x19
101622940:     	bl	0x101f707b4 <__Z27UI_panel_category_clear_allP7ARegion>
101622944:     	cbnz	x22, 0x101622980 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x190>
101622948:     	mov	x0, x19
10162294c:     	bl	0x101f704dc <__Z28UI_panel_category_is_visiblePK7ARegion>
101622950:     	tbz	w0, #0x0, 0x1016229ac <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x1bc>
101622954:     	mov	w8, #0x1                ; =1
101622958:     	stur	w8, [x29, #-0x9c]
10162295c:     	mov	x0, x19
101622960:     	mov	w1, #0x1                ; =1
101622964:     	bl	0x101f706c4 <__Z28UI_panel_category_active_getP7ARegionb>
101622968:     	stur	x0, [x29, #-0xa8]
10162296c:     	sxth	w8, w21
101622970:     	scvtf	s8, w8
101622974:     	b	0x1016229b4 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x1c4>
101622978:     	ldr	x22, [x22]
10162297c:     	cbz	x22, 0x101622948 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x158>
101622980:     	ldr	x24, [x22, #0x8]
101622984:     	ldrb	w8, [x24, #0x118]
101622988:     	cbz	w8, 0x101622978 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x188>
10162298c:     	add	x1, x24, #0x118
101622990:     	mov	x0, x19
101622994:     	bl	0x101f70500 <__Z22UI_panel_category_findPK7ARegionPKc>
101622998:     	cbnz	x0, 0x101622978 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x188>
10162299c:     	add	x1, x24, #0x118
1016229a0:     	mov	x0, x19
1016229a4:     	bl	0x101f70748 <__Z21UI_panel_category_addP7ARegionPKc>
1016229a8:     	b	0x101622978 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x188>
1016229ac:     	stur	xzr, [x29, #-0xa8]
1016229b0:     	stur	wzr, [x29, #-0x9c]
1016229b4:     	ldp	s10, s9, [x19, #0x20]
1016229b8:     	ldr	x8, [x19, #0x128]
1016229bc:     	ldr	x8, [x8, #0xb8]
1016229c0:     	ldr	w8, [x8, #0xe0]
1016229c4:     	cmp	w8, #0x0
1016229c8:     	mov	w8, #0xa                ; =10
1016229cc:     	mov	w9, #0x14               ; =20
1016229d0:     	csel	w24, w9, w8, eq
1016229d4:     	mov	x0, x20
1016229d8:     	mov	x1, x19
1016229dc:     	bl	0x101f6f37c <__Z15UI_panels_beginPK8bContextP7ARegion>
1016229e0:     	ldrb	w8, [x26, #0x48]
1016229e4:     	cmp	w8, #0x4
1016229e8:     	stur	w25, [x29, #-0xac]
1016229ec:     	b.ne	0x1016229f8 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x208>
1016229f0:     	ldrh	w8, [x19, #0xc0]
1016229f4:     	cbz	w8, 0x101622d94 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x5a4>
1016229f8:     	mov	x25, #0x0               ; =0
1016229fc:     	stur	x26, [x29, #-0xb8]
101622a00:     	add	x0, x19, #0x10
101622a04:     	bl	0x101fdced4 <__Z20UI_view2d_view_orthoPK6View2D>
101622a08:     	ldur	x21, [x29, #-0x90]
101622a0c:     	cbz	x21, 0x101622c18 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x428>
101622a10:     	mov	w22, #0x0               ; =0
101622a14:     	fsub	s0, s9, s10
101622a18:     	fsub	s0, s0, s8
101622a1c:     	fcvtzs	w8, s0
101622a20:     	scvtf	s8, w8
101622a24:     	mov	w28, #0x1               ; =1
101622a28:     	b	0x101622a38 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x248>
101622a2c:     	mov	w22, #0x1               ; =1
101622a30:     	ldr	x21, [x21]
101622a34:     	cbz	x21, 0x101622b10 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x320>
101622a38:     	ldr	x26, [x21, #0x8]
101622a3c:     	ldrb	w8, [x26, #0x2ac]
101622a40:     	tbnz	w8, #0x4, 0x101622a2c <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x23c>
101622a44:     	add	x0, x19, #0xd0
101622a48:     	mov	x1, x26
101622a4c:     	bl	0x101f6daf0 <__Z21UI_panel_find_by_typeP8ListBasePK9PanelType>
101622a50:     	mov	x27, x0
101622a54:     	ldur	w8, [x29, #-0x9c]
101622a58:     	cbz	w8, 0x101622a80 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x290>
101622a5c:     	ldrb	w8, [x26, #0x118]
101622a60:     	cbz	w8, 0x101622a80 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x290>
101622a64:     	add	x1, x26, #0x118
101622a68:     	ldur	x0, [x29, #-0xa8]
101622a6c:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101622a70:     	cbz	w0, 0x101622a80 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x290>
101622a74:     	cbz	x27, 0x101622a30 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x240>
101622a78:     	ldrh	w8, [x27, #0x82]
101622a7c:     	tbz	w8, #0x5, 0x101622a30 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x240>
101622a80:     	mov	x0, x19
101622a84:     	mov	x1, x26
101622a88:     	bl	0x101f6ebd8 <__Z31UI_panel_should_show_backgroundPK7ARegionPK9PanelType>
101622a8c:     	fmov	s9, s8
101622a90:     	cbz	w0, 0x101622ac4 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x2d4>
101622a94:     	adrp	x8, 0x106d88000 <_build_commit_date>
101622a98:     	add	x8, x8, #0xe08
101622a9c:     	mov	w9, #0x2912             ; =10514
101622aa0:     	ldr	h0, [x8, x9]
101622aa4:     	sshll.4s	v0, v0, #0x0
101622aa8:     	scvtf	s0, s0
101622aac:     	mov	w8, #0xcccd             ; =52429
101622ab0:     	movk	w8, #0xbecc, lsl #16
101622ab4:     	fmov	s1, w8
101622ab8:     	fmul	s0, s0, s1
101622abc:     	fadd	s0, s0, s0
101622ac0:     	fadd	s9, s8, s0
101622ac4:     	cbz	x27, 0x101622ad8 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x2e8>
101622ac8:     	mov	x0, x27
101622acc:     	bl	0x101f6dfc4 <__Z20UI_panel_is_draggingPK5Panel>
101622ad0:     	eor	w8, w0, #0x1
101622ad4:     	and	w28, w8, w28
101622ad8:     	fcvtzs	w5, s9
101622adc:     	sub	sp, sp, #0x10
101622ae0:     	strb	w23, [sp, #0x8]
101622ae4:     	str	x25, [sp]
101622ae8:     	add	x2, x19, #0xd0
101622aec:     	mov	x0, x20
101622af0:     	mov	x1, x19
101622af4:     	mov	x3, x26
101622af8:     	mov	x4, x27
101622afc:     	mov	x6, x24
101622b00:     	mov	x7, #0x0                ; =0
101622b04:     	bl	0x101622f9c <__ZL13ed_panel_drawPK8bContextP7ARegionP8ListBaseP9PanelTypeP5PaneliiPcPKcN7blender2wm13OpCallContextE>
101622b08:     	add	sp, sp, #0x10
101622b0c:     	b	0x101622a30 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x240>
101622b10:     	tbz	w22, #0x0, 0x101622c1c <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x42c>
101622b14:     	ldur	x26, [x19, #0xd0]
101622b18:     	cbz	x26, 0x101622c1c <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x42c>
101622b1c:     	mov	w21, #0x2912            ; =10514
101622b20:     	mov	w22, #0xcccd            ; =52429
101622b24:     	movk	w22, #0xbecc, lsl #16
101622b28:     	b	0x101622b88 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x398>
101622b2c:     	fcvtzs	w27, s0
101622b30:     	mov	x0, x26
101622b34:     	bl	0x101f6dfc4 <__Z20UI_panel_is_draggingPK5Panel>
101622b38:     	eor	w8, w0, #0x1
101622b3c:     	and	w28, w8, w28
101622b40:     	sub	x1, x29, #0x88
101622b44:     	mov	x0, x26
101622b48:     	bl	0x101f6d6fc <__Z24UI_list_panel_unique_strP5PanelPc>
101622b4c:     	ldr	x3, [x26, #0x10]
101622b50:     	sub	sp, sp, #0x10
101622b54:     	strb	w23, [sp, #0x8]
101622b58:     	str	x25, [sp]
101622b5c:     	add	x2, x19, #0xd0
101622b60:     	sub	x7, x29, #0x88
101622b64:     	mov	x0, x20
101622b68:     	mov	x1, x19
101622b6c:     	mov	x4, x26
101622b70:     	mov	x5, x27
101622b74:     	mov	x6, x24
101622b78:     	bl	0x101622f9c <__ZL13ed_panel_drawPK8bContextP7ARegionP8ListBaseP9PanelTypeP5PaneliiPcPKcN7blender2wm13OpCallContextE>
101622b7c:     	add	sp, sp, #0x10
101622b80:     	ldr	x26, [x26]
101622b84:     	cbz	x26, 0x101622c1c <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x42c>
101622b88:     	ldr	x27, [x26, #0x10]
101622b8c:     	cbz	x27, 0x101622b80 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x390>
101622b90:     	ldrb	w8, [x27, #0x2ac]
101622b94:     	tbz	w8, #0x4, 0x101622b80 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x390>
101622b98:     	ldur	w8, [x29, #-0x9c]
101622b9c:     	cbz	w8, 0x101622bb8 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x3c8>
101622ba0:     	ldrb	w8, [x27, #0x118]
101622ba4:     	cbz	w8, 0x101622bb8 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x3c8>
101622ba8:     	add	x1, x27, #0x118
101622bac:     	ldur	x0, [x29, #-0xa8]
101622bb0:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101622bb4:     	cbnz	w0, 0x101622b80 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x390>
101622bb8:     	mov	x0, x19
101622bbc:     	mov	x1, x27
101622bc0:     	bl	0x101f6ebd8 <__Z31UI_panel_should_show_backgroundPK7ARegionPK9PanelType>
101622bc4:     	fmov	s0, s8
101622bc8:     	cbz	w0, 0x101622b2c <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x33c>
101622bcc:     	adrp	x8, 0x106d88000 <_build_commit_date>
101622bd0:     	add	x8, x8, #0xe08
101622bd4:     	ldr	h0, [x8, x21]
101622bd8:     	sshll.4s	v0, v0, #0x0
101622bdc:     	scvtf	s0, s0
101622be0:     	fmov	s1, w22
101622be4:     	fmul	s0, s0, s1
101622be8:     	fadd	s0, s0, s0
101622bec:     	fadd	s0, s8, s0
101622bf0:     	b	0x101622b2c <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x33c>
101622bf4:     	ldrh	w8, [x19, #0xc0]
101622bf8:     	cmp	w8, #0x4
101622bfc:     	b.eq	0x101622da4 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x5b4>
101622c00:     	cmp	w8, #0x5
101622c04:     	b.ne	0x1016228e0 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0xf0>
101622c08:     	ldrb	w8, [x26, #0x48]
101622c0c:     	cmp	w8, #0x14
101622c10:     	cset	w8, eq
101622c14:     	b	0x1016228e4 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0xf4>
101622c18:     	mov	w28, #0x1               ; =1
101622c1c:     	sub	x2, x29, #0x94
101622c20:     	sub	x3, x29, #0x98
101622c24:     	mov	x0, x20
101622c28:     	mov	x1, x19
101622c2c:     	bl	0x101f6f434 <__Z13UI_panels_endPK8bContextP7ARegionPiS4_>
101622c30:     	ldur	w8, [x29, #-0xac]
101622c34:     	tbnz	w8, #0x2, 0x101622c6c <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x47c>
101622c38:     	ldr	s0, [x19, #0x2c]
101622c3c:     	movi.2s	v1, #0xb4, lsl #24
101622c40:     	fcmp	s0, s1
101622c44:     	b.pl	0x101622d8c <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x59c>
101622c48:     	ldr	s0, [x19, #0x18]
101622c4c:     	ldrsh	w8, [x19, #0x88]
101622c50:     	neg	w8, w8
101622c54:     	scvtf	s1, w8
101622c58:     	ldur	w8, [x29, #-0x98]
101622c5c:     	fcmp	s0, s1
101622c60:     	b.pl	0x101622dac <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x5bc>
101622c64:     	and	w8, w8, w8, asr #31
101622c68:     	b	0x101622dbc <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x5cc>
101622c6c:     	ldr	x23, [x19, #0xd8]
101622c70:     	cbz	x23, 0x101622f24 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x734>
101622c74:     	mov	w8, #0x2912             ; =10514
101622c78:     	adrp	x22, 0x106d88000 <_build_commit_date>
101622c7c:     	add	x22, x22, #0xe08
101622c80:     	ldrsh	w21, [x22, x8]
101622c84:     	mov	x0, x23
101622c88:     	bl	0x101f6ddac <__Z18UI_panel_is_closedPK5Panel>
101622c8c:     	cmp	w0, #0x0
101622c90:     	mov	w8, #0xe                ; =14
101622c94:     	mov	w9, #0x8                ; =8
101622c98:     	csel	w8, w9, w8, ne
101622c9c:     	mul	w8, w8, w21
101622ca0:     	scvtf	s0, w8
101622ca4:     	ldr	s1, [x22, #0x2654]
101622ca8:     	fdiv	s0, s0, s1
101622cac:     	fcvtzs	w25, s0
101622cb0:     	mov	x0, x23
101622cb4:     	bl	0x101f6f2c8 <__Z15UI_panel_size_yPK5Panel>
101622cb8:     	scvtf	s0, w0
101622cbc:     	ldr	s1, [x22, #0x2654]
101622cc0:     	fdiv	s0, s0, s1
101622cc4:     	fcvtzs	w24, s0
101622cc8:     	ldrh	w8, [x19, #0xc0]
101622ccc:     	cmp	w8, #0x8
101622cd0:     	b.ne	0x101622e4c <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x65c>
101622cd4:     	mov	x0, x20
101622cd8:     	bl	0x101f8c7c8 <__Z24UI_ipad_knife_hud_activePK8bContext>
101622cdc:     	tbnz	w0, #0x0, 0x101622cec <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x4fc>
101622ce0:     	mov	x0, x20
101622ce4:     	bl	0x101f8d72c <__Z21UI_ipad_corner_canvasP8bContext>
101622ce8:     	cbz	x0, 0x101622e4c <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x65c>
101622cec:     	ldr	x23, [x19, #0xd0]
101622cf0:     	cbz	x23, 0x101622e4c <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x65c>
101622cf4:     	mov	w21, #0x0               ; =0
101622cf8:     	mov	w22, #0x0               ; =0
101622cfc:     	mov	w26, #0x0               ; =0
101622d00:     	stur	wzr, [x29, #-0xac]
101622d04:     	mov	w27, #0x0               ; =0
101622d08:     	mov	x0, x23
101622d0c:     	bl	0x101f6def4 <__Z18UI_panel_is_activePK5Panel>
101622d10:     	cbnz	w0, 0x101622d20 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x530>
101622d14:     	ldr	x23, [x23]
101622d18:     	cbnz	x23, 0x101622d08 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x518>
101622d1c:     	b	0x101622dc4 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x5d4>
101622d20:     	ldr	x0, [x23, #0x10]
101622d24:     	bl	0x101f8cc54 <__Z28UI_ipad_knife_hud_panel_typePK9PanelType>
101622d28:     	mov	x26, x0
101622d2c:     	mov	x0, x23
101622d30:     	bl	0x101f6ddac <__Z18UI_panel_is_closedPK5Panel>
101622d34:     	eor	w8, w0, #0x1
101622d38:     	tbnz	w8, #0x0, 0x101622d44 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x554>
101622d3c:     	ldr	w9, [x23, #0x74]
101622d40:     	b	0x101622d48 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x558>
101622d44:     	mov	w9, #0x0                ; =0
101622d48:     	orr	w21, w21, w26
101622d4c:     	orr	w22, w22, w8
101622d50:     	ldr	w8, [x23, #0x6c]
101622d54:     	add	w26, w9, w8
101622d58:     	ldur	w8, [x29, #-0xac]
101622d5c:     	cmp	w26, w8
101622d60:     	csel	w8, w26, w8, lt
101622d64:     	stur	w8, [x29, #-0xac]
101622d68:     	mov	x0, x23
101622d6c:     	bl	0x101f6f2c8 <__Z15UI_panel_size_yPK5Panel>
101622d70:     	add	w8, w26, w0
101622d74:     	cmp	w27, w8
101622d78:     	csel	w27, w27, w8, gt
101622d7c:     	ldr	x23, [x23]
101622d80:     	mov	w26, #0x1               ; =1
101622d84:     	cbnz	x23, 0x101622d08 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x518>
101622d88:     	b	0x101622dc8 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x5d8>
101622d8c:     	ldur	w8, [x29, #-0x98]
101622d90:     	b	0x101622dbc <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x5cc>
101622d94:     	ldr	x0, [x26, #0x68]
101622d98:     	bl	0x10210e7f4 <__Z28ED_buttons_search_string_getP15SpaceProperties>
101622d9c:     	mov	x25, x0
101622da0:     	b	0x1016229fc <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x20c>
101622da4:     	mov	w8, #0x1                ; =1
101622da8:     	b	0x1016228e4 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0xf4>
101622dac:     	ldr	s0, [x19, #0x28]
101622db0:     	fcvtzs	w9, s0
101622db4:     	cmp	w8, w9
101622db8:     	csel	w8, w8, w9, lt
101622dbc:     	neg	w8, w8
101622dc0:     	b	0x101622f20 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x730>
101622dc4:     	tbz	w26, #0x0, 0x101622e4c <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x65c>
101622dc8:     	tst	w22, #0x1
101622dcc:     	mov	w8, #0x8                ; =8
101622dd0:     	mov	w9, #0xe                ; =14
101622dd4:     	csel	w8, w9, w8, ne
101622dd8:     	tbz	w21, #0x0, 0x101622e0c <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x61c>
101622ddc:     	stur	xzr, [x29, #-0x88]
101622de0:     	sub	x1, x29, #0x88
101622de4:     	mov	x0, x20
101622de8:     	mov	x2, #0x0                ; =0
101622dec:     	bl	0x101f8c4bc <__Z26UI_ipad_knife_hud_geometryPK8bContextPiPb>
101622df0:     	ldur	w8, [x29, #-0x88]
101622df4:     	cmp	w8, #0x1
101622df8:     	csinc	w25, w8, wzr, gt
101622dfc:     	adrp	x8, 0x106d88000 <_build_commit_date>
101622e00:     	add	x8, x8, #0xe08
101622e04:     	ldr	s0, [x8, #0x2654]
101622e08:     	b	0x101622e30 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x640>
101622e0c:     	mov	w9, #0x2912             ; =10514
101622e10:     	adrp	x10, 0x106d88000 <_build_commit_date>
101622e14:     	add	x10, x10, #0xe08
101622e18:     	ldrsh	w9, [x10, x9]
101622e1c:     	mul	w8, w8, w9
101622e20:     	scvtf	s1, w8
101622e24:     	ldr	s0, [x10, #0x2654]
101622e28:     	fdiv	s1, s1, s0
101622e2c:     	fcvtzs	w25, s1
101622e30:     	ldur	w8, [x29, #-0xac]
101622e34:     	sub	w8, w27, w8
101622e38:     	ucvtf	s1, w8
101622e3c:     	fdiv	s0, s1, s0
101622e40:     	fcvtzs	w8, s0
101622e44:     	cmp	w8, #0x1
101622e48:     	csinc	w24, w8, wzr, gt
101622e4c:     	ldrsh	w8, [x19, #0xc6]
101622e50:     	cmp	w25, w8
101622e54:     	ldur	x9, [x29, #-0xb8]
101622e58:     	b.ne	0x101622e68 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x678>
101622e5c:     	ldrsh	w8, [x19, #0xc8]
101622e60:     	cmp	w24, w8
101622e64:     	b.eq	0x101622ef4 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x704>
101622e68:     	strh	w25, [x19, #0xc6]
101622e6c:     	strh	w24, [x19, #0xc8]
101622e70:     	cbz	x9, 0x101622ef4 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x704>
101622e74:     	ldrh	w8, [x9, #0x52]
101622e78:     	tbnz	w8, #0x3, 0x101622ef4 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x704>
101622e7c:     	orr	w8, w8, #0x8
101622e80:     	strh	w8, [x9, #0x52]
101622e84:     	ldrh	w8, [x19, #0xc2]
101622e88:     	cmp	w8, #0x7
101622e8c:     	b.eq	0x101622ef4 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x704>
101622e90:     	ldr	x8, [x19]
101622e94:     	cbz	x8, 0x101622ef4 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x704>
101622e98:     	mov	w9, #0xffd1             ; =65489
101622e9c:     	b	0x101622ea8 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x6b8>
101622ea0:     	ldr	x8, [x8]
101622ea4:     	cbz	x8, 0x101622ef4 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x704>
101622ea8:     	ldrh	w10, [x19, #0xca]
101622eac:     	ldrh	w11, [x8, #0xca]
101622eb0:     	cmp	w10, w11
101622eb4:     	b.ne	0x101622ea0 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x6b0>
101622eb8:     	ldrh	w10, [x8, #0xc2]
101622ebc:     	cmp	w10, #0x7
101622ec0:     	b.eq	0x101622ea0 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x6b0>
101622ec4:     	ldr	x10, [x8, #0x128]
101622ec8:     	ldrh	w11, [x10, #0x2b2]
101622ecc:     	tbnz	w11, #0x3, 0x101622ea0 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x6b0>
101622ed0:     	and	w11, w11, w9
101622ed4:     	strh	w11, [x10, #0x2b2]
101622ed8:     	ldr	x10, [x8, #0x128]
101622edc:     	ldrh	w11, [x10, #0x2b2]
101622ee0:     	orr	w11, w11, #0x1
101622ee4:     	strh	w11, [x10, #0x2b2]
101622ee8:     	ldr	x10, [x8, #0x128]
101622eec:     	stp	xzr, xzr, [x10, #0xc0]
101622ef0:     	b	0x101622ea0 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x6b0>
101622ef4:     	ldr	h0, [x19, #0xc8]
101622ef8:     	sshll.4s	v0, v0, #0x0
101622efc:     	scvtf	s0, s0
101622f00:     	adrp	x8, 0x106d88000 <_build_commit_date>
101622f04:     	add	x8, x8, #0xe08
101622f08:     	ldr	s1, [x8, #0x2654]
101622f0c:     	fmul	s0, s1, s0
101622f10:     	fmov	s1, #-1.00000000
101622f14:     	fadd	s0, s0, s1
101622f18:     	fabs	s0, s0
101622f1c:     	fcvtzs	w8, s0
101622f20:     	stur	w8, [x29, #-0x98]
101622f24:     	ldr	x8, [x19, #0x128]
101622f28:     	add	x1, x8, #0x260
101622f2c:     	mov	x0, x20
101622f30:     	bl	0x101f111f8 <__Z36UI_blocklist_update_view_for_buttonsPK8bContextPK8ListBase>
101622f34:     	tbz	w28, #0x0, 0x101622f44 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x754>
101622f38:     	ldp	w2, w1, [x29, #-0x98]
101622f3c:     	add	x0, x19, #0x10
101622f40:     	bl	0x101fdceb4 <__Z21UI_view2d_totRect_setP6View2Dii>
101622f44:     	ldur	w8, [x29, #-0x9c]
101622f48:     	cbz	w8, 0x101622f58 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x768>
101622f4c:     	ldr	x8, [x19, #0x128]
101622f50:     	ldur	x9, [x29, #-0xa8]
101622f54:     	str	x9, [x8, #0xe8]
101622f58:     	ldur	x8, [x29, #-0x78]
101622f5c:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
101622f60:     	ldr	x9, [x9, #0x7f0]
101622f64:     	ldr	x9, [x9]
101622f68:     	cmp	x9, x8
101622f6c:     	b.ne	0x101622f98 <__Z26ED_region_panels_layout_exPK8bContextP7ARegionP8ListBaseN7blender2wm13OpCallContextEPPKcSA_+0x7a8>
101622f70:     	sub	sp, x29, #0x70
101622f74:     	ldp	x29, x30, [sp, #0x70]
101622f78:     	ldp	x20, x19, [sp, #0x60]
101622f7c:     	ldp	x22, x21, [sp, #0x50]
101622f80:     	ldp	x24, x23, [sp, #0x40]
101622f84:     	ldp	x26, x25, [sp, #0x30]
101622f88:     	ldp	x28, x27, [sp, #0x20]
101622f8c:     	ldp	d9, d8, [sp, #0x10]
101622f90:     	ldp	d11, d10, [sp], #0x80
101622f94:     	ret
101622f98:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
