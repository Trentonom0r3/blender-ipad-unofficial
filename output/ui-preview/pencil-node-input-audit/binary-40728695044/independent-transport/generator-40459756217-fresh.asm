
output\ui-preview\pencil-knife\binary-40459756217\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010ab138 <-[GHOSTUIWindow generateUserInputEvents:]>:
1010ab138:     	sub	sp, sp, #0xf0
1010ab13c:     	stp	d9, d8, [sp, #0x80]
1010ab140:     	stp	x28, x27, [sp, #0x90]
1010ab144:     	stp	x26, x25, [sp, #0xa0]
1010ab148:     	stp	x24, x23, [sp, #0xb0]
1010ab14c:     	stp	x22, x21, [sp, #0xc0]
1010ab150:     	stp	x20, x19, [sp, #0xd0]
1010ab154:     	stp	x29, x30, [sp, #0xe0]
1010ab158:     	add	x29, sp, #0xe0
1010ab15c:     	mov	x20, x2
1010ab160:     	mov	x19, x0
1010ab164:     	bl	0x104b75760 <_zlibVersion+0x104b75760>
1010ab168:     	ldrb	w9, [x20, #0x58]
1010ab16c:     	adrp	x8, 0x10513b000 <__ZTSNSt3__110__function6__funcIZ19DRW_draw_depth_loopP9DepsgraphP7ARegionP6View3DP11GPUViewportbbbE3$_0NS_9allocatorISA_EEFvR17DupliCacheManagerR15ExtractionGraphEEE+0x81>
1010ab170:     	add	x8, x8, #0x944
1010ab174:     	cmp	w9, #0x1
1010ab178:     	b.ne	0x1010ab19c <-[GHOSTUIWindow generateUserInputEvents:]+0x64>
1010ab17c:     	ldrb	w8, [x20, #0x59]
1010ab180:     	cmp	w8, #0x1
1010ab184:     	b.ne	0x1010ab190 <-[GHOSTUIWindow generateUserInputEvents:]+0x58>
1010ab188:     	add	x8, x20, #0x5c
1010ab18c:     	b	0x1010ab19c <-[GHOSTUIWindow generateUserInputEvents:]+0x64>
1010ab190:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ab194:     	ldrsw	x8, [x8, #0xfa0]
1010ab198:     	add	x8, x19, x8
1010ab19c:     	str	wzr, [sp, #0x48]
1010ab1a0:     	ldr	q2, [x8]
1010ab1a4:     	ldur	q0, [x20, #0x88]
1010ab1a8:     	ldur	q1, [x20, #0x98]
1010ab1ac:     	str	q0, [sp, #0x50]
1010ab1b0:     	stp	q1, q2, [sp, #0x60]
1010ab1b4:     	ldr	x8, [sp, #0x50]
1010ab1b8:     	cbz	x8, 0x1010ab1d4 <-[GHOSTUIWindow generateUserInputEvents:]+0x9c>
1010ab1bc:     	ldr	x8, [sp, #0x58]
1010ab1c0:     	cbz	x8, 0x1010ab1d4 <-[GHOSTUIWindow generateUserInputEvents:]+0x9c>
1010ab1c4:     	ldr	x8, [sp, #0x60]
1010ab1c8:     	cmp	x8, #0x0
1010ab1cc:     	cset	w8, ne
1010ab1d0:     	str	w8, [sp, #0x48]
1010ab1d4:     	ldr	w8, [x20, #0x28]
1010ab1d8:     	cmp	w8, #0x1
1010ab1dc:     	b.lt	0x1010abd2c <-[GHOSTUIWindow generateUserInputEvents:]+0xbf4>
1010ab1e0:     	mov	x26, #0x0               ; =0
1010ab1e4:     	adrp	x8, 0x10513b000 <__ZTSNSt3__110__function6__funcIZ19DRW_draw_depth_loopP9DepsgraphP7ARegionP6View3DP11GPUViewportbbbE3$_0NS_9allocatorISA_EEFvR17DupliCacheManagerR15ExtractionGraphEEE+0x81>
1010ab1e8:     	ldr	d8, [x8, #0x8c8]
1010ab1ec:     	mov	w21, #0x1               ; =1
1010ab1f0:     	adrp	x8, 0x1063fa000 <__ZTV12GHOST_System+0x160>
1010ab1f4:     	add	x8, x8, #0xa00
1010ab1f8:     	add	x8, x8, #0x10
1010ab1fc:     	str	x8, [sp, #0x10]
1010ab200:     	adrp	x8, 0x1063fa000 <__ZTV12GHOST_System+0x160>
1010ab204:     	add	x8, x8, #0xa58
1010ab208:     	add	x8, x8, #0x10
1010ab20c:     	str	x8, [sp, #0x8]
1010ab210:     	adrp	x8, 0x1063fb000 <__ZTV15GHOST_WindowIOS+0x1c8>
1010ab214:     	add	x8, x8, #0x50
1010ab218:     	add	x8, x8, #0x10
1010ab21c:     	str	x8, [sp, #0x28]
1010ab220:     	adrp	x8, 0x10513b000 <__ZTSNSt3__110__function6__funcIZ19DRW_draw_depth_loopP9DepsgraphP7ARegionP6View3DP11GPUViewportbbbE3$_0NS_9allocatorISA_EEFvR17DupliCacheManagerR15ExtractionGraphEEE+0x81>
1010ab224:     	ldr	d9, [x8, #0x8d0]
1010ab228:     	adrp	x8, 0x1063fb000 <__ZTV15GHOST_WindowIOS+0x1c8>
1010ab22c:     	add	x8, x8, #0xa8
1010ab230:     	add	x8, x8, #0x10
1010ab234:     	str	x8, [sp, #0x18]
1010ab238:     	adrp	x8, 0x1063fa000 <__ZTV12GHOST_System+0x160>
1010ab23c:     	add	x8, x8, #0x968
1010ab240:     	add	x8, x8, #0x10
1010ab244:     	str	x8, [sp, #0x20]
1010ab248:     	b	0x1010ab2d8 <-[GHOSTUIWindow generateUserInputEvents:]+0x1a0>
1010ab24c:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ab250:     	ldrsw	x8, [x8, #0xf84]
1010ab254:     	ldr	x8, [x19, x8]
1010ab258:     	ldrb	w9, [x20, #0x6c]
1010ab25c:     	cmp	w9, #0x0
1010ab260:     	ldr	d0, [x20, #0x50]
1010ab264:     	fcvtzs	w9, d0
1010ab268:     	mov	w10, #0x4               ; =4
1010ab26c:     	mov	w11, #0x6               ; =6
1010ab270:     	csel	w10, w11, w10, ne
1010ab274:     	ldr	q0, [x20, #0x30]
1010ab278:     	fcvtzs.2d	v0, v0
1010ab27c:     	xtn.2s	v0, v0
1010ab280:     	mov	w11, #0x5               ; =5
1010ab284:     	str	w11, [x23, #0x8]
1010ab288:     	stp	x0, x8, [x23, #0x10]
1010ab28c:     	adrp	x8, 0x1063fb000 <__ZTV15GHOST_WindowIOS+0x1c8>
1010ab290:     	add	x8, x8, #0x50
1010ab294:     	add	x8, x8, #0x10
1010ab298:     	str	x8, [x23]
1010ab29c:     	mov	x8, x23
1010ab2a0:     	str	w10, [x8, #0x28]!
1010ab2a4:     	stur	d0, [x23, #0x2c]
1010ab2a8:     	stp	w9, wzr, [x23, #0x34]
1010ab2ac:     	strb	wzr, [x23, #0x3c]
1010ab2b0:     	mov	w9, #0x2                ; =2
1010ab2b4:     	str	w9, [x23, #0x40]
1010ab2b8:     	str	x8, [x23, #0x20]
1010ab2bc:     	mov	x0, x22
1010ab2c0:     	mov	x1, x23
1010ab2c4:     	bl	0x101099714 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010ab2c8:     	add	x26, x26, #0x1
1010ab2cc:     	ldrsw	x8, [x20, #0x28]
1010ab2d0:     	cmp	x26, x8
1010ab2d4:     	b.ge	0x1010abd2c <-[GHOSTUIWindow generateUserInputEvents:]+0xbf4>
1010ab2d8:     	ldr	w22, [x20, x26, lsl #2]
1010ab2dc:     	cmp	w22, #0x4
1010ab2e0:     	b.gt	0x1010ab344 <-[GHOSTUIWindow generateUserInputEvents:]+0x20c>
1010ab2e4:     	cmp	w22, #0x1
1010ab2e8:     	b.le	0x1010ab3cc <-[GHOSTUIWindow generateUserInputEvents:]+0x294>
1010ab2ec:     	cmp	w22, #0x2
1010ab2f0:     	b.eq	0x1010ab8a4 <-[GHOSTUIWindow generateUserInputEvents:]+0x76c>
1010ab2f4:     	cmp	w22, #0x3
1010ab2f8:     	b.eq	0x1010ab588 <-[GHOSTUIWindow generateUserInputEvents:]+0x450>
1010ab2fc:     	cmp	w22, #0x4
1010ab300:     	b.ne	0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010ab304:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ab308:     	ldrsw	x24, [x8, #0xf80]
1010ab30c:     	ldr	x22, [x19, x24]
1010ab310:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ab314:     	add	x8, x8, #0x750
1010ab318:     	ldr	x8, [x8]
1010ab31c:     	mov	w0, #0x48               ; =72
1010ab320:     	mov	w1, #0x10               ; =16
1010ab324:     	adrp	x2, 0x104c15000 <__ZL3hex+0x4616d>
1010ab328:     	add	x2, x2, #0xfaa
1010ab32c:     	mov	w3, #0x1                ; =1
1010ab330:     	blr	x8
1010ab334:     	mov	x23, x0
1010ab338:     	ldr	x0, [x19, x24]
1010ab33c:     	bl	0x1010957f4 <_GHOST_GetMilliSeconds>
1010ab340:     	b	0x1010ab24c <-[GHOSTUIWindow generateUserInputEvents:]+0x114>
1010ab344:     	sub	w8, w22, #0x5
1010ab348:     	cmp	w8, #0x2
1010ab34c:     	b.lo	0x1010ab460 <-[GHOSTUIWindow generateUserInputEvents:]+0x328>
1010ab350:     	cmp	w22, #0x7
1010ab354:     	b.eq	0x1010ab764 <-[GHOSTUIWindow generateUserInputEvents:]+0x62c>
1010ab358:     	cmp	w22, #0x8
1010ab35c:     	b.ne	0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010ab360:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ab364:     	ldrsw	x24, [x8, #0xf80]
1010ab368:     	ldr	x22, [x19, x24]
1010ab36c:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ab370:     	add	x8, x8, #0x750
1010ab374:     	ldr	x8, [x8]
1010ab378:     	mov	w0, #0x28               ; =40
1010ab37c:     	mov	w1, #0x10               ; =16
1010ab380:     	adrp	x2, 0x104c15000 <__ZL3hex+0x4616d>
1010ab384:     	add	x2, x2, #0xfaa
1010ab388:     	mov	w3, #0x1                ; =1
1010ab38c:     	blr	x8
1010ab390:     	mov	x23, x0
1010ab394:     	ldr	x0, [x19, x24]
1010ab398:     	ldr	x8, [x0]
1010ab39c:     	ldr	x8, [x8, #0x10]
1010ab3a0:     	blr	x8
1010ab3a4:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ab3a8:     	ldrsw	x8, [x8, #0xf84]
1010ab3ac:     	ldr	x8, [x19, x8]
1010ab3b0:     	ldr	x9, [sp, #0x20]
1010ab3b4:     	str	x9, [x23]
1010ab3b8:     	mov	w9, #0xa                ; =10
1010ab3bc:     	str	w9, [x23, #0x8]
1010ab3c0:     	stp	x0, x8, [x23, #0x10]
1010ab3c4:     	str	xzr, [x23, #0x20]
1010ab3c8:     	b	0x1010ab2bc <-[GHOSTUIWindow generateUserInputEvents:]+0x184>
1010ab3cc:     	cbz	w22, 0x1010ab460 <-[GHOSTUIWindow generateUserInputEvents:]+0x328>
1010ab3d0:     	cmp	w22, #0x1
1010ab3d4:     	b.ne	0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010ab3d8:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ab3dc:     	ldrsw	x24, [x8, #0xf80]
1010ab3e0:     	ldr	x22, [x19, x24]
1010ab3e4:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ab3e8:     	add	x8, x8, #0x750
1010ab3ec:     	ldr	x8, [x8]
1010ab3f0:     	mov	w0, #0x48               ; =72
1010ab3f4:     	mov	w1, #0x10               ; =16
1010ab3f8:     	adrp	x2, 0x104c15000 <__ZL3hex+0x4616d>
1010ab3fc:     	add	x2, x2, #0xfaa
1010ab400:     	mov	w3, #0x1                ; =1
1010ab404:     	blr	x8
1010ab408:     	mov	x23, x0
1010ab40c:     	ldr	x0, [x19, x24]
1010ab410:     	bl	0x1010957f4 <_GHOST_GetMilliSeconds>
1010ab414:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ab418:     	ldrsw	x8, [x8, #0xf84]
1010ab41c:     	ldr	x8, [x19, x8]
1010ab420:     	ldp	q0, q1, [x20, #0x30]
1010ab424:     	fcvtzs.2d	v1, v1
1010ab428:     	fcvtzs.2d	v0, v0
1010ab42c:     	uzp1.4s	v0, v0, v1
1010ab430:     	mov	w9, #0x5                ; =5
1010ab434:     	str	w9, [x23, #0x8]
1010ab438:     	stp	x0, x8, [x23, #0x10]
1010ab43c:     	ldr	x8, [sp, #0x28]
1010ab440:     	str	x8, [x23]
1010ab444:     	mov	x8, x23
1010ab448:     	mov	w9, #0x1                ; =1
1010ab44c:     	str	w9, [x8, #0x28]!
1010ab450:     	stur	q0, [x23, #0x2c]
1010ab454:     	strb	wzr, [x23, #0x3c]
1010ab458:     	mov	w21, #0x1               ; =1
1010ab45c:     	b	0x1010ab2b4 <-[GHOSTUIWindow generateUserInputEvents:]+0x17c>
1010ab460:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ab464:     	ldrsw	x28, [x8, #0x10]
1010ab468:     	ldrb	w8, [x19, x28]
1010ab46c:     	cmp	w8, #0x1
1010ab470:     	b.ne	0x1010ab52c <-[GHOSTUIWindow generateUserInputEvents:]+0x3f4>
1010ab474:     	ldr	w8, [sp, #0x48]
1010ab478:     	cbz	w8, 0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010ab47c:     	ldr	q0, [sp, #0x50]
1010ab480:     	fmov	x8, d0
1010ab484:     	cbz	x8, 0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010ab488:     	mov.d	x8, v0[1]
1010ab48c:     	ldr	x9, [sp, #0x60]
1010ab490:     	cmp	x8, #0x0
1010ab494:     	ccmp	x9, #0x0, #0x4, ne
1010ab498:     	b.eq	0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010ab49c:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ab4a0:     	ldrsw	x8, [x8, #0x28]
1010ab4a4:     	add	x8, x19, x8
1010ab4a8:     	ldr	x10, [x8]
1010ab4ac:     	cbz	x10, 0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010ab4b0:     	ldur	q1, [x8, #0x8]
1010ab4b4:     	fmov	d2, x10
1010ab4b8:     	mov.d	v2[1], v1[0]
1010ab4bc:     	cmtst.2d	v3, v1, v1
1010ab4c0:     	xtn.2s	v3, v3
1010ab4c4:     	uzp1.4h	v3, v3, v0
1010ab4c8:     	cmeq.2d	v0, v0, v2
1010ab4cc:     	xtn.2s	v0, v0
1010ab4d0:     	uzp1.4h	v0, v0, v0
1010ab4d4:     	mov.s	v3[1], v0[1]
1010ab4d8:     	shl.4h	v0, v3, #0xf
1010ab4dc:     	cmlt.4h	v0, v0, #0
1010ab4e0:     	and.8b	v0, v0, v8
1010ab4e4:     	addv.4h	h0, v0
1010ab4e8:     	fmov	w10, s0
1010ab4ec:     	and	w10, w10, #0xff
1010ab4f0:     	mov.d	x11, v1[1]
1010ab4f4:     	mov	w12, #0xf               ; =15
1010ab4f8:     	bic	w10, w12, w10
1010ab4fc:     	cmp	w10, #0x0
1010ab500:     	ccmp	x9, x11, #0x0, eq
1010ab504:     	b.ne	0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010ab508:     	ldr	w9, [sp, #0x68]
1010ab50c:     	ldr	w10, [x8, #0x18]
1010ab510:     	cmp	w9, w10
1010ab514:     	b.ne	0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010ab518:     	ldr	w9, [sp, #0x6c]
1010ab51c:     	ldr	w8, [x8, #0x1c]
1010ab520:     	cmp	w9, w8
1010ab524:     	b.ne	0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010ab528:     	b	0x1010ab570 <-[GHOSTUIWindow generateUserInputEvents:]+0x438>
1010ab52c:     	ldr	w8, [sp, #0x48]
1010ab530:     	cbz	w8, 0x1010ab570 <-[GHOSTUIWindow generateUserInputEvents:]+0x438>
1010ab534:     	ldr	x8, [sp, #0x50]
1010ab538:     	adrp	x9, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010ab53c:     	ldrsw	x9, [x9, #0x14]
1010ab540:     	ldr	x9, [x19, x9]
1010ab544:     	cmp	x8, x9
1010ab548:     	b.ls	0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010ab54c:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ab550:     	ldrsw	x8, [x8, #0xf84]
1010ab554:     	ldr	x0, [x19, x8]
1010ab558:     	add	x1, sp, #0x50
1010ab55c:     	bl	0x100b5bbcc <__ZN5ghost3ios24pencil_paint_ticket_liveEPKvRKNS0_18PencilPaintContactE>
1010ab560:     	cmp	w22, #0x6
1010ab564:     	eor	w8, w0, #0x1
1010ab568:     	csinc	w8, w8, wzr, ne
1010ab56c:     	tbnz	w8, #0x0, 0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010ab570:     	cmp	w22, #0x2
1010ab574:     	b.le	0x1010ab898 <-[GHOSTUIWindow generateUserInputEvents:]+0x760>
1010ab578:     	cmp	w22, #0x4
1010ab57c:     	b.gt	0x1010ab934 <-[GHOSTUIWindow generateUserInputEvents:]+0x7fc>
1010ab580:     	cmp	w22, #0x3
1010ab584:     	b.ne	0x1010ab304 <-[GHOSTUIWindow generateUserInputEvents:]+0x1cc>
1010ab588:     	ldp	d0, d1, [x20, #0x40]
1010ab58c:     	fmul	d0, d0, d9
1010ab590:     	adrp	x8, 0x107efe000 <__ZZN7blender4drawL21get_coarse_tan_formatEvE6format+0x158>
1010ab594:     	ldr	d2, [x8, #0xba8]
1010ab598:     	fadd	d0, d2, d0
1010ab59c:     	fmul	d1, d1, d9
1010ab5a0:     	adrp	x9, 0x107efe000 <__ZZN7blender4drawL21get_coarse_tan_formatEvE6format+0x158>
1010ab5a4:     	ldr	d2, [x9, #0xbb0]
1010ab5a8:     	fcvtzs	w27, d0
1010ab5ac:     	fadd	d1, d2, d1
1010ab5b0:     	fcvtzs	w24, d1
1010ab5b4:     	scvtf	d2, w27
1010ab5b8:     	fsub	d0, d0, d2
1010ab5bc:     	str	d0, [x8, #0xba8]
1010ab5c0:     	scvtf	d0, w24
1010ab5c4:     	fsub	d0, d1, d0
1010ab5c8:     	str	d0, [x9, #0xbb0]
1010ab5cc:     	orr	w8, w27, w24
1010ab5d0:     	cbz	w8, 0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010ab5d4:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ab5d8:     	ldrsw	x28, [x8, #0xf80]
1010ab5dc:     	ldr	x23, [x19, x28]
1010ab5e0:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ab5e4:     	add	x8, x8, #0x750
1010ab5e8:     	ldr	x8, [x8]
1010ab5ec:     	mov	w0, #0x38               ; =56
1010ab5f0:     	mov	w1, #0x10               ; =16
1010ab5f4:     	adrp	x2, 0x104c15000 <__ZL3hex+0x4616d>
1010ab5f8:     	add	x2, x2, #0xfaa
1010ab5fc:     	mov	w3, #0x1                ; =1
1010ab600:     	blr	x8
1010ab604:     	mov	x22, x0
1010ab608:     	ldr	x0, [x19, x28]
1010ab60c:     	bl	0x1010957f4 <_GHOST_GetMilliSeconds>
1010ab610:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ab614:     	ldrsw	x25, [x8, #0xf84]
1010ab618:     	ldr	x8, [x19, x25]
1010ab61c:     	mov	w9, #0xf                ; =15
1010ab620:     	str	w9, [x22, #0x8]
1010ab624:     	stp	x0, x8, [x22, #0x10]
1010ab628:     	ldr	x8, [sp, #0x18]
1010ab62c:     	str	x8, [x22]
1010ab630:     	mov	x8, x22
1010ab634:     	mov	w9, #0x100              ; =256
1010ab638:     	str	w9, [x8, #0x28]!
1010ab63c:     	strb	wzr, [x22, #0x2c]
1010ab640:     	strb	wzr, [x22, #0x32]
1010ab644:     	str	x8, [x22, #0x20]
1010ab648:     	mov	x0, x23
1010ab64c:     	mov	x1, x22
1010ab650:     	bl	0x101099714 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010ab654:     	ldr	x22, [x19, x28]
1010ab658:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ab65c:     	add	x8, x8, #0x750
1010ab660:     	ldr	x8, [x8]
1010ab664:     	mov	w0, #0x48               ; =72
1010ab668:     	mov	w1, #0x10               ; =16
1010ab66c:     	adrp	x2, 0x104c15000 <__ZL3hex+0x4616d>
1010ab670:     	add	x2, x2, #0xfaa
1010ab674:     	mov	w3, #0x1                ; =1
1010ab678:     	blr	x8
1010ab67c:     	mov	x23, x0
1010ab680:     	ldr	x0, [x19, x28]
1010ab684:     	bl	0x1010957f4 <_GHOST_GetMilliSeconds>
1010ab688:     	ldr	x8, [x19, x25]
1010ab68c:     	ldur	q0, [x20, #0x30]
1010ab690:     	fcvtzs.2d	v0, v0
1010ab694:     	xtn.2s	v0, v0
1010ab698:     	mov	w9, #0x5                ; =5
1010ab69c:     	str	w9, [x23, #0x8]
1010ab6a0:     	stp	x0, x8, [x23, #0x10]
1010ab6a4:     	adrp	x8, 0x1063fb000 <__ZTV15GHOST_WindowIOS+0x1c8>
1010ab6a8:     	add	x8, x8, #0x50
1010ab6ac:     	add	x8, x8, #0x10
1010ab6b0:     	str	x8, [x23]
1010ab6b4:     	mov	x8, x23
1010ab6b8:     	mov	w9, #0x1                ; =1
1010ab6bc:     	str	w9, [x8, #0x28]!
1010ab6c0:     	stur	d0, [x23, #0x2c]
1010ab6c4:     	stp	w27, w24, [x23, #0x34]
1010ab6c8:     	mov	w21, #0x1               ; =1
1010ab6cc:     	strb	w9, [x23, #0x3c]
1010ab6d0:     	mov	w9, #0x2                ; =2
1010ab6d4:     	str	w9, [x23, #0x40]
1010ab6d8:     	str	x8, [x23, #0x20]
1010ab6dc:     	mov	x0, x22
1010ab6e0:     	mov	x1, x23
1010ab6e4:     	bl	0x101099714 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010ab6e8:     	ldr	x22, [x19, x28]
1010ab6ec:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ab6f0:     	add	x8, x8, #0x750
1010ab6f4:     	ldr	x8, [x8]
1010ab6f8:     	mov	w0, #0x38               ; =56
1010ab6fc:     	mov	w1, #0x10               ; =16
1010ab700:     	adrp	x2, 0x104c15000 <__ZL3hex+0x4616d>
1010ab704:     	add	x2, x2, #0xfaa
1010ab708:     	mov	w3, #0x1                ; =1
1010ab70c:     	blr	x8
1010ab710:     	mov	x23, x0
1010ab714:     	ldr	x0, [x19, x28]
1010ab718:     	bl	0x1010957f4 <_GHOST_GetMilliSeconds>
1010ab71c:     	ldr	x8, [x19, x25]
1010ab720:     	mov	w9, #0x10               ; =16
1010ab724:     	str	w9, [x23, #0x8]
1010ab728:     	stp	x0, x8, [x23, #0x10]
1010ab72c:     	adrp	x8, 0x1063fb000 <__ZTV15GHOST_WindowIOS+0x1c8>
1010ab730:     	add	x8, x8, #0xa8
1010ab734:     	add	x8, x8, #0x10
1010ab738:     	str	x8, [x23]
1010ab73c:     	mov	x8, x23
1010ab740:     	mov	w9, #0x100              ; =256
1010ab744:     	str	w9, [x8, #0x28]!
1010ab748:     	strb	wzr, [x23, #0x2c]
1010ab74c:     	strb	wzr, [x23, #0x32]
1010ab750:     	str	x8, [x23, #0x20]
1010ab754:     	mov	x0, x22
1010ab758:     	mov	x1, x23
1010ab75c:     	bl	0x101099714 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010ab760:     	b	0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010ab764:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ab768:     	ldrsw	x24, [x8, #0xf80]
1010ab76c:     	ldr	x22, [x19, x24]
1010ab770:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ab774:     	add	x8, x8, #0x750
1010ab778:     	ldr	x8, [x8]
1010ab77c:     	mov	w0, #0x80               ; =128
1010ab780:     	mov	w1, #0x10               ; =16
1010ab784:     	adrp	x2, 0x104c15000 <__ZL3hex+0x4616d>
1010ab788:     	add	x2, x2, #0xfaa
1010ab78c:     	mov	w3, #0x1                ; =1
1010ab790:     	blr	x8
1010ab794:     	mov	x23, x0
1010ab798:     	ldr	x0, [x19, x24]
1010ab79c:     	bl	0x1010957f4 <_GHOST_GetMilliSeconds>
1010ab7a0:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ab7a4:     	ldrsw	x25, [x8, #0xf84]
1010ab7a8:     	ldr	x8, [x19, x25]
1010ab7ac:     	mov	w9, #0x2                ; =2
1010ab7b0:     	str	w9, [x23, #0x8]
1010ab7b4:     	stp	x0, x8, [x23, #0x10]
1010ab7b8:     	adrp	x8, 0x1063fa000 <__ZTV12GHOST_System+0x160>
1010ab7bc:     	add	x8, x8, #0xa58
1010ab7c0:     	add	x8, x8, #0x10
1010ab7c4:     	str	x8, [x23]
1010ab7c8:     	mov	x8, x23
1010ab7cc:     	mov	w9, #0x3                ; =3
1010ab7d0:     	str	w9, [x8, #0x28]!
1010ab7d4:     	adrp	x9, 0x10513b000 <__ZTSNSt3__110__function6__funcIZ19DRW_draw_depth_loopP9DepsgraphP7ARegionP6View3DP11GPUViewportbbbE3$_0NS_9allocatorISA_EEFvR17DupliCacheManagerR15ExtractionGraphEEE+0x81>
1010ab7d8:     	add	x9, x9, #0x944
1010ab7dc:     	ldr	q0, [x9]
1010ab7e0:     	str	q0, [sp, #0x30]
1010ab7e4:     	stur	q0, [x23, #0x2c]
1010ab7e8:     	strh	wzr, [x23, #0x3c]
1010ab7ec:     	stp	xzr, xzr, [x23, #0x40]
1010ab7f0:     	strb	wzr, [x23, #0x50]
1010ab7f4:     	movi.16b	v0, #0x0
1010ab7f8:     	stur	q0, [x23, #0x58]
1010ab7fc:     	stur	q0, [x23, #0x68]
1010ab800:     	str	xzr, [x23, #0x78]
1010ab804:     	str	x8, [x23, #0x20]
1010ab808:     	mov	x0, x22
1010ab80c:     	mov	x1, x23
1010ab810:     	bl	0x101099714 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010ab814:     	ldr	x22, [x19, x24]
1010ab818:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ab81c:     	add	x8, x8, #0x750
1010ab820:     	ldr	x8, [x8]
1010ab824:     	mov	w0, #0x80               ; =128
1010ab828:     	mov	w1, #0x10               ; =16
1010ab82c:     	adrp	x2, 0x104c15000 <__ZL3hex+0x4616d>
1010ab830:     	add	x2, x2, #0xfaa
1010ab834:     	mov	w3, #0x1                ; =1
1010ab838:     	blr	x8
1010ab83c:     	mov	x23, x0
1010ab840:     	ldr	x0, [x19, x24]
1010ab844:     	bl	0x1010957f4 <_GHOST_GetMilliSeconds>
1010ab848:     	ldr	x8, [x19, x25]
1010ab84c:     	mov	w9, #0x3                ; =3
1010ab850:     	str	w9, [x23, #0x8]
1010ab854:     	stp	x0, x8, [x23, #0x10]
1010ab858:     	adrp	x8, 0x1063fa000 <__ZTV12GHOST_System+0x160>
1010ab85c:     	add	x8, x8, #0xa58
1010ab860:     	add	x8, x8, #0x10
1010ab864:     	str	x8, [x23]
1010ab868:     	mov	x8, x23
1010ab86c:     	str	w9, [x8, #0x28]!
1010ab870:     	ldr	q0, [sp, #0x30]
1010ab874:     	stur	q0, [x23, #0x2c]
1010ab878:     	strh	wzr, [x23, #0x3c]
1010ab87c:     	stp	xzr, xzr, [x23, #0x40]
1010ab880:     	strb	wzr, [x23, #0x50]
1010ab884:     	movi.16b	v0, #0x0
1010ab888:     	stur	q0, [x23, #0x58]
1010ab88c:     	stur	q0, [x23, #0x68]
1010ab890:     	str	xzr, [x23, #0x78]
1010ab894:     	b	0x1010ab2b8 <-[GHOSTUIWindow generateUserInputEvents:]+0x180>
1010ab898:     	cbz	w22, 0x1010aba60 <-[GHOSTUIWindow generateUserInputEvents:]+0x928>
1010ab89c:     	cmp	w22, #0x1
1010ab8a0:     	b.eq	0x1010ab3d8 <-[GHOSTUIWindow generateUserInputEvents:]+0x2a0>
1010ab8a4:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ab8a8:     	ldrsw	x24, [x8, #0xf80]
1010ab8ac:     	ldr	x22, [x19, x24]
1010ab8b0:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ab8b4:     	add	x8, x8, #0x750
1010ab8b8:     	ldr	x8, [x8]
1010ab8bc:     	mov	w0, #0x48               ; =72
1010ab8c0:     	mov	w1, #0x10               ; =16
1010ab8c4:     	adrp	x2, 0x104c15000 <__ZL3hex+0x4616d>
1010ab8c8:     	add	x2, x2, #0xfaa
1010ab8cc:     	mov	w3, #0x1                ; =1
1010ab8d0:     	blr	x8
1010ab8d4:     	mov	x23, x0
1010ab8d8:     	ldr	x0, [x19, x24]
1010ab8dc:     	bl	0x1010957f4 <_GHOST_GetMilliSeconds>
1010ab8e0:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ab8e4:     	ldrsw	x8, [x8, #0xf84]
1010ab8e8:     	ldr	x8, [x19, x8]
1010ab8ec:     	ldp	q0, q1, [x20, #0x30]
1010ab8f0:     	fcvtzs.2d	v1, v1
1010ab8f4:     	fcvtzs.2d	v0, v0
1010ab8f8:     	uzp1.4s	v0, v0, v1
1010ab8fc:     	mov	w9, #0x5                ; =5
1010ab900:     	str	w9, [x23, #0x8]
1010ab904:     	stp	x0, x8, [x23, #0x10]
1010ab908:     	adrp	x8, 0x1063fb000 <__ZTV15GHOST_WindowIOS+0x1c8>
1010ab90c:     	add	x8, x8, #0x50
1010ab910:     	add	x8, x8, #0x10
1010ab914:     	str	x8, [x23]
1010ab918:     	mov	x8, x23
1010ab91c:     	mov	w9, #0x1                ; =1
1010ab920:     	str	w9, [x8, #0x28]!
1010ab924:     	stur	q0, [x23, #0x2c]
1010ab928:     	mov	w21, #0x1               ; =1
1010ab92c:     	strb	w9, [x23, #0x3c]
1010ab930:     	b	0x1010ab2b0 <-[GHOSTUIWindow generateUserInputEvents:]+0x178>
1010ab934:     	cmp	w22, #0x5
1010ab938:     	b.ne	0x1010abc10 <-[GHOSTUIWindow generateUserInputEvents:]+0xad8>
1010ab93c:     	ldr	w8, [sp, #0x48]
1010ab940:     	cbz	w8, 0x1010ab964 <-[GHOSTUIWindow generateUserInputEvents:]+0x82c>
1010ab944:     	ldrb	w8, [x19, x28]
1010ab948:     	tbnz	w8, #0x0, 0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010ab94c:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ab950:     	ldrsw	x8, [x8, #0xf84]
1010ab954:     	ldr	x0, [x19, x8]
1010ab958:     	add	x1, sp, #0x50
1010ab95c:     	bl	0x100b5bbcc <__ZN5ghost3ios24pencil_paint_ticket_liveEPKvRKNS0_18PencilPaintContactE>
1010ab960:     	cbz	w0, 0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010ab964:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ab968:     	ldrsw	x24, [x8, #0xf80]
1010ab96c:     	ldr	x23, [x19, x24]
1010ab970:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010ab974:     	add	x8, x8, #0x750
1010ab978:     	ldr	x8, [x8]
1010ab97c:     	mov	w0, #0x80               ; =128
1010ab980:     	mov	w1, #0x10               ; =16
1010ab984:     	adrp	x2, 0x104c15000 <__ZL3hex+0x4616d>
1010ab988:     	add	x2, x2, #0xfaa
1010ab98c:     	mov	w3, #0x1                ; =1
1010ab990:     	blr	x8
1010ab994:     	mov	x22, x0
1010ab998:     	ldr	x0, [x19, x24]
1010ab99c:     	bl	0x1010957f4 <_GHOST_GetMilliSeconds>
1010ab9a0:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010ab9a4:     	ldrsw	x8, [x8, #0xf84]
1010ab9a8:     	ldr	x8, [x19, x8]
1010ab9ac:     	ldrb	w9, [x20, #0x6e]
1010ab9b0:     	ldrb	w10, [x20, #0x6f]
1010ab9b4:     	ldr	x11, [x20, #0x70]
1010ab9b8:     	ldur	q0, [x20, #0x78]
1010ab9bc:     	mov	x12, x22
1010ab9c0:     	str	w21, [x12, #0x28]!
1010ab9c4:     	ldr	x13, [sp, #0x60]
1010ab9c8:     	ldr	q1, [sp, #0x70]
1010ab9cc:     	stur	q1, [x22, #0x2c]
1010ab9d0:     	strb	wzr, [x22, #0x3c]
1010ab9d4:     	strb	w9, [x22, #0x3d]
1010ab9d8:     	str	q0, [x22, #0x40]
1010ab9dc:     	strb	w10, [x22, #0x50]
1010ab9e0:     	str	x11, [x22, #0x58]
1010ab9e4:     	ldr	q0, [sp, #0x50]
1010ab9e8:     	str	q0, [x22, #0x60]
1010ab9ec:     	str	x13, [x22, #0x70]
1010ab9f0:     	ldr	d0, [sp, #0x68]
1010ab9f4:     	mov	w9, #0x2                ; =2
1010ab9f8:     	str	w9, [x22, #0x8]
1010ab9fc:     	stp	x0, x8, [x22, #0x10]
1010aba00:     	ldr	x8, [sp, #0x8]
1010aba04:     	str	x8, [x22]
1010aba08:     	str	d0, [x22, #0x78]
1010aba0c:     	str	x12, [x22, #0x20]
1010aba10:     	mov	x0, x23
1010aba14:     	mov	x1, x22
1010aba18:     	bl	0x101099714 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010aba1c:     	ldr	w8, [sp, #0x48]
1010aba20:     	cbz	w8, 0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010aba24:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010aba28:     	ldrsw	x8, [x8, #0x28]
1010aba2c:     	add	x8, x19, x8
1010aba30:     	ldp	q0, q1, [sp, #0x50]
1010aba34:     	stp	q0, q1, [x8]
1010aba38:     	strb	w21, [x19, x28]
1010aba3c:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010aba40:     	ldrsw	x8, [x8, #0x20]
1010aba44:     	ldur	q0, [x20, #0x30]
1010aba48:     	str	q0, [x19, x8]
1010aba4c:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010aba50:     	ldrsw	x8, [x8, #0x24]
1010aba54:     	ldr	q0, [sp, #0x70]
1010aba58:     	str	q0, [x19, x8]
1010aba5c:     	b	0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010aba60:     	ldrb	w8, [x20, #0x58]
1010aba64:     	adrp	x9, 0x106623000 <_zlibVersion+0x106623000>
1010aba68:     	ldrsw	x24, [x9, #0xf80]
1010aba6c:     	tbz	w8, #0x0, 0x1010aba9c <-[GHOSTUIWindow generateUserInputEvents:]+0x964>
1010aba70:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010aba74:     	ldrsw	x8, [x8, #0x18]
1010aba78:     	ldur	q0, [x20, #0x30]
1010aba7c:     	str	q0, [x19, x8]
1010aba80:     	ldr	x0, [x19, x24]
1010aba84:     	ldr	x8, [x0]
1010aba88:     	ldr	x8, [x8, #0x10]
1010aba8c:     	blr	x8
1010aba90:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010aba94:     	ldrsw	x8, [x8, #0x1c]
1010aba98:     	str	x0, [x19, x8]
1010aba9c:     	ldr	x23, [x19, x24]
1010abaa0:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010abaa4:     	add	x8, x8, #0x750
1010abaa8:     	ldr	x8, [x8]
1010abaac:     	mov	w0, #0x88               ; =136
1010abab0:     	mov	w1, #0x10               ; =16
1010abab4:     	adrp	x2, 0x104c15000 <__ZL3hex+0x4616d>
1010abab8:     	add	x2, x2, #0xfaa
1010ababc:     	mov	w3, #0x1                ; =1
1010abac0:     	blr	x8
1010abac4:     	mov	x22, x0
1010abac8:     	ldr	x0, [x19, x24]
1010abacc:     	bl	0x1010957f4 <_GHOST_GetMilliSeconds>
1010abad0:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010abad4:     	ldrsw	x8, [x8, #0xf84]
1010abad8:     	ldr	x8, [x19, x8]
1010abadc:     	ldrb	w9, [x20, #0x6e]
1010abae0:     	ldrb	w10, [x20, #0x6f]
1010abae4:     	ldr	x11, [x20, #0x70]
1010abae8:     	ldr	x12, [sp, #0x60]
1010abaec:     	ldur	q0, [x20, #0x78]
1010abaf0:     	ldr	q1, [x20, #0x30]
1010abaf4:     	fcvtzs.2d	v1, v1
1010abaf8:     	xtn.2s	v1, v1
1010abafc:     	mov	x13, x22
1010abb00:     	str	d1, [x13, #0x28]!
1010abb04:     	ldr	q1, [sp, #0x70]
1010abb08:     	str	q1, [x22, #0x30]
1010abb0c:     	strb	w9, [x22, #0x40]
1010abb10:     	stur	q0, [x22, #0x48]
1010abb14:     	strb	w10, [x22, #0x58]
1010abb18:     	str	x11, [x22, #0x60]
1010abb1c:     	ldr	q0, [sp, #0x50]
1010abb20:     	stur	q0, [x22, #0x68]
1010abb24:     	str	x12, [x22, #0x78]
1010abb28:     	ldr	d0, [sp, #0x68]
1010abb2c:     	str	w21, [x22, #0x8]
1010abb30:     	stp	x0, x8, [x22, #0x10]
1010abb34:     	ldr	x8, [sp, #0x10]
1010abb38:     	str	x8, [x22]
1010abb3c:     	str	d0, [x22, #0x80]
1010abb40:     	str	x13, [x22, #0x20]
1010abb44:     	mov	x0, x23
1010abb48:     	mov	x1, x22
1010abb4c:     	bl	0x101099714 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010abb50:     	ldr	w8, [sp, #0x48]
1010abb54:     	cbz	w8, 0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010abb58:     	ldrb	w8, [x19, x28]
1010abb5c:     	cmp	w8, #0x1
1010abb60:     	b.ne	0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010abb64:     	ldr	q0, [sp, #0x50]
1010abb68:     	fmov	x8, d0
1010abb6c:     	cbz	x8, 0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010abb70:     	mov.d	x8, v0[1]
1010abb74:     	cbz	x8, 0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010abb78:     	ldr	x9, [sp, #0x60]
1010abb7c:     	cbz	x9, 0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010abb80:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010abb84:     	ldrsw	x8, [x8, #0x28]
1010abb88:     	add	x8, x19, x8
1010abb8c:     	ldr	x10, [x8]
1010abb90:     	cbz	x10, 0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010abb94:     	ldur	q1, [x8, #0x8]
1010abb98:     	fmov	d2, x10
1010abb9c:     	mov.d	v2[1], v1[0]
1010abba0:     	cmtst.2d	v3, v1, v1
1010abba4:     	xtn.2s	v3, v3
1010abba8:     	uzp1.4h	v3, v3, v0
1010abbac:     	cmeq.2d	v0, v0, v2
1010abbb0:     	xtn.2s	v0, v0
1010abbb4:     	uzp1.4h	v0, v0, v0
1010abbb8:     	mov.s	v3[1], v0[1]
1010abbbc:     	shl.4h	v0, v3, #0xf
1010abbc0:     	cmlt.4h	v0, v0, #0
1010abbc4:     	and.8b	v0, v0, v8
1010abbc8:     	addv.4h	h0, v0
1010abbcc:     	fmov	w10, s0
1010abbd0:     	and	w10, w10, #0xff
1010abbd4:     	mov.d	x11, v1[1]
1010abbd8:     	mov	w12, #0xf               ; =15
1010abbdc:     	bic	w10, w12, w10
1010abbe0:     	cmp	w10, #0x0
1010abbe4:     	ccmp	x9, x11, #0x0, eq
1010abbe8:     	b.ne	0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010abbec:     	ldr	w9, [sp, #0x68]
1010abbf0:     	ldr	w10, [x8, #0x18]
1010abbf4:     	cmp	w9, w10
1010abbf8:     	b.ne	0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010abbfc:     	ldr	w9, [sp, #0x6c]
1010abc00:     	ldr	w8, [x8, #0x1c]
1010abc04:     	cmp	w9, w8
1010abc08:     	b.ne	0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010abc0c:     	b	0x1010aba3c <-[GHOSTUIWindow generateUserInputEvents:]+0x904>
1010abc10:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010abc14:     	ldrsw	x24, [x8, #0xf80]
1010abc18:     	ldr	x22, [x19, x24]
1010abc1c:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010abc20:     	add	x8, x8, #0x750
1010abc24:     	ldr	x8, [x8]
1010abc28:     	mov	w0, #0x80               ; =128
1010abc2c:     	mov	w1, #0x10               ; =16
1010abc30:     	adrp	x2, 0x104c15000 <__ZL3hex+0x4616d>
1010abc34:     	add	x2, x2, #0xfaa
1010abc38:     	mov	w3, #0x1                ; =1
1010abc3c:     	blr	x8
1010abc40:     	mov	x23, x0
1010abc44:     	ldr	x0, [x19, x24]
1010abc48:     	bl	0x1010957f4 <_GHOST_GetMilliSeconds>
1010abc4c:     	adrp	x8, 0x106623000 <_zlibVersion+0x106623000>
1010abc50:     	ldrsw	x8, [x8, #0xf84]
1010abc54:     	ldr	x8, [x19, x8]
1010abc58:     	ldurh	w9, [x20, #0x6d]
1010abc5c:     	ldrb	w10, [x20, #0x6f]
1010abc60:     	ldr	x11, [x20, #0x70]
1010abc64:     	ldur	q0, [x20, #0x78]
1010abc68:     	mov	x12, x23
1010abc6c:     	str	w21, [x12, #0x28]!
1010abc70:     	ldr	x13, [sp, #0x60]
1010abc74:     	ldr	q1, [sp, #0x70]
1010abc78:     	stur	q1, [x23, #0x2c]
1010abc7c:     	strh	w9, [x23, #0x3c]
1010abc80:     	str	q0, [x23, #0x40]
1010abc84:     	strb	w10, [x23, #0x50]
1010abc88:     	str	x11, [x23, #0x58]
1010abc8c:     	ldr	q0, [sp, #0x50]
1010abc90:     	str	q0, [x23, #0x60]
1010abc94:     	str	x13, [x23, #0x70]
1010abc98:     	ldr	d0, [sp, #0x68]
1010abc9c:     	mov	w9, #0x3                ; =3
1010abca0:     	str	w9, [x23, #0x8]
1010abca4:     	stp	x0, x8, [x23, #0x10]
1010abca8:     	adrp	x8, 0x1063fa000 <__ZTV12GHOST_System+0x160>
1010abcac:     	add	x8, x8, #0xa58
1010abcb0:     	add	x8, x8, #0x10
1010abcb4:     	str	x8, [x23]
1010abcb8:     	str	d0, [x23, #0x78]
1010abcbc:     	str	x12, [x23, #0x20]
1010abcc0:     	mov	x0, x22
1010abcc4:     	mov	x1, x23
1010abcc8:     	bl	0x101099714 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010abccc:     	ldr	w8, [sp, #0x48]
1010abcd0:     	cbz	w8, 0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010abcd4:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010abcd8:     	ldrsw	x8, [x8, #0x20]
1010abcdc:     	ldur	q0, [x20, #0x30]
1010abce0:     	str	q0, [x19, x8]
1010abce4:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010abce8:     	ldrsw	x8, [x8, #0x24]
1010abcec:     	ldr	q0, [sp, #0x70]
1010abcf0:     	str	q0, [x19, x8]
1010abcf4:     	strb	wzr, [x19, x28]
1010abcf8:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010abcfc:     	ldrsw	x8, [x8, #0x14]
1010abd00:     	ldr	x9, [x19, x8]
1010abd04:     	ldr	x10, [sp, #0x50]
1010abd08:     	cmp	x9, x10
1010abd0c:     	csel	x9, x9, x10, hi
1010abd10:     	str	x9, [x19, x8]
1010abd14:     	adrp	x8, 0x106624000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010abd18:     	ldrsw	x8, [x8, #0x28]
1010abd1c:     	add	x8, x19, x8
1010abd20:     	movi.16b	v0, #0x0
1010abd24:     	stp	q0, q0, [x8]
1010abd28:     	b	0x1010ab2c8 <-[GHOSTUIWindow generateUserInputEvents:]+0x190>
1010abd2c:     	mov	x0, x19
1010abd30:     	bl	0x104b7576c <_zlibVersion+0x104b7576c>
1010abd34:     	ldp	x29, x30, [sp, #0xe0]
1010abd38:     	ldp	x20, x19, [sp, #0xd0]
1010abd3c:     	ldp	x22, x21, [sp, #0xc0]
1010abd40:     	ldp	x24, x23, [sp, #0xb0]
1010abd44:     	ldp	x26, x25, [sp, #0xa0]
1010abd48:     	ldp	x28, x27, [sp, #0x90]
1010abd4c:     	ldp	d9, d8, [sp, #0x80]
1010abd50:     	add	sp, sp, #0xf0
1010abd54:     	ret
1010abd58:     	mov	x20, x0
1010abd5c:     	cbz	x22, 0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abd60:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010abd64:     	add	x8, x8, #0x710
1010abd68:     	ldr	x8, [x8]
1010abd6c:     	mov	x0, x22
1010abd70:     	mov	w1, #0x1                ; =1
1010abd74:     	blr	x8
1010abd78:     	b	0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abd7c:     	bl	0x1000144bc <___clang_call_terminate>
1010abd80:     	mov	x20, x0
1010abd84:     	cbz	x22, 0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abd88:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010abd8c:     	add	x8, x8, #0x710
1010abd90:     	ldr	x8, [x8]
1010abd94:     	mov	x0, x22
1010abd98:     	mov	w1, #0x1                ; =1
1010abd9c:     	blr	x8
1010abda0:     	b	0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abda4:     	bl	0x1000144bc <___clang_call_terminate>
1010abda8:     	mov	x20, x0
1010abdac:     	cbz	x23, 0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abdb0:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010abdb4:     	add	x8, x8, #0x710
1010abdb8:     	ldr	x8, [x8]
1010abdbc:     	mov	x0, x23
1010abdc0:     	mov	w1, #0x1                ; =1
1010abdc4:     	blr	x8
1010abdc8:     	b	0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abdcc:     	bl	0x1000144bc <___clang_call_terminate>
1010abdd0:     	mov	x20, x0
1010abdd4:     	cbz	x23, 0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abdd8:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010abddc:     	add	x8, x8, #0x710
1010abde0:     	ldr	x8, [x8]
1010abde4:     	mov	x0, x23
1010abde8:     	mov	w1, #0x1                ; =1
1010abdec:     	blr	x8
1010abdf0:     	b	0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abdf4:     	bl	0x1000144bc <___clang_call_terminate>
1010abdf8:     	mov	x20, x0
1010abdfc:     	cbz	x23, 0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abe00:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010abe04:     	add	x8, x8, #0x710
1010abe08:     	ldr	x8, [x8]
1010abe0c:     	mov	x0, x23
1010abe10:     	mov	w1, #0x1                ; =1
1010abe14:     	blr	x8
1010abe18:     	b	0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abe1c:     	bl	0x1000144bc <___clang_call_terminate>
1010abe20:     	mov	x20, x0
1010abe24:     	cbz	x22, 0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abe28:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010abe2c:     	add	x8, x8, #0x710
1010abe30:     	ldr	x8, [x8]
1010abe34:     	mov	x0, x22
1010abe38:     	mov	w1, #0x1                ; =1
1010abe3c:     	blr	x8
1010abe40:     	b	0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abe44:     	bl	0x1000144bc <___clang_call_terminate>
1010abe48:     	mov	x20, x0
1010abe4c:     	cbz	x23, 0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abe50:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010abe54:     	add	x8, x8, #0x710
1010abe58:     	ldr	x8, [x8]
1010abe5c:     	mov	x0, x23
1010abe60:     	mov	w1, #0x1                ; =1
1010abe64:     	blr	x8
1010abe68:     	b	0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abe6c:     	bl	0x1000144bc <___clang_call_terminate>
1010abe70:     	mov	x20, x0
1010abe74:     	cbz	x23, 0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abe78:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010abe7c:     	add	x8, x8, #0x710
1010abe80:     	ldr	x8, [x8]
1010abe84:     	mov	x0, x23
1010abe88:     	mov	w1, #0x1                ; =1
1010abe8c:     	blr	x8
1010abe90:     	b	0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abe94:     	bl	0x1000144bc <___clang_call_terminate>
1010abe98:     	mov	x20, x0
1010abe9c:     	cbz	x23, 0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abea0:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010abea4:     	add	x8, x8, #0x710
1010abea8:     	ldr	x8, [x8]
1010abeac:     	mov	x0, x23
1010abeb0:     	mov	w1, #0x1                ; =1
1010abeb4:     	blr	x8
1010abeb8:     	b	0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abebc:     	bl	0x1000144bc <___clang_call_terminate>
1010abec0:     	mov	x20, x0
1010abec4:     	cbz	x23, 0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abec8:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010abecc:     	add	x8, x8, #0x710
1010abed0:     	ldr	x8, [x8]
1010abed4:     	mov	x0, x23
1010abed8:     	mov	w1, #0x1                ; =1
1010abedc:     	blr	x8
1010abee0:     	b	0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abee4:     	bl	0x1000144bc <___clang_call_terminate>
1010abee8:     	mov	x20, x0
1010abeec:     	cbz	x23, 0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abef0:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010abef4:     	add	x8, x8, #0x710
1010abef8:     	ldr	x8, [x8]
1010abefc:     	mov	x0, x23
1010abf00:     	mov	w1, #0x1                ; =1
1010abf04:     	blr	x8
1010abf08:     	b	0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abf0c:     	bl	0x1000144bc <___clang_call_terminate>
1010abf10:     	mov	x20, x0
1010abf14:     	cbz	x23, 0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abf18:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010abf1c:     	add	x8, x8, #0x710
1010abf20:     	ldr	x8, [x8]
1010abf24:     	mov	x0, x23
1010abf28:     	mov	w1, #0x1                ; =1
1010abf2c:     	blr	x8
1010abf30:     	b	0x1010abf40 <-[GHOSTUIWindow generateUserInputEvents:]+0xe08>
1010abf34:     	bl	0x1000144bc <___clang_call_terminate>
1010abf38:     	b	0x1010abf3c <-[GHOSTUIWindow generateUserInputEvents:]+0xe04>
1010abf3c:     	mov	x20, x0
1010abf40:     	mov	x0, x19
1010abf44:     	bl	0x104b7576c <_zlibVersion+0x104b7576c>
1010abf48:     	mov	x0, x20
1010abf4c:     	bl	0x104b7207c <_zlibVersion+0x104b7207c>
