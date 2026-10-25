
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010210dc7c <__Z18but_func_argN_copyI15ButsTextureUserEPvPKv>:
10210dc7c:     	stp	x24, x23, [sp, #-0x40]!
10210dc80:     	stp	x22, x21, [sp, #0x10]
10210dc84:     	stp	x20, x19, [sp, #0x20]
10210dc88:     	stp	x29, x30, [sp, #0x30]
10210dc8c:     	add	x29, sp, #0x30
10210dc90:     	mov	x19, x0
10210dc94:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
10210dc98:     	add	x8, x8, #0x6d0
10210dc9c:     	ldr	x8, [x8]
10210dca0:     	adrp	x2, 0x104d52000 <__ZL3hex+0x18634d>
10210dca4:     	add	x2, x2, #0x7c7
10210dca8:     	mov	w0, #0xb0               ; =176
10210dcac:     	mov	w1, #0x8                ; =8
10210dcb0:     	mov	w3, #0x1                ; =1
10210dcb4:     	blr	x8
10210dcb8:     	mov	x20, x0
10210dcbc:     	ldr	q0, [x19]
10210dcc0:     	ldr	x8, [x19, #0x10]
10210dcc4:     	str	x8, [x0, #0x10]
10210dcc8:     	str	q0, [x0]
10210dccc:     	ldr	x8, [x19, #0x28]
10210dcd0:     	ldur	q0, [x19, #0x18]
10210dcd4:     	stur	q0, [x0, #0x18]
10210dcd8:     	str	x8, [x0, #0x28]
10210dcdc:     	ldp	x24, x9, [x19, #0x30]
10210dce0:     	add	x8, x0, #0x48
10210dce4:     	mov	x22, x0
10210dce8:     	str	x8, [x22, #0x30]!
10210dcec:     	sub	x23, x9, x24
10210dcf0:     	asr	x21, x23, #4
10210dcf4:     	add	x9, x0, #0x68
10210dcf8:     	stp	x8, x9, [x0, #0x38]
10210dcfc:     	cmp	x21, #0x3
10210dd00:     	b.lt	0x10210dd18 <__Z18but_func_argN_copyI15ButsTextureUserEPvPKv+0x9c>
10210dd04:     	mov	x0, x22
10210dd08:     	mov	x1, x21
10210dd0c:     	bl	0x1000202b4 <__ZN7blender6VectorIZNS_3bke30try_capture_fields_on_geometryENS1_24MutableAttributeAccessorERKNS_2fn12FieldContextENS_4SpanINS_9StringRefEEENS1_10AttrDomainERKNS3_5FieldIbEENS7_INS3_6GFieldEEEE9AddResultLx4ENS_16GuardedAllocatorEE19realloc_to_at_leastEx>
10210dd10:     	ldr	x8, [x22]
10210dd14:     	b	0x10210dd20 <__Z18but_func_argN_copyI15ButsTextureUserEPvPKv+0xa4>
10210dd18:     	cmp	x21, #0x1
10210dd1c:     	b.lt	0x10210dd3c <__Z18but_func_argN_copyI15ButsTextureUserEPvPKv+0xc0>
10210dd20:     	add	x9, x21, #0x1
10210dd24:     	ldr	q0, [x24], #0x10
10210dd28:     	str	q0, [x8], #0x10
10210dd2c:     	sub	x9, x9, #0x1
10210dd30:     	cmp	x9, #0x1
10210dd34:     	b.hi	0x10210dd24 <__Z18but_func_argN_copyI15ButsTextureUserEPvPKv+0xa8>
10210dd38:     	ldr	x8, [x20, #0x38]
10210dd3c:     	add	x8, x8, x23
10210dd40:     	str	x8, [x20, #0x38]
10210dd44:     	ldp	q0, q1, [x19, #0x70]
10210dd48:     	ldr	q2, [x19, #0x90]
10210dd4c:     	ldur	q3, [x19, #0x9c]
10210dd50:     	stur	q3, [x20, #0x9c]
10210dd54:     	stp	q1, q2, [x20, #0x80]
10210dd58:     	str	q0, [x20, #0x70]
10210dd5c:     	mov	x0, x20
10210dd60:     	ldp	x29, x30, [sp, #0x30]
10210dd64:     	ldp	x20, x19, [sp, #0x20]
10210dd68:     	ldp	x22, x21, [sp, #0x10]
10210dd6c:     	ldp	x24, x23, [sp], #0x40
10210dd70:     	ret
10210dd74:     	mov	x19, x0
10210dd78:     	mov	x0, x22
10210dd7c:     	bl	0x1000144cc <__ZN7blender6VectorIxLx4ENS_16GuardedAllocatorEED1Ev>
10210dd80:     	mov	x0, x19
10210dd84:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
