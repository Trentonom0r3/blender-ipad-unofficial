
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010a9dd0 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]>:
1010a9dd0:     	sub	sp, sp, #0x190
1010a9dd4:     	stp	d15, d14, [sp, #0xf0]
1010a9dd8:     	stp	d13, d12, [sp, #0x100]
1010a9ddc:     	stp	d11, d10, [sp, #0x110]
1010a9de0:     	stp	d9, d8, [sp, #0x120]
1010a9de4:     	stp	x28, x27, [sp, #0x130]
1010a9de8:     	stp	x26, x25, [sp, #0x140]
1010a9dec:     	stp	x24, x23, [sp, #0x150]
1010a9df0:     	stp	x22, x21, [sp, #0x160]
1010a9df4:     	stp	x20, x19, [sp, #0x170]
1010a9df8:     	stp	x29, x30, [sp, #0x180]
1010a9dfc:     	add	x29, sp, #0x180
1010a9e00:     	str	x3, [sp]
1010a9e04:     	mov	x9, x2
1010a9e08:     	mov	x21, x0
1010a9e0c:     	adrp	x8, 0x106369000 <_zlibVersion+0x106369000>
1010a9e10:     	ldr	x8, [x8, #0x7f8]
1010a9e14:     	ldr	x8, [x8]
1010a9e18:     	stur	x8, [x29, #-0xa0]
1010a9e1c:     	movi.16b	v0, #0x0
1010a9e20:     	stp	q0, q0, [sp, #0x20]
1010a9e24:     	stp	q0, q0, [sp, #0x40]
1010a9e28:     	add	x2, sp, #0x20
1010a9e2c:     	add	x3, sp, #0x60
1010a9e30:     	str	x9, [sp, #0x8]
1010a9e34:     	mov	x0, x9
1010a9e38:     	mov	w4, #0x10               ; =16
1010a9e3c:     	bl	0x104b77d40 <_objc_msgSend$countByEnumeratingWithState:objects:count:>
1010a9e40:     	cbz	x0, 0x1010aa0e4 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0x314>
1010a9e44:     	mov	x22, x0
1010a9e48:     	ldr	x8, [sp, #0x30]
1010a9e4c:     	ldr	x25, [x8]
1010a9e50:     	adrp	x26, 0x106627000 <_zlibVersion+0x106627000>
1010a9e54:     	fmov	d11, #1.00000000
1010a9e58:     	fmov	d12, xzr
1010a9e5c:     	b	0x1010a9e7c <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0xac>
1010a9e60:     	add	x2, sp, #0x20
1010a9e64:     	add	x3, sp, #0x60
1010a9e68:     	ldr	x0, [sp, #0x8]
1010a9e6c:     	mov	w4, #0x10               ; =16
1010a9e70:     	bl	0x104b77d40 <_objc_msgSend$countByEnumeratingWithState:objects:count:>
1010a9e74:     	mov	x22, x0
1010a9e78:     	cbz	x0, 0x1010aa0e4 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0x314>
1010a9e7c:     	mov	x19, #0x0               ; =0
1010a9e80:     	b	0x1010a9ea0 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0xd0>
1010a9e84:     	strb	w8, [x9, #0x30]
1010a9e88:     	stp	s1, s3, [x9, #0x34]
1010a9e8c:     	str	s2, [x9, #0x3c]
1010a9e90:     	strb	w27, [x9, #0x40]
1010a9e94:     	add	x19, x19, #0x1
1010a9e98:     	cmp	x22, x19
1010a9e9c:     	b.eq	0x1010a9e60 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0x90>
1010a9ea0:     	ldr	x8, [sp, #0x30]
1010a9ea4:     	ldr	x8, [x8]
1010a9ea8:     	cmp	x8, x25
1010a9eac:     	b.eq	0x1010a9eb8 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0xe8>
1010a9eb0:     	ldr	x0, [sp, #0x8]
1010a9eb4:     	bl	0x104b761bc <_zlibVersion+0x104b761bc>
1010a9eb8:     	ldr	x8, [sp, #0x28]
1010a9ebc:     	ldr	x23, [x8, x19, lsl #3]
1010a9ec0:     	ldrsw	x28, [x26, #0xf5c]
1010a9ec4:     	mov	x0, x21
1010a9ec8:     	bl	0x104b7c2c0 <_objc_msgSend$view>
1010a9ecc:     	fmov	s13, wzr
1010a9ed0:     	cbz	x23, 0x1010a9f74 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0x1a4>
1010a9ed4:     	mov	x24, x0
1010a9ed8:     	mov	x0, x23
1010a9edc:     	bl	0x104b7c180 <_objc_msgSend$type>
1010a9ee0:     	mov	w27, #0x0               ; =0
1010a9ee4:     	cbz	x24, 0x1010a9f88 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0x1b8>
1010a9ee8:     	cmp	x0, #0x2
1010a9eec:     	b.ne	0x1010a9f88 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0x1b8>
1010a9ef0:     	mov	x0, x23
1010a9ef4:     	bl	0x104b784a0 <_objc_msgSend$force>
1010a9ef8:     	fmov	d8, d0
1010a9efc:     	fmov	x27, d8
1010a9f00:     	mov	x0, x23
1010a9f04:     	bl	0x104b79060 <_objc_msgSend$maximumPossibleForce>
1010a9f08:     	fmov	d10, d0
1010a9f0c:     	fmov	x20, d10
1010a9f10:     	mov	x0, x23
1010a9f14:     	mov	x2, x24
1010a9f18:     	bl	0x104b774e0 <_objc_msgSend$azimuthAngleInView:>
1010a9f1c:     	fmov	d9, d0
1010a9f20:     	fmov	x24, d9
1010a9f24:     	mov	x0, x23
1010a9f28:     	bl	0x104b773a0 <_objc_msgSend$altitudeAngle>
1010a9f2c:     	fmov	x8, d0
1010a9f30:     	and	x9, x27, #0x7fffffffffffffff
1010a9f34:     	and	x10, x20, #0x7fffffffffffffff
1010a9f38:     	mov	x12, #0x7ff0000000000000 ; =9218868437227405312
1010a9f3c:     	cmp	x10, x12
1010a9f40:     	cset	w10, lt
1010a9f44:     	and	x11, x24, #0x7fffffffffffffff
1010a9f48:     	cmp	x11, x12
1010a9f4c:     	cset	w11, lt
1010a9f50:     	and	x8, x8, #0x7fffffffffffffff
1010a9f54:     	cmp	x8, x12
1010a9f58:     	cset	w8, lt
1010a9f5c:     	mov	x12, #0x7fefffffffffffff ; =9218868437227405311
1010a9f60:     	cmp	x9, x12
1010a9f64:     	ccmp	w10, #0x0, #0x4, le
1010a9f68:     	ccmp	w11, #0x0, #0x4, ne
1010a9f6c:     	ccmp	w8, #0x0, #0x4, ne
1010a9f70:     	b.ne	0x1010a9f98 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0x1c8>
1010a9f74:     	mov	w27, #0x0               ; =0
1010a9f78:     	mov	w8, #0x0                ; =0
1010a9f7c:     	fmov	s0, wzr
1010a9f80:     	fmov	s14, wzr
1010a9f84:     	b	0x1010a9fec <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0x21c>
1010a9f88:     	fmov	s0, wzr
1010a9f8c:     	fmov	s14, wzr
1010a9f90:     	mov	x8, x27
1010a9f94:     	b	0x1010a9fec <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0x21c>
1010a9f98:     	fcmp	d10, #0.0
1010a9f9c:     	cset	w27, gt
1010a9fa0:     	fdiv	d1, d8, d10
1010a9fa4:     	fcsel	d1, d1, d11, gt
1010a9fa8:     	fcmp	d1, d11
1010a9fac:     	fcsel	d2, d11, d1, gt
1010a9fb0:     	fcmp	d1, #0.0
1010a9fb4:     	fcsel	d1, d12, d2, mi
1010a9fb8:     	fcvt	s14, d1
1010a9fbc:     	fmov	d8, d0
1010a9fc0:     	fmov	d0, d9
1010a9fc4:     	bl	0x104b7531c <_zlibVersion+0x104b7531c>
1010a9fc8:     	fmov	d9, d0
1010a9fcc:     	fmov	d10, d1
1010a9fd0:     	fmov	d0, d8
1010a9fd4:     	bl	0x104b75634 <_zlibVersion+0x104b75634>
1010a9fd8:     	fmul	d1, d9, d0
1010a9fdc:     	fcvt	s13, d1
1010a9fe0:     	fnmul	d0, d10, d0
1010a9fe4:     	fcvt	s0, d0
1010a9fe8:     	mov	w8, #0x1                ; =1
1010a9fec:     	add	x9, x21, x28
1010a9ff0:     	ldr	x10, [x9, #0x8]
1010a9ff4:     	cmp	x10, #0x0
1010a9ff8:     	ccmp	x10, x23, #0x0, ne
1010a9ffc:     	b.ne	0x1010a9e94 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0xc4>
1010aa000:     	ldr	w10, [x9]
1010aa004:     	cmp	w10, #0x2
1010aa008:     	b.ne	0x1010a9e94 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0xc4>
1010aa00c:     	fmov	w10, s14
1010aa010:     	and	w10, w10, #0x7fffffff
1010aa014:     	mov	w13, #0x7f7fffff        ; =2139095039
1010aa018:     	cmp	w10, w13
1010aa01c:     	cset	w10, gt
1010aa020:     	fmov	w11, s13
1010aa024:     	and	w11, w11, #0x7fffffff
1010aa028:     	cmp	w11, w13
1010aa02c:     	cset	w11, gt
1010aa030:     	fmov	w12, s0
1010aa034:     	and	w12, w12, #0x7fffffff
1010aa038:     	cmp	w12, w13
1010aa03c:     	cset	w12, gt
1010aa040:     	cbz	w8, 0x1010a9e94 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0xc4>
1010aa044:     	tbnz	w10, #0x0, 0x1010a9e94 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0xc4>
1010aa048:     	tbnz	w11, #0x0, 0x1010a9e94 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0xc4>
1010aa04c:     	tbnz	w12, #0x0, 0x1010a9e94 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0xc4>
1010aa050:     	fmov	s1, wzr
1010aa054:     	fcmp	s14, #0.0
1010aa058:     	b.mi	0x1010aa06c <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0x29c>
1010aa05c:     	fmov	s1, #1.00000000
1010aa060:     	fcmp	s14, s1
1010aa064:     	b.gt	0x1010aa06c <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0x29c>
1010aa068:     	fmov	s1, s14
1010aa06c:     	fmov	s2, #-1.00000000
1010aa070:     	fcmp	s13, s2
1010aa074:     	fmov	s3, #-1.00000000
1010aa078:     	b.mi	0x1010aa08c <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0x2bc>
1010aa07c:     	fmov	s3, #1.00000000
1010aa080:     	fcmp	s13, s3
1010aa084:     	b.gt	0x1010aa08c <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0x2bc>
1010aa088:     	fmov	s3, s13
1010aa08c:     	fcmp	s0, s2
1010aa090:     	b.mi	0x1010aa0a4 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0x2d4>
1010aa094:     	fmov	s2, #1.00000000
1010aa098:     	fcmp	s0, s2
1010aa09c:     	b.gt	0x1010aa0a4 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0x2d4>
1010aa0a0:     	fmov	s2, s0
1010aa0a4:     	strb	w8, [x9, #0x1c]
1010aa0a8:     	stp	s1, s3, [x9, #0x20]
1010aa0ac:     	str	s2, [x9, #0x28]
1010aa0b0:     	strb	w27, [x9, #0x2c]
1010aa0b4:     	ldrb	w10, [x9, #0x30]
1010aa0b8:     	cmp	w10, #0x1
1010aa0bc:     	b.ne	0x1010a9e84 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0xb4>
1010aa0c0:     	ldrb	w10, [x9, #0x40]
1010aa0c4:     	cbz	w27, 0x1010aa0cc <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0x2fc>
1010aa0c8:     	tbz	w10, #0x0, 0x1010a9e84 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0xb4>
1010aa0cc:     	cmp	w27, w10
1010aa0d0:     	b.ne	0x1010a9e94 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0xc4>
1010aa0d4:     	ldr	s0, [x9, #0x34]
1010aa0d8:     	fcmp	s1, s0
1010aa0dc:     	b.gt	0x1010a9e84 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0xb4>
1010aa0e0:     	b	0x1010a9e94 <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0xc4>
1010aa0e4:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aa0e8:     	ldr	x8, [x8, #0xdf8]
1010aa0ec:     	stp	x21, x8, [sp, #0x10]
1010aa0f0:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aa0f4:     	ldr	x1, [x8, #0xa68]
1010aa0f8:     	add	x0, sp, #0x10
1010aa0fc:     	ldp	x3, x2, [sp]
1010aa100:     	bl	0x104b761c8 <_zlibVersion+0x104b761c8>
1010aa104:     	ldur	x8, [x29, #-0xa0]
1010aa108:     	adrp	x9, 0x106369000 <_zlibVersion+0x106369000>
1010aa10c:     	ldr	x9, [x9, #0x7f8]
1010aa110:     	ldr	x9, [x9]
1010aa114:     	cmp	x9, x8
1010aa118:     	b.ne	0x1010aa14c <-[GHOSTUIPanGestureRecognizer touchesMoved:withEvent:]+0x37c>
1010aa11c:     	ldp	x29, x30, [sp, #0x180]
1010aa120:     	ldp	x20, x19, [sp, #0x170]
1010aa124:     	ldp	x22, x21, [sp, #0x160]
1010aa128:     	ldp	x24, x23, [sp, #0x150]
1010aa12c:     	ldp	x26, x25, [sp, #0x140]
1010aa130:     	ldp	x28, x27, [sp, #0x130]
1010aa134:     	ldp	d9, d8, [sp, #0x120]
1010aa138:     	ldp	d11, d10, [sp, #0x110]
1010aa13c:     	ldp	d13, d12, [sp, #0x100]
1010aa140:     	ldp	d15, d14, [sp, #0xf0]
1010aa144:     	add	sp, sp, #0x190
1010aa148:     	ret
1010aa14c:     	bl	0x104b7534c <_zlibVersion+0x104b7534c>
