
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37883530390\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f6d954 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea>:
101f6d954:     	sub	sp, sp, #0x70
101f6d958:     	stp	x24, x23, [sp, #0x30]
101f6d95c:     	stp	x22, x21, [sp, #0x40]
101f6d960:     	stp	x20, x19, [sp, #0x50]
101f6d964:     	stp	x29, x30, [sp, #0x60]
101f6d968:     	add	x29, sp, #0x60
101f6d96c:     	mov	x19, x1
101f6d970:     	mov	x21, x0
101f6d974:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f6d978:     	cmp	x0, x19
101f6d97c:     	b.eq	0x101f6d998 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x44>
101f6d980:     	ldp	x29, x30, [sp, #0x60]
101f6d984:     	ldp	x20, x19, [sp, #0x50]
101f6d988:     	ldp	x22, x21, [sp, #0x40]
101f6d98c:     	ldp	x24, x23, [sp, #0x30]
101f6d990:     	add	sp, sp, #0x70
101f6d994:     	ret
101f6d998:     	mov	x0, x21
101f6d99c:     	bl	0x101f6d708 <__Z21UI_ipad_corner_canvasP8bContext>
101f6d9a0:     	cbz	x0, 0x101f6d980 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6d9a4:     	mov	x0, x19
101f6d9a8:     	mov	w1, #0x8                ; =8
101f6d9ac:     	bl	0x1003d66c8 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f6d9b0:     	mov	x22, x0
101f6d9b4:     	cbz	x0, 0x101f6d9fc <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xa8>
101f6d9b8:     	ldrh	w8, [x22, #0xc4]
101f6d9bc:     	tbnz	w8, #0x7, 0x101f6d980 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6d9c0:     	ldr	x0, [x19, #0x58]
101f6d9c4:     	mov	w1, #0x8                ; =8
101f6d9c8:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f6d9cc:     	mov	x20, x22
101f6d9d0:     	cbz	x0, 0x101f6d980 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6d9d4:     	ldr	x23, [x20, #0x120]
101f6d9d8:     	cbz	x23, 0x101f6da78 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x124>
101f6d9dc:     	ldrh	w8, [x20, #0xc4]
101f6d9e0:     	tbnz	w8, #0x0, 0x101f6dac0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x16c>
101f6d9e4:     	cbz	x23, 0x101f6dac8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x174>
101f6d9e8:     	cbz	x22, 0x101f6dac8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x174>
101f6d9ec:     	ldr	x8, [x20, #0x128]
101f6d9f0:     	ldrh	w8, [x8, #0x2b0]
101f6d9f4:     	cbnz	w8, 0x101f6db08 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x1b4>
101f6d9f8:     	b	0x101f6dac8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x174>
101f6d9fc:     	ldr	x0, [x19, #0x58]
101f6da00:     	mov	w1, #0x8                ; =8
101f6da04:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f6da08:     	cbz	x0, 0x101f6d980 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6da0c:     	mov	x23, x0
101f6da10:     	bl	0x1003d59e4 <__Z19BKE_area_region_newv>
101f6da14:     	mov	x20, x0
101f6da18:     	mov	x0, x19
101f6da1c:     	mov	w1, #0x0                ; =0
101f6da20:     	bl	0x1003d66c8 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f6da24:     	cbz	x0, 0x101f6da3c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xe8>
101f6da28:     	mov	x1, x0
101f6da2c:     	add	x0, x19, #0x78
101f6da30:     	mov	x2, x20
101f6da34:     	bl	0x10079062c <__Z20BLI_insertlinkbeforeP8ListBasePvS1_>
101f6da38:     	b	0x101f6da48 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xf4>
101f6da3c:     	add	x0, x19, #0x78
101f6da40:     	mov	x1, x20
101f6da44:     	bl	0x10078fe38 <__Z11BLI_addtailP8ListBasePv>
101f6da48:     	mov	w8, #0x8                ; =8
101f6da4c:     	movk	w8, #0x7, lsl #16
101f6da50:     	str	w8, [x20, #0xc0]
101f6da54:     	mov	w8, #0x1                ; =1
101f6da58:     	strh	w8, [x20, #0xca]
101f6da5c:     	ldrh	w8, [x20, #0xc4]
101f6da60:     	orr	w8, w8, #0x4
101f6da64:     	strh	w8, [x20, #0xc4]
101f6da68:     	ldr	x8, [x20, #0x128]
101f6da6c:     	str	x23, [x8, #0xb8]
101f6da70:     	ldr	x23, [x20, #0x120]
101f6da74:     	cbnz	x23, 0x101f6d9dc <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x88>
101f6da78:     	adrp	x8, 0x106633000 <__ZN7blender3gpu5debug3LOGE+0x10>
101f6da7c:     	add	x8, x8, #0x620
101f6da80:     	ldr	x8, [x8]
101f6da84:     	adrp	x3, 0x104d31000 <__ZL3hex+0x18676d>
101f6da88:     	add	x3, x3, #0x5bc
101f6da8c:     	mov	w24, #0x1               ; =1
101f6da90:     	mov	w0, #0x1                ; =1
101f6da94:     	mov	w1, #0x8                ; =8
101f6da98:     	mov	w2, #0x4                ; =4
101f6da9c:     	blr	x8
101f6daa0:     	mov	w8, #0xffff             ; =65535
101f6daa4:     	strh	w8, [x0]
101f6daa8:     	mov	w8, #-0x1               ; =-1
101f6daac:     	str	w8, [x0, #0x4]
101f6dab0:     	strb	w24, [x0, #0x2]
101f6dab4:     	str	x0, [x20, #0x120]
101f6dab8:     	ldrh	w8, [x20, #0xc4]
101f6dabc:     	tbz	w8, #0x0, 0x101f6d9e4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x90>
101f6dac0:     	and	w8, w8, #0xfffe
101f6dac4:     	strh	w8, [x20, #0xc4]
101f6dac8:     	mov	x0, x19
101f6dacc:     	mov	x1, x20
101f6dad0:     	bl	0x101605d9c <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f6dad4:     	mov	x0, x20
101f6dad8:     	bl	0x101604900 <__Z20ED_region_tag_redrawP7ARegion>
101f6dadc:     	mov	x0, x21
101f6dae0:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101f6dae4:     	mov	x22, x0
101f6dae8:     	mov	x0, x21
101f6daec:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f6daf0:     	mov	x1, x0
101f6daf4:     	mov	x0, x22
101f6daf8:     	mov	x2, x19
101f6dafc:     	bl	0x101606ea0 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea>
101f6db00:     	mov	x0, x20
101f6db04:     	bl	0x101607cf4 <__Z23ED_region_floating_initP7ARegion>
101f6db08:     	mov	x0, x21
101f6db0c:     	bl	0x101f6d708 <__Z21UI_ipad_corner_canvasP8bContext>
101f6db10:     	ldrh	w8, [x20, #0xc4]
101f6db14:     	cbz	x0, 0x101f6dbe4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x290>
101f6db18:     	mov	x22, x0
101f6db1c:     	mov	w9, #0x1                ; =1
101f6db20:     	bic	w8, w9, w8, lsr #1
101f6db24:     	ldr	x9, [x20, #0x128]
101f6db28:     	strh	w8, [x9, #0x2b0]
101f6db2c:     	add	x0, x0, #0x10
101f6db30:     	add	x2, sp, #0x2c
101f6db34:     	add	x3, sp, #0x28
101f6db38:     	mov	w1, #0x1                ; =1
101f6db3c:     	bl	0x101fbdc1c <__Z27UI_view2d_scroller_size_getPK6View2DbPfS2_>
101f6db40:     	ldr	x8, [x22, #0x128]
101f6db44:     	ldr	s0, [x8, #0xa8]
101f6db48:     	scvtf	s0, s0
101f6db4c:     	ldr	s1, [sp, #0x28]
101f6db50:     	fcmp	s1, s0
101f6db54:     	fcsel	s0, s0, s1, mi
101f6db58:     	str	s0, [sp, #0x28]
101f6db5c:     	ldur	q1, [x20, #0xa8]
101f6db60:     	str	q1, [sp, #0x10]
101f6db64:     	ldr	w8, [x20, #0xa8]
101f6db68:     	ldr	x9, [x20, #0x128]
101f6db6c:     	ldr	w10, [x20, #0xb0]
101f6db70:     	ldp	w11, w9, [x9, #0xe0]
101f6db74:     	ldr	s1, [sp, #0x2c]
101f6db78:     	fcvtzs	w12, s1
101f6db7c:     	add	w8, w8, w12
101f6db80:     	ldr	w12, [sp, #0x10]
101f6db84:     	ldr	w13, [sp, #0x18]
101f6db88:     	add	w11, w11, w12
101f6db8c:     	sub	w1, w8, w11
101f6db90:     	fcvtzs	w8, s0
101f6db94:     	add	w8, w10, w8
101f6db98:     	add	w9, w9, w13
101f6db9c:     	sub	w2, w8, w9
101f6dba0:     	add	x0, sp, #0x10
101f6dba4:     	bl	0x1007fd304 <__Z18BLI_rcti_translateP4rctiii>
101f6dba8:     	mov	x0, x21
101f6dbac:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f6dbb0:     	mov	x1, x0
101f6dbb4:     	add	x4, sp, #0x10
101f6dbb8:     	mov	x5, sp
101f6dbbc:     	mov	x0, x21
101f6dbc0:     	mov	x2, x19
101f6dbc4:     	mov	x3, x22
101f6dbc8:     	bl	0x101620644 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_>
101f6dbcc:     	cbz	w0, 0x101f6dc20 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2cc>
101f6dbd0:     	ldr	w8, [sp]
101f6dbd4:     	ldr	w9, [x22, #0xa8]
101f6dbd8:     	sub	w8, w8, w9
101f6dbdc:     	scvtf	s0, w8
101f6dbe0:     	b	0x101f6dc2c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2d8>
101f6dbe4:     	orr	w8, w8, #0x1
101f6dbe8:     	strh	w8, [x20, #0xc4]
101f6dbec:     	add	x0, x20, #0xa8
101f6dbf0:     	mov	w1, #0x0                ; =0
101f6dbf4:     	mov	w2, #0x0                ; =0
101f6dbf8:     	mov	w3, #0x0                ; =0
101f6dbfc:     	mov	w4, #0x0                ; =0
101f6dc00:     	bl	0x1007fcf78 <__Z13BLI_rcti_initP4rctiiiii>
101f6dc04:     	mov	x0, x20
101f6dc08:     	ldp	x29, x30, [sp, #0x60]
101f6dc0c:     	ldp	x20, x19, [sp, #0x50]
101f6dc10:     	ldp	x22, x21, [sp, #0x40]
101f6dc14:     	ldp	x24, x23, [sp, #0x30]
101f6dc18:     	add	sp, sp, #0x70
101f6dc1c:     	b	0x101604900 <__Z20ED_region_tag_redrawP7ARegion>
101f6dc20:     	ldr	x8, [x22, #0x128]
101f6dc24:     	ldr	s0, [x8, #0xa0]
101f6dc28:     	scvtf	s0, s0
101f6dc2c:     	ldr	s1, [sp, #0x2c]
101f6dc30:     	fcmp	s1, s0
101f6dc34:     	fcsel	s0, s0, s1, mi
101f6dc38:     	str	s0, [sp, #0x2c]
101f6dc3c:     	ldr	x8, [x20, #0x128]
101f6dc40:     	ldr	s1, [x8, #0xe0]
101f6dc44:     	scvtf	s2, s1
101f6dc48:     	ldr	s1, [sp, #0x28]
101f6dc4c:     	fcmp	s0, s2
101f6dc50:     	b.ne	0x101f6dc64 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x310>
101f6dc54:     	ldr	s2, [x8, #0xe4]
101f6dc58:     	scvtf	s2, s2
101f6dc5c:     	fcmp	s1, s2
101f6dc60:     	b.eq	0x101f6d980 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6dc64:     	fcvtzs	w9, s0
101f6dc68:     	str	w9, [x8, #0xe0]
101f6dc6c:     	fcvtzs	w8, s1
101f6dc70:     	ldr	x9, [x20, #0x128]
101f6dc74:     	str	w8, [x9, #0xe4]
101f6dc78:     	mov	x0, x19
101f6dc7c:     	mov	x1, x20
101f6dc80:     	bl	0x101605d9c <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f6dc84:     	mov	x0, x20
101f6dc88:     	bl	0x101604900 <__Z20ED_region_tag_redrawP7ARegion>
101f6dc8c:     	b	0x101f6d980 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
