
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101fc6db4 <__Z18but_func_argN_freeI10TemplateIDEvPv>:
101fc6db4:     	stp	x20, x19, [sp, #-0x20]!
101fc6db8:     	stp	x29, x30, [sp, #0x10]
101fc6dbc:     	add	x29, sp, #0x10
101fc6dc0:     	cbz	x0, 0x101fc6dfc <__Z18but_func_argN_freeI10TemplateIDEvPv+0x48>
101fc6dc4:     	mov	x19, x0
101fc6dc8:     	ldr	x0, [x0, #0x18]
101fc6dcc:     	add	x8, x19, #0x30
101fc6dd0:     	cmp	x0, x8
101fc6dd4:     	b.eq	0x101fc6ddc <__Z18but_func_argN_freeI10TemplateIDEvPv+0x28>
101fc6dd8:     	bl	0x100ae425c <_MEM_freeN>
101fc6ddc:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101fc6de0:     	add	x8, x8, #0x690
101fc6de4:     	ldr	x2, [x8]
101fc6de8:     	mov	x0, x19
101fc6dec:     	mov	w1, #0x1                ; =1
101fc6df0:     	ldp	x29, x30, [sp, #0x10]
101fc6df4:     	ldp	x20, x19, [sp], #0x20
101fc6df8:     	br	x2
101fc6dfc:     	ldp	x29, x30, [sp, #0x10]
101fc6e00:     	ldp	x20, x19, [sp], #0x20
101fc6e04:     	ret
101fc6e08:     	bl	0x1000144bc <___clang_call_terminate>
