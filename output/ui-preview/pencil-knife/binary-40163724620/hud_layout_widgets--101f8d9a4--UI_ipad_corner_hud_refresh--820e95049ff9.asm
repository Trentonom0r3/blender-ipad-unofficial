
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f8d9a4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea>:
101f8d9a4:     	sub	sp, sp, #0xa0
101f8d9a8:     	stp	x26, x25, [sp, #0x50]
101f8d9ac:     	stp	x24, x23, [sp, #0x60]
101f8d9b0:     	stp	x22, x21, [sp, #0x70]
101f8d9b4:     	stp	x20, x19, [sp, #0x80]
101f8d9b8:     	stp	x29, x30, [sp, #0x90]
101f8d9bc:     	add	x29, sp, #0x90
101f8d9c0:     	mov	x19, x1
101f8d9c4:     	mov	x20, x0
101f8d9c8:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f8d9cc:     	cmp	x0, x19
101f8d9d0:     	b.eq	0x101f8d9f0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x4c>
101f8d9d4:     	ldp	x29, x30, [sp, #0x90]
101f8d9d8:     	ldp	x20, x19, [sp, #0x80]
101f8d9dc:     	ldp	x22, x21, [sp, #0x70]
101f8d9e0:     	ldp	x24, x23, [sp, #0x60]
101f8d9e4:     	ldp	x26, x25, [sp, #0x50]
101f8d9e8:     	add	sp, sp, #0xa0
101f8d9ec:     	ret
101f8d9f0:     	movi.16b	v0, #0x0
101f8d9f4:     	stur	q0, [sp, #0x3e]
101f8d9f8:     	stp	q0, q0, [sp, #0x20]
101f8d9fc:     	add	x1, sp, #0x20
101f8da00:     	mov	x0, x20
101f8da04:     	bl	0x101f8c514 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout>
101f8da08:     	ldr	x8, [sp, #0x20]
101f8da0c:     	cmp	x8, #0x0
101f8da10:     	csel	w24, wzr, w0, eq
101f8da14:     	mov	x0, x19
101f8da18:     	mov	w1, #0x8                ; =8
101f8da1c:     	bl	0x1003d66c8 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f8da20:     	mov	x22, x0
101f8da24:     	cbz	x0, 0x101f8da7c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xd8>
101f8da28:     	tbnz	w24, #0x0, 0x101f8da7c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xd8>
101f8da2c:     	ldr	x8, [x22, #0x120]
101f8da30:     	cbz	x8, 0x101f8da7c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xd8>
101f8da34:     	ldrb	w9, [x8, #0x3]
101f8da38:     	cmp	w9, #0x1
101f8da3c:     	b.ne	0x101f8da80 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xdc>
101f8da40:     	strb	wzr, [x8, #0x3]
101f8da44:     	mov	x0, x22
101f8da48:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
101f8da4c:     	ldrh	w8, [x22, #0xc4]
101f8da50:     	tbz	w8, #0x7, 0x101f8da80 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xdc>
101f8da54:     	orr	w8, w8, #0x1
101f8da58:     	strh	w8, [x22, #0xc4]
101f8da5c:     	add	x0, x22, #0xa8
101f8da60:     	mov	w1, #0x0                ; =0
101f8da64:     	mov	w2, #0x0                ; =0
101f8da68:     	mov	w3, #0x0                ; =0
101f8da6c:     	mov	w4, #0x0                ; =0
101f8da70:     	bl	0x1007fcf78 <__Z13BLI_rcti_initP4rctiiiii>
101f8da74:     	mov	x0, x22
101f8da78:     	b	0x101f8ddd0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x42c>
101f8da7c:     	tbnz	w24, #0x0, 0x101f8da8c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xe8>
101f8da80:     	mov	x0, x20
101f8da84:     	bl	0x101f8d72c <__Z21UI_ipad_corner_canvasP8bContext>
101f8da88:     	cbz	x0, 0x101f8d9d4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x30>
101f8da8c:     	cbz	x22, 0x101f8dab4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x110>
101f8da90:     	ldrh	w8, [x22, #0xc4]
101f8da94:     	tbz	w8, #0x7, 0x101f8da9c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xf8>
101f8da98:     	tbz	w24, #0x0, 0x101f8d9d4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x30>
101f8da9c:     	ldr	x0, [x19, #0x58]
101f8daa0:     	mov	w1, #0x8                ; =8
101f8daa4:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f8daa8:     	mov	x21, x22
101f8daac:     	cbnz	x0, 0x101f8db28 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x184>
101f8dab0:     	b	0x101f8d9d4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x30>
101f8dab4:     	ldr	x0, [x19, #0x58]
101f8dab8:     	mov	w1, #0x8                ; =8
101f8dabc:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f8dac0:     	cbz	x0, 0x101f8d9d4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x30>
101f8dac4:     	mov	x23, x0
101f8dac8:     	bl	0x1003d59e4 <__Z19BKE_area_region_newv>
101f8dacc:     	mov	x21, x0
101f8dad0:     	mov	x0, x19
101f8dad4:     	mov	w1, #0x0                ; =0
101f8dad8:     	bl	0x1003d66c8 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f8dadc:     	cbz	x0, 0x101f8daf4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x150>
101f8dae0:     	mov	x1, x0
101f8dae4:     	add	x0, x19, #0x78
101f8dae8:     	mov	x2, x21
101f8daec:     	bl	0x10079062c <__Z20BLI_insertlinkbeforeP8ListBasePvS1_>
101f8daf0:     	b	0x101f8db00 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x15c>
101f8daf4:     	add	x0, x19, #0x78
101f8daf8:     	mov	x1, x21
101f8dafc:     	bl	0x10078fe38 <__Z11BLI_addtailP8ListBasePv>
101f8db00:     	mov	w8, #0x8                ; =8
101f8db04:     	movk	w8, #0x7, lsl #16
101f8db08:     	str	w8, [x21, #0xc0]
101f8db0c:     	mov	w8, #0x1                ; =1
101f8db10:     	strh	w8, [x21, #0xca]
101f8db14:     	ldrh	w8, [x21, #0xc4]
101f8db18:     	orr	w8, w8, #0x4
101f8db1c:     	strh	w8, [x21, #0xc4]
101f8db20:     	ldr	x8, [x21, #0x128]
101f8db24:     	str	x23, [x8, #0xb8]
101f8db28:     	ldr	x23, [x21, #0x120]
101f8db2c:     	mov	x0, x23
101f8db30:     	cbnz	x23, 0x101f8db74 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x1d0>
101f8db34:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101f8db38:     	add	x8, x8, #0x6e0
101f8db3c:     	ldr	x8, [x8]
101f8db40:     	adrp	x3, 0x104d53000 <__ZL3hex+0x18734d>
101f8db44:     	add	x3, x3, #0x7bc
101f8db48:     	mov	w25, #0x1               ; =1
101f8db4c:     	mov	w0, #0x1                ; =1
101f8db50:     	mov	w1, #0x38               ; =56
101f8db54:     	mov	w2, #0x8                ; =8
101f8db58:     	blr	x8
101f8db5c:     	mov	w8, #0xffff             ; =65535
101f8db60:     	strh	w8, [x0]
101f8db64:     	mov	w8, #-0x1               ; =-1
101f8db68:     	str	w8, [x0, #0x30]
101f8db6c:     	strb	w25, [x0, #0x2]
101f8db70:     	str	x0, [x21, #0x120]
101f8db74:     	strb	w24, [x0, #0x3]
101f8db78:     	ldrh	w8, [x21, #0xc4]
101f8db7c:     	tbnz	w8, #0x0, 0x101f8dbe4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x240>
101f8db80:     	cbz	x23, 0x101f8dbec <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x248>
101f8db84:     	cbz	x22, 0x101f8dbec <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x248>
101f8db88:     	ldr	x8, [x21, #0x128]
101f8db8c:     	ldrh	w8, [x8, #0x2b0]
101f8db90:     	cbz	w8, 0x101f8dbec <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x248>
101f8db94:     	cbz	w24, 0x101f8dc30 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x28c>
101f8db98:     	movi.16b	v0, #0x0
101f8db9c:     	stur	q0, [sp, #0x3e]
101f8dba0:     	stp	q0, q0, [sp, #0x20]
101f8dba4:     	add	x1, sp, #0x20
101f8dba8:     	mov	x0, x20
101f8dbac:     	bl	0x101f8c514 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout>
101f8dbb0:     	tbz	w0, #0x0, 0x101f8dbbc <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x218>
101f8dbb4:     	ldr	x22, [sp, #0x20]
101f8dbb8:     	cbnz	x22, 0x101f8dc40 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x29c>
101f8dbbc:     	ldrh	w8, [x21, #0xc4]
101f8dbc0:     	orr	w8, w8, #0x1
101f8dbc4:     	strh	w8, [x21, #0xc4]
101f8dbc8:     	add	x0, x21, #0xa8
101f8dbcc:     	mov	w1, #0x0                ; =0
101f8dbd0:     	mov	w2, #0x0                ; =0
101f8dbd4:     	mov	w3, #0x0                ; =0
101f8dbd8:     	mov	w4, #0x0                ; =0
101f8dbdc:     	bl	0x1007fcf78 <__Z13BLI_rcti_initP4rctiiiii>
101f8dbe0:     	b	0x101f8ddcc <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x428>
101f8dbe4:     	and	w8, w8, #0xfffe
101f8dbe8:     	strh	w8, [x21, #0xc4]
101f8dbec:     	mov	x0, x19
101f8dbf0:     	mov	x1, x21
101f8dbf4:     	bl	0x10161f598 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f8dbf8:     	mov	x0, x21
101f8dbfc:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
101f8dc00:     	mov	x0, x20
101f8dc04:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101f8dc08:     	mov	x22, x0
101f8dc0c:     	mov	x0, x20
101f8dc10:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f8dc14:     	mov	x1, x0
101f8dc18:     	mov	x0, x22
101f8dc1c:     	mov	x2, x19
101f8dc20:     	bl	0x10162069c <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea>
101f8dc24:     	mov	x0, x21
101f8dc28:     	bl	0x1016214f0 <__Z23ED_region_floating_initP7ARegion>
101f8dc2c:     	cbnz	w24, 0x101f8db98 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x1f4>
101f8dc30:     	mov	x0, x20
101f8dc34:     	bl	0x101f8d72c <__Z21UI_ipad_corner_canvasP8bContext>
101f8dc38:     	mov	x22, x0
101f8dc3c:     	cbz	x22, 0x101f8dbbc <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x218>
101f8dc40:     	ldrh	w8, [x21, #0xc4]
101f8dc44:     	mov	w9, #0x1                ; =1
101f8dc48:     	bic	w8, w9, w8, lsr #1
101f8dc4c:     	ldr	x9, [x21, #0x128]
101f8dc50:     	strh	w8, [x9, #0x2b0]
101f8dc54:     	add	x0, x22, #0x10
101f8dc58:     	add	x2, sp, #0x1c
101f8dc5c:     	add	x3, sp, #0x18
101f8dc60:     	mov	w1, #0x1                ; =1
101f8dc64:     	bl	0x101fde114 <__Z27UI_view2d_scroller_size_getPK6View2DbPfS2_>
101f8dc68:     	ldr	x8, [x22, #0x128]
101f8dc6c:     	ldr	s0, [x8, #0xa8]
101f8dc70:     	scvtf	s0, s0
101f8dc74:     	ldr	s1, [sp, #0x18]
101f8dc78:     	fcmp	s1, s0
101f8dc7c:     	fcsel	s0, s0, s1, mi
101f8dc80:     	str	s0, [sp, #0x18]
101f8dc84:     	ldur	q1, [x21, #0xa8]
101f8dc88:     	str	q1, [sp]
101f8dc8c:     	ldr	w8, [x21, #0xa8]
101f8dc90:     	ldr	x9, [x21, #0x128]
101f8dc94:     	ldp	w10, w9, [x9, #0xe0]
101f8dc98:     	sub	w23, w8, w10
101f8dc9c:     	ldr	w8, [x21, #0xb0]
101f8dca0:     	sub	w25, w8, w9
101f8dca4:     	cbz	w24, 0x101f8dce8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x344>
101f8dca8:     	movi.16b	v0, #0x0
101f8dcac:     	stur	q0, [sp, #0x3e]
101f8dcb0:     	stp	q0, q0, [sp, #0x20]
101f8dcb4:     	add	x1, sp, #0x20
101f8dcb8:     	mov	x0, x20
101f8dcbc:     	bl	0x101f8c514 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout>
101f8dcc0:     	tbz	w0, #0x0, 0x101f8dce4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x340>
101f8dcc4:     	ldr	w8, [sp, #0x28]
101f8dcc8:     	ldr	w9, [sp, #0x30]
101f8dccc:     	sub	w8, w8, w23
101f8dcd0:     	scvtf	s1, w8
101f8dcd4:     	sub	w8, w9, w25
101f8dcd8:     	scvtf	s0, w8
101f8dcdc:     	stp	s0, s1, [sp, #0x18]
101f8dce0:     	b	0x101f8dce8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x344>
101f8dce4:     	ldr	s0, [sp, #0x18]
101f8dce8:     	ldr	s1, [sp, #0x1c]
101f8dcec:     	fcvtzs	w8, s1
101f8dcf0:     	add	w8, w23, w8
101f8dcf4:     	ldr	w9, [sp]
101f8dcf8:     	ldr	w10, [sp, #0x8]
101f8dcfc:     	sub	w1, w8, w9
101f8dd00:     	fcvtzs	w8, s0
101f8dd04:     	add	w8, w25, w8
101f8dd08:     	sub	w2, w8, w10
101f8dd0c:     	mov	x0, sp
101f8dd10:     	bl	0x1007fd304 <__Z18BLI_rcti_translateP4rctiii>
101f8dd14:     	mov	x0, x20
101f8dd18:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f8dd1c:     	mov	x1, x0
101f8dd20:     	mov	x4, sp
101f8dd24:     	add	x5, sp, #0x20
101f8dd28:     	mov	x0, x20
101f8dd2c:     	mov	x2, x19
101f8dd30:     	mov	x3, x22
101f8dd34:     	bl	0x10163a408 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_>
101f8dd38:     	cbz	w0, 0x101f8dd50 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x3ac>
101f8dd3c:     	ldr	w8, [sp, #0x20]
101f8dd40:     	tbnz	w24, #0x0, 0x101f8dd48 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x3a4>
101f8dd44:     	ldr	w23, [x22, #0xa8]
101f8dd48:     	sub	w8, w8, w23
101f8dd4c:     	b	0x101f8dd70 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x3cc>
101f8dd50:     	ldr	x8, [x22, #0x128]
101f8dd54:     	ldr	w8, [x8, #0xa0]
101f8dd58:     	cbz	w24, 0x101f8dd68 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x3c4>
101f8dd5c:     	ldr	w9, [x22, #0xa8]
101f8dd60:     	sub	w9, w9, w23
101f8dd64:     	b	0x101f8dd6c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x3c8>
101f8dd68:     	mov	w9, #0x0                ; =0
101f8dd6c:     	add	w8, w9, w8
101f8dd70:     	scvtf	s0, w8
101f8dd74:     	ldr	s1, [sp, #0x1c]
101f8dd78:     	fcmp	s1, s0
101f8dd7c:     	fcsel	s0, s0, s1, mi
101f8dd80:     	str	s0, [sp, #0x1c]
101f8dd84:     	ldr	x8, [x21, #0x128]
101f8dd88:     	ldr	s1, [x8, #0xe0]
101f8dd8c:     	scvtf	s2, s1
101f8dd90:     	ldr	s1, [sp, #0x18]
101f8dd94:     	fcmp	s0, s2
101f8dd98:     	b.ne	0x101f8ddac <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x408>
101f8dd9c:     	ldr	s2, [x8, #0xe4]
101f8dda0:     	scvtf	s2, s2
101f8dda4:     	fcmp	s1, s2
101f8dda8:     	b.eq	0x101f8d9d4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x30>
101f8ddac:     	fcvtzs	w9, s0
101f8ddb0:     	str	w9, [x8, #0xe0]
101f8ddb4:     	fcvtzs	w8, s1
101f8ddb8:     	ldr	x9, [x21, #0x128]
101f8ddbc:     	str	w8, [x9, #0xe4]
101f8ddc0:     	mov	x0, x19
101f8ddc4:     	mov	x1, x21
101f8ddc8:     	bl	0x10161f598 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f8ddcc:     	mov	x0, x21
101f8ddd0:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
101f8ddd4:     	b	0x101f8d9d4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x30>
