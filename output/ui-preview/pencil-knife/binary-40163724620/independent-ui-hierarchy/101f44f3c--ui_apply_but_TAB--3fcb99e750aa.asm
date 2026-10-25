
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f44f3c <__ZL16ui_apply_but_TABP8bContextP5uiButP18uiHandleButtonData>:
101f44f3c:     	stp	x22, x21, [sp, #-0x30]!
101f44f40:     	stp	x20, x19, [sp, #0x10]
101f44f44:     	stp	x29, x30, [sp, #0x20]
101f44f48:     	add	x29, sp, #0x20
101f44f4c:     	mov	x19, x2
101f44f50:     	mov	x20, x1
101f44f54:     	ldr	x2, [x2, #0x40]
101f44f58:     	cbz	x2, 0x101f44f70 <__ZL16ui_apply_but_TABP8bContextP5uiButP18uiHandleButtonData+0x34>
101f44f5c:     	mov	x1, x20
101f44f60:     	bl	0x101f102bc <__Z17ui_but_string_setP8bContextP5uiButPKc>
101f44f64:     	mov	x0, x20
101f44f68:     	bl	0x101f127c0 <__Z20ui_but_update_editedP5uiBut>
101f44f6c:     	b	0x101f44f90 <__ZL16ui_apply_but_TABP8bContextP5uiButP18uiHandleButtonData+0x54>
101f44f70:     	ldr	s0, [x20, #0x8c]
101f44f74:     	fcvt	d0, s0
101f44f78:     	mov	x21, x0
101f44f7c:     	mov	x0, x20
101f44f80:     	bl	0x101f0e860 <__Z16ui_but_value_setP5uiButd>
101f44f84:     	mov	x0, x21
101f44f88:     	mov	x1, x20
101f44f8c:     	bl	0x101f37bcc <__ZL17ui_apply_but_funcP8bContextP5uiBut>
101f44f90:     	ldrsh	w8, [x20, #0x26]
101f44f94:     	str	w8, [x19, #0x28]
101f44f98:     	mov	w8, #0x1                ; =1
101f44f9c:     	strb	w8, [x19, #0x2e]
101f44fa0:     	ldp	x29, x30, [sp, #0x20]
101f44fa4:     	ldp	x20, x19, [sp, #0x10]
101f44fa8:     	ldp	x22, x21, [sp], #0x30
101f44fac:     	ret
