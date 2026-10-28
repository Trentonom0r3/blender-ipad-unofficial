
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010add2c <-[GHOSTUIWindow handlePan:]>:
1010add2c:     	sub	sp, sp, #0x1a0
1010add30:     	stp	d13, d12, [sp, #0x110]
1010add34:     	stp	d11, d10, [sp, #0x120]
1010add38:     	stp	d9, d8, [sp, #0x130]
1010add3c:     	stp	x28, x27, [sp, #0x140]
1010add40:     	stp	x26, x25, [sp, #0x150]
1010add44:     	stp	x24, x23, [sp, #0x160]
1010add48:     	stp	x22, x21, [sp, #0x170]
1010add4c:     	stp	x20, x19, [sp, #0x180]
1010add50:     	stp	x29, x30, [sp, #0x190]
1010add54:     	add	x29, sp, #0x190
1010add58:     	mov	x20, x2
1010add5c:     	mov	x19, x0
1010add60:     	mov	x0, x2
1010add64:     	bl	0x104b7c100 <_objc_msgSend$touchStreamAllowed>
1010add68:     	cbz	w0, 0x1010adf98 <-[GHOSTUIWindow handlePan:]+0x26c>
1010add6c:     	mov	x0, x20
1010add70:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010add74:     	cmp	x0, #0x1
1010add78:     	b.ne	0x1010adde0 <-[GHOSTUIWindow handlePan:]+0xb4>
1010add7c:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010add80:     	ldrsw	x8, [x8, #0x2c]
1010add84:     	ldrb	w8, [x19, x8]
1010add88:     	tbnz	w8, #0x0, 0x1010addb0 <-[GHOSTUIWindow handlePan:]+0x84>
1010add8c:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010add90:     	ldrsw	x8, [x8, #0x30]
1010add94:     	ldrb	w8, [x19, x8]
1010add98:     	tbnz	w8, #0x0, 0x1010addb0 <-[GHOSTUIWindow handlePan:]+0x84>
1010add9c:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010adda0:     	ldrsw	x8, [x8, #0x34]
1010adda4:     	ldrb	w8, [x19, x8]
1010adda8:     	cmp	w8, #0x1
1010addac:     	b.ne	0x1010adde0 <-[GHOSTUIWindow handlePan:]+0xb4>
1010addb0:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010addb4:     	ldrsw	x8, [x8, #0x50]
1010addb8:     	add	x8, x19, x8
1010addbc:     	stp	xzr, xzr, [x8, #0x8]
1010addc0:     	str	xzr, [x8]
1010addc4:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010addc8:     	ldrsw	x8, [x8, #0xfb4]
1010addcc:     	add	x8, x19, x8
1010addd0:     	str	wzr, [x8]
1010addd4:     	mov	w9, #0x1                ; =1
1010addd8:     	strb	w9, [x8, #0x4]
1010adddc:     	b	0x1010adf98 <-[GHOSTUIWindow handlePan:]+0x26c>
1010adde0:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010adde4:     	ldrsw	x26, [x8, #0xf84]
1010adde8:     	ldr	x2, [x19, x26]
1010addec:     	mov	x0, x20
1010addf0:     	bl	0x104b78780 <_objc_msgSend$getScaledTouchPoint:>
1010addf4:     	fmov	d9, d0
1010addf8:     	fmov	d8, d1
1010addfc:     	ldr	x2, [x19, x26]
1010ade00:     	mov	x0, x20
1010ade04:     	bl	0x104b787a0 <_objc_msgSend$getScaledTranslation:>
1010ade08:     	fmov	d11, d0
1010ade0c:     	fmov	d10, d1
1010ade10:     	mov	x0, x20
1010ade14:     	bl	0x104b78660 <_objc_msgSend$gestureUsesPencil>
1010ade18:     	mov	x28, x0
1010ade1c:     	adrp	x22, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ade20:     	cbz	x20, 0x1010ade70 <-[GHOSTUIWindow handlePan:]+0x144>
1010ade24:     	add	x8, sp, #0x50
1010ade28:     	mov	x0, x20
1010ade2c:     	bl	0x104b796c0 <_objc_msgSend$pencilSample>
1010ade30:     	ldrb	w8, [sp, #0x50]
1010ade34:     	ldr	x9, [sp, #0x58]
1010ade38:     	ldr	w10, [sp, #0x54]
1010ade3c:     	lsl	x10, x10, #32
1010ade40:     	tst	w8, #0x1
1010ade44:     	mov	w8, #0x1                ; =1
1010ade48:     	csinc	x21, x8, x10, eq
1010ade4c:     	csel	x23, x9, xzr, ne
1010ade50:     	mov	x0, x20
1010ade54:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ade58:     	cmp	x0, #0x1
1010ade5c:     	b.ne	0x1010adf88 <-[GHOSTUIWindow handlePan:]+0x25c>
1010ade60:     	add	x8, sp, #0x50
1010ade64:     	mov	x0, x20
1010ade68:     	bl	0x104b79c00 <_objc_msgSend$ringContact>
1010ade6c:     	b	0x1010ade94 <-[GHOSTUIWindow handlePan:]+0x168>
1010ade70:     	mov	x0, x20
1010ade74:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ade78:     	cmp	x0, #0x1
1010ade7c:     	b.ne	0x1010adf80 <-[GHOSTUIWindow handlePan:]+0x254>
1010ade80:     	mov	x23, #0x0               ; =0
1010ade84:     	str	xzr, [sp, #0x70]
1010ade88:     	movi.16b	v0, #0x0
1010ade8c:     	stp	q0, q0, [sp, #0x50]
1010ade90:     	mov	w21, #0x1               ; =1
1010ade94:     	ldrsw	x27, [x22, #0x44]
1010ade98:     	add	x8, x19, x27
1010ade9c:     	ldp	q0, q1, [sp, #0x50]
1010adea0:     	stp	q0, q1, [x8]
1010adea4:     	ldrh	w9, [sp, #0x70]
1010adea8:     	strh	w9, [x8, #0x20]
1010adeac:     	and	w9, w9, #0xff
1010adeb0:     	cmp	w9, #0x1
1010adeb4:     	b.ne	0x1010adf8c <-[GHOSTUIWindow handlePan:]+0x260>
1010adeb8:     	ldr	x24, [x8]
1010adebc:     	cbz	x24, 0x1010adf8c <-[GHOSTUIWindow handlePan:]+0x260>
1010adec0:     	mov	x25, x28
1010adec4:     	ldr	x28, [x8, #0x10]
1010adec8:     	cbz	x28, 0x1010ae130 <-[GHOSTUIWindow handlePan:]+0x404>
1010adecc:     	stp	x21, x23, [sp, #0x8]
1010aded0:     	adrp	x9, 0x106627000 <_zlibVersion+0x106627000>
1010aded4:     	ldrsw	x9, [x9, #0xf80]
1010aded8:     	ldr	x22, [x19, x9]
1010adedc:     	ldr	x21, [x19, x26]
1010adee0:     	ldr	d12, [x8, #0x18]
1010adee4:     	ldr	x8, [x8, #0x8]
1010adee8:     	str	x8, [sp]
1010adeec:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010adef0:     	add	x8, x8, #0x750
1010adef4:     	ldr	x8, [x8]
1010adef8:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010adefc:     	add	x2, x2, #0xc2a
1010adf00:     	mov	w0, #0x58               ; =88
1010adf04:     	mov	w1, #0x10               ; =16
1010adf08:     	mov	w3, #0x1                ; =1
1010adf0c:     	blr	x8
1010adf10:     	mov	x23, x0
1010adf14:     	ldr	x8, [x22]
1010adf18:     	ldr	x8, [x8, #0x10]
1010adf1c:     	mov	x0, x22
1010adf20:     	blr	x8
1010adf24:     	mov	w8, #0xb                ; =11
1010adf28:     	str	w8, [x23, #0x8]
1010adf2c:     	adrp	x8, 0x1063ff000 <__ZTV12GHOST_Window+0x88>
1010adf30:     	add	x8, x8, #0x598
1010adf34:     	stp	x0, x21, [x23, #0x10]
1010adf38:     	add	x8, x8, #0x10
1010adf3c:     	str	x8, [x23]
1010adf40:     	mov	x8, x23
1010adf44:     	str	x24, [x8, #0x28]!
1010adf48:     	ldr	x9, [sp]
1010adf4c:     	str	x9, [x23, #0x30]
1010adf50:     	str	d12, [x23, #0x38]
1010adf54:     	mov	w9, #0x1                ; =1
1010adf58:     	str	w9, [x23, #0x40]
1010adf5c:     	str	x28, [x23, #0x48]
1010adf60:     	str	wzr, [x23, #0x50]
1010adf64:     	str	x8, [x23, #0x20]
1010adf68:     	mov	x0, x22
1010adf6c:     	mov	x1, x23
1010adf70:     	bl	0x10109a124 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010adf74:     	ldp	x21, x23, [sp, #0x8]
1010adf78:     	mov	x28, x25
1010adf7c:     	b	0x1010adf8c <-[GHOSTUIWindow handlePan:]+0x260>
1010adf80:     	mov	x23, #0x0               ; =0
1010adf84:     	mov	w21, #0x1               ; =1
1010adf88:     	ldrsw	x27, [x22, #0x44]
1010adf8c:     	add	x22, x19, x27
1010adf90:     	ldrb	w8, [x22, #0x21]
1010adf94:     	tbz	w8, #0x0, 0x1010adfc4 <-[GHOSTUIWindow handlePan:]+0x298>
1010adf98:     	ldp	x29, x30, [sp, #0x190]
1010adf9c:     	ldp	x20, x19, [sp, #0x180]
1010adfa0:     	ldp	x22, x21, [sp, #0x170]
1010adfa4:     	ldp	x24, x23, [sp, #0x160]
1010adfa8:     	ldp	x26, x25, [sp, #0x150]
1010adfac:     	ldp	x28, x27, [sp, #0x140]
1010adfb0:     	ldp	d9, d8, [sp, #0x130]
1010adfb4:     	ldp	d11, d10, [sp, #0x120]
1010adfb8:     	ldp	d13, d12, [sp, #0x110]
1010adfbc:     	add	sp, sp, #0x1a0
1010adfc0:     	ret
1010adfc4:     	ldrb	w8, [x22, #0x20]
1010adfc8:     	cmp	w8, #0x1
1010adfcc:     	b.ne	0x1010ae0e0 <-[GHOSTUIWindow handlePan:]+0x3b4>
1010adfd0:     	mov	x0, x20
1010adfd4:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010adfd8:     	cmp	x0, #0x3
1010adfdc:     	b.eq	0x1010ae000 <-[GHOSTUIWindow handlePan:]+0x2d4>
1010adfe0:     	mov	x0, x20
1010adfe4:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010adfe8:     	cmp	x0, #0x4
1010adfec:     	b.eq	0x1010ae000 <-[GHOSTUIWindow handlePan:]+0x2d4>
1010adff0:     	mov	x0, x20
1010adff4:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010adff8:     	cmp	x0, #0x5
1010adffc:     	b.ne	0x1010ae510 <-[GHOSTUIWindow handlePan:]+0x7e4>
1010ae000:     	mov	x0, x20
1010ae004:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae008:     	cmp	x0, #0x3
1010ae00c:     	mov	w8, #0x3                ; =3
1010ae010:     	cinc	w21, w8, ne
1010ae014:     	ldr	x24, [x22]
1010ae018:     	cbz	x24, 0x1010ae0c0 <-[GHOSTUIWindow handlePan:]+0x394>
1010ae01c:     	ldr	x23, [x22, #0x10]
1010ae020:     	cbz	x23, 0x1010ae0c0 <-[GHOSTUIWindow handlePan:]+0x394>
1010ae024:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010ae028:     	ldrsw	x8, [x8, #0xf80]
1010ae02c:     	ldr	x20, [x19, x8]
1010ae030:     	ldr	x26, [x19, x26]
1010ae034:     	ldr	x25, [x22, #0x8]
1010ae038:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ae03c:     	add	x8, x8, #0x750
1010ae040:     	ldr	x8, [x8]
1010ae044:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010ae048:     	add	x2, x2, #0xc2a
1010ae04c:     	mov	w0, #0x58               ; =88
1010ae050:     	mov	w1, #0x10               ; =16
1010ae054:     	mov	w3, #0x1                ; =1
1010ae058:     	blr	x8
1010ae05c:     	mov	x19, x0
1010ae060:     	ldr	x8, [x20]
1010ae064:     	ldr	x8, [x8, #0x10]
1010ae068:     	mov	x0, x20
1010ae06c:     	blr	x8
1010ae070:     	fcvtzs	w8, d8
1010ae074:     	fcvtzs	w9, d9
1010ae078:     	mov	w10, #0xb               ; =11
1010ae07c:     	str	w10, [x19, #0x8]
1010ae080:     	stp	x0, x26, [x19, #0x10]
1010ae084:     	adrp	x10, 0x1063ff000 <__ZTV12GHOST_Window+0x88>
1010ae088:     	add	x10, x10, #0x598
1010ae08c:     	add	x10, x10, #0x10
1010ae090:     	str	x10, [x19]
1010ae094:     	mov	x10, x19
1010ae098:     	str	x24, [x10, #0x28]!
1010ae09c:     	str	x25, [x19, #0x30]
1010ae0a0:     	stp	w9, w8, [x19, #0x38]
1010ae0a4:     	str	w21, [x19, #0x40]
1010ae0a8:     	str	x23, [x19, #0x48]
1010ae0ac:     	str	wzr, [x19, #0x50]
1010ae0b0:     	str	x10, [x19, #0x20]
1010ae0b4:     	mov	x0, x20
1010ae0b8:     	mov	x1, x19
1010ae0bc:     	bl	0x10109a124 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010ae0c0:     	ldrb	w8, [x22, #0x20]
1010ae0c4:     	cmp	w8, #0x1
1010ae0c8:     	b.ne	0x1010adf98 <-[GHOSTUIWindow handlePan:]+0x26c>
1010ae0cc:     	ldrb	w8, [x22, #0x21]
1010ae0d0:     	tbnz	w8, #0x0, 0x1010adf98 <-[GHOSTUIWindow handlePan:]+0x26c>
1010ae0d4:     	mov	w8, #0x100              ; =256
1010ae0d8:     	strh	w8, [x22, #0x20]
1010ae0dc:     	b	0x1010adf98 <-[GHOSTUIWindow handlePan:]+0x26c>
1010ae0e0:     	cbz	w28, 0x1010ae0f4 <-[GHOSTUIWindow handlePan:]+0x3c8>
1010ae0e4:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010ae0e8:     	ldrsw	x8, [x8, #0xfa0]
1010ae0ec:     	add	x8, x19, x8
1010ae0f0:     	stp	x21, x23, [x8]
1010ae0f4:     	add	x24, sp, #0x50
1010ae0f8:     	mov	x0, x20
1010ae0fc:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae100:     	adrp	x22, 0x106627000 <_zlibVersion+0x106627000>
1010ae104:     	cmp	x0, #0x1
1010ae108:     	b.ne	0x1010ae128 <-[GHOSTUIWindow handlePan:]+0x3fc>
1010ae10c:     	str	w28, [sp, #0x2c]
1010ae110:     	mov	x24, x21
1010ae114:     	cbz	x20, 0x1010ae138 <-[GHOSTUIWindow handlePan:]+0x40c>
1010ae118:     	add	x8, sp, #0x50
1010ae11c:     	mov	x0, x20
1010ae120:     	bl	0x104b78920 <_objc_msgSend$hudContact>
1010ae124:     	b	0x1010ae140 <-[GHOSTUIWindow handlePan:]+0x414>
1010ae128:     	ldrsw	x27, [x22, #0xfb4]
1010ae12c:     	b	0x1010ae360 <-[GHOSTUIWindow handlePan:]+0x634>
1010ae130:     	mov	x28, x25
1010ae134:     	b	0x1010adf8c <-[GHOSTUIWindow handlePan:]+0x260>
1010ae138:     	stp	xzr, xzr, [sp, #0x50]
1010ae13c:     	str	xzr, [sp, #0x60]
1010ae140:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ae144:     	ldrsw	x8, [x8, #0x50]
1010ae148:     	add	x21, x19, x8
1010ae14c:     	ldr	q0, [sp, #0x50]
1010ae150:     	str	q0, [x21]
1010ae154:     	ldr	x8, [sp, #0x60]
1010ae158:     	str	x8, [x21, #0x10]
1010ae15c:     	mov	x0, x20
1010ae160:     	bl	0x104b78640 <_objc_msgSend$gestureUsesFinger>
1010ae164:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010ae168:     	ldrsw	x25, [x8, #0xfb8]
1010ae16c:     	strb	w0, [x19, x25]
1010ae170:     	ldr	q0, [x21]
1010ae174:     	str	q0, [sp, #0x10]
1010ae178:     	fmov	x28, d0
1010ae17c:     	cbz	x28, 0x1010ae198 <-[GHOSTUIWindow handlePan:]+0x46c>
1010ae180:     	ldp	s0, s1, [x21, #0x10]
1010ae184:     	sshll.2d	v0, v0, #0x0
1010ae188:     	scvtf	d12, d0
1010ae18c:     	sshll.2d	v0, v1, #0x0
1010ae190:     	scvtf	d13, d0
1010ae194:     	b	0x1010ae1a0 <-[GHOSTUIWindow handlePan:]+0x474>
1010ae198:     	fsub	d12, d9, d11
1010ae19c:     	fsub	d13, d8, d10
1010ae1a0:     	ldrsw	x27, [x22, #0xfb4]
1010ae1a4:     	add	x22, x19, x27
1010ae1a8:     	ldr	x26, [x19, x26]
1010ae1ac:     	bl	0x1010a0738 <__Z29GHOST_IOS_get_flythrough_modev>
1010ae1b0:     	adrp	x9, 0x10636c000 <_zlibVersion+0x10636c000>
1010ae1b4:     	ldr	x9, [x9, #0x748]
1010ae1b8:     	ldr	x8, [x9, #0x8]
1010ae1bc:     	mov	x21, x24
1010ae1c0:     	cbz	x8, 0x1010ae224 <-[GHOSTUIWindow handlePan:]+0x4f8>
1010ae1c4:     	lsr	x10, x26, #32
1010ae1c8:     	ubfiz	x11, x26, #3, #29
1010ae1cc:     	add	x11, x11, #0x8
1010ae1d0:     	eor	x11, x11, x10
1010ae1d4:     	mov	x12, #0x2d69            ; =11625
1010ae1d8:     	movk	x12, #0xeb38, lsl #16
1010ae1dc:     	movk	x12, #0xea08, lsl #32
1010ae1e0:     	movk	x12, #0x9ddf, lsl #48
1010ae1e4:     	mul	x11, x11, x12
1010ae1e8:     	eor	x10, x10, x11, lsr #47
1010ae1ec:     	eor	x10, x10, x11
1010ae1f0:     	mul	x10, x10, x12
1010ae1f4:     	eor	x10, x10, x10, lsr #47
1010ae1f8:     	mul	x11, x10, x12
1010ae1fc:     	fmov	d0, x8
1010ae200:     	cnt.8b	v0, v0
1010ae204:     	uaddlv.8b	h0, v0
1010ae208:     	fmov	w12, s0
1010ae20c:     	cmp	x12, #0x1
1010ae210:     	add	x24, sp, #0x50
1010ae214:     	b.hi	0x1010ae22c <-[GHOSTUIWindow handlePan:]+0x500>
1010ae218:     	sub	x10, x8, #0x1
1010ae21c:     	and	x13, x11, x10
1010ae220:     	b	0x1010ae240 <-[GHOSTUIWindow handlePan:]+0x514>
1010ae224:     	add	x24, sp, #0x50
1010ae228:     	b	0x1010ae2b0 <-[GHOSTUIWindow handlePan:]+0x584>
1010ae22c:     	mov	x13, x11
1010ae230:     	cmp	x11, x8
1010ae234:     	b.lo	0x1010ae240 <-[GHOSTUIWindow handlePan:]+0x514>
1010ae238:     	udiv	x10, x11, x8
1010ae23c:     	msub	x13, x10, x8, x11
1010ae240:     	ldr	x9, [x9]
1010ae244:     	ldr	x9, [x9, x13, lsl #3]
1010ae248:     	cbz	x9, 0x1010ae2ac <-[GHOSTUIWindow handlePan:]+0x580>
1010ae24c:     	ldr	x14, [x9]
1010ae250:     	cbz	x14, 0x1010ae2ac <-[GHOSTUIWindow handlePan:]+0x580>
1010ae254:     	fcvtzs	w9, d12
1010ae258:     	fcvtzs	w10, d13
1010ae25c:     	sub	x15, x8, #0x1
1010ae260:     	b	0x1010ae278 <-[GHOSTUIWindow handlePan:]+0x54c>
1010ae264:     	ldr	x16, [x14, #0x10]
1010ae268:     	cmp	x16, x26
1010ae26c:     	b.eq	0x1010ae6e0 <-[GHOSTUIWindow handlePan:]+0x9b4>
1010ae270:     	ldr	x14, [x14]
1010ae274:     	cbz	x14, 0x1010ae2ac <-[GHOSTUIWindow handlePan:]+0x580>
1010ae278:     	ldr	x16, [x14, #0x8]
1010ae27c:     	cmp	x16, x11
1010ae280:     	b.eq	0x1010ae264 <-[GHOSTUIWindow handlePan:]+0x538>
1010ae284:     	cmp	x12, #0x1
1010ae288:     	b.hi	0x1010ae294 <-[GHOSTUIWindow handlePan:]+0x568>
1010ae28c:     	and	x16, x16, x15
1010ae290:     	b	0x1010ae2a4 <-[GHOSTUIWindow handlePan:]+0x578>
1010ae294:     	cmp	x16, x8
1010ae298:     	b.lo	0x1010ae2a4 <-[GHOSTUIWindow handlePan:]+0x578>
1010ae29c:     	udiv	x17, x16, x8
1010ae2a0:     	msub	x16, x17, x8, x16
1010ae2a4:     	cmp	x16, x13
1010ae2a8:     	b.eq	0x1010ae270 <-[GHOSTUIWindow handlePan:]+0x544>
1010ae2ac:     	mov	w8, #0x0                ; =0
1010ae2b0:     	str	w8, [x22]
1010ae2b4:     	strb	wzr, [x22, #0x4]
1010ae2b8:     	cbz	x28, 0x1010ae2cc <-[GHOSTUIWindow handlePan:]+0x5a0>
1010ae2bc:     	mov	w8, #0x1                ; =1
1010ae2c0:     	str	w8, [x22]
1010ae2c4:     	strb	wzr, [x22, #0x4]
1010ae2c8:     	b	0x1010ae2d0 <-[GHOSTUIWindow handlePan:]+0x5a4>
1010ae2cc:     	cbz	w8, 0x1010ae57c <-[GHOSTUIWindow handlePan:]+0x850>
1010ae2d0:     	strb	wzr, [sp, #0xa9]
1010ae2d4:     	adrp	x9, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010ae2d8:     	add	x9, x9, #0x544
1010ae2dc:     	ldr	q0, [x9]
1010ae2e0:     	stur	q0, [sp, #0xac]
1010ae2e4:     	str	wzr, [sp, #0xbc]
1010ae2e8:     	movi.16b	v0, #0x0
1010ae2ec:     	stur	q0, [x24, #0x78]
1010ae2f0:     	stur	q0, [x24, #0x88]
1010ae2f4:     	stur	q0, [x24, #0x98]
1010ae2f8:     	str	xzr, [sp, #0xf8]
1010ae2fc:     	stp	d12, d13, [sp, #0x80]
1010ae300:     	stp	xzr, xzr, [sp, #0x98]
1010ae304:     	str	xzr, [sp, #0x90]
1010ae308:     	ldr	w28, [sp, #0x2c]
1010ae30c:     	strb	w28, [sp, #0xa8]
1010ae310:     	cbz	w28, 0x1010ae324 <-[GHOSTUIWindow handlePan:]+0x5f8>
1010ae314:     	stur	x21, [sp, #0xac]
1010ae318:     	stur	x23, [x24, #0x64]
1010ae31c:     	mov	w9, #0x1                ; =1
1010ae320:     	strb	w9, [sp, #0xa9]
1010ae324:     	ldrb	w9, [x19, x25]
1010ae328:     	strb	w9, [sp, #0xc0]
1010ae32c:     	ldr	q0, [sp, #0x10]
1010ae330:     	str	q0, [sp, #0xd0]
1010ae334:     	cmp	w8, #0x3
1010ae338:     	cset	w8, eq
1010ae33c:     	strb	w8, [sp, #0xbf]
1010ae340:     	adrp	x8, 0x104fc6000 <__ZTSNSt3__110__function6__funcIZN7blender3gpu6shader12Preprocessor28template_definition_mutationERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_8functionIFviiSB_PKcEEEEUlRKNS_6vectorINS4_6parser5TokenENS9_ISM_EEEEE0_NS9_ISR_EEFvSO_EEE+0x76>
1010ae344:     	ldr	d0, [x8, #0x6c8]
1010ae348:     	str	d0, [sp, #0x50]
1010ae34c:     	mov	w8, #0x2                ; =2
1010ae350:     	str	w8, [sp, #0x78]
1010ae354:     	add	x2, sp, #0x50
1010ae358:     	mov	x0, x19
1010ae35c:     	bl	0x104b78620 <_objc_msgSend$generateUserInputEvents:>
1010ae360:     	add	x22, x19, x27
1010ae364:     	ldrb	w8, [x22, #0x4]
1010ae368:     	tbnz	w8, #0x0, 0x1010adf98 <-[GHOSTUIWindow handlePan:]+0x26c>
1010ae36c:     	ldr	w8, [x22]
1010ae370:     	cbz	w8, 0x1010ae4a0 <-[GHOSTUIWindow handlePan:]+0x774>
1010ae374:     	strb	wzr, [sp, #0xa9]
1010ae378:     	adrp	x9, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010ae37c:     	add	x9, x9, #0x544
1010ae380:     	ldr	q0, [x9]
1010ae384:     	stur	q0, [sp, #0xac]
1010ae388:     	str	wzr, [sp, #0xbc]
1010ae38c:     	movi.16b	v0, #0x0
1010ae390:     	stur	q0, [x24, #0x78]
1010ae394:     	stur	q0, [x24, #0x88]
1010ae398:     	stur	q0, [x24, #0x98]
1010ae39c:     	str	xzr, [sp, #0xf8]
1010ae3a0:     	stp	d9, d8, [sp, #0x80]
1010ae3a4:     	stp	xzr, xzr, [sp, #0x98]
1010ae3a8:     	str	xzr, [sp, #0x90]
1010ae3ac:     	strb	w28, [sp, #0xa8]
1010ae3b0:     	cbz	w28, 0x1010ae3c4 <-[GHOSTUIWindow handlePan:]+0x698>
1010ae3b4:     	stur	x21, [sp, #0xac]
1010ae3b8:     	stur	x23, [x24, #0x64]
1010ae3bc:     	mov	w9, #0x1                ; =1
1010ae3c0:     	strb	w9, [sp, #0xa9]
1010ae3c4:     	adrp	x9, 0x106627000 <_zlibVersion+0x106627000>
1010ae3c8:     	ldrsw	x21, [x9, #0xfb8]
1010ae3cc:     	ldrb	w9, [x19, x21]
1010ae3d0:     	strb	w9, [sp, #0xc0]
1010ae3d4:     	adrp	x9, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ae3d8:     	ldrsw	x9, [x9, #0x50]
1010ae3dc:     	add	x23, x19, x9
1010ae3e0:     	ldr	q0, [x23]
1010ae3e4:     	str	q0, [sp, #0xd0]
1010ae3e8:     	cmp	w8, #0x3
1010ae3ec:     	cset	w8, eq
1010ae3f0:     	strb	w8, [sp, #0xbf]
1010ae3f4:     	mov	w8, #0x1                ; =1
1010ae3f8:     	str	wzr, [sp, #0x50]
1010ae3fc:     	str	w8, [sp, #0x78]
1010ae400:     	mov	x0, x20
1010ae404:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae408:     	cmp	x0, #0x3
1010ae40c:     	b.eq	0x1010ae430 <-[GHOSTUIWindow handlePan:]+0x704>
1010ae410:     	mov	x0, x20
1010ae414:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae418:     	cmp	x0, #0x4
1010ae41c:     	b.eq	0x1010ae430 <-[GHOSTUIWindow handlePan:]+0x704>
1010ae420:     	mov	x0, x20
1010ae424:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae428:     	cmp	x0, #0x5
1010ae42c:     	b.ne	0x1010ae478 <-[GHOSTUIWindow handlePan:]+0x74c>
1010ae430:     	mov	x0, x20
1010ae434:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae438:     	cmp	x0, #0x3
1010ae43c:     	cset	w8, ne
1010ae440:     	ldr	w9, [x22]
1010ae444:     	cmp	w9, #0x0
1010ae448:     	cset	w10, ne
1010ae44c:     	ldrb	w11, [x22, #0x4]
1010ae450:     	orr	w10, w11, w10
1010ae454:     	strb	w10, [x22, #0x4]
1010ae458:     	csel	w8, wzr, w8, eq
1010ae45c:     	str	wzr, [x22]
1010ae460:     	strb	w8, [sp, #0xbe]
1010ae464:     	cbz	w9, 0x1010ae478 <-[GHOSTUIWindow handlePan:]+0x74c>
1010ae468:     	mov	w8, #0x6                ; =6
1010ae46c:     	mov	w9, #0x2                ; =2
1010ae470:     	str	w8, [sp, #0x54]
1010ae474:     	str	w9, [sp, #0x78]
1010ae478:     	add	x2, sp, #0x50
1010ae47c:     	mov	x0, x19
1010ae480:     	bl	0x104b78620 <_objc_msgSend$generateUserInputEvents:>
1010ae484:     	ldrb	w8, [x22, #0x4]
1010ae488:     	cmp	w8, #0x1
1010ae48c:     	b.ne	0x1010adf98 <-[GHOSTUIWindow handlePan:]+0x26c>
1010ae490:     	stp	xzr, xzr, [x23]
1010ae494:     	str	xzr, [x23, #0x10]
1010ae498:     	strb	wzr, [x19, x21]
1010ae49c:     	b	0x1010adf98 <-[GHOSTUIWindow handlePan:]+0x26c>
1010ae4a0:     	tbz	w28, #0x0, 0x1010ae538 <-[GHOSTUIWindow handlePan:]+0x80c>
1010ae4a4:     	mov	x22, x21
1010ae4a8:     	mov	x0, x20
1010ae4ac:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae4b0:     	cmp	x0, #0x1
1010ae4b4:     	b.ne	0x1010ae4c0 <-[GHOSTUIWindow handlePan:]+0x794>
1010ae4b8:     	mov	x0, x20
1010ae4bc:     	bl	0x104b799c0 <_objc_msgSend$recognizeKnifePan>
1010ae4c0:     	mov	x0, x20
1010ae4c4:     	bl	0x104b795a0 <_objc_msgSend$omitKnifePairedPan>
1010ae4c8:     	mov	x21, x0
1010ae4cc:     	str	wzr, [sp, #0x78]
1010ae4d0:     	str	wzr, [sp, #0xbc]
1010ae4d4:     	strb	wzr, [sp, #0xc0]
1010ae4d8:     	stp	xzr, xzr, [sp, #0xd0]
1010ae4dc:     	str	xzr, [sp, #0xc8]
1010ae4e0:     	stp	d9, d8, [sp, #0x80]
1010ae4e4:     	stp	xzr, xzr, [sp, #0x98]
1010ae4e8:     	str	xzr, [sp, #0x90]
1010ae4ec:     	mov	w8, #0x101              ; =257
1010ae4f0:     	strh	w8, [sp, #0xa8]
1010ae4f4:     	stur	x22, [sp, #0xac]
1010ae4f8:     	stur	x23, [x24, #0x64]
1010ae4fc:     	cbz	x20, 0x1010ae5f0 <-[GHOSTUIWindow handlePan:]+0x8c4>
1010ae500:     	add	x8, sp, #0x30
1010ae504:     	mov	x0, x20
1010ae508:     	bl	0x104b796a0 <_objc_msgSend$pencilPaintContact>
1010ae50c:     	b	0x1010ae5f8 <-[GHOSTUIWindow handlePan:]+0x8cc>
1010ae510:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010ae514:     	ldrsw	x8, [x8, #0xf80]
1010ae518:     	ldr	x0, [x19, x8]
1010ae51c:     	ldr	x1, [x19, x26]
1010ae520:     	mov	x2, x22
1010ae524:     	mov	w3, #0x2                ; =2
1010ae528:     	fmov	d0, d9
1010ae52c:     	fmov	d1, d8
1010ae530:     	bl	0x1010ad20c <__ZL15ios_ring_packetP15GHOST_SystemIOSP15GHOST_WindowIOSRKN5ghost3ios17PencilRingContactE22GHOST_TPencilRingPhase7CGPoint>
1010ae534:     	b	0x1010adf98 <-[GHOSTUIWindow handlePan:]+0x26c>
1010ae538:     	bl	0x1010a0738 <__Z29GHOST_IOS_get_flythrough_modev>
1010ae53c:     	cbz	w0, 0x1010ae584 <-[GHOSTUIWindow handlePan:]+0x858>
1010ae540:     	mov	x0, x20
1010ae544:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae548:     	cmp	x0, #0x1
1010ae54c:     	b.ne	0x1010ae73c <-[GHOSTUIWindow handlePan:]+0xa10>
1010ae550:     	mov	x0, x20
1010ae554:     	fmov	d0, d11
1010ae558:     	fmov	d1, d10
1010ae55c:     	bl	0x104b7a0c0 <_objc_msgSend$setCachedTranslation:>
1010ae560:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ae564:     	ldrsw	x8, [x8, #0x48]
1010ae568:     	str	d9, [x19, x8]
1010ae56c:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ae570:     	ldrsw	x8, [x8, #0x4c]
1010ae574:     	str	d8, [x19, x8]
1010ae578:     	b	0x1010ae898 <-[GHOSTUIWindow handlePan:]+0xb6c>
1010ae57c:     	ldr	w28, [sp, #0x2c]
1010ae580:     	b	0x1010ae360 <-[GHOSTUIWindow handlePan:]+0x634>
1010ae584:     	adrp	x8, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010ae588:     	add	x8, x8, #0x544
1010ae58c:     	ldr	q0, [x8]
1010ae590:     	fsub	d1, d9, d11
1010ae594:     	stur	q0, [sp, #0xac]
1010ae598:     	fsub	d0, d8, d10
1010ae59c:     	str	wzr, [sp, #0x78]
1010ae5a0:     	str	wzr, [sp, #0xbc]
1010ae5a4:     	strb	wzr, [sp, #0xc0]
1010ae5a8:     	movi.16b	v2, #0x0
1010ae5ac:     	stur	q2, [x24, #0x78]
1010ae5b0:     	stur	q2, [x24, #0x88]
1010ae5b4:     	stur	q2, [x24, #0x98]
1010ae5b8:     	str	xzr, [sp, #0xf8]
1010ae5bc:     	stp	d1, d0, [sp, #0x80]
1010ae5c0:     	strh	wzr, [sp, #0xa8]
1010ae5c4:     	stp	xzr, xzr, [sp, #0x98]
1010ae5c8:     	str	xzr, [sp, #0x90]
1010ae5cc:     	mov	x0, x20
1010ae5d0:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae5d4:     	cmp	x0, #0x1
1010ae5d8:     	b.ne	0x1010ae7e4 <-[GHOSTUIWindow handlePan:]+0xab8>
1010ae5dc:     	mov	x0, x20
1010ae5e0:     	fmov	d0, d11
1010ae5e4:     	fmov	d1, d10
1010ae5e8:     	bl	0x104b7a0c0 <_objc_msgSend$setCachedTranslation:>
1010ae5ec:     	b	0x1010ae914 <-[GHOSTUIWindow handlePan:]+0xbe8>
1010ae5f0:     	movi.16b	v0, #0x0
1010ae5f4:     	stp	q0, q0, [sp, #0x30]
1010ae5f8:     	ldp	q0, q1, [sp, #0x30]
1010ae5fc:     	stp	q0, q1, [sp, #0xe0]
1010ae600:     	mov	x0, x20
1010ae604:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae608:     	cmp	x0, #0x1
1010ae60c:     	b.eq	0x1010ae620 <-[GHOSTUIWindow handlePan:]+0x8f4>
1010ae610:     	mov	x0, x20
1010ae614:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae618:     	cmp	x0, #0x2
1010ae61c:     	b.ne	0x1010ae850 <-[GHOSTUIWindow handlePan:]+0xb24>
1010ae620:     	mov	x0, x20
1010ae624:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae628:     	cmp	x0, #0x1
1010ae62c:     	b.ne	0x1010ae658 <-[GHOSTUIWindow handlePan:]+0x92c>
1010ae630:     	mov	x0, x20
1010ae634:     	fmov	d0, d11
1010ae638:     	fmov	d1, d10
1010ae63c:     	bl	0x104b7a0c0 <_objc_msgSend$setCachedTranslation:>
1010ae640:     	adrp	x8, 0x104fc6000 <__ZTSNSt3__110__function6__funcIZN7blender3gpu6shader12Preprocessor28template_definition_mutationERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_8functionIFviiSB_PKcEEEEUlRKNS_6vectorINS4_6parser5TokenENS9_ISM_EEEEE0_NS9_ISR_EEFvSO_EEE+0x76>
1010ae644:     	ldr	d0, [x8, #0x6c8]
1010ae648:     	str	d0, [sp, #0x50]
1010ae64c:     	mov	w22, #0x2               ; =2
1010ae650:     	str	w22, [sp, #0x78]
1010ae654:     	b	0x1010ae65c <-[GHOSTUIWindow handlePan:]+0x930>
1010ae658:     	mov	w22, #0x0               ; =0
1010ae65c:     	mov	x0, x20
1010ae660:     	fmov	d0, d11
1010ae664:     	fmov	d1, d10
1010ae668:     	bl	0x104b78720 <_objc_msgSend$getRelativeTranslation:>
1010ae66c:     	fmov	d8, d0
1010ae670:     	fmov	d9, d1
1010ae674:     	mov	x0, x20
1010ae678:     	fmov	d0, d11
1010ae67c:     	fmov	d1, d10
1010ae680:     	bl	0x104b7a0c0 <_objc_msgSend$setCachedTranslation:>
1010ae684:     	ldr	x8, [sp, #0xe0]
1010ae688:     	cbz	x8, 0x1010ae6ac <-[GHOSTUIWindow handlePan:]+0x980>
1010ae68c:     	ldr	x8, [sp, #0xe8]
1010ae690:     	cbz	x8, 0x1010ae6ac <-[GHOSTUIWindow handlePan:]+0x980>
1010ae694:     	ldr	x8, [sp, #0xf0]
1010ae698:     	cmp	x8, #0x0
1010ae69c:     	cset	w8, ne
1010ae6a0:     	orr	w8, w8, w21
1010ae6a4:     	tbz	w8, #0x0, 0x1010ae6b0 <-[GHOSTUIWindow handlePan:]+0x984>
1010ae6a8:     	b	0x1010ae93c <-[GHOSTUIWindow handlePan:]+0xc10>
1010ae6ac:     	tbnz	w21, #0x0, 0x1010ae93c <-[GHOSTUIWindow handlePan:]+0xc10>
1010ae6b0:     	fcmp	d8, #0.0
1010ae6b4:     	b.ne	0x1010ae6c0 <-[GHOSTUIWindow handlePan:]+0x994>
1010ae6b8:     	fcmp	d9, #0.0
1010ae6bc:     	b.eq	0x1010ae93c <-[GHOSTUIWindow handlePan:]+0xc10>
1010ae6c0:     	stp	d8, d9, [sp, #0x90]
1010ae6c4:     	mov	x0, x20
1010ae6c8:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae6cc:     	cmp	x0, #0x2
1010ae6d0:     	b.ne	0x1010ae920 <-[GHOSTUIWindow handlePan:]+0xbf4>
1010ae6d4:     	mov	x0, x20
1010ae6d8:     	bl	0x104b79680 <_objc_msgSend$pencilContactDown>
1010ae6dc:     	b	0x1010ae924 <-[GHOSTUIWindow handlePan:]+0xbf8>
1010ae6e0:     	ldp	x11, x12, [x14, #0x18]
1010ae6e4:     	b	0x1010ae6ec <-[GHOSTUIWindow handlePan:]+0x9c0>
1010ae6e8:     	add	x11, x11, #0x20
1010ae6ec:     	cmp	x11, x12
1010ae6f0:     	b.eq	0x1010ae2ac <-[GHOSTUIWindow handlePan:]+0x580>
1010ae6f4:     	ldr	w8, [x11]
1010ae6f8:     	cmp	w8, w9
1010ae6fc:     	b.gt	0x1010ae6e8 <-[GHOSTUIWindow handlePan:]+0x9bc>
1010ae700:     	ldr	w8, [x11, #0x8]
1010ae704:     	cmp	w8, w9
1010ae708:     	b.lt	0x1010ae6e8 <-[GHOSTUIWindow handlePan:]+0x9bc>
1010ae70c:     	ldr	w8, [x11, #0x4]
1010ae710:     	cmp	w8, w10
1010ae714:     	b.gt	0x1010ae6e8 <-[GHOSTUIWindow handlePan:]+0x9bc>
1010ae718:     	ldr	w8, [x11, #0xc]
1010ae71c:     	cmp	w8, w10
1010ae720:     	b.lt	0x1010ae6e8 <-[GHOSTUIWindow handlePan:]+0x9bc>
1010ae724:     	ldr	w8, [x11, #0x10]
1010ae728:     	cmp	w8, #0x3
1010ae72c:     	csel	w13, wzr, w0, ne
1010ae730:     	cmp	w13, #0x1
1010ae734:     	b.eq	0x1010ae6e8 <-[GHOSTUIWindow handlePan:]+0x9bc>
1010ae738:     	b	0x1010ae2b0 <-[GHOSTUIWindow handlePan:]+0x584>
1010ae73c:     	mov	x0, x20
1010ae740:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae744:     	cmp	x0, #0x2
1010ae748:     	b.ne	0x1010ae858 <-[GHOSTUIWindow handlePan:]+0xb2c>
1010ae74c:     	mov	x0, x20
1010ae750:     	fmov	d0, d11
1010ae754:     	fmov	d1, d10
1010ae758:     	bl	0x104b78720 <_objc_msgSend$getRelativeTranslation:>
1010ae75c:     	fmov	d12, d0
1010ae760:     	fmov	d13, d1
1010ae764:     	mov	x0, x20
1010ae768:     	fmov	d0, d11
1010ae76c:     	fmov	d1, d10
1010ae770:     	bl	0x104b7a0c0 <_objc_msgSend$setCachedTranslation:>
1010ae774:     	adrp	x8, 0x106368000 <_zlibVersion+0x106368000>
1010ae778:     	ldr	x8, [x8, #0x250]
1010ae77c:     	ldr	d0, [x8]
1010ae780:     	fcmp	d12, d0
1010ae784:     	b.ne	0x1010ae794 <-[GHOSTUIWindow handlePan:]+0xa68>
1010ae788:     	ldr	d0, [x8, #0x8]
1010ae78c:     	fcmp	d13, d0
1010ae790:     	b.eq	0x1010adf98 <-[GHOSTUIWindow handlePan:]+0x26c>
1010ae794:     	adrp	x8, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010ae798:     	add	x8, x8, #0x544
1010ae79c:     	ldr	q0, [x8]
1010ae7a0:     	stur	q0, [sp, #0xac]
1010ae7a4:     	str	wzr, [sp, #0xbc]
1010ae7a8:     	strb	wzr, [sp, #0xc0]
1010ae7ac:     	movi.16b	v0, #0x0
1010ae7b0:     	stur	q0, [x24, #0x78]
1010ae7b4:     	stur	q0, [x24, #0x88]
1010ae7b8:     	stur	q0, [x24, #0x98]
1010ae7bc:     	str	xzr, [sp, #0xf8]
1010ae7c0:     	stp	d9, d8, [sp, #0x80]
1010ae7c4:     	stp	d12, d13, [sp, #0x90]
1010ae7c8:     	str	xzr, [sp, #0xa0]
1010ae7cc:     	strh	wzr, [sp, #0xa8]
1010ae7d0:     	mov	w8, #0x2                ; =2
1010ae7d4:     	mov	w9, #0x1                ; =1
1010ae7d8:     	str	w8, [sp, #0x50]
1010ae7dc:     	str	w9, [sp, #0x78]
1010ae7e0:     	b	0x1010ae9d8 <-[GHOSTUIWindow handlePan:]+0xcac>
1010ae7e4:     	mov	x0, x20
1010ae7e8:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae7ec:     	cmp	x0, #0x2
1010ae7f0:     	b.ne	0x1010ae8e0 <-[GHOSTUIWindow handlePan:]+0xbb4>
1010ae7f4:     	mov	x0, x20
1010ae7f8:     	fmov	d0, d11
1010ae7fc:     	fmov	d1, d10
1010ae800:     	bl	0x104b78720 <_objc_msgSend$getRelativeTranslation:>
1010ae804:     	fmov	d9, d0
1010ae808:     	fmov	d8, d1
1010ae80c:     	stp	d0, d1, [sp, #0x90]
1010ae810:     	mov	x0, x20
1010ae814:     	fmov	d0, d11
1010ae818:     	fmov	d1, d10
1010ae81c:     	bl	0x104b7a0c0 <_objc_msgSend$setCachedTranslation:>
1010ae820:     	adrp	x8, 0x106368000 <_zlibVersion+0x106368000>
1010ae824:     	ldr	x8, [x8, #0x250]
1010ae828:     	ldr	d0, [x8]
1010ae82c:     	fcmp	d9, d0
1010ae830:     	b.ne	0x1010ae840 <-[GHOSTUIWindow handlePan:]+0xb14>
1010ae834:     	ldr	d0, [x8, #0x8]
1010ae838:     	fcmp	d8, d0
1010ae83c:     	b.eq	0x1010ae9d8 <-[GHOSTUIWindow handlePan:]+0xcac>
1010ae840:     	mov	w8, #0x1                ; =1
1010ae844:     	str	w8, [sp, #0x50]
1010ae848:     	mov	w8, #0x1                ; =1
1010ae84c:     	b	0x1010ae9d4 <-[GHOSTUIWindow handlePan:]+0xca8>
1010ae850:     	mov	w22, #0x0               ; =0
1010ae854:     	b	0x1010ae960 <-[GHOSTUIWindow handlePan:]+0xc34>
1010ae858:     	mov	x0, x20
1010ae85c:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae860:     	cmp	x0, #0x3
1010ae864:     	b.eq	0x1010ae888 <-[GHOSTUIWindow handlePan:]+0xb5c>
1010ae868:     	mov	x0, x20
1010ae86c:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae870:     	cmp	x0, #0x4
1010ae874:     	b.eq	0x1010ae888 <-[GHOSTUIWindow handlePan:]+0xb5c>
1010ae878:     	mov	x0, x20
1010ae87c:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae880:     	cmp	x0, #0x5
1010ae884:     	b.ne	0x1010adf98 <-[GHOSTUIWindow handlePan:]+0x26c>
1010ae888:     	fmov	d0, xzr
1010ae88c:     	fmov	d1, xzr
1010ae890:     	mov	x0, x20
1010ae894:     	bl	0x104b7a0c0 <_objc_msgSend$setCachedTranslation:>
1010ae898:     	adrp	x8, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010ae89c:     	add	x8, x8, #0x544
1010ae8a0:     	ldr	q0, [x8]
1010ae8a4:     	stur	q0, [sp, #0xac]
1010ae8a8:     	str	wzr, [sp, #0xbc]
1010ae8ac:     	strb	wzr, [sp, #0xc0]
1010ae8b0:     	movi.16b	v0, #0x0
1010ae8b4:     	stur	q0, [x24, #0x78]
1010ae8b8:     	stur	q0, [x24, #0x88]
1010ae8bc:     	stur	q0, [x24, #0x98]
1010ae8c0:     	str	xzr, [sp, #0xf8]
1010ae8c4:     	stp	d9, d8, [sp, #0x80]
1010ae8c8:     	strh	wzr, [sp, #0xa8]
1010ae8cc:     	stp	xzr, xzr, [sp, #0x98]
1010ae8d0:     	str	xzr, [sp, #0x90]
1010ae8d4:     	mov	w8, #0x1                ; =1
1010ae8d8:     	str	wzr, [sp, #0x50]
1010ae8dc:     	b	0x1010ae9d4 <-[GHOSTUIWindow handlePan:]+0xca8>
1010ae8e0:     	mov	x0, x20
1010ae8e4:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae8e8:     	cmp	x0, #0x3
1010ae8ec:     	b.eq	0x1010ae910 <-[GHOSTUIWindow handlePan:]+0xbe4>
1010ae8f0:     	mov	x0, x20
1010ae8f4:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae8f8:     	cmp	x0, #0x4
1010ae8fc:     	b.eq	0x1010ae910 <-[GHOSTUIWindow handlePan:]+0xbe4>
1010ae900:     	mov	x0, x20
1010ae904:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae908:     	cmp	x0, #0x5
1010ae90c:     	b.ne	0x1010ae9d8 <-[GHOSTUIWindow handlePan:]+0xcac>
1010ae910:     	stp	d9, d8, [sp, #0x80]
1010ae914:     	str	wzr, [sp, #0x50]
1010ae918:     	mov	w8, #0x1                ; =1
1010ae91c:     	b	0x1010ae9d4 <-[GHOSTUIWindow handlePan:]+0xca8>
1010ae920:     	mov	w0, #0x0                ; =0
1010ae924:     	strb	w0, [sp, #0xbd]
1010ae928:     	add	x8, sp, #0x50
1010ae92c:     	mov	w9, #0x1                ; =1
1010ae930:     	str	w9, [x8, w22, uxtw #2]
1010ae934:     	orr	w22, w22, #0x1
1010ae938:     	str	w22, [sp, #0x78]
1010ae93c:     	mov	x0, x20
1010ae940:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae944:     	cmp	x0, #0x2
1010ae948:     	b.ne	0x1010ae960 <-[GHOSTUIWindow handlePan:]+0xc34>
1010ae94c:     	add	x8, sp, #0x50
1010ae950:     	str	wzr, [x8, w22, uxtw #2]
1010ae954:     	ldr	w8, [sp, #0x78]
1010ae958:     	add	w22, w8, #0x1
1010ae95c:     	str	w22, [sp, #0x78]
1010ae960:     	mov	x0, x20
1010ae964:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae968:     	cmp	x0, #0x3
1010ae96c:     	b.eq	0x1010ae990 <-[GHOSTUIWindow handlePan:]+0xc64>
1010ae970:     	mov	x0, x20
1010ae974:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae978:     	cmp	x0, #0x4
1010ae97c:     	b.eq	0x1010ae990 <-[GHOSTUIWindow handlePan:]+0xc64>
1010ae980:     	mov	x0, x20
1010ae984:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae988:     	cmp	x0, #0x5
1010ae98c:     	b.ne	0x1010ae9d8 <-[GHOSTUIWindow handlePan:]+0xcac>
1010ae990:     	mov	w8, #0x0                ; =0
1010ae994:     	ldr	x9, [sp, #0xe0]
1010ae998:     	cbz	x9, 0x1010ae9bc <-[GHOSTUIWindow handlePan:]+0xc90>
1010ae99c:     	ldr	x9, [sp, #0xe8]
1010ae9a0:     	cbz	x9, 0x1010ae9bc <-[GHOSTUIWindow handlePan:]+0xc90>
1010ae9a4:     	ldr	x9, [sp, #0xf0]
1010ae9a8:     	cbz	x9, 0x1010ae9bc <-[GHOSTUIWindow handlePan:]+0xc90>
1010ae9ac:     	mov	x0, x20
1010ae9b0:     	bl	0x104b7bd20 <_objc_msgSend$state>
1010ae9b4:     	cmp	x0, #0x3
1010ae9b8:     	cset	w8, ne
1010ae9bc:     	strb	w8, [sp, #0xbe]
1010ae9c0:     	add	x8, sp, #0x50
1010ae9c4:     	mov	w9, #0x6                ; =6
1010ae9c8:     	str	w9, [x8, w22, sxtw #2]
1010ae9cc:     	ldr	w8, [sp, #0x78]
1010ae9d0:     	add	w8, w8, #0x1
1010ae9d4:     	str	w8, [sp, #0x78]
1010ae9d8:     	add	x2, sp, #0x50
1010ae9dc:     	mov	x0, x19
1010ae9e0:     	bl	0x104b78620 <_objc_msgSend$generateUserInputEvents:>
1010ae9e4:     	b	0x1010adf98 <-[GHOSTUIWindow handlePan:]+0x26c>
1010ae9e8:     	mov	x20, x0
1010ae9ec:     	cbz	x19, 0x1010aea30 <-[GHOSTUIWindow handlePan:]+0xd04>
1010ae9f0:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ae9f4:     	add	x8, x8, #0x710
1010ae9f8:     	ldr	x8, [x8]
1010ae9fc:     	mov	x0, x19
1010aea00:     	mov	w1, #0x1                ; =1
1010aea04:     	blr	x8
1010aea08:     	b	0x1010aea30 <-[GHOSTUIWindow handlePan:]+0xd04>
1010aea0c:     	bl	0x1000144bc <___clang_call_terminate>
1010aea10:     	mov	x20, x0
1010aea14:     	cbz	x23, 0x1010aea30 <-[GHOSTUIWindow handlePan:]+0xd04>
1010aea18:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010aea1c:     	add	x8, x8, #0x710
1010aea20:     	ldr	x8, [x8]
1010aea24:     	mov	x0, x23
1010aea28:     	mov	w1, #0x1                ; =1
1010aea2c:     	blr	x8
1010aea30:     	mov	x0, x20
1010aea34:     	bl	0x104b72c1c <_zlibVersion+0x104b72c1c>
1010aea38:     	bl	0x1000144bc <___clang_call_terminate>
