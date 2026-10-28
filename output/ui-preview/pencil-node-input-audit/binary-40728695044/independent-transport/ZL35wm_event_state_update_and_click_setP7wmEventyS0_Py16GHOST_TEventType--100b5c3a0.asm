
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b5c3a0 <__ZL35wm_event_state_update_and_click_setP7wmEventyS0_Py16GHOST_TEventType>:
100b5c3a0:     	sub	w8, w4, #0xf
100b5c3a4:     	ldrh	w9, [x2, #0x12]
100b5c3a8:     	strh	w9, [x2, #0x92]
100b5c3ac:     	strh	w9, [x0, #0x92]
100b5c3b0:     	ldrh	w9, [x2, #0x10]
100b5c3b4:     	strh	w9, [x2, #0x90]
100b5c3b8:     	strh	w9, [x0, #0x90]
100b5c3bc:     	ldrh	w9, [x0, #0x12]
100b5c3c0:     	strh	w9, [x2, #0x12]
100b5c3c4:     	ldrh	w9, [x0, #0x10]
100b5c3c8:     	strh	w9, [x2, #0x10]
100b5c3cc:     	cmp	w8, #0x1
100b5c3d0:     	b.hi	0x100b5c3dc <__ZL35wm_event_state_update_and_click_setP7wmEventyS0_Py16GHOST_TEventType+0x3c>
100b5c3d4:     	ldrb	w8, [x0, #0x2a]
100b5c3d8:     	strb	w8, [x2, #0x2a]
100b5c3dc:     	stp	x24, x23, [sp, #-0x40]!
100b5c3e0:     	stp	x22, x21, [sp, #0x10]
100b5c3e4:     	stp	x20, x19, [sp, #0x20]
100b5c3e8:     	stp	x29, x30, [sp, #0x30]
100b5c3ec:     	add	x29, sp, #0x30
100b5c3f0:     	ldr	w8, [x0, #0x7c]
100b5c3f4:     	and	w8, w8, #0x2
100b5c3f8:     	str	w8, [x2, #0x7c]
100b5c3fc:     	ldrh	w8, [x0, #0x10]
100b5c400:     	ldrh	w9, [x0, #0x90]
100b5c404:     	cmp	w8, w9
100b5c408:     	b.ne	0x100b5c504 <__ZL35wm_event_state_update_and_click_setP7wmEventyS0_Py16GHOST_TEventType+0x164>
100b5c40c:     	ldrh	w9, [x0, #0x92]
100b5c410:     	cmp	w9, #0x2
100b5c414:     	b.ne	0x100b5c504 <__ZL35wm_event_state_update_and_click_setP7wmEventyS0_Py16GHOST_TEventType+0x164>
100b5c418:     	ldrh	w9, [x0, #0x12]
100b5c41c:     	cmp	w9, #0x1
100b5c420:     	b.ne	0x100b5c53c <__ZL35wm_event_state_update_and_click_setP7wmEventyS0_Py16GHOST_TEventType+0x19c>
100b5c424:     	ldr	x20, [x3]
100b5c428:     	cmp	w8, #0x13
100b5c42c:     	b.hi	0x100b5c478 <__ZL35wm_event_state_update_and_click_setP7wmEventyS0_Py16GHOST_TEventType+0xd8>
100b5c430:     	mov	w9, #0x1                ; =1
100b5c434:     	lsl	w8, w9, w8
100b5c438:     	mov	w9, #0x18e              ; =398
100b5c43c:     	movk	w9, #0xc, lsl #16
100b5c440:     	tst	w8, w9
100b5c444:     	b.eq	0x100b5c478 <__ZL35wm_event_state_update_and_click_setP7wmEventyS0_Py16GHOST_TEventType+0xd8>
100b5c448:     	mov	x21, x1
100b5c44c:     	add	x1, x0, #0xa0
100b5c450:     	mov	x19, x0
100b5c454:     	mov	x22, x3
100b5c458:     	mov	x23, x2
100b5c45c:     	bl	0x100b4d4b4 <__Z18WM_event_drag_testPK7wmEventPKi>
100b5c460:     	mov	x2, x23
100b5c464:     	mov	x1, x21
100b5c468:     	mov	x3, x22
100b5c46c:     	mov	x8, x0
100b5c470:     	mov	x0, x19
100b5c474:     	tbnz	w8, #0x0, 0x100b5c504 <__ZL35wm_event_state_update_and_click_setP7wmEventyS0_Py16GHOST_TEventType+0x164>
100b5c478:     	sub	x8, x1, x20
100b5c47c:     	adrp	x9, 0x106d8c000 <_build_commit_date>
100b5c480:     	add	x9, x9, #0xe08
100b5c484:     	mov	w10, #0x261e            ; =9758
100b5c488:     	ldrsh	x9, [x9, x10]
100b5c48c:     	cmp	x8, x9
100b5c490:     	b.hs	0x100b5c504 <__ZL35wm_event_state_update_and_click_setP7wmEventyS0_Py16GHOST_TEventType+0x164>
100b5c494:     	adrp	x19, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b5c498:     	add	x19, x19, #0x2a0
100b5c49c:     	ldr	x9, [x19]
100b5c4a0:     	ldr	x8, [x9, #0x8]
100b5c4a4:     	cbnz	x8, 0x100b5c4c0 <__ZL35wm_event_state_update_and_click_setP7wmEventyS0_Py16GHOST_TEventType+0x120>
100b5c4a8:     	mov	x20, x0
100b5c4ac:     	mov	x0, x9
100b5c4b0:     	bl	0x100ae3834 <__Z15CLG_logref_initP10CLG_LogRef>
100b5c4b4:     	mov	x0, x20
100b5c4b8:     	ldr	x8, [x19]
100b5c4bc:     	ldr	x8, [x8, #0x8]
100b5c4c0:     	ldr	w9, [x8, #0x50]
100b5c4c4:     	cmp	w9, #0x4
100b5c4c8:     	b.lt	0x100b5c4f8 <__ZL35wm_event_state_update_and_click_setP7wmEventyS0_Py16GHOST_TEventType+0x158>
100b5c4cc:     	adrp	x2, 0x104bd5000 <__ZL3hex+0x55cd>
100b5c4d0:     	add	x2, x2, #0x654
100b5c4d4:     	adrp	x3, 0x104bd5000 <__ZL3hex+0x55cd>
100b5c4d8:     	add	x3, x3, #0x690
100b5c4dc:     	adrp	x4, 0x104bd5000 <__ZL3hex+0x55cd>
100b5c4e0:     	add	x4, x4, #0x6b7
100b5c4e4:     	mov	x19, x0
100b5c4e8:     	mov	x0, x8
100b5c4ec:     	mov	w1, #0x4                ; =4
100b5c4f0:     	bl	0x100ae2b58 <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b5c4f4:     	mov	x0, x19
100b5c4f8:     	mov	w8, #0x4                ; =4
100b5c4fc:     	strh	w8, [x0, #0x12]
100b5c500:     	b	0x100b5c53c <__ZL35wm_event_state_update_and_click_setP7wmEventyS0_Py16GHOST_TEventType+0x19c>
100b5c504:     	ldrh	w8, [x0, #0x12]
100b5c508:     	cmp	w8, #0x1
100b5c50c:     	b.ne	0x100b5c53c <__ZL35wm_event_state_update_and_click_setP7wmEventyS0_Py16GHOST_TEventType+0x19c>
100b5c510:     	ldrb	w8, [x0, #0x7c]
100b5c514:     	tbnz	w8, #0x1, 0x100b5c53c <__ZL35wm_event_state_update_and_click_setP7wmEventyS0_Py16GHOST_TEventType+0x19c>
100b5c518:     	ldrh	w8, [x2, #0x10]
100b5c51c:     	strh	w8, [x2, #0x9c]
100b5c520:     	ldrb	w8, [x2, #0x2a]
100b5c524:     	strb	w8, [x2, #0xa8]
100b5c528:     	ldrh	w8, [x2, #0x2c]
100b5c52c:     	strh	w8, [x2, #0xaa]
100b5c530:     	ldur	d0, [x2, #0x14]
100b5c534:     	str	d0, [x2, #0xa0]
100b5c538:     	str	x1, [x3]
100b5c53c:     	ldp	x29, x30, [sp, #0x30]
100b5c540:     	ldp	x20, x19, [sp, #0x20]
100b5c544:     	ldp	x22, x21, [sp, #0x10]
100b5c548:     	ldp	x24, x23, [sp], #0x40
100b5c54c:     	ret
