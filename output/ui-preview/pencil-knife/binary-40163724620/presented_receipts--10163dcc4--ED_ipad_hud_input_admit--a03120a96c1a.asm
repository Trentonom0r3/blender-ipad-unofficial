
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163dcc4 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy>:
10163dcc4:     	stp	x28, x27, [sp, #-0x50]!
10163dcc8:     	stp	x24, x23, [sp, #0x10]
10163dccc:     	stp	x22, x21, [sp, #0x20]
10163dcd0:     	stp	x20, x19, [sp, #0x30]
10163dcd4:     	stp	x29, x30, [sp, #0x40]
10163dcd8:     	add	x29, sp, #0x40
10163dcdc:     	sub	sp, sp, #0x210
10163dce0:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
10163dce4:     	ldr	x8, [x8, #0x7f0]
10163dce8:     	ldr	x8, [x8]
10163dcec:     	stur	x8, [x29, #-0x48]
10163dcf0:     	add	x8, x2, #0x1
10163dcf4:     	cmp	x8, #0x2
10163dcf8:     	b.hs	0x10163dd34 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x70>
10163dcfc:     	mov	w0, #0x0                ; =0
10163dd00:     	ldur	x8, [x29, #-0x48]
10163dd04:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
10163dd08:     	ldr	x9, [x9, #0x7f0]
10163dd0c:     	ldr	x9, [x9]
10163dd10:     	cmp	x9, x8
10163dd14:     	b.ne	0x10163e080 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x3bc>
10163dd18:     	add	sp, sp, #0x210
10163dd1c:     	ldp	x29, x30, [sp, #0x40]
10163dd20:     	ldp	x20, x19, [sp, #0x30]
10163dd24:     	ldp	x22, x21, [sp, #0x20]
10163dd28:     	ldp	x24, x23, [sp, #0x10]
10163dd2c:     	ldp	x28, x27, [sp], #0x50
10163dd30:     	ret
10163dd34:     	mov	x21, x2
10163dd38:     	mov	x19, x1
10163dd3c:     	mov	x20, x0
10163dd40:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163dd44:     	mov	x8, x0
10163dd48:     	mov	w0, #0x0                ; =0
10163dd4c:     	cbz	x19, 0x10163dd00 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x3c>
10163dd50:     	cbz	x8, 0x10163dd00 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x3c>
10163dd54:     	add	x0, x8, #0x1a0
10163dd58:     	mov	x1, x19
10163dd5c:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163dd60:     	cmn	w0, #0x1
10163dd64:     	b.eq	0x10163dcfc <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x38>
10163dd68:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163dd6c:     	ldr	x8, [x8, #0xa00]
10163dd70:     	cbz	x8, 0x10163dcfc <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x38>
10163dd74:     	fmov	d0, x8
10163dd78:     	cnt.8b	v0, v0
10163dd7c:     	uaddlv.8b	h0, v0
10163dd80:     	fmov	w9, s0
10163dd84:     	cmp	x9, #0x1
10163dd88:     	b.hi	0x10163dd98 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0xd4>
10163dd8c:     	sub	x10, x8, #0x1
10163dd90:     	and	x10, x10, x19
10163dd94:     	b	0x10163ddac <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0xe8>
10163dd98:     	mov	x10, x19
10163dd9c:     	cmp	x8, x19
10163dda0:     	b.hi	0x10163ddac <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0xe8>
10163dda4:     	udiv	x10, x19, x8
10163dda8:     	msub	x10, x10, x8, x19
10163ddac:     	adrp	x11, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163ddb0:     	ldr	x11, [x11, #0x9f8]
10163ddb4:     	ldr	x11, [x11, x10, lsl #3]
10163ddb8:     	cbz	x11, 0x10163dcfc <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x38>
10163ddbc:     	ldr	x23, [x11]
10163ddc0:     	cbz	x23, 0x10163dcfc <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x38>
10163ddc4:     	add	x22, sp, #0x30
10163ddc8:     	sub	x11, x8, #0x1
10163ddcc:     	b	0x10163dde8 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x124>
10163ddd0:     	ldr	x12, [x23, #0x10]
10163ddd4:     	cmp	x12, x19
10163ddd8:     	b.eq	0x10163de20 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x15c>
10163dddc:     	mov	w0, #0x0                ; =0
10163dde0:     	ldr	x23, [x23]
10163dde4:     	cbz	x23, 0x10163dd00 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x3c>
10163dde8:     	ldr	x12, [x23, #0x8]
10163ddec:     	cmp	x12, x19
10163ddf0:     	b.eq	0x10163ddd0 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x10c>
10163ddf4:     	cmp	x9, #0x1
10163ddf8:     	b.hi	0x10163de04 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x140>
10163ddfc:     	and	x12, x12, x11
10163de00:     	b	0x10163de14 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x150>
10163de04:     	cmp	x12, x8
10163de08:     	b.lo	0x10163de14 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x150>
10163de0c:     	udiv	x13, x12, x8
10163de10:     	msub	x12, x13, x8, x12
10163de14:     	cmp	x12, x10
10163de18:     	b.eq	0x10163dddc <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x118>
10163de1c:     	b	0x10163dcfc <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x38>
10163de20:     	ldr	x8, [x23, #0x18]
10163de24:     	ldrsw	x9, [x19, #0xc0]
10163de28:     	cmp	x8, x9
10163de2c:     	b.ne	0x10163dcfc <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x38>
10163de30:     	mov	x0, x19
10163de34:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
10163de38:     	cbz	x0, 0x10163dd00 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x3c>
10163de3c:     	adrp	x8, 0x106d88000 <_build_commit_date>
10163de40:     	add	x8, x8, #0x28
10163de44:     	ldrb	w8, [x8, #0xc21]
10163de48:     	tbnz	w8, #0x0, 0x10163dcfc <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x38>
10163de4c:     	ldrb	w8, [x0, #0x1ee]
10163de50:     	cbnz	w8, 0x10163dcfc <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x38>
10163de54:     	ldrb	w8, [x0, #0x1ef]
10163de58:     	cbnz	w8, 0x10163dcfc <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x38>
10163de5c:     	ldp	x8, x10, [x23, #0x28]
10163de60:     	cmp	x8, x10
10163de64:     	b.eq	0x10163dcfc <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x38>
10163de68:     	mov	x9, x0
10163de6c:     	b	0x10163de80 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x1bc>
10163de70:     	mov	w0, #0x0                ; =0
10163de74:     	add	x8, x8, #0x220
10163de78:     	cmp	x8, x10
10163de7c:     	b.eq	0x10163dd00 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x3c>
10163de80:     	ldr	x11, [x8, #0x218]
10163de84:     	cmp	x11, x21
10163de88:     	b.ne	0x10163de70 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x1ac>
10163de8c:     	ldrb	w11, [x8, #0x1d4]
10163de90:     	cmp	w11, #0x1
10163de94:     	b.ne	0x10163de70 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x1ac>
10163de98:     	add	x9, x9, #0x1c0
10163de9c:     	ldr	x9, [x9]
10163dea0:     	cbz	x9, 0x10163dcfc <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x38>
10163dea4:     	ldr	x10, [x8, #0xd8]
10163dea8:     	cmp	x10, x9
10163deac:     	b.ne	0x10163de9c <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x1d8>
10163deb0:     	mov	x21, x8
10163deb4:     	str	x9, [sp, #0x8]
10163deb8:     	ldr	x8, [x9, #0x78]
10163debc:     	cbz	x8, 0x10163dcfc <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x38>
10163dec0:     	mov	x3, x8
10163dec4:     	mov	x8, x21
10163dec8:     	ldr	x9, [x21, #0x168]
10163decc:     	b	0x10163dedc <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x218>
10163ded0:     	mov	w0, #0x0                ; =0
10163ded4:     	ldr	x3, [x3]
10163ded8:     	cbz	x3, 0x10163dd00 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x3c>
10163dedc:     	cmp	x9, x3
10163dee0:     	b.ne	0x10163ded0 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x20c>
10163dee4:     	ldr	x10, [x3, #0x128]
10163dee8:     	ldr	x10, [x10, #0xb0]
10163deec:     	ldr	x11, [x8, #0x170]
10163def0:     	cmp	x10, x11
10163def4:     	b.ne	0x10163ded0 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x20c>
10163def8:     	str	wzr, [sp, #0x30]
10163defc:     	add	x8, sp, #0x30
10163df00:     	add	x9, x8, #0x8
10163df04:     	movi.16b	v0, #0x0
10163df08:     	stp	q0, q0, [x9, #0x100]
10163df0c:     	stp	q0, q0, [x9, #0x120]
10163df10:     	stp	q0, q0, [x9, #0x140]
10163df14:     	stp	q0, q0, [x9, #0x160]
10163df18:     	stp	q0, q0, [x9, #0x180]
10163df1c:     	stp	q0, q0, [x9, #0x1a0]
10163df20:     	add	x8, x8, #0x1c5
10163df24:     	str	q0, [x8]
10163df28:     	stur	q0, [sp, #0x38]
10163df2c:     	stur	q0, [sp, #0x48]
10163df30:     	stur	q0, [sp, #0x58]
10163df34:     	stur	q0, [sp, #0x68]
10163df38:     	stur	q0, [sp, #0x78]
10163df3c:     	stur	q0, [sp, #0x88]
10163df40:     	stur	q0, [x22, #0x68]
10163df44:     	stur	q0, [x22, #0x78]
10163df48:     	stur	q0, [x22, #0x88]
10163df4c:     	stur	q0, [x22, #0x98]
10163df50:     	stur	q0, [x22, #0xa8]
10163df54:     	stur	q0, [x22, #0xb8]
10163df58:     	stur	q0, [x22, #0xc8]
10163df5c:     	stur	q0, [x22, #0xd8]
10163df60:     	stur	q0, [x22, #0xe8]
10163df64:     	stur	q0, [x22, #0xf8]
10163df68:     	add	x4, sp, #0x30
10163df6c:     	mov	x0, x20
10163df70:     	mov	x1, x19
10163df74:     	ldr	x2, [sp, #0x8]
10163df78:     	str	x3, [sp]
10163df7c:     	bl	0x10163ad38 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE>
10163df80:     	cbz	w0, 0x10163dd00 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x3c>
10163df84:     	add	x1, sp, #0x30
10163df88:     	mov	x0, x21
10163df8c:     	mov	w2, #0x1                ; =1
10163df90:     	bl	0x10163b2dc <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b>
10163df94:     	cbz	w0, 0x10163dd00 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x3c>
10163df98:     	ldr	x22, [x21, #0x200]
10163df9c:     	ldr	x23, [x21, #0x208]
10163dfa0:     	cmp	x22, x23
10163dfa4:     	b.eq	0x10163e078 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x3b4>
10163dfa8:     	ldr	x8, [sp, #0x8]
10163dfac:     	ldr	x8, [x8, #0x78]
10163dfb0:     	cbz	x8, 0x10163dcfc <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x38>
10163dfb4:     	mov	x21, x8
10163dfb8:     	mov	w24, #0x0               ; =0
10163dfbc:     	b	0x10163dfd0 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x30c>
10163dfc0:     	mov	w8, #0x0                ; =0
10163dfc4:     	orr	w24, w8, w24
10163dfc8:     	ldr	x21, [x21]
10163dfcc:     	cbz	x21, 0x10163e068 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x3a4>
10163dfd0:     	ldrh	w8, [x21, #0xc0]
10163dfd4:     	cbnz	w8, 0x10163dfc8 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x304>
10163dfd8:     	ldr	x8, [x21, #0x128]
10163dfdc:     	ldrh	w9, [x8, #0x2b0]
10163dfe0:     	cbz	w9, 0x10163dfc8 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x304>
10163dfe4:     	ldrb	w8, [x8, #0x8]
10163dfe8:     	cmp	w8, #0x1
10163dfec:     	b.ne	0x10163dfc8 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x304>
10163dff0:     	ldp	x8, x2, [sp]
10163dff4:     	add	x4, x8, #0xa8
10163dff8:     	add	x5, sp, #0x20
10163dffc:     	mov	x0, x20
10163e000:     	mov	x1, x19
10163e004:     	mov	x3, x21
10163e008:     	bl	0x10163a408 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_>
10163e00c:     	cbz	w0, 0x10163dfc8 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x304>
10163e010:     	add	x0, sp, #0x20
10163e014:     	add	x2, sp, #0x10
10163e018:     	mov	x1, x22
10163e01c:     	bl	0x1007fd84c <__Z14BLI_rcti_isectPK4rctiS1_PS_>
10163e020:     	cbz	w0, 0x10163dfc8 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x304>
10163e024:     	ldr	w8, [x22]
10163e028:     	ldr	w9, [sp, #0x10]
10163e02c:     	cmp	w8, w9
10163e030:     	b.ne	0x10163dfc0 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x2fc>
10163e034:     	ldr	w8, [x22, #0x8]
10163e038:     	ldr	w9, [sp, #0x18]
10163e03c:     	cmp	w8, w9
10163e040:     	b.ne	0x10163dfc0 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x2fc>
10163e044:     	ldr	w8, [x22, #0x4]
10163e048:     	ldr	w9, [sp, #0x14]
10163e04c:     	cmp	w8, w9
10163e050:     	b.ne	0x10163dfc0 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x2fc>
10163e054:     	ldr	w8, [x22, #0xc]
10163e058:     	ldr	w9, [sp, #0x1c]
10163e05c:     	cmp	w8, w9
10163e060:     	cset	w8, eq
10163e064:     	b	0x10163dfc4 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x300>
10163e068:     	tbz	w24, #0x0, 0x10163dcfc <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x38>
10163e06c:     	add	x22, x22, #0x10
10163e070:     	cmp	x22, x23
10163e074:     	b.ne	0x10163dfa8 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x2e4>
10163e078:     	mov	w0, #0x1                ; =1
10163e07c:     	b	0x10163dd00 <__Z23ED_ipad_hud_input_admitP8bContextP8wmWindowy+0x3c>
10163e080:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
