
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101c34624 <__Z26ED_mesh_knife_modal_originPK10wmOperatorR20MeshKnifeModalOrigin>:
101c34624:     	movi.16b	v0, #0x0
101c34628:     	stp	q0, q0, [x1, #0x10]
101c3462c:     	str	q0, [x1]
101c34630:     	cbz	x0, 0x101c34648 <__Z26ED_mesh_knife_modal_originPK10wmOperatorR20MeshKnifeModalOrigin+0x24>
101c34634:     	ldr	x8, [x0, #0x90]
101c34638:     	cbnz	x8, 0x101c34644 <__Z26ED_mesh_knife_modal_originPK10wmOperatorR20MeshKnifeModalOrigin+0x20>
101c3463c:     	ldr	x8, [x0, #0x80]
101c34640:     	cbz	x8, 0x101c3464c <__Z26ED_mesh_knife_modal_originPK10wmOperatorR20MeshKnifeModalOrigin+0x28>
101c34644:     	mov	w0, #0x0                ; =0
101c34648:     	ret
101c3464c:     	ldr	x8, [x0, #0x60]
101c34650:     	cbz	x8, 0x101c34644 <__Z26ED_mesh_knife_modal_originPK10wmOperatorR20MeshKnifeModalOrigin+0x20>
101c34654:     	ldr	x9, [x0, #0x58]
101c34658:     	cbz	x9, 0x101c34644 <__Z26ED_mesh_knife_modal_originPK10wmOperatorR20MeshKnifeModalOrigin+0x20>
101c3465c:     	ldrh	w10, [x9, #0xe4]
101c34660:     	tbnz	w10, #0x3, 0x101c34644 <__Z26ED_mesh_knife_modal_originPK10wmOperatorR20MeshKnifeModalOrigin+0x20>
101c34664:     	ldr	x10, [x9, #0xa0]
101c34668:     	cbnz	x10, 0x101c34644 <__Z26ED_mesh_knife_modal_originPK10wmOperatorR20MeshKnifeModalOrigin+0x20>
101c3466c:     	ldr	x10, [x9, #0x38]
101c34670:     	adrp	x11, 0x101c33000 <__ZL29edbm_face_split_by_edges_execP8bContextP10wmOperator+0x948>
101c34674:     	add	x11, x11, #0xafc
101c34678:     	cmp	x10, x11
101c3467c:     	b.ne	0x101c34644 <__Z26ED_mesh_knife_modal_originPK10wmOperatorR20MeshKnifeModalOrigin+0x20>
101c34680:     	ldr	x10, [x9, #0x48]
101c34684:     	adrp	x11, 0x101c33000 <__ZL29edbm_face_split_by_edges_execP8bContextP10wmOperator+0x948>
101c34688:     	add	x11, x11, #0xdf4
101c3468c:     	cmp	x10, x11
101c34690:     	b.ne	0x101c34644 <__Z26ED_mesh_knife_modal_originPK10wmOperatorR20MeshKnifeModalOrigin+0x20>
101c34694:     	ldr	x9, [x9, #0x40]
101c34698:     	adrp	x10, 0x101c34000 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x20c>
101c3469c:     	add	x10, x10, #0x5fc
101c346a0:     	cmp	x9, x10
101c346a4:     	b.ne	0x101c34644 <__Z26ED_mesh_knife_modal_originPK10wmOperatorR20MeshKnifeModalOrigin+0x20>
101c346a8:     	mov	w0, #0x0                ; =0
101c346ac:     	ldr	x9, [x8, #0x28]
101c346b0:     	cbz	x9, 0x101c34648 <__Z26ED_mesh_knife_modal_originPK10wmOperatorR20MeshKnifeModalOrigin+0x24>
101c346b4:     	ldr	x10, [x8, #0x30]
101c346b8:     	cbz	x10, 0x101c34648 <__Z26ED_mesh_knife_modal_originPK10wmOperatorR20MeshKnifeModalOrigin+0x24>
101c346bc:     	ldr	x11, [x8, #0x50]
101c346c0:     	cbz	x11, 0x101c34648 <__Z26ED_mesh_knife_modal_originPK10wmOperatorR20MeshKnifeModalOrigin+0x24>
101c346c4:     	ldr	x13, [x8, #0x48]
101c346c8:     	cbz	x13, 0x101c34648 <__Z26ED_mesh_knife_modal_originPK10wmOperatorR20MeshKnifeModalOrigin+0x24>
101c346cc:     	ldr	x12, [x8, #0x60]
101c346d0:     	cbz	x12, 0x101c34648 <__Z26ED_mesh_knife_modal_originPK10wmOperatorR20MeshKnifeModalOrigin+0x24>
101c346d4:     	ldr	x8, [x8, #0x40]
101c346d8:     	cbz	x8, 0x101c34648 <__Z26ED_mesh_knife_modal_originPK10wmOperatorR20MeshKnifeModalOrigin+0x24>
101c346dc:     	stp	x9, x10, [x1]
101c346e0:     	stp	x11, x13, [x1, #0x10]
101c346e4:     	mov	w0, #0x1                ; =1
101c346e8:     	stp	x12, x8, [x1, #0x20]
101c346ec:     	ret
