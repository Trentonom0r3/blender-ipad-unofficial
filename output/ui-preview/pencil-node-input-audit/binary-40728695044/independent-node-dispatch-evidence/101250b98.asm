
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101250b98 <__Z27RNA_pointer_create_discreteP2IDP9StructRNAPv>:
101250b98:     	stp	x20, x19, [sp, #-0x20]!
101250b9c:     	stp	x29, x30, [sp, #0x10]
101250ba0:     	add	x29, sp, #0x10
101250ba4:     	mov	x19, x8
101250ba8:     	stp	x0, x1, [x8], #0x30
101250bac:     	stp	x2, x8, [x19, #0x10]
101250bb0:     	add	x9, x19, #0x50
101250bb4:     	stp	x8, x9, [x19, #0x20]
101250bb8:     	cbz	x2, 0x101250be4 <__Z27RNA_pointer_create_discreteP2IDP9StructRNAPv+0x4c>
101250bbc:     	ldr	x8, [x1, #0x90]
101250bc0:     	cbz	x8, 0x101250be4 <__Z27RNA_pointer_create_discreteP2IDP9StructRNAPv+0x4c>
101250bc4:     	mov	x0, x19
101250bc8:     	blr	x8
101250bcc:     	ldr	x8, [x19, #0x8]
101250bd0:     	cmp	x0, x8
101250bd4:     	b.eq	0x101250be4 <__Z27RNA_pointer_create_discreteP2IDP9StructRNAPv+0x4c>
101250bd8:     	str	x0, [x19, #0x8]
101250bdc:     	ldr	x8, [x0, #0x90]
101250be0:     	cbnz	x8, 0x101250bc4 <__Z27RNA_pointer_create_discreteP2IDP9StructRNAPv+0x2c>
101250be4:     	ldp	x29, x30, [sp, #0x10]
101250be8:     	ldp	x20, x19, [sp], #0x20
101250bec:     	ret
101250bf0:     	mov	x20, x0
101250bf4:     	mov	x0, x19
101250bf8:     	bl	0x100013e10 <__ZN7blender2ed12sculpt_paint18FillToolTargetInfoD1Ev>
101250bfc:     	mov	x0, x20
101250c00:     	bl	0x104b72c1c <_zlibVersion+0x104b72c1c>
