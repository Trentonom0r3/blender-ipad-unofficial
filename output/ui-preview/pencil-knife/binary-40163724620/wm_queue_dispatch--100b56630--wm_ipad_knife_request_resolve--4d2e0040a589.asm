
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b56630 <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion>:
100b56630:     	str	xzr, [x3]
100b56634:     	str	xzr, [x4]
100b56638:     	str	xzr, [x5]
100b5663c:     	cbz	x2, 0x100b5670c <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion+0xdc>
100b56640:     	ldrh	w8, [x2, #0x10]
100b56644:     	cmp	w8, #0x208
100b56648:     	b.ne	0x100b5670c <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion+0xdc>
100b5664c:     	ldrh	w8, [x2, #0x80]
100b56650:     	cmp	w8, #0x7
100b56654:     	b.ne	0x100b5670c <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion+0xdc>
100b56658:     	ldr	x8, [x2, #0x88]
100b5665c:     	cbz	x8, 0x100b5670c <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion+0xdc>
100b56660:     	ldrh	w9, [x2, #0x82]
100b56664:     	cbz	w9, 0x100b5670c <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion+0xdc>
100b56668:     	sub	sp, sp, #0x100
100b5666c:     	stp	x24, x23, [sp, #0xc0]
100b56670:     	stp	x22, x21, [sp, #0xd0]
100b56674:     	stp	x20, x19, [sp, #0xe0]
100b56678:     	stp	x29, x30, [sp, #0xf0]
100b5667c:     	add	x29, sp, #0xf0
100b56680:     	ldp	q0, q1, [x8, #0x80]
100b56684:     	stp	q0, q1, [sp, #0x80]
100b56688:     	ldp	q0, q1, [x8, #0xa0]
100b5668c:     	stp	q0, q1, [sp, #0xa0]
100b56690:     	ldp	q0, q1, [x8, #0x40]
100b56694:     	stp	q0, q1, [sp, #0x40]
100b56698:     	ldp	q0, q1, [x8, #0x60]
100b5669c:     	stp	q0, q1, [sp, #0x60]
100b566a0:     	ldp	q0, q1, [x8]
100b566a4:     	stp	q0, q1, [sp]
100b566a8:     	ldp	q0, q1, [x8, #0x20]
100b566ac:     	ldrb	w8, [sp, #0xb8]
100b566b0:     	sub	w8, w8, #0x1
100b566b4:     	stp	q0, q1, [sp, #0x20]
100b566b8:     	cmp	w8, #0x1
100b566bc:     	b.hi	0x100b56768 <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion+0x138>
100b566c0:     	mov	x21, x3
100b566c4:     	mov	x22, x4
100b566c8:     	mov	x23, x5
100b566cc:     	mov	x2, sp
100b566d0:     	mov	x20, x1
100b566d4:     	mov	w3, #0x0                ; =0
100b566d8:     	bl	0x100b5099c <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb>
100b566dc:     	cbz	x0, 0x100b5676c <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion+0x13c>
100b566e0:     	mov	x19, x0
100b566e4:     	mov	x0, x20
100b566e8:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b566ec:     	ldr	x8, [x0, #0x1c0]
100b566f0:     	cbz	x8, 0x100b56768 <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion+0x138>
100b566f4:     	ldr	x10, [sp, #0x38]
100b566f8:     	ldr	x12, [sp, #0xa0]
100b566fc:     	mov	x9, x23
100b56700:     	mov	x11, x22
100b56704:     	mov	x13, x21
100b56708:     	b	0x100b5671c <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion+0xec>
100b5670c:     	mov	w0, #0x0                ; =0
100b56710:     	ret
100b56714:     	ldr	x8, [x8]
100b56718:     	cbz	x8, 0x100b56768 <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion+0x138>
100b5671c:     	cmp	x10, x8
100b56720:     	b.ne	0x100b56714 <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion+0xe4>
100b56724:     	ldr	x14, [x20, #0x118]
100b56728:     	cbnz	x14, 0x100b56738 <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion+0x108>
100b5672c:     	b	0x100b56714 <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion+0xe4>
100b56730:     	ldr	x14, [x14]
100b56734:     	cbz	x14, 0x100b56714 <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion+0xe4>
100b56738:     	cmp	x12, x14
100b5673c:     	b.ne	0x100b56730 <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion+0x100>
100b56740:     	ldr	w15, [x14, #0x10]
100b56744:     	cmp	w15, #0x3
100b56748:     	b.ne	0x100b56730 <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion+0x100>
100b5674c:     	ldrb	w15, [x14, #0x14]
100b56750:     	tbnz	w15, #0x7, 0x100b56730 <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion+0x100>
100b56754:     	str	x14, [x13]
100b56758:     	str	x8, [x11]
100b5675c:     	mov	w0, #0x1                ; =1
100b56760:     	str	x19, [x9]
100b56764:     	b	0x100b5676c <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion+0x13c>
100b56768:     	mov	w0, #0x0                ; =0
100b5676c:     	ldp	x29, x30, [sp, #0xf0]
100b56770:     	ldp	x20, x19, [sp, #0xe0]
100b56774:     	ldp	x22, x21, [sp, #0xd0]
100b56778:     	ldp	x24, x23, [sp, #0xc0]
100b5677c:     	add	sp, sp, #0x100
100b56780:     	ret
