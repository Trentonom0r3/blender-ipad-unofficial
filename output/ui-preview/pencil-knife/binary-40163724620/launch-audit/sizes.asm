
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010162069c <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea>:
10162069c:     	ldrh	w8, [x2, #0x52]
1016206a0:     	tbz	w8, #0x3, 0x10162082c <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x190>
1016206a4:     	sub	sp, sp, #0x70
1016206a8:     	stp	x24, x23, [sp, #0x30]
1016206ac:     	stp	x22, x21, [sp, #0x40]
1016206b0:     	stp	x20, x19, [sp, #0x50]
1016206b4:     	stp	x29, x30, [sp, #0x60]
1016206b8:     	add	x29, sp, #0x60
1016206bc:     	mov	x19, x2
1016206c0:     	mov	x20, x1
1016206c4:     	mov	x21, x0
1016206c8:     	mov	x0, x1
1016206cc:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
1016206d0:     	mov	x22, x0
1016206d4:     	mov	x1, sp
1016206d8:     	mov	x0, x20
1016206dc:     	bl	0x100b96b64 <__Z26WM_window_screen_rect_calcPK8wmWindowP4rcti>
1016206e0:     	mov	x2, sp
1016206e4:     	mov	x0, x22
1016206e8:     	mov	x1, x19
1016206ec:     	bl	0x101620830 <__ZL16area_calc_totrctPK7bScreenP7ScrAreaPK4rcti>
1016206f0:     	ldur	q1, [x19, #0x38]
1016206f4:     	ldur	q0, [x19, #0x38]
1016206f8:     	stp	q0, q1, [sp, #0x10]
1016206fc:     	ldr	x1, [x19, #0x78]
101620700:     	add	x2, sp, #0x20
101620704:     	add	x3, sp, #0x10
101620708:     	mov	x0, x19
10162070c:     	mov	w4, #0x0                ; =0
101620710:     	bl	0x101625b58 <__ZL21region_rect_recursiveP7ScrAreaP7ARegionP4rctiS4_i>
101620714:     	mov	x0, x20
101620718:     	mov	x1, x19
10162071c:     	bl	0x10163881c <__Z33ED_ipad_panels_main_region_layoutPK8wmWindowP7ScrArea>
101620720:     	cbz	w0, 0x101620744 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xa8>
101620724:     	ldur	q0, [x19, #0x38]
101620728:     	stp	q0, q0, [sp, #0x10]
10162072c:     	ldr	x1, [x19, #0x78]
101620730:     	add	x2, sp, #0x20
101620734:     	add	x3, sp, #0x10
101620738:     	mov	x0, x19
10162073c:     	mov	w4, #0x0                ; =0
101620740:     	bl	0x101625b58 <__ZL21region_rect_recursiveP7ScrAreaP7ARegionP4rctiS4_i>
101620744:     	mov	x0, x20
101620748:     	mov	x1, x22
10162074c:     	mov	x2, x19
101620750:     	bl	0x101620998 <__ZL15area_azone_initPK8wmWindowPK7bScreenP7ScrArea>
101620754:     	ldr	x23, [x19, #0x78]
101620758:     	cbz	x23, 0x1016207fc <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x160>
10162075c:     	mov	w24, #0xa0              ; =160
101620760:     	b	0x10162077c <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xe0>
101620764:     	mov	x0, x22
101620768:     	mov	x1, x19
10162076c:     	mov	x2, x23
101620770:     	bl	0x101620bd4 <__ZL17region_azones_addPK7bScreenP7ScrAreaP7ARegion>
101620774:     	ldr	x23, [x23]
101620778:     	cbz	x23, 0x1016207fc <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x160>
10162077c:     	ldrh	w8, [x23, #0xc4]
101620780:     	tbnz	w8, #0xa, 0x101620774 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xd8>
101620784:     	ands	w10, w8, #0x3
101620788:     	cset	w9, ne
10162078c:     	ldrh	w11, [x23, #0xc2]
101620790:     	tst	w11, w24
101620794:     	b.eq	0x1016207c0 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x124>
101620798:     	cmp	w10, #0x0
10162079c:     	ldr	x11, [x23, #0x8]
1016207a0:     	ccmp	x11, #0x0, #0x0, eq
1016207a4:     	cset	w9, ne
1016207a8:     	cmp	w10, #0x0
1016207ac:     	ccmp	x11, #0x0, #0x4, eq
1016207b0:     	b.eq	0x1016207c0 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0x124>
1016207b4:     	ldrh	w9, [x11, #0xc4]
1016207b8:     	tst	w9, #0x3
1016207bc:     	cset	w9, ne
1016207c0:     	ldr	x10, [x23, #0x128]
1016207c4:     	ldrb	w11, [x10]
1016207c8:     	ubfx	w8, w8, #1, #1
1016207cc:     	cmp	w11, #0x0
1016207d0:     	csel	w8, w8, w9, ne
1016207d4:     	eor	w8, w8, #0x1
1016207d8:     	strh	w8, [x10, #0x2b0]
1016207dc:     	ldr	x8, [x23, #0x128]
1016207e0:     	ldr	x8, [x8, #0xb8]
1016207e4:     	ldr	x8, [x8, #0x18]
1016207e8:     	cbz	x8, 0x101620764 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xc8>
1016207ec:     	mov	x0, x21
1016207f0:     	mov	x1, x23
1016207f4:     	blr	x8
1016207f8:     	b	0x101620764 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea+0xc8>
1016207fc:     	ldr	x8, [x20, #0xf0]
101620800:     	add	x1, x8, #0x14
101620804:     	mov	x0, x19
101620808:     	bl	0x101651ddc <__Z21ED_area_azones_updateP7ScrAreaPKi>
10162080c:     	ldrh	w8, [x19, #0x52]
101620810:     	and	w8, w8, #0xfffffff7
101620814:     	strh	w8, [x19, #0x52]
101620818:     	ldp	x29, x30, [sp, #0x60]
10162081c:     	ldp	x20, x19, [sp, #0x50]
101620820:     	ldp	x22, x21, [sp, #0x40]
101620824:     	ldp	x24, x23, [sp, #0x30]
101620828:     	add	sp, sp, #0x70
10162082c:     	ret
