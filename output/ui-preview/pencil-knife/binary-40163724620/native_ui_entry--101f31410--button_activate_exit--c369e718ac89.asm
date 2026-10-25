
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f31410 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb>:
101f31410:     	stp	x28, x27, [sp, #-0x60]!
101f31414:     	stp	x26, x25, [sp, #0x10]
101f31418:     	stp	x24, x23, [sp, #0x20]
101f3141c:     	stp	x22, x21, [sp, #0x30]
101f31420:     	stp	x20, x19, [sp, #0x40]
101f31424:     	stp	x29, x30, [sp, #0x50]
101f31428:     	add	x29, sp, #0x50
101f3142c:     	sub	sp, sp, #0x460
101f31430:     	mov	x25, x4
101f31434:     	mov	x24, x3
101f31438:     	mov	x23, x2
101f3143c:     	mov	x21, x1
101f31440:     	mov	x19, x0
101f31444:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
101f31448:     	ldr	x8, [x8, #0x7f0]
101f3144c:     	ldr	x8, [x8]
101f31450:     	stur	x8, [x29, #-0x60]
101f31454:     	ldr	x27, [x2, #0x8]
101f31458:     	ldr	x20, [x1, #0x420]
101f3145c:     	ldr	w8, [x20, #0x750]
101f31460:     	tbz	w8, #0x8, 0x101f31498 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x88>
101f31464:     	ldr	x9, [x21, #0x3b0]
101f31468:     	cbz	x9, 0x101f31498 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x88>
101f3146c:     	ldr	x26, [x9, #0x8]
101f31470:     	cbz	x26, 0x101f31498 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x88>
101f31474:     	tbnz	w8, #0x9, 0x101f31910 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x500>
101f31478:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f3147c:     	add	x1, x1, #0xa9c
101f31480:     	mov	x0, x26
101f31484:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f31488:     	cbz	w0, 0x101f31940 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x530>
101f3148c:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f31490:     	add	x1, x1, #0xaba
101f31494:     	b	0x101f3192c <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x51c>
101f31498:     	mov	w22, #0x0               ; =0
101f3149c:     	ldrb	w8, [x21, #0x21]
101f314a0:     	cmp	w8, #0x2e
101f314a4:     	b.ne	0x101f314b0 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0xa0>
101f314a8:     	mov	x0, x27
101f314ac:     	bl	0x100b44588 <__Z23WM_cursor_modal_restoreP8wmWindow>
101f314b0:     	ldr	w8, [x23, #0x24]
101f314b4:     	cmp	w8, #0xa
101f314b8:     	b.eq	0x101f314cc <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0xbc>
101f314bc:     	mov	x0, x19
101f314c0:     	mov	x1, x21
101f314c4:     	mov	w2, #0xa                ; =10
101f314c8:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f314cc:     	tbnz	w25, #0x0, 0x101f314e8 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0xd8>
101f314d0:     	mov	x0, x19
101f314d4:     	mov	x1, x20
101f314d8:     	mov	x2, x21
101f314dc:     	mov	x3, x23
101f314e0:     	mov	w4, #0x0                ; =0
101f314e4:     	bl	0x101f33df8 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab>
101f314e8:     	ldrb	w8, [x23, #0x114]
101f314ec:     	adrp	x28, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101f314f0:     	add	x28, x28, #0x690
101f314f4:     	cmp	w8, #0x1
101f314f8:     	b.ne	0x101f3161c <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x20c>
101f314fc:     	str	w24, [sp, #0x14]
101f31500:     	mov	x8, x20
101f31504:     	ldr	x20, [x20, #0x10]
101f31508:     	str	x8, [sp, #0x20]
101f3150c:     	ldr	x24, [x8, #0x18]
101f31510:     	b	0x101f31518 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x108>
101f31514:     	add	x20, x20, #0x8
101f31518:     	cmp	x20, x24
101f3151c:     	b.eq	0x101f3154c <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x13c>
101f31520:     	ldr	x8, [x20]
101f31524:     	ldr	w9, [x8, #0x18]
101f31528:     	tbz	w9, #0x19, 0x101f31514 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x104>
101f3152c:     	and	w9, w9, #0xfdffffff
101f31530:     	str	w9, [x8, #0x18]
101f31534:     	ldrb	w8, [x23, #0x2c]
101f31538:     	tbnz	w8, #0x0, 0x101f31514 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x104>
101f3153c:     	ldr	x1, [x20]
101f31540:     	mov	x0, x19
101f31544:     	bl	0x101f342b4 <__ZL20ui_apply_but_autokeyP8bContextP5uiBut>
101f31548:     	b	0x101f31514 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x104>
101f3154c:     	stp	w22, w25, [sp, #0xc]
101f31550:     	str	x27, [sp, #0x18]
101f31554:     	ldr	x26, [x23, #0x118]
101f31558:     	cbz	x26, 0x101f315f8 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x1e8>
101f3155c:     	mov	x24, #-0x5555555555555556 ; =-6148914691236517206
101f31560:     	movk	x24, #0xaaab
101f31564:     	b	0x101f31590 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x180>
101f31568:     	ldr	x8, [x28]
101f3156c:     	mov	x0, x27
101f31570:     	mov	w1, #0x1                ; =1
101f31574:     	blr	x8
101f31578:     	ldr	x8, [x28]
101f3157c:     	mov	x0, x26
101f31580:     	mov	w1, #0x0                ; =0
101f31584:     	blr	x8
101f31588:     	mov	x26, x20
101f3158c:     	cbz	x20, 0x101f315f8 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x1e8>
101f31590:     	ldp	x20, x27, [x26]
101f31594:     	cbz	x27, 0x101f31578 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x168>
101f31598:     	ldp	x0, x8, [x27, #0x10]
101f3159c:     	sub	x8, x8, x0
101f315a0:     	cmp	x8, #0x1
101f315a4:     	b.lt	0x101f315e4 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x1d4>
101f315a8:     	umulh	x8, x8, x24
101f315ac:     	lsr	x8, x8, #6
101f315b0:     	add	x22, x8, #0x1
101f315b4:     	add	x25, x0, #0x30
101f315b8:     	b	0x101f315cc <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x1bc>
101f315bc:     	sub	x22, x22, #0x1
101f315c0:     	add	x25, x25, #0x60
101f315c4:     	cmp	x22, #0x1
101f315c8:     	b.le	0x101f315e0 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x1d0>
101f315cc:     	ldur	x0, [x25, #-0x18]
101f315d0:     	cmp	x25, x0
101f315d4:     	b.eq	0x101f315bc <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x1ac>
101f315d8:     	bl	0x100ae425c <_MEM_freeN>
101f315dc:     	b	0x101f315bc <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x1ac>
101f315e0:     	ldr	x0, [x27, #0x10]
101f315e4:     	add	x8, x27, #0x28
101f315e8:     	cmp	x0, x8
101f315ec:     	b.eq	0x101f31568 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x158>
101f315f0:     	bl	0x100ae425c <_MEM_freeN>
101f315f4:     	b	0x101f31568 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x158>
101f315f8:     	str	xzr, [x23, #0x118]
101f315fc:     	ldr	x1, [x23, #0x120]
101f31600:     	ldp	w25, w24, [sp, #0x10]
101f31604:     	ldp	x27, x20, [sp, #0x18]
101f31608:     	ldr	w22, [sp, #0xc]
101f3160c:     	cbz	x1, 0x101f3161c <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x20c>
101f31610:     	mov	x0, x20
101f31614:     	bl	0x101f79b80 <__Z16UI_butstore_freeP7uiBlockP10uiButStore>
101f31618:     	str	xzr, [x23, #0x120]
101f3161c:     	ldr	x8, [x20, #0x3a8]
101f31620:     	cbz	x8, 0x101f31668 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x258>
101f31624:     	ldrb	w9, [x20, #0x348]
101f31628:     	tbnz	w9, #0x6, 0x101f31668 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x258>
101f3162c:     	ldrb	w9, [x23, #0x2c]
101f31630:     	tbz	w22, #0x0, 0x101f3163c <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x22c>
101f31634:     	tbnz	w9, #0x0, 0x101f3163c <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x22c>
101f31638:     	cbz	w25, 0x101f31668 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x258>
101f3163c:     	tbz	w9, #0x0, 0x101f3164c <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x23c>
101f31640:     	ldrb	w9, [x23, #0x2d]
101f31644:     	cmp	w9, #0x1
101f31648:     	b.ne	0x101f31668 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x258>
101f3164c:     	ldr	w9, [x23, #0x28]
101f31650:     	str	w9, [x8, #0x288]
101f31654:     	ldrb	w9, [x23, #0x2c]
101f31658:     	cmp	w9, #0x0
101f3165c:     	mov	w9, #0x1                ; =1
101f31660:     	cinc	w9, w9, eq
101f31664:     	str	w9, [x8, #0x28c]
101f31668:     	tbnz	w25, #0x0, 0x101f31748 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x338>
101f3166c:     	ldrb	w8, [x23, #0x2c]
101f31670:     	tbnz	w8, #0x0, 0x101f31748 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x338>
101f31674:     	str	x20, [sp, #0x20]
101f31678:     	mov	x0, x21
101f3167c:     	bl	0x101f32184 <__ZL17ui_apply_but_undoP5uiBut>
101f31680:     	mov	x0, x19
101f31684:     	mov	x1, x21
101f31688:     	bl	0x101f342b4 <__ZL20ui_apply_but_autokeyP8bContextP5uiBut>
101f3168c:     	add	x0, sp, #0x28
101f31690:     	mov	x1, x21
101f31694:     	bl	0x101f391a4 <__ZN5uiButC2ERKS_>
101f31698:     	str	x27, [sp, #0x18]
101f3169c:     	mov	x22, x24
101f316a0:     	ldp	x8, x20, [x23, #0x140]
101f316a4:     	cmp	x8, x20
101f316a8:     	b.eq	0x101f316ec <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x2dc>
101f316ac:     	add	x24, sp, #0x28
101f316b0:     	add	x27, x24, #0x1f8
101f316b4:     	ldr	q0, [x8]
101f316b8:     	ldr	x9, [x8, #0x10]
101f316bc:     	str	x9, [x27, #0x10]
101f316c0:     	str	q0, [x27]
101f316c4:     	add	x26, x8, #0x18
101f316c8:     	add	x0, x24, #0x210
101f316cc:     	mov	x1, x26
101f316d0:     	bl	0x100020504 <__ZN7blender21copy_assign_containerINS_6VectorI18AncestorPointerRNALx2ENS_16GuardedAllocatorEEEEERT_S6_RKS5_>
101f316d4:     	add	x1, sp, #0x28
101f316d8:     	mov	x0, x19
101f316dc:     	bl	0x101f342b4 <__ZL20ui_apply_but_autokeyP8bContextP5uiBut>
101f316e0:     	add	x8, x26, #0x48
101f316e4:     	cmp	x8, x20
101f316e8:     	b.ne	0x101f316b4 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x2a4>
101f316ec:     	add	x0, sp, #0x28
101f316f0:     	bl	0x101f1c6e4 <__ZN5uiButD2Ev>
101f316f4:     	ldp	x27, x0, [sp, #0x18]
101f316f8:     	ldrb	w8, [x0, #0x349]
101f316fc:     	mov	x24, x22
101f31700:     	tbz	w8, #0x2, 0x101f3170c <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x2fc>
101f31704:     	mov	x1, x21
101f31708:     	bl	0x101f9997c <__Z24ui_popup_menu_memory_setP7uiBlockP5uiBut>
101f3170c:     	adrp	x20, 0x106d88000 <_build_commit_date>
101f31710:     	add	x20, x20, #0xe08
101f31714:     	mov	w8, #0x3568             ; =13672
101f31718:     	ldrb	w8, [x20, x8]
101f3171c:     	cbnz	w8, 0x101f31748 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x338>
101f31720:     	ldr	x1, [x21, #0x258]
101f31724:     	add	x0, x21, #0x1f8
101f31728:     	bl	0x101f2e2dc <__ZL17ui_rna_is_userdefP10PointerRNAP11PropertyRNA>
101f3172c:     	cbz	w0, 0x101f31748 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x338>
101f31730:     	mov	w8, #0x3568             ; =13672
101f31734:     	mov	w9, #0x1                ; =1
101f31738:     	strb	w9, [x20, x8]
101f3173c:     	mov	w0, #0x2000000          ; =33554432
101f31740:     	mov	x1, #0x0                ; =0
101f31744:     	bl	0x100b4d89c <__Z20WM_main_add_notifierjPv>
101f31748:     	ldr	x9, [x23, #0x18]
101f3174c:     	ldr	x8, [x9, #0x128]
101f31750:     	ldr	x8, [x8, #0x260]
101f31754:     	cbz	x8, 0x101f31794 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x384>
101f31758:     	mov	w9, #0x1                ; =1
101f3175c:     	ldp	x10, x11, [x8, #0x10]
101f31760:     	cmp	x10, x11
101f31764:     	b.eq	0x101f31780 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x370>
101f31768:     	ldr	x12, [x10], #0x8
101f3176c:     	ldr	w13, [x12, #0x18]
101f31770:     	and	w13, w13, #0xfff7ffff
101f31774:     	str	w13, [x12, #0x18]
101f31778:     	cmp	x10, x11
101f3177c:     	b.ne	0x101f31768 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x358>
101f31780:     	strb	w9, [x8, #0x372]
101f31784:     	ldr	x8, [x8]
101f31788:     	cbnz	x8, 0x101f3175c <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x34c>
101f3178c:     	ldr	x9, [x23, #0x18]
101f31790:     	cbz	x9, 0x101f317b0 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x3a0>
101f31794:     	ldr	x8, [x9, #0x128]
101f31798:     	ldr	x8, [x8, #0x260]
101f3179c:     	cbz	x8, 0x101f317b0 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x3a0>
101f317a0:     	mov	w9, #0x1                ; =1
101f317a4:     	strb	w9, [x8, #0x372]
101f317a8:     	ldr	x8, [x8]
101f317ac:     	cbnz	x8, 0x101f317a4 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x394>
101f317b0:     	ldr	x0, [x23, #0x40]
101f317b4:     	cbz	x0, 0x101f317c4 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x3b4>
101f317b8:     	ldr	x8, [x28]
101f317bc:     	mov	w1, #0x0                ; =0
101f317c0:     	blr	x8
101f317c4:     	ldr	x0, [x23, #0x50]
101f317c8:     	cbz	x0, 0x101f317d8 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x3c8>
101f317cc:     	ldr	x8, [x28]
101f317d0:     	mov	w1, #0x0                ; =0
101f317d4:     	blr	x8
101f317d8:     	ldrb	w8, [x23, #0x2e0]
101f317dc:     	cmp	w8, #0x1
101f317e0:     	b.ne	0x101f3183c <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x42c>
101f317e4:     	ldp	x8, x9, [x23, #0x140]
101f317e8:     	sub	x9, x9, x8
101f317ec:     	cmp	x9, #0x1
101f317f0:     	b.lt	0x101f31838 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x428>
101f317f4:     	mov	x10, #-0x5555555555555556 ; =-6148914691236517206
101f317f8:     	movk	x10, #0xaaab
101f317fc:     	umulh	x9, x9, x10
101f31800:     	lsr	x9, x9, #6
101f31804:     	add	x20, x9, #0x1
101f31808:     	add	x22, x8, #0x30
101f3180c:     	b	0x101f31820 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x410>
101f31810:     	sub	x20, x20, #0x1
101f31814:     	add	x22, x22, #0x60
101f31818:     	cmp	x20, #0x1
101f3181c:     	b.le	0x101f31834 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x424>
101f31820:     	ldur	x0, [x22, #-0x18]
101f31824:     	cmp	x22, x0
101f31828:     	b.eq	0x101f31810 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x400>
101f3182c:     	bl	0x100ae425c <_MEM_freeN>
101f31830:     	b	0x101f31810 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x400>
101f31834:     	ldr	x8, [x23, #0x140]
101f31838:     	str	x8, [x23, #0x148]
101f3183c:     	ldr	w8, [x21, #0x18]
101f31840:     	and	w8, w8, #0xfffff7ff
101f31844:     	str	w8, [x21, #0x18]
101f31848:     	ldrb	w8, [x23, #0x31]
101f3184c:     	cmp	w8, #0x1
101f31850:     	b.ne	0x101f3185c <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x44c>
101f31854:     	mov	x0, x27
101f31858:     	bl	0x100b44588 <__Z23WM_cursor_modal_restoreP8wmWindow>
101f3185c:     	mov	x20, x23
101f31860:     	ldr	x0, [x20, #0x18]!
101f31864:     	bl	0x10161f34c <__Z31ED_region_tag_redraw_no_rebuildP7ARegion>
101f31868:     	ldr	x0, [x20]
101f3186c:     	bl	0x10161f390 <__Z24ED_region_tag_refresh_uiP7ARegion>
101f31870:     	ldrb	w8, [x21, #0x1b]
101f31874:     	tbnz	w8, #0x1, 0x101f31898 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x488>
101f31878:     	ldr	x8, [x23, #0x2e8]
101f3187c:     	cbz	x8, 0x101f31898 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x488>
101f31880:     	ldr	x8, [x21, #0x420]
101f31884:     	add	x1, x8, #0x2e8
101f31888:     	add	x2, x23, #0x2e8
101f3188c:     	mov	x0, x19
101f31890:     	mov	w3, #0x0                ; =0
101f31894:     	bl	0x101f38fc0 <__ZL28ui_block_interaction_releaseP8bContextP31uiBlockInteraction_CallbackDataRP25uiBlockInteraction_Handleb>
101f31898:     	str	xzr, [x21, #0x3d8]
101f3189c:     	add	x0, x21, #0x3d0
101f318a0:     	bl	0x101f2dfac <__Z23ui_but_handle_data_freePP18uiHandleButtonData>
101f318a4:     	ldr	w8, [x21, #0x18]
101f318a8:     	mov	w9, #0xfffa             ; =65530
101f318ac:     	movk	w9, #0xfff7, lsl #16
101f318b0:     	and	w8, w8, w9
101f318b4:     	orr	w8, w8, #0x80000
101f318b8:     	str	w8, [x21, #0x18]
101f318bc:     	tbnz	w25, #0x0, 0x101f318c8 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x4b8>
101f318c0:     	mov	x0, x21
101f318c4:     	bl	0x101f0ad00 <__Z13ui_but_updateP5uiBut>
101f318c8:     	cbz	w24, 0x101f318d8 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x4c8>
101f318cc:     	mov	x0, x19
101f318d0:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f318d4:     	bl	0x100b596a8 <__Z22WM_event_add_mousemoveP8wmWindow>
101f318d8:     	ldur	x8, [x29, #-0x60]
101f318dc:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
101f318e0:     	ldr	x9, [x9, #0x7f0]
101f318e4:     	ldr	x9, [x9]
101f318e8:     	cmp	x9, x8
101f318ec:     	b.ne	0x101f31948 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x538>
101f318f0:     	add	sp, sp, #0x460
101f318f4:     	ldp	x29, x30, [sp, #0x50]
101f318f8:     	ldp	x20, x19, [sp, #0x40]
101f318fc:     	ldp	x22, x21, [sp, #0x30]
101f31900:     	ldp	x24, x23, [sp, #0x20]
101f31904:     	ldp	x26, x25, [sp, #0x10]
101f31908:     	ldp	x28, x27, [sp], #0x60
101f3190c:     	ret
101f31910:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f31914:     	add	x1, x1, #0xa7e
101f31918:     	mov	x0, x26
101f3191c:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f31920:     	cbz	w0, 0x101f31940 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x530>
101f31924:     	adrp	x1, 0x104d2e000 <__ZL3hex+0x16234d>
101f31928:     	add	x1, x1, #0x4f
101f3192c:     	mov	x0, x26
101f31930:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
101f31934:     	cmp	w0, #0x0
101f31938:     	cset	w22, eq
101f3193c:     	b	0x101f3149c <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x8c>
101f31940:     	mov	w22, #0x1               ; =1
101f31944:     	b	0x101f3149c <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x8c>
101f31948:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
101f3194c:     	b	0x101f31974 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x564>
101f31950:     	b	0x101f31974 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x564>
101f31954:     	mov	x19, x0
101f31958:     	mov	x0, x19
101f3195c:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
101f31960:     	mov	x19, x0
101f31964:     	add	x0, sp, #0x28
101f31968:     	bl	0x101f1c6e4 <__ZN5uiButD2Ev>
101f3196c:     	mov	x0, x19
101f31970:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
101f31974:     	mov	x19, x0
101f31978:     	cbnz	w1, 0x101f31984 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb+0x574>
101f3197c:     	mov	x0, x19
101f31980:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
101f31984:     	mov	x0, x19
101f31988:     	bl	0x1000144bc <___clang_call_terminate>
