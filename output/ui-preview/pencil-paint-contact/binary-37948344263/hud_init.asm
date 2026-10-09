
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37948344263\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f6dbbc <__ZL15hud_region_initP15wmWindowManagerP7ARegion>:
101f6dbbc:     	stp	x20, x19, [sp, #-0x20]!
101f6dbc0:     	stp	x29, x30, [sp, #0x10]
101f6dbc4:     	add	x29, sp, #0x10
101f6dbc8:     	mov	x19, x1
101f6dbcc:     	bl	0x10160a9fc <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion>
101f6dbd0:     	fmov.2s	v0, #1.00000000
101f6dbd4:     	str	d0, [x19, #0x70]
101f6dbd8:     	ldr	x8, [x19, #0x128]
101f6dbdc:     	add	x0, x8, #0x270
101f6dbe0:     	bl	0x101f1706c <__Z22UI_region_handlers_addP8ListBase>
101f6dbe4:     	ldrh	w8, [x19, #0xc4]
101f6dbe8:     	orr	w8, w8, #0x8
101f6dbec:     	strh	w8, [x19, #0xc4]
101f6dbf0:     	ldp	x29, x30, [sp, #0x10]
101f6dbf4:     	ldp	x20, x19, [sp], #0x20
101f6dbf8:     	ret
