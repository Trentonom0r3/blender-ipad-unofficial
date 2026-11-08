
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163da3c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE>:
10163da3c:     	stp	x28, x27, [sp, #-0x60]!
10163da40:     	stp	x26, x25, [sp, #0x10]
10163da44:     	stp	x24, x23, [sp, #0x20]
10163da48:     	stp	x22, x21, [sp, #0x30]
10163da4c:     	stp	x20, x19, [sp, #0x40]
10163da50:     	stp	x29, x30, [sp, #0x50]
10163da54:     	add	x29, sp, #0x50
10163da58:     	sub	sp, sp, #0x1a0
10163da5c:     	mov	x20, x4
10163da60:     	mov	x22, x3
10163da64:     	mov	x24, x2
10163da68:     	mov	x21, x1
10163da6c:     	mov	x19, x0
10163da70:     	add	x8, sp, #0xd0
10163da74:     	movi.16b	v0, #0x0
10163da78:     	stur	q0, [x8, #0x84]
10163da7c:     	stur	q0, [x8, #0x74]
10163da80:     	stur	q0, [x8, #0x94]
10163da84:     	stur	q0, [x8, #0xa4]
10163da88:     	stur	xzr, [x8, #0xb4]
10163da8c:     	stur	q0, [x8, #0x44]
10163da90:     	stur	q0, [x8, #0x34]
10163da94:     	stur	q0, [x8, #0x54]
10163da98:     	stur	q0, [x8, #0x64]
10163da9c:     	stur	q0, [x8, #0x4]
10163daa0:     	stur	q0, [x8, #0x14]
10163daa4:     	stur	q0, [x8, #0x24]
10163daa8:     	ldp	q1, q2, [sp, #0x150]
10163daac:     	stur	q1, [x4, #0x84]
10163dab0:     	stur	q2, [x4, #0x94]
10163dab4:     	ldr	q1, [sp, #0x170]
10163dab8:     	stur	q1, [x4, #0xa4]
10163dabc:     	ldur	q1, [x8, #0xac]
10163dac0:     	str	q1, [x4, #0xb0]
10163dac4:     	ldp	q1, q2, [sp, #0x110]
10163dac8:     	stur	q1, [x4, #0x44]
10163dacc:     	stur	q2, [x4, #0x54]
10163dad0:     	ldp	q1, q2, [sp, #0x130]
10163dad4:     	stur	q1, [x4, #0x64]
10163dad8:     	stur	q2, [x4, #0x74]
10163dadc:     	ldp	q1, q2, [sp, #0xd0]
10163dae0:     	stur	q1, [x4, #0x4]
10163dae4:     	stur	q2, [x4, #0x14]
10163dae8:     	ldp	q1, q2, [sp, #0xf0]
10163daec:     	stur	q1, [x4, #0x24]
10163daf0:     	str	wzr, [x4]
10163daf4:     	stur	q2, [x4, #0x34]
10163daf8:     	mov	x23, x4
10163dafc:     	str	q0, [x23, #0xc0]!
10163db00:     	stp	q0, q0, [x23, #0xf0]
10163db04:     	stp	q0, q0, [x23, #0xd0]
10163db08:     	stp	q0, q0, [x23, #0xb0]
10163db0c:     	stp	q0, q0, [x23, #0x90]
10163db10:     	stp	q0, q0, [x23, #0x70]
10163db14:     	stp	q0, q0, [x23, #0x50]
10163db18:     	stp	q0, q0, [x23, #0x30]
10163db1c:     	stp	q0, q0, [x23, #0x10]
10163db20:     	add	x8, x23, #0x10d
10163db24:     	str	xzr, [x8]
10163db28:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163db2c:     	mov	x8, x0
10163db30:     	mov	w0, #0x0                ; =0
10163db34:     	cbz	x21, 0x10163db78 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163db38:     	cbz	x8, 0x10163db78 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163db3c:     	add	x0, x8, #0x1a0
10163db40:     	mov	x1, x21
10163db44:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
10163db48:     	cmn	w0, #0x1
10163db4c:     	b.eq	0x10163db74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163db50:     	mov	x0, x21
10163db54:     	bl	0x104a61c34 <__Z27WM_window_get_active_screenPK8wmWindow>
10163db58:     	cbz	x0, 0x10163db78 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163db5c:     	adrp	x8, 0x106d8c000 <_build_commit_date>
10163db60:     	add	x8, x8, #0x28
10163db64:     	ldrb	w8, [x8, #0xc21]
10163db68:     	tbnz	w8, #0x0, 0x10163db74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163db6c:     	ldrb	w8, [x0, #0x1ee]
10163db70:     	cbz	w8, 0x10163db98 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x15c>
10163db74:     	mov	w0, #0x0                ; =0
10163db78:     	add	sp, sp, #0x1a0
10163db7c:     	ldp	x29, x30, [sp, #0x50]
10163db80:     	ldp	x20, x19, [sp, #0x40]
10163db84:     	ldp	x22, x21, [sp, #0x30]
10163db88:     	ldp	x24, x23, [sp, #0x20]
10163db8c:     	ldp	x26, x25, [sp, #0x10]
10163db90:     	ldp	x28, x27, [sp], #0x60
10163db94:     	ret
10163db98:     	mov	x8, x0
10163db9c:     	mov	w0, #0x0                ; =0
10163dba0:     	cbz	x24, 0x10163db78 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163dba4:     	ldrb	w9, [x8, #0x1ef]
10163dba8:     	cbnz	w9, 0x10163db78 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163dbac:     	mov	x28, x8
10163dbb0:     	add	x0, x8, #0x1c0
10163dbb4:     	mov	x1, x24
10163dbb8:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
10163dbbc:     	mov	x8, x0
10163dbc0:     	mov	w0, #0x0                ; =0
10163dbc4:     	cbz	x22, 0x10163db78 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163dbc8:     	cmn	w8, #0x1
10163dbcc:     	b.eq	0x10163db78 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163dbd0:     	add	x0, x24, #0x78
10163dbd4:     	mov	x1, x22
10163dbd8:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
10163dbdc:     	cmn	w0, #0x1
10163dbe0:     	b.eq	0x10163db74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163dbe4:     	ldrh	w8, [x22, #0xc0]
10163dbe8:     	cmp	w8, #0x8
10163dbec:     	b.ne	0x10163db74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163dbf0:     	ldr	x8, [x22, #0x128]
10163dbf4:     	ldr	x9, [x8, #0x168]
10163dbf8:     	cbz	x9, 0x10163db74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163dbfc:     	ldrb	w9, [x24, #0x48]
10163dc00:     	cmp	w9, #0x1
10163dc04:     	b.ne	0x10163db74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163dc08:     	ldr	w9, [x24, #0xd8]
10163dc0c:     	cmp	w9, #0x4
10163dc10:     	b.eq	0x10163db74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163dc14:     	ldrh	w8, [x8, #0x368]
10163dc18:     	cbz	w8, 0x10163db74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163dc1c:     	ldrh	w8, [x22, #0xc4]
10163dc20:     	mov	w9, #0x403              ; =1027
10163dc24:     	tst	w8, w9
10163dc28:     	b.ne	0x10163db74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163dc2c:     	str	xzr, [sp, #0x180]
10163dc30:     	movi.16b	v0, #0x0
10163dc34:     	stp	q0, q0, [sp, #0x160]
10163dc38:     	stp	q0, q0, [sp, #0x140]
10163dc3c:     	stp	q0, q0, [sp, #0x120]
10163dc40:     	stp	q0, q0, [sp, #0x100]
10163dc44:     	stp	q0, q0, [sp, #0xe0]
10163dc48:     	str	q0, [sp, #0xd0]
10163dc4c:     	str	xzr, [sp, #0xc0]
10163dc50:     	stp	q0, q0, [sp, #0xa0]
10163dc54:     	stp	q0, q0, [sp, #0x80]
10163dc58:     	stp	q0, q0, [sp, #0x60]
10163dc5c:     	stp	q0, q0, [sp, #0x40]
10163dc60:     	stp	q0, q0, [sp, #0x20]
10163dc64:     	str	q0, [sp, #0x10]
10163dc68:     	add	x3, sp, #0x10
10163dc6c:     	mov	x0, x19
10163dc70:     	mov	x1, x21
10163dc74:     	mov	x2, x24
10163dc78:     	bl	0x100b50b38 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner>
10163dc7c:     	cbz	w0, 0x10163dca4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x268>
10163dc80:     	mov	x25, x0
10163dc84:     	add	x3, sp, #0xd0
10163dc88:     	mov	x0, x19
10163dc8c:     	mov	x1, x21
10163dc90:     	mov	x2, x24
10163dc94:     	bl	0x100b50434 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner>
10163dc98:     	tbnz	w0, #0x0, 0x10163dcb8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x27c>
10163dc9c:     	mov	w25, #0x0               ; =0
10163dca0:     	b	0x10163dd54 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x318>
10163dca4:     	ldrh	w8, [x22, #0xc4]
10163dca8:     	ubfx	w8, w8, #7, #1
10163dcac:     	mov	x25, x0
10163dcb0:     	bic	w8, w8, w0
10163dcb4:     	tbnz	w8, #0x0, 0x10163dc9c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x260>
10163dcb8:     	mov	x0, x19
10163dcbc:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
10163dcc0:     	str	x0, [sp, #0x8]
10163dcc4:     	mov	x0, x19
10163dcc8:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
10163dccc:     	mov	x26, x0
10163dcd0:     	mov	x0, x19
10163dcd4:     	mov	x1, x24
10163dcd8:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
10163dcdc:     	mov	x0, x19
10163dce0:     	cbz	w25, 0x10163dd08 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2cc>
10163dce4:     	mov	x1, x22
10163dce8:     	bl	0x101f90f58 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion>
10163dcec:     	cbz	w0, 0x10163dd38 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163dcf0:     	add	x2, sp, #0xd0
10163dcf4:     	mov	x0, x19
10163dcf8:     	mov	x1, x21
10163dcfc:     	mov	w3, #0x0                ; =0
10163dd00:     	bl	0x100b50d74 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb>
10163dd04:     	b	0x10163dd14 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2d8>
10163dd08:     	mov	x1, x24
10163dd0c:     	mov	x2, x22
10163dd10:     	bl	0x101f91f30 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion>
10163dd14:     	mov	x27, x0
10163dd18:     	cbz	x0, 0x10163dd38 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163dd1c:     	add	x0, x24, #0x78
10163dd20:     	mov	x1, x27
10163dd24:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
10163dd28:     	cmn	w0, #0x1
10163dd2c:     	b.eq	0x10163dd38 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163dd30:     	ldrh	w8, [x27, #0xc0]
10163dd34:     	cbz	w8, 0x10163dd5c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x320>
10163dd38:     	mov	w25, #0x0               ; =0
10163dd3c:     	mov	x0, x19
10163dd40:     	ldr	x1, [sp, #0x8]
10163dd44:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
10163dd48:     	mov	x0, x19
10163dd4c:     	mov	x1, x26
10163dd50:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
10163dd54:     	mov	x0, x25
10163dd58:     	b	0x10163db78 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163dd5c:     	ldr	x8, [x27, #0x128]
10163dd60:     	ldrh	w8, [x8, #0x368]
10163dd64:     	cbz	w8, 0x10163dd38 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163dd68:     	mov	x0, x19
10163dd6c:     	mov	x1, x27
10163dd70:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
10163dd74:     	cbz	w25, 0x10163de60 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x424>
10163dd78:     	ldp	q0, q1, [sp, #0x150]
10163dd7c:     	stur	q0, [x20, #0x88]
10163dd80:     	stur	q1, [x20, #0x98]
10163dd84:     	ldr	q0, [sp, #0x170]
10163dd88:     	stur	q0, [x20, #0xa8]
10163dd8c:     	ldp	q0, q1, [sp, #0x110]
10163dd90:     	stur	q0, [x20, #0x48]
10163dd94:     	stur	q1, [x20, #0x58]
10163dd98:     	ldp	q0, q1, [sp, #0x130]
10163dd9c:     	stur	q0, [x20, #0x68]
10163dda0:     	stur	q1, [x20, #0x78]
10163dda4:     	ldp	q0, q1, [sp, #0xd0]
10163dda8:     	stur	q0, [x20, #0x8]
10163ddac:     	stur	q1, [x20, #0x18]
10163ddb0:     	ldp	q0, q1, [sp, #0xf0]
10163ddb4:     	stur	q0, [x20, #0x28]
10163ddb8:     	mov	w8, #0x1                ; =1
10163ddbc:     	str	w8, [x20]
10163ddc0:     	ldr	x9, [sp, #0x180]
10163ddc4:     	stur	q1, [x20, #0x38]
10163ddc8:     	adrp	x8, 0x106d8c000 <_build_commit_date>
10163ddcc:     	add	x8, x8, #0x28
10163ddd0:     	ldr	x8, [x8]
10163ddd4:     	stp	x9, x8, [x20, #0xb8]
10163ddd8:     	stp	x21, x28, [x20, #0xc8]
10163dddc:     	str	x24, [x20, #0xd8]
10163dde0:     	ldr	w8, [x28, #0x144]
10163dde4:     	str	x8, [x20, #0xe8]
10163dde8:     	ldrsw	x8, [x21, #0xc0]
10163ddec:     	str	x8, [x20, #0x118]
10163ddf0:     	mov	x0, x19
10163ddf4:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163ddf8:     	ldr	w8, [x0, #0x144]
10163ddfc:     	str	x8, [x20, #0x120]
10163de00:     	add	x8, x23, #0x104
10163de04:     	str	x22, [x20, #0x168]
10163de08:     	ldr	x9, [x22, #0x128]
10163de0c:     	ldr	x9, [x9, #0x168]
10163de10:     	str	x9, [x20, #0x170]
10163de14:     	ldr	x9, [x22, #0x128]
10163de18:     	ldr	x9, [x9, #0x350]
10163de1c:     	str	x9, [x20, #0x178]
10163de20:     	ldur	q0, [x22, #0xa8]
10163de24:     	str	q0, [x8]
10163de28:     	mov	x0, x21
10163de2c:     	bl	0x100b98cfc <__Z24WM_window_native_pixel_xPK8wmWindow>
10163de30:     	str	w0, [x20, #0x1b8]
10163de34:     	mov	x0, x21
10163de38:     	bl	0x100b98d34 <__Z24WM_window_native_pixel_yPK8wmWindow>
10163de3c:     	str	w0, [x20, #0x1bc]
10163de40:     	adrp	x8, 0x106d8c000 <_build_commit_date>
10163de44:     	add	x8, x8, #0xe08
10163de48:     	ldr	s0, [x8, #0x2654]
10163de4c:     	str	s0, [x20, #0x1c0]
10163de50:     	mov	w8, #0x1                ; =1
10163de54:     	mov	w25, #0x1               ; =1
10163de58:     	strb	w8, [x20, #0x1d4]
10163de5c:     	b	0x10163dd3c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x300>
10163de60:     	mov	x0, x19
10163de64:     	mov	x1, x23
10163de68:     	bl	0x101f933b8 <__Z23UI_ipad_context_captureP8bContextPy>
10163de6c:     	cbz	w0, 0x10163dd3c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x300>
10163de70:     	ldr	x8, [x20, #0xc8]
10163de74:     	cmp	x8, x21
10163de78:     	b.ne	0x10163dd3c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x300>
10163de7c:     	mov	x0, x19
10163de80:     	bl	0x100b9178c <__Z30WM_toolsystem_ref_from_contextPK8bContext>
10163de84:     	add	x8, x0, #0x10
10163de88:     	adrp	x9, 0x104b98000 <_zlibVersion+0x104b98000>
10163de8c:     	add	x9, x9, #0xc54
10163de90:     	cmp	x0, #0x0
10163de94:     	csel	x1, x9, x8, eq
10163de98:     	add	x0, x23, #0x68
10163de9c:     	mov	w2, #0x40               ; =64
10163dea0:     	bl	0x10081a008 <__Z11BLI_strncpyPcPKcm>
10163dea4:     	mov	x0, x19
10163dea8:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163deac:     	mov	x27, x0
10163deb0:     	ldr	x8, [x0, #0x5c0]
10163deb4:     	cbz	x8, 0x10163ded4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x498>
10163deb8:     	ldr	x8, [x8, #0xe0]
10163debc:     	cbz	x8, 0x10163ded4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x498>
10163dec0:     	str	x8, [x20, #0x1a0]
10163dec4:     	ldr	x9, [x8]
10163dec8:     	str	x9, [x20, #0x1a8]
10163decc:     	ldr	x8, [x8, #0x8]
10163ded0:     	str	x8, [x20, #0x1b0]
10163ded4:     	mov	x0, x19
10163ded8:     	bl	0x100b84308 <__Z21WM_operator_last_redoPK8bContext>
10163dedc:     	cbz	x0, 0x10163de00 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x3c4>
10163dee0:     	mov	x24, x0
10163dee4:     	ldr	x8, [x27, #0x5c0]
10163dee8:     	add	x0, x8, #0x68
10163deec:     	mov	x1, x24
10163def0:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
10163def4:     	cmn	w0, #0x1
10163def8:     	b.eq	0x10163dd38 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163defc:     	bl	0x100b7db38 <__Z31WM_operatortypes_registered_getv>
10163df00:     	cbz	x1, 0x10163dd38 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163df04:     	ldr	x8, [x24, #0x58]
10163df08:     	lsl	x9, x1, #3
10163df0c:     	ldr	x25, [x0]
10163df10:     	cmp	x25, x8
10163df14:     	b.eq	0x10163df2c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x4f0>
10163df18:     	mov	w25, #0x0               ; =0
10163df1c:     	add	x0, x0, #0x8
10163df20:     	subs	x9, x9, #0x8
10163df24:     	b.ne	0x10163df0c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x4d0>
10163df28:     	b	0x10163dd3c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x300>
10163df2c:     	cbz	x25, 0x10163dd3c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x300>
10163df30:     	ldr	x8, [x25, #0xe8]
10163df34:     	cbz	x8, 0x10163dd38 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163df38:     	str	x24, [x20, #0x180]
10163df3c:     	mov	x0, x24
10163df40:     	bl	0x100b42e14 <__Z29WM_operator_touch_lifetime_idPK10wmOperator>
10163df44:     	stp	x0, x25, [x20, #0x188]
10163df48:     	ldr	x8, [x25, #0xe8]
10163df4c:     	str	x8, [x20, #0x198]
10163df50:     	cbnz	x0, 0x10163de00 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x3c4>
10163df54:     	b	0x10163dd38 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
