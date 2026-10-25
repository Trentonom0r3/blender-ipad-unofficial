
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f34954 <__Z30UI_ipad_knife_hud_event_handleP8bContextPK7wmEvent>:
101f34954:     	stp	x22, x21, [sp, #-0x30]!
101f34958:     	stp	x20, x19, [sp, #0x10]
101f3495c:     	stp	x29, x30, [sp, #0x20]
101f34960:     	add	x29, sp, #0x20
101f34964:     	mov	x19, x0
101f34968:     	mov	w0, #0x0                ; =0
101f3496c:     	cbz	x19, 0x101f349dc <__Z30UI_ipad_knife_hud_event_handleP8bContextPK7wmEvent+0x88>
101f34970:     	cbz	x1, 0x101f349dc <__Z30UI_ipad_knife_hud_event_handleP8bContextPK7wmEvent+0x88>
101f34974:     	mov	x21, x1
101f34978:     	mov	x0, x19
101f3497c:     	bl	0x100b50b84 <__Z30WM_ipad_knife_hud_scope_activePK8bContext>
101f34980:     	cbz	w0, 0x101f349dc <__Z30UI_ipad_knife_hud_event_handleP8bContextPK7wmEvent+0x88>
101f34984:     	mov	x0, x19
101f34988:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
101f3498c:     	cbz	x0, 0x101f349dc <__Z30UI_ipad_knife_hud_event_handleP8bContextPK7wmEvent+0x88>
101f34990:     	ldrh	w8, [x0, #0xc0]
101f34994:     	cmp	w8, #0x8
101f34998:     	b.ne	0x101f349d8 <__Z30UI_ipad_knife_hud_event_handleP8bContextPK7wmEvent+0x84>
101f3499c:     	mov	x1, x21
101f349a0:     	ldrh	w8, [x21, #0x10]
101f349a4:     	cmp	w8, #0x1
101f349a8:     	b.ne	0x101f349c8 <__Z30UI_ipad_knife_hud_event_handleP8bContextPK7wmEvent+0x74>
101f349ac:     	ldrh	w8, [x1, #0x12]
101f349b0:     	cmp	w8, #0x1
101f349b4:     	b.ne	0x101f349c8 <__Z30UI_ipad_knife_hud_event_handleP8bContextPK7wmEvent+0x74>
101f349b8:     	mov	x20, x0
101f349bc:     	bl	0x101f73934 <__Z25ui_region_find_active_butP7ARegion>
101f349c0:     	mov	x1, x21
101f349c4:     	cbz	x0, 0x101f349ec <__Z30UI_ipad_knife_hud_event_handleP8bContextPK7wmEvent+0x98>
101f349c8:     	mov	x0, x19
101f349cc:     	bl	0x101f34a60 <__ZL17ui_region_handlerP8bContextPK7wmEventPv>
101f349d0:     	mov	w0, #0x1                ; =1
101f349d4:     	b	0x101f349dc <__Z30UI_ipad_knife_hud_event_handleP8bContextPK7wmEvent+0x88>
101f349d8:     	mov	w0, #0x0                ; =0
101f349dc:     	ldp	x29, x30, [sp, #0x20]
101f349e0:     	ldp	x20, x19, [sp, #0x10]
101f349e4:     	ldp	x22, x21, [sp], #0x30
101f349e8:     	ret
101f349ec:     	add	x1, x21, #0x14
101f349f0:     	mov	x0, x20
101f349f4:     	mov	w2, #0x0                ; =0
101f349f8:     	mov	w3, #0x0                ; =0
101f349fc:     	mov	x4, #0x0                ; =0
101f34a00:     	mov	x5, #0x0                ; =0
101f34a04:     	bl	0x101f72d68 <__Z25ui_but_find_mouse_over_exPK7ARegionPKibbPFbPK5uiButPKvES8_>
101f34a08:     	mov	x1, x21
101f34a0c:     	cbz	x0, 0x101f349c8 <__Z30UI_ipad_knife_hud_event_handleP8bContextPK7wmEvent+0x74>
101f34a10:     	ldrb	w8, [x0, #0x21]
101f34a14:     	cmp	w8, #0x1
101f34a18:     	b.ne	0x101f349c8 <__Z30UI_ipad_knife_hud_event_handleP8bContextPK7wmEvent+0x74>
101f34a1c:     	ldr	x8, [x0, #0x420]
101f34a20:     	cbz	x8, 0x101f349c8 <__Z30UI_ipad_knife_hud_event_handleP8bContextPK7wmEvent+0x74>
101f34a24:     	ldr	x8, [x8, #0x50]
101f34a28:     	cbz	x8, 0x101f349c8 <__Z30UI_ipad_knife_hud_event_handleP8bContextPK7wmEvent+0x74>
101f34a2c:     	ldr	x8, [x8, #0x10]
101f34a30:     	mov	x22, x0
101f34a34:     	mov	x0, x8
101f34a38:     	bl	0x101f8cc54 <__Z28UI_ipad_knife_hud_panel_typePK9PanelType>
101f34a3c:     	mov	x1, x21
101f34a40:     	cbz	w0, 0x101f349c8 <__Z30UI_ipad_knife_hud_event_handleP8bContextPK7wmEvent+0x74>
101f34a44:     	mov	x2, x22
101f34a48:     	mov	x0, x19
101f34a4c:     	mov	x1, x20
101f34a50:     	mov	w3, #0x0                ; =0
101f34a54:     	bl	0x101f32854 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType>
101f34a58:     	mov	x1, x21
101f34a5c:     	b	0x101f349c8 <__Z30UI_ipad_knife_hud_event_handleP8bContextPK7wmEvent+0x74>
