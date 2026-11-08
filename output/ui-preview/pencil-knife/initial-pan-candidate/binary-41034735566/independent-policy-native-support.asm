
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001000b4230 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv>:
1000b4230:     	stp	x28, x27, [sp, #-0x40]!
1000b4234:     	stp	x22, x21, [sp, #0x10]
1000b4238:     	stp	x20, x19, [sp, #0x20]
1000b423c:     	stp	x29, x30, [sp, #0x30]
1000b4240:     	add	x29, sp, #0x30
1000b4244:     	sub	sp, sp, #0x240
1000b4248:     	mov	x19, x3
1000b424c:     	adrp	x8, 0x106369000 <_zlibVersion+0x106369000>
1000b4250:     	ldr	x8, [x8, #0x7f8]
1000b4254:     	ldr	x8, [x8]
1000b4258:     	stur	x8, [x29, #-0x38]
1000b425c:     	cbz	x0, 0x1000b4268 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv+0x38>
1000b4260:     	ldr	x8, [x0, #0x88]
1000b4264:     	cbnz	x8, 0x1000b42a4 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv+0x74>
1000b4268:     	bl	0x10082cd6c <__Z18BLI_thread_is_mainv>
1000b426c:     	cmp	w0, #0x0
1000b4270:     	csel	x0, xzr, x19, eq
1000b4274:     	ldur	x8, [x29, #-0x38]
1000b4278:     	adrp	x9, 0x106369000 <_zlibVersion+0x106369000>
1000b427c:     	ldr	x9, [x9, #0x7f8]
1000b4280:     	ldr	x9, [x9]
1000b4284:     	cmp	x9, x8
1000b4288:     	b.ne	0x1000b43c0 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv+0x190>
1000b428c:     	add	sp, sp, #0x240
1000b4290:     	ldp	x29, x30, [sp, #0x30]
1000b4294:     	ldp	x20, x19, [sp, #0x20]
1000b4298:     	ldp	x22, x21, [sp, #0x10]
1000b429c:     	ldp	x28, x27, [sp], #0x40
1000b42a0:     	ret
1000b42a4:     	mov	x20, x2
1000b42a8:     	movi.16b	v0, #0x0
1000b42ac:     	stp	q0, q0, [sp, #0x50]
1000b42b0:     	add	x8, sp, #0x20


D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001000b44e8 <__Z20CTX_wm_region_view3dPK8bContext>:
1000b44e8:     	stp	x20, x19, [sp, #-0x20]!
1000b44ec:     	stp	x29, x30, [sp, #0x10]
1000b44f0:     	add	x29, sp, #0x10
1000b44f4:     	mov	x20, x0
1000b44f8:     	ldr	x3, [x0, #0x28]
1000b44fc:     	adrp	x1, 0x104b84000 <_zlibVersion+0x104b84000>
1000b4500:     	add	x1, x1, #0xec9
1000b4504:     	adrp	x2, 0x106a94000 <__ZL40rna_Screen_use_play_spreadsheet_editors_+0x28>
1000b4508:     	add	x2, x2, #0x2c0
1000b450c:     	bl	0x1000b4230 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv>
1000b4510:     	mov	x19, x0
1000b4514:     	ldr	x3, [x20, #0x30]
1000b4518:     	adrp	x1, 0x104b84000 <_zlibVersion+0x104b84000>
1000b451c:     	add	x1, x1, #0xece
1000b4520:     	adrp	x2, 0x106a95000 <__ZL11rna_Area_y_+0x178>
1000b4524:     	add	x2, x2, #0x8e0
1000b4528:     	mov	x0, x20
1000b452c:     	bl	0x1000b4230 <__ZL25ctx_wm_python_context_getPK8bContextPKcPK9StructRNAPv>
1000b4530:     	cbz	x19, 0x1000b454c <__Z20CTX_wm_region_view3dPK8bContext+0x64>
1000b4534:     	ldrb	w8, [x19, #0x48]
1000b4538:     	cmp	w8, #0x1
1000b453c:     	ccmp	x0, #0x0, #0x4, eq
1000b4540:     	b.eq	0x1000b454c <__Z20CTX_wm_region_view3dPK8bContext+0x64>
1000b4544:     	ldrh	w8, [x0, #0xc0]
1000b4548:     	cbz	w8, 0x1000b455c <__Z20CTX_wm_region_view3dPK8bContext+0x74>
1000b454c:     	mov	x0, #0x0                ; =0
1000b4550:     	ldp	x29, x30, [sp, #0x10]
1000b4554:     	ldp	x20, x19, [sp], #0x20
1000b4558:     	ret
1000b455c:     	ldr	x0, [x0, #0x120]
1000b4560:     	b	0x1000b4550 <__Z20CTX_wm_region_view3dPK8bContext+0x68>


D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b7de48 <__Z22WM_operatortype_appendPFvP14wmOperatorTypeE>:
100b7de48:     	stp	x22, x21, [sp, #-0x30]!
100b7de4c:     	stp	x20, x19, [sp, #0x10]
100b7de50:     	stp	x29, x30, [sp, #0x20]
100b7de54:     	add	x29, sp, #0x20
100b7de58:     	mov	x19, x0
100b7de5c:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b7de60:     	add	x8, x8, #0x760
100b7de64:     	ldr	x8, [x8]
100b7de68:     	adrp	x3, 0x104bdb000 <__ZL3hex+0xaa0d>
100b7de6c:     	add	x3, x3, #0x2b2
100b7de70:     	mov	w0, #0x1                ; =1
100b7de74:     	mov	w1, #0xf8               ; =248
100b7de78:     	mov	w2, #0x8                ; =8
100b7de7c:     	blr	x8
100b7de80:     	mov	x20, x0
100b7de84:     	adrp	x9, 0x10665c000 <__ZN7blender3seq23seqModifierType_TonemapE+0xc0>
100b7de88:     	ldr	x8, [x9, #0x328]
100b7de8c:     	cmn	x8, #0x1
100b7de90:     	b.eq	0x100b7dea0 <__Z22WM_operatortype_appendPFvP14wmOperatorTypeE+0x58>
100b7de94:     	add	x10, x8, #0x1
100b7de98:     	str	x10, [x9, #0x328]
100b7de9c:     	b	0x100b7dea4 <__Z22WM_operatortype_appendPFvP14wmOperatorTypeE+0x5c>
100b7dea0:     	mov	x8, #0x0                ; =0
100b7dea4:     	str	x8, [x20, #0xe8]
100b7dea8:     	adrp	x0, 0x10666f000 <__ZZN7blender5nodes32LazyFunctionForJoinReferenceSets10get_cachedEiRNS_13ResourceScopeEE16cached_functions+0xf18>
100b7deac:     	add	x0, x0, #0x2e8
100b7deb0:     	adrp	x1, 0x104b98000 <_zlibVersion+0x104b98000>
100b7deb4:     	add	x1, x1, #0xc54
100b7deb8:     	adrp	x2, 0x106bc2000 <__ZL26rna_Operator_modal_result_+0xc8>
100b7debc:     	add	x2, x2, #0x698
100b7dec0:     	bl	0x10126cafc <__Z18RNA_def_struct_ptrP10BlenderRNAPKcP9StructRNA>
100b7dec4:     	str	x0, [x20, #0x88]
100b7dec8:     	adrp	x1, 0x106450000 <_rna_enum_event_type_items+0x2110>
100b7decc:     	add	x1, x1, #0x7b8
100b7ded0:     	bl	0x101277c58 <__Z28RNA_def_struct_property_tagsP9StructRNAPK16EnumPropertyItem>
100b7ded4:     	ldr	x0, [x20, #0x88]
100b7ded8:     	adrp	x21, 0x104b84000 <_zlibVersion+0x104b84000>
100b7dedc:     	add	x21, x21, #0xcde
100b7dee0:     	mov	x1, x21
100b7dee4:     	bl	0x101277ff4 <__Z34RNA_def_struct_translation_contextP9StructRNAPKc>
100b7dee8:     	str	x21, [x20, #0x10]
100b7deec:     	mov	w8, #0x28               ; =40
100b7def0:     	str	w8, [x20, #0xe0]
100b7def4:     	mov	x0, x20
100b7def8:     	blr	x19
100b7defc:     	mov	x0, x20
100b7df00:     	ldp	x29, x30, [sp, #0x20]
100b7df04:     	ldp	x20, x19, [sp, #0x10]
100b7df08:     	ldp	x22, x21, [sp], #0x30
100b7df0c:     	b	0x100b7df10 <__ZL27wm_operatortype_append__endP14wmOperatorType>


D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b756f8 <__Z31WM_keymap_item_properties_resetP12wmKeyMapItemP10IDProperty>:
100b756f8:     	stp	x22, x21, [sp, #-0x30]!
100b756fc:     	stp	x20, x19, [sp, #0x10]
100b75700:     	stp	x29, x30, [sp, #0x20]
100b75704:     	add	x29, sp, #0x20
100b75708:     	mov	x21, x1
100b7570c:     	mov	x19, x0
100b75710:     	mov	x20, x0
100b75714:     	ldr	x0, [x20, #0xb0]!
100b75718:     	cbz	x0, 0x100b75790 <__Z31WM_keymap_item_properties_resetP12wmKeyMapItemP10IDProperty+0x98>
100b7571c:     	bl	0x100b8167c <__Z27WM_operator_properties_freeP10PointerRNA>
100b75720:     	ldr	x22, [x20]
100b75724:     	cbz	x22, 0x100b75754 <__Z31WM_keymap_item_properties_resetP12wmKeyMapItemP10IDProperty+0x5c>
100b75728:     	ldr	x0, [x22, #0x18]
100b7572c:     	add	x8, x22, #0x30
100b75730:     	cmp	x0, x8
100b75734:     	b.eq	0x100b7573c <__Z31WM_keymap_item_properties_resetP12wmKeyMapItemP10IDProperty+0x44>
100b75738:     	bl	0x100ae4298 <_MEM_freeN>
100b7573c:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b75740:     	add	x8, x8, #0x710
100b75744:     	ldr	x8, [x8]
100b75748:     	mov	x0, x22
100b7574c:     	mov	w1, #0x1                ; =1
100b75750:     	blr	x8
100b75754:     	str	xzr, [x20]
100b75758:     	str	x21, [x19, #0x50]!
100b7575c:     	sub	x2, x19, #0x40
100b75760:     	mov	x0, x20
100b75764:     	mov	x1, x19
100b75768:     	bl	0x100b82844 <__Z28WM_operator_properties_allocPP10PointerRNAPP10IDPropertyPKc>
100b7576c:     	ldr	x0, [x19, #0x60]
100b75770:     	mov	w1, #0x1                ; =1
100b75774:     	bl	0x100b82950 <__Z31WM_operator_properties_sanitizeP10PointerRNAb>
100b75778:     	ldr	x8, [x19, #0x60]
100b7577c:     	str	xzr, [x8]
100b75780:     	ldp	x29, x30, [sp, #0x20]
100b75784:     	ldp	x20, x19, [sp, #0x10]
100b75788:     	ldp	x22, x21, [sp], #0x30
100b7578c:     	ret
100b75790:     	ldr	x0, [x19, #0x50]
100b75794:     	cbz	x0, 0x100b75758 <__Z31WM_keymap_item_properties_resetP12wmKeyMapItemP10IDProperty+0x60>
100b75798:     	bl	0x1001f2354 <__Z16IDP_FreePropertyP10IDProperty>
100b7579c:     	b	0x100b75758 <__Z31WM_keymap_item_properties_resetP12wmKeyMapItemP10IDProperty+0x60>
100b757a0:     	bl	0x1000144bc <___clang_call_terminate>


D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b7632c <__Z16WM_keymap_ensureP11wmKeyConfigPKcii>:
100b7632c:     	stp	x24, x23, [sp, #-0x40]!
100b76330:     	stp	x22, x21, [sp, #0x10]
100b76334:     	stp	x20, x19, [sp, #0x20]
100b76338:     	stp	x29, x30, [sp, #0x30]
100b7633c:     	add	x29, sp, #0x30
100b76340:     	mov	x21, x3
100b76344:     	mov	x22, x2
100b76348:     	mov	x23, x1
100b7634c:     	mov	x19, x0
100b76350:     	ldr	x20, [x19, #0x90]!
100b76354:     	cbnz	x20, 0x100b763f8 <__Z16WM_keymap_ensureP11wmKeyConfigPKcii+0xcc>
100b76358:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b7635c:     	add	x8, x8, #0x760
100b76360:     	ldr	x8, [x8]
100b76364:     	adrp	x3, 0x104bd9000 <__ZL3hex+0x8a0d>
100b76368:     	add	x3, x3, #0xf02
100b7636c:     	mov	w0, #0x1                ; =1
100b76370:     	mov	w1, #0x110              ; =272
100b76374:     	mov	w2, #0x8                ; =8
100b76378:     	blr	x8
100b7637c:     	mov	x20, x0
100b76380:     	add	x0, x0, #0x30
100b76384:     	mov	x1, x23
100b76388:     	mov	w2, #0x40               ; =64
100b7638c:     	bl	0x100822e04 <__Z16BLI_strncpy_utf8PcPKcm>
100b76390:     	strh	w22, [x20, #0x70]
100b76394:     	strh	w21, [x20, #0x72]
100b76398:     	bl	0x101265104 <__Z26RNA_struct_state_owner_getv>
100b7639c:     	cbz	x0, 0x100b763b0 <__Z16WM_keymap_ensureP11wmKeyConfigPKcii+0x84>
100b763a0:     	mov	x1, x0
100b763a4:     	add	x0, x20, #0x74
100b763a8:     	mov	w2, #0x80               ; =128
100b763ac:     	bl	0x10081a008 <__Z11BLI_strncpyPcPKcm>
100b763b0:     	mov	x0, x19
100b763b4:     	mov	x1, x20
100b763b8:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b763bc:     	adrp	x8, 0x107ef7000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b763c0:     	ldrb	w9, [x8, #0x8eb]
100b763c4:     	orr	w9, w9, #0x1
100b763c8:     	strb	w9, [x8, #0x8eb]
100b763cc:     	ldrh	w8, [x20, #0xf4]
100b763d0:     	orr	w8, w8, #0x40
100b763d4:     	strh	w8, [x20, #0xf4]
100b763d8:     	mov	x0, x20
100b763dc:     	ldp	x29, x30, [sp, #0x30]
100b763e0:     	ldp	x20, x19, [sp, #0x20]
100b763e4:     	ldp	x22, x21, [sp, #0x10]
100b763e8:     	ldp	x24, x23, [sp], #0x40
100b763ec:     	ret
100b763f0:     	ldr	x20, [x20]
100b763f4:     	cbz	x20, 0x100b76358 <__Z16WM_keymap_ensureP11wmKeyConfigPKcii+0x2c>
100b763f8:     	ldrsh	w8, [x20, #0x70]
100b763fc:     	cmp	w8, w22
100b76400:     	b.ne	0x100b763f0 <__Z16WM_keymap_ensureP11wmKeyConfigPKcii+0xc4>
100b76404:     	ldrsh	w8, [x20, #0x72]
100b76408:     	cmp	w8, w21
100b7640c:     	b.ne	0x100b763f0 <__Z16WM_keymap_ensureP11wmKeyConfigPKcii+0xc4>
100b76410:     	add	x1, x20, #0x30
100b76414:     	mov	x0, x23
100b76418:     	mov	w2, #0x40               ; =64
100b7641c:     	bl	0x104b77814 <_zlibVersion+0x104b77814>
100b76420:     	cbnz	w0, 0x100b763f0 <__Z16WM_keymap_ensureP11wmKeyConfigPKcii+0xc4>
100b76424:     	b	0x100b763d8 <__Z16WM_keymap_ensureP11wmKeyConfigPKcii+0xac>


D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101c37f2c <__Z22knifetool_modal_keymapP11wmKeyConfig>:
101c37f2c:     	stp	x20, x19, [sp, #-0x20]!
101c37f30:     	stp	x29, x30, [sp, #0x10]
101c37f34:     	add	x29, sp, #0x10
101c37f38:     	mov	x19, x0
101c37f3c:     	adrp	x1, 0x104bd5000 <__ZL3hex+0x4a0d>
101c37f40:     	add	x1, x1, #0x81e
101c37f44:     	bl	0x100b76568 <__Z19WM_modalkeymap_findP11wmKeyConfigPKc>
101c37f48:     	cbz	x0, 0x101c37f5c <__Z22knifetool_modal_keymapP11wmKeyConfig+0x30>
101c37f4c:     	ldr	x8, [x0, #0x108]
101c37f50:     	cbz	x8, 0x101c37f5c <__Z22knifetool_modal_keymapP11wmKeyConfig+0x30>
101c37f54:     	mov	x19, #0x0               ; =0
101c37f58:     	b	0x101c37f84 <__Z22knifetool_modal_keymapP11wmKeyConfig+0x58>
101c37f5c:     	adrp	x1, 0x104bd5000 <__ZL3hex+0x4a0d>
101c37f60:     	add	x1, x1, #0x81e
101c37f64:     	adrp	x2, 0x106482000 <__ZZ22knifetool_modal_keymapP11wmKeyConfigE11modal_items>
101c37f68:     	add	x2, x2, #0x0
101c37f6c:     	mov	x0, x19
101c37f70:     	bl	0x100b764a0 <__Z21WM_modalkeymap_ensureP11wmKeyConfigPKcPK16EnumPropertyItem>
101c37f74:     	mov	x19, x0
101c37f78:     	adrp	x1, 0x104bd5000 <__ZL3hex+0x4a0d>
101c37f7c:     	add	x1, x1, #0x86c
101c37f80:     	bl	0x100b76868 <__Z21WM_modalkeymap_assignP8wmKeyMapPKc>
101c37f84:     	mov	x0, x19
101c37f88:     	ldp	x29, x30, [sp, #0x10]
101c37f8c:     	ldp	x20, x19, [sp], #0x20
101c37f90:     	ret


D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b51a94 <__Z41WM_event_ipad_pencil_paint_owner_teardownP8bContextP8wmWindowPK7ScrAreaPK7ARegionyyy>:
100b51d50:     	b.ne	0x100b51f18 <__Z41WM_event_ipad_pencil_paint_owner_teardownP8bContextP8wmWindowPK7ScrAreaPK7ARegionyyy+0x484>
100b51d54:     	ldr	x19, [x28, #0x60]
100b51d58:     	add	x1, x24, #0x118
100b51d5c:     	add	x3, sp, #0x30
100b51d60:     	mov	x0, x25
100b51d64:     	mov	x2, x28
100b51d68:     	mov	x4, #0x0                ; =0
100b51d6c:     	mov	x5, #0x0                ; =0
100b51d70:     	mov	w6, #0x1                ; =1
100b51d74:     	mov	w7, #0x0                ; =0
100b51d78:     	bl	0x100b524d0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb22eIPadNativePanDispatch>
100b51d7c:     	mov	x0, x25


D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b550cc <__Z20wm_event_do_handlersP8bContext>:
100b558a0:     	mov	x1, x28
100b558a4:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b558a8:     	add	x1, x21, #0x118
100b558ac:     	mov	x0, x19
100b558b0:     	mov	x2, x23
100b558b4:     	mov	x3, x26
100b558b8:     	mov	x4, #0x0                ; =0
100b558bc:     	mov	x5, #0x0                ; =0
100b558c0:     	mov	w6, #0x0                ; =0
100b558c4:     	mov	w7, #0x0                ; =0
100b558c8:     	bl	0x100b524d0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb22eIPadNativePanDispatch>
100b558cc:     	mov	x0, x19


D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\initial-pan-candidate\binary-41034735566\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b550cc <__Z20wm_event_do_handlersP8bContext>:
100b55a10:     	bl	0x100b571d4 <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion>
100b55a14:     	cbz	w0, 0x100b55a68 <__Z20wm_event_do_handlersP8bContext+0x99c>
100b55a18:     	ldr	x2, [sp, #0x50]
100b55a1c:     	add	x1, x21, #0x118
100b55a20:     	mov	x0, x19
100b55a24:     	mov	x3, x26
100b55a28:     	mov	x4, #0x0                ; =0
100b55a2c:     	mov	x5, #0x0                ; =0
100b55a30:     	mov	w6, #0x0                ; =0
100b55a34:     	mov	w7, #0x0                ; =0
100b55a38:     	bl	0x100b524d0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb22eIPadNativePanDispatch>
100b55a3c:     	b	0x100b55a68 <__Z20wm_event_do_handlersP8bContext+0x99c>
