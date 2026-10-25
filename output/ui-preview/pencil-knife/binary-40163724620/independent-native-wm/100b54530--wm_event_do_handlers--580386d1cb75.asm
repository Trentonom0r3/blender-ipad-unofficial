
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b54530 <__Z20wm_event_do_handlersP8bContext>:
100b54530:     	stp	x28, x27, [sp, #-0x60]!
100b54534:     	stp	x26, x25, [sp, #0x10]
100b54538:     	stp	x24, x23, [sp, #0x20]
100b5453c:     	stp	x22, x21, [sp, #0x30]
100b54540:     	stp	x20, x19, [sp, #0x40]
100b54544:     	stp	x29, x30, [sp, #0x50]
100b54548:     	add	x29, sp, #0x50
100b5454c:     	sub	sp, sp, #0x210
100b54550:     	mov	x19, x0
100b54554:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
100b54558:     	ldr	x8, [x8, #0x7f0]
100b5455c:     	ldr	x8, [x8]
100b54560:     	stur	x8, [x29, #-0x68]
100b54564:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b54568:     	mov	x20, x0
100b5456c:     	bl	0x1008f2094 <__Z16GPU_render_beginv>
100b54570:     	mov	x0, x20
100b54574:     	bl	0x100b73ebc <__Z19WM_keyconfig_updateP15wmWindowManager>
100b54578:     	mov	x0, x19
100b5457c:     	bl	0x1000b4c78 <__Z13CTX_data_mainPK8bContext>
100b54580:     	bl	0x100b40ca0 <__Z21WM_gizmoconfig_updateP4Main>
100b54584:     	str	x20, [sp, #0x28]
100b54588:     	ldr	x21, [x20, #0x1a0]
100b5458c:     	cbz	x21, 0x100b56204 <__Z20wm_event_do_handlersP8bContext+0x1cd4>
100b54590:     	adrp	x0, 0x106d86000 <__PyRuntime+0x280b8>
100b54594:     	add	x0, x0, #0xb60
100b54598:     	ldr	x8, [x0]
100b5459c:     	blr	x8
100b545a0:     	str	x0, [sp, #0x10]
100b545a4:     	mov	x0, x21
100b545a8:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b545ac:     	cbz	x0, 0x100b561a8 <__Z20wm_event_do_handlersP8bContext+0x1c78>
100b545b0:     	ldr	x0, [x21, #0x168]
100b545b4:     	ldr	x26, [x0]
100b545b8:     	cbz	x26, 0x100b56090 <__Z20wm_event_do_handlersP8bContext+0x1b60>
100b545bc:     	ldrb	w8, [x26, #0x78]
100b545c0:     	cmp	w8, #0x1
100b545c4:     	b.ne	0x100b54628 <__Z20wm_event_do_handlersP8bContext+0xf8>
100b545c8:     	ldr	x10, [x26, #0x58]
100b545cc:     	cbz	x10, 0x100b54628 <__Z20wm_event_do_handlersP8bContext+0xf8>
100b545d0:     	ldrb	w9, [x26, #0x79]
100b545d4:     	sub	w8, w9, #0x2
100b545d8:     	cmp	w8, #0x2
100b545dc:     	b.hi	0x100b54628 <__Z20wm_event_do_handlersP8bContext+0xf8>
100b545e0:     	mov	x8, x0
100b545e4:     	ldr	x11, [x8, #0x40]!
100b545e8:     	cmp	x11, x10
100b545ec:     	b.ne	0x100b54628 <__Z20wm_event_do_handlersP8bContext+0xf8>
100b545f0:     	ldr	x10, [x0, #0x48]
100b545f4:     	ldr	x11, [x26, #0x60]
100b545f8:     	cmp	x10, x11
100b545fc:     	b.ne	0x100b54628 <__Z20wm_event_do_handlersP8bContext+0xf8>
100b54600:     	cmp	w9, #0x4
100b54604:     	b.ne	0x100b54610 <__Z20wm_event_do_handlersP8bContext+0xe0>
100b54608:     	stp	xzr, xzr, [x8]
100b5460c:     	ldr	x0, [x21, #0x168]
100b54610:     	mov	x1, x26
100b54614:     	bl	0x10078fe64 <__Z11BLI_remlinkP8ListBasePv>
100b54618:     	mov	x0, x21
100b5461c:     	mov	x1, x26
100b54620:     	bl	0x100b56408 <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent>
100b54624:     	b	0x100b545b0 <__Z20wm_event_do_handlersP8bContext+0x80>
100b54628:     	ldrb	w8, [x21, #0xdc]
100b5462c:     	cbz	w8, 0x100b546f4 <__Z20wm_event_do_handlersP8bContext+0x1c4>
100b54630:     	ldrh	w8, [x26, #0x12]
100b54634:     	cmp	w8, #0x1
100b54638:     	b.ne	0x100b5482c <__Z20wm_event_do_handlersP8bContext+0x2fc>
100b5463c:     	ldrb	w8, [x26, #0x7c]
100b54640:     	tbnz	w8, #0x1, 0x100b5482c <__Z20wm_event_do_handlersP8bContext+0x2fc>
100b54644:     	ldrh	w8, [x26, #0x10]
100b54648:     	cmp	w8, #0x13
100b5464c:     	mov	w9, #0x1                ; =1
100b54650:     	lsl	w9, w9, w8
100b54654:     	mov	w10, #0x18e             ; =398
100b54658:     	movk	w10, #0xc, lsl #16
100b5465c:     	and	w9, w9, w10
100b54660:     	ccmp	w9, #0x0, #0x4, ls
100b54664:     	b.eq	0x100b54808 <__Z20wm_event_do_handlersP8bContext+0x2d8>
100b54668:     	ldrh	w8, [x26, #0x9c]
100b5466c:     	mov	w9, #0x1                ; =1
100b54670:     	str	w9, [sp, #0x24]
100b54674:     	cmp	w8, #0x13
100b54678:     	b.hi	0x100b54834 <__Z20wm_event_do_handlersP8bContext+0x304>
100b5467c:     	mov	w9, #0x1                ; =1
100b54680:     	lsl	w8, w9, w8
100b54684:     	mov	w9, #0x18e              ; =398
100b54688:     	movk	w9, #0xc, lsl #16
100b5468c:     	tst	w8, w9
100b54690:     	b.eq	0x100b54834 <__Z20wm_event_do_handlersP8bContext+0x304>
100b54694:     	ldr	x8, [x21, #0xf8]
100b54698:     	cbz	x8, 0x100b546fc <__Z20wm_event_do_handlersP8bContext+0x1cc>
100b5469c:     	ldr	q0, [x8]
100b546a0:     	str	q0, [sp, #0x30]
100b546a4:     	ldp	w20, w22, [x8, #0x14]
100b546a8:     	ldur	x25, [x8, #0x1c]
100b546ac:     	ldur	q0, [x8, #0x25]
100b546b0:     	ldur	q1, [x8, #0x35]
100b546b4:     	stp	q0, q1, [sp, #0x120]
100b546b8:     	ldr	w9, [x8, #0x44]
100b546bc:     	add	x10, sp, #0x120
100b546c0:     	stur	w9, [x10, #0x1f]
100b546c4:     	ldur	q0, [x8, #0x58]
100b546c8:     	ldur	q1, [x8, #0x68]
100b546cc:     	stp	q0, q1, [sp, #0x50]
100b546d0:     	ldr	w9, [x8, #0x78]
100b546d4:     	str	w9, [sp, #0x70]
100b546d8:     	ldr	w24, [x8, #0x84]
100b546dc:     	ldr	w23, [x8, #0x90]
100b546e0:     	ldr	w9, [x8, #0xac]
100b546e4:     	stur	w9, [x29, #-0x70]
100b546e8:     	ldur	q0, [x8, #0x9c]
100b546ec:     	stur	q0, [x29, #-0x80]
100b546f0:     	b	0x100b54734 <__Z20wm_event_do_handlersP8bContext+0x204>
100b546f4:     	str	wzr, [sp, #0x24]
100b546f8:     	b	0x100b54834 <__Z20wm_event_do_handlersP8bContext+0x304>
100b546fc:     	mov	w23, #0x0               ; =0
100b54700:     	mov	w20, #0x0               ; =0
100b54704:     	mov	w22, #0x0               ; =0
100b54708:     	mov	x25, #0x0               ; =0
100b5470c:     	mov	w24, #0x0               ; =0
100b54710:     	stp	xzr, xzr, [sp, #0x30]
100b54714:     	movi.16b	v0, #0x0
100b54718:     	stp	q0, q0, [sp, #0x120]
100b5471c:     	add	x8, sp, #0x120
100b54720:     	stur	wzr, [x8, #0x1f]
100b54724:     	stp	q0, q0, [sp, #0x50]
100b54728:     	str	wzr, [sp, #0x70]
100b5472c:     	stp	xzr, xzr, [x29, #-0x80]
100b54730:     	stur	wzr, [x29, #-0x70]
100b54734:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
100b54738:     	add	x8, x8, #0x6e0
100b5473c:     	ldr	x8, [x8]
100b54740:     	mov	w0, #0x1                ; =1
100b54744:     	mov	w1, #0xb0               ; =176
100b54748:     	mov	w2, #0x8                ; =8
100b5474c:     	adrp	x3, 0x104bd0000 <__ZL3hex+0x434d>
100b54750:     	add	x3, x3, #0xd1d
100b54754:     	blr	x8
100b54758:     	mov	x26, x0
100b5475c:     	ldr	q0, [sp, #0x30]
100b54760:     	str	q0, [x0]
100b54764:     	mov	w8, #0x4                ; =4
100b54768:     	stp	w8, w20, [x0, #0x10]
100b5476c:     	str	w22, [x0, #0x18]
100b54770:     	stur	x25, [x0, #0x1c]
100b54774:     	strb	wzr, [x0, #0x24]
100b54778:     	ldp	q0, q1, [sp, #0x120]
100b5477c:     	stur	q0, [x0, #0x25]
100b54780:     	stur	q1, [x0, #0x35]
100b54784:     	add	x8, sp, #0x120
100b54788:     	ldur	w8, [x8, #0x1f]
100b5478c:     	str	w8, [x0, #0x44]
100b54790:     	stp	xzr, xzr, [x0, #0x48]
100b54794:     	ldp	q0, q1, [sp, #0x50]
100b54798:     	ldr	w8, [sp, #0x70]
100b5479c:     	str	w8, [x0, #0x78]
100b547a0:     	stur	q1, [x0, #0x68]
100b547a4:     	stur	q0, [x0, #0x58]
100b547a8:     	mov	x25, x0
100b547ac:     	str	xzr, [x25, #0x7c]!
100b547b0:     	str	w24, [x0, #0x84]
100b547b4:     	str	xzr, [x0, #0x88]
100b547b8:     	stp	w23, w20, [x0, #0x90]
100b547bc:     	str	w22, [x0, #0x98]
100b547c0:     	ldur	q0, [x29, #-0x80]
100b547c4:     	stur	q0, [x0, #0x9c]
100b547c8:     	ldur	w8, [x29, #-0x70]
100b547cc:     	str	w8, [x0, #0xac]
100b547d0:     	ldr	x0, [x21, #0x168]
100b547d4:     	mov	x1, x26
100b547d8:     	bl	0x10078fe38 <__Z11BLI_addtailP8ListBasePv>
100b547dc:     	ldr	x0, [x21, #0x168]
100b547e0:     	mov	x1, x26
100b547e4:     	bl	0x10078fe64 <__Z11BLI_remlinkP8ListBasePv>
100b547e8:     	ldr	x0, [x21, #0x168]
100b547ec:     	mov	x1, x26
100b547f0:     	bl	0x10078fe0c <__Z11BLI_addheadP8ListBasePv>
100b547f4:     	ldr	w8, [x25]
100b547f8:     	orr	w8, w8, #0x8
100b547fc:     	str	w8, [x25]
100b54800:     	ldrb	w8, [x21, #0xdc]
100b54804:     	b	0x100b54830 <__Z20wm_event_do_handlersP8bContext+0x300>
100b54808:     	sub	w9, w8, #0x191
100b5480c:     	cmp	w9, #0x30
100b54810:     	b.lo	0x100b54668 <__Z20wm_event_do_handlersP8bContext+0x138>
100b54814:     	sub	w9, w8, #0x20
100b54818:     	cmp	w9, #0xe0
100b5481c:     	b.lo	0x100b54668 <__Z20wm_event_do_handlersP8bContext+0x138>
100b54820:     	sub	w8, w8, #0x12c
100b54824:     	cmp	w8, #0x17
100b54828:     	b.ls	0x100b54668 <__Z20wm_event_do_handlersP8bContext+0x138>
100b5482c:     	mov	w8, #0x1                ; =1
100b54830:     	str	w8, [sp, #0x24]
100b54834:     	mov	x0, x26
100b54838:     	bl	0x100b4cef8 <__Z33WM_event_consecutive_gesture_testPK7wmEvent>
100b5483c:     	ldrh	w8, [x21, #0xde]
100b54840:     	cbz	w8, 0x100b54860 <__Z20wm_event_do_handlersP8bContext+0x330>
100b54844:     	ldrh	w9, [x26, #0x10]
100b54848:     	cmp	w9, w8
100b5484c:     	b.ne	0x100b5490c <__Z20wm_event_do_handlersP8bContext+0x3dc>
100b54850:     	ldr	w8, [x26, #0x7c]
100b54854:     	orr	w8, w8, #0x4
100b54858:     	str	w8, [x26, #0x7c]
100b5485c:     	b	0x100b549b4 <__Z20wm_event_do_handlersP8bContext+0x484>
100b54860:     	cbz	w0, 0x100b549b4 <__Z20wm_event_do_handlersP8bContext+0x484>
100b54864:     	adrp	x8, 0x106658000 <__ZN7blender3seq28seqModifierType_WhiteBalanceE+0x40>
100b54868:     	add	x8, x8, #0x298
100b5486c:     	ldr	x8, [x8]
100b54870:     	ldr	x0, [x8, #0x8]
100b54874:     	cbnz	x0, 0x100b54890 <__Z20wm_event_do_handlersP8bContext+0x360>
100b54878:     	mov	x0, x8
100b5487c:     	bl	0x100ae37f8 <__Z15CLG_logref_initP10CLG_LogRef>
100b54880:     	adrp	x8, 0x106658000 <__ZN7blender3seq28seqModifierType_WhiteBalanceE+0x40>
100b54884:     	add	x8, x8, #0x298
100b54888:     	ldr	x8, [x8]
100b5488c:     	ldr	x0, [x8, #0x8]
100b54890:     	ldr	w8, [x0, #0x50]
100b54894:     	cmp	w8, #0x4
100b54898:     	b.lt	0x100b548c4 <__Z20wm_event_do_handlersP8bContext+0x394>
100b5489c:     	ldrsh	x8, [x26, #0x10]
100b548a0:     	str	x8, [sp]
100b548a4:     	mov	w1, #0x4                ; =4
100b548a8:     	adrp	x2, 0x104bd0000 <__ZL3hex+0x434d>
100b548ac:     	add	x2, x2, #0x75e
100b548b0:     	adrp	x3, 0x104bd0000 <__ZL3hex+0x434d>
100b548b4:     	add	x3, x3, #0x72a
100b548b8:     	adrp	x4, 0x104bd0000 <__ZL3hex+0x434d>
100b548bc:     	add	x4, x4, #0x79a
100b548c0:     	bl	0x100ae2b1c <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b548c4:     	ldrh	w8, [x26, #0x10]
100b548c8:     	strh	w8, [x21, #0xde]
100b548cc:     	ldr	w8, [x26, #0x14]
100b548d0:     	str	w8, [x21, #0xe0]
100b548d4:     	ldr	w8, [x26, #0x18]
100b548d8:     	str	w8, [x21, #0xe4]
100b548dc:     	ldr	x20, [x21, #0xe8]
100b548e0:     	cbz	x20, 0x100b549b4 <__Z20wm_event_do_handlersP8bContext+0x484>
100b548e4:     	ldr	x0, [x20]
100b548e8:     	cbz	x0, 0x100b548f0 <__Z20wm_event_do_handlersP8bContext+0x3c0>
100b548ec:     	bl	0x100ae425c <_MEM_freeN>
100b548f0:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
100b548f4:     	add	x8, x8, #0x690
100b548f8:     	ldr	x8, [x8]
100b548fc:     	mov	x0, x20
100b54900:     	mov	w1, #0x0                ; =0
100b54904:     	blr	x8
100b54908:     	b	0x100b549b0 <__Z20wm_event_do_handlersP8bContext+0x480>
100b5490c:     	tbnz	w0, #0x0, 0x100b54920 <__Z20wm_event_do_handlersP8bContext+0x3f0>
100b54910:     	mov	x0, x21
100b54914:     	mov	x1, x26
100b54918:     	bl	0x100b4cf10 <__Z39WM_event_consecutive_gesture_test_breakPK8wmWindowPK7wmEvent>
100b5491c:     	cbz	w0, 0x100b549b4 <__Z20wm_event_do_handlersP8bContext+0x484>
100b54920:     	adrp	x8, 0x106658000 <__ZN7blender3seq28seqModifierType_WhiteBalanceE+0x40>
100b54924:     	add	x8, x8, #0x298
100b54928:     	ldr	x8, [x8]
100b5492c:     	ldr	x0, [x8, #0x8]
100b54930:     	cbnz	x0, 0x100b5494c <__Z20wm_event_do_handlersP8bContext+0x41c>
100b54934:     	mov	x0, x8
100b54938:     	bl	0x100ae37f8 <__Z15CLG_logref_initP10CLG_LogRef>
100b5493c:     	adrp	x8, 0x106658000 <__ZN7blender3seq28seqModifierType_WhiteBalanceE+0x40>
100b54940:     	add	x8, x8, #0x298
100b54944:     	ldr	x8, [x8]
100b54948:     	ldr	x0, [x8, #0x8]
100b5494c:     	ldr	w8, [x0, #0x50]
100b54950:     	cmp	w8, #0x4
100b54954:     	b.lt	0x100b54980 <__Z20wm_event_do_handlersP8bContext+0x450>
100b54958:     	ldrsh	x8, [x26, #0x10]
100b5495c:     	str	x8, [sp]
100b54960:     	mov	w1, #0x4                ; =4
100b54964:     	adrp	x2, 0x104bd0000 <__ZL3hex+0x434d>
100b54968:     	add	x2, x2, #0x6ee
100b5496c:     	adrp	x3, 0x104bd0000 <__ZL3hex+0x434d>
100b54970:     	add	x3, x3, #0x72a
100b54974:     	adrp	x4, 0x104bd0000 <__ZL3hex+0x434d>
100b54978:     	add	x4, x4, #0x73f
100b5497c:     	bl	0x100ae2b1c <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b54980:     	strh	wzr, [x21, #0xde]
100b54984:     	ldr	x20, [x21, #0xe8]
100b54988:     	cbz	x20, 0x100b549b4 <__Z20wm_event_do_handlersP8bContext+0x484>
100b5498c:     	ldr	x0, [x20]
100b54990:     	cbz	x0, 0x100b54998 <__Z20wm_event_do_handlersP8bContext+0x468>
100b54994:     	bl	0x100ae425c <_MEM_freeN>
100b54998:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
100b5499c:     	add	x8, x8, #0x690
100b549a0:     	ldr	x8, [x8]
100b549a4:     	mov	x0, x20
100b549a8:     	mov	w1, #0x0                ; =0
100b549ac:     	blr	x8
100b549b0:     	str	xzr, [x21, #0xe8]
100b549b4:     	mov	x0, x21
100b549b8:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b549bc:     	mov	x27, x0
100b549c0:     	adrp	x8, 0x106d88000 <_build_commit_date>
100b549c4:     	add	x8, x8, #0x28
100b549c8:     	ldrb	w8, [x8, #0xc40]
100b549cc:     	tst	w8, #0x18
100b549d0:     	b.eq	0x100b54a08 <__Z20wm_event_do_handlersP8bContext+0x4d8>
100b549d4:     	ldrh	w8, [x26, #0x10]
100b549d8:     	cmp	w8, #0x4
100b549dc:     	b.eq	0x100b54a08 <__Z20wm_event_do_handlersP8bContext+0x4d8>
100b549e0:     	cmp	w8, #0x11
100b549e4:     	b.eq	0x100b54a08 <__Z20wm_event_do_handlersP8bContext+0x4d8>
100b549e8:     	adrp	x8, 0x104bd0000 <__ZL3hex+0x434d>
100b549ec:     	add	x8, x8, #0x72a
100b549f0:     	str	x8, [sp]
100b549f4:     	adrp	x0, 0x104bd0000 <__ZL3hex+0x434d>
100b549f8:     	add	x0, x0, #0x7b9
100b549fc:     	bl	0x104b728f0 <_zlibVersion+0x104b728f0>
100b54a00:     	mov	x0, x26
100b54a04:     	bl	0x100b4c994 <__Z14WM_event_printPK7wmEvent>
100b54a08:     	ldrh	w8, [x21, #0xd6]
100b54a0c:     	cbz	w8, 0x100b54a2c <__Z20wm_event_do_handlersP8bContext+0x4fc>
100b54a10:     	ldrh	w9, [x26, #0x10]
100b54a14:     	cmp	w8, w9
100b54a18:     	b.ne	0x100b54a2c <__Z20wm_event_do_handlersP8bContext+0x4fc>
100b54a1c:     	ldrh	w9, [x26, #0x12]
100b54a20:     	cmp	w9, #0x2
100b54a24:     	b.ne	0x100b54d54 <__Z20wm_event_do_handlersP8bContext+0x824>
100b54a28:     	strh	wzr, [x21, #0xd6]
100b54a2c:     	mov	x0, x19
100b54a30:     	mov	x1, x21
100b54a34:     	bl	0x1000b4964 <__Z17CTX_wm_window_setP8bContextP8wmWindow>
100b54a38:     	ldr	x8, [x26, #0x48]
100b54a3c:     	cbz	x8, 0x100b54a54 <__Z20wm_event_do_handlersP8bContext+0x524>
100b54a40:     	mov	x0, x19
100b54a44:     	mov	x1, x21
100b54a48:     	mov	x2, x26
100b54a4c:     	bl	0x101f2e89c <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent>
100b54a50:     	tbz	w0, #0x0, 0x100b54bf4 <__Z20wm_event_do_handlersP8bContext+0x6c4>
100b54a54:     	mov	x0, x19
100b54a58:     	mov	x1, x26
100b54a5c:     	bl	0x101f95c08 <__Z34UI_ipad_ring_reopen_cancel_pendingP8bContextPK7wmEvent>
100b54a60:     	str	w0, [sp, #0x18]
100b54a64:     	ldrh	w8, [x26, #0x10]
100b54a68:     	cmp	w8, #0x207
100b54a6c:     	b.ne	0x100b54af4 <__Z20wm_event_do_handlersP8bContext+0x5c4>
100b54a70:     	ldrh	w8, [x26, #0x80]
100b54a74:     	cmp	w8, #0x6
100b54a78:     	b.ne	0x100b55980 <__Z20wm_event_do_handlersP8bContext+0x1450>
100b54a7c:     	ldr	x8, [x26, #0x88]
100b54a80:     	cbz	x8, 0x100b55980 <__Z20wm_event_do_handlersP8bContext+0x1450>
100b54a84:     	adrp	x9, 0x106368000 <_zlibVersion+0x106368000>
100b54a88:     	ldr	x9, [x9, #0x760]
100b54a8c:     	ldr	x9, [x9, #0x8]
100b54a90:     	cbz	x9, 0x100b551d0 <__Z20wm_event_do_handlersP8bContext+0xca0>
100b54a94:     	ldr	x10, [x21, #0x10]
100b54a98:     	lsr	x11, x10, #32
100b54a9c:     	ubfiz	x12, x10, #3, #29
100b54aa0:     	add	x12, x12, #0x8
100b54aa4:     	eor	x12, x12, x11
100b54aa8:     	mov	x13, #0x2d69            ; =11625
100b54aac:     	movk	x13, #0xeb38, lsl #16
100b54ab0:     	movk	x13, #0xea08, lsl #32
100b54ab4:     	movk	x13, #0x9ddf, lsl #48
100b54ab8:     	mul	x12, x12, x13
100b54abc:     	eor	x11, x11, x12, lsr #47
100b54ac0:     	eor	x11, x11, x12
100b54ac4:     	mul	x11, x11, x13
100b54ac8:     	eor	x11, x11, x11, lsr #47
100b54acc:     	mul	x11, x11, x13
100b54ad0:     	fmov	d0, x9
100b54ad4:     	cnt.8b	v0, v0
100b54ad8:     	uaddlv.8b	h0, v0
100b54adc:     	fmov	w12, s0
100b54ae0:     	cmp	x12, #0x1
100b54ae4:     	b.hi	0x100b5514c <__Z20wm_event_do_handlersP8bContext+0xc1c>
100b54ae8:     	sub	x13, x9, #0x1
100b54aec:     	and	x13, x11, x13
100b54af0:     	b	0x100b55160 <__Z20wm_event_do_handlersP8bContext+0xc30>
100b54af4:     	ldr	w8, [sp, #0x18]
100b54af8:     	cbz	w8, 0x100b54b20 <__Z20wm_event_do_handlersP8bContext+0x5f0>
100b54afc:     	mov	w20, #0x2               ; =2
100b54b00:     	cbz	x19, 0x100b54b24 <__Z20wm_event_do_handlersP8bContext+0x5f4>
100b54b04:     	cbz	x26, 0x100b54b24 <__Z20wm_event_do_handlersP8bContext+0x5f4>
100b54b08:     	mov	x0, x19
100b54b0c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b54b10:     	cmp	x0, x21
100b54b14:     	b.ne	0x100b54b24 <__Z20wm_event_do_handlersP8bContext+0x5f4>
100b54b18:     	ldr	x24, [x21, #0x118]
100b54b1c:     	cbnz	x24, 0x100b54c38 <__Z20wm_event_do_handlersP8bContext+0x708>
100b54b20:     	mov	w20, #0x0               ; =0
100b54b24:     	ldr	x8, [x27, #0x218]
100b54b28:     	cbz	x8, 0x100b54b94 <__Z20wm_event_do_handlersP8bContext+0x664>
100b54b2c:     	ldrb	w9, [x8, #0x28]
100b54b30:     	cmp	w9, #0x1
100b54b34:     	b.ne	0x100b54b94 <__Z20wm_event_do_handlersP8bContext+0x664>
100b54b38:     	ldrh	w9, [x26, #0x10]
100b54b3c:     	cmp	w9, #0x11
100b54b40:     	b.eq	0x100b54b4c <__Z20wm_event_do_handlersP8bContext+0x61c>
100b54b44:     	cmp	w9, #0x4
100b54b48:     	b.ne	0x100b54b94 <__Z20wm_event_do_handlersP8bContext+0x664>
100b54b4c:     	ldur	d0, [x26, #0x14]
100b54b50:     	ldur	d1, [x8, #0x2c]
100b54b54:     	sabd.2s	v2, v0, v1
100b54b58:     	dup.2s	v2, v2[1]
100b54b5c:     	saba.2s	v2, v0, v1
100b54b60:     	ucvtf	s0, s2
100b54b64:     	adrp	x8, 0x106d88000 <_build_commit_date>
100b54b68:     	add	x8, x8, #0xe08
100b54b6c:     	mov	w9, #0x2c77             ; =11383
100b54b70:     	ldr	b1, [x8, x9]
100b54b74:     	ucvtf	s1, s1
100b54b78:     	ldr	s2, [x8, #0x2654]
100b54b7c:     	fmul	s1, s2, s1
100b54b80:     	fcmp	s1, s0
100b54b84:     	b.pl	0x100b54b94 <__Z20wm_event_do_handlersP8bContext+0x664>
100b54b88:     	mov	x0, x19
100b54b8c:     	mov	x1, x21
100b54b90:     	bl	0x100b92bc8 <__Z16WM_tooltip_clearP8bContextP8wmWindow>
100b54b94:     	add	x1, x26, #0x14
100b54b98:     	mov	x0, x19
100b54b9c:     	bl	0x100b564fc <__ZL17area_event_insideP8bContextPKi>
100b54ba0:     	mov	x1, x0
100b54ba4:     	mov	x0, x19
100b54ba8:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b54bac:     	mov	x0, x19
100b54bb0:     	bl	0x1000b3bb8 <__Z13CTX_wm_screenPK8bContext>
100b54bb4:     	mov	x22, x0
100b54bb8:     	mov	x0, x19
100b54bbc:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b54bc0:     	mov	x23, #0x0               ; =0
100b54bc4:     	cbz	x22, 0x100b54df4 <__Z20wm_event_do_handlersP8bContext+0x8c4>
100b54bc8:     	mov	x25, x0
100b54bcc:     	cbz	x0, 0x100b54df4 <__Z20wm_event_do_handlersP8bContext+0x8c4>
100b54bd0:     	mov	x0, x22
100b54bd4:     	bl	0x101633618 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b54bd8:     	cbz	w0, 0x100b54dd8 <__Z20wm_event_do_handlersP8bContext+0x8a8>
100b54bdc:     	add	x2, x26, #0x14
100b54be0:     	mov	x0, x25
100b54be4:     	mov	w1, #-0x1               ; =-1
100b54be8:     	bl	0x1016270fc <__Z29ED_area_find_region_xy_visualPK7ScrAreaiPKi>
100b54bec:     	mov	x23, x0
100b54bf0:     	b	0x100b54df4 <__Z20wm_event_do_handlersP8bContext+0x8c4>
100b54bf4:     	mov	x0, x19
100b54bf8:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b54bfc:     	cbz	x0, 0x100b563a4 <__Z20wm_event_do_handlersP8bContext+0x1e74>
100b54c00:     	add	x0, x0, #0x1a0
100b54c04:     	mov	x1, x21
100b54c08:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b54c0c:     	cmn	w0, #0x1
100b54c10:     	b.eq	0x100b563a4 <__Z20wm_event_do_handlersP8bContext+0x1e74>
100b54c14:     	ldr	x0, [x21, #0x168]
100b54c18:     	mov	x1, x26
100b54c1c:     	bl	0x10078fe64 <__Z11BLI_remlinkP8ListBasePv>
100b54c20:     	mov	x0, x21
100b54c24:     	mov	x1, x26
100b54c28:     	bl	0x100b56408 <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent>
100b54c2c:     	b	0x100b545b0 <__Z20wm_event_do_handlersP8bContext+0x80>
100b54c30:     	mov	w20, #0x0               ; =0
100b54c34:     	cbz	x24, 0x100b54b24 <__Z20wm_event_do_handlersP8bContext+0x5f4>
100b54c38:     	mov	x23, x24
100b54c3c:     	ldr	x24, [x24]
100b54c40:     	ldr	w8, [x23, #0x10]
100b54c44:     	cmp	w8, #0x3
100b54c48:     	b.ne	0x100b54c30 <__Z20wm_event_do_handlersP8bContext+0x700>
100b54c4c:     	ldr	x8, [x23, #0x50]
100b54c50:     	cbz	x8, 0x100b54c30 <__Z20wm_event_do_handlersP8bContext+0x700>
100b54c54:     	mov	x0, x19
100b54c58:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b54c5c:     	mov	x25, x0
100b54c60:     	mov	x0, x19
100b54c64:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b54c68:     	mov	x28, x0
100b54c6c:     	str	xzr, [sp, #0x50]
100b54c70:     	str	xzr, [sp, #0x120]
100b54c74:     	add	x3, sp, #0x50
100b54c78:     	add	x4, sp, #0x120
100b54c7c:     	mov	x0, x19
100b54c80:     	mov	x1, x23
100b54c84:     	mov	x2, x26
100b54c88:     	bl	0x100b573b0 <__ZL34wm_handler_op_context_get_if_validP8bContextP17wmEventHandler_OpPK7wmEventPP7ScrAreaPP7ARegion>
100b54c8c:     	ldr	x1, [sp, #0x50]
100b54c90:     	mov	x0, x19
100b54c94:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b54c98:     	ldr	x1, [sp, #0x120]
100b54c9c:     	mov	x0, x19
100b54ca0:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b54ca4:     	mov	x0, x19
100b54ca8:     	mov	x1, x21
100b54cac:     	mov	x2, x26
100b54cb0:     	mov	x3, x23
100b54cb4:     	mov	w4, #0x0                ; =0
100b54cb8:     	bl	0x100b515c8 <__ZL32wm_ipad_pencil_paint_modal_admitP8bContextP8wmWindowPK7wmEventPK17wmEventHandler_Opb>
100b54cbc:     	mov	x22, x0
100b54cc0:     	cmp	w0, #0x2
100b54cc4:     	b.ne	0x100b55be4 <__Z20wm_event_do_handlersP8bContext+0x16b4>
100b54cc8:     	ldr	x8, [x23, #0x20]
100b54ccc:     	cbz	x8, 0x100b5599c <__Z20wm_event_do_handlersP8bContext+0x146c>
100b54cd0:     	ldr	x20, [x8, #0x58]
100b54cd4:     	mov	x0, x19
100b54cd8:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b54cdc:     	ldr	x8, [x0, #0x5c0]
100b54ce0:     	ldrb	w8, [x8, #0x10]
100b54ce4:     	cmp	w8, #0x1
100b54ce8:     	b.ne	0x100b54cf4 <__Z20wm_event_do_handlersP8bContext+0x7c4>
100b54cec:     	ldrh	w8, [x20, #0xe4]
100b54cf0:     	tbz	w8, #0x9, 0x100b5599c <__Z20wm_event_do_handlersP8bContext+0x146c>
100b54cf4:     	mov	x0, x19
100b54cf8:     	mov	x1, x25
100b54cfc:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b54d00:     	mov	x0, x19
100b54d04:     	mov	x1, x28
100b54d08:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b54d0c:     	add	x1, x21, #0x118
100b54d10:     	mov	x0, x19
100b54d14:     	mov	x2, x23
100b54d18:     	mov	x3, x26
100b54d1c:     	mov	x4, #0x0                ; =0
100b54d20:     	mov	x5, #0x0                ; =0
100b54d24:     	mov	w6, #0x0                ; =0
100b54d28:     	bl	0x100b5194c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb>
100b54d2c:     	mov	x0, x19
100b54d30:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b54d34:     	cmp	x0, x21
100b54d38:     	b.ne	0x100b559b4 <__Z20wm_event_do_handlersP8bContext+0x1484>
100b54d3c:     	add	x0, x21, #0x118
100b54d40:     	mov	x1, x23
100b54d44:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b54d48:     	cmn	w0, #0x1
100b54d4c:     	b.eq	0x100b54c30 <__Z20wm_event_do_handlersP8bContext+0x700>
100b54d50:     	b	0x100b559b4 <__Z20wm_event_do_handlersP8bContext+0x1484>
100b54d54:     	cmp	w8, #0x4
100b54d58:     	b.eq	0x100b54dbc <__Z20wm_event_do_handlersP8bContext+0x88c>
100b54d5c:     	cmp	w8, #0x11
100b54d60:     	b.eq	0x100b54dbc <__Z20wm_event_do_handlersP8bContext+0x88c>
100b54d64:     	adrp	x8, 0x106658000 <__ZN7blender3seq28seqModifierType_WhiteBalanceE+0x40>
100b54d68:     	add	x8, x8, #0x298
100b54d6c:     	ldr	x8, [x8]
100b54d70:     	ldr	x0, [x8, #0x8]
100b54d74:     	cbnz	x0, 0x100b54d90 <__Z20wm_event_do_handlersP8bContext+0x860>
100b54d78:     	mov	x0, x8
100b54d7c:     	bl	0x100ae37f8 <__Z15CLG_logref_initP10CLG_LogRef>
100b54d80:     	adrp	x8, 0x106658000 <__ZN7blender3seq28seqModifierType_WhiteBalanceE+0x40>
100b54d84:     	add	x8, x8, #0x298
100b54d88:     	ldr	x8, [x8]
100b54d8c:     	ldr	x0, [x8, #0x8]
100b54d90:     	ldr	w8, [x0, #0x50]
100b54d94:     	cmp	w8, #0x4
100b54d98:     	b.lt	0x100b54dbc <__Z20wm_event_do_handlersP8bContext+0x88c>
100b54d9c:     	mov	w1, #0x4                ; =4
100b54da0:     	adrp	x2, 0x104bd0000 <__ZL3hex+0x434d>
100b54da4:     	add	x2, x2, #0x7ce
100b54da8:     	adrp	x3, 0x104bd0000 <__ZL3hex+0x434d>
100b54dac:     	add	x3, x3, #0x72a
100b54db0:     	adrp	x4, 0x104bd0000 <__ZL3hex+0x434d>
100b54db4:     	add	x4, x4, #0x80a
100b54db8:     	bl	0x100ae2b1c <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b54dbc:     	ldr	x0, [x21, #0x168]
100b54dc0:     	mov	x1, x26
100b54dc4:     	bl	0x10078fe64 <__Z11BLI_remlinkP8ListBasePv>
100b54dc8:     	mov	x0, x21
100b54dcc:     	mov	x1, x26
100b54dd0:     	bl	0x100b56408 <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent>
100b54dd4:     	b	0x100b545b0 <__Z20wm_event_do_handlersP8bContext+0x80>
100b54dd8:     	add	x23, x25, #0x78
100b54ddc:     	ldr	x23, [x23]
100b54de0:     	cbz	x23, 0x100b54df4 <__Z20wm_event_do_handlersP8bContext+0x8c4>
100b54de4:     	add	x0, x23, #0xa8
100b54de8:     	add	x1, x26, #0x14
100b54dec:     	bl	0x1007fc848 <__Z19BLI_rcti_isect_pt_vPK4rctiPKi>
100b54df0:     	cbz	w0, 0x100b54ddc <__Z20wm_event_do_handlersP8bContext+0x8ac>
100b54df4:     	mov	x0, x19
100b54df8:     	mov	x1, x23
100b54dfc:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b54e00:     	ldr	x0, [sp, #0x28]
100b54e04:     	mov	x1, x21
100b54e08:     	bl	0x100b95034 <__Z23wm_window_make_drawableP15wmWindowManagerP8wmWindow>
100b54e0c:     	mov	x0, x19
100b54e10:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b54e14:     	cbz	x0, 0x100b54e34 <__Z20wm_event_do_handlersP8bContext+0x904>
100b54e18:     	ldr	w8, [x0, #0xa8]
100b54e1c:     	ldp	w9, w10, [x26, #0x14]
100b54e20:     	sub	w8, w9, w8
100b54e24:     	str	w8, [x26, #0x1c]
100b54e28:     	ldr	w8, [x0, #0xb0]
100b54e2c:     	sub	w8, w10, w8
100b54e30:     	b	0x100b54e3c <__Z20wm_event_do_handlersP8bContext+0x90c>
100b54e34:     	mov	w8, #-0x1               ; =-1
100b54e38:     	str	w8, [x26, #0x1c]
100b54e3c:     	str	w8, [x26, #0x20]
100b54e40:     	ldrh	w8, [x26, #0x10]
100b54e44:     	cmp	w8, #0x208
100b54e48:     	b.ne	0x100b54e9c <__Z20wm_event_do_handlersP8bContext+0x96c>
100b54e4c:     	str	xzr, [sp, #0x50]
100b54e50:     	str	xzr, [sp, #0x120]
100b54e54:     	stur	xzr, [x29, #-0x80]
100b54e58:     	add	x3, sp, #0x50
100b54e5c:     	add	x4, sp, #0x120
100b54e60:     	sub	x5, x29, #0x80
100b54e64:     	mov	x0, x19
100b54e68:     	mov	x1, x21
100b54e6c:     	mov	x2, x26
100b54e70:     	bl	0x100b56630 <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion>
100b54e74:     	cbz	w0, 0x100b54ec4 <__Z20wm_event_do_handlersP8bContext+0x994>
100b54e78:     	ldr	x2, [sp, #0x50]
100b54e7c:     	add	x1, x21, #0x118
100b54e80:     	mov	x0, x19
100b54e84:     	mov	x3, x26
100b54e88:     	mov	x4, #0x0                ; =0
100b54e8c:     	mov	x5, #0x0                ; =0
100b54e90:     	mov	w6, #0x0                ; =0
100b54e94:     	bl	0x100b5194c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb>
100b54e98:     	b	0x100b54ec4 <__Z20wm_event_do_handlersP8bContext+0x994>
100b54e9c:     	and	w8, w20, #0xff
100b54ea0:     	cmp	w8, #0x2
100b54ea4:     	ldr	x9, [sp, #0x10]
100b54ea8:     	b.eq	0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b54eac:     	cmp	w8, #0x1
100b54eb0:     	b.ne	0x100b54ecc <__Z20wm_event_do_handlersP8bContext+0x99c>
100b54eb4:     	add	x2, x21, #0x118
100b54eb8:     	mov	x0, x19
100b54ebc:     	mov	x1, x26
100b54ec0:     	bl	0x100b56784 <__ZL14wm_handlers_doP8bContextP7wmEventP8ListBase>
100b54ec4:     	orr	w24, w0, #0x3
100b54ec8:     	b	0x100b54f18 <__Z20wm_event_do_handlersP8bContext+0x9e8>
100b54ecc:     	ldr	x8, [x9]
100b54ed0:     	cbz	x8, 0x100b55210 <__Z20wm_event_do_handlersP8bContext+0xce0>
100b54ed4:     	ldr	x8, [x9, #0x10]
100b54ed8:     	cbz	x8, 0x100b55210 <__Z20wm_event_do_handlersP8bContext+0xce0>
100b54edc:     	ldr	x8, [x9, #0x30]
100b54ee0:     	cbz	x8, 0x100b55210 <__Z20wm_event_do_handlersP8bContext+0xce0>
100b54ee4:     	ldr	x8, [x9, #0x88]
100b54ee8:     	cbz	x8, 0x100b55210 <__Z20wm_event_do_handlersP8bContext+0xce0>
100b54eec:     	ldr	x8, [x9, #0x98]
100b54ef0:     	cbz	x8, 0x100b55210 <__Z20wm_event_do_handlersP8bContext+0xce0>
100b54ef4:     	ldr	w8, [sp, #0x18]
100b54ef8:     	tbnz	w8, #0x0, 0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b54efc:     	ldrh	w8, [x26, #0x10]
100b54f00:     	cmp	w8, #0x207
100b54f04:     	b.ne	0x100b554a8 <__Z20wm_event_do_handlersP8bContext+0xf78>
100b54f08:     	mov	x0, x19
100b54f0c:     	mov	x1, x26
100b54f10:     	bl	0x101f35f5c <__Z27UI_ipad_ring_event_dispatchP8bContextPK7wmEvent>
100b54f14:     	mov	w24, #0x3               ; =3
100b54f18:     	mov	x0, x19
100b54f1c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b54f20:     	cbz	x0, 0x100b56290 <__Z20wm_event_do_handlersP8bContext+0x1d60>
100b54f24:     	mov	x0, x21
100b54f28:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b54f2c:     	cmp	x27, x0
100b54f30:     	b.eq	0x100b550f8 <__Z20wm_event_do_handlersP8bContext+0xbc8>
100b54f34:     	tst	w24, #0x3
100b54f38:     	b.ne	0x100b54f68 <__Z20wm_event_do_handlersP8bContext+0xa38>
100b54f3c:     	mov	x0, x21
100b54f40:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b54f44:     	bl	0x101633618 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b54f48:     	cbz	w0, 0x100b54f68 <__Z20wm_event_do_handlersP8bContext+0xa38>
100b54f4c:     	mov	x0, x19
100b54f50:     	mov	x1, x21
100b54f54:     	mov	x2, x26
100b54f58:     	bl	0x1016427f4 <__Z27ED_ipad_panels_handle_eventP8bContextP8wmWindowPK7wmEvent>
100b54f5c:     	cbz	w0, 0x100b54f68 <__Z20wm_event_do_handlersP8bContext+0xa38>
100b54f60:     	sturh	wzr, [x21, #0xdb]
100b54f64:     	orr	w24, w24, #0x3
100b54f68:     	mov	x0, x21
100b54f6c:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b54f70:     	ldr	x8, [sp, #0x28]
100b54f74:     	ldr	x8, [x8, #0x5c0]
100b54f78:     	ldr	x8, [x8, #0xb8]
100b54f7c:     	cbz	x8, 0x100b54fc0 <__Z20wm_event_do_handlersP8bContext+0xa90>
100b54f80:     	mov	x23, x0
100b54f84:     	mov	w8, #0x0                ; =0
100b54f88:     	ldrh	w9, [x26, #0x10]
100b54f8c:     	cmp	w9, #0xab
100b54f90:     	b.le	0x100b55130 <__Z20wm_event_do_handlersP8bContext+0xc00>
100b54f94:     	sub	w9, w9, #0xac
100b54f98:     	cmp	w9, #0x2e
100b54f9c:     	b.hi	0x100b54fc0 <__Z20wm_event_do_handlersP8bContext+0xa90>
100b54fa0:     	mov	w10, #0x1               ; =1
100b54fa4:     	lsl	x10, x10, x9
100b54fa8:     	mov	x11, #0x81              ; =129
100b54fac:     	movk	x11, #0x3f00, lsl #32
100b54fb0:     	tst	x10, x11
100b54fb4:     	b.eq	0x100b553e4 <__Z20wm_event_do_handlersP8bContext+0xeb4>
100b54fb8:     	mov	w9, #0x1                ; =1
100b54fbc:     	strb	w9, [x23, #0x1f4]
100b54fc0:     	orr	w28, w8, w24
100b54fc4:     	tbnz	w28, #0x0, 0x100b557cc <__Z20wm_event_do_handlersP8bContext+0x129c>
100b54fc8:     	ldrh	w8, [x26, #0x10]
100b54fcc:     	cmp	w8, #0x4
100b54fd0:     	b.ne	0x100b5551c <__Z20wm_event_do_handlersP8bContext+0xfec>
100b54fd4:     	add	x2, x26, #0x14
100b54fd8:     	mov	x0, x19
100b54fdc:     	mov	x1, x21
100b54fe0:     	bl	0x10162f2f0 <__Z27ED_screen_set_active_regionP8bContextP8wmWindowPKi>
100b54fe4:     	mov	x0, x19
100b54fe8:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b54fec:     	mov	x24, x0
100b54ff0:     	ldr	x8, [x0, #0x5c0]
100b54ff4:     	ldr	x8, [x8, #0x78]
100b54ff8:     	cbz	x8, 0x100b5551c <__Z20wm_event_do_handlersP8bContext+0xfec>
100b54ffc:     	mov	x0, x19
100b55000:     	bl	0x1000b3bb8 <__Z13CTX_wm_screenPK8bContext>
100b55004:     	cbz	x0, 0x100b55050 <__Z20wm_event_do_handlersP8bContext+0xb20>
100b55008:     	ldr	x23, [x0, #0x1f8]
100b5500c:     	cbz	x23, 0x100b55050 <__Z20wm_event_do_handlersP8bContext+0xb20>
100b55010:     	mov	x0, x19
100b55014:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b55018:     	mov	x25, x0
100b5501c:     	mov	x0, x19
100b55020:     	mov	x1, x23
100b55024:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b55028:     	ldr	x8, [x24, #0x5c0]
100b5502c:     	ldr	x20, [x8, #0x78]
100b55030:     	cbnz	x20, 0x100b550cc <__Z20wm_event_do_handlersP8bContext+0xb9c>
100b55034:     	mov	x0, x19
100b55038:     	mov	x1, x25
100b5503c:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b55040:     	add	x0, x23, #0xa8
100b55044:     	add	x1, x26, #0x94
100b55048:     	bl	0x1007fc848 <__Z19BLI_rcti_isect_pt_vPK4rctiPKi>
100b5504c:     	tbnz	w0, #0x0, 0x100b5551c <__Z20wm_event_do_handlersP8bContext+0xfec>
100b55050:     	mov	x0, x19
100b55054:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b55058:     	mov	x23, x0
100b5505c:     	mov	x0, x19
100b55060:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b55064:     	str	x0, [sp, #0x18]
100b55068:     	add	x1, x26, #0x94
100b5506c:     	mov	x0, x19
100b55070:     	bl	0x100b564fc <__ZL17area_event_insideP8bContextPKi>
100b55074:     	mov	x1, x0
100b55078:     	mov	x0, x19
100b5507c:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b55080:     	mov	x0, x19
100b55084:     	bl	0x1000b3bb8 <__Z13CTX_wm_screenPK8bContext>
100b55088:     	mov	x20, x0
100b5508c:     	mov	x0, x19
100b55090:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b55094:     	mov	x25, #0x0               ; =0
100b55098:     	cbz	x20, 0x100b554dc <__Z20wm_event_do_handlersP8bContext+0xfac>
100b5509c:     	mov	x22, x0
100b550a0:     	cbz	x0, 0x100b554dc <__Z20wm_event_do_handlersP8bContext+0xfac>
100b550a4:     	mov	x0, x20
100b550a8:     	bl	0x101633618 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b550ac:     	cbz	w0, 0x100b554c0 <__Z20wm_event_do_handlersP8bContext+0xf90>
100b550b0:     	add	x2, x26, #0x94
100b550b4:     	mov	x0, x22
100b550b8:     	mov	w1, #-0x1               ; =-1
100b550bc:     	bl	0x1016270fc <__Z29ED_area_find_region_xy_visualPK7ScrAreaiPKi>
100b550c0:     	mov	x25, x0
100b550c4:     	b	0x100b554dc <__Z20wm_event_do_handlersP8bContext+0xfac>
100b550c8:     	cbz	x20, 0x100b55034 <__Z20wm_event_do_handlersP8bContext+0xb04>
100b550cc:     	ldr	x8, [x20, #0x18]
100b550d0:     	ldr	x20, [x20]
100b550d4:     	cbz	x8, 0x100b550e4 <__Z20wm_event_do_handlersP8bContext+0xbb4>
100b550d8:     	mov	x0, x19
100b550dc:     	blr	x8
100b550e0:     	cbz	w0, 0x100b550c8 <__Z20wm_event_do_handlersP8bContext+0xb98>
100b550e4:     	mov	x0, x19
100b550e8:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b550ec:     	mov	x1, x23
100b550f0:     	bl	0x100b49de0 <__Z26WM_paint_cursor_tag_redrawP8wmWindowP7ARegion>
100b550f4:     	b	0x100b550c8 <__Z20wm_event_do_handlersP8bContext+0xb98>
100b550f8:     	ldr	x8, [x27, #0x218]
100b550fc:     	cbz	x8, 0x100b54f34 <__Z20wm_event_do_handlersP8bContext+0xa04>
100b55100:     	ldr	x8, [x8]
100b55104:     	cbz	x8, 0x100b54f34 <__Z20wm_event_do_handlersP8bContext+0xa04>
100b55108:     	ldrh	w9, [x26, #0x10]
100b5510c:     	cmp	w9, #0x110
100b55110:     	b.ne	0x100b54f34 <__Z20wm_event_do_handlersP8bContext+0xa04>
100b55114:     	ldr	x9, [x26, #0x88]
100b55118:     	cmp	x9, x8
100b5511c:     	b.ne	0x100b54f34 <__Z20wm_event_do_handlersP8bContext+0xa04>
100b55120:     	mov	x0, x19
100b55124:     	mov	x1, x21
100b55128:     	bl	0x100b92924 <__Z15WM_tooltip_initP8bContextP8wmWindow>
100b5512c:     	b	0x100b54f34 <__Z20wm_event_do_handlersP8bContext+0xa04>
100b55130:     	cmp	w9, #0x1
100b55134:     	b.eq	0x100b55410 <__Z20wm_event_do_handlersP8bContext+0xee0>
100b55138:     	cmp	w9, #0x3
100b5513c:     	b.eq	0x100b553ec <__Z20wm_event_do_handlersP8bContext+0xebc>
100b55140:     	cmp	w9, #0x4
100b55144:     	b.eq	0x100b54fb8 <__Z20wm_event_do_handlersP8bContext+0xa88>
100b55148:     	b	0x100b54fc0 <__Z20wm_event_do_handlersP8bContext+0xa90>
100b5514c:     	mov	x13, x11
100b55150:     	cmp	x11, x9
100b55154:     	b.lo	0x100b55160 <__Z20wm_event_do_handlersP8bContext+0xc30>
100b55158:     	udiv	x13, x11, x9
100b5515c:     	msub	x13, x13, x9, x11
100b55160:     	adrp	x14, 0x106368000 <_zlibVersion+0x106368000>
100b55164:     	ldr	x14, [x14, #0x760]
100b55168:     	ldr	x14, [x14]
100b5516c:     	ldr	x14, [x14, x13, lsl #3]
100b55170:     	cbz	x14, 0x100b551cc <__Z20wm_event_do_handlersP8bContext+0xc9c>
100b55174:     	ldr	x14, [x14]
100b55178:     	cbz	x14, 0x100b551cc <__Z20wm_event_do_handlersP8bContext+0xc9c>
100b5517c:     	sub	x15, x9, #0x1
100b55180:     	b	0x100b55198 <__Z20wm_event_do_handlersP8bContext+0xc68>
100b55184:     	ldr	x16, [x14, #0x10]
100b55188:     	cmp	x16, x10
100b5518c:     	b.eq	0x100b55974 <__Z20wm_event_do_handlersP8bContext+0x1444>
100b55190:     	ldr	x14, [x14]
100b55194:     	cbz	x14, 0x100b551cc <__Z20wm_event_do_handlersP8bContext+0xc9c>
100b55198:     	ldr	x16, [x14, #0x8]
100b5519c:     	cmp	x16, x11
100b551a0:     	b.eq	0x100b55184 <__Z20wm_event_do_handlersP8bContext+0xc54>
100b551a4:     	cmp	x12, #0x1
100b551a8:     	b.hi	0x100b551b4 <__Z20wm_event_do_handlersP8bContext+0xc84>
100b551ac:     	and	x16, x16, x15
100b551b0:     	b	0x100b551c4 <__Z20wm_event_do_handlersP8bContext+0xc94>
100b551b4:     	cmp	x16, x9
100b551b8:     	b.lo	0x100b551c4 <__Z20wm_event_do_handlersP8bContext+0xc94>
100b551bc:     	udiv	x17, x16, x9
100b551c0:     	msub	x16, x17, x9, x16
100b551c4:     	cmp	x16, x13
100b551c8:     	b.eq	0x100b55190 <__Z20wm_event_do_handlersP8bContext+0xc60>
100b551cc:     	mov	x9, #0x0                ; =0
100b551d0:     	mov	x10, #0x0               ; =0
100b551d4:     	ldr	x11, [x8]
100b551d8:     	cbz	x11, 0x100b55980 <__Z20wm_event_do_handlersP8bContext+0x1450>
100b551dc:     	cmp	x11, x9
100b551e0:     	b.ne	0x100b55980 <__Z20wm_event_do_handlersP8bContext+0x1450>
100b551e4:     	ldr	x9, [x8, #0x8]
100b551e8:     	sub	x9, x9, #0x1
100b551ec:     	cmp	x9, x10
100b551f0:     	b.hs	0x100b55980 <__Z20wm_event_do_handlersP8bContext+0x1450>
100b551f4:     	ldr	w9, [x8, #0x18]
100b551f8:     	cmp	w9, #0x7
100b551fc:     	b.hi	0x100b55980 <__Z20wm_event_do_handlersP8bContext+0x1450>
100b55200:     	cbz	w9, 0x100b54afc <__Z20wm_event_do_handlersP8bContext+0x5cc>
100b55204:     	ldr	x8, [x8, #0x20]
100b55208:     	cbnz	x8, 0x100b54afc <__Z20wm_event_do_handlersP8bContext+0x5cc>
100b5520c:     	b	0x100b55980 <__Z20wm_event_do_handlersP8bContext+0x1450>
100b55210:     	str	xzr, [sp, #0x1d0]
100b55214:     	movi.16b	v0, #0x0
100b55218:     	stp	q0, q0, [sp, #0x1b0]
100b5521c:     	stp	q0, q0, [sp, #0x190]
100b55220:     	stp	q0, q0, [sp, #0x170]
100b55224:     	stp	q0, q0, [sp, #0x150]
100b55228:     	stp	q0, q0, [sp, #0x130]
100b5522c:     	str	q0, [sp, #0x120]
100b55230:     	str	xzr, [sp, #0x30]
100b55234:     	ldr	x23, [x26, #0x48]
100b55238:     	str	x23, [sp, #0x48]
100b5523c:     	cbz	x23, 0x100b55448 <__Z20wm_event_do_handlersP8bContext+0xf18>
100b55240:     	ldr	x20, [x26, #0x50]
100b55244:     	cbz	x20, 0x100b55448 <__Z20wm_event_do_handlersP8bContext+0xf18>
100b55248:     	mov	x0, x19
100b5524c:     	mov	x1, x21
100b55250:     	mov	x2, x23
100b55254:     	bl	0x10163e084 <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy>
100b55258:     	cbz	w0, 0x100b54ef4 <__Z20wm_event_do_handlersP8bContext+0x9c4>
100b5525c:     	ldrh	w8, [x26, #0x10]
100b55260:     	cmp	w8, #0x1
100b55264:     	b.ne	0x100b552fc <__Z20wm_event_do_handlersP8bContext+0xdcc>
100b55268:     	ldrh	w8, [x26, #0x12]
100b5526c:     	cmp	w8, #0x1
100b55270:     	b.ne	0x100b552fc <__Z20wm_event_do_handlersP8bContext+0xdcc>
100b55274:     	stur	xzr, [x29, #-0x80]
100b55278:     	str	xzr, [sp, #0x100]
100b5527c:     	movi.16b	v0, #0x0
100b55280:     	stp	q0, q0, [sp, #0xe0]
100b55284:     	stp	q0, q0, [sp, #0xc0]
100b55288:     	stp	q0, q0, [sp, #0xa0]
100b5528c:     	stp	q0, q0, [sp, #0x80]
100b55290:     	stp	q0, q0, [sp, #0x60]
100b55294:     	str	q0, [sp, #0x50]
100b55298:     	str	xzr, [sp, #0x40]
100b5529c:     	add	x2, x26, #0x14
100b552a0:     	sub	x3, x29, #0x80
100b552a4:     	add	x4, sp, #0x50
100b552a8:     	add	x5, sp, #0x40
100b552ac:     	mov	x0, x19
100b552b0:     	mov	x1, x21
100b552b4:     	bl	0x10163e6dc <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion>
100b552b8:     	ldr	x23, [sp, #0x48]
100b552bc:     	cbz	w0, 0x100b55c20 <__Z20wm_event_do_handlersP8bContext+0x16f0>
100b552c0:     	ldur	x8, [x29, #-0x80]
100b552c4:     	cmp	x8, x23
100b552c8:     	b.ne	0x100b55c20 <__Z20wm_event_do_handlersP8bContext+0x16f0>
100b552cc:     	ldr	x8, [sp, #0x50]
100b552d0:     	cbz	x8, 0x100b55c20 <__Z20wm_event_do_handlersP8bContext+0x16f0>
100b552d4:     	ldr	x8, [sp, #0x60]
100b552d8:     	cbz	x8, 0x100b55c20 <__Z20wm_event_do_handlersP8bContext+0x16f0>
100b552dc:     	ldr	x8, [sp, #0x80]
100b552e0:     	cbz	x8, 0x100b55c20 <__Z20wm_event_do_handlersP8bContext+0x16f0>
100b552e4:     	ldr	x8, [sp, #0xd8]
100b552e8:     	cbz	x8, 0x100b55c20 <__Z20wm_event_do_handlersP8bContext+0x16f0>
100b552ec:     	ldr	x8, [sp, #0xe8]
100b552f0:     	cbz	x8, 0x100b55c20 <__Z20wm_event_do_handlersP8bContext+0x16f0>
100b552f4:     	ldr	x8, [sp, #0x40]
100b552f8:     	cbz	x8, 0x100b55c20 <__Z20wm_event_do_handlersP8bContext+0x16f0>
100b552fc:     	add	x3, sp, #0x120
100b55300:     	add	x4, sp, #0x30
100b55304:     	mov	x0, x19
100b55308:     	mov	x1, x21
100b5530c:     	mov	x2, x23
100b55310:     	bl	0x10163e1d8 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion>
100b55314:     	tbz	w0, #0x0, 0x100b55c0c <__Z20wm_event_do_handlersP8bContext+0x16dc>
100b55318:     	ldr	x8, [sp, #0x30]
100b5531c:     	cbz	x8, 0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b55320:     	ldrh	w8, [x26, #0x10]
100b55324:     	cmp	w8, #0x11
100b55328:     	b.hi	0x100b55344 <__Z20wm_event_do_handlersP8bContext+0xe14>
100b5532c:     	mov	w9, #0x1                ; =1
100b55330:     	lsl	w9, w9, w8
100b55334:     	mov	w10, #0x12              ; =18
100b55338:     	movk	w10, #0x2, lsl #16
100b5533c:     	tst	w9, w10
100b55340:     	b.ne	0x100b5534c <__Z20wm_event_do_handlersP8bContext+0xe1c>
100b55344:     	cmp	w8, #0x104
100b55348:     	b.ne	0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b5534c:     	mov	x0, x21
100b55350:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b55354:     	add	x23, x0, #0x1c0
100b55358:     	ldr	x8, [sp, #0x158]
100b5535c:     	ldr	x23, [x23]
100b55360:     	cbz	x23, 0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b55364:     	cmp	x8, x23
100b55368:     	b.ne	0x100b5535c <__Z20wm_event_do_handlersP8bContext+0xe2c>
100b5536c:     	ldr	x1, [sp, #0x30]
100b55370:     	add	x0, x23, #0x78
100b55374:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b55378:     	cmn	w0, #0x1
100b5537c:     	b.eq	0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b55380:     	mov	x0, x19
100b55384:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b55388:     	mov	x24, x0
100b5538c:     	mov	x0, x19
100b55390:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b55394:     	mov	x28, x0
100b55398:     	adrp	x8, 0x106d88000 <_build_commit_date>
100b5539c:     	add	x8, x8, #0x28
100b553a0:     	ldr	x22, [x8]
100b553a4:     	mov	x0, x19
100b553a8:     	mov	x1, x23
100b553ac:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b553b0:     	ldr	x1, [sp, #0x30]
100b553b4:     	mov	x0, x19
100b553b8:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b553bc:     	mov	x0, x19
100b553c0:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b553c4:     	cbz	x0, 0x100b55ddc <__Z20wm_event_do_handlersP8bContext+0x18ac>
100b553c8:     	ldr	w8, [x0, #0xa8]
100b553cc:     	ldp	w9, w10, [x26, #0x14]
100b553d0:     	sub	w8, w9, w8
100b553d4:     	str	w8, [x26, #0x1c]
100b553d8:     	ldr	w8, [x0, #0xb0]
100b553dc:     	sub	w8, w10, w8
100b553e0:     	b	0x100b55de4 <__Z20wm_event_do_handlersP8bContext+0x18b4>
100b553e4:     	cmp	x9, #0x2e
100b553e8:     	b.ne	0x100b54fc0 <__Z20wm_event_do_handlersP8bContext+0xa90>
100b553ec:     	ldr	x0, [sp, #0x28]
100b553f0:     	mov	x1, x21
100b553f4:     	bl	0x100b45fec <__Z13wm_drags_exitP15wmWindowManagerP8wmWindow>
100b553f8:     	ldr	x8, [sp, #0x28]
100b553fc:     	ldr	x8, [x8, #0x5c0]
100b55400:     	add	x0, x8, #0xb8
100b55404:     	bl	0x100b468dc <__Z17WM_drag_free_listP8ListBase>
100b55408:     	mov	w8, #0x1                ; =1
100b5540c:     	b	0x100b54fb8 <__Z20wm_event_do_handlersP8bContext+0xa88>
100b55410:     	ldrh	w8, [x26, #0x12]
100b55414:     	cmp	w8, #0x2
100b55418:     	b.ne	0x100b5596c <__Z20wm_event_do_handlersP8bContext+0x143c>
100b5541c:     	mov	w8, #0x5023             ; =20515
100b55420:     	strh	w8, [x26, #0x10]
100b55424:     	ldr	x0, [x26, #0x88]
100b55428:     	cbz	x0, 0x100b55c38 <__Z20wm_event_do_handlersP8bContext+0x1708>
100b5542c:     	ldrh	w8, [x26, #0x82]
100b55430:     	cbz	w8, 0x100b55c38 <__Z20wm_event_do_handlersP8bContext+0x1708>
100b55434:     	ldrh	w8, [x26, #0x80]
100b55438:     	cmp	w8, #0x3
100b5543c:     	b.ne	0x100b55c34 <__Z20wm_event_do_handlersP8bContext+0x1704>
100b55440:     	bl	0x100b468dc <__Z17WM_drag_free_listP8ListBase>
100b55444:     	b	0x100b55c38 <__Z20wm_event_do_handlersP8bContext+0x1708>
100b55448:     	ldrh	w8, [x26, #0x10]
100b5544c:     	cmp	w8, #0x11
100b55450:     	b.hi	0x100b5546c <__Z20wm_event_do_handlersP8bContext+0xf3c>
100b55454:     	mov	w9, #0x1                ; =1
100b55458:     	lsl	w9, w9, w8
100b5545c:     	mov	w10, #0x12              ; =18
100b55460:     	movk	w10, #0x2, lsl #16
100b55464:     	tst	w9, w10
100b55468:     	b.ne	0x100b55474 <__Z20wm_event_do_handlersP8bContext+0xf44>
100b5546c:     	cmp	w8, #0x104
100b55470:     	b.ne	0x100b54ef4 <__Z20wm_event_do_handlersP8bContext+0x9c4>
100b55474:     	str	x21, [sp, #0x40]
100b55478:     	adrp	x9, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b5547c:     	ldr	x9, [x9, #0x7a8]
100b55480:     	cbz	x9, 0x100b55a38 <__Z20wm_event_do_handlersP8bContext+0x1508>
100b55484:     	fmov	d0, x9
100b55488:     	cnt.8b	v0, v0
100b5548c:     	uaddlv.8b	h0, v0
100b55490:     	fmov	w10, s0
100b55494:     	cmp	x10, #0x1
100b55498:     	b.hi	0x100b559bc <__Z20wm_event_do_handlersP8bContext+0x148c>
100b5549c:     	sub	x11, x9, #0x1
100b554a0:     	and	x11, x11, x21
100b554a4:     	b	0x100b559d0 <__Z20wm_event_do_handlersP8bContext+0x14a0>
100b554a8:     	add	x2, x21, #0x118
100b554ac:     	mov	x0, x19
100b554b0:     	mov	x1, x26
100b554b4:     	bl	0x100b56784 <__ZL14wm_handlers_doP8bContextP7wmEventP8ListBase>
100b554b8:     	mov	x24, x0
100b554bc:     	b	0x100b54f18 <__Z20wm_event_do_handlersP8bContext+0x9e8>
100b554c0:     	add	x25, x22, #0x78
100b554c4:     	ldr	x25, [x25]
100b554c8:     	cbz	x25, 0x100b554dc <__Z20wm_event_do_handlersP8bContext+0xfac>
100b554cc:     	add	x0, x25, #0xa8
100b554d0:     	add	x1, x26, #0x94
100b554d4:     	bl	0x1007fc848 <__Z19BLI_rcti_isect_pt_vPK4rctiPKi>
100b554d8:     	cbz	w0, 0x100b554c4 <__Z20wm_event_do_handlersP8bContext+0xf94>
100b554dc:     	mov	x0, x19
100b554e0:     	mov	x1, x25
100b554e4:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b554e8:     	mov	x0, x19
100b554ec:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b554f0:     	mov	x25, x0
100b554f4:     	cbz	x0, 0x100b55504 <__Z20wm_event_do_handlersP8bContext+0xfd4>
100b554f8:     	ldr	x8, [x24, #0x5c0]
100b554fc:     	ldr	x20, [x8, #0x78]
100b55500:     	cbnz	x20, 0x100b556b8 <__Z20wm_event_do_handlersP8bContext+0x1188>
100b55504:     	mov	x0, x19
100b55508:     	mov	x1, x23
100b5550c:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b55510:     	mov	x0, x19
100b55514:     	ldr	x1, [sp, #0x18]
100b55518:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b5551c:     	mov	x0, x21
100b55520:     	mov	x1, x27
100b55524:     	bl	0x101624af8 <__Z26ED_screen_areas_iter_firstPK8wmWindowPK7bScreen>
100b55528:     	b	0x100b55544 <__Z20wm_event_do_handlersP8bContext+0x1014>
100b5552c:     	mov	x0, x19
100b55530:     	mov	x1, #0x0                ; =0
100b55534:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b55538:     	mov	x0, x27
100b5553c:     	mov	x1, x24
100b55540:     	bl	0x101624b1c <__Z25ED_screen_areas_iter_nextPK7bScreenPK7ScrArea>
100b55544:     	mov	x24, x0
100b55548:     	cbz	x0, 0x100b556e8 <__Z20wm_event_do_handlersP8bContext+0x11b8>
100b5554c:     	mov	x0, x27
100b55550:     	bl	0x101633618 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b55554:     	cbz	w0, 0x100b55584 <__Z20wm_event_do_handlersP8bContext+0x1054>
100b55558:     	ldrh	w8, [x26, #0x10]
100b5555c:     	cmp	w8, #0x104
100b55560:     	b.eq	0x100b55584 <__Z20wm_event_do_handlersP8bContext+0x1054>
100b55564:     	and	w8, w8, #0xfff0
100b55568:     	cmp	w8, #0x110
100b5556c:     	b.eq	0x100b55584 <__Z20wm_event_do_handlersP8bContext+0x1054>
100b55570:     	add	x1, x26, #0x14
100b55574:     	mov	x0, x19
100b55578:     	bl	0x100b564fc <__ZL17area_event_insideP8bContextPKi>
100b5557c:     	cmp	x24, x0
100b55580:     	b.ne	0x100b55538 <__Z20wm_event_do_handlersP8bContext+0x1008>
100b55584:     	ldrb	w8, [x27, #0x1f5]
100b55588:     	cbnz	w8, 0x100b556e4 <__Z20wm_event_do_handlersP8bContext+0x11b4>
100b5558c:     	ldrh	w8, [x24, #0x52]
100b55590:     	tbz	w8, #0x8, 0x100b555a0 <__Z20wm_event_do_handlersP8bContext+0x1070>
100b55594:     	add	x1, x26, #0x14
100b55598:     	mov	x0, x24
100b5559c:     	bl	0x101651ddc <__Z21ED_area_azones_updateP7ScrAreaPKi>
100b555a0:     	ldrh	w8, [x26, #0x10]
100b555a4:     	cmp	w8, #0x104
100b555a8:     	b.eq	0x100b555c8 <__Z20wm_event_do_handlersP8bContext+0x1098>
100b555ac:     	and	w8, w8, #0xfff0
100b555b0:     	cmp	w8, #0x110
100b555b4:     	b.eq	0x100b555c8 <__Z20wm_event_do_handlersP8bContext+0x1098>
100b555b8:     	add	x0, x24, #0x38
100b555bc:     	add	x1, x26, #0x14
100b555c0:     	bl	0x1007fc848 <__Z19BLI_rcti_isect_pt_vPK4rctiPKi>
100b555c4:     	cbz	w0, 0x100b55538 <__Z20wm_event_do_handlersP8bContext+0x1008>
100b555c8:     	mov	x0, x19
100b555cc:     	mov	x1, x24
100b555d0:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b555d4:     	ldrh	w8, [x26, #0x10]
100b555d8:     	cmp	w8, #0x104
100b555dc:     	b.eq	0x100b55618 <__Z20wm_event_do_handlersP8bContext+0x10e8>
100b555e0:     	and	w8, w8, #0xfff0
100b555e4:     	cmp	w8, #0x110
100b555e8:     	b.eq	0x100b55618 <__Z20wm_event_do_handlersP8bContext+0x10e8>
100b555ec:     	add	x2, x26, #0x14
100b555f0:     	mov	x0, x24
100b555f4:     	mov	w1, #-0x1               ; =-1
100b555f8:     	bl	0x1016270fc <__Z29ED_area_find_region_xy_visualPK7ScrAreaiPKi>
100b555fc:     	mov	x2, x0
100b55600:     	cbz	x0, 0x100b55644 <__Z20wm_event_do_handlersP8bContext+0x1114>
100b55604:     	mov	x0, x19
100b55608:     	mov	x1, x26
100b5560c:     	bl	0x100b5f550 <__ZL27wm_event_do_region_handlersP8bContextP7wmEventP7ARegion>
100b55610:     	mov	x23, x0
100b55614:     	b	0x100b55648 <__Z20wm_event_do_handlersP8bContext+0x1118>
100b55618:     	ldr	x22, [x24, #0x78]
100b5561c:     	cbz	x22, 0x100b55644 <__Z20wm_event_do_handlersP8bContext+0x1114>
100b55620:     	mov	w23, #0x0               ; =0
100b55624:     	mov	x0, x19
100b55628:     	mov	x1, x26
100b5562c:     	mov	x2, x22
100b55630:     	bl	0x100b5f550 <__ZL27wm_event_do_region_handlersP8bContextP7wmEventP7ARegion>
100b55634:     	orr	w23, w0, w23
100b55638:     	ldr	x22, [x22]
100b5563c:     	cbnz	x22, 0x100b55624 <__Z20wm_event_do_handlersP8bContext+0x10f4>
100b55640:     	b	0x100b55648 <__Z20wm_event_do_handlersP8bContext+0x1118>
100b55644:     	mov	w23, #0x0               ; =0
100b55648:     	mov	x0, x19
100b5564c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b55650:     	cbz	x0, 0x100b5622c <__Z20wm_event_do_handlersP8bContext+0x1cfc>
100b55654:     	mov	x0, x19
100b55658:     	mov	x1, #0x0                ; =0
100b5565c:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b55660:     	orr	w28, w23, w28
100b55664:     	tbnz	w28, #0x0, 0x100b5552c <__Z20wm_event_do_handlersP8bContext+0xffc>
100b55668:     	mov	x0, x19
100b5566c:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b55670:     	cbz	x0, 0x100b55690 <__Z20wm_event_do_handlersP8bContext+0x1160>
100b55674:     	ldr	w8, [x0, #0xa8]
100b55678:     	ldp	w9, w10, [x26, #0x14]
100b5567c:     	sub	w8, w9, w8
100b55680:     	str	w8, [x26, #0x1c]
100b55684:     	ldr	w8, [x0, #0xb0]
100b55688:     	sub	w8, w10, w8
100b5568c:     	b	0x100b55698 <__Z20wm_event_do_handlersP8bContext+0x1168>
100b55690:     	mov	w8, #-0x1               ; =-1
100b55694:     	str	w8, [x26, #0x1c]
100b55698:     	str	w8, [x26, #0x20]
100b5569c:     	add	x2, x24, #0x88
100b556a0:     	mov	x0, x19
100b556a4:     	mov	x1, x26
100b556a8:     	bl	0x100b56784 <__ZL14wm_handlers_doP8bContextP7wmEventP8ListBase>
100b556ac:     	orr	w28, w0, w28
100b556b0:     	b	0x100b5552c <__Z20wm_event_do_handlersP8bContext+0xffc>
100b556b4:     	cbz	x20, 0x100b55504 <__Z20wm_event_do_handlersP8bContext+0xfd4>
100b556b8:     	ldr	x8, [x20, #0x18]
100b556bc:     	ldr	x20, [x20]
100b556c0:     	cbz	x8, 0x100b556d0 <__Z20wm_event_do_handlersP8bContext+0x11a0>
100b556c4:     	mov	x0, x19
100b556c8:     	blr	x8
100b556cc:     	cbz	w0, 0x100b556b4 <__Z20wm_event_do_handlersP8bContext+0x1184>
100b556d0:     	mov	x0, x19
100b556d4:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b556d8:     	mov	x1, x25
100b556dc:     	bl	0x100b49de0 <__Z26WM_paint_cursor_tag_redrawP8wmWindowP7ARegion>
100b556e0:     	b	0x100b556b4 <__Z20wm_event_do_handlersP8bContext+0x1184>
100b556e4:     	strb	wzr, [x27, #0x1f5]
100b556e8:     	tbnz	w28, #0x0, 0x100b557cc <__Z20wm_event_do_handlersP8bContext+0x129c>
100b556ec:     	add	x1, x26, #0x14
100b556f0:     	mov	x0, x19
100b556f4:     	bl	0x100b564fc <__ZL17area_event_insideP8bContextPKi>
100b556f8:     	mov	x1, x0
100b556fc:     	mov	x0, x19
100b55700:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b55704:     	mov	x0, x19
100b55708:     	bl	0x1000b3bb8 <__Z13CTX_wm_screenPK8bContext>
100b5570c:     	mov	x20, x0
100b55710:     	mov	x0, x19
100b55714:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b55718:     	mov	x23, #0x0               ; =0
100b5571c:     	cbz	x20, 0x100b55768 <__Z20wm_event_do_handlersP8bContext+0x1238>
100b55720:     	mov	x22, x0
100b55724:     	cbz	x0, 0x100b55768 <__Z20wm_event_do_handlersP8bContext+0x1238>
100b55728:     	mov	x0, x20
100b5572c:     	bl	0x101633618 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b55730:     	cbz	w0, 0x100b5574c <__Z20wm_event_do_handlersP8bContext+0x121c>
100b55734:     	add	x2, x26, #0x14
100b55738:     	mov	x0, x22
100b5573c:     	mov	w1, #-0x1               ; =-1
100b55740:     	bl	0x1016270fc <__Z29ED_area_find_region_xy_visualPK7ScrAreaiPKi>
100b55744:     	mov	x23, x0
100b55748:     	b	0x100b55768 <__Z20wm_event_do_handlersP8bContext+0x1238>
100b5574c:     	add	x23, x22, #0x78
100b55750:     	ldr	x23, [x23]
100b55754:     	cbz	x23, 0x100b55768 <__Z20wm_event_do_handlersP8bContext+0x1238>
100b55758:     	add	x0, x23, #0xa8
100b5575c:     	add	x1, x26, #0x14
100b55760:     	bl	0x1007fc848 <__Z19BLI_rcti_isect_pt_vPK4rctiPKi>
100b55764:     	cbz	w0, 0x100b55750 <__Z20wm_event_do_handlersP8bContext+0x1220>
100b55768:     	mov	x0, x19
100b5576c:     	mov	x1, x23
100b55770:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b55774:     	mov	x0, x19
100b55778:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5577c:     	cbz	x0, 0x100b5579c <__Z20wm_event_do_handlersP8bContext+0x126c>
100b55780:     	ldr	w8, [x0, #0xa8]
100b55784:     	ldp	w9, w10, [x26, #0x14]
100b55788:     	sub	w8, w9, w8
100b5578c:     	str	w8, [x26, #0x1c]
100b55790:     	ldr	w8, [x0, #0xb0]
100b55794:     	sub	w8, w10, w8
100b55798:     	b	0x100b557a4 <__Z20wm_event_do_handlersP8bContext+0x1274>
100b5579c:     	mov	w8, #-0x1               ; =-1
100b557a0:     	str	w8, [x26, #0x1c]
100b557a4:     	str	w8, [x26, #0x20]
100b557a8:     	add	x2, x21, #0x108
100b557ac:     	mov	x0, x19
100b557b0:     	mov	x1, x26
100b557b4:     	bl	0x100b56784 <__ZL14wm_handlers_doP8bContextP7wmEventP8ListBase>
100b557b8:     	mov	x20, x0
100b557bc:     	mov	x0, x19
100b557c0:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b557c4:     	cbz	x0, 0x100b56320 <__Z20wm_event_do_handlersP8bContext+0x1df0>
100b557c8:     	orr	w28, w20, w28
100b557cc:     	ldrh	w8, [x26, #0x10]
100b557d0:     	cmp	w8, #0x13
100b557d4:     	b.hi	0x100b5580c <__Z20wm_event_do_handlersP8bContext+0x12dc>
100b557d8:     	mov	w9, #0x1                ; =1
100b557dc:     	lsl	w8, w9, w8
100b557e0:     	mov	w9, #0x18e              ; =398
100b557e4:     	movk	w9, #0xc, lsl #16
100b557e8:     	tst	w8, w9
100b557ec:     	b.eq	0x100b5580c <__Z20wm_event_do_handlersP8bContext+0x12dc>
100b557f0:     	ldrh	w8, [x26, #0x12]
100b557f4:     	cmp	w8, #0x1
100b557f8:     	b.ne	0x100b5580c <__Z20wm_event_do_handlersP8bContext+0x12dc>
100b557fc:     	cbz	w28, 0x100b5580c <__Z20wm_event_do_handlersP8bContext+0x12dc>
100b55800:     	cmp	w28, #0x5
100b55804:     	b.eq	0x100b5580c <__Z20wm_event_do_handlersP8bContext+0x12dc>
100b55808:     	strb	wzr, [x21, #0xdb]
100b5580c:     	ldrb	w8, [x21, #0xdd]
100b55810:     	cbz	w8, 0x100b55818 <__Z20wm_event_do_handlersP8bContext+0x12e8>
100b55814:     	strh	wzr, [x21, #0xdc]
100b55818:     	ldr	w8, [sp, #0x24]
100b5581c:     	cbz	w8, 0x100b55828 <__Z20wm_event_do_handlersP8bContext+0x12f8>
100b55820:     	ldrb	w8, [x21, #0xdc]
100b55824:     	cbz	w8, 0x100b55904 <__Z20wm_event_do_handlersP8bContext+0x13d4>
100b55828:     	ldr	x8, [x21, #0xf0]
100b5582c:     	ldr	w9, [x26, #0x14]
100b55830:     	str	w9, [x8, #0x94]
100b55834:     	ldr	w9, [x26, #0x18]
100b55838:     	str	w9, [x8, #0x98]
100b5583c:     	ldr	x0, [x21, #0x168]
100b55840:     	mov	x1, x26
100b55844:     	bl	0x10078fe64 <__Z11BLI_remlinkP8ListBasePv>
100b55848:     	mov	x0, x21
100b5584c:     	mov	x1, x26
100b55850:     	bl	0x100b56408 <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent>
100b55854:     	mov	x0, x19
100b55858:     	bl	0x1016615f0 <__Z21ED_undo_touch_recoverP8bContext>
100b5585c:     	cbnz	w0, 0x100b562d0 <__Z20wm_event_do_handlersP8bContext+0x1da0>
100b55860:     	mov	x0, x19
100b55864:     	bl	0x1000b4c78 <__Z13CTX_data_mainPK8bContext>
100b55868:     	mov	x23, x0
100b5586c:     	ldr	x8, [sp, #0x28]
100b55870:     	ldr	w22, [x8, #0x144]
100b55874:     	ldr	w20, [x21, #0xc0]
100b55878:     	mov	x0, x19
100b5587c:     	mov	w1, #0x0                ; =0
100b55880:     	bl	0x101f95f80 <__Z25UI_ipad_ring_reopen_flushP8bContextb>
100b55884:     	mov	x0, x19
100b55888:     	bl	0x1000b4c78 <__Z13CTX_data_mainPK8bContext>
100b5588c:     	cmp	x0, x23
100b55890:     	b.ne	0x100b56224 <__Z20wm_event_do_handlersP8bContext+0x1cf4>
100b55894:     	mov	x0, x19
100b55898:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b5589c:     	ldr	x8, [sp, #0x28]
100b558a0:     	cmp	x0, x8
100b558a4:     	b.ne	0x100b56224 <__Z20wm_event_do_handlersP8bContext+0x1cf4>
100b558a8:     	mov	x0, x19
100b558ac:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b558b0:     	cmp	x0, x21
100b558b4:     	b.ne	0x100b56224 <__Z20wm_event_do_handlersP8bContext+0x1cf4>
100b558b8:     	add	x0, x23, #0x678
100b558bc:     	ldr	x1, [sp, #0x28]
100b558c0:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b558c4:     	cmn	w0, #0x1
100b558c8:     	b.eq	0x100b56224 <__Z20wm_event_do_handlersP8bContext+0x1cf4>
100b558cc:     	ldr	x8, [sp, #0x28]
100b558d0:     	ldr	w8, [x8, #0x144]
100b558d4:     	cmp	w8, w22
100b558d8:     	b.ne	0x100b56224 <__Z20wm_event_do_handlersP8bContext+0x1cf4>
100b558dc:     	ldr	x8, [sp, #0x28]
100b558e0:     	add	x0, x8, #0x1a0
100b558e4:     	mov	x1, x21
100b558e8:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b558ec:     	cmn	w0, #0x1
100b558f0:     	b.eq	0x100b56224 <__Z20wm_event_do_handlersP8bContext+0x1cf4>
100b558f4:     	ldr	w8, [x21, #0xc0]
100b558f8:     	cmp	w8, w20
100b558fc:     	b.eq	0x100b545b0 <__Z20wm_event_do_handlersP8bContext+0x80>
100b55900:     	b	0x100b56224 <__Z20wm_event_do_handlersP8bContext+0x1cf4>
100b55904:     	mov	x0, x21
100b55908:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b5590c:     	mov	x23, x0
100b55910:     	cbz	x0, 0x100b55828 <__Z20wm_event_do_handlersP8bContext+0x12f8>
100b55914:     	mov	x0, x21
100b55918:     	mov	x1, x23
100b5591c:     	bl	0x101624af8 <__Z26ED_screen_areas_iter_firstPK8wmWindowPK7bScreen>
100b55920:     	b	0x100b55930 <__Z20wm_event_do_handlersP8bContext+0x1400>
100b55924:     	mov	x0, x23
100b55928:     	mov	x1, x24
100b5592c:     	bl	0x101624b1c <__Z25ED_screen_areas_iter_nextPK7bScreenPK7ScrArea>
100b55930:     	mov	x24, x0
100b55934:     	cbz	x0, 0x100b55828 <__Z20wm_event_do_handlersP8bContext+0x12f8>
100b55938:     	ldr	x25, [x24, #0x78]
100b5593c:     	cbnz	x25, 0x100b5594c <__Z20wm_event_do_handlersP8bContext+0x141c>
100b55940:     	b	0x100b55924 <__Z20wm_event_do_handlersP8bContext+0x13f4>
100b55944:     	ldr	x25, [x25]
100b55948:     	cbz	x25, 0x100b55924 <__Z20wm_event_do_handlersP8bContext+0x13f4>
100b5594c:     	ldr	x8, [x25, #0x128]
100b55950:     	ldr	x0, [x8, #0x288]
100b55954:     	cbz	x0, 0x100b55944 <__Z20wm_event_do_handlersP8bContext+0x1414>
100b55958:     	bl	0x100b3f900 <__Z45WM_gizmomap_tag_delay_refresh_for_tweak_checkP10wmGizmoMap>
100b5595c:     	cbz	w0, 0x100b55944 <__Z20wm_event_do_handlersP8bContext+0x1414>
100b55960:     	mov	x0, x25
100b55964:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
100b55968:     	b	0x100b55944 <__Z20wm_event_do_handlersP8bContext+0x1414>
100b5596c:     	mov	w8, #0x0                ; =0
100b55970:     	b	0x100b54fc0 <__Z20wm_event_do_handlersP8bContext+0xa90>
100b55974:     	ldp	x9, x10, [x14, #0x18]
100b55978:     	ldr	x11, [x8]
100b5597c:     	cbnz	x11, 0x100b551dc <__Z20wm_event_do_handlersP8bContext+0xcac>
100b55980:     	ldr	x0, [x21, #0x168]
100b55984:     	mov	x1, x26
100b55988:     	bl	0x10078fe64 <__Z11BLI_remlinkP8ListBasePv>
100b5598c:     	mov	x0, x21
100b55990:     	mov	x1, x26
100b55994:     	bl	0x100b56408 <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent>
100b55998:     	b	0x100b545b0 <__Z20wm_event_do_handlersP8bContext+0x80>
100b5599c:     	mov	x0, x19
100b559a0:     	mov	x1, x25
100b559a4:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b559a8:     	mov	x0, x19
100b559ac:     	mov	x1, x28
100b559b0:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b559b4:     	mov	w20, #0x2               ; =2
100b559b8:     	b	0x100b54b24 <__Z20wm_event_do_handlersP8bContext+0x5f4>
100b559bc:     	mov	x11, x21
100b559c0:     	cmp	x9, x21
100b559c4:     	b.hi	0x100b559d0 <__Z20wm_event_do_handlersP8bContext+0x14a0>
100b559c8:     	udiv	x11, x21, x9
100b559cc:     	msub	x11, x11, x9, x21
100b559d0:     	adrp	x12, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b559d4:     	ldr	x12, [x12, #0x7a0]
100b559d8:     	ldr	x12, [x12, x11, lsl #3]
100b559dc:     	cbz	x12, 0x100b55a38 <__Z20wm_event_do_handlersP8bContext+0x1508>
100b559e0:     	ldr	x1, [x12]
100b559e4:     	cbz	x1, 0x100b55a38 <__Z20wm_event_do_handlersP8bContext+0x1508>
100b559e8:     	sub	x12, x9, #0x1
100b559ec:     	b	0x100b55a04 <__Z20wm_event_do_handlersP8bContext+0x14d4>
100b559f0:     	ldr	x13, [x1, #0x10]
100b559f4:     	cmp	x13, x21
100b559f8:     	b.eq	0x100b55c64 <__Z20wm_event_do_handlersP8bContext+0x1734>
100b559fc:     	ldr	x1, [x1]
100b55a00:     	cbz	x1, 0x100b55a38 <__Z20wm_event_do_handlersP8bContext+0x1508>
100b55a04:     	ldr	x13, [x1, #0x8]
100b55a08:     	cmp	x13, x21
100b55a0c:     	b.eq	0x100b559f0 <__Z20wm_event_do_handlersP8bContext+0x14c0>
100b55a10:     	cmp	x10, #0x1
100b55a14:     	b.hi	0x100b55a20 <__Z20wm_event_do_handlersP8bContext+0x14f0>
100b55a18:     	and	x13, x13, x12
100b55a1c:     	b	0x100b55a30 <__Z20wm_event_do_handlersP8bContext+0x1500>
100b55a20:     	cmp	x13, x9
100b55a24:     	b.lo	0x100b55a30 <__Z20wm_event_do_handlersP8bContext+0x1500>
100b55a28:     	udiv	x14, x13, x9
100b55a2c:     	msub	x13, x14, x9, x13
100b55a30:     	cmp	x13, x11
100b55a34:     	b.eq	0x100b559fc <__Z20wm_event_do_handlersP8bContext+0x14cc>
100b55a38:     	ldrh	w8, [x26, #0x10]
100b55a3c:     	cmp	w8, #0x1
100b55a40:     	b.ne	0x100b54ef4 <__Z20wm_event_do_handlersP8bContext+0x9c4>
100b55a44:     	ldrh	w8, [x26, #0x12]
100b55a48:     	cmp	w8, #0x1
100b55a4c:     	b.ne	0x100b54ef4 <__Z20wm_event_do_handlersP8bContext+0x9c4>
100b55a50:     	add	x2, x26, #0x14
100b55a54:     	add	x3, sp, #0x48
100b55a58:     	add	x4, sp, #0x120
100b55a5c:     	add	x5, sp, #0x30
100b55a60:     	mov	x0, x19
100b55a64:     	mov	x1, x21
100b55a68:     	bl	0x10163e6dc <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion>
100b55a6c:     	cbz	w0, 0x100b54ef4 <__Z20wm_event_do_handlersP8bContext+0x9c4>
100b55a70:     	ldr	x20, [sp, #0x48]
100b55a74:     	ldrh	w8, [x26, #0x10]
100b55a78:     	cmp	w8, #0x1
100b55a7c:     	b.ne	0x100b55ba0 <__Z20wm_event_do_handlersP8bContext+0x1670>
100b55a80:     	adrp	x8, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b55a84:     	add	x8, x8, #0x7b0
100b55a88:     	ldr	x9, [x8, #0x8]
100b55a8c:     	mov	x8, x20
100b55a90:     	cmp	x9, #0x40
100b55a94:     	b.lo	0x100b55b48 <__Z20wm_event_do_handlersP8bContext+0x1618>
100b55a98:     	adrp	x8, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b55a9c:     	add	x8, x8, #0x7b0
100b55aa0:     	ldr	x1, [x8]
100b55aa4:     	mov	x8, x20
100b55aa8:     	cbnz	x1, 0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x1588>
100b55aac:     	b	0x100b55b48 <__Z20wm_event_do_handlersP8bContext+0x1618>
100b55ab0:     	ldr	x1, [x1]
100b55ab4:     	cbz	x1, 0x100b55b44 <__Z20wm_event_do_handlersP8bContext+0x1614>
100b55ab8:     	adrp	x8, 0x106d88000 <_build_commit_date>
100b55abc:     	add	x8, x8, #0x28
100b55ac0:     	ldr	x8, [x8]
100b55ac4:     	ldr	x8, [x8, #0x678]
100b55ac8:     	cbz	x8, 0x100b55b18 <__Z20wm_event_do_handlersP8bContext+0x15e8>
100b55acc:     	mov	w9, #0x0                ; =0
100b55ad0:     	b	0x100b55adc <__Z20wm_event_do_handlersP8bContext+0x15ac>
100b55ad4:     	ldr	x8, [x8]
100b55ad8:     	cbz	x8, 0x100b55b14 <__Z20wm_event_do_handlersP8bContext+0x15e4>
100b55adc:     	ldr	x10, [x8, #0x1a0]
100b55ae0:     	cbz	x10, 0x100b55ad4 <__Z20wm_event_do_handlersP8bContext+0x15a4>
100b55ae4:     	ldr	x11, [x1, #0x10]
100b55ae8:     	b	0x100b55af4 <__Z20wm_event_do_handlersP8bContext+0x15c4>
100b55aec:     	ldr	x10, [x10]
100b55af0:     	cbz	x10, 0x100b55ad4 <__Z20wm_event_do_handlersP8bContext+0x15a4>
100b55af4:     	cmp	x11, x10
100b55af8:     	b.ne	0x100b55aec <__Z20wm_event_do_handlersP8bContext+0x15bc>
100b55afc:     	ldrsw	x12, [x10, #0xc0]
100b55b00:     	ldr	x13, [x1, #0xd0]
100b55b04:     	cmp	x13, x12
100b55b08:     	cset	w12, eq
100b55b0c:     	orr	w9, w12, w9
100b55b10:     	b	0x100b55aec <__Z20wm_event_do_handlersP8bContext+0x15bc>
100b55b14:     	tbnz	w9, #0x0, 0x100b55ab0 <__Z20wm_event_do_handlersP8bContext+0x1580>
100b55b18:     	ldr	x22, [x1]
100b55b1c:     	add	x8, sp, #0x50
100b55b20:     	adrp	x0, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b55b24:     	add	x0, x0, #0x7a0
100b55b28:     	bl	0x100b43e20 <__ZNSt3__112__hash_tableIiNS_4hashIiEENS_8equal_toIiEENS_9allocatorIiEEE6removeENS_21__hash_const_iteratorIPNS_11__hash_nodeIiPvEEEE>
100b55b2c:     	ldr	x0, [sp, #0x50]
100b55b30:     	str	xzr, [sp, #0x50]
100b55b34:     	cbz	x0, 0x100b55b3c <__Z20wm_event_do_handlersP8bContext+0x160c>
100b55b38:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b55b3c:     	mov	x1, x22
100b55b40:     	cbnz	x1, 0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x1588>
100b55b44:     	ldr	x8, [sp, #0x48]
100b55b48:     	ldp	q0, q1, [sp, #0x1a0]
100b55b4c:     	stp	q0, q1, [sp, #0xd0]
100b55b50:     	ldr	q0, [sp, #0x1c0]
100b55b54:     	str	q0, [sp, #0xf0]
100b55b58:     	ldr	x9, [sp, #0x1d0]
100b55b5c:     	ldp	q0, q1, [sp, #0x160]
100b55b60:     	stp	q0, q1, [sp, #0x90]
100b55b64:     	ldp	q0, q1, [sp, #0x180]
100b55b68:     	stp	q0, q1, [sp, #0xb0]
100b55b6c:     	ldp	q0, q1, [sp, #0x120]
100b55b70:     	stp	q0, q1, [sp, #0x50]
100b55b74:     	ldp	q0, q1, [sp, #0x140]
100b55b78:     	stp	q0, q1, [sp, #0x70]
100b55b7c:     	ldrsw	x10, [x21, #0xc0]
100b55b80:     	stp	x9, x10, [sp, #0x100]
100b55b84:     	str	x8, [sp, #0x110]
100b55b88:     	add	x1, sp, #0x40
100b55b8c:     	add	x2, sp, #0x40
100b55b90:     	add	x3, sp, #0x50
100b55b94:     	adrp	x0, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b55b98:     	add	x0, x0, #0x7a0
100b55b9c:     	bl	0x100b5f238 <__ZNSt3__112__hash_tableINS_17__hash_value_typeIm26wmIPadKnifeHardwareContactEENS_22__unordered_map_hasherImS3_NS_4hashImEENS_8equal_toImEELb1EEENS_21__unordered_map_equalImS3_S8_S6_Lb1EEENS_9allocatorIS3_EEE25__emplace_unique_key_argsImJRKmS2_EEENS_4pairINS_15__hash_iteratorIPNS_11__hash_nodeIS3_PvEEEEbEERKT_DpOT0_>
100b55ba0:     	ldr	x8, [sp, #0x120]
100b55ba4:     	cbz	x8, 0x100b55bd0 <__Z20wm_event_do_handlersP8bContext+0x16a0>
100b55ba8:     	ldr	x8, [sp, #0x130]
100b55bac:     	cbz	x8, 0x100b55bd0 <__Z20wm_event_do_handlersP8bContext+0x16a0>
100b55bb0:     	ldr	x8, [sp, #0x150]
100b55bb4:     	cbz	x8, 0x100b55bd0 <__Z20wm_event_do_handlersP8bContext+0x16a0>
100b55bb8:     	ldr	x8, [sp, #0x1a8]
100b55bbc:     	cbz	x8, 0x100b55bd0 <__Z20wm_event_do_handlersP8bContext+0x16a0>
100b55bc0:     	ldr	x8, [sp, #0x1b8]
100b55bc4:     	cbz	x8, 0x100b55bd0 <__Z20wm_event_do_handlersP8bContext+0x16a0>
100b55bc8:     	ldr	x8, [sp, #0x30]
100b55bcc:     	cbnz	x8, 0x100b55318 <__Z20wm_event_do_handlersP8bContext+0xde8>
100b55bd0:     	ldr	x2, [sp, #0x48]
100b55bd4:     	mov	x0, x19
100b55bd8:     	mov	x1, x21
100b55bdc:     	bl	0x10163eb50 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy>
100b55be0:     	b	0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b55be4:     	mov	x0, x19
100b55be8:     	mov	x1, x25
100b55bec:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b55bf0:     	mov	x0, x19
100b55bf4:     	mov	x1, x28
100b55bf8:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b55bfc:     	cmp	w22, #0x1
100b55c00:     	mov	w8, #0x1                ; =1
100b55c04:     	cinc	w20, w8, eq
100b55c08:     	b	0x100b54b24 <__Z20wm_event_do_handlersP8bContext+0x5f4>
100b55c0c:     	ldr	x2, [sp, #0x48]
100b55c10:     	mov	x0, x19
100b55c14:     	mov	x1, x21
100b55c18:     	bl	0x10163eb50 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy>
100b55c1c:     	b	0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b55c20:     	mov	x0, x19
100b55c24:     	mov	x1, x21
100b55c28:     	mov	x2, x23
100b55c2c:     	bl	0x10163eb50 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy>
100b55c30:     	b	0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b55c34:     	bl	0x100ae425c <_MEM_freeN>
100b55c38:     	mov	w8, #0x0                ; =0
100b55c3c:     	str	xzr, [x26, #0x88]
100b55c40:     	mov	w9, #0x3                ; =3
100b55c44:     	str	w9, [x26, #0x80]
100b55c48:     	ldr	x9, [sp, #0x28]
100b55c4c:     	ldr	x9, [x9, #0x5c0]
100b55c50:     	add	x9, x9, #0xb8
100b55c54:     	str	x9, [x26, #0x88]
100b55c58:     	mov	w9, #0x1                ; =1
100b55c5c:     	strh	w9, [x26, #0x82]
100b55c60:     	b	0x100b54fb8 <__Z20wm_event_do_handlersP8bContext+0xa88>
100b55c64:     	ldr	x9, [x1, #0xd0]
100b55c68:     	ldrsw	x10, [x21, #0xc0]
100b55c6c:     	cmp	x9, x10
100b55c70:     	b.eq	0x100b55cd8 <__Z20wm_event_do_handlersP8bContext+0x17a8>
100b55c74:     	cmp	w8, #0x1
100b55c78:     	b.ne	0x100b55c98 <__Z20wm_event_do_handlersP8bContext+0x1768>
100b55c7c:     	ldrh	w8, [x26, #0x12]
100b55c80:     	cmp	w8, #0x1
100b55c84:     	b.ne	0x100b55c98 <__Z20wm_event_do_handlersP8bContext+0x1768>
100b55c88:     	adrp	x0, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b55c8c:     	add	x0, x0, #0x7a0
100b55c90:     	bl	0x100b5f1f8 <__ZNSt3__113unordered_mapIm26wmIPadKnifeHardwareContactNS_4hashImEENS_8equal_toImEENS_9allocatorINS_4pairIKmS1_EEEEE5eraseB8ne190102ENS_19__hash_map_iteratorINS_15__hash_iteratorIPNS_11__hash_nodeINS_17__hash_value_typeImS1_EEPvEEEEEE>
100b55c94:     	b	0x100b55a38 <__Z20wm_event_do_handlersP8bContext+0x1508>
100b55c98:     	str	xzr, [x1, #0xc8]
100b55c9c:     	movi.16b	v0, #0x0
100b55ca0:     	stur	q0, [x1, #0xb8]
100b55ca4:     	stur	q0, [x1, #0xa8]
100b55ca8:     	stur	q0, [x1, #0x98]
100b55cac:     	stur	q0, [x1, #0x88]
100b55cb0:     	stur	q0, [x1, #0x78]
100b55cb4:     	stur	q0, [x1, #0x68]
100b55cb8:     	stur	q0, [x1, #0x58]
100b55cbc:     	stur	q0, [x1, #0x48]
100b55cc0:     	stur	q0, [x1, #0x38]
100b55cc4:     	stur	q0, [x1, #0x28]
100b55cc8:     	stur	q0, [x1, #0x18]
100b55ccc:     	ldrsw	x8, [x21, #0xc0]
100b55cd0:     	stp	x8, xzr, [x1, #0xd0]
100b55cd4:     	ldrh	w8, [x26, #0x10]
100b55cd8:     	cmp	w8, #0x1
100b55cdc:     	b.ne	0x100b55d70 <__Z20wm_event_do_handlersP8bContext+0x1840>
100b55ce0:     	ldrh	w8, [x26, #0x12]
100b55ce4:     	cmp	w8, #0x1
100b55ce8:     	b.ne	0x100b55ef4 <__Z20wm_event_do_handlersP8bContext+0x19c4>
100b55cec:     	ldr	x20, [x1, #0xd8]
100b55cf0:     	add	x8, sp, #0x50
100b55cf4:     	adrp	x0, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b55cf8:     	add	x0, x0, #0x7a0
100b55cfc:     	bl	0x100b43e20 <__ZNSt3__112__hash_tableIiNS_4hashIiEENS_8equal_toIiEENS_9allocatorIiEEE6removeENS_21__hash_const_iteratorIPNS_11__hash_nodeIiPvEEEE>
100b55d00:     	ldr	x0, [sp, #0x50]
100b55d04:     	str	xzr, [sp, #0x50]
100b55d08:     	cbz	x0, 0x100b55d10 <__Z20wm_event_do_handlersP8bContext+0x17e0>
100b55d0c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b55d10:     	mov	x0, x19
100b55d14:     	mov	x1, x21
100b55d18:     	mov	x2, x20
100b55d1c:     	bl	0x10163eb50 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy>
100b55d20:     	adrp	x8, 0x106d88000 <_build_commit_date>
100b55d24:     	add	x8, x8, #0x28
100b55d28:     	ldr	x8, [x8]
100b55d2c:     	cbz	x8, 0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b55d30:     	ldr	x20, [x8, #0x678]
100b55d34:     	cbz	x20, 0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b55d38:     	mov	x22, #0x0               ; =0
100b55d3c:     	b	0x100b55d50 <__Z20wm_event_do_handlersP8bContext+0x1820>
100b55d40:     	mov	x8, x22
100b55d44:     	ldr	x20, [x20]
100b55d48:     	mov	x22, x8
100b55d4c:     	cbz	x20, 0x100b56054 <__Z20wm_event_do_handlersP8bContext+0x1b24>
100b55d50:     	add	x0, x20, #0x1a0
100b55d54:     	mov	x1, x21
100b55d58:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b55d5c:     	cmn	w0, #0x1
100b55d60:     	b.eq	0x100b55d40 <__Z20wm_event_do_handlersP8bContext+0x1810>
100b55d64:     	mov	x8, x20
100b55d68:     	cbz	x22, 0x100b55d44 <__Z20wm_event_do_handlersP8bContext+0x1814>
100b55d6c:     	b	0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b55d70:     	ldur	q0, [x1, #0xa8]
100b55d74:     	ldur	q1, [x1, #0xb8]
100b55d78:     	stp	q0, q1, [sp, #0xe0]
100b55d7c:     	ldur	q0, [x1, #0xc8]
100b55d80:     	str	q0, [sp, #0x100]
100b55d84:     	ldr	x9, [x1, #0xd8]
100b55d88:     	str	x9, [sp, #0x110]
100b55d8c:     	ldur	q0, [x1, #0x68]
100b55d90:     	ldur	q1, [x1, #0x78]
100b55d94:     	stp	q0, q1, [sp, #0xa0]
100b55d98:     	ldur	q0, [x1, #0x88]
100b55d9c:     	ldur	q1, [x1, #0x98]
100b55da0:     	stp	q0, q1, [sp, #0xc0]
100b55da4:     	ldur	q0, [x1, #0x28]
100b55da8:     	ldur	q1, [x1, #0x38]
100b55dac:     	stp	q0, q1, [sp, #0x60]
100b55db0:     	ldur	q0, [x1, #0x48]
100b55db4:     	ldur	q1, [x1, #0x58]
100b55db8:     	stp	q0, q1, [sp, #0x80]
100b55dbc:     	ldur	q0, [x1, #0x18]
100b55dc0:     	str	q0, [sp, #0x50]
100b55dc4:     	mov	x20, x9
100b55dc8:     	str	x20, [sp, #0x48]
100b55dcc:     	mov	x2, x20
100b55dd0:     	cmp	w8, #0x104
100b55dd4:     	b.eq	0x100b55f5c <__Z20wm_event_do_handlersP8bContext+0x1a2c>
100b55dd8:     	b	0x100b55f80 <__Z20wm_event_do_handlersP8bContext+0x1a50>
100b55ddc:     	mov	w8, #-0x1               ; =-1
100b55de0:     	str	w8, [x26, #0x1c]
100b55de4:     	str	w8, [x26, #0x20]
100b55de8:     	ldp	q0, q1, [sp, #0x120]
100b55dec:     	ldr	x10, [sp, #0x10]
100b55df0:     	stp	q0, q1, [x10]
100b55df4:     	ldp	q0, q1, [sp, #0x1a0]
100b55df8:     	stp	q0, q1, [x10, #0x80]
100b55dfc:     	ldr	q0, [sp, #0x1c0]
100b55e00:     	str	q0, [x10, #0xa0]
100b55e04:     	ldr	x8, [sp, #0x1d0]
100b55e08:     	ldp	q0, q1, [sp, #0x160]
100b55e0c:     	stp	q0, q1, [x10, #0x40]
100b55e10:     	ldp	q0, q1, [sp, #0x180]
100b55e14:     	stp	q0, q1, [x10, #0x60]
100b55e18:     	ldp	q0, q1, [sp, #0x140]
100b55e1c:     	stp	q0, q1, [x10, #0x20]
100b55e20:     	ldr	x9, [sp, #0x48]
100b55e24:     	stp	x8, x9, [x10, #0xb0]
100b55e28:     	str	x20, [x10, #0xc0]
100b55e2c:     	ldr	w8, [x26, #0x14]
100b55e30:     	str	w8, [x10, #0xc8]
100b55e34:     	ldr	w8, [x26, #0x18]
100b55e38:     	str	w8, [x10, #0xcc]
100b55e3c:     	ldrh	w8, [x26, #0x10]
100b55e40:     	cmp	w8, #0x1
100b55e44:     	b.ne	0x100b55e64 <__Z20wm_event_do_handlersP8bContext+0x1934>
100b55e48:     	ldrh	w8, [x26, #0x12]
100b55e4c:     	cmp	w8, #0x2
100b55e50:     	b.ne	0x100b55e64 <__Z20wm_event_do_handlersP8bContext+0x1934>
100b55e54:     	ldrb	w8, [x26, #0x7c]
100b55e58:     	tst	w8, #0x40
100b55e5c:     	cset	w8, eq
100b55e60:     	b	0x100b55e68 <__Z20wm_event_do_handlersP8bContext+0x1938>
100b55e64:     	mov	w8, #0x0                ; =0
100b55e68:     	ldr	x9, [sp, #0x10]
100b55e6c:     	strb	w8, [x9, #0xd0]
100b55e70:     	mov	x0, x19
100b55e74:     	mov	x1, x26
100b55e78:     	bl	0x101f34954 <__Z30UI_ipad_knife_hud_event_handleP8bContextPK7wmEvent>
100b55e7c:     	ldr	x8, [sp, #0x10]
100b55e80:     	strh	wzr, [x8, #0xd0]
100b55e84:     	movi.16b	v0, #0x0
100b55e88:     	stp	q0, q0, [x8, #0xb0]
100b55e8c:     	stp	q0, q0, [x8, #0x90]
100b55e90:     	stp	q0, q0, [x8, #0x70]
100b55e94:     	stp	q0, q0, [x8, #0x50]
100b55e98:     	stp	q0, q0, [x8, #0x30]
100b55e9c:     	stp	q0, q0, [x8, #0x10]
100b55ea0:     	str	q0, [x8]
100b55ea4:     	adrp	x8, 0x106d88000 <_build_commit_date>
100b55ea8:     	add	x8, x8, #0x28
100b55eac:     	ldr	x8, [x8]
100b55eb0:     	cbz	x8, 0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b55eb4:     	ldr	x20, [x8, #0x678]
100b55eb8:     	cbz	x20, 0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b55ebc:     	mov	x25, #0x0               ; =0
100b55ec0:     	b	0x100b55ed4 <__Z20wm_event_do_handlersP8bContext+0x19a4>
100b55ec4:     	mov	x23, x25
100b55ec8:     	ldr	x20, [x20]
100b55ecc:     	mov	x25, x23
100b55ed0:     	cbz	x20, 0x100b55fc0 <__Z20wm_event_do_handlersP8bContext+0x1a90>
100b55ed4:     	add	x0, x20, #0x1a0
100b55ed8:     	mov	x1, x21
100b55edc:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b55ee0:     	cmn	w0, #0x1
100b55ee4:     	b.eq	0x100b55ec4 <__Z20wm_event_do_handlersP8bContext+0x1994>
100b55ee8:     	mov	x23, x20
100b55eec:     	cbz	x25, 0x100b55ec8 <__Z20wm_event_do_handlersP8bContext+0x1998>
100b55ef0:     	b	0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b55ef4:     	ldur	q0, [x1, #0xa8]
100b55ef8:     	ldur	q1, [x1, #0xb8]
100b55efc:     	stp	q0, q1, [sp, #0xe0]
100b55f00:     	ldur	q0, [x1, #0xc8]
100b55f04:     	str	q0, [sp, #0x100]
100b55f08:     	ldr	x9, [x1, #0xd8]
100b55f0c:     	str	x9, [sp, #0x110]
100b55f10:     	ldur	q0, [x1, #0x68]
100b55f14:     	ldur	q1, [x1, #0x78]
100b55f18:     	stp	q0, q1, [sp, #0xa0]
100b55f1c:     	ldur	q0, [x1, #0x88]
100b55f20:     	ldur	q1, [x1, #0x98]
100b55f24:     	stp	q0, q1, [sp, #0xc0]
100b55f28:     	ldur	q0, [x1, #0x28]
100b55f2c:     	ldur	q1, [x1, #0x38]
100b55f30:     	stp	q0, q1, [sp, #0x60]
100b55f34:     	ldur	q0, [x1, #0x48]
100b55f38:     	ldur	q1, [x1, #0x58]
100b55f3c:     	stp	q0, q1, [sp, #0x80]
100b55f40:     	ldur	q0, [x1, #0x18]
100b55f44:     	str	q0, [sp, #0x50]
100b55f48:     	mov	x20, x9
100b55f4c:     	str	x20, [sp, #0x48]
100b55f50:     	mov	x2, x20
100b55f54:     	cmp	w8, #0x2
100b55f58:     	b.ne	0x100b55f80 <__Z20wm_event_do_handlersP8bContext+0x1a50>
100b55f5c:     	sub	x8, x29, #0x80
100b55f60:     	adrp	x0, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b55f64:     	add	x0, x0, #0x7a0
100b55f68:     	bl	0x100b43e20 <__ZNSt3__112__hash_tableIiNS_4hashIiEENS_8equal_toIiEENS_9allocatorIiEEE6removeENS_21__hash_const_iteratorIPNS_11__hash_nodeIiPvEEEE>
100b55f6c:     	ldur	x0, [x29, #-0x80]
100b55f70:     	stur	xzr, [x29, #-0x80]
100b55f74:     	cbz	x0, 0x100b55f7c <__Z20wm_event_do_handlersP8bContext+0x1a4c>
100b55f78:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b55f7c:     	ldr	x2, [sp, #0x48]
100b55f80:     	add	x3, sp, #0x120
100b55f84:     	add	x4, sp, #0x30
100b55f88:     	mov	x0, x19
100b55f8c:     	mov	x1, x21
100b55f90:     	bl	0x10163e1d8 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion>
100b55f94:     	cbz	w0, 0x100b55fac <__Z20wm_event_do_handlersP8bContext+0x1a7c>
100b55f98:     	add	x0, sp, #0x120
100b55f9c:     	add	x1, sp, #0x50
100b55fa0:     	mov	w2, #0xb8               ; =184
100b55fa4:     	bl	0x104b72368 <_zlibVersion+0x104b72368>
100b55fa8:     	cbz	w0, 0x100b55318 <__Z20wm_event_do_handlersP8bContext+0xde8>
100b55fac:     	ldr	x2, [sp, #0x48]
100b55fb0:     	mov	x0, x19
100b55fb4:     	mov	x1, x21
100b55fb8:     	bl	0x10163eb50 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy>
100b55fbc:     	b	0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b55fc0:     	adrp	x8, 0x106d88000 <_build_commit_date>
100b55fc4:     	add	x8, x8, #0x28
100b55fc8:     	ldr	x8, [x8]
100b55fcc:     	cmp	x8, x22
100b55fd0:     	ccmp	x23, #0x0, #0x4, eq
100b55fd4:     	b.eq	0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b55fd8:     	mov	x0, x19
100b55fdc:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b55fe0:     	cmp	x0, x23
100b55fe4:     	b.ne	0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b55fe8:     	mov	x0, x19
100b55fec:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b55ff0:     	cmp	x0, x21
100b55ff4:     	b.ne	0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b55ff8:     	mov	x0, x21
100b55ffc:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b56000:     	mov	x20, x0
100b56004:     	cbz	x0, 0x100b5606c <__Z20wm_event_do_handlersP8bContext+0x1b3c>
100b56008:     	adrp	x8, 0x106d88000 <_build_commit_date>
100b5600c:     	add	x8, x8, #0x28
100b56010:     	ldr	x8, [x8]
100b56014:     	add	x0, x8, #0x598
100b56018:     	mov	x1, x20
100b5601c:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b56020:     	cmn	w0, #0x1
100b56024:     	b.eq	0x100b5606c <__Z20wm_event_do_handlersP8bContext+0x1b3c>
100b56028:     	add	x1, x20, #0x1c0
100b5602c:     	ldr	x1, [x1]
100b56030:     	cbz	x1, 0x100b56070 <__Z20wm_event_do_handlersP8bContext+0x1b40>
100b56034:     	cmp	x1, x24
100b56038:     	b.ne	0x100b5602c <__Z20wm_event_do_handlersP8bContext+0x1afc>
100b5603c:     	add	x23, x1, #0x78
100b56040:     	ldr	x23, [x23]
100b56044:     	cbz	x23, 0x100b56074 <__Z20wm_event_do_handlersP8bContext+0x1b44>
100b56048:     	cmp	x23, x28
100b5604c:     	b.ne	0x100b56040 <__Z20wm_event_do_handlersP8bContext+0x1b10>
100b56050:     	b	0x100b56074 <__Z20wm_event_do_handlersP8bContext+0x1b44>
100b56054:     	cbz	x8, 0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b56058:     	mov	x0, x19
100b5605c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b56060:     	cmp	x0, x21
100b56064:     	b.ne	0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b56068:     	b	0x100b55a38 <__Z20wm_event_do_handlersP8bContext+0x1508>
100b5606c:     	mov	x1, #0x0                ; =0
100b56070:     	mov	x23, #0x0               ; =0
100b56074:     	mov	x0, x19
100b56078:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b5607c:     	mov	x0, x19
100b56080:     	mov	x1, x23
100b56084:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b56088:     	sturh	wzr, [x21, #0xdb]
100b5608c:     	b	0x100b54f14 <__Z20wm_event_do_handlersP8bContext+0x9e4>
100b56090:     	ldrb	w8, [x21, #0x100]
100b56094:     	cbz	w8, 0x100b56190 <__Z20wm_event_do_handlersP8bContext+0x1c60>
100b56098:     	ldr	x8, [x21, #0xf0]
100b5609c:     	cbz	x8, 0x100b56190 <__Z20wm_event_do_handlersP8bContext+0x1c60>
100b560a0:     	ldr	q0, [x8]
100b560a4:     	str	q0, [sp, #0x30]
100b560a8:     	ldp	w20, w22, [x8, #0x14]
100b560ac:     	ldur	q0, [x8, #0x3c]
100b560b0:     	ldur	q1, [x8, #0x4c]
100b560b4:     	stp	q0, q1, [sp, #0x70]
100b560b8:     	ldur	q0, [x8, #0x5c]
100b560bc:     	ldur	q1, [x8, #0x6c]
100b560c0:     	stp	q0, q1, [sp, #0x90]
100b560c4:     	ldur	q0, [x8, #0x1c]
100b560c8:     	ldur	q1, [x8, #0x2c]
100b560cc:     	stp	q0, q1, [sp, #0x50]
100b560d0:     	ldr	q0, [x8, #0x80]
100b560d4:     	ldr	w9, [x8, #0x90]
100b560d8:     	str	w9, [sp, #0x130]
100b560dc:     	str	q0, [sp, #0x120]
100b560e0:     	ldr	w9, [x8, #0xac]
100b560e4:     	stur	w9, [x29, #-0x70]
100b560e8:     	ldur	q0, [x8, #0x9c]
100b560ec:     	stur	q0, [x29, #-0x80]
100b560f0:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
100b560f4:     	add	x8, x8, #0x6e0
100b560f8:     	ldr	x8, [x8]
100b560fc:     	mov	w0, #0x1                ; =1
100b56100:     	mov	w1, #0xb0               ; =176
100b56104:     	mov	w2, #0x8                ; =8
100b56108:     	adrp	x3, 0x104bd0000 <__ZL3hex+0x434d>
100b5610c:     	add	x3, x3, #0xd1d
100b56110:     	blr	x8
100b56114:     	mov	x1, x0
100b56118:     	ldr	q0, [sp, #0x30]
100b5611c:     	str	q0, [x1]
100b56120:     	mov	w8, #0x4                ; =4
100b56124:     	stp	w8, w20, [x1, #0x10]
100b56128:     	str	w22, [x1, #0x18]
100b5612c:     	ldr	q0, [sp, #0x70]
100b56130:     	ldr	q1, [sp, #0x50]
100b56134:     	stur	q0, [x1, #0x3c]
100b56138:     	ldr	q0, [sp, #0x80]
100b5613c:     	stur	q0, [x1, #0x4c]
100b56140:     	ldr	q0, [sp, #0x90]
100b56144:     	stur	q0, [x1, #0x5c]
100b56148:     	ldr	q0, [sp, #0xa0]
100b5614c:     	stur	q0, [x1, #0x6c]
100b56150:     	stur	q1, [x1, #0x1c]
100b56154:     	ldr	q0, [sp, #0x60]
100b56158:     	stur	q0, [x1, #0x2c]
100b5615c:     	str	wzr, [x1, #0x7c]
100b56160:     	ldr	w8, [sp, #0x130]
100b56164:     	ldr	q0, [sp, #0x120]
100b56168:     	str	q0, [x1, #0x80]
100b5616c:     	stp	w8, w20, [x1, #0x90]
100b56170:     	str	w22, [x1, #0x98]
100b56174:     	ldur	w8, [x29, #-0x70]
100b56178:     	str	w8, [x1, #0xac]
100b5617c:     	ldur	q0, [x29, #-0x80]
100b56180:     	stur	q0, [x1, #0x9c]
100b56184:     	ldr	x0, [x21, #0x168]
100b56188:     	bl	0x10078fe38 <__Z11BLI_addtailP8ListBasePv>
100b5618c:     	strb	wzr, [x21, #0x100]
100b56190:     	mov	x0, x19
100b56194:     	mov	x1, #0x0                ; =0
100b56198:     	bl	0x1000b4964 <__Z17CTX_wm_window_setP8bContextP8wmWindow>
100b5619c:     	ldr	x21, [x21]
100b561a0:     	cbnz	x21, 0x100b545a4 <__Z20wm_event_do_handlersP8bContext+0x74>
100b561a4:     	b	0x100b56204 <__Z20wm_event_do_handlersP8bContext+0x1cd4>
100b561a8:     	ldr	x0, [x21, #0x168]
100b561ac:     	bl	0x10079007c <__Z11BLI_popheadP8ListBase>
100b561b0:     	mov	x23, x0
100b561b4:     	cbz	x0, 0x100b545b0 <__Z20wm_event_do_handlersP8bContext+0x80>
100b561b8:     	ldr	x0, [x23, #0x88]
100b561bc:     	cbz	x0, 0x100b561e0 <__Z20wm_event_do_handlersP8bContext+0x1cb0>
100b561c0:     	ldrh	w8, [x23, #0x82]
100b561c4:     	cbz	w8, 0x100b561e0 <__Z20wm_event_do_handlersP8bContext+0x1cb0>
100b561c8:     	ldrh	w8, [x23, #0x80]
100b561cc:     	cmp	w8, #0x3
100b561d0:     	b.ne	0x100b561dc <__Z20wm_event_do_handlersP8bContext+0x1cac>
100b561d4:     	bl	0x100b468dc <__Z17WM_drag_free_listP8ListBase>
100b561d8:     	b	0x100b561e0 <__Z20wm_event_do_handlersP8bContext+0x1cb0>
100b561dc:     	bl	0x100ae425c <_MEM_freeN>
100b561e0:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
100b561e4:     	add	x8, x8, #0x690
100b561e8:     	ldr	x8, [x8]
100b561ec:     	mov	x0, x23
100b561f0:     	mov	w1, #0x0                ; =0
100b561f4:     	blr	x8
100b561f8:     	ldr	x0, [x21, #0x168]
100b561fc:     	bl	0x10079007c <__Z11BLI_popheadP8ListBase>
100b56200:     	b	0x100b561b0 <__Z20wm_event_do_handlersP8bContext+0x1c80>
100b56204:     	ldr	x0, [sp, #0x28]
100b56208:     	bl	0x100b73ebc <__Z19WM_keyconfig_updateP15wmWindowManager>
100b5620c:     	mov	x0, x19
100b56210:     	bl	0x1000b4c78 <__Z13CTX_data_mainPK8bContext>
100b56214:     	bl	0x100b40ca0 <__Z21WM_gizmoconfig_updateP4Main>
100b56218:     	bl	0x1008f20d4 <__Z14GPU_render_endv>
100b5621c:     	bl	0x101f3589c <__Z32UI_ipad_numbers_dispose_deferredv>
100b56220:     	b	0x100b563a4 <__Z20wm_event_do_handlersP8bContext+0x1e74>
100b56224:     	bl	0x1008f20d4 <__Z14GPU_render_endv>
100b56228:     	b	0x100b563a4 <__Z20wm_event_do_handlersP8bContext+0x1e74>
100b5622c:     	adrp	x8, 0x106d88000 <_build_commit_date>
100b56230:     	add	x8, x8, #0x28
100b56234:     	ldr	x8, [x8]
100b56238:     	ldr	x19, [x8, #0x678]
100b5623c:     	cbz	x19, 0x100b56318 <__Z20wm_event_do_handlersP8bContext+0x1de8>
100b56240:     	add	x20, x19, #0x1a0
100b56244:     	ldr	x20, [x20]
100b56248:     	cbz	x20, 0x100b56260 <__Z20wm_event_do_handlersP8bContext+0x1d30>
100b5624c:     	ldr	x0, [x20, #0x168]
100b56250:     	mov	x1, x26
100b56254:     	bl	0x10078feb0 <__Z16BLI_remlink_safeP8ListBasePv>
100b56258:     	cbz	w0, 0x100b56244 <__Z20wm_event_do_handlersP8bContext+0x1d14>
100b5625c:     	b	0x100b5626c <__Z20wm_event_do_handlersP8bContext+0x1d3c>
100b56260:     	ldr	x19, [x19]
100b56264:     	cbnz	x19, 0x100b56240 <__Z20wm_event_do_handlersP8bContext+0x1d10>
100b56268:     	b	0x100b56318 <__Z20wm_event_do_handlersP8bContext+0x1de8>
100b5626c:     	ldr	x0, [x26, #0x88]
100b56270:     	cbz	x0, 0x100b56300 <__Z20wm_event_do_handlersP8bContext+0x1dd0>
100b56274:     	ldrh	w8, [x26, #0x82]
100b56278:     	cbz	w8, 0x100b56300 <__Z20wm_event_do_handlersP8bContext+0x1dd0>
100b5627c:     	ldrh	w8, [x26, #0x80]
100b56280:     	cmp	w8, #0x3
100b56284:     	b.ne	0x100b562fc <__Z20wm_event_do_handlersP8bContext+0x1dcc>
100b56288:     	bl	0x100b468dc <__Z17WM_drag_free_listP8ListBase>
100b5628c:     	b	0x100b56300 <__Z20wm_event_do_handlersP8bContext+0x1dd0>
100b56290:     	adrp	x8, 0x106d88000 <_build_commit_date>
100b56294:     	add	x8, x8, #0x28
100b56298:     	ldr	x8, [x8]
100b5629c:     	ldr	x19, [x8, #0x678]
100b562a0:     	cbz	x19, 0x100b563a0 <__Z20wm_event_do_handlersP8bContext+0x1e70>
100b562a4:     	add	x20, x19, #0x1a0
100b562a8:     	ldr	x20, [x20]
100b562ac:     	cbz	x20, 0x100b562c4 <__Z20wm_event_do_handlersP8bContext+0x1d94>
100b562b0:     	ldr	x0, [x20, #0x168]
100b562b4:     	mov	x1, x26
100b562b8:     	bl	0x10078feb0 <__Z16BLI_remlink_safeP8ListBasePv>
100b562bc:     	cbz	w0, 0x100b562a8 <__Z20wm_event_do_handlersP8bContext+0x1d78>
100b562c0:     	b	0x100b562d8 <__Z20wm_event_do_handlersP8bContext+0x1da8>
100b562c4:     	ldr	x19, [x19]
100b562c8:     	cbnz	x19, 0x100b562a4 <__Z20wm_event_do_handlersP8bContext+0x1d74>
100b562cc:     	b	0x100b563a0 <__Z20wm_event_do_handlersP8bContext+0x1e70>
100b562d0:     	bl	0x1008f20d4 <__Z14GPU_render_endv>
100b562d4:     	b	0x100b563a4 <__Z20wm_event_do_handlersP8bContext+0x1e74>
100b562d8:     	ldr	x0, [x26, #0x88]
100b562dc:     	cbz	x0, 0x100b56388 <__Z20wm_event_do_handlersP8bContext+0x1e58>
100b562e0:     	ldrh	w8, [x26, #0x82]
100b562e4:     	cbz	w8, 0x100b56388 <__Z20wm_event_do_handlersP8bContext+0x1e58>
100b562e8:     	ldrh	w8, [x26, #0x80]
100b562ec:     	cmp	w8, #0x3
100b562f0:     	b.ne	0x100b56384 <__Z20wm_event_do_handlersP8bContext+0x1e54>
100b562f4:     	bl	0x100b468dc <__Z17WM_drag_free_listP8ListBase>
100b562f8:     	b	0x100b56388 <__Z20wm_event_do_handlersP8bContext+0x1e58>
100b562fc:     	bl	0x100ae425c <_MEM_freeN>
100b56300:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
100b56304:     	add	x8, x8, #0x690
100b56308:     	ldr	x8, [x8]
100b5630c:     	mov	x0, x26
100b56310:     	mov	w1, #0x0                ; =0
100b56314:     	blr	x8
100b56318:     	bl	0x1008f20d4 <__Z14GPU_render_endv>
100b5631c:     	b	0x100b563a4 <__Z20wm_event_do_handlersP8bContext+0x1e74>
100b56320:     	adrp	x8, 0x106d88000 <_build_commit_date>
100b56324:     	add	x8, x8, #0x28
100b56328:     	ldr	x8, [x8]
100b5632c:     	ldr	x19, [x8, #0x678]
100b56330:     	cbz	x19, 0x100b563f8 <__Z20wm_event_do_handlersP8bContext+0x1ec8>
100b56334:     	add	x20, x19, #0x1a0
100b56338:     	ldr	x20, [x20]
100b5633c:     	cbz	x20, 0x100b56354 <__Z20wm_event_do_handlersP8bContext+0x1e24>
100b56340:     	ldr	x0, [x20, #0x168]
100b56344:     	mov	x1, x26
100b56348:     	bl	0x10078feb0 <__Z16BLI_remlink_safeP8ListBasePv>
100b5634c:     	cbz	w0, 0x100b56338 <__Z20wm_event_do_handlersP8bContext+0x1e08>
100b56350:     	b	0x100b56360 <__Z20wm_event_do_handlersP8bContext+0x1e30>
100b56354:     	ldr	x19, [x19]
100b56358:     	cbnz	x19, 0x100b56334 <__Z20wm_event_do_handlersP8bContext+0x1e04>
100b5635c:     	b	0x100b563f8 <__Z20wm_event_do_handlersP8bContext+0x1ec8>
100b56360:     	ldr	x0, [x26, #0x88]
100b56364:     	cbz	x0, 0x100b563e0 <__Z20wm_event_do_handlersP8bContext+0x1eb0>
100b56368:     	ldrh	w8, [x26, #0x82]
100b5636c:     	cbz	w8, 0x100b563e0 <__Z20wm_event_do_handlersP8bContext+0x1eb0>
100b56370:     	ldrh	w8, [x26, #0x80]
100b56374:     	cmp	w8, #0x3
100b56378:     	b.ne	0x100b563dc <__Z20wm_event_do_handlersP8bContext+0x1eac>
100b5637c:     	bl	0x100b468dc <__Z17WM_drag_free_listP8ListBase>
100b56380:     	b	0x100b563e0 <__Z20wm_event_do_handlersP8bContext+0x1eb0>
100b56384:     	bl	0x100ae425c <_MEM_freeN>
100b56388:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
100b5638c:     	add	x8, x8, #0x690
100b56390:     	ldr	x8, [x8]
100b56394:     	mov	x0, x26
100b56398:     	mov	w1, #0x0                ; =0
100b5639c:     	blr	x8
100b563a0:     	bl	0x1008f20d4 <__Z14GPU_render_endv>
100b563a4:     	ldur	x8, [x29, #-0x68]
100b563a8:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
100b563ac:     	ldr	x9, [x9, #0x7f0]
100b563b0:     	ldr	x9, [x9]
100b563b4:     	cmp	x9, x8
100b563b8:     	b.ne	0x100b56400 <__Z20wm_event_do_handlersP8bContext+0x1ed0>
100b563bc:     	add	sp, sp, #0x210
100b563c0:     	ldp	x29, x30, [sp, #0x50]
100b563c4:     	ldp	x20, x19, [sp, #0x40]
100b563c8:     	ldp	x22, x21, [sp, #0x30]
100b563cc:     	ldp	x24, x23, [sp, #0x20]
100b563d0:     	ldp	x26, x25, [sp, #0x10]
100b563d4:     	ldp	x28, x27, [sp], #0x60
100b563d8:     	ret
100b563dc:     	bl	0x100ae425c <_MEM_freeN>
100b563e0:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
100b563e4:     	add	x8, x8, #0x690
100b563e8:     	ldr	x8, [x8]
100b563ec:     	mov	x0, x26
100b563f0:     	mov	w1, #0x0                ; =0
100b563f4:     	blr	x8
100b563f8:     	bl	0x1008f20d4 <__Z14GPU_render_endv>
100b563fc:     	b	0x100b563a4 <__Z20wm_event_do_handlersP8bContext+0x1e74>
100b56400:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
100b56404:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
