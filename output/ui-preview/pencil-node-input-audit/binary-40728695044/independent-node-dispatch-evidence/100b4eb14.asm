
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b4eb14 <__Z16WM_operator_pollP8bContextP14wmOperatorType>:
100b4eb14:     	stp	x22, x21, [sp, #-0x30]!
100b4eb18:     	stp	x20, x19, [sp, #0x10]
100b4eb1c:     	stp	x29, x30, [sp, #0x20]
100b4eb20:     	add	x29, sp, #0x20
100b4eb24:     	mov	x20, x1
100b4eb28:     	mov	x19, x0
100b4eb2c:     	add	x21, x1, #0xa0
100b4eb30:     	ldr	x21, [x21]
100b4eb34:     	cbz	x21, 0x100b4eb68 <__Z16WM_operator_pollP8bContextP14wmOperatorType+0x54>
100b4eb38:     	add	x0, x21, #0x10
100b4eb3c:     	mov	w1, #0x0                ; =0
100b4eb40:     	bl	0x100b7d198 <__Z20WM_operatortype_findPKcb>
100b4eb44:     	mov	x1, x0
100b4eb48:     	mov	x0, x19
100b4eb4c:     	bl	0x100b4eb14 <__Z16WM_operator_pollP8bContextP14wmOperatorType>
100b4eb50:     	tbnz	w0, #0x0, 0x100b4eb30 <__Z16WM_operator_pollP8bContextP14wmOperatorType+0x1c>
100b4eb54:     	mov	w0, #0x0                ; =0
100b4eb58:     	ldp	x29, x30, [sp, #0x20]
100b4eb5c:     	ldp	x20, x19, [sp, #0x10]
100b4eb60:     	ldp	x22, x21, [sp], #0x30
100b4eb64:     	ret
100b4eb68:     	ldr	x2, [x20, #0xb8]
100b4eb6c:     	cbz	x2, 0x100b4eb88 <__Z16WM_operator_pollP8bContextP14wmOperatorType+0x74>
100b4eb70:     	mov	x0, x19
100b4eb74:     	mov	x1, x20
100b4eb78:     	ldp	x29, x30, [sp, #0x20]
100b4eb7c:     	ldp	x20, x19, [sp, #0x10]
100b4eb80:     	ldp	x22, x21, [sp], #0x30
100b4eb84:     	br	x2
100b4eb88:     	ldr	x1, [x20, #0x50]
100b4eb8c:     	cbz	x1, 0x100b4eba4 <__Z16WM_operator_pollP8bContextP14wmOperatorType+0x90>
100b4eb90:     	mov	x0, x19
100b4eb94:     	ldp	x29, x30, [sp, #0x20]
100b4eb98:     	ldp	x20, x19, [sp, #0x10]
100b4eb9c:     	ldp	x22, x21, [sp], #0x30
100b4eba0:     	br	x1
100b4eba4:     	mov	w0, #0x1                ; =1
100b4eba8:     	b	0x100b4eb58 <__Z16WM_operator_pollP8bContextP14wmOperatorType+0x44>
