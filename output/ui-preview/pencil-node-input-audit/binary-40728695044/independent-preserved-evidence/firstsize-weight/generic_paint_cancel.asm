
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101dc12f8 <__ZN7blender2ed12sculpt_paint19paint_stroke_cancelEP8bContextP10wmOperatorPNS1_11PaintStrokeE>:
101dc12f8:     	stp	x20, x19, [sp, #-0x20]!
101dc12fc:     	stp	x29, x30, [sp, #0x10]
101dc1300:     	add	x29, sp, #0x10
101dc1304:     	mov	x19, x2
101dc1308:     	mov	x20, x0
101dc130c:     	adrp	x8, 0x106d8c000 <_build_commit_date>
101dc1310:     	add	x8, x8, #0x28
101dc1314:     	ldrh	w8, [x8, #0xc28]
101dc1318:     	cmp	w8, #0x377
101dc131c:     	b.ne	0x101dc132c <__ZN7blender2ed12sculpt_paint19paint_stroke_cancelEP8bContextP10wmOperatorPNS1_11PaintStrokeE+0x34>
101dc1320:     	mov	x0, x20
101dc1324:     	mov	x1, #0x0                ; =0
101dc1328:     	bl	0x101622794 <__Z24ED_workspace_status_textP8bContextPKc>
101dc132c:     	ldp	x8, x9, [x19, #0x90]
101dc1330:     	ldr	x8, [x8, #0xd0]
101dc1334:     	ldrb	w10, [x9, #0x209]
101dc1338:     	tbnz	w10, #0x1, 0x101dc1344 <__ZN7blender2ed12sculpt_paint19paint_stroke_cancelEP8bContextP10wmOperatorPNS1_11PaintStrokeE+0x4c>
101dc133c:     	str	wzr, [x8, #0x30]
101dc1340:     	ldr	x9, [x19, #0x98]
101dc1344:     	ldrb	w9, [x9, #0x2e1]
101dc1348:     	tbnz	w9, #0x1, 0x101dc1350 <__ZN7blender2ed12sculpt_paint19paint_stroke_cancelEP8bContextP10wmOperatorPNS1_11PaintStrokeE+0x58>
101dc134c:     	str	wzr, [x8, #0x34]
101dc1350:     	ldrb	w8, [x19, #0x3dc]
101dc1354:     	cmp	w8, #0x1
101dc1358:     	b.ne	0x101dc1388 <__ZN7blender2ed12sculpt_paint19paint_stroke_cancelEP8bContextP10wmOperatorPNS1_11PaintStrokeE+0x90>
101dc135c:     	ldr	x8, [x19, #0x438]
101dc1360:     	cbz	x8, 0x101dc1374 <__ZN7blender2ed12sculpt_paint19paint_stroke_cancelEP8bContextP10wmOperatorPNS1_11PaintStrokeE+0x7c>
101dc1364:     	mov	x0, x20
101dc1368:     	mov	x1, x19
101dc136c:     	mov	w2, #0x1                ; =1
101dc1370:     	blr	x8
101dc1374:     	ldr	x8, [x19, #0x440]
101dc1378:     	cbz	x8, 0x101dc1388 <__ZN7blender2ed12sculpt_paint19paint_stroke_cancelEP8bContextP10wmOperatorPNS1_11PaintStrokeE+0x90>
101dc137c:     	mov	x0, x20
101dc1380:     	mov	x1, x19
101dc1384:     	blr	x8
101dc1388:     	mov	x0, x20
101dc138c:     	mov	x2, x19
101dc1390:     	ldp	x29, x30, [sp, #0x10]
101dc1394:     	ldp	x20, x19, [sp], #0x20
101dc1398:     	b	0x101dbfa5c <__ZN7blender2ed12sculpt_paint17paint_stroke_freeEP8bContextP10wmOperatorPNS1_11PaintStrokeE>
