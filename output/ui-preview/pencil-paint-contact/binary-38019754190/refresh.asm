
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-38019754190\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f71a14 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea>:
101f71a14:     	sub	sp, sp, #0x70
101f71a18:     	stp	x24, x23, [sp, #0x30]
101f71a1c:     	stp	x22, x21, [sp, #0x40]
101f71a20:     	stp	x20, x19, [sp, #0x50]
101f71a24:     	stp	x29, x30, [sp, #0x60]
101f71a28:     	add	x29, sp, #0x60
101f71a2c:     	mov	x19, x1
101f71a30:     	mov	x21, x0
101f71a34:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f71a38:     	cmp	x0, x19
101f71a3c:     	b.eq	0x101f71a58 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x44>
101f71a40:     	ldp	x29, x30, [sp, #0x60]
101f71a44:     	ldp	x20, x19, [sp, #0x50]
101f71a48:     	ldp	x22, x21, [sp, #0x40]
101f71a4c:     	ldp	x24, x23, [sp, #0x30]
101f71a50:     	add	sp, sp, #0x70
101f71a54:     	ret
101f71a58:     	mov	x0, x21
101f71a5c:     	bl	0x101f717c8 <__Z21UI_ipad_corner_canvasP8bContext>
101f71a60:     	cbz	x0, 0x101f71a40 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f71a64:     	mov	x0, x19
101f71a68:     	mov	w1, #0x8                ; =8
101f71a6c:     	bl	0x1003d66c8 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f71a70:     	mov	x22, x0
101f71a74:     	cbz	x0, 0x101f71abc <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xa8>
101f71a78:     	ldrh	w8, [x22, #0xc4]
101f71a7c:     	tbnz	w8, #0x7, 0x101f71a40 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f71a80:     	ldr	x0, [x19, #0x58]
101f71a84:     	mov	w1, #0x8                ; =8
101f71a88:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f71a8c:     	mov	x20, x22
101f71a90:     	cbz	x0, 0x101f71a40 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f71a94:     	ldr	x23, [x20, #0x120]
101f71a98:     	cbz	x23, 0x101f71b38 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x124>
101f71a9c:     	ldrh	w8, [x20, #0xc4]
101f71aa0:     	tbnz	w8, #0x0, 0x101f71b80 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x16c>
101f71aa4:     	cbz	x23, 0x101f71b88 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x174>
101f71aa8:     	cbz	x22, 0x101f71b88 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x174>
101f71aac:     	ldr	x8, [x20, #0x128]
101f71ab0:     	ldrh	w8, [x8, #0x2b0]
101f71ab4:     	cbnz	w8, 0x101f71bc8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x1b4>
101f71ab8:     	b	0x101f71b88 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x174>
101f71abc:     	ldr	x0, [x19, #0x58]
101f71ac0:     	mov	w1, #0x8                ; =8
101f71ac4:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f71ac8:     	cbz	x0, 0x101f71a40 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f71acc:     	mov	x23, x0
101f71ad0:     	bl	0x1003d59e4 <__Z19BKE_area_region_newv>
101f71ad4:     	mov	x20, x0
101f71ad8:     	mov	x0, x19
101f71adc:     	mov	w1, #0x0                ; =0
101f71ae0:     	bl	0x1003d66c8 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f71ae4:     	cbz	x0, 0x101f71afc <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xe8>
101f71ae8:     	mov	x1, x0
101f71aec:     	add	x0, x19, #0x78
101f71af0:     	mov	x2, x20
101f71af4:     	bl	0x10079062c <__Z20BLI_insertlinkbeforeP8ListBasePvS1_>
101f71af8:     	b	0x101f71b08 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xf4>
101f71afc:     	add	x0, x19, #0x78
101f71b00:     	mov	x1, x20
101f71b04:     	bl	0x10078fe38 <__Z11BLI_addtailP8ListBasePv>
101f71b08:     	mov	w8, #0x8                ; =8
101f71b0c:     	movk	w8, #0x7, lsl #16
101f71b10:     	str	w8, [x20, #0xc0]
101f71b14:     	mov	w8, #0x1                ; =1
101f71b18:     	strh	w8, [x20, #0xca]
101f71b1c:     	ldrh	w8, [x20, #0xc4]
101f71b20:     	orr	w8, w8, #0x4
101f71b24:     	strh	w8, [x20, #0xc4]
101f71b28:     	ldr	x8, [x20, #0x128]
101f71b2c:     	str	x23, [x8, #0xb8]
101f71b30:     	ldr	x23, [x20, #0x120]
101f71b34:     	cbnz	x23, 0x101f71a9c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x88>
101f71b38:     	adrp	x8, 0x106637000 <__ZN7blender3gpu22msl_patch_default_lockE+0x38>
101f71b3c:     	add	x8, x8, #0x5e0
101f71b40:     	ldr	x8, [x8]
101f71b44:     	adrp	x3, 0x104d35000 <__ZL3hex+0x1865c5>
101f71b48:     	add	x3, x3, #0x7cc
101f71b4c:     	mov	w24, #0x1               ; =1
101f71b50:     	mov	w0, #0x1                ; =1
101f71b54:     	mov	w1, #0x8                ; =8
101f71b58:     	mov	w2, #0x4                ; =4
101f71b5c:     	blr	x8
101f71b60:     	mov	w8, #0xffff             ; =65535
101f71b64:     	strh	w8, [x0]
101f71b68:     	mov	w8, #-0x1               ; =-1
101f71b6c:     	str	w8, [x0, #0x4]
101f71b70:     	strb	w24, [x0, #0x2]
101f71b74:     	str	x0, [x20, #0x120]
101f71b78:     	ldrh	w8, [x20, #0xc4]
101f71b7c:     	tbz	w8, #0x0, 0x101f71aa4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x90>
101f71b80:     	and	w8, w8, #0xfffe
101f71b84:     	strh	w8, [x20, #0xc4]
101f71b88:     	mov	x0, x19
101f71b8c:     	mov	x1, x20
101f71b90:     	bl	0x101609b9c <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f71b94:     	mov	x0, x20
101f71b98:     	bl	0x101608700 <__Z20ED_region_tag_redrawP7ARegion>
101f71b9c:     	mov	x0, x21
101f71ba0:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101f71ba4:     	mov	x22, x0
101f71ba8:     	mov	x0, x21
101f71bac:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f71bb0:     	mov	x1, x0
101f71bb4:     	mov	x0, x22
101f71bb8:     	mov	x2, x19
101f71bbc:     	bl	0x10160aca0 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea>
101f71bc0:     	mov	x0, x20
101f71bc4:     	bl	0x10160baf4 <__Z23ED_region_floating_initP7ARegion>
101f71bc8:     	mov	x0, x21
101f71bcc:     	bl	0x101f717c8 <__Z21UI_ipad_corner_canvasP8bContext>
101f71bd0:     	ldrh	w8, [x20, #0xc4]
101f71bd4:     	cbz	x0, 0x101f71ca4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x290>
101f71bd8:     	mov	x22, x0
101f71bdc:     	mov	w9, #0x1                ; =1
101f71be0:     	bic	w8, w9, w8, lsr #1
101f71be4:     	ldr	x9, [x20, #0x128]
101f71be8:     	strh	w8, [x9, #0x2b0]
101f71bec:     	add	x0, x0, #0x10
101f71bf0:     	add	x2, sp, #0x2c
101f71bf4:     	add	x3, sp, #0x28
101f71bf8:     	mov	w1, #0x1                ; =1
101f71bfc:     	bl	0x101fc1d48 <__Z27UI_view2d_scroller_size_getPK6View2DbPfS2_>
101f71c00:     	ldr	x8, [x22, #0x128]
101f71c04:     	ldr	s0, [x8, #0xa8]
101f71c08:     	scvtf	s0, s0
101f71c0c:     	ldr	s1, [sp, #0x28]
101f71c10:     	fcmp	s1, s0
101f71c14:     	fcsel	s0, s0, s1, mi
101f71c18:     	str	s0, [sp, #0x28]
101f71c1c:     	ldur	q1, [x20, #0xa8]
101f71c20:     	str	q1, [sp, #0x10]
101f71c24:     	ldr	w8, [x20, #0xa8]
101f71c28:     	ldr	x9, [x20, #0x128]
101f71c2c:     	ldr	w10, [x20, #0xb0]
101f71c30:     	ldp	w11, w9, [x9, #0xe0]
101f71c34:     	ldr	s1, [sp, #0x2c]
101f71c38:     	fcvtzs	w12, s1
101f71c3c:     	add	w8, w8, w12
101f71c40:     	ldr	w12, [sp, #0x10]
101f71c44:     	ldr	w13, [sp, #0x18]
101f71c48:     	add	w11, w11, w12
101f71c4c:     	sub	w1, w8, w11
101f71c50:     	fcvtzs	w8, s0
101f71c54:     	add	w8, w10, w8
101f71c58:     	add	w9, w9, w13
101f71c5c:     	sub	w2, w8, w9
101f71c60:     	add	x0, sp, #0x10
101f71c64:     	bl	0x1007fd304 <__Z18BLI_rcti_translateP4rctiii>
101f71c68:     	mov	x0, x21
101f71c6c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f71c70:     	mov	x1, x0
101f71c74:     	add	x4, sp, #0x10
101f71c78:     	mov	x5, sp
101f71c7c:     	mov	x0, x21
101f71c80:     	mov	x2, x19
101f71c84:     	mov	x3, x22
101f71c88:     	bl	0x101624474 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_>
101f71c8c:     	cbz	w0, 0x101f71ce0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2cc>
101f71c90:     	ldr	w8, [sp]
101f71c94:     	ldr	w9, [x22, #0xa8]
101f71c98:     	sub	w8, w8, w9
101f71c9c:     	scvtf	s0, w8
101f71ca0:     	b	0x101f71cec <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2d8>
101f71ca4:     	orr	w8, w8, #0x1
101f71ca8:     	strh	w8, [x20, #0xc4]
101f71cac:     	add	x0, x20, #0xa8
101f71cb0:     	mov	w1, #0x0                ; =0
101f71cb4:     	mov	w2, #0x0                ; =0
101f71cb8:     	mov	w3, #0x0                ; =0
101f71cbc:     	mov	w4, #0x0                ; =0
101f71cc0:     	bl	0x1007fcf78 <__Z13BLI_rcti_initP4rctiiiii>
101f71cc4:     	mov	x0, x20
101f71cc8:     	ldp	x29, x30, [sp, #0x60]
101f71ccc:     	ldp	x20, x19, [sp, #0x50]
101f71cd0:     	ldp	x22, x21, [sp, #0x40]
101f71cd4:     	ldp	x24, x23, [sp, #0x30]
101f71cd8:     	add	sp, sp, #0x70
101f71cdc:     	b	0x101608700 <__Z20ED_region_tag_redrawP7ARegion>
101f71ce0:     	ldr	x8, [x22, #0x128]
101f71ce4:     	ldr	s0, [x8, #0xa0]
101f71ce8:     	scvtf	s0, s0
101f71cec:     	ldr	s1, [sp, #0x2c]
101f71cf0:     	fcmp	s1, s0
101f71cf4:     	fcsel	s0, s0, s1, mi
101f71cf8:     	str	s0, [sp, #0x2c]
101f71cfc:     	ldr	x8, [x20, #0x128]
101f71d00:     	ldr	s1, [x8, #0xe0]
101f71d04:     	scvtf	s2, s1
101f71d08:     	ldr	s1, [sp, #0x28]
101f71d0c:     	fcmp	s0, s2
101f71d10:     	b.ne	0x101f71d24 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x310>
101f71d14:     	ldr	s2, [x8, #0xe4]
101f71d18:     	scvtf	s2, s2
101f71d1c:     	fcmp	s1, s2
101f71d20:     	b.eq	0x101f71a40 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f71d24:     	fcvtzs	w9, s0
101f71d28:     	str	w9, [x8, #0xe0]
101f71d2c:     	fcvtzs	w8, s1
101f71d30:     	ldr	x9, [x20, #0x128]
101f71d34:     	str	w8, [x9, #0xe4]
101f71d38:     	mov	x0, x19
101f71d3c:     	mov	x1, x20
101f71d40:     	bl	0x101609b9c <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f71d44:     	mov	x0, x20
101f71d48:     	bl	0x101608700 <__Z20ED_region_tag_redrawP7ARegion>
101f71d4c:     	b	0x101f71a40 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
