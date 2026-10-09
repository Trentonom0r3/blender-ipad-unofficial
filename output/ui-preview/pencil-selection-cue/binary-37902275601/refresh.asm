
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37902275601\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f6ded4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea>:
101f6ded4:     	sub	sp, sp, #0x70
101f6ded8:     	stp	x24, x23, [sp, #0x30]
101f6dedc:     	stp	x22, x21, [sp, #0x40]
101f6dee0:     	stp	x20, x19, [sp, #0x50]
101f6dee4:     	stp	x29, x30, [sp, #0x60]
101f6dee8:     	add	x29, sp, #0x60
101f6deec:     	mov	x19, x1
101f6def0:     	mov	x21, x0
101f6def4:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f6def8:     	cmp	x0, x19
101f6defc:     	b.eq	0x101f6df18 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x44>
101f6df00:     	ldp	x29, x30, [sp, #0x60]
101f6df04:     	ldp	x20, x19, [sp, #0x50]
101f6df08:     	ldp	x22, x21, [sp, #0x40]
101f6df0c:     	ldp	x24, x23, [sp, #0x30]
101f6df10:     	add	sp, sp, #0x70
101f6df14:     	ret
101f6df18:     	mov	x0, x21
101f6df1c:     	bl	0x101f6dc88 <__Z21UI_ipad_corner_canvasP8bContext>
101f6df20:     	cbz	x0, 0x101f6df00 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6df24:     	mov	x0, x19
101f6df28:     	mov	w1, #0x8                ; =8
101f6df2c:     	bl	0x1003d66c8 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f6df30:     	mov	x22, x0
101f6df34:     	cbz	x0, 0x101f6df7c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xa8>
101f6df38:     	ldrh	w8, [x22, #0xc4]
101f6df3c:     	tbnz	w8, #0x7, 0x101f6df00 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6df40:     	ldr	x0, [x19, #0x58]
101f6df44:     	mov	w1, #0x8                ; =8
101f6df48:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f6df4c:     	mov	x20, x22
101f6df50:     	cbz	x0, 0x101f6df00 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6df54:     	ldr	x23, [x20, #0x120]
101f6df58:     	cbz	x23, 0x101f6dff8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x124>
101f6df5c:     	ldrh	w8, [x20, #0xc4]
101f6df60:     	tbnz	w8, #0x0, 0x101f6e040 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x16c>
101f6df64:     	cbz	x23, 0x101f6e048 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x174>
101f6df68:     	cbz	x22, 0x101f6e048 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x174>
101f6df6c:     	ldr	x8, [x20, #0x128]
101f6df70:     	ldrh	w8, [x8, #0x2b0]
101f6df74:     	cbnz	w8, 0x101f6e088 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x1b4>
101f6df78:     	b	0x101f6e048 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x174>
101f6df7c:     	ldr	x0, [x19, #0x58]
101f6df80:     	mov	w1, #0x8                ; =8
101f6df84:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f6df88:     	cbz	x0, 0x101f6df00 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6df8c:     	mov	x23, x0
101f6df90:     	bl	0x1003d59e4 <__Z19BKE_area_region_newv>
101f6df94:     	mov	x20, x0
101f6df98:     	mov	x0, x19
101f6df9c:     	mov	w1, #0x0                ; =0
101f6dfa0:     	bl	0x1003d66c8 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f6dfa4:     	cbz	x0, 0x101f6dfbc <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xe8>
101f6dfa8:     	mov	x1, x0
101f6dfac:     	add	x0, x19, #0x78
101f6dfb0:     	mov	x2, x20
101f6dfb4:     	bl	0x10079062c <__Z20BLI_insertlinkbeforeP8ListBasePvS1_>
101f6dfb8:     	b	0x101f6dfc8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xf4>
101f6dfbc:     	add	x0, x19, #0x78
101f6dfc0:     	mov	x1, x20
101f6dfc4:     	bl	0x10078fe38 <__Z11BLI_addtailP8ListBasePv>
101f6dfc8:     	mov	w8, #0x8                ; =8
101f6dfcc:     	movk	w8, #0x7, lsl #16
101f6dfd0:     	str	w8, [x20, #0xc0]
101f6dfd4:     	mov	w8, #0x1                ; =1
101f6dfd8:     	strh	w8, [x20, #0xca]
101f6dfdc:     	ldrh	w8, [x20, #0xc4]
101f6dfe0:     	orr	w8, w8, #0x4
101f6dfe4:     	strh	w8, [x20, #0xc4]
101f6dfe8:     	ldr	x8, [x20, #0x128]
101f6dfec:     	str	x23, [x8, #0xb8]
101f6dff0:     	ldr	x23, [x20, #0x120]
101f6dff4:     	cbnz	x23, 0x101f6df5c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x88>
101f6dff8:     	adrp	x8, 0x106633000 <__ZN7blender3gpu5debug3LOGE+0x10>
101f6dffc:     	add	x8, x8, #0x620
101f6e000:     	ldr	x8, [x8]
101f6e004:     	adrp	x3, 0x104d31000 <__ZL3hex+0x1861ed>
101f6e008:     	add	x3, x3, #0xb8c
101f6e00c:     	mov	w24, #0x1               ; =1
101f6e010:     	mov	w0, #0x1                ; =1
101f6e014:     	mov	w1, #0x8                ; =8
101f6e018:     	mov	w2, #0x4                ; =4
101f6e01c:     	blr	x8
101f6e020:     	mov	w8, #0xffff             ; =65535
101f6e024:     	strh	w8, [x0]
101f6e028:     	mov	w8, #-0x1               ; =-1
101f6e02c:     	str	w8, [x0, #0x4]
101f6e030:     	strb	w24, [x0, #0x2]
101f6e034:     	str	x0, [x20, #0x120]
101f6e038:     	ldrh	w8, [x20, #0xc4]
101f6e03c:     	tbz	w8, #0x0, 0x101f6df64 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x90>
101f6e040:     	and	w8, w8, #0xfffe
101f6e044:     	strh	w8, [x20, #0xc4]
101f6e048:     	mov	x0, x19
101f6e04c:     	mov	x1, x20
101f6e050:     	bl	0x10160631c <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f6e054:     	mov	x0, x20
101f6e058:     	bl	0x101604e80 <__Z20ED_region_tag_redrawP7ARegion>
101f6e05c:     	mov	x0, x21
101f6e060:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101f6e064:     	mov	x22, x0
101f6e068:     	mov	x0, x21
101f6e06c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f6e070:     	mov	x1, x0
101f6e074:     	mov	x0, x22
101f6e078:     	mov	x2, x19
101f6e07c:     	bl	0x101607420 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea>
101f6e080:     	mov	x0, x20
101f6e084:     	bl	0x101608274 <__Z23ED_region_floating_initP7ARegion>
101f6e088:     	mov	x0, x21
101f6e08c:     	bl	0x101f6dc88 <__Z21UI_ipad_corner_canvasP8bContext>
101f6e090:     	ldrh	w8, [x20, #0xc4]
101f6e094:     	cbz	x0, 0x101f6e164 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x290>
101f6e098:     	mov	x22, x0
101f6e09c:     	mov	w9, #0x1                ; =1
101f6e0a0:     	bic	w8, w9, w8, lsr #1
101f6e0a4:     	ldr	x9, [x20, #0x128]
101f6e0a8:     	strh	w8, [x9, #0x2b0]
101f6e0ac:     	add	x0, x0, #0x10
101f6e0b0:     	add	x2, sp, #0x2c
101f6e0b4:     	add	x3, sp, #0x28
101f6e0b8:     	mov	w1, #0x1                ; =1
101f6e0bc:     	bl	0x101fbe19c <__Z27UI_view2d_scroller_size_getPK6View2DbPfS2_>
101f6e0c0:     	ldr	x8, [x22, #0x128]
101f6e0c4:     	ldr	s0, [x8, #0xa8]
101f6e0c8:     	scvtf	s0, s0
101f6e0cc:     	ldr	s1, [sp, #0x28]
101f6e0d0:     	fcmp	s1, s0
101f6e0d4:     	fcsel	s0, s0, s1, mi
101f6e0d8:     	str	s0, [sp, #0x28]
101f6e0dc:     	ldur	q1, [x20, #0xa8]
101f6e0e0:     	str	q1, [sp, #0x10]
101f6e0e4:     	ldr	w8, [x20, #0xa8]
101f6e0e8:     	ldr	x9, [x20, #0x128]
101f6e0ec:     	ldr	w10, [x20, #0xb0]
101f6e0f0:     	ldp	w11, w9, [x9, #0xe0]
101f6e0f4:     	ldr	s1, [sp, #0x2c]
101f6e0f8:     	fcvtzs	w12, s1
101f6e0fc:     	add	w8, w8, w12
101f6e100:     	ldr	w12, [sp, #0x10]
101f6e104:     	ldr	w13, [sp, #0x18]
101f6e108:     	add	w11, w11, w12
101f6e10c:     	sub	w1, w8, w11
101f6e110:     	fcvtzs	w8, s0
101f6e114:     	add	w8, w10, w8
101f6e118:     	add	w9, w9, w13
101f6e11c:     	sub	w2, w8, w9
101f6e120:     	add	x0, sp, #0x10
101f6e124:     	bl	0x1007fd304 <__Z18BLI_rcti_translateP4rctiii>
101f6e128:     	mov	x0, x21
101f6e12c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f6e130:     	mov	x1, x0
101f6e134:     	add	x4, sp, #0x10
101f6e138:     	mov	x5, sp
101f6e13c:     	mov	x0, x21
101f6e140:     	mov	x2, x19
101f6e144:     	mov	x3, x22
101f6e148:     	bl	0x101620bc4 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_>
101f6e14c:     	cbz	w0, 0x101f6e1a0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2cc>
101f6e150:     	ldr	w8, [sp]
101f6e154:     	ldr	w9, [x22, #0xa8]
101f6e158:     	sub	w8, w8, w9
101f6e15c:     	scvtf	s0, w8
101f6e160:     	b	0x101f6e1ac <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2d8>
101f6e164:     	orr	w8, w8, #0x1
101f6e168:     	strh	w8, [x20, #0xc4]
101f6e16c:     	add	x0, x20, #0xa8
101f6e170:     	mov	w1, #0x0                ; =0
101f6e174:     	mov	w2, #0x0                ; =0
101f6e178:     	mov	w3, #0x0                ; =0
101f6e17c:     	mov	w4, #0x0                ; =0
101f6e180:     	bl	0x1007fcf78 <__Z13BLI_rcti_initP4rctiiiii>
101f6e184:     	mov	x0, x20
101f6e188:     	ldp	x29, x30, [sp, #0x60]
101f6e18c:     	ldp	x20, x19, [sp, #0x50]
101f6e190:     	ldp	x22, x21, [sp, #0x40]
101f6e194:     	ldp	x24, x23, [sp, #0x30]
101f6e198:     	add	sp, sp, #0x70
101f6e19c:     	b	0x101604e80 <__Z20ED_region_tag_redrawP7ARegion>
101f6e1a0:     	ldr	x8, [x22, #0x128]
101f6e1a4:     	ldr	s0, [x8, #0xa0]
101f6e1a8:     	scvtf	s0, s0
101f6e1ac:     	ldr	s1, [sp, #0x2c]
101f6e1b0:     	fcmp	s1, s0
101f6e1b4:     	fcsel	s0, s0, s1, mi
101f6e1b8:     	str	s0, [sp, #0x2c]
101f6e1bc:     	ldr	x8, [x20, #0x128]
101f6e1c0:     	ldr	s1, [x8, #0xe0]
101f6e1c4:     	scvtf	s2, s1
101f6e1c8:     	ldr	s1, [sp, #0x28]
101f6e1cc:     	fcmp	s0, s2
101f6e1d0:     	b.ne	0x101f6e1e4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x310>
101f6e1d4:     	ldr	s2, [x8, #0xe4]
101f6e1d8:     	scvtf	s2, s2
101f6e1dc:     	fcmp	s1, s2
101f6e1e0:     	b.eq	0x101f6df00 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6e1e4:     	fcvtzs	w9, s0
101f6e1e8:     	str	w9, [x8, #0xe0]
101f6e1ec:     	fcvtzs	w8, s1
101f6e1f0:     	ldr	x9, [x20, #0x128]
101f6e1f4:     	str	w8, [x9, #0xe4]
101f6e1f8:     	mov	x0, x19
101f6e1fc:     	mov	x1, x20
101f6e200:     	bl	0x10160631c <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f6e204:     	mov	x0, x20
101f6e208:     	bl	0x101604e80 <__Z20ED_region_tag_redrawP7ARegion>
101f6e20c:     	b	0x101f6df00 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
