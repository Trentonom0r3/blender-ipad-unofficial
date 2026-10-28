
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b6035c <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb>:
100b6035c:     	sub	sp, sp, #0x70
100b60360:     	stp	x28, x27, [sp, #0x10]
100b60364:     	stp	x26, x25, [sp, #0x20]
100b60368:     	stp	x24, x23, [sp, #0x30]
100b6036c:     	stp	x22, x21, [sp, #0x40]
100b60370:     	stp	x20, x19, [sp, #0x50]
100b60374:     	stp	x29, x30, [sp, #0x60]
100b60378:     	add	x29, sp, #0x60
100b6037c:     	mov	x19, x7
100b60380:     	mov	x21, x6
100b60384:     	mov	x20, x5
100b60388:     	mov	x22, x4
100b6038c:     	mov	x23, x3
100b60390:     	mov	x24, x2
100b60394:     	mov	x25, x1
100b60398:     	mov	x26, x0
100b6039c:     	cbz	w6, 0x100b603dc <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x80>
100b603a0:     	add	x8, x20, #0x30
100b603a4:     	adrp	x9, 0x104bd5000 <__ZL3hex+0x55cd>
100b603a8:     	add	x9, x9, #0x2ba
100b603ac:     	stp	x9, x8, [sp]
100b603b0:     	adrp	x0, 0x104bd5000 <__ZL3hex+0x55cd>
100b603b4:     	add	x0, x0, #0xf7
100b603b8:     	bl	0x104b765dc <_zlibVersion+0x104b765dc>
100b603bc:     	mov	x0, x26
100b603c0:     	mov	x1, x20
100b603c4:     	bl	0x100b7546c <__Z14WM_keymap_pollP8bContextP8wmKeyMap>
100b603c8:     	tbz	w0, #0x0, 0x100b603fc <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0xa0>
100b603cc:     	adrp	x0, 0x104b95000 <_zlibVersion+0x104b95000>
100b603d0:     	add	x0, x0, #0xcae
100b603d4:     	bl	0x104b767c8 <_zlibVersion+0x104b767c8>
100b603d8:     	b	0x100b603ec <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x90>
100b603dc:     	mov	x0, x26
100b603e0:     	mov	x1, x20
100b603e4:     	bl	0x100b7546c <__Z14WM_keymap_pollP8bContextP8wmKeyMap>
100b603e8:     	tbz	w0, #0x0, 0x100b60408 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0xac>
100b603ec:     	ldr	x27, [x20, #0x10]
100b603f0:     	cbz	x27, 0x100b606b8 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x35c>
100b603f4:     	mov	w20, #0x0               ; =0
100b603f8:     	b	0x100b60470 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x114>
100b603fc:     	adrp	x0, 0x104bd5000 <__ZL3hex+0x55cd>
100b60400:     	add	x0, x0, #0x764
100b60404:     	bl	0x104b767c8 <_zlibVersion+0x104b767c8>
100b60408:     	mov	w20, #0x0               ; =0
100b6040c:     	mov	w8, #0x0                ; =0
100b60410:     	cbz	x19, 0x100b60418 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0xbc>
100b60414:     	strb	w8, [x19]
100b60418:     	mov	x0, x20
100b6041c:     	ldp	x29, x30, [sp, #0x60]
100b60420:     	ldp	x20, x19, [sp, #0x50]
100b60424:     	ldp	x22, x21, [sp, #0x40]
100b60428:     	ldp	x24, x23, [sp, #0x30]
100b6042c:     	ldp	x26, x25, [sp, #0x20]
100b60430:     	ldp	x28, x27, [sp, #0x10]
100b60434:     	add	sp, sp, #0x70
100b60438:     	ret
100b6043c:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b60440:     	add	x8, x8, #0x28
100b60444:     	ldrb	w8, [x8, #0xc40]
100b60448:     	adrp	x0, 0x104bd5000 <__ZL3hex+0x55cd>
100b6044c:     	add	x0, x0, #0x2fe
100b60450:     	tst	w8, #0x18
100b60454:     	b.eq	0x100b60468 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x10c>
100b60458:     	adrp	x8, 0x104bd5000 <__ZL3hex+0x55cd>
100b6045c:     	add	x8, x8, #0x2ba
100b60460:     	stp	x8, x28, [sp]
100b60464:     	bl	0x104b765dc <_zlibVersion+0x104b765dc>
100b60468:     	ldr	x27, [x27]
100b6046c:     	cbz	x27, 0x100b606bc <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x360>
100b60470:     	ldrb	w8, [x27, #0xac]
100b60474:     	tbnz	w8, #0x0, 0x100b60468 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x10c>
100b60478:     	tbz	w8, #0x4, 0x100b60484 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x128>
100b6047c:     	ldr	w8, [x25, #0x7c]
100b60480:     	tbnz	w8, #0x1, 0x100b60468 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x10c>
100b60484:     	ldrsh	w0, [x27, #0x9a]
100b60488:     	bl	0x100b4d62c <__Z20WM_userdef_event_mapi>
100b6048c:     	cmn	w0, #0x1
100b60490:     	b.eq	0x100b6050c <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x1b0>
100b60494:     	cmn	w0, #0x2
100b60498:     	b.ne	0x100b604d4 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x178>
100b6049c:     	ldrh	w9, [x25, #0x12]
100b604a0:     	ldrh	w8, [x25, #0x10]
100b604a4:     	cmp	w9, #0x1
100b604a8:     	b.ne	0x100b60504 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x1a8>
100b604ac:     	sub	w9, w8, #0x20
100b604b0:     	cmp	w9, #0xe0
100b604b4:     	b.lo	0x100b604c8 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x16c>
100b604b8:     	sub	w9, w8, #0x12c
100b604bc:     	and	w9, w9, #0xffff
100b604c0:     	cmp	w9, #0x17
100b604c4:     	b.hi	0x100b60504 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x1a8>
100b604c8:     	ldrb	w9, [x25, #0x24]
100b604cc:     	cbnz	w9, 0x100b60630 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x2d4>
100b604d0:     	b	0x100b60504 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x1a8>
100b604d4:     	and	w9, w0, #0xfffffffe
100b604d8:     	ldrh	w8, [x25, #0x10]
100b604dc:     	cmp	w9, #0x1a
100b604e0:     	b.ne	0x100b60504 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x1a8>
100b604e4:     	cmp	w8, #0x1
100b604e8:     	b.ne	0x100b60468 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x10c>
100b604ec:     	ldr	w8, [x25, #0x30]
100b604f0:     	cmp	w0, #0x1a
100b604f4:     	b.ne	0x100b606ac <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x350>
100b604f8:     	cmp	w8, #0x1
100b604fc:     	b.ne	0x100b60468 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x10c>
100b60500:     	b	0x100b6050c <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x1b0>
100b60504:     	cmp	w0, w8, sxth
100b60508:     	b.ne	0x100b60468 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x10c>
100b6050c:     	ldrsb	w8, [x27, #0x9c]
100b60510:     	cmn	w8, #0x1
100b60514:     	b.eq	0x100b60544 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x1e8>
100b60518:     	ldrh	w9, [x25, #0x12]
100b6051c:     	cmp	w9, w8, uxth
100b60520:     	b.ne	0x100b60468 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x10c>
100b60524:     	cmp	w8, #0x5
100b60528:     	b.ne	0x100b60544 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x1e8>
100b6052c:     	ldrb	w8, [x27, #0x9d]
100b60530:     	cmp	w8, #0xff
100b60534:     	b.eq	0x100b60544 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x1e8>
100b60538:     	ldrb	w9, [x25, #0x2b]
100b6053c:     	cmp	w8, w9
100b60540:     	b.ne	0x100b60468 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x10c>
100b60544:     	ldrb	w8, [x27, #0x9e]
100b60548:     	cmp	w8, #0xff
100b6054c:     	b.eq	0x100b60570 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x214>
100b60550:     	ldrb	w9, [x25, #0x2a]
100b60554:     	and	w9, w9, #0x1
100b60558:     	cmp	w9, w8
100b6055c:     	b.eq	0x100b60570 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x214>
100b60560:     	ldrh	w8, [x25, #0x10]
100b60564:     	and	w8, w8, #0xfffe
100b60568:     	cmp	w8, #0xd8
100b6056c:     	b.ne	0x100b60468 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x10c>
100b60570:     	ldrb	w8, [x27, #0x9f]
100b60574:     	cmp	w8, #0xff
100b60578:     	b.eq	0x100b605a0 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x244>
100b6057c:     	ldrb	w9, [x25, #0x2a]
100b60580:     	ubfx	w9, w9, #1, #1
100b60584:     	cmp	w9, w8
100b60588:     	b.eq	0x100b605a0 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x244>
100b6058c:     	ldrh	w8, [x25, #0x10]
100b60590:     	cmp	w8, #0xd7
100b60594:     	b.eq	0x100b605a0 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x244>
100b60598:     	cmp	w8, #0xd4
100b6059c:     	b.ne	0x100b60468 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x10c>
100b605a0:     	ldrb	w8, [x27, #0xa0]
100b605a4:     	cmp	w8, #0xff
100b605a8:     	b.eq	0x100b605cc <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x270>
100b605ac:     	ldrb	w9, [x25, #0x2a]
100b605b0:     	ubfx	w9, w9, #2, #1
100b605b4:     	cmp	w9, w8
100b605b8:     	b.eq	0x100b605cc <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x270>
100b605bc:     	ldrh	w8, [x25, #0x10]
100b605c0:     	sub	w8, w8, #0xd5
100b605c4:     	cmp	w8, #0x1
100b605c8:     	b.hi	0x100b60468 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x10c>
100b605cc:     	ldrb	w8, [x27, #0xa1]
100b605d0:     	cmp	w8, #0xff
100b605d4:     	b.eq	0x100b605f4 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x298>
100b605d8:     	ldrb	w9, [x25, #0x2a]
100b605dc:     	ubfx	w9, w9, #3, #1
100b605e0:     	cmp	w9, w8
100b605e4:     	b.eq	0x100b605f4 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x298>
100b605e8:     	ldrh	w8, [x25, #0x10]
100b605ec:     	cmp	w8, #0xac
100b605f0:     	b.ne	0x100b60468 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x10c>
100b605f4:     	ldrb	w8, [x27, #0xa2]
100b605f8:     	cmp	w8, #0xff
100b605fc:     	b.eq	0x100b6061c <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x2c0>
100b60600:     	ldrb	w9, [x25, #0x2a]
100b60604:     	ubfx	w9, w9, #4, #1
100b60608:     	cmp	w9, w8
100b6060c:     	b.eq	0x100b6061c <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x2c0>
100b60610:     	ldrh	w8, [x25, #0x10]
100b60614:     	cmp	w8, #0xb3
100b60618:     	b.ne	0x100b60468 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x10c>
100b6061c:     	ldrh	w8, [x27, #0xaa]
100b60620:     	cbz	w8, 0x100b60630 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x2d4>
100b60624:     	ldrh	w9, [x25, #0x2c]
100b60628:     	cmp	w9, w8
100b6062c:     	b.ne	0x100b60468 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x10c>
100b60630:     	cbz	w21, 0x100b60650 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x2f4>
100b60634:     	add	x9, x27, #0x10
100b60638:     	adrp	x8, 0x104bd5000 <__ZL3hex+0x55cd>
100b6063c:     	add	x8, x8, #0x2ba
100b60640:     	stp	x8, x9, [sp]
100b60644:     	adrp	x0, 0x104bd5000 <__ZL3hex+0x55cd>
100b60648:     	add	x0, x0, #0x2e3
100b6064c:     	bl	0x104b765dc <_zlibVersion+0x104b765dc>
100b60650:     	mov	x0, x26
100b60654:     	mov	x1, x22
100b60658:     	bl	0x1000b4b98 <__Z22CTX_wm_gizmo_group_setP8bContextP12wmGizmoGroup>
100b6065c:     	ldr	x4, [x27, #0xb0]
100b60660:     	add	x28, x27, #0x10
100b60664:     	mov	x0, x26
100b60668:     	mov	x1, x24
100b6066c:     	mov	x2, x23
100b60670:     	mov	x3, x25
100b60674:     	mov	x5, x28
100b60678:     	mov	w6, #0x0                ; =0
100b6067c:     	mov	w7, #0x0                ; =0
100b60680:     	bl	0x100b524d0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch>
100b60684:     	orr	w20, w0, w20
100b60688:     	mov	x0, x26
100b6068c:     	mov	x1, #0x0                ; =0
100b60690:     	bl	0x1000b4b98 <__Z22CTX_wm_gizmo_group_setP8bContextP12wmGizmoGroup>
100b60694:     	tbnz	w20, #0x0, 0x100b606c8 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x36c>
100b60698:     	tbnz	w20, #0x1, 0x100b6043c <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0xe0>
100b6069c:     	adrp	x0, 0x104bd5000 <__ZL3hex+0x55cd>
100b606a0:     	add	x0, x0, #0x325
100b606a4:     	cbnz	w21, 0x100b60458 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0xfc>
100b606a8:     	b	0x100b60468 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x10c>
100b606ac:     	cmp	w8, #0x2
100b606b0:     	b.ne	0x100b60468 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x10c>
100b606b4:     	b	0x100b6050c <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x1b0>
100b606b8:     	mov	w20, #0x0               ; =0
100b606bc:     	mov	w8, #0x1                ; =1
100b606c0:     	cbnz	x19, 0x100b60414 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0xb8>
100b606c4:     	b	0x100b60418 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0xbc>
100b606c8:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b606cc:     	add	x8, x8, #0x28
100b606d0:     	ldrb	w8, [x8, #0xc40]
100b606d4:     	tst	w8, #0x18
100b606d8:     	b.eq	0x100b606bc <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x360>
100b606dc:     	adrp	x8, 0x104bd5000 <__ZL3hex+0x55cd>
100b606e0:     	add	x8, x8, #0x2ba
100b606e4:     	stp	x8, x28, [sp]
100b606e8:     	adrp	x0, 0x104bd5000 <__ZL3hex+0x55cd>
100b606ec:     	add	x0, x0, #0x2fe
100b606f0:     	bl	0x104b765dc <_zlibVersion+0x104b765dc>
100b606f4:     	b	0x100b606bc <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb+0x360>
