
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101620de8 <__Z20ED_region_tag_redrawP7ARegion>:
101620de8:     	cbz	x0, 0x101620e1c <__Z20ED_region_tag_redrawP7ARegion+0x34>
101620dec:     	ldr	x8, [x0, #0x128]
101620df0:     	ldrh	w9, [x8, #0x36a]
101620df4:     	tbnz	w9, #0x3, 0x101620e1c <__Z20ED_region_tag_redrawP7ARegion+0x34>
101620df8:     	mov	w10, #0xffd1            ; =65489
101620dfc:     	and	w9, w9, w10
101620e00:     	strh	w9, [x8, #0x36a]
101620e04:     	ldr	x8, [x0, #0x128]
101620e08:     	ldrh	w9, [x8, #0x36a]
101620e0c:     	orr	w9, w9, #0x1
101620e10:     	strh	w9, [x8, #0x36a]
101620e14:     	ldr	x8, [x0, #0x128]
101620e18:     	stp	xzr, xzr, [x8, #0x178]
101620e1c:     	ret
