
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101fb3ea8 <__Z18but_func_argN_copyI17ComponentMenuArgsEPvPKv>:
101fb3ea8:     	stp	x24, x23, [sp, #-0x40]!
101fb3eac:     	stp	x22, x21, [sp, #0x10]
101fb3eb0:     	stp	x20, x19, [sp, #0x20]
101fb3eb4:     	stp	x29, x30, [sp, #0x30]
101fb3eb8:     	add	x29, sp, #0x30
101fb3ebc:     	mov	x19, x0
101fb3ec0:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101fb3ec4:     	add	x8, x8, #0x6d0
101fb3ec8:     	ldr	x8, [x8]
101fb3ecc:     	adrp	x2, 0x104d52000 <__ZL3hex+0x18634d>
101fb3ed0:     	add	x2, x2, #0x7c7
101fb3ed4:     	mov	w0, #0x98               ; =152
101fb3ed8:     	mov	w1, #0x8                ; =8
101fb3edc:     	mov	w3, #0x1                ; =1
101fb3ee0:     	blr	x8
101fb3ee4:     	mov	x20, x0
101fb3ee8:     	ldr	q0, [x19]
101fb3eec:     	ldr	x8, [x19, #0x10]
101fb3ef0:     	str	x8, [x0, #0x10]
101fb3ef4:     	str	q0, [x0]
101fb3ef8:     	ldp	x24, x9, [x19, #0x18]
101fb3efc:     	add	x8, x0, #0x30
101fb3f00:     	mov	x22, x0
101fb3f04:     	str	x8, [x22, #0x18]!
101fb3f08:     	sub	x23, x9, x24
101fb3f0c:     	asr	x21, x23, #4
101fb3f10:     	add	x9, x0, #0x50
101fb3f14:     	stp	x8, x9, [x0, #0x20]
101fb3f18:     	cmp	x21, #0x3
101fb3f1c:     	b.lt	0x101fb3f34 <__Z18but_func_argN_copyI17ComponentMenuArgsEPvPKv+0x8c>
101fb3f20:     	mov	x0, x22
101fb3f24:     	mov	x1, x21
101fb3f28:     	bl	0x1000202b4 <__ZN7blender6VectorIZNS_3bke30try_capture_fields_on_geometryENS1_24MutableAttributeAccessorERKNS_2fn12FieldContextENS_4SpanINS_9StringRefEEENS1_10AttrDomainERKNS3_5FieldIbEENS7_INS3_6GFieldEEEE9AddResultLx4ENS_16GuardedAllocatorEE19realloc_to_at_leastEx>
101fb3f2c:     	ldr	x8, [x22]
101fb3f30:     	b	0x101fb3f3c <__Z18but_func_argN_copyI17ComponentMenuArgsEPvPKv+0x94>
101fb3f34:     	cmp	x21, #0x1
101fb3f38:     	b.lt	0x101fb3f58 <__Z18but_func_argN_copyI17ComponentMenuArgsEPvPKv+0xb0>
101fb3f3c:     	add	x9, x21, #0x1
101fb3f40:     	ldr	q0, [x24], #0x10
101fb3f44:     	str	q0, [x8], #0x10
101fb3f48:     	sub	x9, x9, #0x1
101fb3f4c:     	cmp	x9, #0x1
101fb3f50:     	b.hi	0x101fb3f40 <__Z18but_func_argN_copyI17ComponentMenuArgsEPvPKv+0x98>
101fb3f54:     	ldr	x8, [x20, #0x20]
101fb3f58:     	add	x8, x8, x23
101fb3f5c:     	str	x8, [x20, #0x20]
101fb3f60:     	ldur	q0, [x19, #0x58]
101fb3f64:     	ldur	q1, [x19, #0x68]
101fb3f68:     	ldur	q2, [x19, #0x78]
101fb3f6c:     	ldur	q3, [x19, #0x88]
101fb3f70:     	stur	q3, [x20, #0x88]
101fb3f74:     	stur	q2, [x20, #0x78]
101fb3f78:     	stur	q1, [x20, #0x68]
101fb3f7c:     	stur	q0, [x20, #0x58]
101fb3f80:     	mov	x0, x20
101fb3f84:     	ldp	x29, x30, [sp, #0x30]
101fb3f88:     	ldp	x20, x19, [sp, #0x20]
101fb3f8c:     	ldp	x22, x21, [sp, #0x10]
101fb3f90:     	ldp	x24, x23, [sp], #0x40
101fb3f94:     	ret
101fb3f98:     	mov	x19, x0
101fb3f9c:     	mov	x0, x22
101fb3fa0:     	bl	0x1000144cc <__ZN7blender6VectorIxLx4ENS_16GuardedAllocatorEED1Ev>
101fb3fa4:     	mov	x0, x19
101fb3fa8:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
