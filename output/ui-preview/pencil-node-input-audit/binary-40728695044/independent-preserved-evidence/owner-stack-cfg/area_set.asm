
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>:
1000b4aa8:     	sub	sp, sp, #0x40
1000b4aac:     	stp	x29, x30, [sp, #0x30]
1000b4ab0:     	add	x29, sp, #0x30
1000b4ab4:     	mov	x8, x0
1000b4ab8:     	adrp	x9, 0x106369000 <_zlibVersion+0x106369000>
1000b4abc:     	ldr	x9, [x9, #0x7f8]
1000b4ac0:     	ldr	x9, [x9]
1000b4ac4:     	stur	x9, [x29, #-0x8]
1000b4ac8:     	ldr	x9, [x0, #0x88]!
1000b4acc:     	stp	x1, xzr, [x0, #-0x60]
1000b4ad0:     	cbz	x9, 0x1000b4af4 <__Z15CTX_wm_area_setP8bContextP7ScrArea+0x4c>
1000b4ad4:     	adrp	x9, 0x106376000 <__ZTCN7blender7fstreamE0_NSt3__113basic_istreamIcNS0_11char_traitsIcEEEE+0x40>
1000b4ad8:     	add	x9, x9, #0xd50
1000b4adc:     	ldp	q0, q1, [x9]
1000b4ae0:     	stp	q0, q1, [sp]
1000b4ae4:     	ldr	x1, [x8, #0x90]
1000b4ae8:     	mov	x2, sp
1000b4aec:     	mov	w3, #0x4                ; =4
1000b4af0:     	bl	0x1014fd5b4 <__Z36BPY_context_dict_clear_members_arrayPPvS_PPKcj>
1000b4af4:     	ldur	x8, [x29, #-0x8]
1000b4af8:     	adrp	x9, 0x106369000 <_zlibVersion+0x106369000>
1000b4afc:     	ldr	x9, [x9, #0x7f8]
1000b4b00:     	ldr	x9, [x9]
1000b4b04:     	cmp	x9, x8
1000b4b08:     	b.ne	0x1000b4b18 <__Z15CTX_wm_area_setP8bContextP7ScrArea+0x70>
1000b4b0c:     	ldp	x29, x30, [sp, #0x30]
1000b4b10:     	add	sp, sp, #0x40
1000b4b14:     	ret
1000b4b18:     	bl	0x104b7534c <_zlibVersion+0x104b7534c>
