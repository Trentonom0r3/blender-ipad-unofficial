
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f450a8 <__ZL16ui_apply_but_VECP8bContextP5uiButP18uiHandleButtonData>:
101f450a8:     	stp	x22, x21, [sp, #-0x30]!
101f450ac:     	stp	x20, x19, [sp, #0x10]
101f450b0:     	stp	x29, x30, [sp, #0x20]
101f450b4:     	add	x29, sp, #0x20
101f450b8:     	mov	x19, x2
101f450bc:     	mov	x20, x1
101f450c0:     	mov	x21, x0
101f450c4:     	add	x1, x2, #0x80
101f450c8:     	mov	x0, x20
101f450cc:     	bl	0x101f0df14 <__Z13ui_but_v3_setP5uiButPKf>
101f450d0:     	mov	x0, x20
101f450d4:     	bl	0x101f127c0 <__Z20ui_but_update_editedP5uiBut>
101f450d8:     	mov	x0, x21
101f450dc:     	mov	x1, x20
101f450e0:     	bl	0x101f37bcc <__ZL17ui_apply_but_funcP8bContextP5uiBut>
101f450e4:     	ldrsh	w8, [x20, #0x26]
101f450e8:     	str	w8, [x19, #0x28]
101f450ec:     	mov	w8, #0x1                ; =1
101f450f0:     	strb	w8, [x19, #0x2e]
101f450f4:     	ldp	x29, x30, [sp, #0x20]
101f450f8:     	ldp	x20, x19, [sp, #0x10]
101f450fc:     	ldp	x22, x21, [sp], #0x30
101f45100:     	ret
