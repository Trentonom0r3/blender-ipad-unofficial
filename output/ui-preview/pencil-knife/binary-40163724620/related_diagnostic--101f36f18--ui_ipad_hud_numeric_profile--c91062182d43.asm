
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f36f18 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField>:
101f36f18:     	sub	sp, sp, #0x1e0
101f36f1c:     	stp	x26, x25, [sp, #0x190]
101f36f20:     	stp	x24, x23, [sp, #0x1a0]
101f36f24:     	stp	x22, x21, [sp, #0x1b0]
101f36f28:     	stp	x20, x19, [sp, #0x1c0]
101f36f2c:     	stp	x29, x30, [sp, #0x1d0]
101f36f30:     	add	x29, sp, #0x1d0
101f36f34:     	mov	x19, x1
101f36f38:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
101f36f3c:     	ldr	x8, [x8, #0x7f0]
101f36f40:     	ldr	x8, [x8]
101f36f44:     	stur	x8, [x29, #-0x48]
101f36f48:     	ldr	x22, [x1, #0x420]
101f36f4c:     	add	x8, x22, #0x228
101f36f50:     	ldrsb	w9, [x22, #0x23f]
101f36f54:     	tbnz	w9, #0x1f, 0x101f36f64 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x4c>
101f36f58:     	cmp	w9, #0x10
101f36f5c:     	b.eq	0x101f36f74 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x5c>
101f36f60:     	b	0x101f36fb8 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0xa0>
101f36f64:     	ldr	x9, [x22, #0x230]
101f36f68:     	cmp	x9, #0x10
101f36f6c:     	b.ne	0x101f36fb8 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0xa0>
101f36f70:     	ldr	x8, [x8]
101f36f74:     	ldp	x9, x8, [x8]
101f36f78:     	mov	x10, #0x504f            ; =20559
101f36f7c:     	movk	x10, #0x5245, lsl #16
101f36f80:     	movk	x10, #0x5441, lsl #32
101f36f84:     	movk	x10, #0x524f, lsl #48
101f36f88:     	cmp	x9, x10
101f36f8c:     	mov	x9, #0x505f             ; =20575
101f36f90:     	movk	x9, #0x5f54, lsl #16
101f36f94:     	movk	x9, #0x6572, lsl #32
101f36f98:     	movk	x9, #0x6f64, lsl #48
101f36f9c:     	ccmp	x8, x9, #0x0, eq
101f36fa0:     	b.ne	0x101f36fb8 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0xa0>
101f36fa4:     	ldr	x8, [x22, #0x2d8]
101f36fa8:     	adrp	x9, 0x101662000 <__Z29ED_undo_is_memfile_compatiblePK8bContext+0x44>
101f36fac:     	add	x9, x9, #0x84c
101f36fb0:     	cmp	x8, x9
101f36fb4:     	b.eq	0x101f36ff4 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0xdc>
101f36fb8:     	mov	w25, #0x0               ; =0
101f36fbc:     	ldur	x8, [x29, #-0x48]
101f36fc0:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
101f36fc4:     	ldr	x9, [x9, #0x7f0]
101f36fc8:     	ldr	x9, [x9]
101f36fcc:     	cmp	x9, x8
101f36fd0:     	b.ne	0x101f372d8 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x3c0>
101f36fd4:     	and	w0, w25, #0x1
101f36fd8:     	ldp	x29, x30, [sp, #0x1d0]
101f36fdc:     	ldp	x20, x19, [sp, #0x1c0]
101f36fe0:     	ldp	x22, x21, [sp, #0x1b0]
101f36fe4:     	ldp	x24, x23, [sp, #0x1a0]
101f36fe8:     	ldp	x26, x25, [sp, #0x190]
101f36fec:     	add	sp, sp, #0x1e0
101f36ff0:     	ret
101f36ff4:     	ldr	x8, [x19, #0x258]
101f36ff8:     	cbz	x8, 0x101f36fb8 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0xa0>
101f36ffc:     	mov	x24, x2
101f37000:     	mov	x20, x0
101f37004:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101f37008:     	cbz	x0, 0x101f36fb8 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0xa0>
101f3700c:     	mov	x21, x0
101f37010:     	ldr	x8, [x0, #0x5c0]
101f37014:     	cbz	x8, 0x101f36fb8 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0xa0>
101f37018:     	mov	x0, x20
101f3701c:     	bl	0x100b82374 <__Z21WM_operator_last_redoPK8bContext>
101f37020:     	cbz	x0, 0x101f36fb8 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0xa0>
101f37024:     	mov	x20, x0
101f37028:     	ldr	x8, [x21, #0x5c0]
101f3702c:     	add	x0, x8, #0x68
101f37030:     	mov	x1, x20
101f37034:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101f37038:     	cmn	w0, #0x1
101f3703c:     	b.eq	0x101f36fb8 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0xa0>
101f37040:     	ldr	x8, [x22, #0x2e0]
101f37044:     	cmp	x8, x20
101f37048:     	b.ne	0x101f36fb8 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0xa0>
101f3704c:     	ldr	x8, [x19, #0x1f8]
101f37050:     	cmp	x8, x21
101f37054:     	b.ne	0x101f36fb8 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0xa0>
101f37058:     	mov	w8, #0x100              ; =256
101f3705c:     	str	w8, [sp, #0x3c]
101f37060:     	add	x2, sp, #0x3c
101f37064:     	mov	x0, x20
101f37068:     	mov	x1, x19
101f3706c:     	mov	w3, #0x0                ; =0
101f37070:     	bl	0x101f37524 <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii>
101f37074:     	mov	x21, x0
101f37078:     	cbz	x0, 0x101f36fb8 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0xa0>
101f3707c:     	ldr	x0, [x21, #0x58]
101f37080:     	add	x8, sp, #0x8
101f37084:     	bl	0x101f37488 <__ZL24ui_ipad_operator_capturePK14wmOperatorType>
101f37088:     	ldr	x8, [sp, #0x10]
101f3708c:     	cbz	x8, 0x101f371a8 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x290>
101f37090:     	add	x0, sp, #0x8
101f37094:     	bl	0x101f3764c <__ZL24ui_ipad_operator_resolveRK21uiIPadOperatorReceipt>
101f37098:     	cbz	x0, 0x101f371a8 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x290>
101f3709c:     	str	x0, [sp]
101f370a0:     	movi.16b	v0, #0x0
101f370a4:     	stp	q0, q0, [sp, #0x70]
101f370a8:     	add	x8, sp, #0x40
101f370ac:     	add	x9, sp, #0x40
101f370b0:     	add	x10, x9, #0x30
101f370b4:     	stp	q0, q0, [sp, #0x50]
101f370b8:     	str	q0, [sp, #0x40]
101f370bc:     	add	x11, x9, #0x50
101f370c0:     	stp	x10, x10, [sp, #0x58]
101f370c4:     	str	x11, [sp, #0x68]
101f370c8:     	add	x10, x9, #0x88
101f370cc:     	stur	q0, [x8, #0x68]
101f370d0:     	stur	q0, [x8, #0x78]
101f370d4:     	stur	q0, [x8, #0x58]
101f370d8:     	stur	q0, [x8, #0x88]
101f370dc:     	stur	q0, [x8, #0x98]
101f370e0:     	str	xzr, [sp, #0x90]
101f370e4:     	stp	x10, x10, [sp, #0xb0]
101f370e8:     	add	x11, x9, #0xa8
101f370ec:     	str	x11, [sp, #0xc0]
101f370f0:     	add	x10, x9, #0x118
101f370f4:     	stp	q0, q0, [x8, #0xb0]
101f370f8:     	stp	q0, q0, [x8, #0xd0]
101f370fc:     	stp	q0, q0, [x8, #0xf0]
101f37100:     	stp	q0, q0, [x8, #0x110]
101f37104:     	str	q0, [x8, #0x130]
101f37108:     	str	xzr, [sp, #0xe8]
101f3710c:     	stp	x10, x10, [sp, #0x140]
101f37110:     	add	x8, x9, #0x138
101f37114:     	str	x8, [sp, #0x150]
101f37118:     	strb	wzr, [sp, #0x180]
101f3711c:     	ldr	x22, [x21, #0x70]
101f37120:     	ldr	x0, [x22, #0x8]
101f37124:     	bl	0x10124f400 <__Z28RNA_struct_iterator_propertyP9StructRNA>
101f37128:     	mov	x1, x0
101f3712c:     	add	x2, sp, #0x40
101f37130:     	mov	x0, x22
101f37134:     	bl	0x10124fe94 <__Z29RNA_property_collection_beginP10PointerRNAP11PropertyRNAP26CollectionPropertyIterator>
101f37138:     	ldrb	w8, [sp, #0x180]
101f3713c:     	cmp	w8, #0x1
101f37140:     	b.ne	0x101f37160 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x248>
101f37144:     	ldr	x22, [sp, #0x138]
101f37148:     	ldr	x8, [x19, #0x258]
101f3714c:     	cmp	x22, x8
101f37150:     	b.eq	0x101f37164 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x24c>
101f37154:     	add	x0, sp, #0x40
101f37158:     	bl	0x10125012c <__Z28RNA_property_collection_nextP26CollectionPropertyIterator>
101f3715c:     	b	0x101f37138 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x220>
101f37160:     	mov	x22, #0x0               ; =0
101f37164:     	add	x0, sp, #0x40
101f37168:     	bl	0x101250248 <__Z27RNA_property_collection_endP26CollectionPropertyIterator>
101f3716c:     	add	x0, sp, #0x40
101f37170:     	bl	0x1000b3b20 <__ZN26CollectionPropertyIteratorD1Ev>
101f37174:     	cbz	x22, 0x101f371a8 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x290>
101f37178:     	ldr	x0, [x21, #0x70]
101f3717c:     	mov	x1, x22
101f37180:     	bl	0x101251088 <__Z25RNA_property_array_lengthP10PointerRNAP11PropertyRNA>
101f37184:     	mov	x23, x0
101f37188:     	ldr	w8, [x19, #0x260]
101f3718c:     	cbz	w0, 0x101f371a4 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x28c>
101f37190:     	mov	w25, #0x0               ; =0
101f37194:     	tbnz	w8, #0x1f, 0x101f371ac <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x294>
101f37198:     	cmp	w8, w23
101f3719c:     	b.lt	0x101f371c0 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x2a8>
101f371a0:     	b	0x101f371ac <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x294>
101f371a4:     	cbz	w8, 0x101f371c0 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x2a8>
101f371a8:     	mov	w25, #0x0               ; =0
101f371ac:     	ldrsb	w8, [sp, #0x37]
101f371b0:     	tbz	w8, #0x1f, 0x101f36fbc <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0xa4>
101f371b4:     	ldr	x0, [sp, #0x20]
101f371b8:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f371bc:     	b	0x101f36fbc <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0xa4>
101f371c0:     	str	x20, [x24, #0xd0]
101f371c4:     	mov	x0, x20
101f371c8:     	bl	0x100b42da0 <__Z29WM_operator_touch_lifetime_idPK10wmOperator>
101f371cc:     	stp	x0, x21, [x24, #0xd8]
101f371d0:     	mov	x0, x21
101f371d4:     	bl	0x100b42da0 <__Z29WM_operator_touch_lifetime_idPK10wmOperator>
101f371d8:     	str	x0, [x24, #0xe8]
101f371dc:     	ldur	q0, [sp, #0x8]
101f371e0:     	str	q0, [x24, #0xf0]
101f371e4:     	ldr	x9, [sp, #0x18]
101f371e8:     	str	x9, [x24, #0x100]
101f371ec:     	add	x9, sp, #0x8
101f371f0:     	add	x0, x24, #0x108
101f371f4:     	add	x1, x9, #0x18
101f371f8:     	bl	0x104b70f64 <_zlibVersion+0x104b70f64>
101f371fc:     	ldr	x8, [x21, #0x50]
101f37200:     	stp	x8, x22, [x24, #0x150]
101f37204:     	mov	x0, x22
101f37208:     	bl	0x101250c80 <__Z23RNA_property_identifierPK11PropertyRNA>
101f3720c:     	mov	x1, x0
101f37210:     	add	x0, x24, #0x160
101f37214:     	bl	0x104b70ec8 <_zlibVersion+0x104b70ec8>
101f37218:     	ldr	w8, [x19, #0x260]
101f3721c:     	str	w8, [x24, #0x178]
101f37220:     	str	w23, [x24, #0x17c]
101f37224:     	mov	x0, x22
101f37228:     	bl	0x10124f7f8 <__Z17RNA_property_typeP11PropertyRNA>
101f3722c:     	str	w0, [x24, #0x180]
101f37230:     	ldr	x9, [x24, #0xd8]
101f37234:     	cmp	x9, #0x0
101f37238:     	ldr	x9, [x24, #0xe8]
101f3723c:     	ccmp	x9, #0x0, #0x4, ne
101f37240:     	cset	w9, ne
101f37244:     	strb	w9, [x24, #0x184]
101f37248:     	b.eq	0x101f37258 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x340>
101f3724c:     	ldr	x8, [sp]
101f37250:     	ldr	x8, [x8, #0xc8]
101f37254:     	cbz	x8, 0x101f37270 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x358>
101f37258:     	mov	w8, #0x0                ; =0
101f3725c:     	strb	w8, [x24, #0x185]
101f37260:     	ldrb	w25, [x24, #0x184]
101f37264:     	ldrsb	w8, [sp, #0x37]
101f37268:     	tbz	w8, #0x1f, 0x101f36fbc <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0xa4>
101f3726c:     	b	0x101f371b4 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x29c>
101f37270:     	ldrb	w9, [x19, #0x21]
101f37274:     	and	w9, w9, #0xfe
101f37278:     	cmp	w9, #0x6
101f3727c:     	b.ne	0x101f3725c <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x344>
101f37280:     	sub	w9, w0, #0x1
101f37284:     	cmp	w9, #0x1
101f37288:     	b.hi	0x101f3725c <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x344>
101f3728c:     	mov	x0, x22
101f37290:     	bl	0x101250ec0 <__Z17RNA_property_flagP11PropertyRNA>
101f37294:     	tbz	w0, #0xa, 0x101f37258 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x340>
101f37298:     	ldr	x8, [x19, #0xa0]
101f3729c:     	cbnz	x8, 0x101f37258 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x340>
101f372a0:     	ldr	x8, [x19, #0xd8]
101f372a4:     	cbnz	x8, 0x101f37258 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x340>
101f372a8:     	ldr	x8, [x19, #0xd0]
101f372ac:     	cbnz	x8, 0x101f37258 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x340>
101f372b0:     	ldr	x8, [x19, #0x3b0]
101f372b4:     	cbnz	x8, 0x101f37258 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x340>
101f372b8:     	ldr	x8, [x19, #0x110]
101f372bc:     	cbnz	x8, 0x101f37258 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x340>
101f372c0:     	ldr	x8, [x19, #0x140]
101f372c4:     	cbnz	x8, 0x101f37258 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x340>
101f372c8:     	ldr	x8, [x19, #0x98]
101f372cc:     	cmp	x8, #0x0
101f372d0:     	cset	w8, eq
101f372d4:     	b	0x101f3725c <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x344>
101f372d8:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
101f372dc:     	b	0x101f372e0 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x3c8>
101f372e0:     	mov	x19, x0
101f372e4:     	b	0x101f37304 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x3ec>
101f372e8:     	b	0x101f372f8 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x3e0>
101f372ec:     	mov	x19, x0
101f372f0:     	mov	x0, x19
101f372f4:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
101f372f8:     	mov	x19, x0
101f372fc:     	add	x0, sp, #0x40
101f37300:     	bl	0x1000b3b20 <__ZN26CollectionPropertyIteratorD1Ev>
101f37304:     	ldrsb	w8, [sp, #0x37]
101f37308:     	tbz	w8, #0x1f, 0x101f37314 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField+0x3fc>
101f3730c:     	ldr	x0, [sp, #0x20]
101f37310:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f37314:     	mov	x0, x19
101f37318:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
