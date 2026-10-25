
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f8d6c0 <__ZL15hud_region_initP15wmWindowManagerP7ARegion>:
101f8d6c0:     	stp	x20, x19, [sp, #-0x20]!
101f8d6c4:     	stp	x29, x30, [sp, #0x10]
101f8d6c8:     	add	x29, sp, #0x10
101f8d6cc:     	mov	x19, x1
101f8d6d0:     	bl	0x101623d40 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion>
101f8d6d4:     	fmov.2s	v0, #1.00000000
101f8d6d8:     	str	d0, [x19, #0x70]
101f8d6dc:     	ldr	x8, [x19, #0x128]
101f8d6e0:     	add	x0, x8, #0x270
101f8d6e4:     	bl	0x101f36318 <__Z22UI_region_handlers_addP8ListBase>
101f8d6e8:     	ldrh	w8, [x19, #0xc4]
101f8d6ec:     	orr	w8, w8, #0x8
101f8d6f0:     	strh	w8, [x19, #0xc4]
101f8d6f4:     	ldp	x29, x30, [sp, #0x10]
101f8d6f8:     	ldp	x20, x19, [sp], #0x20
101f8d6fc:     	ret
