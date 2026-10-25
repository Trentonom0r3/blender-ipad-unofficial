
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f36ac0 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion>:
101f36ac0:     	stp	x24, x23, [sp, #-0x40]!
101f36ac4:     	stp	x22, x21, [sp, #0x10]
101f36ac8:     	stp	x20, x19, [sp, #0x20]
101f36acc:     	stp	x29, x30, [sp, #0x30]
101f36ad0:     	add	x29, sp, #0x30
101f36ad4:     	mov	x19, x2
101f36ad8:     	mov	x20, x1
101f36adc:     	mov	x21, x0
101f36ae0:     	bl	0x1000b4c78 <__Z13CTX_data_mainPK8bContext>
101f36ae4:     	mov	x23, x0
101f36ae8:     	mov	x0, x21
101f36aec:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101f36af0:     	mov	x22, x0
101f36af4:     	mov	x0, x21
101f36af8:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f36afc:     	cbz	x23, 0x101f36bc0 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x100>
101f36b00:     	ldr	x8, [x20, #0x28]
101f36b04:     	cmp	x8, x23
101f36b08:     	ccmp	x22, #0x0, #0x4, eq
101f36b0c:     	b.eq	0x101f36bc0 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x100>
101f36b10:     	mov	x21, x0
101f36b14:     	add	x0, x23, #0x678
101f36b18:     	mov	x1, x22
101f36b1c:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101f36b20:     	cmn	w0, #0x1
101f36b24:     	b.eq	0x101f36bc0 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x100>
101f36b28:     	mov	x0, #0x0                ; =0
101f36b2c:     	ldr	w8, [x22, #0x144]
101f36b30:     	ldr	x9, [x20, #0x88]
101f36b34:     	cmp	x9, x8
101f36b38:     	b.ne	0x101f36bc4 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x104>
101f36b3c:     	cbz	x21, 0x101f36bc4 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x104>
101f36b40:     	add	x0, x22, #0x1a0
101f36b44:     	mov	x1, x21
101f36b48:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101f36b4c:     	mov	x8, x0
101f36b50:     	mov	x0, #0x0                ; =0
101f36b54:     	cmn	w8, #0x1
101f36b58:     	b.eq	0x101f36bc4 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x104>
101f36b5c:     	ldr	x8, [x20, #0x30]
101f36b60:     	cmp	x8, x21
101f36b64:     	b.ne	0x101f36bc4 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x104>
101f36b68:     	ldrsw	x8, [x21, #0xc0]
101f36b6c:     	ldr	x9, [x20, #0x80]
101f36b70:     	cmp	x9, x8
101f36b74:     	b.ne	0x101f36bc0 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x100>
101f36b78:     	mov	x0, x21
101f36b7c:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
101f36b80:     	mov	x8, x0
101f36b84:     	mov	x0, #0x0                ; =0
101f36b88:     	cbz	x8, 0x101f36bc4 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x104>
101f36b8c:     	ldr	x9, [x20, #0x38]
101f36b90:     	cmp	x9, x8
101f36b94:     	b.ne	0x101f36bc4 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x104>
101f36b98:     	ldr	w9, [x8, #0x144]
101f36b9c:     	ldr	x10, [x20, #0x50]
101f36ba0:     	cmp	x10, x9
101f36ba4:     	b.ne	0x101f36bc0 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x100>
101f36ba8:     	ldr	x8, [x8, #0x1c0]
101f36bac:     	cbz	x8, 0x101f36bc0 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x100>
101f36bb0:     	ldr	x9, [x20, #0x40]
101f36bb4:     	ldp	x11, x10, [x20, #0x18]
101f36bb8:     	ldr	x12, [x20, #0x10]
101f36bbc:     	b	0x101f36be4 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x124>
101f36bc0:     	mov	x0, #0x0                ; =0
101f36bc4:     	ldp	x29, x30, [sp, #0x30]
101f36bc8:     	ldp	x20, x19, [sp, #0x20]
101f36bcc:     	ldp	x22, x21, [sp, #0x10]
101f36bd0:     	ldp	x24, x23, [sp], #0x40
101f36bd4:     	ret
101f36bd8:     	mov	x0, #0x0                ; =0
101f36bdc:     	ldr	x8, [x8]
101f36be0:     	cbz	x8, 0x101f36bc4 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x104>
101f36be4:     	cmp	x9, x8
101f36be8:     	b.ne	0x101f36bd8 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x118>
101f36bec:     	ldr	x13, [x8, #0x78]
101f36bf0:     	cbnz	x13, 0x101f36c00 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x140>
101f36bf4:     	b	0x101f36bd8 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x118>
101f36bf8:     	ldr	x13, [x13]
101f36bfc:     	cbz	x13, 0x101f36bd8 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x118>
101f36c00:     	ldrh	w14, [x13, #0xc0]
101f36c04:     	cmp	w14, #0x8
101f36c08:     	ccmp	x11, x13, #0x0, eq
101f36c0c:     	b.ne	0x101f36bf8 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x138>
101f36c10:     	ldr	x14, [x13, #0x128]
101f36c14:     	ldr	x15, [x14, #0xb0]
101f36c18:     	cmp	x15, x10
101f36c1c:     	b.ne	0x101f36bf8 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x138>
101f36c20:     	ldr	x14, [x14, #0x260]
101f36c24:     	cbnz	x14, 0x101f36c34 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x174>
101f36c28:     	b	0x101f36bf8 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x138>
101f36c2c:     	ldr	x14, [x14]
101f36c30:     	cbz	x14, 0x101f36bf8 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x138>
101f36c34:     	ldrb	w15, [x14, #0x371]
101f36c38:     	cmp	w15, #0x1
101f36c3c:     	b.ne	0x101f36c2c <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x16c>
101f36c40:     	ldp	x15, x16, [x14, #0x10]
101f36c44:     	b	0x101f36c4c <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x18c>
101f36c48:     	add	x15, x15, #0x8
101f36c4c:     	cmp	x15, x16
101f36c50:     	b.eq	0x101f36c2c <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x16c>
101f36c54:     	ldr	x0, [x15]
101f36c58:     	ldr	x17, [x0, #0x8]
101f36c5c:     	cmp	x17, x12
101f36c60:     	b.ne	0x101f36c48 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x188>
101f36c64:     	ldr	x17, [x0, #0x420]
101f36c68:     	cmp	x17, x14
101f36c6c:     	b.ne	0x101f36c48 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x188>
101f36c70:     	cbz	x19, 0x101f36bc4 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x104>
101f36c74:     	str	x13, [x19]
101f36c78:     	ldr	x0, [x15]
101f36c7c:     	b	0x101f36bc4 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion+0x104>
