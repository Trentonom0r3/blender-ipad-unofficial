
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f91b28 <__ZL17hud_region_layoutPK8bContextP7ARegion>:
101f91b28:     	stp	x24, x23, [sp, #-0x40]!
101f91b2c:     	stp	x22, x21, [sp, #0x10]
101f91b30:     	stp	x20, x19, [sp, #0x20]
101f91b34:     	stp	x29, x30, [sp, #0x30]
101f91b38:     	add	x29, sp, #0x30
101f91b3c:     	mov	x19, x1
101f91b40:     	mov	x20, x0
101f91b44:     	ldr	x21, [x1, #0x120]
101f91b48:     	bl	0x101f90e78 <__ZL21ipad_knife_hud_originPK8bContext>
101f91b4c:     	cbnz	x0, 0x101f91b5c <__ZL17hud_region_layoutPK8bContextP7ARegion+0x34>
101f91b50:     	mov	x0, x20
101f91b54:     	bl	0x101f91dc4 <__Z21UI_ipad_corner_canvasP8bContext>
101f91b58:     	cbz	x0, 0x101f91c78 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x150>
101f91b5c:     	mov	x0, x20
101f91b60:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f91b64:     	mov	x21, x0
101f91b68:     	ldrh	w23, [x19, #0xc8]
101f91b6c:     	mov	x0, x20
101f91b70:     	mov	x1, x19
101f91b74:     	bl	0x10162670c <__Z23ED_region_panels_layoutPK8bContextP7ARegion>
101f91b78:     	ldr	x22, [x19, #0xd0]
101f91b7c:     	cbz	x22, 0x101f91ca0 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x178>
101f91b80:     	mov	w24, #0x0               ; =0
101f91b84:     	mov	x0, x22
101f91b88:     	bl	0x101f72584 <__Z18UI_panel_is_activePK5Panel>
101f91b8c:     	orr	w24, w24, w0
101f91b90:     	ldr	x22, [x22]
101f91b94:     	cbnz	x22, 0x101f91b84 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x5c>
101f91b98:     	tbz	w24, #0x0, 0x101f91ca0 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x178>
101f91b9c:     	ldr	x8, [x19, #0xd0]
101f91ba0:     	cbz	x8, 0x101f91c60 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x138>
101f91ba4:     	ldrh	w8, [x21, #0x52]
101f91ba8:     	ldrh	w9, [x19, #0xc8]
101f91bac:     	tbnz	w8, #0x3, 0x101f91bb8 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x90>
101f91bb0:     	cmp	w9, w23
101f91bb4:     	b.eq	0x101f91c60 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x138>
101f91bb8:     	adrp	x8, 0x106d8c000 <_build_commit_date>
101f91bbc:     	add	x8, x8, #0xe08
101f91bc0:     	ldr	s0, [x8, #0x2654]
101f91bc4:     	ldr	h1, [x19, #0xc6]
101f91bc8:     	sshll.4s	v1, v1, #0x0
101f91bcc:     	scvtf	s1, s1
101f91bd0:     	fmov	s2, #0.50000000
101f91bd4:     	fadd	s1, s1, s2
101f91bd8:     	fmul	s1, s0, s1
101f91bdc:     	fcvtzs	w8, s1
101f91be0:     	sxth	w9, w9
101f91be4:     	scvtf	s1, w9
101f91be8:     	fadd	s1, s1, s2
101f91bec:     	fmul	s0, s0, s1
101f91bf0:     	fcvtzs	w9, s0
101f91bf4:     	ldrh	w10, [x19, #0xc4]
101f91bf8:     	tbz	w10, #0x5, 0x101f91c08 <__ZL17hud_region_layoutPK8bContextP7ARegion+0xe0>
101f91bfc:     	ldrsh	w11, [x19, #0xb8]
101f91c00:     	cmp	w8, w11
101f91c04:     	csel	w8, w8, w11, lt
101f91c08:     	tbz	w10, #0x6, 0x101f91c18 <__ZL17hud_region_layoutPK8bContextP7ARegion+0xf0>
101f91c0c:     	ldrsh	w10, [x19, #0xba]
101f91c10:     	cmp	w9, w10
101f91c14:     	csel	w9, w9, w10, lt
101f91c18:     	strh	w8, [x19, #0xb8]
101f91c1c:     	strh	w9, [x19, #0xba]
101f91c20:     	ldr	w10, [x19, #0xa8]
101f91c24:     	sxth	w2, w8
101f91c28:     	add	w8, w2, w10
101f91c2c:     	sub	w8, w8, #0x1
101f91c30:     	str	w8, [x19, #0xac]
101f91c34:     	ldr	w8, [x19, #0xb0]
101f91c38:     	sxth	w3, w9
101f91c3c:     	add	w8, w3, w8
101f91c40:     	sub	w8, w8, #0x1
101f91c44:     	str	w8, [x19, #0xb4]
101f91c48:     	add	x0, x19, #0x10
101f91c4c:     	mov	w1, #0x1                ; =1
101f91c50:     	bl	0x101fe07a8 <__Z23UI_view2d_region_reinitP6View2Dsii>
101f91c54:     	mov	x0, x20
101f91c58:     	mov	x1, x19
101f91c5c:     	bl	0x10162670c <__Z23ED_region_panels_layoutPK8bContextP7ARegion>
101f91c60:     	mov	x0, x20
101f91c64:     	ldp	x29, x30, [sp, #0x30]
101f91c68:     	ldp	x20, x19, [sp, #0x20]
101f91c6c:     	ldp	x22, x21, [sp, #0x10]
101f91c70:     	ldp	x24, x23, [sp], #0x40
101f91c74:     	b	0x101fe1808 <__Z22UI_view2d_view_restorePK8bContext>
101f91c78:     	cbz	x21, 0x101f91c98 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x170>
101f91c7c:     	ldrb	w8, [x21, #0x2]
101f91c80:     	tbnz	w8, #0x0, 0x101f91c98 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x170>
101f91c84:     	ldrsh	w1, [x21]
101f91c88:     	ldr	w2, [x21, #0x30]
101f91c8c:     	mov	x0, x20
101f91c90:     	bl	0x101f92904 <__ZL14last_redo_pollPK8bContextsi>
101f91c94:     	tbnz	w0, #0x0, 0x101f91b5c <__ZL17hud_region_layoutPK8bContextP7ARegion+0x34>
101f91c98:     	mov	x0, x19
101f91c9c:     	bl	0x101620de8 <__Z20ED_region_tag_redrawP7ARegion>
101f91ca0:     	ldrh	w8, [x19, #0xc4]
101f91ca4:     	orr	w8, w8, #0x1
101f91ca8:     	strh	w8, [x19, #0xc4]
101f91cac:     	add	x0, x19, #0xa8
101f91cb0:     	mov	w1, #0x0                ; =0
101f91cb4:     	mov	w2, #0x0                ; =0
101f91cb8:     	mov	w3, #0x0                ; =0
101f91cbc:     	mov	w4, #0x0                ; =0
101f91cc0:     	ldp	x29, x30, [sp, #0x30]
101f91cc4:     	ldp	x20, x19, [sp, #0x20]
101f91cc8:     	ldp	x22, x21, [sp, #0x10]
101f91ccc:     	ldp	x24, x23, [sp], #0x40
101f91cd0:     	b	0x1007fcfb4 <__Z13BLI_rcti_initP4rctiiiii>
