
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163b254 <__Z22ED_ipad_hud_layout_endP8bContextP8wmWindowP7ScrAreaP7ARegion>:
10163b254:     	ldrh	w8, [x3, #0xc0]
10163b258:     	cmp	w8, #0x8
10163b25c:     	b.ne	0x10163b2d8 <__Z22ED_ipad_hud_layout_endP8bContextP8wmWindowP7ScrAreaP7ARegion+0x84>
10163b260:     	ldr	x8, [x3, #0x128]
10163b264:     	ldr	x9, [x8, #0xb0]!
10163b268:     	cbz	x9, 0x10163b2d8 <__Z22ED_ipad_hud_layout_endP8bContextP8wmWindowP7ScrAreaP7ARegion+0x84>
10163b26c:     	stp	x24, x23, [sp, #-0x40]!
10163b270:     	stp	x22, x21, [sp, #0x10]
10163b274:     	stp	x20, x19, [sp, #0x20]
10163b278:     	stp	x29, x30, [sp, #0x30]
10163b27c:     	add	x29, sp, #0x30
10163b280:     	mov	x19, x0
10163b284:     	mov	x0, x8
10163b288:     	mov	x20, x3
10163b28c:     	mov	x21, x2
10163b290:     	mov	x22, x1
10163b294:     	bl	0x10163a938 <__ZNSt3__113unordered_mapIyN12_GLOBAL__N_114IPadHUDContentENS_4hashIyEENS_8equal_toIyEENS_9allocatorINS_4pairIKyS2_EEEEEixERS9_>
10163b298:     	mov	x23, x0
10163b29c:     	add	x4, x0, #0x1d8
10163b2a0:     	mov	x0, x19
10163b2a4:     	mov	x1, x22
10163b2a8:     	mov	x2, x21
10163b2ac:     	mov	x3, x20
10163b2b0:     	bl	0x10163ad38 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE>
10163b2b4:     	add	x1, x23, #0x1d8
10163b2b8:     	mov	x0, x23
10163b2bc:     	mov	w2, #0x0                ; =0
10163b2c0:     	bl	0x10163b2dc <__ZN12_GLOBAL__N_120ipad_hud_owner_equalERKNS_12IPadHUDOwnerES2_b>
10163b2c4:     	strb	w0, [x23, #0x588]
10163b2c8:     	ldp	x29, x30, [sp, #0x30]
10163b2cc:     	ldp	x20, x19, [sp, #0x20]
10163b2d0:     	ldp	x22, x21, [sp, #0x10]
10163b2d4:     	ldp	x24, x23, [sp], #0x40
10163b2d8:     	ret
