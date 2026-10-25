
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f8d490 <__ZL17hud_region_layoutPK8bContextP7ARegion>:
101f8d490:     	stp	x24, x23, [sp, #-0x40]!
101f8d494:     	stp	x22, x21, [sp, #0x10]
101f8d498:     	stp	x20, x19, [sp, #0x20]
101f8d49c:     	stp	x29, x30, [sp, #0x30]
101f8d4a0:     	add	x29, sp, #0x30
101f8d4a4:     	mov	x19, x1
101f8d4a8:     	mov	x20, x0
101f8d4ac:     	ldr	x21, [x1, #0x120]
101f8d4b0:     	bl	0x101f8c7e4 <__ZL21ipad_knife_hud_originPK8bContext>
101f8d4b4:     	cbnz	x0, 0x101f8d4c4 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x34>
101f8d4b8:     	mov	x0, x20
101f8d4bc:     	bl	0x101f8d72c <__Z21UI_ipad_corner_canvasP8bContext>
101f8d4c0:     	cbz	x0, 0x101f8d5e0 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x150>
101f8d4c4:     	mov	x0, x20
101f8d4c8:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f8d4cc:     	mov	x21, x0
101f8d4d0:     	ldrh	w23, [x19, #0xc8]
101f8d4d4:     	mov	x0, x20
101f8d4d8:     	mov	x1, x19
101f8d4dc:     	bl	0x101623a14 <__Z23ED_region_panels_layoutPK8bContextP7ARegion>
101f8d4e0:     	ldr	x22, [x19, #0xd0]
101f8d4e4:     	cbz	x22, 0x101f8d608 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x178>
101f8d4e8:     	mov	w24, #0x0               ; =0
101f8d4ec:     	mov	x0, x22
101f8d4f0:     	bl	0x101f6def4 <__Z18UI_panel_is_activePK5Panel>
101f8d4f4:     	orr	w24, w24, w0
101f8d4f8:     	ldr	x22, [x22]
101f8d4fc:     	cbnz	x22, 0x101f8d4ec <__ZL17hud_region_layoutPK8bContextP7ARegion+0x5c>
101f8d500:     	tbz	w24, #0x0, 0x101f8d608 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x178>
101f8d504:     	ldr	x8, [x19, #0xd0]
101f8d508:     	cbz	x8, 0x101f8d5c8 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x138>
101f8d50c:     	ldrh	w8, [x21, #0x52]
101f8d510:     	ldrh	w9, [x19, #0xc8]
101f8d514:     	tbnz	w8, #0x3, 0x101f8d520 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x90>
101f8d518:     	cmp	w9, w23
101f8d51c:     	b.eq	0x101f8d5c8 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x138>
101f8d520:     	adrp	x8, 0x106d88000 <_build_commit_date>
101f8d524:     	add	x8, x8, #0xe08
101f8d528:     	ldr	s0, [x8, #0x2654]
101f8d52c:     	ldr	h1, [x19, #0xc6]
101f8d530:     	sshll.4s	v1, v1, #0x0
101f8d534:     	scvtf	s1, s1
101f8d538:     	fmov	s2, #0.50000000
101f8d53c:     	fadd	s1, s1, s2
101f8d540:     	fmul	s1, s0, s1
101f8d544:     	fcvtzs	w8, s1
101f8d548:     	sxth	w9, w9
101f8d54c:     	scvtf	s1, w9
101f8d550:     	fadd	s1, s1, s2
101f8d554:     	fmul	s0, s0, s1
101f8d558:     	fcvtzs	w9, s0
101f8d55c:     	ldrh	w10, [x19, #0xc4]
101f8d560:     	tbz	w10, #0x5, 0x101f8d570 <__ZL17hud_region_layoutPK8bContextP7ARegion+0xe0>
101f8d564:     	ldrsh	w11, [x19, #0xb8]
101f8d568:     	cmp	w8, w11
101f8d56c:     	csel	w8, w8, w11, lt
101f8d570:     	tbz	w10, #0x6, 0x101f8d580 <__ZL17hud_region_layoutPK8bContextP7ARegion+0xf0>
101f8d574:     	ldrsh	w10, [x19, #0xba]
101f8d578:     	cmp	w9, w10
101f8d57c:     	csel	w9, w9, w10, lt
101f8d580:     	strh	w8, [x19, #0xb8]
101f8d584:     	strh	w9, [x19, #0xba]
101f8d588:     	ldr	w10, [x19, #0xa8]
101f8d58c:     	sxth	w2, w8
101f8d590:     	add	w8, w2, w10
101f8d594:     	sub	w8, w8, #0x1
101f8d598:     	str	w8, [x19, #0xac]
101f8d59c:     	ldr	w8, [x19, #0xb0]
101f8d5a0:     	sxth	w3, w9
101f8d5a4:     	add	w8, w3, w8
101f8d5a8:     	sub	w8, w8, #0x1
101f8d5ac:     	str	w8, [x19, #0xb4]
101f8d5b0:     	add	x0, x19, #0x10
101f8d5b4:     	mov	w1, #0x1                ; =1
101f8d5b8:     	bl	0x101fdc100 <__Z23UI_view2d_region_reinitP6View2Dsii>
101f8d5bc:     	mov	x0, x20
101f8d5c0:     	mov	x1, x19
101f8d5c4:     	bl	0x101623a14 <__Z23ED_region_panels_layoutPK8bContextP7ARegion>
101f8d5c8:     	mov	x0, x20
101f8d5cc:     	ldp	x29, x30, [sp, #0x30]
101f8d5d0:     	ldp	x20, x19, [sp, #0x20]
101f8d5d4:     	ldp	x22, x21, [sp, #0x10]
101f8d5d8:     	ldp	x24, x23, [sp], #0x40
101f8d5dc:     	b	0x101fdd160 <__Z22UI_view2d_view_restorePK8bContext>
101f8d5e0:     	cbz	x21, 0x101f8d600 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x170>
101f8d5e4:     	ldrb	w8, [x21, #0x2]
101f8d5e8:     	tbnz	w8, #0x0, 0x101f8d600 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x170>
101f8d5ec:     	ldrsh	w1, [x21]
101f8d5f0:     	ldr	w2, [x21, #0x30]
101f8d5f4:     	mov	x0, x20
101f8d5f8:     	bl	0x101f8e260 <__ZL14last_redo_pollPK8bContextsi>
101f8d5fc:     	tbnz	w0, #0x0, 0x101f8d4c4 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x34>
101f8d600:     	mov	x0, x19
101f8d604:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
101f8d608:     	ldrh	w8, [x19, #0xc4]
101f8d60c:     	orr	w8, w8, #0x1
101f8d610:     	strh	w8, [x19, #0xc4]
101f8d614:     	add	x0, x19, #0xa8
101f8d618:     	mov	w1, #0x0                ; =0
101f8d61c:     	mov	w2, #0x0                ; =0
101f8d620:     	mov	w3, #0x0                ; =0
101f8d624:     	mov	w4, #0x0                ; =0
101f8d628:     	ldp	x29, x30, [sp, #0x30]
101f8d62c:     	ldp	x20, x19, [sp, #0x20]
101f8d630:     	ldp	x22, x21, [sp, #0x10]
101f8d634:     	ldp	x24, x23, [sp], #0x40
101f8d638:     	b	0x1007fcf78 <__Z13BLI_rcti_initP4rctiiiii>
