
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f32afc <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent>:
101f32afc:     	stp	x28, x27, [sp, #-0x60]!
101f32b00:     	stp	x26, x25, [sp, #0x10]
101f32b04:     	stp	x24, x23, [sp, #0x20]
101f32b08:     	stp	x22, x21, [sp, #0x30]
101f32b0c:     	stp	x20, x19, [sp, #0x40]
101f32b10:     	stp	x29, x30, [sp, #0x50]
101f32b14:     	add	x29, sp, #0x50
101f32b18:     	mov	w9, #0x1050             ; =4176
101f32b1c:     	adrp	x16, 0x106365000 <_zlibVersion+0x106365000>
101f32b20:     	ldr	x16, [x16, #0x758]
101f32b24:     	blr	x16
101f32b28:     	sub	sp, sp, #0x1, lsl #12   ; =0x1000
101f32b2c:     	sub	sp, sp, #0x50
101f32b30:     	mov	x20, x3
101f32b34:     	mov	x21, x1
101f32b38:     	mov	x22, x0
101f32b3c:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
101f32b40:     	ldr	x8, [x8, #0x7f0]
101f32b44:     	ldr	x8, [x8]
101f32b48:     	stur	x8, [x29, #-0x60]
101f32b4c:     	ldr	x23, [x2, #0x3d0]
101f32b50:     	ldrb	w8, [x2, #0x19]
101f32b54:     	tbnz	w8, #0x5, 0x101f32b60 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x64>
101f32b58:     	ldrb	w25, [x23, #0xa1]
101f32b5c:     	b	0x101f32b64 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x68>
101f32b60:     	mov	w25, #0x1               ; =1
101f32b64:     	ldr	w8, [x23, #0x24]
101f32b68:     	cmp	w8, #0x1
101f32b6c:     	b.ne	0x101f32b98 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x9c>
101f32b70:     	ldrh	w8, [x20, #0x12]
101f32b74:     	cmp	w8, #0x1
101f32b78:     	b.ne	0x101f32bf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xf8>
101f32b7c:     	ldrb	w8, [x20, #0x2a]
101f32b80:     	mov	w9, #0xa                ; =10
101f32b84:     	tst	w8, #0x1
101f32b88:     	cset	w10, eq
101f32b8c:     	tst	w8, w9
101f32b90:     	csel	w8, wzr, w10, eq
101f32b94:     	b	0x101f32bf8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xfc>
101f32b98:     	mov	x19, x2
101f32b9c:     	ldr	w8, [x19, #0x18]
101f32ba0:     	tbnz	w8, #0xd, 0x101f32d70 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x274>
101f32ba4:     	mov	w0, #0x0                ; =0
101f32ba8:     	ldrb	w9, [x19, #0x21]
101f32bac:     	sub	w9, w9, #0x1
101f32bb0:     	cmp	w9, #0x2f
101f32bb4:     	b.hi	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f32bb8:     	adrp	x10, 0x105207000 <__ZTSN3tbb6detail2d19start_forINS1_13blocked_rangeImEENS0_2d225parallel_for_body_wrapperIPKN7blender2ed12greasepencil18MutableDrawingInfoEZNS8_9transformL25gizmo_3d_foreach_selectedEPK8bContextsbbNS7_11FunctionRefIFvRKNS7_7VecBaseIfLi3EEEEEEPPA4_KfPsE3$_2SA_EEKNS1_16auto_partitionerEEE+0x14>
101f32bbc:     	add	x10, x10, #0xe68
101f32bc0:     	adr	x11, 0x101f32bd0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd4>
101f32bc4:     	ldrh	w12, [x10, x9, lsl #1]
101f32bc8:     	add	x11, x11, x12, lsl #2
101f32bcc:     	br	x11
101f32bd0:     	add	x4, sp, #0x30
101f32bd4:     	mov	x0, x22
101f32bd8:     	mov	x1, x19
101f32bdc:     	mov	x2, x23
101f32be0:     	mov	x3, x20
101f32be4:     	bl	0x101f3e624 <__ZL25ui_do_but_ANY_drag_toggleP8bContextP5uiButP18uiHandleButtonDataPK7wmEventPi>
101f32be8:     	tbz	w0, #0x0, 0x101f32f40 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x444>
101f32bec:     	ldr	w0, [sp, #0x30]
101f32bf0:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f32bf4:     	mov	w8, #0x0                ; =0
101f32bf8:     	ldrh	w9, [x20, #0x10]
101f32bfc:     	cmp	w9, #0x63
101f32c00:     	csel	w27, wzr, w8, ne
101f32c04:     	cmp	w9, #0x76
101f32c08:     	csel	w26, wzr, w8, ne
101f32c0c:     	tbnz	w27, #0x0, 0x101f32c14 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x118>
101f32c10:     	cbz	w26, 0x101f32ca0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1a4>
101f32c14:     	ldrb	w8, [x2, #0x21]
101f32c18:     	cmp	w8, #0x1e
101f32c1c:     	b.ne	0x101f32ca0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1a4>
101f32c20:     	mov	x28, x2
101f32c24:     	ldr	x24, [x23, #0x18]
101f32c28:     	add	x1, x20, #0x14
101f32c2c:     	mov	x0, x24
101f32c30:     	mov	w2, #0x1                ; =1
101f32c34:     	mov	w3, #0x0                ; =0
101f32c38:     	mov	x4, #0x0                ; =0
101f32c3c:     	mov	x5, #0x0                ; =0
101f32c40:     	bl	0x101f72d68 <__Z25ui_but_find_mouse_over_exPK7ARegionPKibbPFbPK5uiButPKvES8_>
101f32c44:     	cbz	x0, 0x101f32cec <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f0>
101f32c48:     	mov	x19, x0
101f32c4c:     	ldrb	w8, [x0, #0x21]
101f32c50:     	cmp	w8, #0x3
101f32c54:     	mov	x1, x28
101f32c58:     	b.ne	0x101f32ce0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1e4>
101f32c5c:     	ldrb	w8, [x19, #0x19]
101f32c60:     	tbnz	w8, #0x5, 0x101f32ce0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1e4>
101f32c64:     	mov	w8, #0x1                ; =1
101f32c68:     	strb	w8, [x23, #0x2c]
101f32c6c:     	mov	x0, x22
101f32c70:     	mov	x2, x23
101f32c74:     	mov	w3, #0x0                ; =0
101f32c78:     	mov	w4, #0x0                ; =0
101f32c7c:     	bl	0x101f31410 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb>
101f32c80:     	mov	x0, x22
101f32c84:     	mov	x1, x24
101f32c88:     	mov	x2, x19
101f32c8c:     	mov	w3, #0x0                ; =0
101f32c90:     	bl	0x101f32854 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType>
101f32c94:     	ldr	x23, [x19, #0x3d0]
101f32c98:     	cbnz	w27, 0x101f32ca8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1ac>
101f32c9c:     	b	0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f32ca0:     	mov	x19, x2
101f32ca4:     	cbz	w27, 0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f32ca8:     	ldrb	w24, [x20, #0x2a]
101f32cac:     	mov	x0, x19
101f32cb0:     	bl	0x101f05a30 <__Z26ui_ipad_numbers_but_rebindP5uiBut>
101f32cb4:     	cbz	w0, 0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f32cb8:     	mov	x0, x19
101f32cbc:     	bl	0x101f73544 <__Z24ui_but_contains_passwordPK5uiBut>
101f32cc0:     	tbnz	w0, #0x0, 0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f32cc4:     	add	x0, sp, #0x30
101f32cc8:     	mov	w1, #0x1000             ; =4096
101f32ccc:     	bl	0x104b71840 <_zlibVersion+0x104b71840>
101f32cd0:     	ldr	x1, [x19, #0x80]
101f32cd4:     	cbz	x1, 0x101f32f84 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x488>
101f32cd8:     	mov	w8, #0x1                ; =1
101f32cdc:     	b	0x101f32f90 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x494>
101f32ce0:     	mov	x19, x1
101f32ce4:     	cbz	w27, 0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f32ce8:     	b	0x101f32ca8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1ac>
101f32cec:     	mov	x19, x28
101f32cf0:     	cbnz	w27, 0x101f32ca8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1ac>
101f32cf4:     	ldrh	w8, [x20, #0x10]
101f32cf8:     	cmp	w8, #0x3
101f32cfc:     	b.ne	0x101f32d6c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x270>
101f32d00:     	ldrb	w8, [x20, #0x2a]
101f32d04:     	cbnz	w8, 0x101f32d6c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x270>
101f32d08:     	ldrh	w8, [x20, #0x12]
101f32d0c:     	cmp	w8, #0x1
101f32d10:     	b.ne	0x101f32d6c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x270>
101f32d14:     	ldrb	w8, [x19, #0x21]
101f32d18:     	mov	x0, x19
101f32d1c:     	cmp	w8, #0x30
101f32d20:     	b.eq	0x101f32d34 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x238>
101f32d24:     	ldr	x0, [x23, #0x18]
101f32d28:     	add	x1, x20, #0x14
101f32d2c:     	bl	0x101f73218 <__Z28ui_view_item_find_mouse_overPK7ARegionPKi>
101f32d30:     	cbz	x0, 0x101f32d48 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x24c>
101f32d34:     	ldr	x0, [x0, #0x428]
101f32d38:     	mov	x1, x22
101f32d3c:     	bl	0x101fe5158 <__ZN7blender2ui16AbstractViewItem25activate_for_context_menuER8bContext>
101f32d40:     	ldr	x0, [x23, #0x18]
101f32d44:     	bl	0x10161f34c <__Z31ED_region_tag_redraw_no_rebuildP7ARegion>
101f32d48:     	mov	x0, x22
101f32d4c:     	mov	x1, x19
101f32d50:     	mov	x2, x20
101f32d54:     	bl	0x101f21ecc <__Z32ui_popup_context_menu_for_buttonP8bContextP5uiButPK7wmEvent>
101f32d58:     	cbz	w0, 0x101f32d6c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x270>
101f32d5c:     	ldr	x0, [x23, #0x8]
101f32d60:     	bl	0x100b44588 <__Z23WM_cursor_modal_restoreP8wmWindow>
101f32d64:     	mov	w0, #0x1                ; =1
101f32d68:     	b	0x101f32d74 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x278>
101f32d6c:     	tbz	w25, #0x0, 0x101f32db0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x2b4>
101f32d70:     	mov	w0, #0x0                ; =0
101f32d74:     	ldur	x8, [x29, #-0x60]
101f32d78:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
101f32d7c:     	ldr	x9, [x9, #0x7f0]
101f32d80:     	ldr	x9, [x9]
101f32d84:     	cmp	x9, x8
101f32d88:     	b.ne	0x101f33d00 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1204>
101f32d8c:     	add	sp, sp, #0x1, lsl #12   ; =0x1000
101f32d90:     	add	sp, sp, #0x50
101f32d94:     	ldp	x29, x30, [sp, #0x50]
101f32d98:     	ldp	x20, x19, [sp, #0x40]
101f32d9c:     	ldp	x22, x21, [sp, #0x30]
101f32da0:     	ldp	x24, x23, [sp, #0x20]
101f32da4:     	ldp	x26, x25, [sp, #0x10]
101f32da8:     	ldp	x28, x27, [sp], #0x60
101f32dac:     	ret
101f32db0:     	cbz	w26, 0x101f32e14 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x318>
101f32db4:     	ldrb	w21, [x20, #0x2a]
101f32db8:     	mov	x0, x19
101f32dbc:     	bl	0x101f05a30 <__Z26ui_ipad_numbers_but_rebindP5uiBut>
101f32dc0:     	cbz	w0, 0x101f32e90 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x394>
101f32dc4:     	mov	x0, x19
101f32dc8:     	bl	0x101f727f0 <__Z14UI_but_is_utf8PK5uiBut>
101f32dcc:     	mov	x1, x0
101f32dd0:     	add	x2, sp, #0x30
101f32dd4:     	mov	w0, #0x0                ; =0
101f32dd8:     	bl	0x100b96540 <__Z31WM_clipboard_text_get_firstlinebbPi>
101f32ddc:     	cbnz	x0, 0x101f32e04 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x308>
101f32de0:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101f32de4:     	add	x8, x8, #0x6e0
101f32de8:     	ldr	x8, [x8]
101f32dec:     	adrp	x3, 0x104d51000 <__ZL3hex+0x18534d>
101f32df0:     	add	x3, x3, #0xb48
101f32df4:     	mov	w0, #0x1                ; =1
101f32df8:     	mov	w1, #0x1                ; =1
101f32dfc:     	mov	w2, #0x1                ; =1
101f32e00:     	blr	x8
101f32e04:     	ldr	x8, [x19, #0x80]
101f32e08:     	cbz	x8, 0x101f32ffc <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x500>
101f32e0c:     	mov	w9, #0x1                ; =1
101f32e10:     	b	0x101f33008 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x50c>
101f32e14:     	ldr	w8, [x23, #0x24]
101f32e18:     	cmp	w8, #0x1
101f32e1c:     	b.ne	0x101f32b9c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xa0>
101f32e20:     	ldrh	w8, [x20, #0x10]
101f32e24:     	cmp	w8, #0xdb
101f32e28:     	b.gt	0x101f32e58 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x35c>
101f32e2c:     	cmp	w8, #0x1
101f32e30:     	b.eq	0x101f32e6c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x370>
101f32e34:     	cmp	w8, #0xa3
101f32e38:     	b.eq	0x101f32e6c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x370>
101f32e3c:     	b	0x101f32b9c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xa0>
101f32e40:     	mov	x0, x22
101f32e44:     	mov	x1, x19
101f32e48:     	mov	x2, x23
101f32e4c:     	mov	x3, x20
101f32e50:     	bl	0x101f3af60 <__ZL14ui_do_but_EXITP8bContextP5uiButP18uiHandleButtonDataPK7wmEvent>
101f32e54:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f32e58:     	mov	w9, #0x5021             ; =20513
101f32e5c:     	cmp	w8, w9
101f32e60:     	b.eq	0x101f32e6c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x370>
101f32e64:     	cmp	w8, #0xdc
101f32e68:     	b.ne	0x101f32b9c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xa0>
101f32e6c:     	ldrh	w8, [x20, #0x12]
101f32e70:     	cmp	w8, #0x2
101f32e74:     	b.ne	0x101f32b9c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xa0>
101f32e78:     	mov	x0, x22
101f32e7c:     	mov	x1, x19
101f32e80:     	mov	x2, x23
101f32e84:     	mov	x3, x20
101f32e88:     	bl	0x101f397e0 <__ZL29ui_do_but_extra_operator_iconP8bContextP5uiButP18uiHandleButtonDataPK7wmEvent>
101f32e8c:     	tbz	w0, #0x0, 0x101f32b9c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xa0>
101f32e90:     	mov	w0, #0x1                ; =1
101f32e94:     	b	0x101f32d74 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x278>
101f32e98:     	ldr	w8, [x23, #0x24]
101f32e9c:     	cmp	w8, #0x9
101f32ea0:     	b.eq	0x101f3319c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x6a0>
101f32ea4:     	cmp	w8, #0x1
101f32ea8:     	b.ne	0x101f33908 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe0c>
101f32eac:     	ldrh	w8, [x20, #0x10]
101f32eb0:     	cmp	w8, #0x1
101f32eb4:     	b.ne	0x101f33894 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd98>
101f32eb8:     	mov	x0, x19
101f32ebc:     	bl	0x101f273f0 <__Z24ui_but_drag_is_draggablePK5uiBut>
101f32ec0:     	cbz	w0, 0x101f32ee4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x3e8>
101f32ec4:     	ldrh	w8, [x20, #0x12]
101f32ec8:     	cmp	w8, #0x1
101f32ecc:     	b.ne	0x101f32ee4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x3e8>
101f32ed0:     	ldr	x1, [x23, #0x18]
101f32ed4:     	mov	x0, x19
101f32ed8:     	mov	x2, x20
101f32edc:     	bl	0x101f72cbc <__Z29ui_but_contains_point_px_iconPK5uiButP7ARegionPK7wmEvent>
101f32ee0:     	cbnz	w0, 0x101f32f1c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x420>
101f32ee4:     	ldrh	w8, [x20, #0x10]
101f32ee8:     	cmp	w8, #0x1
101f32eec:     	b.ne	0x101f33894 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd98>
101f32ef0:     	ldrh	w8, [x20, #0x12]
101f32ef4:     	cmp	w8, #0x1
101f32ef8:     	b.ne	0x101f33890 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd94>
101f32efc:     	ldrb	w8, [x19, #0x19]
101f32f00:     	tbnz	w8, #0x5, 0x101f33890 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd94>
101f32f04:     	mov	x0, x19
101f32f08:     	bl	0x101f0e43c <__Z14ui_but_is_boolPK5uiBut>
101f32f0c:     	tbz	w0, #0x0, 0x101f33878 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd7c>
101f32f10:     	ldr	x0, [x19, #0x420]
101f32f14:     	bl	0x101f736a4 <__Z16ui_block_is_menuPK7uiBlock>
101f32f18:     	tbnz	w0, #0x0, 0x101f33890 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd94>
101f32f1c:     	mov	x0, x22
101f32f20:     	mov	x1, x19
101f32f24:     	mov	w2, #0x9                ; =9
101f32f28:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f32f2c:     	ldr	w8, [x20, #0x14]
101f32f30:     	str	w8, [x23, #0xc0]
101f32f34:     	ldr	w8, [x20, #0x18]
101f32f38:     	str	w8, [x23, #0xc4]
101f32f3c:     	b	0x101f338c8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xdcc>
101f32f40:     	ldr	w8, [x23, #0x24]
101f32f44:     	cmp	w8, #0x1
101f32f48:     	b.ne	0x101f33908 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe0c>
101f32f4c:     	ldrh	w24, [x20, #0x10]
101f32f50:     	cmp	w24, #0xdc
101f32f54:     	b.eq	0x101f332f0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x7f4>
101f32f58:     	cmp	w24, #0xa3
101f32f5c:     	b.eq	0x101f332f0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x7f4>
101f32f60:     	cmp	w24, #0x1
101f32f64:     	b.ne	0x101f33300 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x804>
101f32f68:     	ldr	x0, [x19, #0x420]
101f32f6c:     	bl	0x101f736a4 <__Z16ui_block_is_menuPK7uiBlock>
101f32f70:     	cbz	w0, 0x101f33724 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xc28>
101f32f74:     	ldrh	w8, [x20, #0x12]
101f32f78:     	cmp	w8, #0x2
101f32f7c:     	b.ne	0x101f332fc <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x800>
101f32f80:     	b	0x101f33338 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x83c>
101f32f84:     	ldr	x8, [x19, #0x208]
101f32f88:     	cmp	x8, #0x0
101f32f8c:     	cset	w8, ne
101f32f90:     	ldrb	w9, [x19, #0x21]
101f32f94:     	cmp	w9, #0x16
101f32f98:     	b.gt	0x101f32fd4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x4d8>
101f32f9c:     	cmp	w9, #0x5
101f32fa0:     	b.le	0x101f330c8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x5cc>
101f32fa4:     	sub	w10, w9, #0x6
101f32fa8:     	cmp	w10, #0x2
101f32fac:     	b.lo	0x101f331e4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x6e8>
101f32fb0:     	cmp	w9, #0xf
101f32fb4:     	b.eq	0x101f33628 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xb2c>
101f32fb8:     	cmp	w9, #0x11
101f32fbc:     	b.ne	0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f32fc0:     	add	x1, sp, #0x30
101f32fc4:     	mov	x0, x19
101f32fc8:     	bl	0x101f3e1fc <__ZL19ui_but_copy_popoverP5uiButPci>
101f32fcc:     	tbz	w0, #0x0, 0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f32fd0:     	b	0x101f336e8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xbec>
101f32fd4:     	cmp	w9, #0x1a
101f32fd8:     	b.gt	0x101f3310c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x610>
101f32fdc:     	cmp	w9, #0x17
101f32fe0:     	b.eq	0x101f330e0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x5e4>
101f32fe4:     	cmp	w9, #0x19
101f32fe8:     	b.eq	0x101f33664 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xb68>
101f32fec:     	cmp	w9, #0x1a
101f32ff0:     	b.ne	0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f32ff4:     	cbz	w8, 0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f32ff8:     	b	0x101f331f8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x6fc>
101f32ffc:     	ldr	x9, [x19, #0x208]
101f33000:     	cmp	x9, #0x0
101f33004:     	cset	w9, ne
101f33008:     	ldrb	w10, [x19, #0x21]
101f3300c:     	cmp	w10, #0x19
101f33010:     	b.gt	0x101f33058 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x55c>
101f33014:     	cmp	w10, #0xe
101f33018:     	b.gt	0x101f33150 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x654>
101f3301c:     	sub	w8, w10, #0x6
101f33020:     	cmp	w8, #0x2
101f33024:     	b.hs	0x101f33208 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x70c>
101f33028:     	cbz	w9, 0x101f33804 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd08>
101f3302c:     	mov	x20, x0
101f33030:     	tbz	w21, #0x2, 0x101f33688 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xb8c>
101f33034:     	mov	x0, x19
101f33038:     	bl	0x101f7284c <__Z22ui_but_has_array_valuePK5uiBut>
101f3303c:     	cbz	w0, 0x101f33688 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xb8c>
101f33040:     	mov	x0, x22
101f33044:     	mov	x1, x19
101f33048:     	mov	x2, x23
101f3304c:     	mov	x3, x20
101f33050:     	bl	0x101f3e250 <__ZL26ui_but_paste_numeric_arrayP8bContextP5uiButP18uiHandleButtonDataPc>
101f33054:     	b	0x101f33800 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd04>
101f33058:     	cmp	w10, #0x1b
101f3305c:     	b.gt	0x101f3313c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x640>
101f33060:     	cmp	w10, #0x1a
101f33064:     	b.eq	0x101f334c0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x9c4>
101f33068:     	cmp	w10, #0x1b
101f3306c:     	b.ne	0x101f33804 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd08>
101f33070:     	cbz	x8, 0x101f33804 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd08>
101f33074:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f33078:     	ldrb	w8, [x8, #0x5f0]
101f3307c:     	cbz	w8, 0x101f33804 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd08>
101f33080:     	mov	x20, x0
101f33084:     	mov	x0, x22
101f33088:     	mov	x1, x19
101f3308c:     	mov	w2, #0x5                ; =5
101f33090:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f33094:     	ldr	x0, [x19, #0x80]
101f33098:     	bl	0x10009f174 <__Z26BKE_curvemapping_free_dataP12CurveMapping>
101f3309c:     	ldr	x0, [x19, #0x80]
101f330a0:     	adrp	x1, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f330a4:     	add	x1, x1, #0xb8
101f330a8:     	bl	0x10009f2f4 <__Z26BKE_curvemapping_copy_dataP12CurveMappingPKS_>
101f330ac:     	b	0x101f336c8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xbcc>
101f330b0:     	mov	x0, x22
101f330b4:     	mov	x1, x19
101f330b8:     	mov	x2, x23
101f330bc:     	mov	x3, x20
101f330c0:     	bl	0x101f398d0 <__ZL13ui_do_but_BUTP8bContextP5uiButP18uiHandleButtonDataPK7wmEvent>
101f330c4:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f330c8:     	cmp	w9, #0x1
101f330cc:     	b.eq	0x101f3363c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xb40>
101f330d0:     	cmp	w9, #0x3
101f330d4:     	b.eq	0x101f33124 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x628>
101f330d8:     	cmp	w9, #0x4
101f330dc:     	b.ne	0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f330e0:     	mov	x0, x19
101f330e4:     	bl	0x101f61258 <__Z19UI_but_menutype_getPK5uiBut>
101f330e8:     	cbz	x0, 0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f330ec:     	add	x8, x0, #0x10
101f330f0:     	str	x8, [sp]
101f330f4:     	adrp	x2, 0x104d51000 <__ZL3hex+0x18534d>
101f330f8:     	add	x2, x2, #0xb07
101f330fc:     	add	x0, sp, #0x30
101f33100:     	mov	w1, #0x1000             ; =4096
101f33104:     	bl	0x100823910 <__Z17BLI_snprintf_utf8PcmPKcz>
101f33108:     	b	0x101f336e8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xbec>
101f3310c:     	cmp	w9, #0x1b
101f33110:     	b.eq	0x101f33658 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xb5c>
101f33114:     	cmp	w9, #0x1c
101f33118:     	b.eq	0x101f3367c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xb80>
101f3311c:     	cmp	w9, #0x21
101f33120:     	b.ne	0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f33124:     	cbz	w8, 0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f33128:     	add	x1, sp, #0x30
101f3312c:     	mov	x0, x19
101f33130:     	mov	w2, #0x1000             ; =4096
101f33134:     	bl	0x101f0f71c <__Z17ui_but_string_getP5uiButPcm>
101f33138:     	b	0x101f336e8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xbec>
101f3313c:     	cmp	w10, #0x1c
101f33140:     	b.eq	0x101f3355c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xa60>
101f33144:     	cmp	w10, #0x21
101f33148:     	b.eq	0x101f33210 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x714>
101f3314c:     	b	0x101f33804 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd08>
101f33150:     	cmp	w10, #0xf
101f33154:     	b.eq	0x101f3359c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xaa0>
101f33158:     	cmp	w10, #0x19
101f3315c:     	b.ne	0x101f33804 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd08>
101f33160:     	cbz	x8, 0x101f33804 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd08>
101f33164:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f33168:     	ldrh	w8, [x8, #0x2e8]
101f3316c:     	cbz	w8, 0x101f33804 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd08>
101f33170:     	mov	x20, x0
101f33174:     	mov	x0, x22
101f33178:     	mov	x1, x19
101f3317c:     	mov	w2, #0x5                ; =5
101f33180:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f33184:     	ldr	x0, [x23, #0x98]
101f33188:     	adrp	x1, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f3318c:     	add	x1, x1, #0x2e8
101f33190:     	mov	w2, #0x308              ; =776
101f33194:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
101f33198:     	b	0x101f336c8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xbcc>
101f3319c:     	mov	x0, x22
101f331a0:     	mov	x1, x19
101f331a4:     	mov	x2, x23
101f331a8:     	mov	x3, x20
101f331ac:     	bl	0x101f41df4 <__ZL16ui_but_drag_initP8bContextP5uiButP18uiHandleButtonDataPK7wmEvent>
101f331b0:     	tbnz	w0, #0x0, 0x101f338c8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xdcc>
101f331b4:     	ldr	x1, [x23, #0x18]
101f331b8:     	mov	x0, x19
101f331bc:     	mov	x2, x20
101f331c0:     	bl	0x101f72cbc <__Z29ui_but_contains_point_px_iconPK5uiButP7ARegionPK7wmEvent>
101f331c4:     	tbz	w0, #0x0, 0x101f336fc <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xc00>
101f331c8:     	ldrh	w8, [x20, #0x10]
101f331cc:     	cmp	w8, #0x1
101f331d0:     	b.ne	0x101f33908 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe0c>
101f331d4:     	ldrh	w8, [x20, #0x12]
101f331d8:     	cmp	w8, #0x2
101f331dc:     	b.eq	0x101f338b8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xdbc>
101f331e0:     	b	0x101f33908 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe0c>
101f331e4:     	cbz	w8, 0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f331e8:     	tbz	w24, #0x2, 0x101f336dc <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xbe0>
101f331ec:     	mov	x0, x19
101f331f0:     	bl	0x101f7284c <__Z22ui_but_has_array_valuePK5uiBut>
101f331f4:     	cbz	w0, 0x101f336dc <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xbe0>
101f331f8:     	add	x1, sp, #0x30
101f331fc:     	mov	x0, x19
101f33200:     	bl	0x101f3dd5c <__ZL25ui_but_copy_numeric_arrayP5uiButPci>
101f33204:     	b	0x101f336e8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xbec>
101f33208:     	cmp	w10, #0x3
101f3320c:     	b.ne	0x101f33804 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd08>
101f33210:     	cbz	w9, 0x101f33804 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd08>
101f33214:     	mov	x20, x0
101f33218:     	mov	x0, x22
101f3321c:     	mov	x1, x19
101f33220:     	mov	x2, x20
101f33224:     	bl	0x101f2f8d4 <__Z29ui_but_set_string_interactiveP8bContextP5uiButPKc>
101f33228:     	b	0x101f33800 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd04>
101f3322c:     	mov	x0, x22
101f33230:     	mov	x1, x21
101f33234:     	mov	x2, x19
101f33238:     	mov	x3, x23
101f3323c:     	mov	x4, x20
101f33240:     	bl	0x101f3b384 <__ZL18ui_do_but_WAVEFORMP8bContextP7uiBlockP5uiButP18uiHandleButtonDataPK7wmEvent>
101f33244:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f33248:     	mov	x0, x22
101f3324c:     	mov	x1, x21
101f33250:     	mov	x2, x19
101f33254:     	mov	x3, x23
101f33258:     	mov	x4, x20
101f3325c:     	bl	0x101f3b140 <__ZL19ui_do_but_HISTOGRAMP8bContextP7uiBlockP5uiButP18uiHandleButtonDataPK7wmEvent>
101f33260:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f33264:     	tbz	w8, #0x1e, 0x101f33284 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x788>
101f33268:     	mov	x0, x22
101f3326c:     	mov	x1, x21
101f33270:     	mov	x2, x19
101f33274:     	mov	x3, x23
101f33278:     	mov	x4, x20
101f3327c:     	bl	0x101f3b590 <__ZL23ui_do_but_SEARCH_UNLINKP8bContextP7uiBlockP5uiButP18uiHandleButtonDataPK7wmEvent>
101f33280:     	cbnz	w0, 0x101f338c8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xdcc>
101f33284:     	mov	x0, x22
101f33288:     	mov	x1, x21
101f3328c:     	mov	x2, x19
101f33290:     	mov	x3, x23
101f33294:     	mov	x4, x20
101f33298:     	bl	0x101f3b640 <__ZL13ui_do_but_TEXP8bContextP7uiBlockP5uiButP18uiHandleButtonDataPK7wmEvent>
101f3329c:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f332a0:     	mov	x0, x22
101f332a4:     	mov	x1, x19
101f332a8:     	mov	x2, x23
101f332ac:     	mov	x3, x20
101f332b0:     	bl	0x101f3ae4c <__ZL17ui_do_but_LISTROWP8bContextP5uiButP18uiHandleButtonDataPK7wmEvent>
101f332b4:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f332b8:     	mov	x0, x22
101f332bc:     	mov	x1, x21
101f332c0:     	mov	x2, x19
101f332c4:     	mov	x3, x23
101f332c8:     	mov	x4, x20
101f332cc:     	bl	0x101f3d2ac <__ZL17ui_do_but_HSVCUBEP8bContextP7uiBlockP5uiButP18uiHandleButtonDataPK7wmEvent>
101f332d0:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f332d4:     	mov	x0, x22
101f332d8:     	mov	x1, x21
101f332dc:     	mov	x2, x19
101f332e0:     	mov	x3, x23
101f332e4:     	mov	x4, x20
101f332e8:     	bl	0x101f3a1c4 <__ZL14ui_do_but_GRIPP8bContextP7uiBlockP5uiButP18uiHandleButtonDataPK7wmEvent>
101f332ec:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f332f0:     	ldrh	w8, [x20, #0x12]
101f332f4:     	cmp	w8, #0x1
101f332f8:     	b.eq	0x101f33338 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x83c>
101f332fc:     	ldrh	w24, [x20, #0x10]
101f33300:     	mov	w0, #0x0                ; =0
101f33304:     	cmp	w24, #0xe
101f33308:     	b.hi	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f3330c:     	mov	w8, #0x1                ; =1
101f33310:     	lsl	w8, w8, w24
101f33314:     	mov	w9, #0x4c00             ; =19456
101f33318:     	tst	w8, w9
101f3331c:     	b.eq	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f33320:     	ldrb	w8, [x20, #0x2a]
101f33324:     	tbz	w8, #0x1, 0x101f33908 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe0c>
101f33328:     	ldrb	w8, [x19, #0x21]
101f3332c:     	sub	w9, w8, #0x8
101f33330:     	cmp	w9, #0x7
101f33334:     	b.hs	0x101f3377c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xc80>
101f33338:     	mov	x0, x22
101f3333c:     	mov	x1, x19
101f33340:     	mov	w2, #0xa                ; =10
101f33344:     	b	0x101f338c4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xdc8>
101f33348:     	mov	x0, x22
101f3334c:     	mov	x1, x21
101f33350:     	mov	x2, x19
101f33354:     	mov	x3, x23
101f33358:     	mov	x4, x20
101f3335c:     	bl	0x101f3c080 <__ZL19ui_do_but_COLORBANDP8bContextP7uiBlockP5uiButP18uiHandleButtonDataPK7wmEvent>
101f33360:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f33364:     	mov	x0, x22
101f33368:     	mov	x1, x21
101f3336c:     	mov	x2, x19
101f33370:     	mov	x3, x23
101f33374:     	mov	x4, x20
101f33378:     	bl	0x101f3c350 <__ZL15ui_do_but_CURVEP8bContextP7uiBlockP5uiButP18uiHandleButtonDataPK7wmEvent>
101f3337c:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f33380:     	mov	x0, x22
101f33384:     	mov	x1, x21
101f33388:     	mov	x2, x19
101f3338c:     	mov	x3, x23
101f33390:     	mov	x4, x20
101f33394:     	bl	0x101f39d70 <__ZL13ui_do_but_TABP8bContextP7uiBlockP5uiButP18uiHandleButtonDataPK7wmEvent>
101f33398:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f3339c:     	mov	x0, x22
101f333a0:     	mov	x1, x19
101f333a4:     	mov	x2, x23
101f333a8:     	mov	x3, x20
101f333ac:     	bl	0x101f39ee0 <__ZL19ui_do_but_VIEW_ITEMP8bContextP5uiButP18uiHandleButtonDataPK7wmEvent>
101f333b0:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f333b4:     	mov	x0, x22
101f333b8:     	mov	x1, x21
101f333bc:     	mov	x2, x19
101f333c0:     	mov	x3, x23
101f333c4:     	mov	x4, x20
101f333c8:     	bl	0x101f3be98 <__ZL17ui_do_but_UNITVECP8bContextP7uiBlockP5uiButP18uiHandleButtonDataPK7wmEvent>
101f333cc:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f333d0:     	mov	x0, x22
101f333d4:     	mov	x1, x19
101f333d8:     	mov	x2, x23
101f333dc:     	mov	x3, x20
101f333e0:     	bl	0x101f39ae8 <__ZL19ui_do_but_HOTKEYEVTP8bContextP5uiButP18uiHandleButtonDataPK7wmEvent>
101f333e4:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f333e8:     	mov	x0, x22
101f333ec:     	mov	x1, x21
101f333f0:     	mov	x2, x19
101f333f4:     	mov	x3, x23
101f333f8:     	mov	x4, x20
101f333fc:     	bl	0x101f3a91c <__ZL13ui_do_but_SLIP8bContextP7uiBlockP5uiButP18uiHandleButtonDataPK7wmEvent>
101f33400:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f33404:     	mov	x0, x22
101f33408:     	mov	x1, x21
101f3340c:     	mov	x2, x19
101f33410:     	mov	x3, x23
101f33414:     	mov	x4, x20
101f33418:     	bl	0x101f3d57c <__ZL19ui_do_but_HSVCIRCLEP8bContextP7uiBlockP5uiButP18uiHandleButtonDataPK7wmEvent>
101f3341c:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f33420:     	mov	x0, x22
101f33424:     	mov	x1, x21
101f33428:     	mov	x2, x19
101f3342c:     	mov	x3, x23
101f33430:     	mov	x4, x20
101f33434:     	bl	0x101f3a374 <__ZL13ui_do_but_NUMP8bContextP7uiBlockP5uiButP18uiHandleButtonDataPK7wmEvent>
101f33438:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f3343c:     	mov	x0, x22
101f33440:     	mov	x1, x21
101f33444:     	mov	x2, x19
101f33448:     	mov	x3, x23
101f3344c:     	mov	x4, x20
101f33450:     	bl	0x101f39ffc <__ZL16ui_do_but_SCROLLP8bContextP7uiBlockP5uiButP18uiHandleButtonDataPK7wmEvent>
101f33454:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f33458:     	mov	x0, x22
101f3345c:     	mov	x1, x19
101f33460:     	mov	x2, x23
101f33464:     	mov	x3, x20
101f33468:     	bl	0x101f3b94c <__ZL15ui_do_but_COLORP8bContextP5uiButP18uiHandleButtonDataPK7wmEvent>
101f3346c:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f33470:     	mov	x0, x22
101f33474:     	mov	x1, x19
101f33478:     	mov	x2, x23
101f3347c:     	mov	x3, x20
101f33480:     	bl	0x101f399f0 <__ZL16ui_do_but_KEYEVTP8bContextP5uiButP18uiHandleButtonDataPK7wmEvent>
101f33484:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f33488:     	mov	x0, x22
101f3348c:     	mov	x1, x21
101f33490:     	mov	x2, x19
101f33494:     	mov	x3, x23
101f33498:     	mov	x4, x20
101f3349c:     	bl	0x101f3d8e8 <__ZL22ui_do_but_TRACKPREVIEWP8bContextP7uiBlockP5uiButP18uiHandleButtonDataPK7wmEvent>
101f334a0:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f334a4:     	mov	x0, x22
101f334a8:     	mov	x1, x21
101f334ac:     	mov	x2, x19
101f334b0:     	mov	x3, x23
101f334b4:     	mov	x4, x20
101f334b8:     	bl	0x101f3ca7c <__ZL22ui_do_but_CURVEPROFILEP8bContextP7uiBlockP5uiButP18uiHandleButtonDataPK7wmEvent>
101f334bc:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f334c0:     	cbz	w9, 0x101f33804 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd08>
101f334c4:     	add	x8, sp, #0x30
101f334c8:     	add	x9, x8, #0x4
101f334cc:     	add	x10, x8, #0x8
101f334d0:     	add	x11, x8, #0xc
101f334d4:     	add	x12, x8, #0x10
101f334d8:     	stp	x11, x12, [sp, #0x18]
101f334dc:     	stp	x9, x10, [sp, #0x8]
101f334e0:     	str	x8, [sp]
101f334e4:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f334e8:     	add	x1, x1, #0xb98
101f334ec:     	mov	x20, x0
101f334f0:     	bl	0x104b72ea8 <_zlibVersion+0x104b72ea8>
101f334f4:     	cmp	w0, #0x3
101f334f8:     	b.ne	0x101f33754 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xc58>
101f334fc:     	ldr	w8, [sp, #0x38]
101f33500:     	stur	w8, [x29, #-0x68]
101f33504:     	ldr	x8, [sp, #0x30]
101f33508:     	stur	x8, [x29, #-0x70]
101f3350c:     	ldur	d0, [x29, #-0x70]
101f33510:     	fmul.2s	v1, v0, v0
101f33514:     	faddp.2s	s2, v1
101f33518:     	ldur	s1, [x29, #-0x68]
101f3351c:     	fmul	s3, s1, s1
101f33520:     	fadd	s2, s2, s3
101f33524:     	mov	w8, #0xad2e             ; =44334
101f33528:     	movk	w8, #0x554, lsl #16
101f3352c:     	fmov	s3, w8
101f33530:     	fcmp	s2, s3
101f33534:     	b.le	0x101f337dc <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xce0>
101f33538:     	fsqrt	s3, s2
101f3353c:     	fmov	s2, #1.00000000
101f33540:     	fdiv	s2, s2, s3
101f33544:     	fmul.2s	v0, v0, v2[0]
101f33548:     	stur	d0, [x29, #-0x70]
101f3354c:     	fcmp	s3, #0.0
101f33550:     	b.eq	0x101f337e0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xce4>
101f33554:     	fmul	s0, s1, s2
101f33558:     	b	0x101f337e4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xce8>
101f3355c:     	cbz	x8, 0x101f33804 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd08>
101f33560:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f33564:     	ldrb	w8, [x8, #0x5f1]
101f33568:     	cbz	w8, 0x101f33804 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd08>
101f3356c:     	mov	x20, x0
101f33570:     	mov	x0, x22
101f33574:     	mov	x1, x19
101f33578:     	mov	w2, #0x5                ; =5
101f3357c:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f33580:     	ldr	x0, [x19, #0x80]
101f33584:     	bl	0x10012b168 <__Z26BKE_curveprofile_free_dataP12CurveProfile>
101f33588:     	ldr	x0, [x19, #0x80]
101f3358c:     	adrp	x1, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f33590:     	add	x1, x1, #0x260
101f33594:     	bl	0x10012b254 <__Z26BKE_curveprofile_copy_dataP12CurveProfilePKS_>
101f33598:     	b	0x101f336c8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xbcc>
101f3359c:     	cbz	w9, 0x101f33804 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd08>
101f335a0:     	add	x8, sp, #0x30
101f335a4:     	add	x9, x8, #0x4
101f335a8:     	add	x10, x8, #0x8
101f335ac:     	add	x11, x8, #0xc
101f335b0:     	add	x12, x8, #0x10
101f335b4:     	stp	x11, x12, [sp, #0x18]
101f335b8:     	stp	x9, x10, [sp, #0x8]
101f335bc:     	str	x8, [sp]
101f335c0:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f335c4:     	add	x1, x1, #0xb98
101f335c8:     	mov	x21, x0
101f335cc:     	bl	0x104b72ea8 <_zlibVersion+0x104b72ea8>
101f335d0:     	cmp	w0, #0x4
101f335d4:     	b.ne	0x101f33768 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xc6c>
101f335d8:     	ldr	q0, [sp, #0x30]
101f335dc:     	stur	q0, [x29, #-0x70]
101f335e0:     	ldr	x0, [x19, #0x258]
101f335e4:     	cbz	x0, 0x101f33870 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd74>
101f335e8:     	bl	0x101250cd8 <__Z20RNA_property_subtypeP11PropertyRNA>
101f335ec:     	cmp	w0, #0x1e
101f335f0:     	b.ne	0x101f33600 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xb04>
101f335f4:     	sub	x0, x29, #0x70
101f335f8:     	sub	x1, x29, #0x70
101f335fc:     	bl	0x100797ea4 <__Z23linearrgb_to_srgb_v3_v3PfPKf>
101f33600:     	mov	x0, x19
101f33604:     	bl	0x101f05a30 <__Z26ui_ipad_numbers_but_rebindP5uiBut>
101f33608:     	cbz	w0, 0x101f33820 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd24>
101f3360c:     	ldr	x1, [x19, #0x258]
101f33610:     	add	x0, x19, #0x1f8
101f33614:     	bl	0x101251088 <__Z25RNA_property_array_lengthP10PointerRNAP11PropertyRNA>
101f33618:     	cmp	w0, #0x4
101f3361c:     	mov	w8, #0x4                ; =4
101f33620:     	csel	w20, w0, w8, lt
101f33624:     	b	0x101f33824 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd28>
101f33628:     	cbz	w8, 0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f3362c:     	add	x1, sp, #0x30
101f33630:     	mov	x0, x19
101f33634:     	bl	0x101f3df40 <__ZL17ui_but_copy_colorP5uiButPci>
101f33638:     	b	0x101f336e8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xbec>
101f3363c:     	ldr	x8, [x19, #0x3b0]
101f33640:     	cbz	x8, 0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f33644:     	add	x2, sp, #0x30
101f33648:     	mov	x0, x22
101f3364c:     	mov	x1, x19
101f33650:     	bl	0x101f3e154 <__ZL20ui_but_copy_operatorP8bContextP5uiButPci>
101f33654:     	b	0x101f336e8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xbec>
101f33658:     	mov	x0, x19
101f3365c:     	bl	0x101f3e0bc <__ZL24ui_but_copy_curvemappingP5uiBut>
101f33660:     	b	0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f33664:     	cbz	x1, 0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f33668:     	adrp	x0, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f3366c:     	add	x0, x0, #0x2e8
101f33670:     	mov	w2, #0x308              ; =776
101f33674:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
101f33678:     	b	0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f3367c:     	mov	x0, x19
101f33680:     	bl	0x101f3e108 <__ZL24ui_but_copy_CurveProfileP5uiBut>
101f33684:     	b	0x101f32cf4 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1f8>
101f33688:     	add	x3, sp, #0x30
101f3368c:     	mov	x0, x22
101f33690:     	mov	x1, x19
101f33694:     	mov	x2, x20
101f33698:     	bl	0x101f0f99c <__Z25ui_but_string_eval_numberP8bContextPK5uiButPKcPd>
101f3369c:     	cbz	w0, 0x101f33718 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xc1c>
101f336a0:     	mov	x0, x22
101f336a4:     	mov	x1, x19
101f336a8:     	mov	w2, #0x5                ; =5
101f336ac:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f336b0:     	ldr	d0, [sp, #0x30]
101f336b4:     	str	d0, [x23, #0x68]
101f336b8:     	mov	x0, x22
101f336bc:     	mov	x1, x19
101f336c0:     	mov	x2, x20
101f336c4:     	bl	0x101f102bc <__Z17ui_but_string_setP8bContextP5uiButPKc>
101f336c8:     	mov	x0, x22
101f336cc:     	mov	x1, x19
101f336d0:     	mov	w2, #0xa                ; =10
101f336d4:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f336d8:     	b	0x101f33800 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd04>
101f336dc:     	add	x1, sp, #0x30
101f336e0:     	mov	x0, x19
101f336e4:     	bl	0x101f3df08 <__ZL25ui_but_copy_numeric_valueP5uiButPci>
101f336e8:     	add	x0, sp, #0x30
101f336ec:     	mov	w1, #0x0                ; =0
101f336f0:     	bl	0x100b96554 <__Z21WM_clipboard_text_setPKcb>
101f336f4:     	mov	w0, #0x1                ; =1
101f336f8:     	b	0x101f32d74 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x278>
101f336fc:     	mov	x0, x22
101f33700:     	mov	x1, x19
101f33704:     	mov	w2, #0xa                ; =10
101f33708:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f3370c:     	mov	w0, #0x1                ; =1
101f33710:     	strb	w0, [x23, #0x2c]
101f33714:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f33718:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f3371c:     	add	x1, x1, #0xbad
101f33720:     	b	0x101f3375c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xc60>
101f33724:     	mov	x0, x22
101f33728:     	mov	x1, x19
101f3372c:     	mov	x2, x23
101f33730:     	mov	x3, x20
101f33734:     	bl	0x101f397e0 <__ZL29ui_do_but_extra_operator_iconP8bContextP5uiButP18uiHandleButtonDataPK7wmEvent>
101f33738:     	tbnz	w0, #0x0, 0x101f332fc <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x800>
101f3373c:     	ldrh	w8, [x20, #0x12]
101f33740:     	cmp	w8, #0x1
101f33744:     	b.eq	0x101f33338 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x83c>
101f33748:     	cmp	w8, #0x4
101f3374c:     	b.eq	0x101f33338 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x83c>
101f33750:     	b	0x101f332fc <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x800>
101f33754:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f33758:     	add	x1, x1, #0xbbf
101f3375c:     	mov	w0, #0x20               ; =32
101f33760:     	bl	0x100b4e5ec <__Z16WM_global_report11eReportTypePKc>
101f33764:     	b	0x101f33800 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd04>
101f33768:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f3376c:     	add	x1, x1, #0xbf0
101f33770:     	mov	w0, #0x20               ; =32
101f33774:     	bl	0x100b4e5ec <__Z16WM_global_report11eReportTypePKc>
101f33778:     	b	0x101f33870 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd74>
101f3377c:     	cmp	w8, #0x2
101f33780:     	b.ne	0x101f33908 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe0c>
101f33784:     	str	w24, [sp, #0x30]
101f33788:     	cmp	w24, #0xe
101f3378c:     	b.ne	0x101f337ac <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xcb0>
101f33790:     	add	x1, sp, #0x30
101f33794:     	sub	x2, x29, #0x70
101f33798:     	mov	x0, x20
101f3379c:     	bl	0x101f2e084 <__Z16ui_pan_to_scrollPK7wmEventPiS2_>
101f337a0:     	ldr	w24, [sp, #0x30]
101f337a4:     	cmp	w24, #0xe
101f337a8:     	b.eq	0x101f338c8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xdcc>
101f337ac:     	cmp	w24, #0xb
101f337b0:     	mov	w8, #-0x1               ; =-1
101f337b4:     	cneg	w1, w8, ne
101f337b8:     	mov	x0, x19
101f337bc:     	bl	0x101f2e10c <__Z26ui_but_find_select_in_enumP5uiButi>
101f337c0:     	cbz	x0, 0x101f338c8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xdcc>
101f337c4:     	mov	x1, x0
101f337c8:     	ldr	x0, [x0, #0x420]
101f337cc:     	cmp	w24, #0xb
101f337d0:     	b.ne	0x101f33c5c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1160>
101f337d4:     	bl	0x101f09dbc <__ZNK7uiBlock8next_butEPK5uiBut>
101f337d8:     	b	0x101f33c60 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1164>
101f337dc:     	stur	xzr, [x29, #-0x70]
101f337e0:     	fmov	s0, #1.00000000
101f337e4:     	stur	s0, [x29, #-0x68]
101f337e8:     	sub	x3, x29, #0x70
101f337ec:     	mov	x0, x22
101f337f0:     	mov	x1, x19
101f337f4:     	mov	x2, x23
101f337f8:     	mov	w4, #0x3                ; =3
101f337fc:     	bl	0x101f3e550 <__ZL22ui_but_set_float_arrayP8bContextP5uiButP18uiHandleButtonDataPKfi>
101f33800:     	mov	x0, x20
101f33804:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101f33808:     	add	x8, x8, #0x690
101f3380c:     	ldr	x8, [x8]
101f33810:     	mov	w1, #0x0                ; =0
101f33814:     	blr	x8
101f33818:     	mov	w0, #0x1                ; =1
101f3381c:     	b	0x101f32d74 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x278>
101f33820:     	mov	w20, #0x0               ; =0
101f33824:     	mov	x0, x19
101f33828:     	bl	0x101f05a30 <__Z26ui_ipad_numbers_but_rebindP5uiBut>
101f3382c:     	cbz	w0, 0x101f33870 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd74>
101f33830:     	mov	x0, x22
101f33834:     	mov	x1, x19
101f33838:     	mov	w2, #0x5                ; =5
101f3383c:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f33840:     	mov	x0, x19
101f33844:     	bl	0x101f05a30 <__Z26ui_ipad_numbers_but_rebindP5uiBut>
101f33848:     	cbz	w0, 0x101f33870 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd74>
101f3384c:     	ldr	x1, [x19, #0x258]
101f33850:     	add	x0, x19, #0x1f8
101f33854:     	sub	x2, x29, #0x70
101f33858:     	mov	x3, x20
101f3385c:     	bl	0x101257350 <__Z36RNA_property_float_set_array_at_mostP10PointerRNAP11PropertyRNAPKfi>
101f33860:     	mov	x0, x22
101f33864:     	mov	x1, x19
101f33868:     	mov	w2, #0xa                ; =10
101f3386c:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f33870:     	mov	x0, x21
101f33874:     	b	0x101f33804 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd08>
101f33878:     	ldrb	w8, [x19, #0x21]
101f3387c:     	cmp	w8, #0x2f
101f33880:     	b.ne	0x101f33890 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xd94>
101f33884:     	ldrb	w8, [x19, #0x48c]
101f33888:     	cmp	w8, #0x1
101f3388c:     	b.eq	0x101f32f10 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x414>
101f33890:     	ldrh	w8, [x20, #0x10]
101f33894:     	cmp	w8, #0x1
101f33898:     	b.eq	0x101f338ac <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xdb0>
101f3389c:     	cmp	w8, #0xdc
101f338a0:     	b.eq	0x101f338ac <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xdb0>
101f338a4:     	cmp	w8, #0xa3
101f338a8:     	b.ne	0x101f338d0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xdd4>
101f338ac:     	ldrh	w8, [x20, #0x12]
101f338b0:     	cmp	w8, #0x1
101f338b4:     	b.ne	0x101f338d0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xdd4>
101f338b8:     	mov	x0, x22
101f338bc:     	mov	x1, x19
101f338c0:     	mov	w2, #0x8                ; =8
101f338c4:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f338c8:     	mov	w0, #0x1                ; =1
101f338cc:     	b	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f338d0:     	mov	x0, x19
101f338d4:     	bl	0x101f0e7e0 <__Z23ui_but_supports_cyclingPK5uiBut>
101f338d8:     	cbz	w0, 0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f338dc:     	mov	w0, #0x0                ; =0
101f338e0:     	ldrh	w9, [x20, #0x10]
101f338e4:     	cmp	w9, #0xe
101f338e8:     	b.hi	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f338ec:     	mov	w8, #0x1                ; =1
101f338f0:     	lsl	w8, w8, w9
101f338f4:     	mov	w10, #0x4c00            ; =19456
101f338f8:     	tst	w8, w10
101f338fc:     	b.eq	0x101f3390c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe10>
101f33900:     	ldrb	w8, [x20, #0x2a]
101f33904:     	tbnz	w8, #0x1, 0x101f33b98 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x109c>
101f33908:     	mov	w0, #0x0                ; =0
101f3390c:     	ldr	x22, [x19, #0x3d0]
101f33910:     	cbz	x22, 0x101f32d74 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x278>
101f33914:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f33918:     	ldr	x8, [x8, #0x70]
101f3391c:     	cbz	x8, 0x101f339d0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xed4>
101f33920:     	ldr	x9, [x19, #0x8]
101f33924:     	fmov	d0, x8
101f33928:     	cnt.8b	v0, v0
101f3392c:     	uaddlv.8b	h0, v0
101f33930:     	fmov	w10, s0
101f33934:     	cmp	x10, #0x1
101f33938:     	b.hi	0x101f33948 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe4c>
101f3393c:     	sub	x11, x8, #0x1
101f33940:     	and	x11, x11, x9
101f33944:     	b	0x101f3395c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe60>
101f33948:     	mov	x11, x9
101f3394c:     	cmp	x9, x8
101f33950:     	b.lo	0x101f3395c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe60>
101f33954:     	udiv	x11, x9, x8
101f33958:     	msub	x11, x11, x8, x9
101f3395c:     	adrp	x12, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f33960:     	ldr	x12, [x12, #0x68]
101f33964:     	ldr	x12, [x12, x11, lsl #3]
101f33968:     	cbz	x12, 0x101f339d0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xed4>
101f3396c:     	ldr	x12, [x12]
101f33970:     	cbz	x12, 0x101f339d0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xed4>
101f33974:     	sub	x13, x8, #0x1
101f33978:     	b	0x101f33990 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe94>
101f3397c:     	ldr	x14, [x12, #0x10]
101f33980:     	cmp	x14, x9
101f33984:     	b.eq	0x101f339c8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xecc>
101f33988:     	ldr	x12, [x12]
101f3398c:     	cbz	x12, 0x101f339d0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xed4>
101f33990:     	ldr	x14, [x12, #0x8]
101f33994:     	cmp	x14, x9
101f33998:     	b.eq	0x101f3397c <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe80>
101f3399c:     	cmp	x10, #0x1
101f339a0:     	b.hi	0x101f339ac <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xeb0>
101f339a4:     	and	x14, x14, x13
101f339a8:     	b	0x101f339bc <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xec0>
101f339ac:     	cmp	x14, x8
101f339b0:     	b.lo	0x101f339bc <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xec0>
101f339b4:     	udiv	x15, x14, x8
101f339b8:     	msub	x14, x15, x8, x14
101f339bc:     	cmp	x14, x11
101f339c0:     	b.eq	0x101f33988 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xe8c>
101f339c4:     	b	0x101f339d0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xed4>
101f339c8:     	ldrb	w8, [x12, #0x19d]
101f339cc:     	tbnz	w8, #0x0, 0x101f32d74 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x278>
101f339d0:     	ldrh	w8, [x20, #0x10]
101f339d4:     	cmp	w8, #0x4
101f339d8:     	ccmp	w8, #0x11, #0x4, ne
101f339dc:     	b.ne	0x101f33ab8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xfbc>
101f339e0:     	ldrb	w8, [x19, #0x21]
101f339e4:     	and	w8, w8, #0xfe
101f339e8:     	cmp	w8, #0x6
101f339ec:     	b.ne	0x101f32d74 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x278>
101f339f0:     	ldr	w8, [x22, #0x24]
101f339f4:     	sub	w8, w8, #0x5
101f339f8:     	cmp	w8, #0x1
101f339fc:     	b.hi	0x101f32d74 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x278>
101f33a00:     	ldr	w8, [x22, #0x110]
101f33a04:     	cmp	w8, #0x1
101f33a08:     	b.eq	0x101f33ac8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xfcc>
101f33a0c:     	cbnz	w8, 0x101f32d74 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x278>
101f33a10:     	adrp	x8, 0x106d88000 <_build_commit_date>
101f33a14:     	add	x8, x8, #0xe08
101f33a18:     	mov	w9, #0x2912             ; =10514
101f33a1c:     	ldrsh	w8, [x8, x9]
101f33a20:     	ubfx	w9, w8, #29, #2
101f33a24:     	add	w8, w8, w9
101f33a28:     	sbfx	w8, w8, #2, #14
101f33a2c:     	scvtf	s0, w8
101f33a30:     	ldr	s1, [x21, #0x290]
101f33a34:     	fsqrt	s1, s1
101f33a38:     	fdiv	s3, s0, s1
101f33a3c:     	ldr	s0, [x22, #0x12c]
101f33a40:     	fmul	s2, s0, s0
101f33a44:     	ldr	s1, [x22, #0x130]
101f33a48:     	fmul	s4, s1, s1
101f33a4c:     	fadd	s2, s2, s4
101f33a50:     	fmul	s3, s3, s3
101f33a54:     	fcmp	s2, s3
101f33a58:     	b.le	0x101f32d74 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x278>
101f33a5c:     	fmov	s3, wzr
101f33a60:     	mov	w8, #0xad2e             ; =44334
101f33a64:     	movk	w8, #0x554, lsl #16
101f33a68:     	fmov	s4, w8
101f33a6c:     	fcmp	s2, s4
101f33a70:     	b.le	0x101f33a94 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xf98>
101f33a74:     	fsqrt	s2, s2
101f33a78:     	fmov	s3, #1.00000000
101f33a7c:     	fdiv	s2, s3, s2
101f33a80:     	fmul	s0, s0, s2
101f33a84:     	fmul	s1, s1, s2
101f33a88:     	fmov	s2, wzr
101f33a8c:     	fmul	s0, s0, s2
101f33a90:     	fadd	s3, s1, s0
101f33a94:     	fabs	s0, s3
101f33a98:     	fmov	s1, #0.75000000
101f33a9c:     	fcmp	s0, s1
101f33aa0:     	b.le	0x101f33af8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xffc>
101f33aa4:     	mov	w8, #0x1                ; =1
101f33aa8:     	str	w8, [x22, #0x110]
101f33aac:     	ldr	w8, [x20, #0x14]
101f33ab0:     	str	w8, [x22, #0x13c]
101f33ab4:     	b	0x101f33b70 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1074>
101f33ab8:     	ldr	w8, [x22, #0x110]
101f33abc:     	cmp	w8, #0x1
101f33ac0:     	b.eq	0x101f339e0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xee4>
101f33ac4:     	b	0x101f32d74 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x278>
101f33ac8:     	ldr	x8, [x22, #0x40]
101f33acc:     	cbz	x8, 0x101f33b04 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1008>
101f33ad0:     	ldrb	w8, [x22, #0x114]
101f33ad4:     	cmp	w8, #0x1
101f33ad8:     	b.ne	0x101f33af8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xffc>
101f33adc:     	mov	x20, x0
101f33ae0:     	mov	x0, x19
101f33ae4:     	mov	x1, x22
101f33ae8:     	bl	0x101f3da60 <__ZL25ui_multibut_states_createP5uiButP18uiHandleButtonData>
101f33aec:     	mov	x0, x20
101f33af0:     	mov	w8, #0x2                ; =2
101f33af4:     	b	0x101f33afc <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1000>
101f33af8:     	mov	w8, #0x3                ; =3
101f33afc:     	str	w8, [x22, #0x110]
101f33b00:     	b	0x101f32d74 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x278>
101f33b04:     	adrp	x8, 0x106d88000 <_build_commit_date>
101f33b08:     	add	x8, x8, #0xe08
101f33b0c:     	mov	w9, #0x2912             ; =10514
101f33b10:     	ldrsh	w8, [x8, x9]
101f33b14:     	ubfx	w9, w8, #29, #2
101f33b18:     	add	w8, w8, w9
101f33b1c:     	sbfx	w8, w8, #2, #14
101f33b20:     	scvtf	s0, w8
101f33b24:     	ldr	s1, [x21, #0x290]
101f33b28:     	fsqrt	s1, s1
101f33b2c:     	fdiv	s0, s0, s1
101f33b30:     	ldr	w9, [x22, #0x13c]
101f33b34:     	ldr	w8, [x20, #0x14]
101f33b38:     	subs	w9, w9, w8
101f33b3c:     	cneg	w9, w9, mi
101f33b40:     	ucvtf	s1, w9
101f33b44:     	fcmp	s0, s1
101f33b48:     	b.pl	0x101f33b70 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1074>
101f33b4c:     	add	x9, x20, #0x18
101f33b50:     	fmov	s0, w8
101f33b54:     	ld1.s	{ v0 }[1], [x9]
101f33b58:     	ldur	d1, [x20, #0x94]
101f33b5c:     	sabd.2s	v0, v1, v0
101f33b60:     	dup.2s	v1, v0[1]
101f33b64:     	cmhi.2s	v0, v0, v1
101f33b68:     	fmov	w8, s0
101f33b6c:     	tbnz	w8, #0x0, 0x101f33ad0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xfd4>
101f33b70:     	mov	x21, x0
101f33b74:     	mov	x0, x19
101f33b78:     	mov	x1, x22
101f33b7c:     	mov	x2, x20
101f33b80:     	bl	0x101f3dbd0 <__ZL22ui_multibut_states_tagP5uiButP18uiHandleButtonDataPK7wmEvent>
101f33b84:     	cbz	w0, 0x101f33b90 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1094>
101f33b88:     	ldr	x0, [x22, #0x18]
101f33b8c:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
101f33b90:     	mov	x0, x21
101f33b94:     	b	0x101f32d74 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x278>
101f33b98:     	cmp	w9, #0xe
101f33b9c:     	b.ne	0x101f33c04 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x1108>
101f33ba0:     	mov	x0, x20
101f33ba4:     	bl	0x100b4d3e4 <__Z25WM_event_absolute_delta_yPK7wmEvent>
101f33ba8:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f33bac:     	ldr	w9, [x8, #0x60]
101f33bb0:     	cmp	w0, #0x1
101f33bb4:     	b.lt	0x101f33bbc <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x10c0>
101f33bb8:     	tbnz	w9, #0x1f, 0x101f33bc8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x10cc>
101f33bbc:     	tbz	w0, #0x1f, 0x101f33bd0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x10d4>
101f33bc0:     	cmp	w9, #0x0
101f33bc4:     	b.le	0x101f33bd0 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0x10d4>
101f33bc8:     	str	w0, [x8, #0x60]
101f33bcc:     	b	0x101f338c8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xdcc>
101f33bd0:     	adds	w9, w9, w0
101f33bd4:     	str	w9, [x8, #0x60]
101f33bd8:     	cneg	w9, w9, mi
101f33bdc:     	adrp	x10, 0x106d88000 <_build_commit_date>
101f33be0:     	add	x10, x10, #0xe08
101f33be4:     	mov	w11, #0x2912            ; =10514
101f33be8:     	ldrsh	w10, [x10, x11]
101f33bec:     	cmp	w9, w10
101f33bf0:     	b.le	0x101f338c8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xdcc>
101f33bf4:     	cmp	w0, #0x0
101f33bf8:     	mov	w9, #0xa                ; =10
101f33bfc:     	cinc	w9, w9, le
101f33c00:     	str	wzr, [x8, #0x60]
101f33c04:     	cmp	w9, #0xb
101f33c08:     	mov	w8, #0x1                ; =1
101f33c0c:     	cneg	w1, w8, ne
101f33c10:     	mov	x0, x19
101f33c14:     	bl	0x101f996b4 <__Z16ui_but_menu_stepP5uiButi>
101f33c18:     	scvtf	d0, w0
101f33c1c:     	str	d0, [x23, #0x68]
101f33c20:     	mov	x0, x22
101f33c24:     	mov	x1, x19
101f33c28:     	mov	w2, #0xa                ; =10
101f33c2c:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f33c30:     	ldr	x1, [x19, #0x420]
101f33c34:     	mov	x0, x22
101f33c38:     	mov	x2, x19
101f33c3c:     	mov	x3, x23
101f33c40:     	mov	w4, #0x1                ; =1
101f33c44:     	bl	0x101f33df8 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab>
101f33c48:     	str	x19, [x23, #0x2f8]
101f33c4c:     	str	wzr, [x23, #0x2f0]
101f33c50:     	ldr	x0, [x23, #0x8]
101f33c54:     	bl	0x100b596a8 <__Z22WM_event_add_mousemoveP8wmWindow>
101f33c58:     	b	0x101f338c8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xdcc>
101f33c5c:     	bl	0x101f09e18 <__ZNK7uiBlock8prev_butEPK5uiBut>
101f33c60:     	mov	x24, x0
101f33c64:     	cbz	x0, 0x101f338c8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xdcc>
101f33c68:     	mov	x0, x19
101f33c6c:     	mov	x1, x24
101f33c70:     	bl	0x101f2e274 <__ZL31ui_but_find_select_in_enum__cmpPK5uiButS1_>
101f33c74:     	cbz	w0, 0x101f338c8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xdcc>
101f33c78:     	ldr	x25, [x23, #0x18]
101f33c7c:     	mov	w8, #0x1                ; =1
101f33c80:     	strb	w8, [x23, #0x2c]
101f33c84:     	mov	x0, x22
101f33c88:     	mov	x1, x19
101f33c8c:     	mov	x2, x23
101f33c90:     	mov	w3, #0x0                ; =0
101f33c94:     	mov	w4, #0x0                ; =0
101f33c98:     	bl	0x101f31410 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb>
101f33c9c:     	mov	x0, x22
101f33ca0:     	mov	x1, x25
101f33ca4:     	mov	x2, x24
101f33ca8:     	mov	w3, #0x0                ; =0
101f33cac:     	bl	0x101f32854 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType>
101f33cb0:     	ldr	x23, [x24, #0x3d0]
101f33cb4:     	cbz	x23, 0x101f338c8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xdcc>
101f33cb8:     	ldr	x1, [x19, #0x420]
101f33cbc:     	mov	x0, x22
101f33cc0:     	mov	x2, x24
101f33cc4:     	mov	x3, x23
101f33cc8:     	mov	w4, #0x1                ; =1
101f33ccc:     	bl	0x101f33df8 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab>
101f33cd0:     	mov	x0, x22
101f33cd4:     	mov	x1, x24
101f33cd8:     	mov	x2, x23
101f33cdc:     	mov	w3, #0x0                ; =0
101f33ce0:     	mov	w4, #0x0                ; =0
101f33ce4:     	bl	0x101f31410 <__ZL20button_activate_exitP8bContextP5uiButP18uiHandleButtonDatabb>
101f33ce8:     	mov	x0, x22
101f33cec:     	mov	x1, x25
101f33cf0:     	mov	x2, x19
101f33cf4:     	mov	w3, #0x0                ; =0
101f33cf8:     	bl	0x101f32854 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType>
101f33cfc:     	b	0x101f338c8 <__ZL12ui_do_buttonP8bContextP7uiBlockP5uiButPK7wmEvent+0xdcc>
101f33d00:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
