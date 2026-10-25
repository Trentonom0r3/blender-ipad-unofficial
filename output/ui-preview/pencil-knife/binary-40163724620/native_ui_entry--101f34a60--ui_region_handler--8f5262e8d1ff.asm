
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f34a60 <__ZL17ui_region_handlerP8bContextPK7wmEventPv>:
101f34a60:     	stp	x24, x23, [sp, #-0x40]!
101f34a64:     	stp	x22, x21, [sp, #0x10]
101f34a68:     	stp	x20, x19, [sp, #0x20]
101f34a6c:     	stp	x29, x30, [sp, #0x30]
101f34a70:     	add	x29, sp, #0x30
101f34a74:     	mov	x20, x1
101f34a78:     	mov	x19, x0
101f34a7c:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
101f34a80:     	mov	x21, x0
101f34a84:     	mov	x0, x19
101f34a88:     	mov	x1, x21
101f34a8c:     	bl	0x10163a2bc <__Z27ED_ipad_editing_shelf_staleP8bContextP7ARegion>
101f34a90:     	cbz	w0, 0x101f34ab8 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x58>
101f34a94:     	ldrh	w8, [x20, #0x10]
101f34a98:     	sub	w8, w8, #0x1
101f34a9c:     	cmp	w8, #0x16
101f34aa0:     	b.hi	0x101f34b64 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x104>
101f34aa4:     	add	x1, x20, #0x14
101f34aa8:     	mov	x0, x19
101f34aac:     	bl	0x10163a270 <__Z25ED_ipad_editing_shelf_hitP8bContextPKi>
101f34ab0:     	mov	x23, x0
101f34ab4:     	b	0x101f34b68 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x108>
101f34ab8:     	cbz	x21, 0x101f34b5c <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0xfc>
101f34abc:     	ldr	x8, [x21, #0x128]
101f34ac0:     	ldr	x8, [x8, #0x260]
101f34ac4:     	cbz	x8, 0x101f34b5c <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0xfc>
101f34ac8:     	mov	x0, x21
101f34acc:     	bl	0x101f73934 <__Z25ui_region_find_active_butP7ARegion>
101f34ad0:     	mov	x22, x0
101f34ad4:     	mov	x0, x21
101f34ad8:     	mov	x1, x20
101f34adc:     	bl	0x101f731b0 <__Z23ui_list_find_mouse_overPK7ARegionPK7wmEvent>
101f34ae0:     	mov	x24, x0
101f34ae4:     	cmp	x0, #0x0
101f34ae8:     	csel	x3, x0, x22, ne
101f34aec:     	mov	x0, x19
101f34af0:     	mov	x1, x20
101f34af4:     	mov	x2, x21
101f34af8:     	bl	0x101f707c0 <__Z23ui_handler_panel_regionP8bContextPK7wmEventP7ARegionPK5uiBut>
101f34afc:     	mov	x23, x0
101f34b00:     	cbz	x24, 0x101f34b78 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x118>
101f34b04:     	cbnz	w23, 0x101f34b78 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x118>
101f34b08:     	mov	x0, x19
101f34b0c:     	mov	x1, x20
101f34b10:     	mov	x2, x21
101f34b14:     	mov	x3, x24
101f34b18:     	bl	0x101f45e14 <__ZL20ui_handle_list_eventP8bContextPK7wmEventP7ARegionP5uiBut>
101f34b1c:     	mov	x23, x0
101f34b20:     	cbz	w0, 0x101f34b78 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x118>
101f34b24:     	cbz	x22, 0x101f34b78 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x118>
101f34b28:     	ldr	x23, [x22, #0x3d0]
101f34b2c:     	cbz	x23, 0x101f34bb0 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x150>
101f34b30:     	ldr	x2, [x23, #0xa8]
101f34b34:     	cbz	x2, 0x101f34b44 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0xe4>
101f34b38:     	ldp	x0, x1, [x23]
101f34b3c:     	bl	0x100b93b90 <__Z21WM_event_timer_removeP15wmWindowManagerP8wmWindowP7wmTimer>
101f34b40:     	str	xzr, [x23, #0xa8]
101f34b44:     	ldr	x1, [x23, #0x8]
101f34b48:     	cbz	x1, 0x101f34bb0 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x150>
101f34b4c:     	mov	x0, x19
101f34b50:     	bl	0x100b92bc8 <__Z16WM_tooltip_clearP8bContextP8wmWindow>
101f34b54:     	mov	w23, #0x1               ; =1
101f34b58:     	b	0x101f34bc4 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x164>
101f34b5c:     	mov	w23, #0x0               ; =0
101f34b60:     	b	0x101f34c68 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x208>
101f34b64:     	mov	w23, #0x0               ; =0
101f34b68:     	mov	x0, x19
101f34b6c:     	mov	x1, x21
101f34b70:     	bl	0x10163f63c <__Z32ED_ipad_editing_shelf_invalidateP8bContextP7ARegion>
101f34b74:     	b	0x101f34c68 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x208>
101f34b78:     	cbnz	w23, 0x101f34bc4 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x164>
101f34b7c:     	mov	x0, x19
101f34b80:     	mov	x1, x20
101f34b84:     	mov	x2, x21
101f34b88:     	bl	0x101f4620c <__ZL35ui_handle_region_semi_modal_buttonsP8bContextPK7wmEventP7ARegion>
101f34b8c:     	mov	x23, x0
101f34b90:     	cbnz	w0, 0x101f34bc4 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x164>
101f34b94:     	mov	x0, x19
101f34b98:     	mov	x1, x20
101f34b9c:     	cbz	x22, 0x101f34bb8 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x158>
101f34ba0:     	mov	x2, x22
101f34ba4:     	bl	0x101f4630c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut>
101f34ba8:     	mov	x23, x0
101f34bac:     	b	0x101f34bc4 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x164>
101f34bb0:     	mov	w23, #0x1               ; =1
101f34bb4:     	b	0x101f34bc4 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x164>
101f34bb8:     	mov	x2, x21
101f34bbc:     	bl	0x101f46f54 <__ZL21ui_handle_button_overP8bContextPK7wmEventP7ARegion>
101f34bc0:     	mov	w23, #0x0               ; =0
101f34bc4:     	ldrh	w8, [x20, #0x10]
101f34bc8:     	cmp	w8, #0x4
101f34bcc:     	b.ne	0x101f34c08 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x1a8>
101f34bd0:     	ldr	w8, [x20, #0x14]
101f34bd4:     	ldr	w9, [x20, #0x94]
101f34bd8:     	cmp	w8, w9
101f34bdc:     	b.ne	0x101f34bf0 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x190>
101f34be0:     	ldr	w8, [x20, #0x18]
101f34be4:     	ldr	w9, [x20, #0x98]
101f34be8:     	cmp	w8, w9
101f34bec:     	b.eq	0x101f34c08 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x1a8>
101f34bf0:     	ldr	x8, [x21, #0x128]
101f34bf4:     	ldr	x8, [x8, #0x260]
101f34bf8:     	cbz	x8, 0x101f34c08 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x1a8>
101f34bfc:     	strb	wzr, [x8, #0x372]
101f34c00:     	ldr	x8, [x8]
101f34c04:     	cbnz	x8, 0x101f34bfc <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x19c>
101f34c08:     	mov	x0, x20
101f34c0c:     	mov	x1, x21
101f34c10:     	bl	0x101f47094 <__ZL30ui_handle_viewlist_items_hoverPK7wmEventP7ARegion>
101f34c14:     	cbnz	w23, 0x101f34c60 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x200>
101f34c18:     	mov	x0, x19
101f34c1c:     	mov	x1, x20
101f34c20:     	mov	x2, x22
101f34c24:     	mov	x3, x21
101f34c28:     	bl	0x101f47190 <__ZL25ui_handle_view_item_eventP8bContextPK7wmEventP5uiButP7ARegion>
101f34c2c:     	cbz	w0, 0x101f34c38 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x1d8>
101f34c30:     	mov	w23, #0x1               ; =1
101f34c34:     	b	0x101f34c60 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x200>
101f34c38:     	ldrh	w8, [x20, #0x10]
101f34c3c:     	sub	w8, w8, #0x1
101f34c40:     	cmp	w8, #0x16
101f34c44:     	b.hi	0x101f34c5c <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x1fc>
101f34c48:     	add	x1, x20, #0x14
101f34c4c:     	mov	x0, x19
101f34c50:     	bl	0x10163a270 <__Z25ED_ipad_editing_shelf_hitP8bContextPKi>
101f34c54:     	mov	x23, x0
101f34c58:     	b	0x101f34c60 <__ZL17ui_region_handlerP8bContextPK7wmEventPv+0x200>
101f34c5c:     	mov	w23, #0x0               ; =0
101f34c60:     	mov	x0, x19
101f34c64:     	bl	0x101f42598 <__ZL24ui_apply_but_funcs_afterP8bContext>
101f34c68:     	mov	x0, x23
101f34c6c:     	ldp	x29, x30, [sp, #0x30]
101f34c70:     	ldp	x20, x19, [sp, #0x20]
101f34c74:     	ldp	x22, x21, [sp, #0x10]
101f34c78:     	ldp	x24, x23, [sp], #0x40
101f34c7c:     	ret
