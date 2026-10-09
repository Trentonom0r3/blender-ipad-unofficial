
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37883530390\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101620f74 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE>:
101620f74:     	stp	x26, x25, [sp, #-0x50]!
101620f78:     	stp	x24, x23, [sp, #0x10]
101620f7c:     	stp	x22, x21, [sp, #0x20]
101620f80:     	stp	x20, x19, [sp, #0x30]
101620f84:     	stp	x29, x30, [sp, #0x40]
101620f88:     	add	x29, sp, #0x40
101620f8c:     	mov	x20, x4
101620f90:     	mov	x22, x3
101620f94:     	mov	x25, x2
101620f98:     	mov	x21, x1
101620f9c:     	mov	x19, x0
101620fa0:     	movi.16b	v0, #0x0
101620fa4:     	stp	q0, q0, [x4, #0xf0]
101620fa8:     	stp	q0, q0, [x4, #0xd0]
101620fac:     	stp	q0, q0, [x4, #0xb0]
101620fb0:     	stp	q0, q0, [x4, #0x90]
101620fb4:     	stp	q0, q0, [x4, #0x70]
101620fb8:     	stp	q0, q0, [x4, #0x50]
101620fbc:     	stp	q0, q0, [x4, #0x30]
101620fc0:     	stp	q0, q0, [x4, #0x10]
101620fc4:     	str	q0, [x4]
101620fc8:     	add	x8, x4, #0x10d
101620fcc:     	str	xzr, [x8]
101620fd0:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101620fd4:     	mov	x8, x0
101620fd8:     	mov	w0, #0x0                ; =0
101620fdc:     	cbz	x21, 0x101621020 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101620fe0:     	cbz	x8, 0x101621020 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101620fe4:     	add	x0, x8, #0x1a0
101620fe8:     	mov	x1, x21
101620fec:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101620ff0:     	cmn	w0, #0x1
101620ff4:     	b.eq	0x10162101c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101620ff8:     	mov	x0, x21
101620ffc:     	bl	0x104a3c048 <__Z27WM_window_get_active_screenPK8wmWindow>
101621000:     	cbz	x0, 0x101621020 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101621004:     	adrp	x8, 0x106d64000 <_build_commit_date>
101621008:     	add	x8, x8, #0x28
10162100c:     	ldrb	w8, [x8, #0xc21]
101621010:     	tbnz	w8, #0x0, 0x10162101c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101621014:     	ldrb	w8, [x0, #0x1ee]
101621018:     	cbz	w8, 0x101621038 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xc4>
10162101c:     	mov	w0, #0x0                ; =0
101621020:     	ldp	x29, x30, [sp, #0x40]
101621024:     	ldp	x20, x19, [sp, #0x30]
101621028:     	ldp	x22, x21, [sp, #0x20]
10162102c:     	ldp	x24, x23, [sp, #0x10]
101621030:     	ldp	x26, x25, [sp], #0x50
101621034:     	ret
101621038:     	mov	x8, x0
10162103c:     	mov	w0, #0x0                ; =0
101621040:     	cbz	x25, 0x101621020 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101621044:     	ldrb	w9, [x8, #0x1ef]
101621048:     	cbnz	w9, 0x101621020 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
10162104c:     	add	x0, x8, #0x1c0
101621050:     	mov	x1, x25
101621054:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101621058:     	mov	x8, x0
10162105c:     	mov	w0, #0x0                ; =0
101621060:     	cbz	x22, 0x101621020 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101621064:     	cmn	w8, #0x1
101621068:     	b.eq	0x101621020 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
10162106c:     	add	x0, x25, #0x78
101621070:     	mov	x1, x22
101621074:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101621078:     	cmn	w0, #0x1
10162107c:     	b.eq	0x10162101c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101621080:     	ldrh	w8, [x22, #0xc0]
101621084:     	cmp	w8, #0x8
101621088:     	b.ne	0x10162101c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
10162108c:     	ldr	x8, [x22, #0x128]
101621090:     	ldr	x9, [x8, #0xb0]
101621094:     	cbz	x9, 0x10162101c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101621098:     	ldrb	w9, [x25, #0x48]
10162109c:     	cmp	w9, #0x1
1016210a0:     	b.ne	0x10162101c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
1016210a4:     	ldr	w9, [x25, #0xd8]
1016210a8:     	cmp	w9, #0x4
1016210ac:     	b.eq	0x10162101c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
1016210b0:     	ldrh	w8, [x8, #0x2b0]
1016210b4:     	cbz	w8, 0x10162101c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
1016210b8:     	ldrh	w8, [x22, #0xc4]
1016210bc:     	mov	w9, #0x483              ; =1155
1016210c0:     	tst	w8, w9
1016210c4:     	b.ne	0x10162101c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
1016210c8:     	mov	x0, x19
1016210cc:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
1016210d0:     	mov	x23, x0
1016210d4:     	mov	x0, x19
1016210d8:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
1016210dc:     	mov	x24, x0
1016210e0:     	mov	x0, x19
1016210e4:     	mov	x1, x25
1016210e8:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
1016210ec:     	mov	x0, x19
1016210f0:     	mov	x1, x25
1016210f4:     	mov	x2, x22
1016210f8:     	bl	0x101f6d86c <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion>
1016210fc:     	mov	x26, x0
101621100:     	cbz	x0, 0x101621124 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
101621104:     	add	x0, x25, #0x78
101621108:     	mov	x1, x26
10162110c:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101621110:     	cmn	w0, #0x1
101621114:     	b.eq	0x101621120 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
101621118:     	ldrh	w8, [x26, #0xc0]
10162111c:     	cbz	w8, 0x101621144 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1d0>
101621120:     	mov	w26, #0x0               ; =0
101621124:     	mov	x0, x19
101621128:     	mov	x1, x23
10162112c:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
101621130:     	mov	x0, x19
101621134:     	mov	x1, x24
101621138:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
10162113c:     	mov	x0, x26
101621140:     	b	0x101621020 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101621144:     	ldr	x8, [x26, #0x128]
101621148:     	ldrh	w8, [x8, #0x2b0]
10162114c:     	cbz	w8, 0x101621120 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
101621150:     	mov	x0, x19
101621154:     	mov	x1, x26
101621158:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
10162115c:     	mov	x0, x19
101621160:     	mov	x1, x20
101621164:     	bl	0x101f6e888 <__Z23UI_ipad_context_captureP8bContextPy>
101621168:     	ldr	x8, [x20, #0x8]
10162116c:     	cmp	x8, x21
101621170:     	csel	w8, wzr, w0, ne
101621174:     	mov	x26, x8
101621178:     	cmp	w8, #0x1
10162117c:     	b.ne	0x101621124 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
101621180:     	mov	x0, x19
101621184:     	bl	0x100b875a8 <__Z30WM_toolsystem_ref_from_contextPK8bContext>
101621188:     	add	x8, x0, #0x10
10162118c:     	adrp	x9, 0x104b72000 <_zlibVersion+0x104b72000>
101621190:     	add	x9, x9, #0xef4
101621194:     	cmp	x0, #0x0
101621198:     	csel	x1, x9, x8, eq
10162119c:     	add	x0, x20, #0x68
1016211a0:     	mov	w2, #0x40               ; =64
1016211a4:     	bl	0x100819fcc <__Z11BLI_strncpyPcPKcm>
1016211a8:     	mov	x0, x19
1016211ac:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
1016211b0:     	mov	x26, x0
1016211b4:     	ldr	x8, [x0, #0x5c0]
1016211b8:     	cbz	x8, 0x1016211d8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x264>
1016211bc:     	ldr	x8, [x8, #0xe0]
1016211c0:     	cbz	x8, 0x1016211d8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x264>
1016211c4:     	str	x8, [x20, #0xe0]
1016211c8:     	ldr	x9, [x8]
1016211cc:     	str	x9, [x20, #0xe8]
1016211d0:     	ldr	x8, [x8, #0x8]
1016211d4:     	str	x8, [x20, #0xf0]
1016211d8:     	mov	x0, x19
1016211dc:     	bl	0x100b7a12c <__Z21WM_operator_last_redoPK8bContext>
1016211e0:     	cbz	x0, 0x101621258 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2e4>
1016211e4:     	mov	x25, x0
1016211e8:     	ldr	x8, [x26, #0x5c0]
1016211ec:     	add	x0, x8, #0x68
1016211f0:     	mov	x1, x25
1016211f4:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
1016211f8:     	cmn	w0, #0x1
1016211fc:     	b.eq	0x101621120 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
101621200:     	bl	0x100b7395c <__Z31WM_operatortypes_registered_getv>
101621204:     	cbz	x1, 0x101621120 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
101621208:     	ldr	x8, [x25, #0x58]
10162120c:     	lsl	x9, x1, #3
101621210:     	ldr	x26, [x0]
101621214:     	cmp	x26, x8
101621218:     	b.eq	0x101621230 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2bc>
10162121c:     	mov	w26, #0x0               ; =0
101621220:     	add	x0, x0, #0x8
101621224:     	subs	x9, x9, #0x8
101621228:     	b.ne	0x101621210 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x29c>
10162122c:     	b	0x101621124 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
101621230:     	cbz	x26, 0x101621124 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
101621234:     	ldr	x8, [x26, #0xe8]
101621238:     	cbz	x8, 0x101621120 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
10162123c:     	str	x25, [x20, #0xc0]
101621240:     	mov	x0, x25
101621244:     	bl	0x100b42d58 <__Z29WM_operator_touch_lifetime_idPK10wmOperator>
101621248:     	stp	x0, x26, [x20, #0xc8]
10162124c:     	ldr	x8, [x26, #0xe8]
101621250:     	str	x8, [x20, #0xd8]
101621254:     	cbz	x0, 0x101621120 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
101621258:     	add	x8, x20, #0x104
10162125c:     	str	x22, [x20, #0xa8]
101621260:     	ldr	x9, [x22, #0x128]
101621264:     	ldr	x9, [x9, #0xb0]
101621268:     	str	x9, [x20, #0xb0]
10162126c:     	ldr	x9, [x22, #0x128]
101621270:     	ldr	x9, [x9, #0x298]
101621274:     	str	x9, [x20, #0xb8]
101621278:     	ldur	q0, [x22, #0xa8]
10162127c:     	str	q0, [x8]
101621280:     	mov	x0, x21
101621284:     	bl	0x100b8ddd4 <__Z24WM_window_native_pixel_xPK8wmWindow>
101621288:     	str	w0, [x20, #0xf8]
10162128c:     	mov	x0, x21
101621290:     	bl	0x100b8de0c <__Z24WM_window_native_pixel_yPK8wmWindow>
101621294:     	str	w0, [x20, #0xfc]
101621298:     	adrp	x8, 0x106d64000 <_build_commit_date>
10162129c:     	add	x8, x8, #0xe08
1016212a0:     	ldr	s0, [x8, #0x2654]
1016212a4:     	str	s0, [x20, #0x100]
1016212a8:     	mov	w8, #0x1                ; =1
1016212ac:     	mov	w26, #0x1               ; =1
1016212b0:     	strb	w8, [x20, #0x114]
1016212b4:     	b	0x101621124 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
