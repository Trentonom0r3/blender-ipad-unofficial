
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101c33afc <__ZL16knifetool_invokeP8bContextP10wmOperatorPK7wmEvent>:
101c33afc:     	sub	sp, sp, #0x1f0
101c33b00:     	stp	d9, d8, [sp, #0x180]
101c33b04:     	stp	x28, x27, [sp, #0x190]
101c33b08:     	stp	x26, x25, [sp, #0x1a0]
101c33b0c:     	stp	x24, x23, [sp, #0x1b0]
101c33b10:     	stp	x22, x21, [sp, #0x1c0]
101c33b14:     	stp	x20, x19, [sp, #0x1d0]
101c33b18:     	stp	x29, x30, [sp, #0x1e0]
101c33b1c:     	add	x29, sp, #0x1e0
101c33b20:     	str	x2, [sp, #0x8]
101c33b24:     	mov	x19, x1
101c33b28:     	mov	x20, x0
101c33b2c:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
101c33b30:     	ldr	x8, [x8, #0x7f0]
101c33b34:     	ldr	x8, [x8]
101c33b38:     	stur	x8, [x29, #-0x70]
101c33b3c:     	ldr	x0, [x1, #0x70]
101c33b40:     	adrp	x1, 0x104d20000 <__ZL3hex+0x15434d>
101c33b44:     	add	x1, x1, #0x60f
101c33b48:     	bl	0x10125d01c <__Z15RNA_boolean_getP10PointerRNAPKc>
101c33b4c:     	mov	x24, x0
101c33b50:     	ldr	x0, [x19, #0x70]
101c33b54:     	adrp	x1, 0x104d2c000 <__ZL3hex+0x16034d>
101c33b58:     	add	x1, x1, #0xed3
101c33b5c:     	bl	0x10125d01c <__Z15RNA_boolean_getP10PointerRNAPKc>
101c33b60:     	mov	x25, x0
101c33b64:     	ldr	x0, [x19, #0x70]
101c33b68:     	adrp	x1, 0x104d2c000 <__ZL3hex+0x16034d>
101c33b6c:     	add	x1, x1, #0xf35
101c33b70:     	bl	0x10125d01c <__Z15RNA_boolean_getP10PointerRNAPKc>
101c33b74:     	mov	x26, x0
101c33b78:     	ldr	x0, [x19, #0x70]
101c33b7c:     	adrp	x1, 0x104d2c000 <__ZL3hex+0x16034d>
101c33b80:     	add	x1, x1, #0xf5d
101c33b84:     	bl	0x10125d758 <__Z12RNA_enum_getP10PointerRNAPKc>
101c33b88:     	mov	x27, x0
101c33b8c:     	ldr	x0, [x19, #0x70]
101c33b90:     	adrp	x1, 0x104d2c000 <__ZL3hex+0x16034d>
101c33b94:     	add	x1, x1, #0xfa7
101c33b98:     	bl	0x10125d758 <__Z12RNA_enum_getP10PointerRNAPKc>
101c33b9c:     	mov	x28, x0
101c33ba0:     	ldr	x0, [x19, #0x70]
101c33ba4:     	adrp	x1, 0x104bd4000 <__ZL3hex+0x834d>
101c33ba8:     	add	x1, x1, #0xf75
101c33bac:     	bl	0x10125d01c <__Z15RNA_boolean_getP10PointerRNAPKc>
101c33bb0:     	mov	x23, x0
101c33bb4:     	ldr	x0, [x19, #0x70]
101c33bb8:     	adrp	x1, 0x104d2c000 <__ZL3hex+0x16034d>
101c33bbc:     	add	x1, x1, #0xfd9
101c33bc0:     	bl	0x10125d4e0 <__Z13RNA_float_getP10PointerRNAPKc>
101c33bc4:     	fmov	s8, s0
101c33bc8:     	add	x8, sp, #0xc8
101c33bcc:     	mov	x0, x20
101c33bd0:     	bl	0x101c4ce18 <__Z20em_setup_viewcontextP8bContext>
101c33bd4:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101c33bd8:     	add	x8, x8, #0x6d0
101c33bdc:     	ldr	x8, [x8]
101c33be0:     	adrp	x2, 0x104d2d000 <__ZL3hex+0x16134d>
101c33be4:     	add	x2, x2, #0x54
101c33be8:     	mov	w0, #0x490              ; =1168
101c33bec:     	mov	w1, #0x8                ; =8
101c33bf0:     	mov	w3, #0x1                ; =1
101c33bf4:     	blr	x8
101c33bf8:     	mov	x22, x0
101c33bfc:     	mov	w1, #0x490              ; =1168
101c33c00:     	bl	0x104b71840 <_zlibVersion+0x104b71840>
101c33c04:     	add	x8, x22, #0x98
101c33c08:     	stp	x8, x8, [x22, #0x80]
101c33c0c:     	add	x8, x22, #0xb8
101c33c10:     	str	x8, [x22, #0x90]
101c33c14:     	add	x8, x22, #0xc0
101c33c18:     	str	x8, [x22, #0xc0]
101c33c1c:     	stp	xzr, xzr, [x22, #0x110]
101c33c20:     	add	x8, x22, #0x180
101c33c24:     	stp	x8, x8, [x22, #0x168]
101c33c28:     	add	x8, x22, #0x2a0
101c33c2c:     	str	x8, [x22, #0x178]
101c33c30:     	str	x22, [x19, #0x60]
101c33c34:     	ldp	x0, x1, [sp, #0xe0]
101c33c38:     	ldr	x2, [sp, #0x108]
101c33c3c:     	sub	x8, x29, #0xb0
101c33c40:     	bl	0x100225b74 <__Z58BKE_view_layer_array_from_objects_in_edit_mode_unique_dataPK5SceneP9ViewLayerPK6View3D>
101c33c44:     	mov	w8, #0x2ee1             ; =12001
101c33c48:     	movk	w8, #0x4265, lsl #16
101c33c4c:     	fmov	s0, w8
101c33c50:     	fmul	s0, s8, s0
101c33c54:     	mov	w8, #0x1                ; =1
101c33c58:     	strb	w8, [sp]
101c33c5c:     	sub	x21, x29, #0xb0
101c33c60:     	add	x0, sp, #0xc8
101c33c64:     	sub	x2, x29, #0xb0
101c33c68:     	eor	w4, w25, #0x1
101c33c6c:     	eor	w5, w26, #0x1
101c33c70:     	mov	x1, x22
101c33c74:     	mov	x3, x24
101c33c78:     	mov	x6, x27
101c33c7c:     	mov	x7, x28
101c33c80:     	bl	0x101c35148 <__ZL14knifetool_initP11ViewContextP16KnifeTool_OpDataN7blender6VectorIP6ObjectLx4ENS3_16GuardedAllocatorEEEbbbiifb>
101c33c84:     	ldur	x0, [x29, #-0xb0]
101c33c88:     	add	x8, x21, #0x18
101c33c8c:     	cmp	x0, x8
101c33c90:     	b.eq	0x101c33c98 <__ZL16knifetool_invokeP8bContextP10wmOperatorPK7wmEvent+0x19c>
101c33c94:     	bl	0x100ae425c <_MEM_freeN>
101c33c98:     	cbz	w24, 0x101c33cd8 <__ZL16knifetool_invokeP8bContextP10wmOperatorPK7wmEvent+0x1dc>
101c33c9c:     	ldp	x24, x25, [x22, #0x80]
101c33ca0:     	cmp	x24, x25
101c33ca4:     	b.eq	0x101c33d60 <__ZL16knifetool_invokeP8bContextP10wmOperatorPK7wmEvent+0x264>
101c33ca8:     	mov	w26, #0x0               ; =0
101c33cac:     	ldr	x0, [x24]
101c33cb0:     	bl	0x10017c608 <__Z24BKE_editmesh_from_objectP6Object>
101c33cb4:     	ldr	x8, [x0]
101c33cb8:     	ldr	w8, [x8, #0x18]
101c33cbc:     	cmp	w8, #0x0
101c33cc0:     	cset	w8, ne
101c33cc4:     	orr	w26, w8, w26
101c33cc8:     	add	x24, x24, #0x8
101c33ccc:     	cmp	x24, x25
101c33cd0:     	b.ne	0x101c33cac <__ZL16knifetool_invokeP8bContextP10wmOperatorPK7wmEvent+0x1b0>
101c33cd4:     	tbz	w26, #0x0, 0x101c33d60 <__ZL16knifetool_invokeP8bContextP10wmOperatorPK7wmEvent+0x264>
101c33cd8:     	ldrh	w8, [x19, #0xa0]
101c33cdc:     	orr	w8, w8, #0x10
101c33ce0:     	strh	w8, [x19, #0xa0]
101c33ce4:     	mov	x0, x20
101c33ce8:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101c33cec:     	mov	w1, #0xf                ; =15
101c33cf0:     	bl	0x100b44568 <__Z19WM_cursor_modal_setP8wmWindowi>
101c33cf4:     	mov	x0, x20
101c33cf8:     	mov	x1, x19
101c33cfc:     	bl	0x100b58a44 <__Z26WM_event_add_modal_handlerP8bContextP10wmOperator>
101c33d00:     	tbnz	w23, #0x0, 0x101c33d48 <__ZL16knifetool_invokeP8bContextP10wmOperatorPK7wmEvent+0x24c>
101c33d04:     	movi.16b	v0, #0x0
101c33d08:     	stp	q0, q0, [sp, #0xa0]
101c33d0c:     	stp	q0, q0, [sp, #0x80]
101c33d10:     	stp	q0, q0, [sp, #0x60]
101c33d14:     	stp	q0, q0, [sp, #0x40]
101c33d18:     	stp	q0, q0, [sp, #0x20]
101c33d1c:     	str	q0, [sp, #0x10]
101c33d20:     	mov	w8, #0x5022             ; =20514
101c33d24:     	movk	w8, #0x9, lsl #16
101c33d28:     	str	w8, [sp, #0x20]
101c33d2c:     	ldr	x8, [sp, #0x8]
101c33d30:     	ldur	d0, [x8, #0x1c]
101c33d34:     	stur	d0, [sp, #0x2c]
101c33d38:     	add	x2, sp, #0x10
101c33d3c:     	mov	x0, x20
101c33d40:     	mov	x1, x19
101c33d44:     	bl	0x101c33df4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent>
101c33d48:     	mov	x0, x20
101c33d4c:     	mov	x1, x19
101c33d50:     	mov	x2, x22
101c33d54:     	bl	0x101c37178 <__ZL19knife_update_headerP8bContextP10wmOperatorP16KnifeTool_OpData>
101c33d58:     	mov	w0, #0x1                ; =1
101c33d5c:     	b	0x101c33d84 <__ZL16knifetool_invokeP8bContextP10wmOperatorPK7wmEvent+0x288>
101c33d60:     	ldr	x0, [x19, #0x78]
101c33d64:     	adrp	x2, 0x104d2d000 <__ZL3hex+0x16134d>
101c33d68:     	add	x2, x2, #0x65
101c33d6c:     	mov	w1, #0x20               ; =32
101c33d70:     	bl	0x1003ca47c <__Z10BKE_reportP10ReportList11eReportTypePKc>
101c33d74:     	ldr	x0, [x19, #0x60]!
101c33d78:     	bl	0x101c37040 <__ZL17knifetool_exit_exP16KnifeTool_OpData>
101c33d7c:     	str	xzr, [x19]
101c33d80:     	mov	w0, #0x2                ; =2
101c33d84:     	ldur	x8, [x29, #-0x70]
101c33d88:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
101c33d8c:     	ldr	x9, [x9, #0x7f0]
101c33d90:     	ldr	x9, [x9]
101c33d94:     	cmp	x9, x8
101c33d98:     	b.ne	0x101c33dc0 <__ZL16knifetool_invokeP8bContextP10wmOperatorPK7wmEvent+0x2c4>
101c33d9c:     	ldp	x29, x30, [sp, #0x1e0]
101c33da0:     	ldp	x20, x19, [sp, #0x1d0]
101c33da4:     	ldp	x22, x21, [sp, #0x1c0]
101c33da8:     	ldp	x24, x23, [sp, #0x1b0]
101c33dac:     	ldp	x26, x25, [sp, #0x1a0]
101c33db0:     	ldp	x28, x27, [sp, #0x190]
101c33db4:     	ldp	d9, d8, [sp, #0x180]
101c33db8:     	add	sp, sp, #0x1f0
101c33dbc:     	ret
101c33dc0:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
101c33dc4:     	mov	x19, x0
101c33dc8:     	cbz	w1, 0x101c33dec <__ZL16knifetool_invokeP8bContextP10wmOperatorPK7wmEvent+0x2f0>
101c33dcc:     	mov	x0, x19
101c33dd0:     	bl	0x1000144bc <___clang_call_terminate>
101c33dd4:     	mov	x19, x0
101c33dd8:     	sub	x0, x29, #0xb0
101c33ddc:     	bl	0x1000144cc <__ZN7blender6VectorIxLx4ENS_16GuardedAllocatorEED1Ev>
101c33de0:     	mov	x0, x19
101c33de4:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
101c33de8:     	mov	x19, x0
101c33dec:     	mov	x0, x19
101c33df0:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
