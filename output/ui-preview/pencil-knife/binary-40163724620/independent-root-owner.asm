
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163ad38 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE>:
10163ad38:     	stp	x28, x27, [sp, #-0x60]!
10163ad3c:     	stp	x26, x25, [sp, #0x10]
10163ad40:     	stp	x24, x23, [sp, #0x20]
10163ad44:     	stp	x22, x21, [sp, #0x30]
10163ad48:     	stp	x20, x19, [sp, #0x40]
10163ad4c:     	stp	x29, x30, [sp, #0x50]
10163ad50:     	add	x29, sp, #0x50
10163ad54:     	sub	sp, sp, #0x1a0
10163ad58:     	mov	x20, x4
10163ad5c:     	mov	x22, x3
10163ad60:     	mov	x24, x2
10163ad64:     	mov	x21, x1
10163ad68:     	mov	x19, x0
10163ad6c:     	add	x8, sp, #0xd0
10163ad70:     	movi.16b	v0, #0x0
10163ad74:     	stur	q0, [x8, #0x84]
10163ad78:     	stur	q0, [x8, #0x74]
10163ad7c:     	stur	q0, [x8, #0x94]
10163ad80:     	stur	q0, [x8, #0xa4]
10163ad84:     	stur	xzr, [x8, #0xb4]
10163ad88:     	stur	q0, [x8, #0x44]
10163ad8c:     	stur	q0, [x8, #0x34]
10163ad90:     	stur	q0, [x8, #0x54]
10163ad94:     	stur	q0, [x8, #0x64]
10163ad98:     	stur	q0, [x8, #0x4]
10163ad9c:     	stur	q0, [x8, #0x14]
10163ada0:     	stur	q0, [x8, #0x24]
10163ada4:     	ldp	q1, q2, [sp, #0x150]
10163ada8:     	stur	q1, [x4, #0x84]
10163adac:     	stur	q2, [x4, #0x94]
10163adb0:     	ldr	q1, [sp, #0x170]
10163adb4:     	stur	q1, [x4, #0xa4]
10163adb8:     	ldur	q1, [x8, #0xac]
10163adbc:     	str	q1, [x4, #0xb0]
10163adc0:     	ldp	q1, q2, [sp, #0x110]
10163adc4:     	stur	q1, [x4, #0x44]
10163adc8:     	stur	q2, [x4, #0x54]
10163adcc:     	ldp	q1, q2, [sp, #0x130]
10163add0:     	stur	q1, [x4, #0x64]
10163add4:     	stur	q2, [x4, #0x74]
10163add8:     	ldp	q1, q2, [sp, #0xd0]
10163addc:     	stur	q1, [x4, #0x4]
10163ade0:     	stur	q2, [x4, #0x14]
10163ade4:     	ldp	q1, q2, [sp, #0xf0]
10163ade8:     	stur	q1, [x4, #0x24]
10163adec:     	str	wzr, [x4]
10163adf0:     	stur	q2, [x4, #0x34]
10163adf4:     	mov	x23, x4
10163adf8:     	str	q0, [x23, #0xc0]!
10163adfc:     	stp	q0, q0, [x23, #0xf0]
10163ae00:     	stp	q0, q0, [x23, #0xd0]
10163ae04:     	stp	q0, q0, [x23, #0xb0]
10163ae08:     	stp	q0, q0, [x23, #0x90]
10163ae0c:     	stp	q0, q0, [x23, #0x70]
10163ae10:     	stp	q0, q0, [x23, #0x50]
10163ae14:     	stp	q0, q0, [x23, #0x30]
10163ae18:     	stp	q0, q0, [x23, #0x10]
10163ae1c:     	add	x8, x23, #0x10d
10163ae20:     	str	xzr, [x8]
10163ae24:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163ae28:     	mov	x8, x0
10163ae2c:     	mov	w0, #0x0                ; =0
10163ae30:     	cbz	x21, 0x10163ae74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163ae34:     	cbz	x8, 0x10163ae74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163ae38:     	add	x0, x8, #0x1a0
10163ae3c:     	mov	x1, x21
10163ae40:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163ae44:     	cmn	w0, #0x1
10163ae48:     	b.eq	0x10163ae70 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163ae4c:     	mov	x0, x21
10163ae50:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
10163ae54:     	cbz	x0, 0x10163ae74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163ae58:     	adrp	x8, 0x106d88000 <_build_commit_date>
10163ae5c:     	add	x8, x8, #0x28
10163ae60:     	ldrb	w8, [x8, #0xc21]
10163ae64:     	tbnz	w8, #0x0, 0x10163ae70 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163ae68:     	ldrb	w8, [x0, #0x1ee]
10163ae6c:     	cbz	w8, 0x10163ae94 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x15c>
10163ae70:     	mov	w0, #0x0                ; =0
10163ae74:     	add	sp, sp, #0x1a0
10163ae78:     	ldp	x29, x30, [sp, #0x50]
10163ae7c:     	ldp	x20, x19, [sp, #0x40]
10163ae80:     	ldp	x22, x21, [sp, #0x30]
10163ae84:     	ldp	x24, x23, [sp, #0x20]
10163ae88:     	ldp	x26, x25, [sp, #0x10]
10163ae8c:     	ldp	x28, x27, [sp], #0x60
10163ae90:     	ret
10163ae94:     	mov	x8, x0
10163ae98:     	mov	w0, #0x0                ; =0
10163ae9c:     	cbz	x24, 0x10163ae74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163aea0:     	ldrb	w9, [x8, #0x1ef]
10163aea4:     	cbnz	w9, 0x10163ae74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163aea8:     	mov	x28, x8
10163aeac:     	add	x0, x8, #0x1c0
10163aeb0:     	mov	x1, x24
10163aeb4:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163aeb8:     	mov	x8, x0
10163aebc:     	mov	w0, #0x0                ; =0
10163aec0:     	cbz	x22, 0x10163ae74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163aec4:     	cmn	w8, #0x1
10163aec8:     	b.eq	0x10163ae74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163aecc:     	add	x0, x24, #0x78
10163aed0:     	mov	x1, x22
10163aed4:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163aed8:     	cmn	w0, #0x1
10163aedc:     	b.eq	0x10163ae70 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163aee0:     	ldrh	w8, [x22, #0xc0]
10163aee4:     	cmp	w8, #0x8
10163aee8:     	b.ne	0x10163ae70 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163aeec:     	ldr	x8, [x22, #0x128]
10163aef0:     	ldr	x9, [x8, #0xb0]
10163aef4:     	cbz	x9, 0x10163ae70 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163aef8:     	ldrb	w9, [x24, #0x48]
10163aefc:     	cmp	w9, #0x1
10163af00:     	b.ne	0x10163ae70 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163af04:     	ldr	w9, [x24, #0xd8]
10163af08:     	cmp	w9, #0x4
10163af0c:     	b.eq	0x10163ae70 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163af10:     	ldrh	w8, [x8, #0x2b0]
10163af14:     	cbz	w8, 0x10163ae70 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163af18:     	ldrh	w8, [x22, #0xc4]
10163af1c:     	mov	w9, #0x403              ; =1027
10163af20:     	tst	w8, w9
10163af24:     	b.ne	0x10163ae70 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163af28:     	str	xzr, [sp, #0x180]
10163af2c:     	movi.16b	v0, #0x0
10163af30:     	stp	q0, q0, [sp, #0x160]
10163af34:     	stp	q0, q0, [sp, #0x140]
10163af38:     	stp	q0, q0, [sp, #0x120]
10163af3c:     	stp	q0, q0, [sp, #0x100]
10163af40:     	stp	q0, q0, [sp, #0xe0]
10163af44:     	str	q0, [sp, #0xd0]
10163af48:     	str	xzr, [sp, #0xc0]
10163af4c:     	stp	q0, q0, [sp, #0xa0]
10163af50:     	stp	q0, q0, [sp, #0x80]
10163af54:     	stp	q0, q0, [sp, #0x60]
10163af58:     	stp	q0, q0, [sp, #0x40]
10163af5c:     	stp	q0, q0, [sp, #0x20]
10163af60:     	str	q0, [sp, #0x10]
10163af64:     	add	x3, sp, #0x10
10163af68:     	mov	x0, x19
10163af6c:     	mov	x1, x21
10163af70:     	mov	x2, x24
10163af74:     	bl	0x100b50760 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner>
10163af78:     	cbz	w0, 0x10163afa0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x268>
10163af7c:     	mov	x25, x0
10163af80:     	add	x3, sp, #0xd0
10163af84:     	mov	x0, x19
10163af88:     	mov	x1, x21
10163af8c:     	mov	x2, x24
10163af90:     	bl	0x100b5005c <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner>
10163af94:     	tbnz	w0, #0x0, 0x10163afb4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x27c>
10163af98:     	mov	w25, #0x0               ; =0
10163af9c:     	b	0x10163b050 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x318>
10163afa0:     	ldrh	w8, [x22, #0xc4]
10163afa4:     	ubfx	w8, w8, #7, #1
10163afa8:     	mov	x25, x0
10163afac:     	bic	w8, w8, w0
10163afb0:     	tbnz	w8, #0x0, 0x10163af98 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x260>
10163afb4:     	mov	x0, x19
10163afb8:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
10163afbc:     	str	x0, [sp, #0x8]
10163afc0:     	mov	x0, x19
10163afc4:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
10163afc8:     	mov	x26, x0
10163afcc:     	mov	x0, x19
10163afd0:     	mov	x1, x24
10163afd4:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
10163afd8:     	mov	x0, x19
10163afdc:     	cbz	w25, 0x10163b004 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2cc>
10163afe0:     	mov	x1, x22
10163afe4:     	bl	0x101f8c8c4 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion>
10163afe8:     	cbz	w0, 0x10163b034 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163afec:     	add	x2, sp, #0xd0
10163aff0:     	mov	x0, x19
10163aff4:     	mov	x1, x21
10163aff8:     	mov	w3, #0x0                ; =0
10163affc:     	bl	0x100b5099c <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb>
10163b000:     	b	0x10163b010 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2d8>
10163b004:     	mov	x1, x24
10163b008:     	mov	x2, x22
10163b00c:     	bl	0x101f8d890 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion>
10163b010:     	mov	x27, x0
10163b014:     	cbz	x0, 0x10163b034 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163b018:     	add	x0, x24, #0x78
10163b01c:     	mov	x1, x27
10163b020:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163b024:     	cmn	w0, #0x1
10163b028:     	b.eq	0x10163b034 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163b02c:     	ldrh	w8, [x27, #0xc0]
10163b030:     	cbz	w8, 0x10163b058 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x320>
10163b034:     	mov	w25, #0x0               ; =0
10163b038:     	mov	x0, x19
10163b03c:     	ldr	x1, [sp, #0x8]
10163b040:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
10163b044:     	mov	x0, x19
10163b048:     	mov	x1, x26
10163b04c:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
10163b050:     	mov	x0, x25
10163b054:     	b	0x10163ae74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163b058:     	ldr	x8, [x27, #0x128]
10163b05c:     	ldrh	w8, [x8, #0x2b0]
10163b060:     	cbz	w8, 0x10163b034 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163b064:     	mov	x0, x19
10163b068:     	mov	x1, x27
10163b06c:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
10163b070:     	cbz	w25, 0x10163b15c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x424>
10163b074:     	ldp	q0, q1, [sp, #0x150]
10163b078:     	stur	q0, [x20, #0x88]
10163b07c:     	stur	q1, [x20, #0x98]
10163b080:     	ldr	q0, [sp, #0x170]
10163b084:     	stur	q0, [x20, #0xa8]
10163b088:     	ldp	q0, q1, [sp, #0x110]
10163b08c:     	stur	q0, [x20, #0x48]
10163b090:     	stur	q1, [x20, #0x58]
10163b094:     	ldp	q0, q1, [sp, #0x130]
10163b098:     	stur	q0, [x20, #0x68]
10163b09c:     	stur	q1, [x20, #0x78]
10163b0a0:     	ldp	q0, q1, [sp, #0xd0]
10163b0a4:     	stur	q0, [x20, #0x8]
10163b0a8:     	stur	q1, [x20, #0x18]
10163b0ac:     	ldp	q0, q1, [sp, #0xf0]
10163b0b0:     	stur	q0, [x20, #0x28]
10163b0b4:     	mov	w8, #0x1                ; =1
10163b0b8:     	str	w8, [x20]
10163b0bc:     	ldr	x9, [sp, #0x180]
10163b0c0:     	stur	q1, [x20, #0x38]
10163b0c4:     	adrp	x8, 0x106d88000 <_build_commit_date>
10163b0c8:     	add	x8, x8, #0x28
10163b0cc:     	ldr	x8, [x8]
10163b0d0:     	stp	x9, x8, [x20, #0xb8]
10163b0d4:     	stp	x21, x28, [x20, #0xc8]
10163b0d8:     	str	x24, [x20, #0xd8]
10163b0dc:     	ldr	w8, [x28, #0x144]
10163b0e0:     	str	x8, [x20, #0xe8]
10163b0e4:     	ldrsw	x8, [x21, #0xc0]
10163b0e8:     	str	x8, [x20, #0x118]
10163b0ec:     	mov	x0, x19
10163b0f0:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163b0f4:     	ldr	w8, [x0, #0x144]
10163b0f8:     	str	x8, [x20, #0x120]
10163b0fc:     	add	x8, x23, #0x104
10163b100:     	str	x22, [x20, #0x168]
10163b104:     	ldr	x9, [x22, #0x128]
10163b108:     	ldr	x9, [x9, #0xb0]
10163b10c:     	str	x9, [x20, #0x170]
10163b110:     	ldr	x9, [x22, #0x128]
10163b114:     	ldr	x9, [x9, #0x298]
10163b118:     	str	x9, [x20, #0x178]
10163b11c:     	ldur	q0, [x22, #0xa8]
10163b120:     	str	q0, [x8]
10163b124:     	mov	x0, x21
10163b128:     	bl	0x100b96a54 <__Z24WM_window_native_pixel_xPK8wmWindow>
10163b12c:     	str	w0, [x20, #0x1b8]
10163b130:     	mov	x0, x21
10163b134:     	bl	0x100b96a8c <__Z24WM_window_native_pixel_yPK8wmWindow>
10163b138:     	str	w0, [x20, #0x1bc]
10163b13c:     	adrp	x8, 0x106d88000 <_build_commit_date>
10163b140:     	add	x8, x8, #0xe08
10163b144:     	ldr	s0, [x8, #0x2654]
10163b148:     	str	s0, [x20, #0x1c0]
10163b14c:     	mov	w8, #0x1                ; =1
10163b150:     	mov	w25, #0x1               ; =1
10163b154:     	strb	w8, [x20, #0x1d4]
10163b158:     	b	0x10163b038 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x300>
10163b15c:     	mov	x0, x19
10163b160:     	mov	x1, x23
10163b164:     	bl	0x101f8ed10 <__Z23UI_ipad_context_captureP8bContextPy>
10163b168:     	cbz	w0, 0x10163b038 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x300>
10163b16c:     	ldr	x8, [x20, #0xc8]
10163b170:     	cmp	x8, x21
10163b174:     	b.ne	0x10163b038 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x300>
10163b178:     	mov	x0, x19
10163b17c:     	bl	0x100b8f7f8 <__Z30WM_toolsystem_ref_from_contextPK8bContext>
10163b180:     	add	x8, x0, #0x10
10163b184:     	adrp	x9, 0x104b94000 <_zlibVersion+0x104b94000>
10163b188:     	add	x9, x9, #0x314
10163b18c:     	cmp	x0, #0x0
10163b190:     	csel	x1, x9, x8, eq
10163b194:     	add	x0, x23, #0x68
10163b198:     	mov	w2, #0x40               ; =64
10163b19c:     	bl	0x100819fcc <__Z11BLI_strncpyPcPKcm>
10163b1a0:     	mov	x0, x19
10163b1a4:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163b1a8:     	mov	x27, x0
10163b1ac:     	ldr	x8, [x0, #0x5c0]
10163b1b0:     	cbz	x8, 0x10163b1d0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x498>
10163b1b4:     	ldr	x8, [x8, #0xe0]
10163b1b8:     	cbz	x8, 0x10163b1d0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x498>
10163b1bc:     	str	x8, [x20, #0x1a0]
10163b1c0:     	ldr	x9, [x8]
10163b1c4:     	str	x9, [x20, #0x1a8]
10163b1c8:     	ldr	x8, [x8, #0x8]
10163b1cc:     	str	x8, [x20, #0x1b0]
10163b1d0:     	mov	x0, x19
10163b1d4:     	bl	0x100b82374 <__Z21WM_operator_last_redoPK8bContext>
10163b1d8:     	cbz	x0, 0x10163b0fc <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x3c4>
10163b1dc:     	mov	x24, x0
10163b1e0:     	ldr	x8, [x27, #0x5c0]
10163b1e4:     	add	x0, x8, #0x68
10163b1e8:     	mov	x1, x24
10163b1ec:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163b1f0:     	cmn	w0, #0x1
10163b1f4:     	b.eq	0x10163b034 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163b1f8:     	bl	0x100b7bba4 <__Z31WM_operatortypes_registered_getv>
10163b1fc:     	cbz	x1, 0x10163b034 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163b200:     	ldr	x8, [x24, #0x58]
10163b204:     	lsl	x9, x1, #3
10163b208:     	ldr	x25, [x0]
10163b20c:     	cmp	x25, x8
10163b210:     	b.eq	0x10163b228 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x4f0>
10163b214:     	mov	w25, #0x0               ; =0
10163b218:     	add	x0, x0, #0x8
10163b21c:     	subs	x9, x9, #0x8
10163b220:     	b.ne	0x10163b208 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x4d0>
10163b224:     	b	0x10163b038 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x300>
10163b228:     	cbz	x25, 0x10163b038 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x300>
10163b22c:     	ldr	x8, [x25, #0xe8]
10163b230:     	cbz	x8, 0x10163b034 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163b234:     	str	x24, [x20, #0x180]
10163b238:     	mov	x0, x24
10163b23c:     	bl	0x100b42da0 <__Z29WM_operator_touch_lifetime_idPK10wmOperator>
10163b240:     	stp	x0, x25, [x20, #0x188]
10163b244:     	ldr	x8, [x25, #0xe8]
10163b248:     	str	x8, [x20, #0x198]
10163b24c:     	cbnz	x0, 0x10163b0fc <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x3c4>
10163b250:     	b	0x10163b034 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
