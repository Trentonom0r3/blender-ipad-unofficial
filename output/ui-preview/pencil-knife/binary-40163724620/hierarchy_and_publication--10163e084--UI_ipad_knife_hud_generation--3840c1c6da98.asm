
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163e084 <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy>:
10163e084:     	cbz	x2, 0x10163e0f4 <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0x70>
10163e088:     	stp	x20, x19, [sp, #-0x20]!
10163e08c:     	stp	x29, x30, [sp, #0x10]
10163e090:     	add	x29, sp, #0x10
10163e094:     	mov	x19, x2
10163e098:     	mov	x20, x1
10163e09c:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163e0a0:     	mov	x8, x0
10163e0a4:     	mov	w0, #0x0                ; =0
10163e0a8:     	cbz	x20, 0x10163e1a0 <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0x11c>
10163e0ac:     	cbz	x8, 0x10163e1a0 <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0x11c>
10163e0b0:     	add	x0, x8, #0x1a0
10163e0b4:     	mov	x1, x20
10163e0b8:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163e0bc:     	cmn	w0, #0x1
10163e0c0:     	b.eq	0x10163e19c <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0x118>
10163e0c4:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163e0c8:     	ldr	x8, [x8, #0xa00]
10163e0cc:     	cbz	x8, 0x10163e19c <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0x118>
10163e0d0:     	fmov	d0, x8
10163e0d4:     	cnt.8b	v0, v0
10163e0d8:     	uaddlv.8b	h0, v0
10163e0dc:     	fmov	w9, s0
10163e0e0:     	cmp	x9, #0x1
10163e0e4:     	b.hi	0x10163e0fc <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0x78>
10163e0e8:     	sub	x10, x8, #0x1
10163e0ec:     	and	x10, x10, x20
10163e0f0:     	b	0x10163e110 <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0x8c>
10163e0f4:     	mov	w0, #0x0                ; =0
10163e0f8:     	ret
10163e0fc:     	mov	x10, x20
10163e100:     	cmp	x8, x20
10163e104:     	b.hi	0x10163e110 <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0x8c>
10163e108:     	udiv	x10, x20, x8
10163e10c:     	msub	x10, x10, x8, x20
10163e110:     	adrp	x11, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163e114:     	ldr	x11, [x11, #0x9f8]
10163e118:     	ldr	x11, [x11, x10, lsl #3]
10163e11c:     	cbz	x11, 0x10163e19c <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0x118>
10163e120:     	ldr	x11, [x11]
10163e124:     	cbz	x11, 0x10163e19c <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0x118>
10163e128:     	sub	x12, x8, #0x1
10163e12c:     	b	0x10163e148 <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0xc4>
10163e130:     	ldr	x13, [x11, #0x10]
10163e134:     	cmp	x13, x20
10163e138:     	b.eq	0x10163e180 <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0xfc>
10163e13c:     	mov	w0, #0x0                ; =0
10163e140:     	ldr	x11, [x11]
10163e144:     	cbz	x11, 0x10163e1a0 <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0x11c>
10163e148:     	ldr	x13, [x11, #0x8]
10163e14c:     	cmp	x13, x20
10163e150:     	b.eq	0x10163e130 <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0xac>
10163e154:     	cmp	x9, #0x1
10163e158:     	b.hi	0x10163e164 <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0xe0>
10163e15c:     	and	x13, x13, x12
10163e160:     	b	0x10163e174 <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0xf0>
10163e164:     	cmp	x13, x8
10163e168:     	b.lo	0x10163e174 <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0xf0>
10163e16c:     	udiv	x14, x13, x8
10163e170:     	msub	x13, x14, x8, x13
10163e174:     	cmp	x13, x10
10163e178:     	b.eq	0x10163e13c <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0xb8>
10163e17c:     	b	0x10163e19c <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0x118>
10163e180:     	ldr	x8, [x11, #0x18]
10163e184:     	ldrsw	x9, [x20, #0xc0]
10163e188:     	cmp	x8, x9
10163e18c:     	b.ne	0x10163e19c <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0x118>
10163e190:     	ldp	x8, x9, [x11, #0x28]
10163e194:     	cmp	x8, x9
10163e198:     	b.ne	0x10163e1bc <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0x138>
10163e19c:     	mov	w0, #0x0                ; =0
10163e1a0:     	ldp	x29, x30, [sp, #0x10]
10163e1a4:     	ldp	x20, x19, [sp], #0x20
10163e1a8:     	ret
10163e1ac:     	mov	w0, #0x0                ; =0
10163e1b0:     	add	x8, x8, #0x220
10163e1b4:     	cmp	x8, x9
10163e1b8:     	b.eq	0x10163e1a0 <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0x11c>
10163e1bc:     	ldr	x10, [x8, #0x218]
10163e1c0:     	cmp	x10, x19
10163e1c4:     	b.ne	0x10163e1ac <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0x128>
10163e1c8:     	ldrb	w10, [x8, #0x1d8]
10163e1cc:     	tbz	w10, #0x0, 0x10163e1ac <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0x128>
10163e1d0:     	mov	w0, #0x1                ; =1
10163e1d4:     	b	0x10163e1a0 <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy+0x11c>
