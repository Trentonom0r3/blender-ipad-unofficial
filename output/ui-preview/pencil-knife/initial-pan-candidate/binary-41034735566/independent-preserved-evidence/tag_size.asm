
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101622290 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>:
101622290:     	cbz	x0, 0x101622314 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x84>
101622294:     	ldrh	w8, [x0, #0x52]
101622298:     	tbnz	w8, #0x3, 0x101622314 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x84>
10162229c:     	orr	w8, w8, #0x8
1016222a0:     	strh	w8, [x0, #0x52]
1016222a4:     	ldrh	w8, [x1, #0xc2]
1016222a8:     	cmp	w8, #0x7
1016222ac:     	b.eq	0x101622314 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x84>
1016222b0:     	ldr	x8, [x1]
1016222b4:     	cbz	x8, 0x101622314 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x84>
1016222b8:     	mov	w9, #0xffd1             ; =65489
1016222bc:     	b	0x1016222c8 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x38>
1016222c0:     	ldr	x8, [x8]
1016222c4:     	cbz	x8, 0x101622314 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x84>
1016222c8:     	ldrh	w10, [x1, #0xca]
1016222cc:     	ldrh	w11, [x8, #0xca]
1016222d0:     	cmp	w10, w11
1016222d4:     	b.ne	0x1016222c0 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x30>
1016222d8:     	ldrh	w10, [x8, #0xc2]
1016222dc:     	cmp	w10, #0x7
1016222e0:     	b.eq	0x1016222c0 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x30>
1016222e4:     	ldr	x10, [x8, #0x128]
1016222e8:     	ldrh	w11, [x10, #0x36a]
1016222ec:     	tbnz	w11, #0x3, 0x1016222c0 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x30>
1016222f0:     	and	w11, w11, w9
1016222f4:     	strh	w11, [x10, #0x36a]
1016222f8:     	ldr	x10, [x8, #0x128]
1016222fc:     	ldrh	w11, [x10, #0x36a]
101622300:     	orr	w11, w11, #0x1
101622304:     	strh	w11, [x10, #0x36a]
101622308:     	ldr	x10, [x8, #0x128]
10162230c:     	stp	xzr, xzr, [x10, #0x178]
101622310:     	b	0x1016222c0 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion+0x30>
101622314:     	ret
