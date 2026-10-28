
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b524d0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch>:
100b524d0:     	sub	sp, sp, #0x120
100b524d4:     	stp	x28, x27, [sp, #0xc0]
100b524d8:     	stp	x26, x25, [sp, #0xd0]
100b524dc:     	stp	x24, x23, [sp, #0xe0]
100b524e0:     	stp	x22, x21, [sp, #0xf0]
100b524e4:     	stp	x20, x19, [sp, #0x100]
100b524e8:     	stp	x29, x30, [sp, #0x110]
100b524ec:     	add	x29, sp, #0x110
100b524f0:     	mov	x24, x7
100b524f4:     	mov	x27, x6
100b524f8:     	mov	x25, x4
100b524fc:     	mov	x20, x3
100b52500:     	mov	x21, x2
100b52504:     	mov	x19, x0
100b52508:     	adrp	x8, 0x106369000 <_zlibVersion+0x106369000>
100b5250c:     	ldr	x8, [x8, #0x7f8]
100b52510:     	ldr	x8, [x8]
100b52514:     	stur	x8, [x29, #-0x60]
100b52518:     	stp	xzr, xzr, [sp, #0x38]
100b5251c:     	cbz	x3, 0x100b52580 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0xb0>
100b52520:     	ldrh	w8, [x20, #0x10]
100b52524:     	cmp	w8, #0x208
100b52528:     	b.ne	0x100b52580 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0xb0>
100b5252c:     	mov	x22, x1
100b52530:     	mov	x23, x5
100b52534:     	str	xzr, [sp, #0x50]
100b52538:     	mov	x0, x19
100b5253c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b52540:     	mov	x1, x0
100b52544:     	add	x3, sp, #0x50
100b52548:     	add	x4, sp, #0x40
100b5254c:     	add	x5, sp, #0x38
100b52550:     	mov	x0, x19
100b52554:     	mov	x2, x20
100b52558:     	bl	0x100b571d4 <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion>
100b5255c:     	ldr	x8, [sp, #0x50]
100b52560:     	cmp	x8, x21
100b52564:     	csel	w8, wzr, w0, ne
100b52568:     	cmp	w8, #0x1
100b5256c:     	b.ne	0x100b526f4 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x224>
100b52570:     	mov	w28, #0x1               ; =1
100b52574:     	mov	x5, x23
100b52578:     	mov	x1, x22
100b5257c:     	b	0x100b52584 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0xb4>
100b52580:     	mov	w28, #0x0               ; =0
100b52584:     	ldr	w8, [x21, #0x10]
100b52588:     	cmp	w8, #0x3
100b5258c:     	b.ne	0x100b525e8 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x118>
100b52590:     	ldr	x23, [x21, #0x20]
100b52594:     	cbz	x23, 0x100b525e8 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x118>
100b52598:     	ldr	x24, [x23, #0x58]
100b5259c:     	cbz	w27, 0x100b526fc <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x22c>
100b525a0:     	mov	w26, #0x0               ; =0
100b525a4:     	mov	x22, x1
100b525a8:     	cbz	x20, 0x100b52704 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x234>
100b525ac:     	ldr	x8, [x21, #0x50]
100b525b0:     	cbz	x8, 0x100b52704 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x234>
100b525b4:     	ldrh	w8, [x20, #0x10]
100b525b8:     	cbnz	w8, 0x100b52700 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x230>
100b525bc:     	mov	x0, x19
100b525c0:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b525c4:     	mov	x1, x0
100b525c8:     	mov	x0, x19
100b525cc:     	mov	x2, x20
100b525d0:     	mov	x3, x21
100b525d4:     	mov	w4, #0x1                ; =1
100b525d8:     	bl	0x100b5214c <__ZL32wm_ipad_pencil_paint_modal_admitP8bContextP8wmWindowPK7wmEventPK17wmEventHandler_Opb>
100b525dc:     	cmp	w0, #0x2
100b525e0:     	cset	w26, eq
100b525e4:     	b	0x100b52704 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x234>
100b525e8:     	mov	x0, x5
100b525ec:     	mov	w1, #0x0                ; =0
100b525f0:     	bl	0x100b7d198 <__Z20WM_operatortype_findPKcb>
100b525f4:     	cbz	x0, 0x100b52814 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x344>
100b525f8:     	mov	x22, x0
100b525fc:     	mov	x0, x19
100b52600:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b52604:     	ldr	x8, [x0, #0x5c0]
100b52608:     	ldrb	w8, [x8, #0x10]
100b5260c:     	cmp	w8, #0x1
100b52610:     	b.ne	0x100b5261c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x14c>
100b52614:     	ldrh	w8, [x22, #0xe4]
100b52618:     	tbz	w8, #0x9, 0x100b52814 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x344>
100b5261c:     	ldr	w8, [x20, #0x30]
100b52620:     	cmp	w8, #0x1
100b52624:     	b.ne	0x100b526ac <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x1dc>
100b52628:     	ldr	x0, [x22, #0x8]
100b5262c:     	adrp	x1, 0x104bd4000 <__ZL3hex+0x45cd>
100b52630:     	add	x1, x1, #0xd12
100b52634:     	bl	0x10081a9d8 <__Z14BLI_strcasestrPKcS0_>
100b52638:     	cbz	x0, 0x100b526ac <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x1dc>
100b5263c:     	mov	x0, x19
100b52640:     	bl	0x100b90d58 <__Z30WM_toolsystem_ref_from_contextPK8bContext>
100b52644:     	cbz	x0, 0x100b526ac <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x1dc>
100b52648:     	mov	x23, x0
100b5264c:     	adrp	x1, 0x104bd4000 <__ZL3hex+0x45cd>
100b52650:     	add	x1, x1, #0xd19
100b52654:     	add	x0, x0, #0x10
100b52658:     	bl	0x10081a9d8 <__Z14BLI_strcasestrPKcS0_>
100b5265c:     	cbnz	x0, 0x100b52674 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x1a4>
100b52660:     	adrp	x1, 0x104bd4000 <__ZL3hex+0x45cd>
100b52664:     	add	x1, x1, #0xd22
100b52668:     	add	x0, x23, #0x10
100b5266c:     	bl	0x10081a9d8 <__Z14BLI_strcasestrPKcS0_>
100b52670:     	cbz	x0, 0x100b526ac <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x1dc>
100b52674:     	adrp	x0, 0x104bd4000 <__ZL3hex+0x45cd>
100b52678:     	add	x0, x0, #0xd2a
100b5267c:     	mov	w1, #0x0                ; =0
100b52680:     	bl	0x100b7d198 <__Z20WM_operatortype_findPKcb>
100b52684:     	cbz	x0, 0x100b52c00 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x730>
100b52688:     	adrp	x1, 0x104bd4000 <__ZL3hex+0x45cd>
100b5268c:     	add	x1, x1, #0xd2a
100b52690:     	mov	x0, x19
100b52694:     	mov	w2, #0x0                ; =0
100b52698:     	mov	x3, #0x0                ; =0
100b5269c:     	mov	x4, x20
100b526a0:     	bl	0x100b4f3ec <__Z21WM_operator_name_callP8bContextPKcN7blender2wm13OpCallContextEP10PointerRNAPK7wmEvent>
100b526a4:     	mov	w0, #0x1                ; =1
100b526a8:     	b	0x100b52820 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x350>
100b526ac:     	add	x8, sp, #0x50
100b526b0:     	add	x26, x8, #0x30
100b526b4:     	movi.16b	v0, #0x0
100b526b8:     	str	xzr, [sp, #0xa0]
100b526bc:     	stp	q0, q0, [sp, #0x80]
100b526c0:     	stp	q0, q0, [sp, #0x60]
100b526c4:     	str	q0, [sp, #0x50]
100b526c8:     	add	x8, x8, #0x50
100b526cc:     	stp	x26, x26, [sp, #0x68]
100b526d0:     	str	x8, [sp, #0x78]
100b526d4:     	ldr	w8, [x21, #0x10]
100b526d8:     	cmp	w8, #0x1
100b526dc:     	b.eq	0x100b5279c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x2cc>
100b526e0:     	cmp	w8, #0x5
100b526e4:     	b.ne	0x100b527b0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x2e0>
100b526e8:     	ldr	x23, [x21, #0x48]
100b526ec:     	cbnz	x23, 0x100b52934 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x464>
100b526f0:     	b	0x100b527b4 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x2e4>
100b526f4:     	mov	w0, #0x3                ; =3
100b526f8:     	b	0x100b52820 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x350>
100b526fc:     	mov	x22, x1
100b52700:     	mov	w26, #0x0               ; =0
100b52704:     	mov	x0, x19
100b52708:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b5270c:     	ldr	x8, [x0, #0x5c0]
100b52710:     	ldrb	w8, [x8, #0x10]
100b52714:     	cmp	w8, #0x1
100b52718:     	b.ne	0x100b52728 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x258>
100b5271c:     	ldrh	w8, [x24, #0xe4]
100b52720:     	orr	w8, w26, w8, lsr #9
100b52724:     	tbz	w8, #0x0, 0x100b52814 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x344>
100b52728:     	ldr	x8, [x24, #0x48]
100b5272c:     	cbz	x8, 0x100b527bc <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x2ec>
100b52730:     	str	x22, [sp, #0x18]
100b52734:     	mov	x0, x19
100b52738:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b5273c:     	mov	x22, x0
100b52740:     	mov	x0, x19
100b52744:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b52748:     	str	x0, [sp, #0x30]
100b5274c:     	mov	x0, x19
100b52750:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b52754:     	mov	x25, x0
100b52758:     	mov	x0, x19
100b5275c:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b52760:     	stp	x0, x25, [sp, #0x20]
100b52764:     	tbz	w28, #0x0, 0x100b52858 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x388>
100b52768:     	ldr	x1, [sp, #0x40]
100b5276c:     	mov	x0, x19
100b52770:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b52774:     	ldr	x1, [sp, #0x38]
100b52778:     	mov	x0, x19
100b5277c:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b52780:     	mov	x25, x21
100b52784:     	ldr	x8, [x25, #0x50]!
100b52788:     	cbnz	x8, 0x100b52864 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x394>
100b5278c:     	tbnz	w27, #0x0, 0x100b52864 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x394>
100b52790:     	mov	w8, #0x0                ; =0
100b52794:     	mov	x26, x22
100b52798:     	b	0x100b52a4c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x57c>
100b5279c:     	ldr	x0, [x21, #0x20]
100b527a0:     	bl	0x100b40a84 <__Z25wm_gizmomap_highlight_getP10wmGizmoMap>
100b527a4:     	cbz	x0, 0x100b527b0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x2e0>
100b527a8:     	ldrb	w8, [x0, #0x49]
100b527ac:     	tbnz	w8, #0x2, 0x100b52924 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x454>
100b527b0:     	mov	x23, #0x0               ; =0
100b527b4:     	mov	w21, #0x1               ; =1
100b527b8:     	b	0x100b52970 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x4a0>
100b527bc:     	adrp	x19, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b527c0:     	add	x19, x19, #0x2a0
100b527c4:     	ldr	x8, [x19]
100b527c8:     	ldr	x0, [x8, #0x8]
100b527cc:     	cbnz	x0, 0x100b527e0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x310>
100b527d0:     	mov	x0, x8
100b527d4:     	bl	0x100ae3834 <__Z15CLG_logref_initP10CLG_LogRef>
100b527d8:     	ldr	x8, [x19]
100b527dc:     	ldr	x0, [x8, #0x8]
100b527e0:     	ldr	w8, [x0, #0x50]
100b527e4:     	cmp	w8, #0x1
100b527e8:     	b.lt	0x100b52814 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x344>
100b527ec:     	add	x8, x23, #0x10
100b527f0:     	adrp	x2, 0x104bd4000 <__ZL3hex+0x45cd>
100b527f4:     	add	x2, x2, #0xcaa
100b527f8:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b527fc:     	add	x3, x3, #0xce6
100b52800:     	adrp	x4, 0x104bd4000 <__ZL3hex+0x45cd>
100b52804:     	add	x4, x4, #0xcff
100b52808:     	str	x8, [sp]
100b5280c:     	mov	w1, #0x1                ; =1
100b52810:     	bl	0x100ae2b58 <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b52814:     	mov	w27, #0x8               ; =8
100b52818:     	mov	w8, #0x1                ; =1
100b5281c:     	bic	w0, w8, w27, lsr #3
100b52820:     	ldur	x8, [x29, #-0x60]
100b52824:     	adrp	x9, 0x106369000 <_zlibVersion+0x106369000>
100b52828:     	ldr	x9, [x9, #0x7f8]
100b5282c:     	ldr	x9, [x9]
100b52830:     	cmp	x9, x8
100b52834:     	b.ne	0x100b52d3c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x86c>
100b52838:     	ldp	x29, x30, [sp, #0x110]
100b5283c:     	ldp	x20, x19, [sp, #0x100]
100b52840:     	ldp	x22, x21, [sp, #0xf0]
100b52844:     	ldp	x24, x23, [sp, #0xe0]
100b52848:     	ldp	x26, x25, [sp, #0xd0]
100b5284c:     	ldp	x28, x27, [sp, #0xc0]
100b52850:     	add	sp, sp, #0x120
100b52854:     	ret
100b52858:     	cbz	w27, 0x100b52878 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x3a8>
100b5285c:     	add	x25, x21, #0x50
100b52860:     	b	0x100b52868 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x398>
100b52864:     	cbz	w27, 0x100b528bc <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x3ec>
100b52868:     	cmp	w26, #0x0
100b5286c:     	mov	w8, #0x1                ; =1
100b52870:     	cinc	w0, w8, ne
100b52874:     	b	0x100b528d4 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x404>
100b52878:     	stp	xzr, xzr, [sp, #0x48]
100b5287c:     	add	x3, sp, #0x50
100b52880:     	add	x4, sp, #0x48
100b52884:     	mov	x0, x19
100b52888:     	mov	x1, x21
100b5288c:     	mov	x2, x20
100b52890:     	bl	0x100b57f7c <__ZL34wm_handler_op_context_get_if_validP8bContextP17wmEventHandler_OpPK7wmEventPP7ScrAreaPP7ARegion>
100b52894:     	mov	x26, x22
100b52898:     	ldr	x1, [sp, #0x50]
100b5289c:     	mov	x0, x19
100b528a0:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b528a4:     	ldr	x1, [sp, #0x48]
100b528a8:     	mov	x0, x19
100b528ac:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b528b0:     	mov	x25, x21
100b528b4:     	ldr	x8, [x25, #0x50]!
100b528b8:     	cbz	x8, 0x100b52a4c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x57c>
100b528bc:     	mov	x0, x19
100b528c0:     	ldr	x1, [sp, #0x30]
100b528c4:     	mov	x2, x20
100b528c8:     	mov	x3, x21
100b528cc:     	mov	w4, #0x0                ; =0
100b528d0:     	bl	0x100b5214c <__ZL32wm_ipad_pencil_paint_modal_admitP8bContextP8wmWindowPK7wmEventPK17wmEventHandler_Opb>
100b528d4:     	and	w9, w0, #0xff
100b528d8:     	cmp	w9, #0x2
100b528dc:     	csel	w8, wzr, w27, eq
100b528e0:     	cmp	w9, #0x1
100b528e4:     	b.eq	0x100b52904 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x434>
100b528e8:     	tbnz	w8, #0x0, 0x100b52904 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x434>
100b528ec:     	mov	x26, x22
100b528f0:     	and	w8, w0, #0xff
100b528f4:     	cmp	w8, #0x2
100b528f8:     	b.ne	0x100b52a34 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x564>
100b528fc:     	mov	w8, #0x1                ; =1
100b52900:     	b	0x100b52a4c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x57c>
100b52904:     	mov	x0, x19
100b52908:     	ldr	x1, [sp, #0x28]
100b5290c:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b52910:     	mov	x0, x19
100b52914:     	ldr	x1, [sp, #0x20]
100b52918:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b5291c:     	mov	w0, #0x3                ; =3
100b52920:     	b	0x100b52820 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x350>
100b52924:     	mov	x0, x19
100b52928:     	bl	0x100b90d58 <__Z30WM_toolsystem_ref_from_contextPK8bContext>
100b5292c:     	mov	x23, x0
100b52930:     	cbz	x23, 0x100b527b4 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x2e4>
100b52934:     	add	x1, sp, #0x50
100b52938:     	mov	x0, x23
100b5293c:     	mov	x2, x25
100b52940:     	mov	x3, x22
100b52944:     	bl	0x100b93b74 <__Z44WM_toolsystem_ref_properties_init_for_keymapP8bToolRefP10PointerRNAS2_P14wmOperatorType>
100b52948:     	ldr	w8, [x21, #0x10]
100b5294c:     	cmp	w8, #0x5
100b52950:     	cset	w4, eq
100b52954:     	add	x25, sp, #0x50
100b52958:     	add	x2, sp, #0x50
100b5295c:     	mov	x0, x19
100b52960:     	mov	x1, x23
100b52964:     	mov	x3, x22
100b52968:     	bl	0x100b9388c <__Z42WM_toolsystem_ref_properties_for_transformPK8bContextP8bToolRefP10PointerRNAPK14wmOperatorTypeb>
100b5296c:     	mov	w21, #0x0               ; =0
100b52970:     	mov	x0, x19
100b52974:     	mov	x1, x22
100b52978:     	mov	x2, x20
100b5297c:     	mov	x3, x25
100b52980:     	mov	x4, #0x0                ; =0
100b52984:     	mov	w5, #0x0                ; =0
100b52988:     	mov	x6, x21
100b5298c:     	mov	x7, x24
100b52990:     	bl	0x100b5d30c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch>
100b52994:     	mov	x27, x0
100b52998:     	tbnz	w21, #0x0, 0x100b52a20 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x550>
100b5299c:     	add	x0, sp, #0x50
100b529a0:     	bl	0x100b80c48 <__Z27WM_operator_properties_freeP10PointerRNA>
100b529a4:     	tbz	w27, #0x2, 0x100b52a20 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x550>
100b529a8:     	ldr	x20, [x23, #0xe0]
100b529ac:     	ldrb	w8, [x20, #0x44]!
100b529b0:     	cbz	w8, 0x100b52a20 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x550>
100b529b4:     	mov	x0, x20
100b529b8:     	bl	0x104b76c30 <_zlibVersion+0x104b76c30>
100b529bc:     	mov	x1, x0
100b529c0:     	mov	x0, x20
100b529c4:     	mov	w2, #0x0                ; =0
100b529c8:     	bl	0x100b3e568 <__Z22WM_gizmogrouptype_findN7blender9StringRefEb>
100b529cc:     	mov	x20, x0
100b529d0:     	cbz	x0, 0x100b52a20 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x550>
100b529d4:     	ldrb	w8, [x20, #0x100]
100b529d8:     	tbz	w8, #0x7, 0x100b52a20 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x550>
100b529dc:     	mov	x0, x19
100b529e0:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b529e4:     	mov	x21, x0
100b529e8:     	cbz	x0, 0x100b52a20 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x550>
100b529ec:     	add	x0, x20, #0x108
100b529f0:     	bl	0x100b3f6bc <__Z22WM_gizmomaptype_ensurePK21wmGizmoMapType_Params>
100b529f4:     	mov	x22, x0
100b529f8:     	mov	x0, x20
100b529fc:     	mov	x1, x22
100b52a00:     	bl	0x100b3dff4 <__Z33WM_gizmo_group_type_ensure_ptr_exP16wmGizmoGroupTypeP14wmGizmoMapType>
100b52a04:     	mov	x0, x22
100b52a08:     	mov	x1, x20
100b52a0c:     	mov	x2, x21
100b52a10:     	bl	0x100b3dd4c <__Z46WM_gizmomaptype_group_init_runtime_with_regionP14wmGizmoMapTypeP16wmGizmoGroupTypeP7ARegion>
100b52a14:     	mov	x1, x0
100b52a18:     	mov	x0, x19
100b52a1c:     	bl	0x100b3ce14 <__Z25WM_gizmogroup_ensure_initPK8bContextP12wmGizmoGroup>
100b52a20:     	ldr	x0, [sp, #0x68]
100b52a24:     	cmp	x0, x26
100b52a28:     	b.eq	0x100b52d1c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x84c>
100b52a2c:     	bl	0x100ae4298 <_MEM_freeN>
100b52a30:     	b	0x100b52d1c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x84c>
100b52a34:     	mov	w8, #0x0                ; =0
100b52a38:     	cbz	x20, 0x100b52a4c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x57c>
100b52a3c:     	tst	w0, #0xff
100b52a40:     	b.ne	0x100b52a4c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x57c>
100b52a44:     	ldrb	w8, [x20, #0x7c]
100b52a48:     	ubfx	w8, w8, #6, #1
100b52a4c:     	ldr	x9, [x26, #0x5c0]
100b52a50:     	ldr	x10, [x9, #0xe0]
100b52a54:     	cbz	x10, 0x100b52a60 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x590>
100b52a58:     	ldr	x22, [x10, #0x20]
100b52a5c:     	b	0x100b52a64 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x594>
100b52a60:     	mov	x22, #-0x1              ; =-1
100b52a64:     	ldr	x9, [x9, #0x70]
100b52a68:     	cmp	x9, #0x0
100b52a6c:     	csinv	x10, x9, xzr, ne
100b52a70:     	ldrh	w9, [x24, #0xe4]
100b52a74:     	tbz	w9, #0x1, 0x100b52a84 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x5b4>
100b52a78:     	ldrh	w9, [x26, #0x1b4]
100b52a7c:     	add	w9, w9, #0x1
100b52a80:     	strh	w9, [x26, #0x1b4]
100b52a84:     	str	x10, [sp, #0x10]
100b52a88:     	cbz	w8, 0x100b52adc <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x60c>
100b52a8c:     	ldr	x8, [x25]
100b52a90:     	ldr	x28, [sp, #0x30]
100b52a94:     	cbz	x8, 0x100b52ab8 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x5e8>
100b52a98:     	cbz	x28, 0x100b52ab8 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x5e8>
100b52a9c:     	ldr	x9, [x28, #0x168]
100b52aa0:     	cbz	x9, 0x100b52ab8 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x5e8>
100b52aa4:     	ldr	x10, [x21, #0x58]
100b52aa8:     	cbz	x10, 0x100b52ab8 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x5e8>
100b52aac:     	str	x8, [x9, #0x40]
100b52ab0:     	ldr	x8, [x21, #0x58]
100b52ab4:     	str	x8, [x9, #0x48]
100b52ab8:     	ldr	x8, [x24, #0x40]
100b52abc:     	mov	x0, x19
100b52ac0:     	mov	x1, x23
100b52ac4:     	blr	x8
100b52ac8:     	mov	w25, #0x0               ; =0
100b52acc:     	mov	w27, #0xa               ; =10
100b52ad0:     	ldrh	w8, [x24, #0xe4]
100b52ad4:     	tbnz	w8, #0x1, 0x100b52b54 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x684>
100b52ad8:     	b	0x100b52b70 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x6a0>
100b52adc:     	mov	x0, x19
100b52ae0:     	mov	x1, x20
100b52ae4:     	bl	0x100b57188 <__ZL18wm_region_mouse_coP8bContextP7wmEvent>
100b52ae8:     	cbz	w28, 0x100b52b18 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x648>
100b52aec:     	ldr	x8, [x20, #0x88]
100b52af0:     	ldrb	w8, [x8, #0xb8]
100b52af4:     	cmp	w8, #0x1
100b52af8:     	cset	w3, eq
100b52afc:     	mov	x0, x19
100b52b00:     	mov	x1, x23
100b52b04:     	mov	x2, x20
100b52b08:     	bl	0x101c38918 <__Z26ED_mesh_knife_modal_actionP8bContextP10wmOperatorPK7wmEventb>
100b52b0c:     	mov	x27, x0
100b52b10:     	mov	w25, #0x0               ; =0
100b52b14:     	b	0x100b52b48 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x678>
100b52b18:     	add	x3, sp, #0x50
100b52b1c:     	mov	x0, x19
100b52b20:     	mov	x1, x23
100b52b24:     	mov	x2, x20
100b52b28:     	bl	0x100b5df5c <__ZL26wm_event_modalkeymap_beginPK8bContextP10wmOperatorP7wmEventP21wmEvent_ModalMapStore>
100b52b2c:     	ldr	x8, [x24, #0x48]
100b52b30:     	mov	x0, x19
100b52b34:     	mov	x1, x23
100b52b38:     	mov	x2, x20
100b52b3c:     	blr	x8
100b52b40:     	mov	x27, x0
100b52b44:     	mov	w25, #0x1               ; =1
100b52b48:     	ldr	x28, [sp, #0x30]
100b52b4c:     	ldrh	w8, [x24, #0xe4]
100b52b50:     	tbz	w8, #0x1, 0x100b52b70 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x6a0>
100b52b54:     	mov	x0, x19
100b52b58:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b52b5c:     	cmp	x0, x26
100b52b60:     	b.ne	0x100b52b70 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x6a0>
100b52b64:     	ldrh	w8, [x26, #0x1b4]
100b52b68:     	sub	w8, w8, #0x1
100b52b6c:     	strh	w8, [x26, #0x1b4]
100b52b70:     	mov	x0, x19
100b52b74:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b52b78:     	cmp	x0, x28
100b52b7c:     	b.ne	0x100b52d1c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x84c>
100b52b80:     	cbz	w25, 0x100b52bb8 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x6e8>
100b52b84:     	ldrh	w8, [x20, #0x10]
100b52b88:     	mov	w9, #0x5022             ; =20514
100b52b8c:     	cmp	w8, w9
100b52b90:     	b.ne	0x100b52ba4 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x6d4>
100b52b94:     	ldr	w8, [x20, #0x90]
100b52b98:     	str	w8, [x20, #0x10]
100b52b9c:     	ldr	w8, [sp, #0x50]
100b52ba0:     	str	w8, [x20, #0x90]
100b52ba4:     	ldrb	w8, [sp, #0x54]
100b52ba8:     	cmp	w8, #0x1
100b52bac:     	b.ne	0x100b52bb8 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x6e8>
100b52bb0:     	mov	w8, #0x4                ; =4
100b52bb4:     	strh	w8, [x20, #0x12]
100b52bb8:     	ands	w24, w27, #0x6
100b52bbc:     	b.eq	0x100b52c08 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x738>
100b52bc0:     	mov	x0, x19
100b52bc4:     	mov	x1, x23
100b52bc8:     	mov	x2, x27
100b52bcc:     	mov	w3, #0x0                ; =0
100b52bd0:     	bl	0x100b5ce98 <__ZL19wm_operator_reportsP8bContextP10wmOperator16wmOperatorStatusb>
100b52bd4:     	ldr	x8, [x21, #0x20]
100b52bd8:     	ldr	x9, [x8, #0x90]
100b52bdc:     	cmp	x9, #0x0
100b52be0:     	csel	x8, x8, x9, eq
100b52be4:     	ldr	x8, [x8, #0x58]
100b52be8:     	ldr	x8, [x8, #0xb0]
100b52bec:     	ldr	x25, [sp, #0x28]
100b52bf0:     	cbz	x8, 0x100b52c34 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x764>
100b52bf4:     	mov	x0, x28
100b52bf8:     	bl	0x100b595d0 <__Z32WM_window_status_area_tag_redrawP8wmWindow>
100b52bfc:     	b	0x100b52c34 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x764>
100b52c00:     	mov	w0, #0x1                ; =1
100b52c04:     	b	0x100b52820 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x350>
100b52c08:     	ldr	x8, [x23, #0x78]
100b52c0c:     	ldr	x8, [x8]
100b52c10:     	ldr	x25, [sp, #0x28]
100b52c14:     	cbz	x8, 0x100b52c34 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x764>
100b52c18:     	mov	x0, x19
100b52c1c:     	mov	w1, #0x10020000         ; =268566528
100b52c20:     	mov	x2, #0x0                ; =0
100b52c24:     	bl	0x100b4dc08 <__Z21WM_event_add_notifierPK8bContextjPv>
100b52c28:     	ldr	x1, [x23, #0x78]
100b52c2c:     	mov	x0, x26
100b52c30:     	bl	0x100b4e8f8 <__Z28WM_reports_from_reports_moveP15wmWindowManagerP10ReportList>
100b52c34:     	tbnz	w27, #0x2, 0x100b52c48 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x778>
100b52c38:     	cbz	w24, 0x100b52c98 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x7c8>
100b52c3c:     	mov	x0, x23
100b52c40:     	bl	0x100b4305c <__Z16WM_operator_freeP10wmOperator>
100b52c44:     	b	0x100b52c94 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x7c4>
100b52c48:     	ldr	x8, [x26, #0x5c0]
100b52c4c:     	ldr	x9, [x8, #0xe0]
100b52c50:     	cbz	x9, 0x100b52c5c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x78c>
100b52c54:     	ldr	x9, [x9, #0x20]
100b52c58:     	b	0x100b52c60 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x790>
100b52c5c:     	mov	x9, #-0x1               ; =-1
100b52c60:     	ldr	x10, [sp, #0x10]
100b52c64:     	cmp	x22, x9
100b52c68:     	cset	w4, ne
100b52c6c:     	ldr	x8, [x8, #0x70]
100b52c70:     	cmp	x8, #0x0
100b52c74:     	csinv	x8, x8, xzr, ne
100b52c78:     	cmp	x10, x8
100b52c7c:     	cset	w5, ne
100b52c80:     	mov	x0, x19
100b52c84:     	mov	x1, x23
100b52c88:     	mov	w2, #0x0                ; =0
100b52c8c:     	mov	w3, #0x1                ; =1
100b52c90:     	bl	0x100b5d0f0 <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb>
100b52c94:     	str	xzr, [x21, #0x20]
100b52c98:     	ldr	x23, [sp, #0x20]
100b52c9c:     	tbnz	w27, #0x3, 0x100b52cbc <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x7ec>
100b52ca0:     	ldrh	w8, [x20, #0x10]
100b52ca4:     	and	w9, w8, #0xfff0
100b52ca8:     	cmp	w8, #0x104
100b52cac:     	mov	w8, #0x110              ; =272
100b52cb0:     	ccmp	w9, w8, #0x4, ne
100b52cb4:     	csel	x25, x25, xzr, eq
100b52cb8:     	csel	x23, x23, xzr, eq
100b52cbc:     	mov	x0, x19
100b52cc0:     	mov	x1, x25
100b52cc4:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b52cc8:     	mov	x0, x19
100b52ccc:     	mov	x1, x23
100b52cd0:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b52cd4:     	mov	x0, x19
100b52cd8:     	mov	x1, x20
100b52cdc:     	mov	x2, x21
100b52ce0:     	bl	0x100b4038c <__Z33wm_gizmomaps_handled_modal_updateP8bContextP7wmEventP17wmEventHandler_Op>
100b52ce4:     	cbz	w24, 0x100b52d1c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x84c>
100b52ce8:     	mov	x0, x19
100b52cec:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b52cf0:     	mov	x1, #0x0                ; =0
100b52cf4:     	bl	0x100b447ec <__Z22WM_cursor_grab_disableP8wmWindowPKi>
100b52cf8:     	ldr	x0, [sp, #0x18]
100b52cfc:     	mov	x1, x21
100b52d00:     	bl	0x10078fea0 <__Z11BLI_remlinkP8ListBasePv>
100b52d04:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b52d08:     	add	x8, x8, #0x710
100b52d0c:     	ldr	x8, [x8]
100b52d10:     	mov	x0, x21
100b52d14:     	mov	w1, #0x0                ; =0
100b52d18:     	blr	x8
100b52d1c:     	cmp	w27, #0x9
100b52d20:     	b.eq	0x100b52d34 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x864>
100b52d24:     	cmp	w27, #0xc
100b52d28:     	b.ne	0x100b52818 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x348>
100b52d2c:     	mov	w0, #0x2                ; =2
100b52d30:     	b	0x100b52820 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x350>
100b52d34:     	mov	w0, #0x5                ; =5
100b52d38:     	b	0x100b52820 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x350>
100b52d3c:     	bl	0x104b7534c <_zlibVersion+0x104b7534c>
100b52d40:     	b	0x100b52d70 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x8a0>
100b52d44:     	b	0x100b52d70 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x8a0>
100b52d48:     	b	0x100b52d70 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x8a0>
100b52d4c:     	b	0x100b52d70 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x8a0>
100b52d50:     	b	0x100b52d70 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x8a0>
100b52d54:     	mov	x19, x0
100b52d58:     	cbz	w1, 0x100b52d68 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch+0x898>
100b52d5c:     	mov	x0, x19
100b52d60:     	bl	0x1000144bc <___clang_call_terminate>
100b52d64:     	mov	x19, x0
100b52d68:     	mov	x0, x19
100b52d6c:     	bl	0x104b72c1c <_zlibVersion+0x104b72c1c>
100b52d70:     	mov	x19, x0
100b52d74:     	add	x0, sp, #0x50
100b52d78:     	bl	0x100013e10 <__ZN7blender2ed12sculpt_paint18FillToolTargetInfoD1Ev>
100b52d7c:     	mov	x0, x19
100b52d80:     	bl	0x104b72c1c <_zlibVersion+0x104b72c1c>
