
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b4d7e4 <__Z12WM_event_addP8wmWindowPK7wmEvent>:
100b4d7e4:     	stp	x22, x21, [sp, #-0x30]!
100b4d7e8:     	stp	x20, x19, [sp, #0x10]
100b4d7ec:     	stp	x29, x30, [sp, #0x20]
100b4d7f0:     	add	x29, sp, #0x20
100b4d7f4:     	mov	x19, x1
100b4d7f8:     	mov	x20, x0
100b4d7fc:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b4d800:     	add	x8, x8, #0x760
100b4d804:     	ldr	x8, [x8]
100b4d808:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b4d80c:     	add	x3, x3, #0xa9d
100b4d810:     	mov	w0, #0x1                ; =1
100b4d814:     	mov	w1, #0xb0               ; =176
100b4d818:     	mov	w2, #0x8                ; =8
100b4d81c:     	blr	x8
100b4d820:     	mov	x21, x0
100b4d824:     	ldp	q1, q0, [x19, #0x10]
100b4d828:     	ldr	q2, [x19]
100b4d82c:     	stp	q2, q1, [x0]
100b4d830:     	str	q0, [x0, #0x20]
100b4d834:     	ldp	q0, q1, [x19, #0x50]
100b4d838:     	ldp	q3, q2, [x19, #0x30]
100b4d83c:     	stp	q0, q1, [x0, #0x50]
100b4d840:     	stp	q3, q2, [x0, #0x30]
100b4d844:     	ldp	q0, q1, [x19, #0x90]
100b4d848:     	ldp	q3, q2, [x19, #0x70]
100b4d84c:     	stp	q0, q1, [x0, #0x90]
100b4d850:     	stp	q3, q2, [x0, #0x70]
100b4d854:     	ldr	x0, [x20, #0x168]
100b4d858:     	mov	x1, x21
100b4d85c:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b4d860:     	ldr	w8, [x21, #0x7c]
100b4d864:     	and	w8, w8, #0x1ff
100b4d868:     	str	w8, [x21, #0x7c]
100b4d86c:     	mov	x0, x21
100b4d870:     	ldp	x29, x30, [sp, #0x20]
100b4d874:     	ldp	x20, x19, [sp, #0x10]
100b4d878:     	ldp	x22, x21, [sp], #0x30
100b4d87c:     	ret
