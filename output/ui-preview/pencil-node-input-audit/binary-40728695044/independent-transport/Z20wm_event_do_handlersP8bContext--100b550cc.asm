
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b550cc <__Z20wm_event_do_handlersP8bContext>:
100b550cc:     	stp	x28, x27, [sp, #-0x60]!
100b550d0:     	stp	x26, x25, [sp, #0x10]
100b550d4:     	stp	x24, x23, [sp, #0x20]
100b550d8:     	stp	x22, x21, [sp, #0x30]
100b550dc:     	stp	x20, x19, [sp, #0x40]
100b550e0:     	stp	x29, x30, [sp, #0x50]
100b550e4:     	add	x29, sp, #0x50
100b550e8:     	sub	sp, sp, #0x210
100b550ec:     	mov	x19, x0
100b550f0:     	adrp	x8, 0x106369000 <_zlibVersion+0x106369000>
100b550f4:     	ldr	x8, [x8, #0x7f8]
100b550f8:     	ldr	x8, [x8]
100b550fc:     	stur	x8, [x29, #-0x68]
100b55100:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b55104:     	mov	x20, x0
100b55108:     	bl	0x1008f20d0 <__Z16GPU_render_beginv>
100b5510c:     	mov	x0, x20
100b55110:     	bl	0x100b7541c <__Z19WM_keyconfig_updateP15wmWindowManager>
100b55114:     	mov	x0, x19
100b55118:     	bl	0x1000b4c78 <__Z13CTX_data_mainPK8bContext>
100b5511c:     	bl	0x100b40d14 <__Z21WM_gizmoconfig_updateP4Main>
100b55120:     	str	x20, [sp, #0x28]
100b55124:     	ldr	x21, [x20, #0x1a0]
100b55128:     	cbz	x21, 0x100b56da8 <__Z20wm_event_do_handlersP8bContext+0x1cdc>
100b5512c:     	adrp	x0, 0x106d8a000 <__PyRuntime+0x27ff8>
100b55130:     	add	x0, x0, #0xc20
100b55134:     	ldr	x8, [x0]
100b55138:     	blr	x8
100b5513c:     	str	x0, [sp, #0x10]
100b55140:     	mov	x0, x21
100b55144:     	bl	0x104a61074 <__Z27WM_window_get_active_screenPK8wmWindow>
100b55148:     	cbz	x0, 0x100b56d4c <__Z20wm_event_do_handlersP8bContext+0x1c80>
100b5514c:     	ldr	x0, [x21, #0x168]
100b55150:     	ldr	x26, [x0]
100b55154:     	cbz	x26, 0x100b56c34 <__Z20wm_event_do_handlersP8bContext+0x1b68>
100b55158:     	ldrb	w8, [x26, #0x78]
100b5515c:     	cmp	w8, #0x1
100b55160:     	b.ne	0x100b551c4 <__Z20wm_event_do_handlersP8bContext+0xf8>
100b55164:     	ldr	x10, [x26, #0x58]
100b55168:     	cbz	x10, 0x100b551c4 <__Z20wm_event_do_handlersP8bContext+0xf8>
100b5516c:     	ldrb	w9, [x26, #0x79]
100b55170:     	sub	w8, w9, #0x2
100b55174:     	cmp	w8, #0x2
100b55178:     	b.hi	0x100b551c4 <__Z20wm_event_do_handlersP8bContext+0xf8>
100b5517c:     	mov	x8, x0
100b55180:     	ldr	x11, [x8, #0x40]!
100b55184:     	cmp	x11, x10
100b55188:     	b.ne	0x100b551c4 <__Z20wm_event_do_handlersP8bContext+0xf8>
100b5518c:     	ldr	x10, [x0, #0x48]
100b55190:     	ldr	x11, [x26, #0x60]
100b55194:     	cmp	x10, x11
100b55198:     	b.ne	0x100b551c4 <__Z20wm_event_do_handlersP8bContext+0xf8>
100b5519c:     	cmp	w9, #0x4
100b551a0:     	b.ne	0x100b551ac <__Z20wm_event_do_handlersP8bContext+0xe0>
100b551a4:     	stp	xzr, xzr, [x8]
100b551a8:     	ldr	x0, [x21, #0x168]
100b551ac:     	mov	x1, x26
100b551b0:     	bl	0x10078fea0 <__Z11BLI_remlinkP8ListBasePv>
100b551b4:     	mov	x0, x21
100b551b8:     	mov	x1, x26
100b551bc:     	bl	0x100b56fac <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent>
100b551c0:     	b	0x100b5514c <__Z20wm_event_do_handlersP8bContext+0x80>
100b551c4:     	ldrb	w8, [x21, #0xdc]
100b551c8:     	cbz	w8, 0x100b55290 <__Z20wm_event_do_handlersP8bContext+0x1c4>
100b551cc:     	ldrh	w8, [x26, #0x12]
100b551d0:     	cmp	w8, #0x1
100b551d4:     	b.ne	0x100b553c8 <__Z20wm_event_do_handlersP8bContext+0x2fc>
100b551d8:     	ldrb	w8, [x26, #0x7c]
100b551dc:     	tbnz	w8, #0x1, 0x100b553c8 <__Z20wm_event_do_handlersP8bContext+0x2fc>
100b551e0:     	ldrh	w8, [x26, #0x10]
100b551e4:     	cmp	w8, #0x13
100b551e8:     	mov	w9, #0x1                ; =1
100b551ec:     	lsl	w9, w9, w8
100b551f0:     	mov	w10, #0x18e             ; =398
100b551f4:     	movk	w10, #0xc, lsl #16
100b551f8:     	and	w9, w9, w10
100b551fc:     	ccmp	w9, #0x0, #0x4, ls
100b55200:     	b.eq	0x100b553a4 <__Z20wm_event_do_handlersP8bContext+0x2d8>
100b55204:     	ldrh	w8, [x26, #0x9c]
100b55208:     	mov	w9, #0x1                ; =1
100b5520c:     	str	w9, [sp, #0x24]
100b55210:     	cmp	w8, #0x13
100b55214:     	b.hi	0x100b553d0 <__Z20wm_event_do_handlersP8bContext+0x304>
100b55218:     	mov	w9, #0x1                ; =1
100b5521c:     	lsl	w8, w9, w8
100b55220:     	mov	w9, #0x18e              ; =398
100b55224:     	movk	w9, #0xc, lsl #16
100b55228:     	tst	w8, w9
100b5522c:     	b.eq	0x100b553d0 <__Z20wm_event_do_handlersP8bContext+0x304>
100b55230:     	ldr	x8, [x21, #0xf8]
100b55234:     	cbz	x8, 0x100b55298 <__Z20wm_event_do_handlersP8bContext+0x1cc>
100b55238:     	ldr	q0, [x8]
100b5523c:     	str	q0, [sp, #0x30]
100b55240:     	ldp	w20, w22, [x8, #0x14]
100b55244:     	ldur	x25, [x8, #0x1c]
100b55248:     	ldur	q0, [x8, #0x25]
100b5524c:     	ldur	q1, [x8, #0x35]
100b55250:     	stp	q0, q1, [sp, #0x120]
100b55254:     	ldr	w9, [x8, #0x44]
100b55258:     	add	x10, sp, #0x120
100b5525c:     	stur	w9, [x10, #0x1f]
100b55260:     	ldur	q0, [x8, #0x58]
100b55264:     	ldur	q1, [x8, #0x68]
100b55268:     	stp	q0, q1, [sp, #0x50]
100b5526c:     	ldr	w9, [x8, #0x78]
100b55270:     	str	w9, [sp, #0x70]
100b55274:     	ldr	w24, [x8, #0x84]
100b55278:     	ldr	w23, [x8, #0x90]
100b5527c:     	ldr	w9, [x8, #0xac]
100b55280:     	stur	w9, [x29, #-0x70]
100b55284:     	ldur	q0, [x8, #0x9c]
100b55288:     	stur	q0, [x29, #-0x80]
100b5528c:     	b	0x100b552d0 <__Z20wm_event_do_handlersP8bContext+0x204>
100b55290:     	str	wzr, [sp, #0x24]
100b55294:     	b	0x100b553d0 <__Z20wm_event_do_handlersP8bContext+0x304>
100b55298:     	mov	w23, #0x0               ; =0
100b5529c:     	mov	w20, #0x0               ; =0
100b552a0:     	mov	w22, #0x0               ; =0
100b552a4:     	mov	x25, #0x0               ; =0
100b552a8:     	mov	w24, #0x0               ; =0
100b552ac:     	stp	xzr, xzr, [sp, #0x30]
100b552b0:     	movi.16b	v0, #0x0
100b552b4:     	stp	q0, q0, [sp, #0x120]
100b552b8:     	add	x8, sp, #0x120
100b552bc:     	stur	wzr, [x8, #0x1f]
100b552c0:     	stp	q0, q0, [sp, #0x50]
100b552c4:     	str	wzr, [sp, #0x70]
100b552c8:     	stp	xzr, xzr, [x29, #-0x80]
100b552cc:     	stur	wzr, [x29, #-0x70]
100b552d0:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b552d4:     	add	x8, x8, #0x760
100b552d8:     	ldr	x8, [x8]
100b552dc:     	mov	w0, #0x1                ; =1
100b552e0:     	mov	w1, #0xb0               ; =176
100b552e4:     	mov	w2, #0x8                ; =8
100b552e8:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b552ec:     	add	x3, x3, #0xa9d
100b552f0:     	blr	x8
100b552f4:     	mov	x26, x0
100b552f8:     	ldr	q0, [sp, #0x30]
100b552fc:     	str	q0, [x0]
100b55300:     	mov	w8, #0x4                ; =4
100b55304:     	stp	w8, w20, [x0, #0x10]
100b55308:     	str	w22, [x0, #0x18]
100b5530c:     	stur	x25, [x0, #0x1c]
100b55310:     	strb	wzr, [x0, #0x24]
100b55314:     	ldp	q0, q1, [sp, #0x120]
100b55318:     	stur	q0, [x0, #0x25]
100b5531c:     	stur	q1, [x0, #0x35]
100b55320:     	add	x8, sp, #0x120
100b55324:     	ldur	w8, [x8, #0x1f]
100b55328:     	str	w8, [x0, #0x44]
100b5532c:     	stp	xzr, xzr, [x0, #0x48]
100b55330:     	ldp	q0, q1, [sp, #0x50]
100b55334:     	ldr	w8, [sp, #0x70]
100b55338:     	str	w8, [x0, #0x78]
100b5533c:     	stur	q1, [x0, #0x68]
100b55340:     	stur	q0, [x0, #0x58]
100b55344:     	mov	x25, x0
100b55348:     	str	xzr, [x25, #0x7c]!
100b5534c:     	str	w24, [x0, #0x84]
100b55350:     	str	xzr, [x0, #0x88]
100b55354:     	stp	w23, w20, [x0, #0x90]
100b55358:     	str	w22, [x0, #0x98]
100b5535c:     	ldur	q0, [x29, #-0x80]
100b55360:     	stur	q0, [x0, #0x9c]
100b55364:     	ldur	w8, [x29, #-0x70]
100b55368:     	str	w8, [x0, #0xac]
100b5536c:     	ldr	x0, [x21, #0x168]
100b55370:     	mov	x1, x26
100b55374:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b55378:     	ldr	x0, [x21, #0x168]
100b5537c:     	mov	x1, x26
100b55380:     	bl	0x10078fea0 <__Z11BLI_remlinkP8ListBasePv>
100b55384:     	ldr	x0, [x21, #0x168]
100b55388:     	mov	x1, x26
100b5538c:     	bl	0x10078fe48 <__Z11BLI_addheadP8ListBasePv>
100b55390:     	ldr	w8, [x25]
100b55394:     	orr	w8, w8, #0x8
100b55398:     	str	w8, [x25]
100b5539c:     	ldrb	w8, [x21, #0xdc]
100b553a0:     	b	0x100b553cc <__Z20wm_event_do_handlersP8bContext+0x300>
100b553a4:     	sub	w9, w8, #0x191
100b553a8:     	cmp	w9, #0x30
100b553ac:     	b.lo	0x100b55204 <__Z20wm_event_do_handlersP8bContext+0x138>
100b553b0:     	sub	w9, w8, #0x20
100b553b4:     	cmp	w9, #0xe0
100b553b8:     	b.lo	0x100b55204 <__Z20wm_event_do_handlersP8bContext+0x138>
100b553bc:     	sub	w8, w8, #0x12c
100b553c0:     	cmp	w8, #0x17
100b553c4:     	b.ls	0x100b55204 <__Z20wm_event_do_handlersP8bContext+0x138>
100b553c8:     	mov	w8, #0x1                ; =1
100b553cc:     	str	w8, [sp, #0x24]
100b553d0:     	mov	x0, x26
100b553d4:     	bl	0x100b4d2ac <__Z33WM_event_consecutive_gesture_testPK7wmEvent>
100b553d8:     	ldrh	w8, [x21, #0xde]
100b553dc:     	cbz	w8, 0x100b553fc <__Z20wm_event_do_handlersP8bContext+0x330>
100b553e0:     	ldrh	w9, [x26, #0x10]
100b553e4:     	cmp	w9, w8
100b553e8:     	b.ne	0x100b554a8 <__Z20wm_event_do_handlersP8bContext+0x3dc>
100b553ec:     	ldr	w8, [x26, #0x7c]
100b553f0:     	orr	w8, w8, #0x4
100b553f4:     	str	w8, [x26, #0x7c]
100b553f8:     	b	0x100b55550 <__Z20wm_event_do_handlersP8bContext+0x484>
100b553fc:     	cbz	w0, 0x100b55550 <__Z20wm_event_do_handlersP8bContext+0x484>
100b55400:     	adrp	x8, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b55404:     	add	x8, x8, #0x2a0
100b55408:     	ldr	x8, [x8]
100b5540c:     	ldr	x0, [x8, #0x8]
100b55410:     	cbnz	x0, 0x100b5542c <__Z20wm_event_do_handlersP8bContext+0x360>
100b55414:     	mov	x0, x8
100b55418:     	bl	0x100ae3834 <__Z15CLG_logref_initP10CLG_LogRef>
100b5541c:     	adrp	x8, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b55420:     	add	x8, x8, #0x2a0
100b55424:     	ldr	x8, [x8]
100b55428:     	ldr	x0, [x8, #0x8]
100b5542c:     	ldr	w8, [x0, #0x50]
100b55430:     	cmp	w8, #0x4
100b55434:     	b.lt	0x100b55460 <__Z20wm_event_do_handlersP8bContext+0x394>
100b55438:     	ldrsh	x8, [x26, #0x10]
100b5543c:     	str	x8, [sp]
100b55440:     	mov	w1, #0x4                ; =4
100b55444:     	adrp	x2, 0x104bd4000 <__ZL3hex+0x45cd>
100b55448:     	add	x2, x2, #0x4de
100b5544c:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b55450:     	add	x3, x3, #0x4aa
100b55454:     	adrp	x4, 0x104bd4000 <__ZL3hex+0x45cd>
100b55458:     	add	x4, x4, #0x51a
100b5545c:     	bl	0x100ae2b58 <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b55460:     	ldrh	w8, [x26, #0x10]
100b55464:     	strh	w8, [x21, #0xde]
100b55468:     	ldr	w8, [x26, #0x14]
100b5546c:     	str	w8, [x21, #0xe0]
100b55470:     	ldr	w8, [x26, #0x18]
100b55474:     	str	w8, [x21, #0xe4]
100b55478:     	ldr	x20, [x21, #0xe8]
100b5547c:     	cbz	x20, 0x100b55550 <__Z20wm_event_do_handlersP8bContext+0x484>
100b55480:     	ldr	x0, [x20]
100b55484:     	cbz	x0, 0x100b5548c <__Z20wm_event_do_handlersP8bContext+0x3c0>
100b55488:     	bl	0x100ae4298 <_MEM_freeN>
100b5548c:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b55490:     	add	x8, x8, #0x710
100b55494:     	ldr	x8, [x8]
100b55498:     	mov	x0, x20
100b5549c:     	mov	w1, #0x0                ; =0
100b554a0:     	blr	x8
100b554a4:     	b	0x100b5554c <__Z20wm_event_do_handlersP8bContext+0x480>
100b554a8:     	tbnz	w0, #0x0, 0x100b554bc <__Z20wm_event_do_handlersP8bContext+0x3f0>
100b554ac:     	mov	x0, x21
100b554b0:     	mov	x1, x26
100b554b4:     	bl	0x100b4d2c4 <__Z39WM_event_consecutive_gesture_test_breakPK8wmWindowPK7wmEvent>
100b554b8:     	cbz	w0, 0x100b55550 <__Z20wm_event_do_handlersP8bContext+0x484>
100b554bc:     	adrp	x8, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b554c0:     	add	x8, x8, #0x2a0
100b554c4:     	ldr	x8, [x8]
100b554c8:     	ldr	x0, [x8, #0x8]
100b554cc:     	cbnz	x0, 0x100b554e8 <__Z20wm_event_do_handlersP8bContext+0x41c>
100b554d0:     	mov	x0, x8
100b554d4:     	bl	0x100ae3834 <__Z15CLG_logref_initP10CLG_LogRef>
100b554d8:     	adrp	x8, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b554dc:     	add	x8, x8, #0x2a0
100b554e0:     	ldr	x8, [x8]
100b554e4:     	ldr	x0, [x8, #0x8]
100b554e8:     	ldr	w8, [x0, #0x50]
100b554ec:     	cmp	w8, #0x4
100b554f0:     	b.lt	0x100b5551c <__Z20wm_event_do_handlersP8bContext+0x450>
100b554f4:     	ldrsh	x8, [x26, #0x10]
100b554f8:     	str	x8, [sp]
100b554fc:     	mov	w1, #0x4                ; =4
100b55500:     	adrp	x2, 0x104bd4000 <__ZL3hex+0x45cd>
100b55504:     	add	x2, x2, #0x46e
100b55508:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5550c:     	add	x3, x3, #0x4aa
100b55510:     	adrp	x4, 0x104bd4000 <__ZL3hex+0x45cd>
100b55514:     	add	x4, x4, #0x4bf
100b55518:     	bl	0x100ae2b58 <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b5551c:     	strh	wzr, [x21, #0xde]
100b55520:     	ldr	x20, [x21, #0xe8]
100b55524:     	cbz	x20, 0x100b55550 <__Z20wm_event_do_handlersP8bContext+0x484>
100b55528:     	ldr	x0, [x20]
100b5552c:     	cbz	x0, 0x100b55534 <__Z20wm_event_do_handlersP8bContext+0x468>
100b55530:     	bl	0x100ae4298 <_MEM_freeN>
100b55534:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b55538:     	add	x8, x8, #0x710
100b5553c:     	ldr	x8, [x8]
100b55540:     	mov	x0, x20
100b55544:     	mov	w1, #0x0                ; =0
100b55548:     	blr	x8
100b5554c:     	str	xzr, [x21, #0xe8]
100b55550:     	mov	x0, x21
100b55554:     	bl	0x104a61074 <__Z27WM_window_get_active_screenPK8wmWindow>
100b55558:     	mov	x27, x0
100b5555c:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b55560:     	add	x8, x8, #0x28
100b55564:     	ldrb	w8, [x8, #0xc40]
100b55568:     	tst	w8, #0x18
100b5556c:     	b.eq	0x100b555a4 <__Z20wm_event_do_handlersP8bContext+0x4d8>
100b55570:     	ldrh	w8, [x26, #0x10]
100b55574:     	cmp	w8, #0x4
100b55578:     	b.eq	0x100b555a4 <__Z20wm_event_do_handlersP8bContext+0x4d8>
100b5557c:     	cmp	w8, #0x11
100b55580:     	b.eq	0x100b555a4 <__Z20wm_event_do_handlersP8bContext+0x4d8>
100b55584:     	adrp	x8, 0x104bd4000 <__ZL3hex+0x45cd>
100b55588:     	add	x8, x8, #0x4aa
100b5558c:     	str	x8, [sp]
100b55590:     	adrp	x0, 0x104bd4000 <__ZL3hex+0x45cd>
100b55594:     	add	x0, x0, #0x539
100b55598:     	bl	0x104b765dc <_zlibVersion+0x104b765dc>
100b5559c:     	mov	x0, x26
100b555a0:     	bl	0x100b4cd48 <__Z14WM_event_printPK7wmEvent>
100b555a4:     	ldrh	w8, [x21, #0xd6]
100b555a8:     	cbz	w8, 0x100b555c8 <__Z20wm_event_do_handlersP8bContext+0x4fc>
100b555ac:     	ldrh	w9, [x26, #0x10]
100b555b0:     	cmp	w8, w9
100b555b4:     	b.ne	0x100b555c8 <__Z20wm_event_do_handlersP8bContext+0x4fc>
100b555b8:     	ldrh	w9, [x26, #0x12]
100b555bc:     	cmp	w9, #0x2
100b555c0:     	b.ne	0x100b558f4 <__Z20wm_event_do_handlersP8bContext+0x828>
100b555c4:     	strh	wzr, [x21, #0xd6]
100b555c8:     	mov	x0, x19
100b555cc:     	mov	x1, x21
100b555d0:     	bl	0x1000b4964 <__Z17CTX_wm_window_setP8bContextP8wmWindow>
100b555d4:     	ldr	x8, [x26, #0x48]
100b555d8:     	cbz	x8, 0x100b555f0 <__Z20wm_event_do_handlersP8bContext+0x524>
100b555dc:     	mov	x0, x19
100b555e0:     	mov	x1, x21
100b555e4:     	mov	x2, x26
100b555e8:     	bl	0x101f32430 <__Z23UI_ipad_hud_event_admitP8bContextP8wmWindowPK7wmEvent>
100b555ec:     	tbz	w0, #0x0, 0x100b55790 <__Z20wm_event_do_handlersP8bContext+0x6c4>
100b555f0:     	mov	x0, x19
100b555f4:     	mov	x1, x26
100b555f8:     	bl	0x101f997b4 <__Z34UI_ipad_ring_reopen_cancel_pendingP8bContextPK7wmEvent>
100b555fc:     	str	w0, [sp, #0x18]
100b55600:     	ldrh	w8, [x26, #0x10]
100b55604:     	cmp	w8, #0x207
100b55608:     	b.ne	0x100b55690 <__Z20wm_event_do_handlersP8bContext+0x5c4>
100b5560c:     	ldrh	w8, [x26, #0x80]
100b55610:     	cmp	w8, #0x6
100b55614:     	b.ne	0x100b56524 <__Z20wm_event_do_handlersP8bContext+0x1458>
100b55618:     	ldr	x8, [x26, #0x88]
100b5561c:     	cbz	x8, 0x100b56524 <__Z20wm_event_do_handlersP8bContext+0x1458>
100b55620:     	adrp	x9, 0x10636c000 <_zlibVersion+0x10636c000>
100b55624:     	ldr	x9, [x9, #0x770]
100b55628:     	ldr	x9, [x9, #0x8]
100b5562c:     	cbz	x9, 0x100b55d74 <__Z20wm_event_do_handlersP8bContext+0xca8>
100b55630:     	ldr	x10, [x21, #0x10]
100b55634:     	lsr	x11, x10, #32
100b55638:     	ubfiz	x12, x10, #3, #29
100b5563c:     	add	x12, x12, #0x8
100b55640:     	eor	x12, x12, x11
100b55644:     	mov	x13, #0x2d69            ; =11625
100b55648:     	movk	x13, #0xeb38, lsl #16
100b5564c:     	movk	x13, #0xea08, lsl #32
100b55650:     	movk	x13, #0x9ddf, lsl #48
100b55654:     	mul	x12, x12, x13
100b55658:     	eor	x11, x11, x12, lsr #47
100b5565c:     	eor	x11, x11, x12
100b55660:     	mul	x11, x11, x13
100b55664:     	eor	x11, x11, x11, lsr #47
100b55668:     	mul	x11, x11, x13
100b5566c:     	fmov	d0, x9
100b55670:     	cnt.8b	v0, v0
100b55674:     	uaddlv.8b	h0, v0
100b55678:     	fmov	w12, s0
100b5567c:     	cmp	x12, #0x1
100b55680:     	b.hi	0x100b55cf0 <__Z20wm_event_do_handlersP8bContext+0xc24>
100b55684:     	sub	x13, x9, #0x1
100b55688:     	and	x13, x11, x13
100b5568c:     	b	0x100b55d04 <__Z20wm_event_do_handlersP8bContext+0xc38>
100b55690:     	ldr	w8, [sp, #0x18]
100b55694:     	cbz	w8, 0x100b556bc <__Z20wm_event_do_handlersP8bContext+0x5f0>
100b55698:     	mov	w20, #0x2               ; =2
100b5569c:     	cbz	x19, 0x100b556c0 <__Z20wm_event_do_handlersP8bContext+0x5f4>
100b556a0:     	cbz	x26, 0x100b556c0 <__Z20wm_event_do_handlersP8bContext+0x5f4>
100b556a4:     	mov	x0, x19
100b556a8:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b556ac:     	cmp	x0, x21
100b556b0:     	b.ne	0x100b556c0 <__Z20wm_event_do_handlersP8bContext+0x5f4>
100b556b4:     	ldr	x24, [x21, #0x118]
100b556b8:     	cbnz	x24, 0x100b557d4 <__Z20wm_event_do_handlersP8bContext+0x708>
100b556bc:     	mov	w20, #0x0               ; =0
100b556c0:     	ldr	x8, [x27, #0x218]
100b556c4:     	cbz	x8, 0x100b55730 <__Z20wm_event_do_handlersP8bContext+0x664>
100b556c8:     	ldrb	w9, [x8, #0x28]
100b556cc:     	cmp	w9, #0x1
100b556d0:     	b.ne	0x100b55730 <__Z20wm_event_do_handlersP8bContext+0x664>
100b556d4:     	ldrh	w9, [x26, #0x10]
100b556d8:     	cmp	w9, #0x11
100b556dc:     	b.eq	0x100b556e8 <__Z20wm_event_do_handlersP8bContext+0x61c>
100b556e0:     	cmp	w9, #0x4
100b556e4:     	b.ne	0x100b55730 <__Z20wm_event_do_handlersP8bContext+0x664>
100b556e8:     	ldur	d0, [x26, #0x14]
100b556ec:     	ldur	d1, [x8, #0x2c]
100b556f0:     	sabd.2s	v2, v0, v1
100b556f4:     	dup.2s	v2, v2[1]
100b556f8:     	saba.2s	v2, v0, v1
100b556fc:     	ucvtf	s0, s2
100b55700:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b55704:     	add	x8, x8, #0xe08
100b55708:     	mov	w9, #0x2c77             ; =11383
100b5570c:     	ldr	b1, [x8, x9]
100b55710:     	ucvtf	s1, s1
100b55714:     	ldr	s2, [x8, #0x2654]
100b55718:     	fmul	s1, s2, s1
100b5571c:     	fcmp	s1, s0
100b55720:     	b.pl	0x100b55730 <__Z20wm_event_do_handlersP8bContext+0x664>
100b55724:     	mov	x0, x19
100b55728:     	mov	x1, x21
100b5572c:     	bl	0x100b94128 <__Z16WM_tooltip_clearP8bContextP8wmWindow>
100b55730:     	add	x1, x26, #0x14
100b55734:     	mov	x0, x19
100b55738:     	bl	0x100b570a0 <__ZL17area_event_insideP8bContextPKi>
100b5573c:     	mov	x1, x0
100b55740:     	mov	x0, x19
100b55744:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b55748:     	mov	x0, x19
100b5574c:     	bl	0x1000b3bb8 <__Z13CTX_wm_screenPK8bContext>
100b55750:     	mov	x22, x0
100b55754:     	mov	x0, x19
100b55758:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b5575c:     	mov	x23, #0x0               ; =0
100b55760:     	cbz	x22, 0x100b55994 <__Z20wm_event_do_handlersP8bContext+0x8c8>
100b55764:     	mov	x25, x0
100b55768:     	cbz	x0, 0x100b55994 <__Z20wm_event_do_handlersP8bContext+0x8c8>
100b5576c:     	mov	x0, x22
100b55770:     	bl	0x1016358d0 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b55774:     	cbz	w0, 0x100b55978 <__Z20wm_event_do_handlersP8bContext+0x8ac>
100b55778:     	add	x2, x26, #0x14
100b5577c:     	mov	x0, x25
100b55780:     	mov	w1, #-0x1               ; =-1
100b55784:     	bl	0x1016293b4 <__Z29ED_area_find_region_xy_visualPK7ScrAreaiPKi>
100b55788:     	mov	x23, x0
100b5578c:     	b	0x100b55994 <__Z20wm_event_do_handlersP8bContext+0x8c8>
100b55790:     	mov	x0, x19
100b55794:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b55798:     	cbz	x0, 0x100b56f48 <__Z20wm_event_do_handlersP8bContext+0x1e7c>
100b5579c:     	add	x0, x0, #0x1a0
100b557a0:     	mov	x1, x21
100b557a4:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b557a8:     	cmn	w0, #0x1
100b557ac:     	b.eq	0x100b56f48 <__Z20wm_event_do_handlersP8bContext+0x1e7c>
100b557b0:     	ldr	x0, [x21, #0x168]
100b557b4:     	mov	x1, x26
100b557b8:     	bl	0x10078fea0 <__Z11BLI_remlinkP8ListBasePv>
100b557bc:     	mov	x0, x21
100b557c0:     	mov	x1, x26
100b557c4:     	bl	0x100b56fac <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent>
100b557c8:     	b	0x100b5514c <__Z20wm_event_do_handlersP8bContext+0x80>
100b557cc:     	mov	w20, #0x0               ; =0
100b557d0:     	cbz	x24, 0x100b556c0 <__Z20wm_event_do_handlersP8bContext+0x5f4>
100b557d4:     	mov	x23, x24
100b557d8:     	ldr	x24, [x24]
100b557dc:     	ldr	w8, [x23, #0x10]
100b557e0:     	cmp	w8, #0x3
100b557e4:     	b.ne	0x100b557cc <__Z20wm_event_do_handlersP8bContext+0x700>
100b557e8:     	ldr	x8, [x23, #0x50]
100b557ec:     	cbz	x8, 0x100b557cc <__Z20wm_event_do_handlersP8bContext+0x700>
100b557f0:     	mov	x0, x19
100b557f4:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b557f8:     	mov	x25, x0
100b557fc:     	mov	x0, x19
100b55800:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b55804:     	mov	x28, x0
100b55808:     	str	xzr, [sp, #0x50]
100b5580c:     	str	xzr, [sp, #0x120]
100b55810:     	add	x3, sp, #0x50
100b55814:     	add	x4, sp, #0x120
100b55818:     	mov	x0, x19
100b5581c:     	mov	x1, x23
100b55820:     	mov	x2, x26
100b55824:     	bl	0x100b57f7c <__ZL34wm_handler_op_context_get_if_validP8bContextP17wmEventHandler_OpPK7wmEventPP7ScrAreaPP7ARegion>
100b55828:     	ldr	x1, [sp, #0x50]
100b5582c:     	mov	x0, x19
100b55830:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b55834:     	ldr	x1, [sp, #0x120]
100b55838:     	mov	x0, x19
100b5583c:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b55840:     	mov	x0, x19
100b55844:     	mov	x1, x21
100b55848:     	mov	x2, x26
100b5584c:     	mov	x3, x23
100b55850:     	mov	w4, #0x0                ; =0
100b55854:     	bl	0x100b5214c <__ZL32wm_ipad_pencil_paint_modal_admitP8bContextP8wmWindowPK7wmEventPK17wmEventHandler_Opb>
100b55858:     	mov	x22, x0
100b5585c:     	cmp	w0, #0x2
100b55860:     	b.ne	0x100b56788 <__Z20wm_event_do_handlersP8bContext+0x16bc>
100b55864:     	ldr	x8, [x23, #0x20]
100b55868:     	cbz	x8, 0x100b56540 <__Z20wm_event_do_handlersP8bContext+0x1474>
100b5586c:     	ldr	x20, [x8, #0x58]
100b55870:     	mov	x0, x19
100b55874:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b55878:     	ldr	x8, [x0, #0x5c0]
100b5587c:     	ldrb	w8, [x8, #0x10]
100b55880:     	cmp	w8, #0x1
100b55884:     	b.ne	0x100b55890 <__Z20wm_event_do_handlersP8bContext+0x7c4>
100b55888:     	ldrh	w8, [x20, #0xe4]
100b5588c:     	tbz	w8, #0x9, 0x100b56540 <__Z20wm_event_do_handlersP8bContext+0x1474>
100b55890:     	mov	x0, x19
100b55894:     	mov	x1, x25
100b55898:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b5589c:     	mov	x0, x19
100b558a0:     	mov	x1, x28
100b558a4:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b558a8:     	add	x1, x21, #0x118
100b558ac:     	mov	x0, x19
100b558b0:     	mov	x2, x23
100b558b4:     	mov	x3, x26
100b558b8:     	mov	x4, #0x0                ; =0
100b558bc:     	mov	x5, #0x0                ; =0
100b558c0:     	mov	w6, #0x0                ; =0
100b558c4:     	mov	w7, #0x0                ; =0
100b558c8:     	bl	0x100b524d0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch>
100b558cc:     	mov	x0, x19
100b558d0:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b558d4:     	cmp	x0, x21
100b558d8:     	b.ne	0x100b56558 <__Z20wm_event_do_handlersP8bContext+0x148c>
100b558dc:     	add	x0, x21, #0x118
100b558e0:     	mov	x1, x23
100b558e4:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b558e8:     	cmn	w0, #0x1
100b558ec:     	b.eq	0x100b557cc <__Z20wm_event_do_handlersP8bContext+0x700>
100b558f0:     	b	0x100b56558 <__Z20wm_event_do_handlersP8bContext+0x148c>
100b558f4:     	cmp	w8, #0x4
100b558f8:     	b.eq	0x100b5595c <__Z20wm_event_do_handlersP8bContext+0x890>
100b558fc:     	cmp	w8, #0x11
100b55900:     	b.eq	0x100b5595c <__Z20wm_event_do_handlersP8bContext+0x890>
100b55904:     	adrp	x8, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b55908:     	add	x8, x8, #0x2a0
100b5590c:     	ldr	x8, [x8]
100b55910:     	ldr	x0, [x8, #0x8]
100b55914:     	cbnz	x0, 0x100b55930 <__Z20wm_event_do_handlersP8bContext+0x864>
100b55918:     	mov	x0, x8
100b5591c:     	bl	0x100ae3834 <__Z15CLG_logref_initP10CLG_LogRef>
100b55920:     	adrp	x8, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b55924:     	add	x8, x8, #0x2a0
100b55928:     	ldr	x8, [x8]
100b5592c:     	ldr	x0, [x8, #0x8]
100b55930:     	ldr	w8, [x0, #0x50]
100b55934:     	cmp	w8, #0x4
100b55938:     	b.lt	0x100b5595c <__Z20wm_event_do_handlersP8bContext+0x890>
100b5593c:     	mov	w1, #0x4                ; =4
100b55940:     	adrp	x2, 0x104bd4000 <__ZL3hex+0x45cd>
100b55944:     	add	x2, x2, #0x54e
100b55948:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5594c:     	add	x3, x3, #0x4aa
100b55950:     	adrp	x4, 0x104bd4000 <__ZL3hex+0x45cd>
100b55954:     	add	x4, x4, #0x58a
100b55958:     	bl	0x100ae2b58 <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b5595c:     	ldr	x0, [x21, #0x168]
100b55960:     	mov	x1, x26
100b55964:     	bl	0x10078fea0 <__Z11BLI_remlinkP8ListBasePv>
100b55968:     	mov	x0, x21
100b5596c:     	mov	x1, x26
100b55970:     	bl	0x100b56fac <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent>
100b55974:     	b	0x100b5514c <__Z20wm_event_do_handlersP8bContext+0x80>
100b55978:     	add	x23, x25, #0x78
100b5597c:     	ldr	x23, [x23]
100b55980:     	cbz	x23, 0x100b55994 <__Z20wm_event_do_handlersP8bContext+0x8c8>
100b55984:     	add	x0, x23, #0xa8
100b55988:     	add	x1, x26, #0x14
100b5598c:     	bl	0x1007fc884 <__Z19BLI_rcti_isect_pt_vPK4rctiPKi>
100b55990:     	cbz	w0, 0x100b5597c <__Z20wm_event_do_handlersP8bContext+0x8b0>
100b55994:     	mov	x0, x19
100b55998:     	mov	x1, x23
100b5599c:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b559a0:     	ldr	x0, [sp, #0x28]
100b559a4:     	mov	x1, x21
100b559a8:     	bl	0x100b96594 <__Z23wm_window_make_drawableP15wmWindowManagerP8wmWindow>
100b559ac:     	mov	x0, x19
100b559b0:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b559b4:     	cbz	x0, 0x100b559d4 <__Z20wm_event_do_handlersP8bContext+0x908>
100b559b8:     	ldr	w8, [x0, #0xa8]
100b559bc:     	ldp	w9, w10, [x26, #0x14]
100b559c0:     	sub	w8, w9, w8
100b559c4:     	str	w8, [x26, #0x1c]
100b559c8:     	ldr	w8, [x0, #0xb0]
100b559cc:     	sub	w8, w10, w8
100b559d0:     	b	0x100b559dc <__Z20wm_event_do_handlersP8bContext+0x910>
100b559d4:     	mov	w8, #-0x1               ; =-1
100b559d8:     	str	w8, [x26, #0x1c]
100b559dc:     	str	w8, [x26, #0x20]
100b559e0:     	ldrh	w8, [x26, #0x10]
100b559e4:     	cmp	w8, #0x208
100b559e8:     	b.ne	0x100b55a40 <__Z20wm_event_do_handlersP8bContext+0x974>
100b559ec:     	str	xzr, [sp, #0x50]
100b559f0:     	str	xzr, [sp, #0x120]
100b559f4:     	stur	xzr, [x29, #-0x80]
100b559f8:     	add	x3, sp, #0x50
100b559fc:     	add	x4, sp, #0x120
100b55a00:     	sub	x5, x29, #0x80
100b55a04:     	mov	x0, x19
100b55a08:     	mov	x1, x21
100b55a0c:     	mov	x2, x26
100b55a10:     	bl	0x100b571d4 <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion>
100b55a14:     	cbz	w0, 0x100b55a68 <__Z20wm_event_do_handlersP8bContext+0x99c>
100b55a18:     	ldr	x2, [sp, #0x50]
100b55a1c:     	add	x1, x21, #0x118
100b55a20:     	mov	x0, x19
100b55a24:     	mov	x3, x26
100b55a28:     	mov	x4, #0x0                ; =0
100b55a2c:     	mov	x5, #0x0                ; =0
100b55a30:     	mov	w6, #0x0                ; =0
100b55a34:     	mov	w7, #0x0                ; =0
100b55a38:     	bl	0x100b524d0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch>
100b55a3c:     	b	0x100b55a68 <__Z20wm_event_do_handlersP8bContext+0x99c>
100b55a40:     	and	w8, w20, #0xff
100b55a44:     	cmp	w8, #0x2
100b55a48:     	ldr	x9, [sp, #0x10]
100b55a4c:     	b.eq	0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b55a50:     	cmp	w8, #0x1
100b55a54:     	b.ne	0x100b55a70 <__Z20wm_event_do_handlersP8bContext+0x9a4>
100b55a58:     	add	x2, x21, #0x118
100b55a5c:     	mov	x0, x19
100b55a60:     	mov	x1, x26
100b55a64:     	bl	0x100b57328 <__ZL14wm_handlers_doP8bContextP7wmEventP8ListBase>
100b55a68:     	orr	w24, w0, #0x3
100b55a6c:     	b	0x100b55abc <__Z20wm_event_do_handlersP8bContext+0x9f0>
100b55a70:     	ldr	x8, [x9]
100b55a74:     	cbz	x8, 0x100b55db4 <__Z20wm_event_do_handlersP8bContext+0xce8>
100b55a78:     	ldr	x8, [x9, #0x10]
100b55a7c:     	cbz	x8, 0x100b55db4 <__Z20wm_event_do_handlersP8bContext+0xce8>
100b55a80:     	ldr	x8, [x9, #0x30]
100b55a84:     	cbz	x8, 0x100b55db4 <__Z20wm_event_do_handlersP8bContext+0xce8>
100b55a88:     	ldr	x8, [x9, #0x88]
100b55a8c:     	cbz	x8, 0x100b55db4 <__Z20wm_event_do_handlersP8bContext+0xce8>
100b55a90:     	ldr	x8, [x9, #0x98]
100b55a94:     	cbz	x8, 0x100b55db4 <__Z20wm_event_do_handlersP8bContext+0xce8>
100b55a98:     	ldr	w8, [sp, #0x18]
100b55a9c:     	tbnz	w8, #0x0, 0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b55aa0:     	ldrh	w8, [x26, #0x10]
100b55aa4:     	cmp	w8, #0x207
100b55aa8:     	b.ne	0x100b5604c <__Z20wm_event_do_handlersP8bContext+0xf80>
100b55aac:     	mov	x0, x19
100b55ab0:     	mov	x1, x26
100b55ab4:     	bl	0x101f39af0 <__Z27UI_ipad_ring_event_dispatchP8bContextPK7wmEvent>
100b55ab8:     	mov	w24, #0x3               ; =3
100b55abc:     	mov	x0, x19
100b55ac0:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b55ac4:     	cbz	x0, 0x100b56e34 <__Z20wm_event_do_handlersP8bContext+0x1d68>
100b55ac8:     	mov	x0, x21
100b55acc:     	bl	0x104a61074 <__Z27WM_window_get_active_screenPK8wmWindow>
100b55ad0:     	cmp	x27, x0
100b55ad4:     	b.eq	0x100b55c9c <__Z20wm_event_do_handlersP8bContext+0xbd0>
100b55ad8:     	tst	w24, #0x3
100b55adc:     	b.ne	0x100b55b0c <__Z20wm_event_do_handlersP8bContext+0xa40>
100b55ae0:     	mov	x0, x21
100b55ae4:     	bl	0x104a61074 <__Z27WM_window_get_active_screenPK8wmWindow>
100b55ae8:     	bl	0x1016358d0 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b55aec:     	cbz	w0, 0x100b55b0c <__Z20wm_event_do_handlersP8bContext+0xa40>
100b55af0:     	mov	x0, x19
100b55af4:     	mov	x1, x21
100b55af8:     	mov	x2, x26
100b55afc:     	bl	0x101645948 <__Z27ED_ipad_panels_handle_eventP8bContextP8wmWindowPK7wmEvent>
100b55b00:     	cbz	w0, 0x100b55b0c <__Z20wm_event_do_handlersP8bContext+0xa40>
100b55b04:     	sturh	wzr, [x21, #0xdb]
100b55b08:     	orr	w24, w24, #0x3
100b55b0c:     	mov	x0, x21
100b55b10:     	bl	0x104a61074 <__Z27WM_window_get_active_screenPK8wmWindow>
100b55b14:     	ldr	x8, [sp, #0x28]
100b55b18:     	ldr	x8, [x8, #0x5c0]
100b55b1c:     	ldr	x8, [x8, #0xb8]
100b55b20:     	cbz	x8, 0x100b55b64 <__Z20wm_event_do_handlersP8bContext+0xa98>
100b55b24:     	mov	x23, x0
100b55b28:     	mov	w8, #0x0                ; =0
100b55b2c:     	ldrh	w9, [x26, #0x10]
100b55b30:     	cmp	w9, #0xab
100b55b34:     	b.le	0x100b55cd4 <__Z20wm_event_do_handlersP8bContext+0xc08>
100b55b38:     	sub	w9, w9, #0xac
100b55b3c:     	cmp	w9, #0x2e
100b55b40:     	b.hi	0x100b55b64 <__Z20wm_event_do_handlersP8bContext+0xa98>
100b55b44:     	mov	w10, #0x1               ; =1
100b55b48:     	lsl	x10, x10, x9
100b55b4c:     	mov	x11, #0x81              ; =129
100b55b50:     	movk	x11, #0x3f00, lsl #32
100b55b54:     	tst	x10, x11
100b55b58:     	b.eq	0x100b55f88 <__Z20wm_event_do_handlersP8bContext+0xebc>
100b55b5c:     	mov	w9, #0x1                ; =1
100b55b60:     	strb	w9, [x23, #0x1f4]
100b55b64:     	orr	w28, w8, w24
100b55b68:     	tbnz	w28, #0x0, 0x100b56370 <__Z20wm_event_do_handlersP8bContext+0x12a4>
100b55b6c:     	ldrh	w8, [x26, #0x10]
100b55b70:     	cmp	w8, #0x4
100b55b74:     	b.ne	0x100b560c0 <__Z20wm_event_do_handlersP8bContext+0xff4>
100b55b78:     	add	x2, x26, #0x14
100b55b7c:     	mov	x0, x19
100b55b80:     	mov	x1, x21
100b55b84:     	bl	0x1016315a8 <__Z27ED_screen_set_active_regionP8bContextP8wmWindowPKi>
100b55b88:     	mov	x0, x19
100b55b8c:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b55b90:     	mov	x24, x0
100b55b94:     	ldr	x8, [x0, #0x5c0]
100b55b98:     	ldr	x8, [x8, #0x78]
100b55b9c:     	cbz	x8, 0x100b560c0 <__Z20wm_event_do_handlersP8bContext+0xff4>
100b55ba0:     	mov	x0, x19
100b55ba4:     	bl	0x1000b3bb8 <__Z13CTX_wm_screenPK8bContext>
100b55ba8:     	cbz	x0, 0x100b55bf4 <__Z20wm_event_do_handlersP8bContext+0xb28>
100b55bac:     	ldr	x23, [x0, #0x1f8]
100b55bb0:     	cbz	x23, 0x100b55bf4 <__Z20wm_event_do_handlersP8bContext+0xb28>
100b55bb4:     	mov	x0, x19
100b55bb8:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b55bbc:     	mov	x25, x0
100b55bc0:     	mov	x0, x19
100b55bc4:     	mov	x1, x23
100b55bc8:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b55bcc:     	ldr	x8, [x24, #0x5c0]
100b55bd0:     	ldr	x20, [x8, #0x78]
100b55bd4:     	cbnz	x20, 0x100b55c70 <__Z20wm_event_do_handlersP8bContext+0xba4>
100b55bd8:     	mov	x0, x19
100b55bdc:     	mov	x1, x25
100b55be0:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b55be4:     	add	x0, x23, #0xa8
100b55be8:     	add	x1, x26, #0x94
100b55bec:     	bl	0x1007fc884 <__Z19BLI_rcti_isect_pt_vPK4rctiPKi>
100b55bf0:     	tbnz	w0, #0x0, 0x100b560c0 <__Z20wm_event_do_handlersP8bContext+0xff4>
100b55bf4:     	mov	x0, x19
100b55bf8:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b55bfc:     	mov	x23, x0
100b55c00:     	mov	x0, x19
100b55c04:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b55c08:     	str	x0, [sp, #0x18]
100b55c0c:     	add	x1, x26, #0x94
100b55c10:     	mov	x0, x19
100b55c14:     	bl	0x100b570a0 <__ZL17area_event_insideP8bContextPKi>
100b55c18:     	mov	x1, x0
100b55c1c:     	mov	x0, x19
100b55c20:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b55c24:     	mov	x0, x19
100b55c28:     	bl	0x1000b3bb8 <__Z13CTX_wm_screenPK8bContext>
100b55c2c:     	mov	x20, x0
100b55c30:     	mov	x0, x19
100b55c34:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b55c38:     	mov	x25, #0x0               ; =0
100b55c3c:     	cbz	x20, 0x100b56080 <__Z20wm_event_do_handlersP8bContext+0xfb4>
100b55c40:     	mov	x22, x0
100b55c44:     	cbz	x0, 0x100b56080 <__Z20wm_event_do_handlersP8bContext+0xfb4>
100b55c48:     	mov	x0, x20
100b55c4c:     	bl	0x1016358d0 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b55c50:     	cbz	w0, 0x100b56064 <__Z20wm_event_do_handlersP8bContext+0xf98>
100b55c54:     	add	x2, x26, #0x94
100b55c58:     	mov	x0, x22
100b55c5c:     	mov	w1, #-0x1               ; =-1
100b55c60:     	bl	0x1016293b4 <__Z29ED_area_find_region_xy_visualPK7ScrAreaiPKi>
100b55c64:     	mov	x25, x0
100b55c68:     	b	0x100b56080 <__Z20wm_event_do_handlersP8bContext+0xfb4>
100b55c6c:     	cbz	x20, 0x100b55bd8 <__Z20wm_event_do_handlersP8bContext+0xb0c>
100b55c70:     	ldr	x8, [x20, #0x18]
100b55c74:     	ldr	x20, [x20]
100b55c78:     	cbz	x8, 0x100b55c88 <__Z20wm_event_do_handlersP8bContext+0xbbc>
100b55c7c:     	mov	x0, x19
100b55c80:     	blr	x8
100b55c84:     	cbz	w0, 0x100b55c6c <__Z20wm_event_do_handlersP8bContext+0xba0>
100b55c88:     	mov	x0, x19
100b55c8c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b55c90:     	mov	x1, x23
100b55c94:     	bl	0x100b49ea8 <__Z26WM_paint_cursor_tag_redrawP8wmWindowP7ARegion>
100b55c98:     	b	0x100b55c6c <__Z20wm_event_do_handlersP8bContext+0xba0>
100b55c9c:     	ldr	x8, [x27, #0x218]
100b55ca0:     	cbz	x8, 0x100b55ad8 <__Z20wm_event_do_handlersP8bContext+0xa0c>
100b55ca4:     	ldr	x8, [x8]
100b55ca8:     	cbz	x8, 0x100b55ad8 <__Z20wm_event_do_handlersP8bContext+0xa0c>
100b55cac:     	ldrh	w9, [x26, #0x10]
100b55cb0:     	cmp	w9, #0x110
100b55cb4:     	b.ne	0x100b55ad8 <__Z20wm_event_do_handlersP8bContext+0xa0c>
100b55cb8:     	ldr	x9, [x26, #0x88]
100b55cbc:     	cmp	x9, x8
100b55cc0:     	b.ne	0x100b55ad8 <__Z20wm_event_do_handlersP8bContext+0xa0c>
100b55cc4:     	mov	x0, x19
100b55cc8:     	mov	x1, x21
100b55ccc:     	bl	0x100b93e84 <__Z15WM_tooltip_initP8bContextP8wmWindow>
100b55cd0:     	b	0x100b55ad8 <__Z20wm_event_do_handlersP8bContext+0xa0c>
100b55cd4:     	cmp	w9, #0x1
100b55cd8:     	b.eq	0x100b55fb4 <__Z20wm_event_do_handlersP8bContext+0xee8>
100b55cdc:     	cmp	w9, #0x3
100b55ce0:     	b.eq	0x100b55f90 <__Z20wm_event_do_handlersP8bContext+0xec4>
100b55ce4:     	cmp	w9, #0x4
100b55ce8:     	b.eq	0x100b55b5c <__Z20wm_event_do_handlersP8bContext+0xa90>
100b55cec:     	b	0x100b55b64 <__Z20wm_event_do_handlersP8bContext+0xa98>
100b55cf0:     	mov	x13, x11
100b55cf4:     	cmp	x11, x9
100b55cf8:     	b.lo	0x100b55d04 <__Z20wm_event_do_handlersP8bContext+0xc38>
100b55cfc:     	udiv	x13, x11, x9
100b55d00:     	msub	x13, x13, x9, x11
100b55d04:     	adrp	x14, 0x10636c000 <_zlibVersion+0x10636c000>
100b55d08:     	ldr	x14, [x14, #0x770]
100b55d0c:     	ldr	x14, [x14]
100b55d10:     	ldr	x14, [x14, x13, lsl #3]
100b55d14:     	cbz	x14, 0x100b55d70 <__Z20wm_event_do_handlersP8bContext+0xca4>
100b55d18:     	ldr	x14, [x14]
100b55d1c:     	cbz	x14, 0x100b55d70 <__Z20wm_event_do_handlersP8bContext+0xca4>
100b55d20:     	sub	x15, x9, #0x1
100b55d24:     	b	0x100b55d3c <__Z20wm_event_do_handlersP8bContext+0xc70>
100b55d28:     	ldr	x16, [x14, #0x10]
100b55d2c:     	cmp	x16, x10
100b55d30:     	b.eq	0x100b56518 <__Z20wm_event_do_handlersP8bContext+0x144c>
100b55d34:     	ldr	x14, [x14]
100b55d38:     	cbz	x14, 0x100b55d70 <__Z20wm_event_do_handlersP8bContext+0xca4>
100b55d3c:     	ldr	x16, [x14, #0x8]
100b55d40:     	cmp	x16, x11
100b55d44:     	b.eq	0x100b55d28 <__Z20wm_event_do_handlersP8bContext+0xc5c>
100b55d48:     	cmp	x12, #0x1
100b55d4c:     	b.hi	0x100b55d58 <__Z20wm_event_do_handlersP8bContext+0xc8c>
100b55d50:     	and	x16, x16, x15
100b55d54:     	b	0x100b55d68 <__Z20wm_event_do_handlersP8bContext+0xc9c>
100b55d58:     	cmp	x16, x9
100b55d5c:     	b.lo	0x100b55d68 <__Z20wm_event_do_handlersP8bContext+0xc9c>
100b55d60:     	udiv	x17, x16, x9
100b55d64:     	msub	x16, x17, x9, x16
100b55d68:     	cmp	x16, x13
100b55d6c:     	b.eq	0x100b55d34 <__Z20wm_event_do_handlersP8bContext+0xc68>
100b55d70:     	mov	x9, #0x0                ; =0
100b55d74:     	mov	x10, #0x0               ; =0
100b55d78:     	ldr	x11, [x8]
100b55d7c:     	cbz	x11, 0x100b56524 <__Z20wm_event_do_handlersP8bContext+0x1458>
100b55d80:     	cmp	x11, x9
100b55d84:     	b.ne	0x100b56524 <__Z20wm_event_do_handlersP8bContext+0x1458>
100b55d88:     	ldr	x9, [x8, #0x8]
100b55d8c:     	sub	x9, x9, #0x1
100b55d90:     	cmp	x9, x10
100b55d94:     	b.hs	0x100b56524 <__Z20wm_event_do_handlersP8bContext+0x1458>
100b55d98:     	ldr	w9, [x8, #0x18]
100b55d9c:     	cmp	w9, #0x7
100b55da0:     	b.hi	0x100b56524 <__Z20wm_event_do_handlersP8bContext+0x1458>
100b55da4:     	cbz	w9, 0x100b55698 <__Z20wm_event_do_handlersP8bContext+0x5cc>
100b55da8:     	ldr	x8, [x8, #0x20]
100b55dac:     	cbnz	x8, 0x100b55698 <__Z20wm_event_do_handlersP8bContext+0x5cc>
100b55db0:     	b	0x100b56524 <__Z20wm_event_do_handlersP8bContext+0x1458>
100b55db4:     	str	xzr, [sp, #0x1d0]
100b55db8:     	movi.16b	v0, #0x0
100b55dbc:     	stp	q0, q0, [sp, #0x1b0]
100b55dc0:     	stp	q0, q0, [sp, #0x190]
100b55dc4:     	stp	q0, q0, [sp, #0x170]
100b55dc8:     	stp	q0, q0, [sp, #0x150]
100b55dcc:     	stp	q0, q0, [sp, #0x130]
100b55dd0:     	str	q0, [sp, #0x120]
100b55dd4:     	str	xzr, [sp, #0x30]
100b55dd8:     	ldr	x23, [x26, #0x48]
100b55ddc:     	str	x23, [sp, #0x48]
100b55de0:     	cbz	x23, 0x100b55fec <__Z20wm_event_do_handlersP8bContext+0xf20>
100b55de4:     	ldr	x20, [x26, #0x50]
100b55de8:     	cbz	x20, 0x100b55fec <__Z20wm_event_do_handlersP8bContext+0xf20>
100b55dec:     	mov	x0, x19
100b55df0:     	mov	x1, x21
100b55df4:     	mov	x2, x23
100b55df8:     	bl	0x101641420 <__Z28UI_ipad_knife_hud_generationP8bContextP8wmWindowy>
100b55dfc:     	cbz	w0, 0x100b55a98 <__Z20wm_event_do_handlersP8bContext+0x9cc>
100b55e00:     	ldrh	w8, [x26, #0x10]
100b55e04:     	cmp	w8, #0x1
100b55e08:     	b.ne	0x100b55ea0 <__Z20wm_event_do_handlersP8bContext+0xdd4>
100b55e0c:     	ldrh	w8, [x26, #0x12]
100b55e10:     	cmp	w8, #0x1
100b55e14:     	b.ne	0x100b55ea0 <__Z20wm_event_do_handlersP8bContext+0xdd4>
100b55e18:     	stur	xzr, [x29, #-0x80]
100b55e1c:     	str	xzr, [sp, #0x100]
100b55e20:     	movi.16b	v0, #0x0
100b55e24:     	stp	q0, q0, [sp, #0xe0]
100b55e28:     	stp	q0, q0, [sp, #0xc0]
100b55e2c:     	stp	q0, q0, [sp, #0xa0]
100b55e30:     	stp	q0, q0, [sp, #0x80]
100b55e34:     	stp	q0, q0, [sp, #0x60]
100b55e38:     	str	q0, [sp, #0x50]
100b55e3c:     	str	xzr, [sp, #0x40]
100b55e40:     	add	x2, x26, #0x14
100b55e44:     	sub	x3, x29, #0x80
100b55e48:     	add	x4, sp, #0x50
100b55e4c:     	add	x5, sp, #0x40
100b55e50:     	mov	x0, x19
100b55e54:     	mov	x1, x21
100b55e58:     	bl	0x1016418e4 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion>
100b55e5c:     	ldr	x23, [sp, #0x48]
100b55e60:     	cbz	w0, 0x100b567c4 <__Z20wm_event_do_handlersP8bContext+0x16f8>
100b55e64:     	ldur	x8, [x29, #-0x80]
100b55e68:     	cmp	x8, x23
100b55e6c:     	b.ne	0x100b567c4 <__Z20wm_event_do_handlersP8bContext+0x16f8>
100b55e70:     	ldr	x8, [sp, #0x50]
100b55e74:     	cbz	x8, 0x100b567c4 <__Z20wm_event_do_handlersP8bContext+0x16f8>
100b55e78:     	ldr	x8, [sp, #0x60]
100b55e7c:     	cbz	x8, 0x100b567c4 <__Z20wm_event_do_handlersP8bContext+0x16f8>
100b55e80:     	ldr	x8, [sp, #0x80]
100b55e84:     	cbz	x8, 0x100b567c4 <__Z20wm_event_do_handlersP8bContext+0x16f8>
100b55e88:     	ldr	x8, [sp, #0xd8]
100b55e8c:     	cbz	x8, 0x100b567c4 <__Z20wm_event_do_handlersP8bContext+0x16f8>
100b55e90:     	ldr	x8, [sp, #0xe8]
100b55e94:     	cbz	x8, 0x100b567c4 <__Z20wm_event_do_handlersP8bContext+0x16f8>
100b55e98:     	ldr	x8, [sp, #0x40]
100b55e9c:     	cbz	x8, 0x100b567c4 <__Z20wm_event_do_handlersP8bContext+0x16f8>
100b55ea0:     	add	x3, sp, #0x120
100b55ea4:     	add	x4, sp, #0x30
100b55ea8:     	mov	x0, x19
100b55eac:     	mov	x1, x21
100b55eb0:     	mov	x2, x23
100b55eb4:     	bl	0x101641574 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion>
100b55eb8:     	tbz	w0, #0x0, 0x100b567b0 <__Z20wm_event_do_handlersP8bContext+0x16e4>
100b55ebc:     	ldr	x8, [sp, #0x30]
100b55ec0:     	cbz	x8, 0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b55ec4:     	ldrh	w8, [x26, #0x10]
100b55ec8:     	cmp	w8, #0x11
100b55ecc:     	b.hi	0x100b55ee8 <__Z20wm_event_do_handlersP8bContext+0xe1c>
100b55ed0:     	mov	w9, #0x1                ; =1
100b55ed4:     	lsl	w9, w9, w8
100b55ed8:     	mov	w10, #0x12              ; =18
100b55edc:     	movk	w10, #0x2, lsl #16
100b55ee0:     	tst	w9, w10
100b55ee4:     	b.ne	0x100b55ef0 <__Z20wm_event_do_handlersP8bContext+0xe24>
100b55ee8:     	cmp	w8, #0x104
100b55eec:     	b.ne	0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b55ef0:     	mov	x0, x21
100b55ef4:     	bl	0x104a61074 <__Z27WM_window_get_active_screenPK8wmWindow>
100b55ef8:     	add	x23, x0, #0x1c0
100b55efc:     	ldr	x8, [sp, #0x158]
100b55f00:     	ldr	x23, [x23]
100b55f04:     	cbz	x23, 0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b55f08:     	cmp	x8, x23
100b55f0c:     	b.ne	0x100b55f00 <__Z20wm_event_do_handlersP8bContext+0xe34>
100b55f10:     	ldr	x1, [sp, #0x30]
100b55f14:     	add	x0, x23, #0x78
100b55f18:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b55f1c:     	cmn	w0, #0x1
100b55f20:     	b.eq	0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b55f24:     	mov	x0, x19
100b55f28:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b55f2c:     	mov	x24, x0
100b55f30:     	mov	x0, x19
100b55f34:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b55f38:     	mov	x28, x0
100b55f3c:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b55f40:     	add	x8, x8, #0x28
100b55f44:     	ldr	x22, [x8]
100b55f48:     	mov	x0, x19
100b55f4c:     	mov	x1, x23
100b55f50:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b55f54:     	ldr	x1, [sp, #0x30]
100b55f58:     	mov	x0, x19
100b55f5c:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b55f60:     	mov	x0, x19
100b55f64:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b55f68:     	cbz	x0, 0x100b56980 <__Z20wm_event_do_handlersP8bContext+0x18b4>
100b55f6c:     	ldr	w8, [x0, #0xa8]
100b55f70:     	ldp	w9, w10, [x26, #0x14]
100b55f74:     	sub	w8, w9, w8
100b55f78:     	str	w8, [x26, #0x1c]
100b55f7c:     	ldr	w8, [x0, #0xb0]
100b55f80:     	sub	w8, w10, w8
100b55f84:     	b	0x100b56988 <__Z20wm_event_do_handlersP8bContext+0x18bc>
100b55f88:     	cmp	x9, #0x2e
100b55f8c:     	b.ne	0x100b55b64 <__Z20wm_event_do_handlersP8bContext+0xa98>
100b55f90:     	ldr	x0, [sp, #0x28]
100b55f94:     	mov	x1, x21
100b55f98:     	bl	0x100b46060 <__Z13wm_drags_exitP15wmWindowManagerP8wmWindow>
100b55f9c:     	ldr	x8, [sp, #0x28]
100b55fa0:     	ldr	x8, [x8, #0x5c0]
100b55fa4:     	add	x0, x8, #0xb8
100b55fa8:     	bl	0x100b46950 <__Z17WM_drag_free_listP8ListBase>
100b55fac:     	mov	w8, #0x1                ; =1
100b55fb0:     	b	0x100b55b5c <__Z20wm_event_do_handlersP8bContext+0xa90>
100b55fb4:     	ldrh	w8, [x26, #0x12]
100b55fb8:     	cmp	w8, #0x2
100b55fbc:     	b.ne	0x100b56510 <__Z20wm_event_do_handlersP8bContext+0x1444>
100b55fc0:     	mov	w8, #0x5023             ; =20515
100b55fc4:     	strh	w8, [x26, #0x10]
100b55fc8:     	ldr	x0, [x26, #0x88]
100b55fcc:     	cbz	x0, 0x100b567dc <__Z20wm_event_do_handlersP8bContext+0x1710>
100b55fd0:     	ldrh	w8, [x26, #0x82]
100b55fd4:     	cbz	w8, 0x100b567dc <__Z20wm_event_do_handlersP8bContext+0x1710>
100b55fd8:     	ldrh	w8, [x26, #0x80]
100b55fdc:     	cmp	w8, #0x3
100b55fe0:     	b.ne	0x100b567d8 <__Z20wm_event_do_handlersP8bContext+0x170c>
100b55fe4:     	bl	0x100b46950 <__Z17WM_drag_free_listP8ListBase>
100b55fe8:     	b	0x100b567dc <__Z20wm_event_do_handlersP8bContext+0x1710>
100b55fec:     	ldrh	w8, [x26, #0x10]
100b55ff0:     	cmp	w8, #0x11
100b55ff4:     	b.hi	0x100b56010 <__Z20wm_event_do_handlersP8bContext+0xf44>
100b55ff8:     	mov	w9, #0x1                ; =1
100b55ffc:     	lsl	w9, w9, w8
100b56000:     	mov	w10, #0x12              ; =18
100b56004:     	movk	w10, #0x2, lsl #16
100b56008:     	tst	w9, w10
100b5600c:     	b.ne	0x100b56018 <__Z20wm_event_do_handlersP8bContext+0xf4c>
100b56010:     	cmp	w8, #0x104
100b56014:     	b.ne	0x100b55a98 <__Z20wm_event_do_handlersP8bContext+0x9cc>
100b56018:     	str	x21, [sp, #0x40]
100b5601c:     	adrp	x9, 0x107ef7000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b56020:     	ldr	x9, [x9, #0x7b0]
100b56024:     	cbz	x9, 0x100b565dc <__Z20wm_event_do_handlersP8bContext+0x1510>
100b56028:     	fmov	d0, x9
100b5602c:     	cnt.8b	v0, v0
100b56030:     	uaddlv.8b	h0, v0
100b56034:     	fmov	w10, s0
100b56038:     	cmp	x10, #0x1
100b5603c:     	b.hi	0x100b56560 <__Z20wm_event_do_handlersP8bContext+0x1494>
100b56040:     	sub	x11, x9, #0x1
100b56044:     	and	x11, x11, x21
100b56048:     	b	0x100b56574 <__Z20wm_event_do_handlersP8bContext+0x14a8>
100b5604c:     	add	x2, x21, #0x118
100b56050:     	mov	x0, x19
100b56054:     	mov	x1, x26
100b56058:     	bl	0x100b57328 <__ZL14wm_handlers_doP8bContextP7wmEventP8ListBase>
100b5605c:     	mov	x24, x0
100b56060:     	b	0x100b55abc <__Z20wm_event_do_handlersP8bContext+0x9f0>
100b56064:     	add	x25, x22, #0x78
100b56068:     	ldr	x25, [x25]
100b5606c:     	cbz	x25, 0x100b56080 <__Z20wm_event_do_handlersP8bContext+0xfb4>
100b56070:     	add	x0, x25, #0xa8
100b56074:     	add	x1, x26, #0x94
100b56078:     	bl	0x1007fc884 <__Z19BLI_rcti_isect_pt_vPK4rctiPKi>
100b5607c:     	cbz	w0, 0x100b56068 <__Z20wm_event_do_handlersP8bContext+0xf9c>
100b56080:     	mov	x0, x19
100b56084:     	mov	x1, x25
100b56088:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b5608c:     	mov	x0, x19
100b56090:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b56094:     	mov	x25, x0
100b56098:     	cbz	x0, 0x100b560a8 <__Z20wm_event_do_handlersP8bContext+0xfdc>
100b5609c:     	ldr	x8, [x24, #0x5c0]
100b560a0:     	ldr	x20, [x8, #0x78]
100b560a4:     	cbnz	x20, 0x100b5625c <__Z20wm_event_do_handlersP8bContext+0x1190>
100b560a8:     	mov	x0, x19
100b560ac:     	mov	x1, x23
100b560b0:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b560b4:     	mov	x0, x19
100b560b8:     	ldr	x1, [sp, #0x18]
100b560bc:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b560c0:     	mov	x0, x21
100b560c4:     	mov	x1, x27
100b560c8:     	bl	0x101626db0 <__Z26ED_screen_areas_iter_firstPK8wmWindowPK7bScreen>
100b560cc:     	b	0x100b560e8 <__Z20wm_event_do_handlersP8bContext+0x101c>
100b560d0:     	mov	x0, x19
100b560d4:     	mov	x1, #0x0                ; =0
100b560d8:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b560dc:     	mov	x0, x27
100b560e0:     	mov	x1, x24
100b560e4:     	bl	0x101626dd4 <__Z25ED_screen_areas_iter_nextPK7bScreenPK7ScrArea>
100b560e8:     	mov	x24, x0
100b560ec:     	cbz	x0, 0x100b5628c <__Z20wm_event_do_handlersP8bContext+0x11c0>
100b560f0:     	mov	x0, x27
100b560f4:     	bl	0x1016358d0 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b560f8:     	cbz	w0, 0x100b56128 <__Z20wm_event_do_handlersP8bContext+0x105c>
100b560fc:     	ldrh	w8, [x26, #0x10]
100b56100:     	cmp	w8, #0x104
100b56104:     	b.eq	0x100b56128 <__Z20wm_event_do_handlersP8bContext+0x105c>
100b56108:     	and	w8, w8, #0xfff0
100b5610c:     	cmp	w8, #0x110
100b56110:     	b.eq	0x100b56128 <__Z20wm_event_do_handlersP8bContext+0x105c>
100b56114:     	add	x1, x26, #0x14
100b56118:     	mov	x0, x19
100b5611c:     	bl	0x100b570a0 <__ZL17area_event_insideP8bContextPKi>
100b56120:     	cmp	x24, x0
100b56124:     	b.ne	0x100b560dc <__Z20wm_event_do_handlersP8bContext+0x1010>
100b56128:     	ldrb	w8, [x27, #0x1f5]
100b5612c:     	cbnz	w8, 0x100b56288 <__Z20wm_event_do_handlersP8bContext+0x11bc>
100b56130:     	ldrh	w8, [x24, #0x52]
100b56134:     	tbz	w8, #0x8, 0x100b56144 <__Z20wm_event_do_handlersP8bContext+0x1078>
100b56138:     	add	x1, x26, #0x14
100b5613c:     	mov	x0, x24
100b56140:     	bl	0x1016555c8 <__Z21ED_area_azones_updateP7ScrAreaPKi>
100b56144:     	ldrh	w8, [x26, #0x10]
100b56148:     	cmp	w8, #0x104
100b5614c:     	b.eq	0x100b5616c <__Z20wm_event_do_handlersP8bContext+0x10a0>
100b56150:     	and	w8, w8, #0xfff0
100b56154:     	cmp	w8, #0x110
100b56158:     	b.eq	0x100b5616c <__Z20wm_event_do_handlersP8bContext+0x10a0>
100b5615c:     	add	x0, x24, #0x38
100b56160:     	add	x1, x26, #0x14
100b56164:     	bl	0x1007fc884 <__Z19BLI_rcti_isect_pt_vPK4rctiPKi>
100b56168:     	cbz	w0, 0x100b560dc <__Z20wm_event_do_handlersP8bContext+0x1010>
100b5616c:     	mov	x0, x19
100b56170:     	mov	x1, x24
100b56174:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b56178:     	ldrh	w8, [x26, #0x10]
100b5617c:     	cmp	w8, #0x104
100b56180:     	b.eq	0x100b561bc <__Z20wm_event_do_handlersP8bContext+0x10f0>
100b56184:     	and	w8, w8, #0xfff0
100b56188:     	cmp	w8, #0x110
100b5618c:     	b.eq	0x100b561bc <__Z20wm_event_do_handlersP8bContext+0x10f0>
100b56190:     	add	x2, x26, #0x14
100b56194:     	mov	x0, x24
100b56198:     	mov	w1, #-0x1               ; =-1
100b5619c:     	bl	0x1016293b4 <__Z29ED_area_find_region_xy_visualPK7ScrAreaiPKi>
100b561a0:     	mov	x2, x0
100b561a4:     	cbz	x0, 0x100b561e8 <__Z20wm_event_do_handlersP8bContext+0x111c>
100b561a8:     	mov	x0, x19
100b561ac:     	mov	x1, x26
100b561b0:     	bl	0x100b60a50 <__ZL27wm_event_do_region_handlersP8bContextP7wmEventP7ARegion>
100b561b4:     	mov	x23, x0
100b561b8:     	b	0x100b561ec <__Z20wm_event_do_handlersP8bContext+0x1120>
100b561bc:     	ldr	x22, [x24, #0x78]
100b561c0:     	cbz	x22, 0x100b561e8 <__Z20wm_event_do_handlersP8bContext+0x111c>
100b561c4:     	mov	w23, #0x0               ; =0
100b561c8:     	mov	x0, x19
100b561cc:     	mov	x1, x26
100b561d0:     	mov	x2, x22
100b561d4:     	bl	0x100b60a50 <__ZL27wm_event_do_region_handlersP8bContextP7wmEventP7ARegion>
100b561d8:     	orr	w23, w0, w23
100b561dc:     	ldr	x22, [x22]
100b561e0:     	cbnz	x22, 0x100b561c8 <__Z20wm_event_do_handlersP8bContext+0x10fc>
100b561e4:     	b	0x100b561ec <__Z20wm_event_do_handlersP8bContext+0x1120>
100b561e8:     	mov	w23, #0x0               ; =0
100b561ec:     	mov	x0, x19
100b561f0:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b561f4:     	cbz	x0, 0x100b56dd0 <__Z20wm_event_do_handlersP8bContext+0x1d04>
100b561f8:     	mov	x0, x19
100b561fc:     	mov	x1, #0x0                ; =0
100b56200:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b56204:     	orr	w28, w23, w28
100b56208:     	tbnz	w28, #0x0, 0x100b560d0 <__Z20wm_event_do_handlersP8bContext+0x1004>
100b5620c:     	mov	x0, x19
100b56210:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b56214:     	cbz	x0, 0x100b56234 <__Z20wm_event_do_handlersP8bContext+0x1168>
100b56218:     	ldr	w8, [x0, #0xa8]
100b5621c:     	ldp	w9, w10, [x26, #0x14]
100b56220:     	sub	w8, w9, w8
100b56224:     	str	w8, [x26, #0x1c]
100b56228:     	ldr	w8, [x0, #0xb0]
100b5622c:     	sub	w8, w10, w8
100b56230:     	b	0x100b5623c <__Z20wm_event_do_handlersP8bContext+0x1170>
100b56234:     	mov	w8, #-0x1               ; =-1
100b56238:     	str	w8, [x26, #0x1c]
100b5623c:     	str	w8, [x26, #0x20]
100b56240:     	add	x2, x24, #0x88
100b56244:     	mov	x0, x19
100b56248:     	mov	x1, x26
100b5624c:     	bl	0x100b57328 <__ZL14wm_handlers_doP8bContextP7wmEventP8ListBase>
100b56250:     	orr	w28, w0, w28
100b56254:     	b	0x100b560d0 <__Z20wm_event_do_handlersP8bContext+0x1004>
100b56258:     	cbz	x20, 0x100b560a8 <__Z20wm_event_do_handlersP8bContext+0xfdc>
100b5625c:     	ldr	x8, [x20, #0x18]
100b56260:     	ldr	x20, [x20]
100b56264:     	cbz	x8, 0x100b56274 <__Z20wm_event_do_handlersP8bContext+0x11a8>
100b56268:     	mov	x0, x19
100b5626c:     	blr	x8
100b56270:     	cbz	w0, 0x100b56258 <__Z20wm_event_do_handlersP8bContext+0x118c>
100b56274:     	mov	x0, x19
100b56278:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b5627c:     	mov	x1, x25
100b56280:     	bl	0x100b49ea8 <__Z26WM_paint_cursor_tag_redrawP8wmWindowP7ARegion>
100b56284:     	b	0x100b56258 <__Z20wm_event_do_handlersP8bContext+0x118c>
100b56288:     	strb	wzr, [x27, #0x1f5]
100b5628c:     	tbnz	w28, #0x0, 0x100b56370 <__Z20wm_event_do_handlersP8bContext+0x12a4>
100b56290:     	add	x1, x26, #0x14
100b56294:     	mov	x0, x19
100b56298:     	bl	0x100b570a0 <__ZL17area_event_insideP8bContextPKi>
100b5629c:     	mov	x1, x0
100b562a0:     	mov	x0, x19
100b562a4:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b562a8:     	mov	x0, x19
100b562ac:     	bl	0x1000b3bb8 <__Z13CTX_wm_screenPK8bContext>
100b562b0:     	mov	x20, x0
100b562b4:     	mov	x0, x19
100b562b8:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b562bc:     	mov	x23, #0x0               ; =0
100b562c0:     	cbz	x20, 0x100b5630c <__Z20wm_event_do_handlersP8bContext+0x1240>
100b562c4:     	mov	x22, x0
100b562c8:     	cbz	x0, 0x100b5630c <__Z20wm_event_do_handlersP8bContext+0x1240>
100b562cc:     	mov	x0, x20
100b562d0:     	bl	0x1016358d0 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b562d4:     	cbz	w0, 0x100b562f0 <__Z20wm_event_do_handlersP8bContext+0x1224>
100b562d8:     	add	x2, x26, #0x14
100b562dc:     	mov	x0, x22
100b562e0:     	mov	w1, #-0x1               ; =-1
100b562e4:     	bl	0x1016293b4 <__Z29ED_area_find_region_xy_visualPK7ScrAreaiPKi>
100b562e8:     	mov	x23, x0
100b562ec:     	b	0x100b5630c <__Z20wm_event_do_handlersP8bContext+0x1240>
100b562f0:     	add	x23, x22, #0x78
100b562f4:     	ldr	x23, [x23]
100b562f8:     	cbz	x23, 0x100b5630c <__Z20wm_event_do_handlersP8bContext+0x1240>
100b562fc:     	add	x0, x23, #0xa8
100b56300:     	add	x1, x26, #0x14
100b56304:     	bl	0x1007fc884 <__Z19BLI_rcti_isect_pt_vPK4rctiPKi>
100b56308:     	cbz	w0, 0x100b562f4 <__Z20wm_event_do_handlersP8bContext+0x1228>
100b5630c:     	mov	x0, x19
100b56310:     	mov	x1, x23
100b56314:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b56318:     	mov	x0, x19
100b5631c:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b56320:     	cbz	x0, 0x100b56340 <__Z20wm_event_do_handlersP8bContext+0x1274>
100b56324:     	ldr	w8, [x0, #0xa8]
100b56328:     	ldp	w9, w10, [x26, #0x14]
100b5632c:     	sub	w8, w9, w8
100b56330:     	str	w8, [x26, #0x1c]
100b56334:     	ldr	w8, [x0, #0xb0]
100b56338:     	sub	w8, w10, w8
100b5633c:     	b	0x100b56348 <__Z20wm_event_do_handlersP8bContext+0x127c>
100b56340:     	mov	w8, #-0x1               ; =-1
100b56344:     	str	w8, [x26, #0x1c]
100b56348:     	str	w8, [x26, #0x20]
100b5634c:     	add	x2, x21, #0x108
100b56350:     	mov	x0, x19
100b56354:     	mov	x1, x26
100b56358:     	bl	0x100b57328 <__ZL14wm_handlers_doP8bContextP7wmEventP8ListBase>
100b5635c:     	mov	x20, x0
100b56360:     	mov	x0, x19
100b56364:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b56368:     	cbz	x0, 0x100b56ec4 <__Z20wm_event_do_handlersP8bContext+0x1df8>
100b5636c:     	orr	w28, w20, w28
100b56370:     	ldrh	w8, [x26, #0x10]
100b56374:     	cmp	w8, #0x13
100b56378:     	b.hi	0x100b563b0 <__Z20wm_event_do_handlersP8bContext+0x12e4>
100b5637c:     	mov	w9, #0x1                ; =1
100b56380:     	lsl	w8, w9, w8
100b56384:     	mov	w9, #0x18e              ; =398
100b56388:     	movk	w9, #0xc, lsl #16
100b5638c:     	tst	w8, w9
100b56390:     	b.eq	0x100b563b0 <__Z20wm_event_do_handlersP8bContext+0x12e4>
100b56394:     	ldrh	w8, [x26, #0x12]
100b56398:     	cmp	w8, #0x1
100b5639c:     	b.ne	0x100b563b0 <__Z20wm_event_do_handlersP8bContext+0x12e4>
100b563a0:     	cbz	w28, 0x100b563b0 <__Z20wm_event_do_handlersP8bContext+0x12e4>
100b563a4:     	cmp	w28, #0x5
100b563a8:     	b.eq	0x100b563b0 <__Z20wm_event_do_handlersP8bContext+0x12e4>
100b563ac:     	strb	wzr, [x21, #0xdb]
100b563b0:     	ldrb	w8, [x21, #0xdd]
100b563b4:     	cbz	w8, 0x100b563bc <__Z20wm_event_do_handlersP8bContext+0x12f0>
100b563b8:     	strh	wzr, [x21, #0xdc]
100b563bc:     	ldr	w8, [sp, #0x24]
100b563c0:     	cbz	w8, 0x100b563cc <__Z20wm_event_do_handlersP8bContext+0x1300>
100b563c4:     	ldrb	w8, [x21, #0xdc]
100b563c8:     	cbz	w8, 0x100b564a8 <__Z20wm_event_do_handlersP8bContext+0x13dc>
100b563cc:     	ldr	x8, [x21, #0xf0]
100b563d0:     	ldr	w9, [x26, #0x14]
100b563d4:     	str	w9, [x8, #0x94]
100b563d8:     	ldr	w9, [x26, #0x18]
100b563dc:     	str	w9, [x8, #0x98]
100b563e0:     	ldr	x0, [x21, #0x168]
100b563e4:     	mov	x1, x26
100b563e8:     	bl	0x10078fea0 <__Z11BLI_remlinkP8ListBasePv>
100b563ec:     	mov	x0, x21
100b563f0:     	mov	x1, x26
100b563f4:     	bl	0x100b56fac <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent>
100b563f8:     	mov	x0, x19
100b563fc:     	bl	0x101664ddc <__Z21ED_undo_touch_recoverP8bContext>
100b56400:     	cbnz	w0, 0x100b56e74 <__Z20wm_event_do_handlersP8bContext+0x1da8>
100b56404:     	mov	x0, x19
100b56408:     	bl	0x1000b4c78 <__Z13CTX_data_mainPK8bContext>
100b5640c:     	mov	x23, x0
100b56410:     	ldr	x8, [sp, #0x28]
100b56414:     	ldr	w22, [x8, #0x144]
100b56418:     	ldr	w20, [x21, #0xc0]
100b5641c:     	mov	x0, x19
100b56420:     	mov	w1, #0x0                ; =0
100b56424:     	bl	0x101f99b2c <__Z25UI_ipad_ring_reopen_flushP8bContextb>
100b56428:     	mov	x0, x19
100b5642c:     	bl	0x1000b4c78 <__Z13CTX_data_mainPK8bContext>
100b56430:     	cmp	x0, x23
100b56434:     	b.ne	0x100b56dc8 <__Z20wm_event_do_handlersP8bContext+0x1cfc>
100b56438:     	mov	x0, x19
100b5643c:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b56440:     	ldr	x8, [sp, #0x28]
100b56444:     	cmp	x0, x8
100b56448:     	b.ne	0x100b56dc8 <__Z20wm_event_do_handlersP8bContext+0x1cfc>
100b5644c:     	mov	x0, x19
100b56450:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b56454:     	cmp	x0, x21
100b56458:     	b.ne	0x100b56dc8 <__Z20wm_event_do_handlersP8bContext+0x1cfc>
100b5645c:     	add	x0, x23, #0x678
100b56460:     	ldr	x1, [sp, #0x28]
100b56464:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b56468:     	cmn	w0, #0x1
100b5646c:     	b.eq	0x100b56dc8 <__Z20wm_event_do_handlersP8bContext+0x1cfc>
100b56470:     	ldr	x8, [sp, #0x28]
100b56474:     	ldr	w8, [x8, #0x144]
100b56478:     	cmp	w8, w22
100b5647c:     	b.ne	0x100b56dc8 <__Z20wm_event_do_handlersP8bContext+0x1cfc>
100b56480:     	ldr	x8, [sp, #0x28]
100b56484:     	add	x0, x8, #0x1a0
100b56488:     	mov	x1, x21
100b5648c:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b56490:     	cmn	w0, #0x1
100b56494:     	b.eq	0x100b56dc8 <__Z20wm_event_do_handlersP8bContext+0x1cfc>
100b56498:     	ldr	w8, [x21, #0xc0]
100b5649c:     	cmp	w8, w20
100b564a0:     	b.eq	0x100b5514c <__Z20wm_event_do_handlersP8bContext+0x80>
100b564a4:     	b	0x100b56dc8 <__Z20wm_event_do_handlersP8bContext+0x1cfc>
100b564a8:     	mov	x0, x21
100b564ac:     	bl	0x104a61074 <__Z27WM_window_get_active_screenPK8wmWindow>
100b564b0:     	mov	x23, x0
100b564b4:     	cbz	x0, 0x100b563cc <__Z20wm_event_do_handlersP8bContext+0x1300>
100b564b8:     	mov	x0, x21
100b564bc:     	mov	x1, x23
100b564c0:     	bl	0x101626db0 <__Z26ED_screen_areas_iter_firstPK8wmWindowPK7bScreen>
100b564c4:     	b	0x100b564d4 <__Z20wm_event_do_handlersP8bContext+0x1408>
100b564c8:     	mov	x0, x23
100b564cc:     	mov	x1, x24
100b564d0:     	bl	0x101626dd4 <__Z25ED_screen_areas_iter_nextPK7bScreenPK7ScrArea>
100b564d4:     	mov	x24, x0
100b564d8:     	cbz	x0, 0x100b563cc <__Z20wm_event_do_handlersP8bContext+0x1300>
100b564dc:     	ldr	x25, [x24, #0x78]
100b564e0:     	cbnz	x25, 0x100b564f0 <__Z20wm_event_do_handlersP8bContext+0x1424>
100b564e4:     	b	0x100b564c8 <__Z20wm_event_do_handlersP8bContext+0x13fc>
100b564e8:     	ldr	x25, [x25]
100b564ec:     	cbz	x25, 0x100b564c8 <__Z20wm_event_do_handlersP8bContext+0x13fc>
100b564f0:     	ldr	x8, [x25, #0x128]
100b564f4:     	ldr	x0, [x8, #0x340]
100b564f8:     	cbz	x0, 0x100b564e8 <__Z20wm_event_do_handlersP8bContext+0x141c>
100b564fc:     	bl	0x100b3f93c <__Z45WM_gizmomap_tag_delay_refresh_for_tweak_checkP10wmGizmoMap>
100b56500:     	cbz	w0, 0x100b564e8 <__Z20wm_event_do_handlersP8bContext+0x141c>
100b56504:     	mov	x0, x25
100b56508:     	bl	0x1016203a8 <__Z20ED_region_tag_redrawP7ARegion>
100b5650c:     	b	0x100b564e8 <__Z20wm_event_do_handlersP8bContext+0x141c>
100b56510:     	mov	w8, #0x0                ; =0
100b56514:     	b	0x100b55b64 <__Z20wm_event_do_handlersP8bContext+0xa98>
100b56518:     	ldp	x9, x10, [x14, #0x18]
100b5651c:     	ldr	x11, [x8]
100b56520:     	cbnz	x11, 0x100b55d80 <__Z20wm_event_do_handlersP8bContext+0xcb4>
100b56524:     	ldr	x0, [x21, #0x168]
100b56528:     	mov	x1, x26
100b5652c:     	bl	0x10078fea0 <__Z11BLI_remlinkP8ListBasePv>
100b56530:     	mov	x0, x21
100b56534:     	mov	x1, x26
100b56538:     	bl	0x100b56fac <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent>
100b5653c:     	b	0x100b5514c <__Z20wm_event_do_handlersP8bContext+0x80>
100b56540:     	mov	x0, x19
100b56544:     	mov	x1, x25
100b56548:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b5654c:     	mov	x0, x19
100b56550:     	mov	x1, x28
100b56554:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b56558:     	mov	w20, #0x2               ; =2
100b5655c:     	b	0x100b556c0 <__Z20wm_event_do_handlersP8bContext+0x5f4>
100b56560:     	mov	x11, x21
100b56564:     	cmp	x9, x21
100b56568:     	b.hi	0x100b56574 <__Z20wm_event_do_handlersP8bContext+0x14a8>
100b5656c:     	udiv	x11, x21, x9
100b56570:     	msub	x11, x11, x9, x21
100b56574:     	adrp	x12, 0x107ef7000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b56578:     	ldr	x12, [x12, #0x7a8]
100b5657c:     	ldr	x12, [x12, x11, lsl #3]
100b56580:     	cbz	x12, 0x100b565dc <__Z20wm_event_do_handlersP8bContext+0x1510>
100b56584:     	ldr	x1, [x12]
100b56588:     	cbz	x1, 0x100b565dc <__Z20wm_event_do_handlersP8bContext+0x1510>
100b5658c:     	sub	x12, x9, #0x1
100b56590:     	b	0x100b565a8 <__Z20wm_event_do_handlersP8bContext+0x14dc>
100b56594:     	ldr	x13, [x1, #0x10]
100b56598:     	cmp	x13, x21
100b5659c:     	b.eq	0x100b56808 <__Z20wm_event_do_handlersP8bContext+0x173c>
100b565a0:     	ldr	x1, [x1]
100b565a4:     	cbz	x1, 0x100b565dc <__Z20wm_event_do_handlersP8bContext+0x1510>
100b565a8:     	ldr	x13, [x1, #0x8]
100b565ac:     	cmp	x13, x21
100b565b0:     	b.eq	0x100b56594 <__Z20wm_event_do_handlersP8bContext+0x14c8>
100b565b4:     	cmp	x10, #0x1
100b565b8:     	b.hi	0x100b565c4 <__Z20wm_event_do_handlersP8bContext+0x14f8>
100b565bc:     	and	x13, x13, x12
100b565c0:     	b	0x100b565d4 <__Z20wm_event_do_handlersP8bContext+0x1508>
100b565c4:     	cmp	x13, x9
100b565c8:     	b.lo	0x100b565d4 <__Z20wm_event_do_handlersP8bContext+0x1508>
100b565cc:     	udiv	x14, x13, x9
100b565d0:     	msub	x13, x14, x9, x13
100b565d4:     	cmp	x13, x11
100b565d8:     	b.eq	0x100b565a0 <__Z20wm_event_do_handlersP8bContext+0x14d4>
100b565dc:     	ldrh	w8, [x26, #0x10]
100b565e0:     	cmp	w8, #0x1
100b565e4:     	b.ne	0x100b55a98 <__Z20wm_event_do_handlersP8bContext+0x9cc>
100b565e8:     	ldrh	w8, [x26, #0x12]
100b565ec:     	cmp	w8, #0x1
100b565f0:     	b.ne	0x100b55a98 <__Z20wm_event_do_handlersP8bContext+0x9cc>
100b565f4:     	add	x2, x26, #0x14
100b565f8:     	add	x3, sp, #0x48
100b565fc:     	add	x4, sp, #0x120
100b56600:     	add	x5, sp, #0x30
100b56604:     	mov	x0, x19
100b56608:     	mov	x1, x21
100b5660c:     	bl	0x1016418e4 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion>
100b56610:     	cbz	w0, 0x100b55a98 <__Z20wm_event_do_handlersP8bContext+0x9cc>
100b56614:     	ldr	x20, [sp, #0x48]
100b56618:     	ldrh	w8, [x26, #0x10]
100b5661c:     	cmp	w8, #0x1
100b56620:     	b.ne	0x100b56744 <__Z20wm_event_do_handlersP8bContext+0x1678>
100b56624:     	adrp	x8, 0x107ef7000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b56628:     	add	x8, x8, #0x7b8
100b5662c:     	ldr	x9, [x8, #0x8]
100b56630:     	mov	x8, x20
100b56634:     	cmp	x9, #0x40
100b56638:     	b.lo	0x100b566ec <__Z20wm_event_do_handlersP8bContext+0x1620>
100b5663c:     	adrp	x8, 0x107ef7000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b56640:     	add	x8, x8, #0x7b8
100b56644:     	ldr	x1, [x8]
100b56648:     	mov	x8, x20
100b5664c:     	cbnz	x1, 0x100b5665c <__Z20wm_event_do_handlersP8bContext+0x1590>
100b56650:     	b	0x100b566ec <__Z20wm_event_do_handlersP8bContext+0x1620>
100b56654:     	ldr	x1, [x1]
100b56658:     	cbz	x1, 0x100b566e8 <__Z20wm_event_do_handlersP8bContext+0x161c>
100b5665c:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b56660:     	add	x8, x8, #0x28
100b56664:     	ldr	x8, [x8]
100b56668:     	ldr	x8, [x8, #0x678]
100b5666c:     	cbz	x8, 0x100b566bc <__Z20wm_event_do_handlersP8bContext+0x15f0>
100b56670:     	mov	w9, #0x0                ; =0
100b56674:     	b	0x100b56680 <__Z20wm_event_do_handlersP8bContext+0x15b4>
100b56678:     	ldr	x8, [x8]
100b5667c:     	cbz	x8, 0x100b566b8 <__Z20wm_event_do_handlersP8bContext+0x15ec>
100b56680:     	ldr	x10, [x8, #0x1a0]
100b56684:     	cbz	x10, 0x100b56678 <__Z20wm_event_do_handlersP8bContext+0x15ac>
100b56688:     	ldr	x11, [x1, #0x10]
100b5668c:     	b	0x100b56698 <__Z20wm_event_do_handlersP8bContext+0x15cc>
100b56690:     	ldr	x10, [x10]
100b56694:     	cbz	x10, 0x100b56678 <__Z20wm_event_do_handlersP8bContext+0x15ac>
100b56698:     	cmp	x11, x10
100b5669c:     	b.ne	0x100b56690 <__Z20wm_event_do_handlersP8bContext+0x15c4>
100b566a0:     	ldrsw	x12, [x10, #0xc0]
100b566a4:     	ldr	x13, [x1, #0xd0]
100b566a8:     	cmp	x13, x12
100b566ac:     	cset	w12, eq
100b566b0:     	orr	w9, w12, w9
100b566b4:     	b	0x100b56690 <__Z20wm_event_do_handlersP8bContext+0x15c4>
100b566b8:     	tbnz	w9, #0x0, 0x100b56654 <__Z20wm_event_do_handlersP8bContext+0x1588>
100b566bc:     	ldr	x22, [x1]
100b566c0:     	add	x8, sp, #0x50
100b566c4:     	adrp	x0, 0x107ef7000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b566c8:     	add	x0, x0, #0x7a8
100b566cc:     	bl	0x100b43e94 <__ZNSt3__112__hash_tableIiNS_4hashIiEENS_8equal_toIiEENS_9allocatorIiEEE6removeENS_21__hash_const_iteratorIPNS_11__hash_nodeIiPvEEEE>
100b566d0:     	ldr	x0, [sp, #0x50]
100b566d4:     	str	xzr, [sp, #0x50]
100b566d8:     	cbz	x0, 0x100b566e0 <__Z20wm_event_do_handlersP8bContext+0x1614>
100b566dc:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b566e0:     	mov	x1, x22
100b566e4:     	cbnz	x1, 0x100b5665c <__Z20wm_event_do_handlersP8bContext+0x1590>
100b566e8:     	ldr	x8, [sp, #0x48]
100b566ec:     	ldp	q0, q1, [sp, #0x1a0]
100b566f0:     	stp	q0, q1, [sp, #0xd0]
100b566f4:     	ldr	q0, [sp, #0x1c0]
100b566f8:     	str	q0, [sp, #0xf0]
100b566fc:     	ldr	x9, [sp, #0x1d0]
100b56700:     	ldp	q0, q1, [sp, #0x160]
100b56704:     	stp	q0, q1, [sp, #0x90]
100b56708:     	ldp	q0, q1, [sp, #0x180]
100b5670c:     	stp	q0, q1, [sp, #0xb0]
100b56710:     	ldp	q0, q1, [sp, #0x120]
100b56714:     	stp	q0, q1, [sp, #0x50]
100b56718:     	ldp	q0, q1, [sp, #0x140]
100b5671c:     	stp	q0, q1, [sp, #0x70]
100b56720:     	ldrsw	x10, [x21, #0xc0]
100b56724:     	stp	x9, x10, [sp, #0x100]
100b56728:     	str	x8, [sp, #0x110]
100b5672c:     	add	x1, sp, #0x40
100b56730:     	add	x2, sp, #0x40
100b56734:     	add	x3, sp, #0x50
100b56738:     	adrp	x0, 0x107ef7000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b5673c:     	add	x0, x0, #0x7a8
100b56740:     	bl	0x100b60738 <__ZNSt3__112__hash_tableINS_17__hash_value_typeIm26wmIPadKnifeHardwareContactEENS_22__unordered_map_hasherImS3_NS_4hashImEENS_8equal_toImEELb1EEENS_21__unordered_map_equalImS3_S8_S6_Lb1EEENS_9allocatorIS3_EEE25__emplace_unique_key_argsImJRKmS2_EEENS_4pairINS_15__hash_iteratorIPNS_11__hash_nodeIS3_PvEEEEbEERKT_DpOT0_>
100b56744:     	ldr	x8, [sp, #0x120]
100b56748:     	cbz	x8, 0x100b56774 <__Z20wm_event_do_handlersP8bContext+0x16a8>
100b5674c:     	ldr	x8, [sp, #0x130]
100b56750:     	cbz	x8, 0x100b56774 <__Z20wm_event_do_handlersP8bContext+0x16a8>
100b56754:     	ldr	x8, [sp, #0x150]
100b56758:     	cbz	x8, 0x100b56774 <__Z20wm_event_do_handlersP8bContext+0x16a8>
100b5675c:     	ldr	x8, [sp, #0x1a8]
100b56760:     	cbz	x8, 0x100b56774 <__Z20wm_event_do_handlersP8bContext+0x16a8>
100b56764:     	ldr	x8, [sp, #0x1b8]
100b56768:     	cbz	x8, 0x100b56774 <__Z20wm_event_do_handlersP8bContext+0x16a8>
100b5676c:     	ldr	x8, [sp, #0x30]
100b56770:     	cbnz	x8, 0x100b55ebc <__Z20wm_event_do_handlersP8bContext+0xdf0>
100b56774:     	ldr	x2, [sp, #0x48]
100b56778:     	mov	x0, x19
100b5677c:     	mov	x1, x21
100b56780:     	bl	0x101641d58 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy>
100b56784:     	b	0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b56788:     	mov	x0, x19
100b5678c:     	mov	x1, x25
100b56790:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b56794:     	mov	x0, x19
100b56798:     	mov	x1, x28
100b5679c:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b567a0:     	cmp	w22, #0x1
100b567a4:     	mov	w8, #0x1                ; =1
100b567a8:     	cinc	w20, w8, eq
100b567ac:     	b	0x100b556c0 <__Z20wm_event_do_handlersP8bContext+0x5f4>
100b567b0:     	ldr	x2, [sp, #0x48]
100b567b4:     	mov	x0, x19
100b567b8:     	mov	x1, x21
100b567bc:     	bl	0x101641d58 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy>
100b567c0:     	b	0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b567c4:     	mov	x0, x19
100b567c8:     	mov	x1, x21
100b567cc:     	mov	x2, x23
100b567d0:     	bl	0x101641d58 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy>
100b567d4:     	b	0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b567d8:     	bl	0x100ae4298 <_MEM_freeN>
100b567dc:     	mov	w8, #0x0                ; =0
100b567e0:     	str	xzr, [x26, #0x88]
100b567e4:     	mov	w9, #0x3                ; =3
100b567e8:     	str	w9, [x26, #0x80]
100b567ec:     	ldr	x9, [sp, #0x28]
100b567f0:     	ldr	x9, [x9, #0x5c0]
100b567f4:     	add	x9, x9, #0xb8
100b567f8:     	str	x9, [x26, #0x88]
100b567fc:     	mov	w9, #0x1                ; =1
100b56800:     	strh	w9, [x26, #0x82]
100b56804:     	b	0x100b55b5c <__Z20wm_event_do_handlersP8bContext+0xa90>
100b56808:     	ldr	x9, [x1, #0xd0]
100b5680c:     	ldrsw	x10, [x21, #0xc0]
100b56810:     	cmp	x9, x10
100b56814:     	b.eq	0x100b5687c <__Z20wm_event_do_handlersP8bContext+0x17b0>
100b56818:     	cmp	w8, #0x1
100b5681c:     	b.ne	0x100b5683c <__Z20wm_event_do_handlersP8bContext+0x1770>
100b56820:     	ldrh	w8, [x26, #0x12]
100b56824:     	cmp	w8, #0x1
100b56828:     	b.ne	0x100b5683c <__Z20wm_event_do_handlersP8bContext+0x1770>
100b5682c:     	adrp	x0, 0x107ef7000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b56830:     	add	x0, x0, #0x7a8
100b56834:     	bl	0x100b606f8 <__ZNSt3__113unordered_mapIm26wmIPadKnifeHardwareContactNS_4hashImEENS_8equal_toImEENS_9allocatorINS_4pairIKmS1_EEEEE5eraseB8ne190102ENS_19__hash_map_iteratorINS_15__hash_iteratorIPNS_11__hash_nodeINS_17__hash_value_typeImS1_EEPvEEEEEE>
100b56838:     	b	0x100b565dc <__Z20wm_event_do_handlersP8bContext+0x1510>
100b5683c:     	str	xzr, [x1, #0xc8]
100b56840:     	movi.16b	v0, #0x0
100b56844:     	stur	q0, [x1, #0xb8]
100b56848:     	stur	q0, [x1, #0xa8]
100b5684c:     	stur	q0, [x1, #0x98]
100b56850:     	stur	q0, [x1, #0x88]
100b56854:     	stur	q0, [x1, #0x78]
100b56858:     	stur	q0, [x1, #0x68]
100b5685c:     	stur	q0, [x1, #0x58]
100b56860:     	stur	q0, [x1, #0x48]
100b56864:     	stur	q0, [x1, #0x38]
100b56868:     	stur	q0, [x1, #0x28]
100b5686c:     	stur	q0, [x1, #0x18]
100b56870:     	ldrsw	x8, [x21, #0xc0]
100b56874:     	stp	x8, xzr, [x1, #0xd0]
100b56878:     	ldrh	w8, [x26, #0x10]
100b5687c:     	cmp	w8, #0x1
100b56880:     	b.ne	0x100b56914 <__Z20wm_event_do_handlersP8bContext+0x1848>
100b56884:     	ldrh	w8, [x26, #0x12]
100b56888:     	cmp	w8, #0x1
100b5688c:     	b.ne	0x100b56a98 <__Z20wm_event_do_handlersP8bContext+0x19cc>
100b56890:     	ldr	x20, [x1, #0xd8]
100b56894:     	add	x8, sp, #0x50
100b56898:     	adrp	x0, 0x107ef7000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b5689c:     	add	x0, x0, #0x7a8
100b568a0:     	bl	0x100b43e94 <__ZNSt3__112__hash_tableIiNS_4hashIiEENS_8equal_toIiEENS_9allocatorIiEEE6removeENS_21__hash_const_iteratorIPNS_11__hash_nodeIiPvEEEE>
100b568a4:     	ldr	x0, [sp, #0x50]
100b568a8:     	str	xzr, [sp, #0x50]
100b568ac:     	cbz	x0, 0x100b568b4 <__Z20wm_event_do_handlersP8bContext+0x17e8>
100b568b0:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b568b4:     	mov	x0, x19
100b568b8:     	mov	x1, x21
100b568bc:     	mov	x2, x20
100b568c0:     	bl	0x101641d58 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy>
100b568c4:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b568c8:     	add	x8, x8, #0x28
100b568cc:     	ldr	x8, [x8]
100b568d0:     	cbz	x8, 0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b568d4:     	ldr	x20, [x8, #0x678]
100b568d8:     	cbz	x20, 0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b568dc:     	mov	x22, #0x0               ; =0
100b568e0:     	b	0x100b568f4 <__Z20wm_event_do_handlersP8bContext+0x1828>
100b568e4:     	mov	x8, x22
100b568e8:     	ldr	x20, [x20]
100b568ec:     	mov	x22, x8
100b568f0:     	cbz	x20, 0x100b56bf8 <__Z20wm_event_do_handlersP8bContext+0x1b2c>
100b568f4:     	add	x0, x20, #0x1a0
100b568f8:     	mov	x1, x21
100b568fc:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b56900:     	cmn	w0, #0x1
100b56904:     	b.eq	0x100b568e4 <__Z20wm_event_do_handlersP8bContext+0x1818>
100b56908:     	mov	x8, x20
100b5690c:     	cbz	x22, 0x100b568e8 <__Z20wm_event_do_handlersP8bContext+0x181c>
100b56910:     	b	0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b56914:     	ldur	q0, [x1, #0xa8]
100b56918:     	ldur	q1, [x1, #0xb8]
100b5691c:     	stp	q0, q1, [sp, #0xe0]
100b56920:     	ldur	q0, [x1, #0xc8]
100b56924:     	str	q0, [sp, #0x100]
100b56928:     	ldr	x9, [x1, #0xd8]
100b5692c:     	str	x9, [sp, #0x110]
100b56930:     	ldur	q0, [x1, #0x68]
100b56934:     	ldur	q1, [x1, #0x78]
100b56938:     	stp	q0, q1, [sp, #0xa0]
100b5693c:     	ldur	q0, [x1, #0x88]
100b56940:     	ldur	q1, [x1, #0x98]
100b56944:     	stp	q0, q1, [sp, #0xc0]
100b56948:     	ldur	q0, [x1, #0x28]
100b5694c:     	ldur	q1, [x1, #0x38]
100b56950:     	stp	q0, q1, [sp, #0x60]
100b56954:     	ldur	q0, [x1, #0x48]
100b56958:     	ldur	q1, [x1, #0x58]
100b5695c:     	stp	q0, q1, [sp, #0x80]
100b56960:     	ldur	q0, [x1, #0x18]
100b56964:     	str	q0, [sp, #0x50]
100b56968:     	mov	x20, x9
100b5696c:     	str	x20, [sp, #0x48]
100b56970:     	mov	x2, x20
100b56974:     	cmp	w8, #0x104
100b56978:     	b.eq	0x100b56b00 <__Z20wm_event_do_handlersP8bContext+0x1a34>
100b5697c:     	b	0x100b56b24 <__Z20wm_event_do_handlersP8bContext+0x1a58>
100b56980:     	mov	w8, #-0x1               ; =-1
100b56984:     	str	w8, [x26, #0x1c]
100b56988:     	str	w8, [x26, #0x20]
100b5698c:     	ldp	q0, q1, [sp, #0x120]
100b56990:     	ldr	x10, [sp, #0x10]
100b56994:     	stp	q0, q1, [x10]
100b56998:     	ldp	q0, q1, [sp, #0x1a0]
100b5699c:     	stp	q0, q1, [x10, #0x80]
100b569a0:     	ldr	q0, [sp, #0x1c0]
100b569a4:     	str	q0, [x10, #0xa0]
100b569a8:     	ldr	x8, [sp, #0x1d0]
100b569ac:     	ldp	q0, q1, [sp, #0x160]
100b569b0:     	stp	q0, q1, [x10, #0x40]
100b569b4:     	ldp	q0, q1, [sp, #0x180]
100b569b8:     	stp	q0, q1, [x10, #0x60]
100b569bc:     	ldp	q0, q1, [sp, #0x140]
100b569c0:     	stp	q0, q1, [x10, #0x20]
100b569c4:     	ldr	x9, [sp, #0x48]
100b569c8:     	stp	x8, x9, [x10, #0xb0]
100b569cc:     	str	x20, [x10, #0xc0]
100b569d0:     	ldr	w8, [x26, #0x14]
100b569d4:     	str	w8, [x10, #0xc8]
100b569d8:     	ldr	w8, [x26, #0x18]
100b569dc:     	str	w8, [x10, #0xcc]
100b569e0:     	ldrh	w8, [x26, #0x10]
100b569e4:     	cmp	w8, #0x1
100b569e8:     	b.ne	0x100b56a08 <__Z20wm_event_do_handlersP8bContext+0x193c>
100b569ec:     	ldrh	w8, [x26, #0x12]
100b569f0:     	cmp	w8, #0x2
100b569f4:     	b.ne	0x100b56a08 <__Z20wm_event_do_handlersP8bContext+0x193c>
100b569f8:     	ldrb	w8, [x26, #0x7c]
100b569fc:     	tst	w8, #0x40
100b56a00:     	cset	w8, eq
100b56a04:     	b	0x100b56a0c <__Z20wm_event_do_handlersP8bContext+0x1940>
100b56a08:     	mov	w8, #0x0                ; =0
100b56a0c:     	ldr	x9, [sp, #0x10]
100b56a10:     	strb	w8, [x9, #0xd0]
100b56a14:     	mov	x0, x19
100b56a18:     	mov	x1, x26
100b56a1c:     	bl	0x101f384e8 <__Z30UI_ipad_knife_hud_event_handleP8bContextPK7wmEvent>
100b56a20:     	ldr	x8, [sp, #0x10]
100b56a24:     	strh	wzr, [x8, #0xd0]
100b56a28:     	movi.16b	v0, #0x0
100b56a2c:     	stp	q0, q0, [x8, #0xb0]
100b56a30:     	stp	q0, q0, [x8, #0x90]
100b56a34:     	stp	q0, q0, [x8, #0x70]
100b56a38:     	stp	q0, q0, [x8, #0x50]
100b56a3c:     	stp	q0, q0, [x8, #0x30]
100b56a40:     	stp	q0, q0, [x8, #0x10]
100b56a44:     	str	q0, [x8]
100b56a48:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b56a4c:     	add	x8, x8, #0x28
100b56a50:     	ldr	x8, [x8]
100b56a54:     	cbz	x8, 0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b56a58:     	ldr	x20, [x8, #0x678]
100b56a5c:     	cbz	x20, 0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b56a60:     	mov	x25, #0x0               ; =0
100b56a64:     	b	0x100b56a78 <__Z20wm_event_do_handlersP8bContext+0x19ac>
100b56a68:     	mov	x23, x25
100b56a6c:     	ldr	x20, [x20]
100b56a70:     	mov	x25, x23
100b56a74:     	cbz	x20, 0x100b56b64 <__Z20wm_event_do_handlersP8bContext+0x1a98>
100b56a78:     	add	x0, x20, #0x1a0
100b56a7c:     	mov	x1, x21
100b56a80:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b56a84:     	cmn	w0, #0x1
100b56a88:     	b.eq	0x100b56a68 <__Z20wm_event_do_handlersP8bContext+0x199c>
100b56a8c:     	mov	x23, x20
100b56a90:     	cbz	x25, 0x100b56a6c <__Z20wm_event_do_handlersP8bContext+0x19a0>
100b56a94:     	b	0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b56a98:     	ldur	q0, [x1, #0xa8]
100b56a9c:     	ldur	q1, [x1, #0xb8]
100b56aa0:     	stp	q0, q1, [sp, #0xe0]
100b56aa4:     	ldur	q0, [x1, #0xc8]
100b56aa8:     	str	q0, [sp, #0x100]
100b56aac:     	ldr	x9, [x1, #0xd8]
100b56ab0:     	str	x9, [sp, #0x110]
100b56ab4:     	ldur	q0, [x1, #0x68]
100b56ab8:     	ldur	q1, [x1, #0x78]
100b56abc:     	stp	q0, q1, [sp, #0xa0]
100b56ac0:     	ldur	q0, [x1, #0x88]
100b56ac4:     	ldur	q1, [x1, #0x98]
100b56ac8:     	stp	q0, q1, [sp, #0xc0]
100b56acc:     	ldur	q0, [x1, #0x28]
100b56ad0:     	ldur	q1, [x1, #0x38]
100b56ad4:     	stp	q0, q1, [sp, #0x60]
100b56ad8:     	ldur	q0, [x1, #0x48]
100b56adc:     	ldur	q1, [x1, #0x58]
100b56ae0:     	stp	q0, q1, [sp, #0x80]
100b56ae4:     	ldur	q0, [x1, #0x18]
100b56ae8:     	str	q0, [sp, #0x50]
100b56aec:     	mov	x20, x9
100b56af0:     	str	x20, [sp, #0x48]
100b56af4:     	mov	x2, x20
100b56af8:     	cmp	w8, #0x2
100b56afc:     	b.ne	0x100b56b24 <__Z20wm_event_do_handlersP8bContext+0x1a58>
100b56b00:     	sub	x8, x29, #0x80
100b56b04:     	adrp	x0, 0x107ef7000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b56b08:     	add	x0, x0, #0x7a8
100b56b0c:     	bl	0x100b43e94 <__ZNSt3__112__hash_tableIiNS_4hashIiEENS_8equal_toIiEENS_9allocatorIiEEE6removeENS_21__hash_const_iteratorIPNS_11__hash_nodeIiPvEEEE>
100b56b10:     	ldur	x0, [x29, #-0x80]
100b56b14:     	stur	xzr, [x29, #-0x80]
100b56b18:     	cbz	x0, 0x100b56b20 <__Z20wm_event_do_handlersP8bContext+0x1a54>
100b56b1c:     	bl	0x104b751a8 <_zlibVersion+0x104b751a8>
100b56b20:     	ldr	x2, [sp, #0x48]
100b56b24:     	add	x3, sp, #0x120
100b56b28:     	add	x4, sp, #0x30
100b56b2c:     	mov	x0, x19
100b56b30:     	mov	x1, x21
100b56b34:     	bl	0x101641574 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion>
100b56b38:     	cbz	w0, 0x100b56b50 <__Z20wm_event_do_handlersP8bContext+0x1a84>
100b56b3c:     	add	x0, sp, #0x120
100b56b40:     	add	x1, sp, #0x50
100b56b44:     	mov	w2, #0xb8               ; =184
100b56b48:     	bl	0x104b76054 <_zlibVersion+0x104b76054>
100b56b4c:     	cbz	w0, 0x100b55ebc <__Z20wm_event_do_handlersP8bContext+0xdf0>
100b56b50:     	ldr	x2, [sp, #0x48]
100b56b54:     	mov	x0, x19
100b56b58:     	mov	x1, x21
100b56b5c:     	bl	0x101641d58 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy>
100b56b60:     	b	0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b56b64:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b56b68:     	add	x8, x8, #0x28
100b56b6c:     	ldr	x8, [x8]
100b56b70:     	cmp	x8, x22
100b56b74:     	ccmp	x23, #0x0, #0x4, eq
100b56b78:     	b.eq	0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b56b7c:     	mov	x0, x19
100b56b80:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b56b84:     	cmp	x0, x23
100b56b88:     	b.ne	0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b56b8c:     	mov	x0, x19
100b56b90:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b56b94:     	cmp	x0, x21
100b56b98:     	b.ne	0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b56b9c:     	mov	x0, x21
100b56ba0:     	bl	0x104a61074 <__Z27WM_window_get_active_screenPK8wmWindow>
100b56ba4:     	mov	x20, x0
100b56ba8:     	cbz	x0, 0x100b56c10 <__Z20wm_event_do_handlersP8bContext+0x1b44>
100b56bac:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b56bb0:     	add	x8, x8, #0x28
100b56bb4:     	ldr	x8, [x8]
100b56bb8:     	add	x0, x8, #0x598
100b56bbc:     	mov	x1, x20
100b56bc0:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b56bc4:     	cmn	w0, #0x1
100b56bc8:     	b.eq	0x100b56c10 <__Z20wm_event_do_handlersP8bContext+0x1b44>
100b56bcc:     	add	x1, x20, #0x1c0
100b56bd0:     	ldr	x1, [x1]
100b56bd4:     	cbz	x1, 0x100b56c14 <__Z20wm_event_do_handlersP8bContext+0x1b48>
100b56bd8:     	cmp	x1, x24
100b56bdc:     	b.ne	0x100b56bd0 <__Z20wm_event_do_handlersP8bContext+0x1b04>
100b56be0:     	add	x23, x1, #0x78
100b56be4:     	ldr	x23, [x23]
100b56be8:     	cbz	x23, 0x100b56c18 <__Z20wm_event_do_handlersP8bContext+0x1b4c>
100b56bec:     	cmp	x23, x28
100b56bf0:     	b.ne	0x100b56be4 <__Z20wm_event_do_handlersP8bContext+0x1b18>
100b56bf4:     	b	0x100b56c18 <__Z20wm_event_do_handlersP8bContext+0x1b4c>
100b56bf8:     	cbz	x8, 0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b56bfc:     	mov	x0, x19
100b56c00:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b56c04:     	cmp	x0, x21
100b56c08:     	b.ne	0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b56c0c:     	b	0x100b565dc <__Z20wm_event_do_handlersP8bContext+0x1510>
100b56c10:     	mov	x1, #0x0                ; =0
100b56c14:     	mov	x23, #0x0               ; =0
100b56c18:     	mov	x0, x19
100b56c1c:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b56c20:     	mov	x0, x19
100b56c24:     	mov	x1, x23
100b56c28:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b56c2c:     	sturh	wzr, [x21, #0xdb]
100b56c30:     	b	0x100b55ab8 <__Z20wm_event_do_handlersP8bContext+0x9ec>
100b56c34:     	ldrb	w8, [x21, #0x100]
100b56c38:     	cbz	w8, 0x100b56d34 <__Z20wm_event_do_handlersP8bContext+0x1c68>
100b56c3c:     	ldr	x8, [x21, #0xf0]
100b56c40:     	cbz	x8, 0x100b56d34 <__Z20wm_event_do_handlersP8bContext+0x1c68>
100b56c44:     	ldr	q0, [x8]
100b56c48:     	str	q0, [sp, #0x30]
100b56c4c:     	ldp	w20, w22, [x8, #0x14]
100b56c50:     	ldur	q0, [x8, #0x3c]
100b56c54:     	ldur	q1, [x8, #0x4c]
100b56c58:     	stp	q0, q1, [sp, #0x70]
100b56c5c:     	ldur	q0, [x8, #0x5c]
100b56c60:     	ldur	q1, [x8, #0x6c]
100b56c64:     	stp	q0, q1, [sp, #0x90]
100b56c68:     	ldur	q0, [x8, #0x1c]
100b56c6c:     	ldur	q1, [x8, #0x2c]
100b56c70:     	stp	q0, q1, [sp, #0x50]
100b56c74:     	ldr	q0, [x8, #0x80]
100b56c78:     	ldr	w9, [x8, #0x90]
100b56c7c:     	str	w9, [sp, #0x130]
100b56c80:     	str	q0, [sp, #0x120]
100b56c84:     	ldr	w9, [x8, #0xac]
100b56c88:     	stur	w9, [x29, #-0x70]
100b56c8c:     	ldur	q0, [x8, #0x9c]
100b56c90:     	stur	q0, [x29, #-0x80]
100b56c94:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b56c98:     	add	x8, x8, #0x760
100b56c9c:     	ldr	x8, [x8]
100b56ca0:     	mov	w0, #0x1                ; =1
100b56ca4:     	mov	w1, #0xb0               ; =176
100b56ca8:     	mov	w2, #0x8                ; =8
100b56cac:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b56cb0:     	add	x3, x3, #0xa9d
100b56cb4:     	blr	x8
100b56cb8:     	mov	x1, x0
100b56cbc:     	ldr	q0, [sp, #0x30]
100b56cc0:     	str	q0, [x1]
100b56cc4:     	mov	w8, #0x4                ; =4
100b56cc8:     	stp	w8, w20, [x1, #0x10]
100b56ccc:     	str	w22, [x1, #0x18]
100b56cd0:     	ldr	q0, [sp, #0x70]
100b56cd4:     	ldr	q1, [sp, #0x50]
100b56cd8:     	stur	q0, [x1, #0x3c]
100b56cdc:     	ldr	q0, [sp, #0x80]
100b56ce0:     	stur	q0, [x1, #0x4c]
100b56ce4:     	ldr	q0, [sp, #0x90]
100b56ce8:     	stur	q0, [x1, #0x5c]
100b56cec:     	ldr	q0, [sp, #0xa0]
100b56cf0:     	stur	q0, [x1, #0x6c]
100b56cf4:     	stur	q1, [x1, #0x1c]
100b56cf8:     	ldr	q0, [sp, #0x60]
100b56cfc:     	stur	q0, [x1, #0x2c]
100b56d00:     	str	wzr, [x1, #0x7c]
100b56d04:     	ldr	w8, [sp, #0x130]
100b56d08:     	ldr	q0, [sp, #0x120]
100b56d0c:     	str	q0, [x1, #0x80]
100b56d10:     	stp	w8, w20, [x1, #0x90]
100b56d14:     	str	w22, [x1, #0x98]
100b56d18:     	ldur	w8, [x29, #-0x70]
100b56d1c:     	str	w8, [x1, #0xac]
100b56d20:     	ldur	q0, [x29, #-0x80]
100b56d24:     	stur	q0, [x1, #0x9c]
100b56d28:     	ldr	x0, [x21, #0x168]
100b56d2c:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b56d30:     	strb	wzr, [x21, #0x100]
100b56d34:     	mov	x0, x19
100b56d38:     	mov	x1, #0x0                ; =0
100b56d3c:     	bl	0x1000b4964 <__Z17CTX_wm_window_setP8bContextP8wmWindow>
100b56d40:     	ldr	x21, [x21]
100b56d44:     	cbnz	x21, 0x100b55140 <__Z20wm_event_do_handlersP8bContext+0x74>
100b56d48:     	b	0x100b56da8 <__Z20wm_event_do_handlersP8bContext+0x1cdc>
100b56d4c:     	ldr	x0, [x21, #0x168]
100b56d50:     	bl	0x1007900b8 <__Z11BLI_popheadP8ListBase>
100b56d54:     	mov	x23, x0
100b56d58:     	cbz	x0, 0x100b5514c <__Z20wm_event_do_handlersP8bContext+0x80>
100b56d5c:     	ldr	x0, [x23, #0x88]
100b56d60:     	cbz	x0, 0x100b56d84 <__Z20wm_event_do_handlersP8bContext+0x1cb8>
100b56d64:     	ldrh	w8, [x23, #0x82]
100b56d68:     	cbz	w8, 0x100b56d84 <__Z20wm_event_do_handlersP8bContext+0x1cb8>
100b56d6c:     	ldrh	w8, [x23, #0x80]
100b56d70:     	cmp	w8, #0x3
100b56d74:     	b.ne	0x100b56d80 <__Z20wm_event_do_handlersP8bContext+0x1cb4>
100b56d78:     	bl	0x100b46950 <__Z17WM_drag_free_listP8ListBase>
100b56d7c:     	b	0x100b56d84 <__Z20wm_event_do_handlersP8bContext+0x1cb8>
100b56d80:     	bl	0x100ae4298 <_MEM_freeN>
100b56d84:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b56d88:     	add	x8, x8, #0x710
100b56d8c:     	ldr	x8, [x8]
100b56d90:     	mov	x0, x23
100b56d94:     	mov	w1, #0x0                ; =0
100b56d98:     	blr	x8
100b56d9c:     	ldr	x0, [x21, #0x168]
100b56da0:     	bl	0x1007900b8 <__Z11BLI_popheadP8ListBase>
100b56da4:     	b	0x100b56d54 <__Z20wm_event_do_handlersP8bContext+0x1c88>
100b56da8:     	ldr	x0, [sp, #0x28]
100b56dac:     	bl	0x100b7541c <__Z19WM_keyconfig_updateP15wmWindowManager>
100b56db0:     	mov	x0, x19
100b56db4:     	bl	0x1000b4c78 <__Z13CTX_data_mainPK8bContext>
100b56db8:     	bl	0x100b40d14 <__Z21WM_gizmoconfig_updateP4Main>
100b56dbc:     	bl	0x1008f2110 <__Z14GPU_render_endv>
100b56dc0:     	bl	0x101f39430 <__Z32UI_ipad_numbers_dispose_deferredv>
100b56dc4:     	b	0x100b56f48 <__Z20wm_event_do_handlersP8bContext+0x1e7c>
100b56dc8:     	bl	0x1008f2110 <__Z14GPU_render_endv>
100b56dcc:     	b	0x100b56f48 <__Z20wm_event_do_handlersP8bContext+0x1e7c>
100b56dd0:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b56dd4:     	add	x8, x8, #0x28
100b56dd8:     	ldr	x8, [x8]
100b56ddc:     	ldr	x19, [x8, #0x678]
100b56de0:     	cbz	x19, 0x100b56ebc <__Z20wm_event_do_handlersP8bContext+0x1df0>
100b56de4:     	add	x20, x19, #0x1a0
100b56de8:     	ldr	x20, [x20]
100b56dec:     	cbz	x20, 0x100b56e04 <__Z20wm_event_do_handlersP8bContext+0x1d38>
100b56df0:     	ldr	x0, [x20, #0x168]
100b56df4:     	mov	x1, x26
100b56df8:     	bl	0x10078feec <__Z16BLI_remlink_safeP8ListBasePv>
100b56dfc:     	cbz	w0, 0x100b56de8 <__Z20wm_event_do_handlersP8bContext+0x1d1c>
100b56e00:     	b	0x100b56e10 <__Z20wm_event_do_handlersP8bContext+0x1d44>
100b56e04:     	ldr	x19, [x19]
100b56e08:     	cbnz	x19, 0x100b56de4 <__Z20wm_event_do_handlersP8bContext+0x1d18>
100b56e0c:     	b	0x100b56ebc <__Z20wm_event_do_handlersP8bContext+0x1df0>
100b56e10:     	ldr	x0, [x26, #0x88]
100b56e14:     	cbz	x0, 0x100b56ea4 <__Z20wm_event_do_handlersP8bContext+0x1dd8>
100b56e18:     	ldrh	w8, [x26, #0x82]
100b56e1c:     	cbz	w8, 0x100b56ea4 <__Z20wm_event_do_handlersP8bContext+0x1dd8>
100b56e20:     	ldrh	w8, [x26, #0x80]
100b56e24:     	cmp	w8, #0x3
100b56e28:     	b.ne	0x100b56ea0 <__Z20wm_event_do_handlersP8bContext+0x1dd4>
100b56e2c:     	bl	0x100b46950 <__Z17WM_drag_free_listP8ListBase>
100b56e30:     	b	0x100b56ea4 <__Z20wm_event_do_handlersP8bContext+0x1dd8>
100b56e34:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b56e38:     	add	x8, x8, #0x28
100b56e3c:     	ldr	x8, [x8]
100b56e40:     	ldr	x19, [x8, #0x678]
100b56e44:     	cbz	x19, 0x100b56f44 <__Z20wm_event_do_handlersP8bContext+0x1e78>
100b56e48:     	add	x20, x19, #0x1a0
100b56e4c:     	ldr	x20, [x20]
100b56e50:     	cbz	x20, 0x100b56e68 <__Z20wm_event_do_handlersP8bContext+0x1d9c>
100b56e54:     	ldr	x0, [x20, #0x168]
100b56e58:     	mov	x1, x26
100b56e5c:     	bl	0x10078feec <__Z16BLI_remlink_safeP8ListBasePv>
100b56e60:     	cbz	w0, 0x100b56e4c <__Z20wm_event_do_handlersP8bContext+0x1d80>
100b56e64:     	b	0x100b56e7c <__Z20wm_event_do_handlersP8bContext+0x1db0>
100b56e68:     	ldr	x19, [x19]
100b56e6c:     	cbnz	x19, 0x100b56e48 <__Z20wm_event_do_handlersP8bContext+0x1d7c>
100b56e70:     	b	0x100b56f44 <__Z20wm_event_do_handlersP8bContext+0x1e78>
100b56e74:     	bl	0x1008f2110 <__Z14GPU_render_endv>
100b56e78:     	b	0x100b56f48 <__Z20wm_event_do_handlersP8bContext+0x1e7c>
100b56e7c:     	ldr	x0, [x26, #0x88]
100b56e80:     	cbz	x0, 0x100b56f2c <__Z20wm_event_do_handlersP8bContext+0x1e60>
100b56e84:     	ldrh	w8, [x26, #0x82]
100b56e88:     	cbz	w8, 0x100b56f2c <__Z20wm_event_do_handlersP8bContext+0x1e60>
100b56e8c:     	ldrh	w8, [x26, #0x80]
100b56e90:     	cmp	w8, #0x3
100b56e94:     	b.ne	0x100b56f28 <__Z20wm_event_do_handlersP8bContext+0x1e5c>
100b56e98:     	bl	0x100b46950 <__Z17WM_drag_free_listP8ListBase>
100b56e9c:     	b	0x100b56f2c <__Z20wm_event_do_handlersP8bContext+0x1e60>
100b56ea0:     	bl	0x100ae4298 <_MEM_freeN>
100b56ea4:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b56ea8:     	add	x8, x8, #0x710
100b56eac:     	ldr	x8, [x8]
100b56eb0:     	mov	x0, x26
100b56eb4:     	mov	w1, #0x0                ; =0
100b56eb8:     	blr	x8
100b56ebc:     	bl	0x1008f2110 <__Z14GPU_render_endv>
100b56ec0:     	b	0x100b56f48 <__Z20wm_event_do_handlersP8bContext+0x1e7c>
100b56ec4:     	adrp	x8, 0x106d8c000 <_build_commit_date>
100b56ec8:     	add	x8, x8, #0x28
100b56ecc:     	ldr	x8, [x8]
100b56ed0:     	ldr	x19, [x8, #0x678]
100b56ed4:     	cbz	x19, 0x100b56f9c <__Z20wm_event_do_handlersP8bContext+0x1ed0>
100b56ed8:     	add	x20, x19, #0x1a0
100b56edc:     	ldr	x20, [x20]
100b56ee0:     	cbz	x20, 0x100b56ef8 <__Z20wm_event_do_handlersP8bContext+0x1e2c>
100b56ee4:     	ldr	x0, [x20, #0x168]
100b56ee8:     	mov	x1, x26
100b56eec:     	bl	0x10078feec <__Z16BLI_remlink_safeP8ListBasePv>
100b56ef0:     	cbz	w0, 0x100b56edc <__Z20wm_event_do_handlersP8bContext+0x1e10>
100b56ef4:     	b	0x100b56f04 <__Z20wm_event_do_handlersP8bContext+0x1e38>
100b56ef8:     	ldr	x19, [x19]
100b56efc:     	cbnz	x19, 0x100b56ed8 <__Z20wm_event_do_handlersP8bContext+0x1e0c>
100b56f00:     	b	0x100b56f9c <__Z20wm_event_do_handlersP8bContext+0x1ed0>
100b56f04:     	ldr	x0, [x26, #0x88]
100b56f08:     	cbz	x0, 0x100b56f84 <__Z20wm_event_do_handlersP8bContext+0x1eb8>
100b56f0c:     	ldrh	w8, [x26, #0x82]
100b56f10:     	cbz	w8, 0x100b56f84 <__Z20wm_event_do_handlersP8bContext+0x1eb8>
100b56f14:     	ldrh	w8, [x26, #0x80]
100b56f18:     	cmp	w8, #0x3
100b56f1c:     	b.ne	0x100b56f80 <__Z20wm_event_do_handlersP8bContext+0x1eb4>
100b56f20:     	bl	0x100b46950 <__Z17WM_drag_free_listP8ListBase>
100b56f24:     	b	0x100b56f84 <__Z20wm_event_do_handlersP8bContext+0x1eb8>
100b56f28:     	bl	0x100ae4298 <_MEM_freeN>
100b56f2c:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b56f30:     	add	x8, x8, #0x710
100b56f34:     	ldr	x8, [x8]
100b56f38:     	mov	x0, x26
100b56f3c:     	mov	w1, #0x0                ; =0
100b56f40:     	blr	x8
100b56f44:     	bl	0x1008f2110 <__Z14GPU_render_endv>
100b56f48:     	ldur	x8, [x29, #-0x68]
100b56f4c:     	adrp	x9, 0x106369000 <_zlibVersion+0x106369000>
100b56f50:     	ldr	x9, [x9, #0x7f8]
100b56f54:     	ldr	x9, [x9]
100b56f58:     	cmp	x9, x8
100b56f5c:     	b.ne	0x100b56fa4 <__Z20wm_event_do_handlersP8bContext+0x1ed8>
100b56f60:     	add	sp, sp, #0x210
100b56f64:     	ldp	x29, x30, [sp, #0x50]
100b56f68:     	ldp	x20, x19, [sp, #0x40]
100b56f6c:     	ldp	x22, x21, [sp, #0x30]
100b56f70:     	ldp	x24, x23, [sp, #0x20]
100b56f74:     	ldp	x26, x25, [sp, #0x10]
100b56f78:     	ldp	x28, x27, [sp], #0x60
100b56f7c:     	ret
100b56f80:     	bl	0x100ae4298 <_MEM_freeN>
100b56f84:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b56f88:     	add	x8, x8, #0x710
100b56f8c:     	ldr	x8, [x8]
100b56f90:     	mov	x0, x26
100b56f94:     	mov	w1, #0x0                ; =0
100b56f98:     	blr	x8
100b56f9c:     	bl	0x1008f2110 <__Z14GPU_render_endv>
100b56fa0:     	b	0x100b56f48 <__Z20wm_event_do_handlersP8bContext+0x1e7c>
100b56fa4:     	bl	0x104b7534c <_zlibVersion+0x104b7534c>
100b56fa8:     	bl	0x104b72c1c <_zlibVersion+0x104b72c1c>
