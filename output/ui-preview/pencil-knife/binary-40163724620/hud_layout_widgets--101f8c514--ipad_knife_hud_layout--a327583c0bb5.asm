
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f8c514 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout>:
101f8c514:     	sub	sp, sp, #0x80
101f8c518:     	stp	d9, d8, [sp, #0x20]
101f8c51c:     	stp	x26, x25, [sp, #0x30]
101f8c520:     	stp	x24, x23, [sp, #0x40]
101f8c524:     	stp	x22, x21, [sp, #0x50]
101f8c528:     	stp	x20, x19, [sp, #0x60]
101f8c52c:     	stp	x29, x30, [sp, #0x70]
101f8c530:     	add	x29, sp, #0x70
101f8c534:     	mov	x19, x1
101f8c538:     	mov	x21, x0
101f8c53c:     	movi.16b	v0, #0x0
101f8c540:     	stur	q0, [x1, #0x1e]
101f8c544:     	stp	q0, q0, [x1]
101f8c548:     	bl	0x101f8c7e4 <__ZL21ipad_knife_hud_originPK8bContext>
101f8c54c:     	mov	x20, x0
101f8c550:     	cbz	x0, 0x101f8c7a0 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout+0x28c>
101f8c554:     	bl	0x101f776f8 <__Z16UI_style_get_dpiv>
101f8c558:     	mov	x22, x0
101f8c55c:     	adrp	x23, 0x106d88000 <_build_commit_date>
101f8c560:     	add	x23, x23, #0xe08
101f8c564:     	ldr	s0, [x23, #0x2654]
101f8c568:     	mov	w8, #0x42300000         ; =1110441984
101f8c56c:     	fmov	s1, w8
101f8c570:     	fmul	s0, s0, s1
101f8c574:     	frintp	s0, s0
101f8c578:     	fmov	s1, #1.00000000
101f8c57c:     	fadd	s0, s0, s1
101f8c580:     	str	s0, [x19, #0x28]
101f8c584:     	fcvtzs	w24, s0
101f8c588:     	adrp	x1, 0x104d53000 <__ZL3hex+0x18734d>
101f8c58c:     	add	x1, x1, #0x7ef
101f8c590:     	mov	x0, #0x0                ; =0
101f8c594:     	bl	0x100ef50ac <__Z22BLT_translate_do_ifacePKcS0_>
101f8c598:     	mov	x1, x0
101f8c59c:     	add	x0, x22, #0x90
101f8c5a0:     	bl	0x101f77880 <__Z25UI_fontstyle_string_widthPK11uiFontStylePKc>
101f8c5a4:     	mov	w25, #0x2912            ; =10514
101f8c5a8:     	ldr	h0, [x23, x25]
101f8c5ac:     	sshll.4s	v0, v0, #0x0
101f8c5b0:     	scvtf	s0, s0
101f8c5b4:     	fmov	s8, #1.75000000
101f8c5b8:     	fmul	s0, s0, s8
101f8c5bc:     	fcvtps	w8, s0
101f8c5c0:     	add	w8, w0, w8
101f8c5c4:     	cmp	w8, w24
101f8c5c8:     	csel	w8, w8, w24, gt
101f8c5cc:     	str	w8, [x19, #0x18]
101f8c5d0:     	ldr	s0, [x19, #0x28]
101f8c5d4:     	fcvtzs	w24, s0
101f8c5d8:     	adrp	x1, 0x104d53000 <__ZL3hex+0x18734d>
101f8c5dc:     	add	x1, x1, #0x7fc
101f8c5e0:     	mov	x0, #0x0                ; =0
101f8c5e4:     	bl	0x100ef50ac <__Z22BLT_translate_do_ifacePKcS0_>
101f8c5e8:     	mov	x1, x0
101f8c5ec:     	add	x0, x22, #0x90
101f8c5f0:     	bl	0x101f77880 <__Z25UI_fontstyle_string_widthPK11uiFontStylePKc>
101f8c5f4:     	ldr	h0, [x23, x25]
101f8c5f8:     	sshll.4s	v0, v0, #0x0
101f8c5fc:     	scvtf	s0, s0
101f8c600:     	fmul	s0, s0, s8
101f8c604:     	fcvtps	w8, s0
101f8c608:     	add	w8, w0, w8
101f8c60c:     	cmp	w8, w24
101f8c610:     	csel	w8, w8, w24, gt
101f8c614:     	str	w8, [x19, #0x1c]
101f8c618:     	str	x19, [sp, #0x8]
101f8c61c:     	add	x0, sp, #0x8
101f8c620:     	mov	x1, x20
101f8c624:     	bl	0x101f8e3d8 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion>
101f8c628:     	tbnz	w0, #0x0, 0x101f8c7a0 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout+0x28c>
101f8c62c:     	mov	x0, x21
101f8c630:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f8c634:     	ldr	x21, [x0, #0x78]
101f8c638:     	cbnz	x21, 0x101f8c788 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout+0x274>
101f8c63c:     	str	x20, [x19]
101f8c640:     	ldr	x8, [x20, #0x128]
101f8c644:     	ldr	q0, [x8, #0xa0]
101f8c648:     	str	q0, [sp, #0x10]
101f8c64c:     	ldr	w1, [x20, #0xa8]
101f8c650:     	ldr	w2, [x20, #0xb0]
101f8c654:     	add	x0, sp, #0x10
101f8c658:     	bl	0x1007fd304 <__Z18BLI_rcti_translateP4rctiii>
101f8c65c:     	mov	w9, #0x2912             ; =10514
101f8c660:     	ldrsh	w8, [x23, x9]
101f8c664:     	ubfx	w10, w8, #29, #2
101f8c668:     	add	w8, w8, w10
101f8c66c:     	sbfx	w8, w8, #2, #14
101f8c670:     	cmp	w8, #0x1
101f8c674:     	csinc	w8, w8, wzr, gt
101f8c678:     	ldr	q0, [sp, #0x10]
101f8c67c:     	dup.4s	v1, w8
101f8c680:     	add.4s	v2, v0, v1
101f8c684:     	sub.4s	v0, v0, v1
101f8c688:     	rev64.4s	v1, v2
101f8c68c:     	trn2.4s	v0, v1, v0
101f8c690:     	str	q0, [sp, #0x10]
101f8c694:     	ldp	x10, x8, [sp, #0x10]
101f8c698:     	stp	x10, x8, [x19, #0x8]
101f8c69c:     	ldrsh	w9, [x23, x9]
101f8c6a0:     	add	w9, w9, w9, lsl #2
101f8c6a4:     	lsl	w9, w9, #1
101f8c6a8:     	lsr	x11, x10, #32
101f8c6ac:     	sub	w10, w11, w10
101f8c6b0:     	add	w11, w10, #0x1
101f8c6b4:     	cmp	w11, w9
101f8c6b8:     	csinc	w9, w9, w10, ge
101f8c6bc:     	cmp	w9, #0x1
101f8c6c0:     	csinc	w11, w9, wzr, gt
101f8c6c4:     	ldr	s0, [x23, #0x2654]
101f8c6c8:     	ucvtf	s1, w11
101f8c6cc:     	fdiv	s1, s1, s0
101f8c6d0:     	fcvtzs	w12, s1
101f8c6d4:     	cmp	w12, #0x1
101f8c6d8:     	csinc	w10, w12, wzr, gt
101f8c6dc:     	lsr	x9, x8, #32
101f8c6e0:     	cmp	w12, #0x2
101f8c6e4:     	b.lt	0x101f8c718 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout+0x204>
101f8c6e8:     	fmov	s1, #0.50000000
101f8c6ec:     	ucvtf	s2, w10
101f8c6f0:     	fadd	s2, s2, s1
101f8c6f4:     	fmul	s2, s0, s2
101f8c6f8:     	fcvtzs	w12, s2
101f8c6fc:     	cmp	w11, w12
101f8c700:     	b.ge	0x101f8c718 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout+0x204>
101f8c704:     	sub	w12, w10, #0x1
101f8c708:     	cmp	w10, #0x2
101f8c70c:     	mov	x10, x12
101f8c710:     	b.gt	0x101f8c6ec <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout+0x1d8>
101f8c714:     	mov	w10, #0x1               ; =1
101f8c718:     	str	w10, [x19, #0x20]
101f8c71c:     	sub	w8, w9, w8
101f8c720:     	bic	w8, w8, w8, asr #31
101f8c724:     	add	w9, w8, #0x1
101f8c728:     	ldr	s0, [x23, #0x2654]
101f8c72c:     	ucvtf	s1, w9
101f8c730:     	fdiv	s1, s1, s0
101f8c734:     	fcvtzs	w10, s1
101f8c738:     	cmp	w10, #0x1
101f8c73c:     	csinc	w8, w10, wzr, gt
101f8c740:     	cmp	w10, #0x2
101f8c744:     	b.lt	0x101f8c778 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout+0x264>
101f8c748:     	fmov	s1, #0.50000000
101f8c74c:     	ucvtf	s2, w8
101f8c750:     	fadd	s2, s2, s1
101f8c754:     	fmul	s2, s0, s2
101f8c758:     	fcvtzs	w10, s2
101f8c75c:     	cmp	w9, w10
101f8c760:     	b.ge	0x101f8c778 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout+0x264>
101f8c764:     	sub	w10, w8, #0x1
101f8c768:     	cmp	w8, #0x2
101f8c76c:     	mov	x8, x10
101f8c770:     	b.gt	0x101f8c74c <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout+0x238>
101f8c774:     	mov	w8, #0x1                ; =1
101f8c778:     	str	w8, [x19, #0x24]
101f8c77c:     	b	0x101f8c7a0 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout+0x28c>
101f8c780:     	ldr	x21, [x21]
101f8c784:     	cbz	x21, 0x101f8c63c <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout+0x128>
101f8c788:     	cmp	x21, x20
101f8c78c:     	b.eq	0x101f8c780 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout+0x26c>
101f8c790:     	add	x0, sp, #0x8
101f8c794:     	mov	x1, x21
101f8c798:     	bl	0x101f8e3d8 <__ZZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayoutENK3$_0clEP7ARegion>
101f8c79c:     	tbz	w0, #0x0, 0x101f8c780 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout+0x26c>
101f8c7a0:     	cmp	x20, #0x0
101f8c7a4:     	cset	w0, ne
101f8c7a8:     	ldp	x29, x30, [sp, #0x70]
101f8c7ac:     	ldp	x20, x19, [sp, #0x60]
101f8c7b0:     	ldp	x22, x21, [sp, #0x50]
101f8c7b4:     	ldp	x24, x23, [sp, #0x40]
101f8c7b8:     	ldp	x26, x25, [sp, #0x30]
101f8c7bc:     	ldp	d9, d8, [sp, #0x20]
101f8c7c0:     	add	sp, sp, #0x80
101f8c7c4:     	ret
