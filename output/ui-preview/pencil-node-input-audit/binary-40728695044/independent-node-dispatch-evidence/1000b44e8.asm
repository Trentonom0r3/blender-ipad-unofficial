
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001000b44e8 <__Z20CTX_wm_region_view3dPK8bContext>:
1000b44e8:     	stp	x20, x19, [sp, #-0x20]!
1000b44ec:     	stp	x29, x30, [sp, #0x10]
1000b44f0:     	add	x29, sp, #0x10
1000b44f4:     	mov	x20, x0
1000b44f8:     	ldr	x3, [x0, #0x28]
1000b44fc:     	adrp	x1, 0x104b84000 <_zlibVersion+0x104b84000>
1000b4500:     	add	x1, x1, #0x309
1000b4504:     	adrp	x2, 0x106a94000 <__ZL40rna_Screen_use_play_spreadsheet_editors_+0x28>
1000b4508:     	add	x2, x2, #0x2c0
1000b450c:     	bl	0x1000b4230 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv>
1000b4510:     	mov	x19, x0
1000b4514:     	ldr	x3, [x20, #0x30]
1000b4518:     	adrp	x1, 0x104b84000 <_zlibVersion+0x104b84000>
1000b451c:     	add	x1, x1, #0x30e
1000b4520:     	adrp	x2, 0x106a95000 <__ZL11rna_Area_y_+0x178>
1000b4524:     	add	x2, x2, #0x8e0
1000b4528:     	mov	x0, x20
1000b452c:     	bl	0x1000b4230 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv>
1000b4530:     	cbz	x19, 0x1000b454c <__Z20CTX_wm_region_view3dPK8bContext+0x64>
1000b4534:     	ldrb	w8, [x19, #0x48]
1000b4538:     	cmp	w8, #0x1
1000b453c:     	ccmp	x0, #0x0, #0x4, eq
1000b4540:     	b.eq	0x1000b454c <__Z20CTX_wm_region_view3dPK8bContext+0x64>
1000b4544:     	ldrh	w8, [x0, #0xc0]
1000b4548:     	cbz	w8, 0x1000b455c <__Z20CTX_wm_region_view3dPK8bContext+0x74>
1000b454c:     	mov	x0, #0x0                ; =0
1000b4550:     	ldp	x29, x30, [sp, #0x10]
1000b4554:     	ldp	x20, x19, [sp], #0x20
1000b4558:     	ret
1000b455c:     	ldr	x0, [x0, #0x120]
1000b4560:     	b	0x1000b4550 <__Z20CTX_wm_region_view3dPK8bContext+0x68>
