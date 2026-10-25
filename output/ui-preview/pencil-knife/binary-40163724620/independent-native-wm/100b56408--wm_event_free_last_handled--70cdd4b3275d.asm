
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b56408 <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent>:
100b56408:     	stp	x22, x21, [sp, #-0x30]!
100b5640c:     	stp	x20, x19, [sp, #0x10]
100b56410:     	stp	x29, x30, [sp, #0x20]
100b56414:     	add	x29, sp, #0x20
100b56418:     	mov	x19, x1
100b5641c:     	mov	x20, x0
100b56420:     	ldr	x21, [x0, #0xf8]
100b56424:     	cbz	x21, 0x100b56468 <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent+0x60>
100b56428:     	ldr	x0, [x21, #0x88]
100b5642c:     	cbz	x0, 0x100b56450 <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent+0x48>
100b56430:     	ldrh	w8, [x21, #0x82]
100b56434:     	cbz	w8, 0x100b56450 <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent+0x48>
100b56438:     	ldrh	w8, [x21, #0x80]
100b5643c:     	cmp	w8, #0x3
100b56440:     	b.ne	0x100b5644c <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent+0x44>
100b56444:     	bl	0x100b468dc <__Z17WM_drag_free_listP8ListBase>
100b56448:     	b	0x100b56450 <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent+0x48>
100b5644c:     	bl	0x100ae425c <_MEM_freeN>
100b56450:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
100b56454:     	add	x8, x8, #0x690
100b56458:     	ldr	x8, [x8]
100b5645c:     	mov	x0, x21
100b56460:     	mov	w1, #0x0                ; =0
100b56464:     	blr	x8
100b56468:     	stp	xzr, xzr, [x19]
100b5646c:     	ldr	x0, [x19, #0x88]
100b56470:     	cbz	x0, 0x100b56494 <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent+0x8c>
100b56474:     	ldrh	w8, [x19, #0x82]
100b56478:     	cbz	w8, 0x100b56494 <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent+0x8c>
100b5647c:     	ldrh	w8, [x19, #0x80]
100b56480:     	cmp	w8, #0x3
100b56484:     	b.ne	0x100b56490 <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent+0x88>
100b56488:     	bl	0x100b468dc <__Z17WM_drag_free_listP8ListBase>
100b5648c:     	b	0x100b56494 <__ZL26wm_event_free_last_handledP8wmWindowP7wmEvent+0x8c>
100b56490:     	bl	0x100ae425c <_MEM_freeN>
100b56494:     	str	wzr, [x19, #0x80]
100b56498:     	str	xzr, [x19, #0x88]
100b5649c:     	str	x19, [x20, #0xf8]
100b564a0:     	ldp	x29, x30, [sp, #0x20]
100b564a4:     	ldp	x20, x19, [sp, #0x10]
100b564a8:     	ldp	x22, x21, [sp], #0x30
100b564ac:     	ret
