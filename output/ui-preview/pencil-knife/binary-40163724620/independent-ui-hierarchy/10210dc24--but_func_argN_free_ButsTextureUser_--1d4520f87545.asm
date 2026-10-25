
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010210dc24 <__Z18but_func_argN_freeI15ButsTextureUserEvPv>:
10210dc24:     	stp	x20, x19, [sp, #-0x20]!
10210dc28:     	stp	x29, x30, [sp, #0x10]
10210dc2c:     	add	x29, sp, #0x10
10210dc30:     	cbz	x0, 0x10210dc6c <__Z18but_func_argN_freeI15ButsTextureUserEvPv+0x48>
10210dc34:     	mov	x19, x0
10210dc38:     	ldr	x0, [x0, #0x30]
10210dc3c:     	add	x8, x19, #0x48
10210dc40:     	cmp	x0, x8
10210dc44:     	b.eq	0x10210dc4c <__Z18but_func_argN_freeI15ButsTextureUserEvPv+0x28>
10210dc48:     	bl	0x100ae425c <_MEM_freeN>
10210dc4c:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
10210dc50:     	add	x8, x8, #0x690
10210dc54:     	ldr	x2, [x8]
10210dc58:     	mov	x0, x19
10210dc5c:     	mov	w1, #0x1                ; =1
10210dc60:     	ldp	x29, x30, [sp, #0x10]
10210dc64:     	ldp	x20, x19, [sp], #0x20
10210dc68:     	br	x2
10210dc6c:     	ldp	x29, x30, [sp, #0x10]
10210dc70:     	ldp	x20, x19, [sp], #0x20
10210dc74:     	ret
10210dc78:     	bl	0x1000144bc <___clang_call_terminate>
