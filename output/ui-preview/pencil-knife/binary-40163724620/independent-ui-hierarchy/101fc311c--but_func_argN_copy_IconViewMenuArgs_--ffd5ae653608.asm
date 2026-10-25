
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101fc311c <__Z18but_func_argN_copyI16IconViewMenuArgsEPvPKv>:
101fc311c:     	stp	x24, x23, [sp, #-0x40]!
101fc3120:     	stp	x22, x21, [sp, #0x10]
101fc3124:     	stp	x20, x19, [sp, #0x20]
101fc3128:     	stp	x29, x30, [sp, #0x30]
101fc312c:     	add	x29, sp, #0x30
101fc3130:     	mov	x19, x0
101fc3134:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101fc3138:     	add	x8, x8, #0x6d0
101fc313c:     	ldr	x8, [x8]
101fc3140:     	adrp	x2, 0x104d52000 <__ZL3hex+0x18634d>
101fc3144:     	add	x2, x2, #0x7c7
101fc3148:     	mov	w0, #0x68               ; =104
101fc314c:     	mov	w1, #0x8                ; =8
101fc3150:     	mov	w3, #0x1                ; =1
101fc3154:     	blr	x8
101fc3158:     	mov	x20, x0
101fc315c:     	ldr	q0, [x19]
101fc3160:     	ldr	x8, [x19, #0x10]
101fc3164:     	str	x8, [x0, #0x10]
101fc3168:     	str	q0, [x0]
101fc316c:     	ldp	x24, x9, [x19, #0x18]
101fc3170:     	add	x8, x0, #0x30
101fc3174:     	mov	x22, x0
101fc3178:     	str	x8, [x22, #0x18]!
101fc317c:     	sub	x23, x9, x24
101fc3180:     	asr	x21, x23, #4
101fc3184:     	add	x9, x0, #0x50
101fc3188:     	stp	x8, x9, [x0, #0x20]
101fc318c:     	cmp	x21, #0x3
101fc3190:     	b.lt	0x101fc31a8 <__Z18but_func_argN_copyI16IconViewMenuArgsEPvPKv+0x8c>
101fc3194:     	mov	x0, x22
101fc3198:     	mov	x1, x21
101fc319c:     	bl	0x1000202b4 <__ZN7blender6VectorIZNS_3bke30try_capture_fields_on_geometryENS1_24MutableAttributeAccessorERKNS_2fn12FieldContextENS_4SpanINS_9StringRefEEENS1_10AttrDomainERKNS3_5FieldIbEENS7_INS3_6GFieldEEEE9AddResultLx4ENS_16GuardedAllocatorEE19realloc_to_at_leastEx>
101fc31a0:     	ldr	x8, [x22]
101fc31a4:     	b	0x101fc31b0 <__Z18but_func_argN_copyI16IconViewMenuArgsEPvPKv+0x94>
101fc31a8:     	cmp	x21, #0x1
101fc31ac:     	b.lt	0x101fc31cc <__Z18but_func_argN_copyI16IconViewMenuArgsEPvPKv+0xb0>
101fc31b0:     	add	x9, x21, #0x1
101fc31b4:     	ldr	q0, [x24], #0x10
101fc31b8:     	str	q0, [x8], #0x10
101fc31bc:     	sub	x9, x9, #0x1
101fc31c0:     	cmp	x9, #0x1
101fc31c4:     	b.hi	0x101fc31b4 <__Z18but_func_argN_copyI16IconViewMenuArgsEPvPKv+0x98>
101fc31c8:     	ldr	x8, [x20, #0x20]
101fc31cc:     	add	x8, x8, x23
101fc31d0:     	str	x8, [x20, #0x20]
101fc31d4:     	ldur	q0, [x19, #0x58]
101fc31d8:     	stur	q0, [x20, #0x58]
101fc31dc:     	mov	x0, x20
101fc31e0:     	ldp	x29, x30, [sp, #0x30]
101fc31e4:     	ldp	x20, x19, [sp, #0x20]
101fc31e8:     	ldp	x22, x21, [sp, #0x10]
101fc31ec:     	ldp	x24, x23, [sp], #0x40
101fc31f0:     	ret
101fc31f4:     	mov	x19, x0
101fc31f8:     	mov	x0, x22
101fc31fc:     	bl	0x1000144cc <__ZN7blender6VectorIxLx4ENS_16GuardedAllocatorEED1Ev>
101fc3200:     	mov	x0, x19
101fc3204:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
