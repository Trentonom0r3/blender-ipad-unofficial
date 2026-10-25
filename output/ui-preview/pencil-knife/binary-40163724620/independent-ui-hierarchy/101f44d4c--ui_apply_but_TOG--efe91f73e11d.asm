
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f44d4c <__ZL16ui_apply_but_TOGP8bContextP5uiButP18uiHandleButtonData>:
101f44d4c:     	stp	x22, x21, [sp, #-0x30]!
101f44d50:     	stp	x20, x19, [sp, #0x10]
101f44d54:     	stp	x29, x30, [sp, #0x20]
101f44d58:     	add	x29, sp, #0x20
101f44d5c:     	mov	x19, x2
101f44d60:     	mov	x20, x1
101f44d64:     	mov	x21, x0
101f44d68:     	mov	x0, x1
101f44d6c:     	bl	0x101f0da80 <__Z16ui_but_value_getP5uiBut>
101f44d70:     	ldrb	w8, [x20, #0x23]
101f44d74:     	cmp	w8, #0x1
101f44d78:     	b.ne	0x101f44d94 <__ZL16ui_apply_but_TOGP8bContextP5uiButP18uiHandleButtonData+0x48>
101f44d7c:     	fcvtzs	w8, d0
101f44d80:     	ldrb	w9, [x20, #0x24]
101f44d84:     	mov	w10, #0x1               ; =1
101f44d88:     	lsl	w9, w10, w9
101f44d8c:     	eor	w8, w9, w8
101f44d90:     	b	0x101f44d9c <__ZL16ui_apply_but_TOGP8bContextP5uiButP18uiHandleButtonData+0x50>
101f44d94:     	fcmp	d0, #0.0
101f44d98:     	cset	w8, eq
101f44d9c:     	scvtf	d0, w8
101f44da0:     	mov	x0, x20
101f44da4:     	bl	0x101f0e860 <__Z16ui_but_value_setP5uiButd>
101f44da8:     	ldrb	w8, [x20, #0x21]
101f44dac:     	and	w8, w8, #0xfe
101f44db0:     	cmp	w8, #0xa
101f44db4:     	b.ne	0x101f44dc0 <__ZL16ui_apply_but_TOGP8bContextP5uiButP18uiHandleButtonData+0x74>
101f44db8:     	mov	x0, x20
101f44dbc:     	bl	0x101f127c0 <__Z20ui_but_update_editedP5uiBut>
101f44dc0:     	mov	x0, x21
101f44dc4:     	mov	x1, x20
101f44dc8:     	bl	0x101f37bcc <__ZL17ui_apply_but_funcP8bContextP5uiBut>
101f44dcc:     	ldrsh	w8, [x20, #0x26]
101f44dd0:     	str	w8, [x19, #0x28]
101f44dd4:     	mov	w8, #0x1                ; =1
101f44dd8:     	strb	w8, [x19, #0x2e]
101f44ddc:     	ldp	x29, x30, [sp, #0x20]
101f44de0:     	ldp	x20, x19, [sp, #0x10]
101f44de4:     	ldp	x22, x21, [sp], #0x30
101f44de8:     	ret
