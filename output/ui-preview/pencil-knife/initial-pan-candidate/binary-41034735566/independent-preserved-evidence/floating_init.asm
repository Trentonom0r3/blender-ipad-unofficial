
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001016241e8 <__Z23ED_region_floating_initP7ARegion>:
1016241e8:     	ldrh	w8, [x0, #0xc4]
1016241ec:     	mov	w9, #0x403              ; =1027
1016241f0:     	ands	w10, w8, w9
1016241f4:     	cset	w9, ne
1016241f8:     	ldrh	w11, [x0, #0xc2]
1016241fc:     	mov	w12, #0xa0              ; =160
101624200:     	tst	w11, w12
101624204:     	b.eq	0x101624230 <__Z23ED_region_floating_initP7ARegion+0x48>
101624208:     	ldr	x11, [x0, #0x8]
10162420c:     	cmp	x11, #0x0
101624210:     	ccmp	w10, #0x0, #0x0, eq
101624214:     	cset	w9, ne
101624218:     	cmp	x11, #0x0
10162421c:     	ccmp	w10, #0x0, #0x0, ne
101624220:     	b.ne	0x101624230 <__Z23ED_region_floating_initP7ARegion+0x48>
101624224:     	ldrh	w9, [x11, #0xc4]
101624228:     	tst	w9, #0x3
10162422c:     	cset	w9, ne
101624230:     	ldr	x10, [x0, #0x128]
101624234:     	ldrb	w11, [x10]
101624238:     	mov	w12, #0x402             ; =1026
10162423c:     	tst	w8, w12
101624240:     	cset	w8, ne
101624244:     	cmp	w11, #0x0
101624248:     	csel	w8, w8, w9, ne
10162424c:     	eor	w8, w8, #0x1
101624250:     	strh	w8, [x10, #0x368]
101624254:     	ldp	w9, w8, [x0, #0xa8]
101624258:     	sub	w8, w8, w9
10162425c:     	add	w8, w8, #0x1
101624260:     	strh	w8, [x0, #0xb8]
101624264:     	ldp	w10, w9, [x0, #0xb0]
101624268:     	sub	w9, w9, w10
10162426c:     	add	w9, w9, #0x1
101624270:     	strh	w9, [x0, #0xba]
101624274:     	sxth	w8, w8
101624278:     	sub	w2, w8, #0x1
10162427c:     	sxth	w8, w9
101624280:     	sub	w4, w8, #0x1
101624284:     	add	x0, x0, #0x50
101624288:     	mov	w1, #0x0                ; =0
10162428c:     	mov	w3, #0x0                ; =0
101624290:     	b	0x1007fcfb4 <__Z13BLI_rcti_initP4rctiiiii>
