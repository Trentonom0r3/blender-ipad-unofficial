
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>:
1000b4b1c:     	sub	sp, sp, #0x30
1000b4b20:     	stp	x29, x30, [sp, #0x20]
1000b4b24:     	add	x29, sp, #0x20
1000b4b28:     	mov	x8, x0
1000b4b2c:     	adrp	x9, 0x106369000 <_zlibVersion+0x106369000>
1000b4b30:     	ldr	x9, [x9, #0x7f8]
1000b4b34:     	ldr	x9, [x9]
1000b4b38:     	stur	x9, [x29, #-0x8]
1000b4b3c:     	ldr	x9, [x0, #0x88]!
1000b4b40:     	stur	x1, [x0, #-0x58]
1000b4b44:     	cbz	x9, 0x1000b4b68 <__Z17CTX_wm_region_setP8bContextP7ARegion+0x4c>
1000b4b48:     	adrp	x9, 0x106376000 <__ZTCN7blender7fstreamE0_NSt3__113basic_istreamIcNS0_11char_traitsIcEEEE+0x40>
1000b4b4c:     	add	x9, x9, #0xd70
1000b4b50:     	ldr	q0, [x9]
1000b4b54:     	str	q0, [sp]
1000b4b58:     	ldr	x1, [x8, #0x90]
1000b4b5c:     	mov	x2, sp
1000b4b60:     	mov	w3, #0x2                ; =2
1000b4b64:     	bl	0x1014fd5b4 <__Z36BPY_context_dict_clear_members_arrayPPvS_PPKcj>
1000b4b68:     	ldur	x8, [x29, #-0x8]
1000b4b6c:     	adrp	x9, 0x106369000 <_zlibVersion+0x106369000>
1000b4b70:     	ldr	x9, [x9, #0x7f8]
1000b4b74:     	ldr	x9, [x9]
1000b4b78:     	cmp	x9, x8
1000b4b7c:     	b.ne	0x1000b4b8c <__Z17CTX_wm_region_setP8bContextP7ARegion+0x70>
1000b4b80:     	ldp	x29, x30, [sp, #0x20]
1000b4b84:     	add	sp, sp, #0x30
1000b4b88:     	ret
1000b4b8c:     	bl	0x104b7534c <_zlibVersion+0x104b7534c>
