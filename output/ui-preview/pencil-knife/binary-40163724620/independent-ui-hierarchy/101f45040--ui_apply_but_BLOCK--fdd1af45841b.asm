
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f45040 <__ZL18ui_apply_but_BLOCKP8bContextP5uiButP18uiHandleButtonData>:
101f45040:     	stp	x22, x21, [sp, #-0x30]!
101f45044:     	stp	x20, x19, [sp, #0x10]
101f45048:     	stp	x29, x30, [sp, #0x20]
101f4504c:     	add	x29, sp, #0x20
101f45050:     	mov	x19, x2
101f45054:     	mov	x20, x1
101f45058:     	mov	x21, x0
101f4505c:     	ldrb	w8, [x1, #0x21]
101f45060:     	cmp	w8, #0x4
101f45064:     	b.ne	0x101f45074 <__ZL18ui_apply_but_BLOCKP8bContextP5uiButP18uiHandleButtonData+0x34>
101f45068:     	ldr	d0, [x19, #0x68]
101f4506c:     	mov	x0, x20
101f45070:     	bl	0x101f0e860 <__Z16ui_but_value_setP5uiButd>
101f45074:     	mov	x0, x20
101f45078:     	bl	0x101f127c0 <__Z20ui_but_update_editedP5uiBut>
101f4507c:     	mov	x0, x21
101f45080:     	mov	x1, x20
101f45084:     	bl	0x101f37bcc <__ZL17ui_apply_but_funcP8bContextP5uiBut>
101f45088:     	ldrsh	w8, [x20, #0x26]
101f4508c:     	str	w8, [x19, #0x28]
101f45090:     	mov	w8, #0x1                ; =1
101f45094:     	strb	w8, [x19, #0x2e]
101f45098:     	ldp	x29, x30, [sp, #0x20]
101f4509c:     	ldp	x20, x19, [sp, #0x10]
101f450a0:     	ldp	x22, x21, [sp], #0x30
101f450a4:     	ret
