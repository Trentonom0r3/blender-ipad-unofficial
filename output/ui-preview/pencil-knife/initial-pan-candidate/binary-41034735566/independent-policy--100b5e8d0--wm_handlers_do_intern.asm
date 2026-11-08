
output/ui-preview/pencil-knife/initial-pan-candidate/binary-41034735566/Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b5e8d0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase>:
100b5e8d0:     	stp	x28, x27, [sp, #-0x60]!
100b5e8d4:     	stp	x26, x25, [sp, #0x10]
100b5e8d8:     	stp	x24, x23, [sp, #0x20]
100b5e8dc:     	stp	x22, x21, [sp, #0x30]
100b5e8e0:     	stp	x20, x19, [sp, #0x40]
100b5e8e4:     	stp	x29, x30, [sp, #0x50]
100b5e8e8:     	add	x29, sp, #0x50
100b5e8ec:     	sub	sp, sp, #0x2e0
100b5e8f0:     	mov	x28, x3
100b5e8f4:     	mov	x20, x2
100b5e8f8:     	str	x1, [sp, #0xa0]
100b5e8fc:     	mov	x24, x0
100b5e900:     	adrp	x8, 0x106369000 <_zlibVersion+0x106369000>
100b5e904:     	ldr	x8, [x8, #0x7f8]
100b5e908:     	ldr	x8, [x8]
100b5e90c:     	stur	x8, [x29, #-0x60]
100b5e910:     	adrp	x0, 0x106d8a000 <__PyRuntime+0x27ff8>
100b5e914:     	add	x0, x0, #0xc38
100b5e918:     	ldr	x8, [x0]
100b5e91c:     	blr	x8
100b5e920:     	mov	x19, x0
100b5e924:     	ldp	q0, q1, [x0, #0xa0]
100b5e928:     	stp	q0, q1, [sp, #0x190]
100b5e92c:     	ldr	x8, [x0, #0xc0]
100b5e930:     	str	x8, [sp, #0x1b0]
100b5e934:     	ldp	q0, q1, [x0, #0x60]
100b5e938:     	stp	q0, q1, [sp, #0x150]
100b5e93c:     	ldp	q1, q0, [x0, #0x80]
100b5e940:     	stp	q1, q0, [sp, #0x170]
100b5e944:     	ldp	q0, q1, [x0, #0x20]
100b5e948:     	stp	q0, q1, [sp, #0x110]
100b5e94c:     	ldp	q1, q0, [x0, #0x40]
100b5e950:     	stp	q1, q0, [sp, #0x130]
100b5e954:     	ldp	q1, q0, [x0]
100b5e958:     	stp	q1, q0, [sp, #0xf0]
100b5e95c:     	stp	xzr, xzr, [x0, #0x40]
100b5e960:     	strb	wzr, [x0, #0x50]
100b5e964:     	str	xzr, [x0, #0xb0]
100b5e968:     	strb	wzr, [x0, #0xb8]
100b5e96c:     	strh	wzr, [x0, #0xba]
100b5e970:     	strb	wzr, [x0, #0xc0]
100b5e974:     	movi.16b	v0, #0x0
100b5e978:     	stur	q0, [x0, #0x58]
100b5e97c:     	stur	q0, [x0, #0x68]
100b5e980:     	stur	q0, [x0, #0x78]
100b5e984:     	strh	wzr, [x0, #0x88]
100b5e988:     	stur	xzr, [x0, #0x8c]
100b5e98c:     	stp	xzr, xzr, [x0, #0x98]
100b5e990:     	stur	xzr, [x0, #0xa6]
100b5e994:     	stp	q0, q0, [x0]
100b5e998:     	str	q0, [x0, #0x20]
100b5e99c:     	stur	q0, [x0, #0x2e]
100b5e9a0:     	cbz	x24, 0x100b5ea3c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16c>
100b5e9a4:     	ldr	x8, [sp, #0xa0]
100b5e9a8:     	cbz	x8, 0x100b5ea3c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16c>
100b5e9ac:     	cbz	x20, 0x100b5ea3c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16c>
100b5e9b0:     	ldrh	w8, [x20, #0x10]
100b5e9b4:     	cmp	w8, #0x1
100b5e9b8:     	b.ne	0x100b5ea40 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x170>
100b5e9bc:     	ldrh	w8, [x20, #0x12]
100b5e9c0:     	cmp	w8, #0x1
100b5e9c4:     	b.ne	0x100b5ea40 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x170>
100b5e9c8:     	ldrb	w8, [x20, #0x78]
100b5e9cc:     	cmp	w8, #0x1
100b5e9d0:     	b.ne	0x100b5ea40 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x170>
100b5e9d4:     	ldrb	w8, [x20, #0x79]
100b5e9d8:     	cmp	w8, #0x2
100b5e9dc:     	b.ne	0x100b5ea40 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x170>
100b5e9e0:     	ldr	x8, [x20, #0x58]
100b5e9e4:     	cbz	x8, 0x100b5ea40 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x170>
100b5e9e8:     	ldr	x8, [x20, #0x60]
100b5e9ec:     	cbz	x8, 0x100b5ea40 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x170>
100b5e9f0:     	ldr	x8, [x20, #0x68]
100b5e9f4:     	cbz	x8, 0x100b5ea40 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x170>
100b5e9f8:     	ldr	x8, [sp, #0xa0]
100b5e9fc:     	stp	x24, x8, [x19]
100b5ea00:     	ldp	q0, q1, [x20]
100b5ea04:     	ldr	q2, [x20, #0x20]
100b5ea08:     	stp	q1, q2, [x19, #0x20]
100b5ea0c:     	stur	q0, [x19, #0x10]
100b5ea10:     	ldp	q0, q1, [x20, #0x30]
100b5ea14:     	ldp	q2, q3, [x20, #0x50]
100b5ea18:     	stp	q2, q3, [x19, #0x60]
100b5ea1c:     	stp	q0, q1, [x19, #0x40]
100b5ea20:     	ldp	q0, q1, [x20, #0x70]
100b5ea24:     	ldp	q2, q3, [x20, #0x90]
100b5ea28:     	stp	q2, q3, [x19, #0xa0]
100b5ea2c:     	stp	q0, q1, [x19, #0x80]
100b5ea30:     	mov	w8, #0x1                ; =1
100b5ea34:     	strb	w8, [x19, #0xc0]
100b5ea38:     	b	0x100b5ea40 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x170>
100b5ea3c:     	cbz	x20, 0x100b5eb3c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x26c>
100b5ea40:     	ldrb	w8, [x20, #0x78]
100b5ea44:     	cmp	w8, #0x1
100b5ea48:     	b.ne	0x100b5eb30 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x260>
100b5ea4c:     	ldrb	w8, [x20, #0x79]
100b5ea50:     	sub	w9, w8, #0x3
100b5ea54:     	ldr	x8, [sp, #0xa0]
100b5ea58:     	add	x8, x8, #0x118
100b5ea5c:     	cmp	w9, #0x1
100b5ea60:     	b.hi	0x100b5ea78 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a8>
100b5ea64:     	cmp	x8, x28
100b5ea68:     	b.eq	0x100b5ea78 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a8>
100b5ea6c:     	mov	w8, #0x3                ; =3
100b5ea70:     	str	w8, [sp, #0xc4]
100b5ea74:     	b	0x100b605d0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1d00>
100b5ea78:     	cmp	w9, #0x1
100b5ea7c:     	b.hi	0x100b5eb30 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x260>
100b5ea80:     	ldr	x23, [x8]
100b5ea84:     	cbnz	x23, 0x100b5ea94 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c4>
100b5ea88:     	b	0x100b5ea6c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x19c>
100b5ea8c:     	ldr	x23, [x23]
100b5ea90:     	cbz	x23, 0x100b5ea6c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x19c>
100b5ea94:     	cbz	x20, 0x100b5ea8c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5ea98:     	ldr	w8, [x23, #0x10]
100b5ea9c:     	cmp	w8, #0x3
100b5eaa0:     	b.ne	0x100b5ea8c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5eaa4:     	ldrb	w8, [x20, #0x78]
100b5eaa8:     	cmp	w8, #0x1
100b5eaac:     	b.ne	0x100b5ea8c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5eab0:     	ldrb	w8, [x20, #0x79]
100b5eab4:     	sub	w8, w8, #0x3
100b5eab8:     	cmp	w8, #0x1
100b5eabc:     	b.hi	0x100b5ea8c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5eac0:     	ldr	x8, [x23, #0x50]
100b5eac4:     	ldr	x9, [x20, #0x58]
100b5eac8:     	cmp	x8, x9
100b5eacc:     	b.ne	0x100b5ea8c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5ead0:     	ldr	x8, [x23, #0x58]
100b5ead4:     	ldr	x9, [x20, #0x60]
100b5ead8:     	cmp	x8, x9
100b5eadc:     	b.ne	0x100b5ea8c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5eae0:     	ldr	x8, [x23, #0x88]
100b5eae4:     	ldr	x9, [x20, #0x68]
100b5eae8:     	cmp	x8, x9
100b5eaec:     	b.ne	0x100b5ea8c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5eaf0:     	ldr	w8, [x23, #0x90]
100b5eaf4:     	ldr	w9, [x20, #0x70]
100b5eaf8:     	cmp	w8, w9
100b5eafc:     	b.ne	0x100b5ea8c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5eb00:     	ldr	w8, [x23, #0x94]
100b5eb04:     	ldr	w9, [x20, #0x74]
100b5eb08:     	cmp	w8, w9
100b5eb0c:     	b.ne	0x100b5ea8c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5eb10:     	ldr	x0, [sp, #0xa0]
100b5eb14:     	mov	x1, x23
100b5eb18:     	bl	0x100b51f7c <__ZL39wm_ipad_pencil_paint_handler_registeredP8wmWindowPK17wmEventHandler_Op>
100b5eb1c:     	tbz	w0, #0x0, 0x100b5ea8c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bc>
100b5eb20:     	mov	w21, #0x0               ; =0
100b5eb24:     	mov	w8, #0x1                ; =1
100b5eb28:     	str	w8, [sp, #0xb4]
100b5eb2c:     	b	0x100b5eb44 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x274>
100b5eb30:     	mov	w21, #0x0               ; =0
100b5eb34:     	str	wzr, [sp, #0xb4]
100b5eb38:     	b	0x100b5eb44 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x274>
100b5eb3c:     	str	wzr, [sp, #0xb4]
100b5eb40:     	mov	w21, #0x1               ; =1
100b5eb44:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b5eb48:     	add	x8, x8, #0x28
100b5eb4c:     	ldrb	w8, [x8, #0xc40]
100b5eb50:     	tbnz	w8, #0x4, 0x100b5eb5c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x28c>
100b5eb54:     	str	wzr, [sp, #0x9c]
100b5eb58:     	b	0x100b5eb70 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2a0>
100b5eb5c:     	ldrh	w8, [x20, #0x10]
100b5eb60:     	cmp	w8, #0x4
100b5eb64:     	ccmp	w8, #0x11, #0x4, ne
100b5eb68:     	cset	w8, ne
100b5eb6c:     	str	w8, [sp, #0x9c]
100b5eb70:     	mov	x0, x24
100b5eb74:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b5eb78:     	str	x0, [sp, #0x90]
100b5eb7c:     	cbz	x28, 0x100b6058c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1cbc>
100b5eb80:     	ldr	x8, [x28]
100b5eb84:     	str	x8, [sp, #0xc8]
100b5eb88:     	cbz	x8, 0x100b605b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1ce8>
100b5eb8c:     	str	wzr, [sp, #0xc4]
100b5eb90:     	cmp	x24, #0x0
100b5eb94:     	csinc	w8, w21, wzr, ne
100b5eb98:     	str	w8, [sp, #0x7c]
100b5eb9c:     	b	0x100b5eba8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2d8>
100b5eba0:     	ldr	x8, [sp, #0xc8]
100b5eba4:     	cbz	x8, 0x100b60594 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1cc4>
100b5eba8:     	ldr	x27, [sp, #0xc8]
100b5ebac:     	ldr	x8, [x28]
100b5ebb0:     	cbz	x8, 0x100b60594 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1cc4>
100b5ebb4:     	ldr	x8, [x27]
100b5ebb8:     	str	x8, [sp, #0xc8]
100b5ebbc:     	ldr	w8, [sp, #0xb4]
100b5ebc0:     	cbz	w8, 0x100b5ec50 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x380>
100b5ebc4:     	cbz	x20, 0x100b5eba0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2d0>
100b5ebc8:     	ldr	w8, [x27, #0x10]
100b5ebcc:     	cmp	w8, #0x3
100b5ebd0:     	b.ne	0x100b5eba0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2d0>
100b5ebd4:     	ldrb	w8, [x20, #0x78]
100b5ebd8:     	cmp	w8, #0x1
100b5ebdc:     	b.ne	0x100b5eba0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2d0>
100b5ebe0:     	ldrb	w8, [x20, #0x79]
100b5ebe4:     	sub	w8, w8, #0x3
100b5ebe8:     	cmp	w8, #0x1
100b5ebec:     	b.hi	0x100b5eba0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2d0>
100b5ebf0:     	ldr	x8, [x27, #0x50]
100b5ebf4:     	ldr	x9, [x20, #0x58]
100b5ebf8:     	cmp	x8, x9
100b5ebfc:     	b.ne	0x100b5eba0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2d0>
100b5ec00:     	ldr	x8, [x27, #0x58]
100b5ec04:     	ldr	x9, [x20, #0x60]
100b5ec08:     	cmp	x8, x9
100b5ec0c:     	b.ne	0x100b5eba0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2d0>
100b5ec10:     	ldr	x8, [x27, #0x88]
100b5ec14:     	ldr	x9, [x20, #0x68]
100b5ec18:     	cmp	x8, x9
100b5ec1c:     	b.ne	0x100b5eba0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2d0>
100b5ec20:     	ldr	w8, [x27, #0x90]
100b5ec24:     	ldr	w9, [x20, #0x70]
100b5ec28:     	cmp	w8, w9
100b5ec2c:     	b.ne	0x100b5eba0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2d0>
100b5ec30:     	ldr	w8, [x27, #0x94]
100b5ec34:     	ldr	w9, [x20, #0x74]
100b5ec38:     	cmp	w8, w9
100b5ec3c:     	b.ne	0x100b5eba0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2d0>
100b5ec40:     	ldr	x0, [sp, #0xa0]
100b5ec44:     	mov	x1, x27
100b5ec48:     	bl	0x100b51f7c <__ZL39wm_ipad_pencil_paint_handler_registeredP8wmWindowPK17wmEventHandler_Op>
100b5ec4c:     	tbz	w0, #0x0, 0x100b5eba0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2d0>
100b5ec50:     	ldr	w9, [x27, #0x14]
100b5ec54:     	tbnz	w9, #0x7, 0x100b60474 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1ba4>
100b5ec58:     	ldr	x22, [x27, #0x18]
100b5ec5c:     	cbz	x22, 0x100b5ec90 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x3c0>
100b5ec60:     	mov	x0, x24
100b5ec64:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b5ec68:     	mov	x21, x0
100b5ec6c:     	mov	x0, x24
100b5ec70:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5ec74:     	mov	x2, x0
100b5ec78:     	ldr	x0, [sp, #0xa0]
100b5ec7c:     	mov	x1, x21
100b5ec80:     	mov	x3, x20
100b5ec84:     	blr	x22
100b5ec88:     	cbz	w0, 0x100b60474 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1ba4>
100b5ec8c:     	ldr	w9, [x27, #0x14]
100b5ec90:     	ldrh	w8, [x20, #0x10]
100b5ec94:     	cmp	w8, #0x104
100b5ec98:     	and	w10, w8, #0xfff0
100b5ec9c:     	mov	w11, #0x110             ; =272
100b5eca0:     	ccmp	w10, w11, #0x4, ne
100b5eca4:     	cset	w10, eq
100b5eca8:     	str	w10, [sp, #0x8c]
100b5ecac:     	and	w9, w9, #0x1
100b5ecb0:     	ldr	w10, [sp, #0xc4]
100b5ecb4:     	orr	w10, w9, w10
100b5ecb8:     	str	w10, [sp, #0xc4]
100b5ecbc:     	ldr	w9, [x27, #0x10]
100b5ecc0:     	cmp	w9, #0x2
100b5ecc4:     	b.le	0x100b5ed00 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x430>
100b5ecc8:     	cmp	w9, #0x3
100b5eccc:     	b.eq	0x100b5edc8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x4f8>
100b5ecd0:     	cmp	w9, #0x4
100b5ecd4:     	b.eq	0x100b5ee08 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x538>
100b5ecd8:     	cmp	w9, #0x5
100b5ecdc:     	b.ne	0x100b5ef6c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x69c>
100b5ece0:     	ldr	x8, [x27, #0x38]
100b5ece4:     	cbz	x8, 0x100b5efd0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x700>
100b5ece8:     	add	x3, sp, #0xd0
100b5ecec:     	ldr	x0, [sp, #0x90]
100b5ecf0:     	ldr	x1, [sp, #0xa0]
100b5ecf4:     	mov	x2, x27
100b5ecf8:     	blr	x8
100b5ecfc:     	b	0x100b5effc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x72c>
100b5ed00:     	cmp	w9, #0x1
100b5ed04:     	b.eq	0x100b5ef5c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x68c>
100b5ed08:     	cmp	w9, #0x2
100b5ed0c:     	b.ne	0x100b5ef6c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x69c>
100b5ed10:     	ldr	x8, [sp, #0x90]
100b5ed14:     	ldr	x8, [x8, #0x5c0]
100b5ed18:     	ldrb	w8, [x8, #0x10]
100b5ed1c:     	tbnz	w8, #0x0, 0x100b60454 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b84>
100b5ed20:     	mov	x0, x24
100b5ed24:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b5ed28:     	mov	x26, x0
100b5ed2c:     	mov	x0, x24
100b5ed30:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5ed34:     	mov	x25, x0
100b5ed38:     	mov	x0, x24
100b5ed3c:     	bl	0x1000b4458 <__Z19CTX_wm_region_popupPK8bContext>
100b5ed40:     	mov	x23, x0
100b5ed44:     	ldrh	w8, [x20, #0x10]
100b5ed48:     	cmp	w8, #0xf
100b5ed4c:     	cset	w9, lo
100b5ed50:     	ldrb	w10, [x27, #0x14]
100b5ed54:     	tbnz	w10, #0x1, 0x100b5ed78 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x4a8>
100b5ed58:     	cmp	w8, #0x13
100b5ed5c:     	b.hi	0x100b60054 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1784>
100b5ed60:     	mov	w10, #0x1               ; =1
100b5ed64:     	lsl	w10, w10, w8
100b5ed68:     	mov	w11, #0x18e             ; =398
100b5ed6c:     	movk	w11, #0xc, lsl #16
100b5ed70:     	tst	w10, w11
100b5ed74:     	b.eq	0x100b60054 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1784>
100b5ed78:     	mov	w10, #0x4c00            ; =19456
100b5ed7c:     	lsr	w10, w10, w8
100b5ed80:     	and	w21, w9, w10
100b5ed84:     	adrp	x9, 0x107ef7000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b5ed88:     	ldrb	w9, [x9, #0x830]
100b5ed8c:     	cmp	w9, #0x1
100b5ed90:     	b.ne	0x100b5edb4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x4e4>
100b5ed94:     	tbnz	w21, #0x0, 0x100b5edc0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x4f0>
100b5ed98:     	cmp	w8, #0x104
100b5ed9c:     	b.eq	0x100b5fd28 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1458>
100b5eda0:     	and	w9, w8, #0xfff0
100b5eda4:     	cmp	w9, #0x110
100b5eda8:     	b.eq	0x100b5fd28 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1458>
100b5edac:     	adrp	x9, 0x107ef7000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b5edb0:     	strb	wzr, [x9, #0x830]
100b5edb4:     	mov	w9, #0x5020             ; =20512
100b5edb8:     	cmp	w8, w9
100b5edbc:     	b.ne	0x100b5fd28 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1458>
100b5edc0:     	mov	w8, #0x0                ; =0
100b5edc4:     	b	0x100b5feac <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15dc>
100b5edc8:     	ldrb	w9, [x27, #0x28]
100b5edcc:     	cmp	w9, #0x1
100b5edd0:     	b.ne	0x100b5ef88 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x6b8>
100b5edd4:     	ldr	x9, [sp, #0x90]
100b5edd8:     	ldr	x9, [x9, #0x5c0]
100b5eddc:     	ldrb	w9, [x9, #0x10]
100b5ede0:     	tbnz	w9, #0x0, 0x100b60454 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b84>
100b5ede4:     	mov	w9, #0x5020             ; =20512
100b5ede8:     	cmp	w8, w9
100b5edec:     	b.ne	0x100b5ee00 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x530>
100b5edf0:     	ldr	x8, [x27, #0x20]
100b5edf4:     	ldr	x9, [x20, #0x88]
100b5edf8:     	cmp	x8, x9
100b5edfc:     	b.eq	0x100b6003c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x176c>
100b5ee00:     	mov	w0, #0x0                ; =0
100b5ee04:     	b	0x100b5efac <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x6dc>
100b5ee08:     	ldr	x9, [sp, #0x90]
100b5ee0c:     	ldr	x9, [x9, #0x5c0]
100b5ee10:     	ldrb	w9, [x9, #0x10]
100b5ee14:     	tbnz	w9, #0x0, 0x100b60454 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b84>
100b5ee18:     	mov	w9, #0x5023             ; =20515
100b5ee1c:     	cmp	w8, w9
100b5ee20:     	b.ne	0x100b60454 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b84>
100b5ee24:     	ldr	x8, [x27, #0x20]
100b5ee28:     	ldr	x23, [x8]
100b5ee2c:     	cbnz	x23, 0x100b5ee3c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x56c>
100b5ee30:     	b	0x100b60454 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b84>
100b5ee34:     	ldr	x23, [x23]
100b5ee38:     	cbz	x23, 0x100b60454 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b84>
100b5ee3c:     	ldrh	w8, [x20, #0x80]
100b5ee40:     	cmp	w8, #0x3
100b5ee44:     	b.ne	0x100b5ee34 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x564>
100b5ee48:     	mov	x0, x24
100b5ee4c:     	bl	0x101665c30 <__Z19ED_undo_group_beginP8bContext>
100b5ee50:     	ldr	x26, [x20, #0x88]
100b5ee54:     	ldr	x25, [x26]
100b5ee58:     	cbz	x25, 0x100b5ef44 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x674>
100b5ee5c:     	ldr	x21, [x25]
100b5ee60:     	ldr	x8, [x23, #0x10]
100b5ee64:     	mov	x0, x24
100b5ee68:     	mov	x1, x25
100b5ee6c:     	mov	x2, x20
100b5ee70:     	blr	x8
100b5ee74:     	cbnz	w0, 0x100b5ee84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x5b4>
100b5ee78:     	mov	x25, x21
100b5ee7c:     	cbnz	x21, 0x100b5ee5c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x58c>
100b5ee80:     	b	0x100b5ef44 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x674>
100b5ee84:     	mov	x0, x24
100b5ee88:     	mov	x1, x25
100b5ee8c:     	mov	x2, x23
100b5ee90:     	bl	0x100b46984 <__Z15wm_drop_prepareP8bContextP6wmDragP9wmDropBox>
100b5ee94:     	mov	x0, x26
100b5ee98:     	mov	x1, x25
100b5ee9c:     	bl	0x10078fea0 <__Z11BLI_remlinkP8ListBasePv>
100b5eea0:     	stp	xzr, xzr, [x29, #-0xd0]
100b5eea4:     	sub	x0, x29, #0xd0
100b5eea8:     	mov	x1, x25
100b5eeac:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b5eeb0:     	sub	x8, x29, #0xd0
100b5eeb4:     	str	x8, [x20, #0x88]
100b5eeb8:     	mov	x0, x23
100b5eebc:     	bl	0x100b46a8c <__Z28wm_drop_operator_context_getPK9wmDropBox>
100b5eec0:     	ldr	x1, [x23, #0x60]
100b5eec4:     	cbz	x1, 0x100b5eee8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x618>
100b5eec8:     	mov	x4, x0
100b5eecc:     	ldr	x2, [x23, #0xb0]
100b5eed0:     	mov	x0, x24
100b5eed4:     	mov	x3, #0x0                ; =0
100b5eed8:     	mov	w5, #0x0                ; =0
100b5eedc:     	mov	x6, x20
100b5eee0:     	bl	0x100b4ebdc <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent>
100b5eee4:     	tbz	w0, #0x1, 0x100b5ef04 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x634>
100b5eee8:     	ldr	x21, [x23, #0x38]
100b5eeec:     	cbz	x21, 0x100b5ef04 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x634>
100b5eef0:     	mov	x0, x24
100b5eef4:     	bl	0x1000b4c78 <__Z13CTX_data_mainPK8bContext>
100b5eef8:     	mov	x1, x25
100b5eefc:     	mov	x2, x23
100b5ef00:     	blr	x21
100b5ef04:     	mov	x0, x26
100b5ef08:     	bl	0x100b46950 <__Z17WM_drag_free_listP8ListBase>
100b5ef0c:     	sub	x0, x29, #0xd0
100b5ef10:     	bl	0x100b46950 <__Z17WM_drag_free_listP8ListBase>
100b5ef14:     	str	wzr, [x20, #0x80]
100b5ef18:     	str	xzr, [x20, #0x88]
100b5ef1c:     	mov	x0, x24
100b5ef20:     	mov	x1, x25
100b5ef24:     	mov	x2, x23
100b5ef28:     	bl	0x100b46a94 <__Z11wm_drop_endP8bContextP6wmDragP9wmDropBox>
100b5ef2c:     	mov	x0, x24
100b5ef30:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5ef34:     	ldr	w8, [sp, #0xc4]
100b5ef38:     	orr	w8, w8, #0x1
100b5ef3c:     	str	w8, [sp, #0xc4]
100b5ef40:     	cbz	x0, 0x100b605d0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1d00>
100b5ef44:     	ldr	x0, [sp, #0x90]
100b5ef48:     	ldr	x1, [sp, #0xa0]
100b5ef4c:     	bl	0x100b46060 <__Z13wm_drags_exitP15wmWindowManagerP8wmWindow>
100b5ef50:     	mov	x0, x24
100b5ef54:     	bl	0x101665c4c <__Z17ED_undo_group_endP8bContext>
100b5ef58:     	b	0x100b5ee34 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x564>
100b5ef5c:     	ldr	w9, [sp, #0x8c]
100b5ef60:     	tbz	w9, #0x0, 0x100b5efb8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x6e8>
100b5ef64:     	mov	w22, #0x0               ; =0
100b5ef68:     	b	0x100b60448 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b78>
100b5ef6c:     	adrp	x0, 0x104bd4000 <__ZL3hex+0x3a0d>
100b5ef70:     	add	x0, x0, #0xeec
100b5ef74:     	mov	w1, #0x1975             ; =6517
100b5ef78:     	adrp	x2, 0x104bd5000 <__ZL3hex+0x4a0d>
100b5ef7c:     	add	x2, x2, #0xcb6
100b5ef80:     	bl	0x10072af4c <__Z29_BLI_assert_unreachable_printPKciS0_>
100b5ef84:     	b	0x100b60454 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b84>
100b5ef88:     	mov	x0, x24
100b5ef8c:     	mov	x1, x28
100b5ef90:     	mov	x2, x27
100b5ef94:     	mov	x3, x20
100b5ef98:     	mov	x4, #0x0                ; =0
100b5ef9c:     	mov	x5, #0x0                ; =0
100b5efa0:     	mov	w6, #0x0                ; =0
100b5efa4:     	mov	w7, #0x0                ; =0
100b5efa8:     	bl	0x100b524d0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb22eIPadNativePanDispatch>
100b5efac:     	ldr	w8, [sp, #0xc4]
100b5efb0:     	orr	w8, w0, w8
100b5efb4:     	b	0x100b60450 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b80>
100b5efb8:     	sub	w9, w8, #0xd4
100b5efbc:     	cmp	w9, #0x6
100b5efc0:     	str	x28, [sp, #0x80]
100b5efc4:     	b.hs	0x100b5fc10 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1340>
100b5efc8:     	mov	w22, #0x1               ; =1
100b5efcc:     	b	0x100b5fc20 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1350>
100b5efd0:     	movi.16b	v0, #0x0
100b5efd4:     	stp	q0, q0, [sp, #0xd0]
100b5efd8:     	ldr	x1, [x27, #0x20]
100b5efdc:     	ldr	x0, [sp, #0x90]
100b5efe0:     	bl	0x100b77728 <__Z16WM_keymap_activePK15wmWindowManagerP8wmKeyMap>
100b5efe4:     	cbz	x0, 0x100b5effc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x72c>
100b5efe8:     	ldrsw	x8, [sp, #0xe8]
100b5efec:     	add	w9, w8, #0x1
100b5eff0:     	str	w9, [sp, #0xe8]
100b5eff4:     	add	x9, sp, #0xd0
100b5eff8:     	str	x0, [x9, x8, lsl #3]
100b5effc:     	ldrh	w8, [x20, #0x10]
100b5f000:     	cmp	w8, #0x1
100b5f004:     	b.ne	0x100b5f02c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x75c>
100b5f008:     	ldrh	w8, [x20, #0x12]
100b5f00c:     	cmp	w8, #0x5
100b5f010:     	b.ne	0x100b5f02c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x75c>
100b5f014:     	ldrb	w8, [x20, #0x7c]
100b5f018:     	tbz	w8, #0x7, 0x100b5f02c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x75c>
100b5f01c:     	ldrb	w8, [x20, #0x2a]
100b5f020:     	cbnz	w8, 0x100b5f02c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x75c>
100b5f024:     	ldrh	w8, [x20, #0x2c]
100b5f028:     	cbz	w8, 0x100b604c4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1bf4>
100b5f02c:     	ldr	w8, [sp, #0xe8]
100b5f030:     	str	x28, [sp, #0x80]
100b5f034:     	str	x24, [sp, #0xa8]
100b5f038:     	ldrh	w9, [x20, #0x10]
100b5f03c:     	str	w9, [sp, #0x4c]
100b5f040:     	cmp	w8, #0x1
100b5f044:     	b.lt	0x100b5fbc0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x12f0>
100b5f048:     	mov	x24, #0x0               ; =0
100b5f04c:     	mov	w28, #0x0               ; =0
100b5f050:     	add	x8, sp, #0xd0
100b5f054:     	ldr	x21, [x8, x24, lsl #3]
100b5f058:     	cbz	x21, 0x100b5f0e0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x810>
100b5f05c:     	ldr	w8, [sp, #0x9c]
100b5f060:     	cbz	w8, 0x100b5f0a4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7d4>
100b5f064:     	add	x9, x21, #0x30
100b5f068:     	adrp	x8, 0x104bd5000 <__ZL3hex+0x4a0d>
100b5f06c:     	add	x8, x8, #0xce4
100b5f070:     	stp	x8, x9, [sp]
100b5f074:     	adrp	x0, 0x104bd5000 <__ZL3hex+0x4a0d>
100b5f078:     	add	x0, x0, #0xccc
100b5f07c:     	bl	0x104b7719c <_zlibVersion+0x104b7719c>
100b5f080:     	ldr	x0, [sp, #0xa8]
100b5f084:     	mov	x22, x21
100b5f088:     	mov	x1, x21
100b5f08c:     	bl	0x100b75ea0 <__Z14WM_keymap_pollP8bContextP8wmKeyMap>
100b5f090:     	tbz	w0, #0x0, 0x100b5f0d4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x804>
100b5f094:     	adrp	x0, 0x104b96000 <_zlibVersion+0x104b96000>
100b5f098:     	add	x0, x0, #0x86e
100b5f09c:     	bl	0x104b77388 <_zlibVersion+0x104b77388>
100b5f0a0:     	b	0x100b5f0b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x7e8>
100b5f0a4:     	ldr	x0, [sp, #0xa8]
100b5f0a8:     	mov	x22, x21
100b5f0ac:     	mov	x1, x21
100b5f0b0:     	bl	0x100b75ea0 <__Z14WM_keymap_pollP8bContextP8wmKeyMap>
100b5f0b4:     	tbz	w0, #0x0, 0x100b5f0e0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x810>
100b5f0b8:     	ldr	x26, [x22, #0x10]
100b5f0bc:     	cbz	x26, 0x100b5f0e0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x810>
100b5f0c0:     	str	wzr, [sp, #0xb8]
100b5f0c4:     	str	x22, [sp, #0x50]
100b5f0c8:     	add	x8, x22, #0x30
100b5f0cc:     	str	x8, [sp, #0x70]
100b5f0d0:     	b	0x100b5f114 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x844>
100b5f0d4:     	adrp	x0, 0x104bd6000 <__ZL3hex+0x5a0d>
100b5f0d8:     	add	x0, x0, #0x350
100b5f0dc:     	bl	0x104b77388 <_zlibVersion+0x104b77388>
100b5f0e0:     	str	wzr, [sp, #0xb8]
100b5f0e4:     	ldr	w8, [sp, #0xb8]
100b5f0e8:     	orr	w28, w8, w28
100b5f0ec:     	tbnz	w28, #0x0, 0x100b5fbc4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x12f4>
100b5f0f0:     	add	x24, x24, #0x1
100b5f0f4:     	ldrsw	x8, [sp, #0xe8]
100b5f0f8:     	cmp	x24, x8
100b5f0fc:     	b.lt	0x100b5f050 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x780>
100b5f100:     	b	0x100b5fbc4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x12f4>
100b5f104:     	and	w21, w9, #0x1
100b5f108:     	cbnz	w21, 0x100b5fba4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x12d4>
100b5f10c:     	ldr	x26, [x26]
100b5f110:     	cbz	x26, 0x100b5f0e4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x814>
100b5f114:     	ldrb	w8, [x26, #0xac]
100b5f118:     	tbnz	w8, #0x0, 0x100b5f10c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x83c>
100b5f11c:     	tbz	w8, #0x4, 0x100b5f128 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x858>
100b5f120:     	ldr	w8, [x20, #0x7c]
100b5f124:     	tbnz	w8, #0x1, 0x100b5f10c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x83c>
100b5f128:     	ldrsh	w0, [x26, #0x9a]
100b5f12c:     	bl	0x100b4d62c <__Z20WM_userdef_event_mapi>
100b5f130:     	cmn	w0, #0x1
100b5f134:     	b.eq	0x100b5f1b0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8e0>
100b5f138:     	cmn	w0, #0x2
100b5f13c:     	b.ne	0x100b5f178 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8a8>
100b5f140:     	ldrh	w9, [x20, #0x12]
100b5f144:     	ldrh	w8, [x20, #0x10]
100b5f148:     	cmp	w9, #0x1
100b5f14c:     	b.ne	0x100b5f1a8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8d8>
100b5f150:     	sub	w9, w8, #0x20
100b5f154:     	cmp	w9, #0xe0
100b5f158:     	b.lo	0x100b5f16c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x89c>
100b5f15c:     	sub	w9, w8, #0x12c
100b5f160:     	and	w9, w9, #0xffff
100b5f164:     	cmp	w9, #0x17
100b5f168:     	b.hi	0x100b5f1a8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8d8>
100b5f16c:     	ldrb	w9, [x20, #0x24]
100b5f170:     	cbnz	w9, 0x100b5f2d4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xa04>
100b5f174:     	b	0x100b5f1a8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8d8>
100b5f178:     	and	w9, w0, #0xfffffffe
100b5f17c:     	ldrh	w8, [x20, #0x10]
100b5f180:     	cmp	w9, #0x1a
100b5f184:     	b.ne	0x100b5f1a8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8d8>
100b5f188:     	cmp	w8, #0x1
100b5f18c:     	b.ne	0x100b5f10c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x83c>
100b5f190:     	ldr	w8, [x20, #0x30]
100b5f194:     	cmp	w0, #0x1a
100b5f198:     	b.ne	0x100b5f3a4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xad4>
100b5f19c:     	cmp	w8, #0x1
100b5f1a0:     	b.ne	0x100b5f10c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x83c>
100b5f1a4:     	b	0x100b5f1b0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8e0>
100b5f1a8:     	cmp	w0, w8, sxth
100b5f1ac:     	b.ne	0x100b5f10c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x83c>
100b5f1b0:     	ldrsb	w8, [x26, #0x9c]
100b5f1b4:     	cmn	w8, #0x1
100b5f1b8:     	b.eq	0x100b5f1e8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x918>
100b5f1bc:     	ldrh	w9, [x20, #0x12]
100b5f1c0:     	cmp	w9, w8, uxth
100b5f1c4:     	b.ne	0x100b5f10c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x83c>
100b5f1c8:     	cmp	w8, #0x5
100b5f1cc:     	b.ne	0x100b5f1e8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x918>
100b5f1d0:     	ldrb	w8, [x26, #0x9d]
100b5f1d4:     	cmp	w8, #0xff
100b5f1d8:     	b.eq	0x100b5f1e8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x918>
100b5f1dc:     	ldrb	w9, [x20, #0x2b]
100b5f1e0:     	cmp	w8, w9
100b5f1e4:     	b.ne	0x100b5f10c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x83c>
100b5f1e8:     	ldrb	w8, [x26, #0x9e]
100b5f1ec:     	cmp	w8, #0xff
100b5f1f0:     	b.eq	0x100b5f214 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x944>
100b5f1f4:     	ldrb	w9, [x20, #0x2a]
100b5f1f8:     	and	w9, w9, #0x1
100b5f1fc:     	cmp	w9, w8
100b5f200:     	b.eq	0x100b5f214 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x944>
100b5f204:     	ldrh	w8, [x20, #0x10]
100b5f208:     	and	w8, w8, #0xfffe
100b5f20c:     	cmp	w8, #0xd8
100b5f210:     	b.ne	0x100b5f10c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x83c>
100b5f214:     	ldrb	w8, [x26, #0x9f]
100b5f218:     	cmp	w8, #0xff
100b5f21c:     	b.eq	0x100b5f244 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x974>
100b5f220:     	ldrb	w9, [x20, #0x2a]
100b5f224:     	ubfx	w9, w9, #1, #1
100b5f228:     	cmp	w9, w8
100b5f22c:     	b.eq	0x100b5f244 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x974>
100b5f230:     	ldrh	w8, [x20, #0x10]
100b5f234:     	cmp	w8, #0xd7
100b5f238:     	b.eq	0x100b5f244 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x974>
100b5f23c:     	cmp	w8, #0xd4
100b5f240:     	b.ne	0x100b5f10c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x83c>
100b5f244:     	ldrb	w8, [x26, #0xa0]
100b5f248:     	cmp	w8, #0xff
100b5f24c:     	b.eq	0x100b5f270 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x9a0>
100b5f250:     	ldrb	w9, [x20, #0x2a]
100b5f254:     	ubfx	w9, w9, #2, #1
100b5f258:     	cmp	w9, w8
100b5f25c:     	b.eq	0x100b5f270 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x9a0>
100b5f260:     	ldrh	w8, [x20, #0x10]
100b5f264:     	sub	w8, w8, #0xd5
100b5f268:     	cmp	w8, #0x1
100b5f26c:     	b.hi	0x100b5f10c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x83c>
100b5f270:     	ldrb	w8, [x26, #0xa1]
100b5f274:     	cmp	w8, #0xff
100b5f278:     	b.eq	0x100b5f298 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x9c8>
100b5f27c:     	ldrb	w9, [x20, #0x2a]
100b5f280:     	ubfx	w9, w9, #3, #1
100b5f284:     	cmp	w9, w8
100b5f288:     	b.eq	0x100b5f298 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x9c8>
100b5f28c:     	ldrh	w8, [x20, #0x10]
100b5f290:     	cmp	w8, #0xac
100b5f294:     	b.ne	0x100b5f10c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x83c>
100b5f298:     	ldrb	w8, [x26, #0xa2]
100b5f29c:     	cmp	w8, #0xff
100b5f2a0:     	b.eq	0x100b5f2c0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x9f0>
100b5f2a4:     	ldrb	w9, [x20, #0x2a]
100b5f2a8:     	ubfx	w9, w9, #4, #1
100b5f2ac:     	cmp	w9, w8
100b5f2b0:     	b.eq	0x100b5f2c0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x9f0>
100b5f2b4:     	ldrh	w8, [x20, #0x10]
100b5f2b8:     	cmp	w8, #0xb3
100b5f2bc:     	b.ne	0x100b5f10c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x83c>
100b5f2c0:     	ldrh	w8, [x26, #0xaa]
100b5f2c4:     	cbz	w8, 0x100b5f2d4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xa04>
100b5f2c8:     	ldrh	w9, [x20, #0x2c]
100b5f2cc:     	cmp	w9, w8
100b5f2d0:     	b.ne	0x100b5f10c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x83c>
100b5f2d4:     	ldp	x9, x8, [x27, #0x28]
100b5f2d8:     	stp	x8, x9, [sp, #0x60]
100b5f2dc:     	ldrb	w22, [x20, #0x2a]
100b5f2e0:     	cmp	w22, #0x2
100b5f2e4:     	cset	w8, eq
100b5f2e8:     	lsl	w8, w8, #1
100b5f2ec:     	cmp	w22, #0x0
100b5f2f0:     	mov	w9, #0x10               ; =16
100b5f2f4:     	mov	w10, #0x4               ; =4
100b5f2f8:     	csel	w9, w10, w9, eq
100b5f2fc:     	str	w9, [sp, #0x58]
100b5f300:     	csinc	w23, w8, wzr, ne
100b5f304:     	ldr	x0, [sp, #0xa8]
100b5f308:     	mov	x1, x20
100b5f30c:     	mov	x2, x23
100b5f310:     	bl	0x100b5df3c <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent22eIPadNativePanDispatch>
100b5f314:     	cbz	w0, 0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f318:     	ldr	x0, [sp, #0xa8]
100b5f31c:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5f320:     	mov	x21, x0
100b5f324:     	ldr	x0, [sp, #0xa8]
100b5f328:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b5f32c:     	ldr	x8, [x21, #0x128]
100b5f330:     	cbz	x8, 0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f334:     	add	x8, x8, #0x328
100b5f338:     	ldr	x9, [sp, #0x80]
100b5f33c:     	cmp	x8, x9
100b5f340:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f344:     	mov	x25, x0
100b5f348:     	ldr	x0, [sp, #0x80]
100b5f34c:     	mov	x1, x27
100b5f350:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b5f354:     	tbnz	w0, #0x1f, 0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f358:     	ldr	w8, [x27, #0x10]
100b5f35c:     	cmp	w8, #0x5
100b5f360:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f364:     	ldr	w8, [x27, #0x14]
100b5f368:     	cbnz	w8, 0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f36c:     	ldr	x8, [x27, #0x18]
100b5f370:     	cbnz	x8, 0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f374:     	ldr	x8, [x27, #0x38]
100b5f378:     	cbnz	x8, 0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f37c:     	ldr	x8, [x27, #0x40]
100b5f380:     	cbnz	x8, 0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f384:     	ldr	x8, [x27, #0x28]
100b5f388:     	cbnz	x8, 0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f38c:     	ldr	x8, [x27, #0x30]
100b5f390:     	cbz	x8, 0x100b5f3b0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xae0>
100b5f394:     	ldr	w8, [sp, #0x7c]
100b5f398:     	tbz	w8, #0x0, 0x100b5f670 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xda0>
100b5f39c:     	mov	w7, #0x0                ; =0
100b5f3a0:     	b	0x100b5f680 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xdb0>
100b5f3a4:     	cmp	w8, #0x2
100b5f3a8:     	b.ne	0x100b5f10c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x83c>
100b5f3ac:     	b	0x100b5f1b0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x8e0>
100b5f3b0:     	ldr	x8, [x27, #0x48]
100b5f3b4:     	cbnz	x8, 0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f3b8:     	cbz	x25, 0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f3bc:     	ldr	x8, [x25, #0x5c0]
100b5f3c0:     	cbz	x8, 0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f3c4:     	ldr	x1, [x8, #0xc8]
100b5f3c8:     	cbz	x1, 0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f3cc:     	ldr	x9, [x8, #0xd8]
100b5f3d0:     	cbz	x9, 0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f3d4:     	cmp	x1, x9
100b5f3d8:     	b.eq	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f3dc:     	add	x0, x8, #0x88
100b5f3e0:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b5f3e4:     	tbnz	w0, #0x1f, 0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f3e8:     	ldr	x8, [x25, #0x5c0]
100b5f3ec:     	ldr	x1, [x8, #0xd8]
100b5f3f0:     	add	x0, x8, #0x88
100b5f3f4:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b5f3f8:     	tbnz	w0, #0x1f, 0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f3fc:     	ldr	x8, [x25, #0x5c0]
100b5f400:     	ldr	x21, [x8, #0xc8]
100b5f404:     	ldr	x9, [x8, #0xd8]
100b5f408:     	str	x9, [sp, #0x40]
100b5f40c:     	add	x25, x8, #0x88
100b5f410:     	ldr	x25, [x25]
100b5f414:     	cbz	x25, 0x100b5f440 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xb70>
100b5f418:     	add	x0, x25, #0x10
100b5f41c:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b5f420:     	add	x8, x8, #0xe08
100b5f424:     	mov	w9, #0x2770             ; =10096
100b5f428:     	add	x1, x8, x9
100b5f42c:     	mov	w2, #0x40               ; =64
100b5f430:     	bl	0x104b77814 <_zlibVersion+0x104b77814>
100b5f434:     	cbnz	w0, 0x100b5f410 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xb40>
100b5f438:     	cmp	x25, x21
100b5f43c:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f440:     	mov	x0, x21
100b5f444:     	bl	0x100b60790 <__ZL28wm_ipad_node_view2d_map_findPK11wmKeyConfig>
100b5f448:     	mov	x21, x0
100b5f44c:     	ldr	x0, [sp, #0x40]
100b5f450:     	bl	0x100b60790 <__ZL28wm_ipad_node_view2d_map_findPK11wmKeyConfig>
100b5f454:     	cbz	x21, 0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f458:     	mov	x25, x0
100b5f45c:     	ldr	x8, [x27, #0x20]
100b5f460:     	cmp	x8, x21
100b5f464:     	ldr	x8, [sp, #0x50]
100b5f468:     	ccmp	x0, x8, #0x0, eq
100b5f46c:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f470:     	ldrh	w8, [x21, #0xf6]
100b5f474:     	ldrh	w9, [x25, #0xf6]
100b5f478:     	cmp	w8, w9
100b5f47c:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f480:     	add	x3, sp, #0x1d0
100b5f484:     	sub	x4, x29, #0xd0
100b5f488:     	mov	x0, x21
100b5f48c:     	mov	w1, #0x0                ; =0
100b5f490:     	mov	x2, #0x0                ; =0
100b5f494:     	bl	0x100b607f8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i>
100b5f498:     	cbz	w0, 0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f49c:     	add	x3, sp, #0x1b8
100b5f4a0:     	add	x4, sp, #0x1f0
100b5f4a4:     	mov	x0, x25
100b5f4a8:     	mov	w1, #0x1                ; =1
100b5f4ac:     	mov	x2, x26
100b5f4b0:     	bl	0x100b607f8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i>
100b5f4b4:     	cbz	w0, 0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f4b8:     	ldur	w8, [x29, #-0xd0]
100b5f4bc:     	ldr	w9, [sp, #0x1f0]
100b5f4c0:     	cmp	w8, w9
100b5f4c4:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f4c8:     	ldur	w8, [x29, #-0xcc]
100b5f4cc:     	ldr	w9, [sp, #0x1f4]
100b5f4d0:     	cmp	w8, w9
100b5f4d4:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f4d8:     	ldur	w8, [x29, #-0xc8]
100b5f4dc:     	ldr	w9, [sp, #0x1f8]
100b5f4e0:     	cmp	w8, w9
100b5f4e4:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f4e8:     	ldur	w8, [x29, #-0xc4]
100b5f4ec:     	ldr	w9, [sp, #0x1fc]
100b5f4f0:     	cmp	w8, w9
100b5f4f4:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f4f8:     	ldur	w8, [x29, #-0xc0]
100b5f4fc:     	ldr	w9, [sp, #0x200]
100b5f500:     	cmp	w8, w9
100b5f504:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f508:     	ldur	w8, [x29, #-0xbc]
100b5f50c:     	ldr	w9, [sp, #0x204]
100b5f510:     	cmp	w8, w9
100b5f514:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f518:     	ldur	w8, [x29, #-0xb8]
100b5f51c:     	ldr	w9, [sp, #0x208]
100b5f520:     	cmp	w8, w9
100b5f524:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f528:     	ldur	w8, [x29, #-0xb4]
100b5f52c:     	ldr	w9, [sp, #0x20c]
100b5f530:     	cmp	w8, w9
100b5f534:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f538:     	ldur	w8, [x29, #-0xb0]
100b5f53c:     	ldr	w9, [sp, #0x210]
100b5f540:     	cmp	w8, w9
100b5f544:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f548:     	ldur	w8, [x29, #-0xac]
100b5f54c:     	ldr	w9, [sp, #0x214]
100b5f550:     	cmp	w8, w9
100b5f554:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f558:     	ldur	w8, [x29, #-0xa8]
100b5f55c:     	ldr	w9, [sp, #0x218]
100b5f560:     	cmp	w8, w9
100b5f564:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f568:     	ldur	w8, [x29, #-0xa4]
100b5f56c:     	ldr	w9, [sp, #0x21c]
100b5f570:     	cmp	w8, w9
100b5f574:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f578:     	ldur	w8, [x29, #-0xa0]
100b5f57c:     	ldr	w9, [sp, #0x220]
100b5f580:     	cmp	w8, w9
100b5f584:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f588:     	ldur	w8, [x29, #-0x9c]
100b5f58c:     	ldr	w9, [sp, #0x224]
100b5f590:     	cmp	w8, w9
100b5f594:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f598:     	ldur	w8, [x29, #-0x98]
100b5f59c:     	ldr	w9, [sp, #0x228]
100b5f5a0:     	cmp	w8, w9
100b5f5a4:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f5a8:     	ldur	w8, [x29, #-0x94]
100b5f5ac:     	ldr	w9, [sp, #0x22c]
100b5f5b0:     	cmp	w8, w9
100b5f5b4:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f5b8:     	ldur	w8, [x29, #-0x90]
100b5f5bc:     	ldr	w9, [sp, #0x230]
100b5f5c0:     	cmp	w8, w9
100b5f5c4:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f5c8:     	ldur	w8, [x29, #-0x8c]
100b5f5cc:     	ldr	w9, [sp, #0x234]
100b5f5d0:     	cmp	w8, w9
100b5f5d4:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f5d8:     	ldur	w8, [x29, #-0x88]
100b5f5dc:     	ldr	w9, [sp, #0x238]
100b5f5e0:     	cmp	w8, w9
100b5f5e4:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f5e8:     	ldur	w8, [x29, #-0x84]
100b5f5ec:     	ldr	w9, [sp, #0x23c]
100b5f5f0:     	cmp	w8, w9
100b5f5f4:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f5f8:     	ldur	w8, [x29, #-0x80]
100b5f5fc:     	ldr	w9, [sp, #0x240]
100b5f600:     	cmp	w8, w9
100b5f604:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f608:     	ldur	w8, [x29, #-0x7c]
100b5f60c:     	ldr	w9, [sp, #0x244]
100b5f610:     	cmp	w8, w9
100b5f614:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f618:     	ldur	w8, [x29, #-0x78]
100b5f61c:     	ldr	w9, [sp, #0x248]
100b5f620:     	cmp	w8, w9
100b5f624:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f628:     	ldur	w8, [x29, #-0x74]
100b5f62c:     	ldr	w9, [sp, #0x24c]
100b5f630:     	cmp	w8, w9
100b5f634:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f638:     	ldur	w8, [x29, #-0x70]
100b5f63c:     	ldr	w9, [sp, #0x250]
100b5f640:     	cmp	w8, w9
100b5f644:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f648:     	ldr	w8, [sp, #0x1b8]
100b5f64c:     	ldr	w9, [sp, #0x58]
100b5f650:     	cmp	w8, w9
100b5f654:     	b.ne	0x100b5f394 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xac4>
100b5f658:     	cmp	w22, #0x0
100b5f65c:     	ccmp	w22, #0x2, #0x4, ne
100b5f660:     	ldr	w8, [sp, #0x7c]
100b5f664:     	csinc	w8, w8, wzr, ne
100b5f668:     	csel	w7, w23, wzr, eq
100b5f66c:     	tbnz	w8, #0x0, 0x100b5f680 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xdb0>
100b5f670:     	ldr	x0, [sp, #0xa8]
100b5f674:     	bl	0x1000b1ebc <__Z15CTX_py_dict_getPK8bContext>
100b5f678:     	mov	w7, #0x0                ; =0
100b5f67c:     	cbz	x0, 0x100b5f75c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xe8c>
100b5f680:     	ldr	x4, [x26, #0xb0]
100b5f684:     	add	x25, x26, #0x10
100b5f688:     	ldr	x0, [sp, #0xa8]
100b5f68c:     	ldr	x1, [sp, #0x80]
100b5f690:     	mov	x2, x27
100b5f694:     	mov	x3, x20
100b5f698:     	mov	x5, x25
100b5f69c:     	mov	w6, #0x0                ; =0
100b5f6a0:     	bl	0x100b524d0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb22eIPadNativePanDispatch>
100b5f6a4:     	mov	x21, x0
100b5f6a8:     	adrp	x8, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b5f6ac:     	add	x8, x8, #0x2a0
100b5f6b0:     	ldr	x0, [x8]
100b5f6b4:     	ldr	x23, [x0, #0x8]
100b5f6b8:     	cbnz	x23, 0x100b5f6d0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xe00>
100b5f6bc:     	bl	0x100ae3834 <__Z15CLG_logref_initP10CLG_LogRef>
100b5f6c0:     	adrp	x8, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b5f6c4:     	add	x8, x8, #0x2a0
100b5f6c8:     	ldr	x8, [x8]
100b5f6cc:     	ldr	x23, [x8, #0x8]
100b5f6d0:     	ldr	w9, [sp, #0xb8]
100b5f6d4:     	orr	w9, w21, w9
100b5f6d8:     	ldr	w8, [x23, #0x50]
100b5f6dc:     	cmp	w8, #0x3
100b5f6e0:     	str	w9, [sp, #0xb8]
100b5f6e4:     	b.le	0x100b5f104 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x834>
100b5f6e8:     	strb	wzr, [sp, #0x1f0]
100b5f6ec:     	strb	wzr, [sp, #0x208]
100b5f6f0:     	ldr	x21, [x26, #0x50]
100b5f6f4:     	cbz	x21, 0x100b5f970 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x10a0>
100b5f6f8:     	mov	x0, x25
100b5f6fc:     	mov	w1, #0x0                ; =0
100b5f700:     	bl	0x100b7dbcc <__Z20WM_operatortype_findPKcb>
100b5f704:     	cbz	x0, 0x100b5f97c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x10ac>
100b5f708:     	ldr	x1, [x26, #0xb0]
100b5f70c:     	sub	x8, x29, #0xd0
100b5f710:     	ldr	x0, [sp, #0xa8]
100b5f714:     	mov	w2, #0x0                ; =0
100b5f718:     	mov	w3, #0x0                ; =0
100b5f71c:     	mov	w4, #0x1                ; =1
100b5f720:     	mov	w5, #0x200              ; =512
100b5f724:     	bl	0x101263408 <__Z30RNA_pointer_as_string_keywordsP8bContextP10PointerRNAbbbi>
100b5f728:     	ldur	q0, [x29, #-0xd0]
100b5f72c:     	str	q0, [sp, #0x1f0]
100b5f730:     	ldur	x8, [x29, #-0xc0]
100b5f734:     	str	x8, [sp, #0x200]
100b5f738:     	mov	w8, #0x1                ; =1
100b5f73c:     	strb	w8, [sp, #0x208]
100b5f740:     	ldrsb	w8, [sp, #0x207]
100b5f744:     	tbnz	w8, #0x1f, 0x100b5fa2c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x115c>
100b5f748:     	ldr	q0, [sp, #0x1f0]
100b5f74c:     	str	q0, [sp, #0x1d0]
100b5f750:     	ldr	x8, [sp, #0x200]
100b5f754:     	str	x8, [sp, #0x1e0]
100b5f758:     	b	0x100b5fa38 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1168>
100b5f75c:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b5f760:     	add	x8, x8, #0xe08
100b5f764:     	ldrb	w8, [x8, #0x9]
100b5f768:     	tbnz	w8, #0x4, 0x100b5f680 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xdb0>
100b5f76c:     	adrp	x8, 0x107ef7000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b5f770:     	ldrb	w8, [x8, #0x824]
100b5f774:     	tbnz	w8, #0x0, 0x100b5f680 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xdb0>
100b5f778:     	ldr	w8, [x20, #0x7c]
100b5f77c:     	and	w8, w8, #0x3f8
100b5f780:     	cmp	w8, #0x200
100b5f784:     	b.ne	0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f788:     	ldrh	w8, [x20, #0x10]
100b5f78c:     	cmp	w8, #0xe
100b5f790:     	b.ne	0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f794:     	ldrh	w8, [x20, #0x12]
100b5f798:     	cbnz	w8, 0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f79c:     	ldrb	w8, [x20, #0x2a]
100b5f7a0:     	cmp	w8, #0x2
100b5f7a4:     	b.ne	0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f7a8:     	ldrh	w8, [x20, #0x2c]
100b5f7ac:     	cbnz	w8, 0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f7b0:     	ldr	x0, [sp, #0xa8]
100b5f7b4:     	bl	0x100b5e028 <__ZL41wm_ipad_knife_precision_pan_owner_contextP8bContext>
100b5f7b8:     	cbz	w0, 0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f7bc:     	ldr	x0, [sp, #0xa8]
100b5f7c0:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5f7c4:     	mov	x21, x0
100b5f7c8:     	ldr	x0, [sp, #0xa8]
100b5f7cc:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b5f7d0:     	mov	w7, #0x0                ; =0
100b5f7d4:     	cbz	x21, 0x100b5f680 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xdb0>
100b5f7d8:     	ldr	x8, [x21, #0x128]
100b5f7dc:     	cbz	x8, 0x100b5f680 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xdb0>
100b5f7e0:     	add	x8, x8, #0x328
100b5f7e4:     	ldr	x9, [sp, #0x80]
100b5f7e8:     	cmp	x8, x9
100b5f7ec:     	b.ne	0x100b5f680 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xdb0>
100b5f7f0:     	mov	x23, x0
100b5f7f4:     	ldr	x0, [sp, #0x80]
100b5f7f8:     	mov	x1, x27
100b5f7fc:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b5f800:     	tbnz	w0, #0x1f, 0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f804:     	ldr	w8, [x27, #0x10]
100b5f808:     	cmp	w8, #0x5
100b5f80c:     	b.ne	0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f810:     	ldr	w8, [x27, #0x14]
100b5f814:     	cbnz	w8, 0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f818:     	ldr	x8, [x27, #0x18]
100b5f81c:     	cbnz	x8, 0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f820:     	ldr	x8, [x27, #0x38]
100b5f824:     	cbnz	x8, 0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f828:     	ldr	x8, [x27, #0x40]
100b5f82c:     	cbnz	x8, 0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f830:     	ldr	x8, [x27, #0x28]
100b5f834:     	cbnz	x8, 0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f838:     	ldr	x8, [x27, #0x30]
100b5f83c:     	cbnz	x8, 0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f840:     	mov	w7, #0x0                ; =0
100b5f844:     	ldr	x8, [x27, #0x48]
100b5f848:     	cbnz	x8, 0x100b5f680 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xdb0>
100b5f84c:     	cbz	x23, 0x100b5f680 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xdb0>
100b5f850:     	ldr	x8, [x23, #0x5c0]
100b5f854:     	cbz	x8, 0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f858:     	ldr	x1, [x8, #0xc8]
100b5f85c:     	cbz	x1, 0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f860:     	mov	w7, #0x0                ; =0
100b5f864:     	ldr	x9, [x8, #0xd8]
100b5f868:     	cbz	x9, 0x100b5f680 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xdb0>
100b5f86c:     	cmp	x1, x9
100b5f870:     	b.eq	0x100b5f680 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xdb0>
100b5f874:     	add	x0, x8, #0x88
100b5f878:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b5f87c:     	tbnz	w0, #0x1f, 0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f880:     	ldr	x8, [x23, #0x5c0]
100b5f884:     	ldr	x1, [x8, #0xd8]
100b5f888:     	add	x0, x8, #0x88
100b5f88c:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b5f890:     	tbnz	w0, #0x1f, 0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f894:     	ldr	x8, [x23, #0x5c0]
100b5f898:     	ldr	x21, [x8, #0xc8]
100b5f89c:     	ldr	x22, [x8, #0xd8]
100b5f8a0:     	add	x23, x8, #0x88
100b5f8a4:     	ldr	x23, [x23]
100b5f8a8:     	cbz	x23, 0x100b5f8d4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1004>
100b5f8ac:     	add	x0, x23, #0x10
100b5f8b0:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b5f8b4:     	add	x8, x8, #0xe08
100b5f8b8:     	mov	w9, #0x2770             ; =10096
100b5f8bc:     	add	x1, x8, x9
100b5f8c0:     	mov	w2, #0x40               ; =64
100b5f8c4:     	bl	0x104b77814 <_zlibVersion+0x104b77814>
100b5f8c8:     	cbnz	w0, 0x100b5f8a4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xfd4>
100b5f8cc:     	cmp	x23, x21
100b5f8d0:     	b.ne	0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f8d4:     	mov	x0, x21
100b5f8d8:     	adrp	x21, 0x104bd5000 <__ZL3hex+0x4a0d>
100b5f8dc:     	add	x21, x21, #0xe5f
100b5f8e0:     	mov	x1, x21
100b5f8e4:     	mov	w2, #0x1                ; =1
100b5f8e8:     	bl	0x100b5e234 <__ZL26wm_ipad_knife_pan_map_findPK11wmKeyConfigPKcii>
100b5f8ec:     	mov	x23, x0
100b5f8f0:     	mov	x0, x22
100b5f8f4:     	mov	x1, x21
100b5f8f8:     	mov	w2, #0x1                ; =1
100b5f8fc:     	bl	0x100b5e234 <__ZL26wm_ipad_knife_pan_map_findPK11wmKeyConfigPKcii>
100b5f900:     	cbz	x23, 0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f904:     	mov	x21, x0
100b5f908:     	ldr	x8, [x27, #0x20]
100b5f90c:     	cmp	x8, x23
100b5f910:     	ldr	x8, [sp, #0x50]
100b5f914:     	ccmp	x0, x8, #0x0, eq
100b5f918:     	b.ne	0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f91c:     	ldrh	w8, [x23, #0xf6]
100b5f920:     	ldrh	w9, [x21, #0xf6]
100b5f924:     	cmp	w8, w9
100b5f928:     	b.ne	0x100b5f39c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xacc>
100b5f92c:     	mov	x0, x23
100b5f930:     	mov	w1, #0x0                ; =0
100b5f934:     	bl	0x100b60ae4 <__ZL27wm_ipad_knife_pan_zoom_itemPK8wmKeyMapb>
100b5f938:     	mov	x22, x0
100b5f93c:     	mov	x0, x21
100b5f940:     	mov	w1, #0x1                ; =1
100b5f944:     	bl	0x100b60ae4 <__ZL27wm_ipad_knife_pan_zoom_itemPK8wmKeyMapb>
100b5f948:     	mov	w7, #0x0                ; =0
100b5f94c:     	cbz	x22, 0x100b5f680 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xdb0>
100b5f950:     	cmp	x0, x26
100b5f954:     	b.ne	0x100b5f680 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xdb0>
100b5f958:     	ldrh	w8, [x22, #0xae]
100b5f95c:     	ldrh	w9, [x0, #0xae]
100b5f960:     	cmp	w8, w9
100b5f964:     	mov	w8, #0x3                ; =3
100b5f968:     	csel	w7, w8, wzr, eq
100b5f96c:     	b	0x100b5f680 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xdb0>
100b5f970:     	strb	wzr, [sp, #0x1e7]
100b5f974:     	strb	wzr, [sp, #0x1d0]
100b5f978:     	b	0x100b5fa38 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1168>
100b5f97c:     	str	x21, [sp, #0x40]
100b5f980:     	ldr	x0, [x26, #0x50]
100b5f984:     	mov	x1, #0x0                ; =0
100b5f988:     	bl	0x1001f8c44 <__Z9IDP_reprNPK10IDPropertyPj>
100b5f98c:     	str	x0, [sp, #0x58]
100b5f990:     	bl	0x104b777f0 <_zlibVersion+0x104b777f0>
100b5f994:     	mov	x8, #0x7ffffffffffffff8 ; =9223372036854775800
100b5f998:     	cmp	x0, x8
100b5f99c:     	b.hs	0x100b60648 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1d78>
100b5f9a0:     	mov	x22, x0
100b5f9a4:     	cmp	x0, #0x17
100b5f9a8:     	b.hs	0x100b5f9c0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x10f0>
100b5f9ac:     	strb	w22, [sp, #0x207]
100b5f9b0:     	add	x21, sp, #0x1f0
100b5f9b4:     	ldr	x0, [sp, #0x58]
100b5f9b8:     	cbnz	x22, 0x100b5f9ec <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x111c>
100b5f9bc:     	b	0x100b5fa00 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1130>
100b5f9c0:     	orr	x8, x22, #0x7
100b5f9c4:     	cmp	x8, #0x17
100b5f9c8:     	mov	w9, #0x19               ; =25
100b5f9cc:     	csinc	x0, x9, x8, eq
100b5f9d0:     	str	x0, [sp, #0x38]
100b5f9d4:     	bl	0x104b75d8c <_zlibVersion+0x104b75d8c>
100b5f9d8:     	mov	x21, x0
100b5f9dc:     	ldr	x8, [sp, #0x38]
100b5f9e0:     	orr	x8, x8, #0x8000000000000000
100b5f9e4:     	stp	x22, x8, [sp, #0x1f8]
100b5f9e8:     	str	x0, [sp, #0x1f0]
100b5f9ec:     	mov	x0, x21
100b5f9f0:     	ldr	x1, [sp, #0x58]
100b5f9f4:     	mov	x2, x22
100b5f9f8:     	bl	0x104b76c2c <_zlibVersion+0x104b76c2c>
100b5f9fc:     	ldr	x0, [sp, #0x58]
100b5fa00:     	strb	wzr, [x21, x22]
100b5fa04:     	mov	w8, #0x1                ; =1
100b5fa08:     	strb	w8, [sp, #0x208]
100b5fa0c:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5fa10:     	add	x8, x8, #0x710
100b5fa14:     	ldr	x8, [x8]
100b5fa18:     	mov	w1, #0x0                ; =0
100b5fa1c:     	blr	x8
100b5fa20:     	ldr	x21, [sp, #0x40]
100b5fa24:     	ldrsb	w8, [sp, #0x207]
100b5fa28:     	tbz	w8, #0x1f, 0x100b5f748 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0xe78>
100b5fa2c:     	ldp	x1, x2, [sp, #0x1f0]
100b5fa30:     	add	x0, sp, #0x1d0
100b5fa34:     	bl	0x103d21fa4 <__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE25__init_copy_ctor_externalEPKcm>
100b5fa38:     	ldrsb	x8, [sp, #0x1e7]
100b5fa3c:     	cmp	x8, #0x0
100b5fa40:     	ldp	x9, x10, [sp, #0x1d0]
100b5fa44:     	add	x11, sp, #0x1d0
100b5fa48:     	csel	x9, x9, x11, lt
100b5fa4c:     	cmp	w8, #0x0
100b5fa50:     	csel	x8, x10, x8, lt
100b5fa54:     	stp	x25, xzr, [x29, #-0xd0]
100b5fa58:     	stp	x9, x8, [x29, #-0xc0]
100b5fa5c:     	add	x8, sp, #0x1b8
100b5fa60:     	sub	x3, x29, #0xd0
100b5fa64:     	adrp	x0, 0x104bd5000 <__ZL3hex+0x4a0d>
100b5fa68:     	add	x0, x0, #0xe76
100b5fa6c:     	mov	w1, #0x6                ; =6
100b5fa70:     	mov	w2, #0xdc               ; =220
100b5fa74:     	bl	0x104a42d7c <__ZN3fmt3v107vformatENS0_17basic_string_viewIcEENS0_17basic_format_argsINS0_20basic_format_contextINS0_8appenderEcEEEE>
100b5fa78:     	ldrsb	w8, [sp, #0x1e7]
100b5fa7c:     	tbz	w8, #0x1f, 0x100b5fa88 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x11b8>
100b5fa80:     	ldr	x0, [sp, #0x1d0]
100b5fa84:     	bl	0x104b75d68 <_zlibVersion+0x104b75d68>
100b5fa88:     	cbz	x21, 0x100b5fa9c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x11cc>
100b5fa8c:     	ldrsb	w8, [sp, #0x207]
100b5fa90:     	tbz	w8, #0x1f, 0x100b5fa9c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x11cc>
100b5fa94:     	ldr	x0, [sp, #0x1f0]
100b5fa98:     	bl	0x104b75d68 <_zlibVersion+0x104b75d68>
100b5fa9c:     	ldrsb	w8, [sp, #0x1cf]
100b5faa0:     	ldr	x9, [sp, #0x1b8]
100b5faa4:     	cmp	w8, #0x0
100b5faa8:     	add	x8, sp, #0x1b8
100b5faac:     	csel	x22, x9, x8, lt
100b5fab0:     	ldr	w10, [sp, #0xb8]
100b5fab4:     	tst	w10, #0x2
100b5fab8:     	adrp	x8, 0x104bd5000 <__ZL3hex+0x4a0d>
100b5fabc:     	add	x8, x8, #0xe85
100b5fac0:     	adrp	x9, 0x104bd5000 <__ZL3hex+0x4a0d>
100b5fac4:     	add	x9, x9, #0xe9b
100b5fac8:     	csel	x8, x9, x8, eq
100b5facc:     	ands	w21, w10, #0x1
100b5fad0:     	adrp	x9, 0x104bd5000 <__ZL3hex+0x4a0d>
100b5fad4:     	add	x9, x9, #0xe7d
100b5fad8:     	csel	x25, x8, x9, eq
100b5fadc:     	sub	x8, x29, #0xd0
100b5fae0:     	mov	x0, x26
100b5fae4:     	mov	w1, #0x0                ; =0
100b5fae8:     	bl	0x100b77468 <__Z24WM_keymap_item_to_stringPK12wmKeyMapItemb>
100b5faec:     	ldurb	w8, [x29, #-0xb8]
100b5faf0:     	tbz	w8, #0x0, 0x100b5fb28 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1258>
100b5faf4:     	ldur	x8, [x29, #-0xc0]
100b5faf8:     	str	x8, [sp, #0x200]
100b5fafc:     	ldur	q0, [x29, #-0xd0]
100b5fb00:     	str	q0, [sp, #0x1f0]
100b5fb04:     	stp	xzr, xzr, [x29, #-0xc8]
100b5fb08:     	stur	xzr, [x29, #-0xd0]
100b5fb0c:     	lsr	x8, x8, #56
100b5fb10:     	sxtb	w8, w8
100b5fb14:     	ldr	x9, [sp, #0x1f0]
100b5fb18:     	cmp	w8, #0x0
100b5fb1c:     	add	x8, sp, #0x1f0
100b5fb20:     	csel	x8, x9, x8, lt
100b5fb24:     	b	0x100b5fb34 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1264>
100b5fb28:     	strb	wzr, [sp, #0x207]
100b5fb2c:     	strb	wzr, [sp, #0x1f0]
100b5fb30:     	add	x8, sp, #0x1f0
100b5fb34:     	stp	x25, x8, [sp, #0x10]
100b5fb38:     	ldr	x8, [sp, #0x70]
100b5fb3c:     	stp	x8, x22, [sp]
100b5fb40:     	mov	x0, x23
100b5fb44:     	mov	w1, #0x4                ; =4
100b5fb48:     	adrp	x2, 0x104bd5000 <__ZL3hex+0x4a0d>
100b5fb4c:     	add	x2, x2, #0xd0e
100b5fb50:     	adrp	x3, 0x104bd5000 <__ZL3hex+0x4a0d>
100b5fb54:     	add	x3, x3, #0xce4
100b5fb58:     	adrp	x4, 0x104bd5000 <__ZL3hex+0x4a0d>
100b5fb5c:     	add	x4, x4, #0xd4a
100b5fb60:     	bl	0x100ae2b58 <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b5fb64:     	ldrsb	w8, [sp, #0x207]
100b5fb68:     	tbz	w8, #0x1f, 0x100b5fb74 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x12a4>
100b5fb6c:     	ldr	x0, [sp, #0x1f0]
100b5fb70:     	bl	0x104b75d68 <_zlibVersion+0x104b75d68>
100b5fb74:     	ldurb	w8, [x29, #-0xb8]
100b5fb78:     	cmp	w8, #0x1
100b5fb7c:     	b.ne	0x100b5fb90 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x12c0>
100b5fb80:     	ldursb	w8, [x29, #-0xb9]
100b5fb84:     	tbz	w8, #0x1f, 0x100b5fb90 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x12c0>
100b5fb88:     	ldur	x0, [x29, #-0xd0]
100b5fb8c:     	bl	0x104b75d68 <_zlibVersion+0x104b75d68>
100b5fb90:     	ldrsb	w8, [sp, #0x1cf]
100b5fb94:     	tbz	w8, #0x1f, 0x100b5f108 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x838>
100b5fb98:     	ldr	x0, [sp, #0x1b8]
100b5fb9c:     	bl	0x104b75d68 <_zlibVersion+0x104b75d68>
100b5fba0:     	b	0x100b5f108 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x838>
100b5fba4:     	ldr	x8, [sp, #0x68]
100b5fba8:     	cbz	x8, 0x100b5f0e4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x814>
100b5fbac:     	ldr	x0, [sp, #0x50]
100b5fbb0:     	mov	x1, x26
100b5fbb4:     	ldr	x2, [sp, #0x60]
100b5fbb8:     	blr	x8
100b5fbbc:     	b	0x100b5f0e4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x814>
100b5fbc0:     	mov	w28, #0x0               ; =0
100b5fbc4:     	ldr	w8, [sp, #0xc4]
100b5fbc8:     	orr	w8, w28, w8
100b5fbcc:     	ldr	x24, [sp, #0xa8]
100b5fbd0:     	str	w8, [sp, #0xc4]
100b5fbd4:     	tbz	w8, #0x0, 0x100b5fc08 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1338>
100b5fbd8:     	ldr	w8, [sp, #0x4c]
100b5fbdc:     	and	w8, w8, #0xfff0
100b5fbe0:     	cmp	w8, #0x110
100b5fbe4:     	b.eq	0x100b5fc08 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1338>
100b5fbe8:     	mov	x0, x24
100b5fbec:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5fbf0:     	cbz	x0, 0x100b5fc08 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1338>
100b5fbf4:     	mov	x0, x24
100b5fbf8:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5fbfc:     	mov	x1, x0
100b5fc00:     	mov	x0, x24
100b5fc04:     	bl	0x100b94b5c <__Z16WM_tooltip_clearP8bContextP8wmWindow>
100b5fc08:     	ldr	x28, [sp, #0x80]
100b5fc0c:     	b	0x100b60454 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b84>
100b5fc10:     	cmp	w8, #0xac
100b5fc14:     	mov	w9, #0xb3               ; =179
100b5fc18:     	ccmp	w8, w9, #0x4, ne
100b5fc1c:     	cset	w22, eq
100b5fc20:     	ldrh	w21, [x20, #0x12]
100b5fc24:     	mov	x25, x24
100b5fc28:     	mov	x0, x24
100b5fc2c:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b5fc30:     	str	x0, [sp, #0x68]
100b5fc34:     	mov	x0, x25
100b5fc38:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5fc3c:     	str	x0, [sp, #0xb8]
100b5fc40:     	ldr	x0, [x27, #0x20]
100b5fc44:     	str	x0, [sp, #0x70]
100b5fc48:     	bl	0x100b40a84 <__Z25wm_gizmomap_highlight_getP10wmGizmoMap>
100b5fc4c:     	mov	x28, x0
100b5fc50:     	cbz	x0, 0x100b5fc84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x13b4>
100b5fc54:     	ldrh	w8, [x20, #0x10]
100b5fc58:     	sub	w8, w8, #0x1
100b5fc5c:     	cmp	w8, #0x14
100b5fc60:     	b.hi	0x100b5fc84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x13b4>
100b5fc64:     	ldrh	w8, [x20, #0x12]
100b5fc68:     	cmp	w8, #0x1
100b5fc6c:     	b.ne	0x100b5fc84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x13b4>
100b5fc70:     	mov	x0, x25
100b5fc74:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5fc78:     	mov	x1, x0
100b5fc7c:     	mov	x0, x25
100b5fc80:     	bl	0x100b94b5c <__Z16WM_tooltip_clearP8bContextP8wmWindow>
100b5fc84:     	ldr	x8, [sp, #0xb8]
100b5fc88:     	ldr	x8, [x8, #0x128]
100b5fc8c:     	ldr	x8, [x8, #0x170]
100b5fc90:     	ldrb	w8, [x8, #0xf0]
100b5fc94:     	cmp	w8, #0x1
100b5fc98:     	b.ne	0x100b5fd0c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x143c>
100b5fc9c:     	add	x1, x20, #0x14
100b5fca0:     	ldr	x0, [sp, #0xb8]
100b5fca4:     	mov	w2, #0x1                ; =1
100b5fca8:     	bl	0x101f363e8 <__Z31UI_region_block_find_mouse_overPK7ARegionPKib>
100b5fcac:     	cbz	x0, 0x100b5fd0c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x143c>
100b5fcb0:     	mov	w22, #0x0               ; =0
100b5fcb4:     	cbz	x28, 0x100b60440 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b70>
100b5fcb8:     	ldrh	w8, [x20, #0x10]
100b5fcbc:     	mov	w9, #0x5025             ; =20517
100b5fcc0:     	cmp	w8, w9
100b5fcc4:     	mov	x24, x25
100b5fcc8:     	b.eq	0x100b60444 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b74>
100b5fccc:     	cmp	w21, #0x5
100b5fcd0:     	ldr	x28, [sp, #0x80]
100b5fcd4:     	b.eq	0x100b60448 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b78>
100b5fcd8:     	mov	x0, x24
100b5fcdc:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5fce0:     	mov	x1, x0
100b5fce4:     	mov	x0, x25
100b5fce8:     	bl	0x100b94b5c <__Z16WM_tooltip_clearP8bContextP8wmWindow>
100b5fcec:     	ldr	x0, [sp, #0x70]
100b5fcf0:     	mov	x1, x25
100b5fcf4:     	mov	x2, #0x0                ; =0
100b5fcf8:     	mov	w3, #0x0                ; =0
100b5fcfc:     	bl	0x100b40580 <__Z25wm_gizmomap_highlight_setP10wmGizmoMapPK8bContextP7wmGizmoi>
100b5fd00:     	mov	w22, #0x0               ; =0
100b5fd04:     	mov	x24, x25
100b5fd08:     	b	0x100b60448 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b78>
100b5fd0c:     	ldr	x0, [sp, #0x70]
100b5fd10:     	bl	0x100b40578 <__Z21wm_gizmomap_modal_getP10wmGizmoMap>
100b5fd14:     	str	x0, [sp, #0x60]
100b5fd18:     	cbz	x28, 0x100b5fdc8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x14f8>
100b5fd1c:     	ldr	w8, [x28, #0x50]
100b5fd20:     	str	w8, [sp, #0x50]
100b5fd24:     	b	0x100b5fdcc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x14fc>
100b5fd28:     	ldr	x1, [x27, #0x38]
100b5fd2c:     	cbz	x1, 0x100b5fd38 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1468>
100b5fd30:     	mov	x0, x24
100b5fd34:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b5fd38:     	ldr	x1, [x27, #0x40]
100b5fd3c:     	cbz	x1, 0x100b5fd48 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1478>
100b5fd40:     	mov	x0, x24
100b5fd44:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b5fd48:     	ldr	x1, [x27, #0x48]
100b5fd4c:     	cbz	x1, 0x100b5fd58 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1488>
100b5fd50:     	mov	x0, x24
100b5fd54:     	bl	0x1000b4b90 <__Z23CTX_wm_region_popup_setP8bContextP7ARegion>
100b5fd58:     	ldr	x8, [x27, #0x20]
100b5fd5c:     	ldr	x2, [x27, #0x30]
100b5fd60:     	mov	x0, x24
100b5fd64:     	mov	x1, x20
100b5fd68:     	blr	x8
100b5fd6c:     	mov	x22, x0
100b5fd70:     	cmp	w0, #0x1
100b5fd74:     	ldr	w8, [sp, #0x8c]
100b5fd78:     	csinc	w8, w8, wzr, eq
100b5fd7c:     	tbz	w8, #0x0, 0x100b5fe84 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15b4>
100b5fd80:     	mov	x0, x24
100b5fd84:     	mov	x1, x26
100b5fd88:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b5fd8c:     	mov	x0, x24
100b5fd90:     	mov	x1, x25
100b5fd94:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b5fd98:     	mov	x0, x24
100b5fd9c:     	mov	x1, x23
100b5fda0:     	bl	0x1000b4b90 <__Z23CTX_wm_region_popup_setP8bContextP7ARegion>
100b5fda4:     	cmp	w22, #0x1
100b5fda8:     	cset	w8, eq
100b5fdac:     	csel	w9, wzr, w21, eq
100b5fdb0:     	cmp	w9, #0x1
100b5fdb4:     	b.ne	0x100b5feac <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15dc>
100b5fdb8:     	mov	w8, #0x0                ; =0
100b5fdbc:     	adrp	x10, 0x107ef7000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b5fdc0:     	strb	w9, [x10, #0x830]
100b5fdc4:     	b	0x100b5feac <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15dc>
100b5fdc8:     	str	wzr, [sp, #0x50]
100b5fdcc:     	ldr	x8, [sp, #0xb8]
100b5fdd0:     	ldr	x8, [x8, #0x128]
100b5fdd4:     	ldr	x8, [x8, #0x340]
100b5fdd8:     	ldr	x0, [x27, #0x20]
100b5fddc:     	cmp	x8, x0
100b5fde0:     	b.eq	0x100b5fde8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1518>
100b5fde4:     	bl	0x100b3f914 <__Z23WM_gizmomap_tag_refreshP10wmGizmoMap>
100b5fde8:     	mov	x0, x25
100b5fdec:     	mov	x1, x27
100b5fdf0:     	bl	0x100b40a34 <__Z33wm_gizmomap_handler_context_gizmoP8bContextP20wmEventHandler_Gizmo>
100b5fdf4:     	mov	x0, x25
100b5fdf8:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5fdfc:     	cbz	x0, 0x100b5fe1c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x154c>
100b5fe00:     	ldr	w8, [x0, #0xa8]
100b5fe04:     	ldp	w9, w10, [x20, #0x14]
100b5fe08:     	sub	w8, w9, w8
100b5fe0c:     	str	w8, [x20, #0x1c]
100b5fe10:     	ldr	w8, [x0, #0xb0]
100b5fe14:     	sub	w8, w10, w8
100b5fe18:     	b	0x100b5fe24 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1554>
100b5fe1c:     	mov	w8, #-0x1               ; =-1
100b5fe20:     	str	w8, [x20, #0x1c]
100b5fe24:     	mov	x1, x25
100b5fe28:     	str	w8, [x20, #0x20]
100b5fe2c:     	ldr	x8, [sp, #0x60]
100b5fe30:     	cbz	x8, 0x100b5fe48 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1578>
100b5fe34:     	mov	w8, #0x1                ; =1
100b5fe38:     	str	w8, [sp, #0x58]
100b5fe3c:     	mov	w22, #0x1               ; =1
100b5fe40:     	mov	x23, x28
100b5fe44:     	b	0x100b5ffac <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16dc>
100b5fe48:     	ldrh	w8, [x20, #0x10]
100b5fe4c:     	cmp	w8, #0x4
100b5fe50:     	csinc	w8, w22, wzr, ne
100b5fe54:     	tbnz	w8, #0x0, 0x100b5febc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15ec>
100b5fe58:     	cmp	w21, #0x5
100b5fe5c:     	b.eq	0x100b5febc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15ec>
100b5fe60:     	ldr	x0, [sp, #0x70]
100b5fe64:     	bl	0x100b3fc30 <__Z29wm_gizmomap_highlight_pendingPK10wmGizmoMap>
100b5fe68:     	mov	w22, #0x1               ; =1
100b5fe6c:     	mov	w8, #0x1                ; =1
100b5fe70:     	str	w8, [sp, #0x58]
100b5fe74:     	mov	x23, x28
100b5fe78:     	mov	x1, x25
100b5fe7c:     	cbnz	w0, 0x100b5fec8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x15f8>
100b5fe80:     	b	0x100b5ffac <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16dc>
100b5fe84:     	mov	x0, x24
100b5fe88:     	mov	x1, #0x0                ; =0
100b5fe8c:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b5fe90:     	mov	x0, x24
100b5fe94:     	mov	x1, #0x0                ; =0
100b5fe98:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b5fe9c:     	mov	x0, x24
100b5fea0:     	mov	x1, #0x0                ; =0
100b5fea4:     	bl	0x1000b4b90 <__Z23CTX_wm_region_popup_setP8bContextP7ARegion>
100b5fea8:     	mov	w8, #0x1                ; =1
100b5feac:     	ldr	w9, [sp, #0xc4]
100b5feb0:     	orr	w9, w8, w9
100b5feb4:     	str	w9, [sp, #0xc4]
100b5feb8:     	b	0x100b60454 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b84>
100b5febc:     	and	w8, w21, #0xffff
100b5fec0:     	cmp	w8, #0x5
100b5fec4:     	csinc	w22, w22, wzr, ne
100b5fec8:     	cmp	w21, #0x5
100b5fecc:     	cset	w8, ne
100b5fed0:     	str	w8, [sp, #0x58]
100b5fed4:     	mov	w8, #-0x1               ; =-1
100b5fed8:     	stur	w8, [x29, #-0xd0]
100b5fedc:     	sub	x3, x29, #0xd0
100b5fee0:     	ldr	x0, [sp, #0x70]
100b5fee4:     	mov	x2, x20
100b5fee8:     	bl	0x100b3fc44 <__Z26wm_gizmomap_highlight_findP10wmGizmoMapP8bContextPK7wmEventPi>
100b5feec:     	mov	x23, x0
100b5fef0:     	orr	x8, x28, x0
100b5fef4:     	cbz	x8, 0x100b5ff90 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16c0>
100b5fef8:     	cmp	x28, x23
100b5fefc:     	mov	x1, x25
100b5ff00:     	b.ne	0x100b5ff18 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1648>
100b5ff04:     	ldur	w8, [x29, #-0xd0]
100b5ff08:     	ldr	w9, [sp, #0x50]
100b5ff0c:     	mov	x3, x9
100b5ff10:     	cmp	w9, w8
100b5ff14:     	b.eq	0x100b5ff34 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1664>
100b5ff18:     	mov	x0, x1
100b5ff1c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5ff20:     	mov	x1, x0
100b5ff24:     	mov	x0, x25
100b5ff28:     	bl	0x100b94b5c <__Z16WM_tooltip_clearP8bContextP8wmWindow>
100b5ff2c:     	ldur	w3, [x29, #-0xd0]
100b5ff30:     	mov	x1, x25
100b5ff34:     	ldr	x0, [sp, #0x70]
100b5ff38:     	mov	x2, x23
100b5ff3c:     	bl	0x100b40580 <__Z25wm_gizmomap_highlight_setP10wmGizmoMapPK8bContextP7wmGizmoi>
100b5ff40:     	cmp	x23, #0x0
100b5ff44:     	eor	w8, w0, #0x1
100b5ff48:     	csinc	w8, w8, wzr, ne
100b5ff4c:     	tbnz	w8, #0x0, 0x100b5ffa4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16d4>
100b5ff50:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b5ff54:     	add	x8, x8, #0xe08
100b5ff58:     	ldrb	w8, [x8, #0x9]
100b5ff5c:     	tbz	w8, #0x3, 0x100b5ffa4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16d4>
100b5ff60:     	ldrb	w8, [x23, #0x49]
100b5ff64:     	tbnz	w8, #0x4, 0x100b5ffa4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16d4>
100b5ff68:     	mov	x0, x25
100b5ff6c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5ff70:     	mov	x1, x0
100b5ff74:     	mov	x0, x25
100b5ff78:     	ldr	x2, [sp, #0x68]
100b5ff7c:     	ldr	x3, [sp, #0xb8]
100b5ff80:     	adrp	x4, 0x100b40000 <__Z26wm_gizmomap_highlight_findP10wmGizmoMapP8bContextPK7wmEventPi+0x3bc>
100b5ff84:     	add	x4, x4, #0xb40
100b5ff88:     	bl	0x100b94b54 <__Z21WM_tooltip_timer_initP8bContextP8wmWindowP7ScrAreaP7ARegionPFS6_S0_S6_PiPdPbE>
100b5ff8c:     	b	0x100b5ffa4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x16d4>
100b5ff90:     	ldur	w3, [x29, #-0xd0]
100b5ff94:     	ldr	x0, [sp, #0x70]
100b5ff98:     	mov	x1, x25
100b5ff9c:     	mov	x2, #0x0                ; =0
100b5ffa0:     	bl	0x100b40580 <__Z25wm_gizmomap_highlight_setP10wmGizmoMapPK8bContextP7wmGizmoi>
100b5ffa4:     	ldr	x0, [sp, #0x70]
100b5ffa8:     	bl	0x100b3fc38 <__Z29wm_gizmomap_highlight_handledP10wmGizmoMap>
100b5ffac:     	cbz	x23, 0x100b6001c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x174c>
100b5ffb0:     	ldr	w24, [x23, #0x48]
100b5ffb4:     	ubfx	w21, w24, #11, #1
100b5ffb8:     	cbz	w22, 0x100b6002c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x175c>
100b5ffbc:     	tbnz	w24, #0x5, 0x100b60034 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1764>
100b5ffc0:     	sturb	wzr, [x29, #-0xd0]
100b5ffc4:     	ldp	x26, x1, [x23, #0x28]
100b5ffc8:     	cbnz	x1, 0x100b5ffd4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1704>
100b5ffcc:     	ldr	x8, [x26, #0x10]
100b5ffd0:     	ldr	x1, [x8, #0xc8]
100b5ffd4:     	ldr	x0, [sp, #0x90]
100b5ffd8:     	bl	0x100b77728 <__Z16WM_keymap_activePK15wmWindowManagerP8wmKeyMap>
100b5ffdc:     	mov	x22, x0
100b5ffe0:     	sub	x7, x29, #0xd0
100b5ffe4:     	mov	x0, x25
100b5ffe8:     	mov	x1, x20
100b5ffec:     	ldr	x2, [sp, #0x80]
100b5fff0:     	mov	x3, x27
100b5fff4:     	mov	x4, x26
100b5fff8:     	mov	x5, x22
100b5fffc:     	ldr	w6, [sp, #0x9c]
100b60000:     	bl	0x100b60d90 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb>
100b60004:     	mov	x26, x0
100b60008:     	and	w8, w24, #0x800
100b6000c:     	bfxil	w8, w0, #0, #1
100b60010:     	cbz	w8, 0x100b60064 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1794>
100b60014:     	tbz	w26, #0x0, 0x100b6036c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a9c>
100b60018:     	b	0x100b603e0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b10>
100b6001c:     	mov	w21, #0x0               ; =0
100b60020:     	mov	w26, #0x0               ; =0
100b60024:     	tbnz	w22, #0x0, 0x100b6036c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a9c>
100b60028:     	b	0x100b603e0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b10>
100b6002c:     	mov	w26, #0x0               ; =0
100b60030:     	b	0x100b603e0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b10>
100b60034:     	mov	w26, #0x0               ; =0
100b60038:     	b	0x100b6036c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a9c>
100b6003c:     	ldrsh	w3, [x20, #0x12]
100b60040:     	mov	x0, x24
100b60044:     	mov	x1, x28
100b60048:     	mov	x2, x27
100b6004c:     	bl	0x100b58110 <__ZL24wm_handler_fileselect_doP8bContextP8ListBaseP17wmEventHandler_Opi>
100b60050:     	b	0x100b5efac <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x6dc>
100b60054:     	ldrh	w10, [x20, #0x12]
100b60058:     	cmp	w10, #0x4
100b6005c:     	b.ne	0x100b5ed78 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x4a8>
100b60060:     	b	0x100b5edc0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x4f0>
100b60064:     	ldurb	w8, [x29, #-0xd0]
100b60068:     	cmp	w8, #0x1
100b6006c:     	b.ne	0x100b60368 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a98>
100b60070:     	ldrh	w8, [x20, #0x12]
100b60074:     	cmp	w8, #0x1
100b60078:     	b.ne	0x100b60368 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a98>
100b6007c:     	ldrh	w23, [x20, #0x10]
100b60080:     	sub	w8, w23, #0x1
100b60084:     	cmp	w8, #0x2
100b60088:     	b.hi	0x100b60368 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a98>
100b6008c:     	ldr	x22, [x22, #0x10]
100b60090:     	cbz	x22, 0x100b60368 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a98>
100b60094:     	ldrb	w21, [x20, #0x2b]
100b60098:     	ldrh	w10, [x20, #0x2c]
100b6009c:     	ldr	w24, [x20, #0x7c]
100b600a0:     	ldrb	w8, [x20, #0x2a]
100b600a4:     	ubfx	w11, w8, #1, #1
100b600a8:     	ubfx	w9, w8, #2, #1
100b600ac:     	stp	w9, w11, [sp, #0x30]
100b600b0:     	ldr	w9, [x20, #0x30]
100b600b4:     	str	w9, [sp, #0x40]
100b600b8:     	and	w9, w8, #0x1
100b600bc:     	str	w9, [sp, #0x4c]
100b600c0:     	and	w9, w23, #0xff
100b600c4:     	str	w9, [sp, #0x38]
100b600c8:     	ubfx	w9, w8, #3, #1
100b600cc:     	str	w9, [sp, #0x2c]
100b600d0:     	ubfx	w8, w8, #4, #1
100b600d4:     	stp	w10, w8, [sp, #0x24]
100b600d8:     	b	0x100b600e4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1814>
100b600dc:     	ldr	x22, [x22]
100b600e0:     	cbz	x22, 0x100b60564 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c94>
100b600e4:     	ldrb	w8, [x22, #0xac]
100b600e8:     	tbnz	w8, #0x0, 0x100b600dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x180c>
100b600ec:     	tbz	w24, #0x1, 0x100b60140 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1870>
100b600f0:     	tbz	w8, #0x4, 0x100b60140 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1870>
100b600f4:     	ldrb	w8, [x22, #0xac]
100b600f8:     	tbnz	w8, #0x0, 0x100b600dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x180c>
100b600fc:     	tbz	w24, #0x1, 0x100b60104 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1834>
100b60100:     	tbnz	w8, #0x4, 0x100b600dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x180c>
100b60104:     	ldrsh	w0, [x22, #0x9a]
100b60108:     	bl	0x100b4d62c <__Z20WM_userdef_event_mapi>
100b6010c:     	cmn	w0, #0x1
100b60110:     	b.eq	0x100b60248 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1978>
100b60114:     	and	w8, w0, #0xfffffffe
100b60118:     	cmp	w8, #0x1a
100b6011c:     	b.ne	0x100b60240 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1970>
100b60120:     	cmp	w23, #0x1
100b60124:     	b.ne	0x100b600dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x180c>
100b60128:     	cmp	w0, #0x1a
100b6012c:     	b.ne	0x100b60358 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a88>
100b60130:     	ldr	w8, [sp, #0x40]
100b60134:     	cmp	w8, #0x1
100b60138:     	b.ne	0x100b600dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x180c>
100b6013c:     	b	0x100b60248 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1978>
100b60140:     	ldrsh	w0, [x22, #0x9a]
100b60144:     	bl	0x100b4d62c <__Z20WM_userdef_event_mapi>
100b60148:     	cmn	w0, #0x1
100b6014c:     	b.eq	0x100b60184 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x18b4>
100b60150:     	and	w8, w0, #0xfffffffe
100b60154:     	cmp	w8, #0x1a
100b60158:     	b.ne	0x100b6017c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x18ac>
100b6015c:     	cmp	w23, #0x1
100b60160:     	b.ne	0x100b600f4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1824>
100b60164:     	cmp	w0, #0x1a
100b60168:     	b.ne	0x100b60348 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a78>
100b6016c:     	ldr	w8, [sp, #0x40]
100b60170:     	cmp	w8, #0x1
100b60174:     	b.ne	0x100b600f4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1824>
100b60178:     	b	0x100b60184 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x18b4>
100b6017c:     	cmp	w0, w23
100b60180:     	b.ne	0x100b600f4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1824>
100b60184:     	ldrb	w8, [x22, #0x9c]
100b60188:     	cmp	w8, #0xff
100b6018c:     	b.eq	0x100b60198 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x18c8>
100b60190:     	cmp	w8, #0x3
100b60194:     	b.ne	0x100b600f4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1824>
100b60198:     	ldrb	w8, [x22, #0x9e]
100b6019c:     	cmp	w8, #0xff
100b601a0:     	b.eq	0x100b601b0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x18e0>
100b601a4:     	ldr	w9, [sp, #0x4c]
100b601a8:     	cmp	w9, w8
100b601ac:     	b.ne	0x100b600f4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1824>
100b601b0:     	ldrb	w8, [x22, #0x9f]
100b601b4:     	cmp	w8, #0xff
100b601b8:     	b.eq	0x100b601e0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1910>
100b601bc:     	ldr	w9, [sp, #0x34]
100b601c0:     	cmp	w9, w8
100b601c4:     	b.eq	0x100b601e0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1910>
100b601c8:     	ldr	w8, [sp, #0x38]
100b601cc:     	cmp	w8, #0xd7
100b601d0:     	b.eq	0x100b601e0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1910>
100b601d4:     	ldr	w8, [sp, #0x38]
100b601d8:     	cmp	w8, #0xd4
100b601dc:     	b.ne	0x100b600f4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1824>
100b601e0:     	ldrb	w8, [x22, #0xa0]
100b601e4:     	cmp	w8, #0xff
100b601e8:     	b.eq	0x100b601f8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1928>
100b601ec:     	ldr	w9, [sp, #0x30]
100b601f0:     	cmp	w9, w8
100b601f4:     	b.ne	0x100b600f4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1824>
100b601f8:     	ldrb	w8, [x22, #0xa1]
100b601fc:     	cmp	w8, #0xff
100b60200:     	b.eq	0x100b60210 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1940>
100b60204:     	ldr	w9, [sp, #0x2c]
100b60208:     	cmp	w9, w8
100b6020c:     	b.ne	0x100b600f4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1824>
100b60210:     	ldrb	w8, [x22, #0xa2]
100b60214:     	cmp	w8, #0xff
100b60218:     	b.eq	0x100b60228 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1958>
100b6021c:     	ldr	w9, [sp, #0x28]
100b60220:     	cmp	w9, w8
100b60224:     	b.ne	0x100b600f4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1824>
100b60228:     	ldrh	w8, [x22, #0xaa]
100b6022c:     	cbz	w8, 0x100b60314 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a44>
100b60230:     	ldr	w9, [sp, #0x24]
100b60234:     	cmp	w9, w8
100b60238:     	b.ne	0x100b600f4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1824>
100b6023c:     	b	0x100b60314 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a44>
100b60240:     	cmp	w0, w23
100b60244:     	b.ne	0x100b600dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x180c>
100b60248:     	ldrb	w8, [x22, #0x9c]
100b6024c:     	cmp	w8, #0xff
100b60250:     	b.eq	0x100b60270 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x19a0>
100b60254:     	cmp	w8, #0x5
100b60258:     	b.ne	0x100b600dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x180c>
100b6025c:     	ldrb	w8, [x22, #0x9d]
100b60260:     	cmp	w8, #0xff
100b60264:     	b.eq	0x100b60270 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x19a0>
100b60268:     	cmp	w8, w21
100b6026c:     	b.ne	0x100b600dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x180c>
100b60270:     	ldrb	w8, [x22, #0x9e]
100b60274:     	cmp	w8, #0xff
100b60278:     	b.eq	0x100b60288 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x19b8>
100b6027c:     	ldr	w9, [sp, #0x4c]
100b60280:     	cmp	w9, w8
100b60284:     	b.ne	0x100b600dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x180c>
100b60288:     	ldrb	w8, [x22, #0x9f]
100b6028c:     	cmp	w8, #0xff
100b60290:     	b.eq	0x100b602b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x19e8>
100b60294:     	ldr	w9, [sp, #0x34]
100b60298:     	cmp	w9, w8
100b6029c:     	b.eq	0x100b602b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x19e8>
100b602a0:     	ldr	w8, [sp, #0x38]
100b602a4:     	cmp	w8, #0xd7
100b602a8:     	b.eq	0x100b602b8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x19e8>
100b602ac:     	ldr	w8, [sp, #0x38]
100b602b0:     	cmp	w8, #0xd4
100b602b4:     	b.ne	0x100b600dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x180c>
100b602b8:     	ldrb	w8, [x22, #0xa0]
100b602bc:     	cmp	w8, #0xff
100b602c0:     	b.eq	0x100b602d0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a00>
100b602c4:     	ldr	w9, [sp, #0x30]
100b602c8:     	cmp	w9, w8
100b602cc:     	b.ne	0x100b600dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x180c>
100b602d0:     	ldrb	w8, [x22, #0xa1]
100b602d4:     	cmp	w8, #0xff
100b602d8:     	b.eq	0x100b602e8 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a18>
100b602dc:     	ldr	w9, [sp, #0x2c]
100b602e0:     	cmp	w9, w8
100b602e4:     	b.ne	0x100b600dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x180c>
100b602e8:     	ldrb	w8, [x22, #0xa2]
100b602ec:     	cmp	w8, #0xff
100b602f0:     	b.eq	0x100b60300 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a30>
100b602f4:     	ldr	w9, [sp, #0x28]
100b602f8:     	cmp	w9, w8
100b602fc:     	b.ne	0x100b600dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x180c>
100b60300:     	ldrh	w8, [x22, #0xaa]
100b60304:     	cbz	w8, 0x100b60314 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1a44>
100b60308:     	ldr	w9, [sp, #0x24]
100b6030c:     	cmp	w9, w8
100b60310:     	b.ne	0x100b600dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x180c>
100b60314:     	add	x0, x22, #0x10
100b60318:     	mov	w1, #0x0                ; =0
100b6031c:     	bl	0x100b7dbcc <__Z20WM_operatortype_findPKcb>
100b60320:     	mov	x1, x0
100b60324:     	mov	x0, x25
100b60328:     	mov	x2, #0x0                ; =0
100b6032c:     	mov	x3, #0x0                ; =0
100b60330:     	mov	w4, #0x0                ; =0
100b60334:     	mov	w5, #0x1                ; =1
100b60338:     	mov	x6, #0x0                ; =0
100b6033c:     	bl	0x100b4ebdc <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent>
100b60340:     	cbz	w0, 0x100b600dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x180c>
100b60344:     	b	0x100b60584 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1cb4>
100b60348:     	ldr	w8, [sp, #0x40]
100b6034c:     	cmp	w8, #0x2
100b60350:     	b.ne	0x100b600f4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1824>
100b60354:     	b	0x100b60184 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x18b4>
100b60358:     	ldr	w8, [sp, #0x40]
100b6035c:     	cmp	w8, #0x2
100b60360:     	b.eq	0x100b60248 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1978>
100b60364:     	b	0x100b600dc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x180c>
100b60368:     	mov	w21, #0x0               ; =0
100b6036c:     	ldr	x0, [sp, #0x70]
100b60370:     	bl	0x100b3f850 <__Z27WM_gizmomap_is_any_selectedPK10wmGizmoMap>
100b60374:     	cbz	w0, 0x100b603e0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b10>
100b60378:     	ldr	x0, [sp, #0x70]
100b6037c:     	bl	0x100b3f848 <__Z22WM_gizmomap_group_listP10wmGizmoMap>
100b60380:     	ldr	x23, [x0]
100b60384:     	cbz	x23, 0x100b603e0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b10>
100b60388:     	mov	x22, x25
100b6038c:     	b	0x100b60398 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1ac8>
100b60390:     	ldr	x23, [x23]
100b60394:     	cbz	x23, 0x100b603e0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b10>
100b60398:     	mov	x0, x23
100b6039c:     	bl	0x100b3d0f4 <__Z29wm_gizmogroup_is_any_selectedPK12wmGizmoGroup>
100b603a0:     	cbz	w0, 0x100b60390 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1ac0>
100b603a4:     	ldr	x8, [x23, #0x10]
100b603a8:     	ldr	x1, [x8, #0xc8]
100b603ac:     	ldr	x0, [sp, #0x90]
100b603b0:     	bl	0x100b77728 <__Z16WM_keymap_activePK15wmWindowManagerP8wmKeyMap>
100b603b4:     	mov	x5, x0
100b603b8:     	mov	x0, x22
100b603bc:     	mov	x1, x20
100b603c0:     	ldr	x2, [sp, #0x80]
100b603c4:     	mov	x3, x27
100b603c8:     	mov	x4, x23
100b603cc:     	ldr	w6, [sp, #0x9c]
100b603d0:     	mov	x7, #0x0                ; =0
100b603d4:     	bl	0x100b60d90 <__ZL40wm_handlers_do_keymap_with_gizmo_handlerP8bContextP7wmEventP8ListBaseP20wmEventHandler_GizmoP12wmGizmoGroupP8wmKeyMapbPb>
100b603d8:     	orr	w26, w0, w26
100b603dc:     	tbz	w26, #0x0, 0x100b60390 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1ac0>
100b603e0:     	ldr	w8, [sp, #0x58]
100b603e4:     	tbnz	w8, #0x0, 0x100b60414 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b44>
100b603e8:     	ldr	x0, [sp, #0x70]
100b603ec:     	bl	0x100b40578 <__Z21wm_gizmomap_modal_getP10wmGizmoMap>
100b603f0:     	cbz	x0, 0x100b60400 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b30>
100b603f4:     	ldr	x8, [sp, #0x60]
100b603f8:     	cmp	x0, x8
100b603fc:     	b.ne	0x100b60414 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1b44>
100b60400:     	ldr	x0, [sp, #0x70]
100b60404:     	mov	x1, x25
100b60408:     	mov	x2, x28
100b6040c:     	ldr	w3, [sp, #0x50]
100b60410:     	bl	0x100b40580 <__Z25wm_gizmomap_highlight_setP10wmGizmoMapPK8bContextP7wmGizmoi>
100b60414:     	mov	x0, x25
100b60418:     	ldr	x1, [sp, #0x68]
100b6041c:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b60420:     	cmp	w26, #0x0
100b60424:     	cset	w8, eq
100b60428:     	tst	w21, w8
100b6042c:     	mov	w8, #0x5                ; =5
100b60430:     	csel	w22, w8, w26, ne
100b60434:     	mov	x0, x25
100b60438:     	ldr	x1, [sp, #0xb8]
100b6043c:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b60440:     	mov	x24, x25
100b60444:     	ldr	x28, [sp, #0x80]
100b60448:     	ldr	w8, [sp, #0xc4]
100b6044c:     	orr	w8, w22, w8
100b60450:     	str	w8, [sp, #0xc4]
100b60454:     	ldr	w9, [sp, #0xc4]
100b60458:     	ldr	w8, [sp, #0x8c]
100b6045c:     	and	w8, w9, w8
100b60460:     	tbz	w8, #0x0, 0x100b60470 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1ba0>
100b60464:     	and	w9, w9, #0x6
100b60468:     	str	w9, [sp, #0xc4]
100b6046c:     	b	0x100b60474 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1ba4>
100b60470:     	tbnz	w9, #0x0, 0x100b60594 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1cc4>
100b60474:     	mov	x0, x24
100b60478:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b6047c:     	cbz	x0, 0x100b605d0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1d00>
100b60480:     	mov	x0, x28
100b60484:     	mov	x1, x27
100b60488:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b6048c:     	cmn	w0, #0x1
100b60490:     	b.eq	0x100b5eba0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2d0>
100b60494:     	ldrb	w8, [x27, #0x14]
100b60498:     	tbz	w8, #0x7, 0x100b5eba0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2d0>
100b6049c:     	mov	x0, x28
100b604a0:     	mov	x1, x27
100b604a4:     	bl	0x10078fea0 <__Z11BLI_remlinkP8ListBasePv>
100b604a8:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b604ac:     	add	x8, x8, #0x710
100b604b0:     	ldr	x8, [x8]
100b604b4:     	mov	x0, x27
100b604b8:     	mov	w1, #0x0                ; =0
100b604bc:     	blr	x8
100b604c0:     	b	0x100b5eba0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x2d0>
100b604c4:     	ldr	x21, [x27, #0x48]
100b604c8:     	cbz	x21, 0x100b5f02c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x75c>
100b604cc:     	add	x0, x21, #0x10
100b604d0:     	adrp	x1, 0x104bd4000 <__ZL3hex+0x3a0d>
100b604d4:     	add	x1, x1, #0xc71
100b604d8:     	bl	0x104b7779c <_zlibVersion+0x104b7779c>
100b604dc:     	cbnz	w0, 0x100b5f02c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x75c>
100b604e0:     	ldr	x8, [x21, #0xe0]
100b604e4:     	cbz	x8, 0x100b5f02c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x75c>
100b604e8:     	mov	x0, x24
100b604ec:     	bl	0x101655244 <__Z20ED_operator_editmeshP8bContext>
100b604f0:     	cbz	w0, 0x100b5f02c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x75c>
100b604f4:     	ldr	x8, [x27, #0x38]
100b604f8:     	adrp	x9, 0x100b59000 <__Z29WM_event_consecutive_data_setP8wmWindowPKcPv+0x38>
100b604fc:     	add	x9, x9, #0x8ec
100b60500:     	cmp	x8, x9
100b60504:     	b.eq	0x100b60518 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c48>
100b60508:     	adrp	x9, 0x100b59000 <__Z29WM_event_consecutive_data_setP8wmWindowPKcPv+0x38>
100b6050c:     	add	x9, x9, #0xb00
100b60510:     	cmp	x8, x9
100b60514:     	b.ne	0x100b5f02c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x75c>
100b60518:     	ldr	w8, [sp, #0xe8]
100b6051c:     	cmp	w8, #0x1
100b60520:     	b.le	0x100b5f030 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x760>
100b60524:     	ldr	x9, [x27, #0x48]
100b60528:     	ldr	x22, [x9, #0xe0]
100b6052c:     	lsl	x23, x8, #3
100b60530:     	mov	w21, #0x8               ; =8
100b60534:     	mov	x25, x24
100b60538:     	add	x8, sp, #0xd0
100b6053c:     	ldr	x24, [x8, x21]
100b60540:     	add	x0, x24, #0x30
100b60544:     	add	x1, x22, #0x4
100b60548:     	bl	0x104b7779c <_zlibVersion+0x104b7779c>
100b6054c:     	cbz	w0, 0x100b6056c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c9c>
100b60550:     	add	x21, x21, #0x8
100b60554:     	cmp	x23, x21
100b60558:     	mov	x24, x25
100b6055c:     	b.ne	0x100b60534 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1c64>
100b60560:     	b	0x100b5f02c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x75c>
100b60564:     	mov	w21, #0x0               ; =0
100b60568:     	b	0x100b60014 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1744>
100b6056c:     	ldr	x8, [sp, #0xd0]
100b60570:     	str	x24, [sp, #0xd0]
100b60574:     	add	x9, sp, #0xd0
100b60578:     	str	x8, [x9, x21]
100b6057c:     	mov	x24, x25
100b60580:     	b	0x100b5f02c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x75c>
100b60584:     	mov	w21, #0x1               ; =1
100b60588:     	b	0x100b60014 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1744>
100b6058c:     	str	wzr, [sp, #0xc4]
100b60590:     	b	0x100b605d0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1d00>
100b60594:     	ldr	w10, [sp, #0xc4]
100b60598:     	cmp	w10, #0x5
100b6059c:     	b.ne	0x100b605bc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1cec>
100b605a0:     	mov	x0, x24
100b605a4:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b605a8:     	mov	x1, x20
100b605ac:     	bl	0x100b448a4 <__Z20wm_cursor_arrow_moveP8wmWindowPK7wmEvent>
100b605b0:     	mov	w10, #0x5               ; =5
100b605b4:     	b	0x100b605bc <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1cec>
100b605b8:     	mov	w10, #0x0               ; =0
100b605bc:     	orr	w8, w10, #0x3
100b605c0:     	ldr	w9, [sp, #0xb4]
100b605c4:     	cmp	w9, #0x0
100b605c8:     	csel	w10, w8, w10, ne
100b605cc:     	str	w10, [sp, #0xc4]
100b605d0:     	ldp	q0, q1, [sp, #0x190]
100b605d4:     	stp	q0, q1, [x19, #0xa0]
100b605d8:     	ldrb	w8, [sp, #0x1b0]
100b605dc:     	strb	w8, [x19, #0xc0]
100b605e0:     	ldp	q0, q1, [sp, #0x150]
100b605e4:     	stp	q0, q1, [x19, #0x60]
100b605e8:     	ldp	q1, q0, [sp, #0x170]
100b605ec:     	stp	q1, q0, [x19, #0x80]
100b605f0:     	ldp	q0, q1, [sp, #0x110]
100b605f4:     	stp	q0, q1, [x19, #0x20]
100b605f8:     	ldp	q1, q0, [sp, #0x130]
100b605fc:     	stp	q1, q0, [x19, #0x40]
100b60600:     	ldp	q1, q0, [sp, #0xf0]
100b60604:     	stp	q1, q0, [x19]
100b60608:     	adrp	x8, 0x106369000 <_zlibVersion+0x106369000>
100b6060c:     	ldr	x8, [x8, #0x7f8]
100b60610:     	ldr	x8, [x8]
100b60614:     	ldur	x9, [x29, #-0x60]
100b60618:     	cmp	x8, x9
100b6061c:     	b.ne	0x100b60644 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1d74>
100b60620:     	ldr	w0, [sp, #0xc4]
100b60624:     	add	sp, sp, #0x2e0
100b60628:     	ldp	x29, x30, [sp, #0x50]
100b6062c:     	ldp	x20, x19, [sp, #0x40]
100b60630:     	ldp	x22, x21, [sp, #0x30]
100b60634:     	ldp	x24, x23, [sp, #0x20]
100b60638:     	ldp	x26, x25, [sp, #0x10]
100b6063c:     	ldp	x28, x27, [sp], #0x60
100b60640:     	ret
100b60644:     	bl	0x104b75f0c <_zlibVersion+0x104b75f0c>
100b60648:     	add	x0, sp, #0x1f0
100b6064c:     	bl	0x100023e44 <__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne190102Ev>
100b60650:     	brk	#0x1
100b60654:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b60658:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b6065c:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b60660:     	mov	x20, x0
100b60664:     	b	0x100b6070c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e3c>
100b60668:     	mov	x20, x0
100b6066c:     	b	0x100b6070c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e3c>
100b60670:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b60674:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b60678:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b6067c:     	mov	x20, x0
100b60680:     	b	0x100b6070c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e3c>
100b60684:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b60688:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b6068c:     	mov	x20, x0
100b60690:     	b	0x100b6070c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e3c>
100b60694:     	mov	x20, x0
100b60698:     	b	0x100b6070c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e3c>
100b6069c:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b606a0:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b606a4:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b606a8:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b606ac:     	mov	x20, x0
100b606b0:     	ldrsb	w8, [sp, #0x207]
100b606b4:     	tbz	w8, #0x1f, 0x100b606c0 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1df0>
100b606b8:     	ldr	x0, [sp, #0x1f0]
100b606bc:     	bl	0x104b75d68 <_zlibVersion+0x104b75d68>
100b606c0:     	ldurb	w8, [x29, #-0xb8]
100b606c4:     	cmp	w8, #0x1
100b606c8:     	b.ne	0x100b606e4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e14>
100b606cc:     	ldursb	w8, [x29, #-0xb9]
100b606d0:     	tbz	w8, #0x1f, 0x100b606e4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e14>
100b606d4:     	ldur	x0, [x29, #-0xd0]
100b606d8:     	bl	0x104b75d68 <_zlibVersion+0x104b75d68>
100b606dc:     	b	0x100b606e4 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e14>
100b606e0:     	mov	x20, x0
100b606e4:     	ldrsb	w8, [sp, #0x1cf]
100b606e8:     	tbz	w8, #0x1f, 0x100b60750 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e80>
100b606ec:     	ldr	x0, [sp, #0x1b8]
100b606f0:     	bl	0x104b75d68 <_zlibVersion+0x104b75d68>
100b606f4:     	b	0x100b60750 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e80>
100b606f8:     	mov	x20, x0
100b606fc:     	ldrsb	w8, [sp, #0x1e7]
100b60700:     	tbz	w8, #0x1f, 0x100b6070c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e3c>
100b60704:     	ldr	x0, [sp, #0x1d0]
100b60708:     	bl	0x104b75d68 <_zlibVersion+0x104b75d68>
100b6070c:     	ldrb	w8, [sp, #0x208]
100b60710:     	cmp	w8, #0x1
100b60714:     	b.ne	0x100b60750 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e80>
100b60718:     	ldrsb	w8, [sp, #0x207]
100b6071c:     	tbz	w8, #0x1f, 0x100b60750 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e80>
100b60720:     	ldr	x0, [sp, #0x1f0]
100b60724:     	bl	0x104b75d68 <_zlibVersion+0x104b75d68>
100b60728:     	b	0x100b60750 <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e80>
100b6072c:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b60730:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b60734:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b60738:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b6073c:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b60740:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b60744:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b60748:     	b	0x100b6074c <__ZL21wm_handlers_do_internP8bContextP8wmWindowP7wmEventP8ListBase+0x1e7c>
100b6074c:     	mov	x20, x0
100b60750:     	ldp	q0, q1, [sp, #0x190]
100b60754:     	stp	q0, q1, [x19, #0xa0]
100b60758:     	ldrb	w8, [sp, #0x1b0]
100b6075c:     	strb	w8, [x19, #0xc0]
100b60760:     	ldp	q0, q1, [sp, #0x150]
100b60764:     	stp	q0, q1, [x19, #0x60]
100b60768:     	ldp	q1, q0, [sp, #0x170]
100b6076c:     	stp	q1, q0, [x19, #0x80]
100b60770:     	ldp	q0, q1, [sp, #0x110]
100b60774:     	stp	q0, q1, [x19, #0x20]
100b60778:     	ldp	q1, q0, [sp, #0x130]
100b6077c:     	stp	q1, q0, [x19, #0x40]
100b60780:     	ldp	q1, q0, [sp, #0xf0]
100b60784:     	stp	q1, q0, [x19]
100b60788:     	mov	x0, x20
100b6078c:     	bl	0x104b737dc <_zlibVersion+0x104b737dc>
