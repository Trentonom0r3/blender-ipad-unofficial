
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f9125c <__ZL15hud_region_initP15wmWindowManagerP7ARegion>:
101f9125c:     	stp	x20, x19, [sp, #-0x20]!
101f91260:     	stp	x29, x30, [sp, #0x10]
101f91264:     	add	x29, sp, #0x10
101f91268:     	mov	x19, x1
101f9126c:     	bl	0x101625ff8 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion>
101f91270:     	fmov.2s	v0, #1.00000000
101f91274:     	str	d0, [x19, #0x70]
101f91278:     	ldr	x8, [x19, #0x128]
101f9127c:     	add	x0, x8, #0x328
101f91280:     	bl	0x101f39eac <__Z22UI_region_handlers_addP8ListBase>
101f91284:     	ldrh	w8, [x19, #0xc4]
101f91288:     	orr	w8, w8, #0x8
101f9128c:     	strh	w8, [x19, #0xc4]
101f91290:     	ldp	x29, x30, [sp, #0x10]
101f91294:     	ldp	x20, x19, [sp], #0x20
101f91298:     	ret
