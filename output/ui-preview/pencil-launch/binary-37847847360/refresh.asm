
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37847847360\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f6ca1c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea>:
101f6ca1c:     	sub	sp, sp, #0x50
101f6ca20:     	stp	x24, x23, [sp, #0x10]
101f6ca24:     	stp	x22, x21, [sp, #0x20]
101f6ca28:     	stp	x20, x19, [sp, #0x30]
101f6ca2c:     	stp	x29, x30, [sp, #0x40]
101f6ca30:     	add	x29, sp, #0x40
101f6ca34:     	mov	x19, x1
101f6ca38:     	mov	x21, x0
101f6ca3c:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f6ca40:     	cmp	x0, x19
101f6ca44:     	b.eq	0x101f6ca60 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x44>
101f6ca48:     	ldp	x29, x30, [sp, #0x40]
101f6ca4c:     	ldp	x20, x19, [sp, #0x30]
101f6ca50:     	ldp	x22, x21, [sp, #0x20]
101f6ca54:     	ldp	x24, x23, [sp, #0x10]
101f6ca58:     	add	sp, sp, #0x50
101f6ca5c:     	ret
101f6ca60:     	mov	x0, x21
101f6ca64:     	bl	0x101f6c7d0 <__Z21UI_ipad_corner_canvasP8bContext>
101f6ca68:     	cbz	x0, 0x101f6ca48 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6ca6c:     	mov	x0, x19
101f6ca70:     	mov	w1, #0x8                ; =8
101f6ca74:     	bl	0x1003d66c8 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f6ca78:     	mov	x22, x0
101f6ca7c:     	cbz	x0, 0x101f6cac4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xa8>
101f6ca80:     	ldrh	w8, [x22, #0xc4]
101f6ca84:     	tbnz	w8, #0x7, 0x101f6ca48 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6ca88:     	ldr	x0, [x19, #0x58]
101f6ca8c:     	mov	w1, #0x8                ; =8
101f6ca90:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f6ca94:     	mov	x20, x22
101f6ca98:     	cbz	x0, 0x101f6ca48 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6ca9c:     	ldr	x23, [x20, #0x120]
101f6caa0:     	cbz	x23, 0x101f6cb40 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x124>
101f6caa4:     	ldrh	w8, [x20, #0xc4]
101f6caa8:     	tbnz	w8, #0x0, 0x101f6cb88 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x16c>
101f6caac:     	cbz	x23, 0x101f6cb90 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x174>
101f6cab0:     	cbz	x22, 0x101f6cb90 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x174>
101f6cab4:     	ldr	x8, [x20, #0x128]
101f6cab8:     	ldrh	w8, [x8, #0x2b0]
101f6cabc:     	cbnz	w8, 0x101f6cbd0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x1b4>
101f6cac0:     	b	0x101f6cb90 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x174>
101f6cac4:     	ldr	x0, [x19, #0x58]
101f6cac8:     	mov	w1, #0x8                ; =8
101f6cacc:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f6cad0:     	cbz	x0, 0x101f6ca48 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6cad4:     	mov	x23, x0
101f6cad8:     	bl	0x1003d59e4 <__Z19BKE_area_region_newv>
101f6cadc:     	mov	x20, x0
101f6cae0:     	mov	x0, x19
101f6cae4:     	mov	w1, #0x0                ; =0
101f6cae8:     	bl	0x1003d66c8 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f6caec:     	cbz	x0, 0x101f6cb04 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xe8>
101f6caf0:     	mov	x1, x0
101f6caf4:     	add	x0, x19, #0x78
101f6caf8:     	mov	x2, x20
101f6cafc:     	bl	0x10079062c <__Z20BLI_insertlinkbeforeP8ListBasePvS1_>
101f6cb00:     	b	0x101f6cb10 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xf4>
101f6cb04:     	add	x0, x19, #0x78
101f6cb08:     	mov	x1, x20
101f6cb0c:     	bl	0x10078fe38 <__Z11BLI_addtailP8ListBasePv>
101f6cb10:     	mov	w8, #0x8                ; =8
101f6cb14:     	movk	w8, #0x7, lsl #16
101f6cb18:     	str	w8, [x20, #0xc0]
101f6cb1c:     	mov	w8, #0x1                ; =1
101f6cb20:     	strh	w8, [x20, #0xca]
101f6cb24:     	ldrh	w8, [x20, #0xc4]
101f6cb28:     	orr	w8, w8, #0x4
101f6cb2c:     	strh	w8, [x20, #0xc4]
101f6cb30:     	ldr	x8, [x20, #0x128]
101f6cb34:     	str	x23, [x8, #0xb8]
101f6cb38:     	ldr	x23, [x20, #0x120]
101f6cb3c:     	cbnz	x23, 0x101f6caa4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x88>
101f6cb40:     	adrp	x8, 0x106633000 <__ZN7blender3gpu5debug3LOGE+0x10>
101f6cb44:     	add	x8, x8, #0x620
101f6cb48:     	ldr	x8, [x8]
101f6cb4c:     	adrp	x3, 0x104d30000 <__ZL3hex+0x18670d>
101f6cb50:     	add	x3, x3, #0x61c
101f6cb54:     	mov	w24, #0x1               ; =1
101f6cb58:     	mov	w0, #0x1                ; =1
101f6cb5c:     	mov	w1, #0x8                ; =8
101f6cb60:     	mov	w2, #0x4                ; =4
101f6cb64:     	blr	x8
101f6cb68:     	mov	w8, #0xffff             ; =65535
101f6cb6c:     	strh	w8, [x0]
101f6cb70:     	mov	w8, #-0x1               ; =-1
101f6cb74:     	str	w8, [x0, #0x4]
101f6cb78:     	strb	w24, [x0, #0x2]
101f6cb7c:     	str	x0, [x20, #0x120]
101f6cb80:     	ldrh	w8, [x20, #0xc4]
101f6cb84:     	tbz	w8, #0x0, 0x101f6caac <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x90>
101f6cb88:     	and	w8, w8, #0xfffe
101f6cb8c:     	strh	w8, [x20, #0xc4]
101f6cb90:     	mov	x0, x19
101f6cb94:     	mov	x1, x20
101f6cb98:     	bl	0x101605d8c <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f6cb9c:     	mov	x0, x20
101f6cba0:     	bl	0x1016048f0 <__Z20ED_region_tag_redrawP7ARegion>
101f6cba4:     	mov	x0, x21
101f6cba8:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101f6cbac:     	mov	x22, x0
101f6cbb0:     	mov	x0, x21
101f6cbb4:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f6cbb8:     	mov	x1, x0
101f6cbbc:     	mov	x0, x22
101f6cbc0:     	mov	x2, x19
101f6cbc4:     	bl	0x101606e90 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea>
101f6cbc8:     	mov	x0, x20
101f6cbcc:     	bl	0x101607ce4 <__Z23ED_region_floating_initP7ARegion>
101f6cbd0:     	mov	x0, x21
101f6cbd4:     	bl	0x101f6c7d0 <__Z21UI_ipad_corner_canvasP8bContext>
101f6cbd8:     	ldrh	w8, [x20, #0xc4]
101f6cbdc:     	cbz	x0, 0x101f6cc84 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x268>
101f6cbe0:     	mov	w9, #0x1                ; =1
101f6cbe4:     	bic	w8, w9, w8, lsr #1
101f6cbe8:     	ldr	x9, [x20, #0x128]
101f6cbec:     	strh	w8, [x9, #0x2b0]
101f6cbf0:     	mov	x21, x0
101f6cbf4:     	add	x0, x0, #0x10
101f6cbf8:     	add	x2, sp, #0xc
101f6cbfc:     	add	x3, sp, #0x8
101f6cc00:     	mov	w1, #0x1                ; =1
101f6cc04:     	bl	0x101fbcc90 <__Z27UI_view2d_scroller_size_getPK6View2DbPfS2_>
101f6cc08:     	ldr	x8, [x21, #0x128]
101f6cc0c:     	ldr	s0, [x8, #0xa0]
101f6cc10:     	scvtf	s0, s0
101f6cc14:     	ldp	s2, s1, [sp, #0x8]
101f6cc18:     	fcmp	s1, s0
101f6cc1c:     	fcsel	s0, s0, s1, mi
101f6cc20:     	ldr	s1, [x8, #0xa8]
101f6cc24:     	scvtf	s1, s1
101f6cc28:     	fcmp	s2, s1
101f6cc2c:     	fcsel	s1, s1, s2, mi
101f6cc30:     	stp	s1, s0, [sp, #0x8]
101f6cc34:     	ldr	x8, [x20, #0x128]
101f6cc38:     	ldr	s2, [x8, #0xe0]
101f6cc3c:     	scvtf	s2, s2
101f6cc40:     	fcmp	s0, s2
101f6cc44:     	b.ne	0x101f6cc58 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x23c>
101f6cc48:     	ldr	s2, [x8, #0xe4]
101f6cc4c:     	scvtf	s2, s2
101f6cc50:     	fcmp	s1, s2
101f6cc54:     	b.eq	0x101f6ca48 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6cc58:     	fcvtzs	w9, s0
101f6cc5c:     	str	w9, [x8, #0xe0]
101f6cc60:     	fcvtzs	w8, s1
101f6cc64:     	ldr	x9, [x20, #0x128]
101f6cc68:     	str	w8, [x9, #0xe4]
101f6cc6c:     	mov	x0, x19
101f6cc70:     	mov	x1, x20
101f6cc74:     	bl	0x101605d8c <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f6cc78:     	mov	x0, x20
101f6cc7c:     	bl	0x1016048f0 <__Z20ED_region_tag_redrawP7ARegion>
101f6cc80:     	b	0x101f6ca48 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6cc84:     	orr	w8, w8, #0x1
101f6cc88:     	strh	w8, [x20, #0xc4]
101f6cc8c:     	add	x0, x20, #0xa8
101f6cc90:     	mov	w1, #0x0                ; =0
101f6cc94:     	mov	w2, #0x0                ; =0
101f6cc98:     	mov	w3, #0x0                ; =0
101f6cc9c:     	mov	w4, #0x0                ; =0
101f6cca0:     	bl	0x1007fcf78 <__Z13BLI_rcti_initP4rctiiiii>
101f6cca4:     	mov	x0, x20
101f6cca8:     	ldp	x29, x30, [sp, #0x40]
101f6ccac:     	ldp	x20, x19, [sp, #0x30]
101f6ccb0:     	ldp	x22, x21, [sp, #0x20]
101f6ccb4:     	ldp	x24, x23, [sp, #0x10]
101f6ccb8:     	add	sp, sp, #0x50
101f6ccbc:     	b	0x1016048f0 <__Z20ED_region_tag_redrawP7ARegion>
