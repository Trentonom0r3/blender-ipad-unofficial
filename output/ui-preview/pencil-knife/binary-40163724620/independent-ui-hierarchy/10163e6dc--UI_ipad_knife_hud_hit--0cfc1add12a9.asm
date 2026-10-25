
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163e6dc <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion>:
10163e6dc:     	sub	sp, sp, #0x110
10163e6e0:     	stp	x28, x27, [sp, #0xb0]
10163e6e4:     	stp	x26, x25, [sp, #0xc0]
10163e6e8:     	stp	x24, x23, [sp, #0xd0]
10163e6ec:     	stp	x22, x21, [sp, #0xe0]
10163e6f0:     	stp	x20, x19, [sp, #0xf0]
10163e6f4:     	stp	x29, x30, [sp, #0x100]
10163e6f8:     	add	x29, sp, #0x100
10163e6fc:     	mov	x19, x5
10163e700:     	mov	x20, x4
10163e704:     	mov	x23, x2
10163e708:     	mov	x21, x1
10163e70c:     	mov	x22, x0
10163e710:     	str	xzr, [x3]
10163e714:     	str	xzr, [x4, #0xb0]
10163e718:     	movi.16b	v0, #0x0
10163e71c:     	stp	q0, q0, [x4, #0x90]
10163e720:     	stp	q0, q0, [x4, #0x70]
10163e724:     	stp	q0, q0, [x4, #0x50]
10163e728:     	stp	q0, q0, [x4, #0x30]
10163e72c:     	stp	q0, q0, [x4, #0x10]
10163e730:     	str	q0, [x4]
10163e734:     	cbz	x5, 0x10163e73c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x60>
10163e738:     	str	xzr, [x19]
10163e73c:     	cbz	x23, 0x10163e77c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xa0>
10163e740:     	mov	x25, x3
10163e744:     	mov	x0, x22
10163e748:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163e74c:     	mov	x8, x0
10163e750:     	mov	w0, #0x0                ; =0
10163e754:     	cbz	x21, 0x10163e780 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xa4>
10163e758:     	cbz	x8, 0x10163e780 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xa4>
10163e75c:     	add	x0, x8, #0x1a0
10163e760:     	mov	x1, x21
10163e764:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163e768:     	cmn	w0, #0x1
10163e76c:     	b.eq	0x10163e77c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xa0>
10163e770:     	mov	x0, x22
10163e774:     	bl	0x1000b4458 <__Z19CTX_wm_region_popupPK8bContext>
10163e778:     	cbz	x0, 0x10163e7a0 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xc4>
10163e77c:     	mov	w0, #0x0                ; =0
10163e780:     	ldp	x29, x30, [sp, #0x100]
10163e784:     	ldp	x20, x19, [sp, #0xf0]
10163e788:     	ldp	x22, x21, [sp, #0xe0]
10163e78c:     	ldp	x24, x23, [sp, #0xd0]
10163e790:     	ldp	x26, x25, [sp, #0xc0]
10163e794:     	ldp	x28, x27, [sp, #0xb0]
10163e798:     	add	sp, sp, #0x110
10163e79c:     	ret
10163e7a0:     	mov	x0, x21
10163e7a4:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
10163e7a8:     	cbz	x0, 0x10163e780 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xa4>
10163e7ac:     	ldr	x8, [x0, #0x1d0]
10163e7b0:     	cbz	x8, 0x10163e7ec <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x110>
10163e7b4:     	ldr	x9, [x0, #0x218]
10163e7b8:     	b	0x10163e7c4 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xe8>
10163e7bc:     	ldr	x8, [x8]
10163e7c0:     	cbz	x8, 0x10163e7ec <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x110>
10163e7c4:     	cbz	x9, 0x10163e7d4 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xf8>
10163e7c8:     	ldr	x10, [x9, #0x18]
10163e7cc:     	cmp	x10, x8
10163e7d0:     	b.eq	0x10163e7bc <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xe0>
10163e7d4:     	ldr	x10, [x8, #0x128]
10163e7d8:     	ldrh	w10, [x10, #0x2b0]
10163e7dc:     	cbz	w10, 0x10163e7bc <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xe0>
10163e7e0:     	ldrh	w10, [x8, #0xc4]
10163e7e4:     	tbnz	w10, #0x0, 0x10163e7bc <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xe0>
10163e7e8:     	b	0x10163e77c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xa0>
10163e7ec:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163e7f0:     	ldr	x8, [x8, #0xa00]
10163e7f4:     	cbz	x8, 0x10163e77c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xa0>
10163e7f8:     	fmov	d0, x8
10163e7fc:     	cnt.8b	v0, v0
10163e800:     	uaddlv.8b	h0, v0
10163e804:     	fmov	w9, s0
10163e808:     	cmp	x9, #0x1
10163e80c:     	b.hi	0x10163e81c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x140>
10163e810:     	sub	x10, x8, #0x1
10163e814:     	and	x10, x10, x21
10163e818:     	b	0x10163e830 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x154>
10163e81c:     	mov	x10, x21
10163e820:     	cmp	x8, x21
10163e824:     	b.hi	0x10163e830 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x154>
10163e828:     	udiv	x10, x21, x8
10163e82c:     	msub	x10, x10, x8, x21
10163e830:     	adrp	x11, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163e834:     	ldr	x11, [x11, #0x9f8]
10163e838:     	ldr	x11, [x11, x10, lsl #3]
10163e83c:     	cbz	x11, 0x10163e77c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xa0>
10163e840:     	ldr	x11, [x11]
10163e844:     	cbz	x11, 0x10163e77c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xa0>
10163e848:     	sub	x12, x8, #0x1
10163e84c:     	b	0x10163e868 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x18c>
10163e850:     	ldr	x13, [x11, #0x10]
10163e854:     	cmp	x13, x21
10163e858:     	b.eq	0x10163e8a0 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x1c4>
10163e85c:     	mov	w0, #0x0                ; =0
10163e860:     	ldr	x11, [x11]
10163e864:     	cbz	x11, 0x10163e780 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xa4>
10163e868:     	ldr	x13, [x11, #0x8]
10163e86c:     	cmp	x13, x21
10163e870:     	b.eq	0x10163e850 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x174>
10163e874:     	cmp	x9, #0x1
10163e878:     	b.hi	0x10163e884 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x1a8>
10163e87c:     	and	x13, x13, x12
10163e880:     	b	0x10163e894 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x1b8>
10163e884:     	cmp	x13, x8
10163e888:     	b.lo	0x10163e894 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x1b8>
10163e88c:     	udiv	x14, x13, x8
10163e890:     	msub	x13, x14, x8, x13
10163e894:     	cmp	x13, x10
10163e898:     	b.eq	0x10163e85c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x180>
10163e89c:     	b	0x10163e77c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xa0>
10163e8a0:     	ldr	x8, [x11, #0x18]
10163e8a4:     	ldrsw	x9, [x21, #0xc0]
10163e8a8:     	cmp	x8, x9
10163e8ac:     	b.ne	0x10163e77c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xa0>
10163e8b0:     	ldp	x26, x28, [x11, #0x28]
10163e8b4:     	cmp	x26, x28
10163e8b8:     	mov	x8, x25
10163e8bc:     	b.eq	0x10163eb0c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x430>
10163e8c0:     	str	x28, [sp, #0x8]
10163e8c4:     	b	0x10163e8e4 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x208>
10163e8c8:     	ldr	x2, [x26, #0x218]
10163e8cc:     	mov	x8, x25
10163e8d0:     	str	x2, [x25]
10163e8d4:     	cbnz	x2, 0x10163eb14 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x438>
10163e8d8:     	add	x26, x26, #0x220
10163e8dc:     	cmp	x26, x28
10163e8e0:     	b.eq	0x10163eb0c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x430>
10163e8e4:     	ldrb	w9, [x26, #0x1d8]
10163e8e8:     	cmp	w9, #0x1
10163e8ec:     	b.ne	0x10163e8d8 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x1fc>
10163e8f0:     	stur	xzr, [sp, #0x4d]
10163e8f4:     	movi.16b	v0, #0x0
10163e8f8:     	stp	q0, q0, [sp, #0x30]
10163e8fc:     	stp	q0, q0, [sp, #0x10]
10163e900:     	add	x8, sp, #0x10
10163e904:     	stur	q0, [x8, #0x48]
10163e908:     	stur	q0, [x8, #0x58]
10163e90c:     	stur	q0, [x8, #0x68]
10163e910:     	stur	q0, [x8, #0x78]
10163e914:     	stur	xzr, [x8, #0x88]
10163e918:     	add	x2, sp, #0x10
10163e91c:     	mov	x0, x22
10163e920:     	mov	x1, x21
10163e924:     	bl	0x10164c264 <__ZN12_GLOBAL__N_135ipad_knife_hierarchy_native_captureEP8bContextP8wmWindowRNS_24IPadKnifeHierarchyNativeE>
10163e928:     	cbz	w0, 0x10163e968 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x28c>
10163e92c:     	ldp	x24, x27, [sp, #0x88]
10163e930:     	b	0x10163e938 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x25c>
10163e934:     	add	x24, x24, #0x18
10163e938:     	cmp	x24, x27
10163e93c:     	b.eq	0x10163e968 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x28c>
10163e940:     	ldr	x8, [x24]
10163e944:     	ldr	x9, [x26, #0x1f8]
10163e948:     	cmp	x8, x9
10163e94c:     	b.eq	0x10163e934 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x258>
10163e950:     	add	x0, x24, #0x8
10163e954:     	mov	x1, x23
10163e958:     	bl	0x1007fc848 <__Z19BLI_rcti_isect_pt_vPK4rctiPKi>
10163e95c:     	tbz	w0, #0x0, 0x10163e934 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x258>
10163e960:     	mov	w24, #0x1               ; =1
10163e964:     	b	0x10163ea60 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x384>
10163e968:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163e96c:     	ldr	x8, [x8, #0x9b0]
10163e970:     	cbz	x8, 0x10163ea5c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x380>
10163e974:     	fmov	d0, x8
10163e978:     	cnt.8b	v0, v0
10163e97c:     	uaddlv.8b	h0, v0
10163e980:     	fmov	w9, s0
10163e984:     	cmp	x9, #0x1
10163e988:     	b.hi	0x10163e998 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x2bc>
10163e98c:     	sub	x10, x8, #0x1
10163e990:     	and	x10, x10, x21
10163e994:     	b	0x10163e9ac <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x2d0>
10163e998:     	mov	x10, x21
10163e99c:     	cmp	x8, x21
10163e9a0:     	b.hi	0x10163e9ac <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x2d0>
10163e9a4:     	udiv	x10, x21, x8
10163e9a8:     	msub	x10, x10, x8, x21
10163e9ac:     	adrp	x11, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163e9b0:     	ldr	x11, [x11, #0x9a8]
10163e9b4:     	ldr	x11, [x11, x10, lsl #3]
10163e9b8:     	cbz	x11, 0x10163ea5c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x380>
10163e9bc:     	ldr	x27, [x11]
10163e9c0:     	cbz	x27, 0x10163ea5c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x380>
10163e9c4:     	sub	x11, x8, #0x1
10163e9c8:     	b	0x10163e9e0 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x304>
10163e9cc:     	ldr	x12, [x27, #0x10]
10163e9d0:     	cmp	x12, x21
10163e9d4:     	b.eq	0x10163ea18 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x33c>
10163e9d8:     	ldr	x27, [x27]
10163e9dc:     	cbz	x27, 0x10163ea5c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x380>
10163e9e0:     	ldr	x12, [x27, #0x8]
10163e9e4:     	cmp	x12, x21
10163e9e8:     	b.eq	0x10163e9cc <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x2f0>
10163e9ec:     	cmp	x9, #0x1
10163e9f0:     	b.hi	0x10163e9fc <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x320>
10163e9f4:     	and	x12, x12, x11
10163e9f8:     	b	0x10163ea0c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x330>
10163e9fc:     	cmp	x12, x8
10163ea00:     	b.lo	0x10163ea0c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x330>
10163ea04:     	udiv	x13, x12, x8
10163ea08:     	msub	x12, x13, x8, x12
10163ea0c:     	cmp	x12, x10
10163ea10:     	b.eq	0x10163e9d8 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x2fc>
10163ea14:     	b	0x10163ea5c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x380>
10163ea18:     	ldr	x8, [x27, #0x18]
10163ea1c:     	ldrsw	x9, [x21, #0xc0]
10163ea20:     	cmp	x8, x9
10163ea24:     	b.ne	0x10163ea5c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x380>
10163ea28:     	ldp	x24, x28, [x27, #0x168]
10163ea2c:     	cmp	x24, x28
10163ea30:     	b.eq	0x10163ea50 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x374>
10163ea34:     	mov	x0, x24
10163ea38:     	mov	x1, x23
10163ea3c:     	bl	0x1007fc848 <__Z19BLI_rcti_isect_pt_vPK4rctiPKi>
10163ea40:     	tbnz	w0, #0x0, 0x10163e960 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x284>
10163ea44:     	add	x24, x24, #0x10
10163ea48:     	cmp	x24, x28
10163ea4c:     	b.ne	0x10163ea34 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x358>
10163ea50:     	ldp	x28, x27, [x27, #0x150]
10163ea54:     	cmp	x28, x27
10163ea58:     	b.ne	0x10163eae8 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x40c>
10163ea5c:     	mov	w24, #0x0               ; =0
10163ea60:     	ldr	x0, [sp, #0x88]
10163ea64:     	cbz	x0, 0x10163ea70 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x394>
10163ea68:     	str	x0, [sp, #0x90]
10163ea6c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163ea70:     	ldr	x0, [sp, #0x70]
10163ea74:     	ldr	x28, [sp, #0x8]
10163ea78:     	cbz	x0, 0x10163ea84 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x3a8>
10163ea7c:     	str	x0, [sp, #0x78]
10163ea80:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163ea84:     	ldr	x0, [sp, #0x58]
10163ea88:     	cbz	x0, 0x10163ea94 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x3b8>
10163ea8c:     	str	x0, [sp, #0x60]
10163ea90:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
10163ea94:     	mov	x8, x25
10163ea98:     	tbnz	w24, #0x0, 0x10163e8d8 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x1fc>
10163ea9c:     	ldr	x24, [x26, #0x200]
10163eaa0:     	ldr	x27, [x26, #0x208]
10163eaa4:     	cmp	x24, x27
10163eaa8:     	b.eq	0x10163eac8 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x3ec>
10163eaac:     	mov	x0, x24
10163eab0:     	mov	x1, x23
10163eab4:     	bl	0x1007fc848 <__Z19BLI_rcti_isect_pt_vPK4rctiPKi>
10163eab8:     	cbnz	w0, 0x10163e8c8 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x1ec>
10163eabc:     	add	x24, x24, #0x10
10163eac0:     	cmp	x24, x27
10163eac4:     	b.ne	0x10163eaac <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x3d0>
10163eac8:     	mov	x8, x25
10163eacc:     	ldr	x2, [x25]
10163ead0:     	cbz	x2, 0x10163e8d8 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x1fc>
10163ead4:     	b	0x10163eb14 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x438>
10163ead8:     	mov	w24, #0x0               ; =0
10163eadc:     	add	x28, x28, #0x18
10163eae0:     	cmp	x28, x27
10163eae4:     	b.eq	0x10163ea60 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x384>
10163eae8:     	ldr	x8, [x28]
10163eaec:     	ldr	x9, [x26, #0x1f8]
10163eaf0:     	cmp	x8, x9
10163eaf4:     	b.eq	0x10163ead8 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x3fc>
10163eaf8:     	add	x0, x28, #0x8
10163eafc:     	mov	x1, x23
10163eb00:     	bl	0x1007fc848 <__Z19BLI_rcti_isect_pt_vPK4rctiPKi>
10163eb04:     	tbz	w0, #0x0, 0x10163ead8 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x3fc>
10163eb08:     	b	0x10163e960 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x284>
10163eb0c:     	ldr	x2, [x8]
10163eb10:     	cbz	x2, 0x10163e77c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xa0>
10163eb14:     	mov	x0, x22
10163eb18:     	mov	x1, x21
10163eb1c:     	mov	x3, x20
10163eb20:     	mov	x4, x19
10163eb24:     	bl	0x10163e1d8 <__Z23UI_ipad_knife_hud_ownerP8bContextP8wmWindowyR16wmIPadKnifeOwnerPP7ARegion>
10163eb28:     	mov	w0, #0x1                ; =1
10163eb2c:     	b	0x10163e780 <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0xa4>
10163eb30:     	b	0x10163eb3c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x460>
10163eb34:     	b	0x10163eb3c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x460>
10163eb38:     	b	0x10163eb3c <__Z21UI_ipad_knife_hud_hitP8bContextP8wmWindowPKiRyR16wmIPadKnifeOwnerPP7ARegion+0x460>
10163eb3c:     	mov	x19, x0
10163eb40:     	add	x0, sp, #0x10
10163eb44:     	bl	0x10164c214 <__ZN12_GLOBAL__N_124IPadKnifeHierarchyNativeD1Ev>
10163eb48:     	mov	x0, x19
10163eb4c:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
