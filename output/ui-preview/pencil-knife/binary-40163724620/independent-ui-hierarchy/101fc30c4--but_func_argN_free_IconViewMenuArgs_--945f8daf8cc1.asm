
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101fc30c4 <__Z18but_func_argN_freeI16IconViewMenuArgsEvPv>:
101fc30c4:     	stp	x20, x19, [sp, #-0x20]!
101fc30c8:     	stp	x29, x30, [sp, #0x10]
101fc30cc:     	add	x29, sp, #0x10
101fc30d0:     	cbz	x0, 0x101fc310c <__Z18but_func_argN_freeI16IconViewMenuArgsEvPv+0x48>
101fc30d4:     	mov	x19, x0
101fc30d8:     	ldr	x0, [x0, #0x18]
101fc30dc:     	add	x8, x19, #0x30
101fc30e0:     	cmp	x0, x8
101fc30e4:     	b.eq	0x101fc30ec <__Z18but_func_argN_freeI16IconViewMenuArgsEvPv+0x28>
101fc30e8:     	bl	0x100ae425c <_MEM_freeN>
101fc30ec:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101fc30f0:     	add	x8, x8, #0x690
101fc30f4:     	ldr	x2, [x8]
101fc30f8:     	mov	x0, x19
101fc30fc:     	mov	w1, #0x1                ; =1
101fc3100:     	ldp	x29, x30, [sp, #0x10]
101fc3104:     	ldp	x20, x19, [sp], #0x20
101fc3108:     	br	x2
101fc310c:     	ldp	x29, x30, [sp, #0x10]
101fc3110:     	ldp	x20, x19, [sp], #0x20
101fc3114:     	ret
101fc3118:     	bl	0x1000144bc <___clang_call_terminate>
