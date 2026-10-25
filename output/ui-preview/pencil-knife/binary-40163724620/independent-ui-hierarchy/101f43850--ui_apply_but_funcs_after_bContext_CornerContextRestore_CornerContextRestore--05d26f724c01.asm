
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f43850 <__ZZL24ui_apply_but_funcs_afterP8bContextEN20CornerContextRestoreD1Ev>:
101f43850:     	stp	x20, x19, [sp, #-0x20]!
101f43854:     	stp	x29, x30, [sp, #0x10]
101f43858:     	add	x29, sp, #0x10
101f4385c:     	ldrb	w8, [x0, #0x18]
101f43860:     	cmp	w8, #0x1
101f43864:     	b.ne	0x101f43880 <__ZZL24ui_apply_but_funcs_afterP8bContextEN20CornerContextRestoreD1Ev+0x30>
101f43868:     	ldp	x8, x1, [x0]
101f4386c:     	ldr	x2, [x0, #0x10]
101f43870:     	mov	x19, x0
101f43874:     	mov	x0, x8
101f43878:     	bl	0x101f8f7a8 <__Z30ui_ipad_action_context_restoreP8bContextmm>
101f4387c:     	mov	x0, x19
101f43880:     	ldp	x29, x30, [sp, #0x10]
101f43884:     	ldp	x20, x19, [sp], #0x20
101f43888:     	ret
101f4388c:     	bl	0x1000144bc <___clang_call_terminate>
