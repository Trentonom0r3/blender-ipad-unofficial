
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f918d0 <__Z16ED_area_type_hudi>:
101f918d0:     	stp	x24, x23, [sp, #-0x40]!
101f918d4:     	stp	x22, x21, [sp, #0x10]
101f918d8:     	stp	x20, x19, [sp, #0x20]
101f918dc:     	stp	x29, x30, [sp, #0x30]
101f918e0:     	add	x29, sp, #0x30
101f918e4:     	mov	x19, x0
101f918e8:     	adrp	x23, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
101f918ec:     	add	x23, x23, #0x760
101f918f0:     	ldr	x8, [x23]
101f918f4:     	adrp	x3, 0x104d58000 <__ZL3hex+0x187a0d>
101f918f8:     	add	x3, x3, #0x1db
101f918fc:     	mov	w22, #0x8               ; =8
101f91900:     	mov	w0, #0x1                ; =1
101f91904:     	mov	w1, #0xf8               ; =248
101f91908:     	mov	w2, #0x8                ; =8
101f9190c:     	blr	x8
101f91910:     	mov	x20, x0
101f91914:     	mov	w8, #0x12               ; =18
101f91918:     	str	w8, [x0, #0xe8]
101f9191c:     	adrp	x8, 0x101f91000 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0xa8>
101f91920:     	add	x8, x8, #0xac0
101f91924:     	str	x8, [x0, #0x50]
101f91928:     	adrp	x8, 0x101f91000 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0xa8>
101f9192c:     	add	x8, x8, #0xb28
101f91930:     	str	x8, [x0, #0x40]
101f91934:     	adrp	x8, 0x101f91000 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0xa8>
101f91938:     	add	x8, x8, #0xcd4
101f9193c:     	str	x8, [x0, #0x30]
101f91940:     	adrp	x8, 0x101f91000 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0xa8>
101f91944:     	add	x8, x8, #0xd58
101f91948:     	str	x8, [x0, #0x18]
101f9194c:     	adrp	x8, 0x101f91000 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0xa8>
101f91950:     	add	x8, x8, #0xd98
101f91954:     	str	w22, [x0, #0x10]
101f91958:     	str	x8, [x0, #0x60]
101f9195c:     	adrp	x8, 0x10520f000 <__ZL16ui_text_pad_none+0x10>
101f91960:     	ldr	d0, [x8, #0x610]
101f91964:     	str	d0, [x0, #0xe0]
101f91968:     	ldr	x8, [x23]
101f9196c:     	adrp	x3, 0x104d58000 <__ZL3hex+0x187a0d>
101f91970:     	add	x3, x3, #0x2ae
101f91974:     	mov	w0, #0x1                ; =1
101f91978:     	mov	w1, #0x328              ; =808
101f9197c:     	mov	w2, #0x8                ; =8
101f91980:     	blr	x8
101f91984:     	mov	x21, x0
101f91988:     	adrp	x1, 0x104cfc000 <__ZL3hex+0x12ba0d>
101f9198c:     	add	x1, x1, #0x125
101f91990:     	add	x0, x0, #0x10
101f91994:     	mov	w2, #0x40               ; =64
101f91998:     	bl	0x100822e04 <__Z16BLI_strncpy_utf8PcPKcm>
101f9199c:     	adrp	x1, 0x104cfe000 <__ZL3hex+0x12da0d>
101f919a0:     	add	x1, x1, #0x358
101f919a4:     	add	x0, x21, #0x50
101f919a8:     	mov	w2, #0x40               ; =64
101f919ac:     	bl	0x100822e04 <__Z16BLI_strncpy_utf8PcPKcm>
101f919b0:     	adrp	x1, 0x104b92000 <_zlibVersion+0x104b92000>
101f919b4:     	add	x1, x1, #0xe2d
101f919b8:     	add	x0, x21, #0x98
101f919bc:     	mov	w2, #0x40               ; =64
101f919c0:     	bl	0x100822e04 <__Z16BLI_strncpy_utf8PcPKcm>
101f919c4:     	adrp	x8, 0x101f92000 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0xd0>
101f919c8:     	add	x8, x8, #0xdc0
101f919cc:     	str	x8, [x21, #0x2b8]
101f919d0:     	adrp	x8, 0x101f92000 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0xd0>
101f919d4:     	add	x8, x8, #0xe4c
101f919d8:     	str	x8, [x21, #0x2c8]
101f919dc:     	adrp	x8, 0x101f92000 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion+0xd0>
101f919e0:     	add	x8, x8, #0xeac
101f919e4:     	str	x8, [x21, #0x2b0]
101f919e8:     	strh	w19, [x21, #0x298]
101f919ec:     	strh	w22, [x21, #0x29a]
101f919f0:     	ldr	w8, [x21, #0x2ac]
101f919f4:     	orr	w8, w8, #0x1
101f919f8:     	str	w8, [x21, #0x2ac]
101f919fc:     	add	x0, x20, #0xb8
101f91a00:     	mov	x1, x21
101f91a04:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
101f91a08:     	cmp	w19, #0x1
101f91a0c:     	b.ne	0x101f91aa0 <__Z16ED_area_type_hudi+0x1d0>
101f91a10:     	ldr	x8, [x23]
101f91a14:     	adrp	x3, 0x104d58000 <__ZL3hex+0x187a0d>
101f91a18:     	add	x3, x3, #0x2ae
101f91a1c:     	mov	w0, #0x1                ; =1
101f91a20:     	mov	w1, #0x328              ; =808
101f91a24:     	mov	w2, #0x8                ; =8
101f91a28:     	blr	x8
101f91a2c:     	mov	x21, x0
101f91a30:     	adrp	x1, 0x104cfc000 <__ZL3hex+0x12ba0d>
101f91a34:     	add	x1, x1, #0x136
101f91a38:     	add	x0, x0, #0x10
101f91a3c:     	mov	w2, #0x40               ; =64
101f91a40:     	bl	0x100822e04 <__Z16BLI_strncpy_utf8PcPKcm>
101f91a44:     	adrp	x1, 0x104cde000 <__ZL3hex+0x10da0d>
101f91a48:     	add	x1, x1, #0x74c
101f91a4c:     	add	x0, x21, #0x50
101f91a50:     	mov	w2, #0x40               ; =64
101f91a54:     	bl	0x100822e04 <__Z16BLI_strncpy_utf8PcPKcm>
101f91a58:     	adrp	x1, 0x104b92000 <_zlibVersion+0x104b92000>
101f91a5c:     	add	x1, x1, #0xe2d
101f91a60:     	add	x0, x21, #0x98
101f91a64:     	mov	w2, #0x40               ; =64
101f91a68:     	bl	0x100822e04 <__Z16BLI_strncpy_utf8PcPKcm>
101f91a6c:     	adrp	x8, 0x101f91000 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0xa8>
101f91a70:     	add	x8, x8, #0x378
101f91a74:     	adrp	x9, 0x101f91000 <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion+0xa8>
101f91a78:     	add	x9, x9, #0x394
101f91a7c:     	str	x8, [x21, #0x2b0]
101f91a80:     	str	x9, [x21, #0x2c8]
101f91a84:     	strh	w19, [x21, #0x298]
101f91a88:     	strh	w22, [x21, #0x29a]
101f91a8c:     	mov	w8, #0x2                ; =2
101f91a90:     	str	w8, [x21, #0x2ac]
101f91a94:     	add	x0, x20, #0xb8
101f91a98:     	mov	x1, x21
101f91a9c:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
101f91aa0:     	mov	w8, #0x3                ; =3
101f91aa4:     	strh	w8, [x20, #0xee]
101f91aa8:     	mov	x0, x20
101f91aac:     	ldp	x29, x30, [sp, #0x30]
101f91ab0:     	ldp	x20, x19, [sp, #0x20]
101f91ab4:     	ldp	x22, x21, [sp, #0x10]
101f91ab8:     	ldp	x24, x23, [sp], #0x40
101f91abc:     	ret
