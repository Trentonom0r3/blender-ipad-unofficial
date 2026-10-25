
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010215cd20 <__Z18but_func_argN_freeIN12_GLOBAL__N_111RNAUpdateCbEEvPv>:
10215cd20:     	stp	x20, x19, [sp, #-0x20]!
10215cd24:     	stp	x29, x30, [sp, #0x10]
10215cd28:     	add	x29, sp, #0x10
10215cd2c:     	cbz	x0, 0x10215cd68 <__Z18but_func_argN_freeIN12_GLOBAL__N_111RNAUpdateCbEEvPv+0x48>
10215cd30:     	mov	x19, x0
10215cd34:     	ldr	x0, [x0, #0x18]
10215cd38:     	add	x8, x19, #0x30
10215cd3c:     	cmp	x0, x8
10215cd40:     	b.eq	0x10215cd48 <__Z18but_func_argN_freeIN12_GLOBAL__N_111RNAUpdateCbEEvPv+0x28>
10215cd44:     	bl	0x100ae425c <_MEM_freeN>
10215cd48:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
10215cd4c:     	add	x8, x8, #0x690
10215cd50:     	ldr	x2, [x8]
10215cd54:     	mov	x0, x19
10215cd58:     	mov	w1, #0x1                ; =1
10215cd5c:     	ldp	x29, x30, [sp, #0x10]
10215cd60:     	ldp	x20, x19, [sp], #0x20
10215cd64:     	br	x2
10215cd68:     	ldp	x29, x30, [sp, #0x10]
10215cd6c:     	ldp	x20, x19, [sp], #0x20
10215cd70:     	ret
10215cd74:     	bl	0x1000144bc <___clang_call_terminate>
