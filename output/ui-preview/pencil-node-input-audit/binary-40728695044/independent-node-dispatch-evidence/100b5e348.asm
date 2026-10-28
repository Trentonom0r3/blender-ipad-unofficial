
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b5e348 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase>:
100b5e348:     	stp	x28, x27, [sp, #-0x60]!
100b5e34c:     	stp	x26, x25, [sp, #0x10]
100b5e350:     	stp	x24, x23, [sp, #0x20]
100b5e354:     	stp	x22, x21, [sp, #0x30]
100b5e358:     	stp	x20, x19, [sp, #0x40]
100b5e35c:     	stp	x29, x30, [sp, #0x50]
100b5e360:     	add	x29, sp, #0x50
100b5e364:     	sub	sp, sp, #0x2e0
100b5e368:     	mov	x28, x3
100b5e36c:     	mov	x20, x2
100b5e370:     	str	x1, [sp, #0xa8]
100b5e374:     	mov	x24, x0
100b5e378:     	adrp	x8, 0x106369000 <_zlibVersion+0x106369000>
100b5e37c:     	ldr	x8, [x8, #0x7f8]
100b5e380:     	ldr	x8, [x8]
100b5e384:     	stur	x8, [x29, #-0x60]
100b5e388:     	adrp	x0, 0x106d8a000 <__PyRuntime+0x27ff8>
100b5e38c:     	add	x0, x0, #0xc38
100b5e390:     	ldr	x8, [x0]
100b5e394:     	blr	x8
100b5e398:     	mov	x19, x0
100b5e39c:     	ldp	q0, q1, [x0, #0xa0]
100b5e3a0:     	stp	q0, q1, [sp, #0x190]
100b5e3a4:     	ldr	x8, [x0, #0xc0]
100b5e3a8:     	str	x8, [sp, #0x1b0]
100b5e3ac:     	ldp	q0, q1, [x0, #0x60]
100b5e3b0:     	stp	q0, q1, [sp, #0x150]
100b5e3b4:     	ldp	q1, q0, [x0, #0x80]
100b5e3b8:     	stp	q1, q0, [sp, #0x170]
100b5e3bc:     	ldp	q0, q1, [x0, #0x20]
100b5e3c0:     	stp	q0, q1, [sp, #0x110]
100b5e3c4:     	ldp	q1, q0, [x0, #0x40]
100b5e3c8:     	stp	q1, q0, [sp, #0x130]
100b5e3cc:     	ldp	q1, q0, [x0]
100b5e3d0:     	stp	q1, q0, [sp, #0xf0]
100b5e3d4:     	stp	xzr, xzr, [x0, #0x40]
100b5e3d8:     	strb	wzr, [x0, #0x50]
100b5e3dc:     	str	xzr, [x0, #0xb0]
100b5e3e0:     	strb	wzr, [x0, #0xb8]
100b5e3e4:     	strh	wzr, [x0, #0xba]
100b5e3e8:     	strb	wzr, [x0, #0xc0]
100b5e3ec:     	movi.16b	v0, #0x0
100b5e3f0:     	stur	q0, [x0, #0x58]
100b5e3f4:     	stur	q0, [x0, #0x68]
100b5e3f8:     	stur	q0, [x0, #0x78]
100b5e3fc:     	strh	wzr, [x0, #0x88]
100b5e400:     	stur	xzr, [x0, #0x8c]
100b5e404:     	stp	xzr, xzr, [x0, #0x98]
100b5e408:     	stur	xzr, [x0, #0xa6]
100b5e40c:     	stp	q0, q0, [x0]
100b5e410:     	str	q0, [x0, #0x20]
100b5e414:     	stur	q0, [x0, #0x2e]
100b5e418:     	cbz	x24, 0x100b5e4b4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16c>
100b5e41c:     	ldr	x8, [sp, #0xa8]
100b5e420:     	cbz	x8, 0x100b5e4b4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16c>
100b5e424:     	cbz	x20, 0x100b5e4b4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16c>
100b5e428:     	ldrh	w8, [x20, #0x10]
100b5e42c:     	cmp	w8, #0x1
100b5e430:     	b.ne	0x100b5e4b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x170>
100b5e434:     	ldrh	w8, [x20, #0x12]
100b5e438:     	cmp	w8, #0x1
100b5e43c:     	b.ne	0x100b5e4b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x170>
100b5e440:     	ldrb	w8, [x20, #0x78]
100b5e444:     	cmp	w8, #0x1
100b5e448:     	b.ne	0x100b5e4b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x170>
100b5e44c:     	ldrb	w8, [x20, #0x79]
100b5e450:     	cmp	w8, #0x2
100b5e454:     	b.ne	0x100b5e4b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x170>
100b5e458:     	ldr	x8, [x20, #0x58]
100b5e45c:     	cbz	x8, 0x100b5e4b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x170>
100b5e460:     	ldr	x8, [x20, #0x60]
100b5e464:     	cbz	x8, 0x100b5e4b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x170>
100b5e468:     	ldr	x8, [x20, #0x68]
100b5e46c:     	cbz	x8, 0x100b5e4b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x170>
100b5e470:     	ldr	x8, [sp, #0xa8]
100b5e474:     	stp	x24, x8, [x19]
100b5e478:     	ldp	q0, q1, [x20]
100b5e47c:     	ldr	q2, [x20, #0x20]
100b5e480:     	stp	q1, q2, [x19, #0x20]
100b5e484:     	stur	q0, [x19, #0x10]
100b5e488:     	ldp	q0, q1, [x20, #0x30]
100b5e48c:     	ldp	q2, q3, [x20, #0x50]
100b5e490:     	stp	q2, q3, [x19, #0x60]
100b5e494:     	stp	q0, q1, [x19, #0x40]
100b5e498:     	ldp	q0, q1, [x20, #0x70]
100b5e49c:     	ldp	q2, q3, [x20, #0x90]
100b5e4a0:     	stp	q2, q3, [x19, #0xa0]
100b5e4a4:     	stp	q0, q1, [x19, #0x80]
100b5e4a8:     	mov	w8, #0x1                ; =1
100b5e4ac:     	strb	w8, [x19, #0xc0]
100b5e4b0:     	b	0x100b5e4b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x170>
100b5e4b4:     	cbz	x20, 0x100b5e5a4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x25c>
100b5e4b8:     	ldrb	w8, [x20, #0x78]
100b5e4bc:     	cmp	w8, #0x1
100b5e4c0:     	b.ne	0x100b5e5a4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x25c>
100b5e4c4:     	ldrb	w8, [x20, #0x79]
100b5e4c8:     	sub	w9, w8, #0x3
100b5e4cc:     	ldr	x8, [sp, #0xa8]
100b5e4d0:     	add	x8, x8, #0x118
100b5e4d4:     	cmp	w9, #0x1
100b5e4d8:     	b.hi	0x100b5e4f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a8>
100b5e4dc:     	cmp	x8, x28
100b5e4e0:     	b.eq	0x100b5e4f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a8>
100b5e4e4:     	mov	w8, #0x3                ; =3
100b5e4e8:     	str	w8, [sp, #0xc4]
100b5e4ec:     	b	0x100b5fde4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a9c>
100b5e4f0:     	cmp	w9, #0x1
100b5e4f4:     	b.hi	0x100b5e5a4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x25c>
100b5e4f8:     	ldr	x23, [x8]
100b5e4fc:     	cbnz	x23, 0x100b5e50c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c4>
100b5e500:     	b	0x100b5e4e4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x19c>
100b5e504:     	ldr	x23, [x23]
100b5e508:     	cbz	x23, 0x100b5e4e4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x19c>
100b5e50c:     	cbz	x20, 0x100b5e504 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5e510:     	ldr	w8, [x23, #0x10]
100b5e514:     	cmp	w8, #0x3
100b5e518:     	b.ne	0x100b5e504 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5e51c:     	ldrb	w8, [x20, #0x78]
100b5e520:     	cmp	w8, #0x1
100b5e524:     	b.ne	0x100b5e504 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5e528:     	ldrb	w8, [x20, #0x79]
100b5e52c:     	sub	w8, w8, #0x3
100b5e530:     	cmp	w8, #0x1
100b5e534:     	b.hi	0x100b5e504 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5e538:     	ldr	x8, [x23, #0x50]
100b5e53c:     	ldr	x9, [x20, #0x58]
100b5e540:     	cmp	x8, x9
100b5e544:     	b.ne	0x100b5e504 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5e548:     	ldr	x8, [x23, #0x58]
100b5e54c:     	ldr	x9, [x20, #0x60]
100b5e550:     	cmp	x8, x9
100b5e554:     	b.ne	0x100b5e504 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5e558:     	ldr	x8, [x23, #0x88]
100b5e55c:     	ldr	x9, [x20, #0x68]
100b5e560:     	cmp	x8, x9
100b5e564:     	b.ne	0x100b5e504 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5e568:     	ldr	w8, [x23, #0x90]
100b5e56c:     	ldr	w9, [x20, #0x70]
100b5e570:     	cmp	w8, w9
100b5e574:     	b.ne	0x100b5e504 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5e578:     	ldr	w8, [x23, #0x94]
100b5e57c:     	ldr	w9, [x20, #0x74]
100b5e580:     	cmp	w8, w9
100b5e584:     	b.ne	0x100b5e504 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5e588:     	ldr	x0, [sp, #0xa8]
100b5e58c:     	mov	x1, x23
100b5e590:     	bl	0x100b51f7c <__ZL39wm_ipad_pencil_paint_handler_registeredP8wmWindowPK17wmEventHandler_Op>
100b5e594:     	tbz	w0, #0x0, 0x100b5e504 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5e598:     	mov	w8, #0x1                ; =1
100b5e59c:     	str	w8, [sp, #0xb4]
100b5e5a0:     	b	0x100b5e5a8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x260>
100b5e5a4:     	str	wzr, [sp, #0xb4]
100b5e5a8:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b5e5ac:     	add	x8, x8, #0x28
100b5e5b0:     	ldrb	w8, [x8, #0xc40]
100b5e5b4:     	tbnz	w8, #0x4, 0x100b5e5c0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x278>
100b5e5b8:     	str	wzr, [sp, #0x9c]
100b5e5bc:     	b	0x100b5e5d4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x28c>
100b5e5c0:     	ldrh	w8, [x20, #0x10]
100b5e5c4:     	cmp	w8, #0x4
100b5e5c8:     	ccmp	w8, #0x11, #0x4, ne
100b5e5cc:     	cset	w8, ne
100b5e5d0:     	str	w8, [sp, #0x9c]
100b5e5d4:     	mov	x0, x24
100b5e5d8:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b5e5dc:     	str	x0, [sp, #0x90]
100b5e5e0:     	cbz	x28, 0x100b5fda0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a58>
100b5e5e4:     	ldr	x8, [x28]
100b5e5e8:     	str	x8, [sp, #0xc8]
100b5e5ec:     	cbz	x8, 0x100b5fdcc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a84>
100b5e5f0:     	str	wzr, [sp, #0xc4]
100b5e5f4:     	b	0x100b5e600 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2b8>
100b5e5f8:     	ldr	x8, [sp, #0xc8]
100b5e5fc:     	cbz	x8, 0x100b5fda8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a60>
100b5e600:     	ldr	x27, [sp, #0xc8]
100b5e604:     	ldr	x8, [x28]
100b5e608:     	cbz	x8, 0x100b5fda8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a60>
100b5e60c:     	ldr	x8, [x27]
100b5e610:     	str	x8, [sp, #0xc8]
100b5e614:     	ldr	w8, [sp, #0xb4]
100b5e618:     	cbz	w8, 0x100b5e6a8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x360>
100b5e61c:     	cbz	x20, 0x100b5e5f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2b0>
100b5e620:     	ldr	w8, [x27, #0x10]
100b5e624:     	cmp	w8, #0x3
100b5e628:     	b.ne	0x100b5e5f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2b0>
100b5e62c:     	ldrb	w8, [x20, #0x78]
100b5e630:     	cmp	w8, #0x1
100b5e634:     	b.ne	0x100b5e5f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2b0>
100b5e638:     	ldrb	w8, [x20, #0x79]
100b5e63c:     	sub	w8, w8, #0x3
100b5e640:     	cmp	w8, #0x1
100b5e644:     	b.hi	0x100b5e5f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2b0>
100b5e648:     	ldr	x8, [x27, #0x50]
100b5e64c:     	ldr	x9, [x20, #0x58]
100b5e650:     	cmp	x8, x9
100b5e654:     	b.ne	0x100b5e5f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2b0>
100b5e658:     	ldr	x8, [x27, #0x58]
100b5e65c:     	ldr	x9, [x20, #0x60]
100b5e660:     	cmp	x8, x9
100b5e664:     	b.ne	0x100b5e5f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2b0>
100b5e668:     	ldr	x8, [x27, #0x88]
100b5e66c:     	ldr	x9, [x20, #0x68]
100b5e670:     	cmp	x8, x9
100b5e674:     	b.ne	0x100b5e5f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2b0>
100b5e678:     	ldr	w8, [x27, #0x90]
100b5e67c:     	ldr	w9, [x20, #0x70]
100b5e680:     	cmp	w8, w9
100b5e684:     	b.ne	0x100b5e5f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2b0>
100b5e688:     	ldr	w8, [x27, #0x94]
100b5e68c:     	ldr	w9, [x20, #0x74]
100b5e690:     	cmp	w8, w9
100b5e694:     	b.ne	0x100b5e5f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2b0>
100b5e698:     	ldr	x0, [sp, #0xa8]
100b5e69c:     	mov	x1, x27
100b5e6a0:     	bl	0x100b51f7c <__ZL39wm_ipad_pencil_paint_handler_registeredP8wmWindowPK17wmEventHandler_Op>
100b5e6a4:     	tbz	w0, #0x0, 0x100b5e5f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2b0>
100b5e6a8:     	ldr	w9, [x27, #0x14]
100b5e6ac:     	tbnz	w9, #0x7, 0x100b5fc88 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1940>
100b5e6b0:     	ldr	x22, [x27, #0x18]
100b5e6b4:     	cbz	x22, 0x100b5e6e8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x3a0>
100b5e6b8:     	mov	x0, x24
100b5e6bc:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b5e6c0:     	mov	x21, x0
100b5e6c4:     	mov	x0, x24
100b5e6c8:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5e6cc:     	mov	x2, x0
100b5e6d0:     	ldr	x0, [sp, #0xa8]
100b5e6d4:     	mov	x1, x21
100b5e6d8:     	mov	x3, x20
100b5e6dc:     	blr	x22
100b5e6e0:     	cbz	w0, 0x100b5fc88 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1940>
100b5e6e4:     	ldr	w9, [x27, #0x14]
100b5e6e8:     	ldrh	w8, [x20, #0x10]
100b5e6ec:     	cmp	w8, #0x104
100b5e6f0:     	and	w10, w8, #0xfff0
100b5e6f4:     	mov	w11, #0x110             ; =272
100b5e6f8:     	ccmp	w10, w11, #0x4, ne
100b5e6fc:     	cset	w10, eq
100b5e700:     	str	w10, [sp, #0x8c]
100b5e704:     	and	w9, w9, #0x1
100b5e708:     	ldr	w10, [sp, #0xc4]
100b5e70c:     	orr	w10, w9, w10
100b5e710:     	str	w10, [sp, #0xc4]
100b5e714:     	ldr	w9, [x27, #0x10]
100b5e718:     	cmp	w9, #0x2
100b5e71c:     	b.le	0x100b5e758 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x410>
100b5e720:     	cmp	w9, #0x3
100b5e724:     	b.eq	0x100b5e820 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x4d8>
100b5e728:     	cmp	w9, #0x4
100b5e72c:     	b.eq	0x100b5e860 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x518>
100b5e730:     	cmp	w9, #0x5
100b5e734:     	b.ne	0x100b5e9c4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x67c>
100b5e738:     	ldr	x8, [x27, #0x38]
100b5e73c:     	cbz	x8, 0x100b5ea28 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x6e0>
100b5e740:     	add	x3, sp, #0xd0
100b5e744:     	ldr	x0, [sp, #0x90]
100b5e748:     	ldr	x1, [sp, #0xa8]
100b5e74c:     	mov	x2, x27
100b5e750:     	blr	x8
100b5e754:     	b	0x100b5ea54 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x70c>
100b5e758:     	cmp	w9, #0x1
100b5e75c:     	b.eq	0x100b5e9b4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x66c>
100b5e760:     	cmp	w9, #0x2
100b5e764:     	b.ne	0x100b5e9c4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x67c>
100b5e768:     	ldr	x8, [sp, #0x90]
100b5e76c:     	ldr	x8, [x8, #0x5c0]
100b5e770:     	ldrb	w8, [x8, #0x10]
100b5e774:     	tbnz	w8, #0x0, 0x100b5fc68 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1920>
100b5e778:     	mov	x0, x24
100b5e77c:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b5e780:     	mov	x26, x0
100b5e784:     	mov	x0, x24
100b5e788:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5e78c:     	mov	x25, x0
100b5e790:     	mov	x0, x24
100b5e794:     	bl	0x1000b4458 <__Z19CTX_wm_region_popupPK8bContext>
100b5e798:     	mov	x23, x0
100b5e79c:     	ldrh	w8, [x20, #0x10]
100b5e7a0:     	cmp	w8, #0xf
100b5e7a4:     	cset	w9, lo
100b5e7a8:     	ldrb	w10, [x27, #0x14]
100b5e7ac:     	tbnz	w10, #0x1, 0x100b5e7d0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x488>
100b5e7b0:     	cmp	w8, #0x13
100b5e7b4:     	b.hi	0x100b5f868 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1520>
100b5e7b8:     	mov	w10, #0x1               ; =1
100b5e7bc:     	lsl	w10, w10, w8
100b5e7c0:     	mov	w11, #0x18e             ; =398
100b5e7c4:     	movk	w11, #0xc, lsl #16
100b5e7c8:     	tst	w10, w11
100b5e7cc:     	b.eq	0x100b5f868 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1520>
100b5e7d0:     	mov	w10, #0x4c00            ; =19456
100b5e7d4:     	lsr	w10, w10, w8
100b5e7d8:     	and	w21, w9, w10
100b5e7dc:     	adrp	x9, 0x107ef7000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b5e7e0:     	ldrb	w9, [x9, #0x830]
100b5e7e4:     	cmp	w9, #0x1
100b5e7e8:     	b.ne	0x100b5e80c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x4c4>
100b5e7ec:     	tbnz	w21, #0x0, 0x100b5e818 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x4d0>
100b5e7f0:     	cmp	w8, #0x104
100b5e7f4:     	b.eq	0x100b5f53c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x11f4>
100b5e7f8:     	and	w9, w8, #0xfff0
100b5e7fc:     	cmp	w9, #0x110
100b5e800:     	b.eq	0x100b5f53c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x11f4>
100b5e804:     	adrp	x9, 0x107ef7000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b5e808:     	strb	wzr, [x9, #0x830]
100b5e80c:     	mov	w9, #0x5020             ; =20512
100b5e810:     	cmp	w8, w9
100b5e814:     	b.ne	0x100b5f53c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x11f4>
100b5e818:     	mov	w8, #0x0                ; =0
100b5e81c:     	b	0x100b5f6c0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1378>
100b5e820:     	ldrb	w9, [x27, #0x28]
100b5e824:     	cmp	w9, #0x1
100b5e828:     	b.ne	0x100b5e9e0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x698>
100b5e82c:     	ldr	x9, [sp, #0x90]
100b5e830:     	ldr	x9, [x9, #0x5c0]
100b5e834:     	ldrb	w9, [x9, #0x10]
100b5e838:     	tbnz	w9, #0x0, 0x100b5fc68 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1920>
100b5e83c:     	mov	w9, #0x5020             ; =20512
100b5e840:     	cmp	w8, w9
100b5e844:     	b.ne	0x100b5e858 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x510>
100b5e848:     	ldr	x8, [x27, #0x20]
100b5e84c:     	ldr	x9, [x20, #0x88]
100b5e850:     	cmp	x8, x9
100b5e854:     	b.eq	0x100b5f850 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1508>
100b5e858:     	mov	w0, #0x0                ; =0
100b5e85c:     	b	0x100b5ea04 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x6bc>
100b5e860:     	ldr	x9, [sp, #0x90]
100b5e864:     	ldr	x9, [x9, #0x5c0]
100b5e868:     	ldrb	w9, [x9, #0x10]
100b5e86c:     	tbnz	w9, #0x0, 0x100b5fc68 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1920>
100b5e870:     	mov	w9, #0x5023             ; =20515
100b5e874:     	cmp	w8, w9
100b5e878:     	b.ne	0x100b5fc68 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1920>
100b5e87c:     	ldr	x8, [x27, #0x20]
100b5e880:     	ldr	x23, [x8]
100b5e884:     	cbnz	x23, 0x100b5e894 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x54c>
100b5e888:     	b	0x100b5fc68 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1920>
100b5e88c:     	ldr	x23, [x23]
100b5e890:     	cbz	x23, 0x100b5fc68 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1920>
100b5e894:     	ldrh	w8, [x20, #0x80]
100b5e898:     	cmp	w8, #0x3
100b5e89c:     	b.ne	0x100b5e88c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x544>
100b5e8a0:     	mov	x0, x24
100b5e8a4:     	bl	0x1016651f0 <__Z19ED_undo_group_beginP8bContext>
100b5e8a8:     	ldr	x26, [x20, #0x88]
100b5e8ac:     	ldr	x25, [x26]
100b5e8b0:     	cbz	x25, 0x100b5e99c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x654>
100b5e8b4:     	ldr	x21, [x25]
100b5e8b8:     	ldr	x8, [x23, #0x10]
100b5e8bc:     	mov	x0, x24
100b5e8c0:     	mov	x1, x25
100b5e8c4:     	mov	x2, x20
100b5e8c8:     	blr	x8
100b5e8cc:     	cbnz	w0, 0x100b5e8dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x594>
100b5e8d0:     	mov	x25, x21
100b5e8d4:     	cbnz	x21, 0x100b5e8b4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x56c>
100b5e8d8:     	b	0x100b5e99c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x654>
100b5e8dc:     	mov	x0, x24
100b5e8e0:     	mov	x1, x25
100b5e8e4:     	mov	x2, x23
100b5e8e8:     	bl	0x100b46984 <__Z15wm_drop_prepareP8bContextP6wmDragP9wmDropBox>
100b5e8ec:     	mov	x0, x26
100b5e8f0:     	mov	x1, x25
100b5e8f4:     	bl	0x10078fea0 <__Z11BLI_remlinkP8ListBasePv>
100b5e8f8:     	stp	xzr, xzr, [x29, #-0xd0]
100b5e8fc:     	sub	x0, x29, #0xd0
100b5e900:     	mov	x1, x25
100b5e904:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b5e908:     	sub	x8, x29, #0xd0
100b5e90c:     	str	x8, [x20, #0x88]
100b5e910:     	mov	x0, x23
100b5e914:     	bl	0x100b46a8c <__Z28wm_drop_operator_context_getPK9wmDropBox>
100b5e918:     	ldr	x1, [x23, #0x60]
100b5e91c:     	cbz	x1, 0x100b5e940 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x5f8>
100b5e920:     	mov	x4, x0
100b5e924:     	ldr	x2, [x23, #0xb0]
100b5e928:     	mov	x0, x24
100b5e92c:     	mov	x3, #0x0                ; =0
100b5e930:     	mov	w5, #0x0                ; =0
100b5e934:     	mov	x6, x20
100b5e938:     	bl	0x100b4ebdc <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent>
100b5e93c:     	tbz	w0, #0x1, 0x100b5e95c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x614>
100b5e940:     	ldr	x21, [x23, #0x38]
100b5e944:     	cbz	x21, 0x100b5e95c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x614>
100b5e948:     	mov	x0, x24
100b5e94c:     	bl	0x1000b4c78 <__Z13CTX_data_mainPK8bContext>
100b5e950:     	mov	x1, x25
100b5e954:     	mov	x2, x23
100b5e958:     	blr	x21
100b5e95c:     	mov	x0, x26
100b5e960:     	bl	0x100b46950 <__Z17WM_drag_free_listP8ListBase>
100b5e964:     	sub	x0, x29, #0xd0
100b5e968:     	bl	0x100b46950 <__Z17WM_drag_free_listP8ListBase>
100b5e96c:     	str	wzr, [x20, #0x80]
100b5e970:     	str	xzr, [x20, #0x88]
100b5e974:     	mov	x0, x24
100b5e978:     	mov	x1, x25
100b5e97c:     	mov	x2, x23
100b5e980:     	bl	0x100b46a94 <__Z11wm_drop_endP8bContextP6wmDragP9wmDropBox>
100b5e984:     	mov	x0, x24
100b5e988:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5e98c:     	ldr	w8, [sp, #0xc4]
100b5e990:     	orr	w8, w8, #0x1
100b5e994:     	str	w8, [sp, #0xc4]
100b5e998:     	cbz	x0, 0x100b5fde4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a9c>
100b5e99c:     	ldr	x0, [sp, #0x90]
100b5e9a0:     	ldr	x1, [sp, #0xa8]
100b5e9a4:     	bl	0x100b46060 <__Z13wm_drags_exitP15wmWindowManagerP8wmWindow>
100b5e9a8:     	mov	x0, x24
100b5e9ac:     	bl	0x10166520c <__Z17ED_undo_group_endP8bContext>
100b5e9b0:     	b	0x100b5e88c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x544>
100b5e9b4:     	ldr	w9, [sp, #0x8c]
100b5e9b8:     	tbz	w9, #0x0, 0x100b5ea10 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x6c8>
100b5e9bc:     	mov	w22, #0x0               ; =0
100b5e9c0:     	b	0x100b5fc5c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1914>
100b5e9c4:     	adrp	x0, 0x104bd4000 <__ZL3hex+0x45cd>
100b5e9c8:     	add	x0, x0, #0x32c
100b5e9cc:     	mov	w1, #0x188c             ; =6284
100b5e9d0:     	adrp	x2, 0x104bd5000 <__ZL3hex+0x55cd>
100b5e9d4:     	add	x2, x2, #0xe1
100b5e9d8:     	bl	0x10072af4c <__Z29_BLI_assert_unreachable_printPKciS0_>
100b5e9dc:     	b	0x100b5fc68 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1920>
100b5e9e0:     	mov	x0, x24
100b5e9e4:     	mov	x1, x28
100b5e9e8:     	mov	x2, x27
100b5e9ec:     	mov	x3, x20
100b5e9f0:     	mov	x4, #0x0                ; =0
100b5e9f4:     	mov	x5, #0x0                ; =0
100b5e9f8:     	mov	w6, #0x0                ; =0
100b5e9fc:     	mov	w7, #0x0                ; =0
100b5ea00:     	bl	0x100b524d0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch>
100b5ea04:     	ldr	w8, [sp, #0xc4]
100b5ea08:     	orr	w8, w0, w8
100b5ea0c:     	b	0x100b5fc64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x191c>
100b5ea10:     	sub	w9, w8, #0xd4
100b5ea14:     	cmp	w9, #0x6
100b5ea18:     	str	x28, [sp, #0x80]
100b5ea1c:     	b.hs	0x100b5f424 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x10dc>
100b5ea20:     	mov	w22, #0x1               ; =1
100b5ea24:     	b	0x100b5f434 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x10ec>
100b5ea28:     	movi.16b	v0, #0x0
100b5ea2c:     	stp	q0, q0, [sp, #0xd0]
100b5ea30:     	ldr	x1, [x27, #0x20]
100b5ea34:     	ldr	x0, [sp, #0x90]
100b5ea38:     	bl	0x100b76cf4 <__Z16WM_keymap_activePK15wmWindowManagerP8wmKeyMap>
100b5ea3c:     	cbz	x0, 0x100b5ea54 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x70c>
100b5ea40:     	ldrsw	x8, [sp, #0xe8]
100b5ea44:     	add	w9, w8, #0x1
100b5ea48:     	str	w9, [sp, #0xe8]
100b5ea4c:     	add	x9, sp, #0xd0
100b5ea50:     	str	x0, [x9, x8, lsl #3]
100b5ea54:     	ldrh	w8, [x20, #0x10]
100b5ea58:     	cmp	w8, #0x1
100b5ea5c:     	b.ne	0x100b5ea84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x73c>
100b5ea60:     	ldrh	w8, [x20, #0x12]
100b5ea64:     	cmp	w8, #0x5
100b5ea68:     	b.ne	0x100b5ea84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x73c>
100b5ea6c:     	ldrb	w8, [x20, #0x7c]
100b5ea70:     	tbz	w8, #0x7, 0x100b5ea84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x73c>
100b5ea74:     	ldrb	w8, [x20, #0x2a]
100b5ea78:     	cbnz	w8, 0x100b5ea84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x73c>
100b5ea7c:     	ldrh	w8, [x20, #0x2c]
100b5ea80:     	cbz	w8, 0x100b5fcd8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1990>
100b5ea84:     	ldr	w8, [sp, #0xe8]
100b5ea88:     	str	x28, [sp, #0x80]
100b5ea8c:     	str	x24, [sp, #0xa0]
100b5ea90:     	ldrh	w9, [x20, #0x10]
100b5ea94:     	str	w9, [sp, #0x54]
100b5ea98:     	cmp	w8, #0x1
100b5ea9c:     	b.lt	0x100b5f3d4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x108c>
100b5eaa0:     	mov	x28, #0x0               ; =0
100b5eaa4:     	mov	w24, #0x0               ; =0
100b5eaa8:     	add	x8, sp, #0xd0
100b5eaac:     	ldr	x21, [x8, x28, lsl #3]
100b5eab0:     	cbz	x21, 0x100b5eb38 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7f0>
100b5eab4:     	ldr	w8, [sp, #0x9c]
100b5eab8:     	cbz	w8, 0x100b5eafc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7b4>
100b5eabc:     	add	x9, x21, #0x30
100b5eac0:     	adrp	x8, 0x104bd5000 <__ZL3hex+0x55cd>
100b5eac4:     	add	x8, x8, #0x10f
100b5eac8:     	stp	x8, x9, [sp]
100b5eacc:     	adrp	x0, 0x104bd5000 <__ZL3hex+0x55cd>
100b5ead0:     	add	x0, x0, #0xf7
100b5ead4:     	bl	0x104b765dc <_zlibVersion+0x104b765dc>
100b5ead8:     	ldr	x0, [sp, #0xa0]
100b5eadc:     	mov	x22, x21
100b5eae0:     	mov	x1, x21
100b5eae4:     	bl	0x100b7546c <__Z14WM_keymap_pollP8bContextP8wmKeyMap>
100b5eae8:     	tbz	w0, #0x0, 0x100b5eb2c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7e4>
100b5eaec:     	adrp	x0, 0x104b95000 <_zlibVersion+0x104b95000>
100b5eaf0:     	add	x0, x0, #0xcae
100b5eaf4:     	bl	0x104b767c8 <_zlibVersion+0x104b767c8>
100b5eaf8:     	b	0x100b5eb10 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7c8>
100b5eafc:     	ldr	x0, [sp, #0xa0]
100b5eb00:     	mov	x22, x21
100b5eb04:     	mov	x1, x21
100b5eb08:     	bl	0x100b7546c <__Z14WM_keymap_pollP8bContextP8wmKeyMap>
100b5eb0c:     	tbz	w0, #0x0, 0x100b5eb38 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7f0>
100b5eb10:     	ldr	x26, [x22, #0x10]
100b5eb14:     	cbz	x26, 0x100b5eb38 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7f0>
100b5eb18:     	str	wzr, [sp, #0xb8]
100b5eb1c:     	str	x22, [sp, #0x60]
100b5eb20:     	add	x8, x22, #0x30
100b5eb24:     	str	x8, [sp, #0x78]
100b5eb28:     	b	0x100b5eb6c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x824>
100b5eb2c:     	adrp	x0, 0x104bd5000 <__ZL3hex+0x55cd>
100b5eb30:     	add	x0, x0, #0x764
100b5eb34:     	bl	0x104b767c8 <_zlibVersion+0x104b767c8>
100b5eb38:     	str	wzr, [sp, #0xb8]
100b5eb3c:     	ldr	w8, [sp, #0xb8]
100b5eb40:     	orr	w24, w8, w24
100b5eb44:     	tbnz	w24, #0x0, 0x100b5f3d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1090>
100b5eb48:     	add	x28, x28, #0x1
100b5eb4c:     	ldrsw	x8, [sp, #0xe8]
100b5eb50:     	cmp	x28, x8
100b5eb54:     	b.lt	0x100b5eaa8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x760>
100b5eb58:     	b	0x100b5f3d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1090>
100b5eb5c:     	and	w21, w9, #0x1
100b5eb60:     	cbnz	w21, 0x100b5f3bc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1074>
100b5eb64:     	ldr	x26, [x26]
100b5eb68:     	cbz	x26, 0x100b5eb3c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7f4>
100b5eb6c:     	ldrb	w8, [x26, #0xac]
100b5eb70:     	tbnz	w8, #0x0, 0x100b5eb64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x81c>
100b5eb74:     	tbz	w8, #0x4, 0x100b5eb80 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x838>
100b5eb78:     	ldr	w8, [x20, #0x7c]
100b5eb7c:     	tbnz	w8, #0x1, 0x100b5eb64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x81c>
100b5eb80:     	ldrsh	w0, [x26, #0x9a]
100b5eb84:     	bl	0x100b4d62c <__Z20WM_userdef_event_mapi>
100b5eb88:     	cmn	w0, #0x1
100b5eb8c:     	b.eq	0x100b5ec08 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8c0>
100b5eb90:     	cmn	w0, #0x2
100b5eb94:     	b.ne	0x100b5ebd0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x888>
100b5eb98:     	ldrh	w9, [x20, #0x12]
100b5eb9c:     	ldrh	w8, [x20, #0x10]
100b5eba0:     	cmp	w9, #0x1
100b5eba4:     	b.ne	0x100b5ec00 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8b8>
100b5eba8:     	sub	w9, w8, #0x20
100b5ebac:     	cmp	w9, #0xe0
100b5ebb0:     	b.lo	0x100b5ebc4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x87c>
100b5ebb4:     	sub	w9, w8, #0x12c
100b5ebb8:     	and	w9, w9, #0xffff
100b5ebbc:     	cmp	w9, #0x17
100b5ebc0:     	b.hi	0x100b5ec00 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8b8>
100b5ebc4:     	ldrb	w9, [x20, #0x24]
100b5ebc8:     	cbnz	w9, 0x100b5ed2c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x9e4>
100b5ebcc:     	b	0x100b5ec00 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8b8>
100b5ebd0:     	and	w9, w0, #0xfffffffe
100b5ebd4:     	ldrh	w8, [x20, #0x10]
100b5ebd8:     	cmp	w9, #0x1a
100b5ebdc:     	b.ne	0x100b5ec00 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8b8>
100b5ebe0:     	cmp	w8, #0x1
100b5ebe4:     	b.ne	0x100b5eb64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x81c>
100b5ebe8:     	ldr	w8, [x20, #0x30]
100b5ebec:     	cmp	w0, #0x1a
100b5ebf0:     	b.ne	0x100b5eecc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xb84>
100b5ebf4:     	cmp	w8, #0x1
100b5ebf8:     	b.ne	0x100b5eb64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x81c>
100b5ebfc:     	b	0x100b5ec08 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8c0>
100b5ec00:     	cmp	w0, w8, sxth
100b5ec04:     	b.ne	0x100b5eb64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x81c>
100b5ec08:     	ldrsb	w8, [x26, #0x9c]
100b5ec0c:     	cmn	w8, #0x1
100b5ec10:     	b.eq	0x100b5ec40 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8f8>
100b5ec14:     	ldrh	w9, [x20, #0x12]
100b5ec18:     	cmp	w9, w8, uxth
100b5ec1c:     	b.ne	0x100b5eb64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x81c>
100b5ec20:     	cmp	w8, #0x5
100b5ec24:     	b.ne	0x100b5ec40 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8f8>
100b5ec28:     	ldrb	w8, [x26, #0x9d]
100b5ec2c:     	cmp	w8, #0xff
100b5ec30:     	b.eq	0x100b5ec40 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8f8>
100b5ec34:     	ldrb	w9, [x20, #0x2b]
100b5ec38:     	cmp	w8, w9
100b5ec3c:     	b.ne	0x100b5eb64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x81c>
100b5ec40:     	ldrb	w8, [x26, #0x9e]
100b5ec44:     	cmp	w8, #0xff
100b5ec48:     	b.eq	0x100b5ec6c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x924>
100b5ec4c:     	ldrb	w9, [x20, #0x2a]
100b5ec50:     	and	w9, w9, #0x1
100b5ec54:     	cmp	w9, w8
100b5ec58:     	b.eq	0x100b5ec6c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x924>
100b5ec5c:     	ldrh	w8, [x20, #0x10]
100b5ec60:     	and	w8, w8, #0xfffe
100b5ec64:     	cmp	w8, #0xd8
100b5ec68:     	b.ne	0x100b5eb64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x81c>
100b5ec6c:     	ldrb	w8, [x26, #0x9f]
100b5ec70:     	cmp	w8, #0xff
100b5ec74:     	b.eq	0x100b5ec9c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x954>
100b5ec78:     	ldrb	w9, [x20, #0x2a]
100b5ec7c:     	ubfx	w9, w9, #1, #1
100b5ec80:     	cmp	w9, w8
100b5ec84:     	b.eq	0x100b5ec9c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x954>
100b5ec88:     	ldrh	w8, [x20, #0x10]
100b5ec8c:     	cmp	w8, #0xd7
100b5ec90:     	b.eq	0x100b5ec9c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x954>
100b5ec94:     	cmp	w8, #0xd4
100b5ec98:     	b.ne	0x100b5eb64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x81c>
100b5ec9c:     	ldrb	w8, [x26, #0xa0]
100b5eca0:     	cmp	w8, #0xff
100b5eca4:     	b.eq	0x100b5ecc8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x980>
100b5eca8:     	ldrb	w9, [x20, #0x2a]
100b5ecac:     	ubfx	w9, w9, #2, #1
100b5ecb0:     	cmp	w9, w8
100b5ecb4:     	b.eq	0x100b5ecc8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x980>
100b5ecb8:     	ldrh	w8, [x20, #0x10]
100b5ecbc:     	sub	w8, w8, #0xd5
100b5ecc0:     	cmp	w8, #0x1
100b5ecc4:     	b.hi	0x100b5eb64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x81c>
100b5ecc8:     	ldrb	w8, [x26, #0xa1]
100b5eccc:     	cmp	w8, #0xff
100b5ecd0:     	b.eq	0x100b5ecf0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x9a8>
100b5ecd4:     	ldrb	w9, [x20, #0x2a]
100b5ecd8:     	ubfx	w9, w9, #3, #1
100b5ecdc:     	cmp	w9, w8
100b5ece0:     	b.eq	0x100b5ecf0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x9a8>
100b5ece4:     	ldrh	w8, [x20, #0x10]
100b5ece8:     	cmp	w8, #0xac
100b5ecec:     	b.ne	0x100b5eb64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x81c>
100b5ecf0:     	ldrb	w8, [x26, #0xa2]
100b5ecf4:     	cmp	w8, #0xff
100b5ecf8:     	b.eq	0x100b5ed18 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x9d0>
100b5ecfc:     	ldrb	w9, [x20, #0x2a]
100b5ed00:     	ubfx	w9, w9, #4, #1
100b5ed04:     	cmp	w9, w8
100b5ed08:     	b.eq	0x100b5ed18 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x9d0>
100b5ed0c:     	ldrh	w8, [x20, #0x10]
100b5ed10:     	cmp	w8, #0xb3
100b5ed14:     	b.ne	0x100b5eb64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x81c>
100b5ed18:     	ldrh	w8, [x26, #0xaa]
100b5ed1c:     	cbz	w8, 0x100b5ed2c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x9e4>
100b5ed20:     	ldrh	w9, [x20, #0x2c]
100b5ed24:     	cmp	w9, w8
100b5ed28:     	b.ne	0x100b5eb64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x81c>
100b5ed2c:     	ldp	x9, x8, [x27, #0x28]
100b5ed30:     	stp	x8, x9, [sp, #0x68]
100b5ed34:     	ldrb	w8, [x20, #0x2a]
100b5ed38:     	cmp	w8, #0x2
100b5ed3c:     	cset	w9, eq
100b5ed40:     	lsl	w9, w9, #1
100b5ed44:     	cmp	w8, #0x0
100b5ed48:     	mov	w8, #0x10               ; =16
100b5ed4c:     	mov	w10, #0x4               ; =4
100b5ed50:     	csel	w22, w10, w8, eq
100b5ed54:     	csinc	w23, w9, wzr, ne
100b5ed58:     	ldr	x0, [sp, #0xa0]
100b5ed5c:     	mov	x1, x20
100b5ed60:     	mov	x2, x23
100b5ed64:     	bl	0x100b5d8f8 <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch>
100b5ed68:     	cbz	w0, 0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5ed6c:     	ldr	x0, [sp, #0xa0]
100b5ed70:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5ed74:     	mov	x21, x0
100b5ed78:     	ldr	x0, [sp, #0xa0]
100b5ed7c:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b5ed80:     	mov	w7, #0x0                ; =0
100b5ed84:     	ldr	x8, [x21, #0x128]
100b5ed88:     	cbz	x8, 0x100b5edf0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa8>
100b5ed8c:     	add	x8, x8, #0x328
100b5ed90:     	ldr	x9, [sp, #0x80]
100b5ed94:     	cmp	x8, x9
100b5ed98:     	b.ne	0x100b5edf0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa8>
100b5ed9c:     	mov	x25, x0
100b5eda0:     	ldr	x0, [sp, #0x80]
100b5eda4:     	mov	x1, x27
100b5eda8:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b5edac:     	tbnz	w0, #0x1f, 0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5edb0:     	ldr	w8, [x27, #0x10]
100b5edb4:     	cmp	w8, #0x5
100b5edb8:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5edbc:     	ldr	w8, [x27, #0x14]
100b5edc0:     	cbnz	w8, 0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5edc4:     	ldr	x8, [x27, #0x18]
100b5edc8:     	cbnz	x8, 0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5edcc:     	ldr	x8, [x27, #0x38]
100b5edd0:     	cbnz	x8, 0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5edd4:     	ldr	x8, [x27, #0x40]
100b5edd8:     	cbnz	x8, 0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5eddc:     	ldr	x8, [x27, #0x28]
100b5ede0:     	cbnz	x8, 0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5ede4:     	ldr	x8, [x27, #0x30]
100b5ede8:     	cbz	x8, 0x100b5f10c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xdc4>
100b5edec:     	mov	w7, #0x0                ; =0
100b5edf0:     	ldr	x4, [x26, #0xb0]
100b5edf4:     	add	x25, x26, #0x10
100b5edf8:     	ldr	x0, [sp, #0xa0]
100b5edfc:     	ldr	x1, [sp, #0x80]
100b5ee00:     	mov	x2, x27
100b5ee04:     	mov	x3, x20
100b5ee08:     	mov	x5, x25
100b5ee0c:     	mov	w6, #0x0                ; =0
100b5ee10:     	bl	0x100b524d0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch>
100b5ee14:     	mov	x21, x0
100b5ee18:     	adrp	x8, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b5ee1c:     	add	x8, x8, #0x2a0
100b5ee20:     	ldr	x0, [x8]
100b5ee24:     	ldr	x23, [x0, #0x8]
100b5ee28:     	cbnz	x23, 0x100b5ee40 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaf8>
100b5ee2c:     	bl	0x100ae3834 <__Z15CLG_logref_initP10CLG_LogRef>
100b5ee30:     	adrp	x8, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b5ee34:     	add	x8, x8, #0x2a0
100b5ee38:     	ldr	x8, [x8]
100b5ee3c:     	ldr	x23, [x8, #0x8]
100b5ee40:     	ldr	w9, [sp, #0xb8]
100b5ee44:     	orr	w9, w21, w9
100b5ee48:     	ldr	w8, [x23, #0x50]
100b5ee4c:     	cmp	w8, #0x3
100b5ee50:     	str	w9, [sp, #0xb8]
100b5ee54:     	b.le	0x100b5eb5c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x814>
100b5ee58:     	strb	wzr, [sp, #0x1f0]
100b5ee5c:     	strb	wzr, [sp, #0x208]
100b5ee60:     	ldr	x21, [x26, #0x50]
100b5ee64:     	cbz	x21, 0x100b5eed8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xb90>
100b5ee68:     	mov	x0, x25
100b5ee6c:     	mov	w1, #0x0                ; =0
100b5ee70:     	bl	0x100b7d198 <__Z20WM_operatortype_findPKcb>
100b5ee74:     	cbz	x0, 0x100b5eee4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xb9c>
100b5ee78:     	ldr	x1, [x26, #0xb0]
100b5ee7c:     	sub	x8, x29, #0xd0
100b5ee80:     	ldr	x0, [sp, #0xa0]
100b5ee84:     	mov	w2, #0x0                ; =0
100b5ee88:     	mov	w3, #0x0                ; =0
100b5ee8c:     	mov	w4, #0x1                ; =1
100b5ee90:     	mov	w5, #0x200              ; =512
100b5ee94:     	bl	0x1012629c8 <__Z30RNA_pointer_as_string_keywordsP8bContextP10PointerRNAbbbi>
100b5ee98:     	ldur	q0, [x29, #-0xd0]
100b5ee9c:     	str	q0, [sp, #0x1f0]
100b5eea0:     	ldur	x8, [x29, #-0xc0]
100b5eea4:     	str	x8, [sp, #0x200]
100b5eea8:     	mov	w8, #0x1                ; =1
100b5eeac:     	strb	w8, [sp, #0x208]
100b5eeb0:     	ldrsb	w8, [sp, #0x207]
100b5eeb4:     	tbnz	w8, #0x1f, 0x100b5ef94 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xc4c>
100b5eeb8:     	ldr	q0, [sp, #0x1f0]
100b5eebc:     	str	q0, [sp, #0x1d0]
100b5eec0:     	ldr	x8, [sp, #0x200]
100b5eec4:     	str	x8, [sp, #0x1e0]
100b5eec8:     	b	0x100b5efa0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xc58>
100b5eecc:     	cmp	w8, #0x2
100b5eed0:     	b.ne	0x100b5eb64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x81c>
100b5eed4:     	b	0x100b5ec08 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8c0>
100b5eed8:     	strb	wzr, [sp, #0x1e7]
100b5eedc:     	strb	wzr, [sp, #0x1d0]
100b5eee0:     	b	0x100b5efa0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xc58>
100b5eee4:     	str	x21, [sp, #0x48]
100b5eee8:     	ldr	x0, [x26, #0x50]
100b5eeec:     	mov	x1, #0x0                ; =0
100b5eef0:     	bl	0x1001f8c44 <__Z9IDP_reprNPK10IDPropertyPj>
100b5eef4:     	str	x0, [sp, #0x58]
100b5eef8:     	bl	0x104b76c30 <_zlibVersion+0x104b76c30>
100b5eefc:     	mov	x8, #0x7ffffffffffffff8 ; =9223372036854775800
100b5ef00:     	cmp	x0, x8
100b5ef04:     	b.hs	0x100b5fe5c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b14>
100b5ef08:     	mov	x22, x0
100b5ef0c:     	cmp	x0, #0x17
100b5ef10:     	b.hs	0x100b5ef28 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xbe0>
100b5ef14:     	strb	w22, [sp, #0x207]
100b5ef18:     	add	x21, sp, #0x1f0
100b5ef1c:     	ldr	x0, [sp, #0x58]
100b5ef20:     	cbnz	x22, 0x100b5ef54 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xc0c>
100b5ef24:     	b	0x100b5ef68 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xc20>
100b5ef28:     	orr	x8, x22, #0x7
100b5ef2c:     	cmp	x8, #0x17
100b5ef30:     	mov	w9, #0x19               ; =25
100b5ef34:     	csinc	x0, x9, x8, eq
100b5ef38:     	str	x0, [sp, #0x40]
100b5ef3c:     	bl	0x104b751cc <_zlibVersion+0x104b751cc>
100b5ef40:     	mov	x21, x0
100b5ef44:     	ldr	x8, [sp, #0x40]
100b5ef48:     	orr	x8, x8, #0x8000000000000000
100b5ef4c:     	stp	x22, x8, [sp, #0x1f8]
100b5ef50:     	str	x0, [sp, #0x1f0]
100b5ef54:     	mov	x0, x21
100b5ef58:     	ldr	x1, [sp, #0x58]
100b5ef5c:     	mov	x2, x22
100b5ef60:     	bl	0x104b7606c <_zlibVersion+0x104b7606c>
100b5ef64:     	ldr	x0, [sp, #0x58]
100b5ef68:     	strb	wzr, [x21, x22]
100b5ef6c:     	mov	w8, #0x1                ; =1
100b5ef70:     	strb	w8, [sp, #0x208]
100b5ef74:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5ef78:     	add	x8, x8, #0x710
100b5ef7c:     	ldr	x8, [x8]
100b5ef80:     	mov	w1, #0x0                ; =0
100b5ef84:     	blr	x8
100b5ef88:     	ldr	x21, [sp, #0x48]
100b5ef8c:     	ldrsb	w8, [sp, #0x207]
100b5ef90:     	tbz	w8, #0x1f, 0x100b5eeb8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xb70>
100b5ef94:     	ldp	x1, x2, [sp, #0x1f0]
100b5ef98:     	add	x0, sp, #0x1d0
100b5ef9c:     	bl	0x103d213e4 <__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE25__init_copy_ctor_externalEPKcm>
100b5efa0:     	ldrsb	x8, [sp, #0x1e7]
100b5efa4:     	cmp	x8, #0x0
100b5efa8:     	ldp	x9, x10, [sp, #0x1d0]
100b5efac:     	add	x11, sp, #0x1d0
100b5efb0:     	csel	x9, x9, x11, lt
100b5efb4:     	cmp	w8, #0x0
100b5efb8:     	csel	x8, x10, x8, lt
100b5efbc:     	stp	x25, xzr, [x29, #-0xd0]
100b5efc0:     	stp	x9, x8, [x29, #-0xc0]
100b5efc4:     	add	x8, sp, #0x1b8
100b5efc8:     	sub	x3, x29, #0xd0
100b5efcc:     	adrp	x0, 0x104bd5000 <__ZL3hex+0x55cd>
100b5efd0:     	add	x0, x0, #0x28a
100b5efd4:     	mov	w1, #0x6                ; =6
100b5efd8:     	mov	w2, #0xdc               ; =220
100b5efdc:     	bl	0x104a421bc <__ZN3fmt3v107vformatENS0_17basic_string_viewIcEENS0_17basic_format_argsINS0_20basic_format_contextINS0_8appenderEcEEEE>
100b5efe0:     	ldrsb	w8, [sp, #0x1e7]
100b5efe4:     	tbz	w8, #0x1f, 0x100b5eff0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xca8>
100b5efe8:     	ldr	x0, [sp, #0x1d0]
100b5efec:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b5eff0:     	cbz	x21, 0x100b5f004 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xcbc>
100b5eff4:     	ldrsb	w8, [sp, #0x207]
100b5eff8:     	tbz	w8, #0x1f, 0x100b5f004 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xcbc>
100b5effc:     	ldr	x0, [sp, #0x1f0]
100b5f000:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b5f004:     	ldrsb	w8, [sp, #0x1cf]
100b5f008:     	ldr	x9, [sp, #0x1b8]
100b5f00c:     	cmp	w8, #0x0
100b5f010:     	add	x8, sp, #0x1b8
100b5f014:     	csel	x22, x9, x8, lt
100b5f018:     	ldr	w10, [sp, #0xb8]
100b5f01c:     	tst	w10, #0x2
100b5f020:     	adrp	x8, 0x104bd5000 <__ZL3hex+0x55cd>
100b5f024:     	add	x8, x8, #0x299
100b5f028:     	adrp	x9, 0x104bd5000 <__ZL3hex+0x55cd>
100b5f02c:     	add	x9, x9, #0x2af
100b5f030:     	csel	x8, x9, x8, eq
100b5f034:     	ands	w21, w10, #0x1
100b5f038:     	adrp	x9, 0x104bd5000 <__ZL3hex+0x55cd>
100b5f03c:     	add	x9, x9, #0x291
100b5f040:     	csel	x25, x8, x9, eq
100b5f044:     	sub	x8, x29, #0xd0
100b5f048:     	mov	x0, x26
100b5f04c:     	mov	w1, #0x0                ; =0
100b5f050:     	bl	0x100b76a34 <__Z24WM_keymap_item_to_stringPK12wmKeyMapItemb>
100b5f054:     	ldurb	w8, [x29, #-0xb8]
100b5f058:     	tbz	w8, #0x0, 0x100b5f090 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xd48>
100b5f05c:     	ldur	x8, [x29, #-0xc0]
100b5f060:     	str	x8, [sp, #0x200]
100b5f064:     	ldur	q0, [x29, #-0xd0]
100b5f068:     	str	q0, [sp, #0x1f0]
100b5f06c:     	stp	xzr, xzr, [x29, #-0xc8]
100b5f070:     	stur	xzr, [x29, #-0xd0]
100b5f074:     	lsr	x8, x8, #56
100b5f078:     	sxtb	w8, w8
100b5f07c:     	ldr	x9, [sp, #0x1f0]
100b5f080:     	cmp	w8, #0x0
100b5f084:     	add	x8, sp, #0x1f0
100b5f088:     	csel	x8, x9, x8, lt
100b5f08c:     	b	0x100b5f09c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xd54>
100b5f090:     	strb	wzr, [sp, #0x207]
100b5f094:     	strb	wzr, [sp, #0x1f0]
100b5f098:     	add	x8, sp, #0x1f0
100b5f09c:     	stp	x25, x8, [sp, #0x10]
100b5f0a0:     	ldr	x8, [sp, #0x78]
100b5f0a4:     	stp	x8, x22, [sp]
100b5f0a8:     	mov	x0, x23
100b5f0ac:     	mov	w1, #0x4                ; =4
100b5f0b0:     	adrp	x2, 0x104bd5000 <__ZL3hex+0x55cd>
100b5f0b4:     	add	x2, x2, #0x139
100b5f0b8:     	adrp	x3, 0x104bd5000 <__ZL3hex+0x55cd>
100b5f0bc:     	add	x3, x3, #0x10f
100b5f0c0:     	adrp	x4, 0x104bd5000 <__ZL3hex+0x55cd>
100b5f0c4:     	add	x4, x4, #0x175
100b5f0c8:     	bl	0x100ae2b58 <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b5f0cc:     	ldrsb	w8, [sp, #0x207]
100b5f0d0:     	tbz	w8, #0x1f, 0x100b5f0dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xd94>
100b5f0d4:     	ldr	x0, [sp, #0x1f0]
100b5f0d8:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b5f0dc:     	ldurb	w8, [x29, #-0xb8]
100b5f0e0:     	cmp	w8, #0x1
100b5f0e4:     	b.ne	0x100b5f0f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xdb0>
100b5f0e8:     	ldursb	w8, [x29, #-0xb9]
100b5f0ec:     	tbz	w8, #0x1f, 0x100b5f0f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xdb0>
100b5f0f0:     	ldur	x0, [x29, #-0xd0]
100b5f0f4:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b5f0f8:     	ldrsb	w8, [sp, #0x1cf]
100b5f0fc:     	tbz	w8, #0x1f, 0x100b5eb60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x818>
100b5f100:     	ldr	x0, [sp, #0x1b8]
100b5f104:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b5f108:     	b	0x100b5eb60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x818>
100b5f10c:     	mov	w7, #0x0                ; =0
100b5f110:     	ldr	x8, [x27, #0x48]
100b5f114:     	cbnz	x8, 0x100b5edf0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa8>
100b5f118:     	cbz	x25, 0x100b5edf0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa8>
100b5f11c:     	ldr	x8, [x25, #0x5c0]
100b5f120:     	cbz	x8, 0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f124:     	ldr	x1, [x8, #0xc8]
100b5f128:     	cbz	x1, 0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f12c:     	mov	w7, #0x0                ; =0
100b5f130:     	ldr	x9, [x8, #0xd8]
100b5f134:     	cbz	x9, 0x100b5edf0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa8>
100b5f138:     	cmp	x1, x9
100b5f13c:     	b.eq	0x100b5edf0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa8>
100b5f140:     	add	x0, x8, #0x88
100b5f144:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b5f148:     	tbnz	w0, #0x1f, 0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f14c:     	ldr	x8, [x25, #0x5c0]
100b5f150:     	ldr	x1, [x8, #0xd8]
100b5f154:     	add	x0, x8, #0x88
100b5f158:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b5f15c:     	tbnz	w0, #0x1f, 0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f160:     	ldr	x8, [x25, #0x5c0]
100b5f164:     	ldr	x21, [x8, #0xc8]
100b5f168:     	ldr	x9, [x8, #0xd8]
100b5f16c:     	str	x9, [sp, #0x58]
100b5f170:     	add	x25, x8, #0x88
100b5f174:     	ldr	x25, [x25]
100b5f178:     	cbz	x25, 0x100b5f1a4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xe5c>
100b5f17c:     	add	x0, x25, #0x10
100b5f180:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b5f184:     	add	x8, x8, #0xe08
100b5f188:     	mov	w9, #0x2770             ; =10096
100b5f18c:     	add	x1, x8, x9
100b5f190:     	mov	w2, #0x40               ; =64
100b5f194:     	bl	0x104b76c54 <_zlibVersion+0x104b76c54>
100b5f198:     	cbnz	w0, 0x100b5f174 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xe2c>
100b5f19c:     	cmp	x25, x21
100b5f1a0:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f1a4:     	mov	x0, x21
100b5f1a8:     	bl	0x100b5ffa4 <__ZL28wm_ipad_node_view2d_map_findPK11wmKeyConfig>
100b5f1ac:     	mov	x21, x0
100b5f1b0:     	ldr	x0, [sp, #0x58]
100b5f1b4:     	bl	0x100b5ffa4 <__ZL28wm_ipad_node_view2d_map_findPK11wmKeyConfig>
100b5f1b8:     	cbz	x21, 0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f1bc:     	mov	x25, x0
100b5f1c0:     	ldr	x8, [x27, #0x20]
100b5f1c4:     	cmp	x8, x21
100b5f1c8:     	ldr	x8, [sp, #0x60]
100b5f1cc:     	ccmp	x0, x8, #0x0, eq
100b5f1d0:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f1d4:     	ldrh	w8, [x21, #0xf6]
100b5f1d8:     	ldrh	w9, [x25, #0xf6]
100b5f1dc:     	cmp	w8, w9
100b5f1e0:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f1e4:     	add	x3, sp, #0x1d0
100b5f1e8:     	sub	x4, x29, #0xd0
100b5f1ec:     	mov	x0, x21
100b5f1f0:     	mov	w1, #0x0                ; =0
100b5f1f4:     	mov	x2, #0x0                ; =0
100b5f1f8:     	bl	0x100b6000c <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i>
100b5f1fc:     	cbz	w0, 0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f200:     	add	x3, sp, #0x1b8
100b5f204:     	add	x4, sp, #0x1f0
100b5f208:     	mov	x0, x25
100b5f20c:     	mov	w1, #0x1                ; =1
100b5f210:     	mov	x2, x26
100b5f214:     	bl	0x100b6000c <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i>
100b5f218:     	cbz	w0, 0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f21c:     	ldur	w8, [x29, #-0xd0]
100b5f220:     	ldr	w9, [sp, #0x1f0]
100b5f224:     	cmp	w8, w9
100b5f228:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f22c:     	ldur	w8, [x29, #-0xcc]
100b5f230:     	ldr	w9, [sp, #0x1f4]
100b5f234:     	cmp	w8, w9
100b5f238:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f23c:     	ldur	w8, [x29, #-0xc8]
100b5f240:     	ldr	w9, [sp, #0x1f8]
100b5f244:     	cmp	w8, w9
100b5f248:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f24c:     	ldur	w8, [x29, #-0xc4]
100b5f250:     	ldr	w9, [sp, #0x1fc]
100b5f254:     	cmp	w8, w9
100b5f258:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f25c:     	ldur	w8, [x29, #-0xc0]
100b5f260:     	ldr	w9, [sp, #0x200]
100b5f264:     	cmp	w8, w9
100b5f268:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f26c:     	ldur	w8, [x29, #-0xbc]
100b5f270:     	ldr	w9, [sp, #0x204]
100b5f274:     	cmp	w8, w9
100b5f278:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f27c:     	ldur	w8, [x29, #-0xb8]
100b5f280:     	ldr	w9, [sp, #0x208]
100b5f284:     	cmp	w8, w9
100b5f288:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f28c:     	ldur	w8, [x29, #-0xb4]
100b5f290:     	ldr	w9, [sp, #0x20c]
100b5f294:     	cmp	w8, w9
100b5f298:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f29c:     	ldur	w8, [x29, #-0xb0]
100b5f2a0:     	ldr	w9, [sp, #0x210]
100b5f2a4:     	cmp	w8, w9
100b5f2a8:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f2ac:     	ldur	w8, [x29, #-0xac]
100b5f2b0:     	ldr	w9, [sp, #0x214]
100b5f2b4:     	cmp	w8, w9
100b5f2b8:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f2bc:     	ldur	w8, [x29, #-0xa8]
100b5f2c0:     	ldr	w9, [sp, #0x218]
100b5f2c4:     	cmp	w8, w9
100b5f2c8:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f2cc:     	ldur	w8, [x29, #-0xa4]
100b5f2d0:     	ldr	w9, [sp, #0x21c]
100b5f2d4:     	cmp	w8, w9
100b5f2d8:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f2dc:     	ldur	w8, [x29, #-0xa0]
100b5f2e0:     	ldr	w9, [sp, #0x220]
100b5f2e4:     	cmp	w8, w9
100b5f2e8:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f2ec:     	ldur	w8, [x29, #-0x9c]
100b5f2f0:     	ldr	w9, [sp, #0x224]
100b5f2f4:     	cmp	w8, w9
100b5f2f8:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f2fc:     	ldur	w8, [x29, #-0x98]
100b5f300:     	ldr	w9, [sp, #0x228]
100b5f304:     	cmp	w8, w9
100b5f308:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f30c:     	ldur	w8, [x29, #-0x94]
100b5f310:     	ldr	w9, [sp, #0x22c]
100b5f314:     	cmp	w8, w9
100b5f318:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f31c:     	ldur	w8, [x29, #-0x90]
100b5f320:     	ldr	w9, [sp, #0x230]
100b5f324:     	cmp	w8, w9
100b5f328:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f32c:     	ldur	w8, [x29, #-0x8c]
100b5f330:     	ldr	w9, [sp, #0x234]
100b5f334:     	cmp	w8, w9
100b5f338:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f33c:     	ldur	w8, [x29, #-0x88]
100b5f340:     	ldr	w9, [sp, #0x238]
100b5f344:     	cmp	w8, w9
100b5f348:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f34c:     	ldur	w8, [x29, #-0x84]
100b5f350:     	ldr	w9, [sp, #0x23c]
100b5f354:     	cmp	w8, w9
100b5f358:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f35c:     	ldur	w8, [x29, #-0x80]
100b5f360:     	ldr	w9, [sp, #0x240]
100b5f364:     	cmp	w8, w9
100b5f368:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f36c:     	ldur	w8, [x29, #-0x7c]
100b5f370:     	ldr	w9, [sp, #0x244]
100b5f374:     	cmp	w8, w9
100b5f378:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f37c:     	ldur	w8, [x29, #-0x78]
100b5f380:     	ldr	w9, [sp, #0x248]
100b5f384:     	cmp	w8, w9
100b5f388:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f38c:     	ldur	w8, [x29, #-0x74]
100b5f390:     	ldr	w9, [sp, #0x24c]
100b5f394:     	cmp	w8, w9
100b5f398:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f39c:     	ldur	w8, [x29, #-0x70]
100b5f3a0:     	ldr	w9, [sp, #0x250]
100b5f3a4:     	cmp	w8, w9
100b5f3a8:     	b.ne	0x100b5edec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa4>
100b5f3ac:     	ldr	w8, [sp, #0x1b8]
100b5f3b0:     	cmp	w8, w22
100b5f3b4:     	csel	w7, w23, wzr, eq
100b5f3b8:     	b	0x100b5edf0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa8>
100b5f3bc:     	ldr	x8, [sp, #0x70]
100b5f3c0:     	cbz	x8, 0x100b5eb3c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7f4>
100b5f3c4:     	ldp	x0, x2, [sp, #0x60]
100b5f3c8:     	mov	x1, x26
100b5f3cc:     	blr	x8
100b5f3d0:     	b	0x100b5eb3c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7f4>
100b5f3d4:     	mov	w24, #0x0               ; =0
100b5f3d8:     	ldr	w8, [sp, #0xc4]
100b5f3dc:     	orr	w8, w24, w8
100b5f3e0:     	ldr	x24, [sp, #0xa0]
100b5f3e4:     	str	w8, [sp, #0xc4]
100b5f3e8:     	tbz	w8, #0x0, 0x100b5f41c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x10d4>
100b5f3ec:     	ldr	w8, [sp, #0x54]
100b5f3f0:     	and	w8, w8, #0xfff0
100b5f3f4:     	cmp	w8, #0x110
100b5f3f8:     	b.eq	0x100b5f41c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x10d4>
100b5f3fc:     	mov	x0, x24
100b5f400:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5f404:     	cbz	x0, 0x100b5f41c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x10d4>
100b5f408:     	mov	x0, x24
100b5f40c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5f410:     	mov	x1, x0
100b5f414:     	mov	x0, x24
100b5f418:     	bl	0x100b94128 <__Z16WM_tooltip_clearP8bContextP8wmWindow>
100b5f41c:     	ldr	x28, [sp, #0x80]
100b5f420:     	b	0x100b5fc68 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1920>
100b5f424:     	cmp	w8, #0xac
100b5f428:     	mov	w9, #0xb3               ; =179
100b5f42c:     	ccmp	w8, w9, #0x4, ne
100b5f430:     	cset	w22, eq
100b5f434:     	ldrh	w21, [x20, #0x12]
100b5f438:     	mov	x25, x24
100b5f43c:     	mov	x0, x24
100b5f440:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b5f444:     	str	x0, [sp, #0x70]
100b5f448:     	mov	x0, x25
100b5f44c:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5f450:     	str	x0, [sp, #0xb8]
100b5f454:     	ldr	x0, [x27, #0x20]
100b5f458:     	str	x0, [sp, #0x78]
100b5f45c:     	bl	0x100b40a84 <__Z25wm_gizmomap_highlight_getP10wmGizmoMap>
100b5f460:     	mov	x28, x0
100b5f464:     	cbz	x0, 0x100b5f498 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1150>
100b5f468:     	ldrh	w8, [x20, #0x10]
100b5f46c:     	sub	w8, w8, #0x1
100b5f470:     	cmp	w8, #0x14
100b5f474:     	b.hi	0x100b5f498 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1150>
100b5f478:     	ldrh	w8, [x20, #0x12]
100b5f47c:     	cmp	w8, #0x1
100b5f480:     	b.ne	0x100b5f498 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1150>
100b5f484:     	mov	x0, x25
100b5f488:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5f48c:     	mov	x1, x0
100b5f490:     	mov	x0, x25
100b5f494:     	bl	0x100b94128 <__Z16WM_tooltip_clearP8bContextP8wmWindow>
100b5f498:     	ldr	x8, [sp, #0xb8]
100b5f49c:     	ldr	x8, [x8, #0x128]
100b5f4a0:     	ldr	x8, [x8, #0x170]
100b5f4a4:     	ldrb	w8, [x8, #0xf0]
100b5f4a8:     	cmp	w8, #0x1
100b5f4ac:     	b.ne	0x100b5f520 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x11d8>
100b5f4b0:     	add	x1, x20, #0x14
100b5f4b4:     	ldr	x0, [sp, #0xb8]
100b5f4b8:     	mov	w2, #0x1                ; =1
100b5f4bc:     	bl	0x101f358ec <__Z31UI_region_block_find_mouse_overPK7ARegionPKib>
100b5f4c0:     	cbz	x0, 0x100b5f520 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x11d8>
100b5f4c4:     	mov	w22, #0x0               ; =0
100b5f4c8:     	cbz	x28, 0x100b5fc54 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x190c>
100b5f4cc:     	ldrh	w8, [x20, #0x10]
100b5f4d0:     	mov	w9, #0x5025             ; =20517
100b5f4d4:     	cmp	w8, w9
100b5f4d8:     	mov	x24, x25
100b5f4dc:     	b.eq	0x100b5fc58 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1910>
100b5f4e0:     	cmp	w21, #0x5
100b5f4e4:     	ldr	x28, [sp, #0x80]
100b5f4e8:     	b.eq	0x100b5fc5c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1914>
100b5f4ec:     	mov	x0, x24
100b5f4f0:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5f4f4:     	mov	x1, x0
100b5f4f8:     	mov	x0, x25
100b5f4fc:     	bl	0x100b94128 <__Z16WM_tooltip_clearP8bContextP8wmWindow>
100b5f500:     	ldr	x0, [sp, #0x78]
100b5f504:     	mov	x1, x25
100b5f508:     	mov	x2, #0x0                ; =0
100b5f50c:     	mov	w3, #0x0                ; =0
100b5f510:     	bl	0x100b40580 <__Z25wm_gizmomap_highlight_setP10wmGizmoMapPK8bContextP7wmGizmoi>
100b5f514:     	mov	w22, #0x0               ; =0
100b5f518:     	mov	x24, x25
100b5f51c:     	b	0x100b5fc5c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1914>
100b5f520:     	ldr	x0, [sp, #0x78]
100b5f524:     	bl	0x100b40578 <__Z21wm_gizmomap_modal_getP10wmGizmoMap>
100b5f528:     	str	x0, [sp, #0x68]
100b5f52c:     	cbz	x28, 0x100b5f5dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1294>
100b5f530:     	ldr	w8, [x28, #0x50]
100b5f534:     	str	w8, [sp, #0x58]
100b5f538:     	b	0x100b5f5e0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1298>
100b5f53c:     	ldr	x1, [x27, #0x38]
100b5f540:     	cbz	x1, 0x100b5f54c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1204>
100b5f544:     	mov	x0, x24
100b5f548:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b5f54c:     	ldr	x1, [x27, #0x40]
100b5f550:     	cbz	x1, 0x100b5f55c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1214>
100b5f554:     	mov	x0, x24
100b5f558:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b5f55c:     	ldr	x1, [x27, #0x48]
100b5f560:     	cbz	x1, 0x100b5f56c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1224>
100b5f564:     	mov	x0, x24
100b5f568:     	bl	0x1000b4b90 <__Z23CTX_wm_region_popup_setP8bContextP7ARegion>
100b5f56c:     	ldr	x8, [x27, #0x20]
100b5f570:     	ldr	x2, [x27, #0x30]
100b5f574:     	mov	x0, x24
100b5f578:     	mov	x1, x20
100b5f57c:     	blr	x8
100b5f580:     	mov	x22, x0
100b5f584:     	cmp	w0, #0x1
100b5f588:     	ldr	w8, [sp, #0x8c]
100b5f58c:     	csinc	w8, w8, wzr, eq
100b5f590:     	tbz	w8, #0x0, 0x100b5f698 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1350>
100b5f594:     	mov	x0, x24
100b5f598:     	mov	x1, x26
100b5f59c:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b5f5a0:     	mov	x0, x24
100b5f5a4:     	mov	x1, x25
100b5f5a8:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b5f5ac:     	mov	x0, x24
100b5f5b0:     	mov	x1, x23
100b5f5b4:     	bl	0x1000b4b90 <__Z23CTX_wm_region_popup_setP8bContextP7ARegion>
100b5f5b8:     	cmp	w22, #0x1
100b5f5bc:     	cset	w8, eq
100b5f5c0:     	csel	w9, wzr, w21, eq
100b5f5c4:     	cmp	w9, #0x1
100b5f5c8:     	b.ne	0x100b5f6c0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1378>
100b5f5cc:     	mov	w8, #0x0                ; =0
100b5f5d0:     	adrp	x10, 0x107ef7000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b5f5d4:     	strb	w9, [x10, #0x830]
100b5f5d8:     	b	0x100b5f6c0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1378>
100b5f5dc:     	str	wzr, [sp, #0x58]
100b5f5e0:     	ldr	x8, [sp, #0xb8]
100b5f5e4:     	ldr	x8, [x8, #0x128]
100b5f5e8:     	ldr	x8, [x8, #0x340]
100b5f5ec:     	ldr	x0, [x27, #0x20]
100b5f5f0:     	cmp	x8, x0
100b5f5f4:     	b.eq	0x100b5f5fc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x12b4>
100b5f5f8:     	bl	0x100b3f914 <__Z23WM_gizmomap_tag_refreshP10wmGizmoMap>
100b5f5fc:     	mov	x0, x25
100b5f600:     	mov	x1, x27
100b5f604:     	bl	0x100b40a34 <__Z33wm_gizmomap_handler_context_gizmoP8bContextP20wmEventHandler_Gizmo>
100b5f608:     	mov	x0, x25
100b5f60c:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5f610:     	cbz	x0, 0x100b5f630 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x12e8>
100b5f614:     	ldr	w8, [x0, #0xa8]
100b5f618:     	ldp	w9, w10, [x20, #0x14]
100b5f61c:     	sub	w8, w9, w8
100b5f620:     	str	w8, [x20, #0x1c]
100b5f624:     	ldr	w8, [x0, #0xb0]
100b5f628:     	sub	w8, w10, w8
100b5f62c:     	b	0x100b5f638 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x12f0>
100b5f630:     	mov	w8, #-0x1               ; =-1
100b5f634:     	str	w8, [x20, #0x1c]
100b5f638:     	mov	x1, x25
100b5f63c:     	str	w8, [x20, #0x20]
100b5f640:     	ldr	x8, [sp, #0x68]
100b5f644:     	cbz	x8, 0x100b5f65c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1314>
100b5f648:     	mov	w8, #0x1                ; =1
100b5f64c:     	str	w8, [sp, #0x60]
100b5f650:     	mov	w22, #0x1               ; =1
100b5f654:     	mov	x23, x28
100b5f658:     	b	0x100b5f7c0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1478>
100b5f65c:     	ldrh	w8, [x20, #0x10]
100b5f660:     	cmp	w8, #0x4
100b5f664:     	csinc	w8, w22, wzr, ne
100b5f668:     	tbnz	w8, #0x0, 0x100b5f6d0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1388>
100b5f66c:     	cmp	w21, #0x5
100b5f670:     	b.eq	0x100b5f6d0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1388>
100b5f674:     	ldr	x0, [sp, #0x78]
100b5f678:     	bl	0x100b3fc30 <__Z29wm_gizmomap_highlight_pendingPK10wmGizmoMap>
100b5f67c:     	mov	w22, #0x1               ; =1
100b5f680:     	mov	w8, #0x1                ; =1
100b5f684:     	str	w8, [sp, #0x60]
100b5f688:     	mov	x23, x28
100b5f68c:     	mov	x1, x25
100b5f690:     	cbnz	w0, 0x100b5f6dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1394>
100b5f694:     	b	0x100b5f7c0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1478>
100b5f698:     	mov	x0, x24
100b5f69c:     	mov	x1, #0x0                ; =0
100b5f6a0:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b5f6a4:     	mov	x0, x24
100b5f6a8:     	mov	x1, #0x0                ; =0
100b5f6ac:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b5f6b0:     	mov	x0, x24
100b5f6b4:     	mov	x1, #0x0                ; =0
100b5f6b8:     	bl	0x1000b4b90 <__Z23CTX_wm_region_popup_setP8bContextP7ARegion>
100b5f6bc:     	mov	w8, #0x1                ; =1
100b5f6c0:     	ldr	w9, [sp, #0xc4]
100b5f6c4:     	orr	w9, w8, w9
100b5f6c8:     	str	w9, [sp, #0xc4]
100b5f6cc:     	b	0x100b5fc68 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1920>
100b5f6d0:     	and	w8, w21, #0xffff
100b5f6d4:     	cmp	w8, #0x5
100b5f6d8:     	csinc	w22, w22, wzr, ne
100b5f6dc:     	cmp	w21, #0x5
100b5f6e0:     	cset	w8, ne
100b5f6e4:     	str	w8, [sp, #0x60]
100b5f6e8:     	mov	w8, #-0x1               ; =-1
100b5f6ec:     	stur	w8, [x29, #-0xd0]
100b5f6f0:     	sub	x3, x29, #0xd0
100b5f6f4:     	ldr	x0, [sp, #0x78]
100b5f6f8:     	mov	x2, x20
100b5f6fc:     	bl	0x100b3fc44 <__Z26wm_gizmomap_highlight_findP10wmGizmoMapP8bContextPK7wmEventPi>
100b5f700:     	mov	x23, x0
100b5f704:     	orr	x8, x28, x0
100b5f708:     	cbz	x8, 0x100b5f7a4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x145c>
100b5f70c:     	cmp	x28, x23
100b5f710:     	mov	x1, x25
100b5f714:     	b.ne	0x100b5f72c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x13e4>
100b5f718:     	ldur	w8, [x29, #-0xd0]
100b5f71c:     	ldr	w9, [sp, #0x58]
100b5f720:     	mov	x3, x9
100b5f724:     	cmp	w9, w8
100b5f728:     	b.eq	0x100b5f748 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1400>
100b5f72c:     	mov	x0, x1
100b5f730:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5f734:     	mov	x1, x0
100b5f738:     	mov	x0, x25
100b5f73c:     	bl	0x100b94128 <__Z16WM_tooltip_clearP8bContextP8wmWindow>
100b5f740:     	ldur	w3, [x29, #-0xd0]
100b5f744:     	mov	x1, x25
100b5f748:     	ldr	x0, [sp, #0x78]
100b5f74c:     	mov	x2, x23
100b5f750:     	bl	0x100b40580 <__Z25wm_gizmomap_highlight_setP10wmGizmoMapPK8bContextP7wmGizmoi>
100b5f754:     	cmp	x23, #0x0
100b5f758:     	eor	w8, w0, #0x1
100b5f75c:     	csinc	w8, w8, wzr, ne
100b5f760:     	tbnz	w8, #0x0, 0x100b5f7b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1470>
100b5f764:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b5f768:     	add	x8, x8, #0xe08
100b5f76c:     	ldrb	w8, [x8, #0x9]
100b5f770:     	tbz	w8, #0x3, 0x100b5f7b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1470>
100b5f774:     	ldrb	w8, [x23, #0x49]
100b5f778:     	tbnz	w8, #0x4, 0x100b5f7b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1470>
100b5f77c:     	mov	x0, x25
100b5f780:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5f784:     	mov	x1, x0
100b5f788:     	mov	x0, x25
100b5f78c:     	ldr	x2, [sp, #0x70]
100b5f790:     	ldr	x3, [sp, #0xb8]
100b5f794:     	adrp	x4, 0x100b40000 <__Z26wm_gizmomap_highlight_findP10wmGizmoMapP8bContextPK7wmEventPi+0x3bc>
100b5f798:     	add	x4, x4, #0xb40
100b5f79c:     	bl	0x100b94120 <__Z21WM_tooltip_timer_initP8bContextP8wmWindowP7ScrAreaP7ARegionPFS6_S0_S6_PiPdPbE>
100b5f7a0:     	b	0x100b5f7b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1470>
100b5f7a4:     	ldur	w3, [x29, #-0xd0]
100b5f7a8:     	ldr	x0, [sp, #0x78]
100b5f7ac:     	mov	x1, x25
100b5f7b0:     	mov	x2, #0x0                ; =0
100b5f7b4:     	bl	0x100b40580 <__Z25wm_gizmomap_highlight_setP10wmGizmoMapPK8bContextP7wmGizmoi>
100b5f7b8:     	ldr	x0, [sp, #0x78]
100b5f7bc:     	bl	0x100b3fc38 <__Z29wm_gizmomap_highlight_handledP10wmGizmoMap>
100b5f7c0:     	cbz	x23, 0x100b5f830 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x14e8>
100b5f7c4:     	ldr	w24, [x23, #0x48]
100b5f7c8:     	ubfx	w21, w24, #11, #1
100b5f7cc:     	cbz	w22, 0x100b5f840 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x14f8>
100b5f7d0:     	tbnz	w24, #0x5, 0x100b5f848 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1500>
100b5f7d4:     	sturb	wzr, [x29, #-0xd0]
100b5f7d8:     	ldp	x26, x1, [x23, #0x28]
100b5f7dc:     	cbnz	x1, 0x100b5f7e8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x14a0>
100b5f7e0:     	ldr	x8, [x26, #0x10]
100b5f7e4:     	ldr	x1, [x8, #0xc8]
100b5f7e8:     	ldr	x0, [sp, #0x90]
100b5f7ec:     	bl	0x100b76cf4 <__Z16WM_keymap_activePK15wmWindowManagerP8wmKeyMap>
100b5f7f0:     	mov	x22, x0
100b5f7f4:     	sub	x7, x29, #0xd0
100b5f7f8:     	mov	x0, x25
100b5f7fc:     	mov	x1, x20
100b5f800:     	ldr	x2, [sp, #0x80]
100b5f804:     	mov	x3, x27
100b5f808:     	mov	x4, x26
100b5f80c:     	mov	x5, x22
100b5f810:     	ldr	w6, [sp, #0x9c]
100b5f814:     	bl	0x100b6035c <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb>
100b5f818:     	mov	x26, x0
100b5f81c:     	and	w8, w24, #0x800
100b5f820:     	bfxil	w8, w0, #0, #1
100b5f824:     	cbz	w8, 0x100b5f878 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1530>
100b5f828:     	tbz	w26, #0x0, 0x100b5fb80 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1838>
100b5f82c:     	b	0x100b5fbf4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x18ac>
100b5f830:     	mov	w21, #0x0               ; =0
100b5f834:     	mov	w26, #0x0               ; =0
100b5f838:     	tbnz	w22, #0x0, 0x100b5fb80 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1838>
100b5f83c:     	b	0x100b5fbf4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x18ac>
100b5f840:     	mov	w26, #0x0               ; =0
100b5f844:     	b	0x100b5fbf4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x18ac>
100b5f848:     	mov	w26, #0x0               ; =0
100b5f84c:     	b	0x100b5fb80 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1838>
100b5f850:     	ldrsh	w3, [x20, #0x12]
100b5f854:     	mov	x0, x24
100b5f858:     	mov	x1, x28
100b5f85c:     	mov	x2, x27
100b5f860:     	bl	0x100b58110 <__ZL24wm_handler_fileselect_doP8bContextP8ListBaseP17wmEventHandler_Opi>
100b5f864:     	b	0x100b5ea04 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x6bc>
100b5f868:     	ldrh	w10, [x20, #0x12]
100b5f86c:     	cmp	w10, #0x4
100b5f870:     	b.ne	0x100b5e7d0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x488>
100b5f874:     	b	0x100b5e818 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x4d0>
100b5f878:     	ldurb	w8, [x29, #-0xd0]
100b5f87c:     	cmp	w8, #0x1
100b5f880:     	b.ne	0x100b5fb7c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1834>
100b5f884:     	ldrh	w8, [x20, #0x12]
100b5f888:     	cmp	w8, #0x1
100b5f88c:     	b.ne	0x100b5fb7c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1834>
100b5f890:     	ldrh	w23, [x20, #0x10]
100b5f894:     	sub	w8, w23, #0x1
100b5f898:     	cmp	w8, #0x2
100b5f89c:     	b.hi	0x100b5fb7c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1834>
100b5f8a0:     	ldr	x22, [x22, #0x10]
100b5f8a4:     	cbz	x22, 0x100b5fb7c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1834>
100b5f8a8:     	ldrb	w21, [x20, #0x2b]
100b5f8ac:     	ldrh	w10, [x20, #0x2c]
100b5f8b0:     	ldr	w24, [x20, #0x7c]
100b5f8b4:     	ldrb	w8, [x20, #0x2a]
100b5f8b8:     	ubfx	w11, w8, #1, #1
100b5f8bc:     	ubfx	w9, w8, #2, #1
100b5f8c0:     	stp	w9, w11, [sp, #0x38]
100b5f8c4:     	ldr	w9, [x20, #0x30]
100b5f8c8:     	str	w9, [sp, #0x48]
100b5f8cc:     	and	w9, w8, #0x1
100b5f8d0:     	str	w9, [sp, #0x54]
100b5f8d4:     	and	w9, w23, #0xff
100b5f8d8:     	str	w9, [sp, #0x40]
100b5f8dc:     	ubfx	w9, w8, #3, #1
100b5f8e0:     	str	w9, [sp, #0x34]
100b5f8e4:     	ubfx	w8, w8, #4, #1
100b5f8e8:     	stp	w10, w8, [sp, #0x2c]
100b5f8ec:     	b	0x100b5f8f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15b0>
100b5f8f0:     	ldr	x22, [x22]
100b5f8f4:     	cbz	x22, 0x100b5fd78 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a30>
100b5f8f8:     	ldrb	w8, [x22, #0xac]
100b5f8fc:     	tbnz	w8, #0x0, 0x100b5f8f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a8>
100b5f900:     	tbz	w24, #0x1, 0x100b5f954 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x160c>
100b5f904:     	tbz	w8, #0x4, 0x100b5f954 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x160c>
100b5f908:     	ldrb	w8, [x22, #0xac]
100b5f90c:     	tbnz	w8, #0x0, 0x100b5f8f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a8>
100b5f910:     	tbz	w24, #0x1, 0x100b5f918 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15d0>
100b5f914:     	tbnz	w8, #0x4, 0x100b5f8f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a8>
100b5f918:     	ldrsh	w0, [x22, #0x9a]
100b5f91c:     	bl	0x100b4d62c <__Z20WM_userdef_event_mapi>
100b5f920:     	cmn	w0, #0x1
100b5f924:     	b.eq	0x100b5fa5c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1714>
100b5f928:     	and	w8, w0, #0xfffffffe
100b5f92c:     	cmp	w8, #0x1a
100b5f930:     	b.ne	0x100b5fa54 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x170c>
100b5f934:     	cmp	w23, #0x1
100b5f938:     	b.ne	0x100b5f8f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a8>
100b5f93c:     	cmp	w0, #0x1a
100b5f940:     	b.ne	0x100b5fb6c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1824>
100b5f944:     	ldr	w8, [sp, #0x48]
100b5f948:     	cmp	w8, #0x1
100b5f94c:     	b.ne	0x100b5f8f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a8>
100b5f950:     	b	0x100b5fa5c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1714>
100b5f954:     	ldrsh	w0, [x22, #0x9a]
100b5f958:     	bl	0x100b4d62c <__Z20WM_userdef_event_mapi>
100b5f95c:     	cmn	w0, #0x1
100b5f960:     	b.eq	0x100b5f998 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1650>
100b5f964:     	and	w8, w0, #0xfffffffe
100b5f968:     	cmp	w8, #0x1a
100b5f96c:     	b.ne	0x100b5f990 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1648>
100b5f970:     	cmp	w23, #0x1
100b5f974:     	b.ne	0x100b5f908 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15c0>
100b5f978:     	cmp	w0, #0x1a
100b5f97c:     	b.ne	0x100b5fb5c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1814>
100b5f980:     	ldr	w8, [sp, #0x48]
100b5f984:     	cmp	w8, #0x1
100b5f988:     	b.ne	0x100b5f908 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15c0>
100b5f98c:     	b	0x100b5f998 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1650>
100b5f990:     	cmp	w0, w23
100b5f994:     	b.ne	0x100b5f908 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15c0>
100b5f998:     	ldrb	w8, [x22, #0x9c]
100b5f99c:     	cmp	w8, #0xff
100b5f9a0:     	b.eq	0x100b5f9ac <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1664>
100b5f9a4:     	cmp	w8, #0x3
100b5f9a8:     	b.ne	0x100b5f908 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15c0>
100b5f9ac:     	ldrb	w8, [x22, #0x9e]
100b5f9b0:     	cmp	w8, #0xff
100b5f9b4:     	b.eq	0x100b5f9c4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x167c>
100b5f9b8:     	ldr	w9, [sp, #0x54]
100b5f9bc:     	cmp	w9, w8
100b5f9c0:     	b.ne	0x100b5f908 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15c0>
100b5f9c4:     	ldrb	w8, [x22, #0x9f]
100b5f9c8:     	cmp	w8, #0xff
100b5f9cc:     	b.eq	0x100b5f9f4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16ac>
100b5f9d0:     	ldr	w9, [sp, #0x3c]
100b5f9d4:     	cmp	w9, w8
100b5f9d8:     	b.eq	0x100b5f9f4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16ac>
100b5f9dc:     	ldr	w8, [sp, #0x40]
100b5f9e0:     	cmp	w8, #0xd7
100b5f9e4:     	b.eq	0x100b5f9f4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16ac>
100b5f9e8:     	ldr	w8, [sp, #0x40]
100b5f9ec:     	cmp	w8, #0xd4
100b5f9f0:     	b.ne	0x100b5f908 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15c0>
100b5f9f4:     	ldrb	w8, [x22, #0xa0]
100b5f9f8:     	cmp	w8, #0xff
100b5f9fc:     	b.eq	0x100b5fa0c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16c4>
100b5fa00:     	ldr	w9, [sp, #0x38]
100b5fa04:     	cmp	w9, w8
100b5fa08:     	b.ne	0x100b5f908 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15c0>
100b5fa0c:     	ldrb	w8, [x22, #0xa1]
100b5fa10:     	cmp	w8, #0xff
100b5fa14:     	b.eq	0x100b5fa24 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16dc>
100b5fa18:     	ldr	w9, [sp, #0x34]
100b5fa1c:     	cmp	w9, w8
100b5fa20:     	b.ne	0x100b5f908 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15c0>
100b5fa24:     	ldrb	w8, [x22, #0xa2]
100b5fa28:     	cmp	w8, #0xff
100b5fa2c:     	b.eq	0x100b5fa3c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16f4>
100b5fa30:     	ldr	w9, [sp, #0x30]
100b5fa34:     	cmp	w9, w8
100b5fa38:     	b.ne	0x100b5f908 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15c0>
100b5fa3c:     	ldrh	w8, [x22, #0xaa]
100b5fa40:     	cbz	w8, 0x100b5fb28 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x17e0>
100b5fa44:     	ldr	w9, [sp, #0x2c]
100b5fa48:     	cmp	w9, w8
100b5fa4c:     	b.ne	0x100b5f908 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15c0>
100b5fa50:     	b	0x100b5fb28 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x17e0>
100b5fa54:     	cmp	w0, w23
100b5fa58:     	b.ne	0x100b5f8f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a8>
100b5fa5c:     	ldrb	w8, [x22, #0x9c]
100b5fa60:     	cmp	w8, #0xff
100b5fa64:     	b.eq	0x100b5fa84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x173c>
100b5fa68:     	cmp	w8, #0x5
100b5fa6c:     	b.ne	0x100b5f8f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a8>
100b5fa70:     	ldrb	w8, [x22, #0x9d]
100b5fa74:     	cmp	w8, #0xff
100b5fa78:     	b.eq	0x100b5fa84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x173c>
100b5fa7c:     	cmp	w8, w21
100b5fa80:     	b.ne	0x100b5f8f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a8>
100b5fa84:     	ldrb	w8, [x22, #0x9e]
100b5fa88:     	cmp	w8, #0xff
100b5fa8c:     	b.eq	0x100b5fa9c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1754>
100b5fa90:     	ldr	w9, [sp, #0x54]
100b5fa94:     	cmp	w9, w8
100b5fa98:     	b.ne	0x100b5f8f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a8>
100b5fa9c:     	ldrb	w8, [x22, #0x9f]
100b5faa0:     	cmp	w8, #0xff
100b5faa4:     	b.eq	0x100b5facc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1784>
100b5faa8:     	ldr	w9, [sp, #0x3c]
100b5faac:     	cmp	w9, w8
100b5fab0:     	b.eq	0x100b5facc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1784>
100b5fab4:     	ldr	w8, [sp, #0x40]
100b5fab8:     	cmp	w8, #0xd7
100b5fabc:     	b.eq	0x100b5facc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1784>
100b5fac0:     	ldr	w8, [sp, #0x40]
100b5fac4:     	cmp	w8, #0xd4
100b5fac8:     	b.ne	0x100b5f8f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a8>
100b5facc:     	ldrb	w8, [x22, #0xa0]
100b5fad0:     	cmp	w8, #0xff
100b5fad4:     	b.eq	0x100b5fae4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x179c>
100b5fad8:     	ldr	w9, [sp, #0x38]
100b5fadc:     	cmp	w9, w8
100b5fae0:     	b.ne	0x100b5f8f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a8>
100b5fae4:     	ldrb	w8, [x22, #0xa1]
100b5fae8:     	cmp	w8, #0xff
100b5faec:     	b.eq	0x100b5fafc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x17b4>
100b5faf0:     	ldr	w9, [sp, #0x34]
100b5faf4:     	cmp	w9, w8
100b5faf8:     	b.ne	0x100b5f8f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a8>
100b5fafc:     	ldrb	w8, [x22, #0xa2]
100b5fb00:     	cmp	w8, #0xff
100b5fb04:     	b.eq	0x100b5fb14 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x17cc>
100b5fb08:     	ldr	w9, [sp, #0x30]
100b5fb0c:     	cmp	w9, w8
100b5fb10:     	b.ne	0x100b5f8f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a8>
100b5fb14:     	ldrh	w8, [x22, #0xaa]
100b5fb18:     	cbz	w8, 0x100b5fb28 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x17e0>
100b5fb1c:     	ldr	w9, [sp, #0x2c]
100b5fb20:     	cmp	w9, w8
100b5fb24:     	b.ne	0x100b5f8f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a8>
100b5fb28:     	add	x0, x22, #0x10
100b5fb2c:     	mov	w1, #0x0                ; =0
100b5fb30:     	bl	0x100b7d198 <__Z20WM_operatortype_findPKcb>
100b5fb34:     	mov	x1, x0
100b5fb38:     	mov	x0, x25
100b5fb3c:     	mov	x2, #0x0                ; =0
100b5fb40:     	mov	x3, #0x0                ; =0
100b5fb44:     	mov	w4, #0x0                ; =0
100b5fb48:     	mov	w5, #0x1                ; =1
100b5fb4c:     	mov	x6, #0x0                ; =0
100b5fb50:     	bl	0x100b4ebdc <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent>
100b5fb54:     	cbz	w0, 0x100b5f8f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a8>
100b5fb58:     	b	0x100b5fd98 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a50>
100b5fb5c:     	ldr	w8, [sp, #0x48]
100b5fb60:     	cmp	w8, #0x2
100b5fb64:     	b.ne	0x100b5f908 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15c0>
100b5fb68:     	b	0x100b5f998 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1650>
100b5fb6c:     	ldr	w8, [sp, #0x48]
100b5fb70:     	cmp	w8, #0x2
100b5fb74:     	b.eq	0x100b5fa5c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1714>
100b5fb78:     	b	0x100b5f8f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a8>
100b5fb7c:     	mov	w21, #0x0               ; =0
100b5fb80:     	ldr	x0, [sp, #0x78]
100b5fb84:     	bl	0x100b3f850 <__Z27WM_gizmomap_is_any_selectedPK10wmGizmoMap>
100b5fb88:     	cbz	w0, 0x100b5fbf4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x18ac>
100b5fb8c:     	ldr	x0, [sp, #0x78]
100b5fb90:     	bl	0x100b3f848 <__Z22WM_gizmomap_group_listP10wmGizmoMap>
100b5fb94:     	ldr	x23, [x0]
100b5fb98:     	cbz	x23, 0x100b5fbf4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x18ac>
100b5fb9c:     	mov	x22, x25
100b5fba0:     	b	0x100b5fbac <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1864>
100b5fba4:     	ldr	x23, [x23]
100b5fba8:     	cbz	x23, 0x100b5fbf4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x18ac>
100b5fbac:     	mov	x0, x23
100b5fbb0:     	bl	0x100b3d0f4 <__Z29wm_gizmogroup_is_any_selectedPK12wmGizmoGroup>
100b5fbb4:     	cbz	w0, 0x100b5fba4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x185c>
100b5fbb8:     	ldr	x8, [x23, #0x10]
100b5fbbc:     	ldr	x1, [x8, #0xc8]
100b5fbc0:     	ldr	x0, [sp, #0x90]
100b5fbc4:     	bl	0x100b76cf4 <__Z16WM_keymap_activePK15wmWindowManagerP8wmKeyMap>
100b5fbc8:     	mov	x5, x0
100b5fbcc:     	mov	x0, x22
100b5fbd0:     	mov	x1, x20
100b5fbd4:     	ldr	x2, [sp, #0x80]
100b5fbd8:     	mov	x3, x27
100b5fbdc:     	mov	x4, x23
100b5fbe0:     	ldr	w6, [sp, #0x9c]
100b5fbe4:     	mov	x7, #0x0                ; =0
100b5fbe8:     	bl	0x100b6035c <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb>
100b5fbec:     	orr	w26, w0, w26
100b5fbf0:     	tbz	w26, #0x0, 0x100b5fba4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x185c>
100b5fbf4:     	ldr	w8, [sp, #0x60]
100b5fbf8:     	tbnz	w8, #0x0, 0x100b5fc28 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x18e0>
100b5fbfc:     	ldr	x0, [sp, #0x78]
100b5fc00:     	bl	0x100b40578 <__Z21wm_gizmomap_modal_getP10wmGizmoMap>
100b5fc04:     	cbz	x0, 0x100b5fc14 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x18cc>
100b5fc08:     	ldr	x8, [sp, #0x68]
100b5fc0c:     	cmp	x0, x8
100b5fc10:     	b.ne	0x100b5fc28 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x18e0>
100b5fc14:     	ldr	x0, [sp, #0x78]
100b5fc18:     	mov	x1, x25
100b5fc1c:     	mov	x2, x28
100b5fc20:     	ldr	w3, [sp, #0x58]
100b5fc24:     	bl	0x100b40580 <__Z25wm_gizmomap_highlight_setP10wmGizmoMapPK8bContextP7wmGizmoi>
100b5fc28:     	mov	x0, x25
100b5fc2c:     	ldr	x1, [sp, #0x70]
100b5fc30:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b5fc34:     	cmp	w26, #0x0
100b5fc38:     	cset	w8, eq
100b5fc3c:     	tst	w21, w8
100b5fc40:     	mov	w8, #0x5                ; =5
100b5fc44:     	csel	w22, w8, w26, ne
100b5fc48:     	mov	x0, x25
100b5fc4c:     	ldr	x1, [sp, #0xb8]
100b5fc50:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b5fc54:     	mov	x24, x25
100b5fc58:     	ldr	x28, [sp, #0x80]
100b5fc5c:     	ldr	w8, [sp, #0xc4]
100b5fc60:     	orr	w8, w22, w8
100b5fc64:     	str	w8, [sp, #0xc4]
100b5fc68:     	ldr	w9, [sp, #0xc4]
100b5fc6c:     	ldr	w8, [sp, #0x8c]
100b5fc70:     	and	w8, w9, w8
100b5fc74:     	tbz	w8, #0x0, 0x100b5fc84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x193c>
100b5fc78:     	and	w9, w9, #0x6
100b5fc7c:     	str	w9, [sp, #0xc4]
100b5fc80:     	b	0x100b5fc88 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1940>
100b5fc84:     	tbnz	w9, #0x0, 0x100b5fda8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a60>
100b5fc88:     	mov	x0, x24
100b5fc8c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5fc90:     	cbz	x0, 0x100b5fde4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a9c>
100b5fc94:     	mov	x0, x28
100b5fc98:     	mov	x1, x27
100b5fc9c:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b5fca0:     	cmn	w0, #0x1
100b5fca4:     	b.eq	0x100b5e5f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2b0>
100b5fca8:     	ldrb	w8, [x27, #0x14]
100b5fcac:     	tbz	w8, #0x7, 0x100b5e5f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2b0>
100b5fcb0:     	mov	x0, x28
100b5fcb4:     	mov	x1, x27
100b5fcb8:     	bl	0x10078fea0 <__Z11BLI_remlinkP8ListBasePv>
100b5fcbc:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5fcc0:     	add	x8, x8, #0x710
100b5fcc4:     	ldr	x8, [x8]
100b5fcc8:     	mov	x0, x27
100b5fccc:     	mov	w1, #0x0                ; =0
100b5fcd0:     	blr	x8
100b5fcd4:     	b	0x100b5e5f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2b0>
100b5fcd8:     	ldr	x21, [x27, #0x48]
100b5fcdc:     	cbz	x21, 0x100b5ea84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x73c>
100b5fce0:     	add	x0, x21, #0x10
100b5fce4:     	adrp	x1, 0x104bd4000 <__ZL3hex+0x45cd>
100b5fce8:     	add	x1, x1, #0xb1
100b5fcec:     	bl	0x104b76bdc <_zlibVersion+0x104b76bdc>
100b5fcf0:     	cbnz	w0, 0x100b5ea84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x73c>
100b5fcf4:     	ldr	x8, [x21, #0xe0]
100b5fcf8:     	cbz	x8, 0x100b5ea84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x73c>
100b5fcfc:     	mov	x0, x24
100b5fd00:     	bl	0x101654804 <__Z20ED_operator_editmeshP8bContext>
100b5fd04:     	cbz	w0, 0x100b5ea84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x73c>
100b5fd08:     	ldr	x8, [x27, #0x38]
100b5fd0c:     	adrp	x9, 0x100b59000 <__Z29WM_event_consecutive_data_setP8wmWindowPKcPv+0x38>
100b5fd10:     	add	x9, x9, #0x8ec
100b5fd14:     	cmp	x8, x9
100b5fd18:     	b.eq	0x100b5fd2c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x19e4>
100b5fd1c:     	adrp	x9, 0x100b59000 <__Z29WM_event_consecutive_data_setP8wmWindowPKcPv+0x38>
100b5fd20:     	add	x9, x9, #0xb00
100b5fd24:     	cmp	x8, x9
100b5fd28:     	b.ne	0x100b5ea84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x73c>
100b5fd2c:     	ldr	w8, [sp, #0xe8]
100b5fd30:     	cmp	w8, #0x1
100b5fd34:     	b.le	0x100b5ea88 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x740>
100b5fd38:     	ldr	x9, [x27, #0x48]
100b5fd3c:     	ldr	x22, [x9, #0xe0]
100b5fd40:     	lsl	x23, x8, #3
100b5fd44:     	mov	w21, #0x8               ; =8
100b5fd48:     	mov	x25, x24
100b5fd4c:     	add	x8, sp, #0xd0
100b5fd50:     	ldr	x24, [x8, x21]
100b5fd54:     	add	x0, x24, #0x30
100b5fd58:     	add	x1, x22, #0x4
100b5fd5c:     	bl	0x104b76bdc <_zlibVersion+0x104b76bdc>
100b5fd60:     	cbz	w0, 0x100b5fd80 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a38>
100b5fd64:     	add	x21, x21, #0x8
100b5fd68:     	cmp	x23, x21
100b5fd6c:     	mov	x24, x25
100b5fd70:     	b.ne	0x100b5fd48 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a00>
100b5fd74:     	b	0x100b5ea84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x73c>
100b5fd78:     	mov	w21, #0x0               ; =0
100b5fd7c:     	b	0x100b5f828 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x14e0>
100b5fd80:     	ldr	x8, [sp, #0xd0]
100b5fd84:     	str	x24, [sp, #0xd0]
100b5fd88:     	add	x9, sp, #0xd0
100b5fd8c:     	str	x8, [x9, x21]
100b5fd90:     	mov	x24, x25
100b5fd94:     	b	0x100b5ea84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x73c>
100b5fd98:     	mov	w21, #0x1               ; =1
100b5fd9c:     	b	0x100b5f828 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x14e0>
100b5fda0:     	str	wzr, [sp, #0xc4]
100b5fda4:     	b	0x100b5fde4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a9c>
100b5fda8:     	ldr	w10, [sp, #0xc4]
100b5fdac:     	cmp	w10, #0x5
100b5fdb0:     	b.ne	0x100b5fdd0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a88>
100b5fdb4:     	mov	x0, x24
100b5fdb8:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5fdbc:     	mov	x1, x20
100b5fdc0:     	bl	0x100b448a4 <__Z20wm_cursor_arrow_moveP8wmWindowPK7wmEvent>
100b5fdc4:     	mov	w10, #0x5               ; =5
100b5fdc8:     	b	0x100b5fdd0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a88>
100b5fdcc:     	mov	w10, #0x0               ; =0
100b5fdd0:     	orr	w8, w10, #0x3
100b5fdd4:     	ldr	w9, [sp, #0xb4]
100b5fdd8:     	cmp	w9, #0x0
100b5fddc:     	csel	w10, w8, w10, ne
100b5fde0:     	str	w10, [sp, #0xc4]
100b5fde4:     	ldp	q0, q1, [sp, #0x190]
100b5fde8:     	stp	q0, q1, [x19, #0xa0]
100b5fdec:     	ldrb	w8, [sp, #0x1b0]
100b5fdf0:     	strb	w8, [x19, #0xc0]
100b5fdf4:     	ldp	q0, q1, [sp, #0x150]
100b5fdf8:     	stp	q0, q1, [x19, #0x60]
100b5fdfc:     	ldp	q1, q0, [sp, #0x170]
100b5fe00:     	stp	q1, q0, [x19, #0x80]
100b5fe04:     	ldp	q0, q1, [sp, #0x110]
100b5fe08:     	stp	q0, q1, [x19, #0x20]
100b5fe0c:     	ldp	q1, q0, [sp, #0x130]
100b5fe10:     	stp	q1, q0, [x19, #0x40]
100b5fe14:     	ldp	q1, q0, [sp, #0xf0]
100b5fe18:     	stp	q1, q0, [x19]
100b5fe1c:     	adrp	x8, 0x106369000 <_zlibVersion+0x106369000>
100b5fe20:     	ldr	x8, [x8, #0x7f8]
100b5fe24:     	ldr	x8, [x8]
100b5fe28:     	ldur	x9, [x29, #-0x60]
100b5fe2c:     	cmp	x8, x9
100b5fe30:     	b.ne	0x100b5fe58 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b10>
100b5fe34:     	ldr	w0, [sp, #0xc4]
100b5fe38:     	add	sp, sp, #0x2e0
100b5fe3c:     	ldp	x29, x30, [sp, #0x50]
100b5fe40:     	ldp	x20, x19, [sp, #0x40]
100b5fe44:     	ldp	x22, x21, [sp, #0x30]
100b5fe48:     	ldp	x24, x23, [sp, #0x20]
100b5fe4c:     	ldp	x26, x25, [sp, #0x10]
100b5fe50:     	ldp	x28, x27, [sp], #0x60
100b5fe54:     	ret
100b5fe58:     	bl	0x104b7534c <_zlibVersion+0x104b7534c>
100b5fe5c:     	add	x0, sp, #0x1f0
100b5fe60:     	bl	0x100023e44 <__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne190102Ev>
100b5fe64:     	brk	#0x1
100b5fe68:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5fe6c:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5fe70:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5fe74:     	mov	x20, x0
100b5fe78:     	b	0x100b5ff20 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bd8>
100b5fe7c:     	mov	x20, x0
100b5fe80:     	b	0x100b5ff20 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bd8>
100b5fe84:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5fe88:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5fe8c:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5fe90:     	mov	x20, x0
100b5fe94:     	b	0x100b5ff20 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bd8>
100b5fe98:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5fe9c:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5fea0:     	mov	x20, x0
100b5fea4:     	b	0x100b5ff20 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bd8>
100b5fea8:     	mov	x20, x0
100b5feac:     	b	0x100b5ff20 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bd8>
100b5feb0:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5feb4:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5feb8:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5febc:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5fec0:     	mov	x20, x0
100b5fec4:     	ldrsb	w8, [sp, #0x207]
100b5fec8:     	tbz	w8, #0x1f, 0x100b5fed4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b8c>
100b5fecc:     	ldr	x0, [sp, #0x1f0]
100b5fed0:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b5fed4:     	ldurb	w8, [x29, #-0xb8]
100b5fed8:     	cmp	w8, #0x1
100b5fedc:     	b.ne	0x100b5fef8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bb0>
100b5fee0:     	ldursb	w8, [x29, #-0xb9]
100b5fee4:     	tbz	w8, #0x1f, 0x100b5fef8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bb0>
100b5fee8:     	ldur	x0, [x29, #-0xd0]
100b5feec:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b5fef0:     	b	0x100b5fef8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bb0>
100b5fef4:     	mov	x20, x0
100b5fef8:     	ldrsb	w8, [sp, #0x1cf]
100b5fefc:     	tbz	w8, #0x1f, 0x100b5ff64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c1c>
100b5ff00:     	ldr	x0, [sp, #0x1b8]
100b5ff04:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b5ff08:     	b	0x100b5ff64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c1c>
100b5ff0c:     	mov	x20, x0
100b5ff10:     	ldrsb	w8, [sp, #0x1e7]
100b5ff14:     	tbz	w8, #0x1f, 0x100b5ff20 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bd8>
100b5ff18:     	ldr	x0, [sp, #0x1d0]
100b5ff1c:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b5ff20:     	ldrb	w8, [sp, #0x208]
100b5ff24:     	cmp	w8, #0x1
100b5ff28:     	b.ne	0x100b5ff64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c1c>
100b5ff2c:     	ldrsb	w8, [sp, #0x207]
100b5ff30:     	tbz	w8, #0x1f, 0x100b5ff64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c1c>
100b5ff34:     	ldr	x0, [sp, #0x1f0]
100b5ff38:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b5ff3c:     	b	0x100b5ff64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c1c>
100b5ff40:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5ff44:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5ff48:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5ff4c:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5ff50:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5ff54:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5ff58:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5ff5c:     	b	0x100b5ff60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c18>
100b5ff60:     	mov	x20, x0
100b5ff64:     	ldp	q0, q1, [sp, #0x190]
100b5ff68:     	stp	q0, q1, [x19, #0xa0]
100b5ff6c:     	ldrb	w8, [sp, #0x1b0]
100b5ff70:     	strb	w8, [x19, #0xc0]
100b5ff74:     	ldp	q0, q1, [sp, #0x150]
100b5ff78:     	stp	q0, q1, [x19, #0x60]
100b5ff7c:     	ldp	q1, q0, [sp, #0x170]
100b5ff80:     	stp	q1, q0, [x19, #0x80]
100b5ff84:     	ldp	q0, q1, [sp, #0x110]
100b5ff88:     	stp	q0, q1, [x19, #0x20]
100b5ff8c:     	ldp	q1, q0, [sp, #0x130]
100b5ff90:     	stp	q1, q0, [x19, #0x40]
100b5ff94:     	ldp	q1, q0, [sp, #0xf0]
100b5ff98:     	stp	q1, q0, [x19]
100b5ff9c:     	mov	x0, x20
100b5ffa0:     	bl	0x104b72c1c <_zlibVersion+0x104b72c1c>
