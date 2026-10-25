
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f44e90 <__ZL22ui_apply_but_VIEW_ITEMP8bContextP7uiBlockP5uiButP18uiHandleButtonData>:
101f44e90:     	ldrb	w8, [x3, #0x30]
101f44e94:     	tbnz	w8, #0x0, 0x101f44f38 <__ZL22ui_apply_but_VIEW_ITEMP8bContextP7uiBlockP5uiButP18uiHandleButtonData+0xa8>
101f44e98:     	stp	x22, x21, [sp, #-0x30]!
101f44e9c:     	stp	x20, x19, [sp, #0x10]
101f44ea0:     	stp	x29, x30, [sp, #0x20]
101f44ea4:     	add	x29, sp, #0x20
101f44ea8:     	mov	x19, x3
101f44eac:     	mov	x20, x2
101f44eb0:     	mov	x21, x1
101f44eb4:     	ldr	s0, [x2, #0x8c]
101f44eb8:     	fcvt	d0, s0
101f44ebc:     	mov	x22, x0
101f44ec0:     	mov	x0, x2
101f44ec4:     	bl	0x101f0e860 <__Z16ui_but_value_setP5uiButd>
101f44ec8:     	mov	x0, x22
101f44ecc:     	mov	x1, x20
101f44ed0:     	bl	0x101f37bcc <__ZL17ui_apply_but_funcP8bContextP5uiBut>
101f44ed4:     	ldp	x22, x21, [x21, #0x10]
101f44ed8:     	b	0x101f44ee0 <__ZL22ui_apply_but_VIEW_ITEMP8bContextP7uiBlockP5uiButP18uiHandleButtonData+0x50>
101f44edc:     	add	x22, x22, #0x8
101f44ee0:     	cmp	x22, x21
101f44ee4:     	b.eq	0x101f44f1c <__ZL22ui_apply_but_VIEW_ITEMP8bContextP7uiBlockP5uiButP18uiHandleButtonData+0x8c>
101f44ee8:     	ldr	x0, [x22]
101f44eec:     	cmp	x0, x20
101f44ef0:     	b.eq	0x101f44edc <__ZL22ui_apply_but_VIEW_ITEMP8bContextP7uiBlockP5uiButP18uiHandleButtonData+0x4c>
101f44ef4:     	ldr	x8, [x0, #0x80]
101f44ef8:     	ldr	x9, [x20, #0x80]
101f44efc:     	cmp	x8, x9
101f44f00:     	b.ne	0x101f44edc <__ZL22ui_apply_but_VIEW_ITEMP8bContextP7uiBlockP5uiButP18uiHandleButtonData+0x4c>
101f44f04:     	ldrb	w8, [x0, #0x21]
101f44f08:     	cmp	w8, #0x1e
101f44f0c:     	ccmp	w8, #0x2, #0x4, ne
101f44f10:     	b.ne	0x101f44edc <__ZL22ui_apply_but_VIEW_ITEMP8bContextP7uiBlockP5uiButP18uiHandleButtonData+0x4c>
101f44f14:     	bl	0x101f127c0 <__Z20ui_but_update_editedP5uiBut>
101f44f18:     	b	0x101f44edc <__ZL22ui_apply_but_VIEW_ITEMP8bContextP7uiBlockP5uiButP18uiHandleButtonData+0x4c>
101f44f1c:     	ldrsh	w8, [x20, #0x26]
101f44f20:     	str	w8, [x19, #0x28]
101f44f24:     	mov	w8, #0x1                ; =1
101f44f28:     	strb	w8, [x19, #0x2e]
101f44f2c:     	ldp	x29, x30, [sp, #0x20]
101f44f30:     	ldp	x20, x19, [sp, #0x10]
101f44f34:     	ldp	x22, x21, [sp], #0x30
101f44f38:     	ret
