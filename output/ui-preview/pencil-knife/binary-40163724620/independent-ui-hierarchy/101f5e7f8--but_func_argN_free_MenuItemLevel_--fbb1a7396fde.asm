
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f5e7f8 <__Z18but_func_argN_freeI13MenuItemLevelEvPv>:
101f5e7f8:     	stp	x20, x19, [sp, #-0x20]!
101f5e7fc:     	stp	x29, x30, [sp, #0x10]
101f5e800:     	add	x29, sp, #0x10
101f5e804:     	cbz	x0, 0x101f5e840 <__Z18but_func_argN_freeI13MenuItemLevelEvPv+0x48>
101f5e808:     	mov	x19, x0
101f5e80c:     	ldr	x0, [x0, #0xa0]
101f5e810:     	add	x8, x19, #0xb8
101f5e814:     	cmp	x0, x8
101f5e818:     	b.eq	0x101f5e820 <__Z18but_func_argN_freeI13MenuItemLevelEvPv+0x28>
101f5e81c:     	bl	0x100ae425c <_MEM_freeN>
101f5e820:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101f5e824:     	add	x8, x8, #0x690
101f5e828:     	ldr	x2, [x8]
101f5e82c:     	mov	x0, x19
101f5e830:     	mov	w1, #0x1                ; =1
101f5e834:     	ldp	x29, x30, [sp, #0x10]
101f5e838:     	ldp	x20, x19, [sp], #0x20
101f5e83c:     	br	x2
101f5e840:     	ldp	x29, x30, [sp, #0x10]
101f5e844:     	ldp	x20, x19, [sp], #0x20
101f5e848:     	ret
101f5e84c:     	bl	0x1000144bc <___clang_call_terminate>
