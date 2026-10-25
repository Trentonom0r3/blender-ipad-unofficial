
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101fb1c80 <__Z18but_func_argN_copyI11RNAUpdateCbEPvPKv>:
101fb1c80:     	stp	x24, x23, [sp, #-0x40]!
101fb1c84:     	stp	x22, x21, [sp, #0x10]
101fb1c88:     	stp	x20, x19, [sp, #0x20]
101fb1c8c:     	stp	x29, x30, [sp, #0x30]
101fb1c90:     	add	x29, sp, #0x30
101fb1c94:     	mov	x19, x0
101fb1c98:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101fb1c9c:     	add	x8, x8, #0x6d0
101fb1ca0:     	ldr	x8, [x8]
101fb1ca4:     	adrp	x2, 0x104d52000 <__ZL3hex+0x18634d>
101fb1ca8:     	add	x2, x2, #0x7c7
101fb1cac:     	mov	w0, #0x60               ; =96
101fb1cb0:     	mov	w1, #0x8                ; =8
101fb1cb4:     	mov	w3, #0x1                ; =1
101fb1cb8:     	blr	x8
101fb1cbc:     	mov	x20, x0
101fb1cc0:     	ldr	q0, [x19]
101fb1cc4:     	ldr	x8, [x19, #0x10]
101fb1cc8:     	str	x8, [x0, #0x10]
101fb1ccc:     	str	q0, [x0]
101fb1cd0:     	ldp	x24, x9, [x19, #0x18]
101fb1cd4:     	add	x8, x0, #0x30
101fb1cd8:     	mov	x22, x0
101fb1cdc:     	str	x8, [x22, #0x18]!
101fb1ce0:     	sub	x23, x9, x24
101fb1ce4:     	asr	x21, x23, #4
101fb1ce8:     	add	x9, x0, #0x50
101fb1cec:     	stp	x8, x9, [x0, #0x20]
101fb1cf0:     	cmp	x21, #0x3
101fb1cf4:     	b.lt	0x101fb1d0c <__Z18but_func_argN_copyI11RNAUpdateCbEPvPKv+0x8c>
101fb1cf8:     	mov	x0, x22
101fb1cfc:     	mov	x1, x21
101fb1d00:     	bl	0x1000202b4 <__ZN7blender6VectorIZNS_3bke30try_capture_fields_on_geometryENS1_24MutableAttributeAccessorERKNS_2fn12FieldContextENS_4SpanINS_9StringRefEEENS1_10AttrDomainERKNS3_5FieldIbEENS7_INS3_6GFieldEEEE9AddResultLx4ENS_16GuardedAllocatorEE19realloc_to_at_leastEx>
101fb1d04:     	ldr	x8, [x22]
101fb1d08:     	b	0x101fb1d14 <__Z18but_func_argN_copyI11RNAUpdateCbEPvPKv+0x94>
101fb1d0c:     	cmp	x21, #0x1
101fb1d10:     	b.lt	0x101fb1d30 <__Z18but_func_argN_copyI11RNAUpdateCbEPvPKv+0xb0>
101fb1d14:     	add	x9, x21, #0x1
101fb1d18:     	ldr	q0, [x24], #0x10
101fb1d1c:     	str	q0, [x8], #0x10
101fb1d20:     	sub	x9, x9, #0x1
101fb1d24:     	cmp	x9, #0x1
101fb1d28:     	b.hi	0x101fb1d18 <__Z18but_func_argN_copyI11RNAUpdateCbEPvPKv+0x98>
101fb1d2c:     	ldr	x8, [x20, #0x20]
101fb1d30:     	add	x8, x8, x23
101fb1d34:     	str	x8, [x20, #0x20]
101fb1d38:     	ldr	x8, [x19, #0x58]
101fb1d3c:     	str	x8, [x20, #0x58]
101fb1d40:     	mov	x0, x20
101fb1d44:     	ldp	x29, x30, [sp, #0x30]
101fb1d48:     	ldp	x20, x19, [sp, #0x20]
101fb1d4c:     	ldp	x22, x21, [sp, #0x10]
101fb1d50:     	ldp	x24, x23, [sp], #0x40
101fb1d54:     	ret
101fb1d58:     	mov	x19, x0
101fb1d5c:     	mov	x0, x22
101fb1d60:     	bl	0x1000144cc <__ZN7blender6VectorIxLx4ENS_16GuardedAllocatorEED1Ev>
101fb1d64:     	mov	x0, x19
101fb1d68:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
