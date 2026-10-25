
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b5d5a4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase>:
100b5d5a4:     	stp	x28, x27, [sp, #-0x60]!
100b5d5a8:     	stp	x26, x25, [sp, #0x10]
100b5d5ac:     	stp	x24, x23, [sp, #0x20]
100b5d5b0:     	stp	x22, x21, [sp, #0x30]
100b5d5b4:     	stp	x20, x19, [sp, #0x40]
100b5d5b8:     	stp	x29, x30, [sp, #0x50]
100b5d5bc:     	add	x29, sp, #0x50
100b5d5c0:     	sub	sp, sp, #0x230
100b5d5c4:     	mov	x21, x3
100b5d5c8:     	mov	x20, x2
100b5d5cc:     	str	x1, [sp, #0xa0]
100b5d5d0:     	mov	x26, x0
100b5d5d4:     	adrp	x0, 0x106d86000 <__PyRuntime+0x280b8>
100b5d5d8:     	add	x0, x0, #0xb78
100b5d5dc:     	ldr	x8, [x0]
100b5d5e0:     	blr	x8
100b5d5e4:     	mov	x19, x0
100b5d5e8:     	ldp	q0, q1, [x0, #0xa0]
100b5d5ec:     	stp	q0, q1, [sp, #0x180]
100b5d5f0:     	ldr	x8, [x0, #0xc0]
100b5d5f4:     	str	x8, [sp, #0x1a0]
100b5d5f8:     	ldp	q0, q1, [x0, #0x60]
100b5d5fc:     	stp	q0, q1, [sp, #0x140]
100b5d600:     	ldp	q1, q0, [x0, #0x80]
100b5d604:     	stp	q1, q0, [sp, #0x160]
100b5d608:     	ldp	q0, q1, [x0, #0x20]
100b5d60c:     	stp	q0, q1, [sp, #0x100]
100b5d610:     	ldp	q1, q0, [x0, #0x40]
100b5d614:     	stp	q1, q0, [sp, #0x120]
100b5d618:     	ldp	q1, q0, [x0]
100b5d61c:     	stp	q1, q0, [sp, #0xe0]
100b5d620:     	stp	xzr, xzr, [x0, #0x40]
100b5d624:     	strb	wzr, [x0, #0x50]
100b5d628:     	str	xzr, [x0, #0xb0]
100b5d62c:     	strb	wzr, [x0, #0xb8]
100b5d630:     	strh	wzr, [x0, #0xba]
100b5d634:     	strb	wzr, [x0, #0xc0]
100b5d638:     	movi.16b	v0, #0x0
100b5d63c:     	stur	q0, [x0, #0x58]
100b5d640:     	stur	q0, [x0, #0x68]
100b5d644:     	stur	q0, [x0, #0x78]
100b5d648:     	strh	wzr, [x0, #0x88]
100b5d64c:     	stur	xzr, [x0, #0x8c]
100b5d650:     	stp	xzr, xzr, [x0, #0x98]
100b5d654:     	stur	xzr, [x0, #0xa6]
100b5d658:     	stp	q0, q0, [x0]
100b5d65c:     	str	q0, [x0, #0x20]
100b5d660:     	stur	q0, [x0, #0x2e]
100b5d664:     	cbz	x26, 0x100b5d700 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15c>
100b5d668:     	ldr	x8, [sp, #0xa0]
100b5d66c:     	cbz	x8, 0x100b5d700 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15c>
100b5d670:     	cbz	x20, 0x100b5d700 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15c>
100b5d674:     	ldrh	w8, [x20, #0x10]
100b5d678:     	cmp	w8, #0x1
100b5d67c:     	b.ne	0x100b5d704 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x160>
100b5d680:     	ldrh	w8, [x20, #0x12]
100b5d684:     	cmp	w8, #0x1
100b5d688:     	b.ne	0x100b5d704 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x160>
100b5d68c:     	ldrb	w8, [x20, #0x78]
100b5d690:     	cmp	w8, #0x1
100b5d694:     	b.ne	0x100b5d704 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x160>
100b5d698:     	ldrb	w8, [x20, #0x79]
100b5d69c:     	cmp	w8, #0x2
100b5d6a0:     	b.ne	0x100b5d704 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x160>
100b5d6a4:     	ldr	x8, [x20, #0x58]
100b5d6a8:     	cbz	x8, 0x100b5d704 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x160>
100b5d6ac:     	ldr	x8, [x20, #0x60]
100b5d6b0:     	cbz	x8, 0x100b5d704 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x160>
100b5d6b4:     	ldr	x8, [x20, #0x68]
100b5d6b8:     	cbz	x8, 0x100b5d704 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x160>
100b5d6bc:     	ldr	x8, [sp, #0xa0]
100b5d6c0:     	stp	x26, x8, [x19]
100b5d6c4:     	ldp	q0, q1, [x20]
100b5d6c8:     	ldr	q2, [x20, #0x20]
100b5d6cc:     	stp	q1, q2, [x19, #0x20]
100b5d6d0:     	stur	q0, [x19, #0x10]
100b5d6d4:     	ldp	q0, q1, [x20, #0x30]
100b5d6d8:     	ldp	q2, q3, [x20, #0x50]
100b5d6dc:     	stp	q2, q3, [x19, #0x60]
100b5d6e0:     	stp	q0, q1, [x19, #0x40]
100b5d6e4:     	ldp	q0, q1, [x20, #0x70]
100b5d6e8:     	ldp	q2, q3, [x20, #0x90]
100b5d6ec:     	stp	q2, q3, [x19, #0xa0]
100b5d6f0:     	stp	q0, q1, [x19, #0x80]
100b5d6f4:     	mov	w8, #0x1                ; =1
100b5d6f8:     	strb	w8, [x19, #0xc0]
100b5d6fc:     	b	0x100b5d704 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x160>
100b5d700:     	cbz	x20, 0x100b5d7ec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x248>
100b5d704:     	ldrb	w8, [x20, #0x78]
100b5d708:     	cmp	w8, #0x1
100b5d70c:     	b.ne	0x100b5d7ec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x248>
100b5d710:     	ldrb	w8, [x20, #0x79]
100b5d714:     	sub	w9, w8, #0x3
100b5d718:     	ldr	x8, [sp, #0xa0]
100b5d71c:     	add	x8, x8, #0x118
100b5d720:     	cmp	w9, #0x1
100b5d724:     	b.hi	0x100b5d738 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x194>
100b5d728:     	cmp	x8, x21
100b5d72c:     	b.eq	0x100b5d738 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x194>
100b5d730:     	mov	w9, #0x3                ; =3
100b5d734:     	b	0x100b5ecb4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1710>
100b5d738:     	cmp	w9, #0x1
100b5d73c:     	b.hi	0x100b5d7ec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x248>
100b5d740:     	ldr	x23, [x8]
100b5d744:     	cbnz	x23, 0x100b5d754 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b0>
100b5d748:     	b	0x100b5d730 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x18c>
100b5d74c:     	ldr	x23, [x23]
100b5d750:     	cbz	x23, 0x100b5d730 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x18c>
100b5d754:     	cbz	x20, 0x100b5d74c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a8>
100b5d758:     	ldr	w8, [x23, #0x10]
100b5d75c:     	cmp	w8, #0x3
100b5d760:     	b.ne	0x100b5d74c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a8>
100b5d764:     	ldrb	w8, [x20, #0x78]
100b5d768:     	cmp	w8, #0x1
100b5d76c:     	b.ne	0x100b5d74c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a8>
100b5d770:     	ldrb	w8, [x20, #0x79]
100b5d774:     	sub	w8, w8, #0x3
100b5d778:     	cmp	w8, #0x1
100b5d77c:     	b.hi	0x100b5d74c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a8>
100b5d780:     	ldr	x8, [x23, #0x50]
100b5d784:     	ldr	x9, [x20, #0x58]
100b5d788:     	cmp	x8, x9
100b5d78c:     	b.ne	0x100b5d74c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a8>
100b5d790:     	ldr	x8, [x23, #0x58]
100b5d794:     	ldr	x9, [x20, #0x60]
100b5d798:     	cmp	x8, x9
100b5d79c:     	b.ne	0x100b5d74c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a8>
100b5d7a0:     	ldr	x8, [x23, #0x88]
100b5d7a4:     	ldr	x9, [x20, #0x68]
100b5d7a8:     	cmp	x8, x9
100b5d7ac:     	b.ne	0x100b5d74c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a8>
100b5d7b0:     	ldr	w8, [x23, #0x90]
100b5d7b4:     	ldr	w9, [x20, #0x70]
100b5d7b8:     	cmp	w8, w9
100b5d7bc:     	b.ne	0x100b5d74c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a8>
100b5d7c0:     	ldr	w8, [x23, #0x94]
100b5d7c4:     	ldr	w9, [x20, #0x74]
100b5d7c8:     	cmp	w8, w9
100b5d7cc:     	b.ne	0x100b5d74c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a8>
100b5d7d0:     	ldr	x0, [sp, #0xa0]
100b5d7d4:     	mov	x1, x23
100b5d7d8:     	bl	0x100b513f8 <__ZL39wm_ipad_pencil_paint_handler_registeredP8wmWindowPK17wmEventHandler_Op>
100b5d7dc:     	tbz	w0, #0x0, 0x100b5d74c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a8>
100b5d7e0:     	mov	w8, #0x1                ; =1
100b5d7e4:     	str	w8, [sp, #0xac]
100b5d7e8:     	b	0x100b5d7f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x24c>
100b5d7ec:     	str	wzr, [sp, #0xac]
100b5d7f0:     	adrp	x8, 0x106d88000 <_build_commit_date>
100b5d7f4:     	add	x8, x8, #0x28
100b5d7f8:     	ldrb	w8, [x8, #0xc40]
100b5d7fc:     	tbnz	w8, #0x4, 0x100b5d808 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x264>
100b5d800:     	str	wzr, [sp, #0x94]
100b5d804:     	b	0x100b5d81c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x278>
100b5d808:     	ldrh	w8, [x20, #0x10]
100b5d80c:     	cmp	w8, #0x4
100b5d810:     	ccmp	w8, #0x11, #0x4, ne
100b5d814:     	cset	w8, ne
100b5d818:     	str	w8, [sp, #0x94]
100b5d81c:     	mov	x0, x26
100b5d820:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b5d824:     	str	x0, [sp, #0x88]
100b5d828:     	cbz	x21, 0x100b5ec74 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16d0>
100b5d82c:     	ldr	x8, [x21]
100b5d830:     	str	x8, [sp, #0xb8]
100b5d834:     	cbz	x8, 0x100b5eca0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16fc>
100b5d838:     	str	x21, [sp, #0xb0]
100b5d83c:     	str	wzr, [sp, #0xa8]
100b5d840:     	b	0x100b5d84c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2a8>
100b5d844:     	ldr	x8, [sp, #0xb8]
100b5d848:     	cbz	x8, 0x100b5ec7c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16d8>
100b5d84c:     	ldp	x8, x27, [sp, #0xb0]
100b5d850:     	ldr	x8, [x8]
100b5d854:     	cbz	x8, 0x100b5ec7c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16d8>
100b5d858:     	ldr	x8, [x27]
100b5d85c:     	str	x8, [sp, #0xb8]
100b5d860:     	ldr	w8, [sp, #0xac]
100b5d864:     	cbz	w8, 0x100b5d8f4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x350>
100b5d868:     	cbz	x20, 0x100b5d844 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2a0>
100b5d86c:     	ldr	w8, [x27, #0x10]
100b5d870:     	cmp	w8, #0x3
100b5d874:     	b.ne	0x100b5d844 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2a0>
100b5d878:     	ldrb	w8, [x20, #0x78]
100b5d87c:     	cmp	w8, #0x1
100b5d880:     	b.ne	0x100b5d844 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2a0>
100b5d884:     	ldrb	w8, [x20, #0x79]
100b5d888:     	sub	w8, w8, #0x3
100b5d88c:     	cmp	w8, #0x1
100b5d890:     	b.hi	0x100b5d844 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2a0>
100b5d894:     	ldr	x8, [x27, #0x50]
100b5d898:     	ldr	x9, [x20, #0x58]
100b5d89c:     	cmp	x8, x9
100b5d8a0:     	b.ne	0x100b5d844 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2a0>
100b5d8a4:     	ldr	x8, [x27, #0x58]
100b5d8a8:     	ldr	x9, [x20, #0x60]
100b5d8ac:     	cmp	x8, x9
100b5d8b0:     	b.ne	0x100b5d844 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2a0>
100b5d8b4:     	ldr	x8, [x27, #0x88]
100b5d8b8:     	ldr	x9, [x20, #0x68]
100b5d8bc:     	cmp	x8, x9
100b5d8c0:     	b.ne	0x100b5d844 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2a0>
100b5d8c4:     	ldr	w8, [x27, #0x90]
100b5d8c8:     	ldr	w9, [x20, #0x70]
100b5d8cc:     	cmp	w8, w9
100b5d8d0:     	b.ne	0x100b5d844 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2a0>
100b5d8d4:     	ldr	w8, [x27, #0x94]
100b5d8d8:     	ldr	w9, [x20, #0x74]
100b5d8dc:     	cmp	w8, w9
100b5d8e0:     	b.ne	0x100b5d844 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2a0>
100b5d8e4:     	ldr	x0, [sp, #0xa0]
100b5d8e8:     	mov	x1, x27
100b5d8ec:     	bl	0x100b513f8 <__ZL39wm_ipad_pencil_paint_handler_registeredP8wmWindowPK17wmEventHandler_Op>
100b5d8f0:     	tbz	w0, #0x0, 0x100b5d844 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2a0>
100b5d8f4:     	ldr	w9, [x27, #0x14]
100b5d8f8:     	tbnz	w9, #0x7, 0x100b5eb68 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15c4>
100b5d8fc:     	ldr	x21, [x27, #0x18]
100b5d900:     	cbz	x21, 0x100b5d934 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x390>
100b5d904:     	mov	x0, x26
100b5d908:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b5d90c:     	mov	x22, x0
100b5d910:     	mov	x0, x26
100b5d914:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5d918:     	mov	x2, x0
100b5d91c:     	ldr	x0, [sp, #0xa0]
100b5d920:     	mov	x1, x22
100b5d924:     	mov	x3, x20
100b5d928:     	blr	x21
100b5d92c:     	cbz	w0, 0x100b5eb68 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15c4>
100b5d930:     	ldr	w9, [x27, #0x14]
100b5d934:     	ldrh	w8, [x20, #0x10]
100b5d938:     	cmp	w8, #0x104
100b5d93c:     	and	w10, w8, #0xfff0
100b5d940:     	mov	w11, #0x110             ; =272
100b5d944:     	ccmp	w10, w11, #0x4, ne
100b5d948:     	cset	w10, eq
100b5d94c:     	str	w10, [sp, #0x84]
100b5d950:     	and	w9, w9, #0x1
100b5d954:     	ldr	w10, [sp, #0xa8]
100b5d958:     	orr	w10, w9, w10
100b5d95c:     	str	w10, [sp, #0xa8]
100b5d960:     	ldr	w9, [x27, #0x10]
100b5d964:     	cmp	w9, #0x2
100b5d968:     	b.le	0x100b5d9a4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x400>
100b5d96c:     	cmp	w9, #0x3
100b5d970:     	b.eq	0x100b5da6c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x4c8>
100b5d974:     	cmp	w9, #0x4
100b5d978:     	b.eq	0x100b5daac <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x508>
100b5d97c:     	cmp	w9, #0x5
100b5d980:     	b.ne	0x100b5dc14 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x670>
100b5d984:     	ldr	x8, [x27, #0x38]
100b5d988:     	cbz	x8, 0x100b5dc74 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x6d0>
100b5d98c:     	add	x3, sp, #0xc0
100b5d990:     	ldr	x0, [sp, #0x88]
100b5d994:     	ldr	x1, [sp, #0xa0]
100b5d998:     	mov	x2, x27
100b5d99c:     	blr	x8
100b5d9a0:     	b	0x100b5dca0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x6fc>
100b5d9a4:     	cmp	w9, #0x1
100b5d9a8:     	b.eq	0x100b5dc04 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x660>
100b5d9ac:     	cmp	w9, #0x2
100b5d9b0:     	b.ne	0x100b5dc14 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x670>
100b5d9b4:     	ldr	x8, [sp, #0x88]
100b5d9b8:     	ldr	x8, [x8, #0x5c0]
100b5d9bc:     	ldrb	w8, [x8, #0x10]
100b5d9c0:     	tbnz	w8, #0x0, 0x100b5eb48 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a4>
100b5d9c4:     	mov	x0, x26
100b5d9c8:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b5d9cc:     	mov	x25, x0
100b5d9d0:     	mov	x0, x26
100b5d9d4:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5d9d8:     	mov	x24, x0
100b5d9dc:     	mov	x0, x26
100b5d9e0:     	bl	0x1000b4458 <__Z19CTX_wm_region_popupPK8bContext>
100b5d9e4:     	mov	x23, x0
100b5d9e8:     	ldrh	w8, [x20, #0x10]
100b5d9ec:     	cmp	w8, #0xf
100b5d9f0:     	cset	w9, lo
100b5d9f4:     	ldrb	w10, [x27, #0x14]
100b5d9f8:     	tbnz	w10, #0x1, 0x100b5da1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x478>
100b5d9fc:     	cmp	w8, #0x13
100b5da00:     	b.hi	0x100b5e750 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x11ac>
100b5da04:     	mov	w10, #0x1               ; =1
100b5da08:     	lsl	w10, w10, w8
100b5da0c:     	mov	w11, #0x18e             ; =398
100b5da10:     	movk	w11, #0xc, lsl #16
100b5da14:     	tst	w10, w11
100b5da18:     	b.eq	0x100b5e750 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x11ac>
100b5da1c:     	mov	w10, #0x4c00            ; =19456
100b5da20:     	lsr	w10, w10, w8
100b5da24:     	and	w21, w9, w10
100b5da28:     	adrp	x9, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b5da2c:     	ldrb	w9, [x9, #0x828]
100b5da30:     	cmp	w9, #0x1
100b5da34:     	b.ne	0x100b5da58 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x4b4>
100b5da38:     	tbnz	w21, #0x0, 0x100b5da64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x4c0>
100b5da3c:     	cmp	w8, #0x104
100b5da40:     	b.eq	0x100b5e428 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xe84>
100b5da44:     	and	w9, w8, #0xfff0
100b5da48:     	cmp	w9, #0x110
100b5da4c:     	b.eq	0x100b5e428 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xe84>
100b5da50:     	adrp	x9, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b5da54:     	strb	wzr, [x9, #0x828]
100b5da58:     	mov	w9, #0x5020             ; =20512
100b5da5c:     	cmp	w8, w9
100b5da60:     	b.ne	0x100b5e428 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xe84>
100b5da64:     	mov	w8, #0x0                ; =0
100b5da68:     	b	0x100b5e5a8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1004>
100b5da6c:     	ldrb	w9, [x27, #0x28]
100b5da70:     	cmp	w9, #0x1
100b5da74:     	b.ne	0x100b5dc30 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x68c>
100b5da78:     	ldr	x9, [sp, #0x88]
100b5da7c:     	ldr	x9, [x9, #0x5c0]
100b5da80:     	ldrb	w9, [x9, #0x10]
100b5da84:     	tbnz	w9, #0x0, 0x100b5eb48 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a4>
100b5da88:     	mov	w9, #0x5020             ; =20512
100b5da8c:     	cmp	w8, w9
100b5da90:     	b.ne	0x100b5daa4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x500>
100b5da94:     	ldr	x8, [x27, #0x20]
100b5da98:     	ldr	x9, [x20, #0x88]
100b5da9c:     	cmp	x8, x9
100b5daa0:     	b.eq	0x100b5e738 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1194>
100b5daa4:     	mov	w0, #0x0                ; =0
100b5daa8:     	b	0x100b5dc50 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x6ac>
100b5daac:     	ldr	x9, [sp, #0x88]
100b5dab0:     	ldr	x9, [x9, #0x5c0]
100b5dab4:     	ldrb	w9, [x9, #0x10]
100b5dab8:     	tbnz	w9, #0x0, 0x100b5eb48 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a4>
100b5dabc:     	mov	w9, #0x5023             ; =20515
100b5dac0:     	cmp	w8, w9
100b5dac4:     	b.ne	0x100b5eb48 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a4>
100b5dac8:     	ldr	x8, [x27, #0x20]
100b5dacc:     	ldr	x23, [x8]
100b5dad0:     	cbnz	x23, 0x100b5dae0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x53c>
100b5dad4:     	b	0x100b5eb48 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a4>
100b5dad8:     	ldr	x23, [x23]
100b5dadc:     	cbz	x23, 0x100b5eb48 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a4>
100b5dae0:     	ldrh	w8, [x20, #0x80]
100b5dae4:     	cmp	w8, #0x3
100b5dae8:     	b.ne	0x100b5dad8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x534>
100b5daec:     	mov	x0, x26
100b5daf0:     	bl	0x101661a04 <__Z19ED_undo_group_beginP8bContext>
100b5daf4:     	ldr	x25, [x20, #0x88]
100b5daf8:     	ldr	x24, [x25]
100b5dafc:     	cbz	x24, 0x100b5db24 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x580>
100b5db00:     	ldr	x21, [x24]
100b5db04:     	ldr	x8, [x23, #0x10]
100b5db08:     	mov	x0, x26
100b5db0c:     	mov	x1, x24
100b5db10:     	mov	x2, x20
100b5db14:     	blr	x8
100b5db18:     	cbnz	w0, 0x100b5db2c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x588>
100b5db1c:     	mov	x24, x21
100b5db20:     	cbnz	x21, 0x100b5db00 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x55c>
100b5db24:     	ldr	w9, [sp, #0xa8]
100b5db28:     	b	0x100b5dbe8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x644>
100b5db2c:     	mov	x0, x26
100b5db30:     	mov	x1, x24
100b5db34:     	mov	x2, x23
100b5db38:     	bl	0x100b46910 <__Z15wm_drop_prepareP8bContextP6wmDragP9wmDropBox>
100b5db3c:     	mov	x0, x25
100b5db40:     	mov	x1, x24
100b5db44:     	bl	0x10078fe64 <__Z11BLI_remlinkP8ListBasePv>
100b5db48:     	stp	xzr, xzr, [x29, #-0x80]
100b5db4c:     	sub	x0, x29, #0x80
100b5db50:     	mov	x1, x24
100b5db54:     	bl	0x10078fe38 <__Z11BLI_addtailP8ListBasePv>
100b5db58:     	sub	x8, x29, #0x80
100b5db5c:     	str	x8, [x20, #0x88]
100b5db60:     	mov	x0, x23
100b5db64:     	bl	0x100b46a18 <__Z28wm_drop_operator_context_getPK9wmDropBox>
100b5db68:     	ldr	x1, [x23, #0x60]
100b5db6c:     	cbz	x1, 0x100b5db90 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x5ec>
100b5db70:     	mov	x4, x0
100b5db74:     	ldr	x2, [x23, #0xb0]
100b5db78:     	mov	x0, x26
100b5db7c:     	mov	x3, #0x0                ; =0
100b5db80:     	mov	w5, #0x0                ; =0
100b5db84:     	mov	x6, x20
100b5db88:     	bl	0x100b4e810 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent>
100b5db8c:     	tbz	w0, #0x1, 0x100b5dbac <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x608>
100b5db90:     	ldr	x21, [x23, #0x38]
100b5db94:     	cbz	x21, 0x100b5dbac <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x608>
100b5db98:     	mov	x0, x26
100b5db9c:     	bl	0x1000b4c78 <__Z13CTX_data_mainPK8bContext>
100b5dba0:     	mov	x1, x24
100b5dba4:     	mov	x2, x23
100b5dba8:     	blr	x21
100b5dbac:     	mov	x0, x25
100b5dbb0:     	bl	0x100b468dc <__Z17WM_drag_free_listP8ListBase>
100b5dbb4:     	sub	x0, x29, #0x80
100b5dbb8:     	bl	0x100b468dc <__Z17WM_drag_free_listP8ListBase>
100b5dbbc:     	str	wzr, [x20, #0x80]
100b5dbc0:     	str	xzr, [x20, #0x88]
100b5dbc4:     	mov	x0, x26
100b5dbc8:     	mov	x1, x24
100b5dbcc:     	mov	x2, x23
100b5dbd0:     	bl	0x100b46a20 <__Z11wm_drop_endP8bContextP6wmDragP9wmDropBox>
100b5dbd4:     	mov	x0, x26
100b5dbd8:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5dbdc:     	ldr	w9, [sp, #0xa8]
100b5dbe0:     	orr	w9, w9, #0x1
100b5dbe4:     	cbz	x0, 0x100b5ecb4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1710>
100b5dbe8:     	str	w9, [sp, #0xa8]
100b5dbec:     	ldr	x0, [sp, #0x88]
100b5dbf0:     	ldr	x1, [sp, #0xa0]
100b5dbf4:     	bl	0x100b45fec <__Z13wm_drags_exitP15wmWindowManagerP8wmWindow>
100b5dbf8:     	mov	x0, x26
100b5dbfc:     	bl	0x101661a20 <__Z17ED_undo_group_endP8bContext>
100b5dc00:     	b	0x100b5dad8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x534>
100b5dc04:     	ldr	w9, [sp, #0x84]
100b5dc08:     	tbz	w9, #0x0, 0x100b5dc5c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x6b8>
100b5dc0c:     	mov	w21, #0x0               ; =0
100b5dc10:     	b	0x100b5eb3c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1598>
100b5dc14:     	adrp	x0, 0x104bd0000 <__ZL3hex+0x434d>
100b5dc18:     	add	x0, x0, #0x5ac
100b5dc1c:     	mov	w1, #0x1711             ; =5905
100b5dc20:     	adrp	x2, 0x104bd1000 <__ZL3hex+0x534d>
100b5dc24:     	add	x2, x2, #0x361
100b5dc28:     	bl	0x10072af10 <__Z29_BLI_assert_unreachable_printPKciS0_>
100b5dc2c:     	b	0x100b5eb48 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a4>
100b5dc30:     	mov	x0, x26
100b5dc34:     	ldr	x1, [sp, #0xb0]
100b5dc38:     	mov	x2, x27
100b5dc3c:     	mov	x3, x20
100b5dc40:     	mov	x4, #0x0                ; =0
100b5dc44:     	mov	x5, #0x0                ; =0
100b5dc48:     	mov	w6, #0x0                ; =0
100b5dc4c:     	bl	0x100b5194c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb>
100b5dc50:     	ldr	w8, [sp, #0xa8]
100b5dc54:     	orr	w8, w0, w8
100b5dc58:     	b	0x100b5eb44 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a0>
100b5dc5c:     	sub	w9, w8, #0xd4
100b5dc60:     	cmp	w9, #0x6
100b5dc64:     	str	x27, [sp, #0x78]
100b5dc68:     	b.hs	0x100b5e30c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xd68>
100b5dc6c:     	mov	w21, #0x1               ; =1
100b5dc70:     	b	0x100b5e31c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xd78>
100b5dc74:     	movi.16b	v0, #0x0
100b5dc78:     	stp	q0, q0, [sp, #0xc0]
100b5dc7c:     	ldr	x1, [x27, #0x20]
100b5dc80:     	ldr	x0, [sp, #0x88]
100b5dc84:     	bl	0x100b75794 <__Z16WM_keymap_activePK15wmWindowManagerP8wmKeyMap>
100b5dc88:     	cbz	x0, 0x100b5dca0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x6fc>
100b5dc8c:     	ldrsw	x8, [sp, #0xd8]
100b5dc90:     	add	w9, w8, #0x1
100b5dc94:     	str	w9, [sp, #0xd8]
100b5dc98:     	add	x9, sp, #0xc0
100b5dc9c:     	str	x0, [x9, x8, lsl #3]
100b5dca0:     	ldrh	w8, [x20, #0x10]
100b5dca4:     	cmp	w8, #0x1
100b5dca8:     	b.ne	0x100b5dcd0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x72c>
100b5dcac:     	ldrh	w8, [x20, #0x12]
100b5dcb0:     	cmp	w8, #0x5
100b5dcb4:     	b.ne	0x100b5dcd0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x72c>
100b5dcb8:     	ldrb	w8, [x20, #0x7c]
100b5dcbc:     	tbz	w8, #0x7, 0x100b5dcd0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x72c>
100b5dcc0:     	ldrb	w8, [x20, #0x2a]
100b5dcc4:     	cbnz	w8, 0x100b5dcd0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x72c>
100b5dcc8:     	ldrh	w8, [x20, #0x2c]
100b5dccc:     	cbz	w8, 0x100b5ebb8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1614>
100b5dcd0:     	ldr	w8, [sp, #0xd8]
100b5dcd4:     	str	x27, [sp, #0x78]
100b5dcd8:     	str	x26, [sp, #0x98]
100b5dcdc:     	ldrh	w9, [x20, #0x10]
100b5dce0:     	str	w9, [sp, #0x54]
100b5dce4:     	cmp	w8, #0x1
100b5dce8:     	b.lt	0x100b5e2bc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xd18>
100b5dcec:     	mov	x25, #0x0               ; =0
100b5dcf0:     	mov	w21, #0x0               ; =0
100b5dcf4:     	add	x8, sp, #0xc0
100b5dcf8:     	ldr	x28, [x8, x25, lsl #3]
100b5dcfc:     	cbz	x28, 0x100b5dd78 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7d4>
100b5dd00:     	ldr	w8, [sp, #0x94]
100b5dd04:     	cbz	w8, 0x100b5dd44 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7a0>
100b5dd08:     	add	x9, x28, #0x30
100b5dd0c:     	adrp	x8, 0x104bd1000 <__ZL3hex+0x534d>
100b5dd10:     	add	x8, x8, #0x38f
100b5dd14:     	stp	x8, x9, [sp]
100b5dd18:     	adrp	x0, 0x104bd1000 <__ZL3hex+0x534d>
100b5dd1c:     	add	x0, x0, #0x377
100b5dd20:     	bl	0x104b728f0 <_zlibVersion+0x104b728f0>
100b5dd24:     	ldr	x0, [sp, #0x98]
100b5dd28:     	mov	x1, x28
100b5dd2c:     	bl	0x100b73f0c <__Z14WM_keymap_pollP8bContextP8wmKeyMap>
100b5dd30:     	tbz	w0, #0x0, 0x100b5dd6c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7c8>
100b5dd34:     	adrp	x0, 0x104b91000 <_zlibVersion+0x104b91000>
100b5dd38:     	add	x0, x0, #0xf2e
100b5dd3c:     	bl	0x104b72adc <_zlibVersion+0x104b72adc>
100b5dd40:     	b	0x100b5dd54 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7b0>
100b5dd44:     	ldr	x0, [sp, #0x98]
100b5dd48:     	mov	x1, x28
100b5dd4c:     	bl	0x100b73f0c <__Z14WM_keymap_pollP8bContextP8wmKeyMap>
100b5dd50:     	tbz	w0, #0x0, 0x100b5dd78 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7d4>
100b5dd54:     	ldr	x26, [x28, #0x10]
100b5dd58:     	cbz	x26, 0x100b5dd78 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7d4>
100b5dd5c:     	mov	w27, #0x0               ; =0
100b5dd60:     	add	x8, x28, #0x30
100b5dd64:     	str	x8, [sp, #0x68]
100b5dd68:     	b	0x100b5ddac <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x808>
100b5dd6c:     	adrp	x0, 0x104bd1000 <__ZL3hex+0x534d>
100b5dd70:     	add	x0, x0, #0x8ee
100b5dd74:     	bl	0x104b72adc <_zlibVersion+0x104b72adc>
100b5dd78:     	mov	w27, #0x0               ; =0
100b5dd7c:     	orr	w21, w27, w21
100b5dd80:     	tbnz	w21, #0x0, 0x100b5e2c0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xd1c>
100b5dd84:     	add	x25, x25, #0x1
100b5dd88:     	ldrsw	x8, [sp, #0xd8]
100b5dd8c:     	cmp	x25, x8
100b5dd90:     	b.lt	0x100b5dcf4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x750>
100b5dd94:     	b	0x100b5e2c0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xd1c>
100b5dd98:     	mov	x27, x22
100b5dd9c:     	and	w22, w22, #0x1
100b5dda0:     	cbnz	w22, 0x100b5e2a0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xcfc>
100b5dda4:     	ldr	x26, [x26]
100b5dda8:     	cbz	x26, 0x100b5dd7c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7d8>
100b5ddac:     	ldrb	w8, [x26, #0xac]
100b5ddb0:     	tbnz	w8, #0x0, 0x100b5dda4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x800>
100b5ddb4:     	tbz	w8, #0x4, 0x100b5ddc0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x81c>
100b5ddb8:     	ldr	w8, [x20, #0x7c]
100b5ddbc:     	tbnz	w8, #0x1, 0x100b5dda4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x800>
100b5ddc0:     	mov	x23, x27
100b5ddc4:     	ldrsh	w0, [x26, #0x9a]
100b5ddc8:     	bl	0x100b4d278 <__Z20WM_userdef_event_mapi>
100b5ddcc:     	cmn	w0, #0x1
100b5ddd0:     	mov	x27, x23
100b5ddd4:     	b.eq	0x100b5de50 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8ac>
100b5ddd8:     	cmn	w0, #0x2
100b5dddc:     	b.ne	0x100b5de18 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x874>
100b5dde0:     	ldrh	w9, [x20, #0x12]
100b5dde4:     	ldrh	w8, [x20, #0x10]
100b5dde8:     	cmp	w9, #0x1
100b5ddec:     	b.ne	0x100b5de48 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8a4>
100b5ddf0:     	sub	w9, w8, #0x20
100b5ddf4:     	cmp	w9, #0xe0
100b5ddf8:     	b.lo	0x100b5de0c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x868>
100b5ddfc:     	sub	w9, w8, #0x12c
100b5de00:     	and	w9, w9, #0xffff
100b5de04:     	cmp	w9, #0x17
100b5de08:     	b.hi	0x100b5de48 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8a4>
100b5de0c:     	ldrb	w9, [x20, #0x24]
100b5de10:     	cbnz	w9, 0x100b5df74 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x9d0>
100b5de14:     	b	0x100b5de48 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8a4>
100b5de18:     	and	w9, w0, #0xfffffffe
100b5de1c:     	ldrh	w8, [x20, #0x10]
100b5de20:     	cmp	w9, #0x1a
100b5de24:     	b.ne	0x100b5de48 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8a4>
100b5de28:     	cmp	w8, #0x1
100b5de2c:     	b.ne	0x100b5dda4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x800>
100b5de30:     	ldr	w8, [x20, #0x30]
100b5de34:     	cmp	w0, #0x1a
100b5de38:     	b.ne	0x100b5e058 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xab4>
100b5de3c:     	cmp	w8, #0x1
100b5de40:     	b.ne	0x100b5dda4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x800>
100b5de44:     	b	0x100b5de50 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8ac>
100b5de48:     	cmp	w0, w8, sxth
100b5de4c:     	b.ne	0x100b5dda4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x800>
100b5de50:     	ldrsb	w8, [x26, #0x9c]
100b5de54:     	cmn	w8, #0x1
100b5de58:     	b.eq	0x100b5de88 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8e4>
100b5de5c:     	ldrh	w9, [x20, #0x12]
100b5de60:     	cmp	w9, w8, uxth
100b5de64:     	b.ne	0x100b5dda4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x800>
100b5de68:     	cmp	w8, #0x5
100b5de6c:     	b.ne	0x100b5de88 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8e4>
100b5de70:     	ldrb	w8, [x26, #0x9d]
100b5de74:     	cmp	w8, #0xff
100b5de78:     	b.eq	0x100b5de88 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8e4>
100b5de7c:     	ldrb	w9, [x20, #0x2b]
100b5de80:     	cmp	w8, w9
100b5de84:     	b.ne	0x100b5dda4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x800>
100b5de88:     	ldrb	w8, [x26, #0x9e]
100b5de8c:     	cmp	w8, #0xff
100b5de90:     	b.eq	0x100b5deb4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x910>
100b5de94:     	ldrb	w9, [x20, #0x2a]
100b5de98:     	and	w9, w9, #0x1
100b5de9c:     	cmp	w9, w8
100b5dea0:     	b.eq	0x100b5deb4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x910>
100b5dea4:     	ldrh	w8, [x20, #0x10]
100b5dea8:     	and	w8, w8, #0xfffe
100b5deac:     	cmp	w8, #0xd8
100b5deb0:     	b.ne	0x100b5dda4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x800>
100b5deb4:     	ldrb	w8, [x26, #0x9f]
100b5deb8:     	cmp	w8, #0xff
100b5debc:     	b.eq	0x100b5dee4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x940>
100b5dec0:     	ldrb	w9, [x20, #0x2a]
100b5dec4:     	ubfx	w9, w9, #1, #1
100b5dec8:     	cmp	w9, w8
100b5decc:     	b.eq	0x100b5dee4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x940>
100b5ded0:     	ldrh	w8, [x20, #0x10]
100b5ded4:     	cmp	w8, #0xd7
100b5ded8:     	b.eq	0x100b5dee4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x940>
100b5dedc:     	cmp	w8, #0xd4
100b5dee0:     	b.ne	0x100b5dda4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x800>
100b5dee4:     	ldrb	w8, [x26, #0xa0]
100b5dee8:     	cmp	w8, #0xff
100b5deec:     	b.eq	0x100b5df10 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x96c>
100b5def0:     	ldrb	w9, [x20, #0x2a]
100b5def4:     	ubfx	w9, w9, #2, #1
100b5def8:     	cmp	w9, w8
100b5defc:     	b.eq	0x100b5df10 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x96c>
100b5df00:     	ldrh	w8, [x20, #0x10]
100b5df04:     	sub	w8, w8, #0xd5
100b5df08:     	cmp	w8, #0x1
100b5df0c:     	b.hi	0x100b5dda4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x800>
100b5df10:     	ldrb	w8, [x26, #0xa1]
100b5df14:     	cmp	w8, #0xff
100b5df18:     	b.eq	0x100b5df38 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x994>
100b5df1c:     	ldrb	w9, [x20, #0x2a]
100b5df20:     	ubfx	w9, w9, #3, #1
100b5df24:     	cmp	w9, w8
100b5df28:     	b.eq	0x100b5df38 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x994>
100b5df2c:     	ldrh	w8, [x20, #0x10]
100b5df30:     	cmp	w8, #0xac
100b5df34:     	b.ne	0x100b5dda4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x800>
100b5df38:     	ldrb	w8, [x26, #0xa2]
100b5df3c:     	cmp	w8, #0xff
100b5df40:     	b.eq	0x100b5df60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x9bc>
100b5df44:     	ldrb	w9, [x20, #0x2a]
100b5df48:     	ubfx	w9, w9, #4, #1
100b5df4c:     	cmp	w9, w8
100b5df50:     	b.eq	0x100b5df60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x9bc>
100b5df54:     	ldrh	w8, [x20, #0x10]
100b5df58:     	cmp	w8, #0xb3
100b5df5c:     	b.ne	0x100b5dda4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x800>
100b5df60:     	ldrh	w8, [x26, #0xaa]
100b5df64:     	cbz	w8, 0x100b5df74 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x9d0>
100b5df68:     	ldrh	w9, [x20, #0x2c]
100b5df6c:     	cmp	w9, w8
100b5df70:     	b.ne	0x100b5dda4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x800>
100b5df74:     	ldr	x2, [sp, #0x78]
100b5df78:     	ldp	x8, x27, [x2, #0x28]
100b5df7c:     	str	x8, [sp, #0x60]
100b5df80:     	add	x24, x26, #0x10
100b5df84:     	ldr	x4, [x26, #0xb0]
100b5df88:     	ldr	x0, [sp, #0x98]
100b5df8c:     	ldr	x1, [sp, #0xb0]
100b5df90:     	mov	x3, x20
100b5df94:     	mov	x5, x24
100b5df98:     	mov	w6, #0x0                ; =0
100b5df9c:     	bl	0x100b5194c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb>
100b5dfa0:     	mov	x22, x0
100b5dfa4:     	adrp	x8, 0x106658000 <__ZN7blender3seq28seqModifierType_WhiteBalanceE+0x40>
100b5dfa8:     	add	x8, x8, #0x298
100b5dfac:     	ldr	x0, [x8]
100b5dfb0:     	ldr	x8, [x0, #0x8]
100b5dfb4:     	cbnz	x8, 0x100b5dfcc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xa28>
100b5dfb8:     	bl	0x100ae37f8 <__Z15CLG_logref_initP10CLG_LogRef>
100b5dfbc:     	adrp	x8, 0x106658000 <__ZN7blender3seq28seqModifierType_WhiteBalanceE+0x40>
100b5dfc0:     	add	x8, x8, #0x298
100b5dfc4:     	ldr	x8, [x8]
100b5dfc8:     	ldr	x8, [x8, #0x8]
100b5dfcc:     	orr	w22, w22, w23
100b5dfd0:     	str	x8, [sp, #0x70]
100b5dfd4:     	ldr	w8, [x8, #0x50]
100b5dfd8:     	cmp	w8, #0x3
100b5dfdc:     	str	x27, [sp, #0x58]
100b5dfe0:     	b.le	0x100b5dd98 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7f4>
100b5dfe4:     	sturb	wzr, [x29, #-0xa0]
100b5dfe8:     	sturb	wzr, [x29, #-0x88]
100b5dfec:     	ldr	x23, [x26, #0x50]
100b5dff0:     	cbz	x23, 0x100b5e064 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac0>
100b5dff4:     	mov	x0, x24
100b5dff8:     	mov	w1, #0x0                ; =0
100b5dffc:     	bl	0x100b7bc38 <__Z20WM_operatortype_findPKcb>
100b5e000:     	cbz	x0, 0x100b5e070 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5e004:     	ldr	x1, [x26, #0xb0]
100b5e008:     	sub	x8, x29, #0x80
100b5e00c:     	ldr	x0, [sp, #0x98]
100b5e010:     	mov	w2, #0x0                ; =0
100b5e014:     	mov	w3, #0x0                ; =0
100b5e018:     	mov	w4, #0x1                ; =1
100b5e01c:     	mov	w5, #0x200              ; =512
100b5e020:     	bl	0x101260724 <__Z30RNA_pointer_as_string_keywordsP8bContextP10PointerRNAbbbi>
100b5e024:     	ldur	q0, [x29, #-0x80]
100b5e028:     	stur	q0, [x29, #-0xa0]
100b5e02c:     	ldur	x8, [x29, #-0x70]
100b5e030:     	stur	x8, [x29, #-0x90]
100b5e034:     	mov	w8, #0x1                ; =1
100b5e038:     	sturb	w8, [x29, #-0x88]
100b5e03c:     	ldursb	w8, [x29, #-0x89]
100b5e040:     	tbnz	w8, #0x1f, 0x100b5e12c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xb88>
100b5e044:     	ldur	q0, [x29, #-0xa0]
100b5e048:     	stur	q0, [x29, #-0xc0]
100b5e04c:     	ldur	x8, [x29, #-0x90]
100b5e050:     	stur	x8, [x29, #-0xb0]
100b5e054:     	b	0x100b5e138 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xb94>
100b5e058:     	cmp	w8, #0x2
100b5e05c:     	b.ne	0x100b5dda4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x800>
100b5e060:     	b	0x100b5de50 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8ac>
100b5e064:     	sturb	wzr, [x29, #-0xa9]
100b5e068:     	sturb	wzr, [x29, #-0xc0]
100b5e06c:     	b	0x100b5e138 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xb94>
100b5e070:     	str	x23, [sp, #0x48]
100b5e074:     	str	w22, [sp, #0x44]
100b5e078:     	ldr	x0, [x26, #0x50]
100b5e07c:     	mov	x1, #0x0                ; =0
100b5e080:     	bl	0x1001f8c44 <__Z9IDP_reprNPK10IDPropertyPj>
100b5e084:     	mov	x23, x0
100b5e088:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
100b5e08c:     	mov	x8, #0x7ffffffffffffff8 ; =9223372036854775800
100b5e090:     	cmp	x0, x8
100b5e094:     	b.hs	0x100b5ed18 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1774>
100b5e098:     	mov	x22, x0
100b5e09c:     	cmp	x0, #0x17
100b5e0a0:     	b.hs	0x100b5e0b4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xb10>
100b5e0a4:     	sturb	w22, [x29, #-0x89]
100b5e0a8:     	sub	x9, x29, #0xa0
100b5e0ac:     	cbnz	x22, 0x100b5e0e0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xb3c>
100b5e0b0:     	b	0x100b5e0f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xb54>
100b5e0b4:     	orr	x8, x22, #0x7
100b5e0b8:     	cmp	x8, #0x17
100b5e0bc:     	mov	w9, #0x19               ; =25
100b5e0c0:     	csinc	x0, x9, x8, eq
100b5e0c4:     	str	x0, [sp, #0x38]
100b5e0c8:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
100b5e0cc:     	mov	x9, x0
100b5e0d0:     	ldr	x8, [sp, #0x38]
100b5e0d4:     	orr	x8, x8, #0x8000000000000000
100b5e0d8:     	stp	x22, x8, [x29, #-0x98]
100b5e0dc:     	stur	x0, [x29, #-0xa0]
100b5e0e0:     	str	x9, [sp, #0x38]
100b5e0e4:     	mov	x0, x9
100b5e0e8:     	mov	x1, x23
100b5e0ec:     	mov	x2, x22
100b5e0f0:     	bl	0x104b72380 <_zlibVersion+0x104b72380>
100b5e0f4:     	ldr	x9, [sp, #0x38]
100b5e0f8:     	mov	x0, x23
100b5e0fc:     	strb	wzr, [x9, x22]
100b5e100:     	mov	w8, #0x1                ; =1
100b5e104:     	sturb	w8, [x29, #-0x88]
100b5e108:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
100b5e10c:     	add	x8, x8, #0x690
100b5e110:     	ldr	x8, [x8]
100b5e114:     	mov	w1, #0x0                ; =0
100b5e118:     	blr	x8
100b5e11c:     	ldr	w22, [sp, #0x44]
100b5e120:     	ldr	x23, [sp, #0x48]
100b5e124:     	ldursb	w8, [x29, #-0x89]
100b5e128:     	tbz	w8, #0x1f, 0x100b5e044 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xaa0>
100b5e12c:     	ldp	x1, x2, [x29, #-0xa0]
100b5e130:     	sub	x0, x29, #0xc0
100b5e134:     	bl	0x103d1d704 <__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE25__init_copy_ctor_externalEPKcm>
100b5e138:     	ldursb	x8, [x29, #-0xa9]
100b5e13c:     	cmp	x8, #0x0
100b5e140:     	ldp	x9, x10, [x29, #-0xc0]
100b5e144:     	sub	x11, x29, #0xc0
100b5e148:     	csel	x9, x9, x11, lt
100b5e14c:     	cmp	w8, #0x0
100b5e150:     	csel	x8, x10, x8, lt
100b5e154:     	stp	x24, xzr, [x29, #-0x80]
100b5e158:     	stp	x9, x8, [x29, #-0x70]
100b5e15c:     	sub	x8, x29, #0xd8
100b5e160:     	sub	x3, x29, #0x80
100b5e164:     	adrp	x0, 0x104bd1000 <__ZL3hex+0x534d>
100b5e168:     	add	x0, x0, #0x414
100b5e16c:     	mov	w1, #0x6                ; =6
100b5e170:     	mov	w2, #0xdc               ; =220
100b5e174:     	bl	0x104a3e4dc <__ZN3fmt3v107vformatENS0_17basic_string_viewIcEENS0_17basic_format_argsINS0_20basic_format_contextINS0_8appenderEcEEEE>
100b5e178:     	ldursb	w8, [x29, #-0xa9]
100b5e17c:     	tbz	w8, #0x1f, 0x100b5e188 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xbe4>
100b5e180:     	ldur	x0, [x29, #-0xc0]
100b5e184:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b5e188:     	cbz	x23, 0x100b5e19c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xbf8>
100b5e18c:     	ldursb	w8, [x29, #-0x89]
100b5e190:     	tbz	w8, #0x1f, 0x100b5e19c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xbf8>
100b5e194:     	ldur	x0, [x29, #-0xa0]
100b5e198:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b5e19c:     	ldursb	w8, [x29, #-0xc1]
100b5e1a0:     	ldur	x9, [x29, #-0xd8]
100b5e1a4:     	cmp	w8, #0x0
100b5e1a8:     	sub	x8, x29, #0xd8
100b5e1ac:     	csel	x24, x9, x8, lt
100b5e1b0:     	tst	w22, #0x2
100b5e1b4:     	adrp	x8, 0x104bd1000 <__ZL3hex+0x534d>
100b5e1b8:     	add	x8, x8, #0x423
100b5e1bc:     	adrp	x9, 0x104bd1000 <__ZL3hex+0x534d>
100b5e1c0:     	add	x9, x9, #0x439
100b5e1c4:     	csel	x8, x9, x8, eq
100b5e1c8:     	mov	x27, x22
100b5e1cc:     	ands	w22, w22, #0x1
100b5e1d0:     	adrp	x9, 0x104bd1000 <__ZL3hex+0x534d>
100b5e1d4:     	add	x9, x9, #0x41b
100b5e1d8:     	csel	x23, x8, x9, eq
100b5e1dc:     	sub	x8, x29, #0x80
100b5e1e0:     	mov	x0, x26
100b5e1e4:     	mov	w1, #0x0                ; =0
100b5e1e8:     	bl	0x100b754d4 <__Z24WM_keymap_item_to_stringPK12wmKeyMapItemb>
100b5e1ec:     	ldurb	w8, [x29, #-0x68]
100b5e1f0:     	tbz	w8, #0x0, 0x100b5e228 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xc84>
100b5e1f4:     	ldur	x8, [x29, #-0x70]
100b5e1f8:     	stur	x8, [x29, #-0x90]
100b5e1fc:     	ldur	q0, [x29, #-0x80]
100b5e200:     	stur	q0, [x29, #-0xa0]
100b5e204:     	stp	xzr, xzr, [x29, #-0x78]
100b5e208:     	stur	xzr, [x29, #-0x80]
100b5e20c:     	lsr	x8, x8, #56
100b5e210:     	sxtb	w8, w8
100b5e214:     	ldur	x9, [x29, #-0xa0]
100b5e218:     	cmp	w8, #0x0
100b5e21c:     	sub	x8, x29, #0xa0
100b5e220:     	csel	x8, x9, x8, lt
100b5e224:     	b	0x100b5e234 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xc90>
100b5e228:     	sturb	wzr, [x29, #-0x89]
100b5e22c:     	sturb	wzr, [x29, #-0xa0]
100b5e230:     	sub	x8, x29, #0xa0
100b5e234:     	stp	x23, x8, [sp, #0x10]
100b5e238:     	ldp	x8, x0, [sp, #0x68]
100b5e23c:     	stp	x8, x24, [sp]
100b5e240:     	mov	w1, #0x4                ; =4
100b5e244:     	adrp	x2, 0x104bd1000 <__ZL3hex+0x534d>
100b5e248:     	add	x2, x2, #0x3b9
100b5e24c:     	adrp	x3, 0x104bd1000 <__ZL3hex+0x534d>
100b5e250:     	add	x3, x3, #0x38f
100b5e254:     	adrp	x4, 0x104bd1000 <__ZL3hex+0x534d>
100b5e258:     	add	x4, x4, #0x3f5
100b5e25c:     	bl	0x100ae2b1c <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b5e260:     	ldursb	w8, [x29, #-0x89]
100b5e264:     	tbz	w8, #0x1f, 0x100b5e270 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xccc>
100b5e268:     	ldur	x0, [x29, #-0xa0]
100b5e26c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b5e270:     	ldurb	w8, [x29, #-0x68]
100b5e274:     	cmp	w8, #0x1
100b5e278:     	b.ne	0x100b5e28c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xce8>
100b5e27c:     	ldursb	w8, [x29, #-0x69]
100b5e280:     	tbz	w8, #0x1f, 0x100b5e28c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xce8>
100b5e284:     	ldur	x0, [x29, #-0x80]
100b5e288:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b5e28c:     	ldursb	w8, [x29, #-0xc1]
100b5e290:     	tbz	w8, #0x1f, 0x100b5dda0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7fc>
100b5e294:     	ldur	x0, [x29, #-0xd8]
100b5e298:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b5e29c:     	b	0x100b5dda0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7fc>
100b5e2a0:     	ldr	x8, [sp, #0x60]
100b5e2a4:     	cbz	x8, 0x100b5dd7c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7d8>
100b5e2a8:     	mov	x0, x28
100b5e2ac:     	mov	x1, x26
100b5e2b0:     	ldr	x2, [sp, #0x58]
100b5e2b4:     	blr	x8
100b5e2b8:     	b	0x100b5dd7c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7d8>
100b5e2bc:     	mov	w21, #0x0               ; =0
100b5e2c0:     	ldr	w8, [sp, #0xa8]
100b5e2c4:     	orr	w8, w21, w8
100b5e2c8:     	ldr	x26, [sp, #0x98]
100b5e2cc:     	str	w8, [sp, #0xa8]
100b5e2d0:     	tbz	w8, #0x0, 0x100b5e304 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xd60>
100b5e2d4:     	ldr	w8, [sp, #0x54]
100b5e2d8:     	and	w8, w8, #0xfff0
100b5e2dc:     	cmp	w8, #0x110
100b5e2e0:     	b.eq	0x100b5e304 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xd60>
100b5e2e4:     	mov	x0, x26
100b5e2e8:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5e2ec:     	cbz	x0, 0x100b5e304 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xd60>
100b5e2f0:     	mov	x0, x26
100b5e2f4:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5e2f8:     	mov	x1, x0
100b5e2fc:     	mov	x0, x26
100b5e300:     	bl	0x100b92bc8 <__Z16WM_tooltip_clearP8bContextP8wmWindow>
100b5e304:     	ldr	x27, [sp, #0x78]
100b5e308:     	b	0x100b5eb48 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a4>
100b5e30c:     	cmp	w8, #0xac
100b5e310:     	mov	w9, #0xb3               ; =179
100b5e314:     	ccmp	w8, w9, #0x4, ne
100b5e318:     	cset	w21, eq
100b5e31c:     	ldrh	w22, [x20, #0x12]
100b5e320:     	mov	x25, x26
100b5e324:     	mov	x0, x26
100b5e328:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b5e32c:     	str	x0, [sp, #0x68]
100b5e330:     	mov	x0, x25
100b5e334:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5e338:     	str	x0, [sp, #0x98]
100b5e33c:     	ldr	x8, [sp, #0x78]
100b5e340:     	ldr	x0, [x8, #0x20]
100b5e344:     	str	x0, [sp, #0x70]
100b5e348:     	bl	0x100b40a10 <__Z25wm_gizmomap_highlight_getP10wmGizmoMap>
100b5e34c:     	mov	x28, x0
100b5e350:     	cbz	x0, 0x100b5e384 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xde0>
100b5e354:     	ldrh	w8, [x20, #0x10]
100b5e358:     	sub	w8, w8, #0x1
100b5e35c:     	cmp	w8, #0x14
100b5e360:     	b.hi	0x100b5e384 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xde0>
100b5e364:     	ldrh	w8, [x20, #0x12]
100b5e368:     	cmp	w8, #0x1
100b5e36c:     	b.ne	0x100b5e384 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xde0>
100b5e370:     	mov	x0, x25
100b5e374:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5e378:     	mov	x1, x0
100b5e37c:     	mov	x0, x25
100b5e380:     	bl	0x100b92bc8 <__Z16WM_tooltip_clearP8bContextP8wmWindow>
100b5e384:     	ldr	x8, [sp, #0x98]
100b5e388:     	ldr	x8, [x8, #0x128]
100b5e38c:     	ldr	x8, [x8, #0xb8]
100b5e390:     	ldrb	w8, [x8, #0xf0]
100b5e394:     	cmp	w8, #0x1
100b5e398:     	b.ne	0x100b5e40c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xe68>
100b5e39c:     	add	x1, x20, #0x14
100b5e3a0:     	ldr	x0, [sp, #0x98]
100b5e3a4:     	mov	w2, #0x1                ; =1
100b5e3a8:     	bl	0x101f31d58 <__Z31UI_region_block_find_mouse_overPK7ARegionPKib>
100b5e3ac:     	cbz	x0, 0x100b5e40c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xe68>
100b5e3b0:     	mov	w21, #0x0               ; =0
100b5e3b4:     	cbz	x28, 0x100b5eb34 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1590>
100b5e3b8:     	ldrh	w8, [x20, #0x10]
100b5e3bc:     	mov	w9, #0x5025             ; =20517
100b5e3c0:     	cmp	w8, w9
100b5e3c4:     	b.eq	0x100b5eb34 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1590>
100b5e3c8:     	cmp	w22, #0x5
100b5e3cc:     	mov	x26, x25
100b5e3d0:     	ldr	x27, [sp, #0x78]
100b5e3d4:     	b.eq	0x100b5eb3c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1598>
100b5e3d8:     	mov	x0, x26
100b5e3dc:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5e3e0:     	mov	x1, x0
100b5e3e4:     	mov	x0, x25
100b5e3e8:     	bl	0x100b92bc8 <__Z16WM_tooltip_clearP8bContextP8wmWindow>
100b5e3ec:     	ldr	x0, [sp, #0x70]
100b5e3f0:     	mov	x1, x25
100b5e3f4:     	mov	x2, #0x0                ; =0
100b5e3f8:     	mov	w3, #0x0                ; =0
100b5e3fc:     	bl	0x100b4050c <__Z25wm_gizmomap_highlight_setP10wmGizmoMapPK8bContextP7wmGizmoi>
100b5e400:     	mov	w21, #0x0               ; =0
100b5e404:     	mov	x26, x25
100b5e408:     	b	0x100b5eb3c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1598>
100b5e40c:     	ldr	x0, [sp, #0x70]
100b5e410:     	bl	0x100b40504 <__Z21wm_gizmomap_modal_getP10wmGizmoMap>
100b5e414:     	str	x0, [sp, #0x60]
100b5e418:     	cbz	x28, 0x100b5e4c8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xf24>
100b5e41c:     	ldr	w8, [x28, #0x50]
100b5e420:     	str	w8, [sp, #0x54]
100b5e424:     	b	0x100b5e4cc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xf28>
100b5e428:     	ldr	x1, [x27, #0x38]
100b5e42c:     	cbz	x1, 0x100b5e438 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xe94>
100b5e430:     	mov	x0, x26
100b5e434:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b5e438:     	ldr	x1, [x27, #0x40]
100b5e43c:     	cbz	x1, 0x100b5e448 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xea4>
100b5e440:     	mov	x0, x26
100b5e444:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b5e448:     	ldr	x1, [x27, #0x48]
100b5e44c:     	cbz	x1, 0x100b5e458 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xeb4>
100b5e450:     	mov	x0, x26
100b5e454:     	bl	0x1000b4b90 <__Z23CTX_wm_region_popup_setP8bContextP7ARegion>
100b5e458:     	ldr	x8, [x27, #0x20]
100b5e45c:     	ldr	x2, [x27, #0x30]
100b5e460:     	mov	x0, x26
100b5e464:     	mov	x1, x20
100b5e468:     	blr	x8
100b5e46c:     	mov	x22, x0
100b5e470:     	cmp	w0, #0x1
100b5e474:     	ldr	w8, [sp, #0x84]
100b5e478:     	csinc	w8, w8, wzr, eq
100b5e47c:     	tbz	w8, #0x0, 0x100b5e580 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xfdc>
100b5e480:     	mov	x0, x26
100b5e484:     	mov	x1, x25
100b5e488:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b5e48c:     	mov	x0, x26
100b5e490:     	mov	x1, x24
100b5e494:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b5e498:     	mov	x0, x26
100b5e49c:     	mov	x1, x23
100b5e4a0:     	bl	0x1000b4b90 <__Z23CTX_wm_region_popup_setP8bContextP7ARegion>
100b5e4a4:     	cmp	w22, #0x1
100b5e4a8:     	cset	w8, eq
100b5e4ac:     	csel	w9, wzr, w21, eq
100b5e4b0:     	cmp	w9, #0x1
100b5e4b4:     	b.ne	0x100b5e5a8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1004>
100b5e4b8:     	mov	w8, #0x0                ; =0
100b5e4bc:     	adrp	x10, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b5e4c0:     	strb	w9, [x10, #0x828]
100b5e4c4:     	b	0x100b5e5a8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1004>
100b5e4c8:     	str	wzr, [sp, #0x54]
100b5e4cc:     	ldr	x8, [sp, #0x98]
100b5e4d0:     	ldr	x8, [x8, #0x128]
100b5e4d4:     	ldr	x8, [x8, #0x288]
100b5e4d8:     	ldr	x9, [sp, #0x78]
100b5e4dc:     	ldr	x0, [x9, #0x20]
100b5e4e0:     	cmp	x8, x0
100b5e4e4:     	b.eq	0x100b5e4ec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xf48>
100b5e4e8:     	bl	0x100b3f8d8 <__Z23WM_gizmomap_tag_refreshP10wmGizmoMap>
100b5e4ec:     	mov	x0, x25
100b5e4f0:     	ldr	x1, [sp, #0x78]
100b5e4f4:     	bl	0x100b409c0 <__Z33wm_gizmomap_handler_context_gizmoP8bContextP20wmEventHandler_Gizmo>
100b5e4f8:     	mov	x0, x25
100b5e4fc:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5e500:     	cbz	x0, 0x100b5e520 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xf7c>
100b5e504:     	ldr	w8, [x0, #0xa8]
100b5e508:     	ldp	w9, w10, [x20, #0x14]
100b5e50c:     	sub	w8, w9, w8
100b5e510:     	str	w8, [x20, #0x1c]
100b5e514:     	ldr	w8, [x0, #0xb0]
100b5e518:     	sub	w8, w10, w8
100b5e51c:     	b	0x100b5e528 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xf84>
100b5e520:     	mov	w8, #-0x1               ; =-1
100b5e524:     	str	w8, [x20, #0x1c]
100b5e528:     	str	w8, [x20, #0x20]
100b5e52c:     	ldr	x8, [sp, #0x60]
100b5e530:     	cbz	x8, 0x100b5e548 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xfa4>
100b5e534:     	mov	w8, #0x1                ; =1
100b5e538:     	str	w8, [sp, #0x58]
100b5e53c:     	mov	w24, #0x1               ; =1
100b5e540:     	mov	x23, x28
100b5e544:     	b	0x100b5e6a8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1104>
100b5e548:     	ldrh	w8, [x20, #0x10]
100b5e54c:     	cmp	w8, #0x4
100b5e550:     	csinc	w8, w21, wzr, ne
100b5e554:     	tbnz	w8, #0x0, 0x100b5e5b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1014>
100b5e558:     	cmp	w22, #0x5
100b5e55c:     	b.eq	0x100b5e5b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1014>
100b5e560:     	ldr	x0, [sp, #0x70]
100b5e564:     	bl	0x100b3fbbc <__Z29wm_gizmomap_highlight_pendingPK10wmGizmoMap>
100b5e568:     	mov	w24, #0x1               ; =1
100b5e56c:     	mov	w8, #0x1                ; =1
100b5e570:     	str	w8, [sp, #0x58]
100b5e574:     	mov	x23, x28
100b5e578:     	cbnz	w0, 0x100b5e5c4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1020>
100b5e57c:     	b	0x100b5e6a8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1104>
100b5e580:     	mov	x0, x26
100b5e584:     	mov	x1, #0x0                ; =0
100b5e588:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b5e58c:     	mov	x0, x26
100b5e590:     	mov	x1, #0x0                ; =0
100b5e594:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b5e598:     	mov	x0, x26
100b5e59c:     	mov	x1, #0x0                ; =0
100b5e5a0:     	bl	0x1000b4b90 <__Z23CTX_wm_region_popup_setP8bContextP7ARegion>
100b5e5a4:     	mov	w8, #0x1                ; =1
100b5e5a8:     	ldr	w9, [sp, #0xa8]
100b5e5ac:     	orr	w9, w8, w9
100b5e5b0:     	str	w9, [sp, #0xa8]
100b5e5b4:     	b	0x100b5eb48 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15a4>
100b5e5b8:     	and	w8, w22, #0xffff
100b5e5bc:     	cmp	w8, #0x5
100b5e5c0:     	csinc	w24, w21, wzr, ne
100b5e5c4:     	cmp	w22, #0x5
100b5e5c8:     	cset	w8, ne
100b5e5cc:     	str	w8, [sp, #0x58]
100b5e5d0:     	mov	w8, #-0x1               ; =-1
100b5e5d4:     	stur	w8, [x29, #-0x80]
100b5e5d8:     	sub	x3, x29, #0x80
100b5e5dc:     	ldr	x0, [sp, #0x70]
100b5e5e0:     	mov	x1, x25
100b5e5e4:     	mov	x2, x20
100b5e5e8:     	bl	0x100b3fbd0 <__Z26wm_gizmomap_highlight_findP10wmGizmoMapP8bContextPK7wmEventPi>
100b5e5ec:     	mov	x23, x0
100b5e5f0:     	orr	x8, x28, x0
100b5e5f4:     	cbz	x8, 0x100b5e68c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x10e8>
100b5e5f8:     	cmp	x28, x23
100b5e5fc:     	b.ne	0x100b5e614 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1070>
100b5e600:     	ldur	w8, [x29, #-0x80]
100b5e604:     	ldr	w9, [sp, #0x54]
100b5e608:     	mov	x3, x9
100b5e60c:     	cmp	w9, w8
100b5e610:     	b.eq	0x100b5e62c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1088>
100b5e614:     	mov	x0, x25
100b5e618:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5e61c:     	mov	x1, x0
100b5e620:     	mov	x0, x25
100b5e624:     	bl	0x100b92bc8 <__Z16WM_tooltip_clearP8bContextP8wmWindow>
100b5e628:     	ldur	w3, [x29, #-0x80]
100b5e62c:     	ldr	x0, [sp, #0x70]
100b5e630:     	mov	x1, x25
100b5e634:     	mov	x2, x23
100b5e638:     	bl	0x100b4050c <__Z25wm_gizmomap_highlight_setP10wmGizmoMapPK8bContextP7wmGizmoi>
100b5e63c:     	cmp	x23, #0x0
100b5e640:     	eor	w8, w0, #0x1
100b5e644:     	csinc	w8, w8, wzr, ne
100b5e648:     	tbnz	w8, #0x0, 0x100b5e6a0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x10fc>
100b5e64c:     	adrp	x8, 0x106d88000 <_build_commit_date>
100b5e650:     	add	x8, x8, #0xe08
100b5e654:     	ldrb	w8, [x8, #0x9]
100b5e658:     	tbz	w8, #0x3, 0x100b5e6a0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x10fc>
100b5e65c:     	ldrb	w8, [x23, #0x49]
100b5e660:     	tbnz	w8, #0x4, 0x100b5e6a0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x10fc>
100b5e664:     	mov	x0, x25
100b5e668:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5e66c:     	mov	x1, x0
100b5e670:     	mov	x0, x25
100b5e674:     	ldr	x2, [sp, #0x68]
100b5e678:     	ldr	x3, [sp, #0x98]
100b5e67c:     	adrp	x4, 0x100b40000 <__Z26wm_gizmomap_highlight_findP10wmGizmoMapP8bContextPK7wmEventPi+0x430>
100b5e680:     	add	x4, x4, #0xacc
100b5e684:     	bl	0x100b92bc0 <__Z21WM_tooltip_timer_initP8bContextP8wmWindowP7ScrAreaP7ARegionPFS6_S0_S6_PiPdPbE>
100b5e688:     	b	0x100b5e6a0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x10fc>
100b5e68c:     	ldur	w3, [x29, #-0x80]
100b5e690:     	ldr	x0, [sp, #0x70]
100b5e694:     	mov	x1, x25
100b5e698:     	mov	x2, #0x0                ; =0
100b5e69c:     	bl	0x100b4050c <__Z25wm_gizmomap_highlight_setP10wmGizmoMapPK8bContextP7wmGizmoi>
100b5e6a0:     	ldr	x0, [sp, #0x70]
100b5e6a4:     	bl	0x100b3fbc4 <__Z29wm_gizmomap_highlight_handledP10wmGizmoMap>
100b5e6a8:     	cbz	x23, 0x100b5e718 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1174>
100b5e6ac:     	ldr	w21, [x23, #0x48]
100b5e6b0:     	ubfx	w27, w21, #11, #1
100b5e6b4:     	cbz	w24, 0x100b5e728 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1184>
100b5e6b8:     	tbnz	w21, #0x5, 0x100b5e730 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x118c>
100b5e6bc:     	sturb	wzr, [x29, #-0x80]
100b5e6c0:     	ldp	x24, x1, [x23, #0x28]
100b5e6c4:     	cbnz	x1, 0x100b5e6d0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x112c>
100b5e6c8:     	ldr	x8, [x24, #0x10]
100b5e6cc:     	ldr	x1, [x8, #0xc8]
100b5e6d0:     	ldr	x0, [sp, #0x88]
100b5e6d4:     	bl	0x100b75794 <__Z16WM_keymap_activePK15wmWindowManagerP8wmKeyMap>
100b5e6d8:     	mov	x22, x0
100b5e6dc:     	sub	x7, x29, #0x80
100b5e6e0:     	mov	x0, x25
100b5e6e4:     	mov	x1, x20
100b5e6e8:     	ldr	x2, [sp, #0xb0]
100b5e6ec:     	ldr	x3, [sp, #0x78]
100b5e6f0:     	mov	x4, x24
100b5e6f4:     	mov	x5, x22
100b5e6f8:     	ldr	w6, [sp, #0x94]
100b5e6fc:     	bl	0x100b5ee60 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb>
100b5e700:     	mov	x26, x0
100b5e704:     	and	w8, w21, #0x800
100b5e708:     	bfxil	w8, w0, #0, #1
100b5e70c:     	cbz	w8, 0x100b5e760 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x11bc>
100b5e710:     	tbz	w26, #0x0, 0x100b5ea64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x14c0>
100b5e714:     	b	0x100b5ead4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1530>
100b5e718:     	mov	w27, #0x0               ; =0
100b5e71c:     	mov	w26, #0x0               ; =0
100b5e720:     	tbnz	w24, #0x0, 0x100b5ea64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x14c0>
100b5e724:     	b	0x100b5ead4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1530>
100b5e728:     	mov	w26, #0x0               ; =0
100b5e72c:     	b	0x100b5ead4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1530>
100b5e730:     	mov	w26, #0x0               ; =0
100b5e734:     	b	0x100b5ea64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x14c0>
100b5e738:     	ldrsh	w3, [x20, #0x12]
100b5e73c:     	mov	x0, x26
100b5e740:     	ldr	x1, [sp, #0xb0]
100b5e744:     	mov	x2, x27
100b5e748:     	bl	0x100b57544 <__ZL24wm_handler_fileselect_doP8bContextP8ListBaseP17wmEventHandler_Opi>
100b5e74c:     	b	0x100b5dc50 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x6ac>
100b5e750:     	ldrh	w10, [x20, #0x12]
100b5e754:     	cmp	w10, #0x4
100b5e758:     	b.ne	0x100b5da1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x478>
100b5e75c:     	b	0x100b5da64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x4c0>
100b5e760:     	ldurb	w8, [x29, #-0x80]
100b5e764:     	cmp	w8, #0x1
100b5e768:     	b.ne	0x100b5ea60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x14bc>
100b5e76c:     	ldrh	w8, [x20, #0x12]
100b5e770:     	cmp	w8, #0x1
100b5e774:     	b.ne	0x100b5ea60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x14bc>
100b5e778:     	ldrh	w23, [x20, #0x10]
100b5e77c:     	sub	w8, w23, #0x1
100b5e780:     	cmp	w8, #0x2
100b5e784:     	b.hi	0x100b5ea60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x14bc>
100b5e788:     	ldr	x22, [x22, #0x10]
100b5e78c:     	cbz	x22, 0x100b5ea60 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x14bc>
100b5e790:     	ldrb	w10, [x20, #0x2b]
100b5e794:     	ldrh	w11, [x20, #0x2c]
100b5e798:     	ldr	w21, [x20, #0x7c]
100b5e79c:     	ldrb	w8, [x20, #0x2a]
100b5e7a0:     	ubfx	w9, w8, #1, #1
100b5e7a4:     	str	w9, [sp, #0x38]
100b5e7a8:     	ubfx	w9, w8, #2, #1
100b5e7ac:     	str	w9, [sp, #0x34]
100b5e7b0:     	ldr	w9, [x20, #0x30]
100b5e7b4:     	str	w9, [sp, #0x48]
100b5e7b8:     	and	w24, w8, #0x1
100b5e7bc:     	and	w9, w23, #0xff
100b5e7c0:     	str	w9, [sp, #0x44]
100b5e7c4:     	ubfx	w9, w8, #3, #1
100b5e7c8:     	stp	w10, w9, [sp, #0x2c]
100b5e7cc:     	ubfx	w8, w8, #4, #1
100b5e7d0:     	stp	w11, w8, [sp, #0x24]
100b5e7d4:     	b	0x100b5e7e0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x123c>
100b5e7d8:     	ldr	x22, [x22]
100b5e7dc:     	cbz	x22, 0x100b5ec50 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16ac>
100b5e7e0:     	ldrb	w8, [x22, #0xac]
100b5e7e4:     	tbnz	w8, #0x0, 0x100b5e7d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1234>
100b5e7e8:     	tbz	w21, #0x1, 0x100b5e83c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1298>
100b5e7ec:     	tbz	w8, #0x4, 0x100b5e83c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1298>
100b5e7f0:     	ldrb	w8, [x22, #0xac]
100b5e7f4:     	tbnz	w8, #0x0, 0x100b5e7d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1234>
100b5e7f8:     	tbz	w21, #0x1, 0x100b5e800 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x125c>
100b5e7fc:     	tbnz	w8, #0x4, 0x100b5e7d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1234>
100b5e800:     	ldrsh	w0, [x22, #0x9a]
100b5e804:     	bl	0x100b4d278 <__Z20WM_userdef_event_mapi>
100b5e808:     	cmn	w0, #0x1
100b5e80c:     	b.eq	0x100b5e940 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x139c>
100b5e810:     	and	w8, w0, #0xfffffffe
100b5e814:     	cmp	w8, #0x1a
100b5e818:     	b.ne	0x100b5e938 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1394>
100b5e81c:     	cmp	w23, #0x1
100b5e820:     	b.ne	0x100b5e7d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1234>
100b5e824:     	cmp	w0, #0x1a
100b5e828:     	b.ne	0x100b5ea50 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x14ac>
100b5e82c:     	ldr	w8, [sp, #0x48]
100b5e830:     	cmp	w8, #0x1
100b5e834:     	b.ne	0x100b5e7d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1234>
100b5e838:     	b	0x100b5e940 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x139c>
100b5e83c:     	ldrsh	w0, [x22, #0x9a]
100b5e840:     	bl	0x100b4d278 <__Z20WM_userdef_event_mapi>
100b5e844:     	cmn	w0, #0x1
100b5e848:     	b.eq	0x100b5e880 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x12dc>
100b5e84c:     	and	w8, w0, #0xfffffffe
100b5e850:     	cmp	w8, #0x1a
100b5e854:     	b.ne	0x100b5e878 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x12d4>
100b5e858:     	cmp	w23, #0x1
100b5e85c:     	b.ne	0x100b5e7f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x124c>
100b5e860:     	cmp	w0, #0x1a
100b5e864:     	b.ne	0x100b5ea40 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x149c>
100b5e868:     	ldr	w8, [sp, #0x48]
100b5e86c:     	cmp	w8, #0x1
100b5e870:     	b.ne	0x100b5e7f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x124c>
100b5e874:     	b	0x100b5e880 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x12dc>
100b5e878:     	cmp	w0, w23
100b5e87c:     	b.ne	0x100b5e7f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x124c>
100b5e880:     	ldrb	w8, [x22, #0x9c]
100b5e884:     	cmp	w8, #0xff
100b5e888:     	b.eq	0x100b5e894 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x12f0>
100b5e88c:     	cmp	w8, #0x3
100b5e890:     	b.ne	0x100b5e7f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x124c>
100b5e894:     	ldrb	w8, [x22, #0x9e]
100b5e898:     	cmp	w8, #0xff
100b5e89c:     	b.eq	0x100b5e8a8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1304>
100b5e8a0:     	cmp	w24, w8
100b5e8a4:     	b.ne	0x100b5e7f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x124c>
100b5e8a8:     	ldrb	w8, [x22, #0x9f]
100b5e8ac:     	cmp	w8, #0xff
100b5e8b0:     	b.eq	0x100b5e8d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1334>
100b5e8b4:     	ldr	w9, [sp, #0x38]
100b5e8b8:     	cmp	w9, w8
100b5e8bc:     	b.eq	0x100b5e8d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1334>
100b5e8c0:     	ldr	w8, [sp, #0x44]
100b5e8c4:     	cmp	w8, #0xd7
100b5e8c8:     	b.eq	0x100b5e8d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1334>
100b5e8cc:     	ldr	w8, [sp, #0x44]
100b5e8d0:     	cmp	w8, #0xd4
100b5e8d4:     	b.ne	0x100b5e7f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x124c>
100b5e8d8:     	ldrb	w8, [x22, #0xa0]
100b5e8dc:     	cmp	w8, #0xff
100b5e8e0:     	b.eq	0x100b5e8f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x134c>
100b5e8e4:     	ldr	w9, [sp, #0x34]
100b5e8e8:     	cmp	w9, w8
100b5e8ec:     	b.ne	0x100b5e7f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x124c>
100b5e8f0:     	ldrb	w8, [x22, #0xa1]
100b5e8f4:     	cmp	w8, #0xff
100b5e8f8:     	b.eq	0x100b5e908 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1364>
100b5e8fc:     	ldr	w9, [sp, #0x30]
100b5e900:     	cmp	w9, w8
100b5e904:     	b.ne	0x100b5e7f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x124c>
100b5e908:     	ldrb	w8, [x22, #0xa2]
100b5e90c:     	cmp	w8, #0xff
100b5e910:     	b.eq	0x100b5e920 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x137c>
100b5e914:     	ldr	w9, [sp, #0x28]
100b5e918:     	cmp	w9, w8
100b5e91c:     	b.ne	0x100b5e7f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x124c>
100b5e920:     	ldrh	w8, [x22, #0xaa]
100b5e924:     	cbz	w8, 0x100b5ea0c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1468>
100b5e928:     	ldr	w9, [sp, #0x24]
100b5e92c:     	cmp	w9, w8
100b5e930:     	b.ne	0x100b5e7f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x124c>
100b5e934:     	b	0x100b5ea0c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1468>
100b5e938:     	cmp	w0, w23
100b5e93c:     	b.ne	0x100b5e7d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1234>
100b5e940:     	ldrb	w8, [x22, #0x9c]
100b5e944:     	cmp	w8, #0xff
100b5e948:     	b.eq	0x100b5e96c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x13c8>
100b5e94c:     	cmp	w8, #0x5
100b5e950:     	b.ne	0x100b5e7d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1234>
100b5e954:     	ldrb	w8, [x22, #0x9d]
100b5e958:     	cmp	w8, #0xff
100b5e95c:     	b.eq	0x100b5e96c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x13c8>
100b5e960:     	ldr	w9, [sp, #0x2c]
100b5e964:     	cmp	w8, w9
100b5e968:     	b.ne	0x100b5e7d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1234>
100b5e96c:     	ldrb	w8, [x22, #0x9e]
100b5e970:     	cmp	w8, #0xff
100b5e974:     	b.eq	0x100b5e980 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x13dc>
100b5e978:     	cmp	w24, w8
100b5e97c:     	b.ne	0x100b5e7d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1234>
100b5e980:     	ldrb	w8, [x22, #0x9f]
100b5e984:     	cmp	w8, #0xff
100b5e988:     	b.eq	0x100b5e9b0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x140c>
100b5e98c:     	ldr	w9, [sp, #0x38]
100b5e990:     	cmp	w9, w8
100b5e994:     	b.eq	0x100b5e9b0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x140c>
100b5e998:     	ldr	w8, [sp, #0x44]
100b5e99c:     	cmp	w8, #0xd7
100b5e9a0:     	b.eq	0x100b5e9b0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x140c>
100b5e9a4:     	ldr	w8, [sp, #0x44]
100b5e9a8:     	cmp	w8, #0xd4
100b5e9ac:     	b.ne	0x100b5e7d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1234>
100b5e9b0:     	ldrb	w8, [x22, #0xa0]
100b5e9b4:     	cmp	w8, #0xff
100b5e9b8:     	b.eq	0x100b5e9c8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1424>
100b5e9bc:     	ldr	w9, [sp, #0x34]
100b5e9c0:     	cmp	w9, w8
100b5e9c4:     	b.ne	0x100b5e7d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1234>
100b5e9c8:     	ldrb	w8, [x22, #0xa1]
100b5e9cc:     	cmp	w8, #0xff
100b5e9d0:     	b.eq	0x100b5e9e0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x143c>
100b5e9d4:     	ldr	w9, [sp, #0x30]
100b5e9d8:     	cmp	w9, w8
100b5e9dc:     	b.ne	0x100b5e7d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1234>
100b5e9e0:     	ldrb	w8, [x22, #0xa2]
100b5e9e4:     	cmp	w8, #0xff
100b5e9e8:     	b.eq	0x100b5e9f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1454>
100b5e9ec:     	ldr	w9, [sp, #0x28]
100b5e9f0:     	cmp	w9, w8
100b5e9f4:     	b.ne	0x100b5e7d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1234>
100b5e9f8:     	ldrh	w8, [x22, #0xaa]
100b5e9fc:     	cbz	w8, 0x100b5ea0c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1468>
100b5ea00:     	ldr	w9, [sp, #0x24]
100b5ea04:     	cmp	w9, w8
100b5ea08:     	b.ne	0x100b5e7d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1234>
100b5ea0c:     	add	x0, x22, #0x10
100b5ea10:     	mov	w1, #0x0                ; =0
100b5ea14:     	bl	0x100b7bc38 <__Z20WM_operatortype_findPKcb>
100b5ea18:     	mov	x1, x0
100b5ea1c:     	mov	x0, x25
100b5ea20:     	mov	x2, #0x0                ; =0
100b5ea24:     	mov	x3, #0x0                ; =0
100b5ea28:     	mov	w4, #0x0                ; =0
100b5ea2c:     	mov	w5, #0x1                ; =1
100b5ea30:     	mov	x6, #0x0                ; =0
100b5ea34:     	bl	0x100b4e810 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent>
100b5ea38:     	cbz	w0, 0x100b5e7d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1234>
100b5ea3c:     	b	0x100b5ec6c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16c8>
100b5ea40:     	ldr	w8, [sp, #0x48]
100b5ea44:     	cmp	w8, #0x2
100b5ea48:     	b.ne	0x100b5e7f0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x124c>
100b5ea4c:     	b	0x100b5e880 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x12dc>
100b5ea50:     	ldr	w8, [sp, #0x48]
100b5ea54:     	cmp	w8, #0x2
100b5ea58:     	b.eq	0x100b5e940 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x139c>
100b5ea5c:     	b	0x100b5e7d8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1234>
100b5ea60:     	mov	w27, #0x0               ; =0
100b5ea64:     	ldr	x0, [sp, #0x70]
100b5ea68:     	bl	0x100b3f814 <__Z27WM_gizmomap_is_any_selectedPK10wmGizmoMap>
100b5ea6c:     	cbz	w0, 0x100b5ead4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1530>
100b5ea70:     	ldr	x0, [sp, #0x70]
100b5ea74:     	bl	0x100b3f80c <__Z22WM_gizmomap_group_listP10wmGizmoMap>
100b5ea78:     	ldr	x22, [x0]
100b5ea7c:     	cbnz	x22, 0x100b5ea8c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x14e8>
100b5ea80:     	b	0x100b5ead4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1530>
100b5ea84:     	ldr	x22, [x22]
100b5ea88:     	cbz	x22, 0x100b5ead4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1530>
100b5ea8c:     	mov	x0, x22
100b5ea90:     	bl	0x100b3d0b8 <__Z29wm_gizmogroup_is_any_selectedPK12wmGizmoGroup>
100b5ea94:     	cbz	w0, 0x100b5ea84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x14e0>
100b5ea98:     	ldr	x8, [x22, #0x10]
100b5ea9c:     	ldr	x1, [x8, #0xc8]
100b5eaa0:     	ldr	x0, [sp, #0x88]
100b5eaa4:     	bl	0x100b75794 <__Z16WM_keymap_activePK15wmWindowManagerP8wmKeyMap>
100b5eaa8:     	mov	x5, x0
100b5eaac:     	mov	x0, x25
100b5eab0:     	mov	x1, x20
100b5eab4:     	ldr	x2, [sp, #0xb0]
100b5eab8:     	ldr	x3, [sp, #0x78]
100b5eabc:     	mov	x4, x22
100b5eac0:     	ldr	w6, [sp, #0x94]
100b5eac4:     	mov	x7, #0x0                ; =0
100b5eac8:     	bl	0x100b5ee60 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb>
100b5eacc:     	orr	w26, w0, w26
100b5ead0:     	tbz	w26, #0x0, 0x100b5ea84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x14e0>
100b5ead4:     	ldr	w8, [sp, #0x58]
100b5ead8:     	tbnz	w8, #0x0, 0x100b5eb08 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1564>
100b5eadc:     	ldr	x0, [sp, #0x70]
100b5eae0:     	bl	0x100b40504 <__Z21wm_gizmomap_modal_getP10wmGizmoMap>
100b5eae4:     	cbz	x0, 0x100b5eaf4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1550>
100b5eae8:     	ldr	x8, [sp, #0x60]
100b5eaec:     	cmp	x0, x8
100b5eaf0:     	b.ne	0x100b5eb08 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1564>
100b5eaf4:     	ldr	x0, [sp, #0x70]
100b5eaf8:     	mov	x1, x25
100b5eafc:     	mov	x2, x28
100b5eb00:     	ldr	w3, [sp, #0x54]
100b5eb04:     	bl	0x100b4050c <__Z25wm_gizmomap_highlight_setP10wmGizmoMapPK8bContextP7wmGizmoi>
100b5eb08:     	mov	x0, x25
100b5eb0c:     	ldr	x1, [sp, #0x68]
100b5eb10:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b5eb14:     	cmp	w26, #0x0
100b5eb18:     	cset	w8, eq
100b5eb1c:     	tst	w27, w8
100b5eb20:     	mov	w8, #0x5                ; =5
100b5eb24:     	csel	w21, w8, w26, ne
100b5eb28:     	mov	x0, x25
100b5eb2c:     	ldr	x1, [sp, #0x98]
100b5eb30:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b5eb34:     	mov	x26, x25
100b5eb38:     	ldr	x27, [sp, #0x78]
100b5eb3c:     	ldr	w8, [sp, #0xa8]
100b5eb40:     	orr	w8, w21, w8
100b5eb44:     	str	w8, [sp, #0xa8]
100b5eb48:     	ldr	w9, [sp, #0xa8]
100b5eb4c:     	ldr	w8, [sp, #0x84]
100b5eb50:     	and	w8, w9, w8
100b5eb54:     	tbz	w8, #0x0, 0x100b5eb64 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15c0>
100b5eb58:     	and	w9, w9, #0x6
100b5eb5c:     	str	w9, [sp, #0xa8]
100b5eb60:     	b	0x100b5eb68 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15c4>
100b5eb64:     	tbnz	w9, #0x0, 0x100b5ec7c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16d8>
100b5eb68:     	mov	x0, x26
100b5eb6c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5eb70:     	cbz	x0, 0x100b5ed10 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x176c>
100b5eb74:     	ldr	x0, [sp, #0xb0]
100b5eb78:     	mov	x1, x27
100b5eb7c:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b5eb80:     	cmn	w0, #0x1
100b5eb84:     	b.eq	0x100b5d844 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2a0>
100b5eb88:     	ldrb	w8, [x27, #0x14]
100b5eb8c:     	tbz	w8, #0x7, 0x100b5d844 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2a0>
100b5eb90:     	ldr	x0, [sp, #0xb0]
100b5eb94:     	mov	x1, x27
100b5eb98:     	bl	0x10078fe64 <__Z11BLI_remlinkP8ListBasePv>
100b5eb9c:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
100b5eba0:     	add	x8, x8, #0x690
100b5eba4:     	ldr	x8, [x8]
100b5eba8:     	mov	x0, x27
100b5ebac:     	mov	w1, #0x0                ; =0
100b5ebb0:     	blr	x8
100b5ebb4:     	b	0x100b5d844 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2a0>
100b5ebb8:     	ldr	x21, [x27, #0x48]
100b5ebbc:     	cbz	x21, 0x100b5dcd0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x72c>
100b5ebc0:     	add	x0, x21, #0x10
100b5ebc4:     	adrp	x1, 0x104bd0000 <__ZL3hex+0x434d>
100b5ebc8:     	add	x1, x1, #0x331
100b5ebcc:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
100b5ebd0:     	cbnz	w0, 0x100b5dcd0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x72c>
100b5ebd4:     	ldr	x8, [x21, #0xe0]
100b5ebd8:     	cbz	x8, 0x100b5dcd0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x72c>
100b5ebdc:     	mov	x0, x26
100b5ebe0:     	bl	0x101651018 <__Z20ED_operator_editmeshP8bContext>
100b5ebe4:     	cbz	w0, 0x100b5dcd0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x72c>
100b5ebe8:     	ldr	x8, [x27, #0x38]
100b5ebec:     	adrp	x9, 0x100b58000 <__ZL24wm_handler_fileselect_doP8bContextP8ListBaseP17wmEventHandler_Opi+0xabc>
100b5ebf0:     	add	x9, x9, #0xd10
100b5ebf4:     	cmp	x8, x9
100b5ebf8:     	b.eq	0x100b5ec0c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1668>
100b5ebfc:     	adrp	x9, 0x100b58000 <__ZL24wm_handler_fileselect_doP8bContextP8ListBaseP17wmEventHandler_Opi+0xabc>
100b5ec00:     	add	x9, x9, #0xf24
100b5ec04:     	cmp	x8, x9
100b5ec08:     	b.ne	0x100b5dcd0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x72c>
100b5ec0c:     	ldr	w8, [sp, #0xd8]
100b5ec10:     	cmp	w8, #0x1
100b5ec14:     	b.le	0x100b5dcd4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x730>
100b5ec18:     	ldr	x9, [x27, #0x48]
100b5ec1c:     	ldr	x22, [x9, #0xe0]
100b5ec20:     	lsl	x23, x8, #3
100b5ec24:     	mov	w21, #0x8               ; =8
100b5ec28:     	add	x8, sp, #0xc0
100b5ec2c:     	ldr	x24, [x8, x21]
100b5ec30:     	add	x0, x24, #0x30
100b5ec34:     	add	x1, x22, #0x4
100b5ec38:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
100b5ec3c:     	cbz	w0, 0x100b5ec58 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16b4>
100b5ec40:     	add	x21, x21, #0x8
100b5ec44:     	cmp	x23, x21
100b5ec48:     	b.ne	0x100b5ec28 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1684>
100b5ec4c:     	b	0x100b5dcd0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x72c>
100b5ec50:     	mov	w27, #0x0               ; =0
100b5ec54:     	b	0x100b5e710 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x116c>
100b5ec58:     	ldr	x8, [sp, #0xc0]
100b5ec5c:     	str	x24, [sp, #0xc0]
100b5ec60:     	add	x9, sp, #0xc0
100b5ec64:     	str	x8, [x9, x21]
100b5ec68:     	b	0x100b5dcd0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x72c>
100b5ec6c:     	mov	w27, #0x1               ; =1
100b5ec70:     	b	0x100b5e710 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x116c>
100b5ec74:     	mov	w9, #0x0                ; =0
100b5ec78:     	b	0x100b5ecb4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1710>
100b5ec7c:     	ldr	w10, [sp, #0xa8]
100b5ec80:     	cmp	w10, #0x5
100b5ec84:     	b.ne	0x100b5eca4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1700>
100b5ec88:     	mov	x0, x26
100b5ec8c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5ec90:     	mov	x1, x20
100b5ec94:     	bl	0x100b44830 <__Z20wm_cursor_arrow_moveP8wmWindowPK7wmEvent>
100b5ec98:     	mov	w10, #0x5               ; =5
100b5ec9c:     	b	0x100b5eca4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1700>
100b5eca0:     	mov	w10, #0x0               ; =0
100b5eca4:     	orr	w8, w10, #0x3
100b5eca8:     	ldr	w9, [sp, #0xac]
100b5ecac:     	cmp	w9, #0x0
100b5ecb0:     	csel	w9, w8, w10, ne
100b5ecb4:     	ldp	q0, q1, [sp, #0x180]
100b5ecb8:     	stp	q0, q1, [x19, #0xa0]
100b5ecbc:     	ldrb	w8, [sp, #0x1a0]
100b5ecc0:     	strb	w8, [x19, #0xc0]
100b5ecc4:     	ldp	q0, q1, [sp, #0x140]
100b5ecc8:     	stp	q0, q1, [x19, #0x60]
100b5eccc:     	ldp	q1, q0, [sp, #0x160]
100b5ecd0:     	stp	q1, q0, [x19, #0x80]
100b5ecd4:     	ldp	q0, q1, [sp, #0x100]
100b5ecd8:     	stp	q0, q1, [x19, #0x20]
100b5ecdc:     	ldp	q1, q0, [sp, #0x120]
100b5ece0:     	stp	q1, q0, [x19, #0x40]
100b5ece4:     	ldp	q1, q0, [sp, #0xe0]
100b5ece8:     	stp	q1, q0, [x19]
100b5ecec:     	mov	x0, x9
100b5ecf0:     	add	sp, sp, #0x230
100b5ecf4:     	ldp	x29, x30, [sp, #0x50]
100b5ecf8:     	ldp	x20, x19, [sp, #0x40]
100b5ecfc:     	ldp	x22, x21, [sp, #0x30]
100b5ed00:     	ldp	x24, x23, [sp, #0x20]
100b5ed04:     	ldp	x26, x25, [sp, #0x10]
100b5ed08:     	ldp	x28, x27, [sp], #0x60
100b5ed0c:     	ret
100b5ed10:     	ldr	w9, [sp, #0xa8]
100b5ed14:     	b	0x100b5ecb4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1710>
100b5ed18:     	sub	x0, x29, #0xa0
100b5ed1c:     	bl	0x100023e44 <__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne190102Ev>
100b5ed20:     	brk	#0x1
100b5ed24:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ed28:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ed2c:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ed30:     	mov	x20, x0
100b5ed34:     	b	0x100b5eddc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1838>
100b5ed38:     	mov	x20, x0
100b5ed3c:     	b	0x100b5eddc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1838>
100b5ed40:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ed44:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ed48:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ed4c:     	mov	x20, x0
100b5ed50:     	b	0x100b5eddc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1838>
100b5ed54:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ed58:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ed5c:     	mov	x20, x0
100b5ed60:     	b	0x100b5eddc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1838>
100b5ed64:     	mov	x20, x0
100b5ed68:     	b	0x100b5eddc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1838>
100b5ed6c:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ed70:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ed74:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ed78:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ed7c:     	mov	x20, x0
100b5ed80:     	ldursb	w8, [x29, #-0x89]
100b5ed84:     	tbz	w8, #0x1f, 0x100b5ed90 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x17ec>
100b5ed88:     	ldur	x0, [x29, #-0xa0]
100b5ed8c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b5ed90:     	ldurb	w8, [x29, #-0x68]
100b5ed94:     	cmp	w8, #0x1
100b5ed98:     	b.ne	0x100b5edb4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1810>
100b5ed9c:     	ldursb	w8, [x29, #-0x69]
100b5eda0:     	tbz	w8, #0x1f, 0x100b5edb4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1810>
100b5eda4:     	ldur	x0, [x29, #-0x80]
100b5eda8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b5edac:     	b	0x100b5edb4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1810>
100b5edb0:     	mov	x20, x0
100b5edb4:     	ldursb	w8, [x29, #-0xc1]
100b5edb8:     	tbz	w8, #0x1f, 0x100b5ee20 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x187c>
100b5edbc:     	ldur	x0, [x29, #-0xd8]
100b5edc0:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b5edc4:     	b	0x100b5ee20 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x187c>
100b5edc8:     	mov	x20, x0
100b5edcc:     	ldursb	w8, [x29, #-0xa9]
100b5edd0:     	tbz	w8, #0x1f, 0x100b5eddc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1838>
100b5edd4:     	ldur	x0, [x29, #-0xc0]
100b5edd8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b5eddc:     	ldurb	w8, [x29, #-0x88]
100b5ede0:     	cmp	w8, #0x1
100b5ede4:     	b.ne	0x100b5ee20 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x187c>
100b5ede8:     	ldursb	w8, [x29, #-0x89]
100b5edec:     	tbz	w8, #0x1f, 0x100b5ee20 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x187c>
100b5edf0:     	ldur	x0, [x29, #-0xa0]
100b5edf4:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b5edf8:     	b	0x100b5ee20 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x187c>
100b5edfc:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ee00:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ee04:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ee08:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ee0c:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ee10:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ee14:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ee18:     	b	0x100b5ee1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1878>
100b5ee1c:     	mov	x20, x0
100b5ee20:     	ldp	q0, q1, [sp, #0x180]
100b5ee24:     	stp	q0, q1, [x19, #0xa0]
100b5ee28:     	ldrb	w8, [sp, #0x1a0]
100b5ee2c:     	strb	w8, [x19, #0xc0]
100b5ee30:     	ldp	q0, q1, [sp, #0x140]
100b5ee34:     	stp	q0, q1, [x19, #0x60]
100b5ee38:     	ldp	q1, q0, [sp, #0x160]
100b5ee3c:     	stp	q1, q0, [x19, #0x80]
100b5ee40:     	ldp	q0, q1, [sp, #0x100]
100b5ee44:     	stp	q0, q1, [x19, #0x20]
100b5ee48:     	ldp	q1, q0, [sp, #0x120]
100b5ee4c:     	stp	q1, q0, [x19, #0x40]
100b5ee50:     	ldp	q1, q0, [sp, #0xe0]
100b5ee54:     	stp	q1, q0, [x19]
100b5ee58:     	mov	x0, x20
100b5ee5c:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
