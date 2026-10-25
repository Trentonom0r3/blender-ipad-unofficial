
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b50c20 <__Z26WM_ipad_knife_action_queueP8bContextRK16wmIPadKnifeOwner17wmIPadKnifeAction>:
100b50c20:     	stp	d9, d8, [sp, #-0x50]!
100b50c24:     	stp	x24, x23, [sp, #0x10]
100b50c28:     	stp	x22, x21, [sp, #0x20]
100b50c2c:     	stp	x20, x19, [sp, #0x30]
100b50c30:     	stp	x29, x30, [sp, #0x40]
100b50c34:     	add	x29, sp, #0x40
100b50c38:     	mov	x20, x0
100b50c3c:     	adrp	x0, 0x106d86000 <__PyRuntime+0x280b8>
100b50c40:     	add	x0, x0, #0xb60
100b50c44:     	ldr	x8, [x0]
100b50c48:     	blr	x8
100b50c4c:     	ldrb	w8, [x0, #0xd0]
100b50c50:     	cmp	w8, #0x1
100b50c54:     	b.ne	0x100b50c60 <__Z26WM_ipad_knife_action_queueP8bContextRK16wmIPadKnifeOwner17wmIPadKnifeAction+0x40>
100b50c58:     	ldrb	w8, [x0, #0xd1]
100b50c5c:     	tbz	w8, #0x0, 0x100b50c80 <__Z26WM_ipad_knife_action_queueP8bContextRK16wmIPadKnifeOwner17wmIPadKnifeAction+0x60>
100b50c60:     	mov	w19, #0x0               ; =0
100b50c64:     	mov	x0, x19
100b50c68:     	ldp	x29, x30, [sp, #0x40]
100b50c6c:     	ldp	x20, x19, [sp, #0x30]
100b50c70:     	ldp	x22, x21, [sp, #0x20]
100b50c74:     	ldp	x24, x23, [sp, #0x10]
100b50c78:     	ldp	d9, d8, [sp], #0x50
100b50c7c:     	ret
100b50c80:     	mov	x22, x2
100b50c84:     	mov	x21, x0
100b50c88:     	mov	x23, x1
100b50c8c:     	mov	w2, #0xb8               ; =184
100b50c90:     	bl	0x104b72368 <_zlibVersion+0x104b72368>
100b50c94:     	mov	w19, #0x0               ; =0
100b50c98:     	cbz	x20, 0x100b50c64 <__Z26WM_ipad_knife_action_queueP8bContextRK16wmIPadKnifeOwner17wmIPadKnifeAction+0x44>
100b50c9c:     	sub	w8, w22, #0x3
100b50ca0:     	cmn	w8, #0x2
100b50ca4:     	b.lo	0x100b50c64 <__Z26WM_ipad_knife_action_queueP8bContextRK16wmIPadKnifeOwner17wmIPadKnifeAction+0x44>
100b50ca8:     	cbnz	w0, 0x100b50c64 <__Z26WM_ipad_knife_action_queueP8bContextRK16wmIPadKnifeOwner17wmIPadKnifeAction+0x44>
100b50cac:     	ldr	x8, [x21]
100b50cb0:     	ldr	x9, [x21, #0x10]
100b50cb4:     	ldr	x10, [x21, #0x30]
100b50cb8:     	ldr	x11, [x21, #0x88]
100b50cbc:     	cmp	x8, #0x0
100b50cc0:     	ccmp	x9, #0x0, #0x4, ne
100b50cc4:     	ccmp	x10, #0x0, #0x4, ne
100b50cc8:     	ccmp	x11, #0x0, #0x4, ne
100b50ccc:     	b.eq	0x100b50c60 <__Z26WM_ipad_knife_action_queueP8bContextRK16wmIPadKnifeOwner17wmIPadKnifeAction+0x40>
100b50cd0:     	mov	x19, x21
100b50cd4:     	ldr	x8, [x21, #0x98]
100b50cd8:     	ldp	x9, x10, [x21, #0xb8]
100b50cdc:     	cmp	x8, #0x0
100b50ce0:     	ccmp	x9, #0x0, #0x4, ne
100b50ce4:     	ccmp	x10, #0x0, #0x4, ne
100b50ce8:     	b.eq	0x100b50c60 <__Z26WM_ipad_knife_action_queueP8bContextRK16wmIPadKnifeOwner17wmIPadKnifeAction+0x40>
100b50cec:     	mov	x0, x20
100b50cf0:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b50cf4:     	mov	x1, x0
100b50cf8:     	mov	x0, x20
100b50cfc:     	mov	x2, x19
100b50d00:     	mov	w3, #0x0                ; =0
100b50d04:     	bl	0x100b5099c <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb>
100b50d08:     	cbz	x0, 0x100b50c60 <__Z26WM_ipad_knife_action_queueP8bContextRK16wmIPadKnifeOwner17wmIPadKnifeAction+0x40>
100b50d0c:     	mov	w19, #0x1               ; =1
100b50d10:     	mov	x24, x21
100b50d14:     	strb	w19, [x21, #0xd1]
100b50d18:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
100b50d1c:     	add	x8, x8, #0x6d0
100b50d20:     	ldr	x8, [x8]
100b50d24:     	adrp	x2, 0x104bd0000 <__ZL3hex+0x434d>
100b50d28:     	add	x2, x2, #0x6d3
100b50d2c:     	mov	w0, #0xc0               ; =192
100b50d30:     	mov	w1, #0x8                ; =8
100b50d34:     	mov	w3, #0x1                ; =1
100b50d38:     	blr	x8
100b50d3c:     	mov	x21, x0
100b50d40:     	movi.16b	v0, #0x0
100b50d44:     	stp	q0, q0, [x0]
100b50d48:     	stp	q0, q0, [x0, #0x20]
100b50d4c:     	stp	q0, q0, [x0, #0x40]
100b50d50:     	stp	q0, q0, [x0, #0x60]
100b50d54:     	stp	q0, q0, [x0, #0x80]
100b50d58:     	stp	q0, q0, [x0, #0xa0]
100b50d5c:     	ldr	x8, [x23, #0xb0]
100b50d60:     	ldp	q1, q0, [x23, #0x90]
100b50d64:     	ldr	q2, [x23, #0x80]
100b50d68:     	stp	q2, q1, [x0, #0x80]
100b50d6c:     	str	q0, [x0, #0xa0]
100b50d70:     	str	x8, [x0, #0xb0]
100b50d74:     	ldp	q1, q0, [x23, #0x60]
100b50d78:     	ldp	q3, q2, [x23, #0x40]
100b50d7c:     	stp	q3, q2, [x0, #0x40]
100b50d80:     	stp	q1, q0, [x0, #0x60]
100b50d84:     	ldp	q1, q0, [x23, #0x20]
100b50d88:     	ldp	q3, q2, [x23]
100b50d8c:     	stp	q3, q2, [x0]
100b50d90:     	stp	q1, q0, [x0, #0x20]
100b50d94:     	strb	w22, [x0, #0xb8]
100b50d98:     	ldr	d8, [x24, #0xc8]
100b50d9c:     	mov	x0, x20
100b50da0:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b50da4:     	mov	x20, x0
100b50da8:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
100b50dac:     	add	x8, x8, #0x6e0
100b50db0:     	ldr	x8, [x8]
100b50db4:     	adrp	x3, 0x104bd0000 <__ZL3hex+0x434d>
100b50db8:     	add	x3, x3, #0xd1d
100b50dbc:     	mov	w0, #0x1                ; =1
100b50dc0:     	mov	w1, #0xb0               ; =176
100b50dc4:     	mov	w2, #0x8                ; =8
100b50dc8:     	blr	x8
100b50dcc:     	mov	x1, x0
100b50dd0:     	stp	xzr, xzr, [x0]
100b50dd4:     	mov	w8, #0x208              ; =520
100b50dd8:     	str	w8, [x0, #0x10]
100b50ddc:     	stur	d8, [x0, #0x14]
100b50de0:     	movi.16b	v0, #0x0
100b50de4:     	stur	q0, [x0, #0x1c]
100b50de8:     	stur	q0, [x0, #0x2c]
100b50dec:     	stur	q0, [x0, #0x3c]
100b50df0:     	stur	q0, [x0, #0x4c]
100b50df4:     	stur	q0, [x0, #0x5c]
100b50df8:     	stur	q0, [x0, #0x6c]
100b50dfc:     	str	wzr, [x0, #0x7c]
100b50e00:     	mov	w8, #0x7                ; =7
100b50e04:     	movk	w8, #0x1, lsl #16
100b50e08:     	stp	x8, x21, [x0, #0x80]
100b50e0c:     	stp	q0, q0, [x0, #0x90]
100b50e10:     	ldr	x0, [x20, #0x168]
100b50e14:     	bl	0x10078fe38 <__Z11BLI_addtailP8ListBasePv>
100b50e18:     	b	0x100b50c64 <__Z26WM_ipad_knife_action_queueP8bContextRK16wmIPadKnifeOwner17wmIPadKnifeAction+0x44>
