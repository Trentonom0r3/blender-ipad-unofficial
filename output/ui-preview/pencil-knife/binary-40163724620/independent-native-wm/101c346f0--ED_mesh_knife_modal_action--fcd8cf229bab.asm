
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101c346f0 <__Z26ED_mesh_knife_modal_actionP8bContextP10wmOperatorPK7wmEventb>:
101c346f0:     	mov	w8, #0x8                ; =8
101c346f4:     	cbz	x1, 0x101c347d8 <__Z26ED_mesh_knife_modal_actionP8bContextP10wmOperatorPK7wmEventb+0xe8>
101c346f8:     	cbz	x0, 0x101c347d8 <__Z26ED_mesh_knife_modal_actionP8bContextP10wmOperatorPK7wmEventb+0xe8>
101c346fc:     	cbz	x2, 0x101c347d8 <__Z26ED_mesh_knife_modal_actionP8bContextP10wmOperatorPK7wmEventb+0xe8>
101c34700:     	ldr	x8, [x1, #0x90]
101c34704:     	cbnz	x8, 0x101c34710 <__Z26ED_mesh_knife_modal_actionP8bContextP10wmOperatorPK7wmEventb+0x20>
101c34708:     	ldr	x8, [x1, #0x80]
101c3470c:     	cbz	x8, 0x101c34718 <__Z26ED_mesh_knife_modal_actionP8bContextP10wmOperatorPK7wmEventb+0x28>
101c34710:     	mov	w0, #0x8                ; =8
101c34714:     	ret
101c34718:     	ldr	x8, [x1, #0x60]
101c3471c:     	cbz	x8, 0x101c34710 <__Z26ED_mesh_knife_modal_actionP8bContextP10wmOperatorPK7wmEventb+0x20>
101c34720:     	ldr	x8, [x1, #0x58]
101c34724:     	cbz	x8, 0x101c34710 <__Z26ED_mesh_knife_modal_actionP8bContextP10wmOperatorPK7wmEventb+0x20>
101c34728:     	ldrh	w9, [x8, #0xe4]
101c3472c:     	tbnz	w9, #0x3, 0x101c34710 <__Z26ED_mesh_knife_modal_actionP8bContextP10wmOperatorPK7wmEventb+0x20>
101c34730:     	ldr	x9, [x8, #0xa0]
101c34734:     	cbnz	x9, 0x101c34710 <__Z26ED_mesh_knife_modal_actionP8bContextP10wmOperatorPK7wmEventb+0x20>
101c34738:     	ldr	x9, [x8, #0x38]
101c3473c:     	adrp	x10, 0x101c33000 <__ZL29edbm_face_split_by_edges_execP8bContextP10wmOperator+0x948>
101c34740:     	add	x10, x10, #0xafc
101c34744:     	cmp	x9, x10
101c34748:     	b.ne	0x101c34710 <__Z26ED_mesh_knife_modal_actionP8bContextP10wmOperatorPK7wmEventb+0x20>
101c3474c:     	ldr	x9, [x8, #0x48]
101c34750:     	adrp	x10, 0x101c33000 <__ZL29edbm_face_split_by_edges_execP8bContextP10wmOperator+0x948>
101c34754:     	add	x10, x10, #0xdf4
101c34758:     	cmp	x9, x10
101c3475c:     	b.ne	0x101c34710 <__Z26ED_mesh_knife_modal_actionP8bContextP10wmOperatorPK7wmEventb+0x20>
101c34760:     	ldr	x8, [x8, #0x40]
101c34764:     	adrp	x9, 0x101c34000 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x20c>
101c34768:     	add	x9, x9, #0x5fc
101c3476c:     	cmp	x8, x9
101c34770:     	b.ne	0x101c34710 <__Z26ED_mesh_knife_modal_actionP8bContextP10wmOperatorPK7wmEventb+0x20>
101c34774:     	sub	sp, sp, #0xc0
101c34778:     	stp	x29, x30, [sp, #0xb0]
101c3477c:     	add	x29, sp, #0xb0
101c34780:     	movi.16b	v0, #0x0
101c34784:     	stp	q0, q0, [sp, #0x90]
101c34788:     	stp	q0, q0, [sp, #0x70]
101c3478c:     	stp	q0, q0, [sp, #0x50]
101c34790:     	stp	q0, q0, [sp, #0x30]
101c34794:     	stp	q0, q0, [sp, #0x10]
101c34798:     	str	q0, [sp]
101c3479c:     	ldr	w8, [x2, #0x10]
101c347a0:     	str	w8, [sp, #0x90]
101c347a4:     	mov	w8, #0x5022             ; =20514
101c347a8:     	strh	w8, [sp, #0x10]
101c347ac:     	cmp	w3, #0x0
101c347b0:     	mov	w8, #0x1                ; =1
101c347b4:     	cinc	w8, w8, ne
101c347b8:     	strh	w8, [sp, #0x12]
101c347bc:     	ldur	q0, [x2, #0x14]
101c347c0:     	stur	q0, [sp, #0x14]
101c347c4:     	mov	x2, sp
101c347c8:     	bl	0x101c33df4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent>
101c347cc:     	mov	x8, x0
101c347d0:     	ldp	x29, x30, [sp, #0xb0]
101c347d4:     	add	sp, sp, #0xc0
101c347d8:     	mov	x0, x8
101c347dc:     	ret
