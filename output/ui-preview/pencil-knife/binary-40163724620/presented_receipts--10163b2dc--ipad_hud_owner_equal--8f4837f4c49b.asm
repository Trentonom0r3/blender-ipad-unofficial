
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163b2dc <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b>:
10163b2dc:     	ldr	w8, [x0]
10163b2e0:     	ldr	w9, [x1]
10163b2e4:     	cmp	w8, w9
10163b2e8:     	b.ne	0x10163b4b8 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1dc>
10163b2ec:     	stp	x22, x21, [sp, #-0x30]!
10163b2f0:     	stp	x20, x19, [sp, #0x10]
10163b2f4:     	stp	x29, x30, [sp, #0x20]
10163b2f8:     	add	x29, sp, #0x20
10163b2fc:     	mov	x21, x2
10163b300:     	mov	x19, x0
10163b304:     	add	x0, x0, #0x8
10163b308:     	mov	x20, x1
10163b30c:     	add	x1, x1, #0x8
10163b310:     	mov	w2, #0xb8               ; =184
10163b314:     	bl	0x104b72368 <_zlibVersion+0x104b72368>
10163b318:     	cbnz	w0, 0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b31c:     	ldr	x10, [x19, #0x180]
10163b320:     	ldr	x11, [x20, #0x180]
10163b324:     	cmp	x10, x11
10163b328:     	b.ne	0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b32c:     	mov	x9, x19
10163b330:     	mov	x8, x20
10163b334:     	ldr	x10, [x19, #0x188]
10163b338:     	ldr	x11, [x20, #0x188]
10163b33c:     	cmp	x10, x11
10163b340:     	b.ne	0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b344:     	ldr	x10, [x9, #0x190]
10163b348:     	ldr	x11, [x8, #0x190]
10163b34c:     	cmp	x10, x11
10163b350:     	b.ne	0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b354:     	ldr	x10, [x9, #0x198]
10163b358:     	ldr	x11, [x8, #0x198]
10163b35c:     	cmp	x10, x11
10163b360:     	b.ne	0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b364:     	ldrb	w10, [x9, #0x1d4]
10163b368:     	cmp	w10, #0x1
10163b36c:     	b.ne	0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b370:     	ldrb	w10, [x8, #0x1d4]
10163b374:     	cmp	w10, #0x1
10163b378:     	b.ne	0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b37c:     	add	x0, x9, #0xc0
10163b380:     	add	x1, x8, #0xc0
10163b384:     	mov	w2, #0x68               ; =104
10163b388:     	bl	0x104b72368 <_zlibVersion+0x104b72368>
10163b38c:     	cbnz	w0, 0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b390:     	ldp	x10, x11, [x19, #0x128]
10163b394:     	ldp	x12, x13, [x20, #0x128]
10163b398:     	ldp	x14, x15, [x19, #0x138]
10163b39c:     	ldp	x16, x17, [x20, #0x138]
10163b3a0:     	ldp	x0, x1, [x19, #0x148]
10163b3a4:     	ldp	x2, x3, [x20, #0x148]
10163b3a8:     	ldp	x4, x5, [x19, #0x158]
10163b3ac:     	ldp	x6, x7, [x20, #0x158]
10163b3b0:     	cmp	x10, x12
10163b3b4:     	ccmp	x11, x13, #0x0, eq
10163b3b8:     	ccmp	x14, x16, #0x0, eq
10163b3bc:     	ccmp	x15, x17, #0x0, eq
10163b3c0:     	ccmp	x0, x2, #0x0, eq
10163b3c4:     	ccmp	x1, x3, #0x0, eq
10163b3c8:     	ccmp	x4, x6, #0x0, eq
10163b3cc:     	ccmp	x5, x7, #0x0, eq
10163b3d0:     	b.ne	0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b3d4:     	mov	x8, x19
10163b3d8:     	mov	x9, x20
10163b3dc:     	ldr	x10, [x19, #0x168]
10163b3e0:     	ldr	x11, [x20, #0x168]
10163b3e4:     	cmp	x10, x11
10163b3e8:     	b.ne	0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b3ec:     	ldr	x10, [x8, #0x170]
10163b3f0:     	ldr	x11, [x9, #0x170]
10163b3f4:     	cmp	x10, x11
10163b3f8:     	b.ne	0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b3fc:     	ldr	x10, [x8, #0x1a0]
10163b400:     	ldr	x11, [x9, #0x1a0]
10163b404:     	cmp	x10, x11
10163b408:     	b.ne	0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b40c:     	ldr	x8, [x8, #0x1a8]
10163b410:     	ldr	x9, [x9, #0x1a8]
10163b414:     	cmp	x8, x9
10163b418:     	b.ne	0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b41c:     	ldr	x8, [x19, #0x1b0]
10163b420:     	ldr	x9, [x20, #0x1b0]
10163b424:     	cmp	x8, x9
10163b428:     	b.ne	0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b42c:     	ldr	w8, [x19, #0x1b8]
10163b430:     	ldr	w9, [x20, #0x1b8]
10163b434:     	cmp	w8, w9
10163b438:     	b.ne	0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b43c:     	ldr	w8, [x19, #0x1bc]
10163b440:     	ldr	w9, [x20, #0x1bc]
10163b444:     	cmp	w8, w9
10163b448:     	b.ne	0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b44c:     	ldr	s0, [x19, #0x1c0]
10163b450:     	ldr	s1, [x20, #0x1c0]
10163b454:     	fcmp	s0, s1
10163b458:     	cset	w0, eq
10163b45c:     	b.ne	0x10163b4c4 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e8>
10163b460:     	cbz	w21, 0x10163b4c4 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e8>
10163b464:     	ldr	x8, [x19, #0x178]
10163b468:     	ldr	x9, [x20, #0x178]
10163b46c:     	cmp	x8, x9
10163b470:     	b.ne	0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b474:     	ldr	w8, [x19, #0x1c4]
10163b478:     	ldr	w9, [x20, #0x1c4]
10163b47c:     	cmp	w8, w9
10163b480:     	b.ne	0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b484:     	ldr	w8, [x19, #0x1cc]
10163b488:     	ldr	w9, [x20, #0x1cc]
10163b48c:     	cmp	w8, w9
10163b490:     	b.ne	0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b494:     	ldr	w8, [x19, #0x1c8]
10163b498:     	ldr	w9, [x20, #0x1c8]
10163b49c:     	cmp	w8, w9
10163b4a0:     	b.ne	0x10163b4c0 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e4>
10163b4a4:     	ldr	w8, [x19, #0x1d0]
10163b4a8:     	ldr	w9, [x20, #0x1d0]
10163b4ac:     	cmp	w8, w9
10163b4b0:     	cset	w0, eq
10163b4b4:     	b	0x10163b4c4 <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b+0x1e8>
10163b4b8:     	mov	w0, #0x0                ; =0
10163b4bc:     	ret
10163b4c0:     	mov	w0, #0x0                ; =0
10163b4c4:     	ldp	x29, x30, [sp, #0x20]
10163b4c8:     	ldp	x20, x19, [sp, #0x10]
10163b4cc:     	ldp	x22, x21, [sp], #0x30
10163b4d0:     	ret
