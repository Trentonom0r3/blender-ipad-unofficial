
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101fd34b8 <__Z18but_func_argN_freeI14TemplateSearchEvPv>:
101fd34b8:     	stp	x20, x19, [sp, #-0x20]!
101fd34bc:     	stp	x29, x30, [sp, #0x10]
101fd34c0:     	add	x29, sp, #0x10
101fd34c4:     	cbz	x0, 0x101fd3514 <__Z18but_func_argN_freeI14TemplateSearchEvPv+0x5c>
101fd34c8:     	mov	x19, x0
101fd34cc:     	ldr	x0, [x0, #0x78]
101fd34d0:     	add	x8, x19, #0x90
101fd34d4:     	cmp	x0, x8
101fd34d8:     	b.eq	0x101fd34e0 <__Z18but_func_argN_freeI14TemplateSearchEvPv+0x28>
101fd34dc:     	bl	0x100ae425c <_MEM_freeN>
101fd34e0:     	ldr	x0, [x19, #0x18]
101fd34e4:     	add	x8, x19, #0x30
101fd34e8:     	cmp	x0, x8
101fd34ec:     	b.eq	0x101fd34f4 <__Z18but_func_argN_freeI14TemplateSearchEvPv+0x3c>
101fd34f0:     	bl	0x100ae425c <_MEM_freeN>
101fd34f4:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101fd34f8:     	add	x8, x8, #0x690
101fd34fc:     	ldr	x2, [x8]
101fd3500:     	mov	x0, x19
101fd3504:     	mov	w1, #0x1                ; =1
101fd3508:     	ldp	x29, x30, [sp, #0x10]
101fd350c:     	ldp	x20, x19, [sp], #0x20
101fd3510:     	br	x2
101fd3514:     	ldp	x29, x30, [sp, #0x10]
101fd3518:     	ldp	x20, x19, [sp], #0x20
101fd351c:     	ret
101fd3520:     	bl	0x1000144bc <___clang_call_terminate>
101fd3524:     	bl	0x1000144bc <___clang_call_terminate>
