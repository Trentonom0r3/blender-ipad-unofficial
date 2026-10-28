
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010a7d90 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE>:
1010a7d90:     	ldr	x8, [x0, #0x8]
1010a7d94:     	cmp	x2, #0x0
1010a7d98:     	ccmp	w1, #0x0, #0x4, ne
1010a7d9c:     	ccmp	x8, #0x0, #0x0, ne
1010a7da0:     	cset	w8, eq
1010a7da4:     	b.ne	0x1010a7f34 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x1a4>
1010a7da8:     	str	w1, [x0]
1010a7dac:     	str	x2, [x0, #0x8]
1010a7db0:     	cmp	w1, #0x2
1010a7db4:     	b.ne	0x1010a7de4 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x54>
1010a7db8:     	adrp	x10, 0x10636c000 <_zlibVersion+0x10636c000>
1010a7dbc:     	ldr	x10, [x10, #0x778]
1010a7dc0:     	ldr	x9, [x10]
1010a7dc4:     	cmn	x9, #0x1
1010a7dc8:     	b.eq	0x1010a7df0 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x60>
1010a7dcc:     	add	x11, x9, #0x1
1010a7dd0:     	str	x11, [x10]
1010a7dd4:     	ldr	w10, [x0]
1010a7dd8:     	cmp	w10, #0x2
1010a7ddc:     	cset	w10, eq
1010a7de0:     	b	0x1010a7df8 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x68>
1010a7de4:     	mov	w10, #0x0               ; =0
1010a7de8:     	mov	x9, #0x0                ; =0
1010a7dec:     	b	0x1010a7df8 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x68>
1010a7df0:     	mov	x9, #0x0                ; =0
1010a7df4:     	mov	w10, #0x1               ; =1
1010a7df8:     	sub	sp, sp, #0x10
1010a7dfc:     	str	x9, [x0, #0x10]
1010a7e00:     	mov	w9, #0x1                ; =1
1010a7e04:     	strb	w9, [x0, #0x18]
1010a7e08:     	ldrb	w9, [x3]
1010a7e0c:     	ldurh	w11, [x3, #0x1]
1010a7e10:     	strh	w11, [sp, #0xc]
1010a7e14:     	ldrb	w11, [x3, #0x3]
1010a7e18:     	strb	w11, [sp, #0xe]
1010a7e1c:     	cbz	w10, 0x1010a7f30 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x1a0>
1010a7e20:     	ldp	s2, s4, [x3, #0x4]
1010a7e24:     	ldr	s1, [x3, #0xc]
1010a7e28:     	fmov	w10, s2
1010a7e2c:     	and	w10, w10, #0x7fffffff
1010a7e30:     	mov	w12, #0x7f7fffff        ; =2139095039
1010a7e34:     	cmp	w10, w12
1010a7e38:     	cset	w10, gt
1010a7e3c:     	fmov	w11, s4
1010a7e40:     	and	w11, w11, #0x7fffffff
1010a7e44:     	cmp	w11, w12
1010a7e48:     	cset	w11, gt
1010a7e4c:     	fmov	w13, s1
1010a7e50:     	and	w13, w13, #0x7fffffff
1010a7e54:     	cmp	w13, w12
1010a7e58:     	cset	w12, gt
1010a7e5c:     	tbz	w9, #0x0, 0x1010a7f30 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x1a0>
1010a7e60:     	tbnz	w10, #0x0, 0x1010a7f30 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x1a0>
1010a7e64:     	tbnz	w11, #0x0, 0x1010a7f30 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x1a0>
1010a7e68:     	tbnz	w12, #0x0, 0x1010a7f30 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x1a0>
1010a7e6c:     	fmov	s0, wzr
1010a7e70:     	fcmp	s2, #0.0
1010a7e74:     	b.mi	0x1010a7e88 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0xf8>
1010a7e78:     	fmov	s0, #1.00000000
1010a7e7c:     	fcmp	s2, s0
1010a7e80:     	b.gt	0x1010a7e88 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0xf8>
1010a7e84:     	fmov	s0, s2
1010a7e88:     	ldrb	w10, [x3, #0x10]
1010a7e8c:     	fmov	s2, #-1.00000000
1010a7e90:     	fcmp	s4, s2
1010a7e94:     	fmov	s3, #-1.00000000
1010a7e98:     	b.mi	0x1010a7eac <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x11c>
1010a7e9c:     	fmov	s3, #1.00000000
1010a7ea0:     	fcmp	s4, s3
1010a7ea4:     	b.gt	0x1010a7eac <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x11c>
1010a7ea8:     	fmov	s3, s4
1010a7eac:     	fcmp	s1, s2
1010a7eb0:     	b.mi	0x1010a7ec4 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x134>
1010a7eb4:     	fmov	s2, #1.00000000
1010a7eb8:     	fcmp	s1, s2
1010a7ebc:     	b.gt	0x1010a7ec4 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x134>
1010a7ec0:     	fmov	s2, s1
1010a7ec4:     	strb	w9, [x0, #0x1c]
1010a7ec8:     	ldrh	w11, [sp, #0xc]
1010a7ecc:     	sturh	w11, [x0, #0x1d]
1010a7ed0:     	ldrb	w11, [sp, #0xe]
1010a7ed4:     	strb	w11, [x0, #0x1f]
1010a7ed8:     	stp	s0, s3, [x0, #0x20]
1010a7edc:     	str	s2, [x0, #0x28]
1010a7ee0:     	strb	w10, [x0, #0x2c]
1010a7ee4:     	ldrb	w11, [x0, #0x30]
1010a7ee8:     	cmp	w11, #0x1
1010a7eec:     	b.ne	0x1010a7f10 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x180>
1010a7ef0:     	ldrb	w11, [x0, #0x40]
1010a7ef4:     	tbz	w10, #0x0, 0x1010a7efc <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x16c>
1010a7ef8:     	tbz	w11, #0x0, 0x1010a7f10 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x180>
1010a7efc:     	cmp	w10, w11
1010a7f00:     	b.ne	0x1010a7f30 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x1a0>
1010a7f04:     	ldr	s1, [x0, #0x34]
1010a7f08:     	fcmp	s0, s1
1010a7f0c:     	b.le	0x1010a7f30 <__ZN5ghost3ios14GestureContact5beginENS0_11TouchDeviceEmRKNS0_12PencilSampleE+0x1a0>
1010a7f10:     	strb	w9, [x0, #0x30]
1010a7f14:     	ldrh	w9, [sp, #0xc]
1010a7f18:     	sturh	w9, [x0, #0x31]
1010a7f1c:     	ldrb	w9, [sp, #0xe]
1010a7f20:     	strb	w9, [x0, #0x33]
1010a7f24:     	stp	s0, s3, [x0, #0x34]
1010a7f28:     	str	s2, [x0, #0x3c]
1010a7f2c:     	strb	w10, [x0, #0x40]
1010a7f30:     	add	sp, sp, #0x10
1010a7f34:     	mov	x0, x8
1010a7f38:     	ret
