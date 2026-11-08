
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101dc0558 <__ZN7blender2ed12sculpt_paint17paint_stroke_freeEP8bContextP10wmOperatorPNS1_11PaintStrokeE>:
101dc0558:     	stp	x22, x21, [sp, #-0x30]!
101dc055c:     	stp	x20, x19, [sp, #0x10]
101dc0560:     	stp	x29, x30, [sp, #0x20]
101dc0564:     	add	x29, sp, #0x20
101dc0568:     	mov	x19, x2
101dc056c:     	mov	x20, x0
101dc0570:     	bl	0x1000b44e8 <__Z20CTX_wm_region_view3dPK8bContext>
101dc0574:     	cbz	x0, 0x101dc0584 <__ZN7blender2ed12sculpt_paint17paint_stroke_freeEP8bContextP10wmOperatorPNS1_11PaintStrokeE+0x2c>
101dc0578:     	ldrh	w8, [x0, #0x37a]
101dc057c:     	and	w8, w8, #0xffffffdf
101dc0580:     	strh	w8, [x0, #0x37a]
101dc0584:     	mov	w0, #0x0                ; =0
101dc0588:     	bl	0x1003714d4 <__Z30BKE_paint_set_overlay_override13eOverlayFlags>
101dc058c:     	cbz	x19, 0x101dc0614 <__ZN7blender2ed12sculpt_paint17paint_stroke_freeEP8bContextP10wmOperatorPNS1_11PaintStrokeE+0xbc>
101dc0590:     	ldr	x8, [x19, #0x90]
101dc0594:     	ldr	x8, [x8, #0xd0]
101dc0598:     	strb	wzr, [x8, #0x38]
101dc059c:     	strb	wzr, [x8, #0x45]
101dc05a0:     	ldr	x8, [x19, #0x10]
101dc05a4:     	cbz	x8, 0x101dc05cc <__ZN7blender2ed12sculpt_paint17paint_stroke_freeEP8bContextP10wmOperatorPNS1_11PaintStrokeE+0x74>
101dc05a8:     	mov	x0, x20
101dc05ac:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101dc05b0:     	mov	x21, x0
101dc05b4:     	mov	x0, x20
101dc05b8:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101dc05bc:     	mov	x1, x0
101dc05c0:     	ldr	x2, [x19, #0x10]
101dc05c4:     	mov	x0, x21
101dc05c8:     	bl	0x100b95b24 <__Z21WM_event_timer_removeP15wmWindowManagerP8wmWindowP7wmTimer>
101dc05cc:     	ldr	x0, [x19, #0x8]
101dc05d0:     	cbz	x0, 0x101dc05d8 <__ZN7blender2ed12sculpt_paint17paint_stroke_freeEP8bContextP10wmOperatorPNS1_11PaintStrokeE+0x80>
101dc05d4:     	bl	0x100b864bc <__Z19WM_paint_cursor_endP13wmPaintCursor>
101dc05d8:     	ldr	x0, [x19]
101dc05dc:     	str	xzr, [x19]
101dc05e0:     	cbz	x0, 0x101dc05f0 <__ZN7blender2ed12sculpt_paint17paint_stroke_freeEP8bContextP10wmOperatorPNS1_11PaintStrokeE+0x98>
101dc05e4:     	ldr	x8, [x0]
101dc05e8:     	ldr	x8, [x8, #0x8]
101dc05ec:     	blr	x8
101dc05f0:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
101dc05f4:     	add	x8, x8, #0x710
101dc05f8:     	ldr	x2, [x8]
101dc05fc:     	mov	x0, x19
101dc0600:     	mov	w1, #0x1                ; =1
101dc0604:     	ldp	x29, x30, [sp, #0x20]
101dc0608:     	ldp	x20, x19, [sp, #0x10]
101dc060c:     	ldp	x22, x21, [sp], #0x30
101dc0610:     	br	x2
101dc0614:     	ldp	x29, x30, [sp, #0x20]
101dc0618:     	ldp	x20, x19, [sp, #0x10]
101dc061c:     	ldp	x22, x21, [sp], #0x30
101dc0620:     	ret
