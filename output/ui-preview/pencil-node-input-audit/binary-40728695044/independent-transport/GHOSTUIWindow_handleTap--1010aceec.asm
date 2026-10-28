
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010aceec <-[GHOSTUIWindow handleTap:]>:
1010aceec:     	sub	sp, sp, #0x190
1010acef0:     	stp	d9, d8, [sp, #0x130]
1010acef4:     	stp	x28, x27, [sp, #0x140]
1010acef8:     	stp	x24, x23, [sp, #0x150]
1010acefc:     	stp	x22, x21, [sp, #0x160]
1010acf00:     	stp	x20, x19, [sp, #0x170]
1010acf04:     	stp	x29, x30, [sp, #0x180]
1010acf08:     	add	x29, sp, #0x180
1010acf0c:     	mov	x20, x2
1010acf10:     	mov	x19, x0
1010acf14:     	mov	x0, x2
1010acf18:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010acf1c:     	cmp	x0, #0x3
1010acf20:     	b.ne	0x1010ad1ec <-[GHOSTUIWindow handleTap:]+0x300>
1010acf24:     	mov	x0, x20
1010acf28:     	bl	0x104b7c100 <_objc_msgSend$touchStreamAllowed>
1010acf2c:     	cbz	w0, 0x1010ad1ec <-[GHOSTUIWindow handleTap:]+0x300>
1010acf30:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010acf34:     	ldrsw	x8, [x8, #0x2c]
1010acf38:     	ldrb	w8, [x19, x8]
1010acf3c:     	tbnz	w8, #0x0, 0x1010ad1ec <-[GHOSTUIWindow handleTap:]+0x300>
1010acf40:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010acf44:     	ldrsw	x8, [x8, #0x30]
1010acf48:     	ldrb	w8, [x19, x8]
1010acf4c:     	tbnz	w8, #0x0, 0x1010ad1ec <-[GHOSTUIWindow handleTap:]+0x300>
1010acf50:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010acf54:     	ldrsw	x8, [x8, #0x34]
1010acf58:     	ldrb	w8, [x19, x8]
1010acf5c:     	tbnz	w8, #0x0, 0x1010ad1ec <-[GHOSTUIWindow handleTap:]+0x300>
1010acf60:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010acf64:     	ldrsw	x21, [x8, #0xf84]
1010acf68:     	ldr	x2, [x19, x21]
1010acf6c:     	mov	x0, x20
1010acf70:     	bl	0x104b78780 <_objc_msgSend$getScaledTouchPoint:>
1010acf74:     	fmov	d8, d0
1010acf78:     	fmov	d9, d1
1010acf7c:     	cbz	x20, 0x1010acfe4 <-[GHOSTUIWindow handleTap:]+0xf8>
1010acf80:     	sub	x8, x29, #0x80
1010acf84:     	mov	x0, x20
1010acf88:     	bl	0x104b79c00 <_objc_msgSend$ringContact>
1010acf8c:     	ldurb	w8, [x29, #-0x60]
1010acf90:     	tbz	w8, #0x0, 0x1010acff0 <-[GHOSTUIWindow handleTap:]+0x104>
1010acf94:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010acf98:     	ldrsw	x20, [x8, #0xf80]
1010acf9c:     	ldr	x0, [x19, x20]
1010acfa0:     	ldr	x1, [x19, x21]
1010acfa4:     	ldp	s0, s1, [x29, #-0x68]
1010acfa8:     	sshll.2d	v0, v0, #0x0
1010acfac:     	scvtf	d0, d0
1010acfb0:     	sshll.2d	v1, v1, #0x0
1010acfb4:     	scvtf	d1, d1
1010acfb8:     	sub	x2, x29, #0x80
1010acfbc:     	mov	w3, #0x1                ; =1
1010acfc0:     	bl	0x1010ad20c <__ZL15ios_ring_packetP15GHOST_SystemIOSP15GHOST_WindowIOSRKN5ghost3ios17PencilRingContactE22GHOST_TPencilRingPhase7CGPoint>
1010acfc4:     	ldr	x0, [x19, x20]
1010acfc8:     	ldr	x1, [x19, x21]
1010acfcc:     	sub	x2, x29, #0x80
1010acfd0:     	mov	w3, #0x3                ; =3
1010acfd4:     	fmov	d0, d8
1010acfd8:     	fmov	d1, d9
1010acfdc:     	bl	0x1010ad20c <__ZL15ios_ring_packetP15GHOST_SystemIOSP15GHOST_WindowIOSRKN5ghost3ios17PencilRingContactE22GHOST_TPencilRingPhase7CGPoint>
1010acfe0:     	b	0x1010ad1ec <-[GHOSTUIWindow handleTap:]+0x300>
1010acfe4:     	stur	xzr, [x29, #-0x60]
1010acfe8:     	movi.16b	v0, #0x0
1010acfec:     	stp	q0, q0, [x29, #-0x80]
1010acff0:     	mov	x0, x20
1010acff4:     	bl	0x104b78660 <_objc_msgSend$gestureUsesPencil>
1010acff8:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010acffc:     	ldrsw	x24, [x8, #0xfac]
1010ad000:     	strb	w0, [x19, x24]
1010ad004:     	cbz	x20, 0x1010ad078 <-[GHOSTUIWindow handleTap:]+0x18c>
1010ad008:     	add	x8, sp, #0x30
1010ad00c:     	mov	x0, x20
1010ad010:     	bl	0x104b796c0 <_objc_msgSend$pencilSample>
1010ad014:     	ldrb	w8, [sp, #0x30]
1010ad018:     	ldr	x9, [sp, #0x38]
1010ad01c:     	ldrb	w10, [x19, x24]
1010ad020:     	ldr	w11, [sp, #0x34]
1010ad024:     	lsl	x11, x11, #32
1010ad028:     	tst	w8, #0x1
1010ad02c:     	csel	x22, x9, xzr, ne
1010ad030:     	mov	w8, #0x1                ; =1
1010ad034:     	csinc	x23, x8, x11, eq
1010ad038:     	tbz	w10, #0x0, 0x1010ad04c <-[GHOSTUIWindow handleTap:]+0x160>
1010ad03c:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010ad040:     	ldrsw	x8, [x8, #0xfa0]
1010ad044:     	add	x8, x19, x8
1010ad048:     	stp	x23, x22, [x8]
1010ad04c:     	sub	x8, x29, #0xa0
1010ad050:     	mov	x0, x20
1010ad054:     	bl	0x104b78920 <_objc_msgSend$hudContact>
1010ad058:     	ldur	x8, [x29, #-0xa0]
1010ad05c:     	cbz	x8, 0x1010ad0a0 <-[GHOSTUIWindow handleTap:]+0x1b4>
1010ad060:     	ldp	s0, s1, [x29, #-0x90]
1010ad064:     	sshll.2d	v0, v0, #0x0
1010ad068:     	scvtf	d8, d0
1010ad06c:     	sshll.2d	v0, v1, #0x0
1010ad070:     	scvtf	d9, d0
1010ad074:     	b	0x1010ad0a0 <-[GHOSTUIWindow handleTap:]+0x1b4>
1010ad078:     	tbz	w0, #0x0, 0x1010ad090 <-[GHOSTUIWindow handleTap:]+0x1a4>
1010ad07c:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010ad080:     	ldrsw	x8, [x8, #0xfa0]
1010ad084:     	adrp	x9, 0x104efb000 <__ZTSN7blender3bke4bake17PrimitiveBakeItemE+0x18>
1010ad088:     	ldr	q0, [x9, #0x9b0]
1010ad08c:     	str	q0, [x19, x8]
1010ad090:     	mov	x22, #0x0               ; =0
1010ad094:     	stp	xzr, xzr, [x29, #-0xa0]
1010ad098:     	mov	w23, #0x1               ; =1
1010ad09c:     	stur	xzr, [x29, #-0x90]
1010ad0a0:     	ldrb	w8, [x19, x24]
1010ad0a4:     	strb	wzr, [sp, #0x89]
1010ad0a8:     	adrp	x9, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010ad0ac:     	add	x9, x9, #0x544
1010ad0b0:     	ldr	q0, [x9]
1010ad0b4:     	str	q0, [sp]
1010ad0b8:     	stur	q0, [sp, #0x8c]
1010ad0bc:     	str	wzr, [sp, #0x58]
1010ad0c0:     	str	wzr, [sp, #0x9c]
1010ad0c4:     	movi.16b	v0, #0x0
1010ad0c8:     	stp	q0, q0, [sp, #0xb0]
1010ad0cc:     	str	q0, [sp, #0xd0]
1010ad0d0:     	stp	d8, d9, [sp, #0x60]
1010ad0d4:     	stp	xzr, xzr, [sp, #0x78]
1010ad0d8:     	str	xzr, [sp, #0x70]
1010ad0dc:     	strb	w8, [sp, #0x88]
1010ad0e0:     	cmp	w8, #0x1
1010ad0e4:     	b.ne	0x1010ad0f4 <-[GHOSTUIWindow handleTap:]+0x208>
1010ad0e8:     	stur	x23, [sp, #0x8c]
1010ad0ec:     	stur	x22, [sp, #0x94]
1010ad0f0:     	strb	w8, [sp, #0x89]
1010ad0f4:     	mov	x0, x20
1010ad0f8:     	bl	0x104b78640 <_objc_msgSend$gestureUsesFinger>
1010ad0fc:     	strb	w0, [sp, #0xa0]
1010ad100:     	cbz	w0, 0x1010ad110 <-[GHOSTUIWindow handleTap:]+0x224>
1010ad104:     	mov	x0, x20
1010ad108:     	bl	0x104b78420 <_objc_msgSend$fingerPaintGeneration>
1010ad10c:     	b	0x1010ad114 <-[GHOSTUIWindow handleTap:]+0x228>
1010ad110:     	mov	x0, #0x0                ; =0
1010ad114:     	str	x0, [sp, #0xa8]
1010ad118:     	ldrb	w8, [x19, x24]
1010ad11c:     	cmp	w8, #0x1
1010ad120:     	b.ne	0x1010ad138 <-[GHOSTUIWindow handleTap:]+0x24c>
1010ad124:     	cbz	x20, 0x1010ad138 <-[GHOSTUIWindow handleTap:]+0x24c>
1010ad128:     	add	x8, sp, #0x10
1010ad12c:     	mov	x0, x20
1010ad130:     	bl	0x104b796a0 <_objc_msgSend$pencilPaintContact>
1010ad134:     	b	0x1010ad140 <-[GHOSTUIWindow handleTap:]+0x254>
1010ad138:     	movi.16b	v0, #0x0
1010ad13c:     	stp	q0, q0, [sp, #0x10]
1010ad140:     	ldp	q0, q1, [sp, #0x10]
1010ad144:     	stp	q0, q1, [sp, #0xc0]
1010ad148:     	ldur	q1, [x29, #-0xa0]
1010ad14c:     	str	q1, [sp, #0xb0]
1010ad150:     	fmov	x8, d1
1010ad154:     	cbz	x8, 0x1010ad160 <-[GHOSTUIWindow handleTap:]+0x274>
1010ad158:     	strb	wzr, [sp, #0x9f]
1010ad15c:     	b	0x1010ad198 <-[GHOSTUIWindow handleTap:]+0x2ac>
1010ad160:     	ldr	x21, [x19, x21]
1010ad164:     	fcvtzs	w22, d8
1010ad168:     	fcvtzs	w23, d9
1010ad16c:     	bl	0x1010a0738 <__Z29GHOST_IOS_get_flythrough_modev>
1010ad170:     	eor	w3, w0, #0x1
1010ad174:     	mov	x0, x21
1010ad178:     	mov	x1, x22
1010ad17c:     	mov	x2, x23
1010ad180:     	bl	0x1010ad338 <__ZN5ghost3ios13selection_hitEPKviib>
1010ad184:     	strb	w0, [sp, #0x9f]
1010ad188:     	cbz	w0, 0x1010ad198 <-[GHOSTUIWindow handleTap:]+0x2ac>
1010ad18c:     	add	x8, sp, #0x30
1010ad190:     	movi.16b	v0, #0x0
1010ad194:     	stp	q0, q0, [x8, #0x90]
1010ad198:     	mov	x0, x20
1010ad19c:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ad1a0:     	cmp	x0, #0x3
1010ad1a4:     	b.ne	0x1010ad1c4 <-[GHOSTUIWindow handleTap:]+0x2d8>
1010ad1a8:     	adrp	x8, 0x104fc6000 <__ZTSNSt3__110__function6__funcIZN7blender3gpu6shader12Preprocessor28template_definition_mutationERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_8functionIFviiSB_PKcEEEEUlRKNS_6vectorINS4_6parser5TokenENS9_ISM_EEEEE0_NS9_ISR_EEFvSO_EEE+0x76>
1010ad1ac:     	ldr	d0, [x8, #0x6c8]
1010ad1b0:     	str	d0, [sp, #0x30]
1010ad1b4:     	mov	w8, #0x6                ; =6
1010ad1b8:     	mov	w9, #0x3                ; =3
1010ad1bc:     	str	w8, [sp, #0x38]
1010ad1c0:     	str	w9, [sp, #0x58]
1010ad1c4:     	add	x2, sp, #0x30
1010ad1c8:     	mov	x0, x19
1010ad1cc:     	bl	0x104b78620 <_objc_msgSend$generateUserInputEvents:>
1010ad1d0:     	ldrb	w8, [x19, x24]
1010ad1d4:     	cmp	w8, #0x1
1010ad1d8:     	b.ne	0x1010ad1ec <-[GHOSTUIWindow handleTap:]+0x300>
1010ad1dc:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010ad1e0:     	ldrsw	x8, [x8, #0xfa0]
1010ad1e4:     	ldr	q0, [sp]
1010ad1e8:     	str	q0, [x19, x8]
1010ad1ec:     	ldp	x29, x30, [sp, #0x180]
1010ad1f0:     	ldp	x20, x19, [sp, #0x170]
1010ad1f4:     	ldp	x22, x21, [sp, #0x160]
1010ad1f8:     	ldp	x24, x23, [sp, #0x150]
1010ad1fc:     	ldp	x28, x27, [sp, #0x140]
1010ad200:     	ldp	d9, d8, [sp, #0x130]
1010ad204:     	add	sp, sp, #0x190
1010ad208:     	ret
