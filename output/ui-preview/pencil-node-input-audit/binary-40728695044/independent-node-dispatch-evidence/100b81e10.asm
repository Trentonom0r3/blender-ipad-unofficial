
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b81e10 <__Z28WM_operator_properties_allocPP10PointerRNAPP10IDPropertyPKc>:
100b81e10:     	sub	sp, sp, #0x40
100b81e14:     	stp	x22, x21, [sp, #0x10]
100b81e18:     	stp	x20, x19, [sp, #0x20]
100b81e1c:     	stp	x29, x30, [sp, #0x30]
100b81e20:     	add	x29, sp, #0x30
100b81e24:     	mov	x21, x2
100b81e28:     	mov	x20, x1
100b81e2c:     	mov	x19, x0
100b81e30:     	cbz	x1, 0x100b81e4c <__Z28WM_operator_properties_allocPP10PointerRNAPP10IDPropertyPKc+0x3c>
100b81e34:     	ldr	x8, [x20]
100b81e38:     	cbz	x8, 0x100b81eec <__Z28WM_operator_properties_allocPP10PointerRNAPP10IDPropertyPKc+0xdc>
100b81e3c:     	mov	x22, #0x0               ; =0
100b81e40:     	ldr	x8, [x19]
100b81e44:     	cbnz	x8, 0x100b81ec8 <__Z28WM_operator_properties_allocPP10PointerRNAPP10IDPropertyPKc+0xb8>
100b81e48:     	b	0x100b81e70 <__Z28WM_operator_properties_allocPP10PointerRNAPP10IDPropertyPKc+0x60>
100b81e4c:     	adrp	x0, 0x104bd3000 <__ZL3hex+0x35cd>
100b81e50:     	add	x0, x0, #0x930
100b81e54:     	add	x8, sp, #0x8
100b81e58:     	mov	w1, #0xc                ; =12
100b81e5c:     	mov	w2, #0x0                ; =0
100b81e60:     	bl	0x1001f53a0 <__ZN7blender3bke6idprop12create_groupENS_9StringRefE15eIDPropertyFlag>
100b81e64:     	ldr	x22, [sp, #0x8]
100b81e68:     	ldr	x8, [x19]
100b81e6c:     	cbnz	x8, 0x100b81ec8 <__Z28WM_operator_properties_allocPP10PointerRNAPP10IDPropertyPKc+0xb8>
100b81e70:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b81e74:     	add	x8, x8, #0x750
100b81e78:     	ldr	x8, [x8]
100b81e7c:     	adrp	x2, 0x104bd3000 <__ZL3hex+0x35cd>
100b81e80:     	add	x2, x2, #0x93d
100b81e84:     	mov	w0, #0x58               ; =88
100b81e88:     	mov	w1, #0x8                ; =8
100b81e8c:     	mov	w3, #0x1                ; =1
100b81e90:     	blr	x8
100b81e94:     	movi.16b	v0, #0x0
100b81e98:     	stp	q0, q0, [x0, #0x10]
100b81e9c:     	str	q0, [x0]
100b81ea0:     	str	q0, [x0, #0x40]
100b81ea4:     	mov	x8, x0
100b81ea8:     	str	xzr, [x8, #0x50]!
100b81eac:     	mov	x9, x0
100b81eb0:     	str	q0, [x9, #0x30]!
100b81eb4:     	stp	x9, x9, [x0, #0x18]
100b81eb8:     	str	x8, [x0, #0x28]
100b81ebc:     	str	x0, [x19]
100b81ec0:     	mov	x1, x21
100b81ec4:     	bl	0x100b81ca8 <__Z29WM_operator_properties_createP10PointerRNAPKc>
100b81ec8:     	cbz	x20, 0x100b81ed0 <__Z28WM_operator_properties_allocPP10PointerRNAPP10IDPropertyPKc+0xc0>
100b81ecc:     	ldr	x22, [x20]
100b81ed0:     	ldr	x8, [x19]
100b81ed4:     	str	x22, [x8, #0x10]
100b81ed8:     	ldp	x29, x30, [sp, #0x30]
100b81edc:     	ldp	x20, x19, [sp, #0x20]
100b81ee0:     	ldp	x22, x21, [sp, #0x10]
100b81ee4:     	add	sp, sp, #0x40
100b81ee8:     	ret
100b81eec:     	adrp	x0, 0x104bd3000 <__ZL3hex+0x35cd>
100b81ef0:     	add	x0, x0, #0x930
100b81ef4:     	add	x8, sp, #0x8
100b81ef8:     	mov	w1, #0xc                ; =12
100b81efc:     	mov	w2, #0x0                ; =0
100b81f00:     	bl	0x1001f53a0 <__ZN7blender3bke6idprop12create_groupENS_9StringRefE15eIDPropertyFlag>
100b81f04:     	mov	x22, #0x0               ; =0
100b81f08:     	ldr	x8, [sp, #0x8]
100b81f0c:     	str	x8, [x20]
100b81f10:     	ldr	x8, [x19]
100b81f14:     	cbnz	x8, 0x100b81ec8 <__Z28WM_operator_properties_allocPP10PointerRNAPP10IDPropertyPKc+0xb8>
100b81f18:     	b	0x100b81e70 <__Z28WM_operator_properties_allocPP10PointerRNAPP10IDPropertyPKc+0x60>
