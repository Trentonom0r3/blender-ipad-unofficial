
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f32184 <__ZL17ui_apply_but_undoP5uiBut>:
101f32184:     	sub	sp, sp, #0x60
101f32188:     	stp	x24, x23, [sp, #0x20]
101f3218c:     	stp	x22, x21, [sp, #0x30]
101f32190:     	stp	x20, x19, [sp, #0x40]
101f32194:     	stp	x29, x30, [sp, #0x50]
101f32198:     	add	x29, sp, #0x50
101f3219c:     	mov	x19, x0
101f321a0:     	bl	0x101f05a30 <__Z26ui_ipad_numbers_but_rebindP5uiBut>
101f321a4:     	cbz	w0, 0x101f324a8 <__ZL17ui_apply_but_undoP5uiBut+0x324>
101f321a8:     	ldrb	w8, [x19, #0x1a]
101f321ac:     	tbz	w8, #0x4, 0x101f324a8 <__ZL17ui_apply_but_undoP5uiBut+0x324>
101f321b0:     	ldr	x8, [x19, #0x420]
101f321b4:     	ldr	x0, [x8, #0x6b0]
101f321b8:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
101f321bc:     	ldrh	w8, [x0, #0xc0]
101f321c0:     	cmp	w8, #0x8
101f321c4:     	b.eq	0x101f324a8 <__ZL17ui_apply_but_undoP5uiBut+0x324>
101f321c8:     	ldrb	w10, [x19, #0x21]
101f321cc:     	add	x8, x19, #0x50
101f321d0:     	ldrb	w9, [x19, #0x67]
101f321d4:     	cmp	w10, #0x4
101f321d8:     	b.ne	0x101f321ec <__ZL17ui_apply_but_undoP5uiBut+0x68>
101f321dc:     	tbnz	w9, #0x7, 0x101f321fc <__ZL17ui_apply_but_undoP5uiBut+0x78>
101f321e0:     	mov	x10, x9
101f321e4:     	cbnz	x10, 0x101f32220 <__ZL17ui_apply_but_undoP5uiBut+0x9c>
101f321e8:     	b	0x101f32204 <__ZL17ui_apply_but_undoP5uiBut+0x80>
101f321ec:     	tbnz	w9, #0x7, 0x101f32218 <__ZL17ui_apply_but_undoP5uiBut+0x94>
101f321f0:     	mov	x10, x9
101f321f4:     	cbnz	x10, 0x101f32220 <__ZL17ui_apply_but_undoP5uiBut+0x9c>
101f321f8:     	b	0x101f3224c <__ZL17ui_apply_but_undoP5uiBut+0xc8>
101f321fc:     	ldr	x10, [x19, #0x58]
101f32200:     	cbnz	x10, 0x101f32220 <__ZL17ui_apply_but_undoP5uiBut+0x9c>
101f32204:     	mov	x0, x19
101f32208:     	bl	0x101f73568 <__Z35ui_but_drawstr_len_without_sep_charPK5uiBut>
101f3220c:     	mov	w8, #0x1                ; =1
101f32210:     	strb	w8, [sp, #0x10]
101f32214:     	b	0x101f32274 <__ZL17ui_apply_but_undoP5uiBut+0xf0>
101f32218:     	ldr	x10, [x19, #0x58]
101f3221c:     	cbz	x10, 0x101f3224c <__ZL17ui_apply_but_undoP5uiBut+0xc8>
101f32220:     	sxtb	w10, w9
101f32224:     	ldp	x11, x12, [x19, #0x50]
101f32228:     	mov	w13, #0x1               ; =1
101f3222c:     	strb	w13, [sp, #0x10]
101f32230:     	cmp	w10, #0x0
101f32234:     	csel	x9, x12, x9, lt
101f32238:     	csel	x8, x11, x8, lt
101f3223c:     	stp	x8, x9, [sp]
101f32240:     	mov	x0, x19
101f32244:     	bl	0x101f73568 <__Z35ui_but_drawstr_len_without_sep_charPK5uiBut>
101f32248:     	b	0x101f32264 <__ZL17ui_apply_but_undoP5uiBut+0xe0>
101f3224c:     	ldr	q0, [x19, #0x170]
101f32250:     	str	q0, [sp]
101f32254:     	mov	w8, #0x1                ; =1
101f32258:     	strb	w8, [sp, #0x10]
101f3225c:     	mov	x0, x19
101f32260:     	bl	0x101f7362c <__Z30ui_but_tip_len_only_first_linePK5uiBut>
101f32264:     	mov	x20, x0
101f32268:     	ldr	x8, [sp, #0x8]
101f3226c:     	cbz	x8, 0x101f32274 <__ZL17ui_apply_but_undoP5uiBut+0xf0>
101f32270:     	cbnz	x20, 0x101f32284 <__ZL17ui_apply_but_undoP5uiBut+0x100>
101f32274:     	adrp	x8, 0x104d51000 <__ZL3hex+0x18534d>
101f32278:     	add	x8, x8, #0xada
101f3227c:     	mov	w20, #0xe               ; =14
101f32280:     	stp	x8, x20, [sp]
101f32284:     	ldr	x1, [x19, #0x1f8]
101f32288:     	cbz	x1, 0x101f322cc <__ZL17ui_apply_but_undoP5uiBut+0x148>
101f3228c:     	ldr	x8, [x19, #0x258]
101f32290:     	adrp	x9, 0x106402000 <__ZTIN3tbb6detail2d19start_forINS1_13blocked_rangeIjEEN7openvdb5v12_04tree12InternalNodeINS8_INS7_8LeafNodeINS6_4math4Vec3IdEELj3EEELj4EEELj5EE13TopologyCopy1INS8_INS8_INS9_INS6_9ValueMaskELj3EEELj4EEELj5EEEEEKNS1_16auto_partitionerEEE>
101f32294:     	add	x9, x9, #0xf00
101f32298:     	ldr	x9, [x9]
101f3229c:     	cmp	x8, x9
101f322a0:     	b.eq	0x101f322cc <__ZL17ui_apply_but_undoP5uiBut+0x148>
101f322a4:     	adrp	x9, 0x106427000 <_rna_enum_object_axis_items+0x80>
101f322a8:     	add	x9, x9, #0xa0
101f322ac:     	ldr	x9, [x9]
101f322b0:     	cmp	x8, x9
101f322b4:     	b.eq	0x101f322cc <__ZL17ui_apply_but_undoP5uiBut+0x148>
101f322b8:     	ldr	x8, [x19, #0x420]
101f322bc:     	ldr	x0, [x8, #0x6b0]
101f322c0:     	add	x2, x19, #0x1f8
101f322c4:     	bl	0x10166201c <__Z41ED_undo_is_legacy_compatible_for_propertyP8bContextP2IDR10PointerRNA>
101f322c8:     	cbz	w0, 0x101f322dc <__ZL17ui_apply_but_undoP5uiBut+0x158>
101f322cc:     	ldr	x8, [x19, #0x420]
101f322d0:     	ldr	x0, [x8, #0x6b0]
101f322d4:     	bl	0x100371a1c <__Z37BKE_paintmode_get_active_from_contextPK8bContext>
101f322d8:     	cbnz	w0, 0x101f322e8 <__ZL17ui_apply_but_undoP5uiBut+0x164>
101f322dc:     	adrp	x8, 0x104b94000 <_zlibVersion+0x104b94000>
101f322e0:     	add	x8, x8, #0x314
101f322e4:     	stp	x8, xzr, [sp]
101f322e8:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101f322ec:     	add	x8, x8, #0x6d0
101f322f0:     	ldr	x8, [x8]
101f322f4:     	adrp	x2, 0x104d51000 <__ZL3hex+0x18534d>
101f322f8:     	add	x2, x2, #0x8be
101f322fc:     	mov	w0, #0x5d8              ; =1496
101f32300:     	mov	w1, #0x8                ; =8
101f32304:     	mov	w3, #0x1                ; =1
101f32308:     	blr	x8
101f3230c:     	mov	x21, x0
101f32310:     	add	x22, x0, #0x3b0
101f32314:     	mov	w1, #0x5c0              ; =1472
101f32318:     	bl	0x104b71840 <_zlibVersion+0x104b71840>
101f3231c:     	str	x22, [x21, #0x398]
101f32320:     	str	x22, [x21, #0x3a0]
101f32324:     	add	x8, x21, #0x3d0
101f32328:     	str	x8, [x21, #0x3a8]
101f3232c:     	add	x8, x21, #0x3e8
101f32330:     	add	x9, x21, #0x418
101f32334:     	movi.16b	v0, #0x0
101f32338:     	str	q0, [x21, #0x530]
101f3233c:     	strb	wzr, [x21, #0x540]
101f32340:     	str	xzr, [x21, #0x5c0]
101f32344:     	str	xzr, [x21, #0x5d0]
101f32348:     	str	xzr, [x21, #0x5c8]
101f3234c:     	stp	q0, q0, [x8]
101f32350:     	stur	q0, [x8, #0x1e]
101f32354:     	stp	q0, q0, [x9]
101f32358:     	stp	q0, q0, [x9, #0x20]
101f3235c:     	stp	q0, q0, [x9, #0x40]
101f32360:     	stp	q0, q0, [x9, #0x60]
101f32364:     	stp	q0, q0, [x9, #0x80]
101f32368:     	stp	q0, q0, [x9, #0xa0]
101f3236c:     	stp	q0, q0, [x9, #0xc0]
101f32370:     	strh	wzr, [x21, #0x4f8]
101f32374:     	adrp	x0, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f32378:     	add	x0, x0, #0x2d8
101f3237c:     	mov	x1, x21
101f32380:     	bl	0x10078fe38 <__Z11BLI_addtailP8ListBasePv>
101f32384:     	ldr	x8, [x19, #0x420]
101f32388:     	add	x9, x21, #0xe8
101f3238c:     	ldp	q0, q1, [x8, #0x3b0]
101f32390:     	ldp	q2, q3, [x8, #0x3d0]
101f32394:     	stp	q2, q3, [x9, #0x20]
101f32398:     	stur	q1, [x21, #0xf8]
101f3239c:     	stur	q0, [x21, #0xe8]
101f323a0:     	ldp	q0, q1, [x8, #0x3f0]
101f323a4:     	ldr	q2, [x8, #0x410]
101f323a8:     	ldr	q3, [x8, #0x420]
101f323ac:     	stp	q2, q3, [x9, #0x60]
101f323b0:     	stp	q0, q1, [x9, #0x40]
101f323b4:     	ldr	q0, [x8, #0x430]
101f323b8:     	ldr	q1, [x8, #0x440]
101f323bc:     	ldr	q2, [x8, #0x450]
101f323c0:     	ldrb	w8, [x8, #0x460]
101f323c4:     	strb	w8, [x21, #0x198]
101f323c8:     	stp	q1, q2, [x9, #0x90]
101f323cc:     	str	q0, [x9, #0x80]
101f323d0:     	add	x22, x19, #0x268
101f323d4:     	add	x23, x21, #0x3e0
101f323d8:     	ldr	q0, [x22]
101f323dc:     	str	q0, [x21, #0x3e0]
101f323e0:     	ldp	q0, q1, [x22, #0x10]
101f323e4:     	ldp	q2, q3, [x22, #0x30]
101f323e8:     	str	q3, [x21, #0x420]
101f323ec:     	str	q2, [x21, #0x410]
101f323f0:     	stp	q0, q1, [x21, #0x3f0]
101f323f4:     	ldp	q0, q1, [x22, #0x50]
101f323f8:     	ldr	q2, [x22, #0x70]
101f323fc:     	ldr	x8, [x19, #0x2e8]
101f32400:     	str	x8, [x21, #0x460]
101f32404:     	str	q2, [x21, #0x450]
101f32408:     	str	q1, [x21, #0x440]
101f3240c:     	str	q0, [x21, #0x430]
101f32410:     	add	x0, x21, #0x468
101f32414:     	add	x1, x19, #0x2f0
101f32418:     	bl	0x104b70f64 <_zlibVersion+0x104b70f64>
101f3241c:     	add	x0, x21, #0x480
101f32420:     	add	x1, x19, #0x308
101f32424:     	bl	0x104b70f64 <_zlibVersion+0x104b70f64>
101f32428:     	add	x0, x21, #0x498
101f3242c:     	add	x1, x19, #0x320
101f32430:     	bl	0x104b70f64 <_zlibVersion+0x104b70f64>
101f32434:     	add	x0, x21, #0x4b0
101f32438:     	add	x1, x19, #0x338
101f3243c:     	bl	0x104b70f64 <_zlibVersion+0x104b70f64>
101f32440:     	cmp	x23, x22
101f32444:     	b.eq	0x101f32474 <__ZL17ui_apply_but_undoP5uiBut+0x2f0>
101f32448:     	ldr	x1, [x19, #0x350]
101f3244c:     	ldr	x2, [x19, #0x358]
101f32450:     	sub	x8, x2, x1
101f32454:     	asr	x8, x8, #3
101f32458:     	mov	x9, #0x8e39             ; =36409
101f3245c:     	movk	x9, #0x38e3, lsl #16
101f32460:     	movk	x9, #0xe38e, lsl #32
101f32464:     	movk	x9, #0x8e38, lsl #48
101f32468:     	mul	x3, x8, x9
101f3246c:     	add	x0, x21, #0x4c8
101f32470:     	bl	0x101f19d2c <__ZNSt3__16vectorI17uiIPadRNAPathStepNS_9allocatorIS1_EEE18__assign_with_sizeB8ne190102IPS1_S6_EEvT_T0_l>
101f32474:     	add	x8, x21, #0x4e0
101f32478:     	add	x9, x19, #0x368
101f3247c:     	ldr	q0, [x9]
101f32480:     	ldur	q1, [x9, #0xa]
101f32484:     	stur	q1, [x8, #0xa]
101f32488:     	str	q0, [x21, #0x4e0]
101f3248c:     	add	x8, x20, #0x1
101f32490:     	cmp	x8, #0x40
101f32494:     	mov	w8, #0x40               ; =64
101f32498:     	csinc	x2, x8, x20, hs
101f3249c:     	mov	x0, sp
101f324a0:     	add	x1, x21, #0x580
101f324a4:     	bl	0x10081cb24 <__ZNK7blender13StringRefBase19copy_utf8_truncatedEPcx>
101f324a8:     	ldp	x29, x30, [sp, #0x50]
101f324ac:     	ldp	x20, x19, [sp, #0x40]
101f324b0:     	ldp	x22, x21, [sp, #0x30]
101f324b4:     	ldp	x24, x23, [sp, #0x20]
101f324b8:     	add	sp, sp, #0x60
101f324bc:     	ret
