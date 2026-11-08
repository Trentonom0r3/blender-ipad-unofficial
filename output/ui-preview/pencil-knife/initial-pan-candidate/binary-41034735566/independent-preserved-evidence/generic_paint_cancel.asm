
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101dc1df4 <__ZN7blender2ed12sculpt_paint19paint_stroke_cancelEP8bContextP10wmOperatorPNS1_11PaintStrokeE>:
101dc1df4:     	stp	x20, x19, [sp, #-0x20]!
101dc1df8:     	stp	x29, x30, [sp, #0x10]
101dc1dfc:     	add	x29, sp, #0x10
101dc1e00:     	mov	x19, x2
101dc1e04:     	mov	x20, x0
101dc1e08:     	adrp	x8, 0x106d8c000 <_build_commit_date>
101dc1e0c:     	add	x8, x8, #0x28
101dc1e10:     	ldrh	w8, [x8, #0xc28]
101dc1e14:     	cmp	w8, #0x377
101dc1e18:     	b.ne	0x101dc1e28 <__ZN7blender2ed12sculpt_paint19paint_stroke_cancelEP8bContextP10wmOperatorPNS1_11PaintStrokeE+0x34>
101dc1e1c:     	mov	x0, x20
101dc1e20:     	mov	x1, #0x0                ; =0
101dc1e24:     	bl	0x1016231d4 <__Z24ED_workspace_status_textP8bContextPKc>
101dc1e28:     	ldp	x8, x9, [x19, #0x90]
101dc1e2c:     	ldr	x8, [x8, #0xd0]
101dc1e30:     	ldrb	w10, [x9, #0x209]
101dc1e34:     	tbnz	w10, #0x1, 0x101dc1e40 <__ZN7blender2ed12sculpt_paint19paint_stroke_cancelEP8bContextP10wmOperatorPNS1_11PaintStrokeE+0x4c>
101dc1e38:     	str	wzr, [x8, #0x30]
101dc1e3c:     	ldr	x9, [x19, #0x98]
101dc1e40:     	ldrb	w9, [x9, #0x2e1]
101dc1e44:     	tbnz	w9, #0x1, 0x101dc1e4c <__ZN7blender2ed12sculpt_paint19paint_stroke_cancelEP8bContextP10wmOperatorPNS1_11PaintStrokeE+0x58>
101dc1e48:     	str	wzr, [x8, #0x34]
101dc1e4c:     	ldrb	w8, [x19, #0x3dc]
101dc1e50:     	cmp	w8, #0x1
101dc1e54:     	b.ne	0x101dc1e84 <__ZN7blender2ed12sculpt_paint19paint_stroke_cancelEP8bContextP10wmOperatorPNS1_11PaintStrokeE+0x90>
101dc1e58:     	ldr	x8, [x19, #0x438]
101dc1e5c:     	cbz	x8, 0x101dc1e70 <__ZN7blender2ed12sculpt_paint19paint_stroke_cancelEP8bContextP10wmOperatorPNS1_11PaintStrokeE+0x7c>
101dc1e60:     	mov	x0, x20
101dc1e64:     	mov	x1, x19
101dc1e68:     	mov	w2, #0x1                ; =1
101dc1e6c:     	blr	x8
101dc1e70:     	ldr	x8, [x19, #0x440]
101dc1e74:     	cbz	x8, 0x101dc1e84 <__ZN7blender2ed12sculpt_paint19paint_stroke_cancelEP8bContextP10wmOperatorPNS1_11PaintStrokeE+0x90>
101dc1e78:     	mov	x0, x20
101dc1e7c:     	mov	x1, x19
101dc1e80:     	blr	x8
101dc1e84:     	mov	x0, x20
101dc1e88:     	mov	x2, x19
101dc1e8c:     	ldp	x29, x30, [sp, #0x10]
101dc1e90:     	ldp	x20, x19, [sp], #0x20
101dc1e94:     	b	0x101dc0558 <__ZN7blender2ed12sculpt_paint17paint_stroke_freeEP8bContextP10wmOperatorPNS1_11PaintStrokeE>
