
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37818071469\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f6ca1c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea>:
101f6ca1c:     	sub	sp, sp, #0x50
101f6ca20:     	stp	x24, x23, [sp, #0x10]
101f6ca24:     	stp	x22, x21, [sp, #0x20]
101f6ca28:     	stp	x20, x19, [sp, #0x30]
101f6ca2c:     	stp	x29, x30, [sp, #0x40]
101f6ca30:     	add	x29, sp, #0x40
101f6ca34:     	mov	x21, x1
101f6ca38:     	mov	x19, x0
101f6ca3c:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f6ca40:     	cmp	x0, x21
101f6ca44:     	b.eq	0x101f6ca60 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x44>
101f6ca48:     	ldp	x29, x30, [sp, #0x40]
101f6ca4c:     	ldp	x20, x19, [sp, #0x30]
101f6ca50:     	ldp	x22, x21, [sp, #0x20]
101f6ca54:     	ldp	x24, x23, [sp, #0x10]
101f6ca58:     	add	sp, sp, #0x50
101f6ca5c:     	ret
101f6ca60:     	mov	x0, x19
101f6ca64:     	bl	0x101f6c7d0 <__Z21UI_ipad_corner_canvasP8bContext>
101f6ca68:     	cbz	x0, 0x101f6ca48 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6ca6c:     	mov	x19, x0
101f6ca70:     	mov	x0, x21
101f6ca74:     	mov	w1, #0x8                ; =8
101f6ca78:     	bl	0x1003d66c8 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f6ca7c:     	mov	x22, x0
101f6ca80:     	cbz	x0, 0x101f6cac8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xac>
101f6ca84:     	ldrh	w8, [x22, #0xc4]
101f6ca88:     	tbnz	w8, #0x7, 0x101f6ca48 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6ca8c:     	ldr	x0, [x21, #0x58]
101f6ca90:     	mov	w1, #0x8                ; =8
101f6ca94:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f6ca98:     	mov	x20, x22
101f6ca9c:     	cbz	x0, 0x101f6ca48 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6caa0:     	ldr	x23, [x20, #0x120]
101f6caa4:     	cbz	x23, 0x101f6cb44 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x128>
101f6caa8:     	ldrh	w8, [x20, #0xc4]
101f6caac:     	tbnz	w8, #0x0, 0x101f6cb8c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x170>
101f6cab0:     	cbz	x23, 0x101f6cb94 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x178>
101f6cab4:     	cbz	x22, 0x101f6cb94 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x178>
101f6cab8:     	ldr	x9, [x20, #0x128]
101f6cabc:     	ldrh	w10, [x9, #0x2b0]
101f6cac0:     	cbnz	w10, 0x101f6cbb8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x19c>
101f6cac4:     	b	0x101f6cb94 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x178>
101f6cac8:     	ldr	x0, [x21, #0x58]
101f6cacc:     	mov	w1, #0x8                ; =8
101f6cad0:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f6cad4:     	cbz	x0, 0x101f6ca48 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6cad8:     	mov	x23, x0
101f6cadc:     	bl	0x1003d59e4 <__Z19BKE_area_region_newv>
101f6cae0:     	mov	x20, x0
101f6cae4:     	mov	x0, x21
101f6cae8:     	mov	w1, #0x0                ; =0
101f6caec:     	bl	0x1003d66c8 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f6caf0:     	cbz	x0, 0x101f6cb08 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xec>
101f6caf4:     	mov	x1, x0
101f6caf8:     	add	x0, x21, #0x78
101f6cafc:     	mov	x2, x20
101f6cb00:     	bl	0x10079062c <__Z20BLI_insertlinkbeforeP8ListBasePvS1_>
101f6cb04:     	b	0x101f6cb14 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xf8>
101f6cb08:     	add	x0, x21, #0x78
101f6cb0c:     	mov	x1, x20
101f6cb10:     	bl	0x10078fe38 <__Z11BLI_addtailP8ListBasePv>
101f6cb14:     	mov	w8, #0x8                ; =8
101f6cb18:     	movk	w8, #0x7, lsl #16
101f6cb1c:     	str	w8, [x20, #0xc0]
101f6cb20:     	mov	w8, #0x1                ; =1
101f6cb24:     	strh	w8, [x20, #0xca]
101f6cb28:     	ldrh	w8, [x20, #0xc4]
101f6cb2c:     	orr	w8, w8, #0x4
101f6cb30:     	strh	w8, [x20, #0xc4]
101f6cb34:     	ldr	x8, [x20, #0x128]
101f6cb38:     	str	x23, [x8, #0xb8]
101f6cb3c:     	ldr	x23, [x20, #0x120]
101f6cb40:     	cbnz	x23, 0x101f6caa8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x8c>
101f6cb44:     	adrp	x8, 0x106633000 <__ZN7blender3gpu5debug3LOGE+0x10>
101f6cb48:     	add	x8, x8, #0x620
101f6cb4c:     	ldr	x8, [x8]
101f6cb50:     	adrp	x3, 0x104d30000 <__ZL3hex+0x1867ad>
101f6cb54:     	add	x3, x3, #0x57c
101f6cb58:     	mov	w24, #0x1               ; =1
101f6cb5c:     	mov	w0, #0x1                ; =1
101f6cb60:     	mov	w1, #0x8                ; =8
101f6cb64:     	mov	w2, #0x4                ; =4
101f6cb68:     	blr	x8
101f6cb6c:     	mov	w8, #0xffff             ; =65535
101f6cb70:     	strh	w8, [x0]
101f6cb74:     	mov	w8, #-0x1               ; =-1
101f6cb78:     	str	w8, [x0, #0x4]
101f6cb7c:     	strb	w24, [x0, #0x2]
101f6cb80:     	str	x0, [x20, #0x120]
101f6cb84:     	ldrh	w8, [x20, #0xc4]
101f6cb88:     	tbz	w8, #0x0, 0x101f6cab0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x94>
101f6cb8c:     	and	w8, w8, #0xfffe
101f6cb90:     	strh	w8, [x20, #0xc4]
101f6cb94:     	mov	x0, x21
101f6cb98:     	mov	x1, x20
101f6cb9c:     	bl	0x101605d8c <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f6cba0:     	mov	x0, x20
101f6cba4:     	bl	0x1016048f0 <__Z20ED_region_tag_redrawP7ARegion>
101f6cba8:     	mov	x0, x20
101f6cbac:     	bl	0x101607ce4 <__Z23ED_region_floating_initP7ARegion>
101f6cbb0:     	ldrh	w8, [x20, #0xc4]
101f6cbb4:     	ldr	x9, [x20, #0x128]
101f6cbb8:     	mov	w10, #0x1               ; =1
101f6cbbc:     	bic	w8, w10, w8, lsr #1
101f6cbc0:     	strh	w8, [x9, #0x2b0]
101f6cbc4:     	add	x0, x19, #0x10
101f6cbc8:     	add	x2, sp, #0xc
101f6cbcc:     	add	x3, sp, #0x8
101f6cbd0:     	mov	w1, #0x1                ; =1
101f6cbd4:     	bl	0x101fbcbf0 <__Z27UI_view2d_scroller_size_getPK6View2DbPfS2_>
101f6cbd8:     	ldr	x8, [x19, #0x128]
101f6cbdc:     	ldr	s0, [x8, #0xa0]
101f6cbe0:     	scvtf	s0, s0
101f6cbe4:     	ldp	s1, s2, [sp, #0x8]
101f6cbe8:     	fcmp	s2, s0
101f6cbec:     	fcsel	s0, s0, s2, mi
101f6cbf0:     	fcvtzs	w8, s0
101f6cbf4:     	ldr	x9, [x20, #0x128]
101f6cbf8:     	str	w8, [x9, #0xe0]
101f6cbfc:     	ldr	x8, [x19, #0x128]
101f6cc00:     	ldr	s0, [x8, #0xa8]
101f6cc04:     	scvtf	s0, s0
101f6cc08:     	fcmp	s1, s0
101f6cc0c:     	fcsel	s0, s0, s1, mi
101f6cc10:     	fcvtzs	w8, s0
101f6cc14:     	ldr	x9, [x20, #0x128]
101f6cc18:     	str	w8, [x9, #0xe4]
101f6cc1c:     	b	0x101f6ca48 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
