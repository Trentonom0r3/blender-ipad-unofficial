
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b43cfc <__ZNSt3__112__hash_tableIPN7nanovdb10HostBufferENS_4hashIS3_EENS_8equal_toIS3_EENS_9allocatorIS3_EEE14__erase_uniqueIS3_EEmRKT_>:
100b43cfc:     	ldr	x8, [x0, #0x8]
100b43d00:     	cbz	x8, 0x100b43d64 <__ZNSt3__112__hash_tableIPN7nanovdb10HostBufferENS_4hashIS3_EENS_8equal_toIS3_EENS_9allocatorIS3_EEE14__erase_uniqueIS3_EEmRKT_+0x68>
100b43d04:     	ldr	x9, [x1]
100b43d08:     	lsr	x10, x9, #32
100b43d0c:     	ubfiz	x11, x9, #3, #29
100b43d10:     	add	x11, x11, #0x8
100b43d14:     	eor	x11, x11, x10
100b43d18:     	mov	x12, #0x2d69            ; =11625
100b43d1c:     	movk	x12, #0xeb38, lsl #16
100b43d20:     	movk	x12, #0xea08, lsl #32
100b43d24:     	movk	x12, #0x9ddf, lsl #48
100b43d28:     	mul	x11, x11, x12
100b43d2c:     	eor	x10, x10, x11, lsr #47
100b43d30:     	eor	x10, x10, x11
100b43d34:     	mul	x10, x10, x12
100b43d38:     	eor	x10, x10, x10, lsr #47
100b43d3c:     	mul	x10, x10, x12
100b43d40:     	fmov	d0, x8
100b43d44:     	cnt.8b	v0, v0
100b43d48:     	uaddlv.8b	h0, v0
100b43d4c:     	fmov	w11, s0
100b43d50:     	cmp	x11, #0x1
100b43d54:     	b.hi	0x100b43d6c <__ZNSt3__112__hash_tableIPN7nanovdb10HostBufferENS_4hashIS3_EENS_8equal_toIS3_EENS_9allocatorIS3_EEE14__erase_uniqueIS3_EEmRKT_+0x70>
100b43d58:     	sub	x12, x8, #0x1
100b43d5c:     	and	x12, x10, x12
100b43d60:     	b	0x100b43d80 <__ZNSt3__112__hash_tableIPN7nanovdb10HostBufferENS_4hashIS3_EENS_8equal_toIS3_EENS_9allocatorIS3_EEE14__erase_uniqueIS3_EEmRKT_+0x84>
100b43d64:     	mov	x0, #0x0                ; =0
100b43d68:     	ret
100b43d6c:     	mov	x12, x10
100b43d70:     	cmp	x10, x8
100b43d74:     	b.lo	0x100b43d80 <__ZNSt3__112__hash_tableIPN7nanovdb10HostBufferENS_4hashIS3_EENS_8equal_toIS3_EENS_9allocatorIS3_EEE14__erase_uniqueIS3_EEmRKT_+0x84>
100b43d78:     	udiv	x12, x10, x8
100b43d7c:     	msub	x12, x12, x8, x10
100b43d80:     	sub	sp, sp, #0x30
100b43d84:     	stp	x29, x30, [sp, #0x20]
100b43d88:     	add	x29, sp, #0x20
100b43d8c:     	ldr	x13, [x0]
100b43d90:     	ldr	x13, [x13, x12, lsl #3]
100b43d94:     	cbz	x13, 0x100b43df0 <__ZNSt3__112__hash_tableIPN7nanovdb10HostBufferENS_4hashIS3_EENS_8equal_toIS3_EENS_9allocatorIS3_EEE14__erase_uniqueIS3_EEmRKT_+0xf4>
100b43d98:     	ldr	x1, [x13]
100b43d9c:     	cbz	x1, 0x100b43df0 <__ZNSt3__112__hash_tableIPN7nanovdb10HostBufferENS_4hashIS3_EENS_8equal_toIS3_EENS_9allocatorIS3_EEE14__erase_uniqueIS3_EEmRKT_+0xf4>
100b43da0:     	sub	x13, x8, #0x1
100b43da4:     	b	0x100b43dbc <__ZNSt3__112__hash_tableIPN7nanovdb10HostBufferENS_4hashIS3_EENS_8equal_toIS3_EENS_9allocatorIS3_EEE14__erase_uniqueIS3_EEmRKT_+0xc0>
100b43da8:     	ldr	x14, [x1, #0x10]
100b43dac:     	cmp	x14, x9
100b43db0:     	b.eq	0x100b43e00 <__ZNSt3__112__hash_tableIPN7nanovdb10HostBufferENS_4hashIS3_EENS_8equal_toIS3_EENS_9allocatorIS3_EEE14__erase_uniqueIS3_EEmRKT_+0x104>
100b43db4:     	ldr	x1, [x1]
100b43db8:     	cbz	x1, 0x100b43df0 <__ZNSt3__112__hash_tableIPN7nanovdb10HostBufferENS_4hashIS3_EENS_8equal_toIS3_EENS_9allocatorIS3_EEE14__erase_uniqueIS3_EEmRKT_+0xf4>
100b43dbc:     	ldr	x14, [x1, #0x8]
100b43dc0:     	cmp	x14, x10
100b43dc4:     	b.eq	0x100b43da8 <__ZNSt3__112__hash_tableIPN7nanovdb10HostBufferENS_4hashIS3_EENS_8equal_toIS3_EENS_9allocatorIS3_EEE14__erase_uniqueIS3_EEmRKT_+0xac>
100b43dc8:     	cmp	x11, #0x1
100b43dcc:     	b.hi	0x100b43dd8 <__ZNSt3__112__hash_tableIPN7nanovdb10HostBufferENS_4hashIS3_EENS_8equal_toIS3_EENS_9allocatorIS3_EEE14__erase_uniqueIS3_EEmRKT_+0xdc>
100b43dd0:     	and	x14, x14, x13
100b43dd4:     	b	0x100b43de8 <__ZNSt3__112__hash_tableIPN7nanovdb10HostBufferENS_4hashIS3_EENS_8equal_toIS3_EENS_9allocatorIS3_EEE14__erase_uniqueIS3_EEmRKT_+0xec>
100b43dd8:     	cmp	x14, x8
100b43ddc:     	b.lo	0x100b43de8 <__ZNSt3__112__hash_tableIPN7nanovdb10HostBufferENS_4hashIS3_EENS_8equal_toIS3_EENS_9allocatorIS3_EEE14__erase_uniqueIS3_EEmRKT_+0xec>
100b43de0:     	udiv	x15, x14, x8
100b43de4:     	msub	x14, x15, x8, x14
100b43de8:     	cmp	x14, x12
100b43dec:     	b.eq	0x100b43db4 <__ZNSt3__112__hash_tableIPN7nanovdb10HostBufferENS_4hashIS3_EENS_8equal_toIS3_EENS_9allocatorIS3_EEE14__erase_uniqueIS3_EEmRKT_+0xb8>
100b43df0:     	mov	x0, #0x0                ; =0
100b43df4:     	ldp	x29, x30, [sp, #0x20]
100b43df8:     	add	sp, sp, #0x30
100b43dfc:     	ret
100b43e00:     	add	x8, sp, #0x8
100b43e04:     	bl	0x100b43e20 <__ZNSt3__112__hash_tableIiNS_4hashIiEENS_8equal_toIiEENS_9allocatorIiEEE6removeENS_21__hash_const_iteratorIPNS_11__hash_nodeIiPvEEEE>
100b43e08:     	ldr	x0, [sp, #0x8]
100b43e0c:     	str	xzr, [sp, #0x8]
100b43e10:     	cbz	x0, 0x100b43e18 <__ZNSt3__112__hash_tableIPN7nanovdb10HostBufferENS_4hashIS3_EENS_8equal_toIS3_EENS_9allocatorIS3_EEE14__erase_uniqueIS3_EEmRKT_+0x11c>
100b43e14:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b43e18:     	mov	w0, #0x1                ; =1
100b43e1c:     	b	0x100b43df4 <__ZNSt3__112__hash_tableIPN7nanovdb10HostBufferENS_4hashIS3_EENS_8equal_toIS3_EENS_9allocatorIS3_EEE14__erase_uniqueIS3_EEmRKT_+0xf8>
