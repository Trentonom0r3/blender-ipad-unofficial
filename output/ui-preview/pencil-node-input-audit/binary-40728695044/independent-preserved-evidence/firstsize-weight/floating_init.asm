
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001016237a8 <__Z23ED_region_floating_initP7ARegion>:
1016237a8:     	ldrh	w8, [x0, #0xc4]
1016237ac:     	mov	w9, #0x403              ; =1027
1016237b0:     	ands	w10, w8, w9
1016237b4:     	cset	w9, ne
1016237b8:     	ldrh	w11, [x0, #0xc2]
1016237bc:     	mov	w12, #0xa0              ; =160
1016237c0:     	tst	w11, w12
1016237c4:     	b.eq	0x1016237f0 <__Z23ED_region_floating_initP7ARegion+0x48>
1016237c8:     	ldr	x11, [x0, #0x8]
1016237cc:     	cmp	x11, #0x0
1016237d0:     	ccmp	w10, #0x0, #0x0, eq
1016237d4:     	cset	w9, ne
1016237d8:     	cmp	x11, #0x0
1016237dc:     	ccmp	w10, #0x0, #0x0, ne
1016237e0:     	b.ne	0x1016237f0 <__Z23ED_region_floating_initP7ARegion+0x48>
1016237e4:     	ldrh	w9, [x11, #0xc4]
1016237e8:     	tst	w9, #0x3
1016237ec:     	cset	w9, ne
1016237f0:     	ldr	x10, [x0, #0x128]
1016237f4:     	ldrb	w11, [x10]
1016237f8:     	mov	w12, #0x402             ; =1026
1016237fc:     	tst	w8, w12
101623800:     	cset	w8, ne
101623804:     	cmp	w11, #0x0
101623808:     	csel	w8, w8, w9, ne
10162380c:     	eor	w8, w8, #0x1
101623810:     	strh	w8, [x10, #0x368]
101623814:     	ldp	w9, w8, [x0, #0xa8]
101623818:     	sub	w8, w8, w9
10162381c:     	add	w8, w8, #0x1
101623820:     	strh	w8, [x0, #0xb8]
101623824:     	ldp	w10, w9, [x0, #0xb0]
101623828:     	sub	w9, w9, w10
10162382c:     	add	w9, w9, #0x1
101623830:     	strh	w9, [x0, #0xba]
101623834:     	sxth	w8, w8
101623838:     	sub	w2, w8, #0x1
10162383c:     	sxth	w8, w9
101623840:     	sub	w4, w8, #0x1
101623844:     	add	x0, x0, #0x50
101623848:     	mov	w1, #0x0                ; =0
10162384c:     	mov	w3, #0x0                ; =0
101623850:     	b	0x1007fcfb4 <__Z13BLI_rcti_initP4rctiiiii>
