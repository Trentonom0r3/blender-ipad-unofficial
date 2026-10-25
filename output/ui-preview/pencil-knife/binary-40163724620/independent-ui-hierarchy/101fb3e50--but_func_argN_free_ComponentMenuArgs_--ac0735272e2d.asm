
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101fb3e50 <__Z18but_func_argN_freeI17ComponentMenuArgsEvPv>:
101fb3e50:     	stp	x20, x19, [sp, #-0x20]!
101fb3e54:     	stp	x29, x30, [sp, #0x10]
101fb3e58:     	add	x29, sp, #0x10
101fb3e5c:     	cbz	x0, 0x101fb3e98 <__Z18but_func_argN_freeI17ComponentMenuArgsEvPv+0x48>
101fb3e60:     	mov	x19, x0
101fb3e64:     	ldr	x0, [x0, #0x18]
101fb3e68:     	add	x8, x19, #0x30
101fb3e6c:     	cmp	x0, x8
101fb3e70:     	b.eq	0x101fb3e78 <__Z18but_func_argN_freeI17ComponentMenuArgsEvPv+0x28>
101fb3e74:     	bl	0x100ae425c <_MEM_freeN>
101fb3e78:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101fb3e7c:     	add	x8, x8, #0x690
101fb3e80:     	ldr	x2, [x8]
101fb3e84:     	mov	x0, x19
101fb3e88:     	mov	w1, #0x1                ; =1
101fb3e8c:     	ldp	x29, x30, [sp, #0x10]
101fb3e90:     	ldp	x20, x19, [sp], #0x20
101fb3e94:     	br	x2
101fb3e98:     	ldp	x29, x30, [sp, #0x10]
101fb3e9c:     	ldp	x20, x19, [sp], #0x20
101fb3ea0:     	ret
101fb3ea4:     	bl	0x1000144bc <___clang_call_terminate>
