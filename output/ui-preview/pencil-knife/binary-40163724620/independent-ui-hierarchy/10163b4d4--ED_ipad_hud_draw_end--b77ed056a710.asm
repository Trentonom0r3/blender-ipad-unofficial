
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163b4d4 <__Z20ED_ipad_hud_draw_endP8bContextP8wmWindowP7ScrAreaP7ARegion>:
10163b4d4:     	stp	x28, x27, [sp, #-0x50]!
10163b4d8:     	stp	x24, x23, [sp, #0x10]
10163b4dc:     	stp	x22, x21, [sp, #0x20]
10163b4e0:     	stp	x20, x19, [sp, #0x30]
10163b4e4:     	stp	x29, x30, [sp, #0x40]
10163b4e8:     	add	x29, sp, #0x40
10163b4ec:     	sub	sp, sp, #0x350
10163b4f0:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
10163b4f4:     	ldr	x8, [x8, #0x7f0]
10163b4f8:     	ldr	x8, [x8]
10163b4fc:     	stur	x8, [x29, #-0x48]
10163b500:     	ldrh	w8, [x3, #0xc0]
10163b504:     	cmp	w8, #0x8
10163b508:     	b.ne	0x10163b7ec <__Z20ED_ipad_hud_draw_endP8bContextP8wmWindowP7ScrAreaP7ARegion+0x318>
10163b50c:     	ldr	x8, [x3, #0x128]
10163b510:     	ldr	x9, [x8, #0xb0]!
10163b514:     	cbz	x9, 0x10163b7ec <__Z20ED_ipad_hud_draw_endP8bContextP8wmWindowP7ScrAreaP7ARegion+0x318>
10163b518:     	add	x24, sp, #0x170
10163b51c:     	mov	x20, x0
10163b520:     	mov	x0, x8
10163b524:     	mov	x21, x3
10163b528:     	mov	x22, x2
10163b52c:     	mov	x23, x1
10163b530:     	bl	0x10163a938 <__ZNSt3__113unordered_mapIyN12_GLOBAL__N_114IPadHUDContentENS_4hashIyEENS_8equal_toIyEENS_9allocatorINS_4pairIKyS2_EEEEEixERS9_>
10163b534:     	mov	x19, x0
10163b538:     	str	wzr, [sp, #0x170]
10163b53c:     	add	x8, sp, #0x170
10163b540:     	add	x9, x8, #0x8
10163b544:     	movi.16b	v0, #0x0
10163b548:     	stp	q0, q0, [x9, #0x100]
10163b54c:     	stp	q0, q0, [x9, #0x120]
10163b550:     	stp	q0, q0, [x9, #0x140]
10163b554:     	stp	q0, q0, [x9, #0x160]
10163b558:     	stp	q0, q0, [x9, #0x180]
10163b55c:     	stp	q0, q0, [x9, #0x1a0]
10163b560:     	add	x8, x8, #0x1c5
10163b564:     	str	q0, [x8]
10163b568:     	stur	q0, [x24, #0x8]
10163b56c:     	stur	q0, [x24, #0x18]
10163b570:     	stur	q0, [x24, #0x28]
10163b574:     	stur	q0, [x24, #0x38]
10163b578:     	stur	q0, [x24, #0x48]
10163b57c:     	stur	q0, [x24, #0x58]
10163b580:     	stur	q0, [x24, #0x68]
10163b584:     	stur	q0, [x24, #0x78]
10163b588:     	stur	q0, [x24, #0x88]
10163b58c:     	stur	q0, [x24, #0x98]
10163b590:     	stur	q0, [x24, #0xa8]
10163b594:     	stur	q0, [x24, #0xb8]
10163b598:     	stur	q0, [x24, #0xc8]
10163b59c:     	stur	q0, [x24, #0xd8]
10163b5a0:     	stur	q0, [x24, #0xe8]
10163b5a4:     	stur	q0, [x24, #0xf8]
10163b5a8:     	add	x4, sp, #0x170
10163b5ac:     	mov	x0, x20
10163b5b0:     	mov	x1, x23
10163b5b4:     	mov	x2, x22
10163b5b8:     	mov	x3, x21
10163b5bc:     	bl	0x10163ad38 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE>
10163b5c0:     	strb	wzr, [x19, #0x589]
10163b5c4:     	ldr	x20, [x21, #0xd0]
10163b5c8:     	cbnz	x20, 0x10163b5d8 <__Z20ED_ipad_hud_draw_endP8bContextP8wmWindowP7ScrAreaP7ARegion+0x104>
10163b5cc:     	b	0x10163b5f8 <__Z20ED_ipad_hud_draw_endP8bContextP8wmWindowP7ScrAreaP7ARegion+0x124>
10163b5d0:     	ldr	x20, [x20]
10163b5d4:     	cbz	x20, 0x10163b5f8 <__Z20ED_ipad_hud_draw_endP8bContextP8wmWindowP7ScrAreaP7ARegion+0x124>
10163b5d8:     	mov	x0, x20
10163b5dc:     	bl	0x101f6def4 <__Z18UI_panel_is_activePK5Panel>
10163b5e0:     	cbz	w0, 0x10163b5d0 <__Z20ED_ipad_hud_draw_endP8bContextP8wmWindowP7ScrAreaP7ARegion+0xfc>
10163b5e4:     	ldr	x0, [x20, #0x10]
10163b5e8:     	bl	0x101f8cc54 <__Z28UI_ipad_knife_hud_panel_typePK9PanelType>
10163b5ec:     	cbz	w0, 0x10163b5d0 <__Z20ED_ipad_hud_draw_endP8bContextP8wmWindowP7ScrAreaP7ARegion+0xfc>
10163b5f0:     	mov	w8, #0x1                ; =1
10163b5f4:     	strb	w8, [x19, #0x589]
10163b5f8:     	mov	x20, sp
10163b5fc:     	ldrb	w8, [x19, #0x588]
10163b600:     	cmp	w8, #0x1
10163b604:     	b.ne	0x10163b6cc <__Z20ED_ipad_hud_draw_endP8bContextP8wmWindowP7ScrAreaP7ARegion+0x1f8>
10163b608:     	add	x21, sp, #0x170
10163b60c:     	add	x0, x19, #0x1d8
10163b610:     	add	x1, sp, #0x170
10163b614:     	mov	w2, #0x0                ; =0
10163b618:     	bl	0x10163b2dc <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b>
10163b61c:     	cbz	w0, 0x10163b6cc <__Z20ED_ipad_hud_draw_endP8bContextP8wmWindowP7ScrAreaP7ARegion+0x1f8>
10163b620:     	ldr	w8, [sp, #0x170]
10163b624:     	ldur	q0, [x24, #0x84]
10163b628:     	ldur	q1, [x24, #0x94]
10163b62c:     	stp	q0, q1, [sp, #0x80]
10163b630:     	ldur	q0, [x24, #0xa4]
10163b634:     	str	q0, [sp, #0xa0]
10163b638:     	ldp	q0, q1, [sp, #0x220]
10163b63c:     	stur	q0, [x20, #0xac]
10163b640:     	ldur	q0, [x24, #0x44]
10163b644:     	ldur	q2, [x24, #0x54]
10163b648:     	stp	q0, q2, [sp, #0x40]
10163b64c:     	ldur	q0, [x24, #0x64]
10163b650:     	ldur	q2, [x24, #0x74]
10163b654:     	stp	q0, q2, [sp, #0x60]
10163b658:     	ldur	q0, [x24, #0x4]
10163b65c:     	ldur	q2, [x24, #0x14]
10163b660:     	stp	q0, q2, [sp]
10163b664:     	ldur	q0, [x24, #0x24]
10163b668:     	ldur	q2, [x24, #0x34]
10163b66c:     	stp	q0, q2, [sp, #0x20]
10163b670:     	ldp	q0, q2, [sp, #0x260]
10163b674:     	ldr	q3, [sp, #0x280]
10163b678:     	stp	q2, q3, [sp, #0x140]
10163b67c:     	ldr	x10, [sp, #0x290]
10163b680:     	ldr	x9, [sp, #0x2d8]
10163b684:     	str	x10, [sp, #0x160]
10163b688:     	ldp	q2, q3, [sp, #0x240]
10163b68c:     	stp	q1, q2, [sp, #0x100]
10163b690:     	stp	q3, q0, [sp, #0x120]
10163b694:     	add	x10, x21, #0x128
10163b698:     	ldp	q0, q1, [x10]
10163b69c:     	ldp	q2, q3, [x10, #0x20]
10163b6a0:     	stp	q2, q3, [sp, #0xe0]
10163b6a4:     	stp	q0, q1, [sp, #0xc0]
10163b6a8:     	ldp	q3, q4, [sp, #0x2e0]
10163b6ac:     	ldp	q5, q6, [sp, #0x300]
10163b6b0:     	ldr	x11, [sp, #0x320]
10163b6b4:     	ldr	d0, [sp, #0x328]
10163b6b8:     	ldr	s1, [sp, #0x330]
10163b6bc:     	add	x10, x21, #0x1c4
10163b6c0:     	ldr	q2, [x10]
10163b6c4:     	ldrb	w10, [sp, #0x344]
10163b6c8:     	b	0x10163b740 <__Z20ED_ipad_hud_draw_endP8bContextP8wmWindowP7ScrAreaP7ARegion+0x26c>
10163b6cc:     	mov	w10, #0x0               ; =0
10163b6d0:     	mov	x11, #0x0               ; =0
10163b6d4:     	mov	x9, #0x0                ; =0
10163b6d8:     	mov	w8, #0x0                ; =0
10163b6dc:     	stur	xzr, [x20, #0xb4]
10163b6e0:     	movi.16b	v5, #0x0
10163b6e4:     	stur	q5, [x20, #0xa4]
10163b6e8:     	stur	q5, [x20, #0x94]
10163b6ec:     	stur	q5, [x20, #0x84]
10163b6f0:     	stur	q5, [sp, #0x74]
10163b6f4:     	stur	q5, [sp, #0x64]
10163b6f8:     	stur	q5, [sp, #0x54]
10163b6fc:     	stur	q5, [sp, #0x44]
10163b700:     	stur	q5, [sp, #0x34]
10163b704:     	stur	q5, [sp, #0x24]
10163b708:     	stur	q5, [sp, #0x14]
10163b70c:     	stur	q5, [sp, #0x4]
10163b710:     	stp	q5, q5, [sp, #0x100]
10163b714:     	stp	q5, q5, [sp, #0x120]
10163b718:     	stp	q5, q5, [sp, #0x140]
10163b71c:     	movi.16b	v0, #0x0
10163b720:     	fmov	s1, wzr
10163b724:     	stp	q5, q5, [sp, #0xe0]
10163b728:     	movi.16b	v2, #0x0
10163b72c:     	movi.16b	v3, #0x0
10163b730:     	movi.16b	v4, #0x0
10163b734:     	stp	q5, q5, [sp, #0xc0]
10163b738:     	movi.16b	v6, #0x0
10163b73c:     	str	xzr, [sp, #0x160]
10163b740:     	str	w8, [x19, #0x3b0]
10163b744:     	add	x8, x19, #0x3b4
10163b748:     	ldur	q7, [x20, #0xac]
10163b74c:     	str	q7, [x19, #0x460]
10163b750:     	ldp	q7, q16, [sp, #0x80]
10163b754:     	stp	q7, q16, [x8, #0x80]
10163b758:     	ldr	q7, [sp, #0xa0]
10163b75c:     	str	q7, [x8, #0xa0]
10163b760:     	ldp	q7, q16, [sp, #0x40]
10163b764:     	stp	q7, q16, [x8, #0x40]
10163b768:     	ldp	q7, q16, [sp, #0x60]
10163b76c:     	stp	q7, q16, [x8, #0x60]
10163b770:     	ldp	q7, q16, [sp]
10163b774:     	stp	q7, q16, [x8]
10163b778:     	ldp	q7, q16, [sp, #0x20]
10163b77c:     	stp	q7, q16, [x8, #0x20]
10163b780:     	ldp	q16, q7, [sp, #0x120]
10163b784:     	str	q7, [x19, #0x4a0]
10163b788:     	ldp	q7, q17, [sp, #0x140]
10163b78c:     	str	q7, [x19, #0x4b0]
10163b790:     	str	q17, [x19, #0x4c0]
10163b794:     	ldr	x8, [sp, #0x160]
10163b798:     	str	x8, [x19, #0x4d0]
10163b79c:     	ldp	q7, q17, [sp, #0x100]
10163b7a0:     	str	q7, [x19, #0x470]
10163b7a4:     	str	q17, [x19, #0x480]
10163b7a8:     	str	q16, [x19, #0x490]
10163b7ac:     	add	x8, x19, #0x4d8
10163b7b0:     	ldp	q7, q16, [sp, #0xc0]
10163b7b4:     	ldp	q17, q18, [sp, #0xe0]
10163b7b8:     	stp	q17, q18, [x8, #0x20]
10163b7bc:     	stp	q7, q16, [x8]
10163b7c0:     	str	x9, [x19, #0x518]
10163b7c4:     	str	q3, [x19, #0x520]
10163b7c8:     	str	q4, [x19, #0x530]
10163b7cc:     	str	q5, [x19, #0x540]
10163b7d0:     	str	q6, [x19, #0x550]
10163b7d4:     	str	x11, [x19, #0x560]
10163b7d8:     	str	d0, [x19, #0x568]
10163b7dc:     	str	s1, [x19, #0x570]
10163b7e0:     	add	x8, x19, #0x574
10163b7e4:     	str	q2, [x8]
10163b7e8:     	strb	w10, [x19, #0x584]
10163b7ec:     	ldur	x8, [x29, #-0x48]
10163b7f0:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
10163b7f4:     	ldr	x9, [x9, #0x7f0]
10163b7f8:     	ldr	x9, [x9]
10163b7fc:     	cmp	x9, x8
10163b800:     	b.ne	0x10163b820 <__Z20ED_ipad_hud_draw_endP8bContextP8wmWindowP7ScrAreaP7ARegion+0x34c>
10163b804:     	add	sp, sp, #0x350
10163b808:     	ldp	x29, x30, [sp, #0x40]
10163b80c:     	ldp	x20, x19, [sp, #0x30]
10163b810:     	ldp	x22, x21, [sp, #0x20]
10163b814:     	ldp	x24, x23, [sp, #0x10]
10163b818:     	ldp	x28, x27, [sp], #0x50
10163b81c:     	ret
10163b820:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
