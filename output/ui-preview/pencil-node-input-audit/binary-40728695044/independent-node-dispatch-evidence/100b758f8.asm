
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b758f8 <__Z16WM_keymap_ensureP11wmKeyConfigPKcii>:
100b758f8:     	stp	x24, x23, [sp, #-0x40]!
100b758fc:     	stp	x22, x21, [sp, #0x10]
100b75900:     	stp	x20, x19, [sp, #0x20]
100b75904:     	stp	x29, x30, [sp, #0x30]
100b75908:     	add	x29, sp, #0x30
100b7590c:     	mov	x21, x3
100b75910:     	mov	x22, x2
100b75914:     	mov	x23, x1
100b75918:     	mov	x19, x0
100b7591c:     	ldr	x20, [x19, #0x90]!
100b75920:     	cbnz	x20, 0x100b759c4 <__Z16WM_keymap_ensureP11wmKeyConfigPKcii+0xcc>
100b75924:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b75928:     	add	x8, x8, #0x760
100b7592c:     	ldr	x8, [x8]
100b75930:     	adrp	x3, 0x104bd9000 <__ZL3hex+0x95cd>
100b75934:     	add	x3, x3, #0x316
100b75938:     	mov	w0, #0x1                ; =1
100b7593c:     	mov	w1, #0x110              ; =272
100b75940:     	mov	w2, #0x8                ; =8
100b75944:     	blr	x8
100b75948:     	mov	x20, x0
100b7594c:     	add	x0, x0, #0x30
100b75950:     	mov	x1, x23
100b75954:     	mov	w2, #0x40               ; =64
100b75958:     	bl	0x100822e04 <__Z16BLI_strncpy_utf8PcPKcm>
100b7595c:     	strh	w22, [x20, #0x70]
100b75960:     	strh	w21, [x20, #0x72]
100b75964:     	bl	0x1012646c4 <__Z26RNA_struct_state_owner_getv>
100b75968:     	cbz	x0, 0x100b7597c <__Z16WM_keymap_ensureP11wmKeyConfigPKcii+0x84>
100b7596c:     	mov	x1, x0
100b75970:     	add	x0, x20, #0x74
100b75974:     	mov	w2, #0x80               ; =128
100b75978:     	bl	0x10081a008 <__Z11BLI_strncpyPcPKcm>
100b7597c:     	mov	x0, x19
100b75980:     	mov	x1, x20
100b75984:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b75988:     	adrp	x8, 0x107ef7000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b7598c:     	ldrb	w9, [x8, #0x8f3]
100b75990:     	orr	w9, w9, #0x1
100b75994:     	strb	w9, [x8, #0x8f3]
100b75998:     	ldrh	w8, [x20, #0xf4]
100b7599c:     	orr	w8, w8, #0x40
100b759a0:     	strh	w8, [x20, #0xf4]
100b759a4:     	mov	x0, x20
100b759a8:     	ldp	x29, x30, [sp, #0x30]
100b759ac:     	ldp	x20, x19, [sp, #0x20]
100b759b0:     	ldp	x22, x21, [sp, #0x10]
100b759b4:     	ldp	x24, x23, [sp], #0x40
100b759b8:     	ret
100b759bc:     	ldr	x20, [x20]
100b759c0:     	cbz	x20, 0x100b75924 <__Z16WM_keymap_ensureP11wmKeyConfigPKcii+0x2c>
100b759c4:     	ldrsh	w8, [x20, #0x70]
100b759c8:     	cmp	w8, w22
100b759cc:     	b.ne	0x100b759bc <__Z16WM_keymap_ensureP11wmKeyConfigPKcii+0xc4>
100b759d0:     	ldrsh	w8, [x20, #0x72]
100b759d4:     	cmp	w8, w21
100b759d8:     	b.ne	0x100b759bc <__Z16WM_keymap_ensureP11wmKeyConfigPKcii+0xc4>
100b759dc:     	add	x1, x20, #0x30
100b759e0:     	mov	x0, x23
100b759e4:     	mov	w2, #0x40               ; =64
100b759e8:     	bl	0x104b76c54 <_zlibVersion+0x104b76c54>
100b759ec:     	cbnz	w0, 0x100b759bc <__Z16WM_keymap_ensureP11wmKeyConfigPKcii+0xc4>
100b759f0:     	b	0x100b759a4 <__Z16WM_keymap_ensureP11wmKeyConfigPKcii+0xac>
