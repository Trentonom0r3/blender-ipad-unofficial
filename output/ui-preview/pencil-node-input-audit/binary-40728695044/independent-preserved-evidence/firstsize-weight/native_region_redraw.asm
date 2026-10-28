
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001016203a8 <__Z20ED_region_tag_redrawP7ARegion>:
1016203a8:     	cbz	x0, 0x1016203dc <__Z20ED_region_tag_redrawP7ARegion+0x34>
1016203ac:     	ldr	x8, [x0, #0x128]
1016203b0:     	ldrh	w9, [x8, #0x36a]
1016203b4:     	tbnz	w9, #0x3, 0x1016203dc <__Z20ED_region_tag_redrawP7ARegion+0x34>
1016203b8:     	mov	w10, #0xffd1            ; =65489
1016203bc:     	and	w9, w9, w10
1016203c0:     	strh	w9, [x8, #0x36a]
1016203c4:     	ldr	x8, [x0, #0x128]
1016203c8:     	ldrh	w9, [x8, #0x36a]
1016203cc:     	orr	w9, w9, #0x1
1016203d0:     	strh	w9, [x8, #0x36a]
1016203d4:     	ldr	x8, [x0, #0x128]
1016203d8:     	stp	xzr, xzr, [x8, #0x178]
1016203dc:     	ret
