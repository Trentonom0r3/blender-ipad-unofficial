
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f8e3d8 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion>:
101f8e3d8:     	ldrh	w8, [x1, #0xc0]
101f8e3dc:     	cbz	w8, 0x101f8e3e8 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x10>
101f8e3e0:     	mov	w0, #0x0                ; =0
101f8e3e4:     	ret
101f8e3e8:     	sub	sp, sp, #0x40
101f8e3ec:     	stp	x22, x21, [sp, #0x10]
101f8e3f0:     	stp	x20, x19, [sp, #0x20]
101f8e3f4:     	stp	x29, x30, [sp, #0x30]
101f8e3f8:     	add	x29, sp, #0x30
101f8e3fc:     	ldr	x8, [x1, #0x128]
101f8e400:     	ldrh	w9, [x8, #0x2b0]
101f8e404:     	cbz	w9, 0x101f8e424 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x4c>
101f8e408:     	ldrb	w9, [x8, #0x8]
101f8e40c:     	cmp	w9, #0x1
101f8e410:     	b.ne	0x101f8e424 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x4c>
101f8e414:     	ldrh	w9, [x1, #0xc4]
101f8e418:     	mov	w10, #0x403             ; =1027
101f8e41c:     	tst	w9, w10
101f8e420:     	b.eq	0x101f8e43c <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x64>
101f8e424:     	mov	w0, #0x0                ; =0
101f8e428:     	ldp	x29, x30, [sp, #0x30]
101f8e42c:     	ldp	x20, x19, [sp, #0x20]
101f8e430:     	ldp	x22, x21, [sp, #0x10]
101f8e434:     	add	sp, sp, #0x40
101f8e438:     	ret
101f8e43c:     	ldr	q0, [x8, #0xa0]
101f8e440:     	str	q0, [sp]
101f8e444:     	ldr	w8, [x1, #0xa8]
101f8e448:     	mov	x19, x1
101f8e44c:     	ldr	w2, [x1, #0xb0]
101f8e450:     	mov	x20, sp
101f8e454:     	mov	x21, x0
101f8e458:     	mov	x0, sp
101f8e45c:     	mov	x1, x8
101f8e460:     	bl	0x1007fd304 <__Z18BLI_rcti_translateP4rctiii>
101f8e464:     	mov	x8, x21
101f8e468:     	mov	x9, #0x0                ; =0
101f8e46c:     	adrp	x17, 0x106d88000 <_build_commit_date>
101f8e470:     	add	x17, x17, #0xe08
101f8e474:     	mov	w10, #0x2912            ; =10514
101f8e478:     	ldrsh	w10, [x17, x10]
101f8e47c:     	ubfx	w11, w10, #29, #2
101f8e480:     	add	w11, w10, w11
101f8e484:     	sbfx	w11, w11, #2, #14
101f8e488:     	cmp	w11, #0x1
101f8e48c:     	csinc	w11, w11, wzr, gt
101f8e490:     	ldr	q0, [sp]
101f8e494:     	dup.4s	v1, w11
101f8e498:     	add.4s	v2, v0, v1
101f8e49c:     	sub.4s	v0, v0, v1
101f8e4a0:     	rev64.4s	v1, v2
101f8e4a4:     	trn2.4s	v0, v1, v0
101f8e4a8:     	str	q0, [sp]
101f8e4ac:     	ldp	x11, x12, [sp]
101f8e4b0:     	lsr	x14, x11, #32
101f8e4b4:     	mov	w13, #0x100             ; =256
101f8e4b8:     	strh	w13, [sp]
101f8e4bc:     	ldr	x13, [x21]
101f8e4c0:     	ldr	s0, [x13, #0x28]
101f8e4c4:     	sub	w14, w14, w11
101f8e4c8:     	add	w14, w14, #0x1
101f8e4cc:     	lsr	x15, x12, #32
101f8e4d0:     	sub	w16, w15, w12
101f8e4d4:     	scvtf	s1, w10
101f8e4d8:     	mov	w15, #0xcccd            ; =52429
101f8e4dc:     	movk	w15, #0x3ecc, lsl #16
101f8e4e0:     	fmov	s2, w15
101f8e4e4:     	fmul	s1, s1, s2
101f8e4e8:     	fadd	s1, s1, s1
101f8e4ec:     	fcvtps	w15, s1
101f8e4f0:     	add	w16, w16, #0x1
101f8e4f4:     	ldr	s1, [x17, #0x2654]
101f8e4f8:     	ldp	w0, w1, [x13, #0x18]
101f8e4fc:     	add	w17, w1, w0
101f8e500:     	cmp	w0, w1
101f8e504:     	csel	w0, w0, w1, gt
101f8e508:     	add	w1, w10, w10, lsl #2
101f8e50c:     	lsl	w1, w1, #1
101f8e510:     	fmov	s2, #2.00000000
101f8e514:     	fmov	s3, #1.00000000
101f8e518:     	fmov	s4, #0.50000000
101f8e51c:     	b	0x101f8e52c <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x154>
101f8e520:     	add	x9, x9, #0x1
101f8e524:     	cmp	x9, #0x2
101f8e528:     	b.eq	0x101f8e424 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x4c>
101f8e52c:     	ldrb	w2, [x20, x9]
101f8e530:     	cmp	w2, #0x0
101f8e534:     	fcsel	s5, s3, s2, ne
101f8e538:     	csel	w3, w17, w0, ne
101f8e53c:     	add	w5, w3, w15
101f8e540:     	fmul	s5, s0, s5
101f8e544:     	fcvtps	w3, s5
101f8e548:     	add	w4, w3, w10
101f8e54c:     	cmp	w14, w5
101f8e550:     	ccmp	w16, w4, #0x8, ge
101f8e554:     	b.lt	0x101f8e520 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x148>
101f8e558:     	cmp	w5, w1
101f8e55c:     	csel	w3, w5, w1, gt
101f8e560:     	cmp	w2, #0x0
101f8e564:     	csel	w3, w5, w3, ne
101f8e568:     	cmp	w3, w14
101f8e56c:     	csel	w6, w3, w14, lt
101f8e570:     	scvtf	s5, w6
101f8e574:     	fdiv	s5, s5, s1
101f8e578:     	fcvtzs	w7, s5
101f8e57c:     	cmp	w7, #0x1
101f8e580:     	csinc	w3, w7, wzr, gt
101f8e584:     	cmp	w7, #0x2
101f8e588:     	b.lt	0x101f8e5b8 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x1e0>
101f8e58c:     	ucvtf	s5, w3
101f8e590:     	fadd	s5, s5, s4
101f8e594:     	fmul	s5, s1, s5
101f8e598:     	fcvtzs	w7, s5
101f8e59c:     	cmp	w6, w7
101f8e5a0:     	b.ge	0x101f8e5b8 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x1e0>
101f8e5a4:     	sub	w7, w3, #0x1
101f8e5a8:     	cmp	w3, #0x2
101f8e5ac:     	mov	x3, x7
101f8e5b0:     	b.gt	0x101f8e58c <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x1b4>
101f8e5b4:     	mov	w3, #0x1                ; =1
101f8e5b8:     	scvtf	s5, w4
101f8e5bc:     	fdiv	s5, s5, s1
101f8e5c0:     	fcvtzs	w7, s5
101f8e5c4:     	cmp	w7, #0x1
101f8e5c8:     	csinc	w6, w7, wzr, gt
101f8e5cc:     	cmp	w7, #0x2
101f8e5d0:     	b.lt	0x101f8e608 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x230>
101f8e5d4:     	ucvtf	s5, w6
101f8e5d8:     	fadd	s5, s5, s4
101f8e5dc:     	fmul	s5, s1, s5
101f8e5e0:     	fcvtzs	w7, s5
101f8e5e4:     	cmp	w4, w7
101f8e5e8:     	b.ge	0x101f8e608 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x230>
101f8e5ec:     	sub	w7, w6, #0x1
101f8e5f0:     	cmp	w6, #0x2
101f8e5f4:     	mov	x6, x7
101f8e5f8:     	b.gt	0x101f8e5d4 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x1fc>
101f8e5fc:     	mov	w6, #0x1                ; =1
101f8e600:     	b	0x101f8e608 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x230>
101f8e604:     	add	w3, w3, #0x1
101f8e608:     	scvtf	s5, w3
101f8e60c:     	fadd	s5, s5, s4
101f8e610:     	fmul	s6, s1, s5
101f8e614:     	fcvtzs	w7, s6
101f8e618:     	cmp	w5, w7
101f8e61c:     	b.gt	0x101f8e604 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x22c>
101f8e620:     	b	0x101f8e628 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x250>
101f8e624:     	add	w6, w6, #0x1
101f8e628:     	scvtf	s6, w6
101f8e62c:     	fadd	s6, s6, s4
101f8e630:     	fmul	s6, s1, s6
101f8e634:     	fcvtzs	w5, s6
101f8e638:     	cmp	w4, w5
101f8e63c:     	b.gt	0x101f8e624 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x24c>
101f8e640:     	fmul	s5, s1, s5
101f8e644:     	fcvtzs	w4, s5
101f8e648:     	cmp	w14, w4
101f8e64c:     	b.lt	0x101f8e520 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x148>
101f8e650:     	cmp	w16, w5
101f8e654:     	b.lt	0x101f8e520 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x148>
101f8e658:     	str	x19, [x13]
101f8e65c:     	ldr	x9, [x8]
101f8e660:     	stp	x11, x12, [x9, #0x8]
101f8e664:     	ldr	x9, [x8]
101f8e668:     	strb	w2, [x9, #0x2c]
101f8e66c:     	ldr	x9, [x8]
101f8e670:     	str	w3, [x9, #0x20]
101f8e674:     	ldr	x9, [x8]
101f8e678:     	str	w6, [x9, #0x24]
101f8e67c:     	ldr	x8, [x8]
101f8e680:     	mov	w0, #0x1                ; =1
101f8e684:     	strb	w0, [x8, #0x2d]
101f8e688:     	b	0x101f8e428 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion+0x50>
