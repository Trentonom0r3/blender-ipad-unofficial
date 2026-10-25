
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f401b4 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent>:
101f401b4:     	sub	sp, sp, #0x1c0
101f401b8:     	stp	x22, x21, [sp, #0x190]
101f401bc:     	stp	x20, x19, [sp, #0x1a0]
101f401c0:     	stp	x29, x30, [sp, #0x1b0]
101f401c4:     	add	x29, sp, #0x1b0
101f401c8:     	ldrh	w8, [x2, #0x10]
101f401cc:     	cmp	w8, #0x1
101f401d0:     	b.ne	0x101f402a4 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0xf0>
101f401d4:     	ldrh	w8, [x2, #0x12]
101f401d8:     	cmp	w8, #0x2
101f401dc:     	b.ne	0x101f402a4 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0xf0>
101f401e0:     	ldr	x8, [x2, #0x48]
101f401e4:     	cbz	x8, 0x101f402a4 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0xf0>
101f401e8:     	ldr	x8, [x2, #0x50]
101f401ec:     	cbz	x8, 0x101f402a4 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0xf0>
101f401f0:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f401f4:     	ldr	x8, [x8, #0x70]
101f401f8:     	cbz	x8, 0x101f402a4 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0xf0>
101f401fc:     	ldr	x9, [x1, #0x8]
101f40200:     	fmov	d0, x8
101f40204:     	cnt.8b	v0, v0
101f40208:     	uaddlv.8b	h0, v0
101f4020c:     	fmov	w10, s0
101f40210:     	cmp	x10, #0x1
101f40214:     	b.hi	0x101f40224 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x70>
101f40218:     	sub	x11, x8, #0x1
101f4021c:     	and	x11, x11, x9
101f40220:     	b	0x101f40238 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x84>
101f40224:     	mov	x11, x9
101f40228:     	cmp	x9, x8
101f4022c:     	b.lo	0x101f40238 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x84>
101f40230:     	udiv	x11, x9, x8
101f40234:     	msub	x11, x11, x8, x9
101f40238:     	adrp	x12, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f4023c:     	ldr	x12, [x12, #0x68]
101f40240:     	ldr	x12, [x12, x11, lsl #3]
101f40244:     	cbz	x12, 0x101f402a4 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0xf0>
101f40248:     	ldr	x12, [x12]
101f4024c:     	cbz	x12, 0x101f402a4 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0xf0>
101f40250:     	sub	x13, x8, #0x1
101f40254:     	b	0x101f40270 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0xbc>
101f40258:     	ldr	x14, [x12, #0x10]
101f4025c:     	cmp	x14, x9
101f40260:     	b.eq	0x101f402c0 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x10c>
101f40264:     	mov	w19, #0x0               ; =0
101f40268:     	ldr	x12, [x12]
101f4026c:     	cbz	x12, 0x101f402a8 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0xf4>
101f40270:     	ldr	x14, [x12, #0x8]
101f40274:     	cmp	x14, x9
101f40278:     	b.eq	0x101f40258 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0xa4>
101f4027c:     	cmp	x10, #0x1
101f40280:     	b.hi	0x101f4028c <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0xd8>
101f40284:     	and	x14, x14, x13
101f40288:     	b	0x101f4029c <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0xe8>
101f4028c:     	cmp	x14, x8
101f40290:     	b.lo	0x101f4029c <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0xe8>
101f40294:     	udiv	x15, x14, x8
101f40298:     	msub	x14, x15, x8, x14
101f4029c:     	cmp	x14, x11
101f402a0:     	b.eq	0x101f40264 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0xb0>
101f402a4:     	mov	w19, #0x0               ; =0
101f402a8:     	mov	x0, x19
101f402ac:     	ldp	x29, x30, [sp, #0x1b0]
101f402b0:     	ldp	x20, x19, [sp, #0x1a0]
101f402b4:     	ldp	x22, x21, [sp, #0x190]
101f402b8:     	add	sp, sp, #0x1c0
101f402bc:     	ret
101f402c0:     	mov	x20, x1
101f402c4:     	mov	x19, x0
101f402c8:     	mov	x21, x2
101f402cc:     	add	x0, sp, #0x8
101f402d0:     	add	x1, x12, #0x18
101f402d4:     	bl	0x101f368e0 <__ZN14uiIPadHUDFieldC2ERKS_>
101f402d8:     	ldrb	w8, [sp, #0x18d]
101f402dc:     	cmp	w8, #0x1
101f402e0:     	b.ne	0x101f4036c <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x1b8>
101f402e4:     	ldrb	w8, [sp, #0x18e]
101f402e8:     	tbnz	w8, #0x0, 0x101f4036c <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x1b8>
101f402ec:     	ldr	x9, [sp, #0x8]
101f402f0:     	ldr	x10, [x21, #0x48]
101f402f4:     	cmp	x9, x10
101f402f8:     	b.ne	0x101f4036c <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x1b8>
101f402fc:     	ldr	x9, [sp, #0x10]
101f40300:     	ldr	x8, [x21, #0x50]
101f40304:     	cmp	x9, x8
101f40308:     	b.ne	0x101f4036c <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x1b8>
101f4030c:     	mov	x0, x20
101f40310:     	bl	0x101f40e4c <__ZL26ui_ipad_hud_single_numericPK5uiBut>
101f40314:     	cbz	w0, 0x101f4036c <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x1b8>
101f40318:     	add	x1, sp, #0x8
101f4031c:     	mov	x0, x19
101f40320:     	mov	x2, #0x0                ; =0
101f40324:     	mov	w3, #0x1                ; =1
101f40328:     	bl	0x101f2ec10 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b>
101f4032c:     	tbz	w0, #0x0, 0x101f4036c <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x1b8>
101f40330:     	add	x8, sp, #0x8
101f40334:     	adrp	x0, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f40338:     	add	x0, x0, #0x68
101f4033c:     	add	x1, x8, #0x10
101f40340:     	bl	0x101f3677c <__ZNSt3__113unordered_mapIy14uiIPadHUDFieldNS_4hashIyEENS_8equal_toIyEENS_9allocatorINS_4pairIKyS1_EEEEE4findB8ne190102ERS8_>
101f40344:     	cbz	x0, 0x101f4036c <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x1b8>
101f40348:     	ldr	x8, [x0, #0x20]
101f4034c:     	ldr	x9, [sp, #0x10]
101f40350:     	cmp	x8, x9
101f40354:     	b.ne	0x101f4036c <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x1b8>
101f40358:     	mov	w8, #0x1                ; =1
101f4035c:     	strb	w8, [x0, #0x19e]
101f40360:     	ldrb	w8, [x21, #0x7c]
101f40364:     	ubfx	w19, w8, #6, #1
101f40368:     	b	0x101f40370 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x1bc>
101f4036c:     	mov	w19, #0x0               ; =0
101f40370:     	ldrsb	w8, [sp, #0x17f]
101f40374:     	tbnz	w8, #0x1f, 0x101f40394 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x1e0>
101f40378:     	ldrsb	w8, [sp, #0x157]
101f4037c:     	tbnz	w8, #0x1f, 0x101f403a4 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x1f0>
101f40380:     	ldrsb	w8, [sp, #0x127]
101f40384:     	tbnz	w8, #0x1f, 0x101f403b4 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x200>
101f40388:     	ldrsb	w8, [sp, #0xaf]
101f4038c:     	tbz	w8, #0x1f, 0x101f402a8 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0xf4>
101f40390:     	b	0x101f403c4 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x210>
101f40394:     	ldr	x0, [sp, #0x168]
101f40398:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f4039c:     	ldrsb	w8, [sp, #0x157]
101f403a0:     	tbz	w8, #0x1f, 0x101f40380 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x1cc>
101f403a4:     	ldr	x0, [sp, #0x140]
101f403a8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f403ac:     	ldrsb	w8, [sp, #0x127]
101f403b0:     	tbz	w8, #0x1f, 0x101f40388 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x1d4>
101f403b4:     	ldr	x0, [sp, #0x110]
101f403b8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f403bc:     	ldrsb	w8, [sp, #0xaf]
101f403c0:     	tbz	w8, #0x1f, 0x101f402a8 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0xf4>
101f403c4:     	ldr	x0, [sp, #0x98]
101f403c8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f403cc:     	b	0x101f402a8 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0xf4>
101f403d0:     	b	0x101f403d4 <__ZL36ui_ipad_hud_numeric_pointer_terminalP8bContextP5uiButPK7wmEvent+0x220>
101f403d4:     	mov	x19, x0
101f403d8:     	add	x0, sp, #0x8
101f403dc:     	bl	0x101f2f620 <__ZN14uiIPadHUDFieldD1Ev>
101f403e0:     	mov	x0, x19
101f403e4:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
