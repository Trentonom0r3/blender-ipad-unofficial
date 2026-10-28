
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101fe64f8 <__ZL14VIEW2D_OT_zoomP14wmOperatorType>:
101fe64f8:     	stp	d9, d8, [sp, #-0x30]!
101fe64fc:     	stp	x20, x19, [sp, #0x10]
101fe6500:     	stp	x29, x30, [sp, #0x20]
101fe6504:     	add	x29, sp, #0x20
101fe6508:     	mov	x19, x0
101fe650c:     	adrp	x8, 0x104d5a000 <__ZL3hex+0x18a5cd>
101fe6510:     	add	x8, x8, #0x4e5
101fe6514:     	str	x8, [x0, #0x18]
101fe6518:     	adrp	x8, 0x104d5a000 <__ZL3hex+0x18a5cd>
101fe651c:     	add	x8, x8, #0x4d8
101fe6520:     	adrp	x9, 0x104bd5000 <__ZL3hex+0x55cd>
101fe6524:     	add	x9, x9, #0x250
101fe6528:     	stp	x8, x9, [x0]
101fe652c:     	adrp	x8, 0x101fe4000 <__Z24UI_view2d_edge_pan_applyP8bContextP17View2DEdgePanDataPKi+0x3c>
101fe6530:     	add	x8, x8, #0xd84
101fe6534:     	adrp	x9, 0x101fe4000 <__Z24UI_view2d_edge_pan_applyP8bContextP17View2DEdgePanDataPKi+0x3c>
101fe6538:     	add	x9, x9, #0xe6c
101fe653c:     	adrp	x10, 0x101fe5000 <__ZL20view_zoomdrag_invokeP8bContextP10wmOperatorPK7wmEvent+0x194>
101fe6540:     	add	x10, x10, #0x1bc
101fe6544:     	str	x8, [x0, #0x28]
101fe6548:     	adrp	x8, 0x101fe5000 <__ZL20view_zoomdrag_invokeP8bContextP10wmOperatorPK7wmEvent+0x194>
101fe654c:     	add	x8, x8, #0x534
101fe6550:     	adrp	x11, 0x101fe4000 <__Z24UI_view2d_edge_pan_applyP8bContextP17View2DEdgePanDataPKi+0x3c>
101fe6554:     	add	x11, x11, #0xd38
101fe6558:     	stp	x9, x8, [x0, #0x38]
101fe655c:     	stp	x10, x11, [x0, #0x48]
101fe6560:     	mov	w8, #0x14               ; =20
101fe6564:     	strh	w8, [x0, #0xe4]
101fe6568:     	ldr	x0, [x0, #0x88]
101fe656c:     	adrp	x1, 0x104d5a000 <__ZL3hex+0x18a5cd>
101fe6570:     	add	x1, x1, #0x34b
101fe6574:     	adrp	x2, 0x104d5a000 <__ZL3hex+0x18a5cd>
101fe6578:     	add	x2, x2, #0x374
101fe657c:     	adrp	x20, 0x104b98000 <_zlibVersion+0x104b98000>
101fe6580:     	add	x20, x20, #0x94
101fe6584:     	mov	w8, #-0x800001          ; =-8388609
101fe6588:     	fmov	s8, w8
101fe658c:     	mov	w8, #0x7f7fffff         ; =2139095039
101fe6590:     	fmov	s9, w8
101fe6594:     	fmov	s0, wzr
101fe6598:     	fmov	s1, s8
101fe659c:     	fmov	s2, s9
101fe65a0:     	fmov	s3, s8
101fe65a4:     	fmov	s4, s9
101fe65a8:     	mov	x3, x20
101fe65ac:     	bl	0x10127b5f0 <__Z13RNA_def_floatPvPKcfffS1_S1_ff>
101fe65b0:     	mov	w1, #0x80000            ; =524288
101fe65b4:     	bl	0x101276fec <__Z21RNA_def_property_flagP11PropertyRNA12PropertyFlag>
101fe65b8:     	ldr	x0, [x19, #0x88]
101fe65bc:     	adrp	x1, 0x104d5a000 <__ZL3hex+0x18a5cd>
101fe65c0:     	add	x1, x1, #0x352
101fe65c4:     	adrp	x2, 0x104d5a000 <__ZL3hex+0x18a5cd>
101fe65c8:     	add	x2, x2, #0x37c
101fe65cc:     	fmov	s0, wzr
101fe65d0:     	fmov	s1, s8
101fe65d4:     	fmov	s2, s9
101fe65d8:     	mov	x3, x20
101fe65dc:     	fmov	s3, s8
101fe65e0:     	fmov	s4, s9
101fe65e4:     	bl	0x10127b5f0 <__Z13RNA_def_floatPvPKcfffS1_S1_ff>
101fe65e8:     	mov	w1, #0x80000            ; =524288
101fe65ec:     	bl	0x101276fec <__Z21RNA_def_property_flagP11PropertyRNA12PropertyFlag>
101fe65f0:     	mov	x0, x19
101fe65f4:     	ldp	x29, x30, [sp, #0x20]
101fe65f8:     	ldp	x20, x19, [sp, #0x10]
101fe65fc:     	ldp	d9, d8, [sp], #0x30
101fe6600:     	b	0x100b7c860 <__Z38WM_operator_properties_use_cursor_initP14wmOperatorType>
