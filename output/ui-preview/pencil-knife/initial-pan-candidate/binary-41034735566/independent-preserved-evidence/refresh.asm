
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f92044 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea>:
101f92044:     	sub	sp, sp, #0xa0
101f92048:     	stp	x26, x25, [sp, #0x50]
101f9204c:     	stp	x24, x23, [sp, #0x60]
101f92050:     	stp	x22, x21, [sp, #0x70]
101f92054:     	stp	x20, x19, [sp, #0x80]
101f92058:     	stp	x29, x30, [sp, #0x90]
101f9205c:     	add	x29, sp, #0x90
101f92060:     	mov	x19, x1
101f92064:     	mov	x20, x0
101f92068:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f9206c:     	cmp	x0, x19
101f92070:     	b.eq	0x101f92090 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x4c>
101f92074:     	ldp	x29, x30, [sp, #0x90]
101f92078:     	ldp	x20, x19, [sp, #0x80]
101f9207c:     	ldp	x22, x21, [sp, #0x70]
101f92080:     	ldp	x24, x23, [sp, #0x60]
101f92084:     	ldp	x26, x25, [sp, #0x50]
101f92088:     	add	sp, sp, #0xa0
101f9208c:     	ret
101f92090:     	movi.16b	v0, #0x0
101f92094:     	stur	q0, [sp, #0x3e]
101f92098:     	stp	q0, q0, [sp, #0x20]
101f9209c:     	add	x1, sp, #0x20
101f920a0:     	mov	x0, x20
101f920a4:     	bl	0x101f90ba4 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout>
101f920a8:     	ldr	x8, [sp, #0x20]
101f920ac:     	cmp	x8, #0x0
101f920b0:     	csel	w24, wzr, w0, eq
101f920b4:     	mov	x0, x19
101f920b8:     	mov	w1, #0x8                ; =8
101f920bc:     	bl	0x1003d66f0 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f920c0:     	mov	x22, x0
101f920c4:     	cbz	x0, 0x101f9211c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xd8>
101f920c8:     	tbnz	w24, #0x0, 0x101f9211c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xd8>
101f920cc:     	ldr	x8, [x22, #0x120]
101f920d0:     	cbz	x8, 0x101f9211c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xd8>
101f920d4:     	ldrb	w9, [x8, #0x3]
101f920d8:     	cmp	w9, #0x1
101f920dc:     	b.ne	0x101f92120 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xdc>
101f920e0:     	strb	wzr, [x8, #0x3]
101f920e4:     	mov	x0, x22
101f920e8:     	bl	0x101620de8 <__Z20ED_region_tag_redrawP7ARegion>
101f920ec:     	ldrh	w8, [x22, #0xc4]
101f920f0:     	tbz	w8, #0x7, 0x101f92120 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xdc>
101f920f4:     	orr	w8, w8, #0x1
101f920f8:     	strh	w8, [x22, #0xc4]
101f920fc:     	add	x0, x22, #0xa8
101f92100:     	mov	w1, #0x0                ; =0
101f92104:     	mov	w2, #0x0                ; =0
101f92108:     	mov	w3, #0x0                ; =0
101f9210c:     	mov	w4, #0x0                ; =0
101f92110:     	bl	0x1007fcfb4 <__Z13BLI_rcti_initP4rctiiiii>
101f92114:     	mov	x0, x22
101f92118:     	b	0x101f92474 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x430>
101f9211c:     	tbnz	w24, #0x0, 0x101f9212c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xe8>
101f92120:     	mov	x0, x20
101f92124:     	bl	0x101f91dc4 <__Z21UI_ipad_corner_canvasP8bContext>
101f92128:     	cbz	x0, 0x101f92074 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x30>
101f9212c:     	cbz	x22, 0x101f92154 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x110>
101f92130:     	ldrh	w8, [x22, #0xc4]
101f92134:     	tbz	w8, #0x7, 0x101f9213c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xf8>
101f92138:     	tbz	w24, #0x0, 0x101f92074 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x30>
101f9213c:     	ldr	x0, [x19, #0x58]
101f92140:     	mov	w1, #0x8                ; =8
101f92144:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f92148:     	mov	x21, x22
101f9214c:     	cbnz	x0, 0x101f921c8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x184>
101f92150:     	b	0x101f92074 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x30>
101f92154:     	ldr	x0, [x19, #0x58]
101f92158:     	mov	w1, #0x8                ; =8
101f9215c:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f92160:     	cbz	x0, 0x101f92074 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x30>
101f92164:     	mov	x23, x0
101f92168:     	bl	0x1003d59f8 <__Z19BKE_area_region_newv>
101f9216c:     	mov	x21, x0
101f92170:     	mov	x0, x19
101f92174:     	mov	w1, #0x0                ; =0
101f92178:     	bl	0x1003d66f0 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f9217c:     	cbz	x0, 0x101f92194 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x150>
101f92180:     	mov	x1, x0
101f92184:     	add	x0, x19, #0x78
101f92188:     	mov	x2, x21
101f9218c:     	bl	0x100790668 <__Z20BLI_insertlinkbeforeP8ListBasePvS1_>
101f92190:     	b	0x101f921a0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x15c>
101f92194:     	add	x0, x19, #0x78
101f92198:     	mov	x1, x21
101f9219c:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
101f921a0:     	mov	w8, #0x8                ; =8
101f921a4:     	movk	w8, #0x7, lsl #16
101f921a8:     	str	w8, [x21, #0xc0]
101f921ac:     	mov	w8, #0x1                ; =1
101f921b0:     	strh	w8, [x21, #0xca]
101f921b4:     	ldrh	w8, [x21, #0xc4]
101f921b8:     	orr	w8, w8, #0x4
101f921bc:     	strh	w8, [x21, #0xc4]
101f921c0:     	ldr	x8, [x21, #0x128]
101f921c4:     	str	x23, [x8, #0x170]
101f921c8:     	ldr	x23, [x21, #0x120]
101f921cc:     	mov	x0, x23
101f921d0:     	cbnz	x23, 0x101f92214 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x1d0>
101f921d4:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
101f921d8:     	add	x8, x8, #0x760
101f921dc:     	ldr	x8, [x8]
101f921e0:     	adrp	x3, 0x104d58000 <__ZL3hex+0x187a0d>
101f921e4:     	add	x3, x3, #0x1ec
101f921e8:     	mov	w25, #0x1               ; =1
101f921ec:     	mov	w0, #0x1                ; =1
101f921f0:     	mov	w1, #0x38               ; =56
101f921f4:     	mov	w2, #0x8                ; =8
101f921f8:     	blr	x8
101f921fc:     	mov	w8, #0xffff             ; =65535
101f92200:     	strh	w8, [x0]
101f92204:     	mov	w8, #-0x1               ; =-1
101f92208:     	str	w8, [x0, #0x30]
101f9220c:     	strb	w25, [x0, #0x2]
101f92210:     	str	x0, [x21, #0x120]
101f92214:     	strb	w24, [x0, #0x3]
101f92218:     	ldrh	w8, [x21, #0xc4]
101f9221c:     	tbnz	w8, #0x0, 0x101f92284 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x240>
101f92220:     	cbz	x23, 0x101f9228c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x248>
101f92224:     	cbz	x22, 0x101f9228c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x248>
101f92228:     	ldr	x8, [x21, #0x128]
101f9222c:     	ldrh	w8, [x8, #0x368]
101f92230:     	cbz	w8, 0x101f9228c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x248>
101f92234:     	cbz	w24, 0x101f922d0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x28c>
101f92238:     	movi.16b	v0, #0x0
101f9223c:     	stur	q0, [sp, #0x3e]
101f92240:     	stp	q0, q0, [sp, #0x20]
101f92244:     	add	x1, sp, #0x20
101f92248:     	mov	x0, x20
101f9224c:     	bl	0x101f90ba4 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout>
101f92250:     	tbz	w0, #0x0, 0x101f9225c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x218>
101f92254:     	ldr	x22, [sp, #0x20]
101f92258:     	cbnz	x22, 0x101f922e0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x29c>
101f9225c:     	ldrh	w8, [x21, #0xc4]
101f92260:     	orr	w8, w8, #0x1
101f92264:     	strh	w8, [x21, #0xc4]
101f92268:     	add	x0, x21, #0xa8
101f9226c:     	mov	w1, #0x0                ; =0
101f92270:     	mov	w2, #0x0                ; =0
101f92274:     	mov	w3, #0x0                ; =0
101f92278:     	mov	w4, #0x0                ; =0
101f9227c:     	bl	0x1007fcfb4 <__Z13BLI_rcti_initP4rctiiiii>
101f92280:     	b	0x101f92470 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x42c>
101f92284:     	and	w8, w8, #0xfffe
101f92288:     	strh	w8, [x21, #0xc4]
101f9228c:     	mov	x0, x19
101f92290:     	mov	x1, x21
101f92294:     	bl	0x101622290 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f92298:     	mov	x0, x21
101f9229c:     	bl	0x101620de8 <__Z20ED_region_tag_redrawP7ARegion>
101f922a0:     	mov	x0, x20
101f922a4:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101f922a8:     	mov	x22, x0
101f922ac:     	mov	x0, x20
101f922b0:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f922b4:     	mov	x1, x0
101f922b8:     	mov	x0, x22
101f922bc:     	mov	x2, x19
101f922c0:     	bl	0x101623394 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea>
101f922c4:     	mov	x0, x21
101f922c8:     	bl	0x1016241e8 <__Z23ED_region_floating_initP7ARegion>
101f922cc:     	cbnz	w24, 0x101f92238 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x1f4>
101f922d0:     	mov	x0, x20
101f922d4:     	bl	0x101f91dc4 <__Z21UI_ipad_corner_canvasP8bContext>
101f922d8:     	mov	x22, x0
101f922dc:     	cbz	x22, 0x101f9225c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x218>
101f922e0:     	ldrh	w8, [x21, #0xc4]
101f922e4:     	mov	w9, #0x1                ; =1
101f922e8:     	bic	w8, w9, w8, lsr #1
101f922ec:     	ldr	x9, [x21, #0x128]
101f922f0:     	strh	w8, [x9, #0x368]
101f922f4:     	add	x0, x22, #0x10
101f922f8:     	add	x2, sp, #0x1c
101f922fc:     	add	x3, sp, #0x18
101f92300:     	mov	w1, #0x1                ; =1
101f92304:     	bl	0x101fe27bc <__Z27UI_view2d_scroller_size_getPK6View2DbPfS2_>
101f92308:     	ldr	x8, [x22, #0x128]
101f9230c:     	ldr	s0, [x8, #0x160]
101f92310:     	scvtf	s0, s0
101f92314:     	ldr	s1, [sp, #0x18]
101f92318:     	fcmp	s1, s0
101f9231c:     	fcsel	s0, s0, s1, mi
101f92320:     	str	s0, [sp, #0x18]
101f92324:     	ldur	q1, [x21, #0xa8]
101f92328:     	str	q1, [sp]
101f9232c:     	ldr	w8, [x21, #0xa8]
101f92330:     	ldr	x9, [x21, #0x128]
101f92334:     	ldr	w10, [x9, #0x198]
101f92338:     	sub	w23, w8, w10
101f9233c:     	ldr	w8, [x21, #0xb0]
101f92340:     	ldr	w9, [x9, #0x19c]
101f92344:     	sub	w25, w8, w9
101f92348:     	cbz	w24, 0x101f9238c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x348>
101f9234c:     	movi.16b	v0, #0x0
101f92350:     	stur	q0, [sp, #0x3e]
101f92354:     	stp	q0, q0, [sp, #0x20]
101f92358:     	add	x1, sp, #0x20
101f9235c:     	mov	x0, x20
101f92360:     	bl	0x101f90ba4 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout>
101f92364:     	tbz	w0, #0x0, 0x101f92388 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x344>
101f92368:     	ldr	w8, [sp, #0x28]
101f9236c:     	ldr	w9, [sp, #0x30]
101f92370:     	sub	w8, w8, w23
101f92374:     	scvtf	s1, w8
101f92378:     	sub	w8, w9, w25
101f9237c:     	scvtf	s0, w8
101f92380:     	stp	s0, s1, [sp, #0x18]
101f92384:     	b	0x101f9238c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x348>
101f92388:     	ldr	s0, [sp, #0x18]
101f9238c:     	ldr	s1, [sp, #0x1c]
101f92390:     	fcvtzs	w8, s1
101f92394:     	add	w8, w23, w8
101f92398:     	ldr	w9, [sp]
101f9239c:     	ldr	w10, [sp, #0x8]
101f923a0:     	sub	w1, w8, w9
101f923a4:     	fcvtzs	w8, s0
101f923a8:     	add	w8, w25, w8
101f923ac:     	sub	w2, w8, w10
101f923b0:     	mov	x0, sp
101f923b4:     	bl	0x1007fd340 <__Z18BLI_rcti_translateP4rctiii>
101f923b8:     	mov	x0, x20
101f923bc:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f923c0:     	mov	x1, x0
101f923c4:     	mov	x4, sp
101f923c8:     	add	x5, sp, #0x20
101f923cc:     	mov	x0, x20
101f923d0:     	mov	x2, x19
101f923d4:     	mov	x3, x22
101f923d8:     	bl	0x10163d108 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_>
101f923dc:     	cbz	w0, 0x101f923f4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x3b0>
101f923e0:     	ldr	w8, [sp, #0x20]
101f923e4:     	tbnz	w24, #0x0, 0x101f923ec <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x3a8>
101f923e8:     	ldr	w23, [x22, #0xa8]
101f923ec:     	sub	w8, w8, w23
101f923f0:     	b	0x101f92414 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x3d0>
101f923f4:     	ldr	x8, [x22, #0x128]
101f923f8:     	ldr	w8, [x8, #0x158]
101f923fc:     	cbz	w24, 0x101f9240c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x3c8>
101f92400:     	ldr	w9, [x22, #0xa8]
101f92404:     	sub	w9, w9, w23
101f92408:     	b	0x101f92410 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x3cc>
101f9240c:     	mov	w9, #0x0                ; =0
101f92410:     	add	w8, w9, w8
101f92414:     	scvtf	s0, w8
101f92418:     	ldr	s1, [sp, #0x1c]
101f9241c:     	fcmp	s1, s0
101f92420:     	fcsel	s0, s0, s1, mi
101f92424:     	str	s0, [sp, #0x1c]
101f92428:     	ldr	x8, [x21, #0x128]
101f9242c:     	ldr	s1, [x8, #0x198]
101f92430:     	scvtf	s2, s1
101f92434:     	ldr	s1, [sp, #0x18]
101f92438:     	fcmp	s0, s2
101f9243c:     	b.ne	0x101f92450 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x40c>
101f92440:     	ldr	s2, [x8, #0x19c]
101f92444:     	scvtf	s2, s2
101f92448:     	fcmp	s1, s2
101f9244c:     	b.eq	0x101f92074 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x30>
101f92450:     	fcvtzs	w9, s0
101f92454:     	str	w9, [x8, #0x198]
101f92458:     	fcvtzs	w8, s1
101f9245c:     	ldr	x9, [x21, #0x128]
101f92460:     	str	w8, [x9, #0x19c]
101f92464:     	mov	x0, x19
101f92468:     	mov	x1, x21
101f9246c:     	bl	0x101622290 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f92470:     	mov	x0, x21
101f92474:     	bl	0x101620de8 <__Z20ED_region_tag_redrawP7ARegion>
101f92478:     	b	0x101f92074 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x30>
