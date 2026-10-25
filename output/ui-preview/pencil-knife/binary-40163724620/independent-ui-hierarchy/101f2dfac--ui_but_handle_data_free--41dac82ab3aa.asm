
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f2dfac <__Z23ui_but_handle_data_freePP18uiHandleButtonData>:
101f2dfac:     	stp	x22, x21, [sp, #-0x30]!
101f2dfb0:     	stp	x20, x19, [sp, #0x10]
101f2dfb4:     	stp	x29, x30, [sp, #0x20]
101f2dfb8:     	add	x29, sp, #0x20
101f2dfbc:     	mov	x19, x0
101f2dfc0:     	ldr	x20, [x0]
101f2dfc4:     	cbz	x20, 0x101f2e044 <__Z23ui_but_handle_data_freePP18uiHandleButtonData+0x98>
101f2dfc8:     	ldp	x0, x8, [x20, #0x140]
101f2dfcc:     	sub	x8, x8, x0
101f2dfd0:     	cmp	x8, #0x1
101f2dfd4:     	b.lt	0x101f2e01c <__Z23ui_but_handle_data_freePP18uiHandleButtonData+0x70>
101f2dfd8:     	mov	x9, #-0x5555555555555556 ; =-6148914691236517206
101f2dfdc:     	movk	x9, #0xaaab
101f2dfe0:     	umulh	x8, x8, x9
101f2dfe4:     	lsr	x8, x8, #6
101f2dfe8:     	add	x21, x8, #0x1
101f2dfec:     	add	x22, x0, #0x30
101f2dff0:     	b	0x101f2e004 <__Z23ui_but_handle_data_freePP18uiHandleButtonData+0x58>
101f2dff4:     	sub	x21, x21, #0x1
101f2dff8:     	add	x22, x22, #0x60
101f2dffc:     	cmp	x21, #0x1
101f2e000:     	b.le	0x101f2e018 <__Z23ui_but_handle_data_freePP18uiHandleButtonData+0x6c>
101f2e004:     	ldur	x0, [x22, #-0x18]
101f2e008:     	cmp	x22, x0
101f2e00c:     	b.eq	0x101f2dff4 <__Z23ui_but_handle_data_freePP18uiHandleButtonData+0x48>
101f2e010:     	bl	0x100ae425c <_MEM_freeN>
101f2e014:     	b	0x101f2dff4 <__Z23ui_but_handle_data_freePP18uiHandleButtonData+0x48>
101f2e018:     	ldr	x0, [x20, #0x140]
101f2e01c:     	add	x8, x20, #0x158
101f2e020:     	cmp	x0, x8
101f2e024:     	b.eq	0x101f2e02c <__Z23ui_but_handle_data_freePP18uiHandleButtonData+0x80>
101f2e028:     	bl	0x100ae425c <_MEM_freeN>
101f2e02c:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101f2e030:     	add	x8, x8, #0x690
101f2e034:     	ldr	x8, [x8]
101f2e038:     	mov	x0, x20
101f2e03c:     	mov	w1, #0x1                ; =1
101f2e040:     	blr	x8
101f2e044:     	str	xzr, [x19]
101f2e048:     	ldp	x29, x30, [sp, #0x20]
101f2e04c:     	ldp	x20, x19, [sp, #0x10]
101f2e050:     	ldp	x22, x21, [sp], #0x30
101f2e054:     	ret
101f2e058:     	bl	0x1000144bc <___clang_call_terminate>
101f2e05c:     	bl	0x1000144bc <___clang_call_terminate>
