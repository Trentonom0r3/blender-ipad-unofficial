
output\ui-preview\pencil-knife\binary-40459756217\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010ad32c <-[GHOSTUIWindow handlePan:]>:
1010ad32c:     	sub	sp, sp, #0x1a0
1010ad330:     	stp	d13, d12, [sp, #0x110]
1010ad334:     	stp	d11, d10, [sp, #0x120]
1010ad338:     	stp	d9, d8, [sp, #0x130]
1010ad33c:     	stp	x28, x27, [sp, #0x140]
1010ad340:     	stp	x26, x25, [sp, #0x150]
1010ad344:     	stp	x24, x23, [sp, #0x160]
1010ad348:     	stp	x22, x21, [sp, #0x170]
1010ad34c:     	stp	x20, x19, [sp, #0x180]
1010ad350:     	stp	x29, x30, [sp, #0x190]
1010ad354:     	add	x29, sp, #0x190
1010ad358:     	mov	x20, x2
1010ad35c:     	mov	x19, x0
1010ad360:     	mov	x0, x2
1010ad364:     	bl	0x104b7b560 <_objc_msgSend$touchStreamAllowed>
1010ad368:     	cbz	w0, 0x1010ad59c <-[GHOSTUIWindow handlePan:]+0x270>
1010ad36c:     	mov	x0, x20
1010ad370:     	bl	0x104b7b180 <_objc_msgSend$state>
1010ad374:     	cmp	x0, #0x1
1010ad378:     	b.ne	0x1010ad3e0 <-[GHOSTUIWindow handlePan:]+0xb4>
1010ad37c:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ad380:     	ldrsw	x8, [x8, #0x2c]
1010ad384:     	ldrb	w8, [x19, x8]
1010ad388:     	tbnz	w8, #0x0, 0x1010ad3b0 <-[GHOSTUIWindow handlePan:]+0x84>
1010ad38c:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ad390:     	ldrsw	x8, [x8, #0x30]
1010ad394:     	ldrb	w8, [x19, x8]
1010ad398:     	tbnz	w8, #0x0, 0x1010ad3b0 <-[GHOSTUIWindow handlePan:]+0x84>
1010ad39c:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ad3a0:     	ldrsw	x8, [x8, #0x34]
1010ad3a4:     	ldrb	w8, [x19, x8]
1010ad3a8:     	cmp	w8, #0x1
1010ad3ac:     	b.ne	0x1010ad3e0 <-[GHOSTUIWindow handlePan:]+0xb4>
1010ad3b0:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ad3b4:     	ldrsw	x8, [x8, #0x50]
1010ad3b8:     	add	x8, x19, x8
1010ad3bc:     	stp	xzr, xzr, [x8, #0x8]
1010ad3c0:     	str	xzr, [x8]
1010ad3c4:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ad3c8:     	ldrsw	x8, [x8, #0xfb4]
1010ad3cc:     	add	x8, x19, x8
1010ad3d0:     	str	wzr, [x8]
1010ad3d4:     	mov	w9, #0x1                ; =1
1010ad3d8:     	strb	w9, [x8, #0x4]
1010ad3dc:     	b	0x1010ad59c <-[GHOSTUIWindow handlePan:]+0x270>
1010ad3e0:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ad3e4:     	ldrsw	x26, [x8, #0xf84]
1010ad3e8:     	ldr	x2, [x19, x26]
1010ad3ec:     	mov	x0, x20
1010ad3f0:     	bl	0x104b77be0 <_objc_msgSend$getScaledTouchPoint:>
1010ad3f4:     	fmov	d9, d0
1010ad3f8:     	fmov	d8, d1
1010ad3fc:     	ldr	x2, [x19, x26]
1010ad400:     	mov	x0, x20
1010ad404:     	bl	0x104b77c00 <_objc_msgSend$getScaledTranslation:>
1010ad408:     	fmov	d11, d0
1010ad40c:     	fmov	d10, d1
1010ad410:     	mov	x0, x20
1010ad414:     	bl	0x104b77ac0 <_objc_msgSend$gestureUsesPencil>
1010ad418:     	mov	x28, x0
1010ad41c:     	adrp	x22, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ad420:     	cbz	x20, 0x1010ad474 <-[GHOSTUIWindow handlePan:]+0x148>
1010ad424:     	add	x8, sp, #0x50
1010ad428:     	mov	x0, x20
1010ad42c:     	bl	0x104b78b20 <_objc_msgSend$pencilSample>
1010ad430:     	ldrb	w8, [sp, #0x50]
1010ad434:     	ldr	x9, [sp, #0x58]
1010ad438:     	ldr	w10, [sp, #0x54]
1010ad43c:     	lsl	x10, x10, #32
1010ad440:     	tst	w8, #0x1
1010ad444:     	mov	w8, #0x1                ; =1
1010ad448:     	csinc	x21, x8, x10, eq
1010ad44c:     	csel	x8, x9, xzr, ne
1010ad450:     	str	x8, [sp, #0x28]
1010ad454:     	mov	x0, x20
1010ad458:     	bl	0x104b7b180 <_objc_msgSend$state>
1010ad45c:     	cmp	x0, #0x1
1010ad460:     	b.ne	0x1010ad58c <-[GHOSTUIWindow handlePan:]+0x260>
1010ad464:     	add	x8, sp, #0x50
1010ad468:     	mov	x0, x20
1010ad46c:     	bl	0x104b79060 <_objc_msgSend$ringContact>
1010ad470:     	b	0x1010ad498 <-[GHOSTUIWindow handlePan:]+0x16c>
1010ad474:     	mov	x0, x20
1010ad478:     	bl	0x104b7b180 <_objc_msgSend$state>
1010ad47c:     	cmp	x0, #0x1
1010ad480:     	b.ne	0x1010ad584 <-[GHOSTUIWindow handlePan:]+0x258>
1010ad484:     	str	xzr, [sp, #0x28]
1010ad488:     	str	xzr, [sp, #0x70]
1010ad48c:     	movi.16b	v0, #0x0
1010ad490:     	stp	q0, q0, [sp, #0x50]
1010ad494:     	mov	w21, #0x1               ; =1
1010ad498:     	ldrsw	x27, [x22, #0x44]
1010ad49c:     	add	x8, x19, x27
1010ad4a0:     	ldp	q0, q1, [sp, #0x50]
1010ad4a4:     	stp	q0, q1, [x8]
1010ad4a8:     	ldrh	w9, [sp, #0x70]
1010ad4ac:     	strh	w9, [x8, #0x20]
1010ad4b0:     	and	w9, w9, #0xff
1010ad4b4:     	cmp	w9, #0x1
1010ad4b8:     	b.ne	0x1010ad590 <-[GHOSTUIWindow handlePan:]+0x264>
1010ad4bc:     	ldr	x24, [x8]
1010ad4c0:     	cbz	x24, 0x1010ad590 <-[GHOSTUIWindow handlePan:]+0x264>
1010ad4c4:     	mov	x25, x28
1010ad4c8:     	ldr	x28, [x8, #0x10]
1010ad4cc:     	cbz	x28, 0x1010ad738 <-[GHOSTUIWindow handlePan:]+0x40c>
1010ad4d0:     	str	x21, [sp, #0x10]
1010ad4d4:     	adrp	x9, 0x106623000 <_zlibVersion+0x106623000>
1010ad4d8:     	ldrsw	x9, [x9, #0xf80]
1010ad4dc:     	ldr	x22, [x19, x9]
1010ad4e0:     	ldr	x21, [x19, x26]
1010ad4e4:     	ldr	d12, [x8, #0x18]
1010ad4e8:     	ldr	x8, [x8, #0x8]
1010ad4ec:     	str	x8, [sp, #0x8]
1010ad4f0:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ad4f4:     	add	x8, x8, #0x750
1010ad4f8:     	ldr	x8, [x8]
1010ad4fc:     	adrp	x2, 0x104c15000 <__ZL3hex+0x4616d>
1010ad500:     	add	x2, x2, #0xfaa
1010ad504:     	mov	w0, #0x58               ; =88
1010ad508:     	mov	w1, #0x10               ; =16
1010ad50c:     	mov	w3, #0x1                ; =1
1010ad510:     	blr	x8
1010ad514:     	mov	x23, x0
1010ad518:     	ldr	x8, [x22]
1010ad51c:     	ldr	x8, [x8, #0x10]
1010ad520:     	mov	x0, x22
1010ad524:     	blr	x8
1010ad528:     	mov	w8, #0xb                ; =11
1010ad52c:     	str	w8, [x23, #0x8]
1010ad530:     	adrp	x8, 0x1063fb000 <__ZTV15GHOST_WindowIOS+0x1c8>
1010ad534:     	add	x8, x8, #0x1b0
1010ad538:     	stp	x0, x21, [x23, #0x10]
1010ad53c:     	add	x8, x8, #0x10
1010ad540:     	str	x8, [x23]
1010ad544:     	mov	x8, x23
1010ad548:     	str	x24, [x8, #0x28]!
1010ad54c:     	ldr	x9, [sp, #0x8]
1010ad550:     	str	x9, [x23, #0x30]
1010ad554:     	str	d12, [x23, #0x38]
1010ad558:     	mov	w9, #0x1                ; =1
1010ad55c:     	str	w9, [x23, #0x40]
1010ad560:     	str	x28, [x23, #0x48]
1010ad564:     	str	wzr, [x23, #0x50]
1010ad568:     	str	x8, [x23, #0x20]
1010ad56c:     	mov	x0, x22
1010ad570:     	mov	x1, x23
1010ad574:     	bl	0x101099714 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010ad578:     	ldr	x21, [sp, #0x10]
1010ad57c:     	mov	x28, x25
1010ad580:     	b	0x1010ad590 <-[GHOSTUIWindow handlePan:]+0x264>
1010ad584:     	str	xzr, [sp, #0x28]
1010ad588:     	mov	w21, #0x1               ; =1
1010ad58c:     	ldrsw	x27, [x22, #0x44]
1010ad590:     	add	x22, x19, x27
1010ad594:     	ldrb	w8, [x22, #0x21]
1010ad598:     	tbz	w8, #0x0, 0x1010ad5c8 <-[GHOSTUIWindow handlePan:]+0x29c>
1010ad59c:     	ldp	x29, x30, [sp, #0x190]
1010ad5a0:     	ldp	x20, x19, [sp, #0x180]
1010ad5a4:     	ldp	x22, x21, [sp, #0x170]
1010ad5a8:     	ldp	x24, x23, [sp, #0x160]
1010ad5ac:     	ldp	x26, x25, [sp, #0x150]
1010ad5b0:     	ldp	x28, x27, [sp, #0x140]
1010ad5b4:     	ldp	d9, d8, [sp, #0x130]
1010ad5b8:     	ldp	d11, d10, [sp, #0x120]
1010ad5bc:     	ldp	d13, d12, [sp, #0x110]
1010ad5c0:     	add	sp, sp, #0x1a0
1010ad5c4:     	ret
1010ad5c8:     	ldrb	w8, [x22, #0x20]
1010ad5cc:     	cmp	w8, #0x1
1010ad5d0:     	b.ne	0x1010ad6e4 <-[GHOSTUIWindow handlePan:]+0x3b8>
1010ad5d4:     	mov	x0, x20
1010ad5d8:     	bl	0x104b7b180 <_objc_msgSend$state>
1010ad5dc:     	cmp	x0, #0x3
1010ad5e0:     	b.eq	0x1010ad604 <-[GHOSTUIWindow handlePan:]+0x2d8>
1010ad5e4:     	mov	x0, x20
1010ad5e8:     	bl	0x104b7b180 <_objc_msgSend$state>
1010ad5ec:     	cmp	x0, #0x4
1010ad5f0:     	b.eq	0x1010ad604 <-[GHOSTUIWindow handlePan:]+0x2d8>
1010ad5f4:     	mov	x0, x20
1010ad5f8:     	bl	0x104b7b180 <_objc_msgSend$state>
1010ad5fc:     	cmp	x0, #0x5
1010ad600:     	b.ne	0x1010adb10 <-[GHOSTUIWindow handlePan:]+0x7e4>
1010ad604:     	mov	x0, x20
1010ad608:     	bl	0x104b7b180 <_objc_msgSend$state>
1010ad60c:     	cmp	x0, #0x3
1010ad610:     	mov	w8, #0x3                ; =3
1010ad614:     	cinc	w21, w8, ne
1010ad618:     	ldr	x24, [x22]
1010ad61c:     	cbz	x24, 0x1010ad6c4 <-[GHOSTUIWindow handlePan:]+0x398>
1010ad620:     	ldr	x23, [x22, #0x10]
1010ad624:     	cbz	x23, 0x1010ad6c4 <-[GHOSTUIWindow handlePan:]+0x398>
1010ad628:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ad62c:     	ldrsw	x8, [x8, #0xf80]
1010ad630:     	ldr	x20, [x19, x8]
1010ad634:     	ldr	x26, [x19, x26]
1010ad638:     	ldr	x25, [x22, #0x8]
1010ad63c:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ad640:     	add	x8, x8, #0x750
1010ad644:     	ldr	x8, [x8]
1010ad648:     	adrp	x2, 0x104c15000 <__ZL3hex+0x4616d>
1010ad64c:     	add	x2, x2, #0xfaa
1010ad650:     	mov	w0, #0x58               ; =88
1010ad654:     	mov	w1, #0x10               ; =16
1010ad658:     	mov	w3, #0x1                ; =1
1010ad65c:     	blr	x8
1010ad660:     	mov	x19, x0
1010ad664:     	ldr	x8, [x20]
1010ad668:     	ldr	x8, [x8, #0x10]
1010ad66c:     	mov	x0, x20
1010ad670:     	blr	x8
1010ad674:     	fcvtzs	w8, d8
1010ad678:     	fcvtzs	w9, d9
1010ad67c:     	mov	w10, #0xb               ; =11
1010ad680:     	str	w10, [x19, #0x8]
1010ad684:     	stp	x0, x26, [x19, #0x10]
1010ad688:     	adrp	x10, 0x1063fb000 <__ZTV15GHOST_WindowIOS+0x1c8>
1010ad68c:     	add	x10, x10, #0x1b0
1010ad690:     	add	x10, x10, #0x10
1010ad694:     	str	x10, [x19]
1010ad698:     	mov	x10, x19
1010ad69c:     	str	x24, [x10, #0x28]!
1010ad6a0:     	str	x25, [x19, #0x30]
1010ad6a4:     	stp	w9, w8, [x19, #0x38]
1010ad6a8:     	str	w21, [x19, #0x40]
1010ad6ac:     	str	x23, [x19, #0x48]
1010ad6b0:     	str	wzr, [x19, #0x50]
1010ad6b4:     	str	x10, [x19, #0x20]
1010ad6b8:     	mov	x0, x20
1010ad6bc:     	mov	x1, x19
1010ad6c0:     	bl	0x101099714 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010ad6c4:     	ldrb	w8, [x22, #0x20]
1010ad6c8:     	cmp	w8, #0x1
1010ad6cc:     	b.ne	0x1010ad59c <-[GHOSTUIWindow handlePan:]+0x270>
1010ad6d0:     	ldrb	w8, [x22, #0x21]
1010ad6d4:     	tbnz	w8, #0x0, 0x1010ad59c <-[GHOSTUIWindow handlePan:]+0x270>
1010ad6d8:     	mov	w8, #0x100              ; =256
1010ad6dc:     	strh	w8, [x22, #0x20]
1010ad6e0:     	b	0x1010ad59c <-[GHOSTUIWindow handlePan:]+0x270>
1010ad6e4:     	cbz	w28, 0x1010ad6fc <-[GHOSTUIWindow handlePan:]+0x3d0>
1010ad6e8:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ad6ec:     	ldrsw	x8, [x8, #0xfa0]
1010ad6f0:     	add	x8, x19, x8
1010ad6f4:     	ldr	x9, [sp, #0x28]
1010ad6f8:     	stp	x21, x9, [x8]
1010ad6fc:     	add	x22, sp, #0x50
1010ad700:     	mov	x0, x20
1010ad704:     	bl	0x104b7b180 <_objc_msgSend$state>
1010ad708:     	adrp	x23, 0x106623000 <_zlibVersion+0x106623000>
1010ad70c:     	cmp	x0, #0x1
1010ad710:     	b.ne	0x1010ad730 <-[GHOSTUIWindow handlePan:]+0x404>
1010ad714:     	str	w28, [sp, #0x24]
1010ad718:     	mov	x24, x21
1010ad71c:     	cbz	x20, 0x1010ad740 <-[GHOSTUIWindow handlePan:]+0x414>
1010ad720:     	add	x8, sp, #0x50
1010ad724:     	mov	x0, x20
1010ad728:     	bl	0x104b77d80 <_objc_msgSend$hudContact>
1010ad72c:     	b	0x1010ad748 <-[GHOSTUIWindow handlePan:]+0x41c>
1010ad730:     	ldrsw	x27, [x23, #0xfb4]
1010ad734:     	b	0x1010ad95c <-[GHOSTUIWindow handlePan:]+0x630>
1010ad738:     	mov	x28, x25
1010ad73c:     	b	0x1010ad590 <-[GHOSTUIWindow handlePan:]+0x264>
1010ad740:     	stp	xzr, xzr, [sp, #0x50]
1010ad744:     	str	xzr, [sp, #0x60]
1010ad748:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ad74c:     	ldrsw	x8, [x8, #0x50]
1010ad750:     	add	x21, x19, x8
1010ad754:     	ldr	q0, [sp, #0x50]
1010ad758:     	str	q0, [x21]
1010ad75c:     	ldr	x8, [sp, #0x60]
1010ad760:     	str	x8, [x21, #0x10]
1010ad764:     	mov	x0, x20
1010ad768:     	bl	0x104b77aa0 <_objc_msgSend$gestureUsesFinger>
1010ad76c:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ad770:     	ldrsw	x25, [x8, #0xfb8]
1010ad774:     	strb	w0, [x19, x25]
1010ad778:     	ldr	q0, [x21]
1010ad77c:     	str	q0, [sp, #0x10]
1010ad780:     	fmov	x28, d0
1010ad784:     	cbz	x28, 0x1010ad7a0 <-[GHOSTUIWindow handlePan:]+0x474>
1010ad788:     	ldp	s0, s1, [x21, #0x10]
1010ad78c:     	sshll.2d	v0, v0, #0x0
1010ad790:     	scvtf	d12, d0
1010ad794:     	sshll.2d	v0, v1, #0x0
1010ad798:     	scvtf	d13, d0
1010ad79c:     	b	0x1010ad7a8 <-[GHOSTUIWindow handlePan:]+0x47c>
1010ad7a0:     	fsub	d12, d9, d11
1010ad7a4:     	fsub	d13, d8, d10
1010ad7a8:     	ldrsw	x27, [x23, #0xfb4]
1010ad7ac:     	add	x23, x19, x27
1010ad7b0:     	ldr	x26, [x19, x26]
1010ad7b4:     	bl	0x10109fd28 <__Z29GHOST_IOS_get_flythrough_modev>
1010ad7b8:     	adrp	x9, 0x106368000 <_zlibVersion+0x106368000>
1010ad7bc:     	ldr	x9, [x9, #0x748]
1010ad7c0:     	ldr	x8, [x9, #0x8]
1010ad7c4:     	mov	x21, x24
1010ad7c8:     	cbz	x8, 0x1010ad8ac <-[GHOSTUIWindow handlePan:]+0x580>
1010ad7cc:     	lsr	x10, x26, #32
1010ad7d0:     	ubfiz	x11, x26, #3, #29
1010ad7d4:     	add	x11, x11, #0x8
1010ad7d8:     	eor	x11, x11, x10
1010ad7dc:     	mov	x12, #0x2d69            ; =11625
1010ad7e0:     	movk	x12, #0xeb38, lsl #16
1010ad7e4:     	movk	x12, #0xea08, lsl #32
1010ad7e8:     	movk	x12, #0x9ddf, lsl #48
1010ad7ec:     	mul	x11, x11, x12
1010ad7f0:     	eor	x10, x10, x11, lsr #47
1010ad7f4:     	eor	x10, x10, x11
1010ad7f8:     	mul	x10, x10, x12
1010ad7fc:     	eor	x10, x10, x10, lsr #47
1010ad800:     	mul	x11, x10, x12
1010ad804:     	fmov	d0, x8
1010ad808:     	cnt.8b	v0, v0
1010ad80c:     	uaddlv.8b	h0, v0
1010ad810:     	fmov	w12, s0
1010ad814:     	cmp	x12, #0x1
1010ad818:     	b.hi	0x1010ad828 <-[GHOSTUIWindow handlePan:]+0x4fc>
1010ad81c:     	sub	x10, x8, #0x1
1010ad820:     	and	x13, x11, x10
1010ad824:     	b	0x1010ad83c <-[GHOSTUIWindow handlePan:]+0x510>
1010ad828:     	mov	x13, x11
1010ad82c:     	cmp	x11, x8
1010ad830:     	b.lo	0x1010ad83c <-[GHOSTUIWindow handlePan:]+0x510>
1010ad834:     	udiv	x10, x11, x8
1010ad838:     	msub	x13, x10, x8, x11
1010ad83c:     	ldr	x9, [x9]
1010ad840:     	ldr	x9, [x9, x13, lsl #3]
1010ad844:     	cbz	x9, 0x1010ad8a8 <-[GHOSTUIWindow handlePan:]+0x57c>
1010ad848:     	ldr	x14, [x9]
1010ad84c:     	cbz	x14, 0x1010ad8a8 <-[GHOSTUIWindow handlePan:]+0x57c>
1010ad850:     	fcvtzs	w9, d12
1010ad854:     	fcvtzs	w10, d13
1010ad858:     	sub	x15, x8, #0x1
1010ad85c:     	b	0x1010ad874 <-[GHOSTUIWindow handlePan:]+0x548>
1010ad860:     	ldr	x16, [x14, #0x10]
1010ad864:     	cmp	x16, x26
1010ad868:     	b.eq	0x1010adcfc <-[GHOSTUIWindow handlePan:]+0x9d0>
1010ad86c:     	ldr	x14, [x14]
1010ad870:     	cbz	x14, 0x1010ad8a8 <-[GHOSTUIWindow handlePan:]+0x57c>
1010ad874:     	ldr	x16, [x14, #0x8]
1010ad878:     	cmp	x16, x11
1010ad87c:     	b.eq	0x1010ad860 <-[GHOSTUIWindow handlePan:]+0x534>
1010ad880:     	cmp	x12, #0x1
1010ad884:     	b.hi	0x1010ad890 <-[GHOSTUIWindow handlePan:]+0x564>
1010ad888:     	and	x16, x16, x15
1010ad88c:     	b	0x1010ad8a0 <-[GHOSTUIWindow handlePan:]+0x574>
1010ad890:     	cmp	x16, x8
1010ad894:     	b.lo	0x1010ad8a0 <-[GHOSTUIWindow handlePan:]+0x574>
1010ad898:     	udiv	x17, x16, x8
1010ad89c:     	msub	x16, x17, x8, x16
1010ad8a0:     	cmp	x16, x13
1010ad8a4:     	b.eq	0x1010ad86c <-[GHOSTUIWindow handlePan:]+0x540>
1010ad8a8:     	mov	w8, #0x0                ; =0
1010ad8ac:     	str	w8, [x23]
1010ad8b0:     	strb	wzr, [x23, #0x4]
1010ad8b4:     	cbz	x28, 0x1010ad8c8 <-[GHOSTUIWindow handlePan:]+0x59c>
1010ad8b8:     	mov	w8, #0x1                ; =1
1010ad8bc:     	str	w8, [x23]
1010ad8c0:     	strb	wzr, [x23, #0x4]
1010ad8c4:     	b	0x1010ad8cc <-[GHOSTUIWindow handlePan:]+0x5a0>
1010ad8c8:     	cbz	w8, 0x1010adb7c <-[GHOSTUIWindow handlePan:]+0x850>
1010ad8cc:     	strb	wzr, [sp, #0xa9]
1010ad8d0:     	adrp	x9, 0x10513b000 <__ZTSNSt3__110__function6__funcIZ19DRW_draw_depth_loopP9DepsgraphP7ARegionP6View3DP11GPUViewportbbbE3$_0NS_9allocatorISA_EEFvR17DupliCacheManagerR15ExtractionGraphEEE+0x81>
1010ad8d4:     	add	x9, x9, #0x944
1010ad8d8:     	ldr	q0, [x9]
1010ad8dc:     	stur	q0, [sp, #0xac]
1010ad8e0:     	movi.16b	v0, #0x0
1010ad8e4:     	stur	q0, [x22, #0x6c]
1010ad8e8:     	stur	q0, [x22, #0x7c]
1010ad8ec:     	stur	q0, [x22, #0x8c]
1010ad8f0:     	stur	q0, [x22, #0x98]
1010ad8f4:     	stp	d12, d13, [sp, #0x80]
1010ad8f8:     	stp	xzr, xzr, [sp, #0x98]
1010ad8fc:     	str	xzr, [sp, #0x90]
1010ad900:     	ldr	w28, [sp, #0x24]
1010ad904:     	strb	w28, [sp, #0xa8]
1010ad908:     	cbz	w28, 0x1010ad920 <-[GHOSTUIWindow handlePan:]+0x5f4>
1010ad90c:     	stur	x21, [sp, #0xac]
1010ad910:     	ldr	x9, [sp, #0x28]
1010ad914:     	stur	x9, [x22, #0x64]
1010ad918:     	mov	w9, #0x1                ; =1
1010ad91c:     	strb	w9, [sp, #0xa9]
1010ad920:     	ldrb	w9, [x19, x25]
1010ad924:     	strb	w9, [sp, #0xbf]
1010ad928:     	ldr	q0, [sp, #0x10]
1010ad92c:     	stur	q0, [x22, #0x78]
1010ad930:     	cmp	w8, #0x3
1010ad934:     	cset	w8, eq
1010ad938:     	strb	w8, [sp, #0xbe]
1010ad93c:     	adrp	x8, 0x104fc5000 <__ZTSZZN7blender3gpu6shader12Preprocessor28template_definition_mutationERKNSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEERNS3_8functionIFviiS9_PKcEEEENKUlNS1_6parser5TokenESB_NSI_5ScopeESK_SJ_E_clESJ_SB_SK_SK_SJ_EUlRKNS3_6vectorISJ_NS7_ISJ_EEEEE0_+0x79>
1010ad940:     	ldr	d0, [x8, #0xac8]
1010ad944:     	str	d0, [sp, #0x50]
1010ad948:     	mov	w8, #0x2                ; =2
1010ad94c:     	str	w8, [sp, #0x78]
1010ad950:     	add	x2, sp, #0x50
1010ad954:     	mov	x0, x19
1010ad958:     	bl	0x104b77a80 <_objc_msgSend$generateUserInputEvents:>
1010ad95c:     	add	x23, x19, x27
1010ad960:     	ldrb	w8, [x23, #0x4]
1010ad964:     	tbnz	w8, #0x0, 0x1010ad59c <-[GHOSTUIWindow handlePan:]+0x270>
1010ad968:     	ldr	w8, [x23]
1010ad96c:     	cbz	w8, 0x1010ada9c <-[GHOSTUIWindow handlePan:]+0x770>
1010ad970:     	strb	wzr, [sp, #0xa9]
1010ad974:     	adrp	x9, 0x10513b000 <__ZTSNSt3__110__function6__funcIZ19DRW_draw_depth_loopP9DepsgraphP7ARegionP6View3DP11GPUViewportbbbE3$_0NS_9allocatorISA_EEFvR17DupliCacheManagerR15ExtractionGraphEEE+0x81>
1010ad978:     	add	x9, x9, #0x944
1010ad97c:     	ldr	q0, [x9]
1010ad980:     	stur	q0, [sp, #0xac]
1010ad984:     	movi.16b	v0, #0x0
1010ad988:     	stur	q0, [x22, #0x6c]
1010ad98c:     	stur	q0, [x22, #0x7c]
1010ad990:     	stur	q0, [x22, #0x8c]
1010ad994:     	stur	q0, [x22, #0x98]
1010ad998:     	stp	d9, d8, [sp, #0x80]
1010ad99c:     	stp	xzr, xzr, [sp, #0x98]
1010ad9a0:     	str	xzr, [sp, #0x90]
1010ad9a4:     	strb	w28, [sp, #0xa8]
1010ad9a8:     	cbz	w28, 0x1010ad9c0 <-[GHOSTUIWindow handlePan:]+0x694>
1010ad9ac:     	stur	x21, [sp, #0xac]
1010ad9b0:     	ldr	x9, [sp, #0x28]
1010ad9b4:     	stur	x9, [x22, #0x64]
1010ad9b8:     	mov	w9, #0x1                ; =1
1010ad9bc:     	strb	w9, [sp, #0xa9]
1010ad9c0:     	adrp	x9, 0x106623000 <_zlibVersion+0x106623000>
1010ad9c4:     	ldrsw	x21, [x9, #0xfb8]
1010ad9c8:     	ldrb	w9, [x19, x21]
1010ad9cc:     	strb	w9, [sp, #0xbf]
1010ad9d0:     	adrp	x9, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ad9d4:     	ldrsw	x9, [x9, #0x50]
1010ad9d8:     	add	x24, x19, x9
1010ad9dc:     	ldr	q0, [x24]
1010ad9e0:     	stur	q0, [x22, #0x78]
1010ad9e4:     	cmp	w8, #0x3
1010ad9e8:     	cset	w8, eq
1010ad9ec:     	strb	w8, [sp, #0xbe]
1010ad9f0:     	mov	w8, #0x1                ; =1
1010ad9f4:     	str	wzr, [sp, #0x50]
1010ad9f8:     	str	w8, [sp, #0x78]
1010ad9fc:     	mov	x0, x20
1010ada00:     	bl	0x104b7b180 <_objc_msgSend$state>
1010ada04:     	cmp	x0, #0x3
1010ada08:     	b.eq	0x1010ada2c <-[GHOSTUIWindow handlePan:]+0x700>
1010ada0c:     	mov	x0, x20
1010ada10:     	bl	0x104b7b180 <_objc_msgSend$state>
1010ada14:     	cmp	x0, #0x4
1010ada18:     	b.eq	0x1010ada2c <-[GHOSTUIWindow handlePan:]+0x700>
1010ada1c:     	mov	x0, x20
1010ada20:     	bl	0x104b7b180 <_objc_msgSend$state>
1010ada24:     	cmp	x0, #0x5
1010ada28:     	b.ne	0x1010ada74 <-[GHOSTUIWindow handlePan:]+0x748>
1010ada2c:     	mov	x0, x20
1010ada30:     	bl	0x104b7b180 <_objc_msgSend$state>
1010ada34:     	cmp	x0, #0x3
1010ada38:     	cset	w8, ne
1010ada3c:     	ldr	w9, [x23]
1010ada40:     	cmp	w9, #0x0
1010ada44:     	cset	w10, ne
1010ada48:     	ldrb	w11, [x23, #0x4]
1010ada4c:     	orr	w10, w11, w10
1010ada50:     	strb	w10, [x23, #0x4]
1010ada54:     	csel	w8, wzr, w8, eq
1010ada58:     	str	wzr, [x23]
1010ada5c:     	strb	w8, [sp, #0xbd]
1010ada60:     	cbz	w9, 0x1010ada74 <-[GHOSTUIWindow handlePan:]+0x748>
1010ada64:     	mov	w8, #0x6                ; =6
1010ada68:     	mov	w9, #0x2                ; =2
1010ada6c:     	str	w8, [sp, #0x54]
1010ada70:     	str	w9, [sp, #0x78]
1010ada74:     	add	x2, sp, #0x50
1010ada78:     	mov	x0, x19
1010ada7c:     	bl	0x104b77a80 <_objc_msgSend$generateUserInputEvents:>
1010ada80:     	ldrb	w8, [x23, #0x4]
1010ada84:     	cmp	w8, #0x1
1010ada88:     	b.ne	0x1010ad59c <-[GHOSTUIWindow handlePan:]+0x270>
1010ada8c:     	stp	xzr, xzr, [x24]
1010ada90:     	str	xzr, [x24, #0x10]
1010ada94:     	strb	wzr, [x19, x21]
1010ada98:     	b	0x1010ad59c <-[GHOSTUIWindow handlePan:]+0x270>
1010ada9c:     	tbz	w28, #0x0, 0x1010adb38 <-[GHOSTUIWindow handlePan:]+0x80c>
1010adaa0:     	mov	x23, x21
1010adaa4:     	mov	x0, x20
1010adaa8:     	bl	0x104b7b180 <_objc_msgSend$state>
1010adaac:     	cmp	x0, #0x1
1010adab0:     	b.ne	0x1010adabc <-[GHOSTUIWindow handlePan:]+0x790>
1010adab4:     	mov	x0, x20
1010adab8:     	bl	0x104b78e20 <_objc_msgSend$recognizeKnifePan>
1010adabc:     	mov	x0, x20
1010adac0:     	bl	0x104b78a00 <_objc_msgSend$omitKnifePairedPan>
1010adac4:     	mov	x21, x0
1010adac8:     	str	wzr, [sp, #0x78]
1010adacc:     	stur	xzr, [x22, #0x6c]
1010adad0:     	stur	xzr, [x22, #0x7c]
1010adad4:     	stur	xzr, [x22, #0x74]
1010adad8:     	str	wzr, [sp, #0xd4]
1010adadc:     	stp	d9, d8, [sp, #0x80]
1010adae0:     	stp	xzr, xzr, [sp, #0x98]
1010adae4:     	str	xzr, [sp, #0x90]
1010adae8:     	mov	w8, #0x101              ; =257
1010adaec:     	strh	w8, [sp, #0xa8]
1010adaf0:     	stur	x23, [sp, #0xac]
1010adaf4:     	ldr	x8, [sp, #0x28]
1010adaf8:     	stur	x8, [x22, #0x64]
1010adafc:     	cbz	x20, 0x1010adbe8 <-[GHOSTUIWindow handlePan:]+0x8bc>
1010adb00:     	add	x8, sp, #0x30
1010adb04:     	mov	x0, x20
1010adb08:     	bl	0x104b78b00 <_objc_msgSend$pencilPaintContact>
1010adb0c:     	b	0x1010adbf0 <-[GHOSTUIWindow handlePan:]+0x8c4>
1010adb10:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010adb14:     	ldrsw	x8, [x8, #0xf80]
1010adb18:     	ldr	x0, [x19, x8]
1010adb1c:     	ldr	x1, [x19, x26]
1010adb20:     	mov	x2, x22
1010adb24:     	mov	w3, #0x2                ; =2
1010adb28:     	fmov	d0, d9
1010adb2c:     	fmov	d1, d8
1010adb30:     	bl	0x1010ac804 <__ZL15ios_ring_packetP15GHOST_SystemIOSP15GHOST_WindowIOSRKN5ghost3ios17PencilRingContactE22GHOST_TPencilRingPhase7CGPoint>
1010adb34:     	b	0x1010ad59c <-[GHOSTUIWindow handlePan:]+0x270>
1010adb38:     	bl	0x10109fd28 <__Z29GHOST_IOS_get_flythrough_modev>
1010adb3c:     	cbz	w0, 0x1010adb84 <-[GHOSTUIWindow handlePan:]+0x858>
1010adb40:     	mov	x0, x20
1010adb44:     	bl	0x104b7b180 <_objc_msgSend$state>
1010adb48:     	cmp	x0, #0x1
1010adb4c:     	b.ne	0x1010add58 <-[GHOSTUIWindow handlePan:]+0xa2c>
1010adb50:     	mov	x0, x20
1010adb54:     	fmov	d0, d11
1010adb58:     	fmov	d1, d10
1010adb5c:     	bl	0x104b79520 <_objc_msgSend$setCachedTranslation:>
1010adb60:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010adb64:     	ldrsw	x8, [x8, #0x48]
1010adb68:     	str	d9, [x19, x8]
1010adb6c:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010adb70:     	ldrsw	x8, [x8, #0x4c]
1010adb74:     	str	d8, [x19, x8]
1010adb78:     	b	0x1010adf1c <-[GHOSTUIWindow handlePan:]+0xbf0>
1010adb7c:     	ldr	w28, [sp, #0x24]
1010adb80:     	b	0x1010ad95c <-[GHOSTUIWindow handlePan:]+0x630>
1010adb84:     	adrp	x8, 0x10513b000 <__ZTSNSt3__110__function6__funcIZ19DRW_draw_depth_loopP9DepsgraphP7ARegionP6View3DP11GPUViewportbbbE3$_0NS_9allocatorISA_EEFvR17DupliCacheManagerR15ExtractionGraphEEE+0x81>
1010adb88:     	add	x8, x8, #0x944
1010adb8c:     	ldr	q0, [x8]
1010adb90:     	fsub	d1, d9, d11
1010adb94:     	stur	q0, [sp, #0xac]
1010adb98:     	fsub	d0, d8, d10
1010adb9c:     	str	wzr, [sp, #0x78]
1010adba0:     	movi.16b	v2, #0x0
1010adba4:     	stur	q2, [x22, #0x6c]
1010adba8:     	stur	q2, [x22, #0x7c]
1010adbac:     	stur	q2, [x22, #0x8c]
1010adbb0:     	stur	q2, [x22, #0x98]
1010adbb4:     	stp	d1, d0, [sp, #0x80]
1010adbb8:     	strh	wzr, [sp, #0xa8]
1010adbbc:     	stp	xzr, xzr, [sp, #0x98]
1010adbc0:     	str	xzr, [sp, #0x90]
1010adbc4:     	mov	x0, x20
1010adbc8:     	bl	0x104b7b180 <_objc_msgSend$state>
1010adbcc:     	cmp	x0, #0x1
1010adbd0:     	b.ne	0x1010addf8 <-[GHOSTUIWindow handlePan:]+0xacc>
1010adbd4:     	mov	x0, x20
1010adbd8:     	fmov	d0, d11
1010adbdc:     	fmov	d1, d10
1010adbe0:     	bl	0x104b79520 <_objc_msgSend$setCachedTranslation:>
1010adbe4:     	b	0x1010adf90 <-[GHOSTUIWindow handlePan:]+0xc64>
1010adbe8:     	movi.16b	v0, #0x0
1010adbec:     	stp	q0, q0, [sp, #0x30]
1010adbf0:     	ldp	q0, q1, [sp, #0x30]
1010adbf4:     	stur	q0, [x22, #0x88]
1010adbf8:     	stur	q1, [x22, #0x98]
1010adbfc:     	mov	x0, x20
1010adc00:     	bl	0x104b7b180 <_objc_msgSend$state>
1010adc04:     	cmp	x0, #0x1
1010adc08:     	b.eq	0x1010adc1c <-[GHOSTUIWindow handlePan:]+0x8f0>
1010adc0c:     	mov	x0, x20
1010adc10:     	bl	0x104b7b180 <_objc_msgSend$state>
1010adc14:     	cmp	x0, #0x2
1010adc18:     	b.ne	0x1010ade60 <-[GHOSTUIWindow handlePan:]+0xb34>
1010adc1c:     	mov	x0, x20
1010adc20:     	bl	0x104b7b180 <_objc_msgSend$state>
1010adc24:     	cmp	x0, #0x1
1010adc28:     	b.ne	0x1010adc54 <-[GHOSTUIWindow handlePan:]+0x928>
1010adc2c:     	mov	x0, x20
1010adc30:     	fmov	d0, d11
1010adc34:     	fmov	d1, d10
1010adc38:     	bl	0x104b79520 <_objc_msgSend$setCachedTranslation:>
1010adc3c:     	adrp	x8, 0x104fc5000 <__ZTSZZN7blender3gpu6shader12Preprocessor28template_definition_mutationERKNSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEERNS3_8functionIFviiS9_PKcEEEENKUlNS1_6parser5TokenESB_NSI_5ScopeESK_SJ_E_clESJ_SB_SK_SK_SJ_EUlRKNS3_6vectorISJ_NS7_ISJ_EEEEE0_+0x79>
1010adc40:     	ldr	d0, [x8, #0xac8]
1010adc44:     	str	d0, [sp, #0x50]
1010adc48:     	mov	w22, #0x2               ; =2
1010adc4c:     	str	w22, [sp, #0x78]
1010adc50:     	b	0x1010adc58 <-[GHOSTUIWindow handlePan:]+0x92c>
1010adc54:     	mov	w22, #0x0               ; =0
1010adc58:     	mov	x0, x20
1010adc5c:     	fmov	d0, d11
1010adc60:     	fmov	d1, d10
1010adc64:     	bl	0x104b77b80 <_objc_msgSend$getRelativeTranslation:>
1010adc68:     	fmov	d8, d0
1010adc6c:     	fmov	d9, d1
1010adc70:     	mov	x0, x20
1010adc74:     	fmov	d0, d11
1010adc78:     	fmov	d1, d10
1010adc7c:     	bl	0x104b79520 <_objc_msgSend$setCachedTranslation:>
1010adc80:     	ldr	x8, [sp, #0xd8]
1010adc84:     	cbz	x8, 0x1010adca8 <-[GHOSTUIWindow handlePan:]+0x97c>
1010adc88:     	ldr	x8, [sp, #0xe0]
1010adc8c:     	cbz	x8, 0x1010adca8 <-[GHOSTUIWindow handlePan:]+0x97c>
1010adc90:     	ldr	x8, [sp, #0xe8]
1010adc94:     	cmp	x8, #0x0
1010adc98:     	cset	w8, ne
1010adc9c:     	orr	w8, w8, w21
1010adca0:     	tbz	w8, #0x0, 0x1010adcac <-[GHOSTUIWindow handlePan:]+0x980>
1010adca4:     	b	0x1010adcd4 <-[GHOSTUIWindow handlePan:]+0x9a8>
1010adca8:     	tbnz	w21, #0x0, 0x1010adcd4 <-[GHOSTUIWindow handlePan:]+0x9a8>
1010adcac:     	fcmp	d8, #0.0
1010adcb0:     	b.ne	0x1010adcbc <-[GHOSTUIWindow handlePan:]+0x990>
1010adcb4:     	fcmp	d9, #0.0
1010adcb8:     	b.eq	0x1010adcd4 <-[GHOSTUIWindow handlePan:]+0x9a8>
1010adcbc:     	stp	d8, d9, [sp, #0x90]
1010adcc0:     	add	x8, sp, #0x50
1010adcc4:     	mov	w9, #0x1                ; =1
1010adcc8:     	str	w9, [x8, w22, uxtw #2]
1010adccc:     	orr	w22, w22, #0x1
1010adcd0:     	str	w22, [sp, #0x78]
1010adcd4:     	mov	x0, x20
1010adcd8:     	bl	0x104b7b180 <_objc_msgSend$state>
1010adcdc:     	cmp	x0, #0x2
1010adce0:     	b.ne	0x1010ade64 <-[GHOSTUIWindow handlePan:]+0xb38>
1010adce4:     	add	x8, sp, #0x50
1010adce8:     	str	wzr, [x8, w22, uxtw #2]
1010adcec:     	ldr	w8, [sp, #0x78]
1010adcf0:     	add	w22, w8, #0x1
1010adcf4:     	str	w22, [sp, #0x78]
1010adcf8:     	b	0x1010ade64 <-[GHOSTUIWindow handlePan:]+0xb38>
1010adcfc:     	ldp	x11, x12, [x14, #0x18]
1010add00:     	b	0x1010add08 <-[GHOSTUIWindow handlePan:]+0x9dc>
1010add04:     	add	x11, x11, #0x20
1010add08:     	cmp	x11, x12
1010add0c:     	b.eq	0x1010ad8a8 <-[GHOSTUIWindow handlePan:]+0x57c>
1010add10:     	ldr	w8, [x11]
1010add14:     	cmp	w8, w9
1010add18:     	b.gt	0x1010add04 <-[GHOSTUIWindow handlePan:]+0x9d8>
1010add1c:     	ldr	w8, [x11, #0x8]
1010add20:     	cmp	w8, w9
1010add24:     	b.lt	0x1010add04 <-[GHOSTUIWindow handlePan:]+0x9d8>
1010add28:     	ldr	w8, [x11, #0x4]
1010add2c:     	cmp	w8, w10
1010add30:     	b.gt	0x1010add04 <-[GHOSTUIWindow handlePan:]+0x9d8>
1010add34:     	ldr	w8, [x11, #0xc]
1010add38:     	cmp	w8, w10
1010add3c:     	b.lt	0x1010add04 <-[GHOSTUIWindow handlePan:]+0x9d8>
1010add40:     	ldr	w8, [x11, #0x10]
1010add44:     	cmp	w8, #0x3
1010add48:     	csel	w13, wzr, w0, ne
1010add4c:     	cmp	w13, #0x1
1010add50:     	b.eq	0x1010add04 <-[GHOSTUIWindow handlePan:]+0x9d8>
1010add54:     	b	0x1010ad8ac <-[GHOSTUIWindow handlePan:]+0x580>
1010add58:     	mov	x0, x20
1010add5c:     	bl	0x104b7b180 <_objc_msgSend$state>
1010add60:     	cmp	x0, #0x2
1010add64:     	b.ne	0x1010adedc <-[GHOSTUIWindow handlePan:]+0xbb0>
1010add68:     	mov	x0, x20
1010add6c:     	fmov	d0, d11
1010add70:     	fmov	d1, d10
1010add74:     	bl	0x104b77b80 <_objc_msgSend$getRelativeTranslation:>
1010add78:     	fmov	d12, d0
1010add7c:     	fmov	d13, d1
1010add80:     	mov	x0, x20
1010add84:     	fmov	d0, d11
1010add88:     	fmov	d1, d10
1010add8c:     	bl	0x104b79520 <_objc_msgSend$setCachedTranslation:>
1010add90:     	adrp	x8, 0x106364000 <_zlibVersion+0x106364000>
1010add94:     	ldr	x8, [x8, #0x250]
1010add98:     	ldr	d0, [x8]
1010add9c:     	fcmp	d12, d0
1010adda0:     	b.ne	0x1010addb0 <-[GHOSTUIWindow handlePan:]+0xa84>
1010adda4:     	ldr	d0, [x8, #0x8]
1010adda8:     	fcmp	d13, d0
1010addac:     	b.eq	0x1010ad59c <-[GHOSTUIWindow handlePan:]+0x270>
1010addb0:     	adrp	x8, 0x10513b000 <__ZTSNSt3__110__function6__funcIZ19DRW_draw_depth_loopP9DepsgraphP7ARegionP6View3DP11GPUViewportbbbE3$_0NS_9allocatorISA_EEFvR17DupliCacheManagerR15ExtractionGraphEEE+0x81>
1010addb4:     	add	x8, x8, #0x944
1010addb8:     	ldr	q0, [x8]
1010addbc:     	stur	q0, [sp, #0xac]
1010addc0:     	movi.16b	v0, #0x0
1010addc4:     	stur	q0, [x22, #0x6c]
1010addc8:     	stur	q0, [x22, #0x7c]
1010addcc:     	stur	q0, [x22, #0x8c]
1010addd0:     	stur	q0, [x22, #0x98]
1010addd4:     	stp	d9, d8, [sp, #0x80]
1010addd8:     	stp	d12, d13, [sp, #0x90]
1010adddc:     	str	xzr, [sp, #0xa0]
1010adde0:     	strh	wzr, [sp, #0xa8]
1010adde4:     	mov	w8, #0x2                ; =2
1010adde8:     	mov	w9, #0x1                ; =1
1010addec:     	str	w8, [sp, #0x50]
1010addf0:     	str	w9, [sp, #0x78]
1010addf4:     	b	0x1010adf9c <-[GHOSTUIWindow handlePan:]+0xc70>
1010addf8:     	mov	x0, x20
1010addfc:     	bl	0x104b7b180 <_objc_msgSend$state>
1010ade00:     	cmp	x0, #0x2
1010ade04:     	b.ne	0x1010adf5c <-[GHOSTUIWindow handlePan:]+0xc30>
1010ade08:     	mov	x0, x20
1010ade0c:     	fmov	d0, d11
1010ade10:     	fmov	d1, d10
1010ade14:     	bl	0x104b77b80 <_objc_msgSend$getRelativeTranslation:>
1010ade18:     	fmov	d9, d0
1010ade1c:     	fmov	d8, d1
1010ade20:     	stp	d0, d1, [sp, #0x90]
1010ade24:     	mov	x0, x20
1010ade28:     	fmov	d0, d11
1010ade2c:     	fmov	d1, d10
1010ade30:     	bl	0x104b79520 <_objc_msgSend$setCachedTranslation:>
1010ade34:     	adrp	x8, 0x106364000 <_zlibVersion+0x106364000>
1010ade38:     	ldr	x8, [x8, #0x250]
1010ade3c:     	ldr	d0, [x8]
1010ade40:     	fcmp	d9, d0
1010ade44:     	b.ne	0x1010ade54 <-[GHOSTUIWindow handlePan:]+0xb28>
1010ade48:     	ldr	d0, [x8, #0x8]
1010ade4c:     	fcmp	d8, d0
1010ade50:     	b.eq	0x1010adf9c <-[GHOSTUIWindow handlePan:]+0xc70>
1010ade54:     	mov	w8, #0x1                ; =1
1010ade58:     	str	w8, [sp, #0x50]
1010ade5c:     	b	0x1010adf94 <-[GHOSTUIWindow handlePan:]+0xc68>
1010ade60:     	mov	w22, #0x0               ; =0
1010ade64:     	mov	x0, x20
1010ade68:     	bl	0x104b7b180 <_objc_msgSend$state>
1010ade6c:     	cmp	x0, #0x3
1010ade70:     	b.eq	0x1010ade94 <-[GHOSTUIWindow handlePan:]+0xb68>
1010ade74:     	mov	x0, x20
1010ade78:     	bl	0x104b7b180 <_objc_msgSend$state>
1010ade7c:     	cmp	x0, #0x4
1010ade80:     	b.eq	0x1010ade94 <-[GHOSTUIWindow handlePan:]+0xb68>
1010ade84:     	mov	x0, x20
1010ade88:     	bl	0x104b7b180 <_objc_msgSend$state>
1010ade8c:     	cmp	x0, #0x5
1010ade90:     	b.ne	0x1010adf9c <-[GHOSTUIWindow handlePan:]+0xc70>
1010ade94:     	mov	w8, #0x0                ; =0
1010ade98:     	ldr	x9, [sp, #0xd8]
1010ade9c:     	cbz	x9, 0x1010adec0 <-[GHOSTUIWindow handlePan:]+0xb94>
1010adea0:     	ldr	x9, [sp, #0xe0]
1010adea4:     	cbz	x9, 0x1010adec0 <-[GHOSTUIWindow handlePan:]+0xb94>
1010adea8:     	ldr	x9, [sp, #0xe8]
1010adeac:     	cbz	x9, 0x1010adec0 <-[GHOSTUIWindow handlePan:]+0xb94>
1010adeb0:     	mov	x0, x20
1010adeb4:     	bl	0x104b7b180 <_objc_msgSend$state>
1010adeb8:     	cmp	x0, #0x3
1010adebc:     	cset	w8, ne
1010adec0:     	strb	w8, [sp, #0xbd]
1010adec4:     	add	x8, sp, #0x50
1010adec8:     	mov	w9, #0x6                ; =6
1010adecc:     	str	w9, [x8, w22, sxtw #2]
1010aded0:     	ldr	w8, [sp, #0x78]
1010aded4:     	add	w8, w8, #0x1
1010aded8:     	b	0x1010adf98 <-[GHOSTUIWindow handlePan:]+0xc6c>
1010adedc:     	mov	x0, x20
1010adee0:     	bl	0x104b7b180 <_objc_msgSend$state>
1010adee4:     	cmp	x0, #0x3
1010adee8:     	b.eq	0x1010adf0c <-[GHOSTUIWindow handlePan:]+0xbe0>
1010adeec:     	mov	x0, x20
1010adef0:     	bl	0x104b7b180 <_objc_msgSend$state>
1010adef4:     	cmp	x0, #0x4
1010adef8:     	b.eq	0x1010adf0c <-[GHOSTUIWindow handlePan:]+0xbe0>
1010adefc:     	mov	x0, x20
1010adf00:     	bl	0x104b7b180 <_objc_msgSend$state>
1010adf04:     	cmp	x0, #0x5
1010adf08:     	b.ne	0x1010ad59c <-[GHOSTUIWindow handlePan:]+0x270>
1010adf0c:     	fmov	d0, xzr
1010adf10:     	fmov	d1, xzr
1010adf14:     	mov	x0, x20
1010adf18:     	bl	0x104b79520 <_objc_msgSend$setCachedTranslation:>
1010adf1c:     	adrp	x8, 0x10513b000 <__ZTSNSt3__110__function6__funcIZ19DRW_draw_depth_loopP9DepsgraphP7ARegionP6View3DP11GPUViewportbbbE3$_0NS_9allocatorISA_EEFvR17DupliCacheManagerR15ExtractionGraphEEE+0x81>
1010adf20:     	add	x8, x8, #0x944
1010adf24:     	ldr	q0, [x8]
1010adf28:     	stur	q0, [sp, #0xac]
1010adf2c:     	movi.16b	v0, #0x0
1010adf30:     	stur	q0, [x22, #0x6c]
1010adf34:     	stur	q0, [x22, #0x7c]
1010adf38:     	stur	q0, [x22, #0x8c]
1010adf3c:     	stur	q0, [x22, #0x98]
1010adf40:     	stp	d9, d8, [sp, #0x80]
1010adf44:     	strh	wzr, [sp, #0xa8]
1010adf48:     	stp	xzr, xzr, [sp, #0x98]
1010adf4c:     	str	xzr, [sp, #0x90]
1010adf50:     	mov	w8, #0x1                ; =1
1010adf54:     	str	wzr, [sp, #0x50]
1010adf58:     	b	0x1010adf98 <-[GHOSTUIWindow handlePan:]+0xc6c>
1010adf5c:     	mov	x0, x20
1010adf60:     	bl	0x104b7b180 <_objc_msgSend$state>
1010adf64:     	cmp	x0, #0x3
1010adf68:     	b.eq	0x1010adf8c <-[GHOSTUIWindow handlePan:]+0xc60>
1010adf6c:     	mov	x0, x20
1010adf70:     	bl	0x104b7b180 <_objc_msgSend$state>
1010adf74:     	cmp	x0, #0x4
1010adf78:     	b.eq	0x1010adf8c <-[GHOSTUIWindow handlePan:]+0xc60>
1010adf7c:     	mov	x0, x20
1010adf80:     	bl	0x104b7b180 <_objc_msgSend$state>
1010adf84:     	cmp	x0, #0x5
1010adf88:     	b.ne	0x1010adf9c <-[GHOSTUIWindow handlePan:]+0xc70>
1010adf8c:     	stp	d9, d8, [sp, #0x80]
1010adf90:     	str	wzr, [sp, #0x50]
1010adf94:     	mov	w8, #0x1                ; =1
1010adf98:     	str	w8, [sp, #0x78]
1010adf9c:     	add	x2, sp, #0x50
1010adfa0:     	mov	x0, x19
1010adfa4:     	bl	0x104b77a80 <_objc_msgSend$generateUserInputEvents:>
1010adfa8:     	b	0x1010ad59c <-[GHOSTUIWindow handlePan:]+0x270>
1010adfac:     	mov	x20, x0
1010adfb0:     	cbz	x19, 0x1010adff4 <-[GHOSTUIWindow handlePan:]+0xcc8>
1010adfb4:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010adfb8:     	add	x8, x8, #0x710
1010adfbc:     	ldr	x8, [x8]
1010adfc0:     	mov	x0, x19
1010adfc4:     	mov	w1, #0x1                ; =1
1010adfc8:     	blr	x8
1010adfcc:     	b	0x1010adff4 <-[GHOSTUIWindow handlePan:]+0xcc8>
1010adfd0:     	bl	0x1000144bc <___clang_call_terminate>
1010adfd4:     	mov	x20, x0
1010adfd8:     	cbz	x23, 0x1010adff4 <-[GHOSTUIWindow handlePan:]+0xcc8>
1010adfdc:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010adfe0:     	add	x8, x8, #0x710
1010adfe4:     	ldr	x8, [x8]
1010adfe8:     	mov	x0, x23
1010adfec:     	mov	w1, #0x1                ; =1
1010adff0:     	blr	x8
1010adff4:     	mov	x0, x20
1010adff8:     	bl	0x104b7207c <_zlibVersion+0x104b7207c>
1010adffc:     	bl	0x1000144bc <___clang_call_terminate>
