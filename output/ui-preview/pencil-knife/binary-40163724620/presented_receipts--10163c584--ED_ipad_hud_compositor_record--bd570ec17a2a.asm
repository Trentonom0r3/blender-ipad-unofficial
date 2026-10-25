
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163c584 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti>:
10163c584:     	stp	x26, x25, [sp, #-0x50]!
10163c588:     	stp	x24, x23, [sp, #0x10]
10163c58c:     	stp	x22, x21, [sp, #0x20]
10163c590:     	stp	x20, x19, [sp, #0x30]
10163c594:     	stp	x29, x30, [sp, #0x40]
10163c598:     	add	x29, sp, #0x40
10163c59c:     	sub	sp, sp, #0x260
10163c5a0:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
10163c5a4:     	ldr	x8, [x8, #0x7f0]
10163c5a8:     	ldr	x8, [x8]
10163c5ac:     	stur	x8, [x29, #-0x48]
10163c5b0:     	ldrh	w8, [x3, #0xc0]
10163c5b4:     	cmp	w8, #0x8
10163c5b8:     	b.ne	0x10163c870 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x2ec>
10163c5bc:     	mov	x23, x4
10163c5c0:     	mov	x19, x3
10163c5c4:     	mov	x20, x2
10163c5c8:     	mov	x21, x1
10163c5cc:     	mov	x22, x0
10163c5d0:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163c5d4:     	cbz	x21, 0x10163c870 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x2ec>
10163c5d8:     	cbz	x0, 0x10163c870 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x2ec>
10163c5dc:     	add	x0, x0, #0x1a0
10163c5e0:     	mov	x1, x21
10163c5e4:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163c5e8:     	cmn	w0, #0x1
10163c5ec:     	b.eq	0x10163c870 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x2ec>
10163c5f0:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163c5f4:     	ldr	x9, [x8, #0xa00]
10163c5f8:     	cbz	x9, 0x10163c870 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x2ec>
10163c5fc:     	fmov	d0, x9
10163c600:     	cnt.8b	v0, v0
10163c604:     	uaddlv.8b	h0, v0
10163c608:     	fmov	w10, s0
10163c60c:     	cmp	x10, #0x1
10163c610:     	b.hi	0x10163c620 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x9c>
10163c614:     	sub	x8, x9, #0x1
10163c618:     	and	x11, x8, x21
10163c61c:     	b	0x10163c634 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0xb0>
10163c620:     	mov	x11, x21
10163c624:     	cmp	x9, x21
10163c628:     	b.hi	0x10163c634 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0xb0>
10163c62c:     	udiv	x8, x21, x9
10163c630:     	msub	x11, x8, x9, x21
10163c634:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163c638:     	ldr	x8, [x8, #0x9f8]
10163c63c:     	ldr	x8, [x8, x11, lsl #3]
10163c640:     	cbz	x8, 0x10163c870 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x2ec>
10163c644:     	ldr	x25, [x8]
10163c648:     	cbz	x25, 0x10163c870 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x2ec>
10163c64c:     	add	x8, sp, #0x38
10163c650:     	sub	x12, x9, #0x1
10163c654:     	b	0x10163c66c <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0xe8>
10163c658:     	ldr	x13, [x25, #0x10]
10163c65c:     	cmp	x13, x21
10163c660:     	b.eq	0x10163c6a4 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x120>
10163c664:     	ldr	x25, [x25]
10163c668:     	cbz	x25, 0x10163c870 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x2ec>
10163c66c:     	ldr	x13, [x25, #0x8]
10163c670:     	cmp	x13, x21
10163c674:     	b.eq	0x10163c658 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0xd4>
10163c678:     	cmp	x10, #0x1
10163c67c:     	b.hi	0x10163c688 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x104>
10163c680:     	and	x13, x13, x12
10163c684:     	b	0x10163c698 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x114>
10163c688:     	cmp	x13, x9
10163c68c:     	b.lo	0x10163c698 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x114>
10163c690:     	udiv	x14, x13, x9
10163c694:     	msub	x13, x14, x9, x13
10163c698:     	cmp	x13, x11
10163c69c:     	b.eq	0x10163c664 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0xe0>
10163c6a0:     	b	0x10163c870 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x2ec>
10163c6a4:     	ldrb	w9, [x25, #0x20]
10163c6a8:     	cmp	w9, #0x1
10163c6ac:     	b.ne	0x10163c870 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x2ec>
10163c6b0:     	ldr	x9, [x25, #0x18]
10163c6b4:     	ldrsw	x10, [x21, #0xc0]
10163c6b8:     	cmp	x9, x10
10163c6bc:     	b.ne	0x10163c870 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x2ec>
10163c6c0:     	ldp	w10, w9, [x23]
10163c6c4:     	cmp	w9, w10
10163c6c8:     	b.le	0x10163c870 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x2ec>
10163c6cc:     	ldp	w10, w9, [x23, #0x8]
10163c6d0:     	cmp	w9, w10
10163c6d4:     	b.le	0x10163c870 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x2ec>
10163c6d8:     	str	wzr, [sp, #0x38]
10163c6dc:     	add	x9, sp, #0x38
10163c6e0:     	add	x10, x9, #0x8
10163c6e4:     	movi.16b	v0, #0x0
10163c6e8:     	stp	q0, q0, [x10, #0x100]
10163c6ec:     	stp	q0, q0, [x10, #0x120]
10163c6f0:     	stp	q0, q0, [x10, #0x140]
10163c6f4:     	stp	q0, q0, [x10, #0x160]
10163c6f8:     	stp	q0, q0, [x10, #0x180]
10163c6fc:     	stp	q0, q0, [x10, #0x1a0]
10163c700:     	add	x9, x9, #0x1c5
10163c704:     	str	q0, [x9]
10163c708:     	stp	q0, q0, [sp, #0x40]
10163c70c:     	stp	q0, q0, [sp, #0x60]
10163c710:     	stur	q0, [x8, #0x48]
10163c714:     	stur	q0, [x8, #0x58]
10163c718:     	stur	q0, [x8, #0x68]
10163c71c:     	stur	q0, [x8, #0x78]
10163c720:     	stur	q0, [x8, #0x88]
10163c724:     	stur	q0, [x8, #0x98]
10163c728:     	stur	q0, [x8, #0xa8]
10163c72c:     	stur	q0, [x8, #0xb8]
10163c730:     	stur	q0, [x8, #0xc8]
10163c734:     	stur	q0, [x8, #0xd8]
10163c738:     	stur	q0, [x8, #0xe8]
10163c73c:     	stur	q0, [x8, #0xf8]
10163c740:     	strb	wzr, [sp, #0x210]
10163c744:     	stp	q0, q0, [x8, #0x1e0]
10163c748:     	stp	q0, q0, [x8, #0x200]
10163c74c:     	mov	x0, x21
10163c750:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
10163c754:     	cbz	x0, 0x10163c76c <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x1e8>
10163c758:     	str	x0, [sp, #0x218]
10163c75c:     	ldr	w8, [x0, #0x144]
10163c760:     	str	x8, [sp, #0x220]
10163c764:     	str	x20, [sp, #0x228]
10163c768:     	str	x19, [sp, #0x230]
10163c76c:     	ldr	x8, [x19, #0x128]
10163c770:     	add	x0, x8, #0xb0
10163c774:     	bl	0x10163c8c8 <__ZNSt3__113unordered_mapIyN12_GLOBAL__N_114IPadHUDContentENS_4hashIyEENS_8equal_toIyEENS_9allocatorINS_4pairIKyS2_EEEEE4findB8ne190102ERS9_>
10163c778:     	cbz	x0, 0x10163c7a0 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x21c>
10163c77c:     	mov	x24, x0
10163c780:     	add	x0, sp, #0x38
10163c784:     	add	x1, x24, #0x3c8
10163c788:     	mov	w2, #0x1d5              ; =469
10163c78c:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
10163c790:     	ldrb	w8, [x24, #0x5a1]
10163c794:     	strb	w8, [sp, #0x210]
10163c798:     	ldrb	w8, [sp, #0x20c]
10163c79c:     	tbnz	w8, #0x0, 0x10163c7a8 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x224>
10163c7a0:     	mov	x0, x19
10163c7a4:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
10163c7a8:     	ldr	q0, [x23]
10163c7ac:     	str	q0, [sp, #0x20]
10163c7b0:     	ldr	w8, [sp, #0x24]
10163c7b4:     	ldr	w9, [sp, #0x2c]
10163c7b8:     	sub	w8, w8, #0x1
10163c7bc:     	sub	w9, w9, #0x1
10163c7c0:     	str	w8, [sp, #0x24]
10163c7c4:     	str	w9, [sp, #0x2c]
10163c7c8:     	ldr	x23, [x20, #0x78]
10163c7cc:     	cbz	x23, 0x10163c870 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x2ec>
10163c7d0:     	add	x24, sp, #0x38
10163c7d4:     	b	0x10163c7e0 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x25c>
10163c7d8:     	ldr	x23, [x23]
10163c7dc:     	cbz	x23, 0x10163c844 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x2c0>
10163c7e0:     	ldrh	w8, [x23, #0xc0]
10163c7e4:     	cbnz	w8, 0x10163c7d8 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x254>
10163c7e8:     	ldr	x8, [x23, #0x128]
10163c7ec:     	ldrh	w9, [x8, #0x2b0]
10163c7f0:     	cbz	w9, 0x10163c7d8 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x254>
10163c7f4:     	ldrb	w8, [x8, #0x8]
10163c7f8:     	cmp	w8, #0x1
10163c7fc:     	b.ne	0x10163c7d8 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x254>
10163c800:     	add	x4, x19, #0xa8
10163c804:     	add	x5, sp, #0x10
10163c808:     	mov	x0, x22
10163c80c:     	mov	x1, x21
10163c810:     	mov	x2, x20
10163c814:     	mov	x3, x23
10163c818:     	bl	0x10163a408 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_>
10163c81c:     	tbz	w0, #0x0, 0x10163c7d8 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x254>
10163c820:     	add	x0, sp, #0x20
10163c824:     	add	x1, sp, #0x10
10163c828:     	mov	x2, sp
10163c82c:     	bl	0x1007fd84c <__Z14BLI_rcti_isectPK4rctiS1_PS_>
10163c830:     	cbz	w0, 0x10163c7d8 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x254>
10163c834:     	add	x0, x24, #0x200
10163c838:     	mov	x1, sp
10163c83c:     	bl	0x10163c980 <__ZNSt3__16vectorI4rctiNS_9allocatorIS1_EEE9push_backB8ne190102ERKS1_>
10163c840:     	b	0x10163c7d8 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x254>
10163c844:     	ldr	x0, [sp, #0x238]
10163c848:     	ldr	x8, [sp, #0x240]
10163c84c:     	cmp	x0, x8
10163c850:     	b.eq	0x10163c864 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x2e0>
10163c854:     	add	x0, x25, #0x40
10163c858:     	add	x1, sp, #0x38
10163c85c:     	bl	0x10163ca78 <__ZNSt3__16vectorIN12_GLOBAL__N_119IPadHUDPresentationENS_9allocatorIS2_EEE9push_backB8ne190102EOS2_>
10163c860:     	ldr	x0, [sp, #0x238]
10163c864:     	cbz	x0, 0x10163c870 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x2ec>
10163c868:     	str	x0, [sp, #0x240]
10163c86c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163c870:     	ldur	x8, [x29, #-0x48]
10163c874:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
10163c878:     	ldr	x9, [x9, #0x7f0]
10163c87c:     	ldr	x9, [x9]
10163c880:     	cmp	x9, x8
10163c884:     	b.ne	0x10163c8a4 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x320>
10163c888:     	add	sp, sp, #0x260
10163c88c:     	ldp	x29, x30, [sp, #0x40]
10163c890:     	ldp	x20, x19, [sp, #0x30]
10163c894:     	ldp	x22, x21, [sp, #0x20]
10163c898:     	ldp	x24, x23, [sp, #0x10]
10163c89c:     	ldp	x26, x25, [sp], #0x50
10163c8a0:     	ret
10163c8a4:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
10163c8a8:     	b	0x10163c8ac <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x328>
10163c8ac:     	mov	x19, x0
10163c8b0:     	ldr	x0, [sp, #0x238]
10163c8b4:     	cbz	x0, 0x10163c8c0 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x33c>
10163c8b8:     	str	x0, [sp, #0x240]
10163c8bc:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163c8c0:     	mov	x0, x19
10163c8c4:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
