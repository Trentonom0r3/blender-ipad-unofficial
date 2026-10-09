
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37902275601\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101db6f24 <__ZL13wpaint_cancelP8bContextP10wmOperator>:
101db6f24:     	stp	x22, x21, [sp, #-0x30]!
101db6f28:     	stp	x20, x19, [sp, #0x10]
101db6f2c:     	stp	x29, x30, [sp, #0x20]
101db6f30:     	add	x29, sp, #0x20
101db6f34:     	mov	x19, x1
101db6f38:     	mov	x20, x0
101db6f3c:     	bl	0x1000b532c <__Z22CTX_data_active_objectPK8bContext>
101db6f40:     	mov	x21, x0
101db6f44:     	ldr	x8, [x0, #0x1a8]
101db6f48:     	ldr	x0, [x8, #0x150]
101db6f4c:     	cbz	x0, 0x101db6f6c <__ZL13wpaint_cancelP8bContextP10wmOperator+0x48>
101db6f50:     	bl	0x101dc4fcc <__ZN7blender2ed12sculpt_paint11StrokeCacheD1Ev>
101db6f54:     	adrp	x8, 0x106633000 <__ZN7blender3gpu5debug3LOGE+0x10>
101db6f58:     	add	x8, x8, #0x5d0
101db6f5c:     	ldr	x8, [x8]
101db6f60:     	mov	w1, #0x1                ; =1
101db6f64:     	blr	x8
101db6f68:     	ldr	x8, [x21, #0x1a8]
101db6f6c:     	str	xzr, [x8, #0x150]
101db6f70:     	ldr	x2, [x19, #0x60]
101db6f74:     	mov	x0, x20
101db6f78:     	mov	x1, x19
101db6f7c:     	ldp	x29, x30, [sp, #0x20]
101db6f80:     	ldp	x20, x19, [sp, #0x10]
101db6f84:     	ldp	x22, x21, [sp], #0x30
101db6f88:     	b	0x101d9ece8 <__ZN7blender2ed12sculpt_paint19paint_stroke_cancelEP8bContextP10wmOperatorPNS1_11PaintStrokeE>
