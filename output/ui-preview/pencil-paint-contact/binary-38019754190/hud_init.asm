
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-38019754190\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f7175c <__ZL15hud_region_initP15wmWindowManagerP7ARegion>:
101f7175c:     	stp	x20, x19, [sp, #-0x20]!
101f71760:     	stp	x29, x30, [sp, #0x10]
101f71764:     	add	x29, sp, #0x10
101f71768:     	mov	x19, x1
101f7176c:     	bl	0x10160e27c <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion>
101f71770:     	fmov.2s	v0, #1.00000000
101f71774:     	str	d0, [x19, #0x70]
101f71778:     	ldr	x8, [x19, #0x128]
101f7177c:     	add	x0, x8, #0x270
101f71780:     	bl	0x101f1ac0c <__Z22UI_region_handlers_addP8ListBase>
101f71784:     	ldrh	w8, [x19, #0xc4]
101f71788:     	orr	w8, w8, #0x8
101f7178c:     	strh	w8, [x19, #0xc4]
101f71790:     	ldp	x29, x30, [sp, #0x10]
101f71794:     	ldp	x20, x19, [sp], #0x20
101f71798:     	ret
