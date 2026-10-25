
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101fc6e0c <__Z18but_func_argN_copyI10TemplateIDEPvPKv>:
101fc6e0c:     	stp	x24, x23, [sp, #-0x40]!
101fc6e10:     	stp	x22, x21, [sp, #0x10]
101fc6e14:     	stp	x20, x19, [sp, #0x20]
101fc6e18:     	stp	x29, x30, [sp, #0x30]
101fc6e1c:     	add	x29, sp, #0x30
101fc6e20:     	mov	x19, x0
101fc6e24:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101fc6e28:     	add	x8, x8, #0x6d0
101fc6e2c:     	ldr	x8, [x8]
101fc6e30:     	adrp	x2, 0x104d52000 <__ZL3hex+0x18634d>
101fc6e34:     	add	x2, x2, #0x7c7
101fc6e38:     	mov	w0, #0x80               ; =128
101fc6e3c:     	mov	w1, #0x8                ; =8
101fc6e40:     	mov	w3, #0x1                ; =1
101fc6e44:     	blr	x8
101fc6e48:     	mov	x20, x0
101fc6e4c:     	ldr	q0, [x19]
101fc6e50:     	ldr	x8, [x19, #0x10]
101fc6e54:     	str	x8, [x0, #0x10]
101fc6e58:     	str	q0, [x0]
101fc6e5c:     	ldp	x24, x9, [x19, #0x18]
101fc6e60:     	add	x8, x0, #0x30
101fc6e64:     	mov	x22, x0
101fc6e68:     	str	x8, [x22, #0x18]!
101fc6e6c:     	sub	x23, x9, x24
101fc6e70:     	asr	x21, x23, #4
101fc6e74:     	add	x9, x0, #0x50
101fc6e78:     	stp	x8, x9, [x0, #0x20]
101fc6e7c:     	cmp	x21, #0x3
101fc6e80:     	b.lt	0x101fc6e98 <__Z18but_func_argN_copyI10TemplateIDEPvPKv+0x8c>
101fc6e84:     	mov	x0, x22
101fc6e88:     	mov	x1, x21
101fc6e8c:     	bl	0x1000202b4 <__ZN7blender6VectorIZNS_3bke30try_capture_fields_on_geometryENS1_24MutableAttributeAccessorERKNS_2fn12FieldContextENS_4SpanINS_9StringRefEEENS1_10AttrDomainERKNS3_5FieldIbEENS7_INS3_6GFieldEEEE9AddResultLx4ENS_16GuardedAllocatorEE19realloc_to_at_leastEx>
101fc6e90:     	ldr	x8, [x22]
101fc6e94:     	b	0x101fc6ea0 <__Z18but_func_argN_copyI10TemplateIDEPvPKv+0x94>
101fc6e98:     	cmp	x21, #0x1
101fc6e9c:     	b.lt	0x101fc6ebc <__Z18but_func_argN_copyI10TemplateIDEPvPKv+0xb0>
101fc6ea0:     	add	x9, x21, #0x1
101fc6ea4:     	ldr	q0, [x24], #0x10
101fc6ea8:     	str	q0, [x8], #0x10
101fc6eac:     	sub	x9, x9, #0x1
101fc6eb0:     	cmp	x9, #0x1
101fc6eb4:     	b.hi	0x101fc6ea4 <__Z18but_func_argN_copyI10TemplateIDEPvPKv+0x98>
101fc6eb8:     	ldr	x8, [x20, #0x20]
101fc6ebc:     	add	x8, x8, x23
101fc6ec0:     	str	x8, [x20, #0x20]
101fc6ec4:     	ldur	q0, [x19, #0x58]
101fc6ec8:     	ldur	q1, [x19, #0x68]
101fc6ecc:     	ldr	w8, [x19, #0x78]
101fc6ed0:     	str	w8, [x20, #0x78]
101fc6ed4:     	stur	q1, [x20, #0x68]
101fc6ed8:     	stur	q0, [x20, #0x58]
101fc6edc:     	mov	x0, x20
101fc6ee0:     	ldp	x29, x30, [sp, #0x30]
101fc6ee4:     	ldp	x20, x19, [sp, #0x20]
101fc6ee8:     	ldp	x22, x21, [sp, #0x10]
101fc6eec:     	ldp	x24, x23, [sp], #0x40
101fc6ef0:     	ret
101fc6ef4:     	mov	x19, x0
101fc6ef8:     	mov	x0, x22
101fc6efc:     	bl	0x1000144cc <__ZN7blender6VectorIxLx4ENS_16GuardedAllocatorEED1Ev>
101fc6f00:     	mov	x0, x19
101fc6f04:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
