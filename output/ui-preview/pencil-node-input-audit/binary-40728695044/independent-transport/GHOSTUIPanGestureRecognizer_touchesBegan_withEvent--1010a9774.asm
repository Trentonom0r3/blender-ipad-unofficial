
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010a9774 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]>:
1010a9774:     	stp	d13, d12, [sp, #-0x90]!
1010a9778:     	stp	d11, d10, [sp, #0x10]
1010a977c:     	stp	d9, d8, [sp, #0x20]
1010a9780:     	stp	x28, x27, [sp, #0x30]
1010a9784:     	stp	x26, x25, [sp, #0x40]
1010a9788:     	stp	x24, x23, [sp, #0x50]
1010a978c:     	stp	x22, x21, [sp, #0x60]
1010a9790:     	stp	x20, x19, [sp, #0x70]
1010a9794:     	stp	x29, x30, [sp, #0x80]
1010a9798:     	add	x29, sp, #0x80
1010a979c:     	sub	sp, sp, #0x3c0
1010a97a0:     	str	x3, [sp, #0x8]
1010a97a4:     	mov	x26, x2
1010a97a8:     	mov	x21, x0
1010a97ac:     	adrp	x8, 0x106369000 <_zlibVersion+0x106369000>
1010a97b0:     	ldr	x8, [x8, #0x7f8]
1010a97b4:     	ldr	x8, [x8]
1010a97b8:     	stur	x8, [x29, #-0x90]
1010a97bc:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010a97c0:     	ldrsw	x8, [x8, #0xf58]
1010a97c4:     	ldrb	w9, [x0, x8]
1010a97c8:     	tbnz	w9, #0x0, 0x1010a9d64 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x5f0>
1010a97cc:     	mov	w9, #0x1                ; =1
1010a97d0:     	strh	w9, [x21, x8]
1010a97d4:     	mov	x0, x21
1010a97d8:     	bl	0x104b784c0 <_objc_msgSend$forgetKnifePanContact>
1010a97dc:     	mov	x0, x26
1010a97e0:     	bl	0x104b77d20 <_objc_msgSend$count>
1010a97e4:     	cmp	x0, #0x1
1010a97e8:     	str	x26, [sp, #0x38]
1010a97ec:     	b.ne	0x1010a9a08 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x294>
1010a97f0:     	movi.16b	v0, #0x0
1010a97f4:     	stp	q0, q0, [sp, #0x290]
1010a97f8:     	stp	q0, q0, [sp, #0x270]
1010a97fc:     	add	x2, sp, #0x270
1010a9800:     	add	x3, sp, #0x330
1010a9804:     	mov	x0, x26
1010a9808:     	mov	w4, #0x10               ; =16
1010a980c:     	bl	0x104b77d40 <_objc_msgSend$countByEnumeratingWithState:objects:count:>
1010a9810:     	cbz	x0, 0x1010a9a08 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x294>
1010a9814:     	mov	x22, x0
1010a9818:     	ldr	x8, [sp, #0x280]
1010a981c:     	ldr	x19, [x8]
1010a9820:     	add	x27, sp, #0x50
1010a9824:     	fmov	d11, #1.00000000
1010a9828:     	fmov	d12, xzr
1010a982c:     	b	0x1010a984c <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0xd8>
1010a9830:     	add	x2, sp, #0x270
1010a9834:     	add	x3, sp, #0x330
1010a9838:     	mov	x0, x26
1010a983c:     	mov	w4, #0x10               ; =16
1010a9840:     	bl	0x104b77d40 <_objc_msgSend$countByEnumeratingWithState:objects:count:>
1010a9844:     	mov	x22, x0
1010a9848:     	cbz	x0, 0x1010a9a08 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x294>
1010a984c:     	mov	x20, #0x0               ; =0
1010a9850:     	b	0x1010a988c <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x118>
1010a9854:     	mov	x0, x21
1010a9858:     	bl	0x104b7c2c0 <_objc_msgSend$view>
1010a985c:     	mov	w24, #0x0               ; =0
1010a9860:     	strb	wzr, [sp, #0x50]
1010a9864:     	stur	xzr, [x27, #0x4]
1010a9868:     	stur	xzr, [x27, #0x9]
1010a986c:     	add	x0, x21, x28
1010a9870:     	add	x3, sp, #0x50
1010a9874:     	mov	x1, x24
1010a9878:     	mov	x2, x23
1010a987c:     	bl	0x1010a7d90 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE>
1010a9880:     	add	x20, x20, #0x1
1010a9884:     	cmp	x22, x20
1010a9888:     	b.eq	0x1010a9830 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0xbc>
1010a988c:     	ldr	x8, [sp, #0x280]
1010a9890:     	ldr	x8, [x8]
1010a9894:     	cmp	x8, x19
1010a9898:     	b.eq	0x1010a98a4 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x130>
1010a989c:     	mov	x0, x26
1010a98a0:     	bl	0x104b761bc <_zlibVersion+0x104b761bc>
1010a98a4:     	ldr	x8, [sp, #0x278]
1010a98a8:     	ldr	x23, [x8, x20, lsl #3]
1010a98ac:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010a98b0:     	ldrsw	x28, [x8, #0xf5c]
1010a98b4:     	cbz	x23, 0x1010a9854 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0xe0>
1010a98b8:     	mov	x0, x23
1010a98bc:     	bl	0x104b7c180 <_objc_msgSend$type>
1010a98c0:     	cmp	x0, #0x4
1010a98c4:     	b.hs	0x1010a98d8 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x164>
1010a98c8:     	adrp	x8, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010a98cc:     	add	x8, x8, #0x4f0
1010a98d0:     	ldr	w24, [x8, x0, lsl #2]
1010a98d4:     	b	0x1010a98dc <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x168>
1010a98d8:     	mov	w24, #0x0               ; =0
1010a98dc:     	mov	x0, x21
1010a98e0:     	bl	0x104b7c2c0 <_objc_msgSend$view>
1010a98e4:     	mov	x25, x0
1010a98e8:     	mov	x0, x23
1010a98ec:     	bl	0x104b7c180 <_objc_msgSend$type>
1010a98f0:     	cbz	x25, 0x1010a9860 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0xec>
1010a98f4:     	cmp	x0, #0x2
1010a98f8:     	b.ne	0x1010a9860 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0xec>
1010a98fc:     	mov	x0, x23
1010a9900:     	bl	0x104b784a0 <_objc_msgSend$force>
1010a9904:     	fmov	d8, d0
1010a9908:     	fmov	x27, d8
1010a990c:     	mov	x0, x23
1010a9910:     	bl	0x104b79060 <_objc_msgSend$maximumPossibleForce>
1010a9914:     	fmov	d10, d0
1010a9918:     	fmov	x26, d10
1010a991c:     	mov	x0, x23
1010a9920:     	mov	x2, x25
1010a9924:     	bl	0x104b774e0 <_objc_msgSend$azimuthAngleInView:>
1010a9928:     	fmov	d9, d0
1010a992c:     	fmov	x25, d9
1010a9930:     	mov	x0, x23
1010a9934:     	bl	0x104b773a0 <_objc_msgSend$altitudeAngle>
1010a9938:     	fmov	x8, d0
1010a993c:     	and	x9, x27, #0x7fffffffffffffff
1010a9940:     	and	x10, x26, #0x7fffffffffffffff
1010a9944:     	mov	x12, #0x7ff0000000000000 ; =9218868437227405312
1010a9948:     	cmp	x10, x12
1010a994c:     	cset	w10, lt
1010a9950:     	and	x11, x25, #0x7fffffffffffffff
1010a9954:     	cmp	x11, x12
1010a9958:     	cset	w11, lt
1010a995c:     	and	x8, x8, #0x7fffffffffffffff
1010a9960:     	cmp	x8, x12
1010a9964:     	cset	w8, lt
1010a9968:     	mov	x12, #0x7fefffffffffffff ; =9218868437227405311
1010a996c:     	cmp	x9, x12
1010a9970:     	ccmp	w10, #0x0, #0x4, le
1010a9974:     	ccmp	w11, #0x0, #0x4, ne
1010a9978:     	ccmp	w8, #0x0, #0x4, ne
1010a997c:     	b.ne	0x1010a9994 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x220>
1010a9980:     	mov	w8, #0x0                ; =0
1010a9984:     	mov	w25, #0x0               ; =0
1010a9988:     	movi	d0, #0000000000000000
1010a998c:     	fmov	s10, wzr
1010a9990:     	b	0x1010a99ec <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x278>
1010a9994:     	fcmp	d10, #0.0
1010a9998:     	cset	w25, gt
1010a999c:     	fdiv	d1, d8, d10
1010a99a0:     	fcsel	d1, d1, d11, gt
1010a99a4:     	fcmp	d1, d11
1010a99a8:     	fcsel	d2, d11, d1, gt
1010a99ac:     	fcmp	d1, #0.0
1010a99b0:     	fcsel	d1, d12, d2, mi
1010a99b4:     	fcvt	s10, d1
1010a99b8:     	fmov	d8, d0
1010a99bc:     	fmov	d0, d9
1010a99c0:     	bl	0x104b7531c <_zlibVersion+0x104b7531c>
1010a99c4:     	str	q0, [sp, #0x20]
1010a99c8:     	fmov	d9, d1
1010a99cc:     	fmov	d0, d8
1010a99d0:     	bl	0x104b75634 <_zlibVersion+0x104b75634>
1010a99d4:     	fneg	d1, d9
1010a99d8:     	ldr	q2, [sp, #0x20]
1010a99dc:     	mov.d	v2[1], v1[0]
1010a99e0:     	fmul.2d	v0, v2, v0[0]
1010a99e4:     	fcvtn	v0.2s, v0.2d
1010a99e8:     	mov	w8, #0x1                ; =1
1010a99ec:     	ldr	x26, [sp, #0x38]
1010a99f0:     	add	x27, sp, #0x50
1010a99f4:     	strb	w8, [sp, #0x50]
1010a99f8:     	str	s10, [sp, #0x54]
1010a99fc:     	str	d0, [sp, #0x58]
1010a9a00:     	strb	w25, [sp, #0x60]
1010a9a04:     	b	0x1010a986c <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0xf8>
1010a9a08:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010a9a0c:     	ldrsw	x19, [x8, #0xf48]
1010a9a10:     	ldr	x22, [x21, x19]
1010a9a14:     	mov	x0, x21
1010a9a18:     	bl	0x104b7c2c0 <_objc_msgSend$view>
1010a9a1c:     	mov	x1, x0
1010a9a20:     	add	x8, sp, #0x50
1010a9a24:     	mov	x0, x22
1010a9a28:     	mov	x2, x26
1010a9a2c:     	bl	0x1010a7f3c <__ZL25ios_ring_contact_at_startP15GHOST_WindowIOSP6UIViewP5NSSetIP7UITouchE>
1010a9a30:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010a9a34:     	ldrsw	x8, [x8, #0xf4c]
1010a9a38:     	add	x9, x21, x8
1010a9a3c:     	ldp	q0, q1, [sp, #0x50]
1010a9a40:     	stp	q0, q1, [x9]
1010a9a44:     	ldrh	w8, [sp, #0x70]
1010a9a48:     	strh	w8, [x9, #0x20]
1010a9a4c:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010a9a50:     	ldrsw	x8, [x8, #0xf50]
1010a9a54:     	add	x28, x21, x8
1010a9a58:     	stp	xzr, xzr, [x28, #0x8]
1010a9a5c:     	str	xzr, [x28]
1010a9a60:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010a9a64:     	ldrsw	x8, [x8, #0xf54]
1010a9a68:     	add	x8, x21, x8
1010a9a6c:     	movi.16b	v0, #0x0
1010a9a70:     	stp	q0, q0, [x8]
1010a9a74:     	stp	x8, x9, [sp, #0x10]
1010a9a78:     	str	x19, [sp, #0x20]
1010a9a7c:     	ldr	x8, [x21, x19]
1010a9a80:     	cbz	x8, 0x1010a9d64 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x5f0>
1010a9a84:     	mov	x0, x21
1010a9a88:     	bl	0x104b7c2c0 <_objc_msgSend$view>
1010a9a8c:     	ldr	x8, [sp, #0x20]
1010a9a90:     	ldr	x8, [x21, x8]
1010a9a94:     	ldr	x8, [x8, #0xa8]
1010a9a98:     	cmp	x0, x8
1010a9a9c:     	b.ne	0x1010a9d64 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x5f0>
1010a9aa0:     	mov	x0, x26
1010a9aa4:     	bl	0x104b77d20 <_objc_msgSend$count>
1010a9aa8:     	cmp	x0, #0x1
1010a9aac:     	b.ne	0x1010a9d64 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x5f0>
1010a9ab0:     	movi.16b	v0, #0x0
1010a9ab4:     	stp	q0, q0, [sp, #0x250]
1010a9ab8:     	stp	q0, q0, [sp, #0x230]
1010a9abc:     	add	x2, sp, #0x230
1010a9ac0:     	add	x3, sp, #0x2b0
1010a9ac4:     	mov	x0, x26
1010a9ac8:     	mov	w4, #0x10               ; =16
1010a9acc:     	bl	0x104b77d40 <_objc_msgSend$countByEnumeratingWithState:objects:count:>
1010a9ad0:     	cbz	x0, 0x1010a9d64 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x5f0>
1010a9ad4:     	mov	x22, x0
1010a9ad8:     	ldr	x8, [sp, #0x240]
1010a9adc:     	adrp	x19, 0x106627000 <_zlibVersion+0x106627000>
1010a9ae0:     	ldr	x27, [x8]
1010a9ae4:     	b	0x1010a9b08 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x394>
1010a9ae8:     	add	x2, sp, #0x230
1010a9aec:     	add	x3, sp, #0x2b0
1010a9af0:     	ldr	x26, [sp, #0x38]
1010a9af4:     	mov	x0, x26
1010a9af8:     	mov	w4, #0x10               ; =16
1010a9afc:     	bl	0x104b77d40 <_objc_msgSend$countByEnumeratingWithState:objects:count:>
1010a9b00:     	mov	x22, x0
1010a9b04:     	cbz	x0, 0x1010a9d64 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x5f0>
1010a9b08:     	mov	x26, #0x0               ; =0
1010a9b0c:     	b	0x1010a9b28 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x3b4>
1010a9b10:     	mov	x0, x25
1010a9b14:     	bl	0x104b7c180 <_objc_msgSend$type>
1010a9b18:     	cbz	x0, 0x1010a9b58 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x3e4>
1010a9b1c:     	add	x26, x26, #0x1
1010a9b20:     	cmp	x22, x26
1010a9b24:     	b.eq	0x1010a9ae8 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x374>
1010a9b28:     	ldr	x8, [sp, #0x240]
1010a9b2c:     	ldr	x8, [x8]
1010a9b30:     	cmp	x8, x27
1010a9b34:     	b.eq	0x1010a9b40 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x3cc>
1010a9b38:     	ldr	x0, [sp, #0x38]
1010a9b3c:     	bl	0x104b761bc <_zlibVersion+0x104b761bc>
1010a9b40:     	ldr	x8, [sp, #0x238]
1010a9b44:     	ldr	x25, [x8, x26, lsl #3]
1010a9b48:     	mov	x0, x25
1010a9b4c:     	bl	0x104b7c180 <_objc_msgSend$type>
1010a9b50:     	cmp	x0, #0x2
1010a9b54:     	b.ne	0x1010a9b10 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x39c>
1010a9b58:     	mov	x0, x21
1010a9b5c:     	bl	0x104b7c2c0 <_objc_msgSend$view>
1010a9b60:     	mov	x2, x0
1010a9b64:     	mov	x0, x25
1010a9b68:     	bl	0x104b78f60 <_objc_msgSend$locationInView:>
1010a9b6c:     	fmov	d8, d0
1010a9b70:     	fmov	d9, d1
1010a9b74:     	ldr	x0, [x19, #0xbe0]
1010a9b78:     	bl	0x104b78fc0 <_objc_msgSend$mainScreen>
1010a9b7c:     	bl	0x104b79ca0 <_objc_msgSend$scale>
1010a9b80:     	fcvt	s0, d0
1010a9b84:     	fcvt	d0, s0
1010a9b88:     	fmul	d10, d8, d0
1010a9b8c:     	ldr	x0, [x19, #0xbe0]
1010a9b90:     	bl	0x104b78fc0 <_objc_msgSend$mainScreen>
1010a9b94:     	bl	0x104b79ca0 <_objc_msgSend$scale>
1010a9b98:     	fcvt	s0, d0
1010a9b9c:     	fcvt	d0, s0
1010a9ba0:     	fmul	d11, d9, d0
1010a9ba4:     	ldr	x8, [sp, #0x20]
1010a9ba8:     	ldr	x0, [x21, x8]
1010a9bac:     	fcvtzs	w23, d10
1010a9bb0:     	fcvtzs	w24, d11
1010a9bb4:     	add	x8, sp, #0x50
1010a9bb8:     	mov	x1, x23
1010a9bbc:     	mov	x2, x24
1010a9bc0:     	bl	0x1010a823c <__ZN5ghost3ios20hud_contact_at_startEPKvii>
1010a9bc4:     	ldr	q0, [sp, #0x50]
1010a9bc8:     	str	q0, [x28]
1010a9bcc:     	ldr	x8, [sp, #0x60]
1010a9bd0:     	str	x8, [x28, #0x10]
1010a9bd4:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010a9bd8:     	ldrsw	x8, [x8, #0xf5c]
1010a9bdc:     	add	x20, x21, x8
1010a9be0:     	ldr	w8, [x20]
1010a9be4:     	cmp	w8, #0x2
1010a9be8:     	b.ne	0x1010a9c28 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x4b4>
1010a9bec:     	ldr	x8, [sp, #0x18]
1010a9bf0:     	ldrb	w8, [x8, #0x20]
1010a9bf4:     	tbnz	w8, #0x0, 0x1010a9c28 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x4b4>
1010a9bf8:     	ldr	x8, [x28]
1010a9bfc:     	cbnz	x8, 0x1010a9c28 <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x4b4>
1010a9c00:     	ldr	x8, [sp, #0x20]
1010a9c04:     	ldr	x0, [x21, x8]
1010a9c08:     	ldr	x3, [x20, #0x10]
1010a9c0c:     	add	x8, sp, #0x50
1010a9c10:     	mov	x1, x23
1010a9c14:     	mov	x2, x24
1010a9c18:     	bl	0x1010a869c <__ZN5ghost3ios21pencil_paint_at_startEPKviiy>
1010a9c1c:     	ldp	q0, q1, [sp, #0x50]
1010a9c20:     	ldr	x8, [sp, #0x10]
1010a9c24:     	stp	q0, q1, [x8]
1010a9c28:     	ldrb	w8, [x20, #0x18]
1010a9c2c:     	cmp	w8, #0x1
1010a9c30:     	b.ne	0x1010a9b1c <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x3a8>
1010a9c34:     	ldr	x8, [x20, #0x8]
1010a9c38:     	cbz	x8, 0x1010a9b1c <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x3a8>
1010a9c3c:     	ldr	w9, [x20]
1010a9c40:     	cmp	w9, #0x2
1010a9c44:     	b.ne	0x1010a9b1c <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x3a8>
1010a9c48:     	cmp	x8, x25
1010a9c4c:     	b.ne	0x1010a9b1c <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x3a8>
1010a9c50:     	mov	x0, x25
1010a9c54:     	bl	0x104b7c180 <_objc_msgSend$type>
1010a9c58:     	cmp	x0, #0x2
1010a9c5c:     	b.ne	0x1010a9b1c <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x3a8>
1010a9c60:     	mov	x0, x25
1010a9c64:     	bl	0x104b7c2c0 <_objc_msgSend$view>
1010a9c68:     	mov	x25, x0
1010a9c6c:     	mov	x0, x21
1010a9c70:     	bl	0x104b7c2c0 <_objc_msgSend$view>
1010a9c74:     	cmp	x25, x0
1010a9c78:     	b.ne	0x1010a9b1c <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x3a8>
1010a9c7c:     	ldr	x8, [sp, #0x18]
1010a9c80:     	ldrb	w8, [x8, #0x20]
1010a9c84:     	tbnz	w8, #0x0, 0x1010a9b1c <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x3a8>
1010a9c88:     	ldr	x10, [x28]
1010a9c8c:     	fmov	x8, d8
1010a9c90:     	and	x8, x8, #0x7fffffffffffffff
1010a9c94:     	mov	x11, #0x7ff0000000000000 ; =9218868437227405312
1010a9c98:     	cmp	x8, x11
1010a9c9c:     	cset	w8, lt
1010a9ca0:     	fmov	x9, d9
1010a9ca4:     	and	x9, x9, #0x7fffffffffffffff
1010a9ca8:     	cmp	x9, x11
1010a9cac:     	cset	w9, lt
1010a9cb0:     	cbnz	x10, 0x1010a9b1c <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x3a8>
1010a9cb4:     	cbz	w8, 0x1010a9b1c <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x3a8>
1010a9cb8:     	cbz	w9, 0x1010a9b1c <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x3a8>
1010a9cbc:     	mov	x0, x21
1010a9cc0:     	bl	0x104b7c2c0 <_objc_msgSend$view>
1010a9cc4:     	bl	0x104b776a0 <_objc_msgSend$bounds>
1010a9cc8:     	fmov	d4, d8
1010a9ccc:     	fmov	d5, d9
1010a9cd0:     	bl	0x104b72b5c <_zlibVersion+0x104b72b5c>
1010a9cd4:     	fmov	x8, d10
1010a9cd8:     	and	x8, x8, #0x7fffffffffffffff
1010a9cdc:     	mov	x10, #0x7ff0000000000000 ; =9218868437227405312
1010a9ce0:     	cmp	x8, x10
1010a9ce4:     	cset	w8, lt
1010a9ce8:     	fmov	x9, d11
1010a9cec:     	and	x9, x9, #0x7fffffffffffffff
1010a9cf0:     	cmp	x9, x10
1010a9cf4:     	cset	w9, lt
1010a9cf8:     	mov	x10, #0xffffffc00000    ; =281474972516352
1010a9cfc:     	movk	x10, #0x41df, lsl #48
1010a9d00:     	fmov	d0, x10
1010a9d04:     	fcmp	d11, d0
1010a9d08:     	mov	x10, #-0x3e20000000000000 ; =-4476578029606273024
1010a9d0c:     	fmov	d1, x10
1010a9d10:     	fccmp	d11, d1, #0x8, ls
1010a9d14:     	ccmp	w9, #0x0, #0x4, ge
1010a9d18:     	ccmp	w0, #0x0, #0x4, ne
1010a9d1c:     	ccmp	w8, #0x0, #0x4, ne
1010a9d20:     	fccmp	d10, d1, #0x8, ne
1010a9d24:     	fccmp	d10, d0, #0x2, ge
1010a9d28:     	b.hi	0x1010a9b1c <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x3a8>
1010a9d2c:     	ldr	x8, [sp, #0x20]
1010a9d30:     	ldr	x0, [x21, x8]
1010a9d34:     	ldr	x3, [x20, #0x10]
1010a9d38:     	add	x8, sp, #0x50
1010a9d3c:     	mov	x1, x23
1010a9d40:     	mov	x2, x24
1010a9d44:     	bl	0x1010a7218 <__ZN5ghost3ios25pencil_knife_pan_at_startEPKviiy>
1010a9d48:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010a9d4c:     	ldrsw	x8, [x8, #0xf60]
1010a9d50:     	add	x0, x21, x8
1010a9d54:     	add	x1, sp, #0x50
1010a9d58:     	mov	w2, #0x1d9              ; =473
1010a9d5c:     	bl	0x104b76060 <_zlibVersion+0x104b76060>
1010a9d60:     	b	0x1010a9b1c <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x3a8>
1010a9d64:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010a9d68:     	ldr	x8, [x8, #0xdf8]
1010a9d6c:     	stp	x21, x8, [sp, #0x40]
1010a9d70:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010a9d74:     	ldr	x1, [x8, #0xa60]
1010a9d78:     	add	x0, sp, #0x40
1010a9d7c:     	mov	x2, x26
1010a9d80:     	ldr	x3, [sp, #0x8]
1010a9d84:     	bl	0x104b761c8 <_zlibVersion+0x104b761c8>
1010a9d88:     	ldur	x8, [x29, #-0x90]
1010a9d8c:     	adrp	x9, 0x106369000 <_zlibVersion+0x106369000>
1010a9d90:     	ldr	x9, [x9, #0x7f8]
1010a9d94:     	ldr	x9, [x9]
1010a9d98:     	cmp	x9, x8
1010a9d9c:     	b.ne	0x1010a9dcc <-[GHOSTUIPanGestureRecognizer touchesBegan:withEvent:]+0x658>
1010a9da0:     	add	sp, sp, #0x3c0
1010a9da4:     	ldp	x29, x30, [sp, #0x80]
1010a9da8:     	ldp	x20, x19, [sp, #0x70]
1010a9dac:     	ldp	x22, x21, [sp, #0x60]
1010a9db0:     	ldp	x24, x23, [sp, #0x50]
1010a9db4:     	ldp	x26, x25, [sp, #0x40]
1010a9db8:     	ldp	x28, x27, [sp, #0x30]
1010a9dbc:     	ldp	d9, d8, [sp, #0x20]
1010a9dc0:     	ldp	d11, d10, [sp, #0x10]
1010a9dc4:     	ldp	d13, d12, [sp], #0x90
1010a9dc8:     	ret
1010a9dcc:     	bl	0x104b7534c <_zlibVersion+0x104b7534c>
