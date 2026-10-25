
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f36c80 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField>:
101f36c80:     	sub	sp, sp, #0x90
101f36c84:     	stp	x28, x27, [sp, #0x30]
101f36c88:     	stp	x26, x25, [sp, #0x40]
101f36c8c:     	stp	x24, x23, [sp, #0x50]
101f36c90:     	stp	x22, x21, [sp, #0x60]
101f36c94:     	stp	x20, x19, [sp, #0x70]
101f36c98:     	stp	x29, x30, [sp, #0x80]
101f36c9c:     	add	x29, sp, #0x80
101f36ca0:     	mov	x22, x3
101f36ca4:     	mov	x25, x2
101f36ca8:     	mov	x24, x1
101f36cac:     	mov	x19, x0
101f36cb0:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f36cb4:     	mov	x20, x0
101f36cb8:     	mov	x0, x19
101f36cbc:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
101f36cc0:     	mov	x21, x0
101f36cc4:     	mov	x0, x19
101f36cc8:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101f36ccc:     	mov	x23, x0
101f36cd0:     	mov	x0, x19
101f36cd4:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f36cd8:     	mov	x26, x0
101f36cdc:     	mov	w0, #0x0                ; =0
101f36ce0:     	cbz	x23, 0x101f36ef8 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x278>
101f36ce4:     	cbz	x26, 0x101f36ef8 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x278>
101f36ce8:     	add	x0, x23, #0x1a0
101f36cec:     	mov	x1, x26
101f36cf0:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101f36cf4:     	cmn	w0, #0x1
101f36cf8:     	b.eq	0x101f36ef4 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x274>
101f36cfc:     	mov	x0, x26
101f36d00:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
101f36d04:     	add	x27, x0, #0x1c0
101f36d08:     	ldr	x27, [x27]
101f36d0c:     	cbz	x27, 0x101f36ef4 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x274>
101f36d10:     	add	x0, x27, #0x78
101f36d14:     	mov	x1, x25
101f36d18:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101f36d1c:     	cmn	w0, #0x1
101f36d20:     	b.eq	0x101f36d08 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x88>
101f36d24:     	ldrh	w8, [x25, #0xc0]
101f36d28:     	cmp	w8, #0x8
101f36d2c:     	b.ne	0x101f36ef4 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x274>
101f36d30:     	ldr	x8, [x25, #0x128]
101f36d34:     	ldrh	w8, [x8, #0x2b0]
101f36d38:     	cbz	w8, 0x101f36ef4 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x274>
101f36d3c:     	ldrh	w8, [x25, #0xc4]
101f36d40:     	mov	w9, #0x403              ; =1027
101f36d44:     	tst	w8, w9
101f36d48:     	b.ne	0x101f36ef4 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x274>
101f36d4c:     	mov	x0, x19
101f36d50:     	mov	x1, x27
101f36d54:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
101f36d58:     	mov	x0, x19
101f36d5c:     	mov	x1, x27
101f36d60:     	mov	x2, x25
101f36d64:     	bl	0x101f8d890 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion>
101f36d68:     	cbz	x0, 0x101f36ee4 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x264>
101f36d6c:     	mov	x1, x0
101f36d70:     	mov	x0, x19
101f36d74:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
101f36d78:     	add	x1, x22, #0x28
101f36d7c:     	mov	x0, x19
101f36d80:     	bl	0x101f8ed10 <__Z23UI_ipad_context_captureP8bContextPy>
101f36d84:     	cbz	w0, 0x101f36e00 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x180>
101f36d88:     	mov	x0, x19
101f36d8c:     	bl	0x100b54460 <__Z23WM_event_ipad_mode_safeP8bContext>
101f36d90:     	cbz	w0, 0x101f36e00 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x180>
101f36d94:     	mov	x8, sp
101f36d98:     	mov	x0, x19
101f36d9c:     	bl	0x101f8f56c <__Z26ui_ipad_ring_tool_identityPK8bContext>
101f36da0:     	ldrsb	w8, [x22, #0xa7]
101f36da4:     	tbz	w8, #0x1f, 0x101f36db0 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x130>
101f36da8:     	ldur	x0, [x22, #0x90]
101f36dac:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f36db0:     	ldr	q0, [sp]
101f36db4:     	stur	q0, [x22, #0x90]
101f36db8:     	ldr	x8, [sp, #0x10]
101f36dbc:     	stur	x8, [x22, #0xa0]
101f36dc0:     	mov	x0, x26
101f36dc4:     	bl	0x100b96ac4 <__Z27WM_window_native_pixel_sizePK8wmWindow>
101f36dc8:     	str	x0, [x22, #0xc0]
101f36dcc:     	adrp	x8, 0x106d88000 <_build_commit_date>
101f36dd0:     	add	x8, x8, #0xe08
101f36dd4:     	ldr	s0, [x8, #0x2654]
101f36dd8:     	str	s0, [x22, #0xc8]
101f36ddc:     	ldr	x8, [x23, #0x5c0]
101f36de0:     	cbz	x8, 0x101f36e1c <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x19c>
101f36de4:     	ldr	x8, [x8, #0xe0]
101f36de8:     	str	x8, [x22, #0xa8]
101f36dec:     	cbz	x8, 0x101f36e20 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x1a0>
101f36df0:     	ldr	x9, [x8]
101f36df4:     	str	x9, [x22, #0xb0]
101f36df8:     	ldr	x8, [x8, #0x8]
101f36dfc:     	b	0x101f36e28 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x1a8>
101f36e00:     	mov	w22, #0x0               ; =0
101f36e04:     	mov	x0, x19
101f36e08:     	mov	x1, x20
101f36e0c:     	mov	x2, x21
101f36e10:     	bl	0x101f8f7a8 <__Z30ui_ipad_action_context_restoreP8bContextmm>
101f36e14:     	mov	x0, x22
101f36e18:     	b	0x101f36ef8 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x278>
101f36e1c:     	str	xzr, [x22, #0xa8]
101f36e20:     	mov	x8, #0x0                ; =0
101f36e24:     	str	xzr, [x22, #0xb0]
101f36e28:     	str	x8, [x22, #0xb8]
101f36e2c:     	ldr	x8, [x24, #0x8]
101f36e30:     	stp	x8, x25, [x22, #0x10]
101f36e34:     	ldr	x8, [x25, #0x128]
101f36e38:     	ldr	x8, [x8, #0xb0]
101f36e3c:     	str	x8, [x22, #0x20]
101f36e40:     	ldr	x8, [x24, #0x420]
101f36e44:     	adrp	x1, 0x104cf7000 <__ZL3hex+0x12b34d>
101f36e48:     	add	x1, x1, #0x6e5
101f36e4c:     	add	x0, x8, #0x228
101f36e50:     	bl	0x100910920 <__ZNSt3__1eqB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_>
101f36e54:     	cbz	w0, 0x101f36edc <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x25c>
101f36e58:     	mov	x0, x19
101f36e5c:     	bl	0x100b82374 <__Z21WM_operator_last_redoPK8bContext>
101f36e60:     	cbz	x0, 0x101f36ee4 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x264>
101f36e64:     	mov	x24, x0
101f36e68:     	ldr	x8, [x23, #0x5c0]
101f36e6c:     	add	x0, x8, #0x68
101f36e70:     	mov	x1, x24
101f36e74:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101f36e78:     	cmn	w0, #0x1
101f36e7c:     	b.eq	0x101f36ee4 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x264>
101f36e80:     	ldr	x0, [x24, #0x58]
101f36e84:     	mov	x8, sp
101f36e88:     	bl	0x101f37488 <__ZL24ui_ipad_operator_capturePK14wmOperatorType>
101f36e8c:     	ldr	q0, [sp]
101f36e90:     	str	q0, [x22, #0x120]
101f36e94:     	ldr	x8, [sp, #0x10]
101f36e98:     	str	x8, [x22, #0x130]
101f36e9c:     	add	x23, x22, #0x138
101f36ea0:     	ldrsb	w8, [x22, #0x14f]
101f36ea4:     	tbz	w8, #0x1f, 0x101f36eb0 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x230>
101f36ea8:     	ldr	x0, [x23]
101f36eac:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f36eb0:     	ldur	q0, [sp, #0x18]
101f36eb4:     	str	q0, [x23]
101f36eb8:     	ldr	x8, [sp, #0x28]
101f36ebc:     	str	x8, [x23, #0x10]
101f36ec0:     	ldr	x8, [x22, #0x128]
101f36ec4:     	cbz	x8, 0x101f36ee4 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x264>
101f36ec8:     	str	x24, [x22, #0xd0]
101f36ecc:     	mov	x0, x24
101f36ed0:     	bl	0x100b42da0 <__Z29WM_operator_touch_lifetime_idPK10wmOperator>
101f36ed4:     	str	x0, [x22, #0xd8]
101f36ed8:     	cbz	x0, 0x101f36ee4 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x264>
101f36edc:     	mov	w22, #0x1               ; =1
101f36ee0:     	b	0x101f36e04 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField+0x184>
101f36ee4:     	mov	x0, x19
101f36ee8:     	mov	x1, x20
101f36eec:     	mov	x2, x21
101f36ef0:     	bl	0x101f8f7a8 <__Z30ui_ipad_action_context_restoreP8bContextmm>
101f36ef4:     	mov	w0, #0x0                ; =0
101f36ef8:     	ldp	x29, x30, [sp, #0x80]
101f36efc:     	ldp	x20, x19, [sp, #0x70]
101f36f00:     	ldp	x22, x21, [sp, #0x60]
101f36f04:     	ldp	x24, x23, [sp, #0x50]
101f36f08:     	ldp	x26, x25, [sp, #0x40]
101f36f0c:     	ldp	x28, x27, [sp, #0x30]
101f36f10:     	add	sp, sp, #0x90
101f36f14:     	ret
