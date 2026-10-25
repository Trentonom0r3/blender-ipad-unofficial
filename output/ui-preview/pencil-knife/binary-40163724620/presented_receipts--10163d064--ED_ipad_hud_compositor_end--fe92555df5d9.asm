
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163d064 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE>:
10163d064:     	sub	sp, sp, #0x170
10163d068:     	stp	x28, x27, [sp, #0x110]
10163d06c:     	stp	x26, x25, [sp, #0x120]
10163d070:     	stp	x24, x23, [sp, #0x130]
10163d074:     	stp	x22, x21, [sp, #0x140]
10163d078:     	stp	x20, x19, [sp, #0x150]
10163d07c:     	stp	x29, x30, [sp, #0x160]
10163d080:     	add	x29, sp, #0x160
10163d084:     	str	x2, [sp, #0x48]
10163d088:     	mov	x20, x1
10163d08c:     	mov	x21, x0
10163d090:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163d094:     	cbz	x20, 0x10163dbb8 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb54>
10163d098:     	cbz	x0, 0x10163dbb8 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb54>
10163d09c:     	add	x0, x0, #0x1a0
10163d0a0:     	mov	x1, x20
10163d0a4:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163d0a8:     	cmn	w0, #0x1
10163d0ac:     	b.eq	0x10163dbb8 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb54>
10163d0b0:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163d0b4:     	ldr	x8, [x8, #0x9b0]
10163d0b8:     	cbz	x8, 0x10163d7a0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x73c>
10163d0bc:     	fmov	d0, x8
10163d0c0:     	cnt.8b	v0, v0
10163d0c4:     	uaddlv.8b	h0, v0
10163d0c8:     	fmov	w9, s0
10163d0cc:     	cmp	x9, #0x1
10163d0d0:     	b.hi	0x10163d0e0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x7c>
10163d0d4:     	sub	x10, x8, #0x1
10163d0d8:     	and	x10, x10, x20
10163d0dc:     	b	0x10163d0f4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x90>
10163d0e0:     	mov	x10, x20
10163d0e4:     	cmp	x8, x20
10163d0e8:     	b.hi	0x10163d0f4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x90>
10163d0ec:     	udiv	x10, x20, x8
10163d0f0:     	msub	x10, x10, x8, x20
10163d0f4:     	adrp	x11, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163d0f8:     	ldr	x11, [x11, #0x9a8]
10163d0fc:     	ldr	x11, [x11, x10, lsl #3]
10163d100:     	cbz	x11, 0x10163d7a0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x73c>
10163d104:     	ldr	x22, [x11]
10163d108:     	cbz	x22, 0x10163d7a0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x73c>
10163d10c:     	sub	x11, x8, #0x1
10163d110:     	b	0x10163d128 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xc4>
10163d114:     	ldr	x12, [x22, #0x10]
10163d118:     	cmp	x12, x20
10163d11c:     	b.eq	0x10163d160 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xfc>
10163d120:     	ldr	x22, [x22]
10163d124:     	cbz	x22, 0x10163d7a0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x73c>
10163d128:     	ldr	x12, [x22, #0x8]
10163d12c:     	cmp	x12, x20
10163d130:     	b.eq	0x10163d114 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb0>
10163d134:     	cmp	x9, #0x1
10163d138:     	b.hi	0x10163d144 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xe0>
10163d13c:     	and	x12, x12, x11
10163d140:     	b	0x10163d154 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xf0>
10163d144:     	cmp	x12, x8
10163d148:     	b.lo	0x10163d154 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xf0>
10163d14c:     	udiv	x13, x12, x8
10163d150:     	msub	x12, x13, x8, x12
10163d154:     	cmp	x12, x10
10163d158:     	b.eq	0x10163d120 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xbc>
10163d15c:     	b	0x10163d7a0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x73c>
10163d160:     	ldrb	w8, [x22, #0x20]
10163d164:     	cmp	w8, #0x1
10163d168:     	b.ne	0x10163d7a0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x73c>
10163d16c:     	ldr	x8, [x22, #0x18]
10163d170:     	ldrsw	x9, [x20, #0xc0]
10163d174:     	cmp	x8, x9
10163d178:     	b.ne	0x10163d7a0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x73c>
10163d17c:     	stur	xzr, [sp, #0x8d]
10163d180:     	movi.16b	v0, #0x0
10163d184:     	stp	q0, q0, [sp, #0x70]
10163d188:     	stp	q0, q0, [sp, #0x50]
10163d18c:     	stur	q0, [sp, #0x98]
10163d190:     	stur	q0, [sp, #0xa8]
10163d194:     	stur	q0, [sp, #0xb8]
10163d198:     	stur	q0, [sp, #0xc8]
10163d19c:     	str	xzr, [sp, #0xd8]
10163d1a0:     	ldrb	w8, [x22, #0xd0]
10163d1a4:     	cmp	w8, #0x1
10163d1a8:     	b.ne	0x10163d744 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x6e0>
10163d1ac:     	ldrb	w8, [x22, #0x21]
10163d1b0:     	cmp	w8, #0x1
10163d1b4:     	b.ne	0x10163d744 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x6e0>
10163d1b8:     	ldrb	w8, [x22, #0x22]
10163d1bc:     	tbnz	w8, #0x0, 0x10163d744 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x6e0>
10163d1c0:     	ldrb	w8, [x22, #0x6c]
10163d1c4:     	cmp	w8, #0x1
10163d1c8:     	b.ne	0x10163d744 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x6e0>
10163d1cc:     	add	x2, sp, #0x50
10163d1d0:     	mov	x0, x21
10163d1d4:     	mov	x1, x20
10163d1d8:     	bl	0x10164c264 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE>
10163d1dc:     	cbz	w0, 0x10163d744 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x6e0>
10163d1e0:     	ldrb	w8, [sp, #0x94]
10163d1e4:     	cmp	w8, #0x1
10163d1e8:     	b.ne	0x10163d744 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x6e0>
10163d1ec:     	add	x0, x22, #0x28
10163d1f0:     	add	x1, sp, #0x50
10163d1f4:     	bl	0x10164d16c <__ZN12_GLOBAL__N_133ipad_knife_hierarchy_native_equalERKNS_24IPadKnifeHierarchyNativeES2_>
10163d1f8:     	mov	x8, x22
10163d1fc:     	strb	w0, [x8, #0xd1]!
10163d200:     	str	x8, [sp, #0x10]
10163d204:     	tbz	w0, #0x0, 0x10163d74c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x6e8>
10163d208:     	ldp	x8, x9, [x22, #0x88]
10163d20c:     	str	x8, [sp, #0x20]
10163d210:     	str	x9, [sp]
10163d214:     	cmp	x8, x9
10163d218:     	b.eq	0x10163d74c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x6e8>
10163d21c:     	str	x22, [sp, #0x8]
10163d220:     	ldr	x8, [sp, #0x20]
10163d224:     	ldr	x8, [x8, #0x10]
10163d228:     	cbz	x8, 0x10163dbe8 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb84>
10163d22c:     	mov	w0, #0x10               ; =16
10163d230:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10163d234:     	str	x0, [sp, #0x38]
10163d238:     	ldr	x8, [sp, #0x20]
10163d23c:     	ldur	q0, [x8, #0x18]
10163d240:     	ldr	x8, [sp, #0x38]
10163d244:     	str	q0, [x8]
10163d248:     	ldr	x8, [sp, #0x8]
10163d24c:     	ldp	x9, x8, [x8, #0x188]
10163d250:     	str	x8, [sp, #0x18]
10163d254:     	cmp	x9, x8
10163d258:     	b.eq	0x10163dbe0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb7c>
10163d25c:     	mov	x28, x9
10163d260:     	ldr	x8, [sp, #0x38]
10163d264:     	add	x8, x8, #0x10
10163d268:     	str	x8, [sp, #0x40]
10163d26c:     	ldp	x11, x10, [sp, #0x18]
10163d270:     	b	0x10163d280 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x21c>
10163d274:     	add	x28, x28, #0x28
10163d278:     	cmp	x28, x11
10163d27c:     	b.eq	0x10163dbd8 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb74>
10163d280:     	ldr	x8, [x28]
10163d284:     	ldr	x9, [x10]
10163d288:     	cmp	x8, x9
10163d28c:     	b.ne	0x10163d274 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x210>
10163d290:     	ldr	x8, [x28, #0x8]
10163d294:     	ldr	x9, [x10, #0x8]
10163d298:     	cmp	x8, x9
10163d29c:     	b.ne	0x10163d274 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x210>
10163d2a0:     	ldr	x8, [x28, #0x10]
10163d2a4:     	ldr	x9, [x10, #0x10]
10163d2a8:     	cmp	x8, x9
10163d2ac:     	b.ne	0x10163d274 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x210>
10163d2b0:     	stp	xzr, xzr, [x29, #-0x70]
10163d2b4:     	stur	xzr, [x29, #-0x60]
10163d2b8:     	ldp	x8, x9, [sp, #0x38]
10163d2bc:     	cmp	x8, x9
10163d2c0:     	str	x28, [sp, #0x30]
10163d2c4:     	b.eq	0x10163d6f0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x68c>
10163d2c8:     	ldr	x22, [sp, #0x38]
10163d2cc:     	b	0x10163d2f0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x28c>
10163d2d0:     	ldr	q0, [x22]
10163d2d4:     	str	q0, [x9]
10163d2d8:     	add	x27, x9, #0x10
10163d2dc:     	stur	x27, [x29, #-0x68]
10163d2e0:     	add	x22, x22, #0x10
10163d2e4:     	ldr	x8, [sp, #0x40]
10163d2e8:     	cmp	x22, x8
10163d2ec:     	b.eq	0x10163d6f0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x68c>
10163d2f0:     	add	x1, x28, #0x18
10163d2f4:     	sub	x2, x29, #0x80
10163d2f8:     	mov	x0, x22
10163d2fc:     	bl	0x1007fd84c <__Z14BLI_rcti_isectPK4rctiS1_PS_>
10163d300:     	tbz	w0, #0x0, 0x10163d338 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x2d4>
10163d304:     	ldr	w19, [x22]
10163d308:     	ldur	w8, [x29, #-0x80]
10163d30c:     	cmp	w19, w8
10163d310:     	b.ge	0x10163d470 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x40c>
10163d314:     	sub	w13, w8, #0x1
10163d318:     	ldp	w12, w26, [x22, #0x8]
10163d31c:     	ldp	x8, x9, [x29, #-0x68]
10163d320:     	cmp	x8, x9
10163d324:     	b.hs	0x10163d398 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x334>
10163d328:     	stp	w19, w13, [x8]
10163d32c:     	add	x19, x8, #0x10
10163d330:     	stp	w12, w26, [x8, #0x8]
10163d334:     	b	0x10163d46c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x408>
10163d338:     	ldp	x9, x8, [x29, #-0x68]
10163d33c:     	cmp	x9, x8
10163d340:     	b.lo	0x10163d2d0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x26c>
10163d344:     	ldur	x23, [x29, #-0x70]
10163d348:     	sub	x24, x9, x23
10163d34c:     	asr	x19, x24, #4
10163d350:     	add	x9, x19, #0x1
10163d354:     	lsr	x10, x9, #60
10163d358:     	cbnz	x10, 0x10163dbfc <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb98>
10163d35c:     	sub	x8, x8, x23
10163d360:     	asr	x10, x8, #3
10163d364:     	cmp	x10, x9
10163d368:     	csel	x9, x10, x9, hi
10163d36c:     	mov	x10, #0x7ffffffffffffff0 ; =9223372036854775792
10163d370:     	cmp	x8, x10
10163d374:     	mov	x8, #0xfffffffffffffff  ; =1152921504606846975
10163d378:     	csel	x21, x9, x8, lo
10163d37c:     	cbz	x21, 0x10163d400 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x39c>
10163d380:     	lsr	x8, x21, #60
10163d384:     	cbnz	x8, 0x10163dc08 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xba4>
10163d388:     	lsl	x0, x21, #4
10163d38c:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10163d390:     	mov	x25, x0
10163d394:     	b	0x10163d404 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x3a0>
10163d398:     	ldur	x23, [x29, #-0x70]
10163d39c:     	sub	x27, x8, x23
10163d3a0:     	asr	x21, x27, #4
10163d3a4:     	add	x8, x21, #0x1
10163d3a8:     	lsr	x10, x8, #60
10163d3ac:     	cbnz	x10, 0x10163dc28 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xbc4>
10163d3b0:     	sub	x9, x9, x23
10163d3b4:     	asr	x10, x9, #3
10163d3b8:     	cmp	x10, x8
10163d3bc:     	csel	x8, x10, x8, hi
10163d3c0:     	mov	x10, #0x7ffffffffffffff0 ; =9223372036854775792
10163d3c4:     	cmp	x9, x10
10163d3c8:     	mov	x9, #0xfffffffffffffff  ; =1152921504606846975
10163d3cc:     	csel	x25, x8, x9, lo
10163d3d0:     	cbz	x25, 0x10163d430 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x3cc>
10163d3d4:     	str	w13, [sp, #0x2c]
10163d3d8:     	lsr	x8, x25, #60
10163d3dc:     	cbnz	x8, 0x10163dc40 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xbdc>
10163d3e0:     	mov	x28, x12
10163d3e4:     	lsl	x0, x25, #4
10163d3e8:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10163d3ec:     	mov	x24, x0
10163d3f0:     	mov	x12, x28
10163d3f4:     	ldr	x28, [sp, #0x30]
10163d3f8:     	ldr	w13, [sp, #0x2c]
10163d3fc:     	b	0x10163d434 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x3d0>
10163d400:     	mov	x25, #0x0               ; =0
10163d404:     	add	x8, x25, x19, lsl #4
10163d408:     	add	x19, x25, x21, lsl #4
10163d40c:     	ldr	q0, [x22]
10163d410:     	str	q0, [x8]
10163d414:     	add	x27, x8, #0x10
10163d418:     	mov	x0, x25
10163d41c:     	mov	x1, x23
10163d420:     	mov	x2, x24
10163d424:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
10163d428:     	stur	x25, [x29, #-0x70]
10163d42c:     	b	0x10163d6dc <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x678>
10163d430:     	mov	x24, #0x0               ; =0
10163d434:     	add	x8, x24, x21, lsl #4
10163d438:     	stp	w19, w13, [x8]
10163d43c:     	add	x21, x24, x25, lsl #4
10163d440:     	stp	w12, w26, [x8, #0x8]
10163d444:     	add	x19, x8, #0x10
10163d448:     	mov	x0, x24
10163d44c:     	mov	x1, x23
10163d450:     	mov	x2, x27
10163d454:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
10163d458:     	stp	x24, x19, [x29, #-0x70]
10163d45c:     	stur	x21, [x29, #-0x60]
10163d460:     	cbz	x23, 0x10163d46c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x408>
10163d464:     	mov	x0, x23
10163d468:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163d46c:     	stur	x19, [x29, #-0x68]
10163d470:     	ldur	w8, [x29, #-0x7c]
10163d474:     	ldr	w25, [x22, #0x4]
10163d478:     	cmp	w8, w25
10163d47c:     	b.ge	0x10163d544 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x4e0>
10163d480:     	add	w13, w8, #0x1
10163d484:     	ldp	w12, w26, [x22, #0x8]
10163d488:     	ldp	x8, x9, [x29, #-0x68]
10163d48c:     	cmp	x8, x9
10163d490:     	b.hs	0x10163d4a4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x440>
10163d494:     	stp	w13, w25, [x8]
10163d498:     	add	x21, x8, #0x10
10163d49c:     	stp	w12, w26, [x8, #0x8]
10163d4a0:     	b	0x10163d540 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x4dc>
10163d4a4:     	ldur	x23, [x29, #-0x70]
10163d4a8:     	sub	x2, x8, x23
10163d4ac:     	asr	x21, x2, #4
10163d4b0:     	add	x8, x21, #0x1
10163d4b4:     	lsr	x10, x8, #60
10163d4b8:     	cbnz	x10, 0x10163dc1c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xbb8>
10163d4bc:     	sub	x9, x9, x23
10163d4c0:     	asr	x10, x9, #3
10163d4c4:     	cmp	x10, x8
10163d4c8:     	csel	x8, x10, x8, hi
10163d4cc:     	mov	x10, #0x7ffffffffffffff0 ; =9223372036854775792
10163d4d0:     	cmp	x9, x10
10163d4d4:     	mov	x9, #0xfffffffffffffff  ; =1152921504606846975
10163d4d8:     	csel	x27, x8, x9, lo
10163d4dc:     	cbz	x27, 0x10163d508 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x4a4>
10163d4e0:     	stp	w13, w12, [sp, #0x28]
10163d4e4:     	lsr	x8, x27, #60
10163d4e8:     	cbnz	x8, 0x10163dc48 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xbe4>
10163d4ec:     	mov	x19, x2
10163d4f0:     	lsl	x0, x27, #4
10163d4f4:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10163d4f8:     	mov	x24, x0
10163d4fc:     	mov	x2, x19
10163d500:     	ldp	w13, w12, [sp, #0x28]
10163d504:     	b	0x10163d50c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x4a8>
10163d508:     	mov	x24, #0x0               ; =0
10163d50c:     	add	x8, x24, x21, lsl #4
10163d510:     	stp	w13, w25, [x8]
10163d514:     	add	x19, x24, x27, lsl #4
10163d518:     	stp	w12, w26, [x8, #0x8]
10163d51c:     	add	x21, x8, #0x10
10163d520:     	mov	x0, x24
10163d524:     	mov	x1, x23
10163d528:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
10163d52c:     	stp	x24, x21, [x29, #-0x70]
10163d530:     	stur	x19, [x29, #-0x60]
10163d534:     	cbz	x23, 0x10163d540 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x4dc>
10163d538:     	mov	x0, x23
10163d53c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163d540:     	stur	x21, [x29, #-0x68]
10163d544:     	ldr	w25, [x22, #0x8]
10163d548:     	ldur	w8, [x29, #-0x78]
10163d54c:     	cmp	w25, w8
10163d550:     	b.ge	0x10163d618 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x5b4>
10163d554:     	ldp	w13, w12, [x29, #-0x80]
10163d558:     	sub	w26, w8, #0x1
10163d55c:     	ldp	x8, x9, [x29, #-0x68]
10163d560:     	cmp	x8, x9
10163d564:     	b.hs	0x10163d578 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x514>
10163d568:     	stp	w13, w12, [x8]
10163d56c:     	add	x19, x8, #0x10
10163d570:     	stp	w25, w26, [x8, #0x8]
10163d574:     	b	0x10163d614 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x5b0>
10163d578:     	ldur	x23, [x29, #-0x70]
10163d57c:     	sub	x2, x8, x23
10163d580:     	asr	x21, x2, #4
10163d584:     	add	x8, x21, #0x1
10163d588:     	lsr	x10, x8, #60
10163d58c:     	cbnz	x10, 0x10163dc10 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xbac>
10163d590:     	sub	x9, x9, x23
10163d594:     	asr	x10, x9, #3
10163d598:     	cmp	x10, x8
10163d59c:     	csel	x8, x10, x8, hi
10163d5a0:     	mov	x10, #0x7ffffffffffffff0 ; =9223372036854775792
10163d5a4:     	cmp	x9, x10
10163d5a8:     	mov	x9, #0xfffffffffffffff  ; =1152921504606846975
10163d5ac:     	csel	x27, x8, x9, lo
10163d5b0:     	cbz	x27, 0x10163d5dc <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x578>
10163d5b4:     	stp	w13, w12, [sp, #0x28]
10163d5b8:     	lsr	x8, x27, #60
10163d5bc:     	cbnz	x8, 0x10163dc50 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xbec>
10163d5c0:     	mov	x19, x2
10163d5c4:     	lsl	x0, x27, #4
10163d5c8:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10163d5cc:     	mov	x24, x0
10163d5d0:     	mov	x2, x19
10163d5d4:     	ldp	w13, w12, [sp, #0x28]
10163d5d8:     	b	0x10163d5e0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x57c>
10163d5dc:     	mov	x24, #0x0               ; =0
10163d5e0:     	add	x8, x24, x21, lsl #4
10163d5e4:     	stp	w13, w12, [x8]
10163d5e8:     	add	x21, x24, x27, lsl #4
10163d5ec:     	stp	w25, w26, [x8, #0x8]
10163d5f0:     	add	x19, x8, #0x10
10163d5f4:     	mov	x0, x24
10163d5f8:     	mov	x1, x23
10163d5fc:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
10163d600:     	stp	x24, x19, [x29, #-0x70]
10163d604:     	stur	x21, [x29, #-0x60]
10163d608:     	cbz	x23, 0x10163d614 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x5b0>
10163d60c:     	mov	x0, x23
10163d610:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163d614:     	stur	x19, [x29, #-0x68]
10163d618:     	ldur	w8, [x29, #-0x74]
10163d61c:     	ldr	w25, [x22, #0xc]
10163d620:     	cmp	w8, w25
10163d624:     	b.ge	0x10163d2e0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x27c>
10163d628:     	ldp	w13, w12, [x29, #-0x80]
10163d62c:     	add	w11, w8, #0x1
10163d630:     	ldp	x8, x9, [x29, #-0x68]
10163d634:     	cmp	x8, x9
10163d638:     	b.hs	0x10163d64c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x5e8>
10163d63c:     	stp	w13, w12, [x8]
10163d640:     	add	x27, x8, #0x10
10163d644:     	stp	w11, w25, [x8, #0x8]
10163d648:     	b	0x10163d2dc <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x278>
10163d64c:     	ldur	x23, [x29, #-0x70]
10163d650:     	sub	x26, x8, x23
10163d654:     	asr	x21, x26, #4
10163d658:     	add	x8, x21, #0x1
10163d65c:     	lsr	x10, x8, #60
10163d660:     	cbnz	x10, 0x10163dc34 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xbd0>
10163d664:     	sub	x9, x9, x23
10163d668:     	asr	x10, x9, #3
10163d66c:     	cmp	x10, x8
10163d670:     	csel	x8, x10, x8, hi
10163d674:     	mov	x10, #0x7ffffffffffffff0 ; =9223372036854775792
10163d678:     	cmp	x9, x10
10163d67c:     	mov	x9, #0xfffffffffffffff  ; =1152921504606846975
10163d680:     	csel	x19, x8, x9, lo
10163d684:     	cbz	x19, 0x10163d6b0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x64c>
10163d688:     	stp	w13, w12, [sp, #0x28]
10163d68c:     	lsr	x8, x19, #60
10163d690:     	cbnz	x8, 0x10163dc58 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xbf4>
10163d694:     	mov	x27, x11
10163d698:     	lsl	x0, x19, #4
10163d69c:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10163d6a0:     	mov	x24, x0
10163d6a4:     	mov	x11, x27
10163d6a8:     	ldp	w13, w12, [sp, #0x28]
10163d6ac:     	b	0x10163d6b4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x650>
10163d6b0:     	mov	x24, #0x0               ; =0
10163d6b4:     	add	x8, x24, x21, lsl #4
10163d6b8:     	stp	w13, w12, [x8]
10163d6bc:     	add	x19, x24, x19, lsl #4
10163d6c0:     	stp	w11, w25, [x8, #0x8]
10163d6c4:     	add	x27, x8, #0x10
10163d6c8:     	mov	x0, x24
10163d6cc:     	mov	x1, x23
10163d6d0:     	mov	x2, x26
10163d6d4:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
10163d6d8:     	stur	x24, [x29, #-0x70]
10163d6dc:     	stp	x27, x19, [x29, #-0x68]
10163d6e0:     	cbz	x23, 0x10163d2dc <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x278>
10163d6e4:     	mov	x0, x23
10163d6e8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163d6ec:     	b	0x10163d2dc <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x278>
10163d6f0:     	ldr	x0, [sp, #0x38]
10163d6f4:     	cbz	x0, 0x10163d6fc <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x698>
10163d6f8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163d6fc:     	ldp	x8, x9, [x29, #-0x70]
10163d700:     	stp	x8, x9, [sp, #0x38]
10163d704:     	cmp	x8, x9
10163d708:     	b.eq	0x10163d718 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x6b4>
10163d70c:     	ldp	x11, x10, [sp, #0x18]
10163d710:     	ldr	x28, [sp, #0x30]
10163d714:     	b	0x10163d274 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x210>
10163d718:     	ldr	x8, [sp, #0x38]
10163d71c:     	cbz	x8, 0x10163d728 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x6c4>
10163d720:     	ldr	x0, [sp, #0x38]
10163d724:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163d728:     	ldr	x8, [sp, #0x20]
10163d72c:     	add	x8, x8, #0x28
10163d730:     	str	x8, [sp, #0x20]
10163d734:     	ldp	x9, x22, [sp]
10163d738:     	cmp	x8, x9
10163d73c:     	b.ne	0x10163d220 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x1bc>
10163d740:     	b	0x10163d74c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x6e8>
10163d744:     	add	x8, x22, #0xd1
10163d748:     	strb	wzr, [x8]
10163d74c:     	ldrb	w8, [x22, #0xd0]
10163d750:     	cmp	w8, #0x1
10163d754:     	b.ne	0x10163d768 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x704>
10163d758:     	add	x0, x22, #0xd8
10163d75c:     	add	x1, x22, #0x28
10163d760:     	bl	0x10164bf74 <__ZN12_GLOBAL__N_126IPadKnifeHierarchySnapshotaSEOS0_>
10163d764:     	b	0x10163d76c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x708>
10163d768:     	strb	wzr, [x22, #0x181]
10163d76c:     	strb	wzr, [x22, #0x20]
10163d770:     	ldr	x0, [sp, #0xc8]
10163d774:     	cbz	x0, 0x10163d780 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x71c>
10163d778:     	str	x0, [sp, #0xd0]
10163d77c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163d780:     	ldr	x0, [sp, #0xb0]
10163d784:     	cbz	x0, 0x10163d790 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x72c>
10163d788:     	str	x0, [sp, #0xb8]
10163d78c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163d790:     	ldr	x0, [sp, #0x98]
10163d794:     	cbz	x0, 0x10163d7a0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x73c>
10163d798:     	str	x0, [sp, #0xa0]
10163d79c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163d7a0:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163d7a4:     	ldr	x8, [x8, #0xa00]
10163d7a8:     	cbz	x8, 0x10163dbb8 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb54>
10163d7ac:     	fmov	d0, x8
10163d7b0:     	cnt.8b	v0, v0
10163d7b4:     	uaddlv.8b	h0, v0
10163d7b8:     	fmov	w9, s0
10163d7bc:     	cmp	x9, #0x1
10163d7c0:     	b.hi	0x10163d7d0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x76c>
10163d7c4:     	sub	x10, x8, #0x1
10163d7c8:     	and	x10, x10, x20
10163d7cc:     	b	0x10163d7e4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x780>
10163d7d0:     	mov	x10, x20
10163d7d4:     	cmp	x8, x20
10163d7d8:     	b.hi	0x10163d7e4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x780>
10163d7dc:     	udiv	x10, x20, x8
10163d7e0:     	msub	x10, x10, x8, x20
10163d7e4:     	adrp	x11, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163d7e8:     	ldr	x11, [x11, #0x9f8]
10163d7ec:     	ldr	x11, [x11, x10, lsl #3]
10163d7f0:     	cbz	x11, 0x10163dbb8 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb54>
10163d7f4:     	ldr	x22, [x11]
10163d7f8:     	cbz	x22, 0x10163dbb8 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb54>
10163d7fc:     	sub	x11, x8, #0x1
10163d800:     	b	0x10163d818 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x7b4>
10163d804:     	ldr	x12, [x22, #0x10]
10163d808:     	cmp	x12, x20
10163d80c:     	b.eq	0x10163d850 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x7ec>
10163d810:     	ldr	x22, [x22]
10163d814:     	cbz	x22, 0x10163dbb8 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb54>
10163d818:     	ldr	x12, [x22, #0x8]
10163d81c:     	cmp	x12, x20
10163d820:     	b.eq	0x10163d804 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x7a0>
10163d824:     	cmp	x9, #0x1
10163d828:     	b.hi	0x10163d834 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x7d0>
10163d82c:     	and	x12, x12, x11
10163d830:     	b	0x10163d844 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x7e0>
10163d834:     	cmp	x12, x8
10163d838:     	b.lo	0x10163d844 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x7e0>
10163d83c:     	udiv	x13, x12, x8
10163d840:     	msub	x12, x13, x8, x12
10163d844:     	cmp	x12, x10
10163d848:     	b.eq	0x10163d810 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x7ac>
10163d84c:     	b	0x10163dbb8 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb54>
10163d850:     	ldrb	w8, [x22, #0x20]
10163d854:     	cmp	w8, #0x1
10163d858:     	b.ne	0x10163da60 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x9fc>
10163d85c:     	ldr	x8, [x22, #0x18]
10163d860:     	ldrsw	x9, [x20, #0xc0]
10163d864:     	cmp	x8, x9
10163d868:     	b.ne	0x10163da60 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x9fc>
10163d86c:     	mov	x23, x22
10163d870:     	ldp	x20, x24, [x23, #0x40]!
10163d874:     	cmp	x20, x24
10163d878:     	b.eq	0x10163d9f0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x98c>
10163d87c:     	adrp	x25, 0x106c17000 <_screen_context_dir+0x88>
10163d880:     	ldr	x27, [x25, #0x130]
10163d884:     	mov	x19, #-0x1              ; =-1
10163d888:     	b	0x10163d8b0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x84c>
10163d88c:     	ldr	x8, [x21, #0x218]
10163d890:     	str	x8, [x20, #0x218]
10163d894:     	ldr	x8, [x20, #0x218]
10163d898:     	cbz	x8, 0x10163d9c0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x95c>
10163d89c:     	mov	x8, x27
10163d8a0:     	add	x20, x20, #0x220
10163d8a4:     	mov	x27, x8
10163d8a8:     	cmp	x20, x24
10163d8ac:     	b.eq	0x10163d9f0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x98c>
10163d8b0:     	ldp	x21, x28, [x22, #0x28]
10163d8b4:     	cmp	x21, x28
10163d8b8:     	b.eq	0x10163d894 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x830>
10163d8bc:     	ldrb	w26, [x20, #0x1d8]
10163d8c0:     	b	0x10163d8d0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x86c>
10163d8c4:     	add	x21, x21, #0x220
10163d8c8:     	cmp	x21, x28
10163d8cc:     	b.eq	0x10163d894 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x830>
10163d8d0:     	ldrb	w8, [x21, #0x1d8]
10163d8d4:     	cmp	w26, w8
10163d8d8:     	b.ne	0x10163d8c4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x860>
10163d8dc:     	ldr	x8, [x20, #0x1e0]
10163d8e0:     	ldr	x9, [x21, #0x1e0]
10163d8e4:     	cmp	x8, x9
10163d8e8:     	b.ne	0x10163d8c4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x860>
10163d8ec:     	ldr	x8, [x20, #0x1e8]
10163d8f0:     	ldr	x9, [x21, #0x1e8]
10163d8f4:     	cmp	x8, x9
10163d8f8:     	b.ne	0x10163d8c4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x860>
10163d8fc:     	ldr	x8, [x20, #0x1f0]
10163d900:     	ldr	x9, [x21, #0x1f0]
10163d904:     	cmp	x8, x9
10163d908:     	b.ne	0x10163d8c4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x860>
10163d90c:     	ldr	x8, [x20, #0x1f8]
10163d910:     	ldr	x9, [x21, #0x1f8]
10163d914:     	cmp	x8, x9
10163d918:     	b.ne	0x10163d8c4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x860>
10163d91c:     	mov	x0, x20
10163d920:     	mov	x1, x21
10163d924:     	mov	w2, #0x1                ; =1
10163d928:     	bl	0x10163b2dc <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b>
10163d92c:     	cbz	w0, 0x10163d8c4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x860>
10163d930:     	ldr	x11, [x20, #0x208]
10163d934:     	ldr	x9, [x20, #0x200]
10163d938:     	sub	x8, x11, x9
10163d93c:     	ldr	x12, [x21, #0x208]
10163d940:     	ldr	x10, [x21, #0x200]
10163d944:     	sub	x12, x12, x10
10163d948:     	cmp	x8, x12
10163d94c:     	b.ne	0x10163d8c4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x860>
10163d950:     	cmp	x11, x9
10163d954:     	b.eq	0x10163d88c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x828>
10163d958:     	asr	x8, x8, #4
10163d95c:     	cmp	x8, #0x1
10163d960:     	csinc	x8, x8, xzr, hi
10163d964:     	add	x9, x9, #0x8
10163d968:     	add	x10, x10, #0x8
10163d96c:     	ldur	w11, [x9, #-0x8]
10163d970:     	ldur	w12, [x10, #-0x8]
10163d974:     	cmp	w11, w12
10163d978:     	b.ne	0x10163d8c4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x860>
10163d97c:     	ldr	w11, [x9]
10163d980:     	ldr	w12, [x10]
10163d984:     	cmp	w11, w12
10163d988:     	b.ne	0x10163d8c4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x860>
10163d98c:     	ldur	w11, [x9, #-0x4]
10163d990:     	ldur	w12, [x10, #-0x4]
10163d994:     	cmp	w11, w12
10163d998:     	b.ne	0x10163d8c4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x860>
10163d99c:     	ldr	w11, [x9, #0x4]
10163d9a0:     	ldr	w12, [x10, #0x4]
10163d9a4:     	cmp	w11, w12
10163d9a8:     	b.ne	0x10163d8c4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x860>
10163d9ac:     	add	x9, x9, #0x10
10163d9b0:     	add	x10, x10, #0x10
10163d9b4:     	subs	x8, x8, #0x1
10163d9b8:     	b.ne	0x10163d96c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x908>
10163d9bc:     	b	0x10163d88c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x828>
10163d9c0:     	cmn	x27, #0x1
10163d9c4:     	b.eq	0x10163d9e0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x97c>
10163d9c8:     	add	x8, x27, #0x1
10163d9cc:     	str	x8, [x25, #0x130]
10163d9d0:     	str	x27, [x20, #0x218]
10163d9d4:     	cbnz	x27, 0x10163d8a0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x83c>
10163d9d8:     	mov	w8, #0x1                ; =1
10163d9dc:     	b	0x10163d9e8 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x984>
10163d9e0:     	str	xzr, [x20, #0x218]
10163d9e4:     	mov	x8, #-0x1               ; =-1
10163d9e8:     	str	x19, [x20, #0x218]
10163d9ec:     	b	0x10163d8a0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x83c>
10163d9f0:     	mov	x19, x22
10163d9f4:     	ldr	x20, [x19, #0x28]!
10163d9f8:     	cbz	x20, 0x10163da44 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x9e0>
10163d9fc:     	ldr	x21, [x22, #0x30]
10163da00:     	mov	x0, x20
10163da04:     	cmp	x21, x20
10163da08:     	b.ne	0x10163da1c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x9b8>
10163da0c:     	b	0x10163da34 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x9d0>
10163da10:     	sub	x21, x21, #0x220
10163da14:     	cmp	x21, x20
10163da18:     	b.eq	0x10163da30 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x9cc>
10163da1c:     	ldur	x0, [x21, #-0x20]
10163da20:     	cbz	x0, 0x10163da10 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x9ac>
10163da24:     	stur	x0, [x21, #-0x18]
10163da28:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163da2c:     	b	0x10163da10 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x9ac>
10163da30:     	ldr	x0, [x19]
10163da34:     	str	x20, [x22, #0x30]
10163da38:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163da3c:     	stp	xzr, xzr, [x19]
10163da40:     	str	xzr, [x19, #0x10]
10163da44:     	ldr	q0, [x22, #0x40]
10163da48:     	stur	q0, [x22, #0x28]
10163da4c:     	ldr	x8, [x22, #0x50]
10163da50:     	str	x8, [x22, #0x38]
10163da54:     	stp	xzr, xzr, [x23, #0x8]
10163da58:     	str	xzr, [x23]
10163da5c:     	strb	wzr, [x22, #0x20]
10163da60:     	ldp	x9, x8, [x22, #0x28]
10163da64:     	str	x8, [sp, #0x30]
10163da68:     	cmp	x9, x8
10163da6c:     	b.eq	0x10163dbb8 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb54>
10163da70:     	mov	x11, #-0x5555555555555556 ; =-6148914691236517206
10163da74:     	movk	x11, #0xaaa, lsl #48
10163da78:     	mov	x10, #-0x5555555555555556 ; =-6148914691236517206
10163da7c:     	movk	x10, #0xaaab
10163da80:     	b	0x10163da94 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xa30>
10163da84:     	add	x9, x9, #0x220
10163da88:     	ldr	x8, [sp, #0x30]
10163da8c:     	cmp	x9, x8
10163da90:     	b.eq	0x10163dbb8 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb54>
10163da94:     	ldr	x8, [x9, #0x218]
10163da98:     	ldr	x21, [sp, #0x48]
10163da9c:     	cbz	x8, 0x10163da84 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xa20>
10163daa0:     	ldr	x24, [x9, #0x200]
10163daa4:     	ldr	x12, [x9, #0x208]
10163daa8:     	cmp	x24, x12
10163daac:     	b.eq	0x10163da84 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xa20>
10163dab0:     	ldr	x19, [x21, #0x8]
10163dab4:     	stp	x12, x9, [sp, #0x38]
10163dab8:     	b	0x10163dadc <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xa78>
10163dabc:     	stp	w25, w27, [x19]
10163dac0:     	stp	w26, w28, [x19, #0x8]
10163dac4:     	str	x22, [x19, #0x10]
10163dac8:     	add	x19, x19, #0x18
10163dacc:     	str	x19, [x21, #0x8]
10163dad0:     	add	x24, x24, #0x10
10163dad4:     	cmp	x24, x12
10163dad8:     	b.eq	0x10163da84 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xa20>
10163dadc:     	ldp	w25, w26, [x24]
10163dae0:     	ldp	w27, w28, [x24, #0x8]
10163dae4:     	ldr	x22, [x9, #0x218]
10163dae8:     	ldr	x8, [x21, #0x10]
10163daec:     	cmp	x19, x8
10163daf0:     	b.lo	0x10163dabc <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xa58>
10163daf4:     	ldr	x20, [x21]
10163daf8:     	sub	x21, x19, x20
10163dafc:     	asr	x9, x21, #3
10163db00:     	mul	x19, x9, x10
10163db04:     	add	x9, x19, #0x1
10163db08:     	cmp	x9, x11
10163db0c:     	b.hi	0x10163dbf0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb8c>
10163db10:     	sub	x8, x8, x20
10163db14:     	asr	x8, x8, #3
10163db18:     	mul	x8, x8, x10
10163db1c:     	lsl	x10, x8, #1
10163db20:     	cmp	x10, x9
10163db24:     	csel	x9, x10, x9, hi
10163db28:     	mov	x10, #0x5555555555555555 ; =6148914691236517205
10163db2c:     	movk	x10, #0x555, lsl #48
10163db30:     	cmp	x8, x10
10163db34:     	csel	x23, x9, x11, lo
10163db38:     	cbz	x23, 0x10163db54 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xaf0>
10163db3c:     	cmp	x23, x11
10163db40:     	b.hi	0x10163dbf8 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb94>
10163db44:     	add	x8, x23, x23, lsl #1
10163db48:     	lsl	x0, x8, #3
10163db4c:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10163db50:     	b	0x10163db58 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xaf4>
10163db54:     	mov	x0, #0x0                ; =0
10163db58:     	mov	w9, #0x18               ; =24
10163db5c:     	madd	x8, x19, x9, x0
10163db60:     	stp	w25, w27, [x8]
10163db64:     	madd	x23, x23, x9, x0
10163db68:     	stp	w26, w28, [x8, #0x8]
10163db6c:     	str	x22, [x8, #0x10]
10163db70:     	add	x19, x8, #0x18
10163db74:     	sub	x22, x8, x21
10163db78:     	mov	x0, x22
10163db7c:     	mov	x1, x20
10163db80:     	mov	x2, x21
10163db84:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
10163db88:     	ldr	x21, [sp, #0x48]
10163db8c:     	stp	x22, x19, [x21]
10163db90:     	str	x23, [x21, #0x10]
10163db94:     	cbz	x20, 0x10163dba0 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb3c>
10163db98:     	mov	x0, x20
10163db9c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163dba0:     	ldp	x12, x9, [sp, #0x38]
10163dba4:     	mov	x11, #-0x5555555555555556 ; =-6148914691236517206
10163dba8:     	movk	x11, #0xaaa, lsl #48
10163dbac:     	mov	x10, #-0x5555555555555556 ; =-6148914691236517206
10163dbb0:     	movk	x10, #0xaaab
10163dbb4:     	b	0x10163dacc <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xa68>
10163dbb8:     	ldp	x29, x30, [sp, #0x160]
10163dbbc:     	ldp	x20, x19, [sp, #0x150]
10163dbc0:     	ldp	x22, x21, [sp, #0x140]
10163dbc4:     	ldp	x24, x23, [sp, #0x130]
10163dbc8:     	ldp	x26, x25, [sp, #0x120]
10163dbcc:     	ldp	x28, x27, [sp, #0x110]
10163dbd0:     	add	sp, sp, #0x170
10163dbd4:     	ret
10163dbd8:     	ldr	x8, [sp, #0x38]
10163dbdc:     	cbz	x8, 0x10163dbe8 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xb84>
10163dbe0:     	ldr	x0, [sp, #0x38]
10163dbe4:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163dbe8:     	ldp	x22, x8, [sp, #0x8]
10163dbec:     	b	0x10163d748 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0x6e4>
10163dbf0:     	ldr	x0, [sp, #0x48]
10163dbf4:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
10163dbf8:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
10163dbfc:     	sub	x0, x29, #0x70
10163dc00:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
10163dc04:     	b	0x10163dc5c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xbf8>
10163dc08:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
10163dc0c:     	b	0x10163dc5c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xbf8>
10163dc10:     	sub	x0, x29, #0x70
10163dc14:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
10163dc18:     	b	0x10163dc5c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xbf8>
10163dc1c:     	sub	x0, x29, #0x70
10163dc20:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
10163dc24:     	b	0x10163dc5c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xbf8>
10163dc28:     	sub	x0, x29, #0x70
10163dc2c:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
10163dc30:     	b	0x10163dc5c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xbf8>
10163dc34:     	sub	x0, x29, #0x70
10163dc38:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
10163dc3c:     	b	0x10163dc5c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xbf8>
10163dc40:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
10163dc44:     	b	0x10163dc5c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xbf8>
10163dc48:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
10163dc4c:     	b	0x10163dc5c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xbf8>
10163dc50:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
10163dc54:     	b	0x10163dc5c <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xbf8>
10163dc58:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
10163dc5c:     	brk	#0x1
10163dc60:     	b	0x10163dc74 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xc10>
10163dc64:     	b	0x10163dc90 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xc2c>
10163dc68:     	b	0x10163dc90 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xc2c>
10163dc6c:     	b	0x10163dc90 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xc2c>
10163dc70:     	b	0x10163dc90 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xc2c>
10163dc74:     	mov	x19, x0
10163dc78:     	b	0x10163dcb4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xc50>
10163dc7c:     	b	0x10163dc90 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xc2c>
10163dc80:     	b	0x10163dc90 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xc2c>
10163dc84:     	b	0x10163dc90 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xc2c>
10163dc88:     	b	0x10163dc90 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xc2c>
10163dc8c:     	b	0x10163dc90 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xc2c>
10163dc90:     	mov	x19, x0
10163dc94:     	ldur	x0, [x29, #-0x70]
10163dc98:     	cbz	x0, 0x10163dca4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xc40>
10163dc9c:     	stur	x0, [x29, #-0x68]
10163dca0:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163dca4:     	ldr	x8, [sp, #0x38]
10163dca8:     	cbz	x8, 0x10163dcb4 <__Z26ED_ipad_hud_compositor_endP8bContextP8wmWindowRNSt3__16vectorI20IPadHUDPresentedRectNS3_9allocatorIS5_EEEE+0xc50>
10163dcac:     	ldr	x0, [sp, #0x38]
10163dcb0:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163dcb4:     	add	x0, sp, #0x50
10163dcb8:     	bl	0x10164c214 <__ZN12_GLOBAL__N_124IPadKnifeHierarchyNativeD1Ev>
10163dcbc:     	mov	x0, x19
10163dcc0:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
