
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001000b4230 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv>:
1000b4230:     	stp	x28, x27, [sp, #-0x40]!
1000b4234:     	stp	x22, x21, [sp, #0x10]
1000b4238:     	stp	x20, x19, [sp, #0x20]
1000b423c:     	stp	x29, x30, [sp, #0x30]
1000b4240:     	add	x29, sp, #0x30
1000b4244:     	sub	sp, sp, #0x240
1000b4248:     	mov	x19, x3
1000b424c:     	adrp	x8, 0x106369000 <_zlibVersion+0x106369000>
1000b4250:     	ldr	x8, [x8, #0x7f8]
1000b4254:     	ldr	x8, [x8]
1000b4258:     	stur	x8, [x29, #-0x38]
1000b425c:     	cbz	x0, 0x1000b4268 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv+0x38>
1000b4260:     	ldr	x8, [x0, #0x88]
1000b4264:     	cbnz	x8, 0x1000b42a4 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv+0x74>
1000b4268:     	bl	0x10082cd6c <__Z18BLI_thread_is_mainv>
1000b426c:     	cmp	w0, #0x0
1000b4270:     	csel	x0, xzr, x19, eq
1000b4274:     	ldur	x8, [x29, #-0x38]
1000b4278:     	adrp	x9, 0x106369000 <_zlibVersion+0x106369000>
1000b427c:     	ldr	x9, [x9, #0x7f8]
1000b4280:     	ldr	x9, [x9]
1000b4284:     	cmp	x9, x8
1000b4288:     	b.ne	0x1000b43c0 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv+0x190>
1000b428c:     	add	sp, sp, #0x240
1000b4290:     	ldp	x29, x30, [sp, #0x30]
1000b4294:     	ldp	x20, x19, [sp, #0x20]
1000b4298:     	ldp	x22, x21, [sp, #0x10]
1000b429c:     	ldp	x28, x27, [sp], #0x40
1000b42a0:     	ret
1000b42a4:     	mov	x20, x2
1000b42a8:     	movi.16b	v0, #0x0
1000b42ac:     	stp	q0, q0, [sp, #0x50]
1000b42b0:     	add	x8, sp, #0x20
1000b42b4:     	add	x9, x8, #0x30
1000b42b8:     	stp	q0, q0, [sp, #0x30]
1000b42bc:     	str	q0, [sp, #0x20]
1000b42c0:     	add	x10, x8, #0x50
1000b42c4:     	stp	x9, x9, [sp, #0x38]
1000b42c8:     	str	x10, [sp, #0x48]
1000b42cc:     	add	x9, x8, #0x70
1000b42d0:     	stp	xzr, x9, [sp, #0x70]
1000b42d4:     	add	x8, x8, #0x1d0
1000b42d8:     	stp	x9, x8, [sp, #0x80]
1000b42dc:     	str	xzr, [sp, #0x1f8]
1000b42e0:     	str	wzr, [sp, #0x200]
1000b42e4:     	adrp	x8, 0x104b98000 <_zlibVersion+0x104b98000>
1000b42e8:     	add	x8, x8, #0x94
1000b42ec:     	str	x8, [sp, #0x208]
1000b42f0:     	str	xzr, [sp, #0x210]
1000b42f4:     	strb	wzr, [sp, #0x218]
1000b42f8:     	strb	wzr, [sp, #0x220]
1000b42fc:     	str	xzr, [sp, #0x228]
1000b4300:     	strh	wzr, [sp, #0x230]
1000b4304:     	add	x2, sp, #0x20
1000b4308:     	mov	x22, x1
1000b430c:     	bl	0x1014fdf74 <__Z22BPY_context_member_getP8bContextPKcP18bContextDataResult>
1000b4310:     	ldr	x8, [sp, #0x30]
1000b4314:     	cmp	x8, #0x0
1000b4318:     	csel	w8, wzr, w0, eq
1000b431c:     	cmp	w8, #0x1
1000b4320:     	b.ne	0x1000b43b4 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv+0x184>
1000b4324:     	ldr	x0, [sp, #0x28]
1000b4328:     	mov	x1, x20
1000b432c:     	bl	0x101251798 <__Z15RNA_struct_is_aPK9StructRNAS1_>
1000b4330:     	tbz	w0, #0x0, 0x1000b4348 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv+0x118>
1000b4334:     	ldr	x19, [sp, #0x30]
1000b4338:     	add	x0, sp, #0x20
1000b433c:     	bl	0x1000b2680 <__ZN18bContextDataResultD1Ev>
1000b4340:     	mov	x0, x19
1000b4344:     	b	0x1000b4274 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv+0x44>
1000b4348:     	adrp	x21, 0x106629000 <_IDType_ID_GR+0x38>
1000b434c:     	ldr	x8, [x21, #0xf88]
1000b4350:     	cbnz	x8, 0x1000b4364 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv+0x134>
1000b4354:     	adrp	x0, 0x106629000 <_IDType_ID_GR+0x38>
1000b4358:     	add	x0, x0, #0xf80
1000b435c:     	bl	0x100ae3834 <__Z15CLG_logref_initP10CLG_LogRef>
1000b4360:     	ldr	x8, [x21, #0xf88]
1000b4364:     	str	x8, [sp, #0x18]
1000b4368:     	ldr	w8, [x8, #0x50]
1000b436c:     	cmp	w8, #0x2
1000b4370:     	b.lt	0x1000b43b4 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv+0x184>
1000b4374:     	ldr	x0, [sp, #0x28]
1000b4378:     	bl	0x101251654 <__Z21RNA_struct_identifierPK9StructRNA>
1000b437c:     	mov	x21, x0
1000b4380:     	mov	x0, x20
1000b4384:     	bl	0x101251654 <__Z21RNA_struct_identifierPK9StructRNA>
1000b4388:     	adrp	x2, 0x104b84000 <_zlibVersion+0x104b84000>
1000b438c:     	add	x2, x2, #0x536
1000b4390:     	stp	x21, x0, [sp, #0x8]
1000b4394:     	adrp	x3, 0x104b84000 <_zlibVersion+0x104b84000>
1000b4398:     	add	x3, x3, #0x566
1000b439c:     	adrp	x4, 0x104b84000 <_zlibVersion+0x104b84000>
1000b43a0:     	add	x4, x4, #0x580
1000b43a4:     	str	x22, [sp]
1000b43a8:     	ldr	x0, [sp, #0x18]
1000b43ac:     	mov	w1, #0x2                ; =2
1000b43b0:     	bl	0x100ae2b58 <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
1000b43b4:     	add	x0, sp, #0x20
1000b43b8:     	bl	0x1000b2680 <__ZN18bContextDataResultD1Ev>
1000b43bc:     	b	0x1000b4268 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv+0x38>
1000b43c0:     	bl	0x104b7534c <_zlibVersion+0x104b7534c>
1000b43c4:     	b	0x1000b43c8 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv+0x198>
1000b43c8:     	mov	x19, x0
1000b43cc:     	add	x0, sp, #0x20
1000b43d0:     	bl	0x1000b2680 <__ZN18bContextDataResultD1Ev>
1000b43d4:     	mov	x0, x19
1000b43d8:     	bl	0x104b72c1c <_zlibVersion+0x104b72c1c>
1000b43dc:     	bl	0x104b72c1c <_zlibVersion+0x104b72c1c>
