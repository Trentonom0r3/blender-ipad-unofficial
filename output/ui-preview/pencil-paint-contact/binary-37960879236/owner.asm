
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37960879236\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010162323c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE>:
10162323c:     	stp	x26, x25, [sp, #-0x50]!
101623240:     	stp	x24, x23, [sp, #0x10]
101623244:     	stp	x22, x21, [sp, #0x20]
101623248:     	stp	x20, x19, [sp, #0x30]
10162324c:     	stp	x29, x30, [sp, #0x40]
101623250:     	add	x29, sp, #0x40
101623254:     	mov	x20, x4
101623258:     	mov	x22, x3
10162325c:     	mov	x25, x2
101623260:     	mov	x21, x1
101623264:     	mov	x19, x0
101623268:     	movi.16b	v0, #0x0
10162326c:     	stp	q0, q0, [x4, #0xf0]
101623270:     	stp	q0, q0, [x4, #0xd0]
101623274:     	stp	q0, q0, [x4, #0xb0]
101623278:     	stp	q0, q0, [x4, #0x90]
10162327c:     	stp	q0, q0, [x4, #0x70]
101623280:     	stp	q0, q0, [x4, #0x50]
101623284:     	stp	q0, q0, [x4, #0x30]
101623288:     	stp	q0, q0, [x4, #0x10]
10162328c:     	str	q0, [x4]
101623290:     	add	x8, x4, #0x10d
101623294:     	str	xzr, [x8]
101623298:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10162329c:     	mov	x8, x0
1016232a0:     	mov	w0, #0x0                ; =0
1016232a4:     	cbz	x21, 0x1016232e8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
1016232a8:     	cbz	x8, 0x1016232e8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
1016232ac:     	add	x0, x8, #0x1a0
1016232b0:     	mov	x1, x21
1016232b4:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
1016232b8:     	cmn	w0, #0x1
1016232bc:     	b.eq	0x1016232e4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
1016232c0:     	mov	x0, x21
1016232c4:     	bl	0x104a3e2a8 <__Z27WM_window_get_active_screenPK8wmWindow>
1016232c8:     	cbz	x0, 0x1016232e8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
1016232cc:     	adrp	x8, 0x106d64000 <_build_commit_date>
1016232d0:     	add	x8, x8, #0x28
1016232d4:     	ldrb	w8, [x8, #0xc21]
1016232d8:     	tbnz	w8, #0x0, 0x1016232e4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
1016232dc:     	ldrb	w8, [x0, #0x1ee]
1016232e0:     	cbz	w8, 0x101623300 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xc4>
1016232e4:     	mov	w0, #0x0                ; =0
1016232e8:     	ldp	x29, x30, [sp, #0x40]
1016232ec:     	ldp	x20, x19, [sp, #0x30]
1016232f0:     	ldp	x22, x21, [sp, #0x20]
1016232f4:     	ldp	x24, x23, [sp, #0x10]
1016232f8:     	ldp	x26, x25, [sp], #0x50
1016232fc:     	ret
101623300:     	mov	x8, x0
101623304:     	mov	w0, #0x0                ; =0
101623308:     	cbz	x25, 0x1016232e8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
10162330c:     	ldrb	w9, [x8, #0x1ef]
101623310:     	cbnz	w9, 0x1016232e8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101623314:     	add	x0, x8, #0x1c0
101623318:     	mov	x1, x25
10162331c:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101623320:     	mov	x8, x0
101623324:     	mov	w0, #0x0                ; =0
101623328:     	cbz	x22, 0x1016232e8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
10162332c:     	cmn	w8, #0x1
101623330:     	b.eq	0x1016232e8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101623334:     	add	x0, x25, #0x78
101623338:     	mov	x1, x22
10162333c:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101623340:     	cmn	w0, #0x1
101623344:     	b.eq	0x1016232e4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101623348:     	ldrh	w8, [x22, #0xc0]
10162334c:     	cmp	w8, #0x8
101623350:     	b.ne	0x1016232e4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101623354:     	ldr	x8, [x22, #0x128]
101623358:     	ldr	x9, [x8, #0xb0]
10162335c:     	cbz	x9, 0x1016232e4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101623360:     	ldrb	w9, [x25, #0x48]
101623364:     	cmp	w9, #0x1
101623368:     	b.ne	0x1016232e4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
10162336c:     	ldr	w9, [x25, #0xd8]
101623370:     	cmp	w9, #0x4
101623374:     	b.eq	0x1016232e4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101623378:     	ldrh	w8, [x8, #0x2b0]
10162337c:     	cbz	w8, 0x1016232e4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101623380:     	ldrh	w8, [x22, #0xc4]
101623384:     	mov	w9, #0x483              ; =1155
101623388:     	tst	w8, w9
10162338c:     	b.ne	0x1016232e4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101623390:     	mov	x0, x19
101623394:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101623398:     	mov	x23, x0
10162339c:     	mov	x0, x19
1016233a0:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
1016233a4:     	mov	x24, x0
1016233a8:     	mov	x0, x19
1016233ac:     	mov	x1, x25
1016233b0:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
1016233b4:     	mov	x0, x19
1016233b8:     	mov	x1, x25
1016233bc:     	mov	x2, x22
1016233c0:     	bl	0x101f6fad4 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion>
1016233c4:     	mov	x26, x0
1016233c8:     	cbz	x0, 0x1016233ec <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
1016233cc:     	add	x0, x25, #0x78
1016233d0:     	mov	x1, x26
1016233d4:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
1016233d8:     	cmn	w0, #0x1
1016233dc:     	b.eq	0x1016233e8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
1016233e0:     	ldrh	w8, [x26, #0xc0]
1016233e4:     	cbz	w8, 0x10162340c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1d0>
1016233e8:     	mov	w26, #0x0               ; =0
1016233ec:     	mov	x0, x19
1016233f0:     	mov	x1, x23
1016233f4:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
1016233f8:     	mov	x0, x19
1016233fc:     	mov	x1, x24
101623400:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
101623404:     	mov	x0, x26
101623408:     	b	0x1016232e8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
10162340c:     	ldr	x8, [x26, #0x128]
101623410:     	ldrh	w8, [x8, #0x2b0]
101623414:     	cbz	w8, 0x1016233e8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
101623418:     	mov	x0, x19
10162341c:     	mov	x1, x26
101623420:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
101623424:     	mov	x0, x19
101623428:     	mov	x1, x20
10162342c:     	bl	0x101f70af0 <__Z23UI_ipad_context_captureP8bContextPy>
101623430:     	ldr	x8, [x20, #0x8]
101623434:     	cmp	x8, x21
101623438:     	csel	w8, wzr, w0, ne
10162343c:     	mov	x26, x8
101623440:     	cmp	w8, #0x1
101623444:     	b.ne	0x1016233ec <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
101623448:     	mov	x0, x19
10162344c:     	bl	0x100b87b2c <__Z30WM_toolsystem_ref_from_contextPK8bContext>
101623450:     	add	x8, x0, #0x10
101623454:     	adrp	x9, 0x104b75000 <_zlibVersion+0x104b75000>
101623458:     	add	x9, x9, #0x14c
10162345c:     	cmp	x0, #0x0
101623460:     	csel	x1, x9, x8, eq
101623464:     	add	x0, x20, #0x68
101623468:     	mov	w2, #0x40               ; =64
10162346c:     	bl	0x100819fcc <__Z11BLI_strncpyPcPKcm>
101623470:     	mov	x0, x19
101623474:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101623478:     	mov	x26, x0
10162347c:     	ldr	x8, [x0, #0x5c0]
101623480:     	cbz	x8, 0x1016234a0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x264>
101623484:     	ldr	x8, [x8, #0xe0]
101623488:     	cbz	x8, 0x1016234a0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x264>
10162348c:     	str	x8, [x20, #0xe0]
101623490:     	ldr	x9, [x8]
101623494:     	str	x9, [x20, #0xe8]
101623498:     	ldr	x8, [x8, #0x8]
10162349c:     	str	x8, [x20, #0xf0]
1016234a0:     	mov	x0, x19
1016234a4:     	bl	0x100b7a6b0 <__Z21WM_operator_last_redoPK8bContext>
1016234a8:     	cbz	x0, 0x101623520 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2e4>
1016234ac:     	mov	x25, x0
1016234b0:     	ldr	x8, [x26, #0x5c0]
1016234b4:     	add	x0, x8, #0x68
1016234b8:     	mov	x1, x25
1016234bc:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
1016234c0:     	cmn	w0, #0x1
1016234c4:     	b.eq	0x1016233e8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
1016234c8:     	bl	0x100b73ee0 <__Z31WM_operatortypes_registered_getv>
1016234cc:     	cbz	x1, 0x1016233e8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
1016234d0:     	ldr	x8, [x25, #0x58]
1016234d4:     	lsl	x9, x1, #3
1016234d8:     	ldr	x26, [x0]
1016234dc:     	cmp	x26, x8
1016234e0:     	b.eq	0x1016234f8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2bc>
1016234e4:     	mov	w26, #0x0               ; =0
1016234e8:     	add	x0, x0, #0x8
1016234ec:     	subs	x9, x9, #0x8
1016234f0:     	b.ne	0x1016234d8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x29c>
1016234f4:     	b	0x1016233ec <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
1016234f8:     	cbz	x26, 0x1016233ec <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
1016234fc:     	ldr	x8, [x26, #0xe8]
101623500:     	cbz	x8, 0x1016233e8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
101623504:     	str	x25, [x20, #0xc0]
101623508:     	mov	x0, x25
10162350c:     	bl	0x100b42d58 <__Z29WM_operator_touch_lifetime_idPK10wmOperator>
101623510:     	stp	x0, x26, [x20, #0xc8]
101623514:     	ldr	x8, [x26, #0xe8]
101623518:     	str	x8, [x20, #0xd8]
10162351c:     	cbz	x0, 0x1016233e8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
101623520:     	add	x8, x20, #0x104
101623524:     	str	x22, [x20, #0xa8]
101623528:     	ldr	x9, [x22, #0x128]
10162352c:     	ldr	x9, [x9, #0xb0]
101623530:     	str	x9, [x20, #0xb0]
101623534:     	ldr	x9, [x22, #0x128]
101623538:     	ldr	x9, [x9, #0x298]
10162353c:     	str	x9, [x20, #0xb8]
101623540:     	ldur	q0, [x22, #0xa8]
101623544:     	str	q0, [x8]
101623548:     	mov	x0, x21
10162354c:     	bl	0x100b8e358 <__Z24WM_window_native_pixel_xPK8wmWindow>
101623550:     	str	w0, [x20, #0xf8]
101623554:     	mov	x0, x21
101623558:     	bl	0x100b8e390 <__Z24WM_window_native_pixel_yPK8wmWindow>
10162355c:     	str	w0, [x20, #0xfc]
101623560:     	adrp	x8, 0x106d64000 <_build_commit_date>
101623564:     	add	x8, x8, #0xe08
101623568:     	ldr	s0, [x8, #0x2654]
10162356c:     	str	s0, [x20, #0x100]
101623570:     	mov	w8, #0x1                ; =1
101623574:     	mov	w26, #0x1               ; =1
101623578:     	strb	w8, [x20, #0x114]
10162357c:     	b	0x1016233ec <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
