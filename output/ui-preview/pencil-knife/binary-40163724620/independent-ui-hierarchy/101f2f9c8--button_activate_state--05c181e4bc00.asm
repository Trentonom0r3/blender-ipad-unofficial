
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>:
101f2f9c8:     	stp	d13, d12, [sp, #-0x90]!
101f2f9cc:     	stp	d11, d10, [sp, #0x10]
101f2f9d0:     	stp	d9, d8, [sp, #0x20]
101f2f9d4:     	stp	x28, x27, [sp, #0x30]
101f2f9d8:     	stp	x26, x25, [sp, #0x40]
101f2f9dc:     	stp	x24, x23, [sp, #0x50]
101f2f9e0:     	stp	x22, x21, [sp, #0x60]
101f2f9e4:     	stp	x20, x19, [sp, #0x70]
101f2f9e8:     	stp	x29, x30, [sp, #0x80]
101f2f9ec:     	add	x29, sp, #0x80
101f2f9f0:     	sub	sp, sp, #0x170
101f2f9f4:     	str	x0, [sp, #0x10]
101f2f9f8:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
101f2f9fc:     	ldr	x8, [x8, #0x7f0]
101f2fa00:     	ldr	x8, [x8]
101f2fa04:     	stur	x8, [x29, #-0x90]
101f2fa08:     	ldr	x19, [x1, #0x3d0]
101f2fa0c:     	ldr	w8, [x19, #0x24]
101f2fa10:     	cmp	w8, w2
101f2fa14:     	b.eq	0x101f30dec <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1424>
101f2fa18:     	mov	x21, x2
101f2fa1c:     	mov	x20, x1
101f2fa20:     	ldr	w8, [x1, #0x18]
101f2fa24:     	cmp	w2, #0x1
101f2fa28:     	b.ne	0x101f2fa64 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x9c>
101f2fa2c:     	and	w8, w8, #0xfffffffe
101f2fa30:     	str	w8, [x20, #0x18]
101f2fa34:     	ldr	x0, [sp, #0x10]
101f2fa38:     	mov	x1, x20
101f2fa3c:     	bl	0x101f384b0 <__ZL26button_tooltip_timer_resetP8bContextP5uiBut>
101f2fa40:     	mov	w27, #0x0               ; =0
101f2fa44:     	ldrb	w8, [x20, #0x21]
101f2fa48:     	cmp	w8, #0x12
101f2fa4c:     	b.gt	0x101f2faac <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xe4>
101f2fa50:     	cmp	w8, #0x4
101f2fa54:     	b.eq	0x101f2fb40 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x178>
101f2fa58:     	cmp	w8, #0x11
101f2fa5c:     	b.eq	0x101f2fb58 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x190>
101f2fa60:     	b	0x101f2fb70 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1a8>
101f2fa64:     	orr	w8, w8, #0x1
101f2fa68:     	str	w8, [x20, #0x18]
101f2fa6c:     	ldr	x2, [x19, #0xa8]
101f2fa70:     	cbz	x2, 0x101f2fa80 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xb8>
101f2fa74:     	ldp	x0, x1, [x19]
101f2fa78:     	bl	0x100b93b90 <__Z21WM_event_timer_removeP15wmWindowManagerP8wmWindowP7wmTimer>
101f2fa7c:     	str	xzr, [x19, #0xa8]
101f2fa80:     	ldr	x1, [x19, #0x8]
101f2fa84:     	cbz	x1, 0x101f2fa90 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xc8>
101f2fa88:     	ldr	x0, [sp, #0x10]
101f2fa8c:     	bl	0x100b92bc8 <__Z16WM_tooltip_clearP8bContextP8wmWindow>
101f2fa90:     	cmp	w21, #0x6
101f2fa94:     	b.ne	0x101f2fb6c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1a4>
101f2fa98:     	ldr	w8, [x19, #0x24]
101f2fa9c:     	cmp	w8, #0x7
101f2faa0:     	b.ne	0x101f2fac0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xf8>
101f2faa4:     	mov	w27, #0x1               ; =1
101f2faa8:     	b	0x101f2fb70 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1a8>
101f2faac:     	cmp	w8, #0x13
101f2fab0:     	b.eq	0x101f2fb58 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x190>
101f2fab4:     	cmp	w8, #0x17
101f2fab8:     	b.eq	0x101f2fb58 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x190>
101f2fabc:     	b	0x101f2fb70 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1a8>
101f2fac0:     	ldr	x8, [x19, #0x8]
101f2fac4:     	str	x8, [sp, #0x8]
101f2fac8:     	ldrb	w28, [x20, #0x21]
101f2facc:     	sturb	wzr, [x29, #-0xf1]
101f2fad0:     	ldr	x0, [x19, #0x40]
101f2fad4:     	cbz	x0, 0x101f2faf0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x128>
101f2fad8:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101f2fadc:     	add	x8, x8, #0x690
101f2fae0:     	ldr	x8, [x8]
101f2fae4:     	mov	w1, #0x0                ; =0
101f2fae8:     	blr	x8
101f2faec:     	str	xzr, [x19, #0x40]
101f2faf0:     	add	x0, sp, #0xe8
101f2faf4:     	ldr	x1, [sp, #0x10]
101f2faf8:     	bl	0x10161f9ac <__ZN15WorkspaceStatusC1EP8bContext>
101f2fafc:     	adrp	x1, 0x104bcf000 <__ZL3hex+0x334d>
101f2fb00:     	add	x1, x1, #0xcee
101f2fb04:     	mov	x0, #0x0                ; =0
101f2fb08:     	bl	0x100ef50ac <__Z22BLT_translate_do_ifacePKcS0_>
101f2fb0c:     	mov	x25, x0
101f2fb10:     	mov	x23, #-0x9              ; =-9
101f2fb14:     	movk	x23, #0x7fff, lsl #48
101f2fb18:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f2fb1c:     	cmp	x0, x23
101f2fb20:     	b.hi	0x101f30ea4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x14dc>
101f2fb24:     	mov	x24, x0
101f2fb28:     	cmp	x0, #0x17
101f2fb2c:     	b.hs	0x101f2feb0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x4e8>
101f2fb30:     	sturb	w24, [x29, #-0xd9]
101f2fb34:     	sub	x26, x29, #0xf0
101f2fb38:     	cbnz	x24, 0x101f2fed8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x510>
101f2fb3c:     	b	0x101f2fee8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x520>
101f2fb40:     	mov	x0, x20
101f2fb44:     	bl	0x101f6127c <__Z20UI_but_paneltype_getPK5uiBut>
101f2fb48:     	cbnz	x0, 0x101f2fb58 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x190>
101f2fb4c:     	mov	x0, x20
101f2fb50:     	bl	0x101f13d04 <__Z27ui_but_menu_draw_as_popoverPK5uiBut>
101f2fb54:     	cbz	w0, 0x101f2fb6c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1a4>
101f2fb58:     	ldrb	w8, [x19, #0xa3]
101f2fb5c:     	cmp	w8, #0x1
101f2fb60:     	b.ne	0x101f2fb6c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1a4>
101f2fb64:     	ldr	x8, [x19, #0xa8]
101f2fb68:     	cbz	x8, 0x101f2fe9c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x4d4>
101f2fb6c:     	mov	w27, #0x0               ; =0
101f2fb70:     	ldr	w8, [x19, #0x24]
101f2fb74:     	cmp	w21, #0x7
101f2fb78:     	b.eq	0x101f2fb84 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1bc>
101f2fb7c:     	cmp	w8, #0x6
101f2fb80:     	b.eq	0x101f2fb94 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1cc>
101f2fb84:     	cmp	w21, #0x6
101f2fb88:     	b.eq	0x101f2fba4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1dc>
101f2fb8c:     	cmp	w8, #0x7
101f2fb90:     	b.ne	0x101f2fba4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1dc>
101f2fb94:     	ldr	x0, [sp, #0x10]
101f2fb98:     	mov	x1, x20
101f2fb9c:     	mov	x2, x19
101f2fba0:     	bl	0x101f38580 <__ZL15ui_textedit_endP8bContextP5uiButP18uiHandleButtonData>
101f2fba4:     	cmp	w21, #0x5
101f2fba8:     	b.ne	0x101f308b8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xef0>
101f2fbac:     	mov	x0, x20
101f2fbb0:     	bl	0x101f73504 <__Z21ui_but_is_cursor_warpPK5uiBut>
101f2fbb4:     	cbz	w0, 0x101f2fe08 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x440>
101f2fbb8:     	ldrb	w8, [x20, #0x21]
101f2fbbc:     	cmp	w8, #0x1f
101f2fbc0:     	b.eq	0x101f2fbcc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x204>
101f2fbc4:     	cmp	w8, #0x16
101f2fbc8:     	b.ne	0x101f2fc08 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x240>
101f2fbcc:     	ldr	x0, [x19, #0x18]
101f2fbd0:     	ldr	x1, [x20, #0x420]
101f2fbd4:     	sub	x2, x29, #0xd8
101f2fbd8:     	add	x3, x20, #0x70
101f2fbdc:     	bl	0x101f098d4 <__Z23ui_block_to_window_rctfPK7ARegionPK7uiBlockP4rctfPKS5_>
101f2fbe0:     	sub	x0, x29, #0xf0
101f2fbe4:     	sub	x1, x29, #0xd8
101f2fbe8:     	bl	0x1007fd93c <__Z18BLI_rcti_rctf_copyP4rctiPK4rctf>
101f2fbec:     	ldr	x0, [sp, #0x10]
101f2fbf0:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f2fbf4:     	sub	x2, x29, #0xf0
101f2fbf8:     	mov	w1, #0x3                ; =3
101f2fbfc:     	mov	w3, #0x1                ; =1
101f2fc00:     	bl	0x100b44660 <__Z21WM_cursor_grab_enableP8wmWindow18eWM_CursorWrapAxisPK4rctib>
101f2fc04:     	b	0x101f2fc20 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x258>
101f2fc08:     	ldr	x0, [sp, #0x10]
101f2fc0c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f2fc10:     	mov	w1, #0x3                ; =3
101f2fc14:     	mov	x2, #0x0                ; =0
101f2fc18:     	mov	w3, #0x1                ; =1
101f2fc1c:     	bl	0x100b44660 <__Z21WM_cursor_grab_enableP8wmWindow18eWM_CursorWrapAxisPK4rctib>
101f2fc20:     	sub	x0, x29, #0xd8
101f2fc24:     	ldr	x1, [sp, #0x10]
101f2fc28:     	bl	0x10161f9ac <__ZN15WorkspaceStatusC1EP8bContext>
101f2fc2c:     	adrp	x1, 0x104bcf000 <__ZL3hex+0x334d>
101f2fc30:     	add	x1, x1, #0xcdf
101f2fc34:     	mov	x0, #0x0                ; =0
101f2fc38:     	bl	0x100ef50ac <__Z22BLT_translate_do_ifacePKcS0_>
101f2fc3c:     	mov	x24, x0
101f2fc40:     	mov	x28, #-0x9              ; =-9
101f2fc44:     	movk	x28, #0x7fff, lsl #48
101f2fc48:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f2fc4c:     	cmp	x0, x28
101f2fc50:     	b.hi	0x101f30e80 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x14b8>
101f2fc54:     	mov	x23, x0
101f2fc58:     	cmp	x0, #0x17
101f2fc5c:     	b.hs	0x101f2fc70 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x2a8>
101f2fc60:     	strb	w23, [sp, #0x5f]
101f2fc64:     	add	x25, sp, #0x48
101f2fc68:     	cbnz	x23, 0x101f2fc98 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x2d0>
101f2fc6c:     	b	0x101f2fca8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x2e0>
101f2fc70:     	orr	x8, x23, #0x7
101f2fc74:     	cmp	x8, #0x17
101f2fc78:     	mov	w9, #0x19               ; =25
101f2fc7c:     	csinc	x26, x9, x8, eq
101f2fc80:     	mov	x0, x26
101f2fc84:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
101f2fc88:     	mov	x25, x0
101f2fc8c:     	orr	x8, x26, #0x8000000000000000
101f2fc90:     	stp	x23, x8, [sp, #0x50]
101f2fc94:     	str	x0, [sp, #0x48]
101f2fc98:     	mov	x0, x25
101f2fc9c:     	mov	x1, x24
101f2fca0:     	mov	x2, x23
101f2fca4:     	bl	0x104b72380 <_zlibVersion+0x104b72380>
101f2fca8:     	strb	wzr, [x25, x23]
101f2fcac:     	sub	x0, x29, #0xd8
101f2fcb0:     	add	x1, sp, #0x48
101f2fcb4:     	mov	w2, #0x369              ; =873
101f2fcb8:     	mov	w3, #0x0                ; =0
101f2fcbc:     	bl	0x10161f9b0 <__ZN15WorkspaceStatus4itemENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEii>
101f2fcc0:     	ldrsb	w8, [sp, #0x5f]
101f2fcc4:     	tbz	w8, #0x1f, 0x101f2fcd0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x308>
101f2fcc8:     	ldr	x0, [sp, #0x48]
101f2fccc:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2fcd0:     	adrp	x1, 0x104bd8000 <__ZL3hex+0xc34d>
101f2fcd4:     	add	x1, x1, #0x5cd
101f2fcd8:     	mov	x0, #0x0                ; =0
101f2fcdc:     	bl	0x100ef50ac <__Z22BLT_translate_do_ifacePKcS0_>
101f2fce0:     	mov	x24, x0
101f2fce4:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f2fce8:     	cmp	x0, x28
101f2fcec:     	b.hi	0x101f30e8c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x14c4>
101f2fcf0:     	mov	x23, x0
101f2fcf4:     	cmp	x0, #0x17
101f2fcf8:     	b.hs	0x101f2fd0c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x344>
101f2fcfc:     	strb	w23, [sp, #0x47]
101f2fd00:     	add	x25, sp, #0x30
101f2fd04:     	cbnz	x23, 0x101f2fd34 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x36c>
101f2fd08:     	b	0x101f2fd44 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x37c>
101f2fd0c:     	orr	x8, x23, #0x7
101f2fd10:     	cmp	x8, #0x17
101f2fd14:     	mov	w9, #0x19               ; =25
101f2fd18:     	csinc	x26, x9, x8, eq
101f2fd1c:     	mov	x0, x26
101f2fd20:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
101f2fd24:     	mov	x25, x0
101f2fd28:     	orr	x8, x26, #0x8000000000000000
101f2fd2c:     	stp	x23, x8, [sp, #0x38]
101f2fd30:     	str	x0, [sp, #0x30]
101f2fd34:     	mov	x0, x25
101f2fd38:     	mov	x1, x24
101f2fd3c:     	mov	x2, x23
101f2fd40:     	bl	0x104b72380 <_zlibVersion+0x104b72380>
101f2fd44:     	strb	wzr, [x25, x23]
101f2fd48:     	sub	x0, x29, #0xd8
101f2fd4c:     	add	x1, sp, #0x30
101f2fd50:     	mov	w2, #0x2d3              ; =723
101f2fd54:     	mov	w3, #0x0                ; =0
101f2fd58:     	bl	0x10161f9b0 <__ZN15WorkspaceStatus4itemENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEii>
101f2fd5c:     	ldrsb	w8, [sp, #0x47]
101f2fd60:     	tbz	w8, #0x1f, 0x101f2fd6c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x3a4>
101f2fd64:     	ldr	x0, [sp, #0x30]
101f2fd68:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2fd6c:     	adrp	x1, 0x104c35000 <__ZL3hex+0x6934d>
101f2fd70:     	add	x1, x1, #0x72b
101f2fd74:     	mov	x0, #0x0                ; =0
101f2fd78:     	bl	0x100ef50ac <__Z22BLT_translate_do_ifacePKcS0_>
101f2fd7c:     	mov	x24, x0
101f2fd80:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f2fd84:     	cmp	x0, x28
101f2fd88:     	b.hi	0x101f30e98 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x14d0>
101f2fd8c:     	mov	x23, x0
101f2fd90:     	cmp	x0, #0x17
101f2fd94:     	b.hs	0x101f2fda8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x3e0>
101f2fd98:     	strb	w23, [sp, #0x2f]
101f2fd9c:     	add	x25, sp, #0x18
101f2fda0:     	cbnz	x23, 0x101f2fdd0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x408>
101f2fda4:     	b	0x101f2fde0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x418>
101f2fda8:     	orr	x8, x23, #0x7
101f2fdac:     	cmp	x8, #0x17
101f2fdb0:     	mov	w9, #0x19               ; =25
101f2fdb4:     	csinc	x26, x9, x8, eq
101f2fdb8:     	mov	x0, x26
101f2fdbc:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
101f2fdc0:     	mov	x25, x0
101f2fdc4:     	orr	x8, x26, #0x8000000000000000
101f2fdc8:     	stp	x23, x8, [sp, #0x20]
101f2fdcc:     	str	x0, [sp, #0x18]
101f2fdd0:     	mov	x0, x25
101f2fdd4:     	mov	x1, x24
101f2fdd8:     	mov	x2, x23
101f2fddc:     	bl	0x104b72380 <_zlibVersion+0x104b72380>
101f2fde0:     	strb	wzr, [x25, x23]
101f2fde4:     	sub	x0, x29, #0xd8
101f2fde8:     	add	x1, sp, #0x18
101f2fdec:     	mov	w2, #0x34c              ; =844
101f2fdf0:     	mov	w3, #0x0                ; =0
101f2fdf4:     	bl	0x10161f9b0 <__ZN15WorkspaceStatus4itemENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEii>
101f2fdf8:     	ldrsb	w8, [sp, #0x2f]
101f2fdfc:     	tbz	w8, #0x1f, 0x101f2fe08 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x440>
101f2fe00:     	ldr	x0, [sp, #0x18]
101f2fe04:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2fe08:     	ldrb	w8, [x20, #0x21]
101f2fe0c:     	cmp	w8, #0x19
101f2fe10:     	b.le	0x101f2fe30 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x468>
101f2fe14:     	cmp	w8, #0x1b
101f2fe18:     	b.gt	0x101f2fe58 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x490>
101f2fe1c:     	cmp	w8, #0x1a
101f2fe20:     	b.eq	0x101f2fe68 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x4a0>
101f2fe24:     	cmp	w8, #0x1b
101f2fe28:     	b.eq	0x101f2fe90 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x4c8>
101f2fe2c:     	b	0x101f2fff4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x62c>
101f2fe30:     	cmp	w8, #0xf
101f2fe34:     	b.eq	0x101f2fe68 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x4a0>
101f2fe38:     	cmp	w8, #0x16
101f2fe3c:     	b.eq	0x101f2fe68 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x4a0>
101f2fe40:     	cmp	w8, #0x19
101f2fe44:     	b.ne	0x101f2fff4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x62c>
101f2fe48:     	ldr	x8, [x20, #0x80]
101f2fe4c:     	str	x8, [x19, #0x98]
101f2fe50:     	str	x8, [x20, #0x428]
101f2fe54:     	b	0x101f305dc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xc14>
101f2fe58:     	cmp	w8, #0x1c
101f2fe5c:     	b.eq	0x101f2fe90 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x4c8>
101f2fe60:     	cmp	w8, #0x1f
101f2fe64:     	b.ne	0x101f2fff4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x62c>
101f2fe68:     	add	x1, x19, #0x8c
101f2fe6c:     	mov	x0, x20
101f2fe70:     	bl	0x101f0dcdc <__Z13ui_but_v3_getP5uiButPf>
101f2fe74:     	ldur	d0, [x19, #0x8c]
101f2fe78:     	mov	x8, x19
101f2fe7c:     	str	d0, [x8, #0x80]!
101f2fe80:     	ldr	s0, [x8, #0x14]
101f2fe84:     	str	s0, [x8, #0x8]
101f2fe88:     	str	x8, [x20, #0x3f8]
101f2fe8c:     	b	0x101f305dc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xc14>
101f2fe90:     	ldr	x8, [x20, #0x80]
101f2fe94:     	str	x8, [x20, #0x428]
101f2fe98:     	b	0x101f305dc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xc14>
101f2fe9c:     	ldr	x8, [x20, #0x420]
101f2fea0:     	ldrb	w9, [x8, #0x353]
101f2fea4:     	tbz	w9, #0x0, 0x101f300cc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x704>
101f2fea8:     	mov	w8, #0x1                ; =1
101f2feac:     	b	0x101f3044c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xa84>
101f2feb0:     	orr	x8, x24, #0x7
101f2feb4:     	cmp	x8, #0x17
101f2feb8:     	mov	w9, #0x19               ; =25
101f2febc:     	csinc	x27, x9, x8, eq
101f2fec0:     	mov	x0, x27
101f2fec4:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
101f2fec8:     	mov	x26, x0
101f2fecc:     	orr	x8, x27, #0x8000000000000000
101f2fed0:     	stp	x24, x8, [x29, #-0xe8]
101f2fed4:     	stur	x0, [x29, #-0xf0]
101f2fed8:     	mov	x0, x26
101f2fedc:     	mov	x1, x25
101f2fee0:     	mov	x2, x24
101f2fee4:     	bl	0x104b72380 <_zlibVersion+0x104b72380>
101f2fee8:     	strb	wzr, [x26, x24]
101f2feec:     	add	x0, sp, #0xe8
101f2fef0:     	sub	x1, x29, #0xf0
101f2fef4:     	mov	w2, #0x36d              ; =877
101f2fef8:     	mov	w3, #0x0                ; =0
101f2fefc:     	bl	0x10161f9b0 <__ZN15WorkspaceStatus4itemENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEii>
101f2ff00:     	ldursb	w8, [x29, #-0xd9]
101f2ff04:     	tbz	w8, #0x1f, 0x101f2ff10 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x548>
101f2ff08:     	ldur	x0, [x29, #-0xf0]
101f2ff0c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2ff10:     	adrp	x1, 0x104bcf000 <__ZL3hex+0x334d>
101f2ff14:     	add	x1, x1, #0xcdf
101f2ff18:     	mov	x0, #0x0                ; =0
101f2ff1c:     	bl	0x100ef50ac <__Z22BLT_translate_do_ifacePKcS0_>
101f2ff20:     	mov	x25, x0
101f2ff24:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f2ff28:     	cmp	x0, x23
101f2ff2c:     	b.hi	0x101f30eb0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x14e8>
101f2ff30:     	mov	x24, x0
101f2ff34:     	cmp	x0, #0x17
101f2ff38:     	b.hs	0x101f2ff4c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x584>
101f2ff3c:     	strb	w24, [sp, #0xe7]
101f2ff40:     	add	x26, sp, #0xd0
101f2ff44:     	cbnz	x24, 0x101f2ff74 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x5ac>
101f2ff48:     	b	0x101f2ff84 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x5bc>
101f2ff4c:     	orr	x8, x24, #0x7
101f2ff50:     	cmp	x8, #0x17
101f2ff54:     	mov	w9, #0x19               ; =25
101f2ff58:     	csinc	x27, x9, x8, eq
101f2ff5c:     	mov	x0, x27
101f2ff60:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
101f2ff64:     	mov	x26, x0
101f2ff68:     	orr	x8, x27, #0x8000000000000000
101f2ff6c:     	stp	x24, x8, [sp, #0xd8]
101f2ff70:     	str	x0, [sp, #0xd0]
101f2ff74:     	mov	x0, x26
101f2ff78:     	mov	x1, x25
101f2ff7c:     	mov	x2, x24
101f2ff80:     	bl	0x104b72380 <_zlibVersion+0x104b72380>
101f2ff84:     	strb	wzr, [x26, x24]
101f2ff88:     	add	x0, sp, #0xe8
101f2ff8c:     	add	x1, sp, #0xd0
101f2ff90:     	mov	w2, #0x369              ; =873
101f2ff94:     	mov	w3, #0x0                ; =0
101f2ff98:     	bl	0x10161f9b0 <__ZN15WorkspaceStatus4itemENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEii>
101f2ff9c:     	and	w22, w28, #0xfe
101f2ffa0:     	ldrsb	w8, [sp, #0xe7]
101f2ffa4:     	tbz	w8, #0x1f, 0x101f2ffb0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x5e8>
101f2ffa8:     	ldr	x0, [sp, #0xd0]
101f2ffac:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2ffb0:     	cmp	w22, #0x6
101f2ffb4:     	b.eq	0x101f30294 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x8cc>
101f2ffb8:     	adrp	x1, 0x104d19000 <__ZL3hex+0x14d34d>
101f2ffbc:     	add	x1, x1, #0xdee
101f2ffc0:     	mov	x0, #0x0                ; =0
101f2ffc4:     	bl	0x100ef50ac <__Z22BLT_translate_do_ifacePKcS0_>
101f2ffc8:     	mov	x25, x0
101f2ffcc:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f2ffd0:     	cmp	x0, x23
101f2ffd4:     	b.hi	0x101f30ec8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1500>
101f2ffd8:     	mov	x24, x0
101f2ffdc:     	cmp	x0, #0x17
101f2ffe0:     	b.hs	0x101f300fc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x734>
101f2ffe4:     	strb	w24, [sp, #0xcf]
101f2ffe8:     	add	x26, sp, #0xb8
101f2ffec:     	cbnz	x24, 0x101f30124 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x75c>
101f2fff0:     	b	0x101f30134 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x76c>
101f2fff4:     	mov	x0, x20
101f2fff8:     	bl	0x101f0da80 <__Z16ui_but_value_getP5uiBut>
101f2fffc:     	mov	x8, x19
101f30000:     	str	d0, [x8, #0x68]!
101f30004:     	stp	d0, d0, [x8, #0x8]
101f30008:     	str	x8, [x20, #0x3f0]
101f3000c:     	ldp	s8, s9, [x20, #0x90]
101f30010:     	mov	x0, x20
101f30014:     	bl	0x101f0e42c <__Z17ui_but_scale_typePK5uiBut>
101f30018:     	mov	x23, x0
101f3001c:     	fsub	s10, s9, s8
101f30020:     	mov	w8, #0xcc77             ; =52343
101f30024:     	movk	w8, #0x31ab, lsl #16
101f30028:     	fmov	s0, w8
101f3002c:     	fmaxnm	s12, s8, s0
101f30030:     	cmp	w0, #0x1
101f30034:     	fmov	s0, wzr
101f30038:     	fcsel	s11, s12, s0, eq
101f3003c:     	ldrb	w8, [x20, #0x21]
101f30040:     	cmp	w8, #0x6
101f30044:     	b.ne	0x101f30534 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xb6c>
101f30048:     	mov	x0, x20
101f3004c:     	bl	0x101f73504 <__Z21ui_but_is_cursor_warpPK5uiBut>
101f30050:     	tbnz	w0, #0x0, 0x101f30534 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xb6c>
101f30054:     	fmov	s11, wzr
101f30058:     	cmp	w23, #0x1
101f3005c:     	b.ne	0x101f3007c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x6b4>
101f30060:     	ldr	s0, [x20, #0x42c]
101f30064:     	fneg	s0, s0
101f30068:     	bl	0x104b715c4 <_zlibVersion+0x104b715c4>
101f3006c:     	fmov	s1, #0.50000000
101f30070:     	fmul	s0, s0, s1
101f30074:     	fcmp	s12, s0
101f30078:     	fcsel	s11, s12, s0, gt
101f3007c:     	mov	x0, x20
101f30080:     	bl	0x101f0e3e0 <__Z15ui_but_is_floatPK5uiBut>
101f30084:     	tbz	w0, #0x0, 0x101f30474 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xaac>
101f30088:     	ldr	s0, [x20, #0x428]
101f3008c:     	mov	w8, #0xd70a             ; =55050
101f30090:     	movk	w8, #0x3c23, lsl #16
101f30094:     	fmov	s1, w8
101f30098:     	fmul	s0, s0, s1
101f3009c:     	adrp	x8, 0x106d88000 <_build_commit_date>
101f300a0:     	add	x8, x8, #0xe08
101f300a4:     	ldr	s1, [x8, #0x2654]
101f300a8:     	mov	w8, #0x447a0000         ; =1148846080
101f300ac:     	fmov	s2, w8
101f300b0:     	fmul	s1, s1, s2
101f300b4:     	mov	w8, #0xcccd             ; =52429
101f300b8:     	movk	w8, #0x3dcc, lsl #16
101f300bc:     	fmov	s2, w8
101f300c0:     	fminnm	s0, s0, s2
101f300c4:     	fdiv	s1, s1, s2
101f300c8:     	b	0x101f30488 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xac0>
101f300cc:     	ldrb	w8, [x8, #0x348]
101f300d0:     	tbz	w8, #0x0, 0x101f300e0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x718>
101f300d4:     	ldrb	w8, [x20, #0x21]
101f300d8:     	cmp	w8, #0x13
101f300dc:     	b.ne	0x101f30430 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xa68>
101f300e0:     	adrp	x8, 0x106d88000 <_build_commit_date>
101f300e4:     	add	x8, x8, #0xe08
101f300e8:     	mov	w9, #0x2625             ; =9765
101f300ec:     	ldrb	w9, [x8, x9]
101f300f0:     	tbz	w9, #0x1, 0x101f2fb6c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1a4>
101f300f4:     	mov	w9, #0x266c             ; =9836
101f300f8:     	b	0x101f3043c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xa74>
101f300fc:     	orr	x8, x24, #0x7
101f30100:     	cmp	x8, #0x17
101f30104:     	mov	w9, #0x19               ; =25
101f30108:     	csinc	x27, x9, x8, eq
101f3010c:     	mov	x0, x27
101f30110:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
101f30114:     	mov	x26, x0
101f30118:     	orr	x8, x27, #0x8000000000000000
101f3011c:     	stp	x24, x8, [sp, #0xc0]
101f30120:     	str	x0, [sp, #0xb8]
101f30124:     	mov	x0, x26
101f30128:     	mov	x1, x25
101f3012c:     	mov	x2, x24
101f30130:     	bl	0x104b72380 <_zlibVersion+0x104b72380>
101f30134:     	strb	wzr, [x26, x24]
101f30138:     	add	x0, sp, #0xe8
101f3013c:     	add	x1, sp, #0xb8
101f30140:     	mov	w2, #0x2d3              ; =723
101f30144:     	mov	w3, #0x332              ; =818
101f30148:     	bl	0x10161f9b0 <__ZN15WorkspaceStatus4itemENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEii>
101f3014c:     	ldrsb	w8, [sp, #0xcf]
101f30150:     	tbz	w8, #0x1f, 0x101f3015c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x794>
101f30154:     	ldr	x0, [sp, #0xb8]
101f30158:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f3015c:     	adrp	x1, 0x104c74000 <__ZL3hex+0xa834d>
101f30160:     	add	x1, x1, #0xc35
101f30164:     	mov	x0, #0x0                ; =0
101f30168:     	bl	0x100ef50ac <__Z22BLT_translate_do_ifacePKcS0_>
101f3016c:     	mov	x25, x0
101f30170:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f30174:     	cmp	x0, x23
101f30178:     	b.hi	0x101f30ed4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x150c>
101f3017c:     	mov	x24, x0
101f30180:     	cmp	x0, #0x17
101f30184:     	b.hs	0x101f30198 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x7d0>
101f30188:     	strb	w24, [sp, #0xb7]
101f3018c:     	add	x26, sp, #0xa0
101f30190:     	cbnz	x24, 0x101f301c0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x7f8>
101f30194:     	b	0x101f301d0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x808>
101f30198:     	orr	x8, x24, #0x7
101f3019c:     	cmp	x8, #0x17
101f301a0:     	mov	w9, #0x19               ; =25
101f301a4:     	csinc	x27, x9, x8, eq
101f301a8:     	mov	x0, x27
101f301ac:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
101f301b0:     	mov	x26, x0
101f301b4:     	orr	x8, x27, #0x8000000000000000
101f301b8:     	stp	x24, x8, [sp, #0xa8]
101f301bc:     	str	x0, [sp, #0xa0]
101f301c0:     	mov	x0, x26
101f301c4:     	mov	x1, x25
101f301c8:     	mov	x2, x24
101f301cc:     	bl	0x104b72380 <_zlibVersion+0x104b72380>
101f301d0:     	strb	wzr, [x26, x24]
101f301d4:     	add	x0, sp, #0xe8
101f301d8:     	add	x1, sp, #0xa0
101f301dc:     	mov	w2, #0x2d3              ; =723
101f301e0:     	mov	w3, #0x334              ; =820
101f301e4:     	bl	0x10161f9b0 <__ZN15WorkspaceStatus4itemENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEii>
101f301e8:     	ldrsb	w8, [sp, #0xb7]
101f301ec:     	tbz	w8, #0x1f, 0x101f301f8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x830>
101f301f0:     	ldr	x0, [sp, #0xa0]
101f301f4:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f301f8:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f301fc:     	add	x1, x1, #0x9b3
101f30200:     	mov	x0, #0x0                ; =0
101f30204:     	bl	0x100ef50ac <__Z22BLT_translate_do_ifacePKcS0_>
101f30208:     	mov	x25, x0
101f3020c:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f30210:     	cmp	x0, x23
101f30214:     	b.hi	0x101f30ee0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1518>
101f30218:     	mov	x24, x0
101f3021c:     	cmp	x0, #0x17
101f30220:     	b.hs	0x101f30234 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x86c>
101f30224:     	strb	w24, [sp, #0x9f]
101f30228:     	add	x26, sp, #0x88
101f3022c:     	cbnz	x24, 0x101f3025c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x894>
101f30230:     	b	0x101f3026c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x8a4>
101f30234:     	orr	x8, x24, #0x7
101f30238:     	cmp	x8, #0x17
101f3023c:     	mov	w9, #0x19               ; =25
101f30240:     	csinc	x27, x9, x8, eq
101f30244:     	mov	x0, x27
101f30248:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
101f3024c:     	mov	x26, x0
101f30250:     	orr	x8, x27, #0x8000000000000000
101f30254:     	stp	x24, x8, [sp, #0x90]
101f30258:     	str	x0, [sp, #0x88]
101f3025c:     	mov	x0, x26
101f30260:     	mov	x1, x25
101f30264:     	mov	x2, x24
101f30268:     	bl	0x104b72380 <_zlibVersion+0x104b72380>
101f3026c:     	strb	wzr, [x26, x24]
101f30270:     	add	x0, sp, #0xe8
101f30274:     	add	x1, sp, #0x88
101f30278:     	mov	w2, #0x2d3              ; =723
101f3027c:     	mov	w3, #0x347              ; =839
101f30280:     	bl	0x10161f9b0 <__ZN15WorkspaceStatus4itemENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEii>
101f30284:     	ldrsb	w8, [sp, #0x9f]
101f30288:     	tbz	w8, #0x1f, 0x101f30294 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x8cc>
101f3028c:     	ldr	x0, [sp, #0x88]
101f30290:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f30294:     	ldr	x8, [x20, #0x100]
101f30298:     	cbnz	x8, 0x101f302a4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x8dc>
101f3029c:     	ldr	x8, [x19, #0xf8]
101f302a0:     	cbz	x8, 0x101f30340 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x978>
101f302a4:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f302a8:     	add	x1, x1, #0x9b9
101f302ac:     	mov	x0, #0x0                ; =0
101f302b0:     	bl	0x100ef50ac <__Z22BLT_translate_do_ifacePKcS0_>
101f302b4:     	mov	x25, x0
101f302b8:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f302bc:     	cmp	x0, x23
101f302c0:     	b.hi	0x101f30ebc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x14f4>
101f302c4:     	mov	x24, x0
101f302c8:     	cmp	x0, #0x17
101f302cc:     	b.hs	0x101f302e0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x918>
101f302d0:     	strb	w24, [sp, #0x87]
101f302d4:     	add	x26, sp, #0x70
101f302d8:     	cbnz	x24, 0x101f30308 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x940>
101f302dc:     	b	0x101f30318 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x950>
101f302e0:     	orr	x8, x24, #0x7
101f302e4:     	cmp	x8, #0x17
101f302e8:     	mov	w9, #0x19               ; =25
101f302ec:     	csinc	x27, x9, x8, eq
101f302f0:     	mov	x0, x27
101f302f4:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
101f302f8:     	mov	x26, x0
101f302fc:     	orr	x8, x27, #0x8000000000000000
101f30300:     	stp	x24, x8, [sp, #0x78]
101f30304:     	str	x0, [sp, #0x70]
101f30308:     	mov	x0, x26
101f3030c:     	mov	x1, x25
101f30310:     	mov	x2, x24
101f30314:     	bl	0x104b72380 <_zlibVersion+0x104b72380>
101f30318:     	strb	wzr, [x26, x24]
101f3031c:     	add	x0, sp, #0xe8
101f30320:     	add	x1, sp, #0x70
101f30324:     	mov	w2, #0x36a              ; =874
101f30328:     	mov	w3, #0x0                ; =0
101f3032c:     	bl	0x10161f9b0 <__ZN15WorkspaceStatus4itemENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEii>
101f30330:     	ldrsb	w8, [sp, #0x87]
101f30334:     	tbz	w8, #0x1f, 0x101f30340 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x978>
101f30338:     	ldr	x0, [sp, #0x70]
101f3033c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f30340:     	ldrb	w8, [x19, #0x2f]
101f30344:     	cmp	w8, #0x1
101f30348:     	b.ne	0x101f30374 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x9ac>
101f3034c:     	mov	x23, x19
101f30350:     	strb	w8, [x23, #0x2c]!
101f30354:     	ldr	x1, [x20, #0x420]
101f30358:     	ldr	x0, [sp, #0x10]
101f3035c:     	mov	x2, x20
101f30360:     	mov	x3, x19
101f30364:     	mov	w4, #0x1                ; =1
101f30368:     	bl	0x101f33df8 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab>
101f3036c:     	strb	wzr, [x23]
101f30370:     	strb	wzr, [x19, #0x2f]
101f30374:     	cmp	w22, #0x6
101f30378:     	b.ne	0x101f3060c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xc44>
101f3037c:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f30380:     	ldr	x8, [x8, #0x70]
101f30384:     	cbz	x8, 0x101f305f0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xc28>
101f30388:     	ldr	x9, [x20, #0x8]
101f3038c:     	fmov	d0, x8
101f30390:     	cnt.8b	v0, v0
101f30394:     	uaddlv.8b	h0, v0
101f30398:     	fmov	w10, s0
101f3039c:     	cmp	x10, #0x1
101f303a0:     	b.hi	0x101f303b0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x9e8>
101f303a4:     	sub	x11, x8, #0x1
101f303a8:     	and	x11, x11, x9
101f303ac:     	b	0x101f303c4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x9fc>
101f303b0:     	mov	x11, x9
101f303b4:     	cmp	x9, x8
101f303b8:     	b.lo	0x101f303c4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x9fc>
101f303bc:     	udiv	x11, x9, x8
101f303c0:     	msub	x11, x11, x8, x9
101f303c4:     	adrp	x12, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f303c8:     	ldr	x12, [x12, #0x68]
101f303cc:     	ldr	x12, [x12, x11, lsl #3]
101f303d0:     	cbz	x12, 0x101f305f0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xc28>
101f303d4:     	ldr	x12, [x12]
101f303d8:     	cbz	x12, 0x101f305f0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xc28>
101f303dc:     	sub	x13, x8, #0x1
101f303e0:     	b	0x101f303f8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xa30>
101f303e4:     	ldr	x14, [x12, #0x10]
101f303e8:     	cmp	x14, x9
101f303ec:     	b.eq	0x101f305e8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xc20>
101f303f0:     	ldr	x12, [x12]
101f303f4:     	cbz	x12, 0x101f305f0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xc28>
101f303f8:     	ldr	x14, [x12, #0x8]
101f303fc:     	cmp	x14, x9
101f30400:     	b.eq	0x101f303e4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xa1c>
101f30404:     	cmp	x10, #0x1
101f30408:     	b.hi	0x101f30414 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xa4c>
101f3040c:     	and	x14, x14, x13
101f30410:     	b	0x101f30424 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xa5c>
101f30414:     	cmp	x14, x8
101f30418:     	b.lo	0x101f30424 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xa5c>
101f3041c:     	udiv	x15, x14, x8
101f30420:     	msub	x14, x15, x8, x14
101f30424:     	cmp	x14, x11
101f30428:     	b.eq	0x101f303f0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xa28>
101f3042c:     	b	0x101f305f0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xc28>
101f30430:     	adrp	x8, 0x106d88000 <_build_commit_date>
101f30434:     	add	x8, x8, #0xe08
101f30438:     	mov	w9, #0x266e             ; =9838
101f3043c:     	add	x8, x8, x9
101f30440:     	ldrsh	w8, [x8]
101f30444:     	tbnz	w8, #0x1f, 0x101f2fb6c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1a4>
101f30448:     	add	w8, w8, w8, lsl #2
101f3044c:     	ldp	x0, x1, [x19]
101f30450:     	ucvtf	d0, w8
101f30454:     	adrp	x8, 0x1051f2000 <__ZL7indices+0x9c>
101f30458:     	ldr	d1, [x8, #0x918]
101f3045c:     	fmul	d0, d0, d1
101f30460:     	mov	w2, #0x110              ; =272
101f30464:     	bl	0x100b9613c <__Z18WM_event_timer_addP15wmWindowManagerP8wmWindow11wmEventTyped>
101f30468:     	mov	w27, #0x0               ; =0
101f3046c:     	str	x0, [x19, #0xa8]
101f30470:     	b	0x101f2fb70 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1a8>
101f30474:     	adrp	x8, 0x106d88000 <_build_commit_date>
101f30478:     	add	x8, x8, #0xe08
101f3047c:     	ldr	s0, [x8, #0x2654]
101f30480:     	mov	w8, #0x447a0000         ; =1148846080
101f30484:     	fmov	s1, w8
101f30488:     	fmul	s0, s0, s1
101f3048c:     	fadd	s0, s0, s0
101f30490:     	fcmp	s10, s0
101f30494:     	fcsel	s1, s10, s0, mi
101f30498:     	fcmp	s10, s1
101f3049c:     	b.le	0x101f30534 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xb6c>
101f304a0:     	ldr	d0, [x19, #0x70]
101f304a4:     	fmov	s2, #0.50000000
101f304a8:     	fmul	s2, s1, s2
101f304ac:     	fcvt	d2, s2
101f304b0:     	fsub	d3, d0, d2
101f304b4:     	fcvt	s4, d3
101f304b8:     	fmov	w8, s4
101f304bc:     	and	w9, w8, #0x7fffffff
101f304c0:     	fcmp	d0, #0.0
101f304c4:     	mov	w8, #-0x800001          ; =-8388609
101f304c8:     	fmov	s3, w8
101f304cc:     	mov	w8, #0x7f7fffff         ; =2139095039
101f304d0:     	fmov	s5, w8
101f304d4:     	fcsel	s3, s5, s3, gt
101f304d8:     	mov	w8, #0x7f800000         ; =2139095040
101f304dc:     	cmp	w9, w8
101f304e0:     	fcsel	s8, s4, s3, lt
101f304e4:     	ldr	s4, [x20, #0x90]
101f304e8:     	fcmp	s8, s4
101f304ec:     	b.pl	0x101f304fc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xb34>
101f304f0:     	fadd	s9, s1, s4
101f304f4:     	fmov	s8, s4
101f304f8:     	b	0x101f30528 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xb60>
101f304fc:     	fadd	d2, d0, d2
101f30500:     	fcvt	s2, d2
101f30504:     	fmov	w9, s2
101f30508:     	and	w9, w9, #0x7fffffff
101f3050c:     	cmp	w9, w8
101f30510:     	fcsel	s9, s2, s3, lt
101f30514:     	ldr	s2, [x20, #0x94]
101f30518:     	fcmp	s9, s2
101f3051c:     	b.le	0x101f30528 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xb60>
101f30520:     	fsub	s8, s2, s1
101f30524:     	fmov	s9, s2
101f30528:     	fcmp	s8, s9
101f3052c:     	b.eq	0x101f30e44 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x147c>
101f30530:     	fsub	s10, s9, s8
101f30534:     	fcmp	s10, #0.0
101f30538:     	b.ne	0x101f30548 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xb80>
101f3053c:     	str	wzr, [x19, #0xd4]
101f30540:     	fmov	s0, wzr
101f30544:     	b	0x101f305d4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xc0c>
101f30548:     	cbz	w23, 0x101f305b8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xbf0>
101f3054c:     	cmp	w23, #0x1
101f30550:     	b.eq	0x101f30590 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xbc8>
101f30554:     	cmp	w23, #0x2
101f30558:     	b.ne	0x101f305d0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xc08>
101f3055c:     	fmul	s0, s8, s8
101f30560:     	fmul	s0, s8, s0
101f30564:     	fmul	s1, s9, s9
101f30568:     	fmul	s1, s9, s1
101f3056c:     	fsub	s1, s1, s0
101f30570:     	ldr	d2, [x19, #0x68]
101f30574:     	fcvt	s2, d2
101f30578:     	fsub	s2, s2, s8
101f3057c:     	fmul	s1, s1, s2
101f30580:     	fdiv	s1, s1, s10
101f30584:     	fadd	s0, s0, s1
101f30588:     	bl	0x104b71864 <_zlibVersion+0x104b71864>
101f3058c:     	b	0x101f305c0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xbf8>
101f30590:     	fdiv	s10, s9, s11
101f30594:     	ldr	d0, [x19, #0x68]
101f30598:     	fcvt	s0, d0
101f3059c:     	fdiv	s0, s0, s11
101f305a0:     	bl	0x104b722b4 <_zlibVersion+0x104b722b4>
101f305a4:     	fmov	s11, s0
101f305a8:     	fmov	s0, s10
101f305ac:     	bl	0x104b722b4 <_zlibVersion+0x104b722b4>
101f305b0:     	fdiv	s0, s11, s0
101f305b4:     	b	0x101f305c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xc00>
101f305b8:     	ldr	d0, [x19, #0x68]
101f305bc:     	fcvt	s0, d0
101f305c0:     	fsub	s0, s0, s8
101f305c4:     	fdiv	s0, s0, s10
101f305c8:     	str	s0, [x19, #0xd4]
101f305cc:     	b	0x101f305d4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xc0c>
101f305d0:     	ldr	s0, [x19, #0xd4]
101f305d4:     	str	s0, [x19, #0xd0]
101f305d8:     	stp	s8, s9, [x19, #0xe0]
101f305dc:     	mov	w8, #0x100              ; =256
101f305e0:     	strh	w8, [x19, #0xc8]
101f305e4:     	b	0x101f30a10 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1048>
101f305e8:     	ldrb	w8, [x12, #0x19d]
101f305ec:     	tbnz	w8, #0x0, 0x101f3060c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xc44>
101f305f0:     	ldr	x8, [sp, #0x8]
101f305f4:     	ldr	x8, [x8, #0xf0]
101f305f8:     	ldrb	w8, [x8, #0x2a]
101f305fc:     	tbz	w8, #0x2, 0x101f3060c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xc44>
101f30600:     	add	x8, x19, #0x2e1
101f30604:     	mov	w9, #0x101              ; =257
101f30608:     	strh	w9, [x8]
101f3060c:     	mov	x0, x20
101f30610:     	bl	0x101f0ec00 <__Z25ui_but_string_get_maxncpyP5uiBut>
101f30614:     	mov	x1, x19
101f30618:     	str	w0, [x1, #0x48]!
101f3061c:     	cbz	w0, 0x101f30668 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xca0>
101f30620:     	sxtw	x0, w0
101f30624:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101f30628:     	add	x8, x8, #0x6e0
101f3062c:     	ldr	x8, [x8]
101f30630:     	adrp	x3, 0x104d51000 <__ZL3hex+0x18534d>
101f30634:     	add	x3, x3, #0x9c6
101f30638:     	mov	w1, #0x1                ; =1
101f3063c:     	mov	w2, #0x1                ; =1
101f30640:     	blr	x8
101f30644:     	mov	x1, x0
101f30648:     	str	x1, [x19, #0x40]
101f3064c:     	ldrsw	x2, [x19, #0x48]
101f30650:     	sub	x5, x29, #0xf1
101f30654:     	mov	x0, x20
101f30658:     	mov	w3, #0x6                ; =6
101f3065c:     	mov	w4, #0x1                ; =1
101f30660:     	bl	0x101f0ed7c <__Z20ui_but_string_get_exP5uiButPcmibPb>
101f30664:     	b	0x101f3067c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xcb4>
101f30668:     	mov	w8, #0x1                ; =1
101f3066c:     	strb	w8, [x19, #0x4c]
101f30670:     	mov	x0, x20
101f30674:     	bl	0x101f0f72c <__Z25ui_but_string_get_dynamicP5uiButPi>
101f30678:     	str	x0, [x19, #0x40]
101f3067c:     	mov	x0, x20
101f30680:     	bl	0x101f0e3e0 <__Z15ui_but_is_floatPK5uiBut>
101f30684:     	cbz	w0, 0x101f306bc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xcf4>
101f30688:     	mov	x0, x20
101f3068c:     	bl	0x101f0e4b0 <__Z14ui_but_is_unitPK5uiBut>
101f30690:     	tbnz	w0, #0x0, 0x101f306bc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xcf4>
101f30694:     	mov	x0, x20
101f30698:     	mov	x1, #0x0                ; =0
101f3069c:     	mov	x2, #0x0                ; =0
101f306a0:     	bl	0x101f20ed4 <__Z26ui_but_anim_expression_getP5uiButPcm>
101f306a4:     	tbnz	w0, #0x0, 0x101f306bc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xcf4>
101f306a8:     	ldurb	w8, [x29, #-0xf1]
101f306ac:     	tbnz	w8, #0x0, 0x101f306bc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xcf4>
101f306b0:     	ldr	x0, [x19, #0x40]
101f306b4:     	mov	w1, #0x0                ; =0
101f306b8:     	bl	0x10081b290 <__Z25BLI_str_rstrip_float_zeroPcc>
101f306bc:     	cmp	w22, #0x6
101f306c0:     	b.ne	0x101f306e4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xd1c>
101f306c4:     	ldr	x1, [x19, #0x40]
101f306c8:     	ldrsw	x2, [x19, #0x48]
101f306cc:     	mov	x0, x20
101f306d0:     	bl	0x101f0ec54 <__Z31ui_but_convert_to_unit_alt_nameP5uiButPcm>
101f306d4:     	mov	x0, x20
101f306d8:     	bl	0x101f0da80 <__Z16ui_but_value_getP5uiBut>
101f306dc:     	stp	d0, d0, [x19, #0x70]
101f306e0:     	str	d0, [x19, #0x68]
101f306e4:     	mov	x23, x19
101f306e8:     	ldr	x25, [x23, #0x40]!
101f306ec:     	mov	x0, x25
101f306f0:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f306f4:     	mov	x24, x0
101f306f8:     	sxtw	x1, w0
101f306fc:     	mov	x0, x25
101f30700:     	bl	0x100819e08 <__Z11BLI_strdupnPKcm>
101f30704:     	str	x0, [x19, #0x50]
101f30708:     	str	wzr, [x19, #0x58]
101f3070c:     	ldr	x8, [x23]
101f30710:     	mov	x23, x20
101f30714:     	strh	w24, [x23, #0x2e]!
101f30718:     	add	x25, x23, #0x3ba
101f3071c:     	str	x8, [x25]
101f30720:     	ldurb	w8, [x23, #-0xe]
101f30724:     	sbfx	w8, w8, #0, #1
101f30728:     	and	w8, w8, w24
101f3072c:     	strh	w8, [x23, #0x2]
101f30730:     	strh	w24, [x23, #0x4]
101f30734:     	bl	0x101f77ef0 <__Z29ui_textedit_undo_stack_createv>
101f30738:     	str	x0, [x19, #0x60]
101f3073c:     	ldr	x1, [x25]
101f30740:     	ldrsh	w2, [x23]
101f30744:     	bl	0x101f77e38 <__Z21ui_textedit_undo_pushP16uiUndoStack_TextPKci>
101f30748:     	ldrb	w8, [x20, #0x21]
101f3074c:     	cmp	w8, #0x21
101f30750:     	b.ne	0x101f30780 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xdb8>
101f30754:     	ldr	x8, [x20, #0x428]
101f30758:     	ldr	x1, [x19, #0x18]
101f3075c:     	ldr	x0, [sp, #0x10]
101f30760:     	mov	x2, x20
101f30764:     	blr	x8
101f30768:     	mov	x1, x0
101f3076c:     	str	x1, [x19, #0xf8]
101f30770:     	ldr	x0, [sp, #0x10]
101f30774:     	mov	x2, x20
101f30778:     	mov	w3, #0x1                ; =1
101f3077c:     	bl	0x101f9ffc0 <__Z19ui_searchbox_updateP8bContextP7ARegionP5uiButb>
101f30780:     	ldr	w8, [x20, #0x18]
101f30784:     	and	w8, w8, #0xfffdffff
101f30788:     	str	w8, [x20, #0x18]
101f3078c:     	mov	x0, x20
101f30790:     	bl	0x101f0ad00 <__Z13ui_but_updateP5uiBut>
101f30794:     	ldr	x8, [x19, #0xf8]
101f30798:     	cbnz	x8, 0x101f307d0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xe08>
101f3079c:     	ldr	x0, [x20, #0x420]
101f307a0:     	bl	0x101f60e08 <__ZN7blender2ui28block_layout_needs_resolvingEPK7uiBlock>
101f307a4:     	cbz	w0, 0x101f307b4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xdec>
101f307a8:     	mov	w8, #0x1                ; =1
101f307ac:     	strb	w8, [x20, #0x1d3]
101f307b0:     	b	0x101f307d0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xe08>
101f307b4:     	ldr	x8, [x20, #0x420]
101f307b8:     	ldrb	w8, [x8, #0x349]
101f307bc:     	tbnz	w8, #0x3, 0x101f307d0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xe08>
101f307c0:     	ldr	x1, [x19, #0x18]
101f307c4:     	ldr	x0, [sp, #0x10]
101f307c8:     	mov	x2, x20
101f307cc:     	bl	0x101f79a14 <__Z21UI_but_ensure_in_viewPK8bContextP7ARegionPK5uiBut>
101f307d0:     	ldr	x0, [sp, #0x10]
101f307d4:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
101f307d8:     	mov	x24, x0
101f307dc:     	ldr	x2, [x20, #0x420]
101f307e0:     	add	x0, sp, #0x60
101f307e4:     	mov	x1, x24
101f307e8:     	mov	x3, x20
101f307ec:     	bl	0x101f0cee8 <__Z19ui_but_to_pixelrectP4rctiPK7ARegionPK7uiBlockPK5uiBut>
101f307f0:     	ldr	w27, [x24, #0xa8]
101f307f4:     	ldr	w28, [x24, #0xb0]
101f307f8:     	ldp	w24, w26, [sp, #0x60]
101f307fc:     	ldp	w23, w25, [sp, #0x68]
101f30800:     	bl	0x101f776e8 <__Z12UI_style_getv>
101f30804:     	cmp	w22, #0x6
101f30808:     	cset	w8, eq
101f3080c:     	add	w9, w25, w28
101f30810:     	add	w10, w27, w24
101f30814:     	ldr	s0, [x0, #0x94]
101f30818:     	stur	s0, [x29, #-0xc8]
101f3081c:     	fmov.4s	v0, #1.00000000
101f30820:     	stur	q0, [x29, #-0xc4]
101f30824:     	adrp	x11, 0x104f09000 <__ZTSN7blender17VMutableArrayImplINS_18ColorSceneLinear4fILNS_6eAlphaE1EEEEE+0x18>
101f30828:     	ldr	d0, [x11, #0xd28]
101f3082c:     	stur	d0, [x29, #-0xd8]
101f30830:     	scvtf	s0, w10
101f30834:     	stp	wzr, w8, [x29, #-0xd0]
101f30838:     	scvtf	s1, w9
101f3083c:     	stp	s0, s1, [x29, #-0xb4]
101f30840:     	sub	w8, w26, w24
101f30844:     	scvtf	s0, w8
101f30848:     	sub	w8, w25, w23
101f3084c:     	scvtf	s1, w8
101f30850:     	stp	s0, s1, [x29, #-0xac]
101f30854:     	ldr	x8, [x20, #0x170]
101f30858:     	ldr	x9, [x19, #0x40]
101f3085c:     	stp	x8, x9, [x29, #-0xa0]
101f30860:     	ldr	x8, [sp, #0x8]
101f30864:     	ldr	x0, [x8, #0x10]
101f30868:     	sub	x1, x29, #0xd8
101f3086c:     	bl	0x1010946c0 <_GHOST_popupOnScreenKeyboard>
101f30870:     	ldr	x0, [sp, #0x8]
101f30874:     	mov	w1, #0x2                ; =2
101f30878:     	bl	0x100b44568 <__Z19WM_cursor_modal_setP8wmWindowi>
101f3087c:     	mov	w0, #0x0                ; =0
101f30880:     	bl	0x101094f78 <_GHOST_SetAutoFocus>
101f30884:     	cmp	w22, #0x6
101f30888:     	b.eq	0x101f308ac <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xee4>
101f3088c:     	ldr	x0, [sp, #0x8]
101f30890:     	ldr	x8, [x0, #0xf0]
101f30894:     	ldp	w1, w8, [x8, #0x14]
101f30898:     	sub	w2, w8, #0xc
101f3089c:     	mov	w3, #0x0                ; =0
101f308a0:     	mov	w4, #0x0                ; =0
101f308a4:     	mov	w5, #0x1                ; =1
101f308a8:     	bl	0x100b97c98 <__Z19wm_window_IME_beginP8wmWindowiiiib>
101f308ac:     	mov	w27, #0x1               ; =1
101f308b0:     	cmp	w21, #0x5
101f308b4:     	b.eq	0x101f2fbac <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1e4>
101f308b8:     	ldr	w8, [x19, #0x24]
101f308bc:     	cmp	w8, #0x5
101f308c0:     	b.ne	0x101f309a0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xfd8>
101f308c4:     	movi.16b	v0, #0x0
101f308c8:     	str	q0, [x20, #0x3f0]
101f308cc:     	ldrb	w8, [x20, #0x21]
101f308d0:     	cmp	w8, #0x1c
101f308d4:     	b.hi	0x101f308f0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xf28>
101f308d8:     	mov	w9, #0x1                ; =1
101f308dc:     	lsl	w8, w9, w8
101f308e0:     	mov	w9, #0x1a000000         ; =436207616
101f308e4:     	tst	w8, w9
101f308e8:     	b.eq	0x101f308f0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xf28>
101f308ec:     	str	xzr, [x20, #0x428]
101f308f0:     	str	wzr, [x19, #0xc0]
101f308f4:     	str	wzr, [x19, #0xb8]
101f308f8:     	strb	wzr, [x19, #0xc8]
101f308fc:     	str	xzr, [x19, #0xd8]
101f30900:     	str	wzr, [x19, #0xcc]
101f30904:     	cmp	w21, #0x6
101f30908:     	b.eq	0x101f30930 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xf68>
101f3090c:     	ldr	x0, [sp, #0x10]
101f30910:     	mov	x1, #0x0                ; =0
101f30914:     	bl	0x1016204dc <__Z24ED_workspace_status_textP8bContextPKc>
101f30918:     	ldrb	w8, [x20, #0x1a]
101f3091c:     	tbz	w8, #0x0, 0x101f30930 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xf68>
101f30920:     	adrp	x1, 0x104d51000 <__ZL3hex+0x18534d>
101f30924:     	add	x1, x1, #0x96c
101f30928:     	mov	w0, #0x2                ; =2
101f3092c:     	bl	0x100b4e5ec <__Z16WM_global_report11eReportTypePKc>
101f30930:     	mov	x0, x20
101f30934:     	bl	0x101f73504 <__Z21ui_but_is_cursor_warpPK5uiBut>
101f30938:     	cbz	w0, 0x101f309a0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xfd8>
101f3093c:     	mov	x23, x19
101f30940:     	ldr	s0, [x23, #0xe8]!
101f30944:     	mov	w8, #0x7f7fffff         ; =2139095039
101f30948:     	fmov	s1, w8
101f3094c:     	fcmp	s0, s1
101f30950:     	b.eq	0x101f30964 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xf9c>
101f30954:     	ldr	x0, [x19, #0x8]
101f30958:     	mov	w1, #0x0                ; =0
101f3095c:     	bl	0x100b8e7c8 <__Z19WM_stereo3d_enabledP8wmWindowb>
101f30960:     	tbz	w0, #0x0, 0x101f30974 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xfac>
101f30964:     	ldr	x0, [x19, #0x8]
101f30968:     	mov	x1, #0x0                ; =0
101f3096c:     	bl	0x100b44778 <__Z22WM_cursor_grab_disableP8wmWindowPKi>
101f30970:     	b	0x101f309a0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xfd8>
101f30974:     	ldr	x0, [x19, #0x18]
101f30978:     	ldr	x1, [x20, #0x420]
101f3097c:     	add	x3, x19, #0xec
101f30980:     	mov	x2, x23
101f30984:     	bl	0x101f096c0 <__Z21ui_block_to_window_flPK7ARegionPK7uiBlockPfS5_>
101f30988:     	ldr	d0, [x19, #0xe8]
101f3098c:     	fcvtzs.2s	v0, v0
101f30990:     	stur	d0, [x29, #-0xd8]
101f30994:     	ldr	x0, [x19, #0x8]
101f30998:     	sub	x1, x29, #0xd8
101f3099c:     	bl	0x100b44778 <__Z22WM_cursor_grab_disableP8wmWindowPKi>
101f309a0:     	cmp	w21, #0x8
101f309a4:     	b.ne	0x101f30a10 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1048>
101f309a8:     	ldrb	w8, [x20, #0x21]
101f309ac:     	cmp	w8, #0x17
101f309b0:     	b.ne	0x101f30a74 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x10ac>
101f309b4:     	ldr	x3, [x20, #0x1e8]
101f309b8:     	cbz	x3, 0x101f30ad8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1110>
101f309bc:     	ldr	x4, [x20, #0x80]
101f309c0:     	ldr	x1, [x19, #0x18]
101f309c4:     	ldr	x0, [sp, #0x10]
101f309c8:     	mov	x2, x20
101f309cc:     	bl	0x101f99980 <__Z20ui_popup_menu_createP8bContextP7ARegionP5uiButPFvS0_P8uiLayoutPvES7_>
101f309d0:     	str	x0, [x19, #0xf0]
101f309d4:     	mov	x0, x20
101f309d8:     	bl	0x101f61258 <__Z19UI_but_menutype_getPK5uiBut>
101f309dc:     	mov	x8, x0
101f309e0:     	cbz	x0, 0x101f309f8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1030>
101f309e4:     	ldr	x9, [x19, #0xf0]
101f309e8:     	add	x0, x9, #0x2e8
101f309ec:     	add	x1, x8, #0x10
101f309f0:     	mov	w2, #0x40               ; =64
101f309f4:     	bl	0x100822dc8 <__Z16BLI_strncpy_utf8PcPKcm>
101f309f8:     	ldr	x8, [x20, #0x420]
101f309fc:     	ldr	x8, [x8, #0x3a8]
101f30a00:     	cbz	x8, 0x101f30c48 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1280>
101f30a04:     	add	x8, x8, #0x1f9
101f30a08:     	ldr	x0, [x19, #0xf0]
101f30a0c:     	b	0x101f30c40 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1278>
101f30a10:     	ldr	w8, [x19, #0x24]
101f30a14:     	cmp	w8, #0x8
101f30a18:     	b.ne	0x101f30a50 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1088>
101f30a1c:     	movi.16b	v0, #0x0
101f30a20:     	str	q0, [x20, #0x3f0]
101f30a24:     	bl	0x10082df80 <__Z20BLI_time_now_secondsv>
101f30a28:     	ldr	x8, [x20, #0x420]
101f30a2c:     	str	d0, [x8, #0x360]
101f30a30:     	ldr	x0, [sp, #0x10]
101f30a34:     	mov	x1, #0x0                ; =0
101f30a38:     	bl	0x1016204dc <__Z24ED_workspace_status_textP8bContextPKc>
101f30a3c:     	ldr	x1, [x19, #0xf0]
101f30a40:     	cbz	x1, 0x101f30a50 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1088>
101f30a44:     	ldr	x0, [sp, #0x10]
101f30a48:     	bl	0x101f9e728 <__Z19ui_popup_block_freeP8bContextP18uiPopupBlockHandle>
101f30a4c:     	str	xzr, [x19, #0xf0]
101f30a50:     	cmp	w21, #0x2
101f30a54:     	b.ne	0x101f30c74 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x12ac>
101f30a58:     	ldp	x0, x1, [x19]
101f30a5c:     	adrp	x8, 0x1051f2000 <__ZL7indices+0x9c>
101f30a60:     	ldr	d0, [x8, #0x918]
101f30a64:     	mov	w2, #0x110              ; =272
101f30a68:     	bl	0x100b9613c <__Z18WM_event_timer_addP15wmWindowManagerP8wmWindow11wmEventTyped>
101f30a6c:     	str	x0, [x19, #0x38]
101f30a70:     	b	0x101f30cb4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x12ec>
101f30a74:     	sub	x0, x29, #0xd8
101f30a78:     	ldr	x1, [sp, #0x10]
101f30a7c:     	bl	0x10161f9ac <__ZN15WorkspaceStatusC1EP8bContext>
101f30a80:     	mov	w8, #0x1                ; =1
101f30a84:     	sturb	w8, [x29, #-0xd9]
101f30a88:     	mov	w8, #0x20               ; =32
101f30a8c:     	sturh	w8, [x29, #-0xf0]
101f30a90:     	sub	x1, x29, #0xf0
101f30a94:     	mov	w2, #0x0                ; =0
101f30a98:     	mov	w3, #0x0                ; =0
101f30a9c:     	bl	0x10161f9b0 <__ZN15WorkspaceStatus4itemENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEii>
101f30aa0:     	ldursb	w8, [x29, #-0xd9]
101f30aa4:     	tbz	w8, #0x1f, 0x101f30ab0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x10e8>
101f30aa8:     	ldur	x0, [x29, #-0xf0]
101f30aac:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f30ab0:     	ldrb	w8, [x20, #0x21]
101f30ab4:     	cmp	w8, #0x10
101f30ab8:     	b.le	0x101f30af4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x112c>
101f30abc:     	cmp	w8, #0x11
101f30ac0:     	b.eq	0x101f30b4c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1184>
101f30ac4:     	cmp	w8, #0x17
101f30ac8:     	b.eq	0x101f309b4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xfec>
101f30acc:     	cmp	w8, #0x13
101f30ad0:     	b.eq	0x101f309b4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xfec>
101f30ad4:     	b	0x101f30c48 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1280>
101f30ad8:     	ldr	x3, [x20, #0x1e0]
101f30adc:     	ldr	x5, [x20, #0x80]
101f30ae0:     	cbnz	x5, 0x101f30ae8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1120>
101f30ae4:     	ldr	x5, [x20, #0xe0]
101f30ae8:     	cbz	x3, 0x101f30c48 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1280>
101f30aec:     	mov	x4, #0x0                ; =0
101f30af0:     	b	0x101f30c14 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x124c>
101f30af4:     	cmp	w8, #0x4
101f30af8:     	b.eq	0x101f30b54 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x118c>
101f30afc:     	cmp	w8, #0xf
101f30b00:     	b.ne	0x101f30c48 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1280>
101f30b04:     	add	x1, x19, #0x8c
101f30b08:     	mov	x0, x20
101f30b0c:     	bl	0x101f0dcdc <__Z13ui_but_v3_getP5uiButPf>
101f30b10:     	ldur	d0, [x19, #0x8c]
101f30b14:     	mov	x8, x19
101f30b18:     	str	d0, [x8, #0x80]!
101f30b1c:     	ldr	s0, [x8, #0x14]
101f30b20:     	str	s0, [x8, #0x8]
101f30b24:     	str	x8, [x20, #0x3f8]
101f30b28:     	mov	x0, x20
101f30b2c:     	bl	0x101f13d04 <__Z27ui_but_menu_draw_as_popoverPK5uiBut>
101f30b30:     	cbz	w0, 0x101f30c04 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x123c>
101f30b34:     	ldr	x23, [x20, #0xe0]
101f30b38:     	cbz	x23, 0x101f30b9c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x11d4>
101f30b3c:     	mov	x0, x23
101f30b40:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f30b44:     	mov	x1, x0
101f30b48:     	b	0x101f30ba0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x11d8>
101f30b4c:     	ldr	x4, [x20, #0x80]
101f30b50:     	b	0x101f30bb4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x11ec>
101f30b54:     	mov	x0, x20
101f30b58:     	bl	0x101f13d04 <__Z27ui_but_menu_draw_as_popoverPK5uiBut>
101f30b5c:     	cbz	w0, 0x101f30b90 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x11c8>
101f30b60:     	ldr	x23, [x20, #0xe0]
101f30b64:     	cbz	x23, 0x101f30b78 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x11b0>
101f30b68:     	mov	x0, x23
101f30b6c:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f30b70:     	mov	x1, x0
101f30b74:     	b	0x101f30b7c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x11b4>
101f30b78:     	mov	x1, #0x0                ; =0
101f30b7c:     	mov	x0, x23
101f30b80:     	mov	w2, #0x0                ; =0
101f30b84:     	bl	0x100b89ac0 <__Z17WM_paneltype_findN7blender9StringRefEb>
101f30b88:     	mov	x4, x0
101f30b8c:     	cbnz	x0, 0x101f30bb4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x11ec>
101f30b90:     	ldr	x3, [x20, #0x1e8]
101f30b94:     	cbnz	x3, 0x101f309bc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xff4>
101f30b98:     	b	0x101f30c48 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1280>
101f30b9c:     	mov	x1, #0x0                ; =0
101f30ba0:     	mov	x0, x23
101f30ba4:     	mov	w2, #0x0                ; =0
101f30ba8:     	bl	0x100b89ac0 <__Z17WM_paneltype_findN7blender9StringRefEb>
101f30bac:     	mov	x4, x0
101f30bb0:     	cbz	x0, 0x101f30c04 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x123c>
101f30bb4:     	ldr	x8, [x20, #0x1e8]
101f30bb8:     	cbz	x8, 0x101f30c48 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1280>
101f30bbc:     	adrp	x9, 0x10648c000 <_rna_enum_transform_mode_type_items+0x4a0>
101f30bc0:     	add	x9, x9, #0xfa8
101f30bc4:     	ldr	x1, [x19, #0x18]
101f30bc8:     	add	x9, x9, #0x10
101f30bcc:     	stp	x9, x8, [x29, #-0xd8]
101f30bd0:     	sub	x23, x29, #0xd8
101f30bd4:     	stur	x23, [x29, #-0xc0]
101f30bd8:     	sub	x3, x29, #0xd8
101f30bdc:     	ldr	x0, [sp, #0x10]
101f30be0:     	mov	x2, x20
101f30be4:     	bl	0x101f9bae4 <__Z23ui_popover_panel_createP8bContextP7ARegionP5uiButNSt3__18functionIFvS0_P8uiLayoutP9PanelTypeEEEPKS9_>
101f30be8:     	str	x0, [x19, #0xf0]
101f30bec:     	ldur	x0, [x29, #-0xc0]
101f30bf0:     	cmp	x0, x23
101f30bf4:     	b.eq	0x101f30e30 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1468>
101f30bf8:     	cbz	x0, 0x101f309f8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1030>
101f30bfc:     	mov	w8, #0x28               ; =40
101f30c00:     	b	0x101f30e34 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x146c>
101f30c04:     	mov	x3, #0x0                ; =0
101f30c08:     	adrp	x4, 0x101f89000 <__Z35ui_scene_linear_to_perceptual_spaceP5uiButPf+0x24>
101f30c0c:     	add	x4, x4, #0x230
101f30c10:     	mov	x5, x20
101f30c14:     	ldr	x1, [x19, #0x18]
101f30c18:     	ldr	x0, [sp, #0x10]
101f30c1c:     	mov	x2, x20
101f30c20:     	mov	x6, #0x0                ; =0
101f30c24:     	mov	w7, #0x0                ; =0
101f30c28:     	bl	0x101f9e158 <__Z21ui_popup_block_createP8bContextP7ARegionP5uiButPFP7uiBlockS0_S2_PvEPFS6_S0_P18uiPopupBlockHandleS7_ES7_PFvS7_Eb>
101f30c2c:     	str	x0, [x19, #0xf0]
101f30c30:     	ldr	x8, [x20, #0x420]
101f30c34:     	ldr	x8, [x8, #0x3a8]
101f30c38:     	cbz	x8, 0x101f30c48 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1280>
101f30c3c:     	add	x8, x8, #0x1f9
101f30c40:     	ldrb	w8, [x8]
101f30c44:     	strb	w8, [x0, #0x1f9]
101f30c48:     	ldr	x0, [x19, #0x8]
101f30c4c:     	ldr	x8, [x0, #0xf0]
101f30c50:     	ldrb	w8, [x8, #0x2a]
101f30c54:     	tbz	w8, #0x2, 0x101f30c60 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1298>
101f30c58:     	mov	w8, #0x1                ; =1
101f30c5c:     	strb	w8, [x19, #0x2e1]
101f30c60:     	bl	0x100b596a8 <__Z22WM_event_add_mousemoveP8wmWindow>
101f30c64:     	ldr	x8, [x19, #0xf0]
101f30c68:     	cbz	x8, 0x101f30c74 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x12ac>
101f30c6c:     	ldr	x0, [x20, #0x420]
101f30c70:     	bl	0x101f92af4 <__Z28ui_ipad_ring_capture_suspendPK7uiBlock>
101f30c74:     	ldr	x2, [x19, #0x38]
101f30c78:     	cbz	x2, 0x101f30c88 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x12c0>
101f30c7c:     	ldp	x0, x1, [x19]
101f30c80:     	bl	0x100b93b90 <__Z21WM_event_timer_removeP15wmWindowManagerP8wmWindowP7wmTimer>
101f30c84:     	str	xzr, [x19, #0x38]
101f30c88:     	cmp	w21, #0x3
101f30c8c:     	b.ne	0x101f30cb4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x12ec>
101f30c90:     	ldr	x8, [x20, #0x160]
101f30c94:     	cbz	x8, 0x101f30cb4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x12ec>
101f30c98:     	ldp	x0, x1, [x19]
101f30c9c:     	adrp	x8, 0x104f7f000 <__ZL9monkeyuvs+0x3730>
101f30ca0:     	ldr	d0, [x8, #0x678]
101f30ca4:     	mov	w2, #0x110              ; =272
101f30ca8:     	bl	0x100b9613c <__Z18WM_event_timer_addP15wmWindowManagerP8wmWindow11wmEventTyped>
101f30cac:     	str	x0, [x19, #0xb0]
101f30cb0:     	b	0x101f30cc8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1300>
101f30cb4:     	ldr	x2, [x19, #0xb0]
101f30cb8:     	cbz	x2, 0x101f30cc8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1300>
101f30cbc:     	ldp	x0, x1, [x19]
101f30cc0:     	bl	0x100b93b90 <__Z21WM_event_timer_removeP15wmWindowManagerP8wmWindowP7wmTimer>
101f30cc4:     	str	xzr, [x19, #0xb0]
101f30cc8:     	ldr	x8, [x20, #0x420]
101f30ccc:     	ldr	x8, [x8, #0x3a8]
101f30cd0:     	cbz	x8, 0x101f30cdc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1314>
101f30cd4:     	ldrb	w8, [x8, #0x1f9]
101f30cd8:     	tbnz	w8, #0x0, 0x101f30d48 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1380>
101f30cdc:     	sub	w9, w21, #0x3
101f30ce0:     	ldr	w8, [x19, #0x24]
101f30ce4:     	sub	w8, w8, #0x3
101f30ce8:     	cmp	w9, #0x5
101f30cec:     	b.hi	0x101f30d20 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1358>
101f30cf0:     	cmp	w8, #0x6
101f30cf4:     	b.lo	0x101f30d6c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x13a4>
101f30cf8:     	ldr	x8, [x19, #0x8]
101f30cfc:     	adrp	x2, 0x101f34000 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x208>
101f30d00:     	add	x2, x2, #0x5a4
101f30d04:     	add	x1, x8, #0x118
101f30d08:     	ldr	x0, [sp, #0x10]
101f30d0c:     	mov	x3, #0x0                ; =0
101f30d10:     	mov	x4, x19
101f30d14:     	mov	w5, #0x0                ; =0
101f30d18:     	bl	0x100b4f770 <__Z23WM_event_add_ui_handlerPK8bContextP8ListBasePFiPS_PK7wmEventPvEPFvS4_S8_ES8_20eWM_EventHandlerFlag>
101f30d1c:     	b	0x101f30d6c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x13a4>
101f30d20:     	cmp	w8, #0x5
101f30d24:     	b.hi	0x101f30d48 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1380>
101f30d28:     	ldr	x8, [x19, #0x8]
101f30d2c:     	adrp	x1, 0x101f34000 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x208>
101f30d30:     	add	x1, x1, #0x5a4
101f30d34:     	add	x0, x8, #0x118
101f30d38:     	mov	x2, #0x0                ; =0
101f30d3c:     	mov	x3, x19
101f30d40:     	mov	w4, #0x1                ; =1
101f30d44:     	bl	0x100b59408 <__Z26WM_event_remove_ui_handlerP8ListBasePFiP8bContextPK7wmEventPvEPFvS2_S6_ES6_b>
101f30d48:     	cmp	w21, #0x9
101f30d4c:     	b.ne	0x101f30d6c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x13a4>
101f30d50:     	ldr	w8, [x20, #0x18]
101f30d54:     	and	w8, w8, #0xfffffffe
101f30d58:     	str	w8, [x20, #0x18]
101f30d5c:     	tbnz	w27, #0x0, 0x101f30d70 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x13a8>
101f30d60:     	mov	w8, #0x9                ; =9
101f30d64:     	str	w8, [x19, #0x24]
101f30d68:     	b	0x101f30ddc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1414>
101f30d6c:     	tbz	w27, #0x0, 0x101f30d88 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x13c0>
101f30d70:     	ldr	x1, [x20, #0x420]
101f30d74:     	ldr	x0, [sp, #0x10]
101f30d78:     	mov	x2, x19
101f30d7c:     	mov	w3, #0x1                ; =1
101f30d80:     	bl	0x101f387e0 <__ZL33ui_block_interaction_begin_ensureP8bContextP7uiBlockP18uiHandleButtonDatab>
101f30d84:     	b	0x101f30dbc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x13f4>
101f30d88:     	cmp	w21, #0xa
101f30d8c:     	b.ne	0x101f30dbc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x13f4>
101f30d90:     	ldr	w8, [x19, #0x24]
101f30d94:     	cmp	w8, #0x5
101f30d98:     	b.ne	0x101f30db0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x13e8>
101f30d9c:     	ldr	x1, [x20, #0x420]
101f30da0:     	ldr	x0, [sp, #0x10]
101f30da4:     	mov	x2, x19
101f30da8:     	mov	w3, #0x1                ; =1
101f30dac:     	bl	0x101f387e0 <__ZL33ui_block_interaction_begin_ensureP8bContextP7uiBlockP18uiHandleButtonDatab>
101f30db0:     	mov	w8, #0xa                ; =10
101f30db4:     	str	w8, [x19, #0x24]
101f30db8:     	b	0x101f30de4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x141c>
101f30dbc:     	str	w21, [x19, #0x24]
101f30dc0:     	cmp	w21, #0xa
101f30dc4:     	b.eq	0x101f30de4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x141c>
101f30dc8:     	cmp	w21, #0x1
101f30dcc:     	b.ne	0x101f30ddc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1414>
101f30dd0:     	ldr	x8, [x20, #0x420]
101f30dd4:     	ldrb	w8, [x8, #0x348]
101f30dd8:     	tbz	w8, #0x0, 0x101f30de4 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x141c>
101f30ddc:     	mov	x0, x20
101f30de0:     	bl	0x101f0ad00 <__Z13ui_but_updateP5uiBut>
101f30de4:     	ldr	x0, [x19, #0x18]
101f30de8:     	bl	0x10161f34c <__Z31ED_region_tag_redraw_no_rebuildP7ARegion>
101f30dec:     	ldur	x8, [x29, #-0x90]
101f30df0:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
101f30df4:     	ldr	x9, [x9, #0x7f0]
101f30df8:     	ldr	x9, [x9]
101f30dfc:     	cmp	x9, x8
101f30e00:     	b.ne	0x101f30e7c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x14b4>
101f30e04:     	add	sp, sp, #0x170
101f30e08:     	ldp	x29, x30, [sp, #0x80]
101f30e0c:     	ldp	x20, x19, [sp, #0x70]
101f30e10:     	ldp	x22, x21, [sp, #0x60]
101f30e14:     	ldp	x24, x23, [sp, #0x50]
101f30e18:     	ldp	x26, x25, [sp, #0x40]
101f30e1c:     	ldp	x28, x27, [sp, #0x30]
101f30e20:     	ldp	d9, d8, [sp, #0x20]
101f30e24:     	ldp	d11, d10, [sp, #0x10]
101f30e28:     	ldp	d13, d12, [sp], #0x90
101f30e2c:     	ret
101f30e30:     	mov	w8, #0x20               ; =32
101f30e34:     	ldr	x9, [x0]
101f30e38:     	ldr	x8, [x9, x8]
101f30e3c:     	blr	x8
101f30e40:     	b	0x101f309f8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1030>
101f30e44:     	fcmp	d0, #0.0
101f30e48:     	b.le	0x101f30e64 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x149c>
101f30e4c:     	mov	w8, #-0x800001          ; =-8388609
101f30e50:     	fmov	s1, w8
101f30e54:     	fmov	s0, s8
101f30e58:     	bl	0x104b7244c <_zlibVersion+0x104b7244c>
101f30e5c:     	fmov	s8, s0
101f30e60:     	b	0x101f30530 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xb68>
101f30e64:     	mov	w8, #0x7f7fffff         ; =2139095039
101f30e68:     	fmov	s1, w8
101f30e6c:     	fmov	s0, s9
101f30e70:     	bl	0x104b7244c <_zlibVersion+0x104b7244c>
101f30e74:     	fmov	s9, s0
101f30e78:     	b	0x101f30530 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0xb68>
101f30e7c:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
101f30e80:     	add	x0, sp, #0x48
101f30e84:     	bl	0x100023e44 <__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne190102Ev>
101f30e88:     	b	0x101f30ee8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1520>
101f30e8c:     	add	x0, sp, #0x30
101f30e90:     	bl	0x100023e44 <__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne190102Ev>
101f30e94:     	b	0x101f30ee8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1520>
101f30e98:     	add	x0, sp, #0x18
101f30e9c:     	bl	0x100023e44 <__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne190102Ev>
101f30ea0:     	b	0x101f30ee8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1520>
101f30ea4:     	sub	x0, x29, #0xf0
101f30ea8:     	bl	0x100023e44 <__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne190102Ev>
101f30eac:     	b	0x101f30ee8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1520>
101f30eb0:     	add	x0, sp, #0xd0
101f30eb4:     	bl	0x100023e44 <__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne190102Ev>
101f30eb8:     	b	0x101f30ee8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1520>
101f30ebc:     	add	x0, sp, #0x70
101f30ec0:     	bl	0x100023e44 <__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne190102Ev>
101f30ec4:     	b	0x101f30ee8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1520>
101f30ec8:     	add	x0, sp, #0xb8
101f30ecc:     	bl	0x100023e44 <__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne190102Ev>
101f30ed0:     	b	0x101f30ee8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1520>
101f30ed4:     	add	x0, sp, #0xa0
101f30ed8:     	bl	0x100023e44 <__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne190102Ev>
101f30edc:     	b	0x101f30ee8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1520>
101f30ee0:     	add	x0, sp, #0x88
101f30ee4:     	bl	0x100023e44 <__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne190102Ev>
101f30ee8:     	brk	#0x1
101f30eec:     	mov	x19, x0
101f30ef0:     	ldur	x0, [x29, #-0xc0]
101f30ef4:     	cmp	x0, x23
101f30ef8:     	b.ne	0x101f30f04 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x153c>
101f30efc:     	mov	w8, #0x20               ; =32
101f30f00:     	b	0x101f30f0c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1544>
101f30f04:     	cbz	x0, 0x101f30ff0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1628>
101f30f08:     	mov	w8, #0x28               ; =40
101f30f0c:     	ldr	x9, [x0]
101f30f10:     	ldr	x8, [x9, x8]
101f30f14:     	blr	x8
101f30f18:     	mov	x0, x19
101f30f1c:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
101f30f20:     	mov	x19, x0
101f30f24:     	ldrsb	w8, [sp, #0x9f]
101f30f28:     	tbz	w8, #0x1f, 0x101f30ff0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1628>
101f30f2c:     	ldr	x0, [sp, #0x88]
101f30f30:     	b	0x101f30fdc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1614>
101f30f34:     	mov	x19, x0
101f30f38:     	ldrsb	w8, [sp, #0xb7]
101f30f3c:     	tbz	w8, #0x1f, 0x101f30ff0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1628>
101f30f40:     	ldr	x0, [sp, #0xa0]
101f30f44:     	b	0x101f30fdc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1614>
101f30f48:     	mov	x19, x0
101f30f4c:     	ldrsb	w8, [sp, #0xcf]
101f30f50:     	tbz	w8, #0x1f, 0x101f30ff0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1628>
101f30f54:     	ldr	x0, [sp, #0xb8]
101f30f58:     	b	0x101f30fdc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1614>
101f30f5c:     	mov	x19, x0
101f30f60:     	ldrsb	w8, [sp, #0x87]
101f30f64:     	tbz	w8, #0x1f, 0x101f30ff0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1628>
101f30f68:     	ldr	x0, [sp, #0x70]
101f30f6c:     	b	0x101f30fdc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1614>
101f30f70:     	b	0x101f30fec <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1624>
101f30f74:     	mov	x19, x0
101f30f78:     	ldrsb	w8, [sp, #0xe7]
101f30f7c:     	tbz	w8, #0x1f, 0x101f30ff0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1628>
101f30f80:     	ldr	x0, [sp, #0xd0]
101f30f84:     	b	0x101f30fdc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1614>
101f30f88:     	b	0x101f30f8c <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x15c4>
101f30f8c:     	mov	x19, x0
101f30f90:     	ldursb	w8, [x29, #-0xd9]
101f30f94:     	tbz	w8, #0x1f, 0x101f30ff0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1628>
101f30f98:     	ldur	x0, [x29, #-0xf0]
101f30f9c:     	b	0x101f30fdc <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1614>
101f30fa0:     	mov	x19, x0
101f30fa4:     	ldrsb	w8, [sp, #0x2f]
101f30fa8:     	tbz	w8, #0x1f, 0x101f30ff0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1628>
101f30fac:     	add	x8, sp, #0x18
101f30fb0:     	b	0x101f30fd8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1610>
101f30fb4:     	mov	x19, x0
101f30fb8:     	ldrsb	w8, [sp, #0x47]
101f30fbc:     	tbz	w8, #0x1f, 0x101f30ff0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1628>
101f30fc0:     	add	x8, sp, #0x30
101f30fc4:     	b	0x101f30fd8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1610>
101f30fc8:     	mov	x19, x0
101f30fcc:     	ldrsb	w8, [sp, #0x5f]
101f30fd0:     	tbz	w8, #0x1f, 0x101f30ff0 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1628>
101f30fd4:     	add	x8, sp, #0x48
101f30fd8:     	ldr	x0, [x8]
101f30fdc:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f30fe0:     	mov	x0, x19
101f30fe4:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
101f30fe8:     	b	0x101f30fec <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState+0x1624>
101f30fec:     	mov	x19, x0
101f30ff0:     	mov	x0, x19
101f30ff4:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
