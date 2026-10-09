
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37883530390\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f6d69c <__ZL15hud_region_initP15wmWindowManagerP7ARegion>:
101f6d69c:     	stp	x20, x19, [sp, #-0x20]!
101f6d6a0:     	stp	x29, x30, [sp, #0x10]
101f6d6a4:     	add	x29, sp, #0x10
101f6d6a8:     	mov	x19, x1
101f6d6ac:     	bl	0x10160a47c <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion>
101f6d6b0:     	fmov.2s	v0, #1.00000000
101f6d6b4:     	str	d0, [x19, #0x70]
101f6d6b8:     	ldr	x8, [x19, #0x128]
101f6d6bc:     	add	x0, x8, #0x270
101f6d6c0:     	bl	0x101f16b4c <__Z22UI_region_handlers_addP8ListBase>
101f6d6c4:     	ldrh	w8, [x19, #0xc4]
101f6d6c8:     	orr	w8, w8, #0x8
101f6d6cc:     	strh	w8, [x19, #0xc4]
101f6d6d0:     	ldp	x29, x30, [sp, #0x10]
101f6d6d4:     	ldp	x20, x19, [sp], #0x20
101f6d6d8:     	ret
