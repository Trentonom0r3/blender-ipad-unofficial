
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010aaa00 <-[GHOSTUIPanGestureRecognizer reset]>:
1010aaa00:     	sub	sp, sp, #0x30
1010aaa04:     	stp	x20, x19, [sp, #0x10]
1010aaa08:     	stp	x29, x30, [sp, #0x20]
1010aaa0c:     	add	x29, sp, #0x20
1010aaa10:     	mov	x19, x0
1010aaa14:     	bl	0x104b784c0 <_objc_msgSend$forgetKnifePanContact>
1010aaa18:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aaa1c:     	ldrsw	x8, [x8, #0xf4c]
1010aaa20:     	add	x8, x19, x8
1010aaa24:     	movi.16b	v0, #0x0
1010aaa28:     	stp	q0, q0, [x8]
1010aaa2c:     	strh	wzr, [x8, #0x20]
1010aaa30:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aaa34:     	ldrsw	x8, [x8, #0xf50]
1010aaa38:     	add	x8, x19, x8
1010aaa3c:     	stp	xzr, xzr, [x8, #0x8]
1010aaa40:     	str	xzr, [x8]
1010aaa44:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aaa48:     	ldrsw	x8, [x8, #0xf54]
1010aaa4c:     	add	x8, x19, x8
1010aaa50:     	stp	q0, q0, [x8]
1010aaa54:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aaa58:     	ldrsw	x8, [x8, #0xf58]
1010aaa5c:     	strh	wzr, [x19, x8]
1010aaa60:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aaa64:     	ldrsw	x8, [x8, #0xf5c]
1010aaa68:     	add	x8, x19, x8
1010aaa6c:     	str	wzr, [x8]
1010aaa70:     	strb	wzr, [x8, #0x18]
1010aaa74:     	stp	xzr, xzr, [x8, #0x8]
1010aaa78:     	strb	wzr, [x8, #0x1c]
1010aaa7c:     	str	xzr, [x8, #0x20]
1010aaa80:     	stur	xzr, [x8, #0x25]
1010aaa84:     	strb	wzr, [x8, #0x30]
1010aaa88:     	stur	xzr, [x8, #0x34]
1010aaa8c:     	stur	xzr, [x8, #0x39]
1010aaa90:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aaa94:     	ldr	x8, [x8, #0xdf8]
1010aaa98:     	stp	x19, x8, [sp]
1010aaa9c:     	adrp	x8, 0x106626000 <__OBJC_$_INSTANCE_VARIABLES_GHOSTUIWindow+0x7a0>
1010aaaa0:     	ldr	x1, [x8, #0xce0]
1010aaaa4:     	mov	x0, sp
1010aaaa8:     	bl	0x104b761c8 <_zlibVersion+0x104b761c8>
1010aaaac:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aaab0:     	ldrsw	x8, [x8, #0xf64]
1010aaab4:     	adrp	x9, 0x106368000 <_zlibVersion+0x106368000>
1010aaab8:     	ldr	x9, [x9, #0x250]
1010aaabc:     	ldr	q0, [x9]
1010aaac0:     	str	q0, [x19, x8]
1010aaac4:     	ldp	x29, x30, [sp, #0x20]
1010aaac8:     	ldp	x20, x19, [sp, #0x10]
1010aaacc:     	add	sp, sp, #0x30
1010aaad0:     	ret
