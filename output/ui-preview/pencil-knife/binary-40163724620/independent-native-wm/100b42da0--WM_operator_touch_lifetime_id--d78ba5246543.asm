
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b42da0 <__Z29WM_operator_touch_lifetime_idPK10wmOperator>:
100b42da0:     	sub	sp, sp, #0x20
100b42da4:     	stp	x29, x30, [sp, #0x10]
100b42da8:     	add	x29, sp, #0x10
100b42dac:     	str	x0, [sp, #0x8]
100b42db0:     	adrp	x8, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b42db4:     	ldr	x8, [x8, #0x328]
100b42db8:     	cbz	x8, 0x100b42e94 <__Z29WM_operator_touch_lifetime_idPK10wmOperator+0xf4>
100b42dbc:     	lsr	x9, x0, #32
100b42dc0:     	ubfiz	x10, x0, #3, #29
100b42dc4:     	add	x10, x10, #0x8
100b42dc8:     	eor	x10, x10, x9
100b42dcc:     	mov	x11, #0x2d69            ; =11625
100b42dd0:     	movk	x11, #0xeb38, lsl #16
100b42dd4:     	movk	x11, #0xea08, lsl #32
100b42dd8:     	movk	x11, #0x9ddf, lsl #48
100b42ddc:     	mul	x10, x10, x11
100b42de0:     	eor	x9, x9, x10, lsr #47
100b42de4:     	eor	x9, x9, x10
100b42de8:     	mul	x9, x9, x11
100b42dec:     	eor	x9, x9, x9, lsr #47
100b42df0:     	mul	x9, x9, x11
100b42df4:     	fmov	d0, x8
100b42df8:     	cnt.8b	v0, v0
100b42dfc:     	uaddlv.8b	h0, v0
100b42e00:     	fmov	w10, s0
100b42e04:     	cmp	x10, #0x1
100b42e08:     	b.hi	0x100b42e18 <__Z29WM_operator_touch_lifetime_idPK10wmOperator+0x78>
100b42e0c:     	sub	x11, x8, #0x1
100b42e10:     	and	x11, x11, x9
100b42e14:     	b	0x100b42e2c <__Z29WM_operator_touch_lifetime_idPK10wmOperator+0x8c>
100b42e18:     	mov	x11, x9
100b42e1c:     	cmp	x9, x8
100b42e20:     	b.lo	0x100b42e2c <__Z29WM_operator_touch_lifetime_idPK10wmOperator+0x8c>
100b42e24:     	udiv	x11, x9, x8
100b42e28:     	msub	x11, x11, x8, x9
100b42e2c:     	adrp	x12, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b42e30:     	ldr	x12, [x12, #0x320]
100b42e34:     	ldr	x12, [x12, x11, lsl #3]
100b42e38:     	cbz	x12, 0x100b42e94 <__Z29WM_operator_touch_lifetime_idPK10wmOperator+0xf4>
100b42e3c:     	ldr	x12, [x12]
100b42e40:     	cbz	x12, 0x100b42e94 <__Z29WM_operator_touch_lifetime_idPK10wmOperator+0xf4>
100b42e44:     	sub	x13, x8, #0x1
100b42e48:     	b	0x100b42e60 <__Z29WM_operator_touch_lifetime_idPK10wmOperator+0xc0>
100b42e4c:     	ldr	x14, [x12, #0x10]
100b42e50:     	cmp	x14, x0
100b42e54:     	b.eq	0x100b42ee4 <__Z29WM_operator_touch_lifetime_idPK10wmOperator+0x144>
100b42e58:     	ldr	x12, [x12]
100b42e5c:     	cbz	x12, 0x100b42e94 <__Z29WM_operator_touch_lifetime_idPK10wmOperator+0xf4>
100b42e60:     	ldr	x14, [x12, #0x8]
100b42e64:     	cmp	x14, x9
100b42e68:     	b.eq	0x100b42e4c <__Z29WM_operator_touch_lifetime_idPK10wmOperator+0xac>
100b42e6c:     	cmp	x10, #0x1
100b42e70:     	b.hi	0x100b42e7c <__Z29WM_operator_touch_lifetime_idPK10wmOperator+0xdc>
100b42e74:     	and	x14, x14, x13
100b42e78:     	b	0x100b42e8c <__Z29WM_operator_touch_lifetime_idPK10wmOperator+0xec>
100b42e7c:     	cmp	x14, x8
100b42e80:     	b.lo	0x100b42e8c <__Z29WM_operator_touch_lifetime_idPK10wmOperator+0xec>
100b42e84:     	udiv	x15, x14, x8
100b42e88:     	msub	x14, x15, x8, x14
100b42e8c:     	cmp	x14, x11
100b42e90:     	b.eq	0x100b42e58 <__Z29WM_operator_touch_lifetime_idPK10wmOperator+0xb8>
100b42e94:     	mov	x8, #0x0                ; =0
100b42e98:     	cbz	x0, 0x100b42ed4 <__Z29WM_operator_touch_lifetime_idPK10wmOperator+0x134>
100b42e9c:     	adrp	x9, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b42ea0:     	ldr	x10, [x9, #0x348]
100b42ea4:     	cmn	x10, #0x1
100b42ea8:     	b.eq	0x100b42ed4 <__Z29WM_operator_touch_lifetime_idPK10wmOperator+0x134>
100b42eac:     	add	x8, x10, #0x1
100b42eb0:     	str	x8, [x9, #0x348]
100b42eb4:     	str	x8, [sp]
100b42eb8:     	adrp	x0, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b42ebc:     	add	x0, x0, #0x320
100b42ec0:     	add	x1, sp, #0x8
100b42ec4:     	add	x2, sp, #0x8
100b42ec8:     	mov	x3, sp
100b42ecc:     	bl	0x100b439f8 <__ZNSt3__112__hash_tableINS_17__hash_value_typeIPK10wmOperatoryEENS_22__unordered_map_hasherIS4_S5_NS_4hashIS4_EENS_8equal_toIS4_EELb1EEENS_21__unordered_map_equalIS4_S5_SA_S8_Lb1EEENS_9allocatorIS5_EEE25__emplace_unique_key_argsIS4_JRS4_RKyEEENS_4pairINS_15__hash_iteratorIPNS_11__hash_nodeIS5_PvEEEEbEERKT_DpOT0_>
100b42ed0:     	ldr	x8, [sp]
100b42ed4:     	mov	x0, x8
100b42ed8:     	ldp	x29, x30, [sp, #0x10]
100b42edc:     	add	sp, sp, #0x20
100b42ee0:     	ret
100b42ee4:     	ldr	x8, [x12, #0x18]
100b42ee8:     	b	0x100b42ed4 <__Z29WM_operator_touch_lifetime_idPK10wmOperator+0x134>
