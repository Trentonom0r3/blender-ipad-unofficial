
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b4d430 <__Z12WM_event_addP8wmWindowPK7wmEvent>:
100b4d430:     	stp	x22, x21, [sp, #-0x30]!
100b4d434:     	stp	x20, x19, [sp, #0x10]
100b4d438:     	stp	x29, x30, [sp, #0x20]
100b4d43c:     	add	x29, sp, #0x20
100b4d440:     	mov	x19, x1
100b4d444:     	mov	x20, x0
100b4d448:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
100b4d44c:     	add	x8, x8, #0x6e0
100b4d450:     	ldr	x8, [x8]
100b4d454:     	adrp	x3, 0x104bd0000 <__ZL3hex+0x434d>
100b4d458:     	add	x3, x3, #0xd1d
100b4d45c:     	mov	w0, #0x1                ; =1
100b4d460:     	mov	w1, #0xb0               ; =176
100b4d464:     	mov	w2, #0x8                ; =8
100b4d468:     	blr	x8
100b4d46c:     	mov	x21, x0
100b4d470:     	ldp	q1, q0, [x19, #0x10]
100b4d474:     	ldr	q2, [x19]
100b4d478:     	stp	q2, q1, [x0]
100b4d47c:     	str	q0, [x0, #0x20]
100b4d480:     	ldp	q0, q1, [x19, #0x50]
100b4d484:     	ldp	q3, q2, [x19, #0x30]
100b4d488:     	stp	q0, q1, [x0, #0x50]
100b4d48c:     	stp	q3, q2, [x0, #0x30]
100b4d490:     	ldp	q0, q1, [x19, #0x90]
100b4d494:     	ldp	q3, q2, [x19, #0x70]
100b4d498:     	stp	q0, q1, [x0, #0x90]
100b4d49c:     	stp	q3, q2, [x0, #0x70]
100b4d4a0:     	ldr	x0, [x20, #0x168]
100b4d4a4:     	mov	x1, x21
100b4d4a8:     	bl	0x10078fe38 <__Z11BLI_addtailP8ListBasePv>
100b4d4ac:     	mov	x0, x21
100b4d4b0:     	ldp	x29, x30, [sp, #0x20]
100b4d4b4:     	ldp	x20, x19, [sp, #0x10]
100b4d4b8:     	ldp	x22, x21, [sp], #0x30
100b4d4bc:     	ret
