
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010ada64 <-[GHOSTUIWindow cancelPointerCapture]>:
1010ada64:     	sub	sp, sp, #0x110
1010ada68:     	stp	d9, d8, [sp, #0xb0]
1010ada6c:     	stp	x26, x25, [sp, #0xc0]
1010ada70:     	stp	x24, x23, [sp, #0xd0]
1010ada74:     	stp	x22, x21, [sp, #0xe0]
1010ada78:     	stp	x20, x19, [sp, #0xf0]
1010ada7c:     	stp	x29, x30, [sp, #0x100]
1010ada80:     	add	x29, sp, #0x100
1010ada84:     	mov	x19, x0
1010ada88:     	bl	0x104b77840 <_objc_msgSend$cancelRingHover>
1010ada8c:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ada90:     	ldrsw	x8, [x8, #0x10]
1010ada94:     	ldrb	w8, [x19, x8]
1010ada98:     	cmp	w8, #0x1
1010ada9c:     	b.ne	0x1010adb14 <-[GHOSTUIWindow cancelPointerCapture]+0xb0>
1010adaa0:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010adaa4:     	ldrsw	x8, [x8, #0x20]
1010adaa8:     	strb	wzr, [sp, #0x70]
1010adaac:     	str	wzr, [sp, #0x6c]
1010adab0:     	stp	xzr, xzr, [sp, #0x80]
1010adab4:     	ldr	q0, [x19, x8]
1010adab8:     	str	xzr, [sp, #0x78]
1010adabc:     	str	q0, [sp, #0x30]
1010adac0:     	stp	xzr, xzr, [sp, #0x48]
1010adac4:     	str	xzr, [sp, #0x40]
1010adac8:     	mov	w8, #0x101              ; =257
1010adacc:     	strh	w8, [sp, #0x58]
1010adad0:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010adad4:     	ldrsw	x8, [x8, #0x24]
1010adad8:     	ldr	q0, [x19, x8]
1010adadc:     	stur	q0, [sp, #0x5c]
1010adae0:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010adae4:     	ldrsw	x8, [x8, #0x28]
1010adae8:     	add	x8, x19, x8
1010adaec:     	ldp	q0, q1, [x8]
1010adaf0:     	stp	q0, q1, [sp, #0x90]
1010adaf4:     	mov	w8, #0x1                ; =1
1010adaf8:     	strb	w8, [sp, #0x6e]
1010adafc:     	mov	w9, #0x6                ; =6
1010adb00:     	str	w9, [sp]
1010adb04:     	str	w8, [sp, #0x28]
1010adb08:     	mov	x2, sp
1010adb0c:     	mov	x0, x19
1010adb10:     	bl	0x104b78620 <_objc_msgSend$generateUserInputEvents:>
1010adb14:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010adb18:     	ldrsw	x8, [x8, #0xfdc]
1010adb1c:     	ldr	x0, [x19, x8]
1010adb20:     	bl	0x104b78b80 <_objc_msgSend$invalidateTouchStream>
1010adb24:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010adb28:     	ldrsw	x8, [x8, #0xf78]
1010adb2c:     	ldr	x0, [x19, x8]
1010adb30:     	bl	0x104b78b80 <_objc_msgSend$invalidateTouchStream>
1010adb34:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010adb38:     	ldrsw	x8, [x8, #0x44]
1010adb3c:     	add	x8, x19, x8
1010adb40:     	ldrb	w9, [x8, #0x20]
1010adb44:     	cmp	w9, #0x1
1010adb48:     	b.ne	0x1010adc10 <-[GHOSTUIWindow cancelPointerCapture]+0x1ac>
1010adb4c:     	ldrb	w9, [x8, #0x21]
1010adb50:     	tbnz	w9, #0x0, 0x1010adc10 <-[GHOSTUIWindow cancelPointerCapture]+0x1ac>
1010adb54:     	mov	w9, #0x100              ; =256
1010adb58:     	strh	w9, [x8, #0x20]
1010adb5c:     	ldr	x23, [x8]
1010adb60:     	cbz	x23, 0x1010adc10 <-[GHOSTUIWindow cancelPointerCapture]+0x1ac>
1010adb64:     	ldr	x22, [x8, #0x10]
1010adb68:     	cbz	x22, 0x1010adc10 <-[GHOSTUIWindow cancelPointerCapture]+0x1ac>
1010adb6c:     	adrp	x9, 0x106627000 <_zlibVersion+0x106627000>
1010adb70:     	ldrsw	x9, [x9, #0xf80]
1010adb74:     	ldr	x20, [x19, x9]
1010adb78:     	adrp	x9, 0x106627000 <_zlibVersion+0x106627000>
1010adb7c:     	ldrsw	x9, [x9, #0xf84]
1010adb80:     	ldr	x25, [x19, x9]
1010adb84:     	ldr	d8, [x8, #0x18]
1010adb88:     	ldr	x24, [x8, #0x8]
1010adb8c:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010adb90:     	add	x8, x8, #0x750
1010adb94:     	ldr	x8, [x8]
1010adb98:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010adb9c:     	add	x2, x2, #0xc2a
1010adba0:     	mov	w0, #0x58               ; =88
1010adba4:     	mov	w1, #0x10               ; =16
1010adba8:     	mov	w3, #0x1                ; =1
1010adbac:     	blr	x8
1010adbb0:     	mov	x21, x0
1010adbb4:     	ldr	x8, [x20]
1010adbb8:     	ldr	x8, [x8, #0x10]
1010adbbc:     	mov	x0, x20
1010adbc0:     	blr	x8
1010adbc4:     	mov	w8, #0xb                ; =11
1010adbc8:     	str	w8, [x21, #0x8]
1010adbcc:     	stp	x0, x25, [x21, #0x10]
1010adbd0:     	adrp	x8, 0x1063ff000 <__ZTV12GHOST_Window+0x88>
1010adbd4:     	add	x8, x8, #0x598
1010adbd8:     	add	x8, x8, #0x10
1010adbdc:     	str	x8, [x21]
1010adbe0:     	mov	x8, x21
1010adbe4:     	str	x23, [x8, #0x28]!
1010adbe8:     	str	x24, [x21, #0x30]
1010adbec:     	str	d8, [x21, #0x38]
1010adbf0:     	mov	w9, #0x4                ; =4
1010adbf4:     	str	w9, [x21, #0x40]
1010adbf8:     	str	x22, [x21, #0x48]
1010adbfc:     	str	wzr, [x21, #0x50]
1010adc00:     	str	x8, [x21, #0x20]
1010adc04:     	mov	x0, x20
1010adc08:     	mov	x1, x21
1010adc0c:     	bl	0x10109a124 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010adc10:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010adc14:     	ldrsw	x8, [x8, #0xfb4]
1010adc18:     	add	x8, x19, x8
1010adc1c:     	ldr	w9, [x8]
1010adc20:     	cmp	w9, #0x0
1010adc24:     	cset	w10, ne
1010adc28:     	ldrb	w11, [x8, #0x4]
1010adc2c:     	orr	w10, w11, w10
1010adc30:     	strb	w10, [x8, #0x4]
1010adc34:     	str	wzr, [x8]
1010adc38:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010adc3c:     	ldrsw	x21, [x8, #0x50]
1010adc40:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010adc44:     	ldrsw	x20, [x8, #0xfb8]
1010adc48:     	cbz	w9, 0x1010adcd0 <-[GHOSTUIWindow cancelPointerCapture]+0x26c>
1010adc4c:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010adc50:     	ldrsw	x8, [x8, #0x48]
1010adc54:     	mov	x9, sp
1010adc58:     	ldr	d0, [x19, x8]
1010adc5c:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010adc60:     	ldrsw	x8, [x8, #0x4c]
1010adc64:     	ldr	d1, [x19, x8]
1010adc68:     	adrp	x8, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010adc6c:     	add	x8, x8, #0x544
1010adc70:     	ldr	q2, [x8]
1010adc74:     	stur	q2, [sp, #0x5c]
1010adc78:     	str	wzr, [sp, #0x6c]
1010adc7c:     	movi.16b	v2, #0x0
1010adc80:     	stur	q2, [sp, #0x78]
1010adc84:     	stur	q2, [x9, #0x88]
1010adc88:     	stur	q2, [x9, #0x98]
1010adc8c:     	str	xzr, [sp, #0xa8]
1010adc90:     	stp	d0, d1, [sp, #0x30]
1010adc94:     	strh	wzr, [sp, #0x58]
1010adc98:     	stp	xzr, xzr, [sp, #0x48]
1010adc9c:     	str	xzr, [sp, #0x40]
1010adca0:     	mov	w8, #0x1                ; =1
1010adca4:     	strb	w8, [sp, #0x6e]
1010adca8:     	ldrb	w9, [x19, x20]
1010adcac:     	strb	w9, [sp, #0x70]
1010adcb0:     	ldr	q0, [x19, x21]
1010adcb4:     	str	q0, [sp, #0x80]
1010adcb8:     	mov	w9, #0x6                ; =6
1010adcbc:     	str	w9, [sp]
1010adcc0:     	str	w8, [sp, #0x28]
1010adcc4:     	mov	x2, sp
1010adcc8:     	mov	x0, x19
1010adccc:     	bl	0x104b78620 <_objc_msgSend$generateUserInputEvents:>
1010adcd0:     	add	x8, x19, x21
1010adcd4:     	stp	xzr, xzr, [x8]
1010adcd8:     	str	xzr, [x8, #0x10]
1010adcdc:     	strb	wzr, [x19, x20]
1010adce0:     	ldp	x29, x30, [sp, #0x100]
1010adce4:     	ldp	x20, x19, [sp, #0xf0]
1010adce8:     	ldp	x22, x21, [sp, #0xe0]
1010adcec:     	ldp	x24, x23, [sp, #0xd0]
1010adcf0:     	ldp	x26, x25, [sp, #0xc0]
1010adcf4:     	ldp	d9, d8, [sp, #0xb0]
1010adcf8:     	add	sp, sp, #0x110
1010adcfc:     	ret
1010add00:     	mov	x19, x0
1010add04:     	cbz	x21, 0x1010add20 <-[GHOSTUIWindow cancelPointerCapture]+0x2bc>
1010add08:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010add0c:     	add	x8, x8, #0x710
1010add10:     	ldr	x8, [x8]
1010add14:     	mov	x0, x21
1010add18:     	mov	w1, #0x1                ; =1
1010add1c:     	blr	x8
1010add20:     	mov	x0, x19
1010add24:     	bl	0x104b72c1c <_zlibVersion+0x104b72c1c>
1010add28:     	bl	0x1000144bc <___clang_call_terminate>
