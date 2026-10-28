
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b5d30c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch>:
100b5d30c:     	sub	sp, sp, #0x140
100b5d310:     	stp	x28, x27, [sp, #0xe0]
100b5d314:     	stp	x26, x25, [sp, #0xf0]
100b5d318:     	stp	x24, x23, [sp, #0x100]
100b5d31c:     	stp	x22, x21, [sp, #0x110]
100b5d320:     	stp	x20, x19, [sp, #0x120]
100b5d324:     	stp	x29, x30, [sp, #0x130]
100b5d328:     	add	x29, sp, #0x130
100b5d32c:     	mov	x22, x1
100b5d330:     	mov	x19, x0
100b5d334:     	cbz	w5, 0x100b5d348 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x3c>
100b5d338:     	mov	x0, x19
100b5d33c:     	mov	x1, x22
100b5d340:     	bl	0x100b4eb14 <__Z16WM_operator_pollP8bContextP14wmOperatorType>
100b5d344:     	b	0x100b5d80c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x500>
100b5d348:     	mov	x21, x7
100b5d34c:     	mov	x23, x4
100b5d350:     	mov	x20, x2
100b5d354:     	mov	x25, x3
100b5d358:     	mov	x28, x6
100b5d35c:     	mov	x0, x19
100b5d360:     	mov	x1, x2
100b5d364:     	mov	x2, x7
100b5d368:     	bl	0x100b5d8f8 <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch>
100b5d36c:     	cbz	w0, 0x100b5d384 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x78>
100b5d370:     	cmp	w21, #0x2
100b5d374:     	cset	w1, eq
100b5d378:     	mov	x0, x22
100b5d37c:     	bl	0x101fe4c24 <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb>
100b5d380:     	tbnz	w0, #0x0, 0x100b5d388 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x7c>
100b5d384:     	mov	w21, #0x0               ; =0
100b5d388:     	mov	x0, x19
100b5d38c:     	mov	x1, x22
100b5d390:     	bl	0x100b4eb14 <__Z16WM_operator_pollP8bContextP14wmOperatorType>
100b5d394:     	cbz	w0, 0x100b5d3c8 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0xbc>
100b5d398:     	mov	x0, x19
100b5d39c:     	mov	x1, x20
100b5d3a0:     	mov	x2, x21
100b5d3a4:     	bl	0x100b5d8f8 <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch>
100b5d3a8:     	cbz	w0, 0x100b5d3d0 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0xc4>
100b5d3ac:     	cmp	w21, #0x2
100b5d3b0:     	cset	w1, eq
100b5d3b4:     	mov	x0, x22
100b5d3b8:     	bl	0x101fe4c24 <__Z33ED_view2d_native_pan_zoom_type_isPK14wmOperatorTypeb>
100b5d3bc:     	tbz	w0, #0x0, 0x100b5d3d0 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0xc4>
100b5d3c0:     	mov	w0, #0x2                ; =2
100b5d3c4:     	b	0x100b5d80c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x500>
100b5d3c8:     	mov	w0, #0x8                ; =8
100b5d3cc:     	b	0x100b5d80c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x500>
100b5d3d0:     	mov	x0, x19
100b5d3d4:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b5d3d8:     	mov	x24, x0
100b5d3dc:     	ldr	x8, [x0, #0x5c0]
100b5d3e0:     	ldr	x9, [x8, #0xe0]
100b5d3e4:     	cbz	x9, 0x100b5d3f0 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0xe4>
100b5d3e8:     	ldr	x27, [x9, #0x20]
100b5d3ec:     	b	0x100b5d3f4 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0xe8>
100b5d3f0:     	mov	x27, #-0x1              ; =-1
100b5d3f4:     	mov	x2, x25
100b5d3f8:     	ldr	x8, [x8, #0x70]
100b5d3fc:     	cmp	x8, #0x0
100b5d400:     	csinv	x8, x8, xzr, ne
100b5d404:     	str	x8, [sp, #0x18]
100b5d408:     	mov	x0, x24
100b5d40c:     	mov	x1, x22
100b5d410:     	mov	x3, x23
100b5d414:     	bl	0x100b5d9e4 <__ZL18wm_operator_createP15wmWindowManagerP14wmOperatorTypeP10PointerRNAP10ReportList>
100b5d418:     	mov	x21, x0
100b5d41c:     	adrp	x26, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b5d420:     	add	x26, x26, #0x280
100b5d424:     	ldr	x0, [x26]
100b5d428:     	ldr	x25, [x0, #0x8]
100b5d42c:     	cbnz	x25, 0x100b5d43c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x130>
100b5d430:     	bl	0x100ae3834 <__Z15CLG_logref_initP10CLG_LogRef>
100b5d434:     	ldr	x8, [x26]
100b5d438:     	ldr	x25, [x8, #0x8]
100b5d43c:     	ldr	w8, [x25, #0x50]
100b5d440:     	ldr	x9, [x21, #0x58]
100b5d444:     	ldrh	w9, [x9, #0xe4]
100b5d448:     	tst	w9, #0x1
100b5d44c:     	mov	w9, #0x3                ; =3
100b5d450:     	cinc	w26, w9, eq
100b5d454:     	cmp	w8, w26
100b5d458:     	b.lt	0x100b5d4c0 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x1b4>
100b5d45c:     	add	x8, sp, #0x20
100b5d460:     	mov	x0, x19
100b5d464:     	mov	x1, x21
100b5d468:     	mov	w2, #0x0                ; =0
100b5d46c:     	mov	w3, #0x1                ; =1
100b5d470:     	bl	0x100b80c74 <__Z20WM_operator_pystringP8bContextP10wmOperatorbb>
100b5d474:     	ldrsb	w8, [sp, #0x37]
100b5d478:     	ldr	x9, [sp, #0x20]
100b5d47c:     	cmp	w8, #0x0
100b5d480:     	add	x8, sp, #0x20
100b5d484:     	csel	x8, x9, x8, lt
100b5d488:     	adrp	x2, 0x104bd4000 <__ZL3hex+0x45cd>
100b5d48c:     	add	x2, x2, #0xb54
100b5d490:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5d494:     	add	x3, x3, #0xb90
100b5d498:     	adrp	x4, 0x104bd4000 <__ZL3hex+0x45cd>
100b5d49c:     	add	x4, x4, #0xba3
100b5d4a0:     	str	x8, [sp]
100b5d4a4:     	mov	x0, x25
100b5d4a8:     	mov	x1, x26
100b5d4ac:     	bl	0x100ae2b58 <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b5d4b0:     	ldrsb	w8, [sp, #0x37]
100b5d4b4:     	tbz	w8, #0x1f, 0x100b5d4c0 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x1b4>
100b5d4b8:     	ldr	x0, [sp, #0x20]
100b5d4bc:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b5d4c0:     	ldrh	w8, [x24, #0x1b4]
100b5d4c4:     	cbz	x20, 0x100b5d4d4 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x1c8>
100b5d4c8:     	ldrh	w9, [x21, #0xa0]
100b5d4cc:     	orr	w9, w9, #0x1
100b5d4d0:     	strh	w9, [x21, #0xa0]
100b5d4d4:     	cmp	w8, #0x0
100b5d4d8:     	csel	w25, wzr, w28, ne
100b5d4dc:     	cmp	w25, #0x1
100b5d4e0:     	b.ne	0x100b5d4ec <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x1e0>
100b5d4e4:     	mov	x0, x21
100b5d4e8:     	bl	0x100b825fc <__Z32WM_operator_last_properties_initP10wmOperator>
100b5d4ec:     	cbz	x20, 0x100b5d4fc <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x1f0>
100b5d4f0:     	ldrh	w8, [x20, #0x10]
100b5d4f4:     	cmp	w8, #0x4
100b5d4f8:     	b.eq	0x100b5d574 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x268>
100b5d4fc:     	adrp	x28, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b5d500:     	add	x28, x28, #0x2a0
100b5d504:     	ldr	x0, [x28]
100b5d508:     	ldr	x26, [x0, #0x8]
100b5d50c:     	cbnz	x26, 0x100b5d51c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x210>
100b5d510:     	bl	0x100ae3834 <__Z15CLG_logref_initP10CLG_LogRef>
100b5d514:     	ldr	x8, [x28]
100b5d518:     	ldr	x26, [x8, #0x8]
100b5d51c:     	ldr	w8, [x26, #0x50]
100b5d520:     	cmp	w8, #0x4
100b5d524:     	b.lt	0x100b5d574 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x268>
100b5d528:     	cbz	x20, 0x100b5d534 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x228>
100b5d52c:     	ldrsh	w28, [x20, #0x10]
100b5d530:     	b	0x100b5d538 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x22c>
100b5d534:     	mov	w28, #0x0               ; =0
100b5d538:     	mov	x0, x19
100b5d53c:     	bl	0x1000b3bb8 <__Z13CTX_wm_screenPK8bContext>
100b5d540:     	ldr	x8, [x0, #0x1f8]
100b5d544:     	ldr	x9, [x22, #0x8]
100b5d548:     	adrp	x2, 0x104bd4000 <__ZL3hex+0x45cd>
100b5d54c:     	add	x2, x2, #0xbae
100b5d550:     	stp	x8, x9, [sp, #0x8]
100b5d554:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5d558:     	add	x3, x3, #0xb90
100b5d55c:     	adrp	x4, 0x104bd4000 <__ZL3hex+0x45cd>
100b5d560:     	add	x4, x4, #0xbea
100b5d564:     	str	x28, [sp]
100b5d568:     	mov	x0, x26
100b5d56c:     	mov	w1, #0x4                ; =4
100b5d570:     	bl	0x100ae2b58 <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b5d574:     	ldr	x9, [x21, #0x58]
100b5d578:     	cbz	x20, 0x100b5d5d8 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x2cc>
100b5d57c:     	ldr	x8, [x9, #0x38]
100b5d580:     	cbz	x8, 0x100b5d5d8 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x2cc>
100b5d584:     	ldp	q0, q1, [x20, #0x80]
100b5d588:     	stp	q0, q1, [sp, #0xa0]
100b5d58c:     	ldr	q0, [x20, #0xa0]
100b5d590:     	str	q0, [sp, #0xc0]
100b5d594:     	ldp	q0, q1, [x20, #0x40]
100b5d598:     	stp	q0, q1, [sp, #0x60]
100b5d59c:     	ldp	q1, q0, [x20, #0x60]
100b5d5a0:     	stp	q1, q0, [sp, #0x80]
100b5d5a4:     	ldp	q0, q1, [x20]
100b5d5a8:     	stp	q0, q1, [sp, #0x20]
100b5d5ac:     	ldp	q1, q0, [x20, #0x20]
100b5d5b0:     	stp	q1, q0, [sp, #0x40]
100b5d5b4:     	mov	x0, x19
100b5d5b8:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5d5bc:     	cbz	x0, 0x100b5d69c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x390>
100b5d5c0:     	ldr	w8, [x0, #0xa8]
100b5d5c4:     	ldp	w9, w10, [sp, #0x34]
100b5d5c8:     	sub	w8, w9, w8
100b5d5cc:     	ldr	w9, [x0, #0xb0]
100b5d5d0:     	sub	w9, w10, w9
100b5d5d4:     	b	0x100b5d6a4 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x398>
100b5d5d8:     	ldr	x8, [x9, #0x28]
100b5d5dc:     	cbz	x8, 0x100b5d63c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x330>
100b5d5e0:     	ldrh	w9, [x9, #0xe4]
100b5d5e4:     	tbz	w9, #0x1, 0x100b5d5fc <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x2f0>
100b5d5e8:     	ldrh	w8, [x24, #0x1b4]
100b5d5ec:     	add	w8, w8, #0x1
100b5d5f0:     	strh	w8, [x24, #0x1b4]
100b5d5f4:     	ldr	x8, [x21, #0x58]
100b5d5f8:     	ldr	x8, [x8, #0x28]
100b5d5fc:     	mov	x0, x19
100b5d600:     	mov	x1, x21
100b5d604:     	blr	x8
100b5d608:     	ldr	x8, [x21, #0x58]
100b5d60c:     	ldrh	w8, [x8, #0xe4]
100b5d610:     	tbz	w8, #0x1, 0x100b5d70c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x400>
100b5d614:     	mov	x26, x0
100b5d618:     	mov	x0, x19
100b5d61c:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b5d620:     	cmp	x0, x24
100b5d624:     	b.ne	0x100b5d634 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x328>
100b5d628:     	ldrh	w8, [x24, #0x1b4]
100b5d62c:     	sub	w8, w8, #0x1
100b5d630:     	strh	w8, [x24, #0x1b4]
100b5d634:     	mov	x0, x26
100b5d638:     	b	0x100b5d70c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x400>
100b5d63c:     	adrp	x19, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b5d640:     	add	x19, x19, #0x280
100b5d644:     	ldr	x8, [x19]
100b5d648:     	ldr	x0, [x8, #0x8]
100b5d64c:     	cbnz	x0, 0x100b5d660 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x354>
100b5d650:     	mov	x0, x8
100b5d654:     	bl	0x100ae3834 <__Z15CLG_logref_initP10CLG_LogRef>
100b5d658:     	ldr	x8, [x19]
100b5d65c:     	ldr	x0, [x8, #0x8]
100b5d660:     	ldr	w8, [x0, #0x50]
100b5d664:     	cmp	w8, #0x1
100b5d668:     	b.lt	0x100b5d694 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x388>
100b5d66c:     	add	x8, x21, #0x10
100b5d670:     	adrp	x2, 0x104bd4000 <__ZL3hex+0x45cd>
100b5d674:     	add	x2, x2, #0xc07
100b5d678:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5d67c:     	add	x3, x3, #0xb90
100b5d680:     	adrp	x4, 0x104bd4000 <__ZL3hex+0x45cd>
100b5d684:     	add	x4, x4, #0xc43
100b5d688:     	str	x8, [sp]
100b5d68c:     	mov	w1, #0x1                ; =1
100b5d690:     	bl	0x100ae2b58 <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b5d694:     	mov	w26, #0x8               ; =8
100b5d698:     	b	0x100b5d740 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x434>
100b5d69c:     	mov	w8, #-0x1               ; =-1
100b5d6a0:     	mov	w9, #-0x1               ; =-1
100b5d6a4:     	stp	w8, w9, [sp, #0x3c]
100b5d6a8:     	ldr	x8, [x21, #0x58]
100b5d6ac:     	ldrb	w9, [x8, #0xe4]
100b5d6b0:     	tbz	w9, #0x1, 0x100b5d6c4 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x3b8>
100b5d6b4:     	ldrh	w8, [x24, #0x1b4]
100b5d6b8:     	add	w8, w8, #0x1
100b5d6bc:     	strh	w8, [x24, #0x1b4]
100b5d6c0:     	ldr	x8, [x21, #0x58]
100b5d6c4:     	ldr	x8, [x8, #0x38]
100b5d6c8:     	add	x2, sp, #0x20
100b5d6cc:     	mov	x0, x19
100b5d6d0:     	mov	x1, x21
100b5d6d4:     	blr	x8
100b5d6d8:     	ldr	x8, [x21, #0x58]
100b5d6dc:     	ldrh	w8, [x8, #0xe4]
100b5d6e0:     	tbz	w8, #0x1, 0x100b5d70c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x400>
100b5d6e4:     	mov	x26, x0
100b5d6e8:     	mov	x0, x19
100b5d6ec:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b5d6f0:     	mov	x8, x0
100b5d6f4:     	mov	x0, x26
100b5d6f8:     	cmp	x8, x24
100b5d6fc:     	b.ne	0x100b5d70c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x400>
100b5d700:     	ldrh	w8, [x24, #0x1b4]
100b5d704:     	sub	w8, w8, #0x1
100b5d708:     	strh	w8, [x24, #0x1b4]
100b5d70c:     	tbnz	w0, #0x4, 0x100b5d80c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x500>
100b5d710:     	tst	w0, #0x6
100b5d714:     	mov	x26, x0
100b5d718:     	b.eq	0x100b5d738 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x42c>
100b5d71c:     	cmp	x23, #0x0
100b5d720:     	cset	w3, ne
100b5d724:     	mov	x0, x19
100b5d728:     	mov	x1, x21
100b5d72c:     	mov	x2, x26
100b5d730:     	bl	0x100b5ce98 <__ZL19wm_operator_reportsP8bContextP10wmOperator16wmOperatorStatusb>
100b5d734:     	mov	x0, x26
100b5d738:     	tbnz	w0, #0x2, 0x100b5d74c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x440>
100b5d73c:     	tbnz	w0, #0x0, 0x100b5d760 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x454>
100b5d740:     	mov	x0, x21
100b5d744:     	bl	0x100b4305c <__Z16WM_operator_freeP10wmOperator>
100b5d748:     	b	0x100b5d808 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x4fc>
100b5d74c:     	ldr	x8, [x24, #0x5c0]
100b5d750:     	ldr	x9, [x8, #0xe0]
100b5d754:     	cbz	x9, 0x100b5d7d0 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x4c4>
100b5d758:     	ldr	x9, [x9, #0x20]
100b5d75c:     	b	0x100b5d7d4 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x4c8>
100b5d760:     	ldr	x8, [x21, #0x78]
100b5d764:     	ldr	w9, [x8, #0x18]
100b5d768:     	orr	w9, w9, #0x4
100b5d76c:     	str	w9, [x8, #0x18]
100b5d770:     	ldrh	w8, [x22, #0xe4]
100b5d774:     	tbnz	w8, #0x2, 0x100b5d78c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x480>
100b5d778:     	ldr	x8, [x21, #0x90]
100b5d77c:     	cbz	x8, 0x100b5d7c4 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x4b8>
100b5d780:     	ldr	x8, [x8, #0x58]
100b5d784:     	ldrh	w8, [x8, #0xe4]
100b5d788:     	tbz	w8, #0x2, 0x100b5d7c4 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x4b8>
100b5d78c:     	cbz	x20, 0x100b5d7a4 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x498>
100b5d790:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b5d794:     	add	x8, x8, #0xe08
100b5d798:     	mov	w9, #0x2627             ; =9767
100b5d79c:     	ldrb	w8, [x8, x9]
100b5d7a0:     	tbnz	w8, #0x0, 0x100b5d82c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x520>
100b5d7a4:     	mov	w21, #0x0               ; =0
100b5d7a8:     	mov	x22, #0x0               ; =0
100b5d7ac:     	mov	x0, x19
100b5d7b0:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5d7b4:     	mov	x1, x21
100b5d7b8:     	mov	x2, x22
100b5d7bc:     	mov	w3, #0x0                ; =0
100b5d7c0:     	bl	0x100b446d4 <__Z21WM_cursor_grab_enableP8wmWindow18eWM_CursorWrapAxisPK4rctib>
100b5d7c4:     	mov	x0, x19
100b5d7c8:     	bl	0x100b5de94 <__ZL26wm_event_handler_ui_cancelP8bContext>
100b5d7cc:     	b	0x100b5d808 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x4fc>
100b5d7d0:     	mov	x9, #-0x1               ; =-1
100b5d7d4:     	cmp	x27, x9
100b5d7d8:     	cset	w4, ne
100b5d7dc:     	ldr	x8, [x8, #0x70]
100b5d7e0:     	cmp	x8, #0x0
100b5d7e4:     	csinv	x8, x8, xzr, ne
100b5d7e8:     	ldr	x9, [sp, #0x18]
100b5d7ec:     	cmp	x9, x8
100b5d7f0:     	cset	w5, ne
100b5d7f4:     	mov	x0, x19
100b5d7f8:     	mov	x1, x21
100b5d7fc:     	mov	w2, #0x0                ; =0
100b5d800:     	mov	x3, x25
100b5d804:     	bl	0x100b5d0f0 <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb>
100b5d808:     	mov	x0, x26
100b5d80c:     	ldp	x29, x30, [sp, #0x130]
100b5d810:     	ldp	x20, x19, [sp, #0x120]
100b5d814:     	ldp	x22, x21, [sp, #0x110]
100b5d818:     	ldp	x24, x23, [sp, #0x100]
100b5d81c:     	ldp	x26, x25, [sp, #0xf0]
100b5d820:     	ldp	x28, x27, [sp, #0xe0]
100b5d824:     	add	sp, sp, #0x140
100b5d828:     	ret
100b5d82c:     	ldr	x8, [x21, #0x90]
100b5d830:     	cmp	x8, #0x0
100b5d834:     	csel	x9, x21, x8, eq
100b5d838:     	ldr	x8, [x9, #0x58]
100b5d83c:     	ldrh	w8, [x8, #0xe4]
100b5d840:     	tbnz	w8, #0x4, 0x100b5d85c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x550>
100b5d844:     	ldrh	w9, [x9, #0xa0]
100b5d848:     	tbnz	w9, #0x3, 0x100b5d85c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x550>
100b5d84c:     	tbnz	w8, #0x5, 0x100b5d8d4 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x5c8>
100b5d850:     	tbz	w8, #0x6, 0x100b5d7a4 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x498>
100b5d854:     	mov	w21, #0x2               ; =2
100b5d858:     	b	0x100b5d860 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x554>
100b5d85c:     	mov	w21, #0x3               ; =3
100b5d860:     	mov	x0, x19
100b5d864:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5d868:     	mov	x22, x0
100b5d86c:     	mov	x0, x19
100b5d870:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b5d874:     	cbz	x22, 0x100b5d8b4 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x5a8>
100b5d878:     	ldrh	w8, [x22, #0xc0]
100b5d87c:     	mov	w9, #0x1                ; =1
100b5d880:     	lsl	w9, w9, w8
100b5d884:     	mov	w10, #0x9802            ; =38914
100b5d888:     	tst	w9, w10
100b5d88c:     	csinc	w21, w21, wzr, eq
100b5d890:     	cbnz	x8, 0x100b5d8b4 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x5a8>
100b5d894:     	add	x22, x22, #0xa8
100b5d898:     	add	x1, x20, #0x14
100b5d89c:     	mov	x23, x0
100b5d8a0:     	mov	x0, x22
100b5d8a4:     	bl	0x1007fc884 <__Z19BLI_rcti_isect_pt_vPK4rctiPKi>
100b5d8a8:     	mov	x8, x0
100b5d8ac:     	mov	x0, x23
100b5d8b0:     	tbnz	w8, #0x0, 0x100b5d7ac <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x4a0>
100b5d8b4:     	cbz	x0, 0x100b5d7a8 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x49c>
100b5d8b8:     	add	x22, x0, #0x38
100b5d8bc:     	add	x1, x20, #0x14
100b5d8c0:     	mov	x0, x22
100b5d8c4:     	bl	0x1007fc884 <__Z19BLI_rcti_isect_pt_vPK4rctiPKi>
100b5d8c8:     	cmp	w0, #0x0
100b5d8cc:     	csel	x22, x22, xzr, ne
100b5d8d0:     	b	0x100b5d7ac <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x4a0>
100b5d8d4:     	mov	w21, #0x1               ; =1
100b5d8d8:     	b	0x100b5d860 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x554>
100b5d8dc:     	mov	x19, x0
100b5d8e0:     	ldrsb	w8, [sp, #0x37]
100b5d8e4:     	tbz	w8, #0x1f, 0x100b5d8f0 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch+0x5e4>
100b5d8e8:     	ldr	x0, [sp, #0x20]
100b5d8ec:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b5d8f0:     	mov	x0, x19
100b5d8f4:     	bl	0x104b72c1c <_zlibVersion+0x104b72c1c>
