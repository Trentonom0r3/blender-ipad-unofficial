
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f44fb0 <__ZL16ui_apply_but_NUMP8bContextP5uiButP18uiHandleButtonData>:
101f44fb0:     	stp	x22, x21, [sp, #-0x30]!
101f44fb4:     	stp	x20, x19, [sp, #0x10]
101f44fb8:     	stp	x29, x30, [sp, #0x20]
101f44fbc:     	add	x29, sp, #0x20
101f44fc0:     	mov	x19, x2
101f44fc4:     	mov	x20, x1
101f44fc8:     	mov	x21, x0
101f44fcc:     	ldr	x2, [x2, #0x40]
101f44fd0:     	cbz	x2, 0x101f44ff4 <__ZL16ui_apply_but_NUMP8bContextP5uiButP18uiHandleButtonData+0x44>
101f44fd4:     	mov	x0, x21
101f44fd8:     	mov	x1, x20
101f44fdc:     	bl	0x101f102bc <__Z17ui_but_string_setP8bContextP5uiButPKc>
101f44fe0:     	cbz	w0, 0x101f45028 <__ZL16ui_apply_but_NUMP8bContextP5uiButP18uiHandleButtonData+0x78>
101f44fe4:     	mov	x0, x20
101f44fe8:     	bl	0x101f0da80 <__Z16ui_but_value_getP5uiBut>
101f44fec:     	str	d0, [x19, #0x68]
101f44ff0:     	b	0x101f45000 <__ZL16ui_apply_but_NUMP8bContextP5uiButP18uiHandleButtonData+0x50>
101f44ff4:     	ldr	d0, [x19, #0x68]
101f44ff8:     	mov	x0, x20
101f44ffc:     	bl	0x101f0e860 <__Z16ui_but_value_setP5uiButd>
101f45000:     	mov	x0, x20
101f45004:     	bl	0x101f127c0 <__Z20ui_but_update_editedP5uiBut>
101f45008:     	mov	x0, x21
101f4500c:     	mov	x1, x20
101f45010:     	bl	0x101f37bcc <__ZL17ui_apply_but_funcP8bContextP5uiBut>
101f45014:     	ldrsh	w8, [x20, #0x26]
101f45018:     	str	w8, [x19, #0x28]
101f4501c:     	mov	w8, #0x1                ; =1
101f45020:     	strb	w8, [x19, #0x2e]
101f45024:     	b	0x101f45030 <__ZL16ui_apply_but_NUMP8bContextP5uiButP18uiHandleButtonData+0x80>
101f45028:     	mov	w8, #0x1                ; =1
101f4502c:     	strb	w8, [x19, #0x2c]
101f45030:     	ldp	x29, x30, [sp, #0x20]
101f45034:     	ldp	x20, x19, [sp, #0x10]
101f45038:     	ldp	x22, x21, [sp], #0x30
101f4503c:     	ret
