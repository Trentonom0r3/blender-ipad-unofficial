
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37818071469\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101620168 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE>:
101620168:     	stp	x26, x25, [sp, #-0x50]!
10162016c:     	stp	x24, x23, [sp, #0x10]
101620170:     	stp	x22, x21, [sp, #0x20]
101620174:     	stp	x20, x19, [sp, #0x30]
101620178:     	stp	x29, x30, [sp, #0x40]
10162017c:     	add	x29, sp, #0x40
101620180:     	mov	x20, x4
101620184:     	mov	x22, x3
101620188:     	mov	x25, x2
10162018c:     	mov	x21, x1
101620190:     	mov	x19, x0
101620194:     	movi.16b	v0, #0x0
101620198:     	stp	q0, q0, [x4, #0xf0]
10162019c:     	stp	q0, q0, [x4, #0xd0]
1016201a0:     	stp	q0, q0, [x4, #0xb0]
1016201a4:     	stp	q0, q0, [x4, #0x90]
1016201a8:     	stp	q0, q0, [x4, #0x70]
1016201ac:     	stp	q0, q0, [x4, #0x50]
1016201b0:     	stp	q0, q0, [x4, #0x30]
1016201b4:     	stp	q0, q0, [x4, #0x10]
1016201b8:     	str	q0, [x4]
1016201bc:     	add	x8, x4, #0x10d
1016201c0:     	str	xzr, [x8]
1016201c4:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
1016201c8:     	mov	x8, x0
1016201cc:     	mov	w0, #0x0                ; =0
1016201d0:     	cbz	x21, 0x101620214 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
1016201d4:     	cbz	x8, 0x101620214 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
1016201d8:     	add	x0, x8, #0x1a0
1016201dc:     	mov	x1, x21
1016201e0:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
1016201e4:     	cmn	w0, #0x1
1016201e8:     	b.eq	0x101620210 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
1016201ec:     	mov	x0, x21
1016201f0:     	bl	0x104a3b008 <__Z27WM_window_get_active_screenPK8wmWindow>
1016201f4:     	cbz	x0, 0x101620214 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
1016201f8:     	adrp	x8, 0x106d64000 <_build_commit_date>
1016201fc:     	add	x8, x8, #0x28
101620200:     	ldrb	w8, [x8, #0xc21]
101620204:     	tbnz	w8, #0x0, 0x101620210 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101620208:     	ldrb	w8, [x0, #0x1ee]
10162020c:     	cbz	w8, 0x10162022c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xc4>
101620210:     	mov	w0, #0x0                ; =0
101620214:     	ldp	x29, x30, [sp, #0x40]
101620218:     	ldp	x20, x19, [sp, #0x30]
10162021c:     	ldp	x22, x21, [sp, #0x20]
101620220:     	ldp	x24, x23, [sp, #0x10]
101620224:     	ldp	x26, x25, [sp], #0x50
101620228:     	ret
10162022c:     	mov	x8, x0
101620230:     	mov	w0, #0x0                ; =0
101620234:     	cbz	x25, 0x101620214 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101620238:     	ldrb	w9, [x8, #0x1ef]
10162023c:     	cbnz	w9, 0x101620214 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101620240:     	add	x0, x8, #0x1c0
101620244:     	mov	x1, x25
101620248:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10162024c:     	mov	x8, x0
101620250:     	mov	w0, #0x0                ; =0
101620254:     	cbz	x22, 0x101620214 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101620258:     	cmn	w8, #0x1
10162025c:     	b.eq	0x101620214 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101620260:     	add	x0, x25, #0x78
101620264:     	mov	x1, x22
101620268:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10162026c:     	cmn	w0, #0x1
101620270:     	b.eq	0x101620210 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101620274:     	ldrh	w8, [x22, #0xc0]
101620278:     	cmp	w8, #0x8
10162027c:     	b.ne	0x101620210 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101620280:     	ldr	x8, [x22, #0x128]
101620284:     	ldr	x9, [x8, #0xb0]
101620288:     	cbz	x9, 0x101620210 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
10162028c:     	ldrb	w9, [x25, #0x48]
101620290:     	cmp	w9, #0x1
101620294:     	b.ne	0x101620210 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101620298:     	ldr	w9, [x25, #0xd8]
10162029c:     	cmp	w9, #0x4
1016202a0:     	b.eq	0x101620210 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
1016202a4:     	ldrh	w8, [x8, #0x2b0]
1016202a8:     	cbz	w8, 0x101620210 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
1016202ac:     	ldrh	w8, [x22, #0xc4]
1016202b0:     	mov	w9, #0x483              ; =1155
1016202b4:     	tst	w8, w9
1016202b8:     	b.ne	0x101620210 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
1016202bc:     	mov	x0, x19
1016202c0:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
1016202c4:     	mov	x23, x0
1016202c8:     	mov	x0, x19
1016202cc:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
1016202d0:     	mov	x24, x0
1016202d4:     	mov	x0, x19
1016202d8:     	mov	x1, x25
1016202dc:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
1016202e0:     	mov	x0, x19
1016202e4:     	mov	x1, x25
1016202e8:     	mov	x2, x22
1016202ec:     	bl	0x101f6c934 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion>
1016202f0:     	mov	x26, x0
1016202f4:     	cbz	x0, 0x101620318 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
1016202f8:     	add	x0, x25, #0x78
1016202fc:     	mov	x1, x26
101620300:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101620304:     	cmn	w0, #0x1
101620308:     	b.eq	0x101620314 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
10162030c:     	ldrh	w8, [x26, #0xc0]
101620310:     	cbz	w8, 0x101620338 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1d0>
101620314:     	mov	w26, #0x0               ; =0
101620318:     	mov	x0, x19
10162031c:     	mov	x1, x24
101620320:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
101620324:     	mov	x0, x19
101620328:     	mov	x1, x23
10162032c:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
101620330:     	mov	x0, x26
101620334:     	b	0x101620214 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101620338:     	ldr	x8, [x26, #0x128]
10162033c:     	ldrh	w8, [x8, #0x2b0]
101620340:     	cbz	w8, 0x101620314 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
101620344:     	mov	x0, x19
101620348:     	mov	x1, x26
10162034c:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
101620350:     	mov	x0, x19
101620354:     	mov	x1, x20
101620358:     	bl	0x101f6d818 <__Z23UI_ipad_context_captureP8bContextPy>
10162035c:     	ldr	x8, [x20, #0x8]
101620360:     	cmp	x8, x21
101620364:     	csel	w8, wzr, w0, ne
101620368:     	mov	x26, x8
10162036c:     	cmp	w8, #0x1
101620370:     	b.ne	0x101620318 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
101620374:     	mov	x0, x19
101620378:     	bl	0x100b8759c <__Z30WM_toolsystem_ref_from_contextPK8bContext>
10162037c:     	add	x8, x0, #0x10
101620380:     	adrp	x9, 0x104b71000 <_zlibVersion+0x104b71000>
101620384:     	add	x9, x9, #0xeb4
101620388:     	cmp	x0, #0x0
10162038c:     	csel	x1, x9, x8, eq
101620390:     	add	x0, x20, #0x68
101620394:     	mov	w2, #0x40               ; =64
101620398:     	bl	0x100819fcc <__Z11BLI_strncpyPcPKcm>
10162039c:     	mov	x0, x19
1016203a0:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
1016203a4:     	mov	x26, x0
1016203a8:     	ldr	x8, [x0, #0x5c0]
1016203ac:     	cbz	x8, 0x1016203cc <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x264>
1016203b0:     	ldr	x8, [x8, #0xe0]
1016203b4:     	cbz	x8, 0x1016203cc <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x264>
1016203b8:     	str	x8, [x20, #0xe0]
1016203bc:     	ldr	x9, [x8]
1016203c0:     	str	x9, [x20, #0xe8]
1016203c4:     	ldr	x8, [x8, #0x8]
1016203c8:     	str	x8, [x20, #0xf0]
1016203cc:     	mov	x0, x19
1016203d0:     	bl	0x100b7a120 <__Z21WM_operator_last_redoPK8bContext>
1016203d4:     	cbz	x0, 0x10162044c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2e4>
1016203d8:     	mov	x25, x0
1016203dc:     	ldr	x8, [x26, #0x5c0]
1016203e0:     	add	x0, x8, #0x68
1016203e4:     	mov	x1, x25
1016203e8:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
1016203ec:     	cmn	w0, #0x1
1016203f0:     	b.eq	0x101620314 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
1016203f4:     	bl	0x100b73950 <__Z31WM_operatortypes_registered_getv>
1016203f8:     	cbz	x1, 0x101620314 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
1016203fc:     	ldr	x8, [x25, #0x58]
101620400:     	lsl	x9, x1, #3
101620404:     	ldr	x26, [x0]
101620408:     	cmp	x26, x8
10162040c:     	b.eq	0x101620424 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2bc>
101620410:     	mov	w26, #0x0               ; =0
101620414:     	add	x0, x0, #0x8
101620418:     	subs	x9, x9, #0x8
10162041c:     	b.ne	0x101620404 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x29c>
101620420:     	b	0x101620318 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
101620424:     	cbz	x26, 0x101620318 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
101620428:     	ldr	x8, [x26, #0xe8]
10162042c:     	cbz	x8, 0x101620314 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
101620430:     	str	x25, [x20, #0xc0]
101620434:     	mov	x0, x25
101620438:     	bl	0x100b42d58 <__Z29WM_operator_touch_lifetime_idPK10wmOperator>
10162043c:     	stp	x0, x26, [x20, #0xc8]
101620440:     	ldr	x8, [x26, #0xe8]
101620444:     	str	x8, [x20, #0xd8]
101620448:     	cbz	x0, 0x101620314 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
10162044c:     	add	x8, x20, #0x104
101620450:     	str	x22, [x20, #0xa8]
101620454:     	ldr	x9, [x22, #0x128]
101620458:     	ldr	x9, [x9, #0xb0]
10162045c:     	str	x9, [x20, #0xb0]
101620460:     	ldr	x9, [x22, #0x128]
101620464:     	ldr	x9, [x9, #0x298]
101620468:     	str	x9, [x20, #0xb8]
10162046c:     	ldur	q0, [x22, #0xa8]
101620470:     	str	q0, [x8]
101620474:     	mov	x0, x21
101620478:     	bl	0x100b8ddc8 <__Z24WM_window_native_pixel_xPK8wmWindow>
10162047c:     	str	w0, [x20, #0xf8]
101620480:     	mov	x0, x21
101620484:     	bl	0x100b8de00 <__Z24WM_window_native_pixel_yPK8wmWindow>
101620488:     	str	w0, [x20, #0xfc]
10162048c:     	adrp	x8, 0x106d64000 <_build_commit_date>
101620490:     	add	x8, x8, #0xe08
101620494:     	ldr	s0, [x8, #0x2654]
101620498:     	str	s0, [x20, #0x100]
10162049c:     	mov	w8, #0x1                ; =1
1016204a0:     	mov	w26, #0x1               ; =1
1016204a4:     	strb	w8, [x20, #0x114]
1016204a8:     	b	0x101620318 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
