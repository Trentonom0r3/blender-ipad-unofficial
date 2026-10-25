
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b4d694 <__Z17wm_event_free_allP8wmWindow>:
100b4d694:     	stp	x22, x21, [sp, #-0x30]!
100b4d698:     	stp	x20, x19, [sp, #0x10]
100b4d69c:     	stp	x29, x30, [sp, #0x20]
100b4d6a0:     	add	x29, sp, #0x20
100b4d6a4:     	mov	x19, x0
100b4d6a8:     	ldr	x0, [x0, #0x168]
100b4d6ac:     	bl	0x10079007c <__Z11BLI_popheadP8ListBase>
100b4d6b0:     	cbz	x0, 0x100b4d70c <__Z17wm_event_free_allP8wmWindow+0x78>
100b4d6b4:     	adrp	x20, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
100b4d6b8:     	add	x20, x20, #0x690
100b4d6bc:     	b	0x100b4d6e0 <__Z17wm_event_free_allP8wmWindow+0x4c>
100b4d6c0:     	bl	0x100ae425c <_MEM_freeN>
100b4d6c4:     	mov	x0, x21
100b4d6c8:     	ldr	x8, [x20]
100b4d6cc:     	mov	w1, #0x0                ; =0
100b4d6d0:     	blr	x8
100b4d6d4:     	ldr	x0, [x19, #0x168]
100b4d6d8:     	bl	0x10079007c <__Z11BLI_popheadP8ListBase>
100b4d6dc:     	cbz	x0, 0x100b4d70c <__Z17wm_event_free_allP8wmWindow+0x78>
100b4d6e0:     	ldr	x8, [x0, #0x88]
100b4d6e4:     	cbz	x8, 0x100b4d6c8 <__Z17wm_event_free_allP8wmWindow+0x34>
100b4d6e8:     	ldrh	w9, [x0, #0x82]
100b4d6ec:     	cbz	w9, 0x100b4d6c8 <__Z17wm_event_free_allP8wmWindow+0x34>
100b4d6f0:     	mov	x21, x0
100b4d6f4:     	ldrh	w9, [x0, #0x80]
100b4d6f8:     	mov	x0, x8
100b4d6fc:     	cmp	w9, #0x3
100b4d700:     	b.ne	0x100b4d6c0 <__Z17wm_event_free_allP8wmWindow+0x2c>
100b4d704:     	bl	0x100b468dc <__Z17WM_drag_free_listP8ListBase>
100b4d708:     	b	0x100b4d6c4 <__Z17wm_event_free_allP8wmWindow+0x30>
100b4d70c:     	ldp	x29, x30, [sp, #0x20]
100b4d710:     	ldp	x20, x19, [sp, #0x10]
100b4d714:     	ldp	x22, x21, [sp], #0x30
100b4d718:     	ret
