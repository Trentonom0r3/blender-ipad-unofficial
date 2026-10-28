
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010aa150 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]>:
1010aa150:     	stp	d15, d14, [sp, #-0xa0]!
1010aa154:     	stp	d13, d12, [sp, #0x10]
1010aa158:     	stp	d11, d10, [sp, #0x20]
1010aa15c:     	stp	d9, d8, [sp, #0x30]
1010aa160:     	stp	x28, x27, [sp, #0x40]
1010aa164:     	stp	x26, x25, [sp, #0x50]
1010aa168:     	stp	x24, x23, [sp, #0x60]
1010aa16c:     	stp	x22, x21, [sp, #0x70]
1010aa170:     	stp	x20, x19, [sp, #0x80]
1010aa174:     	stp	x29, x30, [sp, #0x90]
1010aa178:     	add	x29, sp, #0x90
1010aa17c:     	sub	sp, sp, #0x1b0
1010aa180:     	str	x3, [sp]
1010aa184:     	mov	x19, x2
1010aa188:     	mov	x20, x0
1010aa18c:     	adrp	x8, 0x106369000 <_zlibVersion+0x106369000>
1010aa190:     	ldr	x8, [x8, #0x7f8]
1010aa194:     	ldr	x8, [x8]
1010aa198:     	stur	x8, [x29, #-0xa0]
1010aa19c:     	movi.16b	v0, #0x0
1010aa1a0:     	stp	q0, q0, [sp, #0x60]
1010aa1a4:     	stp	q0, q0, [sp, #0x80]
1010aa1a8:     	add	x2, sp, #0x60
1010aa1ac:     	add	x3, sp, #0x120
1010aa1b0:     	mov	x0, x19
1010aa1b4:     	mov	w4, #0x10               ; =16
1010aa1b8:     	bl	0x104b77d40 <_objc_msgSend$countByEnumeratingWithState:objects:count:>
1010aa1bc:     	adrp	x25, 0x106627000 <_zlibVersion+0x106627000>
1010aa1c0:     	cbz	x0, 0x1010aa494 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x344>
1010aa1c4:     	mov	x22, x0
1010aa1c8:     	ldr	x8, [sp, #0x70]
1010aa1cc:     	ldr	x26, [x8]
1010aa1d0:     	fmov	d11, #1.00000000
1010aa1d4:     	fmov	d12, xzr
1010aa1d8:     	b	0x1010aa1f8 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0xa8>
1010aa1dc:     	add	x2, sp, #0x60
1010aa1e0:     	add	x3, sp, #0x120
1010aa1e4:     	mov	x0, x19
1010aa1e8:     	mov	w4, #0x10               ; =16
1010aa1ec:     	bl	0x104b77d40 <_objc_msgSend$countByEnumeratingWithState:objects:count:>
1010aa1f0:     	mov	x22, x0
1010aa1f4:     	cbz	x0, 0x1010aa494 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x344>
1010aa1f8:     	mov	x21, #0x0               ; =0
1010aa1fc:     	str	x22, [sp, #0x8]
1010aa200:     	b	0x1010aa220 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0xd0>
1010aa204:     	strb	w8, [x9, #0x30]
1010aa208:     	stp	s1, s3, [x9, #0x34]
1010aa20c:     	str	s2, [x9, #0x3c]
1010aa210:     	strb	w27, [x9, #0x40]
1010aa214:     	add	x21, x21, #0x1
1010aa218:     	cmp	x22, x21
1010aa21c:     	b.eq	0x1010aa1dc <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x8c>
1010aa220:     	ldr	x8, [sp, #0x70]
1010aa224:     	ldr	x8, [x8]
1010aa228:     	cmp	x8, x26
1010aa22c:     	b.eq	0x1010aa238 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0xe8>
1010aa230:     	mov	x0, x19
1010aa234:     	bl	0x104b761bc <_zlibVersion+0x104b761bc>
1010aa238:     	ldr	x8, [sp, #0x68]
1010aa23c:     	ldr	x23, [x8, x21, lsl #3]
1010aa240:     	ldrsw	x28, [x25, #0xf5c]
1010aa244:     	mov	x0, x20
1010aa248:     	bl	0x104b7c2c0 <_objc_msgSend$view>
1010aa24c:     	fmov	s13, wzr
1010aa250:     	cbz	x23, 0x1010aa314 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x1c4>
1010aa254:     	mov	x24, x0
1010aa258:     	mov	x0, x23
1010aa25c:     	bl	0x104b7c180 <_objc_msgSend$type>
1010aa260:     	mov	w27, #0x0               ; =0
1010aa264:     	cbz	x24, 0x1010aa328 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x1d8>
1010aa268:     	cmp	x0, #0x2
1010aa26c:     	b.ne	0x1010aa328 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x1d8>
1010aa270:     	mov	x22, x26
1010aa274:     	mov	x26, x19
1010aa278:     	mov	x19, x25
1010aa27c:     	mov	x0, x23
1010aa280:     	bl	0x104b784a0 <_objc_msgSend$force>
1010aa284:     	fmov	d8, d0
1010aa288:     	fmov	x27, d8
1010aa28c:     	mov	x0, x23
1010aa290:     	bl	0x104b79060 <_objc_msgSend$maximumPossibleForce>
1010aa294:     	fmov	d10, d0
1010aa298:     	fmov	x25, d10
1010aa29c:     	mov	x0, x23
1010aa2a0:     	mov	x2, x24
1010aa2a4:     	bl	0x104b774e0 <_objc_msgSend$azimuthAngleInView:>
1010aa2a8:     	fmov	d9, d0
1010aa2ac:     	fmov	x24, d9
1010aa2b0:     	mov	x0, x23
1010aa2b4:     	bl	0x104b773a0 <_objc_msgSend$altitudeAngle>
1010aa2b8:     	fmov	x8, d0
1010aa2bc:     	and	x9, x27, #0x7fffffffffffffff
1010aa2c0:     	and	x10, x25, #0x7fffffffffffffff
1010aa2c4:     	mov	x12, #0x7ff0000000000000 ; =9218868437227405312
1010aa2c8:     	cmp	x10, x12
1010aa2cc:     	cset	w10, lt
1010aa2d0:     	and	x11, x24, #0x7fffffffffffffff
1010aa2d4:     	cmp	x11, x12
1010aa2d8:     	cset	w11, lt
1010aa2dc:     	and	x8, x8, #0x7fffffffffffffff
1010aa2e0:     	cmp	x8, x12
1010aa2e4:     	cset	w8, lt
1010aa2e8:     	mov	x12, #0x7fefffffffffffff ; =9218868437227405311
1010aa2ec:     	cmp	x9, x12
1010aa2f0:     	ccmp	w10, #0x0, #0x4, le
1010aa2f4:     	ccmp	w11, #0x0, #0x4, ne
1010aa2f8:     	ccmp	w8, #0x0, #0x4, ne
1010aa2fc:     	b.ne	0x1010aa338 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x1e8>
1010aa300:     	mov	w27, #0x0               ; =0
1010aa304:     	mov	w8, #0x0                ; =0
1010aa308:     	fmov	s0, wzr
1010aa30c:     	fmov	s14, wzr
1010aa310:     	b	0x1010aa38c <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x23c>
1010aa314:     	mov	w27, #0x0               ; =0
1010aa318:     	mov	w8, #0x0                ; =0
1010aa31c:     	fmov	s0, wzr
1010aa320:     	fmov	s14, wzr
1010aa324:     	b	0x1010aa39c <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x24c>
1010aa328:     	fmov	s0, wzr
1010aa32c:     	fmov	s14, wzr
1010aa330:     	mov	x8, x27
1010aa334:     	b	0x1010aa39c <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x24c>
1010aa338:     	fcmp	d10, #0.0
1010aa33c:     	cset	w27, gt
1010aa340:     	fdiv	d1, d8, d10
1010aa344:     	fcsel	d1, d1, d11, gt
1010aa348:     	fcmp	d1, d11
1010aa34c:     	fcsel	d2, d11, d1, gt
1010aa350:     	fcmp	d1, #0.0
1010aa354:     	fcsel	d1, d12, d2, mi
1010aa358:     	fcvt	s14, d1
1010aa35c:     	fmov	d8, d0
1010aa360:     	fmov	d0, d9
1010aa364:     	bl	0x104b7531c <_zlibVersion+0x104b7531c>
1010aa368:     	fmov	d9, d0
1010aa36c:     	fmov	d10, d1
1010aa370:     	fmov	d0, d8
1010aa374:     	bl	0x104b75634 <_zlibVersion+0x104b75634>
1010aa378:     	fmul	d1, d9, d0
1010aa37c:     	fcvt	s13, d1
1010aa380:     	fnmul	d0, d10, d0
1010aa384:     	fcvt	s0, d0
1010aa388:     	mov	w8, #0x1                ; =1
1010aa38c:     	mov	x25, x19
1010aa390:     	mov	x19, x26
1010aa394:     	mov	x26, x22
1010aa398:     	ldr	x22, [sp, #0x8]
1010aa39c:     	add	x9, x20, x28
1010aa3a0:     	ldr	x10, [x9, #0x8]
1010aa3a4:     	cmp	x10, #0x0
1010aa3a8:     	ccmp	x10, x23, #0x0, ne
1010aa3ac:     	b.ne	0x1010aa214 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0xc4>
1010aa3b0:     	ldr	w10, [x9]
1010aa3b4:     	cmp	w10, #0x2
1010aa3b8:     	b.ne	0x1010aa214 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0xc4>
1010aa3bc:     	fmov	w10, s14
1010aa3c0:     	and	w10, w10, #0x7fffffff
1010aa3c4:     	mov	w13, #0x7f7fffff        ; =2139095039
1010aa3c8:     	cmp	w10, w13
1010aa3cc:     	cset	w10, gt
1010aa3d0:     	fmov	w11, s13
1010aa3d4:     	and	w11, w11, #0x7fffffff
1010aa3d8:     	cmp	w11, w13
1010aa3dc:     	cset	w11, gt
1010aa3e0:     	fmov	w12, s0
1010aa3e4:     	and	w12, w12, #0x7fffffff
1010aa3e8:     	cmp	w12, w13
1010aa3ec:     	cset	w12, gt
1010aa3f0:     	cbz	w8, 0x1010aa214 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0xc4>
1010aa3f4:     	tbnz	w10, #0x0, 0x1010aa214 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0xc4>
1010aa3f8:     	tbnz	w11, #0x0, 0x1010aa214 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0xc4>
1010aa3fc:     	tbnz	w12, #0x0, 0x1010aa214 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0xc4>
1010aa400:     	fmov	s1, wzr
1010aa404:     	fcmp	s14, #0.0
1010aa408:     	b.mi	0x1010aa41c <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x2cc>
1010aa40c:     	fmov	s1, #1.00000000
1010aa410:     	fcmp	s14, s1
1010aa414:     	b.gt	0x1010aa41c <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x2cc>
1010aa418:     	fmov	s1, s14
1010aa41c:     	fmov	s2, #-1.00000000
1010aa420:     	fcmp	s13, s2
1010aa424:     	fmov	s3, #-1.00000000
1010aa428:     	b.mi	0x1010aa43c <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x2ec>
1010aa42c:     	fmov	s3, #1.00000000
1010aa430:     	fcmp	s13, s3
1010aa434:     	b.gt	0x1010aa43c <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x2ec>
1010aa438:     	fmov	s3, s13
1010aa43c:     	fcmp	s0, s2
1010aa440:     	b.mi	0x1010aa454 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x304>
1010aa444:     	fmov	s2, #1.00000000
1010aa448:     	fcmp	s0, s2
1010aa44c:     	b.gt	0x1010aa454 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x304>
1010aa450:     	fmov	s2, s0
1010aa454:     	strb	w8, [x9, #0x1c]
1010aa458:     	stp	s1, s3, [x9, #0x20]
1010aa45c:     	str	s2, [x9, #0x28]
1010aa460:     	strb	w27, [x9, #0x2c]
1010aa464:     	ldrb	w10, [x9, #0x30]
1010aa468:     	cmp	w10, #0x1
1010aa46c:     	b.ne	0x1010aa204 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0xb4>
1010aa470:     	ldrb	w10, [x9, #0x40]
1010aa474:     	cbz	w27, 0x1010aa47c <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x32c>
1010aa478:     	tbz	w10, #0x0, 0x1010aa204 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0xb4>
1010aa47c:     	cmp	w27, w10
1010aa480:     	b.ne	0x1010aa214 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0xc4>
1010aa484:     	ldr	s0, [x9, #0x34]
1010aa488:     	fcmp	s1, s0
1010aa48c:     	b.gt	0x1010aa204 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0xb4>
1010aa490:     	b	0x1010aa214 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0xc4>
1010aa494:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aa498:     	ldr	x8, [x8, #0xdf8]
1010aa49c:     	stp	x20, x8, [sp, #0x50]
1010aa4a0:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aa4a4:     	ldr	x1, [x8, #0xa70]
1010aa4a8:     	add	x0, sp, #0x50
1010aa4ac:     	mov	x2, x19
1010aa4b0:     	ldr	x3, [sp]
1010aa4b4:     	bl	0x104b761c8 <_zlibVersion+0x104b761c8>
1010aa4b8:     	movi.16b	v0, #0x0
1010aa4bc:     	stp	q0, q0, [sp, #0x30]
1010aa4c0:     	stp	q0, q0, [sp, #0x10]
1010aa4c4:     	add	x2, sp, #0x10
1010aa4c8:     	add	x3, sp, #0xa0
1010aa4cc:     	mov	x0, x19
1010aa4d0:     	mov	w4, #0x10               ; =16
1010aa4d4:     	bl	0x104b77d40 <_objc_msgSend$countByEnumeratingWithState:objects:count:>
1010aa4d8:     	cbz	x0, 0x1010aa55c <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x40c>
1010aa4dc:     	mov	x21, x0
1010aa4e0:     	ldr	x8, [sp, #0x20]
1010aa4e4:     	ldr	x22, [x8]
1010aa4e8:     	b	0x1010aa508 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x3b8>
1010aa4ec:     	add	x2, sp, #0x10
1010aa4f0:     	add	x3, sp, #0xa0
1010aa4f4:     	mov	x0, x19
1010aa4f8:     	mov	w4, #0x10               ; =16
1010aa4fc:     	bl	0x104b77d40 <_objc_msgSend$countByEnumeratingWithState:objects:count:>
1010aa500:     	mov	x21, x0
1010aa504:     	cbz	x0, 0x1010aa55c <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x40c>
1010aa508:     	mov	x23, #0x0               ; =0
1010aa50c:     	b	0x1010aa51c <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x3cc>
1010aa510:     	add	x23, x23, #0x1
1010aa514:     	cmp	x21, x23
1010aa518:     	b.eq	0x1010aa4ec <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x39c>
1010aa51c:     	ldr	x8, [sp, #0x20]
1010aa520:     	ldr	x8, [x8]
1010aa524:     	cmp	x8, x22
1010aa528:     	b.eq	0x1010aa534 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x3e4>
1010aa52c:     	mov	x0, x19
1010aa530:     	bl	0x104b761bc <_zlibVersion+0x104b761bc>
1010aa534:     	ldr	x8, [sp, #0x18]
1010aa538:     	ldr	x9, [x8, x23, lsl #3]
1010aa53c:     	ldrsw	x8, [x25, #0xf5c]
1010aa540:     	add	x8, x20, x8
1010aa544:     	ldr	x10, [x8, #0x8]
1010aa548:     	cmp	x10, #0x0
1010aa54c:     	ccmp	x10, x9, #0x0, ne
1010aa550:     	b.ne	0x1010aa510 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x3c0>
1010aa554:     	strb	wzr, [x8, #0x18]
1010aa558:     	b	0x1010aa510 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x3c0>
1010aa55c:     	ldur	x8, [x29, #-0xa0]
1010aa560:     	adrp	x9, 0x106369000 <_zlibVersion+0x106369000>
1010aa564:     	ldr	x9, [x9, #0x7f8]
1010aa568:     	ldr	x9, [x9]
1010aa56c:     	cmp	x9, x8
1010aa570:     	b.ne	0x1010aa5a4 <-[GHOSTUIPanGestureRecognizer touchesEnded:withEvent:]+0x454>
1010aa574:     	add	sp, sp, #0x1b0
1010aa578:     	ldp	x29, x30, [sp, #0x90]
1010aa57c:     	ldp	x20, x19, [sp, #0x80]
1010aa580:     	ldp	x22, x21, [sp, #0x70]
1010aa584:     	ldp	x24, x23, [sp, #0x60]
1010aa588:     	ldp	x26, x25, [sp, #0x50]
1010aa58c:     	ldp	x28, x27, [sp, #0x40]
1010aa590:     	ldp	d9, d8, [sp, #0x30]
1010aa594:     	ldp	d11, d10, [sp, #0x20]
1010aa598:     	ldp	d13, d12, [sp, #0x10]
1010aa59c:     	ldp	d15, d14, [sp], #0xa0
1010aa5a0:     	ret
1010aa5a4:     	bl	0x104b7534c <_zlibVersion+0x104b7534c>
