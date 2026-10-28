
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010af104 <-[GHOSTUIWindow handlePan3f:]>:
1010af104:     	sub	sp, sp, #0x110
1010af108:     	stp	d11, d10, [sp, #0xb0]
1010af10c:     	stp	d9, d8, [sp, #0xc0]
1010af110:     	stp	x28, x27, [sp, #0xd0]
1010af114:     	stp	x22, x21, [sp, #0xe0]
1010af118:     	stp	x20, x19, [sp, #0xf0]
1010af11c:     	stp	x29, x30, [sp, #0x100]
1010af120:     	add	x29, sp, #0x100
1010af124:     	mov	x19, x2
1010af128:     	mov	x20, x0
1010af12c:     	mov	x0, x2
1010af130:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af134:     	cmp	x0, #0x1
1010af138:     	b.ne	0x1010af144 <-[GHOSTUIWindow handlePan3f:]+0x40>
1010af13c:     	mov	x0, x20
1010af140:     	bl	0x104b77820 <_objc_msgSend$cancelPointerCapture>
1010af144:     	bl	0x1010a0738 <__Z29GHOST_IOS_get_flythrough_modev>
1010af148:     	mov	x21, x0
1010af14c:     	mov	x0, x19
1010af150:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af154:     	cbz	w21, 0x1010af184 <-[GHOSTUIWindow handlePan3f:]+0x80>
1010af158:     	cmp	x0, #0x3
1010af15c:     	b.eq	0x1010af288 <-[GHOSTUIWindow handlePan3f:]+0x184>
1010af160:     	mov	x0, x19
1010af164:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af168:     	cmp	x0, #0x4
1010af16c:     	b.eq	0x1010af288 <-[GHOSTUIWindow handlePan3f:]+0x184>
1010af170:     	mov	x0, x19
1010af174:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af178:     	cmp	x0, #0x5
1010af17c:     	b.ne	0x1010af258 <-[GHOSTUIWindow handlePan3f:]+0x154>
1010af180:     	b	0x1010af288 <-[GHOSTUIWindow handlePan3f:]+0x184>
1010af184:     	cmp	x0, #0x1
1010af188:     	b.eq	0x1010af19c <-[GHOSTUIWindow handlePan3f:]+0x98>
1010af18c:     	mov	x0, x19
1010af190:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af194:     	cmp	x0, #0x2
1010af198:     	b.ne	0x1010af278 <-[GHOSTUIWindow handlePan3f:]+0x174>
1010af19c:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010af1a0:     	ldrsw	x21, [x8, #0xf84]
1010af1a4:     	ldr	x2, [x20, x21]
1010af1a8:     	mov	x0, x19
1010af1ac:     	bl	0x104b787a0 <_objc_msgSend$getScaledTranslation:>
1010af1b0:     	fmov	d10, d0
1010af1b4:     	fmov	d11, d1
1010af1b8:     	mov	x0, x19
1010af1bc:     	bl	0x104b78720 <_objc_msgSend$getRelativeTranslation:>
1010af1c0:     	fmov	d8, d0
1010af1c4:     	fmov	d9, d1
1010af1c8:     	mov	x0, x19
1010af1cc:     	fmov	d0, d10
1010af1d0:     	fmov	d1, d11
1010af1d4:     	bl	0x104b7a0c0 <_objc_msgSend$setCachedTranslation:>
1010af1d8:     	adrp	x8, 0x106368000 <_zlibVersion+0x106368000>
1010af1dc:     	ldr	x8, [x8, #0x250]
1010af1e0:     	ldp	d0, d1, [x8]
1010af1e4:     	fcmp	d8, d0
1010af1e8:     	fccmp	d9, d1, #0x0, eq
1010af1ec:     	b.eq	0x1010af258 <-[GHOSTUIWindow handlePan3f:]+0x154>
1010af1f0:     	mov	x22, sp
1010af1f4:     	ldr	x2, [x20, x21]
1010af1f8:     	mov	x0, x19
1010af1fc:     	bl	0x104b78780 <_objc_msgSend$getScaledTouchPoint:>
1010af200:     	adrp	x8, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010af204:     	add	x8, x8, #0x544
1010af208:     	ldr	q2, [x8]
1010af20c:     	stur	q2, [sp, #0x5c]
1010af210:     	str	wzr, [sp, #0x6c]
1010af214:     	strb	wzr, [sp, #0x70]
1010af218:     	movi.16b	v2, #0x0
1010af21c:     	stur	q2, [sp, #0x78]
1010af220:     	stur	q2, [x22, #0x88]
1010af224:     	stur	q2, [x22, #0x98]
1010af228:     	str	xzr, [sp, #0xa8]
1010af22c:     	stp	d0, d1, [sp, #0x30]
1010af230:     	stp	d8, d9, [sp, #0x40]
1010af234:     	str	xzr, [sp, #0x50]
1010af238:     	strh	wzr, [sp, #0x58]
1010af23c:     	mov	w8, #0x3                ; =3
1010af240:     	mov	w9, #0x1                ; =1
1010af244:     	str	w8, [sp]
1010af248:     	str	w9, [sp, #0x28]
1010af24c:     	mov	x2, sp
1010af250:     	mov	x0, x20
1010af254:     	bl	0x104b78620 <_objc_msgSend$generateUserInputEvents:>
1010af258:     	ldp	x29, x30, [sp, #0x100]
1010af25c:     	ldp	x20, x19, [sp, #0xf0]
1010af260:     	ldp	x22, x21, [sp, #0xe0]
1010af264:     	ldp	x28, x27, [sp, #0xd0]
1010af268:     	ldp	d9, d8, [sp, #0xc0]
1010af26c:     	ldp	d11, d10, [sp, #0xb0]
1010af270:     	add	sp, sp, #0x110
1010af274:     	ret
1010af278:     	mov	x0, x19
1010af27c:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010af280:     	cmp	x0, #0x3
1010af284:     	b.ne	0x1010af160 <-[GHOSTUIWindow handlePan3f:]+0x5c>
1010af288:     	adrp	x8, 0x106368000 <_zlibVersion+0x106368000>
1010af28c:     	ldr	x8, [x8, #0x250]
1010af290:     	ldp	d0, d1, [x8]
1010af294:     	mov	x0, x19
1010af298:     	ldp	x29, x30, [sp, #0x100]
1010af29c:     	ldp	x20, x19, [sp, #0xf0]
1010af2a0:     	ldp	x22, x21, [sp, #0xe0]
1010af2a4:     	ldp	x28, x27, [sp, #0xd0]
1010af2a8:     	ldp	d9, d8, [sp, #0xc0]
1010af2ac:     	ldp	d11, d10, [sp, #0xb0]
1010af2b0:     	add	sp, sp, #0x110
1010af2b4:     	b	0x104b7a0c0 <_objc_msgSend$setCachedTranslation:>
