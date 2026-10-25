
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b5c4c8 <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb>:
100b5c4c8:     	sub	sp, sp, #0x70
100b5c4cc:     	stp	x26, x25, [sp, #0x20]
100b5c4d0:     	stp	x24, x23, [sp, #0x30]
100b5c4d4:     	stp	x22, x21, [sp, #0x40]
100b5c4d8:     	stp	x20, x19, [sp, #0x50]
100b5c4dc:     	stp	x29, x30, [sp, #0x60]
100b5c4e0:     	add	x29, sp, #0x60
100b5c4e4:     	mov	x23, x5
100b5c4e8:     	mov	x24, x4
100b5c4ec:     	mov	x25, x3
100b5c4f0:     	mov	x22, x2
100b5c4f4:     	mov	x21, x1
100b5c4f8:     	mov	x19, x0
100b5c4fc:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b5c500:     	mov	x20, x0
100b5c504:     	tbnz	w22, #0x0, 0x100b5c514 <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x4c>
100b5c508:     	cbz	x20, 0x100b5c514 <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x4c>
100b5c50c:     	ldrh	w8, [x20, #0x1b4]
100b5c510:     	cbz	w8, 0x100b5c57c <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0xb4>
100b5c514:     	mov	w26, #0x0               ; =0
100b5c518:     	str	xzr, [x21, #0x60]
100b5c51c:     	cbz	w25, 0x100b5c528 <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x60>
100b5c520:     	mov	x0, x21
100b5c524:     	bl	0x100b81450 <__Z33WM_operator_last_properties_storeP10wmOperator>
100b5c528:     	ldrh	w8, [x20, #0x1b4]
100b5c52c:     	cbz	w8, 0x100b5c53c <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x74>
100b5c530:     	mov	w23, #0x1               ; =1
100b5c534:     	tbz	w22, #0x0, 0x100b5c5ac <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0xe4>
100b5c538:     	b	0x100b5c69c <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x1d4>
100b5c53c:     	ldr	x8, [x21, #0x58]
100b5c540:     	ldrh	w8, [x8, #0xe4]
100b5c544:     	tbnz	w8, #0x1, 0x100b5c564 <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x9c>
100b5c548:     	tbnz	w8, #0xa, 0x100b5c598 <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0xd0>
100b5c54c:     	eor	w8, w24, #0x1
100b5c550:     	orr	w9, w23, w26
100b5c554:     	orr	w8, w8, w9
100b5c558:     	orr	w23, w8, w22
100b5c55c:     	tbz	w22, #0x0, 0x100b5c5ac <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0xe4>
100b5c560:     	b	0x100b5c69c <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x1d4>
100b5c564:     	mov	x0, x19
100b5c568:     	mov	x1, x21
100b5c56c:     	bl	0x101661d28 <__Z15ED_undo_push_opP8bContextP10wmOperator>
100b5c570:     	mov	x23, x22
100b5c574:     	tbz	w22, #0x0, 0x100b5c5ac <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0xe4>
100b5c578:     	b	0x100b5c69c <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x1d4>
100b5c57c:     	ldr	x8, [x21, #0x58]
100b5c580:     	ldrh	w8, [x8, #0xe4]
100b5c584:     	tst	w8, #0x3
100b5c588:     	cset	w26, ne
100b5c58c:     	str	xzr, [x21, #0x60]
100b5c590:     	cbnz	w25, 0x100b5c520 <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x58>
100b5c594:     	b	0x100b5c528 <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x60>
100b5c598:     	mov	x0, x19
100b5c59c:     	mov	x1, x21
100b5c5a0:     	bl	0x101661d34 <__Z23ED_undo_grouped_push_opP8bContextP10wmOperator>
100b5c5a4:     	mov	x23, x22
100b5c5a8:     	tbnz	w22, #0x0, 0x100b5c69c <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x1d4>
100b5c5ac:     	adrp	x8, 0x106d88000 <_build_commit_date>
100b5c5b0:     	add	x8, x8, #0x28
100b5c5b4:     	ldrb	w8, [x8, #0xc40]
100b5c5b8:     	tbz	w8, #0x5, 0x100b5c600 <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x138>
100b5c5bc:     	add	x22, sp, #0x8
100b5c5c0:     	add	x8, sp, #0x8
100b5c5c4:     	mov	x0, x19
100b5c5c8:     	mov	x1, x21
100b5c5cc:     	mov	w2, #0x0                ; =0
100b5c5d0:     	mov	w3, #0x1                ; =1
100b5c5d4:     	bl	0x100b7f714 <__Z20WM_operator_pystringP8bContextP10wmOperatorbb>
100b5c5d8:     	mov	x0, x19
100b5c5dc:     	bl	0x1000b4484 <__Z14CTX_wm_reportsPK8bContext>
100b5c5e0:     	ldrsb	w8, [sp, #0x1f]
100b5c5e4:     	ldr	x9, [sp, #0x8]
100b5c5e8:     	cmp	w8, #0x0
100b5c5ec:     	csel	x2, x9, x22, lt
100b5c5f0:     	mov	w1, #0x4                ; =4
100b5c5f4:     	bl	0x1003ca47c <__Z10BKE_reportP10ReportList11eReportTypePKc>
100b5c5f8:     	ldrsb	w8, [sp, #0x1f]
100b5c5fc:     	tbnz	w8, #0x1f, 0x100b5c688 <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x1c0>
100b5c600:     	cbz	w26, 0x100b5c694 <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x1cc>
100b5c604:     	ldr	x8, [x21, #0x78]
100b5c608:     	ldr	w9, [x8, #0x18]
100b5c60c:     	orr	w9, w9, #0x4
100b5c610:     	str	w9, [x8, #0x18]
100b5c614:     	mov	x0, x19
100b5c618:     	mov	x1, x21
100b5c61c:     	bl	0x100b4323c <__Z20wm_operator_registerP8bContextP10wmOperator>
100b5c620:     	mov	x0, x19
100b5c624:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b5c628:     	cbz	x0, 0x100b5c654 <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x18c>
100b5c62c:     	mov	x22, x0
100b5c630:     	mov	x0, x19
100b5c634:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5c638:     	cbz	x0, 0x100b5c654 <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x18c>
100b5c63c:     	mov	x1, x0
100b5c640:     	ldrh	w8, [x0, #0xc0]
100b5c644:     	cbnz	w8, 0x100b5c654 <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x18c>
100b5c648:     	add	x0, x22, #0x78
100b5c64c:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b5c650:     	strh	w0, [x22, #0x54]
100b5c654:     	mov	x0, x19
100b5c658:     	bl	0x100b82374 <__Z21WM_operator_last_redoPK8bContext>
100b5c65c:     	cmp	x0, x21
100b5c660:     	b.ne	0x100b5c69c <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x1d4>
100b5c664:     	mov	x0, x19
100b5c668:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b5c66c:     	cbz	x0, 0x100b5c6ac <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x1e4>
100b5c670:     	mov	x1, x0
100b5c674:     	ldrh	w8, [x0, #0x52]
100b5c678:     	tbnz	w8, #0x9, 0x100b5c6ac <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x1e4>
100b5c67c:     	mov	x0, x19
100b5c680:     	bl	0x101f8dec4 <__Z23ED_area_type_hud_ensureP8bContextP7ScrArea>
100b5c684:     	b	0x100b5c6ac <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x1e4>
100b5c688:     	ldr	x0, [sp, #0x8]
100b5c68c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b5c690:     	cbnz	w26, 0x100b5c604 <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x13c>
100b5c694:     	mov	x0, x21
100b5c698:     	bl	0x100b42fe8 <__Z16WM_operator_freeP10wmOperator>
100b5c69c:     	tbnz	w23, #0x0, 0x100b5c6ac <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x1e4>
100b5c6a0:     	mov	x0, x20
100b5c6a4:     	mov	x1, #0x0                ; =0
100b5c6a8:     	bl	0x101f8ddd8 <__Z22ED_area_type_hud_clearP15wmWindowManagerP7ScrArea>
100b5c6ac:     	ldp	x29, x30, [sp, #0x60]
100b5c6b0:     	ldp	x20, x19, [sp, #0x50]
100b5c6b4:     	ldp	x22, x21, [sp, #0x40]
100b5c6b8:     	ldp	x24, x23, [sp, #0x30]
100b5c6bc:     	ldp	x26, x25, [sp, #0x20]
100b5c6c0:     	add	sp, sp, #0x70
100b5c6c4:     	ret
100b5c6c8:     	mov	x19, x0
100b5c6cc:     	ldrsb	w8, [sp, #0x1f]
100b5c6d0:     	tbz	w8, #0x1f, 0x100b5c6dc <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb+0x214>
100b5c6d4:     	ldr	x0, [sp, #0x8]
100b5c6d8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b5c6dc:     	mov	x0, x19
100b5c6e0:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
