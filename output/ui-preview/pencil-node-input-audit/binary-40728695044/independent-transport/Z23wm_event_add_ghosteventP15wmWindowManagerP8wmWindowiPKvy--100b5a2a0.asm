
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b5a2a0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy>:
100b5a2a0:     	stp	d9, d8, [sp, #-0x70]!
100b5a2a4:     	stp	x28, x27, [sp, #0x10]
100b5a2a8:     	stp	x26, x25, [sp, #0x20]
100b5a2ac:     	stp	x24, x23, [sp, #0x30]
100b5a2b0:     	stp	x22, x21, [sp, #0x40]
100b5a2b4:     	stp	x20, x19, [sp, #0x50]
100b5a2b8:     	stp	x29, x30, [sp, #0x60]
100b5a2bc:     	add	x29, sp, #0x60
100b5a2c0:     	sub	sp, sp, #0x240
100b5a2c4:     	adrp	x8, 0x106369000 <_zlibVersion+0x106369000>
100b5a2c8:     	ldr	x8, [x8, #0x7f8]
100b5a2cc:     	ldr	x8, [x8]
100b5a2d0:     	stur	x8, [x29, #-0x78]
100b5a2d4:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b5a2d8:     	add	x8, x8, #0x28
100b5a2dc:     	ldrb	w8, [x8, #0xc2c]
100b5a2e0:     	tbnz	w8, #0x3, 0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a2e4:     	mov	x20, x3
100b5a2e8:     	mov	x21, x2
100b5a2ec:     	mov	x19, x1
100b5a2f0:     	mov	x24, x0
100b5a2f4:     	str	x4, [sp, #0x28]
100b5a2f8:     	sub	w8, w2, #0xf
100b5a2fc:     	movi.16b	v0, #0x0
100b5a300:     	stp	q0, q0, [sp, #0x100]
100b5a304:     	cmp	w8, #0x1
100b5a308:     	b.hi	0x100b5a388 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xe8>
100b5a30c:     	ldr	x22, [x24, #0x1a0]
100b5a310:     	cbz	x22, 0x100b5a3ac <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x10c>
100b5a314:     	add	x26, sp, #0x170
100b5a318:     	adrp	x23, 0x10636c000 <_zlibVersion+0x10636c000>
100b5a31c:     	ldr	x23, [x23, #0x750]
100b5a320:     	adrp	x25, 0x106370000 <_zlibVersion+0x106370000>
100b5a324:     	ldr	x25, [x25, #0x198]
100b5a328:     	b	0x100b5a33c <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x9c>
100b5a32c:     	stp	xzr, xzr, [x27]
100b5a330:     	str	xzr, [x27, #0x10]
100b5a334:     	ldr	x22, [x22]
100b5a338:     	cbz	x22, 0x100b5a388 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xe8>
100b5a33c:     	ldr	x8, [x22, #0x10]
100b5a340:     	str	x8, [sp, #0x170]
100b5a344:     	cbz	x8, 0x100b5a334 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x94>
100b5a348:     	str	x26, [sp, #0x50]
100b5a34c:     	add	x1, sp, #0x170
100b5a350:     	add	x3, sp, #0x50
100b5a354:     	add	x4, sp, #0x120
100b5a358:     	mov	x0, x23
100b5a35c:     	mov	x2, x25
100b5a360:     	bl	0x100b4b89c <__ZNSt3__112__hash_tableINS_17__hash_value_typeIPKvNS_6vectorIN5ghost3ios15FingerPaintRectENS_9allocatorIS7_EEEEEENS_22__unordered_map_hasherIS3_SB_NS_4hashIS3_EENS_8equal_toIS3_EELb1EEENS_21__unordered_map_equalIS3_SB_SG_SE_Lb1EEENS8_ISB_EEE25__emplace_unique_key_argsIS3_JRKNS_21piecewise_construct_tENS_5tupleIJRKS3_EEENSQ_IJEEEEEENS_4pairINS_15__hash_iteratorIPNS_11__hash_nodeISB_PvEEEEbEERKT_DpOT0_>
100b5a364:     	mov	x27, x0
100b5a368:     	ldr	x8, [x27, #0x18]!
100b5a36c:     	cbz	x8, 0x100b5a32c <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x8c>
100b5a370:     	str	x8, [x0, #0x20]
100b5a374:     	mov	x0, x8
100b5a378:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b5a37c:     	stp	xzr, xzr, [x27]
100b5a380:     	str	xzr, [x27, #0x10]
100b5a384:     	b	0x100b5a32c <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x8c>
100b5a388:     	cmp	w21, #0x1
100b5a38c:     	b.ne	0x100b5a3ac <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x10c>
100b5a390:     	ldrb	w8, [x20, #0x30]
100b5a394:     	cmp	w8, #0x1
100b5a398:     	b.ne	0x100b5a3a4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x104>
100b5a39c:     	ldr	x8, [x20, #0x38]
100b5a3a0:     	cbnz	x8, 0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a3a4:     	mov	w8, #0x1                ; =1
100b5a3a8:     	b	0x100b5a3ec <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x14c>
100b5a3ac:     	and	w8, w21, #0xfffffffe
100b5a3b0:     	cmp	w8, #0x2
100b5a3b4:     	b.ne	0x100b5a3d0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x130>
100b5a3b8:     	ldrb	w8, [x20, #0x28]
100b5a3bc:     	cmp	w8, #0x1
100b5a3c0:     	b.ne	0x100b5a3e8 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x148>
100b5a3c4:     	ldr	x8, [x20, #0x30]
100b5a3c8:     	cbnz	x8, 0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a3cc:     	b	0x100b5a3ec <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x14c>
100b5a3d0:     	mov	w28, #0x0               ; =0
100b5a3d4:     	mov	w22, #0x0               ; =0
100b5a3d8:     	mov	w25, #0x0               ; =0
100b5a3dc:     	mov	w26, #0x0               ; =0
100b5a3e0:     	str	wzr, [sp, #0x24]
100b5a3e4:     	b	0x100b5a540 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x2a0>
100b5a3e8:     	mov	w8, #0x0                ; =0
100b5a3ec:     	cmp	w21, #0x2
100b5a3f0:     	cset	w22, eq
100b5a3f4:     	cmp	w21, #0x3
100b5a3f8:     	cset	w28, eq
100b5a3fc:     	cbz	w8, 0x100b5a41c <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x17c>
100b5a400:     	add	x12, x20, #0x40
100b5a404:     	add	x9, x20, #0x48
100b5a408:     	add	x14, x20, #0x50
100b5a40c:     	add	x13, x20, #0x58
100b5a410:     	add	x11, x20, #0x5c
100b5a414:     	mov	w10, #0x1               ; =1
100b5a418:     	b	0x100b5a434 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x194>
100b5a41c:     	add	x12, x20, #0x38
100b5a420:     	add	x9, x20, #0x40
100b5a424:     	add	x14, x20, #0x48
100b5a428:     	add	x13, x20, #0x50
100b5a42c:     	mov	x11, x20
100b5a430:     	ldr	w10, [x11], #0x54
100b5a434:     	ldr	w11, [x11]
100b5a438:     	ldr	w13, [x13]
100b5a43c:     	ldr	x14, [x14]
100b5a440:     	ldr	x9, [x9]
100b5a444:     	ldr	x25, [x12]
100b5a448:     	str	x25, [sp, #0x170]
100b5a44c:     	str	x9, [sp, #0x120]
100b5a450:     	str	x14, [sp, #0x140]
100b5a454:     	str	w13, [sp, #0x30]
100b5a458:     	str	w11, [sp, #0x160]
100b5a45c:     	orr	x12, x25, x9
100b5a460:     	orr	x12, x12, x14
100b5a464:     	cmp	x12, #0x0
100b5a468:     	ccmp	w13, #0x0, #0x0, eq
100b5a46c:     	ccmp	w11, #0x0, #0x0, eq
100b5a470:     	cset	w12, ne
100b5a474:     	str	w12, [sp, #0x24]
100b5a478:     	b.eq	0x100b5a538 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x298>
100b5a47c:     	cbz	x19, 0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a480:     	cbz	x25, 0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a484:     	cbz	x9, 0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a488:     	cbz	x14, 0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a48c:     	ldr	x23, [x19, #0x168]
100b5a490:     	cbz	x23, 0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a494:     	cmp	w21, #0x1
100b5a498:     	b.eq	0x100b5a4a4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x204>
100b5a49c:     	cmp	w10, #0x1
100b5a4a0:     	b.ne	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a4a4:     	stp	x25, x9, [sp, #0x100]
100b5a4a8:     	str	x14, [sp, #0x110]
100b5a4ac:     	str	w13, [sp, #0x118]
100b5a4b0:     	str	w11, [sp, #0x11c]
100b5a4b4:     	str	x23, [sp, #0x40]
100b5a4b8:     	add	x10, sp, #0x40
100b5a4bc:     	add	x11, sp, #0x170
100b5a4c0:     	stp	x10, x11, [sp, #0x50]
100b5a4c4:     	add	x10, sp, #0x120
100b5a4c8:     	add	x11, sp, #0x140
100b5a4cc:     	stp	x10, x11, [sp, #0x60]
100b5a4d0:     	add	x10, sp, #0x30
100b5a4d4:     	add	x11, sp, #0x160
100b5a4d8:     	stp	x10, x11, [sp, #0x70]
100b5a4dc:     	mov	x10, x23
100b5a4e0:     	ldr	x11, [x10, #0x40]!
100b5a4e4:     	cmp	x11, x25
100b5a4e8:     	b.ne	0x100b5aa74 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x7d4>
100b5a4ec:     	ldr	x11, [x23, #0x48]
100b5a4f0:     	cmp	x11, x9
100b5a4f4:     	b.ne	0x100b5aa74 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x7d4>
100b5a4f8:     	cmp	w21, #0x3
100b5a4fc:     	b.ne	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a500:     	mov	x8, x23
100b5a504:     	ldr	x11, [x8, #0x10]!
100b5a508:     	ldr	x12, [x8, #0x20]
100b5a50c:     	cmp	x12, x25
100b5a510:     	csel	x12, x12, x25, hi
100b5a514:     	str	x12, [x8, #0x20]
100b5a518:     	stp	xzr, xzr, [x10]
100b5a51c:     	cmp	x11, x25
100b5a520:     	b.ne	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a524:     	ldr	x10, [x23, #0x18]
100b5a528:     	cmp	x10, x9
100b5a52c:     	b.ne	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a530:     	add	x9, x23, #0x38
100b5a534:     	b	0x100b5b964 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x16c4>
100b5a538:     	mov	w25, #0x0               ; =0
100b5a53c:     	mov	w26, #0x0               ; =0
100b5a540:     	add	x8, sp, #0x50
100b5a544:     	ldr	x23, [x19, #0xf0]
100b5a548:     	ldp	q1, q0, [x23, #0x90]
100b5a54c:     	ldp	q3, q2, [x23, #0x70]
100b5a550:     	str	q3, [sp, #0xc0]
100b5a554:     	ldp	q3, q4, [x23, #0x30]
100b5a558:     	ldp	q5, q6, [x23, #0x50]
100b5a55c:     	stp	q4, q5, [sp, #0x90]
100b5a560:     	str	q6, [sp, #0xb0]
100b5a564:     	str	q1, [sp, #0xe0]
100b5a568:     	ldp	q1, q4, [x23]
100b5a56c:     	ldr	q5, [x23, #0x20]
100b5a570:     	stp	q1, q4, [sp, #0x50]
100b5a574:     	str	q0, [sp, #0xf0]
100b5a578:     	str	q2, [sp, #0xd0]
100b5a57c:     	stp	q5, q3, [sp, #0x70]
100b5a580:     	str	wzr, [sp, #0xcc]
100b5a584:     	strh	wzr, [sp, #0xc8]
100b5a588:     	movi.16b	v0, #0x0
100b5a58c:     	stur	q0, [x8, #0x68]
100b5a590:     	stur	q0, [sp, #0xa8]
100b5a594:     	stur	q0, [sp, #0x98]
100b5a598:     	ldr	w8, [sp, #0x60]
100b5a59c:     	str	w8, [sp, #0xe0]
100b5a5a0:     	ldr	x8, [x24, #0x5c0]
100b5a5a4:     	ldr	x9, [x8, #0x8]
100b5a5a8:     	cmp	x9, x19
100b5a5ac:     	b.eq	0x100b5a5d4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x334>
100b5a5b0:     	cbz	x9, 0x100b5a5d4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x334>
100b5a5b4:     	ldr	x9, [x9, #0xf0]
100b5a5b8:     	cbz	x9, 0x100b5a5d4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x334>
100b5a5bc:     	ldrb	w9, [x9, #0x2a]
100b5a5c0:     	strb	w9, [sp, #0x7a]
100b5a5c4:     	ldr	x8, [x8, #0x8]
100b5a5c8:     	ldr	x8, [x8, #0xf0]
100b5a5cc:     	ldrh	w8, [x8, #0x2c]
100b5a5d0:     	strh	w8, [sp, #0x7c]
100b5a5d4:     	sub	w8, w21, #0x1
100b5a5d8:     	cmp	w8, #0x21
100b5a5dc:     	b.hi	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a5e0:     	add	x27, sp, #0x50
100b5a5e4:     	adrp	x9, 0x104fcd000 <__ZN7blender6render13texturemargin16TextureMarginMap9distancesE+0x18>
100b5a5e8:     	add	x9, x9, #0x64a
100b5a5ec:     	adr	x10, 0x100b5a5fc <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x35c>
100b5a5f0:     	ldrh	w11, [x9, x8, lsl #1]
100b5a5f4:     	add	x10, x10, x11, lsl #2
100b5a5f8:     	br	x10
100b5a5fc:     	cmp	w22, #0x0
100b5a600:     	mov	w8, #0x1                ; =1
100b5a604:     	cinc	w9, w8, eq
100b5a608:     	strh	w9, [sp, #0x62]
100b5a60c:     	ldr	w9, [x20]
100b5a610:     	cmp	w9, #0x3
100b5a614:     	b.gt	0x100b5a7f0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x550>
100b5a618:     	cmp	w9, #0x1
100b5a61c:     	b.gt	0x100b5aacc <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x82c>
100b5a620:     	cbz	w9, 0x100b5b224 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xf84>
100b5a624:     	cmp	w9, #0x1
100b5a628:     	b.eq	0x100b5b254 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xfb4>
100b5a62c:     	b	0x100b5b228 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xf88>
100b5a630:     	ldr	w22, [x20]
100b5a634:     	sub	w8, w22, #0x41
100b5a638:     	cmp	w8, #0x19
100b5a63c:     	b.hi	0x100b5a8d0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x630>
100b5a640:     	orr	w8, w22, #0x20
100b5a644:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5a648:     	cbz	x20, 0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a64c:     	mov	w8, #0x207              ; =519
100b5a650:     	movk	w8, #0x1, lsl #16
100b5a654:     	str	w8, [sp, #0x60]
100b5a658:     	mov	w8, #0x6                ; =6
100b5a65c:     	strh	w8, [sp, #0xd0]
100b5a660:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5a664:     	add	x8, x8, #0x758
100b5a668:     	ldr	x8, [x8]
100b5a66c:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5a670:     	add	x3, x3, #0x8ab
100b5a674:     	mov	w21, #0x1               ; =1
100b5a678:     	mov	w0, #0x1                ; =1
100b5a67c:     	mov	w1, #0x30               ; =48
100b5a680:     	mov	w2, #0x8                ; =8
100b5a684:     	blr	x8
100b5a688:     	str	x0, [sp, #0xd8]
100b5a68c:     	ldp	q0, q1, [x20]
100b5a690:     	ldr	q2, [x20, #0x20]
100b5a694:     	stp	q1, q2, [x0, #0x10]
100b5a698:     	str	q0, [x0]
100b5a69c:     	strh	w21, [sp, #0xd2]
100b5a6a0:     	ldr	w8, [x20, #0x10]
100b5a6a4:     	str	w8, [sp, #0x64]
100b5a6a8:     	mov	x0, x19
100b5a6ac:     	bl	0x100b98338 <__Z27WM_window_native_pixel_sizePK8wmWindow>
100b5a6b0:     	lsr	x8, x0, #32
100b5a6b4:     	ldr	w9, [x20, #0x14]
100b5a6b8:     	mvn	w9, w9
100b5a6bc:     	add	w8, w8, w9
100b5a6c0:     	str	w8, [sp, #0x68]
100b5a6c4:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5a6c8:     	add	x8, x8, #0x760
100b5a6cc:     	ldr	x8, [x8]
100b5a6d0:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5a6d4:     	add	x3, x3, #0xa9d
100b5a6d8:     	mov	w0, #0x1                ; =1
100b5a6dc:     	mov	w1, #0xb0               ; =176
100b5a6e0:     	mov	w2, #0x8                ; =8
100b5a6e4:     	blr	x8
100b5a6e8:     	mov	x1, x0
100b5a6ec:     	ldp	q0, q1, [sp, #0x50]
100b5a6f0:     	ldr	q2, [sp, #0x70]
100b5a6f4:     	stp	q1, q2, [x1, #0x10]
100b5a6f8:     	str	q0, [x1]
100b5a6fc:     	ldp	q0, q1, [sp, #0x80]
100b5a700:     	ldp	q2, q3, [sp, #0xa0]
100b5a704:     	stp	q2, q3, [x1, #0x50]
100b5a708:     	stp	q0, q1, [x1, #0x30]
100b5a70c:     	ldp	q0, q1, [sp, #0xc0]
100b5a710:     	ldp	q2, q3, [sp, #0xe0]
100b5a714:     	stp	q2, q3, [x1, #0x90]
100b5a718:     	stp	q0, q1, [x1, #0x70]
100b5a71c:     	ldr	x0, [x19, #0x168]
100b5a720:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b5a724:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a728:     	ldp	w21, w8, [x20, #0xc]
100b5a72c:     	neg	w22, w8
100b5a730:     	ldr	w9, [x20]
100b5a734:     	cmp	w9, #0x4
100b5a738:     	b.gt	0x100b5aaa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x800>
100b5a73c:     	cmp	w9, #0x2
100b5a740:     	b.eq	0x100b5b5cc <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x132c>
100b5a744:     	cmp	w9, #0x4
100b5a748:     	b.eq	0x100b5aab8 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x818>
100b5a74c:     	b	0x100b5b598 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x12f8>
100b5a750:     	ldr	w8, [x20]
100b5a754:     	cmp	w8, #0x3
100b5a758:     	b.eq	0x100b5af20 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xc80>
100b5a75c:     	cmp	w8, #0x1
100b5a760:     	b.ne	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a764:     	mov	w8, #0x203              ; =515
100b5a768:     	movk	w8, #0x1, lsl #16
100b5a76c:     	str	w8, [sp, #0x60]
100b5a770:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5a774:     	add	x8, x8, #0x760
100b5a778:     	ldr	x8, [x8]
100b5a77c:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5a780:     	add	x3, x3, #0xa9d
100b5a784:     	mov	w0, #0x1                ; =1
100b5a788:     	mov	w1, #0xb0               ; =176
100b5a78c:     	mov	w2, #0x8                ; =8
100b5a790:     	blr	x8
100b5a794:     	mov	x1, x0
100b5a798:     	ldp	q0, q1, [sp, #0x50]
100b5a79c:     	ldr	q2, [sp, #0x70]
100b5a7a0:     	stp	q1, q2, [x1, #0x10]
100b5a7a4:     	str	q0, [x1]
100b5a7a8:     	ldp	q0, q1, [sp, #0x80]
100b5a7ac:     	ldp	q2, q3, [sp, #0xa0]
100b5a7b0:     	stp	q2, q3, [x1, #0x50]
100b5a7b4:     	stp	q0, q1, [x1, #0x30]
100b5a7b8:     	ldp	q0, q1, [sp, #0xc0]
100b5a7bc:     	ldp	q2, q3, [sp, #0xe0]
100b5a7c0:     	stp	q2, q3, [x1, #0x90]
100b5a7c4:     	stp	q0, q1, [x1, #0x70]
100b5a7c8:     	ldr	x0, [x19, #0x168]
100b5a7cc:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b5a7d0:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a7d4:     	add	x8, sp, #0x50
100b5a7d8:     	add	x0, x8, #0x10
100b5a7dc:     	add	x1, x8, #0x12
100b5a7e0:     	add	x2, sp, #0x50
100b5a7e4:     	mov	x3, x19
100b5a7e8:     	bl	0x104a60360 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy.cold.8>
100b5a7ec:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a7f0:     	cmp	w9, #0x5
100b5a7f4:     	b.gt	0x100b5aae4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x844>
100b5a7f8:     	cmp	w9, #0x4
100b5a7fc:     	b.eq	0x100b5b248 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xfa8>
100b5a800:     	cmp	w9, #0x5
100b5a804:     	b.ne	0x100b5b228 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xf88>
100b5a808:     	mov	w8, #0x8                ; =8
100b5a80c:     	b	0x100b5b254 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xfb4>
100b5a810:     	ldp	w9, w8, [x20]
100b5a814:     	cmp	w8, #0x1
100b5a818:     	b.lt	0x100b5ab38 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x898>
100b5a81c:     	cmp	w9, #0x0
100b5a820:     	mov	w9, #0x15               ; =21
100b5a824:     	mov	w10, #0xa               ; =10
100b5a828:     	csel	w9, w10, w9, eq
100b5a82c:     	strh	w9, [sp, #0x60]
100b5a830:     	cmp	w8, #0x20
100b5a834:     	mov	w9, #0x20               ; =32
100b5a838:     	csel	w21, w8, w9, lo
100b5a83c:     	mov	w8, #0x1                ; =1
100b5a840:     	strh	w8, [sp, #0x62]
100b5a844:     	b	0x100b5ab68 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x8c8>
100b5a848:     	add	x8, sp, #0x50
100b5a84c:     	add	x0, x8, #0x10
100b5a850:     	add	x1, x8, #0x12
100b5a854:     	add	x2, sp, #0x50
100b5a858:     	mov	x3, x19
100b5a85c:     	bl	0x104a6031c <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy.cold.7>
100b5a860:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a864:     	add	x8, sp, #0x50
100b5a868:     	add	x0, x8, #0x10
100b5a86c:     	add	x1, x8, #0x12
100b5a870:     	add	x2, sp, #0x50
100b5a874:     	mov	x3, x19
100b5a878:     	bl	0x104a602d8 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy.cold.6>
100b5a87c:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a880:     	add	x21, sp, #0x50
100b5a884:     	ldr	d0, [x20]
100b5a888:     	stur	d0, [sp, #0x64]
100b5a88c:     	add	x1, x21, #0x14
100b5a890:     	add	x2, x21, #0x18
100b5a894:     	mov	x0, x19
100b5a898:     	bl	0x100b963c8 <__Z43wm_cursor_position_from_ghost_screen_coordsP8wmWindowPiS1_>
100b5a89c:     	add	x1, x21, #0x14
100b5a8a0:     	mov	x0, x19
100b5a8a4:     	bl	0x100b8fdbc <__Z30wm_stereo3d_mouse_offset_applyP8wmWindowPi>
100b5a8a8:     	ldr	w8, [x20, #0x8]
100b5a8ac:     	cbz	w8, 0x100b5ac28 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x988>
100b5a8b0:     	str	w8, [sp, #0x80]
100b5a8b4:     	ldr	s0, [x20, #0xc]
100b5a8b8:     	bl	0x100b4d6cc <__Z17wm_pressure_curvef>
100b5a8bc:     	ldr	d1, [x20, #0x10]
100b5a8c0:     	str	d1, [sp, #0x88]
100b5a8c4:     	mov	w8, #0x1                ; =1
100b5a8c8:     	strb	w8, [sp, #0x90]
100b5a8cc:     	b	0x100b5ac38 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x998>
100b5a8d0:     	sub	w8, w22, #0x30
100b5a8d4:     	cmp	w8, #0x9
100b5a8d8:     	b.hi	0x100b5aafc <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x85c>
100b5a8dc:     	mov	x8, x22
100b5a8e0:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5a8e4:     	add	x8, sp, #0x50
100b5a8e8:     	add	x0, x8, #0x10
100b5a8ec:     	add	x1, sp, #0x50
100b5a8f0:     	mov	x2, x19
100b5a8f4:     	bl	0x104a6024c <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy.cold.4>
100b5a8f8:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a8fc:     	mov	w8, #0x1                ; =1
100b5a900:     	strh	w8, [sp, #0x62]
100b5a904:     	ldr	x8, [x19, #0x168]
100b5a908:     	ldr	x21, [x8, #0x50]
100b5a90c:     	cbz	x21, 0x100b5a948 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x6a8>
100b5a910:     	ldrsb	w8, [x21, #0x2f]
100b5a914:     	tbz	w8, #0x1f, 0x100b5a920 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x680>
100b5a918:     	ldr	x0, [x21, #0x18]
100b5a91c:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b5a920:     	ldrsb	w8, [x21, #0x17]
100b5a924:     	tbz	w8, #0x1f, 0x100b5a930 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x690>
100b5a928:     	ldr	x0, [x21]
100b5a92c:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b5a930:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5a934:     	add	x8, x8, #0x710
100b5a938:     	ldr	x8, [x8]
100b5a93c:     	mov	x0, x21
100b5a940:     	mov	w1, #0x1                ; =1
100b5a944:     	blr	x8
100b5a948:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5a94c:     	add	x8, x8, #0x750
100b5a950:     	ldr	x8, [x8]
100b5a954:     	adrp	x2, 0x104bd4000 <__ZL3hex+0x45cd>
100b5a958:     	add	x2, x2, #0x8ab
100b5a95c:     	mov	w0, #0x40               ; =64
100b5a960:     	mov	w1, #0x8                ; =8
100b5a964:     	mov	w3, #0x1                ; =1
100b5a968:     	blr	x8
100b5a96c:     	mov	x21, x0
100b5a970:     	ldrsb	w8, [x20, #0x17]
100b5a974:     	tbnz	w8, #0x1f, 0x100b5abd8 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x938>
100b5a978:     	ldr	q0, [x20]
100b5a97c:     	ldr	x8, [x20, #0x10]
100b5a980:     	str	x8, [x21, #0x10]
100b5a984:     	str	q0, [x21]
100b5a988:     	b	0x100b5abe4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x944>
100b5a98c:     	add	x8, sp, #0x50
100b5a990:     	add	x0, x8, #0x10
100b5a994:     	add	x1, x8, #0x12
100b5a998:     	add	x2, sp, #0x50
100b5a99c:     	mov	x3, x19
100b5a9a0:     	bl	0x104a603a4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy.cold.9>
100b5a9a4:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a9a8:     	add	x8, sp, #0x50
100b5a9ac:     	add	x0, x8, #0x10
100b5a9b0:     	add	x1, x8, #0x12
100b5a9b4:     	add	x2, sp, #0x50
100b5a9b8:     	mov	x3, x19
100b5a9bc:     	bl	0x104a60294 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy.cold.5>
100b5a9c0:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a9c4:     	add	x8, sp, #0x50
100b5a9c8:     	add	x0, x8, #0x12
100b5a9cc:     	add	x2, x8, #0x10
100b5a9d0:     	add	x3, sp, #0x50
100b5a9d4:     	mov	x1, x19
100b5a9d8:     	bl	0x104a60190 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy.cold.2>
100b5a9dc:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5a9e0:     	mov	w8, #0x18               ; =24
100b5a9e4:     	movk	w8, #0x1, lsl #16
100b5a9e8:     	str	w8, [sp, #0x60]
100b5a9ec:     	ldr	x8, [x19, #0x168]
100b5a9f0:     	ldr	x21, [x8, #0x50]
100b5a9f4:     	cbz	x21, 0x100b5aa30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x790>
100b5a9f8:     	ldrsb	w8, [x21, #0x2f]
100b5a9fc:     	tbz	w8, #0x1f, 0x100b5aa08 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x768>
100b5aa00:     	ldr	x0, [x21, #0x18]
100b5aa04:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b5aa08:     	ldrsb	w8, [x21, #0x17]
100b5aa0c:     	tbz	w8, #0x1f, 0x100b5aa18 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x778>
100b5aa10:     	ldr	x0, [x21]
100b5aa14:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b5aa18:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5aa1c:     	add	x8, x8, #0x710
100b5aa20:     	ldr	x8, [x8]
100b5aa24:     	mov	x0, x21
100b5aa28:     	mov	w1, #0x1                ; =1
100b5aa2c:     	blr	x8
100b5aa30:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5aa34:     	add	x8, x8, #0x750
100b5aa38:     	ldr	x8, [x8]
100b5aa3c:     	adrp	x2, 0x104bd4000 <__ZL3hex+0x45cd>
100b5aa40:     	add	x2, x2, #0x8ab
100b5aa44:     	mov	w0, #0x40               ; =64
100b5aa48:     	mov	w1, #0x8                ; =8
100b5aa4c:     	mov	w3, #0x1                ; =1
100b5aa50:     	blr	x8
100b5aa54:     	mov	x21, x0
100b5aa58:     	ldrsb	w8, [x20, #0x17]
100b5aa5c:     	tbnz	w8, #0x1f, 0x100b5ac00 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x960>
100b5aa60:     	ldr	q0, [x20]
100b5aa64:     	ldr	x8, [x20, #0x10]
100b5aa68:     	str	x8, [x21, #0x10]
100b5aa6c:     	str	q0, [x21]
100b5aa70:     	b	0x100b5ac0c <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x96c>
100b5aa74:     	cbz	w8, 0x100b5ab10 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x870>
100b5aa78:     	ldr	x8, [x23, #0x10]
100b5aa7c:     	cbz	x8, 0x100b5b6c0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1420>
100b5aa80:     	add	x0, sp, #0x50
100b5aa84:     	bl	0x100b5bc34 <__ZZ23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvyENK3$_1clEv>
100b5aa88:     	tbz	w0, #0x0, 0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5aa8c:     	ldrb	w26, [x23, #0x38]
100b5aa90:     	tst	w26, #0x1
100b5aa94:     	mov	w8, #0x3                ; =3
100b5aa98:     	csinc	w25, w8, wzr, ne
100b5aa9c:     	b	0x100b5a540 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x2a0>
100b5aaa0:     	cmp	w9, #0x5
100b5aaa4:     	b.eq	0x100b5b5d4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1334>
100b5aaa8:     	cmp	w9, #0x6
100b5aaac:     	b.ne	0x100b5b598 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x12f8>
100b5aab0:     	mov	w9, #0x20               ; =32
100b5aab4:     	str	w9, [sp, #0xcc]
100b5aab8:     	mov	w9, #0xf                ; =15
100b5aabc:     	strh	w9, [sp, #0x60]
100b5aac0:     	neg	w21, w21
100b5aac4:     	mov	x22, x8
100b5aac8:     	b	0x100b5b5dc <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x133c>
100b5aacc:     	cmp	w9, #0x2
100b5aad0:     	b.eq	0x100b5b240 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xfa0>
100b5aad4:     	cmp	w9, #0x3
100b5aad8:     	b.ne	0x100b5b228 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xf88>
100b5aadc:     	mov	w8, #0x3                ; =3
100b5aae0:     	b	0x100b5b254 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xfb4>
100b5aae4:     	cmp	w9, #0x6
100b5aae8:     	b.eq	0x100b5b250 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xfb0>
100b5aaec:     	cmp	w9, #0x7
100b5aaf0:     	b.ne	0x100b5b228 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xf88>
100b5aaf4:     	mov	w8, #0x13               ; =19
100b5aaf8:     	b	0x100b5b254 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xfb4>
100b5aafc:     	sub	w8, w22, #0x11b
100b5ab00:     	cmp	w8, #0x9
100b5ab04:     	b.hi	0x100b5af90 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xcf0>
100b5ab08:     	sub	w8, w22, #0x85
100b5ab0c:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5ab10:     	cmp	w21, #0x2
100b5ab14:     	b.ne	0x100b5b1e4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xf44>
100b5ab18:     	ldr	x8, [x23, #0x10]
100b5ab1c:     	cbz	x8, 0x100b5b8d8 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1638>
100b5ab20:     	add	x0, sp, #0x50
100b5ab24:     	bl	0x100b5bc34 <__ZZ23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvyENK3$_1clEv>
100b5ab28:     	cbz	w0, 0x100b5b930 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1690>
100b5ab2c:     	ldrb	w8, [x23, #0x38]
100b5ab30:     	tbz	w8, #0x0, 0x100b5b8e4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1644>
100b5ab34:     	b	0x100b5b930 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1690>
100b5ab38:     	cmp	w9, #0x0
100b5ab3c:     	mov	w9, #0x14               ; =20
100b5ab40:     	mov	w10, #0xb               ; =11
100b5ab44:     	csel	w9, w10, w9, eq
100b5ab48:     	strh	w9, [sp, #0x60]
100b5ab4c:     	neg	w9, w8
100b5ab50:     	cmp	w9, #0x20
100b5ab54:     	mov	w9, #0x20               ; =32
100b5ab58:     	csneg	w21, w9, w8, hs
100b5ab5c:     	mov	w9, #0x1                ; =1
100b5ab60:     	strh	w9, [sp, #0x62]
100b5ab64:     	cbz	w8, 0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5ab68:     	adrp	x22, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5ab6c:     	add	x22, x22, #0x760
100b5ab70:     	adrp	x20, 0x104bd4000 <__ZL3hex+0x45cd>
100b5ab74:     	add	x20, x20, #0xa9d
100b5ab78:     	ldr	x8, [x22]
100b5ab7c:     	mov	w0, #0x1                ; =1
100b5ab80:     	mov	w1, #0xb0               ; =176
100b5ab84:     	mov	w2, #0x8                ; =8
100b5ab88:     	mov	x3, x20
100b5ab8c:     	blr	x8
100b5ab90:     	mov	x1, x0
100b5ab94:     	ldp	q0, q1, [sp, #0x50]
100b5ab98:     	ldr	q2, [sp, #0x70]
100b5ab9c:     	stp	q1, q2, [x1, #0x10]
100b5aba0:     	str	q0, [x1]
100b5aba4:     	ldp	q0, q1, [sp, #0x80]
100b5aba8:     	ldp	q2, q3, [sp, #0xa0]
100b5abac:     	stp	q2, q3, [x1, #0x50]
100b5abb0:     	stp	q0, q1, [x1, #0x30]
100b5abb4:     	ldp	q0, q1, [sp, #0xc0]
100b5abb8:     	ldp	q2, q3, [sp, #0xe0]
100b5abbc:     	stp	q2, q3, [x1, #0x90]
100b5abc0:     	stp	q0, q1, [x1, #0x70]
100b5abc4:     	ldr	x0, [x19, #0x168]
100b5abc8:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b5abcc:     	subs	w21, w21, #0x1
100b5abd0:     	b.ne	0x100b5ab78 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x8d8>
100b5abd4:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5abd8:     	ldp	x1, x2, [x20]
100b5abdc:     	mov	x0, x21
100b5abe0:     	bl	0x103d213e4 <__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE25__init_copy_ctor_externalEPKcm>
100b5abe4:     	ldrsb	w8, [x20, #0x2f]
100b5abe8:     	tbnz	w8, #0x1f, 0x100b5ae60 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xbc0>
100b5abec:     	ldur	q0, [x20, #0x18]
100b5abf0:     	ldur	x8, [x20, #0x28]
100b5abf4:     	stur	x8, [x21, #0x28]
100b5abf8:     	stur	q0, [x21, #0x18]
100b5abfc:     	b	0x100b5ae6c <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xbcc>
100b5ac00:     	ldp	x1, x2, [x20]
100b5ac04:     	mov	x0, x21
100b5ac08:     	bl	0x103d213e4 <__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE25__init_copy_ctor_externalEPKcm>
100b5ac0c:     	ldrsb	w8, [x20, #0x2f]
100b5ac10:     	tbnz	w8, #0x1f, 0x100b5aefc <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xc5c>
100b5ac14:     	ldur	q0, [x20, #0x18]
100b5ac18:     	ldur	x8, [x20, #0x28]
100b5ac1c:     	stur	x8, [x21, #0x28]
100b5ac20:     	stur	q0, [x21, #0x18]
100b5ac24:     	b	0x100b5af08 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xc68>
100b5ac28:     	str	wzr, [sp, #0x80]
100b5ac2c:     	str	xzr, [sp, #0x88]
100b5ac30:     	fmov	s0, #1.00000000
100b5ac34:     	str	wzr, [sp, #0x90]
100b5ac38:     	str	s0, [sp, #0x84]
100b5ac3c:     	ldr	q0, [x20, #0x20]
100b5ac40:     	stur	q0, [sp, #0x98]
100b5ac44:     	ldr	q0, [x20, #0x40]
100b5ac48:     	stur	q0, [sp, #0xa8]
100b5ac4c:     	ldr	x8, [x20, #0x50]
100b5ac50:     	str	x8, [sp, #0xb8]
100b5ac54:     	ldr	d0, [x20, #0x58]
100b5ac58:     	str	d0, [sp, #0xc0]
100b5ac5c:     	add	x1, x27, #0x70
100b5ac60:     	add	x2, x27, #0x74
100b5ac64:     	mov	x0, x19
100b5ac68:     	bl	0x100b963c8 <__Z43wm_cursor_position_from_ghost_screen_coordsP8wmWindowPiS1_>
100b5ac6c:     	add	x1, x27, #0x70
100b5ac70:     	mov	x0, x19
100b5ac74:     	bl	0x100b8fdbc <__Z30wm_stereo3d_mouse_offset_applyP8wmWindowPi>
100b5ac78:     	and	w8, w26, #0x1
100b5ac7c:     	strb	w8, [sp, #0xc8]
100b5ac80:     	strb	w25, [sp, #0xc9]
100b5ac84:     	ldrb	w8, [x20, #0x30]
100b5ac88:     	cmp	w8, #0x1
100b5ac8c:     	b.ne	0x100b5ac9c <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x9fc>
100b5ac90:     	ldr	w8, [sp, #0xcc]
100b5ac94:     	orr	w8, w8, #0x100
100b5ac98:     	str	w8, [sp, #0xcc]
100b5ac9c:     	ldrb	w8, [x20, #0x18]
100b5aca0:     	cmp	w8, #0x1
100b5aca4:     	b.ne	0x100b5acb4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xa14>
100b5aca8:     	ldr	w8, [sp, #0xcc]
100b5acac:     	orr	w8, w8, #0x80
100b5acb0:     	str	w8, [sp, #0xcc]
100b5acb4:     	mov	w8, #0x4                ; =4
100b5acb8:     	str	w8, [sp, #0x60]
100b5acbc:     	ldr	x8, [x19, #0x168]
100b5acc0:     	ldr	x21, [x8, #0x8]
100b5acc4:     	cbz	x21, 0x100b5ace8 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xa48>
100b5acc8:     	ldrh	w8, [x21, #0x10]
100b5accc:     	cmp	w8, #0x4
100b5acd0:     	b.ne	0x100b5ace8 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xa48>
100b5acd4:     	mov	w8, #0x11               ; =17
100b5acd8:     	strh	w8, [x21, #0x10]
100b5acdc:     	ldr	w8, [x21, #0x7c]
100b5ace0:     	and	w8, w8, #0x80
100b5ace4:     	str	w8, [x21, #0x7c]
100b5ace8:     	cmp	x21, #0x0
100b5acec:     	cset	w22, eq
100b5acf0:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5acf4:     	add	x8, x8, #0x760
100b5acf8:     	ldr	x8, [x8]
100b5acfc:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5ad00:     	add	x3, x3, #0xa9d
100b5ad04:     	mov	w0, #0x1                ; =1
100b5ad08:     	mov	w1, #0xb0               ; =176
100b5ad0c:     	mov	w2, #0x8                ; =8
100b5ad10:     	blr	x8
100b5ad14:     	mov	x20, x0
100b5ad18:     	ldp	q0, q1, [sp, #0x50]
100b5ad1c:     	ldr	q2, [sp, #0x70]
100b5ad20:     	stp	q1, q2, [x0, #0x10]
100b5ad24:     	str	q0, [x0]
100b5ad28:     	ldp	q0, q1, [sp, #0x80]
100b5ad2c:     	ldp	q2, q3, [sp, #0xa0]
100b5ad30:     	stp	q2, q3, [x0, #0x50]
100b5ad34:     	stp	q0, q1, [x0, #0x30]
100b5ad38:     	ldp	q0, q1, [sp, #0xc0]
100b5ad3c:     	ldp	q2, q3, [sp, #0xe0]
100b5ad40:     	stp	q2, q3, [x0, #0x90]
100b5ad44:     	stp	q0, q1, [x0, #0x70]
100b5ad48:     	ldr	x0, [x19, #0x168]
100b5ad4c:     	mov	x1, x20
100b5ad50:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b5ad54:     	cbz	w22, 0x100b5ad5c <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xabc>
100b5ad58:     	ldr	x21, [x19, #0xf0]
100b5ad5c:     	ldr	w8, [x21, #0x14]
100b5ad60:     	str	w8, [x20, #0x94]
100b5ad64:     	ldr	w8, [x21, #0x18]
100b5ad68:     	str	w8, [x20, #0x98]
100b5ad6c:     	ldr	w8, [x20, #0x14]
100b5ad70:     	str	w8, [x23, #0x14]
100b5ad74:     	ldr	w8, [x20, #0x18]
100b5ad78:     	str	w8, [x23, #0x18]
100b5ad7c:     	ldrb	w8, [x20, #0x40]
100b5ad80:     	strb	w8, [x23, #0x40]
100b5ad84:     	ldr	x8, [sp, #0x88]
100b5ad88:     	str	x8, [x23, #0x38]
100b5ad8c:     	ldr	w8, [sp, #0x24]
100b5ad90:     	tbnz	w8, #0x0, 0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5ad94:     	add	x2, sp, #0x50
100b5ad98:     	mov	x0, x24
100b5ad9c:     	mov	x1, x19
100b5ada0:     	bl	0x100b5c0a8 <__ZL29wm_event_cursor_other_windowsP15wmWindowManagerP8wmWindowP7wmEvent>
100b5ada4:     	add	x9, sp, #0x160
100b5ada8:     	cbz	x0, 0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5adac:     	mov	x19, x0
100b5adb0:     	ldr	x8, [x19, #0xf0]!
100b5adb4:     	ldr	q0, [x8, #0x70]
100b5adb8:     	str	q0, [sp, #0x1e0]
100b5adbc:     	ldr	q0, [x8, #0x80]
100b5adc0:     	str	q0, [sp, #0x1f0]
100b5adc4:     	ldr	q0, [x8, #0x90]
100b5adc8:     	str	q0, [sp, #0x200]
100b5adcc:     	ldr	q0, [x8, #0xa0]
100b5add0:     	str	q0, [sp, #0x210]
100b5add4:     	ldr	q0, [x8, #0x30]
100b5add8:     	str	q0, [sp, #0x1a0]
100b5addc:     	ldr	q0, [x8, #0x40]
100b5ade0:     	str	q0, [sp, #0x1b0]
100b5ade4:     	ldr	q0, [x8, #0x50]
100b5ade8:     	str	q0, [sp, #0x1c0]
100b5adec:     	ldr	q0, [x8, #0x60]
100b5adf0:     	str	q0, [sp, #0x1d0]
100b5adf4:     	ldr	q0, [x8]
100b5adf8:     	str	q0, [sp, #0x170]
100b5adfc:     	ldr	q0, [x8, #0x10]
100b5ae00:     	str	q0, [sp, #0x180]
100b5ae04:     	ldr	q0, [x8, #0x20]
100b5ae08:     	str	q0, [sp, #0x190]
100b5ae0c:     	ldrb	w8, [sp, #0x7a]
100b5ae10:     	strb	w8, [sp, #0x19a]
100b5ae14:     	ldrh	w8, [sp, #0x7c]
100b5ae18:     	strh	w8, [sp, #0x19c]
100b5ae1c:     	ldr	w8, [sp, #0x180]
100b5ae20:     	str	w8, [sp, #0x200]
100b5ae24:     	ldur	d0, [sp, #0x64]
100b5ae28:     	stur	d0, [x9, #0x24]
100b5ae2c:     	mov	w8, #0x4                ; =4
100b5ae30:     	str	w8, [sp, #0x180]
100b5ae34:     	add	x1, sp, #0x170
100b5ae38:     	bl	0x100b5bfd4 <__ZL22wm_event_add_mousemoveP8wmWindowPK7wmEvent>
100b5ae3c:     	ldr	x8, [x19]
100b5ae40:     	ldr	w9, [x0, #0x14]
100b5ae44:     	str	w9, [x8, #0x14]
100b5ae48:     	ldr	w9, [x0, #0x18]
100b5ae4c:     	str	w9, [x8, #0x18]
100b5ae50:     	ldrb	w8, [x0, #0x40]
100b5ae54:     	ldr	x9, [x19]
100b5ae58:     	strb	w8, [x9, #0x40]
100b5ae5c:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5ae60:     	ldp	x1, x2, [x20, #0x18]
100b5ae64:     	add	x0, x21, #0x18
100b5ae68:     	bl	0x103d213e4 <__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE25__init_copy_ctor_externalEPKcm>
100b5ae6c:     	ldr	x8, [x20, #0x30]
100b5ae70:     	ldr	w9, [x20, #0x38]
100b5ae74:     	str	w9, [x21, #0x38]
100b5ae78:     	str	x8, [x21, #0x30]
100b5ae7c:     	ldr	x8, [x19, #0x168]
100b5ae80:     	str	x21, [x8, #0x50]
100b5ae84:     	ldr	x8, [x19, #0x168]
100b5ae88:     	mov	w9, #0x1                ; =1
100b5ae8c:     	strb	w9, [x8, #0x58]
100b5ae90:     	mov	w8, #0x16               ; =22
100b5ae94:     	strh	w8, [sp, #0x60]
100b5ae98:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5ae9c:     	add	x8, x8, #0x760
100b5aea0:     	ldr	x8, [x8]
100b5aea4:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5aea8:     	add	x3, x3, #0xa9d
100b5aeac:     	mov	w0, #0x1                ; =1
100b5aeb0:     	mov	w1, #0xb0               ; =176
100b5aeb4:     	mov	w2, #0x8                ; =8
100b5aeb8:     	blr	x8
100b5aebc:     	mov	x1, x0
100b5aec0:     	ldp	q0, q1, [sp, #0x50]
100b5aec4:     	ldr	q2, [sp, #0x70]
100b5aec8:     	stp	q1, q2, [x1, #0x10]
100b5aecc:     	str	q0, [x1]
100b5aed0:     	ldp	q0, q1, [sp, #0x80]
100b5aed4:     	ldp	q2, q3, [sp, #0xa0]
100b5aed8:     	stp	q2, q3, [x1, #0x50]
100b5aedc:     	stp	q0, q1, [x1, #0x30]
100b5aee0:     	ldp	q0, q1, [sp, #0xc0]
100b5aee4:     	ldp	q2, q3, [sp, #0xe0]
100b5aee8:     	stp	q2, q3, [x1, #0x90]
100b5aeec:     	stp	q0, q1, [x1, #0x70]
100b5aef0:     	ldr	x0, [x19, #0x168]
100b5aef4:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b5aef8:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5aefc:     	ldp	x1, x2, [x20, #0x18]
100b5af00:     	add	x0, x21, #0x18
100b5af04:     	bl	0x103d213e4 <__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE25__init_copy_ctor_externalEPKcm>
100b5af08:     	add	x2, x19, #0x168
100b5af0c:     	add	x3, sp, #0x50
100b5af10:     	mov	x0, x21
100b5af14:     	mov	x1, x20
100b5af18:     	bl	0x104a601f0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy.cold.3>
100b5af1c:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5af20:     	mov	w8, #0x204              ; =516
100b5af24:     	movk	w8, #0x1, lsl #16
100b5af28:     	str	w8, [sp, #0x60]
100b5af2c:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5af30:     	add	x8, x8, #0x760
100b5af34:     	ldr	x8, [x8]
100b5af38:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5af3c:     	add	x3, x3, #0xa9d
100b5af40:     	mov	w0, #0x1                ; =1
100b5af44:     	mov	w1, #0xb0               ; =176
100b5af48:     	mov	w2, #0x8                ; =8
100b5af4c:     	blr	x8
100b5af50:     	mov	x1, x0
100b5af54:     	ldp	q0, q1, [sp, #0x50]
100b5af58:     	ldr	q2, [sp, #0x70]
100b5af5c:     	stp	q1, q2, [x1, #0x10]
100b5af60:     	str	q0, [x1]
100b5af64:     	ldp	q0, q1, [sp, #0x80]
100b5af68:     	ldp	q2, q3, [sp, #0xa0]
100b5af6c:     	stp	q2, q3, [x1, #0x50]
100b5af70:     	stp	q0, q1, [x1, #0x30]
100b5af74:     	ldp	q0, q1, [sp, #0xc0]
100b5af78:     	ldp	q2, q3, [sp, #0xe0]
100b5af7c:     	stp	q2, q3, [x1, #0x90]
100b5af80:     	stp	q0, q1, [x1, #0x70]
100b5af84:     	ldr	x0, [x19, #0x168]
100b5af88:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b5af8c:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5af90:     	sub	w8, w22, #0x12b
100b5af94:     	cmp	w8, #0x17
100b5af98:     	b.hi	0x100b5b710 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1470>
100b5af9c:     	add	w8, w22, #0x1
100b5afa0:     	strh	w8, [sp, #0x60]
100b5afa4:     	ldr	w8, [x20, #0x4]
100b5afa8:     	str	w8, [sp, #0x74]
100b5afac:     	ldrh	w8, [x20, #0x8]
100b5afb0:     	strh	w8, [sp, #0x78]
100b5afb4:     	ldrb	w8, [x20, #0xa]
100b5afb8:     	cbz	w8, 0x100b5afc4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd24>
100b5afbc:     	mov	w8, #0x2                ; =2
100b5afc0:     	str	w8, [sp, #0xcc]
100b5afc4:     	cmp	w21, #0xf
100b5afc8:     	mov	w8, #0x1                ; =1
100b5afcc:     	cinc	w8, w8, ne
100b5afd0:     	strh	w8, [sp, #0x62]
100b5afd4:     	add	x0, sp, #0x50
100b5afd8:     	mov	w1, #0x0                ; =0
100b5afdc:     	bl	0x100b5c1fc <__ZL17wm_eventemulationP7wmEventb>
100b5afe0:     	ldrb	w20, [sp, #0x74]
100b5afe4:     	cmp	w21, #0x10
100b5afe8:     	b.ne	0x100b5b044 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xda4>
100b5afec:     	cbz	w20, 0x100b5b144 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xea4>
100b5aff0:     	adrp	x20, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b5aff4:     	add	x20, x20, #0x2a0
100b5aff8:     	ldr	x8, [x20]
100b5affc:     	ldr	x0, [x8, #0x8]
100b5b000:     	cbnz	x0, 0x100b5b014 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd74>
100b5b004:     	mov	x0, x8
100b5b008:     	bl	0x100ae3834 <__Z15CLG_logref_initP10CLG_LogRef>
100b5b00c:     	ldr	x8, [x20]
100b5b010:     	ldr	x0, [x8, #0x8]
100b5b014:     	ldr	w8, [x0, #0x50]
100b5b018:     	cmp	w8, #0x1
100b5b01c:     	b.lt	0x100b5b144 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xea4>
100b5b020:     	adrp	x2, 0x104bd4000 <__ZL3hex+0x45cd>
100b5b024:     	add	x2, x2, #0x8c3
100b5b028:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5b02c:     	add	x3, x3, #0x8ab
100b5b030:     	adrp	x4, 0x104bd4000 <__ZL3hex+0x45cd>
100b5b034:     	add	x4, x4, #0x8ff
100b5b038:     	mov	w1, #0x1                ; =1
100b5b03c:     	bl	0x100ae2b58 <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b5b040:     	b	0x100b5b144 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xea4>
100b5b044:     	cmp	w20, #0x7f
100b5b048:     	b.eq	0x100b5b144 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xea4>
100b5b04c:     	sub	w8, w20, #0x1
100b5b050:     	cmp	w8, #0x1f
100b5b054:     	b.lo	0x100b5b144 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xea4>
100b5b058:     	cbz	w20, 0x100b5b148 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xea8>
100b5b05c:     	add	x8, sp, #0x50
100b5b060:     	add	x24, x8, #0x24
100b5b064:     	tbz	w20, #0x7, 0x100b5b0dc <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xe3c>
100b5b068:     	ldrb	w8, [sp, #0x75]
100b5b06c:     	cbnz	w8, 0x100b5b0dc <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xe3c>
100b5b070:     	mov	x0, x20
100b5b074:     	mov	x1, x24
100b5b078:     	mov	w2, #0x6                ; =6
100b5b07c:     	bl	0x100823158 <__Z25BLI_str_utf8_from_unicodejPcm>
100b5b080:     	mov	x25, x0
100b5b084:     	adrp	x22, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b5b088:     	add	x22, x22, #0x2a0
100b5b08c:     	ldr	x8, [x22]
100b5b090:     	ldr	x0, [x8, #0x8]
100b5b094:     	cbnz	x0, 0x100b5b0a8 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xe08>
100b5b098:     	mov	x0, x8
100b5b09c:     	bl	0x100ae3834 <__Z15CLG_logref_initP10CLG_LogRef>
100b5b0a0:     	ldr	x8, [x22]
100b5b0a4:     	ldr	x0, [x8, #0x8]
100b5b0a8:     	ldr	w8, [x0, #0x50]
100b5b0ac:     	cmp	w8, #0x1
100b5b0b0:     	b.lt	0x100b5b0dc <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xe3c>
100b5b0b4:     	adrp	x2, 0x104bd4000 <__ZL3hex+0x45cd>
100b5b0b8:     	add	x2, x2, #0x93d
100b5b0bc:     	stp	x24, x25, [sp, #0x10]
100b5b0c0:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5b0c4:     	add	x3, x3, #0x8ab
100b5b0c8:     	adrp	x4, 0x104bd4000 <__ZL3hex+0x45cd>
100b5b0cc:     	add	x4, x4, #0x979
100b5b0d0:     	stp	x20, x25, [sp]
100b5b0d4:     	mov	w1, #0x1                ; =1
100b5b0d8:     	bl	0x100ae2b58 <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b5b0dc:     	mov	x0, x24
100b5b0e0:     	bl	0x1008246fc <__Z26BLI_str_utf8_size_or_errorPKc>
100b5b0e4:     	cmn	w0, #0x1
100b5b0e8:     	b.ne	0x100b5b148 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xea8>
100b5b0ec:     	adrp	x20, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b5b0f0:     	add	x20, x20, #0x2a0
100b5b0f4:     	ldr	x8, [x20]
100b5b0f8:     	ldr	x0, [x8, #0x8]
100b5b0fc:     	cbnz	x0, 0x100b5b110 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xe70>
100b5b100:     	mov	x0, x8
100b5b104:     	bl	0x100ae3834 <__Z15CLG_logref_initP10CLG_LogRef>
100b5b108:     	ldr	x8, [x20]
100b5b10c:     	ldr	x0, [x8, #0x8]
100b5b110:     	ldr	w8, [x0, #0x50]
100b5b114:     	cmp	w8, #0x1
100b5b118:     	b.lt	0x100b5b144 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xea4>
100b5b11c:     	ldrb	w8, [sp, #0x74]
100b5b120:     	adrp	x2, 0x104bd4000 <__ZL3hex+0x45cd>
100b5b124:     	add	x2, x2, #0x9d5
100b5b128:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5b12c:     	add	x3, x3, #0x8ab
100b5b130:     	adrp	x4, 0x104bd4000 <__ZL3hex+0x45cd>
100b5b134:     	add	x4, x4, #0xa11
100b5b138:     	str	x8, [sp]
100b5b13c:     	mov	w1, #0x1                ; =1
100b5b140:     	bl	0x100ae2b58 <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b5b144:     	strb	wzr, [sp, #0x74]
100b5b148:     	ldrh	w8, [sp, #0x60]
100b5b14c:     	sub	w9, w8, #0xd4
100b5b150:     	cmp	w9, #0x5
100b5b154:     	b.hi	0x100b5b18c <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xeec>
100b5b158:     	mov	w8, #0x1                ; =1
100b5b15c:     	lsl	w8, w8, w9
100b5b160:     	tst	w8, #0x6
100b5b164:     	b.ne	0x100b5b1b4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xf14>
100b5b168:     	mov	w9, #0x9                ; =9
100b5b16c:     	tst	w8, w9
100b5b170:     	b.eq	0x100b5b1cc <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xf2c>
100b5b174:     	ldrh	w9, [sp, #0x62]
100b5b178:     	ldrb	w8, [sp, #0x7a]
100b5b17c:     	cmp	w9, #0x1
100b5b180:     	b.ne	0x100b5b588 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x12e8>
100b5b184:     	orr	w8, w8, #0x2
100b5b188:     	b	0x100b5b7b0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1510>
100b5b18c:     	cmp	w8, #0xac
100b5b190:     	b.eq	0x100b5b548 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x12a8>
100b5b194:     	cmp	w8, #0xb3
100b5b198:     	b.ne	0x100b5b560 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x12c0>
100b5b19c:     	ldrh	w9, [sp, #0x62]
100b5b1a0:     	ldrb	w8, [sp, #0x7a]
100b5b1a4:     	cmp	w9, #0x1
100b5b1a8:     	b.ne	0x100b5b8a8 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1608>
100b5b1ac:     	orr	w8, w8, #0x10
100b5b1b0:     	b	0x100b5b7b0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1510>
100b5b1b4:     	ldrh	w9, [sp, #0x62]
100b5b1b8:     	ldrb	w8, [sp, #0x7a]
100b5b1bc:     	cmp	w9, #0x1
100b5b1c0:     	b.ne	0x100b5b580 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x12e0>
100b5b1c4:     	orr	w8, w8, #0x4
100b5b1c8:     	b	0x100b5b7b0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1510>
100b5b1cc:     	ldrh	w9, [sp, #0x62]
100b5b1d0:     	ldrb	w8, [sp, #0x7a]
100b5b1d4:     	cmp	w9, #0x1
100b5b1d8:     	b.ne	0x100b5b590 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x12f0>
100b5b1dc:     	orr	w8, w8, #0x1
100b5b1e0:     	b	0x100b5b7b0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1510>
100b5b1e4:     	add	x0, sp, #0x50
100b5b1e8:     	bl	0x100b5bc34 <__ZZ23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvyENK3$_1clEv>
100b5b1ec:     	cbz	w0, 0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5b1f0:     	ldrb	w8, [x23, #0x38]
100b5b1f4:     	cmp	w8, #0x1
100b5b1f8:     	b.ne	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5b1fc:     	ldr	x8, [x23, #0x30]
100b5b200:     	cmp	x8, x25
100b5b204:     	csel	x8, x8, x25, hi
100b5b208:     	str	x8, [x23, #0x30]
100b5b20c:     	strb	wzr, [x23, #0x38]
100b5b210:     	movi.16b	v0, #0x0
100b5b214:     	stp	q0, q0, [x23, #0x10]
100b5b218:     	mov	w26, #0x1               ; =1
100b5b21c:     	mov	w25, #0x4               ; =4
100b5b220:     	b	0x100b5a540 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x2a0>
100b5b224:     	bl	0x104a60168 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy.cold.1>
100b5b228:     	adrp	x0, 0x104bd4000 <__ZL3hex+0x45cd>
100b5b22c:     	add	x0, x0, #0x32c
100b5b230:     	adrp	x2, 0x104bd5000 <__ZL3hex+0x55cd>
100b5b234:     	add	x2, x2, #0x6ca
100b5b238:     	mov	w1, #0x2184             ; =8580
100b5b23c:     	bl	0x10072af4c <__Z29_BLI_assert_unreachable_printPKciS0_>
100b5b240:     	mov	w8, #0x2                ; =2
100b5b244:     	b	0x100b5b254 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xfb4>
100b5b248:     	mov	w8, #0x7                ; =7
100b5b24c:     	b	0x100b5b254 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xfb4>
100b5b250:     	mov	w8, #0x12               ; =18
100b5b254:     	strh	w8, [sp, #0x60]
100b5b258:     	ldur	q0, [x20, #0x18]
100b5b25c:     	stur	q0, [sp, #0x98]
100b5b260:     	ldur	q0, [x20, #0x38]
100b5b264:     	stur	q0, [sp, #0xa8]
100b5b268:     	ldr	x8, [x20, #0x48]
100b5b26c:     	str	x8, [sp, #0xb8]
100b5b270:     	ldr	d0, [x20, #0x50]
100b5b274:     	str	d0, [sp, #0xc0]
100b5b278:     	add	x1, x27, #0x70
100b5b27c:     	add	x2, x27, #0x74
100b5b280:     	mov	x0, x19
100b5b284:     	bl	0x100b963c8 <__Z43wm_cursor_position_from_ghost_screen_coordsP8wmWindowPiS1_>
100b5b288:     	add	x1, x27, #0x70
100b5b28c:     	mov	x0, x19
100b5b290:     	bl	0x100b8fdbc <__Z30wm_stereo3d_mouse_offset_applyP8wmWindowPi>
100b5b294:     	and	w8, w26, #0x1
100b5b298:     	strb	w8, [sp, #0xc8]
100b5b29c:     	strb	w25, [sp, #0xc9]
100b5b2a0:     	ldrb	w8, [x20, #0x28]
100b5b2a4:     	cmp	w8, #0x1
100b5b2a8:     	b.ne	0x100b5b2b8 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1018>
100b5b2ac:     	ldr	w8, [sp, #0xcc]
100b5b2b0:     	orr	w8, w8, #0x100
100b5b2b4:     	str	w8, [sp, #0xcc]
100b5b2b8:     	ldrb	w8, [x20, #0x15]
100b5b2bc:     	cmp	w8, #0x1
100b5b2c0:     	b.ne	0x100b5b2d0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1030>
100b5b2c4:     	ldr	w8, [sp, #0xcc]
100b5b2c8:     	orr	w8, w8, #0x80
100b5b2cc:     	str	w8, [sp, #0xcc]
100b5b2d0:     	cbz	w28, 0x100b5b2ec <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x104c>
100b5b2d4:     	ldrb	w8, [x20, #0x14]
100b5b2d8:     	cmp	w8, #0x1
100b5b2dc:     	b.ne	0x100b5b2ec <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x104c>
100b5b2e0:     	ldr	w8, [sp, #0xcc]
100b5b2e4:     	orr	w8, w8, #0x40
100b5b2e8:     	str	w8, [sp, #0xcc]
100b5b2ec:     	ldr	w8, [x20, #0x4]
100b5b2f0:     	cbz	w8, 0x100b5b314 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1074>
100b5b2f4:     	str	w8, [sp, #0x80]
100b5b2f8:     	ldr	s0, [x20, #0x8]
100b5b2fc:     	bl	0x100b4d6cc <__Z17wm_pressure_curvef>
100b5b300:     	ldur	d1, [x20, #0xc]
100b5b304:     	str	d1, [sp, #0x88]
100b5b308:     	mov	w8, #0x1                ; =1
100b5b30c:     	strb	w8, [sp, #0x90]
100b5b310:     	b	0x100b5b324 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1084>
100b5b314:     	str	wzr, [sp, #0x80]
100b5b318:     	str	xzr, [sp, #0x88]
100b5b31c:     	fmov	s0, #1.00000000
100b5b320:     	str	wzr, [sp, #0x90]
100b5b324:     	str	s0, [sp, #0x84]
100b5b328:     	add	x0, sp, #0x50
100b5b32c:     	mov	w1, #0x0                ; =0
100b5b330:     	bl	0x100b5c1fc <__ZL17wm_eventemulationP7wmEventb>
100b5b334:     	add	x0, sp, #0x50
100b5b338:     	add	x3, x19, #0x160
100b5b33c:     	ldr	x1, [sp, #0x28]
100b5b340:     	mov	x2, x23
100b5b344:     	mov	x4, x21
100b5b348:     	bl	0x100b5c3a0 <__ZL35wm_event_state_update_and_click_setP7wmEventyS0_Py16GHOST_TEventType>
100b5b34c:     	ldrb	w8, [x20, #0x14]
100b5b350:     	ldr	w9, [sp, #0x24]
100b5b354:     	orr	w8, w9, w8
100b5b358:     	tbnz	w8, #0x0, 0x100b5b4e4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1244>
100b5b35c:     	add	x2, sp, #0x50
100b5b360:     	mov	x0, x24
100b5b364:     	mov	x1, x19
100b5b368:     	bl	0x100b5c0a8 <__ZL29wm_event_cursor_other_windowsP15wmWindowManagerP8wmWindowP7wmEvent>
100b5b36c:     	mov	x20, x0
100b5b370:     	cbz	x0, 0x100b5b4e4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1244>
100b5b374:     	add	x8, sp, #0x50
100b5b378:     	ldr	x9, [x20, #0xf0]
100b5b37c:     	ldr	q0, [x9]
100b5b380:     	str	q0, [sp, #0x40]
100b5b384:     	ldrh	w10, [x9, #0x10]
100b5b388:     	str	w10, [sp, #0x28]
100b5b38c:     	ldrh	w21, [x9, #0x12]
100b5b390:     	ldur	x10, [x9, #0x1c]
100b5b394:     	str	x10, [sp, #0x160]
100b5b398:     	ldur	x10, [x9, #0x22]
100b5b39c:     	add	x11, sp, #0x160
100b5b3a0:     	stur	x10, [x11, #0x6]
100b5b3a4:     	ldrb	w23, [x9, #0x2b]
100b5b3a8:     	ldrh	w22, [x9, #0x2e]
100b5b3ac:     	ldur	q0, [x9, #0x44]
100b5b3b0:     	ldur	q1, [x9, #0x54]
100b5b3b4:     	ldur	q2, [x9, #0x64]
100b5b3b8:     	ldur	x10, [x9, #0x74]
100b5b3bc:     	str	x10, [sp, #0x1a0]
100b5b3c0:     	stp	q1, q2, [sp, #0x180]
100b5b3c4:     	str	q0, [sp, #0x170]
100b5b3c8:     	ldr	w26, [x9, #0x7c]
100b5b3cc:     	ldr	q0, [x9, #0x80]
100b5b3d0:     	str	q0, [sp, #0x30]
100b5b3d4:     	ldur	q0, [x9, #0x94]
100b5b3d8:     	ldr	q1, [x9, #0xa0]
100b5b3dc:     	add	x9, sp, #0x50
100b5b3e0:     	stur	q1, [x9, #0xdc]
100b5b3e4:     	str	q0, [sp, #0x120]
100b5b3e8:     	ldrb	w25, [sp, #0x7a]
100b5b3ec:     	ldrh	w24, [sp, #0x7c]
100b5b3f0:     	ldrh	w27, [sp, #0x60]
100b5b3f4:     	ldrh	w28, [sp, #0x62]
100b5b3f8:     	ldur	q0, [x8, #0x30]
100b5b3fc:     	ldur	w8, [x8, #0x40]
100b5b400:     	str	w8, [sp, #0x150]
100b5b404:     	str	q0, [sp, #0x140]
100b5b408:     	ldr	w19, [sp, #0xcc]
100b5b40c:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5b410:     	add	x8, x8, #0x760
100b5b414:     	ldr	x8, [x8]
100b5b418:     	ldur	d8, [sp, #0x64]
100b5b41c:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5b420:     	add	x3, x3, #0xa9d
100b5b424:     	mov	w0, #0x1                ; =1
100b5b428:     	mov	w1, #0xb0               ; =176
100b5b42c:     	mov	w2, #0x8                ; =8
100b5b430:     	blr	x8
100b5b434:     	mov	x1, x0
100b5b438:     	mov	w8, #0x2ff              ; =767
100b5b43c:     	ldr	q0, [sp, #0x40]
100b5b440:     	and	w8, w26, w8
100b5b444:     	and	w9, w19, #0x100
100b5b448:     	str	q0, [x1]
100b5b44c:     	orr	w8, w9, w8
100b5b450:     	strh	w27, [x1, #0x10]
100b5b454:     	strh	w28, [x1, #0x12]
100b5b458:     	stur	d8, [x1, #0x14]
100b5b45c:     	ldr	x9, [sp, #0x160]
100b5b460:     	stur	x9, [x1, #0x1c]
100b5b464:     	add	x9, sp, #0x160
100b5b468:     	ldur	x9, [x9, #0x6]
100b5b46c:     	stur	x9, [x1, #0x22]
100b5b470:     	strb	w25, [x1, #0x2a]
100b5b474:     	strb	w23, [x1, #0x2b]
100b5b478:     	strh	w24, [x1, #0x2c]
100b5b47c:     	strh	w22, [x1, #0x2e]
100b5b480:     	ldr	q0, [sp, #0x140]
100b5b484:     	str	q0, [x1, #0x30]
100b5b488:     	ldr	w9, [sp, #0x150]
100b5b48c:     	str	w9, [x1, #0x40]
100b5b490:     	ldp	q0, q1, [sp, #0x170]
100b5b494:     	ldr	q2, [sp, #0x190]
100b5b498:     	ldr	x9, [sp, #0x1a0]
100b5b49c:     	stur	x9, [x1, #0x74]
100b5b4a0:     	stur	q2, [x1, #0x64]
100b5b4a4:     	stur	q1, [x1, #0x54]
100b5b4a8:     	stur	q0, [x1, #0x44]
100b5b4ac:     	str	w8, [x1, #0x7c]
100b5b4b0:     	ldr	q0, [sp, #0x30]
100b5b4b4:     	str	q0, [x1, #0x80]
100b5b4b8:     	ldr	w8, [sp, #0x28]
100b5b4bc:     	strh	w8, [x1, #0x90]
100b5b4c0:     	strh	w21, [x1, #0x92]
100b5b4c4:     	add	x8, sp, #0x50
100b5b4c8:     	ldur	q0, [x8, #0xdc]
100b5b4cc:     	str	q0, [x1, #0xa0]
100b5b4d0:     	ldr	q0, [sp, #0x120]
100b5b4d4:     	stur	q0, [x1, #0x94]
100b5b4d8:     	ldr	x0, [x20, #0x168]
100b5b4dc:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b5b4e0:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5b4e4:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5b4e8:     	add	x8, x8, #0x760
100b5b4ec:     	ldr	x8, [x8]
100b5b4f0:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5b4f4:     	add	x3, x3, #0xa9d
100b5b4f8:     	mov	w0, #0x1                ; =1
100b5b4fc:     	mov	w1, #0xb0               ; =176
100b5b500:     	mov	w2, #0x8                ; =8
100b5b504:     	blr	x8
100b5b508:     	mov	x1, x0
100b5b50c:     	ldp	q0, q1, [sp, #0x50]
100b5b510:     	ldr	q2, [sp, #0x70]
100b5b514:     	stp	q1, q2, [x1, #0x10]
100b5b518:     	str	q0, [x1]
100b5b51c:     	ldp	q0, q1, [sp, #0x80]
100b5b520:     	ldp	q2, q3, [sp, #0xa0]
100b5b524:     	stp	q2, q3, [x1, #0x50]
100b5b528:     	stp	q0, q1, [x1, #0x30]
100b5b52c:     	ldp	q0, q1, [sp, #0xc0]
100b5b530:     	ldp	q2, q3, [sp, #0xe0]
100b5b534:     	stp	q2, q3, [x1, #0x90]
100b5b538:     	stp	q0, q1, [x1, #0x70]
100b5b53c:     	ldr	x0, [x19, #0x168]
100b5b540:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b5b544:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5b548:     	ldrh	w9, [sp, #0x62]
100b5b54c:     	ldrb	w8, [sp, #0x7a]
100b5b550:     	cmp	w9, #0x1
100b5b554:     	b.ne	0x100b5b7a8 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1508>
100b5b558:     	orr	w8, w8, #0x8
100b5b55c:     	b	0x100b5b7b0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1510>
100b5b560:     	ldrh	w10, [sp, #0x62]
100b5b564:     	ldrh	w9, [sp, #0x7c]
100b5b568:     	cmp	w10, #0x1
100b5b56c:     	b.ne	0x100b5b8b0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1610>
100b5b570:     	cbnz	w9, 0x100b5b8c8 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1628>
100b5b574:     	strh	w8, [x23, #0x2c]
100b5b578:     	ldrh	w9, [sp, #0x7c]
100b5b57c:     	b	0x100b5b8c8 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1628>
100b5b580:     	mov	w9, #0x1b               ; =27
100b5b584:     	b	0x100b5b7ac <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x150c>
100b5b588:     	mov	w9, #0x1d               ; =29
100b5b58c:     	b	0x100b5b7ac <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x150c>
100b5b590:     	and	w8, w8, #0x1e
100b5b594:     	b	0x100b5b7b0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1510>
100b5b598:     	mov	w8, #0xe                ; =14
100b5b59c:     	strh	w8, [sp, #0x60]
100b5b5a0:     	cmp	w9, #0x1
100b5b5a4:     	b.ne	0x100b5b5dc <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x133c>
100b5b5a8:     	ldrb	w8, [x20, #0x15]
100b5b5ac:     	cmp	w8, #0x1
100b5b5b0:     	b.ne	0x100b5b5dc <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x133c>
100b5b5b4:     	ldr	w8, [x20, #0x18]
100b5b5b8:     	cmp	w8, #0x1
100b5b5bc:     	b.ne	0x100b5b5dc <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x133c>
100b5b5c0:     	mov	w8, #0x200              ; =512
100b5b5c4:     	str	w8, [sp, #0xcc]
100b5b5c8:     	b	0x100b5b5dc <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x133c>
100b5b5cc:     	mov	w8, #0x10               ; =16
100b5b5d0:     	b	0x100b5b5d8 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1338>
100b5b5d4:     	mov	w8, #0x17               ; =23
100b5b5d8:     	strh	w8, [sp, #0x60]
100b5b5dc:     	add	x24, sp, #0x50
100b5b5e0:     	ldur	d0, [x20, #0x4]
100b5b5e4:     	stur	d0, [sp, #0x64]
100b5b5e8:     	add	x1, x24, #0x14
100b5b5ec:     	add	x2, x24, #0x18
100b5b5f0:     	mov	x0, x19
100b5b5f4:     	bl	0x100b963c8 <__Z43wm_cursor_position_from_ghost_screen_coordsP8wmWindowPiS1_>
100b5b5f8:     	ldur	w8, [x24, #0x14]
100b5b5fc:     	str	w8, [x23, #0x14]
100b5b600:     	ldur	w8, [x24, #0x18]
100b5b604:     	str	w8, [x23, #0x18]
100b5b608:     	strh	wzr, [sp, #0x62]
100b5b60c:     	ldrb	w8, [x20, #0x14]
100b5b610:     	cbz	w8, 0x100b5b620 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1380>
100b5b614:     	ldr	w8, [sp, #0xcc]
100b5b618:     	orr	w8, w8, #0x1
100b5b61c:     	str	w8, [sp, #0xcc]
100b5b620:     	ldr	w8, [x20, #0x18]
100b5b624:     	ldr	w23, [sp, #0xcc]
100b5b628:     	cmp	w8, #0x2
100b5b62c:     	b.eq	0x100b5b640 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x13a0>
100b5b630:     	cmp	w8, #0x3
100b5b634:     	b.ne	0x100b5b64c <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x13ac>
100b5b638:     	mov	w8, #0x10               ; =16
100b5b63c:     	b	0x100b5b644 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x13a4>
100b5b640:     	mov	w8, #0x8                ; =8
100b5b644:     	orr	w23, w23, w8
100b5b648:     	str	w23, [sp, #0xcc]
100b5b64c:     	ldr	x0, [x19, #0x168]
100b5b650:     	ldr	x8, [x0, #0x8]
100b5b654:     	cbz	x8, 0x100b5b9a4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1704>
100b5b658:     	ldrh	w9, [x8, #0x10]
100b5b65c:     	ldrh	w10, [sp, #0x60]
100b5b660:     	cmp	w9, w10
100b5b664:     	b.ne	0x100b5b9a4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1704>
100b5b668:     	ldr	w24, [x8, #0x7c]
100b5b66c:     	eor	w9, w24, w23
100b5b670:     	tbnz	w9, #0x5, 0x100b5b9a4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1704>
100b5b674:     	ldp	w26, w25, [x8, #0x14]
100b5b678:     	ldp	w28, w27, [x8, #0x94]
100b5b67c:     	bl	0x10079010c <__Z11BLI_poptailP8ListBase>
100b5b680:     	mov	x20, x0
100b5b684:     	sub	w8, w26, w28
100b5b688:     	add	w21, w8, w21
100b5b68c:     	sub	w8, w25, w27
100b5b690:     	add	w22, w8, w22
100b5b694:     	and	w23, w24, w23
100b5b698:     	cbz	x0, 0x100b5b9a4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1704>
100b5b69c:     	ldr	x0, [x20, #0x88]
100b5b6a0:     	cbz	x0, 0x100b5b98c <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x16ec>
100b5b6a4:     	ldrh	w8, [x20, #0x82]
100b5b6a8:     	cbz	w8, 0x100b5b98c <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x16ec>
100b5b6ac:     	ldrh	w8, [x20, #0x80]
100b5b6b0:     	cmp	w8, #0x3
100b5b6b4:     	b.ne	0x100b5b988 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x16e8>
100b5b6b8:     	bl	0x100b46950 <__Z17WM_drag_free_listP8ListBase>
100b5b6bc:     	b	0x100b5b98c <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x16ec>
100b5b6c0:     	ldr	x8, [x23, #0x30]
100b5b6c4:     	cmp	x25, x8
100b5b6c8:     	b.ls	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5b6cc:     	ldr	x0, [x19, #0x10]
100b5b6d0:     	add	x1, sp, #0x100
100b5b6d4:     	bl	0x100b5bca8 <__ZN5ghost3ios24pencil_paint_ticket_liveEPKvRKNS0_18PencilPaintContactE>
100b5b6d8:     	cbz	w0, 0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5b6dc:     	mov	w26, #0x0               ; =0
100b5b6e0:     	ldr	x8, [sp, #0x170]
100b5b6e4:     	ldr	x9, [sp, #0x40]
100b5b6e8:     	ldr	x10, [sp, #0x120]
100b5b6ec:     	stp	x8, x10, [x9, #0x10]
100b5b6f0:     	ldr	x8, [sp, #0x140]
100b5b6f4:     	str	x8, [x9, #0x20]
100b5b6f8:     	ldr	w8, [sp, #0x30]
100b5b6fc:     	ldr	w10, [sp, #0x160]
100b5b700:     	stp	w8, w10, [x9, #0x28]
100b5b704:     	mov	w25, #0x1               ; =1
100b5b708:     	strb	wzr, [x9, #0x38]
100b5b70c:     	b	0x100b5a540 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x2a0>
100b5b710:     	add	w9, w22, #0x1
100b5b714:     	cmp	w9, #0x148
100b5b718:     	b.hi	0x100b5b750 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x14b0>
100b5b71c:     	mov	w8, #0xdf               ; =223
100b5b720:     	adrp	x10, 0x104fcd000 <__ZN7blender6render13texturemargin16TextureMarginMap9distancesE+0x18>
100b5b724:     	add	x10, x10, #0x68e
100b5b728:     	adr	x11, 0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5b72c:     	ldrh	w12, [x10, x9, lsl #1]
100b5b730:     	add	x11, x11, x12, lsl #2
100b5b734:     	br	x11
100b5b738:     	adrp	x0, 0x104bd4000 <__ZL3hex+0x45cd>
100b5b73c:     	add	x0, x0, #0x32c
100b5b740:     	adrp	x2, 0x104bd5000 <__ZL3hex+0x55cd>
100b5b744:     	add	x2, x2, #0x6ea
100b5b748:     	mov	w1, #0x215d             ; =8541
100b5b74c:     	bl	0x10072af4c <__Z29_BLI_assert_unreachable_printPKciS0_>
100b5b750:     	adrp	x19, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b5b754:     	add	x19, x19, #0x2a0
100b5b758:     	ldr	x8, [x19]
100b5b75c:     	ldr	x0, [x8, #0x8]
100b5b760:     	cbnz	x0, 0x100b5b774 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x14d4>
100b5b764:     	mov	x0, x8
100b5b768:     	bl	0x100ae3834 <__Z15CLG_logref_initP10CLG_LogRef>
100b5b76c:     	ldr	x8, [x19]
100b5b770:     	ldr	x0, [x8, #0x8]
100b5b774:     	ldr	w8, [x0, #0x50]
100b5b778:     	cmp	w8, #0x2
100b5b77c:     	b.lt	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5b780:     	adrp	x2, 0x104bd5000 <__ZL3hex+0x55cd>
100b5b784:     	add	x2, x2, #0x707
100b5b788:     	adrp	x3, 0x104bd5000 <__ZL3hex+0x55cd>
100b5b78c:     	add	x3, x3, #0x6ea
100b5b790:     	adrp	x4, 0x104bd5000 <__ZL3hex+0x55cd>
100b5b794:     	add	x4, x4, #0x743
100b5b798:     	str	x22, [sp]
100b5b79c:     	mov	w1, #0x2                ; =2
100b5b7a0:     	bl	0x100ae2b58 <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b5b7a4:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5b7a8:     	mov	w9, #0x17               ; =23
100b5b7ac:     	and	w8, w8, w9
100b5b7b0:     	strb	w8, [sp, #0x7a]
100b5b7b4:     	add	x0, sp, #0x50
100b5b7b8:     	add	x3, x19, #0x160
100b5b7bc:     	ldr	x1, [sp, #0x28]
100b5b7c0:     	mov	x2, x23
100b5b7c4:     	mov	x4, x21
100b5b7c8:     	bl	0x100b5c3a0 <__ZL35wm_event_state_update_and_click_setP7wmEventyS0_Py16GHOST_TEventType>
100b5b7cc:     	ldrh	w8, [sp, #0x60]
100b5b7d0:     	ldrh	w10, [sp, #0x62]
100b5b7d4:     	ldrb	w9, [sp, #0x7a]
100b5b7d8:     	cmp	w8, #0xda
100b5b7dc:     	b.ne	0x100b5b7fc <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x155c>
100b5b7e0:     	cmp	w10, #0x1
100b5b7e4:     	b.ne	0x100b5b7fc <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x155c>
100b5b7e8:     	cbnz	w9, 0x100b5b7fc <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x155c>
100b5b7ec:     	mov	w11, #0x1               ; =1
100b5b7f0:     	adrp	x12, 0x106d8c000 <_build_commit_date>
100b5b7f4:     	add	x12, x12, #0x28
100b5b7f8:     	strb	w11, [x12, #0xc20]
100b5b7fc:     	ldr	x11, [x19, #0x168]
100b5b800:     	ldr	x12, [x11]
100b5b804:     	cbz	x12, 0x100b5b810 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1570>
100b5b808:     	ldrb	w12, [sp, #0xcc]
100b5b80c:     	tbnz	w12, #0x1, 0x100b5b874 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x15d4>
100b5b810:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5b814:     	add	x8, x8, #0x760
100b5b818:     	ldr	x8, [x8]
100b5b81c:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5b820:     	add	x3, x3, #0xa9d
100b5b824:     	mov	w0, #0x1                ; =1
100b5b828:     	mov	w1, #0xb0               ; =176
100b5b82c:     	mov	w2, #0x8                ; =8
100b5b830:     	blr	x8
100b5b834:     	mov	x1, x0
100b5b838:     	ldp	q0, q1, [sp, #0x50]
100b5b83c:     	ldr	q2, [sp, #0x70]
100b5b840:     	stp	q1, q2, [x1, #0x10]
100b5b844:     	str	q0, [x1]
100b5b848:     	ldp	q0, q1, [sp, #0x80]
100b5b84c:     	ldp	q2, q3, [sp, #0xa0]
100b5b850:     	stp	q2, q3, [x1, #0x50]
100b5b854:     	stp	q0, q1, [x1, #0x30]
100b5b858:     	ldp	q0, q1, [sp, #0xc0]
100b5b85c:     	ldp	q2, q3, [sp, #0xe0]
100b5b860:     	stp	q2, q3, [x1, #0x90]
100b5b864:     	stp	q0, q1, [x1, #0x70]
100b5b868:     	ldr	x0, [x19, #0x168]
100b5b86c:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b5b870:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5b874:     	ldr	x11, [x11, #0x8]
100b5b878:     	ldrh	w12, [x11, #0x12]
100b5b87c:     	cmp	w12, #0x1
100b5b880:     	b.ne	0x100b5b810 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1570>
100b5b884:     	cmp	w10, #0x1
100b5b888:     	b.ne	0x100b5b810 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1570>
100b5b88c:     	ldrb	w10, [x11, #0x2a]
100b5b890:     	cmp	w10, w9
100b5b894:     	b.ne	0x100b5b810 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1570>
100b5b898:     	ldrh	w9, [x11, #0x10]
100b5b89c:     	cmp	w9, w8
100b5b8a0:     	b.ne	0x100b5b810 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1570>
100b5b8a4:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5b8a8:     	and	w8, w8, #0xf
100b5b8ac:     	b	0x100b5b7b0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1510>
100b5b8b0:     	cmp	w9, w8
100b5b8b4:     	b.ne	0x100b5b8c8 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1628>
100b5b8b8:     	strh	wzr, [x23, #0x2c]
100b5b8bc:     	strh	wzr, [sp, #0x7c]
100b5b8c0:     	cbnz	w8, 0x100b5b7b4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1514>
100b5b8c4:     	b	0x100b5b8d0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1630>
100b5b8c8:     	cmp	w9, w8
100b5b8cc:     	b.ne	0x100b5b974 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x16d4>
100b5b8d0:     	strh	wzr, [sp, #0x7c]
100b5b8d4:     	b	0x100b5b7b4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1514>
100b5b8d8:     	ldr	x8, [x23, #0x30]
100b5b8dc:     	cmp	x25, x8
100b5b8e0:     	b.ls	0x100b5b930 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1690>
100b5b8e4:     	ldr	x0, [x19, #0x10]
100b5b8e8:     	add	x1, sp, #0x100
100b5b8ec:     	bl	0x100b5bca8 <__ZN5ghost3ios24pencil_paint_ticket_liveEPKvRKNS0_18PencilPaintContactE>
100b5b8f0:     	tbz	w0, #0x0, 0x100b5b930 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1690>
100b5b8f4:     	ldr	x8, [sp, #0x40]
100b5b8f8:     	ldr	x9, [x8, #0x10]
100b5b8fc:     	cbnz	x9, 0x100b5b920 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1680>
100b5b900:     	ldr	x9, [sp, #0x170]
100b5b904:     	ldr	x10, [sp, #0x120]
100b5b908:     	stp	x9, x10, [x8, #0x10]
100b5b90c:     	ldr	x9, [sp, #0x140]
100b5b910:     	str	x9, [x8, #0x20]
100b5b914:     	ldr	w9, [sp, #0x30]
100b5b918:     	ldr	w10, [sp, #0x160]
100b5b91c:     	stp	w9, w10, [x8, #0x28]
100b5b920:     	mov	w26, #0x1               ; =1
100b5b924:     	strb	w26, [x8, #0x38]
100b5b928:     	mov	w25, #0x2               ; =2
100b5b92c:     	b	0x100b5a540 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x2a0>
100b5b930:     	add	x0, sp, #0x50
100b5b934:     	bl	0x100b5bc34 <__ZZ23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvyENK3$_1clEv>
100b5b938:     	cbz	w0, 0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5b93c:     	ldr	x8, [sp, #0x40]
100b5b940:     	mov	x9, x8
100b5b944:     	ldrb	w10, [x9, #0x38]!
100b5b948:     	tbnz	w10, #0x0, 0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5b94c:     	ldr	x10, [x8, #0x30]
100b5b950:     	ldr	x11, [sp, #0x170]
100b5b954:     	cmp	x10, x11
100b5b958:     	csel	x10, x10, x11, hi
100b5b95c:     	str	x10, [x8, #0x30]
100b5b960:     	add	x8, x8, #0x10
100b5b964:     	strb	wzr, [x9]
100b5b968:     	movi.16b	v0, #0x0
100b5b96c:     	stp	q0, q0, [x8]
100b5b970:     	b	0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5b974:     	cmp	w9, #0xab
100b5b978:     	b.ne	0x100b5b7b4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1514>
100b5b97c:     	strh	wzr, [sp, #0x7c]
100b5b980:     	strh	wzr, [x23, #0x2c]
100b5b984:     	b	0x100b5b7b4 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1514>
100b5b988:     	bl	0x100ae4298 <_MEM_freeN>
100b5b98c:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5b990:     	add	x8, x8, #0x710
100b5b994:     	ldr	x8, [x8]
100b5b998:     	mov	x0, x20
100b5b99c:     	mov	w1, #0x0                ; =0
100b5b9a0:     	blr	x8
100b5b9a4:     	tst	w23, #0x200
100b5b9a8:     	cset	w23, eq
100b5b9ac:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5b9b0:     	add	x8, x8, #0x760
100b5b9b4:     	ldr	x8, [x8]
100b5b9b8:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5b9bc:     	add	x3, x3, #0xa9d
100b5b9c0:     	mov	w0, #0x1                ; =1
100b5b9c4:     	mov	w1, #0xb0               ; =176
100b5b9c8:     	mov	w2, #0x8                ; =8
100b5b9cc:     	blr	x8
100b5b9d0:     	mov	x20, x0
100b5b9d4:     	ldp	q0, q1, [sp, #0x50]
100b5b9d8:     	ldr	q2, [sp, #0x70]
100b5b9dc:     	stp	q1, q2, [x0, #0x10]
100b5b9e0:     	str	q0, [x0]
100b5b9e4:     	ldp	q0, q1, [sp, #0x80]
100b5b9e8:     	ldp	q2, q3, [sp, #0xa0]
100b5b9ec:     	stp	q2, q3, [x0, #0x50]
100b5b9f0:     	stp	q0, q1, [x0, #0x30]
100b5b9f4:     	ldp	q0, q1, [sp, #0xc0]
100b5b9f8:     	ldp	q2, q3, [sp, #0xe0]
100b5b9fc:     	stp	q2, q3, [x0, #0x90]
100b5ba00:     	stp	q0, q1, [x0, #0x70]
100b5ba04:     	ldr	x0, [x19, #0x168]
100b5ba08:     	mov	x1, x20
100b5ba0c:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b5ba10:     	ldp	w8, w9, [x20, #0x14]
100b5ba14:     	sub	w8, w8, w21
100b5ba18:     	sub	w9, w9, w22
100b5ba1c:     	stp	w8, w9, [x20, #0x94]
100b5ba20:     	cbz	w23, 0x100b5ba30 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1790>
100b5ba24:     	ldr	w8, [x20, #0x7c]
100b5ba28:     	and	w8, w8, #0x1ff
100b5ba2c:     	str	w8, [x20, #0x7c]
100b5ba30:     	ldur	x8, [x29, #-0x78]
100b5ba34:     	adrp	x9, 0x106369000 <_zlibVersion+0x106369000>
100b5ba38:     	ldr	x9, [x9, #0x7f8]
100b5ba3c:     	ldr	x9, [x9]
100b5ba40:     	cmp	x9, x8
100b5ba44:     	b.ne	0x100b5bc04 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x1964>
100b5ba48:     	add	sp, sp, #0x240
100b5ba4c:     	ldp	x29, x30, [sp, #0x60]
100b5ba50:     	ldp	x20, x19, [sp, #0x50]
100b5ba54:     	ldp	x22, x21, [sp, #0x40]
100b5ba58:     	ldp	x24, x23, [sp, #0x30]
100b5ba5c:     	ldp	x26, x25, [sp, #0x20]
100b5ba60:     	ldp	x28, x27, [sp, #0x10]
100b5ba64:     	ldp	d9, d8, [sp], #0x70
100b5ba68:     	ret
100b5ba6c:     	mov	w8, #0xb3               ; =179
100b5ba70:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5ba74:     	mov	w8, #0xac               ; =172
100b5ba78:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5ba7c:     	mov	w8, #0xfe               ; =254
100b5ba80:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5ba84:     	mov	w8, #0xaf               ; =175
100b5ba88:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5ba8c:     	mov	w8, #0xc7               ; =199
100b5ba90:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5ba94:     	mov	w8, #0xa0               ; =160
100b5ba98:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5ba9c:     	mov	w8, #0xa3               ; =163
100b5baa0:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5baa4:     	mov	w8, #0xd3               ; =211
100b5baa8:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5baac:     	mov	w8, #0xa6               ; =166
100b5bab0:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bab4:     	mov	w8, #0xe1               ; =225
100b5bab8:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5babc:     	mov	w8, #0xa9               ; =169
100b5bac0:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bac4:     	mov	w8, #0xa4               ; =164
100b5bac8:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bacc:     	mov	w8, #0x89               ; =137
100b5bad0:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bad4:     	mov	w8, #0xad               ; =173
100b5bad8:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5badc:     	mov	w8, #0xe5               ; =229
100b5bae0:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bae4:     	mov	w8, #0x8a               ; =138
100b5bae8:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5baec:     	mov	w8, #0xd6               ; =214
100b5baf0:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5baf4:     	mov	w8, #0xaa               ; =170
100b5baf8:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bafc:     	mov	w8, #0xa2               ; =162
100b5bb00:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb04:     	mov	w8, #0xa5               ; =165
100b5bb08:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb0c:     	mov	w8, #0xe6               ; =230
100b5bb10:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb14:     	mov	w8, #0xe8               ; =232
100b5bb18:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb1c:     	mov	w8, #0x8b               ; =139
100b5bb20:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb24:     	mov	w8, #0xdb               ; =219
100b5bb28:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb2c:     	mov	w8, #0xab               ; =171
100b5bb30:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb34:     	mov	w8, #0xda               ; =218
100b5bb38:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb3c:     	mov	w8, #0xe3               ; =227
100b5bb40:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb44:     	mov	w8, #0xde               ; =222
100b5bb48:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb4c:     	mov	w8, #0xe9               ; =233
100b5bb50:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb54:     	mov	w8, #0xdd               ; =221
100b5bb58:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb5c:     	mov	w8, #0xb1               ; =177
100b5bb60:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb64:     	mov	w8, #0xdc               ; =220
100b5bb68:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb6c:     	mov	w8, #0xa7               ; =167
100b5bb70:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb74:     	mov	w8, #0xb2               ; =178
100b5bb78:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb7c:     	mov	w8, #0xe7               ; =231
100b5bb80:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb84:     	mov	w8, #0xe4               ; =228
100b5bb88:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb8c:     	mov	w8, #0xd4               ; =212
100b5bb90:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb94:     	mov	w8, #0xe2               ; =226
100b5bb98:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bb9c:     	mov	w8, #0x8c               ; =140
100b5bba0:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bba4:     	mov	w8, #0xa8               ; =168
100b5bba8:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bbac:     	mov	w8, #0xea               ; =234
100b5bbb0:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bbb4:     	mov	w8, #0xeb               ; =235
100b5bbb8:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bbbc:     	mov	w8, #0xd5               ; =213
100b5bbc0:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bbc4:     	mov	w8, #0xec               ; =236
100b5bbc8:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bbcc:     	mov	w8, #0xd9               ; =217
100b5bbd0:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bbd4:     	mov	w8, #0xae               ; =174
100b5bbd8:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bbdc:     	mov	w8, #0xd8               ; =216
100b5bbe0:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bbe4:     	mov	w8, #0xe0               ; =224
100b5bbe8:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bbec:     	mov	w8, #0xd7               ; =215
100b5bbf0:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bbf4:     	mov	w8, #0xa1               ; =161
100b5bbf8:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bbfc:     	mov	w8, #0xb0               ; =176
100b5bc00:     	b	0x100b5afa0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0xd00>
100b5bc04:     	bl	0x104b7534c <_zlibVersion+0x104b7534c>
100b5bc08:     	b	0x100b5bc0c <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x196c>
100b5bc0c:     	mov	x19, x0
100b5bc10:     	ldrsb	w8, [x21, #0x17]
100b5bc14:     	tbz	w8, #0x1f, 0x100b5bc2c <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy+0x198c>
100b5bc18:     	ldr	x0, [x21]
100b5bc1c:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b5bc20:     	mov	x0, x19
100b5bc24:     	bl	0x104b72c1c <_zlibVersion+0x104b72c1c>
100b5bc28:     	mov	x19, x0
100b5bc2c:     	mov	x0, x19
100b5bc30:     	bl	0x104b72c1c <_zlibVersion+0x104b72c1c>
