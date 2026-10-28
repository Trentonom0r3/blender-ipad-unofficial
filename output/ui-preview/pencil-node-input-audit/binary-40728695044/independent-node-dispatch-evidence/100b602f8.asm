
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b602f8 <__ZL29wm_ipad_node_view2d_string_isPKcmS0_>:
100b602f8:     	stp	x22, x21, [sp, #-0x30]!
100b602fc:     	stp	x20, x19, [sp, #0x10]
100b60300:     	stp	x29, x30, [sp, #0x20]
100b60304:     	add	x29, sp, #0x20
100b60308:     	mov	x21, x1
100b6030c:     	mov	x19, x0
100b60310:     	mov	x0, x1
100b60314:     	bl	0x104b76c30 <_zlibVersion+0x104b76c30>
100b60318:     	cmp	x0, #0x3f
100b6031c:     	b.hi	0x100b60338 <__ZL29wm_ipad_node_view2d_string_isPKcmS0_+0x40>
100b60320:     	mov	x20, x0
100b60324:     	mov	x0, x19
100b60328:     	mov	x1, x21
100b6032c:     	mov	x2, x20
100b60330:     	bl	0x104b76054 <_zlibVersion+0x104b76054>
100b60334:     	cbz	w0, 0x100b6034c <__ZL29wm_ipad_node_view2d_string_isPKcmS0_+0x54>
100b60338:     	mov	w0, #0x0                ; =0
100b6033c:     	ldp	x29, x30, [sp, #0x20]
100b60340:     	ldp	x20, x19, [sp, #0x10]
100b60344:     	ldp	x22, x21, [sp], #0x30
100b60348:     	ret
100b6034c:     	ldrb	w8, [x19, x20]
100b60350:     	cmp	w8, #0x0
100b60354:     	cset	w0, eq
100b60358:     	b	0x100b6033c <__ZL29wm_ipad_node_view2d_string_isPKcmS0_+0x44>
