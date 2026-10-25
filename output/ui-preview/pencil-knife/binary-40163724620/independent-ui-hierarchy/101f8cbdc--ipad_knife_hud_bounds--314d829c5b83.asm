
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f8cbdc <__ZL21ipad_knife_hud_boundsPK7ARegion>:
101f8cbdc:     	sub	sp, sp, #0x20
101f8cbe0:     	stp	x29, x30, [sp, #0x10]
101f8cbe4:     	add	x29, sp, #0x10
101f8cbe8:     	ldr	x8, [x0, #0x128]
101f8cbec:     	ldr	q0, [x8, #0xa0]
101f8cbf0:     	str	q0, [sp]
101f8cbf4:     	ldr	w1, [x0, #0xa8]
101f8cbf8:     	ldr	w2, [x0, #0xb0]
101f8cbfc:     	mov	x0, sp
101f8cc00:     	bl	0x1007fd304 <__Z18BLI_rcti_translateP4rctiii>
101f8cc04:     	adrp	x8, 0x106d88000 <_build_commit_date>
101f8cc08:     	add	x8, x8, #0xe08
101f8cc0c:     	mov	w9, #0x2912             ; =10514
101f8cc10:     	ldrsh	w8, [x8, x9]
101f8cc14:     	ubfx	w9, w8, #29, #2
101f8cc18:     	add	w8, w8, w9
101f8cc1c:     	sbfx	w8, w8, #2, #14
101f8cc20:     	cmp	w8, #0x1
101f8cc24:     	csinc	w8, w8, wzr, gt
101f8cc28:     	ldr	q0, [sp]
101f8cc2c:     	dup.4s	v1, w8
101f8cc30:     	add.4s	v2, v0, v1
101f8cc34:     	sub.4s	v0, v0, v1
101f8cc38:     	rev64.4s	v1, v2
101f8cc3c:     	trn2.4s	v0, v1, v0
101f8cc40:     	str	q0, [sp]
101f8cc44:     	ldp	x0, x1, [sp]
101f8cc48:     	ldp	x29, x30, [sp, #0x10]
101f8cc4c:     	add	sp, sp, #0x20
101f8cc50:     	ret
