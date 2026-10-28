
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101621850 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>:
101621850:     	cbz	x0, 0x1016218d4 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x84>
101621854:     	ldrh	w8, [x0, #0x52]
101621858:     	tbnz	w8, #0x3, 0x1016218d4 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x84>
10162185c:     	orr	w8, w8, #0x8
101621860:     	strh	w8, [x0, #0x52]
101621864:     	ldrh	w8, [x1, #0xc2]
101621868:     	cmp	w8, #0x7
10162186c:     	b.eq	0x1016218d4 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x84>
101621870:     	ldr	x8, [x1]
101621874:     	cbz	x8, 0x1016218d4 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x84>
101621878:     	mov	w9, #0xffd1             ; =65489
10162187c:     	b	0x101621888 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x38>
101621880:     	ldr	x8, [x8]
101621884:     	cbz	x8, 0x1016218d4 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x84>
101621888:     	ldrh	w10, [x1, #0xca]
10162188c:     	ldrh	w11, [x8, #0xca]
101621890:     	cmp	w10, w11
101621894:     	b.ne	0x101621880 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x30>
101621898:     	ldrh	w10, [x8, #0xc2]
10162189c:     	cmp	w10, #0x7
1016218a0:     	b.eq	0x101621880 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x30>
1016218a4:     	ldr	x10, [x8, #0x128]
1016218a8:     	ldrh	w11, [x10, #0x36a]
1016218ac:     	tbnz	w11, #0x3, 0x101621880 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x30>
1016218b0:     	and	w11, w11, w9
1016218b4:     	strh	w11, [x10, #0x36a]
1016218b8:     	ldr	x10, [x8, #0x128]
1016218bc:     	ldrh	w11, [x10, #0x36a]
1016218c0:     	orr	w11, w11, #0x1
1016218c4:     	strh	w11, [x10, #0x36a]
1016218c8:     	ldr	x10, [x8, #0x128]
1016218cc:     	stp	xzr, xzr, [x10, #0x178]
1016218d0:     	b	0x101621880 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x30>
1016218d4:     	ret
