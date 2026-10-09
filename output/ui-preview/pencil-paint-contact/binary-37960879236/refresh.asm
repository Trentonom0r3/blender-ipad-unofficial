
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37960879236\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f6fbbc <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea>:
101f6fbbc:     	sub	sp, sp, #0x70
101f6fbc0:     	stp	x24, x23, [sp, #0x30]
101f6fbc4:     	stp	x22, x21, [sp, #0x40]
101f6fbc8:     	stp	x20, x19, [sp, #0x50]
101f6fbcc:     	stp	x29, x30, [sp, #0x60]
101f6fbd0:     	add	x29, sp, #0x60
101f6fbd4:     	mov	x19, x1
101f6fbd8:     	mov	x21, x0
101f6fbdc:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f6fbe0:     	cmp	x0, x19
101f6fbe4:     	b.eq	0x101f6fc00 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x44>
101f6fbe8:     	ldp	x29, x30, [sp, #0x60]
101f6fbec:     	ldp	x20, x19, [sp, #0x50]
101f6fbf0:     	ldp	x22, x21, [sp, #0x40]
101f6fbf4:     	ldp	x24, x23, [sp, #0x30]
101f6fbf8:     	add	sp, sp, #0x70
101f6fbfc:     	ret
101f6fc00:     	mov	x0, x21
101f6fc04:     	bl	0x101f6f970 <__Z21UI_ipad_corner_canvasP8bContext>
101f6fc08:     	cbz	x0, 0x101f6fbe8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6fc0c:     	mov	x0, x19
101f6fc10:     	mov	w1, #0x8                ; =8
101f6fc14:     	bl	0x1003d66c8 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f6fc18:     	mov	x22, x0
101f6fc1c:     	cbz	x0, 0x101f6fc64 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xa8>
101f6fc20:     	ldrh	w8, [x22, #0xc4]
101f6fc24:     	tbnz	w8, #0x7, 0x101f6fbe8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6fc28:     	ldr	x0, [x19, #0x58]
101f6fc2c:     	mov	w1, #0x8                ; =8
101f6fc30:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f6fc34:     	mov	x20, x22
101f6fc38:     	cbz	x0, 0x101f6fbe8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6fc3c:     	ldr	x23, [x20, #0x120]
101f6fc40:     	cbz	x23, 0x101f6fce0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x124>
101f6fc44:     	ldrh	w8, [x20, #0xc4]
101f6fc48:     	tbnz	w8, #0x0, 0x101f6fd28 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x16c>
101f6fc4c:     	cbz	x23, 0x101f6fd30 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x174>
101f6fc50:     	cbz	x22, 0x101f6fd30 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x174>
101f6fc54:     	ldr	x8, [x20, #0x128]
101f6fc58:     	ldrh	w8, [x8, #0x2b0]
101f6fc5c:     	cbnz	w8, 0x101f6fd70 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x1b4>
101f6fc60:     	b	0x101f6fd30 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x174>
101f6fc64:     	ldr	x0, [x19, #0x58]
101f6fc68:     	mov	w1, #0x8                ; =8
101f6fc6c:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f6fc70:     	cbz	x0, 0x101f6fbe8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6fc74:     	mov	x23, x0
101f6fc78:     	bl	0x1003d59e4 <__Z19BKE_area_region_newv>
101f6fc7c:     	mov	x20, x0
101f6fc80:     	mov	x0, x19
101f6fc84:     	mov	w1, #0x0                ; =0
101f6fc88:     	bl	0x1003d66c8 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f6fc8c:     	cbz	x0, 0x101f6fca4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xe8>
101f6fc90:     	mov	x1, x0
101f6fc94:     	add	x0, x19, #0x78
101f6fc98:     	mov	x2, x20
101f6fc9c:     	bl	0x10079062c <__Z20BLI_insertlinkbeforeP8ListBasePvS1_>
101f6fca0:     	b	0x101f6fcb0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xf4>
101f6fca4:     	add	x0, x19, #0x78
101f6fca8:     	mov	x1, x20
101f6fcac:     	bl	0x10078fe38 <__Z11BLI_addtailP8ListBasePv>
101f6fcb0:     	mov	w8, #0x8                ; =8
101f6fcb4:     	movk	w8, #0x7, lsl #16
101f6fcb8:     	str	w8, [x20, #0xc0]
101f6fcbc:     	mov	w8, #0x1                ; =1
101f6fcc0:     	strh	w8, [x20, #0xca]
101f6fcc4:     	ldrh	w8, [x20, #0xc4]
101f6fcc8:     	orr	w8, w8, #0x4
101f6fccc:     	strh	w8, [x20, #0xc4]
101f6fcd0:     	ldr	x8, [x20, #0x128]
101f6fcd4:     	str	x23, [x8, #0xb8]
101f6fcd8:     	ldr	x23, [x20, #0x120]
101f6fcdc:     	cbnz	x23, 0x101f6fc44 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x88>
101f6fce0:     	adrp	x8, 0x106633000 <__ZL14processor_lock+0x28>
101f6fce4:     	add	x8, x8, #0x560
101f6fce8:     	ldr	x8, [x8]
101f6fcec:     	adrp	x3, 0x104d33000 <__ZL3hex+0x186515>
101f6fcf0:     	add	x3, x3, #0x864
101f6fcf4:     	mov	w24, #0x1               ; =1
101f6fcf8:     	mov	w0, #0x1                ; =1
101f6fcfc:     	mov	w1, #0x8                ; =8
101f6fd00:     	mov	w2, #0x4                ; =4
101f6fd04:     	blr	x8
101f6fd08:     	mov	w8, #0xffff             ; =65535
101f6fd0c:     	strh	w8, [x0]
101f6fd10:     	mov	w8, #-0x1               ; =-1
101f6fd14:     	str	w8, [x0, #0x4]
101f6fd18:     	strb	w24, [x0, #0x2]
101f6fd1c:     	str	x0, [x20, #0x120]
101f6fd20:     	ldrh	w8, [x20, #0xc4]
101f6fd24:     	tbz	w8, #0x0, 0x101f6fc4c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x90>
101f6fd28:     	and	w8, w8, #0xfffe
101f6fd2c:     	strh	w8, [x20, #0xc4]
101f6fd30:     	mov	x0, x19
101f6fd34:     	mov	x1, x20
101f6fd38:     	bl	0x101608064 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f6fd3c:     	mov	x0, x20
101f6fd40:     	bl	0x101606bc8 <__Z20ED_region_tag_redrawP7ARegion>
101f6fd44:     	mov	x0, x21
101f6fd48:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101f6fd4c:     	mov	x22, x0
101f6fd50:     	mov	x0, x21
101f6fd54:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f6fd58:     	mov	x1, x0
101f6fd5c:     	mov	x0, x22
101f6fd60:     	mov	x2, x19
101f6fd64:     	bl	0x101609168 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea>
101f6fd68:     	mov	x0, x20
101f6fd6c:     	bl	0x101609fbc <__Z23ED_region_floating_initP7ARegion>
101f6fd70:     	mov	x0, x21
101f6fd74:     	bl	0x101f6f970 <__Z21UI_ipad_corner_canvasP8bContext>
101f6fd78:     	ldrh	w8, [x20, #0xc4]
101f6fd7c:     	cbz	x0, 0x101f6fe4c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x290>
101f6fd80:     	mov	x22, x0
101f6fd84:     	mov	w9, #0x1                ; =1
101f6fd88:     	bic	w8, w9, w8, lsr #1
101f6fd8c:     	ldr	x9, [x20, #0x128]
101f6fd90:     	strh	w8, [x9, #0x2b0]
101f6fd94:     	add	x0, x0, #0x10
101f6fd98:     	add	x2, sp, #0x2c
101f6fd9c:     	add	x3, sp, #0x28
101f6fda0:     	mov	w1, #0x1                ; =1
101f6fda4:     	bl	0x101fbfe84 <__Z27UI_view2d_scroller_size_getPK6View2DbPfS2_>
101f6fda8:     	ldr	x8, [x22, #0x128]
101f6fdac:     	ldr	s0, [x8, #0xa8]
101f6fdb0:     	scvtf	s0, s0
101f6fdb4:     	ldr	s1, [sp, #0x28]
101f6fdb8:     	fcmp	s1, s0
101f6fdbc:     	fcsel	s0, s0, s1, mi
101f6fdc0:     	str	s0, [sp, #0x28]
101f6fdc4:     	ldur	q1, [x20, #0xa8]
101f6fdc8:     	str	q1, [sp, #0x10]
101f6fdcc:     	ldr	w8, [x20, #0xa8]
101f6fdd0:     	ldr	x9, [x20, #0x128]
101f6fdd4:     	ldr	w10, [x20, #0xb0]
101f6fdd8:     	ldp	w11, w9, [x9, #0xe0]
101f6fddc:     	ldr	s1, [sp, #0x2c]
101f6fde0:     	fcvtzs	w12, s1
101f6fde4:     	add	w8, w8, w12
101f6fde8:     	ldr	w12, [sp, #0x10]
101f6fdec:     	ldr	w13, [sp, #0x18]
101f6fdf0:     	add	w11, w11, w12
101f6fdf4:     	sub	w1, w8, w11
101f6fdf8:     	fcvtzs	w8, s0
101f6fdfc:     	add	w8, w10, w8
101f6fe00:     	add	w9, w9, w13
101f6fe04:     	sub	w2, w8, w9
101f6fe08:     	add	x0, sp, #0x10
101f6fe0c:     	bl	0x1007fd304 <__Z18BLI_rcti_translateP4rctiii>
101f6fe10:     	mov	x0, x21
101f6fe14:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f6fe18:     	mov	x1, x0
101f6fe1c:     	add	x4, sp, #0x10
101f6fe20:     	mov	x5, sp
101f6fe24:     	mov	x0, x21
101f6fe28:     	mov	x2, x19
101f6fe2c:     	mov	x3, x22
101f6fe30:     	bl	0x10162290c <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_>
101f6fe34:     	cbz	w0, 0x101f6fe88 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2cc>
101f6fe38:     	ldr	w8, [sp]
101f6fe3c:     	ldr	w9, [x22, #0xa8]
101f6fe40:     	sub	w8, w8, w9
101f6fe44:     	scvtf	s0, w8
101f6fe48:     	b	0x101f6fe94 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2d8>
101f6fe4c:     	orr	w8, w8, #0x1
101f6fe50:     	strh	w8, [x20, #0xc4]
101f6fe54:     	add	x0, x20, #0xa8
101f6fe58:     	mov	w1, #0x0                ; =0
101f6fe5c:     	mov	w2, #0x0                ; =0
101f6fe60:     	mov	w3, #0x0                ; =0
101f6fe64:     	mov	w4, #0x0                ; =0
101f6fe68:     	bl	0x1007fcf78 <__Z13BLI_rcti_initP4rctiiiii>
101f6fe6c:     	mov	x0, x20
101f6fe70:     	ldp	x29, x30, [sp, #0x60]
101f6fe74:     	ldp	x20, x19, [sp, #0x50]
101f6fe78:     	ldp	x22, x21, [sp, #0x40]
101f6fe7c:     	ldp	x24, x23, [sp, #0x30]
101f6fe80:     	add	sp, sp, #0x70
101f6fe84:     	b	0x101606bc8 <__Z20ED_region_tag_redrawP7ARegion>
101f6fe88:     	ldr	x8, [x22, #0x128]
101f6fe8c:     	ldr	s0, [x8, #0xa0]
101f6fe90:     	scvtf	s0, s0
101f6fe94:     	ldr	s1, [sp, #0x2c]
101f6fe98:     	fcmp	s1, s0
101f6fe9c:     	fcsel	s0, s0, s1, mi
101f6fea0:     	str	s0, [sp, #0x2c]
101f6fea4:     	ldr	x8, [x20, #0x128]
101f6fea8:     	ldr	s1, [x8, #0xe0]
101f6feac:     	scvtf	s2, s1
101f6feb0:     	ldr	s1, [sp, #0x28]
101f6feb4:     	fcmp	s0, s2
101f6feb8:     	b.ne	0x101f6fecc <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x310>
101f6febc:     	ldr	s2, [x8, #0xe4]
101f6fec0:     	scvtf	s2, s2
101f6fec4:     	fcmp	s1, s2
101f6fec8:     	b.eq	0x101f6fbe8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6fecc:     	fcvtzs	w9, s0
101f6fed0:     	str	w9, [x8, #0xe0]
101f6fed4:     	fcvtzs	w8, s1
101f6fed8:     	ldr	x9, [x20, #0x128]
101f6fedc:     	str	w8, [x9, #0xe4]
101f6fee0:     	mov	x0, x19
101f6fee4:     	mov	x1, x20
101f6fee8:     	bl	0x101608064 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f6feec:     	mov	x0, x20
101f6fef0:     	bl	0x101606bc8 <__Z20ED_region_tag_redrawP7ARegion>
101f6fef4:     	b	0x101f6fbe8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
