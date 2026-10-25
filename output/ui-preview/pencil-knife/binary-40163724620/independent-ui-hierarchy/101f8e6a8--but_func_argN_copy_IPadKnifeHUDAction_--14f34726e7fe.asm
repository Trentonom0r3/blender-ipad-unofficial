
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f8e6a8 <__Z18but_func_argN_copyI18IPadKnifeHUDActionEPvPKv>:
101f8e6a8:     	stp	x20, x19, [sp, #-0x20]!
101f8e6ac:     	stp	x29, x30, [sp, #0x10]
101f8e6b0:     	add	x29, sp, #0x10
101f8e6b4:     	mov	x19, x0
101f8e6b8:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101f8e6bc:     	add	x8, x8, #0x6d0
101f8e6c0:     	ldr	x8, [x8]
101f8e6c4:     	adrp	x2, 0x104d52000 <__ZL3hex+0x18634d>
101f8e6c8:     	add	x2, x2, #0x7c7
101f8e6cc:     	mov	w0, #0xc0               ; =192
101f8e6d0:     	mov	w1, #0x8                ; =8
101f8e6d4:     	mov	w3, #0x1                ; =1
101f8e6d8:     	blr	x8
101f8e6dc:     	ldp	q0, q1, [x19, #0x20]
101f8e6e0:     	ldp	q3, q2, [x19]
101f8e6e4:     	stp	q0, q1, [x0, #0x20]
101f8e6e8:     	stp	q3, q2, [x0]
101f8e6ec:     	ldp	q0, q1, [x19, #0x60]
101f8e6f0:     	ldp	q3, q2, [x19, #0x40]
101f8e6f4:     	stp	q0, q1, [x0, #0x60]
101f8e6f8:     	stp	q3, q2, [x0, #0x40]
101f8e6fc:     	ldp	q0, q1, [x19, #0xa0]
101f8e700:     	ldp	q3, q2, [x19, #0x80]
101f8e704:     	stp	q0, q1, [x0, #0xa0]
101f8e708:     	stp	q3, q2, [x0, #0x80]
101f8e70c:     	ldp	x29, x30, [sp, #0x10]
101f8e710:     	ldp	x20, x19, [sp], #0x20
101f8e714:     	ret
