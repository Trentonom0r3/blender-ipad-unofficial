
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-38019754190\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101624da4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE>:
101624da4:     	stp	x26, x25, [sp, #-0x50]!
101624da8:     	stp	x24, x23, [sp, #0x10]
101624dac:     	stp	x22, x21, [sp, #0x20]
101624db0:     	stp	x20, x19, [sp, #0x30]
101624db4:     	stp	x29, x30, [sp, #0x40]
101624db8:     	add	x29, sp, #0x40
101624dbc:     	mov	x20, x4
101624dc0:     	mov	x22, x3
101624dc4:     	mov	x25, x2
101624dc8:     	mov	x21, x1
101624dcc:     	mov	x19, x0
101624dd0:     	movi.16b	v0, #0x0
101624dd4:     	stp	q0, q0, [x4, #0xf0]
101624dd8:     	stp	q0, q0, [x4, #0xd0]
101624ddc:     	stp	q0, q0, [x4, #0xb0]
101624de0:     	stp	q0, q0, [x4, #0x90]
101624de4:     	stp	q0, q0, [x4, #0x70]
101624de8:     	stp	q0, q0, [x4, #0x50]
101624dec:     	stp	q0, q0, [x4, #0x30]
101624df0:     	stp	q0, q0, [x4, #0x10]
101624df4:     	str	q0, [x4]
101624df8:     	add	x8, x4, #0x10d
101624dfc:     	str	xzr, [x8]
101624e00:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101624e04:     	mov	x8, x0
101624e08:     	mov	w0, #0x0                ; =0
101624e0c:     	cbz	x21, 0x101624e50 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101624e10:     	cbz	x8, 0x101624e50 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101624e14:     	add	x0, x8, #0x1a0
101624e18:     	mov	x1, x21
101624e1c:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101624e20:     	cmn	w0, #0x1
101624e24:     	b.eq	0x101624e4c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101624e28:     	mov	x0, x21
101624e2c:     	bl	0x104a40180 <__Z27WM_window_get_active_screenPK8wmWindow>
101624e30:     	cbz	x0, 0x101624e50 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101624e34:     	adrp	x8, 0x106d68000 <_build_commit_date>
101624e38:     	add	x8, x8, #0x28
101624e3c:     	ldrb	w8, [x8, #0xc21]
101624e40:     	tbnz	w8, #0x0, 0x101624e4c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101624e44:     	ldrb	w8, [x0, #0x1ee]
101624e48:     	cbz	w8, 0x101624e68 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xc4>
101624e4c:     	mov	w0, #0x0                ; =0
101624e50:     	ldp	x29, x30, [sp, #0x40]
101624e54:     	ldp	x20, x19, [sp, #0x30]
101624e58:     	ldp	x22, x21, [sp, #0x20]
101624e5c:     	ldp	x24, x23, [sp, #0x10]
101624e60:     	ldp	x26, x25, [sp], #0x50
101624e64:     	ret
101624e68:     	mov	x8, x0
101624e6c:     	mov	w0, #0x0                ; =0
101624e70:     	cbz	x25, 0x101624e50 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101624e74:     	ldrb	w9, [x8, #0x1ef]
101624e78:     	cbnz	w9, 0x101624e50 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101624e7c:     	add	x0, x8, #0x1c0
101624e80:     	mov	x1, x25
101624e84:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101624e88:     	mov	x8, x0
101624e8c:     	mov	w0, #0x0                ; =0
101624e90:     	cbz	x22, 0x101624e50 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101624e94:     	cmn	w8, #0x1
101624e98:     	b.eq	0x101624e50 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101624e9c:     	add	x0, x25, #0x78
101624ea0:     	mov	x1, x22
101624ea4:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101624ea8:     	cmn	w0, #0x1
101624eac:     	b.eq	0x101624e4c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101624eb0:     	ldrh	w8, [x22, #0xc0]
101624eb4:     	cmp	w8, #0x8
101624eb8:     	b.ne	0x101624e4c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101624ebc:     	ldr	x8, [x22, #0x128]
101624ec0:     	ldr	x9, [x8, #0xb0]
101624ec4:     	cbz	x9, 0x101624e4c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101624ec8:     	ldrb	w9, [x25, #0x48]
101624ecc:     	cmp	w9, #0x1
101624ed0:     	b.ne	0x101624e4c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101624ed4:     	ldr	w9, [x25, #0xd8]
101624ed8:     	cmp	w9, #0x4
101624edc:     	b.eq	0x101624e4c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101624ee0:     	ldrh	w8, [x8, #0x2b0]
101624ee4:     	cbz	w8, 0x101624e4c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101624ee8:     	ldrh	w8, [x22, #0xc4]
101624eec:     	mov	w9, #0x483              ; =1155
101624ef0:     	tst	w8, w9
101624ef4:     	b.ne	0x101624e4c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101624ef8:     	mov	x0, x19
101624efc:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101624f00:     	mov	x23, x0
101624f04:     	mov	x0, x19
101624f08:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
101624f0c:     	mov	x24, x0
101624f10:     	mov	x0, x19
101624f14:     	mov	x1, x25
101624f18:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
101624f1c:     	mov	x0, x19
101624f20:     	mov	x1, x25
101624f24:     	mov	x2, x22
101624f28:     	bl	0x101f7192c <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion>
101624f2c:     	mov	x26, x0
101624f30:     	cbz	x0, 0x101624f54 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
101624f34:     	add	x0, x25, #0x78
101624f38:     	mov	x1, x26
101624f3c:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101624f40:     	cmn	w0, #0x1
101624f44:     	b.eq	0x101624f50 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
101624f48:     	ldrh	w8, [x26, #0xc0]
101624f4c:     	cbz	w8, 0x101624f74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1d0>
101624f50:     	mov	w26, #0x0               ; =0
101624f54:     	mov	x0, x19
101624f58:     	mov	x1, x23
101624f5c:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
101624f60:     	mov	x0, x19
101624f64:     	mov	x1, x24
101624f68:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
101624f6c:     	mov	x0, x26
101624f70:     	b	0x101624e50 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101624f74:     	ldr	x8, [x26, #0x128]
101624f78:     	ldrh	w8, [x8, #0x2b0]
101624f7c:     	cbz	w8, 0x101624f50 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
101624f80:     	mov	x0, x19
101624f84:     	mov	x1, x26
101624f88:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
101624f8c:     	mov	x0, x19
101624f90:     	mov	x1, x20
101624f94:     	bl	0x101f72948 <__Z23UI_ipad_context_captureP8bContextPy>
101624f98:     	ldr	x8, [x20, #0x8]
101624f9c:     	cmp	x8, x21
101624fa0:     	csel	w8, wzr, w0, ne
101624fa4:     	mov	x26, x8
101624fa8:     	cmp	w8, #0x1
101624fac:     	b.ne	0x101624f54 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
101624fb0:     	mov	x0, x19
101624fb4:     	bl	0x100b89098 <__Z30WM_toolsystem_ref_from_contextPK8bContext>
101624fb8:     	add	x8, x0, #0x10
101624fbc:     	adrp	x9, 0x104b77000 <_zlibVersion+0x104b77000>
101624fc0:     	add	x9, x9, #0x9c
101624fc4:     	cmp	x0, #0x0
101624fc8:     	csel	x1, x9, x8, eq
101624fcc:     	add	x0, x20, #0x68
101624fd0:     	mov	w2, #0x40               ; =64
101624fd4:     	bl	0x100819fcc <__Z11BLI_strncpyPcPKcm>
101624fd8:     	mov	x0, x19
101624fdc:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101624fe0:     	mov	x26, x0
101624fe4:     	ldr	x8, [x0, #0x5c0]
101624fe8:     	cbz	x8, 0x101625008 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x264>
101624fec:     	ldr	x8, [x8, #0xe0]
101624ff0:     	cbz	x8, 0x101625008 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x264>
101624ff4:     	str	x8, [x20, #0xe0]
101624ff8:     	ldr	x9, [x8]
101624ffc:     	str	x9, [x20, #0xe8]
101625000:     	ldr	x8, [x8, #0x8]
101625004:     	str	x8, [x20, #0xf0]
101625008:     	mov	x0, x19
10162500c:     	bl	0x100b7bc1c <__Z21WM_operator_last_redoPK8bContext>
101625010:     	cbz	x0, 0x101625088 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2e4>
101625014:     	mov	x25, x0
101625018:     	ldr	x8, [x26, #0x5c0]
10162501c:     	add	x0, x8, #0x68
101625020:     	mov	x1, x25
101625024:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101625028:     	cmn	w0, #0x1
10162502c:     	b.eq	0x101624f50 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
101625030:     	bl	0x100b7544c <__Z31WM_operatortypes_registered_getv>
101625034:     	cbz	x1, 0x101624f50 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
101625038:     	ldr	x8, [x25, #0x58]
10162503c:     	lsl	x9, x1, #3
101625040:     	ldr	x26, [x0]
101625044:     	cmp	x26, x8
101625048:     	b.eq	0x101625060 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2bc>
10162504c:     	mov	w26, #0x0               ; =0
101625050:     	add	x0, x0, #0x8
101625054:     	subs	x9, x9, #0x8
101625058:     	b.ne	0x101625040 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x29c>
10162505c:     	b	0x101624f54 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
101625060:     	cbz	x26, 0x101624f54 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
101625064:     	ldr	x8, [x26, #0xe8]
101625068:     	cbz	x8, 0x101624f50 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
10162506c:     	str	x25, [x20, #0xc0]
101625070:     	mov	x0, x25
101625074:     	bl	0x100b42d98 <__Z29WM_operator_touch_lifetime_idPK10wmOperator>
101625078:     	stp	x0, x26, [x20, #0xc8]
10162507c:     	ldr	x8, [x26, #0xe8]
101625080:     	str	x8, [x20, #0xd8]
101625084:     	cbz	x0, 0x101624f50 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
101625088:     	add	x8, x20, #0x104
10162508c:     	str	x22, [x20, #0xa8]
101625090:     	ldr	x9, [x22, #0x128]
101625094:     	ldr	x9, [x9, #0xb0]
101625098:     	str	x9, [x20, #0xb0]
10162509c:     	ldr	x9, [x22, #0x128]
1016250a0:     	ldr	x9, [x9, #0x298]
1016250a4:     	str	x9, [x20, #0xb8]
1016250a8:     	ldur	q0, [x22, #0xa8]
1016250ac:     	str	q0, [x8]
1016250b0:     	mov	x0, x21
1016250b4:     	bl	0x100b8f8c4 <__Z24WM_window_native_pixel_xPK8wmWindow>
1016250b8:     	str	w0, [x20, #0xf8]
1016250bc:     	mov	x0, x21
1016250c0:     	bl	0x100b8f8fc <__Z24WM_window_native_pixel_yPK8wmWindow>
1016250c4:     	str	w0, [x20, #0xfc]
1016250c8:     	adrp	x8, 0x106d68000 <_build_commit_date>
1016250cc:     	add	x8, x8, #0xe08
1016250d0:     	ldr	s0, [x8, #0x2654]
1016250d4:     	str	s0, [x20, #0x100]
1016250d8:     	mov	w8, #0x1                ; =1
1016250dc:     	mov	w26, #0x1               ; =1
1016250e0:     	strb	w8, [x20, #0x114]
1016250e4:     	b	0x101624f54 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
