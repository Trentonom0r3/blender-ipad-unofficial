
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37902275601\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f6dc1c <__ZL15hud_region_initP15wmWindowManagerP7ARegion>:
101f6dc1c:     	stp	x20, x19, [sp, #-0x20]!
101f6dc20:     	stp	x29, x30, [sp, #0x10]
101f6dc24:     	add	x29, sp, #0x10
101f6dc28:     	mov	x19, x1
101f6dc2c:     	bl	0x10160a9fc <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion>
101f6dc30:     	fmov.2s	v0, #1.00000000
101f6dc34:     	str	d0, [x19, #0x70]
101f6dc38:     	ldr	x8, [x19, #0x128]
101f6dc3c:     	add	x0, x8, #0x270
101f6dc40:     	bl	0x101f170cc <__Z22UI_region_handlers_addP8ListBase>
101f6dc44:     	ldrh	w8, [x19, #0xc4]
101f6dc48:     	orr	w8, w8, #0x8
101f6dc4c:     	strh	w8, [x19, #0xc4]
101f6dc50:     	ldp	x29, x30, [sp, #0x10]
101f6dc54:     	ldp	x20, x19, [sp], #0x20
101f6dc58:     	ret
