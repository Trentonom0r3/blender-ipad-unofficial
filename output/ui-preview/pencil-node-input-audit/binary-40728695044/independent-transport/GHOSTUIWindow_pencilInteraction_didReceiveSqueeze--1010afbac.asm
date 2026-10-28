
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010afbac <-[GHOSTUIWindow pencilInteraction:didReceiveSqueeze:]>:
1010afbac:     	sub	sp, sp, #0xe0
1010afbb0:     	stp	x22, x21, [sp, #0xb0]
1010afbb4:     	stp	x20, x19, [sp, #0xc0]
1010afbb8:     	stp	x29, x30, [sp, #0xd0]
1010afbbc:     	add	x29, sp, #0xd0
1010afbc0:     	mov	x20, x3
1010afbc4:     	mov	x19, x0
1010afbc8:     	mov	w0, #0x2                ; =2
1010afbcc:     	mov	w1, #0x11               ; =17
1010afbd0:     	mov	w2, #0x5                ; =5
1010afbd4:     	mov	w3, #0x0                ; =0
1010afbd8:     	bl	0x104a509c8 <___isPlatformVersionAtLeast>
1010afbdc:     	cbz	w0, 0x1010afd64 <-[GHOSTUIWindow pencilInteraction:didReceiveSqueeze:]+0x1b8>
1010afbe0:     	mov	x0, x20
1010afbe4:     	bl	0x104b796e0 <_objc_msgSend$phase>
1010afbe8:     	cmp	x0, #0x2
1010afbec:     	b.ne	0x1010afd64 <-[GHOSTUIWindow pencilInteraction:didReceiveSqueeze:]+0x1b8>
1010afbf0:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010afbf4:     	ldr	x0, [x8, #0xce0]
1010afbf8:     	bl	0x104b79780 <_objc_msgSend$preferredSqueezeAction>
1010afbfc:     	cbz	x0, 0x1010afd64 <-[GHOSTUIWindow pencilInteraction:didReceiveSqueeze:]+0x1b8>
1010afc00:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010afc04:     	ldrsw	x8, [x8, #0xf9c]
1010afc08:     	ldr	x8, [x19, x8]
1010afc0c:     	cbnz	x8, 0x1010afd64 <-[GHOSTUIWindow pencilInteraction:didReceiveSqueeze:]+0x1b8>
1010afc10:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010afc14:     	ldrsw	x8, [x8, #0xf78]
1010afc18:     	ldr	x0, [x19, x8]
1010afc1c:     	bl	0x104b79680 <_objc_msgSend$pencilContactDown>
1010afc20:     	tbnz	w0, #0x0, 0x1010afd64 <-[GHOSTUIWindow pencilInteraction:didReceiveSqueeze:]+0x1b8>
1010afc24:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010afc28:     	ldrsw	x8, [x8, #0x2c]
1010afc2c:     	ldrb	w8, [x19, x8]
1010afc30:     	tbnz	w8, #0x0, 0x1010afd64 <-[GHOSTUIWindow pencilInteraction:didReceiveSqueeze:]+0x1b8>
1010afc34:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010afc38:     	ldrsw	x8, [x8, #0x30]
1010afc3c:     	ldrb	w8, [x19, x8]
1010afc40:     	tbnz	w8, #0x0, 0x1010afd64 <-[GHOSTUIWindow pencilInteraction:didReceiveSqueeze:]+0x1b8>
1010afc44:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010afc48:     	ldrsw	x8, [x8, #0x34]
1010afc4c:     	ldrb	w8, [x19, x8]
1010afc50:     	tbnz	w8, #0x0, 0x1010afd64 <-[GHOSTUIWindow pencilInteraction:didReceiveSqueeze:]+0x1b8>
1010afc54:     	mov	x20, sp
1010afc58:     	mov	x0, x19
1010afc5c:     	bl	0x104b77820 <_objc_msgSend$cancelPointerCapture>
1010afc60:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010afc64:     	ldrsw	x21, [x8, #0x1c]
1010afc68:     	ldr	x8, [x19, x21]
1010afc6c:     	cbz	x8, 0x1010afcf4 <-[GHOSTUIWindow pencilInteraction:didReceiveSqueeze:]+0x148>
1010afc70:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010afc74:     	ldrsw	x8, [x8, #0xf80]
1010afc78:     	ldr	x0, [x19, x8]
1010afc7c:     	ldr	x8, [x0]
1010afc80:     	ldr	x8, [x8, #0x10]
1010afc84:     	blr	x8
1010afc88:     	ldr	x8, [x19, x21]
1010afc8c:     	sub	x8, x0, x8
1010afc90:     	lsr	x8, x8, #4
1010afc94:     	cmp	x8, #0x752
1010afc98:     	b.hi	0x1010afcf4 <-[GHOSTUIWindow pencilInteraction:didReceiveSqueeze:]+0x148>
1010afc9c:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010afca0:     	ldrsw	x8, [x8, #0x18]
1010afca4:     	adrp	x9, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010afca8:     	add	x9, x9, #0x544
1010afcac:     	ldr	q0, [x9]
1010afcb0:     	stur	q0, [sp, #0x5c]
1010afcb4:     	str	wzr, [sp, #0x6c]
1010afcb8:     	strb	wzr, [sp, #0x70]
1010afcbc:     	movi.16b	v0, #0x0
1010afcc0:     	stur	q0, [sp, #0x78]
1010afcc4:     	stur	q0, [x20, #0x88]
1010afcc8:     	stur	q0, [x20, #0x98]
1010afccc:     	str	xzr, [sp, #0xa8]
1010afcd0:     	ldr	q0, [x19, x8]
1010afcd4:     	str	q0, [sp, #0x30]
1010afcd8:     	stp	xzr, xzr, [sp, #0x48]
1010afcdc:     	str	xzr, [sp, #0x40]
1010afce0:     	mov	w8, #0x1                ; =1
1010afce4:     	strh	w8, [sp, #0x58]
1010afce8:     	str	wzr, [sp, #0x28]
1010afcec:     	str	wzr, [sp]
1010afcf0:     	b	0x1010afd3c <-[GHOSTUIWindow pencilInteraction:didReceiveSqueeze:]+0x190>
1010afcf4:     	mov	w8, #0x0                ; =0
1010afcf8:     	adrp	x9, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010afcfc:     	add	x9, x9, #0x544
1010afd00:     	ldr	q0, [x9]
1010afd04:     	stur	q0, [sp, #0x5c]
1010afd08:     	str	wzr, [sp, #0x6c]
1010afd0c:     	strb	wzr, [sp, #0x70]
1010afd10:     	movi.16b	v0, #0x0
1010afd14:     	stur	q0, [sp, #0x78]
1010afd18:     	stur	q0, [x20, #0x88]
1010afd1c:     	stur	q0, [x20, #0x98]
1010afd20:     	str	xzr, [sp, #0xa8]
1010afd24:     	fmov.2d	v0, #-1.00000000
1010afd28:     	str	q0, [sp, #0x30]
1010afd2c:     	stp	xzr, xzr, [sp, #0x48]
1010afd30:     	str	xzr, [sp, #0x40]
1010afd34:     	mov	w9, #0x1                ; =1
1010afd38:     	strh	w9, [sp, #0x58]
1010afd3c:     	mov	w9, w8
1010afd40:     	mov	x10, sp
1010afd44:     	orr	x9, x10, x9, lsl #2
1010afd48:     	mov	w10, #0x8               ; =8
1010afd4c:     	str	w10, [x9]
1010afd50:     	add	w8, w8, #0x1
1010afd54:     	str	w8, [sp, #0x28]
1010afd58:     	mov	x2, sp
1010afd5c:     	mov	x0, x19
1010afd60:     	bl	0x104b78620 <_objc_msgSend$generateUserInputEvents:>
1010afd64:     	ldp	x29, x30, [sp, #0xd0]
1010afd68:     	ldp	x20, x19, [sp, #0xc0]
1010afd6c:     	ldp	x22, x21, [sp, #0xb0]
1010afd70:     	add	sp, sp, #0xe0
1010afd74:     	ret
