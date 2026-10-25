
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163eb50 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy>:
10163eb50:     	stp	x28, x27, [sp, #-0x60]!
10163eb54:     	stp	x26, x25, [sp, #0x10]
10163eb58:     	stp	x24, x23, [sp, #0x20]
10163eb5c:     	stp	x22, x21, [sp, #0x30]
10163eb60:     	stp	x20, x19, [sp, #0x40]
10163eb64:     	stp	x29, x30, [sp, #0x50]
10163eb68:     	add	x29, sp, #0x50
10163eb6c:     	sub	sp, sp, #0x200
10163eb70:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
10163eb74:     	ldr	x8, [x8, #0x7f0]
10163eb78:     	ldr	x8, [x8]
10163eb7c:     	stur	x8, [x29, #-0x60]
10163eb80:     	cbz	x2, 0x10163ee10 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x2c0>
10163eb84:     	mov	x20, x2
10163eb88:     	mov	x21, x1
10163eb8c:     	mov	x19, x0
10163eb90:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163eb94:     	cbz	x21, 0x10163ee10 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x2c0>
10163eb98:     	cbz	x0, 0x10163ee10 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x2c0>
10163eb9c:     	add	x0, x0, #0x1a0
10163eba0:     	mov	x1, x21
10163eba4:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163eba8:     	cmn	w0, #0x1
10163ebac:     	b.eq	0x10163ee10 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x2c0>
10163ebb0:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163ebb4:     	ldr	x8, [x8, #0xa00]
10163ebb8:     	cbz	x8, 0x10163ee10 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x2c0>
10163ebbc:     	fmov	d0, x8
10163ebc0:     	cnt.8b	v0, v0
10163ebc4:     	uaddlv.8b	h0, v0
10163ebc8:     	fmov	w9, s0
10163ebcc:     	cmp	x9, #0x1
10163ebd0:     	b.hi	0x10163ebe0 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x90>
10163ebd4:     	sub	x10, x8, #0x1
10163ebd8:     	and	x10, x10, x21
10163ebdc:     	b	0x10163ebf4 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0xa4>
10163ebe0:     	mov	x10, x21
10163ebe4:     	cmp	x8, x21
10163ebe8:     	b.hi	0x10163ebf4 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0xa4>
10163ebec:     	udiv	x10, x21, x8
10163ebf0:     	msub	x10, x10, x8, x21
10163ebf4:     	adrp	x11, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163ebf8:     	ldr	x11, [x11, #0x9f8]
10163ebfc:     	ldr	x11, [x11, x10, lsl #3]
10163ec00:     	cbz	x11, 0x10163ee10 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x2c0>
10163ec04:     	ldr	x11, [x11]
10163ec08:     	cbz	x11, 0x10163ee10 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x2c0>
10163ec0c:     	sub	x12, x8, #0x1
10163ec10:     	b	0x10163ec28 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0xd8>
10163ec14:     	ldr	x13, [x11, #0x10]
10163ec18:     	cmp	x13, x21
10163ec1c:     	b.eq	0x10163ec60 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x110>
10163ec20:     	ldr	x11, [x11]
10163ec24:     	cbz	x11, 0x10163ee10 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x2c0>
10163ec28:     	ldr	x13, [x11, #0x8]
10163ec2c:     	cmp	x13, x21
10163ec30:     	b.eq	0x10163ec14 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0xc4>
10163ec34:     	cmp	x9, #0x1
10163ec38:     	b.hi	0x10163ec44 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0xf4>
10163ec3c:     	and	x13, x13, x12
10163ec40:     	b	0x10163ec54 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x104>
10163ec44:     	cmp	x13, x8
10163ec48:     	b.lo	0x10163ec54 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x104>
10163ec4c:     	udiv	x14, x13, x8
10163ec50:     	msub	x13, x14, x8, x13
10163ec54:     	cmp	x13, x10
10163ec58:     	b.eq	0x10163ec20 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0xd0>
10163ec5c:     	b	0x10163ee10 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x2c0>
10163ec60:     	ldr	x8, [x11, #0x18]
10163ec64:     	ldrsw	x9, [x21, #0xc0]
10163ec68:     	cmp	x8, x9
10163ec6c:     	b.ne	0x10163ee10 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x2c0>
10163ec70:     	ldp	x1, x8, [x11, #0x28]
10163ec74:     	b	0x10163ec7c <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x12c>
10163ec78:     	add	x1, x1, #0x220
10163ec7c:     	cmp	x1, x8
10163ec80:     	b.eq	0x10163ee10 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x2c0>
10163ec84:     	ldr	x9, [x1, #0x218]
10163ec88:     	cmp	x9, x20
10163ec8c:     	b.ne	0x10163ec78 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x128>
10163ec90:     	ldrb	w9, [x1, #0x1d4]
10163ec94:     	tbz	w9, #0x0, 0x10163ec78 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x128>
10163ec98:     	add	x0, sp, #0x18
10163ec9c:     	mov	w2, #0x1d5              ; =469
10163eca0:     	bl	0x104b72374 <_zlibVersion+0x104b72374>
10163eca4:     	ldrb	w8, [sp, #0x1ec]
10163eca8:     	tbz	w8, #0x0, 0x10163ee10 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x2c0>
10163ecac:     	mov	x0, x19
10163ecb0:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
10163ecb4:     	mov	x20, x0
10163ecb8:     	mov	x0, x19
10163ecbc:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
10163ecc0:     	mov	x21, x0
10163ecc4:     	mov	x26, #0x0               ; =0
10163ecc8:     	ldr	w27, [sp, #0x18]
10163eccc:     	adrp	x28, 0x106457000 <__ZTIN9Freestyle14OccluderSourceE+0x8>
10163ecd0:     	add	x28, x28, #0xf60
10163ecd4:     	adrp	x22, 0x104cf7000 <__ZL3hex+0x12b34d>
10163ecd8:     	add	x22, x22, #0x6f6
10163ecdc:     	b	0x10163ecec <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x19c>
10163ece0:     	add	x26, x26, #0x8
10163ece4:     	cmp	x26, #0x28
10163ece8:     	b.eq	0x10163ee10 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x2c0>
10163ecec:     	cmp	w27, #0x1
10163ecf0:     	cset	w24, ne
10163ecf4:     	ldr	x23, [x28, x26]
10163ecf8:     	mov	x0, x23
10163ecfc:     	mov	x1, x22
10163ed00:     	bl	0x104b72ef0 <_zlibVersion+0x104b72ef0>
10163ed04:     	cmp	w0, #0x0
10163ed08:     	cset	w8, eq
10163ed0c:     	cmp	w8, w24
10163ed10:     	b.eq	0x10163ece0 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x190>
10163ed14:     	add	x1, sp, #0x18
10163ed18:     	add	x2, sp, #0x10
10163ed1c:     	mov	x0, x19
10163ed20:     	bl	0x10163ee4c <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea>
10163ed24:     	cbz	x0, 0x10163ee10 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x2c0>
10163ed28:     	mov	x24, x0
10163ed2c:     	ldr	x1, [sp, #0x10]
10163ed30:     	mov	x0, x19
10163ed34:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
10163ed38:     	mov	x0, x19
10163ed3c:     	mov	x1, x24
10163ed40:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
10163ed44:     	mov	x0, x19
10163ed48:     	mov	x1, x24
10163ed4c:     	mov	x2, x23
10163ed50:     	bl	0x101f10fb0 <__Z30UI_block_discard_named_rebuildPK8bContextP7ARegionPKc>
10163ed54:     	mov	x0, x19
10163ed58:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163ed5c:     	mov	x25, x0
10163ed60:     	mov	x0, x19
10163ed64:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
10163ed68:     	mov	x23, #0x0               ; =0
10163ed6c:     	cbz	x25, 0x10163edd4 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x284>
10163ed70:     	mov	x24, x0
10163ed74:     	mov	x1, x23
10163ed78:     	cbz	x0, 0x10163ede0 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x290>
10163ed7c:     	add	x0, x25, #0x1a0
10163ed80:     	mov	x1, x24
10163ed84:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163ed88:     	cmn	w0, #0x1
10163ed8c:     	b.eq	0x10163edc8 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x278>
10163ed90:     	mov	x0, x24
10163ed94:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
10163ed98:     	cbz	x0, 0x10163edc8 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x278>
10163ed9c:     	add	x1, x0, #0x1c0
10163eda0:     	ldr	x1, [x1]
10163eda4:     	cbz	x1, 0x10163eddc <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x28c>
10163eda8:     	cmp	x1, x20
10163edac:     	b.ne	0x10163eda0 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x250>
10163edb0:     	add	x23, x1, #0x78
10163edb4:     	ldr	x23, [x23]
10163edb8:     	cbz	x23, 0x10163ede0 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x290>
10163edbc:     	cmp	x23, x21
10163edc0:     	b.ne	0x10163edb4 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x264>
10163edc4:     	b	0x10163ede0 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x290>
10163edc8:     	mov	x23, #0x0               ; =0
10163edcc:     	mov	x1, #0x0                ; =0
10163edd0:     	b	0x10163ede0 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x290>
10163edd4:     	mov	x1, x23
10163edd8:     	b	0x10163ede0 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x290>
10163eddc:     	mov	x23, #0x0               ; =0
10163ede0:     	mov	x0, x19
10163ede4:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
10163ede8:     	mov	x0, x19
10163edec:     	mov	x1, x23
10163edf0:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
10163edf4:     	add	x1, sp, #0x18
10163edf8:     	add	x2, sp, #0x8
10163edfc:     	mov	x0, x19
10163ee00:     	bl	0x10163ee4c <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea>
10163ee04:     	cbz	x0, 0x10163ee10 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x2c0>
10163ee08:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
10163ee0c:     	b	0x10163ece0 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x190>
10163ee10:     	ldur	x8, [x29, #-0x60]
10163ee14:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
10163ee18:     	ldr	x9, [x9, #0x7f0]
10163ee1c:     	ldr	x9, [x9]
10163ee20:     	cmp	x9, x8
10163ee24:     	b.ne	0x10163ee48 <__Z24ED_ipad_hud_input_retireP8bContextP8wmWindowy+0x2f8>
10163ee28:     	add	sp, sp, #0x200
10163ee2c:     	ldp	x29, x30, [sp, #0x50]
10163ee30:     	ldp	x20, x19, [sp, #0x40]
10163ee34:     	ldp	x22, x21, [sp, #0x30]
10163ee38:     	ldp	x24, x23, [sp, #0x20]
10163ee3c:     	ldp	x26, x25, [sp, #0x10]
10163ee40:     	ldp	x28, x27, [sp], #0x60
10163ee44:     	ret
10163ee48:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
