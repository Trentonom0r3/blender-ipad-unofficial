
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b5194c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb>:
100b5194c:     	sub	sp, sp, #0x120
100b51950:     	stp	x28, x27, [sp, #0xc0]
100b51954:     	stp	x26, x25, [sp, #0xd0]
100b51958:     	stp	x24, x23, [sp, #0xe0]
100b5195c:     	stp	x22, x21, [sp, #0xf0]
100b51960:     	stp	x20, x19, [sp, #0x100]
100b51964:     	stp	x29, x30, [sp, #0x110]
100b51968:     	add	x29, sp, #0x110
100b5196c:     	mov	x27, x6
100b51970:     	mov	x24, x4
100b51974:     	mov	x20, x3
100b51978:     	mov	x21, x2
100b5197c:     	mov	x28, x1
100b51980:     	mov	x19, x0
100b51984:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
100b51988:     	ldr	x8, [x8, #0x7f0]
100b5198c:     	ldr	x8, [x8]
100b51990:     	stur	x8, [x29, #-0x60]
100b51994:     	stp	xzr, xzr, [sp, #0x38]
100b51998:     	cbz	x3, 0x100b519f4 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0xa8>
100b5199c:     	ldrh	w8, [x20, #0x10]
100b519a0:     	cmp	w8, #0x208
100b519a4:     	b.ne	0x100b519f4 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0xa8>
100b519a8:     	mov	x23, x5
100b519ac:     	str	xzr, [sp, #0x50]
100b519b0:     	mov	x0, x19
100b519b4:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b519b8:     	mov	x1, x0
100b519bc:     	add	x3, sp, #0x50
100b519c0:     	add	x4, sp, #0x40
100b519c4:     	add	x5, sp, #0x38
100b519c8:     	mov	x0, x19
100b519cc:     	mov	x2, x20
100b519d0:     	bl	0x100b56630 <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion>
100b519d4:     	ldr	x8, [sp, #0x50]
100b519d8:     	cmp	x8, x21
100b519dc:     	csel	w8, wzr, w0, ne
100b519e0:     	cmp	w8, #0x1
100b519e4:     	b.ne	0x100b51b40 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x1f4>
100b519e8:     	mov	w25, #0x1               ; =1
100b519ec:     	mov	x5, x23
100b519f0:     	b	0x100b519f8 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0xac>
100b519f4:     	mov	w25, #0x0               ; =0
100b519f8:     	ldr	w8, [x21, #0x10]
100b519fc:     	cmp	w8, #0x3
100b51a00:     	b.ne	0x100b51a34 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0xe8>
100b51a04:     	ldr	x23, [x21, #0x20]
100b51a08:     	cbz	x23, 0x100b51a34 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0xe8>
100b51a0c:     	ldr	x24, [x23, #0x58]
100b51a10:     	mov	w26, #0x0               ; =0
100b51a14:     	cbz	w27, 0x100b51b90 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x244>
100b51a18:     	cbz	x20, 0x100b51b90 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x244>
100b51a1c:     	ldr	x8, [x21, #0x50]
100b51a20:     	cbz	x8, 0x100b51b90 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x244>
100b51a24:     	ldrh	w8, [x20, #0x10]
100b51a28:     	cbz	w8, 0x100b51b68 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x21c>
100b51a2c:     	mov	w26, #0x0               ; =0
100b51a30:     	b	0x100b51b90 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x244>
100b51a34:     	mov	x0, x5
100b51a38:     	mov	w1, #0x0                ; =0
100b51a3c:     	bl	0x100b7bc38 <__Z20WM_operatortype_findPKcb>
100b51a40:     	cbz	x0, 0x100b51c7c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x330>
100b51a44:     	mov	x22, x0
100b51a48:     	mov	x0, x19
100b51a4c:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b51a50:     	ldr	x8, [x0, #0x5c0]
100b51a54:     	ldrb	w8, [x8, #0x10]
100b51a58:     	cmp	w8, #0x1
100b51a5c:     	b.ne	0x100b51a68 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x11c>
100b51a60:     	ldrh	w8, [x22, #0xe4]
100b51a64:     	tbz	w8, #0x9, 0x100b51c7c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x330>
100b51a68:     	ldr	w8, [x20, #0x30]
100b51a6c:     	cmp	w8, #0x1
100b51a70:     	b.ne	0x100b51af8 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x1ac>
100b51a74:     	ldr	x0, [x22, #0x8]
100b51a78:     	adrp	x1, 0x104bd0000 <__ZL3hex+0x434d>
100b51a7c:     	add	x1, x1, #0xf92
100b51a80:     	bl	0x10081a99c <__Z14BLI_strcasestrPKcS0_>
100b51a84:     	cbz	x0, 0x100b51af8 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x1ac>
100b51a88:     	mov	x0, x19
100b51a8c:     	bl	0x100b8f7f8 <__Z30WM_toolsystem_ref_from_contextPK8bContext>
100b51a90:     	cbz	x0, 0x100b51af8 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x1ac>
100b51a94:     	mov	x23, x0
100b51a98:     	adrp	x1, 0x104bd0000 <__ZL3hex+0x434d>
100b51a9c:     	add	x1, x1, #0xf99
100b51aa0:     	add	x0, x0, #0x10
100b51aa4:     	bl	0x10081a99c <__Z14BLI_strcasestrPKcS0_>
100b51aa8:     	cbnz	x0, 0x100b51ac0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x174>
100b51aac:     	adrp	x1, 0x104bd0000 <__ZL3hex+0x434d>
100b51ab0:     	add	x1, x1, #0xfa2
100b51ab4:     	add	x0, x23, #0x10
100b51ab8:     	bl	0x10081a99c <__Z14BLI_strcasestrPKcS0_>
100b51abc:     	cbz	x0, 0x100b51af8 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x1ac>
100b51ac0:     	adrp	x0, 0x104bd0000 <__ZL3hex+0x434d>
100b51ac4:     	add	x0, x0, #0xfaa
100b51ac8:     	mov	w1, #0x0                ; =0
100b51acc:     	bl	0x100b7bc38 <__Z20WM_operatortype_findPKcb>
100b51ad0:     	cbz	x0, 0x100b52064 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x718>
100b51ad4:     	adrp	x1, 0x104bd0000 <__ZL3hex+0x434d>
100b51ad8:     	add	x1, x1, #0xfaa
100b51adc:     	mov	x0, x19
100b51ae0:     	mov	w2, #0x0                ; =0
100b51ae4:     	mov	x3, #0x0                ; =0
100b51ae8:     	mov	x4, x20
100b51aec:     	bl	0x100b4f014 <__Z21WM_operator_name_callP8bContextPKcN7blender2wm13OpCallContextEP10PointerRNAPK7wmEvent>
100b51af0:     	mov	w0, #0x1                ; =1
100b51af4:     	b	0x100b51c88 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x33c>
100b51af8:     	add	x8, sp, #0x50
100b51afc:     	add	x25, x8, #0x30
100b51b00:     	movi.16b	v0, #0x0
100b51b04:     	str	xzr, [sp, #0xa0]
100b51b08:     	stp	q0, q0, [sp, #0x80]
100b51b0c:     	stp	q0, q0, [sp, #0x60]
100b51b10:     	str	q0, [sp, #0x50]
100b51b14:     	add	x8, x8, #0x50
100b51b18:     	stp	x25, x25, [sp, #0x68]
100b51b1c:     	str	x8, [sp, #0x78]
100b51b20:     	ldr	w8, [x21, #0x10]
100b51b24:     	cmp	w8, #0x1
100b51b28:     	b.eq	0x100b51b48 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x1fc>
100b51b2c:     	cmp	w8, #0x5
100b51b30:     	b.ne	0x100b51b5c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x210>
100b51b34:     	ldr	x23, [x21, #0x48]
100b51b38:     	cbnz	x23, 0x100b51d9c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x450>
100b51b3c:     	b	0x100b51b60 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x214>
100b51b40:     	mov	w0, #0x3                ; =3
100b51b44:     	b	0x100b51c88 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x33c>
100b51b48:     	ldr	x0, [x21, #0x20]
100b51b4c:     	bl	0x100b40a10 <__Z25wm_gizmomap_highlight_getP10wmGizmoMap>
100b51b50:     	cbz	x0, 0x100b51b5c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x210>
100b51b54:     	ldrb	w8, [x0, #0x49]
100b51b58:     	tbnz	w8, #0x2, 0x100b51d8c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x440>
100b51b5c:     	mov	x23, #0x0               ; =0
100b51b60:     	mov	w21, #0x1               ; =1
100b51b64:     	b	0x100b51dd8 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x48c>
100b51b68:     	mov	x0, x19
100b51b6c:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b51b70:     	mov	x1, x0
100b51b74:     	mov	x0, x19
100b51b78:     	mov	x2, x20
100b51b7c:     	mov	x3, x21
100b51b80:     	mov	w4, #0x1                ; =1
100b51b84:     	bl	0x100b515c8 <__ZL32wm_ipad_pencil_paint_modal_admitP8bContextP8wmWindowPK7wmEventPK17wmEventHandler_Opb>
100b51b88:     	cmp	w0, #0x2
100b51b8c:     	cset	w26, eq
100b51b90:     	mov	x0, x19
100b51b94:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b51b98:     	ldr	x8, [x0, #0x5c0]
100b51b9c:     	ldrb	w8, [x8, #0x10]
100b51ba0:     	cmp	w8, #0x1
100b51ba4:     	b.ne	0x100b51bb4 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x268>
100b51ba8:     	ldrh	w8, [x24, #0xe4]
100b51bac:     	orr	w8, w26, w8, lsr #9
100b51bb0:     	tbz	w8, #0x0, 0x100b51c7c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x330>
100b51bb4:     	ldr	x8, [x24, #0x48]
100b51bb8:     	cbz	x8, 0x100b51c24 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x2d8>
100b51bbc:     	mov	x0, x19
100b51bc0:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b51bc4:     	mov	x22, x0
100b51bc8:     	mov	x0, x19
100b51bcc:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b51bd0:     	str	x0, [sp, #0x30]
100b51bd4:     	mov	x0, x19
100b51bd8:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b51bdc:     	str	x0, [sp, #0x28]
100b51be0:     	mov	x0, x19
100b51be4:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b51be8:     	stp	x28, x0, [sp, #0x18]
100b51bec:     	tbz	w25, #0x0, 0x100b51cc0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x374>
100b51bf0:     	ldr	x1, [sp, #0x40]
100b51bf4:     	mov	x0, x19
100b51bf8:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b51bfc:     	ldr	x1, [sp, #0x38]
100b51c00:     	mov	x0, x19
100b51c04:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b51c08:     	mov	x28, x21
100b51c0c:     	ldr	x8, [x28, #0x50]!
100b51c10:     	cbnz	x8, 0x100b51ccc <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x380>
100b51c14:     	tbnz	w27, #0x0, 0x100b51ccc <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x380>
100b51c18:     	mov	w8, #0x0                ; =0
100b51c1c:     	mov	x26, x22
100b51c20:     	b	0x100b51eb0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x564>
100b51c24:     	adrp	x19, 0x106658000 <__ZN7blender3seq28seqModifierType_WhiteBalanceE+0x40>
100b51c28:     	add	x19, x19, #0x298
100b51c2c:     	ldr	x8, [x19]
100b51c30:     	ldr	x0, [x8, #0x8]
100b51c34:     	cbnz	x0, 0x100b51c48 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x2fc>
100b51c38:     	mov	x0, x8
100b51c3c:     	bl	0x100ae37f8 <__Z15CLG_logref_initP10CLG_LogRef>
100b51c40:     	ldr	x8, [x19]
100b51c44:     	ldr	x0, [x8, #0x8]
100b51c48:     	ldr	w8, [x0, #0x50]
100b51c4c:     	cmp	w8, #0x1
100b51c50:     	b.lt	0x100b51c7c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x330>
100b51c54:     	add	x8, x23, #0x10
100b51c58:     	adrp	x2, 0x104bd0000 <__ZL3hex+0x434d>
100b51c5c:     	add	x2, x2, #0xf2a
100b51c60:     	adrp	x3, 0x104bd0000 <__ZL3hex+0x434d>
100b51c64:     	add	x3, x3, #0xf66
100b51c68:     	adrp	x4, 0x104bd0000 <__ZL3hex+0x434d>
100b51c6c:     	add	x4, x4, #0xf7f
100b51c70:     	str	x8, [sp]
100b51c74:     	mov	w1, #0x1                ; =1
100b51c78:     	bl	0x100ae2b1c <__Z8CLG_logfPK11CLG_LogType9CLG_LevelPKcS4_S4_z>
100b51c7c:     	mov	w27, #0x8               ; =8
100b51c80:     	mov	w8, #0x1                ; =1
100b51c84:     	bic	w0, w8, w27, lsr #3
100b51c88:     	ldur	x8, [x29, #-0x60]
100b51c8c:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
100b51c90:     	ldr	x9, [x9, #0x7f0]
100b51c94:     	ldr	x9, [x9]
100b51c98:     	cmp	x9, x8
100b51c9c:     	b.ne	0x100b521a0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x854>
100b51ca0:     	ldp	x29, x30, [sp, #0x110]
100b51ca4:     	ldp	x20, x19, [sp, #0x100]
100b51ca8:     	ldp	x22, x21, [sp, #0xf0]
100b51cac:     	ldp	x24, x23, [sp, #0xe0]
100b51cb0:     	ldp	x26, x25, [sp, #0xd0]
100b51cb4:     	ldp	x28, x27, [sp, #0xc0]
100b51cb8:     	add	sp, sp, #0x120
100b51cbc:     	ret
100b51cc0:     	cbz	w27, 0x100b51ce0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x394>
100b51cc4:     	add	x28, x21, #0x50
100b51cc8:     	b	0x100b51cd0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x384>
100b51ccc:     	cbz	w27, 0x100b51d24 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x3d8>
100b51cd0:     	cmp	w26, #0x0
100b51cd4:     	mov	w8, #0x1                ; =1
100b51cd8:     	cinc	w0, w8, ne
100b51cdc:     	b	0x100b51d3c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x3f0>
100b51ce0:     	stp	xzr, xzr, [sp, #0x48]
100b51ce4:     	add	x3, sp, #0x50
100b51ce8:     	add	x4, sp, #0x48
100b51cec:     	mov	x0, x19
100b51cf0:     	mov	x1, x21
100b51cf4:     	mov	x2, x20
100b51cf8:     	bl	0x100b573b0 <__ZL34wm_handler_op_context_get_if_validP8bContextP17wmEventHandler_OpPK7wmEventPP7ScrAreaPP7ARegion>
100b51cfc:     	mov	x26, x22
100b51d00:     	ldr	x1, [sp, #0x50]
100b51d04:     	mov	x0, x19
100b51d08:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b51d0c:     	ldr	x1, [sp, #0x48]
100b51d10:     	mov	x0, x19
100b51d14:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b51d18:     	mov	x28, x21
100b51d1c:     	ldr	x8, [x28, #0x50]!
100b51d20:     	cbz	x8, 0x100b51eb0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x564>
100b51d24:     	mov	x0, x19
100b51d28:     	ldr	x1, [sp, #0x30]
100b51d2c:     	mov	x2, x20
100b51d30:     	mov	x3, x21
100b51d34:     	mov	w4, #0x0                ; =0
100b51d38:     	bl	0x100b515c8 <__ZL32wm_ipad_pencil_paint_modal_admitP8bContextP8wmWindowPK7wmEventPK17wmEventHandler_Opb>
100b51d3c:     	and	w9, w0, #0xff
100b51d40:     	cmp	w9, #0x2
100b51d44:     	csel	w8, wzr, w27, eq
100b51d48:     	cmp	w9, #0x1
100b51d4c:     	b.eq	0x100b51d6c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x420>
100b51d50:     	tbnz	w8, #0x0, 0x100b51d6c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x420>
100b51d54:     	mov	x26, x22
100b51d58:     	and	w8, w0, #0xff
100b51d5c:     	cmp	w8, #0x2
100b51d60:     	b.ne	0x100b51e98 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x54c>
100b51d64:     	mov	w8, #0x1                ; =1
100b51d68:     	b	0x100b51eb0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x564>
100b51d6c:     	mov	x0, x19
100b51d70:     	ldr	x1, [sp, #0x28]
100b51d74:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b51d78:     	mov	x0, x19
100b51d7c:     	ldr	x1, [sp, #0x20]
100b51d80:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b51d84:     	mov	w0, #0x3                ; =3
100b51d88:     	b	0x100b51c88 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x33c>
100b51d8c:     	mov	x0, x19
100b51d90:     	bl	0x100b8f7f8 <__Z30WM_toolsystem_ref_from_contextPK8bContext>
100b51d94:     	mov	x23, x0
100b51d98:     	cbz	x23, 0x100b51b60 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x214>
100b51d9c:     	add	x1, sp, #0x50
100b51da0:     	mov	x0, x23
100b51da4:     	mov	x2, x24
100b51da8:     	mov	x3, x22
100b51dac:     	bl	0x100b92614 <__Z44WM_toolsystem_ref_properties_init_for_keymapP8bToolRefP10PointerRNAS2_P14wmOperatorType>
100b51db0:     	ldr	w8, [x21, #0x10]
100b51db4:     	cmp	w8, #0x5
100b51db8:     	cset	w4, eq
100b51dbc:     	add	x24, sp, #0x50
100b51dc0:     	add	x2, sp, #0x50
100b51dc4:     	mov	x0, x19
100b51dc8:     	mov	x1, x23
100b51dcc:     	mov	x3, x22
100b51dd0:     	bl	0x100b9232c <__Z42WM_toolsystem_ref_properties_for_transformPK8bContextP8bToolRefP10PointerRNAPK14wmOperatorTypeb>
100b51dd4:     	mov	w21, #0x0               ; =0
100b51dd8:     	mov	x0, x19
100b51ddc:     	mov	x1, x22
100b51de0:     	mov	x2, x20
100b51de4:     	mov	x3, x24
100b51de8:     	mov	x4, #0x0                ; =0
100b51dec:     	mov	w5, #0x0                ; =0
100b51df0:     	mov	x6, x21
100b51df4:     	bl	0x100b5c6e4 <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb>
100b51df8:     	mov	x27, x0
100b51dfc:     	tbnz	w21, #0x0, 0x100b51e84 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x538>
100b51e00:     	add	x0, sp, #0x50
100b51e04:     	bl	0x100b7f6e8 <__Z27WM_operator_properties_freeP10PointerRNA>
100b51e08:     	tbz	w27, #0x2, 0x100b51e84 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x538>
100b51e0c:     	ldr	x20, [x23, #0xe0]
100b51e10:     	ldrb	w8, [x20, #0x44]!
100b51e14:     	cbz	w8, 0x100b51e84 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x538>
100b51e18:     	mov	x0, x20
100b51e1c:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
100b51e20:     	mov	x1, x0
100b51e24:     	mov	x0, x20
100b51e28:     	mov	w2, #0x0                ; =0
100b51e2c:     	bl	0x100b3e52c <__Z22WM_gizmogrouptype_findN7blender9StringRefEb>
100b51e30:     	mov	x20, x0
100b51e34:     	cbz	x0, 0x100b51e84 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x538>
100b51e38:     	ldrb	w8, [x20, #0x100]
100b51e3c:     	tbz	w8, #0x7, 0x100b51e84 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x538>
100b51e40:     	mov	x0, x19
100b51e44:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b51e48:     	mov	x21, x0
100b51e4c:     	cbz	x0, 0x100b51e84 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x538>
100b51e50:     	add	x0, x20, #0x108
100b51e54:     	bl	0x100b3f680 <__Z22WM_gizmomaptype_ensurePK21wmGizmoMapType_Params>
100b51e58:     	mov	x22, x0
100b51e5c:     	mov	x0, x20
100b51e60:     	mov	x1, x22
100b51e64:     	bl	0x100b3dfb8 <__Z33WM_gizmo_group_type_ensure_ptr_exP16wmGizmoGroupTypeP14wmGizmoMapType>
100b51e68:     	mov	x0, x22
100b51e6c:     	mov	x1, x20
100b51e70:     	mov	x2, x21
100b51e74:     	bl	0x100b3dd10 <__Z46WM_gizmomaptype_group_init_runtime_with_regionP14wmGizmoMapTypeP16wmGizmoGroupTypeP7ARegion>
100b51e78:     	mov	x1, x0
100b51e7c:     	mov	x0, x19
100b51e80:     	bl	0x100b3cdd8 <__Z25WM_gizmogroup_ensure_initPK8bContextP12wmGizmoGroup>
100b51e84:     	ldr	x0, [sp, #0x68]
100b51e88:     	cmp	x0, x25
100b51e8c:     	b.eq	0x100b52180 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x834>
100b51e90:     	bl	0x100ae425c <_MEM_freeN>
100b51e94:     	b	0x100b52180 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x834>
100b51e98:     	mov	w8, #0x0                ; =0
100b51e9c:     	cbz	x20, 0x100b51eb0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x564>
100b51ea0:     	tst	w0, #0xff
100b51ea4:     	b.ne	0x100b51eb0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x564>
100b51ea8:     	ldrb	w8, [x20, #0x7c]
100b51eac:     	ubfx	w8, w8, #6, #1
100b51eb0:     	ldr	x9, [x26, #0x5c0]
100b51eb4:     	ldr	x10, [x9, #0xe0]
100b51eb8:     	cbz	x10, 0x100b51ec4 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x578>
100b51ebc:     	ldr	x22, [x10, #0x20]
100b51ec0:     	b	0x100b51ec8 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x57c>
100b51ec4:     	mov	x22, #-0x1              ; =-1
100b51ec8:     	ldr	x9, [x9, #0x70]
100b51ecc:     	cmp	x9, #0x0
100b51ed0:     	csinv	x10, x9, xzr, ne
100b51ed4:     	ldrh	w9, [x24, #0xe4]
100b51ed8:     	tbz	w9, #0x1, 0x100b51ee8 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x59c>
100b51edc:     	ldrh	w9, [x26, #0x1b4]
100b51ee0:     	add	w9, w9, #0x1
100b51ee4:     	strh	w9, [x26, #0x1b4]
100b51ee8:     	str	x10, [sp, #0x10]
100b51eec:     	cbz	w8, 0x100b51f40 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x5f4>
100b51ef0:     	ldr	x8, [x28]
100b51ef4:     	ldr	x28, [sp, #0x30]
100b51ef8:     	cbz	x8, 0x100b51f1c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x5d0>
100b51efc:     	cbz	x28, 0x100b51f1c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x5d0>
100b51f00:     	ldr	x9, [x28, #0x168]
100b51f04:     	cbz	x9, 0x100b51f1c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x5d0>
100b51f08:     	ldr	x10, [x21, #0x58]
100b51f0c:     	cbz	x10, 0x100b51f1c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x5d0>
100b51f10:     	str	x8, [x9, #0x40]
100b51f14:     	ldr	x8, [x21, #0x58]
100b51f18:     	str	x8, [x9, #0x48]
100b51f1c:     	ldr	x8, [x24, #0x40]
100b51f20:     	mov	x0, x19
100b51f24:     	mov	x1, x23
100b51f28:     	blr	x8
100b51f2c:     	mov	w25, #0x0               ; =0
100b51f30:     	mov	w27, #0xa               ; =10
100b51f34:     	ldrh	w8, [x24, #0xe4]
100b51f38:     	tbnz	w8, #0x1, 0x100b51fb8 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x66c>
100b51f3c:     	b	0x100b51fd4 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x688>
100b51f40:     	mov	x0, x19
100b51f44:     	mov	x1, x20
100b51f48:     	bl	0x100b565e4 <__ZL18wm_region_mouse_coP8bContextP7wmEvent>
100b51f4c:     	cbz	w25, 0x100b51f7c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x630>
100b51f50:     	ldr	x8, [x20, #0x88]
100b51f54:     	ldrb	w8, [x8, #0xb8]
100b51f58:     	cmp	w8, #0x1
100b51f5c:     	cset	w3, eq
100b51f60:     	mov	x0, x19
100b51f64:     	mov	x1, x23
100b51f68:     	mov	x2, x20
100b51f6c:     	bl	0x101c346f0 <__Z26ED_mesh_knife_modal_actionP8bContextP10wmOperatorPK7wmEventb>
100b51f70:     	mov	x27, x0
100b51f74:     	mov	w25, #0x0               ; =0
100b51f78:     	b	0x100b51fac <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x660>
100b51f7c:     	add	x3, sp, #0x50
100b51f80:     	mov	x0, x19
100b51f84:     	mov	x1, x23
100b51f88:     	mov	x2, x20
100b51f8c:     	bl	0x100b5d1b8 <__ZL26wm_event_modalkeymap_beginPK8bContextP10wmOperatorP7wmEventP21wmEvent_ModalMapStore>
100b51f90:     	ldr	x8, [x24, #0x48]
100b51f94:     	mov	x0, x19
100b51f98:     	mov	x1, x23
100b51f9c:     	mov	x2, x20
100b51fa0:     	blr	x8
100b51fa4:     	mov	x27, x0
100b51fa8:     	mov	w25, #0x1               ; =1
100b51fac:     	ldr	x28, [sp, #0x30]
100b51fb0:     	ldrh	w8, [x24, #0xe4]
100b51fb4:     	tbz	w8, #0x1, 0x100b51fd4 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x688>
100b51fb8:     	mov	x0, x19
100b51fbc:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b51fc0:     	cmp	x0, x26
100b51fc4:     	b.ne	0x100b51fd4 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x688>
100b51fc8:     	ldrh	w8, [x26, #0x1b4]
100b51fcc:     	sub	w8, w8, #0x1
100b51fd0:     	strh	w8, [x26, #0x1b4]
100b51fd4:     	mov	x0, x19
100b51fd8:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b51fdc:     	cmp	x0, x28
100b51fe0:     	b.ne	0x100b52180 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x834>
100b51fe4:     	cbz	w25, 0x100b5201c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x6d0>
100b51fe8:     	ldrh	w8, [x20, #0x10]
100b51fec:     	mov	w9, #0x5022             ; =20514
100b51ff0:     	cmp	w8, w9
100b51ff4:     	b.ne	0x100b52008 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x6bc>
100b51ff8:     	ldr	w8, [x20, #0x90]
100b51ffc:     	str	w8, [x20, #0x10]
100b52000:     	ldr	w8, [sp, #0x50]
100b52004:     	str	w8, [x20, #0x90]
100b52008:     	ldrb	w8, [sp, #0x54]
100b5200c:     	cmp	w8, #0x1
100b52010:     	b.ne	0x100b5201c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x6d0>
100b52014:     	mov	w8, #0x4                ; =4
100b52018:     	strh	w8, [x20, #0x12]
100b5201c:     	ands	w24, w27, #0x6
100b52020:     	b.eq	0x100b5206c <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x720>
100b52024:     	mov	x0, x19
100b52028:     	mov	x1, x23
100b5202c:     	mov	x2, x27
100b52030:     	mov	w3, #0x0                ; =0
100b52034:     	bl	0x100b5c270 <__ZL19wm_operator_reportsP8bContextP10wmOperator16wmOperatorStatusb>
100b52038:     	ldr	x8, [x21, #0x20]
100b5203c:     	ldr	x9, [x8, #0x90]
100b52040:     	cmp	x9, #0x0
100b52044:     	csel	x8, x8, x9, eq
100b52048:     	ldr	x8, [x8, #0x58]
100b5204c:     	ldr	x8, [x8, #0xb0]
100b52050:     	ldr	x25, [sp, #0x28]
100b52054:     	cbz	x8, 0x100b52098 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x74c>
100b52058:     	mov	x0, x28
100b5205c:     	bl	0x100b589f4 <__Z32WM_window_status_area_tag_redrawP8wmWindow>
100b52060:     	b	0x100b52098 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x74c>
100b52064:     	mov	w0, #0x1                ; =1
100b52068:     	b	0x100b51c88 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x33c>
100b5206c:     	ldr	x8, [x23, #0x78]
100b52070:     	ldr	x8, [x8]
100b52074:     	ldr	x25, [sp, #0x28]
100b52078:     	cbz	x8, 0x100b52098 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x74c>
100b5207c:     	mov	x0, x19
100b52080:     	mov	w1, #0x10020000         ; =268566528
100b52084:     	mov	x2, #0x0                ; =0
100b52088:     	bl	0x100b4d83c <__Z21WM_event_add_notifierPK8bContextjPv>
100b5208c:     	ldr	x1, [x23, #0x78]
100b52090:     	mov	x0, x26
100b52094:     	bl	0x100b4e52c <__Z28WM_reports_from_reports_moveP15wmWindowManagerP10ReportList>
100b52098:     	tbnz	w27, #0x2, 0x100b520ac <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x760>
100b5209c:     	cbz	w24, 0x100b520fc <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x7b0>
100b520a0:     	mov	x0, x23
100b520a4:     	bl	0x100b42fe8 <__Z16WM_operator_freeP10wmOperator>
100b520a8:     	b	0x100b520f8 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x7ac>
100b520ac:     	ldr	x8, [x26, #0x5c0]
100b520b0:     	ldr	x9, [x8, #0xe0]
100b520b4:     	cbz	x9, 0x100b520c0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x774>
100b520b8:     	ldr	x9, [x9, #0x20]
100b520bc:     	b	0x100b520c4 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x778>
100b520c0:     	mov	x9, #-0x1               ; =-1
100b520c4:     	ldr	x10, [sp, #0x10]
100b520c8:     	cmp	x22, x9
100b520cc:     	cset	w4, ne
100b520d0:     	ldr	x8, [x8, #0x70]
100b520d4:     	cmp	x8, #0x0
100b520d8:     	csinv	x8, x8, xzr, ne
100b520dc:     	cmp	x10, x8
100b520e0:     	cset	w5, ne
100b520e4:     	mov	x0, x19
100b520e8:     	mov	x1, x23
100b520ec:     	mov	w2, #0x0                ; =0
100b520f0:     	mov	w3, #0x1                ; =1
100b520f4:     	bl	0x100b5c4c8 <__ZL20wm_operator_finishedP8bContextP10wmOperatorbbbb>
100b520f8:     	str	xzr, [x21, #0x20]
100b520fc:     	ldr	x23, [sp, #0x20]
100b52100:     	tbnz	w27, #0x3, 0x100b52120 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x7d4>
100b52104:     	ldrh	w8, [x20, #0x10]
100b52108:     	and	w9, w8, #0xfff0
100b5210c:     	cmp	w8, #0x104
100b52110:     	mov	w8, #0x110              ; =272
100b52114:     	ccmp	w9, w8, #0x4, ne
100b52118:     	csel	x25, x25, xzr, eq
100b5211c:     	csel	x23, x23, xzr, eq
100b52120:     	mov	x0, x19
100b52124:     	mov	x1, x25
100b52128:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b5212c:     	mov	x0, x19
100b52130:     	mov	x1, x23
100b52134:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b52138:     	mov	x0, x19
100b5213c:     	mov	x1, x20
100b52140:     	mov	x2, x21
100b52144:     	bl	0x100b40318 <__Z33wm_gizmomaps_handled_modal_updateP8bContextP7wmEventP17wmEventHandler_Op>
100b52148:     	cbz	w24, 0x100b52180 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x834>
100b5214c:     	mov	x0, x19
100b52150:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b52154:     	mov	x1, #0x0                ; =0
100b52158:     	bl	0x100b44778 <__Z22WM_cursor_grab_disableP8wmWindowPKi>
100b5215c:     	ldr	x0, [sp, #0x18]
100b52160:     	mov	x1, x21
100b52164:     	bl	0x10078fe64 <__Z11BLI_remlinkP8ListBasePv>
100b52168:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
100b5216c:     	add	x8, x8, #0x690
100b52170:     	ldr	x8, [x8]
100b52174:     	mov	x0, x21
100b52178:     	mov	w1, #0x0                ; =0
100b5217c:     	blr	x8
100b52180:     	cmp	w27, #0x9
100b52184:     	b.eq	0x100b52198 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x84c>
100b52188:     	cmp	w27, #0xc
100b5218c:     	b.ne	0x100b51c80 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x334>
100b52190:     	mov	w0, #0x2                ; =2
100b52194:     	b	0x100b51c88 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x33c>
100b52198:     	mov	w0, #0x5                ; =5
100b5219c:     	b	0x100b51c88 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x33c>
100b521a0:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
100b521a4:     	b	0x100b521d4 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x888>
100b521a8:     	b	0x100b521d4 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x888>
100b521ac:     	b	0x100b521d4 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x888>
100b521b0:     	b	0x100b521d4 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x888>
100b521b4:     	b	0x100b521d4 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x888>
100b521b8:     	mov	x19, x0
100b521bc:     	cbz	w1, 0x100b521cc <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb+0x880>
100b521c0:     	mov	x0, x19
100b521c4:     	bl	0x1000144bc <___clang_call_terminate>
100b521c8:     	mov	x19, x0
100b521cc:     	mov	x0, x19
100b521d0:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
100b521d4:     	mov	x19, x0
100b521d8:     	add	x0, sp, #0x50
100b521dc:     	bl	0x100013e10 <__ZN7blender2ed12sculpt_paint18FillToolTargetInfoD1Ev>
100b521e0:     	mov	x0, x19
100b521e4:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
