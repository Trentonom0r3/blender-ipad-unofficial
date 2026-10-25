
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f10fb0 <__Z30UI_block_discard_named_rebuildPK8bContextP7ARegionPKc>:
101f10fb0:     	sub	sp, sp, #0x70
101f10fb4:     	stp	x26, x25, [sp, #0x20]
101f10fb8:     	stp	x24, x23, [sp, #0x30]
101f10fbc:     	stp	x22, x21, [sp, #0x40]
101f10fc0:     	stp	x20, x19, [sp, #0x50]
101f10fc4:     	stp	x29, x30, [sp, #0x60]
101f10fc8:     	add	x29, sp, #0x60
101f10fcc:     	mov	x22, x2
101f10fd0:     	mov	x19, x1
101f10fd4:     	mov	x20, x0
101f10fd8:     	ldr	x25, [x1, #0x128]
101f10fdc:     	mov	x0, x2
101f10fe0:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f10fe4:     	mov	x8, #0x7ffffffffffffff8 ; =9223372036854775800
101f10fe8:     	cmp	x0, x8
101f10fec:     	b.hs	0x101f110ac <__Z30UI_block_discard_named_rebuildPK8bContextP7ARegionPKc+0xfc>
101f10ff0:     	mov	x21, x0
101f10ff4:     	cmp	x0, #0x17
101f10ff8:     	b.hs	0x101f1100c <__Z30UI_block_discard_named_rebuildPK8bContextP7ARegionPKc+0x5c>
101f10ffc:     	strb	w21, [sp, #0x1f]
101f11000:     	add	x23, sp, #0x8
101f11004:     	cbnz	x21, 0x101f11034 <__Z30UI_block_discard_named_rebuildPK8bContextP7ARegionPKc+0x84>
101f11008:     	b	0x101f11044 <__Z30UI_block_discard_named_rebuildPK8bContextP7ARegionPKc+0x94>
101f1100c:     	orr	x8, x21, #0x7
101f11010:     	cmp	x8, #0x17
101f11014:     	mov	w9, #0x19               ; =25
101f11018:     	csinc	x24, x9, x8, eq
101f1101c:     	mov	x0, x24
101f11020:     	bl	0x104b714e0 <_zlibVersion+0x104b714e0>
101f11024:     	mov	x23, x0
101f11028:     	orr	x8, x24, #0x8000000000000000
101f1102c:     	stp	x21, x8, [sp, #0x10]
101f11030:     	str	x0, [sp, #0x8]
101f11034:     	mov	x0, x23
101f11038:     	mov	x1, x22
101f1103c:     	mov	x2, x21
101f11040:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
101f11044:     	strb	wzr, [x23, x21]
101f11048:     	add	x0, x25, #0xf0
101f1104c:     	add	x1, sp, #0x8
101f11050:     	bl	0x10007e064 <__ZNK7blender3MapINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEyLx4ENS_21PythonProbingStrategyILy1ELb0EEENS_11DefaultHashIS7_EENS_15DefaultEqualityIS7_EENS_13SimpleMapSlotIS7_yEENS_16GuardedAllocatorEE13lookup_ptr_asIS7_EEPKyRKT_>
101f11054:     	cbz	x0, 0x101f1109c <__Z30UI_block_discard_named_rebuildPK8bContextP7ARegionPKc+0xec>
101f11058:     	ldr	x21, [x0]
101f1105c:     	ldrsb	w8, [sp, #0x1f]
101f11060:     	tbz	w8, #0x1f, 0x101f1106c <__Z30UI_block_discard_named_rebuildPK8bContextP7ARegionPKc+0xbc>
101f11064:     	ldr	x0, [sp, #0x8]
101f11068:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f1106c:     	cbz	x21, 0x101f11080 <__Z30UI_block_discard_named_rebuildPK8bContextP7ARegionPKc+0xd0>
101f11070:     	mov	x0, x20
101f11074:     	mov	x1, x19
101f11078:     	mov	x2, x21
101f1107c:     	bl	0x101f10e30 <__Z24UI_block_discard_rebuildPK8bContextP7ARegionP7uiBlock>
101f11080:     	ldp	x29, x30, [sp, #0x60]
101f11084:     	ldp	x20, x19, [sp, #0x50]
101f11088:     	ldp	x22, x21, [sp, #0x40]
101f1108c:     	ldp	x24, x23, [sp, #0x30]
101f11090:     	ldp	x26, x25, [sp, #0x20]
101f11094:     	add	sp, sp, #0x70
101f11098:     	ret
101f1109c:     	mov	x21, #0x0               ; =0
101f110a0:     	ldrsb	w8, [sp, #0x1f]
101f110a4:     	tbz	w8, #0x1f, 0x101f1106c <__Z30UI_block_discard_named_rebuildPK8bContextP7ARegionPKc+0xbc>
101f110a8:     	b	0x101f11064 <__Z30UI_block_discard_named_rebuildPK8bContextP7ARegionPKc+0xb4>
101f110ac:     	add	x0, sp, #0x8
101f110b0:     	bl	0x100023e44 <__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne190102Ev>
101f110b4:     	mov	x19, x0
101f110b8:     	ldrsb	w8, [sp, #0x1f]
101f110bc:     	tbz	w8, #0x1f, 0x101f110c8 <__Z30UI_block_discard_named_rebuildPK8bContextP7ARegionPKc+0x118>
101f110c0:     	ldr	x0, [sp, #0x8]
101f110c4:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f110c8:     	mov	x0, x19
101f110cc:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
