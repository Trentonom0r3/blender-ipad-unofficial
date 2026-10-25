
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f8c7e4 <__ZL21ipad_knife_hud_originPK8bContext>:
101f8c7e4:     	sub	sp, sp, #0xf0
101f8c7e8:     	stp	x22, x21, [sp, #0xc0]
101f8c7ec:     	stp	x20, x19, [sp, #0xd0]
101f8c7f0:     	stp	x29, x30, [sp, #0xe0]
101f8c7f4:     	add	x29, sp, #0xe0
101f8c7f8:     	mov	x19, x0
101f8c7fc:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f8c800:     	mov	x20, x0
101f8c804:     	mov	x0, x19
101f8c808:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f8c80c:     	mov	x21, x0
101f8c810:     	str	xzr, [sp, #0xb0]
101f8c814:     	movi.16b	v0, #0x0
101f8c818:     	stp	q0, q0, [sp, #0x90]
101f8c81c:     	stp	q0, q0, [sp, #0x70]
101f8c820:     	stp	q0, q0, [sp, #0x50]
101f8c824:     	stp	q0, q0, [sp, #0x30]
101f8c828:     	stp	q0, q0, [sp, #0x10]
101f8c82c:     	str	q0, [sp]
101f8c830:     	mov	x3, sp
101f8c834:     	mov	x0, x19
101f8c838:     	mov	x1, x20
101f8c83c:     	mov	x2, x21
101f8c840:     	bl	0x100b50760 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner>
101f8c844:     	cbz	w0, 0x101f8c8ac <__ZL21ipad_knife_hud_originPK8bContext+0xc8>
101f8c848:     	mov	x0, x20
101f8c84c:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
101f8c850:     	cbz	x0, 0x101f8c8b0 <__ZL21ipad_knife_hud_originPK8bContext+0xcc>
101f8c854:     	bl	0x101633618 <__Z22ED_ipad_panels_enabledPK7bScreen>
101f8c858:     	cbz	w0, 0x101f8c8ac <__ZL21ipad_knife_hud_originPK8bContext+0xc8>
101f8c85c:     	ldr	w8, [x21, #0xd8]
101f8c860:     	cmp	w8, #0x1
101f8c864:     	b.ne	0x101f8c8ac <__ZL21ipad_knife_hud_originPK8bContext+0xc8>
101f8c868:     	mov	x2, sp
101f8c86c:     	mov	x0, x19
101f8c870:     	mov	x1, x20
101f8c874:     	mov	w3, #0x1                ; =1
101f8c878:     	bl	0x100b5099c <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb>
101f8c87c:     	cbz	x0, 0x101f8c8b0 <__ZL21ipad_knife_hud_originPK8bContext+0xcc>
101f8c880:     	ldr	x8, [x0, #0x128]
101f8c884:     	ldrh	w9, [x8, #0x2b0]
101f8c888:     	cbz	w9, 0x101f8c8ac <__ZL21ipad_knife_hud_originPK8bContext+0xc8>
101f8c88c:     	ldrb	w8, [x8, #0x8]
101f8c890:     	cmp	w8, #0x1
101f8c894:     	b.ne	0x101f8c8ac <__ZL21ipad_knife_hud_originPK8bContext+0xc8>
101f8c898:     	ldrh	w8, [x0, #0xc4]
101f8c89c:     	mov	w9, #0x403              ; =1027
101f8c8a0:     	tst	w8, w9
101f8c8a4:     	csel	x0, x0, xzr, eq
101f8c8a8:     	b	0x101f8c8b0 <__ZL21ipad_knife_hud_originPK8bContext+0xcc>
101f8c8ac:     	mov	x0, #0x0                ; =0
101f8c8b0:     	ldp	x29, x30, [sp, #0xe0]
101f8c8b4:     	ldp	x20, x19, [sp, #0xd0]
101f8c8b8:     	ldp	x22, x21, [sp, #0xc0]
101f8c8bc:     	add	sp, sp, #0xf0
101f8c8c0:     	ret
