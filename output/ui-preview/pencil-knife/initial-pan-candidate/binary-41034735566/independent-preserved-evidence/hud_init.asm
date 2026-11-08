
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f91d58 <__ZL15hud_region_initP15wmWindowManagerP7ARegion>:
101f91d58:     	stp	x20, x19, [sp, #-0x20]!
101f91d5c:     	stp	x29, x30, [sp, #0x10]
101f91d60:     	add	x29, sp, #0x10
101f91d64:     	mov	x19, x1
101f91d68:     	bl	0x101626a38 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion>
101f91d6c:     	fmov.2s	v0, #1.00000000
101f91d70:     	str	d0, [x19, #0x70]
101f91d74:     	ldr	x8, [x19, #0x128]
101f91d78:     	add	x0, x8, #0x328
101f91d7c:     	bl	0x101f3a9a8 <__Z22UI_region_handlers_addP8ListBase>
101f91d80:     	ldrh	w8, [x19, #0xc4]
101f91d84:     	orr	w8, w8, #0x8
101f91d88:     	strh	w8, [x19, #0xc4]
101f91d8c:     	ldp	x29, x30, [sp, #0x10]
101f91d90:     	ldp	x20, x19, [sp], #0x20
101f91d94:     	ret
