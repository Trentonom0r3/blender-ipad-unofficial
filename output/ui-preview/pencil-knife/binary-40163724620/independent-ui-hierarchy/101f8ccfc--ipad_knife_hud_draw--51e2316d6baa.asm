
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f8ccfc <__ZL19ipad_knife_hud_drawPK8bContextP5Panel>:
101f8ccfc:     	stp	x26, x25, [sp, #-0x50]!
101f8cd00:     	stp	x24, x23, [sp, #0x10]
101f8cd04:     	stp	x22, x21, [sp, #0x20]
101f8cd08:     	stp	x20, x19, [sp, #0x30]
101f8cd0c:     	stp	x29, x30, [sp, #0x40]
101f8cd10:     	add	x29, sp, #0x40
101f8cd14:     	sub	sp, sp, #0x1d0
101f8cd18:     	mov	x19, x1
101f8cd1c:     	mov	x20, x0
101f8cd20:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
101f8cd24:     	ldr	x8, [x8, #0x7f0]
101f8cd28:     	ldr	x8, [x8]
101f8cd2c:     	stur	x8, [x29, #-0x48]
101f8cd30:     	str	xzr, [sp, #0x100]
101f8cd34:     	movi.16b	v0, #0x0
101f8cd38:     	stp	q0, q0, [sp, #0xe0]
101f8cd3c:     	stp	q0, q0, [sp, #0xc0]
101f8cd40:     	stp	q0, q0, [sp, #0xa0]
101f8cd44:     	stp	q0, q0, [sp, #0x80]
101f8cd48:     	stp	q0, q0, [sp, #0x60]
101f8cd4c:     	str	q0, [sp, #0x50]
101f8cd50:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f8cd54:     	mov	x21, x0
101f8cd58:     	mov	x0, x20
101f8cd5c:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f8cd60:     	mov	x2, x0
101f8cd64:     	add	x3, sp, #0x50
101f8cd68:     	mov	x0, x20
101f8cd6c:     	mov	x1, x21
101f8cd70:     	bl	0x100b50760 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner>
101f8cd74:     	cbz	w0, 0x101f8d200 <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x504>
101f8cd78:     	movi.16b	v0, #0x0
101f8cd7c:     	stur	q0, [sp, #0x3e]
101f8cd80:     	stp	q0, q0, [sp, #0x20]
101f8cd84:     	add	x1, sp, #0x20
101f8cd88:     	mov	x0, x20
101f8cd8c:     	bl	0x101f8c514 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout>
101f8cd90:     	cbz	w0, 0x101f8d200 <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x504>
101f8cd94:     	mov	x0, x20
101f8cd98:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
101f8cd9c:     	cbz	x0, 0x101f8d200 <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x504>
101f8cda0:     	ldrh	w8, [x0, #0xc0]
101f8cda4:     	cmp	w8, #0x8
101f8cda8:     	b.ne	0x101f8d200 <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x504>
101f8cdac:     	ldr	x8, [x0, #0x120]
101f8cdb0:     	cbz	x8, 0x101f8d200 <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x504>
101f8cdb4:     	ldrb	w9, [sp, #0x4d]
101f8cdb8:     	strb	w9, [x8, #0x4]
101f8cdbc:     	ldrb	w9, [sp, #0x4c]
101f8cdc0:     	strb	w9, [x8, #0x5]
101f8cdc4:     	ldr	x9, [sp, #0x20]
101f8cdc8:     	str	x9, [x8, #0x8]
101f8cdcc:     	ldur	q0, [sp, #0x28]
101f8cdd0:     	str	q0, [x8, #0x10]
101f8cdd4:     	ldr	d0, [sp, #0x38]
101f8cdd8:     	str	d0, [x8, #0x20]
101f8cddc:     	adrp	x23, 0x106d88000 <_build_commit_date>
101f8cde0:     	add	x23, x23, #0xe08
101f8cde4:     	ldr	s0, [x23, #0x2654]
101f8cde8:     	mov	w9, #0x42300000         ; =1110441984
101f8cdec:     	fmov	s1, w9
101f8cdf0:     	fmul	s0, s0, s1
101f8cdf4:     	frintp	s0, s0
101f8cdf8:     	str	s0, [x8, #0x28]
101f8cdfc:     	ldr	s0, [x23, #0x2654]
101f8ce00:     	str	s0, [x8, #0x2c]
101f8ce04:     	ldrb	w8, [sp, #0x4d]
101f8ce08:     	tbnz	w8, #0x0, 0x101f8ce8c <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x190>
101f8ce0c:     	ldr	x20, [x19, #0x18]
101f8ce10:     	adrp	x1, 0x104d53000 <__ZL3hex+0x18734d>
101f8ce14:     	add	x1, x1, #0x809
101f8ce18:     	mov	x0, #0x0                ; =0
101f8ce1c:     	bl	0x100ef50ac <__Z22BLT_translate_do_ifacePKcS0_>
101f8ce20:     	mov	x21, x0
101f8ce24:     	cbz	x0, 0x101f8ce38 <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x13c>
101f8ce28:     	mov	x0, x21
101f8ce2c:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f8ce30:     	mov	x2, x0
101f8ce34:     	b	0x101f8ce3c <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x140>
101f8ce38:     	mov	x2, #0x0                ; =0
101f8ce3c:     	mov	x0, x20
101f8ce40:     	mov	x1, x21
101f8ce44:     	mov	w3, #0x8b               ; =139
101f8ce48:     	bl	0x101f57b8c <__ZN8uiLayout5labelEN7blender9StringRefEi>
101f8ce4c:     	ldr	x20, [x19, #0x18]
101f8ce50:     	adrp	x1, 0x104d53000 <__ZL3hex+0x18734d>
101f8ce54:     	add	x1, x1, #0x81c
101f8ce58:     	mov	x0, #0x0                ; =0
101f8ce5c:     	bl	0x100ef50ac <__Z22BLT_translate_do_ifacePKcS0_>
101f8ce60:     	mov	x21, x0
101f8ce64:     	cbz	x0, 0x101f8ce78 <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x17c>
101f8ce68:     	mov	x0, x21
101f8ce6c:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f8ce70:     	mov	x2, x0
101f8ce74:     	b	0x101f8ce7c <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x180>
101f8ce78:     	mov	x2, #0x0                ; =0
101f8ce7c:     	mov	x0, x20
101f8ce80:     	mov	x1, x21
101f8ce84:     	mov	w3, #0x0                ; =0
101f8ce88:     	bl	0x101f57b8c <__ZN8uiLayout5labelEN7blender9StringRefEi>
101f8ce8c:     	ldrb	w8, [sp, #0x4c]
101f8ce90:     	ldr	x0, [x19, #0x18]
101f8ce94:     	mov	w1, #0x1                ; =1
101f8ce98:     	cmp	w8, #0x1
101f8ce9c:     	b.ne	0x101f8cea8 <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x1ac>
101f8cea0:     	bl	0x101f580a4 <__ZN8uiLayout3rowEb>
101f8cea4:     	b	0x101f8ceac <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x1b0>
101f8cea8:     	bl	0x101f57ab4 <__ZN8uiLayout6columnEb>
101f8ceac:     	mov	x20, x0
101f8ceb0:     	ldrb	w8, [sp, #0x4d]
101f8ceb4:     	strb	w8, [x0, #0xa4]
101f8ceb8:     	ldr	s0, [sp, #0x48]
101f8cebc:     	mov	w8, #0x2912             ; =10514
101f8cec0:     	ldr	h1, [x23, x8]
101f8cec4:     	sshll.4s	v1, v1, #0x0
101f8cec8:     	scvtf	s1, s1
101f8cecc:     	fdiv	s0, s0, s1
101f8ced0:     	str	s0, [x0, #0x9c]
101f8ced4:     	bl	0x101f578a8 <__ZNK8uiLayout5blockEv>
101f8ced8:     	mov	x19, x0
101f8cedc:     	mov	x1, x20
101f8cee0:     	bl	0x101f579c8 <__ZN7blender2ui24block_layout_set_currentEP7uiBlockP8uiLayout>
101f8cee4:     	mov	x0, x19
101f8cee8:     	mov	w1, #0x0                ; =0
101f8ceec:     	bl	0x101f214d4 <__Z25ui_block_new_button_groupP7uiBlock17uiButtonGroupFlag>
101f8cef0:     	adrp	x1, 0x104d53000 <__ZL3hex+0x18734d>
101f8cef4:     	add	x1, x1, #0x7ef
101f8cef8:     	mov	x0, #0x0                ; =0
101f8cefc:     	bl	0x100ef50ac <__Z22BLT_translate_do_ifacePKcS0_>
101f8cf00:     	mov	x20, x0
101f8cf04:     	cbz	x0, 0x101f8cf18 <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x21c>
101f8cf08:     	mov	x0, x20
101f8cf0c:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f8cf10:     	mov	x21, x0
101f8cf14:     	b	0x101f8cf1c <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x220>
101f8cf18:     	mov	x21, #0x0               ; =0
101f8cf1c:     	ldr	w24, [sp, #0x38]
101f8cf20:     	mov	w8, #0x2912             ; =10514
101f8cf24:     	ldrsh	w25, [x23, x8]
101f8cf28:     	adrp	x1, 0x104d53000 <__ZL3hex+0x18734d>
101f8cf2c:     	add	x1, x1, #0x832
101f8cf30:     	mov	x0, #0x0                ; =0
101f8cf34:     	bl	0x100ef51c0 <__Z24BLT_translate_do_tooltipPKcS0_>
101f8cf38:     	mov	x22, x0
101f8cf3c:     	cbz	x0, 0x101f8cf48 <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x24c>
101f8cf40:     	mov	x0, x22
101f8cf44:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f8cf48:     	stp	x22, x0, [x29, #-0x100]
101f8cf4c:     	mov	w22, #0x1               ; =1
101f8cf50:     	sturb	w22, [x29, #-0xf0]
101f8cf54:     	sub	x8, x29, #0x100
101f8cf58:     	stp	xzr, x8, [sp, #0x8]
101f8cf5c:     	strh	w25, [sp, #0x2]
101f8cf60:     	strh	w24, [sp]
101f8cf64:     	mov	x0, x19
101f8cf68:     	mov	w1, #0x1                ; =1
101f8cf6c:     	mov	w2, #0x0                ; =0
101f8cf70:     	mov	w3, #0x38               ; =56
101f8cf74:     	mov	x4, x20
101f8cf78:     	mov	x5, x21
101f8cf7c:     	mov	w6, #0x0                ; =0
101f8cf80:     	mov	w7, #0x0                ; =0
101f8cf84:     	bl	0x101f16510 <__Z16uiDefIconTextButP7uiBlock24uiButTypeWithPointerTypeiiN7blender9StringRefEiissPvNSt3__18optionalIS3_EE>
101f8cf88:     	mov	x20, x0
101f8cf8c:     	ldr	w8, [x0, #0x18]
101f8cf90:     	orr	w8, w8, #0x20
101f8cf94:     	str	w8, [x0, #0x18]
101f8cf98:     	ldp	q0, q1, [sp, #0xd0]
101f8cf9c:     	stp	q0, q1, [x29, #-0x80]
101f8cfa0:     	ldr	q0, [sp, #0xf0]
101f8cfa4:     	stur	q0, [x29, #-0x60]
101f8cfa8:     	ldr	x8, [sp, #0x100]
101f8cfac:     	stur	x8, [x29, #-0x50]
101f8cfb0:     	ldp	q0, q1, [sp, #0x90]
101f8cfb4:     	stp	q0, q1, [x29, #-0xc0]
101f8cfb8:     	ldp	q0, q1, [sp, #0xb0]
101f8cfbc:     	stp	q0, q1, [x29, #-0xa0]
101f8cfc0:     	ldp	q0, q1, [sp, #0x50]
101f8cfc4:     	stp	q0, q1, [x29, #-0x100]
101f8cfc8:     	ldp	q0, q1, [sp, #0x70]
101f8cfcc:     	stp	q0, q1, [x29, #-0xe0]
101f8cfd0:     	adrp	x24, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101f8cfd4:     	add	x24, x24, #0x6d0
101f8cfd8:     	ldr	x8, [x24]
101f8cfdc:     	adrp	x2, 0x104d53000 <__ZL3hex+0x18734d>
101f8cfe0:     	add	x2, x2, #0x86a
101f8cfe4:     	mov	w0, #0xc0               ; =192
101f8cfe8:     	mov	w1, #0x8                ; =8
101f8cfec:     	mov	w3, #0x1                ; =1
101f8cff0:     	blr	x8
101f8cff4:     	mov	x2, x0
101f8cff8:     	ldur	q0, [x29, #-0x80]
101f8cffc:     	str	q0, [x0, #0x80]
101f8d000:     	ldur	q0, [x29, #-0x70]
101f8d004:     	str	q0, [x0, #0x90]
101f8d008:     	ldur	q0, [x29, #-0x60]
101f8d00c:     	str	q0, [x0, #0xa0]
101f8d010:     	ldur	x8, [x29, #-0x50]
101f8d014:     	str	x8, [x0, #0xb0]
101f8d018:     	ldur	q0, [x29, #-0xc0]
101f8d01c:     	str	q0, [x0, #0x40]
101f8d020:     	ldur	q0, [x29, #-0xb0]
101f8d024:     	str	q0, [x0, #0x50]
101f8d028:     	ldur	q0, [x29, #-0xa0]
101f8d02c:     	str	q0, [x0, #0x60]
101f8d030:     	ldur	q0, [x29, #-0x90]
101f8d034:     	str	q0, [x0, #0x70]
101f8d038:     	ldur	q0, [x29, #-0x100]
101f8d03c:     	str	q0, [x0]
101f8d040:     	ldur	q0, [x29, #-0xf0]
101f8d044:     	str	q0, [x0, #0x10]
101f8d048:     	ldur	q0, [x29, #-0xe0]
101f8d04c:     	str	q0, [x0, #0x20]
101f8d050:     	ldur	q0, [x29, #-0xd0]
101f8d054:     	str	q0, [x0, #0x30]
101f8d058:     	strb	w22, [x0, #0xb8]
101f8d05c:     	adrp	x1, 0x101f8c000 <__ZL35ui_colorpicker_rgb_slider_update_cbP8bContextPvS1_+0xb0>
101f8d060:     	add	x1, x1, #0xc8c
101f8d064:     	adrp	x4, 0x106366000 <_zlibVersion+0x106366000>
101f8d068:     	ldr	x4, [x4, #0xac0]
101f8d06c:     	adrp	x5, 0x106366000 <_zlibVersion+0x106366000>
101f8d070:     	ldr	x5, [x5, #0xa80]
101f8d074:     	mov	x0, x20
101f8d078:     	mov	x3, #0x0                ; =0
101f8d07c:     	bl	0x101f1722c <__Z16UI_but_funcN_setP5uiButPFvP8bContextPvS3_ES3_S3_PFvS3_EPFS3_PKvE>
101f8d080:     	adrp	x1, 0x104d53000 <__ZL3hex+0x18734d>
101f8d084:     	add	x1, x1, #0x7fc
101f8d088:     	mov	x0, #0x0                ; =0
101f8d08c:     	bl	0x100ef50ac <__Z22BLT_translate_do_ifacePKcS0_>
101f8d090:     	mov	x20, x0
101f8d094:     	cbz	x0, 0x101f8d0a8 <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x3ac>
101f8d098:     	mov	x0, x20
101f8d09c:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f8d0a0:     	mov	x21, x0
101f8d0a4:     	b	0x101f8d0ac <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x3b0>
101f8d0a8:     	mov	x21, #0x0               ; =0
101f8d0ac:     	ldr	w25, [sp, #0x3c]
101f8d0b0:     	mov	w8, #0x2912             ; =10514
101f8d0b4:     	ldrsh	w23, [x23, x8]
101f8d0b8:     	adrp	x1, 0x104d53000 <__ZL3hex+0x18734d>
101f8d0bc:     	add	x1, x1, #0x84e
101f8d0c0:     	mov	x0, #0x0                ; =0
101f8d0c4:     	bl	0x100ef51c0 <__Z24BLT_translate_do_tooltipPKcS0_>
101f8d0c8:     	mov	x22, x0
101f8d0cc:     	cbz	x0, 0x101f8d0d8 <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x3dc>
101f8d0d0:     	mov	x0, x22
101f8d0d4:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f8d0d8:     	stp	x22, x0, [x29, #-0x100]
101f8d0dc:     	mov	w8, #0x1                ; =1
101f8d0e0:     	sturb	w8, [x29, #-0xf0]
101f8d0e4:     	sub	x8, x29, #0x100
101f8d0e8:     	stp	xzr, x8, [sp, #0x8]
101f8d0ec:     	strh	w23, [sp, #0x2]
101f8d0f0:     	strh	w25, [sp]
101f8d0f4:     	mov	x0, x19
101f8d0f8:     	mov	w1, #0x1                ; =1
101f8d0fc:     	mov	w2, #0x0                ; =0
101f8d100:     	mov	w3, #0x6e               ; =110
101f8d104:     	mov	x4, x20
101f8d108:     	mov	x5, x21
101f8d10c:     	mov	w6, #0x0                ; =0
101f8d110:     	mov	w7, #0x0                ; =0
101f8d114:     	bl	0x101f16510 <__Z16uiDefIconTextButP7uiBlock24uiButTypeWithPointerTypeiiN7blender9StringRefEiissPvNSt3__18optionalIS3_EE>
101f8d118:     	mov	x19, x0
101f8d11c:     	ldp	q0, q1, [sp, #0xd0]
101f8d120:     	stp	q0, q1, [x29, #-0x80]
101f8d124:     	ldr	q0, [sp, #0xf0]
101f8d128:     	stur	q0, [x29, #-0x60]
101f8d12c:     	ldr	x8, [sp, #0x100]
101f8d130:     	stur	x8, [x29, #-0x50]
101f8d134:     	ldp	q0, q1, [sp, #0x90]
101f8d138:     	stp	q0, q1, [x29, #-0xc0]
101f8d13c:     	ldp	q0, q1, [sp, #0xb0]
101f8d140:     	stp	q0, q1, [x29, #-0xa0]
101f8d144:     	ldp	q0, q1, [sp, #0x50]
101f8d148:     	stp	q0, q1, [x29, #-0x100]
101f8d14c:     	ldp	q0, q1, [sp, #0x70]
101f8d150:     	stp	q0, q1, [x29, #-0xe0]
101f8d154:     	ldr	x8, [x24]
101f8d158:     	adrp	x2, 0x104d53000 <__ZL3hex+0x18734d>
101f8d15c:     	add	x2, x2, #0x86a
101f8d160:     	mov	w0, #0xc0               ; =192
101f8d164:     	mov	w1, #0x8                ; =8
101f8d168:     	mov	w3, #0x1                ; =1
101f8d16c:     	blr	x8
101f8d170:     	mov	x2, x0
101f8d174:     	ldur	q0, [x29, #-0x80]
101f8d178:     	str	q0, [x0, #0x80]
101f8d17c:     	ldur	q0, [x29, #-0x70]
101f8d180:     	str	q0, [x0, #0x90]
101f8d184:     	ldur	q0, [x29, #-0x60]
101f8d188:     	str	q0, [x0, #0xa0]
101f8d18c:     	ldur	x8, [x29, #-0x50]
101f8d190:     	str	x8, [x0, #0xb0]
101f8d194:     	ldur	q0, [x29, #-0xc0]
101f8d198:     	str	q0, [x0, #0x40]
101f8d19c:     	ldur	q0, [x29, #-0xb0]
101f8d1a0:     	str	q0, [x0, #0x50]
101f8d1a4:     	ldur	q0, [x29, #-0xa0]
101f8d1a8:     	str	q0, [x0, #0x60]
101f8d1ac:     	ldur	q0, [x29, #-0x90]
101f8d1b0:     	str	q0, [x0, #0x70]
101f8d1b4:     	ldur	q0, [x29, #-0x100]
101f8d1b8:     	str	q0, [x0]
101f8d1bc:     	ldur	q0, [x29, #-0xf0]
101f8d1c0:     	str	q0, [x0, #0x10]
101f8d1c4:     	ldur	q0, [x29, #-0xe0]
101f8d1c8:     	str	q0, [x0, #0x20]
101f8d1cc:     	ldur	q0, [x29, #-0xd0]
101f8d1d0:     	str	q0, [x0, #0x30]
101f8d1d4:     	mov	w8, #0x2                ; =2
101f8d1d8:     	strb	w8, [x0, #0xb8]
101f8d1dc:     	adrp	x1, 0x101f8c000 <__ZL35ui_colorpicker_rgb_slider_update_cbP8bContextPvS1_+0xb0>
101f8d1e0:     	add	x1, x1, #0xc8c
101f8d1e4:     	adrp	x4, 0x106366000 <_zlibVersion+0x106366000>
101f8d1e8:     	ldr	x4, [x4, #0xac0]
101f8d1ec:     	adrp	x5, 0x106366000 <_zlibVersion+0x106366000>
101f8d1f0:     	ldr	x5, [x5, #0xa80]
101f8d1f4:     	mov	x0, x19
101f8d1f8:     	mov	x3, #0x0                ; =0
101f8d1fc:     	bl	0x101f1722c <__Z16UI_but_funcN_setP5uiButPFvP8bContextPvS3_ES3_S3_PFvS3_EPFS3_PKvE>
101f8d200:     	ldur	x8, [x29, #-0x48]
101f8d204:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
101f8d208:     	ldr	x9, [x9, #0x7f0]
101f8d20c:     	ldr	x9, [x9]
101f8d210:     	cmp	x9, x8
101f8d214:     	b.ne	0x101f8d234 <__ZL19ipad_knife_hud_drawPK8bContextP5Panel+0x538>
101f8d218:     	add	sp, sp, #0x1d0
101f8d21c:     	ldp	x29, x30, [sp, #0x40]
101f8d220:     	ldp	x20, x19, [sp, #0x30]
101f8d224:     	ldp	x22, x21, [sp, #0x20]
101f8d228:     	ldp	x24, x23, [sp, #0x10]
101f8d22c:     	ldp	x26, x25, [sp], #0x50
101f8d230:     	ret
101f8d234:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
