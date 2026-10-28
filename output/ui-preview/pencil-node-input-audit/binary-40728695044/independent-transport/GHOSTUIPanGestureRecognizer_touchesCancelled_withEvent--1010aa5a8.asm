
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010aa5a8 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]>:
1010aa5a8:     	stp	d15, d14, [sp, #-0xa0]!
1010aa5ac:     	stp	d13, d12, [sp, #0x10]
1010aa5b0:     	stp	d11, d10, [sp, #0x20]
1010aa5b4:     	stp	d9, d8, [sp, #0x30]
1010aa5b8:     	stp	x28, x27, [sp, #0x40]
1010aa5bc:     	stp	x26, x25, [sp, #0x50]
1010aa5c0:     	stp	x24, x23, [sp, #0x60]
1010aa5c4:     	stp	x22, x21, [sp, #0x70]
1010aa5c8:     	stp	x20, x19, [sp, #0x80]
1010aa5cc:     	stp	x29, x30, [sp, #0x90]
1010aa5d0:     	add	x29, sp, #0x90
1010aa5d4:     	sub	sp, sp, #0x1b0
1010aa5d8:     	str	x3, [sp]
1010aa5dc:     	mov	x19, x2
1010aa5e0:     	mov	x20, x0
1010aa5e4:     	adrp	x8, 0x106369000 <_zlibVersion+0x106369000>
1010aa5e8:     	ldr	x8, [x8, #0x7f8]
1010aa5ec:     	ldr	x8, [x8]
1010aa5f0:     	stur	x8, [x29, #-0xa0]
1010aa5f4:     	movi.16b	v0, #0x0
1010aa5f8:     	stp	q0, q0, [sp, #0x60]
1010aa5fc:     	stp	q0, q0, [sp, #0x80]
1010aa600:     	add	x2, sp, #0x60
1010aa604:     	add	x3, sp, #0x120
1010aa608:     	mov	x0, x19
1010aa60c:     	mov	w4, #0x10               ; =16
1010aa610:     	bl	0x104b77d40 <_objc_msgSend$countByEnumeratingWithState:objects:count:>
1010aa614:     	adrp	x25, 0x106627000 <_zlibVersion+0x106627000>
1010aa618:     	cbz	x0, 0x1010aa8ec <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x344>
1010aa61c:     	mov	x22, x0
1010aa620:     	ldr	x8, [sp, #0x70]
1010aa624:     	ldr	x26, [x8]
1010aa628:     	fmov	d11, #1.00000000
1010aa62c:     	fmov	d12, xzr
1010aa630:     	b	0x1010aa650 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0xa8>
1010aa634:     	add	x2, sp, #0x60
1010aa638:     	add	x3, sp, #0x120
1010aa63c:     	mov	x0, x19
1010aa640:     	mov	w4, #0x10               ; =16
1010aa644:     	bl	0x104b77d40 <_objc_msgSend$countByEnumeratingWithState:objects:count:>
1010aa648:     	mov	x22, x0
1010aa64c:     	cbz	x0, 0x1010aa8ec <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x344>
1010aa650:     	mov	x21, #0x0               ; =0
1010aa654:     	str	x22, [sp, #0x8]
1010aa658:     	b	0x1010aa678 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0xd0>
1010aa65c:     	strb	w8, [x9, #0x30]
1010aa660:     	stp	s1, s3, [x9, #0x34]
1010aa664:     	str	s2, [x9, #0x3c]
1010aa668:     	strb	w27, [x9, #0x40]
1010aa66c:     	add	x21, x21, #0x1
1010aa670:     	cmp	x22, x21
1010aa674:     	b.eq	0x1010aa634 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x8c>
1010aa678:     	ldr	x8, [sp, #0x70]
1010aa67c:     	ldr	x8, [x8]
1010aa680:     	cmp	x8, x26
1010aa684:     	b.eq	0x1010aa690 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0xe8>
1010aa688:     	mov	x0, x19
1010aa68c:     	bl	0x104b761bc <_zlibVersion+0x104b761bc>
1010aa690:     	ldr	x8, [sp, #0x68]
1010aa694:     	ldr	x23, [x8, x21, lsl #3]
1010aa698:     	ldrsw	x28, [x25, #0xf5c]
1010aa69c:     	mov	x0, x20
1010aa6a0:     	bl	0x104b7c2c0 <_objc_msgSend$view>
1010aa6a4:     	fmov	s13, wzr
1010aa6a8:     	cbz	x23, 0x1010aa76c <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x1c4>
1010aa6ac:     	mov	x24, x0
1010aa6b0:     	mov	x0, x23
1010aa6b4:     	bl	0x104b7c180 <_objc_msgSend$type>
1010aa6b8:     	mov	w27, #0x0               ; =0
1010aa6bc:     	cbz	x24, 0x1010aa780 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x1d8>
1010aa6c0:     	cmp	x0, #0x2
1010aa6c4:     	b.ne	0x1010aa780 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x1d8>
1010aa6c8:     	mov	x22, x26
1010aa6cc:     	mov	x26, x19
1010aa6d0:     	mov	x19, x25
1010aa6d4:     	mov	x0, x23
1010aa6d8:     	bl	0x104b784a0 <_objc_msgSend$force>
1010aa6dc:     	fmov	d8, d0
1010aa6e0:     	fmov	x27, d8
1010aa6e4:     	mov	x0, x23
1010aa6e8:     	bl	0x104b79060 <_objc_msgSend$maximumPossibleForce>
1010aa6ec:     	fmov	d10, d0
1010aa6f0:     	fmov	x25, d10
1010aa6f4:     	mov	x0, x23
1010aa6f8:     	mov	x2, x24
1010aa6fc:     	bl	0x104b774e0 <_objc_msgSend$azimuthAngleInView:>
1010aa700:     	fmov	d9, d0
1010aa704:     	fmov	x24, d9
1010aa708:     	mov	x0, x23
1010aa70c:     	bl	0x104b773a0 <_objc_msgSend$altitudeAngle>
1010aa710:     	fmov	x8, d0
1010aa714:     	and	x9, x27, #0x7fffffffffffffff
1010aa718:     	and	x10, x25, #0x7fffffffffffffff
1010aa71c:     	mov	x12, #0x7ff0000000000000 ; =9218868437227405312
1010aa720:     	cmp	x10, x12
1010aa724:     	cset	w10, lt
1010aa728:     	and	x11, x24, #0x7fffffffffffffff
1010aa72c:     	cmp	x11, x12
1010aa730:     	cset	w11, lt
1010aa734:     	and	x8, x8, #0x7fffffffffffffff
1010aa738:     	cmp	x8, x12
1010aa73c:     	cset	w8, lt
1010aa740:     	mov	x12, #0x7fefffffffffffff ; =9218868437227405311
1010aa744:     	cmp	x9, x12
1010aa748:     	ccmp	w10, #0x0, #0x4, le
1010aa74c:     	ccmp	w11, #0x0, #0x4, ne
1010aa750:     	ccmp	w8, #0x0, #0x4, ne
1010aa754:     	b.ne	0x1010aa790 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x1e8>
1010aa758:     	mov	w27, #0x0               ; =0
1010aa75c:     	mov	w8, #0x0                ; =0
1010aa760:     	fmov	s0, wzr
1010aa764:     	fmov	s14, wzr
1010aa768:     	b	0x1010aa7e4 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x23c>
1010aa76c:     	mov	w27, #0x0               ; =0
1010aa770:     	mov	w8, #0x0                ; =0
1010aa774:     	fmov	s0, wzr
1010aa778:     	fmov	s14, wzr
1010aa77c:     	b	0x1010aa7f4 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x24c>
1010aa780:     	fmov	s0, wzr
1010aa784:     	fmov	s14, wzr
1010aa788:     	mov	x8, x27
1010aa78c:     	b	0x1010aa7f4 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x24c>
1010aa790:     	fcmp	d10, #0.0
1010aa794:     	cset	w27, gt
1010aa798:     	fdiv	d1, d8, d10
1010aa79c:     	fcsel	d1, d1, d11, gt
1010aa7a0:     	fcmp	d1, d11
1010aa7a4:     	fcsel	d2, d11, d1, gt
1010aa7a8:     	fcmp	d1, #0.0
1010aa7ac:     	fcsel	d1, d12, d2, mi
1010aa7b0:     	fcvt	s14, d1
1010aa7b4:     	fmov	d8, d0
1010aa7b8:     	fmov	d0, d9
1010aa7bc:     	bl	0x104b7531c <_zlibVersion+0x104b7531c>
1010aa7c0:     	fmov	d9, d0
1010aa7c4:     	fmov	d10, d1
1010aa7c8:     	fmov	d0, d8
1010aa7cc:     	bl	0x104b75634 <_zlibVersion+0x104b75634>
1010aa7d0:     	fmul	d1, d9, d0
1010aa7d4:     	fcvt	s13, d1
1010aa7d8:     	fnmul	d0, d10, d0
1010aa7dc:     	fcvt	s0, d0
1010aa7e0:     	mov	w8, #0x1                ; =1
1010aa7e4:     	mov	x25, x19
1010aa7e8:     	mov	x19, x26
1010aa7ec:     	mov	x26, x22
1010aa7f0:     	ldr	x22, [sp, #0x8]
1010aa7f4:     	add	x9, x20, x28
1010aa7f8:     	ldr	x10, [x9, #0x8]
1010aa7fc:     	cmp	x10, #0x0
1010aa800:     	ccmp	x10, x23, #0x0, ne
1010aa804:     	b.ne	0x1010aa66c <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0xc4>
1010aa808:     	ldr	w10, [x9]
1010aa80c:     	cmp	w10, #0x2
1010aa810:     	b.ne	0x1010aa66c <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0xc4>
1010aa814:     	fmov	w10, s14
1010aa818:     	and	w10, w10, #0x7fffffff
1010aa81c:     	mov	w13, #0x7f7fffff        ; =2139095039
1010aa820:     	cmp	w10, w13
1010aa824:     	cset	w10, gt
1010aa828:     	fmov	w11, s13
1010aa82c:     	and	w11, w11, #0x7fffffff
1010aa830:     	cmp	w11, w13
1010aa834:     	cset	w11, gt
1010aa838:     	fmov	w12, s0
1010aa83c:     	and	w12, w12, #0x7fffffff
1010aa840:     	cmp	w12, w13
1010aa844:     	cset	w12, gt
1010aa848:     	cbz	w8, 0x1010aa66c <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0xc4>
1010aa84c:     	tbnz	w10, #0x0, 0x1010aa66c <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0xc4>
1010aa850:     	tbnz	w11, #0x0, 0x1010aa66c <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0xc4>
1010aa854:     	tbnz	w12, #0x0, 0x1010aa66c <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0xc4>
1010aa858:     	fmov	s1, wzr
1010aa85c:     	fcmp	s14, #0.0
1010aa860:     	b.mi	0x1010aa874 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x2cc>
1010aa864:     	fmov	s1, #1.00000000
1010aa868:     	fcmp	s14, s1
1010aa86c:     	b.gt	0x1010aa874 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x2cc>
1010aa870:     	fmov	s1, s14
1010aa874:     	fmov	s2, #-1.00000000
1010aa878:     	fcmp	s13, s2
1010aa87c:     	fmov	s3, #-1.00000000
1010aa880:     	b.mi	0x1010aa894 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x2ec>
1010aa884:     	fmov	s3, #1.00000000
1010aa888:     	fcmp	s13, s3
1010aa88c:     	b.gt	0x1010aa894 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x2ec>
1010aa890:     	fmov	s3, s13
1010aa894:     	fcmp	s0, s2
1010aa898:     	b.mi	0x1010aa8ac <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x304>
1010aa89c:     	fmov	s2, #1.00000000
1010aa8a0:     	fcmp	s0, s2
1010aa8a4:     	b.gt	0x1010aa8ac <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x304>
1010aa8a8:     	fmov	s2, s0
1010aa8ac:     	strb	w8, [x9, #0x1c]
1010aa8b0:     	stp	s1, s3, [x9, #0x20]
1010aa8b4:     	str	s2, [x9, #0x28]
1010aa8b8:     	strb	w27, [x9, #0x2c]
1010aa8bc:     	ldrb	w10, [x9, #0x30]
1010aa8c0:     	cmp	w10, #0x1
1010aa8c4:     	b.ne	0x1010aa65c <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0xb4>
1010aa8c8:     	ldrb	w10, [x9, #0x40]
1010aa8cc:     	cbz	w27, 0x1010aa8d4 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x32c>
1010aa8d0:     	tbz	w10, #0x0, 0x1010aa65c <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0xb4>
1010aa8d4:     	cmp	w27, w10
1010aa8d8:     	b.ne	0x1010aa66c <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0xc4>
1010aa8dc:     	ldr	s0, [x9, #0x34]
1010aa8e0:     	fcmp	s1, s0
1010aa8e4:     	b.gt	0x1010aa65c <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0xb4>
1010aa8e8:     	b	0x1010aa66c <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0xc4>
1010aa8ec:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aa8f0:     	ldr	x8, [x8, #0xdf8]
1010aa8f4:     	stp	x20, x8, [sp, #0x50]
1010aa8f8:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aa8fc:     	ldr	x1, [x8, #0xa78]
1010aa900:     	add	x0, sp, #0x50
1010aa904:     	mov	x2, x19
1010aa908:     	ldr	x3, [sp]
1010aa90c:     	bl	0x104b761c8 <_zlibVersion+0x104b761c8>
1010aa910:     	movi.16b	v0, #0x0
1010aa914:     	stp	q0, q0, [sp, #0x30]
1010aa918:     	stp	q0, q0, [sp, #0x10]
1010aa91c:     	add	x2, sp, #0x10
1010aa920:     	add	x3, sp, #0xa0
1010aa924:     	mov	x0, x19
1010aa928:     	mov	w4, #0x10               ; =16
1010aa92c:     	bl	0x104b77d40 <_objc_msgSend$countByEnumeratingWithState:objects:count:>
1010aa930:     	cbz	x0, 0x1010aa9b4 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x40c>
1010aa934:     	mov	x21, x0
1010aa938:     	ldr	x8, [sp, #0x20]
1010aa93c:     	ldr	x22, [x8]
1010aa940:     	b	0x1010aa960 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x3b8>
1010aa944:     	add	x2, sp, #0x10
1010aa948:     	add	x3, sp, #0xa0
1010aa94c:     	mov	x0, x19
1010aa950:     	mov	w4, #0x10               ; =16
1010aa954:     	bl	0x104b77d40 <_objc_msgSend$countByEnumeratingWithState:objects:count:>
1010aa958:     	mov	x21, x0
1010aa95c:     	cbz	x0, 0x1010aa9b4 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x40c>
1010aa960:     	mov	x23, #0x0               ; =0
1010aa964:     	b	0x1010aa974 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x3cc>
1010aa968:     	add	x23, x23, #0x1
1010aa96c:     	cmp	x21, x23
1010aa970:     	b.eq	0x1010aa944 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x39c>
1010aa974:     	ldr	x8, [sp, #0x20]
1010aa978:     	ldr	x8, [x8]
1010aa97c:     	cmp	x8, x22
1010aa980:     	b.eq	0x1010aa98c <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x3e4>
1010aa984:     	mov	x0, x19
1010aa988:     	bl	0x104b761bc <_zlibVersion+0x104b761bc>
1010aa98c:     	ldr	x8, [sp, #0x18]
1010aa990:     	ldr	x9, [x8, x23, lsl #3]
1010aa994:     	ldrsw	x8, [x25, #0xf5c]
1010aa998:     	add	x8, x20, x8
1010aa99c:     	ldr	x10, [x8, #0x8]
1010aa9a0:     	cmp	x10, #0x0
1010aa9a4:     	ccmp	x10, x9, #0x0, ne
1010aa9a8:     	b.ne	0x1010aa968 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x3c0>
1010aa9ac:     	strb	wzr, [x8, #0x18]
1010aa9b0:     	b	0x1010aa968 <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x3c0>
1010aa9b4:     	ldur	x8, [x29, #-0xa0]
1010aa9b8:     	adrp	x9, 0x106369000 <_zlibVersion+0x106369000>
1010aa9bc:     	ldr	x9, [x9, #0x7f8]
1010aa9c0:     	ldr	x9, [x9]
1010aa9c4:     	cmp	x9, x8
1010aa9c8:     	b.ne	0x1010aa9fc <-[GHOSTUIPanGestureRecognizer touchesCancelled:withEvent:]+0x454>
1010aa9cc:     	add	sp, sp, #0x1b0
1010aa9d0:     	ldp	x29, x30, [sp, #0x90]
1010aa9d4:     	ldp	x20, x19, [sp, #0x80]
1010aa9d8:     	ldp	x22, x21, [sp, #0x70]
1010aa9dc:     	ldp	x24, x23, [sp, #0x60]
1010aa9e0:     	ldp	x26, x25, [sp, #0x50]
1010aa9e4:     	ldp	x28, x27, [sp, #0x40]
1010aa9e8:     	ldp	d9, d8, [sp, #0x30]
1010aa9ec:     	ldp	d11, d10, [sp, #0x20]
1010aa9f0:     	ldp	d13, d12, [sp, #0x10]
1010aa9f4:     	ldp	d15, d14, [sp], #0xa0
1010aa9f8:     	ret
1010aa9fc:     	bl	0x104b7534c <_zlibVersion+0x104b7534c>
