
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101637e90 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE>:
101637e90:     	sub	sp, sp, #0x100
101637e94:     	stp	x28, x27, [sp, #0xa0]
101637e98:     	stp	x26, x25, [sp, #0xb0]
101637e9c:     	stp	x24, x23, [sp, #0xc0]
101637ea0:     	stp	x22, x21, [sp, #0xd0]
101637ea4:     	stp	x20, x19, [sp, #0xe0]
101637ea8:     	stp	x29, x30, [sp, #0xf0]
101637eac:     	add	x29, sp, #0xf0
101637eb0:     	mov	x21, x2
101637eb4:     	mov	x19, x1
101637eb8:     	mov	x20, x0
101637ebc:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
101637ec0:     	ldr	x8, [x8, #0x7f0]
101637ec4:     	ldr	x8, [x8]
101637ec8:     	stur	x8, [x29, #-0x60]
101637ecc:     	stp	xzr, xzr, [sp, #0x48]
101637ed0:     	str	xzr, [sp, #0x58]
101637ed4:     	stp	xzr, xzr, [sp, #0x30]
101637ed8:     	str	wzr, [sp, #0x40]
101637edc:     	str	x1, [sp, #0x10]
101637ee0:     	ldr	w8, [x1, #0x144]
101637ee4:     	str	w8, [sp, #0x18]
101637ee8:     	ldrsw	x8, [x0, #0xc0]
101637eec:     	stp	x8, xzr, [sp, #0x20]
101637ef0:     	bl	0x100b96a54 <__Z24WM_window_native_pixel_xPK8wmWindow>
101637ef4:     	str	w0, [sp, #0x28]
101637ef8:     	mov	x0, x20
101637efc:     	bl	0x100b96a8c <__Z24WM_window_native_pixel_yPK8wmWindow>
101637f00:     	adrp	x8, 0x106d88000 <_build_commit_date>
101637f04:     	add	x8, x8, #0xe08
101637f08:     	str	w0, [sp, #0x2c]
101637f0c:     	ldr	s0, [x8, #0x2654]
101637f10:     	str	s0, [sp, #0x30]
101637f14:     	add	x8, x21, #0x104
101637f18:     	ldr	q0, [x8]
101637f1c:     	stur	q0, [sp, #0x34]
101637f20:     	add	x8, sp, #0x60
101637f24:     	mov	x0, x21
101637f28:     	str	x19, [sp]
101637f2c:     	mov	x1, x19
101637f30:     	bl	0x101634d0c <__ZN12_GLOBAL__N_17buttonsERKNS_5ModelEPK7bScreen>
101637f34:     	str	x20, [sp, #0x8]
101637f38:     	ldp	x26, x27, [sp, #0x60]
101637f3c:     	cmp	x26, x27
101637f40:     	b.eq	0x101638008 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x178>
101637f44:     	ldr	x19, [sp, #0x50]
101637f48:     	mov	x28, #0x7ffffffffffffff0 ; =9223372036854775792
101637f4c:     	mov	x25, #0xfffffffffffffff ; =1152921504606846975
101637f50:     	b	0x101637f6c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0xdc>
101637f54:     	ldr	q0, [x26]
101637f58:     	str	q0, [x19], #0x10
101637f5c:     	str	x19, [sp, #0x50]
101637f60:     	add	x26, x26, #0x38
101637f64:     	cmp	x26, x27
101637f68:     	b.eq	0x101638004 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x174>
101637f6c:     	ldr	x8, [sp, #0x58]
101637f70:     	cmp	x19, x8
101637f74:     	b.lo	0x101637f54 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0xc4>
101637f78:     	ldr	x22, [sp, #0x48]
101637f7c:     	sub	x23, x19, x22
101637f80:     	asr	x19, x23, #4
101637f84:     	add	x9, x19, #0x1
101637f88:     	lsr	x10, x9, #60
101637f8c:     	cbnz	x10, 0x10163878c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x8fc>
101637f90:     	sub	x8, x8, x22
101637f94:     	asr	x10, x8, #3
101637f98:     	cmp	x10, x9
101637f9c:     	csel	x9, x10, x9, hi
101637fa0:     	cmp	x8, x28
101637fa4:     	csel	x20, x9, x25, lo
101637fa8:     	cbz	x20, 0x101637fc4 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x134>
101637fac:     	lsr	x8, x20, #60
101637fb0:     	cbnz	x8, 0x10163879c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x90c>
101637fb4:     	lsl	x0, x20, #4
101637fb8:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
101637fbc:     	mov	x24, x0
101637fc0:     	b	0x101637fc8 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x138>
101637fc4:     	mov	x24, #0x0               ; =0
101637fc8:     	add	x8, x24, x19, lsl #4
101637fcc:     	add	x20, x24, x20, lsl #4
101637fd0:     	ldr	q0, [x26]
101637fd4:     	str	q0, [x8]
101637fd8:     	add	x19, x8, #0x10
101637fdc:     	mov	x0, x24
101637fe0:     	mov	x1, x22
101637fe4:     	mov	x2, x23
101637fe8:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
101637fec:     	stp	x24, x19, [sp, #0x48]
101637ff0:     	str	x20, [sp, #0x58]
101637ff4:     	cbz	x22, 0x101637f5c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0xcc>
101637ff8:     	mov	x0, x22
101637ffc:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101638000:     	b	0x101637f5c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0xcc>
101638004:     	ldr	x26, [sp, #0x60]
101638008:     	cbz	x26, 0x10163804c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x1bc>
10163800c:     	ldr	x19, [sp, #0x68]
101638010:     	mov	x0, x26
101638014:     	cmp	x19, x26
101638018:     	b.ne	0x10163802c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x19c>
10163801c:     	b	0x101638044 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x1b4>
101638020:     	sub	x19, x19, #0x38
101638024:     	cmp	x19, x26
101638028:     	b.eq	0x101638040 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x1b0>
10163802c:     	ldursb	w8, [x19, #-0x11]
101638030:     	tbz	w8, #0x1f, 0x101638020 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x190>
101638034:     	ldur	x0, [x19, #-0x28]
101638038:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163803c:     	b	0x101638020 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x190>
101638040:     	ldr	x0, [sp, #0x60]
101638044:     	str	x26, [sp, #0x68]
101638048:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163804c:     	mov	x24, #0x0               ; =0
101638050:     	add	x8, x21, #0x134
101638054:     	ldr	q0, [x8]
101638058:     	add	x8, x21, #0x154
10163805c:     	ldr	q1, [x8]
101638060:     	stp	q0, q1, [sp, #0x60]
101638064:     	add	x8, x21, #0x164
101638068:     	ldr	q0, [x8]
10163806c:     	str	q0, [sp, #0x80]
101638070:     	add	x26, sp, #0x60
101638074:     	mov	x27, #0x7ffffffffffffff0 ; =9223372036854775792
101638078:     	mov	x28, #0xfffffffffffffff ; =1152921504606846975
10163807c:     	b	0x10163809c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x20c>
101638080:     	ldr	q0, [x25]
101638084:     	str	q0, [x9]
101638088:     	add	x19, x9, #0x10
10163808c:     	str	x19, [sp, #0x50]
101638090:     	add	x24, x24, #0x10
101638094:     	cmp	x24, #0x30
101638098:     	b.eq	0x101638158 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x2c8>
10163809c:     	add	x25, x26, x24
1016380a0:     	ldr	w8, [x25, #0x8]
1016380a4:     	ldr	w9, [x25]
1016380a8:     	cmp	w8, w9
1016380ac:     	b.le	0x101638090 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x200>
1016380b0:     	ldr	w8, [x25, #0xc]
1016380b4:     	ldr	w9, [x25, #0x4]
1016380b8:     	cmp	w8, w9
1016380bc:     	b.le	0x101638090 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x200>
1016380c0:     	ldp	x9, x8, [sp, #0x50]
1016380c4:     	cmp	x9, x8
1016380c8:     	b.lo	0x101638080 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x1f0>
1016380cc:     	ldr	x21, [sp, #0x48]
1016380d0:     	sub	x22, x9, x21
1016380d4:     	asr	x19, x22, #4
1016380d8:     	add	x9, x19, #0x1
1016380dc:     	lsr	x10, x9, #60
1016380e0:     	cbnz	x10, 0x1016387a4 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x914>
1016380e4:     	sub	x8, x8, x21
1016380e8:     	asr	x10, x8, #3
1016380ec:     	cmp	x10, x9
1016380f0:     	csel	x9, x10, x9, hi
1016380f4:     	cmp	x8, x27
1016380f8:     	csel	x20, x9, x28, lo
1016380fc:     	cbz	x20, 0x101638118 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x288>
101638100:     	lsr	x8, x20, #60
101638104:     	cbnz	x8, 0x1016387b4 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x924>
101638108:     	lsl	x0, x20, #4
10163810c:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
101638110:     	mov	x23, x0
101638114:     	b	0x10163811c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x28c>
101638118:     	mov	x23, #0x0               ; =0
10163811c:     	add	x8, x23, x19, lsl #4
101638120:     	add	x20, x23, x20, lsl #4
101638124:     	ldr	q0, [x25]
101638128:     	str	q0, [x8]
10163812c:     	add	x19, x8, #0x10
101638130:     	mov	x0, x23
101638134:     	mov	x1, x21
101638138:     	mov	x2, x22
10163813c:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
101638140:     	stp	x23, x19, [sp, #0x48]
101638144:     	str	x20, [sp, #0x58]
101638148:     	cbz	x21, 0x10163808c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x1fc>
10163814c:     	mov	x0, x21
101638150:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101638154:     	b	0x10163808c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x1fc>
101638158:     	adrp	x24, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163815c:     	ldr	x26, [x24, #0x988]
101638160:     	adrp	x23, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
101638164:     	cbz	x26, 0x101638190 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x300>
101638168:     	fmov	d0, x26
10163816c:     	cnt.8b	v0, v0
101638170:     	uaddlv.8b	h0, v0
101638174:     	fmov	w22, s0
101638178:     	cmp	x22, #0x1
10163817c:     	ldr	x20, [sp, #0x8]
101638180:     	b.hi	0x10163819c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x30c>
101638184:     	sub	x8, x26, #0x1
101638188:     	and	x10, x8, x20
10163818c:     	b	0x1016381b0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x320>
101638190:     	mov	w21, #0x0               ; =0
101638194:     	ldr	x20, [sp, #0x8]
101638198:     	b	0x10163837c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x4ec>
10163819c:     	mov	x10, x20
1016381a0:     	cmp	x26, x20
1016381a4:     	b.hi	0x1016381b0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x320>
1016381a8:     	udiv	x8, x20, x26
1016381ac:     	msub	x10, x8, x26, x20
1016381b0:     	ldr	x8, [x23, #0x980]
1016381b4:     	ldr	x9, [x8, x10, lsl #3]
1016381b8:     	cbz	x9, 0x1016382e0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x450>
1016381bc:     	ldr	x9, [x9]
1016381c0:     	cbz	x9, 0x1016382e0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x450>
1016381c4:     	sub	x11, x26, #0x1
1016381c8:     	b	0x1016381e0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x350>
1016381cc:     	ldr	x12, [x9, #0x10]
1016381d0:     	cmp	x12, x20
1016381d4:     	b.eq	0x101638218 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x388>
1016381d8:     	ldr	x9, [x9]
1016381dc:     	cbz	x9, 0x1016382e0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x450>
1016381e0:     	ldr	x12, [x9, #0x8]
1016381e4:     	cmp	x12, x20
1016381e8:     	b.eq	0x1016381cc <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x33c>
1016381ec:     	cmp	x22, #0x1
1016381f0:     	b.hi	0x1016381fc <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x36c>
1016381f4:     	and	x12, x12, x11
1016381f8:     	b	0x10163820c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x37c>
1016381fc:     	cmp	x12, x26
101638200:     	b.lo	0x10163820c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x37c>
101638204:     	udiv	x13, x12, x26
101638208:     	msub	x12, x13, x26, x12
10163820c:     	cmp	x12, x10
101638210:     	b.eq	0x1016381d8 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x348>
101638214:     	b	0x1016382e0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x450>
101638218:     	ldr	x10, [x9, #0x18]
10163821c:     	ldr	x11, [sp, #0x10]
101638220:     	cmp	x10, x11
101638224:     	b.ne	0x1016382e0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x450>
101638228:     	ldr	w10, [x9, #0x20]
10163822c:     	ldr	w11, [sp, #0x18]
101638230:     	cmp	w10, w11
101638234:     	b.ne	0x1016382e0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x450>
101638238:     	ldr	x10, [x9, #0x28]
10163823c:     	ldr	x11, [sp, #0x20]
101638240:     	cmp	x10, x11
101638244:     	b.ne	0x1016382e0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x450>
101638248:     	ldr	w10, [x9, #0x30]
10163824c:     	ldr	w11, [sp, #0x28]
101638250:     	cmp	w10, w11
101638254:     	b.ne	0x1016382e0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x450>
101638258:     	ldr	w10, [x9, #0x34]
10163825c:     	ldr	w11, [sp, #0x2c]
101638260:     	cmp	w10, w11
101638264:     	b.ne	0x1016382e0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x450>
101638268:     	ldr	s0, [x9, #0x38]
10163826c:     	ldr	s1, [sp, #0x30]
101638270:     	fcmp	s0, s1
101638274:     	b.ne	0x1016382e0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x450>
101638278:     	ldr	w10, [x9, #0x3c]
10163827c:     	ldr	w11, [sp, #0x34]
101638280:     	cmp	w10, w11
101638284:     	b.ne	0x1016382e0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x450>
101638288:     	ldr	w10, [x9, #0x40]
10163828c:     	ldr	w11, [sp, #0x38]
101638290:     	cmp	w10, w11
101638294:     	b.ne	0x1016382e0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x450>
101638298:     	ldr	w10, [x9, #0x44]
10163829c:     	ldr	w11, [sp, #0x3c]
1016382a0:     	cmp	w10, w11
1016382a4:     	b.ne	0x1016382e0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x450>
1016382a8:     	ldr	w10, [x9, #0x48]
1016382ac:     	ldr	w11, [sp, #0x40]
1016382b0:     	cmp	w10, w11
1016382b4:     	b.ne	0x1016382e0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x450>
1016382b8:     	mov	x19, x8
1016382bc:     	ldp	x0, x1, [x9, #0x50]
1016382c0:     	sub	x8, x1, x0
1016382c4:     	ldp	x2, x9, [sp, #0x48]
1016382c8:     	sub	x9, x9, x2
1016382cc:     	cmp	x8, x9
1016382d0:     	b.ne	0x1016382f8 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x468>
1016382d4:     	bl	0x10164b880 <__ZNSt3__15equalB8ne190102INS_11__wrap_iterIPN7blender2ed4ipad6panels4RectEEES8_ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS9_5ModelEE3$_0EEbT_SI_T0_T1_>
1016382d8:     	mov	x21, x0
1016382dc:     	b	0x1016382fc <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x46c>
1016382e0:     	mov	w21, #0x0               ; =0
1016382e4:     	cmp	x22, #0x1
1016382e8:     	b.hi	0x101638308 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x478>
1016382ec:     	sub	x9, x26, #0x1
1016382f0:     	and	x27, x9, x20
1016382f4:     	b	0x10163831c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x48c>
1016382f8:     	mov	w21, #0x0               ; =0
1016382fc:     	mov	x8, x19
101638300:     	cmp	x22, #0x1
101638304:     	b.ls	0x1016382ec <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x45c>
101638308:     	mov	x27, x20
10163830c:     	cmp	x26, x20
101638310:     	b.hi	0x10163831c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x48c>
101638314:     	udiv	x9, x20, x26
101638318:     	msub	x27, x9, x26, x20
10163831c:     	ldr	x8, [x8, x27, lsl #3]
101638320:     	cbz	x8, 0x10163837c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x4ec>
101638324:     	ldr	x28, [x8]
101638328:     	cbz	x28, 0x10163837c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x4ec>
10163832c:     	sub	x8, x26, #0x1
101638330:     	b	0x101638348 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x4b8>
101638334:     	ldr	x9, [x28, #0x10]
101638338:     	cmp	x9, x20
10163833c:     	b.eq	0x1016385bc <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x72c>
101638340:     	ldr	x28, [x28]
101638344:     	cbz	x28, 0x10163837c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x4ec>
101638348:     	ldr	x9, [x28, #0x8]
10163834c:     	cmp	x9, x20
101638350:     	b.eq	0x101638334 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x4a4>
101638354:     	cmp	x22, #0x1
101638358:     	b.hi	0x101638364 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x4d4>
10163835c:     	and	x9, x9, x8
101638360:     	b	0x101638374 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x4e4>
101638364:     	cmp	x9, x26
101638368:     	b.lo	0x101638374 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x4e4>
10163836c:     	udiv	x10, x9, x26
101638370:     	msub	x9, x10, x26, x9
101638374:     	cmp	x9, x27
101638378:     	b.eq	0x101638340 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x4b0>
10163837c:     	mov	w0, #0x68               ; =104
101638380:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
101638384:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
101638388:     	add	x8, x8, #0x990
10163838c:     	stp	x0, x8, [sp, #0x60]
101638390:     	stp	xzr, x20, [x0]
101638394:     	str	x20, [x0, #0x10]
101638398:     	movi.16b	v0, #0x0
10163839c:     	stur	q0, [x0, #0x18]
1016383a0:     	stur	q0, [x0, #0x28]
1016383a4:     	stur	q0, [x0, #0x38]
1016383a8:     	stur	q0, [x0, #0x48]
1016383ac:     	stur	q0, [x0, #0x58]
1016383b0:     	mov	w9, #0x1                ; =1
1016383b4:     	strb	w9, [sp, #0x70]
1016383b8:     	ldr	x9, [x8, #0x8]
1016383bc:     	add	x9, x9, #0x1
1016383c0:     	ucvtf	s0, x9
1016383c4:     	ldr	s1, [x8, #0x10]
1016383c8:     	cbz	x26, 0x1016383dc <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x54c>
1016383cc:     	ucvtf	s2, x26
1016383d0:     	fmul	s2, s1, s2
1016383d4:     	fcmp	s2, s0
1016383d8:     	b.pl	0x101638624 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x794>
1016383dc:     	lsl	x8, x26, #1
1016383e0:     	sub	x9, x26, #0x1
1016383e4:     	tst	x26, x9
1016383e8:     	cset	w9, eq
1016383ec:     	cmp	x26, #0x3
1016383f0:     	csel	w9, wzr, w9, lo
1016383f4:     	eor	w9, w9, #0x1
1016383f8:     	orr	x8, x8, x9
1016383fc:     	fdiv	s0, s0, s1
101638400:     	fcvtpu	x9, s0
101638404:     	cmp	x8, x9
101638408:     	csel	x22, x8, x9, hi
10163840c:     	subs	x8, x22, #0x1
101638410:     	b.ne	0x10163841c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x58c>
101638414:     	mov	w22, #0x2               ; =2
101638418:     	b	0x101638434 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x5a4>
10163841c:     	tst	x22, x8
101638420:     	b.eq	0x101638434 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x5a4>
101638424:     	mov	x0, x22
101638428:     	bl	0x104b70e80 <_zlibVersion+0x104b70e80>
10163842c:     	mov	x22, x0
101638430:     	ldr	x26, [x24, #0x988]
101638434:     	cmp	x22, x26
101638438:     	b.ls	0x1016384b0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x620>
10163843c:     	lsr	x8, x22, #61
101638440:     	cbnz	x8, 0x1016387c0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x930>
101638444:     	lsl	x0, x22, #3
101638448:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
10163844c:     	mov	x8, x0
101638450:     	ldr	x0, [x23, #0x980]
101638454:     	str	x8, [x23, #0x980]
101638458:     	cbz	x0, 0x101638460 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x5d0>
10163845c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101638460:     	mov	x8, #0x0                ; =0
101638464:     	str	x22, [x24, #0x988]
101638468:     	ldr	x9, [x23, #0x980]
10163846c:     	str	xzr, [x9, x8, lsl #3]
101638470:     	add	x8, x8, #0x1
101638474:     	cmp	x22, x8
101638478:     	b.ne	0x101638468 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x5d8>
10163847c:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
101638480:     	ldr	x9, [x8, #0x990]
101638484:     	cbz	x9, 0x1016385f4 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x764>
101638488:     	ldr	x10, [x9, #0x8]
10163848c:     	fmov	d0, x22
101638490:     	cnt.8b	v0, v0
101638494:     	uaddlv.8b	h0, v0
101638498:     	fmov	w8, s0
10163849c:     	cmp	x8, #0x1
1016384a0:     	b.hi	0x101638510 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x680>
1016384a4:     	sub	x11, x22, #0x1
1016384a8:     	and	x10, x10, x11
1016384ac:     	b	0x101638520 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x690>
1016384b0:     	b.hs	0x1016385f4 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x764>
1016384b4:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
1016384b8:     	add	x8, x8, #0x998
1016384bc:     	ldr	x9, [x8]
1016384c0:     	ucvtf	s0, x9
1016384c4:     	ldr	s1, [x8, #0x8]
1016384c8:     	fdiv	s0, s0, s1
1016384cc:     	fcvtpu	x0, s0
1016384d0:     	cmp	x26, #0x3
1016384d4:     	b.lo	0x1016385c8 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x738>
1016384d8:     	fmov	d0, x26
1016384dc:     	cnt.8b	v0, v0
1016384e0:     	uaddlv.8b	h0, v0
1016384e4:     	fmov	w8, s0
1016384e8:     	cmp	x8, #0x1
1016384ec:     	b.hi	0x1016385c8 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x738>
1016384f0:     	sub	x8, x0, #0x1
1016384f4:     	clz	x8, x8
1016384f8:     	neg	x8, x8
1016384fc:     	mov	w9, #0x1                ; =1
101638500:     	lsl	x8, x9, x8
101638504:     	cmp	x0, #0x2
101638508:     	csel	x0, x0, x8, lo
10163850c:     	b	0x1016385cc <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x73c>
101638510:     	cmp	x10, x22
101638514:     	b.lo	0x101638520 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x690>
101638518:     	udiv	x11, x10, x22
10163851c:     	msub	x10, x11, x22, x10
101638520:     	adrp	x11, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
101638524:     	add	x11, x11, #0x980
101638528:     	ldr	x12, [x11], #0x10
10163852c:     	str	x11, [x12, x10, lsl #3]
101638530:     	ldr	x11, [x9]
101638534:     	cbz	x11, 0x1016385f4 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x764>
101638538:     	sub	x12, x22, #0x1
10163853c:     	b	0x10163857c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x6ec>
101638540:     	ldr	x14, [x11]
101638544:     	str	x14, [x9]
101638548:     	ldr	x14, [x23, #0x980]
10163854c:     	ldr	x14, [x14, x13, lsl #3]
101638550:     	ldr	x14, [x14]
101638554:     	str	x14, [x11]
101638558:     	ldr	x14, [x23, #0x980]
10163855c:     	ldr	x13, [x14, x13, lsl #3]
101638560:     	str	x11, [x13]
101638564:     	mov	x11, x9
101638568:     	mov	x13, x10
10163856c:     	mov	x9, x11
101638570:     	ldr	x11, [x11]
101638574:     	mov	x10, x13
101638578:     	cbz	x11, 0x1016385f4 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x764>
10163857c:     	ldr	x13, [x11, #0x8]
101638580:     	cmp	x8, #0x1
101638584:     	b.hi	0x101638590 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x700>
101638588:     	and	x13, x13, x12
10163858c:     	b	0x1016385a0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x710>
101638590:     	cmp	x13, x22
101638594:     	b.lo	0x1016385a0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x710>
101638598:     	udiv	x14, x13, x22
10163859c:     	msub	x13, x14, x22, x13
1016385a0:     	cmp	x13, x10
1016385a4:     	b.eq	0x101638568 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x6d8>
1016385a8:     	ldr	x14, [x23, #0x980]
1016385ac:     	ldr	x15, [x14, x13, lsl #3]
1016385b0:     	cbnz	x15, 0x101638540 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x6b0>
1016385b4:     	str	x9, [x14, x13, lsl #3]
1016385b8:     	b	0x10163856c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x6dc>
1016385bc:     	ldr	x20, [sp]
1016385c0:     	add	x22, sp, #0x10
1016385c4:     	b	0x1016386b8 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x828>
1016385c8:     	bl	0x104b70e80 <_zlibVersion+0x104b70e80>
1016385cc:     	cmp	x22, x0
1016385d0:     	csel	x22, x22, x0, hi
1016385d4:     	cmp	x22, x26
1016385d8:     	b.hs	0x1016385f4 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x764>
1016385dc:     	cbnz	x22, 0x10163843c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x5ac>
1016385e0:     	ldr	x0, [x23, #0x980]
1016385e4:     	str	xzr, [x23, #0x980]
1016385e8:     	cbz	x0, 0x1016385f0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x760>
1016385ec:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
1016385f0:     	str	xzr, [x24, #0x988]
1016385f4:     	ldr	x26, [x24, #0x988]
1016385f8:     	sub	x8, x26, #0x1
1016385fc:     	tst	x26, x8
101638600:     	b.ne	0x10163860c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x77c>
101638604:     	and	x27, x8, x20
101638608:     	b	0x101638624 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x794>
10163860c:     	cmp	x26, x20
101638610:     	b.ls	0x10163861c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x78c>
101638614:     	mov	x27, x20
101638618:     	b	0x101638624 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x794>
10163861c:     	udiv	x8, x20, x26
101638620:     	msub	x27, x8, x26, x20
101638624:     	ldr	x8, [x23, #0x980]
101638628:     	ldr	x8, [x8, x27, lsl #3]
10163862c:     	ldr	x28, [sp, #0x60]
101638630:     	cbz	x8, 0x101638648 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x7b8>
101638634:     	ldr	x9, [x8]
101638638:     	str	x9, [x28]
10163863c:     	ldr	x20, [sp]
101638640:     	add	x22, sp, #0x10
101638644:     	b	0x1016386a4 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x814>
101638648:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163864c:     	add	x8, x8, #0x980
101638650:     	ldr	x9, [x8, #0x10]!
101638654:     	str	x9, [x28]
101638658:     	str	x28, [x8]
10163865c:     	ldr	x9, [x23, #0x980]
101638660:     	str	x8, [x9, x27, lsl #3]
101638664:     	ldr	x8, [x28]
101638668:     	ldr	x20, [sp]
10163866c:     	add	x22, sp, #0x10
101638670:     	cbz	x8, 0x1016386a8 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x818>
101638674:     	ldr	x8, [x8, #0x8]
101638678:     	sub	x9, x26, #0x1
10163867c:     	tst	x26, x9
101638680:     	b.ne	0x10163868c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x7fc>
101638684:     	and	x8, x8, x9
101638688:     	b	0x10163869c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x80c>
10163868c:     	cmp	x8, x26
101638690:     	b.lo	0x10163869c <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x80c>
101638694:     	udiv	x9, x8, x26
101638698:     	msub	x8, x9, x26, x8
10163869c:     	ldr	x9, [x23, #0x980]
1016386a0:     	add	x8, x9, x8, lsl #3
1016386a4:     	str	x28, [x8]
1016386a8:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
1016386ac:     	ldr	x9, [x8, #0x998]
1016386b0:     	add	x9, x9, #0x1
1016386b4:     	str	x9, [x8, #0x998]
1016386b8:     	ldr	w8, [sp, #0x40]
1016386bc:     	ldp	q1, q0, [sp, #0x20]
1016386c0:     	ldr	q2, [sp, #0x10]
1016386c4:     	mov	x19, x28
1016386c8:     	ldr	x0, [x19, #0x50]!
1016386cc:     	stur	q2, [x19, #-0x38]
1016386d0:     	stur	q1, [x19, #-0x28]
1016386d4:     	stur	q0, [x19, #-0x18]
1016386d8:     	stur	w8, [x19, #-0x8]
1016386dc:     	cbz	x0, 0x1016386f0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x860>
1016386e0:     	str	x0, [x28, #0x58]
1016386e4:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
1016386e8:     	stp	xzr, xzr, [x19]
1016386ec:     	str	xzr, [x19, #0x10]
1016386f0:     	ldur	q0, [sp, #0x48]
1016386f4:     	str	q0, [x28, #0x50]
1016386f8:     	ldr	x8, [sp, #0x58]
1016386fc:     	str	x8, [x28, #0x60]
101638700:     	stp	xzr, xzr, [x22, #0x40]
101638704:     	stur	xzr, [x22, #0x38]
101638708:     	tbnz	w21, #0x0, 0x101638754 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x8c4>
10163870c:     	ldr	x19, [x20, #0x1c0]
101638710:     	cbnz	x19, 0x101638720 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x890>
101638714:     	b	0x101638754 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x8c4>
101638718:     	ldr	x19, [x19]
10163871c:     	cbz	x19, 0x101638744 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x8b4>
101638720:     	ldr	w8, [x19, #0xd8]
101638724:     	cmp	w8, #0x1
101638728:     	b.ne	0x101638718 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x888>
10163872c:     	mov	x0, x19
101638730:     	mov	w1, #0x8                ; =8
101638734:     	bl	0x1003d66c8 <__Z25BKE_area_find_region_typePK7ScrAreai>
101638738:     	cbz	x0, 0x101638718 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x888>
10163873c:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
101638740:     	b	0x101638718 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x888>
101638744:     	ldr	x0, [sp, #0x48]
101638748:     	cbz	x0, 0x101638754 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x8c4>
10163874c:     	str	x0, [sp, #0x50]
101638750:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101638754:     	ldur	x8, [x29, #-0x60]
101638758:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
10163875c:     	ldr	x9, [x9, #0x7f0]
101638760:     	ldr	x9, [x9]
101638764:     	cmp	x9, x8
101638768:     	b.ne	0x1016387bc <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x92c>
10163876c:     	ldp	x29, x30, [sp, #0xf0]
101638770:     	ldp	x20, x19, [sp, #0xe0]
101638774:     	ldp	x22, x21, [sp, #0xd0]
101638778:     	ldp	x24, x23, [sp, #0xc0]
10163877c:     	ldp	x26, x25, [sp, #0xb0]
101638780:     	ldp	x28, x27, [sp, #0xa0]
101638784:     	add	sp, sp, #0x100
101638788:     	ret
10163878c:     	add	x8, sp, #0x10
101638790:     	add	x0, x8, #0x38
101638794:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
101638798:     	b	0x1016387c4 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x934>
10163879c:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
1016387a0:     	b	0x1016387c4 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x934>
1016387a4:     	add	x8, sp, #0x10
1016387a8:     	add	x0, x8, #0x38
1016387ac:     	bl	0x10006bf18 <__ZNKSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB8ne190102Ev>
1016387b0:     	b	0x1016387c4 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x934>
1016387b4:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
1016387b8:     	b	0x1016387c4 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x934>
1016387bc:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
1016387c0:     	bl	0x100067308 <__ZSt28__throw_bad_array_new_lengthB8ne190102v>
1016387c4:     	brk	#0x1
1016387c8:     	mov	x19, x0
1016387cc:     	add	x0, sp, #0x60
1016387d0:     	bl	0x10164b8e8 <__ZNSt3__110unique_ptrINS_11__hash_nodeINS_17__hash_value_typeImN12_GLOBAL__N_113IPadHUDChromeEEEPvEENS_22__hash_node_destructorINS_9allocatorIS7_EEEEED1B8ne190102Ev>
1016387d4:     	b	0x101638804 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x974>
1016387d8:     	b	0x1016387f0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x960>
1016387dc:     	b	0x1016387f0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x960>
1016387e0:     	b	0x1016387f0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x960>
1016387e4:     	b	0x1016387f0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x960>
1016387e8:     	b	0x1016387f8 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x968>
1016387ec:     	b	0x1016387f0 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x960>
1016387f0:     	mov	x19, x0
1016387f4:     	b	0x101638804 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x974>
1016387f8:     	mov	x19, x0
1016387fc:     	add	x0, sp, #0x60
101638800:     	bl	0x1016360b4 <__ZNSt3__16vectorIN12_GLOBAL__N_16ButtonENS_9allocatorIS2_EEED1B8ne190102Ev>
101638804:     	ldr	x0, [sp, #0x48]
101638808:     	cbz	x0, 0x101638814 <__ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS_5ModelE+0x984>
10163880c:     	str	x0, [sp, #0x50]
101638810:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101638814:     	mov	x0, x19
101638818:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
