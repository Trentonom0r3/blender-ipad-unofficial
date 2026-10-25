
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101fd3528 <__Z18but_func_argN_copyI14TemplateSearchEPvPKv>:
101fd3528:     	stp	x20, x19, [sp, #-0x20]!
101fd352c:     	stp	x29, x30, [sp, #0x10]
101fd3530:     	add	x29, sp, #0x10
101fd3534:     	mov	x19, x0
101fd3538:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101fd353c:     	add	x8, x8, #0x6d0
101fd3540:     	ldr	x8, [x8]
101fd3544:     	adrp	x2, 0x104d52000 <__ZL3hex+0x18634d>
101fd3548:     	add	x2, x2, #0x7c7
101fd354c:     	mov	w0, #0xe8               ; =232
101fd3550:     	mov	w1, #0x8                ; =8
101fd3554:     	mov	w3, #0x1                ; =1
101fd3558:     	blr	x8
101fd355c:     	mov	x1, x19
101fd3560:     	bl	0x101fd373c <__ZN21uiRNACollectionSearchC2ERKS_>
101fd3564:     	ldr	x8, [x19, #0xd8]
101fd3568:     	ldr	w9, [x19, #0xe0]
101fd356c:     	str	w9, [x0, #0xe0]
101fd3570:     	str	x8, [x0, #0xd8]
101fd3574:     	ldp	x29, x30, [sp, #0x10]
101fd3578:     	ldp	x20, x19, [sp], #0x20
101fd357c:     	ret
