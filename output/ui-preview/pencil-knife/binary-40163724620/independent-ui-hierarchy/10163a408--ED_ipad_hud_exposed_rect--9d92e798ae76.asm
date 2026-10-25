
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163a408 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_>:
10163a408:     	sub	sp, sp, #0x60
10163a40c:     	stp	x26, x25, [sp, #0x10]
10163a410:     	stp	x24, x23, [sp, #0x20]
10163a414:     	stp	x22, x21, [sp, #0x30]
10163a418:     	stp	x20, x19, [sp, #0x40]
10163a41c:     	stp	x29, x30, [sp, #0x50]
10163a420:     	add	x29, sp, #0x50
10163a424:     	mov	x19, x5
10163a428:     	mov	x20, x4
10163a42c:     	mov	x21, x3
10163a430:     	mov	x23, x2
10163a434:     	mov	x22, x1
10163a438:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163a43c:     	mov	x8, x0
10163a440:     	mov	w0, #0x0                ; =0
10163a444:     	cbz	x22, 0x10163a488 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x80>
10163a448:     	cbz	x8, 0x10163a488 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x80>
10163a44c:     	add	x0, x8, #0x1a0
10163a450:     	mov	x1, x22
10163a454:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163a458:     	cmn	w0, #0x1
10163a45c:     	b.eq	0x10163a484 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x7c>
10163a460:     	mov	x0, x22
10163a464:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
10163a468:     	cbz	x0, 0x10163a488 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x80>
10163a46c:     	adrp	x8, 0x106d88000 <_build_commit_date>
10163a470:     	add	x8, x8, #0x28
10163a474:     	ldrb	w8, [x8, #0xc21]
10163a478:     	tbnz	w8, #0x0, 0x10163a484 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x7c>
10163a47c:     	ldrb	w8, [x0, #0x1ee]
10163a480:     	cbz	w8, 0x10163a4a4 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x9c>
10163a484:     	mov	w0, #0x0                ; =0
10163a488:     	ldp	x29, x30, [sp, #0x50]
10163a48c:     	ldp	x20, x19, [sp, #0x40]
10163a490:     	ldp	x22, x21, [sp, #0x30]
10163a494:     	ldp	x24, x23, [sp, #0x20]
10163a498:     	ldp	x26, x25, [sp, #0x10]
10163a49c:     	add	sp, sp, #0x60
10163a4a0:     	ret
10163a4a4:     	mov	x8, x0
10163a4a8:     	mov	w0, #0x0                ; =0
10163a4ac:     	cbz	x23, 0x10163a488 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x80>
10163a4b0:     	ldrb	w9, [x8, #0x1ef]
10163a4b4:     	cbnz	w9, 0x10163a488 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x80>
10163a4b8:     	mov	x25, x8
10163a4bc:     	add	x0, x8, #0x1c0
10163a4c0:     	mov	x1, x23
10163a4c4:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163a4c8:     	cmn	w0, #0x1
10163a4cc:     	b.eq	0x10163a484 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x7c>
10163a4d0:     	mov	w0, #0x0                ; =0
10163a4d4:     	cbz	x21, 0x10163a488 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x80>
10163a4d8:     	ldr	w8, [x23, #0xd8]
10163a4dc:     	cmp	w8, #0x1
10163a4e0:     	b.ne	0x10163a488 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x80>
10163a4e4:     	add	x0, x23, #0x78
10163a4e8:     	mov	x1, x21
10163a4ec:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163a4f0:     	cmn	w0, #0x1
10163a4f4:     	b.eq	0x10163a484 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x7c>
10163a4f8:     	ldrh	w8, [x21, #0xc0]
10163a4fc:     	cbnz	w8, 0x10163a484 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x7c>
10163a500:     	ldr	x8, [x21, #0x128]
10163a504:     	ldrh	w9, [x8, #0x2b0]
10163a508:     	cbz	w9, 0x10163a484 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x7c>
10163a50c:     	ldrb	w9, [x8, #0x8]
10163a510:     	cmp	w9, #0x1
10163a514:     	b.ne	0x10163a484 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x7c>
10163a518:     	ldrh	w9, [x21, #0xc4]
10163a51c:     	mov	w10, #0x403             ; =1027
10163a520:     	tst	w9, w10
10163a524:     	b.ne	0x10163a484 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x7c>
10163a528:     	ldr	q0, [x8, #0xa0]
10163a52c:     	str	q0, [x19]
10163a530:     	mov	x24, x21
10163a534:     	ldr	w2, [x24, #0xb0]!
10163a538:     	mov	x26, x24
10163a53c:     	ldr	w1, [x26, #-0x8]!
10163a540:     	mov	x0, x19
10163a544:     	bl	0x1007fd304 <__Z18BLI_rcti_translateP4rctiii>
10163a548:     	ldr	w8, [x20, #0x8]
10163a54c:     	ldr	w9, [x19, #0x8]
10163a550:     	cmp	w8, w9
10163a554:     	b.lt	0x10163a598 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x190>
10163a558:     	ldr	w8, [x20, #0xc]
10163a55c:     	ldr	w9, [x19, #0xc]
10163a560:     	cmp	w8, w9
10163a564:     	b.gt	0x10163a598 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x190>
10163a568:     	ldur	x8, [x23, #0x78]
10163a56c:     	cbz	x8, 0x10163a598 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x190>
10163a570:     	mov	w9, #0x0                ; =0
10163a574:     	ldrh	w10, [x8, #0xc0]
10163a578:     	cmp	w10, #0x0
10163a57c:     	cinc	w9, w9, eq
10163a580:     	ldr	x8, [x8]
10163a584:     	cbnz	x8, 0x10163a574 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x16c>
10163a588:     	cmp	w9, #0x1
10163a58c:     	b.ne	0x10163a598 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x190>
10163a590:     	ldrb	w8, [x25, #0x1f1]
10163a594:     	cbz	w8, 0x10163a5a0 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x198>
10163a598:     	mov	w0, #0x1                ; =1
10163a59c:     	b	0x10163a488 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x80>
10163a5a0:     	str	x22, [sp, #0x8]
10163a5a4:     	add	x0, sp, #0x8
10163a5a8:     	bl	0x10163a740 <__ZNSt3__113unordered_mapImN12_GLOBAL__N_113IPadHUDChromeENS_4hashImEENS_8equal_toImEENS_9allocatorINS_4pairIKmS2_EEEEE4findB8ne190102ERS9_>
10163a5ac:     	cbz	x0, 0x10163a598 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x190>
10163a5b0:     	mov	x23, x0
10163a5b4:     	ldr	x8, [x0, #0x18]
10163a5b8:     	cmp	x8, x25
10163a5bc:     	b.ne	0x10163a598 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x190>
10163a5c0:     	ldr	w8, [x23, #0x20]
10163a5c4:     	ldr	w9, [x25, #0x144]
10163a5c8:     	cmp	w8, w9
10163a5cc:     	b.ne	0x10163a598 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x190>
10163a5d0:     	ldr	x8, [x23, #0x28]
10163a5d4:     	ldrsw	x9, [x22, #0xc0]
10163a5d8:     	cmp	x8, x9
10163a5dc:     	b.ne	0x10163a598 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x190>
10163a5e0:     	ldr	w25, [x23, #0x30]
10163a5e4:     	mov	x0, x22
10163a5e8:     	bl	0x100b96a54 <__Z24WM_window_native_pixel_xPK8wmWindow>
10163a5ec:     	cmp	w25, w0
10163a5f0:     	b.ne	0x10163a598 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x190>
10163a5f4:     	ldr	w25, [x23, #0x34]
10163a5f8:     	mov	x0, x22
10163a5fc:     	bl	0x100b96a8c <__Z24WM_window_native_pixel_yPK8wmWindow>
10163a600:     	cmp	w25, w0
10163a604:     	b.ne	0x10163a598 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x190>
10163a608:     	ldr	s0, [x23, #0x38]
10163a60c:     	adrp	x8, 0x106d88000 <_build_commit_date>
10163a610:     	add	x8, x8, #0xe08
10163a614:     	ldr	s1, [x8, #0x2654]
10163a618:     	fcmp	s0, s1
10163a61c:     	b.ne	0x10163a598 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x190>
10163a620:     	mov	x9, x23
10163a624:     	ldr	w11, [x9, #0x3c]!
10163a628:     	mov	x12, x21
10163a62c:     	ldr	w10, [x12, #0xac]!
10163a630:     	ldur	w8, [x12, #-0x4]
10163a634:     	cmp	w10, w11
10163a638:     	csel	x9, x12, x9, lt
10163a63c:     	cmp	w11, w8
10163a640:     	csel	x9, x26, x9, lt
10163a644:     	ldr	w9, [x9]
10163a648:     	ldr	w11, [x19]
10163a64c:     	cmp	w9, w11
10163a650:     	b.ne	0x10163a598 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x190>
10163a654:     	mov	x12, x23
10163a658:     	ldr	w13, [x12, #0x40]!
10163a65c:     	ldr	w14, [x21, #0xb4]!
10163a660:     	ldur	w15, [x21, #-0x4]
10163a664:     	add	w11, w14, #0x1
10163a668:     	ldp	w17, w16, [x12, #0x4]
10163a66c:     	cmp	w11, w16
10163a670:     	sub	w11, w16, #0x1
10163a674:     	csel	w11, w14, w11, lt
10163a678:     	cmp	w16, w15
10163a67c:     	csel	w11, w11, w15, gt
10163a680:     	cmp	w14, w13
10163a684:     	csel	x12, x21, x12, lt
10163a688:     	cmp	w13, w15
10163a68c:     	csel	x12, x24, x12, lt
10163a690:     	add	w13, w10, #0x1
10163a694:     	sub	w14, w17, #0x1
10163a698:     	cmp	w13, w17
10163a69c:     	csel	w10, w10, w14, lt
10163a6a0:     	cmp	w17, w8
10163a6a4:     	csel	w10, w10, w8, gt
10163a6a8:     	ldr	w13, [x19, #0x4]
10163a6ac:     	mov	w0, #0x1                ; =1
10163a6b0:     	cmp	w10, w13
10163a6b4:     	b.ne	0x10163a488 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x80>
10163a6b8:     	ldr	w10, [x12]
10163a6bc:     	ldr	w12, [x19, #0x8]
10163a6c0:     	cmp	w10, w12
10163a6c4:     	b.ne	0x10163a488 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x80>
10163a6c8:     	ldr	w10, [x19, #0xc]
10163a6cc:     	cmp	w11, w10
10163a6d0:     	b.ne	0x10163a488 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x80>
10163a6d4:     	ldp	x10, x11, [x23, #0x50]
10163a6d8:     	cmp	x10, x11
10163a6dc:     	b.eq	0x10163a738 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x330>
10163a6e0:     	ldp	w12, w13, [x20, #0x8]
10163a6e4:     	cmp	w9, w8
10163a6e8:     	ccmp	w13, w12, #0x8, gt
10163a6ec:     	cset	w14, lt
10163a6f0:     	b	0x10163a700 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x2f8>
10163a6f4:     	add	x10, x10, #0x10
10163a6f8:     	cmp	x10, x11
10163a6fc:     	b.eq	0x10163a738 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x330>
10163a700:     	tbnz	w14, #0x0, 0x10163a6f4 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x2ec>
10163a704:     	ldr	w15, [x10, #0x8]
10163a708:     	ldr	w16, [x10]
10163a70c:     	cmp	w15, w16
10163a710:     	b.le	0x10163a6f4 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x2ec>
10163a714:     	ldr	w17, [x10, #0xc]
10163a718:     	ldr	w0, [x10, #0x4]
10163a71c:     	cmp	w9, w16
10163a720:     	ccmp	w8, w15, #0x0, gt
10163a724:     	ccmp	w17, w0, #0x4, lt
10163a728:     	ccmp	w12, w17, #0x0, gt
10163a72c:     	ccmp	w13, w0, #0x8, lt
10163a730:     	b.lt	0x10163a6f4 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x2ec>
10163a734:     	b	0x10163a598 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x190>
10163a738:     	str	w8, [x19]
10163a73c:     	b	0x10163a598 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_+0x190>
