
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f8c8c4 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion>:
101f8c8c4:     	mov	w8, #0x0                ; =0
101f8c8c8:     	cbz	x0, 0x101f8c954 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x90>
101f8c8cc:     	cbz	x1, 0x101f8c954 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x90>
101f8c8d0:     	ldrh	w8, [x1, #0xc0]
101f8c8d4:     	cmp	w8, #0x8
101f8c8d8:     	b.ne	0x101f8c950 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x8c>
101f8c8dc:     	sub	sp, sp, #0x80
101f8c8e0:     	stp	x28, x27, [sp, #0x20]
101f8c8e4:     	stp	x26, x25, [sp, #0x30]
101f8c8e8:     	stp	x24, x23, [sp, #0x40]
101f8c8ec:     	stp	x22, x21, [sp, #0x50]
101f8c8f0:     	stp	x20, x19, [sp, #0x60]
101f8c8f4:     	stp	x29, x30, [sp, #0x70]
101f8c8f8:     	add	x29, sp, #0x70
101f8c8fc:     	ldr	x22, [x1, #0x120]
101f8c900:     	cbz	x22, 0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8c904:     	ldrb	w8, [x22, #0x4]
101f8c908:     	cmp	w8, #0x1
101f8c90c:     	b.ne	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8c910:     	ldr	s0, [x22, #0x2c]
101f8c914:     	adrp	x8, 0x106d88000 <_build_commit_date>
101f8c918:     	add	x8, x8, #0xe08
101f8c91c:     	ldr	s1, [x8, #0x2654]
101f8c920:     	fcmp	s0, s1
101f8c924:     	b.eq	0x101f8c95c <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x98>
101f8c928:     	mov	w8, #0x0                ; =0
101f8c92c:     	ldp	x29, x30, [sp, #0x70]
101f8c930:     	ldp	x20, x19, [sp, #0x60]
101f8c934:     	ldp	x22, x21, [sp, #0x50]
101f8c938:     	ldp	x24, x23, [sp, #0x40]
101f8c93c:     	ldp	x26, x25, [sp, #0x30]
101f8c940:     	ldp	x28, x27, [sp, #0x20]
101f8c944:     	add	sp, sp, #0x80
101f8c948:     	and	w0, w8, #0x1
101f8c94c:     	ret
101f8c950:     	mov	w8, #0x0                ; =0
101f8c954:     	and	w0, w8, #0x1
101f8c958:     	ret
101f8c95c:     	mov	x19, x1
101f8c960:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f8c964:     	cbz	x0, 0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8c968:     	add	x20, x0, #0x78
101f8c96c:     	mov	x0, x20
101f8c970:     	mov	x1, x19
101f8c974:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101f8c978:     	cmn	w0, #0x1
101f8c97c:     	b.eq	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8c980:     	ldr	x20, [x20]
101f8c984:     	cbz	x20, 0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8c988:     	ldr	x8, [x22, #0x8]
101f8c98c:     	cmp	x8, x20
101f8c990:     	b.ne	0x101f8c980 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0xbc>
101f8c994:     	ldr	x8, [x20, #0x128]
101f8c998:     	ldrh	w9, [x8, #0x2b0]
101f8c99c:     	cbz	w9, 0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8c9a0:     	ldrb	w8, [x8, #0x8]
101f8c9a4:     	cmp	w8, #0x1
101f8c9a8:     	b.ne	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8c9ac:     	ldrh	w8, [x20, #0xc4]
101f8c9b0:     	mov	w9, #0x403              ; =1027
101f8c9b4:     	tst	w8, w9
101f8c9b8:     	b.ne	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8c9bc:     	mov	x0, x20
101f8c9c0:     	bl	0x101f8cbdc <__ZL21ipad_knife_hud_boundsPK7ARegion>
101f8c9c4:     	ldr	w8, [x22, #0x10]
101f8c9c8:     	cmp	w8, w0
101f8c9cc:     	b.ne	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8c9d0:     	lsr	x8, x0, #32
101f8c9d4:     	ldr	w9, [x22, #0x14]
101f8c9d8:     	cmp	w9, w8
101f8c9dc:     	b.ne	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8c9e0:     	ldr	w9, [x22, #0x18]
101f8c9e4:     	cmp	w9, w1
101f8c9e8:     	b.ne	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8c9ec:     	lsr	x9, x1, #32
101f8c9f0:     	ldr	w10, [x22, #0x1c]
101f8c9f4:     	cmp	w10, w9
101f8c9f8:     	b.ne	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8c9fc:     	ldr	w10, [x19, #0xa8]
101f8ca00:     	cmp	w10, w0
101f8ca04:     	b.lt	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8ca08:     	ldr	w10, [x19, #0xac]
101f8ca0c:     	cmp	w10, w8
101f8ca10:     	b.gt	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8ca14:     	ldr	w8, [x19, #0xb0]
101f8ca18:     	cmp	w8, w1
101f8ca1c:     	b.lt	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8ca20:     	ldr	w8, [x19, #0xb4]
101f8ca24:     	cmp	w8, w9
101f8ca28:     	b.gt	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8ca2c:     	strh	wzr, [sp, #0x1e]
101f8ca30:     	ldr	x20, [x19, #0xd0]
101f8ca34:     	cbz	x20, 0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8ca38:     	mov	x21, x22
101f8ca3c:     	mov	w23, #0x0               ; =0
101f8ca40:     	adrp	x24, 0x101f8c000 <__ZL35ui_colorpicker_rgb_slider_update_cbP8bContextPvS1_+0xb0>
101f8ca44:     	add	x24, x24, #0xce0
101f8ca48:     	add	x26, x22, #0x20
101f8ca4c:     	b	0x101f8ca58 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x194>
101f8ca50:     	ldr	x20, [x20]
101f8ca54:     	cbz	x20, 0x101f8cbc0 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x2fc>
101f8ca58:     	mov	x0, x20
101f8ca5c:     	bl	0x101f6def4 <__Z18UI_panel_is_activePK5Panel>
101f8ca60:     	cbz	w0, 0x101f8ca50 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x18c>
101f8ca64:     	ldr	x8, [x20, #0x10]
101f8ca68:     	cbz	x8, 0x101f8ca50 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x18c>
101f8ca6c:     	ldr	x9, [x8, #0x2b0]
101f8ca70:     	cmp	x9, x24
101f8ca74:     	b.ne	0x101f8ca50 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x18c>
101f8ca78:     	ldr	x8, [x8, #0x2c8]
101f8ca7c:     	adrp	x9, 0x101f8c000 <__ZL35ui_colorpicker_rgb_slider_update_cbP8bContextPvS1_+0xb0>
101f8ca80:     	add	x9, x9, #0xcfc
101f8ca84:     	cmp	x8, x9
101f8ca88:     	b.ne	0x101f8ca50 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x18c>
101f8ca8c:     	ldr	x8, [x20, #0xc0]
101f8ca90:     	ldr	x22, [x8, #0x10]
101f8ca94:     	cbz	x22, 0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8ca98:     	ldp	x28, x27, [x22, #0x10]
101f8ca9c:     	cmp	x28, x27
101f8caa0:     	b.eq	0x101f8ca50 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x18c>
101f8caa4:     	ldr	x8, [x28]
101f8caa8:     	ldrb	w9, [x8, #0x21]
101f8caac:     	cmp	w9, #0x1
101f8cab0:     	b.ne	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8cab4:     	ldr	x9, [x8, #0xd8]
101f8cab8:     	adrp	x10, 0x101f8c000 <__ZL35ui_colorpicker_rgb_slider_update_cbP8bContextPvS1_+0xb0>
101f8cabc:     	add	x10, x10, #0xc8c
101f8cac0:     	cmp	x9, x10
101f8cac4:     	b.ne	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8cac8:     	ldr	x9, [x8, #0xe0]
101f8cacc:     	cbz	x9, 0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8cad0:     	ldrb	w10, [x8, #0x19]
101f8cad4:     	tbnz	w10, #0x5, 0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8cad8:     	ldrb	w9, [x9, #0xb8]
101f8cadc:     	cmp	w9, #0x2
101f8cae0:     	mov	w10, #0x1               ; =1
101f8cae4:     	cneg	w10, w10, ne
101f8cae8:     	cmp	w9, #0x1
101f8caec:     	csel	w25, wzr, w10, eq
101f8caf0:     	tbnz	w25, #0x1f, 0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8caf4:     	add	x9, sp, #0x1e
101f8caf8:     	ldrb	w9, [x9, x25]
101f8cafc:     	tbnz	w9, #0x0, 0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8cb00:     	add	x2, sp, #0xc
101f8cb04:     	add	x3, x8, #0x70
101f8cb08:     	mov	x0, x19
101f8cb0c:     	mov	x1, x22
101f8cb10:     	bl	0x101f098d4 <__Z23ui_block_to_window_rctfPK7ARegionPK7uiBlockP4rctfPKS5_>
101f8cb14:     	ldp	s3, s1, [sp, #0xc]
101f8cb18:     	fsub	s0, s1, s3
101f8cb1c:     	mov	w8, #0xd70a             ; =55050
101f8cb20:     	movk	w8, #0x3c23, lsl #16
101f8cb24:     	fmov	s2, w8
101f8cb28:     	fadd	s0, s0, s2
101f8cb2c:     	ldr	s2, [x26, x25, lsl #2]
101f8cb30:     	scvtf	s2, s2
101f8cb34:     	fcmp	s0, s2
101f8cb38:     	b.mi	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8cb3c:     	ldp	s2, s0, [sp, #0x14]
101f8cb40:     	fsub	s4, s0, s2
101f8cb44:     	fmov	s5, w8
101f8cb48:     	fadd	s4, s4, s5
101f8cb4c:     	ldr	s5, [x21, #0x28]
101f8cb50:     	fcmp	s4, s5
101f8cb54:     	b.mi	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8cb58:     	ldr	s4, [x19, #0xa8]
101f8cb5c:     	scvtf	s4, s4
101f8cb60:     	fcmp	s3, s4
101f8cb64:     	b.mi	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8cb68:     	ldr	w8, [x19, #0xac]
101f8cb6c:     	add	w8, w8, #0x1
101f8cb70:     	scvtf	s3, w8
101f8cb74:     	fcmp	s1, s3
101f8cb78:     	b.gt	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8cb7c:     	ldr	s1, [x19, #0xb0]
101f8cb80:     	scvtf	s1, s1
101f8cb84:     	fcmp	s2, s1
101f8cb88:     	b.mi	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8cb8c:     	ldr	w8, [x19, #0xb4]
101f8cb90:     	add	w8, w8, #0x1
101f8cb94:     	scvtf	s1, w8
101f8cb98:     	fcmp	s0, s1
101f8cb9c:     	b.gt	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8cba0:     	mov	w8, #0x1                ; =1
101f8cba4:     	add	x9, sp, #0x1e
101f8cba8:     	strb	w8, [x9, x25]
101f8cbac:     	add	w23, w23, #0x1
101f8cbb0:     	add	x28, x28, #0x8
101f8cbb4:     	cmp	x28, x27
101f8cbb8:     	b.ne	0x101f8caa4 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x1e0>
101f8cbbc:     	b	0x101f8ca50 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x18c>
101f8cbc0:     	cmp	w23, #0x2
101f8cbc4:     	b.ne	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8cbc8:     	ldrb	w8, [sp, #0x1e]
101f8cbcc:     	cmp	w8, #0x1
101f8cbd0:     	b.ne	0x101f8c928 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x64>
101f8cbd4:     	ldrb	w8, [sp, #0x1f]
101f8cbd8:     	b	0x101f8c92c <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0x68>
