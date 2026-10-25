
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f344e8 <__Z28UI_ipad_knife_hud_ui_handlerPK14wmEventHandlerPK7ScrAreaPK7ARegion>:
101f344e8:     	stp	x20, x19, [sp, #-0x20]!
101f344ec:     	stp	x29, x30, [sp, #0x10]
101f344f0:     	add	x29, sp, #0x10
101f344f4:     	cbz	x0, 0x101f34550 <__Z28UI_ipad_knife_hud_ui_handlerPK14wmEventHandlerPK7ScrAreaPK7ARegion+0x68>
101f344f8:     	cbz	x2, 0x101f34550 <__Z28UI_ipad_knife_hud_ui_handlerPK14wmEventHandlerPK7ScrAreaPK7ARegion+0x68>
101f344fc:     	ldr	w8, [x0, #0x10]
101f34500:     	cmp	w8, #0x2
101f34504:     	b.ne	0x101f34550 <__Z28UI_ipad_knife_hud_ui_handlerPK14wmEventHandlerPK7ScrAreaPK7ARegion+0x68>
101f34508:     	ldrh	w8, [x2, #0xc0]
101f3450c:     	cmp	w8, #0x8
101f34510:     	b.ne	0x101f34550 <__Z28UI_ipad_knife_hud_ui_handlerPK14wmEventHandlerPK7ScrAreaPK7ARegion+0x68>
101f34514:     	ldr	x8, [x0, #0x20]
101f34518:     	adrp	x9, 0x101f34000 <__ZL12ui_apply_butP8bContextP7uiBlockP5uiButP18uiHandleButtonDatab+0x208>
101f3451c:     	add	x9, x9, #0x5a4
101f34520:     	cmp	x8, x9
101f34524:     	b.ne	0x101f34550 <__Z28UI_ipad_knife_hud_ui_handlerPK14wmEventHandlerPK7ScrAreaPK7ARegion+0x68>
101f34528:     	ldr	x8, [x0, #0x28]
101f3452c:     	cbnz	x8, 0x101f34550 <__Z28UI_ipad_knife_hud_ui_handlerPK14wmEventHandlerPK7ScrAreaPK7ARegion+0x68>
101f34530:     	ldr	x8, [x0, #0x38]
101f34534:     	cmp	x8, x1
101f34538:     	b.ne	0x101f34550 <__Z28UI_ipad_knife_hud_ui_handlerPK14wmEventHandlerPK7ScrAreaPK7ARegion+0x68>
101f3453c:     	ldr	x8, [x0, #0x40]
101f34540:     	cmp	x8, x2
101f34544:     	b.ne	0x101f34550 <__Z28UI_ipad_knife_hud_ui_handlerPK14wmEventHandlerPK7ScrAreaPK7ARegion+0x68>
101f34548:     	ldr	x8, [x0, #0x48]
101f3454c:     	cbz	x8, 0x101f34560 <__Z28UI_ipad_knife_hud_ui_handlerPK14wmEventHandlerPK7ScrAreaPK7ARegion+0x78>
101f34550:     	mov	w0, #0x0                ; =0
101f34554:     	ldp	x29, x30, [sp, #0x10]
101f34558:     	ldp	x20, x19, [sp], #0x20
101f3455c:     	ret
101f34560:     	mov	x19, x0
101f34564:     	mov	x0, x2
101f34568:     	bl	0x101f73934 <__Z25ui_region_find_active_butP7ARegion>
101f3456c:     	cbz	x0, 0x101f34550 <__Z28UI_ipad_knife_hud_ui_handlerPK14wmEventHandlerPK7ScrAreaPK7ARegion+0x68>
101f34570:     	ldr	x9, [x0, #0x3d0]
101f34574:     	cbz	x9, 0x101f34550 <__Z28UI_ipad_knife_hud_ui_handlerPK14wmEventHandlerPK7ScrAreaPK7ARegion+0x68>
101f34578:     	ldr	x8, [x19, #0x30]
101f3457c:     	cmp	x8, x9
101f34580:     	b.ne	0x101f34550 <__Z28UI_ipad_knife_hud_ui_handlerPK14wmEventHandlerPK7ScrAreaPK7ARegion+0x68>
101f34584:     	ldr	x8, [x0, #0x420]
101f34588:     	cbz	x8, 0x101f34550 <__Z28UI_ipad_knife_hud_ui_handlerPK14wmEventHandlerPK7ScrAreaPK7ARegion+0x68>
101f3458c:     	ldr	x8, [x8, #0x50]
101f34590:     	cbz	x8, 0x101f34550 <__Z28UI_ipad_knife_hud_ui_handlerPK14wmEventHandlerPK7ScrAreaPK7ARegion+0x68>
101f34594:     	ldr	x0, [x8, #0x10]
101f34598:     	ldp	x29, x30, [sp, #0x10]
101f3459c:     	ldp	x20, x19, [sp], #0x20
101f345a0:     	b	0x101f8cc54 <__Z28UI_ipad_knife_hud_panel_typePK9PanelType>
