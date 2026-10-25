
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b5d1b8 <__ZL26wm_event_modalkeymap_beginPK8bContextP10wmOperatorP7wmEventP21wmEvent_ModalMapStore>:
100b5d1b8:     	sub	sp, sp, #0xf0
100b5d1bc:     	stp	x24, x23, [sp, #0xb0]
100b5d1c0:     	stp	x22, x21, [sp, #0xc0]
100b5d1c4:     	stp	x20, x19, [sp, #0xd0]
100b5d1c8:     	stp	x29, x30, [sp, #0xe0]
100b5d1cc:     	add	x29, sp, #0xe0
100b5d1d0:     	mov	x19, x3
100b5d1d4:     	ldr	x8, [x1, #0x90]
100b5d1d8:     	add	x24, x2, #0x10
100b5d1dc:     	add	x23, x2, #0x12
100b5d1e0:     	cmp	x8, #0x0
100b5d1e4:     	csel	x21, x1, x8, eq
100b5d1e8:     	strb	wzr, [x3, #0x4]
100b5d1ec:     	ldr	x8, [x21, #0x58]
100b5d1f0:     	ldr	x8, [x8, #0xb0]
100b5d1f4:     	cbz	x8, 0x100b5d2d8 <__ZL26wm_event_modalkeymap_beginPK8bContextP10wmOperatorP7wmEventP21wmEvent_ModalMapStore+0x120>
100b5d1f8:     	mov	x20, x2
100b5d1fc:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b5d200:     	ldr	x8, [x21, #0x58]
100b5d204:     	ldr	x1, [x8, #0xb0]
100b5d208:     	bl	0x100b75794 <__Z16WM_keymap_activePK15wmWindowManagerP8wmKeyMap>
100b5d20c:     	mov	x22, x0
100b5d210:     	mov	x1, x21
100b5d214:     	mov	x2, x20
100b5d218:     	bl	0x100b5d318 <__ZL32wm_eventmatch_modal_keymap_itemsPK8wmKeyMapP10wmOperatorPK7wmEvent>
100b5d21c:     	cbz	x0, 0x100b5d230 <__ZL26wm_event_modalkeymap_beginPK8bContextP10wmOperatorP7wmEventP21wmEvent_ModalMapStore+0x78>
100b5d220:     	cbz	x20, 0x100b5d2d8 <__ZL26wm_event_modalkeymap_beginPK8bContextP10wmOperatorP7wmEventP21wmEvent_ModalMapStore+0x120>
100b5d224:     	mov	x8, x23
100b5d228:     	mov	x9, x24
100b5d22c:     	b	0x100b5d294 <__ZL26wm_event_modalkeymap_beginPK8bContextP10wmOperatorP7wmEventP21wmEvent_ModalMapStore+0xdc>
100b5d230:     	ldrh	w8, [x23]
100b5d234:     	cmp	w8, #0x4
100b5d238:     	b.ne	0x100b5d2d8 <__ZL26wm_event_modalkeymap_beginPK8bContextP10wmOperatorP7wmEventP21wmEvent_ModalMapStore+0x120>
100b5d23c:     	ldp	q0, q1, [x20, #0x80]
100b5d240:     	stp	q0, q1, [sp, #0x80]
100b5d244:     	ldr	q0, [x20, #0xa0]
100b5d248:     	str	q0, [sp, #0xa0]
100b5d24c:     	ldp	q0, q1, [x20, #0x40]
100b5d250:     	stp	q0, q1, [sp, #0x40]
100b5d254:     	ldp	q1, q0, [x20, #0x60]
100b5d258:     	stp	q1, q0, [sp, #0x60]
100b5d25c:     	ldp	q0, q1, [x20]
100b5d260:     	stp	q0, q1, [sp]
100b5d264:     	ldp	q1, q0, [x20, #0x20]
100b5d268:     	stp	q1, q0, [sp, #0x20]
100b5d26c:     	mov	w8, #0x1                ; =1
100b5d270:     	strh	w8, [sp, #0x12]
100b5d274:     	mov	x2, sp
100b5d278:     	mov	x0, x22
100b5d27c:     	mov	x1, x21
100b5d280:     	bl	0x100b5d318 <__ZL32wm_eventmatch_modal_keymap_itemsPK8wmKeyMapP10wmOperatorPK7wmEvent>
100b5d284:     	cbz	x0, 0x100b5d2d8 <__ZL26wm_event_modalkeymap_beginPK8bContextP10wmOperatorP7wmEventP21wmEvent_ModalMapStore+0x120>
100b5d288:     	mov	x8, sp
100b5d28c:     	add	x9, x8, #0x10
100b5d290:     	add	x8, x8, #0x12
100b5d294:     	ldrh	w10, [x20, #0x90]
100b5d298:     	strh	w10, [x19]
100b5d29c:     	ldrh	w10, [x20, #0x92]
100b5d2a0:     	strh	w10, [x19, #0x2]
100b5d2a4:     	ldrh	w9, [x9]
100b5d2a8:     	strh	w9, [x20, #0x90]
100b5d2ac:     	ldrh	w8, [x8]
100b5d2b0:     	strh	w8, [x20, #0x92]
100b5d2b4:     	mov	w9, #0x5022             ; =20514
100b5d2b8:     	strh	w9, [x20, #0x10]
100b5d2bc:     	ldrh	w9, [x0, #0x98]
100b5d2c0:     	strh	w9, [x20, #0x12]
100b5d2c4:     	cmp	w8, #0x4
100b5d2c8:     	b.ne	0x100b5d2d8 <__ZL26wm_event_modalkeymap_beginPK8bContextP10wmOperatorP7wmEventP21wmEvent_ModalMapStore+0x120>
100b5d2cc:     	mov	w8, #0x1                ; =1
100b5d2d0:     	strh	w8, [x20, #0x92]
100b5d2d4:     	strb	w8, [x19, #0x4]
100b5d2d8:     	ldrh	w8, [x24]
100b5d2dc:     	mov	w9, #0x5022             ; =20514
100b5d2e0:     	cmp	w8, w9
100b5d2e4:     	b.eq	0x100b5d300 <__ZL26wm_event_modalkeymap_beginPK8bContextP10wmOperatorP7wmEventP21wmEvent_ModalMapStore+0x148>
100b5d2e8:     	ldrh	w8, [x23]
100b5d2ec:     	cmp	w8, #0x4
100b5d2f0:     	b.ne	0x100b5d300 <__ZL26wm_event_modalkeymap_beginPK8bContextP10wmOperatorP7wmEventP21wmEvent_ModalMapStore+0x148>
100b5d2f4:     	mov	w8, #0x1                ; =1
100b5d2f8:     	strh	w8, [x23]
100b5d2fc:     	strb	w8, [x19, #0x4]
100b5d300:     	ldp	x29, x30, [sp, #0xe0]
100b5d304:     	ldp	x20, x19, [sp, #0xd0]
100b5d308:     	ldp	x22, x21, [sp, #0xc0]
100b5d30c:     	ldp	x24, x23, [sp, #0xb0]
100b5d310:     	add	sp, sp, #0xf0
100b5d314:     	ret
