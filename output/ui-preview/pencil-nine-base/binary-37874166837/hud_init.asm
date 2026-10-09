
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37874166837\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f6c764 <__ZL15hud_region_initP15wmWindowManagerP7ARegion>:
101f6c764:     	stp	x20, x19, [sp, #-0x20]!
101f6c768:     	stp	x29, x30, [sp, #0x10]
101f6c76c:     	add	x29, sp, #0x10
101f6c770:     	mov	x19, x1
101f6c774:     	bl	0x10160a46c <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion>
101f6c778:     	fmov.2s	v0, #1.00000000
101f6c77c:     	str	d0, [x19, #0x70]
101f6c780:     	ldr	x8, [x19, #0x128]
101f6c784:     	add	x0, x8, #0x270
101f6c788:     	bl	0x101f15c14 <__Z22UI_region_handlers_addP8ListBase>
101f6c78c:     	ldrh	w8, [x19, #0xc4]
101f6c790:     	orr	w8, w8, #0x8
101f6c794:     	strh	w8, [x19, #0xc4]
101f6c798:     	ldp	x29, x30, [sp, #0x10]
101f6c79c:     	ldp	x20, x19, [sp], #0x20
101f6c7a0:     	ret
