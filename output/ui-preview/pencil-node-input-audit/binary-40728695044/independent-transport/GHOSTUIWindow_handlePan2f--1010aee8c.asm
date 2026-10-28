
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010aee8c <-[GHOSTUIWindow handlePan2f:]>:
1010aee8c:     	sub	sp, sp, #0x110
1010aee90:     	stp	d11, d10, [sp, #0xb0]
1010aee94:     	stp	d9, d8, [sp, #0xc0]
1010aee98:     	stp	x28, x27, [sp, #0xd0]
1010aee9c:     	stp	x22, x21, [sp, #0xe0]
1010aeea0:     	stp	x20, x19, [sp, #0xf0]
1010aeea4:     	stp	x29, x30, [sp, #0x100]
1010aeea8:     	add	x29, sp, #0x100
1010aeeac:     	mov	x20, x2
1010aeeb0:     	mov	x19, x0
1010aeeb4:     	mov	x0, x2
1010aeeb8:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010aeebc:     	cmp	x0, #0x1
1010aeec0:     	b.ne	0x1010aeecc <-[GHOSTUIWindow handlePan2f:]+0x40>
1010aeec4:     	mov	x0, x19
1010aeec8:     	bl	0x104b77820 <_objc_msgSend$cancelPointerCapture>
1010aeecc:     	mov	x0, x20
1010aeed0:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010aeed4:     	cmp	x0, #0x1
1010aeed8:     	b.eq	0x1010aeeec <-[GHOSTUIWindow handlePan2f:]+0x60>
1010aeedc:     	mov	x0, x20
1010aeee0:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010aeee4:     	cmp	x0, #0x2
1010aeee8:     	b.ne	0x1010af018 <-[GHOSTUIWindow handlePan2f:]+0x18c>
1010aeeec:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aeef0:     	ldrsw	x22, [x8, #0xf84]
1010aeef4:     	ldr	x2, [x19, x22]
1010aeef8:     	mov	x0, x20
1010aeefc:     	bl	0x104b787a0 <_objc_msgSend$getScaledTranslation:>
1010aef00:     	fmov	d10, d0
1010aef04:     	fmov	d11, d1
1010aef08:     	mov	x0, x20
1010aef0c:     	bl	0x104b78720 <_objc_msgSend$getRelativeTranslation:>
1010aef10:     	fmov	d9, d0
1010aef14:     	fmov	d8, d1
1010aef18:     	mov	x0, x20
1010aef1c:     	fmov	d0, d10
1010aef20:     	fmov	d1, d11
1010aef24:     	bl	0x104b7a0c0 <_objc_msgSend$setCachedTranslation:>
1010aef28:     	fcmp	d9, #0.0
1010aef2c:     	b.ne	0x1010aef38 <-[GHOSTUIWindow handlePan2f:]+0xac>
1010aef30:     	fcmp	d8, #0.0
1010aef34:     	b.eq	0x1010af0e4 <-[GHOSTUIWindow handlePan2f:]+0x258>
1010aef38:     	mov	x21, sp
1010aef3c:     	ldr	x2, [x19, x22]
1010aef40:     	mov	x0, x20
1010aef44:     	bl	0x104b78780 <_objc_msgSend$getScaledTouchPoint:>
1010aef48:     	fmov	d11, d0
1010aef4c:     	fmov	d10, d1
1010aef50:     	bl	0x1010a0738 <__Z29GHOST_IOS_get_flythrough_modev>
1010aef54:     	cbz	w0, 0x1010af074 <-[GHOSTUIWindow handlePan2f:]+0x1e8>
1010aef58:     	mov	x0, x20
1010aef5c:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010aef60:     	cmp	x0, #0x1
1010aef64:     	b.ne	0x1010aefd4 <-[GHOSTUIWindow handlePan2f:]+0x148>
1010aef68:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010aef6c:     	ldrsw	x8, [x8, #0x48]
1010aef70:     	str	d11, [x19, x8]
1010aef74:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010aef78:     	ldrsw	x8, [x8, #0x4c]
1010aef7c:     	str	d10, [x19, x8]
1010aef80:     	adrp	x8, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010aef84:     	add	x8, x8, #0x544
1010aef88:     	ldr	q0, [x8]
1010aef8c:     	stur	q0, [sp, #0x5c]
1010aef90:     	str	wzr, [sp, #0x6c]
1010aef94:     	strb	wzr, [sp, #0x70]
1010aef98:     	movi.16b	v0, #0x0
1010aef9c:     	stur	q0, [sp, #0x78]
1010aefa0:     	stur	q0, [x21, #0x88]
1010aefa4:     	stur	q0, [x21, #0x98]
1010aefa8:     	str	xzr, [sp, #0xa8]
1010aefac:     	stp	d11, d10, [sp, #0x30]
1010aefb0:     	strh	wzr, [sp, #0x58]
1010aefb4:     	stp	xzr, xzr, [sp, #0x48]
1010aefb8:     	str	xzr, [sp, #0x40]
1010aefbc:     	mov	w8, #0x1                ; =1
1010aefc0:     	str	wzr, [sp]
1010aefc4:     	str	w8, [sp, #0x28]
1010aefc8:     	mov	x2, sp
1010aefcc:     	mov	x0, x19
1010aefd0:     	bl	0x104b78620 <_objc_msgSend$generateUserInputEvents:>
1010aefd4:     	adrp	x8, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010aefd8:     	add	x8, x8, #0x544
1010aefdc:     	ldr	q0, [x8]
1010aefe0:     	stur	q0, [sp, #0x5c]
1010aefe4:     	str	wzr, [sp, #0x6c]
1010aefe8:     	strb	wzr, [sp, #0x70]
1010aefec:     	movi.16b	v0, #0x0
1010aeff0:     	stur	q0, [sp, #0x78]
1010aeff4:     	stur	q0, [x21, #0x88]
1010aeff8:     	stur	q0, [x21, #0x98]
1010aeffc:     	str	xzr, [sp, #0xa8]
1010af000:     	stp	d11, d10, [sp, #0x30]
1010af004:     	stp	d9, d8, [sp, #0x40]
1010af008:     	str	xzr, [sp, #0x50]
1010af00c:     	strh	wzr, [sp, #0x58]
1010af010:     	mov	w8, #0x3                ; =3
1010af014:     	b	0x1010af0cc <-[GHOSTUIWindow handlePan2f:]+0x240>
1010af018:     	mov	x0, x20
1010af01c:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af020:     	cmp	x0, #0x3
1010af024:     	b.eq	0x1010af048 <-[GHOSTUIWindow handlePan2f:]+0x1bc>
1010af028:     	mov	x0, x20
1010af02c:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af030:     	cmp	x0, #0x4
1010af034:     	b.eq	0x1010af048 <-[GHOSTUIWindow handlePan2f:]+0x1bc>
1010af038:     	mov	x0, x20
1010af03c:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af040:     	cmp	x0, #0x5
1010af044:     	b.ne	0x1010af0e4 <-[GHOSTUIWindow handlePan2f:]+0x258>
1010af048:     	fmov	d0, xzr
1010af04c:     	fmov	d1, xzr
1010af050:     	mov	x0, x20
1010af054:     	ldp	x29, x30, [sp, #0x100]
1010af058:     	ldp	x20, x19, [sp, #0xf0]
1010af05c:     	ldp	x22, x21, [sp, #0xe0]
1010af060:     	ldp	x28, x27, [sp, #0xd0]
1010af064:     	ldp	d9, d8, [sp, #0xc0]
1010af068:     	ldp	d11, d10, [sp, #0xb0]
1010af06c:     	add	sp, sp, #0x110
1010af070:     	b	0x104b7a0c0 <_objc_msgSend$setCachedTranslation:>
1010af074:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010af078:     	ldrsw	x8, [x8, #0xf9c]
1010af07c:     	ldr	x8, [x19, x8]
1010af080:     	cmp	x8, #0x0
1010af084:     	cset	w8, ne
1010af088:     	strb	wzr, [sp, #0x59]
1010af08c:     	adrp	x9, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010af090:     	add	x9, x9, #0x544
1010af094:     	ldr	q0, [x9]
1010af098:     	stur	q0, [sp, #0x5c]
1010af09c:     	str	wzr, [sp, #0x6c]
1010af0a0:     	strb	wzr, [sp, #0x70]
1010af0a4:     	movi.16b	v0, #0x0
1010af0a8:     	stur	q0, [sp, #0x78]
1010af0ac:     	stur	q0, [x21, #0x88]
1010af0b0:     	stur	q0, [x21, #0x98]
1010af0b4:     	str	xzr, [sp, #0xa8]
1010af0b8:     	stp	d11, d10, [sp, #0x30]
1010af0bc:     	stp	d9, d8, [sp, #0x40]
1010af0c0:     	str	xzr, [sp, #0x50]
1010af0c4:     	strb	w8, [sp, #0x58]
1010af0c8:     	mov	w8, #0x2                ; =2
1010af0cc:     	mov	w9, #0x1                ; =1
1010af0d0:     	str	w8, [sp]
1010af0d4:     	str	w9, [sp, #0x28]
1010af0d8:     	mov	x2, sp
1010af0dc:     	mov	x0, x19
1010af0e0:     	bl	0x104b78620 <_objc_msgSend$generateUserInputEvents:>
1010af0e4:     	ldp	x29, x30, [sp, #0x100]
1010af0e8:     	ldp	x20, x19, [sp, #0xf0]
1010af0ec:     	ldp	x22, x21, [sp, #0xe0]
1010af0f0:     	ldp	x28, x27, [sp, #0xd0]
1010af0f4:     	ldp	d9, d8, [sp, #0xc0]
1010af0f8:     	ldp	d11, d10, [sp, #0xb0]
1010af0fc:     	add	sp, sp, #0x110
1010af100:     	ret
