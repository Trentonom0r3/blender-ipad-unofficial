
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101fb1c28 <__Z18but_func_argN_freeI11RNAUpdateCbEvPv>:
101fb1c28:     	stp	x20, x19, [sp, #-0x20]!
101fb1c2c:     	stp	x29, x30, [sp, #0x10]
101fb1c30:     	add	x29, sp, #0x10
101fb1c34:     	cbz	x0, 0x101fb1c70 <__Z18but_func_argN_freeI11RNAUpdateCbEvPv+0x48>
101fb1c38:     	mov	x19, x0
101fb1c3c:     	ldr	x0, [x0, #0x18]
101fb1c40:     	add	x8, x19, #0x30
101fb1c44:     	cmp	x0, x8
101fb1c48:     	b.eq	0x101fb1c50 <__Z18but_func_argN_freeI11RNAUpdateCbEvPv+0x28>
101fb1c4c:     	bl	0x100ae425c <_MEM_freeN>
101fb1c50:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101fb1c54:     	add	x8, x8, #0x690
101fb1c58:     	ldr	x2, [x8]
101fb1c5c:     	mov	x0, x19
101fb1c60:     	mov	w1, #0x1                ; =1
101fb1c64:     	ldp	x29, x30, [sp, #0x10]
101fb1c68:     	ldp	x20, x19, [sp], #0x20
101fb1c6c:     	br	x2
101fb1c70:     	ldp	x29, x30, [sp, #0x10]
101fb1c74:     	ldp	x20, x19, [sp], #0x20
101fb1c78:     	ret
101fb1c7c:     	bl	0x1000144bc <___clang_call_terminate>
