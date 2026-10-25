
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f5e850 <__Z18but_func_argN_copyI13MenuItemLevelEPvPKv>:
101f5e850:     	stp	x24, x23, [sp, #-0x40]!
101f5e854:     	stp	x22, x21, [sp, #0x10]
101f5e858:     	stp	x20, x19, [sp, #0x20]
101f5e85c:     	stp	x29, x30, [sp, #0x30]
101f5e860:     	add	x29, sp, #0x30
101f5e864:     	mov	x20, x0
101f5e868:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101f5e86c:     	add	x8, x8, #0x6d0
101f5e870:     	ldr	x8, [x8]
101f5e874:     	adrp	x2, 0x104d52000 <__ZL3hex+0x18634d>
101f5e878:     	add	x2, x2, #0x7c7
101f5e87c:     	mov	w0, #0xe0               ; =224
101f5e880:     	mov	w1, #0x8                ; =8
101f5e884:     	mov	w3, #0x1                ; =1
101f5e888:     	blr	x8
101f5e88c:     	mov	x19, x0
101f5e890:     	ldr	q0, [x20]
101f5e894:     	str	q0, [x0]
101f5e898:     	ldp	q0, q1, [x20, #0x30]
101f5e89c:     	ldp	q3, q2, [x20, #0x10]
101f5e8a0:     	stp	q0, q1, [x0, #0x30]
101f5e8a4:     	stp	q3, q2, [x0, #0x10]
101f5e8a8:     	ldp	q1, q0, [x20, #0x60]
101f5e8ac:     	ldrb	w8, [x20, #0x80]
101f5e8b0:     	ldr	q2, [x20, #0x50]
101f5e8b4:     	strb	w8, [x0, #0x80]
101f5e8b8:     	stp	q1, q0, [x0, #0x60]
101f5e8bc:     	str	q2, [x0, #0x50]
101f5e8c0:     	ldur	q0, [x20, #0x88]
101f5e8c4:     	ldr	x8, [x20, #0x98]
101f5e8c8:     	str	x8, [x0, #0x98]
101f5e8cc:     	stur	q0, [x0, #0x88]
101f5e8d0:     	ldp	x23, x9, [x20, #0xa0]
101f5e8d4:     	add	x8, x0, #0xb8
101f5e8d8:     	mov	x21, x0
101f5e8dc:     	str	x8, [x21, #0xa0]!
101f5e8e0:     	sub	x22, x9, x23
101f5e8e4:     	asr	x20, x22, #4
101f5e8e8:     	add	x9, x0, #0xd8
101f5e8ec:     	stp	x8, x9, [x0, #0xa8]
101f5e8f0:     	cmp	x20, #0x3
101f5e8f4:     	b.lt	0x101f5e90c <__Z18but_func_argN_copyI13MenuItemLevelEPvPKv+0xbc>
101f5e8f8:     	mov	x0, x21
101f5e8fc:     	mov	x1, x20
101f5e900:     	bl	0x1000202b4 <__ZN7blender6VectorIZNS_3bke30try_capture_fields_on_geometryENS1_24MutableAttributeAccessorERKNS_2fn12FieldContextENS_4SpanINS_9StringRefEEENS1_10AttrDomainERKNS3_5FieldIbEENS7_INS3_6GFieldEEEE9AddResultLx4ENS_16GuardedAllocatorEE19realloc_to_at_leastEx>
101f5e904:     	ldr	x8, [x21]
101f5e908:     	b	0x101f5e914 <__Z18but_func_argN_copyI13MenuItemLevelEPvPKv+0xc4>
101f5e90c:     	cmp	x20, #0x1
101f5e910:     	b.lt	0x101f5e930 <__Z18but_func_argN_copyI13MenuItemLevelEPvPKv+0xe0>
101f5e914:     	add	x9, x20, #0x1
101f5e918:     	ldr	q0, [x23], #0x10
101f5e91c:     	str	q0, [x8], #0x10
101f5e920:     	sub	x9, x9, #0x1
101f5e924:     	cmp	x9, #0x1
101f5e928:     	b.hi	0x101f5e918 <__Z18but_func_argN_copyI13MenuItemLevelEPvPKv+0xc8>
101f5e92c:     	ldr	x8, [x19, #0xa8]
101f5e930:     	add	x8, x8, x22
101f5e934:     	str	x8, [x19, #0xa8]
101f5e938:     	mov	x0, x19
101f5e93c:     	ldp	x29, x30, [sp, #0x30]
101f5e940:     	ldp	x20, x19, [sp, #0x20]
101f5e944:     	ldp	x22, x21, [sp, #0x10]
101f5e948:     	ldp	x24, x23, [sp], #0x40
101f5e94c:     	ret
101f5e950:     	mov	x19, x0
101f5e954:     	mov	x0, x21
101f5e958:     	bl	0x1000144cc <__ZN7blender6VectorIxLx4ENS_16GuardedAllocatorEED1Ev>
101f5e95c:     	mov	x0, x19
101f5e960:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
