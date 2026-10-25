
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f44dec <__ZL16ui_apply_but_ROWP8bContextP7uiBlockP5uiButP18uiHandleButtonData>:
101f44dec:     	stp	x22, x21, [sp, #-0x30]!
101f44df0:     	stp	x20, x19, [sp, #0x10]
101f44df4:     	stp	x29, x30, [sp, #0x20]
101f44df8:     	add	x29, sp, #0x20
101f44dfc:     	mov	x19, x3
101f44e00:     	mov	x20, x2
101f44e04:     	mov	x21, x1
101f44e08:     	mov	x22, x0
101f44e0c:     	ldr	s0, [x2, #0x8c]
101f44e10:     	fcvt	d0, s0
101f44e14:     	mov	x0, x2
101f44e18:     	bl	0x101f0e860 <__Z16ui_but_value_setP5uiButd>
101f44e1c:     	mov	x0, x22
101f44e20:     	mov	x1, x20
101f44e24:     	bl	0x101f37bcc <__ZL17ui_apply_but_funcP8bContextP5uiBut>
101f44e28:     	ldp	x22, x21, [x21, #0x10]
101f44e2c:     	b	0x101f44e34 <__ZL16ui_apply_but_ROWP8bContextP7uiBlockP5uiButP18uiHandleButtonData+0x48>
101f44e30:     	add	x22, x22, #0x8
101f44e34:     	cmp	x22, x21
101f44e38:     	b.eq	0x101f44e70 <__ZL16ui_apply_but_ROWP8bContextP7uiBlockP5uiButP18uiHandleButtonData+0x84>
101f44e3c:     	ldr	x0, [x22]
101f44e40:     	cmp	x0, x20
101f44e44:     	b.eq	0x101f44e30 <__ZL16ui_apply_but_ROWP8bContextP7uiBlockP5uiButP18uiHandleButtonData+0x44>
101f44e48:     	ldr	x8, [x0, #0x80]
101f44e4c:     	ldr	x9, [x20, #0x80]
101f44e50:     	cmp	x8, x9
101f44e54:     	b.ne	0x101f44e30 <__ZL16ui_apply_but_ROWP8bContextP7uiBlockP5uiButP18uiHandleButtonData+0x44>
101f44e58:     	ldrb	w8, [x0, #0x21]
101f44e5c:     	cmp	w8, #0x1e
101f44e60:     	ccmp	w8, #0x2, #0x4, ne
101f44e64:     	b.ne	0x101f44e30 <__ZL16ui_apply_but_ROWP8bContextP7uiBlockP5uiButP18uiHandleButtonData+0x44>
101f44e68:     	bl	0x101f127c0 <__Z20ui_but_update_editedP5uiBut>
101f44e6c:     	b	0x101f44e30 <__ZL16ui_apply_but_ROWP8bContextP7uiBlockP5uiButP18uiHandleButtonData+0x44>
101f44e70:     	ldrsh	w8, [x20, #0x26]
101f44e74:     	str	w8, [x19, #0x28]
101f44e78:     	mov	w8, #0x1                ; =1
101f44e7c:     	strb	w8, [x19, #0x2e]
101f44e80:     	ldp	x29, x30, [sp, #0x20]
101f44e84:     	ldp	x20, x19, [sp, #0x10]
101f44e88:     	ldp	x22, x21, [sp], #0x30
101f44e8c:     	ret
