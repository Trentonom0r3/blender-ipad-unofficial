
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f45104 <__ZL17ui_apply_but_BUTMP8bContextP5uiButP18uiHandleButtonData>:
101f45104:     	stp	x22, x21, [sp, #-0x30]!
101f45108:     	stp	x20, x19, [sp, #0x10]
101f4510c:     	stp	x29, x30, [sp, #0x20]
101f45110:     	add	x29, sp, #0x20
101f45114:     	mov	x19, x2
101f45118:     	mov	x20, x1
101f4511c:     	mov	x21, x0
101f45120:     	ldr	s0, [x1, #0x88]
101f45124:     	fcvt	d0, s0
101f45128:     	mov	x0, x1
101f4512c:     	bl	0x101f0e860 <__Z16ui_but_value_setP5uiButd>
101f45130:     	mov	x0, x21
101f45134:     	mov	x1, x20
101f45138:     	bl	0x101f37bcc <__ZL17ui_apply_but_funcP8bContextP5uiBut>
101f4513c:     	ldrsh	w8, [x20, #0x26]
101f45140:     	str	w8, [x19, #0x28]
101f45144:     	mov	w8, #0x1                ; =1
101f45148:     	strb	w8, [x19, #0x2e]
101f4514c:     	ldp	x29, x30, [sp, #0x20]
101f45150:     	ldp	x20, x19, [sp, #0x10]
101f45154:     	ldp	x22, x21, [sp], #0x30
101f45158:     	ret
