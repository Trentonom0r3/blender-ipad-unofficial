
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37960879236\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f6f904 <__ZL15hud_region_initP15wmWindowManagerP7ARegion>:
101f6f904:     	stp	x20, x19, [sp, #-0x20]!
101f6f908:     	stp	x29, x30, [sp, #0x10]
101f6f90c:     	add	x29, sp, #0x10
101f6f910:     	mov	x19, x1
101f6f914:     	bl	0x10160c744 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion>
101f6f918:     	fmov.2s	v0, #1.00000000
101f6f91c:     	str	d0, [x19, #0x70]
101f6f920:     	ldr	x8, [x19, #0x128]
101f6f924:     	add	x0, x8, #0x270
101f6f928:     	bl	0x101f18db4 <__Z22UI_region_handlers_addP8ListBase>
101f6f92c:     	ldrh	w8, [x19, #0xc4]
101f6f930:     	orr	w8, w8, #0x8
101f6f934:     	strh	w8, [x19, #0xc4]
101f6f938:     	ldp	x29, x30, [sp, #0x10]
101f6f93c:     	ldp	x20, x19, [sp], #0x20
101f6f940:     	ret
