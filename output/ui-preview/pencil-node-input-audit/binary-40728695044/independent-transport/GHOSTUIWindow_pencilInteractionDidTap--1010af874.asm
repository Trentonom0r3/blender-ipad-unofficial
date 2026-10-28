
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010af874 <-[GHOSTUIWindow pencilInteractionDidTap:]>:
1010af874:     	sub	sp, sp, #0x160
1010af878:     	stp	x28, x27, [sp, #0x100]
1010af87c:     	stp	x26, x25, [sp, #0x110]
1010af880:     	stp	x24, x23, [sp, #0x120]
1010af884:     	stp	x22, x21, [sp, #0x130]
1010af888:     	stp	x20, x19, [sp, #0x140]
1010af88c:     	stp	x29, x30, [sp, #0x150]
1010af890:     	add	x29, sp, #0x150
1010af894:     	mov	x19, x0
1010af898:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010af89c:     	ldr	x0, [x8, #0xce0]
1010af8a0:     	bl	0x104b797a0 <_objc_msgSend$preferredTapAction>
1010af8a4:     	cbz	x0, 0x1010afa3c <-[GHOSTUIWindow pencilInteractionDidTap:]+0x1c8>
1010af8a8:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010af8ac:     	ldrsw	x8, [x8, #0xf9c]
1010af8b0:     	ldr	x8, [x19, x8]
1010af8b4:     	cbnz	x8, 0x1010afa3c <-[GHOSTUIWindow pencilInteractionDidTap:]+0x1c8>
1010af8b8:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010af8bc:     	ldrsw	x8, [x8, #0xf78]
1010af8c0:     	ldr	x0, [x19, x8]
1010af8c4:     	bl	0x104b79680 <_objc_msgSend$pencilContactDown>
1010af8c8:     	tbnz	w0, #0x0, 0x1010afa3c <-[GHOSTUIWindow pencilInteractionDidTap:]+0x1c8>
1010af8cc:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010af8d0:     	ldrsw	x8, [x8, #0x2c]
1010af8d4:     	ldrb	w8, [x19, x8]
1010af8d8:     	tbnz	w8, #0x0, 0x1010afa3c <-[GHOSTUIWindow pencilInteractionDidTap:]+0x1c8>
1010af8dc:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010af8e0:     	ldrsw	x8, [x8, #0x30]
1010af8e4:     	ldrb	w8, [x19, x8]
1010af8e8:     	tbnz	w8, #0x0, 0x1010afa3c <-[GHOSTUIWindow pencilInteractionDidTap:]+0x1c8>
1010af8ec:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010af8f0:     	ldrsw	x8, [x8, #0x34]
1010af8f4:     	ldrb	w8, [x19, x8]
1010af8f8:     	tbnz	w8, #0x0, 0x1010afa3c <-[GHOSTUIWindow pencilInteractionDidTap:]+0x1c8>
1010af8fc:     	mov	x0, x19
1010af900:     	bl	0x104b77820 <_objc_msgSend$cancelPointerCapture>
1010af904:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010af908:     	ldrsw	x23, [x8, #0xf84]
1010af90c:     	ldr	x0, [x19, x23]
1010af910:     	sub	x8, x29, #0x90
1010af914:     	bl	0x1010afa88 <__ZN5ghost3ios24pencil_ring_presentationEPKv>
1010af918:     	ldur	x22, [x29, #-0x90]
1010af91c:     	cbz	x22, 0x1010af9dc <-[GHOSTUIWindow pencilInteractionDidTap:]+0x168>
1010af920:     	ldur	x24, [x29, #-0x88]
1010af924:     	ldp	w25, w27, [x29, #-0x80]
1010af928:     	ldp	w26, w28, [x29, #-0x78]
1010af92c:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010af930:     	ldrsw	x20, [x8, #0xf80]
1010af934:     	ldr	x8, [x19, x20]
1010af938:     	str	x8, [sp, #0x8]
1010af93c:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010af940:     	add	x8, x8, #0x750
1010af944:     	ldr	x8, [x8]
1010af948:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010af94c:     	add	x2, x2, #0xc2a
1010af950:     	mov	w0, #0x58               ; =88
1010af954:     	mov	w1, #0x10               ; =16
1010af958:     	mov	w3, #0x1                ; =1
1010af95c:     	blr	x8
1010af960:     	mov	x21, x0
1010af964:     	ldr	x0, [x19, x20]
1010af968:     	ldr	x8, [x0]
1010af96c:     	ldr	x8, [x8, #0x10]
1010af970:     	blr	x8
1010af974:     	add	w8, w28, w27
1010af978:     	add	w8, w8, w8, lsr #31
1010af97c:     	asr	w8, w8, #1
1010af980:     	add	w9, w26, w25
1010af984:     	ldr	x10, [x19, x23]
1010af988:     	mov	w11, #0xb               ; =11
1010af98c:     	str	w11, [x21, #0x8]
1010af990:     	stp	x0, x10, [x21, #0x10]
1010af994:     	adrp	x10, 0x1063ff000 <__ZTV12GHOST_Window+0x88>
1010af998:     	add	x10, x10, #0x598
1010af99c:     	add	x10, x10, #0x10
1010af9a0:     	str	x10, [x21]
1010af9a4:     	add	w9, w9, w9, lsr #31
1010af9a8:     	mov	x10, x21
1010af9ac:     	str	x22, [x10, #0x28]!
1010af9b0:     	asr	w9, w9, #1
1010af9b4:     	str	x24, [x21, #0x30]
1010af9b8:     	stp	w9, w8, [x21, #0x38]
1010af9bc:     	str	wzr, [x21, #0x40]
1010af9c0:     	str	xzr, [x21, #0x48]
1010af9c4:     	str	wzr, [x21, #0x50]
1010af9c8:     	str	x10, [x21, #0x20]
1010af9cc:     	ldr	x0, [sp, #0x8]
1010af9d0:     	mov	x1, x21
1010af9d4:     	bl	0x10109a124 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010af9d8:     	b	0x1010afa3c <-[GHOSTUIWindow pencilInteractionDidTap:]+0x1c8>
1010af9dc:     	adrp	x8, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010af9e0:     	add	x8, x8, #0x544
1010af9e4:     	ldr	q0, [x8]
1010af9e8:     	add	x8, sp, #0x10
1010af9ec:     	stur	q0, [sp, #0x6c]
1010af9f0:     	str	wzr, [sp, #0x7c]
1010af9f4:     	strb	wzr, [sp, #0x80]
1010af9f8:     	movi.16b	v0, #0x0
1010af9fc:     	stur	q0, [sp, #0x88]
1010afa00:     	stur	q0, [x8, #0x88]
1010afa04:     	stur	q0, [x8, #0x98]
1010afa08:     	str	xzr, [sp, #0xb8]
1010afa0c:     	fmov.2d	v0, #-1.00000000
1010afa10:     	str	q0, [sp, #0x40]
1010afa14:     	stp	xzr, xzr, [sp, #0x58]
1010afa18:     	str	xzr, [sp, #0x50]
1010afa1c:     	mov	w8, #0x1                ; =1
1010afa20:     	strh	w8, [sp, #0x68]
1010afa24:     	mov	w9, #0x7                ; =7
1010afa28:     	str	w9, [sp, #0x10]
1010afa2c:     	str	w8, [sp, #0x38]
1010afa30:     	add	x2, sp, #0x10
1010afa34:     	mov	x0, x19
1010afa38:     	bl	0x104b78620 <_objc_msgSend$generateUserInputEvents:>
1010afa3c:     	ldp	x29, x30, [sp, #0x150]
1010afa40:     	ldp	x20, x19, [sp, #0x140]
1010afa44:     	ldp	x22, x21, [sp, #0x130]
1010afa48:     	ldp	x24, x23, [sp, #0x120]
1010afa4c:     	ldp	x26, x25, [sp, #0x110]
1010afa50:     	ldp	x28, x27, [sp, #0x100]
1010afa54:     	add	sp, sp, #0x160
1010afa58:     	ret
1010afa5c:     	mov	x19, x0
1010afa60:     	cbz	x21, 0x1010afa7c <-[GHOSTUIWindow pencilInteractionDidTap:]+0x208>
1010afa64:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010afa68:     	add	x8, x8, #0x710
1010afa6c:     	ldr	x8, [x8]
1010afa70:     	mov	x0, x21
1010afa74:     	mov	w1, #0x1                ; =1
1010afa78:     	blr	x8
1010afa7c:     	mov	x0, x19
1010afa80:     	bl	0x104b72c1c <_zlibVersion+0x104b72c1c>
1010afa84:     	bl	0x1000144bc <___clang_call_terminate>
