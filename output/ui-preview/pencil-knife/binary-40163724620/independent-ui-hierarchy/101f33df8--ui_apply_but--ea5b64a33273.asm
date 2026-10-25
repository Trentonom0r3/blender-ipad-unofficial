
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f33df8 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab>:
101f33df8:     	sub	sp, sp, #0x60
101f33dfc:     	stp	x26, x25, [sp, #0x10]
101f33e00:     	stp	x24, x23, [sp, #0x20]
101f33e04:     	stp	x22, x21, [sp, #0x30]
101f33e08:     	stp	x20, x19, [sp, #0x40]
101f33e0c:     	stp	x29, x30, [sp, #0x50]
101f33e10:     	add	x29, sp, #0x50
101f33e14:     	mov	x23, x4
101f33e18:     	mov	x21, x3
101f33e1c:     	mov	x22, x2
101f33e20:     	mov	x20, x1
101f33e24:     	mov	x19, x0
101f33e28:     	add	x1, x1, #0x3b0
101f33e2c:     	bl	0x101f8f1cc <__Z27ui_ipad_action_origin_validP8bContextRKN7blender2ui4ipad12ActionOriginE>
101f33e30:     	cbz	w0, 0x101f33eb4 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0xbc>
101f33e34:     	mov	x0, x22
101f33e38:     	bl	0x101f05a30 <__Z26ui_ipad_numbers_but_rebindP5uiBut>
101f33e3c:     	cbz	w0, 0x101f33eb4 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0xbc>
101f33e40:     	mov	x0, x19
101f33e44:     	mov	x1, x22
101f33e48:     	bl	0x101f093c4 <__Z33ui_ipad_but_self_callback_allowedP8bContextP5uiBut>
101f33e4c:     	tbz	w0, #0x0, 0x101f33eb4 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0xbc>
101f33e50:     	ldrb	w24, [x22, #0x21]
101f33e54:     	str	wzr, [x21, #0x28]
101f33e58:     	ldrb	w8, [x21, #0x2c]
101f33e5c:     	cmp	w8, #0x1
101f33e60:     	b.ne	0x101f33ee4 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0xec>
101f33e64:     	ldrb	w8, [x21, #0x2e]
101f33e68:     	cmp	w8, #0x1
101f33e6c:     	b.ne	0x101f33ec8 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0xd0>
101f33e70:     	ldr	x0, [x21, #0x40]
101f33e74:     	cbz	x0, 0x101f33e8c <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x94>
101f33e78:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101f33e7c:     	add	x8, x8, #0x690
101f33e80:     	ldr	x8, [x8]
101f33e84:     	mov	w1, #0x0                ; =0
101f33e88:     	blr	x8
101f33e8c:     	ldr	x8, [x21, #0x50]
101f33e90:     	str	x8, [x21, #0x40]
101f33e94:     	str	xzr, [x21, #0x50]
101f33e98:     	ldr	d0, [x21, #0x70]
101f33e9c:     	str	d0, [x21, #0x68]
101f33ea0:     	ldur	d0, [x21, #0x8c]
101f33ea4:     	str	d0, [x21, #0x80]
101f33ea8:     	ldr	s0, [x21, #0x94]
101f33eac:     	str	s0, [x21, #0x88]
101f33eb0:     	b	0x101f33f7c <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x184>
101f33eb4:     	mov	w8, #0x1                ; =1
101f33eb8:     	strb	w8, [x21, #0x2c]
101f33ebc:     	ldr	x9, [x20, #0x3a8]
101f33ec0:     	cbz	x9, 0x101f33ec8 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0xd0>
101f33ec4:     	str	w8, [x9, #0x28c]
101f33ec8:     	ldp	x29, x30, [sp, #0x50]
101f33ecc:     	ldp	x20, x19, [sp, #0x40]
101f33ed0:     	ldp	x22, x21, [sp, #0x30]
101f33ed4:     	ldp	x24, x23, [sp, #0x20]
101f33ed8:     	ldp	x26, x25, [sp, #0x10]
101f33edc:     	add	sp, sp, #0x60
101f33ee0:     	ret
101f33ee4:     	cbz	w23, 0x101f33ef4 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0xfc>
101f33ee8:     	mov	w8, #0x1                ; =1
101f33eec:     	strb	w8, [x21, #0x2f]
101f33ef0:     	b	0x101f33efc <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x104>
101f33ef4:     	ldrb	w8, [x21, #0x2f]
101f33ef8:     	tbnz	w8, #0x0, 0x101f33ec8 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0xd0>
101f33efc:     	ldrb	w8, [x22, #0x1b]
101f33f00:     	tbnz	w8, #0x1, 0x101f33f7c <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x184>
101f33f04:     	ldp	x8, x9, [x21, #0x140]
101f33f08:     	cmp	x8, x9
101f33f0c:     	b.ne	0x101f33f7c <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x184>
101f33f10:     	mov	x0, x22
101f33f14:     	bl	0x101f38e0c <__ZL25ui_ipad_hud_bound_numericPK5uiBut>
101f33f18:     	tbnz	w0, #0x0, 0x101f33f7c <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x184>
101f33f1c:     	mov	x0, x19
101f33f20:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f33f24:     	ldr	x8, [x0, #0xf0]
101f33f28:     	ldrb	w9, [x21, #0x2e1]
101f33f2c:     	tbnz	w9, #0x0, 0x101f33f38 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x140>
101f33f30:     	ldrb	w9, [x8, #0x2a]
101f33f34:     	tbz	w9, #0x2, 0x101f33f7c <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x184>
101f33f38:     	ldrh	w9, [x8, #0x12]
101f33f3c:     	cmp	w9, #0x1
101f33f40:     	b.ne	0x101f33f64 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x16c>
101f33f44:     	ldrb	w9, [x8, #0x2a]
101f33f48:     	mov	w10, #0xa               ; =10
101f33f4c:     	tst	w9, w10
101f33f50:     	b.eq	0x101f33f64 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x16c>
101f33f54:     	tbnz	w9, #0x0, 0x101f33f64 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x16c>
101f33f58:     	ldrh	w8, [x8, #0x10]
101f33f5c:     	cmp	w8, #0x76
101f33f60:     	b.eq	0x101f33f7c <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x184>
101f33f64:     	add	x2, x21, #0x140
101f33f68:     	mov	x0, x19
101f33f6c:     	mov	x1, x22
101f33f70:     	bl	0x101f410f0 <__ZL22ui_selectcontext_beginP8bContextP5uiButP20uiSelectContextStore>
101f33f74:     	mov	w8, #0x1                ; =1
101f33f78:     	strb	w8, [x21, #0x2e1]
101f33f7c:     	add	x23, x22, #0x3e8
101f33f80:     	ldr	q0, [x23]
101f33f84:     	str	q0, [sp]
101f33f88:     	ldr	x25, [x22, #0x3f8]
101f33f8c:     	cmp	w24, #0x19
101f33f90:     	b.eq	0x101f33fa4 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x1ac>
101f33f94:     	cmp	w24, #0x1c
101f33f98:     	b.eq	0x101f33fa4 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x1ac>
101f33f9c:     	cmp	w24, #0x1b
101f33fa0:     	b.ne	0x101f34010 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x218>
101f33fa4:     	ldr	x26, [x22, #0x428]
101f33fa8:     	str	xzr, [x22, #0x428]
101f33fac:     	stp	xzr, xzr, [x23, #0x8]
101f33fb0:     	str	xzr, [x23]
101f33fb4:     	mov	x0, x19
101f33fb8:     	mov	x1, x22
101f33fbc:     	bl	0x101f37bcc <__ZL17ui_apply_but_funcP8bContextP5uiBut>
101f33fc0:     	ldrsh	w8, [x22, #0x26]
101f33fc4:     	str	w8, [x21, #0x28]
101f33fc8:     	mov	w8, #0x1                ; =1
101f33fcc:     	strb	w8, [x21, #0x2e]
101f33fd0:     	ldrb	w8, [x21, #0x114]
101f33fd4:     	cmp	w8, #0x1
101f33fd8:     	b.ne	0x101f34060 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x268>
101f33fdc:     	ldr	w8, [x21, #0x110]
101f33fe0:     	cmp	w8, #0x2
101f33fe4:     	b.ne	0x101f34060 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x268>
101f33fe8:     	ldrb	w8, [x21, #0x129]
101f33fec:     	tbnz	w8, #0x0, 0x101f34060 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x268>
101f33ff0:     	ldrb	w8, [x21, #0x2c]
101f33ff4:     	mov	x0, x19
101f33ff8:     	mov	x1, x21
101f33ffc:     	mov	x2, x20
101f34000:     	cmp	w8, #0x1
101f34004:     	b.ne	0x101f3405c <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x264>
101f34008:     	bl	0x101f4515c <__ZL19ui_multibut_restoreP8bContextP18uiHandleButtonDataP7uiBlock>
101f3400c:     	b	0x101f34060 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x268>
101f34010:     	stp	xzr, xzr, [x23]
101f34014:     	str	xzr, [x23, #0x10]
101f34018:     	sub	w8, w24, #0x1
101f3401c:     	cmp	w8, #0x2f
101f34020:     	b.hi	0x101f33fd0 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x1d8>
101f34024:     	adrp	x9, 0x105207000 <__ZTSN3tbb6detail2d19start_forINS1_13blocked_rangeImEENS0_2d225parallel_for_body_wrapperIPKN7blender2ed12greasepencil18MutableDrawingInfoEZNS8_9transformL25gizmo_3d_foreach_selectedEPK8bContextsbbNS7_11FunctionRefIFvRKNS7_7VecBaseIfLi3EEEEEEPPA4_KfPsE3$_2SA_EEKNS1_16auto_partitionerEEE+0x14>
101f34028:     	add	x9, x9, #0xec8
101f3402c:     	adr	x10, 0x101f33fb4 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x1bc>
101f34030:     	ldrb	w11, [x9, x8]
101f34034:     	add	x10, x10, x11, lsl #2
101f34038:     	br	x10
101f3403c:     	mov	x0, x19
101f34040:     	mov	x1, x22
101f34044:     	bl	0x101f37bcc <__ZL17ui_apply_but_funcP8bContextP5uiBut>
101f34048:     	ldrsh	w8, [x22, #0x26]
101f3404c:     	str	w8, [x21, #0x28]
101f34050:     	mov	w8, #0x1                ; =1
101f34054:     	strb	w8, [x21, #0x2e]
101f34058:     	b	0x101f342b0 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x4b8>
101f3405c:     	bl	0x101f40b88 <__ZL24ui_multibut_states_applyP8bContextP18uiHandleButtonDataP7uiBlock>
101f34060:     	adrp	x8, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f34064:     	ldr	x8, [x8, #0x70]
101f34068:     	cbz	x8, 0x101f3411c <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x324>
101f3406c:     	ldr	x9, [x22, #0x8]
101f34070:     	fmov	d0, x8
101f34074:     	cnt.8b	v0, v0
101f34078:     	uaddlv.8b	h0, v0
101f3407c:     	fmov	w10, s0
101f34080:     	cmp	x10, #0x1
101f34084:     	b.hi	0x101f34094 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x29c>
101f34088:     	sub	x11, x8, #0x1
101f3408c:     	and	x11, x11, x9
101f34090:     	b	0x101f340a8 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x2b0>
101f34094:     	mov	x11, x9
101f34098:     	cmp	x9, x8
101f3409c:     	b.lo	0x101f340a8 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x2b0>
101f340a0:     	udiv	x11, x9, x8
101f340a4:     	msub	x11, x11, x8, x9
101f340a8:     	adrp	x12, 0x107f5b000 <__ZZNK7blender7CPPType14to_static_typeIJNS_18ColorSceneLinear4fILNS_6eAlphaE1EEENS_29ColorSceneLinearByteEncoded4bILS3_1EEEENS0_15TypeTagExecutorIZZL27transform_active_color_dataR4MeshNS_11FunctionRefIFvRS4_EEEENK3$_0clENS_10index_mask16IndexMaskSegmentEEUlT_E_EEEEvRKT0_E12callback_map+0x88>
101f340ac:     	ldr	x12, [x12, #0x68]
101f340b0:     	ldr	x12, [x12, x11, lsl #3]
101f340b4:     	cbz	x12, 0x101f3411c <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x324>
101f340b8:     	ldr	x12, [x12]
101f340bc:     	cbz	x12, 0x101f3411c <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x324>
101f340c0:     	sub	x13, x8, #0x1
101f340c4:     	b	0x101f340dc <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x2e4>
101f340c8:     	ldr	x14, [x12, #0x10]
101f340cc:     	cmp	x14, x9
101f340d0:     	b.eq	0x101f34114 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x31c>
101f340d4:     	ldr	x12, [x12]
101f340d8:     	cbz	x12, 0x101f3411c <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x324>
101f340dc:     	ldr	x14, [x12, #0x8]
101f340e0:     	cmp	x14, x9
101f340e4:     	b.eq	0x101f340c8 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x2d0>
101f340e8:     	cmp	x10, #0x1
101f340ec:     	b.hi	0x101f340f8 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x300>
101f340f0:     	and	x14, x14, x13
101f340f4:     	b	0x101f34108 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x310>
101f340f8:     	cmp	x14, x8
101f340fc:     	b.lo	0x101f34108 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x310>
101f34100:     	udiv	x15, x14, x8
101f34104:     	msub	x14, x15, x8, x14
101f34108:     	cmp	x14, x11
101f3410c:     	b.eq	0x101f340d4 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x2dc>
101f34110:     	b	0x101f3411c <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x324>
101f34114:     	ldrb	w8, [x12, #0x19d]
101f34118:     	tbnz	w8, #0x0, 0x101f34130 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x338>
101f3411c:     	ldp	d0, d1, [x21, #0x68]
101f34120:     	add	x2, x21, #0x140
101f34124:     	mov	x0, x19
101f34128:     	mov	x1, x22
101f3412c:     	bl	0x101f45200 <__ZL22ui_selectcontext_applyP8bContextP5uiButP20uiSelectContextStoredd>
101f34130:     	ldrb	w8, [x21, #0x2c]
101f34134:     	cmp	w8, #0x1
101f34138:     	b.ne	0x101f34148 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x350>
101f3413c:     	str	xzr, [x21, #0x70]
101f34140:     	str	xzr, [x21, #0x90]
101f34144:     	str	wzr, [x21, #0x8c]
101f34148:     	ldr	q0, [sp]
101f3414c:     	str	q0, [x23]
101f34150:     	str	x25, [x22, #0x3f8]
101f34154:     	cmp	w24, #0x19
101f34158:     	b.eq	0x101f3416c <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x374>
101f3415c:     	cmp	w24, #0x1b
101f34160:     	b.eq	0x101f3416c <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x374>
101f34164:     	cmp	w24, #0x1c
101f34168:     	b.ne	0x101f34170 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x378>
101f3416c:     	str	x26, [x22, #0x428]
101f34170:     	ldr	x21, [x21, #0x2e8]
101f34174:     	cbz	x21, 0x101f33ec8 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0xd0>
101f34178:     	add	x8, x20, #0x2e8
101f3417c:     	ldr	x9, [x21, #0x88]
101f34180:     	add	x10, x21, #0xf0
101f34184:     	cmp	x9, #0x0
101f34188:     	csel	x20, x8, x10, eq
101f3418c:     	cbz	x9, 0x101f341c0 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x3c8>
101f34190:     	cbz	x19, 0x101f33ec8 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0xd0>
101f34194:     	add	x1, x21, #0x20
101f34198:     	mov	x0, x19
101f3419c:     	bl	0x101f8f1cc <__Z27ui_ipad_action_origin_validP8bContextRKN7blender2ui4ipad12ActionOriginE>
101f341a0:     	cbz	w0, 0x101f33ec8 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0xd0>
101f341a4:     	ldr	x8, [x21, #0xe0]
101f341a8:     	cbz	x8, 0x101f33ec8 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0xd0>
101f341ac:     	ldr	x1, [x21, #0xe8]
101f341b0:     	ldr	x2, [x21, #0x18]
101f341b4:     	mov	x0, x19
101f341b8:     	blr	x8
101f341bc:     	cbz	w0, 0x101f33ec8 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0xd0>
101f341c0:     	ldp	x4, x2, [x20, #0x10]
101f341c4:     	ldr	x3, [x21, #0x18]
101f341c8:     	mov	x0, x19
101f341cc:     	mov	x1, x21
101f341d0:     	ldp	x29, x30, [sp, #0x50]
101f341d4:     	ldp	x20, x19, [sp, #0x40]
101f341d8:     	ldp	x22, x21, [sp, #0x30]
101f341dc:     	ldp	x24, x23, [sp, #0x20]
101f341e0:     	ldp	x26, x25, [sp, #0x10]
101f341e4:     	add	sp, sp, #0x60
101f341e8:     	br	x4
101f341ec:     	mov	x0, x19
101f341f0:     	mov	x1, x22
101f341f4:     	mov	x2, x21
101f341f8:     	bl	0x101f44d4c <__ZL16ui_apply_but_TOGP8bContextP5uiButP18uiHandleButtonData>
101f341fc:     	b	0x101f342b0 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x4b8>
101f34200:     	mov	x0, x19
101f34204:     	mov	x1, x22
101f34208:     	mov	x2, x21
101f3420c:     	bl	0x101f44fb0 <__ZL16ui_apply_but_NUMP8bContextP5uiButP18uiHandleButtonData>
101f34210:     	b	0x101f342b0 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x4b8>
101f34214:     	mov	x0, x19
101f34218:     	mov	x1, x22
101f3421c:     	mov	x2, x21
101f34220:     	bl	0x101f31128 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData>
101f34224:     	b	0x101f342b0 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x4b8>
101f34228:     	mov	x0, x19
101f3422c:     	mov	x1, x20
101f34230:     	mov	x2, x22
101f34234:     	mov	x3, x21
101f34238:     	bl	0x101f44dec <__ZL16ui_apply_but_ROWP8bContextP7uiBlockP5uiButP18uiHandleButtonData>
101f3423c:     	b	0x101f342b0 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x4b8>
101f34240:     	ldrb	w8, [x21, #0x2c]
101f34244:     	cmp	w8, #0x1
101f34248:     	b.ne	0x101f34260 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x468>
101f3424c:     	mov	x0, x19
101f34250:     	mov	x1, x22
101f34254:     	mov	x2, x21
101f34258:     	bl	0x101f450a8 <__ZL16ui_apply_but_VECP8bContextP5uiButP18uiHandleButtonData>
101f3425c:     	b	0x101f342b0 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x4b8>
101f34260:     	mov	x0, x19
101f34264:     	mov	x1, x22
101f34268:     	mov	x2, x21
101f3426c:     	bl	0x101f45040 <__ZL18ui_apply_but_BLOCKP8bContextP5uiButP18uiHandleButtonData>
101f34270:     	b	0x101f342b0 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x4b8>
101f34274:     	mov	x0, x19
101f34278:     	mov	x1, x22
101f3427c:     	mov	x2, x21
101f34280:     	bl	0x101f44f3c <__ZL16ui_apply_but_TABP8bContextP5uiButP18uiHandleButtonData>
101f34284:     	b	0x101f342b0 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x4b8>
101f34288:     	mov	x0, x19
101f3428c:     	mov	x1, x22
101f34290:     	mov	x2, x21
101f34294:     	bl	0x101f45104 <__ZL17ui_apply_but_BUTMP8bContextP5uiButP18uiHandleButtonData>
101f34298:     	b	0x101f342b0 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x4b8>
101f3429c:     	mov	x0, x19
101f342a0:     	mov	x1, x20
101f342a4:     	mov	x2, x22
101f342a8:     	mov	x3, x21
101f342ac:     	bl	0x101f44e90 <__ZL22ui_apply_but_VIEW_ITEMP8bContextP7uiBlockP5uiButP18uiHandleButtonData>
101f342b0:     	b	0x101f33fd0 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x1d8>
