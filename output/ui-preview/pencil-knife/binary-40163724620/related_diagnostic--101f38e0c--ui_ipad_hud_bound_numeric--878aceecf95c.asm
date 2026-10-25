
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f38e0c <__ZL25ui_ipad_hud_bound_numericPK5uiBut>:
101f38e0c:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f38e10:     	ldr	x8, [x8, #0x70]
101f38e14:     	cbz	x8, 0x101f38ec8 <__ZL25ui_ipad_hud_bound_numericPK5uiBut+0xbc>
101f38e18:     	ldr	x9, [x0, #0x8]
101f38e1c:     	fmov	d0, x8
101f38e20:     	cnt.8b	v0, v0
101f38e24:     	uaddlv.8b	h0, v0
101f38e28:     	fmov	w10, s0
101f38e2c:     	cmp	x10, #0x1
101f38e30:     	b.hi	0x101f38e40 <__ZL25ui_ipad_hud_bound_numericPK5uiBut+0x34>
101f38e34:     	sub	x11, x8, #0x1
101f38e38:     	and	x11, x11, x9
101f38e3c:     	b	0x101f38e54 <__ZL25ui_ipad_hud_bound_numericPK5uiBut+0x48>
101f38e40:     	mov	x11, x9
101f38e44:     	cmp	x9, x8
101f38e48:     	b.lo	0x101f38e54 <__ZL25ui_ipad_hud_bound_numericPK5uiBut+0x48>
101f38e4c:     	udiv	x11, x9, x8
101f38e50:     	msub	x11, x11, x8, x9
101f38e54:     	adrp	x12, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f38e58:     	ldr	x12, [x12, #0x68]
101f38e5c:     	ldr	x12, [x12, x11, lsl #3]
101f38e60:     	cbz	x12, 0x101f38ebc <__ZL25ui_ipad_hud_bound_numericPK5uiBut+0xb0>
101f38e64:     	ldr	x12, [x12]
101f38e68:     	cbz	x12, 0x101f38ebc <__ZL25ui_ipad_hud_bound_numericPK5uiBut+0xb0>
101f38e6c:     	sub	x13, x8, #0x1
101f38e70:     	b	0x101f38e88 <__ZL25ui_ipad_hud_bound_numericPK5uiBut+0x7c>
101f38e74:     	ldr	x14, [x12, #0x10]
101f38e78:     	cmp	x14, x9
101f38e7c:     	b.eq	0x101f38ec4 <__ZL25ui_ipad_hud_bound_numericPK5uiBut+0xb8>
101f38e80:     	ldr	x12, [x12]
101f38e84:     	cbz	x12, 0x101f38ebc <__ZL25ui_ipad_hud_bound_numericPK5uiBut+0xb0>
101f38e88:     	ldr	x14, [x12, #0x8]
101f38e8c:     	cmp	x14, x9
101f38e90:     	b.eq	0x101f38e74 <__ZL25ui_ipad_hud_bound_numericPK5uiBut+0x68>
101f38e94:     	cmp	x10, #0x1
101f38e98:     	b.hi	0x101f38ea4 <__ZL25ui_ipad_hud_bound_numericPK5uiBut+0x98>
101f38e9c:     	and	x14, x14, x13
101f38ea0:     	b	0x101f38eb4 <__ZL25ui_ipad_hud_bound_numericPK5uiBut+0xa8>
101f38ea4:     	cmp	x14, x8
101f38ea8:     	b.lo	0x101f38eb4 <__ZL25ui_ipad_hud_bound_numericPK5uiBut+0xa8>
101f38eac:     	udiv	x15, x14, x8
101f38eb0:     	msub	x14, x15, x8, x14
101f38eb4:     	cmp	x14, x11
101f38eb8:     	b.eq	0x101f38e80 <__ZL25ui_ipad_hud_bound_numericPK5uiBut+0x74>
101f38ebc:     	and	w0, wzr, #0x1
101f38ec0:     	ret
101f38ec4:     	ldrb	w8, [x12, #0x19d]
101f38ec8:     	and	w0, w8, #0x1
101f38ecc:     	ret
