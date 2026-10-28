
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b4d880 <__Z21WM_event_add_simulateP8wmWindowPK7wmEvent>:
100b4d880:     	stp	x22, x21, [sp, #-0x30]!
100b4d884:     	stp	x20, x19, [sp, #0x10]
100b4d888:     	stp	x29, x30, [sp, #0x20]
100b4d88c:     	add	x29, sp, #0x20
100b4d890:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b4d894:     	add	x8, x8, #0x28
100b4d898:     	ldrb	w8, [x8, #0xc2c]
100b4d89c:     	tbnz	w8, #0x3, 0x100b4d8c0 <__Z21WM_event_add_simulateP8wmWindowPK7wmEvent+0x40>
100b4d8a0:     	adrp	x0, 0x104bd4000 <__ZL3hex+0x45cd>
100b4d8a4:     	add	x0, x0, #0x32c
100b4d8a8:     	adrp	x2, 0x104bd4000 <__ZL3hex+0x45cd>
100b4d8ac:     	add	x2, x2, #0x363
100b4d8b0:     	mov	w1, #0xf1               ; =241
100b4d8b4:     	bl	0x10072af4c <__Z29_BLI_assert_unreachable_printPKciS0_>
100b4d8b8:     	mov	x0, #0x0                ; =0
100b4d8bc:     	b	0x100b4da20 <__Z21WM_event_add_simulateP8wmWindowPK7wmEvent+0x1a0>
100b4d8c0:     	mov	x20, x1
100b4d8c4:     	mov	x19, x0
100b4d8c8:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b4d8cc:     	add	x8, x8, #0x760
100b4d8d0:     	ldr	x8, [x8]
100b4d8d4:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b4d8d8:     	add	x3, x3, #0xa9d
100b4d8dc:     	mov	w22, #0x1               ; =1
100b4d8e0:     	mov	w0, #0x1                ; =1
100b4d8e4:     	mov	w1, #0xb0               ; =176
100b4d8e8:     	mov	w2, #0x8                ; =8
100b4d8ec:     	blr	x8
100b4d8f0:     	mov	x21, x0
100b4d8f4:     	ldp	q1, q0, [x20, #0x10]
100b4d8f8:     	ldr	q2, [x20]
100b4d8fc:     	stp	q2, q1, [x0]
100b4d900:     	str	q0, [x0, #0x20]
100b4d904:     	ldp	q0, q1, [x20, #0x50]
100b4d908:     	ldp	q3, q2, [x20, #0x30]
100b4d90c:     	stp	q0, q1, [x0, #0x50]
100b4d910:     	stp	q3, q2, [x0, #0x30]
100b4d914:     	ldp	q0, q1, [x20, #0x90]
100b4d918:     	ldp	q3, q2, [x20, #0x70]
100b4d91c:     	stp	q0, q1, [x0, #0x90]
100b4d920:     	stp	q3, q2, [x0, #0x70]
100b4d924:     	ldr	x0, [x19, #0x168]
100b4d928:     	mov	x1, x21
100b4d92c:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b4d930:     	mov	x0, x21
100b4d934:     	ldr	w8, [x21, #0x7c]
100b4d938:     	and	w8, w8, #0x1ff
100b4d93c:     	str	w8, [x21, #0x7c]
100b4d940:     	ldr	x8, [x19, #0xf0]
100b4d944:     	ldr	w9, [x21, #0x14]
100b4d948:     	str	w9, [x8, #0x14]
100b4d94c:     	ldr	w9, [x21, #0x18]
100b4d950:     	str	w9, [x8, #0x18]
100b4d954:     	ldrh	w8, [x21, #0x10]
100b4d958:     	cmp	w8, #0x13
100b4d95c:     	b.hi	0x100b4da30 <__Z21WM_event_add_simulateP8wmWindowPK7wmEvent+0x1b0>
100b4d960:     	lsl	w9, w22, w8
100b4d964:     	mov	w10, #0x18e             ; =398
100b4d968:     	movk	w10, #0xc, lsl #16
100b4d96c:     	tst	w9, w10
100b4d970:     	b.eq	0x100b4d9f8 <__Z21WM_event_add_simulateP8wmWindowPK7wmEvent+0x178>
100b4d974:     	sub	w8, w8, #0x12c
100b4d978:     	cmp	w8, #0x18
100b4d97c:     	cset	w9, lo
100b4d980:     	ldr	x8, [x19, #0xf0]
100b4d984:     	ldrh	w10, [x8, #0x12]
100b4d988:     	strh	w10, [x8, #0x92]
100b4d98c:     	strh	w10, [x0, #0x92]
100b4d990:     	ldrh	w10, [x8, #0x10]
100b4d994:     	strh	w10, [x8, #0x90]
100b4d998:     	strh	w10, [x0, #0x90]
100b4d99c:     	ldrh	w10, [x0, #0x12]
100b4d9a0:     	strh	w10, [x8, #0x12]
100b4d9a4:     	ldrh	w10, [x0, #0x10]
100b4d9a8:     	strh	w10, [x8, #0x10]
100b4d9ac:     	cbz	w9, 0x100b4d9b8 <__Z21WM_event_add_simulateP8wmWindowPK7wmEvent+0x138>
100b4d9b0:     	ldrb	w9, [x0, #0x2a]
100b4d9b4:     	strb	w9, [x8, #0x2a]
100b4d9b8:     	ldr	w9, [x0, #0x7c]
100b4d9bc:     	and	w9, w9, #0x2
100b4d9c0:     	str	w9, [x8, #0x7c]
100b4d9c4:     	ldrh	w9, [x0, #0x12]
100b4d9c8:     	cmp	w9, #0x1
100b4d9cc:     	b.ne	0x100b4da20 <__Z21WM_event_add_simulateP8wmWindowPK7wmEvent+0x1a0>
100b4d9d0:     	ldrb	w9, [x0, #0x7c]
100b4d9d4:     	tbnz	w9, #0x1, 0x100b4da20 <__Z21WM_event_add_simulateP8wmWindowPK7wmEvent+0x1a0>
100b4d9d8:     	strh	w10, [x8, #0x9c]
100b4d9dc:     	ldrb	w9, [x8, #0x2a]
100b4d9e0:     	strb	w9, [x8, #0xa8]
100b4d9e4:     	ldrh	w9, [x8, #0x2c]
100b4d9e8:     	strh	w9, [x8, #0xaa]
100b4d9ec:     	ldur	d0, [x8, #0x14]
100b4d9f0:     	str	d0, [x8, #0xa0]
100b4d9f4:     	b	0x100b4da20 <__Z21WM_event_add_simulateP8wmWindowPK7wmEvent+0x1a0>
100b4d9f8:     	cmp	w8, #0x4
100b4d9fc:     	b.ne	0x100b4da30 <__Z21WM_event_add_simulateP8wmWindowPK7wmEvent+0x1b0>
100b4da00:     	ldr	x8, [x19, #0xf0]
100b4da04:     	ldur	d0, [x8, #0x14]
100b4da08:     	stur	d0, [x8, #0x94]
100b4da0c:     	ldr	x8, [x19, #0xf0]
100b4da10:     	ldr	w9, [x8, #0x14]
100b4da14:     	str	w9, [x0, #0x94]
100b4da18:     	ldr	w8, [x8, #0x18]
100b4da1c:     	str	w8, [x0, #0x98]
100b4da20:     	ldp	x29, x30, [sp, #0x20]
100b4da24:     	ldp	x20, x19, [sp, #0x10]
100b4da28:     	ldp	x22, x21, [sp], #0x30
100b4da2c:     	ret
100b4da30:     	sub	w9, w8, #0x20
100b4da34:     	cmp	w9, #0xe0
100b4da38:     	b.hs	0x100b4da44 <__Z21WM_event_add_simulateP8wmWindowPK7wmEvent+0x1c4>
100b4da3c:     	mov	w9, #0x1                ; =1
100b4da40:     	b	0x100b4d980 <__Z21WM_event_add_simulateP8wmWindowPK7wmEvent+0x100>
100b4da44:     	sub	w9, w8, #0x12c
100b4da48:     	cmp	w9, #0x18
100b4da4c:     	b.lo	0x100b4d974 <__Z21WM_event_add_simulateP8wmWindowPK7wmEvent+0xf4>
100b4da50:     	sub	w9, w8, #0x191
100b4da54:     	cmp	w9, #0x2f
100b4da58:     	b.hi	0x100b4da20 <__Z21WM_event_add_simulateP8wmWindowPK7wmEvent+0x1a0>
100b4da5c:     	b	0x100b4d974 <__Z21WM_event_add_simulateP8wmWindowPK7wmEvent+0xf4>
