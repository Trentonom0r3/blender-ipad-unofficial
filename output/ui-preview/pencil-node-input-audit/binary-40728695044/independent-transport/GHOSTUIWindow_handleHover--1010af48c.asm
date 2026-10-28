
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010af48c <-[GHOSTUIWindow handleHover:]>:
1010af48c:     	sub	sp, sp, #0xf0
1010af490:     	stp	x24, x23, [sp, #0xb0]
1010af494:     	stp	x22, x21, [sp, #0xc0]
1010af498:     	stp	x20, x19, [sp, #0xd0]
1010af49c:     	stp	x29, x30, [sp, #0xe0]
1010af4a0:     	add	x29, sp, #0xe0
1010af4a4:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010af4a8:     	ldrsw	x8, [x8, #0xfb4]
1010af4ac:     	ldr	w8, [x0, x8]
1010af4b0:     	cbnz	w8, 0x1010af634 <-[GHOSTUIWindow handleHover:]+0x1a8>
1010af4b4:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010af4b8:     	ldrsw	x21, [x8, #0xf9c]
1010af4bc:     	ldr	x8, [x0, x21]
1010af4c0:     	cbnz	x8, 0x1010af634 <-[GHOSTUIWindow handleHover:]+0x1a8>
1010af4c4:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010af4c8:     	ldrsw	x23, [x8, #0xf78]
1010af4cc:     	ldr	x8, [x0, x23]
1010af4d0:     	mov	x22, x0
1010af4d4:     	mov	x0, x8
1010af4d8:     	mov	x19, x2
1010af4dc:     	bl	0x104b79680 <_objc_msgSend$pencilContactDown>
1010af4e0:     	tbnz	w0, #0x0, 0x1010af634 <-[GHOSTUIWindow handleHover:]+0x1a8>
1010af4e4:     	mov	x0, x19
1010af4e8:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af4ec:     	cmp	x0, #0x1
1010af4f0:     	b.eq	0x1010af504 <-[GHOSTUIWindow handleHover:]+0x78>
1010af4f4:     	mov	x0, x19
1010af4f8:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af4fc:     	cmp	x0, #0x2
1010af500:     	b.ne	0x1010af5c8 <-[GHOSTUIWindow handleHover:]+0x13c>
1010af504:     	ldr	x9, [x22, x21]
1010af508:     	cbnz	x9, 0x1010af634 <-[GHOSTUIWindow handleHover:]+0x1a8>
1010af50c:     	mov	x0, x19
1010af510:     	mov	x19, sp
1010af514:     	adrp	x9, 0x106627000 <_zlibVersion+0x106627000>
1010af518:     	ldrsw	x9, [x9, #0xf84]
1010af51c:     	ldr	x2, [x22, x9]
1010af520:     	bl	0x104b78780 <_objc_msgSend$getScaledTouchPoint:>
1010af524:     	mov	x0, x22
1010af528:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010af52c:     	ldrsw	x8, [x8, #0x48]
1010af530:     	str	d0, [x22, x8]
1010af534:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010af538:     	ldrsw	x8, [x8, #0x4c]
1010af53c:     	str	d1, [x22, x8]
1010af540:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010af544:     	ldrsw	x9, [x8, #0x5c]
1010af548:     	mov	w8, #0x1                ; =1
1010af54c:     	strb	w8, [x22, x9]
1010af550:     	adrp	x9, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010af554:     	ldrsw	x9, [x9, #0x60]
1010af558:     	ldrb	w9, [x22, x9]
1010af55c:     	cmp	w9, #0x1
1010af560:     	b.ne	0x1010af56c <-[GHOSTUIWindow handleHover:]+0xe0>
1010af564:     	ldr	x9, [x0, x21]
1010af568:     	cbz	x9, 0x1010af64c <-[GHOSTUIWindow handleHover:]+0x1c0>
1010af56c:     	adrp	x9, 0x106627000 <_zlibVersion+0x106627000>
1010af570:     	ldrsw	x9, [x9, #0xfa0]
1010af574:     	str	w8, [x0, x9]
1010af578:     	adrp	x9, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010af57c:     	add	x9, x9, #0x544
1010af580:     	ldr	q2, [x9]
1010af584:     	stur	q2, [sp, #0x5c]
1010af588:     	str	wzr, [sp, #0x6c]
1010af58c:     	strb	wzr, [sp, #0x70]
1010af590:     	movi.16b	v2, #0x0
1010af594:     	stur	q2, [sp, #0x78]
1010af598:     	stur	q2, [x19, #0x88]
1010af59c:     	stur	q2, [x19, #0x98]
1010af5a0:     	str	xzr, [sp, #0xa8]
1010af5a4:     	stp	d0, d1, [sp, #0x30]
1010af5a8:     	stp	xzr, xzr, [sp, #0x48]
1010af5ac:     	str	xzr, [sp, #0x40]
1010af5b0:     	strh	w8, [sp, #0x58]
1010af5b4:     	str	wzr, [sp]
1010af5b8:     	str	w8, [sp, #0x28]
1010af5bc:     	mov	x2, sp
1010af5c0:     	bl	0x104b78620 <_objc_msgSend$generateUserInputEvents:>
1010af5c4:     	b	0x1010af634 <-[GHOSTUIWindow handleHover:]+0x1a8>
1010af5c8:     	mov	x20, x19
1010af5cc:     	mov	x0, x19
1010af5d0:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af5d4:     	cmp	x0, #0x3
1010af5d8:     	mov	x9, x22
1010af5dc:     	b.eq	0x1010af608 <-[GHOSTUIWindow handleHover:]+0x17c>
1010af5e0:     	mov	x0, x20
1010af5e4:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af5e8:     	mov	x9, x22
1010af5ec:     	cmp	x0, #0x4
1010af5f0:     	b.eq	0x1010af608 <-[GHOSTUIWindow handleHover:]+0x17c>
1010af5f4:     	mov	x0, x19
1010af5f8:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af5fc:     	mov	x9, x22
1010af600:     	cmp	x0, #0x5
1010af604:     	b.ne	0x1010af634 <-[GHOSTUIWindow handleHover:]+0x1a8>
1010af608:     	ldr	x8, [x9, x21]
1010af60c:     	cbnz	x8, 0x1010af634 <-[GHOSTUIWindow handleHover:]+0x1a8>
1010af610:     	ldr	x0, [x9, x23]
1010af614:     	bl	0x104b79680 <_objc_msgSend$pencilContactDown>
1010af618:     	tbnz	w0, #0x0, 0x1010af634 <-[GHOSTUIWindow handleHover:]+0x1a8>
1010af61c:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010af620:     	ldrsw	x8, [x8, #0xfa0]
1010af624:     	adrp	x9, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010af628:     	add	x9, x9, #0x544
1010af62c:     	ldr	q0, [x9]
1010af630:     	str	q0, [x22, x8]
1010af634:     	ldp	x29, x30, [sp, #0xe0]
1010af638:     	ldp	x20, x19, [sp, #0xd0]
1010af63c:     	ldp	x22, x21, [sp, #0xc0]
1010af640:     	ldp	x24, x23, [sp, #0xb0]
1010af644:     	add	sp, sp, #0xf0
1010af648:     	ret
1010af64c:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010af650:     	ldrsw	x8, [x8, #0xfa0]
1010af654:     	adrp	x9, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010af658:     	add	x9, x9, #0x544
1010af65c:     	ldr	q2, [x9]
1010af660:     	str	q2, [x0, x8]
1010af664:     	stur	q2, [sp, #0x5c]
1010af668:     	str	wzr, [sp, #0x6c]
1010af66c:     	strb	wzr, [sp, #0x70]
1010af670:     	movi.16b	v2, #0x0
1010af674:     	stur	q2, [sp, #0x78]
1010af678:     	stur	q2, [x19, #0x88]
1010af67c:     	stur	q2, [x19, #0x98]
1010af680:     	str	xzr, [sp, #0xa8]
1010af684:     	stp	d0, d1, [sp, #0x30]
1010af688:     	strh	wzr, [sp, #0x58]
1010af68c:     	stp	xzr, xzr, [sp, #0x48]
1010af690:     	str	xzr, [sp, #0x40]
1010af694:     	mov	w8, #0x1                ; =1
1010af698:     	b	0x1010af5b4 <-[GHOSTUIWindow handleHover:]+0x128>
