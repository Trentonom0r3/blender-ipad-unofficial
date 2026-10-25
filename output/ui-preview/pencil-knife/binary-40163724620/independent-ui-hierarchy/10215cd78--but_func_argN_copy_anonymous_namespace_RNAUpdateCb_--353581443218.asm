
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010215cd78 <__Z18but_func_argN_copyIN12_GLOBAL__N_111RNAUpdateCbEEPvPKv>:
10215cd78:     	stp	x24, x23, [sp, #-0x40]!
10215cd7c:     	stp	x22, x21, [sp, #0x10]
10215cd80:     	stp	x20, x19, [sp, #0x20]
10215cd84:     	stp	x29, x30, [sp, #0x30]
10215cd88:     	add	x29, sp, #0x30
10215cd8c:     	mov	x19, x0
10215cd90:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
10215cd94:     	add	x8, x8, #0x6d0
10215cd98:     	ldr	x8, [x8]
10215cd9c:     	adrp	x2, 0x104d52000 <__ZL3hex+0x18634d>
10215cda0:     	add	x2, x2, #0x7c7
10215cda4:     	mov	w0, #0x68               ; =104
10215cda8:     	mov	w1, #0x8                ; =8
10215cdac:     	mov	w3, #0x1                ; =1
10215cdb0:     	blr	x8
10215cdb4:     	mov	x20, x0
10215cdb8:     	ldr	q0, [x19]
10215cdbc:     	ldr	x8, [x19, #0x10]
10215cdc0:     	str	x8, [x0, #0x10]
10215cdc4:     	str	q0, [x0]
10215cdc8:     	ldp	x24, x9, [x19, #0x18]
10215cdcc:     	add	x8, x0, #0x30
10215cdd0:     	mov	x22, x0
10215cdd4:     	str	x8, [x22, #0x18]!
10215cdd8:     	sub	x23, x9, x24
10215cddc:     	asr	x21, x23, #4
10215cde0:     	add	x9, x0, #0x50
10215cde4:     	stp	x8, x9, [x0, #0x20]
10215cde8:     	cmp	x21, #0x3
10215cdec:     	b.lt	0x10215ce04 <__Z18but_func_argN_copyIN12_GLOBAL__N_111RNAUpdateCbEEPvPKv+0x8c>
10215cdf0:     	mov	x0, x22
10215cdf4:     	mov	x1, x21
10215cdf8:     	bl	0x1000202b4 <__ZN7blender6VectorIZNS_3bke30try_capture_fields_on_geometryENS1_24MutableAttributeAccessorERKNS_2fn12FieldContextENS_4SpanINS_9StringRefEEENS1_10AttrDomainERKNS3_5FieldIbEENS7_INS3_6GFieldEEEE9AddResultLx4ENS_16GuardedAllocatorEE19realloc_to_at_leastEx>
10215cdfc:     	ldr	x8, [x22]
10215ce00:     	b	0x10215ce0c <__Z18but_func_argN_copyIN12_GLOBAL__N_111RNAUpdateCbEEPvPKv+0x94>
10215ce04:     	cmp	x21, #0x1
10215ce08:     	b.lt	0x10215ce28 <__Z18but_func_argN_copyIN12_GLOBAL__N_111RNAUpdateCbEEPvPKv+0xb0>
10215ce0c:     	add	x9, x21, #0x1
10215ce10:     	ldr	q0, [x24], #0x10
10215ce14:     	str	q0, [x8], #0x10
10215ce18:     	sub	x9, x9, #0x1
10215ce1c:     	cmp	x9, #0x1
10215ce20:     	b.hi	0x10215ce10 <__Z18but_func_argN_copyIN12_GLOBAL__N_111RNAUpdateCbEEPvPKv+0x98>
10215ce24:     	ldr	x8, [x20, #0x20]
10215ce28:     	add	x8, x8, x23
10215ce2c:     	str	x8, [x20, #0x20]
10215ce30:     	ldur	q0, [x19, #0x58]
10215ce34:     	stur	q0, [x20, #0x58]
10215ce38:     	mov	x0, x20
10215ce3c:     	ldp	x29, x30, [sp, #0x30]
10215ce40:     	ldp	x20, x19, [sp, #0x20]
10215ce44:     	ldp	x22, x21, [sp, #0x10]
10215ce48:     	ldp	x24, x23, [sp], #0x40
10215ce4c:     	ret
10215ce50:     	mov	x19, x0
10215ce54:     	mov	x0, x22
10215ce58:     	bl	0x1000144cc <__ZN7blender6VectorIxLx4ENS_16GuardedAllocatorEED1Ev>
10215ce5c:     	mov	x0, x19
10215ce60:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
