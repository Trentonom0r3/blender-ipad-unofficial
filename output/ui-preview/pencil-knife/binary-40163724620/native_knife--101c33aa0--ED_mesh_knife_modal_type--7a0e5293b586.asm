
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101c33aa0 <__Z24ED_mesh_knife_modal_typePK14wmOperatorType>:
101c33aa0:     	cbz	x0, 0x101c33af8 <__Z24ED_mesh_knife_modal_typePK14wmOperatorType+0x58>
101c33aa4:     	ldrh	w8, [x0, #0xe4]
101c33aa8:     	tbnz	w8, #0x3, 0x101c33adc <__Z24ED_mesh_knife_modal_typePK14wmOperatorType+0x3c>
101c33aac:     	ldr	x8, [x0, #0xa0]
101c33ab0:     	cbnz	x8, 0x101c33adc <__Z24ED_mesh_knife_modal_typePK14wmOperatorType+0x3c>
101c33ab4:     	ldr	x8, [x0, #0x38]
101c33ab8:     	adrp	x9, 0x101c33000 <__ZL29edbm_face_split_by_edges_execP8bContextP10wmOperator+0x948>
101c33abc:     	add	x9, x9, #0xafc
101c33ac0:     	cmp	x8, x9
101c33ac4:     	b.ne	0x101c33adc <__Z24ED_mesh_knife_modal_typePK14wmOperatorType+0x3c>
101c33ac8:     	ldr	x8, [x0, #0x48]
101c33acc:     	adrp	x9, 0x101c33000 <__ZL29edbm_face_split_by_edges_execP8bContextP10wmOperator+0x948>
101c33ad0:     	add	x9, x9, #0xdf4
101c33ad4:     	cmp	x8, x9
101c33ad8:     	b.eq	0x101c33ae4 <__Z24ED_mesh_knife_modal_typePK14wmOperatorType+0x44>
101c33adc:     	mov	w0, #0x0                ; =0
101c33ae0:     	ret
101c33ae4:     	ldr	x8, [x0, #0x40]
101c33ae8:     	adrp	x9, 0x101c34000 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x20c>
101c33aec:     	add	x9, x9, #0x5fc
101c33af0:     	cmp	x8, x9
101c33af4:     	cset	w0, eq
101c33af8:     	ret
