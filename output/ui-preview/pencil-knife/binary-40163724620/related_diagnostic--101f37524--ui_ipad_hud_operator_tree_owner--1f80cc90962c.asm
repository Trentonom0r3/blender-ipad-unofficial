
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f37524 <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii>:
101f37524:     	mov	x8, x0
101f37528:     	mov	x0, #0x0                ; =0
101f3752c:     	ldr	w9, [x2]
101f37530:     	sub	w10, w9, #0x1
101f37534:     	str	w10, [x2]
101f37538:     	cmp	w3, #0x8
101f3753c:     	b.gt	0x101f375f0 <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0xcc>
101f37540:     	cmp	w9, #0x1
101f37544:     	b.lt	0x101f375f0 <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0xcc>
101f37548:     	stp	x24, x23, [sp, #-0x40]!
101f3754c:     	stp	x22, x21, [sp, #0x10]
101f37550:     	stp	x20, x19, [sp, #0x20]
101f37554:     	stp	x29, x30, [sp, #0x30]
101f37558:     	add	x29, sp, #0x30
101f3755c:     	ldr	x21, [x8, #0x58]
101f37560:     	cbz	x21, 0x101f375dc <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0xb8>
101f37564:     	mov	x23, x8
101f37568:     	mov	x20, x1
101f3756c:     	mov	x19, x2
101f37570:     	mov	x22, x3
101f37574:     	bl	0x100b7bba4 <__Z31WM_operatortypes_registered_getv>
101f37578:     	cbz	x1, 0x101f375dc <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0xb8>
101f3757c:     	lsl	x10, x1, #3
101f37580:     	mov	x9, x20
101f37584:     	mov	x8, x23
101f37588:     	ldr	x12, [x0]
101f3758c:     	cmp	x12, x21
101f37590:     	b.eq	0x101f375a4 <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0x80>
101f37594:     	add	x0, x0, #0x8
101f37598:     	subs	x10, x10, #0x8
101f3759c:     	b.ne	0x101f37588 <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0x64>
101f375a0:     	b	0x101f375dc <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0xb8>
101f375a4:     	ldr	x11, [x8, #0x70]
101f375a8:     	cbz	x11, 0x101f375dc <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0xb8>
101f375ac:     	ldr	x10, [x8, #0x50]
101f375b0:     	cbz	x10, 0x101f375dc <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0xb8>
101f375b4:     	ldrb	w13, [x10, #0x10]
101f375b8:     	cmp	w13, #0x6
101f375bc:     	b.ne	0x101f375dc <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0xb8>
101f375c0:     	ldr	x13, [x11, #0x8]
101f375c4:     	ldr	x12, [x12, #0x88]
101f375c8:     	cmp	x13, x12
101f375cc:     	b.ne	0x101f375dc <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0xb8>
101f375d0:     	ldr	x12, [x11, #0x10]
101f375d4:     	cmp	x12, x10
101f375d8:     	b.eq	0x101f375f4 <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0xd0>
101f375dc:     	mov	x0, #0x0                ; =0
101f375e0:     	ldp	x29, x30, [sp, #0x30]
101f375e4:     	ldp	x20, x19, [sp, #0x20]
101f375e8:     	ldp	x22, x21, [sp, #0x10]
101f375ec:     	ldp	x24, x23, [sp], #0x40
101f375f0:     	ret
101f375f4:     	ldr	x12, [x9, #0x1f8]
101f375f8:     	ldr	x11, [x11]
101f375fc:     	cmp	x12, x11
101f37600:     	b.ne	0x101f3761c <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0xf8>
101f37604:     	ldr	x11, [x9, #0x200]
101f37608:     	cmp	x11, x13
101f3760c:     	b.ne	0x101f3761c <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0xf8>
101f37610:     	ldr	x9, [x9, #0x208]
101f37614:     	cmp	x9, x10
101f37618:     	b.eq	0x101f37644 <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0x120>
101f3761c:     	add	x21, x8, #0x80
101f37620:     	ldr	x21, [x21]
101f37624:     	cbz	x21, 0x101f375dc <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0xb8>
101f37628:     	add	w3, w22, #0x1
101f3762c:     	mov	x0, x21
101f37630:     	mov	x1, x20
101f37634:     	mov	x2, x19
101f37638:     	bl	0x101f37524 <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii>
101f3763c:     	cbz	x0, 0x101f37620 <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0xfc>
101f37640:     	b	0x101f375e0 <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0xbc>
101f37644:     	mov	x0, x8
101f37648:     	b	0x101f375e0 <__ZL31ui_ipad_hud_operator_tree_ownerP10wmOperatorPK5uiButRii+0xbc>
