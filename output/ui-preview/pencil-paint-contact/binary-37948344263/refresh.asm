
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37948344263\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f6de74 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea>:
101f6de74:     	sub	sp, sp, #0x70
101f6de78:     	stp	x24, x23, [sp, #0x30]
101f6de7c:     	stp	x22, x21, [sp, #0x40]
101f6de80:     	stp	x20, x19, [sp, #0x50]
101f6de84:     	stp	x29, x30, [sp, #0x60]
101f6de88:     	add	x29, sp, #0x60
101f6de8c:     	mov	x19, x1
101f6de90:     	mov	x21, x0
101f6de94:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f6de98:     	cmp	x0, x19
101f6de9c:     	b.eq	0x101f6deb8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x44>
101f6dea0:     	ldp	x29, x30, [sp, #0x60]
101f6dea4:     	ldp	x20, x19, [sp, #0x50]
101f6dea8:     	ldp	x22, x21, [sp, #0x40]
101f6deac:     	ldp	x24, x23, [sp, #0x30]
101f6deb0:     	add	sp, sp, #0x70
101f6deb4:     	ret
101f6deb8:     	mov	x0, x21
101f6debc:     	bl	0x101f6dc28 <__Z21UI_ipad_corner_canvasP8bContext>
101f6dec0:     	cbz	x0, 0x101f6dea0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6dec4:     	mov	x0, x19
101f6dec8:     	mov	w1, #0x8                ; =8
101f6decc:     	bl	0x1003d66c8 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f6ded0:     	mov	x22, x0
101f6ded4:     	cbz	x0, 0x101f6df1c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xa8>
101f6ded8:     	ldrh	w8, [x22, #0xc4]
101f6dedc:     	tbnz	w8, #0x7, 0x101f6dea0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6dee0:     	ldr	x0, [x19, #0x58]
101f6dee4:     	mov	w1, #0x8                ; =8
101f6dee8:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f6deec:     	mov	x20, x22
101f6def0:     	cbz	x0, 0x101f6dea0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6def4:     	ldr	x23, [x20, #0x120]
101f6def8:     	cbz	x23, 0x101f6df98 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x124>
101f6defc:     	ldrh	w8, [x20, #0xc4]
101f6df00:     	tbnz	w8, #0x0, 0x101f6dfe0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x16c>
101f6df04:     	cbz	x23, 0x101f6dfe8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x174>
101f6df08:     	cbz	x22, 0x101f6dfe8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x174>
101f6df0c:     	ldr	x8, [x20, #0x128]
101f6df10:     	ldrh	w8, [x8, #0x2b0]
101f6df14:     	cbnz	w8, 0x101f6e028 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x1b4>
101f6df18:     	b	0x101f6dfe8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x174>
101f6df1c:     	ldr	x0, [x19, #0x58]
101f6df20:     	mov	w1, #0x8                ; =8
101f6df24:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f6df28:     	cbz	x0, 0x101f6dea0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6df2c:     	mov	x23, x0
101f6df30:     	bl	0x1003d59e4 <__Z19BKE_area_region_newv>
101f6df34:     	mov	x20, x0
101f6df38:     	mov	x0, x19
101f6df3c:     	mov	w1, #0x0                ; =0
101f6df40:     	bl	0x1003d66c8 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f6df44:     	cbz	x0, 0x101f6df5c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xe8>
101f6df48:     	mov	x1, x0
101f6df4c:     	add	x0, x19, #0x78
101f6df50:     	mov	x2, x20
101f6df54:     	bl	0x10079062c <__Z20BLI_insertlinkbeforeP8ListBasePvS1_>
101f6df58:     	b	0x101f6df68 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xf4>
101f6df5c:     	add	x0, x19, #0x78
101f6df60:     	mov	x1, x20
101f6df64:     	bl	0x10078fe38 <__Z11BLI_addtailP8ListBasePv>
101f6df68:     	mov	w8, #0x8                ; =8
101f6df6c:     	movk	w8, #0x7, lsl #16
101f6df70:     	str	w8, [x20, #0xc0]
101f6df74:     	mov	w8, #0x1                ; =1
101f6df78:     	strh	w8, [x20, #0xca]
101f6df7c:     	ldrh	w8, [x20, #0xc4]
101f6df80:     	orr	w8, w8, #0x4
101f6df84:     	strh	w8, [x20, #0xc4]
101f6df88:     	ldr	x8, [x20, #0x128]
101f6df8c:     	str	x23, [x8, #0xb8]
101f6df90:     	ldr	x23, [x20, #0x120]
101f6df94:     	cbnz	x23, 0x101f6defc <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x88>
101f6df98:     	adrp	x8, 0x106633000 <__ZN7blender3gpu5debug3LOGE+0x10>
101f6df9c:     	add	x8, x8, #0x620
101f6dfa0:     	ldr	x8, [x8]
101f6dfa4:     	adrp	x3, 0x104d31000 <__ZL3hex+0x18624d>
101f6dfa8:     	add	x3, x3, #0xb2c
101f6dfac:     	mov	w24, #0x1               ; =1
101f6dfb0:     	mov	w0, #0x1                ; =1
101f6dfb4:     	mov	w1, #0x8                ; =8
101f6dfb8:     	mov	w2, #0x4                ; =4
101f6dfbc:     	blr	x8
101f6dfc0:     	mov	w8, #0xffff             ; =65535
101f6dfc4:     	strh	w8, [x0]
101f6dfc8:     	mov	w8, #-0x1               ; =-1
101f6dfcc:     	str	w8, [x0, #0x4]
101f6dfd0:     	strb	w24, [x0, #0x2]
101f6dfd4:     	str	x0, [x20, #0x120]
101f6dfd8:     	ldrh	w8, [x20, #0xc4]
101f6dfdc:     	tbz	w8, #0x0, 0x101f6df04 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x90>
101f6dfe0:     	and	w8, w8, #0xfffe
101f6dfe4:     	strh	w8, [x20, #0xc4]
101f6dfe8:     	mov	x0, x19
101f6dfec:     	mov	x1, x20
101f6dff0:     	bl	0x10160631c <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f6dff4:     	mov	x0, x20
101f6dff8:     	bl	0x101604e80 <__Z20ED_region_tag_redrawP7ARegion>
101f6dffc:     	mov	x0, x21
101f6e000:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101f6e004:     	mov	x22, x0
101f6e008:     	mov	x0, x21
101f6e00c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f6e010:     	mov	x1, x0
101f6e014:     	mov	x0, x22
101f6e018:     	mov	x2, x19
101f6e01c:     	bl	0x101607420 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea>
101f6e020:     	mov	x0, x20
101f6e024:     	bl	0x101608274 <__Z23ED_region_floating_initP7ARegion>
101f6e028:     	mov	x0, x21
101f6e02c:     	bl	0x101f6dc28 <__Z21UI_ipad_corner_canvasP8bContext>
101f6e030:     	ldrh	w8, [x20, #0xc4]
101f6e034:     	cbz	x0, 0x101f6e104 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x290>
101f6e038:     	mov	x22, x0
101f6e03c:     	mov	w9, #0x1                ; =1
101f6e040:     	bic	w8, w9, w8, lsr #1
101f6e044:     	ldr	x9, [x20, #0x128]
101f6e048:     	strh	w8, [x9, #0x2b0]
101f6e04c:     	add	x0, x0, #0x10
101f6e050:     	add	x2, sp, #0x2c
101f6e054:     	add	x3, sp, #0x28
101f6e058:     	mov	w1, #0x1                ; =1
101f6e05c:     	bl	0x101fbe13c <__Z27UI_view2d_scroller_size_getPK6View2DbPfS2_>
101f6e060:     	ldr	x8, [x22, #0x128]
101f6e064:     	ldr	s0, [x8, #0xa8]
101f6e068:     	scvtf	s0, s0
101f6e06c:     	ldr	s1, [sp, #0x28]
101f6e070:     	fcmp	s1, s0
101f6e074:     	fcsel	s0, s0, s1, mi
101f6e078:     	str	s0, [sp, #0x28]
101f6e07c:     	ldur	q1, [x20, #0xa8]
101f6e080:     	str	q1, [sp, #0x10]
101f6e084:     	ldr	w8, [x20, #0xa8]
101f6e088:     	ldr	x9, [x20, #0x128]
101f6e08c:     	ldr	w10, [x20, #0xb0]
101f6e090:     	ldp	w11, w9, [x9, #0xe0]
101f6e094:     	ldr	s1, [sp, #0x2c]
101f6e098:     	fcvtzs	w12, s1
101f6e09c:     	add	w8, w8, w12
101f6e0a0:     	ldr	w12, [sp, #0x10]
101f6e0a4:     	ldr	w13, [sp, #0x18]
101f6e0a8:     	add	w11, w11, w12
101f6e0ac:     	sub	w1, w8, w11
101f6e0b0:     	fcvtzs	w8, s0
101f6e0b4:     	add	w8, w10, w8
101f6e0b8:     	add	w9, w9, w13
101f6e0bc:     	sub	w2, w8, w9
101f6e0c0:     	add	x0, sp, #0x10
101f6e0c4:     	bl	0x1007fd304 <__Z18BLI_rcti_translateP4rctiii>
101f6e0c8:     	mov	x0, x21
101f6e0cc:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f6e0d0:     	mov	x1, x0
101f6e0d4:     	add	x4, sp, #0x10
101f6e0d8:     	mov	x5, sp
101f6e0dc:     	mov	x0, x21
101f6e0e0:     	mov	x2, x19
101f6e0e4:     	mov	x3, x22
101f6e0e8:     	bl	0x101620bc4 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_>
101f6e0ec:     	cbz	w0, 0x101f6e140 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2cc>
101f6e0f0:     	ldr	w8, [sp]
101f6e0f4:     	ldr	w9, [x22, #0xa8]
101f6e0f8:     	sub	w8, w8, w9
101f6e0fc:     	scvtf	s0, w8
101f6e100:     	b	0x101f6e14c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2d8>
101f6e104:     	orr	w8, w8, #0x1
101f6e108:     	strh	w8, [x20, #0xc4]
101f6e10c:     	add	x0, x20, #0xa8
101f6e110:     	mov	w1, #0x0                ; =0
101f6e114:     	mov	w2, #0x0                ; =0
101f6e118:     	mov	w3, #0x0                ; =0
101f6e11c:     	mov	w4, #0x0                ; =0
101f6e120:     	bl	0x1007fcf78 <__Z13BLI_rcti_initP4rctiiiii>
101f6e124:     	mov	x0, x20
101f6e128:     	ldp	x29, x30, [sp, #0x60]
101f6e12c:     	ldp	x20, x19, [sp, #0x50]
101f6e130:     	ldp	x22, x21, [sp, #0x40]
101f6e134:     	ldp	x24, x23, [sp, #0x30]
101f6e138:     	add	sp, sp, #0x70
101f6e13c:     	b	0x101604e80 <__Z20ED_region_tag_redrawP7ARegion>
101f6e140:     	ldr	x8, [x22, #0x128]
101f6e144:     	ldr	s0, [x8, #0xa0]
101f6e148:     	scvtf	s0, s0
101f6e14c:     	ldr	s1, [sp, #0x2c]
101f6e150:     	fcmp	s1, s0
101f6e154:     	fcsel	s0, s0, s1, mi
101f6e158:     	str	s0, [sp, #0x2c]
101f6e15c:     	ldr	x8, [x20, #0x128]
101f6e160:     	ldr	s1, [x8, #0xe0]
101f6e164:     	scvtf	s2, s1
101f6e168:     	ldr	s1, [sp, #0x28]
101f6e16c:     	fcmp	s0, s2
101f6e170:     	b.ne	0x101f6e184 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x310>
101f6e174:     	ldr	s2, [x8, #0xe4]
101f6e178:     	scvtf	s2, s2
101f6e17c:     	fcmp	s1, s2
101f6e180:     	b.eq	0x101f6dea0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
101f6e184:     	fcvtzs	w9, s0
101f6e188:     	str	w9, [x8, #0xe0]
101f6e18c:     	fcvtzs	w8, s1
101f6e190:     	ldr	x9, [x20, #0x128]
101f6e194:     	str	w8, [x9, #0xe4]
101f6e198:     	mov	x0, x19
101f6e19c:     	mov	x1, x20
101f6e1a0:     	bl	0x10160631c <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f6e1a4:     	mov	x0, x20
101f6e1a8:     	bl	0x101604e80 <__Z20ED_region_tag_redrawP7ARegion>
101f6e1ac:     	b	0x101f6dea0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x2c>
