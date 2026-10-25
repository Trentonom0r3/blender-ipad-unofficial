
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f2ec10 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b>:
101f2ec10:     	sub	sp, sp, #0x1d0
101f2ec14:     	stp	x24, x23, [sp, #0x190]
101f2ec18:     	stp	x22, x21, [sp, #0x1a0]
101f2ec1c:     	stp	x20, x19, [sp, #0x1b0]
101f2ec20:     	stp	x29, x30, [sp, #0x1c0]
101f2ec24:     	add	x29, sp, #0x1c0
101f2ec28:     	mov	x21, x3
101f2ec2c:     	mov	x19, x2
101f2ec30:     	mov	x20, x1
101f2ec34:     	mov	x22, x0
101f2ec38:     	stur	xzr, [x29, #-0x38]
101f2ec3c:     	sub	x2, x29, #0x38
101f2ec40:     	bl	0x101f36ac0 <__ZL24ui_ipad_hud_field_buttonP8bContextRK14uiIPadHUDFieldPP7ARegion>
101f2ec44:     	cbz	x0, 0x101f2f004 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x3f4>
101f2ec48:     	mov	x23, x0
101f2ec4c:     	mov	x0, sp
101f2ec50:     	mov	x1, x20
101f2ec54:     	bl	0x101f368e0 <__ZN14uiIPadHUDFieldC2ERKS_>
101f2ec58:     	ldur	x2, [x29, #-0x38]
101f2ec5c:     	mov	x3, sp
101f2ec60:     	mov	x0, x22
101f2ec64:     	mov	x1, x23
101f2ec68:     	bl	0x101f36c80 <__ZL23ui_ipad_hud_field_worldP8bContextP5uiButP7ARegionR14uiIPadHUDField>
101f2ec6c:     	tbz	w0, #0x0, 0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ec70:     	ldrb	w8, [x20, #0x184]
101f2ec74:     	cmp	w8, #0x1
101f2ec78:     	b.ne	0x101f2ec98 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x88>
101f2ec7c:     	mov	x2, sp
101f2ec80:     	mov	x0, x22
101f2ec84:     	mov	x1, x23
101f2ec88:     	bl	0x101f36f18 <__ZL27ui_ipad_hud_numeric_profileP8bContextP5uiButR14uiIPadHUDField>
101f2ec8c:     	cbz	w0, 0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ec90:     	ldrb	w8, [x20, #0x184]
101f2ec94:     	tbnz	w8, #0x0, 0x101f2ecc4 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0xb4>
101f2ec98:     	ldr	x8, [x23, #0x420]
101f2ec9c:     	ldr	x8, [x8, #0x418]
101f2eca0:     	cbz	x8, 0x101f2ecc4 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0xb4>
101f2eca4:     	mov	x0, x22
101f2eca8:     	mov	x1, x23
101f2ecac:     	bl	0x101f093c4 <__Z33ui_ipad_but_self_callback_allowedP8bContextP5uiBut>
101f2ecb0:     	cbz	w0, 0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ecb4:     	mov	x0, x22
101f2ecb8:     	mov	x1, x23
101f2ecbc:     	bl	0x101f08f2c <__Z22ui_ipad_but_rna_rebindP8bContextP5uiBut>
101f2ecc0:     	cbz	w0, 0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ecc4:     	ldr	x8, [x20, #0x10]
101f2ecc8:     	ldr	x9, [sp, #0x10]
101f2eccc:     	cmp	x8, x9
101f2ecd0:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ecd4:     	ldr	x8, [x20, #0x18]
101f2ecd8:     	ldr	x9, [sp, #0x18]
101f2ecdc:     	cmp	x8, x9
101f2ece0:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ece4:     	ldr	x8, [x20, #0x20]
101f2ece8:     	ldr	x9, [sp, #0x20]
101f2ecec:     	cmp	x8, x9
101f2ecf0:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ecf4:     	ldr	w8, [x20, #0xc0]
101f2ecf8:     	ldr	w9, [sp, #0xc0]
101f2ecfc:     	cmp	w8, w9
101f2ed00:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ed04:     	ldr	w8, [x20, #0xc4]
101f2ed08:     	ldr	w9, [sp, #0xc4]
101f2ed0c:     	cmp	w8, w9
101f2ed10:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ed14:     	ldr	s0, [x20, #0xc8]
101f2ed18:     	ldr	s1, [sp, #0xc8]
101f2ed1c:     	fcmp	s0, s1
101f2ed20:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ed24:     	mov	x22, sp
101f2ed28:     	add	x0, x20, #0x90
101f2ed2c:     	add	x1, x22, #0x90
101f2ed30:     	bl	0x101f1b358 <__ZNSt3__1neB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EESB_>
101f2ed34:     	tbnz	w0, #0x0, 0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ed38:     	ldr	x8, [x20, #0xd0]
101f2ed3c:     	ldr	x9, [sp, #0xd0]
101f2ed40:     	cmp	x8, x9
101f2ed44:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ed48:     	ldr	x8, [x20, #0xd8]
101f2ed4c:     	ldr	x9, [sp, #0xd8]
101f2ed50:     	cmp	x8, x9
101f2ed54:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ed58:     	ldr	x8, [x20, #0x120]
101f2ed5c:     	ldr	x9, [sp, #0x120]
101f2ed60:     	cmp	x8, x9
101f2ed64:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ed68:     	ldr	x8, [x20, #0x128]
101f2ed6c:     	ldr	x9, [sp, #0x128]
101f2ed70:     	cmp	x8, x9
101f2ed74:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ed78:     	ldr	x8, [x20, #0x130]
101f2ed7c:     	ldr	x9, [sp, #0x130]
101f2ed80:     	cmp	x8, x9
101f2ed84:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ed88:     	tbz	w21, #0x0, 0x101f2f00c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x3fc>
101f2ed8c:     	mov	x8, sp
101f2ed90:     	add	x0, x20, #0x28
101f2ed94:     	add	x1, x8, #0x28
101f2ed98:     	mov	w2, #0x68               ; =104
101f2ed9c:     	bl	0x104b72368 <_zlibVersion+0x104b72368>
101f2eda0:     	cbnz	w0, 0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2eda4:     	ldr	x8, [x20, #0xa8]
101f2eda8:     	ldr	x9, [sp, #0xa8]
101f2edac:     	cmp	x8, x9
101f2edb0:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2edb4:     	ldr	x8, [x20, #0xb0]
101f2edb8:     	ldr	x9, [sp, #0xb0]
101f2edbc:     	cmp	x8, x9
101f2edc0:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2edc4:     	ldr	x8, [x20, #0xb8]
101f2edc8:     	ldr	x9, [sp, #0xb8]
101f2edcc:     	cmp	x8, x9
101f2edd0:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2edd4:     	ldrb	w8, [x20, #0x184]
101f2edd8:     	cmp	w8, #0x1
101f2eddc:     	b.ne	0x101f2eeb0 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x2a0>
101f2ede0:     	ldrb	w8, [sp, #0x184]
101f2ede4:     	cmp	w8, #0x1
101f2ede8:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2edec:     	ldrb	w8, [x20, #0x185]
101f2edf0:     	ldrb	w9, [sp, #0x185]
101f2edf4:     	cmp	w8, w9
101f2edf8:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2edfc:     	ldr	x8, [x20, #0xe0]
101f2ee00:     	ldr	x9, [sp, #0xe0]
101f2ee04:     	cmp	x8, x9
101f2ee08:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ee0c:     	ldr	x8, [x20, #0xe8]
101f2ee10:     	ldr	x9, [sp, #0xe8]
101f2ee14:     	cmp	x8, x9
101f2ee18:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ee1c:     	ldr	x8, [x20, #0xf0]
101f2ee20:     	ldr	x9, [sp, #0xf0]
101f2ee24:     	cmp	x8, x9
101f2ee28:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ee2c:     	ldr	x8, [x20, #0xf8]
101f2ee30:     	ldr	x9, [sp, #0xf8]
101f2ee34:     	cmp	x8, x9
101f2ee38:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ee3c:     	ldr	x8, [x20, #0x100]
101f2ee40:     	ldr	x9, [sp, #0x100]
101f2ee44:     	cmp	x8, x9
101f2ee48:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ee4c:     	ldr	x8, [x20, #0x150]
101f2ee50:     	ldr	x9, [sp, #0x150]
101f2ee54:     	cmp	x8, x9
101f2ee58:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ee5c:     	ldr	x8, [x20, #0x158]
101f2ee60:     	ldr	x9, [sp, #0x158]
101f2ee64:     	cmp	x8, x9
101f2ee68:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ee6c:     	mov	x8, sp
101f2ee70:     	add	x0, x20, #0x160
101f2ee74:     	add	x1, x8, #0x160
101f2ee78:     	bl	0x101f37758 <__ZNSt3__1eqB8ne190102INS_9allocatorIcEEEEbRKNS_12basic_stringIcNS_11char_traitsIcEET_EES9_>
101f2ee7c:     	cbz	w0, 0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ee80:     	ldr	w8, [x20, #0x178]
101f2ee84:     	ldr	w9, [sp, #0x178]
101f2ee88:     	cmp	w8, w9
101f2ee8c:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2ee90:     	ldr	w8, [x20, #0x17c]
101f2ee94:     	ldr	w9, [sp, #0x17c]
101f2ee98:     	cmp	w8, w9
101f2ee9c:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2eea0:     	ldr	w8, [x20, #0x180]
101f2eea4:     	ldr	w9, [sp, #0x180]
101f2eea8:     	cmp	w8, w9
101f2eeac:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2eeb0:     	cbz	x19, 0x101f2effc <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x3ec>
101f2eeb4:     	mov	x20, sp
101f2eeb8:     	ldp	q0, q1, [sp, #0x60]
101f2eebc:     	stp	q0, q1, [x19, #0x60]
101f2eec0:     	ldr	q0, [sp, #0x80]
101f2eec4:     	str	q0, [x19, #0x80]
101f2eec8:     	ldp	q0, q1, [sp, #0x20]
101f2eecc:     	stp	q0, q1, [x19, #0x20]
101f2eed0:     	ldp	q1, q0, [sp, #0x40]
101f2eed4:     	stp	q1, q0, [x19, #0x40]
101f2eed8:     	ldp	q1, q0, [sp]
101f2eedc:     	stp	q1, q0, [x19]
101f2eee0:     	ldrsb	w8, [x19, #0xa7]
101f2eee4:     	tbz	w8, #0x1f, 0x101f2eef0 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x2e0>
101f2eee8:     	ldur	x0, [x19, #0x90]
101f2eeec:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2eef0:     	mov	x21, sp
101f2eef4:     	ldur	q0, [x22, #0x90]
101f2eef8:     	stur	q0, [x19, #0x90]
101f2eefc:     	ldur	x8, [x22, #0xa0]
101f2ef00:     	stur	x8, [x19, #0xa0]
101f2ef04:     	strb	wzr, [sp, #0xa7]
101f2ef08:     	strb	wzr, [sp, #0x90]
101f2ef0c:     	ldur	q0, [x20, #0xb8]
101f2ef10:     	stur	q0, [x19, #0xb8]
101f2ef14:     	ldur	q0, [x20, #0xc8]
101f2ef18:     	stur	q0, [x19, #0xc8]
101f2ef1c:     	ldur	q0, [x20, #0xd8]
101f2ef20:     	stur	q0, [x19, #0xd8]
101f2ef24:     	ldr	x8, [sp, #0xe8]
101f2ef28:     	str	x8, [x19, #0xe8]
101f2ef2c:     	ldur	q0, [x20, #0xa8]
101f2ef30:     	stur	q0, [x19, #0xa8]
101f2ef34:     	ldr	q0, [sp, #0xf0]
101f2ef38:     	ldr	x8, [sp, #0x100]
101f2ef3c:     	str	x8, [x19, #0x100]
101f2ef40:     	str	q0, [x19, #0xf0]
101f2ef44:     	add	x22, x19, #0x108
101f2ef48:     	ldrsb	w8, [x19, #0x11f]
101f2ef4c:     	tbz	w8, #0x1f, 0x101f2ef58 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x348>
101f2ef50:     	ldr	x0, [x22]
101f2ef54:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2ef58:     	mov	x20, sp
101f2ef5c:     	ldr	x8, [sp, #0x118]
101f2ef60:     	add	x9, x20, #0x108
101f2ef64:     	str	x8, [x22, #0x10]
101f2ef68:     	ldr	q0, [x9]
101f2ef6c:     	str	q0, [x22]
101f2ef70:     	strb	wzr, [sp, #0x11f]
101f2ef74:     	strb	wzr, [sp, #0x108]
101f2ef78:     	ldr	q0, [x21, #0x120]
101f2ef7c:     	str	q0, [x19, #0x120]
101f2ef80:     	ldr	x8, [x21, #0x130]
101f2ef84:     	str	x8, [x19, #0x130]
101f2ef88:     	add	x21, x19, #0x138
101f2ef8c:     	ldrsb	w8, [x19, #0x14f]
101f2ef90:     	tbz	w8, #0x1f, 0x101f2ef9c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x38c>
101f2ef94:     	ldr	x0, [x21]
101f2ef98:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2ef9c:     	add	x8, x20, #0x138
101f2efa0:     	ldr	x9, [sp, #0x148]
101f2efa4:     	str	x9, [x21, #0x10]
101f2efa8:     	ldr	q0, [x8]
101f2efac:     	str	q0, [x21]
101f2efb0:     	strb	wzr, [sp, #0x14f]
101f2efb4:     	strb	wzr, [sp, #0x138]
101f2efb8:     	ldr	q0, [sp, #0x150]
101f2efbc:     	str	q0, [x19, #0x150]
101f2efc0:     	ldrsb	w8, [x19, #0x177]
101f2efc4:     	tbz	w8, #0x1f, 0x101f2efd0 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x3c0>
101f2efc8:     	ldr	x0, [x19, #0x160]
101f2efcc:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2efd0:     	ldr	q0, [sp, #0x160]
101f2efd4:     	str	q0, [x19, #0x160]
101f2efd8:     	ldp	x8, x9, [sp, #0x170]
101f2efdc:     	strb	wzr, [sp, #0x177]
101f2efe0:     	strb	wzr, [sp, #0x160]
101f2efe4:     	add	x10, x19, #0x178
101f2efe8:     	mov	x11, sp
101f2efec:     	add	x11, x11, #0x178
101f2eff0:     	stp	x8, x9, [x19, #0x170]
101f2eff4:     	ldur	x8, [x11, #0x7]
101f2eff8:     	stur	x8, [x10, #0x7]
101f2effc:     	mov	w19, #0x1               ; =1
101f2f000:     	b	0x101f2f0a0 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x490>
101f2f004:     	mov	w19, #0x0               ; =0
101f2f008:     	b	0x101f2f0c0 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x4b0>
101f2f00c:     	ldur	x8, [x20, #0x28]
101f2f010:     	ldr	x9, [sp, #0x28]
101f2f014:     	cmp	x8, x9
101f2f018:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2f01c:     	ldr	x8, [x20, #0x30]
101f2f020:     	ldr	x9, [sp, #0x30]
101f2f024:     	cmp	x8, x9
101f2f028:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2f02c:     	ldr	x8, [x20, #0x38]
101f2f030:     	ldr	x9, [sp, #0x38]
101f2f034:     	cmp	x8, x9
101f2f038:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2f03c:     	ldr	x8, [x20, #0x40]
101f2f040:     	ldr	x9, [sp, #0x40]
101f2f044:     	cmp	x8, x9
101f2f048:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2f04c:     	ldr	x8, [x20, #0x48]
101f2f050:     	ldr	x9, [sp, #0x48]
101f2f054:     	cmp	x8, x9
101f2f058:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2f05c:     	ldr	x8, [x20, #0x50]
101f2f060:     	ldr	x9, [sp, #0x50]
101f2f064:     	cmp	x8, x9
101f2f068:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2f06c:     	ldr	x8, [x20, #0x70]
101f2f070:     	ldr	x9, [sp, #0x70]
101f2f074:     	cmp	x8, x9
101f2f078:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2f07c:     	ldr	x8, [x20, #0x80]
101f2f080:     	ldr	x9, [sp, #0x80]
101f2f084:     	cmp	x8, x9
101f2f088:     	b.ne	0x101f2f09c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x48c>
101f2f08c:     	ldr	x8, [x20, #0x88]
101f2f090:     	ldr	x9, [sp, #0x88]
101f2f094:     	cmp	x8, x9
101f2f098:     	b.eq	0x101f2edd4 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x1c4>
101f2f09c:     	mov	w19, #0x0               ; =0
101f2f0a0:     	ldrsb	w8, [sp, #0x177]
101f2f0a4:     	tbnz	w8, #0x1f, 0x101f2f0dc <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x4cc>
101f2f0a8:     	ldrsb	w8, [sp, #0x14f]
101f2f0ac:     	tbnz	w8, #0x1f, 0x101f2f0ec <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x4dc>
101f2f0b0:     	ldrsb	w8, [sp, #0x11f]
101f2f0b4:     	tbnz	w8, #0x1f, 0x101f2f0fc <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x4ec>
101f2f0b8:     	ldrsb	w8, [sp, #0xa7]
101f2f0bc:     	tbnz	w8, #0x1f, 0x101f2f10c <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x4fc>
101f2f0c0:     	mov	x0, x19
101f2f0c4:     	ldp	x29, x30, [sp, #0x1c0]
101f2f0c8:     	ldp	x20, x19, [sp, #0x1b0]
101f2f0cc:     	ldp	x22, x21, [sp, #0x1a0]
101f2f0d0:     	ldp	x24, x23, [sp, #0x190]
101f2f0d4:     	add	sp, sp, #0x1d0
101f2f0d8:     	ret
101f2f0dc:     	ldr	x0, [sp, #0x160]
101f2f0e0:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2f0e4:     	ldrsb	w8, [sp, #0x14f]
101f2f0e8:     	tbz	w8, #0x1f, 0x101f2f0b0 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x4a0>
101f2f0ec:     	ldr	x0, [sp, #0x138]
101f2f0f0:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2f0f4:     	ldrsb	w8, [sp, #0x11f]
101f2f0f8:     	tbz	w8, #0x1f, 0x101f2f0b8 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x4a8>
101f2f0fc:     	ldr	x0, [sp, #0x108]
101f2f100:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2f104:     	ldrsb	w8, [sp, #0xa7]
101f2f108:     	tbz	w8, #0x1f, 0x101f2f0c0 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x4b0>
101f2f10c:     	ldr	x0, [sp, #0x90]
101f2f110:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f2f114:     	b	0x101f2f0c0 <__ZL23ui_ipad_hud_field_proofP8bContextRK14uiIPadHUDFieldPS1_b+0x4b0>
101f2f118:     	mov	x19, x0
101f2f11c:     	mov	x0, sp
101f2f120:     	bl	0x101f2f620 <__ZN14uiIPadHUDFieldD1Ev>
101f2f124:     	mov	x0, x19
101f2f128:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
