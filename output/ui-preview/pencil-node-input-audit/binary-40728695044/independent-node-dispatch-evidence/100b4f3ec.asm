
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b4f3ec <__Z21WM_operator_name_callP8bContextPKcN7blender2wm13OpCallContextEP10PointerRNAPK7wmEvent>:
100b4f3ec:     	stp	x22, x21, [sp, #-0x30]!
100b4f3f0:     	stp	x20, x19, [sp, #0x10]
100b4f3f4:     	stp	x29, x30, [sp, #0x20]
100b4f3f8:     	add	x29, sp, #0x20
100b4f3fc:     	mov	x19, x4
100b4f400:     	mov	x21, x3
100b4f404:     	mov	x20, x2
100b4f408:     	mov	x22, x0
100b4f40c:     	mov	x0, x1
100b4f410:     	mov	w1, #0x0                ; =0
100b4f414:     	bl	0x100b7d198 <__Z20WM_operatortype_findPKcb>
100b4f418:     	cbz	x0, 0x100b4f448 <__Z21WM_operator_name_callP8bContextPKcN7blender2wm13OpCallContextEP10PointerRNAPK7wmEvent+0x5c>
100b4f41c:     	mov	x1, x0
100b4f420:     	mov	x0, x22
100b4f424:     	mov	x2, x21
100b4f428:     	mov	x3, #0x0                ; =0
100b4f42c:     	mov	x4, x20
100b4f430:     	mov	w5, #0x0                ; =0
100b4f434:     	mov	x6, x19
100b4f438:     	ldp	x29, x30, [sp, #0x20]
100b4f43c:     	ldp	x20, x19, [sp, #0x10]
100b4f440:     	ldp	x22, x21, [sp], #0x30
100b4f444:     	b	0x100b4ebdc <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent>
100b4f448:     	ldp	x29, x30, [sp, #0x20]
100b4f44c:     	ldp	x20, x19, [sp, #0x10]
100b4f450:     	ldp	x22, x21, [sp], #0x30
100b4f454:     	ret
