
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010abb48 <-[GHOSTUIWindow generateUserInputEvents:]>:
1010abb48:     	sub	sp, sp, #0xf0
1010abb4c:     	stp	d9, d8, [sp, #0x80]
1010abb50:     	stp	x28, x27, [sp, #0x90]
1010abb54:     	stp	x26, x25, [sp, #0xa0]
1010abb58:     	stp	x24, x23, [sp, #0xb0]
1010abb5c:     	stp	x22, x21, [sp, #0xc0]
1010abb60:     	stp	x20, x19, [sp, #0xd0]
1010abb64:     	stp	x29, x30, [sp, #0xe0]
1010abb68:     	add	x29, sp, #0xe0
1010abb6c:     	mov	x20, x2
1010abb70:     	mov	x19, x0
1010abb74:     	bl	0x104b76300 <_zlibVersion+0x104b76300>
1010abb78:     	ldrb	w9, [x20, #0x58]
1010abb7c:     	adrp	x8, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010abb80:     	add	x8, x8, #0x544
1010abb84:     	cmp	w9, #0x1
1010abb88:     	b.ne	0x1010abbac <-[GHOSTUIWindow generateUserInputEvents:]+0x64>
1010abb8c:     	ldrb	w8, [x20, #0x59]
1010abb90:     	cmp	w8, #0x1
1010abb94:     	b.ne	0x1010abba0 <-[GHOSTUIWindow generateUserInputEvents:]+0x58>
1010abb98:     	add	x8, x20, #0x5c
1010abb9c:     	b	0x1010abbac <-[GHOSTUIWindow generateUserInputEvents:]+0x64>
1010abba0:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010abba4:     	ldrsw	x8, [x8, #0xfa0]
1010abba8:     	add	x8, x19, x8
1010abbac:     	str	wzr, [sp, #0x48]
1010abbb0:     	ldr	q2, [x8]
1010abbb4:     	ldp	q0, q1, [x20, #0x90]
1010abbb8:     	str	q0, [sp, #0x50]
1010abbbc:     	stp	q1, q2, [sp, #0x60]
1010abbc0:     	ldr	x8, [sp, #0x50]
1010abbc4:     	cbz	x8, 0x1010abbe0 <-[GHOSTUIWindow generateUserInputEvents:]+0x98>
1010abbc8:     	ldr	x8, [sp, #0x58]
1010abbcc:     	cbz	x8, 0x1010abbe0 <-[GHOSTUIWindow generateUserInputEvents:]+0x98>
1010abbd0:     	ldr	x8, [sp, #0x60]
1010abbd4:     	cmp	x8, #0x0
1010abbd8:     	cset	w8, ne
1010abbdc:     	str	w8, [sp, #0x48]
1010abbe0:     	ldr	w8, [x20, #0x28]
1010abbe4:     	cmp	w8, #0x1
1010abbe8:     	b.lt	0x1010ac744 <-[GHOSTUIWindow generateUserInputEvents:]+0xbfc>
1010abbec:     	mov	x26, #0x0               ; =0
1010abbf0:     	adrp	x8, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010abbf4:     	ldr	d8, [x8, #0x4c8]
1010abbf8:     	mov	w21, #0x1               ; =1
1010abbfc:     	adrp	x8, 0x1063fe000 <__ZTV16GHOST_WindowNULL+0x38>
1010abc00:     	add	x8, x8, #0xde8
1010abc04:     	add	x8, x8, #0x10
1010abc08:     	str	x8, [sp, #0x10]
1010abc0c:     	adrp	x8, 0x1063fe000 <__ZTV16GHOST_WindowNULL+0x38>
1010abc10:     	add	x8, x8, #0xe40
1010abc14:     	add	x8, x8, #0x10
1010abc18:     	str	x8, [sp, #0x8]
1010abc1c:     	adrp	x8, 0x1063ff000 <__ZTV12GHOST_Window+0x88>
1010abc20:     	add	x8, x8, #0x438
1010abc24:     	add	x8, x8, #0x10
1010abc28:     	str	x8, [sp, #0x28]
1010abc2c:     	adrp	x8, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010abc30:     	ldr	d9, [x8, #0x4d0]
1010abc34:     	adrp	x8, 0x1063ff000 <__ZTV12GHOST_Window+0x88>
1010abc38:     	add	x8, x8, #0x490
1010abc3c:     	add	x8, x8, #0x10
1010abc40:     	str	x8, [sp, #0x18]
1010abc44:     	adrp	x8, 0x1063fe000 <__ZTV16GHOST_WindowNULL+0x38>
1010abc48:     	add	x8, x8, #0xd50
1010abc4c:     	add	x8, x8, #0x10
1010abc50:     	str	x8, [sp, #0x20]
1010abc54:     	b	0x1010abce4 <-[GHOSTUIWindow generateUserInputEvents:]+0x19c>
1010abc58:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010abc5c:     	ldrsw	x8, [x8, #0xf84]
1010abc60:     	ldr	x8, [x19, x8]
1010abc64:     	ldrb	w9, [x20, #0x6c]
1010abc68:     	cmp	w9, #0x0
1010abc6c:     	ldr	d0, [x20, #0x50]
1010abc70:     	fcvtzs	w9, d0
1010abc74:     	mov	w10, #0x4               ; =4
1010abc78:     	mov	w11, #0x6               ; =6
1010abc7c:     	csel	w10, w11, w10, ne
1010abc80:     	ldr	q0, [x20, #0x30]
1010abc84:     	fcvtzs.2d	v0, v0
1010abc88:     	xtn.2s	v0, v0
1010abc8c:     	mov	w11, #0x5               ; =5
1010abc90:     	str	w11, [x23, #0x8]
1010abc94:     	stp	x0, x8, [x23, #0x10]
1010abc98:     	adrp	x8, 0x1063ff000 <__ZTV12GHOST_Window+0x88>
1010abc9c:     	add	x8, x8, #0x438
1010abca0:     	add	x8, x8, #0x10
1010abca4:     	str	x8, [x23]
1010abca8:     	mov	x8, x23
1010abcac:     	str	w10, [x8, #0x28]!
1010abcb0:     	stur	d0, [x23, #0x2c]
1010abcb4:     	stp	w9, wzr, [x23, #0x34]
1010abcb8:     	strh	wzr, [x23, #0x3c]
1010abcbc:     	mov	w9, #0x2                ; =2
1010abcc0:     	str	w9, [x23, #0x40]
1010abcc4:     	str	x8, [x23, #0x20]
1010abcc8:     	mov	x0, x22
1010abccc:     	mov	x1, x23
1010abcd0:     	bl	0x10109a124 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010abcd4:     	add	x26, x26, #0x1
1010abcd8:     	ldrsw	x8, [x20, #0x28]
1010abcdc:     	cmp	x26, x8
1010abce0:     	b.ge	0x1010ac744 <-[GHOSTUIWindow generateUserInputEvents:]+0xbfc>
1010abce4:     	ldr	w22, [x20, x26, lsl #2]
1010abce8:     	cmp	w22, #0x4
1010abcec:     	b.gt	0x1010abd50 <-[GHOSTUIWindow generateUserInputEvents:]+0x208>
1010abcf0:     	cmp	w22, #0x1
1010abcf4:     	b.le	0x1010abdd8 <-[GHOSTUIWindow generateUserInputEvents:]+0x290>
1010abcf8:     	cmp	w22, #0x2
1010abcfc:     	b.eq	0x1010ac2bc <-[GHOSTUIWindow generateUserInputEvents:]+0x774>
1010abd00:     	cmp	w22, #0x3
1010abd04:     	b.eq	0x1010abfa0 <-[GHOSTUIWindow generateUserInputEvents:]+0x458>
1010abd08:     	cmp	w22, #0x4
1010abd0c:     	b.ne	0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010abd10:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010abd14:     	ldrsw	x24, [x8, #0xf80]
1010abd18:     	ldr	x22, [x19, x24]
1010abd1c:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010abd20:     	add	x8, x8, #0x750
1010abd24:     	ldr	x8, [x8]
1010abd28:     	mov	w0, #0x48               ; =72
1010abd2c:     	mov	w1, #0x10               ; =16
1010abd30:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010abd34:     	add	x2, x2, #0xc2a
1010abd38:     	mov	w3, #0x1                ; =1
1010abd3c:     	blr	x8
1010abd40:     	mov	x23, x0
1010abd44:     	ldr	x0, [x19, x24]
1010abd48:     	bl	0x101096204 <_GHOST_GetMilliSeconds>
1010abd4c:     	b	0x1010abc58 <-[GHOSTUIWindow generateUserInputEvents:]+0x110>
1010abd50:     	sub	w8, w22, #0x5
1010abd54:     	cmp	w8, #0x2
1010abd58:     	b.lo	0x1010abe78 <-[GHOSTUIWindow generateUserInputEvents:]+0x330>
1010abd5c:     	cmp	w22, #0x7
1010abd60:     	b.eq	0x1010ac17c <-[GHOSTUIWindow generateUserInputEvents:]+0x634>
1010abd64:     	cmp	w22, #0x8
1010abd68:     	b.ne	0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010abd6c:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010abd70:     	ldrsw	x24, [x8, #0xf80]
1010abd74:     	ldr	x22, [x19, x24]
1010abd78:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010abd7c:     	add	x8, x8, #0x750
1010abd80:     	ldr	x8, [x8]
1010abd84:     	mov	w0, #0x28               ; =40
1010abd88:     	mov	w1, #0x10               ; =16
1010abd8c:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010abd90:     	add	x2, x2, #0xc2a
1010abd94:     	mov	w3, #0x1                ; =1
1010abd98:     	blr	x8
1010abd9c:     	mov	x23, x0
1010abda0:     	ldr	x0, [x19, x24]
1010abda4:     	ldr	x8, [x0]
1010abda8:     	ldr	x8, [x8, #0x10]
1010abdac:     	blr	x8
1010abdb0:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010abdb4:     	ldrsw	x8, [x8, #0xf84]
1010abdb8:     	ldr	x8, [x19, x8]
1010abdbc:     	ldr	x9, [sp, #0x20]
1010abdc0:     	str	x9, [x23]
1010abdc4:     	mov	w9, #0xa                ; =10
1010abdc8:     	str	w9, [x23, #0x8]
1010abdcc:     	stp	x0, x8, [x23, #0x10]
1010abdd0:     	str	xzr, [x23, #0x20]
1010abdd4:     	b	0x1010abcc8 <-[GHOSTUIWindow generateUserInputEvents:]+0x180>
1010abdd8:     	cbz	w22, 0x1010abe78 <-[GHOSTUIWindow generateUserInputEvents:]+0x330>
1010abddc:     	cmp	w22, #0x1
1010abde0:     	b.ne	0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010abde4:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010abde8:     	ldrsw	x24, [x8, #0xf80]
1010abdec:     	ldr	x22, [x19, x24]
1010abdf0:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010abdf4:     	add	x8, x8, #0x750
1010abdf8:     	ldr	x8, [x8]
1010abdfc:     	mov	w0, #0x48               ; =72
1010abe00:     	mov	w1, #0x10               ; =16
1010abe04:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010abe08:     	add	x2, x2, #0xc2a
1010abe0c:     	mov	w3, #0x1                ; =1
1010abe10:     	blr	x8
1010abe14:     	mov	x23, x0
1010abe18:     	ldr	x0, [x19, x24]
1010abe1c:     	bl	0x101096204 <_GHOST_GetMilliSeconds>
1010abe20:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010abe24:     	ldrsw	x8, [x8, #0xf84]
1010abe28:     	ldr	x8, [x19, x8]
1010abe2c:     	ldrb	w9, [x20, #0x6d]
1010abe30:     	ldp	q0, q1, [x20, #0x30]
1010abe34:     	fcvtzs.2d	v1, v1
1010abe38:     	fcvtzs.2d	v0, v0
1010abe3c:     	uzp1.4s	v0, v0, v1
1010abe40:     	mov	w10, #0x5               ; =5
1010abe44:     	str	w10, [x23, #0x8]
1010abe48:     	stp	x0, x8, [x23, #0x10]
1010abe4c:     	mov	x8, x23
1010abe50:     	mov	w10, #0x1               ; =1
1010abe54:     	str	w10, [x8, #0x28]!
1010abe58:     	ldr	x11, [sp, #0x28]
1010abe5c:     	str	x11, [x23]
1010abe60:     	stur	q0, [x23, #0x2c]
1010abe64:     	strb	wzr, [x23, #0x3c]
1010abe68:     	strb	w9, [x23, #0x3d]
1010abe6c:     	mov	w21, #0x1               ; =1
1010abe70:     	str	w10, [x23, #0x40]
1010abe74:     	b	0x1010abcc4 <-[GHOSTUIWindow generateUserInputEvents:]+0x17c>
1010abe78:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010abe7c:     	ldrsw	x28, [x8, #0x10]
1010abe80:     	ldrb	w8, [x19, x28]
1010abe84:     	cmp	w8, #0x1
1010abe88:     	b.ne	0x1010abf44 <-[GHOSTUIWindow generateUserInputEvents:]+0x3fc>
1010abe8c:     	ldr	w8, [sp, #0x48]
1010abe90:     	cbz	w8, 0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010abe94:     	ldr	q0, [sp, #0x50]
1010abe98:     	fmov	x8, d0
1010abe9c:     	cbz	x8, 0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010abea0:     	mov.d	x8, v0[1]
1010abea4:     	ldr	x9, [sp, #0x60]
1010abea8:     	cmp	x8, #0x0
1010abeac:     	ccmp	x9, #0x0, #0x4, ne
1010abeb0:     	b.eq	0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010abeb4:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010abeb8:     	ldrsw	x8, [x8, #0x28]
1010abebc:     	add	x8, x19, x8
1010abec0:     	ldr	x10, [x8]
1010abec4:     	cbz	x10, 0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010abec8:     	ldur	q1, [x8, #0x8]
1010abecc:     	fmov	d2, x10
1010abed0:     	mov.d	v2[1], v1[0]
1010abed4:     	cmtst.2d	v3, v1, v1
1010abed8:     	xtn.2s	v3, v3
1010abedc:     	uzp1.4h	v3, v3, v0
1010abee0:     	cmeq.2d	v0, v0, v2
1010abee4:     	xtn.2s	v0, v0
1010abee8:     	uzp1.4h	v0, v0, v0
1010abeec:     	mov.s	v3[1], v0[1]
1010abef0:     	shl.4h	v0, v3, #0xf
1010abef4:     	cmlt.4h	v0, v0, #0
1010abef8:     	and.8b	v0, v0, v8
1010abefc:     	addv.4h	h0, v0
1010abf00:     	fmov	w10, s0
1010abf04:     	and	w10, w10, #0xff
1010abf08:     	mov.d	x11, v1[1]
1010abf0c:     	mov	w12, #0xf               ; =15
1010abf10:     	bic	w10, w12, w10
1010abf14:     	cmp	w10, #0x0
1010abf18:     	ccmp	x9, x11, #0x0, eq
1010abf1c:     	b.ne	0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010abf20:     	ldr	w9, [sp, #0x68]
1010abf24:     	ldr	w10, [x8, #0x18]
1010abf28:     	cmp	w9, w10
1010abf2c:     	b.ne	0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010abf30:     	ldr	w9, [sp, #0x6c]
1010abf34:     	ldr	w8, [x8, #0x1c]
1010abf38:     	cmp	w9, w8
1010abf3c:     	b.ne	0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010abf40:     	b	0x1010abf88 <-[GHOSTUIWindow generateUserInputEvents:]+0x440>
1010abf44:     	ldr	w8, [sp, #0x48]
1010abf48:     	cbz	w8, 0x1010abf88 <-[GHOSTUIWindow generateUserInputEvents:]+0x440>
1010abf4c:     	ldr	x8, [sp, #0x50]
1010abf50:     	adrp	x9, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010abf54:     	ldrsw	x9, [x9, #0x14]
1010abf58:     	ldr	x9, [x19, x9]
1010abf5c:     	cmp	x8, x9
1010abf60:     	b.ls	0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010abf64:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010abf68:     	ldrsw	x8, [x8, #0xf84]
1010abf6c:     	ldr	x0, [x19, x8]
1010abf70:     	add	x1, sp, #0x50
1010abf74:     	bl	0x100b5bca8 <__ZN5ghost3ios24pencil_paint_ticket_liveEPKvRKNS0_18PencilPaintContactE>
1010abf78:     	cmp	w22, #0x6
1010abf7c:     	eor	w8, w0, #0x1
1010abf80:     	csinc	w8, w8, wzr, ne
1010abf84:     	tbnz	w8, #0x0, 0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010abf88:     	cmp	w22, #0x2
1010abf8c:     	b.le	0x1010ac2b0 <-[GHOSTUIWindow generateUserInputEvents:]+0x768>
1010abf90:     	cmp	w22, #0x4
1010abf94:     	b.gt	0x1010ac34c <-[GHOSTUIWindow generateUserInputEvents:]+0x804>
1010abf98:     	cmp	w22, #0x3
1010abf9c:     	b.ne	0x1010abd10 <-[GHOSTUIWindow generateUserInputEvents:]+0x1c8>
1010abfa0:     	ldp	d0, d1, [x20, #0x40]
1010abfa4:     	fmul	d0, d0, d9
1010abfa8:     	adrp	x8, 0x107f02000 <__ZZN7blender4drawL21get_coarse_tan_formatEvE6format+0x158>
1010abfac:     	ldr	d2, [x8, #0xba8]
1010abfb0:     	fadd	d0, d2, d0
1010abfb4:     	fmul	d1, d1, d9
1010abfb8:     	adrp	x9, 0x107f02000 <__ZZN7blender4drawL21get_coarse_tan_formatEvE6format+0x158>
1010abfbc:     	ldr	d2, [x9, #0xbb0]
1010abfc0:     	fcvtzs	w27, d0
1010abfc4:     	fadd	d1, d2, d1
1010abfc8:     	fcvtzs	w24, d1
1010abfcc:     	scvtf	d2, w27
1010abfd0:     	fsub	d0, d0, d2
1010abfd4:     	str	d0, [x8, #0xba8]
1010abfd8:     	scvtf	d0, w24
1010abfdc:     	fsub	d0, d1, d0
1010abfe0:     	str	d0, [x9, #0xbb0]
1010abfe4:     	orr	w8, w27, w24
1010abfe8:     	cbz	w8, 0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010abfec:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010abff0:     	ldrsw	x28, [x8, #0xf80]
1010abff4:     	ldr	x23, [x19, x28]
1010abff8:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010abffc:     	add	x8, x8, #0x750
1010ac000:     	ldr	x8, [x8]
1010ac004:     	mov	w0, #0x38               ; =56
1010ac008:     	mov	w1, #0x10               ; =16
1010ac00c:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010ac010:     	add	x2, x2, #0xc2a
1010ac014:     	mov	w3, #0x1                ; =1
1010ac018:     	blr	x8
1010ac01c:     	mov	x22, x0
1010ac020:     	ldr	x0, [x19, x28]
1010ac024:     	bl	0x101096204 <_GHOST_GetMilliSeconds>
1010ac028:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010ac02c:     	ldrsw	x25, [x8, #0xf84]
1010ac030:     	ldr	x8, [x19, x25]
1010ac034:     	mov	w9, #0xf                ; =15
1010ac038:     	str	w9, [x22, #0x8]
1010ac03c:     	stp	x0, x8, [x22, #0x10]
1010ac040:     	ldr	x8, [sp, #0x18]
1010ac044:     	str	x8, [x22]
1010ac048:     	mov	x8, x22
1010ac04c:     	mov	w9, #0x100              ; =256
1010ac050:     	str	w9, [x8, #0x28]!
1010ac054:     	strb	wzr, [x22, #0x2c]
1010ac058:     	strb	wzr, [x22, #0x32]
1010ac05c:     	str	x8, [x22, #0x20]
1010ac060:     	mov	x0, x23
1010ac064:     	mov	x1, x22
1010ac068:     	bl	0x10109a124 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010ac06c:     	ldr	x22, [x19, x28]
1010ac070:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac074:     	add	x8, x8, #0x750
1010ac078:     	ldr	x8, [x8]
1010ac07c:     	mov	w0, #0x48               ; =72
1010ac080:     	mov	w1, #0x10               ; =16
1010ac084:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010ac088:     	add	x2, x2, #0xc2a
1010ac08c:     	mov	w3, #0x1                ; =1
1010ac090:     	blr	x8
1010ac094:     	mov	x23, x0
1010ac098:     	ldr	x0, [x19, x28]
1010ac09c:     	bl	0x101096204 <_GHOST_GetMilliSeconds>
1010ac0a0:     	ldr	x8, [x19, x25]
1010ac0a4:     	ldur	q0, [x20, #0x30]
1010ac0a8:     	fcvtzs.2d	v0, v0
1010ac0ac:     	xtn.2s	v0, v0
1010ac0b0:     	mov	w9, #0x5                ; =5
1010ac0b4:     	str	w9, [x23, #0x8]
1010ac0b8:     	stp	x0, x8, [x23, #0x10]
1010ac0bc:     	adrp	x8, 0x1063ff000 <__ZTV12GHOST_Window+0x88>
1010ac0c0:     	add	x8, x8, #0x438
1010ac0c4:     	add	x8, x8, #0x10
1010ac0c8:     	str	x8, [x23]
1010ac0cc:     	mov	x8, x23
1010ac0d0:     	mov	w9, #0x1                ; =1
1010ac0d4:     	str	w9, [x8, #0x28]!
1010ac0d8:     	stur	d0, [x23, #0x2c]
1010ac0dc:     	stp	w27, w24, [x23, #0x34]
1010ac0e0:     	mov	w21, #0x1               ; =1
1010ac0e4:     	strh	w9, [x23, #0x3c]
1010ac0e8:     	mov	w9, #0x2                ; =2
1010ac0ec:     	str	w9, [x23, #0x40]
1010ac0f0:     	str	x8, [x23, #0x20]
1010ac0f4:     	mov	x0, x22
1010ac0f8:     	mov	x1, x23
1010ac0fc:     	bl	0x10109a124 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010ac100:     	ldr	x22, [x19, x28]
1010ac104:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac108:     	add	x8, x8, #0x750
1010ac10c:     	ldr	x8, [x8]
1010ac110:     	mov	w0, #0x38               ; =56
1010ac114:     	mov	w1, #0x10               ; =16
1010ac118:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010ac11c:     	add	x2, x2, #0xc2a
1010ac120:     	mov	w3, #0x1                ; =1
1010ac124:     	blr	x8
1010ac128:     	mov	x23, x0
1010ac12c:     	ldr	x0, [x19, x28]
1010ac130:     	bl	0x101096204 <_GHOST_GetMilliSeconds>
1010ac134:     	ldr	x8, [x19, x25]
1010ac138:     	mov	w9, #0x10               ; =16
1010ac13c:     	str	w9, [x23, #0x8]
1010ac140:     	stp	x0, x8, [x23, #0x10]
1010ac144:     	adrp	x8, 0x1063ff000 <__ZTV12GHOST_Window+0x88>
1010ac148:     	add	x8, x8, #0x490
1010ac14c:     	add	x8, x8, #0x10
1010ac150:     	str	x8, [x23]
1010ac154:     	mov	x8, x23
1010ac158:     	mov	w9, #0x100              ; =256
1010ac15c:     	str	w9, [x8, #0x28]!
1010ac160:     	strb	wzr, [x23, #0x2c]
1010ac164:     	strb	wzr, [x23, #0x32]
1010ac168:     	str	x8, [x23, #0x20]
1010ac16c:     	mov	x0, x22
1010ac170:     	mov	x1, x23
1010ac174:     	bl	0x10109a124 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010ac178:     	b	0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010ac17c:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010ac180:     	ldrsw	x24, [x8, #0xf80]
1010ac184:     	ldr	x22, [x19, x24]
1010ac188:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac18c:     	add	x8, x8, #0x750
1010ac190:     	ldr	x8, [x8]
1010ac194:     	mov	w0, #0x80               ; =128
1010ac198:     	mov	w1, #0x10               ; =16
1010ac19c:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010ac1a0:     	add	x2, x2, #0xc2a
1010ac1a4:     	mov	w3, #0x1                ; =1
1010ac1a8:     	blr	x8
1010ac1ac:     	mov	x23, x0
1010ac1b0:     	ldr	x0, [x19, x24]
1010ac1b4:     	bl	0x101096204 <_GHOST_GetMilliSeconds>
1010ac1b8:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010ac1bc:     	ldrsw	x25, [x8, #0xf84]
1010ac1c0:     	ldr	x8, [x19, x25]
1010ac1c4:     	mov	w9, #0x2                ; =2
1010ac1c8:     	str	w9, [x23, #0x8]
1010ac1cc:     	stp	x0, x8, [x23, #0x10]
1010ac1d0:     	adrp	x8, 0x1063fe000 <__ZTV16GHOST_WindowNULL+0x38>
1010ac1d4:     	add	x8, x8, #0xe40
1010ac1d8:     	add	x8, x8, #0x10
1010ac1dc:     	str	x8, [x23]
1010ac1e0:     	mov	x8, x23
1010ac1e4:     	mov	w9, #0x3                ; =3
1010ac1e8:     	str	w9, [x8, #0x28]!
1010ac1ec:     	adrp	x9, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010ac1f0:     	add	x9, x9, #0x544
1010ac1f4:     	ldr	q0, [x9]
1010ac1f8:     	str	q0, [sp, #0x30]
1010ac1fc:     	stur	q0, [x23, #0x2c]
1010ac200:     	strh	wzr, [x23, #0x3c]
1010ac204:     	stp	xzr, xzr, [x23, #0x40]
1010ac208:     	strb	wzr, [x23, #0x50]
1010ac20c:     	movi.16b	v0, #0x0
1010ac210:     	stur	q0, [x23, #0x58]
1010ac214:     	stur	q0, [x23, #0x68]
1010ac218:     	str	xzr, [x23, #0x78]
1010ac21c:     	str	x8, [x23, #0x20]
1010ac220:     	mov	x0, x22
1010ac224:     	mov	x1, x23
1010ac228:     	bl	0x10109a124 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010ac22c:     	ldr	x22, [x19, x24]
1010ac230:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac234:     	add	x8, x8, #0x750
1010ac238:     	ldr	x8, [x8]
1010ac23c:     	mov	w0, #0x80               ; =128
1010ac240:     	mov	w1, #0x10               ; =16
1010ac244:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010ac248:     	add	x2, x2, #0xc2a
1010ac24c:     	mov	w3, #0x1                ; =1
1010ac250:     	blr	x8
1010ac254:     	mov	x23, x0
1010ac258:     	ldr	x0, [x19, x24]
1010ac25c:     	bl	0x101096204 <_GHOST_GetMilliSeconds>
1010ac260:     	ldr	x8, [x19, x25]
1010ac264:     	mov	w9, #0x3                ; =3
1010ac268:     	str	w9, [x23, #0x8]
1010ac26c:     	stp	x0, x8, [x23, #0x10]
1010ac270:     	adrp	x8, 0x1063fe000 <__ZTV16GHOST_WindowNULL+0x38>
1010ac274:     	add	x8, x8, #0xe40
1010ac278:     	add	x8, x8, #0x10
1010ac27c:     	str	x8, [x23]
1010ac280:     	mov	x8, x23
1010ac284:     	str	w9, [x8, #0x28]!
1010ac288:     	ldr	q0, [sp, #0x30]
1010ac28c:     	stur	q0, [x23, #0x2c]
1010ac290:     	strh	wzr, [x23, #0x3c]
1010ac294:     	stp	xzr, xzr, [x23, #0x40]
1010ac298:     	strb	wzr, [x23, #0x50]
1010ac29c:     	movi.16b	v0, #0x0
1010ac2a0:     	stur	q0, [x23, #0x58]
1010ac2a4:     	stur	q0, [x23, #0x68]
1010ac2a8:     	str	xzr, [x23, #0x78]
1010ac2ac:     	b	0x1010abcc4 <-[GHOSTUIWindow generateUserInputEvents:]+0x17c>
1010ac2b0:     	cbz	w22, 0x1010ac478 <-[GHOSTUIWindow generateUserInputEvents:]+0x930>
1010ac2b4:     	cmp	w22, #0x1
1010ac2b8:     	b.eq	0x1010abde4 <-[GHOSTUIWindow generateUserInputEvents:]+0x29c>
1010ac2bc:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010ac2c0:     	ldrsw	x24, [x8, #0xf80]
1010ac2c4:     	ldr	x22, [x19, x24]
1010ac2c8:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac2cc:     	add	x8, x8, #0x750
1010ac2d0:     	ldr	x8, [x8]
1010ac2d4:     	mov	w0, #0x48               ; =72
1010ac2d8:     	mov	w1, #0x10               ; =16
1010ac2dc:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010ac2e0:     	add	x2, x2, #0xc2a
1010ac2e4:     	mov	w3, #0x1                ; =1
1010ac2e8:     	blr	x8
1010ac2ec:     	mov	x23, x0
1010ac2f0:     	ldr	x0, [x19, x24]
1010ac2f4:     	bl	0x101096204 <_GHOST_GetMilliSeconds>
1010ac2f8:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010ac2fc:     	ldrsw	x8, [x8, #0xf84]
1010ac300:     	ldr	x8, [x19, x8]
1010ac304:     	ldp	q0, q1, [x20, #0x30]
1010ac308:     	fcvtzs.2d	v1, v1
1010ac30c:     	fcvtzs.2d	v0, v0
1010ac310:     	uzp1.4s	v0, v0, v1
1010ac314:     	mov	w9, #0x5                ; =5
1010ac318:     	str	w9, [x23, #0x8]
1010ac31c:     	stp	x0, x8, [x23, #0x10]
1010ac320:     	adrp	x8, 0x1063ff000 <__ZTV12GHOST_Window+0x88>
1010ac324:     	add	x8, x8, #0x438
1010ac328:     	add	x8, x8, #0x10
1010ac32c:     	str	x8, [x23]
1010ac330:     	mov	x8, x23
1010ac334:     	mov	w9, #0x1                ; =1
1010ac338:     	str	w9, [x8, #0x28]!
1010ac33c:     	stur	q0, [x23, #0x2c]
1010ac340:     	mov	w21, #0x1               ; =1
1010ac344:     	strh	w9, [x23, #0x3c]
1010ac348:     	b	0x1010abcbc <-[GHOSTUIWindow generateUserInputEvents:]+0x174>
1010ac34c:     	cmp	w22, #0x5
1010ac350:     	b.ne	0x1010ac628 <-[GHOSTUIWindow generateUserInputEvents:]+0xae0>
1010ac354:     	ldr	w8, [sp, #0x48]
1010ac358:     	cbz	w8, 0x1010ac37c <-[GHOSTUIWindow generateUserInputEvents:]+0x834>
1010ac35c:     	ldrb	w8, [x19, x28]
1010ac360:     	tbnz	w8, #0x0, 0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010ac364:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010ac368:     	ldrsw	x8, [x8, #0xf84]
1010ac36c:     	ldr	x0, [x19, x8]
1010ac370:     	add	x1, sp, #0x50
1010ac374:     	bl	0x100b5bca8 <__ZN5ghost3ios24pencil_paint_ticket_liveEPKvRKNS0_18PencilPaintContactE>
1010ac378:     	cbz	w0, 0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010ac37c:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010ac380:     	ldrsw	x24, [x8, #0xf80]
1010ac384:     	ldr	x23, [x19, x24]
1010ac388:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac38c:     	add	x8, x8, #0x750
1010ac390:     	ldr	x8, [x8]
1010ac394:     	mov	w0, #0x80               ; =128
1010ac398:     	mov	w1, #0x10               ; =16
1010ac39c:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010ac3a0:     	add	x2, x2, #0xc2a
1010ac3a4:     	mov	w3, #0x1                ; =1
1010ac3a8:     	blr	x8
1010ac3ac:     	mov	x22, x0
1010ac3b0:     	ldr	x0, [x19, x24]
1010ac3b4:     	bl	0x101096204 <_GHOST_GetMilliSeconds>
1010ac3b8:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010ac3bc:     	ldrsw	x8, [x8, #0xf84]
1010ac3c0:     	ldr	x8, [x19, x8]
1010ac3c4:     	ldrb	w9, [x20, #0x6f]
1010ac3c8:     	ldrb	w10, [x20, #0x70]
1010ac3cc:     	ldr	x11, [x20, #0x78]
1010ac3d0:     	ldr	q0, [x20, #0x80]
1010ac3d4:     	mov	x12, x22
1010ac3d8:     	str	w21, [x12, #0x28]!
1010ac3dc:     	ldr	x13, [sp, #0x60]
1010ac3e0:     	ldr	q1, [sp, #0x70]
1010ac3e4:     	stur	q1, [x22, #0x2c]
1010ac3e8:     	strb	wzr, [x22, #0x3c]
1010ac3ec:     	strb	w9, [x22, #0x3d]
1010ac3f0:     	str	q0, [x22, #0x40]
1010ac3f4:     	strb	w10, [x22, #0x50]
1010ac3f8:     	str	x11, [x22, #0x58]
1010ac3fc:     	ldr	q0, [sp, #0x50]
1010ac400:     	str	q0, [x22, #0x60]
1010ac404:     	str	x13, [x22, #0x70]
1010ac408:     	ldr	d0, [sp, #0x68]
1010ac40c:     	mov	w9, #0x2                ; =2
1010ac410:     	str	w9, [x22, #0x8]
1010ac414:     	stp	x0, x8, [x22, #0x10]
1010ac418:     	ldr	x8, [sp, #0x8]
1010ac41c:     	str	x8, [x22]
1010ac420:     	str	d0, [x22, #0x78]
1010ac424:     	str	x12, [x22, #0x20]
1010ac428:     	mov	x0, x23
1010ac42c:     	mov	x1, x22
1010ac430:     	bl	0x10109a124 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010ac434:     	ldr	w8, [sp, #0x48]
1010ac438:     	cbz	w8, 0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010ac43c:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ac440:     	ldrsw	x8, [x8, #0x28]
1010ac444:     	add	x8, x19, x8
1010ac448:     	ldp	q0, q1, [sp, #0x50]
1010ac44c:     	stp	q0, q1, [x8]
1010ac450:     	strb	w21, [x19, x28]
1010ac454:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ac458:     	ldrsw	x8, [x8, #0x20]
1010ac45c:     	ldur	q0, [x20, #0x30]
1010ac460:     	str	q0, [x19, x8]
1010ac464:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ac468:     	ldrsw	x8, [x8, #0x24]
1010ac46c:     	ldr	q0, [sp, #0x70]
1010ac470:     	str	q0, [x19, x8]
1010ac474:     	b	0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010ac478:     	ldrb	w8, [x20, #0x58]
1010ac47c:     	adrp	x9, 0x106627000 <_zlibVersion+0x106627000>
1010ac480:     	ldrsw	x24, [x9, #0xf80]
1010ac484:     	tbz	w8, #0x0, 0x1010ac4b4 <-[GHOSTUIWindow generateUserInputEvents:]+0x96c>
1010ac488:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ac48c:     	ldrsw	x8, [x8, #0x18]
1010ac490:     	ldur	q0, [x20, #0x30]
1010ac494:     	str	q0, [x19, x8]
1010ac498:     	ldr	x0, [x19, x24]
1010ac49c:     	ldr	x8, [x0]
1010ac4a0:     	ldr	x8, [x8, #0x10]
1010ac4a4:     	blr	x8
1010ac4a8:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ac4ac:     	ldrsw	x8, [x8, #0x1c]
1010ac4b0:     	str	x0, [x19, x8]
1010ac4b4:     	ldr	x23, [x19, x24]
1010ac4b8:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac4bc:     	add	x8, x8, #0x750
1010ac4c0:     	ldr	x8, [x8]
1010ac4c4:     	mov	w0, #0x88               ; =136
1010ac4c8:     	mov	w1, #0x10               ; =16
1010ac4cc:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010ac4d0:     	add	x2, x2, #0xc2a
1010ac4d4:     	mov	w3, #0x1                ; =1
1010ac4d8:     	blr	x8
1010ac4dc:     	mov	x22, x0
1010ac4e0:     	ldr	x0, [x19, x24]
1010ac4e4:     	bl	0x101096204 <_GHOST_GetMilliSeconds>
1010ac4e8:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010ac4ec:     	ldrsw	x8, [x8, #0xf84]
1010ac4f0:     	ldr	x8, [x19, x8]
1010ac4f4:     	ldrb	w9, [x20, #0x6f]
1010ac4f8:     	ldrb	w10, [x20, #0x70]
1010ac4fc:     	ldr	x11, [x20, #0x78]
1010ac500:     	ldr	x12, [sp, #0x60]
1010ac504:     	ldr	q0, [x20, #0x80]
1010ac508:     	ldr	q1, [x20, #0x30]
1010ac50c:     	fcvtzs.2d	v1, v1
1010ac510:     	xtn.2s	v1, v1
1010ac514:     	mov	x13, x22
1010ac518:     	str	d1, [x13, #0x28]!
1010ac51c:     	ldr	q1, [sp, #0x70]
1010ac520:     	str	q1, [x22, #0x30]
1010ac524:     	strb	w9, [x22, #0x40]
1010ac528:     	stur	q0, [x22, #0x48]
1010ac52c:     	strb	w10, [x22, #0x58]
1010ac530:     	str	x11, [x22, #0x60]
1010ac534:     	ldr	q0, [sp, #0x50]
1010ac538:     	stur	q0, [x22, #0x68]
1010ac53c:     	str	x12, [x22, #0x78]
1010ac540:     	ldr	d0, [sp, #0x68]
1010ac544:     	str	w21, [x22, #0x8]
1010ac548:     	stp	x0, x8, [x22, #0x10]
1010ac54c:     	ldr	x8, [sp, #0x10]
1010ac550:     	str	x8, [x22]
1010ac554:     	str	d0, [x22, #0x80]
1010ac558:     	str	x13, [x22, #0x20]
1010ac55c:     	mov	x0, x23
1010ac560:     	mov	x1, x22
1010ac564:     	bl	0x10109a124 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010ac568:     	ldr	w8, [sp, #0x48]
1010ac56c:     	cbz	w8, 0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010ac570:     	ldrb	w8, [x19, x28]
1010ac574:     	cmp	w8, #0x1
1010ac578:     	b.ne	0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010ac57c:     	ldr	q0, [sp, #0x50]
1010ac580:     	fmov	x8, d0
1010ac584:     	cbz	x8, 0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010ac588:     	mov.d	x8, v0[1]
1010ac58c:     	cbz	x8, 0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010ac590:     	ldr	x9, [sp, #0x60]
1010ac594:     	cbz	x9, 0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010ac598:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ac59c:     	ldrsw	x8, [x8, #0x28]
1010ac5a0:     	add	x8, x19, x8
1010ac5a4:     	ldr	x10, [x8]
1010ac5a8:     	cbz	x10, 0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010ac5ac:     	ldur	q1, [x8, #0x8]
1010ac5b0:     	fmov	d2, x10
1010ac5b4:     	mov.d	v2[1], v1[0]
1010ac5b8:     	cmtst.2d	v3, v1, v1
1010ac5bc:     	xtn.2s	v3, v3
1010ac5c0:     	uzp1.4h	v3, v3, v0
1010ac5c4:     	cmeq.2d	v0, v0, v2
1010ac5c8:     	xtn.2s	v0, v0
1010ac5cc:     	uzp1.4h	v0, v0, v0
1010ac5d0:     	mov.s	v3[1], v0[1]
1010ac5d4:     	shl.4h	v0, v3, #0xf
1010ac5d8:     	cmlt.4h	v0, v0, #0
1010ac5dc:     	and.8b	v0, v0, v8
1010ac5e0:     	addv.4h	h0, v0
1010ac5e4:     	fmov	w10, s0
1010ac5e8:     	and	w10, w10, #0xff
1010ac5ec:     	mov.d	x11, v1[1]
1010ac5f0:     	mov	w12, #0xf               ; =15
1010ac5f4:     	bic	w10, w12, w10
1010ac5f8:     	cmp	w10, #0x0
1010ac5fc:     	ccmp	x9, x11, #0x0, eq
1010ac600:     	b.ne	0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010ac604:     	ldr	w9, [sp, #0x68]
1010ac608:     	ldr	w10, [x8, #0x18]
1010ac60c:     	cmp	w9, w10
1010ac610:     	b.ne	0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010ac614:     	ldr	w9, [sp, #0x6c]
1010ac618:     	ldr	w8, [x8, #0x1c]
1010ac61c:     	cmp	w9, w8
1010ac620:     	b.ne	0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010ac624:     	b	0x1010ac454 <-[GHOSTUIWindow generateUserInputEvents:]+0x90c>
1010ac628:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010ac62c:     	ldrsw	x24, [x8, #0xf80]
1010ac630:     	ldr	x22, [x19, x24]
1010ac634:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac638:     	add	x8, x8, #0x750
1010ac63c:     	ldr	x8, [x8]
1010ac640:     	mov	w0, #0x80               ; =128
1010ac644:     	mov	w1, #0x10               ; =16
1010ac648:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010ac64c:     	add	x2, x2, #0xc2a
1010ac650:     	mov	w3, #0x1                ; =1
1010ac654:     	blr	x8
1010ac658:     	mov	x23, x0
1010ac65c:     	ldr	x0, [x19, x24]
1010ac660:     	bl	0x101096204 <_GHOST_GetMilliSeconds>
1010ac664:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010ac668:     	ldrsw	x8, [x8, #0xf84]
1010ac66c:     	ldr	x8, [x19, x8]
1010ac670:     	ldrh	w9, [x20, #0x6e]
1010ac674:     	ldrb	w10, [x20, #0x70]
1010ac678:     	ldr	x11, [x20, #0x78]
1010ac67c:     	ldr	q0, [x20, #0x80]
1010ac680:     	mov	x12, x23
1010ac684:     	str	w21, [x12, #0x28]!
1010ac688:     	ldr	x13, [sp, #0x60]
1010ac68c:     	ldr	q1, [sp, #0x70]
1010ac690:     	stur	q1, [x23, #0x2c]
1010ac694:     	strh	w9, [x23, #0x3c]
1010ac698:     	str	q0, [x23, #0x40]
1010ac69c:     	strb	w10, [x23, #0x50]
1010ac6a0:     	str	x11, [x23, #0x58]
1010ac6a4:     	ldr	q0, [sp, #0x50]
1010ac6a8:     	str	q0, [x23, #0x60]
1010ac6ac:     	str	x13, [x23, #0x70]
1010ac6b0:     	ldr	d0, [sp, #0x68]
1010ac6b4:     	mov	w9, #0x3                ; =3
1010ac6b8:     	str	w9, [x23, #0x8]
1010ac6bc:     	stp	x0, x8, [x23, #0x10]
1010ac6c0:     	adrp	x8, 0x1063fe000 <__ZTV16GHOST_WindowNULL+0x38>
1010ac6c4:     	add	x8, x8, #0xe40
1010ac6c8:     	add	x8, x8, #0x10
1010ac6cc:     	str	x8, [x23]
1010ac6d0:     	str	d0, [x23, #0x78]
1010ac6d4:     	str	x12, [x23, #0x20]
1010ac6d8:     	mov	x0, x22
1010ac6dc:     	mov	x1, x23
1010ac6e0:     	bl	0x10109a124 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010ac6e4:     	ldr	w8, [sp, #0x48]
1010ac6e8:     	cbz	w8, 0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010ac6ec:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ac6f0:     	ldrsw	x8, [x8, #0x20]
1010ac6f4:     	ldur	q0, [x20, #0x30]
1010ac6f8:     	str	q0, [x19, x8]
1010ac6fc:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ac700:     	ldrsw	x8, [x8, #0x24]
1010ac704:     	ldr	q0, [sp, #0x70]
1010ac708:     	str	q0, [x19, x8]
1010ac70c:     	strb	wzr, [x19, x28]
1010ac710:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ac714:     	ldrsw	x8, [x8, #0x14]
1010ac718:     	ldr	x9, [x19, x8]
1010ac71c:     	ldr	x10, [sp, #0x50]
1010ac720:     	cmp	x9, x10
1010ac724:     	csel	x9, x9, x10, hi
1010ac728:     	str	x9, [x19, x8]
1010ac72c:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ac730:     	ldrsw	x8, [x8, #0x28]
1010ac734:     	add	x8, x19, x8
1010ac738:     	movi.16b	v0, #0x0
1010ac73c:     	stp	q0, q0, [x8]
1010ac740:     	b	0x1010abcd4 <-[GHOSTUIWindow generateUserInputEvents:]+0x18c>
1010ac744:     	mov	x0, x19
1010ac748:     	bl	0x104b7630c <_zlibVersion+0x104b7630c>
1010ac74c:     	ldp	x29, x30, [sp, #0xe0]
1010ac750:     	ldp	x20, x19, [sp, #0xd0]
1010ac754:     	ldp	x22, x21, [sp, #0xc0]
1010ac758:     	ldp	x24, x23, [sp, #0xb0]
1010ac75c:     	ldp	x26, x25, [sp, #0xa0]
1010ac760:     	ldp	x28, x27, [sp, #0x90]
1010ac764:     	ldp	d9, d8, [sp, #0x80]
1010ac768:     	add	sp, sp, #0xf0
1010ac76c:     	ret
1010ac770:     	mov	x20, x0
1010ac774:     	cbz	x22, 0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac778:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac77c:     	add	x8, x8, #0x710
1010ac780:     	ldr	x8, [x8]
1010ac784:     	mov	x0, x22
1010ac788:     	mov	w1, #0x1                ; =1
1010ac78c:     	blr	x8
1010ac790:     	b	0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac794:     	bl	0x1000144bc <___clang_call_terminate>
1010ac798:     	mov	x20, x0
1010ac79c:     	cbz	x22, 0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac7a0:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac7a4:     	add	x8, x8, #0x710
1010ac7a8:     	ldr	x8, [x8]
1010ac7ac:     	mov	x0, x22
1010ac7b0:     	mov	w1, #0x1                ; =1
1010ac7b4:     	blr	x8
1010ac7b8:     	b	0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac7bc:     	bl	0x1000144bc <___clang_call_terminate>
1010ac7c0:     	mov	x20, x0
1010ac7c4:     	cbz	x23, 0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac7c8:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac7cc:     	add	x8, x8, #0x710
1010ac7d0:     	ldr	x8, [x8]
1010ac7d4:     	mov	x0, x23
1010ac7d8:     	mov	w1, #0x1                ; =1
1010ac7dc:     	blr	x8
1010ac7e0:     	b	0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac7e4:     	bl	0x1000144bc <___clang_call_terminate>
1010ac7e8:     	mov	x20, x0
1010ac7ec:     	cbz	x23, 0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac7f0:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac7f4:     	add	x8, x8, #0x710
1010ac7f8:     	ldr	x8, [x8]
1010ac7fc:     	mov	x0, x23
1010ac800:     	mov	w1, #0x1                ; =1
1010ac804:     	blr	x8
1010ac808:     	b	0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac80c:     	bl	0x1000144bc <___clang_call_terminate>
1010ac810:     	mov	x20, x0
1010ac814:     	cbz	x23, 0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac818:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac81c:     	add	x8, x8, #0x710
1010ac820:     	ldr	x8, [x8]
1010ac824:     	mov	x0, x23
1010ac828:     	mov	w1, #0x1                ; =1
1010ac82c:     	blr	x8
1010ac830:     	b	0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac834:     	bl	0x1000144bc <___clang_call_terminate>
1010ac838:     	mov	x20, x0
1010ac83c:     	cbz	x22, 0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac840:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac844:     	add	x8, x8, #0x710
1010ac848:     	ldr	x8, [x8]
1010ac84c:     	mov	x0, x22
1010ac850:     	mov	w1, #0x1                ; =1
1010ac854:     	blr	x8
1010ac858:     	b	0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac85c:     	bl	0x1000144bc <___clang_call_terminate>
1010ac860:     	mov	x20, x0
1010ac864:     	cbz	x23, 0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac868:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac86c:     	add	x8, x8, #0x710
1010ac870:     	ldr	x8, [x8]
1010ac874:     	mov	x0, x23
1010ac878:     	mov	w1, #0x1                ; =1
1010ac87c:     	blr	x8
1010ac880:     	b	0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac884:     	bl	0x1000144bc <___clang_call_terminate>
1010ac888:     	mov	x20, x0
1010ac88c:     	cbz	x23, 0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac890:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac894:     	add	x8, x8, #0x710
1010ac898:     	ldr	x8, [x8]
1010ac89c:     	mov	x0, x23
1010ac8a0:     	mov	w1, #0x1                ; =1
1010ac8a4:     	blr	x8
1010ac8a8:     	b	0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac8ac:     	bl	0x1000144bc <___clang_call_terminate>
1010ac8b0:     	mov	x20, x0
1010ac8b4:     	cbz	x23, 0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac8b8:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac8bc:     	add	x8, x8, #0x710
1010ac8c0:     	ldr	x8, [x8]
1010ac8c4:     	mov	x0, x23
1010ac8c8:     	mov	w1, #0x1                ; =1
1010ac8cc:     	blr	x8
1010ac8d0:     	b	0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac8d4:     	bl	0x1000144bc <___clang_call_terminate>
1010ac8d8:     	mov	x20, x0
1010ac8dc:     	cbz	x23, 0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac8e0:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac8e4:     	add	x8, x8, #0x710
1010ac8e8:     	ldr	x8, [x8]
1010ac8ec:     	mov	x0, x23
1010ac8f0:     	mov	w1, #0x1                ; =1
1010ac8f4:     	blr	x8
1010ac8f8:     	b	0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac8fc:     	bl	0x1000144bc <___clang_call_terminate>
1010ac900:     	mov	x20, x0
1010ac904:     	cbz	x23, 0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac908:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac90c:     	add	x8, x8, #0x710
1010ac910:     	ldr	x8, [x8]
1010ac914:     	mov	x0, x23
1010ac918:     	mov	w1, #0x1                ; =1
1010ac91c:     	blr	x8
1010ac920:     	b	0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac924:     	bl	0x1000144bc <___clang_call_terminate>
1010ac928:     	mov	x20, x0
1010ac92c:     	cbz	x23, 0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac930:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ac934:     	add	x8, x8, #0x710
1010ac938:     	ldr	x8, [x8]
1010ac93c:     	mov	x0, x23
1010ac940:     	mov	w1, #0x1                ; =1
1010ac944:     	blr	x8
1010ac948:     	b	0x1010ac958 <-[GHOSTUIWindow generateUserInputEvents:]+0xe10>
1010ac94c:     	bl	0x1000144bc <___clang_call_terminate>
1010ac950:     	b	0x1010ac954 <-[GHOSTUIWindow generateUserInputEvents:]+0xe0c>
1010ac954:     	mov	x20, x0
1010ac958:     	mov	x0, x19
1010ac95c:     	bl	0x104b7630c <_zlibVersion+0x104b7630c>
1010ac960:     	mov	x0, x20
1010ac964:     	bl	0x104b72c1c <_zlibVersion+0x104b72c1c>
