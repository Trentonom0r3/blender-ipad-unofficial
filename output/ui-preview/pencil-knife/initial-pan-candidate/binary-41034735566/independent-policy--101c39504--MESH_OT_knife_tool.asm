
output/ui-preview/pencil-knife/initial-pan-candidate/binary-41034735566/Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101c39504 <__Z18MESH_OT_knife_toolP14wmOperatorType>:
101c39504:     	stp	x20, x19, [sp, #-0x20]!
101c39508:     	stp	x29, x30, [sp, #0x10]
101c3950c:     	add	x29, sp, #0x10
101c39510:     	mov	x19, x0
101c39514:     	adrp	x8, 0x104d31000 <__ZL3hex+0x160a0d>
101c39518:     	add	x8, x8, #0x809
101c3951c:     	adrp	x9, 0x104bd5000 <__ZL3hex+0x4a0d>
101c39520:     	add	x9, x9, #0x86c
101c39524:     	stp	x8, x9, [x0]
101c39528:     	adrp	x8, 0x104d31000 <__ZL3hex+0x160a0d>
101c3952c:     	add	x8, x8, #0x81d
101c39530:     	adrp	x9, 0x101c37000 <__ZL29edbm_face_split_by_edges_execP8bContextP10wmOperator+0x454>
101c39534:     	add	x9, x9, #0xff0
101c39538:     	adrp	x10, 0x101c38000 <__ZL16knifetool_invokeP8bContextP10wmOperatorPK7wmEvent+0x10>
101c3953c:     	add	x10, x10, #0x2e8
101c39540:     	str	x8, [x0, #0x18]
101c39544:     	adrp	x8, 0x101c38000 <__ZL16knifetool_invokeP8bContextP10wmOperatorPK7wmEvent+0x10>
101c39548:     	add	x8, x8, #0xaf0
101c3954c:     	adrp	x11, 0x101655000 <__Z39ED_operator_object_active_editable_meshP8bContext+0xd0>
101c39550:     	add	x11, x11, #0x280
101c39554:     	stp	x9, x8, [x0, #0x38]
101c39558:     	stp	x10, x11, [x0, #0x48]
101c3955c:     	mov	w8, #0x7                ; =7
101c39560:     	strh	w8, [x0, #0xe4]
101c39564:     	ldr	x0, [x0, #0x88]
101c39568:     	adrp	x1, 0x104d31000 <__ZL3hex+0x160a0d>
101c3956c:     	add	x1, x1, #0x8fe
101c39570:     	adrp	x3, 0x104d31000 <__ZL3hex+0x160a0d>
101c39574:     	add	x3, x3, #0x913
101c39578:     	adrp	x4, 0x104d31000 <__ZL3hex+0x160a0d>
101c3957c:     	add	x4, x4, #0x924
101c39580:     	mov	w2, #0x1                ; =1
101c39584:     	bl	0x101277c78 <__Z15RNA_def_booleanPvPKcbS1_S1_>
101c39588:     	ldr	x0, [x19, #0x88]
101c3958c:     	adrp	x1, 0x104d25000 <__ZL3hex+0x154a0d>
101c39590:     	add	x1, x1, #0x4f
101c39594:     	adrp	x3, 0x104d25000 <__ZL3hex+0x154a0d>
101c39598:     	add	x3, x3, #0x5d
101c3959c:     	adrp	x4, 0x104d31000 <__ZL3hex+0x160a0d>
101c395a0:     	add	x4, x4, #0x945
101c395a4:     	mov	w2, #0x0                ; =0
101c395a8:     	bl	0x101277c78 <__Z15RNA_def_booleanPvPKcbS1_S1_>
101c395ac:     	ldr	x0, [x19, #0x88]
101c395b0:     	adrp	x1, 0x104d31000 <__ZL3hex+0x160a0d>
101c395b4:     	add	x1, x1, #0x960
101c395b8:     	adrp	x3, 0x104d31000 <__ZL3hex+0x160a0d>
101c395bc:     	add	x3, x3, #0x965
101c395c0:     	adrp	x4, 0x104d31000 <__ZL3hex+0x160a0d>
101c395c4:     	add	x4, x4, #0x96b
101c395c8:     	mov	w2, #0x1                ; =1
101c395cc:     	bl	0x101277c78 <__Z15RNA_def_booleanPvPKcbS1_S1_>
101c395d0:     	ldr	x0, [x19, #0x88]
101c395d4:     	adrp	x1, 0x104d31000 <__ZL3hex+0x160a0d>
101c395d8:     	add	x1, x1, #0x988
101c395dc:     	adrp	x2, 0x106482000 <__ZZ22knifetool_modal_keymapP11wmKeyConfigE11modal_items>
101c395e0:     	add	x2, x2, #0x320
101c395e4:     	adrp	x4, 0x104d31000 <__ZL3hex+0x160a0d>
101c395e8:     	add	x4, x4, #0x99d
101c395ec:     	adrp	x5, 0x104d31000 <__ZL3hex+0x160a0d>
101c395f0:     	add	x5, x5, #0x9aa
101c395f4:     	mov	w3, #0x0                ; =0
101c395f8:     	bl	0x10127be08 <__Z12RNA_def_enumPvPKcPK16EnumPropertyItemiS1_S1_>
101c395fc:     	ldr	x0, [x19, #0x88]
101c39600:     	adrp	x1, 0x104d31000 <__ZL3hex+0x160a0d>
101c39604:     	add	x1, x1, #0x9d2
101c39608:     	adrp	x2, 0x106482000 <__ZZ22knifetool_modal_keymapP11wmKeyConfigE11modal_items>
101c3960c:     	add	x2, x2, #0x3e8
101c39610:     	adrp	x4, 0x104d31000 <__ZL3hex+0x160a0d>
101c39614:     	add	x4, x4, #0x9e1
101c39618:     	adrp	x5, 0x104d31000 <__ZL3hex+0x160a0d>
101c3961c:     	add	x5, x5, #0x9f0
101c39620:     	mov	w3, #0x0                ; =0
101c39624:     	bl	0x10127be08 <__Z12RNA_def_enumPvPKcPK16EnumPropertyItemiS1_S1_>
101c39628:     	adrp	x1, 0x104d11000 <__ZL3hex+0x140a0d>
101c3962c:     	add	x1, x1, #0x3c0
101c39630:     	bl	0x10127adec <__Z36RNA_def_property_translation_contextP11PropertyRNAPKc>
101c39634:     	ldr	x0, [x19, #0x88]
101c39638:     	adrp	x1, 0x104d31000 <__ZL3hex+0x160a0d>
101c3963c:     	add	x1, x1, #0xa04
101c39640:     	adrp	x2, 0x104d31000 <__ZL3hex+0x160a0d>
101c39644:     	add	x2, x2, #0xa1d
101c39648:     	mov	w8, #0xa92              ; =2706
101c3964c:     	movk	w8, #0x3f06, lsl #16
101c39650:     	fmov	s0, w8
101c39654:     	mov	w8, #0xfdb              ; =4059
101c39658:     	movk	w8, #0x4049, lsl #16
101c3965c:     	fmov	s2, w8
