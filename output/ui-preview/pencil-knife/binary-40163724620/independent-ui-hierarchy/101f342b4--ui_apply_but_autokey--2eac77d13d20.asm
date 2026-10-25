
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f342b4 <__ZL20ui_apply_but_autokeyP8bContextP5uiBut>:
101f342b4:     	sub	sp, sp, #0x70
101f342b8:     	stp	x22, x21, [sp, #0x40]
101f342bc:     	stp	x20, x19, [sp, #0x50]
101f342c0:     	stp	x29, x30, [sp, #0x60]
101f342c4:     	add	x29, sp, #0x60
101f342c8:     	mov	x20, x1
101f342cc:     	mov	x19, x0
101f342d0:     	mov	x0, x1
101f342d4:     	bl	0x101f05a30 <__Z26ui_ipad_numbers_but_rebindP5uiBut>
101f342d8:     	cbz	w0, 0x101f342e8 <__ZL20ui_apply_but_autokeyP8bContextP5uiBut+0x34>
101f342dc:     	ldr	x8, [x20, #0x420]
101f342e0:     	ldr	x9, [x8, #0x418]
101f342e4:     	cbz	x9, 0x101f342fc <__ZL20ui_apply_but_autokeyP8bContextP5uiBut+0x48>
101f342e8:     	ldp	x29, x30, [sp, #0x60]
101f342ec:     	ldp	x20, x19, [sp, #0x50]
101f342f0:     	ldp	x22, x21, [sp, #0x40]
101f342f4:     	add	sp, sp, #0x70
101f342f8:     	ret
101f342fc:     	ldrb	w9, [x20, #0x21]
101f34300:     	cmp	w9, #0x1
101f34304:     	b.ne	0x101f34318 <__ZL20ui_apply_but_autokeyP8bContextP5uiBut+0x64>
101f34308:     	ldr	x9, [x20, #0x258]
101f3430c:     	cbnz	x9, 0x101f34318 <__ZL20ui_apply_but_autokeyP8bContextP5uiBut+0x64>
101f34310:     	ldr	x9, [x20, #0x208]
101f34314:     	cbz	x9, 0x101f343d4 <__ZL20ui_apply_but_autokeyP8bContextP5uiBut+0x120>
101f34318:     	mov	x0, x19
101f3431c:     	bl	0x1000b4e44 <__Z14CTX_data_scenePK8bContext>
101f34320:     	mov	x21, x0
101f34324:     	bl	0x1003d1c6c <__Z19BKE_scene_frame_getPK5Scene>
101f34328:     	mov	x0, x19
101f3432c:     	mov	x1, x20
101f34330:     	mov	x2, x21
101f34334:     	bl	0x101f2123c <__Z19ui_but_anim_autokeyP8bContextP5uiButP5Scenef>
101f34338:     	ldr	x0, [x20, #0x258]
101f3433c:     	cbz	x0, 0x101f342e8 <__ZL20ui_apply_but_autokeyP8bContextP5uiBut+0x34>
101f34340:     	bl	0x101250cd8 <__Z20RNA_property_subtypeP11PropertyRNA>
101f34344:     	cmp	w0, #0x6
101f34348:     	b.eq	0x101f342e8 <__ZL20ui_apply_but_autokeyP8bContextP5uiBut+0x34>
101f3434c:     	ldr	x2, [x20, #0x258]
101f34350:     	ldr	w3, [x20, #0x260]
101f34354:     	mov	x8, sp
101f34358:     	add	x1, x20, #0x1f8
101f3435c:     	mov	x0, x19
101f34360:     	bl	0x100b8047c <__Z23WM_prop_pystring_assignP8bContextP10PointerRNAP11PropertyRNAi>
101f34364:     	ldrb	w8, [sp, #0x18]
101f34368:     	tbz	w8, #0x0, 0x101f342e8 <__ZL20ui_apply_but_autokeyP8bContextP5uiBut+0x34>
101f3436c:     	ldr	q0, [sp]
101f34370:     	str	q0, [sp, #0x20]
101f34374:     	ldr	x8, [sp, #0x10]
101f34378:     	str	x8, [sp, #0x30]
101f3437c:     	mov	w8, #0x1                ; =1
101f34380:     	strb	w8, [sp, #0x38]
101f34384:     	mov	x0, x19
101f34388:     	bl	0x1000b4484 <__Z14CTX_wm_reportsPK8bContext>
101f3438c:     	ldrsb	w8, [sp, #0x37]
101f34390:     	ldr	x9, [sp, #0x20]
101f34394:     	cmp	w8, #0x0
101f34398:     	add	x8, sp, #0x20
101f3439c:     	csel	x2, x9, x8, lt
101f343a0:     	mov	w1, #0x8                ; =8
101f343a4:     	bl	0x1003ca47c <__Z10BKE_reportP10ReportList11eReportTypePKc>
101f343a8:     	mov	x0, x19
101f343ac:     	mov	w1, #0x10020000         ; =268566528
101f343b0:     	mov	x2, #0x0                ; =0
101f343b4:     	bl	0x100b4d83c <__Z21WM_event_add_notifierPK8bContextjPv>
101f343b8:     	ldrb	w8, [sp, #0x38]
101f343bc:     	tbz	w8, #0x0, 0x101f342e8 <__ZL20ui_apply_but_autokeyP8bContextP5uiBut+0x34>
101f343c0:     	ldrsb	w8, [sp, #0x37]
101f343c4:     	tbz	w8, #0x1f, 0x101f342e8 <__ZL20ui_apply_but_autokeyP8bContextP5uiBut+0x34>
101f343c8:     	ldr	x0, [sp, #0x20]
101f343cc:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f343d0:     	b	0x101f342e8 <__ZL20ui_apply_but_autokeyP8bContextP5uiBut+0x34>
101f343d4:     	ldr	x8, [x8, #0x50]
101f343d8:     	cbz	x8, 0x101f34318 <__ZL20ui_apply_but_autokeyP8bContextP5uiBut+0x64>
101f343dc:     	ldr	x0, [x8, #0x10]
101f343e0:     	bl	0x101f8cc54 <__Z28UI_ipad_knife_hud_panel_typePK9PanelType>
101f343e4:     	tbnz	w0, #0x0, 0x101f342e8 <__ZL20ui_apply_but_autokeyP8bContextP5uiBut+0x34>
101f343e8:     	b	0x101f34318 <__ZL20ui_apply_but_autokeyP8bContextP5uiBut+0x64>
101f343ec:     	mov	x19, x0
101f343f0:     	ldrb	w8, [sp, #0x38]
101f343f4:     	cmp	w8, #0x1
101f343f8:     	b.ne	0x101f3440c <__ZL20ui_apply_but_autokeyP8bContextP5uiBut+0x158>
101f343fc:     	ldrsb	w8, [sp, #0x37]
101f34400:     	tbz	w8, #0x1f, 0x101f3440c <__ZL20ui_apply_but_autokeyP8bContextP5uiBut+0x158>
101f34404:     	ldr	x0, [sp, #0x20]
101f34408:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
101f3440c:     	mov	x0, x19
101f34410:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
