
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010aea3c <-[GHOSTUIWindow handleIndirectPan:]>:
1010aea3c:     	sub	sp, sp, #0x120
1010aea40:     	stp	d9, d8, [sp, #0xb0]
1010aea44:     	stp	x28, x27, [sp, #0xc0]
1010aea48:     	stp	x26, x25, [sp, #0xd0]
1010aea4c:     	stp	x24, x23, [sp, #0xe0]
1010aea50:     	stp	x22, x21, [sp, #0xf0]
1010aea54:     	stp	x20, x19, [sp, #0x100]
1010aea58:     	stp	x29, x30, [sp, #0x110]
1010aea5c:     	add	x29, sp, #0x110
1010aea60:     	mov	x20, x2
1010aea64:     	mov	x19, x0
1010aea68:     	mov	x21, sp
1010aea6c:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aea70:     	ldrsw	x22, [x8, #0xf84]
1010aea74:     	ldr	x2, [x0, x22]
1010aea78:     	mov	x0, x20
1010aea7c:     	bl	0x104b78780 <_objc_msgSend$getScaledTouchPoint:>
1010aea80:     	fmov	d9, d0
1010aea84:     	fmov	d8, d1
1010aea88:     	mov	x0, x20
1010aea8c:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010aea90:     	cmp	x0, #0x1
1010aea94:     	b.ne	0x1010aead0 <-[GHOSTUIWindow handleIndirectPan:]+0x94>
1010aea98:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aea9c:     	ldrsw	x8, [x8, #0xfb0]
1010aeaa0:     	mov	w9, #0x1                ; =1
1010aeaa4:     	strb	w9, [x19, x8]
1010aeaa8:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010aeaac:     	ldrsw	x8, [x8, #0x30]
1010aeab0:     	ldrb	w8, [x19, x8]
1010aeab4:     	cmp	w8, #0x1
1010aeab8:     	b.ne	0x1010aec70 <-[GHOSTUIWindow handleIndirectPan:]+0x234>
1010aeabc:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aeac0:     	ldrsw	x8, [x8, #0xfc4]
1010aeac4:     	ldrb	w8, [x19, x8]
1010aeac8:     	eor	w8, w8, #0x1
1010aeacc:     	b	0x1010aec74 <-[GHOSTUIWindow handleIndirectPan:]+0x238>
1010aead0:     	mov	x0, x20
1010aead4:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010aead8:     	cmp	x0, #0x2
1010aeadc:     	b.ne	0x1010aecfc <-[GHOSTUIWindow handleIndirectPan:]+0x2c0>
1010aeae0:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010aeae4:     	ldrsw	x8, [x8, #0x54]
1010aeae8:     	ldr	d0, [x19, x8]
1010aeaec:     	adrp	x9, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010aeaf0:     	ldrsw	x9, [x9, #0x58]
1010aeaf4:     	ldr	d1, [x19, x9]
1010aeaf8:     	str	d9, [x19, x8]
1010aeafc:     	str	d8, [x19, x9]
1010aeb00:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aeb04:     	ldrsw	x8, [x8, #0xfc8]
1010aeb08:     	ldrb	w8, [x19, x8]
1010aeb0c:     	cmp	w8, #0x1
1010aeb10:     	b.ne	0x1010aedc4 <-[GHOSTUIWindow handleIndirectPan:]+0x388>
1010aeb14:     	fsub	d0, d9, d0
1010aeb18:     	fcvtzs	w24, d0
1010aeb1c:     	fsub	d0, d8, d1
1010aeb20:     	fcvtzs	w23, d0
1010aeb24:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aeb28:     	ldrsw	x8, [x8, #0xfcc]
1010aeb2c:     	ldrb	w8, [x19, x8]
1010aeb30:     	cmp	w8, #0x1
1010aeb34:     	b.ne	0x1010aebac <-[GHOSTUIWindow handleIndirectPan:]+0x170>
1010aeb38:     	scvtf	s0, w24
1010aeb3c:     	mov	w8, #0x147b             ; =5243
1010aeb40:     	movk	w8, #0x3e2e, lsl #16
1010aeb44:     	fmov	s1, w8
1010aeb48:     	fmul	s0, s0, s1
1010aeb4c:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aeb50:     	ldrsw	x8, [x8, #0xfd0]
1010aeb54:     	ldr	s2, [x19, x8]
1010aeb58:     	fadd	s0, s0, s2
1010aeb5c:     	str	s0, [x19, x8]
1010aeb60:     	scvtf	s0, w23
1010aeb64:     	fmul	s0, s0, s1
1010aeb68:     	adrp	x9, 0x106627000 <_zlibVersion+0x106627000>
1010aeb6c:     	ldrsw	x9, [x9, #0xfd4]
1010aeb70:     	ldr	s1, [x19, x9]
1010aeb74:     	fadd	s0, s0, s1
1010aeb78:     	str	s0, [x19, x9]
1010aeb7c:     	ldr	s1, [x19, x8]
1010aeb80:     	fcvtzs	w24, s1
1010aeb84:     	fcvtzs	w23, s0
1010aeb88:     	fcvtzs	s2, s1
1010aeb8c:     	scvtf	s2, s2
1010aeb90:     	fsub	s1, s1, s2
1010aeb94:     	str	s1, [x19, x8]
1010aeb98:     	fcvtzs	s0, s0
1010aeb9c:     	scvtf	s0, s0
1010aeba0:     	ldr	s1, [x19, x9]
1010aeba4:     	fsub	s0, s1, s0
1010aeba8:     	str	s0, [x19, x9]
1010aebac:     	orr	w8, w24, w23
1010aebb0:     	cbz	w8, 0x1010aee3c <-[GHOSTUIWindow handleIndirectPan:]+0x400>
1010aebb4:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aebb8:     	ldrsw	x26, [x8, #0xf80]
1010aebbc:     	ldr	x20, [x19, x26]
1010aebc0:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010aebc4:     	add	x8, x8, #0x750
1010aebc8:     	ldr	x8, [x8]
1010aebcc:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010aebd0:     	add	x2, x2, #0xc2a
1010aebd4:     	mov	w25, #0x1               ; =1
1010aebd8:     	mov	w0, #0x48               ; =72
1010aebdc:     	mov	w1, #0x10               ; =16
1010aebe0:     	mov	w3, #0x1                ; =1
1010aebe4:     	blr	x8
1010aebe8:     	mov	x21, x0
1010aebec:     	ldr	x0, [x19, x26]
1010aebf0:     	ldr	x8, [x0]
1010aebf4:     	ldr	x8, [x8, #0x10]
1010aebf8:     	blr	x8
1010aebfc:     	ldr	x8, [x19, x22]
1010aec00:     	fcvtzs	w9, d9
1010aec04:     	fcvtzs	w10, d8
1010aec08:     	mov	w11, #0x5               ; =5
1010aec0c:     	str	w11, [x21, #0x8]
1010aec10:     	stp	x0, x8, [x21, #0x10]
1010aec14:     	adrp	x8, 0x1063ff000 <__ZTV12GHOST_Window+0x88>
1010aec18:     	add	x8, x8, #0x438
1010aec1c:     	add	x8, x8, #0x10
1010aec20:     	str	x8, [x21]
1010aec24:     	mov	x8, x21
1010aec28:     	str	w25, [x8, #0x28]!
1010aec2c:     	stp	w9, w10, [x21, #0x2c]
1010aec30:     	stp	w24, w23, [x21, #0x34]
1010aec34:     	strh	w25, [x21, #0x3c]
1010aec38:     	mov	w9, #0x2                ; =2
1010aec3c:     	str	w9, [x21, #0x40]
1010aec40:     	str	x8, [x21, #0x20]
1010aec44:     	mov	x0, x20
1010aec48:     	mov	x1, x21
1010aec4c:     	ldp	x29, x30, [sp, #0x110]
1010aec50:     	ldp	x20, x19, [sp, #0x100]
1010aec54:     	ldp	x22, x21, [sp, #0xf0]
1010aec58:     	ldp	x24, x23, [sp, #0xe0]
1010aec5c:     	ldp	x26, x25, [sp, #0xd0]
1010aec60:     	ldp	x28, x27, [sp, #0xc0]
1010aec64:     	ldp	d9, d8, [sp, #0xb0]
1010aec68:     	add	sp, sp, #0x120
1010aec6c:     	b	0x10109a124 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010aec70:     	mov	w8, #0x0                ; =0
1010aec74:     	adrp	x9, 0x106627000 <_zlibVersion+0x106627000>
1010aec78:     	ldrsw	x9, [x9, #0xfc8]
1010aec7c:     	and	w8, w8, #0x1
1010aec80:     	strb	w8, [x19, x9]
1010aec84:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aec88:     	ldrsw	x8, [x8, #0xfcc]
1010aec8c:     	strb	wzr, [x19, x8]
1010aec90:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aec94:     	ldrsw	x8, [x8, #0xfd0]
1010aec98:     	str	wzr, [x19, x8]
1010aec9c:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aeca0:     	ldrsw	x8, [x8, #0xfd4]
1010aeca4:     	str	wzr, [x19, x8]
1010aeca8:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010aecac:     	ldrsw	x8, [x8, #0x54]
1010aecb0:     	str	d9, [x19, x8]
1010aecb4:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010aecb8:     	ldrsw	x8, [x8, #0x58]
1010aecbc:     	str	d8, [x19, x8]
1010aecc0:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aecc4:     	adrp	x10, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010aecc8:     	add	x10, x10, #0x544
1010aeccc:     	ldrsw	x8, [x8, #0xfa0]
1010aecd0:     	ldr	q0, [x10]
1010aecd4:     	str	q0, [x19, x8]
1010aecd8:     	ldrb	w8, [x19, x9]
1010aecdc:     	tbnz	w8, #0x0, 0x1010aee3c <-[GHOSTUIWindow handleIndirectPan:]+0x400>
1010aece0:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010aece4:     	ldrsw	x8, [x8, #0x48]
1010aece8:     	str	d9, [x19, x8]
1010aecec:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010aecf0:     	ldrsw	x8, [x8, #0x4c]
1010aecf4:     	str	d8, [x19, x8]
1010aecf8:     	b	0x1010aedf4 <-[GHOSTUIWindow handleIndirectPan:]+0x3b8>
1010aecfc:     	mov	x0, x20
1010aed00:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010aed04:     	cmp	x0, #0x3
1010aed08:     	b.eq	0x1010aed2c <-[GHOSTUIWindow handleIndirectPan:]+0x2f0>
1010aed0c:     	mov	x0, x20
1010aed10:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010aed14:     	cmp	x0, #0x4
1010aed18:     	b.eq	0x1010aed2c <-[GHOSTUIWindow handleIndirectPan:]+0x2f0>
1010aed1c:     	mov	x0, x20
1010aed20:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010aed24:     	cmp	x0, #0x5
1010aed28:     	b.ne	0x1010aee3c <-[GHOSTUIWindow handleIndirectPan:]+0x400>
1010aed2c:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aed30:     	ldrsw	x8, [x8, #0xfc8]
1010aed34:     	ldrb	w8, [x19, x8]
1010aed38:     	tbnz	w8, #0x0, 0x1010aedb4 <-[GHOSTUIWindow handleIndirectPan:]+0x378>
1010aed3c:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010aed40:     	ldrsw	x8, [x8, #0x48]
1010aed44:     	str	d9, [x19, x8]
1010aed48:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010aed4c:     	ldrsw	x8, [x8, #0x4c]
1010aed50:     	str	d8, [x19, x8]
1010aed54:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aed58:     	ldrsw	x8, [x8, #0xfa0]
1010aed5c:     	adrp	x9, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010aed60:     	add	x9, x9, #0x544
1010aed64:     	ldr	q0, [x9]
1010aed68:     	str	q0, [x19, x8]
1010aed6c:     	stur	q0, [sp, #0x5c]
1010aed70:     	str	wzr, [sp, #0x6c]
1010aed74:     	strb	wzr, [sp, #0x70]
1010aed78:     	movi.16b	v0, #0x0
1010aed7c:     	stur	q0, [sp, #0x78]
1010aed80:     	stur	q0, [x21, #0x88]
1010aed84:     	stur	q0, [x21, #0x98]
1010aed88:     	str	xzr, [sp, #0xa8]
1010aed8c:     	stp	d9, d8, [sp, #0x30]
1010aed90:     	strh	wzr, [sp, #0x58]
1010aed94:     	stp	xzr, xzr, [sp, #0x48]
1010aed98:     	str	xzr, [sp, #0x40]
1010aed9c:     	mov	w8, #0x1                ; =1
1010aeda0:     	str	wzr, [sp]
1010aeda4:     	str	w8, [sp, #0x28]
1010aeda8:     	mov	x2, sp
1010aedac:     	mov	x0, x19
1010aedb0:     	bl	0x104b78620 <_objc_msgSend$generateUserInputEvents:>
1010aedb4:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aedb8:     	ldrsw	x8, [x8, #0xfb0]
1010aedbc:     	strb	wzr, [x19, x8]
1010aedc0:     	b	0x1010aee3c <-[GHOSTUIWindow handleIndirectPan:]+0x400>
1010aedc4:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010aedc8:     	ldrsw	x8, [x8, #0x48]
1010aedcc:     	str	d9, [x19, x8]
1010aedd0:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010aedd4:     	ldrsw	x8, [x8, #0x4c]
1010aedd8:     	str	d8, [x19, x8]
1010aeddc:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aede0:     	ldrsw	x8, [x8, #0xfa0]
1010aede4:     	adrp	x9, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010aede8:     	add	x9, x9, #0x544
1010aedec:     	ldr	q0, [x9]
1010aedf0:     	str	q0, [x19, x8]
1010aedf4:     	stur	q0, [sp, #0x5c]
1010aedf8:     	str	wzr, [sp, #0x6c]
1010aedfc:     	strb	wzr, [sp, #0x70]
1010aee00:     	movi.16b	v0, #0x0
1010aee04:     	stur	q0, [sp, #0x78]
1010aee08:     	stur	q0, [x21, #0x88]
1010aee0c:     	stur	q0, [x21, #0x98]
1010aee10:     	str	xzr, [sp, #0xa8]
1010aee14:     	stp	d9, d8, [sp, #0x30]
1010aee18:     	strh	wzr, [sp, #0x58]
1010aee1c:     	stp	xzr, xzr, [sp, #0x48]
1010aee20:     	str	xzr, [sp, #0x40]
1010aee24:     	mov	w8, #0x1                ; =1
1010aee28:     	str	wzr, [sp]
1010aee2c:     	str	w8, [sp, #0x28]
1010aee30:     	mov	x2, sp
1010aee34:     	mov	x0, x19
1010aee38:     	bl	0x104b78620 <_objc_msgSend$generateUserInputEvents:>
1010aee3c:     	ldp	x29, x30, [sp, #0x110]
1010aee40:     	ldp	x20, x19, [sp, #0x100]
1010aee44:     	ldp	x22, x21, [sp, #0xf0]
1010aee48:     	ldp	x24, x23, [sp, #0xe0]
1010aee4c:     	ldp	x26, x25, [sp, #0xd0]
1010aee50:     	ldp	x28, x27, [sp, #0xc0]
1010aee54:     	ldp	d9, d8, [sp, #0xb0]
1010aee58:     	add	sp, sp, #0x120
1010aee5c:     	ret
1010aee60:     	mov	x19, x0
1010aee64:     	cbz	x21, 0x1010aee80 <-[GHOSTUIWindow handleIndirectPan:]+0x444>
1010aee68:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010aee6c:     	add	x8, x8, #0x710
1010aee70:     	ldr	x8, [x8]
1010aee74:     	mov	x0, x21
1010aee78:     	mov	w1, #0x1                ; =1
1010aee7c:     	blr	x8
1010aee80:     	mov	x0, x19
1010aee84:     	bl	0x104b72c1c <_zlibVersion+0x104b72c1c>
1010aee88:     	bl	0x1000144bc <___clang_call_terminate>
