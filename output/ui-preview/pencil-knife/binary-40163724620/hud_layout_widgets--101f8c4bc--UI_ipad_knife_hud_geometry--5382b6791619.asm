
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f8c4bc <__Z26UI_ipad_knife_hud_geometryPK8bContextPiPb>:
101f8c4bc:     	sub	sp, sp, #0x50
101f8c4c0:     	stp	x20, x19, [sp, #0x30]
101f8c4c4:     	stp	x29, x30, [sp, #0x40]
101f8c4c8:     	add	x29, sp, #0x40
101f8c4cc:     	mov	x19, x2
101f8c4d0:     	mov	x20, x1
101f8c4d4:     	movi.16b	v0, #0x0
101f8c4d8:     	stur	q0, [sp, #0x1e]
101f8c4dc:     	stp	q0, q0, [sp]
101f8c4e0:     	mov	x1, sp
101f8c4e4:     	bl	0x101f8c514 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout>
101f8c4e8:     	ldr	d0, [sp, #0x20]
101f8c4ec:     	str	d0, [x20]
101f8c4f0:     	cbz	x19, 0x101f8c4fc <__Z26UI_ipad_knife_hud_geometryPK8bContextPiPb+0x40>
101f8c4f4:     	ldrb	w8, [sp, #0x2c]
101f8c4f8:     	strb	w8, [x19]
101f8c4fc:     	ldrb	w8, [sp, #0x2d]
101f8c500:     	and	w0, w0, w8
101f8c504:     	ldp	x29, x30, [sp, #0x40]
101f8c508:     	ldp	x20, x19, [sp, #0x30]
101f8c50c:     	add	sp, sp, #0x50
101f8c510:     	ret
