
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163a89c <__Z24ED_ipad_hud_layout_beginP8bContextP8wmWindowP7ScrAreaP7ARegion>:
10163a89c:     	ldrh	w8, [x3, #0xc0]
10163a8a0:     	cmp	w8, #0x8
10163a8a4:     	b.ne	0x10163a934 <__Z24ED_ipad_hud_layout_beginP8bContextP8wmWindowP7ScrAreaP7ARegion+0x98>
10163a8a8:     	ldr	x8, [x3, #0x128]
10163a8ac:     	ldr	x9, [x8, #0xb0]
10163a8b0:     	cbnz	x9, 0x10163a8e4 <__Z24ED_ipad_hud_layout_beginP8bContextP8wmWindowP7ScrAreaP7ARegion+0x48>
10163a8b4:     	adrp	x10, 0x106c17000 <_screen_context_dir+0x88>
10163a8b8:     	ldr	x9, [x10, #0x130]
10163a8bc:     	cmn	x9, #0x1
10163a8c0:     	b.eq	0x10163a8d0 <__Z24ED_ipad_hud_layout_beginP8bContextP8wmWindowP7ScrAreaP7ARegion+0x34>
10163a8c4:     	add	x11, x9, #0x1
10163a8c8:     	str	x11, [x10, #0x130]
10163a8cc:     	b	0x10163a8d4 <__Z24ED_ipad_hud_layout_beginP8bContextP8wmWindowP7ScrAreaP7ARegion+0x38>
10163a8d0:     	mov	x9, #0x0                ; =0
10163a8d4:     	str	x9, [x8, #0xb0]
10163a8d8:     	ldr	x8, [x3, #0x128]
10163a8dc:     	ldr	x9, [x8, #0xb0]
10163a8e0:     	cbz	x9, 0x10163a934 <__Z24ED_ipad_hud_layout_beginP8bContextP8wmWindowP7ScrAreaP7ARegion+0x98>
10163a8e4:     	stp	x22, x21, [sp, #-0x30]!
10163a8e8:     	stp	x20, x19, [sp, #0x10]
10163a8ec:     	stp	x29, x30, [sp, #0x20]
10163a8f0:     	add	x29, sp, #0x20
10163a8f4:     	mov	x19, x0
10163a8f8:     	add	x0, x8, #0xb0
10163a8fc:     	mov	x20, x3
10163a900:     	mov	x21, x2
10163a904:     	mov	x22, x1
10163a908:     	bl	0x10163a938 <__ZNSt3__113unordered_mapIyN12_GLOBAL__N_114IPadHUDContentENS_4hashIyEENS_8equal_toIyEENS_9allocatorINS_4pairIKyS2_EEEEEixERS9_>
10163a90c:     	mov	x4, x0
10163a910:     	strb	wzr, [x0, #0x588]
10163a914:     	mov	x0, x19
10163a918:     	mov	x1, x22
10163a91c:     	mov	x2, x21
10163a920:     	mov	x3, x20
10163a924:     	ldp	x29, x30, [sp, #0x20]
10163a928:     	ldp	x20, x19, [sp, #0x10]
10163a92c:     	ldp	x22, x21, [sp], #0x30
10163a930:     	b	0x10163ad38 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE>
10163a934:     	ret
