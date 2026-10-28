
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010af69c <-[GHOSTUIWindow handleZoom:]>:
1010af69c:     	sub	sp, sp, #0x110
1010af6a0:     	stp	d11, d10, [sp, #0xb0]
1010af6a4:     	stp	d9, d8, [sp, #0xc0]
1010af6a8:     	stp	x28, x27, [sp, #0xd0]
1010af6ac:     	stp	x22, x21, [sp, #0xe0]
1010af6b0:     	stp	x20, x19, [sp, #0xf0]
1010af6b4:     	stp	x29, x30, [sp, #0x100]
1010af6b8:     	add	x29, sp, #0x100
1010af6bc:     	mov	x19, x2
1010af6c0:     	mov	x20, x0
1010af6c4:     	mov	x0, x2
1010af6c8:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af6cc:     	cmp	x0, #0x1
1010af6d0:     	b.ne	0x1010af6dc <-[GHOSTUIWindow handleZoom:]+0x40>
1010af6d4:     	mov	x0, x20
1010af6d8:     	bl	0x104b77820 <_objc_msgSend$cancelPointerCapture>
1010af6dc:     	mov	x0, x19
1010af6e0:     	bl	0x104b794e0 <_objc_msgSend$numberOfTouches>
1010af6e4:     	cmp	x0, #0x2
1010af6e8:     	b.lo	0x1010af720 <-[GHOSTUIWindow handleZoom:]+0x84>
1010af6ec:     	mov	x0, x19
1010af6f0:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af6f4:     	cmp	x0, #0x1
1010af6f8:     	b.ne	0x1010af740 <-[GHOSTUIWindow handleZoom:]+0xa4>
1010af6fc:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010af700:     	ldrsw	x8, [x8, #0xf84]
1010af704:     	ldr	x2, [x20, x8]
1010af708:     	mov	x0, x19
1010af70c:     	bl	0x104b78760 <_objc_msgSend$getScaledDistance:>
1010af710:     	mov	x0, x19
1010af714:     	bl	0x104b7a0a0 <_objc_msgSend$setCachedDistance:>
1010af718:     	adrp	x8, 0x107f02000 <__ZZN7blender4drawL21get_coarse_tan_formatEvE6format+0x158>
1010af71c:     	str	xzr, [x8, #0xbb8]
1010af720:     	ldp	x29, x30, [sp, #0x100]
1010af724:     	ldp	x20, x19, [sp, #0xf0]
1010af728:     	ldp	x22, x21, [sp, #0xe0]
1010af72c:     	ldp	x28, x27, [sp, #0xd0]
1010af730:     	ldp	d9, d8, [sp, #0xc0]
1010af734:     	ldp	d11, d10, [sp, #0xb0]
1010af738:     	add	sp, sp, #0x110
1010af73c:     	ret
1010af740:     	mov	x0, x19
1010af744:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af748:     	cmp	x0, #0x2
1010af74c:     	b.ne	0x1010af840 <-[GHOSTUIWindow handleZoom:]+0x1a4>
1010af750:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010af754:     	ldrsw	x22, [x8, #0xf84]
1010af758:     	ldr	x2, [x20, x22]
1010af75c:     	mov	x0, x19
1010af760:     	bl	0x104b78760 <_objc_msgSend$getScaledDistance:>
1010af764:     	fmov	d8, d0
1010af768:     	mov	x0, x19
1010af76c:     	bl	0x104b786a0 <_objc_msgSend$getCachedDistance>
1010af770:     	fsub	d10, d8, d0
1010af774:     	mov	x0, x19
1010af778:     	fmov	d0, d8
1010af77c:     	bl	0x104b7a0a0 <_objc_msgSend$setCachedDistance:>
1010af780:     	fcmp	d10, #0.0
1010af784:     	b.eq	0x1010af720 <-[GHOSTUIWindow handleZoom:]+0x84>
1010af788:     	b.vs	0x1010af720 <-[GHOSTUIWindow handleZoom:]+0x84>
1010af78c:     	mov	x21, sp
1010af790:     	ldr	x2, [x20, x22]
1010af794:     	mov	x0, x19
1010af798:     	bl	0x104b78700 <_objc_msgSend$getPinchMidpoint:>
1010af79c:     	fmov	d8, d0
1010af7a0:     	fmov	d9, d1
1010af7a4:     	bl	0x1010a0738 <__Z29GHOST_IOS_get_flythrough_modev>
1010af7a8:     	cbz	w0, 0x1010af7d8 <-[GHOSTUIWindow handleZoom:]+0x13c>
1010af7ac:     	adrp	x8, 0x107f02000 <__ZZN7blender4drawL21get_coarse_tan_formatEvE6format+0x158>
1010af7b0:     	ldr	d0, [x8, #0xbb8]
1010af7b4:     	adrp	x9, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010af7b8:     	ldr	d1, [x9, #0x4d8]
1010af7bc:     	fmul	d0, d0, d1
1010af7c0:     	fadd	d1, d10, d10
1010af7c4:     	adrp	x9, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010af7c8:     	ldr	d2, [x9, #0x4e0]
1010af7cc:     	fmul	d1, d1, d2
1010af7d0:     	fadd	d10, d1, d0
1010af7d4:     	str	d10, [x8, #0xbb8]
1010af7d8:     	adrp	x8, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010af7dc:     	add	x8, x8, #0x544
1010af7e0:     	ldr	q0, [x8]
1010af7e4:     	stur	q0, [sp, #0x5c]
1010af7e8:     	str	wzr, [sp, #0x6c]
1010af7ec:     	strb	wzr, [sp, #0x70]
1010af7f0:     	movi.16b	v0, #0x0
1010af7f4:     	stur	q0, [sp, #0x78]
1010af7f8:     	stur	q0, [x21, #0x88]
1010af7fc:     	stur	q0, [x21, #0x98]
1010af800:     	str	xzr, [sp, #0xa8]
1010af804:     	stp	d8, d9, [sp, #0x30]
1010af808:     	stp	xzr, xzr, [sp, #0x40]
1010af80c:     	str	d10, [sp, #0x50]
1010af810:     	strh	wzr, [sp, #0x58]
1010af814:     	mov	x0, x19
1010af818:     	bl	0x104b78c40 <_objc_msgSend$isDirectTouch>
1010af81c:     	strb	w0, [sp, #0x6c]
1010af820:     	mov	w8, #0x4                ; =4
1010af824:     	mov	w9, #0x1                ; =1
1010af828:     	str	w8, [sp]
1010af82c:     	str	w9, [sp, #0x28]
1010af830:     	mov	x2, sp
1010af834:     	mov	x0, x20
1010af838:     	bl	0x104b78620 <_objc_msgSend$generateUserInputEvents:>
1010af83c:     	b	0x1010af720 <-[GHOSTUIWindow handleZoom:]+0x84>
1010af840:     	mov	x0, x19
1010af844:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af848:     	cmp	x0, #0x3
1010af84c:     	b.eq	0x1010af718 <-[GHOSTUIWindow handleZoom:]+0x7c>
1010af850:     	mov	x0, x19
1010af854:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af858:     	cmp	x0, #0x4
1010af85c:     	b.eq	0x1010af718 <-[GHOSTUIWindow handleZoom:]+0x7c>
1010af860:     	mov	x0, x19
1010af864:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af868:     	cmp	x0, #0x5
1010af86c:     	b.eq	0x1010af718 <-[GHOSTUIWindow handleZoom:]+0x7c>
1010af870:     	b	0x1010af720 <-[GHOSTUIWindow handleZoom:]+0x84>
