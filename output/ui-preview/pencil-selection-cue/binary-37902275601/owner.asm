
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37902275601\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001016214f4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE>:
1016214f4:     	stp	x26, x25, [sp, #-0x50]!
1016214f8:     	stp	x24, x23, [sp, #0x10]
1016214fc:     	stp	x22, x21, [sp, #0x20]
101621500:     	stp	x20, x19, [sp, #0x30]
101621504:     	stp	x29, x30, [sp, #0x40]
101621508:     	add	x29, sp, #0x40
10162150c:     	mov	x20, x4
101621510:     	mov	x22, x3
101621514:     	mov	x25, x2
101621518:     	mov	x21, x1
10162151c:     	mov	x19, x0
101621520:     	movi.16b	v0, #0x0
101621524:     	stp	q0, q0, [x4, #0xf0]
101621528:     	stp	q0, q0, [x4, #0xd0]
10162152c:     	stp	q0, q0, [x4, #0xb0]
101621530:     	stp	q0, q0, [x4, #0x90]
101621534:     	stp	q0, q0, [x4, #0x70]
101621538:     	stp	q0, q0, [x4, #0x50]
10162153c:     	stp	q0, q0, [x4, #0x30]
101621540:     	stp	q0, q0, [x4, #0x10]
101621544:     	str	q0, [x4]
101621548:     	add	x8, x4, #0x10d
10162154c:     	str	xzr, [x8]
101621550:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101621554:     	mov	x8, x0
101621558:     	mov	w0, #0x0                ; =0
10162155c:     	cbz	x21, 0x1016215a0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101621560:     	cbz	x8, 0x1016215a0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101621564:     	add	x0, x8, #0x1a0
101621568:     	mov	x1, x21
10162156c:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101621570:     	cmn	w0, #0x1
101621574:     	b.eq	0x10162159c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101621578:     	mov	x0, x21
10162157c:     	bl	0x104a3c5c8 <__Z27WM_window_get_active_screenPK8wmWindow>
101621580:     	cbz	x0, 0x1016215a0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
101621584:     	adrp	x8, 0x106d64000 <_build_commit_date>
101621588:     	add	x8, x8, #0x28
10162158c:     	ldrb	w8, [x8, #0xc21]
101621590:     	tbnz	w8, #0x0, 0x10162159c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101621594:     	ldrb	w8, [x0, #0x1ee]
101621598:     	cbz	w8, 0x1016215b8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xc4>
10162159c:     	mov	w0, #0x0                ; =0
1016215a0:     	ldp	x29, x30, [sp, #0x40]
1016215a4:     	ldp	x20, x19, [sp, #0x30]
1016215a8:     	ldp	x22, x21, [sp, #0x20]
1016215ac:     	ldp	x24, x23, [sp, #0x10]
1016215b0:     	ldp	x26, x25, [sp], #0x50
1016215b4:     	ret
1016215b8:     	mov	x8, x0
1016215bc:     	mov	w0, #0x0                ; =0
1016215c0:     	cbz	x25, 0x1016215a0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
1016215c4:     	ldrb	w9, [x8, #0x1ef]
1016215c8:     	cbnz	w9, 0x1016215a0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
1016215cc:     	add	x0, x8, #0x1c0
1016215d0:     	mov	x1, x25
1016215d4:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
1016215d8:     	mov	x8, x0
1016215dc:     	mov	w0, #0x0                ; =0
1016215e0:     	cbz	x22, 0x1016215a0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
1016215e4:     	cmn	w8, #0x1
1016215e8:     	b.eq	0x1016215a0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
1016215ec:     	add	x0, x25, #0x78
1016215f0:     	mov	x1, x22
1016215f4:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
1016215f8:     	cmn	w0, #0x1
1016215fc:     	b.eq	0x10162159c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101621600:     	ldrh	w8, [x22, #0xc0]
101621604:     	cmp	w8, #0x8
101621608:     	b.ne	0x10162159c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
10162160c:     	ldr	x8, [x22, #0x128]
101621610:     	ldr	x9, [x8, #0xb0]
101621614:     	cbz	x9, 0x10162159c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101621618:     	ldrb	w9, [x25, #0x48]
10162161c:     	cmp	w9, #0x1
101621620:     	b.ne	0x10162159c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101621624:     	ldr	w9, [x25, #0xd8]
101621628:     	cmp	w9, #0x4
10162162c:     	b.eq	0x10162159c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101621630:     	ldrh	w8, [x8, #0x2b0]
101621634:     	cbz	w8, 0x10162159c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101621638:     	ldrh	w8, [x22, #0xc4]
10162163c:     	mov	w9, #0x483              ; =1155
101621640:     	tst	w8, w9
101621644:     	b.ne	0x10162159c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xa8>
101621648:     	mov	x0, x19
10162164c:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101621650:     	mov	x23, x0
101621654:     	mov	x0, x19
101621658:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
10162165c:     	mov	x24, x0
101621660:     	mov	x0, x19
101621664:     	mov	x1, x25
101621668:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
10162166c:     	mov	x0, x19
101621670:     	mov	x1, x25
101621674:     	mov	x2, x22
101621678:     	bl	0x101f6ddec <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion>
10162167c:     	mov	x26, x0
101621680:     	cbz	x0, 0x1016216a4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
101621684:     	add	x0, x25, #0x78
101621688:     	mov	x1, x26
10162168c:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101621690:     	cmn	w0, #0x1
101621694:     	b.eq	0x1016216a0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
101621698:     	ldrh	w8, [x26, #0xc0]
10162169c:     	cbz	w8, 0x1016216c4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1d0>
1016216a0:     	mov	w26, #0x0               ; =0
1016216a4:     	mov	x0, x19
1016216a8:     	mov	x1, x23
1016216ac:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
1016216b0:     	mov	x0, x19
1016216b4:     	mov	x1, x24
1016216b8:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
1016216bc:     	mov	x0, x26
1016216c0:     	b	0x1016215a0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0xac>
1016216c4:     	ldr	x8, [x26, #0x128]
1016216c8:     	ldrh	w8, [x8, #0x2b0]
1016216cc:     	cbz	w8, 0x1016216a0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
1016216d0:     	mov	x0, x19
1016216d4:     	mov	x1, x26
1016216d8:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
1016216dc:     	mov	x0, x19
1016216e0:     	mov	x1, x20
1016216e4:     	bl	0x101f6ee08 <__Z23UI_ipad_context_captureP8bContextPy>
1016216e8:     	ldr	x8, [x20, #0x8]
1016216ec:     	cmp	x8, x21
1016216f0:     	csel	w8, wzr, w0, ne
1016216f4:     	mov	x26, x8
1016216f8:     	cmp	w8, #0x1
1016216fc:     	b.ne	0x1016216a4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
101621700:     	mov	x0, x19
101621704:     	bl	0x100b87b2c <__Z30WM_toolsystem_ref_from_contextPK8bContext>
101621708:     	add	x8, x0, #0x10
10162170c:     	adrp	x9, 0x104b73000 <_zlibVersion+0x104b73000>
101621710:     	add	x9, x9, #0x474
101621714:     	cmp	x0, #0x0
101621718:     	csel	x1, x9, x8, eq
10162171c:     	add	x0, x20, #0x68
101621720:     	mov	w2, #0x40               ; =64
101621724:     	bl	0x100819fcc <__Z11BLI_strncpyPcPKcm>
101621728:     	mov	x0, x19
10162172c:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101621730:     	mov	x26, x0
101621734:     	ldr	x8, [x0, #0x5c0]
101621738:     	cbz	x8, 0x101621758 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x264>
10162173c:     	ldr	x8, [x8, #0xe0]
101621740:     	cbz	x8, 0x101621758 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x264>
101621744:     	str	x8, [x20, #0xe0]
101621748:     	ldr	x9, [x8]
10162174c:     	str	x9, [x20, #0xe8]
101621750:     	ldr	x8, [x8, #0x8]
101621754:     	str	x8, [x20, #0xf0]
101621758:     	mov	x0, x19
10162175c:     	bl	0x100b7a6b0 <__Z21WM_operator_last_redoPK8bContext>
101621760:     	cbz	x0, 0x1016217d8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2e4>
101621764:     	mov	x25, x0
101621768:     	ldr	x8, [x26, #0x5c0]
10162176c:     	add	x0, x8, #0x68
101621770:     	mov	x1, x25
101621774:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101621778:     	cmn	w0, #0x1
10162177c:     	b.eq	0x1016216a0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
101621780:     	bl	0x100b73ee0 <__Z31WM_operatortypes_registered_getv>
101621784:     	cbz	x1, 0x1016216a0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
101621788:     	ldr	x8, [x25, #0x58]
10162178c:     	lsl	x9, x1, #3
101621790:     	ldr	x26, [x0]
101621794:     	cmp	x26, x8
101621798:     	b.eq	0x1016217b0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2bc>
10162179c:     	mov	w26, #0x0               ; =0
1016217a0:     	add	x0, x0, #0x8
1016217a4:     	subs	x9, x9, #0x8
1016217a8:     	b.ne	0x101621790 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x29c>
1016217ac:     	b	0x1016216a4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
1016217b0:     	cbz	x26, 0x1016216a4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
1016217b4:     	ldr	x8, [x26, #0xe8]
1016217b8:     	cbz	x8, 0x1016216a0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
1016217bc:     	str	x25, [x20, #0xc0]
1016217c0:     	mov	x0, x25
1016217c4:     	bl	0x100b42d58 <__Z29WM_operator_touch_lifetime_idPK10wmOperator>
1016217c8:     	stp	x0, x26, [x20, #0xc8]
1016217cc:     	ldr	x8, [x26, #0xe8]
1016217d0:     	str	x8, [x20, #0xd8]
1016217d4:     	cbz	x0, 0x1016216a0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1ac>
1016217d8:     	add	x8, x20, #0x104
1016217dc:     	str	x22, [x20, #0xa8]
1016217e0:     	ldr	x9, [x22, #0x128]
1016217e4:     	ldr	x9, [x9, #0xb0]
1016217e8:     	str	x9, [x20, #0xb0]
1016217ec:     	ldr	x9, [x22, #0x128]
1016217f0:     	ldr	x9, [x9, #0x298]
1016217f4:     	str	x9, [x20, #0xb8]
1016217f8:     	ldur	q0, [x22, #0xa8]
1016217fc:     	str	q0, [x8]
101621800:     	mov	x0, x21
101621804:     	bl	0x100b8e358 <__Z24WM_window_native_pixel_xPK8wmWindow>
101621808:     	str	w0, [x20, #0xf8]
10162180c:     	mov	x0, x21
101621810:     	bl	0x100b8e390 <__Z24WM_window_native_pixel_yPK8wmWindow>
101621814:     	str	w0, [x20, #0xfc]
101621818:     	adrp	x8, 0x106d64000 <_build_commit_date>
10162181c:     	add	x8, x8, #0xe08
101621820:     	ldr	s0, [x8, #0x2654]
101621824:     	str	s0, [x20, #0x100]
101621828:     	mov	w8, #0x1                ; =1
10162182c:     	mov	w26, #0x1               ; =1
101621830:     	strb	w8, [x20, #0x114]
101621834:     	b	0x1016216a4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x1b0>
