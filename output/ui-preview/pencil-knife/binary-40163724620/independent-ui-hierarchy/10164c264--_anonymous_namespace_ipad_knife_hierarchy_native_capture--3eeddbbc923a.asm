
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010164c264 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE>:
10164c264:     	sub	sp, sp, #0x140
10164c268:     	stp	d11, d10, [sp, #0xc0]
10164c26c:     	stp	d9, d8, [sp, #0xd0]
10164c270:     	stp	x28, x27, [sp, #0xe0]
10164c274:     	stp	x26, x25, [sp, #0xf0]
10164c278:     	stp	x24, x23, [sp, #0x100]
10164c27c:     	stp	x22, x21, [sp, #0x110]
10164c280:     	stp	x20, x19, [sp, #0x120]
10164c284:     	stp	x29, x30, [sp, #0x130]
10164c288:     	add	x29, sp, #0x130
10164c28c:     	mov	x19, x2
10164c290:     	mov	x21, x1
10164c294:     	mov	x22, x0
10164c298:     	mov	x25, x2
10164c29c:     	ldr	x0, [x25, #0x48]!
10164c2a0:     	stur	xzr, [x2, #0x3d]
10164c2a4:     	movi.16b	v0, #0x0
10164c2a8:     	stp	q0, q0, [x2, #0x20]
10164c2ac:     	stp	q0, q0, [x2]
10164c2b0:     	cbz	x0, 0x10164c2bc <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x58>
10164c2b4:     	str	x0, [x19, #0x50]
10164c2b8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10164c2bc:     	mov	x24, x19
10164c2c0:     	ldr	x0, [x24, #0x60]!
10164c2c4:     	stp	xzr, xzr, [x25]
10164c2c8:     	str	xzr, [x25, #0x10]
10164c2cc:     	cbz	x0, 0x10164c2d8 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x74>
10164c2d0:     	str	x0, [x19, #0x68]
10164c2d4:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10164c2d8:     	mov	x28, x19
10164c2dc:     	ldr	x0, [x28, #0x78]!
10164c2e0:     	stp	xzr, xzr, [x24]
10164c2e4:     	str	xzr, [x24, #0x10]
10164c2e8:     	cbz	x0, 0x10164c2f4 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x90>
10164c2ec:     	str	x0, [x19, #0x80]
10164c2f0:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10164c2f4:     	str	x19, [sp, #0x90]
10164c2f8:     	stp	xzr, xzr, [x28]
10164c2fc:     	str	xzr, [x28, #0x10]
10164c300:     	mov	x0, x22
10164c304:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10164c308:     	mov	x23, x0
10164c30c:     	mov	w0, #0x0                ; =0
10164c310:     	cbz	x21, 0x10164c32c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xc8>
10164c314:     	cbz	x23, 0x10164c32c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xc8>
10164c318:     	mov	x0, x22
10164c31c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
10164c320:     	cmp	x0, x21
10164c324:     	b.eq	0x10164c354 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xf0>
10164c328:     	mov	w0, #0x0                ; =0
10164c32c:     	ldp	x29, x30, [sp, #0x130]
10164c330:     	ldp	x20, x19, [sp, #0x120]
10164c334:     	ldp	x22, x21, [sp, #0x110]
10164c338:     	ldp	x24, x23, [sp, #0x100]
10164c33c:     	ldp	x26, x25, [sp, #0xf0]
10164c340:     	ldp	x28, x27, [sp, #0xe0]
10164c344:     	ldp	d9, d8, [sp, #0xd0]
10164c348:     	ldp	d11, d10, [sp, #0xc0]
10164c34c:     	add	sp, sp, #0x140
10164c350:     	ret
10164c354:     	add	x0, x23, #0x1a0
10164c358:     	mov	x1, x21
10164c35c:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10164c360:     	cmn	w0, #0x1
10164c364:     	b.eq	0x10164c328 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xc4>
10164c368:     	mov	x0, x21
10164c36c:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
10164c370:     	cbz	x0, 0x10164c32c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xc8>
10164c374:     	adrp	x8, 0x106d88000 <_build_commit_date>
10164c378:     	add	x8, x8, #0x28
10164c37c:     	ldrb	w9, [x8, #0xc21]
10164c380:     	tbnz	w9, #0x0, 0x10164c328 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xc4>
10164c384:     	ldrb	w9, [x0, #0x1ee]
10164c388:     	cbnz	w9, 0x10164c328 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xc4>
10164c38c:     	ldrb	w9, [x0, #0x1ef]
10164c390:     	cbnz	w9, 0x10164c328 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xc4>
10164c394:     	ldr	x8, [x8]
10164c398:     	ldr	w9, [x23, #0x144]
10164c39c:     	ldrsw	x10, [x21, #0xc0]
10164c3a0:     	ldr	w11, [x0, #0x144]
10164c3a4:     	ldr	x20, [sp, #0x90]
10164c3a8:     	stp	x8, x23, [x20]
10164c3ac:     	stp	x9, x21, [x20, #0x10]
10164c3b0:     	stp	x10, x0, [x20, #0x20]
10164c3b4:     	str	x11, [x20, #0x30]
10164c3b8:     	mov	x19, x0
10164c3bc:     	mov	x0, x21
10164c3c0:     	bl	0x100b96a54 <__Z24WM_window_native_pixel_xPK8wmWindow>
10164c3c4:     	str	w0, [x20, #0x38]
10164c3c8:     	mov	x0, x21
10164c3cc:     	bl	0x100b96a8c <__Z24WM_window_native_pixel_yPK8wmWindow>
10164c3d0:     	mov	x8, x19
10164c3d4:     	str	w0, [x20, #0x3c]
10164c3d8:     	adrp	x9, 0x106d88000 <_build_commit_date>
10164c3dc:     	add	x9, x9, #0xe08
10164c3e0:     	ldr	s0, [x9, #0x2654]
10164c3e4:     	str	s0, [x20, #0x40]
10164c3e8:     	ldrb	w9, [x19, #0x1f1]
10164c3ec:     	cbz	w9, 0x10164c3f8 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x194>
10164c3f0:     	mov	w9, #0x0                ; =0
10164c3f4:     	b	0x10164c404 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x1a0>
10164c3f8:     	ldr	x9, [x21, #0x140]
10164c3fc:     	cmp	x9, #0x0
10164c400:     	cset	w9, eq
10164c404:     	strb	w9, [x20, #0x44]
10164c408:     	ldr	x21, [x8, #0x1c0]
10164c40c:     	cbz	x21, 0x10164d14c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xee8>
10164c410:     	mov	x14, #-0x5555555555555556 ; =-6148914691236517206
10164c414:     	movk	x14, #0xaaab
10164c418:     	fmov	s8, #4.00000000
10164c41c:     	str	x25, [sp, #0x78]
10164c420:     	stp	x24, x28, [sp, #0x8]
10164c424:     	b	0x10164c440 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x1dc>
10164c428:     	ldr	x21, [sp, #0x88]
10164c42c:     	ldr	x21, [x21]
10164c430:     	mov	w0, #0x1                ; =1
10164c434:     	ldr	x25, [sp, #0x78]
10164c438:     	ldr	x28, [sp, #0x10]
10164c43c:     	cbz	x21, 0x10164c32c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xc8>
10164c440:     	ldrb	w8, [x21, #0x48]
10164c444:     	cmp	w8, #0x1
10164c448:     	b.ne	0x10164c470 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x20c>
10164c44c:     	ldr	x9, [x21, #0x68]
10164c450:     	ldr	x23, [sp, #0x90]
10164c454:     	cbz	x9, 0x10164c484 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x220>
10164c458:     	ldrb	w10, [x9, #0xf1]
10164c45c:     	tst	w10, #0x3
10164c460:     	b.eq	0x10164c490 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x22c>
10164c464:     	mov	w10, #0x0               ; =0
10164c468:     	str	wzr, [sp, #0x1c]
10164c46c:     	b	0x10164c4bc <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x258>
10164c470:     	mov	x9, #0x0                ; =0
10164c474:     	str	wzr, [sp, #0x1c]
10164c478:     	mov	w10, #0x1               ; =1
10164c47c:     	ldr	x23, [sp, #0x90]
10164c480:     	b	0x10164c4bc <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x258>
10164c484:     	str	wzr, [sp, #0x1c]
10164c488:     	mov	w10, #0x1               ; =1
10164c48c:     	b	0x10164c4bc <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x258>
10164c490:     	mov	w10, #0x0               ; =0
10164c494:     	adrp	x12, 0x106d88000 <_build_commit_date>
10164c498:     	add	x12, x12, #0xe08
10164c49c:     	mov	w11, #0x2626            ; =9766
10164c4a0:     	ldrb	w11, [x12, x11]
10164c4a4:     	ubfx	w11, w11, #1, #1
10164c4a8:     	mov	w13, #0x2623            ; =9763
10164c4ac:     	ldrb	w12, [x12, x13]
10164c4b0:     	tst	w12, #0xff
10164c4b4:     	csinc	w11, w11, wzr, ne
10164c4b8:     	str	w11, [sp, #0x1c]
10164c4bc:     	ldr	w22, [x21, #0xd8]
10164c4c0:     	ldrh	w11, [x21, #0x52]
10164c4c4:     	tbnz	w11, #0x3, 0x10164c4d4 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x270>
10164c4c8:     	mov	x26, #0x0               ; =0
10164c4cc:     	mov	x11, x22
10164c4d0:     	b	0x10164c4e8 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x284>
10164c4d4:     	strb	wzr, [x23, #0x44]
10164c4d8:     	ldrb	w8, [x21, #0x48]
10164c4dc:     	ldr	w11, [x21, #0xd8]
10164c4e0:     	ldrh	w12, [x21, #0x52]
10164c4e4:     	and	x26, x12, #0x8
10164c4e8:     	mov	x12, #0x5555555555555555 ; =6148914691236517205
10164c4ec:     	movk	x12, #0x155, lsl #48
10164c4f0:     	str	x21, [sp, #0x88]
10164c4f4:     	ldpsw	x2, x17, [x21, #0x38]!
10164c4f8:     	ldpsw	x19, x24, [x21, #0x8]
10164c4fc:     	tbz	w10, #0x0, 0x10164c508 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x2a4>
10164c500:     	mov	x27, #0x0               ; =0
10164c504:     	b	0x10164c50c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x2a8>
10164c508:     	ldrb	w27, [x9, #0xf1]
10164c50c:     	mov	w3, w8
10164c510:     	sxtw	x4, w11
10164c514:     	ldr	w8, [sp, #0x1c]
10164c518:     	mov	w11, w8
10164c51c:     	ldp	x8, x9, [x23, #0x50]
10164c520:     	cmp	x8, x9
10164c524:     	str	w22, [sp, #0x84]
10164c528:     	b.hs	0x10164c570 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x30c>
10164c52c:     	ldr	x9, [sp, #0x88]
10164c530:     	stp	xzr, x9, [x8]
10164c534:     	stp	x3, x4, [x8, #0x10]
10164c538:     	stp	x26, x2, [x8, #0x20]
10164c53c:     	stp	x17, x19, [x8, #0x30]
10164c540:     	stp	x24, x11, [x8, #0x40]
10164c544:     	str	x27, [x8, #0x50]
10164c548:     	movi.16b	v0, #0x0
10164c54c:     	stur	q0, [x8, #0x58]
10164c550:     	stur	q0, [x8, #0x68]
10164c554:     	stur	q0, [x8, #0x78]
10164c558:     	stur	q0, [x8, #0x88]
10164c55c:     	stur	q0, [x8, #0x98]
10164c560:     	stur	q0, [x8, #0xa8]
10164c564:     	add	x19, x8, #0xc0
10164c568:     	str	xzr, [x8, #0xb8]
10164c56c:     	b	0x10164c67c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x418>
10164c570:     	ldr	x22, [x25]
10164c574:     	sub	x23, x8, x22
10164c578:     	asr	x8, x23, #6
10164c57c:     	mul	x28, x8, x14
10164c580:     	add	x8, x28, #0x1
10164c584:     	cmp	x8, x12
10164c588:     	b.hi	0x10164d154 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xef0>
10164c58c:     	sub	x9, x9, x22
10164c590:     	asr	x9, x9, #6
10164c594:     	mul	x9, x9, x14
10164c598:     	lsl	x10, x9, #1
10164c59c:     	cmp	x10, x8
10164c5a0:     	csel	x8, x10, x8, hi
10164c5a4:     	mov	x10, #-0x5555555555555556 ; =-6148914691236517206
10164c5a8:     	movk	x10, #0xaa, lsl #48
10164c5ac:     	cmp	x9, x10
10164c5b0:     	csel	x25, x8, x12, lo
10164c5b4:     	cbz	x25, 0x10164c5f0 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x38c>
10164c5b8:     	stp	x4, x3, [sp, #0x60]
10164c5bc:     	str	x11, [sp, #0x70]
10164c5c0:     	str	x2, [sp, #0x98]
10164c5c4:     	cmp	x25, x12
10164c5c8:     	b.hi	0x10164d15c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xef8>
10164c5cc:     	mov	x20, x17
10164c5d0:     	add	x8, x25, x25, lsl #1
10164c5d4:     	lsl	x0, x8, #6
10164c5d8:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10164c5dc:     	mov	x17, x20
10164c5e0:     	ldr	x2, [sp, #0x98]
10164c5e4:     	ldp	x3, x11, [sp, #0x68]
10164c5e8:     	ldr	x4, [sp, #0x60]
10164c5ec:     	b	0x10164c5f4 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x390>
10164c5f0:     	mov	x0, #0x0                ; =0
10164c5f4:     	mov	w10, #0xc0              ; =192
10164c5f8:     	madd	x8, x28, x10, x0
10164c5fc:     	ldr	x9, [sp, #0x88]
10164c600:     	stp	xzr, x9, [x8]
10164c604:     	stp	x3, x4, [x8, #0x10]
10164c608:     	madd	x20, x25, x10, x0
10164c60c:     	stp	x26, x2, [x8, #0x20]
10164c610:     	stp	x17, x19, [x8, #0x30]
10164c614:     	stp	x24, x11, [x8, #0x40]
10164c618:     	str	x27, [x8, #0x50]
10164c61c:     	movi.16b	v0, #0x0
10164c620:     	stur	q0, [x8, #0x58]
10164c624:     	stur	q0, [x8, #0x68]
10164c628:     	stur	q0, [x8, #0x78]
10164c62c:     	stur	q0, [x8, #0x88]
10164c630:     	stur	q0, [x8, #0x98]
10164c634:     	stur	q0, [x8, #0xa8]
10164c638:     	add	x19, x8, #0xc0
10164c63c:     	sub	x24, x8, x23
10164c640:     	str	xzr, [x8, #0xb8]
10164c644:     	mov	x0, x24
10164c648:     	mov	x1, x22
10164c64c:     	mov	x2, x23
10164c650:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
10164c654:     	ldr	x23, [sp, #0x90]
10164c658:     	stp	x24, x19, [x23, #0x48]
10164c65c:     	str	x20, [x23, #0x58]
10164c660:     	cbz	x22, 0x10164c66c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x408>
10164c664:     	mov	x0, x22
10164c668:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10164c66c:     	ldr	x28, [sp, #0x10]
10164c670:     	mov	x14, #-0x5555555555555556 ; =-6148914691236517206
10164c674:     	movk	x14, #0xaaab
10164c678:     	ldr	w22, [sp, #0x84]
10164c67c:     	str	x19, [x23, #0x50]
10164c680:     	cmp	w22, #0x4
10164c684:     	ldr	x10, [sp, #0x88]
10164c688:     	b.eq	0x10164c7a0 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x53c>
10164c68c:     	ldr	w8, [x10, #0xd8]
10164c690:     	cmp	w8, #0x1
10164c694:     	b.eq	0x10164c7a0 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x53c>
10164c698:     	ldp	w9, w8, [x10, #0x38]
10164c69c:     	cmp	w8, w9
10164c6a0:     	b.lt	0x10164c7a0 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x53c>
10164c6a4:     	ldp	w9, w8, [x10, #0x40]
10164c6a8:     	cmp	w8, w9
10164c6ac:     	b.lt	0x10164c7a0 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x53c>
10164c6b0:     	ldr	q0, [x21]
10164c6b4:     	stur	q0, [x29, #-0x90]
10164c6b8:     	ldp	x9, x8, [x23, #0x80]
10164c6bc:     	cmp	x9, x8
10164c6c0:     	b.hs	0x10164c6d8 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x474>
10164c6c4:     	str	xzr, [x9]
10164c6c8:     	ldur	q0, [x29, #-0x90]
10164c6cc:     	stur	q0, [x9, #0x8]
10164c6d0:     	add	x19, x9, #0x18
10164c6d4:     	b	0x10164c798 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x534>
10164c6d8:     	ldr	x22, [x28]
10164c6dc:     	sub	x23, x9, x22
10164c6e0:     	asr	x9, x23, #3
10164c6e4:     	mul	x19, x9, x14
10164c6e8:     	add	x9, x19, #0x1
10164c6ec:     	mov	x11, #-0x5555555555555556 ; =-6148914691236517206
10164c6f0:     	movk	x11, #0xaaa, lsl #48
10164c6f4:     	cmp	x9, x11
10164c6f8:     	b.hi	0x10164d160 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xefc>
10164c6fc:     	sub	x8, x8, x22
10164c700:     	asr	x8, x8, #3
10164c704:     	mul	x8, x8, x14
10164c708:     	lsl	x10, x8, #1
10164c70c:     	cmp	x10, x9
10164c710:     	csel	x9, x10, x9, hi
10164c714:     	mov	x10, #0x5555555555555555 ; =6148914691236517205
10164c718:     	movk	x10, #0x555, lsl #48
10164c71c:     	cmp	x8, x10
10164c720:     	csel	x20, x9, x11, lo
10164c724:     	cbz	x20, 0x10164c740 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x4dc>
10164c728:     	cmp	x20, x11
10164c72c:     	b.hi	0x10164d15c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xef8>
10164c730:     	add	x8, x20, x20, lsl #1
10164c734:     	lsl	x0, x8, #3
10164c738:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10164c73c:     	b	0x10164c744 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x4e0>
10164c740:     	mov	x0, #0x0                ; =0
10164c744:     	mov	w9, #0x18               ; =24
10164c748:     	madd	x8, x19, x9, x0
10164c74c:     	madd	x20, x20, x9, x0
10164c750:     	str	xzr, [x8]
10164c754:     	ldur	q0, [x29, #-0x90]
10164c758:     	stur	q0, [x8, #0x8]
10164c75c:     	add	x19, x8, #0x18
10164c760:     	sub	x24, x8, x23
10164c764:     	mov	x0, x24
10164c768:     	mov	x1, x22
10164c76c:     	mov	x2, x23
10164c770:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
10164c774:     	ldr	x23, [sp, #0x90]
10164c778:     	stp	x24, x19, [x23, #0x78]
10164c77c:     	str	x20, [x23, #0x88]
10164c780:     	cbz	x22, 0x10164c78c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x528>
10164c784:     	mov	x0, x22
10164c788:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10164c78c:     	mov	x14, #-0x5555555555555556 ; =-6148914691236517206
10164c790:     	movk	x14, #0xaaab
10164c794:     	ldr	w22, [sp, #0x84]
10164c798:     	str	x19, [x23, #0x80]
10164c79c:     	ldr	x10, [sp, #0x88]
10164c7a0:     	ldr	x12, [x10, #0x78]
10164c7a4:     	cbnz	x12, 0x10164c7b4 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x550>
10164c7a8:     	b	0x10164c428 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x1c4>
10164c7ac:     	ldr	x12, [x12]
10164c7b0:     	cbz	x12, 0x10164c428 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x1c4>
10164c7b4:     	mov	x28, x12
10164c7b8:     	ldrsw	x13, [x28, #0xa8]!
10164c7bc:     	ldr	x21, [x28, #0x80]
10164c7c0:     	ldrsh	x27, [x28, #0x18]
10164c7c4:     	ldrsh	x26, [x28, #0x1c]
10164c7c8:     	ldrsh	x25, [x21, #0x2b0]
10164c7cc:     	ldrb	w6, [x21]
10164c7d0:     	ldrb	w7, [x21, #0x8]
10164c7d4:     	ldr	x24, [x21, #0x298]
10164c7d8:     	ldpsw	x5, x4, [x28, #0x4]
10164c7dc:     	ldrsw	x3, [x28, #0xc]
10164c7e0:     	ldpsw	x2, x1, [x21, #0xa0]
10164c7e4:     	ldpsw	x17, x16, [x21, #0xa8]
10164c7e8:     	ldr	x15, [x21, #0x288]
10164c7ec:     	ldp	x8, x9, [x23, #0x50]
10164c7f0:     	cmp	x8, x9
10164c7f4:     	str	x12, [sp, #0x98]
10164c7f8:     	b.hs	0x10164c840 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x5dc>
10164c7fc:     	mov	w9, #0x1                ; =1
10164c800:     	str	x9, [x8]
10164c804:     	ldr	x9, [sp, #0x88]
10164c808:     	stp	x9, x12, [x8, #0x8]
10164c80c:     	stp	x27, x26, [x8, #0x18]
10164c810:     	stp	x25, x6, [x8, #0x28]
10164c814:     	stp	x7, x24, [x8, #0x38]
10164c818:     	stp	x13, x5, [x8, #0x48]
10164c81c:     	stp	x4, x3, [x8, #0x58]
10164c820:     	stp	x2, x1, [x8, #0x68]
10164c824:     	stp	x17, x16, [x8, #0x78]
10164c828:     	str	x15, [x8, #0x88]
10164c82c:     	movi.16b	v0, #0x0
10164c830:     	stp	q0, q0, [x8, #0x90]
10164c834:     	add	x19, x8, #0xc0
10164c838:     	str	q0, [x8, #0xb0]
10164c83c:     	b	0x10164c994 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x730>
10164c840:     	ldr	x10, [sp, #0x78]
10164c844:     	ldr	x22, [x10]
10164c848:     	sub	x23, x8, x22
10164c84c:     	asr	x8, x23, #6
10164c850:     	mul	x19, x8, x14
10164c854:     	add	x8, x19, #0x1
10164c858:     	mov	x11, #0x5555555555555555 ; =6148914691236517205
10164c85c:     	movk	x11, #0x155, lsl #48
10164c860:     	cmp	x8, x11
10164c864:     	b.hi	0x10164d154 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xef0>
10164c868:     	sub	x9, x9, x22
10164c86c:     	asr	x9, x9, #6
10164c870:     	mul	x9, x9, x14
10164c874:     	lsl	x10, x9, #1
10164c878:     	cmp	x10, x8
10164c87c:     	csel	x8, x10, x8, hi
10164c880:     	mov	x10, #-0x5555555555555556 ; =-6148914691236517206
10164c884:     	movk	x10, #0xaa, lsl #48
10164c888:     	cmp	x9, x10
10164c88c:     	csel	x20, x8, x11, lo
10164c890:     	cbz	x20, 0x10164c908 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x6a4>
10164c894:     	stp	x27, x26, [sp, #0x20]
10164c898:     	stp	x25, x24, [sp, #0x30]
10164c89c:     	stp	x7, x6, [sp, #0x40]
10164c8a0:     	stp	x5, x4, [sp, #0x50]
10164c8a4:     	stp	x3, x2, [sp, #0x60]
10164c8a8:     	str	x21, [sp, #0x70]
10164c8ac:     	cmp	x20, x11
10164c8b0:     	b.hi	0x10164d15c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xef8>
10164c8b4:     	mov	x21, x1
10164c8b8:     	mov	x26, x17
10164c8bc:     	mov	x25, x16
10164c8c0:     	mov	x24, x15
10164c8c4:     	mov	x27, x13
10164c8c8:     	add	x8, x20, x20, lsl #1
10164c8cc:     	lsl	x0, x8, #6
10164c8d0:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10164c8d4:     	ldr	x12, [sp, #0x98]
10164c8d8:     	mov	x13, x27
10164c8dc:     	mov	x15, x24
10164c8e0:     	mov	x16, x25
10164c8e4:     	mov	x17, x26
10164c8e8:     	mov	x1, x21
10164c8ec:     	ldp	x2, x21, [sp, #0x68]
10164c8f0:     	ldp	x4, x3, [sp, #0x58]
10164c8f4:     	ldp	x6, x5, [sp, #0x48]
10164c8f8:     	ldp	x24, x7, [sp, #0x38]
10164c8fc:     	ldp	x26, x25, [sp, #0x28]
10164c900:     	ldr	x27, [sp, #0x20]
10164c904:     	b	0x10164c90c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x6a8>
10164c908:     	mov	x0, #0x0                ; =0
10164c90c:     	mov	w10, #0xc0              ; =192
10164c910:     	madd	x8, x19, x10, x0
10164c914:     	mov	w9, #0x1                ; =1
10164c918:     	str	x9, [x8]
10164c91c:     	ldr	x9, [sp, #0x88]
10164c920:     	stp	x9, x12, [x8, #0x8]
10164c924:     	stp	x27, x26, [x8, #0x18]
10164c928:     	madd	x20, x20, x10, x0
10164c92c:     	stp	x25, x6, [x8, #0x28]
10164c930:     	stp	x7, x24, [x8, #0x38]
10164c934:     	stp	x13, x5, [x8, #0x48]
10164c938:     	stp	x4, x3, [x8, #0x58]
10164c93c:     	stp	x2, x1, [x8, #0x68]
10164c940:     	stp	x17, x16, [x8, #0x78]
10164c944:     	str	x15, [x8, #0x88]
10164c948:     	movi.16b	v0, #0x0
10164c94c:     	stp	q0, q0, [x8, #0x90]
10164c950:     	add	x19, x8, #0xc0
10164c954:     	sub	x24, x8, x23
10164c958:     	str	q0, [x8, #0xb0]
10164c95c:     	mov	x0, x24
10164c960:     	mov	x1, x22
10164c964:     	mov	x2, x23
10164c968:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
10164c96c:     	ldr	x23, [sp, #0x90]
10164c970:     	stp	x24, x19, [x23, #0x48]
10164c974:     	str	x20, [x23, #0x58]
10164c978:     	cbz	x22, 0x10164c984 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x720>
10164c97c:     	mov	x0, x22
10164c980:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10164c984:     	mov	x14, #-0x5555555555555556 ; =-6148914691236517206
10164c988:     	movk	x14, #0xaaab
10164c98c:     	ldr	w22, [sp, #0x84]
10164c990:     	ldr	x12, [sp, #0x98]
10164c994:     	str	x19, [x23, #0x50]
10164c998:     	cmp	w22, #0x4
10164c99c:     	b.eq	0x10164c7ac <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x548>
10164c9a0:     	ldrh	w8, [x21, #0x2b0]
10164c9a4:     	cbz	w8, 0x10164c7ac <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x548>
10164c9a8:     	ldp	w9, w8, [x12, #0xa8]
10164c9ac:     	cmp	w8, w9
10164c9b0:     	b.lt	0x10164c7ac <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x548>
10164c9b4:     	ldp	w9, w8, [x12, #0xb0]
10164c9b8:     	cmp	w8, w9
10164c9bc:     	b.lt	0x10164c7ac <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x548>
10164c9c0:     	ldrh	w8, [x12, #0xc0]
10164c9c4:     	cmp	w8, #0x8
10164c9c8:     	b.eq	0x10164caf0 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x88c>
10164c9cc:     	ldr	x19, [x21, #0x298]
10164c9d0:     	ldr	q0, [x28]
10164c9d4:     	stur	q0, [x29, #-0x90]
10164c9d8:     	ldp	x8, x9, [x23, #0x68]
10164c9dc:     	cmp	x8, x9
10164c9e0:     	b.hs	0x10164ca00 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x79c>
10164c9e4:     	ldr	x9, [sp, #0x88]
10164c9e8:     	stp	x9, x12, [x8]
10164c9ec:     	str	x19, [x8, #0x10]
10164c9f0:     	ldur	q0, [x29, #-0x90]
10164c9f4:     	stur	q0, [x8, #0x18]
10164c9f8:     	add	x19, x8, #0x28
10164c9fc:     	b	0x10164cae4 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x880>
10164ca00:     	ldr	x10, [sp, #0x8]
10164ca04:     	ldr	x22, [x10]
10164ca08:     	sub	x23, x8, x22
10164ca0c:     	asr	x8, x23, #3
10164ca10:     	mov	x10, #-0x3333333333333334 ; =-3689348814741910324
10164ca14:     	movk	x10, #0xcccd
10164ca18:     	mul	x20, x8, x10
10164ca1c:     	add	x8, x20, #0x1
10164ca20:     	mov	x11, #0x6666666666666666 ; =7378697629483820646
10164ca24:     	movk	x11, #0x666, lsl #48
10164ca28:     	cmp	x8, x11
10164ca2c:     	b.hi	0x10164d168 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xf04>
10164ca30:     	sub	x9, x9, x22
10164ca34:     	asr	x9, x9, #3
10164ca38:     	mul	x9, x9, x10
10164ca3c:     	lsl	x10, x9, #1
10164ca40:     	cmp	x10, x8
10164ca44:     	csel	x8, x10, x8, hi
10164ca48:     	mov	x10, #0x3333333333333333 ; =3689348814741910323
10164ca4c:     	movk	x10, #0x333, lsl #48
10164ca50:     	cmp	x9, x10
10164ca54:     	csel	x24, x8, x11, lo
10164ca58:     	mov	x8, #0x6666666666666666 ; =7378697629483820646
10164ca5c:     	movk	x8, #0x666, lsl #48
10164ca60:     	cbz	x24, 0x10164ca80 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x81c>
10164ca64:     	cmp	x24, x8
10164ca68:     	b.hi	0x10164d15c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xef8>
10164ca6c:     	add	x8, x24, x24, lsl #2
10164ca70:     	lsl	x0, x8, #3
10164ca74:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10164ca78:     	ldr	x12, [sp, #0x98]
10164ca7c:     	b	0x10164ca84 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x820>
10164ca80:     	mov	x0, #0x0                ; =0
10164ca84:     	mov	w9, #0x28               ; =40
10164ca88:     	madd	x8, x20, x9, x0
10164ca8c:     	madd	x20, x24, x9, x0
10164ca90:     	ldr	x9, [sp, #0x88]
10164ca94:     	stp	x9, x12, [x8]
10164ca98:     	str	x19, [x8, #0x10]
10164ca9c:     	ldur	q0, [x29, #-0x90]
10164caa0:     	stur	q0, [x8, #0x18]
10164caa4:     	add	x19, x8, #0x28
10164caa8:     	sub	x24, x8, x23
10164caac:     	mov	x0, x24
10164cab0:     	mov	x1, x22
10164cab4:     	mov	x2, x23
10164cab8:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
10164cabc:     	ldr	x23, [sp, #0x90]
10164cac0:     	stp	x24, x19, [x23, #0x60]
10164cac4:     	str	x20, [x23, #0x70]
10164cac8:     	cbz	x22, 0x10164cad4 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x870>
10164cacc:     	mov	x0, x22
10164cad0:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10164cad4:     	mov	x14, #-0x5555555555555556 ; =-6148914691236517206
10164cad8:     	movk	x14, #0xaaab
10164cadc:     	ldr	w22, [sp, #0x84]
10164cae0:     	ldr	x12, [sp, #0x98]
10164cae4:     	str	x19, [x23, #0x68]
10164cae8:     	ldrh	w8, [x12, #0xc0]
10164caec:     	cbz	w8, 0x10164cbe8 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x984>
10164caf0:     	ldr	q0, [x28]
10164caf4:     	stur	q0, [x29, #-0x90]
10164caf8:     	ldp	x9, x8, [x23, #0x80]
10164cafc:     	cmp	x9, x8
10164cb00:     	b.hs	0x10164cb18 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x8b4>
10164cb04:     	str	x12, [x9]
10164cb08:     	ldur	q0, [x29, #-0x90]
10164cb0c:     	stur	q0, [x9, #0x8]
10164cb10:     	add	x19, x9, #0x18
10164cb14:     	b	0x10164cbe4 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x980>
10164cb18:     	ldr	x10, [sp, #0x10]
10164cb1c:     	ldr	x22, [x10]
10164cb20:     	sub	x23, x9, x22
10164cb24:     	asr	x9, x23, #3
10164cb28:     	mul	x19, x9, x14
10164cb2c:     	add	x9, x19, #0x1
10164cb30:     	mov	x11, #-0x5555555555555556 ; =-6148914691236517206
10164cb34:     	movk	x11, #0xaaa, lsl #48
10164cb38:     	cmp	x9, x11
10164cb3c:     	b.hi	0x10164d160 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xefc>
10164cb40:     	sub	x8, x8, x22
10164cb44:     	asr	x8, x8, #3
10164cb48:     	mul	x8, x8, x14
10164cb4c:     	lsl	x10, x8, #1
10164cb50:     	cmp	x10, x9
10164cb54:     	csel	x9, x10, x9, hi
10164cb58:     	mov	x10, #0x5555555555555555 ; =6148914691236517205
10164cb5c:     	movk	x10, #0x555, lsl #48
10164cb60:     	cmp	x8, x10
10164cb64:     	csel	x20, x9, x11, lo
10164cb68:     	cbz	x20, 0x10164cb88 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x924>
10164cb6c:     	cmp	x20, x11
10164cb70:     	b.hi	0x10164d15c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xef8>
10164cb74:     	add	x8, x20, x20, lsl #1
10164cb78:     	lsl	x0, x8, #3
10164cb7c:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10164cb80:     	ldr	x12, [sp, #0x98]
10164cb84:     	b	0x10164cb8c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x928>
10164cb88:     	mov	x0, #0x0                ; =0
10164cb8c:     	mov	w9, #0x18               ; =24
10164cb90:     	madd	x8, x19, x9, x0
10164cb94:     	madd	x20, x20, x9, x0
10164cb98:     	str	x12, [x8]
10164cb9c:     	ldur	q0, [x29, #-0x90]
10164cba0:     	stur	q0, [x8, #0x8]
10164cba4:     	add	x19, x8, #0x18
10164cba8:     	sub	x24, x8, x23
10164cbac:     	mov	x0, x24
10164cbb0:     	mov	x1, x22
10164cbb4:     	mov	x2, x23
10164cbb8:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
10164cbbc:     	ldr	x23, [sp, #0x90]
10164cbc0:     	stp	x24, x19, [x23, #0x78]
10164cbc4:     	str	x20, [x23, #0x88]
10164cbc8:     	cbz	x22, 0x10164cbd4 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x970>
10164cbcc:     	mov	x0, x22
10164cbd0:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10164cbd4:     	mov	x14, #-0x5555555555555556 ; =-6148914691236517206
10164cbd8:     	movk	x14, #0xaaab
10164cbdc:     	ldr	w22, [sp, #0x84]
10164cbe0:     	ldr	x12, [sp, #0x98]
10164cbe4:     	str	x19, [x23, #0x80]
10164cbe8:     	ldr	w8, [sp, #0x1c]
10164cbec:     	cbz	w8, 0x10164c7ac <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x548>
10164cbf0:     	ldrh	w8, [x12, #0xc0]
10164cbf4:     	cbnz	w8, 0x10164c7ac <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x548>
10164cbf8:     	ldr	x0, [x21, #0x288]
10164cbfc:     	cbz	x0, 0x10164c7ac <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x548>
10164cc00:     	bl	0x100b3f80c <__Z22WM_gizmomap_group_listP10wmGizmoMap>
10164cc04:     	ldr	x12, [sp, #0x98]
10164cc08:     	mov	x14, #-0x5555555555555556 ; =-6148914691236517206
10164cc0c:     	movk	x14, #0xaaab
10164cc10:     	ldr	x21, [x0]
10164cc14:     	cbnz	x21, 0x10164cc24 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x9c0>
10164cc18:     	b	0x10164c7ac <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x548>
10164cc1c:     	ldr	x21, [x21]
10164cc20:     	cbz	x21, 0x10164c7ac <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x548>
10164cc24:     	ldr	x19, [x21, #0x10]
10164cc28:     	cbz	x19, 0x10164cc1c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x9b8>
10164cc2c:     	ldr	x0, [x19]
10164cc30:     	adrp	x1, 0x104bcf000 <__ZL3hex+0x334d>
10164cc34:     	add	x1, x1, #0xf49
10164cc38:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
10164cc3c:     	ldr	x12, [sp, #0x98]
10164cc40:     	mov	x14, #-0x5555555555555556 ; =-6148914691236517206
10164cc44:     	movk	x14, #0xaaab
10164cc48:     	cbnz	w0, 0x10164cc1c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x9b8>
10164cc4c:     	ldrb	w20, [x21, #0x3c]
10164cc50:     	ldr	w24, [x21, #0x38]
10164cc54:     	ldr	w25, [x21, #0x50]
10164cc58:     	ldp	x8, x9, [x23, #0x50]
10164cc5c:     	cmp	x8, x9
10164cc60:     	b.hs	0x10164cca8 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xa44>
10164cc64:     	mov	w9, #0x2                ; =2
10164cc68:     	stp	x9, x12, [x8]
10164cc6c:     	stp	x21, x19, [x8, #0x10]
10164cc70:     	stp	x20, x24, [x8, #0x20]
10164cc74:     	str	x25, [x8, #0x30]
10164cc78:     	movi.16b	v0, #0x0
10164cc7c:     	stur	q0, [x8, #0x38]
10164cc80:     	stur	q0, [x8, #0x48]
10164cc84:     	stur	q0, [x8, #0x58]
10164cc88:     	stur	q0, [x8, #0x68]
10164cc8c:     	stur	q0, [x8, #0x78]
10164cc90:     	stur	q0, [x8, #0x88]
10164cc94:     	stur	q0, [x8, #0x98]
10164cc98:     	stur	q0, [x8, #0xa8]
10164cc9c:     	add	x19, x8, #0xc0
10164cca0:     	str	xzr, [x8, #0xb8]
10164cca4:     	b	0x10164cdac <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xb48>
10164cca8:     	ldr	x0, [sp, #0x78]
10164ccac:     	ldr	x22, [x0]
10164ccb0:     	sub	x23, x8, x22
10164ccb4:     	asr	x8, x23, #6
10164ccb8:     	mul	x26, x8, x14
10164ccbc:     	add	x8, x26, #0x1
10164ccc0:     	mov	x11, #0x5555555555555555 ; =6148914691236517205
10164ccc4:     	movk	x11, #0x155, lsl #48
10164ccc8:     	cmp	x8, x11
10164cccc:     	b.hi	0x10164d164 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xf00>
10164ccd0:     	sub	x9, x9, x22
10164ccd4:     	asr	x9, x9, #6
10164ccd8:     	mul	x9, x9, x14
10164ccdc:     	lsl	x10, x9, #1
10164cce0:     	cmp	x10, x8
10164cce4:     	csel	x8, x10, x8, hi
10164cce8:     	mov	x10, #-0x5555555555555556 ; =-6148914691236517206
10164ccec:     	movk	x10, #0xaa, lsl #48
10164ccf0:     	cmp	x9, x10
10164ccf4:     	csel	x27, x8, x11, lo
10164ccf8:     	mov	x8, #0x5555555555555555 ; =6148914691236517205
10164ccfc:     	movk	x8, #0x155, lsl #48
10164cd00:     	cbz	x27, 0x10164cd20 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xabc>
10164cd04:     	cmp	x27, x8
10164cd08:     	b.hi	0x10164d15c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xef8>
10164cd0c:     	add	x8, x27, x27, lsl #1
10164cd10:     	lsl	x0, x8, #6
10164cd14:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10164cd18:     	ldr	x12, [sp, #0x98]
10164cd1c:     	b	0x10164cd24 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xac0>
10164cd20:     	mov	x0, #0x0                ; =0
10164cd24:     	mov	w10, #0xc0              ; =192
10164cd28:     	madd	x8, x26, x10, x0
10164cd2c:     	mov	w9, #0x2                ; =2
10164cd30:     	stp	x9, x12, [x8]
10164cd34:     	stp	x21, x19, [x8, #0x10]
10164cd38:     	madd	x26, x27, x10, x0
10164cd3c:     	stp	x20, x24, [x8, #0x20]
10164cd40:     	str	x25, [x8, #0x30]
10164cd44:     	movi.16b	v0, #0x0
10164cd48:     	stur	q0, [x8, #0x38]
10164cd4c:     	stur	q0, [x8, #0x48]
10164cd50:     	stur	q0, [x8, #0x58]
10164cd54:     	stur	q0, [x8, #0x68]
10164cd58:     	stur	q0, [x8, #0x78]
10164cd5c:     	stur	q0, [x8, #0x88]
10164cd60:     	stur	q0, [x8, #0x98]
10164cd64:     	stur	q0, [x8, #0xa8]
10164cd68:     	add	x19, x8, #0xc0
10164cd6c:     	sub	x24, x8, x23
10164cd70:     	str	xzr, [x8, #0xb8]
10164cd74:     	mov	x0, x24
10164cd78:     	mov	x1, x22
10164cd7c:     	mov	x2, x23
10164cd80:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
10164cd84:     	ldr	x23, [sp, #0x90]
10164cd88:     	stp	x24, x19, [x23, #0x48]
10164cd8c:     	str	x26, [x23, #0x58]
10164cd90:     	cbz	x22, 0x10164cd9c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xb38>
10164cd94:     	mov	x0, x22
10164cd98:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10164cd9c:     	mov	x14, #-0x5555555555555556 ; =-6148914691236517206
10164cda0:     	movk	x14, #0xaaab
10164cda4:     	ldr	w22, [sp, #0x84]
10164cda8:     	ldr	x12, [sp, #0x98]
10164cdac:     	str	x19, [x23, #0x50]
10164cdb0:     	ldrb	w8, [x21, #0x3c]
10164cdb4:     	tbnz	w8, #0x0, 0x10164cc1c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x9b8>
10164cdb8:     	ldr	w8, [x21, #0x38]
10164cdbc:     	cbnz	w8, 0x10164cc1c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x9b8>
10164cdc0:     	ldrb	w8, [x21, #0x50]
10164cdc4:     	tbnz	w8, #0x0, 0x10164cdcc <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xb68>
10164cdc8:     	strb	wzr, [x23, #0x44]
10164cdcc:     	ldr	x28, [x21, #0x18]
10164cdd0:     	cbnz	x28, 0x10164cde4 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xb80>
10164cdd4:     	b	0x10164cc1c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x9b8>
10164cdd8:     	strb	wzr, [x23, #0x44]
10164cddc:     	ldr	x28, [x28]
10164cde0:     	cbz	x28, 0x10164cc1c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0x9b8>
10164cde4:     	ldp	s10, s9, [x28, #0xcc]
10164cde8:     	ldr	s11, [x28, #0x120]
10164cdec:     	ldr	w25, [x28, #0x48]
10164cdf0:     	fmov	w19, s10
10164cdf4:     	fmov	w20, s9
10164cdf8:     	fmov	w24, s11
10164cdfc:     	ldp	x8, x9, [x23, #0x50]
10164ce00:     	cmp	x8, x9
10164ce04:     	b.hs	0x10164ce4c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xbe8>
10164ce08:     	mov	w9, #0x3                ; =3
10164ce0c:     	stp	x9, x12, [x8]
10164ce10:     	stp	x28, x25, [x8, #0x10]
10164ce14:     	stp	x19, x20, [x8, #0x20]
10164ce18:     	str	x24, [x8, #0x30]
10164ce1c:     	movi.16b	v0, #0x0
10164ce20:     	stur	q0, [x8, #0x38]
10164ce24:     	stur	q0, [x8, #0x48]
10164ce28:     	stur	q0, [x8, #0x58]
10164ce2c:     	stur	q0, [x8, #0x68]
10164ce30:     	stur	q0, [x8, #0x78]
10164ce34:     	stur	q0, [x8, #0x88]
10164ce38:     	stur	q0, [x8, #0x98]
10164ce3c:     	stur	q0, [x8, #0xa8]
10164ce40:     	add	x19, x8, #0xc0
10164ce44:     	str	xzr, [x8, #0xb8]
10164ce48:     	b	0x10164cf48 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xce4>
10164ce4c:     	ldr	x10, [sp, #0x78]
10164ce50:     	ldr	x22, [x10]
10164ce54:     	sub	x23, x8, x22
10164ce58:     	asr	x8, x23, #6
10164ce5c:     	mul	x26, x8, x14
10164ce60:     	add	x8, x26, #0x1
10164ce64:     	mov	x11, #0x5555555555555555 ; =6148914691236517205
10164ce68:     	movk	x11, #0x155, lsl #48
10164ce6c:     	cmp	x8, x11
10164ce70:     	b.hi	0x10164d154 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xef0>
10164ce74:     	sub	x9, x9, x22
10164ce78:     	asr	x9, x9, #6
10164ce7c:     	mul	x9, x9, x14
10164ce80:     	lsl	x10, x9, #1
10164ce84:     	cmp	x10, x8
10164ce88:     	csel	x8, x10, x8, hi
10164ce8c:     	mov	x10, #-0x5555555555555556 ; =-6148914691236517206
10164ce90:     	movk	x10, #0xaa, lsl #48
10164ce94:     	cmp	x9, x10
10164ce98:     	csel	x27, x8, x11, lo
10164ce9c:     	cbz	x27, 0x10164cebc <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xc58>
10164cea0:     	cmp	x27, x11
10164cea4:     	b.hi	0x10164d15c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xef8>
10164cea8:     	add	x8, x27, x27, lsl #1
10164ceac:     	lsl	x0, x8, #6
10164ceb0:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10164ceb4:     	ldr	x12, [sp, #0x98]
10164ceb8:     	b	0x10164cec0 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xc5c>
10164cebc:     	mov	x0, #0x0                ; =0
10164cec0:     	mov	w10, #0xc0              ; =192
10164cec4:     	madd	x8, x26, x10, x0
10164cec8:     	mov	w9, #0x3                ; =3
10164cecc:     	stp	x9, x12, [x8]
10164ced0:     	stp	x28, x25, [x8, #0x10]
10164ced4:     	madd	x25, x27, x10, x0
10164ced8:     	stp	x19, x20, [x8, #0x20]
10164cedc:     	str	x24, [x8, #0x30]
10164cee0:     	movi.16b	v0, #0x0
10164cee4:     	stur	q0, [x8, #0x38]
10164cee8:     	stur	q0, [x8, #0x48]
10164ceec:     	stur	q0, [x8, #0x58]
10164cef0:     	stur	q0, [x8, #0x68]
10164cef4:     	stur	q0, [x8, #0x78]
10164cef8:     	stur	q0, [x8, #0x88]
10164cefc:     	stur	q0, [x8, #0x98]
10164cf00:     	stur	q0, [x8, #0xa8]
10164cf04:     	add	x19, x8, #0xc0
10164cf08:     	sub	x24, x8, x23
10164cf0c:     	str	xzr, [x8, #0xb8]
10164cf10:     	mov	x0, x24
10164cf14:     	mov	x1, x22
10164cf18:     	mov	x2, x23
10164cf1c:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
10164cf20:     	ldr	x23, [sp, #0x90]
10164cf24:     	stp	x24, x19, [x23, #0x48]
10164cf28:     	str	x25, [x23, #0x58]
10164cf2c:     	cbz	x22, 0x10164cf38 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xcd4>
10164cf30:     	mov	x0, x22
10164cf34:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10164cf38:     	mov	x14, #-0x5555555555555556 ; =-6148914691236517206
10164cf3c:     	movk	x14, #0xaaab
10164cf40:     	ldr	w22, [sp, #0x84]
10164cf44:     	ldr	x12, [sp, #0x98]
10164cf48:     	str	x19, [x23, #0x50]
10164cf4c:     	ldrb	w8, [x28, #0x48]
10164cf50:     	tbnz	w8, #0x3, 0x10164cddc <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xb78>
10164cf54:     	fmov	w8, s10
10164cf58:     	and	w8, w8, #0x7fffffff
10164cf5c:     	mov	w9, #0x7f7fffff         ; =2139095039
10164cf60:     	cmp	w8, w9
10164cf64:     	b.gt	0x10164cdd8 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xb74>
10164cf68:     	fmov	w8, s9
10164cf6c:     	and	w8, w8, #0x7fffffff
10164cf70:     	cmp	w8, w9
10164cf74:     	b.gt	0x10164cdd8 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xb74>
10164cf78:     	fmov	w8, s11
10164cf7c:     	and	w9, w8, #0x7fffffff
10164cf80:     	sub	w10, w9, #0x1
10164cf84:     	mov	w11, #0x7fffff          ; =8388607
10164cf88:     	cmp	w10, w11
10164cf8c:     	cset	w10, lo
10164cf90:     	sub	w11, w9, #0x800, lsl #12 ; =0x800000
10164cf94:     	lsr	w11, w11, #24
10164cf98:     	cmp	w11, #0x7f
10164cf9c:     	cset	w11, lo
10164cfa0:     	cmp	w8, #0x0
10164cfa4:     	csel	w8, wzr, w11, ge
10164cfa8:     	csel	w10, wzr, w10, ge
10164cfac:     	mov	w11, #0x7f800000        ; =2139095040
10164cfb0:     	cmp	w9, w11
10164cfb4:     	csinc	w9, w10, wzr, ne
10164cfb8:     	csinc	w9, w9, wzr, le
10164cfbc:     	orr	w8, w9, w8
10164cfc0:     	tbnz	w8, #0x0, 0x10164cdd8 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xb74>
10164cfc4:     	fabs	s0, s10
10164cfc8:     	fcvt	d0, s0
10164cfcc:     	mov	x8, #0xffffffc00000     ; =281474972516352
10164cfd0:     	movk	x8, #0x41bf, lsl #48
10164cfd4:     	fmov	d1, x8
10164cfd8:     	fcmp	d0, d1
10164cfdc:     	b.gt	0x10164cdd8 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xb74>
10164cfe0:     	fabs	s0, s9
10164cfe4:     	fcvt	d0, s0
10164cfe8:     	fmov	d1, x8
10164cfec:     	fcmp	d0, d1
10164cff0:     	b.gt	0x10164cdd8 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xb74>
10164cff4:     	fcvt	d1, s11
10164cff8:     	adrp	x8, 0x106d88000 <_build_commit_date>
10164cffc:     	add	x8, x8, #0xe08
10164d000:     	ldr	s0, [x8, #0x2654]
10164d004:     	fcvt	d2, s0
10164d008:     	fmul	d1, d1, d2
10164d00c:     	mov	x8, #0xffffffc00000     ; =281474972516352
10164d010:     	movk	x8, #0x41bf, lsl #48
10164d014:     	fmov	d2, x8
10164d018:     	fcmp	d1, d2
10164d01c:     	b.gt	0x10164cdd8 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xb74>
10164d020:     	fmul	s1, s11, s0
10164d024:     	fmul	s0, s0, s8
10164d028:     	fadd	s0, s1, s0
10164d02c:     	fcvtzs	w8, s0
10164d030:     	ldr	w9, [x12, #0xa8]
10164d034:     	fcvtzs	w10, s10
10164d038:     	add	w9, w9, w10
10164d03c:     	ldr	w10, [x12, #0xb0]
10164d040:     	fcvtzs	w11, s9
10164d044:     	add	w10, w10, w11
10164d048:     	sub	w25, w9, w8
10164d04c:     	add	w24, w9, w8
10164d050:     	sub	w20, w10, w8
10164d054:     	add	w19, w10, w8
10164d058:     	ldp	x8, x9, [x23, #0x80]
10164d05c:     	cmp	x8, x9
10164d060:     	b.hs	0x10164d078 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xe14>
10164d064:     	str	x12, [x8]
10164d068:     	stp	w25, w24, [x8, #0x8]
10164d06c:     	add	x25, x8, #0x18
10164d070:     	stp	w20, w19, [x8, #0x10]
10164d074:     	b	0x10164d144 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xee0>
10164d078:     	ldr	x10, [sp, #0x10]
10164d07c:     	ldr	x22, [x10]
10164d080:     	sub	x23, x8, x22
10164d084:     	asr	x8, x23, #3
10164d088:     	mul	x26, x8, x14
10164d08c:     	add	x8, x26, #0x1
10164d090:     	mov	x11, #-0x5555555555555556 ; =-6148914691236517206
10164d094:     	movk	x11, #0xaaa, lsl #48
10164d098:     	cmp	x8, x11
10164d09c:     	b.hi	0x10164d160 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xefc>
10164d0a0:     	sub	x9, x9, x22
10164d0a4:     	asr	x9, x9, #3
10164d0a8:     	mul	x9, x9, x14
10164d0ac:     	lsl	x10, x9, #1
10164d0b0:     	cmp	x10, x8
10164d0b4:     	csel	x8, x10, x8, hi
10164d0b8:     	mov	x10, #0x5555555555555555 ; =6148914691236517205
10164d0bc:     	movk	x10, #0x555, lsl #48
10164d0c0:     	cmp	x9, x10
10164d0c4:     	csel	x27, x8, x11, lo
10164d0c8:     	cbz	x27, 0x10164d0e8 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xe84>
10164d0cc:     	cmp	x27, x11
10164d0d0:     	b.hi	0x10164d15c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xef8>
10164d0d4:     	add	x8, x27, x27, lsl #1
10164d0d8:     	lsl	x0, x8, #3
10164d0dc:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10164d0e0:     	ldr	x12, [sp, #0x98]
10164d0e4:     	b	0x10164d0ec <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xe88>
10164d0e8:     	mov	x0, #0x0                ; =0
10164d0ec:     	mov	w9, #0x18               ; =24
10164d0f0:     	madd	x8, x26, x9, x0
10164d0f4:     	str	x12, [x8]
10164d0f8:     	stp	w25, w24, [x8, #0x8]
10164d0fc:     	madd	x26, x27, x9, x0
10164d100:     	stp	w20, w19, [x8, #0x10]
10164d104:     	add	x25, x8, #0x18
10164d108:     	sub	x24, x8, x23
10164d10c:     	mov	x0, x24
10164d110:     	mov	x1, x22
10164d114:     	mov	x2, x23
10164d118:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
10164d11c:     	ldr	x23, [sp, #0x90]
10164d120:     	stp	x24, x25, [x23, #0x78]
10164d124:     	str	x26, [x23, #0x88]
10164d128:     	cbz	x22, 0x10164d134 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xed0>
10164d12c:     	mov	x0, x22
10164d130:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10164d134:     	mov	x14, #-0x5555555555555556 ; =-6148914691236517206
10164d138:     	movk	x14, #0xaaab
10164d13c:     	ldr	w22, [sp, #0x84]
10164d140:     	ldr	x12, [sp, #0x98]
10164d144:     	str	x25, [x23, #0x80]
10164d148:     	b	0x10164cddc <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xb78>
10164d14c:     	mov	w0, #0x1                ; =1
10164d150:     	b	0x10164c32c <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE+0xc8>
10164d154:     	ldr	x0, [sp, #0x78]
10164d158:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
10164d15c:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
10164d160:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
10164d164:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
10164d168:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
