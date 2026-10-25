
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163e1d8 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion>:
10163e1d8:     	sub	sp, sp, #0x140
10163e1dc:     	stp	x28, x27, [sp, #0xe0]
10163e1e0:     	stp	x26, x25, [sp, #0xf0]
10163e1e4:     	stp	x24, x23, [sp, #0x100]
10163e1e8:     	stp	x22, x21, [sp, #0x110]
10163e1ec:     	stp	x20, x19, [sp, #0x120]
10163e1f0:     	stp	x29, x30, [sp, #0x130]
10163e1f4:     	add	x29, sp, #0x130
10163e1f8:     	mov	x19, x1
10163e1fc:     	mov	x20, x0
10163e200:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
10163e204:     	ldr	x8, [x8, #0x7f0]
10163e208:     	ldr	x8, [x8]
10163e20c:     	stur	x8, [x29, #-0x58]
10163e210:     	str	xzr, [x3, #0xb0]
10163e214:     	movi.16b	v0, #0x0
10163e218:     	stp	q0, q0, [x3, #0x90]
10163e21c:     	stp	q0, q0, [x3, #0x70]
10163e220:     	stp	q0, q0, [x3, #0x50]
10163e224:     	stp	q0, q0, [x3, #0x30]
10163e228:     	stp	q0, q0, [x3, #0x10]
10163e22c:     	str	q0, [x3]
10163e230:     	cbz	x4, 0x10163e238 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x60>
10163e234:     	str	xzr, [x4]
10163e238:     	cbz	x2, 0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e23c:     	mov	x21, x2
10163e240:     	mov	x24, x3
10163e244:     	mov	x23, x4
10163e248:     	mov	x0, x20
10163e24c:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163e250:     	mov	x8, x0
10163e254:     	mov	w0, #0x0                ; =0
10163e258:     	cbz	x19, 0x10163e284 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xac>
10163e25c:     	cbz	x8, 0x10163e284 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xac>
10163e260:     	add	x0, x8, #0x1a0
10163e264:     	mov	x1, x19
10163e268:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163e26c:     	cmn	w0, #0x1
10163e270:     	b.eq	0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e274:     	mov	x0, x20
10163e278:     	bl	0x1000b4458 <__Z19CTX_wm_region_popupPK8bContext>
10163e27c:     	cbz	x0, 0x10163e2bc <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xe4>
10163e280:     	mov	w0, #0x0                ; =0
10163e284:     	ldur	x8, [x29, #-0x58]
10163e288:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
10163e28c:     	ldr	x9, [x9, #0x7f0]
10163e290:     	ldr	x9, [x9]
10163e294:     	cmp	x9, x8
10163e298:     	b.ne	0x10163e6b8 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x4e0>
10163e29c:     	ldp	x29, x30, [sp, #0x130]
10163e2a0:     	ldp	x20, x19, [sp, #0x120]
10163e2a4:     	ldp	x22, x21, [sp, #0x110]
10163e2a8:     	ldp	x24, x23, [sp, #0x100]
10163e2ac:     	ldp	x26, x25, [sp, #0xf0]
10163e2b0:     	ldp	x28, x27, [sp, #0xe0]
10163e2b4:     	add	sp, sp, #0x140
10163e2b8:     	ret
10163e2bc:     	mov	x0, x19
10163e2c0:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
10163e2c4:     	cbz	x0, 0x10163e284 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xac>
10163e2c8:     	ldr	x8, [x0, #0x1d0]
10163e2cc:     	cbz	x8, 0x10163e308 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x130>
10163e2d0:     	ldr	x9, [x0, #0x218]
10163e2d4:     	b	0x10163e2e0 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x108>
10163e2d8:     	ldr	x8, [x8]
10163e2dc:     	cbz	x8, 0x10163e308 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x130>
10163e2e0:     	cbz	x9, 0x10163e2f0 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x118>
10163e2e4:     	ldr	x10, [x9, #0x18]
10163e2e8:     	cmp	x10, x8
10163e2ec:     	b.eq	0x10163e2d8 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x100>
10163e2f0:     	ldr	x10, [x8, #0x128]
10163e2f4:     	ldrh	w10, [x10, #0x2b0]
10163e2f8:     	cbz	w10, 0x10163e2d8 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x100>
10163e2fc:     	ldrh	w10, [x8, #0xc4]
10163e300:     	tbnz	w10, #0x0, 0x10163e2d8 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x100>
10163e304:     	b	0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e308:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163e30c:     	ldr	x8, [x8, #0x9b0]
10163e310:     	cbz	x8, 0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e314:     	fmov	d0, x8
10163e318:     	cnt.8b	v0, v0
10163e31c:     	uaddlv.8b	h0, v0
10163e320:     	fmov	w9, s0
10163e324:     	cmp	x9, #0x1
10163e328:     	b.hi	0x10163e338 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x160>
10163e32c:     	sub	x10, x8, #0x1
10163e330:     	and	x10, x10, x19
10163e334:     	b	0x10163e34c <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x174>
10163e338:     	mov	x10, x19
10163e33c:     	cmp	x8, x19
10163e340:     	b.hi	0x10163e34c <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x174>
10163e344:     	udiv	x10, x19, x8
10163e348:     	msub	x10, x10, x8, x19
10163e34c:     	adrp	x11, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163e350:     	ldr	x11, [x11, #0x9a8]
10163e354:     	ldr	x11, [x11, x10, lsl #3]
10163e358:     	cbz	x11, 0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e35c:     	ldr	x22, [x11]
10163e360:     	cbz	x22, 0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e364:     	sub	x11, x8, #0x1
10163e368:     	b	0x10163e384 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x1ac>
10163e36c:     	ldr	x12, [x22, #0x10]
10163e370:     	cmp	x12, x19
10163e374:     	b.eq	0x10163e3bc <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x1e4>
10163e378:     	mov	w0, #0x0                ; =0
10163e37c:     	ldr	x22, [x22]
10163e380:     	cbz	x22, 0x10163e284 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xac>
10163e384:     	ldr	x12, [x22, #0x8]
10163e388:     	cmp	x12, x19
10163e38c:     	b.eq	0x10163e36c <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x194>
10163e390:     	cmp	x9, #0x1
10163e394:     	b.hi	0x10163e3a0 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x1c8>
10163e398:     	and	x12, x12, x11
10163e39c:     	b	0x10163e3b0 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x1d8>
10163e3a0:     	cmp	x12, x8
10163e3a4:     	b.lo	0x10163e3b0 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x1d8>
10163e3a8:     	udiv	x13, x12, x8
10163e3ac:     	msub	x12, x13, x8, x12
10163e3b0:     	cmp	x12, x10
10163e3b4:     	b.eq	0x10163e378 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x1a0>
10163e3b8:     	b	0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e3bc:     	ldrb	w8, [x22, #0x20]
10163e3c0:     	tbnz	w8, #0x0, 0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e3c4:     	ldr	x8, [x22, #0x18]
10163e3c8:     	ldrsw	x9, [x19, #0xc0]
10163e3cc:     	cmp	x8, x9
10163e3d0:     	b.ne	0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e3d4:     	ldrb	w8, [x22, #0x181]
10163e3d8:     	cmp	w8, #0x1
10163e3dc:     	b.ne	0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e3e0:     	stur	xzr, [sp, #0x3d]
10163e3e4:     	movi.16b	v0, #0x0
10163e3e8:     	stp	q0, q0, [sp, #0x20]
10163e3ec:     	stp	q0, q0, [sp]
10163e3f0:     	stur	q0, [sp, #0x48]
10163e3f4:     	stur	q0, [sp, #0x58]
10163e3f8:     	stur	q0, [sp, #0x68]
10163e3fc:     	stur	q0, [sp, #0x78]
10163e400:     	str	xzr, [sp, #0x88]
10163e404:     	mov	x2, sp
10163e408:     	mov	x0, x20
10163e40c:     	mov	x1, x19
10163e410:     	bl	0x10164c264 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE>
10163e414:     	cbz	w0, 0x10163e438 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x260>
10163e418:     	ldrb	w8, [sp, #0x44]
10163e41c:     	cmp	w8, #0x1
10163e420:     	b.ne	0x10163e438 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x260>
10163e424:     	add	x0, x22, #0xd8
10163e428:     	mov	x1, sp
10163e42c:     	bl	0x10164d16c <__ZN12_GLOBAL__N_133ipad_knife_hierarchy_native_equalERKNS_24IPadKnifeHierarchyNativeES2_>
10163e430:     	mov	x22, x0
10163e434:     	b	0x10163e43c <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x264>
10163e438:     	mov	w22, #0x0               ; =0
10163e43c:     	ldr	x0, [sp, #0x78]
10163e440:     	cbz	x0, 0x10163e44c <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x274>
10163e444:     	str	x0, [sp, #0x80]
10163e448:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163e44c:     	ldr	x0, [sp, #0x60]
10163e450:     	cbz	x0, 0x10163e45c <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x284>
10163e454:     	str	x0, [sp, #0x68]
10163e458:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163e45c:     	ldr	x0, [sp, #0x48]
10163e460:     	cbz	x0, 0x10163e46c <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x294>
10163e464:     	str	x0, [sp, #0x50]
10163e468:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163e46c:     	cbz	w22, 0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e470:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163e474:     	ldr	x8, [x8, #0xa00]
10163e478:     	cbz	x8, 0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e47c:     	fmov	d0, x8
10163e480:     	cnt.8b	v0, v0
10163e484:     	uaddlv.8b	h0, v0
10163e488:     	fmov	w9, s0
10163e48c:     	cmp	x9, #0x1
10163e490:     	b.hi	0x10163e4a0 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x2c8>
10163e494:     	sub	x10, x8, #0x1
10163e498:     	and	x10, x10, x19
10163e49c:     	b	0x10163e4b4 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x2dc>
10163e4a0:     	mov	x10, x19
10163e4a4:     	cmp	x8, x19
10163e4a8:     	b.hi	0x10163e4b4 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x2dc>
10163e4ac:     	udiv	x10, x19, x8
10163e4b0:     	msub	x10, x10, x8, x19
10163e4b4:     	adrp	x11, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163e4b8:     	ldr	x11, [x11, #0x9f8]
10163e4bc:     	ldr	x11, [x11, x10, lsl #3]
10163e4c0:     	cbz	x11, 0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e4c4:     	ldr	x11, [x11]
10163e4c8:     	cbz	x11, 0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e4cc:     	mov	x22, sp
10163e4d0:     	sub	x12, x8, #0x1
10163e4d4:     	b	0x10163e4ec <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x314>
10163e4d8:     	ldr	x13, [x11, #0x10]
10163e4dc:     	cmp	x13, x19
10163e4e0:     	b.eq	0x10163e524 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x34c>
10163e4e4:     	ldr	x11, [x11]
10163e4e8:     	cbz	x11, 0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e4ec:     	ldr	x13, [x11, #0x8]
10163e4f0:     	cmp	x13, x19
10163e4f4:     	b.eq	0x10163e4d8 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x300>
10163e4f8:     	cmp	x9, #0x1
10163e4fc:     	b.hi	0x10163e508 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x330>
10163e500:     	and	x13, x13, x12
10163e504:     	b	0x10163e518 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x340>
10163e508:     	cmp	x13, x8
10163e50c:     	b.lo	0x10163e518 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x340>
10163e510:     	udiv	x14, x13, x8
10163e514:     	msub	x13, x14, x8, x13
10163e518:     	cmp	x13, x10
10163e51c:     	b.eq	0x10163e4e4 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x30c>
10163e520:     	b	0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e524:     	ldr	x8, [x11, #0x18]
10163e528:     	ldrsw	x9, [x19, #0xc0]
10163e52c:     	cmp	x8, x9
10163e530:     	b.ne	0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e534:     	ldp	x8, x9, [x11, #0x28]
10163e538:     	cmp	x8, x9
10163e53c:     	b.ne	0x10163e554 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x37c>
10163e540:     	b	0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e544:     	mov	w0, #0x0                ; =0
10163e548:     	add	x8, x8, #0x220
10163e54c:     	cmp	x8, x9
10163e550:     	b.eq	0x10163e284 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xac>
10163e554:     	ldr	x10, [x8, #0x218]
10163e558:     	cmp	x10, x21
10163e55c:     	b.ne	0x10163e544 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x36c>
10163e560:     	ldrb	w10, [x8, #0x1d8]
10163e564:     	ldr	w11, [x8]
10163e568:     	cmp	w10, #0x1
10163e56c:     	ccmp	w11, #0x1, #0x0, eq
10163e570:     	b.ne	0x10163e544 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x36c>
10163e574:     	ldrb	w10, [x8, #0x1d4]
10163e578:     	tbz	w10, #0x0, 0x10163e544 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x36c>
10163e57c:     	ldur	q0, [x8, #0xa4]
10163e580:     	str	q0, [sp, #0xa0]
10163e584:     	ldur	q0, [x8, #0xb4]
10163e588:     	str	q0, [sp, #0xb0]
10163e58c:     	ldur	q0, [x8, #0xc4]
10163e590:     	str	q0, [sp, #0xc0]
10163e594:     	ldr	w9, [x8, #0xd4]
10163e598:     	str	w9, [sp, #0xd0]
10163e59c:     	ldur	q0, [x8, #0x64]
10163e5a0:     	str	q0, [sp, #0x60]
10163e5a4:     	ldur	q0, [x8, #0x74]
10163e5a8:     	str	q0, [sp, #0x70]
10163e5ac:     	ldur	q0, [x8, #0x84]
10163e5b0:     	str	q0, [sp, #0x80]
10163e5b4:     	ldur	q0, [x8, #0x94]
10163e5b8:     	str	q0, [sp, #0x90]
10163e5bc:     	ldur	q0, [x8, #0x24]
10163e5c0:     	str	q0, [sp, #0x20]
10163e5c4:     	ldur	q0, [x8, #0x34]
10163e5c8:     	str	q0, [sp, #0x30]
10163e5cc:     	ldur	q0, [x8, #0x44]
10163e5d0:     	str	q0, [sp, #0x40]
10163e5d4:     	ldur	q0, [x8, #0x54]
10163e5d8:     	str	q0, [sp, #0x50]
10163e5dc:     	ldur	q0, [x8, #0x4]
10163e5e0:     	str	q0, [sp]
10163e5e4:     	ldur	q0, [x8, #0x14]
10163e5e8:     	str	q0, [sp, #0x10]
10163e5ec:     	ldr	x25, [x8, #0xd8]
10163e5f0:     	ldp	x26, x27, [x8, #0x168]
10163e5f4:     	mov	x0, x20
10163e5f8:     	mov	x1, x19
10163e5fc:     	mov	x2, x21
10163e600:     	bl	0x10163dcc4 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy>
10163e604:     	cbz	w0, 0x10163e284 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xac>
10163e608:     	mov	x0, x19
10163e60c:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
10163e610:     	ldr	x9, [x0, #0x1c0]
10163e614:     	cbnz	x9, 0x10163e628 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x450>
10163e618:     	b	0x10163e280 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xa8>
10163e61c:     	mov	w0, #0x0                ; =0
10163e620:     	ldr	x9, [x9]
10163e624:     	cbz	x9, 0x10163e284 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xac>
10163e628:     	cmp	x25, x9
10163e62c:     	b.ne	0x10163e61c <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x444>
10163e630:     	ldr	x8, [x9, #0x78]
10163e634:     	cbnz	x8, 0x10163e644 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x46c>
10163e638:     	b	0x10163e61c <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x444>
10163e63c:     	ldr	x8, [x8]
10163e640:     	cbz	x8, 0x10163e61c <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x444>
10163e644:     	cmp	x26, x8
10163e648:     	b.ne	0x10163e63c <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x464>
10163e64c:     	ldr	x10, [x8, #0x128]
10163e650:     	ldr	x10, [x10, #0xb0]
10163e654:     	cmp	x10, x27
10163e658:     	b.ne	0x10163e63c <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x464>
10163e65c:     	ldur	q0, [x22, #0x84]
10163e660:     	ldur	q1, [x22, #0x94]
10163e664:     	stp	q0, q1, [x24, #0x80]
10163e668:     	ldur	q0, [x22, #0xa4]
10163e66c:     	str	q0, [x24, #0xa0]
10163e670:     	ldur	x9, [x22, #0xb4]
10163e674:     	str	x9, [x24, #0xb0]
10163e678:     	ldur	q0, [x22, #0x44]
10163e67c:     	ldur	q1, [x22, #0x54]
10163e680:     	stp	q0, q1, [x24, #0x40]
10163e684:     	ldur	q0, [x22, #0x64]
10163e688:     	ldur	q1, [x22, #0x74]
10163e68c:     	stp	q0, q1, [x24, #0x60]
10163e690:     	ldur	q0, [x22, #0x4]
10163e694:     	ldur	q1, [x22, #0x14]
10163e698:     	stp	q0, q1, [x24]
10163e69c:     	ldur	q0, [x22, #0x24]
10163e6a0:     	ldur	q1, [x22, #0x34]
10163e6a4:     	stp	q0, q1, [x24, #0x20]
10163e6a8:     	cbz	x23, 0x10163e6bc <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0x4e4>
10163e6ac:     	str	x8, [x23]
10163e6b0:     	mov	w0, #0x1                ; =1
10163e6b4:     	b	0x10163e284 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xac>
10163e6b8:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
10163e6bc:     	mov	w0, #0x1                ; =1
10163e6c0:     	b	0x10163e284 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion+0xac>
10163e6c4:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
10163e6c8:     	mov	x19, x0
10163e6cc:     	mov	x0, sp
10163e6d0:     	bl	0x10164c214 <__ZN12_GLOBAL__N_124IPadKnifeHierarchyNativeD1Ev>
10163e6d4:     	mov	x0, x19
10163e6d8:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
