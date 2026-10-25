
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b486ec <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi>:
100b486ec:     	sub	sp, sp, #0x1f0
100b486f0:     	stp	d9, d8, [sp, #0x180]
100b486f4:     	stp	x28, x27, [sp, #0x190]
100b486f8:     	stp	x26, x25, [sp, #0x1a0]
100b486fc:     	stp	x24, x23, [sp, #0x1b0]
100b48700:     	stp	x22, x21, [sp, #0x1c0]
100b48704:     	stp	x20, x19, [sp, #0x1d0]
100b48708:     	stp	x29, x30, [sp, #0x1e0]
100b4870c:     	add	x29, sp, #0x1e0
100b48710:     	mov	x23, x2
100b48714:     	mov	x28, x1
100b48718:     	mov	x25, x0
100b4871c:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
100b48720:     	ldr	x8, [x8, #0x7f0]
100b48724:     	ldr	x8, [x8]
100b48728:     	stur	x8, [x29, #-0x70]
100b4872c:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b48730:     	mov	x22, x0
100b48734:     	mov	x0, x28
100b48738:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b4873c:     	mov	x19, x0
100b48740:     	adrp	x0, 0x104bd0000 <__ZL3hex+0x434d>
100b48744:     	add	x0, x0, #0x286
100b48748:     	bl	0x1008f2fe0 <__Z21GPU_debug_group_beginPKc>
100b4874c:     	mov	x0, x25
100b48750:     	mov	x1, x28
100b48754:     	bl	0x10163b824 <__Z28ED_ipad_hud_compositor_beginP8bContextP8wmWindow>
100b48758:     	ldr	w8, [x19, #0x144]
100b4875c:     	ldrsw	x9, [x28, #0xc0]
100b48760:     	stp	x8, x9, [sp, #0x80]
100b48764:     	str	xzr, [sp, #0x90]
100b48768:     	strh	wzr, [sp, #0x98]
100b4876c:     	movi.16b	v0, #0x0
100b48770:     	stp	q0, q0, [sp, #0xa0]
100b48774:     	str	q0, [sp, #0xc0]
100b48778:     	mov	x0, x28
100b4877c:     	str	x19, [sp, #0x38]
100b48780:     	mov	x1, x19
100b48784:     	bl	0x101624af8 <__Z26ED_screen_areas_iter_firstPK8wmWindowPK7bScreen>
100b48788:     	mov	x1, x0
100b4878c:     	b	0x100b4879c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xb0>
100b48790:     	ldr	x0, [sp, #0x38]
100b48794:     	bl	0x101624b1c <__Z25ED_screen_areas_iter_nextPK7bScreenPK7ScrArea>
100b48798:     	mov	x1, x0
100b4879c:     	cbz	x1, 0x100b487c4 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xd8>
100b487a0:     	ldr	x8, [x1, #0x78]
100b487a4:     	cbz	x8, 0x100b48790 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xa4>
100b487a8:     	ldr	x9, [x8, #0x128]
100b487ac:     	strb	wzr, [x9, #0x1]
100b487b0:     	ldr	x9, [x8, #0x128]
100b487b4:     	strb	wzr, [x9, #0x2]
100b487b8:     	ldr	x8, [x8]
100b487bc:     	cbnz	x8, 0x100b487a8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xbc>
100b487c0:     	b	0x100b48790 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xa4>
100b487c4:     	mov	x0, x28
100b487c8:     	bl	0x100b8f440 <__Z16wmWindowViewportPK8wmWindow>
100b487cc:     	ldr	x0, [sp, #0x38]
100b487d0:     	bl	0x101633618 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b487d4:     	cbz	w0, 0x100b48824 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x138>
100b487d8:     	add	x4, sp, #0x80
100b487dc:     	mov	x0, x25
100b487e0:     	mov	x1, x28
100b487e4:     	mov	x2, x23
100b487e8:     	mov	w3, #0x0                ; =0
100b487ec:     	bl	0x100b4ad48 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame>
100b487f0:     	add	x4, sp, #0x80
100b487f4:     	mov	x0, x25
100b487f8:     	mov	x1, x28
100b487fc:     	mov	x2, x23
100b48800:     	mov	w3, #0x1                ; =1
100b48804:     	bl	0x100b4ad48 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame>
100b48808:     	add	x4, sp, #0x80
100b4880c:     	mov	x0, x25
100b48810:     	mov	x1, x28
100b48814:     	mov	x2, x23
100b48818:     	mov	w3, #0x2                ; =2
100b4881c:     	bl	0x100b4ad48 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame>
100b48820:     	b	0x100b4883c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x150>
100b48824:     	add	x4, sp, #0x80
100b48828:     	mov	x0, x25
100b4882c:     	mov	x1, x28
100b48830:     	mov	x2, x23
100b48834:     	mov	w3, #-0x1               ; =-1
100b48838:     	bl	0x100b4ad48 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame>
100b4883c:     	mov	w0, #0x0                ; =0
100b48840:     	mov	w1, #0x0                ; =0
100b48844:     	bl	0x101faafbc <__Z11UI_SetThemeii>
100b48848:     	mov	x0, x28
100b4884c:     	bl	0x10162b69c <__Z20ED_screen_draw_edgesP8wmWindow>
100b48850:     	fmov	s0, wzr
100b48854:     	mov	x0, x28
100b48858:     	bl	0x100b8f3a0 <__Z19wmWindowViewport_exPK8wmWindowf>
100b4885c:     	ldr	x8, [x28, #0x140]
100b48860:     	cmp	x8, #0x0
100b48864:     	cset	w2, ne
100b48868:     	strb	w2, [sp, #0x99]
100b4886c:     	mov	x0, x25
100b48870:     	mov	x1, x28
100b48874:     	bl	0x10163cc78 <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb>
100b48878:     	ldr	x19, [x28, #0x140]
100b4887c:     	cbz	x19, 0x100b48894 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1a8>
100b48880:     	ldp	x8, x1, [x19, #0x10]
100b48884:     	ldr	x19, [x19]
100b48888:     	mov	x0, x28
100b4888c:     	blr	x8
100b48890:     	cbnz	x19, 0x100b48880 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x194>
100b48894:     	mov	x0, x28
100b48898:     	bl	0x100b8f440 <__Z16wmWindowViewportPK8wmWindow>
100b4889c:     	ldr	x0, [sp, #0x38]
100b488a0:     	bl	0x101633618 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b488a4:     	cbz	w0, 0x100b488bc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1d0>
100b488a8:     	mov	x0, x25
100b488ac:     	mov	x1, x28
100b488b0:     	bl	0x10163fb4c <__Z19ED_ipad_panels_drawP8bContextP8wmWindow>
100b488b4:     	mov	x0, x28
100b488b8:     	bl	0x100b8f440 <__Z16wmWindowViewportPK8wmWindow>
100b488bc:     	ldr	x8, [sp, #0x38]
100b488c0:     	ldr	x20, [x8, #0x1d0]
100b488c4:     	cbnz	x20, 0x100b48a64 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x378>
100b488c8:     	ldr	x8, [x28, #0x128]
100b488cc:     	cbz	x8, 0x100b488e8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1fc>
100b488d0:     	mov	x0, x28
100b488d4:     	bl	0x100b6e938 <__Z15wm_gesture_drawP8wmWindow>
100b488d8:     	mov	x0, x28
100b488dc:     	bl	0x100b8f440 <__Z16wmWindowViewportPK8wmWindow>
100b488e0:     	mov	x0, x25
100b488e4:     	bl	0x100b6f9b0 <__Z30WM_gesture_ipad_selection_drawP8bContext>
100b488e8:     	ldr	x8, [x22, #0x5c0]
100b488ec:     	ldr	x8, [x8, #0xb8]
100b488f0:     	cbz	x8, 0x100b48908 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x21c>
100b488f4:     	mov	x0, x25
100b488f8:     	mov	x1, x28
100b488fc:     	bl	0x100b47ba8 <__Z13wm_drags_drawP8bContextP8wmWindow>
100b48900:     	mov	x0, x28
100b48904:     	bl	0x100b8f440 <__Z16wmWindowViewportPK8wmWindow>
100b48908:     	adrp	x19, 0x106658000 <__ZN7blender3seq28seqModifierType_WhiteBalanceE+0x40>
100b4890c:     	ldrb	w8, [x19, #0x210]
100b48910:     	cmp	w8, #0xff
100b48914:     	b.eq	0x100b49b2c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1440>
100b48918:     	cbz	w8, 0x100b48d64 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x678>
100b4891c:     	ldr	x0, [x28, #0x10]
100b48920:     	bl	0x101094a90 <_GHOST_GetCursorVisibility>
100b48924:     	cbz	w0, 0x100b48a88 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x39c>
100b48928:     	ldr	x0, [x28, #0x10]
100b4892c:     	add	x8, sp, #0xf0
100b48930:     	add	x1, sp, #0xf0
100b48934:     	add	x2, x8, #0x4
100b48938:     	add	x3, x8, #0x8
100b4893c:     	sub	x4, x29, #0xb0
100b48940:     	bl	0x101094b50 <_GHOST_GetCursorGrabState>
100b48944:     	ldurb	w8, [x29, #-0xb0]
100b48948:     	cmp	w8, #0x1
100b4894c:     	b.ne	0x100b48a88 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x39c>
100b48950:     	ldr	x8, [x28, #0xf0]
100b48954:     	ldp	w23, w21, [x8, #0x14]
100b48958:     	ldr	w8, [sp, #0xf4]
100b4895c:     	tbz	w8, #0x0, 0x100b4898c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x2a0>
100b48960:     	ldr	w9, [sp, #0xf8]
100b48964:     	ldr	w10, [sp, #0x100]
100b48968:     	subs	w10, w10, w9
100b4896c:     	b.eq	0x100b4898c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x2a0>
100b48970:     	sub	w11, w23, w9
100b48974:     	sdiv	w12, w11, w10
100b48978:     	msub	w11, w12, w10, w11
100b4897c:     	add	w11, w11, w10
100b48980:     	sdiv	w12, w11, w10
100b48984:     	msub	w10, w12, w10, w11
100b48988:     	add	w23, w10, w9
100b4898c:     	tbz	w8, #0x1, 0x100b489d0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x2e4>
100b48990:     	mov	x0, x28
100b48994:     	bl	0x100b96a8c <__Z24WM_window_native_pixel_yPK8wmWindow>
100b48998:     	ldr	w8, [sp, #0xfc]
100b4899c:     	ldr	w9, [sp, #0x104]
100b489a0:     	cmp	w9, w8
100b489a4:     	b.eq	0x100b489d0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x2e4>
100b489a8:     	sub	w9, w0, w9
100b489ac:     	sub	w10, w21, w9
100b489b0:     	sub	w8, w0, w8
100b489b4:     	sub	w8, w8, w9
100b489b8:     	sdiv	w11, w10, w8
100b489bc:     	msub	w10, w11, w8, w10
100b489c0:     	add	w10, w10, w8
100b489c4:     	sdiv	w11, w10, w8
100b489c8:     	msub	w8, w11, w8, w10
100b489cc:     	add	w21, w8, w9
100b489d0:     	mov	x0, x28
100b489d4:     	bl	0x100b943d8 <__Z23WM_window_dpi_get_scalePK8wmWindow>
100b489d8:     	fmov	s8, s0
100b489dc:     	stp	xzr, xzr, [x29, #-0xd0]
100b489e0:     	stur	xzr, [x29, #-0xc0]
100b489e4:     	ldr	x0, [x28, #0x10]
100b489e8:     	sub	x1, x29, #0xd0
100b489ec:     	bl	0x101094a78 <_GHOST_GetCursorBitmap>
100b489f0:     	cmp	w0, #0x1
100b489f4:     	b.ne	0x100b48ab0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x3c4>
100b489f8:     	bl	0x100a61d38 <__Z9GPU_blend9eGPUBlend>
100b489fc:     	ldp	w1, w2, [x29, #-0xc8]
100b48a00:     	adrp	x0, 0x104bd0000 <__ZL3hex+0x434d>
100b48a04:     	add	x0, x0, #0x2bc
100b48a08:     	mov	w3, #0x1                ; =1
100b48a0c:     	mov	w4, #0xc                ; =12
100b48a10:     	mov	w5, #0x1f               ; =31
100b48a14:     	mov	x6, #0x0                ; =0
100b48a18:     	bl	0x100a63978 <__Z21GPU_texture_create_2dPKciiiN7blender3gpu13TextureFormatE16eGPUTextureUsagePKf>
100b48a1c:     	mov	x22, x0
100b48a20:     	ldur	x2, [x29, #-0xd0]
100b48a24:     	mov	w1, #0x4                ; =4
100b48a28:     	bl	0x100a642bc <__Z18GPU_texture_updatePN7blender3gpu7TextureE14eGPUDataFormatPKv>
100b48a2c:     	mov	x0, x22
100b48a30:     	mov	w1, #0x0                ; =0
100b48a34:     	bl	0x100a64534 <__Z23GPU_texture_filter_modePN7blender3gpu7TextureEb>
100b48a38:     	bl	0x1008f9a44 <__Z15GPU_matrix_pushv>
100b48a3c:     	bl	0x100b94dc4 <__Z20WM_capabilities_flagv>
100b48a40:     	tbnz	w0, #0xa, 0x100b48be0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x4f4>
100b48a44:     	fmov	s0, #0.50000000
100b48a48:     	fadd	s0, s8, s0
100b48a4c:     	fcvtms	w8, s0
100b48a50:     	cmp	w8, #0x1
100b48a54:     	csinc	w19, w8, wzr, gt
100b48a58:     	b	0x100b48be4 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x4f8>
100b48a5c:     	ldr	x20, [x20]
100b48a60:     	cbz	x20, 0x100b488c8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1dc>
100b48a64:     	ldr	x8, [x20, #0x128]
100b48a68:     	ldrh	w8, [x8, #0x2b0]
100b48a6c:     	cbz	w8, 0x100b48a5c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x370>
100b48a70:     	mov	x0, x20
100b48a74:     	mov	w1, #0x0                ; =0
100b48a78:     	mov	w2, #0x1                ; =1
100b48a7c:     	mov	x3, #0x0                ; =0
100b48a80:     	bl	0x100b48214 <__ZL28wm_draw_region_blend_receiptP7ARegionibP4rcti>
100b48a84:     	b	0x100b48a5c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x370>
100b48a88:     	adrp	x9, 0x106658000 <__ZN7blender3seq28seqModifierType_WhiteBalanceE+0x40>
100b48a8c:     	ldr	w8, [x9, #0x214]
100b48a90:     	ldr	w10, [x28, #0xc0]
100b48a94:     	cmp	w8, w10
100b48a98:     	b.ne	0x100b48d64 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x678>
100b48a9c:     	mov	w8, #-0x1               ; =-1
100b48aa0:     	str	w8, [x9, #0x214]
100b48aa4:     	adrp	x9, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b48aa8:     	str	w8, [x9, #0x798]
100b48aac:     	b	0x100b48d5c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x670>
100b48ab0:     	bl	0x100b96a48 <__Z32WM_cursor_preferred_logical_sizev>
100b48ab4:     	mov	x20, x0
100b48ab8:     	bl	0x1008f4788 <__Z15immVertexFormatv>
100b48abc:     	adrp	x1, 0x104b9e000 <__ZZ25BLI_hash_md5_to_hexdigestPKvPcE7hex_map+0x86e1>
100b48ac0:     	add	x1, x1, #0x7d7
100b48ac4:     	mov	w2, #0x3                ; =3
100b48ac8:     	mov	w3, #0x2e               ; =46
100b48acc:     	bl	0x100a662b8 <__Z23GPU_vertformat_attr_addP13GPUVertFormatN7blender9StringRefENS1_3gpu12VertAttrTypeE>
100b48ad0:     	mov	x22, x0
100b48ad4:     	mov	w0, #0x29               ; =41
100b48ad8:     	bl	0x1008f4848 <__Z21immBindBuiltinProgram17eGPUBuiltinShader>
100b48adc:     	fmov	s0, #1.00000000
100b48ae0:     	fmov	s1, #1.00000000
100b48ae4:     	fmov	s2, #1.00000000
100b48ae8:     	fmov	s3, #1.00000000
100b48aec:     	bl	0x1008f5b24 <__Z17immUniformColor4fffff>
100b48af0:     	ucvtf	s0, w20
100b48af4:     	fmov	s1, #24.00000000
100b48af8:     	fdiv	s0, s0, s1
100b48afc:     	fmul	s0, s8, s0
100b48b00:     	fmov	s1, #1.00000000
100b48b04:     	fmaxnm	s8, s0, s1
100b48b08:     	fcvtzs	w19, s8, #0x3
100b48b0c:     	fadd	s0, s8, s8
100b48b10:     	fcvtzs	w20, s0
100b48b14:     	sub	w8, w23, w19
100b48b18:     	scvtf	s0, w8
100b48b1c:     	sub	w8, w21, w20
100b48b20:     	scvtf	s1, w8
100b48b24:     	add	w8, w23, w19
100b48b28:     	scvtf	s2, w8
100b48b2c:     	add	w8, w21, w20
100b48b30:     	scvtf	s3, w8
100b48b34:     	mov	x0, x22
100b48b38:     	bl	0x1008f6924 <__Z8immRectfjffff>
100b48b3c:     	sub	w8, w23, w20
100b48b40:     	scvtf	s0, w8
100b48b44:     	sub	w8, w21, w19
100b48b48:     	scvtf	s1, w8
100b48b4c:     	add	w8, w23, w20
100b48b50:     	scvtf	s2, w8
100b48b54:     	add	w8, w21, w19
100b48b58:     	scvtf	s3, w8
100b48b5c:     	mov	x0, x22
100b48b60:     	bl	0x1008f6924 <__Z8immRectfjffff>
100b48b64:     	fmov	s0, wzr
100b48b68:     	fmov	s1, wzr
100b48b6c:     	fmov	s2, wzr
100b48b70:     	fmov	s3, #1.00000000
100b48b74:     	bl	0x1008f5b24 <__Z17immUniformColor4fffff>
100b48b78:     	fmov	s0, #7.00000000
100b48b7c:     	fmul	s0, s8, s0
100b48b80:     	fcvtzs	w19, s0
100b48b84:     	fcvtzs	w20, s8
100b48b88:     	sub	w8, w23, w19
100b48b8c:     	scvtf	s0, w8
100b48b90:     	sub	w8, w21, w20
100b48b94:     	scvtf	s1, w8
100b48b98:     	add	w8, w23, w19
100b48b9c:     	scvtf	s2, w8
100b48ba0:     	add	w8, w21, w20
100b48ba4:     	scvtf	s3, w8
100b48ba8:     	mov	x0, x22
100b48bac:     	bl	0x1008f6924 <__Z8immRectfjffff>
100b48bb0:     	sub	w8, w23, w20
100b48bb4:     	scvtf	s0, w8
100b48bb8:     	sub	w8, w21, w19
100b48bbc:     	scvtf	s1, w8
100b48bc0:     	add	w8, w23, w20
100b48bc4:     	scvtf	s2, w8
100b48bc8:     	add	w8, w21, w19
100b48bcc:     	scvtf	s3, w8
100b48bd0:     	mov	x0, x22
100b48bd4:     	bl	0x1008f6924 <__Z8immRectfjffff>
100b48bd8:     	bl	0x1008f48ec <__Z16immUnbindProgramv>
100b48bdc:     	b	0x100b48d40 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x654>
100b48be0:     	mov	w19, #0x1               ; =1
100b48be4:     	sub	x0, x29, #0xb0
100b48be8:     	bl	0x1007aa8a0 <__Z7unit_m4PA4_f>
100b48bec:     	ldp	w8, w9, [x29, #-0xc0]
100b48bf0:     	msub	w8, w8, w19, w23
100b48bf4:     	scvtf	s0, w8
100b48bf8:     	ldp	w10, w8, [x29, #-0xc8]
100b48bfc:     	sub	w9, w9, w8
100b48c00:     	madd	w9, w9, w19, w21
100b48c04:     	scvtf	s1, w9
100b48c08:     	mul	w9, w10, w19
100b48c0c:     	scvtf	s2, w9
100b48c10:     	stp	s0, s1, [x29, #-0x80]
100b48c14:     	mul	w8, w8, w19
100b48c18:     	scvtf	s0, w8
100b48c1c:     	stur	s2, [x29, #-0xb0]
100b48c20:     	stur	s0, [x29, #-0x9c]
100b48c24:     	sub	x0, x29, #0xb0
100b48c28:     	bl	0x1008f9d54 <__Z14GPU_matrix_mulPA4_Kf>
100b48c2c:     	bl	0x1008f4788 <__Z15immVertexFormatv>
100b48c30:     	mov	x20, x0
100b48c34:     	adrp	x1, 0x104b9e000 <__ZZ25BLI_hash_md5_to_hexdigestPKvPcE7hex_map+0x86e1>
100b48c38:     	add	x1, x1, #0x7d7
100b48c3c:     	mov	w2, #0x3                ; =3
100b48c40:     	mov	w3, #0x2f               ; =47
100b48c44:     	bl	0x100a662b8 <__Z23GPU_vertformat_attr_addP13GPUVertFormatN7blender9StringRefENS1_3gpu12VertAttrTypeE>
100b48c48:     	mov	x23, x0
100b48c4c:     	adrp	x1, 0x104ba1000 <__ZZ25BLI_hash_md5_to_hexdigestPKvPcE7hex_map+0xb6e1>
100b48c50:     	add	x1, x1, #0x7ff
100b48c54:     	mov	x0, x20
100b48c58:     	mov	w2, #0x8                ; =8
100b48c5c:     	mov	w3, #0x2e               ; =46
100b48c60:     	bl	0x100a662b8 <__Z23GPU_vertformat_attr_addP13GPUVertFormatN7blender9StringRefENS1_3gpu12VertAttrTypeE>
100b48c64:     	mov	x24, x0
100b48c68:     	mov	w0, #0x2c               ; =44
100b48c6c:     	bl	0x1008f4848 <__Z21immBindBuiltinProgram17eGPUBuiltinShader>
100b48c70:     	adrp	x0, 0x104b85000 <_zlibVersion+0x104b85000>
100b48c74:     	add	x0, x0, #0xab5
100b48c78:     	mov	x1, x22
100b48c7c:     	bl	0x1008f5a50 <__Z14immBindTexturePKcPN7blender3gpu7TextureE>
100b48c80:     	mov	w0, #0x6                ; =6
100b48c84:     	mov	w1, #0x4                ; =4
100b48c88:     	bl	0x1008f4940 <__Z8immBegin11GPUPrimTypej>
100b48c8c:     	fmov	s0, wzr
100b48c90:     	fmov	s1, #1.00000000
100b48c94:     	mov	x0, x24
100b48c98:     	bl	0x1008f5188 <__Z9immAttr2fjff>
100b48c9c:     	fmov	s0, wzr
100b48ca0:     	fmov	s1, wzr
100b48ca4:     	fmov	s2, wzr
100b48ca8:     	mov	x0, x23
100b48cac:     	bl	0x1008f55b4 <__Z11immVertex3fjfff>
100b48cb0:     	fmov	s0, #1.00000000
100b48cb4:     	fmov	s1, #1.00000000
100b48cb8:     	mov	x0, x24
100b48cbc:     	bl	0x1008f5188 <__Z9immAttr2fjff>
100b48cc0:     	fmov	s0, #1.00000000
100b48cc4:     	fmov	s1, wzr
100b48cc8:     	fmov	s2, wzr
100b48ccc:     	mov	x0, x23
100b48cd0:     	bl	0x1008f55b4 <__Z11immVertex3fjfff>
100b48cd4:     	fmov	s0, #1.00000000
100b48cd8:     	fmov	s1, wzr
100b48cdc:     	mov	x0, x24
100b48ce0:     	bl	0x1008f5188 <__Z9immAttr2fjff>
100b48ce4:     	fmov	s0, #1.00000000
100b48ce8:     	fmov	s1, #1.00000000
100b48cec:     	fmov	s2, wzr
100b48cf0:     	mov	x0, x23
100b48cf4:     	bl	0x1008f55b4 <__Z11immVertex3fjfff>
100b48cf8:     	fmov	s0, wzr
100b48cfc:     	fmov	s1, wzr
100b48d00:     	mov	x0, x24
100b48d04:     	bl	0x1008f5188 <__Z9immAttr2fjff>
100b48d08:     	fmov	s0, wzr
100b48d0c:     	fmov	s1, #1.00000000
100b48d10:     	fmov	s2, wzr
100b48d14:     	mov	x0, x23
100b48d18:     	bl	0x1008f55b4 <__Z11immVertex3fjfff>
100b48d1c:     	bl	0x1008f4cc8 <__Z6immEndv>
100b48d20:     	bl	0x1008f48ec <__Z16immUnbindProgramv>
100b48d24:     	bl	0x1008f9aa8 <__Z14GPU_matrix_popv>
100b48d28:     	mov	x0, x22
100b48d2c:     	bl	0x100a64438 <__Z18GPU_texture_unbindPN7blender3gpu7TextureE>
100b48d30:     	mov	x0, x22
100b48d34:     	bl	0x100a645e8 <__Z16GPU_texture_freePN7blender3gpu7TextureE>
100b48d38:     	mov	w0, #0x0                ; =0
100b48d3c:     	bl	0x100a61d38 <__Z9GPU_blend9eGPUBlend>
100b48d40:     	ldr	w8, [x28, #0xc0]
100b48d44:     	adrp	x9, 0x106658000 <__ZN7blender3seq28seqModifierType_WhiteBalanceE+0x40>
100b48d48:     	str	w8, [x9, #0x214]
100b48d4c:     	ldr	x8, [x28, #0xf0]
100b48d50:     	adrp	x9, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b48d54:     	ldp	w10, w8, [x8, #0x14]
100b48d58:     	str	w10, [x9, #0x798]
100b48d5c:     	adrp	x9, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b48d60:     	str	w8, [x9, #0x79c]
100b48d64:     	stp	xzr, xzr, [sp, #0x60]
100b48d68:     	str	xzr, [sp, #0x70]
100b48d6c:     	ldr	x0, [sp, #0x38]
100b48d70:     	bl	0x101633618 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b48d74:     	str	x28, [sp, #0x30]
100b48d78:     	str	x25, [sp, #0x48]
100b48d7c:     	cbz	w0, 0x100b491c0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xad4>
100b48d80:     	stp	xzr, xzr, [x29, #-0xb0]
100b48d84:     	stur	xzr, [x29, #-0xa0]
100b48d88:     	sub	x2, x29, #0xb0
100b48d8c:     	mov	x0, x25
100b48d90:     	mov	x1, x28
100b48d94:     	bl	0x1016333e4 <__Z29ED_ipad_panels_resize_regionsP8bContextP8wmWindowRNSt3__16vectorI4rctiNS3_9allocatorIS5_EEEE>
100b48d98:     	mov	x0, x28
100b48d9c:     	bl	0x100b96a8c <__Z24WM_window_native_pixel_yPK8wmWindow>
100b48da0:     	str	w0, [sp, #0x28]
100b48da4:     	ldp	x19, x10, [x29, #-0xb0]
100b48da8:     	cmp	x19, x10
100b48dac:     	b.eq	0x100b48ec4 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x7d8>
100b48db0:     	ldr	w8, [sp, #0x28]
100b48db4:     	sub	w11, w8, #0x1
100b48db8:     	ldr	x22, [sp, #0x68]
100b48dbc:     	str	x10, [sp, #0x50]
100b48dc0:     	str	w11, [sp, #0x40]
100b48dc4:     	b	0x100b48df8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x70c>
100b48dc8:     	stp	w21, w28, [x22]
100b48dcc:     	stp	w26, w27, [x22, #0x8]
100b48dd0:     	mov	w8, #0x2                ; =2
100b48dd4:     	str	w8, [x22, #0x10]
100b48dd8:     	strb	wzr, [x22, #0x14]
100b48ddc:     	str	xzr, [x22, #0x18]
100b48de0:     	add	x22, x22, #0x20
100b48de4:     	ldr	x28, [sp, #0x30]
100b48de8:     	str	x22, [sp, #0x68]
100b48dec:     	add	x19, x19, #0x10
100b48df0:     	cmp	x19, x10
100b48df4:     	b.eq	0x100b48ec4 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x7d8>
100b48df8:     	ldp	w9, w8, [x19, #0x8]
100b48dfc:     	sub	w28, w11, w8
100b48e00:     	ldp	w21, w26, [x19]
100b48e04:     	sub	w27, w11, w9
100b48e08:     	ldr	x8, [sp, #0x70]
100b48e0c:     	cmp	x22, x8
100b48e10:     	b.lo	0x100b48dc8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x6dc>
100b48e14:     	ldr	x23, [sp, #0x60]
100b48e18:     	sub	x24, x22, x23
100b48e1c:     	asr	x22, x24, #5
100b48e20:     	add	x9, x22, #0x1
100b48e24:     	lsr	x10, x9, #59
100b48e28:     	cbnz	x10, 0x100b49b58 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x146c>
100b48e2c:     	sub	x8, x8, x23
100b48e30:     	asr	x10, x8, #4
100b48e34:     	cmp	x10, x9
100b48e38:     	csel	x9, x10, x9, hi
100b48e3c:     	mov	x10, #0x7fffffffffffffe0 ; =9223372036854775776
100b48e40:     	cmp	x8, x10
100b48e44:     	mov	x8, #0x7ffffffffffffff  ; =576460752303423487
100b48e48:     	csel	x25, x9, x8, lo
100b48e4c:     	cbz	x25, 0x100b48e68 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x77c>
100b48e50:     	lsr	x8, x25, #59
100b48e54:     	cbnz	x8, 0x100b49b70 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1484>
100b48e58:     	lsl	x0, x25, #5
100b48e5c:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
100b48e60:     	mov	x20, x0
100b48e64:     	b	0x100b48e6c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x780>
100b48e68:     	mov	x20, #0x0               ; =0
100b48e6c:     	add	x8, x20, x22, lsl #5
100b48e70:     	stp	w21, w28, [x8]
100b48e74:     	stp	w26, w27, [x8, #0x8]
100b48e78:     	add	x21, x20, x25, lsl #5
100b48e7c:     	mov	w9, #0x2                ; =2
100b48e80:     	str	w9, [x8, #0x10]
100b48e84:     	strb	wzr, [x8, #0x14]
100b48e88:     	add	x22, x8, #0x20
100b48e8c:     	str	xzr, [x8, #0x18]
100b48e90:     	mov	x0, x20
100b48e94:     	mov	x1, x23
100b48e98:     	mov	x2, x24
100b48e9c:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
100b48ea0:     	stp	x20, x22, [sp, #0x60]
100b48ea4:     	str	x21, [sp, #0x70]
100b48ea8:     	cbz	x23, 0x100b48eb4 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x7c8>
100b48eac:     	mov	x0, x23
100b48eb0:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b48eb4:     	ldr	x28, [sp, #0x30]
100b48eb8:     	ldp	x25, x10, [sp, #0x48]
100b48ebc:     	ldr	w11, [sp, #0x40]
100b48ec0:     	b	0x100b48de8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x6fc>
100b48ec4:     	stp	xzr, xzr, [x29, #-0xd0]
100b48ec8:     	stur	xzr, [x29, #-0xc0]
100b48ecc:     	sub	x2, x29, #0xd0
100b48ed0:     	mov	x0, x25
100b48ed4:     	mov	x1, x28
100b48ed8:     	bl	0x10163d064 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE>
100b48edc:     	ldp	x19, x9, [x29, #-0xd0]
100b48ee0:     	cmp	x19, x9
100b48ee4:     	b.eq	0x100b49000 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x914>
100b48ee8:     	ldr	w8, [sp, #0x28]
100b48eec:     	sub	w10, w8, #0x1
100b48ef0:     	ldr	x28, [sp, #0x68]
100b48ef4:     	mov	w26, #0x1               ; =1
100b48ef8:     	str	x9, [sp, #0x40]
100b48efc:     	str	w10, [sp, #0x28]
100b48f00:     	b	0x100b48f2c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x840>
100b48f04:     	stp	w15, w24, [x28]
100b48f08:     	stp	w25, w21, [x28, #0x8]
100b48f0c:     	str	w26, [x28, #0x10]
100b48f10:     	strb	wzr, [x28, #0x14]
100b48f14:     	str	x27, [x28, #0x18]
100b48f18:     	add	x28, x28, #0x20
100b48f1c:     	str	x28, [sp, #0x68]
100b48f20:     	add	x19, x19, #0x18
100b48f24:     	cmp	x19, x9
100b48f28:     	b.eq	0x100b49000 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x914>
100b48f2c:     	ldp	w25, w8, [x19, #0x8]
100b48f30:     	sub	w24, w10, w8
100b48f34:     	ldp	w15, w8, [x19]
100b48f38:     	sub	w21, w10, w8
100b48f3c:     	ldr	x27, [x19, #0x10]
100b48f40:     	ldr	x8, [sp, #0x70]
100b48f44:     	cmp	x28, x8
100b48f48:     	b.lo	0x100b48f04 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x818>
100b48f4c:     	ldr	x22, [sp, #0x60]
100b48f50:     	sub	x23, x28, x22
100b48f54:     	asr	x28, x23, #5
100b48f58:     	add	x9, x28, #0x1
100b48f5c:     	lsr	x10, x9, #59
100b48f60:     	cbnz	x10, 0x100b49b64 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1478>
100b48f64:     	sub	x8, x8, x22
100b48f68:     	asr	x10, x8, #4
100b48f6c:     	cmp	x10, x9
100b48f70:     	csel	x9, x10, x9, hi
100b48f74:     	mov	x10, #0x7fffffffffffffe0 ; =9223372036854775776
100b48f78:     	cmp	x8, x10
100b48f7c:     	mov	x8, #0x7ffffffffffffff  ; =576460752303423487
100b48f80:     	csel	x26, x9, x8, lo
100b48f84:     	cbz	x26, 0x100b48fa8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x8bc>
100b48f88:     	str	w15, [sp, #0x50]
100b48f8c:     	lsr	x8, x26, #59
100b48f90:     	cbnz	x8, 0x100b49b78 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x148c>
100b48f94:     	lsl	x0, x26, #5
100b48f98:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
100b48f9c:     	mov	x20, x0
100b48fa0:     	ldr	w15, [sp, #0x50]
100b48fa4:     	b	0x100b48fac <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x8c0>
100b48fa8:     	mov	x20, #0x0               ; =0
100b48fac:     	add	x8, x20, x28, lsl #5
100b48fb0:     	stp	w15, w24, [x8]
100b48fb4:     	stp	w25, w21, [x8, #0x8]
100b48fb8:     	add	x21, x20, x26, lsl #5
100b48fbc:     	mov	w26, #0x1               ; =1
100b48fc0:     	str	w26, [x8, #0x10]
100b48fc4:     	strb	wzr, [x8, #0x14]
100b48fc8:     	add	x28, x8, #0x20
100b48fcc:     	str	x27, [x8, #0x18]
100b48fd0:     	mov	x0, x20
100b48fd4:     	mov	x1, x22
100b48fd8:     	mov	x2, x23
100b48fdc:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
100b48fe0:     	stp	x20, x28, [sp, #0x60]
100b48fe4:     	str	x21, [sp, #0x70]
100b48fe8:     	cbz	x22, 0x100b48ff4 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x908>
100b48fec:     	mov	x0, x22
100b48ff0:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b48ff4:     	ldr	x9, [sp, #0x40]
100b48ff8:     	ldr	w10, [sp, #0x28]
100b48ffc:     	b	0x100b48f1c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x830>
100b49000:     	ldp	x28, x8, [sp, #0x30]
100b49004:     	ldr	x19, [x8, #0x1c0]
100b49008:     	cbz	x19, 0x100b4919c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xab0>
100b4900c:     	adrp	x21, 0x106d88000 <_build_commit_date>
100b49010:     	add	x21, x21, #0xe08
100b49014:     	mov	w24, #0x2623            ; =9763
100b49018:     	mov	w25, #0x2626            ; =9766
100b4901c:     	mov	w20, #0x1               ; =1
100b49020:     	b	0x100b49048 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x95c>
100b49024:     	stp	w13, w16, [x8]
100b49028:     	stp	w26, w15, [x8, #0x8]
100b4902c:     	str	w20, [x8, #0x10]
100b49030:     	strb	wzr, [x8, #0x14]
100b49034:     	add	x26, x8, #0x20
100b49038:     	str	xzr, [x8, #0x18]
100b4903c:     	str	x26, [sp, #0x68]
100b49040:     	ldr	x19, [x19]
100b49044:     	cbz	x19, 0x100b4919c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xab0>
100b49048:     	ldr	w8, [x19, #0xd8]
100b4904c:     	cmp	w8, #0x1
100b49050:     	b.ne	0x100b49040 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x954>
100b49054:     	ldrb	w8, [x19, #0x48]
100b49058:     	cmp	w8, #0x1
100b4905c:     	b.ne	0x100b49040 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x954>
100b49060:     	ldr	x8, [x19, #0x68]
100b49064:     	cbz	x8, 0x100b49040 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x954>
100b49068:     	ldrb	w8, [x8, #0xf1]
100b4906c:     	tst	w8, #0x3
100b49070:     	b.ne	0x100b49040 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x954>
100b49074:     	ldrb	w8, [x21, x25]
100b49078:     	tbnz	w8, #0x1, 0x100b49084 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x998>
100b4907c:     	ldrb	w8, [x21, x24]
100b49080:     	cbnz	w8, 0x100b49040 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x954>
100b49084:     	ldr	w8, [x19, #0x144]
100b49088:     	ldr	w9, [x19, #0x140]
100b4908c:     	cmp	w8, w9
100b49090:     	b.le	0x100b49040 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x954>
100b49094:     	ldr	w8, [x19, #0x14c]
100b49098:     	ldr	w9, [x19, #0x148]
100b4909c:     	cmp	w8, w9
100b490a0:     	b.le	0x100b49040 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x954>
100b490a4:     	mov	x0, x28
100b490a8:     	bl	0x100b96a8c <__Z24WM_window_native_pixel_yPK8wmWindow>
100b490ac:     	ldr	w13, [x19, #0x140]
100b490b0:     	sub	w8, w0, #0x1
100b490b4:     	ldr	w9, [x19, #0x14c]
100b490b8:     	sub	w16, w8, w9
100b490bc:     	ldr	w26, [x19, #0x144]
100b490c0:     	ldr	w9, [x19, #0x148]
100b490c4:     	sub	w15, w8, w9
100b490c8:     	ldp	x8, x9, [sp, #0x68]
100b490cc:     	cmp	x8, x9
100b490d0:     	b.lo	0x100b49024 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x938>
100b490d4:     	mov	x12, #0x7ffffffffffffff ; =576460752303423487
100b490d8:     	mov	x11, #0x7fffffffffffffe0 ; =9223372036854775776
100b490dc:     	ldr	x22, [sp, #0x60]
100b490e0:     	sub	x23, x8, x22
100b490e4:     	asr	x27, x23, #5
100b490e8:     	add	x8, x27, #0x1
100b490ec:     	lsr	x10, x8, #59
100b490f0:     	cbnz	x10, 0x100b49b98 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x14ac>
100b490f4:     	sub	x9, x9, x22
100b490f8:     	asr	x10, x9, #4
100b490fc:     	cmp	x10, x8
100b49100:     	csel	x8, x10, x8, hi
100b49104:     	cmp	x9, x11
100b49108:     	csel	x28, x8, x12, lo
100b4910c:     	cbz	x28, 0x100b49144 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xa58>
100b49110:     	str	w16, [sp, #0x40]
100b49114:     	str	w15, [sp, #0x50]
100b49118:     	lsr	x8, x28, #59
100b4911c:     	cbnz	x8, 0x100b49ba4 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x14b8>
100b49120:     	mov	x24, x13
100b49124:     	lsl	x0, x28, #5
100b49128:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
100b4912c:     	mov	x20, x0
100b49130:     	mov	x13, x24
100b49134:     	mov	w24, #0x2623            ; =9763
100b49138:     	ldr	w15, [sp, #0x50]
100b4913c:     	ldr	w16, [sp, #0x40]
100b49140:     	b	0x100b49148 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xa5c>
100b49144:     	mov	x20, #0x0               ; =0
100b49148:     	add	x8, x20, x27, lsl #5
100b4914c:     	stp	w13, w16, [x8]
100b49150:     	stp	w26, w15, [x8, #0x8]
100b49154:     	add	x27, x20, x28, lsl #5
100b49158:     	mov	w9, #0x1                ; =1
100b4915c:     	str	w9, [x8, #0x10]
100b49160:     	strb	wzr, [x8, #0x14]
100b49164:     	add	x26, x8, #0x20
100b49168:     	str	xzr, [x8, #0x18]
100b4916c:     	mov	x0, x20
100b49170:     	mov	x1, x22
100b49174:     	mov	x2, x23
100b49178:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
100b4917c:     	stp	x20, x26, [sp, #0x60]
100b49180:     	str	x27, [sp, #0x70]
100b49184:     	cbz	x22, 0x100b49190 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xaa4>
100b49188:     	mov	x0, x22
100b4918c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b49190:     	ldr	x28, [sp, #0x30]
100b49194:     	mov	w20, #0x1               ; =1
100b49198:     	b	0x100b4903c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x950>
100b4919c:     	ldur	x0, [x29, #-0xd0]
100b491a0:     	cbz	x0, 0x100b491ac <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xac0>
100b491a4:     	stur	x0, [x29, #-0xc8]
100b491a8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b491ac:     	ldur	x0, [x29, #-0xb0]
100b491b0:     	ldr	x25, [sp, #0x48]
100b491b4:     	cbz	x0, 0x100b491c0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xad4>
100b491b8:     	stur	x0, [x29, #-0xa8]
100b491bc:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b491c0:     	ldr	x0, [sp, #0x38]
100b491c4:     	bl	0x101633618 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b491c8:     	cbz	w0, 0x100b4946c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xd80>
100b491cc:     	mov	x0, x25
100b491d0:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b491d4:     	str	x0, [sp, #0x10]
100b491d8:     	mov	x0, x25
100b491dc:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b491e0:     	str	x0, [sp, #0x8]
100b491e4:     	ldr	x8, [sp, #0x38]
100b491e8:     	ldr	x19, [x8, #0x1c0]
100b491ec:     	cbz	x19, 0x100b49454 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xd68>
100b491f0:     	adrp	x23, 0x104bd0000 <__ZL3hex+0x434d>
100b491f4:     	add	x23, x23, #0x294
100b491f8:     	b	0x100b49204 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xb18>
100b491fc:     	ldr	x19, [x19]
100b49200:     	cbz	x19, 0x100b49454 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xd68>
100b49204:     	ldr	w8, [x19, #0xd8]
100b49208:     	cmp	w8, #0x1
100b4920c:     	b.ne	0x100b491fc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xb10>
100b49210:     	ldrb	w8, [x19, #0x48]
100b49214:     	cmp	w8, #0x1
100b49218:     	b.ne	0x100b491fc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xb10>
100b4921c:     	mov	x0, x25
100b49220:     	mov	x1, x19
100b49224:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b49228:     	mov	x0, x25
100b4922c:     	mov	x1, #0x0                ; =0
100b49230:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b49234:     	mov	x0, x25
100b49238:     	bl	0x100b8f7f8 <__Z30WM_toolsystem_ref_from_contextPK8bContext>
100b4923c:     	mov	x20, x0
100b49240:     	mov	x0, x25
100b49244:     	bl	0x1000b5338 <__Z20CTX_data_mode_stringPK8bContext>
100b49248:     	mov	x1, x0
100b4924c:     	add	x24, x20, #0x10
100b49250:     	cmp	x20, #0x0
100b49254:     	csel	x0, xzr, x24, eq
100b49258:     	bl	0x100b4b2b8 <__ZN5ghost3ios16direct_edit_toolEPKcS2_>
100b4925c:     	tbz	w0, #0x0, 0x100b491fc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xb10>
100b49260:     	ldr	x20, [x19, #0x78]
100b49264:     	cbz	x20, 0x100b491fc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xb10>
100b49268:     	str	x19, [sp, #0x18]
100b4926c:     	str	x24, [sp, #0x28]
100b49270:     	b	0x100b49280 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xb94>
100b49274:     	ldp	x19, x20, [sp, #0x18]
100b49278:     	ldr	x20, [x20]
100b4927c:     	cbz	x20, 0x100b491fc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xb10>
100b49280:     	ldrh	w8, [x20, #0xc0]
100b49284:     	cbnz	w8, 0x100b49278 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xb8c>
100b49288:     	ldr	x8, [x20, #0x128]
100b4928c:     	ldrh	w9, [x8, #0x2b0]
100b49290:     	cbz	w9, 0x100b49278 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xb8c>
100b49294:     	ldrb	w8, [x8, #0x8]
100b49298:     	cmp	w8, #0x1
100b4929c:     	b.ne	0x100b49278 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xb8c>
100b492a0:     	mov	x0, x25
100b492a4:     	mov	x1, x20
100b492a8:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b492ac:     	stp	xzr, xzr, [x29, #-0xb0]
100b492b0:     	stur	xzr, [x29, #-0xa0]
100b492b4:     	sub	x2, x29, #0xb0
100b492b8:     	mov	x0, x25
100b492bc:     	str	x20, [sp, #0x20]
100b492c0:     	mov	x1, x20
100b492c4:     	bl	0x10163efb0 <__Z28ED_ipad_editing_canvas_partsP8bContextP7ARegionRNSt3__16vectorI4rctiNS3_9allocatorIS5_EEEE>
100b492c8:     	ldp	x22, x8, [x29, #-0xb0]
100b492cc:     	str	x8, [sp, #0x40]
100b492d0:     	cmp	x22, x8
100b492d4:     	b.ne	0x100b49318 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xc2c>
100b492d8:     	cbnz	x22, 0x100b49444 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xd58>
100b492dc:     	b	0x100b49274 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xb88>
100b492e0:     	ldr	w9, [sp, #0x50]
100b492e4:     	stp	w9, w27, [x8]
100b492e8:     	stp	w25, w26, [x8, #0x8]
100b492ec:     	mov	w9, #0x3                ; =3
100b492f0:     	str	w9, [x8, #0x10]
100b492f4:     	strb	w11, [x8, #0x14]
100b492f8:     	add	x19, x8, #0x20
100b492fc:     	str	xzr, [x8, #0x18]
100b49300:     	ldr	x25, [sp, #0x48]
100b49304:     	str	x19, [sp, #0x68]
100b49308:     	add	x22, x22, #0x10
100b4930c:     	ldr	x8, [sp, #0x40]
100b49310:     	cmp	x22, x8
100b49314:     	b.eq	0x100b4943c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xd50>
100b49318:     	mov	x0, x28
100b4931c:     	bl	0x100b96a8c <__Z24WM_window_native_pixel_yPK8wmWindow>
100b49320:     	mov	x20, x0
100b49324:     	ldp	w8, w25, [x22]
100b49328:     	str	w8, [sp, #0x50]
100b4932c:     	ldp	w21, w19, [x22, #0x8]
100b49330:     	mov	x0, x24
100b49334:     	mov	x1, x23
100b49338:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
100b4933c:     	cbz	w0, 0x100b4935c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xc70>
100b49340:     	mov	x0, x24
100b49344:     	adrp	x1, 0x104bd0000 <__ZL3hex+0x434d>
100b49348:     	add	x1, x1, #0x2a7
100b4934c:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
100b49350:     	cmp	w0, #0x0
100b49354:     	cset	w11, eq
100b49358:     	b	0x100b49360 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xc74>
100b4935c:     	mov	w11, #0x1               ; =1
100b49360:     	sub	w8, w20, #0x1
100b49364:     	sub	w27, w8, w19
100b49368:     	sub	w26, w8, w21
100b4936c:     	ldp	x8, x9, [sp, #0x68]
100b49370:     	cmp	x8, x9
100b49374:     	b.lo	0x100b492e0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xbf4>
100b49378:     	ldr	x23, [sp, #0x60]
100b4937c:     	sub	x20, x8, x23
100b49380:     	asr	x28, x20, #5
100b49384:     	add	x8, x28, #0x1
100b49388:     	lsr	x10, x8, #59
100b4938c:     	cbnz	x10, 0x100b49b44 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1458>
100b49390:     	sub	x9, x9, x23
100b49394:     	asr	x10, x9, #4
100b49398:     	cmp	x10, x8
100b4939c:     	csel	x8, x10, x8, hi
100b493a0:     	mov	x10, #0x7fffffffffffffe0 ; =9223372036854775776
100b493a4:     	cmp	x9, x10
100b493a8:     	mov	x9, #0x7ffffffffffffff  ; =576460752303423487
100b493ac:     	csel	x19, x8, x9, lo
100b493b0:     	cbz	x19, 0x100b493d8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xcec>
100b493b4:     	lsr	x8, x19, #59
100b493b8:     	cbnz	x8, 0x100b49b50 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1464>
100b493bc:     	mov	x24, x11
100b493c0:     	lsl	x0, x19, #5
100b493c4:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
100b493c8:     	mov	x21, x0
100b493cc:     	ldr	w9, [sp, #0x50]
100b493d0:     	mov	x11, x24
100b493d4:     	b	0x100b493e0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xcf4>
100b493d8:     	mov	x21, #0x0               ; =0
100b493dc:     	ldr	w9, [sp, #0x50]
100b493e0:     	add	x8, x21, x28, lsl #5
100b493e4:     	stp	w9, w27, [x8]
100b493e8:     	stp	w25, w26, [x8, #0x8]
100b493ec:     	add	x25, x21, x19, lsl #5
100b493f0:     	mov	w9, #0x3                ; =3
100b493f4:     	str	w9, [x8, #0x10]
100b493f8:     	strb	w11, [x8, #0x14]
100b493fc:     	add	x19, x8, #0x20
100b49400:     	str	xzr, [x8, #0x18]
100b49404:     	mov	x0, x21
100b49408:     	mov	x1, x23
100b4940c:     	mov	x2, x20
100b49410:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
100b49414:     	stp	x21, x19, [sp, #0x60]
100b49418:     	str	x25, [sp, #0x70]
100b4941c:     	cbz	x23, 0x100b49428 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xd3c>
100b49420:     	mov	x0, x23
100b49424:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b49428:     	ldp	x24, x28, [sp, #0x28]
100b4942c:     	ldr	x25, [sp, #0x48]
100b49430:     	adrp	x23, 0x104bd0000 <__ZL3hex+0x434d>
100b49434:     	add	x23, x23, #0x294
100b49438:     	b	0x100b49304 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xc18>
100b4943c:     	ldur	x22, [x29, #-0xb0]
100b49440:     	cbz	x22, 0x100b49274 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xb88>
100b49444:     	stur	x22, [x29, #-0xa8]
100b49448:     	mov	x0, x22
100b4944c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b49450:     	b	0x100b49274 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xb88>
100b49454:     	mov	x0, x25
100b49458:     	ldr	x1, [sp, #0x10]
100b4945c:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b49460:     	mov	x0, x25
100b49464:     	ldr	x1, [sp, #0x8]
100b49468:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b4946c:     	ldr	x0, [sp, #0x38]
100b49470:     	bl	0x101633618 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b49474:     	tbnz	w0, #0x0, 0x100b494a0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xdb4>
100b49478:     	stp	xzr, xzr, [x29, #-0xb0]
100b4947c:     	stur	xzr, [x29, #-0xa0]
100b49480:     	sub	x2, x29, #0xb0
100b49484:     	mov	x0, x25
100b49488:     	mov	x1, x28
100b4948c:     	bl	0x10163d064 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE>
100b49490:     	ldur	x0, [x29, #-0xb0]
100b49494:     	cbz	x0, 0x100b494a0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xdb4>
100b49498:     	stur	x0, [x29, #-0xa8]
100b4949c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b494a0:     	ldr	x8, [sp, #0x38]
100b494a4:     	ldr	x8, [x8, #0x1d0]
100b494a8:     	cbnz	x8, 0x100b494bc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xdd0>
100b494ac:     	ldr	q0, [sp, #0x60]
100b494b0:     	b	0x100b494e8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xdfc>
100b494b4:     	ldr	x8, [x8]
100b494b8:     	cbz	x8, 0x100b494ac <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xdc0>
100b494bc:     	ldr	x9, [x8, #0x128]
100b494c0:     	ldrh	w9, [x9, #0x2b0]
100b494c4:     	cbz	w9, 0x100b494b4 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xdc8>
100b494c8:     	ldr	x9, [sp, #0x38]
100b494cc:     	ldr	x9, [x9, #0x218]
100b494d0:     	cbz	x9, 0x100b494e0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xdf4>
100b494d4:     	ldr	x9, [x9, #0x18]
100b494d8:     	cmp	x8, x9
100b494dc:     	b.eq	0x100b494b4 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xdc8>
100b494e0:     	add	x8, sp, #0x60
100b494e4:     	ld1r.2d	{ v0 }, [x8]
100b494e8:     	ldr	x8, [x28, #0x10]
100b494ec:     	ldr	x19, [sp, #0x70]
100b494f0:     	stp	xzr, xzr, [sp, #0x68]
100b494f4:     	str	xzr, [sp, #0x60]
100b494f8:     	stur	x8, [x29, #-0xd0]
100b494fc:     	cbz	x8, 0x100b4955c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xe70>
100b49500:     	str	q0, [sp, #0x50]
100b49504:     	sub	x8, x29, #0xd0
100b49508:     	stur	x8, [x29, #-0xb0]
100b4950c:     	adrp	x0, 0x106368000 <_zlibVersion+0x106368000>
100b49510:     	ldr	x0, [x0, #0x740]
100b49514:     	adrp	x2, 0x10636c000 <_zlibVersion+0x10636c000>
100b49518:     	ldr	x2, [x2, #0x188]
100b4951c:     	sub	x1, x29, #0xd0
100b49520:     	sub	x3, x29, #0xb0
100b49524:     	add	x4, sp, #0xf0
100b49528:     	bl	0x100b4b7b8 <__ZNSt3__112__hash_tableINS_17__hash_value_typeIPKvNS_6vectorIN5ghost3ios15FingerPaintRectENS_9allocatorIS7_EEEEEENS_22__unordered_map_hasherIS3_SB_NS_4hashIS3_EENS_8equal_toIS3_EELb1EEENS_21__unordered_map_equalIS3_SB_SG_SE_Lb1EEENS8_ISB_EEE25__emplace_unique_key_argsIS3_JRKNS_21piecewise_construct_tENS_5tupleIJRKS3_EEENSQ_IJEEEEEENS_4pairINS_15__hash_iteratorIPNS_11__hash_nodeISB_PvEEEEbEERKT_DpOT0_>
100b4952c:     	mov	x20, x0
100b49530:     	mov	x21, x0
100b49534:     	ldr	x0, [x21, #0x18]!
100b49538:     	cbz	x0, 0x100b4954c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xe60>
100b4953c:     	str	x0, [x20, #0x20]
100b49540:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b49544:     	stp	xzr, xzr, [x21]
100b49548:     	str	xzr, [x21, #0x10]
100b4954c:     	ldr	q0, [sp, #0x50]
100b49550:     	stur	q0, [x20, #0x18]
100b49554:     	str	x19, [x20, #0x28]
100b49558:     	b	0x100b49568 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xe7c>
100b4955c:     	fmov	x0, d0
100b49560:     	cbz	x0, 0x100b49568 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xe7c>
100b49564:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b49568:     	mov	x0, x25
100b4956c:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b49570:     	mov	x20, x0
100b49574:     	cbz	x0, 0x100b49abc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x13d0>
100b49578:     	add	x0, x20, #0x1a0
100b4957c:     	mov	x1, x28
100b49580:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b49584:     	cmn	w0, #0x1
100b49588:     	b.eq	0x100b49abc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x13d0>
100b4958c:     	mov	x0, x28
100b49590:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b49594:     	stp	xzr, xzr, [x29, #-0xd0]
100b49598:     	stur	xzr, [x29, #-0xc0]
100b4959c:     	cbz	x0, 0x100b495ec <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf00>
100b495a0:     	ldr	w8, [x0, #0x144]
100b495a4:     	ldr	x9, [sp, #0x80]
100b495a8:     	cmp	x9, x8
100b495ac:     	b.ne	0x100b495ec <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf00>
100b495b0:     	ldrsw	x8, [x28, #0xc0]
100b495b4:     	ldr	x9, [sp, #0x88]
100b495b8:     	cmp	x9, x8
100b495bc:     	b.ne	0x100b495ec <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf00>
100b495c0:     	ldrb	w8, [sp, #0x98]
100b495c4:     	tbnz	w8, #0x0, 0x100b495ec <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf00>
100b495c8:     	mov	x21, x0
100b495cc:     	bl	0x101633618 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b495d0:     	mov	x8, x0
100b495d4:     	mov	x0, x21
100b495d8:     	cbz	w8, 0x100b495ec <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf00>
100b495dc:     	ldr	x8, [x28, #0x128]
100b495e0:     	cbnz	x8, 0x100b495ec <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf00>
100b495e4:     	ldr	x8, [x28, #0x140]
100b495e8:     	cbz	x8, 0x100b4960c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf20>
100b495ec:     	mov	w8, #0x1                ; =1
100b495f0:     	ldr	x9, [x20, #0x5c0]
100b495f4:     	cbz	x9, 0x100b49618 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf2c>
100b495f8:     	ldr	x9, [x9, #0x8]
100b495fc:     	cbz	x9, 0x100b49618 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf2c>
100b49600:     	ldr	x9, [x9, #0xf0]
100b49604:     	cbnz	x9, 0x100b49624 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf38>
100b49608:     	b	0x100b49634 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf48>
100b4960c:     	ldrb	w8, [sp, #0x99]
100b49610:     	ldr	x9, [x20, #0x5c0]
100b49614:     	cbnz	x9, 0x100b495f8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf0c>
100b49618:     	mov	x9, x28
100b4961c:     	ldr	x9, [x9, #0xf0]
100b49620:     	cbz	x9, 0x100b49634 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf48>
100b49624:     	ldrb	w10, [x9, #0x2a]
100b49628:     	cbnz	w10, 0x100b49634 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf48>
100b4962c:     	ldrh	w9, [x9, #0x2c]
100b49630:     	cbz	w9, 0x100b49638 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf4c>
100b49634:     	mov	w8, #0x1                ; =1
100b49638:     	ldr	x9, [x28, #0x118]
100b4963c:     	cbz	x9, 0x100b4965c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf70>
100b49640:     	ldr	w10, [x9, #0x10]
100b49644:     	and	w10, w10, #0xfffffffe
100b49648:     	cmp	w10, #0x2
100b4964c:     	cset	w10, eq
100b49650:     	orr	w8, w10, w8
100b49654:     	ldr	x9, [x9]
100b49658:     	cbnz	x9, 0x100b49640 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf54>
100b4965c:     	cbz	x0, 0x100b49668 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf7c>
100b49660:     	ldr	x9, [x0, #0x1d0]
100b49664:     	cbnz	x9, 0x100b49698 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xfac>
100b49668:     	movi.16b	v0, #0x0
100b4966c:     	tbnz	w8, #0x0, 0x100b496b4 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xfc8>
100b49670:     	ldp	x24, x23, [sp, #0xa0]
100b49674:     	cmp	x24, x23
100b49678:     	b.eq	0x100b496b4 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xfc8>
100b4967c:     	mov	w26, #0x1               ; =1
100b49680:     	b	0x100b496cc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xfe0>
100b49684:     	cmp	x9, x10
100b49688:     	cset	w10, ne
100b4968c:     	orr	w8, w10, w8
100b49690:     	ldr	x9, [x9]
100b49694:     	cbz	x9, 0x100b49668 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf7c>
100b49698:     	ldr	x10, [x9, #0x128]
100b4969c:     	ldrh	w10, [x10, #0x2b0]
100b496a0:     	cbz	w10, 0x100b49690 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xfa4>
100b496a4:     	ldr	x10, [x0, #0x218]
100b496a8:     	cbz	x10, 0x100b49684 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf98>
100b496ac:     	ldr	x10, [x10, #0x18]
100b496b0:     	b	0x100b49684 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xf98>
100b496b4:     	mov	x20, #0x0               ; =0
100b496b8:     	b	0x100b49a48 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x135c>
100b496bc:     	ldr	x0, [sp, #0x28]
100b496c0:     	add	x24, x24, #0x60
100b496c4:     	cmp	x24, x23
100b496c8:     	b.eq	0x100b49a40 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1354>
100b496cc:     	ldr	x21, [x0, #0x1c0]
100b496d0:     	cbz	x21, 0x100b496c0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xfd4>
100b496d4:     	add	x19, x21, #0x78
100b496d8:     	ldr	x19, [x19]
100b496dc:     	cbz	x19, 0x100b496f0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1004>
100b496e0:     	ldr	x8, [x24]
100b496e4:     	cmp	x8, x19
100b496e8:     	b.ne	0x100b496d8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xfec>
100b496ec:     	b	0x100b496fc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1010>
100b496f0:     	ldr	x21, [x21]
100b496f4:     	cbnz	x21, 0x100b496d4 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xfe8>
100b496f8:     	b	0x100b496c0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xfd4>
100b496fc:     	ldr	x8, [x19, #0x128]
100b49700:     	ldrh	w9, [x8, #0x2b0]
100b49704:     	cbz	w9, 0x100b496c0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xfd4>
100b49708:     	ldr	x9, [x8, #0x298]
100b4970c:     	cbz	x9, 0x100b496c0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xfd4>
100b49710:     	ldr	x9, [x9, #0x18]
100b49714:     	ldr	x10, [x24, #0x8]
100b49718:     	cmp	x9, x10
100b4971c:     	b.ne	0x100b496c0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xfd4>
100b49720:     	ldrb	w9, [x24, #0x50]
100b49724:     	tbnz	w9, #0x0, 0x100b496c0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xfd4>
100b49728:     	ldrb	w9, [x8, #0x1]
100b4972c:     	tbnz	w9, #0x0, 0x100b496c0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xfd4>
100b49730:     	ldr	x8, [x8, #0xb8]
100b49734:     	cbz	x8, 0x100b49740 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1054>
100b49738:     	ldr	x8, [x8, #0xa8]
100b4973c:     	cbnz	x8, 0x100b496c0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xfd4>
100b49740:     	str	x0, [sp, #0x28]
100b49744:     	ldp	q0, q1, [x24, #0x10]
100b49748:     	stp	q0, q1, [x29, #-0xb0]
100b4974c:     	mov	w0, #0x20               ; =32
100b49750:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
100b49754:     	add	x8, x0, #0x20
100b49758:     	stp	x8, x8, [sp, #0xf8]
100b4975c:     	ldp	q0, q1, [x29, #-0xb0]
100b49760:     	stp	q0, q1, [x0]
100b49764:     	str	x0, [sp, #0xf0]
100b49768:     	ldp	x20, x22, [sp, #0xb8]
100b4976c:     	b	0x100b49784 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1098>
100b49770:     	ldur	q0, [x29, #-0xb0]
100b49774:     	str	q0, [sp, #0xf0]
100b49778:     	ldur	x8, [x29, #-0xa0]
100b4977c:     	str	x8, [sp, #0x100]
100b49780:     	add	x20, x20, #0x28
100b49784:     	cmp	x20, x22
100b49788:     	b.eq	0x100b497c0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x10d4>
100b4978c:     	ldr	x8, [x20, #0x20]
100b49790:     	ldr	x9, [x24, #0x58]
100b49794:     	cmp	x8, x9
100b49798:     	b.ls	0x100b49780 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1094>
100b4979c:     	sub	x8, x29, #0xb0
100b497a0:     	add	x0, sp, #0xf0
100b497a4:     	mov	x1, x20
100b497a8:     	bl	0x100b4bb30 <__ZN5ghost3ios21finger_paint_subtractERKNSt3__16vectorINS0_14NavigationRectENS1_9allocatorIS3_EEEERKS3_>
100b497ac:     	ldr	x0, [sp, #0xf0]
100b497b0:     	cbz	x0, 0x100b49770 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1084>
100b497b4:     	str	x0, [sp, #0xf8]
100b497b8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b497bc:     	b	0x100b49770 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1084>
100b497c0:     	ldrb	w8, [x24, #0x51]
100b497c4:     	tbz	w8, #0x0, 0x100b497f8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x110c>
100b497c8:     	sub	x8, x29, #0xb0
100b497cc:     	add	x0, sp, #0xf0
100b497d0:     	add	x1, x24, #0x30
100b497d4:     	bl	0x100b4bb30 <__ZN5ghost3ios21finger_paint_subtractERKNSt3__16vectorINS0_14NavigationRectENS1_9allocatorIS3_EEEERKS3_>
100b497d8:     	ldr	x0, [sp, #0xf0]
100b497dc:     	cbz	x0, 0x100b497e8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x10fc>
100b497e0:     	str	x0, [sp, #0xf8]
100b497e4:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b497e8:     	ldur	q0, [x29, #-0xb0]
100b497ec:     	str	q0, [sp, #0xf0]
100b497f0:     	ldur	x8, [x29, #-0xa0]
100b497f4:     	str	x8, [sp, #0x100]
100b497f8:     	ldr	x8, [x19, #0x128]
100b497fc:     	ldrb	w9, [x8, #0x2]
100b49800:     	cmp	w9, #0x1
100b49804:     	b.ne	0x100b49858 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x116c>
100b49808:     	ldr	q0, [x21, #0x140]
100b4980c:     	rev64.4s	v1, v0
100b49810:     	uzp1.4s	v0, v0, v1
100b49814:     	stur	q0, [x29, #-0xb0]
100b49818:     	stur	w26, [x29, #-0xa0]
100b4981c:     	sturb	wzr, [x29, #-0x9c]
100b49820:     	stur	xzr, [x29, #-0x98]
100b49824:     	add	x8, sp, #0xd0
100b49828:     	add	x0, sp, #0xf0
100b4982c:     	sub	x1, x29, #0xb0
100b49830:     	bl	0x100b4bb30 <__ZN5ghost3ios21finger_paint_subtractERKNSt3__16vectorINS0_14NavigationRectENS1_9allocatorIS3_EEEERKS3_>
100b49834:     	ldr	x0, [sp, #0xf0]
100b49838:     	cbz	x0, 0x100b49844 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1158>
100b4983c:     	str	x0, [sp, #0xf8]
100b49840:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b49844:     	ldr	q0, [sp, #0xd0]
100b49848:     	str	q0, [sp, #0xf0]
100b4984c:     	ldr	x8, [sp, #0xe0]
100b49850:     	str	x8, [sp, #0x100]
100b49854:     	ldr	x8, [x19, #0x128]
100b49858:     	ldrb	w9, [x8, #0x79]
100b4985c:     	cmp	w9, #0x1
100b49860:     	b.ne	0x100b498b0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x11c4>
100b49864:     	ldr	q0, [x8, #0x80]
100b49868:     	rev64.4s	v1, v0
100b4986c:     	uzp1.4s	v0, v0, v1
100b49870:     	stur	q0, [x29, #-0xb0]
100b49874:     	stur	w26, [x29, #-0xa0]
100b49878:     	sturb	wzr, [x29, #-0x9c]
100b4987c:     	stur	xzr, [x29, #-0x98]
100b49880:     	add	x8, sp, #0xd0
100b49884:     	add	x0, sp, #0xf0
100b49888:     	sub	x1, x29, #0xb0
100b4988c:     	bl	0x100b4bb30 <__ZN5ghost3ios21finger_paint_subtractERKNSt3__16vectorINS0_14NavigationRectENS1_9allocatorIS3_EEEERKS3_>
100b49890:     	ldr	x0, [sp, #0xf0]
100b49894:     	cbz	x0, 0x100b498a0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x11b4>
100b49898:     	str	x0, [sp, #0xf8]
100b4989c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b498a0:     	ldr	q0, [sp, #0xd0]
100b498a4:     	str	q0, [sp, #0xf0]
100b498a8:     	ldr	x8, [sp, #0xe0]
100b498ac:     	str	x8, [sp, #0x100]
100b498b0:     	mov	x0, x28
100b498b4:     	bl	0x100b96a8c <__Z24WM_window_native_pixel_yPK8wmWindow>
100b498b8:     	ldp	x20, x9, [sp, #0xf0]
100b498bc:     	cmp	x20, x9
100b498c0:     	b.eq	0x100b49a2c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1340>
100b498c4:     	str	x23, [sp, #0x20]
100b498c8:     	sub	w10, w0, #0x1
100b498cc:     	ldur	x27, [x29, #-0xc8]
100b498d0:     	mov	x11, #0x5555555555555555 ; =6148914691236517205
100b498d4:     	movk	x11, #0x555, lsl #48
100b498d8:     	str	x9, [sp, #0x40]
100b498dc:     	str	w10, [sp, #0x38]
100b498e0:     	b	0x100b49914 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1228>
100b498e4:     	stp	w17, w16, [x27]
100b498e8:     	stp	w28, w23, [x27, #0x8]
100b498ec:     	str	w26, [x27, #0x10]
100b498f0:     	strb	wzr, [x27, #0x14]
100b498f4:     	stp	xzr, x13, [x27, #0x18]
100b498f8:     	str	x25, [x27, #0x28]
100b498fc:     	add	x27, x27, #0x30
100b49900:     	ldr	x28, [sp, #0x30]
100b49904:     	stur	x27, [x29, #-0xc8]
100b49908:     	add	x20, x20, #0x20
100b4990c:     	cmp	x20, x9
100b49910:     	b.eq	0x100b49a24 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1338>
100b49914:     	ldp	w28, w8, [x20, #0x8]
100b49918:     	sub	w16, w10, w8
100b4991c:     	ldp	w17, w8, [x20]
100b49920:     	sub	w23, w10, w8
100b49924:     	ldp	x25, x13, [x24]
100b49928:     	ldur	x8, [x29, #-0xc0]
100b4992c:     	cmp	x27, x8
100b49930:     	b.lo	0x100b498e4 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x11f8>
100b49934:     	ldur	x21, [x29, #-0xd0]
100b49938:     	sub	x22, x27, x21
100b4993c:     	asr	x9, x22, #4
100b49940:     	mov	x10, #-0x5555555555555556 ; =-6148914691236517206
100b49944:     	movk	x10, #0xaaab
100b49948:     	mul	x27, x9, x10
100b4994c:     	add	x9, x27, #0x1
100b49950:     	cmp	x9, x11
100b49954:     	b.hi	0x100b49b84 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1498>
100b49958:     	sub	x8, x8, x21
100b4995c:     	asr	x8, x8, #4
100b49960:     	mul	x8, x8, x10
100b49964:     	lsl	x10, x8, #1
100b49968:     	cmp	x10, x9
100b4996c:     	csel	x9, x10, x9, hi
100b49970:     	mov	x10, #-0x5555555555555556 ; =-6148914691236517206
100b49974:     	movk	x10, #0x2aa, lsl #48
100b49978:     	cmp	x8, x10
100b4997c:     	csel	x26, x9, x11, lo
100b49980:     	cbz	x26, 0x100b499b4 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x12c8>
100b49984:     	str	w17, [sp, #0x48]
100b49988:     	str	w16, [sp, #0x50]
100b4998c:     	cmp	x26, x11
100b49990:     	b.hi	0x100b49b90 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x14a4>
100b49994:     	mov	x19, x13
100b49998:     	add	x8, x26, x26, lsl #1
100b4999c:     	lsl	x0, x8, #4
100b499a0:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
100b499a4:     	mov	x13, x19
100b499a8:     	ldr	w16, [sp, #0x50]
100b499ac:     	ldr	w17, [sp, #0x48]
100b499b0:     	b	0x100b499b8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x12cc>
100b499b4:     	mov	x0, #0x0                ; =0
100b499b8:     	mov	w9, #0x30               ; =48
100b499bc:     	madd	x8, x27, x9, x0
100b499c0:     	stp	w17, w16, [x8]
100b499c4:     	stp	w28, w23, [x8, #0x8]
100b499c8:     	madd	x19, x26, x9, x0
100b499cc:     	mov	w26, #0x1               ; =1
100b499d0:     	str	w26, [x8, #0x10]
100b499d4:     	strb	wzr, [x8, #0x14]
100b499d8:     	stp	xzr, x13, [x8, #0x18]
100b499dc:     	str	x25, [x8, #0x28]
100b499e0:     	add	x27, x8, #0x30
100b499e4:     	sub	x23, x8, x22
100b499e8:     	mov	x0, x23
100b499ec:     	mov	x1, x21
100b499f0:     	mov	x2, x22
100b499f4:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
100b499f8:     	stp	x23, x27, [x29, #-0xd0]
100b499fc:     	stur	x19, [x29, #-0xc0]
100b49a00:     	cbz	x21, 0x100b49a0c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1320>
100b49a04:     	mov	x0, x21
100b49a08:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b49a0c:     	ldr	x28, [sp, #0x30]
100b49a10:     	mov	x11, #0x5555555555555555 ; =6148914691236517205
100b49a14:     	movk	x11, #0x555, lsl #48
100b49a18:     	ldr	x9, [sp, #0x40]
100b49a1c:     	ldr	w10, [sp, #0x38]
100b49a20:     	b	0x100b49904 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1218>
100b49a24:     	ldr	x20, [sp, #0xf0]
100b49a28:     	ldr	x23, [sp, #0x20]
100b49a2c:     	cbz	x20, 0x100b496bc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xfd0>
100b49a30:     	str	x20, [sp, #0xf8]
100b49a34:     	mov	x0, x20
100b49a38:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b49a3c:     	b	0x100b496bc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0xfd0>
100b49a40:     	ldur	q0, [x29, #-0xd0]
100b49a44:     	ldur	x20, [x29, #-0xc0]
100b49a48:     	ldr	x8, [x28, #0x10]
100b49a4c:     	str	x8, [sp, #0xf0]
100b49a50:     	cbz	x8, 0x100b49ab0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x13c4>
100b49a54:     	str	q0, [sp, #0x50]
100b49a58:     	add	x8, sp, #0xf0
100b49a5c:     	stur	x8, [x29, #-0xb0]
100b49a60:     	adrp	x0, 0x106368000 <_zlibVersion+0x106368000>
100b49a64:     	ldr	x0, [x0, #0x748]
100b49a68:     	adrp	x2, 0x10636c000 <_zlibVersion+0x10636c000>
100b49a6c:     	ldr	x2, [x2, #0x188]
100b49a70:     	add	x1, sp, #0xf0
100b49a74:     	sub	x3, x29, #0xb0
100b49a78:     	add	x4, sp, #0xd0
100b49a7c:     	bl	0x100b4b7b8 <__ZNSt3__112__hash_tableINS_17__hash_value_typeIPKvNS_6vectorIN5ghost3ios15FingerPaintRectENS_9allocatorIS7_EEEEEENS_22__unordered_map_hasherIS3_SB_NS_4hashIS3_EENS_8equal_toIS3_EELb1EEENS_21__unordered_map_equalIS3_SB_SG_SE_Lb1EEENS8_ISB_EEE25__emplace_unique_key_argsIS3_JRKNS_21piecewise_construct_tENS_5tupleIJRKS3_EEENSQ_IJEEEEEENS_4pairINS_15__hash_iteratorIPNS_11__hash_nodeISB_PvEEEEbEERKT_DpOT0_>
100b49a80:     	mov	x19, x0
100b49a84:     	mov	x21, x0
100b49a88:     	ldr	x0, [x21, #0x18]!
100b49a8c:     	cbz	x0, 0x100b49aa0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x13b4>
100b49a90:     	str	x0, [x19, #0x20]
100b49a94:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b49a98:     	stp	xzr, xzr, [x21]
100b49a9c:     	str	xzr, [x21, #0x10]
100b49aa0:     	ldr	q0, [sp, #0x50]
100b49aa4:     	stur	q0, [x19, #0x18]
100b49aa8:     	str	x20, [x19, #0x28]
100b49aac:     	b	0x100b49abc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x13d0>
100b49ab0:     	fmov	x0, d0
100b49ab4:     	cbz	x0, 0x100b49abc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x13d0>
100b49ab8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b49abc:     	bl	0x1008f30ac <__Z19GPU_debug_group_endv>
100b49ac0:     	ldr	x0, [sp, #0x60]
100b49ac4:     	cbz	x0, 0x100b49ad0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x13e4>
100b49ac8:     	str	x0, [sp, #0x68]
100b49acc:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b49ad0:     	ldr	x0, [sp, #0xb8]
100b49ad4:     	cbz	x0, 0x100b49ae0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x13f4>
100b49ad8:     	str	x0, [sp, #0xc0]
100b49adc:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b49ae0:     	ldr	x0, [sp, #0xa0]
100b49ae4:     	cbz	x0, 0x100b49af0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1404>
100b49ae8:     	str	x0, [sp, #0xa8]
100b49aec:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b49af0:     	ldur	x8, [x29, #-0x70]
100b49af4:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
100b49af8:     	ldr	x9, [x9, #0x7f0]
100b49afc:     	ldr	x9, [x9]
100b49b00:     	cmp	x9, x8
100b49b04:     	b.ne	0x100b49b80 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1494>
100b49b08:     	ldp	x29, x30, [sp, #0x1e0]
100b49b0c:     	ldp	x20, x19, [sp, #0x1d0]
100b49b10:     	ldp	x22, x21, [sp, #0x1c0]
100b49b14:     	ldp	x24, x23, [sp, #0x1b0]
100b49b18:     	ldp	x26, x25, [sp, #0x1a0]
100b49b1c:     	ldp	x28, x27, [sp, #0x190]
100b49b20:     	ldp	d9, d8, [sp, #0x180]
100b49b24:     	add	sp, sp, #0x1f0
100b49b28:     	ret
100b49b2c:     	bl	0x100b94dc4 <__Z20WM_capabilities_flagv>
100b49b30:     	mov	w8, #0x1                ; =1
100b49b34:     	bic	w8, w8, w0
100b49b38:     	strb	w8, [x19, #0x210]
100b49b3c:     	cbnz	w8, 0x100b4891c <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x230>
100b49b40:     	b	0x100b48d64 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x678>
100b49b44:     	add	x0, sp, #0x60
100b49b48:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
100b49b4c:     	b	0x100b49ba8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x14bc>
100b49b50:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
100b49b54:     	b	0x100b49ba8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x14bc>
100b49b58:     	add	x0, sp, #0x60
100b49b5c:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
100b49b60:     	b	0x100b49ba8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x14bc>
100b49b64:     	add	x0, sp, #0x60
100b49b68:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
100b49b6c:     	b	0x100b49ba8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x14bc>
100b49b70:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
100b49b74:     	b	0x100b49ba8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x14bc>
100b49b78:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
100b49b7c:     	b	0x100b49ba8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x14bc>
100b49b80:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
100b49b84:     	sub	x0, x29, #0xd0
100b49b88:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
100b49b8c:     	b	0x100b49ba8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x14bc>
100b49b90:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
100b49b94:     	b	0x100b49ba8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x14bc>
100b49b98:     	add	x0, sp, #0x60
100b49b9c:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
100b49ba0:     	b	0x100b49ba8 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x14bc>
100b49ba4:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
100b49ba8:     	brk	#0x1
100b49bac:     	b	0x100b49c78 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x158c>
100b49bb0:     	b	0x100b49c10 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1524>
100b49bb4:     	b	0x100b49c10 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1524>
100b49bb8:     	b	0x100b49c10 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1524>
100b49bbc:     	b	0x100b49c78 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x158c>
100b49bc0:     	b	0x100b49c10 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1524>
100b49bc4:     	mov	x19, x0
100b49bc8:     	b	0x100b49c24 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1538>
100b49bcc:     	b	0x100b49c78 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x158c>
100b49bd0:     	b	0x100b49bf0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1504>
100b49bd4:     	b	0x100b49c10 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1524>
100b49bd8:     	b	0x100b49cbc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15d0>
100b49bdc:     	mov	x19, x0
100b49be0:     	b	0x100b49cd0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15e4>
100b49be4:     	b	0x100b49c78 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x158c>
100b49be8:     	b	0x100b49cbc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15d0>
100b49bec:     	b	0x100b49cbc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15d0>
100b49bf0:     	mov	x19, x0
100b49bf4:     	ldr	q0, [sp, #0x50]
100b49bf8:     	fmov	x0, d0
100b49bfc:     	cbnz	x0, 0x100b49ccc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15e0>
100b49c00:     	b	0x100b49cd0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15e4>
100b49c04:     	b	0x100b49c10 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1524>
100b49c08:     	mov	x19, x0
100b49c0c:     	b	0x100b49ce0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15f4>
100b49c10:     	mov	x19, x0
100b49c14:     	ldr	x0, [sp, #0xf0]
100b49c18:     	cbz	x0, 0x100b49c24 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x1538>
100b49c1c:     	str	x0, [sp, #0xf8]
100b49c20:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b49c24:     	ldur	x0, [x29, #-0xd0]
100b49c28:     	cbz	x0, 0x100b49cd0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15e4>
100b49c2c:     	stur	x0, [x29, #-0xc8]
100b49c30:     	b	0x100b49ccc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15e0>
100b49c34:     	mov	x19, x0
100b49c38:     	b	0x100b49cd0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15e4>
100b49c3c:     	mov	x19, x0
100b49c40:     	b	0x100b49ce0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15f4>
100b49c44:     	b	0x100b49cbc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15d0>
100b49c48:     	mov	x19, x0
100b49c4c:     	b	0x100b49cd0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15e4>
100b49c50:     	b	0x100b49c78 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x158c>
100b49c54:     	b	0x100b49cbc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15d0>
100b49c58:     	mov	x19, x0
100b49c5c:     	b	0x100b49ce0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15f4>
100b49c60:     	mov	x19, x0
100b49c64:     	b	0x100b49cd0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15e4>
100b49c68:     	mov	x19, x0
100b49c6c:     	b	0x100b49cd0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15e4>
100b49c70:     	mov	x19, x0
100b49c74:     	b	0x100b49cd0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15e4>
100b49c78:     	mov	x19, x0
100b49c7c:     	ldur	x0, [x29, #-0xd0]
100b49c80:     	cbz	x0, 0x100b49cc0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15d4>
100b49c84:     	stur	x0, [x29, #-0xc8]
100b49c88:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b49c8c:     	b	0x100b49cc0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15d4>
100b49c90:     	b	0x100b49cbc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15d0>
100b49c94:     	mov	x19, x0
100b49c98:     	b	0x100b49ce0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15f4>
100b49c9c:     	mov	x19, x0
100b49ca0:     	b	0x100b49ce0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15f4>
100b49ca4:     	b	0x100b49cbc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15d0>
100b49ca8:     	mov	x19, x0
100b49cac:     	b	0x100b49ce0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15f4>
100b49cb0:     	mov	x19, x0
100b49cb4:     	b	0x100b49ce0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15f4>
100b49cb8:     	b	0x100b49cbc <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15d0>
100b49cbc:     	mov	x19, x0
100b49cc0:     	ldur	x0, [x29, #-0xb0]
100b49cc4:     	cbz	x0, 0x100b49cd0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15e4>
100b49cc8:     	stur	x0, [x29, #-0xa8]
100b49ccc:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b49cd0:     	ldr	x0, [sp, #0x60]
100b49cd4:     	cbz	x0, 0x100b49ce0 <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi+0x15f4>
100b49cd8:     	str	x0, [sp, #0x68]
100b49cdc:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b49ce0:     	add	x0, sp, #0x80
100b49ce4:     	bl	0x100206890 <__ZNSt3__17__stateIcED1Ev>
100b49ce8:     	mov	x0, x19
100b49cec:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
