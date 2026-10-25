
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f8d890 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion>:
101f8d890:     	cbz	x1, 0x101f8d950 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0xc0>
101f8d894:     	sub	sp, sp, #0x60
101f8d898:     	stp	x22, x21, [sp, #0x30]
101f8d89c:     	stp	x20, x19, [sp, #0x40]
101f8d8a0:     	stp	x29, x30, [sp, #0x50]
101f8d8a4:     	add	x29, sp, #0x50
101f8d8a8:     	mov	x20, x2
101f8d8ac:     	mov	x19, x1
101f8d8b0:     	mov	x21, x0
101f8d8b4:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f8d8b8:     	mov	x8, x0
101f8d8bc:     	mov	x0, #0x0                ; =0
101f8d8c0:     	cbz	x20, 0x101f8d95c <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0xcc>
101f8d8c4:     	cmp	x8, x19
101f8d8c8:     	b.ne	0x101f8d95c <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0xcc>
101f8d8cc:     	ldrh	w8, [x20, #0xc0]
101f8d8d0:     	cmp	w8, #0x8
101f8d8d4:     	b.ne	0x101f8d958 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0xc8>
101f8d8d8:     	add	x0, x19, #0x78
101f8d8dc:     	mov	x1, x20
101f8d8e0:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101f8d8e4:     	cmn	w0, #0x1
101f8d8e8:     	b.eq	0x101f8d958 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0xc8>
101f8d8ec:     	movi.16b	v0, #0x0
101f8d8f0:     	stur	q0, [sp, #0x1e]
101f8d8f4:     	stp	q0, q0, [sp]
101f8d8f8:     	mov	x1, sp
101f8d8fc:     	mov	x0, x21
101f8d900:     	bl	0x101f8c514 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout>
101f8d904:     	cbz	w0, 0x101f8d910 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0x80>
101f8d908:     	ldr	x0, [sp]
101f8d90c:     	cbnz	x0, 0x101f8d95c <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0xcc>
101f8d910:     	mov	x0, x21
101f8d914:     	bl	0x101f8d72c <__Z21UI_ipad_corner_canvasP8bContext>
101f8d918:     	cbnz	x0, 0x101f8d95c <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0xcc>
101f8d91c:     	ldr	x11, [x20, #0x120]
101f8d920:     	cbz	x11, 0x101f8d958 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0xc8>
101f8d924:     	ldrh	w8, [x11]
101f8d928:     	mov	w9, #0xffff             ; =65535
101f8d92c:     	cmp	w8, w9
101f8d930:     	b.eq	0x101f8d958 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0xc8>
101f8d934:     	ldur	x9, [x19, #0x78]
101f8d938:     	cbz	x9, 0x101f8d958 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0xc8>
101f8d93c:     	mov	w10, #0x0               ; =0
101f8d940:     	mov	x0, #0x0                ; =0
101f8d944:     	ldr	w11, [x11, #0x30]
101f8d948:     	bic	w11, w11, w11, asr #31
101f8d94c:     	b	0x101f8d978 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0xe8>
101f8d950:     	mov	x0, #0x0                ; =0
101f8d954:     	ret
101f8d958:     	mov	x0, #0x0                ; =0
101f8d95c:     	ldp	x29, x30, [sp, #0x50]
101f8d960:     	ldp	x20, x19, [sp, #0x40]
101f8d964:     	ldp	x22, x21, [sp, #0x30]
101f8d968:     	add	sp, sp, #0x60
101f8d96c:     	ret
101f8d970:     	ldr	x9, [x9]
101f8d974:     	cbz	x9, 0x101f8d95c <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0xcc>
101f8d978:     	ldrh	w12, [x9, #0xc0]
101f8d97c:     	cmp	w12, w8
101f8d980:     	b.ne	0x101f8d970 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0xe0>
101f8d984:     	cmp	w10, w11
101f8d988:     	b.eq	0x101f8d99c <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0x10c>
101f8d98c:     	cmp	x0, #0x0
101f8d990:     	csel	x0, x9, x0, eq
101f8d994:     	add	w10, w10, #0x1
101f8d998:     	b	0x101f8d970 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0xe0>
101f8d99c:     	mov	x0, x9
101f8d9a0:     	b	0x101f8d95c <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0xcc>
